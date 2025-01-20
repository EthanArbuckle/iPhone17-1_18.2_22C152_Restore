uint64_t sub_3A28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  unint64_t v16;
  char v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  long long v29;
  long long v30;
  long long v31;

  v4 = sub_4388(&qword_144C8);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16)) {
    goto LABEL_16;
  }
  v7 = sub_6440(0x6E6F697461727564, 0xE800000000000000);
  if ((v8 & 1) == 0) {
    goto LABEL_16;
  }
  sub_4418(*(void *)(a1 + 56) + 48 * v7, (uint64_t)&v29);
  sub_4388(&qword_144D0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_16;
  }
  v9 = v28;
  v10 = sub_6440(0x756F4372656D6974, 0xEA0000000000746ELL);
  if ((v11 & 1) == 0) {
    goto LABEL_16;
  }
  sub_4418(*(void *)(a1 + 56) + 48 * v10, (uint64_t)&v29);
  if ((swift_dynamicCast() & 1) != 0
    && *(void *)(a1 + 16)
    && (v12 = v28, v13 = sub_6440(0xD000000000000018, 0x800000000000E7A0), (v14 & 1) != 0)
    && (sub_4418(*(void *)(a1 + 56) + 48 * v13, (uint64_t)&v29), (swift_dynamicCast() & 1) != 0)
    && *(void *)(a1 + 16)
    && (v15 = v28, v16 = sub_6440(0xD00000000000001ALL, 0x800000000000E7C0), (v17 & 1) != 0)
    && (sub_4418(*(void *)(a1 + 56) + 48 * v16, (uint64_t)&v29), (swift_dynamicCast() & 1) != 0))
  {
    v18 = v28;
    if (*(void *)(a1 + 16) && (v19 = sub_6440(0x65736E6F70736572, 0xEC00000065646F4DLL), (v20 & 1) != 0))
    {
      sub_4418(*(void *)(a1 + 56) + 48 * v19, (uint64_t)&v29);
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v30 + 1))
    {
      v23 = sub_D620();
      v24 = swift_dynamicCast();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, v24 ^ 1u, 1, v23);
    }
    else
    {
      sub_447C((uint64_t)&v29);
      v25 = sub_D620();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v6, 1, 1, v25);
    }
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v12;
    *(unsigned char *)(a2 + 16) = v15;
    v26 = type metadata accessor for TimeSuggestionExecutionParameters();
    sub_44DC((uint64_t)v6, a2 + *(int *)(v26 + 28));
    *(unsigned char *)(a2 + *(int *)(v26 + 32)) = v18;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(a2, 0, 1, v26);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    v21 = type metadata accessor for TimeSuggestionExecutionParameters();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a2, 1, 1, v21);
  }
}

uint64_t sub_3DF0()
{
  sub_D6A0();
  swift_allocObject();
  uint64_t result = sub_D6B0();
  qword_14B68 = result;
  return result;
}

uint64_t sub_3E44()
{
  sub_4388(&qword_144C0);
  sub_D5B0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_DE40;
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  sub_D5A0();
  uint64_t result = nullsub_1(v0);
  qword_14B70 = result;
  return result;
}

uint64_t sub_4388(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for TimeSuggestionExecutionParameters()
{
  uint64_t result = qword_14538;
  if (!qword_14538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_4418(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_447C(uint64_t a1)
{
  uint64_t v2 = sub_4388(&qword_144D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_44DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4388(&qword_144C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_4544(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v7 = *(int *)(a3 + 28);
    v8 = (void *)(a1 + v7);
    v9 = (char *)a2 + v7;
    uint64_t v10 = sub_D620();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = sub_4388(&qword_144C8);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *((unsigned char *)v4 + *(int *)(a3 + 32)) = *((unsigned char *)a2 + *(int *)(a3 + 32));
  }
  return v4;
}

uint64_t sub_46CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 28);
  uint64_t v3 = sub_D620();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

uint64_t sub_47A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_D620();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_4388(&qword_144C8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 32)) = *(unsigned char *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_48D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_D620();
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
    uint64_t v14 = sub_4388(&qword_144C8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(unsigned char *)(a1 + *(int *)(a3 + 32)) = *(unsigned char *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_4A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_D620();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_4388(&qword_144C8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(unsigned char *)(a1 + *(int *)(a3 + 32)) = *(unsigned char *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_4BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_D620();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_4388(&qword_144C8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(unsigned char *)(a1 + *(int *)(a3 + 32)) = *(unsigned char *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_4D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_4D6C);
}

uint64_t sub_4D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = sub_4388(&qword_144C8);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 28);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_4E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_4E34);
}

uint64_t sub_4E34(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 16) = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_4388(&qword_144C8);
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_4EDC()
{
  sub_4F84();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_4F84()
{
  if (!qword_14548)
  {
    sub_D620();
    unint64_t v0 = sub_DA30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14548);
    }
  }
}

uint64_t sub_4FDC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000000000E730;
  uint64_t v4 = a1;
  uint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEA00000000006D72;
      uint64_t v5 = 0x616C416E41746573;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xEB000000006D7261;
      uint64_t v5 = 0x6C41657461647075;
      break;
    case 4:
      unint64_t v3 = 0x800000000000E750;
      break;
    case 5:
      unint64_t v3 = 0xEC00000074497349;
      unsigned int v6 = 1952540791;
      goto LABEL_7;
    case 6:
      unint64_t v3 = 0xEC000000746E6948;
      uint64_t v5 = 0x72656D6954746573;
      break;
    case 7:
      unint64_t v3 = 0xEC00000072656D69;
      uint64_t v5 = 0x547373696D736964;
      break;
    case 8:
      unint64_t v3 = 0xEB0000000072656DLL;
      uint64_t v5 = 0x6954686372616573;
      break;
    default:
      unint64_t v3 = 0xE900000000000072;
      unsigned int v6 = 1098147187;
LABEL_7:
      uint64_t v5 = v6 | 0x656D695400000000;
      break;
  }
  unint64_t v7 = 0x800000000000E730;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEA00000000006D72;
      if (v5 == 0x616C416E41746573) {
        goto LABEL_26;
      }
      goto LABEL_29;
    case 2:
      goto LABEL_25;
    case 3:
      unint64_t v7 = 0xEB000000006D7261;
      if (v5 != 0x6C41657461647075) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 4:
      unint64_t v7 = 0x800000000000E750;
      if (v5 != 0xD000000000000010) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 5:
      unint64_t v7 = 0xEC00000074497349;
      unsigned int v8 = 1952540791;
      goto LABEL_20;
    case 6:
      unint64_t v7 = 0xEC000000746E6948;
      if (v5 != 0x72656D6954746573) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 7:
      unint64_t v7 = 0xEC00000072656D69;
      unint64_t v2 = 0x547373696D736964;
LABEL_25:
      if (v5 == v2) {
        goto LABEL_26;
      }
      goto LABEL_29;
    case 8:
      unint64_t v7 = 0xEB0000000072656DLL;
      if (v5 != 0x6954686372616573) {
        goto LABEL_29;
      }
      goto LABEL_26;
    default:
      unint64_t v7 = 0xE900000000000072;
      unsigned int v8 = 1098147187;
LABEL_20:
      if (v5 != (v8 | 0x656D695400000000)) {
        goto LABEL_29;
      }
LABEL_26:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_29:
      }
        char v9 = sub_DAE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_52E0()
{
  sub_D9A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_545C(uint64_t a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v3 = sub_D690();
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  __chkstk_darwin(v3);
  v48 = (unint64_t *)((char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&long long v57 = sub_D570();
  *(void *)&long long v54 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  unsigned int v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 40);
  long long v53 = *(_OWORD *)(a1 + 24);
  v56 = (void *)a1;
  sub_7240((void *)a1, v53);
  if (qword_14468 != -1) {
    swift_once();
  }
  long long v72 = v53;
  uint64_t v73 = v7;
  sub_7284(v71);
  sub_D7D0();
  uint64_t v52 = v73;
  long long v51 = v72;
  *(void *)&long long v53 = sub_7240(v71, v72);
  sub_4388(&qword_14648);
  uint64_t v8 = sub_D680();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_DEC0;
  unint64_t v13 = v12 + v11;
  uint64_t v14 = *(void (**)(unint64_t, void, uint64_t))(v9 + 104);
  v14(v13, enum case for DeviceType.iPhone(_:), v8);
  v14(v13 + v10, enum case for DeviceType.iPad(_:), v8);
  v14(v13 + 2 * v10, enum case for DeviceType.visionPro(_:), v8);
  long long v69 = v51;
  uint64_t v70 = v52;
  sub_7284(v68);
  sub_D7C0();
  swift_bridgeObjectRelease();
  uint64_t v15 = v70;
  long long v53 = v69;
  sub_7240(v68, v69);
  char v16 = v55;
  sub_AD74(v55);
  sub_D560();
  (*(void (**)(char *, void))(v54 + 8))(v6, v57);
  long long v66 = v53;
  uint64_t v67 = v15;
  sub_7284(v65);
  sub_D7B0();
  swift_bridgeObjectRelease();
  uint64_t v17 = v67;
  long long v57 = v66;
  sub_7240(v65, v66);
  if (qword_144B8 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_14BB0;
  swift_bridgeObjectRetain();
  char v19 = sub_60D0(v16, v18);
  swift_bridgeObjectRelease();
  sub_4388(&qword_14650);
  sub_D740();
  uint64_t v20 = swift_allocObject();
  long long v54 = xmmword_DED0;
  *(_OWORD *)(v20 + 16) = xmmword_DED0;
  v21 = v56;
  if (v19) {
    sub_D760();
  }
  else {
    sub_D750();
  }
  *(_OWORD *)v64 = v57;
  *(void *)&v64[16] = v17;
  sub_7284(v63);
  sub_D800();
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void *)v64;
  long long v57 = *(_OWORD *)&v64[8];
  sub_7240(v63, *(uint64_t *)v64);
  if (qword_144A8 != -1) {
    swift_once();
  }
  if (*(void *)(qword_14BA8 + 16))
  {
    sub_64B8(v16);
    if (v23) {
      swift_bridgeObjectRetain();
    }
  }
  *(void *)v62 = v22;
  *(_OWORD *)&v62[8] = v57;
  sub_7284(v61);
  sub_D660();
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)&v62[16];
  long long v57 = *(_OWORD *)v62;
  sub_7240(v61, *(uint64_t *)v62);
  long long v59 = v57;
  uint64_t v60 = v24;
  sub_7284(v58);
  sub_D810();
  swift_bridgeObjectRelease();
  sub_72E8((uint64_t)v58);
  sub_72E8((uint64_t)v61);
  sub_72E8((uint64_t)v63);
  sub_72E8((uint64_t)v65);
  sub_72E8((uint64_t)v68);
  sub_72E8((uint64_t)v71);
  unint64_t v25 = sub_AFC0(v16);
  if (v26)
  {
    unint64_t v27 = v25;
    unint64_t v28 = v26;
    uint64_t v29 = v21[5];
    long long v57 = *(_OWORD *)(v21 + 3);
    sub_7240(v21, v57);
    v31 = v48;
    uint64_t v30 = v49;
    unint64_t *v48 = v27;
    v31[1] = v28;
    uint64_t v32 = v50;
    (*(void (**)(unint64_t *, void, uint64_t))(v30 + 104))(v31, enum case for IntentType.inIntent(_:), v50);
    long long v72 = v57;
    uint64_t v73 = v29;
    sub_7284(v71);
    sub_D7E0();
    (*(void (**)(unint64_t *, uint64_t))(v30 + 8))(v31, v32);
    sub_72E8((uint64_t)v71);
  }
  switch(v16)
  {
    case 6:
      swift_bridgeObjectRelease();
      goto LABEL_18;
    default:
      char v33 = sub_DAE0();
      swift_bridgeObjectRelease();
      if (v33)
      {
LABEL_18:
        uint64_t v34 = v21[5];
        long long v57 = *(_OWORD *)(v21 + 3);
        sub_7240(v21, v57);
        sub_4388(&qword_14658);
        uint64_t v35 = sub_D6F0();
        char v36 = v16;
        uint64_t v37 = *(void *)(v35 - 8);
        unint64_t v38 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
        uint64_t v39 = swift_allocObject();
        *(_OWORD *)(v39 + 16) = v54;
        unint64_t v40 = v39 + v38;
        uint64_t v41 = enum case for SiriHintsMode.display(_:);
        uint64_t v42 = sub_D670();
        (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 104))(v40, v41, v42);
        (*(void (**)(unint64_t, void, uint64_t))(v37 + 104))(v40, enum case for DeliveryVehicle.siriHints(_:), v35);
        char v16 = v36;
        v21 = v56;
        long long v72 = v57;
        uint64_t v73 = v34;
        sub_7284(v71);
        sub_D7F0();
        swift_bridgeObjectRelease();
        sub_72E8((uint64_t)v71);
      }
      v56 = sub_B0B8(v16);
      uint64_t v43 = v56[2];
      if (v43)
      {
        v44 = (char *)(v56 + 6);
        do
        {
          uint64_t v45 = v21[5];
          long long v57 = *(_OWORD *)(v21 + 3);
          sub_7240(v21, v57);
          long long v72 = v57;
          uint64_t v73 = v45;
          sub_7284(v71);
          sub_D820();
          sub_72E8((uint64_t)v71);
          v44 += 64;
          --v43;
        }
        while (v43);
      }
      return swift_bridgeObjectRelease();
  }
}

uint64_t sub_5EE4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for TimeSuggestionsOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_5F18()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()(v0);
}

uint64_t sub_5F20(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_14628 + dword_14628);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_5FD4;
  return v7(a1, a2);
}

uint64_t sub_5FD4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_60D0(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (2)
  {
    uint64_t v6 = a2 + v5++;
    unint64_t v7 = 0x800000000000E730;
    unint64_t v8 = 0xD000000000000010;
    switch(*(unsigned char *)(v6 + 32))
    {
      case 1:
        unint64_t v8 = 0x616C416E41746573;
        unint64_t v7 = 0xEA00000000006D72;
        break;
      case 2:
        break;
      case 3:
        unint64_t v8 = 0x6C41657461647075;
        uint64_t v9 = 7172705;
        goto LABEL_12;
      case 4:
        unint64_t v7 = 0x800000000000E750;
        break;
      case 5:
        unint64_t v8 = 0x656D695474616877;
        unint64_t v7 = 0xEC00000074497349;
        break;
      case 6:
        unint64_t v8 = 0x72656D6954746573;
        unint64_t v7 = 0xEC000000746E6948;
        break;
      case 7:
        unint64_t v8 = 0x547373696D736964;
        unint64_t v7 = 0xEC00000072656D69;
        break;
      case 8:
        unint64_t v8 = 0x6954686372616573;
        uint64_t v9 = 7497069;
LABEL_12:
        unint64_t v7 = v9 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
        break;
      default:
        unint64_t v8 = 0x656D695441746573;
        unint64_t v7 = 0xE900000000000072;
        break;
    }
    unint64_t v10 = 0x800000000000E730;
    unint64_t v11 = 0xD000000000000010;
    switch(a1)
    {
      case 1:
        unint64_t v10 = 0xEA00000000006D72;
        if (v8 == 0x616C416E41746573) {
          goto LABEL_27;
        }
        goto LABEL_28;
      case 2:
        goto LABEL_26;
      case 3:
        uint64_t v12 = 0x6C41657461647075;
        uint64_t v13 = 7172705;
        goto LABEL_32;
      case 4:
        unint64_t v10 = 0x800000000000E750;
        if (v8 != 0xD000000000000010) {
          goto LABEL_28;
        }
        goto LABEL_27;
      case 5:
        uint64_t v14 = 0x656D695474616877;
        uint64_t v15 = 1950970697;
        goto LABEL_23;
      case 6:
        uint64_t v14 = 0x72656D6954746573;
        uint64_t v15 = 1953392968;
LABEL_23:
        unint64_t v10 = v15 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        if (v8 != v14) {
          goto LABEL_28;
        }
        goto LABEL_27;
      case 7:
        unint64_t v11 = 0x547373696D736964;
        unint64_t v10 = 0xEC00000072656D69;
LABEL_26:
        if (v8 == v11) {
          goto LABEL_27;
        }
        goto LABEL_28;
      case 8:
        uint64_t v12 = 0x6954686372616573;
        uint64_t v13 = 7497069;
LABEL_32:
        unint64_t v10 = v13 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
        if (v8 != v12) {
          goto LABEL_28;
        }
        goto LABEL_27;
      default:
        unint64_t v10 = 0xE900000000000072;
        if (v8 != 0x656D695441746573) {
          goto LABEL_28;
        }
LABEL_27:
        if (v7 != v10)
        {
LABEL_28:
          char v16 = sub_DAE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v16) {
            goto LABEL_35;
          }
          if (v2 == v5)
          {
            swift_bridgeObjectRelease();
            return 0;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_35:
        swift_bridgeObjectRelease();
        return 1;
    }
  }
}

unint64_t sub_6440(uint64_t a1, uint64_t a2)
{
  sub_DAF0();
  sub_D9A0();
  Swift::Int v4 = sub_DB00();
  return sub_6524(a1, a2, v4);
}

unint64_t sub_64B8(unsigned __int8 a1)
{
  sub_DAF0();
  sub_52E0();
  Swift::Int v2 = sub_DB00();
  return sub_6608(a1, v2);
}

unint64_t sub_6524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_DAE0() & 1) == 0)
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
      while (!v14 && (sub_DAE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_6608(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x800000000000E730;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x616C416E41746573;
          unint64_t v7 = 0xEA00000000006D72;
          break;
        case 2:
          break;
        case 3:
          unint64_t v8 = 0x6C41657461647075;
          uint64_t v9 = 7172705;
          goto LABEL_12;
        case 4:
          unint64_t v7 = 0x800000000000E750;
          break;
        case 5:
          unint64_t v8 = 0x656D695474616877;
          unint64_t v7 = 0xEC00000074497349;
          break;
        case 6:
          unint64_t v8 = 0x72656D6954746573;
          unint64_t v7 = 0xEC000000746E6948;
          break;
        case 7:
          unint64_t v8 = 0x547373696D736964;
          unint64_t v7 = 0xEC00000072656D69;
          break;
        case 8:
          unint64_t v8 = 0x6954686372616573;
          uint64_t v9 = 7497069;
LABEL_12:
          unint64_t v7 = v9 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          break;
        default:
          unint64_t v8 = 0x656D695441746573;
          unint64_t v7 = 0xE900000000000072;
          break;
      }
      unint64_t v10 = 0x800000000000E730;
      unint64_t v11 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xEA00000000006D72;
          if (v8 == 0x616C416E41746573) {
            goto LABEL_27;
          }
          goto LABEL_28;
        case 2:
          goto LABEL_26;
        case 3:
          uint64_t v12 = 0x6C41657461647075;
          uint64_t v13 = 7172705;
          goto LABEL_32;
        case 4:
          unint64_t v10 = 0x800000000000E750;
          if (v8 != 0xD000000000000010) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 5:
          uint64_t v14 = 0x656D695474616877;
          uint64_t v15 = 1950970697;
          goto LABEL_23;
        case 6:
          uint64_t v14 = 0x72656D6954746573;
          uint64_t v15 = 1953392968;
LABEL_23:
          unint64_t v10 = v15 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          if (v8 != v14) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 7:
          unint64_t v11 = 0x547373696D736964;
          unint64_t v10 = 0xEC00000072656D69;
LABEL_26:
          if (v8 == v11) {
            goto LABEL_27;
          }
          goto LABEL_28;
        case 8:
          uint64_t v12 = 0x6954686372616573;
          uint64_t v13 = 7497069;
LABEL_32:
          unint64_t v10 = v13 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          if (v8 != v12) {
            goto LABEL_28;
          }
          goto LABEL_27;
        default:
          unint64_t v10 = 0xE900000000000072;
          if (v8 != 0x656D695441746573) {
            goto LABEL_28;
          }
LABEL_27:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_28:
          char v16 = sub_DAE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v16) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_6988(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = a2;
  uint64_t v3 = sub_D960();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  return _swift_task_switch(sub_6A48, 0, 0);
}

uint64_t sub_6A48()
{
  sub_D650();
  uint64_t v1 = sub_D950();
  os_log_type_t v2 = sub_D9F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&def_6FC4, v1, v2, "TimeSuggestionsOwnerDefinitionFactory createOwnerDefinitions", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[15];
  uint64_t v4 = v0[16];
  uint64_t v6 = v0[14];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (qword_14460 != -1) {
    swift_once();
  }
  unint64_t v7 = (int *)v0[12];
  uint64_t v8 = qword_14B68;
  v0[5] = sub_D6A0();
  v0[6] = sub_718C();
  v0[2] = v8;
  unint64_t v11 = (uint64_t (*)(void *))((char *)v7 + *v7);
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[17] = v9;
  void *v9 = v0;
  v9[1] = sub_6C24;
  return v11(v0 + 2);
}

uint64_t sub_6C24(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 144) = a1;
  swift_task_dealloc();
  sub_72E8(v2);
  return _swift_task_switch(sub_6D30, 0, 0);
}

uint64_t sub_6D30()
{
  uint64_t v0 = 9;
  uint64_t v1 = &byte_10838;
  while (2)
  {
    int v6 = *v1++;
    char v5 = v6;
    sub_DA60(18);
    swift_bridgeObjectRelease();
    uint64_t v4 = (void *)0x800000000000E730;
    v2._countAndFlagsBits = 0xD000000000000010;
    switch(v6)
    {
      case 0:
        v2._countAndFlagsBits = 0x656D695441746573;
        uint64_t v4 = (void *)0xE900000000000072;
        goto LABEL_4;
      case 1:
        v2._countAndFlagsBits = 0x616C416E41746573;
        uint64_t v4 = (void *)0xEA00000000006D72;
        goto LABEL_4;
      case 2:
        goto LABEL_4;
      case 3:
        v2._countAndFlagsBits = 0x6C41657461647075;
        uint64_t v3 = 7172705;
        goto LABEL_3;
      case 4:
        uint64_t v4 = (void *)0x800000000000E750;
        goto LABEL_4;
      case 5:
        v2._countAndFlagsBits = 0x656D695474616877;
        uint64_t v4 = (void *)0xEC00000074497349;
        goto LABEL_4;
      case 6:
        uint64_t v4 = (void *)0xEC000000746E6948;
        v2._countAndFlagsBits = 0x72656D6954746573;
        goto LABEL_4;
      case 7:
        uint64_t v4 = (void *)0xEC00000072656D69;
        v2._countAndFlagsBits = 0x547373696D736964;
        goto LABEL_4;
      case 8:
        v2._countAndFlagsBits = 0x6954686372616573;
        uint64_t v3 = 7497069;
LABEL_3:
        uint64_t v4 = (void *)(v3 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000);
LABEL_4:
        v2._object = v4;
        sub_D9B0(v2);
        swift_bridgeObjectRelease();
        *(unsigned char *)(swift_task_alloc() + 16) = v5;
        sub_D850();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_task_dealloc();
        if (--v0) {
          continue;
        }
        v10[10] = &type metadata for TimeSourceGenerator;
        v10[11] = sub_71EC();
        sub_D840();
        swift_release();
        sub_72E8((uint64_t)(v10 + 7));
        sub_4388(&qword_14640);
        uint64_t v7 = swift_allocObject();
        *(_OWORD *)(v7 + 16) = xmmword_DED0;
        sub_D860();
        swift_release();
        swift_task_dealloc();
        uint64_t v8 = (uint64_t (*)(uint64_t))v10[1];
        return v8(v7);
      default:
        JUMPOUT(0);
    }
  }
}

unint64_t sub_718C()
{
  unint64_t result = qword_14630;
  if (!qword_14630)
  {
    sub_D6A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14630);
  }
  return result;
}

uint64_t sub_71E4(uint64_t a1)
{
  return sub_545C(a1, *(unsigned __int8 *)(v1 + 16));
}

unint64_t sub_71EC()
{
  unint64_t result = qword_14638;
  if (!qword_14638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14638);
  }
  return result;
}

void *sub_7240(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *sub_7284(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_72E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7338()
{
  uint64_t v0 = sub_D960();
  sub_85C0(v0, qword_14660);
  sub_8588(v0, (uint64_t)qword_14660);
  return sub_D650();
}

void sub_7384(void *a1@<X8>)
{
  a1[3] = &type metadata for String;
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t sub_739C(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 1:
      if (!a2) {
        goto LABEL_23;
      }
      if (a1 == 0xD000000000000063 && a2 == 0x800000000000E620 || (sub_DAE0() & 1) != 0)
      {
        sub_D8F0();
        goto LABEL_20;
      }
      if ((a1 != 0xD000000000000063 || a2 != 0x800000000000E690) && (sub_DAE0() & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    case 2:
      goto LABEL_11;
    case 3:
      goto LABEL_23;
    case 4:
      if (!a2) {
        goto LABEL_23;
      }
      if (a1 == 0xD00000000000005ELL && a2 == 0x800000000000E490 || (sub_DAE0() & 1) != 0)
      {
LABEL_11:
        sub_D920();
LABEL_20:
        return sub_D780();
      }
      if (a1 == 0xD00000000000005ELL && a2 == 0x800000000000E5C0 || (sub_DAE0() & 1) != 0)
      {
        sub_D930();
        goto LABEL_20;
      }
LABEL_23:
      return sub_D790();
    default:
LABEL_19:
      sub_D900();
      goto LABEL_20;
  }
}

uint64_t sub_7630@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_7A98(a1, (SEL *)&selRef_time, a2);
}

uint64_t sub_7650@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_D640();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  [a1 type];
  uint64_t v8 = sub_D940();
  if (v8 == sub_D940())
  {
    id v9 = [a1 label];
    if (!v9)
    {
      uint64_t v15 = enum case for IntentParameter.ignore(_:);
      goto LABEL_7;
    }
    unint64_t v10 = v9;
    sub_DA20();

    uint64_t v11 = sub_D630();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    a2[3] = (uint64_t)&type metadata for String;
    *a2 = v11;
    a2[1] = v13;
    uint64_t v14 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
  }
  else
  {
    uint64_t v14 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
  }
  uint64_t v15 = *v14;
LABEL_7:
  uint64_t v16 = sub_D700();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(a2, v15, v16);
}

uint64_t sub_7800@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [a1 label];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_D980();
    uint64_t v7 = v6;

    a2[3] = (uint64_t)&type metadata for String;
    *a2 = v5;
    a2[1] = v7;
    uint64_t v8 = enum case for IntentParameter.directAssignment(_:);
  }
  else
  {
    uint64_t v8 = enum case for IntentParameter.ignore(_:);
  }
  uint64_t v9 = sub_D700();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(a2, v8, v9);
}

uint64_t sub_78CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  [a1 type];
  uint64_t v3 = sub_D940();
  if (v3 == sub_D940())
  {
    sub_D910();
    a2[3] = &type metadata for Double;
    *a2 = v4;
    uint64_t v5 = (unsigned int *)&enum case for IntentParameter.context(_:);
  }
  else
  {
    uint64_t v5 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
  }
  uint64_t v6 = *v5;
  uint64_t v7 = sub_D700();
  return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(a2, v6, v7);
}

uint64_t sub_798C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [a1 alarm];
  if (v3 && (uint64_t v4 = v3, v5 = [v3 label], v4, v5))
  {
    uint64_t v6 = sub_D980();
    uint64_t v8 = v7;

    a2[3] = (uint64_t)&type metadata for String;
    *a2 = v6;
    a2[1] = v8;
    uint64_t v9 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
  }
  else
  {
    uint64_t v9 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
  }
  uint64_t v10 = *v9;
  uint64_t v11 = sub_D700();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(a2, v10, v11);
}

uint64_t sub_7A78@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_7A98(a1, (SEL *)&selRef_proposedTime, a2);
}

uint64_t sub_7A98@<X0>(void *a1@<X0>, SEL *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_4388(&qword_14A10);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_D530();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v24 - v14;
  id v16 = [a1 *a2];
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_5;
  }
  uint64_t v17 = v16;
  sub_D510();

  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v18(v8, v13, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_5:
    sub_A38C((uint64_t)v8, &qword_14A10);
    uint64_t v20 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_6;
  }
  v18(v15, v8, v9);
  a3[3] = v9;
  char v19 = sub_7284(a3);
  v18((char *)v19, v15, v9);
  uint64_t v20 = (unsigned int *)&enum case for IntentParameter.context(_:);
LABEL_6:
  uint64_t v21 = *v20;
  uint64_t v22 = sub_D700();
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(a3, v21, v22);
}

uint64_t type metadata accessor for AlarmLabelResolver()
{
  return self;
}

uint64_t sub_7D40()
{
  return _swift_task_switch(sub_7D5C, 0, 0);
}

uint64_t sub_7D5C()
{
  if (qword_14470 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_D960();
  sub_8588(v1, (uint64_t)qword_14660);
  uint64_t v2 = sub_D950();
  os_log_type_t v3 = sub_DA10();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&def_6FC4, v2, v3, "[AlarmLabelResolver] No alarm label value directly assigned in context. Running the AlarmLabelResolver", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = *(uint64_t (**)(void *))(v0 + 8);
  return v5(&_swiftEmptyArrayStorage);
}

uint64_t type metadata accessor for AlarmTimeResolver()
{
  return self;
}

uint64_t sub_7EA0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_7ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_5FD4;
  return sub_8E10(a2);
}

uint64_t type metadata accessor for TimerDurationResolver()
{
  return self;
}

uint64_t sub_7FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_A3EC;
  v6[43] = a2;
  v6[44] = a3;
  return _swift_task_switch(sub_9760, 0, 0);
}

uint64_t type metadata accessor for DisplayOnlyResolver()
{
  return self;
}

uint64_t sub_8078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_A3EC;
  return sub_9FD0(a2, a3);
}

uint64_t sub_8124()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for TimerLabelResolver()
{
  return self;
}

uint64_t sub_8180()
{
  return _swift_task_switch(sub_819C, 0, 0);
}

uint64_t sub_819C()
{
  if (qword_14470 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_D960();
  sub_8588(v1, (uint64_t)qword_14660);
  uint64_t v2 = sub_D950();
  os_log_type_t v3 = sub_DA10();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&def_6FC4, v2, v3, "[TimerLabelResolver] No timer label value directly assigned in context. Running the TimerLabelResolver", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = *(uint64_t (**)(void *))(v0 + 8);
  return v5(&_swiftEmptyArrayStorage);
}

uint64_t sub_82B8()
{
  return sub_9698((unint64_t *)&unk_14998, (void (*)(uint64_t))type metadata accessor for TimerLabelResolver);
}

uint64_t sub_8300()
{
  return sub_9698(&qword_149A8, (void (*)(uint64_t))type metadata accessor for TimerLabelResolver);
}

uint64_t sub_8348()
{
  return sub_9698((unint64_t *)&unk_149B0, (void (*)(uint64_t))type metadata accessor for DisplayOnlyResolver);
}

uint64_t sub_8390()
{
  return sub_9698(&qword_149C0, (void (*)(uint64_t))type metadata accessor for DisplayOnlyResolver);
}

uint64_t sub_83D8()
{
  return sub_9698((unint64_t *)&unk_149C8, (void (*)(uint64_t))type metadata accessor for TimerDurationResolver);
}

uint64_t sub_8420()
{
  return sub_9698(&qword_149D8, (void (*)(uint64_t))type metadata accessor for TimerDurationResolver);
}

uint64_t sub_8468()
{
  return sub_9698((unint64_t *)&unk_149E0, (void (*)(uint64_t))type metadata accessor for AlarmTimeResolver);
}

uint64_t sub_84B0()
{
  return sub_9698(&qword_149F0, (void (*)(uint64_t))type metadata accessor for AlarmTimeResolver);
}

uint64_t sub_84F8()
{
  return sub_9698((unint64_t *)&unk_149F8, (void (*)(uint64_t))type metadata accessor for AlarmLabelResolver);
}

uint64_t sub_8540()
{
  return sub_9698(&qword_14A08, (void (*)(uint64_t))type metadata accessor for AlarmLabelResolver);
}

uint64_t sub_8588(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_85C0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_8624(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_86F8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_96E0((uint64_t)v12, *a3);
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
      sub_96E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_72E8((uint64_t)v12);
  return v7;
}

uint64_t sub_86F8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_DA50();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_88B4(a5, a6);
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
  uint64_t v8 = sub_DA80();
  if (!v8)
  {
    sub_DA90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_DAB0();
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

uint64_t sub_88B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_894C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_8B2C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_8B2C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_894C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_8AC4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_DA70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_DA90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_D9C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_DAB0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_DA90();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_8AC4(uint64_t a1, uint64_t a2)
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
  sub_4388(&qword_14A50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_8B2C(char a1, int64_t a2, char a3, char *a4)
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
    sub_4388(&qword_14A50);
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
  uint64_t result = sub_DAB0();
  __break(1u);
  return result;
}

uint64_t sub_8C7C(void *a1)
{
  [a1 timeIntervalSince1970];
  double v2 = v1;
  if (qword_14470 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_D960();
  sub_8588(v3, (uint64_t)qword_14660);
  unint64_t v4 = sub_D950();
  os_log_type_t v5 = sub_DA10();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl(&def_6FC4, v4, v5, "AlarmTimeResolver resolveParameter() called", v6, 2u);
    swift_slowDealloc();
  }

  sub_4388(&qword_14A30);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_DED0;
  sub_4388(&qword_14A58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_DED0;
  *(void *)(inited + 32) = 1935893875;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(double *)(inited + 48) = (floor(v2 / 3600.0) + 2.0) * 3600.0;
  unint64_t v9 = sub_A4F4(inited);
  *(void *)(v7 + 56) = sub_4388(&qword_14A60);
  *(void *)(v7 + 32) = v9;
  return v7;
}

uint64_t sub_8E10(uint64_t a1)
{
  v1[23] = a1;
  uint64_t v2 = sub_D5E0();
  v1[24] = v2;
  v1[25] = *(void *)(v2 - 8);
  v1[26] = swift_task_alloc();
  sub_4388(&qword_14A20);
  v1[27] = swift_task_alloc();
  uint64_t v3 = sub_D590();
  v1[28] = v3;
  v1[29] = *(void *)(v3 - 8);
  v1[30] = swift_task_alloc();
  sub_4388(&qword_14A10);
  v1[31] = swift_task_alloc();
  uint64_t v4 = sub_D530();
  v1[32] = v4;
  v1[33] = *(void *)(v4 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  return _swift_task_switch(sub_8FF8, 0, 0);
}

uint64_t sub_8FF8()
{
  sub_7240(*(void **)(v0 + 184), *(void *)(*(void *)(v0 + 184) + 24));
  uint64_t v1 = sub_D710();
  *(void *)(v0 + 288) = v2;
  *(void *)(v0 + 296) = v1;
  *(void *)(v0 + 304) = swift_getObjectType();
  uint64_t v4 = sub_D9E0();
  return _swift_task_switch(sub_90A8, v4, v3);
}

uint64_t sub_90A8()
{
  sub_D8C0();
  swift_unknownObjectRelease();
  return _swift_task_switch(sub_912C, 0, 0);
}

uint64_t sub_912C()
{
  uint64_t v45 = v0;
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[31];
  if (!v0[21])
  {
    sub_A38C((uint64_t)(v0 + 18), &qword_14A28);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v3, 1, 1, v1);
    goto LABEL_6;
  }
  int v4 = swift_dynamicCast();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, v4 ^ 1u, 1, v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
LABEL_6:
    uint64_t v10 = v0[31];
    unint64_t v9 = &qword_14A10;
    goto LABEL_7;
  }
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[29];
  uint64_t v7 = v0[27];
  (*(void (**)(void, void, void))(v0[33] + 32))(v0[35], v0[31], v0[32]);
  sub_D520();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5) == 1)
  {
    uint64_t v8 = v0[27];
    (*(void (**)(void, void))(v0[33] + 8))(v0[35], v0[32]);
    unint64_t v9 = (uint64_t *)&unk_14A20;
    uint64_t v10 = v8;
LABEL_7:
    sub_A38C(v10, v9);
    id v11 = [objc_allocWithZone((Class)NSDate) init];
    uint64_t v12 = sub_8C7C(v11);

    goto LABEL_8;
  }
  (*(void (**)(void, void, void))(v0[29] + 32))(v0[30], v0[27], v0[28]);
  if (qword_14470 != -1) {
    swift_once();
  }
  uint64_t v16 = v0[34];
  uint64_t v15 = v0[35];
  uint64_t v18 = v0[32];
  uint64_t v17 = v0[33];
  uint64_t v19 = sub_D960();
  sub_8588(v19, (uint64_t)qword_14660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v15, v18);
  uint64_t v20 = sub_D950();
  os_log_type_t v21 = sub_DA10();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v23 = v0[33];
  uint64_t v24 = v0[34];
  uint64_t v25 = v0[32];
  if (v22)
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)unint64_t v26 = 136315138;
    sub_9698(&qword_14A48, (void (*)(uint64_t))&type metadata accessor for DateComponents);
    uint64_t v27 = sub_DAD0();
    v0[22] = sub_8624(v27, v28, &v44);
    sub_DA40();
    swift_bridgeObjectRelease();
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v43(v24, v25);
    _os_log_impl(&def_6FC4, v20, v21, "AlarmTimeResolver found time value %s from IntentTransformer", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v43(v0[34], v0[32]);
  }

  uint64_t v41 = v0[32];
  uint64_t v42 = v0[35];
  uint64_t v29 = v0[29];
  uint64_t v30 = v0[30];
  uint64_t v40 = v0[28];
  uint64_t v31 = v0[25];
  uint64_t v32 = v0[26];
  uint64_t v33 = v0[24];
  sub_4388(&qword_14A30);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_DED0;
  sub_4388(&qword_14A38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_DF40;
  *(void *)(inited + 32) = 1935893875;
  *(void *)(inited + 40) = 0xE400000000000000;
  sub_D580();
  *(void *)(inited + 48) = v35;
  *(void *)(inited + 72) = &type metadata for Double;
  strcpy((char *)(inited + 80), "dateFormatter");
  *(_WORD *)(inited + 94) = -4864;
  sub_D5D0();
  uint64_t v36 = sub_D5C0();
  uint64_t v38 = v37;
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v36;
  *(void *)(inited + 104) = v38;
  unint64_t v39 = sub_A608(inited);
  *(void *)(v12 + 56) = sub_4388(&qword_14A40);
  *(void *)(v12 + 32) = v39;
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v40);
  v43(v42, v41);
LABEL_8:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(v12);
}

uint64_t sub_9698(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_96E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_9740(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 344) = a1;
  *(void *)(v2 + 352) = a2;
  return _swift_task_switch(sub_9760, 0, 0);
}

uint64_t sub_9760()
{
  sub_7240(*(void **)(v0 + 344), *(void *)(*(void *)(v0 + 344) + 24));
  uint64_t v1 = sub_D710();
  *(void *)(v0 + 360) = v2;
  *(void *)(v0 + 368) = v1;
  *(void *)(v0 + 376) = swift_getObjectType();
  uint64_t v4 = sub_D9E0();
  return _swift_task_switch(sub_9810, v4, v3);
}

uint64_t sub_9810()
{
  sub_D8C0();
  swift_unknownObjectRelease();
  return _swift_task_switch(sub_989C, 0, 0);
}

uint64_t sub_989C()
{
  uint64_t v32 = v0;
  if (*(void *)(v0 + 296))
  {
    if (swift_dynamicCast())
    {
      double v1 = *(double *)(v0 + 320);
      if (qword_14470 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_D960();
      sub_8588(v2, (uint64_t)qword_14660);
      uint64_t v3 = sub_D950();
      os_log_type_t v4 = sub_DA10();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 134217984;
        *(double *)(v0 + 336) = v1;
        sub_DA40();
        _os_log_impl(&def_6FC4, v3, v4, "[TimerDurationResolver] got duration value %f from IntentTransformer. Returning", v5, 0xCu);
        swift_slowDealloc();
      }

      sub_4388(&qword_14A30);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_DED0;
      sub_4388(&qword_14A58);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_DED0;
      goto LABEL_31;
    }
  }
  else
  {
    sub_A38C(v0 + 272, &qword_14A28);
  }
  sub_7240(*(void **)(v0 + 352), *(void *)(*(void *)(v0 + 352) + 24));
  uint64_t v8 = sub_D6C0();
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_6440(0x6E6F697461727564, 0xE800000000000000), (v10 & 1) != 0))
  {
    sub_4418(*(void *)(v8 + 56) + 48 * v9, v0 + 184);
  }
  else
  {
    *(_OWORD *)(v0 + 200) = 0u;
    *(_OWORD *)(v0 + 216) = 0u;
    *(_OWORD *)(v0 + 184) = 0u;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 208))
  {
    sub_4388(&qword_144D0);
    if (swift_dynamicCast())
    {
      double v11 = *(double *)(v0 + 304);
      if (qword_14470 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_D960();
      sub_8588(v12, (uint64_t)qword_14660);
      uint64_t v13 = sub_D950();
      os_log_type_t v14 = sub_DA10();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 134217984;
        *(double *)(v0 + 312) = v11;
        sub_DA40();
        _os_log_impl(&def_6FC4, v13, v14, "TimerDurationResolver.resolveParameter called with duration of %f", v15, 0xCu);
        swift_slowDealloc();
      }

      sub_4388(&qword_14A30);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_DED0;
      sub_4388(&qword_14A58);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_DED0;
      double v16 = ceil(v11 / 300.0) * 300.0;
      if (v11 == v16) {
        double v1 = v16 + 300.0;
      }
      else {
        double v1 = v16;
      }
      goto LABEL_31;
    }
  }
  else
  {
    sub_A38C(v0 + 184, &qword_144D8);
  }
  if (qword_14470 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_D960();
  sub_8588(v17, (uint64_t)qword_14660);
  uint64_t v18 = sub_D950();
  os_log_type_t v19 = sub_DA10();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&def_6FC4, v18, v19, "Could not get duration from interaction.executionParameters", v20, 2u);
    swift_slowDealloc();
  }
  uint64_t v21 = *(void *)(v0 + 352);

  sub_9F6C(v21, v0 + 232);
  BOOL v22 = sub_D950();
  os_log_type_t v23 = sub_DA10();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315138;
    sub_7240((void *)(v0 + 232), *(void *)(v0 + 256));
    sub_D6C0();
    sub_4388(&qword_144D0);
    uint64_t v25 = sub_D970();
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 328) = sub_8624(v25, v27, &v31);
    sub_DA40();
    swift_bridgeObjectRelease();
    sub_72E8(v0 + 232);
    _os_log_impl(&def_6FC4, v22, v23, "interaction.executionParameters: %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_72E8(v0 + 232);
  }

  sub_4388(&qword_14A30);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_DED0;
  sub_4388(&qword_14A58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_DED0;
  double v1 = 1500.0;
LABEL_31:
  *(void *)(inited + 32) = 1935893875;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(double *)(inited + 48) = v1;
  unint64_t v28 = sub_A4F4(inited);
  *(void *)(v6 + 56) = sub_4388(&qword_14A60);
  *(void *)(v6 + 32) = v28;
  uint64_t v29 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v29(v6);
}

uint64_t sub_9F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_9FD0(uint64_t a1, uint64_t a2)
{
  v2[8] = a2;
  sub_4388(&qword_144C8);
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_D620();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_A0D0, 0, 0);
}

uint64_t sub_A0D0()
{
  sub_7240(*(void **)(v0 + 64), *(void *)(*(void *)(v0 + 64) + 24));
  uint64_t v1 = sub_D6C0();
  if (!*(void *)(v1 + 16) || (unint64_t v2 = sub_6440(0x65736E6F70736572, 0xEC00000065646F4DLL), (v3 & 1) == 0))
  {
    *(_OWORD *)(v0 + 32) = 0u;
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_4418(*(void *)(v1 + 56) + 48 * v2, v0 + 16);
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 40))
  {
LABEL_7:
    uint64_t v15 = *(void *)(v0 + 80);
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v17 = *(void *)(v0 + 72);
    sub_A38C(v0 + 16, &qword_144D8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v17, 1, 1, v15);
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 72);
  sub_4388(&qword_144D0);
  int v7 = swift_dynamicCast();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v6, v7 ^ 1u, 1, v4);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) != 1)
  {
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v10 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 88);
    (*(void (**)(uint64_t, void, uint64_t))(v11 + 32))(v8, *(void *)(v0 + 72), v10);
    sub_4388(&qword_14A30);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_DED0;
    sub_D600();
    char v13 = sub_D610();
    os_log_type_t v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v14(v9, v10);
    *(void *)(v12 + 56) = &type metadata for Bool;
    *(unsigned char *)(v12 + 32) = v13 & 1;
    v14(v8, v10);
    goto LABEL_9;
  }
LABEL_8:
  sub_A38C(*(void *)(v0 + 72), &qword_144C8);
  sub_4388(&qword_14A30);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_DED0;
  *(void *)(v12 + 56) = &type metadata for Bool;
  *(unsigned char *)(v12 + 32) = 0;
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v18(v12);
}

uint64_t sub_A38C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4388(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_A3F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4388(&qword_14A88);
  unint64_t v2 = (void *)sub_DAA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    unsigned __int8 v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_64B8(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
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

unint64_t sub_A4F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4388(&qword_14AA8);
  unint64_t v2 = (void *)sub_DAA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_6440(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v10 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_A608(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4388(&qword_14A98);
  uint64_t v2 = sub_DAA0();
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
    sub_ACF8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_6440(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_AD60(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_A734(uint64_t a1)
{
  return sub_A758(a1, &qword_14B78);
}

uint64_t sub_A740(uint64_t a1)
{
  return sub_A758(a1, &qword_14B80);
}

uint64_t sub_A74C(uint64_t a1)
{
  return sub_A758(a1, &qword_14B88);
}

uint64_t sub_A758(uint64_t a1, uint64_t *a2)
{
  sub_D8B0();
  uint64_t v3 = sub_D6E0();
  v6[3] = v3;
  v6[4] = sub_ACA0();
  uint64_t v4 = sub_7284(v6);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v4, enum case for CoreSignalTypes.app(_:), v3);
  uint64_t result = sub_D880();
  *a2 = result;
  return result;
}

uint64_t sub_A818()
{
  sub_D8B0();
  uint64_t result = sub_D8A0();
  qword_14B90 = result;
  return result;
}

uint64_t sub_A84C()
{
  sub_D8B0();
  uint64_t result = sub_D870();
  qword_14B98 = result;
  return result;
}

uint64_t sub_A880()
{
  sub_D8B0();
  uint64_t result = sub_D890();
  qword_14BA0 = result;
  return result;
}

unint64_t sub_A8B4()
{
  sub_4388(&qword_14A78);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_E2D0;
  *(unsigned char *)(inited + 32) = 0;
  sub_4388(&qword_14A80);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_E2E0;
  if (qword_14480 != -1) {
    swift_once();
  }
  *(void *)(v1 + 32) = qword_14B80;
  uint64_t v2 = qword_14490;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v1 + 40) = qword_14B90;
  uint64_t v3 = qword_14498;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(v1 + 48) = qword_14B98;
  uint64_t v4 = qword_144A0;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  *(void *)(v1 + 56) = qword_14BA0;
  sub_D9D0();
  *(void *)(inited + 40) = v1;
  *(unsigned char *)(inited + 48) = 1;
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_E2F0;
  uint64_t v6 = qword_14478;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_14B78;
  uint64_t v8 = qword_14BA0;
  *(void *)(v5 + 32) = qword_14B78;
  *(void *)(v5 + 40) = v8;
  uint64_t v9 = qword_14B98;
  *(void *)(v5 + 48) = qword_14B98;
  sub_D9D0();
  *(void *)(inited + 56) = v5;
  *(unsigned char *)(inited + 64) = 2;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_E2F0;
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v8;
  *(void *)(v10 + 48) = v9;
  uint64_t v19 = v10;
  sub_D9D0();
  *(void *)(inited + 72) = v19;
  *(unsigned char *)(inited + 80) = 3;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_E300;
  *(void *)(v11 + 32) = v7;
  uint64_t v20 = v11;
  swift_retain();
  sub_D9D0();
  *(void *)(inited + 88) = v20;
  *(unsigned char *)(inited + 96) = 4;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_E2F0;
  uint64_t v13 = qword_14488;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_14B88;
  uint64_t v15 = qword_14B98;
  *(void *)(v12 + 32) = qword_14B88;
  *(void *)(v12 + 40) = v15;
  uint64_t v16 = qword_14B90;
  *(void *)(v12 + 48) = qword_14B90;
  sub_D9D0();
  *(void *)(inited + 104) = v12;
  *(unsigned char *)(inited + 112) = 5;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_E2F0;
  *(void *)(v17 + 32) = v14;
  *(void *)(v17 + 40) = v15;
  *(void *)(v17 + 48) = v16;
  uint64_t v21 = v17;
  sub_D9D0();
  *(void *)(inited + 120) = v21;
  *(unsigned char *)(inited + 128) = 6;
  *(void *)(inited + 136) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(inited + 144) = 7;
  *(void *)(inited + 152) = &_swiftEmptyArrayStorage;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  unint64_t result = sub_A3F0(inited);
  qword_14BA8 = result;
  return result;
}

unint64_t sub_ACA0()
{
  unint64_t result = qword_14A90;
  if (!qword_14A90)
  {
    sub_D6E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14A90);
  }
  return result;
}

uint64_t sub_ACF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4388(&qword_14AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_AD60(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_AD74(unsigned __int8 a1)
{
  uint64_t v2 = sub_D570();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v15 - v7;
  id v9 = (id)AFSystemRootDirectory();
  sub_D980();

  sub_D540();
  swift_bridgeObjectRelease();
  sub_D550();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v15[0] = 0;
  v15[1] = 0xE000000000000000;
  sub_DA60(19);
  if (a1 > 8u) {
    goto LABEL_6;
  }
  if (((1 << a1) & 0x1C1) == 0)
  {
    if (((1 << a1) & 0xE) != 0)
    {
      uint64_t v13 = 0x466D72616C41;
LABEL_7:
      v12._countAndFlagsBits = v13 & 0xFFFFFFFFFFFFLL | 0x6F6C000000000000;
      uint64_t v11 = (void *)0xEF6E6967756C5077;
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v13 = 0x466B636F6C43;
    goto LABEL_7;
  }
  uint64_t v11 = (void *)0x800000000000ECF0;
  v12._countAndFlagsBits = 0xD000000000000017;
LABEL_8:
  v12._object = v11;
  sub_D9B0(v12);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 0xD000000000000011;
  v16._object = (void *)0x800000000000ECD0;
  sub_D9B0(v16);
  sub_D550();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v10)(v8, v2);
}

unint64_t sub_AFC0(char a1)
{
  unint64_t result = 0;
  switch(a1)
  {
    case 0:
    case 8:
      unint64_t result = 0xD00000000000005ELL;
      break;
    case 1:
      unint64_t result = 0xD000000000000063;
      break;
    case 3:
      unint64_t result = 0xD000000000000063;
      break;
    case 6:
      unint64_t result = 0xD000000000000064;
      break;
    case 7:
      unint64_t result = 0xD00000000000005FLL;
      break;
    default:
      return result;
  }
  return result;
}

void *sub_B0B8(char a1)
{
  uint64_t v2 = sub_4388(&qword_14AC8);
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_4388(&qword_14AD0);
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = &_swiftEmptyArrayStorage;
  switch(a1)
  {
    case 1:
      sub_4388(&qword_14AD8);
      uint64_t v4 = (void *)swift_allocObject();
      *((_OWORD *)v4 + 1) = xmmword_DED0;
      sub_D7A0();
      sub_739C(0xD000000000000063, 0x800000000000E620, 1);
      sub_D730();
      swift_allocObject();
      uint64_t v13 = sub_D720();
      uint64_t v14 = type metadata accessor for AlarmTimeResolver();
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = 0x6D69546D72616C61;
      *(void *)(v15 + 24) = 0xE900000000000065;
      *((void *)v4 + 9) = v14;
      uint64_t v16 = sub_C024(&qword_14AE8, (void (*)(uint64_t))type metadata accessor for AlarmTimeResolver);
      *((void *)v4 + 4) = 1701669236;
      *((void *)v4 + 5) = 0xE400000000000000;
      *((void *)v4 + 6) = v15;
      goto LABEL_10;
    case 2:
    case 4:
    case 5:
      return v4;
    case 3:
      sub_4388(&qword_14AD8);
      uint64_t v4 = (void *)swift_allocObject();
      *((_OWORD *)v4 + 1) = xmmword_DF40;
      sub_4388(&qword_14A28);
      sub_D5F0();
      sub_D900();
      sub_D780();
      sub_D730();
      swift_allocObject();
      uint64_t v17 = sub_D720();
      uint64_t v18 = type metadata accessor for AlarmLabelResolver();
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = 0x62614C6D72616C61;
      *(void *)(v19 + 24) = 0xEA00000000006C65;
      *((void *)v4 + 9) = v18;
      uint64_t v20 = sub_C024(&qword_14AE0, (void (*)(uint64_t))type metadata accessor for AlarmLabelResolver);
      *((void *)v4 + 5) = 0xEA00000000006C65;
      *((void *)v4 + 6) = v19;
      *((void *)v4 + 4) = 0x62614C6D72616C61;
      *((void *)v4 + 10) = v20;
      *((void *)v4 + 11) = v17;
      swift_bridgeObjectRelease();
      sub_D7A0();
      sub_739C(0xD000000000000063, 0x800000000000E690, 1);
      swift_allocObject();
      uint64_t v9 = sub_D720();
      uint64_t v21 = type metadata accessor for AlarmTimeResolver();
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = 0x6D69546D72616C61;
      *(void *)(v22 + 24) = 0xE900000000000065;
      *((void *)v4 + 17) = v21;
      uint64_t v12 = sub_C024(&qword_14AE8, (void (*)(uint64_t))type metadata accessor for AlarmTimeResolver);
      *((void *)v4 + 12) = 1701669236;
      *((void *)v4 + 13) = 0xE400000000000000;
      *((void *)v4 + 14) = v22;
      goto LABEL_5;
    case 6:
      sub_4388(&qword_14AD8);
      uint64_t v4 = (void *)swift_allocObject();
      *((_OWORD *)v4 + 1) = xmmword_DED0;
      sub_D7A0();
      sub_D920();
      sub_D780();
      sub_D730();
      swift_allocObject();
      uint64_t v23 = sub_D720();
      uint64_t v24 = type metadata accessor for TimerDurationResolver();
      uint64_t v25 = swift_allocObject();
      strcpy((char *)(v25 + 16), "timerDuration");
      *(_WORD *)(v25 + 30) = -4864;
      *((void *)v4 + 9) = v24;
      uint64_t v26 = sub_C024(&qword_14B00, (void (*)(uint64_t))type metadata accessor for TimerDurationResolver);
      *((void *)v4 + 4) = 0x6E6F697461727564;
      *((void *)v4 + 5) = 0xE800000000000000;
      *((void *)v4 + 6) = v25;
      *((void *)v4 + 10) = v26;
      *((void *)v4 + 11) = v23;
      goto LABEL_11;
    case 7:
      sub_4388(&qword_14AD8);
      uint64_t v4 = (void *)swift_allocObject();
      *((_OWORD *)v4 + 1) = xmmword_DED0;
      sub_D7A0();
      sub_D790();
      sub_D730();
      swift_allocObject();
      uint64_t v27 = sub_D720();
      uint64_t v28 = type metadata accessor for DisplayOnlyResolver();
      uint64_t v29 = swift_allocObject();
      strcpy((char *)(v29 + 16), "isDisplayOnly");
      *(_WORD *)(v29 + 30) = -4864;
      *((void *)v4 + 9) = v28;
      uint64_t v30 = sub_C024(&qword_14AF8, (void (*)(uint64_t))type metadata accessor for DisplayOnlyResolver);
      *((_WORD *)v4 + 23) = -4864;
      *((void *)v4 + 6) = v29;
      strcpy((char *)v4 + 32, "isDisplayOnly");
      *((void *)v4 + 10) = v30;
      *((void *)v4 + 11) = v27;
      goto LABEL_11;
    case 8:
      sub_4388(&qword_14AD8);
      uint64_t v4 = (void *)swift_allocObject();
      *((_OWORD *)v4 + 1) = xmmword_DED0;
      sub_4388(&qword_14A28);
      sub_D5F0();
      sub_739C(0xD00000000000005ELL, 0x800000000000E5C0, 4);
      sub_D730();
      swift_allocObject();
      uint64_t v13 = sub_D720();
      uint64_t v31 = type metadata accessor for TimerLabelResolver();
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = 0x62614C72656D6974;
      *(void *)(v32 + 24) = 0xEA00000000006C65;
      *((void *)v4 + 9) = v31;
      uint64_t v16 = sub_C024(&qword_14AF0, (void (*)(uint64_t))type metadata accessor for TimerLabelResolver);
      *((void *)v4 + 5) = 0xEA00000000006C65;
      *((void *)v4 + 6) = v32;
      *((void *)v4 + 4) = 0x62614C72656D6974;
LABEL_10:
      *((void *)v4 + 10) = v16;
      *((void *)v4 + 11) = v13;
      goto LABEL_11;
    default:
      sub_4388(&qword_14AD8);
      uint64_t v4 = (void *)swift_allocObject();
      *((_OWORD *)v4 + 1) = xmmword_DF40;
      sub_D7A0();
      sub_D920();
      sub_D780();
      sub_D730();
      swift_allocObject();
      uint64_t v5 = sub_D720();
      uint64_t v6 = type metadata accessor for TimerDurationResolver();
      uint64_t v7 = swift_allocObject();
      strcpy((char *)(v7 + 16), "timerDuration");
      *(_WORD *)(v7 + 30) = -4864;
      *((void *)v4 + 9) = v6;
      uint64_t v8 = sub_C024(&qword_14B00, (void (*)(uint64_t))type metadata accessor for TimerDurationResolver);
      *((void *)v4 + 4) = 0x6E6F697461727564;
      *((void *)v4 + 5) = 0xE800000000000000;
      *((void *)v4 + 6) = v7;
      *((void *)v4 + 10) = v8;
      *((void *)v4 + 11) = v5;
      swift_bridgeObjectRelease();
      sub_4388(&qword_14A28);
      sub_D5F0();
      sub_739C(0xD00000000000005ELL, 0x800000000000E490, 4);
      swift_allocObject();
      uint64_t v9 = sub_D720();
      uint64_t v10 = type metadata accessor for TimerLabelResolver();
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = 0x62614C72656D6974;
      *(void *)(v11 + 24) = 0xEA00000000006C65;
      *((void *)v4 + 17) = v10;
      uint64_t v12 = sub_C024(&qword_14AF0, (void (*)(uint64_t))type metadata accessor for TimerLabelResolver);
      *((void *)v4 + 13) = 0xEA00000000006C65;
      *((void *)v4 + 14) = v11;
      *((void *)v4 + 12) = 0x62614C72656D6974;
LABEL_5:
      *((void *)v4 + 18) = v12;
      *((void *)v4 + 19) = v9;
LABEL_11:
      swift_bridgeObjectRelease();
      return v4;
  }
}

uint64_t sub_BB8C()
{
  uint64_t v0 = sub_D960();
  sub_85C0(v0, qword_14AB0);
  sub_8588(v0, (uint64_t)qword_14AB0);
  return sub_D650();
}

void sub_BBD8()
{
  qword_14BB0 = (uint64_t)&off_10848;
}

uint64_t sub_BBEC(char a1)
{
  uint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x616C416E41746573;
      break;
    case 2:
    case 4:
      return result;
    case 3:
      uint64_t result = 0x6C41657461647075;
      break;
    case 5:
      unsigned int v3 = 1952540791;
      goto LABEL_6;
    case 6:
      uint64_t result = 0x72656D6954746573;
      break;
    case 7:
      uint64_t result = 0x547373696D736964;
      break;
    case 8:
      uint64_t result = 0x6954686372616573;
      break;
    default:
      unsigned int v3 = 1098147187;
LABEL_6:
      uint64_t result = v3 | 0x656D695400000000;
      break;
  }
  return result;
}

uint64_t sub_BD34(unsigned __int8 *a1, char *a2)
{
  return sub_4FDC(*a1, *a2);
}

uint64_t sub_BD40@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_C958(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_BD70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_BBEC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_BD9C(void *a1@<X8>)
{
  *a1 = &off_10818;
}

Swift::Int sub_BDAC()
{
  return sub_DB00();
}

uint64_t sub_BDF4()
{
  return sub_52E0();
}

Swift::Int sub_BDFC()
{
  return sub_DB00();
}

uint64_t sub_BE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_14B38 + dword_14B38);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_5FD4;
  return v9(a1, a2, a3);
}

char *sub_BF00(char *result, int64_t a2, char a3, char *a4)
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
      sub_4388(&qword_14B58);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_C9A4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_C024(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *initializeBufferWithCopyOfBuffer for TimeSuggestion(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TimeSuggestion(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TimeSuggestion(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0xC1D8);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_C200(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_C208(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TimeSuggestion()
{
  return &type metadata for TimeSuggestion;
}

uint64_t initializeBufferWithCopyOfBuffer for Parameter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Parameter(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    sub_72E8(a1 + 16);
  }
  return swift_release();
}

uint64_t initializeWithCopy for Parameter(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 2;
  uint64_t v6 = a2[5];
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, void *, uint64_t))(v6 - 8))(a1 + 16, v5, v6);
  }
  else
  {
    long long v8 = *((_OWORD *)v5 + 1);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 32) = v8;
    *(void *)(a1 + 48) = v5[4];
  }
  *(void *)(a1 + 56) = a2[7];
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Parameter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
      *(void *)(a1 + 40) = v4;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    sub_72E8(a1 + 16);
    goto LABEL_7;
  }
  sub_C43C((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *sub_C43C(uint64_t *result, uint64_t *a2)
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
        size_t v11 = *(uint64_t (**)(void))(v10 + 24);
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

__n128 initializeWithTake for Parameter(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Parameter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    sub_72E8(a1 + 16);
  }
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Parameter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Parameter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Parameter()
{
  return &type metadata for Parameter;
}

ValueMetadata *type metadata accessor for TimeSourceGenerator()
{
  return &type metadata for TimeSourceGenerator;
}

unint64_t sub_C7AC()
{
  unint64_t result = qword_14B08;
  if (!qword_14B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14B08);
  }
  return result;
}

unint64_t sub_C804()
{
  unint64_t result = qword_14B18;
  if (!qword_14B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14B18);
  }
  return result;
}

unint64_t sub_C85C()
{
  unint64_t result = qword_14B20;
  if (!qword_14B20)
  {
    sub_C8B8(&qword_14B28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14B20);
  }
  return result;
}

uint64_t sub_C8B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_C904()
{
  unint64_t result = qword_14B30;
  if (!qword_14B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14B30);
  }
  return result;
}

uint64_t sub_C958(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_108A0;
  v6._object = a2;
  unint64_t v4 = sub_DAC0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_C9A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_4388(&qword_14B60);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_DAB0();
  __break(1u);
  return result;
}

uint64_t sub_CAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[30] = a1;
  v3[31] = a3;
  uint64_t v4 = sub_D8D0();
  v3[32] = v4;
  v3[33] = *(void *)(v4 - 8);
  v3[34] = swift_task_alloc();
  sub_4388(&qword_14B40);
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for TimeSuggestionExecutionParameters();
  v3[37] = v5;
  v3[38] = *(void *)(v5 - 8);
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  return _swift_task_switch(sub_CC20, 0, 0);
}

uint64_t sub_CC20()
{
  v56 = v0;
  uint64_t v1 = v0 + 30;
  unint64_t v2 = (void *)v0[30];
  sub_7240(v2, v2[3]);
  uint64_t v3 = sub_D6D0();
  if (!v4) {
    goto LABEL_44;
  }
  if (v3 == 0xD000000000000013 && v4 == 0x800000000000ED10)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  char v5 = sub_DAE0();
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
  {
LABEL_44:
    if (qword_144B0 != -1) {
      swift_once();
    }
    uint64_t v31 = *v1;
    uint64_t v32 = sub_D960();
    sub_8588(v32, (uint64_t)qword_14AB0);
    sub_9F6C(v31, (uint64_t)(v0 + 2));
    uint64_t v33 = sub_D950();
    os_log_type_t v34 = sub_DA00();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136315138;
      sub_7240(v0 + 2, v0[5]);
      v0[27] = sub_D6D0();
      v0[28] = v36;
      sub_4388(&qword_14B48);
      uint64_t v37 = sub_D990();
      v0[29] = sub_8624(v37, v38, &v55);
      sub_DA40();
      swift_bridgeObjectRelease();
      sub_72E8((uint64_t)(v0 + 2));
      _os_log_impl(&def_6FC4, v33, v34, "Unexpected interaction verb: %s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_72E8((uint64_t)(v0 + 2));
    }

    goto LABEL_51;
  }
LABEL_6:
  if (qword_144B8 != -1) {
    swift_once();
  }
  uint64_t v53 = *(void *)(qword_14BB0 + 16);
  if (v53)
  {
    v48 = (long long *)(v0 + 7);
    unint64_t v6 = (long long *)(v0 + 12);
    uint64_t v7 = v0 + 17;
    uint64_t v49 = v0[39];
    uint64_t v50 = v0[40];
    uint64_t v42 = v0[37];
    uint64_t v8 = v0[33];
    uint64_t v46 = v0[31];
    uint64_t v47 = (uint64_t)(v0 + 22);
    uint64_t v52 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0[38] + 48);
    unsigned int v45 = enum case for Objective.discoverability(_:);
    uint64_t v43 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    uint64_t v44 = (void (**)(uint64_t, void, uint64_t))(v8 + 104);
    uint64_t v54 = qword_14BB0;
    swift_bridgeObjectRetain();
    uint64_t v9 = v54;
    uint64_t v10 = 0;
    long long v51 = (char *)&_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v11 = (uint64_t)v7;
      uint64_t v12 = v6;
      uint64_t v13 = *(unsigned __int8 *)(v9 + v10++ + 32);
      sub_7240((void *)*v1, v2[3]);
      sub_D6C0();
      switch(v13)
      {
        case 6:
          uint64_t v15 = v0[36];
          uint64_t v14 = v0[37];
          uint64_t v16 = swift_bridgeObjectRetain();
          sub_3A28(v16, v15);
          uint64_t v7 = (void *)v11;
          if ((*v52)(v15, 1, v14) == 1)
          {
            uint64_t v17 = v0[36];
            goto LABEL_17;
          }
          sub_D3D0(v0[36], v0[40]);
          uint64_t v21 = (double *)v0[40];
          if (*(void *)(v50 + 8)) {
            goto LABEL_34;
          }
          double v22 = *v21;
          sub_D434((uint64_t)v21);
          swift_bridgeObjectRelease();
          if (v22 >= 120.0 && v22 < 1800.0) {
            goto LABEL_36;
          }
          goto LABEL_11;
        case 7:
          uint64_t v18 = v0[37];
          uint64_t v19 = v0[35];
          uint64_t v20 = swift_bridgeObjectRetain();
          sub_3A28(v20, v19);
          uint64_t v7 = (void *)v11;
          if ((*v52)(v19, 1, v18) == 1)
          {
            uint64_t v17 = v0[35];
LABEL_17:
            sub_A38C(v17, &qword_14B40);
          }
          else
          {
            sub_D3D0(v0[35], v0[39]);
            if (*(unsigned char *)(v49 + 16))
            {
              uint64_t v21 = (double *)v0[39];
              if (!*(void *)(v49 + 8) && (*((unsigned char *)v21 + *(int *)(v42 + 32)) & 1) != 0)
              {
                double v24 = *v21;
                sub_D434((uint64_t)v21);
                swift_bridgeObjectRelease();
                if (v24 >= 120.0 && v24 < 1800.0)
                {
LABEL_36:
                  uint64_t v26 = v0[34];
                  uint64_t v27 = v0[32];
                  sub_7240((void *)v0[31], *(void *)(v46 + 24));
                  sub_A608((uint64_t)&_swiftEmptyArrayStorage);
                  (*v44)(v26, v45, v27);
                  uint64_t v7 = (void *)v11;
                  sub_D830();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  (*v43)(v26, v27);
                  unint64_t v6 = v12;
                  sub_D490(v11, (uint64_t)v12);
                  if (v0[15])
                  {
                    sub_D4F8(v12, v47);
                    sub_9F6C(v47, (uint64_t)v48);
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      long long v51 = sub_BF00(0, *((void *)v51 + 2) + 1, 1, v51);
                    }
                    unint64_t v29 = *((void *)v51 + 2);
                    unint64_t v28 = *((void *)v51 + 3);
                    if (v29 >= v28 >> 1) {
                      long long v51 = sub_BF00((char *)(v28 > 1), v29 + 1, 1, v51);
                    }
                    *((void *)v51 + 2) = v29 + 1;
                    sub_D4F8(v48, (uint64_t)&v51[40 * v29 + 32]);
                    sub_72E8(v47);
                    uint64_t v30 = v11;
                    unint64_t v6 = v12;
                  }
                  else
                  {
                    sub_A38C(v11, &qword_14B50);
                    uint64_t v30 = (uint64_t)v12;
                  }
                  sub_A38C(v30, &qword_14B50);
                }
                goto LABEL_11;
              }
            }
            else
            {
              uint64_t v21 = (double *)v0[39];
            }
LABEL_34:
            sub_D434((uint64_t)v21);
          }
          swift_bridgeObjectRelease();
LABEL_11:
          uint64_t v9 = v54;
          if (v53 == v10)
          {
            swift_bridgeObjectRelease();
            unint64_t v39 = v51;
            goto LABEL_52;
          }
          break;
        default:
          swift_bridgeObjectRelease();
          uint64_t v7 = (void *)v11;
          goto LABEL_11;
      }
    }
  }
LABEL_51:
  unint64_t v39 = (char *)&_swiftEmptyArrayStorage;
LABEL_52:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = (uint64_t (*)(char *))v0[1];
  return v40(v39);
}

uint64_t sub_D3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimeSuggestionExecutionParameters();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_D434(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimeSuggestionExecutionParameters();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_D490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4388(&qword_14B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_D4F8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_D510()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D520()
{
  return DateComponents.date.getter();
}

uint64_t sub_D530()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_D540()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_D550()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_D560()
{
  return URL.path.getter();
}

uint64_t sub_D570()
{
  return type metadata accessor for URL();
}

uint64_t sub_D580()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_D590()
{
  return type metadata accessor for Date();
}

uint64_t sub_D5A0()
{
  return Locale.init(identifier:)();
}

uint64_t sub_D5B0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_D5C0()
{
  return TimeZone.identifier.getter();
}

uint64_t sub_D5D0()
{
  return static TimeZone.current.getter();
}

uint64_t sub_D5E0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_D5F0()
{
  return Transformer.init(transform:)();
}

uint64_t sub_D600()
{
  return static ResponseMode.displayOnly.getter();
}

uint64_t sub_D610()
{
  return static ResponseMode.== infix(_:_:)();
}

uint64_t sub_D620()
{
  return type metadata accessor for ResponseMode();
}

uint64_t sub_D630()
{
  return SpeakableString.print.getter();
}

uint64_t sub_D640()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_D650()
{
  return static SiriTimeLog.suggestions.getter();
}

uint64_t sub_D660()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_D670()
{
  return type metadata accessor for SiriHintsMode();
}

uint64_t sub_D680()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_D690()
{
  return type metadata accessor for IntentType();
}

uint64_t sub_D6A0()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_D6B0()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_D6C0()
{
  return dispatch thunk of Interaction.executionParameters.getter();
}

uint64_t sub_D6D0()
{
  return dispatch thunk of Interaction.verb.getter();
}

uint64_t sub_D6E0()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_D6F0()
{
  return type metadata accessor for DeliveryVehicle();
}

uint64_t sub_D700()
{
  return type metadata accessor for IntentParameter();
}

uint64_t sub_D710()
{
  return dispatch thunk of CandidateSuggestion.context.getter();
}

uint64_t sub_D720()
{
  return ResolvableParameter.init(typeIdentifier:required:loggingKeyTransformer:intentTransformer:)();
}

uint64_t sub_D730()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_D740()
{
  return type metadata accessor for VersionedInvocation();
}

uint64_t sub_D750()
{
  return static VersionedInvocations.HintsDawnA.getter();
}

uint64_t sub_D760()
{
  return static VersionedInvocations.HintsDawnC.getter();
}

uint64_t sub_D780()
{
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)();
}

uint64_t sub_D790()
{
  return static SuggestionTransformers.ignoreIntentValue()();
}

uint64_t sub_D7A0()
{
  return static SuggestionTransformers.removeParameterFromLogging()();
}

uint64_t sub_D7B0()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t sub_D7C0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t sub_D7D0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t sub_D7E0()
{
  return dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)();
}

uint64_t sub_D7F0()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
}

uint64_t sub_D800()
{
  return dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
}

uint64_t sub_D810()
{
  return dispatch thunk of SuggestionDetailsBuilder.registerForInAppDonation(appBundleIds:)();
}

uint64_t sub_D820()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t sub_D830()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:)();
}

uint64_t sub_D840()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
}

uint64_t sub_D850()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t sub_D860()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_D870()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_D880()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_D890()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_D8A0()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_D8B0()
{
  return type metadata accessor for Signal();
}

uint64_t sub_D8C0()
{
  return Context.getIntentParameter(name:)();
}

uint64_t sub_D8D0()
{
  return type metadata accessor for Objective();
}

uint64_t sub_D8E0()
{
  return Wrappable.getRoot()();
}

uint64_t sub_D8F0()
{
  return type metadata accessor for CreateAlarmIntent();
}

uint64_t sub_D900()
{
  return type metadata accessor for UpdateAlarmIntent();
}

uint64_t sub_D910()
{
  return CreateTimerIntent.duration.getter();
}

uint64_t sub_D920()
{
  return type metadata accessor for CreateTimerIntent();
}

uint64_t sub_D930()
{
  return type metadata accessor for SearchTimerIntent();
}

uint64_t sub_D940()
{
  return SiriTimerType.rawValue.getter();
}

uint64_t sub_D950()
{
  return Logger.logObject.getter();
}

uint64_t sub_D960()
{
  return type metadata accessor for Logger();
}

uint64_t sub_D970()
{
  return Dictionary.description.getter();
}

uint64_t sub_D980()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D990()
{
  return String.init<A>(describing:)();
}

uint64_t sub_D9A0()
{
  return String.hash(into:)();
}

void sub_D9B0(Swift::String a1)
{
}

Swift::Int sub_D9C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_D9D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_D9E0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_D9F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_DA00()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_DA10()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_DA20()
{
  return INSpeakableString.toSpeakableString.getter();
}

uint64_t sub_DA30()
{
  return type metadata accessor for Optional();
}

uint64_t sub_DA40()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_DA50()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_DA60(Swift::Int a1)
{
}

uint64_t sub_DA70()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_DA80()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_DA90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_DAA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_DAB0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_DAC0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_DAD0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_DAE0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_DAF0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_DB00()
{
  return Hasher._finalize()();
}

uint64_t AFSystemRootDirectory()
{
  return _AFSystemRootDirectory();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}