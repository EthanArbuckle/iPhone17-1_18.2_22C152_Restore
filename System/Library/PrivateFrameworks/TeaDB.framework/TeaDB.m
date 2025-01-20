uint64_t sub_1A2CAEF50(char *a1, uint64_t a2, uint64_t a3, long long *a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  sub_1A2CAEFB8(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_1A2CAEFB8(char *a1, uint64_t a2, uint64_t a3, long long *a4)
{
  char v5 = *a1;
  *(void *)(v4 + 80) = MEMORY[0x1E4FBC860];
  *(unsigned char *)(v4 + 32) = v5;
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  sub_1A2CB377C(a4, v4 + 40);
  return v4;
}

void *sub_1A2CAEFF4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  type metadata accessor for Create();
  sub_1A2CB37E4(v0 + 16, (uint64_t)v6);
  sub_1A2CB37E4(v0 + 16, (uint64_t)v5);
  v1 = sub_1A2CAFB60(v5);
  return sub_1A2CBD344(v6, (uint64_t)v1, v2, v3);
}

uint64_t sub_1A2CAF090(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1A2CB377C(a1, v2 + 16);
  return v2;
}

uint64_t sub_1A2CAF0D4(char a1, uint64_t a2, uint64_t a3, long long *a4)
{
  *(unsigned char *)(v4 + 32) = a1;
  *(void *)(v4 + 80) = MEMORY[0x1E4FBC860];
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  sub_1A2CB377C(a4, v4 + 40);
  return v4;
}

void Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8_2(v4, v5, v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = OUTLINED_FUNCTION_21();
  MEMORY[0x1F4188790](v13 - 8);
  unint64_t v14 = OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_11_1(v14);
  uint64_t v35 = MEMORY[0x1E4FBC860];
  sub_1A2CB9304(&qword_1EB5A6908, MEMORY[0x1E4FBCC10]);
  v15 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCC10];
  sub_1A2CBB064(0, &qword_1EB5A68F0, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
  unsigned __int8 v17 = v16;
  sub_1A2CB9454((unint64_t *)&unk_1EB5A68F8, &qword_1EB5A68F0, v15);
  OUTLINED_FUNCTION_19_0();
  uint64_t v18 = OUTLINED_FUNCTION_25();
  v19(v18);
  *(void *)(v3 + 16) = OUTLINED_FUNCTION_9_1();
  if ((v34 & 2) != 0)
  {
    uint64_t v35 = v34;
    sub_1A2CB859C();
  }
  OUTLINED_FUNCTION_23();
  sub_1A2CF3980();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_1();
  int v20 = OUTLINED_FUNCTION_24();
  swift_endAccess();
  swift_release();
  if (v20)
  {
    if (sqlite3_errmsg(*v1))
    {
      uint64_t v21 = sub_1A2CF3A00();
      uint64_t v23 = v22;
      sub_1A2CCE7A8();
      OUTLINED_FUNCTION_12_1();
      *(void *)uint64_t v24 = v21;
      *(void *)(v24 + 8) = v23;
    }
    else
    {
      sub_1A2CCE7A8();
      OUTLINED_FUNCTION_12_1();
      OUTLINED_FUNCTION_31();
      *(void *)uint64_t v24 = v30;
      *(void *)(v24 + 8) = 0x80000001A2CF7930;
    }
    *(void *)(v24 + 16) = &qword_1EB5A68F0;
    *(void *)(v24 + 24) = v2;
    *(unsigned char *)(v24 + 32) = v17;
    swift_willThrow();
    if (*v1) {
      sqlite3_close(*v1);
    }
LABEL_19:
    swift_release();
    goto LABEL_20;
  }
  sub_1A2CBBD20((uint64_t)&qword_1EB5A68F0, v2, v17);
  v25 = *v1;
  if (!*v1) {
    goto LABEL_20;
  }
  type metadata accessor for Connection();
  uint64_t v26 = swift_allocObject();
  OUTLINED_FUNCTION_38(v26);
  void *v1 = v25;
  if ((*(void *)v33 & 0x100000000) == 0) {
    sqlite3_busy_timeout(v25, *(int *)v33);
  }
  OUTLINED_FUNCTION_22_0();
  v27 = v0;
  if (v0)
  {
    if ((v32 & 1) != 0
      && (id v28 = v0, sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950),
                                 (swift_dynamicCast() & 1) != 0))
    {
      if (v37 == 10)
      {
        sub_1A2CB1E90(v35, v36, 0xAu);
        if (qword_1EB5A61F0 != -1) {
          swift_once();
        }
        id v29 = (id)qword_1EB5A8268;
        sub_1A2CF3C10();
        sub_1A2CF3720();

        sub_1A2CCF564((uint64_t)v25);
        OUTLINED_FUNCTION_27();

        v27 = 0;
        goto LABEL_25;
      }
      swift_release();
      sub_1A2CB1E90(v35, v36, v37);
    }
    else
    {
      swift_release();
    }
    swift_willThrow();
    goto LABEL_20;
  }
LABEL_25:
  if ((v31 & 1) == 0)
  {
    OUTLINED_FUNCTION_30();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_1((uint64_t)"PRAGMA cache_size = ");
    sub_1A2CF4040();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_36();
    if (v27) {
      goto LABEL_19;
    }
  }
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_33();
  sub_1A2CF3EF0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_36();
  if (v27) {
    goto LABEL_19;
  }
LABEL_20:
  swift_release();
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_1A2CAF5FC(sqlite3 *a1)
{
  uint64_t v2 = sub_1A2CF3980();
  unsigned int v3 = sqlite3_exec(a1, (const char *)(v2 + 32), 0, 0, 0);
  swift_release();
  swift_bridgeObjectRetain();
  return sub_1A2CB1C50(v3, (uint64_t)a1, 0, 0, 29);
}

uint64_t sub_1A2CAF6B8(uint64_t a1, uint64_t (*a2)(void, void, uint64_t))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v17 = MEMORY[0x1E4FBC860];
    sub_1A2CAF900(0, v2, 0);
    uint64_t v6 = a1 + 48;
    do
    {
      uint64_t v7 = a2(*(void *)(v6 - 16), *(void *)(v6 - 8), v6);
      if (v7)
      {
        uint64_t v9 = v7;
        uint64_t v10 = v8;
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = v9;
        *(void *)(v11 + 24) = v10;
        uint64_t v12 = sub_1A2CDD1B8;
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v11 = 0;
      }
      uint64_t v3 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2CAF900(0, *(void *)(v17 + 16) + 1, 1);
        uint64_t v3 = v17;
      }
      unint64_t v14 = *(void *)(v3 + 16);
      unint64_t v13 = *(void *)(v3 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_1A2CAF900((char *)(v13 > 1), v14 + 1, 1);
        uint64_t v3 = v17;
      }
      *(void *)(v3 + 16) = v14 + 1;
      uint64_t v15 = v3 + 16 * v14;
      *(void *)(v15 + 32) = v12;
      *(void *)(v15 + 40) = v11;
      v6 += 56;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_1A2CAF814(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1A2CAF838(a1, a2, a3, *(void *)(v3 + 16), *(unsigned __int8 *)(v3 + 24), *(unsigned __int8 *)(v3 + 25));
}

uint64_t sub_1A2CAF838(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3[4] + 104))(a4 + 16, a5, a6);
}

uint64_t static Column.createTableChain(for:ifNotExists:shouldVersion:)()
{
  OUTLINED_FUNCTION_18_2();
  return v0();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return 0;
}

char *sub_1A2CAF900(char *a1, int64_t a2, char a3)
{
  result = sub_1A2CAF920(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_1A2CAF920(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2CB426C(0, (unint64_t *)&unk_1EB5A6940, (uint64_t (*)(uint64_t))sub_1A2CBA43C, MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2CB5770(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2CAFA30((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A2CAFA30(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    sub_1A2CB426C(0, (unint64_t *)&unk_1EB5A6970, (uint64_t (*)(uint64_t))sub_1A2CB7B68, MEMORY[0x1E4FBB718]);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_1A2CAFB60(long long *a1)
{
  sub_1A2CB37E4((uint64_t)a1, (uint64_t)v6);
  sub_1A2CAFCC4(0, &qword_1EB5A67C8, (uint64_t (*)(void))sub_1A2CAFD2C, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Create);
  int64_t v2 = (void *)swift_allocObject();
  sub_1A2CB377C(v6, (uint64_t)(v2 + 2));
  v2[8] = 0;
  v2[9] = 0;
  v2[7] = 0;
  sub_1A2CB37E4((uint64_t)a1, (uint64_t)v6);
  sub_1A2CAFCC4(0, qword_1EB5A6528, (uint64_t (*)(void))sub_1A2CBBB7C, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Save);
  uint64_t v3 = swift_allocObject();
  sub_1A2CB377C(v6, v3 + 16);
  sub_1A2CAFCC4(0, qword_1EB5A65B0, (uint64_t (*)(void))sub_1A2CAFD2C, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Query);
  uint64_t v4 = swift_allocObject();
  sub_1A2CB377C(a1, v4 + 16);
  return v2;
}

void sub_1A2CAFCC4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

unint64_t sub_1A2CAFD2C()
{
  unint64_t result = qword_1EB5A67F8[0];
  if (!qword_1EB5A67F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB5A67F8);
  }
  return result;
}

uint64_t sub_1A2CAFD78()
{
  uint64_t v0 = sub_1A2CB489C();
  uint64_t result = sub_1A2CB2F04((uint64_t)v0, v1);
  uint64_t v3 = result;
  unint64_t v4 = 0;
  unint64_t v5 = *(void *)(result + 16);
  uint64_t v46 = result + 32;
  uint64_t v6 = MEMORY[0x1E4FBC860];
  while (1)
  {
    if (v4 == v5)
    {
      uint64_t v51 = 0;
      long long v49 = 0u;
      long long v50 = 0u;
      unint64_t v4 = v5;
      long long v48 = 0u;
      goto LABEL_6;
    }
    if (v4 >= *(void *)(v3 + 16)) {
      break;
    }
    sub_1A2CB4000(v46 + 56 * v4++, (uint64_t)&v48);
LABEL_6:
    sub_1A2CB31C4((uint64_t)&v48, (uint64_t)&v52, (unint64_t *)&qword_1EB5A68A0, (uint64_t (*)(uint64_t))sub_1A2CB4064);
    uint64_t v7 = v53;
    if (!v53)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return v6;
    }
    uint64_t v8 = v52;
    sub_1A2CB377C(&v54, (uint64_t)&v48);
    sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
    uint64_t v10 = v9;
    unint64_t v12 = *(void *)(v9 + 16);
    unint64_t v11 = *(void *)(v9 + 24);
    if (v12 >= v11 >> 1)
    {
      sub_1A2CB5734(v11 > 1, v12 + 1, 1, v9);
      uint64_t v10 = v40;
    }
    *(void *)(v10 + 16) = v12 + 1;
    uint64_t v13 = v10 + 16 * v12;
    *(void *)(v13 + 32) = v8;
    *(void *)(v13 + 40) = v7;
    uint64_t v14 = *((void *)&v49 + 1);
    uint64_t v15 = v50;
    __swift_project_boxed_opaque_existential_1(&v48, *((uint64_t *)&v49 + 1));
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v15 + 8))(&v47, v14, v15);
    unint64_t v16 = 0xE400000000000000;
    uint64_t v17 = 1415071060;
    switch((char)v47)
    {
      case 1:
        unint64_t v16 = 0xE700000000000000;
        uint64_t v17 = 0x52454745544E49;
        break;
      case 2:
        unint64_t v16 = 0xE700000000000000;
        uint64_t v17 = 0x4E41454C4F4F42;
        break;
      case 3:
        unint64_t v16 = 0xE600000000000000;
        uint64_t v17 = 0x454C42554F44;
        break;
      case 4:
        uint64_t v17 = 1112493122;
        break;
      default:
        break;
    }
    unint64_t v19 = *(void *)(v10 + 16);
    unint64_t v18 = *(void *)(v10 + 24);
    if (v19 >= v18 >> 1)
    {
      sub_1A2CB5734(v18 > 1, v19 + 1, 1, v10);
      uint64_t v10 = v41;
    }
    *(void *)(v10 + 16) = v19 + 1;
    uint64_t v20 = v10 + 16 * v19;
    *(void *)(v20 + 32) = v17;
    *(void *)(v20 + 40) = v16;
    uint64_t v21 = *((void *)&v49 + 1);
    uint64_t v22 = v50;
    __swift_project_boxed_opaque_existential_1(&v48, *((uint64_t *)&v49 + 1));
    char v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 72))(v21, v22);
    unint64_t v25 = *(void *)(v10 + 16);
    unint64_t v24 = *(void *)(v10 + 24);
    if (v23) {
      uint64_t v26 = 0x4C4C554E20544F4ELL;
    }
    else {
      uint64_t v26 = 1280070990;
    }
    if (v23) {
      unint64_t v27 = 0xE800000000000000;
    }
    else {
      unint64_t v27 = 0xE400000000000000;
    }
    if (v25 >= v24 >> 1)
    {
      sub_1A2CB5734(v24 > 1, v25 + 1, 1, v10);
      uint64_t v10 = v42;
    }
    *(void *)(v10 + 16) = v25 + 1;
    uint64_t v28 = v10 + 16 * v25;
    *(void *)(v28 + 32) = v26;
    *(void *)(v28 + 40) = v27;
    uint64_t v29 = *((void *)&v49 + 1);
    uint64_t v30 = v50;
    __swift_project_boxed_opaque_existential_1(&v48, *((uint64_t *)&v49 + 1));
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v30 + 56))(v29, v30))
    {
      unint64_t v32 = *(void *)(v10 + 16);
      unint64_t v31 = *(void *)(v10 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_1A2CB5734(v31 > 1, v32 + 1, 1, v10);
        uint64_t v10 = v45;
      }
      *(void *)(v10 + 16) = v32 + 1;
      uint64_t v33 = v10 + 16 * v32;
      *(void *)(v33 + 32) = 0x455551494E55;
      *(void *)(v33 + 40) = 0xE600000000000000;
    }
    uint64_t v47 = v10;
    sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
    sub_1A2CB0330();
    uint64_t v34 = sub_1A2CF3900();
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1A2CB5734(0, *(void *)(v6 + 16) + 1, 1, v6);
      uint64_t v6 = v43;
    }
    unint64_t v38 = *(void *)(v6 + 16);
    unint64_t v37 = *(void *)(v6 + 24);
    if (v38 >= v37 >> 1)
    {
      sub_1A2CB5734(v37 > 1, v38 + 1, 1, v6);
      uint64_t v6 = v44;
    }
    *(void *)(v6 + 16) = v38 + 1;
    uint64_t v39 = v6 + 16 * v38;
    *(void *)(v39 + 32) = v34;
    *(void *)(v39 + 40) = v36;
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
  }
  __break(1u);
  return result;
}

BOOL sub_1A2CB01BC()
{
  return sub_1A2CB01E4();
}

BOOL sub_1A2CB01E4()
{
  return dynamic_cast_existential_1_conditional(*(void *)(*(void *)v0 + 80)) == 0;
}

uint64_t sub_1A2CB0224()
{
  return sub_1A2CB024C() & 1;
}

uint64_t sub_1A2CB024C()
{
  return OUTLINED_FUNCTION_14_1(*(void *)(*(void *)v0 + 128));
}

void sub_1A2CB0264(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x1E4FBB1A0]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1A2CB02B4()
{
  sub_1A2CB0380();
  sub_1A2CB0330();
  uint64_t v1 = sub_1A2CF3900();
  swift_bridgeObjectRetain();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1A2CB0330()
{
  unint64_t result = qword_1EB5A68E8;
  if (!qword_1EB5A68E8)
  {
    sub_1A2CB0380();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A68E8);
  }
  return result;
}

void sub_1A2CB0380()
{
  if (!qword_1EB5A68E0)
  {
    unint64_t v0 = sub_1A2CF3B50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A68E0);
    }
  }
}

uint64_t sub_1A2CB03CC(char a1)
{
  int64_t v2 = sub_1A2CB489C();
  uint64_t result = sub_1A2CB2F04((uint64_t)v2, v3);
  uint64_t v5 = result;
  unint64_t v6 = 0;
  unint64_t v7 = *(void *)(result + 16);
  uint64_t v18 = result + 32;
  uint64_t v8 = MEMORY[0x1E4FBC860];
  char v17 = a1 & 1;
  while (1)
  {
    if (v6 == v7)
    {
      uint64_t v23 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      unint64_t v6 = v7;
      long long v20 = 0u;
      goto LABEL_6;
    }
    if (v6 >= *(void *)(v5 + 16)) {
      break;
    }
    sub_1A2CB4000(v18 + 56 * v6++, (uint64_t)&v20);
LABEL_6:
    sub_1A2CB31C4((uint64_t)&v20, (uint64_t)&v24, (unint64_t *)&qword_1EB5A68A0, (uint64_t (*)(uint64_t))sub_1A2CB4064);
    uint64_t v9 = v25;
    if (!v25)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return v8;
    }
    uint64_t v10 = v24;
    sub_1A2CB377C(v26, (uint64_t)&v20);
    uint64_t v11 = *((void *)&v21 + 1);
    uint64_t v12 = v22;
    __swift_project_boxed_opaque_existential_1(&v20, *((uint64_t *)&v21 + 1));
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 48))(v11, v12))
    {
      sub_1A2CB37E4((uint64_t)&v20, (uint64_t)v19);
      uint64_t v13 = sub_1A2CEF5B4(v10, v9, v19, v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2CDC9A8();
        uint64_t v8 = v15;
      }
      unint64_t v14 = *(void *)(v8 + 16);
      if (v14 >= *(void *)(v8 + 24) >> 1)
      {
        sub_1A2CDC9A8();
        uint64_t v8 = v16;
      }
      *(void *)(v8 + 16) = v14 + 1;
      *(void *)(v8 + 8 * v14 + 32) = v13;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2CB05C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1;
  uint64_t v19 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t IndexCommand = type metadata accessor for CreateIndexCommand();
  uint64_t v32 = sub_1A2CF3830();
  uint64_t v21 = a3;
  (*(void (**)(uint64_t, void))(*(void *)(a3 + 24) + 8))(a2, *(void *)(a3 + 24));
  uint64_t v23 = a2;
  uint64_t v18 = v7;
  uint64_t result = sub_1A2CB32CC(a2);
  uint64_t v9 = result;
  unint64_t v10 = 0;
  unint64_t v11 = *(void *)(result + 16);
  uint64_t v22 = result + 32;
  char v12 = v5 & 1;
  while (1)
  {
    if (v10 == v11)
    {
      uint64_t v28 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      unint64_t v10 = v11;
      long long v25 = 0u;
      goto LABEL_6;
    }
    if (v10 >= *(void *)(v9 + 16)) {
      break;
    }
    sub_1A2CB4000(v22 + 56 * v10++, (uint64_t)&v25);
LABEL_6:
    sub_1A2CB0848((uint64_t)&v25, (uint64_t)&v29);
    uint64_t v13 = v30;
    if (!v30)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v23);
      return v32;
    }
    uint64_t v14 = v29;
    sub_1A2CB377C(&v31, (uint64_t)&v25);
    uint64_t v16 = *((void *)&v26 + 1);
    uint64_t v15 = v27;
    __swift_project_boxed_opaque_existential_1(&v25, *((uint64_t *)&v26 + 1));
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v15 + 48))(v16, v15))
    {
      sub_1A2CB37E4((uint64_t)&v25, (uint64_t)v24);
      v24[0] = sub_1A2CDBC54(v14, v13, v24, v12, v23, v21);
      sub_1A2CF3B50();
      sub_1A2CF3B20();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2CB0848(uint64_t a1, uint64_t a2)
{
  sub_1A2CB08AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A2CB08AC()
{
  if (!qword_1EB5A68A0)
  {
    sub_1A2CB4064();
    unint64_t v0 = sub_1A2CF3D40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A68A0);
    }
  }
}

uint64_t sub_1A2CB0904()
{
  return sub_1A2CB092C() & 1;
}

uint64_t sub_1A2CB092C()
{
  return OUTLINED_FUNCTION_14_1(*(void *)(*(void *)v0 + 120));
}

uint64_t sub_1A2CB0944()
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_19();
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4)
  {
LABEL_6:
    uint64_t v8 = OUTLINED_FUNCTION_5_13();
    v9(v8);
    unsigned int v10 = *(unsigned __int8 *)(v0 + 32);
    if (v10 >= 4)
    {
      if (v10 == 4 && (v63[0] & 8) != 0) {
        goto LABEL_13;
      }
    }
    else if ((v63[0] & 0x10) != 0)
    {
LABEL_13:
      v59[0] = (id)v63[0];
      sub_1A2CB859C();
    }
    uint64_t v12 = OUTLINED_FUNCTION_4_14();
    v13(v12);
    if (v1) {
      return swift_release();
    }
    if (v10 == 4)
    {
      OUTLINED_FUNCTION_6_12(1);
      uint64_t v14 = 0;
      v66 = &v60;
      uint64_t v51 = MEMORY[0x1E4FBC860];
LABEL_19:
      uint64_t v50 = v14;
      uint64_t v15 = sub_1A2CB489C();
      uint64_t v48 = v16;
      long long v49 = v15;
      uint64_t v17 = sub_1A2CB2F04((uint64_t)v15, v16);
      unint64_t v18 = 0;
      uint64_t v19 = *(char **)(v17 + 16);
      uint64_t v52 = v17 + 32;
      uint64_t v53 = v17;
      while (1)
      {
        if ((char *)v18 == v19)
        {
          long long v61 = 0u;
          long long v62 = 0u;
          long long v20 = v19;
          *(_OWORD *)v59 = 0u;
          long long v60 = 0u;
        }
        else
        {
          if (v18 >= *(void *)(v53 + 16)) {
            goto LABEL_36;
          }
          long long v20 = (char *)(v18 + 1);
          sub_1A2CB4000(v52 + 56 * v18, (uint64_t)v58);
          v59[0] = (id)v18;
          OUTLINED_FUNCTION_15_3(v58[0], v58[1]);
        }
        sub_1A2CB31C4((uint64_t)v59, (uint64_t)v63, (unint64_t *)&qword_1EB5A6198, (uint64_t (*)(uint64_t))sub_1A2CBAE48);
        if (!v64)
        {
          swift_bridgeObjectRelease();
          swift_retain();
          swift_retain();
          if (swift_isUniquelyReferenced_nonNull_native())
          {
            uint64_t v34 = v50;
            uint64_t v33 = v51;
          }
          else
          {
            char v38 = OUTLINED_FUNCTION_9_7();
            sub_1A2CBA564(v38, v39, v40, v41);
            uint64_t v33 = v42;
            uint64_t v34 = v50;
          }
          unint64_t v36 = *(void *)(v33 + 16);
          unint64_t v35 = *(void *)(v33 + 24);
          if (v36 >= v35 >> 1)
          {
            char v43 = OUTLINED_FUNCTION_22_1(v35);
            sub_1A2CBA564(v43, v44, v45, v46);
            uint64_t v33 = v47;
          }
          *(void *)(v33 + 16) = v36 + 1;
          uint64_t v51 = v33;
          uint64_t v37 = v33 + 16 * v36;
          *(void *)(v37 + 32) = v49;
          *(void *)(v37 + 40) = v48;
          swift_release();
          swift_release();
          sub_1A2CB1B3C(1, 0, 29);
          uint64_t v14 = v34;
          goto LABEL_19;
        }
        unint64_t v54 = (unint64_t)v20;
        uint64_t v21 = v63[0];
        v59[0] = (id)v63[1];
        v59[1] = v64;
        uint64_t v22 = v66;
        sub_1A2CB377C(&v65, (uint64_t)v66);
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1(v22, *((uint64_t *)&v61 + 1));
        uint64_t v24 = *((void *)&v61 + 1);
        uint64_t v23 = v62;
        __swift_project_boxed_opaque_existential_1(v22, *((uint64_t *)&v61 + 1));
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v23 + 8))(v55, v24, v23);
        if (v21 < (uint64_t)0xFFFFFFFF80000000) {
          break;
        }
        if (v21 > 0x7FFFFFFF) {
          goto LABEL_35;
        }
        uint64_t v25 = *((void *)&v61 + 1);
        uint64_t v26 = v62;
        long long v27 = v66;
        __swift_project_boxed_opaque_existential_1(v66, *((uint64_t *)&v61 + 1));
        char v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 64))(v25, v26);
        sub_1A2CB1A04(v21, (unsigned __int8 *)v55, v28 & 1, (uint64_t)&v57);
        uint64_t v29 = v57;
        unint64_t v30 = v58[0].n128_u64[0];
        char v31 = v58[0].n128_i8[8];
        v55[0] = v57;
        v55[1] = v58[0].n128_u64[0];
        unsigned __int8 v56 = v58[0].n128_u8[8];
        OUTLINED_FUNCTION_19_3();
        v32();
        sub_1A2CB2E8C(v29, v30, v31);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
        unint64_t v18 = v54;
      }
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      swift_release();
      swift_release();
      return v51;
    }
    else
    {
      OUTLINED_FUNCTION_6_12(2);
      sub_1A2CB1BB0();
      swift_release();
      swift_release();
      return MEMORY[0x1E4FBC860];
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = v3 + 40;
  while (1)
  {
    uint64_t v6 = *(void (**)(uint64_t))(v5 - 8);
    uint64_t v7 = swift_retain();
    uint64_t v1 = v2;
    v6(v7);
    if (v2) {
      break;
    }
    swift_release();
    v5 += 16;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  swift_release();
  return swift_bridgeObjectRelease();
}

void *sub_1A2CB0EB0(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = *v1;
  uint64_t v54 = *(void *)(*v1 + 80);
  unint64_t v6 = *(void *)(v54 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](a1);
  uint64_t v53 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  unsigned int v10 = (char *)&v47 - v9;
  swift_beginAccess();
  uint64_t v11 = v4[10];
  uint64_t v12 = *(void *)(v11 + 16);
  unint64_t v64 = v6;
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = v11 + 40;
    while (1)
    {
      uint64_t v14 = *(void (**)(uint64_t))(v13 - 8);
      uint64_t v15 = swift_retain();
      v14(v15);
      if (v2) {
        break;
      }
      swift_release();
      v13 += 16;
      if (!--v12)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return (void *)v5;
  }
LABEL_6:
  uint64_t v16 = v4[8];
  uint64_t v17 = v4[9];
  __swift_project_boxed_opaque_existential_1(v4 + 5, v16);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v17 + 8))(&v75, v16, v17);
  unsigned int v18 = *((unsigned __int8 *)v4 + 32);
  if (v18 >= 4)
  {
    if (v18 == 4 && (v75 & 8) != 0) {
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v55 = 0;
    goto LABEL_14;
  }
  if ((v75 & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_13:
  *(void *)&long long v71 = v75;
  uint64_t v55 = sub_1A2CB859C();
LABEL_14:
  uint64_t v19 = v4[8];
  uint64_t v20 = v4[9];
  __swift_project_boxed_opaque_existential_1(v4 + 5, v19);
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 16))(v4[2], v4[3], v19, v20);
  if (v2)
  {
LABEL_17:
    swift_release();
    return (void *)v5;
  }
  uint64_t v22 = v21;
  if (v18 != 4)
  {
    sub_1A2CB1B3C(2, 0, 29);
    uint64_t v5 = sub_1A2CF3B00();
LABEL_19:
    sub_1A2CB1BB0();
    swift_release();
    swift_release();
    return (void *)v5;
  }
  long long v61 = v4 + 5;
  uint64_t v24 = v54;
  uint64_t v78 = sub_1A2CF3830();
  sub_1A2CB1B3C(1, 0, 29);
  uint64_t v62 = v22;
  uint64_t v52 = *(void *)(v5 + 88);
  uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
  uint64_t v51 = v52 + 8;
  uint64_t v57 = &v69;
  unsigned __int8 v56 = (long long *)((char *)&v71 + 8);
  long long v60 = (long long *)&v77;
  long long v65 = &v72;
  uint64_t v48 = (void (**)(char *, char *, uint64_t))(v64 + 16);
  uint64_t v47 = (void (**)(char *, uint64_t))(v64 + 8);
  uint64_t v5 = v24;
  long long v49 = v10;
LABEL_21:
  v63 = v3;
  v50(v5, v52);
  uint64_t result = (void *)sub_1A2CB32CC(v5);
  unint64_t v25 = 0;
  unint64_t v26 = result[2];
  v59 = result;
  v58 = result + 4;
  while (1)
  {
    if (v25 == v26)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      unint64_t v27 = v26;
      long long v71 = 0u;
      long long v72 = 0u;
    }
    else
    {
      if (v25 >= v59[2]) {
        goto LABEL_42;
      }
      uint64_t v28 = (uint64_t)v57;
      sub_1A2CB4000((uint64_t)&v58[7 * v25], (uint64_t)v57);
      *(void *)&long long v71 = v25;
      long long v29 = *(_OWORD *)(v28 + 16);
      unint64_t v30 = v56;
      *unsigned __int8 v56 = *(_OWORD *)v28;
      v30[1] = v29;
      v30[2] = *(_OWORD *)(v28 + 32);
      *((void *)v30 + 6) = *(void *)(v28 + 48);
      unint64_t v27 = v25 + 1;
    }
    char v31 = v63;
    sub_1A2CB168C((uint64_t)&v71, (uint64_t)&v75);
    if (!*((void *)&v76 + 1))
    {
      swift_bridgeObjectRelease();
      uint64_t v44 = v49;
      uint64_t v5 = v54;
      (*v48)(v53, v49, v54);
      sub_1A2CF3B50();
      sub_1A2CF3B20();
      (*v47)(v44, v5);
      sub_1A2CB1B3C(1, 0, 29);
      uint64_t v3 = v31;
      if (!v31) {
        goto LABEL_21;
      }
      *(void *)&long long v71 = v31;
      id v45 = v31;
      sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
      if (swift_dynamicCast())
      {
        BOOL v46 = BYTE8(v76) == 29 && v75 == 2;
        if (v46 && !(void)v76)
        {

          uint64_t v5 = v78;
          goto LABEL_19;
        }
        sub_1A2CB1E90(v75, v76, BYTE8(v76));
      }
      swift_bridgeObjectRelease();

      swift_willThrow();
      sub_1A2CB1BB0();
      swift_release();
      goto LABEL_17;
    }
    unint64_t v64 = v27;
    uint64_t v32 = v75;
    long long v71 = v76;
    uint64_t v33 = v65;
    sub_1A2CB377C(v60, (uint64_t)v65);
    swift_bridgeObjectRelease();
    uint64_t v35 = *((void *)&v73 + 1);
    uint64_t v34 = v74;
    __swift_project_boxed_opaque_existential_1(v33, *((uint64_t *)&v73 + 1));
    uint64_t v37 = *((void *)&v73 + 1);
    uint64_t v36 = v74;
    __swift_project_boxed_opaque_existential_1(v33, *((uint64_t *)&v73 + 1));
    uint64_t result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v36 + 8))(v66, v37, v36);
    if (v32 < (uint64_t)0xFFFFFFFF80000000) {
      break;
    }
    if (v32 > 0x7FFFFFFF) {
      goto LABEL_41;
    }
    uint64_t v38 = *((void *)&v73 + 1);
    uint64_t v39 = v74;
    char v40 = v65;
    __swift_project_boxed_opaque_existential_1(v65, *((uint64_t *)&v73 + 1));
    char v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 64))(v38, v39);
    sub_1A2CB1A04(v32, (unsigned __int8 *)v66, v41 & 1, (uint64_t)&v68);
    uint64_t v42 = v68;
    unint64_t v43 = v69;
    LOBYTE(v39) = v70;
    v66[0] = v68;
    v66[1] = v69;
    char v67 = v70;
    (*(void (**)(void *, uint64_t *, uint64_t, uint64_t))(v34 + 80))(v66, v61, v35, v34);
    sub_1A2CB2E8C(v42, v43, v39);
    uint64_t result = (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    unint64_t v25 = v64;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void sub_1A2CB165C(unsigned char *a1@<X8>)
{
}

void Column.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t sub_1A2CB168C(uint64_t a1, uint64_t a2)
{
  sub_1A2CB16F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A2CB16F0()
{
  if (!qword_1EB5A6198)
  {
    sub_1A2CBAE48();
    unint64_t v0 = sub_1A2CF3D40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A6198);
    }
  }
}

void sub_1A2CB1748()
{
}

void sub_1A2CB176C()
{
  OUTLINED_FUNCTION_11_4();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_1_6();
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 80);
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790]();
  uint64_t v9 = &v18[-v8];
  int v10 = *(unsigned __int8 *)(v3 + 16);
  if (v10 == 255)
  {
    uint64_t v16 = &v18[-v8];
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v12 = *(void *)v3;
    unint64_t v11 = *(void *)(v3 + 8);
    if (v10 == 5 && (v11 | v12) == 0)
    {
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v7);
      sub_1A2CB18DC(0, 0, 5);
      sub_1A2CB18DC(0, 0, 5);
      goto LABEL_9;
    }
    v19[0] = v12;
    v19[1] = v11;
    char v20 = v10;
    sub_1A2CB37E4(v1, (uint64_t)v18);
    uint64_t v14 = *(void *)(v5 + 88);
    uint64_t v15 = *(void (**)(void *, unsigned char *, uint64_t, uint64_t))(v14 + 48);
    sub_1A2CB18DC(v12, v11, v10);
    v15(v19, v18, v7, v14);
    uint64_t v16 = v9;
    uint64_t v17 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v16, v17, 1, v7);
LABEL_9:
  sub_1A2CB18FC((uint64_t)v9);
  OUTLINED_FUNCTION_12_3();
}

uint64_t sub_1A2CB18DC(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 4) {
    return sub_1A2CBF7CC(result, a2);
  }
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1A2CB18FC(uint64_t a1)
{
  OUTLINED_FUNCTION_6_8();
  uint64_t v4 = v1 + *(void *)(v3 + 104);
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_6_8();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v4, a1);
  return swift_endAccess();
}

BOOL sub_1A2CB199C()
{
  return sub_1A2CB19C4();
}

BOOL sub_1A2CB19C4()
{
  return dynamic_cast_existential_1_conditional(*(void *)(*(void *)v0 + 80)) != 0;
}

void sub_1A2CB1A04(int iCol@<W1>, unsigned __int8 *a2@<X0>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a2;
  if ((a3 & 1) != 0 && sqlite3_column_type(*(sqlite3_stmt **)(v4 + 24), iCol) == 5)
  {
LABEL_3:
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    char v8 = 5;
LABEL_14:
    *(unsigned char *)(a4 + 16) = v8;
  }
  else
  {
    switch(v7)
    {
      case 1:
        *(void *)a4 = sqlite3_column_int64(*(sqlite3_stmt **)(v4 + 24), iCol);
        *(void *)(a4 + 8) = 0;
        char v8 = 1;
        goto LABEL_14;
      case 2:
        *(void *)a4 = sqlite3_column_int64(*(sqlite3_stmt **)(v4 + 24), iCol) == 1;
        *(void *)(a4 + 8) = 0;
        char v8 = 2;
        goto LABEL_14;
      case 3:
        *(double *)a4 = sqlite3_column_double(*(sqlite3_stmt **)(v4 + 24), iCol);
        *(void *)(a4 + 8) = 0;
        char v8 = 3;
        goto LABEL_14;
      case 4:
        int v10 = *(sqlite3_stmt **)(v4 + 24);
        unint64_t v11 = sqlite3_column_blob(v10, iCol);
        if (v11)
        {
          uint64_t v12 = v11;
          int v13 = sqlite3_column_bytes(v10, iCol);
          *(void *)a4 = MEMORY[0x1A623E890](v12, v13);
          *(void *)(a4 + 8) = v14;
        }
        else
        {
          *(_OWORD *)a4 = xmmword_1A2CF7230;
        }
        char v8 = 4;
        goto LABEL_14;
      default:
        if (!sqlite3_column_text(*(sqlite3_stmt **)(v4 + 24), iCol)) {
          goto LABEL_3;
        }
        *(void *)a4 = sub_1A2CF3A10();
        *(void *)(a4 + 8) = v9;
        *(unsigned char *)(a4 + 16) = 0;
        break;
    }
  }
}

uint64_t sub_1A2CB1B3C(uint64_t a1, uint64_t a2, char a3)
{
  unsigned int v7 = sqlite3_step(*(sqlite3_stmt **)(v3 + 24));
  uint64_t v8 = *(void *)(v3 + 16);
  swift_retain();
  return sub_1A2CB1EA8(v7, v8, a1, a2, a3);
}

uint64_t sub_1A2CB1BB0()
{
  unsigned int v1 = sqlite3_finalize(*(sqlite3_stmt **)(v0 + 24));
  unint64_t v2 = sub_1A2CB20C8(v1);
  uint64_t v4 = v3;
  unsigned __int8 v6 = v5;
  if (sub_1A2CB2720(v2, v3, v5, 0, 0, 29)) {
    return sub_1A2CB1E90(v2, v4, v6);
  }
  sub_1A2CB2C84();
  swift_allocError();
  *(void *)uint64_t v8 = v2;
  *(void *)(v8 + 8) = v4;
  *(unsigned char *)(v8 + 16) = v6;
  return swift_willThrow();
}

uint64_t sub_1A2CB1C50(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v8 = sub_1A2CB20C8(a1);
  uint64_t v10 = v9;
  unsigned __int8 v12 = v11;
  if (sub_1A2CB2720(v8, v9, v11, a3, a4, a5))
  {
    sub_1A2CB1E90(v8, v10, v12);
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (v12 != 29 || __PAIR128__(v10, v8) >= 3)
    {
      if (qword_1EB5A61F0 != -1) {
        swift_once();
      }
      id v19 = (id)qword_1EB5A8268;
      sub_1A2CF3C00();
      sub_1A2CC845C();
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1A2CF4990;
      sub_1A2CF3EF0();
      *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v15 = sub_1A2CC84C4();
      *(void *)(v14 + 64) = v15;
      *(void *)(v14 + 32) = 0;
      *(void *)(v14 + 40) = 0xE000000000000000;
      uint64_t v20 = sub_1A2CF4070();
      uint64_t v21 = v16;
      sub_1A2CF39F0();
      sub_1A2CF39F0();
      sub_1A2CF39F0();
      *(void *)(v14 + 96) = MEMORY[0x1E4FBB1A0];
      *(void *)(v14 + 104) = v15;
      *(void *)(v14 + 72) = v20;
      *(void *)(v14 + 80) = v21;
      sub_1A2CF3720();

      swift_bridgeObjectRelease();
    }
    sub_1A2CB2C84();
    uint64_t v17 = swift_allocError();
    OUTLINED_FUNCTION_3_16(v17, v18);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1A2CB1E90(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0x1Cu) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CB1EA8(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v8 = sub_1A2CB20C8(a1);
  uint64_t v10 = v9;
  unsigned __int8 v12 = v11;
  if (sub_1A2CB2720(v8, v9, v11, a3, a4, a5))
  {
    sub_1A2CB1E90(v8, v10, v12);
  }
  else
  {
    if (v12 != 29 || __PAIR128__(v10, v8) >= 3)
    {
      if (qword_1EB5A61F0 != -1) {
        swift_once();
      }
      id v13 = (id)qword_1EB5A8268;
      sub_1A2CF3C00();
      sub_1A2CC845C();
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_1A2CF4990;
      sub_1A2CF3EF0();
      *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v15 = sub_1A2CC84C4();
      *(void *)(v14 + 64) = v15;
      *(void *)(v14 + 32) = 0;
      *(void *)(v14 + 40) = 0xE000000000000000;
      uint64_t v20 = sub_1A2CF4070();
      uint64_t v21 = v16;
      sub_1A2CF39F0();
      sub_1A2CF39F0();
      sub_1A2CF39F0();
      *(void *)(v14 + 96) = MEMORY[0x1E4FBB1A0];
      *(void *)(v14 + 104) = v15;
      *(void *)(v14 + 72) = v20;
      *(void *)(v14 + 80) = v21;
      sub_1A2CF3720();

      swift_bridgeObjectRelease();
    }
    sub_1A2CB2C84();
    uint64_t v17 = swift_allocError();
    OUTLINED_FUNCTION_3_16(v17, v18);
  }
  return swift_release();
}

unint64_t sub_1A2CB20C8(unsigned int a1)
{
  unint64_t v1 = a1;
  switch(a1)
  {
    case 0u:
      return v1;
    case 1u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v2 && sqlite3_errmsg(v2))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 2u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v3 && sqlite3_errmsg(v3))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 3u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v4 && sqlite3_errmsg(v4))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 4u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v5 && sqlite3_errmsg(v5))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 5u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v6 && sqlite3_errmsg(v6))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 6u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v7 && sqlite3_errmsg(v7))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 7u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v8 && sqlite3_errmsg(v8))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 8u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v9 && sqlite3_errmsg(v9))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 9u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v10 && sqlite3_errmsg(v10))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0xAu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v11 && sqlite3_errmsg(v11))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0xBu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v12 && sqlite3_errmsg(v12))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0xCu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v13 && sqlite3_errmsg(v13))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0xDu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v14 && sqlite3_errmsg(v14))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0xEu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v15 && sqlite3_errmsg(v15))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0xFu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v16 && sqlite3_errmsg(v16))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x10u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v17 && sqlite3_errmsg(v17))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x11u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v18 && sqlite3_errmsg(v18))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x12u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v19 && sqlite3_errmsg(v19))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x13u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v20 && sqlite3_errmsg(v20))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x14u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v21 && sqlite3_errmsg(v21))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x15u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v22 && sqlite3_errmsg(v22))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x16u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v23 && sqlite3_errmsg(v23))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x17u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v24 && sqlite3_errmsg(v24))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x18u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v25 && sqlite3_errmsg(v25))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x19u:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v26 && sqlite3_errmsg(v26))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x1Au:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v27 && sqlite3_errmsg(v27))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x1Bu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v28 && sqlite3_errmsg(v28))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    case 0x1Cu:
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_0_14();
      if (v29 && sqlite3_errmsg(v29))
      {
        sub_1A2CF3A00();
        OUTLINED_FUNCTION_2_13();
      }
      break;
    default:
      if (a1 == 100)
      {
        unint64_t v1 = 1;
      }
      else if (a1 == 101)
      {
        unint64_t v1 = 2;
      }
      else
      {
        sub_1A2CF3DD0();
        swift_bridgeObjectRelease();
        sub_1A2CF4040();
        sub_1A2CF39F0();
        swift_bridgeObjectRelease();
        unint64_t v1 = 0xD00000000000001ALL;
      }
      break;
  }
  return v1;
}

uint64_t sub_1A2CB2720(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      if (a6 == 1) {
        goto LABEL_67;
      }
      return 0;
    case 2:
      if (a6 != 2) {
        return 0;
      }
      goto LABEL_67;
    case 3:
      if (a6 != 3) {
        return 0;
      }
      goto LABEL_67;
    case 4:
      if (a6 != 4) {
        return 0;
      }
      goto LABEL_67;
    case 5:
      if (a6 != 5) {
        return 0;
      }
      goto LABEL_67;
    case 6:
      if (a6 != 6) {
        return 0;
      }
      goto LABEL_67;
    case 7:
      if (a6 != 7) {
        return 0;
      }
      goto LABEL_67;
    case 8:
      if (a6 != 8) {
        return 0;
      }
      goto LABEL_67;
    case 9:
      if (a6 != 9) {
        return 0;
      }
      goto LABEL_67;
    case 10:
      if (a6 != 10) {
        return 0;
      }
      goto LABEL_67;
    case 11:
      if (a6 != 11) {
        return 0;
      }
      goto LABEL_67;
    case 12:
      if (a6 != 12) {
        return 0;
      }
      goto LABEL_67;
    case 13:
      if (a6 != 13) {
        return 0;
      }
      goto LABEL_67;
    case 14:
      if (a6 != 14) {
        return 0;
      }
      goto LABEL_67;
    case 15:
      if (a6 != 15) {
        return 0;
      }
      goto LABEL_67;
    case 16:
      if (a6 != 16) {
        return 0;
      }
      goto LABEL_67;
    case 17:
      if (a6 != 17) {
        return 0;
      }
      goto LABEL_67;
    case 18:
      if (a6 != 18) {
        return 0;
      }
      goto LABEL_67;
    case 19:
      if (a6 != 19) {
        return 0;
      }
      goto LABEL_67;
    case 20:
      if (a6 != 20) {
        return 0;
      }
      goto LABEL_67;
    case 21:
      if (a6 != 21) {
        return 0;
      }
      goto LABEL_67;
    case 22:
      if (a6 != 22) {
        return 0;
      }
      goto LABEL_67;
    case 23:
      if (a6 != 23) {
        return 0;
      }
      goto LABEL_67;
    case 24:
      if (a6 != 24) {
        return 0;
      }
      goto LABEL_67;
    case 25:
      if (a6 != 25) {
        return 0;
      }
      goto LABEL_67;
    case 26:
      if (a6 == 26) {
        goto LABEL_67;
      }
      return 0;
    case 27:
      if (a6 != 27) {
        return 0;
      }
      goto LABEL_67;
    case 28:
      if (a6 != 28) {
        return 0;
      }
      goto LABEL_67;
    case 29:
      if (a1 | a2)
      {
        if (a1 ^ 1 | a2)
        {
          if (a6 != 29 || a4 != 2) {
            return 0;
          }
        }
        else if (a6 != 29 || a4 != 1)
        {
          return 0;
        }
        if (!a5) {
          return 1;
        }
      }
      else if (a6 == 29 && !(a5 | a4))
      {
        return 1;
      }
      return 0;
    default:
      if (a6) {
        return 0;
      }
LABEL_67:
      if (a1 == a4 && a2 == a5) {
        return 1;
      }
      return sub_1A2CF4080();
  }
}

uint64_t sub_1A2CB298C(uint64_t a1, uint64_t a2)
{
  return sub_1A2CB29B0(a1, a2);
}

uint64_t sub_1A2CB29B0(uint64_t a1, uint64_t a2)
{
  v9[1] = *(sqlite3_stmt **)MEMORY[0x1E4F143B8];
  v9[0] = 0;
  unsigned __int8 v6 = *(sqlite3 **)(v2 + 24);
  uint64_t result = sub_1A2CB2A8C(v6, a1, a2, v9);
  if (v3) {
    return (uint64_t)v3;
  }
  unint64_t v8 = v9[0];
  if (v9[0])
  {
    type metadata accessor for PreparedStatement();
    swift_allocObject();
    uint64_t v3 = sub_1A2CB2B78((uint64_t)v8, (uint64_t)v6, a1, a2);
    swift_bridgeObjectRetain();
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A2CB2A8C(sqlite3 *a1, uint64_t a2, uint64_t a3, sqlite3_stmt **a4)
{
  uint64_t v6 = sub_1A2CF3980();
  LODWORD(a4) = sqlite3_prepare_v2(a1, (const char *)(v6 + 32), -1, a4, 0);
  swift_release();
  swift_bridgeObjectRetain();
  return sub_1A2CB1C50(a4, (uint64_t)a1, 0, 0, 29);
}

uint64_t type metadata accessor for PreparedStatement()
{
  return self;
}

void *sub_1A2CB2B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a2;
  v4[3] = a1;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

void sub_1A2CB2B88(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 16);
}

uint64_t sub_1A2CB2B98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = String.init(valueType:connection:)(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t String.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t result = sub_1A2CF3F30();
    __break(1u);
  }
  else
  {
    uint64_t v3 = sub_1A2CF3A70();
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v3;
  }
  return result;
}

unint64_t sub_1A2CB2C84()
{
  unint64_t result = qword_1EB5A67D0;
  if (!qword_1EB5A67D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A67D0);
  }
  return result;
}

uint64_t JSON.init(valueType:connection:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  char v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v9 + 16) == 4)
  {
    uint64_t v12 = *(void *)v9;
    unint64_t v13 = *(void *)(v9 + 8);
    sub_1A2CF3610();
    swift_allocObject();
    sub_1A2CBF7CC(v12, v13);
    sub_1A2CF3600();
    sub_1A2CF35F0();
    swift_release();
    sub_1A2CB2E8C(v12, v13, 4);
    sub_1A2CB2E8C(v12, v13, 4);
    __swift_destroy_boxed_opaque_existential_1(a1);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v11, a2);
  }
  else
  {
    sub_1A2CF3F30();
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CB2E8C(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 4) {
    return sub_1A2CB2EAC(result, a2);
  }
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CB2EAC(uint64_t a1, unint64_t a2)
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

uint64_t sub_1A2CB2F04(uint64_t a1, uint64_t a2)
{
  v4[3] = &type metadata for Versions.Entity;
  v4[4] = &off_1EF5E0FF0;
  v4[0] = a1;
  v4[1] = a2;
  __swift_project_boxed_opaque_existential_1(v4, (uint64_t)&type metadata for Versions.Entity);
  type metadata accessor for FastEntity();
  swift_initStackObject();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v2 = *(void *)(sub_1A2CB3008() + 16);
  swift_bridgeObjectRetain();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2;
}

uint64_t destroy for Versions.Entity()
{
  swift_release();
  return swift_release();
}

uint64_t sub_1A2CB3008()
{
  sub_1A2CB3244(0, (unint64_t *)&qword_1EB5A6928, (uint64_t (*)(uint64_t))sub_1A2CB4064, MEMORY[0x1E4FBBE00]);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1A2CF4990;
  *(void *)(v1 + 32) = sub_1A2CB30CC((void *)(v1 + 48));
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 88) = sub_1A2CB30CC((void *)(v1 + 104));
  *(void *)(v1 + 96) = v3;
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t sub_1A2CB30CC(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 32);
  sub_1A2CB3174(0, qword_1EB5A6740, MEMORY[0x1E4FBB1A0], (uint64_t)&protocol witness table for String, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Column);
  a1[3] = v5;
  a1[4] = &off_1EF5E0730;
  *a1 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return v3;
}

void sub_1A2CB3174(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_1A2CB31C4(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_1A2CB3244(0, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  return a2;
}

void sub_1A2CB3244(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t type metadata accessor for FastEntity()
{
  return self;
}

uint64_t sub_1A2CB32CC(uint64_t a1)
{
  uint64_t v2 = sub_1A2CF4170();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  MEMORY[0x1F4188790](v11);
  uint64_t v12 = *(void (**)(void))(v9 + 16);
  OUTLINED_FUNCTION_2_12();
  v12();
  sub_1A2CB3794(0, &qword_1EB5A69F8);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_1_18();
    uint64_t v13 = OUTLINED_FUNCTION_3_15();
    uint64_t v15 = *(void *)(v14(v13) + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
    return v15;
  }
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  sub_1A2CB3AF8((uint64_t)&v37, &qword_1EB5A6A00, &qword_1EB5A69F8);
  OUTLINED_FUNCTION_2_12();
  v12();
  sub_1A2CB3794(0, &qword_1EB5A69D0);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_1_18();
    uint64_t v16 = OUTLINED_FUNCTION_3_15();
    uint64_t v15 = v17(v16);
    goto LABEL_5;
  }
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  sub_1A2CB3AF8((uint64_t)&v37, &qword_1EB5A69D8, &qword_1EB5A69D0);
  *((void *)&v31 + 1) = a1;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v30);
  OUTLINED_FUNCTION_2_12();
  v12();
  sub_1A2CF4150();
  sub_1A2CF4160();
  sub_1A2CF3EE0();
  swift_release();
  swift_retain();
  sub_1A2CF3F60();
  sub_1A2CB3848((uint64_t)&v30, (uint64_t)&v37);
  uint64_t v29 = v2;
  uint64_t v28 = v4;
  if (v40)
  {
    uint64_t v18 = MEMORY[0x1E4FBC860];
    while (1)
    {
      long long v19 = v37;
      sub_1A2CB3960(&v38, v36);
      if (*((void *)&v19 + 1))
      {
        sub_1A2CB3904((uint64_t)v36, (uint64_t)v34);
        sub_1A2CB3794(0, qword_1EB5A62A0);
        if ((swift_dynamicCast() & 1) == 0)
        {
          *(void *)&long long v32 = 0;
          long long v31 = 0u;
          long long v30 = 0u;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
          sub_1A2CB3AF8((uint64_t)&v30, (unint64_t *)&qword_1E959F330, qword_1EB5A62A0);
          goto LABEL_17;
        }
        sub_1A2CB377C(&v30, (uint64_t)v35);
        long long v30 = v19;
        sub_1A2CB37E4((uint64_t)v35, (uint64_t)&v31);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A2CB3970();
          uint64_t v18 = v25;
        }
        unint64_t v20 = *(void *)(v18 + 16);
        if (v20 >= *(void *)(v18 + 24) >> 1)
        {
          sub_1A2CB3970();
          uint64_t v18 = v26;
        }
        *(void *)(v18 + 16) = v20 + 1;
        uint64_t v21 = v18 + 56 * v20;
        long long v22 = v30;
        long long v23 = v31;
        long long v24 = v32;
        *(void *)(v21 + 80) = v33;
        *(_OWORD *)(v21 + 48) = v23;
        *(_OWORD *)(v21 + 64) = v24;
        *(_OWORD *)(v21 + 32) = v22;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
LABEL_17:
      sub_1A2CF3F60();
      sub_1A2CB3848((uint64_t)&v30, (uint64_t)&v37);
      if (!v40) {
        goto LABEL_20;
      }
    }
  }
  uint64_t v18 = MEMORY[0x1E4FBC860];
LABEL_20:
  swift_release_n();
  uint64_t v15 = sub_1A2CB3E68(v18);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
  return v15;
}

uint64_t sub_1A2CB377C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1A2CB3794(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1A2CB37E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A2CB3848(uint64_t a1, uint64_t a2)
{
  sub_1A2CB38AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A2CB38AC()
{
  if (!qword_1EB5A68B0)
  {
    sub_1A2CBAF00();
    unint64_t v0 = sub_1A2CF3D40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A68B0);
    }
  }
}

uint64_t sub_1A2CB3904(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1A2CB3960(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1A2CB3970()
{
  OUTLINED_FUNCTION_9_4();
  if (v3)
  {
    OUTLINED_FUNCTION_4_9();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_7_8();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_9();
    }
  }
  OUTLINED_FUNCTION_5_10();
  if (v2)
  {
    sub_1A2CB3A44(0, &qword_1EB5A6938, (void (*)(uint64_t))sub_1A2CB3F98);
    uint64_t v6 = (const void *)swift_allocObject();
    OUTLINED_FUNCTION_12_4(v6);
    *(void *)(v2 + 16) = v1;
    *(void *)(v2 + 24) = 2 * (v7 / 56);
  }
  if (v0)
  {
    uint64_t v8 = (char *)OUTLINED_FUNCTION_10_5();
    sub_1A2CB3A98(v8, v9, v10);
    OUTLINED_FUNCTION_8_7();
  }
  else
  {
    uint64_t v11 = OUTLINED_FUNCTION_6_9();
    sub_1A2CB3BAC(v11, v12, v13, v14);
  }
}

void sub_1A2CB3A44(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A2CF4050();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

char *sub_1A2CB3A98(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_8();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_9();
    __break(1u);
  }
  else if (a3 != result || &result[56 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_5(a3, result);
  }
  return result;
}

uint64_t sub_1A2CB3AF8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1A2CB3B54(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1A2CB3B54(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1A2CB3794(255, a3);
    unint64_t v4 = sub_1A2CF3D40();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1A2CB3BAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      sub_1A2CB3F98();
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1A2CF3F50();
  __break(1u);
  return result;
}

uint64_t sub_1A2CB3CCC(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = MEMORY[0x1E4FBC860];
  uint64_t v19 = MEMORY[0x1E4FBC860];
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    unint64_t v4 = 0;
    uint64_t v5 = result + 32;
    while (v4 < *(void *)(v1 + 16))
    {
      sub_1A2CB4000(v5, (uint64_t)&v15);
      uint64_t v6 = *((void *)&v17 + 1);
      uint64_t v7 = v18;
      __swift_project_boxed_opaque_existential_1(&v16, *((uint64_t *)&v17 + 1));
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 40))(v6, v7))
      {
        long long v11 = v15;
        long long v12 = v16;
        long long v13 = v17;
        uint64_t v14 = v18;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0) {
          uint64_t result = (uint64_t)sub_1A2CB4134(0, *(void *)(v2 + 16) + 1, 1);
        }
        uint64_t v2 = v19;
        unint64_t v9 = *(void *)(v19 + 16);
        unint64_t v8 = *(void *)(v19 + 24);
        if (v9 >= v8 >> 1)
        {
          uint64_t result = (uint64_t)sub_1A2CB4134((char *)(v8 > 1), v9 + 1, 1);
          uint64_t v2 = v19;
        }
        *(void *)(v2 + 16) = v9 + 1;
        uint64_t v10 = v2 + 56 * v9;
        *(_OWORD *)(v10 + 32) = v11;
        *(_OWORD *)(v10 + 48) = v12;
        *(_OWORD *)(v10 + 64) = v13;
        *(void *)(v10 + 80) = v14;
      }
      else
      {
        uint64_t result = sub_1A2CB4414((uint64_t)&v15, (uint64_t (*)(void))sub_1A2CB4064);
      }
      ++v4;
      v5 += 56;
      if (v3 == v4) {
        goto LABEL_12;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_12:
    swift_bridgeObjectRelease();
    return v2;
  }
  return result;
}

uint64_t sub_1A2CB3E68(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v17 = MEMORY[0x1E4FBC860];
    sub_1A2CB4134(0, v1, 0);
    uint64_t v4 = a1 + 32;
    do
    {
      sub_1A2CB40D0(v4, (uint64_t)v12);
      sub_1A2CB3F98();
      sub_1A2CB4064();
      swift_dynamicCast();
      uint64_t v2 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2CB4134(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v17;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1A2CB4134((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v17;
      }
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = v2 + 56 * v6;
      long long v8 = v13;
      long long v9 = v14;
      long long v10 = v15;
      *(void *)(v7 + 80) = v16;
      *(_OWORD *)(v7 + 48) = v9;
      *(_OWORD *)(v7 + 64) = v10;
      *(_OWORD *)(v7 + 32) = v8;
      v4 += 56;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_1A2CB3F98()
{
  if (!qword_1EB5A68C0)
  {
    sub_1A2CBF110();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EB5A68C0);
    }
  }
}

uint64_t sub_1A2CB4000(uint64_t a1, uint64_t a2)
{
  sub_1A2CB4064();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1A2CB4064()
{
  if (!qword_1EB5A6898)
  {
    sub_1A2CBF110();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EB5A6898);
    }
  }
}

uint64_t sub_1A2CB40D0(uint64_t a1, uint64_t a2)
{
  sub_1A2CB3F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_1A2CB4134(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2CB4154(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_1A2CB4154(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2CB426C(0, (unint64_t *)&qword_1EB5A6928, (uint64_t (*)(uint64_t))sub_1A2CB4064, MEMORY[0x1E4FBBE00]);
    long long v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    long long v10 = (char *)MEMORY[0x1E4FBC860];
  }
  long long v12 = v10 + 32;
  long long v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2CDCE74(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2CB42D0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_1A2CB426C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1A2CB42D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 56 * a2 > a1 ? (BOOL v3 = a1 + 56 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    sub_1A2CB4064();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1A2CB43D4()
{
  return sub_1A2CB43FC() & 1;
}

uint64_t sub_1A2CB43FC()
{
  return OUTLINED_FUNCTION_14_1(*(void *)(*(void *)v0 + 112));
}

uint64_t sub_1A2CB4414(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *Column.init(primaryKey:index:unique:default:onUpdate:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = v5;
  uint64_t v10 = *v5;
  uint64_t v11 = *(void *)(*v5 + 80);
  (*(void (**)(uint64_t, void))(*(void *)(v10 + 88) + 32))(v11, *(void *)(v10 + 88));
  __swift_storeEnumTagSinglePayload((uint64_t)v6 + *(void *)(*v6 + 104), 1, 1, v11);
  OUTLINED_FUNCTION_5_8();
  uint64_t v13 = *(void *)(v12 + 112);
  *((unsigned char *)v6 + v13) = 0;
  OUTLINED_FUNCTION_5_8();
  uint64_t v15 = *(void *)(v14 + 120);
  *((unsigned char *)v6 + v15) = 0;
  OUTLINED_FUNCTION_5_8();
  uint64_t v17 = *(void *)(v16 + 128);
  *((unsigned char *)v6 + v17) = 0;
  OUTLINED_FUNCTION_5_8();
  uint64_t v19 = (uint64_t)v6 + *(void *)(v18 + 136);
  uint64_t v20 = type metadata accessor for Column.Func();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  OUTLINED_FUNCTION_5_8();
  uint64_t v22 = (uint64_t)v6 + *(void *)(v21 + 144);
  __swift_storeEnumTagSinglePayload(v22, 1, 1, v20);
  *((unsigned char *)v6 + v13) = a1;
  *((unsigned char *)v6 + v15) = a2;
  *((unsigned char *)v6 + v17) = a3;
  OUTLINED_FUNCTION_16_2();
  uint64_t v23 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 40);
  v25(v19, a4, v23);
  swift_endAccess();
  OUTLINED_FUNCTION_16_2();
  v25(v22, a5, v23);
  swift_endAccess();
  return v6;
}

void static String.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void sub_1A2CB467C(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  size_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
  char v9 = 8 * v8;
  BOOL v10 = a3 >= v7;
  int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 >= a2)
  {
    switch(v12)
    {
      case 1:
        a1[v8] = 0;
        if (a2) {
          goto LABEL_21;
        }
        break;
      case 2:
        *(_WORD *)&a1[v8] = 0;
        if (a2) {
          goto LABEL_21;
        }
        break;
      case 3:
LABEL_34:
        __break(1u);
        break;
      case 4:
        *(_DWORD *)&a1[v8] = 0;
        goto LABEL_20;
      default:
LABEL_20:
        if (a2)
        {
LABEL_21:
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
        break;
    }
  }
  else
  {
    unsigned int v13 = ~v7 + a2;
    if (v8 < 4)
    {
      int v14 = (v13 >> v9) + 1;
      if (v8)
      {
        int v16 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v8] = v14;
        break;
      case 2:
        *(_WORD *)&a1[v8] = v14;
        break;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v14;
        break;
      default:
        return;
    }
  }
}

void static JSON.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

void static Date.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void *sub_1A2CB489C()
{
  sub_1A2CB497C(0, qword_1EB5A6740, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for Column);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_0_9();
  sub_1A2CB497C(0, &qword_1EB5A6298, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for FastColumn);
  uint64_t v0 = (void *)OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_6(v0);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_0_9();
  uint64_t v2 = v1;
  uint64_t v3 = OUTLINED_FUNCTION_14();
  uint64_t v4 = OUTLINED_FUNCTION_1_14(v3);
  *(void *)(v4 + 24) = v5;
  *(void *)(v4 + 32) = v2;
  return v0;
}

void sub_1A2CB497C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void, _UNKNOWN **))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x1E4FBB1A0], &protocol witness table for String);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1A2CB49D8()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_4();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  OUTLINED_FUNCTION_1_15(v1, v2, v3);
  uint64_t v4 = OUTLINED_FUNCTION_12_6();
  sub_1A2CB4A2C(v4, v5, v6);
  OUTLINED_FUNCTION_19_2();
  uint64_t v7 = OUTLINED_FUNCTION_10_7();
  sub_1A2CB4A2C(v7, v8, v9);
  OUTLINED_FUNCTION_16();
}

uint64_t sub_1A2CB4A2C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_1A2CD5FBC(result, a2, a3 & 1);
  }
  return result;
}

uint64_t Column.__deallocating_deinit()
{
  Column.deinit();
  return swift_deallocClassInstance();
}

uint64_t FastColumn.__deallocating_deinit()
{
  FastColumn.deinit();
  OUTLINED_FUNCTION_3_12();
  return swift_deallocClassInstance();
}

uint64_t FastColumn.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1A2CB4AF0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x1E4FBC860];
    sub_1A2CB4BC8(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        sub_1A2CB4BC8((char *)(v7 > 1), v8 + 1, 1);
      }
      v4 += 7;
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v6;
      *(void *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

char *sub_1A2CB4BC8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2CB4BE8(a1, a2, a3, *v3);
  *char v3 = (uint64_t)result;
  return result;
}

char *sub_1A2CB4BE8(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2CB4E08(0, (unint64_t *)&qword_1EB5A6930, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    BOOL v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    BOOL v10 = (char *)MEMORY[0x1E4FBC860];
  }
  int v12 = v10 + 32;
  unsigned int v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2CB5770(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2CB4F7C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A2CB4CEC(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  a2(0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = MEMORY[0x1E4FBC868];
  *a3 = result;
  return result;
}

void sub_1A2CB4D38(uint64_t a1, unint64_t *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, void))
{
  if (!*a2)
  {
    a4(255, a3, MEMORY[0x1E4FBAEA0]);
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v5 = sub_1A2CF3E10();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1A2CB4DBC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1A2CB4E08(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1A2CB4E54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x1E4FBB1A0]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_1A2CB4ECC()
{
  OUTLINED_FUNCTION_24_1();
  if (v6)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = v5;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v4 > *(void *)(v1 + 24) >> 1)
  {
    if (v3 <= v4) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = v3;
    }
    OUTLINED_FUNCTION_2_14(isUniquelyReferenced_nonNull_native, v9);
    uint64_t v1 = v10;
  }
  if (!*(void *)(v7 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_21_1();
  if (v11 != v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v12 = OUTLINED_FUNCTION_20_1();
  sub_1A2CB4F7C(v12, v13, v14);
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  uint64_t v15 = *(void *)(v1 + 16);
  BOOL v6 = __OFADD__(v15, v2);
  uint64_t v16 = v15 + v2;
  if (!v6)
  {
    *(void *)(v1 + 16) = v16;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_1A2CB4F7C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_0_7();
    uint64_t result = sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t type metadata accessor for Column()
{
  return __swift_instantiateGenericMetadata();
}

void sub_1A2CB5060(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    size_t v4 = 16;
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

uint64_t type metadata accessor for JSON()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CB5150(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  size_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, void))(*(void *)(v5 + 24) + 8))(v6, *(void *)(v5 + 24));
  uint64_t v54 = a2;
  uint64_t v52 = v4;
  uint64_t result = sub_1A2CB32CC(a2);
  uint64_t v8 = result;
  unint64_t v9 = 0;
  unint64_t v10 = *(void *)(result + 16);
  uint64_t v55 = result + 32;
  uint64_t v11 = MEMORY[0x1E4FBC860];
  while (1)
  {
    if (v9 == v10)
    {
      uint64_t v60 = 0;
      long long v58 = 0u;
      long long v59 = 0u;
      unint64_t v9 = v10;
      long long v57 = 0u;
      goto LABEL_6;
    }
    if (v9 >= *(void *)(v8 + 16)) {
      break;
    }
    sub_1A2CB4000(v55 + 56 * v9++, (uint64_t)&v57);
LABEL_6:
    sub_1A2CB0848((uint64_t)&v57, (uint64_t)&v61);
    uint64_t v12 = v62;
    if (!v62)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
      return v11;
    }
    uint64_t v13 = v61;
    sub_1A2CB377C(v63, (uint64_t)&v57);
    sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
    uint64_t v15 = v14;
    unint64_t v17 = *(void *)(v14 + 16);
    unint64_t v16 = *(void *)(v14 + 24);
    if (v17 >= v16 >> 1)
    {
      sub_1A2CB5734(v16 > 1, v17 + 1, 1, v14);
      uint64_t v15 = v45;
    }
    *(void *)(v15 + 16) = v17 + 1;
    uint64_t v18 = v15 + 16 * v17;
    *(void *)(v18 + 32) = v13;
    *(void *)(v18 + 40) = v12;
    uint64_t v19 = *((void *)&v58 + 1);
    uint64_t v20 = v59;
    __swift_project_boxed_opaque_existential_1(&v57, *((uint64_t *)&v58 + 1));
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v20 + 8))(&v56, v19, v20);
    unint64_t v21 = 0xE400000000000000;
    uint64_t v22 = 1415071060;
    switch((char)v56)
    {
      case 1:
        unint64_t v21 = 0xE700000000000000;
        uint64_t v22 = 0x52454745544E49;
        break;
      case 2:
        unint64_t v21 = 0xE700000000000000;
        uint64_t v22 = 0x4E41454C4F4F42;
        break;
      case 3:
        unint64_t v21 = 0xE600000000000000;
        uint64_t v22 = 0x454C42554F44;
        break;
      case 4:
        uint64_t v22 = 1112493122;
        break;
      default:
        break;
    }
    unint64_t v24 = *(void *)(v15 + 16);
    unint64_t v23 = *(void *)(v15 + 24);
    if (v24 >= v23 >> 1)
    {
      sub_1A2CB5734(v23 > 1, v24 + 1, 1, v15);
      uint64_t v15 = v46;
    }
    *(void *)(v15 + 16) = v24 + 1;
    uint64_t v25 = v15 + 16 * v24;
    *(void *)(v25 + 32) = v22;
    *(void *)(v25 + 40) = v21;
    uint64_t v26 = *((void *)&v58 + 1);
    uint64_t v27 = v59;
    __swift_project_boxed_opaque_existential_1(&v57, *((uint64_t *)&v58 + 1));
    char v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 72))(v26, v27);
    unint64_t v30 = *(void *)(v15 + 16);
    unint64_t v29 = *(void *)(v15 + 24);
    if (v28) {
      uint64_t v31 = 0x4C4C554E20544F4ELL;
    }
    else {
      uint64_t v31 = 1280070990;
    }
    if (v28) {
      unint64_t v32 = 0xE800000000000000;
    }
    else {
      unint64_t v32 = 0xE400000000000000;
    }
    if (v30 >= v29 >> 1)
    {
      sub_1A2CB5734(v29 > 1, v30 + 1, 1, v15);
      uint64_t v15 = v47;
    }
    *(void *)(v15 + 16) = v30 + 1;
    uint64_t v33 = v15 + 16 * v30;
    *(void *)(v33 + 32) = v31;
    *(void *)(v33 + 40) = v32;
    uint64_t v34 = *((void *)&v58 + 1);
    uint64_t v35 = v59;
    __swift_project_boxed_opaque_existential_1(&v57, *((uint64_t *)&v58 + 1));
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 56))(v34, v35))
    {
      unint64_t v37 = *(void *)(v15 + 16);
      unint64_t v36 = *(void *)(v15 + 24);
      if (v37 >= v36 >> 1)
      {
        sub_1A2CB5734(v36 > 1, v37 + 1, 1, v15);
        uint64_t v15 = v50;
      }
      *(void *)(v15 + 16) = v37 + 1;
      uint64_t v38 = v15 + 16 * v37;
      *(void *)(v38 + 32) = 0x455551494E55;
      *(void *)(v38 + 40) = 0xE600000000000000;
    }
    uint64_t v56 = v15;
    sub_1A2CB0380();
    sub_1A2CB0330();
    uint64_t v39 = sub_1A2CF3900();
    uint64_t v41 = v40;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1A2CB5734(0, *(void *)(v11 + 16) + 1, 1, v11);
      uint64_t v11 = v48;
    }
    unint64_t v43 = *(void *)(v11 + 16);
    unint64_t v42 = *(void *)(v11 + 24);
    if (v43 >= v42 >> 1)
    {
      sub_1A2CB5734(v42 > 1, v43 + 1, 1, v11);
      uint64_t v11 = v49;
    }
    *(void *)(v11 + 16) = v43 + 1;
    uint64_t v44 = v11 + 16 * v43;
    *(void *)(v44 + 32) = v39;
    *(void *)(v44 + 40) = v41;
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
  }
  __break(1u);
  return result;
}

void sub_1A2CB5604(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, uint64_t a6, void (*a7)(void, uint64_t, void *, uint64_t), void (*a8)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    OUTLINED_FUNCTION_4_9();
    if (v13 != v14)
    {
      OUTLINED_FUNCTION_7_8();
      if (v13)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_9();
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v15 = *(void *)(a4 + 16);
  if (v12 <= v15) {
    uint64_t v16 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v16 = v12;
  }
  if (v16)
  {
    sub_1A2CB56EC(0, a5);
    unint64_t v17 = (void *)OUTLINED_FUNCTION_13_2();
    size_t v18 = _swift_stdlib_malloc_size(v17);
    v17[2] = v15;
    v17[3] = 2 * ((uint64_t)(v18 - 32) / 16);
  }
  else
  {
    unint64_t v17 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v19 = v17 + 4;
  if (a1)
  {
    a8(a4 + 32, v15, v19);
    OUTLINED_FUNCTION_8_7();
  }
  else
  {
    a7(0, v15, v19, a4);
  }
}

void sub_1A2CB56EC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1A2CF4050();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_1A2CB5734(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

char *sub_1A2CB5770(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_8();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_9();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_5(a3, result);
  }
  return result;
}

uint64_t Column.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 136);
  type metadata accessor for Column.Func();
  uint64_t v4 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v3, v4);
  v6(v0 + *(void *)(*(void *)v0 + 144), v4);
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  return EntityType.init(valueType:connection:)(v3, v2, v1, a1, v4);
}

void OUTLINED_FUNCTION_1_3()
{
  Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
}

uint64_t OUTLINED_FUNCTION_1_4(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  return sub_1A2CB37E4(v1, a1 + 32);
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return sub_1A2CF3F50();
}

void OUTLINED_FUNCTION_1_10(unint64_t a1@<X8>)
{
  sub_1A2CB5734(a1 > 1, v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return sub_1A2CF39F0();
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_14(uint64_t result)
{
  *(void *)(result + 16) = 0x6E6F6973726576;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_15(char a1, char a2, char a3)
{
  *(void *)(v3 + 56) = 0;
  *(void *)(v3 + 48) = 0;
  *(unsigned char *)(v3 + 64) = -1;
  *(void *)(v3 + 80) = 0;
  *(void *)(v3 + 72) = 0;
  *(unsigned char *)(v3 + 88) = -1;
  *(unsigned char *)(v3 + 40) = a1;
  *(unsigned char *)(v3 + 41) = a2;
  *(unsigned char *)(v3 + 42) = a3;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return v0;
}

void *OUTLINED_FUNCTION_1_18()
{
  sub_1A2CB377C((long long *)(v0 - 144), v0 - 304);
  return __swift_project_boxed_opaque_existential_1((void *)(v0 - 304), *(void *)(v0 - 280));
}

uint64_t OUTLINED_FUNCTION_1_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_bridgeObjectRetain();
}

size_t OUTLINED_FUNCTION_12_4(const void *a1)
{
  return _swift_stdlib_malloc_size(a1);
}

uint64_t OUTLINED_FUNCTION_12_5(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return v2 + 160;
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  uint64_t result = *v4;
  *uint64_t v4 = v3;
  *(void *)(v0 + 56) = v2;
  *(unsigned char *)(v0 + 64) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  return sub_1A2CF4080();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_0_3()
{
  uint64_t v6 = *(void *)(v1 + 8);
  *(void *)(v4 - 136) = *(void *)v1;
  *(void *)(v4 - 128) = v6;
  *(_DWORD *)(v4 - 116) = *(unsigned __int8 *)(v1 + 16);
  *(void *)(v4 - 168) = *v0;
  *(_DWORD *)(v4 - 188) = *v3;
  int v7 = **(unsigned __int8 **)(v4 - 160);
  *(void *)(v4 - 224) = *(void *)v2;
  *(_DWORD *)(v4 - 208) = *(unsigned __int8 *)(v2 + 8);
  *(_DWORD *)(v4 - 204) = v7;
  *(_DWORD *)(v4 - 212) = **(unsigned __int8 **)(v4 - 112);
  return sub_1A2CBA79C();
}

uint64_t OUTLINED_FUNCTION_0_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = v1;
  *(void *)(v2 - 296) = *(void *)(a1 + 8);
  return result;
}

void *OUTLINED_FUNCTION_0_5@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return v0;
}

void OUTLINED_FUNCTION_0_9()
{
  sub_1A2CB49D8();
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  *(unsigned char *)(v1 - 65) = 4;
  return sub_1A2CE7D78(v0);
}

unint64_t OUTLINED_FUNCTION_0_11(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

void OUTLINED_FUNCTION_0_12(void *a1@<X8>)
{
  *a1 = v1;
}

void OUTLINED_FUNCTION_0_15(unint64_t a1@<X8>)
{
  sub_1A2CB5734(a1 > 1, v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186498](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_1A2CF3D40();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_1A2CAF5FC(v0);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  type metadata accessor for Store.Promises();
  return sub_1A2CF3D40();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_10(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  uint64_t v3 = a1 + 3;
  return sub_1A2CE7E88(v3);
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_12(uint64_t a1)
{
  return sub_1A2CB1B3C(a1, 0, 29);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return sub_1A2CF3900();
}

__n128 OUTLINED_FUNCTION_5_7()
{
  return *(__n128 *)(v0 + 40);
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return type metadata accessor for Statement();
}

__n128 *OUTLINED_FUNCTION_5_11(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return a1 + 3;
}

uint64_t OUTLINED_FUNCTION_5_12()
{
  return sub_1A2CF3BC0();
}

uint64_t OUTLINED_FUNCTION_5_13()
{
  uint64_t v1 = *(void *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 40), v1);
  return v1;
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

uint64_t (*OUTLINED_FUNCTION_2_1(uint64_t a1))()
{
  return static EntityType.createTableChain(for:ifNotExists:shouldVersion:)(v4, v3, v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_2_2@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_2_3@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v3 = a1 & 0xFFFFFFFFFFFFFFFLL;
  return sub_1A2CB37E4(v3 + 32, (uint64_t)&a2);
}

void OUTLINED_FUNCTION_2_4(unint64_t a1@<X8>)
{
  sub_1A2CB5734(a1 > 1, v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return v0;
}

void *OUTLINED_FUNCTION_2_7(uint64_t a1)
{
  return sub_1A2CB0EB0(a1);
}

void OUTLINED_FUNCTION_2_9(unint64_t a1@<X8>)
{
  sub_1A2CB5734(a1 > 1, v1, 1, v2);
}

__n128 OUTLINED_FUNCTION_2_10()
{
  return v0[1];
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_2_14(char a1, uint64_t a2)
{
  sub_1A2CB5734(a1, a2, 1, v2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_2(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_1A2CBBD44();
}

char *OUTLINED_FUNCTION_7_3()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_1A2CB4BC8(0, v2, 1);
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return v0 - 65;
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  *(void *)(v1 - 88) = v0;
  type metadata accessor for Store.Promises();
  return sub_1A2CF3D40();
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return v0;
}

void OUTLINED_FUNCTION_7_11(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 216) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_1A2CF3C90();
}

uint64_t OUTLINED_FUNCTION_9_2@<X0>(uint64_t a1@<X8>)
{
  *uint64_t v2 = a1;
  return v1;
}

void *OUTLINED_FUNCTION_9_6(void *result)
{
  result[2] = 25705;
  result[3] = 0xE200000000000000;
  result[4] = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return 0;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t (*OUTLINED_FUNCTION_8_1(uint64_t a1))()
{
  return EntityType.saveChain(for:)(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 - 184) = v7;
  *(void *)(v8 - 200) = a7;
  *(void *)(v8 - 112) = a6;
  *(void *)(v8 - 160) = a4;
  return sub_1A2CF3C40();
}

char *OUTLINED_FUNCTION_8_3()
{
  return sub_1A2CB4BC8(0, v0, 0);
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t *a1, uint64_t a2)
{
  return sub_1A2CBE824(a1, a2, 1, 0, v3, v2);
}

void OUTLINED_FUNCTION_8_5()
{
  Database.write(_:block:)();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 312) = a1;
  *(void *)(v2 + 320) = a2;
  return v2 + 384;
}

uint64_t OUTLINED_FUNCTION_8_9()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_1A2CBBD20(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  return sub_1A2CBE824((uint64_t *)va1, (uint64_t)va, v3, v4, v5, v2);
}

void OUTLINED_FUNCTION_3_6(unint64_t a1@<X8>)
{
  sub_1A2CB5734(a1 > 1, v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return sub_1A2CF3FC0();
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_16(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = v2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_3_17()
{
  return swift_beginAccess();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_5(uint64_t a1, ...)
{
  va_start(va1, a1);
  va_start(va, a1);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  return sub_1A2CBE824((uint64_t *)va1, (uint64_t)va, 0, 1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1, unint64_t a2, char a3)
{
  sub_1A2CD5EC4(a1, a2, a3);
  return v3;
}

__n128 OUTLINED_FUNCTION_4_7()
{
  return v0[2];
}

uint64_t OUTLINED_FUNCTION_4_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  return sub_1A2CAEF50(&a16, v16, v17, &a9);
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return sub_1A2CF4020();
}

void OUTLINED_FUNCTION_4_12(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 320) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_14()
{
  __swift_project_boxed_opaque_existential_1(v1, *(void *)(v0 + 64));
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(unsigned char *)(a2 + 32) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t result)
{
  *(void *)(result + 16) = 25705;
  *(void *)(result + 24) = 0xE200000000000000;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1)
{
  *(void *)(v2 - 160) = a1;
  *(void *)(v2 - 176) = v1;
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(void *)(v2 - 112) = v1 + 24;
  return sub_1A2CF37A0();
}

void OUTLINED_FUNCTION_11_2()
{
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = v0 + 16 * v4;
  *(void *)(v5 + 32) = v1;
  *(void *)(v5 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return v0;
}

void OUTLINED_FUNCTION_11_5(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_11_6(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return v2 + 216;
}

void OUTLINED_FUNCTION_11_8()
{
  *(void *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_3(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return v2 + 104;
}

__n128 OUTLINED_FUNCTION_10()
{
  return v0[2];
}

void OUTLINED_FUNCTION_10_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 104) = 0xD000000000000014;
  *(void *)(v1 - 96) = (a1 - 32) | 0x8000000000000000;
  *(void *)(v1 - 72) = *(void *)(v1 - 224);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_allocObject();
}

char *OUTLINED_FUNCTION_10_2@<X0>(unint64_t a1@<X8>)
{
  return sub_1A2CB4BC8((char *)(a1 > 1), v1, 1);
}

uint64_t OUTLINED_FUNCTION_10_3(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, long long a10)
{
  return sub_1A2CAEF50(a1, v10, v11, &a10);
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  uint64_t result = *v3;
  *uint64_t v3 = v2;
  *(void *)(v1 + 80) = v0;
  *(unsigned char *)(v1 + 88) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return sub_1A2CB81F8();
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  type metadata accessor for MixedKeyValueStore.Promises();
  return sub_1A2CF3D40();
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  int v2 = *(_DWORD *)(v0 - 68) & 1;
  return sub_1A2CBC698(v2);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_1A2CF3D90();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_beginAccess();
}

__n128 OUTLINED_FUNCTION_15_3(__n128 a1, __n128 a2)
{
  *int v2 = a1;
  v2[1] = a2;
  __n128 result = v3[2];
  v2[2] = result;
  v2[3].n128_u64[0] = v3[3].n128_u64[0];
  return result;
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t OUTLINED_FUNCTION_14_1@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned __int8 *)(v1 + a1);
}

void OUTLINED_FUNCTION_14_4()
{
  *(void *)(v2 + 16) = v1;
  uint64_t v5 = v2 + 16 * v0;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v3;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sqlite3_open_v2(v0, v1, 65542, 0);
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1, uint64_t a2)
{
  v2[81] = a1;
  v2[82] = a2;
  return sub_1A2CE7E88(v2 + 90);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 312) = a1;
  *(void *)(v2 + 320) = a2;
  return v2 + 384;
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_1A2CF39F0();
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 256) = a1;
  *(void *)(v2 + 264) = a2;
  return v2 + 328;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_1A2CF37B0();
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 368) = a1;
  *(void *)(v2 + 376) = a2;
  return v2 + 440;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_1A2CF3C30();
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 480) = a1;
  *(void *)(v2 + 488) = a2;
  return v2 + 552;
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_30()
{
  *(void *)(v0 - 104) = 0;
  *(void *)(v0 - 96) = 0xE000000000000000;
  return sub_1A2CF3DD0();
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return v2 + 160;
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return v2 + 104;
}

char *OUTLINED_FUNCTION_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  return &a19;
}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return v2 + 216;
}

uint64_t OUTLINED_FUNCTION_27()
{
  *(unsigned char *)(v2 - 104) = v1;
  return sub_1A2CBBF90((unsigned char *)(v2 - 104), v0);
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  return v2 + 272;
}

uint64_t type metadata accessor for Column.Func()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v1;
  *uint64_t v2 = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_1A2CF39F0();
}

uint64_t OUTLINED_FUNCTION_29()
{
  *(void *)(v0 - 104) = 0;
  *(void *)(v0 - 96) = 0xE000000000000000;
  return sub_1A2CF3DD0();
}

uint64_t OUTLINED_FUNCTION_29_0(uint64_t a1, uint64_t a2)
{
  v2[67] = a1;
  v2[68] = a2;
  return sub_1A2CE7E88(v2 + 76);
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v2 = *(void *)(v0 - 128);
  *(void *)(v0 - 104) = *(void *)(v0 - 136);
  *(void *)(v0 - 96) = v2;
  *(unsigned char *)(v0 - 88) = *(_DWORD *)(v0 - 116);
  return sub_1A2CBBD44();
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2)
{
  v2[74] = a1;
  v2[75] = a2;
  return sub_1A2CE7E88(v2 + 83);
}

BOOL OUTLINED_FUNCTION_23_1@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  *(unsigned char *)(v1 - 104) = *(_DWORD *)(v1 - 188);
  return sub_1A2CBBF90((unsigned char *)(v1 - 104), v0);
}

BOOL OUTLINED_FUNCTION_22_1@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_allocObject();
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

uint64_t sub_1A2CB75F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1A2CF3F50();
  __break(1u);
  return result;
}

uint64_t sub_1A2CB76F0(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x10) {
    unint64_t v2 = 16;
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
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_1A2CF3720();
}

uint64_t sub_1A2CB7810()
{
  sub_1A2CB7844();
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CB7844()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A2CB7874()
{
  return swift_retain();
}

void sub_1A2CB78E0()
{
  OUTLINED_FUNCTION_24_1();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = v4;
  if (!swift_isUniquelyReferenced_nonNull_native() || v3 > *(void *)(v1 + 24) >> 1)
  {
    sub_1A2CB7998();
    uint64_t v1 = v7;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_21_1();
  if (v8 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v9 = OUTLINED_FUNCTION_20_1();
  sub_1A2CDEDE4(v9, v10, v11);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  uint64_t v12 = *(void *)(v1 + 16);
  BOOL v5 = __OFADD__(v12, v2);
  uint64_t v13 = v12 + v2;
  if (!v5)
  {
    *(void *)(v1 + 16) = v13;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1A2CB7998()
{
  OUTLINED_FUNCTION_9_4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_9();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_7_8();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_9();
    }
  }
  OUTLINED_FUNCTION_5_10();
  if (v1)
  {
    sub_1A2CB3A44(0, &qword_1EB5A5CB0, (void (*)(uint64_t))sub_1A2CBA470);
    BOOL v5 = (const void *)OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_12_4(v5);
    OUTLINED_FUNCTION_11_5(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_10_5();
    sub_1A2CDCF0C(v7, v8, v9);
    OUTLINED_FUNCTION_8_7();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_6_9();
    sub_1A2CB7A54(v10, v11, v12, v13);
  }
}

uint64_t sub_1A2CB7A54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_1A2CB7B68();
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1A2CF3F50();
  __break(1u);
  return result;
}

unint64_t sub_1A2CB7B68()
{
  unint64_t result = qword_1EB5A6968;
  if (!qword_1EB5A6968)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1EB5A6968);
  }
  return result;
}

uint64_t sub_1A2CB7BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1A2CB7BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A2CB7BF8()
{
  unint64_t result = qword_1EB5A67E0;
  if (!qword_1EB5A67E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A67E0);
  }
  return result;
}

unint64_t sub_1A2CB7C44()
{
  unint64_t result = qword_1EB5A67D8;
  if (!qword_1EB5A67D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A67D8);
  }
  return result;
}

uint64_t Create.__deallocating_deinit()
{
  Create.deinit();
  return swift_deallocClassInstance();
}

uint64_t Create.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A2CB7CF0(*(void *)(v0 + 56));
  return v0;
}

uint64_t sub_1A2CB7CF0(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A2CB7D3C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!a2) {
    return 0;
  }
  int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

uint64_t _s5TeaDB8SQLErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1A2CB7EC4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1A2CB7EC4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0x1Cu) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t PreparedStatement.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t FastEntity.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

BOOL sub_1A2CB7F4C(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1A2CB7F78()
{
  return swift_initClassMetadata2();
}

unsigned char *sub_1A2CB7FDC(unsigned char *result, char a2)
{
  char *result = a2;
  return result;
}

uint64_t sub_1A2CB7FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A2CB7BBC(a1, a2, a3, (uint64_t (*)(void))sub_1A2CB7BF8, (uint64_t (*)(void))sub_1A2CB7C44);
}

uint64_t destroy for SQLError(uint64_t a1)
{
  return sub_1A2CB1E90(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s5TeaDB8DatabaseC8LocationOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1A2CB8070(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1A2CB8070(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1A2CB8088()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1A2CB80D4()
{
  uint64_t result = sub_1A2CF3D40();
  if (v1 <= 0x3F)
  {
    type metadata accessor for Column.Func();
    uint64_t result = sub_1A2CF3D40();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t dispatch thunk of Column.value.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t sub_1A2CB81F8()
{
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_6_8();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  uint64_t v0 = OUTLINED_FUNCTION_8_6();
  return v1(v0);
}

uint64_t sub_1A2CB8278()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t Query.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CB8348()
{
  return swift_initClassMetadata2();
}

BOOL sub_1A2CB838C(void *a1, uint64_t *a2)
{
  return sub_1A2CB7F4C(a1, *a2);
}

ValueMetadata *type metadata accessor for AssertionOptions()
{
  return &type metadata for AssertionOptions;
}

uint64_t sub_1A2CB83A4(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A2CB840C(qword_1EB5A6210);
  uint64_t result = sub_1A2CB840C(&qword_1EB5A6208);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A2CB840C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A2CF35B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

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

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t assertion<A>(_:invoking:)(char *a1, void (*a2)(void))
{
  char v5 = *a1;
  sub_1A2CB8538(&v5);
  if (v2) {

  }
  a2();
  return swift_release();
}

uint64_t sub_1A2CB8538(char *a1)
{
  char v2 = *a1;
  type metadata accessor for Assertion();
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = v2;
  sub_1A2CB9BBC();
  if (v1) {
    swift_release();
  }
  return v3;
}

uint64_t sub_1A2CB859C()
{
  char v1 = *v0;
  type metadata accessor for Assertion();
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = (v1 & 0x20) != 0;
  sub_1A2CB9BBC();
  return v2;
}

uint64_t type metadata accessor for Assertion()
{
  return self;
}

uint64_t Assertion.__deallocating_deinit()
{
  Assertion.deinit();
  return swift_deallocClassInstance();
}

uint64_t Assertion.deinit()
{
  unsigned __int8 v2 = *(unsigned char *)(v0 + 16);
  sub_1A2CB8874(&v2);
  return v0;
}

uint64_t sub_1A2CB8874(unsigned __int8 *a1)
{
  uint64_t v2 = sub_1A2CF3760();
  uint64_t v63 = *(void *)(v2 - 8);
  uint64_t v64 = v2;
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v62 = &v47[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v3);
  uint64_t v61 = &v47[-v5];
  uint64_t v6 = sub_1A2CF37D0();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  long long v57 = &v47[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v7);
  long long v58 = &v47[-v9];
  uint64_t v10 = sub_1A2CF3790();
  uint64_t v54 = *(void *)(v10 - 8);
  uint64_t v55 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v52 = &v47[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v53 = sub_1A2CF37B0();
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v50 = &v47[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_1A2CF3CA0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = &v47[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_1A2CF35E0();
  uint64_t v66 = *(void *)(v17 - 8);
  uint64_t v67 = v17;
  uint64_t v18 = *(void *)(v66 + 64);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v49 = &v47[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v19);
  int v48 = *a1;
  long long v65 = &v47[-v20];
  sub_1A2CF35D0();
  sub_1A2CB9280(0, &qword_1EB5A6920);
  if (qword_1EB5A61C0 != -1) {
    swift_once();
  }
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1A2CB9848(&qword_1EB5A6AD0, MEMORY[0x1E4FBCC70]);
  unint64_t v21 = (void (*)(uint64_t))MEMORY[0x1E4FBCC70];
  sub_1A2CB939C(0, &qword_1EB5A6AA8, MEMORY[0x1E4FBCC70]);
  sub_1A2CB934C((unint64_t *)&unk_1EB5A6AB0, &qword_1EB5A6AA8, v21);
  sub_1A2CF3D90();
  uint64_t v22 = sub_1A2CF3CB0();
  uint64_t v23 = (*(uint64_t (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v13);
  if (qword_1EB5A6A58 != -1) {
    uint64_t v23 = swift_once();
  }
  MEMORY[0x1F4188790](v23);
  unint64_t v24 = v65;
  *(void *)&v47[-16] = v65;
  *(void *)&v47[-8] = v22;
  uint64_t v26 = (uint64_t)&v25[4];
  uint64_t v27 = v25 + 6;
  os_unfair_lock_lock(v25 + 6);
  sub_1A2CB951C(v26);
  os_unfair_lock_unlock(v27);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v29 = v66;
  unint64_t v30 = v49;
  uint64_t v31 = v24;
  uint64_t v32 = v67;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v66 + 16))(v49, v31, v67);
  unint64_t v33 = (*(unsigned __int8 *)(v29 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v56;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v29 + 32))(v34 + v33, v30, v32);
  *(unsigned char *)(v34 + v33 + v18) = v48;
  aBlock[4] = sub_1A2CEB68C;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A2CC0840;
  aBlock[3] = &block_descriptor_1;
  uint64_t v35 = _Block_copy(aBlock);
  unint64_t v36 = v50;
  sub_1A2CB9180();
  unint64_t v37 = v52;
  sub_1A2CB9184();
  sub_1A2CF3CF0();
  _Block_release(v35);
  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v37, v55);
  (*(void (**)(unsigned char *, uint64_t))(v51 + 8))(v36, v53);
  swift_release();
  uint64_t v38 = v57;
  sub_1A2CF37C0();
  if (qword_1EB5A6A78 != -1) {
    swift_once();
  }
  uint64_t v39 = v64;
  uint64_t v40 = __swift_project_value_buffer(v64, (uint64_t)qword_1EB5A6A60);
  uint64_t v41 = v58;
  MEMORY[0x1A623EB60](v38, v40);
  uint64_t v42 = v60;
  uint64_t v59 = *(void *)(v59 + 8);
  ((void (*)(unsigned char *, uint64_t))v59)(v38, v60);
  unint64_t v43 = v61;
  sub_1A2CB910C((uint64_t)v61);
  uint64_t v44 = v62;
  sub_1A2CB9094(v62);
  MEMORY[0x1A623F070](v41, v43, v44, ObjectType);
  uint64_t v45 = *(void (**)(unsigned char *, uint64_t))(v63 + 8);
  v45(v44, v39);
  v45(v43, v39);
  ((void (*)(unsigned char *, uint64_t))v59)(v41, v42);
  sub_1A2CF3D10();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v66 + 8))(v65, v67);
}

uint64_t sub_1A2CB9094@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = *MEMORY[0x1E4FBCAA8];
  uint64_t v3 = sub_1A2CF3760();
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_1A2CB910C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x1E4FBCAD0];
  uint64_t v3 = sub_1A2CF3760();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_1A2CB9184()
{
  sub_1A2CF3790();
  sub_1A2CB92BC(&qword_1EB5A6888, MEMORY[0x1E4FBCB00]);
  uint64_t v0 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1A2CB94B8(0, &qword_1EB5A68D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1A2CB93F0(&qword_1EB5A68D8, &qword_1EB5A68D0, v0);
  return sub_1A2CF3D90();
}

uint64_t sub_1A2CB9280(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1A2CB92BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A2CB9304(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A2CB934C(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A2CB939C(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1A2CB939C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A2CF3B50();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1A2CB93F0(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A2CB94B8(255, a2, a3, MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A2CB9454(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A2CBB064(255, a2, a3, MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1A2CB94B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1A2CB951C(uint64_t a1)
{
  return sub_1A2CB9538(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1A2CB9538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A2CB9588(a3, a2);
}

uint64_t sub_1A2CB9588(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_1A2CB9608(a1, a2);
  *uint64_t v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CB9608(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = sub_1A2CF35E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)*v2;
  unint64_t v11 = sub_1A2CB97B0(a2);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_1A2CB9A50(0, &qword_1EB5A6B00, MEMORY[0x1E4FBBCB8]);
  if ((sub_1A2CF3F00() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_1A2CB97B0(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    uint64_t result = sub_1A2CF40D0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v3;
  if (v14)
  {
    uint64_t v18 = v17[7];
    uint64_t result = swift_unknownObjectRelease();
    *(void *)(v18 + 8 * v13) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_1A2CB9B04(v13, (uint64_t)v9, a1, v17);
  }
  return result;
}

unint64_t sub_1A2CB97B0(uint64_t a1)
{
  sub_1A2CF35E0();
  sub_1A2CB9848(&qword_1EB5A6A30, MEMORY[0x1E4F27990]);
  uint64_t v2 = sub_1A2CF38F0();
  return sub_1A2CB9890(a1, v2);
}

uint64_t sub_1A2CB9848(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1A2CB9890(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_1A2CF35E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    unint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1A2CB9848(&qword_1EB5A6A38, MEMORY[0x1E4F27990]);
      char v15 = sub_1A2CF3940();
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

void sub_1A2CB9A50(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_1A2CF35E0();
    unint64_t v7 = sub_1A2CBA334();
    uint64_t v8 = sub_1A2CB9848(&qword_1EB5A6A30, MEMORY[0x1E4F27990]);
    unint64_t v9 = a3(a1, v6, v7, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1A2CB9B04(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1A2CF35E0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void sub_1A2CB9BBC()
{
  if (qword_1EB5A69A0 != -1) {
    swift_once();
  }
  uint64_t v0 = (uint64_t *)(qword_1EB5A6A40 + 16);
  uint64_t v1 = (os_unfair_lock_s *)(qword_1EB5A6A40 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1EB5A6A40 + 24));
  sub_1A2CB9C48(v0);
  os_unfair_lock_unlock(v1);
}

void sub_1A2CB9C48(uint64_t *a1)
{
  sub_1A2CB9C64(a1, v1);
}

void sub_1A2CB9C64(uint64_t *a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *a1;
  if (*(void *)(*a1 + 16) && (unint64_t v5 = sub_1A2CB9E90(*(unsigned char *)(a2 + 16)), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(v4 + 56) + 24 * v5;
    unsigned __int8 v8 = *(unsigned char *)v7;
    uint64_t v10 = *(void **)(v7 + 8);
    uint64_t v9 = *(void *)(v7 + 16);
    v12[0] = v8;
    uint64_t v13 = v10;
    uint64_t v14 = v9;
    id v11 = v10;
    sub_1A2CBA0B8((uint64_t)v15);
    sub_1A2CBA020(v15[0], v16, v17, v3);
  }
  else
  {
    v12[0] = v3;
    sub_1A2CBB490(v12, (uint64_t)v15);
    if (!v2) {
      sub_1A2CBA020(v15[0], v16, v17, v3);
    }
  }
}

void sub_1A2CB9D3C(char a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = (void **)v4;
  char v9 = a4 & 1;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1A2CB9E90(a4 & 1);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_1A2CB9FB4(0, &qword_1EB5A6B08, MEMORY[0x1E4FBBCB8]);
  if ((sub_1A2CF3F00() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_1A2CB9E90(v9);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    sub_1A2CF40D0();
    __break(1u);
    return;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v5;
  if (v14)
  {
    uint64_t v18 = v17[7] + 24 * v13;

    *(unsigned char *)uint64_t v18 = a1 & 1;
    *(void *)(v18 + 8) = a2;
    *(void *)(v18 + 16) = a3;
  }
  else
  {
    sub_1A2CBA4BC(v13, v9, a1 & 1, a2, a3, v17);
  }
}

unint64_t sub_1A2CB9E90(char a1)
{
  char v1 = a1 & 1;
  sub_1A2CF4120();
  sub_1A2CF4130();
  uint64_t v2 = sub_1A2CF4140();
  return sub_1A2CB9F00(v1, v2);
}

unint64_t sub_1A2CB9F00(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

void sub_1A2CB9FB4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1A2CBA38C();
    unint64_t v7 = a3(a1, &type metadata for Assertion.Name, &type metadata for Assertion.RunningAssertion, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1A2CBA020(char a1, uint64_t a2, uint64_t a3, char a4)
{
  char v7 = a1 & 1;
  char v8 = a4 & 1;
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_1A2CB9D3C(v7, a2, a3, v8);
  *uint64_t v4 = v10;
  return swift_bridgeObjectRelease();
}

id sub_1A2CBA0B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = *((void *)v1 + 2);
  uint64_t v6 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    int v3 = *v1;
    uint64_t v2 = (void *)*((void *)v1 + 1);
    if (qword_1EB5A6A20 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v7 = sub_1A2CF3750();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EB5A8270);
  id v15 = v2;
  char v8 = sub_1A2CF3730();
  os_log_type_t v9 = sub_1A2CF3BF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    if (v3) {
      uint64_t v12 = 0x61546873696E6946;
    }
    else {
      uint64_t v12 = 0xD000000000000019;
    }
    if (v3) {
      unint64_t v13 = 0xED0000776F4E6B73;
    }
    else {
      unint64_t v13 = 0x80000001A2CF8080;
    }
    sub_1A2CEB914(v12, v13, &v16);
    sub_1A2CF3D50();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2050;
    sub_1A2CF3D50();
    _os_log_impl(&dword_1A2CAD000, v8, v9, "Increasing interest in assertion. Name=%{public}s, New Interest Count=%{public}ld", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A623FB80](v11, -1, -1);
    MEMORY[0x1A623FB80](v10, -1, -1);
  }
  else
  {
  }
  *(unsigned char *)a1 = v3;
  *(void *)(a1 + 8) = v15;
  *(void *)(a1 + 16) = v6;
  return v15;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1A2CBA334()
{
  unint64_t result = qword_1EB5A6AD8;
  if (!qword_1EB5A6AD8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB5A6AD8);
  }
  return result;
}

unint64_t sub_1A2CBA38C()
{
  unint64_t result = qword_1EB5A69C0;
  if (!qword_1EB5A69C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A69C0);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  char *result = *a2;
  return result;
}

uint64_t objectdestroy_14Tm(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 24));
  return MEMORY[0x1F4186498](v2, 32, 7);
}

void sub_1A2CBA43C(uint64_t a1)
{
}

unint64_t sub_1A2CBA470()
{
  unint64_t result = qword_1EB5A6958;
  if (!qword_1EB5A6958)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1EB5A6958);
  }
  return result;
}

void sub_1A2CBA4B4(void *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_1A2CBA4BC(unint64_t result, char a2, char a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a6[6] + result) = a2 & 1;
  uint64_t v6 = a6[7] + 24 * result;
  *(unsigned char *)uint64_t v6 = a3 & 1;
  *(void *)(v6 + 8) = a4;
  *(void *)(v6 + 16) = a5;
  uint64_t v7 = a6[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a6[2] = v9;
  }
  return result;
}

void sub_1A2CBA514(uint64_t a1)
{
}

void sub_1A2CBA53C(uint64_t a1)
{
}

void sub_1A2CBA564(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

uint64_t sub_1A2CBA5A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1A2CF3F50();
  __break(1u);
  return result;
}

uint64_t sub_1A2CBA698(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1A2CF3960();

  return v3;
}

id sub_1A2CBA708()
{
  uint64_t v0 = (void *)sub_1A2CF3950();
  swift_bridgeObjectRelease();
  char v1 = (void *)sub_1A2CF3950();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributeWithDomain_name_, v0, v1);

  return v2;
}

unint64_t sub_1A2CBA79C()
{
  unint64_t result = qword_1EB5A6910;
  if (!qword_1EB5A6910)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB5A6910);
  }
  return result;
}

id sub_1A2CBA7DC(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = (void *)sub_1A2CF3950();
  swift_bridgeObjectRelease();
  sub_1A2CB9280(0, (unint64_t *)&unk_1EB5A6980);
  unint64_t v6 = (void *)sub_1A2CF3AA0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v3, sel_initWithExplanation_target_attributes_, v5, a3, v6);

  return v7;
}

uint64_t sub_1A2CBA884(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
    sub_1A2CF3E80();
    unint64_t v5 = (uint64_t *)(a1 + 32);
    sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
    sub_1A2CB0330();
    do
    {
      uint64_t v6 = *v5++;
      *(void *)&v11[0] = v6;
      swift_bridgeObjectRetain();
      *(void *)&v11[0] = sub_1A2CF3900();
      *((void *)&v11[0] + 1) = v7;
      swift_bridgeObjectRetain();
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      long long v8 = v11[0];
      sub_1A2CB37E4(a2 + 16, (uint64_t)v11);
      sub_1A2CB3174(0, (unint64_t *)&qword_1EB5A6880, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1EF5E1058, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Statement);
      swift_allocObject();
      sub_1A2CAF0D4(0, v8, *((uint64_t *)&v8 + 1), v11);
      swift_bridgeObjectRelease();
      sub_1A2CF3E50();
      sub_1A2CF3E90();
      sub_1A2CF3EA0();
      sub_1A2CF3E60();
      --v3;
    }
    while (v3);
    uint64_t v9 = v12;
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x1E4FBC860];
  }
  return v9;
}

uint64_t sub_1A2CBAA68(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v40 = a5;
  uint64_t v41 = a8;
  uint64_t v50 = a1;
  uint64_t v51 = a2;
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v52 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0();
  uint64_t v45 = v12;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v37 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0();
  uint64_t v42 = v20;
  uint64_t v43 = v19;
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v38 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  unint64_t v24 = (char *)&v37 - v23;
  uint64_t v25 = sub_1A2CF3BA0();
  if (!v25) {
    return sub_1A2CF3B00();
  }
  uint64_t v26 = v25;
  uint64_t v55 = sub_1A2CF3830();
  uint64_t v44 = sub_1A2CF3ED0();
  sub_1A2CF3E70();
  uint64_t v48 = a6;
  uint64_t result = sub_1A2CF3B90();
  if (v26 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v46 = (void (**)(char *))(v45 + 16);
    uint64_t v47 = v18;
    v45 += 8;
    while (1)
    {
      char v28 = (void (*)(char *, void))sub_1A2CF3BE0();
      (*v46)(v16);
      v28(v54, 0);
      uint64_t v29 = v53;
      v50(v16, v52);
      if (v29) {
        break;
      }
      uint64_t v53 = 0;
      uint64_t v30 = OUTLINED_FUNCTION_10_8();
      v31(v30);
      sub_1A2CF3EB0();
      sub_1A2CF3BB0();
      if (!--v26)
      {
        uint64_t v32 = v42;
        uint64_t v33 = v43;
        uint64_t v34 = v38;
        (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v38, v24, v43);
        sub_1A2CF3DA0();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v33);
        return v55;
      }
    }
    uint64_t v35 = OUTLINED_FUNCTION_10_8();
    v36(v35);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v43);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v41, v52, v40);
  }
  return result;
}

void sub_1A2CBAE48()
{
  if (!qword_1EB5A6190)
  {
    sub_1A2CB4064();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EB5A6190);
    }
  }
}

void sub_1A2CBAEB4()
{
  if (!qword_1EB5A68B8)
  {
    unint64_t v0 = sub_1A2CF3D40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A68B8);
    }
  }
}

void sub_1A2CBAF00()
{
  if (!qword_1EB5A68A8)
  {
    sub_1A2CBAEB4();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EB5A68A8);
    }
  }
}

uint64_t String.queryValue.getter()
{
  return 39;
}

uint64_t sub_1A2CBB010()
{
  return String.queryValue.getter();
}

unint64_t sub_1A2CBB018()
{
  unint64_t result = qword_1EB5A6890;
  if (!qword_1EB5A6890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A6890);
  }
  return result;
}

void sub_1A2CBB064(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t type metadata accessor for Statement()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBB0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 32);
}

uint64_t sub_1A2CBB0E8(unsigned __int8 *a1)
{
  return *a1;
}

ValueMetadata *type metadata accessor for Assertion.Name()
{
  return &type metadata for Assertion.Name;
}

unint64_t sub_1A2CBB104()
{
  unint64_t result = qword_1EB5A69C8;
  if (!qword_1EB5A69C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A69C8);
  }
  return result;
}

uint64_t sub_1A2CBB150()
{
  uint64_t v0 = sub_1A2CF3760();
  __swift_allocate_value_buffer(v0, qword_1EB5A6A60);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)qword_1EB5A6A60) = 500;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v1();
}

uint64_t sub_1A2CBB1E0(uint64_t a1)
{
  return sub_1A2CB4CEC(a1, sub_1A2CBA53C, &qword_1EB5A6A48);
}

uint64_t sub_1A2CBB200()
{
  v5[0] = sub_1A2CF3C40();
  uint64_t v0 = *(void *)(v5[0] - 8);
  MEMORY[0x1F4188790]();
  id v2 = (char *)v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2CF3C30();
  MEMORY[0x1F4188790]();
  sub_1A2CF37B0();
  MEMORY[0x1F4188790]();
  sub_1A2CB9280(0, (unint64_t *)&qword_1EB5A6910);
  sub_1A2CF37A0();
  v5[1] = MEMORY[0x1E4FBC860];
  sub_1A2CB9848(&qword_1EB5A6908, MEMORY[0x1E4FBCC10]);
  uint64_t v3 = (void (*)(uint64_t))MEMORY[0x1E4FBCC10];
  sub_1A2CB939C(0, &qword_1EB5A68F0, MEMORY[0x1E4FBCC10]);
  sub_1A2CB934C((unint64_t *)&unk_1EB5A68F8, &qword_1EB5A68F0, v3);
  sub_1A2CF3D90();
  (*(void (**)(char *, void, void))(v0 + 104))(v2, *MEMORY[0x1E4FBCC58], v5[0]);
  uint64_t result = sub_1A2CF3C90();
  qword_1EB5A8260 = result;
  return result;
}

uint64_t sub_1A2CBB470(uint64_t a1)
{
  return sub_1A2CB4CEC(a1, sub_1A2CBA514, &qword_1EB5A6A40);
}

void sub_1A2CBB490(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  v33[1] = *(id *)MEMORY[0x1E4F143B8];
  int v2 = *a1;
  sub_1A2CB56EC(0, (unint64_t *)&unk_1EB5A6A10);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A2CF6D00;
  char v29 = v2;
  if (v2) {
    uint64_t v4 = 0x61546873696E6946;
  }
  else {
    uint64_t v4 = 0xD000000000000019;
  }
  if (v2) {
    unint64_t v5 = 0xED0000776F4E6B73;
  }
  else {
    unint64_t v5 = 0x80000001A2CF8080;
  }
  sub_1A2CB9280(0, &qword_1EB5A6A08);
  unint64_t v31 = v5;
  *(void *)(v3 + 32) = sub_1A2CBA708();
  *(void *)(v3 + 40) = objc_msgSend(self, sel_attributeWithCompletionPolicy_, 1);
  v33[0] = (id)v3;
  sub_1A2CF3AD0();
  id v6 = objc_msgSend(self, sel_currentProcess);
  id v7 = objc_allocWithZone(MEMORY[0x1E4F96318]);
  id v8 = sub_1A2CBA7DC(0xD000000000000020, 0x80000001A2CF8310, v6);
  if (qword_1EB5A6A20 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1A2CF3750();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EB5A8270);
  uint64_t v10 = sub_1A2CF3730();
  os_log_type_t v11 = sub_1A2CF3BF0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    v33[0] = v13;
    *(_DWORD *)uint64_t v12 = 136446210;
    sub_1A2CEB914(v4, v31, (uint64_t *)v33);
    sub_1A2CF3D50();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A2CAD000, v10, v11, "Acquiring RBSAssertion. Name=%{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A623FB80](v13, -1, -1);
    MEMORY[0x1A623FB80](v12, -1, -1);
  }

  v33[0] = 0;
  if (objc_msgSend(v8, sel_acquireWithError_, v33))
  {
    id v14 = v33[0];
    uint64_t v15 = sub_1A2CF3730();
    os_log_type_t v16 = sub_1A2CF3BF0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      v33[0] = v18;
      *(_DWORD *)uint64_t v17 = 136446210;
      sub_1A2CEB914(v4, v31, (uint64_t *)v33);
      sub_1A2CF3D50();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A2CAD000, v15, v16, "Acquired RBSAssertion. Name=%{public}s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A623FB80](v18, -1, -1);
      MEMORY[0x1A623FB80](v17, -1, -1);
    }

    *(unsigned char *)a2 = v29;
    *(void *)(a2 + 8) = v8;
    *(void *)(a2 + 16) = 1;
  }
  else
  {
    id v19 = v33[0];
    uint64_t v20 = (void *)sub_1A2CF3480();

    swift_willThrow();
    id v21 = v20;
    id v22 = v20;
    uint64_t v23 = sub_1A2CF3730();
    os_log_type_t v24 = sub_1A2CF3C00();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      v33[0] = v27;
      *(_DWORD *)uint64_t v25 = 136446466;
      sub_1A2CEB914(v4, v31, (uint64_t *)v33);
      sub_1A2CF3D50();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2114;
      id v28 = v20;
      uint64_t v32 = _swift_stdlib_bridgeErrorToNSError();
      sub_1A2CF3D50();
      *uint64_t v26 = v32;

      _os_log_impl(&dword_1A2CAD000, v23, v24, "Error acquiring RBSAssertion. Name=%{public}s, Error=%{public}@", (uint8_t *)v25, 0x16u);
      sub_1A2CEC354();
      swift_arrayDestroy();
      MEMORY[0x1A623FB80](v26, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1A623FB80](v27, -1, -1);
      MEMORY[0x1A623FB80](v25, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
}

uint64_t sub_1A2CBBAB0(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_1A2CBBAF0(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_1A2CBBB30()
{
  unint64_t result = qword_1EB5A67F0;
  if (!qword_1EB5A67F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A67F0);
  }
  return result;
}

unint64_t sub_1A2CBBB7C()
{
  unint64_t result = qword_1EB5A67E8;
  if (!qword_1EB5A67E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A67E8);
  }
  return result;
}

uint64_t sub_1A2CBBBC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A2CB7BBC(a1, a2, a3, (uint64_t (*)(void))sub_1A2CAFD2C, (uint64_t (*)(void))sub_1A2CBBB30);
}

uint64_t Database.deinit()
{
  swift_release();

  return v0;
}

uint64_t Database.__deallocating_deinit()
{
  Database.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Database()
{
  return self;
}

void type metadata accessor for Database.CacheSize()
{
}

uint64_t dispatch thunk of Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)()
{
  OUTLINED_FUNCTION_34();
  return v0();
}

void Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)()
{
}

uint64_t destroy for Database.Location(uint64_t a1)
{
  return sub_1A2CBBD20(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1A2CBBD04(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t sub_1A2CBBD20(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void type metadata accessor for Database.Location()
{
}

uint64_t sub_1A2CBBD44()
{
  uint64_t v1 = sub_1A2CF34C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v3 = v2;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = *(void *)v0;
  if (!*(unsigned char *)(v0 + 16))
  {
    swift_bridgeObjectRetain();
    return v10;
  }
  if (*(unsigned char *)(v0 + 16) != 1) {
    return 0x3A79726F6D656D3ALL;
  }
  os_log_type_t v11 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  uint64_t v12 = sub_1A2CF3AB0();

  if (*(void *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1A2CF3490();
    swift_bridgeObjectRelease();
    sub_1A2CF34A0();
    uint64_t v10 = sub_1A2CF34B0();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
    v13(v7, v1);
    v13(v9, v1);
    return v10;
  }
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t Database.table<A>(_:)()
{
  uint64_t v2 = *(void *)(v0 + 16);
  if (v2)
  {
    type metadata accessor for Table();
    uint64_t v7 = type metadata accessor for Connection();
    uint64_t v8 = &off_1EF5DFB58;
    *(void *)&long long v6 = v2;
    uint64_t v1 = sub_1A2CAF090(&v6);
    swift_retain();
  }
  else
  {
    sub_1A2CCE7A8();
    uint64_t v3 = OUTLINED_FUNCTION_12_1();
    OUTLINED_FUNCTION_16_1(v3, v4);
  }
  return v1;
}

uint64_t sub_1A2CBBF90(unsigned char *a1, sqlite3 *a2)
{
  int v4 = *a1;
  uint64_t v5 = *(void *)(v2 + 16);
  if (v5 && (*(void *)(v5 + 16) & 0x10) != 0)
  {
    sub_1A2CB859C();
    if (v4) {
      goto LABEL_4;
    }
LABEL_6:
    long long v6 = a2;
    goto LABEL_7;
  }
  if (!*a1) {
    goto LABEL_6;
  }
LABEL_4:
  long long v6 = a2;
LABEL_7:
  sub_1A2CAF5FC(v6);
  return swift_release();
}

void type metadata accessor for Database.JournalingMode()
{
}

uint64_t sub_1A2CBC070(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

uint64_t sub_1A2CBC090(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_1A2CBC0AC(unsigned char *result, char a2)
{
  char *result = a2 & 1;
  return result;
}

void type metadata accessor for Database.RecoveryMode()
{
}

void type metadata accessor for Database.VacuumMode()
{
}

uint64_t sub_1A2CBC0D0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_1A2CDF540();
  }
  return result;
}

uint64_t type metadata accessor for Create()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBC100(char a1)
{
  uint64_t v3 = sub_1A2CB489C();
  uint64_t v5 = v4;
  sub_1A2CBDA4C(0, a1);
  sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
  sub_1A2CB0330();
  *(void *)&v21[0] = sub_1A2CF3900();
  *((void *)&v21[0] + 1) = v6;
  swift_bridgeObjectRetain();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v7 = v21[0];
  sub_1A2CB37E4(v1 + 16, (uint64_t)v21);
  sub_1A2CB3174(0, (unint64_t *)&qword_1EB5A6880, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1EF5E1058, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Statement);
  swift_allocObject();
  sub_1A2CAF0D4(0, v7, *((uint64_t *)&v7 + 1), v21);
  uint64_t v8 = sub_1A2CB2F04((uint64_t)v3, v5);
  uint64_t v9 = sub_1A2CAF6B8(v8, (uint64_t (*)(void, void, uint64_t))sub_1A2CAF814);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    os_log_type_t v11 = (uint64_t *)(v9 + 40);
    uint64_t v12 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v13 = *(v11 - 1);
      if (v13)
      {
        uint64_t v14 = *v11;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A2CB7998();
          uint64_t v12 = v17;
        }
        unint64_t v15 = *(void *)(v12 + 16);
        if (v15 >= *(void *)(v12 + 24) >> 1)
        {
          sub_1A2CB7998();
          uint64_t v12 = v18;
        }
        *(void *)(v12 + 16) = v15 + 1;
        uint64_t v16 = v12 + 16 * v15;
        *(void *)(v16 + 32) = v13;
        *(void *)(v16 + 40) = v14;
      }
      v11 += 2;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_1A2CB7874();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_1A2CBC39C(uint64_t a1, char a2)
{
  char v4 = a1;
  uint64_t v5 = *(void *)(*(void *)v2 + 80);
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](a1);
  long long v7 = (char *)&v28 - v6;
  uint64_t v9 = *(void *)(v8 + 88);
  (*(void (**)(uint64_t, void))(*(void *)(v9 + 24) + 8))(v5, *(void *)(v9 + 24));
  type metadata accessor for Statement();
  char v34 = 0;
  sub_1A2CBDA48(0, v4, v5, v9);
  uint64_t v10 = sub_1A2CBDA00();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v2 + 16, (uint64_t)v33);
  uint64_t v13 = sub_1A2CAEF50(&v34, v10, v12, v33);
  uint64_t v14 = sub_1A2CB32CC(v5);
  uint64_t v30 = v2;
  char v31 = v4;
  char v32 = a2;
  uint64_t v15 = sub_1A2CAF6B8(v14, (uint64_t (*)(void, void, uint64_t))sub_1A2CAFB5C);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    uint64_t v28 = v13;
    swift_bridgeObjectRetain();
    uint64_t v17 = (uint64_t *)(v15 + 40);
    uint64_t v18 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v19 = *(v17 - 1);
      if (v19)
      {
        uint64_t v20 = *v17;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_9_7();
          sub_1A2CB7998();
          uint64_t v18 = v24;
        }
        unint64_t v22 = *(void *)(v18 + 16);
        unint64_t v21 = *(void *)(v18 + 24);
        if (v22 >= v21 >> 1)
        {
          OUTLINED_FUNCTION_23_1(v21);
          sub_1A2CB7998();
          uint64_t v18 = v25;
        }
        *(void *)(v18 + 16) = v22 + 1;
        uint64_t v23 = v18 + 16 * v22;
        *(void *)(v23 + 32) = v19;
        *(void *)(v23 + 40) = v20;
      }
      v17 += 2;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_1A2CB7874();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v5);
  return v26;
}

uint64_t dispatch thunk of Create.table(ifNotExists:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t sub_1A2CBC698(char a1)
{
  return sub_1A2CBCEB4(a1, 1);
}

uint64_t sub_1A2CBC6B4(char a1, char a2)
{
  uint64_t v4 = v2;
  uint64_t result = sub_1A2CBC998(a2, v4);
  if (!v3)
  {
    uint64_t v9 = result;
    unint64_t v10 = v8;
    sub_1A2CBC100(a1 & 1);
    sub_1A2CB0944();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_1A2CB03CC(a1 & 1);
    swift_retain();
    unint64_t v13 = sub_1A2CBA884(v12, v4);
    swift_bridgeObjectRelease();
    if (v13 >> 62) {
      goto LABEL_28;
    }
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      uint64_t v22 = v4;
      uint64_t v23 = v9;
      unint64_t v24 = v10;
      if (!v14) {
        break;
      }
      unint64_t v10 = v13 & 0xC000000000000001;
      uint64_t v9 = 4;
      while (1)
      {
        if (v10) {
          MEMORY[0x1A623F150](v9 - 4, v13);
        }
        else {
          swift_retain();
        }
        uint64_t v4 = v9 - 3;
        if (__OFADD__(v9 - 4, 1)) {
          break;
        }
        sub_1A2CB0944();
        OUTLINED_FUNCTION_25_1();
        swift_bridgeObjectRelease();
        ++v9;
        if (v4 == v14) {
          goto LABEL_13;
        }
      }
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_1A2CF3F40();
      swift_bridgeObjectRelease();
    }
LABEL_13:
    swift_bridgeObjectRelease();
    if ((a2 & 1) == 0)
    {
      uint64_t v11 = v23;
      return sub_1A2CBBAF0(v11);
    }
    if (!v23) {
      goto LABEL_21;
    }
    OUTLINED_FUNCTION_19();
    uint64_t v15 = *(void *)(v24 + 32);
    swift_retain();
    sub_1A2CBBAB0(v23);
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_19();
    uint64_t v17 = *(void *)(v15 + 24);
    uint64_t v16 = *(void *)(v15 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    if (!v16) {
      goto LABEL_21;
    }
    if (v17 == 0x302E302E30 && v16 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_26_1();
      char v19 = sub_1A2CF4080();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {
LABEL_21:
        if (*(void *)(v22 + 56))
        {
          swift_retain();
          OUTLINED_FUNCTION_26_1();
          uint64_t v20 = sub_1A2CE1370();
          sub_1A2CEF8A8((uint64_t)v20, v21);
          sub_1A2CBBAF0(v23);
          swift_release();
          swift_release();
          return swift_release();
        }
      }
    }
    uint64_t v11 = v23;
    return sub_1A2CBBAF0(v11);
  }
  return result;
}

uint64_t sub_1A2CBC998(char a1, uint64_t a2)
{
  if ((a1 & 1) == 0 || !*(void *)(a2 + 56)) {
    return 0;
  }
  swift_retain();
  sub_1A2CBC6B4(1, 1);
  swift_release();
  if (!v2)
  {
    uint64_t v14 = MEMORY[0x1E4FBB1A0];
    uint64_t v15 = &protocol witness table for String;
    strcpy((char *)&v13, "table_versions");
    HIBYTE(v13) = -18;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = 25705;
    *(void *)(v5 + 24) = 0xE200000000000000;
    sub_1A2CB377C(&v13, v5 + 32);
    swift_retain();
    uint64_t v3 = sub_1A2CBD510(v5, 0, 0, 0xFFu);
    uint64_t v7 = v6;
    swift_release();
    swift_release();
    if (v3)
    {
      swift_beginAccess();
      uint64_t v9 = *(void *)(v7 + 32);
      swift_beginAccess();
      uint64_t v10 = *(void *)(v9 + 32);
      if (v10
        && (*(void *)(v9 + 24) == 0x302E302E30 ? (BOOL v11 = v10 == 0xE500000000000000) : (BOOL v11 = 0),
            v11 || (sub_1A2CF4080() & 1) != 0))
      {
        sub_1A2CBBAB0(v3);
        swift_release();
        swift_release();
      }
      else
      {
        sub_1A2CB37E4(a2 + 16, (uint64_t)&v13);
        sub_1A2CF0FB4();
        uint64_t v12 = swift_initStackObject() + 16;
        sub_1A2CB377C(&v13, v12);
        sub_1A2CBBAB0(v3);
        sub_1A2CEFB58(1);
        swift_setDeallocating();
        __swift_destroy_boxed_opaque_existential_1(v12);
        swift_release();
        swift_release();
      }
    }
  }
  return v3;
}

uint64_t sub_1A2CBCBEC(char a1, uint64_t *a2)
{
  if ((a1 & 1) == 0 || !a2[7]) {
    return 0;
  }
  uint64_t v5 = *a2;
  swift_retain();
  sub_1A2CBC6B4(1, 1);
  swift_release();
  if (!v2)
  {
    uint64_t v6 = *(void *)(v5 + 80);
    uint64_t v7 = *(void *)(v5 + 88);
    unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 32);
    swift_retain();
    uint64_t v9 = v8(v6, v7);
    uint64_t v23 = MEMORY[0x1E4FBB1A0];
    unint64_t v24 = &protocol witness table for String;
    *(void *)&long long v22 = v9;
    *((void *)&v22 + 1) = v10;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = 25705;
    *(void *)(v11 + 24) = 0xE200000000000000;
    sub_1A2CB377C(&v22, v11 + 32);
    uint64_t v3 = sub_1A2CBD510(v11, 0, 0, 0xFFu);
    uint64_t v13 = v12;
    swift_release();
    swift_release();
    if (v3)
    {
      swift_beginAccess();
      uint64_t v15 = *(void *)(v13 + 32);
      swift_beginAccess();
      uint64_t v16 = *(void *)(v15 + 32);
      uint64_t v21 = *(void *)(v15 + 24);
      uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 40);
      sub_1A2CBBAB0(v3);
      swift_bridgeObjectRetain();
      uint64_t v17 = v25(v6, v7);
      if (v16)
      {
        if (v21 == v17 && v16 == v18)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_19:
          swift_release();
          swift_release();
          return v3;
        }
        char v20 = sub_1A2CF4080();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_19;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      type metadata accessor for Drop();
      sub_1A2CB37E4((uint64_t)(a2 + 2), (uint64_t)&v22);
      sub_1A2CAF090(&v22);
      sub_1A2CED74C(1);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  return v3;
}

uint64_t sub_1A2CBCEB4(char a1, char a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v4;
  uint64_t result = sub_1A2CBCBEC(a2, v4);
  if (!v3)
  {
    uint64_t v10 = result;
    uint64_t v11 = v9;
    uint64_t v12 = sub_1A2CBC39C(a1 & 1, a2 & 1);
    sub_1A2CB0EB0(v12);
    swift_release();
    uint64_t v33 = v11;
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_1A2CBD238(a1 & 1);
    uint64_t v30 = *(void *)(v7 + 88);
    uint64_t v31 = *(void *)(v7 + 80);
    uint64_t v14 = type metadata accessor for Statement();
    v32[0] = sub_1A2CF3AC0();
    if (v32[0] != MEMORY[0x1A623EE80](v13, v14))
    {
      do
      {
        char v19 = sub_1A2CF3B10();
        sub_1A2CF3AF0();
        if (v19) {
          swift_retain();
        }
        else {
          sub_1A2CF3DF0();
        }
        swift_bridgeObjectRetain();
        MEMORY[0x1A623EE90](v32, v13, v14);
        uint64_t v20 = swift_bridgeObjectRelease();
        sub_1A2CB0EB0(v20);
        OUTLINED_FUNCTION_25_1();
        swift_bridgeObjectRelease();
        uint64_t v21 = v32[0];
      }
      while (v21 != MEMORY[0x1A623EE80](v13, v14));
    }
    swift_bridgeObjectRelease();
    if ((a2 & 1) == 0) {
      return sub_1A2CBBAF0(v10);
    }
    uint64_t v15 = v33;
    if (v10)
    {
      OUTLINED_FUNCTION_19();
      uint64_t v16 = *(void *)(v15 + 32);
      sub_1A2CBBAB0(v10);
      swift_retain();
      swift_release();
      swift_release();
      OUTLINED_FUNCTION_19();
      uint64_t v18 = *(void *)(v16 + 24);
      uint64_t v17 = *(void *)(v16 + 32);
      swift_bridgeObjectRetain();
      swift_release();
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v17 = 0;
    }
    long long v22 = *(uint64_t (**)(void))(v30 + 40);
    uint64_t v23 = v22();
    if (v17)
    {
      if (v18 == v23 && v17 == v24)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return sub_1A2CBBAF0(v10);
      }
      char v26 = OUTLINED_FUNCTION_12_7();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v26) {
        return sub_1A2CBBAF0(v10);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (v4[7])
    {
      uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v30 + 32);
      swift_retain();
      v27(v31, v30);
      ((void (*)(uint64_t, uint64_t))v22)(v31, v30);
      uint64_t v28 = sub_1A2CE1370();
      sub_1A2CEF8A8((uint64_t)v28, v29);
      sub_1A2CBBAF0(v10);
      swift_release();
      swift_release();
      return swift_release();
    }
    return sub_1A2CBBAF0(v10);
  }
  return result;
}

uint64_t sub_1A2CBD238(uint64_t a1)
{
  sub_1A2CB05C8(a1, *(void *)(*(void *)v1 + 80), *(void *)(*(void *)v1 + 88));
  type metadata accessor for CreateIndexCommand();
  uint64_t v2 = sub_1A2CF3B50();
  uint64_t v3 = type metadata accessor for Statement();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v6 = sub_1A2CBAA68((void (*)(char *, char *))sub_1A2CF1038, v1, v2, v3, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v5);
  swift_bridgeObjectRelease();
  return v6;
}

void *sub_1A2CBD344(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = (void *)swift_allocObject();
  sub_1A2CB377C(a1, (uint64_t)(v8 + 2));
  v8[7] = a2;
  v8[8] = a3;
  v8[9] = a4;
  return v8;
}

uint64_t sub_1A2CBD3AC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Table()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of Table.create.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t sub_1A2CBD42C()
{
  OUTLINED_FUNCTION_0_13();
  v4(0, *(void *)(v2 + 80), *(void *)(*(void *)(v3 + 88) + 8));
  sub_1A2CB37E4(v1, (uint64_t)v6);
  return v0(v6);
}

uint64_t dispatch thunk of Table.query.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1A2CBD4CC()
{
  return sub_1A2CBD42C();
}

uint64_t type metadata accessor for Query()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBD510(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v6 = v4;
  swift_retain();
  sub_1A2CBC0D0(a2, a3, a4);
  sub_1A2CBE8C0(42, 0xE100000000000000, a1, a2, a3, a4, 1, 0);
  sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
  sub_1A2CB0330();
  *(void *)&v16[0] = sub_1A2CF3900();
  *((void *)&v16[0] + 1) = v11;
  swift_bridgeObjectRetain();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v12 = v16[0];
  sub_1A2CB37E4(v6 + 16, (uint64_t)v16);
  sub_1A2CB3174(0, (unint64_t *)&qword_1EB5A6880, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1EF5E1058, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Statement);
  swift_initStackObject();
  uint64_t v13 = sub_1A2CAF0D4(4, v12, *((uint64_t *)&v12 + 1), v16);
  uint64_t v14 = sub_1A2CB0944();
  swift_release();
  if (!v5)
  {
    if (*(void *)(v14 + 16))
    {
      uint64_t v13 = *(void *)(v14 + 32);
      swift_retain();
      swift_retain();
    }
    else
    {
      uint64_t v13 = 0;
    }
    swift_bridgeObjectRelease();
  }
  return v13;
}

uint64_t dispatch thunk of Query.all()()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1A2CBD714()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = type metadata accessor for Statement();
  char v15 = 4;
  unint64_t v14 = 0xF000000000000007;
  long long v12 = 0uLL;
  char v13 = -1;
  OUTLINED_FUNCTION_4_5(v1);
  sub_1A2CBE7DC();
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v0 + 16, (uint64_t)&v12);
  uint64_t v9 = OUTLINED_FUNCTION_10_3(&v15, v2, v3, v4, v5, v6, v7, v8, v11, v12);
  sub_1A2CB0EB0(v9);
  OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_11_3();
}

uint64_t Save.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CBD828()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Save()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBD884()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CBD8B8(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A2CBD918@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return JSON.init(valueType:connection:)(a1, *(void *)(a2 + 16), a3);
}

uint64_t sub_1A2CBD924()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t JSON.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t type metadata accessor for CreateTableCommand()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBDA00()
{
  return sub_1A2CB02B4();
}

uint64_t sub_1A2CBDA4C(char a1, char a2)
{
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  uint64_t v5 = v4;
  unint64_t v7 = *(void *)(v4 + 16);
  unint64_t v6 = *(void *)(v4 + 24);
  unint64_t v8 = v7 + 1;
  if (v7 >= v6 >> 1)
  {
    sub_1A2CB5734(v6 > 1, v7 + 1, 1, v4);
    uint64_t v5 = v24;
  }
  *(void *)(v5 + 16) = v8;
  uint64_t v9 = v5 + 16 * v7;
  *(void *)(v9 + 32) = 0x455441455243;
  *(void *)(v9 + 40) = 0xE600000000000000;
  if (a1)
  {
    unint64_t v10 = *(void *)(v5 + 24);
    if (v8 >= v10 >> 1)
    {
      sub_1A2CB5734(v10 > 1, v7 + 2, 1, v5);
      uint64_t v5 = v29;
    }
    *(void *)(v5 + 16) = v7 + 2;
    uint64_t v11 = v5 + 16 * v8;
    *(void *)(v11 + 32) = 1347241300;
    *(void *)(v11 + 40) = 0xE400000000000000;
    unint64_t v8 = *(void *)(v5 + 16);
  }
  unint64_t v12 = *(void *)(v5 + 24);
  unint64_t v13 = v8 + 1;
  if (v8 >= v12 >> 1)
  {
    sub_1A2CB5734(v12 > 1, v8 + 1, 1, v5);
    uint64_t v5 = v25;
  }
  *(void *)(v5 + 16) = v13;
  uint64_t v14 = v5 + 16 * v8;
  *(void *)(v14 + 32) = 0x454C424154;
  *(void *)(v14 + 40) = 0xE500000000000000;
  if (a2)
  {
    unint64_t v15 = *(void *)(v5 + 24);
    if (v13 >= v15 >> 1)
    {
      sub_1A2CB5734(v15 > 1, v8 + 2, 1, v5);
      uint64_t v5 = v30;
    }
    *(void *)(v5 + 16) = v8 + 2;
    uint64_t v16 = v5 + 16 * v13;
    strcpy((char *)(v16 + 32), "IF NOT EXISTS");
    *(_WORD *)(v16 + 46) = -4864;
  }
  unint64_t v18 = *(void *)(v5 + 16);
  unint64_t v17 = *(void *)(v5 + 24);
  if (v18 >= v17 >> 1)
  {
    sub_1A2CB5734(v17 > 1, v18 + 1, 1, v5);
    uint64_t v5 = v26;
  }
  *(void *)(v5 + 16) = v18 + 1;
  uint64_t v19 = v5 + 16 * v18;
  strcpy((char *)(v19 + 32), "table_versions");
  *(unsigned char *)(v19 + 47) = -18;
  swift_bridgeObjectRetain();
  sub_1A2CAFD78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1A2CBE0CC();
  swift_bridgeObjectRelease();
  sub_1A2CB4ECC();
  sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
  sub_1A2CB0330();
  sub_1A2CF3900();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1A2CB5734(0, *(void *)(v5 + 16) + 1, 1, v5);
    uint64_t v5 = v27;
  }
  unint64_t v21 = *(void *)(v5 + 16);
  unint64_t v20 = *(void *)(v5 + 24);
  if (v21 >= v20 >> 1)
  {
    sub_1A2CB5734(v20 > 1, v21 + 1, 1, v5);
    uint64_t v5 = v28;
  }
  *(void *)(v5 + 16) = v21 + 1;
  uint64_t v22 = v5 + 16 * v21;
  *(void *)(v22 + 32) = 40;
  *(void *)(v22 + 40) = 0xE100000000000000;
  return v5;
}

uint64_t sub_1A2CBDD88(char a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  uint64_t v9 = v8;
  unint64_t v11 = *(void *)(v8 + 16);
  unint64_t v10 = *(void *)(v8 + 24);
  unint64_t v12 = v11 + 1;
  if (v11 >= v10 >> 1)
  {
    sub_1A2CB5734(v10 > 1, v11 + 1, 1, v8);
    uint64_t v9 = v33;
  }
  *(void *)(v9 + 16) = v12;
  uint64_t v13 = v9 + 16 * v11;
  *(void *)(v13 + 32) = 0x455441455243;
  *(void *)(v13 + 40) = 0xE600000000000000;
  if (a1)
  {
    unint64_t v14 = *(void *)(v9 + 24);
    if (v12 >= v14 >> 1)
    {
      sub_1A2CB5734(v14 > 1, v11 + 2, 1, v9);
      uint64_t v9 = v38;
    }
    *(void *)(v9 + 16) = v11 + 2;
    uint64_t v15 = v9 + 16 * v12;
    *(void *)(v15 + 32) = 1347241300;
    *(void *)(v15 + 40) = 0xE400000000000000;
    unint64_t v12 = *(void *)(v9 + 16);
  }
  unint64_t v16 = *(void *)(v9 + 24);
  unint64_t v17 = v12 + 1;
  if (v12 >= v16 >> 1)
  {
    sub_1A2CB5734(v16 > 1, v12 + 1, 1, v9);
    uint64_t v9 = v34;
  }
  *(void *)(v9 + 16) = v17;
  uint64_t v18 = v9 + 16 * v12;
  *(void *)(v18 + 32) = 0x454C424154;
  *(void *)(v18 + 40) = 0xE500000000000000;
  if (a2)
  {
    unint64_t v19 = *(void *)(v9 + 24);
    if (v17 >= v19 >> 1)
    {
      sub_1A2CB5734(v19 > 1, v12 + 2, 1, v9);
      uint64_t v9 = v39;
    }
    *(void *)(v9 + 16) = v12 + 2;
    uint64_t v20 = v9 + 16 * v17;
    strcpy((char *)(v20 + 32), "IF NOT EXISTS");
    *(_WORD *)(v20 + 46) = -4864;
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  uint64_t v23 = v22;
  unint64_t v25 = *(void *)(v9 + 16);
  unint64_t v24 = *(void *)(v9 + 24);
  if (v25 >= v24 >> 1)
  {
    sub_1A2CB5734(v24 > 1, v25 + 1, 1, v9);
    uint64_t v9 = v35;
  }
  *(void *)(v9 + 16) = v25 + 1;
  uint64_t v26 = v9 + 16 * v25;
  *(void *)(v26 + 32) = v21;
  *(void *)(v26 + 40) = v23;
  uint64_t v27 = swift_bridgeObjectRetain();
  sub_1A2CB5150(v27, a3);
  swift_bridgeObjectRelease();
  uint64_t v28 = swift_bridgeObjectRetain();
  sub_1A2CBE380(v28, a3);
  swift_bridgeObjectRelease();
  sub_1A2CB4ECC();
  sub_1A2CB0380();
  sub_1A2CB0330();
  sub_1A2CF3900();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1A2CB5734(0, *(void *)(v9 + 16) + 1, 1, v9);
    uint64_t v9 = v36;
  }
  unint64_t v30 = *(void *)(v9 + 16);
  unint64_t v29 = *(void *)(v9 + 24);
  if (v30 >= v29 >> 1)
  {
    sub_1A2CB5734(v29 > 1, v30 + 1, 1, v9);
    uint64_t v9 = v37;
  }
  *(void *)(v9 + 16) = v30 + 1;
  uint64_t v31 = v9 + 16 * v30;
  *(void *)(v31 + 32) = 40;
  *(void *)(v31 + 40) = 0xE100000000000000;
  return v9;
}

uint64_t sub_1A2CBE0CC()
{
  uint64_t v0 = sub_1A2CB489C();
  uint64_t v2 = sub_1A2CB2F04((uint64_t)v0, v1);
  uint64_t v3 = sub_1A2CB3CCC(v2);
  uint64_t v4 = sub_1A2CB4AF0(v3);
  swift_bridgeObjectRelease();
  if (*(void *)(v4 + 16))
  {
    sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
    uint64_t v6 = v5;
    unint64_t v8 = *(void *)(v5 + 16);
    unint64_t v7 = *(void *)(v5 + 24);
    int64_t v9 = v7 >> 1;
    unint64_t v10 = v8 + 1;
    if (v7 >> 1 <= v8)
    {
      sub_1A2CB5734(v7 > 1, v8 + 1, 1, v5);
      uint64_t v6 = v26;
      unint64_t v7 = *(void *)(v26 + 24);
      int64_t v9 = v7 >> 1;
    }
    *(void *)(v6 + 16) = v10;
    uint64_t v11 = v6 + 16 * v8;
    *(void *)(v11 + 32) = 0x5952414D495250;
    *(void *)(v11 + 40) = 0xE700000000000000;
    uint64_t v12 = v8 + 2;
    if (v9 < v12)
    {
      sub_1A2CB5734(v7 > 1, v12, 1, v6);
      uint64_t v6 = v27;
    }
    *(void *)(v6 + 16) = v12;
    uint64_t v13 = v6 + 16 * v10;
    *(void *)(v13 + 32) = 5850443;
    *(void *)(v13 + 40) = 0xE300000000000000;
    sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
    sub_1A2CB0330();
    sub_1A2CF3900();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    unint64_t v15 = *(void *)(v6 + 16);
    unint64_t v14 = *(void *)(v6 + 24);
    if (v15 >= v14 >> 1)
    {
      sub_1A2CB5734(v14 > 1, v15 + 1, 1, v6);
      uint64_t v6 = v28;
    }
    *(void *)(v6 + 16) = v15 + 1;
    uint64_t v16 = v6 + 16 * v15;
    *(void *)(v16 + 32) = 40;
    *(void *)(v16 + 40) = 0xE100000000000000;
    uint64_t v17 = sub_1A2CF3900();
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
    uint64_t v21 = v20;
    unint64_t v23 = *(void *)(v20 + 16);
    unint64_t v22 = *(void *)(v20 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_1A2CB5734(v22 > 1, v23 + 1, 1, v20);
      uint64_t v21 = v29;
    }
    *(void *)(v21 + 16) = v23 + 1;
    unint64_t v24 = v21 + 16 * v23;
    *(void *)(v24 + 32) = v17;
    *(void *)(v24 + 40) = v19;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x1E4FBC860];
  }
  swift_release();
  swift_release();
  return v21;
}

uint64_t sub_1A2CBE380(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1F4188790](a1);
  (*(void (**)(uint64_t, void))(*(void *)(v3 + 24) + 8))(v4, *(void *)(v3 + 24));
  uint64_t v5 = sub_1A2CB32CC(a2);
  uint64_t v6 = sub_1A2CB3CCC(v5);
  uint64_t v7 = sub_1A2CB4AF0(v6);
  swift_bridgeObjectRelease();
  if (*(void *)(v7 + 16))
  {
    sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
    uint64_t v9 = v8;
    unint64_t v11 = *(void *)(v8 + 16);
    unint64_t v10 = *(void *)(v8 + 24);
    int64_t v12 = v10 >> 1;
    unint64_t v13 = v11 + 1;
    if (v10 >> 1 <= v11)
    {
      OUTLINED_FUNCTION_2_9(v10);
      uint64_t v9 = v33;
      unint64_t v10 = *(void *)(v33 + 24);
      int64_t v12 = v10 >> 1;
    }
    *(void *)(v9 + 16) = v13;
    uint64_t v14 = v9 + 16 * v11;
    *(void *)(v14 + 32) = 0x5952414D495250;
    *(void *)(v14 + 40) = 0xE700000000000000;
    int64_t v15 = v11 + 2;
    if (v12 < v15)
    {
      OUTLINED_FUNCTION_1_10(v10);
      uint64_t v9 = v34;
    }
    *(void *)(v9 + 16) = v15;
    uint64_t v16 = v9 + 16 * v13;
    *(void *)(v16 + 32) = 5850443;
    *(void *)(v16 + 40) = 0xE300000000000000;
    sub_1A2CB0380();
    sub_1A2CB0330();
    sub_1A2CF3900();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    unint64_t v18 = *(void *)(v9 + 16);
    unint64_t v17 = *(void *)(v9 + 24);
    if (v18 >= v17 >> 1)
    {
      OUTLINED_FUNCTION_2_9(v17);
      uint64_t v9 = v35;
    }
    *(void *)(v9 + 16) = v18 + 1;
    uint64_t v19 = v9 + 16 * v18;
    *(void *)(v19 + 32) = 40;
    *(void *)(v19 + 40) = 0xE100000000000000;
    uint64_t v20 = sub_1A2CF3900();
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
    uint64_t v24 = v23;
    unint64_t v26 = *(void *)(v23 + 16);
    unint64_t v25 = *(void *)(v23 + 24);
    if (v26 >= v25 >> 1)
    {
      OUTLINED_FUNCTION_1_10(v25);
      uint64_t v24 = v36;
    }
    *(void *)(v24 + 16) = v26 + 1;
    uint64_t v27 = v24 + 16 * v26;
    *(void *)(v27 + 32) = v20;
    *(void *)(v27 + 40) = v22;
    uint64_t v28 = OUTLINED_FUNCTION_0_6();
    v29(v28);
  }
  else
  {
    uint64_t v30 = OUTLINED_FUNCTION_0_6();
    v31(v30);
    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  return v24;
}

uint64_t type metadata accessor for CreateIndexCommand()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBE674(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1A2CBE6A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1A2CBE6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

unint64_t sub_1A2CBE714()
{
  unint64_t result = qword_1EB5A69F0;
  if (!qword_1EB5A69F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A69F0);
  }
  return result;
}

unint64_t sub_1A2CBE760()
{
  unint64_t result = qword_1EB5A69E8;
  if (!qword_1EB5A69E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A69E8);
  }
  return result;
}

void static AssertionOptions.immediate.getter(void *a1@<X8>)
{
}

void static AssertionOptions.write.getter(void *a1@<X8>)
{
}

void static AssertionOptions.close.getter(void *a1@<X8>)
{
}

uint64_t type metadata accessor for SelectCommand()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBE7DC()
{
  return sub_1A2CB02B4();
}

uint64_t sub_1A2CBE824(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  char v9 = a4 & 1;
  uint64_t v10 = *(void *)a2;
  uint64_t v11 = *(void *)(a2 + 8);
  unsigned __int8 v12 = *(unsigned char *)(a2 + 16);
  uint64_t v16 = *a1;
  v14[0] = v10;
  v14[1] = v11;
  unsigned __int8 v15 = v12;
  sub_1A2CBF1D0(v16);
  sub_1A2CBC0D0(v10, v11, v12);
  return sub_1A2CBEC30(42, 0xE100000000000000, &v16, (uint64_t)v14, a3, v9, a5, a6);
}

uint64_t sub_1A2CBE8C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, char a8)
{
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  uint64_t v16 = v15;
  unint64_t v18 = *(void *)(v15 + 16);
  unint64_t v17 = *(void *)(v15 + 24);
  int64_t v19 = v17 >> 1;
  unint64_t v20 = v18 + 1;
  if (v17 >> 1 <= v18)
  {
    OUTLINED_FUNCTION_2_14(v17 > 1, v18 + 1);
    OUTLINED_FUNCTION_8_10();
  }
  *(void *)(v16 + 16) = v20;
  uint64_t v21 = v16 + 16 * v18;
  *(void *)(v21 + 32) = 0x5443454C4553;
  *(void *)(v21 + 40) = 0xE600000000000000;
  int64_t v22 = v18 + 2;
  if (v19 < v22)
  {
    OUTLINED_FUNCTION_0_15(v17);
    uint64_t v16 = v58;
  }
  *(void *)(v16 + 16) = v22;
  uint64_t v23 = v16 + 16 * v20;
  *(void *)(v23 + 32) = a1;
  *(void *)(v23 + 40) = a2;
  OUTLINED_FUNCTION_7_12();
  if (!(!v27 & v26))
  {
    OUTLINED_FUNCTION_2_14(v24 > 1, a2);
    OUTLINED_FUNCTION_8_10();
  }
  *(void *)(v16 + 16) = a2;
  uint64_t v28 = v16 + 16 * v22;
  *(void *)(v28 + 32) = 1297044038;
  *(void *)(v28 + 40) = 0xE400000000000000;
  if (v25 < v22 + 2)
  {
    OUTLINED_FUNCTION_0_15(v24);
    uint64_t v16 = v59;
  }
  OUTLINED_FUNCTION_11_8();
  strcpy((char *)(v29 + 32), "table_versions");
  *(unsigned char *)(v29 + 47) = -18;
  if ((~a3 & 0xF000000000000007) != 0)
  {
    OUTLINED_FUNCTION_13_5();
    if (v26)
    {
      OUTLINED_FUNCTION_0_15(v30);
      uint64_t v16 = v61;
    }
    OUTLINED_FUNCTION_11_8();
    *(void *)(v31 + 32) = 0x4552454857;
    *(void *)(v31 + 40) = 0xE500000000000000;
    a2 = sub_1A2CBF200();
    uint64_t v33 = v32;
    unint64_t v35 = *(void *)(v16 + 16);
    unint64_t v34 = *(void *)(v16 + 24);
    if (v35 >= v34 >> 1)
    {
      OUTLINED_FUNCTION_0_15(v34);
      uint64_t v16 = v62;
    }
    *(void *)(v16 + 16) = v35 + 1;
    uint64_t v36 = v16 + 16 * v35;
    *(void *)(v36 + 32) = a2;
    *(void *)(v36 + 40) = v33;
    sub_1A2CBF1E8(a3);
  }
  if (a6 != 0xFF)
  {
    OUTLINED_FUNCTION_13_5();
    if (v26)
    {
      OUTLINED_FUNCTION_0_15(v37);
      uint64_t v16 = v60;
    }
    OUTLINED_FUNCTION_11_8();
    *(void *)(v38 + 32) = 0x594220524544524FLL;
    *(void *)(v38 + 40) = 0xE800000000000000;
    if (a6)
    {
      sub_1A2CDF540();
      OUTLINED_FUNCTION_7_12();
      if (!(!v27 & v26))
      {
        OUTLINED_FUNCTION_2_14(v46 > 1, a2);
        OUTLINED_FUNCTION_8_10();
      }
      OUTLINED_FUNCTION_14_4();
      if (v41 != v42)
      {
        OUTLINED_FUNCTION_0_15(v47);
        uint64_t v16 = v66;
      }
      OUTLINED_FUNCTION_11_8();
      *(void *)(v48 + 32) = 4412225;
      uint64_t v44 = v48 + 32;
      unint64_t v45 = 0xE300000000000000;
    }
    else
    {
      sub_1A2CDF540();
      OUTLINED_FUNCTION_7_12();
      if (!(!v27 & v26))
      {
        OUTLINED_FUNCTION_2_14(v39 > 1, a2);
        OUTLINED_FUNCTION_8_10();
      }
      OUTLINED_FUNCTION_14_4();
      if (v41 != v42)
      {
        OUTLINED_FUNCTION_0_15(v40);
        uint64_t v16 = v65;
      }
      OUTLINED_FUNCTION_11_8();
      *(void *)(v43 + 32) = 1129530692;
      uint64_t v44 = v43 + 32;
      unint64_t v45 = 0xE400000000000000;
    }
    *(void *)(v44 + 8) = v45;
    sub_1A2CDF7D4(a4, a5, a6);
  }
  if ((a8 & 1) == 0)
  {
    OUTLINED_FUNCTION_13_5();
    if (v26)
    {
      OUTLINED_FUNCTION_0_15(v49);
      uint64_t v16 = v63;
    }
    OUTLINED_FUNCTION_11_8();
    *(void *)(v50 + 32) = 0x54494D494CLL;
    *(void *)(v50 + 40) = 0xE500000000000000;
    uint64_t v51 = sub_1A2CF4040();
    uint64_t v53 = v52;
    unint64_t v55 = *(void *)(v16 + 16);
    unint64_t v54 = *(void *)(v16 + 24);
    if (v55 >= v54 >> 1)
    {
      OUTLINED_FUNCTION_2_14(v54 > 1, v55 + 1);
      uint64_t v16 = v64;
    }
    *(void *)(v16 + 16) = v55 + 1;
    uint64_t v56 = v16 + 16 * v55;
    *(void *)(v56 + 32) = v51;
    *(void *)(v56 + 40) = v53;
  }
  return v16;
}

uint64_t sub_1A2CBEC30(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = *a3;
  uint64_t v14 = *(void *)a4;
  uint64_t v85 = *(void *)(a4 + 8);
  int v84 = *(unsigned __int8 *)(a4 + 16);
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  uint64_t v16 = v15;
  unint64_t v18 = *(void *)(v15 + 16);
  unint64_t v17 = *(void *)(v15 + 24);
  int64_t v19 = v17 >> 1;
  unint64_t v20 = v18 + 1;
  if (v17 >> 1 <= v18)
  {
    sub_1A2CB5734(v17 > 1, v18 + 1, 1, v15);
    uint64_t v16 = v71;
    unint64_t v17 = *(void *)(v71 + 24);
    int64_t v19 = v17 >> 1;
  }
  *(void *)(v16 + 16) = v20;
  uint64_t v21 = v16 + 16 * v18;
  *(void *)(v21 + 32) = 0x5443454C4553;
  *(void *)(v21 + 40) = 0xE600000000000000;
  uint64_t v22 = v18 + 2;
  if (v19 < v22)
  {
    sub_1A2CB5734(v17 > 1, v22, 1, v16);
    uint64_t v16 = v72;
  }
  *(void *)(v16 + 16) = v22;
  uint64_t v23 = v16 + 16 * v20;
  *(void *)(v23 + 32) = a1;
  *(void *)(v23 + 40) = a2;
  unint64_t v25 = *(void *)(v16 + 16);
  unint64_t v24 = *(void *)(v16 + 24);
  if (v25 >= v24 >> 1)
  {
    sub_1A2CB5734(v24 > 1, v25 + 1, 1, v16);
    uint64_t v16 = v73;
  }
  *(void *)(v16 + 16) = v25 + 1;
  uint64_t v26 = v16 + 16 * v25;
  *(void *)(v26 + 32) = 1297044038;
  *(void *)(v26 + 40) = 0xE400000000000000;
  uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 32))(a7, a8);
  uint64_t v29 = v28;
  unint64_t v31 = *(void *)(v16 + 16);
  unint64_t v30 = *(void *)(v16 + 24);
  unint64_t v32 = v31 + 1;
  if (v31 >= v30 >> 1)
  {
    sub_1A2CB5734(v30 > 1, v31 + 1, 1, v16);
    uint64_t v16 = v74;
  }
  *(void *)(v16 + 16) = v32;
  uint64_t v33 = v16 + 16 * v31;
  *(void *)(v33 + 32) = v27;
  *(void *)(v33 + 40) = v29;
  if ((~v13 & 0xF000000000000007) != 0)
  {
    unint64_t v34 = *(void *)(v16 + 24);
    if (v32 >= v34 >> 1)
    {
      sub_1A2CB5734(v34 > 1, v31 + 2, 1, v16);
      uint64_t v16 = v76;
    }
    *(void *)(v16 + 16) = v31 + 2;
    uint64_t v35 = v16 + 16 * v32;
    *(void *)(v35 + 32) = 0x4552454857;
    *(void *)(v35 + 40) = 0xE500000000000000;
    uint64_t v36 = sub_1A2CBF200();
    uint64_t v38 = v37;
    unint64_t v40 = *(void *)(v16 + 16);
    unint64_t v39 = *(void *)(v16 + 24);
    if (v40 >= v39 >> 1)
    {
      sub_1A2CB5734(v39 > 1, v40 + 1, 1, v16);
      uint64_t v16 = v77;
    }
    *(void *)(v16 + 16) = v40 + 1;
    uint64_t v41 = v16 + 16 * v40;
    *(void *)(v41 + 32) = v36;
    *(void *)(v41 + 40) = v38;
    sub_1A2CBF1E8(v13);
  }
  if (v84 != 255)
  {
    unint64_t v43 = *(void *)(v16 + 16);
    unint64_t v42 = *(void *)(v16 + 24);
    if (v43 >= v42 >> 1)
    {
      sub_1A2CB5734(v42 > 1, v43 + 1, 1, v16);
      uint64_t v16 = v75;
    }
    *(void *)(v16 + 16) = v43 + 1;
    uint64_t v44 = v16 + 16 * v43;
    *(void *)(v44 + 32) = 0x594220524544524FLL;
    *(void *)(v44 + 40) = 0xE800000000000000;
    if (v84)
    {
      sub_1A2CDF540();
      unint64_t v55 = *(void *)(v16 + 16);
      unint64_t v54 = *(void *)(v16 + 24);
      int64_t v56 = v54 >> 1;
      unint64_t v57 = v55 + 1;
      if (v54 >> 1 <= v55)
      {
        sub_1A2CB5734(v54 > 1, v55 + 1, 1, v16);
        uint64_t v16 = v82;
        unint64_t v54 = *(void *)(v82 + 24);
        int64_t v56 = v54 >> 1;
      }
      *(void *)(v16 + 16) = v57;
      uint64_t v58 = v16 + 16 * v55;
      *(void *)(v58 + 32) = v14;
      *(void *)(v58 + 40) = v85;
      uint64_t v59 = v55 + 2;
      if (v56 < v59)
      {
        sub_1A2CB5734(v54 > 1, v59, 1, v16);
        uint64_t v16 = v83;
      }
      *(void *)(v16 + 16) = v59;
      uint64_t v60 = v16 + 16 * v57;
      *(void *)(v60 + 32) = 4412225;
      uint64_t v52 = v60 + 32;
      unint64_t v53 = 0xE300000000000000;
    }
    else
    {
      sub_1A2CDF540();
      unint64_t v46 = *(void *)(v16 + 16);
      unint64_t v45 = *(void *)(v16 + 24);
      int64_t v47 = v45 >> 1;
      unint64_t v48 = v46 + 1;
      if (v45 >> 1 <= v46)
      {
        sub_1A2CB5734(v45 > 1, v46 + 1, 1, v16);
        uint64_t v16 = v80;
        unint64_t v45 = *(void *)(v80 + 24);
        int64_t v47 = v45 >> 1;
      }
      *(void *)(v16 + 16) = v48;
      uint64_t v49 = v16 + 16 * v46;
      *(void *)(v49 + 32) = v14;
      *(void *)(v49 + 40) = v85;
      uint64_t v50 = v46 + 2;
      if (v47 < v50)
      {
        sub_1A2CB5734(v45 > 1, v50, 1, v16);
        uint64_t v16 = v81;
      }
      *(void *)(v16 + 16) = v50;
      uint64_t v51 = v16 + 16 * v48;
      *(void *)(v51 + 32) = 1129530692;
      uint64_t v52 = v51 + 32;
      unint64_t v53 = 0xE400000000000000;
    }
    *(void *)(v52 + 8) = v53;
    sub_1A2CDF7D4(v14, v85, v84);
  }
  if ((a6 & 1) == 0)
  {
    unint64_t v62 = *(void *)(v16 + 16);
    unint64_t v61 = *(void *)(v16 + 24);
    if (v62 >= v61 >> 1)
    {
      sub_1A2CB5734(v61 > 1, v62 + 1, 1, v16);
      uint64_t v16 = v78;
    }
    *(void *)(v16 + 16) = v62 + 1;
    uint64_t v63 = v16 + 16 * v62;
    *(void *)(v63 + 32) = 0x54494D494CLL;
    *(void *)(v63 + 40) = 0xE500000000000000;
    uint64_t v64 = sub_1A2CF4040();
    uint64_t v66 = v65;
    unint64_t v68 = *(void *)(v16 + 16);
    unint64_t v67 = *(void *)(v16 + 24);
    if (v68 >= v67 >> 1)
    {
      sub_1A2CB5734(v67 > 1, v68 + 1, 1, v16);
      uint64_t v16 = v79;
    }
    *(void *)(v16 + 16) = v68 + 1;
    uint64_t v69 = v16 + 16 * v68;
    *(void *)(v69 + 32) = v64;
    *(void *)(v69 + 40) = v66;
  }
  return v16;
}

unint64_t sub_1A2CBF110()
{
  unint64_t result = qword_1EB5A62A0[0];
  if (!qword_1EB5A62A0[0])
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1EB5A62A0);
  }
  return result;
}

uint64_t sub_1A2CBF168()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for FastColumn()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CBF1D0(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1A2CBF1E8(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1A2CBF200()
{
  uint64_t v3 = *v0;
  switch((unint64_t)*v0 >> 60)
  {
    case 1uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      OUTLINED_FUNCTION_2_3(v3, v20);
      OUTLINED_FUNCTION_6_4();
      goto LABEL_6;
    case 2uLL:
      OUTLINED_FUNCTION_2_3(v3, v20);
      OUTLINED_FUNCTION_6_4();
      goto LABEL_6;
    case 6uLL:
    case 7uLL:
      OUTLINED_FUNCTION_3_4();
      uint64_t v7 = swift_retain();
      sub_1A2CBF200(v7);
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      uint64_t v8 = sub_1A2CF39F0();
      uint64_t v24 = v2;
      sub_1A2CBF200(v8);
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      sub_1A2CF39F0();
      swift_release();
      swift_release();
      return v20;
    case 8uLL:
      OUTLINED_FUNCTION_12_2();
      sub_1A2CF39F0();
      uint64_t v9 = MEMORY[0x1E4FBC860];
      if (*(void *)(v1 + 16))
      {
        OUTLINED_FUNCTION_8_3();
        uint64_t v10 = v1 + 32;
        uint64_t v9 = v23;
        do
        {
          sub_1A2CB37E4(v10, (uint64_t)&v20);
          __swift_project_boxed_opaque_existential_1(&v20, v21);
          uint64_t v11 = OUTLINED_FUNCTION_4_4();
          v12(v11);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_7_3();
            uint64_t v9 = v23;
          }
          unint64_t v13 = *(void *)(v9 + 24);
          if (*(void *)(v9 + 16) >= v13 >> 1)
          {
            OUTLINED_FUNCTION_10_2(v13);
            uint64_t v9 = v23;
          }
          OUTLINED_FUNCTION_11_2();
        }
        while (!v14);
      }
      goto LABEL_25;
    case 9uLL:
      OUTLINED_FUNCTION_12_2();
      sub_1A2CF39F0();
      uint64_t v9 = MEMORY[0x1E4FBC860];
      if (*(void *)(v1 + 16))
      {
        OUTLINED_FUNCTION_8_3();
        uint64_t v15 = v1 + 32;
        uint64_t v9 = v23;
        do
        {
          sub_1A2CB37E4(v15, (uint64_t)&v20);
          __swift_project_boxed_opaque_existential_1(&v20, v21);
          uint64_t v16 = OUTLINED_FUNCTION_4_4();
          v17(v16);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_7_3();
            uint64_t v9 = v23;
          }
          unint64_t v18 = *(void *)(v9 + 24);
          if (*(void *)(v9 + 16) >= v18 >> 1)
          {
            OUTLINED_FUNCTION_10_2(v18);
            uint64_t v9 = v23;
          }
          OUTLINED_FUNCTION_11_2();
        }
        while (!v14);
      }
LABEL_25:
      uint64_t v20 = v9;
      sub_1A2CB0380();
      sub_1A2CB0330();
      sub_1A2CF3900();
      swift_bridgeObjectRelease();
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      sub_1A2CF39F0();
      uint64_t v6 = v24;
      break;
    default:
      sub_1A2CB37E4(v3 + 32, (uint64_t)&v20);
      OUTLINED_FUNCTION_6_4();
LABEL_6:
      sub_1A2CF39F0();
      uint64_t v4 = v21;
      uint64_t v5 = v22;
      __swift_project_boxed_opaque_existential_1(&v20, v21);
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      uint64_t v6 = v24;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
      break;
  }
  return v6;
}

uint64_t type metadata accessor for Connection()
{
  return self;
}

uint64_t sub_1A2CBF614()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  uint64_t result = sub_1A2CBA698(v0);
  uint64_t v3 = 0x6C7070612E6D6F63;
  if (v2) {
    uint64_t v3 = result;
  }
  unint64_t v4 = 0xEF62646165742E65;
  if (v2) {
    unint64_t v4 = v2;
  }
  qword_1EB5A8288 = v3;
  unk_1EB5A8290 = v4;
  return result;
}

uint64_t sub_1A2CBF684()
{
  uint64_t v0 = sub_1A2CF3750();
  __swift_allocate_value_buffer(v0, qword_1EB5A8270);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB5A8270);
  if (qword_1EB5A6A28 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_0_1();
  return sub_1A2CF3740();
}

uint64_t Date.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16) == 3)
  {
    sub_1A2CF3580();
    return __swift_destroy_boxed_opaque_existential_1(a2);
  }
  else
  {
    uint64_t result = sub_1A2CF3F30();
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CBF7CC(uint64_t a1, unint64_t a2)
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

uint64_t tdb_truncate_db(uint64_t a1)
{
  return MEMORY[0x1F4181F40](a1, 0);
}

uint64_t KeyValueStore.promises.getter()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19();
  type metadata accessor for KeyValueStore.Promises();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  return v5(v0, v1, v2, v3, v4);
}

uint64_t type metadata accessor for KeyValueStore.Promises()
{
  return swift_getGenericMetadata();
}

uint64_t KeyValueStore.__allocating_init(database:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  KeyValueStore.init(database:)(a1);
  return v2;
}

void *KeyValueStore.init(database:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = (void *)*v1;
  uint64_t v66 = v5;
  uint64_t v67 = v2;
  sub_1A2CF3790();
  OUTLINED_FUNCTION_0();
  uint64_t v64 = v6;
  uint64_t v65 = v7;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v63 = v8;
  OUTLINED_FUNCTION_16_0();
  uint64_t v60 = sub_1A2CF3CD0();
  OUTLINED_FUNCTION_0();
  uint64_t v59 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_5();
  uint64_t v58 = v11;
  OUTLINED_FUNCTION_16_0();
  uint64_t v57 = sub_1A2CF3C40();
  OUTLINED_FUNCTION_0();
  uint64_t v56 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_5();
  uint64_t v55 = v14;
  OUTLINED_FUNCTION_16_0();
  sub_1A2CF3C30();
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v15);
  sub_1A2CF37B0();
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v17;
  uint64_t v62 = v16;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_5();
  uint64_t v69 = v18;
  v3[4] = sub_1A2CBF82C;
  v3[5] = 0;
  uint64_t v19 = v5[10];
  uint64_t v20 = v5[11];
  uint64_t v21 = v5[12];
  uint64_t v22 = (void *)v5[13];
  uint64_t v23 = (uint64_t (*)())v5[14];
  uint64_t aBlock = v19;
  uint64_t v72 = v20;
  uint64_t v78 = v20;
  uint64_t v73 = (uint64_t (*)(uint64_t))v21;
  uint64_t v74 = v22;
  char v70 = v22;
  unint64_t v68 = v23;
  uint64_t v75 = v23;
  type metadata accessor for KVSEntry();
  uint64_t v24 = sub_1A2CF3820();
  v3[9] = 0;
  v3[6] = v24;
  *((unsigned char *)v3 + 80) = 1;
  v3[2] = a1;
  type metadata accessor for KVSEntity();
  swift_retain();
  swift_getWitnessTable();
  uint64_t v25 = Database.table<A>(_:)();
  if (v67)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t aBlock = v19;
    uint64_t v72 = v78;
    uint64_t v73 = (uint64_t (*)(uint64_t))v21;
    uint64_t v74 = v70;
    uint64_t v75 = v68;
    type metadata accessor for KeyValueStore.Promises();
    sub_1A2CF3D40();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_3_0();
    v26();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v3[3] = v25;
    v53[2] = sub_1A2CB9280(0, (unint64_t *)&qword_1EB5A6910);
    uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8);
    uint64_t v67 = 0;
    uint64_t v54 = v19;
    v53[1] = v27(v19, v21);
    v53[0] = v28;
    sub_1A2CF37A0();
    uint64_t aBlock = MEMORY[0x1E4FBC860];
    sub_1A2CB92BC(&qword_1EB5A6908, MEMORY[0x1E4FBCC10]);
    uint64_t v66 = a1;
    uint64_t v29 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCC10];
    sub_1A2CB94B8(0, &qword_1EB5A68F0, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
    sub_1A2CB93F0((unint64_t *)&unk_1EB5A68F8, &qword_1EB5A68F0, v29);
    sub_1A2CF3D90();
    (*(void (**)(uint64_t, void, uint64_t))(v56 + 104))(v55, *MEMORY[0x1E4FBCC58], v57);
    v3[7] = sub_1A2CF3C90();
    sub_1A2CB9280(0, &qword_1EB5A6920);
    sub_1A2CF3CC0();
    uint64_t v30 = sub_1A2CF3CE0();
    OUTLINED_FUNCTION_3_0();
    v33(v31, v32);
    v3[8] = v30;
    swift_retain();
    sub_1A2CC01E8();
    v77[8] = 0;
    swift_beginAccess();
    uint64_t v34 = v78;
    uint64_t aBlock = v54;
    uint64_t v72 = v78;
    uint64_t v35 = v70;
    uint64_t v73 = (uint64_t (*)(uint64_t))v21;
    uint64_t v74 = v70;
    uint64_t v36 = v68;
    uint64_t v75 = v68;
    type metadata accessor for KeyValueStore.Promises();
    sub_1A2CF3D40();
    OUTLINED_FUNCTION_1();
    (*(void (**)(void *, unsigned char *))(v37 + 40))(v3 + 9, v77);
    swift_endAccess();
    swift_getObjectType();
    uint64_t v38 = swift_allocObject();
    swift_weakInit();
    unint64_t v39 = (void *)swift_allocObject();
    v39[2] = v54;
    v39[3] = v34;
    v39[4] = v21;
    v39[5] = v35;
    v39[6] = v36;
    v39[7] = v38;
    uint64_t v75 = sub_1A2CC05D8;
    uint64_t v76 = v39;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v72 = 1107296256;
    uint64_t v73 = sub_1A2CC0840;
    uint64_t v74 = &block_descriptor;
    unint64_t v40 = _Block_copy(&aBlock);
    swift_retain();
    sub_1A2CF37A0();
    sub_1A2CB9184();
    sub_1A2CF3CF0();
    _Block_release(v40);
    OUTLINED_FUNCTION_3_0();
    v43(v41, v42);
    OUTLINED_FUNCTION_3_0();
    v46(v44, v45);
    swift_release();
    swift_release();
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A2CF3D10();
    uint64_t v47 = swift_unknownObjectRelease();
    MEMORY[0x1F4188790](v47);
    v53[-2] = v66;
    v53[-1] = v3;
    sub_1A2CF3710();
    unint64_t v48 = (void *)swift_allocObject();
    uint64_t v49 = v78;
    v48[2] = v54;
    v48[3] = v49;
    uint64_t v50 = v70;
    v48[4] = v21;
    v48[5] = v50;
    v48[6] = v36;
    uint64_t v51 = (void *)sub_1A2CF36C0();
    sub_1A2CF36D0();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
  }
  return v3;
}

uint64_t type metadata accessor for KVSEntry()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for KVSEntity()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CC01E8()
{
  swift_weakInit();
  swift_weakAssign();
  return swift_release();
}

uint64_t sub_1A2CC0230()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2CC0268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v10 = sub_1A2CF3790();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1A2CF37B0();
  uint64_t v14 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v23 = *(id *)(result + 56);
    swift_release();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = a2;
    v18[3] = a3;
    uint64_t v19 = v24;
    v18[4] = a4;
    v18[5] = v19;
    v18[6] = v25;
    v18[7] = a1;
    aBlock[4] = sub_1A2CC8674;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A2CC0840;
    aBlock[3] = &block_descriptor_63;
    uint64_t v20 = _Block_copy(aBlock);
    swift_retain();
    sub_1A2CF37A0();
    uint64_t v27 = MEMORY[0x1E4FBC860];
    sub_1A2CB92BC(&qword_1EB5A6888, MEMORY[0x1E4FBCB00]);
    uint64_t v21 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
    sub_1A2CB94B8(0, &qword_1EB5A68D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1A2CB93F0(&qword_1EB5A68D8, &qword_1EB5A68D0, v21);
    sub_1A2CF3D90();
    uint64_t v22 = v23;
    MEMORY[0x1A623EFC0](0, v16, v13, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v26);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A2CC05A0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1A2CC05D8()
{
  return sub_1A2CC868C(sub_1A2CC0268);
}

uint64_t sub_1A2CC05F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    type metadata accessor for KVSEntry();
    uint64_t v7 = MEMORY[0x1E4FBB1A0];
    uint64_t v8 = sub_1A2CF3860();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_1A2CF38C0();
    sub_1A2CF38B0();
    swift_endAccess();
    if (qword_1EB5A61F0 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1EB5A8268;
    sub_1A2CF3C00();
    sub_1A2CC845C();
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1A2CF4990;
    uint64_t v11 = MEMORY[0x1E4FBB5C8];
    *(void *)(v10 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v10 + 64) = v11;
    *(void *)(v10 + 32) = v8;
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a4);
    uint64_t v14 = v13;
    *(void *)(v10 + 96) = v7;
    *(void *)(v10 + 104) = sub_1A2CC84C4();
    *(void *)(v10 + 72) = v12;
    *(void *)(v10 + 80) = v14;
    sub_1A2CF3720();
    swift_release();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CC0814(uint64_t a1)
{
  return a1;
}

uint64_t sub_1A2CC0840(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1A2CC0884(uint64_t a1, uint64_t a2)
{
  char v5 = 0;
  swift_retain();
  uint64_t v3 = Database.asyncWrite(_:block:)(&v5, (uint64_t)sub_1A2CC8658, a2);
  swift_release();
  return v3;
}

uint64_t sub_1A2CC08F4()
{
  return sub_1A2CC0884(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1A2CC0910()
{
  sub_1A2CAEFF4();
  type metadata accessor for KVSEntity();
  swift_getWitnessTable();
  char v0 = sub_1A2CC5C08();
  sub_1A2CBC698(v0 & 1);
  return swift_release();
}

uint64_t sub_1A2CC09C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_1EB5A61F0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_1EB5A8268;
  sub_1A2CF3C00();
  sub_1A2CC845C();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A2CF4990;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a4);
  uint64_t v10 = v9;
  uint64_t v11 = MEMORY[0x1E4FBB1A0];
  *(void *)(v7 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v12 = sub_1A2CC84C4();
  *(void *)(v7 + 64) = v12;
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v10;
  sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
  sub_1A2CF3EF0();
  *(void *)(v7 + 96) = v11;
  *(void *)(v7 + 104) = v12;
  *(void *)(v7 + 72) = 0;
  *(void *)(v7 + 80) = 0xE000000000000000;
  sub_1A2CF3720();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CC0B3C()
{
  return OUTLINED_FUNCTION_6(v0, 56);
}

uint64_t sub_1A2CC0B48(uint64_t a1)
{
  return sub_1A2CC09C4(a1, v1[2], v1[3], v1[4]);
}

uint64_t KeyValueStore.allKeys()()
{
  uint64_t v2 = MEMORY[0x1E4FBC860];
  sub_1A2CF3C60();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_1A2CC0BDC()
{
  return sub_1A2CE2130();
}

uint64_t sub_1A2CC0C24()
{
  return sub_1A2CC0BDC();
}

uint64_t sub_1A2CC0C40(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  sub_1A2CBD4CC();
  uint64_t v5 = sub_1A2CBD714();
  uint64_t result = swift_release();
  if (!v2)
  {
    uint64_t v14 = v5;
    MEMORY[0x1F4188790](result);
    long long v7 = *(_OWORD *)(v4 + 96);
    v12[1] = *(_OWORD *)(v4 + 80);
    v12[2] = v7;
    uint64_t v13 = *(void *)(v4 + 112);
    type metadata accessor for KVSEntity();
    uint64_t v8 = sub_1A2CF3B50();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v11 = sub_1A2CBAA68((void (*)(char *, char *))sub_1A2CC8630, (uint64_t)v12, v8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v10);
    swift_bridgeObjectRelease();
    *a1 = v11;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CC0DAC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)(*a1 + 24);
  swift_beginAccess();
  uint64_t result = *(void *)(v3 + 32);
  if (result)
  {
    *a2 = *v4;
    a2[1] = result;
    return swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyValueStore.read(_:maxAge:)(uint64_t a1)
{
  uint64_t v63 = a1;
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_7();
  uint64_t v62 = v3;
  sub_1A2CC1460();
  uint64_t v67 = v4;
  OUTLINED_FUNCTION_1();
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  sub_1A2CC8154(0, qword_1EB5A5F80, sub_1A2CC14C8, MEMORY[0x1E4FBB010]);
  uint64_t v61 = v9;
  OUTLINED_FUNCTION_1();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_4();
  uint64_t v66 = v11;
  OUTLINED_FUNCTION_18_0();
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v55 - v13;
  uint64_t v15 = sub_1A2CF35B0();
  OUTLINED_FUNCTION_0();
  uint64_t v69 = v16;
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  id v23 = (char *)&v55 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v55 - v24;
  uint64_t v26 = *(void (**)(uint64_t))(v1 + 32);
  uint64_t v27 = swift_retain();
  v26(v27);
  swift_release();
  sub_1A2CF3570();
  sub_1A2CF3570();
  sub_1A2CC14C8();
  unint64_t v68 = v23;
  uint64_t result = sub_1A2CF3930();
  if (result)
  {
    uint64_t v60 = v25;
    uint64_t v29 = v67;
    uint64_t v65 = v14;
    uint64_t v30 = v69;
    uint64_t v58 = v2;
    uint64_t v31 = *(void (**)(void))(v69 + 16);
    OUTLINED_FUNCTION_12();
    v31();
    uint64_t v59 = v20;
    OUTLINED_FUNCTION_12();
    v31();
    uint64_t v57 = (uint64_t)&v8[*(int *)(v29 + 48)];
    OUTLINED_FUNCTION_12();
    v31();
    OUTLINED_FUNCTION_12();
    v31();
    uint64_t v32 = *(void (**)(void))(v30 + 32);
    OUTLINED_FUNCTION_11();
    v32();
    uint64_t v33 = *(void (**)(void))(v30 + 8);
    OUTLINED_FUNCTION_15_0();
    v33();
    OUTLINED_FUNCTION_11();
    v32();
    OUTLINED_FUNCTION_11();
    v32();
    uint64_t v34 = v66;
    OUTLINED_FUNCTION_11();
    v32();
    uint64_t v35 = (uint64_t)v65;
    uint64_t v69 = v30 + 8;
    uint64_t v61 = v33;
    ((void (*)(char *, uint64_t))v33)(v8, v15);
    uint64_t v36 = v35;
    sub_1A2CC14FC(v34, v35);
    uint64_t v38 = v62[10];
    uint64_t v37 = (void *)v62[11];
    uint64_t v40 = v62[12];
    uint64_t v39 = v62[13];
    uint64_t v41 = v62[14];
    v70[0] = v38;
    v70[1] = v37;
    uint64_t v62 = v37;
    v70[2] = v40;
    v70[3] = v39;
    uint64_t v55 = v41;
    uint64_t v56 = v39;
    v70[4] = v41;
    uint64_t v57 = type metadata accessor for KVSEntry();
    uint64_t v71 = sub_1A2CF3820();
    uint64_t v42 = swift_allocObject();
    type metadata accessor for KVSEntity();
    uint64_t v43 = sub_1A2CF3830();
    uint64_t v66 = v42;
    *(void *)(v42 + 16) = v43;
    uint64_t v44 = (void *)(v42 + 16);
    MEMORY[0x1F4188790](v43);
    *(&v55 - 6) = (uint64_t)&v71;
    *(&v55 - 5) = v45;
    uint64_t v46 = v45;
    uint64_t v47 = v64;
    *(&v55 - 4) = v63;
    *(&v55 - 3) = v36;
    *(&v55 - 2) = (uint64_t)v44;
    sub_1A2CF3C60();
    uint64_t v67 = v47;
    if (v47)
    {
      uint64_t v48 = v69;
      uint64_t v49 = v61;
      ((void (*)(char *, uint64_t))v61)(v59, v15);
      OUTLINED_FUNCTION_15_0();
      v49();
      OUTLINED_FUNCTION_15_0();
      v49();
      sub_1A2CC1FD4(v36);
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v50 = v61;
      v70[0] = *v44;
      sub_1A2CF3B50();
      swift_getWitnessTable();
      uint64_t v51 = sub_1A2CF3BD0();
      uint64_t v52 = v66;
      if ((v51 & 1) == 0)
      {
        uint64_t v53 = OUTLINED_FUNCTION_13();
        *(void *)(v53 + 16) = v52;
        *(void *)(v53 + 24) = v46;
        LOBYTE(v70[0]) = 0;
        swift_retain();
        swift_retain();
        Database.asyncWrite(_:block:)(v70, (uint64_t)sub_1A2CC3098, v53);
        swift_release();
        uint64_t v51 = swift_release();
      }
      MEMORY[0x1F4188790](v51);
      *(&v55 - 6) = v38;
      *(&v55 - 5) = (uint64_t)v62;
      *(&v55 - 4) = v40;
      uint64_t v54 = v55;
      *(&v55 - 3) = v56;
      *(&v55 - 2) = v54;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_1A2CF38A0();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v50)(v59, v15);
      ((void (*)(char *, uint64_t))v50)(v68, v15);
      ((void (*)(char *, uint64_t))v50)(v60, v15);
      sub_1A2CC1FD4((uint64_t)v65);
      swift_release();
      swift_bridgeObjectRelease();
    }
    return v48;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A2CC1460()
{
  if (!qword_1EB5A5F78)
  {
    sub_1A2CF35B0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EB5A5F78);
    }
  }
}

uint64_t sub_1A2CC14C8()
{
  return sub_1A2CB92BC(&qword_1EB5A5D88, MEMORY[0x1E4F27928]);
}

uint64_t sub_1A2CC14FC(uint64_t a1, uint64_t a2)
{
  sub_1A2CC8154(0, qword_1EB5A5F80, sub_1A2CC14C8, MEMORY[0x1E4FBB010]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A2CC1590()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2CC15C8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v64 = a5;
  uint64_t v77 = a4;
  uint64_t v71 = a1;
  uint64_t v6 = (void *)*a2;
  uint64_t v73 = *(void *)(*a2 + 80);
  uint64_t v7 = v6[11];
  uint64_t v72 = v6[12];
  uint64_t v8 = v6[13];
  uint64_t v9 = v6[14];
  uint64_t v92 = v73;
  uint64_t v93 = v7;
  uint64_t v94 = v72;
  uint64_t v95 = v8;
  uint64_t v96 = v9;
  uint64_t v10 = type metadata accessor for KVSEntry();
  uint64_t v11 = sub_1A2CF3D40();
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v52 = (char *)v50 - v13;
  uint64_t v67 = *(void (***)(void, void))(v10 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v66 = (char *)v50 - v15;
  uint64_t v54 = *(void (***)(char *, uint64_t))(v7 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v61 = (char *)v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v74 = (char *)v50 - v18;
  uint64_t v65 = sub_1A2CF3D40();
  uint64_t v51 = *(void *)(v65 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v65);
  uint64_t v75 = (char *)v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v80 = (char *)v50 - v21;
  uint64_t v60 = a2 + 6;
  swift_beginAccess();
  uint64_t v76 = a2;
  swift_bridgeObjectRetain();
  sub_1A2CF3840();
  swift_bridgeObjectRelease();
  uint64_t v81 = v73;
  uint64_t v82 = v7;
  uint64_t v79 = v7;
  uint64_t v83 = v72;
  uint64_t v84 = v8;
  uint64_t v63 = v8;
  uint64_t v62 = v9;
  uint64_t v85 = v9;
  uint64_t v86 = v77;
  uint64_t v22 = v78;
  sub_1A2CF3880();
  sub_1A2CF36A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_1A2CF3690();
  swift_bridgeObjectRelease();
  if (!*(void *)(v23 + 16)) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v24 = sub_1A2CC25B4((uint64_t)v76);
  uint64_t result = swift_bridgeObjectRelease();
  if (v22) {
    return result;
  }
  uint64_t v26 = type metadata accessor for KVSEntity();
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_1A2CF3AC0();
  swift_bridgeObjectRelease();
  uint64_t v97 = v27;
  if (v27 == MEMORY[0x1A623EE80](v24, v26)) {
    return swift_bridgeObjectRelease();
  }
  v50[1] = 0;
  uint64_t v57 = v10;
  uint64_t v70 = v24 + 32;
  uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  uint64_t v59 = (void (**)(char *, uint64_t, uint64_t))(v54 + 4);
  uint64_t v58 = (void (**)(char *, char *, uint64_t))(v54 + 2);
  uint64_t v56 = (void (**)(uint64_t, char *, uint64_t))(v67 + 2);
  uint64_t v55 = (void (**)(char *, uint64_t))(v67 + 1);
  ++v54;
  uint64_t v67 = (void (**)(void, void))(v51 + 8);
  uint64_t v28 = (uint64_t)v52;
  uint64_t v29 = v66;
  uint64_t v30 = v65;
  uint64_t v31 = (uint64_t)v80;
  uint64_t v68 = v24;
  uint64_t v53 = v26;
  while (1)
  {
    char v32 = sub_1A2CF3B10();
    sub_1A2CF3AF0();
    if ((v32 & 1) == 0) {
      break;
    }
    uint64_t v33 = (uint64_t *)(v70 + 24 * v27);
    uint64_t v34 = v24;
    uint64_t v36 = *v33;
    uint64_t v35 = v33[1];
    uint64_t v37 = v33[2];
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    MEMORY[0x1A623EE90](&v97, v34, v26);
    swift_bridgeObjectRelease();
    sub_1A2CC2ADC(v76, v31);
    uint64_t v38 = (uint64_t)v75;
    (*v69)(v75, v31, v30);
    uint64_t v39 = v79;
    if (__swift_getEnumTagSinglePayload(v38, 1, v79) == 1)
    {
      uint64_t v40 = *v67;
      (*v67)(v38, v30);
      uint64_t v89 = v36;
      uint64_t v90 = v35;
      uint64_t v91 = v37;
      uint64_t v29 = v66;
      sub_1A2CF3B50();
      sub_1A2CF3B20();
      v40((uint64_t)v80, v30);
      uint64_t v31 = (uint64_t)v80;
    }
    else
    {
      uint64_t v41 = v74;
      (*v59)(v74, v38, v39);
      uint64_t v42 = (uint64_t)v61;
      (*v58)(v61, v41, v39);
      uint64_t v78 = v35;
      uint64_t v77 = v37;
      sub_1A2CC2E08(v36, v35, v37, v42, v39, v29);
      uint64_t result = swift_beginAccess();
      uint64_t v43 = *(void *)(v36 + 32);
      if (!v43) {
        goto LABEL_16;
      }
      uint64_t v44 = *(void *)(v36 + 24);
      uint64_t v45 = *v56;
      uint64_t v46 = v29;
      uint64_t v47 = v57;
      (*v56)(v28, v29, v57);
      __swift_storeEnumTagSinglePayload(v28, 0, 1, v47);
      uint64_t v87 = v44;
      uint64_t v88 = v43;
      swift_beginAccess();
      sub_1A2CF38C0();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_1A2CF38E0();
      uint64_t result = swift_endAccess();
      uint64_t v48 = *(void *)(v36 + 32);
      if (!v48) {
        goto LABEL_17;
      }
      uint64_t v49 = *(void *)(v36 + 24);
      v45(v28, v46, v47);
      __swift_storeEnumTagSinglePayload(v28, 0, 1, v47);
      uint64_t v89 = v49;
      uint64_t v90 = v48;
      swift_bridgeObjectRetain();
      sub_1A2CF38E0();
      swift_release();
      swift_release();
      swift_release();
      (*v55)(v46, v47);
      (*v54)(v74, v79);
      uint64_t v31 = (uint64_t)v80;
      uint64_t v30 = v65;
      (*v67)(v80, v65);
      uint64_t v29 = v46;
      uint64_t v26 = v53;
    }
    uint64_t v27 = v97;
    uint64_t v24 = v68;
    if (v27 == MEMORY[0x1A623EE80](v68, v26)) {
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t result = sub_1A2CF3DF0();
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_1A2CC1FB0()
{
  return sub_1A2CC15C8(*(void *)(v0 + 16), *(uint64_t **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1A2CC1FD4(uint64_t a1)
{
  sub_1A2CC8154(0, qword_1EB5A5F80, sub_1A2CC14C8, MEMORY[0x1E4FBB010]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A2CC2060(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v39 = a3;
  uint64_t v41 = a2;
  uint64_t v48 = MEMORY[0x1E4F27928];
  uint64_t v42 = MEMORY[0x1E4FBB718];
  sub_1A2CB94B8(0, &qword_1EB5A5D90, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v40 = (char *)&v37 - v15;
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v46 = a7;
  uint64_t v47 = a8;
  uint64_t v16 = type metadata accessor for KVSEntry();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v38 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v20 = (char **)((char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  uint64_t v23 = (char **)((char *)&v37 - v22);
  uint64_t v25 = *a1;
  uint64_t v24 = a1[1];
  uint64_t v26 = (char *)&v37 + *(int *)(v21 + 48) - v22;
  *uint64_t v23 = v25;
  v23[1] = v24;
  uint64_t v37 = (char *)&v37 - v22;
  uint64_t v27 = *(void *)(v16 - 8);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  v28(v26, v41, v16);
  uint64_t v41 = TupleTypeMetadata2;
  uint64_t v29 = (char *)v20 + *(int *)(TupleTypeMetadata2 + 48);
  *uint64_t v20 = v25;
  v20[1] = v24;
  v28(v29, (uint64_t)v26, v16);
  uint64_t v30 = (uint64_t)v40;
  uint64_t v31 = *((void *)v29 + 1);
  char v32 = *(void (**)(char *, uint64_t))(v27 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v32(v29, v16);
  uint64_t v33 = v31 + *(void *)(*(void *)v31 + 104);
  swift_beginAccess();
  sub_1A2CC856C(v33, v30, (uint64_t)&qword_1EB5A5D90, v48, v42, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1A2CB94B8);
  swift_release();
  uint64_t v34 = sub_1A2CF35B0();
  uint64_t result = __swift_getEnumTagSinglePayload(v30, 1, v34);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    char v36 = sub_1A2CC23B0(v30);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v41);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v30, v34);
    return v36 & 1;
  }
  return result;
}

uint64_t sub_1A2CC23B0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x1E4FBB010];
  sub_1A2CC8154(0, qword_1EB5A5F80, sub_1A2CC14C8, MEMORY[0x1E4FBB010]);
  v15[1] = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v15 - v6;
  uint64_t v8 = sub_1A2CF35B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2CC14C8();
  char v12 = sub_1A2CF3920();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  sub_1A2CC856C(v2, (uint64_t)v7, (uint64_t)qword_1EB5A5F80, (uint64_t)sub_1A2CC14C8, v4, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1A2CC8154);
  if (v12) {
    char v13 = sub_1A2CF3930();
  }
  else {
    char v13 = 0;
  }
  sub_1A2CC1FD4((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13 & 1;
}

uint64_t sub_1A2CC25B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 80);
  uint64_t v3 = *(void *)(*(void *)a1 + 96);
  type metadata accessor for KVSEntity();
  sub_1A2CF3B50();
  uint64_t v4 = Database.read<A>(block:)();
  if (v1)
  {
    if (qword_1EB5A61F0 != -1) {
      swift_once();
    }
    id v5 = (id)qword_1EB5A8268;
    sub_1A2CF3C00();
    sub_1A2CC845C();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1A2CF4990;
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    uint64_t v9 = v8;
    uint64_t v10 = MEMORY[0x1E4FBB1A0];
    *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v11 = sub_1A2CC84C4();
    *(void *)(v6 + 64) = v11;
    *(void *)(v6 + 32) = v7;
    *(void *)(v6 + 40) = v9;
    sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
    sub_1A2CF3EF0();
    *(void *)(v6 + 96) = v10;
    *(void *)(v6 + 104) = v11;
    *(void *)(v6 + 72) = 0;
    *(void *)(v6 + 80) = 0xE000000000000000;
    sub_1A2CF3720();

    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  else
  {
    MEMORY[0x1F4188790](v4);
    swift_getWitnessTable();
    return sub_1A2CF3E40();
  }
}

#error "1A2CC28B4: call analysis failed (funcsize=52)"

uint64_t sub_1A2CC2950(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F27928];
  uint64_t v3 = MEMORY[0x1E4FBB718];
  sub_1A2CB94B8(0, &qword_1EB5A5D90, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v11 - v5;
  uint64_t v7 = *(void *)(a1 + 8) + *(void *)(**(void **)(a1 + 8) + 104);
  swift_beginAccess();
  sub_1A2CC856C(v7, (uint64_t)v6, (uint64_t)&qword_1EB5A5D90, v2, v3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_1A2CB94B8);
  uint64_t v8 = sub_1A2CF35B0();
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    char v10 = sub_1A2CC23B0((uint64_t)v6);
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    return v10 & 1;
  }
  return result;
}

uint64_t sub_1A2CC2ADC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = sub_1A2CE2268(&v8);
  unint64_t v5 = v9;
  if (v9 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v8;
    sub_1A2CC2D30(a2);
    sub_1A2CC8448(v6, v5);
    uint64_t v7 = *(void *)(v3 + 88);
    return __swift_storeEnumTagSinglePayload(a2, 0, 1, v7);
  }
  return result;
}

void sub_1A2CC2D30(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)MEMORY[0x1A623F590]();
  sub_1A2CC5FA8(v3[10], v3[11], v3[12], v3[13], v3[14], a1);
}

uint64_t sub_1A2CC2E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, char *a6@<X8>)
{
  *(void *)a6 = a1;
  *((void *)a6 + 1) = a2;
  *((void *)a6 + 2) = a3;
  uint64_t v9 = type metadata accessor for KVSEntry();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(&a6[*(int *)(v9 + 60)], a4, a5);
}

uint64_t sub_1A2CC2E9C(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for KVSEntity();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1A2CF3AC0();
  if (v9 == MEMORY[0x1A623EE80](v4, v5)) {
    return swift_bridgeObjectRelease();
  }
  while (1)
  {
    char v6 = sub_1A2CF3B10();
    sub_1A2CF3AF0();
    if ((v6 & 1) == 0) {
      break;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    MEMORY[0x1A623EE90](&v9, v4, v5);
    swift_bridgeObjectRelease();
    sub_1A2CED57C();
    sub_1A2CDBFE0();
    if (v2)
    {

      uint64_t v2 = 0;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v7 = v9;
    if (v7 == MEMORY[0x1A623EE80](v4, v5)) {
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t result = sub_1A2CF3DF0();
  __break(1u);
  return result;
}

uint64_t sub_1A2CC306C()
{
  return objectdestroy_14Tm(MEMORY[0x1E4FBC8D0], MEMORY[0x1E4FBC8D0]);
}

uint64_t sub_1A2CC3098()
{
  return sub_1A2CC2E9C(*(void *)(v0 + 16));
}

uint64_t sub_1A2CC30B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for KVSEntry();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1 + *(int *)(v6 + 60), a2);
}

uint64_t sub_1A2CC3144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A2CC30B4(a1, *(void *)(v2 + 24), a2);
}

uint64_t KeyValueStore.write(_:)(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v88 = a1;
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*v1 + 96);
  uint64_t v6 = *(void **)(*v1 + 104);
  uint64_t v7 = *(uint64_t (**)())(*v1 + 112);
  uint64_t v97 = *(void *)(*v1 + 80);
  uint64_t aBlock = v97;
  uint64_t v115 = v4;
  uint64_t v96 = v5;
  v116 = v5;
  v117 = v6;
  uint64_t v95 = v6;
  uint64_t v94 = v7;
  v118 = v7;
  uint64_t v8 = type metadata accessor for KVSEntry();
  uint64_t v9 = sub_1A2CF3D40();
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v92 = (char *)&v81 - v10;
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_4();
  uint64_t v91 = v14;
  OUTLINED_FUNCTION_18_0();
  MEMORY[0x1F4188790](v15);
  v120 = (char *)&v81 - v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v104 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v113 = v17;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_4();
  v106 = (void *)v19;
  OUTLINED_FUNCTION_18_0();
  MEMORY[0x1F4188790](v20);
  v108 = (uint64_t *)((char *)&v81 - v21);
  OUTLINED_FUNCTION_16_0();
  uint64_t v102 = sub_1A2CF35B0();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_4();
  uint64_t v90 = v25;
  OUTLINED_FUNCTION_18_0();
  MEMORY[0x1F4188790](v26);
  uint64_t v28 = (char *)&v81 - v27;
  uint64_t v29 = swift_allocObject();
  uint64_t v93 = v8;
  uint64_t v30 = sub_1A2CF3820();
  uint64_t v83 = v29;
  *(void *)(v29 + 16) = v30;
  uint64_t v100 = v29 + 16;
  v105 = v1;
  uint64_t v31 = (void (*)(uint64_t))v1[4];
  uint64_t v32 = swift_retain();
  v101 = v28;
  v31(v32);
  swift_release();
  uint64_t v33 = *(void *)(v88 + 64);
  uint64_t v85 = v88 + 64;
  uint64_t v34 = 1 << *(unsigned char *)(v88 + 32);
  uint64_t v35 = -1;
  if (v34 < 64) {
    uint64_t v35 = ~(-1 << v34);
  }
  unint64_t v36 = v35 & v33;
  uint64_t v109 = v12 + 16;
  v103 = (void (**)(uint64_t *, void *, uint64_t))(v113 + 32);
  v99 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v84 = v23;
  uint64_t v89 = v23 + 16;
  uint64_t v87 = v12;
  uint64_t v98 = v12 + 8;
  int64_t v86 = (unint64_t)(v34 + 63) >> 6;
  int64_t v82 = v86 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v38 = 0;
  if (!v36) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v39 = __clz(__rbit64(v36));
  uint64_t v40 = (v36 - 1) & v36;
  unint64_t v41 = v39 | (v38 << 6);
  uint64_t v42 = v106;
  uint64_t v43 = TupleTypeMetadata2;
  uint64_t v44 = v108;
LABEL_5:
  uint64_t v45 = (void *)(*(void *)(v88 + 48) + 16 * v41);
  uint64_t v46 = v45[1];
  *uint64_t v42 = *v45;
  v42[1] = v46;
  OUTLINED_FUNCTION_9();
  v47();
  __swift_storeEnumTagSinglePayload((uint64_t)v42, 0, 1, v43);
  swift_bridgeObjectRetain();
  while (1)
  {
    (*v103)(v44, v42, v104);
    if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v43) == 1) {
      break;
    }
    uint64_t v51 = *v44;
    uint64_t v50 = v44[1];
    uint64_t v52 = (uint64_t)v120;
    (*v99)(v120, (char *)v44 + *(int *)(v43 + 48), v4);
    sub_1A2CC3A94(v52);
    uint64_t v113 = v3;
    if (v3)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_0();
      v79();
      uint64_t v70 = v88;
      swift_release();
      OUTLINED_FUNCTION_3_0();
      v80();
      goto LABEL_30;
    }
    uint64_t v55 = v53;
    unint64_t v56 = v54;
    uint64_t v57 = v90;
    OUTLINED_FUNCTION_9();
    v58();
    swift_bridgeObjectRetain();
    uint64_t v111 = v51;
    unint64_t v112 = v40;
    uint64_t v110 = sub_1A2CC3B68(v51, v50, v55, v56, v57);
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    int64_t v63 = v38;
    uint64_t v64 = v91;
    OUTLINED_FUNCTION_9();
    v65();
    uint64_t v66 = v92;
    uint64_t v67 = v64;
    int64_t v38 = v63;
    unint64_t v36 = v112;
    sub_1A2CC2E08(v110, v60, v62, v67, v4, v92);
    __swift_storeEnumTagSinglePayload((uint64_t)v66, 0, 1, v93);
    uint64_t aBlock = v111;
    uint64_t v115 = v50;
    sub_1A2CF38C0();
    sub_1A2CF38E0();
    OUTLINED_FUNCTION_3_0();
    uint64_t result = v68();
    uint64_t v3 = v113;
    if (v36) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v48 = v38 + 1;
    uint64_t v44 = v108;
    if (__OFADD__(v38, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    uint64_t v42 = v106;
    uint64_t v43 = TupleTypeMetadata2;
    if (v48 < v86)
    {
      unint64_t v49 = *(void *)(v85 + 8 * v48);
      if (v49) {
        goto LABEL_9;
      }
      v38 += 2;
      if (v48 + 1 >= v86)
      {
        int64_t v38 = v48;
      }
      else
      {
        unint64_t v49 = *(void *)(v85 + 8 * v38);
        if (v49)
        {
          ++v48;
LABEL_9:
          uint64_t v40 = (v49 - 1) & v49;
          unint64_t v41 = __clz(__rbit64(v49)) + (v48 << 6);
          int64_t v38 = v48;
          goto LABEL_5;
        }
        int64_t v69 = v48 + 2;
        if (v48 + 2 < v86)
        {
          unint64_t v49 = *(void *)(v85 + 8 * v69);
          if (v49)
          {
            v48 += 2;
            goto LABEL_9;
          }
          while (1)
          {
            int64_t v48 = v69 + 1;
            if (__OFADD__(v69, 1)) {
              break;
            }
            if (v48 >= v86)
            {
              int64_t v38 = v82;
              goto LABEL_14;
            }
            unint64_t v49 = *(void *)(v85 + 8 * v48);
            ++v69;
            if (v49) {
              goto LABEL_9;
            }
          }
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
      }
    }
LABEL_14:
    __swift_storeEnumTagSinglePayload((uint64_t)v106, 1, 1, TupleTypeMetadata2);
    uint64_t v40 = 0;
  }
  uint64_t v113 = v3;
  uint64_t v70 = v88;
  swift_release();
  uint64_t v71 = v105;
  uint64_t v72 = v105[7];
  uint64_t v73 = OUTLINED_FUNCTION_13();
  uint64_t v74 = v100;
  *(void *)(v73 + 16) = v71;
  *(void *)(v73 + 24) = v74;
  uint64_t v75 = OUTLINED_FUNCTION_13();
  *(void *)(v75 + 16) = sub_1A2CC4034;
  *(void *)(v75 + 24) = v73;
  v118 = sub_1A2CC4048;
  uint64_t v119 = v75;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v115 = 1107296256;
  v116 = sub_1A2CC4070;
  v117 = &block_descriptor_27;
  uint64_t v76 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v72, v76);
  _Block_release(v76);
  LOBYTE(v76) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v76 & 1) == 0)
  {
    uint64_t v77 = OUTLINED_FUNCTION_13();
    *(void *)(v77 + 16) = v83;
    *(void *)(v77 + 24) = v71;
    LOBYTE(aBlock) = 0;
    swift_retain();
    swift_retain();
    Database.asyncWrite(_:block:)(&aBlock, (uint64_t)sub_1A2CC45B4, v77);
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_3_0();
    v78();
    swift_bridgeObjectRetain();
    swift_release();
LABEL_30:
    swift_release();
    return v70;
  }
LABEL_33:
  __break(1u);
  return result;
}

void sub_1A2CC3A94(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)MEMORY[0x1A623F590]();
  sub_1A2CC5DA4(a1, *(void *)(v3 + 88), &v5);
}

uint64_t sub_1A2CC3B68(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v28 = a2;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1A2CB94B8(0, &qword_1EB5A5D90, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v28 - v10;
  sub_1A2CB94B8(0, &qword_1EB5A5E38, (uint64_t (*)(uint64_t))sub_1A2CC8120, v8);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v28 - v16;
  sub_1A2CC8204();
  swift_allocObject();
  sub_1A2CB49D8();
  uint64_t v19 = v18;
  sub_1A2CC8120(0);
  uint64_t v21 = v20;
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v21);
  sub_1A2CC8154(0, qword_1EB5A5E48, sub_1A2CC81D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  swift_retain();
  sub_1A2CE2310();
  uint64_t v23 = v22;
  sub_1A2CC8258();
  swift_allocObject();
  swift_retain();
  sub_1A2CE22B0();
  swift_retain();
  sub_1A2CE12B4();
  swift_release();
  uint64_t v24 = sub_1A2CF35B0();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v11, a5, v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v24);
  uint64_t v26 = v23 + *(void *)(*(void *)v23 + 104);
  swift_beginAccess();
  sub_1A2CC838C((uint64_t)v11, v26);
  swift_endAccess();
  swift_release();
  sub_1A2CBF7CC(a3, a4);
  sub_1A2CE12F0();
  sub_1A2CB2EAC(a3, a4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(a5, v24);
  return v19;
}

uint64_t sub_1A2CC3F18()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CC3FFC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A2CC4034()
{
  return sub_1A2CC3F18();
}

uint64_t sub_1A2CC403C()
{
  return OUTLINED_FUNCTION_6(v0, 32);
}

uint64_t sub_1A2CC4048()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A2CC4070(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1A2CC4098(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *a2;
  uint64_t v6 = *a2;
  unint64_t v49 = a2;
  uint64_t v7 = *(void *)(v5 + 112);
  long long v8 = *(_OWORD *)(v6 + 96);
  long long v55 = *(_OWORD *)(v6 + 80);
  long long v56 = v8;
  uint64_t v57 = v7;
  uint64_t v9 = type metadata accessor for KVSEntry();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v58 = (char *)&v41 - v11;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v51 = sub_1A2CF3D40();
  uint64_t v13 = *(void *)(v51 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v51);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v52 = (char *)&v41 - v17;
  swift_beginAccess();
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v42 = v18 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(v18 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v19;
  uint64_t v44 = v10 + 16;
  uint64_t v45 = v10;
  uint64_t v50 = (void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  uint64_t v47 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  int64_t v48 = (void (**)(char *, uint64_t, uint64_t))(v10 + 32);
  int64_t v43 = (unint64_t)(v20 + 63) >> 6;
  int64_t v41 = v43 - 1;
  uint64_t v46 = v18;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v24 = 0;
  if (!v22) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v25 = __clz(__rbit64(v22));
  v22 &= v22 - 1;
  unint64_t v26 = v25 | (v24 << 6);
  uint64_t v27 = (uint64_t)v52;
LABEL_5:
  uint64_t v28 = *(void *)(v46 + 56);
  uint64_t v29 = (void *)(*(void *)(v46 + 48) + 16 * v26);
  uint64_t v30 = v29[1];
  *(void *)uint64_t v16 = *v29;
  *((void *)v16 + 1) = v30;
  (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(&v16[*(int *)(TupleTypeMetadata2 + 48)], v28 + *(void *)(v45 + 72) * v26, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, TupleTypeMetadata2);
  swift_bridgeObjectRetain();
  while (1)
  {
    (*v50)(v27, v16, v51);
    if (__swift_getEnumTagSinglePayload(v27, 1, TupleTypeMetadata2) == 1) {
      return swift_release();
    }
    int64_t v53 = v24;
    swift_bridgeObjectRelease();
    uint64_t v33 = TupleTypeMetadata2;
    uint64_t v34 = v27 + *(int *)(TupleTypeMetadata2 + 48);
    uint64_t v35 = v58;
    uint64_t v36 = v9;
    (*v48)(v58, v34, v9);
    sub_1A2CED4D4();
    uint64_t v37 = v35[1];
    int64_t v38 = v3;
    uint64_t v39 = v35[2];
    v54[0] = *v35;
    v54[1] = v37;
    v54[2] = v39;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A2CDC544((uint64_t)v54);
    swift_release();
    if (v38) {

    }
    swift_release();
    swift_release();
    swift_release();
    uint64_t v9 = v36;
    uint64_t result = (*v47)(v58, v36);
    uint64_t v3 = 0;
    TupleTypeMetadata2 = v33;
    int64_t v24 = v53;
    if (v22) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v31 = v24 + 1;
    uint64_t v27 = (uint64_t)v52;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v31 < v43)
    {
      unint64_t v32 = *(void *)(v42 + 8 * v31);
      if (v32) {
        goto LABEL_9;
      }
      v24 += 2;
      if (v31 + 1 >= v43)
      {
        int64_t v24 = v31;
        goto LABEL_14;
      }
      unint64_t v32 = *(void *)(v42 + 8 * v24);
      if (v32)
      {
        ++v31;
LABEL_9:
        unint64_t v22 = (v32 - 1) & v32;
        unint64_t v26 = __clz(__rbit64(v32)) + (v31 << 6);
        int64_t v24 = v31;
        goto LABEL_5;
      }
      int64_t v40 = v31 + 2;
      if (v31 + 2 < v43) {
        break;
      }
    }
LABEL_14:
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, TupleTypeMetadata2);
    unint64_t v22 = 0;
  }
  unint64_t v32 = *(void *)(v42 + 8 * v40);
  if (v32)
  {
    v31 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v31 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      break;
    }
    if (v31 >= v43)
    {
      int64_t v24 = v41;
      goto LABEL_14;
    }
    unint64_t v32 = *(void *)(v42 + 8 * v31);
    ++v40;
    if (v32) {
      goto LABEL_9;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1A2CC4588()
{
  return objectdestroy_14Tm(MEMORY[0x1E4FBC8D0], MEMORY[0x1E4FBC8D0]);
}

uint64_t sub_1A2CC45B4()
{
  return sub_1A2CC4098(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t KeyValueStore.delete(_:)(uint64_t a1)
{
  uint64_t v3 = *(NSObject **)(v1 + 56);
  uint64_t v4 = OUTLINED_FUNCTION_13();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = OUTLINED_FUNCTION_13();
  *(void *)(v5 + 16) = sub_1A2CC4894;
  *(void *)(v5 + 24) = v4;
  v9[4] = sub_1A2CC89EC;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1A2CC4070;
  v9[3] = &block_descriptor_40;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = OUTLINED_FUNCTION_13();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = v1;
    LOBYTE(v9[0]) = 0;
    swift_retain();
    swift_bridgeObjectRetain();
    Database.asyncWrite(_:block:)(v9, (uint64_t)sub_1A2CC4988, v8);
    swift_release();
    swift_release();
    swift_bridgeObjectRetain();
    swift_release();
    return a1;
  }
  return result;
}

uint64_t sub_1A2CC4794()
{
  return swift_endAccess();
}

uint64_t sub_1A2CC4868()
{
  return objectdestroy_14Tm(MEMORY[0x1E4FBC8D0], MEMORY[0x1E4FBC898]);
}

uint64_t sub_1A2CC4894()
{
  return sub_1A2CC4794();
}

uint64_t sub_1A2CC489C()
{
  return OUTLINED_FUNCTION_6(v0, 32);
}

uint64_t sub_1A2CC48A8(uint64_t result)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      sub_1A2CED57C();
      swift_bridgeObjectRetain();
      sub_1A2CDC12C(v6, v5);
      if (v2)
      {

        uint64_t v2 = 0;
      }
      v4 += 2;
      swift_release();
      swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CC495C()
{
  return objectdestroy_14Tm(MEMORY[0x1E4FBC898], MEMORY[0x1E4FBC8D0]);
}

uint64_t sub_1A2CC4988()
{
  return sub_1A2CC48A8(*(void *)(v0 + 16));
}

uint64_t KeyValueStore.subscript.getter(uint64_t a1, uint64_t a2)
{
  sub_1A2CB4DBC(0, (unint64_t *)&qword_1EB5A6930, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A2CF49A0;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  swift_bridgeObjectRetain();
  KeyValueStore.read(_:maxAge:)(v4);
  swift_bridgeObjectRelease();
  sub_1A2CF3890();
  swift_bridgeObjectRelease();
  sub_1A2CF3870();
  swift_getWitnessTable();
  sub_1A2CF3BC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CC4B40(uint64_t a1, uint64_t *a2)
{
  return KeyValueStore.subscript.getter(*a2, a2[1]);
}

uint64_t sub_1A2CC4B68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1A2CF3D40();
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v12 - v6;
  uint64_t v9 = *a3;
  uint64_t v8 = a3[1];
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v6, a1);
  swift_bridgeObjectRetain();
  return KeyValueStore.subscript.setter((uint64_t)v7, v9, v8);
}

uint64_t KeyValueStore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(*(void *)v3 + 88);
  uint64_t v8 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)v27 - v12;
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  uint64_t v18 = (char *)v27 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v7) == 1)
  {
    uint64_t v19 = *(void (**)(void))(v10 + 8);
    OUTLINED_FUNCTION_14_0();
    v19();
    sub_1A2CB4DBC(0, (unint64_t *)&qword_1EB5A6930, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_1A2CF49A0;
    *(void *)(v20 + 32) = a2;
    *(void *)(v20 + 40) = a3;
    KeyValueStore.delete(_:)(v20);
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_14_0();
    return ((uint64_t (*)(void))v19)();
  }
  else
  {
    v27[0] = a1;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, v7);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    sub_1A2CF4050();
    swift_allocObject();
    sub_1A2CF3AE0();
    uint64_t v23 = (char *)v22 + *(int *)(TupleTypeMetadata2 + 48);
    *unint64_t v22 = a2;
    v22[1] = a3;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v23, v18, v7);
    sub_1A2CF3B50();
    uint64_t v24 = sub_1A2CF3850();
    KeyValueStore.write(_:)(v24);
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_14_0();
    v26();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v7);
  }
}

void (*KeyValueStore.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *uint64_t v7 = a2;
  uint64_t v8 = sub_1A2CF3D40();
  v7[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[4] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[5] = malloc(v10);
  v7[6] = malloc(v10);
  KeyValueStore.subscript.getter(a2, a3);
  return sub_1A2CC5068;
}

void sub_1A2CC5068(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[5];
  uint64_t v4 = (void *)(*a1)[6];
  if (a2)
  {
    uint64_t v5 = v2[3];
    uint64_t v6 = v2[4];
    uint64_t v7 = v2[1];
    uint64_t v8 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[5], v4, v5);
    swift_bridgeObjectRetain();
    KeyValueStore.subscript.setter((uint64_t)v3, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    uint64_t v9 = v2[1];
    uint64_t v10 = *v2;
    swift_bridgeObjectRetain();
    KeyValueStore.subscript.setter((uint64_t)v4, v10, v9);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t KeyValueStore.subscript.getter()
{
  OUTLINED_FUNCTION_7();
  return KeyValueStore.read(_:maxAge:)(v0);
}

uint64_t static KeyValueStore.+= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  KeyValueStore.write(_:)(a2);
  return swift_bridgeObjectRelease();
}

uint64_t KeyValueStore.Promises.allKeys()()
{
  return sub_1A2CF36F0();
}

uint64_t sub_1A2CC52E0(void (*a1)(uint64_t *))
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = KeyValueStore.allKeys()();
    swift_release();
    uint64_t v4 = v3;
    a1(&v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyValueStore.Promises.read(_:maxAge:)()
{
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CC5454(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = KeyValueStore.read(_:maxAge:)(a6);
    swift_release();
    uint64_t v10 = v9;
    a1(&v10);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyValueStore.Promises.write(_:)()
{
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CC55D4(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    KeyValueStore.write(_:)(a6);
    swift_release();
    uint64_t v9 = a6;
    a1(&v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyValueStore.Promises.delete(_:)()
{
  return sub_1A2CF36F0();
}

uint64_t sub_1A2CC5724(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    KeyValueStore.delete(_:)(a6);
    swift_release();
    uint64_t v9 = a6;
    a1(&v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyValueStore.readAsync(_:)()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_19();
  long long v8 = *(_OWORD *)(v2 + 80);
  type metadata accessor for KeyValueStore.Promises();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  uint64_t result = v4(v3);
  if (BYTE8(v8))
  {
    __break(1u);
  }
  else
  {
    KeyValueStore.Promises.read(_:maxAge:)();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_3_0();
    v7(v6);
    return v0;
  }
  return result;
}

uint64_t KeyValueStore.readAsync(_:maxAge:)()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_19();
  long long v8 = *(_OWORD *)(v2 + 80);
  type metadata accessor for KeyValueStore.Promises();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  uint64_t result = v4(v3);
  if (BYTE8(v8))
  {
    __break(1u);
  }
  else
  {
    KeyValueStore.Promises.read(_:maxAge:)();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_3_0();
    v7(v6);
    return v0;
  }
  return result;
}

uint64_t KeyValueStore.writeAsync(_:)(uint64_t a1)
{
  return sub_1A2CC59D8(a1, (uint64_t (*)(uint64_t, uint64_t))KeyValueStore.Promises.write(_:));
}

uint64_t KeyValueStore.deleteAsync(_:)(uint64_t a1)
{
  return sub_1A2CC59D8(a1, (uint64_t (*)(uint64_t, uint64_t))KeyValueStore.Promises.delete(_:));
}

uint64_t sub_1A2CC59D8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_19();
  long long v13 = *(_OWORD *)(v5 + 80);
  uint64_t v6 = type metadata accessor for KeyValueStore.Promises();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  uint64_t result = v8(v7);
  if (BYTE8(v13))
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = a2(a1, v6);
    OUTLINED_FUNCTION_3_0();
    v12(v11);
    return v10;
  }
  return result;
}

uint64_t KeyValueStore.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  type metadata accessor for KeyValueStore.Promises();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v6(v1, v2, v3, v4, v5);
  return v0;
}

uint64_t KeyValueStore.__deallocating_deinit()
{
  KeyValueStore.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CC5C08()
{
  return 1;
}

uint64_t sub_1A2CC5C10()
{
  return sub_1A2CF4130();
}

uint64_t sub_1A2CC5C38()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CC5C7C()
{
  return KeyValueStore.readAsync(_:)();
}

uint64_t sub_1A2CC5CA0()
{
  return KeyValueStore.readAsync(_:maxAge:)();
}

uint64_t sub_1A2CC5CC4(uint64_t a1)
{
  return KeyValueStore.writeAsync(_:)(a1);
}

uint64_t sub_1A2CC5CE8(uint64_t a1)
{
  return KeyValueStore.deleteAsync(_:)(a1);
}

uint64_t sub_1A2CC5D0C()
{
  return sub_1A2CC5C08();
}

uint64_t sub_1A2CC5D20()
{
  return sub_1A2CC5C38();
}

uint64_t sub_1A2CC5D34()
{
  return sub_1A2CC5C10();
}

uint64_t sub_1A2CC5D48()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CC5DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  sub_1A2CF4050();
  swift_allocObject();
  sub_1A2CF3AE0();
  uint64_t v9 = (char *)v8 + *(int *)(TupleTypeMetadata2 + 48);
  *long long v8 = 118;
  v8[1] = 0xE100000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v9, a1, a2);
  sub_1A2CF3B50();
  sub_1A2CF3850();
  sub_1A2CF3420();
  swift_allocObject();
  sub_1A2CF3410();
  sub_1A2CF38C0();
  swift_getWitnessTable();
  uint64_t v10 = sub_1A2CF3400();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (!v3)
  {
    *a3 = v10;
    a3[1] = v12;
  }
  return result;
}

uint64_t sub_1A2CC5FA8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v19 = a5;
  uint64_t v30 = a3;
  uint64_t v21 = a6;
  uint64_t v22 = a1;
  uint64_t v9 = sub_1A2CF3D40();
  uint64_t v20 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v18 - v10;
  sub_1A2CF3610();
  swift_allocObject();
  sub_1A2CF3600();
  sub_1A2CF38C0();
  uint64_t v28 = MEMORY[0x1E4FBB1D8];
  uint64_t v29 = a4;
  swift_getWitnessTable();
  sub_1A2CF35F0();
  uint64_t result = swift_release();
  if (!v6)
  {
    uint64_t v18 = a4;
    uint64_t v13 = v20;
    uint64_t v14 = v21;
    uint64_t v16 = v22;
    uint64_t v15 = v23;
    uint64_t v17 = v30;
    uint64_t v23 = 118;
    unint64_t v24 = 0xE100000000000000;
    MEMORY[0x1A623EC20](&v23, v15, MEMORY[0x1E4FBB1A0], a2, MEMORY[0x1E4FBB1B0]);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v9);
      uint64_t v23 = v16;
      unint64_t v24 = a2;
      uint64_t v25 = v17;
      uint64_t v26 = v18;
      uint64_t v27 = v19;
      type metadata accessor for KeyValueStore.TranslationError();
      swift_getWitnessTable();
      swift_allocError();
      return swift_willThrow();
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a2 - 8) + 32))(v14, v11, a2);
    }
  }
  return result;
}

uint64_t sub_1A2CC6234(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1A2CC6268(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1A2CC629C()
{
  sub_1A2CB94B8(0, &qword_1EB5A5E38, (uint64_t (*)(uint64_t))sub_1A2CC8120, MEMORY[0x1E4FBB718]);
  uint64_t v1 = MEMORY[0x1F4188790](v0 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v11 - v4;
  sub_1A2CC8204();
  swift_allocObject();
  sub_1A2CB49D8();
  uint64_t v7 = v6;
  sub_1A2CC8120(0);
  uint64_t v9 = v8;
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v9);
  sub_1A2CC8154(0, qword_1EB5A5E48, sub_1A2CC81D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A2CE2310();
  sub_1A2CC8258();
  swift_allocObject();
  sub_1A2CE22B0();
  return v7;
}

BOOL sub_1A2CC6494(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1A2CC64A4()
{
  return sub_1A2CF4130();
}

uint64_t sub_1A2CC64CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A2CF4080() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4164657461647075 && a2 == 0xE900000000000074;
    if (v6 || (sub_1A2CF4080() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6F734A65756C6176 && a2 == 0xE90000000000006ELL)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1A2CF4080();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1A2CC6614()
{
  return 3;
}

uint64_t sub_1A2CC661C()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CC6664()
{
  return 0;
}

uint64_t sub_1A2CC6670(char a1)
{
  if (!a1) {
    return 25705;
  }
  if (a1 == 1) {
    return 0x4164657461647075;
  }
  return 0x6F734A65756C6176;
}

BOOL sub_1A2CC66C8(char *a1, char *a2)
{
  return sub_1A2CC6494(*a1, *a2);
}

uint64_t sub_1A2CC66DC()
{
  return sub_1A2CC661C();
}

uint64_t sub_1A2CC66E8()
{
  return sub_1A2CC64A4();
}

uint64_t sub_1A2CC66F4()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CC673C()
{
  return sub_1A2CC6670(*v0);
}

uint64_t sub_1A2CC6748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2CC64CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A2CC6778()
{
  return sub_1A2CC6664();
}

uint64_t sub_1A2CC679C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CC6614();
  *a1 = result;
  return result;
}

uint64_t sub_1A2CC67CC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A2CC6820(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A2CC6874(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a3;
  uint64_t v13 = a4;
  type metadata accessor for KVSEntity.CodingKeys();
  swift_getWitnessTable();
  uint64_t v6 = sub_1A2CF4030();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41B0();
  uint64_t v17 = a2;
  char v16 = 0;
  sub_1A2CC8204();
  sub_1A2CB92BC(&qword_1E959EBD8, (void (*)(uint64_t))sub_1A2CC8204);
  uint64_t v10 = v15;
  sub_1A2CF4020();
  if (!v10)
  {
    uint64_t v11 = v13;
    uint64_t v17 = v14;
    char v16 = 1;
    sub_1A2CC8154(0, qword_1EB5A5E48, sub_1A2CC81D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    sub_1A2CC8318(&qword_1E959EBE0);
    sub_1A2CF4020();
    uint64_t v17 = v11;
    char v16 = 2;
    sub_1A2CC8258();
    sub_1A2CB92BC(&qword_1E959EBE8, (void (*)(uint64_t))sub_1A2CC8258);
    sub_1A2CF4020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1A2CC6B3C(uint64_t a1)
{
  type metadata accessor for KVSEntity.CodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = sub_1A2CF3FD0();
  uint64_t v23 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  uint64_t v3 = (char *)&v23 - v2;
  sub_1A2CB94B8(0, &qword_1EB5A5E38, (uint64_t (*)(uint64_t))sub_1A2CC8120, MEMORY[0x1E4FBB718]);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v23 - v8;
  sub_1A2CC8204();
  swift_initStackObject();
  sub_1A2CB49D8();
  uint64_t v27 = v10;
  sub_1A2CC8120(0);
  uint64_t v12 = v11;
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v12);
  sub_1A2CC8154(0, qword_1EB5A5E48, sub_1A2CC81D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A2CE2310();
  uint64_t v28 = v13;
  sub_1A2CC8258();
  swift_initStackObject();
  sub_1A2CE22B0();
  uint64_t v26 = v14;
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v25 = a1;
  char v16 = (void *)a1;
  uint64_t v17 = v3;
  __swift_project_boxed_opaque_existential_1(v16, v15);
  uint64_t v18 = v30;
  sub_1A2CF4190();
  if (v18)
  {
    uint64_t v22 = v27;
  }
  else
  {
    uint64_t v19 = v23;
    char v31 = 0;
    sub_1A2CB92BC(&qword_1E959EBC0, (void (*)(uint64_t))sub_1A2CC8204);
    uint64_t v20 = v24;
    sub_1A2CF3FC0();
    swift_release();
    uint64_t v22 = v32;
    char v31 = 1;
    sub_1A2CC8318(&qword_1E959EBC8);
    swift_retain();
    sub_1A2CF3FC0();
    swift_release();
    char v31 = 2;
    sub_1A2CB92BC(&qword_1E959EBD0, (void (*)(uint64_t))sub_1A2CC8258);
    swift_retain();
    sub_1A2CF3FC0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v20);
    swift_retain();
  }
  __swift_destroy_boxed_opaque_existential_1(v25);
  swift_release();
  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_1A2CC70E8()
{
  return swift_retain();
}

uint64_t sub_1A2CC70F0(uint64_t a1)
{
  return sub_1A2CC6234(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1A2CC70FC(uint64_t a1)
{
  return sub_1A2CC6268(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1A2CC7108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A2CC629C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_1A2CC713C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A2CC6B3C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A2CC7174(void *a1)
{
  return sub_1A2CC6874(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_1A2CC719C(void (*a1)(uint64_t *))
{
  return sub_1A2CC52E0(a1);
}

void sub_1A2CC71CC()
{
  if (!qword_1EB5A5CA8)
  {
    sub_1A2CB4DBC(255, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    unint64_t v0 = sub_1A2CF3700();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A5CA8);
    }
  }
}

uint64_t sub_1A2CC7248(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CC5454(a1, a2, a3, a4, *(void *)(v4 + 56), *(void *)(v4 + 64));
}

uint64_t sub_1A2CC7284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CC72B4(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void))sub_1A2CC55D4);
}

uint64_t sub_1A2CC729C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CC72B4(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void))sub_1A2CC5724);
}

uint64_t sub_1A2CC72B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void))
{
  return a5(a1, a2, a3, a4, v5[7], v5[8], v5[2], v5[3], v5[4], v5[5], v5[6]);
}

uint64_t sub_1A2CC72F4()
{
  return 40;
}

__n128 sub_1A2CC7300(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t dispatch thunk of static KeyValueStoreDescriptor.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static KeyValueStoreDescriptor.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1A2CC733C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for KeyValueStore()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for KeyValueStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for KeyValueStore);
}

uint64_t dispatch thunk of KeyValueStore.__allocating_init(database:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_1A2CC741C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 48);
}

uint64_t initializeBufferWithCopyOfBuffer for Database.Errors(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1A2CC746C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1A2CC748C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1A2CC74C0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1A2CC74E0(uint64_t result, int a2, int a3)
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

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A2CC753C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1A2CC755C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t destroy for Versions()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s5TeaDB8VersionsVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for Versions(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Versions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Versions(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Versions(uint64_t result, int a2, int a3)
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

uint64_t sub_1A2CC77A4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A2CC7840(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  unint64_t v7 = ((v6 + 24) & ~v6) + *(void *)(v5 + 64);
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  uint64_t v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || v7 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v12 = a2[2];
    a1[1] = a2[1];
    a1[2] = v12;
    uint64_t v13 = ((unint64_t)a1 + v6 + 24) & ~v6;
    uint64_t v14 = ((unint64_t)a2 + v6 + 24) & ~v6;
    uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    v15(v13, v14, v4);
  }
  return a1;
}

uint64_t sub_1A2CC7964(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return v5(v6);
}

void *sub_1A2CC79E8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(void *)(a3 + 24);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 24) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 24) & ~v7;
  swift_retain();
  swift_retain();
  swift_retain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_1A2CC7A98(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1A2CC7B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 24 + a1) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 24 + a2) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_1A2CC7BD0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1A2CC7C78(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v7 + 24) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 24) & ~v7, v6, v4);
      }
      uint64_t v16 = *(void *)a1;
      if (*(void *)a1 >= 0xFFFFFFFFuLL) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void sub_1A2CC7E08(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((v10 + 24) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1A2CC8054);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v21 = (unint64_t)&a1[v10 + 24] & ~v10;
          __swift_storeEnumTagSinglePayload(v21, a2, v8, v6);
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v20 = a2 ^ 0x80000000;
            *((void *)a1 + 1) = 0;
            *((void *)a1 + 2) = 0;
          }
          else
          {
            uint64_t v20 = (a2 - 1);
          }
          *(void *)a1 = v20;
        }
      }
      return;
  }
}

uint64_t sub_1A2CC807C(uint64_t a1)
{
  return sub_1A2CC80D4(a1);
}

uint64_t sub_1A2CC80A8(uint64_t a1)
{
  return sub_1A2CC80D4(a1);
}

uint64_t sub_1A2CC80D4(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

void sub_1A2CC8120(uint64_t a1)
{
}

void sub_1A2CC8154(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1A2CF35B0();
    uint64_t v9 = a3();
    unint64_t v10 = a4(a1, v8, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

uint64_t sub_1A2CC81D0()
{
  return sub_1A2CB92BC((unint64_t *)&unk_1EB5A5D78, MEMORY[0x1E4F27928]);
}

void sub_1A2CC8204()
{
  if (!qword_1EB5A6740[0])
  {
    unint64_t v0 = type metadata accessor for Column();
    if (!v1) {
      atomic_store(v0, qword_1EB5A6740);
    }
  }
}

void sub_1A2CC8258()
{
  if (!qword_1EB5A5E40)
  {
    sub_1A2CC82B4();
    unint64_t v0 = type metadata accessor for Column();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A5E40);
    }
  }
}

unint64_t sub_1A2CC82B4()
{
  unint64_t result = qword_1EB5A5D68;
  if (!qword_1EB5A5D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A5D68);
  }
  return result;
}

uint64_t type metadata accessor for KVSEntity.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CC8318(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A2CC8154(255, qword_1EB5A5E48, sub_1A2CC81D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A2CC838C(uint64_t a1, uint64_t a2)
{
  sub_1A2CB94B8(0, &qword_1EB5A5D90, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A2CC8420(uint64_t *a1, uint64_t a2)
{
  return sub_1A2CC2060(a1, a2, v2[7], v2[2], v2[3], v2[4], v2[5], v2[6]) & 1;
}

uint64_t sub_1A2CC8448(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1A2CB2EAC(a1, a2);
  }
  return a1;
}

void sub_1A2CC845C()
{
  if (!qword_1EB5A61A8)
  {
    sub_1A2CB3794(255, (unint64_t *)&unk_1EB5A61B0);
    unint64_t v0 = sub_1A2CF4050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A61A8);
    }
  }
}

unint64_t sub_1A2CC84C4()
{
  unint64_t result = qword_1EB5A6188;
  if (!qword_1EB5A6188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A6188);
  }
  return result;
}

uint64_t type metadata accessor for KeyValueStore.TranslationError()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A2CC8528()
{
  return sub_1A2CC287C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1A2CC8544(uint64_t a1)
{
  return sub_1A2CC2950(a1) & 1;
}

uint64_t sub_1A2CC856C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  a6(0, a3, a4, a5);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  v7();
  return a2;
}

uint64_t sub_1A2CC85D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2CC8614()
{
  return sub_1A2CC0C40(*(uint64_t **)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t sub_1A2CC8630@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_1A2CC0DAC(a1, a2);
}

uint64_t sub_1A2CC8658()
{
  return sub_1A2CC0910();
}

uint64_t sub_1A2CC8674()
{
  return sub_1A2CC868C((uint64_t (*)(void, void, void, void, void, void))sub_1A2CC05F0);
}

uint64_t sub_1A2CC868C(uint64_t (*a1)(void, void, void, void, void, void))
{
  return a1(v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1A2CC86A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t getEnumTagSinglePayload for LazyLoaderError(unsigned int *a1, int a2)
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

unsigned char *sub_1A2CC8700(unsigned char *result, int a2, int a3)
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
        char *result = a2;
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
      char *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A2CC879CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A2CC87C4()
{
  return 0;
}

uint64_t sub_1A2CC87CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t getEnumTagSinglePayload for Transaction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1A2CC885C(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 2;
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
        JUMPOUT(0x1A2CC8928);
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
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_1A2CC8978()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CC8994()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CC89B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CC89CC()
{
  return swift_getWitnessTable();
}

uint64_t Optional<A>.init(valueType:connection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v13);
  int v15 = &v20[-v14];
  uint64_t v16 = *(void *)(a1 + 8);
  int v17 = *(unsigned __int8 *)(a1 + 16);
  if (v17 == 5 && *(_OWORD *)a1 == 0)
  {
    __swift_destroy_boxed_opaque_existential_1(a2);
    return __swift_storeEnumTagSinglePayload(a5, 1, 1, a3);
  }
  else
  {
    v21[0] = *(void *)a1;
    v21[1] = v16;
    char v22 = v17;
    sub_1A2CB37E4(a2, (uint64_t)v20);
    (*(void (**)(void *, unsigned char *, uint64_t, uint64_t))(a4 + 48))(v21, v20, a3, a4);
    __swift_destroy_boxed_opaque_existential_1(a2);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, a3);
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(a5, v15, v10);
  }
}

uint64_t Optional<A>.valueType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_11_0();
  uint64_t v10 = v9 - v8;
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v9 - v8, v12);
  uint64_t result = __swift_getEnumTagSinglePayload(v10, 1, v5);
  if (result == 1)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(unsigned char *)(a3 + 16) = 5;
  }
  else
  {
    uint64_t v14 = OUTLINED_FUNCTION_7_0();
    v15(v14);
    (*(void (**)(uint64_t, uint64_t))(a2 + 40))(v5, a2);
    uint64_t v16 = OUTLINED_FUNCTION_13_0();
    return v17(v16);
  }
  return result;
}

uint64_t sub_1A2CC8CBC(uint64_t a1, uint64_t a2)
{
  return static _Optional.dataType.getter(*(void *)(a1 + 16), *(void *)(a2 - 8));
}

uint64_t sub_1A2CC8CC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Optional<A>.valueType.getter(a1, *(void *)(a2 - 8), a3);
}

uint64_t sub_1A2CC8CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Optional<A>.init(valueType:connection:)(a1, a2, *(void *)(a3 + 16), *(void *)(a4 - 8), a5);
}

uint64_t static Optional<A>.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 24))(a1, a2, 1);
}

uint64_t static Optional<A>.createTableChain(for:ifNotExists:shouldVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t Optional<A>.saveChain(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 16);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v5) == 1) {
    return 0;
  }
  uint64_t v13 = OUTLINED_FUNCTION_7_0();
  v14(v13);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 8))(a1, v5, a3);
  uint64_t v15 = OUTLINED_FUNCTION_13_0();
  v16(v15);
  return v12;
}

uint64_t sub_1A2CC8EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Optional<A>.saveChain(for:)(a1, a2, *(void *)(a3 - 8));
}

uint64_t sub_1A2CC8EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static Optional<A>.createTableChain(for:ifNotExists:)(a1, a2, *(void *)(a3 + 16), *(void *)(a4 - 8));
}

uint64_t sub_1A2CC8EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Optional<A>.createTableChain(for:ifNotExists:shouldVersion:)(a1, a2, a3, *(void *)(a4 + 16), *(void *)(a5 - 8));
}

uint64_t _Optional.value.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t _Optional.value.setter(uint64_t a1)
{
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*_Optional.value.modify())()
{
  return nullsub_1;
}

uint64_t static _Optional.dataType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t _Optional.valueType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v16 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v16 - v11, v3, v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6) == 1)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v7);
    long long v14 = 0uLL;
    char v15 = 5;
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)(a1 + 24) + 40))(&v17, v6);
    long long v16 = v17;
    char v15 = v18;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v12, v6);
    long long v14 = v16;
  }
  *(_OWORD *)a2 = v14;
  *(unsigned char *)(a2 + 16) = v15;
  return result;
}

uint64_t _Optional.init(valueType:connection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_0();
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  MEMORY[0x1F4188790](v10);
  __swift_destroy_boxed_opaque_existential_1(v11);
  uint64_t v13 = *(void *)a1;
  unint64_t v12 = *(void *)(a1 + 8);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 16);
  OUTLINED_FUNCTION_8_0(a3, 1);
  switch(v14)
  {
    case 1:
      if (!OUTLINED_FUNCTION_9_0()) {
        goto LABEL_17;
      }
      goto LABEL_9;
    case 2:
      if (OUTLINED_FUNCTION_9_0()) {
        goto LABEL_9;
      }
      goto LABEL_17;
    case 3:
      if ((OUTLINED_FUNCTION_9_0() & 1) == 0) {
        goto LABEL_17;
      }
LABEL_9:
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_1_0();
      uint64_t v19 = OUTLINED_FUNCTION_3_1();
      v20(v19);
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_10_0();
      v21();
      uint64_t v22 = a3;
      uint64_t v23 = 0;
      return OUTLINED_FUNCTION_8_0(v22, v23);
    case 4:
      if (OUTLINED_FUNCTION_9_0())
      {
        OUTLINED_FUNCTION_6_0();
        OUTLINED_FUNCTION_1_0();
        uint64_t v24 = OUTLINED_FUNCTION_3_1();
        v25(v24);
        OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_10_0();
        v26();
        OUTLINED_FUNCTION_8_0(a3, 0);
        return sub_1A2CB2EAC(v13, v12);
      }
      sub_1A2CB2EAC(v13, v12);
      goto LABEL_17;
    case 5:
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_1_0();
      uint64_t v27 = OUTLINED_FUNCTION_3_1();
      v28(v27);
      return __swift_storeEnumTagSinglePayload(a3, 1, 1, a2);
    default:
      if (OUTLINED_FUNCTION_9_0())
      {
        OUTLINED_FUNCTION_6_0();
        OUTLINED_FUNCTION_1_0();
        uint64_t v15 = OUTLINED_FUNCTION_3_1();
        v16(v15);
        OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_10_0();
        v17();
        OUTLINED_FUNCTION_8_0(a3, 0);
        return swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
LABEL_17:
        OUTLINED_FUNCTION_6_0();
        OUTLINED_FUNCTION_1_0();
        uint64_t v29 = OUTLINED_FUNCTION_3_1();
        v30(v29);
        uint64_t v22 = a3;
        uint64_t v23 = 1;
        return OUTLINED_FUNCTION_8_0(v22, v23);
      }
  }
}

uint64_t _Optional.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_8_0(a2, 1);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  return v6(a2, a1, v4);
}

uint64_t _Optional.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v8 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v9;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v10);
  unint64_t v12 = (char *)&v20 - v11;
  uint64_t v22 = a3;
  uint64_t v27 = type metadata accessor for _Optional();
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v13;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v14);
  long long v16 = (char *)&v20 - v15;
  __swift_storeEnumTagSinglePayload((uint64_t)&v20 - v15, 1, 1, a2);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF4180();
  if (v4)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v16, v27);
  }
  else
  {
    uint64_t v20 = v8;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    if ((sub_1A2CF40A0() & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1(v25, v26);
      sub_1A2CF4090();
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, a2);
      (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v16, v12, v20);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    uint64_t v18 = v24;
    uint64_t v19 = v27;
    (*(void (**)(uint64_t, char *, uint64_t))(v24 + 16))(v23, v16, v27);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v16, v19);
  }
}

uint64_t type metadata accessor for _Optional()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t _Optional.encode(to:)(void *a1, uint64_t a2)
{
  v17[1] = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v17 - v8;
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_11_0();
  uint64_t v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v20, v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    sub_1A2CF40C0();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v15, v9, v3);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    sub_1A2CF40B0();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v3);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
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

uint64_t sub_1A2CC9A44(void *a1)
{
  a1[1] = swift_getWitnessTable();
  a1[2] = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  a1[3] = result;
  return result;
}

uint64_t sub_1A2CC9AFC(uint64_t a1)
{
  return static _Optional.dataType.getter(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1A2CC9B0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return _Optional.init(valueType:connection:)(a1, *(void *)(a2 + 16), a3);
}

uint64_t sub_1A2CC9B14(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A2CC9B74@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return _Optional.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_1A2CC9B94(void *a1, uint64_t a2)
{
  return _Optional.encode(to:)(a1, a2);
}

uint64_t sub_1A2CC9BAC()
{
  uint64_t result = sub_1A2CF3D40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A2CC9C3C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1A2CC9D58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_1A2CC9DD4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1A2CC9E98(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  int v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

void *sub_1A2CC9FC0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1A2CCA084(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  int v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

uint64_t sub_1A2CCA1AC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  unsigned int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_23;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 > 3) {
            LODWORD(v7) = 4;
          }
          switch((int)v7)
          {
            case 2:
              LODWORD(v7) = *a1;
              break;
            case 3:
              LODWORD(v7) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v7) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v7) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v6 + (v7 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v5 < 2) {
    return 0;
  }
  unsigned int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  if (EnumTagSinglePayload >= 2) {
    return EnumTagSinglePayload - 1;
  }
  else {
    return 0;
  }
}

void sub_1A2CCA330(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v9) {
    size_t v11 = *(void *)(v8 + 64);
  }
  else {
    size_t v11 = *(void *)(v8 + 64) + 1;
  }
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v10;
  unsigned int v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        int v6 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v6 = 2;
      }
      else
      {
        int v6 = v15 > 1;
      }
    }
    else
    {
      int v6 = 1;
    }
  }
  if (v10 < a2)
  {
    unsigned int v16 = ~v10 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v18 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x1A2CCA550);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_27;
    default:
LABEL_27:
      if (a2)
      {
LABEL_28:
        if (v9 >= 2)
        {
          uint64_t v19 = a2 + 1;
          __swift_storeEnumTagSinglePayload((uint64_t)a1, v19, v9, v7);
        }
      }
      return;
  }
}

uint64_t sub_1A2CCA57C()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  sub_1A2CBA698(v0);
  sub_1A2CCA610();
  OUTLINED_FUNCTION_0_1();
  uint64_t result = sub_1A2CF3D30();
  qword_1EB5A8268 = result;
  return result;
}

unint64_t sub_1A2CCA610()
{
  unint64_t result = qword_1EB5A61D8;
  if (!qword_1EB5A61D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB5A61D8);
  }
  return result;
}

BOOL static DataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataType.hash(into:)()
{
  return sub_1A2CF4130();
}

uint64_t DataType.hashValue.getter()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CCA6E4()
{
  return sub_1A2CF4140();
}

unint64_t sub_1A2CCA72C()
{
  unint64_t result = qword_1E959EEA0;
  if (!qword_1E959EEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEA0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DataType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DataType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 4;
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
        JUMPOUT(0x1A2CCA8CCLL);
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
          char *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataType()
{
  return &type metadata for DataType;
}

void sub_1A2CCA904(unsigned char *a1@<X8>)
{
}

void sub_1A2CCA948(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static EntityType.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1A2CCA958()
{
  swift_getWitnessTable();
  OUTLINED_FUNCTION_7_1();
  return EntityType.valueType.getter(v0, v1);
}

uint64_t sub_1A2CCA9B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(a1 + 32);
  swift_beginAccess();
  uint64_t result = *(void *)(v4 + 32);
  if (result)
  {
    *(void *)a2 = *(void *)(v4 + 24);
    *(void *)(a2 + 8) = result;
    *(unsigned char *)(a2 + 16) = 0;
    return swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t EntityType.valueType.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = (*(uint64_t (**)(void))(a1 + 24))();
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  if (v4)
  {
    *(void *)a2 = v5;
    *(void *)(a2 + 8) = v4;
    *(unsigned char *)(a2 + 16) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CCAAB4()
{
  OUTLINED_FUNCTION_3();
  uint64_t WitnessTable = swift_getWitnessTable();
  return OUTLINED_FUNCTION_1_1(WitnessTable);
}

uint64_t sub_1A2CCAAFC(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  if (!a3)
  {
    uint64_t v14 = MEMORY[0x1E4FBB1A0];
    unsigned int v15 = &protocol witness table for String;
    *(void *)&long long v13 = a1;
    *((void *)&v13 + 1) = a2;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = 25705;
    *(void *)(v7 + 24) = 0xE200000000000000;
    sub_1A2CB37E4((uint64_t)&v13, v7 + 32);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    *(void *)&long long v13 = sub_1A2CBE8C0(42, 0xE100000000000000, v7, 0, 0, 0xFFu, 0, 1);
    sub_1A2CB0380();
    sub_1A2CB0330();
    *(void *)&long long v13 = sub_1A2CF3900();
    *((void *)&v13 + 1) = v8;
    swift_bridgeObjectRetain();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v9 = v13;
    sub_1A2CB37E4(a4, (uint64_t)&v13);
    sub_1A2CCC180();
    swift_initStackObject();
    sub_1A2CAF0D4(4, v9, *((uint64_t *)&v9 + 1), &v13);
    uint64_t v10 = sub_1A2CB0944();
    swift_release();
    if (*(void *)(v10 + 16))
    {
      uint64_t v11 = *(void *)(v10 + 32);
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      sub_1A2CB2E8C(a1, a2, 0);
      __swift_destroy_boxed_opaque_existential_1(a4);
      return v11;
    }
    swift_bridgeObjectRelease();
    __break(1u);
  }
  uint64_t result = sub_1A2CF3F30();
  __break(1u);
  return result;
}

uint64_t EntityType.init(valueType:connection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_1A2CF3D40();
  MEMORY[0x1F4188790](v10 - 8);
  char v12 = (char *)&v23 - v11;
  if (!*(unsigned char *)(a1 + 16))
  {
    uint64_t v13 = *(void *)a1;
    unint64_t v14 = *(void *)(a1 + 8);
    uint64_t v15 = *(void *)(a4 + 8);
    type metadata accessor for Statement();
    char v29 = 4;
    uint64_t v27 = MEMORY[0x1E4FBB1A0];
    uint64_t v28 = &protocol witness table for String;
    *(void *)&long long v25 = v13;
    *((void *)&v25 + 1) = v14;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = 25705;
    *(void *)(v16 + 24) = 0xE200000000000000;
    sub_1A2CB37E4((uint64_t)&v25, v16 + 32);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    uint64_t v24 = v16;
    long long v25 = 0uLL;
    char v26 = -1;
    sub_1A2CBE824(&v24, (uint64_t)&v25, 0, 1, a3, v15);
    swift_release();
    uint64_t v17 = sub_1A2CBE7DC();
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    sub_1A2CB37E4(a2, (uint64_t)&v25);
    uint64_t v20 = sub_1A2CAEF50(&v29, v17, v19, &v25);
    uint64_t v21 = sub_1A2CB0EB0(v20);
    swift_release();
    *(void *)&long long v25 = v21;
    sub_1A2CF3B50();
    swift_getWitnessTable();
    sub_1A2CF3BC0();
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, a3) != 1)
    {
      sub_1A2CB2E8C(v13, v14, 0);
      __swift_destroy_boxed_opaque_existential_1(a2);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a3 - 8) + 32))(a5, v12, a3);
    }
    __break(1u);
  }
  uint64_t result = sub_1A2CF3F30();
  __break(1u);
  return result;
}

uint64_t (*sub_1A2CCAFF8())()
{
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_8_1(WitnessTable);
  return sub_1A2CCB8A8;
}

uint64_t (*sub_1A2CCB054(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  sub_1A2CB37E4(a1, (uint64_t)v7);
  uint64_t v5 = swift_allocObject();
  sub_1A2CB377C(v7, v5 + 16);
  *(void *)(v5 + 56) = a2;
  *(void *)(v5 + 64) = a3;
  swift_retain();
  swift_retain();
  return sub_1A2CCC2DC;
}

uint64_t (*EntityType.saveChain(for:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  sub_1A2CB37E4(v11, (uint64_t)v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a2);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  sub_1A2CB377C(v16, v13 + 32);
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  return sub_1A2CCB8A8;
}

uint64_t sub_1A2CCB200()
{
  OUTLINED_FUNCTION_6_1();
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_5_1();
  return static EntityType.createTableChain(for:ifNotExists:)(v0, v1, v2, v3);
}

uint64_t (*sub_1A2CCB258(uint64_t a1, char a2))()
{
  sub_1A2CB37E4(a1, (uint64_t)v5);
  uint64_t v3 = swift_allocObject();
  sub_1A2CB377C(v5, v3 + 16);
  *(unsigned char *)(v3 + 56) = a2;
  *(unsigned char *)(v3 + 57) = 1;
  return sub_1A2CCC414;
}

uint64_t static EntityType.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a4 + 16) + 24) + 24))(a1, a2, 1, a3);
}

uint64_t (*sub_1A2CCB2F8())()
{
  OUTLINED_FUNCTION_4_1();
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_2_1(WitnessTable);
  return sub_1A2CCB938;
}

uint64_t (*sub_1A2CCB354(uint64_t a1, char a2, char a3))()
{
  sub_1A2CB37E4(a1, (uint64_t)v7);
  uint64_t v5 = swift_allocObject();
  sub_1A2CB377C(v7, v5 + 16);
  *(unsigned char *)(v5 + 56) = a2;
  *(unsigned char *)(v5 + 57) = a3;
  return sub_1A2CCC1D4;
}

uint64_t (*static EntityType.createTableChain(for:ifNotExists:shouldVersion:)(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5))()
{
  sub_1A2CB37E4(a1, (uint64_t)v11);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a4;
  *(void *)(v9 + 24) = a5;
  sub_1A2CB377C(v11, v9 + 32);
  *(unsigned char *)(v9 + 72) = a2;
  *(unsigned char *)(v9 + 73) = a3;
  return sub_1A2CCB938;
}

uint64_t sub_1A2CCB468()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1A2CCB4A8(uint64_t a1, char a2, char a3)
{
  sub_1A2CB37E4(a1, (uint64_t)v15);
  sub_1A2CB377C(v15, (uint64_t)v14);
  sub_1A2CB37E4((uint64_t)v14, (uint64_t)v13);
  sub_1A2CB37E4((uint64_t)v14, (uint64_t)v12);
  uint64_t v5 = sub_1A2CAFB60(v12);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_1A2CCC2FC(0, &qword_1EB5A67C8, (uint64_t (*)(void))sub_1A2CAFD2C, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Create);
  inited = (void *)swift_initStackObject();
  sub_1A2CB377C(v13, (uint64_t)(inited + 2));
  inited[7] = v5;
  inited[8] = v7;
  inited[9] = v9;
  sub_1A2CBC6B4(a2, a3);
  swift_setDeallocating();
  sub_1A2CCC1F8();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_1A2CCB5D0(uint64_t a1, char a2, char a3)
{
  type metadata accessor for Table();
  sub_1A2CB37E4(a1, (uint64_t)v7);
  sub_1A2CAF090(v7);
  sub_1A2CAEFF4();
  sub_1A2CBCEB4(a2, a3);
  swift_release();
  return swift_release();
}

uint64_t sub_1A2CCB678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A2CB37E4(a1, (uint64_t)v9);
  sub_1A2CB377C(v9, (uint64_t)v8);
  sub_1A2CB37E4((uint64_t)v8, (uint64_t)v7);
  sub_1A2CCC2FC(0, qword_1EB5A6528, (uint64_t (*)(void))sub_1A2CBBB7C, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Save);
  uint64_t v5 = swift_initStackObject() + 16;
  sub_1A2CB377C(v7, v5);
  sub_1A2CEF8A8(a2, a3);
  swift_setDeallocating();
  __swift_destroy_boxed_opaque_existential_1(v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_1A2CCB770(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Table();
  sub_1A2CB37E4(a1, (uint64_t)v5);
  sub_1A2CAF090(v5);
  sub_1A2CED4D4();
  sub_1A2CDC544(a2);
  swift_release();
  return swift_release();
}

uint64_t sub_1A2CCB808()
{
  uint64_t v1 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 72) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x1F4186498](v0, v8, v9);
}

uint64_t sub_1A2CCB8A8()
{
  return sub_1A2CCB770(v0 + 32, v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)));
}

uint64_t sub_1A2CCB900()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x1F4186498](v0, 74, 7);
}

uint64_t sub_1A2CCB938()
{
  return sub_1A2CCB5D0(v0 + 32, *(unsigned char *)(v0 + 72), *(unsigned char *)(v0 + 73));
}

uint64_t dispatch thunk of EntityType.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1A2CCB974()
{
  return 1;
}

uint64_t sub_1A2CCB994()
{
  return 0;
}

uint64_t sub_1A2CCB9A0(void *a1)
{
  sub_1A2CCC2FC(0, &qword_1E959EEA8, (uint64_t (*)(void))sub_1A2CCC134, (uint64_t)&type metadata for RawEntity.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v10 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CCC134();
  sub_1A2CF41B0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t sub_1A2CCBABC(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_1A2CCBAE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CCB974();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A2CCBB14()
{
  return sub_1A2CC6664();
}

uint64_t sub_1A2CCBB30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CC5C08();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A2CCBB5C(uint64_t a1)
{
  unint64_t v2 = sub_1A2CCC134();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A2CCBB98(uint64_t a1)
{
  unint64_t v2 = sub_1A2CCC134();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A2CCBBD4()
{
  return 0x302E302E30;
}

uint64_t sub_1A2CCBBE8(uint64_t a1)
{
  return sub_1A2CCBABC(a1);
}

uint64_t sub_1A2CCBC00(void *a1)
{
  return sub_1A2CCB9A0(a1);
}

void sub_1A2CCBC18(unsigned char *a1@<X8>)
{
}

uint64_t sub_1A2CCBC5C()
{
  swift_getWitnessTable();
  OUTLINED_FUNCTION_7_1();
  return EntityType.valueType.getter(v0, v1);
}

uint64_t sub_1A2CCBCB8()
{
  OUTLINED_FUNCTION_3();
  uint64_t WitnessTable = swift_getWitnessTable();
  return OUTLINED_FUNCTION_1_1(WitnessTable);
}

uint64_t (*sub_1A2CCBD00())()
{
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_8_1(WitnessTable);
  return sub_1A2CCB8A8;
}

uint64_t sub_1A2CCBD5C()
{
  OUTLINED_FUNCTION_6_1();
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_5_1();
  return static EntityType.createTableChain(for:ifNotExists:)(v0, v1, v2, v3);
}

uint64_t (*sub_1A2CCBDB4())()
{
  OUTLINED_FUNCTION_4_1();
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_2_1(WitnessTable);
  return sub_1A2CCB938;
}

uint64_t sub_1A2CCBE14@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2CCA9B4(*v1, a1);
}

uint64_t sub_1A2CCBE1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_1A2CCAAFC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t (*sub_1A2CCBE54(uint64_t a1))()
{
  return sub_1A2CCB054(a1, *v1, v1[1]);
}

void sub_1A2CCBE64(unsigned char *a1@<X8>)
{
}

uint64_t sub_1A2CCBEA8()
{
  swift_getWitnessTable();
  OUTLINED_FUNCTION_7_1();
  return EntityType.valueType.getter(v0, v1);
}

uint64_t sub_1A2CCBF04()
{
  OUTLINED_FUNCTION_3();
  uint64_t WitnessTable = swift_getWitnessTable();
  return OUTLINED_FUNCTION_1_1(WitnessTable);
}

uint64_t (*sub_1A2CCBF4C())()
{
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_8_1(WitnessTable);
  return sub_1A2CCB8A8;
}

uint64_t sub_1A2CCBFA8()
{
  OUTLINED_FUNCTION_6_1();
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_5_1();
  return static EntityType.createTableChain(for:ifNotExists:)(v0, v1, v2, v3);
}

uint64_t (*sub_1A2CCC000())()
{
  OUTLINED_FUNCTION_4_1();
  uint64_t WitnessTable = swift_getWitnessTable();
  OUTLINED_FUNCTION_2_1(WitnessTable);
  return sub_1A2CCB938;
}

ValueMetadata *type metadata accessor for RawEntity()
{
  return &type metadata for RawEntity;
}

unint64_t sub_1A2CCC06C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A2CCC09C();
  unint64_t result = sub_1A2CCC0E8();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A2CCC09C()
{
  unint64_t result = qword_1EB5A5D58;
  if (!qword_1EB5A5D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A5D58);
  }
  return result;
}

unint64_t sub_1A2CCC0E8()
{
  unint64_t result = qword_1EB5A5D50;
  if (!qword_1EB5A5D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A5D50);
  }
  return result;
}

unint64_t sub_1A2CCC134()
{
  unint64_t result = qword_1E959EEB0;
  if (!qword_1E959EEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEB0);
  }
  return result;
}

void sub_1A2CCC180()
{
  if (!qword_1EB5A6880)
  {
    unint64_t v0 = type metadata accessor for Statement();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A6880);
    }
  }
}

uint64_t sub_1A2CCC1D4()
{
  return sub_1A2CCB4A8(v0 + 16, *(unsigned char *)(v0 + 56), *(unsigned char *)(v0 + 57));
}

uint64_t sub_1A2CCC1F8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A2CB7CF0(*(void *)(v0 + 56));
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CCC23C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186498](v0, 58, 7);
}

uint64_t sub_1A2CCC274(uint64_t a1, uint64_t *a2)
{
  return sub_1A2CCB678(a1, *a2, a2[1]);
}

uint64_t sub_1A2CCC294()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1A2CCC2DC()
{
  return sub_1A2CCC274(v0 + 16, (uint64_t *)(v0 + 56));
}

void sub_1A2CCC2FC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

ValueMetadata *type metadata accessor for RawEntity.CodingKeys()
{
  return &type metadata for RawEntity.CodingKeys;
}

unint64_t sub_1A2CCC378()
{
  unint64_t result = qword_1E959EEB8;
  if (!qword_1E959EEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEB8);
  }
  return result;
}

unint64_t sub_1A2CCC3C8()
{
  unint64_t result = qword_1E959EEC0;
  if (!qword_1E959EEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEC0);
  }
  return result;
}

uint64_t sub_1A2CCC414()
{
  return sub_1A2CCC1D4();
}

unint64_t sub_1A2CCC430(unint64_t a1, unint64_t a2)
{
  unint64_t v3 = a1;
  int64_t v4 = sub_1A2CCCD58(a1, a2);
  uint64_t v5 = MEMORY[0x1E4FBC860];
  if (!v4) {
    return v5;
  }
  int64_t v6 = v4;
  uint64_t v29 = MEMORY[0x1E4FBC860];
  unint64_t result = (unint64_t)sub_1A2CDEFD8(0, v4 & ~(v4 >> 63), 0);
  if (v6 < 0) {
    goto LABEL_57;
  }
  uint64_t v8 = (v3 >> 59) & 1;
  if ((a2 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a2 & 0x2000000000000000) != 0) {
    unint64_t v10 = HIBYTE(a2) & 0xF;
  }
  else {
    unint64_t v10 = v3 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v11 = 15;
  uint64_t v25 = 4 << v8;
  uint64_t v26 = v3;
  unint64_t v24 = v10;
  while (1)
  {
    unint64_t v12 = v11 & 0xC;
    BOOL v13 = (v11 & 1) == 0 || v12 == v9;
    BOOL v14 = v13;
    if (v13) {
      break;
    }
    unint64_t result = v11;
    if (v11 >> 16 >= v10) {
      goto LABEL_54;
    }
LABEL_23:
    if ((a2 & 0x1000000000000000) != 0)
    {
      int v15 = sub_1A2CF3DC0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) != 0)
      {
        unint64_t v27 = v3;
        uint64_t v28 = a2 & 0xFFFFFFFFFFFFFFLL;
      }
      else if ((v3 & 0x1000000000000000) == 0)
      {
        sub_1A2CF3E20();
      }
      int v15 = sub_1A2CF3E30();
    }
    int v16 = v15;
    uint64_t v5 = v29;
    unint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      unint64_t result = (unint64_t)sub_1A2CDEFD8(0, *(void *)(v5 + 16) + 1, 1);
      uint64_t v5 = v29;
    }
    unint64_t v18 = *(void *)(v5 + 16);
    unint64_t v17 = *(void *)(v5 + 24);
    if (v18 >= v17 >> 1)
    {
      unint64_t result = (unint64_t)sub_1A2CDEFD8((char *)(v17 > 1), v18 + 1, 1);
      uint64_t v5 = v29;
    }
    *(void *)(v5 + 16) = v18 + 1;
    *(_DWORD *)(v5 + 4 * v18 + 32) = v16;
    if (v14)
    {
      uint64_t v9 = v25;
      unint64_t v3 = v26;
      unint64_t v10 = v24;
      if (v12 == v25)
      {
        unint64_t result = sub_1A2CEBE98(v11, v26, a2);
        unint64_t v11 = result;
      }
      if (v24 <= v11 >> 16) {
        goto LABEL_55;
      }
      if ((v11 & 1) == 0) {
        unint64_t v11 = v11 & 0xC | sub_1A2CCCF98(v11, v26, a2) & 0xFFFFFFFFFFFFFFF3 | 1;
      }
    }
    else
    {
      unint64_t v10 = v24;
      uint64_t v9 = v25;
      unint64_t v3 = v26;
      if (v24 <= v11 >> 16) {
        goto LABEL_56;
      }
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
      unint64_t v11 = sub_1A2CF3990();
    }
    else
    {
      unint64_t v19 = v11 >> 16;
      if ((a2 & 0x2000000000000000) != 0)
      {
        unint64_t v27 = v3;
        uint64_t v28 = a2 & 0xFFFFFFFFFFFFFFLL;
        int v21 = *((unsigned __int8 *)&v27 + v19);
      }
      else
      {
        uint64_t v20 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if ((v3 & 0x1000000000000000) == 0) {
          uint64_t v20 = sub_1A2CF3E20();
        }
        int v21 = *(unsigned __int8 *)(v20 + v19);
      }
      int v22 = (char)v21;
      unsigned int v23 = __clz(v21 ^ 0xFF) - 24;
      if (v22 >= 0) {
        LOBYTE(v23) = 1;
      }
      unint64_t v11 = ((v19 + v23) << 16) | 5;
    }
    if (!--v6) {
      return v5;
    }
  }
  unint64_t result = v11;
  if (v12 == v9) {
    unint64_t result = sub_1A2CEBE98(v11, v3, a2);
  }
  if (result >> 16 < v10)
  {
    if ((result & 1) == 0) {
      sub_1A2CCCF98(result, v3, a2);
    }
    goto LABEL_23;
  }
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

void static Data.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t Data.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16) == 4)
  {
    uint64_t v3 = sub_1A2CCC7F4(*(void *)a1, *(void *)(a1 + 8));
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v3;
  }
  else
  {
    uint64_t result = sub_1A2CF3F30();
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CCC7F4(uint64_t a1, unint64_t a2)
{
  v13[3] = MEMORY[0x1E4F277C0];
  v13[4] = MEMORY[0x1E4F277B0];
  v13[0] = a1;
  v13[1] = a2;
  int64_t v4 = __swift_project_boxed_opaque_existential_1(v13, MEMORY[0x1E4F277C0]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
        JUMPOUT(0x1A2CCC990);
      }
      sub_1A2CBF7CC(a1, a2);
      sub_1A2CBF7CC(v5, v6);
      sub_1A2CCD1B4((int)v5, v5 >> 32, &v12);
      sub_1A2CB2EAC(v5, v6);
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(v5 + 16);
      uint64_t v9 = *(void *)(v5 + 24);
      sub_1A2CBF7CC(a1, a2);
      swift_retain();
      swift_retain();
      sub_1A2CCD1B4(v8, v9, &v12);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      sub_1A2CBF7CC(a1, a2);
      uint64_t v7 = 0;
      goto LABEL_7;
    default:
      sub_1A2CBF7CC(a1, a2);
      uint64_t v7 = BYTE6(v6);
LABEL_7:
      sub_1A2CCD248(v7, &v12);
      break;
  }
  sub_1A2CB2EAC(a1, a2);
  uint64_t v10 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v10;
}

uint64_t Data.valueType.getter@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 4;
  return sub_1A2CBF7CC(a1, a2);
}

uint64_t sub_1A2CCC9B4@<X0>(uint64_t a1@<X8>)
{
  return Data.valueType.getter(*(void *)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_1A2CCC9BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = Data.init(valueType:connection:)(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_1A2CCC9E4()
{
  uint64_t result = (void *)sub_1A2CCC430(0xD000000000000010, 0x80000001A2CF7820);
  off_1EB5A61C8 = result;
  return result;
}

uint64_t Data.queryValue.getter()
{
  uint64_t v0 = sub_1A2CF3560();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v7[2] = 0;
  v7[3] = 0xE000000000000000;
  sub_1A2CF3510();
  uint64_t result = sub_1A2CF3550();
  if ((result & 0x100) != 0)
  {
LABEL_8:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v7[0] = 10104;
    v7[1] = 0xE200000000000000;
    swift_bridgeObjectRetain();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    return v7[0];
  }
  else
  {
    unsigned __int8 v5 = result;
    while (1)
    {
      if (qword_1EB5A61E8 != -1) {
        uint64_t result = swift_once();
      }
      unint64_t v6 = off_1EB5A61C8;
      if (*((void *)off_1EB5A61C8 + 2) <= (unint64_t)(v5 >> 4)) {
        break;
      }
      uint64_t result = sub_1A2CF39B0();
      if (v6[2] <= (unint64_t)(v5 & 0xF)) {
        goto LABEL_10;
      }
      sub_1A2CF39B0();
      uint64_t result = sub_1A2CF3550();
      unsigned __int8 v5 = result;
      if ((result & 0x100) != 0) {
        goto LABEL_8;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  return result;
}

unint64_t sub_1A2CCCC10(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A2CCCC40();
  unint64_t result = sub_1A2CCCC8C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A2CCCC40()
{
  unint64_t result = qword_1EB5A6200;
  if (!qword_1EB5A6200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A6200);
  }
  return result;
}

unint64_t sub_1A2CCCC8C()
{
  unint64_t result = qword_1EB5A61F8;
  if (!qword_1EB5A61F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A61F8);
  }
  return result;
}

uint64_t sub_1A2CCCCD8()
{
  return Data.queryValue.getter();
}

uint64_t sub_1A2CCCCE0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = sub_1A2CF34D0();
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = MEMORY[0x1A623E830]();
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = MEMORY[0x1A623E840]();
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

unint64_t sub_1A2CCCD58(unint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1;
  }
  uint64_t v5 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  unint64_t v6 = v5 | (v4 << 16);
  unint64_t v7 = sub_1A2CCD0A4(0xFuLL, a1, a2);
  unint64_t result = sub_1A2CCD0A4(v6, a1, a2);
  unint64_t v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (uint64_t i = 0; ; ++i)
    {
      uint64_t v11 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_1A2CF3990();
        unint64_t v7 = result;
      }
      else
      {
        unint64_t v12 = v7 >> 16;
        if ((a2 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a1;
          uint64_t v23 = a2 & 0xFFFFFFFFFFFFFFLL;
          int v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a1 & 0x1000000000000000) == 0) {
            unint64_t result = sub_1A2CF3E20();
          }
          int v13 = *(unsigned __int8 *)(result + v12);
        }
        int v14 = (char)v13;
        unsigned int v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0) {
          LOBYTE(v15) = 1;
        }
        unint64_t v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14) {
        return v11;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    uint64_t v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a2 & 0x1000000000000000) != 0)
      {
        unint64_t result = sub_1A2CF39A0();
        unint64_t v7 = result;
      }
      else
      {
        if ((a2 & 0x2000000000000000) != 0)
        {
          unint64_t v22 = a1;
          uint64_t v23 = a2 & 0xFFFFFFFFFFFFFFLL;
          if ((*((unsigned char *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            uint64_t v20 = 0;
            do
              int v21 = *((unsigned char *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            uint64_t v19 = 1 - v20;
          }
          else
          {
            uint64_t v19 = 1;
          }
        }
        else
        {
          unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a1 & 0x1000000000000000) == 0) {
            unint64_t result = sub_1A2CF3E20();
          }
          uint64_t v17 = 0;
          do
            int v18 = *(unsigned char *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          uint64_t v19 = -v17;
        }
        unint64_t v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14) {
        return v11;
      }
    }
    goto LABEL_42;
  }
  return 0;
}

unint64_t sub_1A2CCCF98(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) != 0)
    {
      uint64_t v10 = HIBYTE(a3) & 0xF;
      if ((a3 & 0x2000000000000000) == 0) {
        uint64_t v10 = a2 & 0xFFFFFFFFFFFFLL;
      }
      if (v5 != v10)
      {
        return MEMORY[0x1F4184CD0]();
      }
    }
    else
    {
      long long v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v9 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
        }
        else
        {
          unint64_t v9 = result >> 16;
        }
        unint64_t v5 = v9;
      }
      else
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v7 = a2 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          unint64_t v12 = result >> 16;
          uint64_t v6 = sub_1A2CF3E20();
          unint64_t v5 = v12;
        }
        if (v5 != v7)
        {
          do
            int v8 = *(unsigned char *)(v6 + v5--) & 0xC0;
          while (v8 == 128);
          ++v5;
        }
      }
      return v5 << 16;
    }
  }
  return result;
}

unint64_t sub_1A2CCD0A4(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_1A2CCD144(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_1A2CCCF98(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_1A2CCD144(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_1A2CEBE98(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 < result >> 16) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CCD1B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_1A2CF3440();
  uint64_t v7 = result;
  if (result)
  {
    uint64_t result = sub_1A2CF3460();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v7 += a1 - result;
  }
  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = sub_1A2CF3450();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = v7 + v11;
  if (v7) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  return sub_1A2CCCCE0(v7, v13, a3);
}

uint64_t sub_1A2CCD248@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    if (a1 <= 14)
    {
      uint64_t result = sub_1A2CF34D0();
      unint64_t v6 = v7 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      sub_1A2CF3470();
      swift_allocObject();
      uint64_t v4 = sub_1A2CF3430();
      if ((unint64_t)a1 >= 0x7FFFFFFF)
      {
        sub_1A2CF3520();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = a1;
        unint64_t v6 = v4 | 0x8000000000000000;
      }
      else
      {
        uint64_t result = a1 << 32;
        unint64_t v6 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    uint64_t result = 0;
    unint64_t v6 = 0xC000000000000000;
  }
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1A2CCD3A8()
{
  unint64_t v0 = sub_1A2CF3F70();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_1A2CCD3F8()
{
  return 6;
}

uint64_t sub_1A2CCD400(char a1)
{
  uint64_t result = 1954047348;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x72656765746E69;
      break;
    case 2:
      uint64_t result = 1819242338;
      break;
    case 3:
      uint64_t result = 0x656C62756F64;
      break;
    case 4:
      uint64_t result = 1651469410;
      break;
    case 5:
      uint64_t result = 1819047278;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A2CCD49C(char a1)
{
  uint64_t result = 1954047348;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x72656765746E69;
      break;
    case 2:
      uint64_t result = 1819242338;
      break;
    case 3:
      uint64_t result = 0x656C62756F64;
      break;
    case 4:
      uint64_t result = 1651469410;
      break;
    case 5:
      uint64_t result = 1819047278;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A2CCD538(unsigned __int8 *a1, char *a2)
{
  return sub_1A2CCE964(*a1, *a2);
}

uint64_t sub_1A2CCD544()
{
  return sub_1A2CCD54C(*v0);
}

uint64_t sub_1A2CCD54C(char a1)
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CCD5B0(char a1)
{
  return sub_1A2CCD720(0, a1);
}

uint64_t sub_1A2CCD5BC()
{
  return sub_1A2CCD5C4();
}

uint64_t sub_1A2CCD5C4()
{
  sub_1A2CF39C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CCD694(uint64_t a1, char a2)
{
  if (!a2) {
    OUTLINED_FUNCTION_4_2();
  }
  sub_1A2CF39C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CCD718(uint64_t a1)
{
  return sub_1A2CCD7B8(a1, *v1);
}

uint64_t sub_1A2CCD720(uint64_t a1, char a2)
{
  if (!a2) {
    OUTLINED_FUNCTION_4_2();
  }
  sub_1A2CF39C0();
  swift_bridgeObjectRelease();
  return sub_1A2CF4140();
}

uint64_t sub_1A2CCD7B8(uint64_t a1, char a2)
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CCD818@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CCD3A8();
  *a1 = result;
  return result;
}

uint64_t sub_1A2CCD848@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A2CCD400(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1A2CCD874()
{
  return sub_1A2CCD49C(*v0);
}

uint64_t sub_1A2CCD87C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CCD3F4();
  *a1 = result;
  return result;
}

uint64_t sub_1A2CCD8A4()
{
  return sub_1A2CC6664();
}

uint64_t sub_1A2CCD8C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CCD3F8();
  *a1 = result;
  return result;
}

uint64_t sub_1A2CCD8EC(uint64_t a1)
{
  unint64_t v2 = sub_1A2CCDBD0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A2CCD928(uint64_t a1)
{
  unint64_t v2 = sub_1A2CCDBD0();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ValueType.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A2CCDE4C(0, &qword_1E959EEC8, MEMORY[0x1E4FBBDC0]);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CCDBD0();
  sub_1A2CF4190();
  if (!v2)
  {
    uint64_t v6 = sub_1A2CF3F80();
    uint64_t v8 = v7;
    uint64_t v9 = OUTLINED_FUNCTION_0_2();
    v10(v9);
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v8;
    *(unsigned char *)(a2 + 16) = 0;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1A2CCDBD0()
{
  unint64_t result = qword_1E959EED0;
  if (!qword_1E959EED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EED0);
  }
  return result;
}

uint64_t ValueType.encode(to:)(void *a1)
{
  sub_1A2CCDE4C(0, &qword_1E959EED8, MEMORY[0x1E4FBBDE0]);
  uint64_t v17 = v3;
  OUTLINED_FUNCTION_1_2();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v10 = *(void *)v1;
  unint64_t v9 = *(void *)(v1 + 8);
  uint64_t v11 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CCDBD0();
  sub_1A2CF41B0();
  switch(v11)
  {
    case 1:
      LOBYTE(v18) = 1;
      OUTLINED_FUNCTION_5_2();
      sub_1A2CF4010();
      goto LABEL_6;
    case 2:
      LOBYTE(v18) = 2;
      OUTLINED_FUNCTION_5_2();
      sub_1A2CF3FF0();
      goto LABEL_6;
    case 3:
      LOBYTE(v18) = 3;
      sub_1A2CF4000();
      goto LABEL_6;
    case 4:
      uint64_t v18 = v10;
      unint64_t v19 = v9;
      char v20 = 4;
      sub_1A2CBF7CC(v10, v9);
      sub_1A2CCCC8C();
      OUTLINED_FUNCTION_5_2();
      sub_1A2CF4020();
      uint64_t v15 = OUTLINED_FUNCTION_3_2();
      v16(v15);
      return sub_1A2CB2E8C(v10, v9, 4);
    case 5:
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v17);
    default:
      LOBYTE(v18) = 0;
      sub_1A2CF3FE0();
LABEL_6:
      uint64_t v12 = OUTLINED_FUNCTION_3_2();
      return v13(v12);
  }
}

void sub_1A2CCDE4C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1A2CCDBD0();
    unint64_t v7 = a3(a1, &type metadata for ValueType.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1A2CCDEB0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ValueType.init(from:)(a1, a2);
}

uint64_t sub_1A2CCDEC8(void *a1)
{
  return ValueType.encode(to:)(a1);
}

uint64_t ValueType.description.getter()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v1 = *(void *)(v0 + 8);
  uint64_t v3 = 1819047278;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      uint64_t v3 = sub_1A2CF4040();
      break;
    case 2:
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    case 3:
      sub_1A2CF3B70();
LABEL_6:
      uint64_t v3 = 0;
      break;
    case 4:
      sub_1A2CBF7CC(*(void *)v0, *(void *)(v0 + 8));
      uint64_t v3 = sub_1A2CF3500();
      sub_1A2CB2E8C(v2, v1, 4);
      break;
    case 5:
      return v3;
    default:
      swift_bridgeObjectRetain();
      uint64_t v3 = v2;
      break;
  }
  return v3;
}

uint64_t static ValueType.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t *)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(uint64_t *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  int v6 = *(unsigned __int8 *)(a2 + 16);
  switch(*(unsigned char *)(a1 + 16))
  {
    case 1:
      if (v6 != 1) {
        goto LABEL_25;
      }
      BOOL v9 = v2 == v4;
      goto LABEL_16;
    case 2:
      if (v6 != 2) {
        goto LABEL_25;
      }
      char v10 = ((*(void *)a1 & 1) == 0) ^ v4;
      return v10 & 1;
    case 3:
      if (v6 != 3) {
        goto LABEL_25;
      }
      BOOL v9 = *(double *)&v2 == *(double *)&v4;
LABEL_16:
      char v10 = v9;
      return v10 & 1;
    case 4:
      if (v6 != 4) {
        goto LABEL_25;
      }
      sub_1A2CB18DC(*(void *)a1, v3, 4);
      sub_1A2CB18DC(v4, v5, 4);
      uint64_t v11 = OUTLINED_FUNCTION_6_2();
      char v12 = MEMORY[0x1A623E880](v11);
      sub_1A2CB2E8C(v4, v5, 4);
      sub_1A2CB2E8C(v2, v3, 4);
      return v12 & 1;
    case 5:
      if (v6 != 5 || (v5 | v4) != 0) {
        goto LABEL_25;
      }
      goto LABEL_27;
    default:
      if (*(unsigned char *)(a2 + 16))
      {
LABEL_25:
        char v10 = 0;
        return v10 & 1;
      }
      if (v2 == v4 && v3 == v5)
      {
LABEL_27:
        char v10 = 1;
        return v10 & 1;
      }
      OUTLINED_FUNCTION_6_2();
      return sub_1A2CF4080();
  }
}

uint64_t ValueType.queryValue.getter()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = 1280070990;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      uint64_t v3 = sub_1A2CF4040();
      break;
    case 2:
      uint64_t v3 = *(void *)v0 & 1 | 0x30;
      break;
    case 3:
      uint64_t v5 = 0;
      sub_1A2CF3B70();
      goto LABEL_6;
    case 4:
      sub_1A2CBF7CC(v1, v2);
      uint64_t v3 = Data.queryValue.getter();
      sub_1A2CB2E8C(v1, v2, 4);
      break;
    case 5:
      return v3;
    default:
      uint64_t v5 = 39;
      sub_1A2CBB018();
      sub_1A2CF3D70();
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      sub_1A2CF39F0();
LABEL_6:
      uint64_t v3 = v5;
      break;
  }
  return v3;
}

uint64_t destroy for ValueType(uint64_t a1)
{
  return sub_1A2CB2E8C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s5TeaDB9ValueTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1A2CB18DC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ValueType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1A2CB18DC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1A2CB2E8C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ValueType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1A2CB2E8C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueType(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFB && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 5) {
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

uint64_t storeEnumTagSinglePayload for ValueType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A2CCE4EC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 4u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_1A2CCE504(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)__n128 result = a2 - 5;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ValueType()
{
  return &type metadata for ValueType;
}

uint64_t getEnumTagSinglePayload for ValueType.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ValueType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 5;
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
        JUMPOUT(0x1A2CCE680);
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
          void *result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueType.CodingKeys()
{
  return &type metadata for ValueType.CodingKeys;
}

unint64_t sub_1A2CCE6BC()
{
  unint64_t result = qword_1E959EEE0;
  if (!qword_1E959EEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEE0);
  }
  return result;
}

unint64_t sub_1A2CCE70C()
{
  unint64_t result = qword_1E959EEE8;
  if (!qword_1E959EEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEE8);
  }
  return result;
}

unint64_t sub_1A2CCE75C()
{
  unint64_t result = qword_1E959EEF0;
  if (!qword_1E959EEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEF0);
  }
  return result;
}

unint64_t sub_1A2CCE7A8()
{
  unint64_t result = qword_1E959EEF8;
  if (!qword_1E959EEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EEF8);
  }
  return result;
}

uint64_t Database.asyncWrite(_:block:)(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  sub_1A2CBB064(0, &qword_1EB5A5F70, MEMORY[0x1E4FBCB80], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  BOOL v9 = &v13[-v8];
  LOBYTE(a1) = *a1;
  uint64_t v10 = sub_1A2CF37B0();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v10);
  uint64_t v14 = v3;
  char v15 = (char)a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = v9;
  sub_1A2CD1AA8();
  swift_allocObject();
  uint64_t v11 = sub_1A2CF36F0();
  sub_1A2CD1AF8((uint64_t)v9);
  return v11;
}

uint64_t Database.read<A>(block:)()
{
  return sub_1A2CF3C60();
}

uint64_t sub_1A2CCE964(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1954047348;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1954047348;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x72656765746E69;
      break;
    case 2:
      uint64_t v5 = 1819242338;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x656C62756F64;
      break;
    case 4:
      uint64_t v5 = 1651469410;
      break;
    case 5:
      uint64_t v5 = 1819047278;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x72656765746E69;
      break;
    case 2:
      uint64_t v2 = 1819242338;
      break;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x656C62756F64;
      break;
    case 4:
      uint64_t v2 = 1651469410;
      break;
    case 5:
      uint64_t v2 = 1819047278;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1A2CF4080();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_1A2CCEAF0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1A2CCEAFC(char a1, char a2)
{
  unint64_t v2 = 0xE900000000000045;
  uint64_t v3 = 0x4445525245464544;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 0x54414944454D4D49;
    }
    else {
      uint64_t v4 = 0x564953554C435845;
    }
    unint64_t v5 = 0xE900000000000045;
  }
  else
  {
    unint64_t v5 = 0xE800000000000000;
    uint64_t v4 = 0x4445525245464544;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 0x54414944454D4D49;
    }
    else {
      uint64_t v3 = 0x564953554C435845;
    }
  }
  else
  {
    unint64_t v2 = 0xE800000000000000;
  }
  if (v4 == v3 && v5 == v2) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1A2CF4080();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

BOOL static Database.RecoveryMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Database.RecoveryMode.hash(into:)()
{
  return sub_1A2CF4130();
}

uint64_t Database.RecoveryMode.hashValue.getter()
{
  return sub_1A2CF4140();
}

BOOL static Database.VacuumMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Database.VacuumMode.hash(into:)()
{
  return sub_1A2CF4130();
}

uint64_t _s5TeaDB8DatabaseC14JournalingModeO9hashValueSivg_0()
{
  return sub_1A2CF4140();
}

void static Database.ConnectionMode.defaultTransient.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x4014000000000000;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t Database.__allocating_init(safeLocation:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 16);
  if (qword_1EB5A61F0 != -1) {
    swift_once();
  }
  unint64_t v6 = (void *)qword_1EB5A8268;
  sub_1A2CC845C();
  uint64_t v47 = v7;
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1A2CF49A0;
  id v9 = v6;
  uint64_t v10 = sub_1A2CBBD44();
  uint64_t v12 = v11;
  *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v13 = sub_1A2CC84C4();
  *(void *)(v8 + 64) = v13;
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v12;
  sub_1A2CF3C20();
  OUTLINED_FUNCTION_35();

  swift_bridgeObjectRelease();
  sub_1A2CB8070(v4, v3, v5);
  if (qword_1EB5A5CC8 != -1) {
    swift_once();
  }
  HIBYTE(v53) = 0;
  uint64_t v14 = OUTLINED_FUNCTION_14();
  BYTE4(v49) = 1;
  OUTLINED_FUNCTION_1_3();
  uint64_t v45 = v2;
  if (v9)
  {
    char v15 = v9;
    id v16 = (id)qword_1EB5A8268;
    sub_1A2CF3C00();
    uint64_t v17 = (__n128 *)OUTLINED_FUNCTION_32();
    uint64_t v18 = OUTLINED_FUNCTION_7_2(v17, (__n128)xmmword_1A2CF4990);
    unint64_t v19 = MEMORY[0x1E4FBB1A0];
    v17[3].n128_u64[1] = MEMORY[0x1E4FBB1A0];
    v17[4].n128_u64[0] = v13;
    v17[2].n128_u64[0] = v18;
    v17[2].n128_u64[1] = v20;
    uint64_t v21 = sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
    OUTLINED_FUNCTION_28(v21, v22, v21, MEMORY[0x1E4FBBED0], MEMORY[0x1E4FBBEE0], v23, v24, v25, v38, v40, 2, 4, v43, v45, v47, v49, v51, v53, (char)v15);
    uint64_t v44 = v26;
    sub_1A2CF3EF0();
    v17[6].n128_u64[0] = v19;
    v17[6].n128_u64[1] = v13;
    v17[4].n128_u64[1] = 0;
    v17[5].n128_u64[0] = 0xE000000000000000;
    OUTLINED_FUNCTION_40();
    sub_1A2CF3720();

    swift_bridgeObjectRelease();
    HIBYTE(v54) = 0;
    uint64_t v14 = OUTLINED_FUNCTION_14();
    BYTE4(v50) = 1;
    OUTLINED_FUNCTION_1_3();
    if (v16)
    {
      id v27 = (id)qword_1EB5A8268;
      HIDWORD(v41) = sub_1A2CF3C00();
      uint64_t v28 = (__n128 *)OUTLINED_FUNCTION_32();
      OUTLINED_FUNCTION_7_2(v28, v42);
      OUTLINED_FUNCTION_3_3();
      unint64_t v29 = MEMORY[0x1E4FBB1A0];
      v28[3].n128_u64[1] = MEMORY[0x1E4FBB1A0];
      v28[4].n128_u64[0] = v13;
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_28(v30, v31, v32, MEMORY[0x1E4FBBED0], MEMORY[0x1E4FBBEE0], v33, v34, v35, v39, v41, v42.n128_i64[0], v42.n128_i64[1], v44, v46, v48, v50, v52, v54, 0);
      sub_1A2CF3EF0();
      v28[6].n128_u64[0] = v29;
      v28[6].n128_u64[1] = v13;
      v28[4].n128_u64[1] = 0;
      v28[5].n128_u64[0] = 0;
      sub_1A2CF3720();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_14();
      uint64_t v14 = (uint64_t)sub_1A2CCFCA8();

      uint64_t v36 = v16;
    }
    else
    {
      OUTLINED_FUNCTION_3_3();
      uint64_t v36 = v15;
    }
  }
  else
  {
    OUTLINED_FUNCTION_3_3();
  }
  return v14;
}

uint64_t Database.__allocating_init(safeLocation:assertions:recoveryMode:)(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v1 = *(void *)(a1 + 8);
  unsigned __int8 v3 = *(unsigned char *)(a1 + 16);
  if (qword_1EB5A61F0 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_1EB5A8268;
  sub_1A2CC845C();
  uint64_t v41 = v5;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1A2CF49A0;
  id v7 = v4;
  uint64_t v8 = sub_1A2CBBD44();
  uint64_t v10 = v9;
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v43 = sub_1A2CC84C4();
  *(void *)(v6 + 64) = v43;
  *(void *)(v6 + 32) = v8;
  *(void *)(v6 + 40) = v10;
  sub_1A2CF3C20();
  OUTLINED_FUNCTION_35();

  swift_bridgeObjectRelease();
  HIBYTE(v52) = 0;
  uint64_t v11 = OUTLINED_FUNCTION_14();
  sub_1A2CB8070(v2, v1, v3);
  BYTE4(v48) = 1;
  OUTLINED_FUNCTION_1_3();
  id v45 = v7;
  if (v7)
  {
    id v12 = (id)qword_1EB5A8268;
    sub_1A2CF3C00();
    unint64_t v13 = (__n128 *)OUTLINED_FUNCTION_32();
    uint64_t v14 = OUTLINED_FUNCTION_7_2(v13, (__n128)xmmword_1A2CF4990);
    unint64_t v15 = MEMORY[0x1E4FBB1A0];
    unint64_t v16 = v43;
    v13[3].n128_u64[1] = MEMORY[0x1E4FBB1A0];
    v13[4].n128_u64[0] = v43;
    v13[2].n128_u64[0] = v14;
    v13[2].n128_u64[1] = v17;
    uint64_t v18 = sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
    OUTLINED_FUNCTION_28(v18, v19, v18, MEMORY[0x1E4FBBED0], MEMORY[0x1E4FBBEE0], v20, v21, v22, 2, 4, v37, v39, v41, v43, (uint64_t)v45, v48, v50, v52, (char)v45);
    uint64_t v40 = v23;
    sub_1A2CF3EF0();
    v13[6].n128_u64[0] = v15;
    v13[6].n128_u64[1] = v16;
    v13[4].n128_u64[1] = 0;
    v13[5].n128_u64[0] = 0xE000000000000000;
    OUTLINED_FUNCTION_40();
    sub_1A2CF3720();

    swift_bridgeObjectRelease();
    HIBYTE(v53) = 0;
    uint64_t v11 = OUTLINED_FUNCTION_14();
    BYTE4(v49) = 1;
    OUTLINED_FUNCTION_1_3();
    if (v12)
    {
      id v24 = (id)qword_1EB5A8268;
      sub_1A2CF3C00();
      uint64_t v25 = (__n128 *)OUTLINED_FUNCTION_32();
      OUTLINED_FUNCTION_7_2(v25, v36);
      OUTLINED_FUNCTION_3_3();
      unint64_t v26 = MEMORY[0x1E4FBB1A0];
      uint64_t v27 = v44;
      v25[3].n128_u64[1] = MEMORY[0x1E4FBB1A0];
      v25[4].n128_u64[0] = v44;
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_28(v28, v29, v30, MEMORY[0x1E4FBBED0], MEMORY[0x1E4FBBEE0], v31, v32, v33, v36.n128_i64[0], v36.n128_i64[1], v38, v40, v42, v44, (uint64_t)v46, v49, v51, v53, 0);
      sub_1A2CF3EF0();
      v25[6].n128_u64[0] = v26;
      v25[6].n128_u64[1] = v27;
      v25[4].n128_u64[1] = 0;
      v25[5].n128_u64[0] = 0;
      sub_1A2CF3720();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_14();
      uint64_t v11 = (uint64_t)sub_1A2CCFCA8();

      uint64_t v34 = v12;
    }
    else
    {
      OUTLINED_FUNCTION_3_3();
      uint64_t v34 = v46;
    }
  }
  else
  {
    OUTLINED_FUNCTION_3_3();
  }
  return v11;
}

uint64_t Database.__allocating_init(location:journalingMode:recoveryMode:cacheSize:vacuumMode:shouldTakeRBAssertion:busyTimeout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    if (qword_1EB5A69B0 == -1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  if (qword_1EB5A5CC8 != -1) {
LABEL_6:
  }
    swift_once();
LABEL_5:
  uint64_t v6 = swift_allocObject();
  Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
  return v6;
}

uint64_t sub_1A2CCF564(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3 && (*(void *)(v3 + 16) & 0x10) != 0) {
    sub_1A2CB859C();
  }
  unsigned int v4 = tdb_truncate_db(a1);
  unint64_t v5 = sub_1A2CB20C8(v4);
  uint64_t v7 = v6;
  unsigned __int8 v9 = v8;
  if (sub_1A2CB2720(v5, v6, v8, 0, 0, 29))
  {
    sub_1A2CB1E90(v5, v7, v9);
  }
  else
  {
    if (v9 != 29 || __PAIR128__(v7, v5) >= 3)
    {
      if (qword_1EB5A61F0 != -1) {
        swift_once();
      }
      id v10 = (id)qword_1EB5A8268;
      sub_1A2CF3C00();
      sub_1A2CC845C();
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_1A2CF4990;
      sub_1A2CF3EF0();
      uint64_t v12 = MEMORY[0x1E4FBB1A0];
      *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v13 = sub_1A2CC84C4();
      *(void *)(v11 + 32) = 0;
      *(void *)(v11 + 40) = 0xE000000000000000;
      *(void *)(v11 + 96) = v12;
      *(void *)(v11 + 104) = v13;
      *(void *)(v11 + 64) = v13;
      *(void *)(v11 + 72) = 0x657461636E757274;
      *(void *)(v11 + 80) = 0xE800000000000000;
      sub_1A2CF3720();

      swift_bridgeObjectRelease();
    }
    sub_1A2CB2C84();
    swift_allocError();
    *(void *)uint64_t v14 = v5;
    *(void *)(v14 + 8) = v7;
    *(unsigned char *)(v14 + 16) = v9;
    swift_willThrow();
  }
  return swift_release();
}

void Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:connectionMode:)()
{
}

void Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:connectionMode:)()
{
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8_2(v4, v5, v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_39();
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = OUTLINED_FUNCTION_21();
  MEMORY[0x1F4188790](v13 - 8);
  unint64_t v14 = OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_11_1(v14);
  uint64_t v35 = MEMORY[0x1E4FBC860];
  sub_1A2CB9304(&qword_1EB5A6908, MEMORY[0x1E4FBCC10]);
  unint64_t v15 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCC10];
  sub_1A2CBB064(0, &qword_1EB5A68F0, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
  unsigned __int8 v17 = v16;
  sub_1A2CB9454((unint64_t *)&unk_1EB5A68F8, &qword_1EB5A68F0, v15);
  OUTLINED_FUNCTION_19_0();
  uint64_t v18 = OUTLINED_FUNCTION_25();
  v19(v18);
  *(void *)(v3 + 16) = OUTLINED_FUNCTION_9_1();
  if ((v34 & 2) != 0)
  {
    uint64_t v35 = v34;
    sub_1A2CB859C();
  }
  OUTLINED_FUNCTION_23();
  sub_1A2CF3980();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_1();
  int v20 = OUTLINED_FUNCTION_24();
  swift_endAccess();
  swift_release();
  if (v20)
  {
    if (sqlite3_errmsg(*v1))
    {
      uint64_t v21 = sub_1A2CF3A00();
      uint64_t v23 = v22;
      sub_1A2CCE7A8();
      OUTLINED_FUNCTION_12_1();
      *(void *)uint64_t v24 = v21;
      *(void *)(v24 + 8) = v23;
    }
    else
    {
      sub_1A2CCE7A8();
      OUTLINED_FUNCTION_12_1();
      OUTLINED_FUNCTION_31();
      *(void *)uint64_t v24 = v30;
      *(void *)(v24 + 8) = 0x80000001A2CF7930;
    }
    *(void *)(v24 + 16) = &qword_1EB5A68F0;
    *(void *)(v24 + 24) = v2;
    *(unsigned char *)(v24 + 32) = v17;
    swift_willThrow();
    if (*v1) {
      sqlite3_close(*v1);
    }
LABEL_19:
    swift_release();
    goto LABEL_20;
  }
  sub_1A2CBBD20((uint64_t)&qword_1EB5A68F0, v2, v17);
  uint64_t v25 = *v1;
  if (!*v1) {
    goto LABEL_20;
  }
  type metadata accessor for Connection();
  uint64_t v26 = swift_allocObject();
  OUTLINED_FUNCTION_38(v26);
  char *v1 = v25;
  if ((*(void *)v33 & 0x100000000) == 0) {
    sqlite3_busy_timeout(v25, *(int *)v33);
  }
  OUTLINED_FUNCTION_22_0();
  uint64_t v27 = v0;
  if (v0)
  {
    if ((v32 & 1) != 0
      && (id v28 = v0, sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950),
                                 (swift_dynamicCast() & 1) != 0))
    {
      if (v37 == 10)
      {
        sub_1A2CB1E90(v35, v36, 0xAu);
        if (qword_1EB5A61F0 != -1) {
          swift_once();
        }
        id v29 = (id)qword_1EB5A8268;
        sub_1A2CF3C10();
        sub_1A2CF3720();

        sub_1A2CCF564((uint64_t)v25);
        OUTLINED_FUNCTION_27();

        uint64_t v27 = 0;
        goto LABEL_25;
      }
      swift_release();
      sub_1A2CB1E90(v35, v36, v37);
    }
    else
    {
      swift_release();
    }
    swift_willThrow();
    goto LABEL_20;
  }
LABEL_25:
  if ((v31 & 1) == 0)
  {
    OUTLINED_FUNCTION_30();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_1((uint64_t)"PRAGMA cache_size = ");
    sub_1A2CF4040();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_36();
    if (v27) {
      goto LABEL_19;
    }
  }
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_33();
  sub_1A2CF3EF0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_36();
  if (v27) {
    goto LABEL_19;
  }
LABEL_20:
  swift_release();
  OUTLINED_FUNCTION_15_1();
}

void *sub_1A2CCFCA8()
{
  uint64_t v9 = sub_1A2CF3C40();
  uint64_t v1 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1A2CF3C30();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1A2CF37B0();
  MEMORY[0x1F4188790](v5 - 8);
  v8[1] = sub_1A2CBA79C();
  v0[2] = 0;
  v0[3] = 0;
  sub_1A2CF37A0();
  uint64_t v10 = MEMORY[0x1E4FBC860];
  sub_1A2CB9304(&qword_1EB5A6908, MEMORY[0x1E4FBCC10]);
  uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCC10];
  sub_1A2CBB064(0, &qword_1EB5A68F0, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
  sub_1A2CB9454((unint64_t *)&unk_1EB5A68F8, &qword_1EB5A68F0, v6);
  sub_1A2CF3D90();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v9);
  v0[4] = sub_1A2CF3C90();
  v0[2] = 0;
  swift_release();
  return v0;
}

void *static Database.noop()()
{
  return sub_1A2CCFCA8();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.close()()
{
  uint64_t v1 = swift_beginAccess();
  if (*(void *)(v0 + 24))
  {
    uint64_t v2 = *(void *)(v0 + 16);
    if (v2)
    {
      if ((*(void *)(v2 + 16) & 4) != 0) {
        uint64_t v1 = sub_1A2CB859C();
      }
    }
    MEMORY[0x1F4188790](v1);
    sub_1A2CF3C60();
    swift_release();
  }
}

uint64_t sub_1A2CD0044(sqlite3 *a1)
{
  unsigned int v1 = sqlite3_close(a1);
  unint64_t v2 = sub_1A2CB20C8(v1);
  uint64_t v4 = v3;
  unsigned __int8 v6 = v5;
  if (sub_1A2CB2720(v2, v3, v5, 0, 0, 29)) {
    return sub_1A2CB1E90(v2, v4, v6);
  }
  if (v6 != 29 || __PAIR128__(v4, v2) >= 3)
  {
    if (qword_1EB5A61F0 != -1) {
      swift_once();
    }
    id v8 = (id)qword_1EB5A8268;
    sub_1A2CF3C00();
    sub_1A2CC845C();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1A2CF4990;
    sub_1A2CF3EF0();
    uint64_t v10 = MEMORY[0x1E4FBB1A0];
    *(void *)(v9 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v11 = sub_1A2CC84C4();
    *(void *)(v9 + 32) = 0;
    *(void *)(v9 + 40) = 0xE000000000000000;
    *(void *)(v9 + 96) = v10;
    *(void *)(v9 + 104) = v11;
    *(void *)(v9 + 64) = v11;
    *(void *)(v9 + 72) = 0x65736F6C63;
    *(void *)(v9 + 80) = 0xE500000000000000;
    sub_1A2CF3720();

    swift_bridgeObjectRelease();
  }
  sub_1A2CB2C84();
  swift_allocError();
  *(void *)uint64_t v12 = v2;
  *(void *)(v12 + 8) = v4;
  *(unsigned char *)(v12 + 16) = v6;
  return swift_willThrow();
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.userVersion()()
{
  if (*(void *)(v0 + 16))
  {
    swift_retain();
    sub_1A2CB29B0(0xD000000000000014, 0x80000001A2CF79E0);
    if (v1)
    {
      swift_release();
    }
    else
    {
      sub_1A2CB1B3C(1, 0, 29);
      unsigned __int8 v6 = 1;
      sub_1A2CB1A04(0, &v6, 0, (uint64_t)v7);
      Swift::Int v2 = v7[0];
      if (v8 == 1)
      {
        sub_1A2CB1BB0();
        swift_release();
        swift_release();
      }
      else
      {
        sub_1A2CB2E8C(v7[0], v7[1], v8);
        sub_1A2CB1BB0();
        swift_release();
        swift_release();
        return -1;
      }
    }
  }
  else
  {
    sub_1A2CCE7A8();
    uint64_t v3 = OUTLINED_FUNCTION_12_1();
    OUTLINED_FUNCTION_16_1(v3, v4);
  }
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.setUserVersion(_:)(Swift::Int a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    if ((*(void *)(v2 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A2CB859C();
    }
    else
    {
      swift_retain();
    }
    sub_1A2CF3DD0();
    swift_bridgeObjectRelease();
    sub_1A2CF4040();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_26();
    sub_1A2CAF5FC(*(sqlite3 **)(v2 + 24));
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    sub_1A2CCE7A8();
    uint64_t v3 = OUTLINED_FUNCTION_12_1();
    OUTLINED_FUNCTION_16_1(v3, v4);
  }
}

uint64_t Database.asyncRead<A>(block:)()
{
  sub_1A2CF3700();
  swift_allocObject();
  swift_weakInit();
  uint64_t v0 = sub_1A2CF36E0();
  swift_release();
  return v0;
}

void sub_1A2CD05A4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v31 = a3;
  uint64_t v32 = a4;
  uint64_t v13 = sub_1A2CF3790();
  uint64_t v30 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  unint64_t v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1A2CF37B0();
  uint64_t v16 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v18 = (char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v28[1] = *(void *)(Strong + 32);
    int v20 = (void *)swift_allocObject();
    v20[2] = a8;
    v20[3] = a6;
    v20[4] = a7;
    v20[5] = a1;
    uint64_t v21 = v31;
    uint64_t v22 = v32;
    v20[6] = a2;
    v20[7] = v21;
    v20[8] = v22;
    aBlock[4] = sub_1A2CD3AE8;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A2CC0840;
    aBlock[3] = &block_descriptor_41;
    uint64_t v23 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A2CF37A0();
    uint64_t v33 = MEMORY[0x1E4FBC860];
    sub_1A2CB9304(&qword_1EB5A6888, MEMORY[0x1E4FBCB00]);
    uint64_t v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
    sub_1A2CBB064(0, &qword_1EB5A68D0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    sub_1A2CB9454(&qword_1EB5A68D8, &qword_1EB5A68D0, v24);
    sub_1A2CF3D90();
    MEMORY[0x1A623EFC0](0, v18, v15, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v13);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v29);
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v25 = sub_1A2CF3680();
    sub_1A2CB9304(&qword_1E959EF18, MEMORY[0x1E4FAA9B0]);
    uint64_t v26 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x1E4FAA9A0], v25);
    v31(v26);
  }
}

uint64_t sub_1A2CD099C(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *(void *)(a7 - 8);
  uint64_t v10 = (void (*)(void))MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10();
  a3(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a7);
}

void Database.write(_:block:)()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v14 = v1;
  uint64_t v2 = v0;
  uint64_t v13 = v3;
  char v5 = v4;
  uint64_t v6 = sub_1A2CF3790();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *v5;
  uint64_t v12 = *(void *)(v2 + 32);
  uint64_t v11 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1A2CBB064(0, &qword_1EB5A5F68, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBBE00]);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1A2CF49A0;
  sub_1A2CF3780();
  sub_1A2CB9304(&qword_1EB5A6888, MEMORY[0x1E4FBCB00]);
  sub_1A2CBB064(0, &qword_1EB5A68D0, v11, MEMORY[0x1E4FBB320]);
  sub_1A2CB9454(&qword_1EB5A68D8, &qword_1EB5A68D0, v11);
  sub_1A2CF3D90();
  uint64_t v15 = v2;
  char v16 = v10;
  uint64_t v17 = v13;
  uint64_t v18 = v14;
  sub_1A2CF3C50();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  OUTLINED_FUNCTION_15_1();
}

uint64_t sub_1A2CD0D04(uint64_t a1, char a2, void (*a3)(uint64_t))
{
  char v4 = a2;
  return sub_1A2CD0D34((uint64_t)&v4, a1, a3);
}

uint64_t sub_1A2CD0D34(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    if ((*(void *)(v4 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A2CB859C();
    }
    else
    {
      swift_retain();
    }
    sub_1A2CF3DD0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    sub_1A2CD3A4C();
    uint64_t inited = swift_initStackObject();
    uint64_t v8 = type metadata accessor for Connection();
    *(void *)(inited + 64) = v8;
    *(void *)(inited + 72) = &off_1EF5DFB58;
    uint64_t v9 = MEMORY[0x1E4FBC860];
    *(void *)(inited + 40) = v4;
    *(void *)(inited + 80) = v9;
    *(unsigned char *)(inited + 32) = 5;
    *(void *)(inited + 16) = 0x204E49474542;
    *(void *)(inited + 24) = 0xE600000000000000;
    swift_retain();
    sub_1A2CEDDAC();
    if (v3)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1A2CB7844();
      uint64_t v10 = swift_deallocClassInstance();
      a3(v10);
      uint64_t v11 = swift_initStackObject();
      *(void *)(v11 + 64) = v8;
      *(void *)(v11 + 72) = &off_1EF5DFB58;
      *(void *)(v11 + 40) = v4;
      *(void *)(v11 + 80) = v9;
      *(unsigned char *)(v11 + 32) = 5;
      *(void *)(v11 + 16) = 0xD000000000000013;
      *(void *)(v11 + 24) = 0x80000001A2CF7B00;
      swift_retain();
      sub_1A2CEDDAC();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_setDeallocating();
    sub_1A2CB7844();
    swift_deallocClassInstance();
    return swift_release();
  }
  else
  {
    sub_1A2CCE7A8();
    swift_allocError();
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(unsigned char *)(v5 + 32) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_1A2CD10E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6)
  {
    if ((*(void *)(v6 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A2CB859C();
    }
    else
    {
      swift_retain();
    }
    sub_1A2CF3DD0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    sub_1A2CD3A4C();
    uint64_t inited = swift_initStackObject();
    uint64_t v9 = type metadata accessor for Connection();
    *(void *)(inited + 64) = v9;
    *(void *)(inited + 72) = &off_1EF5DFB58;
    uint64_t v10 = MEMORY[0x1E4FBC860];
    *(void *)(inited + 40) = v6;
    *(void *)(inited + 80) = v10;
    *(unsigned char *)(inited + 32) = 5;
    *(void *)(inited + 16) = 0x204E49474542;
    *(void *)(inited + 24) = 0xE600000000000000;
    swift_retain();
    sub_1A2CEDDAC();
    if (v5)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1A2CB7844();
      uint64_t v12 = swift_deallocClassInstance();
      uint64_t v13 = a3(v12);
      a5(v13);
      uint64_t v14 = swift_initStackObject();
      *(void *)(v14 + 64) = v9;
      *(void *)(v14 + 72) = &off_1EF5DFB58;
      *(void *)(v14 + 40) = v6;
      *(void *)(v14 + 80) = MEMORY[0x1E4FBC860];
      *(unsigned char *)(v14 + 32) = 5;
      *(void *)(v14 + 16) = 0xD000000000000013;
      *(void *)(v14 + 24) = 0x80000001A2CF7B00;
      swift_retain();
      sub_1A2CEDDAC();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_setDeallocating();
    sub_1A2CB7844();
    swift_deallocClassInstance();
    swift_release();
    swift_release();
  }
  else
  {
    sub_1A2CCE7A8();
    swift_allocError();
    *(_OWORD *)uint64_t v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(unsigned char *)(v7 + 32) = 0;
    swift_willThrow();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1A2CD1524(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = v2;
    if ((*(void *)(v4 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A2CB859C();
    }
    else
    {
      swift_retain();
    }
    sub_1A2CF3DD0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    sub_1A2CD3A4C();
    uint64_t inited = swift_initStackObject();
    uint64_t v9 = type metadata accessor for Connection();
    *(void *)(inited + 64) = v9;
    *(void *)(inited + 72) = &off_1EF5DFB58;
    uint64_t v10 = MEMORY[0x1E4FBC860];
    *(void *)(inited + 40) = v4;
    *(void *)(inited + 80) = v10;
    *(unsigned char *)(inited + 32) = 5;
    *(void *)(inited + 16) = 0x204E49474542;
    *(void *)(inited + 24) = 0xE600000000000000;
    swift_retain();
    sub_1A2CEDDAC();
    if (v3)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1A2CB7844();
      swift_deallocClassInstance();
      a2(v5);
      uint64_t v11 = swift_initStackObject();
      *(void *)(v11 + 64) = v9;
      *(void *)(v11 + 72) = &off_1EF5DFB58;
      *(void *)(v11 + 40) = v4;
      *(void *)(v11 + 80) = MEMORY[0x1E4FBC860];
      *(unsigned char *)(v11 + 32) = 5;
      *(void *)(v11 + 16) = 0xD000000000000013;
      *(void *)(v11 + 24) = 0x80000001A2CF7B00;
      swift_retain();
      sub_1A2CEDDAC();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_setDeallocating();
    sub_1A2CB7844();
    swift_deallocClassInstance();
    return swift_release();
  }
  else
  {
    sub_1A2CCE7A8();
    swift_allocError();
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(unsigned char *)(v6 + 32) = 0;
    return swift_willThrow();
  }
}

uint64_t Database.asyncWrite(_:qos:block:)()
{
  return sub_1A2CF36F0();
}

uint64_t sub_1A2CD195C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = a3;
  *(void *)(v18 + 32) = a4;
  *(unsigned char *)(v18 + 40) = a6;
  *(void *)(v18 + 48) = a7;
  *(void *)(v18 + 56) = a8;
  *(void *)(v18 + 64) = sub_1A2CD3B34;
  *(void *)(v18 + 72) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A2CD1E38(a9, (uint64_t)sub_1A2CD3BAC, v18);
  sub_1A2CF3C80();
  swift_release();
  return swift_release();
}

void sub_1A2CD1AA8()
{
  if (!qword_1EB5A5D98[0])
  {
    unint64_t v0 = sub_1A2CF3700();
    if (!v1) {
      atomic_store(v0, qword_1EB5A5D98);
    }
  }
}

uint64_t sub_1A2CD1AF8(uint64_t a1)
{
  sub_1A2CBB064(0, &qword_1EB5A5F70, MEMORY[0x1E4FBCB80], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A2CD1B84()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

void sub_1A2CD1BAC(uint64_t a1, void (*a2)(void *), uint64_t a3, char a4, uint64_t (*a5)(uint64_t), uint64_t a6, void (*a7)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v13 = Strong;
    LOBYTE(v17) = a4;
    swift_retain();
    swift_retain();
    sub_1A2CD10E0((uint64_t)&v17, v13, a5, a6, a7);
    swift_release();
  }
  else
  {
    uint64_t v14 = sub_1A2CF3680();
    sub_1A2CB9304(&qword_1E959EF18, MEMORY[0x1E4FAA9B0]);
    uint64_t v15 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x1E4FAA9A0], v14);
    a2(v15);
  }
}

uint64_t sub_1A2CD1E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a2;
  uint64_t v5 = sub_1A2CF3790();
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2CBB064(0, &qword_1EB5A5F70, MEMORY[0x1E4FBCB80], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_1A2CF37B0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v24 - v16;
  sub_1A2CD3BC4(a1, (uint64_t)v10);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_1A2CD1AF8((uint64_t)v10);
    uint64_t v18 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
    sub_1A2CBB064(0, &qword_1EB5A5F68, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBBE00]);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1A2CF49A0;
    sub_1A2CF3780();
    uint64_t aBlock = v19;
    sub_1A2CB9304(&qword_1EB5A6888, MEMORY[0x1E4FBCB00]);
    sub_1A2CBB064(0, &qword_1EB5A68D0, v18, MEMORY[0x1E4FBB320]);
    sub_1A2CB9454(&qword_1EB5A68D8, &qword_1EB5A68D0, v18);
    sub_1A2CF3D90();
    uint64_t v30 = v25;
    uint64_t v31 = a3;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v27 = 1107296256;
    id v28 = sub_1A2CC0840;
    uint64_t v29 = &block_descriptor_51;
    _Block_copy(&aBlock);
    sub_1A2CF3800();
    swift_allocObject();
    swift_retain();
    uint64_t v20 = sub_1A2CF37F0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    uint64_t v21 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
    sub_1A2CBB064(0, &qword_1EB5A5F68, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBBE00]);
    uint64_t v24 = v7;
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1A2CF4990;
    sub_1A2CF3780();
    sub_1A2CF3770();
    uint64_t aBlock = v22;
    sub_1A2CB9304(&qword_1EB5A6888, MEMORY[0x1E4FBCB00]);
    sub_1A2CBB064(0, &qword_1EB5A68D0, v21, MEMORY[0x1E4FBB320]);
    sub_1A2CB9454(&qword_1EB5A68D8, &qword_1EB5A68D0, v21);
    sub_1A2CF3D90();
    uint64_t v30 = v25;
    uint64_t v31 = a3;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v27 = 1107296256;
    id v28 = sub_1A2CC0840;
    uint64_t v29 = &block_descriptor_54;
    _Block_copy(&aBlock);
    sub_1A2CF3800();
    swift_allocObject();
    swift_retain();
    uint64_t v20 = sub_1A2CF37E0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  swift_release();
  return v20;
}

uint64_t Database.asyncWriteWithDatabase<A>(_:block:)()
{
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CD246C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v33 = a7;
  uint64_t v34 = a8;
  int v31 = a6;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v26 = a9;
  uint64_t v35 = sub_1A2CF37B0();
  uint64_t v10 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1A2CF3790();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = *(void *)(a5 + 32);
  uint64_t v17 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1A2CBB064(0, &qword_1EB5A5F68, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBBE00]);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1A2CF49A0;
  sub_1A2CF3780();
  aBlock[0] = v18;
  sub_1A2CB9304(&qword_1EB5A6888, MEMORY[0x1E4FBCB00]);
  sub_1A2CBB064(0, &qword_1EB5A68D0, v17, MEMORY[0x1E4FBB320]);
  sub_1A2CB9454(&qword_1EB5A68D8, &qword_1EB5A68D0, v17);
  sub_1A2CF3D90();
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v26;
  *(void *)(v20 + 24) = v19;
  uint64_t v21 = v28;
  *(void *)(v20 + 32) = v27;
  *(void *)(v20 + 40) = v21;
  *(unsigned char *)(v20 + 48) = v31;
  uint64_t v22 = v34;
  *(void *)(v20 + 56) = v33;
  *(void *)(v20 + 64) = v22;
  uint64_t v23 = v30;
  *(void *)(v20 + 72) = v29;
  *(void *)(v20 + 80) = v23;
  aBlock[4] = sub_1A2CD39F0;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A2CC0840;
  aBlock[3] = &block_descriptor_0;
  uint64_t v24 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A2CF37A0();
  MEMORY[0x1A623EFC0](0, v12, v16, v24);
  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v35);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_release();
  return swift_release();
}

void sub_1A2CD2834(uint64_t a1, void (*a2)(void *), uint64_t a3, char a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    LOBYTE(v10) = a4;
    MEMORY[0x1F4188790](Strong);
    sub_1A2CD1524((uint64_t)&v10, (void (*)(uint64_t))sub_1A2CD3A28);
    swift_release();
  }
  else
  {
    uint64_t v7 = sub_1A2CF3680();
    sub_1A2CB9304(&qword_1E959EF18, MEMORY[0x1E4FAA9B0]);
    uint64_t v8 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x1E4FAA9A0], v7);
    a2(v8);
  }
}

uint64_t sub_1A2CD2AF4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *), uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void *)(a6 - 8);
  uint64_t v10 = MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v13(v10);
  if (!v6)
  {
    a4(v12);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a6);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.checkpoint()()
{
}

uint64_t sub_1A2CD2C14(int a1, sqlite3 *db)
{
  unsigned int v2 = sqlite3_wal_checkpoint_v2(db, 0, 3, 0, 0);
  unint64_t v3 = sub_1A2CB20C8(v2);
  uint64_t v5 = v4;
  unsigned __int8 v7 = v6;
  if (sub_1A2CB2720(v3, v4, v6, 0, 0, 29)) {
    return sub_1A2CB1E90(v3, v5, v7);
  }
  if (v7 != 29 || __PAIR128__(v5, v3) >= 3)
  {
    if (qword_1EB5A61F0 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1EB5A8268;
    sub_1A2CF3C00();
    sub_1A2CC845C();
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1A2CF4990;
    sub_1A2CF3EF0();
    uint64_t v11 = MEMORY[0x1E4FBB1A0];
    *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v12 = sub_1A2CC84C4();
    *(void *)(v10 + 32) = 0;
    *(void *)(v10 + 40) = 0xE000000000000000;
    *(void *)(v10 + 96) = v11;
    *(void *)(v10 + 104) = v12;
    *(void *)(v10 + 64) = v12;
    *(void *)(v10 + 72) = 0x696F706B63656863;
    *(void *)(v10 + 80) = 0xEA0000000000746ELL;
    sub_1A2CF3720();

    swift_bridgeObjectRelease();
  }
  sub_1A2CB2C84();
  swift_allocError();
  *(void *)uint64_t v13 = v3;
  *(void *)(v13 + 8) = v5;
  *(unsigned char *)(v13 + 16) = v7;
  return swift_willThrow();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.incrementalVacuum()()
{
}

uint64_t sub_1A2CD2E3C()
{
  uint64_t v1 = swift_beginAccess();
  if (*(void *)(v0 + 24))
  {
    uint64_t v2 = *(void *)(v0 + 16);
    if (v2)
    {
      if ((*(void *)(v2 + 16) & 0x10) != 0) {
        uint64_t v1 = sub_1A2CB859C();
      }
    }
    MEMORY[0x1F4188790](v1);
    sub_1A2CF3C60();
    return swift_release();
  }
  else
  {
    sub_1A2CCE7A8();
    OUTLINED_FUNCTION_12_1();
    *(_OWORD *)uint64_t v3 = xmmword_1A2CF53A0;
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_1A2CD2F58@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1A2CD2F64(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_1A2CD2F74(uint64_t result)
{
  *v1 &= result;
  return result;
}

BOOL sub_1A2CD2F84(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1A2CD2F90(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_1A2CD2F9C()
{
  return sub_1A2CD0044(*(sqlite3 **)(v0 + 16));
}

uint64_t sub_1A2CD2FB8()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1A2CD2FF0(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  sub_1A2CD05A4(a1, a2, a3, a4, v4[3], v4[4], v4[5], v4[2]);
}

uint64_t sub_1A2CD2FFC()
{
  return sub_1A2CD0D04(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
}

uint64_t sub_1A2CD3020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CD195C(a1, a2, a3, a4, *(void *)(v4 + 16), *(unsigned char *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48));
}

uint64_t sub_1A2CD3054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CD246C(a1, a2, a3, a4, *(void *)(v4 + 24), *(unsigned __int8 *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), *(void *)(v4 + 16));
}

uint64_t sub_1A2CD3084()
{
  return sub_1A2CD2C14(*(void *)(v0 + 16), *(sqlite3 **)(v0 + 24));
}

uint64_t sub_1A2CD30A0()
{
  return sub_1A2CAF5FC(*(sqlite3 **)(v0 + 24));
}

unint64_t sub_1A2CD30D8()
{
  unint64_t result = qword_1E959EF00;
  if (!qword_1E959EF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EF00);
  }
  return result;
}

unint64_t sub_1A2CD3128()
{
  unint64_t result = qword_1E959EF08;
  if (!qword_1E959EF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EF08);
  }
  return result;
}

unint64_t sub_1A2CD3178()
{
  unint64_t result = qword_1E959EF10;
  if (!qword_1E959EF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959EF10);
  }
  return result;
}

uint64_t method lookup function for Database(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Database);
}

uint64_t dispatch thunk of Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:connectionMode:)()
{
  OUTLINED_FUNCTION_34();
  return v0();
}

uint64_t assignWithCopy for Database.Location(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1A2CB8070(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1A2CBBD20(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Database.Location(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1A2CBBD20(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Database.Location(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
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

uint64_t storeEnumTagSinglePayload for Database.Location(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A2CD3330(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

unint64_t destroy for Database.Errors(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(a1 + 16);
    uint64_t v4 = *(void *)(a1 + 24);
    unsigned __int8 v5 = *(unsigned char *)(a1 + 32);
    return sub_1A2CBBD20(v3, v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for Database.Errors(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void *)(a2 + 16);
    uint64_t v5 = *(void *)(a2 + 24);
    unsigned __int8 v6 = *(unsigned char *)(a2 + 32);
    swift_bridgeObjectRetain();
    sub_1A2CB8070(v4, v5, v6);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v5;
    *(unsigned char *)(a1 + 32) = v6;
  }
  return a1;
}

uint64_t assignWithCopy for Database.Errors(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      uint64_t v11 = *((void *)a2 + 2);
      uint64_t v12 = *((void *)a2 + 3);
      unsigned __int8 v13 = *((unsigned char *)a2 + 32);
      swift_bridgeObjectRetain();
      sub_1A2CB8070(v11, v12, v13);
      *(void *)(a1 + 16) = v11;
      *(void *)(a1 + 24) = v12;
      *(unsigned char *)(a1 + 32) = v13;
      return a1;
    }
LABEL_7:
    long long v14 = *a2;
    long long v15 = a2[1];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)a1 = v14;
    *(_OWORD *)(a1 + 16) = v15;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    sub_1A2CBBD20(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
    goto LABEL_7;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *((void *)a2 + 2);
  uint64_t v6 = *((void *)a2 + 3);
  unsigned __int8 v7 = *((unsigned char *)a2 + 32);
  sub_1A2CB8070(v5, v6, v7);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_1A2CBBD20(v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Database.Errors(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    sub_1A2CBBD20(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
LABEL_5:
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  unsigned __int8 v8 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v5;
  sub_1A2CBBD20(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Database.Errors(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Database.Errors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1A2CD3680(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_1A2CD3698(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  return result;
}

void type metadata accessor for Database.Errors()
{
}

uint64_t getEnumTagSinglePayload for Database.RecoveryMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Database.RecoveryMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A2CD3828);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *_s5TeaDB8DatabaseC14JournalingModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x1A2CD391CLL);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Database.ConnectionMode(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Database.ConnectionMode(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

void type metadata accessor for Database.ConnectionMode()
{
}

uint64_t sub_1A2CD39A0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 88, 7);
}

void sub_1A2CD39F0()
{
  sub_1A2CD2834(*(void *)(v0 + 24), *(void (**)(void *))(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
}

uint64_t sub_1A2CD3A28(uint64_t a1)
{
  return sub_1A2CD2AF4(a1, *(void *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(char *))(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 16));
}

void sub_1A2CD3A4C()
{
  if (!qword_1EB5A5F58)
  {
    unint64_t v0 = type metadata accessor for Statement();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A5F58);
    }
  }
}

uint64_t sub_1A2CD3AA0()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1A2CD3AE8()
{
  return sub_1A2CD099C(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(char *))(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 16));
}

uint64_t sub_1A2CD3AFC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A2CD3B34()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A2CD3B5C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

void sub_1A2CD3BAC()
{
  sub_1A2CD1BAC(*(void *)(v0 + 16), *(void (**)(void *))(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40), *(uint64_t (**)(uint64_t))(v0 + 48), *(void *)(v0 + 56), *(void (**)(uint64_t))(v0 + 64));
}

uint64_t sub_1A2CD3BC4(uint64_t a1, uint64_t a2)
{
  sub_1A2CBB064(0, &qword_1EB5A5F70, MEMORY[0x1E4FBCB80], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_37()
{
  *(void *)(v1 + 32) = v0;
  *(void *)(v1 + 40) = v2;
}

uint64_t == infix(_:_:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  *(void *)(v4 + 32) = v0;
  *char v3 = v4 | 0x8000000000000000;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t vars8;

  OUTLINED_FUNCTION_3();
  uint64_t v2 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_4(v2);
  *uint64_t v0 = v1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2CD3D10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2CD3DA8()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t != infix(_:_:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_9_2(v0 | 0x1000000000000000);
  return swift_bridgeObjectRetain();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t vars8;

  OUTLINED_FUNCTION_3();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  *(void *)(v4 + 32) = v0;
  *char v3 = v4 | 0x9000000000000000;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t > infix(_:_:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_9_2(v0 | 0x2000000000000000);
  return swift_bridgeObjectRetain();
}

uint64_t >= infix(_:_:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_9_2(v0 | 0x3000000000000000);
  return swift_bridgeObjectRetain();
}

uint64_t < infix(_:_:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_9_2(v0 | 0x4000000000000000);
  return swift_bridgeObjectRetain();
}

uint64_t <= infix(_:_:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_9_2(v0 | 0x5000000000000000);
  return swift_bridgeObjectRetain();
}

uint64_t && infix(_:_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v5;
  *a3 = v6 | 0x6000000000000000;
  swift_retain();
  return swift_retain();
}

uint64_t sub_1A2CD40A8()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t || infix(_:_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v5;
  *a3 = v6 | 0x7000000000000000;
  swift_retain();
  return swift_retain();
}

void *initializeBufferWithCopyOfBuffer for Expression(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for Expression()
{
  return swift_release();
}

void *assignWithCopy for Expression(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *assignWithTake for Expression(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Expression(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x77 && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 118;
    }
    else
    {
      unsigned int v2 = ((*(void *)a1 >> 60) & 0x8F | (16 * (*(void *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x76) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Expression(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x76)
  {
    *(void *)__n128 result = a2 - 119;
    if (a3 >= 0x77) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x77) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 4) & 7 | (8 * (-a2 & 0x7F));
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1A2CD42C0(void *a1)
{
  return *a1 >> 60;
}

void *sub_1A2CD42CC(void *result)
{
  *result &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_1A2CD42DC(uint64_t *result, uint64_t a2)
{
  void *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 60);
  return result;
}

ValueMetadata *type metadata accessor for Expression()
{
  return &type metadata for Expression;
}

BOOL static StatementOperation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t StatementOperation.hash(into:)()
{
  return sub_1A2CF4130();
}

uint64_t StatementOperation.hashValue.getter()
{
  return sub_1A2CF4140();
}

unint64_t sub_1A2CD439C()
{
  unint64_t result = qword_1E959EF20[0];
  if (!qword_1E959EF20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E959EF20);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StatementOperation(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 5;
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
        JUMPOUT(0x1A2CD44B4);
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
          void *result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatementOperation()
{
  return &type metadata for StatementOperation;
}

uint64_t sub_1A2CD44EC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = type metadata accessor for Statement();
  char v19 = 4;
  unint64_t v18 = 0xF000000000000007;
  *(void *)&long long v16 = v2;
  *((void *)&v16 + 1) = v3;
  char v17 = v4;
  OUTLINED_FUNCTION_4_5(v5);
  sub_1A2CBE7DC();
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v1 + 16, (uint64_t)&v16);
  uint64_t v13 = OUTLINED_FUNCTION_10_3(&v19, v6, v7, v8, v9, v10, v11, v12, v15, v16);
  sub_1A2CB0EB0(v13);
  OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_11_3();
}

void sub_1A2CD45D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  OUTLINED_FUNCTION_5_5();
  a30 = v32;
  a31 = v33;
  OUTLINED_FUNCTION_9_3();
  uint64_t v35 = *v34;
  uint64_t v36 = v34[1];
  char v37 = *((unsigned char *)v34 + 16);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v38 = type metadata accessor for Statement();
  a21 = 4;
  a16 = 0xF000000000000007;
  a11 = v35;
  a12 = v36;
  a13 = v37;
  OUTLINED_FUNCTION_3_5(v38, v39);
  sub_1A2CBE7DC();
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v31, (uint64_t)&a11);
  uint64_t v40 = (char *)OUTLINED_FUNCTION_7_4();
  uint64_t v44 = sub_1A2CAEF50(v40, v41, v42, v43);
  sub_1A2CB0EB0(v44);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_6_5();
}

void sub_1A2CD46B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  OUTLINED_FUNCTION_5_5();
  a30 = v32;
  a31 = v33;
  OUTLINED_FUNCTION_9_3();
  uint64_t v35 = *v34;
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  char v39 = *((unsigned char *)v36 + 16);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v46 = type metadata accessor for Statement();
  a21 = 4;
  a16 = v35;
  a11 = v38;
  a12 = v37;
  a13 = v39;
  OUTLINED_FUNCTION_3_5(v46, v40);
  sub_1A2CBE7DC();
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v31, (uint64_t)&a11);
  uint64_t v41 = (char *)OUTLINED_FUNCTION_7_4();
  uint64_t v45 = sub_1A2CAEF50(v41, v42, v43, v44);
  sub_1A2CB0EB0(v45);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_6_5();
}

void sub_1A2CD4794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_5_5();
  a29 = v32;
  a30 = v33;
  OUTLINED_FUNCTION_9_3();
  uint64_t v35 = *v34;
  uint64_t v37 = *v36;
  uint64_t v38 = v36[1];
  char v39 = *((unsigned char *)v36 + 16);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  type metadata accessor for Statement();
  a20 = 4;
  a15 = v35;
  *(void *)&a11 = v37;
  *((void *)&a11 + 1) = v38;
  a12 = v39;
  OUTLINED_FUNCTION_8_4(&a15, (uint64_t)&a11);
  uint64_t v40 = sub_1A2CBE7DC();
  uint64_t v42 = v41;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v31, (uint64_t)&a11);
  uint64_t v43 = sub_1A2CAEF50(&a20, v40, v42, &a11);
  uint64_t v44 = sub_1A2CB0EB0(v43);
  swift_release();
  if (!v30)
  {
    *(void *)&a11 = v44;
    sub_1A2CF3B50();
    swift_getWitnessTable();
    sub_1A2CF3BC0();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_6_5();
}

uint64_t sub_1A2CD48E0()
{
  OUTLINED_FUNCTION_9_3();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  char v5 = *((unsigned char *)v2 + 16);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  type metadata accessor for Statement();
  char v15 = 4;
  uint64_t v14 = 0xF000000000000007;
  *(void *)&long long v12 = v3;
  *((void *)&v12 + 1) = v4;
  char v13 = v5;
  OUTLINED_FUNCTION_8_4(&v14, (uint64_t)&v12);
  uint64_t v6 = sub_1A2CBE7DC();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v1, (uint64_t)&v12);
  uint64_t v9 = sub_1A2CAEF50(&v15, v6, v8, &v12);
  uint64_t v10 = sub_1A2CB0EB0(v9);
  uint64_t result = swift_release();
  if (!v0)
  {
    *(void *)&long long v12 = v10;
    sub_1A2CF3B50();
    swift_getWitnessTable();
    sub_1A2CF3BC0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t Query.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

TeaDB::ValueOf __swiftcall ValueOf.init(_:)(TeaDB::ValueOf result)
{
  TeaDB::ValueOf *v1 = result;
  return result;
}

uint64_t ValueOf.queryValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t dispatch thunk of QueryValueType.queryValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for Query(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Query);
}

uint64_t dispatch thunk of Query.all(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of Query.all(_:limit:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of Query.where(_:orderBy:limit:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of Query.first(_:orderBy:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of Query.first(orderBy:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 152))();
}

void *initializeBufferWithCopyOfBuffer for ValueOf(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ValueOf()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ValueOf(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ValueOf(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueOf(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ValueOf(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ValueOf()
{
  return &type metadata for ValueOf;
}

uint64_t sub_1A2CD4D18(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void (*v23)(void *__return_ptr, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  uint64_t v32;
  void (*v33)(uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  int64_t v65;
  unint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(void *__return_ptr, uint64_t);
  unint64_t v94;
  unsigned char v95[40];
  uint64_t v96;
  unint64_t v97;
  unsigned __int8 v98[40];
  uint64_t v99;
  uint64_t v100;

  uint64_t v90 = a2;
  uint64_t v87 = sub_1A2CF35E0();
  OUTLINED_FUNCTION_0();
  int64_t v86 = v7;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  char v15 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = MEMORY[0x1E4FBC860];
  long long v16 = *(uint64_t (**)(uint64_t))(a4 + 24);
  uint64_t v17 = OUTLINED_FUNCTION_7_5();
  uint64_t v18 = v16(v17);
  swift_beginAccess();
  uint64_t v19 = *(void *)(v18 + 32);
  uint64_t v89 = *(void *)(v18 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v92 = a1;
  v20(v15, a1, a3);
  uint64_t v91 = v12;
  if (v19)
  {
    uint64_t v21 = OUTLINED_FUNCTION_0_4(v12);
    v22(v21);
    uint64_t v23 = (void (*)(void *__return_ptr, uint64_t))v89;
  }
  else
  {
    uint64_t v24 = v10;
    uint64_t v25 = v86;
    uint64_t v26 = v87;
    uint64_t v27 = OUTLINED_FUNCTION_7_5();
    v16(v27);
    sub_1A2CEF564((uint64_t)&v96);
    swift_release();
    uint64_t v28 = v98[0];
    if (v98[0] == 255)
    {
      uint64_t v32 = OUTLINED_FUNCTION_0_4(v91);
      v33(v32);
      uint64_t v34 = v24;
      sub_1A2CF35D0();
      uint64_t v23 = (void (*)(void *__return_ptr, uint64_t))sub_1A2CF35C0();
      uint64_t v19 = v35;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v34, v26);
    }
    else
    {
      uint64_t v23 = (void (*)(void *__return_ptr, uint64_t))v96;
      uint64_t v19 = v97;
      if (v98[0])
      {
        uint64_t v29 = swift_retain();
        v23(&v93, v29);
        sub_1A2CB4A2C((uint64_t)v23, v19, v28);
        sub_1A2CB4A2C((uint64_t)v23, v19, v28);
        uint64_t v23 = v93;
        uint64_t v19 = v94;
      }
      uint64_t v30 = OUTLINED_FUNCTION_0_4(v91);
      v31(v30);
    }
  }
  uint64_t v36 = *(void *)(a4 + 8);
  uint64_t v37 = sub_1A2CB32CC(a3);
  MEMORY[0x1F4188790](v37);
  *(&v85 - 6) = a3;
  *(&v85 - 5) = a4;
  *(&v85 - 4) = (uint64_t)&v100;
  *(&v85 - 3) = (uint64_t)v23;
  *(&v85 - 2) = v19;
  uint64_t v89 = sub_1A2CEDC8C((void (*)(void *__return_ptr, uint64_t))sub_1A2CD5F38, (uint64_t)(&v85 - 8), v37);
  swift_bridgeObjectRelease();
  uint64_t v38 = *(void *)(v37 + 16);
  if (v38)
  {
    int64_t v86 = v36;
    uint64_t v87 = a3;
    v99 = MEMORY[0x1E4FBC860];
    sub_1A2CB4BC8(0, v38, 0);
    uint64_t v85 = v37;
    char v39 = v37 + 32;
    uint64_t v40 = v99;
    do
    {
      sub_1A2CB4000(v39, (uint64_t)&v96);
      uint64_t v41 = v96;
      uint64_t v42 = v97;
      uint64_t v93 = (void (*)(void *__return_ptr, uint64_t))v96;
      uint64_t v94 = v97;
      sub_1A2CB37E4((uint64_t)v98, (uint64_t)v95);
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
      sub_1A2CD5F60((uint64_t)&v96);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2CB4BC8(0, *(void *)(v40 + 16) + 1, 1);
        uint64_t v40 = v99;
      }
      uint64_t v44 = *(void *)(v40 + 16);
      uint64_t v43 = *(void *)(v40 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_1A2CB4BC8((char *)(v43 > 1), v44 + 1, 1);
        uint64_t v40 = v99;
      }
      *(void *)(v40 + 16) = v44 + 1;
      uint64_t v45 = v40 + 16 * v44;
      *(void *)(v45 + 32) = v41;
      *(void *)(v45 + 40) = v42;
      v39 += 56;
      --v38;
    }
    while (v38);
    swift_bridgeObjectRelease();
    a3 = v87;
    uint64_t v36 = v86;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = MEMORY[0x1E4FBC860];
  }
  uint64_t v46 = v100;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1A2CB5734(0, *(void *)(v46 + 16) + 1, 1, v46);
    uint64_t v46 = v77;
  }
  uint64_t v48 = *(void *)(v46 + 16);
  id v47 = *(void *)(v46 + 24);
  uint64_t v49 = v48 + 1;
  if (v48 >= v47 >> 1)
  {
    OUTLINED_FUNCTION_3_6(v47);
    uint64_t v46 = v78;
  }
  *(void *)(v46 + 16) = v49;
  uint64_t v50 = v46 + 16 * v48;
  *(void *)(v50 + 32) = 0x545245534E49;
  *(void *)(v50 + 40) = 0xE600000000000000;
  if (v90)
  {
    uint64_t v51 = *(void *)(v46 + 24);
    if (v49 >= v51 >> 1)
    {
      OUTLINED_FUNCTION_2_4(v51);
      uint64_t v46 = v84;
    }
    *(void *)(v46 + 16) = v48 + 2;
    uint64_t v52 = v46 + 16 * v49;
    *(void *)(v52 + 32) = 0x414C50455220524FLL;
    *(void *)(v52 + 40) = 0xEA00000000004543;
    uint64_t v49 = *(void *)(v46 + 16);
  }
  uint64_t v53 = *(void *)(v46 + 24);
  if (v49 >= v53 >> 1)
  {
    OUTLINED_FUNCTION_2_4(v53);
    uint64_t v46 = v79;
  }
  *(void *)(v46 + 16) = v49 + 1;
  uint64_t v54 = v46 + 16 * v49;
  *(void *)(v54 + 32) = 1330925129;
  *(void *)(v54 + 40) = 0xE400000000000000;
  long long v55 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 32))(a3, v36);
  uint64_t v57 = v56;
  uint64_t v59 = *(void *)(v46 + 16);
  uint64_t v58 = *(void *)(v46 + 24);
  if (v59 >= v58 >> 1)
  {
    sub_1A2CB5734(v58 > 1, v59 + 1, 1, v46);
    uint64_t v46 = v80;
  }
  *(void *)(v46 + 16) = v59 + 1;
  uint64_t v60 = v46 + 16 * v59;
  *(void *)(v60 + 32) = v55;
  *(void *)(v60 + 40) = v57;
  uint64_t v96 = 40;
  uint64_t v97 = 0xE100000000000000;
  uint64_t v93 = (void (*)(void *__return_ptr, uint64_t))v40;
  sub_1A2CB0380();
  sub_1A2CB0330();
  OUTLINED_FUNCTION_5_6();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  uint64_t v61 = v96;
  uint64_t v62 = v97;
  uint64_t v64 = *(void *)(v46 + 16);
  int64_t v63 = *(void *)(v46 + 24);
  uint64_t v65 = v63 >> 1;
  uint64_t v66 = v64 + 1;
  if (v63 >> 1 <= v64)
  {
    OUTLINED_FUNCTION_3_6(v63);
    uint64_t v46 = v81;
    int64_t v63 = *(void *)(v81 + 24);
    uint64_t v65 = v63 >> 1;
  }
  uint64_t v67 = v88;
  *(void *)(v46 + 16) = v66;
  uint64_t v68 = v46 + 16 * v64;
  *(void *)(v68 + 32) = v61;
  *(void *)(v68 + 40) = v62;
  if (v65 < (uint64_t)(v64 + 2))
  {
    OUTLINED_FUNCTION_2_4(v63);
    uint64_t v46 = v82;
  }
  int64_t v69 = v89;
  *(void *)(v46 + 16) = v64 + 2;
  uint64_t v70 = v46 + 16 * v66;
  *(void *)(v70 + 32) = 0x5345554C4156;
  *(void *)(v70 + 40) = 0xE600000000000000;
  uint64_t v96 = 40;
  uint64_t v97 = 0xE100000000000000;
  uint64_t v93 = (void (*)(void *__return_ptr, uint64_t))v69;
  OUTLINED_FUNCTION_5_6();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  uint64_t v71 = v96;
  uint64_t v72 = v97;
  uint64_t v74 = *(void *)(v46 + 16);
  uint64_t v73 = *(void *)(v46 + 24);
  if (v74 >= v73 >> 1)
  {
    OUTLINED_FUNCTION_3_6(v73);
    uint64_t v46 = v83;
  }
  *(void *)(v46 + 16) = v74 + 1;
  uint64_t v75 = v46 + 16 * v74;
  *(void *)(v75 + 32) = v71;
  *(void *)(v75 + 40) = v72;
  uint64_t v100 = v46;
  v67(v92, a3);
  return v100;
}

uint64_t sub_1A2CD5414@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v12 = *a2;
  uint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  char v15 = a1 + 2;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1A2CD54B8(v13, v14, v15, a3, a4, v12, a5, a6);
  uint64_t v18 = v17;
  uint64_t result = swift_bridgeObjectRelease();
  *a7 = v16;
  a7[1] = v18;
  return result;
}

uint64_t sub_1A2CD54B8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = a3[3];
  uint64_t v12 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v11);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v12 + 16))(v41, v11, v12);
  uint64_t v13 = v41[0];
  unint64_t v14 = v41[1];
  switch(v42)
  {
    case 1:
      uint64_t v38 = v41[0];
      uint64_t v15 = sub_1A2CF4040();
      goto LABEL_7;
    case 2:
      uint64_t v17 = sub_1A2CD5C64(v41[0] & 1 | 0x30, 0xE100000000000000, a3);
      goto LABEL_8;
    case 3:
      uint64_t v38 = 0;
      unint64_t v39 = 0xE000000000000000;
      sub_1A2CF3B70();
      goto LABEL_6;
    case 4:
      uint64_t v18 = Data.queryValue.getter();
      uint64_t v17 = sub_1A2CD5C64(v18, v19, a3);
      swift_bridgeObjectRelease();
      sub_1A2CB2E8C(v13, v14, 4);
      return v17;
    case 5:
      uint64_t v20 = a3[3];
      uint64_t v21 = a3[4];
      __swift_project_boxed_opaque_existential_1(a3, v20);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v21 + 32))(&v38, v20, v21);
      uint64_t v22 = v38;
      unint64_t v23 = v39;
      switch(v40)
      {
        case 0u:
          uint64_t v38 = 39;
          unint64_t v39 = 0xE100000000000000;
          sub_1A2CB18DC(v22, v23, 0);
          sub_1A2CBB018();
          sub_1A2CF3D70();
          sub_1A2CF39F0();
          swift_bridgeObjectRelease();
          sub_1A2CF39F0();
          sub_1A2CD5EC4(v22, v23, 0);
          uint64_t v24 = v22;
          unint64_t v25 = v23;
          char v26 = 0;
          goto LABEL_30;
        case 1u:
          uint64_t v17 = sub_1A2CF4040();
          sub_1A2CD5EC4(v22, v23, 1);
          uint64_t v34 = v22;
          unint64_t v35 = v23;
          char v36 = 1;
          goto LABEL_19;
        case 2u:
          sub_1A2CD5EC4(v38, v39, 2);
          sub_1A2CD5EC4(v22, v23, 2);
          return v22 & 1 | 0x30;
        case 3u:
          uint64_t v38 = 0;
          unint64_t v39 = 0xE000000000000000;
          sub_1A2CF3B70();
          sub_1A2CD5EC4(v22, v23, 3);
          uint64_t v24 = v22;
          unint64_t v25 = v23;
          char v26 = 3;
          goto LABEL_30;
        case 4u:
          sub_1A2CB18DC(v38, v39, 4);
          uint64_t v17 = Data.queryValue.getter();
          sub_1A2CD5EC4(v22, v23, 4);
          uint64_t v34 = v22;
          unint64_t v35 = v23;
          char v36 = 4;
LABEL_19:
          sub_1A2CD5EC4(v34, v35, v36);
          break;
        case 5u:
          uint64_t v17 = 1280070990;
          sub_1A2CD5EC4(v38, v39, 5);
          sub_1A2CD5EC4(v22, v23, 5);
          break;
        default:
          while (2)
          {
            uint64_t v17 = 1280070990;
            uint64_t v27 = *(void *)(v22 + 24);
            uint64_t v28 = *(void *)(v22 + 32);
            __swift_project_boxed_opaque_existential_1((void *)v22, v27);
            (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v28 + 24))(&v38, v27, v28);
            uint64_t v22 = v40;
            if (v40 != 255)
            {
              uint64_t v29 = v38;
              unint64_t v30 = v39;
              uint64_t v38 = 0;
              unint64_t v39 = 0xE000000000000000;
              sub_1A2CF3DD0();
              swift_bridgeObjectRelease();
              uint64_t v38 = 0xD000000000000011;
              unint64_t v39 = 0x80000001A2CF7B80;
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              (*(void (**)(uint64_t))(*(void *)(a8 + 8) + 32))(a7);
              sub_1A2CF39F0();
              swift_bridgeObjectRelease();
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              switch((int)v22)
              {
                case 0:
                  sub_1A2CB18DC(v29, v30, 0);
                  sub_1A2CBB018();
                  sub_1A2CF3D70();
                  sub_1A2CF39F0();
                  swift_bridgeObjectRelease();
                  sub_1A2CF39F0();
                  uint64_t v31 = v29;
                  unint64_t v32 = v30;
                  char v33 = 0;
                  goto LABEL_25;
                case 1:
                  sub_1A2CF4040();
                  uint64_t v31 = v29;
                  unint64_t v32 = v30;
                  char v33 = 1;
                  goto LABEL_25;
                case 2:
                  sub_1A2CD5EC4(v29, v30, 2);
                  break;
                case 3:
                  sub_1A2CF3B70();
                  uint64_t v31 = v29;
                  unint64_t v32 = v30;
                  char v33 = 3;
                  goto LABEL_25;
                case 4:
                  sub_1A2CB18DC(v29, v30, 4);
                  Data.queryValue.getter();
                  uint64_t v31 = v29;
                  unint64_t v32 = v30;
                  char v33 = 4;
LABEL_25:
                  sub_1A2CD5EC4(v31, v32, v33);
                  break;
                case 5:
                  sub_1A2CD5EC4(v29, v30, 5);
                  break;
                default:
                  continue;
              }
              sub_1A2CF39F0();
              swift_bridgeObjectRelease();
              sub_1A2CF39F0();
              uint64_t v24 = v29;
              unint64_t v25 = v30;
              char v26 = v22;
LABEL_30:
              sub_1A2CD5EC4(v24, v25, v26);
              uint64_t v17 = v38;
            }
            break;
          }
          break;
      }
      return v17;
    default:
      uint64_t v38 = 39;
      unint64_t v39 = 0xE100000000000000;
      sub_1A2CBB018();
      sub_1A2CF3D70();
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      sub_1A2CF39F0();
      sub_1A2CB2E8C(v13, v14, 0);
LABEL_6:
      uint64_t v15 = v38;
      uint64_t v16 = v39;
LABEL_7:
      uint64_t v17 = sub_1A2CD5C64(v15, v16, a3);
LABEL_8:
      swift_bridgeObjectRelease();
      return v17;
  }
}

uint64_t sub_1A2CD5C64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3[3];
  uint64_t v5 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 32))(&v23, v4, v5);
  uint64_t v6 = v23;
  unint64_t v7 = v24;
  switch(v25)
  {
    case 0:
      uint64_t v23 = 39;
      unint64_t v24 = 0xE100000000000000;
      sub_1A2CB18DC(v6, v7, 0);
      sub_1A2CBB018();
      sub_1A2CF3D70();
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      sub_1A2CF39F0();
      uint64_t v8 = OUTLINED_FUNCTION_4_6(v6, v7, 0);
      char v10 = 0;
      goto LABEL_7;
    case 1:
      sub_1A2CF4040();
      uint64_t v11 = OUTLINED_FUNCTION_6_6();
      uint64_t v13 = OUTLINED_FUNCTION_4_6(v11, v12, 1);
      char v15 = 1;
      goto LABEL_9;
    case 2:
      uint64_t v16 = OUTLINED_FUNCTION_4_6(v23, v24, 2);
      sub_1A2CD5EC4(v16, v17, 2);
      return v6 & 1 | 0x30;
    case 3:
      uint64_t v23 = 0;
      unint64_t v24 = 0xE000000000000000;
      sub_1A2CF3B70();
      uint64_t v8 = OUTLINED_FUNCTION_4_6(v6, v7, 3);
      char v10 = 3;
LABEL_7:
      sub_1A2CD5EC4(v8, v9, v10);
      return v23;
    case 4:
      sub_1A2CB18DC(v23, v24, 4);
      Data.queryValue.getter();
      uint64_t v18 = OUTLINED_FUNCTION_6_6();
      uint64_t v13 = OUTLINED_FUNCTION_4_6(v18, v19, 4);
      char v15 = 4;
LABEL_9:
      sub_1A2CD5EC4(v13, v14, v15);
      break;
    case 5:
      uint64_t v20 = OUTLINED_FUNCTION_4_6(v23, v24, 5);
      sub_1A2CD5EC4(v20, v21, 5);
      a1 = 1280070990;
      break;
    default:
      swift_bridgeObjectRetain();
      break;
  }
  return a1;
}

uint64_t sub_1A2CD5EC4(uint64_t result, unint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1A2CB2E8C(result, a2, a3);
  }
  return result;
}

uint64_t sub_1A2CD5ED8()
{
  return sub_1A2CB02B4();
}

uint64_t type metadata accessor for InsertCommand()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CD5F38@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CD5414(a1, *(uint64_t **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1A2CD5F60(uint64_t a1)
{
  sub_1A2CB4064();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A2CD5FBC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t LazyJSON.loader.getter()
{
  return swift_retain();
}

uint64_t LazyJSON.loaderValue.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  LazyLoader.load()(a1);
  uint64_t v4 = *(void *)(v3 + 80);
  return __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
}

uint64_t LazyJSON.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  LazyJSON.init(value:)(a1);
  return v2;
}

uint64_t LazyJSON.init(value:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](a1);
  unint64_t v7 = (char *)&v10 - v6;
  type metadata accessor for LazyLoader();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = LazyLoader.__allocating_init(object:)((uint64_t)v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v2 + 16) = v8;
  return v2;
}

void static LazyJSON.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t LazyJSON.__allocating_init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  LazyJSON.init(valueType:connection:)(a1, a2);
  return v4;
}

uint64_t LazyJSON.init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  if (*((unsigned char *)a1 + 16) == 4)
  {
    uint64_t v4 = v2;
    uint64_t v7 = *a1;
    uint64_t v6 = a1[1];
    uint64_t v8 = v3[10];
    uint64_t v9 = v3[11];
    uint64_t v10 = v3[12];
    type metadata accessor for LazyLoader();
    uint64_t v11 = (void *)swift_allocObject();
    long long v11[2] = v8;
    v11[3] = v9;
    v11[4] = v10;
    v11[5] = v7;
    v11[6] = v6;
    uint64_t v12 = LazyLoader.__allocating_init(block:)((uint64_t)sub_1A2CD6454, (uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1(a2);
    v4[2] = v12;
    return (uint64_t)v4;
  }
  else
  {
    uint64_t result = sub_1A2CF3F30();
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD6380()
{
  return swift_release();
}

uint64_t sub_1A2CD641C()
{
  sub_1A2CB2EAC(*(void *)(v0 + 40), *(void *)(v0 + 48));
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1A2CD6454()
{
  return sub_1A2CD6380();
}

uint64_t LazyJSON.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v2);
  LazyLoader.load()((char *)&v9 - v3);
  sub_1A2CF3420();
  swift_allocObject();
  sub_1A2CF3410();
  uint64_t v4 = sub_1A2CF3400();
  uint64_t v6 = v5;
  OUTLINED_FUNCTION_2_5();
  v7();
  uint64_t result = swift_release();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = 4;
  return result;
}

uint64_t sub_1A2CD65B8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x726564616F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A2CF4080();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A2CD6638()
{
  return 0x726564616F6CLL;
}

uint64_t sub_1A2CD664C()
{
  return sub_1A2CC5C08();
}

uint64_t sub_1A2CD6658()
{
  return sub_1A2CC5C38();
}

uint64_t sub_1A2CD6668()
{
  return sub_1A2CC5C10();
}

uint64_t sub_1A2CD6678()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CD66C0()
{
  return sub_1A2CD6638();
}

uint64_t sub_1A2CD66D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2CD65B8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A2CD6708()
{
  return sub_1A2CC6664();
}

uint64_t sub_1A2CD6730@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CC5C08();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A2CD6768(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A2CD67BC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t LazyJSON.deinit()
{
  swift_release();
  return v0;
}

uint64_t LazyJSON.__deallocating_deinit()
{
  LazyJSON.deinit();
  return swift_deallocClassInstance();
}

uint64_t LazyJSON.encode(to:)(void *a1)
{
  type metadata accessor for LazyJSON.CodingKeys();
  swift_getWitnessTable();
  sub_1A2CF4030();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v2);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41B0();
  type metadata accessor for LazyLoader();
  swift_getWitnessTable();
  sub_1A2CF4020();
  OUTLINED_FUNCTION_2_5();
  return v6(v3, v4, v5);
}

uint64_t type metadata accessor for LazyJSON.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t LazyJSON.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  LazyJSON.init(from:)(a1);
  return v2;
}

uint64_t LazyJSON.init(from:)(void *a1)
{
  OUTLINED_FUNCTION_1_6();
  type metadata accessor for LazyJSON.CodingKeys();
  swift_getWitnessTable();
  sub_1A2CF3FD0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF4190();
  if (v7)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for LazyLoader();
    swift_getWitnessTable();
    sub_1A2CF3FC0();
    uint64_t v5 = OUTLINED_FUNCTION_3_7();
    v6(v5);
    *(void *)(v1 + 16) = v8;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

void sub_1A2CD6C88(unsigned char *a1@<X8>)
{
}

uint64_t sub_1A2CD6CA0@<X0>(uint64_t a1@<X8>)
{
  return LazyJSON.valueType.getter(a1);
}

uint64_t sub_1A2CD6CC4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = LazyJSON.__allocating_init(valueType:connection:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A2CD6CEC(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A2CD6D4C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = LazyJSON.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A2CD6D78(void *a1)
{
  return LazyJSON.encode(to:)(a1);
}

uint64_t sub_1A2CD6D9C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LazyJSON()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LazyJSON(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LazyJSON);
}

uint64_t dispatch thunk of LazyJSON.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of LazyJSON.__allocating_init(valueType:connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LazyJSON.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unsigned char *sub_1A2CD6E64(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A2CD6F00);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A2CD6F28()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CD6F44()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CD6F60()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CD6F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 8);
  long long v6 = *(_OWORD *)(a4 + a3 - 24);
  v9[0] = *(_OWORD *)(a4 + a3 - 40);
  v9[1] = v6;
  uint64_t v10 = v5;
  type metadata accessor for Store.Promises();
  uint64_t v7 = sub_1A2CF3D40();
  (*(void (**)(_OWORD *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v9, a1, v7);
  return sub_1A2CD70D8((uint64_t)v9);
}

uint64_t sub_1A2CD7018@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_1_7();
  swift_beginAccess();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_1();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a1, v1);
}

uint64_t type metadata accessor for Store.Promises()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A2CD70D8(uint64_t a1)
{
  OUTLINED_FUNCTION_1_7();
  swift_beginAccess();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v3 + 40))(v1, a1);
  return swift_endAccess();
}

uint64_t Store.__allocating_init(database:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  Store.init(database:)(a1);
  return v2;
}

uint64_t Store.init(database:)(uint64_t a1)
{
  uint64_t v3 = v1;
  unsigned int v4 = *(void **)v1;
  uint64_t v5 = *(void **)v1;
  *(void *)(v1 + 32) = 0;
  uint64_t v6 = v1 + 32;
  *(unsigned char *)(v1 + 40) = 1;
  *(void *)(v1 + 16) = a1;
  uint64_t v7 = v4[11];
  uint64_t v8 = v4[14];
  swift_retain();
  uint64_t v9 = Database.table<A>(_:)();
  if (v2)
  {
    swift_release();
    swift_release();
    uint64_t v10 = v5[10];
    uint64_t v11 = v5[12];
    uint64_t v12 = v5[13];
    uint64_t v23 = v10;
    uint64_t v24 = v7;
    uint64_t v25 = v11;
    uint64_t v26 = v12;
    OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_1();
    (*(void (**)(uint64_t))(v13 + 8))(v6);
    uint64_t v23 = v10;
    uint64_t v24 = v7;
    uint64_t v25 = v11;
    uint64_t v26 = v12;
    uint64_t v27 = v8;
    type metadata accessor for Store();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v1 + 24) = v9;
    swift_retain();
    sub_1A2CC01E8();
    v22[8] = 0;
    swift_beginAccess();
    uint64_t v14 = v5[10];
    uint64_t v15 = v5[12];
    uint64_t v16 = v5[13];
    uint64_t v28 = v15;
    uint64_t v23 = v14;
    uint64_t v24 = v7;
    uint64_t v25 = v15;
    uint64_t v26 = v16;
    OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_1();
    (*(void (**)(uint64_t, unsigned char *))(v17 + 40))(v6, v22);
    uint64_t v18 = swift_endAccess();
    MEMORY[0x1F4188790](v18);
    sub_1A2CF3710();
    unint64_t v19 = (void *)swift_allocObject();
    void v19[2] = v14;
    v19[3] = v7;
    v19[4] = v28;
    void v19[5] = v16;
    v19[6] = v8;
    uint64_t v20 = (void *)sub_1A2CF36C0();
    sub_1A2CF36D0();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
  }
  return v3;
}

uint64_t type metadata accessor for Store()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A2CD7480(uint64_t a1, uint64_t a2)
{
  char v5 = 0;
  swift_retain();
  uint64_t v3 = Database.asyncWrite(_:block:)(&v5, (uint64_t)sub_1A2CD9A60, a2);
  swift_release();
  return v3;
}

uint64_t sub_1A2CD74F0()
{
  return sub_1A2CD7480(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1A2CD750C()
{
  sub_1A2CAEFF4();
  char v0 = sub_1A2CC5C08();
  sub_1A2CBC698(v0 & 1);
  return swift_release();
}

uint64_t sub_1A2CD7594()
{
  if (qword_1EB5A61F0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EB5A8268;
  sub_1A2CF3C00();
  sub_1A2CC845C();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1A2CF4990;
  uint64_t v2 = sub_1A2CF41E0();
  uint64_t v4 = v3;
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  *(void *)(v1 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v6 = sub_1A2CC84C4();
  *(void *)(v1 + 64) = v6;
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v4;
  sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
  sub_1A2CF3EF0();
  *(void *)(v1 + 96) = v5;
  *(void *)(v1 + 104) = v6;
  *(void *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0xE000000000000000;
  sub_1A2CF3720();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CD76F8()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1A2CD7708()
{
  return sub_1A2CD7594();
}

uint64_t sub_1A2CD7718()
{
  sub_1A2CF3B50();
  uint64_t result = Database.read<A>(block:)();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1A2CD7798@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  sub_1A2CBD4CC();
  uint64_t v5 = sub_1A2CBD714();
  uint64_t result = swift_release();
  if (!v2)
  {
    v20[2] = v5;
    uint64_t v7 = sub_1A2CD797C();
    uint64_t v8 = MEMORY[0x1F4188790](v7);
    uint64_t v15 = *(void *)(v4 + 80);
    long long v16 = *(_OWORD *)(v4 + 88);
    long long v17 = *(_OWORD *)(v4 + 104);
    uint64_t v18 = v8;
    uint64_t v19 = v9;
    uint64_t v10 = sub_1A2CF3B50();
    uint64_t v11 = sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v13 = sub_1A2CBAA68((void (*)(char *, char *))sub_1A2CD99F8, (uint64_t)&v14, v10, v15, v11, WitnessTable, MEMORY[0x1E4FBC0F0], (uint64_t)v20);
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v13;
  }
  return result;
}

uint64_t sub_1A2CD7960@<X0>(uint64_t *a1@<X8>)
{
  return sub_1A2CD7798(v1, a1);
}

uint64_t (*sub_1A2CD797C())()
{
  return sub_1A2CD9A48;
}

uint64_t sub_1A2CD79BC()
{
  sub_1A2CF3420();
  swift_allocObject();
  sub_1A2CF3410();
  uint64_t v1 = sub_1A2CF3400();
  unint64_t v3 = v2;
  uint64_t result = swift_release();
  if (!v0)
  {
    sub_1A2CF3610();
    swift_allocObject();
    sub_1A2CF3600();
    sub_1A2CF35F0();
    swift_release();
    return sub_1A2CB2EAC(v1, v3);
  }
  return result;
}

uint64_t sub_1A2CD7AFC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v26 = a2;
  uint64_t v23 = *v4;
  uint64_t v6 = *(void *)(v23 + 88);
  uint64_t v7 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v22 - v11;
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  long long v17 = (char *)&v22 - v16;
  uint64_t v18 = *a1;
  uint64_t v24 = v4;
  uint64_t v25 = v18;
  uint64_t result = Database.read<A>(block:)();
  if (!v3)
  {
    uint64_t v20 = v26;
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
      uint64_t v21 = 1;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v6);
      sub_1A2CD79BC();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v6);
      uint64_t v21 = 0;
    }
    return __swift_storeEnumTagSinglePayload(v20, v21, 1, *(void *)(v23 + 80));
  }
  return result;
}

#error "1A2CD7D68: call analysis failed (funcsize=30)"

uint64_t sub_1A2CD7D90()
{
  return sub_1A2CD7D18(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1A2CD7DAC()
{
  sub_1A2CF3B50();
  uint64_t result = Database.read<A>(block:)();
  if (!v0) {
    return v2;
  }
  return result;
}

#error "1A2CD7ECC: call analysis failed (funcsize=121)"

uint64_t sub_1A2CD8028()
{
  return sub_1A2CD7E3C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t (*sub_1A2CD8044())()
{
  return sub_1A2CD9A7C;
}

void sub_1A2CD8084(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_8_5();
  if (!v3) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 + 80) - 8) + 16))(a2, a1);
  }
}

uint64_t sub_1A2CD8148()
{
  return sub_1A2CD8718(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)sub_1A2CED4D4, (void (*)(char *))sub_1A2CDC544);
}

uint64_t sub_1A2CD818C()
{
  sub_1A2CF3420();
  swift_allocObject();
  sub_1A2CF3410();
  uint64_t v1 = sub_1A2CF3400();
  unint64_t v3 = v2;
  uint64_t result = swift_release();
  if (!v0)
  {
    sub_1A2CF3610();
    swift_allocObject();
    sub_1A2CF3600();
    sub_1A2CF35F0();
    swift_release();
    return sub_1A2CB2EAC(v1, v3);
  }
  return result;
}

uint64_t sub_1A2CD82CC(uint64_t a1)
{
  OUTLINED_FUNCTION_8_5();
  if (!v1) {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A2CD832C(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v28 = *(void *)(*a2 + 88);
  uint64_t v26 = *(void (***)(char *, uint64_t))(v28 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v10 = *(void *)(v9 + 80);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x1F4188790](v6);
  uint64_t v14 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v29 = (char *)&v21 - v15;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1A2CF3AC0();
  uint64_t v31 = v16;
  if (v16 != MEMORY[0x1A623EE80](a1, v10))
  {
    uint64_t v22 = v12;
    uint64_t v17 = a2[3];
    uint64_t v24 = (void (**)(char *, uint64_t *, uint64_t))(v11 + 16);
    uint64_t v25 = v17;
    uint64_t v23 = v26 + 1;
    uint64_t v26 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v27 = a2;
    while (1)
    {
      char v18 = sub_1A2CF3B10();
      sub_1A2CF3AF0();
      if (v18)
      {
        uint64_t v19 = v29;
        (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v29, a1+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v16, v10);
      }
      else
      {
        uint64_t result = sub_1A2CF3DF0();
        if (v22 != 8)
        {
          __break(1u);
          return result;
        }
        uint64_t v30 = result;
        uint64_t v19 = v29;
        (*v24)(v29, &v30, v10);
        swift_unknownObjectRelease();
      }
      swift_bridgeObjectRetain();
      MEMORY[0x1A623EE90](&v31, a1, v10);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v19, v10);
      sub_1A2CED4D4();
      sub_1A2CD818C();
      if (v3) {
        break;
      }
      sub_1A2CDC544((uint64_t)v8);
      uint64_t v3 = 0;
      swift_release();
      (*v23)(v8, v28);
      (*v26)(v14, v10);
      uint64_t v16 = v31;
      if (v16 == MEMORY[0x1A623EE80](a1, v10)) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_release();
    (*v26)(v14, v10);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CD86B0()
{
  return sub_1A2CD832C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_1A2CD86CC()
{
}

uint64_t sub_1A2CD8718(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = *(void *)(*(void *)a1 + 88);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v14 - v10;
  v12();
  sub_1A2CD818C();
  if (!v4)
  {
    a4(v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  }
  return swift_release();
}

uint64_t sub_1A2CD8828()
{
  return sub_1A2CD8718(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)sub_1A2CED57C, (void (*)(char *))sub_1A2CDBFE0);
}

void sub_1A2CD886C()
{
}

uint64_t sub_1A2CD88BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_release();
}

uint64_t sub_1A2CD8918()
{
  return sub_1A2CD88BC(v0[2], v0[3], v0[4]);
}

void sub_1A2CD8938()
{
}

uint64_t sub_1A2CD897C()
{
  return swift_release();
}

uint64_t sub_1A2CD89C0()
{
  return sub_1A2CD897C();
}

uint64_t Store.Promises.all()()
{
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CD8A64(void (*a1)(uint64_t *))
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = sub_1A2CD7718();
    swift_release();
    uint64_t v4 = v3;
    a1(&v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD8B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CD962C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void))sub_1A2CD8A64);
}

uint64_t Store.Promises.first(_:)(uint64_t a1, uint64_t a2)
{
  return sub_1A2CD8D1C(a1, a2, MEMORY[0x1E4FBB718]);
}

uint64_t sub_1A2CD8B88(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = sub_1A2CF3D40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v13 - v10;
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v14 = a6;
    sub_1A2CD7AFC(&v14, (uint64_t)v11);
    swift_release();
    a1(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD8CD8()
{
  return sub_1A2CD91DC();
}

uint64_t Store.Promises.filter(_:)(uint64_t a1, uint64_t a2)
{
  return sub_1A2CD8D1C(a1, a2, MEMORY[0x1E4FBB320]);
}

uint64_t sub_1A2CD8D1C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, void))
{
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CD8DA8(void (*a1)(uint64_t *))
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = sub_1A2CD7DAC();
    swift_release();
    uint64_t v4 = v3;
    a1(&v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD8E94()
{
  return sub_1A2CD91DC();
}

uint64_t Store.Promises.save(_:)()
{
  return sub_1A2CF36E0();
}

{
  sub_1A2CF3B50();
  sub_1A2CF3700();
  OUTLINED_FUNCTION_5_7();
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CD8F14(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = *(void *)(a7 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2CD8084(a6, (uint64_t)v12);
    swift_release();
    a1(v12);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD9054()
{
  return sub_1A2CD9354();
}

uint64_t sub_1A2CD90E0(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2CD82CC(a6);
    swift_release();
    uint64_t v9 = a6;
    a1(&v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD91C4()
{
  return sub_1A2CD91DC();
}

uint64_t sub_1A2CD91DC()
{
  __n128 v0 = OUTLINED_FUNCTION_4_7();
  return v1(v0);
}

uint64_t Store.Promises.delete(_:)()
{
  return sub_1A2CF36F0();
}

{
  sub_1A2CD1AA8();
  swift_allocObject();
  return sub_1A2CF36F0();
}

uint64_t sub_1A2CD9270(uint64_t (*a1)(uint64_t))
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2CD86CC();
    uint64_t v3 = swift_release();
    return a1(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD933C()
{
  return sub_1A2CD9354();
}

uint64_t sub_1A2CD9354()
{
  __n128 v0 = OUTLINED_FUNCTION_4_7();
  return v1(v0);
}

uint64_t sub_1A2CD93E8(uint64_t (*a1)(uint64_t))
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2CD886C();
    uint64_t v3 = swift_release();
    return a1(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD94BC(uint64_t (*a1)(uint64_t))
{
  return sub_1A2CD93E8(a1);
}

uint64_t Store.Promises.deleteAll()()
{
  return sub_1A2CF36F0();
}

uint64_t sub_1A2CD9560(uint64_t (*a1)(uint64_t))
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A2CD8938();
    uint64_t v3 = swift_release();
    return a1(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CD9614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CD962C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void))sub_1A2CD9560);
}

uint64_t sub_1A2CD962C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void))
{
  return a5(a1, a2, a3, a4, v5[7], v5[2], v5[3], v5[4], v5[5], v5[6]);
}

uint64_t Store.deinit()
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v1 + 8))(v0 + 32);
  return v0;
}

uint64_t Store.__deallocating_deinit()
{
  Store.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CD9758@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2CD7018(a1);
}

uint64_t sub_1A2CD9780()
{
  return 40;
}

__n128 sub_1A2CD978C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_1A2CD97A0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for Store(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Store);
}

uint64_t dispatch thunk of Store.promises.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of Store.__allocating_init(database:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of Store.all()()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of Store.first(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of Store.filter(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of Store.save(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 200))();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of Store.delete(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 216))();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of Store.deleteAll()()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t sub_1A2CD99F8(uint64_t a1, void *a2)
{
  return sub_1A2CD9A10(a1, a2);
}

uint64_t sub_1A2CD9A10(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 56))();
  if (v3) {
    *a2 = v3;
  }
  return result;
}

uint64_t sub_1A2CD9A48()
{
  return sub_1A2CD79BC();
}

uint64_t sub_1A2CD9A60()
{
  return sub_1A2CD750C();
}

uint64_t sub_1A2CD9A7C()
{
  return sub_1A2CD9A48();
}

uint64_t Column.__allocating_init(primaryKey:index:unique:default:onUpdate:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  Column.init(primaryKey:index:unique:default:onUpdate:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_1A2CD9B04()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CD9B38()
{
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_5_1();
  return static ColumnType.createTableChain(for:ifNotExists:)(v0, v1, v2, v3);
}

uint64_t static ColumnType.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + 24))(a1, a2, 1, a3);
}

uint64_t sub_1A2CD9BBC()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CD9BF4()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CD9BFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (void (**)(void))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void (**)(void)))(v7 + 16))(v6);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return (*(uint64_t (**)(uint64_t, void (**)(void)))(*(void *)(*(void *)(a1 + 16) - 8) + 32))(a2, v6);
  }
  (*v6)();
  return swift_release();
}

uint64_t sub_1A2CD9CF4()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CD9D24(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return static ColumnType.createTableChain(for:ifNotExists:)(a1, a2, v2, WitnessTable);
}

uint64_t sub_1A2CD9D8C()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t (*autoUpdate<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  v8[5] = a2;
  swift_retain();
  return sub_1A2CDA4D8;
}

uint64_t sub_1A2CD9E40(uint64_t a1)
{
  uint64_t v2 = sub_1A2CF3D40();
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)&v7 - v3;
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - v3, a1);
  return sub_1A2CB18FC((uint64_t)v4);
}

uint64_t (*sub_1A2CD9F10())()
{
  return j__swift_endAccess;
}

void sub_1A2CD9F74()
{
  OUTLINED_FUNCTION_11_4();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1_6();
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 80);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v19 - v10;
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_17_1();
  if (__swift_getEnumTagSinglePayload(v0, 1, v6))
  {
    uint64_t v13 = OUTLINED_FUNCTION_2_6();
    v14(v13);
    long long v15 = 0uLL;
    char v16 = 5;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v0, v6);
    uint64_t v17 = OUTLINED_FUNCTION_2_6();
    v18(v17);
    (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)(v4 + 88) + 40))(&v19, v6);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
    long long v15 = v19;
    char v16 = v20;
  }
  *(_OWORD *)uint64_t v2 = v15;
  *(unsigned char *)(v2 + 16) = v16;
  OUTLINED_FUNCTION_12_3();
}

void sub_1A2CDA0EC()
{
}

void sub_1A2CDA104()
{
}

void sub_1A2CDA11C()
{
  OUTLINED_FUNCTION_11_4();
  uint64_t v27 = v1;
  uint64_t v28 = v2;
  uint64_t v3 = *(void *)(*(void *)v0 + 80);
  uint64_t v26 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v25 - v4;
  uint64_t v7 = *(void *)(v6 + 88);
  uint64_t v8 = type metadata accessor for Column.Func();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v25 - v12;
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_0();
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v25 - v16;
  v27(v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v8))
  {
    uint64_t v18 = OUTLINED_FUNCTION_10_4();
    v19(v18);
    long long v20 = 0uLL;
    char v21 = -1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v17, v8);
    uint64_t v22 = OUTLINED_FUNCTION_10_4();
    v23(v22);
    sub_1A2CD9BFC(v8, (uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v7 + 40))(&v29, v3, v7);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v3);
    long long v20 = v29;
    char v21 = v30;
  }
  uint64_t v24 = v28;
  *uint64_t v28 = v20;
  *((unsigned char *)v24 + 16) = v21;
  OUTLINED_FUNCTION_12_3();
}

uint64_t sub_1A2CDA368()
{
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_6_8();
  type metadata accessor for Column.Func();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  uint64_t v0 = OUTLINED_FUNCTION_8_6();
  return v1(v0);
}

uint64_t sub_1A2CDA404()
{
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_6_8();
  type metadata accessor for Column.Func();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  uint64_t v0 = OUTLINED_FUNCTION_8_6();
  return v1(v0);
}

uint64_t sub_1A2CDA4A0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1A2CDA4D8()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t Column.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  Column.init(from:)(a1);
  return v2;
}

void *Column.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v1;
  uint64_t v6 = *(void *)(v5 + 80);
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v21 = v7;
  uint64_t v22 = v8;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v9);
  uint64_t v24 = (char *)&v21 - v10;
  (*(void (**)(uint64_t, void))(*(void *)(v5 + 88) + 32))(v6, *(void *)(v5 + 88));
  uint64_t v11 = (uint64_t)v3 + *(void *)(*v3 + 104);
  __swift_storeEnumTagSinglePayload(v11, 1, 1, v6);
  OUTLINED_FUNCTION_5_8();
  *((unsigned char *)v3 + *(void *)(v12 + 112)) = 0;
  OUTLINED_FUNCTION_5_8();
  *((unsigned char *)v3 + *(void *)(v13 + 120)) = 0;
  OUTLINED_FUNCTION_5_8();
  *((unsigned char *)v3 + *(void *)(v14 + 128)) = 0;
  OUTLINED_FUNCTION_5_8();
  uint64_t v16 = (uint64_t)v3 + *(void *)(v15 + 136);
  uint64_t v17 = type metadata accessor for Column.Func();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  OUTLINED_FUNCTION_5_8();
  __swift_storeEnumTagSinglePayload((uint64_t)v3 + *(void *)(v18 + 144), 1, 1, v17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF4180();
  if (v2)
  {
    swift_release();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v23, v23[3]);
    uint64_t v19 = (uint64_t)v24;
    sub_1A2CF4090();
    __swift_storeEnumTagSinglePayload(v19, 0, 1, v6);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 40))(v11, v19, v21);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_1A2CDA7F4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  uint64_t v5 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = &v13[-v9 - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41A0();
  sub_1A2CB81F8();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, v14);
  uint64_t v15 = *(void *)(*(void *)(v4 + 88) + 16);
  swift_getWitnessTable();
  sub_1A2CF40B0();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

void sub_1A2CDA96C()
{
}

void sub_1A2CDA990()
{
}

void sub_1A2CDA9B4()
{
}

#error "1A2CDA9EC: call analysis failed (funcsize=9)"

void Column.saveChain(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_11_4();
  a19 = v21;
  a20 = v22;
  uint64_t v24 = v23;
  OUTLINED_FUNCTION_1_6();
  uint64_t v26 = v25;
  uint64_t v28 = *(void *)(v27 + 80);
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v29;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v31);
  char v33 = (char *)&a9 - v32;
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_17_1();
  if (__swift_getEnumTagSinglePayload(v20, 1, v28))
  {
    uint64_t v35 = OUTLINED_FUNCTION_2_6();
    v36(v35);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v33, v20, v28);
    uint64_t v37 = OUTLINED_FUNCTION_2_6();
    v38(v37);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v26 + 88) + 24) + 8))(v24, v28);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v28);
  }
  OUTLINED_FUNCTION_12_3();
}

uint64_t static Column.createTableChain(for:ifNotExists:)()
{
  OUTLINED_FUNCTION_18_2();
  return v0();
}

uint64_t sub_1A2CDABA8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = Column.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A2CDABD4(void *a1)
{
  return sub_1A2CDA7F4(a1);
}

uint64_t Column.description.getter()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t v2 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v16 - v7;
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)v16 - v12;
  sub_1A2CB81F8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v2);
    sub_1A2CB81F8();
    return sub_1A2CF3970();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v1);
    v16[0] = 0;
    v16[1] = 0xE000000000000000;
    sub_1A2CF4060();
    uint64_t v14 = v16[0];
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v1);
  }
  return v14;
}

uint64_t sub_1A2CDADB4()
{
  return Column.description.getter();
}

uint64_t sub_1A2CDADD8()
{
  return sub_1A2CB81F8();
}

uint64_t sub_1A2CDAE00()
{
  return 16;
}

__n128 sub_1A2CDAE0C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of static ColumnType.dataType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ColumnType.valueType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ColumnType.init(valueType:connection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t method lookup function for Column(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Column);
}

uint64_t dispatch thunk of Column.value.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of Column.value.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Column.__allocating_init(primaryKey:index:unique:default:onUpdate:)()
{
  return (*(uint64_t (**)(void))(v0 + 328))();
}

uint64_t dispatch thunk of Column.isNullable.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of Column.notNull.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of Column.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t dispatch thunk of Column.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

void *sub_1A2CDAF88(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
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
    if (v9 != 1)
    {
      (*(void (**)(void *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
      return v3;
    }
    uint64_t v14 = *((void *)a2 + 1);
    *uint64_t v3 = *(void *)a2;
    v3[1] = v14;
    *((unsigned char *)v3 + v5) = 1;
  }
  swift_retain();
  return v3;
}

void *sub_1A2CDB114(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
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
    uint64_t v10 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v10;
    swift_retain();
    char v11 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v11 = 0;
  }
  *((unsigned char *)a1 + v4) = v11;
  return a1;
}

unsigned __int8 *sub_1A2CDB250(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
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
      swift_release();
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
      uint64_t v18 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v18;
      a1[v7] = 1;
      swift_retain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

_OWORD *sub_1A2CDB46C(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
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
    *a1 = *(_OWORD *)a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_1A2CDB5A4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
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
      swift_release();
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
      *(_OWORD *)a1 = *(_OWORD *)a2;
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

uint64_t sub_1A2CDB7BC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 16;
  if (*(void *)(v3 + 64) > 0x10uLL) {
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

void sub_1A2CDB8F0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10) {
    unint64_t v5 = 16;
  }
  size_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if (a3 < 0xFF)
  {
    int v8 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v9 = a2 - 255;
    if (v6 < 4)
    {
      int v10 = (v9 >> v7) + 1;
      if (v5 != -1)
      {
        int v12 = v9 & ~(-1 << v7);
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v6] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v10;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1A2CDBAB4);
      case 4:
        *(_DWORD *)&a1[v6] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
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

uint64_t sub_1A2CDBADC(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 16;
  if (*(void *)(v2 + 64) > 0x10uLL) {
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

uint64_t sub_1A2CDBB94()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CDBBA0()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CDBBA8()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CDBBB0()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CDBBB8()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CDBBE8()
{
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_5_1();
  return static ColumnType.createTableChain(for:ifNotExists:)(v0, v1, v2, v3);
}

uint64_t sub_1A2CDBC48()
{
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_1A2CDBC54(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  uint64_t v11 = v10;
  unint64_t v13 = *(void *)(v10 + 16);
  unint64_t v12 = *(void *)(v10 + 24);
  if (v13 >= v12 >> 1)
  {
    sub_1A2CB5734(v12 > 1, v13 + 1, 1, v10);
    uint64_t v11 = v33;
  }
  *(void *)(v11 + 16) = v13 + 1;
  uint64_t v14 = v11 + 16 * v13;
  *(void *)(v14 + 32) = 0x455441455243;
  *(void *)(v14 + 40) = 0xE600000000000000;
  uint64_t v15 = a3[3];
  uint64_t v16 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v15);
  char v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 56))(v15, v16);
  unint64_t v18 = *(void *)(v11 + 16);
  if (v17)
  {
    unint64_t v19 = *(void *)(v11 + 24);
    unint64_t v20 = v18 + 1;
    if (v18 >= v19 >> 1)
    {
      sub_1A2CB5734(v19 > 1, v18 + 1, 1, v11);
      uint64_t v11 = v36;
    }
    *(void *)(v11 + 16) = v20;
    uint64_t v21 = v11 + 16 * v18;
    *(void *)(v21 + 32) = 0x455551494E55;
    *(void *)(v21 + 40) = 0xE600000000000000;
  }
  else
  {
    unint64_t v20 = *(void *)(v11 + 16);
  }
  unint64_t v22 = *(void *)(v11 + 24);
  unint64_t v23 = v20 + 1;
  if (v20 >= v22 >> 1)
  {
    sub_1A2CB5734(v22 > 1, v20 + 1, 1, v11);
    uint64_t v11 = v34;
  }
  *(void *)(v11 + 16) = v23;
  uint64_t v24 = v11 + 16 * v20;
  *(void *)(v24 + 32) = 0x5845444E49;
  *(void *)(v24 + 40) = 0xE500000000000000;
  if (a4)
  {
    unint64_t v25 = *(void *)(v11 + 24);
    uint64_t v26 = v20 + 2;
    if (v23 >= v25 >> 1)
    {
      sub_1A2CB5734(v25 > 1, v26, 1, v11);
      uint64_t v11 = v37;
    }
    *(void *)(v11 + 16) = v26;
    uint64_t v27 = v11 + 16 * v23;
    strcpy((char *)(v27 + 32), "IF NOT EXISTS");
    *(_WORD *)(v27 + 46) = -4864;
  }
  sub_1A2CF3DD0();
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(a6 + 32);
  v28(a5, a6);
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  sub_1A2CF39F0();
  sub_1A2CF39F0();
  v28(a5, a6);
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  unint64_t v30 = *(void *)(v11 + 16);
  unint64_t v29 = *(void *)(v11 + 24);
  if (v30 >= v29 >> 1)
  {
    sub_1A2CB5734(v29 > 1, v30 + 1, 1, v11);
    uint64_t v11 = v35;
  }
  *(void *)(v11 + 16) = v30 + 1;
  uint64_t v31 = v11 + 16 * v30;
  *(void *)(v31 + 32) = 0x5F7865646E69;
  *(void *)(v31 + 40) = 0xE600000000000000;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
  return v11;
}

uint64_t sub_1A2CDBF98()
{
  return sub_1A2CB02B4();
}

uint64_t sub_1A2CDBFE0()
{
  uint64_t v2 = v0;
  char v14 = 3;
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = *(void *)(v3 + 88);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v8 = v7(v6, v4);
  swift_beginAccess();
  uint64_t v10 = *(void *)(v8 + 24);
  uint64_t v9 = *(void *)(v8 + 32);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  if (v9)
  {
    type metadata accessor for Statement();
    sub_1A2CF10C4(v10, v9, v6, v4);
    swift_bridgeObjectRelease();
    sub_1A2CF11CC();
    OUTLINED_FUNCTION_3_8();
    sub_1A2CB37E4(v2 + 16, (uint64_t)v13);
    uint64_t v12 = sub_1A2CAEF50(&v14, v9, v4, v13);
    OUTLINED_FUNCTION_2_7(v12);
    uint64_t result = OUTLINED_FUNCTION_1_8();
    if (!v1) {
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A2CDC12C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2 + 16;
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = *(void *)(v7 + 80);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = *(void *)(v9 + 88);
  type metadata accessor for Statement();
  char v17 = 3;
  sub_1A2CF10C4(a1, a2, v8, v10);
  uint64_t v11 = sub_1A2CF11CC();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v6, (uint64_t)v16);
  uint64_t v14 = sub_1A2CAEF50(&v17, v11, v13, v16);
  OUTLINED_FUNCTION_2_7(v14);
  uint64_t result = OUTLINED_FUNCTION_1_8();
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CDC22C()
{
  uint64_t v2 = v0 + 16;
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = *(void *)(v3 + 80);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = *(void *)(v5 + 88);
  OUTLINED_FUNCTION_5_9();
  char v24 = 3;
  sub_1A2CF1214(v4, v6);
  sub_1A2CF11CC();
  OUTLINED_FUNCTION_3_8();
  uint64_t v7 = sub_1A2CB37E4(v2, (uint64_t)&v17);
  uint64_t v15 = OUTLINED_FUNCTION_4_8(v7, v8, v9, v10, v11, v12, v13, v14, v17, v18, v19, v20, v21, v22, v23, v24);
  OUTLINED_FUNCTION_2_7(v15);
  uint64_t result = OUTLINED_FUNCTION_1_8();
  if (!v1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CDC2E4(uint64_t *a1)
{
  uint64_t v3 = v1 + 16;
  uint64_t v4 = *a1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = *(void *)(v5 + 80);
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = *(void *)(v7 + 88);
  OUTLINED_FUNCTION_5_9();
  char v26 = 3;
  *(void *)&long long v19 = v4;
  sub_1A2CF1228((uint64_t)&v19, v6, v8);
  sub_1A2CF11CC();
  OUTLINED_FUNCTION_3_8();
  uint64_t v9 = sub_1A2CB37E4(v3, (uint64_t)&v19);
  uint64_t v17 = OUTLINED_FUNCTION_4_8(v9, v10, v11, v12, v13, v14, v15, v16, v19, v20, v21, v22, v23, v24, v25, v26);
  OUTLINED_FUNCTION_2_7(v17);
  uint64_t result = OUTLINED_FUNCTION_1_8();
  if (!v2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t Delete.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t Delete.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CDC400()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Delete()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Delete(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Delete);
}

uint64_t dispatch thunk of Delete.entity(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of Delete.by(id:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of Delete.all()()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of Delete.where(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_1A2CDC544(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)v2 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v7 = (char *)&v28 - v6;
  uint64_t v9 = *(void *)(v8 + 88);
  uint64_t v10 = sub_1A2CB32CC(v4);
  type metadata accessor for Statement();
  char v31 = 1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_1A2CD4D18((uint64_t)v7, 1, v4, v9);
  uint64_t v11 = sub_1A2CD5ED8();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v2 + 16, (uint64_t)v30);
  sub_1A2CAEF50(&v31, v11, v13, v30);
  uint64_t v14 = v29;
  uint64_t v15 = sub_1A2CAF6B8(v10, (uint64_t (*)(void, void, uint64_t))sub_1A2CDC880);
  uint64_t v16 = v14;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v15 + 16);
  if (v17)
  {
    uint64_t v29 = v14;
    swift_bridgeObjectRetain();
    uint64_t v18 = (uint64_t *)(v15 + 40);
    uint64_t v19 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v20 = *(v18 - 1);
      if (v20)
      {
        uint64_t v21 = *v18;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A2CB7998();
          uint64_t v19 = v24;
        }
        unint64_t v22 = *(void *)(v19 + 16);
        if (v22 >= *(void *)(v19 + 24) >> 1)
        {
          sub_1A2CB7998();
          uint64_t v19 = v25;
        }
        *(void *)(v19 + 16) = v22 + 1;
        uint64_t v23 = v19 + 16 * v22;
        *(void *)(v23 + 32) = v20;
        *(void *)(v23 + 40) = v21;
      }
      v18 += 2;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    uint64_t v16 = v29;
  }
  swift_bridgeObjectRelease();
  sub_1A2CB7874();
  swift_release();
  uint64_t v26 = swift_bridgeObjectRelease();
  sub_1A2CB0EB0(v26);
  uint64_t result = swift_release();
  if (!v16) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CDC824(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = a3[3];
  uint64_t v6 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 88))(a4 + 16, v5, v6);
}

uint64_t sub_1A2CDC880(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1A2CDC824(a1, a2, a3, v3);
}

uint64_t Save.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

void sub_1A2CDC8A8()
{
  OUTLINED_FUNCTION_9_4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_9();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_7_8();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_9();
    }
  }
  OUTLINED_FUNCTION_5_10();
  if (v1)
  {
    sub_1A2CB56EC(0, &qword_1E959EFB8);
    uint64_t v5 = (const void *)OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_12_4(v5);
    OUTLINED_FUNCTION_11_5(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_10_5();
    sub_1A2CDCE78(v7, v8, v9);
    OUTLINED_FUNCTION_8_7();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_6_9();
    sub_1A2CDCB20(v10, v11, v12, v13);
  }
}

uint64_t method lookup function for Save(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Save);
}

uint64_t dispatch thunk of Save.entity(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

void sub_1A2CDC9A8()
{
  OUTLINED_FUNCTION_9_4();
  if (v2)
  {
    OUTLINED_FUNCTION_4_9();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_7_8();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_9();
    }
  }
  OUTLINED_FUNCTION_5_10();
  if (v1)
  {
    sub_1A2CB3A44(0, &qword_1E959EFA8, (void (*)(uint64_t))sub_1A2CDD124);
    uint64_t v5 = (const void *)OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_12_4(v5);
    OUTLINED_FUNCTION_11_5(v6);
  }
  if (v0)
  {
    uint64_t v7 = (char *)OUTLINED_FUNCTION_10_5();
    sub_1A2CDCFA0(v7, v8, v9);
    OUTLINED_FUNCTION_8_7();
  }
  else
  {
    uint64_t v10 = OUTLINED_FUNCTION_6_9();
    sub_1A2CDCC18(v10, v11, v12, v13);
  }
}

void sub_1A2CDCA64()
{
  OUTLINED_FUNCTION_9_4();
  if (v3)
  {
    OUTLINED_FUNCTION_4_9();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_7_8();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_3_9();
    }
  }
  OUTLINED_FUNCTION_5_10();
  if (v2)
  {
    sub_1A2CB56EC(0, qword_1E959EFC0);
    uint64_t v6 = (void *)swift_allocObject();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    long long v6[2] = v1;
    v6[3] = 2 * v7 - 64;
  }
  if (v0)
  {
    uint64_t v8 = (char *)OUTLINED_FUNCTION_10_5();
    sub_1A2CDD094(v8, v9, v10);
    OUTLINED_FUNCTION_8_7();
  }
  else
  {
    uint64_t v11 = OUTLINED_FUNCTION_6_9();
    sub_1A2CDCD2C(v11, v12, v13, v14);
  }
}

uint64_t sub_1A2CDCB20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1A2CF3F50();
  __break(1u);
  return result;
}

uint64_t sub_1A2CDCC18(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_1A2CDD124();
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_1A2CF3F50();
  __break(1u);
  return result;
}

char *sub_1A2CDCD2C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_1A2CF3F50();
  __break(1u);
  return result;
}

char *sub_1A2CDCE1C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_8();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_9();
    __break(1u);
  }
  else if (a3 != result || &result[4 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_5(a3, result);
  }
  return result;
}

char *sub_1A2CDCE78(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A2CF3F50();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_1A2CDCF0C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A2CF3F50();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1A2CDCFA0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A2CF3F50();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_1A2CDD034(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_8();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_9();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_5(a3, result);
  }
  return result;
}

char *sub_1A2CDD094(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1A2CF3F50();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_1A2CDD124()
{
  if (!qword_1E959EFB0)
  {
    sub_1A2CAFD2C();
    unint64_t IndexCommand = type metadata accessor for CreateIndexCommand();
    if (!v1) {
      atomic_store(IndexCommand, (unint64_t *)&qword_1E959EFB0);
    }
  }
}

uint64_t sub_1A2CDD180()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A2CDD1B8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t static BaseType.tableName.getter()
{
  return sub_1A2CF41E0();
}

uint64_t dispatch thunk of static BaseType.tableName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static BaseType.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1A2CDD22C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_1A2CDD234@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t sub_1A2CDD26C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x797469746E65 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A2CF4080();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A2CDD2EC()
{
  return 0x797469746E65;
}

uint64_t sub_1A2CDD300()
{
  return sub_1A2CC5C08();
}

uint64_t sub_1A2CDD308()
{
  return sub_1A2CC5C38();
}

uint64_t sub_1A2CDD314()
{
  return sub_1A2CC5C10();
}

uint64_t sub_1A2CDD320()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CDD364()
{
  return sub_1A2CDD2EC();
}

uint64_t sub_1A2CDD370@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2CDD26C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A2CDD3A4()
{
  return sub_1A2CC6664();
}

uint64_t sub_1A2CDD3C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CC5C08();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A2CDD3FC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A2CDD450(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A2CDD4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a2 + 8) + 32))();
  sub_1A2CF39F0();
  return v3;
}

uint64_t sub_1A2CDD500(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 8) + 40))();
}

uint64_t sub_1A2CDD538(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 24))(*(void *)(a1 + 16));
}

uint64_t sub_1A2CDD550(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 8) + 24) + 8))();
}

uint64_t sub_1A2CDD58C(void *a1, uint64_t a2)
{
  uint64_t v10 = *(void *)(a2 + 16);
  type metadata accessor for MigratableEntity.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_1A2CF4030();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v10 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41B0();
  sub_1A2CF4020();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t sub_1A2CDD6DC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = a4;
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v7;
  MEMORY[0x1F4188790](v8);
  unint64_t v30 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MigratableEntity.CodingKeys();
  swift_getWitnessTable();
  uint64_t v31 = sub_1A2CF3FD0();
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v10;
  MEMORY[0x1F4188790](v11);
  uint64_t v28 = a3;
  uint64_t v12 = type metadata accessor for MigratableEntity();
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v13;
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v24 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v17 = v32;
  sub_1A2CF4190();
  if (!v17)
  {
    uint64_t v24 = v16;
    uint64_t v32 = v12;
    uint64_t v19 = v29;
    uint64_t v18 = v30;
    sub_1A2CF3FC0();
    uint64_t v20 = OUTLINED_FUNCTION_1_11();
    v21(v20);
    unint64_t v22 = v24;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v18, a2);
    (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v26, v22, v32);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1A2CDD93C(uint64_t a1)
{
  return sub_1A2CDD4A4(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1A2CDD948(uint64_t a1)
{
  return sub_1A2CDD500(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1A2CDD954(uint64_t a1)
{
  return sub_1A2CDD550(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1A2CDD960@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1A2CDD6DC(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_1A2CDD980(void *a1, uint64_t a2)
{
  return sub_1A2CDD58C(a1, a2);
}

uint64_t sub_1A2CDD998(uint64_t a1)
{
  return sub_1A2CB32CC(*(void *)(a1 + 16));
}

uint64_t sub_1A2CDD9B0(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1A2CDD9EC(uint64_t a1)
{
  return sub_1A2CC80D4(a1);
}

uint64_t sub_1A2CDDA18(uint64_t a1)
{
  return sub_1A2CC80D4(a1);
}

uint64_t type metadata accessor for MigratableEntity.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for MigratableEntity()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_1A2CDDA74(unsigned char *result, int a2, int a3)
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
        char *result = a2;
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
      char *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A2CDDB10);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A2CDDB38()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A2CDDBC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_1A2CDDC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1A2CDDCD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1A2CDDD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1A2CDDD70(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!a2) {
    return 0;
  }
  int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_1A2CDDEBC(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  size_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
  char v9 = 8 * v8;
  BOOL v10 = a3 >= v7;
  int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v8 < 4)
    {
      int v14 = (v13 >> v9) + 1;
      if (v8)
      {
        int v16 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v8] = v14;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v14;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v14;
        return;
      default:
        return;
    }
  }
  switch(v12)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1A2CDE0C0);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
      }
      return;
  }
}

uint64_t sub_1A2CDE0E8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CDE104()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CDE120()
{
  return swift_getWitnessTable();
}

void static CGRect.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t CGRect.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16)) {
    goto LABEL_47;
  }
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = 0xE000000000000000;
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  uint64_t v6 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v6 = v3 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v35 = v3;
  unint64_t v36 = v4;
  uint64_t v37 = 0;
  uint64_t v38 = v6;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1A2CF3A20();
  if (v8)
  {
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    do
    {
      if (v9 != 91 || v10 != 0xE100000000000000)
      {
        char v12 = sub_1A2CF4080();
        BOOL v13 = v9 == 93 && v10 == 0xE100000000000000;
        BOOL v14 = v13;
        if ((v12 & 1) == 0 && !v14 && (sub_1A2CF4080() & 1) == 0) {
          MEMORY[0x1A623ED30](v9, v10);
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = sub_1A2CF3A20();
      uint64_t v10 = v15;
    }
    while (v15);
    uint64_t v16 = v39;
    unint64_t v5 = v40;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = swift_bridgeObjectRelease();
  uint64_t v35 = 44;
  unint64_t v36 = 0xE100000000000000;
  MEMORY[0x1F4188790](v17);
  uint64_t v32 = (uint64_t)&v35;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_1A2CDE660(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1A2CDF330, (uint64_t)&v31, v16, v5);
  swift_bridgeObjectRelease();
  int64_t v19 = *(void *)(v18 + 16);
  if (v19)
  {
    uint64_t v34 = a2;
    uint64_t v35 = MEMORY[0x1E4FBC860];
    sub_1A2CDEFF8(0, v19, 0);
    uint64_t v20 = v35;
    uint64_t v21 = v18 + 56;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1A2CF3B80();
      char v24 = v23;
      uint64_t v35 = v20;
      unint64_t v26 = *(void *)(v20 + 16);
      unint64_t v25 = *(void *)(v20 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_1A2CDEFF8((char *)(v25 > 1), v26 + 1, 1);
        uint64_t v20 = v35;
      }
      *(void *)(v20 + 16) = v26 + 1;
      unint64_t v27 = v20 + 16 * v26;
      *(void *)(v27 + 32) = v22;
      *(unsigned char *)(v27 + 40) = v24 & 1;
      v21 += 32;
      --v19;
    }
    while (v19);
    swift_bridgeObjectRelease();
    a2 = v34;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x1E4FBC860];
  }
  unint64_t v28 = *(void *)(v20 + 16);
  if (!v28)
  {
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (*(unsigned char *)(v20 + 40))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v28 < 2) {
    goto LABEL_40;
  }
  if (*(unsigned char *)(v20 + 56))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v28 < 3) {
    goto LABEL_41;
  }
  if ((*(unsigned char *)(v20 + 72) & 1) == 0)
  {
    if (v28 >= 4)
    {
      char v29 = *(unsigned char *)(v20 + 88);
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
      {
        sub_1A2CB2E8C(v3, v4, 0);
        return __swift_destroy_boxed_opaque_existential_1(a2);
      }
      goto LABEL_46;
    }
    goto LABEL_42;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  int v33 = 0;
  uint64_t v32 = 31;
  uint64_t result = sub_1A2CF3F30();
  __break(1u);
  return result;
}

uint64_t CGRect.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A2CF3DD0();
  swift_bridgeObjectRelease();
  sub_1A2CF3B60();
  OUTLINED_FUNCTION_1_12();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  sub_1A2CF3B60();
  OUTLINED_FUNCTION_1_12();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  sub_1A2CF3B60();
  OUTLINED_FUNCTION_1_12();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  sub_1A2CF3B60();
  OUTLINED_FUNCTION_1_12();
  swift_bridgeObjectRelease();
  uint64_t result = sub_1A2CF39F0();
  *(void *)a1 = 23387;
  *(void *)(a1 + 8) = 0xE200000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  return result;
}

uint64_t sub_1A2CDE5E4@<X0>(uint64_t a1@<X8>)
{
  return CGRect.valueType.getter(a1);
}

uint64_t sub_1A2CDE5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = CGRect.init(valueType:connection:)(a1, a2);
  *a3 = v5;
  a3[1] = v6;
  a3[2] = v7;
  a3[3] = v8;
  return result;
}

uint64_t sub_1A2CDE61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_1A2CF4080() & 1;
  }
}

uint64_t sub_1A2CDE660(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_0_7();
    goto LABEL_40;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x1E4FBC860];
  uint64_t v42 = v10 + 16;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_1A2CDEA98(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_36:
    swift_release();
    return v13;
  }
  uint64_t v41 = a1;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = MEMORY[0x1E4FBC860];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_1A2CF3A60();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      unint64_t v14 = sub_1A2CF39D0();
      goto LABEL_21;
    }
    int v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14) {
        goto LABEL_38;
      }
      uint64_t v21 = sub_1A2CF3A80();
      uint64_t v43 = v23;
      uint64_t v44 = v22;
      uint64_t v45 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2CDC8A8();
        uint64_t v13 = v28;
      }
      unint64_t v25 = *(void *)(v13 + 16);
      if (v25 >= *(void *)(v13 + 24) >> 1)
      {
        sub_1A2CDC8A8();
        uint64_t v13 = v29;
      }
      *(void *)(v13 + 16) = v25 + 1;
      unint64_t v26 = (void *)(v13 + 32 * v25);
      v26[4] = v21;
      v26[5] = v45;
      v26[6] = v44;
      v26[7] = v43;
      *(void *)uint64_t v42 = v13;
    }
    uint64_t v27 = sub_1A2CF39D0();
    unint64_t v14 = v27;
    *(void *)(v47 + 16) = v27;
    if ((v20 & 1) == 0 && *(void *)(v13 + 16) == v41) {
      break;
    }
    unint64_t v15 = v27;
    unint64_t v16 = v27;
LABEL_21:
    if (v48 == v14 >> 14) {
      goto LABEL_30;
    }
  }
  unint64_t v16 = v27;
  unint64_t v15 = v27;
LABEL_30:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_1A2CF3A80();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    sub_1A2CDEBA0();
    uint64_t v38 = *(void *)(*(void *)v42 + 16);
    sub_1A2CDEBEC(v38);
    uint64_t v13 = *(void *)v42;
    *(void *)(v13 + 16) = v38 + 1;
    uint64_t v39 = (void *)(v13 + 32 * v38);
    v39[4] = v31;
    v39[5] = v33;
    v39[6] = v35;
    v39[7] = v37;
    *(void *)uint64_t v42 = v13;
    goto LABEL_35;
  }
LABEL_38:
  OUTLINED_FUNCTION_0_7();
LABEL_40:
  uint64_t result = sub_1A2CF3F20();
  __break(1u);
  return result;
}

uint64_t sub_1A2CDEA98(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_1A2CF3A80();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    sub_1A2CDEBA0();
    uint64_t v14 = *(void *)(*(void *)(a4 + 16) + 16);
    sub_1A2CDEBEC(v14);
    uint64_t v15 = *(void *)(a4 + 16);
    *(void *)(v15 + 16) = v14 + 1;
    unint64_t v16 = (void *)(v15 + 32 * v14);
    v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_1A2CF3F20();
  __break(1u);
  return result;
}

void sub_1A2CDEBA0()
{
  uint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A2CDC8A8();
    *uint64_t v0 = v3;
  }
}

void sub_1A2CDEBEC(uint64_t a1)
{
  if (a1 + 1 > *(void *)(*(void *)v1 + 24) >> 1)
  {
    sub_1A2CDC8A8();
    *(void *)uint64_t v1 = v2;
  }
}

void *sub_1A2CDEC2C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[4 * a2] > __src ? (BOOL v3 = &__src[4 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 4 * a2);
  }
  return result;
}

void *sub_1A2CDED08(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[16 * a2] > __src ? (BOOL v3 = &__src[16 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 16 * a2);
  }
  return result;
}

uint64_t sub_1A2CDEDE4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_0_7();
    uint64_t result = sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    sub_1A2CB7B68();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1A2CDEEC8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (BOOL v3 = a1 + 40 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    sub_1A2CB3794(0, &qword_1EB5A61D0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

char *sub_1A2CDEFD8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2CDF038(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_1A2CDEFF8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2CDF13C(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_1A2CDF018(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2CDF21C(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

char *sub_1A2CDF038(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2CB4E08(0, &qword_1EB5A61E0, MEMORY[0x1E4FBC6E0], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2CDCE1C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2CDEC2C(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_1A2CDF13C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2CDF464();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2CB5770(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2CDED08(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_1A2CDF21C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2CDF3FC();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2CDD034(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2CDEEC8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A2CDF304(uint64_t *a1, uint64_t *a2)
{
  return sub_1A2CDE61C(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_1A2CDF330(uint64_t *a1)
{
  return sub_1A2CDF304(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_1A2CDF350(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A2CDF3B8(&qword_1E959F0C8);
  uint64_t result = sub_1A2CDF3B8(&qword_1E959F0D0);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A2CDF3B8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1A2CDF3FC()
{
  if (!qword_1EB5A5F60)
  {
    sub_1A2CB3794(255, &qword_1EB5A61D0);
    unint64_t v0 = sub_1A2CF4050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A5F60);
    }
  }
}

void sub_1A2CDF464()
{
  if (!qword_1E959F0D8)
  {
    sub_1A2CB4E08(255, &qword_1E959F0E0, MEMORY[0x1E4FBB3D0], MEMORY[0x1E4FBB718]);
    unint64_t v0 = sub_1A2CF4050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959F0D8);
    }
  }
}

uint64_t sub_1A2CDF4E0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1A2CDF518()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t OrderBy.reversed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3 ^ 1;
  return sub_1A2CDF540();
}

uint64_t sub_1A2CDF540()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for OrderBy()
{
  return sub_1A2CDF55C();
}

uint64_t sub_1A2CDF55C()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s5TeaDB7OrderByOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1A2CDF540();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for OrderBy(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1A2CDF540();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1A2CDF55C();
  return a1;
}

uint64_t assignWithTake for OrderBy(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1A2CDF55C();
  return a1;
}

uint64_t getEnumTagSinglePayload for OrderBy(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for OrderBy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A2CDF6D4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1A2CDF6DC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OrderBy()
{
  return &type metadata for OrderBy;
}

uint64_t sub_1A2CDF6F8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  char v10 = a5 & 1;
  uint64_t v11 = *a2;
  uint64_t v12 = *(void *)a3;
  uint64_t v13 = *(void *)(a3 + 8);
  unsigned __int8 v14 = *(unsigned char *)(a3 + 16);
  sub_1A2CB0380();
  sub_1A2CB0330();
  uint64_t v15 = sub_1A2CF3900();
  uint64_t v17 = v16;
  uint64_t v21 = v11;
  v19[0] = v12;
  v19[1] = v13;
  unsigned __int8 v20 = v14;
  sub_1A2CBF1D0(v11);
  sub_1A2CBC0D0(v12, v13, v14);
  return sub_1A2CBEC30(v15, v17, &v21, (uint64_t)v19, a4, v10, a6, a7);
}

uint64_t sub_1A2CDF7D4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_1A2CDF55C();
  }
  return result;
}

uint64_t FastEntity.__allocating_init<A>(_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  FastEntity.init<A>(_:)();
  return v0;
}

uint64_t FastEntity.init<A>(_:)()
{
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  v1[2].n128_u64[0] = OUTLINED_FUNCTION_6_10(v1, (__n128)xmmword_1A2CF49A0);
  v1[2].n128_u64[1] = v2;
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

void sub_1A2CDF884()
{
  if (!qword_1EB5A6928)
  {
    sub_1A2CB4064();
    unint64_t v0 = sub_1A2CF4050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A6928);
    }
  }
}

uint64_t FastEntity.__allocating_init<A, B>(_:_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  FastEntity.init<A, B>(_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B>(_:_:)()
{
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF4990);
  v1[2].n128_u64[0] = sub_1A2CE7E88(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = sub_1A2CE7E88(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t FastEntity.__allocating_init<A, B, C>(_:_:_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  FastEntity.init<A, B, C>(_:_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B, C>(_:_:_:)()
{
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF5F40);
  v1[2].n128_u64[0] = sub_1A2CE7E88(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = sub_1A2CE7E88(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t FastEntity.__allocating_init<A, B, C, D>(_:_:_:_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  FastEntity.init<A, B, C, D>(_:_:_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B, C, D>(_:_:_:_:)()
{
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF5F50);
  v1[2].n128_u64[0] = sub_1A2CE7E88(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = sub_1A2CE7E88(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  v1[12].n128_u64[1] = sub_1A2CE7E88(&v1[13].n128_u64[1]);
  v1[13].n128_u64[0] = v6;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E>(_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_22();
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  FastEntity.init<A, B, C, D, E>(_:_:_:_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B, C, D, E>(_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_32_0();
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF5F60);
  v1[2].n128_u64[0] = sub_1A2CE7E88(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = sub_1A2CE7E88(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  v1[12].n128_u64[1] = sub_1A2CE7E88(&v1[13].n128_u64[1]);
  v1[13].n128_u64[0] = v6;
  v1[16].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v7;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_32_0();
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  FastEntity.init<A, B, C, D, E, F>(_:_:_:_:_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF5F70);
  v1[2].n128_u64[0] = sub_1A2CE7E88(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = sub_1A2CE7E88(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  v1[12].n128_u64[1] = sub_1A2CE7E88(&v1[13].n128_u64[1]);
  v1[13].n128_u64[0] = v6;
  v1[16].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v7;
  v1[19].n128_u64[1] = sub_1A2CE7E88(&v1[20].n128_u64[1]);
  v1[20].n128_u64[0] = v8;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_15_2();
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  FastEntity.init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF5F80);
  uint64_t v3 = sub_1A2CE7E88(v2);
  unint64_t v5 = (void *)OUTLINED_FUNCTION_31_0(v3, v4);
  uint64_t v6 = sub_1A2CE7E88(v5);
  unint64_t v8 = (void *)OUTLINED_FUNCTION_30_0(v6, v7);
  uint64_t v9 = sub_1A2CE7E88(v8);
  uint64_t v11 = (void *)OUTLINED_FUNCTION_28_0(v9, v10);
  uint64_t v12 = sub_1A2CE7E88(v11);
  unsigned __int8 v14 = (void *)OUTLINED_FUNCTION_27_0(v12, v13);
  uint64_t v15 = sub_1A2CE7E88(v14);
  uint64_t v17 = (void *)OUTLINED_FUNCTION_26_0(v15, v16);
  uint64_t v18 = sub_1A2CE7E88(v17);
  unsigned __int8 v20 = (void *)OUTLINED_FUNCTION_25_0(v18, v19);
  v1[23].n128_u64[0] = sub_1A2CE7E88(v20);
  v1[23].n128_u64[1] = v21;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_3_10();
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_8();
  FastEntity.init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)();
  return v0;
}

void FastEntity.init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_14_2();
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF5F90);
  uint64_t v3 = sub_1A2CE7E88(v2);
  unint64_t v5 = (void *)OUTLINED_FUNCTION_31_0(v3, v4);
  uint64_t v6 = sub_1A2CE7E88(v5);
  unint64_t v8 = (void *)OUTLINED_FUNCTION_30_0(v6, v7);
  uint64_t v9 = sub_1A2CE7E88(v8);
  uint64_t v11 = (void *)OUTLINED_FUNCTION_28_0(v9, v10);
  uint64_t v12 = sub_1A2CE7E88(v11);
  unsigned __int8 v14 = (void *)OUTLINED_FUNCTION_27_0(v12, v13);
  uint64_t v15 = sub_1A2CE7E88(v14);
  uint64_t v17 = (void *)OUTLINED_FUNCTION_26_0(v15, v16);
  uint64_t v18 = sub_1A2CE7E88(v17);
  unsigned __int8 v20 = (void *)OUTLINED_FUNCTION_25_0(v18, v19);
  v1[23].n128_u64[0] = sub_1A2CE7E88(v20);
  v1[23].n128_u64[1] = v21;
  v1[26].n128_u64[1] = sub_1A2CE7E88(&v1[27].n128_u64[1]);
  v1[27].n128_u64[0] = v22;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_9_5();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)()
{
}

void FastEntity.init<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_14_2();
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  unint64_t v2 = OUTLINED_FUNCTION_5_11(v1, (__n128)xmmword_1A2CF5FA0);
  uint64_t v3 = sub_1A2CE7E88(v2);
  unint64_t v5 = (void *)OUTLINED_FUNCTION_31_0(v3, v4);
  uint64_t v6 = sub_1A2CE7E88(v5);
  unint64_t v8 = (void *)OUTLINED_FUNCTION_30_0(v6, v7);
  uint64_t v9 = sub_1A2CE7E88(v8);
  uint64_t v11 = (void *)OUTLINED_FUNCTION_28_0(v9, v10);
  uint64_t v12 = sub_1A2CE7E88(v11);
  unsigned __int8 v14 = (void *)OUTLINED_FUNCTION_27_0(v12, v13);
  uint64_t v15 = sub_1A2CE7E88(v14);
  uint64_t v17 = (void *)OUTLINED_FUNCTION_26_0(v15, v16);
  uint64_t v18 = sub_1A2CE7E88(v17);
  unsigned __int8 v20 = (void *)OUTLINED_FUNCTION_25_0(v18, v19);
  v1[23].n128_u64[0] = sub_1A2CE7E88(v20);
  v1[23].n128_u64[1] = v21;
  v1[26].n128_u64[1] = sub_1A2CE7E88(&v1[27].n128_u64[1]);
  v1[27].n128_u64[0] = v22;
  v1[30].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[31].n128_u64);
  v1[30].n128_u64[1] = v23;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_9_5();
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_3_10();
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_4_10();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)()
{
  sub_1A2CDF884();
  uint64_t v0 = (__n128 *)swift_allocObject();
  uint64_t v1 = OUTLINED_FUNCTION_6_10(v0, (__n128)xmmword_1A2CF5FB0);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_13_3(v1, v2);
  uint64_t v4 = sub_1A2CE7E88(v3);
  uint64_t v6 = (void *)OUTLINED_FUNCTION_12_5(v4, v5);
  uint64_t v7 = sub_1A2CE7E88(v6);
  uint64_t v9 = (void *)OUTLINED_FUNCTION_11_6(v7, v8);
  v0[12].n128_u64[1] = sub_1A2CE7E88(v9);
  v0[13].n128_u64[0] = v10;
  v0[16].n128_u64[0] = sub_1A2CE7E88((__n128 *)v0[17].n128_u64);
  v0[16].n128_u64[1] = v11;
  uint64_t v12 = sub_1A2CE7E88(&v0[20].n128_u64[1]);
  unsigned __int8 v14 = (void *)OUTLINED_FUNCTION_8_8(v12, v13);
  uint64_t v15 = sub_1A2CE7E88(v14);
  uint64_t v17 = (void *)OUTLINED_FUNCTION_21_0(v15, v16);
  v0[26].n128_u64[1] = sub_1A2CE7E88(v17);
  v0[27].n128_u64[0] = v18;
  uint64_t v19 = sub_1A2CE7E88((__n128 *)v0[31].n128_u64);
  unint64_t v21 = (void *)OUTLINED_FUNCTION_20_0(v19, v20);
  v0[33].n128_u64[1] = sub_1A2CE7E88(v21);
  v0[34].n128_u64[0] = v22;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = v24;
  *(void *)(v24 + 16) = v0;
  return result;
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)()
{
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_15_2();
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  uint64_t v2 = OUTLINED_FUNCTION_6_10(v1, (__n128)xmmword_1A2CF5FC0);
  uint64_t v4 = (void *)OUTLINED_FUNCTION_13_3(v2, v3);
  uint64_t v5 = sub_1A2CE7E88(v4);
  uint64_t v7 = (void *)OUTLINED_FUNCTION_12_5(v5, v6);
  uint64_t v8 = sub_1A2CE7E88(v7);
  unint64_t v10 = (void *)OUTLINED_FUNCTION_11_6(v8, v9);
  v1[12].n128_u64[1] = sub_1A2CE7E88(v10);
  v1[13].n128_u64[0] = v11;
  v1[16].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v12;
  uint64_t v13 = sub_1A2CE7E88(&v1[20].n128_u64[1]);
  uint64_t v15 = (void *)OUTLINED_FUNCTION_8_8(v13, v14);
  uint64_t v16 = sub_1A2CE7E88(v15);
  unint64_t v18 = (void *)OUTLINED_FUNCTION_21_0(v16, v17);
  v1[26].n128_u64[1] = sub_1A2CE7E88(v18);
  v1[27].n128_u64[0] = v19;
  uint64_t v20 = sub_1A2CE7E88((__n128 *)v1[31].n128_u64);
  unint64_t v22 = (void *)OUTLINED_FUNCTION_20_0(v20, v21);
  uint64_t v23 = sub_1A2CE7E88(v22);
  v1[37].n128_u64[0] = OUTLINED_FUNCTION_29_0(v23, v24);
  v1[37].n128_u64[1] = v25;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_16();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)()
{
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_2();
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  uint64_t v2 = OUTLINED_FUNCTION_6_10(v1, (__n128)xmmword_1A2CF5FD0);
  uint64_t v4 = (void *)OUTLINED_FUNCTION_13_3(v2, v3);
  uint64_t v5 = sub_1A2CE7E88(v4);
  uint64_t v7 = (void *)OUTLINED_FUNCTION_12_5(v5, v6);
  uint64_t v8 = sub_1A2CE7E88(v7);
  unint64_t v10 = (void *)OUTLINED_FUNCTION_11_6(v8, v9);
  v1[12].n128_u64[1] = sub_1A2CE7E88(v10);
  v1[13].n128_u64[0] = v11;
  v1[16].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v12;
  uint64_t v13 = sub_1A2CE7E88(&v1[20].n128_u64[1]);
  uint64_t v15 = (void *)OUTLINED_FUNCTION_8_8(v13, v14);
  uint64_t v16 = sub_1A2CE7E88(v15);
  unint64_t v18 = (void *)OUTLINED_FUNCTION_21_0(v16, v17);
  v1[26].n128_u64[1] = sub_1A2CE7E88(v18);
  v1[27].n128_u64[0] = v19;
  uint64_t v20 = sub_1A2CE7E88((__n128 *)v1[31].n128_u64);
  unint64_t v22 = (void *)OUTLINED_FUNCTION_20_0(v20, v21);
  v1[33].n128_u64[1] = sub_1A2CE7E88(v22);
  v1[34].n128_u64[0] = v23;
  v1[37].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[38].n128_u64);
  v1[37].n128_u64[1] = v24;
  v1[40].n128_u64[1] = sub_1A2CE7E88(&v1[41].n128_u64[1]);
  v1[41].n128_u64[0] = v25;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_16();
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_2_10();
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_8();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)();
  return v0;
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_7_9();
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  uint64_t v2 = OUTLINED_FUNCTION_6_10(v1, (__n128)xmmword_1A2CF5FE0);
  uint64_t v4 = (void *)OUTLINED_FUNCTION_13_3(v2, v3);
  uint64_t v5 = sub_1A2CE7E88(v4);
  uint64_t v7 = (void *)OUTLINED_FUNCTION_12_5(v5, v6);
  uint64_t v8 = sub_1A2CE7E88(v7);
  unint64_t v10 = (void *)OUTLINED_FUNCTION_11_6(v8, v9);
  v1[12].n128_u64[1] = sub_1A2CE7E88(v10);
  v1[13].n128_u64[0] = v11;
  v1[16].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v12;
  uint64_t v13 = sub_1A2CE7E88(&v1[20].n128_u64[1]);
  uint64_t v15 = (void *)OUTLINED_FUNCTION_8_8(v13, v14);
  uint64_t v16 = sub_1A2CE7E88(v15);
  unint64_t v18 = (void *)OUTLINED_FUNCTION_21_0(v16, v17);
  v1[26].n128_u64[1] = sub_1A2CE7E88(v18);
  v1[27].n128_u64[0] = v19;
  uint64_t v20 = sub_1A2CE7E88((__n128 *)v1[31].n128_u64);
  unint64_t v22 = (void *)OUTLINED_FUNCTION_20_0(v20, v21);
  uint64_t v23 = sub_1A2CE7E88(v22);
  uint64_t v25 = OUTLINED_FUNCTION_29_0(v23, v24);
  uint64_t v27 = OUTLINED_FUNCTION_23_0(v25, v26);
  v1[44].n128_u64[0] = OUTLINED_FUNCTION_24_0(v27, v28);
  v1[44].n128_u64[1] = v29;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_19_1();
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_4_10();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)();
  return v0;
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_17_2();
  sub_1A2CDF884();
  uint64_t v1 = (__n128 *)swift_allocObject();
  uint64_t v2 = OUTLINED_FUNCTION_6_10(v1, (__n128)xmmword_1A2CF5FF0);
  uint64_t v4 = (void *)OUTLINED_FUNCTION_31_0(v2, v3);
  uint64_t v5 = sub_1A2CE7E88(v4);
  uint64_t v7 = (void *)OUTLINED_FUNCTION_30_0(v5, v6);
  uint64_t v8 = sub_1A2CE7E88(v7);
  unint64_t v10 = (void *)OUTLINED_FUNCTION_28_0(v8, v9);
  uint64_t v11 = sub_1A2CE7E88(v10);
  uint64_t v13 = (void *)OUTLINED_FUNCTION_27_0(v11, v12);
  uint64_t v14 = sub_1A2CE7E88(v13);
  uint64_t v16 = (void *)OUTLINED_FUNCTION_26_0(v14, v15);
  uint64_t v17 = sub_1A2CE7E88(v16);
  unint64_t v19 = (void *)OUTLINED_FUNCTION_25_0(v17, v18);
  v1[23].n128_u64[0] = sub_1A2CE7E88(v19);
  v1[23].n128_u64[1] = v20;
  v1[26].n128_u64[1] = sub_1A2CE7E88(&v1[27].n128_u64[1]);
  v1[27].n128_u64[0] = v21;
  v1[30].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[31].n128_u64);
  v1[30].n128_u64[1] = v22;
  v1[33].n128_u64[1] = sub_1A2CE7E88(&v1[34].n128_u64[1]);
  v1[34].n128_u64[0] = v23;
  v1[37].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[38].n128_u64);
  v1[37].n128_u64[1] = v24;
  v1[40].n128_u64[1] = sub_1A2CE7E88(&v1[41].n128_u64[1]);
  v1[41].n128_u64[0] = v25;
  v1[44].n128_u64[0] = sub_1A2CE7E88((__n128 *)v1[45].n128_u64);
  v1[44].n128_u64[1] = v26;
  v1[47].n128_u64[1] = sub_1A2CE7E88(&v1[48].n128_u64[1]);
  v1[48].n128_u64[0] = v27;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_19_1();
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_2_10();
  uint64_t v0 = OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_8();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)();
  return v0;
}

uint64_t FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_7_9();
  sub_1A2CDF884();
  uint64_t v0 = (__n128 *)swift_allocObject();
  uint64_t v1 = OUTLINED_FUNCTION_6_10(v0, (__n128)xmmword_1A2CF6000);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_13_3(v1, v2);
  uint64_t v4 = sub_1A2CE7E88(v3);
  uint64_t v6 = (void *)OUTLINED_FUNCTION_12_5(v4, v5);
  uint64_t v7 = sub_1A2CE7E88(v6);
  uint64_t v9 = (void *)OUTLINED_FUNCTION_11_6(v7, v8);
  v0[12].n128_u64[1] = sub_1A2CE7E88(v9);
  v0[13].n128_u64[0] = v10;
  v0[16].n128_u64[0] = sub_1A2CE7E88((__n128 *)v0[17].n128_u64);
  v0[16].n128_u64[1] = v11;
  uint64_t v12 = sub_1A2CE7E88(&v0[20].n128_u64[1]);
  uint64_t v14 = (void *)OUTLINED_FUNCTION_8_8(v12, v13);
  uint64_t v15 = sub_1A2CE7E88(v14);
  uint64_t v17 = (void *)OUTLINED_FUNCTION_21_0(v15, v16);
  v0[26].n128_u64[1] = sub_1A2CE7E88(v17);
  v0[27].n128_u64[0] = v18;
  uint64_t v19 = sub_1A2CE7E88((__n128 *)v0[31].n128_u64);
  unint64_t v21 = (void *)OUTLINED_FUNCTION_20_0(v19, v20);
  v0[33].n128_u64[1] = sub_1A2CE7E88(v21);
  v0[34].n128_u64[0] = v22;
  uint64_t v23 = sub_1A2CE7E88((__n128 *)v0[38].n128_u64);
  uint64_t v25 = OUTLINED_FUNCTION_23_0(v23, v24);
  v0[44].n128_u64[0] = OUTLINED_FUNCTION_24_0(v25, v26);
  v0[44].n128_u64[1] = v27;
  v0[47].n128_u64[1] = sub_1A2CE7E88(&v0[48].n128_u64[1]);
  v0[48].n128_u64[0] = v28;
  v0[51].n128_u64[0] = sub_1A2CE7E88((__n128 *)v0[52].n128_u64);
  v0[51].n128_u64[1] = v29;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = v31;
  *(void *)(v31 + 16) = v0;
  return result;
}

uint64_t FastEntity.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t dispatch thunk of FastEntityProviding.fastEntity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for FastEntity(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FastEntity);
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B>(_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C>(_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D>(_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E>(_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ConnectionType.assertions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ConnectionType.prepare(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ConnectionType.invoke(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_1A2CE124C()
{
  return sub_1A2CAF5FC(*(sqlite3 **)(v0 + 24));
}

uint64_t sub_1A2CE1270()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CE1280()
{
  return sub_1A2CE124C();
}

ValueMetadata *type metadata accessor for Versions()
{
  return &type metadata for Versions;
}

uint64_t sub_1A2CE12B4()
{
  OUTLINED_FUNCTION_6_11();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CE12F0()
{
  OUTLINED_FUNCTION_6_11();
  uint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  return sub_1A2CC8448(v3, v4);
}

uint64_t sub_1A2CE132C()
{
  return swift_retain();
}

void *sub_1A2CE1370()
{
  sub_1A2CB497C(0, qword_1EB5A6740, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for Column);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_0_9();
  uint64_t v1 = v0;
  sub_1A2CB497C(0, &qword_1EB5A6298, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for FastColumn);
  uint64_t v2 = (void *)OUTLINED_FUNCTION_14();
  v2[2] = 25705;
  v2[3] = 0xE200000000000000;
  v2[4] = v1;
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_0_9();
  uint64_t v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_14();
  uint64_t v6 = OUTLINED_FUNCTION_1_14(v5);
  *(void *)(v6 + 24) = v7;
  *(void *)(v6 + 32) = v4;
  swift_retain();
  sub_1A2CE12B4();
  swift_retain();
  swift_retain();
  swift_release();
  swift_retain();
  sub_1A2CE12B4();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_1A2CE14E0()
{
  return sub_1A2CB3008();
}

BOOL sub_1A2CE1544(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1A2CE1554()
{
  return sub_1A2CF4130();
}

uint64_t sub_1A2CE157C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A2CF4080() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A2CF4080();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A2CE1654()
{
  return 2;
}

uint64_t sub_1A2CE165C()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CE16A4(char a1)
{
  if (a1) {
    return 0x6E6F6973726576;
  }
  else {
    return 25705;
  }
}

uint64_t sub_1A2CE16D0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a3;
  sub_1A2CAFCC4(0, &qword_1E959F100, (uint64_t (*)(void))sub_1A2CE1E68, (uint64_t)&type metadata for Versions.Entity.CodingKeys, MEMORY[0x1E4FBBDE0]);
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_1_2();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v14 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CE1E68();
  sub_1A2CF41B0();
  uint64_t v16 = a2;
  char v15 = 0;
  sub_1A2CB497C(0, &qword_1EB5A6298, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for FastColumn);
  sub_1A2CE1EDC(&qword_1E959F108);
  OUTLINED_FUNCTION_4_11();
  if (!v3)
  {
    uint64_t v16 = v14;
    char v15 = 1;
    OUTLINED_FUNCTION_4_11();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v7);
}

void *sub_1A2CE1874(void *a1)
{
  sub_1A2CAFCC4(0, &qword_1E959F0E8, (uint64_t (*)(void))sub_1A2CE1E68, (uint64_t)&type metadata for Versions.Entity.CodingKeys, MEMORY[0x1E4FBBDC0]);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v2);
  sub_1A2CB497C(0, qword_1EB5A6740, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for Column);
  swift_initStackObject();
  OUTLINED_FUNCTION_0_9();
  sub_1A2CB497C(0, &qword_1EB5A6298, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for FastColumn);
  uint64_t inited = (void *)swift_initStackObject();
  OUTLINED_FUNCTION_9_6(inited);
  swift_initStackObject();
  OUTLINED_FUNCTION_0_9();
  uint64_t v5 = v4;
  uint64_t v6 = swift_initStackObject();
  uint64_t v7 = OUTLINED_FUNCTION_1_14(v6);
  *(void *)(v7 + 24) = v8;
  *(void *)(v7 + 32) = v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CE1E68();
  sub_1A2CF4190();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_release();
    swift_setDeallocating();
    sub_1A2CE1EB4();
    swift_deallocClassInstance();
  }
  else
  {
    sub_1A2CE1EDC(&qword_1E959F0F8);
    OUTLINED_FUNCTION_3_11();
    swift_release();
    uint64_t inited = v13;
    swift_retain();
    OUTLINED_FUNCTION_3_11();
    swift_release();
    uint64_t v10 = OUTLINED_FUNCTION_7_10();
    v11(v10);
    swift_retain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_release();
    swift_release();
  }
  return inited;
}

BOOL sub_1A2CE1B48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A2CE1544(*a1, *a2);
}

uint64_t sub_1A2CE1B54()
{
  return sub_1A2CE165C();
}

uint64_t sub_1A2CE1B5C()
{
  return sub_1A2CE1554();
}

uint64_t sub_1A2CE1B64()
{
  return sub_1A2CE16A4(*v0);
}

uint64_t sub_1A2CE1B6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2CE157C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A2CE1B94@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CE1654();
  *a1 = result;
  return result;
}

uint64_t sub_1A2CE1BBC(uint64_t a1)
{
  unint64_t v2 = sub_1A2CE1E68();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1A2CE1BF8(uint64_t a1)
{
  unint64_t v2 = sub_1A2CE1E68();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1A2CE1C34()
{
  return sub_1A2CE132C();
}

uint64_t sub_1A2CE1C3C()
{
  return sub_1A2CE14E0();
}

uint64_t sub_1A2CE1C44()
{
  return 0x65765F656C626174;
}

void *sub_1A2CE1C68@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1A2CB489C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_1A2CE1C94(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for Versions.Entity(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for Versions.Entity(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Versions.Entity(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Versions.Entity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Versions.Entity()
{
  return &type metadata for Versions.Entity;
}

void *sub_1A2CE1DF8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1A2CE1874(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1A2CE1E24(void *a1)
{
  return sub_1A2CE16D0(a1, *v1, v1[1]);
}

unint64_t sub_1A2CE1E40(uint64_t a1)
{
  unint64_t result = sub_1A2CBBB7C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A2CE1E68()
{
  unint64_t result = qword_1E959F0F0;
  if (!qword_1E959F0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959F0F0);
  }
  return result;
}

uint64_t sub_1A2CE1EB4()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1A2CE1EDC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A2CB497C(255, &qword_1EB5A6298, (uint64_t (*)(void, void, _UNKNOWN **))type metadata accessor for FastColumn);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Versions.Entity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A2CE2008);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Versions.Entity.CodingKeys()
{
  return &type metadata for Versions.Entity.CodingKeys;
}

unint64_t sub_1A2CE2044()
{
  unint64_t result = qword_1E959F110;
  if (!qword_1E959F110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959F110);
  }
  return result;
}

unint64_t sub_1A2CE2094()
{
  unint64_t result = qword_1E959F118;
  if (!qword_1E959F118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959F118);
  }
  return result;
}

unint64_t sub_1A2CE20E4()
{
  unint64_t result = qword_1E959F120[0];
  if (!qword_1E959F120[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E959F120);
  }
  return result;
}

uint64_t sub_1A2CE2130()
{
  return sub_1A2CF3C60();
}

void sub_1A2CE2184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, _UNKNOWN **a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  OUTLINED_FUNCTION_18();
  a24 = v25;
  a25 = v27;
  int64_t v28 = *(void *)(v26 + 16);
  if (v28)
  {
    uint64_t v29 = v26;
    a13 = MEMORY[0x1E4FBC860];
    sub_1A2CDF018(0, v28, 0);
    uint64_t v30 = a13;
    uint64_t v31 = (uint64_t *)(v29 + 40);
    do
    {
      uint64_t v33 = *(v31 - 1);
      uint64_t v32 = *v31;
      a13 = v30;
      unint64_t v35 = *(void *)(v30 + 16);
      unint64_t v34 = *(void *)(v30 + 24);
      swift_bridgeObjectRetain();
      if (v35 >= v34 >> 1)
      {
        sub_1A2CDF018((char *)(v34 > 1), v35 + 1, 1);
        uint64_t v30 = a13;
      }
      v31 += 2;
      a11 = MEMORY[0x1E4FBB1A0];
      a12 = &protocol witness table for String;
      *(void *)&a9 = v33;
      *((void *)&a9 + 1) = v32;
      *(void *)(v30 + 16) = v35 + 1;
      sub_1A2CB377C(&a9, v30 + 40 * v35 + 32);
      --v28;
    }
    while (v28);
  }
  OUTLINED_FUNCTION_16();
}

uint64_t sub_1A2CE2268@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  *a1 = v3;
  a1[1] = v4;
  return sub_1A2CE78E4(v3, v4);
}

void sub_1A2CE22B0()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13_4();
  *(unsigned char *)(v0 + 16) = 4;
  *(_OWORD *)(v0 + 24) = xmmword_1A2CF62C0;
  OUTLINED_FUNCTION_1_15(v1, v2, v3);
  uint64_t v4 = OUTLINED_FUNCTION_12_6();
  sub_1A2CE7700(v4, v5, v6);
  OUTLINED_FUNCTION_19_2();
  uint64_t v7 = OUTLINED_FUNCTION_10_7();
  sub_1A2CE7700(v7, v8, v9);
  OUTLINED_FUNCTION_16();
}

void sub_1A2CE2310()
{
  OUTLINED_FUNCTION_18();
  uint64_t v24 = v1;
  uint64_t v25 = v2;
  char v4 = v3;
  char v6 = v5;
  char v8 = v7;
  *(unsigned char *)(v0 + 16) = 3;
  OUTLINED_FUNCTION_2();
  uint64_t v10 = v0 + *(void *)(v9 + 104);
  uint64_t v11 = sub_1A2CF35B0();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  OUTLINED_FUNCTION_2();
  uint64_t v13 = *(void *)(v12 + 112);
  *(unsigned char *)(v0 + v13) = 0;
  OUTLINED_FUNCTION_2();
  uint64_t v15 = *(void *)(v14 + 120);
  *(unsigned char *)(v0 + v15) = 0;
  OUTLINED_FUNCTION_2();
  uint64_t v17 = *(void *)(v16 + 128);
  *(unsigned char *)(v0 + v17) = 0;
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v0 + *(void *)(v18 + 136);
  sub_1A2CC8120(0);
  uint64_t v21 = v20;
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  OUTLINED_FUNCTION_2();
  uint64_t v23 = v0 + *(void *)(v22 + 144);
  __swift_storeEnumTagSinglePayload(v23, 1, 1, v21);
  *(unsigned char *)(v0 + v13) = v8;
  *(unsigned char *)(v0 + v15) = v6;
  *(unsigned char *)(v0 + v17) = v4;
  swift_beginAccess();
  sub_1A2CE77E8(v24, v19, &qword_1EB5A5E38, sub_1A2CC8120);
  swift_endAccess();
  swift_beginAccess();
  sub_1A2CE77E8(v25, v23, &qword_1EB5A5E38, sub_1A2CC8120);
  swift_endAccess();
  OUTLINED_FUNCTION_16();
}

uint64_t MixedKeyValueStore.promises.getter()
{
  swift_beginAccess();
  type metadata accessor for MixedKeyValueStore.Promises();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  return v0();
}

uint64_t type metadata accessor for MixedKeyValueStore.Promises()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t MixedKeyValueStore.__allocating_init(database:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  MixedKeyValueStore.init(database:)(a1);
  return v2;
}

uint64_t MixedKeyValueStore.init(database:)(uint64_t a1)
{
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 32) = sub_1A2CBF82C;
  *(void *)(v1 + 40) = 0;
  *(unsigned char *)(v1 + 56) = 1;
  *(void *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = *(void *)(v3 + 80);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = *(void *)(v5 + 88);
  type metadata accessor for MKVSEntity();
  swift_retain();
  swift_getWitnessTable();
  uint64_t v7 = Database.table<A>(_:)();
  if (v2)
  {
    swift_release();
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_3_0();
    v8();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(void *)(v1 + 24) = v7;
    swift_retain();
    sub_1A2CC01E8();
    v14[8] = 0;
    swift_beginAccess();
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_1();
    (*(void (**)(uint64_t, unsigned char *))(v9 + 40))(v1 + 48, v14);
    uint64_t v10 = swift_endAccess();
    MEMORY[0x1F4188790](v10);
    sub_1A2CF3710();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v4;
    *(void *)(v11 + 24) = v6;
    uint64_t v12 = (void *)sub_1A2CF36C0();
    sub_1A2CF36D0();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
  }
  return v1;
}

uint64_t type metadata accessor for MKVSEntity()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CE2864(uint64_t a1, uint64_t a2)
{
  char v5 = 0;
  swift_retain();
  uint64_t v3 = Database.asyncWrite(_:block:)(&v5, (uint64_t)sub_1A2CE79A4, a2);
  swift_release();
  return v3;
}

uint64_t sub_1A2CE28D4()
{
  return sub_1A2CE2864(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1A2CE28F0()
{
  return swift_release();
}

uint64_t sub_1A2CE2994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1EB5A61F0 != -1) {
    swift_once();
  }
  id v5 = (id)qword_1EB5A8268;
  sub_1A2CF3C00();
  sub_1A2CC845C();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1A2CF4990;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  uint64_t v9 = v8;
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v11 = sub_1A2CC84C4();
  *(void *)(v6 + 64) = v11;
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
  sub_1A2CF3EF0();
  *(void *)(v6 + 96) = v10;
  *(void *)(v6 + 104) = v11;
  *(void *)(v6 + 72) = 0;
  *(void *)(v6 + 80) = 0xE000000000000000;
  sub_1A2CF3720();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CE2B0C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1A2CE2B1C(uint64_t a1)
{
  return sub_1A2CE2994(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t MixedKeyValueStore.allKeys()()
{
  uint64_t v2 = MEMORY[0x1E4FBC860];
  sub_1A2CE2130();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_1A2CE2B9C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  sub_1A2CBD4CC();
  uint64_t v5 = sub_1A2CBD714();
  uint64_t result = swift_release();
  if (!v2)
  {
    v12[5] = v5;
    MEMORY[0x1F4188790](result);
    uint64_t v7 = *(void *)(v4 + 88);
    long long v12[2] = *(void *)(v4 + 80);
    _OWORD v12[3] = v7;
    type metadata accessor for MKVSEntity();
    uint64_t v8 = sub_1A2CF3B50();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v11 = sub_1A2CBAA68((void (*)(char *, char *))sub_1A2CE7984, (uint64_t)v12, v8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v10);
    swift_bridgeObjectRelease();
    *a1 = v11;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CE2CF8()
{
  return sub_1A2CE2B9C(*(uint64_t **)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t MixedKeyValueStore.read<A>(_:maxAge:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *v4;
  uint64_t v11 = sub_1A2CF35B0();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_4_12(v15, v78);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_17_3();
  uint64_t v83 = v17;
  uint64_t v18 = *(void *)(v10 + 80);
  uint64_t v97 = *(void *)(v10 + 88);
  uint64_t v98 = v18;
  v104[2] = v18;
  v104[3] = a2;
  v104[4] = v97;
  v104[5] = a3;
  v104[6] = a4;
  uint64_t v19 = type metadata accessor for MKVSEntry();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v20);
  uint64_t v94 = (char *)&v78 - v21;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v22);
  uint64_t v96 = (char *)&v78 - v23;
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_7_11(v25, v78);
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_17_3();
  v101 = v29;
  if (!*(void *)(a1 + 16))
  {
    swift_getTupleTypeMetadata2();
    sub_1A2CF3B00();
    return sub_1A2CF3850();
  }
  uint64_t v84 = v28;
  uint64_t v85 = v27;
  uint64_t v81 = v13;
  v104[1] = sub_1A2CF3820();
  uint64_t v30 = sub_1A2CE34F4((uint64_t)v4);
  if (v5)
  {
    swift_bridgeObjectRelease();
    return (uint64_t)v4;
  }
  uint64_t v31 = a4;
  uint64_t v32 = v30;
  v99 = v4;
  uint64_t v91 = v19;
  uint64_t v79 = a3;
  uint64_t v92 = v31;
  uint64_t v80 = v11;
  uint64_t v100 = 0;
  uint64_t v33 = type metadata accessor for MKVSEntity();
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_1A2CF3AC0();
  swift_bridgeObjectRelease();
  v104[0] = v34;
  uint64_t v90 = v33;
  uint64_t v35 = MEMORY[0x1A623EE80](v32, v33);
  uint64_t v93 = a2;
  uint64_t v36 = v32;
  if (v34 == v35)
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = v99;
LABEL_14:
    uint64_t v65 = (void (*)(uint64_t))v37[4];
    uint64_t v66 = swift_retain();
    uint64_t v67 = v82;
    v65(v66);
    swift_release();
    uint64_t v68 = v83;
    sub_1A2CF3570();
    v101 = *(uint64_t (**)(uint64_t, uint64_t))(v81 + 8);
    uint64_t v69 = v101(v67, v80);
    v99 = &v78;
    MEMORY[0x1F4188790](v69);
    uint64_t v71 = v97;
    uint64_t v70 = v98;
    uint64_t v73 = v92;
    uint64_t v72 = v93;
    *(&v78 - 6) = v98;
    *(&v78 - 5) = v72;
    uint64_t v74 = v79;
    *(&v78 - 4) = v71;
    *(&v78 - 3) = v74;
    uint64_t v77 = v68;
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_1A2CF3880();
    uint64_t v100 = &v78;
    MEMORY[0x1F4188790](v75);
    *(&v78 - 6) = v70;
    *(&v78 - 5) = v72;
    *(&v78 - 4) = v71;
    *(&v78 - 3) = v74;
    uint64_t v76 = v73;
    uint64_t v4 = (uint64_t *)sub_1A2CF38A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v101(v68, v80);
    return (uint64_t)v4;
  }
  uint64_t v89 = v32 + 32;
  uint64_t v87 = v84 + 16;
  uint64_t v86 = v85 + 16;
  v85 += 8;
  v84 += 8;
  uint64_t v38 = v79;
  uint64_t v39 = v101;
  uint64_t v40 = v90;
  uint64_t v88 = v36;
  while (1)
  {
    char v41 = sub_1A2CF3B10();
    sub_1A2CF3AF0();
    if ((v41 & 1) == 0) {
      break;
    }
    uint64_t v42 = (uint64_t *)(v89 + 24 * v34);
    uint64_t v44 = *v42;
    uint64_t v43 = v42[1];
    uint64_t v45 = v42[2];
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    MEMORY[0x1A623EE90](v104, v36, v40);
    swift_bridgeObjectRelease();
    uint64_t result = sub_1A2CE2268(&v102);
    unint64_t v47 = v103;
    if (v103 >> 60 == 15) {
      goto LABEL_18;
    }
    uint64_t v48 = v102;
    uint64_t v49 = (uint64_t)v39;
    uint64_t v50 = v93;
    uint64_t v51 = v38;
    uint64_t v52 = v38;
    uint64_t v53 = v92;
    uint64_t v54 = v100;
    sub_1A2CE37DC(v93, v51, v49);
    uint64_t v4 = v54;
    sub_1A2CC8448(v48, v47);
    uint64_t v100 = v54;
    if (v54)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return (uint64_t)v4;
    }
    OUTLINED_FUNCTION_14_3();
    uint64_t v55 = v95;
    OUTLINED_FUNCTION_9();
    v56();
    uint64_t v76 = v53;
    sub_1A2CE3898(v44, v43, v45, v55, v50, v96);
    uint64_t result = swift_beginAccess();
    unint64_t v57 = *(void *)(v44 + 32);
    if (!v57) {
      goto LABEL_19;
    }
    uint64_t v38 = v52;
    uint64_t v58 = *(void *)(v44 + 24);
    OUTLINED_FUNCTION_14_3();
    uint64_t v59 = (uint64_t)v94;
    uint64_t v60 = v91;
    OUTLINED_FUNCTION_9();
    v61();
    __swift_storeEnumTagSinglePayload(v59, 0, 1, v60);
    uint64_t v102 = v58;
    unint64_t v103 = v57;
    sub_1A2CF38C0();
    swift_bridgeObjectRetain();
    sub_1A2CF38E0();
    OUTLINED_FUNCTION_14_3();
    OUTLINED_FUNCTION_3_0();
    v62();
    OUTLINED_FUNCTION_14_3();
    uint64_t v39 = v101;
    OUTLINED_FUNCTION_3_0();
    v63();
    uint64_t v34 = v104[0];
    uint64_t v36 = v88;
    uint64_t v40 = v90;
    uint64_t v64 = MEMORY[0x1A623EE80](v88, v90);
    uint64_t v37 = v99;
    if (v34 == v64)
    {
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
  }
  uint64_t result = sub_1A2CF3DF0();
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MKVSEntry()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A2CE34F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 80);
  uint64_t v3 = *(void *)(*(void *)a1 + 88);
  type metadata accessor for MKVSEntity();
  sub_1A2CF3B50();
  Database.read<A>(block:)();
  if (!v1) {
    return v12;
  }
  if (qword_1EB5A61F0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EB5A8268;
  sub_1A2CF3C00();
  sub_1A2CC845C();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A2CF4990;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  uint64_t v8 = v7;
  uint64_t v9 = MEMORY[0x1E4FBB1A0];
  *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v10 = sub_1A2CC84C4();
  *(void *)(v5 + 64) = v10;
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v8;
  sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
  sub_1A2CF3EF0();
  *(void *)(v5 + 96) = v9;
  *(void *)(v5 + 104) = v10;
  *(void *)(v5 + 72) = 0;
  *(void *)(v5 + 80) = 0xE000000000000000;
  sub_1A2CF3720();

  swift_bridgeObjectRelease();
  return swift_willThrow();
}

#error "1A2CE3740: call analysis failed (funcsize=52)"

void sub_1A2CE37DC(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)MEMORY[0x1A623F590]();
  sub_1A2CE6124(*(void *)(v7 + 80), a1, *(void *)(v7 + 88), a2, a3);
}

uint64_t sub_1A2CE3898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, char *a6@<X8>)
{
  *(void *)a6 = a1;
  *((void *)a6 + 1) = a2;
  *((void *)a6 + 2) = a3;
  uint64_t v9 = type metadata accessor for MKVSEntry();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(&a6[*(int *)(v9 + 60)], a4, a5);
}

uint64_t sub_1A2CE392C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v39 = a3;
  uint64_t v46 = a2;
  sub_1A2CE7610(0, &qword_1EB5A5D90, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v40 = (char *)&v37 - v15;
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v43 = a6;
  uint64_t v44 = a7;
  uint64_t v45 = a8;
  uint64_t v16 = type metadata accessor for MKVSEntry();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v38 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](TupleTypeMetadata2);
  uint64_t v20 = (char **)((char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  uint64_t v23 = (char **)((char *)&v37 - v22);
  uint64_t v25 = *a1;
  uint64_t v24 = a1[1];
  uint64_t v26 = (char *)&v37 + *(int *)(v21 + 48) - v22;
  *uint64_t v23 = v25;
  v23[1] = v24;
  uint64_t v37 = (char *)&v37 - v22;
  uint64_t v27 = *(void *)(v16 - 8);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  v28(v26, v46, v16);
  uint64_t v46 = TupleTypeMetadata2;
  uint64_t v29 = (char *)v20 + *(int *)(TupleTypeMetadata2 + 48);
  *uint64_t v20 = v25;
  v20[1] = v24;
  v28(v29, (uint64_t)v26, v16);
  uint64_t v30 = (uint64_t)v40;
  uint64_t v31 = *((void *)v29 + 1);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v27 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v32(v29, v16);
  uint64_t v33 = v31 + *(void *)(*(void *)v31 + 104);
  swift_beginAccess();
  sub_1A2CE784C(v33, v30);
  swift_release();
  uint64_t v34 = sub_1A2CF35B0();
  uint64_t result = __swift_getEnumTagSinglePayload(v30, 1, v34);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1A2CE7740(&qword_1EB5A5D88, MEMORY[0x1E4F27928]);
    char v36 = sub_1A2CF3910();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v46);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v30, v34);
    return (v36 & 1) == 0;
  }
  return result;
}

uint64_t sub_1A2CE3C7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for MKVSEntry();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1 + *(int *)(v6 + 60), a2);
}

uint64_t MixedKeyValueStore.write<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = *(void *)(v7 + 88);
  uint64_t v92 = v9;
  uint64_t v111 = v9;
  uint64_t v112 = v10;
  uint64_t v91 = v8;
  uint64_t v113 = v8;
  uint64_t v114 = v11;
  uint64_t v110 = v11;
  uint64_t v103 = v12;
  uint64_t v115 = v12;
  uint64_t v13 = type metadata accessor for MKVSEntry();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v14);
  uint64_t v89 = (char *)&v79 - v15;
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  uint64_t v19 = MEMORY[0x1F4188790](v18);
  uint64_t v88 = (char *)&v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_17_3();
  uint64_t v81 = v21;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v98 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v109 = v22;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_7_11(v24, v79);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_17_3();
  uint64_t v102 = v26;
  uint64_t v96 = sub_1A2CF35B0();
  OUTLINED_FUNCTION_0();
  uint64_t v28 = v27;
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_4_12(v30, v79);
  MEMORY[0x1F4188790](v31);
  uint64_t v33 = (char *)&v79 - v32;
  uint64_t v90 = v13;
  uint64_t v116 = sub_1A2CF3820();
  uint64_t v99 = v2;
  uint64_t v34 = *(void (**)(uint64_t))(v2 + 32);
  uint64_t v35 = swift_retain();
  uint64_t v95 = v33;
  v34(v35);
  swift_release();
  uint64_t v36 = *(void *)(a1 + 64);
  uint64_t v82 = a1 + 64;
  uint64_t v37 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v38 = -1;
  if (v37 < 64) {
    uint64_t v38 = ~(-1 << v37);
  }
  unint64_t v39 = v38 & v36;
  uint64_t v104 = v17 + 16;
  uint64_t v97 = (void (**)(uint64_t *, void *, uint64_t))(v109 + 32);
  uint64_t v93 = (void (**)(uint64_t, char *, uint64_t))(v17 + 32);
  uint64_t v80 = v28;
  uint64_t v86 = v28 + 16;
  uint64_t v84 = v17;
  uint64_t v94 = v17 + 8;
  uint64_t v40 = v81;
  int64_t v83 = (unint64_t)(v37 + 63) >> 6;
  uint64_t v79 = v83 - 1;
  uint64_t v85 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v42 = 0;
  if (!v39) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v109 = (v39 - 1) & v39;
  unint64_t v43 = __clz(__rbit64(v39)) | (v42 << 6);
  uint64_t v44 = v102;
  uint64_t v45 = v103;
  unint64_t v47 = v100;
  uint64_t v46 = TupleTypeMetadata2;
LABEL_5:
  uint64_t v48 = (void *)(*(void *)(v85 + 48) + 16 * v43);
  uint64_t v49 = v48[1];
  *unint64_t v47 = *v48;
  v47[1] = v49;
  OUTLINED_FUNCTION_9();
  v50();
  __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v46);
  swift_bridgeObjectRetain();
  while (1)
  {
    (*v97)(v44, v47, v98);
    if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v46) == 1)
    {
      uint64_t v72 = v85;
      uint64_t v73 = swift_release();
      MEMORY[0x1F4188790](v73);
      uint64_t v74 = v110;
      *(&v79 - 6) = a2;
      *(&v79 - 5) = v74;
      *(&v79 - 4) = v45;
      *(&v79 - 3) = (uint64_t)&v116;
      uint64_t v78 = v75;
      LOBYTE(v111) = 0;
      Database.write(_:block:)();
      OUTLINED_FUNCTION_3_0();
      v76();
      if (!v4) {
        swift_bridgeObjectRetain();
      }
      goto LABEL_30;
    }
    uint64_t v108 = v42;
    uint64_t v53 = *v44;
    uint64_t v54 = v44[1];
    (*v93)(v40, (char *)v44 + *(int *)(v46 + 48), a2);
    sub_1A2CE44F0(v40, a2);
    if (v4)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_0();
      v77();
      uint64_t v72 = v85;
      swift_release();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v95, v96);
LABEL_30:
      swift_bridgeObjectRelease();
      return v72;
    }
    uint64_t v57 = v55;
    unint64_t v58 = v56;
    OUTLINED_FUNCTION_14_3();
    uint64_t v59 = v53;
    uint64_t v106 = v53;
    uint64_t v60 = v87;
    OUTLINED_FUNCTION_9();
    v61();
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_1A2CE45B0(v59, v54, v57, v58, v60);
    uint64_t v105 = v63;
    uint64_t v107 = 0;
    uint64_t v65 = v64;
    uint64_t v66 = (uint64_t)v88;
    OUTLINED_FUNCTION_9();
    v67();
    uint64_t v78 = v45;
    uint64_t v68 = v89;
    uint64_t v69 = v65;
    uint64_t v4 = v107;
    sub_1A2CE3898(v62, v105, v69, v66, a2, v89);
    __swift_storeEnumTagSinglePayload((uint64_t)v68, 0, 1, v90);
    uint64_t v111 = v106;
    uint64_t v112 = v54;
    sub_1A2CF38C0();
    sub_1A2CF38E0();
    OUTLINED_FUNCTION_3_0();
    uint64_t result = v70();
    uint64_t v42 = v108;
    unint64_t v39 = v109;
    if (v109) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v51 = v42 + 1;
    uint64_t v44 = v102;
    uint64_t v45 = v103;
    if (__OFADD__(v42, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    unint64_t v47 = v100;
    uint64_t v46 = TupleTypeMetadata2;
    if (v51 < v83)
    {
      unint64_t v52 = *(void *)(v82 + 8 * v51);
      if (v52) {
        goto LABEL_9;
      }
      v42 += 2;
      if (v51 + 1 >= v83)
      {
        uint64_t v42 = v51;
        goto LABEL_14;
      }
      unint64_t v52 = *(void *)(v82 + 8 * v42);
      if (v52)
      {
        ++v51;
LABEL_9:
        uint64_t v109 = (v52 - 1) & v52;
        unint64_t v43 = __clz(__rbit64(v52)) + (v51 << 6);
        uint64_t v42 = v51;
        goto LABEL_5;
      }
      int64_t v71 = v51 + 2;
      if (v51 + 2 < v83) {
        break;
      }
    }
LABEL_14:
    __swift_storeEnumTagSinglePayload((uint64_t)v100, 1, 1, TupleTypeMetadata2);
    uint64_t v109 = 0;
  }
  unint64_t v52 = *(void *)(v82 + 8 * v71);
  if (v52)
  {
    v51 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v51 = v71 + 1;
    if (__OFADD__(v71, 1)) {
      break;
    }
    if (v51 >= v83)
    {
      uint64_t v42 = v79;
      goto LABEL_14;
    }
    unint64_t v52 = *(void *)(v82 + 8 * v51);
    ++v71;
    if (v52) {
      goto LABEL_9;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

void sub_1A2CE44F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x1A623F590]();
  sub_1A2CE5F24(a1, a2, &v5);
}

uint64_t sub_1A2CE45B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  v27[1] = a1;
  uint64_t v28 = (void (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1A2CE7610(0, &qword_1EB5A5D90, MEMORY[0x1E4F27928]);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v27 - v9;
  sub_1A2CE7610(0, &qword_1EB5A5E38, sub_1A2CC8120);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)v27 - v15;
  sub_1A2CC8204();
  swift_allocObject();
  sub_1A2CB49D8();
  uint64_t v18 = v17;
  sub_1A2CC8120(0);
  uint64_t v20 = v19;
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v20);
  sub_1A2CE7664(0, qword_1EB5A5E48, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  swift_retain();
  sub_1A2CE2310();
  uint64_t v22 = v21;
  sub_1A2CC8258();
  swift_allocObject();
  swift_retain();
  sub_1A2CE22B0();
  swift_retain();
  sub_1A2CE12B4();
  swift_release();
  uint64_t v23 = sub_1A2CF35B0();
  uint64_t v24 = *(void *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v10, a5, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v23);
  uint64_t v25 = v22 + *(void *)(*(void *)v22 + 104);
  swift_beginAccess();
  sub_1A2CE77E8((uint64_t)v10, v25, &qword_1EB5A5D90, v28);
  swift_endAccess();
  swift_release();
  sub_1A2CBF7CC(a3, a4);
  sub_1A2CE12F0();
  sub_1A2CB2EAC(a3, a4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a5, v23);
  return v18;
}

uint64_t sub_1A2CE493C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *(void *)(*a2 + 80);
  int64_t v51 = a2;
  uint64_t v8 = *(void *)(v6 + 88);
  uint64_t v57 = v7;
  uint64_t v58 = a3;
  uint64_t v59 = v8;
  uint64_t v60 = a4;
  uint64_t v61 = a5;
  uint64_t v9 = type metadata accessor for MKVSEntry();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v42 - v11;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v54 = sub_1A2CF3D40();
  uint64_t v14 = MEMORY[0x1F4188790](v54);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = *a1;
  uint64_t v21 = v12;
  uint64_t v22 = *(void *)(v20 + 64);
  uint64_t v44 = v20 + 64;
  uint64_t v23 = 1 << *(unsigned char *)(v20 + 32);
  uint64_t v24 = -1;
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  unint64_t v25 = v24 & v22;
  int64_t v45 = (unint64_t)(v23 + 63) >> 6;
  uint64_t v46 = v10 + 16;
  uint64_t v49 = v20;
  uint64_t v50 = (void (**)(void *, char *, uint64_t))(v10 + 32);
  uint64_t v48 = v10;
  unint64_t v52 = (void (**)(void *, uint64_t))(v10 + 8);
  uint64_t v53 = (void (**)(char *, char *, uint64_t))(v17 + 32);
  int64_t v43 = v45 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v27 = 0;
  unint64_t v47 = v21;
  if (!v25) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v28 = __clz(__rbit64(v25));
  uint64_t v29 = (v25 - 1) & v25;
  unint64_t v30 = v28 | (v27 << 6);
LABEL_5:
  uint64_t v31 = *(void *)(v49 + 56);
  uint64_t v32 = (void *)(*(void *)(v49 + 48) + 16 * v30);
  uint64_t v33 = v32[1];
  *(void *)uint64_t v16 = *v32;
  *((void *)v16 + 1) = v33;
  (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(&v16[*(int *)(TupleTypeMetadata2 + 48)], v31 + *(void *)(v48 + 72) * v30, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, TupleTypeMetadata2);
  swift_bridgeObjectRetain();
  uint64_t v21 = v47;
  while (1)
  {
    (*v53)(v19, v16, v54);
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, TupleTypeMetadata2) == 1) {
      return swift_release();
    }
    unint64_t v55 = v29;
    int64_t v56 = v27;
    swift_bridgeObjectRelease();
    uint64_t v36 = v19;
    (*v50)(v21, &v19[*(int *)(TupleTypeMetadata2 + 48)], v9);
    sub_1A2CED4D4();
    uint64_t v37 = v21[1];
    uint64_t v38 = v9;
    uint64_t v39 = v21[2];
    uint64_t v57 = *v21;
    uint64_t v58 = v37;
    uint64_t v59 = v39;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v40 = v62;
    sub_1A2CDC544((uint64_t)&v57);
    uint64_t v62 = v40;
    if (v40)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*v52)(v21, v38);
      return swift_release();
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = ((uint64_t (*)(void *, uint64_t))*v52)(v21, v38);
    uint64_t v9 = v38;
    uint64_t v19 = v36;
    unint64_t v25 = v55;
    int64_t v27 = v56;
    if (v55) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v34 = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v34 < v45)
    {
      unint64_t v35 = *(void *)(v44 + 8 * v34);
      if (v35) {
        goto LABEL_9;
      }
      v27 += 2;
      if (v34 + 1 >= v45)
      {
        int64_t v27 = v34;
        goto LABEL_14;
      }
      unint64_t v35 = *(void *)(v44 + 8 * v27);
      if (v35)
      {
        ++v34;
LABEL_9:
        uint64_t v29 = (v35 - 1) & v35;
        unint64_t v30 = __clz(__rbit64(v35)) + (v34 << 6);
        int64_t v27 = v34;
        goto LABEL_5;
      }
      int64_t v41 = v34 + 2;
      if (v34 + 2 < v45) {
        break;
      }
    }
LABEL_14:
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, TupleTypeMetadata2);
    uint64_t v29 = 0;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v41);
  if (v35)
  {
    v34 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v34 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v34 >= v45)
    {
      int64_t v27 = v43;
      goto LABEL_14;
    }
    unint64_t v35 = *(void *)(v44 + 8 * v34);
    ++v41;
    if (v35) {
      goto LABEL_9;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t MixedKeyValueStore.delete(_:)(uint64_t a1)
{
  Database.write(_:block:)();
  if (!v1) {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A2CE4E84(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    while (1)
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      sub_1A2CED57C();
      swift_bridgeObjectRetain();
      sub_1A2CDC12C(v5, v4);
      if (v1) {
        break;
      }
      v3 += 2;
      swift_bridgeObjectRelease();
      swift_release();
      if (!--v2) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t MixedKeyValueStore.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1A2CB4E54(0, (unint64_t *)&qword_1EB5A6930, MEMORY[0x1E4FBBE00]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A2CF49A0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  MixedKeyValueStore.read<A>(_:maxAge:)(inited, a3, a4, a5);
  swift_setDeallocating();
  sub_1A2CE6EDC();
  sub_1A2CF3890();
  swift_bridgeObjectRelease();
  sub_1A2CF3870();
  swift_getWitnessTable();
  sub_1A2CF3BC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CE50C8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return MixedKeyValueStore.subscript.getter(*a2, a2[1], *(uint64_t *)((char *)a2 + a3 - 32), *(uint64_t *)((char *)a2 + a3 - 16), *(uint64_t *)((char *)a2 + a3 - 8));
}

uint64_t sub_1A2CE50FC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *(uint64_t *)((char *)a3 + a4 - 32);
  uint64_t v7 = *(uint64_t *)((char *)a3 + a4 - 16);
  uint64_t v8 = *(uint64_t *)((char *)a3 + a4 - 8);
  uint64_t v9 = sub_1A2CF3D40();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v16 - v10;
  uint64_t v13 = *a3;
  uint64_t v12 = a3[1];
  (*(void (**)(char *, uint64_t))(v14 + 16))((char *)&v16 - v10, a1);
  swift_bridgeObjectRetain();
  return MixedKeyValueStore.subscript.setter((uint64_t)v11, v13, v12, v6, v7, v8);
}

uint64_t MixedKeyValueStore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v30[1] = a5;
  long long v30[2] = a6;
  uint64_t v10 = sub_1A2CF3D40();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v30 - v14;
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, v10);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, a4) == 1)
  {
    uint64_t v21 = *(void (**)(void))(v12 + 8);
    OUTLINED_FUNCTION_2_5();
    v21();
    sub_1A2CB4E54(0, (unint64_t *)&qword_1EB5A6930, MEMORY[0x1E4FBBE00]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A2CF49A0;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = a3;
    MixedKeyValueStore.delete(_:)(inited);
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_2_5();
    return ((uint64_t (*)(void))v21)();
  }
  else
  {
    v30[0] = a1;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v20, v15, a4);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    sub_1A2CF4050();
    swift_allocObject();
    uint64_t v24 = sub_1A2CF3AE0();
    uint64_t v26 = (char *)v25 + *(int *)(TupleTypeMetadata2 + 48);
    void *v25 = a2;
    v25[1] = a3;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v26, v20, a4);
    sub_1A2CC0814(v24);
    uint64_t v27 = sub_1A2CF3850();
    MixedKeyValueStore.write<A>(_:)(v27, a4);
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_2_5();
    v29();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, a4);
  }
}

void (*MixedKeyValueStore.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t **a1, char a2)
{
  uint64_t v13 = malloc(0x50uLL);
  *a1 = v13;
  void v13[4] = a6;
  void v13[5] = v6;
  long long v13[2] = a4;
  v13[3] = a5;
  *uint64_t v13 = a2;
  v13[1] = a3;
  uint64_t v14 = sub_1A2CF3D40();
  v13[6] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v13[7] = v15;
  size_t v16 = *(void *)(v15 + 64);
  v13[8] = malloc(v16);
  v13[9] = malloc(v16);
  MixedKeyValueStore.subscript.getter(a2, a3, a4, a5, a6);
  return sub_1A2CE5630;
}

void sub_1A2CE5630(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[8];
  uint64_t v4 = (void *)(*a1)[9];
  if (a2)
  {
    uint64_t v5 = v2[6];
    uint64_t v6 = v2[7];
    uint64_t v7 = v2[4];
    uint64_t v9 = v2[2];
    uint64_t v8 = v2[3];
    uint64_t v11 = *v2;
    uint64_t v10 = v2[1];
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v3, v4, v5);
    swift_bridgeObjectRetain();
    MixedKeyValueStore.subscript.setter((uint64_t)v3, v11, v10, v9, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    uint64_t v12 = v2[4];
    uint64_t v14 = v2[2];
    uint64_t v13 = v2[3];
    uint64_t v16 = *v2;
    uint64_t v15 = v2[1];
    swift_bridgeObjectRetain();
    MixedKeyValueStore.subscript.setter((uint64_t)v4, v16, v15, v14, v13, v12);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t MixedKeyValueStore.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MixedKeyValueStore.read<A>(_:maxAge:)(a1, a2, a3, a4);
}

uint64_t static MixedKeyValueStore.+= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MixedKeyValueStore.write<A>(_:)(a2, a3);
  return swift_bridgeObjectRelease();
}

uint64_t MixedKeyValueStore.Promises.allKeys()()
{
  return sub_1A2CF36F0();
}

uint64_t sub_1A2CE58E0(void (*a1)(uint64_t *))
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = MixedKeyValueStore.allKeys()();
    swift_release();
    uint64_t v4 = v3;
    a1(&v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MixedKeyValueStore.Promises.read<A>(_:maxAge:)()
{
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CE5A54(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v15 = MixedKeyValueStore.read<A>(_:maxAge:)(a6, a8, a10, a11);
    swift_release();
    uint64_t v16 = v15;
    a1(&v16);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MixedKeyValueStore.Promises.write<A>(_:)()
{
  return sub_1A2CF36E0();
}

uint64_t sub_1A2CE5BF8(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    MixedKeyValueStore.write<A>(_:)(a6, a8);
    swift_release();
    uint64_t v12 = a6;
    a1(&v12);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MixedKeyValueStore.Promises.delete(_:)()
{
  return sub_1A2CF36F0();
}

uint64_t sub_1A2CE5D64(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    MixedKeyValueStore.delete(_:)(a6);
    swift_release();
    uint64_t v9 = a6;
    a1(&v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MixedKeyValueStore.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  type metadata accessor for MixedKeyValueStore.Promises();
  sub_1A2CF3D40();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v1();
  return v0;
}

uint64_t MixedKeyValueStore.__deallocating_deinit()
{
  MixedKeyValueStore.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CE5F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  sub_1A2CF4050();
  swift_allocObject();
  uint64_t v8 = sub_1A2CF3AE0();
  uint64_t v10 = (char *)v9 + *(int *)(TupleTypeMetadata2 + 48);
  *uint64_t v9 = 118;
  v9[1] = 0xE100000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v10, a1, a2);
  sub_1A2CC0814(v8);
  sub_1A2CF3850();
  sub_1A2CF3420();
  swift_allocObject();
  sub_1A2CF3410();
  sub_1A2CF38C0();
  swift_getWitnessTable();
  uint64_t v11 = sub_1A2CF3400();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (!v3)
  {
    *a3 = v11;
    a3[1] = v13;
  }
  return result;
}

uint64_t sub_1A2CE6124@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  void v19[5] = a3;
  uint64_t v17 = a5;
  uint64_t v18 = a1;
  uint64_t v8 = sub_1A2CF3D40();
  uint64_t v16 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v15 - v9;
  sub_1A2CF3610();
  swift_allocObject();
  sub_1A2CF3600();
  sub_1A2CF38C0();
  void v19[2] = MEMORY[0x1E4FBB1D8];
  v19[3] = a4;
  swift_getWitnessTable();
  sub_1A2CF35F0();
  uint64_t result = swift_release();
  if (!v5)
  {
    uint64_t v13 = v16;
    uint64_t v12 = v17;
    uint64_t v14 = v19[0];
    v19[0] = 118;
    v19[1] = 0xE100000000000000;
    MEMORY[0x1A623EC20](v19, v14, MEMORY[0x1E4FBB1A0], a2, MEMORY[0x1E4FBB1B0]);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v8);
      type metadata accessor for MixedKeyValueStore.TranslationError();
      swift_getWitnessTable();
      swift_allocError();
      return swift_willThrow();
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a2 - 8) + 32))(v12, v10, a2);
    }
  }
  return result;
}

uint64_t sub_1A2CE6398()
{
  sub_1A2CE7610(0, &qword_1EB5A5E38, sub_1A2CC8120);
  uint64_t v1 = MEMORY[0x1F4188790](v0 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v11 - v4;
  sub_1A2CC8204();
  swift_allocObject();
  sub_1A2CB49D8();
  uint64_t v7 = v6;
  sub_1A2CC8120(0);
  uint64_t v9 = v8;
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v9);
  sub_1A2CE7664(0, qword_1EB5A5E48, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A2CE2310();
  sub_1A2CC8258();
  swift_allocObject();
  sub_1A2CE22B0();
  return v7;
}

uint64_t sub_1A2CE6568(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a3;
  uint64_t v13 = a4;
  type metadata accessor for MKVSEntity.CodingKeys();
  swift_getWitnessTable();
  uint64_t v6 = sub_1A2CF4030();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41B0();
  uint64_t v17 = a2;
  char v16 = 0;
  sub_1A2CC8204();
  sub_1A2CE7740(&qword_1E959EBD8, (void (*)(uint64_t))sub_1A2CC8204);
  uint64_t v10 = v15;
  sub_1A2CF4020();
  if (!v10)
  {
    uint64_t v11 = v13;
    uint64_t v17 = v14;
    char v16 = 1;
    sub_1A2CE7664(0, qword_1EB5A5E48, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    sub_1A2CE7788(&qword_1E959EBE0);
    sub_1A2CF4020();
    uint64_t v17 = v11;
    char v16 = 2;
    sub_1A2CC8258();
    sub_1A2CE7740(&qword_1E959EBE8, (void (*)(uint64_t))sub_1A2CC8258);
    sub_1A2CF4020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1A2CE681C(uint64_t a1)
{
  type metadata accessor for MKVSEntity.CodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v24 = sub_1A2CF3FD0();
  uint64_t v23 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  uint64_t v3 = (char *)&v23 - v2;
  sub_1A2CE7610(0, &qword_1EB5A5E38, sub_1A2CC8120);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v23 - v8;
  sub_1A2CC8204();
  swift_initStackObject();
  sub_1A2CB49D8();
  uint64_t v27 = v10;
  sub_1A2CC8120(0);
  uint64_t v12 = v11;
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v12);
  sub_1A2CE7664(0, qword_1EB5A5E48, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A2CE2310();
  uint64_t v28 = v13;
  sub_1A2CC8258();
  swift_initStackObject();
  sub_1A2CE22B0();
  uint64_t v26 = v14;
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v25 = a1;
  char v16 = (void *)a1;
  uint64_t v17 = v3;
  __swift_project_boxed_opaque_existential_1(v16, v15);
  uint64_t v18 = v30;
  sub_1A2CF4190();
  if (v18)
  {
    uint64_t v22 = v27;
  }
  else
  {
    uint64_t v19 = v23;
    char v31 = 0;
    sub_1A2CE7740(&qword_1E959EBC0, (void (*)(uint64_t))sub_1A2CC8204);
    uint64_t v20 = v24;
    sub_1A2CF3FC0();
    swift_release();
    uint64_t v22 = v32;
    char v31 = 1;
    sub_1A2CE7788(&qword_1E959EBC8);
    swift_retain();
    sub_1A2CF3FC0();
    swift_release();
    char v31 = 2;
    sub_1A2CE7740(&qword_1E959EBD0, (void (*)(uint64_t))sub_1A2CC8258);
    swift_retain();
    sub_1A2CF3FC0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v20);
    swift_retain();
  }
  __swift_destroy_boxed_opaque_existential_1(v25);
  swift_release();
  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_1A2CE6DA0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A2CE6DF4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t sub_1A2CE6E48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A2CE6398();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_1A2CE6E7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1A2CE681C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_1A2CE6EB4(void *a1)
{
  return sub_1A2CE6568(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_1A2CE6EDC()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CE6F20(uint64_t *a1, uint64_t a2)
{
  return sub_1A2CE392C(a1, a2, v2[7], v2[2], v2[3], v2[4], v2[5], v2[6]) & 1;
}

uint64_t sub_1A2CE6F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A2CE3C7C(a1, *(void *)(v2 + 24), a2);
}

uint64_t sub_1A2CE6F6C()
{
  return sub_1A2CE493C(*(uint64_t **)(v0 + 40), *(uint64_t **)(v0 + 48), *(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1A2CE6F90()
{
  return sub_1A2CE4E84(*(void *)(v0 + 16));
}

uint64_t sub_1A2CE6FAC(void (*a1)(uint64_t *))
{
  return sub_1A2CE58E0(a1);
}

uint64_t sub_1A2CE6FB8(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CE5A54(a1, a2, a3, a4, v4[7], v4[8], v4[2], v4[3], v4[4], v4[5], v4[6]);
}

uint64_t sub_1A2CE6FF4(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CE5BF8(a1, a2, a3, a4, v4[7], v4[8], v4[2], v4[3]);
}

uint64_t sub_1A2CE702C(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A2CE5D64(a1, a2, a3, a4, *(void *)(v4 + 32), *(void *)(v4 + 40));
}

uint64_t sub_1A2CE7040()
{
  return 40;
}

__n128 sub_1A2CE704C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_1A2CE7060()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MixedKeyValueStore()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for MixedKeyValueStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MixedKeyValueStore);
}

uint64_t dispatch thunk of MixedKeyValueStore.__allocating_init(database:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1A2CE7118()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A2CE71B4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v7 + 24) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v7 + 24) & ~v7, v6, v4);
      }
      uint64_t v16 = *(void *)a1;
      if (*(void *)a1 >= 0xFFFFFFFFuLL) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void sub_1A2CE7344(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((v10 + 24) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x1A2CE7590);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v21 = (unint64_t)&a1[v10 + 24] & ~v10;
          __swift_storeEnumTagSinglePayload(v21, a2, v8, v6);
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v20 = a2 ^ 0x80000000;
            *((void *)a1 + 1) = 0;
            *((void *)a1 + 2) = 0;
          }
          else
          {
            uint64_t v20 = (a2 - 1);
          }
          *(void *)a1 = v20;
        }
      }
      return;
  }
}

uint64_t sub_1A2CE75B8(uint64_t a1)
{
  return sub_1A2CC80D4(a1);
}

uint64_t sub_1A2CE75E4(uint64_t a1)
{
  return sub_1A2CC80D4(a1);
}

void sub_1A2CE7610(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1A2CF3D40();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1A2CE7664(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_1A2CF35B0();
    uint64_t v7 = sub_1A2CE7740((unint64_t *)&unk_1EB5A5D78, MEMORY[0x1E4F27928]);
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1A2CE7700(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_1A2CE7718(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_1A2CE7718(uint64_t a1, unint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return sub_1A2CB2EAC(a1, a2);
  }
}

uint64_t type metadata accessor for MKVSEntity.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CE7740(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A2CE7788(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1A2CE7664(255, qword_1EB5A5E48, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A2CE77E8(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_1A2CE7610(0, a3, a4);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(a2, a1);
  return a2;
}

uint64_t sub_1A2CE784C(uint64_t a1, uint64_t a2)
{
  sub_1A2CE7610(0, &qword_1EB5A5D90, MEMORY[0x1E4F27928]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for MixedKeyValueStore.TranslationError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1A2CE78E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1A2CBF7CC(a1, a2);
  }
  return a1;
}

uint64_t sub_1A2CE78F8()
{
  return sub_1A2CE3708(v0[5], v0[6], v0[2], v0[3], v0[4]);
}

uint64_t sub_1A2CE791C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1A2CE795C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A2CE7984@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_1A2CC0DAC(a1, a2);
}

uint64_t sub_1A2CE79A4()
{
  return sub_1A2CE28F0();
}

unsigned char *sub_1A2CE79C0(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A2CE7A5CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unsigned char *sub_1A2CE7A84(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x1A2CE7B50);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1A2CE7B78()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CE7B94()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CE7BB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CE7BCC()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CE7C00()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A2CE7C30()
{
  return sub_1A2CE7C00();
}

uint64_t Int.queryValue.getter()
{
  return sub_1A2CF4040();
}

void static Int.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t Int.init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  if (*((unsigned char *)a1 + 16) == 1)
  {
    uint64_t v2 = *a1;
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v2;
  }
  else
  {
    uint64_t result = sub_1A2CF3F30();
    __break(1u);
  }
  return result;
}

uint64_t Int.valueType.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_1A2CE7D40@<X0>(uint64_t a1@<X8>)
{
  return Int.valueType.getter(*v1, a1);
}

uint64_t sub_1A2CE7D48@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = Int.init(valueType:connection:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A2CE7D70()
{
  return Int.queryValue.getter();
}

uint64_t sub_1A2CE7D78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](a1);
  unsigned int v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(void))(*(void *)(v5 + 8) + 8))();
  uint64_t v6 = sub_1A2CB32CC(a1);
  uint64_t v7 = sub_1A2CB4AF0(v6);
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, a1);
  return v7;
}

uint64_t sub_1A2CE7E88(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  OUTLINED_FUNCTION_2_11();
  uint64_t v4 = *(void *)(v1 + 32);
  a1[3] = type metadata accessor for Column();
  a1[4] = &off_1EF5E0730;
  *a1 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return v3;
}

void *FastColumn.__allocating_init(wrappedValue:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3_12();
  uint64_t result = (void *)swift_allocObject();
  result[3] = a3;
  result[4] = a1;
  result[2] = a2;
  return result;
}

uint64_t FastColumn.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FastColumn.wrappedValue.getter()
{
  return swift_retain();
}

uint64_t FastColumn.wrappedValue.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_release();
}

uint64_t (*FastColumn.wrappedValue.modify())()
{
  return j__swift_endAccess;
}

uint64_t FastColumn.projectedValue.getter()
{
  return swift_retain();
}

void *FastColumn.init(wrappedValue:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a3;
  v3[4] = a1;
  v3[2] = a2;
  return v3;
}

uint64_t sub_1A2CE8074(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A2CF4080() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5664657070617277 && a2 == 0xEC00000065756C61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A2CF4080();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A2CE816C(char a1)
{
  if (a1) {
    return 0x5664657070617277;
  }
  else {
    return 1701667182;
  }
}

BOOL sub_1A2CE81A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A2CE1544(*a1, *a2);
}

uint64_t sub_1A2CE81B8()
{
  return sub_1A2CE165C();
}

uint64_t sub_1A2CE81C8()
{
  return sub_1A2CE1554();
}

uint64_t sub_1A2CE81D8()
{
  return sub_1A2CF4140();
}

uint64_t sub_1A2CE8220()
{
  return sub_1A2CE816C(*v0);
}

uint64_t sub_1A2CE8230@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2CE8074(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A2CE8260()
{
  return sub_1A2CC6664();
}

uint64_t sub_1A2CE8288@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1A2CE1654();
  *a1 = result;
  return result;
}

uint64_t sub_1A2CE82B8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A2CE830C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t FastColumn.encode(to:)(void *a1)
{
  BOOL v2 = v1;
  uint64_t v4 = *(void *)(*v2 + 80);
  v13[1] = *(void *)(*v2 + 88);
  long long v13[2] = v4;
  type metadata accessor for FastColumn.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_1A2CF4030();
  OUTLINED_FUNCTION_1_2();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v13 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41B0();
  char v15 = 0;
  uint64_t v11 = v13[3];
  sub_1A2CF3FE0();
  if (!v11)
  {
    swift_beginAccess();
    uint64_t v16 = v2[4];
    char v14 = 1;
    type metadata accessor for Column();
    swift_getWitnessTable();
    sub_1A2CF4020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
}

uint64_t type metadata accessor for FastColumn.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t FastColumn.__allocating_init(from:)(void *a1)
{
  OUTLINED_FUNCTION_3_12();
  uint64_t v2 = swift_allocObject();
  FastColumn.init(from:)(a1);
  return v2;
}

void *FastColumn.init(from:)(void *a1)
{
  type metadata accessor for FastColumn.CodingKeys();
  swift_getWitnessTable();
  sub_1A2CF3FD0();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF4190();
  if (v2)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    v1[2] = sub_1A2CF3F80();
    v1[3] = v5;
    type metadata accessor for Column();
    swift_getWitnessTable();
    sub_1A2CF3FC0();
    uint64_t v7 = OUTLINED_FUNCTION_1_16();
    v8(v7);
    v1[4] = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_1A2CE87F0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = FastColumn.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A2CE881C(void *a1)
{
  return FastColumn.encode(to:)(a1);
}

uint64_t FastColumn.description.getter()
{
  OUTLINED_FUNCTION_2_11();
  swift_retain();
  uint64_t v0 = Column.description.getter();
  swift_release();
  return v0;
}

uint64_t sub_1A2CE8898()
{
  return FastColumn.description.getter();
}

uint64_t method lookup function for FastColumn(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FastColumn);
}

uint64_t dispatch thunk of FastColumn.__allocating_init(wrappedValue:name:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FastColumn.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unsigned char *sub_1A2CE8910(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A2CE89DCLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1A2CE8A04()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CE8A20()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CE8A3C()
{
  return swift_getWitnessTable();
}

uint64_t Transaction.rawValue.getter()
{
  uint64_t v1 = 0x54414944454D4D49;
  if (*v0 != 1) {
    uint64_t v1 = 0x564953554C435845;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4445525245464544;
  }
}

TeaDB::Transaction_optional __swiftcall Transaction.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1A2CF3F70();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_1A2CE8B18(char *a1, char *a2)
{
  return sub_1A2CCEAFC(*a1, *a2);
}

unint64_t sub_1A2CE8B28()
{
  unint64_t result = qword_1E959F2A8[0];
  if (!qword_1E959F2A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E959F2A8);
  }
  return result;
}

uint64_t sub_1A2CE8B74()
{
  return sub_1A2CCD5B0(*v0);
}

uint64_t sub_1A2CE8B7C(uint64_t a1)
{
  return sub_1A2CCD694(a1, *v1);
}

uint64_t sub_1A2CE8B84(uint64_t a1)
{
  return sub_1A2CCD720(a1, *v1);
}

TeaDB::Transaction_optional sub_1A2CE8B8C(Swift::String *a1)
{
  return Transaction.init(rawValue:)(*a1);
}

uint64_t sub_1A2CE8B98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Transaction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *storeEnumTagSinglePayload for Transaction(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x1A2CE8C8CLL);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Transaction()
{
  return &type metadata for Transaction;
}

uint64_t LazyEntity.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LazyEntity.loader.getter()
{
  return swift_retain();
}

uint64_t LazyEntity.loaderValue.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  LazyLoader.load()(a1);
  uint64_t v4 = *(void *)(v3 + 80);
  return __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v4);
}

uint64_t LazyEntity.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  LazyEntity.init(value:)(a1);
  return v2;
}

uint64_t LazyEntity.init(value:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v7 = (char *)&v14 - v6;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, void))(*(void *)(v8 + 88) + 24))(v4, *(void *)(v8 + 88));
  swift_beginAccess();
  uint64_t v11 = *(void *)(v9 + 24);
  uint64_t v10 = *(void *)(v9 + 32);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  if (v10)
  {
    v2[2] = v11;
    v2[3] = v10;
    type metadata accessor for LazyLoader();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v13 = LazyLoader.__allocating_init(object:)((uint64_t)v7);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    v2[4] = v13;
    return (uint64_t)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void static LazyEntity.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t LazyEntity.__allocating_init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  LazyEntity.init(valueType:connection:)(a1, a2);
  return v4;
}

uint64_t LazyEntity.init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (*((unsigned char *)a1 + 16))
  {
    uint64_t result = sub_1A2CF3F30();
    __break(1u);
  }
  else
  {
    uint64_t v4 = v2;
    uint64_t v7 = *a1;
    uint64_t v6 = a1[1];
    v4[2] = *a1;
    v4[3] = v6;
    uint64_t v8 = *(void *)(v3 + 80);
    uint64_t v9 = *(void *)(v3 + 88);
    type metadata accessor for LazyLoader();
    sub_1A2CB37E4(a2, (uint64_t)v13);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v8;
    v10[3] = v9;
    v10[4] = v7;
    v10[5] = v6;
    sub_1A2CB377C(v13, (uint64_t)(v10 + 6));
    swift_bridgeObjectRetain();
    uint64_t v11 = LazyLoader.__allocating_init(block:)((uint64_t)sub_1A2CE94C0, (uint64_t)v10);
    __swift_destroy_boxed_opaque_existential_1(a2);
    v4[4] = v11;
    return (uint64_t)v4;
  }
  return result;
}

uint64_t sub_1A2CE911C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v31 = a6;
  uint64_t v33 = sub_1A2CF3D40();
  uint64_t v11 = *(void *)(v33 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v33);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v30 - v15;
  uint64_t v17 = *(void *)(a5 + 8);
  type metadata accessor for Statement();
  char v39 = 4;
  uint64_t v37 = MEMORY[0x1E4FBB1A0];
  uint64_t v38 = &protocol witness table for String;
  *(void *)&long long v35 = a1;
  *((void *)&v35 + 1) = a2;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 25705;
  *(void *)(v18 + 24) = 0xE200000000000000;
  sub_1A2CB37E4((uint64_t)&v35, v18 + 32);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
  uint64_t v34 = v18;
  long long v35 = 0uLL;
  char v36 = -1;
  sub_1A2CBE824(&v34, (uint64_t)&v35, 1, 0, a4, v17);
  swift_release();
  uint64_t v19 = sub_1A2CBE7DC();
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(a3, (uint64_t)&v35);
  uint64_t v22 = sub_1A2CAEF50(&v39, v19, v21, &v35);
  uint64_t v23 = v32;
  uint64_t v24 = sub_1A2CB0EB0(v22);
  if (v23)
  {

    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, a4);
  }
  else
  {
    uint64_t v25 = v24;
    swift_release();
    *(void *)&long long v35 = v25;
    sub_1A2CF3B50();
    swift_getWitnessTable();
    sub_1A2CF3BC0();
    swift_bridgeObjectRelease();
  }
  uint64_t v26 = v33;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v33);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, a4);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v11 + 8);
  if (EnumTagSinglePayload == 1)
  {
    v28(v14, v26);
    sub_1A2CEA230();
    swift_allocError();
    swift_willThrow();
    return ((uint64_t (*)(char *, uint64_t))v28)(v16, v26);
  }
  else
  {
    v28(v16, v26);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a4 - 8) + 32))(v31, v14, a4);
  }
}

uint64_t sub_1A2CE9480()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t sub_1A2CE94C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1A2CE911C(v1[4], v1[5], (uint64_t)(v1 + 6), v1[2], v1[3], a1);
}

uint64_t LazyEntity.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2CE94F4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1A2CF4080() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726564616F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1A2CF4080();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1A2CE95E8(char a1)
{
  if (a1) {
    return 0x726564616F6CLL;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_1A2CE9620()
{
  return sub_1A2CE95E8(*v0);
}

uint64_t sub_1A2CE9630@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2CE94F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A2CE9660(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A2CE96B4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t LazyEntity.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t LazyEntity.__deallocating_deinit()
{
  LazyEntity.deinit();
  return swift_deallocClassInstance();
}

uint64_t LazyEntity.encode(to:)(void *a1)
{
  BOOL v2 = v1;
  uint64_t v4 = *(void *)(*v2 + 80);
  v13[0] = *(void *)(*v2 + 88);
  v13[1] = v4;
  type metadata accessor for LazyEntity.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_1A2CF4030();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)v13 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41B0();
  char v15 = 0;
  uint64_t v11 = v13[2];
  sub_1A2CF3FE0();
  if (!v11)
  {
    v13[3] = v2[4];
    char v14 = 1;
    type metadata accessor for LazyLoader();
    swift_getWitnessTable();
    sub_1A2CF4020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
}

uint64_t type metadata accessor for LazyEntity.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t LazyEntity.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  LazyEntity.init(from:)(a1);
  return v2;
}

void *LazyEntity.init(from:)(void *a1)
{
  OUTLINED_FUNCTION_1_6();
  type metadata accessor for LazyEntity.CodingKeys();
  swift_getWitnessTable();
  sub_1A2CF3FD0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x1F4188790](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF4190();
  if (v2)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    v1[2] = sub_1A2CF3F80();
    v1[3] = v5;
    type metadata accessor for LazyLoader();
    swift_getWitnessTable();
    sub_1A2CF3FC0();
    uint64_t v7 = OUTLINED_FUNCTION_1_16();
    v8(v7);
    v1[4] = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

void sub_1A2CE9BD4(unsigned char *a1@<X8>)
{
}

uint64_t sub_1A2CE9BEC@<X0>(uint64_t a1@<X8>)
{
  return LazyEntity.valueType.getter(a1);
}

uint64_t sub_1A2CE9C10@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = LazyEntity.__allocating_init(valueType:connection:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A2CE9C38@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = LazyEntity.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A2CE9C64(void *a1)
{
  return LazyEntity.encode(to:)(a1);
}

uint64_t sub_1A2CE9C88(uint64_t a1)
{
  return LazyEntity.saveChain(for:)(a1);
}

uint64_t LazyEntity.saveChain(for:)(uint64_t a1)
{
  OUTLINED_FUNCTION_1_6();
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v13 - v9;
  LazyLoader.load()((char *)&v13 - v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)(v3 + 88) + 16) + 24) + 8))(a1, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  return v11;
}

uint64_t static LazyEntity.createTableChain(for:ifNotExists:)()
{
  OUTLINED_FUNCTION_3_13();
  return v0();
}

uint64_t static LazyEntity.createTableChain(for:ifNotExists:shouldVersion:)()
{
  OUTLINED_FUNCTION_3_13();
  return v0();
}

uint64_t sub_1A2CE9F78(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A2CE9FD8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LazyEntity()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LazyEntity(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LazyEntity);
}

uint64_t dispatch thunk of LazyEntity.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of LazyEntity.__allocating_init(valueType:connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LazyEntity.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unsigned char *sub_1A2CEA0A8(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A2CEA174);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1A2CEA19C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CEA1B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CEA1D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CEA1F0()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x1F4186498](v0, 72, 7);
}

unint64_t sub_1A2CEA230()
{
  unint64_t result = qword_1EB5A58F0[0];
  if (!qword_1EB5A58F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB5A58F0);
  }
  return result;
}

uint64_t sub_1A2CEA27C()
{
  uint64_t v2 = v0 + 16;
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  OUTLINED_FUNCTION_3_14();
  type metadata accessor for Statement();
  char v16 = 4;
  sub_1A2CE7D78(v3);
  uint64_t v15 = 0xF000000000000007;
  long long v13 = 0uLL;
  char v14 = -1;
  OUTLINED_FUNCTION_3_14();
  uint64_t v5 = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_3_14();
  sub_1A2CDF6F8(v7, &v15, (uint64_t)&v13, 0, 1, v5, *(void *)(v6 + 96));
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_1A2CBE7DC();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v2, (uint64_t)&v13);
  uint64_t v11 = sub_1A2CAEF50(&v16, v8, v10, &v13);
  sub_1A2CB0EB0(v11);
  OUTLINED_FUNCTION_1_5();
  return v1;
}

uint64_t sub_1A2CEA3D0(uint64_t *a1)
{
  uint64_t v2 = (uint64_t)(v1 + 2);
  uint64_t v3 = *v1;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  char v6 = *((unsigned char *)a1 + 16);
  uint64_t v7 = *(void *)(*v1 + 88);
  type metadata accessor for Statement();
  char v17 = 4;
  uint64_t v8 = sub_1A2CE7D78(v7);
  uint64_t v16 = 0xF000000000000007;
  *(void *)&long long v14 = v4;
  *((void *)&v14 + 1) = v5;
  char v15 = v6;
  sub_1A2CDF540();
  sub_1A2CDF6F8(v8, &v16, (uint64_t)&v14, 0, 1, *(void *)(v3 + 80), *(void *)(v3 + 96));
  swift_bridgeObjectRelease();
  sub_1A2CDF55C();
  uint64_t v9 = sub_1A2CBE7DC();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v2, (uint64_t)&v14);
  uint64_t v12 = sub_1A2CAEF50(&v17, v9, v11, &v14);
  sub_1A2CB0EB0(v12);
  OUTLINED_FUNCTION_1_5();
  return v9;
}

uint64_t sub_1A2CEA560(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = (uint64_t)(v2 + 2);
  uint64_t v4 = *v2;
  uint64_t v5 = *a1;
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  uint64_t v9 = *(void *)(*v2 + 88);
  OUTLINED_FUNCTION_3_14();
  type metadata accessor for Statement();
  char v22 = 4;
  uint64_t v10 = sub_1A2CE7D78(v9);
  uint64_t v21 = v5;
  *(void *)&long long v19 = v7;
  *((void *)&v19 + 1) = v6;
  char v20 = v8;
  uint64_t v11 = *(void *)(v4 + 80);
  OUTLINED_FUNCTION_3_14();
  uint64_t v13 = *(void *)(v12 + 96);
  swift_retain();
  sub_1A2CDF6F8(v10, &v21, (uint64_t)&v19, 0, 1, v11, v13);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_1A2CBE7DC();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v3, (uint64_t)&v19);
  uint64_t v17 = sub_1A2CAEF50(&v22, v14, v16, &v19);
  sub_1A2CB0EB0(v17);
  OUTLINED_FUNCTION_1_5();
  return v6;
}

uint64_t sub_1A2CEA6DC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = (uint64_t)(v2 + 2);
  uint64_t v4 = *v2;
  uint64_t v5 = *a1;
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  type metadata accessor for Statement();
  OUTLINED_FUNCTION_0_10();
  uint64_t v25 = v5;
  *(void *)&long long v23 = v7;
  *((void *)&v23 + 1) = v6;
  char v24 = v8;
  uint64_t v9 = *(void *)(v4 + 80);
  uint64_t v10 = *(void *)(v4 + 96);
  swift_retain();
  uint64_t v11 = OUTLINED_FUNCTION_4_13();
  sub_1A2CDF6F8(v11, v12, v13, v14, v15, v9, v10);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_1A2CBE7DC();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v3, (uint64_t)&v23);
  uint64_t v19 = sub_1A2CAEF50(&v26, v16, v18, &v23);
  char v20 = sub_1A2CB0EB0(v19);
  uint64_t result = swift_release();
  if (!v22)
  {
    *(void *)&long long v23 = v20;
    sub_1A2CF3B50();
    swift_getWitnessTable();
    OUTLINED_FUNCTION_5_12();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CEA888(uint64_t *a1)
{
  uint64_t v2 = (uint64_t)(v1 + 2);
  uint64_t v3 = *v1;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  char v6 = *((unsigned char *)a1 + 16);
  type metadata accessor for Statement();
  OUTLINED_FUNCTION_0_10();
  unint64_t v23 = 0xF000000000000007;
  *(void *)&long long v21 = v4;
  *((void *)&v21 + 1) = v5;
  char v22 = v6;
  sub_1A2CDF540();
  uint64_t v7 = *(void *)(v3 + 80);
  uint64_t v8 = *(void *)(v3 + 96);
  uint64_t v9 = OUTLINED_FUNCTION_4_13();
  sub_1A2CDF6F8(v9, v10, v11, v12, v13, v7, v8);
  swift_bridgeObjectRelease();
  sub_1A2CDF55C();
  uint64_t v14 = sub_1A2CBE7DC();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  sub_1A2CB37E4(v2, (uint64_t)&v21);
  uint64_t v17 = sub_1A2CAEF50(&v24, v14, v16, &v21);
  uint64_t v18 = sub_1A2CB0EB0(v17);
  uint64_t result = swift_release();
  if (!v20)
  {
    *(void *)&long long v21 = v18;
    sub_1A2CF3B50();
    swift_getWitnessTable();
    OUTLINED_FUNCTION_5_12();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t QuerySome.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t QuerySome.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CEAA98()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for QuerySome()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for QuerySome(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for QuerySome);
}

uint64_t dispatch thunk of QuerySome.all()()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of QuerySome.all(_:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of QuerySome.where(_:orderBy:limit:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of QuerySome.first(_:orderBy:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of QuerySome.first(orderBy:)()
{
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t Bool.queryValue.getter(char a1)
{
  if (a1) {
    return 49;
  }
  else {
    return 48;
  }
}

void static Bool.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t Bool.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16) == 2)
  {
    uint64_t v2 = *(_DWORD *)a1 & 1;
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v2;
  }
  else
  {
    uint64_t result = sub_1A2CF3F30();
    __break(1u);
  }
  return result;
}

uint64_t Bool.valueType.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result & 1;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 2;
  return result;
}

uint64_t sub_1A2CEACDC@<X0>(uint64_t a1@<X8>)
{
  return Bool.valueType.getter(*v1, a1);
}

uint64_t sub_1A2CEACE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = Bool.init(valueType:connection:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A2CEAD10()
{
  return Bool.queryValue.getter(*v0);
}

uint64_t sub_1A2CEAD30(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_1A2CB97B0(a1), (v2 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t assertion<A>(invoking:)(void (*a1)(void))
{
  char v2 = 0;
  return assertion<A>(_:invoking:)(&v2, a1);
}

uint64_t Assertion.__allocating_init(name:)(unsigned char *a1)
{
  *(unsigned char *)(swift_allocObject() + 16) = *a1;
  sub_1A2CB9BBC();
  if (v1) {
    swift_release();
  }
  return OUTLINED_FUNCTION_1_17();
}

BOOL static Assertion.Name.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Assertion.Name.hash(into:)()
{
  return sub_1A2CF4130();
}

uint64_t Assertion.Name.hashValue.getter()
{
  return sub_1A2CF4140();
}

id sub_1A2CEAEA0@<X0>(void *a1@<X8>)
{
  uint64_t v5 = *((void *)v1 + 2);
  uint64_t v6 = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *v1;
    char v2 = (void *)*((void *)v1 + 1);
    if (qword_1EB5A6A20 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v7 = sub_1A2CF3750();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EB5A8270);
  id v23 = v2;
  uint64_t v8 = sub_1A2CF3730();
  os_log_type_t v9 = sub_1A2CF3BF0();
  uint64_t v22 = v3;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v24 = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    if (v3) {
      uint64_t v12 = 0x61546873696E6946;
    }
    else {
      uint64_t v12 = 0xD000000000000019;
    }
    if (v3) {
      unint64_t v13 = 0xED0000776F4E6B73;
    }
    else {
      unint64_t v13 = 0x80000001A2CF8080;
    }
    sub_1A2CEB914(v12, v13, &v24);
    sub_1A2CF3D50();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2050;
    sub_1A2CF3D50();
    _os_log_impl(&dword_1A2CAD000, v8, v9, "Decreasing interest in assertion. Name=%{public}s, New Interest Count=%{public}ld", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A623FB80](v11, -1, -1);
    MEMORY[0x1A623FB80](v10, -1, -1);
  }
  else
  {
  }
  if (v6 < 1)
  {
    id v15 = v23;
    uint64_t v16 = sub_1A2CF3730();
    os_log_type_t v17 = sub_1A2CF3BF0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136446210;
      uint64_t v24 = v19;
      if (v22) {
        uint64_t v20 = 0x61546873696E6946;
      }
      else {
        uint64_t v20 = 0xD000000000000019;
      }
      if (v22) {
        unint64_t v21 = 0xED0000776F4E6B73;
      }
      else {
        unint64_t v21 = 0x80000001A2CF8080;
      }
      sub_1A2CEB914(v20, v21, &v24);
      sub_1A2CF3D50();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A2CAD000, v16, v17, "Assertion no longer has interest; invalidating assertion. Name=%{public}s",
        v18,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A623FB80](v19, -1, -1);
      MEMORY[0x1A623FB80](v18, -1, -1);
    }
    else
    {
    }
    id result = objc_msgSend(v15, sel_invalidate);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  else
  {
    *a1 = v22;
    a1[1] = v23;
    a1[2] = v6;
    return v23;
  }
  return result;
}

uint64_t Assertion.__allocating_init()()
{
  *(unsigned char *)(swift_allocObject() + 16) = 0;
  sub_1A2CB9BBC();
  if (v0) {
    swift_release();
  }
  return OUTLINED_FUNCTION_1_17();
}

uint64_t Assertion.init()()
{
  *(unsigned char *)(v0 + 16) = 0;
  sub_1A2CB9BBC();
  if (v1) {
    swift_release();
  }
  return OUTLINED_FUNCTION_1_17();
}

uint64_t Assertion.init(name:)(unsigned char *a1)
{
  *(unsigned char *)(v1 + 16) = *a1;
  sub_1A2CB9BBC();
  if (v2) {
    swift_release();
  }
  return OUTLINED_FUNCTION_1_17();
}

uint64_t method lookup function for Assertion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Assertion);
}

uint64_t dispatch thunk of Assertion.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of Assertion.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

unsigned char *storeEnumTagSinglePayload for Assertion.Name(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A2CEB48CLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

void sub_1A2CEB4B4()
{
  if (qword_1EB5A6A58 != -1) {
    swift_once();
  }
  MEMORY[0x1F4188790]();
  uint64_t v1 = (uint64_t *)&v0[4];
  uint64_t v2 = v0 + 6;
  os_unfair_lock_lock(v0 + 6);
  sub_1A2CEB8DC(v1);
  os_unfair_lock_unlock(v2);
  if (qword_1EB5A69A0 != -1) {
    swift_once();
  }
  MEMORY[0x1F4188790]();
  unsigned int v4 = (uint64_t *)&v3[4];
  uint64_t v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  sub_1A2CEB8F8(v4);
  os_unfair_lock_unlock(v5);
}

uint64_t sub_1A2CEB5F8()
{
  uint64_t v1 = sub_1A2CF35E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  uint64_t v6 = *(void *)(v2 + 64) + v4 + 1;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v6, v5);
}

void sub_1A2CEB68C()
{
  sub_1A2CF35E0();
  sub_1A2CEB4B4();
}

uint64_t sub_1A2CEB714(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = sub_1A2CEAD30(a2, *a1);
  sub_1A2CEC1D4(a2);
  uint64_t result = swift_unknownObjectRelease();
  if (v3)
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A2CF3D00();
    return swift_unknownObjectRelease_n();
  }
  return result;
}

void sub_1A2CEB798(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  if (*(void *)(*a1 + 16) && (v3 = a2 & 1, unint64_t v4 = sub_1A2CB9E90(a2 & 1), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(v2 + 56) + 24 * v4;
    char v7 = *(unsigned char *)v6;
    os_log_type_t v9 = *(void **)(v6 + 8);
    uint64_t v8 = *(void *)(v6 + 16);
    v12[0] = v7;
    unint64_t v13 = v9;
    uint64_t v14 = v8;
    id v10 = v9;
    sub_1A2CEAEA0(&v15);
    if (v16)
    {
      sub_1A2CBA020(v15 & 1, v16, v17, v3);

      return;
    }
    sub_1A2CEC0B0(v3, (uint64_t)v12);
    id v11 = v13;
  }
  else
  {
    if (qword_1EB5A61F0 != -1) {
      swift_once();
    }
    id v11 = (id)qword_1EB5A8268;
    sub_1A2CF3C00();
    sub_1A2CF3720();
  }
}

uint64_t sub_1A2CEB8DC(uint64_t *a1)
{
  return sub_1A2CEB714(a1, *(void *)(v1 + 16));
}

void sub_1A2CEB8F8(uint64_t *a1)
{
  sub_1A2CEB798(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_1A2CEB914(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1A2CEB9E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1A2CB3904((uint64_t)v12, *a3);
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
      sub_1A2CB3904((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1A2CEB9E8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1A2CEBB40((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1A2CF3D60();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_1A2CEBC18(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1A2CF3E20();
    if (!v8)
    {
      uint64_t result = sub_1A2CF3F20();
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

void *sub_1A2CEBB40(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_1A2CEBC18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1A2CEBCB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1A2CEBEF4(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1A2CEBEF4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A2CEBCB0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_1A2CF3A30();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x1E4FBC860];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
LABEL_6:
  unint64_t v3 = sub_1A2CEBE24(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1A2CF3DE0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_1A2CF3F50();
  __break(1u);
LABEL_14:
  uint64_t result = sub_1A2CF3F20();
  __break(1u);
  return result;
}

void *sub_1A2CEBE24(uint64_t a1, uint64_t a2)
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
  sub_1A2CB56EC(0, &qword_1EB5A58E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A2CEBE98(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_1A2CF3A50();
    OUTLINED_FUNCTION_0_11(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x1A623ED90](15, a1 >> 16);
    OUTLINED_FUNCTION_0_11(v3);
    return v4 | 8;
  }
}

char *sub_1A2CEBEF4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A2CB56EC(0, &qword_1EB5A58E8);
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
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A2CDD094(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A2CEBFD8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1A2CEBFD8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1A2CF3F50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

unint64_t sub_1A2CEC0B0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_1A2CB9E90(a1 & 1);
  if (v5)
  {
    unint64_t v6 = result;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_1A2CB9FB4(0, &qword_1EB5A6B08, MEMORY[0x1E4FBBCB8]);
    sub_1A2CF3F00();
    uint64_t v7 = *(void *)(v11 + 56) + 24 * v6;
    char v8 = *(unsigned char *)v7;
    uint64_t v10 = *(void *)(v7 + 8);
    uint64_t v9 = *(void *)(v7 + 16);
    *(unsigned char *)a2 = v8;
    *(void *)(a2 + 8) = v10;
    *(void *)(a2 + 16) = v9;
    sub_1A2CBA38C();
    sub_1A2CF3F10();
    *uint64_t v2 = v11;
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t sub_1A2CEC1D4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1A2CB97B0(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_1A2CB9A50(0, &qword_1EB5A6B00, MEMORY[0x1E4FBBCB8]);
  sub_1A2CF3F00();
  uint64_t v6 = *(void *)(v10 + 48);
  uint64_t v7 = sub_1A2CF35E0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6 + *(void *)(*(void *)(v7 - 8) + 72) * v4, v7);
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v4);
  sub_1A2CBA334();
  sub_1A2CB9848(&qword_1EB5A6A30, MEMORY[0x1E4F27990]);
  sub_1A2CF3F10();
  *uint64_t v2 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

void sub_1A2CEC354()
{
  if (!qword_1EB5A56E0[0])
  {
    sub_1A2CB9280(255, &qword_1EB5A56D8);
    unint64_t v0 = sub_1A2CF3D40();
    if (!v1) {
      atomic_store(v0, qword_1EB5A56E0);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for Assertion.RunningAssertion(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  BOOL v3 = *(void **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  id v5 = v3;
  return a1;
}

void destroy for Assertion.RunningAssertion(uint64_t a1)
{
}

uint64_t assignWithCopy for Assertion.RunningAssertion(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for Assertion.RunningAssertion(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Assertion.RunningAssertion(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Assertion.RunningAssertion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for Assertion.RunningAssertion()
{
  return &type metadata for Assertion.RunningAssertion;
}

uint64_t dispatch thunk of ConstructType.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void static CGSize.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t CGSize.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16)) {
    goto LABEL_18;
  }
  uint64_t v3 = *(void *)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  v22[0] = 44;
  v22[1] = 0xE100000000000000;
  MEMORY[0x1F4188790](a1);
  uint64_t v19 = (uint64_t)v22;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1A2CDE660(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1A2CDF330, (uint64_t)&v18, v3, v4);
  int64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v21 = a2;
    v22[0] = MEMORY[0x1E4FBC860];
    sub_1A2CDEFF8(0, v6, 0);
    uint64_t v7 = v22[0];
    uint64_t v8 = v5 + 56;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_1A2CF3B80();
      char v11 = v10;
      v22[0] = v7;
      unint64_t v13 = *(void *)(v7 + 16);
      unint64_t v12 = *(void *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1A2CDEFF8((char *)(v12 > 1), v13 + 1, 1);
        uint64_t v7 = v22[0];
      }
      *(void *)(v7 + 16) = v13 + 1;
      uint64_t v14 = v7 + 16 * v13;
      *(void *)(v14 + 32) = v9;
      *(unsigned char *)(v14 + 40) = v11 & 1;
      v8 += 32;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    a2 = v21;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x1E4FBC860];
  }
  unint64_t v15 = *(void *)(v7 + 16);
  if (!v15)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((*(unsigned char *)(v7 + 40) & 1) == 0)
  {
    if (v15 >= 2)
    {
      char v16 = *(unsigned char *)(v7 + 56);
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        sub_1A2CB2E8C(v3, v4, 0);
        return __swift_destroy_boxed_opaque_existential_1(a2);
      }
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  int v20 = 0;
  uint64_t v19 = 28;
  uint64_t result = sub_1A2CF3F30();
  __break(1u);
  return result;
}

uint64_t CGSize.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = sub_1A2CF3B60();
  uint64_t v5 = v2;
  sub_1A2CF39F0();
  sub_1A2CF3B60();
  sub_1A2CF39F0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = 0;
  return result;
}

uint64_t sub_1A2CEC828@<X0>(uint64_t a1@<X8>)
{
  return CGSize.valueType.getter(a1);
}

uint64_t sub_1A2CEC830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = CGSize.init(valueType:connection:)(a1, a2);
  *a3 = v5;
  a3[1] = v6;
  return result;
}

uint64_t sub_1A2CEC858(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1A2CEC8C0(&qword_1E959F338);
  uint64_t result = sub_1A2CEC8C0(qword_1E959F340);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A2CEC8C0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A2CEC904@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

TeaDB::AssertionOptions __swiftcall AssertionOptions.init(rawValue:)(TeaDB::AssertionOptions rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static AssertionOptions.open.getter(void *a1@<X8>)
{
}

void static AssertionOptions.read.getter(void *a1@<X8>)
{
}

void sub_1A2CEC974()
{
  uint64_t v0 = unk_1EF5E01D8;
  if ((unk_1EF5E01D8 & ~qword_1EF5E01D0) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = v0 | qword_1EF5E01D0;
  uint64_t v3 = qword_1EF5E01E0;
  uint64_t v2 = unk_1EF5E01E8;
  if ((qword_1EF5E01E0 & ~v1) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3 | v1;
  if ((unk_1EF5E01E8 & ~v4) == 0) {
    uint64_t v2 = 0;
  }
  qword_1EB5A69E0 = v2 | v4;
}

void *static AssertionOptions.all.getter@<X0>(void *a1@<X8>)
{
  return sub_1A2CECA30(&qword_1EB5A69B0, &qword_1EB5A69E0, a1);
}

void sub_1A2CEC9D8()
{
  uint64_t v0 = unk_1EF5E0218;
  if ((unk_1EF5E0218 & ~qword_1EF5E0210) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = qword_1EF5E0220;
  if ((qword_1EF5E0220 & ~(v0 | qword_1EF5E0210)) == 0) {
    uint64_t v1 = 0;
  }
  qword_1EB5A5CB8 = v1 | v0 | qword_1EF5E0210;
}

void *static AssertionOptions.legacy.getter@<X0>(void *a1@<X8>)
{
  return sub_1A2CECA30(qword_1EB5A5CC8, &qword_1EB5A5CB8, a1);
}

void *sub_1A2CECA30@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result != -1) {
    uint64_t result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

uint64_t AssertionOptions.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t sub_1A2CECA80()
{
  unint64_t result = qword_1EB5A6990;
  if (!qword_1EB5A6990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A6990);
  }
  return result;
}

unint64_t sub_1A2CECAD0()
{
  unint64_t result = qword_1EB5A69B8;
  if (!qword_1EB5A69B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5A69B8);
  }
  return result;
}

TeaDB::AssertionOptions sub_1A2CECB1C(Swift::Int *a1)
{
  return AssertionOptions.init(rawValue:)(*a1);
}

BOOL sub_1A2CECB24(uint64_t *a1)
{
  return sub_1A2CD3C60(*a1, *v1);
}

uint64_t sub_1A2CECB30@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CECB3C(*a1, *v2, a2);
}

uint64_t sub_1A2CECB3C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_1A2CECB48@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CD2F58(*a1, *v2, a2);
}

uint64_t sub_1A2CECB54@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CECB60(*a1, *v2, a2);
}

uint64_t sub_1A2CECB60@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

uint64_t sub_1A2CECB6C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A2CECB74(*a1, a2);
}

uint64_t sub_1A2CECB74@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_1A2CECB9C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A2CECBA4(*a1, a2);
}

uint64_t sub_1A2CECBA4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_1A2CECBC4(uint64_t *a1)
{
  return sub_1A2CD2F64(*a1);
}

uint64_t sub_1A2CECBCC(uint64_t *a1)
{
  return sub_1A2CD2F74(*a1);
}

uint64_t sub_1A2CECBD4(uint64_t *a1)
{
  return sub_1A2CECBDC(*a1);
}

uint64_t sub_1A2CECBDC(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_1A2CECBEC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1A2CECBF8(*a1, *v2, a2);
}

uint64_t sub_1A2CECBF8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1A2CECC04(uint64_t *a1)
{
  return sub_1A2CD2F84(*a1, *v1);
}

BOOL sub_1A2CECC10(uint64_t *a1)
{
  return sub_1A2CECC1C(*a1, *v1);
}

BOOL sub_1A2CECC1C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1A2CECC28(uint64_t *a1)
{
  return sub_1A2CD2F90(*a1, *v1);
}

BOOL sub_1A2CECC34()
{
  return sub_1A2CECC3C(*v0);
}

BOOL sub_1A2CECC3C(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1A2CECC48(uint64_t *a1)
{
  return sub_1A2CECC50(*a1);
}

uint64_t sub_1A2CECC50(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

TeaDB::AssertionOptions sub_1A2CECC60@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = AssertionOptions.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1A2CECC8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AssertionOptions.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_1A2CECCB4(uint64_t *a1, uint64_t *a2)
{
  return sub_1A2CCEAF0(*a1, *a2);
}

unint64_t sub_1A2CECCC4()
{
  unint64_t result = qword_1EB5A6950;
  if (!qword_1EB5A6950)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB5A6950);
  }
  return result;
}

uint64_t JSON.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t JSON.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1A2CF3420();
  swift_allocObject();
  sub_1A2CF3410();
  uint64_t v2 = sub_1A2CF3400();
  uint64_t v4 = v3;
  uint64_t result = swift_release();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = 4;
  return result;
}

uint64_t sub_1A2CECE08(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1A2CF4080();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A2CECE88()
{
  return 0x65756C6176;
}

uint64_t sub_1A2CECE9C()
{
  return sub_1A2CECE88();
}

uint64_t sub_1A2CECEAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1A2CECE08(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A2CECEE4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1A2CECF38(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t JSON.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v10 = *(void *)(a2 + 16);
  type metadata accessor for JSON.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_1A2CF4030();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v10 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A2CF41B0();
  sub_1A2CF4020();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t type metadata accessor for JSON.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t JSON.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  OUTLINED_FUNCTION_0();
  uint64_t v27 = v7;
  MEMORY[0x1F4188790](v8);
  uint64_t v28 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for JSON.CodingKeys();
  swift_getWitnessTable();
  uint64_t v29 = sub_1A2CF3FD0();
  OUTLINED_FUNCTION_0();
  uint64_t v25 = v10;
  MEMORY[0x1F4188790](v11);
  uint64_t v26 = a3;
  uint64_t v12 = type metadata accessor for JSON();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v13;
  MEMORY[0x1F4188790](v14);
  char v16 = (char *)&v22 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v17 = v30;
  sub_1A2CF4190();
  if (!v17)
  {
    uint64_t v30 = v12;
    uint64_t v18 = v27;
    sub_1A2CF3FC0();
    uint64_t v19 = OUTLINED_FUNCTION_1_19();
    v20(v19);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v16, v28, a2);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v24, v16, v30);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1A2CED348@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return JSON.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_1A2CED36C(void *a1, uint64_t a2)
{
  return JSON.encode(to:)(a1, a2);
}

unsigned char *sub_1A2CED3BC(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A2CED458);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1A2CED480()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CED49C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CED4B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1A2CED4D4()
{
  return sub_1A2CED5A8();
}

uint64_t sub_1A2CED500()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void *)(*(void *)(v1 + 88) + 8);
  *(void *)&long long v7 = v4;
  *((void *)&v7 + 1) = v3;
  uint64_t v8 = v2;
  uint64_t v9 = v5;
  type metadata accessor for QuerySome();
  sub_1A2CB37E4(v0 + 16, (uint64_t)&v7);
  return sub_1A2CAF090(&v7);
}

uint64_t sub_1A2CED57C()
{
  return sub_1A2CED5A8();
}

uint64_t sub_1A2CED5A8()
{
  OUTLINED_FUNCTION_0_13();
  v4(0, *(void *)(v2 + 80), *(void *)(v3 + 88));
  sub_1A2CB37E4(v1, (uint64_t)v6);
  return v0(v6);
}

uint64_t sub_1A2CED620()
{
  return sub_1A2CBD42C();
}

uint64_t Table.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t Table.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t method lookup function for Table(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Table);
}

uint64_t dispatch thunk of Table.save.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of Table.querySome<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of Table.delete.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of Table.drop.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t sub_1A2CED74C(char a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*(void *)v3 + 80);
  uint64_t v6 = *(void *)(*(void *)v3 + 88);
  type metadata accessor for Statement();
  char v13 = 3;
  if (a1)
  {
    *(void *)&v12[0] = 0;
    *((void *)&v12[0] + 1) = 0xE000000000000000;
    sub_1A2CF3DD0();
    swift_bridgeObjectRelease();
    unint64_t v7 = 0xD000000000000015;
    unint64_t v8 = 0x80000001A2CF8380;
  }
  else
  {
    unint64_t v7 = 0x42415420504F5244;
    unint64_t v8 = 0xEB0000000020454CLL;
  }
  *(void *)&v12[0] = v7;
  *((void *)&v12[0] + 1) = v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v5, v6);
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  long long v9 = v12[0];
  sub_1A2CB37E4(v3 + 16, (uint64_t)v12);
  uint64_t v10 = sub_1A2CAEF50(&v13, v9, *((uint64_t *)&v9 + 1), v12);
  sub_1A2CB0EB0(v10);
  uint64_t result = swift_release();
  if (!v2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t Drop.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t Drop.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A2CED928()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Drop()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for Drop(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Drop);
}

uint64_t dispatch thunk of Drop.table(ifExists:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t PreparedStatement.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t method lookup function for PreparedStatement(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PreparedStatement);
}

uint64_t assignWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1A2CB7EC4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1A2CB1E90(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SQLError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1A2CB1E90(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xE3 && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 226;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 0x1D) {
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

uint64_t storeEnumTagSinglePayload for SQLError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 227;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xE3) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xE3) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1A2CEDB44(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 0x1Cu) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 29);
  }
}

uint64_t sub_1A2CEDB5C(uint64_t result, unsigned int a2)
{
  if (a2 >= 0x1D)
  {
    *(void *)uint64_t result = a2 - 29;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 29;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLError()
{
  return &type metadata for SQLError;
}

uint64_t sub_1A2CEDC70(uint64_t a1, uint64_t a2)
{
  return sub_1A2CB2720(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_1A2CEDC8C(void (*a1)(void *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v17 = MEMORY[0x1E4FBC860];
    sub_1A2CB4BC8(0, v5, 0);
    uint64_t v6 = v17;
    for (uint64_t i = a3 + 32; ; i += 56)
    {
      a1(v16, i);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v10 = v16[0];
      uint64_t v9 = v16[1];
      uint64_t v17 = v6;
      unint64_t v12 = *(void *)(v6 + 16);
      unint64_t v11 = *(void *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_1A2CB4BC8((char *)(v11 > 1), v12 + 1, 1);
        uint64_t v6 = v17;
      }
      *(void *)(v6 + 16) = v12 + 1;
      uint64_t v13 = v6 + 16 * v12;
      *(void *)(v13 + 32) = v10;
      *(void *)(v13 + 40) = v9;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_1A2CEDDAC()
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_19();
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4)
  {
LABEL_6:
    uint64_t v8 = OUTLINED_FUNCTION_5_13();
    v9(v8);
    unsigned int v10 = *(unsigned __int8 *)(v0 + 32);
    if (v10 >= 4)
    {
      if (v10 == 4 && (v50[0] & 8) != 0) {
        goto LABEL_13;
      }
    }
    else if ((v50[0] & 0x10) != 0)
    {
LABEL_13:
      v46[0] = (id)v50[0];
      sub_1A2CB859C();
    }
    uint64_t v12 = OUTLINED_FUNCTION_4_14();
    v13(v12);
    if (v1) {
      return swift_release();
    }
    if (v10 == 4)
    {
      OUTLINED_FUNCTION_6_12(1);
      uint64_t v14 = 0;
      uint64_t v53 = &v47;
      uint64_t v38 = MEMORY[0x1E4FBC860];
LABEL_19:
      uint64_t v37 = v14;
      uint64_t v15 = sub_1A2CEEA54();
      unint64_t v16 = 0;
      uint64_t v17 = *(char **)(v15 + 16);
      uint64_t v39 = v15 + 32;
      uint64_t v40 = v15;
      while (1)
      {
        if ((char *)v16 == v17)
        {
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v18 = v17;
          *(_OWORD *)uint64_t v46 = 0u;
          long long v47 = 0u;
        }
        else
        {
          if (v16 >= *(void *)(v40 + 16)) {
            goto LABEL_36;
          }
          uint64_t v18 = (char *)(v16 + 1);
          sub_1A2CB4000(v39 + 56 * v16, (uint64_t)v45);
          v46[0] = (id)v16;
          OUTLINED_FUNCTION_15_3(v45[0], v45[1]);
        }
        sub_1A2CB31C4((uint64_t)v46, (uint64_t)v50, (unint64_t *)&qword_1EB5A6198, (uint64_t (*)(uint64_t))sub_1A2CBAE48);
        if (!v51)
        {
          swift_bridgeObjectRelease();
          if (swift_isUniquelyReferenced_nonNull_native())
          {
            uint64_t v31 = v37;
            uint64_t v30 = v38;
          }
          else
          {
            OUTLINED_FUNCTION_9_7();
            sub_1A2CDCA64();
            uint64_t v30 = v35;
            uint64_t v31 = v37;
          }
          unint64_t v33 = *(void *)(v30 + 16);
          unint64_t v32 = *(void *)(v30 + 24);
          unint64_t v34 = v33 + 1;
          if (v33 >= v32 >> 1)
          {
            OUTLINED_FUNCTION_22_1(v32);
            sub_1A2CDCA64();
            uint64_t v30 = v36;
          }
          uint64_t v38 = v30;
          *(void *)(v30 + 16) = v34;
          sub_1A2CB1B3C(1, 0, 29);
          uint64_t v14 = v31;
          goto LABEL_19;
        }
        unint64_t v41 = (unint64_t)v18;
        uint64_t v19 = v50[0];
        v46[0] = (id)v50[1];
        v46[1] = v51;
        int v20 = v53;
        sub_1A2CB377C(&v52, (uint64_t)v53);
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1(v20, *((uint64_t *)&v48 + 1));
        uint64_t v22 = *((void *)&v48 + 1);
        uint64_t v21 = v49;
        __swift_project_boxed_opaque_existential_1(v20, *((uint64_t *)&v48 + 1));
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 8))(v42, v22, v21);
        if (v19 < (uint64_t)0xFFFFFFFF80000000) {
          break;
        }
        if (v19 > 0x7FFFFFFF) {
          goto LABEL_35;
        }
        uint64_t v23 = *((void *)&v48 + 1);
        uint64_t v24 = v49;
        uint64_t v25 = v53;
        __swift_project_boxed_opaque_existential_1(v53, *((uint64_t *)&v48 + 1));
        char v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 64))(v23, v24);
        sub_1A2CB1A04(v19, (unsigned __int8 *)v42, v26 & 1, (uint64_t)&v44);
        uint64_t v27 = v44;
        unint64_t v28 = v45[0].n128_u64[0];
        LOBYTE(v24) = v45[0].n128_u8[8];
        v42[0] = v44;
        v42[1] = v45[0].n128_u64[0];
        unsigned __int8 v43 = v45[0].n128_u8[8];
        OUTLINED_FUNCTION_19_3();
        v29();
        sub_1A2CB2E8C(v27, v28, v24);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
        unint64_t v16 = v41;
      }
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      swift_release();
      swift_release();
      return v38;
    }
    else
    {
      OUTLINED_FUNCTION_6_12(2);
      sub_1A2CB1BB0();
      swift_release();
      swift_release();
      return MEMORY[0x1E4FBC860];
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = v3 + 40;
  while (1)
  {
    uint64_t v6 = *(void (**)(uint64_t))(v5 - 8);
    uint64_t v7 = swift_retain();
    uint64_t v1 = v2;
    v6(v7);
    if (v2) {
      break;
    }
    swift_release();
    v5 += 16;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2CEE2F8(uint64_t a1, uint64_t a2, int a3)
{
  void (*v11)(void *__return_ptr, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void v72[2];
  unsigned char v73[40];
  uint64_t v74;
  unint64_t v75;
  unsigned __int8 v76[40];
  uint64_t v77;

  HIDWORD(v68) = a3;
  uint64_t v5 = sub_1A2CF35E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v9 = *(void *)(a1 + 32);
  swift_beginAccess();
  if (*(void *)(v9 + 32))
  {
LABEL_5:
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  sub_1A2CEF564((uint64_t)&v74);
  unsigned __int8 v10 = v76[0];
  if (v76[0] != 255)
  {
    unint64_t v11 = (void (*)(void *__return_ptr, uint64_t))v74;
    uint64_t v12 = v75;
    if (v76[0])
    {
      swift_retain();
      swift_retain();
      uint64_t v13 = sub_1A2CF1010((uint64_t)v11, v12, v10);
      v11(v72, v13);
      sub_1A2CB4A2C((uint64_t)v11, v12, v10);
      sub_1A2CB4A2C((uint64_t)v11, v12, v10);
      swift_release();
      swift_release();
    }
    goto LABEL_5;
  }
  sub_1A2CF35D0();
  sub_1A2CF35C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_6:
  uint64_t v14 = sub_1A2CB2F04(a1, a2);
  uint64_t v15 = *(void *)(v14 + 16);
  unint64_t v16 = MEMORY[0x1E4FBC860];
  int64_t v71 = a1;
  uint64_t v70 = a2;
  uint64_t v69 = v14;
  if (v15)
  {
    uint64_t v74 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1A2CB4BC8(0, v15, 0);
    unint64_t v16 = MEMORY[0x1E4FBC860];
    uint64_t v17 = v74;
    uint64_t v18 = (void *)(v14 + 48);
    do
    {
      uint64_t v19 = sub_1A2CEEDCC(*(v18 - 2), *(v18 - 1), v18);
      uint64_t v21 = v20;
      uint64_t v74 = v17;
      uint64_t v23 = *(void *)(v17 + 16);
      uint64_t v22 = *(void *)(v17 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_1A2CB4BC8((char *)(v22 > 1), v23 + 1, 1);
        unint64_t v16 = MEMORY[0x1E4FBC860];
        uint64_t v17 = v74;
      }
      *(void *)(v17 + 16) = v23 + 1;
      uint64_t v24 = v17 + 16 * v23;
      *(void *)(v24 + 32) = v19;
      *(void *)(v24 + 40) = v21;
      v18 += 7;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease_n();
    uint64_t v14 = v69;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x1E4FBC860];
  }
  uint64_t v25 = *(void *)(v14 + 16);
  if (v25)
  {
    uint64_t v77 = v16;
    sub_1A2CB4BC8(0, v25, 0);
    char v26 = v14 + 32;
    uint64_t v27 = v77;
    do
    {
      sub_1A2CB4000(v26, (uint64_t)&v74);
      uint64_t v29 = v74;
      unint64_t v28 = v75;
      v72[0] = v74;
      v72[1] = v75;
      sub_1A2CB37E4((uint64_t)v76, (uint64_t)v73);
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
      sub_1A2CB4414((uint64_t)&v74, (uint64_t (*)(void))sub_1A2CB4064);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A2CB4BC8(0, *(void *)(v27 + 16) + 1, 1);
        uint64_t v27 = v77;
      }
      uint64_t v31 = *(void *)(v27 + 16);
      uint64_t v30 = *(void *)(v27 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_1A2CB4BC8((char *)(v30 > 1), v31 + 1, 1);
        uint64_t v27 = v77;
      }
      *(void *)(v27 + 16) = v31 + 1;
      unint64_t v32 = v27 + 16 * v31;
      *(void *)(v32 + 32) = v29;
      *(void *)(v32 + 40) = v28;
      v26 += 56;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = MEMORY[0x1E4FBC860];
  }
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v34 = v33;
  uint64_t v36 = *(void *)(v33 + 16);
  uint64_t v35 = *(void *)(v33 + 24);
  uint64_t v37 = v36 + 1;
  if (v36 >= v35 >> 1)
  {
    sub_1A2CB5734(v35 > 1, v36 + 1, 1, v33);
    unint64_t v34 = v61;
  }
  *(void *)(v34 + 16) = v37;
  uint64_t v38 = v34 + 16 * v36;
  *(void *)(v38 + 32) = 0x545245534E49;
  *(void *)(v38 + 40) = 0xE600000000000000;
  if ((v68 & 0x100000000) != 0)
  {
    uint64_t v39 = *(void *)(v34 + 24);
    uint64_t v40 = v36 + 2;
    if (v37 >= v39 >> 1)
    {
      sub_1A2CB5734(v39 > 1, v40, 1, v34);
      unint64_t v34 = v67;
    }
    *(void *)(v34 + 16) = v40;
    unint64_t v41 = v34 + 16 * v37;
    *(void *)(v41 + 32) = 0x414C50455220524FLL;
    *(void *)(v41 + 40) = 0xEA00000000004543;
    uint64_t v37 = *(void *)(v34 + 16);
  }
  uint64_t v42 = *(void *)(v34 + 24);
  unsigned __int8 v43 = v37 + 1;
  if (v37 >= v42 >> 1)
  {
    sub_1A2CB5734(v42 > 1, v37 + 1, 1, v34);
    unint64_t v34 = v62;
  }
  *(void *)(v34 + 16) = v43;
  uint64_t v44 = v34 + 16 * v37;
  *(void *)(v44 + 32) = 1330925129;
  *(void *)(v44 + 40) = 0xE400000000000000;
  int64_t v45 = *(void *)(v34 + 24);
  if ((uint64_t)(v37 + 2) > (uint64_t)(v45 >> 1))
  {
    sub_1A2CB5734(v45 > 1, v37 + 2, 1, v34);
    unint64_t v34 = v63;
  }
  *(void *)(v34 + 16) = v37 + 2;
  uint64_t v46 = v34 + 16 * v43;
  strcpy((char *)(v46 + 32), "table_versions");
  *(unsigned char *)(v46 + 47) = -18;
  uint64_t v74 = 40;
  uint64_t v75 = 0xE100000000000000;
  v72[0] = v27;
  sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
  sub_1A2CB0330();
  sub_1A2CF3900();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  long long v47 = v74;
  long long v48 = v75;
  uint64_t v50 = *(void *)(v34 + 16);
  long long v49 = *(void *)(v34 + 24);
  int64_t v51 = v49 >> 1;
  long long v52 = v50 + 1;
  if (v49 >> 1 <= v50)
  {
    sub_1A2CB5734(v49 > 1, v50 + 1, 1, v34);
    unint64_t v34 = v64;
    long long v49 = *(void *)(v64 + 24);
    int64_t v51 = v49 >> 1;
  }
  *(void *)(v34 + 16) = v52;
  uint64_t v53 = v34 + 16 * v50;
  *(void *)(v53 + 32) = v47;
  *(void *)(v53 + 40) = v48;
  if (v51 < (uint64_t)(v50 + 2))
  {
    sub_1A2CB5734(v49 > 1, v50 + 2, 1, v34);
    unint64_t v34 = v65;
  }
  *(void *)(v34 + 16) = v50 + 2;
  uint64_t v54 = v34 + 16 * v52;
  *(void *)(v54 + 32) = 0x5345554C4156;
  *(void *)(v54 + 40) = 0xE600000000000000;
  uint64_t v74 = 40;
  uint64_t v75 = 0xE100000000000000;
  v72[0] = v17;
  sub_1A2CF3900();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  unint64_t v55 = v74;
  int64_t v56 = v75;
  uint64_t v58 = *(void *)(v34 + 16);
  uint64_t v57 = *(void *)(v34 + 24);
  if (v58 >= v57 >> 1)
  {
    sub_1A2CB5734(v57 > 1, v58 + 1, 1, v34);
    unint64_t v34 = v66;
  }
  *(void *)(v34 + 16) = v58 + 1;
  uint64_t v59 = v34 + 16 * v58;
  *(void *)(v59 + 32) = v55;
  *(void *)(v59 + 40) = v56;
  swift_release();
  swift_release();
  return v34;
}

uint64_t sub_1A2CEEA54()
{
  uint64_t v0 = sub_1A2CF4170();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)&v21 + 1) = &type metadata for RawEntity;
  sub_1A2CF4150();
  sub_1A2CF4160();
  sub_1A2CF3EE0();
  swift_release();
  swift_retain();
  sub_1A2CF3F60();
  sub_1A2CB31C4((uint64_t)&v20, (uint64_t)v27, (unint64_t *)&qword_1EB5A68B0, (uint64_t (*)(uint64_t))sub_1A2CBAF00);
  uint64_t v19 = v0;
  uint64_t v18 = v1;
  uint64_t v17 = v3;
  if (v29)
  {
    uint64_t v4 = MEMORY[0x1E4FBC860];
    while (1)
    {
      uint64_t v6 = v27[0];
      uint64_t v5 = v27[1];
      sub_1A2CB3960(&v28, v26);
      if (v5)
      {
        sub_1A2CB3904((uint64_t)v26, (uint64_t)v24);
        sub_1A2CB3794(0, qword_1EB5A62A0);
        if ((swift_dynamicCast() & 1) == 0)
        {
          *(void *)&long long v22 = 0;
          long long v21 = 0u;
          long long v20 = 0u;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
          sub_1A2CB4414((uint64_t)&v20, (uint64_t (*)(void))sub_1A2CF1058);
          goto LABEL_12;
        }
        sub_1A2CB377C(&v20, (uint64_t)v25);
        *(void *)&long long v20 = v6;
        *((void *)&v20 + 1) = v5;
        sub_1A2CB37E4((uint64_t)v25, (uint64_t)&v21);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A2CB3970();
          uint64_t v4 = v12;
        }
        unint64_t v7 = *(void *)(v4 + 16);
        if (v7 >= *(void *)(v4 + 24) >> 1)
        {
          sub_1A2CB3970();
          uint64_t v4 = v13;
        }
        *(void *)(v4 + 16) = v7 + 1;
        uint64_t v8 = v4 + 56 * v7;
        long long v9 = v20;
        long long v10 = v21;
        long long v11 = v22;
        *(void *)(v8 + 80) = v23;
        *(_OWORD *)(v8 + 48) = v10;
        *(_OWORD *)(v8 + 64) = v11;
        *(_OWORD *)(v8 + 32) = v9;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
LABEL_12:
      sub_1A2CF3F60();
      sub_1A2CB31C4((uint64_t)&v20, (uint64_t)v27, (unint64_t *)&qword_1EB5A68B0, (uint64_t (*)(uint64_t))sub_1A2CBAF00);
      if (!v29) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v4 = MEMORY[0x1E4FBC860];
LABEL_15:
  swift_release_n();
  uint64_t v14 = sub_1A2CB3E68(v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v19);
  return v14;
}

uint64_t sub_1A2CEEDCC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3[3];
  uint64_t v5 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v4);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 16))(v34, v4, v5);
  uint64_t v6 = v34[0];
  unint64_t v7 = v34[1];
  switch(v35)
  {
    case 1:
      uint64_t v31 = v34[0];
      uint64_t v8 = sub_1A2CF4040();
      goto LABEL_7;
    case 2:
      uint64_t v10 = sub_1A2CD5C64(v34[0] & 1 | 0x30, 0xE100000000000000, a3);
      goto LABEL_8;
    case 3:
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
      sub_1A2CF3B70();
      goto LABEL_6;
    case 4:
      uint64_t v12 = Data.queryValue.getter();
      uint64_t v10 = sub_1A2CD5C64(v12, v13, a3);
      swift_bridgeObjectRelease();
      sub_1A2CB2E8C(v6, v7, 4);
      return v10;
    case 5:
      uint64_t v14 = a3[3];
      uint64_t v15 = a3[4];
      __swift_project_boxed_opaque_existential_1(a3, v14);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v15 + 32))(&v31, v14, v15);
      uint64_t v16 = v31;
      unint64_t v17 = v32;
      switch(v33)
      {
        case 0u:
          uint64_t v31 = 39;
          unint64_t v32 = 0xE100000000000000;
          sub_1A2CB18DC(v16, v17, 0);
          sub_1A2CBB018();
          sub_1A2CF3D70();
          sub_1A2CF39F0();
          swift_bridgeObjectRelease();
          sub_1A2CF39F0();
          sub_1A2CD5EC4(v16, v17, 0);
          uint64_t v18 = v16;
          unint64_t v19 = v17;
          char v20 = 0;
          goto LABEL_31;
        case 1u:
          uint64_t v10 = sub_1A2CF4040();
          sub_1A2CD5EC4(v16, v17, 1);
          uint64_t v28 = v16;
          unint64_t v29 = v17;
          char v30 = 1;
          goto LABEL_20;
        case 2u:
          sub_1A2CD5EC4(v31, v32, 2);
          sub_1A2CD5EC4(v16, v17, 2);
          return v16 & 1 | 0x30;
        case 3u:
          uint64_t v31 = 0;
          unint64_t v32 = 0xE000000000000000;
          sub_1A2CF3B70();
          sub_1A2CD5EC4(v16, v17, 3);
          uint64_t v18 = v16;
          unint64_t v19 = v17;
          char v20 = 3;
          goto LABEL_31;
        case 4u:
          sub_1A2CB18DC(v31, v32, 4);
          uint64_t v10 = Data.queryValue.getter();
          sub_1A2CD5EC4(v16, v17, 4);
          uint64_t v28 = v16;
          unint64_t v29 = v17;
          char v30 = 4;
LABEL_20:
          sub_1A2CD5EC4(v28, v29, v30);
          break;
        case 5u:
          uint64_t v10 = 1280070990;
          sub_1A2CD5EC4(v31, v32, 5);
          sub_1A2CD5EC4(v16, v17, 5);
          break;
        default:
          while (2)
          {
            uint64_t v10 = 1280070990;
            uint64_t v21 = *(void *)(v16 + 24);
            uint64_t v22 = *(void *)(v16 + 32);
            __swift_project_boxed_opaque_existential_1((void *)v16, v21);
            (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v22 + 24))(&v31, v21, v22);
            uint64_t v16 = v33;
            if (v33 != 255)
            {
              uint64_t v23 = v31;
              unint64_t v24 = v32;
              uint64_t v31 = 0;
              unint64_t v32 = 0xE000000000000000;
              sub_1A2CF3DD0();
              swift_bridgeObjectRelease();
              uint64_t v31 = 0xD000000000000011;
              unint64_t v32 = 0x80000001A2CF7B80;
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              sub_1A2CF39F0();
              switch((int)v16)
              {
                case 0:
                  sub_1A2CB18DC(v23, v24, 0);
                  sub_1A2CBB018();
                  sub_1A2CF3D70();
                  sub_1A2CF39F0();
                  swift_bridgeObjectRelease();
                  sub_1A2CF39F0();
                  uint64_t v25 = v23;
                  unint64_t v26 = v24;
                  char v27 = 0;
                  goto LABEL_26;
                case 1:
                  sub_1A2CF4040();
                  uint64_t v25 = v23;
                  unint64_t v26 = v24;
                  char v27 = 1;
                  goto LABEL_26;
                case 2:
                  sub_1A2CD5EC4(v23, v24, 2);
                  break;
                case 3:
                  sub_1A2CF3B70();
                  uint64_t v25 = v23;
                  unint64_t v26 = v24;
                  char v27 = 3;
                  goto LABEL_26;
                case 4:
                  sub_1A2CB18DC(v23, v24, 4);
                  Data.queryValue.getter();
                  uint64_t v25 = v23;
                  unint64_t v26 = v24;
                  char v27 = 4;
LABEL_26:
                  sub_1A2CD5EC4(v25, v26, v27);
                  break;
                case 5:
                  sub_1A2CD5EC4(v23, v24, 5);
                  break;
                default:
                  continue;
              }
              sub_1A2CF39F0();
              swift_bridgeObjectRelease();
              sub_1A2CF39F0();
              uint64_t v18 = v23;
              unint64_t v19 = v24;
              char v20 = v16;
LABEL_31:
              sub_1A2CD5EC4(v18, v19, v20);
              uint64_t v10 = v31;
            }
            break;
          }
          break;
      }
      return v10;
    default:
      uint64_t v31 = 39;
      unint64_t v32 = 0xE100000000000000;
      sub_1A2CBB018();
      sub_1A2CF3D70();
      sub_1A2CF39F0();
      swift_bridgeObjectRelease();
      sub_1A2CF39F0();
      sub_1A2CB2E8C(v6, v7, 0);
LABEL_6:
      uint64_t v8 = v31;
      uint64_t v9 = v32;
LABEL_7:
      uint64_t v10 = sub_1A2CD5C64(v8, v9, a3);
LABEL_8:
      swift_bridgeObjectRelease();
      return v10;
  }
}

uint64_t sub_1A2CEF564@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = *(void *)(v1 + 56);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v5 = *(unsigned char *)(v1 + 64);
  *(unsigned char *)(a1 + 16) = v5;
  return sub_1A2CF1010(v3, v4, v5);
}

uint64_t sub_1A2CEF5B4(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  uint64_t v7 = v6;
  unint64_t v9 = *(void *)(v6 + 16);
  unint64_t v8 = *(void *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    sub_1A2CB5734(v8 > 1, v9 + 1, 1, v6);
    uint64_t v7 = v28;
  }
  *(void *)(v7 + 16) = v9 + 1;
  uint64_t v10 = v7 + 16 * v9;
  *(void *)(v10 + 32) = 0x455441455243;
  *(void *)(v10 + 40) = 0xE600000000000000;
  uint64_t v11 = a3[3];
  uint64_t v12 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v11);
  char v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 56))(v11, v12);
  unint64_t v14 = *(void *)(v7 + 16);
  if (v13)
  {
    unint64_t v15 = *(void *)(v7 + 24);
    unint64_t v16 = v14 + 1;
    if (v14 >= v15 >> 1)
    {
      sub_1A2CB5734(v15 > 1, v14 + 1, 1, v7);
      uint64_t v7 = v31;
    }
    *(void *)(v7 + 16) = v16;
    uint64_t v17 = v7 + 16 * v14;
    *(void *)(v17 + 32) = 0x455551494E55;
    *(void *)(v17 + 40) = 0xE600000000000000;
  }
  else
  {
    unint64_t v16 = *(void *)(v7 + 16);
  }
  unint64_t v18 = *(void *)(v7 + 24);
  unint64_t v19 = v16 + 1;
  if (v16 >= v18 >> 1)
  {
    sub_1A2CB5734(v18 > 1, v16 + 1, 1, v7);
    uint64_t v7 = v29;
  }
  *(void *)(v7 + 16) = v19;
  uint64_t v20 = v7 + 16 * v16;
  *(void *)(v20 + 32) = 0x5845444E49;
  *(void *)(v20 + 40) = 0xE500000000000000;
  if (a4)
  {
    unint64_t v21 = *(void *)(v7 + 24);
    uint64_t v22 = v16 + 2;
    if (v19 >= v21 >> 1)
    {
      sub_1A2CB5734(v21 > 1, v22, 1, v7);
      uint64_t v7 = v32;
    }
    *(void *)(v7 + 16) = v22;
    uint64_t v23 = v7 + 16 * v19;
    strcpy((char *)(v23 + 32), "IF NOT EXISTS");
    *(_WORD *)(v23 + 46) = -4864;
  }
  sub_1A2CF3DD0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  sub_1A2CF39F0();
  sub_1A2CF39F0();
  sub_1A2CF39F0();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  unint64_t v25 = *(void *)(v7 + 16);
  unint64_t v24 = *(void *)(v7 + 24);
  if (v25 >= v24 >> 1)
  {
    sub_1A2CB5734(v24 > 1, v25 + 1, 1, v7);
    uint64_t v7 = v30;
  }
  *(void *)(v7 + 16) = v25 + 1;
  uint64_t v26 = v7 + 16 * v25;
  *(void *)(v26 + 32) = 0xD000000000000015;
  *(void *)(v26 + 40) = 0x80000001A2CF8420;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
  return v7;
}

uint64_t sub_1A2CEF8A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v8 = sub_1A2CB2F04(a1, a2);
  swift_retain();
  swift_retain();
  sub_1A2CEE2F8(a1, a2, 1);
  sub_1A2CB0264(0, (unint64_t *)&qword_1EB5A68E0, MEMORY[0x1E4FBB320]);
  sub_1A2CB0330();
  *(void *)&v23[0] = sub_1A2CF3900();
  *((void *)&v23[0] + 1) = v9;
  swift_bridgeObjectRetain();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v10 = v23[0];
  sub_1A2CB37E4(v5 + 16, (uint64_t)v23);
  sub_1A2CB3174(0, (unint64_t *)&qword_1EB5A6880, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1EF5E1058, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Statement);
  swift_initStackObject();
  sub_1A2CAF0D4(1, v10, *((uint64_t *)&v10 + 1), v23);
  uint64_t v11 = sub_1A2CAF6B8(v8, (uint64_t (*)(void, void, uint64_t))sub_1A2CDC880);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    swift_bridgeObjectRetain();
    char v13 = (uint64_t *)(v11 + 40);
    uint64_t v14 = MEMORY[0x1E4FBC860];
    do
    {
      uint64_t v15 = *(v13 - 1);
      if (v15)
      {
        uint64_t v16 = *v13;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_9_7();
          sub_1A2CB7998();
          uint64_t v14 = v20;
        }
        unint64_t v18 = *(void *)(v14 + 16);
        unint64_t v17 = *(void *)(v14 + 24);
        if (v18 >= v17 >> 1)
        {
          OUTLINED_FUNCTION_23_1(v17);
          sub_1A2CB7998();
          uint64_t v14 = v21;
        }
        *(void *)(v14 + 16) = v18 + 1;
        uint64_t v19 = v14 + 16 * v18;
        *(void *)(v19 + 32) = v15;
        *(void *)(v19 + 40) = v16;
      }
      v13 += 2;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v4 = v3;
  }
  swift_bridgeObjectRelease();
  sub_1A2CB7874();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1A2CB0944();
  uint64_t result = swift_release();
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CEFB58(char a1)
{
  if (a1)
  {
    *(void *)&v6[0] = 0;
    *((void *)&v6[0] + 1) = 0xE000000000000000;
    sub_1A2CF3DD0();
    swift_bridgeObjectRelease();
    sub_1A2CB37E4(v1 + 16, (uint64_t)v6);
    sub_1A2CB3174(0, (unint64_t *)&qword_1EB5A6880, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1EF5E1058, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Statement);
    swift_initStackObject();
    uint64_t v3 = 0xD000000000000024;
    uint64_t v4 = 0x80000001A2CF8460;
  }
  else
  {
    sub_1A2CB37E4(v1 + 16, (uint64_t)v6);
    sub_1A2CB3174(0, (unint64_t *)&qword_1EB5A6880, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1EF5E1058, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Statement);
    swift_initStackObject();
    uint64_t v4 = 0x80000001A2CF8440;
    uint64_t v3 = 0xD00000000000001ALL;
  }
  sub_1A2CAF0D4(3, v3, v4, v6);
  sub_1A2CB0944();
  uint64_t result = swift_release();
  if (!v2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A2CEFCC8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1 + 16;
  type metadata accessor for Statement();
  char v9 = 0;
  uint64_t v4 = sub_1A2CDBF98();
  uint64_t v6 = v5;
  sub_1A2CB37E4(v3, (uint64_t)v8);
  uint64_t result = sub_1A2CAEF50(&v9, v4, v6, v8);
  *a2 = result;
  return result;
}

uint64_t Create<>.EntityMigration.init(migrate:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, void *a4@<X8>)
{
  *a4 = a3;
  a4[1] = result;
  a4[2] = a2;
  return result;
}

uint64_t Create<>.migrate<A>(from:ifNotExists:migrate:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (*(void *)(v7 + 56))
  {
    uint64_t v46 = a6;
    swift_retain();
    sub_1A2CBC6B4(1, 1);
    uint64_t result = OUTLINED_FUNCTION_25_1();
    if (v8) {
      return result;
    }
    uint64_t v11 = *(void *)(v46 + 8);
    uint64_t v12 = *(uint64_t (**)(uint64_t))(v11 + 32);
    swift_retain();
    uint64_t v13 = OUTLINED_FUNCTION_17_4();
    uint64_t v14 = v12(v13);
    uint64_t v44 = MEMORY[0x1E4FBB1A0];
    int64_t v45 = &protocol witness table for String;
    *(void *)&long long v43 = v14;
    *((void *)&v43 + 1) = v15;
    uint64_t v16 = swift_allocObject();
    OUTLINED_FUNCTION_16_3(v16);
    sub_1A2CB377C(&v43, v17);
    uint64_t v18 = sub_1A2CBD510(v16, 0, 0, 0xFFu);
    uint64_t v20 = v19;
    swift_release();
    swift_release();
    if (v18)
    {
      uint64_t v38 = (uint64_t *)(v20 + 32);
      OUTLINED_FUNCTION_19();
      uint64_t v21 = *(void *)(v20 + 32);
      OUTLINED_FUNCTION_19();
      uint64_t v23 = *(void *)(v21 + 24);
      uint64_t v22 = *(void *)(v21 + 32);
      unint64_t v24 = *(uint64_t (**)(void))(*(void *)(a7 + 8) + 40);
      swift_bridgeObjectRetain();
      uint64_t v25 = v24();
      if (!v22)
      {
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      if (v23 == v25 && v22 == v26)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v28 = OUTLINED_FUNCTION_12_7();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v28 & 1) == 0) {
          goto LABEL_26;
        }
      }
      uint64_t v29 = *v38;
      OUTLINED_FUNCTION_19();
      uint64_t v31 = *(void *)(v29 + 24);
      uint64_t v30 = *(void *)(v29 + 32);
      uint64_t v32 = *(uint64_t (**)(uint64_t))(v11 + 40);
      swift_bridgeObjectRetain();
      uint64_t v33 = OUTLINED_FUNCTION_17_4();
      uint64_t v34 = v32(v33);
      if (v30)
      {
        if (v31 == v34 && v30 == v35)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_26;
        }
        char v37 = OUTLINED_FUNCTION_12_7();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v37) {
          goto LABEL_26;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      sub_1A2CF00B0(a3, a4, a2 & 1, a5, v46, a7);
LABEL_26:
      swift_release();
      return swift_release();
    }
  }
  return sub_1A2CBC698(a2 & 1);
}

uint64_t sub_1A2CF00B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v42 = a3;
  uint64_t v9 = *(void *)(*(void *)v6 + 80);
  type metadata accessor for MigratableEntity();
  swift_getWitnessTable();
  type metadata accessor for Create();
  uint64_t v38 = v6 + 16;
  sub_1A2CB37E4(v6 + 16, (uint64_t)&v40);
  sub_1A2CBD344(&v40, 0, 0, 0);
  sub_1A2CBC39C(1, 1);
  uint64_t v10 = swift_release();
  sub_1A2CB0EB0(v10);
  if (!v7)
  {
    uint64_t v34 = v9;
    uint64_t v33 = v6;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(a6 + 8);
    type metadata accessor for Statement();
    char v43 = 4;
    uint64_t v39 = 0xF000000000000007;
    long long v40 = 0uLL;
    char v41 = -1;
    sub_1A2CBE824(&v39, (uint64_t)&v40, 0, 1, a4, v11);
    uint64_t v12 = sub_1A2CBE7DC();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    sub_1A2CB37E4(v38, (uint64_t)&v40);
    uint64_t v15 = sub_1A2CAEF50(&v43, v12, v14, &v40);
    uint64_t v17 = sub_1A2CB0EB0(v15);
    swift_release();
    swift_getWitnessTable();
    type metadata accessor for Save();
    sub_1A2CB37E4(v38, (uint64_t)&v40);
    uint64_t v18 = sub_1A2CAF090(&v40);
    *(void *)&long long v40 = v17;
    MEMORY[0x1F4188790](v18);
    sub_1A2CF3B50();
    swift_getWitnessTable();
    sub_1A2CF3A90();
    swift_bridgeObjectRelease();
    LOBYTE(v39) = 3;
    strcpy((char *)&v40, "DROP TABLE ");
    HIDWORD(v40) = -352321536;
    (*(void (**)(uint64_t))(v11 + 32))(a4);
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    long long v19 = v40;
    sub_1A2CB37E4(v38, (uint64_t)&v40);
    uint64_t v20 = sub_1A2CAEF50((char *)&v39, v19, *((uint64_t *)&v19 + 1), &v40);
    sub_1A2CB0EB0(v20);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void *)(a5 + 8);
    uint64_t v22 = type metadata accessor for Statement();
    LOBYTE(v39) = 2;
    *(void *)&long long v40 = 0;
    *((void *)&v40 + 1) = 0xE000000000000000;
    sub_1A2CF3DD0();
    swift_bridgeObjectRelease();
    strcpy((char *)&v40, "ALTER TABLE ");
    BYTE13(v40) = 0;
    HIWORD(v40) = -5120;
    sub_1A2CDD4A4(v34, a5);
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v21 + 32);
    v23(v34, v21);
    sub_1A2CF39F0();
    swift_bridgeObjectRelease();
    sub_1A2CF39F0();
    long long v24 = v40;
    sub_1A2CB37E4(v38, (uint64_t)&v40);
    uint64_t v25 = sub_1A2CAEF50((char *)&v39, v24, *((uint64_t *)&v24 + 1), &v40);
    sub_1A2CB0EB0(v25);
    uint64_t v37 = v21;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_1A2CBD238(v42 & 1);
    *(void *)&long long v40 = sub_1A2CF3AC0();
    if ((void)v40 == MEMORY[0x1A623EE80](v26, v22))
    {
      uint64_t v27 = v34;
    }
    else
    {
      uint64_t v27 = v34;
      do
      {
        char v30 = sub_1A2CF3B10();
        sub_1A2CF3AF0();
        if (v30) {
          swift_retain();
        }
        else {
          sub_1A2CF3DF0();
        }
        swift_bridgeObjectRetain();
        MEMORY[0x1A623EE90](&v40, v26, v22);
        uint64_t v31 = swift_bridgeObjectRelease();
        sub_1A2CB0EB0(v31);
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v32 = v40;
      }
      while (v32 != MEMORY[0x1A623EE80](v26, v22));
    }
    swift_bridgeObjectRelease();
    if (*(void *)(v33 + 56))
    {
      swift_retain();
      v23(v27, v37);
      (*(void (**)(uint64_t, uint64_t))(v37 + 40))(v27, v37);
      char v28 = sub_1A2CE1370();
      sub_1A2CEF8A8((uint64_t)v28, v29);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  return swift_release();
}

uint64_t Create<>.migrate<A>(from:ifNotExists:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v58 = a2;
  if (!v6[7]) {
    return OUTLINED_FUNCTION_18_4();
  }
  uint64_t v9 = *v6;
  swift_retain();
  sub_1A2CBC6B4(1, 1);
  uint64_t result = OUTLINED_FUNCTION_25_1();
  if (v7) {
    return result;
  }
  uint64_t v12 = *(void *)(v9 + 80);
  uint64_t v13 = *(void *)(a5 + 8);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 32);
  swift_retain();
  uint64_t v15 = v14(v12, v13);
  uint64_t v56 = MEMORY[0x1E4FBB1A0];
  uint64_t v57 = &protocol witness table for String;
  *(void *)&long long v55 = v15;
  *((void *)&v55 + 1) = v16;
  uint64_t v17 = swift_allocObject();
  OUTLINED_FUNCTION_16_3(v17);
  sub_1A2CB377C(&v55, v18);
  uint64_t v19 = sub_1A2CBD510(v17, 0, 0, 0xFFu);
  uint64_t v50 = v20;
  swift_release();
  swift_release();
  uint64_t v45 = v13;
  if (!v19) {
    return OUTLINED_FUNCTION_18_4();
  }
  if (!a3)
  {
LABEL_25:
    OUTLINED_FUNCTION_18_4();
    swift_release();
    return swift_release();
  }
  uint64_t v21 = a1;
  uint64_t v22 = (uint64_t *)(a4 & 0xFFFFFFFFFFFFFFFELL);
  int64_t v51 = (uint64_t *)(v50 + 32);
  OUTLINED_FUNCTION_19();
  uint64_t v23 = (uint64_t *)(a6 & 0xFFFFFFFFFFFFFFFELL);
  while (1)
  {
    uint64_t v54 = a3;
    uint64_t v24 = *v22;
    uint64_t v25 = *v23;
    uint64_t v46 = *(void *)(*(void *)v21 + 8);
    uint64_t v26 = *(void *)(*(void *)v21 + 16);
    uint64_t v27 = *v51;
    OUTLINED_FUNCTION_19();
    uint64_t v29 = *(void *)(v27 + 24);
    uint64_t v28 = *(void *)(v27 + 32);
    uint64_t v47 = v25;
    uint64_t v30 = *(void *)(v25 + 8);
    uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t))(v30 + 40);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v32 = v31(v24, v30);
    if (!v28)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v48 = v26;
    if (v29 == v32 && v28 == v33)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v35 = OUTLINED_FUNCTION_12_7();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v35 & 1) == 0)
      {
        swift_release();
LABEL_14:
        uint64_t v36 = v54;
        goto LABEL_24;
      }
    }
    uint64_t v37 = *v51;
    OUTLINED_FUNCTION_19();
    uint64_t v39 = *(void *)(v37 + 24);
    uint64_t v38 = *(void *)(v37 + 32);
    long long v40 = *(uint64_t (**)(void))(v45 + 40);
    swift_bridgeObjectRetain();
    uint64_t v41 = v40();
    uint64_t v36 = v54;
    if (!v38) {
      break;
    }
    if (v39 == v41 && v38 == v42)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v44 = OUTLINED_FUNCTION_12_7();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v44 & 1) == 0) {
        goto LABEL_29;
      }
      swift_release();
    }
LABEL_24:
    v21 += 8;
    ++v23;
    ++v22;
    a3 = v36 - 1;
    if (!a3) {
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
LABEL_29:
  swift_retain();
  sub_1A2CF00B0(v46, v48, v58 & 1, v24, a5, v47);
  swift_release();
  swift_release();
  return swift_release_n();
}

uint64_t sub_1A2CF0B34(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v30 = a2;
  uint64_t v6 = *(void *)(*(void *)a4 + 80);
  uint64_t v26 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v29 = (char *)&v25 - v7;
  uint64_t v8 = *(void *)(v6 + 16);
  uint64_t v9 = sub_1A2CF3D40();
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (uint64_t (*)(uint64_t))((char *)&v25 - v16);
  uint64_t v18 = v31;
  uint64_t result = v30(a1);
  if (!v18)
  {
    uint64_t v25 = v15;
    uint64_t v30 = v17;
    uint64_t v21 = v27;
    uint64_t v20 = v28;
    uint64_t v31 = a4;
    uint64_t v22 = (uint64_t)v29;
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v8) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v12, v9);
    }
    else
    {
      uint64_t v23 = v30;
      (*(void (**)(uint64_t (*)(uint64_t), char *, uint64_t))(v21 + 32))(v30, v12, v8);
      uint64_t v24 = (uint64_t)v25;
      (*(void (**)(char *, uint64_t (*)(uint64_t), uint64_t))(v21 + 16))(v25, v23, v8);
      sub_1A2CDD234(v24, v8, v22);
      sub_1A2CDC544(v22);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v22, v6);
      return (*(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))(v21 + 8))(v23, v8);
    }
  }
  return result;
}

uint64_t sub_1A2CF0E28()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t method lookup function for Create(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Create);
}

uint64_t dispatch thunk of Create.table(ifNotExists:shouldVersion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1A2CF0EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_retain();
  return a1;
}

uint64_t sub_1A2CF0EF0()
{
  return swift_release();
}

void *sub_1A2CF0EF8(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A2CF0F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for Create<>.EntityMigration()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1A2CF0F90(uint64_t a1)
{
  return sub_1A2CF0B34(a1, *(uint64_t (**)(uint64_t))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

void sub_1A2CF0FB4()
{
  if (!qword_1E959F3C8)
  {
    sub_1A2CAFD2C();
    unint64_t v0 = type metadata accessor for Drop();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959F3C8);
    }
  }
}

uint64_t sub_1A2CF1010(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_1A2CF1028(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_1A2CF1028(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1A2CF1038@<X0>(uint64_t *a1@<X8>)
{
  return sub_1A2CEFCC8(v1, a1);
}

void sub_1A2CF1058()
{
  if (!qword_1E959F330)
  {
    sub_1A2CB3794(255, qword_1EB5A62A0);
    unint64_t v0 = sub_1A2CF3D40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E959F330);
    }
  }
}

uint64_t sub_1A2CF10C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A2CF12A0();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A2CF5F40;
  *(void *)(inited + 32) = 25705;
  *(void *)(inited + 40) = 0xE200000000000000;
  *(void *)(inited + 48) = 61;
  *(void *)(inited + 56) = 0xE100000000000000;
  sub_1A2CBB018();
  sub_1A2CF3D70();
  sub_1A2CF39F0();
  swift_bridgeObjectRelease();
  sub_1A2CF39F0();
  *(void *)(inited + 64) = 39;
  *(void *)(inited + 72) = 0xE100000000000000;
  return sub_1A2CF12EC(inited, a3, a4);
}

uint64_t sub_1A2CF11CC()
{
  return sub_1A2CB02B4();
}

uint64_t sub_1A2CF1214(uint64_t a1, uint64_t a2)
{
  return sub_1A2CF12EC(MEMORY[0x1E4FBC860], a1, a2);
}

uint64_t sub_1A2CF1228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A2CF12A0();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A2CF49A0;
  *(void *)(inited + 32) = sub_1A2CBF200();
  *(void *)(inited + 40) = v6;
  return sub_1A2CF12EC(inited, a2, a3);
}

void sub_1A2CF12A0()
{
  if (!qword_1EB5A6930)
  {
    unint64_t v0 = sub_1A2CF4050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB5A6930);
    }
  }
}

uint64_t sub_1A2CF12EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1A2CB5734(0, 1, 1, MEMORY[0x1E4FBC860]);
  uint64_t v7 = v6;
  unint64_t v9 = *(void *)(v6 + 16);
  unint64_t v8 = *(void *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    sub_1A2CB5734(v8 > 1, v9 + 1, 1, v6);
    uint64_t v7 = v21;
  }
  *(void *)(v7 + 16) = v9 + 1;
  uint64_t v10 = v7 + 16 * v9;
  *(void *)(v10 + 32) = 0x46204554454C4544;
  *(void *)(v10 + 40) = 0xEB000000004D4F52;
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 8) + 32))(a2);
  uint64_t v13 = v12;
  unint64_t v15 = *(void *)(v7 + 16);
  unint64_t v14 = *(void *)(v7 + 24);
  unint64_t v16 = v15 + 1;
  if (v15 >= v14 >> 1)
  {
    sub_1A2CB5734(v14 > 1, v15 + 1, 1, v7);
    uint64_t v7 = v22;
  }
  *(void *)(v7 + 16) = v16;
  uint64_t v17 = v7 + 16 * v15;
  *(void *)(v17 + 32) = v11;
  *(void *)(v17 + 40) = v13;
  if (*(void *)(a1 + 16))
  {
    unint64_t v18 = *(void *)(v7 + 24);
    if (v16 >= v18 >> 1)
    {
      sub_1A2CB5734(v18 > 1, v15 + 2, 1, v7);
      uint64_t v7 = v23;
    }
    *(void *)(v7 + 16) = v15 + 2;
    uint64_t v19 = v7 + 16 * v16;
    *(void *)(v19 + 32) = 0x4552454857;
    *(void *)(v19 + 40) = 0xE500000000000000;
    sub_1A2CB4ECC();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t type metadata accessor for DeleteCommand()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Date.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1A2CF3590();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 3;
  return result;
}

uint64_t Date.queryValue.getter()
{
  return 0;
}

uint64_t dispatch thunk of StatementChainType.saveChain(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static StatementChainType.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static StatementChainType.createTableChain(for:ifNotExists:shouldVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t String.valueType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2CF155C@<X0>(uint64_t a1@<X8>)
{
  return String.valueType.getter(*v1, v1[1], a1);
}

uint64_t LazyLoader.load()@<X0>(void *a1@<X8>)
{
  id v38 = a1;
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v35 - v6;
  uint64_t State = type metadata accessor for LazyLoader.LoadState();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v36 = (void *)((char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v12);
  unint64_t v15 = (char *)v35 - v14;
  sub_1A2CF3620();
  uint64_t v16 = v1 + *(void *)(*(void *)v1 + 104);
  swift_beginAccess();
  uint64_t v37 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v16, State);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = v15;
LABEL_10:
    (*(void (**)(id, char *, uint64_t))(v4 + 32))(v38, v7, v2);
    return sub_1A2CF1C70();
  }
  if (EnumCaseMultiPayload != 1)
  {
    swift_willThrow();
    return sub_1A2CF1C70();
  }
  unint64_t v18 = (void *)*((void *)v15 + 1);
  uint64_t v19 = v39;
  (*(void (**)(void))v15)();
  if (!v19)
  {
    swift_release();
    (*(void (**)(void *, char *, uint64_t))(v4 + 16))(v36, v7, v2);
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_3_17();
    uint64_t v32 = OUTLINED_FUNCTION_1_21();
    v33(v32);
    swift_endAccess();
    goto LABEL_10;
  }
  uint64_t v39 = v18;
  if (qword_1EB5A61F0 != -1) {
    swift_once();
  }
  id v38 = (id)qword_1EB5A8268;
  v35[3] = sub_1A2CF3C00();
  sub_1A2CC845C();
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1A2CF4990;
  uint64_t v21 = sub_1A2CF41E0();
  uint64_t v23 = v22;
  uint64_t v24 = MEMORY[0x1E4FBB1A0];
  *(void *)(v20 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v25 = sub_1A2CC84C4();
  *(void *)(v20 + 64) = v25;
  *(void *)(v20 + 32) = v21;
  *(void *)(v20 + 40) = v23;
  uint64_t v40 = 0;
  unint64_t v41 = 0xE000000000000000;
  uint64_t v42 = v19;
  sub_1A2CB3794(0, (unint64_t *)&qword_1EB5A6950);
  sub_1A2CF3EF0();
  uint64_t v26 = v40;
  unint64_t v27 = v41;
  *(void *)(v20 + 96) = v24;
  *(void *)(v20 + 104) = v25;
  *(void *)(v20 + 72) = v26;
  *(void *)(v20 + 80) = v27;
  uint64_t v28 = v38;
  sub_1A2CF3720();

  swift_bridgeObjectRelease();
  *uint64_t v36 = v19;
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_3_17();
  id v29 = v19;
  uint64_t v30 = OUTLINED_FUNCTION_1_21();
  v31(v30);
  swift_endAccess();
  swift_willThrow();
  swift_release();
  return sub_1A2CF1C70();
}

uint64_t type metadata accessor for LazyLoader.LoadState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t LazyLoader.__allocating_init(object:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  LazyLoader.init(object:)(a1);
  return v2;
}

uint64_t LazyLoader.__allocating_init(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  LazyLoader.init(block:)(a1, a2);
  return v4;
}

uint64_t *LazyLoader.init(object:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1A2CF3650();
  MEMORY[0x1F4188790](v4 - 8);
  OUTLINED_FUNCTION_2_15();
  uint64_t v6 = *(void *)(v5 + 112);
  sub_1A2CF3640();
  sub_1A2CF3670();
  swift_allocObject();
  *(uint64_t *)((char *)v1 + v6) = sub_1A2CF3660();
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(*(void *)(v3 + 80) - 8) + 32))((uint64_t)v1 + *(void *)(*v1 + 104), a1, *(void *)(v3 + 80));
  type metadata accessor for LazyLoader.LoadState();
  swift_storeEnumTagMultiPayload();
  return v1;
}

uint64_t LazyLoader.init(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1A2CF3650();
  MEMORY[0x1F4188790](v6 - 8);
  OUTLINED_FUNCTION_2_15();
  uint64_t v8 = *(void *)(v7 + 112);
  sub_1A2CF3640();
  sub_1A2CF3670();
  swift_allocObject();
  *(void *)(v2 + v8) = sub_1A2CF3660();
  uint64_t v9 = (void *)(v3 + *(void *)(*(void *)v3 + 104));
  *uint64_t v9 = a1;
  v9[1] = a2;
  type metadata accessor for LazyLoader.LoadState();
  swift_storeEnumTagMultiPayload();
  return v3;
}

uint64_t sub_1A2CF1C70()
{
  return sub_1A2CF3630();
}

uint64_t LazyLoader.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t State = type metadata accessor for LazyLoader.LoadState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(State - 8) + 8))(v1, State);
  swift_release();
  return v0;
}

uint64_t LazyLoader.__deallocating_deinit()
{
  LazyLoader.deinit();
  return swift_deallocClassInstance();
}

uint64_t LazyLoader.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 80);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v5;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v17[-1] - v11;
  uint64_t v13 = (uint64_t)__swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1A2CF4180();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v17, v17[3]);
    sub_1A2CF4090();
    uint64_t v15 = v18;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v9, v12, v4);
    uint64_t v13 = LazyLoader.__allocating_init(object:)((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v13;
}

uint64_t LazyLoader.encode(to:)()
{
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  uint64_t v6 = (void *)MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v11[-v7 - 8];
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_1A2CF41A0();
  LazyLoader.load()(v8);
  if (!v1)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v11, v12);
    sub_1A2CF40B0();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v8, v2);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_1A2CF20C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = LazyLoader.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1A2CF20F4()
{
  return LazyLoader.encode(to:)();
}

uint64_t sub_1A2CF2118()
{
  uint64_t result = type metadata accessor for LazyLoader.LoadState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for LazyLoader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LazyLoader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LazyLoader);
}

uint64_t dispatch thunk of LazyLoader.__allocating_init(object:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LazyLoader.__allocating_init(block:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1A2CF2214()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_1A2CF22B8(char *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16;
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
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 3;
    if (v9 >= 3)
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
          int v13 = (v12 | (v10 << (8 * v5))) + 3;
          unsigned int v9 = v12 + 3;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 2)
    {
      uint64_t v16 = *(void *)a2;
      id v17 = *(id *)a2;
      *(void *)uint64_t v3 = v16;
      v3[v5] = 2;
      return v3;
    }
    if (v9 != 1)
    {
      (*(void (**)(char *))(v4 + 16))(a1);
      v3[v5] = 0;
      return v3;
    }
    uint64_t v14 = *((void *)a2 + 1);
    *(void *)uint64_t v3 = *(void *)a2;
    *((void *)v3 + 1) = v14;
    v3[v5] = 1;
  }
  swift_retain();
  return v3;
}

void sub_1A2CF245C(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x10) {
    unint64_t v2 = 16;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 3;
  if (v3 >= 3)
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
        int v7 = (v6 | (v4 << (8 * v2))) + 3;
        unsigned int v3 = v6 + 3;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 2)
  {
  }
  else if (v3 == 1)
  {
    swift_release();
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_1A2CF256C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 3;
  if (v5 >= 3)
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
        int v9 = (v8 | (v6 << (8 * v4))) + 3;
        unsigned int v5 = v8 + 3;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 2)
  {
    uint64_t v11 = *(void *)a2;
    id v12 = *(id *)a2;
    *a1 = v11;
    *((unsigned char *)a1 + v4) = 2;
  }
  else if (v5 == 1)
  {
    uint64_t v10 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v10;
    *((unsigned char *)a1 + v4) = 1;
    swift_retain();
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    *((unsigned char *)a1 + v4) = 0;
  }
  return a1;
}

unsigned __int8 *sub_1A2CF26D4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 3;
    if (v8 >= 3)
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
          int v12 = (v11 | (v9 << (8 * v7))) + 3;
          unsigned int v8 = v11 + 3;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 2)
    {
    }
    else if (v8 == 1)
    {
      swift_release();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 3;
    if (v13 >= 3)
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
          goto LABEL_30;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_30;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_30;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_30:
          int v17 = (v16 | (v14 << (8 * v7))) + 3;
          unsigned int v13 = v16 + 3;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 2)
    {
      uint64_t v19 = *(void **)a2;
      id v20 = v19;
      *(void *)a1 = v19;
      a1[v7] = 2;
    }
    else if (v13 == 1)
    {
      uint64_t v18 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v18;
      a1[v7] = 1;
      swift_retain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

void *sub_1A2CF2928(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 3;
  if (v5 >= 3)
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
        int v9 = (v8 | (v6 << (8 * v4))) + 3;
        unsigned int v5 = v8 + 3;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 2)
  {
    *a1 = *(void *)a2;
    char v10 = 2;
  }
  else if (v5 == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
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

unsigned __int8 *sub_1A2CF2A78(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 3;
    if (v8 >= 3)
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
          int v12 = (v11 | (v9 << (8 * v7))) + 3;
          unsigned int v8 = v11 + 3;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 2)
    {
    }
    else if (v8 == 1)
    {
      swift_release();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 3;
    if (v13 >= 3)
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
          goto LABEL_30;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_30;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_30;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_30:
          int v17 = (v16 | (v14 << (8 * v7))) + 3;
          unsigned int v13 = v16 + 3;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 2)
    {
      *(void *)a1 = *(void *)a2;
      char v18 = 2;
    }
    else if (v13 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
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

uint64_t sub_1A2CF2CBC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 16;
  if (*(void *)(v3 + 64) > 0x10uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 253) >> v6) + 1;
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
      if (v11 >= 3) {
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
  return (v5 | v10) + 254;
}

void sub_1A2CF2DF0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10) {
    unint64_t v5 = 16;
  }
  size_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if (a3 < 0xFE)
  {
    int v8 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v9 = a2 - 254;
    if (v6 < 4)
    {
      int v10 = (v9 >> v7) + 1;
      if (v5 != -1)
      {
        int v12 = v9 & ~(-1 << v7);
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v6] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v10;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1A2CF2FB4);
      case 4:
        *(_DWORD *)&a1[v6] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
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

uint64_t sub_1A2CF2FDC(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 16;
  if (*(void *)(v2 + 64) > 0x10uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 3;
  if (v4 >= 3)
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
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 3;
        LODWORD(v4) = v7 + 3;
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

void sub_1A2CF3094(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    size_t v4 = 16;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 2)
  {
    unsigned int v5 = a2 - 3;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 3;
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
      a1[v4] = 3;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

unsigned char *storeEnumTagSinglePayload for LazyLoaderError(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A2CF3208);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LazyLoaderError()
{
  return &type metadata for LazyLoaderError;
}

unint64_t sub_1A2CF3244()
{
  unint64_t result = qword_1E959F3D0;
  if (!qword_1E959F3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959F3D0);
  }
  return result;
}

uint64_t sub_1A2CF3298()
{
  return sub_1A2CF4140();
}

uint64_t Double.queryValue.getter()
{
  return 0;
}

void static Double.dataType.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t Double.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16) == 3) {
    return __swift_destroy_boxed_opaque_existential_1(a2);
  }
  uint64_t result = sub_1A2CF3F30();
  __break(1u);
  return result;
}

void Double.valueType.getter(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 3;
}

void sub_1A2CF33C8(uint64_t a1@<X8>)
{
  Double.valueType.getter(a1, *v1);
}

uint64_t sub_1A2CF33D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = Double.init(valueType:connection:)(a1, a2);
  *a3 = v5;
  return result;
}

uint64_t sub_1A2CF33F8()
{
  return Double.queryValue.getter();
}

uint64_t sub_1A2CF3400()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1A2CF3410()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1A2CF3420()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1A2CF3430()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1A2CF3440()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1A2CF3450()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1A2CF3460()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1A2CF3470()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1A2CF3480()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A2CF3490()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1A2CF34A0()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1A2CF34B0()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1A2CF34C0()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A2CF34D0()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_1A2CF34E0()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_1A2CF34F0()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_1A2CF3500()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1A2CF3510()
{
  return MEMORY[0x1F40E4C48]();
}

uint64_t sub_1A2CF3520()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1A2CF3530()
{
  return MEMORY[0x1F40E4D80]();
}

uint64_t sub_1A2CF3540()
{
  return MEMORY[0x1F40E4DD0]();
}

uint64_t sub_1A2CF3550()
{
  return MEMORY[0x1F40E4E50]();
}

uint64_t sub_1A2CF3560()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1A2CF3570()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1A2CF3580()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1A2CF3590()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1A2CF35A0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1A2CF35B0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1A2CF35C0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1A2CF35D0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A2CF35E0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A2CF35F0()
{
  return MEMORY[0x1F415D9B0]();
}

uint64_t sub_1A2CF3600()
{
  return MEMORY[0x1F415D9C0]();
}

uint64_t sub_1A2CF3610()
{
  return MEMORY[0x1F415D9C8]();
}

uint64_t sub_1A2CF3620()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1A2CF3630()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1A2CF3640()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1A2CF3650()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1A2CF3660()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1A2CF3670()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1A2CF3680()
{
  return MEMORY[0x1F415DD30]();
}

uint64_t sub_1A2CF3690()
{
  return MEMORY[0x1F415E5A8]();
}

uint64_t sub_1A2CF36A0()
{
  return MEMORY[0x1F415E978]();
}

uint64_t sub_1A2CF36B0()
{
  return MEMORY[0x1F415E980]();
}

uint64_t sub_1A2CF36C0()
{
  return MEMORY[0x1F415EB28]();
}

uint64_t sub_1A2CF36D0()
{
  return MEMORY[0x1F415EC48]();
}

uint64_t sub_1A2CF36E0()
{
  return MEMORY[0x1F415ECC0]();
}

uint64_t sub_1A2CF36F0()
{
  return MEMORY[0x1F415ECC8]();
}

uint64_t sub_1A2CF3700()
{
  return MEMORY[0x1F415ED08]();
}

uint64_t sub_1A2CF3710()
{
  return MEMORY[0x1F415EE18]();
}

uint64_t sub_1A2CF3720()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1A2CF3730()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A2CF3740()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A2CF3750()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A2CF3760()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1A2CF3770()
{
  return MEMORY[0x1F4186C80]();
}

uint64_t sub_1A2CF3780()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1A2CF3790()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1A2CF37A0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A2CF37B0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A2CF37C0()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1A2CF37D0()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1A2CF37E0()
{
  return MEMORY[0x1F4186E98]();
}

uint64_t sub_1A2CF37F0()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t sub_1A2CF3800()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1A2CF3810()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1A2CF3820()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1A2CF3830()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1A2CF3840()
{
  return MEMORY[0x1F415EFC0]();
}

uint64_t sub_1A2CF3850()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A2CF3860()
{
  return MEMORY[0x1F41833D0]();
}

uint64_t sub_1A2CF3870()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1A2CF3880()
{
  return MEMORY[0x1F4183420]();
}

uint64_t sub_1A2CF3890()
{
  return MEMORY[0x1F4183438]();
}

uint64_t sub_1A2CF38A0()
{
  return MEMORY[0x1F4183498]();
}

uint64_t sub_1A2CF38B0()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1A2CF38C0()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1A2CF38D0()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1A2CF38E0()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1A2CF38F0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A2CF3900()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A2CF3910()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1A2CF3920()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1A2CF3930()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1A2CF3940()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A2CF3950()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A2CF3960()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A2CF3970()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A2CF3980()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A2CF3990()
{
  return MEMORY[0x1F4183920]();
}

uint64_t sub_1A2CF39A0()
{
  return MEMORY[0x1F4183928]();
}

uint64_t sub_1A2CF39B0()
{
  return MEMORY[0x1F4183940]();
}

uint64_t sub_1A2CF39C0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A2CF39D0()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1A2CF39E0()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1A2CF39F0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A2CF3A00()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1A2CF3A10()
{
  return MEMORY[0x1F4183A68]();
}

uint64_t sub_1A2CF3A20()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1A2CF3A30()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A2CF3A40()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1A2CF3A50()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1A2CF3A60()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1A2CF3A70()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A2CF3A80()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A2CF3A90()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1A2CF3AA0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A2CF3AB0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A2CF3AC0()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1A2CF3AD0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A2CF3AE0()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1A2CF3AF0()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1A2CF3B00()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A2CF3B10()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1A2CF3B20()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A2CF3B30()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1A2CF3B40()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1A2CF3B50()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A2CF3B60()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1A2CF3B70()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1A2CF3B80()
{
  return MEMORY[0x1F4184080]();
}

uint64_t sub_1A2CF3B90()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1A2CF3BA0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1A2CF3BB0()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1A2CF3BC0()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A2CF3BD0()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A2CF3BE0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A2CF3BF0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1A2CF3C00()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A2CF3C10()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1A2CF3C20()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1A2CF3C30()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A2CF3C40()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A2CF3C50()
{
  return MEMORY[0x1F41870C0]();
}

uint64_t sub_1A2CF3C60()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1A2CF3C70()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1A2CF3C80()
{
  return MEMORY[0x1F41870F0]();
}

uint64_t sub_1A2CF3C90()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1A2CF3CA0()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1A2CF3CB0()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1A2CF3CC0()
{
  return MEMORY[0x1F4187198]();
}

uint64_t sub_1A2CF3CD0()
{
  return MEMORY[0x1F41871A8]();
}

uint64_t sub_1A2CF3CE0()
{
  return MEMORY[0x1F41871B0]();
}

uint64_t sub_1A2CF3CF0()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1A2CF3D00()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1A2CF3D10()
{
  return MEMORY[0x1F4187248]();
}

uint64_t sub_1A2CF3D20()
{
  return MEMORY[0x1F41872D0]();
}

uint64_t sub_1A2CF3D30()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1A2CF3D40()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A2CF3D50()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A2CF3D60()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A2CF3D70()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1A2CF3D90()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A2CF3DA0()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1A2CF3DC0()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1A2CF3DD0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A2CF3DE0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A2CF3DF0()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1A2CF3E00()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A2CF3E10()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1A2CF3E20()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A2CF3E30()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1A2CF3E40()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1A2CF3E50()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A2CF3E60()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A2CF3E70()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1A2CF3E80()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A2CF3E90()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A2CF3EA0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A2CF3EB0()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1A2CF3EC0()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1A2CF3ED0()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1A2CF3EE0()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1A2CF3EF0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A2CF3F00()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1A2CF3F10()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1A2CF3F20()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A2CF3F30()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A2CF3F40()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A2CF3F50()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A2CF3F60()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1A2CF3F70()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A2CF3F80()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A2CF3F90()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A2CF3FA0()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1A2CF3FB0()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A2CF3FC0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A2CF3FD0()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1A2CF3FE0()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A2CF3FF0()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A2CF4000()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1A2CF4010()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A2CF4020()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A2CF4030()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1A2CF4040()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A2CF4050()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1A2CF4060()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1A2CF4070()
{
  return MEMORY[0x1F4185A08]();
}

uint64_t sub_1A2CF4080()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A2CF4090()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1A2CF40A0()
{
  return MEMORY[0x1F4185AC0]();
}

uint64_t sub_1A2CF40B0()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1A2CF40C0()
{
  return MEMORY[0x1F4185B68]();
}

uint64_t sub_1A2CF40D0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A2CF40E0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A2CF40F0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A2CF4100()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A2CF4110()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A2CF4120()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A2CF4130()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A2CF4140()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A2CF4150()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1A2CF4160()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1A2CF4170()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1A2CF4180()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1A2CF4190()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A2CF41A0()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1A2CF41B0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A2CF41E0()
{
  return MEMORY[0x1F4186318]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
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
  return (void *)MEMORY[0x1F40CCB10](__size);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1F41868A8]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1F41868B0]();
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

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1F41868D0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1F41868D8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}