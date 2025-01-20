uint64_t *sub_375C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_75A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_7480();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_3864(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_7480();
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_390C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7480();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_39C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7480();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_3A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7480();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_3B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7480();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_3BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_3C00);
}

uint64_t sub_3C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_7480();
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_3CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3D0C);
}

uint64_t sub_3D0C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_75A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_7480();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for AppLaunchButton()
{
  uint64_t result = qword_C108;
  if (!qword_C108) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3E5C()
{
  uint64_t result = sub_75A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_7480();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_3F24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_3F40()
{
  uint64_t v0 = sub_75D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)SAAppsLaunchApp) init];
  type metadata accessor for AppLaunchButton();
  sub_7460();
  if (v5)
  {
    NSString v6 = sub_75E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  [v4 setLaunchId:v6];

  sub_7580();
  id v7 = v4;
  sub_75B0();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_4098@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for AppLaunchButton();
  sub_7470();
  sub_4758();
  uint64_t result = sub_74D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_4114()
{
  return sub_7520();
}

uint64_t sub_4130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  v19[1] = a2;
  v19[0] = sub_7540();
  uint64_t v5 = *(void *)(v19[0] - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v6);
  uint64_t v11 = sub_43C8(&qword_C140);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_440C(v2, (uint64_t)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  sub_4594((uint64_t)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  v19[4] = v4;
  sub_7530();
  sub_74C0();
  sub_465C();
  sub_4700();
  uint64_t v17 = v19[0];
  sub_7510();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_43C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_440C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_4470()
{
  uint64_t v1 = (int *)(type metadata accessor for AppLaunchButton() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v6 + v1[7];
  uint64_t v9 = sub_7480();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_4594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_45F8()
{
  return sub_3F40();
}

uint64_t sub_4654@<X0>(uint64_t a1@<X8>)
{
  return sub_4098(a1);
}

unint64_t sub_465C()
{
  unint64_t result = qword_C148;
  if (!qword_C148)
  {
    sub_46B8(&qword_C140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C148);
  }
  return result;
}

uint64_t sub_46B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_4700()
{
  unint64_t result = qword_C150;
  if (!qword_C150)
  {
    sub_7540();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C150);
  }
  return result;
}

unint64_t sub_4758()
{
  unint64_t result = qword_C158;
  if (!qword_C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C158);
  }
  return result;
}

uint64_t sub_47AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_4828(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_75A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_7490();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_4930(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_7490();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_49D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_4A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_4B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_4C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7490();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_4CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_4CCC);
}

uint64_t sub_4CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_7490();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_4DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_4DD8);
}

uint64_t sub_4DD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_75A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_7490();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for ConfirmationView()
{
  uint64_t result = qword_C1B8;
  if (!qword_C1B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_4F28()
{
  uint64_t result = sub_75A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_7490();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_4FF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_500C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v23 = a3;
  uint64_t v24 = a4;
  uint64_t v6 = type metadata accessor for ConfirmationView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5504(a1, (uint64_t)v9);
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  v22[1] = v10 | 7;
  unint64_t v12 = (v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = swift_allocObject();
  sub_56B8((uint64_t)v9, v13 + v11);
  *(void *)(v13 + v12) = a2;
  uint64_t v14 = a2;
  uint64_t v26 = a1;
  uint64_t v15 = sub_43C8(&qword_C140);
  v28[3] = v15;
  uint64_t v16 = sub_5AE0(&qword_C1F8, &qword_C140);
  v28[4] = v16;
  sub_5854(v28);
  id v17 = v14;
  sub_7530();
  sub_5504(a1, (uint64_t)v9);
  uint64_t v18 = swift_allocObject();
  sub_56B8((uint64_t)v9, v18 + v11);
  v19 = v23;
  *(void *)(v18 + v12) = v23;
  uint64_t v25 = a1;
  v27[3] = v15;
  v27[4] = v16;
  sub_5854(v27);
  id v20 = v19;
  sub_7530();
  return sub_7560();
}

uint64_t sub_526C()
{
  uint64_t v0 = sub_75D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_7580();
  sub_75C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_5348@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for ConfirmationView();
  a1();
  sub_4758();
  uint64_t result = sub_74D0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_53C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_74B0();
  uint64_t v7 = v6;
  sub_5504(v1, (uint64_t)v4);
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v9 = (v3 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = swift_allocObject();
  sub_56B8((uint64_t)v4, v10 + v8);
  *(void *)(v10 + v9) = v5;
  *(void *)(v10 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)) = v7;
  sub_7570();
  sub_57C4();
  return sub_7550();
}

uint64_t sub_5504(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_5568()
{
  uint64_t v1 = (int *)(type metadata accessor for ConfirmationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v7 + v1[7];
  uint64_t v10 = sub_7490();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  return _swift_deallocObject(v0, v6 + 8, v4);
}

uint64_t sub_56B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_571C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ConfirmationView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void **)(v1 + v5);
  uint64_t v7 = *(void **)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_500C(v1 + v4, v6, v7, a1);
}

unint64_t sub_57C4()
{
  unint64_t result = qword_C1F0;
  if (!qword_C1F0)
  {
    sub_7570();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C1F0);
  }
  return result;
}

uint64_t sub_5824@<X0>(uint64_t a1@<X8>)
{
  return sub_5348((void (*)(void))&SiriKitSnippets.ConfirmationSnippetModel.yesLabel.getter, a1);
}

uint64_t *sub_5854(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_58BC()
{
  uint64_t v1 = (int *)(type metadata accessor for ConfirmationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v6 + v1[7];
  uint64_t v9 = sub_7490();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_59F4()
{
  return sub_526C();
}

uint64_t sub_5A74@<X0>(uint64_t a1@<X8>)
{
  return sub_5348((void (*)(void))&SiriKitSnippets.ConfirmationSnippetModel.noLabel.getter, a1);
}

uint64_t sub_5AA4()
{
  return sub_5AE0(&qword_C200, &qword_C208);
}

uint64_t sub_5AE0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_46B8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_5B24(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_75A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_7450();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_5C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_7450();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_5CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_5D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_5E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_5EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_7450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_5FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5FC8);
}

uint64_t sub_5FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_75A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_7450();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_60C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_60D4);
}

uint64_t sub_60D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_75A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_7450();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for PunchOutButton()
{
  uint64_t result = qword_C268;
  if (!qword_C268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_6224()
{
  uint64_t result = sub_75A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_7450();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_62EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_6308()
{
  uint64_t v1 = sub_75D0();
  uint64_t v25 = *(void *)(v1 - 8);
  uint64_t v26 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_7420();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_43C8(&qword_C2A0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_73F0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = [objc_allocWithZone((Class)SAUIAppPunchOut) init];
  type metadata accessor for PunchOutButton();
  uint64_t v24 = v0;
  sub_7430();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {

    return sub_6BC8((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    id v17 = v15;
    sub_7410();
    sub_7400();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    NSString v18 = sub_75E0();
    swift_bridgeObjectRelease();
    [v17 setAceId:v18];

    sub_73E0(v19);
    v21 = v20;
    [v17 setPunchOutUri:v20];

    sub_7580();
    id v22 = v17;
    sub_75B0();

    (*(void (**)(char *, uint64_t))(v25 + 8))(v3, v26);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_666C@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for PunchOutButton();
  sub_7440();
  sub_4758();
  uint64_t result = sub_74D0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_66E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  v19[1] = a2;
  v19[0] = sub_7540();
  uint64_t v5 = *(void *)(v19[0] - 8);
  uint64_t v6 = __chkstk_darwin(v19[0]);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v6);
  uint64_t v11 = sub_43C8(&qword_C140);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6978(v2, (uint64_t)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  sub_6B00((uint64_t)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  v19[4] = v4;
  sub_7530();
  sub_74C0();
  sub_465C();
  sub_4700();
  uint64_t v17 = v19[0];
  sub_7510();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_6978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchOutButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_69DC()
{
  uint64_t v1 = (int *)(type metadata accessor for PunchOutButton() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_75A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v6 + v1[7];
  uint64_t v9 = sub_7450();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_6B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PunchOutButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_6B64()
{
  return sub_6308();
}

uint64_t sub_6BC0@<X0>(uint64_t a1@<X8>)
{
  return sub_666C(a1);
}

uint64_t sub_6BC8(uint64_t a1)
{
  uint64_t v2 = sub_43C8(&qword_C2A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_6C28()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SiriKitFlowSnippetUIPlugin()
{
  return self;
}

uint64_t sub_6C5C()
{
  return sub_7338(&qword_C340, (void (*)(uint64_t))&type metadata accessor for SiriKitSnippets);
}

uint64_t sub_6CA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_6CD8(uint64_t a1)
{
  return sub_6CF0(a1);
}

uint64_t sub_6CF0(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v35 = type metadata accessor for ConfirmationView();
  __chkstk_darwin(v35);
  v33 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_7490();
  uint64_t v32 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  v31 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for PunchOutButton();
  __chkstk_darwin(v30);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_7450();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  __chkstk_darwin(v5);
  v27 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AppLaunchButton();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_7480();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_74A0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v36, v14);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == enum case for SiriKitSnippets.appLaunchButton(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v17, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v9[*(int *)(v7 + 20)], v13, v10);
    sub_7590();
    sub_7338(&qword_C358, (void (*)(uint64_t))type metadata accessor for AppLaunchButton);
    uint64_t v19 = sub_74E0();
    sub_7380((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for AppLaunchButton);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v19;
  }
  if (v18 == enum case for SiriKitSnippets.punchOutButton(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    v21 = v27;
    uint64_t v20 = v28;
    uint64_t v22 = v29;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v27, v17, v29);
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(&v4[*(int *)(v30 + 20)], v21, v22);
    sub_7590();
    sub_7338(&qword_C350, (void (*)(uint64_t))type metadata accessor for PunchOutButton);
    uint64_t v19 = sub_74E0();
    uint64_t v23 = type metadata accessor for PunchOutButton;
    uint64_t v24 = (uint64_t)v4;
LABEL_7:
    sub_7380(v24, (uint64_t (*)(void))v23);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
    return v19;
  }
  if (v18 == enum case for SiriKitSnippets.confirmationSnippet(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    v21 = v31;
    uint64_t v20 = v32;
    uint64_t v22 = v34;
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v31, v17, v34);
    uint64_t v25 = v33;
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(&v33[*(int *)(v35 + 20)], v21, v22);
    sub_7590();
    sub_7338(&qword_C348, (void (*)(uint64_t))type metadata accessor for ConfirmationView);
    uint64_t v19 = sub_74E0();
    uint64_t v23 = type metadata accessor for ConfirmationView;
    uint64_t v24 = (uint64_t)v25;
    goto LABEL_7;
  }
  uint64_t result = sub_75F0();
  __break(1u);
  return result;
}

uint64_t sub_7338(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_7380(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_73E0(NSURL *retstr@<X8>)
{
}

uint64_t sub_73F0()
{
  return type metadata accessor for URL();
}

uint64_t sub_7400()
{
  return UUID.uuidString.getter();
}

uint64_t sub_7410()
{
  return UUID.init()();
}

uint64_t sub_7420()
{
  return type metadata accessor for UUID();
}

uint64_t sub_7430()
{
  return SiriKitSnippets.PunchOutSnippetModel.punchOutURL.getter();
}

uint64_t sub_7440()
{
  return SiriKitSnippets.PunchOutSnippetModel.label.getter();
}

uint64_t sub_7450()
{
  return type metadata accessor for SiriKitSnippets.PunchOutSnippetModel();
}

uint64_t sub_7460()
{
  return SiriKitSnippets.AppLaunchSnippetModel.appIdentifier.getter();
}

uint64_t sub_7470()
{
  return SiriKitSnippets.AppLaunchSnippetModel.label.getter();
}

uint64_t sub_7480()
{
  return type metadata accessor for SiriKitSnippets.AppLaunchSnippetModel();
}

uint64_t sub_7490()
{
  return type metadata accessor for SiriKitSnippets.ConfirmationSnippetModel();
}

uint64_t sub_74A0()
{
  return type metadata accessor for SiriKitSnippets();
}

uint64_t sub_74B0()
{
  return static InvocationFactory.makeConfirmAndRejectActions()();
}

uint64_t sub_74C0()
{
  return static ButtonStyle<>.buttonItemPreferred.getter();
}

uint64_t sub_74D0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_74E0()
{
  return View.eraseToAnyView()();
}

uint64_t sub_74F0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_7500()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_7510()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_7520()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_7530()
{
  return Button.init(action:label:)();
}

uint64_t sub_7540()
{
  return type metadata accessor for ButtonItemButtonStyle();
}

uint64_t sub_7550()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_7560()
{
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t sub_7570()
{
  return type metadata accessor for BinaryButtonView();
}

uint64_t sub_7580()
{
  return InteractionDelegate.wrappedValue.getter();
}

uint64_t sub_7590()
{
  return InteractionDelegate.init()();
}

uint64_t sub_75A0()
{
  return type metadata accessor for InteractionDelegate();
}

uint64_t sub_75B0()
{
  return InteractionDelegateWrapper.perform(aceCommand:)();
}

uint64_t sub_75C0()
{
  return InteractionDelegateWrapper.perform(directInvocation:)();
}

uint64_t sub_75D0()
{
  return type metadata accessor for InteractionDelegateWrapper();
}

NSString sub_75E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_75F0()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_retain()
{
  return _swift_retain();
}