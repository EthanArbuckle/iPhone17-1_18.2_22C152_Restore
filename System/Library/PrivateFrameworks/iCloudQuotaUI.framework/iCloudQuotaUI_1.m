void sub_22C95B88C(uint64_t a1, void *a2)
{
  sub_22C95BE54(a2);
}

id RemoteExtensionHostViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_22C9A3688();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void RemoteExtensionHostViewController.init(nibName:bundle:)()
{
}

id RemoteExtensionHostViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteExtensionHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RemoteExtensionHostViewController()
{
  uint64_t result = qword_2684DE000;
  if (!qword_2684DE000) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C95BABC()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22C95BAFC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_22C8D5C6C;
  return sub_22C959D90((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_22C95BB90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D34D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_22C95BE54(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v8 = a1;
  }
  else
  {
    sub_22C8EC5B0();
    v8 = (void *)swift_allocError();
    unsigned char *v9 = 3;
  }
  id v10 = a1;
  uint64_t v11 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  id v12 = v8;
  id v13 = v8;
  v14 = sub_22C9A1A98();
  os_log_type_t v15 = sub_22C9A3AA8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v28 = v2;
    uint64_t v17 = v16;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v17 = 136315906;
    uint64_t v29 = sub_22C8BA27C(0xD000000000000035, 0x800000022C9C0C70, &v30);
    sub_22C9A3C78();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v29 = sub_22C8BA27C(0xD00000000000002ALL, 0x800000022C9C0E20, &v30);
    sub_22C9A3C78();
    *(_WORD *)(v17 + 22) = 2048;
    uint64_t v29 = 106;
    sub_22C9A3C78();
    *(_WORD *)(v17 + 32) = 2080;
    swift_getErrorValue();
    uint64_t v18 = sub_22C9A4138();
    uint64_t v29 = sub_22C8BA27C(v18, v19, &v30);
    sub_22C9A3C78();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22C821000, v14, v15, "%s: %s - line %ld: %s", (uint8_t *)v17, 0x2Au);
    uint64_t v20 = v27;
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v20, -1, -1);
    uint64_t v21 = v17;
    uint64_t v2 = v28;
    MEMORY[0x230F710E0](v21, -1, -1);
  }
  else
  {
  }
  uint64_t v22 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v23 = (void *)MEMORY[0x263F8EED0];
  uint64_t v24 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x68))(v22);
  if (v24)
  {
    v25 = (void *)v24;
    v26 = (void *)sub_22C9A1488();
    (*(void (**)(void))((*v23 & *v25) + 0xB0))();
  }
  else
  {
  }
}

uint64_t sub_22C95C218()
{
  return type metadata accessor for RemoteExtensionHostViewController();
}

void sub_22C95C220()
{
  sub_22C95C358();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for RemoteExtensionHostViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RemoteExtensionHostViewController);
}

uint64_t dispatch thunk of RemoteExtensionHostViewController.__allocating_init(host:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of RemoteExtensionHostViewController.hostViewControllerDidActivate(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of RemoteExtensionHostViewController.hostViewControllerWillDeactivate(_:error:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

void sub_22C95C358()
{
  if (!qword_2684D3540)
  {
    sub_22C9A1948();
    unint64_t v0 = sub_22C9A3C68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2684D3540);
    }
  }
}

uint64_t sub_22C95C3B0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22C95C3E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C95C430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D34D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C95C49C@<X0>(uint64_t a1@<X8>)
{
  sub_22C95C5DC(a1);
  uint64_t v1 = sub_22C9A3158();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    sub_22C8CE388(MEMORY[0x263F8EE78]);
    sub_22C9A3168();
  }
  uint64_t v2 = (void (*)(unsigned char *, void))sub_22C9A3148();
  uint64_t v4 = MEMORY[0x263F8D310];
  if (*v3)
  {
    uint64_t v10 = MEMORY[0x263F8D310];
    unint64_t v8 = 0xD000000000000011;
    unint64_t v9 = 0x800000022C9C0E80;
    sub_22C95CD70((uint64_t)&v8, 0x644965676170, 0xE600000000000000);
  }
  v2(v11, 0);
  uint64_t v5 = (uint64_t (*)(unsigned char *, void))sub_22C9A3148();
  if (*v6)
  {
    uint64_t v10 = v4;
    unint64_t v8 = 0x6C61646F4DLL;
    unint64_t v9 = 0xE500000000000000;
    sub_22C95CD70((uint64_t)&v8, 0x6570795465676170, 0xE800000000000000);
  }
  return v5(v11, 0);
}

uint64_t sub_22C95C5DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v55 = a1;
  uint64_t v1 = sub_22C9A3328();
  MEMORY[0x270FA5388](v1 - 8);
  v54 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22C9A31D8();
  uint64_t v36 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C9A3138();
  MEMORY[0x270FA5388](v7 - 8);
  v57 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3570);
  uint64_t v9 = *(void *)(sub_22C9A3188() - 8);
  uint64_t v52 = *(void *)(v9 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = swift_allocObject();
  uint64_t v53 = v11;
  *(_OWORD *)(v11 + 16) = xmmword_22C9AEA30;
  unint64_t v51 = v11 + v10;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3578);
  uint64_t inited = swift_initStackObject();
  long long v58 = xmmword_22C9B1320;
  *(_OWORD *)(inited + 16) = xmmword_22C9B1320;
  *(void *)(inited + 32) = 0x707954746E657665;
  *(void *)(inited + 40) = 0xE900000000000065;
  sub_22C9A31C8();
  uint64_t v13 = sub_22C9A31B8();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v56 = v4 + 8;
  v49 = v16;
  v16(v6, v3);
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v13;
  *(void *)(inited + 56) = v15;
  sub_22C8CE388(inited);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3580);
  uint64_t v17 = sub_22C9A3508();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 72);
  uint64_t v20 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v21 = (v20 + 32) & ~v20;
  uint64_t v39 = 2 * v19;
  uint64_t v43 = v21 + 3 * v19;
  uint64_t v41 = v20 | 7;
  uint64_t v22 = swift_allocObject();
  long long v40 = xmmword_22C9AEA10;
  *(_OWORD *)(v22 + 16) = xmmword_22C9AEA10;
  uint64_t v38 = sub_22C962B08();
  v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  v37(v22 + v21, v38, v17);
  sub_22C9A34E8();
  sub_22C9A34F8();
  sub_22C95E134(v22);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  unint64_t v48 = 0x800000022C9C0EA0;
  sub_22C9A3128();
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3588);
  uint64_t v23 = *(unsigned __int8 *)(v56 + 72);
  uint64_t v45 = ((v23 + 32) & ~v23) + *(void *)(v56 + 64);
  uint64_t v47 = (v23 + 32) & ~v23;
  uint64_t v44 = v23 | 7;
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = v58;
  sub_22C9A31C8();
  sub_22C95E44C(v24);
  swift_setDeallocating();
  uint64_t v25 = v36;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  unint64_t v26 = v51;
  sub_22C9A3178();
  v52 += v26;
  uint64_t v27 = swift_initStackObject();
  *(_OWORD *)(v27 + 16) = v58;
  *(void *)(v27 + 32) = 0x707954746E657665;
  *(void *)(v27 + 40) = 0xE900000000000065;
  sub_22C9A31A8();
  uint64_t v28 = sub_22C9A31B8();
  uint64_t v30 = v29;
  v49(v6, v25);
  *(void *)(v27 + 72) = MEMORY[0x263F8D310];
  *(void *)(v27 + 48) = v28;
  *(void *)(v27 + 56) = v30;
  sub_22C8CE388(v27);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = v40;
  v37(v31 + v21, v38, v17);
  sub_22C9A34E8();
  sub_22C9A34F8();
  uint64_t v32 = sub_22C95E134(v31);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = v58;
  sub_22C9A34F8();
  sub_22C95E764(v33, v32);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_22C9A3128();
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = v58;
  sub_22C9A31A8();
  sub_22C95E44C(v34);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_22C9A3178();
  sub_22C9A3318();
  sub_22C8CE544(MEMORY[0x263F8EE78]);
  return sub_22C9A3198();
}

uint64_t sub_22C95CD70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_22C8CEC24((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_22C905538(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_22C95E90C(a1);
    sub_22C95CE30(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_22C95E90C((uint64_t)v9);
  }
}

double sub_22C95CE30@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_22C8CED7C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22C8CEE00);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_22C905760();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_22C8CEC24((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_22C95CF48(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_22C95CF48(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_22C9A3CE8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_22C9A4188();
        swift_bridgeObjectRetain();
        sub_22C9A3768();
        uint64_t v10 = sub_22C9A41B8();
        double result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          uint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *uint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_22C95D120(uint64_t a1, char *a2)
{
  int64_t v3 = v2;
  uint64_t v6 = sub_22C9A3508();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_22C95E8C4(&qword_2684D3590, MEMORY[0x263F50CD0]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_22C9A3638();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_22C95E8C4(&qword_2684D3598, MEMORY[0x263F50CD0]);
      char v21 = sub_22C9A3678();
      BOOL v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        int64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_22C95D840((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_22C95D444()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_22C9A3508();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35A0);
  uint64_t v5 = sub_22C9A3DE8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_22C95E8C4(&qword_2684D3590, MEMORY[0x263F50CD0]);
      uint64_t result = sub_22C9A3638();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_22C95D840(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_22C9A3508();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_22C95D444();
  }
  else
  {
    if (v11 > v10)
    {
      sub_22C95DAE0();
      goto LABEL_12;
    }
    sub_22C95DD84();
  }
  uint64_t v12 = *v3;
  sub_22C95E8C4(&qword_2684D3590, MEMORY[0x263F50CD0]);
  uint64_t v13 = sub_22C9A3638();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_22C95E8C4(&qword_2684D3598, MEMORY[0x263F50CD0]);
      char v21 = sub_22C9A3678();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_22C9A4118();
  __break(1u);
  return result;
}

void *sub_22C95DAE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C9A3508();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35A0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_22C9A3DD8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_22C95DD84()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C9A3508();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35A0);
  uint64_t v7 = sub_22C9A3DE8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_22C95E8C4(&qword_2684D3590, MEMORY[0x263F50CD0]);
    uint64_t result = sub_22C9A3638();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22C95E134(uint64_t a1)
{
  uint64_t v2 = sub_22C9A3508();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35A0);
    uint64_t v9 = sub_22C9A3E08();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    BOOL v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_22C95E8C4(&qword_2684D3590, MEMORY[0x263F50CD0]);
      uint64_t v16 = sub_22C9A3638();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_22C95E8C4(&qword_2684D3598, MEMORY[0x263F50CD0]);
          char v23 = sub_22C9A3678();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_22C95E44C(uint64_t a1)
{
  uint64_t v2 = sub_22C9A31D8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35A8);
    uint64_t v9 = sub_22C9A3E08();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    BOOL v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_22C95E8C4(&qword_2684D35B0, MEMORY[0x263F50900]);
      uint64_t v16 = sub_22C9A3638();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_22C95E8C4(&qword_2684D35B8, MEMORY[0x263F50900]);
          char v23 = sub_22C9A3678();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_22C95E764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C9A3508();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v19 = a2;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v13 = v14;
    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v16 = *(void *)(v12 + 56);
    do
    {
      v13(v8, v15, v4);
      sub_22C95D120((uint64_t)v10, v8);
      (*(void (**)(char *, uint64_t))(v12 - 8))(v10, v4);
      v15 += v16;
      --v11;
    }
    while (v11);
    return v19;
  }
  return a2;
}

uint64_t sub_22C95E8C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C95E90C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C95E96C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C95E99C()
{
  return *(unsigned __int8 *)(v0 + 48);
}

unint64_t sub_22C95E9A4()
{
  return 0xD000000000000057;
}

uint64_t sub_22C95E9C0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1790);
  MEMORY[0x230F6EBC0](&v2, v0);
  return v2;
}

uint64_t sub_22C95EA10()
{
  return sub_22C9A2EA8();
}

void (*sub_22C95EA64(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 56);
  uint64_t v5 = *(void *)(v1 + 64);
  v3[4] = v4;
  v3[5] = v5;
  char v6 = *(unsigned char *)(v1 + 72);
  *((unsigned char *)v3 + 19) = v6;
  v3[3] = v4;
  void *v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_22C8E5524((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1790);
  MEMORY[0x230F6EBC0]();
  return sub_22C95EB08;
}

void sub_22C95EB08(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)a1 + 24;
  char v3 = *(unsigned char *)(*(void *)a1 + 18);
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  char v5 = *(unsigned char *)(*(void *)a1 + 19);
  *uint64_t v1 = *(void *)(*(void *)a1 + 32);
  v1[1] = v4;
  *((unsigned char *)v1 + 16) = v5;
  *((unsigned char *)v1 + 17) = v3;
  sub_22C9A2EA8();
  sub_22C8E6248(v2);
  swift_release();
  free(v1);
}

uint64_t sub_22C95EB7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1790);
  sub_22C9A2EB8();
  return v1;
}

uint64_t sub_22C95EBD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v2 = sub_22C9A1458();
  MEMORY[0x270FA5388](v2 - 8);
  char v23 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_22C9A1398();
  uint64_t v6 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22C9A13A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22C9A13C8();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v1 + 24);
  uint64_t v21 = *(void *)(v1 + 32);
  uint64_t v22 = v17;
  uint64_t v29 = v17;
  uint64_t v30 = v21;
  swift_bridgeObjectRetain();
  sub_22C9A3788();
  sub_22C8E8510();
  sub_22C9A3788();
  swift_bridgeObjectRelease();
  sub_22C9A3788();
  v20[1] = "xp_ase_icloudsettings_ue";
  sub_22C9A3788();
  sub_22C9A3788();
  uint64_t v18 = sub_22C9A14E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F06760], v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F06748], v24);
  sub_22C9A13B8();
  return sub_22C9A13D8();
}

uint64_t sub_22C95F288@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v1 = sub_22C9A1458();
  MEMORY[0x270FA5388](v1 - 8);
  v18[4] = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22C9A1AA8();
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v20 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_22C9A1398();
  uint64_t v5 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22C9A13A8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22C9A13C8();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = 91;
  unint64_t v25 = 0xE100000000000000;
  v18[2] = "s been configured by a profile.";
  sub_22C8E8510();
  sub_22C9A3788();
  swift_bridgeObjectRelease();
  sub_22C9A3788();
  v18[1] = 0xD00000000000001CLL;
  sub_22C8E8510();
  sub_22C9A3788();
  swift_bridgeObjectRelease();
  sub_22C9A3788();
  uint64_t v16 = sub_22C9A14E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F06760], v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06748], v19);
  sub_22C9A13B8();
  return sub_22C9A13D8();
}

uint64_t sub_22C95F964@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35C8);
  uint64_t v2 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35D0);
  uint64_t v5 = MEMORY[0x270FA5388](v19);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - v8;
  long long v22 = *(_OWORD *)(v1 + 56);
  char v23 = *(unsigned char *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1790);
  sub_22C9A2EB8();
  uint64_t v21 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D35D8);
  sub_22C8C6FAC(&qword_2684D35E0, &qword_2684D35D8);
  sub_22C9A2E48();
  sub_22C9A24A8();
  sub_22C8C6FAC(&qword_2684D35E8, &qword_2684D35C8);
  uint64_t v10 = v18;
  sub_22C9A29E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v10);
  sub_22C9A2168();
  sub_22C8BE0DC((uint64_t)v7, &qword_2684D35D0);
  char v11 = *(unsigned char *)(v1 + 48);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = (v11 & 1) == 0;
  uint64_t v14 = v20;
  sub_22C8BDE5C((uint64_t)v9, v20, &qword_2684D35D0);
  uint64_t v15 = (uint64_t *)(v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684D35F0) + 36));
  *uint64_t v15 = KeyPath;
  v15[1] = (uint64_t)sub_22C91C648;
  v15[2] = v13;
  return sub_22C8BE0DC((uint64_t)v9, &qword_2684D35D0);
}

uint64_t sub_22C95FCA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(id **)(v1 + 16);
  *(void *)a1 = sub_22C9A2438();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3608);
  return sub_22C95FCF4(v3, (uint64_t *)(a1 + *(int *)(v4 + 44)));
}

uint64_t sub_22C95FCF4@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3610);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v15 - v8;
  id v10 = *a1;
  uint64_t v11 = sub_22C9A2CB8();
  *(void *)uint64_t v9 = sub_22C9A24F8();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3618);
  sub_22C95FE30((uint64_t)a1, (uint64_t *)&v9[*(int *)(v12 + 44)]);
  sub_22C8BDE5C((uint64_t)v9, (uint64_t)v7, &qword_2684D3610);
  *a2 = v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3620);
  sub_22C8BDE5C((uint64_t)v7, (uint64_t)a2 + *(int *)(v13 + 48), &qword_2684D3610);
  swift_retain();
  sub_22C8BE0DC((uint64_t)v9, &qword_2684D3610);
  sub_22C8BE0DC((uint64_t)v7, &qword_2684D3610);
  return swift_release();
}

uint64_t sub_22C95FE30@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  v118 = a2;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3628);
  MEMORY[0x270FA5388](v100);
  v103 = (void *)((char *)v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3630);
  MEMORY[0x270FA5388](v4 - 8);
  v102 = (char *)v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C9A2498();
  MEMORY[0x270FA5388](v6 - 8);
  v95[1] = (char *)v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3638);
  MEMORY[0x270FA5388](v96);
  v99 = (char *)v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3640);
  MEMORY[0x270FA5388](v98);
  uint64_t v101 = (uint64_t)v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3648);
  uint64_t v117 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  uint64_t v97 = (uint64_t)v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3650);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v125 = (uint64_t)v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v126 = (uint64_t)v95 - v14;
  uint64_t v15 = sub_22C9A1408();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v107 = (uint64_t)v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_22C9A2448();
  sub_22C9A2F88();
  sub_22C9A1FC8();
  uint64_t v115 = v133;
  LODWORD(v124) = v134;
  uint64_t v114 = v135;
  LODWORD(v122) = v136;
  uint64_t v113 = v137;
  uint64_t v112 = v138;
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v127 = a1;
  long long v139 = *(_OWORD *)(a1 + 8);
  long long v132 = *(_OWORD *)(a1 + 8);
  swift_retain();
  sub_22C8DBFC0((uint64_t)&v139);
  sub_22C8D6A18();
  uint64_t v18 = sub_22C9A2868();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_22C9A2798();
  uint64_t v23 = sub_22C9A2838();
  uint64_t v25 = v24;
  char v27 = v26;
  swift_release();
  sub_22C8DBC48(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_22C9A2C78();
  uint64_t v28 = sub_22C9A2808();
  uint64_t v30 = v29;
  LOBYTE(v20) = v31;
  uint64_t v33 = v32;
  swift_release();
  sub_22C8DBC48(v23, v25, v27 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v132) = v124;
  unsigned __int8 v131 = v122;
  unsigned __int8 v130 = v20 & 1;
  swift_retain();
  swift_retain();
  sub_22C8DBC38(v28, v30, v20 & 1);
  swift_bridgeObjectRetain();
  uint64_t v123 = v28;
  uint64_t v122 = v30;
  sub_22C8DBC48(v28, v30, v20 & 1);
  uint64_t v128 = v33;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v124 = v17;
  swift_release();
  int v108 = v132;
  int v109 = v131;
  int v111 = v130;
  uint64_t v34 = v107;
  sub_22C95EBD0(v107);
  uint64_t v35 = v34;
  uint64_t v36 = sub_22C9A2858();
  uint64_t v38 = v37;
  LOBYTE(v25) = v39 & 1;
  sub_22C9A2788();
  uint64_t v40 = sub_22C9A2838();
  uint64_t v42 = v41;
  LOBYTE(v30) = v43;
  swift_release();
  sub_22C8DBC48(v36, v38, v25);
  swift_bridgeObjectRelease();
  sub_22C9A2C88();
  uint64_t v110 = sub_22C9A2808();
  uint64_t v120 = v44;
  int v104 = v45;
  uint64_t v121 = v46;
  swift_release();
  sub_22C8DBC48(v40, v42, v30 & 1);
  swift_bridgeObjectRelease();
  sub_22C95F288(v35);
  uint64_t v47 = sub_22C9A2858();
  uint64_t v49 = v48;
  LOBYTE(v25) = v50 & 1;
  sub_22C9A2788();
  uint64_t v51 = sub_22C9A2838();
  uint64_t v53 = v52;
  LOBYTE(v42) = v54;
  swift_release();
  LOBYTE(v20) = v42 & 1;
  sub_22C8DBC48(v47, v49, v25);
  swift_bridgeObjectRelease();
  sub_22C9A2C88();
  uint64_t v106 = sub_22C9A2808();
  uint64_t v105 = v55;
  char v57 = v56;
  uint64_t v107 = v58;
  swift_release();
  sub_22C8DBC48(v51, v53, v20);
  swift_bridgeObjectRelease();
  uint64_t v59 = 1;
  if ((*(unsigned char *)(v127 + 48) & 1) == 0)
  {
    sub_22C9A2488();
    sub_22C9A2478();
    sub_22C9A2CD8();
    sub_22C9A2458();
    swift_release();
    sub_22C9A2478();
    sub_22C9A24B8();
    sub_22C8DB928();
    sub_22C959844();
    uint64_t v60 = sub_22C9A2848();
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    char v66 = v65 & 1;
    uint64_t v67 = (uint64_t)v102;
    sub_22C9A2508();
    uint64_t v68 = sub_22C9A2518();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v67, 0, 1, v68);
    uint64_t v69 = swift_getKeyPath();
    v70 = v103;
    sub_22C8BDE5C(v67, (uint64_t)v103 + *(int *)(v100 + 28), &qword_2684D3630);
    uint64_t *v70 = v69;
    uint64_t v71 = (uint64_t)v99;
    sub_22C8BDE5C((uint64_t)v70, (uint64_t)&v99[*(int *)(v96 + 36)], &qword_2684D3628);
    *(void *)uint64_t v71 = v60;
    *(void *)(v71 + 8) = v62;
    *(unsigned char *)(v71 + 16) = v66;
    *(void *)(v71 + 24) = v64;
    sub_22C8DBC38(v60, v62, v66);
    swift_bridgeObjectRetain();
    sub_22C8BE0DC((uint64_t)v70, &qword_2684D3628);
    sub_22C8BE0DC(v67, &qword_2684D3630);
    sub_22C8DBC48(v60, v62, v66);
    swift_bridgeObjectRelease();
    LODWORD(v69) = sub_22C9A2608();
    uint64_t v72 = v101;
    sub_22C8BDE5C(v71, v101, &qword_2684D3638);
    *(_DWORD *)(v72 + *(int *)(v98 + 36)) = v69;
    sub_22C8BE0DC(v71, &qword_2684D3638);
    uint64_t v73 = sub_22C9A2788();
    uint64_t v74 = swift_getKeyPath();
    uint64_t v75 = v97;
    sub_22C8BDE5C(v72, v97, &qword_2684D3640);
    v76 = (uint64_t *)(v75 + *(int *)(v119 + 36));
    uint64_t *v76 = v74;
    v76[1] = v73;
    sub_22C8BE0DC(v72, &qword_2684D3640);
    sub_22C9610B0(v75, v126);
    uint64_t v59 = 0;
  }
  uint64_t v77 = v126;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v117 + 56))(v126, v59, 1, v119);
  char v78 = v57 & 1;
  LODWORD(v127) = v57 & 1;
  char v79 = v104 & 1;
  char v80 = v111;
  LOBYTE(v133) = v111;
  LOBYTE(v139) = v104 & 1;
  uint64_t v81 = v125;
  sub_22C8BDE5C(v77, v125, &qword_2684D3650);
  v82 = v118;
  uint64_t *v118 = v116;
  v82[1] = 0;
  *((unsigned char *)v82 + 16) = 1;
  v82[3] = v115;
  *((unsigned char *)v82 + 32) = v108;
  v82[5] = v114;
  *((unsigned char *)v82 + 48) = v109;
  uint64_t v83 = v112;
  v82[7] = v113;
  v82[8] = v83;
  uint64_t v84 = v124;
  v82[9] = KeyPath;
  v82[10] = v84;
  uint64_t v85 = v123;
  uint64_t v86 = v122;
  v82[11] = v123;
  v82[12] = v86;
  *((unsigned char *)v82 + 104) = v80;
  uint64_t v87 = v110;
  v82[14] = v128;
  v82[15] = v87;
  v82[16] = v120;
  *((unsigned char *)v82 + 136) = v79;
  uint64_t v88 = v106;
  v82[18] = v121;
  v82[19] = v88;
  uint64_t v89 = v105;
  v82[20] = v105;
  *((unsigned char *)v82 + 168) = v78;
  v82[22] = v107;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3658);
  sub_22C8BDE5C(v81, (uint64_t)v82 + *(int *)(v90 + 80), &qword_2684D3650);
  swift_retain();
  swift_retain();
  uint64_t v91 = v85;
  uint64_t v92 = v122;
  sub_22C8DBC38(v91, v122, v80);
  swift_bridgeObjectRetain();
  uint64_t v93 = v120;
  sub_22C8DBC38(v87, v120, v79);
  swift_bridgeObjectRetain();
  LOBYTE(v82) = v127;
  sub_22C8DBC38(v88, v89, v127);
  swift_bridgeObjectRetain();
  sub_22C8BE0DC(v126, &qword_2684D3650);
  sub_22C8BE0DC(v125, &qword_2684D3650);
  sub_22C8DBC48(v88, v89, (char)v82);
  swift_bridgeObjectRelease();
  sub_22C8DBC48(v87, v93, v139);
  swift_bridgeObjectRelease();
  LOBYTE(v82) = v133;
  swift_release();
  swift_release();
  sub_22C8DBC48(v123, v92, (char)v82);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C960AA0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(unsigned char *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(unsigned char *)(a9 + 72) = a11;
  return result;
}

uint64_t sub_22C960AC4@<X0>(uint64_t a1@<X8>)
{
  return sub_22C95F964(a1);
}

uint64_t sub_22C960B08()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22C960B18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PrivateRelaySheetHeaderView(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PrivateRelaySheetHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  id v8 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PrivateRelaySheetHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PrivateRelaySheetHeaderView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivateRelaySheetHeaderView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivateRelaySheetHeaderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
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
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateRelaySheetHeaderView()
{
  return &type metadata for PrivateRelaySheetHeaderView;
}

unint64_t sub_22C960E60()
{
  unint64_t result = qword_2684D35F8;
  if (!qword_2684D35F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D35F0);
    sub_22C960F00();
    sub_22C8C6FAC(&qword_2684D2AD8, &qword_2684D2AE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D35F8);
  }
  return result;
}

unint64_t sub_22C960F00()
{
  unint64_t result = qword_2684D3600;
  if (!qword_2684D3600)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D35D0);
    sub_22C8C6FAC(&qword_2684D35E8, &qword_2684D35C8);
    sub_22C960FA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3600);
  }
  return result;
}

unint64_t sub_22C960FA0()
{
  unint64_t result = qword_2684D1B78;
  if (!qword_2684D1B78)
  {
    sub_22C9A2718();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D1B78);
  }
  return result;
}

uint64_t sub_22C960FF8()
{
  return sub_22C9A2318();
}

uint64_t sub_22C96101C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3630);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22C8BDE5C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2684D3630);
  return sub_22C9A2328();
}

uint64_t sub_22C9610B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void **sub_22C961118(void **a1)
{
  uint64_t v2 = *a1;
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void **sub_22C961188(void **a1)
{
  uint64_t v2 = *a1;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return a1;
}

uint64_t sub_22C9611F4()
{
  uint64_t v0 = sub_22C9A1598();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C9A1588();
  uint64_t v4 = sub_22C9A1578();
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_2684E0B90 = v4;
  qword_2684E0B98 = v6;
  return result;
}

uint64_t *sub_22C9612D4()
{
  if (qword_2684DE0C0 != -1) {
    swift_once();
  }
  return &qword_2684E0B90;
}

uint64_t sub_22C961320()
{
  if (qword_2684DE0C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_2684E0B90;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_22C9613A4(uint64_t a1, uint64_t a2)
{
  if (qword_2684DE0C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_2684E0B90 = a1;
  qword_2684E0B98 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C961430()
{
  uint64_t v0 = sub_22C9A1598();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2684DE0C0 != -1) {
    swift_once();
  }
  sub_22C9A1588();
  uint64_t v4 = sub_22C9A1578();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  qword_2684E0B90 = v4;
  qword_2684E0B98 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C961560@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F50CF0];
  uint64_t v3 = sub_22C9A3518();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_22C9615D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C961618(uint64_t a1, uint64_t a2)
{
  v2[76] = a2;
  v2[75] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3668);
  v2[77] = v3;
  v2[78] = *(void *)(v3 - 8);
  v2[79] = swift_task_alloc();
  v2[80] = swift_task_alloc();
  uint64_t v4 = sub_22C9A1568();
  v2[81] = v4;
  v2[82] = *(void *)(v4 - 8);
  v2[83] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C96174C, 0, 0);
}

uint64_t sub_22C96174C()
{
  uint64_t v1 = (void *)v0[76];
  v0[2] = v0;
  v0[7] = v0 + 74;
  v0[3] = sub_22C961848;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_22C962338;
  v0[13] = &block_descriptor_0;
  v0[14] = v2;
  objc_msgSend(v1, sel_fetchStorageSummaryWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_22C961848()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 672) = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_22C9622A0;
  }
  else
  {
    uint64_t v2 = sub_22C961964;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C961964()
{
  uint64_t v1 = *(void *)(v0 + 664);
  uint64_t v2 = *(void *)(v0 + 656);
  uint64_t v3 = *(void *)(v0 + 648);
  *(void *)(v0 + 680) = *(void *)(v0 + 592);
  sub_22C9A1548();
  sub_22C9A1528();
  double v5 = v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(double *)(v0 + 152) = trunc(v5 / 3600.0) * 3600.0 * 1000.0;
  *(void *)(v0 + 176) = MEMORY[0x263F8D538];
  sub_22C8CEC24((_OWORD *)(v0 + 152), (_OWORD *)(v0 + 184));
  uint64_t v6 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538((_OWORD *)(v0 + 184), 0x6D6954746E657665, 0xE900000000000065, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(self, sel_mainBundle);
  id v9 = objc_msgSend(v8, sel_bundleIdentifier);

  if (v9)
  {
    sub_22C9A36C8();

    sub_22C9A3748();
    swift_bridgeObjectRelease();
  }
  int has_internal_ui = os_variant_has_internal_ui();
  swift_unknownObjectRelease();
  uint64_t v11 = 0x72656D6F74737563;
  if (has_internal_ui) {
    uint64_t v11 = 0x6C616E7265746E69;
  }
  uint64_t v12 = MEMORY[0x263F8D310];
  *(void *)(v0 + 240) = MEMORY[0x263F8D310];
  *(void *)(v0 + 216) = v11;
  *(void *)(v0 + 224) = 0xE800000000000000;
  sub_22C8CEC24((_OWORD *)(v0 + 216), (_OWORD *)(v0 + 248));
  char v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538((_OWORD *)(v0 + 248), 0x7542746E65696C63, 0xEF65707954646C69, v13);
  swift_bridgeObjectRelease();
  if (qword_2684DE0C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v14 = qword_2684E0B90;
  uint64_t v15 = qword_2684E0B98;
  *(void *)(v0 + 304) = v12;
  *(void *)(v0 + 280) = v14;
  *(void *)(v0 + 288) = v15;
  sub_22C8CEC24((_OWORD *)(v0 + 280), (_OWORD *)(v0 + 120));
  swift_bridgeObjectRetain();
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538((_OWORD *)(v0 + 120), 0x496E6F6973736573, 0xE900000000000064, v16);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 400) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v0 + 376) = 1;
  sub_22C8CEC24((_OWORD *)(v0 + 376), (_OWORD *)(v0 + 408));
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538((_OWORD *)(v0 + 408), 0xD000000000000017, 0x800000022C9C1050, v17);
  *(void *)(v0 + 688) = v6;
  swift_bridgeObjectRelease();
  type metadata accessor for FamilySharingHelper();
  char v18 = sub_22C8C2C24();
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 696) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_22C961D48;
  uint64_t v20 = *(void *)(v0 + 600);
  return sub_22C971430(v20, v18 & 1);
}

uint64_t sub_22C961D48(uint64_t a1)
{
  *(void *)(*(void *)v1 + 704) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22C961E48, 0, 0);
}

uint64_t sub_22C961E48()
{
  uint64_t v1 = *(void **)(v0 + 704);
  if (v1)
  {
    if (sub_22C9A3AB8())
    {
      unint64_t v2 = 0xE900000000000072;
      uint64_t v3 = 0x6573616863727550;
    }
    else
    {
      unint64_t v4 = sub_22C9A3AC8();
      if (v4 >> 62) {
        uint64_t v5 = sub_22C9A3F78();
      }
      else {
        uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v5 <= 0) {
        uint64_t v3 = 0x7564697669646E49;
      }
      else {
        uint64_t v3 = 0x7265626D654DLL;
      }
      if (v5 <= 0) {
        unint64_t v2 = 0xEA00000000006C61;
      }
      else {
        unint64_t v2 = 0xE600000000000000;
      }
    }
  }
  else
  {
    unint64_t v2 = 0xE700000000000000;
    uint64_t v3 = 0x6E776F6E6B6E55;
  }
  uint64_t v6 = *(void *)(v0 + 688);
  uint64_t v7 = *(void **)(v0 + 680);
  id v30 = v7;
  uint64_t v8 = *(void *)(v0 + 640);
  uint64_t v9 = *(void *)(v0 + 632);
  uint64_t v10 = *(void *)(v0 + 624);
  uint64_t v11 = *(void *)(v0 + 616);
  *(void *)(v0 + 464) = MEMORY[0x263F8D310];
  *(void *)(v0 + 440) = v3;
  *(void *)(v0 + 448) = v2;
  sub_22C8CEC24((_OWORD *)(v0 + 440), (_OWORD *)(v0 + 472));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538((_OWORD *)(v0 + 472), 0xD00000000000001BLL, 0x800000022C9C1070, isUniquelyReferenced_nonNull_native);
  uint64_t v13 = v6;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v7, sel_totalStorage);
  objc_msgSend(v14, sel_doubleValue);

  uint64_t v15 = self;
  id v16 = objc_msgSend(v15, sel_bytes);
  sub_22C962D94();
  sub_22C9A1328();
  id v17 = objc_msgSend(v15, sel_megabytes);
  sub_22C9A1348();

  sub_22C9A1338();
  uint64_t v19 = v18;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v20(v9, v11);
  v20(v8, v11);
  *(void *)(v0 + 528) = MEMORY[0x263F8D538];
  *(void *)(v0 + 504) = v19;
  sub_22C8CEC24((_OWORD *)(v0 + 504), (_OWORD *)(v0 + 536));
  char v21 = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538((_OWORD *)(v0 + 536), 0xD00000000000001FLL, 0x800000022C9C1090, v21);
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v30, sel_usedStorage);
  objc_msgSend(v22, sel_doubleValue);

  id v23 = objc_msgSend(v15, sel_bytes);
  sub_22C9A1328();
  id v24 = objc_msgSend(v15, sel_megabytes);
  sub_22C9A1348();

  sub_22C9A1338();
  uint64_t v26 = v25;
  v20(v9, v11);
  v20(v8, v11);
  *(void *)(v0 + 336) = MEMORY[0x263F8D538];
  *(void *)(v0 + 312) = v26;
  sub_22C8CEC24((_OWORD *)(v0 + 312), (_OWORD *)(v0 + 344));
  char v27 = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538((_OWORD *)(v0 + 344), 0xD000000000000021, 0x800000022C9C10B0, v27);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v28(v13);
}

uint64_t sub_22C9622A0()
{
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22C962338(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3F70);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_22C9623F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[19] = a3;
  v4[20] = a4;
  v4[18] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3680);
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C962490, 0, 0);
}

uint64_t sub_22C962490()
{
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 144), *(void *)(*(void *)(v0 + 144) + 24));
  sub_22C9A3308();
  sub_22C962DD4();
  sub_22C9A33C8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22C962594;
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  return sub_22C961618(v3, v2);
}

uint64_t sub_22C962594(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 184) = a1;
  *(void *)(v3 + 192) = v1;
  swift_task_dealloc();
  if (v1) {
    unint64_t v4 = sub_22C962990;
  }
  else {
    unint64_t v4 = sub_22C9626A8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

void sub_22C9626A8()
{
  int64_t v1 = 0;
  id v22 = (_OWORD *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v19 = v3 + 64;
  uint64_t v21 = v3;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v21 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & v4;
  int64_t v20 = (unint64_t)(63 - v6) >> 6;
  if ((v5 & v4) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v9 = v8 | (v1 << 6);
LABEL_5:
  uint64_t v10 = (void *)(*(void *)(v21 + 48) + 16 * v9);
  uint64_t v11 = v10[1];
  *(void *)(v0 + 64) = *v10;
  *(void *)(v0 + 72) = v11;
  sub_22C8BA924(*(void *)(v21 + 56) + 32 * v9, v0 + 80);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_22C962E8C((uint64_t)v22, v0 + 16);
    if (!*(void *)(v0 + 24))
    {
      uint64_t v16 = *(void *)(v0 + 168);
      swift_release();
      sub_22C962E2C(v16);
      swift_task_dealloc();
      id v17 = *(void (**)(void))(v0 + 8);
      goto LABEL_30;
    }
    uint64_t v15 = *(void *)(v0 + 144);
    sub_22C8CEC24((_OWORD *)(v0 + 32), (_OWORD *)(v0 + 112));
    __swift_mutable_project_boxed_opaque_existential_1(v15, *(void *)(v15 + 24));
    sub_22C9A33B8();
    if (v2) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_0(v0 + 112);
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v12 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v12 < v20)
    {
      unint64_t v13 = *(void *)(v19 + 8 * v12);
      if (v13) {
        goto LABEL_9;
      }
      int64_t v14 = v1 + 2;
      ++v1;
      if (v12 + 1 < v20)
      {
        unint64_t v13 = *(void *)(v19 + 8 * v14);
        if (v13) {
          goto LABEL_12;
        }
        int64_t v1 = v12 + 1;
        if (v12 + 2 < v20)
        {
          unint64_t v13 = *(void *)(v19 + 8 * (v12 + 2));
          if (v13)
          {
            v12 += 2;
            goto LABEL_9;
          }
          int64_t v14 = v12 + 3;
          int64_t v1 = v12 + 2;
          if (v12 + 3 < v20)
          {
            unint64_t v13 = *(void *)(v19 + 8 * v14);
            if (!v13)
            {
              while (1)
              {
                int64_t v12 = v14 + 1;
                if (__OFADD__(v14, 1)) {
                  break;
                }
                if (v12 >= v20)
                {
                  int64_t v1 = v20 - 1;
                  goto LABEL_23;
                }
                unint64_t v13 = *(void *)(v19 + 8 * v12);
                ++v14;
                if (v13) {
                  goto LABEL_9;
                }
              }
LABEL_34:
              __break(1u);
              return;
            }
LABEL_12:
            int64_t v12 = v14;
LABEL_9:
            unint64_t v7 = (v13 - 1) & v13;
            unint64_t v9 = __clz(__rbit64(v13)) + (v12 << 6);
            int64_t v1 = v12;
            goto LABEL_5;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = 0;
    *(_OWORD *)(v0 + 80) = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    *id v22 = 0u;
  }
  uint64_t v18 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 112);
  swift_release();
  sub_22C962E2C(v18);
  swift_task_dealloc();
  id v17 = *(void (**)(void))(v0 + 8);
LABEL_30:
  v17();
}

uint64_t sub_22C962990()
{
  sub_22C962E2C(*(void *)(v0 + 168));
  swift_task_dealloc();
  int64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22C9629FC()
{
  return sub_22C962F44();
}

uint64_t sub_22C962A14(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_22C8D5C6C;
  return sub_22C9623F8(a1, v7, v5, v4);
}

uint64_t sub_22C962ABC()
{
  return sub_22C9A33F8();
}

uint64_t sub_22C962AD4(uint64_t a1)
{
  return sub_22C962BAC(a1, MEMORY[0x263F50CD0], qword_2684E0BA0, MEMORY[0x263F50CC8]);
}

uint64_t sub_22C962B08()
{
  return sub_22C962C60(&qword_2684DE0C8, MEMORY[0x263F50CD0], (uint64_t)qword_2684E0BA0);
}

uint64_t sub_22C962B40@<X0>(uint64_t a1@<X8>)
{
  return sub_22C962CF4(&qword_2684DE0C8, MEMORY[0x263F50CD0], (uint64_t)qword_2684E0BA0, a1);
}

uint64_t sub_22C962B78(uint64_t a1)
{
  return sub_22C962BAC(a1, MEMORY[0x263F50CC0], qword_2684E0BB8, MEMORY[0x263F50CB8]);
}

uint64_t sub_22C962BAC(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  uint64_t v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  __swift_project_value_buffer(v6, (uint64_t)a3);
  return a4(0x655364756F6C4369, 0xEE0073676E697474);
}

uint64_t sub_22C962C28()
{
  return sub_22C962C60(qword_2684DE0D0, MEMORY[0x263F50CC0], (uint64_t)qword_2684E0BB8);
}

uint64_t sub_22C962C60(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t sub_22C962CBC@<X0>(uint64_t a1@<X8>)
{
  return sub_22C962CF4(qword_2684DE0D0, MEMORY[0x263F50CC0], (uint64_t)qword_2684E0BB8, a1);
}

uint64_t sub_22C962CF4@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v9(a4, v8, v7);
}

unint64_t sub_22C962D94()
{
  unint64_t result = qword_2684D3670;
  if (!qword_2684D3670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2684D3670);
  }
  return result;
}

unint64_t sub_22C962DD4()
{
  unint64_t result = qword_2684D3688;
  if (!qword_2684D3688)
  {
    sub_22C9A3308();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3688);
  }
  return result;
}

uint64_t sub_22C962E2C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3680);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C962E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D3690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t sub_22C962F44()
{
  uint64_t v0 = sub_22C9A1AA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_22C9A1A98();
  os_log_type_t v6 = sub_22C9A3A78();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22C821000, v5, v6, "Add time sensitive metrics", v7, 2u);
    MEMORY[0x230F710E0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

ValueMetadata *type metadata accessor for SessionID()
{
  return &type metadata for SessionID;
}

void *initializeBufferWithCopyOfBuffer for FieldsProvider(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for FieldsProvider(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for FieldsProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for FieldsProvider(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for FieldsProvider()
{
  return &type metadata for FieldsProvider;
}

double sub_22C9631D0()
{
  return 10.0;
}

uint64_t sub_22C9631D8()
{
  return swift_retain();
}

double sub_22C9631E0()
{
  return *(double *)(v0 + 8);
}

uint64_t sub_22C9631E8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C963218()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C963248()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1690);
  sub_22C9A2D38();
  return v1;
}

uint64_t sub_22C963290()
{
  return sub_22C9A2D48();
}

void (*sub_22C9632DC(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 64);
  sub_22C8DBD98((uint64_t)v3 + 24, (uint64_t)(v3 + 2), &qword_2684D36A0);
  _OWORD *v3 = v3[1];
  sub_22C8E5524((uint64_t)(v3 + 2));
  *((void *)v3 + 5) = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1690);
  sub_22C9A2D38();
  return sub_22C963388;
}

void sub_22C963388(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  uint64_t v2 = (_OWORD *)(*(void *)a1 + 16);
  char v3 = *(unsigned char *)(*(void *)a1 + 49);
  *(_OWORD *)uint64_t v1 = *v2;
  v1[48] = v3;
  sub_22C9A2D48();
  sub_22C8E2170((uint64_t)v2);
  free(v1);
}

uint64_t sub_22C9633E4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1690);
  sub_22C9A2D58();
  return v1;
}

uint64_t sub_22C963430@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v44 = a1;
  uint64_t v3 = sub_22C9A2618();
  uint64_t v45 = *(void *)(v3 - 8);
  uint64_t v46 = v3;
  MEMORY[0x270FA5388](v3);
  char v43 = (uint64_t *)((char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22C8DBD98((uint64_t)(v1 + 6), (uint64_t)v62, &qword_2684D1C58);
  sub_22C8DBD98((uint64_t)v62, (uint64_t)&v63, &qword_2684D1C58);
  uint64_t v5 = v64;
  if (v64)
  {
    uint64_t v6 = v63;
    *(void *)&long long v42 = *(void *)v2;
    swift_retain();
    *(void *)&long long v41 = sub_22C9A24E8();
    *(void *)&long long v40 = sub_22C9A2448();
    *(void *)&long long v50 = v6;
    *((void *)&v50 + 1) = v5;
    sub_22C8D6A18();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22C9A2868();
    uint64_t v9 = v8;
    char v11 = v10 & 1;
    sub_22C9A2788();
    uint64_t v12 = sub_22C9A2838();
    uint64_t v36 = v13;
    *(void *)&long long v37 = v14;
    LOBYTE(v6) = v15;
    swift_release();
    sub_22C8DBC48(v7, v9, v11);
    swift_bridgeObjectRelease();
    sub_22C9A2C88();
    uint64_t v16 = v36;
    *(void *)&long long v39 = sub_22C9A2808();
    *(void *)&long long v38 = v17;
    LOBYTE(v7) = v18;
    uint64_t v20 = v19;
    swift_release();
    sub_22C8DBC48(v12, v16, v6 & 1);
    swift_bridgeObjectRelease();
    sub_22C9A2F88();
    sub_22C9A1FC8();
    *(void *)&long long v47 = v42;
    *((void *)&v47 + 1) = v39;
    *(void *)&long long v48 = v38;
    *((void *)&v48 + 1) = v7 & 1;
    *(void *)&v49[0] = v20;
    *((void *)&v49[0] + 1) = v41;
    *(void *)&v49[1] = v40;
    *((void *)&v49[1] + 1) = v58;
    *(void *)&v49[2] = BYTE8(v58);
    *((void *)&v49[2] + 1) = v59;
    *(void *)&v49[3] = v60;
    *(_OWORD *)((char *)&v49[3] + 8) = v61;
    BYTE8(v49[4]) = 0;
  }
  else
  {
    uint64_t v21 = *v1;
    swift_retain();
    sub_22C9A2F88();
    sub_22C9A1FC8();
    *(void *)&long long v47 = v21;
    *((void *)&v47 + 1) = v58;
    *(void *)&long long v48 = BYTE8(v58);
    *((void *)&v48 + 1) = v59;
    *(void *)&v49[0] = v60;
    *(_OWORD *)((char *)v49 + 8) = v61;
    *(_OWORD *)((char *)&v49[1] + 8) = 0u;
    *(_OWORD *)((char *)&v49[2] + 8) = 0u;
    *(_OWORD *)((char *)&v49[3] + 8) = 0u;
    BYTE8(v49[4]) = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D36E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3718);
  sub_22C963EAC();
  sub_22C963FC8();
  sub_22C9A2548();
  long long v41 = v51;
  long long v42 = v50;
  long long v39 = v53;
  long long v40 = v52;
  long long v37 = v55;
  long long v38 = v54;
  uint64_t v22 = v56;
  char v23 = BYTE8(v56);
  id v24 = (_OWORD *)swift_allocObject();
  long long v25 = *(_OWORD *)(v2 + 48);
  v24[3] = *(_OWORD *)(v2 + 32);
  v24[4] = v25;
  v24[5] = *(_OWORD *)(v2 + 64);
  long long v26 = *(_OWORD *)(v2 + 16);
  v24[1] = *(_OWORD *)v2;
  v24[2] = v26;
  long long v50 = v42;
  long long v51 = v41;
  long long v52 = v40;
  long long v53 = v39;
  long long v54 = v38;
  long long v55 = v37;
  *(void *)&long long v56 = v22;
  BYTE8(v56) = v23;
  *(void *)&long long v57 = sub_22C9639A8;
  *((void *)&v57 + 1) = v24;
  long long v58 = *(_OWORD *)(v2 + 64);
  sub_22C9639F4(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1690);
  sub_22C9A2D58();
  *(void *)&long long v42 = v47;
  LODWORD(v41) = v48;
  char v27 = (_OWORD *)swift_allocObject();
  long long v28 = *(_OWORD *)(v2 + 48);
  v27[3] = *(_OWORD *)(v2 + 32);
  v27[4] = v28;
  v27[5] = *(_OWORD *)(v2 + 64);
  long long v29 = *(_OWORD *)(v2 + 16);
  v27[1] = *(_OWORD *)v2;
  v27[2] = v29;
  sub_22C9639F4(v2);
  uint64_t v30 = sub_22C9A2D68();
  uint64_t v31 = v43;
  *char v43 = v30;
  uint64_t v33 = v45;
  uint64_t v32 = v46;
  (*(void (**)(uint64_t *, void, uint64_t))(v45 + 104))(v31, *MEMORY[0x263F1A030], v46);
  v49[2] = v54;
  v49[3] = v55;
  v49[4] = v56;
  v49[5] = v57;
  long long v47 = v50;
  long long v48 = v51;
  v49[0] = v52;
  v49[1] = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D36A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D36B0);
  sub_22C963D40();
  sub_22C964090();
  sub_22C9A2958();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v33 + 8))(v31, v32);
  return sub_22C964130((uint64_t)&v50);
}

uint64_t sub_22C9639A8()
{
  return sub_22C9A2D48();
}

uint64_t sub_22C9639F4(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroyTm_9()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_22C963ABC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = sub_22C9A24E8();
  sub_22C8D6A18();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_22C9A2868();
  uint64_t v30 = v4;
  uint64_t v31 = v3;
  uint64_t v32 = v5;
  char v29 = v6 & 1;
  uint64_t v37 = *(void *)(v1 + 48);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22C9A2868();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_22C9A2788();
  uint64_t v12 = sub_22C9A2838();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_22C8DBC48(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_22C9A2C88();
  uint64_t v17 = sub_22C9A2808();
  uint64_t v19 = v18;
  char v21 = v20;
  uint64_t v23 = v22;
  swift_release();
  sub_22C8DBC48(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v37) = v29;
  v36[0] = v29;
  v35[0] = v21 & 1;
  sub_22C8DBC38(v31, v30, v29);
  swift_bridgeObjectRetain();
  sub_22C8DBC38(v17, v19, v21 & 1);
  swift_bridgeObjectRetain();
  sub_22C8DBC48(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  sub_22C8DBC48(v31, v30, v29);
  swift_bridgeObjectRelease();
  LOBYTE(v7) = sub_22C9A2738();
  uint64_t result = sub_22C9A1EF8();
  *(void *)a1 = v33;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_DWORD *)(a1 + 17) = v37;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v37 + 3);
  *(void *)(a1 + 24) = v31;
  *(void *)(a1 + 32) = v30;
  *(unsigned char *)(a1 + 40) = v29;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v36[3];
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v36;
  *(void *)(a1 + 48) = v32;
  *(void *)(a1 + 56) = v17;
  *(void *)(a1 + 64) = v19;
  *(unsigned char *)(a1 + 72) = v21 & 1;
  *(_DWORD *)(a1 + 76) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a1 + 73) = *(_DWORD *)v35;
  *(void *)(a1 + 80) = v23;
  *(unsigned char *)(a1 + 88) = v7;
  *(_DWORD *)(a1 + 92) = *(_DWORD *)&v34[3];
  *(_DWORD *)(a1 + 89) = *(_DWORD *)v34;
  *(void *)(a1 + 96) = v25;
  *(void *)(a1 + 104) = v26;
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v28;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

unint64_t sub_22C963D40()
{
  unint64_t result = qword_2684D36B8;
  if (!qword_2684D36B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D36A8);
    sub_22C963DBC();
    sub_22C96403C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D36B8);
  }
  return result;
}

unint64_t sub_22C963DBC()
{
  unint64_t result = qword_2684D36C0;
  if (!qword_2684D36C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D36C8);
    sub_22C963E30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D36C0);
  }
  return result;
}

unint64_t sub_22C963E30()
{
  unint64_t result = qword_2684D36D0;
  if (!qword_2684D36D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D36D8);
    sub_22C963EAC();
    sub_22C963FC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D36D0);
  }
  return result;
}

unint64_t sub_22C963EAC()
{
  unint64_t result = qword_2684D36E0;
  if (!qword_2684D36E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D36E8);
    sub_22C963F28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D36E0);
  }
  return result;
}

unint64_t sub_22C963F28()
{
  unint64_t result = qword_2684D36F0;
  if (!qword_2684D36F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D36F8);
    sub_22C8C6FAC(&qword_2684D3700, &qword_2684D3708);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D36F0);
  }
  return result;
}

unint64_t sub_22C963FC8()
{
  unint64_t result = qword_2684D3710;
  if (!qword_2684D3710)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3718);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3710);
  }
  return result;
}

unint64_t sub_22C96403C()
{
  unint64_t result = qword_2684D3720;
  if (!qword_2684D3720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3720);
  }
  return result;
}

unint64_t sub_22C964090()
{
  unint64_t result = qword_2684D3728;
  if (!qword_2684D3728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D36B0);
    sub_22C8C6FAC(&qword_2684D3730, &qword_2684D3738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3728);
  }
  return result;
}

uint64_t sub_22C964130(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C964198(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t result = swift_release();
  if ((a14 & 1) == 0)
  {
    sub_22C8DBC48(a2, a3, a4 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22C964218()
{
  return swift_getOpaqueTypeMetadata2();
}

uint64_t sub_22C9642AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22C96433C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t result = sub_22C9A2D28();
  *(void *)a8 = a1;
  *(double *)(a8 + 8) = a9;
  *(void *)(a8 + 16) = a2;
  *(void *)(a8 + 24) = a3;
  *(void *)(a8 + 32) = a4;
  *(void *)(a8 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = a5;
  *(void *)(a8 + 48) = a6;
  *(void *)(a8 + 56) = a7;
  *(unsigned char *)(a8 + 64) = v19;
  *(void *)(a8 + 72) = v20;
  return result;
}

uint64_t sub_22C9643E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22C9643FC@<X0>(uint64_t a1@<X8>)
{
  return sub_22C963430(a1);
}

uint64_t destroy for MeterSliceView()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for MeterSliceView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MeterSliceView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for MeterSliceView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for MeterSliceView()
{
  return &type metadata for MeterSliceView;
}

uint64_t sub_22C96468C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22C96470C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C9A2438();
  sub_22C9648BC(v2, (uint64_t)v14);
  *(_OWORD *)((char *)&v16[12] + 7) = v14[12];
  *(_OWORD *)((char *)&v16[13] + 7) = v14[13];
  *(_OWORD *)((char *)&v16[14] + 7) = *(_OWORD *)v15;
  v16[15] = *(_OWORD *)&v15[9];
  *(_OWORD *)((char *)&v16[8] + 7) = v14[8];
  *(_OWORD *)((char *)&v16[9] + 7) = v14[9];
  *(_OWORD *)((char *)&v16[10] + 7) = v14[10];
  *(_OWORD *)((char *)&v16[11] + 7) = v14[11];
  *(_OWORD *)((char *)&v16[4] + 7) = v14[4];
  *(_OWORD *)((char *)&v16[5] + 7) = v14[5];
  *(_OWORD *)((char *)&v16[6] + 7) = v14[6];
  *(_OWORD *)((char *)&v16[7] + 7) = v14[7];
  *(_OWORD *)((char *)v16 + 7) = v14[0];
  *(_OWORD *)((char *)&v16[1] + 7) = v14[1];
  *(_OWORD *)((char *)&v16[2] + 7) = v14[2];
  *(_OWORD *)((char *)&v16[3] + 7) = v14[3];
  long long v5 = v16[13];
  *(_OWORD *)(a1 + 209) = v16[12];
  *(_OWORD *)(a1 + 225) = v5;
  long long v6 = v16[15];
  *(_OWORD *)(a1 + 241) = v16[14];
  *(_OWORD *)(a1 + 257) = v6;
  long long v7 = v16[9];
  *(_OWORD *)(a1 + 145) = v16[8];
  *(_OWORD *)(a1 + 161) = v7;
  long long v8 = v16[11];
  *(_OWORD *)(a1 + 177) = v16[10];
  *(_OWORD *)(a1 + 193) = v8;
  long long v9 = v16[5];
  *(_OWORD *)(a1 + 81) = v16[4];
  *(_OWORD *)(a1 + 97) = v9;
  long long v10 = v16[7];
  *(_OWORD *)(a1 + 113) = v16[6];
  *(_OWORD *)(a1 + 129) = v10;
  long long v11 = v16[1];
  *(_OWORD *)(a1 + 17) = v16[0];
  *(_OWORD *)(a1 + 33) = v11;
  double result = *(double *)&v16[2];
  long long v13 = v16[3];
  *(_OWORD *)(a1 + 49) = v16[2];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0x4018000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 65) = v13;
  return result;
}

uint64_t sub_22C9648BC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = *a1;
  swift_retain();
  sub_22C9A2F88();
  sub_22C9A1FC8();
  uint64_t v60 = sub_22C9A24F8();
  uint64_t v4 = a1[2];
  uint64_t v83 = a1[1];
  uint64_t v84 = v4;
  sub_22C8D6A18();
  swift_bridgeObjectRetain();
  uint64_t v63 = sub_22C9A2868();
  uint64_t v58 = v5;
  uint64_t v59 = v6;
  char v8 = v7;
  LOBYTE(v4) = sub_22C9A2748();
  char v9 = sub_22C9A2768();
  sub_22C9A2768();
  if (sub_22C9A2768() != v4) {
    char v9 = sub_22C9A2768();
  }
  sub_22C9A1EF8();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  unsigned __int8 v18 = sub_22C9A2758();
  char v19 = sub_22C9A2768();
  sub_22C9A2768();
  if (sub_22C9A2768() != v18) {
    char v19 = sub_22C9A2768();
  }
  char v62 = v9;
  sub_22C9A1EF8();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  char v99 = v8 & 1;
  char v97 = 0;
  char v94 = 0;
  uint64_t v28 = a1[4];
  if (v28)
  {
    uint64_t v83 = a1[3];
    uint64_t v84 = v28;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_22C9A2868();
    uint64_t v31 = v30;
    char v33 = v32 & 1;
    sub_22C9A2788();
    uint64_t v53 = sub_22C9A2838();
    uint64_t v35 = v34;
    char v37 = v36;
    swift_release();
    char v38 = v37 & 1;
    sub_22C8DBC48(v29, v31, v33);
    swift_bridgeObjectRelease();
    sub_22C9A2C88();
    uint64_t v39 = sub_22C9A2808();
    uint64_t v56 = v40;
    uint64_t v57 = v39;
    uint64_t v64 = v41;
    char v43 = v42;
    swift_release();
    uint64_t v55 = v43 & 1;
    sub_22C8DBC48(v53, v35, v38);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    uint64_t v64 = 0;
    uint64_t v55 = 0;
  }
  char v51 = v99;
  char v52 = v97;
  char v54 = v94;
  *(void *)&long long v79 = v63;
  *((void *)&v79 + 1) = v58;
  v80[0] = v99;
  *(_DWORD *)&v80[1] = *(_DWORD *)v78;
  *(_DWORD *)&v80[4] = *(_DWORD *)&v78[3];
  *(void *)&v80[8] = v59;
  v80[16] = v62;
  *(_DWORD *)&v80[17] = *(_DWORD *)v98;
  *(_DWORD *)&v80[20] = *(_DWORD *)&v98[3];
  *(void *)&v80[24] = v11;
  *(void *)&v80[32] = v13;
  *(void *)&v80[40] = v15;
  *(void *)&v80[48] = v17;
  v80[56] = v97;
  *(_DWORD *)&v80[57] = *(_DWORD *)v96;
  *(_DWORD *)&v80[60] = *(_DWORD *)&v96[3];
  v80[64] = v19;
  *(_DWORD *)&v80[68] = *(_DWORD *)((char *)v95 + 3);
  *(_DWORD *)&v80[65] = v95[0];
  *(void *)&v80[72] = v21;
  *(void *)&v80[80] = v23;
  *(void *)&v80[88] = v25;
  *(void *)&v80[96] = v27;
  v80[104] = v94;
  long long v73 = *(_OWORD *)&v80[16];
  long long v74 = *(_OWORD *)&v80[32];
  long long v71 = v79;
  long long v72 = *(_OWORD *)v80;
  *(_OWORD *)&v77[9] = *(_OWORD *)&v80[89];
  long long v76 = *(_OWORD *)&v80[64];
  *(_OWORD *)uint64_t v77 = *(_OWORD *)&v80[80];
  long long v75 = *(_OWORD *)&v80[48];
  sub_22C9659D4((uint64_t)&v79);
  sub_22C8DBDFC(v57, v64, v55, v56);
  sub_22C8DBE40(v57, v64, v55, v56);
  uint64_t v83 = v63;
  uint64_t v84 = v58;
  char v85 = v51;
  LODWORD(v86) = *(_DWORD *)v78;
  *(_DWORD *)((char *)&v86 + 3) = *(_DWORD *)&v78[3];
  *(void *)((char *)&v86 + 7) = v59;
  HIBYTE(v86) = v62;
  *(_DWORD *)uint64_t v87 = *(_DWORD *)v98;
  *(_DWORD *)&v87[3] = *(_DWORD *)&v98[3];
  *(void *)&v87[7] = v11;
  *(void *)&v87[15] = v13;
  *(void *)&v87[23] = v15;
  *(void *)&v87[31] = v17;
  v87[39] = v52;
  *(_DWORD *)&v87[43] = *(_DWORD *)&v96[3];
  *(_DWORD *)&v87[40] = *(_DWORD *)v96;
  v87[47] = v19;
  *(_DWORD *)&v88[3] = *(_DWORD *)((char *)v95 + 3);
  *(_DWORD *)uint64_t v88 = v95[0];
  *(void *)&v88[7] = v21;
  *(void *)&v88[15] = v23;
  *(void *)&v88[23] = v25;
  *(void *)&v88[31] = v27;
  v88[39] = v54;
  sub_22C965A14((uint64_t)&v83);
  *(_OWORD *)&v78[71] = v75;
  *(_OWORD *)&v78[87] = v76;
  *(_OWORD *)&v78[103] = *(_OWORD *)v77;
  *(_OWORD *)&v78[119] = *(_OWORD *)&v77[16];
  *(_OWORD *)&v78[7] = v71;
  *(_OWORD *)&v78[23] = v72;
  *(_OWORD *)&v78[39] = v73;
  *(_OWORD *)&v78[55] = v74;
  long long v79 = (unint64_t)v60;
  v80[0] = 0;
  *(_OWORD *)&v80[33] = *(_OWORD *)&v78[32];
  *(_OWORD *)&v80[17] = *(_OWORD *)&v78[16];
  *(_OWORD *)&v80[81] = *(_OWORD *)&v78[80];
  *(_OWORD *)&v80[97] = *(_OWORD *)&v78[96];
  *(_OWORD *)&v80[113] = *(_OWORD *)&v78[112];
  *(_OWORD *)&v80[49] = *(_OWORD *)&v78[48];
  *(_OWORD *)&v80[65] = *(_OWORD *)&v78[64];
  *(_OWORD *)&v80[1] = *(_OWORD *)v78;
  *(void *)&v80[128] = *(void *)&v77[24];
  *(void *)&v80[136] = v57;
  long long v44 = *(_OWORD *)&v80[128];
  *(_OWORD *)(a2 + 184) = *(_OWORD *)&v80[112];
  long long v45 = *(_OWORD *)&v80[64];
  *(_OWORD *)(a2 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)&v80[48];
  *(_OWORD *)(a2 + 136) = v45;
  long long v46 = *(_OWORD *)&v80[96];
  *(_OWORD *)(a2 + 152) = *(_OWORD *)&v80[80];
  *(_OWORD *)(a2 + 168) = v46;
  long long v47 = *(_OWORD *)v80;
  *(_OWORD *)(a2 + 56) = v79;
  *(_OWORD *)(a2 + 72) = v47;
  long long v48 = *(_OWORD *)&v80[32];
  *(_OWORD *)(a2 + 88) = *(_OWORD *)&v80[16];
  *(_OWORD *)(a2 + 104) = v48;
  *(void *)&long long v81 = v64;
  *((void *)&v81 + 1) = v55;
  *(_OWORD *)(a2 + 20__isPlatformVersionAtLeast(2, 18, 1, 0) = v44;
  *(_OWORD *)(a2 + 216) = v81;
  *(_OWORD *)&v88[16] = *(_OWORD *)&v78[80];
  *(_OWORD *)&v88[32] = *(_OWORD *)&v78[96];
  *(_OWORD *)uint64_t v89 = *(_OWORD *)&v78[112];
  *(_OWORD *)uint64_t v87 = *(_OWORD *)&v78[16];
  *(_OWORD *)&v87[16] = *(_OWORD *)&v78[32];
  *(_OWORD *)&v87[32] = *(_OWORD *)&v78[48];
  *(_OWORD *)uint64_t v88 = *(_OWORD *)&v78[64];
  char v94 = 0;
  uint64_t v82 = v56;
  LOBYTE(v95[0]) = v66;
  char v99 = v68;
  char v97 = 1;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v98;
  *(_DWORD *)(a2 + 2__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_DWORD *)&v98[3];
  char v49 = v99;
  *(_DWORD *)(a2 + 33) = *(_DWORD *)v96;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v96[3];
  *(void *)a2 = v61;
  *(void *)(a2 + 8) = v65;
  *(unsigned char *)(a2 + 16) = v66;
  *(void *)(a2 + 24) = v67;
  *(unsigned char *)(a2 + 32) = v49;
  *(void *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v69;
  *(void *)(a2 + 48) = v70;
  *(void *)(a2 + 232) = v56;
  *(void *)(a2 + 24__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
  *(unsigned char *)(a2 + 248) = 1;
  uint64_t v83 = v60;
  uint64_t v84 = 0;
  char v85 = 0;
  long long v86 = *(_OWORD *)v78;
  *(void *)&v89[15] = *(void *)&v77[24];
  uint64_t v90 = v57;
  uint64_t v91 = v64;
  uint64_t v92 = v55;
  uint64_t v93 = v56;
  swift_retain();
  sub_22C9658FC((uint64_t)&v79);
  sub_22C965968((uint64_t)&v83);
  return swift_release();
}

uint64_t sub_22C964EE4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

double sub_22C964EF4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22C9A24E8();
  sub_22C965044((uint64_t)v15);
  *(_OWORD *)&v16[103] = v15[6];
  *(_OWORD *)&v16[119] = v15[7];
  *(_OWORD *)&v16[135] = v15[8];
  *(_OWORD *)&v16[151] = v15[9];
  *(_OWORD *)&v16[39] = v15[2];
  *(_OWORD *)&v16[55] = v15[3];
  *(_OWORD *)&v16[71] = v15[4];
  *(_OWORD *)&v16[87] = v15[5];
  *(_OWORD *)&v16[7] = v15[0];
  char v17 = 1;
  *(_OWORD *)&v16[23] = v15[1];
  sub_22C9A2F88();
  sub_22C9A1FC8();
  long long v3 = *(_OWORD *)&v16[96];
  *(_OWORD *)(a1 + 129) = *(_OWORD *)&v16[112];
  long long v4 = *(_OWORD *)&v16[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v16[128];
  *(_OWORD *)(a1 + 161) = v4;
  long long v5 = *(_OWORD *)&v16[32];
  *(_OWORD *)(a1 + 65) = *(_OWORD *)&v16[48];
  long long v6 = *(_OWORD *)&v16[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v16[64];
  *(_OWORD *)(a1 + 97) = v6;
  *(_OWORD *)(a1 + 113) = v3;
  long long v7 = *(_OWORD *)&v16[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v16;
  *(_OWORD *)(a1 + 33) = v7;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v8 = *(void *)&v16[159];
  *(_OWORD *)(a1 + 49) = v5;
  *(void *)(a1 + 176) = v8;
  *(void *)(a1 + 184) = v10;
  *(unsigned char *)(a1 + 192) = v11;
  *(void *)(a1 + 20__isPlatformVersionAtLeast(2, 18, 1, 0) = v12;
  *(unsigned char *)(a1 + 208) = v13;
  double result = *(double *)&v14;
  *(_OWORD *)(a1 + 216) = v14;
  *(void *)(a1 + 232) = 0xD00000000000002DLL;
  *(void *)(a1 + 24__isPlatformVersionAtLeast(2, 18, 1, 0) = 0x800000022C9C10E0;
  return result;
}

uint64_t sub_22C965044@<X0>(uint64_t a1@<X8>)
{
  v21[0] = sub_22C9A2CD8();
  uint64_t v2 = sub_22C9A2E88();
  sub_22C9A2BB8();
  uint64_t v3 = sub_22C9A2C68();
  swift_release();
  uint64_t v4 = sub_22C9A2F88();
  sub_22C965218(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v21, 0.0, 1, INFINITY, 0, v4, v5, v3);
  swift_release();
  uint64_t v6 = v21[0];
  uint64_t v7 = v21[1];
  char v8 = v22;
  uint64_t v9 = v23;
  char v10 = v24;
  uint64_t v11 = v25;
  char v12 = v26;
  uint64_t v13 = v27;
  uint64_t v14 = v29;
  char v15 = v30;
  uint64_t v16 = v31;
  char v17 = v32;
  long long v18 = v33;
  LOBYTE(v21[0]) = v22;
  char v38 = v24;
  char v37 = v26;
  char v36 = v28;
  char v35 = v30;
  char v34 = v32;
  *(void *)a1 = v2;
  strcpy((char *)(a1 + 8), "Family Sharing");
  *(unsigned char *)(a1 + 23) = -18;
  *(void *)(a1 + 24) = 0xD000000000000077;
  char v19 = v36;
  *(void *)(a1 + 32) = 0x800000022C9C1110;
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  *(void *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  *(unsigned char *)(a1 + 72) = v10;
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v11;
  *(unsigned char *)(a1 + 88) = v12;
  *(void *)(a1 + 96) = v13;
  *(unsigned char *)(a1 + 104) = v19;
  *(void *)(a1 + 112) = v14;
  *(unsigned char *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v15;
  *(void *)(a1 + 128) = v16;
  *(unsigned char *)(a1 + 136) = v17;
  *(_OWORD *)(a1 + 144) = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_22C965218@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_22C9A3A98();
    uint64_t v25 = (void *)sub_22C9A2728();
    sub_22C9A19D8();
  }
  sub_22C9A2248();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v29;
  return swift_retain();
}

uint64_t sub_22C9653D4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22C9653F4()
{
  unint64_t result = qword_2684D3740;
  if (!qword_2684D3740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3740);
  }
  return result;
}

uint64_t sub_22C965448()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22C965464(uint64_t a1)
{
  unint64_t v2 = sub_22C9658A8();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_22C9654B0(uint64_t a1)
{
  unint64_t v2 = sub_22C9658A8();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t destroy for UpsellCardItemView()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for UpsellCardItemView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UpsellCardItemView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for UpsellCardItemView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UpsellCardItemView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UpsellCardItemView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 1;
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
    *(unsigned char *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UpsellCardItemView()
{
  return &type metadata for UpsellCardItemView;
}

ValueMetadata *type metadata accessor for AppPlatterItemView_Previews()
{
  return &type metadata for AppPlatterItemView_Previews;
}

uint64_t sub_22C965728()
{
  return sub_22C8C6FAC(&qword_2684D3748, &qword_2684D3750);
}

unint64_t sub_22C965768()
{
  unint64_t result = qword_2684D3758;
  if (!qword_2684D3758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3760);
    sub_22C965808();
    sub_22C8C6FAC(&qword_2684D3788, &qword_2684D3790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3758);
  }
  return result;
}

unint64_t sub_22C965808()
{
  unint64_t result = qword_2684D3768;
  if (!qword_2684D3768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3770);
    sub_22C8C6FAC(&qword_2684D3778, &qword_2684D3780);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3768);
  }
  return result;
}

unint64_t sub_22C9658A8()
{
  unint64_t result = qword_2684D3798[0];
  if (!qword_2684D3798[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684D3798);
  }
  return result;
}

uint64_t sub_22C9658FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 160);
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 176);
  sub_22C8DBC38(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_22C8DBDFC(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_22C965968(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 160);
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 176);
  sub_22C8DBC48(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_22C8DBE40(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_22C9659D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C965A14(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C965A54()
{
  return sub_22C9A1738();
}

uint64_t sub_22C965A6C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_22C965B04;
  return MEMORY[0x270F87CB8](a1);
}

uint64_t sub_22C965B04(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  char v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

void sub_22C965C14(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v28 - v9;
  MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v28 - v11;
  id v13 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v13, sel_scale);
  double v15 = v14;

  if ((~*(void *)&v15 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v15 <= -9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_21:
    __break(1u);
    return;
  }
  if ((uint64_t)v15 >= 3)
  {
    id v19 = objc_msgSend(a1, sel_URL3x);
    if (v19)
    {
      uint64_t v20 = v19;
      sub_22C9A14C8();

      uint64_t v21 = sub_22C9A14E8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v12, 0, 1, v21);
    }
    else
    {
      uint64_t v25 = sub_22C9A14E8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v12, 1, 1, v25);
    }
  }
  else if ((uint64_t)v15 == 2)
  {
    id v16 = objc_msgSend(a1, sel_URL2x);
    if (v16)
    {
      char v17 = v16;
      sub_22C9A14C8();

      uint64_t v18 = sub_22C9A14E8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
    }
    else
    {
      uint64_t v26 = sub_22C9A14E8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v10, 1, 1, v26);
    }
    char v12 = v10;
  }
  else
  {
    id v22 = objc_msgSend(a1, sel_URL1x);
    if (v22)
    {
      uint64_t v23 = v22;
      sub_22C9A14C8();

      uint64_t v24 = sub_22C9A14E8();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 0, 1, v24);
    }
    else
    {
      uint64_t v27 = sub_22C9A14E8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v7, 1, 1, v27);
    }
    char v12 = v7;
  }
  sub_22C965F58((uint64_t)v12, a2);
}

uint64_t sub_22C965F58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_22C965FC0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6 = sub_22C9A1AA8();
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_allocWithZone(MEMORY[0x263F4B540]);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_22C9A3688();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithBundleIdentifier_, v10);

  char v12 = self;
  id v13 = objc_msgSend(v12, sel_mainScreen);
  objc_msgSend(v13, sel_scale);
  double v15 = v14;

  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_initWithSize_scale_, 64.0, 64.0, v15);
  objc_msgSend(v16, sel_setDrawBorder_, a3 & 1);

  id v17 = objc_msgSend(v11, sel_imageForDescriptor_, v16);
  if (!v17)
  {
    uint64_t v25 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v8, v25, v6);
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_22C9A1A98();
    os_log_type_t v27 = sub_22C9A3A88();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v32 = v6;
      uint64_t v30 = v29;
      uint64_t v35 = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      v31[1] = v28 + 4;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_22C8BA27C(a1, a2, &v35);
      sub_22C9A3C78();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22C821000, v26, v27, "Unable to fetch icon for bundleID %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v30, -1, -1);
      MEMORY[0x230F710E0](v28, -1, -1);

      (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v32);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v6);
    }
    return 0;
  }
  uint64_t v18 = v17;
  id result = objc_msgSend(v17, sel_CGImage);
  if (result)
  {
    uint64_t v20 = result;
    id v21 = objc_msgSend(v12, sel_mainScreen);
    objc_msgSend(v21, sel_scale);
    double v23 = v22;

    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v20, 0, v23);
    return v24;
  }
  __break(1u);
  return result;
}

uint64_t sub_22C9663A4()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_22C9A40F8();
  swift_bridgeObjectRelease();
  switch(v0)
  {
    case 0:
      id v1 = objc_msgSend(self, sel_systemBlueColor);
      goto LABEL_26;
    case 1:
      id v1 = objc_msgSend(self, sel_systemBrownColor);
      goto LABEL_26;
    case 2:
      id v1 = objc_msgSend(self, sel_systemGreenColor);
      goto LABEL_26;
    case 3:
      id v1 = objc_msgSend(self, sel_systemIndigoColor);
      goto LABEL_26;
    case 4:
      id v1 = objc_msgSend(self, sel_systemOrangeColor);
      goto LABEL_26;
    case 5:
      id v1 = objc_msgSend(self, sel_systemPinkColor);
      goto LABEL_26;
    case 6:
      id v1 = objc_msgSend(self, sel_systemPurpleColor);
      goto LABEL_26;
    case 7:
      id v1 = objc_msgSend(self, sel_systemRedColor);
      goto LABEL_26;
    case 8:
      id v1 = objc_msgSend(self, sel_systemTealColor);
      goto LABEL_26;
    case 9:
      id v1 = objc_msgSend(self, sel_systemMintColor);
      goto LABEL_26;
    case 10:
      id v1 = objc_msgSend(self, sel_systemYellowColor);
      goto LABEL_26;
    case 11:
      id v1 = objc_msgSend(self, sel_systemGrayColor);
      goto LABEL_26;
    case 12:
      id v1 = objc_msgSend(self, sel_systemGray2Color);
      goto LABEL_26;
    case 13:
      id v1 = objc_msgSend(self, sel_systemGray3Color);
      goto LABEL_26;
    case 14:
      id v1 = objc_msgSend(self, sel_systemGray4Color);
      goto LABEL_26;
    case 15:
      id v1 = objc_msgSend(self, sel_systemGray5Color);
      goto LABEL_26;
    case 16:
      id v1 = objc_msgSend(self, sel_systemGray6Color);
      goto LABEL_26;
    case 18:
      id v1 = objc_msgSend(self, sel_systemCyanColor);
      goto LABEL_26;
    case 19:
      id v1 = objc_msgSend(self, sel_darkGrayColor);
      goto LABEL_26;
    case 20:
      id v1 = objc_msgSend(self, sel_lightGrayColor);
      goto LABEL_26;
    case 21:
      id v1 = objc_msgSend(self, sel_magentaColor);
LABEL_26:
      id v3 = v1;
      JUMPOUT(0x230F6E890);
    case 22:
      uint64_t result = sub_22C9A2C28();
      break;
    case 23:
      uint64_t result = sub_22C9A2C88();
      break;
    default:
      uint64_t result = sub_22C9A2BE8();
      break;
  }
  return result;
}

uint64_t type metadata accessor for ICQUISwiftHelperFunctions()
{
  return self;
}

uint64_t sub_22C9667AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC13iCloudQuotaUI21OpenApplicationAction_bundleId;
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C966820(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2684D37B0 + dword_2684D37B0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_22C8D6ACC;
  return v5(a1);
}

uint64_t sub_22C9668D8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_22C9A3FE8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_22C96692C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22C96756C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22C966958@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_22C9A3FE8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_22C9669B0(uint64_t a1)
{
  unint64_t v2 = sub_22C967258();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22C9669EC(uint64_t a1)
{
  unint64_t v2 = sub_22C967258();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22C966A28(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_22C966A78(a1);
  return v2;
}

uint64_t *sub_22C966A78(void *a1)
{
  uint64_t v14 = *v1;
  uint64_t v13 = sub_22C9A1D58();
  uint64_t v11 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v12 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D37B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22C967258();
  sub_22C9A41C8();
  if (v2)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_22C967640(&qword_2684D1518, MEMORY[0x263F514D8]);
    sub_22C9A4058();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))((uint64_t)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21OpenApplicationAction_bundleId, v12, v13);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v1;
}

uint64_t sub_22C966D0C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13iCloudQuotaUI21OpenApplicationAction_bundleId;
  uint64_t v2 = sub_22C9A1D58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_22C966D70()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13iCloudQuotaUI21OpenApplicationAction_bundleId;
  uint64_t v2 = sub_22C9A1D58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_22C966E10(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2684D37B0 + dword_2684D37B0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_22C8D5C6C;
  return v5(a1);
}

uint64_t sub_22C966EC0()
{
  return sub_22C9A1B68();
}

uint64_t sub_22C966F58()
{
  return sub_22C9A1B58();
}

uint64_t *sub_22C966FE8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_22C966A78(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_22C967040(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_22C9A1AA8();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C967100, 0, 0);
}

uint64_t sub_22C967100()
{
  sub_22C9A1D48();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_22C967258()
{
  unint64_t result = qword_2684DE3F0[0];
  if (!qword_2684DE3F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DE3F0);
  }
  return result;
}

uint64_t sub_22C9672AC()
{
  return sub_22C967640(qword_2684D37C0, (void (*)(uint64_t))type metadata accessor for OpenApplicationAction);
}

uint64_t type metadata accessor for OpenApplicationAction()
{
  uint64_t result = qword_2684DE580;
  if (!qword_2684DE580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C967340()
{
  return sub_22C967640(&qword_2684D37E0, (void (*)(uint64_t))type metadata accessor for OpenApplicationAction);
}

uint64_t sub_22C967388()
{
  return type metadata accessor for OpenApplicationAction();
}

unsigned char *storeEnumTagSinglePayload for OpenApplicationAction.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
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
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22C96742CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenApplicationAction.CodingKeys()
{
  return &type metadata for OpenApplicationAction.CodingKeys;
}

unint64_t sub_22C967468()
{
  unint64_t result = qword_2684DE710[0];
  if (!qword_2684DE710[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DE710);
  }
  return result;
}

unint64_t sub_22C9674C0()
{
  unint64_t result = qword_2684DE820;
  if (!qword_2684DE820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684DE820);
  }
  return result;
}

unint64_t sub_22C967518()
{
  unint64_t result = qword_2684DE828[0];
  if (!qword_2684DE828[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DE828);
  }
  return result;
}

uint64_t sub_22C96756C()
{
  return 0x6449656C646E7562;
}

uint64_t sub_22C967584()
{
  return sub_22C9A41B8();
}

uint64_t sub_22C9675D8()
{
  return sub_22C9A3768();
}

uint64_t sub_22C9675F0()
{
  return sub_22C9A41B8();
}

uint64_t sub_22C967640(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C967688@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22C9A3328();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_22C9A3348();
  MEMORY[0x270FA5388](v3 - 8);
  swift_bridgeObjectRetain();
  sub_22C9A3338();
  uint64_t v4 = MEMORY[0x263F8EE78];
  sub_22C8CE388(MEMORY[0x263F8EE78]);
  sub_22C9A3318();
  sub_22C8CE544(v4);
  sub_22C8CE544(v4);
  sub_22C9A3358();
  uint64_t v5 = sub_22C9A3368();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 0, 1, v5);
}

unint64_t sub_22C9677FC()
{
  unint64_t result = qword_2684D37E8;
  if (!qword_2684D37E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D37E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for RecommendationSectionComponentModel()
{
  return &type metadata for RecommendationSectionComponentModel;
}

uint64_t sub_22C967860()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AppPlatterCard.Feature(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppPlatterCard.Item(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C96C9B8(v1, (uint64_t)v7, type metadata accessor for AppPlatterCard.Item);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return *(void *)v7;
  }
  sub_22C96CA20((uint64_t)v7, (uint64_t)v4, type metadata accessor for AppPlatterCard.Feature);
  uint64_t v8 = *(void *)&v4[*(int *)(v2 + 20)];
  swift_bridgeObjectRetain();
  sub_22C96B494((uint64_t)v4, type metadata accessor for AppPlatterCard.Feature);
  return v8;
}

uint64_t type metadata accessor for AppPlatterCard.Feature(uint64_t a1)
{
  return sub_22C8EF20C(a1, qword_2684DECC0);
}

uint64_t type metadata accessor for AppPlatterCard.Item(uint64_t a1)
{
  return sub_22C8EF20C(a1, (uint64_t *)&unk_2684DECB0);
}

uint64_t sub_22C9679F4()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppPlatterCard.Feature(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C967A34@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for AppPlatterCard.Feature(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22C96C9B8(v2, (uint64_t)v9, type metadata accessor for AppPlatterCard.Item);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    sub_22C96CA20((uint64_t)v9, (uint64_t)v7, type metadata accessor for AppPlatterCard.Feature);
    uint64_t v11 = &v7[*(int *)(v4 + 20)];
    uint64_t v13 = *(void *)v11;
    uint64_t v12 = *((void *)v11 + 1);
    swift_bridgeObjectRetain();
    uint64_t result = sub_22C96B494((uint64_t)v7, type metadata accessor for AppPlatterCard.Feature);
  }
  else
  {
    uint64_t v13 = *v9;
    uint64_t v12 = v9[1];
  }
  *a1 = v13;
  a1[1] = v12;
  return result;
}

uint64_t sub_22C967B80@<X0>(uint64_t a1@<X8>)
{
  return sub_22C8BDE5C(v1, a1, &qword_2684D14A8);
}

uint64_t sub_22C967BA8()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppPlatterCard.Feature(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C967BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_22C8DBD98(a1, a6, &qword_2684D14A8);
  uint64_t result = type metadata accessor for AppPlatterCard.Feature(0);
  uint64_t v12 = (void *)(a6 + *(int *)(result + 20));
  *uint64_t v12 = a2;
  v12[1] = a3;
  uint64_t v13 = (void *)(a6 + *(int *)(result + 24));
  *uint64_t v13 = a4;
  v13[1] = a5;
  return result;
}

uint64_t sub_22C967C58@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(v2 + *(int *)(a1 + 20));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22C967C6C()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_22C967D50(v0);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22C9A3788();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_22C967D50(uint64_t a1)
{
  uint64_t v19 = type metadata accessor for AppPlatterCard.Feature(0);
  MEMORY[0x270FA5388](v19);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for AppPlatterCard.Item(0);
  uint64_t v5 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v7 = (uint64_t *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    uint64_t v18 = v1;
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_22C969E38(0, v8, 0);
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v20 = *(void *)(v5 + 72);
    do
    {
      sub_22C96C9B8(v10, (uint64_t)v7, type metadata accessor for AppPlatterCard.Item);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_22C96CA20((uint64_t)v7, (uint64_t)v4, type metadata accessor for AppPlatterCard.Feature);
        uint64_t v11 = &v4[*(int *)(v19 + 20)];
        uint64_t v12 = *(void *)v11;
        uint64_t v13 = *((void *)v11 + 1);
        swift_bridgeObjectRetain();
        sub_22C96B494((uint64_t)v4, type metadata accessor for AppPlatterCard.Feature);
      }
      else
      {
        uint64_t v12 = *v7;
        uint64_t v13 = v7[1];
      }
      uint64_t v9 = v22;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22C969E38(0, *(void *)(v9 + 16) + 1, 1);
        uint64_t v9 = v22;
      }
      unint64_t v15 = *(void *)(v9 + 16);
      unint64_t v14 = *(void *)(v9 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_22C969E38((char *)(v14 > 1), v15 + 1, 1);
        uint64_t v9 = v22;
      }
      *(void *)(v9 + 16) = v15 + 1;
      uint64_t v16 = v9 + 16 * v15;
      *(void *)(v16 + 32) = v12;
      *(void *)(v16 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v13;
      v10 += v20;
      --v8;
    }
    while (v8);
  }
  return v9;
}

uint64_t sub_22C967FB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22C967C6C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22C967FDC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22C967FE4()
{
  return *(void *)(v0 + 56);
}

char *sub_22C967FEC()
{
  uint64_t v1 = type metadata accessor for AppPlatterCard.Item(0);
  uint64_t v56 = *(void *)(v1 - 8);
  uint64_t v57 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  char v51 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v58 = (char *)&v51 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D38F8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  int64_t v8 = (char **)((char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  char v54 = (char *)&v51 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char **)((char *)&v51 - v11);
  uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  uint64_t v55 = v0;
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v61 = (void *)MEMORY[0x263F8EE78];
  uint64_t v62 = v14;
  uint64_t v15 = *(void *)(v14 + 16);
  swift_bridgeObjectRetain();
  uint64_t v53 = v15;
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)(type metadata accessor for AppPlatterCard.Feature(0) - 8);
    uint64_t v18 = v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    uint64_t v52 = *(void *)(v17 + 72);
    while (1)
    {
      uint64_t v19 = v13;
      uint64_t v20 = (uint64_t)&v54[*(int *)(v5 + 48)];
      sub_22C96C9B8(v18, v20, type metadata accessor for AppPlatterCard.Feature);
      uint64_t v21 = (uint64_t)v12 + *(int *)(v5 + 48);
      *uint64_t v12 = v16;
      sub_22C96CA20(v20, v21, type metadata accessor for AppPlatterCard.Feature);
      sub_22C8DBD98((uint64_t)v12, (uint64_t)v8, &qword_2684D38F8);
      uint64_t v13 = *v8;
      sub_22C96C9B8((uint64_t)v8 + *(int *)(v5 + 48), (uint64_t)v58, type metadata accessor for AppPlatterCard.Feature);
      swift_storeEnumTagMultiPayload();
      uint64_t v22 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v22 = (void *)sub_22C96A254(0, v22[2] + 1, 1, v22);
      }
      unint64_t v24 = v22[2];
      unint64_t v23 = v22[3];
      if (v24 >= v23 >> 1) {
        uint64_t v22 = (void *)sub_22C96A254(v23 > 1, v24 + 1, 1, v22);
      }
      v22[2] = v24 + 1;
      sub_22C96CA20((uint64_t)v58, (uint64_t)v22+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v24, type metadata accessor for AppPlatterCard.Item);
      uint64_t v61 = v22;
      uint64_t v25 = (uint64_t)(v13 - 1);
      if (__OFSUB__(v13, 1)) {
        break;
      }
      uint64_t v26 = *(void *)(v55 + 56);
      uint64_t v13 = v19;
      if (v26 == -1) {
        goto LABEL_13;
      }
      if (v26) {
        v25 %= v26;
      }
      if (!v25)
      {
LABEL_13:
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v13 = sub_22C96A150(0, *((void *)v19 + 2) + 1, 1, v19);
        }
        unint64_t v28 = *((void *)v13 + 2);
        unint64_t v27 = *((void *)v13 + 3);
        if (v28 >= v27 >> 1) {
          uint64_t v13 = sub_22C96A150((char *)(v27 > 1), v28 + 1, 1, v13);
        }
        *((void *)v13 + 2) = v28 + 1;
        *(void *)&v13[8 * v28 + 32] = v22;
        swift_bridgeObjectRelease();
        uint64_t v22 = (void *)MEMORY[0x263F8EE78];
        uint64_t v61 = (void *)MEMORY[0x263F8EE78];
      }
      ++v16;
      sub_22C8BE0DC((uint64_t)v8, &qword_2684D38F8);
      v18 += v52;
      if (v53 == v16) {
        goto LABEL_19;
      }
    }
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v22 = v13;
LABEL_19:
  sub_22C8DAED0((uint64_t)&v62);
  uint64_t v29 = v22[2];
  if (v29)
  {
    uint64_t v30 = *(void *)(v55 + 56);
    uint64_t v31 = v30 - v29;
    if (__OFSUB__(v30, v29))
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v31 < 0)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v31)
    {
      uint64_t v58 = v13;
      size_t v32 = MEMORY[0x263F8EE78];
      size_t v60 = MEMORY[0x263F8EE78];
      sub_22C969E38(0, v30 - v29, 0);
      uint64_t v33 = 0;
      uint64_t v34 = (void *)v60;
      do
      {
        uint64_t v59 = v33;
        uint64_t v35 = sub_22C9A4098();
        uint64_t v37 = v36;
        size_t v60 = (size_t)v34;
        unint64_t v39 = v34[2];
        unint64_t v38 = v34[3];
        int64_t v40 = v39 + 1;
        if (v39 >= v38 >> 1)
        {
          sub_22C969E38((char *)(v38 > 1), v39 + 1, 1);
          uint64_t v34 = (void *)v60;
        }
        ++v33;
        v34[2] = v40;
        uint64_t v41 = &v34[2 * v39];
        v41[4] = v35;
        v41[5] = v37;
      }
      while (v31 != v33);
    }
    else
    {
      int64_t v40 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (!v40)
      {
        size_t v42 = MEMORY[0x263F8EE78];
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      uint64_t v58 = v13;
      uint64_t v34 = (void *)MEMORY[0x263F8EE78];
      size_t v32 = MEMORY[0x263F8EE78];
    }
    size_t v60 = v32;
    sub_22C969E58(0, v40, 0);
    size_t v42 = v60;
    char v43 = v34 + 5;
    long long v44 = v51;
    do
    {
      uint64_t v45 = *v43;
      *long long v44 = *(v43 - 1);
      v44[1] = v45;
      swift_storeEnumTagMultiPayload();
      size_t v60 = v42;
      unint64_t v47 = *(void *)(v42 + 16);
      unint64_t v46 = *(void *)(v42 + 24);
      swift_bridgeObjectRetain();
      if (v47 >= v46 >> 1)
      {
        sub_22C969E58(v46 > 1, v47 + 1, 1);
        size_t v42 = v60;
      }
      v43 += 2;
      *(void *)(v42 + 16) = v47 + 1;
      sub_22C96CA20((uint64_t)v44, v42+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v47, type metadata accessor for AppPlatterCard.Item);
      --v40;
    }
    while (v40);
    swift_bridgeObjectRelease();
    uint64_t v13 = v58;
LABEL_35:
    sub_22C968680(v42);
    uint64_t v22 = v61;
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
LABEL_36:
      unint64_t v49 = *((void *)v13 + 2);
      unint64_t v48 = *((void *)v13 + 3);
      if (v49 >= v48 >> 1) {
        uint64_t v13 = sub_22C96A150((char *)(v48 > 1), v49 + 1, 1, v13);
      }
      *((void *)v13 + 2) = v49 + 1;
      *(void *)&v13[8 * v49 + 32] = v22;
      goto LABEL_39;
    }
LABEL_44:
    uint64_t v13 = sub_22C96A150(0, *((void *)v13 + 2) + 1, 1, v13);
    goto LABEL_36;
  }
LABEL_39:
  swift_bridgeObjectRelease();
  return v13;
}

size_t sub_22C968680(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = sub_22C96A254(result, v11, 1, v3);
  uint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  uint64_t result = type metadata accessor for AppPlatterCard.Item(0);
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_22C9687A8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t sub_22C9687D8@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_22C9A24E8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D37F0);
  return sub_22C968824(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_22C968824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v22[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3848);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  size_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v22 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3850);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v22 - v13;
  *(void *)uint64_t v14 = sub_22C9A2438();
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3858);
  sub_22C968B20((uint64_t *)a1, (uint64_t)&v14[*(int *)(v15 + 44)]);
  *(void *)uint64_t v8 = sub_22C9A24E8();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3860);
  v22[1] = (uint64_t)sub_22C967FEC();
  uint64_t v16 = (_OWORD *)swift_allocObject();
  long long v17 = *(_OWORD *)(a1 + 48);
  v16[3] = *(_OWORD *)(a1 + 32);
  v16[4] = v17;
  v16[5] = *(_OWORD *)(a1 + 64);
  long long v18 = *(_OWORD *)(a1 + 16);
  v16[1] = *(_OWORD *)a1;
  v16[2] = v18;
  sub_22C96C64C(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3868);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3870);
  sub_22C8C6FAC(&qword_2684D3878, &qword_2684D3868);
  sub_22C8C6FAC(&qword_2684D3880, &qword_2684D3870);
  sub_22C96C6B8();
  sub_22C9A2F18();
  sub_22C8BDE5C((uint64_t)v14, (uint64_t)v12, &qword_2684D3850);
  sub_22C8BDE5C((uint64_t)v8, (uint64_t)v6, &qword_2684D3848);
  uint64_t v19 = v22[0];
  sub_22C8BDE5C((uint64_t)v12, v22[0], &qword_2684D3850);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3890);
  sub_22C8BDE5C((uint64_t)v6, v19 + *(int *)(v20 + 48), &qword_2684D3848);
  sub_22C8BE0DC((uint64_t)v8, &qword_2684D3848);
  sub_22C8BE0DC((uint64_t)v14, &qword_2684D3850);
  sub_22C8BE0DC((uint64_t)v6, &qword_2684D3848);
  return sub_22C8BE0DC((uint64_t)v12, &qword_2684D3850);
}

uint64_t sub_22C968B20@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1B38);
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  long long v74 = &v59[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v66 = &v59[-v8];
  MEMORY[0x270FA5388](v7);
  long long v73 = &v59[-v9];
  uint64_t v65 = sub_22C9A24F8();
  uint64_t v10 = a1[1];
  uint64_t v78 = *a1;
  uint64_t v79 = v10;
  unint64_t v11 = sub_22C8D6A18();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_22C9A2868();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_22C9A27C8();
  uint64_t v17 = sub_22C9A2838();
  uint64_t v62 = v18;
  uint64_t v63 = v17;
  char v20 = v19;
  uint64_t v75 = v21;
  swift_release();
  LODWORD(v72) = v20 & 1;
  sub_22C8DBC48(v12, v14, v16);
  swift_bridgeObjectRelease();
  uint64_t v61 = a1;
  uint64_t v22 = a1[3];
  uint64_t v78 = a1[2];
  uint64_t v79 = v22;
  swift_bridgeObjectRetain();
  unint64_t v64 = v11;
  uint64_t v23 = sub_22C9A2868();
  uint64_t v25 = v24;
  LOBYTE(v14) = v26 & 1;
  sub_22C9A2788();
  uint64_t v27 = sub_22C9A2838();
  uint64_t v29 = v28;
  char v31 = v30;
  swift_release();
  sub_22C8DBC48(v23, v25, v14);
  swift_bridgeObjectRelease();
  sub_22C9A2C88();
  uint64_t v32 = sub_22C9A2808();
  uint64_t v34 = v33;
  char v36 = v35;
  uint64_t v38 = v37;
  swift_release();
  sub_22C8DBC48(v27, v29, v31 & 1);
  unint64_t v39 = v61;
  swift_bridgeObjectRelease();
  LOBYTE(v78) = v72;
  unsigned __int8 v77 = v72;
  unsigned __int8 v76 = v36 & 1;
  uint64_t v41 = v62;
  uint64_t v40 = v63;
  sub_22C8DBC38(v63, v62, v72);
  swift_bridgeObjectRetain();
  sub_22C8DBC38(v32, v34, v36 & 1);
  swift_bridgeObjectRetain();
  uint64_t v70 = v34;
  uint64_t v71 = v32;
  sub_22C8DBC48(v32, v34, v36 & 1);
  uint64_t v72 = v38;
  swift_bridgeObjectRelease();
  uint64_t v42 = v40;
  uint64_t v43 = v41;
  sub_22C8DBC48(v40, v41, v78);
  swift_bridgeObjectRelease();
  int v60 = v77;
  int v69 = v76;
  if (v39[5])
  {
    uint64_t v44 = v39[4];
    uint64_t v45 = v39[5];
  }
  else
  {
    uint64_t v44 = sub_22C8E8594();
  }
  uint64_t v78 = v44;
  uint64_t v79 = v45;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v46 = v66;
  sub_22C9A2DB8();
  uint64_t v47 = v67;
  unint64_t v48 = v73;
  unint64_t v49 = v46;
  uint64_t v50 = v68;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v67 + 32))(v73, v49, v68);
  char v51 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v47 + 16);
  uint64_t v52 = v74;
  v51(v74, v48, v50);
  *(void *)a2 = v65;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v42;
  *(void *)(a2 + 32) = v43;
  LOBYTE(v48) = v60;
  *(unsigned char *)(a2 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v60;
  uint64_t v53 = v71;
  *(void *)(a2 + 48) = v75;
  *(void *)(a2 + 56) = v53;
  *(void *)(a2 + 64) = v70;
  *(unsigned char *)(a2 + 72) = v69;
  *(void *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v72;
  *(void *)(a2 + 88) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3910);
  v51((unsigned char *)(a2 + *(int *)(v54 + 64)), v52, v50);
  sub_22C8DBC38(v42, v43, (char)v48);
  swift_bridgeObjectRetain();
  uint64_t v55 = v53;
  uint64_t v56 = v70;
  LOBYTE(v53) = v69;
  sub_22C8DBC38(v55, v70, v69);
  uint64_t v57 = *(void (**)(unsigned char *, uint64_t))(v47 + 8);
  swift_bridgeObjectRetain();
  v57(v73, v50);
  v57(v74, v50);
  sub_22C8DBC48(v42, v43, (char)v48);
  swift_bridgeObjectRelease();
  sub_22C8DBC48(v71, v56, v53);
  return swift_bridgeObjectRelease();
}

__n128 sub_22C96902C@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2270);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = type metadata accessor for AppPlatterCard.Feature(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for AppPlatterCard.Item(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C96C9B8(a1, (uint64_t)v13, type metadata accessor for AppPlatterCard.Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v29 = type metadata accessor for AppPlatterCard.Feature;
    sub_22C96CA20((uint64_t)v13, (uint64_t)v10, type metadata accessor for AppPlatterCard.Feature);
    sub_22C8BDE5C((uint64_t)v10, (uint64_t)v6, &qword_2684D14A8);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = sub_22C9699CC;
    v14[3] = 0;
    v14[4] = sub_22C8FBA14;
    v14[5] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2290);
    sub_22C8FC214();
    sub_22C9A1EA8();
    sub_22C8C6FAC(&qword_2684D2268, &qword_2684D2270);
    uint64_t v15 = sub_22C9A2E88();
    uint64_t v16 = *(int *)(v8 + 24);
    uint64_t v17 = (uint64_t *)&v10[*(int *)(v8 + 20)];
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = *(void *)&v10[v16];
    uint64_t v21 = *(void *)&v10[v16 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22C964EE4(v15, v18, v19, v20, v21, &v36);
    sub_22C9A2F88();
    sub_22C9697EC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v32, 0.0, 1, 0.0, 1);
    uint64_t v41 = v36;
    sub_22C8E6248((uint64_t)&v41);
    long long v40 = v37;
    sub_22C8DAEA4((uint64_t)&v40);
    sub_22C8DBD98((uint64_t)&v38, (uint64_t)v39, &qword_2684D1C58);
    sub_22C8DAEA4((uint64_t)v39);
    v34[6] = v32[6];
    unsigned char v34[7] = v32[7];
    v34[8] = v32[8];
    uint64_t v35 = v33;
    v34[2] = v32[2];
    v34[3] = v32[3];
    v34[4] = v32[4];
    v34[5] = v32[5];
    v34[0] = v32[0];
    v34[1] = v32[1];
    sub_22C96C9A4((uint64_t)v34);
    sub_22C8DBD98((uint64_t)v34, (uint64_t)&v42, &qword_2684D38F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D38C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D38D8);
    sub_22C8CDB00(&qword_2684D38C0, &qword_2684D38C8);
    sub_22C96C83C(&qword_2684D38D0, &qword_2684D38D8, (void (*)(void))sub_22C96C8B8);
    sub_22C9A2548();
    sub_22C96B494((uint64_t)v10, v29);
    __n128 v48 = (__n128)v30[6];
    __n128 v49 = (__n128)v30[7];
    v50[0] = v31[0];
    *(__n128 *)((char *)v50 + 9) = *(__n128 *)((char *)v31 + 9);
    __n128 v44 = (__n128)v30[2];
    __n128 v45 = (__n128)v30[3];
    __n128 v46 = (__n128)v30[4];
    __n128 v47 = (__n128)v30[5];
    __n128 v42 = (__n128)v30[0];
    __n128 v43 = (__n128)v30[1];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_22C9A2F88();
    sub_22C969640(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v34, 0.0, 1, 0.0, 1, v22, v23, 0, 1);
    sub_22C96C9B0((uint64_t)v34);
    sub_22C8DBD98((uint64_t)v34, (uint64_t)v30, &qword_2684D38F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D38C8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D38D8);
    sub_22C8CDB00(&qword_2684D38C0, &qword_2684D38C8);
    sub_22C96C83C(&qword_2684D38D0, &qword_2684D38D8, (void (*)(void))sub_22C96C8B8);
    sub_22C9A2548();
  }
  __n128 v24 = v49;
  a2[6] = v48;
  a2[7] = v24;
  a2[8] = v50[0];
  *(__n128 *)((char *)a2 + 137) = *(__n128 *)((char *)v50 + 9);
  __n128 v25 = v45;
  a2[2] = v44;
  a2[3] = v25;
  __n128 v26 = v47;
  a2[4] = v46;
  a2[5] = v26;
  __n128 result = v42;
  __n128 v28 = v43;
  *a2 = v42;
  a2[1] = v28;
  return result;
}

__n128 sub_22C969640@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_22C9A3A98();
    uint64_t v27 = (void *)sub_22C9A2728();
    sub_22C9A19D8();

    char v18 = a17;
  }
  sub_22C9A2248();
  *(void *)a9 = a16;
  *(unsigned char *)(a9 + 8) = v18 & 1;
  *(_OWORD *)(a9 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  __n128 result = v32;
  *(_OWORD *)(a9 + 48) = v31;
  *(__n128 *)(a9 + 64) = v32;
  return result;
}

uint64_t sub_22C9697EC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_22C9A3A98();
    uint64_t v23 = (void *)sub_22C9A2728();
    sub_22C9A19D8();
  }
  sub_22C9A2248();
  uint64_t v35 = *v13;
  long long v34 = *(_OWORD *)(v13 + 1);
  sub_22C8DBD98((uint64_t)(v13 + 3), (uint64_t)v33, &qword_2684D1C58);
  long long v24 = *((_OWORD *)v13 + 1);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v24;
  *(_OWORD *)(a9 + 88) = v29;
  *(_OWORD *)(a9 + 104) = v30;
  *(_OWORD *)(a9 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v31;
  *(_OWORD *)(a9 + 136) = v32;
  *(_OWORD *)(a9 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v26;
  *(_OWORD *)(a9 + 56) = v27;
  *(void *)(a9 + 32) = v13[4];
  *(_OWORD *)(a9 + 72) = v28;
  sub_22C8E5524((uint64_t)&v35);
  sub_22C8DBFC0((uint64_t)&v34);
  return sub_22C8DBFC0((uint64_t)v33);
}

uint64_t sub_22C9699CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22C9A2CE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v6 = sub_22C9A2CF8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  return result;
}

uint64_t sub_22C969AE8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  return result;
}

uint64_t sub_22C969B04@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[3];
  v7[2] = v1[2];
  v7[3] = v3;
  v7[4] = v1[4];
  long long v4 = v1[1];
  v7[0] = *v1;
  v7[1] = v4;
  *(void *)a1 = sub_22C9A24E8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D37F0);
  return sub_22C968824((uint64_t)v7, a1 + *(int *)(v5 + 44));
}

uint64_t sub_22C969B70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v2 - 8);
  long long v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C9A14D8();
  uint64_t v5 = sub_22C9A14E8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  }
  __break(1u);
  return result;
}

double sub_22C969C88@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22C96A428();
  char v3 = sub_22C9A2738();
  sub_22C9A2F88();
  sub_22C9A1FC8();
  *(void *)a1 = 0xD000000000000015;
  *(void *)(a1 + 8) = 0x800000022C9C1310;
  *(void *)(a1 + 16) = 0xD000000000000026;
  *(void *)(a1 + 24) = 0x800000022C9C1330;
  *(_OWORD *)(a1 + 32) = xmmword_22C9B4620;
  *(void *)(a1 + 48) = v2;
  *(void *)(a1 + 56) = 2;
  *(void *)(a1 + 64) = nullsub_1;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v3;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(unsigned char *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = 1;
  *(void *)(a1 + 128) = v5;
  *(unsigned char *)(a1 + 136) = v6;
  *(void *)(a1 + 144) = v7;
  *(unsigned char *)(a1 + 152) = v8;
  double result = *(double *)&v9;
  *(_OWORD *)(a1 + 16__isPlatformVersionAtLeast(2, 18, 1, 0) = v9;
  return result;
}

uint64_t sub_22C969DA0(uint64_t a1)
{
  unint64_t v2 = sub_22C96C4B4();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_22C969DEC(uint64_t a1)
{
  unint64_t v2 = sub_22C96C4B4();
  return MEMORY[0x270F001F8](a1, v2);
}

char *sub_22C969E38(char *a1, int64_t a2, char a3)
{
  double result = sub_22C969E78(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

size_t sub_22C969E58(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_22C969F7C(a1, a2, a3, (void *)*v3);
  size_t *v3 = result;
  return result;
}

char *sub_22C969E78(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1680);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_22C969F7C(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3900);
  uint64_t v10 = *(void *)(type metadata accessor for AppPlatterCard.Item(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for AppPlatterCard.Item(0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_22C96A150(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3908);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_22C96A254(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3900);
  uint64_t v10 = *(void *)(type metadata accessor for AppPlatterCard.Item(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for AppPlatterCard.Item(0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_22C96A428()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v58 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v56 = (char *)&v54 - v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v61 = (char *)&v54 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v57 = (char *)&v54 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  int v60 = (char *)&v54 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v59 = (char *)&v54 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  char v18 = (char *)&v54 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v54 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v54 - v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3840);
  uint64_t v24 = type metadata accessor for AppPlatterCard.Feature(0);
  unint64_t v25 = (*(unsigned __int8 *)(*(void *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v24 - 8) + 80);
  uint64_t v66 = *(void *)(*(void *)(v24 - 8) + 72);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_22C9AEA40;
  uint64_t v63 = "aUI21OpenApplicationAction";
  sub_22C9A14D8();
  uint64_t v27 = sub_22C9A14E8();
  long long v28 = *(void **)(v27 - 8);
  unint64_t v64 = (uint64_t (*)(char *, uint64_t, uint64_t))v28[6];
  uint64_t v67 = v28 + 6;
  uint64_t result = v64(v21, 1, v27);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v55 = v26;
  uint64_t v30 = v26 + v25;
  uint64_t v65 = (void (*)(char *, char *, uint64_t))v28[4];
  v65(v23, v21, v27);
  uint64_t v62 = (void (*)(char *, void, uint64_t, uint64_t))v28[7];
  v62(v23, 0, 1, v27);
  sub_22C8DBD98((uint64_t)v23, v30, &qword_2684D14A8);
  long long v31 = (void *)(v30 + *(int *)(v24 + 20));
  *long long v31 = 0xD000000000000012;
  v31[1] = 0x800000022C9C1360;
  long long v32 = (void *)(v30 + *(int *)(v24 + 24));
  *long long v32 = 0xD000000000000077;
  v32[1] = 0x800000022C9C1110;
  sub_22C9A14D8();
  long long v33 = v64;
  uint64_t result = v64(v15, 1, v27);
  if (result == 1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v34 = v30 + v66;
  v65(v18, v15, v27);
  v62(v18, 0, 1, v27);
  sub_22C8DBD98((uint64_t)v18, v34, &qword_2684D14A8);
  uint64_t v35 = (char *)(v34 + *(int *)(v24 + 20));
  strcpy(v35, "Family Sharing");
  v35[15] = -18;
  uint64_t v36 = (void *)(v34 + *(int *)(v24 + 24));
  *uint64_t v36 = 0xD00000000000005BLL;
  v36[1] = 0x800000022C9C1380;
  long long v37 = v60;
  sub_22C9A14D8();
  uint64_t result = v33(v37, 1, v27);
  uint64_t v38 = v61;
  if (result == 1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v39 = v30 + 2 * v66;
  uint64_t v40 = (uint64_t)v59;
  v65(v59, v37, v27);
  uint64_t v41 = (void (*)(uint64_t, void, uint64_t, uint64_t))v62;
  v62((char *)v40, 0, 1, v27);
  sub_22C8DBD98(v40, v39, &qword_2684D14A8);
  uint64_t v42 = v39 + *(int *)(v24 + 20);
  strcpy((char *)v42, "Private Relay");
  *(_WORD *)(v42 + 14) = -4864;
  __n128 v43 = (void *)(v39 + *(int *)(v24 + 24));
  *__n128 v43 = 0xD00000000000007FLL;
  v43[1] = 0x800000022C9C13E0;
  sub_22C9A14D8();
  __n128 v44 = v64;
  uint64_t result = v64(v38, 1, v27);
  if (result == 1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v45 = v30 + 3 * v66;
  uint64_t v46 = (uint64_t)v57;
  v65(v57, v38, v27);
  v41(v46, 0, 1, v27);
  sub_22C8DBD98(v46, v45, &qword_2684D14A8);
  uint64_t v47 = v45 + *(int *)(v24 + 20);
  strcpy((char *)v47, "Hide My Email");
  *(_WORD *)(v47 + 14) = -4864;
  __n128 v48 = (void *)(v45 + *(int *)(v24 + 24));
  *__n128 v48 = 0xD000000000000017;
  v48[1] = 0x800000022C9C1460;
  __n128 v49 = v58;
  sub_22C9A14D8();
  uint64_t result = v44(v49, 1, v27);
  if (result != 1)
  {
    uint64_t v50 = v30 + 4 * v66;
    uint64_t v51 = (uint64_t)v56;
    v65(v56, v49, v27);
    v41(v51, 0, 1, v27);
    sub_22C8DBD98(v51, v50, &qword_2684D14A8);
    uint64_t v52 = (void *)(v50 + *(int *)(v24 + 20));
    *uint64_t v52 = 0xD000000000000014;
    v52[1] = 0x800000022C9C1480;
    uint64_t v53 = (void *)(v50 + *(int *)(v24 + 24));
    *uint64_t v53 = 0xD000000000000018;
    v53[1] = 0x800000022C9C14A0;
    return v55;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22C96AB84()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22C96ABA4()
{
  unint64_t result = qword_2684D37F8;
  if (!qword_2684D37F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D37F8);
  }
  return result;
}

uint64_t sub_22C96ABF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for AppPlatterCard()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *initializeWithCopy for AppPlatterCard(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AppPlatterCard(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  uint64_t v4 = a2[9];
  a1[8] = a2[8];
  a1[9] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AppPlatterCard(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AppPlatterCard()
{
  return &type metadata for AppPlatterCard;
}

uint64_t *sub_22C96AE40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22C9A14E8();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      uint64_t v11 = type metadata accessor for AppPlatterCard.Feature(0);
      uint64_t v12 = *(int *)(v11 + 20);
      uint64_t v13 = (uint64_t *)((char *)a1 + v12);
      uint64_t v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      *uint64_t v13 = v16;
      v13[1] = v15;
      uint64_t v17 = *(int *)(v11 + 24);
      char v18 = (uint64_t *)((char *)a1 + v17);
      uint64_t v19 = (uint64_t *)((char *)a2 + v17);
      uint64_t v20 = v19[1];
      *char v18 = *v19;
      v18[1] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22C96B02C(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_22C9A14E8();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
    type metadata accessor for AppPlatterCard.Feature(0);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void *sub_22C96B120(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_22C9A14E8();
    uint64_t v5 = *(void *)(v4 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
    }
    uint64_t v8 = type metadata accessor for AppPlatterCard.Feature(0);
    uint64_t v9 = *(int *)(v8 + 20);
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    *uint64_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = *(int *)(v8 + 24);
    uint64_t v15 = (void *)((char *)a1 + v14);
    uint64_t v16 = (void *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_22C96B2BC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_22C96B494((uint64_t)a1, type metadata accessor for AppPlatterCard.Item);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_22C9A14E8();
      uint64_t v5 = *(void *)(v4 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
      {
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      }
      uint64_t v7 = type metadata accessor for AppPlatterCard.Feature(0);
      uint64_t v8 = *(int *)(v7 + 20);
      uint64_t v9 = (void *)((char *)a1 + v8);
      uint64_t v10 = (void *)((char *)a2 + v8);
      void *v9 = *v10;
      v9[1] = v10[1];
      uint64_t v11 = *(int *)(v7 + 24);
      uint64_t v12 = (void *)((char *)a1 + v11);
      uint64_t v13 = (void *)((char *)a2 + v11);
      *uint64_t v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_22C96B494(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_22C96B4F4(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22C9A14E8();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    uint64_t v9 = type metadata accessor for AppPlatterCard.Feature(0);
    *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
    *(_OWORD *)&a1[*(int *)(v9 + 24)] = *(_OWORD *)&a2[*(int *)(v9 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_22C96B678(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22C96B494((uint64_t)a1, type metadata accessor for AppPlatterCard.Item);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22C9A14E8();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      uint64_t v9 = type metadata accessor for AppPlatterCard.Feature(0);
      *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
      *(_OWORD *)&a1[*(int *)(v9 + 24)] = *(_OWORD *)&a2[*(int *)(v9 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22C96B820()
{
  uint64_t result = type metadata accessor for AppPlatterCard.Feature(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_22C96B8B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_22C9A14E8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (uint64_t *)((char *)a1 + v12);
    uint64_t v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22C96BA50(uint64_t a1)
{
  uint64_t v2 = sub_22C9A14E8();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_22C96BB30(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A14E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  uint64_t v13 = *((void *)v12 + 1);
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = v13;
  uint64_t v14 = &a1[v10];
  uint64_t v15 = &a2[v10];
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = *(void *)v15;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_22C96BC7C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A14E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_22C96BE54(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A14E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  return a1;
}

char *sub_22C96BF84(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A14E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22C96C13C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C96C150);
}

uint64_t sub_22C96C150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v1__isPlatformVersionAtLeast(2, 18, 1, 0) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_22C96C218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C96C22C);
}

uint64_t sub_22C96C22C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_22C96C2F0()
{
  sub_22C921CC8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for AppPlatterCard.ItemRow()
{
  return &type metadata for AppPlatterCard.ItemRow;
}

ValueMetadata *type metadata accessor for AppPlatterCard_Previews()
{
  return &type metadata for AppPlatterCard_Previews;
}

uint64_t sub_22C96C3B0()
{
  return sub_22C8C6FAC(&qword_2684D3800, &qword_2684D3808);
}

uint64_t sub_22C96C3EC()
{
  return sub_22C96C83C(&qword_2684D3810, &qword_2684D3818, (void (*)(void))sub_22C96C430);
}

uint64_t sub_22C96C430()
{
  return sub_22C96C83C(&qword_2684D3820, &qword_2684D3828, (void (*)(void))sub_22C96C460);
}

unint64_t sub_22C96C460()
{
  unint64_t result = qword_2684D3830;
  if (!qword_2684D3830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3830);
  }
  return result;
}

unint64_t sub_22C96C4B4()
{
  unint64_t result = qword_2684D3838;
  if (!qword_2684D3838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3838);
  }
  return result;
}

uint64_t sub_22C96C50C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_22C9A2438();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3898);
  uint64_t v3 = (_OWORD *)swift_allocObject();
  long long v4 = v1[4];
  v3[3] = v1[3];
  v3[4] = v4;
  v3[5] = v1[5];
  long long v5 = v1[2];
  v3[1] = v1[1];
  v3[2] = v5;
  swift_bridgeObjectRetain();
  sub_22C96C64C((uint64_t)(v1 + 1));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D38A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D38A8);
  sub_22C8C6FAC(&qword_2684D38B0, &qword_2684D38A0);
  sub_22C96C76C();
  sub_22C96C90C();
  return sub_22C9A2F18();
}

uint64_t sub_22C96C64C(uint64_t a1)
{
  return a1;
}

unint64_t sub_22C96C6B8()
{
  unint64_t result = qword_2684D3888;
  if (!qword_2684D3888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3888);
  }
  return result;
}

uint64_t objectdestroyTm_10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 96, 7);
}

unint64_t sub_22C96C76C()
{
  unint64_t result = qword_2684D38B8;
  if (!qword_2684D38B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D38A8);
    sub_22C8CDB00(&qword_2684D38C0, &qword_2684D38C8);
    sub_22C96C83C(&qword_2684D38D0, &qword_2684D38D8, (void (*)(void))sub_22C96C8B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D38B8);
  }
  return result;
}

uint64_t sub_22C96C83C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22C96C8B8()
{
  unint64_t result = qword_2684D38E0;
  if (!qword_2684D38E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D38E0);
  }
  return result;
}

unint64_t sub_22C96C90C()
{
  unint64_t result = qword_2684D38E8;
  if (!qword_2684D38E8)
  {
    type metadata accessor for AppPlatterCard.Item(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D38E8);
  }
  return result;
}

uint64_t sub_22C96C964()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22C96C9A4(uint64_t result)
{
  *(unsigned char *)(result + 152) = 1;
  return result;
}

uint64_t sub_22C96C9B0(uint64_t result)
{
  *(unsigned char *)(result + 152) = 0;
  return result;
}

uint64_t sub_22C96C9B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22C96CA20(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_22C96CA88@<X0>(void *a1@<X8>)
{
  sub_22C9A2448();
  sub_22C96CBC8((uint64_t)v3);
  *(_OWORD *)&v4[103] = v3[4];
  *(_OWORD *)&v4[119] = v3[5];
  *(_OWORD *)uint64_t v5 = *(_OWORD *)v4;
  *(_OWORD *)&v5[9] = *(_OWORD *)&v4[9];
  *(_OWORD *)&v4[39] = v3[0];
  *(_OWORD *)&v4[55] = v3[1];
  *(_OWORD *)&v4[71] = v3[2];
  *(_OWORD *)&v4[87] = v3[3];
  char v6 = 1;
  sub_22C9A2F88();
  sub_22C96CCE8(0.0, 1, 0.0, 1, INFINITY, 0, 250.0, 0, (uint64_t)__src, 0.0, 1, 0.0, 1);
  sub_22C96CECC((uint64_t)v3);
  return memcpy(a1, __src, 0x108uLL);
}

uint64_t sub_22C96CBC8@<X0>(uint64_t a1@<X8>)
{
  sub_22C8D6A18();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_22C9A2868();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  char v10 = sub_22C9A2738();
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v8;
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  *(void *)(a1 + 48) = KeyPath;
  *(unsigned char *)(a1 + 56) = 1;
  *(unsigned char *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(unsigned char *)(a1 + 104) = 1;
  *(void *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = 1;
  sub_22C8DBC38(v2, v4, v8);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22C8DBC48(v2, v4, v8);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C96CCE8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_22C9A3A98();
    uint64_t v23 = (void *)sub_22C9A2728();
    sub_22C9A19D8();
  }
  sub_22C9A2248();
  long long v24 = *(_OWORD *)(v13 + 112);
  *(_OWORD *)(a9 + 96) = *(_OWORD *)(v13 + 96);
  *(_OWORD *)(a9 + 112) = v24;
  *(_OWORD *)(a9 + 128) = *(_OWORD *)(v13 + 128);
  long long v25 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v25;
  long long v26 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v26;
  long long v27 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v27;
  *(_OWORD *)(a9 + 20__isPlatformVersionAtLeast(2, 18, 1, 0) = v32;
  *(_OWORD *)(a9 + 216) = v33;
  *(_OWORD *)(a9 + 232) = v34;
  *(_OWORD *)(a9 + 248) = v35;
  *(_OWORD *)(a9 + 152) = v29;
  *(_OWORD *)(a9 + 168) = v30;
  *(unsigned char *)(a9 + 144) = *(unsigned char *)(v13 + 144);
  *(_OWORD *)(a9 + 184) = v31;
  return sub_22C96D388(v13);
}

uint64_t sub_22C96CECC(uint64_t a1)
{
  return a1;
}

void *sub_22C96CF1C@<X0>(void *a1@<X8>)
{
  sub_22C9A2448();
  sub_22C96CBC8((uint64_t)v3);
  *(_OWORD *)&v4[103] = v3[4];
  *(_OWORD *)&v4[119] = v3[5];
  *(_OWORD *)uint64_t v5 = *(_OWORD *)v4;
  *(_OWORD *)&v5[9] = *(_OWORD *)&v4[9];
  *(_OWORD *)&v4[39] = v3[0];
  *(_OWORD *)&v4[55] = v3[1];
  *(_OWORD *)&v4[71] = v3[2];
  *(_OWORD *)&v4[87] = v3[3];
  char v6 = 1;
  sub_22C9A2F88();
  sub_22C96CCE8(0.0, 1, 0.0, 1, INFINITY, 0, 250.0, 0, (uint64_t)__src, 0.0, 1, 0.0, 1);
  sub_22C96CECC((uint64_t)v3);
  return memcpy(a1, __src, 0x108uLL);
}

void sub_22C96D058(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t sub_22C96D060()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22C96D080()
{
  unint64_t result = qword_2684D3918;
  if (!qword_2684D3918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3918);
  }
  return result;
}

uint64_t sub_22C96D0D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22C96D0F0(uint64_t a1)
{
  unint64_t v2 = sub_22C96D334();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_22C96D13C(uint64_t a1)
{
  unint64_t v2 = sub_22C96D334();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t getEnumTagSinglePayload for ManageStorageDrilldownErrorView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ManageStorageDrilldownErrorView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ManageStorageDrilldownErrorView()
{
  return &type metadata for ManageStorageDrilldownErrorView;
}

ValueMetadata *type metadata accessor for ManageStorageDrilldownErrorView_Previews()
{
  return &type metadata for ManageStorageDrilldownErrorView_Previews;
}

unint64_t sub_22C96D258()
{
  unint64_t result = qword_2684D3920;
  if (!qword_2684D3920)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3928);
    sub_22C96D2D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3920);
  }
  return result;
}

unint64_t sub_22C96D2D4()
{
  unint64_t result = qword_2684D3930;
  if (!qword_2684D3930)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3938);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3930);
  }
  return result;
}

unint64_t sub_22C96D334()
{
  unint64_t result = qword_2684D3940;
  if (!qword_2684D3940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3940);
  }
  return result;
}

uint64_t sub_22C96D388(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C96D3D8@<X0>(uint64_t a1@<X8>)
{
  return sub_22C96D3E4(v1, a1);
}

uint64_t sub_22C96D3E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22C96D440(uint64_t a1)
{
  return sub_22C96D448(a1, v1);
}

uint64_t sub_22C96D448(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22C96D4A4@<X0>(uint64_t a1@<X8>)
{
  return sub_22C8BDE5C(v1 + 40, a1, &qword_2684D1840);
}

uint64_t sub_22C96D4CC(uint64_t a1)
{
  return sub_22C8CE1B0(a1, v1 + 40);
}

uint64_t (*sub_22C96D4D4())()
{
  return nullsub_1;
}

uint64_t sub_22C96D4F4()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C96D524()
{
  return *(void *)(v0 + 112);
}

uint64_t sub_22C96D52C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22C96D534@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22C9A3328();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_22C9A3348();
  MEMORY[0x270FA5388](v3 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22C9A3338();
  swift_bridgeObjectRetain();
  sub_22C9A3318();
  uint64_t v4 = MEMORY[0x263F8EE78];
  sub_22C8CE544(MEMORY[0x263F8EE78]);
  sub_22C8CE544(v4);
  sub_22C9A3358();
  uint64_t v5 = sub_22C9A3368();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 0, 1, v5);
}

uint64_t sub_22C96D6C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  long long v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a9 = *(_OWORD *)a1;
  *(_OWORD *)(a9 + 16) = v16;
  *(void *)(a9 + 32) = *(void *)(a1 + 32);
  uint64_t result = sub_22C8DBD98(a2, a9 + 40, &qword_2684D1840);
  *(void *)(a9 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = a3;
  *(void *)(a9 + 88) = a4;
  *(void *)(a9 + 96) = a5;
  *(void *)(a9 + 104) = a6;
  *(void *)(a9 + 112) = a7;
  *(void *)(a9 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = a8;
  return result;
}

uint64_t sub_22C96D748@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_22C96D7B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for JetImpressionable();
  return sub_22C8BDE5C(v1 + *(int *)(v3 + 20), a1, &qword_2684D3948);
}

uint64_t sub_22C96D7F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for JetImpressionable() + 24);
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C96D86C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for JetImpressionable();
  return sub_22C8BDE5C(v1 + *(int *)(v3 + 28), a1, &qword_2684D22A8);
}

BOOL sub_22C96D8AC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_22C96D8BC()
{
  return sub_22C9A4198();
}

uint64_t sub_22C96D8E8()
{
  return 4;
}

uint64_t sub_22C96D8F0()
{
  return sub_22C9A41B8();
}

uint64_t sub_22C96D938(char a1)
{
  return *(void *)&aFields_1[8 * a1];
}

uint64_t sub_22C96D958()
{
  return sub_22C96D938(*v0);
}

uint64_t sub_22C96D960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22C96F394(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22C96D988(uint64_t a1)
{
  unint64_t v2 = sub_22C96F520();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22C96D9C4(uint64_t a1)
{
  unint64_t v2 = sub_22C96F520();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22C96DA00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
  MEMORY[0x270FA5388](v3 - 8);
  long long v26 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  MEMORY[0x270FA5388](v5 - 8);
  long long v27 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_22C9A1D58();
  uint64_t v28 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  char v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  uint64_t v30 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  long long v31 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3950);
  uint64_t v29 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for JetImpressionable();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22C96F520();
  long long v33 = v12;
  uint64_t v16 = (uint64_t)v35;
  sub_22C9A41C8();
  if (v16) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v17 = v30;
  long long v35 = a1;
  uint64_t v18 = v32;
  char v39 = 0;
  sub_22C8E1638(&qword_2684D1D08, &qword_2684D1D00);
  uint64_t v19 = v31;
  sub_22C9A4058();
  uint64_t v20 = *(void (**)(char *, char *))(v17 + 32);
  long long v31 = (char *)v9;
  v20(v15, v19);
  char v38 = 1;
  sub_22C9711A8(&qword_2684D1518, MEMORY[0x263F514D8]);
  sub_22C9A4058();
  uint64_t v24 = v13;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v15[*(int *)(v13 + 24)], v8, v18);
  char v37 = 2;
  uint64_t v21 = (uint64_t)v27;
  sub_22C9A4028();
  sub_22C8DBD98(v21, (uint64_t)&v15[*(int *)(v24 + 20)], &qword_2684D3948);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
  char v36 = 3;
  sub_22C8E1638(&qword_2684D22C0, &qword_2684D22A0);
  uint64_t v22 = (uint64_t)v26;
  sub_22C9A4028();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v33, v34);
  sub_22C8DBD98(v22, (uint64_t)&v15[*(int *)(v24 + 28)], &qword_2684D22A8);
  sub_22C96F574((uint64_t)v15, v25);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  return sub_22C96F5D8((uint64_t)v15);
}

uint64_t sub_22C96DFFC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  int v60 = (void *)a1;
  uint64_t v61 = a2;
  uint64_t v3 = sub_22C9A1AA8();
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v59 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v57 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22C9A33E8();
  uint64_t v56 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for JetImpressionable();
  uint64_t v15 = v2;
  uint64_t v16 = v66;
  uint64_t v17 = sub_22C9A1D48();
  if (v16)
  {

    uint64_t v19 = sub_22C8F8FBC();
    uint64_t v20 = v57;
    uint64_t v21 = v58;
    uint64_t v22 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v19, v59);
    uint64_t v23 = sub_22C9A1A98();
    os_log_type_t v24 = sub_22C9A3A88();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v26 = (uint64_t)v61;
    if (v25)
    {
      long long v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v27 = 0;
      _os_log_impl(&dword_22C821000, v23, v24, "Failed to resolve JetImpressionable", v27, 2u);
      MEMORY[0x230F710E0](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v21 + 8))(v20, v22);
    return sub_22C8C2470((uint64_t)v60, v26);
  }
  else
  {
    uint64_t v51 = v10;
    uint64_t v52 = v13;
    uint64_t v54 = v17;
    uint64_t v55 = v7;
    uint64_t v66 = v18;
    uint64_t v53 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
    sub_22C90ACAC();
    sub_22C9A1BB8();
    uint64_t v29 = v65[0];
    uint64_t v30 = (uint64_t)v52;
    sub_22C8BDE5C(v15 + *(int *)(v14 + 20), (uint64_t)v52, &qword_2684D3948);
    uint64_t v31 = sub_22C9A1D58();
    uint64_t v32 = *(void *)(v31 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) == 1)
    {
      sub_22C8BE0DC(v30, &qword_2684D3948);
      uint64_t v58 = 0;
      uint64_t v59 = 0;
    }
    else
    {
      uint64_t v33 = sub_22C9A1D48();
      uint64_t v58 = v34;
      uint64_t v59 = v33;
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    }
    uint64_t v35 = (uint64_t)v51;
    sub_22C8BDE5C(v15 + *(int *)(v14 + 28), (uint64_t)v51, &qword_2684D22A8);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
    uint64_t v37 = *(void *)(v36 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36) == 1)
    {
      uint64_t v38 = v29;
      sub_22C8BE0DC(v35, &qword_2684D22A8);
      uint64_t v39 = -1;
    }
    else
    {
      sub_22C9A1BB8();
      uint64_t v38 = v29;
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v36);
      uint64_t v39 = v65[0];
    }
    uint64_t v40 = v60;
    uint64_t v41 = v61;
    sub_22C96F0AC(v38);
    swift_release();
    uint64_t v42 = v40[3];
    uint64_t v43 = v40[4];
    uint64_t v61 = __swift_project_boxed_opaque_existential_1(v40, v42);
    uint64_t v44 = v54;
    uint64_t v45 = v66;
    v65[0] = v54;
    v65[1] = v66;
    swift_bridgeObjectRetain();
    sub_22C9A3DC8();
    unint64_t v46 = sub_22C96EB10(v38);
    swift_bridgeObjectRelease();
    v65[3] = &type metadata for JetComponentModel;
    v65[4] = sub_22C96F634();
    uint64_t v47 = swift_allocObject();
    v65[0] = v47;
    *(_OWORD *)(v47 + 56) = 0u;
    *(_OWORD *)(v47 + 72) = 0u;
    long long v48 = v63;
    *(_OWORD *)(v47 + 16) = v62;
    *(_OWORD *)(v47 + 32) = v48;
    *(void *)(v47 + 48) = v64;
    uint64_t v49 = v59;
    *(void *)(v47 + 88) = 0;
    *(void *)(v47 + 96) = v49;
    *(void *)(v47 + 104) = v58;
    *(void *)(v47 + 112) = v44;
    *(void *)(v47 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v45;
    *(void *)(v47 + 128) = v39;
    *(void *)(v47 + 136) = v46;
    uint64_t v50 = v55;
    sub_22C9A33D8();
    *(void *)&long long v62 = v42;
    *((void *)&v62 + 1) = v43;
    v41[3] = swift_getOpaqueTypeMetadata2();
    *(void *)&long long v62 = v42;
    *((void *)&v62 + 1) = v43;
    v41[4] = swift_getOpaqueTypeConformance2();
    __swift_allocate_boxed_opaque_existential_1(v41);
    sub_22C9A2888();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v50, v53);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v65);
  }
}

uint64_t sub_22C96E6A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C9A1C08();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v29 - v9, v2, v4);
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v10, v4);
  if (v12 == *MEMORY[0x263F51430])
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    uint64_t v13 = *(void *)v10;
    uint64_t v14 = *(void *)(v13 + 16);
    uint64_t v15 = *(void *)(v13 + 24);
    *(void *)(a1 + 24) = MEMORY[0x263F8D310];
    swift_bridgeObjectRetain();
    uint64_t result = swift_release();
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v15;
  }
  else if (v12 == *MEMORY[0x263F513E8])
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    uint64_t v17 = *(void *)(*(void *)v10 + 16);
    *(void *)(a1 + 24) = MEMORY[0x263F8D6C8];
    uint64_t result = swift_release();
    *(void *)a1 = v17;
  }
  else if (v12 == *MEMORY[0x263F51420])
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    uint64_t v18 = *(void *)(*(void *)v10 + 16);
    *(void *)(a1 + 24) = MEMORY[0x263F8D538];
    uint64_t result = swift_release();
    *(void *)a1 = v18;
  }
  else if (v12 == *MEMORY[0x263F513F8])
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    char v19 = *(unsigned char *)(*(void *)v10 + 16);
    *(void *)(a1 + 24) = MEMORY[0x263F8D4F8];
    uint64_t result = swift_release();
    *(unsigned char *)a1 = v19;
  }
  else if (v12 == *MEMORY[0x263F51418])
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    uint64_t v20 = *(void *)v10;
    uint64_t v21 = *(void *)(*(void *)v10 + 16);
    int64_t v22 = *(void *)(v21 + 16);
    uint64_t v23 = MEMORY[0x263F8EE78];
    if (v22)
    {
      v29[1] = v20;
      uint64_t v30 = a1;
      uint64_t v33 = MEMORY[0x263F8EE78];
      sub_22C94B88C(0, v22, 0);
      uint64_t v24 = v21 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      uint64_t v31 = *(void *)(v5 + 72);
      do
      {
        uint64_t v25 = ((uint64_t (*)(char *, uint64_t, uint64_t))v11)(v8, v24, v4);
        sub_22C96E6A0(v32, v25);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        uint64_t v23 = v33;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22C94B88C(0, *(void *)(v23 + 16) + 1, 1);
          uint64_t v23 = v33;
        }
        unint64_t v27 = *(void *)(v23 + 16);
        unint64_t v26 = *(void *)(v23 + 24);
        if (v27 >= v26 >> 1)
        {
          sub_22C94B88C((char *)(v26 > 1), v27 + 1, 1);
          uint64_t v23 = v33;
        }
        *(void *)(v23 + 16) = v27 + 1;
        sub_22C8CEC24(v32, (_OWORD *)(v23 + 32 * v27 + 32));
        v24 += v31;
        --v22;
      }
      while (v22);
      a1 = v30;
    }
    *(void *)(a1 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3230);
    uint64_t result = swift_release();
    *(void *)a1 = v23;
  }
  else if (v12 == *MEMORY[0x263F51400])
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    uint64_t v28 = sub_22C96F0AC(*(void *)(*(void *)v10 + 16));
    *(void *)(a1 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D25C8);
    uint64_t result = swift_release();
    *(void *)a1 = v28;
  }
  else
  {
    *(void *)(a1 + 24) = MEMORY[0x263F8D310];
    strcpy((char *)a1, "Unknown value");
    *(_WORD *)(a1 + 14) = -4864;
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return result;
}

unint64_t sub_22C96EB10(uint64_t a1)
{
  uint64_t v52 = sub_22C9A1C08();
  uint64_t v2 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v51 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D90);
  uint64_t v4 = MEMORY[0x270FA5388](v50);
  uint64_t v6 = (uint64_t *)((char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v41 - v7;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1850);
    uint64_t v9 = (void *)sub_22C9A3FA8();
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v44 = a1 + 64;
  uint64_t v11 = -1 << *(unsigned char *)(a1 + 32);
  if (-v11 < 64) {
    uint64_t v12 = ~(-1 << -(char)v11);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v10;
  uint64_t v41 = -1 << *(unsigned char *)(a1 + 32);
  int64_t v43 = (unint64_t)(63 - v11) >> 6;
  uint64_t v49 = v2 + 16;
  long long v48 = &v56;
  uint64_t v47 = v2 + 32;
  unint64_t v46 = &v58;
  uint64_t v42 = v9 + 8;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v45 = MEMORY[0x263F8EE58] + 8;
  if (v13) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v43) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v44 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v43) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v44 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v43) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v44 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v43) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v44 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v43)
          {
            unint64_t v21 = *(void *)(v44 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v43) {
                break;
              }
              unint64_t v21 = *(void *)(v44 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_22C91F4B8();
          return (unint64_t)v9;
        }
      }
    }
  }
LABEL_26:
  unint64_t v13 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = v18 | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v19);
    uint64_t v26 = *v24;
    uint64_t v25 = v24[1];
    uint64_t v27 = v50;
    uint64_t v28 = v52;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(&v8[*(int *)(v50 + 48)], *(void *)(a1 + 56) + *(void *)(v2 + 72) * v19, v52);
    *(void *)uint64_t v8 = v26;
    *((void *)v8 + 1) = v25;
    sub_22C8DBD98((uint64_t)v8, (uint64_t)v6, &qword_2684D1D90);
    uint64_t v29 = (char *)v6 + *(int *)(v27 + 48);
    uint64_t v30 = v6[1];
    uint64_t v54 = *v6;
    uint64_t v55 = v30;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v51, v29, v28);
    swift_bridgeObjectRetain();
    uint64_t v31 = v48;
    swift_dynamicCast();
    uint64_t v32 = v54;
    uint64_t v33 = v55;
    uint64_t v34 = v46;
    sub_22C8CEC24(v31, v46);
    sub_22C8CEC24(v34, v59);
    sub_22C8CEC24(v59, &v57);
    unint64_t result = sub_22C8CED7C(v32, v33, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22C8CEE00);
    unint64_t v35 = result;
    if (v36)
    {
      uint64_t v15 = a1;
      uint64_t v16 = (uint64_t *)(v9[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v16 = v32;
      v16[1] = v33;
      a1 = v15;
      uint64_t v17 = (_OWORD *)(v9[7] + 32 * v35);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
      unint64_t result = (unint64_t)sub_22C8CEC24(&v57, v17);
      if (!v13) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v9[2] >= v9[3]) {
      break;
    }
    *(void *)((char *)v42 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v37 = (uint64_t *)(v9[6] + 16 * result);
    uint64_t *v37 = v32;
    v37[1] = v33;
    unint64_t result = (unint64_t)sub_22C8CEC24(&v57, (_OWORD *)(v9[7] + 32 * result));
    uint64_t v38 = v9[2];
    BOOL v39 = __OFADD__(v38, 1);
    uint64_t v40 = v38 + 1;
    if (v39) {
      goto LABEL_34;
    }
    _OWORD v9[2] = v40;
    if (!v13) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v18 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
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

uint64_t sub_22C96F030@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22C96DFFC(a1, a2);
}

uint64_t sub_22C96F048@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22C96DA00(a1, a2);
}

uint64_t type metadata accessor for JetImpressionable()
{
  uint64_t result = qword_2684DF2E0;
  if (!qword_2684DF2E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C96F0AC(uint64_t a1)
{
  uint64_t v40 = sub_22C9A1C08();
  uint64_t v2 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v38 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1850);
  uint64_t result = sub_22C9A3F88();
  uint64_t v5 = (void *)result;
  int64_t v6 = 0;
  uint64_t v42 = a1;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = a1 + 64;
  uint64_t v7 = v9;
  uint64_t v10 = 1 << *(unsigned char *)(v8 - 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v7;
  uint64_t v32 = v8;
  int64_t v33 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v39 = v2;
  uint64_t v36 = v2 + 8;
  uint64_t v37 = v2 + 16;
  uint64_t v34 = (void *)result;
  uint64_t v35 = result + 64;
  uint64_t v13 = v2;
  uint64_t v14 = v40;
  if ((v11 & v7) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  int64_t v16 = v6;
  for (unint64_t i = v15 | (v6 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v20 << 6))
  {
    int64_t v22 = (uint64_t *)(*(void *)(v42 + 48) + 16 * i);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    uint64_t v25 = v38;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v38, *(void *)(v42 + 56) + *(void *)(v13 + 72) * i, v14);
    uint64_t v26 = swift_bridgeObjectRetain();
    sub_22C96E6A0(v41, v26);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v25, v14);
    uint64_t v5 = v34;
    *(void *)(v35 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v27 = (void *)(v5[6] + 16 * i);
    *uint64_t v27 = v23;
    v27[1] = v24;
    uint64_t result = (uint64_t)sub_22C8CEC24(v41, (_OWORD *)(v5[7] + 32 * i));
    uint64_t v28 = v5[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v5[2] = v30;
    int64_t v6 = v16;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v18 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_24;
    }
    if (v18 >= v33) {
      return (uint64_t)v5;
    }
    unint64_t v19 = *(void *)(v32 + 8 * v18);
    int64_t v20 = v6 + 1;
    if (!v19)
    {
      int64_t v20 = v6 + 2;
      if (v6 + 2 >= v33) {
        return (uint64_t)v5;
      }
      unint64_t v19 = *(void *)(v32 + 8 * v20);
      if (!v19)
      {
        int64_t v20 = v6 + 3;
        if (v6 + 3 >= v33) {
          return (uint64_t)v5;
        }
        unint64_t v19 = *(void *)(v32 + 8 * v20);
        if (!v19) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v12 = (v19 - 1) & v19;
    int64_t v16 = v20;
  }
  uint64_t v21 = v6 + 4;
  if (v6 + 4 >= v33) {
    return (uint64_t)v5;
  }
  unint64_t v19 = *(void *)(v32 + 8 * v21);
  if (v19)
  {
    int64_t v20 = v6 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v20 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v20 >= v33) {
      return (uint64_t)v5;
    }
    unint64_t v19 = *(void *)(v32 + 8 * v20);
    ++v21;
    if (v19) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22C96F394(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x73646C656966 && a2 == 0xE600000000000000;
  if (v3 || (sub_22C9A40C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E656D656C65 && a2 == 0xE700000000000000 || (sub_22C9A40C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E65726170 && a2 == 0xE600000000000000 || (sub_22C9A40C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_22C9A40C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_22C96F520()
{
  unint64_t result = qword_2684D3958;
  if (!qword_2684D3958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3958);
  }
  return result;
}

uint64_t sub_22C96F574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JetImpressionable();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C96F5D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JetImpressionable();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22C96F634()
{
  unint64_t result = qword_2684D3960;
  if (!qword_2684D3960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3960);
  }
  return result;
}

uint64_t sub_22C96F688()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  if (*(void *)(v0 + 80)) {
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 144, 7);
}

unint64_t sub_22C96F6EC()
{
  unint64_t result = qword_2684D3968;
  if (!qword_2684D3968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3968);
  }
  return result;
}

unint64_t sub_22C96F744()
{
  unint64_t result = qword_2684D3970;
  if (!qword_2684D3970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3970);
  }
  return result;
}

unint64_t sub_22C96F79C()
{
  unint64_t result = qword_2684D3978;
  if (!qword_2684D3978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3978);
  }
  return result;
}

unint64_t sub_22C96F7F4()
{
  unint64_t result = qword_2684D3980;
  if (!qword_2684D3980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3980);
  }
  return result;
}

uint64_t sub_22C96F848()
{
  return sub_22C9711A8(&qword_2684D3988, (void (*)(uint64_t))type metadata accessor for JetImpressionable);
}

uint64_t destroy for JetComponentModel(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JetComponentModel(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = (_OWORD *)(a1 + 40);
  char v6 = (_OWORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 64);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v8;
    (**(void (***)(_OWORD *, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 56);
    *uint64_t v5 = *v6;
    *(_OWORD *)(a1 + 56) = v9;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  uint64_t v12 = *(void *)(a2 + 112);
  uint64_t v13 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = v12;
  *(void *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JetComponentModel(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  uint64_t v4 = *(void *)(a2 + 64);
  if (!*(void *)(a1 + 64))
  {
    if (v4)
    {
      *(void *)(a1 + 64) = v4;
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 40);
    long long v6 = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(_OWORD *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v5;
    *(_OWORD *)(a1 + 56) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
LABEL_8:
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  return result;
}

uint64_t assignWithTake for JetComponentModel(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JetComponentModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JetComponentModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JetComponentModel()
{
  return &type metadata for JetComponentModel;
}

char *sub_22C96FC5C(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = sub_22C9A1D58();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(&a1[a3[6]], &a2[a3[6]], v11);
    }
    else
    {
      unint64_t v15 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
      v15(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      v15(&a1[a3[6]], &a2[a3[6]], v11);
    }
    uint64_t v16 = a3[7];
    uint64_t v17 = &a1[v16];
    int64_t v18 = &a2[v16];
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t sub_22C96FF14(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_22C9A1D58();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  if (!v8) {
    v9(v5, v6);
  }
  v9(a1 + a2[6], v6);
  uint64_t v10 = a1 + a2[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
  uint64_t v14 = *(void *)(v11 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v10, 1, v11);
  if (!result)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
    return v13(v10, v11);
  }
  return result;
}

uint64_t sub_22C9700C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  int v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a1 + a3[6], a2 + a3[6], v10);
  }
  else
  {
    uint64_t v13 = *(void (**)(void *, const void *, uint64_t))(v11 + 16);
    v13(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    v13((void *)(a1 + a3[6]), (const void *)(a2 + a3[6]), v10);
  }
  uint64_t v14 = a3[7];
  unint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_22C970330(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  int v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_22C970650(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  int v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(a1 + a3[6], a2 + a3[6], v10);
  }
  else
  {
    int v13 = *(void (**)(void *, const void *, uint64_t))(v11 + 32);
    v13(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    v13((void *)(a1 + a3[6]), (const void *)(a2 + a3[6]), v10);
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_22C9708B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  int v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_22C970BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C970BEC);
}

uint64_t sub_22C970BEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_22C9A1D58();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + a3[7];
  return v17(v19, a2, v18);
}

uint64_t sub_22C970D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C970DA4);
}

uint64_t sub_22C970DA4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D00);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  uint64_t v16 = sub_22C9A1D58();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[6];
    goto LABEL_7;
  }
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D22A8);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[7];
  return v19(v21, a2, a2, v20);
}

void sub_22C970F54()
{
  sub_22C971094();
  if (v0 <= 0x3F)
  {
    sub_22C9711F0();
    if (v1 <= 0x3F)
    {
      sub_22C9A1D58();
      if (v2 <= 0x3F)
      {
        sub_22C9046EC();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_22C971094()
{
  if (!qword_2684D3990)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D1D88);
    sub_22C9710FC();
    unint64_t v0 = sub_22C9A1BC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2684D3990);
    }
  }
}

unint64_t sub_22C9710FC()
{
  unint64_t result = qword_2684D3998;
  if (!qword_2684D3998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D1D88);
    sub_22C9711A8(&qword_2684D1668, MEMORY[0x263F51448]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3998);
  }
  return result;
}

uint64_t sub_22C9711A8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_22C9711F0()
{
  if (!qword_2684D39A0)
  {
    sub_22C9A1D58();
    unint64_t v0 = sub_22C9A3C68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2684D39A0);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for JetImpressionable.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x22C971314);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JetImpressionable.CodingKeys()
{
  return &type metadata for JetImpressionable.CodingKeys;
}

void sub_22C97134C()
{
  unk_2684E0BE7 = -18;
}

uint64_t *sub_22C97137C()
{
  if (qword_2684DF2F0 != -1) {
    swift_once();
  }
  return &qword_2684E0BD8;
}

uint64_t sub_22C9713C8()
{
  if (qword_2684DF2F0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2684E0BD8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_22C971430(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 192) = a2;
  uint64_t v3 = sub_22C9A1AA8();
  *(void *)(v2 + 144) = v3;
  *(void *)(v2 + 152) = *(void *)(v3 - 8);
  *(void *)(v2 + 16__isPlatformVersionAtLeast(2, 18, 1, 0) = swift_task_alloc();
  *(void *)(v2 + 168) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C971500, 0, 0);
}

uint64_t sub_22C971500()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v3 = v0 + 80;
  int v4 = *(unsigned __int8 *)(v1 + 192);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BF48]), sel_init);
  unsigned int v6 = v5;
  *(void *)(v1 + 176) = v5;
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  objc_msgSend(v5, sel_setCachePolicy_, v7);
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 56) = v1 + 120;
  *(void *)(v1 + 24) = sub_22C971640;
  uint64_t v8 = swift_continuation_init();
  *(void *)(v1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = MEMORY[0x263EF8330];
  *(void *)(v1 + 88) = 0x40000000;
  *(void *)(v1 + 96) = sub_22C971B9C;
  *(void *)(v1 + 104) = &block_descriptor_1;
  *(void *)(v1 + 112) = v8;
  objc_msgSend(v6, sel_startRequestWithCompletionHandler_, v3);
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_22C971640()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_22C97197C;
  }
  else {
    uint64_t v2 = sub_22C971750;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C971750()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void **)(v0 + 120);
  uint64_t v5 = sub_22C8F8FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v1);
  unsigned int v6 = v4;
  uint64_t v7 = sub_22C9A1A98();
  os_log_type_t v8 = sub_22C9A3AA8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    id v10 = [v6 members];
    sub_22C8BA084(0, (unint64_t *)&unk_2684D39B0);
    unint64_t v11 = sub_22C9A3858();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_22C9A3F78();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }

    swift_bridgeObjectRelease();
    *(void *)(v0 + 136) = v12;
    sub_22C9A3C78();

    _os_log_impl(&dword_22C821000, v7, v8, "User has a family circle with %ld members.", v9, 0xCu);
    MEMORY[0x230F710E0](v9, -1, -1);
    uint64_t v13 = *(NSObject **)(v0 + 176);
  }
  else
  {

    uint64_t v7 = v6;
    uint64_t v13 = v6;
  }
  uint64_t v14 = *(void *)(v0 + 168);
  uint64_t v15 = *(void *)(v0 + 144);
  uint64_t v16 = *(void *)(v0 + 152);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**))(v0 + 8);
  return v17(v6);
}

uint64_t sub_22C97197C()
{
  uint64_t v1 = *(void **)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 144);
  swift_willThrow();
  uint64_t v5 = sub_22C8F8FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  os_log_type_t v8 = sub_22C9A1A98();
  os_log_type_t v9 = sub_22C9A3A88();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v11 = *(void **)(v0 + 176);
    id v10 = *(void **)(v0 + 184);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v10;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 128) = v15;
    sub_22C9A3C78();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_22C821000, v8, v9, "Unable to fetch family circle %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v13, -1, -1);
    MEMORY[0x230F710E0](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 184);
  }
  (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17(0);
}

uint64_t sub_22C971BA0(uint64_t a1)
{
  v1[31] = a1;
  sub_22C9A1608();
  v1[32] = swift_task_alloc();
  uint64_t v2 = sub_22C9A1628();
  v1[33] = v2;
  v1[34] = *(void *)(v2 - 8);
  v1[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  v1[36] = swift_task_alloc();
  uint64_t v3 = sub_22C9A14E8();
  v1[37] = v3;
  v1[38] = *(void *)(v3 - 8);
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C971D28, 0, 0);
}

uint64_t sub_22C971D28()
{
  v0[41] = sub_22C9A3688();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3C000]), sel_init);
  v0[42] = v1;
  v0[2] = v0;
  v0[7] = v0 + 30;
  v0[3] = sub_22C971E64;
  uint64_t v2 = swift_continuation_init();
  v0[18] = MEMORY[0x263EF8330];
  v0[19] = 0x40000000;
  v0[20] = sub_22C971B9C;
  v0[21] = &block_descriptor_1;
  v0[22] = v2;
  objc_msgSend(v1, sel_fetchAAURLConfigurationWithCompletion_, v0 + 18);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_22C971E64()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 344) = v1;
  if (v1) {
    uint64_t v2 = sub_22C9727D0;
  }
  else {
    uint64_t v2 = sub_22C971F74;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C971F74()
{
  uint64_t v2 = v0[41];
  uint64_t v1 = (void *)v0[42];
  uint64_t v3 = (void *)v0[30];
  v0[44] = v3;

  id v4 = objc_msgSend(v3, sel_urlForEndpoint_, v2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v7 = v0[38];
    uint64_t v6 = v0[39];
    uint64_t v9 = v0[36];
    uint64_t v8 = v0[37];
    sub_22C9A14C8();

    id v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    v10(v9, v6, v8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v8) != 1)
    {
      unint64_t v11 = (void *)v0[31];
      v10(v0[40], v0[36], v0[37]);
      id v12 = v11;
      sub_22C9A1498();
      id v13 = objc_allocWithZone(MEMORY[0x263F3C060]);
      id v14 = (void *)sub_22C9A3688();
      swift_bridgeObjectRelease();
      id v15 = objc_msgSend(v13, sel_initWithAppleAccount_urlString_, v12, v14);
      v0[45] = v15;

      v0[10] = v0;
      v0[15] = v0 + 28;
      v0[11] = sub_22C9722C4;
      uint64_t v16 = swift_continuation_init();
      v0[23] = MEMORY[0x263EF8330];
      v0[24] = 0x40000000;
      v0[25] = sub_22C97295C;
      v0[26] = &block_descriptor_2;
      v0[27] = v16;
      objc_msgSend(v15, sel_performRequestWithHandler_, v0 + 23);
      return MEMORY[0x270FA23F0](v0 + 10);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[38] + 56))(v0[36], 1, 1, v0[37]);
  }
  uint64_t v17 = (void *)v0[41];
  uint64_t v18 = v0[35];
  uint64_t v19 = v0[33];
  uint64_t v20 = v0[34];
  sub_22C8D6A6C(v0[36]);
  sub_22C9A15F8();
  sub_22C8CE544(MEMORY[0x263F8EE78]);
  sub_22C972A94();
  sub_22C9A1468();
  sub_22C9A1618();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_22C9722C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 368) = v1;
  if (v1) {
    uint64_t v2 = sub_22C972880;
  }
  else {
    uint64_t v2 = sub_22C9723D4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C9723D4()
{
  uint64_t v1 = *(void **)(v0 + 232);
  if (!v1) {
    goto LABEL_24;
  }
  self;
  uint64_t v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2 || (id v3 = objc_msgSend(v2, sel_services)) == 0)
  {

LABEL_24:
    uint64_t v16 = *(void **)(v0 + 352);
    uint64_t v17 = *(void **)(v0 + 360);
    uint64_t v18 = *(void **)(v0 + 328);
    uint64_t v19 = *(void *)(v0 + 304);
    uint64_t v31 = *(void *)(v0 + 296);
    uint64_t v33 = *(void *)(v0 + 320);
    uint64_t v21 = *(void *)(v0 + 272);
    uint64_t v20 = *(void *)(v0 + 280);
    uint64_t v22 = *(void *)(v0 + 264);
    sub_22C9A15E8();
    sub_22C8CE544(MEMORY[0x263F8EE78]);
    sub_22C972A94();
    sub_22C9A1468();
    sub_22C9A1618();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v33, v31);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
  uint64_t v4 = v3;
  sub_22C8BA084(0, &qword_2684D39C8);
  unint64_t v5 = sub_22C9A3858();

  if (v5 >> 62) {
    goto LABEL_30;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_22C9A3F78())
  {
    uint64_t v32 = v1;
    uint64_t v7 = 0;
    while (1)
    {
      id v9 = (v5 & 0xC000000000000001) != 0 ? (id)MEMORY[0x230F6FB60](v7, v5) : *(id *)(v5 + 8 * v7 + 32);
      id v10 = v9;
      uint64_t v1 = (void *)(v7 + 1);
      if (__OFADD__(v7, 1)) {
        break;
      }
      id v11 = objc_msgSend(v9, sel_name);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = sub_22C9A36C8();
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v15 = 0;
      }
      if (qword_2684DF2F0 == -1)
      {
        if (!v15) {
          goto LABEL_8;
        }
      }
      else
      {
        swift_once();
        if (!v15) {
          goto LABEL_8;
        }
      }
      if (v13 == qword_2684E0BD8 && v15 == unk_2684E0BE0)
      {
        swift_bridgeObjectRelease();
LABEL_28:
        swift_bridgeObjectRelease();

        goto LABEL_33;
      }
      char v8 = sub_22C9A40C8();
      swift_bridgeObjectRelease();
      if (v8) {
        goto LABEL_28;
      }
LABEL_8:

      ++v7;
      if (v1 == (void *)v6)
      {
        swift_bridgeObjectRelease();

        goto LABEL_32;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();

LABEL_32:
  id v10 = 0;
LABEL_33:
  uint64_t v25 = *(void **)(v0 + 360);
  uint64_t v26 = *(void *)(v0 + 320);
  uint64_t v27 = *(void **)(v0 + 328);
  uint64_t v28 = *(void *)(v0 + 304);
  uint64_t v29 = *(void *)(v0 + 296);

  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v29);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = *(uint64_t (**)(void *))(v0 + 8);
  return v30(v10);
}

uint64_t sub_22C9727D0()
{
  uint64_t v1 = (void *)v0[42];
  uint64_t v2 = (void *)v0[41];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_22C972880()
{
  uint64_t v1 = (void *)v0[45];
  uint64_t v2 = (void *)v0[44];
  uint64_t v3 = v0[40];
  uint64_t v4 = (void *)v0[41];
  uint64_t v5 = v0[37];
  uint64_t v6 = v0[38];
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_22C97295C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3F70);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a4;
    id v8 = a4;
    return MEMORY[0x270FA2410](v4, v6);
  }
  else
  {
    id v10 = *(void **)(*(void *)(v4 + 64) + 40);
    *id v10 = a2;
    v10[1] = a3;
    id v11 = a2;
    id v12 = a3;
    return MEMORY[0x270FA2408](v4);
  }
}

unint64_t sub_22C972A1C(uint64_t a1, uint64_t a2)
{
  sub_22C9A4188();
  sub_22C9A3768();
  uint64_t v4 = sub_22C9A41B8();
  return sub_22C8CEC34(a1, a2, v4);
}

unint64_t sub_22C972A94()
{
  unint64_t result = qword_2684D39C0;
  if (!qword_2684D39C0)
  {
    sub_22C9A1628();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D39C0);
  }
  return result;
}

uint64_t type metadata accessor for FamilySharingHelper()
{
  return self;
}

uint64_t sub_22C972B10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_22C972B7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 20);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ToggleRecommendedBackupAction(uint64_t a1)
{
  return sub_22C8EF20C(a1, qword_2684DF5A0);
}

uint64_t sub_22C972C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972C94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 28);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972D10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 32);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972D8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 36);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972E08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 40);
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972E80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 44);
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972EF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 48);
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972F70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 52);
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C972FE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 56);
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C973060@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ToggleRecommendedBackupAction(0) + 60);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_22C9730DC(uint64_t a1)
{
  return sub_22C97909C(a1);
}

uint64_t sub_22C9730F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v109 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v108 = (char *)v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_22C9A1AA8();
  uint64_t v112 = *(void *)(v113 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v113);
  int v111 = (char *)v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v107 = (char *)v91 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2128);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_22C9A1C08();
  uint64_t v115 = *(void *)(v114 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v114);
  uint64_t v106 = (char *)v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v105 = ((char *)v91 - v15);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v91 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = ((char *)v91 - v20);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = ((char *)v91 - v23);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = ((char *)v91 - v26);
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v91 - v28;
  uint64_t v110 = a2;
  sub_22C9A1BB8();
  uint64_t v101 = v27;
  v102 = v24;
  v95 = v18;
  uint64_t v98 = v21;
  uint64_t v104 = v4;
  uint64_t v103 = a1;
  uint64_t v30 = v115;
  uint64_t v31 = v114;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v115 + 56))(v11, 0, 1, v114);
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  v32(v29, v11, v31);
  sub_22C979424((uint64_t)v29, &v118);
  char v94 = v29;
  uint64_t v33 = type metadata accessor for ToggleRecommendedBackupAction(0);
  uint64_t v34 = v103 + *(int *)(v33 + 24);
  uint64_t v35 = v101;
  sub_22C9A1BB8();
  uint64_t v92 = v34;
  char v99 = (void (*)(unint64_t, char *, uint64_t))v32;
  uint64_t v36 = v31;
  uint64_t v37 = sub_22C94AEAC();
  uint64_t v97 = v30 + 32;
  v91[2] = v33;
  uint64_t v38 = *(void (**)(NSObject *, uint64_t))(v30 + 8);
  uint64_t v100 = v30 + 8;
  v38(v35, v31);
  uint64_t v39 = *(void *)(v37 + 16);
  uint64_t v93 = v38;
  uint64_t v40 = v112;
  if (v39)
  {
    uint64_t v101 = *(NSObject **)(v30 + 16);
    unint64_t v41 = v37 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
    uint64_t v96 = *(void *)(v30 + 72);
    v91[1] = v37;
    swift_bridgeObjectRetain();
    uint64_t v42 = (char *)MEMORY[0x263F8EE78];
    int64_t v43 = v102;
    do
    {
      ((void (*)(NSObject *, unint64_t, uint64_t))v101)(v43, v41, v36);
      char v44 = sub_22C94AC50();
      v38(v43, v36);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v42 = sub_22C8E0888(0, *((void *)v42 + 2) + 1, 1, v42);
      }
      unint64_t v46 = *((void *)v42 + 2);
      unint64_t v45 = *((void *)v42 + 3);
      if (v46 >= v45 >> 1) {
        uint64_t v42 = sub_22C8E0888((char *)(v45 > 1), v46 + 1, 1, v42);
      }
      *((void *)v42 + 2) = v46 + 1;
      v42[v46 + 32] = v44 & 1;
      uint64_t v40 = v112;
      uint64_t v38 = v93;
      int64_t v43 = v102;
      v41 += v96;
      --v39;
    }
    while (v39);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v42 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v48 = v113;
  uint64_t v49 = v109;
  uint64_t v50 = v98;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_22C977B54((uint64_t)v42);
    uint64_t v42 = (char *)result;
  }
  unint64_t v51 = v118;
  if ((v118 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v118 >= *((void *)v42 + 2))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v42[v118 + 32] = (v42[v118 + 32] & 1) == 0;
  uint64_t v117 = v42;
  uint64_t v52 = sub_22C8F8FBC();
  uint64_t v53 = v107;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v107, v52, v48);
  sub_22C97C9A4((uint64_t)&v118);
  uint64_t v54 = sub_22C9A1A98();
  LODWORD(v102) = sub_22C9A3AA8();
  if (!os_log_type_enabled(v54, (os_log_type_t)v102))
  {
    uint64_t v64 = v40;
    uint64_t v56 = v36;
    sub_22C97CA0C((uint64_t)&v118);
    sub_22C97CA0C((uint64_t)&v118);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v53, v48);
    goto LABEL_19;
  }
  uint64_t v101 = v54;
  uint64_t v55 = swift_slowAlloc();
  uint64_t v96 = swift_slowAlloc();
  *(void *)&v119[0] = v96;
  *(_DWORD *)uint64_t v55 = 134218498;
  uint64_t v116 = v51;
  sub_22C9A3C78();
  *(_WORD *)(v55 + 12) = 1024;
  uint64_t result = swift_beginAccess();
  if (v51 >= *((void *)v117 + 2))
  {
LABEL_38:
    __break(1u);
    return result;
  }
  uint64_t v56 = v36;
  int v57 = v117[v51 + 32];
  sub_22C97CA0C((uint64_t)&v118);
  LODWORD(v116) = v57;
  sub_22C9A3C78();
  sub_22C97CA0C((uint64_t)&v118);
  *(_WORD *)(v55 + 18) = 2080;
  uint64_t v58 = swift_bridgeObjectRetain();
  uint64_t v59 = MEMORY[0x230F6F590](v58, MEMORY[0x263F8D4F8]);
  unint64_t v61 = v60;
  swift_bridgeObjectRelease();
  uint64_t v116 = sub_22C8BA27C(v59, v61, (uint64_t *)v119);
  sub_22C9A3C78();
  swift_bridgeObjectRelease();
  os_log_t v62 = v101;
  _os_log_impl(&dword_22C821000, v101, (os_log_type_t)v102, "ToggleRecommendedBackupAction, setting selected devices idx %ld selected: %{BOOL}d. New list: %s", (uint8_t *)v55, 0x1Cu);
  uint64_t v63 = v96;
  swift_arrayDestroy();
  MEMORY[0x230F710E0](v63, -1, -1);
  MEMORY[0x230F710E0](v55, -1, -1);

  (*(void (**)(char *, uint64_t))(v112 + 8))(v107, v48);
  uint64_t v38 = v93;
  uint64_t v49 = v109;
  uint64_t v50 = v98;
LABEL_19:
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v108, v92, v104);
  swift_beginAccess();
  int64_t v65 = *((void *)v117 + 2);
  if (v65)
  {
    uint64_t v66 = v115;
    *(void *)&v119[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_22C977B68(0, v65, 0);
    uint64_t v67 = 0;
    uint64_t v68 = *(void *)&v119[0];
    int v69 = v95;
    do
    {
      sub_22C9A38D8();
      *(void *)&v119[0] = v68;
      unint64_t v71 = *(void *)(v68 + 16);
      unint64_t v70 = *(void *)(v68 + 24);
      if (v71 >= v70 >> 1)
      {
        sub_22C977B68(v70 > 1, v71 + 1, 1);
        uint64_t v68 = *(void *)&v119[0];
      }
      ++v67;
      *(void *)(v68 + 16) = v71 + 1;
      v99(v68+ ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80))+ *(void *)(v66 + 72) * v71, v69, v56);
    }
    while (v65 != v67);
    swift_bridgeObjectRelease();
    uint64_t v38 = v93;
    uint64_t v49 = v109;
    uint64_t v50 = v98;
  }
  uint64_t v72 = v56;
  sub_22C9A38B8();
  swift_bridgeObjectRelease();
  long long v73 = v108;
  sub_22C9A1D08();
  v38(v50, v56);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v73, v104);
  long long v74 = v105;
  sub_22C9A1BB8();
  uint64_t v114 = sub_22C94AEAC();
  uint64_t v75 = (void (*)(char *, uint64_t))v93;
  v93(v74, v56);
  uint64_t v76 = *(void *)(v114 + 16);
  if (v76)
  {
    unsigned __int8 v77 = *(void (**)(uint64_t, unint64_t, uint64_t))(v115 + 16);
    unint64_t v78 = v114 + ((*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80));
    uint64_t v79 = *(void *)(v115 + 72);
    swift_bridgeObjectRetain();
    char v80 = (void *)MEMORY[0x263F8EE78];
    uint64_t v81 = (uint64_t)v106;
    do
    {
      v77(v81, v78, v72);
      sub_22C979424(v81, v119);
      v93(v81, v72);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        char v80 = sub_22C8E0984(0, v80[2] + 1, 1, v80);
      }
      unint64_t v83 = v80[2];
      unint64_t v82 = v80[3];
      if (v83 >= v82 >> 1) {
        char v80 = sub_22C8E0984((void *)(v82 > 1), v83 + 1, 1, v80);
      }
      v80[2] = v83 + 1;
      uint64_t v84 = &v80[11 * v83];
      long long v85 = v119[1];
      *((_OWORD *)v84 + 2) = v119[0];
      *((_OWORD *)v84 + 3) = v85;
      long long v86 = v119[2];
      long long v87 = v119[3];
      long long v88 = v119[4];
      v84[14] = v120;
      *((_OWORD *)v84 + 5) = v87;
      *((_OWORD *)v84 + 6) = v88;
      *((_OWORD *)v84 + 4) = v86;
      uint64_t v81 = (uint64_t)v106;
      v78 += v79;
      --v76;
    }
    while (v76);
    swift_bridgeObjectRelease_n();
    uint64_t v75 = (void (*)(char *, uint64_t))v93;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v80 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v89 = (void (*)(uint64_t *, uint64_t, uint64_t))v117;
  swift_bridgeObjectRetain();
  uint64_t v90 = v110;
  sub_22C974298(v110, (uint64_t)v80, (uint64_t)v89);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22C974B04(v90, (uint64_t)v80, v89);
  v75(v94, v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_22C97423C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22C979424(a1, v7);
  if (!v2)
  {
    long long v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v8;
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_22C974298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A1C08();
  uint64_t v69 = *(void *)(v6 - 8);
  uint64_t v70 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v64 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v66 = (uint64_t *)((char *)&v61 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v68 = (char *)&v61 - v11;
  uint64_t v12 = sub_22C9A1AA8();
  uint64_t v13 = *(void (***)(char *, uint64_t))(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v71 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v61 - v16;
  uint64_t v75 = a3;
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = sub_22C97C224(v18, (void (*)(void *__return_ptr, uint64_t, _OWORD *))sub_22C97CA74);
  uint64_t v20 = v3;
  swift_bridgeObjectRelease();
  unsigned __int8 v77 = 0;
  unint64_t v21 = v19[2];
  if (v21)
  {
    uint64_t v23 = v19[5];
    unint64_t v22 = v19[6];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v22 = 0xE000000000000000;
  }
  uint64_t v24 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0) {
    uint64_t v24 = v23 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v72 = v12;
  long long v73 = v13;
  if (v21 && !v24)
  {
    uint64_t v25 = sub_22C8F8FBC();
    ((void (*)(char *, uint64_t, uint64_t))v13[2])(v17, v25, v12);
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_22C9A1A98();
    os_log_type_t v27 = sub_22C9A3A88();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = v3;
      uint64_t v29 = a1;
      uint64_t v30 = v28;
      *(_DWORD *)uint64_t v28 = 134217984;
      unint64_t v76 = v21;
      sub_22C9A3C78();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22C821000, v26, v27, "ToggleRecommendedBackupAction: We have %ld devices but were unable to get a name to use in the confirmation message template.", v30, 0xCu);
      uint64_t v31 = v30;
      a1 = v29;
      uint64_t v20 = v67;
      MEMORY[0x230F710E0](v31, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v12 = v72;
    v73[1](v17, v72);
    unint64_t v21 = v19[2];
  }
  if (v21 == 2)
  {
    uint64_t v67 = v23;
    type metadata accessor for ToggleRecommendedBackupAction(0);
    sub_22C9A1D48();
    if (v20) {
      goto LABEL_20;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2A10);
    uint64_t v35 = swift_allocObject();
    uint64_t v65 = a1;
    uint64_t v36 = v35;
    *(_OWORD *)(v35 + 16) = xmmword_22C9B1320;
    *(void *)(v35 + 56) = MEMORY[0x263F8D310];
    *(void *)(v35 + 64) = sub_22C8DE080();
    *(void *)(v36 + 32) = v67;
    *(void *)(v36 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v22;
LABEL_23:
    uint64_t v34 = sub_22C9A36E8();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  if (v21 == 1)
  {
    uint64_t v67 = v23;
    type metadata accessor for ToggleRecommendedBackupAction(0);
    sub_22C9A1D48();
    if (!v20)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2A10);
      uint64_t v32 = swift_allocObject();
      uint64_t v65 = a1;
      uint64_t v33 = v32;
      *(_OWORD *)(v32 + 16) = xmmword_22C9B1320;
      *(void *)(v32 + 56) = MEMORY[0x263F8D310];
      *(void *)(v32 + 64) = sub_22C8DE080();
      *(void *)(v33 + 32) = v67;
      *(void *)(v33 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v22;
      uint64_t v34 = sub_22C9A36E8();
      swift_bridgeObjectRelease();
LABEL_24:
      uint64_t v43 = sub_22C9A1D48();
      uint64_t v67 = v34;
      uint64_t v62 = v43;
      unint64_t v63 = v44;
      uint64_t v38 = v69;
      uint64_t v12 = v72;
      goto LABEL_25;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  if (v21 >= 3)
  {
    uint64_t v67 = v23;
    type metadata accessor for ToggleRecommendedBackupAction(0);
    uint64_t v37 = sub_22C9A1D48();
    if (v20) {
      goto LABEL_20;
    }
    unint64_t v63 = v37;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2A10);
    uint64_t v39 = swift_allocObject();
    uint64_t v65 = a1;
    uint64_t v40 = (void *)v39;
    *(_OWORD *)(v39 + 16) = xmmword_22C9AEA30;
    *(void *)(v39 + 56) = MEMORY[0x263F8D310];
    unint64_t v41 = sub_22C8DE080();
    v40[4] = v67;
    v40[5] = v22;
    uint64_t v42 = MEMORY[0x263F8D750];
    v40[12] = MEMORY[0x263F8D6C8];
    v40[13] = v42;
    v40[8] = v41;
    v40[9] = v21 - 1;
    goto LABEL_23;
  }
  uint64_t v65 = a1;
  swift_bridgeObjectRelease();
  uint64_t v67 = 0;
  unsigned __int8 v77 = 1;
  uint64_t v62 = 0;
  unint64_t v63 = 0xE000000000000000;
  uint64_t v38 = v69;
LABEL_25:
  uint64_t v45 = sub_22C8F8FBC();
  unint64_t v46 = v73;
  ((void (*)(char *, uint64_t, uint64_t))v73[2])(v71, v45, v12);
  int v47 = v77;
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_22C9A1A98();
  os_log_type_t v49 = sub_22C9A3AA8();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = swift_slowAlloc();
    *(_DWORD *)uint64_t v50 = 134218240;
    swift_bridgeObjectRelease();
    unint64_t v76 = v21;
    sub_22C9A3C78();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 1024;
    LODWORD(v76) = v47;
    sub_22C9A3C78();
    _os_log_impl(&dword_22C821000, v48, v49, "ToggleRecommendedBackupAction: updating buttons for %ld devices selected. Delete button disabled: %{BOOL}d", (uint8_t *)v50, 0x12u);
    uint64_t v51 = v50;
    unint64_t v46 = v73;
    MEMORY[0x230F710E0](v51, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v52 = v74;
  uint64_t v53 = v68;
  v46[1](v71, v72);
  uint64_t v54 = type metadata accessor for ToggleRecommendedBackupAction(0);
  sub_22C9A3778();
  swift_bridgeObjectRelease();
  sub_22C9A1D08();
  if (!v20)
  {
    uint64_t v55 = v70;
    long long v74 = *(char **)(v38 + 8);
    ((void (*)(char *, uint64_t))v74)(v53, v70);
    long long v73 = (void (**)(char *, uint64_t))&v52[*(int *)(v54 + 36)];
    uint64_t v56 = swift_allocObject();
    swift_beginAccess();
    *(unsigned char *)(v56 + 16) = v77;
    int v57 = v66;
    *uint64_t v66 = v56;
    (*(void (**)(uint64_t *, void, uint64_t))(v38 + 104))(v57, *MEMORY[0x263F513F8], v55);
    sub_22C9A1D08();
    uint64_t v58 = v74;
    ((void (*)(uint64_t *, uint64_t))v74)(v57, v70);
    uint64_t v59 = v64;
    sub_22C9A3778();
    swift_bridgeObjectRelease();
    sub_22C9A1D08();
    return ((uint64_t (*)(char *, uint64_t))v58)(v59, v70);
  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v53, v70);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C974B04(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *, uint64_t, uint64_t))
{
  uint64_t v72 = a1;
  uint64_t v76 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22C9A1C08();
  uint64_t v77 = *(void *)(v8 - 8);
  uint64_t v78 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v75 = (uint64_t *)((char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v74 = (char *)&v68 - v12;
  MEMORY[0x270FA5388](v11);
  long long v73 = (uint64_t *)((char *)&v68 - v13);
  unint64_t v83 = sub_22C8F4C70(MEMORY[0x263F8EE78]);
  uint64_t v14 = *(void *)(a2 + 16);
  uint64_t v80 = v5;
  if (!v14)
  {
    uint64_t v17 = 0;
LABEL_66:
    uint64_t v48 = swift_allocObject();
    v82[0] = v17;
    *(void *)(v48 + 16) = sub_22C9A4098();
    *(void *)(v48 + 24) = v49;
    uint64_t v50 = v73;
    *long long v73 = v48;
    uint64_t v51 = *MEMORY[0x263F51430];
    uint64_t v52 = v77;
    uint64_t v53 = v78;
    uint64_t v79 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v77 + 104);
    v79(v50, v51, v78);
    uint64_t v54 = (uint64_t)v74;
    (*(void (**)(char *, uint64_t *, uint64_t))(v52 + 32))(v74, v50, v53);
    uint64_t v55 = v83;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v82[0] = v55;
    sub_22C978358(v54, 0xD000000000000010, 0x800000022C9C1790, isUniquelyReferenced_nonNull_native);
    unint64_t v83 = v82[0];
    swift_bridgeObjectRelease();
    uint64_t v57 = sub_22C8F8FBC();
    uint64_t v58 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v57, v76);
    swift_bridgeObjectRetain_n();
    uint64_t v59 = sub_22C9A1A98();
    os_log_type_t v60 = sub_22C9A3AA8();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      v82[0] = v62;
      long long v74 = v7;
      *(_DWORD *)uint64_t v61 = 136315138;
      uint64_t v63 = sub_22C9A3628();
      uint64_t v81 = sub_22C8BA27C(v63, v64, v82);
      uint64_t v53 = v78;
      sub_22C9A3C78();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22C821000, v59, v60, "ToggleRecommendedBackupAction, setting disappear user info %s", v61, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v62, -1, -1);
      MEMORY[0x230F710E0](v61, -1, -1);

      (*(void (**)(char *, uint64_t))(v80 + 8))(v74, v76);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v58);
    }
    type metadata accessor for ToggleRecommendedBackupAction(0);
    uint64_t v65 = swift_allocObject();
    swift_beginAccess();
    *(void *)(v65 + 16) = v83;
    uint64_t v66 = v75;
    *uint64_t v75 = v65;
    uint64_t v67 = v66;
    v79(v66, *MEMORY[0x263F51400], v53);
    sub_22C9A1D08();
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v77 + 8))(v67, v53);
  }
  uint64_t v15 = a2 + 32;
  uint64_t v16 = (char *)a3 + 32;
  uint64_t v70 = (char *)v82 + 3;
  uint64_t v69 = (char *)v82 + 2;
  uint64_t v71 = a2;
  swift_bridgeObjectRetain();
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  uint64_t v79 = a3;
  while (1)
  {
    uint64_t v23 = v15 + 88 * v18;
    long long v24 = *(_OWORD *)(v23 + 48);
    v84[2] = *(_OWORD *)(v23 + 32);
    v84[3] = v24;
    long long v85 = *(_OWORD *)(v23 + 64);
    unint64_t v86 = *(void *)(v23 + 80);
    long long v25 = *(_OWORD *)(v23 + 16);
    v84[0] = *(_OWORD *)v23;
    v84[1] = v25;
    uint64_t result = sub_22C97C9A4((uint64_t)v84);
    if (*((void *)a3 + 2) <= v18) {
      break;
    }
    if (v16[v18] != 1) {
      goto LABEL_9;
    }
    os_log_type_t v27 = v7;
    uint64_t v28 = *((void *)&v85 + 1);
    uint64_t v29 = v86;
    uint64_t v30 = HIBYTE(v86) & 0xF;
    uint64_t v31 = *((void *)&v85 + 1) & 0xFFFFFFFFFFFFLL;
    if ((v86 & 0x2000000000000000) != 0) {
      uint64_t v32 = HIBYTE(v86) & 0xF;
    }
    else {
      uint64_t v32 = *((void *)&v85 + 1) & 0xFFFFFFFFFFFFLL;
    }
    if (!v32)
    {
      uint64_t v7 = v27;
      goto LABEL_9;
    }
    if ((v86 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = (uint64_t)sub_22C97884C(v28, v29, 10);
      char v20 = v47;
      uint64_t result = swift_bridgeObjectRelease();
LABEL_21:
      uint64_t v7 = v27;
      goto LABEL_5;
    }
    if ((v86 & 0x2000000000000000) == 0)
    {
      if ((*((void *)&v85 + 1) & 0x1000000000000000) != 0) {
        uint64_t v33 = (unsigned __int8 *)((v86 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v33 = (unsigned __int8 *)sub_22C9A3E78();
      }
      uint64_t result = (uint64_t)sub_22C978934(v33, v31, 10);
      uint64_t v19 = result;
      char v20 = v34 & 1;
      goto LABEL_21;
    }
    v82[0] = *((void *)&v85 + 1);
    v82[1] = v86 & 0xFFFFFFFFFFFFFFLL;
    if (BYTE8(v85) != 43)
    {
      uint64_t v7 = v27;
      if (BYTE8(v85) == 45)
      {
        if (!v30) {
          goto LABEL_72;
        }
        if (v30 == 1 || (BYTE9(v85) - 48) > 9u) {
          goto LABEL_4;
        }
        if (v30 == 2)
        {
          char v20 = 0;
          uint64_t v19 = -(uint64_t)(BYTE9(v85) - 48);
          goto LABEL_5;
        }
        if ((BYTE10(v85) - 48) > 9u) {
          goto LABEL_4;
        }
        uint64_t v19 = -10 * (BYTE9(v85) - 48) - (BYTE10(v85) - 48);
        uint64_t v43 = v30 - 3;
        if (v43)
        {
          unint64_t v44 = (unsigned __int8 *)v70;
          while (1)
          {
            unsigned int v45 = *v44 - 48;
            if (v45 > 9) {
              break;
            }
            uint64_t v46 = 10 * v19;
            if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
              break;
            }
            uint64_t v19 = v46 - v45;
            if (__OFSUB__(v46, v45)) {
              break;
            }
            char v20 = 0;
            ++v44;
            if (!--v43) {
              goto LABEL_5;
            }
          }
LABEL_4:
          uint64_t v19 = 0;
          char v20 = 1;
          goto LABEL_5;
        }
      }
      else
      {
        if (!v30 || (BYTE8(v85) - 48) > 9u) {
          goto LABEL_4;
        }
        uint64_t v19 = (BYTE8(v85) - 48);
        if (v30 != 1)
        {
          if ((BYTE9(v85) - 48) > 9u) {
            goto LABEL_4;
          }
          uint64_t v19 = 10 * (BYTE8(v85) - 48) + (BYTE9(v85) - 48);
          uint64_t v39 = v30 - 2;
          if (v39)
          {
            uint64_t v40 = (unsigned __int8 *)v69;
            while (1)
            {
              unsigned int v41 = *v40 - 48;
              if (v41 > 9) {
                goto LABEL_4;
              }
              uint64_t v42 = 10 * v19;
              if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
                goto LABEL_4;
              }
              uint64_t v19 = v42 + v41;
              if (__OFADD__(v42, v41)) {
                goto LABEL_4;
              }
              char v20 = 0;
              ++v40;
              if (!--v39) {
                goto LABEL_5;
              }
            }
          }
        }
      }
      goto LABEL_44;
    }
    if (!v30) {
      goto LABEL_73;
    }
    uint64_t v7 = v27;
    if (v30 != 1)
    {
      if ((BYTE9(v85) - 48) > 9u) {
        goto LABEL_4;
      }
      uint64_t v19 = (BYTE9(v85) - 48);
      if (v30 != 2)
      {
        if ((BYTE10(v85) - 48) > 9u) {
          goto LABEL_4;
        }
        uint64_t v19 = 10 * (BYTE9(v85) - 48) + (BYTE10(v85) - 48);
        uint64_t v35 = v30 - 3;
        if (v35)
        {
          uint64_t v36 = (unsigned __int8 *)v70;
          while (1)
          {
            unsigned int v37 = *v36 - 48;
            if (v37 > 9) {
              goto LABEL_4;
            }
            uint64_t v38 = 10 * v19;
            if ((unsigned __int128)(v19 * (__int128)10) >> 64 != (10 * v19) >> 63) {
              goto LABEL_4;
            }
            uint64_t v19 = v38 + v37;
            if (__OFADD__(v38, v37)) {
              goto LABEL_4;
            }
            char v20 = 0;
            ++v36;
            if (!--v35) {
              goto LABEL_5;
            }
          }
        }
      }
LABEL_44:
      char v20 = 0;
      goto LABEL_5;
    }
    uint64_t v19 = 0;
    char v20 = 1;
LABEL_5:
    if (v20) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v19;
    }
    a3 = v79;
    uint64_t v5 = v80;
    BOOL v22 = __OFADD__(v17, v21);
    v17 += v21;
    if (v22) {
      goto LABEL_71;
    }
LABEL_9:
    ++v18;
    sub_22C97CA0C((uint64_t)v84);
    if (v18 == v14)
    {
      swift_bridgeObjectRelease();
      goto LABEL_66;
    }
  }
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
  return result;
}

uint64_t sub_22C9753BC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for ToggleRecommendedBackupAction(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22C97A724(v4, (uint64_t)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  sub_22C97A78C((uint64_t)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  *(void *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  a3[3] = sub_22C9A2178();
  v15[0] = v11;
  v15[1] = MEMORY[0x263F1A240];
  a3[4] = swift_getWitnessTable();
  __swift_allocate_boxed_opaque_existential_1(a3);
  swift_retain();
  sub_22C9A2B18();
  return swift_release();
}

uint64_t sub_22C975578(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = sub_22C9A1AA8();
  uint64_t v74 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  long long v73 = (char *)v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_22C9A1C08();
  uint64_t v70 = *(void *)(v77 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v77);
  uint64_t v69 = (char *)v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v63 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v12 = (char *)v63 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)v63 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v63 - v16;
  uint64_t v18 = type metadata accessor for ToggleRecommendedBackupAction(0);
  uint64_t v19 = a1;
  uint64_t v20 = a1 + *(int *)(v18 + 20);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  sub_22C9A1BB8();
  uint64_t v68 = a2;
  uint64_t v66 = v20;
  uint64_t v65 = v19;
  v63[2] = v21;
  uint64_t v76 = (void (*)(char *, unint64_t, uint64_t))v18;
  uint64_t v67 = v15;
  unint64_t v64 = v9;
  uint64_t v22 = sub_22C94AEAC();
  uint64_t v23 = v70;
  long long v24 = *(void (**)(char *, uint64_t))(v70 + 8);
  long long v25 = v17;
  uint64_t v26 = v70 + 8;
  v24(v25, v77);
  uint64_t v27 = *(void *)(v22 + 16);
  uint64_t v71 = v26;
  if (v27)
  {
    uint64_t v75 = v24;
    uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v23 + 16);
    uint64_t v28 = v23 + 16;
    uint64_t v29 = v30;
    unint64_t v31 = v22 + ((*(unsigned __int8 *)(v28 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 64));
    uint64_t v32 = *(void *)(v28 + 56);
    v63[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t v33 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v34 = v77;
      v29(v12, v31, v77);
      sub_22C979424((uint64_t)v12, v78);
      v75(v12, v34);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v33 = sub_22C8E0984(0, v33[2] + 1, 1, v33);
      }
      unint64_t v36 = v33[2];
      unint64_t v35 = v33[3];
      unsigned int v37 = v33;
      if (v36 >= v35 >> 1) {
        unsigned int v37 = sub_22C8E0984((void *)(v35 > 1), v36 + 1, 1, v33);
      }
      v37[2] = v36 + 1;
      uint64_t v33 = v37;
      uint64_t v38 = &v37[11 * v36];
      long long v39 = v78[1];
      *((_OWORD *)v38 + 2) = v78[0];
      *((_OWORD *)v38 + 3) = v39;
      long long v40 = v78[2];
      long long v41 = v78[3];
      long long v42 = v78[4];
      v38[14] = v79;
      *((_OWORD *)v38 + 5) = v41;
      *((_OWORD *)v38 + 6) = v42;
      *((_OWORD *)v38 + 4) = v40;
      v31 += v32;
      --v27;
    }
    while (v27);
    uint64_t v43 = swift_bridgeObjectRelease_n();
    uint64_t v44 = (uint64_t)v33;
    long long v24 = v75;
  }
  else
  {
    uint64_t v43 = swift_bridgeObjectRelease();
    uint64_t v44 = MEMORY[0x263F8EE78];
  }
  MEMORY[0x270FA5388](v43);
  v63[-2] = v44;
  uint64_t v45 = swift_bridgeObjectRetain();
  sub_22C97C404(v45, (void (*)(_OWORD *__return_ptr, uint64_t, _OWORD *))sub_22C97C8BC);
  swift_bridgeObjectRelease();
  sub_22C97C950();
  uint64_t v46 = v67;
  sub_22C9A38B8();
  swift_bridgeObjectRelease();
  sub_22C9A1D08();
  uint64_t v66 = v44;
  v24(v46, v77);
  char v47 = v64;
  sub_22C9A1BB8();
  uint64_t v48 = sub_22C94AEAC();
  v24(v47, v77);
  uint64_t v49 = *(void *)(v48 + 16);
  if (v49)
  {
    uint64_t v75 = v24;
    uint64_t v50 = v70 + 16;
    uint64_t v76 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 16);
    unint64_t v51 = v48 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
    uint64_t v52 = *(void *)(v70 + 72);
    uint64_t v70 = v48;
    swift_bridgeObjectRetain();
    uint64_t v53 = (char *)MEMORY[0x263F8EE78];
    uint64_t v54 = v69;
    uint64_t v55 = v77;
    do
    {
      uint64_t v56 = v50;
      v76(v54, v51, v55);
      char v57 = sub_22C94AC50();
      v75(v54, v55);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v53 = sub_22C8E0888(0, *((void *)v53 + 2) + 1, 1, v53);
      }
      unint64_t v59 = *((void *)v53 + 2);
      unint64_t v58 = *((void *)v53 + 3);
      if (v59 >= v58 >> 1) {
        uint64_t v53 = sub_22C8E0888((char *)(v58 > 1), v59 + 1, 1, v53);
      }
      *((void *)v53 + 2) = v59 + 1;
      v53[v59 + 32] = v57 & 1;
      uint64_t v54 = v69;
      v51 += v52;
      --v49;
      uint64_t v50 = v56;
    }
    while (v49);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v53 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v60 = v68;
  uint64_t v61 = v66;
  sub_22C974298(v68, v66, (uint64_t)v53);
  sub_22C974B04(v60, v61, (void (*)(uint64_t *, uint64_t, uint64_t))v53);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_22C975E90(char a1)
{
  unint64_t result = 0xD000000000000022;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x73656369766564;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
    case 7:
      unint64_t result = 0xD000000000000027;
      break;
    case 5:
      unint64_t result = 0xD000000000000024;
      break;
    case 6:
      unint64_t result = 0xD000000000000029;
      break;
    case 8:
      unint64_t result = 0xD000000000000028;
      break;
    case 9:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 11:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      unint64_t result = 0x656369766564;
      break;
  }
  return result;
}

unint64_t sub_22C975FD0(char a1)
{
  unint64_t result = 0xD000000000000022;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x73656369766564;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
    case 7:
      unint64_t result = 0xD000000000000027;
      break;
    case 5:
      unint64_t result = 0xD000000000000024;
      break;
    case 6:
      unint64_t result = 0xD000000000000029;
      break;
    case 8:
      unint64_t result = 0xD000000000000028;
      break;
    case 9:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 11:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      unint64_t result = 0x656369766564;
      break;
  }
  return result;
}

uint64_t sub_22C976110(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_22C975E90(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_22C975E90(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_22C9A40C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22C97619C()
{
  char v1 = *v0;
  sub_22C9A4188();
  sub_22C975E90(v1);
  sub_22C9A3768();
  swift_bridgeObjectRelease();
  return sub_22C9A41B8();
}

uint64_t sub_22C976200()
{
  sub_22C975E90(*v0);
  sub_22C9A3768();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C976254()
{
  char v1 = *v0;
  sub_22C9A4188();
  sub_22C975E90(v1);
  sub_22C9A3768();
  swift_bridgeObjectRelease();
  return sub_22C9A41B8();
}

uint64_t sub_22C9762B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22C97C56C();
  *a1 = result;
  return result;
}

unint64_t sub_22C9762E4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_22C975E90(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_22C976310()
{
  return sub_22C975FD0(*v0);
}

uint64_t sub_22C976318@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22C97C56C();
  *a1 = result;
  return result;
}

void sub_22C976340(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_22C97634C(uint64_t a1)
{
  unint64_t v2 = sub_22C97A808();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22C976388(uint64_t a1)
{
  unint64_t v2 = sub_22C97A808();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22C9763C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v83 = a2;
  uint64_t v3 = sub_22C9A1D58();
  uint64_t v97 = *(void *)(v3 - 8);
  uint64_t v98 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v86 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  long long v87 = (char *)&v77 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  long long v88 = (char *)&v77 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v89 = (char *)&v77 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v90 = (char *)&v77 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v99 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v84 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  long long v85 = (char *)&v77 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v77 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v77 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v77 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v77 - v28;
  MEMORY[0x270FA5388](v27);
  char v94 = (char *)&v77 - v30;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D39D0);
  uint64_t v91 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v32 = (char *)&v77 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = (int *)type metadata accessor for ToggleRecommendedBackupAction(0);
  MEMORY[0x270FA5388](v100);
  uint64_t v101 = (char *)&v77 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1[3];
  uint64_t v95 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, v34);
  sub_22C97A808();
  uint64_t v92 = v32;
  unint64_t v35 = v96;
  sub_22C9A41C8();
  uint64_t v102 = v13;
  if (v35)
  {
    uint64_t v96 = v35;
    LODWORD(v91) = 0;
    uint64_t v38 = v101;
    long long v39 = v100;
    uint64_t result = __swift_destroy_boxed_opaque_existential_0(v95);
    LODWORD(v95) = 0;
    LODWORD(v93) = 0;
    LODWORD(v94) = 0;
    LODWORD(v92) = 0;
    uint64_t v48 = v98;
    int v49 = 0;
    uint64_t v50 = v97;
    goto LABEL_13;
  }
  uint64_t v96 = v29;
  unint64_t v82 = v26;
  uint64_t v81 = v23;
  uint64_t v80 = v20;
  char v114 = 0;
  uint64_t v36 = sub_22C8C6FAC(&qword_2684D3030, &qword_2684D3028);
  unsigned int v37 = v94;
  sub_22C9A4058();
  uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v99 + 32);
  uint64_t v46 = v101;
  v45(v101, v37, v102);
  char v113 = 1;
  char v47 = v96;
  sub_22C9A4058();
  v45(&v46[v100[5]], v47, v102);
  char v112 = 2;
  uint64_t v52 = v82;
  sub_22C9A4058();
  uint64_t v79 = v36;
  v45(&v46[v100[8]], v52, v102);
  char v111 = 4;
  sub_22C97A934(&qword_2684D1518, MEMORY[0x263F514D8]);
  uint64_t v53 = v90;
  sub_22C9A4058();
  uint64_t v78 = v45;
  unint64_t v82 = 0;
  uint64_t v54 = v53;
  uint64_t v55 = *(void (**)(char *, char *, uint64_t))(v97 + 32);
  uint64_t v56 = (char *)(v97 + 32);
  v55(&v46[v100[10]], v54, v98);
  char v110 = 5;
  char v57 = v89;
  sub_22C9A4058();
  unint64_t v58 = (char *)v55;
  unint64_t v59 = v100;
  uint64_t v60 = &v46[v100[11]];
  uint64_t v90 = v58;
  ((void (*)(char *, char *, uint64_t))v58)(v60, v57, v98);
  char v109 = 6;
  uint64_t v61 = v88;
  sub_22C9A4058();
  uint64_t v62 = v59;
  ((void (*)(char *, char *, uint64_t))v90)(&v101[v59[12]], v61, v98);
  char v108 = 7;
  uint64_t v63 = v81;
  uint64_t v64 = v102;
  sub_22C9A4058();
  uint64_t v65 = v91;
  uint64_t v89 = v56;
  v78(&v101[v59[7]], v63, v64);
  char v107 = 8;
  uint64_t v66 = v87;
  sub_22C9A4058();
  uint64_t v96 = 0;
  uint64_t v67 = (void (*)(char *, char *, uint64_t))v90;
  ((void (*)(char *, char *, uint64_t))v90)(&v101[v62[13]], v66, v98);
  char v106 = 9;
  uint64_t v68 = v86;
  uint64_t v69 = v96;
  sub_22C9A4058();
  uint64_t v96 = v69;
  LODWORD(v94) = v69 == 0;
  if (v69)
  {
    (*(void (**)(char *, uint64_t))(v65 + 8))(v92, v93);
LABEL_34:
    char v71 = 0;
    char v72 = 0;
    goto LABEL_35;
  }
  v67(&v101[v62[14]], v68, v98);
  char v105 = 3;
  uint64_t v70 = v96;
  sub_22C9A4058();
  uint64_t v96 = v70;
  if (v70)
  {
    (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v93);
    goto LABEL_34;
  }
  v78(&v101[v100[9]], v80, v102);
  char v104 = 10;
  uint64_t v74 = v96;
  sub_22C9A4058();
  uint64_t v96 = v74;
  if (v74)
  {
    (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v93);
    char v71 = 0;
  }
  else
  {
    v78(&v101[v100[6]], v85, v102);
    char v103 = 11;
    uint64_t v75 = v96;
    sub_22C9A4058();
    uint64_t v96 = v75;
    if (!v75)
    {
      (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v93);
      uint64_t v76 = (uint64_t)v101;
      v78(&v101[v100[15]], v84, v102);
      sub_22C97A724(v76, v83);
      __swift_destroy_boxed_opaque_existential_0(v95);
      return sub_22C97AAB8(v76, type metadata accessor for ToggleRecommendedBackupAction);
    }
    (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v93);
    char v71 = 1;
  }
  char v72 = 1;
LABEL_35:
  uint64_t v73 = v99;
  __swift_destroy_boxed_opaque_existential_0(v95);
  LODWORD(v93) = 1;
  LODWORD(v95) = 1;
  LODWORD(v91) = 1;
  LODWORD(v92) = 1;
  long long v41 = *(void (**)(char *, uint64_t))(v73 + 8);
  long long v42 = v101;
  uint64_t v43 = v102;
  v41(v101, v102);
  v41(&v42[v100[5]], v43);
  if (v71)
  {
    long long v39 = v100;
    uint64_t v38 = v101;
    v41(&v101[v100[6]], v102);
  }
  else
  {
    long long v39 = v100;
    uint64_t v38 = v101;
  }
  uint64_t v44 = v102;
  v41(&v38[v39[7]], v102);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v41)(&v38[v39[8]], v44);
  uint64_t v48 = v98;
  if ((v72 & 1) == 0)
  {
    uint64_t v50 = v97;
    int v49 = (int)v94;
LABEL_13:
    if (v93) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  uint64_t v50 = v97;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v41)(&v38[v39[9]], v44);
  int v49 = (int)v94;
  if (v93)
  {
LABEL_14:
    unint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
    uint64_t result = v51(&v38[v39[10]], v48);
    if (v95)
    {
      uint64_t result = v51(&v38[v39[11]], v48);
LABEL_16:
      if (v91)
      {
        uint64_t result = v51(&v38[v39[12]], v48);
        if ((v92 & 1) == 0) {
          goto LABEL_26;
        }
LABEL_21:
        uint64_t result = v51(&v38[v39[13]], v48);
        if ((v49 & 1) == 0) {
          return result;
        }
        return v51(&v38[v39[14]], v48);
      }
LABEL_23:
      if (v92)
      {
        unint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
        uint64_t result = v51(&v38[v39[13]], v48);
        if ((v49 & 1) == 0) {
          return result;
        }
        return v51(&v38[v39[14]], v48);
      }
      goto LABEL_26;
    }
    goto LABEL_19;
  }
LABEL_11:
  if (v95)
  {
    unint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
    uint64_t result = v51(&v38[v39[11]], v48);
    goto LABEL_16;
  }
LABEL_19:
  if (!v91) {
    goto LABEL_23;
  }
  unint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
  uint64_t result = v51(&v38[v39[12]], v48);
  if (v92) {
    goto LABEL_21;
  }
LABEL_26:
  if (!v49) {
    return result;
  }
  unint64_t v51 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
  return v51(&v38[v39[14]], v48);
}

uint64_t sub_22C977248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_22C8D5C6C;
  return MEMORY[0x270F47038](a1, a2, a3);
}

uint64_t sub_22C9772F8(uint64_t a1)
{
  sub_22C97909C(a1);
  unint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return sub_22C97C8B0(v2);
}

uint64_t sub_22C977390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = (void *)MEMORY[0x270FA5388](a1);
  uint64_t v11 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_22C97A724(v5, (uint64_t)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  sub_22C97A78C((uint64_t)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  *(void *)(v13 + ((v9 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  a4[3] = sub_22C9A2178();
  v15[0] = v11;
  v15[1] = MEMORY[0x263F1A240];
  a4[4] = swift_getWitnessTable();
  __swift_allocate_boxed_opaque_existential_1(a4);
  swift_retain();
  sub_22C9A2B18();
  return swift_release();
}

uint64_t sub_22C97753C()
{
  return sub_22C9A1B58();
}

uint64_t sub_22C9775CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22C9763C4(a1, a2);
}

uint64_t sub_22C9775E4()
{
  return *(void *)v0;
}

uint64_t sub_22C9775EC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22C9775F4(uint64_t result)
{
  *(unsigned char *)(v1 + 48) = result;
  return result;
}

uint64_t sub_22C9775FC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C97762C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C97765C@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2118);
  unint64_t v2 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684D2120) - 8);
  uint64_t v3 = *(void *)(*(void *)v2 + 72);
  unint64_t v4 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_22C9B1650;
  uint64_t v5 = (void *)(v34 + v4);
  uint64_t v6 = (uint64_t *)(v34 + v4 + v2[14]);
  *uint64_t v5 = 7890025;
  v5[1] = 0xE300000000000000;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = *(void *)v1;
  uint64_t *v6 = v7;
  uint64_t v8 = *MEMORY[0x263F513E8];
  uint64_t v9 = sub_22C9A1C08();
  uint64_t v10 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  v10(v6, v8, v9);
  uint64_t v11 = v10;
  unint64_t v12 = (void *)((char *)v5 + v3);
  uint64_t v13 = (void *)((char *)v5 + v3 + v2[14]);
  *unint64_t v12 = 1701667182;
  v12[1] = 0xE400000000000000;
  uint64_t v14 = swift_allocObject();
  long long v40 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(v14 + 16) = v40;
  *uint64_t v13 = v14;
  uint64_t v15 = *MEMORY[0x263F51430];
  unsigned int v33 = *MEMORY[0x263F51430];
  v11(v13, v15, v9);
  uint64_t v16 = (void *)((char *)v5 + 2 * v3);
  uint64_t v17 = (void *)((char *)v16 + v2[14]);
  *uint64_t v16 = 0x6E6F6974706163;
  v16[1] = 0xE700000000000000;
  uint64_t v18 = swift_allocObject();
  long long v39 = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(v18 + 16) = v39;
  *uint64_t v17 = v18;
  v11(v17, v15, v9);
  uint64_t v19 = (void *)((char *)v5 + 3 * v3);
  uint64_t v20 = (void *)((char *)v19 + v2[14]);
  *uint64_t v19 = 0x6567616D69;
  v19[1] = 0xE500000000000000;
  uint64_t v21 = swift_allocObject();
  uint64_t v38 = *(void *)(v1 + 40);
  *(void *)(v21 + 16) = v38;
  *uint64_t v20 = v21;
  ((void (*)(uint64_t *))v11)(v20);
  uint64_t v22 = (void *)((char *)v5 + 4 * v3);
  uint64_t v23 = (void *)((char *)v22 + v2[14]);
  *uint64_t v22 = 0x6469766944736168;
  v22[1] = 0xEA00000000007265;
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = *(unsigned char *)(v1 + 48);
  uint64_t *v23 = v24;
  v11(v23, *MEMORY[0x263F513F8], v9);
  uint64_t v32 = swift_allocObject();
  uint64_t v25 = (void *)((char *)v5 + 5 * v3);
  uint64_t v26 = (void *)((char *)v25 + v2[14]);
  void *v25 = 0x52556574656C6564;
  v25[1] = 0xE90000000000004CLL;
  uint64_t v27 = swift_allocObject();
  long long v37 = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(v27 + 16) = v37;
  uint64_t *v26 = v27;
  v11(v26, v33, v9);
  uint64_t v28 = (void *)((char *)v5 + 6 * v3);
  uint64_t v29 = (void *)((char *)v28 + v2[14]);
  void *v28 = 0xD000000000000010;
  v28[1] = 0x800000022C9C1790;
  uint64_t v30 = swift_allocObject();
  long long v36 = *(_OWORD *)(v1 + 72);
  *(_OWORD *)(v30 + 16) = v36;
  *uint64_t v29 = v30;
  v11(v29, v33, v9);
  sub_22C8DBFC0((uint64_t)&v40);
  sub_22C8DBFC0((uint64_t)&v39);
  sub_22C8E5550((uint64_t)&v38);
  sub_22C8DBFC0((uint64_t)&v37);
  sub_22C8DBFC0((uint64_t)&v36);
  *(void *)(v32 + 16) = sub_22C8F4C70(v34);
  *a1 = v32;
  return ((uint64_t (*)(void))v11)();
}

__n128 sub_22C977AAC@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unsigned __int8 a7@<W6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11)
{
  __n128 result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u8[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  return result;
}

uint64_t sub_22C977AD8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22C9A37E8();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x230F6F4E0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_22C977B54(uint64_t a1)
{
  return sub_22C8E0888(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22C977B68(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22C977BA8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_22C977B88(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22C977DE8(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_22C977BA8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A20);
  uint64_t v10 = *(void *)(sub_22C9A1C08() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_22C9A1C08() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_22C9A3FB8();
  __break(1u);
  return result;
}

uint64_t sub_22C977DE8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 88);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[88 * v8]) {
      memmove(v12, v13, 88 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[88 * v8] || v12 >= &v13[88 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_22C9A3FB8();
  __break(1u);
  return result;
}

uint64_t sub_22C977F70(uint64_t a1, int a2)
{
  char v3 = v2;
  uint64_t v49 = sub_22C9A1C08();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2178);
  int v47 = a2;
  uint64_t v8 = sub_22C9A3F98();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  long long v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  size_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          char v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_22C9A4188();
    sub_22C9A3768();
    uint64_t result = sub_22C9A41B8();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  char v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v9;
  return result;
}

uint64_t sub_22C978358(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_22C8F3BF8(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_22C978588();
      goto LABEL_7;
    }
    sub_22C977F70(v15, a4 & 1);
    unint64_t v26 = sub_22C8F3BF8(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_22C9A4128();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_22C9A1C08();
    uint64_t v21 = *(void *)(v20 - 8);
    int64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_22C9784D8(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_22C9784D8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_22C9A1C08();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_22C978588()
{
  uint64_t v35 = sub_22C9A1C08();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  char v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2178);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_22C9A3F88();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

unsigned __int8 *sub_22C97884C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22C9A37F8();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22C978BB0();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_22C9A3E78();
  }
LABEL_7:
  uint64_t v11 = sub_22C978934(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_22C978934(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22C978BB0()
{
  unint64_t v0 = sub_22C9A3808();
  uint64_t v4 = sub_22C978C30(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22C978C30(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_22C978D88(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22C8BA71C(v9, 0);
      unint64_t v12 = sub_22C978E88((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22C9A3E78();
LABEL_4:
        JUMPOUT(0x230F6F480);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x230F6F480](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x230F6F480]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_22C978D88(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_22C977AD8(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_22C977AD8(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_22C978E88(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    _OWORD v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_22C977AD8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_22C9A37D8();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_22C9A3E78();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_22C977AD8(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22C9A37A8();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22C97909C(uint64_t a1)
{
  uint64_t v16 = a1;
  uint64_t v2 = sub_22C9A3008();
  uint64_t v19 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22C9A3028();
  uint64_t v17 = *(void *)(v5 - 8);
  uint64_t v18 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ToggleRecommendedBackupAction(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  sub_22C8C1150();
  uint64_t v11 = (void *)sub_22C9A3AD8();
  sub_22C97A724(v1, (uint64_t)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  sub_22C97A78C((uint64_t)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  *(void *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v16;
  aBlock[4] = sub_22C97CBC4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C8B9024;
  aBlock[3] = &block_descriptor_12;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_22C9A3018();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22C97A934((unint64_t *)&qword_2684D1450, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2B30);
  sub_22C8C6FAC((unint64_t *)&qword_2684D1458, (uint64_t *)&unk_2684D2B30);
  sub_22C9A3CD8();
  MEMORY[0x230F6F810](0, v7, v4, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v7, v18);
}

uint64_t sub_22C979424@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v158 = a2;
  uint64_t v3 = sub_22C9A1AA8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)&v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  v173 = (char *)&v154 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v170 = (char *)&v154 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v169 = (char *)&v154 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v167 = (char *)&v154 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v165 = (char *)&v154 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v163 = (char *)&v154 - v19;
  MEMORY[0x270FA5388](v18);
  v160 = (char *)&v154 - v20;
  uint64_t v21 = sub_22C9A1C08();
  uint64_t v22 = *(char **)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v159 = (char *)&v154 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v161 = (char *)&v154 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v164 = (char *)&v154 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v166 = (char *)&v154 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v168 = (char *)&v154 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v154 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  BOOL v38 = (char *)&v154 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v40 = (uint64_t *)((char *)&v154 - v39);
  uint64_t v41 = (void (*)(char *, unint64_t, uint64_t))*((void *)v22 + 2);
  uint64_t v174 = a1;
  v175 = v22 + 16;
  v176 = v41;
  v41((char *)&v154 - v39, a1, v21);
  v171 = (uint64_t (*)(uint64_t *, uint64_t))*((void *)v22 + 11);
  v172 = v22 + 88;
  int v42 = v171(v40, v21);
  if (v42 == *MEMORY[0x263F51400])
  {
    int v43 = v42;
    uint64_t v174 = v3;
    uint64_t v162 = v4;
    uint64_t v44 = (void (*)(char *, uint64_t))*((void *)v22 + 12);
    v157 = v22 + 96;
    uint64_t v45 = v44;
    v44((char *)v40, v21);
    uint64_t v46 = *v40;
    uint64_t v47 = *(void *)(v46 + 16);
    if (*(void *)(v47 + 16))
    {
      uint64_t v48 = (void (**)(char *, char *))v22;
      unint64_t v49 = sub_22C8F3BF8(7890025, 0xE300000000000000);
      if (v50)
      {
        uint64_t v156 = v46;
        uint64_t v51 = *((void *)v22 + 9);
        v176(v38, *(void *)(v47 + 56) + v51 * v49, v21);
        if (v171((uint64_t *)v38, v21) == *MEMORY[0x263F513E8])
        {
          v45(v38, v21);
          uint64_t v52 = *(void *)(*(void *)v38 + 16);
          swift_release();
          if (*(void *)(v47 + 16))
          {
            unint64_t v53 = sub_22C8F3BF8(1701667182, 0xE400000000000000);
            if (v54)
            {
              LODWORD(v173) = v43;
              v176(v35, *(void *)(v47 + 56) + v53 * v51, v21);
              int v55 = v171((uint64_t *)v35, v21);
              if (v55 == *MEMORY[0x263F51430])
              {
                int v56 = v55;
                v45(v35, v21);
                uint64_t v57 = *(void *)(*(void *)v35 + 16);
                unint64_t v58 = *(char **)(*(void *)v35 + 24);
                uint64_t v155 = v57;
                swift_bridgeObjectRetain();
                swift_release();
                if (*(void *)(v47 + 16)
                  && (v170 = v58, unint64_t v59 = sub_22C8F3BF8(0x6E6F6974706163, 0xE700000000000000), (v60 & 1) != 0))
                {
                  uint64_t v61 = v168;
                  v176(v168, *(void *)(v47 + 56) + v59 * v51, v21);
                  if (v171((uint64_t *)v61, v21) == v56)
                  {
                    v45(v61, v21);
                    uint64_t v62 = *(char **)(*(void *)v61 + 16);
                    uint64_t v63 = *(char **)(*(void *)v61 + 24);
                    v169 = v62;
                    swift_bridgeObjectRetain();
                    swift_release();
                    if (*(void *)(v47 + 16)
                      && (unint64_t v64 = sub_22C8F3BF8(0x6567616D69, 0xE500000000000000), (v65 & 1) != 0))
                    {
                      v168 = v63;
                      uint64_t v66 = v166;
                      v176(v166, *(void *)(v47 + 56) + v64 * v51, v21);
                      int v67 = v171((uint64_t *)v66, v21);
                      if (v67 == v173)
                      {
                        v45(v66, v21);
                        uint64_t v68 = *(char **)(*(void *)v66 + 16);
                        swift_bridgeObjectRetain();
                        swift_release();
                        if (*(void *)(v47 + 16)
                          && (unint64_t v69 = sub_22C8F3BF8(0x6469766944736168, 0xEA00000000007265), (v70 & 1) != 0))
                        {
                          v173 = v68;
                          char v71 = v164;
                          v176(v164, *(void *)(v47 + 56) + v69 * v51, v21);
                          if (v171((uint64_t *)v71, v21) == *MEMORY[0x263F513F8])
                          {
                            v167 = (char *)v21;
                            v45(v71, v21);
                            LODWORD(v166) = *(unsigned __int8 *)(*(void *)v71 + 16);
                            swift_release();
                            if (*(void *)(v47 + 16)
                              && (unint64_t v72 = sub_22C8F3BF8(0x52556574656C6564, 0xE90000000000004CLL), (v73 & 1) != 0))
                            {
                              uint64_t v74 = v161;
                              uint64_t v75 = v167;
                              v176(v161, *(void *)(v47 + 56) + v72 * v51, (uint64_t)v167);
                              if (v171((uint64_t *)v74, (uint64_t)v75) == v56)
                              {
                                uint64_t v76 = v161;
                                v45(v161, (uint64_t)v167);
                                uint64_t v77 = *(void *)(*(void *)v76 + 24);
                                v165 = *(char **)(*(void *)v76 + 16);
                                swift_bridgeObjectRetain();
                                swift_release();
                                if (*(void *)(v47 + 16)
                                  && (unint64_t v78 = sub_22C8F3BF8(0xD000000000000010, 0x800000022C9C1790), (v79 & 1) != 0))
                                {
                                  unint64_t v80 = *(void *)(v47 + 56) + v78 * v51;
                                  uint64_t v81 = v159;
                                  unint64_t v82 = v167;
                                  v176(v159, v80, (uint64_t)v167);
                                  if (v171((uint64_t *)v81, (uint64_t)v82) == v56)
                                  {
                                    uint64_t v83 = v159;
                                    v45(v159, (uint64_t)v167);
                                    uint64_t v84 = *(void *)v83;
                                    uint64_t v86 = *(void *)(v84 + 16);
                                    uint64_t v85 = *(void *)(v84 + 24);
                                    swift_bridgeObjectRetain();
                                    swift_release();
                                    uint64_t result = swift_release();
                                    long long v88 = v158;
                                    uint64_t v89 = v155;
                                    void *v158 = v52;
                                    v88[1] = v89;
                                    uint64_t v90 = v169;
                                    v88[2] = v170;
                                    v88[3] = v90;
                                    uint64_t v91 = v173;
                                    v88[4] = v168;
                                    v88[5] = v91;
                                    *((unsigned char *)v88 + 48) = (_BYTE)v166;
                                    v88[7] = v165;
                                    v88[8] = v77;
                                    v88[9] = v86;
                                    v88[10] = v85;
                                    return result;
                                  }
                                  swift_bridgeObjectRelease();
                                  swift_bridgeObjectRelease();
                                  swift_bridgeObjectRelease();
                                  swift_bridgeObjectRelease();
                                  v48[1](v159, v167);
                                }
                                else
                                {
                                  swift_bridgeObjectRelease();
                                  swift_bridgeObjectRelease();
                                  swift_bridgeObjectRelease();
                                  swift_bridgeObjectRelease();
                                }
                                uint64_t v149 = sub_22C8F8FBC();
                                (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v160, v149, v174);
                                os_log_type_t v150 = sub_22C9A3A88();
                                v151 = sub_22C9A1A98();
                                os_log_type_t v152 = v150;
                                if (os_log_type_enabled(v151, v150))
                                {
                                  v153 = (uint8_t *)swift_slowAlloc();
                                  *(_WORD *)v153 = 0;
                                  _os_log_impl(&dword_22C821000, v151, v152, "Recommended Backup: failed to parse key 'storageRecovered'", v153, 2u);
                                  MEMORY[0x230F710E0](v153, -1, -1);
                                }

                                (*(void (**)(char *, uint64_t))(v162 + 8))(v160, v174);
                                goto LABEL_37;
                              }
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                              v48[1](v161, v167);
                            }
                            else
                            {
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                            }
                            uint64_t v144 = sub_22C8F8FBC();
                            (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v163, v144, v174);
                            os_log_type_t v145 = sub_22C9A3A88();
                            v146 = sub_22C9A1A98();
                            os_log_type_t v147 = v145;
                            if (os_log_type_enabled(v146, v145))
                            {
                              v148 = (uint8_t *)swift_slowAlloc();
                              *(_WORD *)v148 = 0;
                              _os_log_impl(&dword_22C821000, v146, v147, "Recommended Backup: failed to parse key 'deleteURL'", v148, 2u);
                              MEMORY[0x230F710E0](v148, -1, -1);
                            }

                            (*(void (**)(char *, uint64_t))(v162 + 8))(v163, v174);
LABEL_37:
                            type metadata accessor for RecommendedBackupError(0);
                            sub_22C97A934(&qword_2684D3A18, (void (*)(uint64_t))type metadata accessor for RecommendedBackupError);
                            swift_allocError();
                            *uint64_t v116 = MEMORY[0x263F8D310];
                            swift_storeEnumTagMultiPayload();
                            swift_willThrow();
                            return swift_release();
                          }
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          (*((void (**)(char *, uint64_t))v22 + 1))(v71, v21);
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                        }
                        uint64_t v136 = sub_22C8F8FBC();
                        uint64_t v137 = v162;
                        uint64_t v138 = v165;
                        uint64_t v139 = v174;
                        (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v165, v136, v174);
                        os_log_type_t v140 = sub_22C9A3A88();
                        v141 = sub_22C9A1A98();
                        os_log_type_t v142 = v140;
                        if (os_log_type_enabled(v141, v140))
                        {
                          v143 = (uint8_t *)swift_slowAlloc();
                          *(_WORD *)v143 = 0;
                          _os_log_impl(&dword_22C821000, v141, v142, "Recommended Backup: failed to parse key 'hasDivider'", v143, 2u);
                          MEMORY[0x230F710E0](v143, -1, -1);
                        }

                        (*(void (**)(char *, uint64_t))(v137 + 8))(v138, v139);
                        type metadata accessor for RecommendedBackupError(0);
                        sub_22C97A934(&qword_2684D3A18, (void (*)(uint64_t))type metadata accessor for RecommendedBackupError);
                        swift_allocError();
                        uint64_t v126 = MEMORY[0x263F8D4F8];
                        goto LABEL_42;
                      }
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      (*((void (**)(char *, uint64_t))v22 + 1))(v66, v21);
                    }
                    else
                    {
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                    }
                    uint64_t v127 = sub_22C8F8FBC();
                    uint64_t v128 = v162;
                    v129 = v167;
                    uint64_t v130 = v174;
                    (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v167, v127, v174);
                    os_log_type_t v131 = sub_22C9A3A88();
                    long long v132 = sub_22C9A1A98();
                    os_log_type_t v133 = v131;
                    if (os_log_type_enabled(v132, v131))
                    {
                      unsigned __int8 v134 = (uint8_t *)swift_slowAlloc();
                      *(_WORD *)unsigned __int8 v134 = 0;
                      _os_log_impl(&dword_22C821000, v132, v133, "Recommended Backup: failed to parse key 'image'", v134, 2u);
                      MEMORY[0x230F710E0](v134, -1, -1);
                    }

                    (*(void (**)(char *, uint64_t))(v128 + 8))(v129, v130);
                    type metadata accessor for RecommendedBackupError(0);
                    sub_22C97A934(&qword_2684D3A18, (void (*)(uint64_t))type metadata accessor for RecommendedBackupError);
                    swift_allocError();
                    *uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D88);
                    goto LABEL_43;
                  }
                  swift_bridgeObjectRelease();
                  (*((void (**)(char *, uint64_t))v22 + 1))(v61, v21);
                }
                else
                {
                  swift_bridgeObjectRelease();
                }
                uint64_t v117 = sub_22C8F8FBC();
                uint64_t v118 = v162;
                uint64_t v119 = v169;
                uint64_t v120 = v174;
                (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v169, v117, v174);
                os_log_type_t v121 = sub_22C9A3A88();
                uint64_t v122 = sub_22C9A1A98();
                os_log_type_t v123 = v121;
                if (os_log_type_enabled(v122, v121))
                {
                  uint64_t v124 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v124 = 0;
                  _os_log_impl(&dword_22C821000, v122, v123, "Recommended Backup: failed to parse key 'caption'", v124, 2u);
                  MEMORY[0x230F710E0](v124, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v118 + 8))(v119, v120);
                type metadata accessor for RecommendedBackupError(0);
                sub_22C97A934(&qword_2684D3A18, (void (*)(uint64_t))type metadata accessor for RecommendedBackupError);
                swift_allocError();
                uint64_t v126 = MEMORY[0x263F8D310];
LABEL_42:
                *uint64_t v125 = v126;
LABEL_43:
                swift_storeEnumTagMultiPayload();
                swift_willThrow();
                return swift_release();
              }
              (*((void (**)(char *, uint64_t))v22 + 1))(v35, v21);
            }
          }
          uint64_t v108 = sub_22C8F8FBC();
          uint64_t v109 = v162;
          char v110 = v170;
          uint64_t v111 = v174;
          (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v170, v108, v174);
          os_log_type_t v112 = sub_22C9A3A88();
          char v113 = sub_22C9A1A98();
          os_log_type_t v114 = v112;
          if (os_log_type_enabled(v113, v112))
          {
            uint64_t v115 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v115 = 0;
            _os_log_impl(&dword_22C821000, v113, v114, "Recommended Backup: failed to parse key 'name'", v115, 2u);
            MEMORY[0x230F710E0](v115, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
          goto LABEL_37;
        }
        (*((void (**)(char *, uint64_t))v22 + 1))(v38, v21);
      }
    }
    uint64_t v99 = sub_22C8F8FBC();
    uint64_t v100 = v162;
    uint64_t v101 = v173;
    uint64_t v102 = v174;
    (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))(v173, v99, v174);
    os_log_type_t v103 = sub_22C9A3A88();
    char v104 = sub_22C9A1A98();
    os_log_type_t v105 = v103;
    if (os_log_type_enabled(v104, v103))
    {
      char v106 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v106 = 0;
      _os_log_impl(&dword_22C821000, v104, v105, "Recommended Backup: failed to parse key 'idx'", v106, 2u);
      MEMORY[0x230F710E0](v106, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v100 + 8))(v101, v102);
    type metadata accessor for RecommendedBackupError(0);
    sub_22C97A934(&qword_2684D3A18, (void (*)(uint64_t))type metadata accessor for RecommendedBackupError);
    swift_allocError();
    *char v107 = MEMORY[0x263F8D6C8];
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return swift_release();
  }
  v173 = v22;
  uint64_t v92 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v92, v3);
  os_log_type_t v93 = sub_22C9A3A88();
  char v94 = sub_22C9A1A98();
  if (os_log_type_enabled(v94, v93))
  {
    uint64_t v95 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v95 = 0;
    _os_log_impl(&dword_22C821000, v94, v93, "Recommended Backup: DecodabelStateType is not a dictionary", v95, 2u);
    MEMORY[0x230F710E0](v95, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  type metadata accessor for RecommendedBackupError(0);
  sub_22C97A934(&qword_2684D3A18, (void (*)(uint64_t))type metadata accessor for RecommendedBackupError);
  swift_allocError();
  uint64_t v97 = v96;
  uint64_t v98 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684D2138) + 48);
  v176(v97, v174, v21);
  *(void *)&v97[v98] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1D88);
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  return (*((uint64_t (**)(uint64_t *, uint64_t))v173 + 1))(v40, v21);
}

uint64_t sub_22C97A724(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ToggleRecommendedBackupAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C97A78C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ToggleRecommendedBackupAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C97A7F0()
{
  return sub_22C97C810((uint64_t (*)(unint64_t, uint64_t))sub_22C975578);
}

unint64_t sub_22C97A808()
{
  unint64_t result = qword_2684DF300[0];
  if (!qword_2684DF300[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DF300);
  }
  return result;
}

uint64_t sub_22C97A85C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C97A86C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22C97A8A4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C97A8DC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22C97A8EC()
{
  return sub_22C97A934(qword_2684D39D8, (void (*)(uint64_t))type metadata accessor for ToggleRecommendedBackupAction);
}

uint64_t sub_22C97A934(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C97A97C()
{
  return sub_22C97A934(&qword_2684D39F8, (void (*)(uint64_t))type metadata accessor for ToggleRecommendedBackupAction);
}

char *sub_22C97A9C4(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22C97AAB8((uint64_t)a1, type metadata accessor for RecommendedBackupError);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22C9A1C08();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2138);
      *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22C97AAB8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for RecommendedBackupError(uint64_t a1)
{
  return sub_22C8EF20C(a1, (uint64_t *)&unk_2684DF590);
}

char *sub_22C97AB38(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22C97AAB8((uint64_t)a1, type metadata accessor for RecommendedBackupError);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_22C9A1C08();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2138);
      *(void *)&a1[*(int *)(v7 + 48)] = *(void *)&a2[*(int *)(v7 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22C97AC2C()
{
  v2[4] = "\b";
  uint64_t result = sub_22C9A1C08();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_22C97ACD4(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8(&a1[a3[5]], &a2[a3[5]], v7);
    v8(&a1[a3[6]], &a2[a3[6]], v7);
    v8(&a1[a3[7]], &a2[a3[7]], v7);
    v8(&a1[a3[8]], &a2[a3[8]], v7);
    v8(&a1[a3[9]], &a2[a3[9]], v7);
    uint64_t v9 = a3[10];
    uint64_t v15 = &a1[v9];
    uint64_t v10 = &a2[v9];
    uint64_t v11 = sub_22C9A1D58();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v15, v10, v11);
    v12(&a1[a3[11]], &a2[a3[11]], v11);
    v12(&a1[a3[12]], &a2[a3[12]], v11);
    v12(&a1[a3[13]], &a2[a3[13]], v11);
    v12(&a1[a3[14]], &a2[a3[14]], v11);
    v8(&a1[a3[15]], &a2[a3[15]], v7);
  }
  return a1;
}

uint64_t sub_22C97AF24(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v10)((void *)(v4 - 8), a1, v4);
  v10(a1 + a2[5], v4);
  v10(a1 + a2[6], v4);
  v10(a1 + a2[7], v4);
  v10(a1 + a2[8], v4);
  v10(a1 + a2[9], v4);
  uint64_t v5 = a1 + a2[10];
  uint64_t v6 = sub_22C9A1D58();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[11], v6);
  v7(a1 + a2[12], v6);
  v7(a1 + a2[13], v6);
  v7(a1 + a2[14], v6);
  uint64_t v8 = a1 + a2[15];
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v4);
}

uint64_t sub_22C97B108(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  uint64_t v8 = a3[10];
  uint64_t v13 = a1 + v8;
  uint64_t v9 = a2 + v8;
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v13, v9, v10);
  v11(a1 + a3[11], a2 + a3[11], v10);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v11(a1 + a3[14], a2 + a3[14], v10);
  v7(a1 + a3[15], a2 + a3[15], v6);
  return a1;
}

uint64_t sub_22C97B308(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  uint64_t v8 = a3[10];
  uint64_t v13 = a1 + v8;
  uint64_t v9 = a2 + v8;
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v13, v9, v10);
  v11(a1 + a3[11], a2 + a3[11], v10);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v11(a1 + a3[14], a2 + a3[14], v10);
  v7(a1 + a3[15], a2 + a3[15], v6);
  return a1;
}

uint64_t sub_22C97B508(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  uint64_t v8 = a3[10];
  uint64_t v13 = a1 + v8;
  uint64_t v9 = a2 + v8;
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v13, v9, v10);
  v11(a1 + a3[11], a2 + a3[11], v10);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v11(a1 + a3[14], a2 + a3[14], v10);
  v7(a1 + a3[15], a2 + a3[15], v6);
  return a1;
}

uint64_t sub_22C97B708(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v7(a1 + a3[9], a2 + a3[9], v6);
  uint64_t v8 = a3[10];
  uint64_t v13 = a1 + v8;
  uint64_t v9 = a2 + v8;
  uint64_t v10 = sub_22C9A1D58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v13, v9, v10);
  v11(a1 + a3[11], a2 + a3[11], v10);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v11(a1 + a3[14], a2 + a3[14], v10);
  v7(a1 + a3[15], a2 + a3[15], v6);
  return a1;
}

uint64_t sub_22C97B908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C97B91C);
}

uint64_t sub_22C97B91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_22C9A1D58();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 40);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_22C97BA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C97BA2C);
}

uint64_t sub_22C97BA2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_22C9A1D58();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 40);
    return v13(v15, a2, a2, v14);
  }
}

void sub_22C97BB34()
{
  sub_22C97BC0C();
  if (v0 <= 0x3F)
  {
    sub_22C9A1D58();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_22C97BC0C()
{
  if (!qword_2684D3A00)
  {
    sub_22C9A1C08();
    sub_22C97A934(&qword_2684D1668, MEMORY[0x263F51448]);
    unint64_t v0 = sub_22C9A1BC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2684D3A00);
    }
  }
}

uint64_t destroy for RecommendedBackup()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RecommendedBackup(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RecommendedBackup(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for RecommendedBackup(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RecommendedBackup(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RecommendedBackup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RecommendedBackup()
{
  return &type metadata for RecommendedBackup;
}

uint64_t getEnumTagSinglePayload for ToggleRecommendedBackupAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ToggleRecommendedBackupAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0x22C97C0E4);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToggleRecommendedBackupAction.CodingKeys()
{
  return &type metadata for ToggleRecommendedBackupAction.CodingKeys;
}

unint64_t sub_22C97C120()
{
  unint64_t result = qword_2684DF730[0];
  if (!qword_2684DF730[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DF730);
  }
  return result;
}

unint64_t sub_22C97C178()
{
  unint64_t result = qword_2684DF840;
  if (!qword_2684DF840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684DF840);
  }
  return result;
}

unint64_t sub_22C97C1D0()
{
  unint64_t result = qword_2684DF848[0];
  if (!qword_2684DF848[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DF848);
  }
  return result;
}

void *sub_22C97C224(uint64_t a1, void (*a2)(void *__return_ptr, uint64_t, _OWORD *))
{
  uint64_t v20 = *(void *)(a1 + 16);
  if (!v20) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = a1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  uint64_t v6 = 32;
  uint64_t v19 = v3;
  do
  {
    long long v9 = *(_OWORD *)(v2 + v6 + 48);
    v35[2] = *(_OWORD *)(v2 + v6 + 32);
    v35[3] = v9;
    v35[4] = *(_OWORD *)(v2 + v6 + 64);
    uint64_t v36 = *(void *)(v2 + v6 + 80);
    long long v10 = *(_OWORD *)(v2 + v6 + 16);
    v35[0] = *(_OWORD *)(v2 + v6);
    v35[1] = v10;
    sub_22C97C9A4((uint64_t)v35);
    a2(v27, v4, v35);
    uint64_t v11 = v27[0];
    uint64_t v12 = v27[1];
    uint64_t v13 = v27[2];
    uint64_t v14 = v27[3];
    uint64_t v22 = v27[5];
    uint64_t v23 = v27[4];
    uint64_t v15 = v29;
    char v24 = v28;
    uint64_t v37 = v30;
    uint64_t v25 = v32;
    uint64_t v26 = v31;
    sub_22C97CA0C((uint64_t)v35);
    sub_22C97CB58((uint64_t)v27, (uint64_t)v33);
    if (v34)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_22C8E0984(0, v5[2] + 1, 1, v5);
      }
      unint64_t v17 = v5[2];
      unint64_t v16 = v5[3];
      if (v17 >= v16 >> 1) {
        uint64_t v5 = sub_22C8E0984((void *)(v16 > 1), v17 + 1, 1, v5);
      }
      v5[2] = v17 + 1;
      BOOL v7 = &v5[11 * v17];
      v7[4] = v11;
      _OWORD v7[5] = v12;
      v7[6] = v13;
      v7[7] = v14;
      v7[8] = v23;
      v7[9] = v22;
      *((unsigned char *)v7 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v24 & 1;
      uint64_t v8 = v37;
      v7[11] = v15;
      v7[12] = v8;
      v7[13] = v26;
      v7[14] = v25;
      uint64_t v2 = v19;
    }
    ++v4;
    v6 += 88;
  }
  while (v20 != v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22C97C404(uint64_t a1, void (*a2)(_OWORD *__return_ptr, uint64_t, _OWORD *))
{
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_22C977B88(0, 0, 0);
  uint64_t v4 = v22;
  uint64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a1 + 32;
    do
    {
      long long v8 = *(_OWORD *)(v7 + 48);
      void v20[2] = *(_OWORD *)(v7 + 32);
      v20[3] = v8;
      v20[4] = *(_OWORD *)(v7 + 64);
      uint64_t v21 = *(void *)(v7 + 80);
      long long v9 = *(_OWORD *)(v7 + 16);
      v20[0] = *(_OWORD *)v7;
      v20[1] = v9;
      sub_22C97C9A4((uint64_t)v20);
      a2(v18, v6, v20);
      sub_22C97CA0C((uint64_t)v20);
      uint64_t v22 = v4;
      unint64_t v11 = *(void *)(v4 + 16);
      unint64_t v10 = *(void *)(v4 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_22C977B88(v10 > 1, v11 + 1, 1);
        uint64_t v4 = v22;
      }
      ++v6;
      *(void *)(v4 + 16) = v11 + 1;
      uint64_t v12 = v4 + 88 * v11;
      long long v13 = v18[1];
      *(_OWORD *)(v12 + 32) = v18[0];
      *(_OWORD *)(v12 + 48) = v13;
      long long v14 = v18[2];
      long long v15 = v18[3];
      long long v16 = v18[4];
      *(void *)(v12 + 112) = v19;
      *(_OWORD *)(v12 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v15;
      *(_OWORD *)(v12 + 96) = v16;
      *(_OWORD *)(v12 + 64) = v14;
      v7 += 88;
    }
    while (v5 != v6);
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22C97C56C()
{
  unint64_t v0 = sub_22C9A3FE8();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC) {
    return 12;
  }
  else {
    return v0;
  }
}

uint64_t objectdestroyTm_11()
{
  uint64_t v1 = (int *)(type metadata accessor for ToggleRecommendedBackupAction(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v11 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v12 = v2 | 7;
  uint64_t v4 = v0 + v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3028);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v4 + v1[7], v5);
  v6(v4 + v1[8], v5);
  v6(v4 + v1[9], v5);
  v6(v4 + v1[10], v5);
  v6(v4 + v1[11], v5);
  uint64_t v7 = v4 + v1[12];
  uint64_t v8 = sub_22C9A1D58();
  long long v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v4 + v1[13], v8);
  v9(v4 + v1[14], v8);
  v9(v4 + v1[15], v8);
  v9(v4 + v1[16], v8);
  v6(v4 + v1[17], v5);
  swift_release();
  return MEMORY[0x270FA0238](v0, v11, v12);
}

uint64_t sub_22C97C810(uint64_t (*a1)(unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ToggleRecommendedBackupAction(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a1(v1 + v3, v4);
}

uint64_t sub_22C97C8B0(uint64_t (*a1)(void))
{
  return a1();
}

__n128 sub_22C97C8BC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v5 = *(void *)(*(void *)(v3 + 16) + 16) - 1 != a1;
  uint64_t v6 = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  long long v11 = *(_OWORD *)a2;
  long long v12 = *(_OWORD *)(a2 + 32);
  __n128 v13 = *(__n128 *)(a2 + 56);
  sub_22C97C9A4(a2);
  *(_OWORD *)a3 = v11;
  *(void *)(a3 + 16) = v9;
  *(void *)(a3 + 24) = v8;
  *(_OWORD *)(a3 + 32) = v12;
  *(unsigned char *)(a3 + 48) = v5;
  __n128 result = v13;
  *(__n128 *)(a3 + 56) = v13;
  *(void *)(a3 + 72) = v6;
  *(void *)(a3 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v7;
  return result;
}

unint64_t sub_22C97C950()
{
  unint64_t result = qword_2684D3A08;
  if (!qword_2684D3A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3A08);
  }
  return result;
}

uint64_t sub_22C97C9A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C97CA0C(uint64_t a1)
{
  return a1;
}

unint64_t sub_22C97CA74@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  if (*(void *)(v5 + 16) <= result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (*(unsigned char *)(v5 + result + 32) == 1)
  {
    long long v16 = *(_OWORD *)a2;
    uint64_t v6 = *(void *)(a2 + 16);
    uint64_t v7 = *(void *)(a2 + 24);
    uint64_t v8 = *(void *)(a2 + 32);
    uint64_t v9 = *(void *)(a2 + 40);
    uint64_t v10 = *(void *)(a2 + 56);
    uint64_t v11 = *(void *)(a2 + 64);
    uint64_t v12 = *(void *)(a2 + 72);
    uint64_t v13 = *(void *)(a2 + 80);
    uint64_t v14 = *(unsigned char *)(a2 + 48) & 1;
    unint64_t result = sub_22C97C9A4(a2);
    long long v15 = v16;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v14 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    long long v15 = 0uLL;
  }
  *(_OWORD *)a3 = v15;
  *(void *)(a3 + 16) = v6;
  *(void *)(a3 + 24) = v7;
  *(void *)(a3 + 32) = v8;
  *(void *)(a3 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v9;
  *(void *)(a3 + 48) = v14;
  *(void *)(a3 + 56) = v10;
  *(void *)(a3 + 64) = v11;
  *(void *)(a3 + 72) = v12;
  *(void *)(a3 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v13;
  return result;
}

uint64_t sub_22C97CB58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C97CBC4()
{
  return sub_22C97C810((uint64_t (*)(unint64_t, uint64_t))sub_22C9730F4);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_22C97CBF4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2128);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C97CC54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22C9A1D58();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_22C97CCBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PageMetricsModifier();
  return sub_22C8BDE5C(v1 + *(int *)(v3 + 20), a1, &qword_2684D3948);
}

uint64_t type metadata accessor for PageMetricsModifier()
{
  uint64_t result = qword_2684DFC50;
  if (!qword_2684DFC50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C97CD48()
{
  return sub_22C9A3438();
}

uint64_t sub_22C97CD80()
{
  return swift_unknownObjectRetain();
}

BOOL sub_22C97CDB8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22C97CDC8()
{
  return sub_22C9A4198();
}

uint64_t sub_22C97CDF4()
{
  return 2;
}

uint64_t sub_22C97CDFC()
{
  return sub_22C9A41B8();
}

uint64_t sub_22C97CE44(char a1)
{
  if (a1) {
    return 0x6570795465676170;
  }
  else {
    return 0x644965676170;
  }
}

BOOL sub_22C97CE78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22C97CE90()
{
  return sub_22C97CE44(*v0);
}

uint64_t sub_22C97CE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22C97DEB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22C97CEC0(uint64_t a1)
{
  unint64_t v2 = sub_22C97DF98();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22C97CEFC(uint64_t a1)
{
  unint64_t v2 = sub_22C97DF98();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22C97CF38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_22C9A1D58();
  uint64_t v20 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v22 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A28);
  uint64_t v21 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PageMetricsModifier();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t *)&v12[*(int *)(v10 + 24)];
  sub_22C9A3448();
  uint64_t v14 = sub_22C9A3438();
  uint64_t v15 = MEMORY[0x263F50BE8];
  *uint64_t v13 = v14;
  v13[1] = v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22C97DF98();
  uint64_t v16 = (uint64_t)v25;
  sub_22C9A41C8();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v25 = v5;
    char v27 = 0;
    sub_22C97EFC0(&qword_2684D1518, MEMORY[0x263F514D8]);
    sub_22C9A4058();
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v12, v22, v23);
    char v26 = 1;
    sub_22C9A4028();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v24);
    sub_22C97DFEC((uint64_t)v25, (uint64_t)&v12[*(int *)(v9 + 20)]);
    sub_22C97E054((uint64_t)v12, v19);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return sub_22C97E0B8((uint64_t)v12);
  }
}

uint64_t sub_22C97D2F8@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3;
  uint64_t v73 = a2;
  uint64_t v8 = sub_22C9A1AA8();
  uint64_t v76 = *(void *)(v8 - 8);
  uint64_t v77 = (void *)v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v75 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A38);
  MEMORY[0x270FA5388](v10 - 8);
  char v71 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A40);
  MEMORY[0x270FA5388](v12 - 8);
  char v70 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A48);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v74 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22C9A3298();
  uint64_t v78 = *(void *)(v16 - 8);
  uint64_t v79 = v16;
  MEMORY[0x270FA5388](v16);
  unint64_t v72 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_22C9A31E8();
  uint64_t v80 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C95C5DC((uint64_t)v22);
  uint64_t v23 = sub_22C9A3158();
  swift_bridgeObjectRelease();
  if (!v23)
  {
    sub_22C8CE388(MEMORY[0x263F8EE78]);
    sub_22C9A3168();
  }
  uint64_t v24 = v5;
  uint64_t v25 = sub_22C9A1D48();
  if (v4) {
    return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v22, v85);
  }
  uint64_t v28 = v25;
  uint64_t v29 = v26;
  uint64_t v68 = a1;
  unint64_t v69 = (uint64_t *)a3;
  uint64_t v66 = type metadata accessor for PageMetricsModifier();
  uint64_t v30 = *(int *)(v66 + 20);
  uint64_t v67 = v24;
  sub_22C8BDE5C(v24 + v30, (uint64_t)v20, &qword_2684D3948);
  uint64_t v31 = sub_22C9A1D58();
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v20, 1, v31) == 1)
  {
    sub_22C8BE0DC((uint64_t)v20, &qword_2684D3948);
    uint64_t v65 = 0;
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v34 = sub_22C9A1D48();
    uint64_t v33 = v35;
    uint64_t v65 = v34;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v20, v31);
  }
  uint64_t v36 = (void (*)(long long *, void))sub_22C9A3148();
  uint64_t v38 = MEMORY[0x263F8D310];
  if (*v37)
  {
    *((void *)&v84 + 1) = MEMORY[0x263F8D310];
    *(void *)&long long v83 = v28;
    *((void *)&v83 + 1) = v29;
    sub_22C95CD70((uint64_t)&v83, 0x644965676170, 0xE600000000000000);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v36(&v81, 0);
  uint64_t v40 = v75;
  uint64_t v39 = v76;
  uint64_t v41 = (void (*)(long long *, void))sub_22C9A3148();
  if (*v42)
  {
    if (v33)
    {
      *((void *)&v84 + 1) = v38;
      *(void *)&long long v83 = v65;
      *((void *)&v83 + 1) = v33;
    }
    else
    {
      long long v83 = 0u;
      long long v84 = 0u;
    }
    int v43 = v68;
    uint64_t v44 = v77;
    sub_22C95CD70((uint64_t)&v83, 0x6570795465676170, 0xE800000000000000);
    v41(&v81, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    v41(&v81, 0);
    int v43 = v68;
    uint64_t v44 = v77;
  }
  uint64_t v45 = v78;
  uint64_t v46 = (uint64_t)v74;
  sub_22C97DC30(v73, &v81);
  if (*((void *)&v81 + 1))
  {
    swift_bridgeObjectRelease();
    sub_22C8CEC24(&v82, &v83);
    uint64_t v47 = v79;
    int v48 = swift_dynamicCast();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v46, v48 ^ 1u, 1, v47);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v46, 1, v47) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v72, v46, v47);
      uint64_t v49 = v43[3];
      uint64_t v50 = v43[4];
      uint64_t v77 = __swift_project_boxed_opaque_existential_1(v43, v49);
      uint64_t v51 = v80;
      uint64_t v52 = (uint64_t)v70;
      uint64_t v53 = v85;
      (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v70, v22, v85);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v52, 0, 1, v53);
      char v54 = (uint64_t *)(v67 + *(int *)(v66 + 24));
      uint64_t v55 = *v54;
      uint64_t v75 = (char *)v54[1];
      uint64_t v76 = v55;
      uint64_t v56 = sub_22C9A1888();
      uint64_t v57 = (uint64_t)v71;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v71, 1, 1, v56);
      *(void *)&long long v81 = v49;
      *((void *)&v81 + 1) = v50;
      OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
      unint64_t v59 = v69;
      v69[3] = OpaqueTypeMetadata2;
      *(void *)&long long v81 = v49;
      *((void *)&v81 + 1) = v50;
      unsigned char v59[4] = swift_getOpaqueTypeConformance2();
      __swift_allocate_boxed_opaque_existential_1(v59);
      char v60 = v72;
      sub_22C9A2878();
      sub_22C8BE0DC(v57, &qword_2684D3A38);
      sub_22C8BE0DC(v52, &qword_2684D3A40);
      (*(void (**)(char *, uint64_t))(v78 + 8))(v60, v79);
      return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v22, v85);
    }
  }
  else
  {
    sub_22C8BE0DC((uint64_t)&v81, (uint64_t *)&unk_2684D3690);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v46, 1, 1, v79);
  }
  sub_22C8BE0DC(v46, &qword_2684D3A48);
  uint64_t v61 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, void *))(v39 + 16))(v40, v61, v44);
  uint64_t v62 = sub_22C9A1A98();
  os_log_type_t v63 = sub_22C9A3A88();
  if (os_log_type_enabled(v62, v63))
  {
    unint64_t v64 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v64 = 0;
    _os_log_impl(&dword_22C821000, v62, v63, "No metrics pipeline found", v64, 2u);
    MEMORY[0x230F710E0](v64, -1, -1);
  }

  (*(void (**)(char *, void *))(v39 + 8))(v40, v44);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v22, v85);
  return sub_22C8C2470((uint64_t)v43, (uint64_t)v69);
}

uint64_t sub_22C97DC30@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = sub_22C9A3298();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)&long long v14 = a1;
  sub_22C97EFC0(&qword_2684D3A70, MEMORY[0x263F51480]);
  swift_retain();
  sub_22C9A3818();
  sub_22C9A3FC8();
  if (*((void *)&v14 + 1))
  {
    long long v11 = v14;
    long long v12 = v15;
    long long v13 = v16;
    sub_22C8BA924((uint64_t)&v12, (uint64_t)v10);
    if (swift_dynamicCast())
    {
LABEL_5:
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t result = swift_release();
      long long v9 = v12;
      *a2 = v11;
      a2[1] = v9;
      a2[2] = v13;
      return result;
    }
    while (1)
    {
      sub_22C8BE0DC((uint64_t)&v11, &qword_2684D2FA0);
      sub_22C9A3FC8();
      if (!*((void *)&v14 + 1)) {
        break;
      }
      long long v11 = v14;
      long long v12 = v15;
      long long v13 = v16;
      sub_22C8BA924((uint64_t)&v12, (uint64_t)v10);
      if (swift_dynamicCast()) {
        goto LABEL_5;
      }
    }
  }
  uint64_t result = swift_release();
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_22C97DE84@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_22C97D2F8(a1, a2, a3);
}

uint64_t sub_22C97DE9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22C97CF38(a1, a2);
}

uint64_t sub_22C97DEB4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x644965676170 && a2 == 0xE600000000000000;
  if (v3 || (sub_22C9A40C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6570795465676170 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_22C9A40C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_22C97DF98()
{
  unint64_t result = qword_2684D3A30;
  if (!qword_2684D3A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3A30);
  }
  return result;
}

uint64_t sub_22C97DFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C97E054(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PageMetricsModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C97E0B8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PageMetricsModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22C97E118()
{
  unint64_t result = qword_2684D3A50;
  if (!qword_2684D3A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3A50);
  }
  return result;
}

unint64_t sub_22C97E170()
{
  unint64_t result = qword_2684D3A58;
  if (!qword_2684D3A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3A58);
  }
  return result;
}

unint64_t sub_22C97E1C8()
{
  unint64_t result = qword_2684D3A60;
  if (!qword_2684D3A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3A60);
  }
  return result;
}

uint64_t sub_22C97E21C()
{
  return sub_22C97EFC0(&qword_2684D3A68, (void (*)(uint64_t))type metadata accessor for PageMetricsModifier);
}

char *sub_22C97E264(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_22C9A1D58();
    uint64_t v8 = *(void *)(v7 - 8);
    long long v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = *(int *)(a3 + 20);
    long long v11 = &a1[v10];
    long long v12 = &a2[v10];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&a2[v10], 1, v7))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      v9(v11, v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
    *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
    swift_unknownObjectRetain();
  }
  return a1;
}

uint64_t sub_22C97E418(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C9A1D58();
  uint64_t v5 = *(void *)(v4 - 8);
  char v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  return swift_unknownObjectRelease();
}

char *sub_22C97E510(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A1D58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  long long v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v9], 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  swift_unknownObjectRetain();
  return a1;
}

char *sub_22C97E674(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A1D58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v21 = a3;
  uint64_t v22 = a2;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  long long v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  uint64_t v16 = *(int *)(v21 + 24);
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &v22[v16];
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *((void *)v17 + 1) = v19;
  return a1;
}

char *sub_22C97E85C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A1D58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  long long v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v9], 1, v6))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_22C97E9B8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A1D58();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v21 = a3;
  uint64_t v22 = a2;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  long long v11 = &a2[v9];
  uint64_t v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v13 = v12(&a1[v9], 1, v6);
  int v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  uint64_t v16 = *(int *)(v21 + 24);
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &v22[v16];
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  swift_unknownObjectRelease();
  *((void *)v17 + 1) = v19;
  return a1;
}

uint64_t sub_22C97EB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C97EBAC);
}

uint64_t sub_22C97EBAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A1D58();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_22C97ECC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C97ECD8);
}

uint64_t sub_22C97ECD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_22C9A1D58();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3948);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_22C97EDEC()
{
  sub_22C9A1D58();
  if (v0 <= 0x3F)
  {
    sub_22C9711F0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for PageMetricsModifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22C97EF88);
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

ValueMetadata *type metadata accessor for PageMetricsModifier.CodingKeys()
{
  return &type metadata for PageMetricsModifier.CodingKeys;
}

uint64_t sub_22C97EFC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C97F008()
{
  sub_22C97F1A4((unint64_t *)&qword_2684D2180, MEMORY[0x263F887F0]);
  return sub_22C9A20E8();
}

uint64_t sub_22C97F0A0()
{
  sub_22C9A1798();
  sub_22C97F1A4((unint64_t *)&qword_2684D2180, MEMORY[0x263F887F0]);
  return sub_22C9A20F8();
}

uint64_t sub_22C97F128()
{
  sub_22C9A1708();
  sub_22C97F1A4(&qword_2684D26B8, MEMORY[0x263F887C8]);
  return sub_22C9A20E8();
}

uint64_t sub_22C97F1A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C97F1EC()
{
  return swift_retain();
}

uint64_t sub_22C97F1F4(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_22C97F220())()
{
  return nullsub_1;
}

uint64_t sub_22C97F240()
{
  sub_22C9A1708();
  sub_22C97F1A4(&qword_2684D26B8, MEMORY[0x263F887C8]);
  return sub_22C9A20F8();
}

uint64_t sub_22C97F2C8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22C97F320()
{
  return sub_22C97F3E4(MEMORY[0x263F18660]);
}

uint64_t type metadata accessor for ManageStorageView()
{
  uint64_t result = qword_2684DFD40;
  if (!qword_2684DFD40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id (*sub_22C97F384())()
{
  return sub_22C97F3A0;
}

id sub_22C97F3A0()
{
  return ManageStorageModel.__allocating_init()();
}

uint64_t sub_22C97F3CC()
{
  return sub_22C97F3E4(MEMORY[0x263F18668]);
}

uint64_t sub_22C97F3E4(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ManageStorageView() + 28));
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = *((unsigned __int8 *)v2 + 16);
  uint64_t v6 = type metadata accessor for ManageStorageModel(0);
  uint64_t v7 = sub_22C97F1A4(&qword_2684D3A80, (void (*)(uint64_t))type metadata accessor for ManageStorageModel);
  return a1(v3, v4, v5, v6, v7);
}

uint64_t ManageStorageView.init(storageSummaryModel:storageAppsModel:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_22C9A1AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C9A1A38();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ManageStorageView();
  uint64_t v10 = (uint64_t *)((char *)a1 + *(int *)(v9 + 24));
  *uint64_t v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = (char *)a1 + *(int *)(v9 + 28);
  *(void *)uint64_t v11 = sub_22C97F3A0;
  *((void *)v11 + 1) = 0;
  v11[16] = 0;
  sub_22C9A1798();
  sub_22C97F1A4((unint64_t *)&qword_2684D2180, MEMORY[0x263F887F0]);
  swift_retain();
  *a1 = sub_22C9A20E8();
  a1[1] = v12;
  sub_22C9A1708();
  sub_22C97F1A4(&qword_2684D26B8, MEMORY[0x263F887C8]);
  swift_retain();
  a1[2] = sub_22C9A20E8();
  a1[3] = v13;
  uint64_t v14 = sub_22C8D2E80();
  uint64_t v15 = *(uint64_t (**)(uint64_t))(*(void *)*v14 + 136);
  uint64_t v16 = swift_retain();
  uint64_t v17 = v15(v16);
  swift_release();
  swift_unknownObjectRelease();
  if (!v17)
  {
    uint64_t v18 = *v14;
    swift_retain();
    sub_22C9A16E8();
    id v19 = objc_allocWithZone((Class)sub_22C9A1748());
    uint64_t v20 = sub_22C9A1728();
    uint64_t v21 = sub_22C97F1A4(&qword_2684D19B0, MEMORY[0x263F887E0]);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v18 + 144))(v20, v21);
    swift_release();
  }
  uint64_t v22 = *(uint64_t (**)(uint64_t))(*(void *)*v14 + 160);
  uint64_t v23 = swift_retain();
  uint64_t v24 = v22(v23);
  swift_release();
  swift_release();
  if (v24)
  {
    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t v26 = *v14;
    type metadata accessor for ManageStorageAnalytics();
    swift_retain();
    uint64_t v27 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v27, v2);
    sub_22C9A1A18();
    uint64_t v28 = sub_22C9543F0((uint64_t)v8);
    (*(void (**)(uint64_t))(*(void *)v26 + 168))(v28);
    swift_release();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_22C97F8BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ManageStorageView();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  uint64_t v5 = (void *)sub_22C9A16A8();
  swift_release();
  if (v5)
  {

    sub_22C984734(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
LABEL_5:
    uint64_t v6 = 1;
    goto LABEL_6;
  }
  sub_22C984734(v1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
  swift_retain();
  uint64_t v6 = sub_22C9A1768();
  swift_release();
  if (v6)
  {
    id v7 = objc_msgSend((id)v6, sel_manageStoragePage);

    goto LABEL_5;
  }
LABEL_6:
  sub_22C97FA28((uint64_t)v4);
  return v6;
}

uint64_t sub_22C97FA28(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ManageStorageView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C97FA84()
{
  uint64_t v1 = type metadata accessor for ManageStorageView();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  char v4 = sub_22C9A1788();
  swift_release();
  sub_22C984734(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    swift_retain();
    char v5 = sub_22C9A16F8();
    swift_release();
  }
  sub_22C97FA28((uint64_t)v3);
  return v5 & 1;
}

uint64_t sub_22C97FB68()
{
  uint64_t v1 = type metadata accessor for ManageStorageView();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  char v4 = sub_22C9A1788();
  swift_release();
  sub_22C984734(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
  if (v4)
  {
    swift_retain();
    char v5 = sub_22C9A16F8();
    swift_release();
  }
  else
  {
    char v5 = 0;
  }
  sub_22C97FA28((uint64_t)v3);
  return v5 & 1;
}

uint64_t sub_22C97FC4C()
{
  uint64_t v1 = type metadata accessor for ManageStorageView();
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  char v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - v5;
  char v7 = sub_22C97F8BC();
  sub_22C984734(v0, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
  if (v7)
  {
    char v8 = 1;
  }
  else
  {
    swift_retain();
    char v9 = sub_22C9A1788();
    swift_release();
    sub_22C984734((uint64_t)v6, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
    if (v9)
    {
      char v8 = 1;
    }
    else
    {
      swift_retain();
      char v8 = sub_22C9A16F8();
      swift_release();
    }
    sub_22C97FA28((uint64_t)v4);
  }
  sub_22C97FA28((uint64_t)v6);
  return v8 & 1;
}

uint64_t ManageStorageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v148 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D26F8);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)v115 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3470);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  char v8 = (char *)v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v120 = (void *)((char *)v115 - v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2848);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v137 = (char *)v115 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22C9A1FE8();
  uint64_t v135 = *(void *)(v12 - 8);
  uint64_t v136 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v134 = (uint64_t)v115 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A88);
  uint64_t v125 = *(void *)(v127 - 8);
  MEMORY[0x270FA5388](v127);
  os_log_type_t v145 = (char *)v115 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A90);
  uint64_t v129 = *(void *)(v15 - 8);
  uint64_t v130 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v126 = (char *)v115 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A98);
  MEMORY[0x270FA5388](v124);
  os_log_type_t v131 = (char *)v115 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3AA0);
  MEMORY[0x270FA5388](v128);
  os_log_type_t v133 = (char *)v115 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3AA8);
  uint64_t v19 = MEMORY[0x270FA5388](v142);
  uint64_t v132 = (uint64_t)v115 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v138 = (uint64_t)v115 - v21;
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3AB0);
  MEMORY[0x270FA5388](v146);
  uint64_t v23 = (char *)v115 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3AB8);
  MEMORY[0x270FA5388](v140);
  v141 = (char *)v115 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3AC0);
  MEMORY[0x270FA5388](v147);
  v143 = (char *)v115 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = type metadata accessor for ManageStorageView();
  uint64_t v121 = *(void *)(v144 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v144);
  uint64_t v122 = v27;
  uint64_t v123 = (uint64_t)v115 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)v115 - v28;
  swift_retain();
  char v30 = sub_22C9A1788();
  swift_release();
  sub_22C984734(v1, (uint64_t)v29, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
  if (v30)
  {
    swift_retain();
    char v31 = sub_22C9A16F8();
    swift_release();
    sub_22C97FA28((uint64_t)v29);
    if (v31)
    {
      uint64_t v119 = v5;
      os_log_type_t v145 = (char *)sub_22C9A2448();
      sub_22C9A24A8();
      uint64_t v118 = v23;
      sub_22C8BA084(0, (unint64_t *)&qword_2684D1BA8);
      sub_22C959844();
      uint64_t v32 = sub_22C9A2848();
      uint64_t v34 = v33;
      uint64_t v36 = v35;
      char v38 = v37 & 1;
      uint64_t KeyPath = swift_getKeyPath();
      char v40 = sub_22C9A2738();
      LOBYTE(v150[0]) = 1;
      LOBYTE(v158) = v38;
      LOBYTE(v156[0]) = 1;
      LOBYTE(v151) = 1;
      memset(&v157[7], 0, 32);
      sub_22C8DBC38(v32, v34, v38);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_22C8DBC48(v32, v34, v38);
      swift_bridgeObjectRelease();
      swift_release();
      *(void *)&long long v151 = 0;
      BYTE8(v151) = 1;
      *(_DWORD *)((char *)&v151 + 9) = v150[0];
      HIDWORD(v151) = *(_DWORD *)((char *)v150 + 3);
      *(void *)&long long v152 = v32;
      *((void *)&v152 + 1) = v34;
      LOBYTE(v153) = v38;
      *(_DWORD *)((char *)&v153 + 1) = v158;
      DWORD1(v153) = *(_DWORD *)((char *)&v158 + 3);
      *((void *)&v153 + 1) = v36;
      *(void *)&long long v154 = KeyPath;
      BYTE8(v154) = 1;
      HIDWORD(v154) = *(_DWORD *)((char *)v156 + 3);
      *(_DWORD *)((char *)&v154 + 9) = v156[0];
      LOBYTE(v155[0]) = v40;
      *(void *)&v155[2] = *(void *)&v157[31];
      *(_OWORD *)((char *)&v155[1] + 1) = *(_OWORD *)&v157[16];
      *(_OWORD *)((char *)v155 + 1) = *(_OWORD *)v157;
      BYTE8(v155[2]) = 1;
      *(_DWORD *)((char *)&v155[2] + 9) = v149[0];
      HIDWORD(v155[2]) = *(_DWORD *)((char *)v149 + 3);
      *(void *)&v155[3] = 0;
      BYTE8(v155[3]) = 1;
      LOBYTE(v149[0]) = 1;
      *(_OWORD *)((char *)&v156[3] + 7) = v154;
      *(_OWORD *)((char *)&v156[2] + 7) = v153;
      *(_OWORD *)((char *)&v156[1] + 7) = v152;
      *(_OWORD *)((char *)v156 + 7) = v151;
      v156[7] = *(_OWORD *)((char *)&v155[2] + 9);
      *(_OWORD *)((char *)&v156[6] + 7) = v155[2];
      *(_OWORD *)((char *)&v156[5] + 7) = v155[1];
      *(_OWORD *)((char *)&v156[4] + 7) = v155[0];
      v158 = v145;
      *(void *)v159 = 0;
      v159[8] = 1;
      long long v162 = v156[3];
      long long v161 = v156[2];
      long long v160 = v156[1];
      *(_OWORD *)&v159[9] = v156[0];
      long long v166 = v156[7];
      long long v165 = v156[6];
      long long v164 = v156[5];
      long long v163 = v156[4];
      unint64_t v113 = sub_22C9A2F88();
      unint64_t v114 = v41;
      sub_22C96CCE8(0.0, 1, 0.0, 1, INFINITY, 0, 300.0, 0, (uint64_t)v150, 0.0, 1, 0.0, 1);
      sub_22C96CECC((uint64_t)&v151);
      memcpy(v157, v150, sizeof(v157));
      memcpy(v141, v157, 0x108uLL);
      swift_storeEnumTagMultiPayload();
      sub_22C96D388((uint64_t)v157);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3928);
      sub_22C982C84((unint64_t *)&qword_2684D3920, &qword_2684D3928, (unint64_t *)&qword_2684D3930, &qword_2684D3938);
      sub_22C982984();
      uint64_t v42 = (uint64_t)v143;
      sub_22C9A2548();
      sub_22C8BDE5C(v42, (uint64_t)v118, &qword_2684D3AC0);
      swift_storeEnumTagMultiPayload();
      sub_22C9828E8();
      sub_22C982C84((unint64_t *)&qword_2684D3480, &qword_2684D3470, &qword_2684D26F0, &qword_2684D26F8);
      sub_22C9A2548();
      sub_22C8BE0DC(v42, &qword_2684D3AC0);
      return sub_22C983B38((uint64_t)v157);
    }
  }
  else
  {
    sub_22C97FA28((uint64_t)v29);
  }
  if (sub_22C97FC4C())
  {
    swift_retain();
    uint64_t v44 = (void *)sub_22C9A16A8();
    swift_release();
    uint64_t v118 = v23;
    uint64_t v119 = v5;
    if (v44)
    {
      id v45 = objc_msgSend(v44, sel_genericErrorMessage);

      uint64_t v46 = sub_22C9A36C8();
    }
    else
    {
      uint64_t v46 = 0;
    }
    sub_22C9A1708();
    sub_22C97F1A4(&qword_2684D26B8, MEMORY[0x263F887C8]);
    sub_22C9A20F8();
    swift_getKeyPath();
    sub_22C9A2108();
    swift_release();
    uint64_t v56 = swift_release();
    uint64_t v120 = v115;
    v158 = (char *)v150[0];
    *(_OWORD *)v159 = *(_OWORD *)&v150[1];
    MEMORY[0x270FA5388](v56);
    uint64_t v117 = &v109;
    uint64_t v111 = v1;
    unint64_t v112 = v46;
    uint64_t v116 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B20);
    v115[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B28);
    v115[2] = sub_22C8C6FAC(&qword_2684D3B30, &qword_2684D3B20);
    v115[1] = sub_22C8C6FAC(&qword_2684D3B38, &qword_2684D3B20);
    v115[0] = sub_22C8C6FAC(&qword_2684D3B40, &qword_2684D3B20);
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B48);
    uint64_t v58 = sub_22C8BA084(255, &qword_2684D2238);
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B50);
    uint64_t v139 = v1;
    uint64_t v60 = v59;
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B58);
    uint64_t v62 = sub_22C9A21D8();
    uint64_t v63 = sub_22C8C6FAC(&qword_2684D3B60, &qword_2684D3B58);
    uint64_t v64 = sub_22C97F1A4((unint64_t *)&qword_2684D1B00, MEMORY[0x263F18F38]);
    *(void *)v157 = v61;
    *(void *)&v157[8] = v62;
    *(void *)&v157[16] = v63;
    *(void *)&v157[24] = v64;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    unint64_t v66 = sub_22C982D2C();
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B68);
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B70);
    unint64_t v69 = sub_22C982D94();
    *(void *)v157 = &type metadata for ManageStorageDrilldownView;
    *(void *)&v157[8] = v69;
    uint64_t v70 = swift_getOpaqueTypeConformance2();
    *(void *)v157 = v68;
    *(void *)&v157[8] = v70;
    uint64_t v71 = swift_getOpaqueTypeConformance2();
    *(void *)v157 = v67;
    *(void *)&v157[8] = v71;
    uint64_t v72 = swift_getOpaqueTypeConformance2();
    *(void *)v157 = v57;
    *(void *)&v157[8] = v58;
    *(void *)&v157[16] = v60;
    *(void *)&v157[24] = OpaqueTypeConformance2;
    *(void *)&v157[32] = v66;
    *(void *)&v157[40] = v72;
    unint64_t v113 = swift_getOpaqueTypeConformance2();
    unint64_t v114 = v66;
    sub_22C9A2188();
    swift_bridgeObjectRelease();
    uint64_t v73 = type metadata accessor for ManageStorageModel(0);
    uint64_t v74 = sub_22C97F1A4(&qword_2684D3A80, (void (*)(uint64_t))type metadata accessor for ManageStorageModel);
    uint64_t v120 = (void *)v73;
    uint64_t v75 = (void *)sub_22C9A1F48();
    uint64_t v76 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v75) + 0xC8))();
    uint64_t v78 = v77;

    v150[0] = v76;
    v150[1] = v78;
    uint64_t v117 = (void *)v74;
    uint64_t v79 = (void *)sub_22C9A1F58();
    swift_getKeyPath();
    sub_22C9A2108();
    swift_release();

    uint64_t v116 = v115;
    uint64_t v81 = MEMORY[0x270FA5388](v80);
    MEMORY[0x270FA5388](v81);
    uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3AE8);
    uint64_t v83 = sub_22C8C6FAC(&qword_2684D3AF0, &qword_2684D3A88);
    unint64_t v84 = sub_22C8D6A18();
    unint64_t v113 = sub_22C982BEC();
    unint64_t v114 = MEMORY[0x263F1A820];
    uint64_t v111 = v83;
    unint64_t v112 = v84;
    uint64_t v109 = v82;
    uint64_t v110 = MEMORY[0x263F1A830];
    uint64_t v85 = v127;
    uint64_t v86 = v126;
    long long v87 = v145;
    sub_22C9A2AD8();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v125 + 8))(v87, v85);
    uint64_t v88 = sub_22C9A1F48();
    uint64_t v89 = swift_getKeyPath();
    uint64_t v91 = v129;
    uint64_t v90 = v130;
    uint64_t v92 = (uint64_t)v131;
    (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v131, v86, v130);
    os_log_type_t v93 = (uint64_t *)(v92 + *(int *)(v124 + 36));
    *os_log_type_t v93 = v89;
    v93[1] = v88;
    (*(void (**)(char *, uint64_t))(v91 + 8))(v86, v90);
    uint64_t v94 = v134;
    sub_22C9836D0(v134);
    uint64_t v95 = swift_getKeyPath();
    uint64_t v97 = v135;
    uint64_t v96 = v136;
    uint64_t v98 = (uint64_t)v137;
    (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v137, v94, v136);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v97 + 56))(v98, 0, 1, v96);
    uint64_t v99 = (uint64_t)v133;
    uint64_t v100 = (uint64_t *)&v133[*(int *)(v128 + 36)];
    uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B18);
    sub_22C8BDE5C(v98, (uint64_t)v100 + *(int *)(v101 + 28), &qword_2684D2848);
    *uint64_t v100 = v95;
    sub_22C8BDE5C(v92, v99, &qword_2684D3A98);
    sub_22C8BE0DC(v98, &qword_2684D2848);
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v94, v96);
    sub_22C8BE0DC(v92, &qword_2684D3A98);
    uint64_t v102 = v123;
    sub_22C984734(v139, v123, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
    unint64_t v103 = (*(unsigned __int8 *)(v121 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80);
    uint64_t v104 = swift_allocObject();
    sub_22C9848F8(v102, v104 + v103, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
    uint64_t v105 = v132;
    sub_22C8BDE5C(v99, v132, &qword_2684D3AA0);
    char v106 = (void *)(v105 + *(int *)(v142 + 36));
    *char v106 = 0;
    v106[1] = 0;
    v106[2] = sub_22C983ABC;
    v106[3] = v104;
    sub_22C8BE0DC(v99, &qword_2684D3AA0);
    uint64_t v107 = v138;
    sub_22C8DBD98(v105, v138, &qword_2684D3AA8);
    sub_22C8BDE5C(v107, (uint64_t)v141, &qword_2684D3AA8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3928);
    sub_22C982C84((unint64_t *)&qword_2684D3920, &qword_2684D3928, (unint64_t *)&qword_2684D3930, &qword_2684D3938);
    sub_22C982984();
    uint64_t v108 = (uint64_t)v143;
    sub_22C9A2548();
    sub_22C8BDE5C(v108, (uint64_t)v118, &qword_2684D3AC0);
    swift_storeEnumTagMultiPayload();
    sub_22C9828E8();
    sub_22C982C84((unint64_t *)&qword_2684D3480, &qword_2684D3470, &qword_2684D26F0, &qword_2684D26F8);
    sub_22C9A2548();
    sub_22C8BE0DC(v108, &qword_2684D3AC0);
    uint64_t v54 = v107;
    uint64_t v55 = &qword_2684D3AA8;
  }
  else
  {
    *(void *)char v4 = sub_22C9A2448();
    *((void *)v4 + 1) = 0;
    v4[16] = 1;
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2760);
    sub_22C982398(&v4[*(int *)(v47 + 44)]);
    unint64_t v113 = sub_22C9A2F88();
    unint64_t v114 = v48;
    LOBYTE(v112) = 1;
    uint64_t v111 = 0;
    LOBYTE(v11__isPlatformVersionAtLeast(2, 18, 1, 0) = 1;
    uint64_t v109 = 0;
    sub_22C9A2248();
    sub_22C8BDE5C((uint64_t)v4, (uint64_t)v8, &qword_2684D26F8);
    uint64_t v49 = &v8[*(int *)(v5 + 36)];
    long long v50 = *(_OWORD *)&v157[80];
    *((_OWORD *)v49 + 4) = *(_OWORD *)&v157[64];
    *((_OWORD *)v49 + 5) = v50;
    *((_OWORD *)v49 + 6) = *(_OWORD *)&v157[96];
    long long v51 = *(_OWORD *)&v157[16];
    *(_OWORD *)uint64_t v49 = *(_OWORD *)v157;
    *((_OWORD *)v49 + 1) = v51;
    long long v52 = *(_OWORD *)&v157[48];
    *((_OWORD *)v49 + 2) = *(_OWORD *)&v157[32];
    *((_OWORD *)v49 + 3) = v52;
    sub_22C8BE0DC((uint64_t)v4, &qword_2684D26F8);
    uint64_t v53 = (uint64_t)v120;
    sub_22C8DBD98((uint64_t)v8, (uint64_t)v120, &qword_2684D3470);
    sub_22C8BDE5C(v53, (uint64_t)v23, &qword_2684D3470);
    swift_storeEnumTagMultiPayload();
    sub_22C9828E8();
    sub_22C982C84((unint64_t *)&qword_2684D3480, &qword_2684D3470, &qword_2684D26F0, &qword_2684D26F8);
    sub_22C9A2548();
    uint64_t v54 = v53;
    uint64_t v55 = &qword_2684D3470;
  }
  return sub_22C8BE0DC(v54, v55);
}

uint64_t sub_22C9812B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22C9A16B8();
  *a1 = result;
  return result;
}

uint64_t sub_22C9812E4()
{
  return sub_22C9A16C8();
}

uint64_t sub_22C981310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v33 = a1;
  uint64_t v41 = a4;
  uint64_t v5 = type metadata accessor for ManageStorageView();
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v36 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v34 = (uint64_t)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C9A21D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B58);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B48);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v39 = v15;
  uint64_t v40 = v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v35 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3BB8);
  sub_22C8C6FAC(&qword_2684D3BC0, &qword_2684D3BB8);
  sub_22C9A27D8();
  sub_22C9A2FB8();
  uint64_t v18 = sub_22C8C6FAC(&qword_2684D3B60, &qword_2684D3B58);
  uint64_t v19 = sub_22C97F1A4((unint64_t *)&qword_2684D1B00, MEMORY[0x263F18F38]);
  sub_22C9A2B48();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_22C8BA084(0, &qword_2684D2238);
  uint64_t v20 = v34;
  sub_22C984734(v33, v34, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
  unint64_t v21 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v38;
  *(void *)(v22 + 16) = v37;
  *(void *)(v22 + 24) = v23;
  sub_22C9848F8(v20, v22 + v21, (uint64_t (*)(void))type metadata accessor for ManageStorageView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B50);
  int v43 = (ValueMetadata *)v11;
  unint64_t v44 = v7;
  uint64_t v45 = v18;
  uint64_t v46 = v19;
  swift_getOpaqueTypeConformance2();
  sub_22C982D2C();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B68);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B70);
  unint64_t v26 = sub_22C982D94();
  int v43 = &type metadata for ManageStorageDrilldownView;
  unint64_t v44 = v26;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  int v43 = (ValueMetadata *)v25;
  unint64_t v44 = OpaqueTypeConformance2;
  uint64_t v28 = swift_getOpaqueTypeConformance2();
  int v43 = (ValueMetadata *)v24;
  unint64_t v44 = v28;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v39;
  char v30 = v35;
  sub_22C9A2A68();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v30, v29);
}

void sub_22C981834(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3BC8);
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v44 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v42 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3BD0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v41 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3BD8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v47 = (uint64_t)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v37 - v10;
  swift_retain();
  char v12 = sub_22C9A1788();
  swift_release();
  if (v12)
  {
    uint64_t v48 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    swift_retain();
    uint64_t v48 = sub_22C9114C4();
    uint64_t v16 = v15;
    swift_retain();
    uint64_t v13 = (void *)sub_22C9A1768();
    swift_release();
    if (v13)
    {
      id v17 = objc_msgSend(v13, sel_manageStoragePage);

      id v18 = objc_msgSend(v17, sel_tips);
      sub_22C8BA084(0, &qword_2684D21A0);
      uint64_t v19 = sub_22C9A3858();

      swift_retain();
      uint64_t v20 = sub_22C8F978C(v19);
      uint64_t v13 = v21;
      uint64_t v14 = v22;
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v14 = 0;
    }
    swift_retain();
    sub_22C984BE0(v20);
    uint64_t v45 = v20;
    sub_22C984C20(v20);
    uint64_t v46 = v16;
    swift_release();
  }
  swift_retain();
  char v23 = sub_22C9A16F8();
  swift_release();
  if (v23)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v11, 1, 1, v4);
  }
  else
  {
    swift_retain();
    uint64_t v24 = sub_22C90E1D4();
    uint64_t v38 = v4;
    uint64_t v49 = (ValueMetadata *)v24;
    unint64_t v50 = v25;
    unint64_t v26 = sub_22C984C60();
    uint64_t v39 = v11;
    uint64_t v40 = a1;
    unint64_t v27 = v26;
    swift_retain();
    uint64_t v28 = v42;
    View.storageAppsModel(_:)();
    swift_release();
    swift_release();
    swift_retain();
    uint64_t v49 = &type metadata for ManageStorageAppsView;
    unint64_t v50 = v27;
    uint64_t v11 = v39;
    a1 = v40;
    swift_getOpaqueTypeConformance2();
    uint64_t v29 = v41;
    uint64_t v30 = v44;
    View.storageSummaryModel(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v30);
    uint64_t v31 = v38;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v11, v29, v38);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v11, 0, 1, v31);
  }
  uint64_t v32 = v47;
  sub_22C8BDE5C((uint64_t)v11, v47, &qword_2684D3BD8);
  uint64_t v33 = v48;
  uint64_t v34 = v45;
  uint64_t v35 = v46;
  *a1 = v48;
  a1[1] = v35;
  a1[2] = v34;
  a1[3] = (uint64_t)v13;
  a1[4] = v14;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3BE8);
  sub_22C8BDE5C(v32, (uint64_t)a1 + *(int *)(v36 + 48), &qword_2684D3BD8);
  sub_22C984CB4(v33, v35, v34);
  sub_22C8BE0DC((uint64_t)v11, &qword_2684D3BD8);
  sub_22C8BE0DC(v32, &qword_2684D3BD8);
  sub_22C984D10(v33, v35, v34);
}

uint64_t sub_22C981D10@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v20[1] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B70);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B68);
  uint64_t v11 = *(void *)(v20[0] - 8);
  MEMORY[0x270FA5388](v20[0]);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  swift_bridgeObjectRetain();
  sub_22C952AD0((uint64_t)v14, a2, a3, (uint64_t)&v25);
  uint64_t v32 = *((void *)&v27 + 1);
  char v33 = v28;
  uint64_t v30 = *((void *)&v26 + 1);
  char v31 = v27;
  sub_22C8DBD98((uint64_t)&v25 + 8, (uint64_t)v29, &qword_2684D1C58);
  uint64_t v15 = (void *)v25;
  long long v21 = v25;
  long long v22 = v26;
  long long v23 = v27;
  char v24 = v28;
  unint64_t v16 = sub_22C982D94();
  sub_22C9A2A98();

  sub_22C8DAEA4((uint64_t)v29);
  sub_22C984BB0((uint64_t)&v30);
  sub_22C984BB0((uint64_t)&v32);
  swift_retain();
  *(void *)&long long v21 = &type metadata for ManageStorageDrilldownView;
  *((void *)&v21 + 1) = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  View.storageAppsModel(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_retain();
  *(void *)&long long v21 = v7;
  *((void *)&v21 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v18 = v20[0];
  View.storageSummaryModel(_:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v18);
}

uint64_t sub_22C982000(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ManageStorageAlertButton(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1BA0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = *(void *)(a1 + 24);
  v12[0] = *(void *)(a1 + 16);
  v12[1] = v8;
  sub_22C8BDE5C(a1 + *(int *)(v3 + 32), (uint64_t)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2684D1BA0);
  sub_22C984734(a1, (uint64_t)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ManageStorageAlertButton);
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = swift_allocObject();
  sub_22C9848F8((uint64_t)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, type metadata accessor for ManageStorageAlertButton);
  sub_22C8D6A18();
  swift_bridgeObjectRetain();
  return sub_22C9A2DA8();
}

uint64_t View.manageStorageModel(_:)(void *a1)
{
  swift_getKeyPath();
  id v2 = a1;
  sub_22C9A2938();

  return swift_release();
}

uint64_t View.sheetDismiss(_:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2848);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v5 = sub_22C9A1FE8();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  sub_22C9A2938();
  swift_release();
  return sub_22C8BE0DC((uint64_t)v4, &qword_2684D2848);
}

uint64_t sub_22C982398@<X0>(void *a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v1 = sub_22C9A1F28();
  uint64_t v38 = *(void *)(v1 - 8);
  uint64_t v39 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v37 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22C9A2658();
  uint64_t v35 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1A50);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2768);
  uint64_t v10 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2770);
  MEMORY[0x270FA5388](v33);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2778);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v34 = (uint64_t)&v33 - v19;
  sub_22C9A1FA8();
  sub_22C9A2648();
  sub_22C8C6FAC((unint64_t *)&qword_2684D1AB0, &qword_2684D1A50);
  sub_22C97F1A4((unint64_t *)&qword_2684D2780, MEMORY[0x263F1A1D8]);
  sub_22C9A2908();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  long long v21 = v37;
  uint64_t v20 = v38;
  uint64_t v22 = v39;
  (*(void (**)(char *, void, uint64_t))(v38 + 104))(v37, *MEMORY[0x263F18560], v39);
  uint64_t KeyPath = swift_getKeyPath();
  char v24 = (uint64_t *)&v14[*(int *)(v33 + 36)];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D20C0);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))((char *)v24 + *(int *)(v25 + 28), v21, v22);
  *char v24 = KeyPath;
  uint64_t v26 = v36;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v12, v36);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v26);
  sub_22C9100B0();
  sub_22C9A2A88();
  sub_22C8BE0DC((uint64_t)v14, &qword_2684D2770);
  uint64_t v27 = v34;
  sub_22C8DBD98((uint64_t)v18, v34, &qword_2684D2778);
  sub_22C8BDE5C(v27, (uint64_t)v18, &qword_2684D2778);
  char v28 = v40;
  *uint64_t v40 = 0;
  *((unsigned char *)v28 + 8) = 1;
  uint64_t v29 = v28;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2790);
  sub_22C8BDE5C((uint64_t)v18, (uint64_t)v29 + *(int *)(v30 + 48), &qword_2684D2778);
  uint64_t v31 = (uint64_t)v29 + *(int *)(v30 + 64);
  *(void *)uint64_t v31 = 0;
  *(unsigned char *)(v31 + 8) = 1;
  sub_22C8BE0DC(v27, &qword_2684D2778);
  return sub_22C8BE0DC((uint64_t)v18, &qword_2684D2778);
}

unint64_t sub_22C9828E8()
{
  unint64_t result = qword_2684D3AC8;
  if (!qword_2684D3AC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3AC0);
    sub_22C982C84((unint64_t *)&qword_2684D3920, &qword_2684D3928, (unint64_t *)&qword_2684D3930, &qword_2684D3938);
    sub_22C982984();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3AC8);
  }
  return result;
}

unint64_t sub_22C982984()
{
  unint64_t result = qword_2684D3AD0;
  if (!qword_2684D3AD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3AA8);
    sub_22C982A00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3AD0);
  }
  return result;
}

unint64_t sub_22C982A00()
{
  unint64_t result = qword_2684D3AD8;
  if (!qword_2684D3AD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3AA0);
    sub_22C982AA0();
    sub_22C8C6FAC(&qword_2684D3B10, &qword_2684D3B18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3AD8);
  }
  return result;
}

unint64_t sub_22C982AA0()
{
  unint64_t result = qword_2684D3AE0;
  if (!qword_2684D3AE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3A98);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3A88);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3AE8);
    sub_22C8C6FAC(&qword_2684D3AF0, &qword_2684D3A88);
    sub_22C8D6A18();
    sub_22C982BEC();
    swift_getOpaqueTypeConformance2();
    sub_22C8C6FAC(&qword_2684D3B00, &qword_2684D3B08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3AE0);
  }
  return result;
}

unint64_t sub_22C982BEC()
{
  unint64_t result = qword_2684D3AF8;
  if (!qword_2684D3AF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3AE8);
    sub_22C8C6FAC(&qword_2684D1B30, &qword_2684D1B38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3AF8);
  }
  return result;
}

uint64_t sub_22C982C84(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_22C8C6FAC(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22C982D20@<X0>(uint64_t a1@<X8>)
{
  return sub_22C981310(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_22C982D2C()
{
  unint64_t result = qword_2684D27B8;
  if (!qword_2684D27B8)
  {
    sub_22C8BA084(255, &qword_2684D2238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D27B8);
  }
  return result;
}

unint64_t sub_22C982D94()
{
  unint64_t result = qword_2684D3B78;
  if (!qword_2684D3B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3B78);
  }
  return result;
}

uint64_t sub_22C982DE8()
{
  type metadata accessor for ManageStorageView();
  type metadata accessor for ManageStorageModel(0);
  sub_22C97F1A4(&qword_2684D3A80, (void (*)(uint64_t))type metadata accessor for ManageStorageModel);
  uint64_t v0 = (void *)sub_22C9A1F48();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3BA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1B38);
  sub_22C8C6FAC(&qword_2684D3BA8, &qword_2684D3BA0);
  sub_22C8C6FAC(&qword_2684D1B30, &qword_2684D1B38);
  sub_22C97F1A4(&qword_2684D3BB0, (void (*)(uint64_t))type metadata accessor for ManageStorageAlertButton);
  return sub_22C9A2F18();
}

uint64_t sub_22C982FC4@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for ManageStorageView();
  type metadata accessor for ManageStorageModel(0);
  sub_22C97F1A4(&qword_2684D3A80, (void (*)(uint64_t))type metadata accessor for ManageStorageModel);
  uint64_t v2 = (void *)sub_22C9A1F48();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0xF8))();

  sub_22C8D6A18();
  uint64_t result = sub_22C9A2868();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_22C9830E4()
{
  sub_22C983B88();
  return sub_22C9A2408();
}

uint64_t sub_22C98312C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2848);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22C8BDE5C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2684D2848);
  sub_22C983B88();
  sub_22C9A2418();
  return sub_22C8BE0DC(a1, &qword_2684D2848);
}

uint64_t sub_22C9831DC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2848);
  __swift_allocate_value_buffer(v0, qword_2684DFC68);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2684DFC68);
  uint64_t v2 = sub_22C9A1FE8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(v1, 1, 1, v2);
}

uint64_t sub_22C983274@<X0>(uint64_t a1@<X8>)
{
  if (qword_2684DFC60 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2848);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2684DFC68);
  return sub_22C8BDE5C(v3, a1, &qword_2684D2848);
}

uint64_t sub_22C9832EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_22C924874();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void (*sub_22C983350(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684D2848) - 8) + 64);
  v3[1] = malloc(v4);
  v3[2] = malloc(v4);
  v3[3] = malloc(v4);
  v3[4] = sub_22C983B88();
  sub_22C9A2408();
  return sub_22C983410;
}

void sub_22C983410(uint64_t **a1, char a2)
{
  uint64_t v3 = *a1;
  sub_22C8BDE5C((*a1)[3], (*a1)[2], &qword_2684D2848);
  size_t v4 = (void *)v3[3];
  uint64_t v5 = (void *)v3[1];
  uint64_t v6 = (void *)v3[2];
  if (a2)
  {
    sub_22C8BDE5C(v3[2], v3[1], &qword_2684D2848);
    sub_22C9A2418();
    sub_22C8BE0DC((uint64_t)v6, &qword_2684D2848);
  }
  else
  {
    sub_22C9A2418();
  }
  sub_22C8BE0DC((uint64_t)v4, &qword_2684D2848);
  free(v4);
  free(v6);
  free(v5);
  free(v3);
}

uint64_t sub_22C983500()
{
  sub_22C983BDC();
  sub_22C9A2408();
  return v1;
}

uint64_t sub_22C98353C()
{
  return sub_22C9A2418();
}

uint64_t sub_22C983578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_22C94CB70();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void (*sub_22C9835DC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_22C983BDC();
  sub_22C9A2408();
  return sub_22C98363C;
}

void sub_22C98363C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)(a1 + 8) = *(void *)a1;
  if (a2)
  {
    id v4 = v2;
    sub_22C9A2418();
    uint64_t v5 = *(void **)a1;
  }
  else
  {
    sub_22C9A2418();
  }
}

uint64_t sub_22C9836D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C9A23F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C8BDE5C(v2, (uint64_t)v10, &qword_2684D3A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_22C9A1FE8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_22C9A3A98();
    uint64_t v14 = sub_22C9A2728();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_22C8BA27C(0x417373696D736944, 0xED00006E6F697463, &v18);
      _os_log_impl(&dword_22C821000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v16, -1, -1);
      MEMORY[0x230F710E0](v15, -1, -1);
    }

    sub_22C9A23E8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_22C983964()
{
  uint64_t v1 = type metadata accessor for ManageStorageView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22C9A1FE8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_22C983AAC(*(void *)(v0 + v3 + *(int *)(v1 + 28)), *(void **)(v0 + v3 + *(int *)(v1 + 28) + 8), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 28) + 16));
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void sub_22C983AAC(uint64_t a1, void *a2, char a3)
{
  if (a3) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_22C983ABC()
{
  type metadata accessor for ManageStorageView();
  swift_retain();
  sub_22C9A16D8();
  return swift_release();
}

uint64_t sub_22C983B38(uint64_t a1)
{
  return a1;
}

unint64_t sub_22C983B88()
{
  unint64_t result = qword_2684DFCA8;
  if (!qword_2684DFCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684DFCA8);
  }
  return result;
}

unint64_t sub_22C983BDC()
{
  unint64_t result = qword_2684DFCB0[0];
  if (!qword_2684DFCB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DFCB0);
  }
  return result;
}

uint64_t sub_22C983C30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ManageStorageView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_22C9A1FE8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = *(int *)(a3 + 28);
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(void *)v16;
    uint64_t v18 = (void *)*((void *)v16 + 1);
    char v19 = v16[16];
    sub_22C983DB0(*(void *)v16, v18, v19);
    *(void *)uint64_t v15 = v17;
    *((void *)v15 + 1) = v18;
    v15[16] = v19;
  }
  return a1;
}

id sub_22C983DB0(uint64_t a1, void *a2, char a3)
{
  if (a3) {
    return a2;
  }
  else {
    return (id)swift_retain();
  }
}

void destroy for ManageStorageView(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_22C9A1FE8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = *(void *)v6;
  uint64_t v8 = *(void **)(v6 + 8);
  char v9 = *(unsigned char *)(v6 + 16);
  sub_22C983AAC(v7, v8, v9);
}

void *initializeWithCopy for ManageStorageView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  char v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)((char *)a2 + v8);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_22C9A1FE8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    void *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  uint64_t v16 = (void *)*((void *)v14 + 1);
  char v17 = v14[16];
  sub_22C983DB0(*(void *)v14, v16, v17);
  *(void *)uint64_t v13 = v15;
  *((void *)v13 + 1) = v16;
  v13[16] = v17;
  return a1;
}

void *assignWithCopy for ManageStorageView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_22C8BE0DC((uint64_t)a1 + v6, &qword_2684D3A78);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_22C9A1FE8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = (void *)*((void *)v12 + 1);
  char v15 = v12[16];
  sub_22C983DB0(*(void *)v12, v14, v15);
  uint64_t v16 = *(void *)v11;
  char v17 = (void *)*((void *)v11 + 1);
  char v18 = v11[16];
  *(void *)uint64_t v11 = v13;
  *((void *)v11 + 1) = v14;
  v11[16] = v15;
  sub_22C983AAC(v16, v17, v18);
  return a1;
}

_OWORD *initializeWithTake for ManageStorageView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_22C9A1FE8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  return a1;
}

void *assignWithTake for ManageStorageView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    sub_22C8BE0DC((uint64_t)a1 + v8, &qword_2684D3A78);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_22C9A1FE8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (char *)a1 + v13;
  char v15 = (char *)a2 + v13;
  char v16 = v15[16];
  uint64_t v17 = *(void *)v14;
  char v18 = (void *)*((void *)v14 + 1);
  char v19 = v14[16];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  v14[16] = v16;
  sub_22C983AAC(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManageStorageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C984348);
}

uint64_t sub_22C984348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B80);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ManageStorageView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C984410);
}

uint64_t sub_22C984410(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3B80);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_22C9844BC()
{
  sub_22C98455C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22C98455C()
{
  if (!qword_2684D3B88)
  {
    sub_22C9A1FE8();
    unint64_t v0 = sub_22C9A1F38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2684D3B88);
    }
  }
}

unint64_t sub_22C9845B8()
{
  unint64_t result = qword_2684D3B90;
  if (!qword_2684D3B90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3B98);
    sub_22C9828E8();
    sub_22C982C84((unint64_t *)&qword_2684D3480, &qword_2684D3470, &qword_2684D26F0, &qword_2684D26F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3B90);
  }
  return result;
}

uint64_t sub_22C984654(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVyAA13DismissActionVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_2684D3B18, &qword_2684D3B10);
}

uint64_t sub_22C984668(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVyAA13DismissActionVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_2684D3B08, &qword_2684D3B00);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVyAA13DismissActionVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for ICloudQuotaManageStorageModelKey()
{
  return &type metadata for ICloudQuotaManageStorageModelKey;
}

ValueMetadata *type metadata accessor for ICloudQuotaSheetDismissKey()
{
  return &type metadata for ICloudQuotaSheetDismissKey;
}

uint64_t sub_22C984734(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22C98479C()
{
  uint64_t v1 = type metadata accessor for ManageStorageAlertButton(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v6 = sub_22C9A1EE8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  if (*(void *)(v0 + v3 + *(int *)(v1 + 28))) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22C9848F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22C984960()
{
  uint64_t v1 = type metadata accessor for ManageStorageAlertButton(0);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = (uint64_t (**)(void))(v0
                          + *(int *)(result + 36)
                          + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  if (*v4) {
    return (*v4)();
  }
  return result;
}

void sub_22C9849D4(uint64_t *a1@<X8>)
{
}

uint64_t sub_22C9849DC()
{
  uint64_t v1 = type metadata accessor for ManageStorageView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_22C9A1FE8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_22C983AAC(*(void *)(v0 + v3 + *(int *)(v1 + 28)), *(void **)(v0 + v3 + *(int *)(v1 + 28) + 8), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 28) + 16));
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22C984B2C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for ManageStorageView();
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  return sub_22C981D10(a1, v5, v6, a2);
}

uint64_t sub_22C984BB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C984BE0(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_22C984C20(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_22C984C60()
{
  unint64_t result = qword_2684D3BE0;
  if (!qword_2684D3BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3BE0);
  }
  return result;
}

void sub_22C984CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    swift_retain();
    sub_22C984BE0(a3);
  }
}

void sub_22C984D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    swift_release();
    sub_22C984C20(a3);
  }
}

unint64_t sub_22C984D6C()
{
  return sub_22C8CE388(MEMORY[0x263F8EE78]);
}

unint64_t sub_22C984D78(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v10 = sub_22C9A3FA8();
  uint64_t v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_22C8BDE5C(v16, (uint64_t)v9, a2);
    unint64_t result = sub_22C986EB4((uint64_t)v9);
    if (v19) {
      break;
    }
    unint64_t v20 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v21 = v11[6];
    uint64_t v22 = sub_22C9A3308();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v20, v9, v22);
    *(void *)(v11[7] + 8 * v2__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)&v9[v13];
    uint64_t v23 = v11[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
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

uint64_t sub_22C984F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[39] = a7;
  v8[40] = a8;
  v8[37] = a4;
  v8[38] = a6;
  v8[35] = a2;
  v8[36] = a3;
  v8[34] = a1;
  uint64_t v9 = sub_22C9A1AA8();
  v8[41] = v9;
  v8[42] = *(void *)(v9 - 8);
  v8[43] = swift_task_alloc();
  v8[44] = swift_task_alloc();
  v8[45] = swift_task_alloc();
  uint64_t v10 = sub_22C9A3218();
  v8[46] = v10;
  v8[47] = *(void *)(v10 - 8);
  v8[48] = swift_task_alloc();
  v8[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A48);
  v8[50] = swift_task_alloc();
  uint64_t v11 = sub_22C9A3298();
  v8[51] = v11;
  v8[52] = *(void *)(v11 - 8);
  v8[53] = swift_task_alloc();
  v8[54] = swift_task_alloc();
  uint64_t v12 = sub_22C9A32E8();
  v8[55] = v12;
  v8[56] = *(void *)(v12 - 8);
  v8[57] = swift_task_alloc();
  v8[58] = swift_task_alloc();
  sub_22C9A3328();
  v8[59] = swift_task_alloc();
  uint64_t v13 = sub_22C9A3208();
  v8[60] = v13;
  v8[61] = *(void *)(v13 - 8);
  v8[62] = swift_task_alloc();
  v8[63] = swift_task_alloc();
  uint64_t v14 = sub_22C9A3118();
  v8[64] = v14;
  v8[65] = *(void *)(v14 - 8);
  v8[66] = swift_task_alloc();
  uint64_t v15 = sub_22C9A3138();
  v8[67] = v15;
  v8[68] = *(void *)(v15 - 8);
  v8[69] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C985318, 0, 0);
}

uint64_t sub_22C985318()
{
  uint64_t v1 = sub_22C9615D4((uint64_t)*(id *)(v0 + 312));
  uint64_t v3 = v2;
  *(void *)(v0 + 56__isPlatformVersionAtLeast(2, 18, 1, 0) = v1;
  *(void *)(v0 + 568) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 576) = v4;
  void *v4 = v0;
  v4[1] = sub_22C9853CC;
  return sub_22C961618(v1, v3);
}

uint64_t sub_22C9853CC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 584) = a1;
  *(void *)(v3 + 592) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_22C9867D0;
  }
  else
  {
    uint64_t v4 = sub_22C9854F0;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_22C9854F0(uint64_t a1)
{
  int64_t v63 = 0;
  unint64_t v66 = (_OWORD *)(v1 + 64);
  uint64_t v56 = (_OWORD *)(v1 + 152);
  uint64_t v2 = *(void *)(v1 + 584);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v57 = v2 + 64;
  uint64_t v60 = v2;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v60 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & v3;
  int64_t v58 = (unint64_t)(63 - v5) >> 6;
  uint64_t v7 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v63 << 6);
LABEL_8:
      uint64_t v11 = (void *)(*(void *)(v60 + 48) + 16 * v10);
      uint64_t v12 = v11[1];
      *(void *)(v1 + 64) = *v11;
      *(void *)(v1 + 72) = v12;
      sub_22C8BA924(*(void *)(v60 + 56) + 32 * v10, v1 + 80);
      swift_bridgeObjectRetain();
      goto LABEL_27;
    }
    int64_t v13 = v63 + 1;
    if (__OFADD__(v63, 1)) {
      goto LABEL_51;
    }
    if (v13 < v58)
    {
      unint64_t v14 = *(void *)(v57 + 8 * v13);
      if (v14) {
        goto LABEL_12;
      }
      int64_t v15 = v63 + 2;
      ++v63;
      if (v13 + 1 < v58)
      {
        unint64_t v14 = *(void *)(v57 + 8 * v15);
        if (v14) {
          goto LABEL_15;
        }
        int64_t v63 = v13 + 1;
        if (v13 + 2 < v58)
        {
          unint64_t v14 = *(void *)(v57 + 8 * (v13 + 2));
          if (v14)
          {
            v13 += 2;
LABEL_12:
            unint64_t v6 = (v14 - 1) & v14;
            unint64_t v10 = __clz(__rbit64(v14)) + (v13 << 6);
            int64_t v63 = v13;
            goto LABEL_8;
          }
          int64_t v15 = v13 + 3;
          int64_t v63 = v13 + 2;
          if (v13 + 3 < v58)
          {
            unint64_t v14 = *(void *)(v57 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                int64_t v13 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_52;
                }
                if (v13 >= v58)
                {
                  int64_t v63 = v58 - 1;
                  goto LABEL_26;
                }
                unint64_t v14 = *(void *)(v57 + 8 * v13);
                ++v15;
                if (v14) {
                  goto LABEL_12;
                }
              }
            }
LABEL_15:
            int64_t v13 = v15;
            goto LABEL_12;
          }
        }
      }
    }
LABEL_26:
    unint64_t v6 = 0;
    *(_OWORD *)(v1 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(v1 + 96) = 0u;
    *unint64_t v66 = 0u;
LABEL_27:
    sub_22C962E8C((uint64_t)v66, v1 + 16);
    uint64_t v16 = *(void *)(v1 + 24);
    if (!v16) {
      break;
    }
    uint64_t v17 = *(void *)(v1 + 16);
    sub_22C8CEC24((_OWORD *)(v1 + 32), (_OWORD *)(v1 + 216));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v20 = sub_22C8F3BF8(v17, v16);
    uint64_t v21 = v7[2];
    BOOL v22 = (v19 & 1) == 0;
    a1 = v21 + v22;
    if (__OFADD__(v21, v22))
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      return MEMORY[0x270F46548](a1);
    }
    char v23 = v19;
    if (v7[3] >= a1)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v19) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_22C905760();
        if (v23) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_22C905238(a1, isUniquelyReferenced_nonNull_native);
      unint64_t v24 = sub_22C8F3BF8(v17, v16);
      if ((v23 & 1) != (v25 & 1))
      {
        return sub_22C9A4128();
      }
      unint64_t v20 = v24;
      if (v23)
      {
LABEL_4:
        uint64_t v8 = (_OWORD *)(v7[7] + 32 * v20);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
        sub_22C8CEC24((_OWORD *)(v1 + 216), v8);
        goto LABEL_5;
      }
    }
    v7[(v20 >> 6) + 8] |= 1 << v20;
    uint64_t v26 = (uint64_t *)(v7[6] + 16 * v20);
    uint64_t *v26 = v17;
    v26[1] = v16;
    a1 = (uint64_t)sub_22C8CEC24((_OWORD *)(v1 + 216), (_OWORD *)(v7[7] + 32 * v20));
    uint64_t v27 = v7[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_50;
    }
    v7[2] = v29;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    a1 = swift_bridgeObjectRelease();
  }
  uint64_t v30 = *(void *)(v1 + 552);
  uint64_t v31 = *(void *)(v1 + 544);
  uint64_t v32 = *(void *)(v1 + 528);
  uint64_t v33 = *(void *)(v1 + 520);
  uint64_t v61 = *(void *)(v1 + 536);
  uint64_t v59 = *(void *)(v1 + 512);
  uint64_t v64 = *(void *)(v1 + 320);
  uint64_t v35 = *(void *)(v1 + 288);
  uint64_t v34 = *(void *)(v1 + 296);
  uint64_t v37 = *(void *)(v1 + 272);
  uint64_t v36 = *(void *)(v1 + 280);
  swift_release();
  *(void *)(v1 + 208) = MEMORY[0x263F8D310];
  *(void *)(v1 + 184) = v35;
  *(void *)(v1 + 192) = v34;
  sub_22C8CEC24((_OWORD *)(v1 + 184), v56);
  swift_bridgeObjectRetain();
  char v38 = swift_isUniquelyReferenced_nonNull_native();
  sub_22C905538(v56, 0x79546E6F69746361, 0xEA00000000006570, v38);
  swift_bridgeObjectRelease();
  uint64_t v39 = MEMORY[0x263F8EE78];
  sub_22C984D78(MEMORY[0x263F8EE78], &qword_2684D3C28, (uint64_t *)&unk_2684D3C30);
  sub_22C984D78(v39, &qword_2684D3C08, &qword_2684D3C10);
  sub_22C9A3108();
  MEMORY[0x230F6EE20](v37, v36, 0x6E6F74747562, 0xE600000000000000, v7, v32);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v59);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3BF8);
  unint64_t v40 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_22C9B1320;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v31 + 16))(v41 + v40, v30, v61);
  sub_22C9A3318();
  sub_22C9A31F8();
  *(void *)(swift_task_alloc() + 16) = v64;
  sub_22C9A32B8();
  swift_task_dealloc();
  uint64_t v42 = sub_22C954FB4();
  swift_beginAccess();
  uint64_t v43 = *v42;
  *(void *)(v1 + 60__isPlatformVersionAtLeast(2, 18, 1, 0) = v43;
  if (v43)
  {
    swift_retain();
    uint64_t v44 = (void *)swift_task_alloc();
    *(void *)(v1 + 608) = v44;
    *uint64_t v44 = v1;
    v44[1] = sub_22C985CB4;
    a1 = *(void *)(v1 + 400);
    return MEMORY[0x270F46548](a1);
  }
  uint64_t v46 = *(void **)(v1 + 568);
  uint64_t v47 = *(void **)(v1 + 560);
  uint64_t v48 = *(void *)(v1 + 544);
  uint64_t v65 = *(void *)(v1 + 536);
  uint64_t v67 = *(void *)(v1 + 552);
  uint64_t v62 = *(void *)(v1 + 504);
  uint64_t v50 = *(void *)(v1 + 480);
  uint64_t v49 = *(void *)(v1 + 488);
  uint64_t v51 = *(void *)(v1 + 464);
  uint64_t v53 = *(void *)(v1 + 440);
  uint64_t v52 = *(void *)(v1 + 448);
  uint64_t v54 = *(void *)(v1 + 400);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v1 + 416) + 56))(v54, 1, 1, *(void *)(v1 + 408));

  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v62, v50);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v67, v65);
  sub_22C9870EC(v54);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v55 = *(uint64_t (**)(void))(v1 + 8);
  return v55();
}

uint64_t sub_22C985CB4()
{
  *(void *)(*(void *)v1 + 616) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_22C98690C;
  }
  else {
    uint64_t v2 = sub_22C985DE4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C985DE4()
{
  uint64_t v15 = v0[61];
  uint64_t v16 = v0[62];
  uint64_t v17 = v0[60];
  uint64_t v18 = v0[63];
  uint64_t v2 = v0[57];
  uint64_t v1 = v0[58];
  uint64_t v3 = v0[55];
  uint64_t v4 = v0[56];
  uint64_t v5 = v0[54];
  uint64_t v14 = v0[53];
  uint64_t v7 = v0[51];
  uint64_t v6 = v0[52];
  uint64_t v8 = v0[50];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v8, v7);
  sub_22C9A3248();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3C00);
  sub_22C9A3098();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22C9AEA30;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_22C9A3088();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v14, v5, v7);
  sub_22C9A3088();
  v0[78] = sub_22C9A3238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v16, v18, v17);
  uint64_t v9 = sub_22C9A30B8();
  uint64_t v10 = MEMORY[0x263F508D0];
  v0[17] = v9;
  v0[18] = v10;
  __swift_allocate_boxed_opaque_existential_1(v0 + 14);
  sub_22C9A30A8();
  swift_dynamicCastClassUnconditional();
  swift_retain();
  v0[79] = sub_22C9A32A8();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 14));
  uint64_t v11 = (void *)swift_task_alloc();
  v0[80] = (uint64_t)v11;
  *uint64_t v11 = v0;
  v11[1] = sub_22C9860F4;
  uint64_t v12 = v0[49];
  return MEMORY[0x270F46548](v12);
}

uint64_t sub_22C9860F4()
{
  *(void *)(*(void *)v1 + 648) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_22C986AB0;
  }
  else {
    uint64_t v2 = sub_22C986208;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C986208()
{
  uint64_t v1 = v0[48];
  uint64_t v2 = v0[46];
  uint64_t v3 = v0[47];
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v1, v0[49], v2);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  if (v4 == *MEMORY[0x263F50978])
  {
    uint64_t v5 = v0[45];
    uint64_t v6 = v0[41];
    uint64_t v7 = v0[42];
    uint64_t v8 = sub_22C8F8FBC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
    uint64_t v9 = sub_22C9A1A98();
    os_log_type_t v10 = sub_22C9A3A78();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_22C821000, v9, v10, "ActionDispatcher.sendActionEvent: performed", v11, 2u);
      MEMORY[0x230F710E0](v11, -1, -1);
    }
    uint64_t v44 = (void *)v0[71];
    uint64_t v12 = (void *)v0[70];
    uint64_t v66 = v0[69];
    uint64_t v62 = v0[68];
    uint64_t v64 = v0[67];
    uint64_t v13 = v0[61];
    uint64_t v58 = v0[60];
    uint64_t v60 = v0[63];
    uint64_t v14 = v0[56];
    uint64_t v54 = v0[55];
    uint64_t v56 = v0[58];
    uint64_t v15 = v0[52];
    uint64_t v50 = v0[51];
    uint64_t v52 = v0[54];
    uint64_t v16 = v0[47];
    uint64_t v46 = v0[46];
    uint64_t v48 = v0[49];
    uint64_t v17 = v0[45];
LABEL_9:
    uint64_t v27 = v0[41];
    uint64_t v26 = v0[42];
    swift_release();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v17, v27);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v48, v46);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v52, v50);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v56, v54);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v60, v58);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v66, v64);
    goto LABEL_13;
  }
  int v18 = v4;
  uint64_t v19 = v0[42];
  int v20 = *MEMORY[0x263F50970];
  uint64_t v21 = sub_22C8F8FBC();
  BOOL v22 = *(void (**)(void, uint64_t, uint64_t))(v19 + 16);
  uint64_t v23 = v0[41];
  if (v18 == v20)
  {
    v22(v0[44], v21, v23);
    uint64_t v9 = sub_22C9A1A98();
    os_log_type_t v24 = sub_22C9A3A78();
    if (os_log_type_enabled(v9, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v25 = 0;
      _os_log_impl(&dword_22C821000, v9, v24, "ActionDispatcher.sendActionEvent: unsupported", v25, 2u);
      MEMORY[0x230F710E0](v25, -1, -1);
    }
    uint64_t v44 = (void *)v0[71];
    uint64_t v12 = (void *)v0[70];
    uint64_t v66 = v0[69];
    uint64_t v62 = v0[68];
    uint64_t v64 = v0[67];
    uint64_t v13 = v0[61];
    uint64_t v58 = v0[60];
    uint64_t v60 = v0[63];
    uint64_t v14 = v0[56];
    uint64_t v54 = v0[55];
    uint64_t v56 = v0[58];
    uint64_t v15 = v0[52];
    uint64_t v50 = v0[51];
    uint64_t v52 = v0[54];
    uint64_t v16 = v0[47];
    uint64_t v46 = v0[46];
    uint64_t v48 = v0[49];
    uint64_t v17 = v0[44];
    goto LABEL_9;
  }
  v22(v0[43], v21, v23);
  BOOL v28 = sub_22C9A1A98();
  os_log_type_t v29 = sub_22C9A3A78();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_22C821000, v28, v29, "ActionDispatcher.sendActionEvent: unknown", v30, 2u);
    MEMORY[0x230F710E0](v30, -1, -1);
  }
  uint64_t v43 = (void *)v0[70];
  uint64_t v45 = (void *)v0[71];
  uint64_t v67 = v0[69];
  uint64_t v63 = v0[68];
  uint64_t v65 = v0[67];
  uint64_t v31 = v0[61];
  uint64_t v57 = v0[60];
  uint64_t v59 = v0[63];
  uint64_t v32 = v0[56];
  uint64_t v53 = v0[55];
  uint64_t v55 = v0[58];
  uint64_t v33 = v28;
  uint64_t v34 = v0[52];
  uint64_t v49 = v0[51];
  uint64_t v51 = v0[54];
  uint64_t v47 = v0[49];
  uint64_t v35 = v0[47];
  uint64_t v61 = v0[48];
  uint64_t v36 = v0[46];
  uint64_t v37 = v0[42];
  uint64_t v38 = v0[43];
  uint64_t v39 = v0[41];
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
  unint64_t v40 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v40(v47, v36);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v51, v49);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v55, v53);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v59, v57);
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v67, v65);
  v40(v61, v36);
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = (uint64_t (*)(void))v0[1];
  return v41();
}

uint64_t sub_22C9867D0()
{
  uint64_t v1 = *(void **)(v0 + 568);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_22C98690C()
{
  uint64_t v1 = *(void **)(v0 + 568);
  uint64_t v12 = *(void *)(v0 + 552);
  uint64_t v2 = *(void *)(v0 + 544);
  uint64_t v3 = *(void *)(v0 + 536);
  uint64_t v4 = *(void *)(v0 + 504);
  uint64_t v5 = *(void *)(v0 + 480);
  uint64_t v6 = *(void *)(v0 + 488);
  uint64_t v7 = *(void *)(v0 + 464);
  uint64_t v9 = *(void *)(v0 + 440);
  uint64_t v8 = *(void *)(v0 + 448);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_22C986AB0()
{
  uint64_t v1 = (void *)v0[71];
  uint64_t v2 = (void *)v0[70];
  uint64_t v3 = v0[68];
  uint64_t v15 = v0[67];
  uint64_t v16 = v0[69];
  uint64_t v4 = v0[61];
  uint64_t v13 = v0[60];
  uint64_t v14 = v0[63];
  uint64_t v5 = v0[56];
  uint64_t v11 = v0[55];
  uint64_t v12 = v0[58];
  uint64_t v6 = v0[54];
  uint64_t v8 = v0[51];
  uint64_t v7 = v0[52];
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v11);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v16, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_22C986C84()
{
  uint64_t v0 = sub_22C9A34C8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - v2;
  uint64_t v4 = sub_22C9A32E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - v6;
  sub_22C9A34B8();
  swift_getWitnessTable();
  sub_22C9A32D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_22C9A40A8();
  swift_allocObject();
  sub_22C9A3888();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v8, v7, v4);
  sub_22C9A38C8();
  sub_22C9A32C8();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_22C986EB4(uint64_t a1)
{
  sub_22C9A3308();
  sub_22C98714C(&qword_2684D3C18);
  uint64_t v2 = sub_22C9A3638();
  return sub_22C986F38(a1, v2);
}

unint64_t sub_22C986F38(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_22C9A3308();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
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
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_22C98714C(&qword_2684D3C20);
      char v15 = sub_22C9A3678();
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

uint64_t sub_22C9870E4()
{
  return sub_22C986C84();
}

uint64_t sub_22C9870EC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3A48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C98714C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22C9A3308();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t (*sub_22C987190())()
{
  return j__swift_endAccess;
}

uint64_t (*sub_22C9871E4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22C987238@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  swift_getKeyPath();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D2728);
  sub_22C90FD5C();
  v19[0] = v3;
  v19[1] = v5;
  v19[2] = v4;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v19);
  swift_retain();
  sub_22C9A2A28();
  swift_release();
  swift_release();
  uint64_t v6 = OpaqueTypeMetadata2;
  uint64_t v7 = OpaqueTypeConformance2;
  __swift_project_boxed_opaque_existential_1(v19, OpaqueTypeMetadata2);
  swift_getKeyPath();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D2880);
  sub_22C914810();
  v16[0] = v6;
  v16[1] = v8;
  v16[2] = v7;
  uint64_t v17 = swift_getOpaqueTypeMetadata2();
  uint64_t v18 = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v16);
  swift_retain();
  sub_22C9A2A28();
  swift_release();
  swift_release();
  uint64_t v9 = v17;
  uint64_t v10 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  swift_getKeyPath();
  uint64_t v11 = sub_22C9A1FE8();
  sub_22C988EC8((unint64_t *)&unk_2684D2CE0, MEMORY[0x263F188C0]);
  v13[0] = v9;
  v13[1] = v11;
  v13[2] = v10;
  uint64_t v14 = swift_getOpaqueTypeMetadata2();
  uint64_t v15 = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(v13);
  swift_retain();
  sub_22C9A2A28();
  swift_release();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v13, v14);
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3240);
  sub_22C94CB70();
  a2[3] = swift_getOpaqueTypeMetadata2();
  a2[4] = swift_getOpaqueTypeConformance2();
  __swift_allocate_boxed_opaque_existential_1(a2);
  swift_retain();
  sub_22C9A2A28();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
}

uint64_t sub_22C987620(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a2;
  uint64_t v3 = sub_22C9A3008();
  uint64_t v20 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C9A3028();
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22C9A1FE8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  sub_22C8C1150();
  uint64_t v12 = (void *)sub_22C9A3AD8();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v13 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v14 + v13, (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_22C988FDC;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C8B9024;
  aBlock[3] = &block_descriptor_27_0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_22C9A3018();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22C988EC8((unint64_t *)&qword_2684D1450, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2B30);
  sub_22C8C6FAC((unint64_t *)&qword_2684D1458, (uint64_t *)&unk_2684D2B30);
  sub_22C9A3CD8();
  MEMORY[0x230F6F810](0, v8, v5, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v8, v19);
}

uint64_t sub_22C9879C0(uint64_t a1)
{
  return sub_22C987620(a1, v1);
}

uint64_t sub_22C9879C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2848);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C9A1FE8();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a2, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  uint64_t v9 = a1 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_dismissAction;
  swift_beginAccess();
  sub_22C8FC6E0((uint64_t)v6, v9, &qword_2684D2848);
  return swift_endAccess();
}

uint64_t sub_22C987B00(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2684D3C40 + dword_2684D3C40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_22C8D6ACC;
  return v5(a1);
}

void sub_22C987BAC(uint64_t a1)
{
  uint64_t v2 = sub_22C9A1FE8();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v24 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1610);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_shouldDismiss;
  swift_beginAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v12, 1, v8))
  {
    int v13 = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
    sub_22C9A1BB8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    int v13 = v26;
  }
  uint64_t v14 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
  uint64_t v15 = sub_22C9A1A98();
  os_log_type_t v16 = sub_22C9A3AA8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 67109120;
    int v26 = v13;
    sub_22C9A3C78();
    _os_log_impl(&dword_22C821000, v15, v16, "Clear Apps Action, dismiss: %{BOOL}d", v17, 8u);
    MEMORY[0x230F710E0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v13)
  {
    uint64_t v18 = a1 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_dismissAction;
    swift_beginAccess();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v18, 1, v2))
    {
      uint64_t v20 = v24;
      uint64_t v19 = v25;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v24, v18, v2);
      sub_22C9A1FD8();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v2);
    }
  }
  swift_beginAccess();
  uint64_t v21 = *(void **)(a1 + 32);
  if (v21)
  {
    BOOL v22 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v21) + 0x118);
    uint64_t v23 = v21;
    v22(1);
  }
}

uint64_t sub_22C988004@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_22C9A3FE8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_22C988058@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_22C9A3FE8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_22C9880B0(uint64_t a1)
{
  unint64_t v2 = sub_22C988A78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22C9880EC(uint64_t a1)
{
  unint64_t v2 = sub_22C988A78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22C988128(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_22C988178(a1);
  return v2;
}

void *sub_22C988178(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D15F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v18 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3C48);
  uint64_t v17 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[2] = 0;
  v1[3] = 0;
  v1[4] = 0;
  uint64_t v9 = (char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_dismissAction;
  uint64_t v10 = sub_22C9A1FE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (uint64_t)v2 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_shouldDismiss;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1610);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22C988A78();
  uint64_t v13 = v19;
  sub_22C9A41C8();
  if (v13)
  {
    swift_release();
  }
  else
  {
    sub_22C8C6FAC(&qword_2684D1618, &qword_2684D1610);
    uint64_t v14 = (uint64_t)v18;
    sub_22C9A4028();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v6);
    swift_beginAccess();
    sub_22C8FC6E0(v14, v11, &qword_2684D15F8);
    swift_endAccess();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v2;
}

uint64_t sub_22C988460()
{
  swift_release();
  swift_release();

  sub_22C8BE0DC(v0 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_dismissAction, &qword_2684D2848);
  sub_22C8BE0DC(v0 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_shouldDismiss, &qword_2684D15F8);
  return v0;
}

uint64_t sub_22C9884C0()
{
  swift_release();
  swift_release();

  sub_22C8BE0DC(v0 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_dismissAction, &qword_2684D2848);
  sub_22C8BE0DC(v0 + OBJC_IVAR____TtC13iCloudQuotaUI27ClearStorageAppsModelAction_shouldDismiss, &qword_2684D15F8);
  return swift_deallocClassInstance();
}

uint64_t sub_22C98855C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2684D3C40 + dword_2684D3C40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_22C8D5C6C;
  return v5(a1);
}

uint64_t sub_22C98860C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22C987238(a1, a2);
}

uint64_t sub_22C988630()
{
  return sub_22C9A1B58();
}

void *sub_22C9886C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_22C988178(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_22C988718(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_22C9A3008();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_22C9A3028();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C988834, 0, 0);
}

uint64_t sub_22C988834()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v12 = v0[15];
  uint64_t v13 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v6 = v0[9];
  uint64_t v5 = v0[10];
  sub_22C8C1150();
  uint64_t v11 = (void *)sub_22C9A3AD8();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  v0[6] = sub_22C988EA8;
  v0[7] = v7;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_22C8EA114;
  v0[5] = &block_descriptor_13;
  uint64_t v8 = _Block_copy(v0 + 2);
  swift_retain();
  swift_retain();
  sub_22C9A3018();
  v0[8] = MEMORY[0x263F8EE78];
  sub_22C988EC8((unint64_t *)&qword_2684D1450, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2B30);
  sub_22C8C6FAC((unint64_t *)&qword_2684D1458, (uint64_t *)&unk_2684D2B30);
  sub_22C9A3CD8();
  MEMORY[0x230F6F810](0, v1, v2, v8);
  _Block_release(v8);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v13);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

unint64_t sub_22C988A78()
{
  unint64_t result = qword_2684DFE90[0];
  if (!qword_2684DFE90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684DFE90);
  }
  return result;
}

uint64_t sub_22C988ACC()
{
  return sub_22C988EC8(qword_2684D3C50, (void (*)(uint64_t))type metadata accessor for ClearStorageAppsModelAction);
}

uint64_t type metadata accessor for ClearStorageAppsModelAction()
{
  uint64_t result = qword_2684E0020;
  if (!qword_2684E0020) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C988B60()
{
  return sub_22C988EC8(&qword_2684D3C70, (void (*)(uint64_t))type metadata accessor for ClearStorageAppsModelAction);
}

uint64_t sub_22C988BA8()
{
  return type metadata accessor for ClearStorageAppsModelAction();
}

void sub_22C988BB0()
{
  sub_22C94DDFC();
  if (v0 <= 0x3F)
  {
    sub_22C8C6A64();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for ClearStorageAppsModelAction.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
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
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22C988D28);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClearStorageAppsModelAction.CodingKeys()
{
  return &type metadata for ClearStorageAppsModelAction.CodingKeys;
}

unint64_t sub_22C988D64()
{
  unint64_t result = qword_2684E01B0[0];
  if (!qword_2684E01B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684E01B0);
  }
  return result;
}

unint64_t sub_22C988DBC()
{
  unint64_t result = qword_2684E02C0;
  if (!qword_2684E02C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684E02C0);
  }
  return result;
}

unint64_t sub_22C988E14()
{
  unint64_t result = qword_2684E02C8[0];
  if (!qword_2684E02C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2684E02C8);
  }
  return result;
}

uint64_t sub_22C988E68()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22C988EA8()
{
  sub_22C987BAC(*(void *)(v0 + 16));
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_22C988EC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C988F10()
{
  uint64_t v1 = sub_22C9A1FE8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22C988FDC()
{
  uint64_t v1 = *(void *)(sub_22C9A1FE8() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_22C9879C8(v2, v3);
}

id sub_22C989048(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82770]), sel_initForTextStyle_, a1);
  id v3 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, a1);
  uint64_t v4 = self;
  objc_msgSend(v3, sel_pointSize);
  id v5 = objc_msgSend(v4, sel_systemFontOfSize_weight_);
  id v6 = objc_msgSend(v2, sel_scaledFontForFont_, v5);

  return v6;
}

id sub_22C989134()
{
  return *(id *)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_titleLabel);
}

id sub_22C989144()
{
  return *(id *)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_subTitleLabel);
}

uint64_t sub_22C989154()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22C9891A0(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_actionButtons);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22C9891F4())()
{
  return j_j__swift_endAccess;
}

id sub_22C989250()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_closeButton);
  swift_beginAccess();
  id v2 = *v1;
  return v2;
}

void sub_22C9892A8(void *a1)
{
}

uint64_t (*sub_22C9892B4())()
{
  return j__swift_endAccess;
}

id sub_22C989310()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_offer);
  swift_beginAccess();
  id v2 = *v1;
  return v2;
}

void sub_22C989368(void *a1)
{
}

uint64_t (*sub_22C989374())()
{
  return j_j__swift_endAccess;
}

id sub_22C9893D0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_bannerSpecification);
  swift_beginAccess();
  id v2 = *v1;
  return v2;
}

void sub_22C989428(void *a1)
{
}

void sub_22C989434(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  id v5 = *v4;
  void *v4 = a1;
}

uint64_t (*sub_22C989484())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22C98953C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate;
  swift_beginAccess();
  return MEMORY[0x230F711D0](v1);
}

uint64_t sub_22C9895DC()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_22C989638@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xE8))();
  *a2 = result;
  return result;
}

uint64_t sub_22C989694(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0xF0);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*sub_22C9896F8(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x230F711D0](v5);
  return sub_22C98977C;
}

void sub_22C98977C(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

unint64_t *ICQBubbleBannerView.__allocating_init(offer:bannerSpecification:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return ICQBubbleBannerView.init(offer:bannerSpecification:)(a1, a2);
}

unint64_t *ICQBubbleBannerView.init(offer:bannerSpecification:)(void *a1, void *a2)
{
  uint64_t v193 = sub_22C9A1AA8();
  *(void *)&long long v192 = *(void *)(v193 - 8);
  MEMORY[0x270FA5388](v193);
  v191 = (unint64_t *)((char *)&v184 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v197 = sub_22C9A3BE8();
  uint64_t v196 = *(void *)(v197 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v197);
  v190 = (char *)&v184 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v195 = (char *)&v184 - v8;
  *(void *)&v2[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_actionButtons] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v2[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_offer] = a1;
  *(void *)&v2[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_bannerSpecification] = a2;
  id v9 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v10 = v2;
  id v11 = a1;
  id v12 = a2;
  id v13 = objc_msgSend(v9, sel_init);
  *(void *)&v10[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_titleLabel] = v13;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  *(void *)&v10[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_subTitleLabel] = v14;
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_init);
  *(void *)&v10[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_closeButton] = v15;

  uint64_t v16 = (objc_class *)type metadata accessor for ICQBubbleBannerView();
  v211.receiver = v10;
  v211.super_class = v16;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v211, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v186 = v11;
  id v18 = objc_msgSend(v11, sel_deviceInfo);
  id v185 = v18;
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = objc_msgSend(v18, sel_key);
    uint64_t v21 = sub_22C9A36C8();
    uint64_t v23 = v22;

    id v24 = objc_msgSend(v19, sel_wordsToReplace);
    uint64_t v25 = sub_22C9A3618();

    unint64_t v26 = sub_22C98B270(v25);
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v23 = (void *)0xE000000000000000;
  }
  unint64_t v26 = sub_22C941BF0(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v198 = OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_titleLabel;
  id v27 = *(id *)&v17[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_titleLabel];
  BOOL v28 = (void *)sub_22C9A3688();
  id v29 = objc_msgSend(v12, sel_titleWithKey_, v28);

  id v201 = v12;
  id v189 = v23;
  v188 = (id *)v21;
  if (v29)
  {
    uint64_t v30 = sub_22C9A36C8();

    uint64_t v31 = sub_22C98B630(v26, v30);
    uint64_t v33 = v32;
    swift_bridgeObjectRelease();
    unint64_t aBlock = v31;
    uint64_t v204 = v33;
    sub_22C8D6A18();
    sub_22C9A3C98();
    swift_bridgeObjectRelease();
    id v29 = (id)sub_22C9A3688();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v27, sel_setText_, v29);

  uint64_t v34 = v198;
  uint64_t v35 = *(void **)&v17[v198];
  uint64_t v36 = *MEMORY[0x263F83590];
  id v37 = objc_allocWithZone(MEMORY[0x263F82770]);
  id v38 = v35;
  id v39 = objc_msgSend(v37, sel_initForTextStyle_, v36);
  id v40 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, v36);
  uint64_t v41 = self;
  objc_msgSend(v40, sel_pointSize);
  id v187 = v41;
  id v42 = objc_msgSend(v41, sel_systemFontOfSize_weight_);
  id v43 = objc_msgSend(v39, sel_scaledFontForFont_, v42);
  v202 = v17;
  id v44 = v43;

  objc_msgSend(v38, sel_setFont_, v44);
  uint64_t v45 = *(void **)&v202[v34];
  uint64_t v46 = self;
  id v47 = v45;
  id v48 = objc_msgSend(v46, sel_secondaryLabelColor);
  objc_msgSend(v47, sel_setTextColor_, v48);

  uint64_t v49 = *(void **)&v202[v34];
  objc_msgSend(v49, sel_setNumberOfLines_, 0);
  objc_msgSend(v49, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v49, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v50, sel_addSubview_, v49);
  uint64_t v51 = self;
  id v199 = (id)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2B10);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_22C9B17B0;
  id v53 = objc_msgSend(v49, sel_topAnchor);
  id v54 = objc_msgSend(v50, sel_topAnchor);
  id v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v54);

  *(void *)(v52 + 32) = v55;
  id v56 = objc_msgSend(*(id *)&v202[v34], sel_bottomAnchor);
  id v57 = objc_msgSend(v50, sel_bottomAnchor);
  id v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v57);

  *(void *)(v52 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v58;
  id v59 = objc_msgSend(*(id *)&v202[v34], sel_leadingAnchor);
  id v60 = objc_msgSend(v50, sel_leadingAnchor);
  id v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v60);

  *(void *)(v52 + 48) = v61;
  id v62 = objc_msgSend(*(id *)&v202[v34], sel_trailingAnchor);
  id v200 = v50;
  id v63 = objc_msgSend(v50, sel_trailingAnchor);
  id v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_constant_, v63, -16.0);

  *(void *)(v52 + 56) = v64;
  unint64_t aBlock = v52;
  sub_22C9A3878();
  uint64_t v65 = v202;
  sub_22C8BA084(0, &qword_2684D2CD0);
  uint64_t v66 = (void *)sub_22C9A3848();
  swift_bridgeObjectRelease();
  objc_msgSend(v51, sel_activateConstraints_, v66);

  uint64_t v67 = OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_subTitleLabel;
  id v68 = *(id *)&v65[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_subTitleLabel];
  unint64_t v69 = (void *)sub_22C9A3688();
  swift_bridgeObjectRelease();
  id v70 = v201;
  id v71 = objc_msgSend(v201, sel_messageWithKey_, v69);

  if (v71)
  {
    uint64_t v72 = sub_22C9A36C8();

    sub_22C98B630(v26, v72);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v71 = (id)sub_22C9A3688();
  }
  uint64_t v73 = v192;
  uint64_t v74 = v191;
  swift_bridgeObjectRelease();
  objc_msgSend(v68, sel_setText_, v71);

  uint64_t v75 = *(void **)&v65[v67];
  objc_msgSend(v75, sel_setNumberOfLines_, 0);
  uint64_t v76 = *MEMORY[0x263F835F0];
  id v77 = v75;
  id v78 = objc_msgSend(v187, sel_preferredFontForTextStyle_, v76);
  objc_msgSend(v77, sel_setFont_, v78);

  id v79 = *(id *)&v65[v67];
  id v80 = objc_msgSend(v46, sel_labelColor);
  objc_msgSend(v79, sel_setTextColor_, v80);

  objc_msgSend(*(id *)&v65[v67], sel_setAdjustsFontForContentSizeCategory_, 1);
  uint64_t v81 = v195;
  sub_22C9A3BD8();
  id v82 = objc_msgSend(self, sel_configurationWithPointSize_, 14.0);
  uint64_t v83 = (void *)sub_22C9A3688();
  id v84 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v83, v82);

  sub_22C9A3BC8();
  id v85 = objc_msgSend(v46, sel_tertiaryLabelColor);
  sub_22C9A3BA8();
  sub_22C9A3B98();
  sub_22C8BA084(0, &qword_2684D3CB0);
  (*(void (**)(char *, char *, uint64_t))(v196 + 16))(v190, v81, v197);
  uint64_t v86 = sub_22C9A3BF8();
  long long v87 = (void **)&v65[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_closeButton];
  swift_beginAccess();
  uint64_t v88 = *v87;
  v188 = v87;
  *long long v87 = (void *)v86;

  id v89 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  objc_msgSend(v89, sel_setContentMode_, 2);
  id v90 = objc_msgSend(v70, sel_iconSpecification);
  uint64_t v91 = v193;
  if (!v90) {
    goto LABEL_14;
  }
  uint64_t v92 = v90;
  id v93 = objc_msgSend(v90, sel_imageURL);
  if (!v93)
  {

LABEL_14:
    uint64_t v99 = sub_22C8F8FBC();
    (*(void (**)(unint64_t *, uint64_t, uint64_t))(v73 + 16))(v74, v99, v91);
    uint64_t v100 = sub_22C9A1A98();
    os_log_type_t v101 = sub_22C9A3A88();
    if (os_log_type_enabled(v100, v101))
    {
      uint64_t v102 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v102 = 0;
      _os_log_impl(&dword_22C821000, v100, v101, "No iconSpecification found on offer, falling back to default", v102, 2u);
      MEMORY[0x230F710E0](v102, -1, -1);
    }

    (*(void (**)(unint64_t *, uint64_t))(v73 + 8))(v74, v91);
    goto LABEL_17;
  }
  uint64_t v94 = v93;
  uint64_t v95 = self;
  uint64_t v96 = swift_allocObject();
  *(void *)(v96 + 16) = v89;
  v207 = sub_22C98D6A8;
  uint64_t v208 = v96;
  unint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v204 = 1107296256;
  v205 = sub_22C98B83C;
  v206 = &block_descriptor_14;
  uint64_t v97 = _Block_copy(&aBlock);
  id v98 = v89;
  swift_release();
  objc_msgSend(v95, sel_fetchIconFromImageURL_completion_, v94, v97);
  _Block_release(v97);

LABEL_17:
  id v103 = objc_msgSend(v89, sel_widthAnchor);
  id v104 = objc_msgSend(v103, sel_constraintEqualToConstant_, 60.0);

  objc_msgSend(v104, sel_setActive_, 1);
  id v105 = objc_msgSend(v89, sel_heightAnchor);
  id v106 = objc_msgSend(v105, sel_constraintEqualToConstant_, 60.0);

  objc_msgSend(v106, sel_setActive_, 1);
  id v107 = objc_msgSend(v70, sel_links);
  uint64_t v193 = sub_22C8BA084(0, &qword_2684D3CB8);
  unint64_t v108 = sub_22C9A3858();

  unint64_t aBlock = MEMORY[0x263F8EE78];
  uint64_t v194 = v67;
  if (v108 >> 62) {
    goto LABEL_58;
  }
  uint64_t v109 = *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    id v110 = v200;
    if (v109)
    {
      if (v109 < 1)
      {
        __break(1u);
        goto LABEL_62;
      }
      for (uint64_t i = 0; i != v109; ++i)
      {
        if ((v108 & 0xC000000000000001) != 0) {
          id v112 = (id)MEMORY[0x230F6FB60](i, v108);
        }
        else {
          id v112 = *(id *)(v108 + 8 * i + 32);
        }
        unint64_t v113 = v112;
        if (objc_msgSend(v112, sel_action) == (id)125)
        {
        }
        else
        {
          sub_22C9A3E98();
          sub_22C9A3EC8();
          sub_22C9A3ED8();
          sub_22C9A3EA8();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v114 = aBlock;
      id v110 = v200;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v114 = MEMORY[0x263F8EE78];
    }
    uint64_t v74 = v65;
    uint64_t v115 = sub_22C98D3E0(v114, v74);
    swift_release();

    uint64_t v116 = (uint64_t *)((char *)v74 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_actionButtons);
    swift_beginAccess();
    *uint64_t v116 = v115;
    swift_bridgeObjectRelease();
    uint64_t v117 = swift_allocObject();
    long long v192 = xmmword_22C9B3010;
    *(_OWORD *)(v117 + 16) = xmmword_22C9B3010;
    *(void *)(v117 + 32) = v110;
    unint64_t v108 = *(void *)&v65[v194];
    *(void *)(v117 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v108;
    uint64_t v210 = v117;
    sub_22C9A3878();
    uint64_t v118 = (char *)v210;
    v191 = (unint64_t *)v116;
    unint64_t v119 = *v116;
    if (v119)
    {
      if (!(v119 >> 62))
      {
        swift_bridgeObjectRetain_n();
        id v120 = v110;
        id v121 = (id)v108;
        sub_22C9A40D8();
        sub_22C8BA084(0, &qword_2684D3CC0);
        unint64_t v122 = v119;
LABEL_34:
        swift_bridgeObjectRelease();
        sub_22C98C394(v122);
        uint64_t v118 = (char *)v210;
        goto LABEL_36;
      }
LABEL_62:
      sub_22C8BA084(0, &qword_2684D3CC0);
      id v182 = v110;
      id v183 = (id)v108;
      swift_bridgeObjectRetain();
      unint64_t v122 = sub_22C9A3F68();
      goto LABEL_34;
    }
    id v123 = v110;
    id v124 = (id)v108;
LABEL_36:
    id v125 = objc_allocWithZone(MEMORY[0x263F82BF8]);
    sub_22C8BA084(0, &qword_2684D3CC0);
    swift_bridgeObjectRetain();
    uint64_t v126 = (void *)sub_22C9A3848();
    v190 = v118;
    swift_bridgeObjectRelease();
    id v127 = objc_msgSend(v125, sel_initWithArrangedSubviews_, v126);

    objc_msgSend(v127, sel_setAxis_, 1);
    objc_msgSend(v127, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v127, sel_setSpacing_, 4.0);
    objc_msgSend(v127, sel_setDistribution_, 3);
    id v128 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
    objc_msgSend(v128, sel_setAxis_, 0);
    objc_msgSend(v128, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v189 = v128;
    objc_msgSend(v128, sel_setAlignment_, 1);
    uint64_t v129 = swift_allocObject();
    *(_OWORD *)(v129 + 16) = v192;
    *(void *)(v129 + 32) = v89;
    *(void *)(v129 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v127;
    uint64_t v209 = v129;
    sub_22C9A3878();
    id v130 = objc_allocWithZone(MEMORY[0x263F82BF8]);
    *(void *)&long long v192 = v89;
    id v199 = v127;
    os_log_type_t v131 = (void *)sub_22C9A3848();
    swift_bridgeObjectRelease();
    id v132 = objc_msgSend(v130, sel_initWithArrangedSubviews_, v131);

    objc_msgSend(v132, sel_setAxis_, 0);
    objc_msgSend(v132, sel_setSpacing_, 10.0);
    objc_msgSend(v132, sel_setAlignment_, 3);
    objc_msgSend(v132, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v74, sel_addSubview_, v132);
    id v133 = objc_msgSend(v132, sel_topAnchor);
    id v134 = objc_msgSend(v74, sel_topAnchor);
    id v135 = objc_msgSend(v133, sel_constraintEqualToAnchor_constant_, v134, 16.0);

    objc_msgSend(v135, sel_setActive_, 1);
    id v136 = objc_msgSend(v132, sel_leadingAnchor);
    id v137 = objc_msgSend(v74, sel_leadingAnchor);
    id v138 = objc_msgSend(v136, sel_constraintEqualToAnchor_constant_, v137, 18.0);

    objc_msgSend(v138, sel_setActive_, 1);
    id v139 = objc_msgSend(v132, sel_trailingAnchor);
    id v140 = objc_msgSend(v74, sel_trailingAnchor);
    id v141 = objc_msgSend(v139, sel_constraintEqualToAnchor_constant_, v140, -16.0);

    objc_msgSend(v141, sel_setActive_, 1);
    id v142 = objc_msgSend(v132, sel_bottomAnchor);
    id v143 = objc_msgSend(v74, sel_bottomAnchor);
    id v144 = objc_msgSend(v142, sel_constraintEqualToAnchor_constant_, v143, -16.0);

    objc_msgSend(v144, sel_setActive_, 1);
    id v145 = objc_msgSend(v201, sel_links);
    unint64_t v146 = sub_22C9A3858();

    if (v146 >> 62) {
      break;
    }
    uint64_t v147 = *(void *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v147) {
      goto LABEL_45;
    }
LABEL_38:
    unint64_t v108 = v146 & 0xC000000000000001;
    uint64_t v148 = 4;
    while (1)
    {
      id v149 = v108 ? (id)MEMORY[0x230F6FB60](v148 - 4, v146) : *(id *)(v146 + 8 * v148);
      id v89 = v149;
      uint64_t v65 = (char *)(v148 - 3);
      if (__OFADD__(v148 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v149, sel_action) == (id)125)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        sub_22C8BA084(0, &qword_2684D3CD0);
        uint64_t v150 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v151 = swift_allocObject();
        *(void *)(v151 + 16) = v150;
        *(void *)(v151 + 24) = v89;
        id v152 = v89;
        long long v153 = (void *)sub_22C9A3B88();
        long long v154 = v188;
        objc_msgSend(*v188, sel_addAction_forControlEvents_, v153, 64);
        objc_msgSend(*v154, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        objc_msgSend(v74, sel_addSubview_, *v154);
        id v155 = objc_msgSend(*v154, sel_topAnchor);
        id v156 = objc_msgSend(v74, sel_topAnchor);
        id v157 = objc_msgSend(v155, sel_constraintEqualToAnchor_, v156);

        objc_msgSend(v157, sel_setActive_, 1);
        id v158 = objc_msgSend(*v154, sel_trailingAnchor);
        id v159 = objc_msgSend(v74, sel_trailingAnchor);
        id v160 = objc_msgSend(v158, sel_constraintEqualToAnchor_, v159);

        objc_msgSend(v160, sel_setActive_, 1);
        goto LABEL_47;
      }

      ++v148;
      if (v65 == (char *)v147) {
        goto LABEL_45;
      }
    }
    __break(1u);
LABEL_58:
    swift_bridgeObjectRetain();
    uint64_t v109 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v147 = sub_22C9A3F78();
  if (v147) {
    goto LABEL_38;
  }
LABEL_45:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
LABEL_47:
  objc_msgSend(v74, sel_setIsAccessibilityElement_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3238);
  uint64_t v161 = swift_allocObject();
  *(_OWORD *)(v161 + 16) = xmmword_22C9AEA30;
  long long v162 = v202;
  long long v163 = *(void **)&v202[v198];
  uint64_t v164 = sub_22C8BA084(0, &qword_2684D3CC8);
  *(void *)(v161 + 56) = v164;
  *(void *)(v161 + 32) = v163;
  long long v165 = *(void **)&v162[v194];
  *(void *)(v161 + 88) = v164;
  *(void *)(v161 + 64) = v165;
  long long v166 = v74;
  id v167 = v163;
  id v168 = v165;
  v169 = (void *)sub_22C9A3848();
  swift_bridgeObjectRelease();
  objc_msgSend(v166, sel_setAccessibilityElements_, v169);

  unint64_t v170 = *v191;
  id v171 = v201;
  if (!*v191)
  {

    goto LABEL_55;
  }
  v172 = v166;
  swift_bridgeObjectRetain();
  id v173 = objc_msgSend(v172, sel_accessibilityElements);
  if (v173)
  {
    uint64_t v174 = v173;
    uint64_t v175 = sub_22C9A3858();

    uint64_t v209 = v175;
    v176 = sub_22C98C130(v170);
    swift_bridgeObjectRelease();
    sub_22C98C560(v176);
    if (v209)
    {
      v177 = (void *)sub_22C9A3848();
      swift_bridgeObjectRelease();
    }
    else
    {
      v177 = 0;
    }
    id v178 = v189;
    id v179 = v199;
    v180 = (void *)v192;
    objc_msgSend(v172, sel_setAccessibilityElements_, v177);

LABEL_55:
    (*(void (**)(char *, uint64_t))(v196 + 8))(v195, v197);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v209 = 0;
    objc_msgSend(v172, sel_setAccessibilityElements_, 0);

    (*(void (**)(char *, uint64_t))(v196 + 8))(v195, v197);
    swift_bridgeObjectRelease();
  }
  return v166;
}

uint64_t type metadata accessor for ICQBubbleBannerView()
{
  return self;
}

unint64_t sub_22C98B270(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2F40);
    uint64_t v2 = sub_22C9A3FA8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v25 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  unint64_t v26 = (void *)v2;
  uint64_t v23 = v2 + 64;
  int64_t v24 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v11 = (v5 - 1) & v5;
      unint64_t v12 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v13 = v7;
    }
    else
    {
      int64_t v14 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v24)
      {
LABEL_36:
        sub_22C91F4B8();
        return (unint64_t)v26;
      }
      unint64_t v15 = *(void *)(v25 + 8 * v14);
      int64_t v13 = v7 + 1;
      if (!v15)
      {
        int64_t v13 = v7 + 2;
        if (v7 + 2 >= v24) {
          goto LABEL_36;
        }
        unint64_t v15 = *(void *)(v25 + 8 * v13);
        if (!v15)
        {
          int64_t v13 = v7 + 3;
          if (v7 + 3 >= v24) {
            goto LABEL_36;
          }
          unint64_t v15 = *(void *)(v25 + 8 * v13);
          if (!v15)
          {
            int64_t v13 = v7 + 4;
            if (v7 + 4 >= v24) {
              goto LABEL_36;
            }
            unint64_t v15 = *(void *)(v25 + 8 * v13);
            if (!v15)
            {
              int64_t v16 = v7 + 5;
              if (v7 + 5 >= v24) {
                goto LABEL_36;
              }
              unint64_t v15 = *(void *)(v25 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  int64_t v13 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_41;
                  }
                  if (v13 >= v24) {
                    goto LABEL_36;
                  }
                  unint64_t v15 = *(void *)(v25 + 8 * v13);
                  ++v16;
                  if (v15) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v13 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v11 = (v15 - 1) & v15;
      unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
    }
    sub_22C96D3E4(*(void *)(a1 + 48) + 40 * v12, (uint64_t)v33);
    sub_22C8BA924(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_22C96D3E4((uint64_t)v30, (uint64_t)v29);
    if (!swift_dynamicCast())
    {
      sub_22C98D800((uint64_t)v30);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_22C91F4B8();
      swift_release();
      return 0;
    }
    sub_22C8BA924((uint64_t)v31 + 8, (uint64_t)v29);
    sub_22C98D800((uint64_t)v30);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    unint64_t result = sub_22C8F3BF8(v27, v28);
    if (v17)
    {
      uint64_t v8 = 16 * result;
      id v9 = (uint64_t *)(v26[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v9 = v27;
      v9[1] = v28;
      uint64_t v10 = (uint64_t *)(v26[7] + v8);
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v10 = v27;
      v10[1] = v28;
      goto LABEL_8;
    }
    if (v26[2] >= v26[3]) {
      break;
    }
    *(void *)(v23 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v18 = (uint64_t *)(v26[6] + 16 * result);
    *id v18 = v27;
    v18[1] = v28;
    uint64_t v19 = (uint64_t *)(v26[7] + 16 * result);
    *uint64_t v19 = v27;
    v19[1] = v28;
    uint64_t v20 = v26[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_39;
    }
    void v26[2] = v22;
LABEL_8:
    int64_t v7 = v13;
    unint64_t v5 = v11;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_22C98B630(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v9 >= v6) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      int64_t v8 = v9 + 1;
      if (v9 + 1 >= v6) {
        goto LABEL_21;
      }
      uint64_t v10 = *(void *)(v12 + 8 * v8);
      if (!v10)
      {
        int64_t v8 = v9 + 2;
        if (v9 + 2 >= v6) {
          goto LABEL_21;
        }
        uint64_t v10 = *(void *)(v12 + 8 * v8);
        if (!v10) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v5 = (v10 - 1) & v10;
LABEL_5:
    sub_22C8D6A18();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2 = sub_22C9A3CA8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v11 = v9 + 3;
  if (v11 >= v6)
  {
LABEL_21:
    swift_release();
    return a2;
  }
  uint64_t v10 = *(void *)(v12 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

void sub_22C98B83C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_22C98B8A8@<X0>(void **a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v32 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3CE8);
  MEMORY[0x270FA5388](v5 - 8);
  int64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22C9A3BE8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)&v31 - v13;
  unint64_t v15 = *a1;
  sub_22C9A3BD8();
  sub_22C9A3B98();
  sub_22C9A1AD8();
  uint64_t v16 = sub_22C9A1AC8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 0, 1, v16);
  sub_22C9A3BB8();
  id result = objc_msgSend(v15, sel_text);
  if (result)
  {
    id v18 = result;
    sub_22C8BA084(0, &qword_2684D3CD0);
    sub_22C9A36C8();

    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = a2;
    *(void *)(v19 + 24) = v15;
    id v20 = a2;
    id v21 = v15;
    uint64_t v22 = (void *)sub_22C9A3B88();
    sub_22C8BA084(0, &qword_2684D3CB0);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    id v23 = v22;
    int64_t v24 = (void *)sub_22C9A3BF8();
    objc_msgSend(v24, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
    id v25 = objc_msgSend(v24, sel_titleLabel);
    if (v25)
    {
      unint64_t v26 = v25;
      objc_msgSend(v25, sel_setNumberOfLines_, 0);
    }
    id v27 = objc_msgSend(v24, sel_titleLabel);
    objc_msgSend(v27, sel_setAdjustsFontForContentSizeCategory_, 1);

    id v28 = objc_msgSend(v24, sel_titleLabel);
    if (v28)
    {
      id v29 = v28;
      objc_msgSend(v28, sel_setLineBreakMode_, 0);
    }
    id v30 = objc_msgSend(self, sel_systemBlueColor);
    objc_msgSend(v24, sel_setTitleColor_forState_, v30, 0);

    objc_msgSend(v24, sel_setContentHorizontalAlignment_, 4);
    id result = (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    *uint64_t v32 = v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22C98BC98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_22C9A1458();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835F0], KeyPath);
  sub_22C98DA00();
  return sub_22C9A1438();
}

uint64_t sub_22C98BD68()
{
  return sub_22C9A3678() & 1;
}

uint64_t sub_22C98BDC4()
{
  return sub_22C9A3658();
}

void sub_22C98BE0C()
{
}

void sub_22C98BE34()
{
}

void sub_22C98BE50(void *a1, void *a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a1) + 0xE8))(v6);
  if (v9)
  {
    unsigned int v10 = objc_msgSend(v9, sel_performActionWith_, a2);
    swift_unknownObjectRelease();
  }
  else
  {
    unsigned int v10 = 0;
  }
  uint64_t v11 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v11, v4);
  id v12 = a2;
  uint64_t v13 = sub_22C9A1A98();
  os_log_type_t v14 = sub_22C9A3A78();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v23 = v4;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v15 = 67109378;
    LODWORD(v24) = v10;
    sub_22C9A3C78();
    *(_WORD *)(v15 + 8) = 2080;
    id v16 = objc_msgSend(v12, sel_text);
    if (v16)
    {
      char v17 = v16;
      uint64_t v18 = sub_22C9A36C8();
      unint64_t v20 = v19;

      uint64_t v24 = sub_22C8BA27C(v18, v20, &v25);
      sub_22C9A3C78();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22C821000, v13, v14, "Bubble banner action performed: %{BOOL}d, for link: %s", (uint8_t *)v15, 0x12u);
      uint64_t v21 = v22;
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v21, -1, -1);
      MEMORY[0x230F710E0](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v23);
    }
    else
    {

      __break(1u);
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

char *sub_22C98C130(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  id result = sub_22C94B88C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x230F6FB60](i, a1);
        sub_22C8BA084(0, &qword_2684D3CB0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22C94B88C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_22C94B88C((char *)(v6 > 1), v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_22C8CEC24(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_22C8BA084(0, &qword_2684D3CB0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22C94B88C(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_22C94B88C((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_22C8CEC24(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_22C98C394(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x230F6FB70](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_22C98D0E4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x1__isPlatformVersionAtLeast(2, 18, 1, 0) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_22C9A3878();
}

void *sub_22C98C560(void *result)
{
  unint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v1 = v3;
  if (!result || (int64_t v7 = v3[3] >> 1, v7 < v5))
  {
    if (v4 <= v5) {
      int64_t v8 = v4 + v2;
    }
    else {
      int64_t v8 = v4;
    }
    uint64_t result = sub_22C98CFD4(result, v8, 1, v3);
    uint64_t v3 = result;
    *(void *)uint64_t v1 = result;
    int64_t v7 = result[3] >> 1;
  }
  uint64_t v9 = v3[2];
  uint64_t v10 = v7 - v9;
  unint64_t v11 = v6[2];
  if (v11)
  {
    if (v10 < (uint64_t)v11)
    {
      __break(1u);
      goto LABEL_25;
    }
    unint64_t v12 = (unint64_t)&v3[4 * v9 + 4];
    if ((unint64_t)(v6 + 4) < v12 + 32 * v11 && v12 < (unint64_t)&v6[4 * v11 + 4]) {
      goto LABEL_26;
    }
    uint64_t result = (void *)swift_arrayInitWithCopy();
    if (v11 >= v2)
    {
      uint64_t v14 = v3[2];
      BOOL v15 = __OFADD__(v14, v11);
      uint64_t v16 = v14 + v11;
      if (!v15)
      {
        v3[2] = v16;
        goto LABEL_19;
      }
LABEL_25:
      __break(1u);
LABEL_26:
      uint64_t result = (void *)sub_22C9A3FB8();
      __break(1u);
      return result;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v2) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (v11 == v10) {
LABEL_23:
  }
    *(void *)uint64_t v1 = v3;
  return result;
}

uint64_t sub_22C98C714(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_actionButtons] = 0;
  uint64_t v2 = (uint64_t)&v1[OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate];
  swift_unknownObjectWeakInit();
  uint64_t v3 = v1;
  swift_bridgeObjectRelease();
  sub_22C98D6D4(v2);

  type metadata accessor for ICQBubbleBannerView();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_22C98C824()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
  id v3 = objc_msgSend(v2, sel_deviceInfo);

  if (!v3) {
    goto LABEL_3;
  }
  id v4 = objc_msgSend(v3, sel_key);
  sub_22C9A36C8();

  id v5 = objc_msgSend(v3, sel_wordsToReplace);
  uint64_t v6 = sub_22C9A3618();

  unint64_t v7 = sub_22C98B270(v6);
  uint64_t v8 = swift_bridgeObjectRelease();
  if (!v7)
  {
LABEL_3:
    unint64_t v7 = sub_22C941BF0(MEMORY[0x263F8EE78]);
    uint64_t v8 = swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void **)((char *)v38 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_titleLabel);
  uint64_t v10 = *(uint64_t (**)(void))((*v1 & *v38) + 0xD0);
  unint64_t v11 = (void *)((uint64_t (*)(uint64_t))v10)(v8);
  unint64_t v12 = (void *)sub_22C9A3688();
  id v13 = objc_msgSend(v11, sel_titleWithKey_, v12);

  if (v13)
  {
    uint64_t v14 = sub_22C9A36C8();

    sub_22C98B630(v7, v14);
    swift_bridgeObjectRelease();
    sub_22C9A3738();
    swift_bridgeObjectRelease();
    id v13 = (id)sub_22C9A3688();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v9, sel_setText_, v13);

  BOOL v15 = *(void **)((char *)v38 + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_subTitleLabel);
  uint64_t v16 = (void *)v10();
  char v17 = (void *)sub_22C9A3688();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_messageWithKey_, v17);

  unint64_t v19 = (void *)MEMORY[0x263F8EED0];
  if (v18)
  {
    uint64_t v20 = sub_22C9A36C8();

    sub_22C98B630(v7, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v18 = (id)sub_22C9A3688();
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setText_, v18);

  uint64_t v21 = (void *)v10();
  id v22 = objc_msgSend(v21, sel_links);

  sub_22C8BA084(0, &qword_2684D3CB8);
  unint64_t v23 = sub_22C9A3858();

  uint64_t v39 = MEMORY[0x263F8EE78];
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v24)
    {
LABEL_10:
      if (v24 < 1) {
        goto LABEL_45;
      }
      for (uint64_t i = 0; i != v24; ++i)
      {
        if ((v23 & 0xC000000000000001) != 0) {
          id v26 = (id)MEMORY[0x230F6FB60](i, v23);
        }
        else {
          id v26 = *(id *)(v23 + 8 * i + 32);
        }
        id v27 = v26;
        if (objc_msgSend(v26, sel_action) == (id)125)
        {
        }
        else
        {
          sub_22C9A3E98();
          sub_22C9A3EC8();
          sub_22C9A3ED8();
          sub_22C9A3EA8();
        }
      }
      uint64_t v28 = swift_bridgeObjectRelease();
      uint64_t v29 = v39;
      if (v39 < 0) {
        goto LABEL_43;
      }
      goto LABEL_23;
    }
  }
  uint64_t v28 = swift_bridgeObjectRelease();
  uint64_t v29 = MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
    goto LABEL_43;
  }
LABEL_23:
  if ((v29 & 0x4000000000000000) != 0) {
    goto LABEL_43;
  }
  uint64_t v30 = *(void *)(v29 + 16);
  do
  {
    if (!v30)
    {
LABEL_38:

      swift_release();
      return;
    }
    unint64_t v31 = 0;
    uint64_t v32 = *(uint64_t (**)(uint64_t))((*v19 & *v38) + 0x88);
    unint64_t v19 = (void *)((*v19 & *v38) + 136);
    while (1)
    {
      uint64_t v28 = v32(v28);
      if (v28) {
        break;
      }
LABEL_29:
      if (v30 == ++v31) {
        goto LABEL_38;
      }
    }
    if ((v28 & 0xC000000000000001) != 0)
    {
      id v36 = (id)MEMORY[0x230F6FB60](v31, v28);
LABEL_35:
      id v37 = v36;
      swift_bridgeObjectRelease();
      if ((v29 & 0xC000000000000001) != 0) {
        id v33 = (id)MEMORY[0x230F6FB60](v31, v29);
      }
      else {
        id v33 = *(id *)(v29 + 8 * v31 + 32);
      }
      uint64_t v34 = v33;
      id v35 = objc_msgSend(v33, sel_text);

      objc_msgSend(v37, sel_setTitle_forState_, v35, 0);
      goto LABEL_29;
    }
    if ((v31 & 0x8000000000000000) == 0)
    {
      if (v31 >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_42;
      }
      id v36 = *(id *)(v28 + 8 * v31 + 32);
      goto LABEL_35;
    }
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_22C9A3F78();
    uint64_t v28 = swift_release();
  }
  while ((v30 & 0x8000000000000000) == 0);
  __break(1u);
LABEL_45:
  __break(1u);
}

id ICQBubbleBannerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ICQBubbleBannerView.init(frame:)()
{
}

id ICQBubbleBannerView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ICQBubbleBannerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_22C98CFD4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3238);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22C98D8BC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22C98D0E4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22C9A3F78();
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
    uint64_t v10 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22C98D860();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3CD8);
          uint64_t v12 = sub_22C98D2F8(v16, i, a3);
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
    sub_22C8BA084(0, &qword_2684D3CC0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22C9A3FB8();
  __break(1u);
  return result;
}

void (*sub_22C98D2F8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_22C98D360(v6, a2, a3);
  return sub_22C91DDD4;
}

void (*sub_22C98D360(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  id v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x230F6FB60](a2, a3);
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
    *(void *)id v3 = v4;
    return destroy for PhotoGridItem;
  }
  __break(1u);
  return result;
}

uint64_t sub_22C98D3E0(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v5) {
      break;
    }
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t result = sub_22C9A3EB8();
    if (v5 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v7 = 0;
    while (v5 != v7)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x230F6FB60](v7, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * v7 + 32);
      }
      uint64_t v9 = v8;
      uint64_t v10 = v8;
      sub_22C98B8A8(&v10, a2, &v11);

      if (v2) {
        return swift_release();
      }
      ++v7;
      sub_22C9A3E98();
      sub_22C9A3EC8();
      sub_22C9A3ED8();
      sub_22C9A3EA8();
      if (v5 == v7) {
        return v12;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_22C9A3F78();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22C98D540()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C98D578()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22C98D5B8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x230F711D0](v2);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0xE8))();

    if (v5)
    {
      objc_msgSend(v5, sel_performActionWith_, v1);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_22C98D670()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_22C98D6A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_setImage_, a1);
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_22C98D6D4(uint64_t a1)
{
  return a1;
}

uint64_t method lookup function for ICQBubbleBannerView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ICQBubbleBannerView);
}

uint64_t dispatch thunk of ICQBubbleBannerView.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of ICQBubbleBannerView.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of ICQBubbleBannerView.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of ICQBubbleBannerView.__allocating_init(offer:bannerSpecification:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of ICQBubbleBannerView.updateBannerView()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t sub_22C98D800(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D3FF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22C98D860()
{
  unint64_t result = qword_2684D3CE0;
  if (!qword_2684D3CE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D3CD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3CE0);
  }
  return result;
}

uint64_t sub_22C98D8BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_22C9A3FB8();
  __break(1u);
  return result;
}

uint64_t sub_22C98D9B4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22C98D9F4()
{
  sub_22C98BE50(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_22C98DA00()
{
  unint64_t result = qword_2684D3CF0;
  if (!qword_2684D3CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3CF0);
  }
  return result;
}

uint64_t sub_22C98DA54()
{
  return 8;
}

uint64_t sub_22C98DA60()
{
  return swift_release();
}

uint64_t sub_22C98DA68(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_22C98DA74(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_22C98DA80()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  objc_msgSend(v0, sel_setMaximumFractionDigits_, 1);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08988]), sel_init);
  objc_msgSend(v1, sel_setUnitOptions_, 2);
  objc_msgSend(v1, sel_setNumberFormatter_, v0);

  qword_2684E0BE8 = (uint64_t)v1;
}

uint64_t *sub_22C98DB10()
{
  if (qword_2684E0358 != -1) {
    swift_once();
  }
  return &qword_2684E0BE8;
}

id sub_22C98DB5C()
{
  return sub_22C98DCFC(&qword_2684E0358, (void **)&qword_2684E0BE8);
}

id sub_22C98DB80(uint64_t a1)
{
  return sub_22C98DC18(a1, 1, 0, &qword_2684E0BF0);
}

void *sub_22C98DB94()
{
  if (qword_2684E0360 != -1) {
    swift_once();
  }
  return &qword_2684E0BF0;
}

id sub_22C98DBE0()
{
  return sub_22C98DCFC(&qword_2684E0360, (void **)&qword_2684E0BF0);
}

id sub_22C98DC04(uint64_t a1)
{
  return sub_22C98DC18(a1, 0, 1, &qword_2684E0BF8);
}

id sub_22C98DC18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  objc_msgSend(v7, sel_setDateStyle_, a2);
  id result = objc_msgSend(v7, sel_setTimeStyle_, a3);
  *a4 = v7;
  return result;
}

void *sub_22C98DC8C()
{
  if (qword_2684E0368 != -1) {
    swift_once();
  }
  return &qword_2684E0BF8;
}

id sub_22C98DCD8()
{
  return sub_22C98DCFC(&qword_2684E0368, (void **)&qword_2684E0BF8);
}

id sub_22C98DCFC(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  id v3 = *a2;
  return v3;
}

uint64_t sub_22C98DD48(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3668);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_bytes);
  sub_22C8BA084(0, &qword_2684D3670);
  sub_22C9A1328();
  if (qword_2684E0358 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2684E0BE8, sel_setUnitStyle_, a1);
  uint64_t v7 = sub_22C9A3B48();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

id sub_22C98E128()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id sub_22C98E15C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FormatterUtils();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_22C98E1D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FormatterUtils();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22C98E208(unint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3668);
  uint64_t v19 = *(void *)(v2 - 8);
  uint64_t v20 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_22C9A3F78())
  {
    uint64_t v6 = 4;
    double v7 = 0.0;
    uint64_t v8 = 0;
    if ((a1 & 0xC000000000000001) != 0)
    {
LABEL_4:
      id v9 = (id)MEMORY[0x230F6FB60](v8, a1);
      goto LABEL_6;
    }
    while (1)
    {
      id v9 = *(id *)(a1 + 8 * v6);
LABEL_6:
      uint64_t v10 = v9;
      uint64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        break;
      }
      id v12 = objc_msgSend(v9, sel_documentSize);
      if (v12)
      {
        id v13 = v12;
        objc_msgSend(v12, sel_doubleValue);
        double v15 = v14;

        double v7 = v7 + v15;
        if (v11 == v5) {
          goto LABEL_15;
        }
      }
      else
      {

        double v7 = v7 + 0.0;
        if (v11 == v5) {
          goto LABEL_15;
        }
      }
      uint64_t v8 = ++v6 - 4;
      if ((a1 & 0xC000000000000001) != 0) {
        goto LABEL_4;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(self, sel_bytes);
  sub_22C8BA084(0, &qword_2684D3670);
  sub_22C9A1328();
  if (qword_2684E0358 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2684E0BE8, sel_setUnitStyle_, 1, v19, v20);
  uint64_t v17 = sub_22C9A3B48();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v20);
  return v17;
}

uint64_t type metadata accessor for FormatterUtils()
{
  return self;
}

uint64_t sub_22C98E4C8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t sub_22C98E4DC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_retain();
  return v1;
}

uint64_t sub_22C98E50C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

id sub_22C98E51C()
{
  return *(id *)(v0 + 24);
}

uint64_t sub_22C98E524()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22C98E598()
{
  return sub_22C98E678((SEL *)&selRef_IPAddressLocationTitle);
}

uint64_t sub_22C98E5A4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  if (v5) {
    unsigned __int8 v1 = &selRef_IPAddressLocationEnabledMessage;
  }
  else {
    unsigned __int8 v1 = &selRef_IPAddressLocationDisabledMessage;
  }
  id v2 = [*(id *)(v0 + 16) *v1];
  uint64_t v3 = sub_22C9A36C8();

  return v3;
}

uint64_t sub_22C98E660()
{
  return sub_22C98E678((SEL *)&selRef_explanationTitle);
}

uint64_t sub_22C98E66C()
{
  return sub_22C98E678((SEL *)&selRef_explanationMessage);
}

uint64_t sub_22C98E678(SEL *a1)
{
  id v2 = [*(id *)(v1 + 16) *a1];
  uint64_t v3 = sub_22C9A36C8();

  return v3;
}

uint64_t sub_22C98E6D0()
{
  return sub_22C98FD58();
}

uint64_t sub_22C98E6E4(char a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v8[0]) = a1;
  swift_retain();
  uint64_t v3 = sub_22C9A1E58();
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 192))(v3);
  if ((result & 1) == 0)
  {
    (*(void (**)(void *__return_ptr))(*(void *)v1 + 240))(v5);
    sub_22C995154(v5, (void (*)(void, void, void, void, void))sub_22C8DAEFC);
    uint64_t result = sub_22C9936E4((uint64_t)v5, (uint64_t)v6);
    if (v7)
    {
      uint64_t v9 = 0;
      memset(v8, 0, sizeof(v8));
      return (*(uint64_t (**)(_OWORD *))(*(void *)v1 + 248))(v8);
    }
  }
  return result;
}

void (*sub_22C98E808(void *a1))(char **a1, char a2)
{
  uint64_t v3 = malloc(0x100uLL);
  *a1 = v3;
  v3[30] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  *((unsigned char *)v3 + 248) = *((unsigned char *)v3 + 249);
  return sub_22C98E8B8;
}

void sub_22C98E8B8(char **a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = (*a1)[248];
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v5 = *((void *)v3 + 30);
  v3[249] = v4;
  swift_retain();
  uint64_t v6 = sub_22C9A1E58();
  char v7 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 192))(v6);
  if (a2)
  {
    if ((v7 & 1) == 0)
    {
      (*(void (**)(void))(**((void **)v3 + 30) + 240))();
      sub_22C995154((void *)v3 + 20, (void (*)(void, void, void, void, void))sub_22C8DAEFC);
      sub_22C9936E4((uint64_t)(v3 + 160), (uint64_t)(v3 + 80));
      if (*((void *)v3 + 11))
      {
        uint64_t v8 = *((void *)v3 + 30);
        *(_OWORD *)uint64_t v3 = 0u;
        *((_OWORD *)v3 + 1) = 0u;
        *((void *)v3 + 4) = 0;
        (*(void (**)(char *))(*(void *)v8 + 248))(v3);
      }
    }
  }
  else if ((v7 & 1) == 0)
  {
    (*(void (**)(void))(**((void **)v3 + 30) + 240))();
    sub_22C995154((void *)v3 + 25, (void (*)(void, void, void, void, void))sub_22C8DAEFC);
    sub_22C9936E4((uint64_t)(v3 + 200), (uint64_t)(v3 + 120));
    if (*((void *)v3 + 16))
    {
      uint64_t v9 = *((void *)v3 + 30);
      *(_OWORD *)(v3 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
      *(_OWORD *)(v3 + 56) = 0u;
      *((void *)v3 + 9) = 0;
      (*(void (**)(char *))(*(void *)v9 + 248))(v3 + 40);
    }
  }
  free(v3);
}

uint64_t sub_22C98EABC()
{
  return sub_22C8B81D4((uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__showAlert, &qword_2684D1C68);
}

uint64_t sub_22C98EAD0(uint64_t a1)
{
  return sub_22C98FC14(a1, &qword_2684D1C70, (uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__showAlert, &qword_2684D1C68);
}

uint64_t (*sub_22C98EAEC(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1C70);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  char v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__showAlert;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1C68);
  sub_22C9A1E18();
  swift_endAccess();
  return sub_22C8B7ED4;
}

uint64_t sub_22C98EBFC(uint64_t a1)
{
  sub_22C9936E4(a1, (uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1B18);
  return sub_22C9A1E08();
}

double sub_22C98EC48@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_22C98ECCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(void *__return_ptr))(**(void **)a1 + 240))(v4);
  return sub_22C9936E4((uint64_t)v4, a2);
}

uint64_t sub_22C98ED2C(uint64_t a1, uint64_t a2)
{
  sub_22C9936E4(a1, (uint64_t)v5);
  long long v3 = *(uint64_t (**)(void *))(**(void **)a2 + 248);
  sub_22C995154(v5, (void (*)(void, void, void, void, void))sub_22C99374C);
  return v3(v5);
}

uint64_t sub_22C98EDAC(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9936E4(a1, (uint64_t)v7);
  swift_retain();
  uint64_t v3 = sub_22C9A1E58();
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)v1 + 240))(v6, v3);
  sub_22C9936E4((uint64_t)v6, (uint64_t)v7);
  uint64_t v4 = v8;
  if (v8) {
    sub_22C995154(v6, (void (*)(void, void, void, void, void))sub_22C8DAEFC);
  }
  return (*(uint64_t (**)(BOOL))(*(void *)v1 + 200))(v4 != 0);
}

void (*sub_22C98EEA8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = (char *)malloc(0xF8uLL);
  *a1 = v3;
  *((void *)v3 + 3__isPlatformVersionAtLeast(2, 18, 1, 0) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  *((_OWORD *)v3 + 1__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)(v3 + 200);
  v3 += 160;
  uint64_t v4 = *((void *)v3 + 9);
  *((_OWORD *)v3 + 1) = *(_OWORD *)(v3 + 56);
  *((void *)v3 + 4) = v4;
  return sub_22C98EF68;
}

void sub_22C98EF68(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void *)(*(void *)a1 + 160);
  uint64_t v5 = *(void *)(*(void *)a1 + 168);
  uint64_t v6 = *(void *)(*(void *)a1 + 176);
  uint64_t v7 = *(void *)(*(void *)a1 + 184);
  uint64_t v8 = *(void *)(*(void *)a1 + 192);
  swift_getKeyPath();
  swift_getKeyPath();
  v3[25] = v4;
  uint64_t v9 = v3[30];
  v3[26] = v5;
  v3[27] = v6;
  v3[28] = v7;
  v3[29] = v8;
  swift_retain();
  if (a2)
  {
    sub_22C99374C(v4, v5);
    uint64_t v10 = sub_22C9A1E58();
    (*(void (**)(uint64_t))(*(void *)v9 + 240))(v10);
    sub_22C9936E4((uint64_t)(v3 + 10), (uint64_t)v3);
    uint64_t v11 = v3[1];
    if (v11) {
      sub_22C995154(v3 + 10, (void (*)(void, void, void, void, void))sub_22C8DAEFC);
    }
    (*(void (**)(BOOL))(*(void *)v3[30] + 200))(v11 != 0);
    sub_22C8DAEFC(v3[20], v3[21]);
  }
  else
  {
    uint64_t v12 = sub_22C9A1E58();
    (*(void (**)(uint64_t))(*(void *)v9 + 240))(v12);
    sub_22C9936E4((uint64_t)(v3 + 15), (uint64_t)(v3 + 5));
    uint64_t v13 = v3[6];
    if (v13) {
      sub_22C995154(v3 + 15, (void (*)(void, void, void, void, void))sub_22C8DAEFC);
    }
    (*(void (**)(BOOL))(*(void *)v3[30] + 200))(v13 != 0);
  }
  free(v3);
}

uint64_t sub_22C98F190()
{
  return sub_22C8B81D4((uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__alert, &qword_2684D3D00);
}

uint64_t sub_22C98F1A4(uint64_t a1)
{
  return sub_22C98FC14(a1, &qword_2684D3D08, (uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__alert, &qword_2684D3D00);
}

uint64_t (*sub_22C98F1C0(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D08);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__alert;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D00);
  sub_22C9A1E18();
  swift_endAccess();
  return sub_22C8B7ED4;
}

uint64_t sub_22C98F2D0()
{
  return sub_22C9A1E08();
}

uint64_t sub_22C98F304()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22C98F378@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 288))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_22C98F3D0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 296))(*a1);
}

uint64_t sub_22C98F420()
{
  return sub_22C9A1E58();
}

void (*sub_22C98F490(void *a1))(void *a1)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  void v2[6] = sub_22C9A1E38();
  return sub_22C8B8158;
}

uint64_t sub_22C98F51C()
{
  return sub_22C8B81D4((uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__locationSharingOption, &qword_2684D3D10);
}

uint64_t sub_22C98F530(uint64_t a1)
{
  return sub_22C98FC14(a1, &qword_2684D3D18, (uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__locationSharingOption, &qword_2684D3D10);
}

uint64_t (*sub_22C98F54C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D18);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__locationSharingOption;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D10);
  sub_22C9A1E18();
  swift_endAccess();
  return sub_22C8B7ED4;
}

uint64_t sub_22C98F65C@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  if (v18)
  {
    id v2 = objc_msgSend(v18, sel_title);
    uint64_t v3 = sub_22C9A36C8();
    uint64_t v5 = v4;

    id v6 = objc_msgSend(v18, sel_message);
    uint64_t v7 = sub_22C9A36C8();
    uint64_t v9 = v8;

    id v10 = objc_msgSend(v18, sel_buttonTitle);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = sub_22C9A36C8();
      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v14 = 0;
    }
    uint64_t v17 = swift_allocObject();
    swift_weakInit();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v17;
    *(void *)(result + 24) = v18;
    double v15 = sub_22C993814;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    double v15 = 0;
    uint64_t result = 0;
  }
  *a1 = v3;
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v9;
  a1[4] = v12;
  a1[5] = v14;
  a1[6] = (uint64_t)v15;
  a1[7] = result;
  return result;
}

double sub_22C98F804@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_22C98F814()
{
  return sub_22C9A1E08();
}

uint64_t sub_22C98F85C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  if (v2)
  {
    id v0 = objc_msgSend(v2, sel_networkName);

    if (v0)
    {
      sub_22C9A36C8();
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_22C9A1E58();
}

uint64_t sub_22C98F960()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22C98F9D4()
{
  return sub_22C9A1E08();
}

uint64_t sub_22C98FA1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22C98FA90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 400))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_22C98FAE4()
{
  return sub_22C9A1E58();
}

uint64_t sub_22C98FB68()
{
  return sub_22C9A1E58();
}

uint64_t sub_22C98FBE4()
{
  return sub_22C8B81D4((uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__wifiName, &qword_2684D3D28);
}

uint64_t sub_22C98FBF8(uint64_t a1)
{
  return sub_22C98FC14(a1, &qword_2684D3D30, (uint64_t)&OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__wifiName, &qword_2684D3D28);
}

uint64_t sub_22C98FC14(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_22C9A1E28();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t sub_22C98FD44()
{
  return sub_22C98FD58();
}

uint64_t sub_22C98FD58()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22C98FDC4()
{
  return sub_22C9A1E08();
}

uint64_t sub_22C98FE0C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  return v1;
}

BOOL sub_22C98FE80()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_status) == (id)5;
}

uint64_t sub_22C98FEAC()
{
  unsigned __int8 v1 = (void *)swift_allocObject();
  v1[2] = 0;
  v1[3] = 0;
  v1[4] = v0;
  id v2 = (void *)swift_allocObject();
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = v0;
  swift_retain_n();
  sub_22C9A2EC8();
  return v4;
}

uint64_t sub_22C98FF6C()
{
  unsigned __int8 v1 = (void *)swift_allocObject();
  v1[2] = 0;
  v1[3] = 0;
  v1[4] = v0;
  id v2 = (void *)swift_allocObject();
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = v0;
  swift_retain_n();
  sub_22C9A2EC8();
  return v4;
}

void sub_22C99002C(void *a1, char a2, uint64_t a3, char a4)
{
  uint64_t v8 = sub_22C9A1AA8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v30 - v13;
  if (a1)
  {
    id v15 = a1;
    uint64_t v16 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v16, v8);
    id v17 = a1;
    id v18 = a1;
    uint64_t v19 = sub_22C9A1A98();
    os_log_type_t v20 = sub_22C9A3A88();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      unint64_t v31 = (void *)swift_slowAlloc();
      uint64_t v32 = a3;
      *(_DWORD *)uint64_t v21 = 67109378;
      LODWORD(v33) = a2 & 1;
      sub_22C9A3C78();
      *(_WORD *)(v21 + 8) = 2112;
      id v22 = a1;
      char v23 = a4;
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v33 = v24;
      sub_22C9A3C78();
      uint64_t v25 = v31;
      *unint64_t v31 = v24;
      a4 = v23;

      _os_log_impl(&dword_22C821000, v19, v20, "Error setting location sharing to %{BOOL}d: %@", (uint8_t *)v21, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v25, -1, -1);
      MEMORY[0x230F710E0](v21, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v33) = a4;
    swift_retain();
    sub_22C9A1E58();
  }
  else
  {
    uint64_t v26 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v26, v8);
    id v27 = sub_22C9A1A98();
    uint64_t v28 = sub_22C9A3A68();
    if (os_log_type_enabled(v27, (os_log_type_t)v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 67109120;
      LODWORD(v33) = a2 & 1;
      sub_22C9A3C78();
      _os_log_impl(&dword_22C821000, v27, (os_log_type_t)v28, "Updated location sharing to %{BOOL}d.", v29, 8u);
      MEMORY[0x230F710E0](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
}

void sub_22C9903D8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_22C990444()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_privateRelayStatusText);
  uint64_t v2 = sub_22C9A36C8();

  return v2;
}

uint64_t sub_22C99049C(void *a1, int a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  sub_22C9904F4(a1, a2, a3);
  return v6;
}

void *sub_22C9904F4(void *a1, int a2, void *a3)
{
  uint64_t v49 = a1;
  id v50 = a3;
  int v51 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D40);
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v46 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D28);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D48);
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D00);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1C68);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v20 = (char *)v3 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__showAlert;
  LOBYTE(aBlock) = 0;
  sub_22C9A1E08();
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v20, v19, v16);
  uint64_t v21 = (char *)v3 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__alert;
  id v54 = 0;
  long long aBlock = 0u;
  long long v53 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1B18);
  sub_22C9A1E08();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v21, v15, v12);
  id v22 = (char *)v3 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__bannerModel;
  *(void *)&long long aBlock = 0;
  v41[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D20);
  sub_22C9A1E08();
  uint64_t v24 = v42;
  uint64_t v23 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v22, v11, v43);
  uint64_t v25 = (char *)v3 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__wifiName;
  long long aBlock = 0uLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1C58);
  sub_22C9A1E08();
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v25, v8, v45);
  uint64_t v26 = (char *)v3 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__locationSharingEnabled;
  LOBYTE(aBlock) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D38);
  id v27 = v46;
  sub_22C9A1E08();
  uint64_t v29 = v47;
  uint64_t v28 = v48;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v26, v27, v48);
  uint64_t v30 = v49;
  unint64_t v31 = v50;
  v3[2] = v49;
  v3[3] = v31;
  swift_beginAccess();
  LOBYTE(v56) = v51;
  id v32 = v30;
  id v33 = v31;
  sub_22C9A1E08();
  swift_endAccess();
  uint64_t v34 = (char *)v3 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__bannerModel;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v34, v23);
  uint64_t v56 = 0;
  sub_22C9A1E08();
  swift_endAccess();
  id v35 = (char *)v3 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__locationSharingEnabled;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v35, v28);
  LOBYTE(v56) = 0;
  sub_22C9A1E08();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v56) = 1;
  sub_22C9A1E08();
  swift_endAccess();
  id v54 = sub_22C993BE4;
  id v55 = v3;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v53 = sub_22C990BC4;
  *((void *)&v53 + 1) = &block_descriptor_15;
  id v36 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v32, sel_isLocationSharingEnabled_, v36);
  _Block_release(v36);
  id v37 = CFNotificationCenterGetDarwinNotifyCenter();
  id v38 = (__CFString *)sub_22C9A3688();
  CFNotificationCenterAddObserver(v37, v3, (CFNotificationCallback)sub_22C990C18, v38, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  uint64_t v39 = (__CFString *)sub_22C9A3688();
  CFNotificationCenterAddObserver(v37, v3, (CFNotificationCallback)sub_22C990C1C, v39, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  return v3;
}

uint64_t sub_22C990BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void *sub_22C990C20(void *result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = result;
    id v8 = a3;
    id v9 = a5;
    uint64_t v10 = swift_retain();
    sub_22C994E98(v10, a3);

    return (void *)swift_release();
  }
  return result;
}

id *PrivateRelayViewModel.deinit()
{
  id v1 = v0;
  uint64_t v2 = sub_22C9A1AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = sub_22C9A1A98();
  os_log_type_t v8 = sub_22C9A3A68();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_22C821000, v7, v8, "Deinit PrivateRelayViewModel, removing observer.", v9, 2u);
    MEMORY[0x230F710E0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v11 = (__CFString *)sub_22C9A3688();
  CFNotificationCenterRemoveObserver(v10, v1, v11, 0);

  uint64_t v12 = (__CFString *)sub_22C9A3688();
  CFNotificationCenterRemoveObserver(v10, v1, v12, 0);

  uint64_t v13 = (char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__showAlert;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1C68);
  id v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  uint64_t v16 = (char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__alert;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D00);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  uint64_t v18 = (char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__locationSharingOption;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D10);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  os_log_type_t v20 = (char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__bannerModel;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D48);
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  id v22 = (char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__wifiName;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D28);
  (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  v15((char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__isEnabled, v14);
  uint64_t v24 = (char *)v1 + OBJC_IVAR____TtC13iCloudQuotaUI21PrivateRelayViewModel__locationSharingEnabled;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D40);
  (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  return v1;
}

uint64_t PrivateRelayViewModel.__deallocating_deinit()
{
  PrivateRelayViewModel.deinit();
  return swift_deallocClassInstance();
}

void sub_22C9910C8()
{
  id v1 = *(void **)(v0 + 16);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1107296256;
  v3[2] = sub_22C99118C;
  v3[3] = &block_descriptor_44;
  uint64_t v2 = _Block_copy(v3);
  swift_retain();
  swift_release();
  objc_msgSend(v1, sel_fetchBannerModels_, v2);
  _Block_release(v2);
}

uint64_t sub_22C99118C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_22C994E58();
    uint64_t v2 = sub_22C9A3858();
  }
  swift_retain();
  v3(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_22C991204(uint64_t a1)
{
  uint64_t v3 = sub_22C9A1AA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 > 63)
  {
    switch(a1)
    {
      case 64:
        uint64_t v8 = 0xD000000000000029;
        id v9 = "https://support.apple.com/kb/HT212614#geo";
        break;
      case 512:
        uint64_t v8 = 0xD00000000000005ELL;
        id v9 = "https://support.apple.com/ht213548?cid=mc-ols-icloud-article_ht213548-macos_uimessage-05232023";
        break;
      case 2048:
        uint64_t v8 = 0xD00000000000002BLL;
        id v9 = "https://www.apple.com/support/systemstatus/";
        break;
      default:
LABEL_20:
        uint64_t v15 = sub_22C8F8FBC();
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
        uint64_t v16 = sub_22C9A1A98();
        os_log_type_t v17 = sub_22C9A3A88();
        if (os_log_type_enabled(v16, v17))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v18 = 134217984;
          uint64_t aBlock = a1;
          sub_22C9A3C78();
          _os_log_impl(&dword_22C821000, v16, v17, "Pressed primary banner button but handler for status %lu is unknown. The UI will appear to do nothing.", v18, 0xCu);
          MEMORY[0x230F710E0](v18, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        return;
    }
    unint64_t v7 = (unint64_t)(v9 - 32) | 0x8000000000000000;
LABEL_17:
    sub_22C994A58(v8, v7);
  }
  else
  {
    switch(a1)
    {
      case 1:
        sub_22C991950();
        return;
      case 2:
      case 8:
        unint64_t v7 = 0x800000022C9C1CD0;
        uint64_t v8 = 0xD00000000000002DLL;
        goto LABEL_17;
      case 16:
        uint64_t v10 = *(void **)(v1 + 16);
        uint64_t v11 = swift_allocObject();
        swift_weakInit();
        uint64_t v23 = sub_22C994E34;
        uint64_t v24 = v11;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v20 = 1107296256;
        uint64_t v21 = sub_22C9903D8;
        id v22 = &block_descriptor_106;
        uint64_t v12 = _Block_copy(&aBlock);
        swift_release();
        objc_msgSend(v10, sel_enableSafari_, v12);
        goto LABEL_13;
      case 32:
        uint64_t v13 = *(void **)(v1 + 16);
        uint64_t v14 = swift_allocObject();
        swift_weakInit();
        uint64_t v23 = sub_22C994E10;
        uint64_t v24 = v14;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v20 = 1107296256;
        uint64_t v21 = sub_22C9903D8;
        id v22 = &block_descriptor_102;
        uint64_t v12 = _Block_copy(&aBlock);
        swift_release();
        objc_msgSend(v13, sel_enableDNS_, v12);
LABEL_13:
        _Block_release(v12);
        break;
      default:
        goto LABEL_20;
    }
  }
}

uint64_t sub_22C991670(void *a1, uint64_t a2, const char *a3)
{
  uint64_t v5 = sub_22C9A1AA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (a1)
    {
      id v10 = a1;
      uint64_t v11 = sub_22C8F8FBC();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
      id v12 = a1;
      id v13 = a1;
      uint64_t v14 = sub_22C9A1A98();
      os_log_type_t v15 = sub_22C9A3A88();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        uint64_t v23 = a3;
        os_log_type_t v17 = (uint8_t *)v16;
        uint64_t v22 = swift_slowAlloc();
        uint64_t v25 = v22;
        *(_DWORD *)os_log_type_t v17 = 136315138;
        uint64_t v21 = v17 + 4;
        swift_getErrorValue();
        uint64_t v18 = sub_22C9A4138();
        uint64_t v24 = sub_22C8BA27C(v18, v19, &v25);
        sub_22C9A3C78();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_22C821000, v14, v15, v23, v17, 0xCu);
        uint64_t v20 = v22;
        swift_arrayDestroy();
        MEMORY[0x230F710E0](v20, -1, -1);
        MEMORY[0x230F710E0](v17, -1, -1);

        swift_release();
      }
      else
      {
        swift_release();
      }
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      (*(void (**)(uint64_t))(*(void *)result + 592))(result);
      return swift_release();
    }
  }
  return result;
}

void sub_22C991950()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C9A1AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(*v0 + 400))(v4);
  if (!v7)
  {
    uint64_t v8 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
    id v9 = sub_22C9A1A98();
    os_log_type_t v10 = sub_22C9A3A88();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_22C821000, v9, v10, "Do not have wifi name for unsupported wifi alert, will show placeholder.", v11, 2u);
      MEMORY[0x230F710E0](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  id v12 = (void *)v1[2];
  id v13 = (void *)sub_22C9A3688();
  id v14 = objc_msgSend(v12, sel_unsupportedTurnOffAlertTitleFor_, v13);

  uint64_t v15 = sub_22C9A36C8();
  uint64_t v29 = v16;
  uint64_t v30 = v15;

  id v17 = objc_msgSend(v12, sel_unsupportedTurnOffWifiAlertMessage);
  uint64_t v18 = sub_22C9A36C8();
  uint64_t v20 = v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D80);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_22C9B1320;
  id v22 = objc_msgSend(v12, sel_unsupportedTurnOffAlertOk);
  uint64_t v23 = sub_22C9A36C8();
  uint64_t v25 = v24;

  *(void *)(v21 + 32) = v23;
  *(void *)(v21 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v25;
  *(unsigned char *)(v21 + 48) = 0;
  *(void *)(v21 + 56) = nullsub_1;
  *(void *)(v21 + 64) = 0;
  v32[0] = v30;
  v32[1] = v29;
  _OWORD v32[2] = v18;
  v32[3] = v20;
  v32[4] = v21;
  (*(void (**)(void *))(*v1 + 248))(v32);
  uint64_t v26 = (void *)sub_22C9A3688();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_22C994A50;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C9903D8;
  aBlock[3] = &block_descriptor_98;
  uint64_t v27 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_enableWifi_onNetworkName_completion_, 0, v26, v27);
  _Block_release(v27);
}

uint64_t sub_22C991CF8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v9 = a1;
    uint64_t v10 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
    id v11 = a1;
    id v12 = a1;
    id v13 = sub_22C9A1A98();
    os_log_type_t v14 = sub_22C9A3A88();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      os_log_t v24 = v13;
      uint64_t v16 = (uint8_t *)v15;
      uint64_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      id v17 = a1;
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v25 = v18;
      sub_22C9A3C78();
      uint64_t v19 = v23;
      void *v23 = v18;

      os_log_t v20 = v24;
      _os_log_impl(&dword_22C821000, v24, v14, "Error disabling on unsupported wifi: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v19, -1, -1);
      MEMORY[0x230F710E0](v16, -1, -1);
    }
    else
    {
    }
    uint64_t v6 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 592))(v6);
}

void sub_22C991F78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  if (v4[0] && (id v1 = objc_msgSend(v4[0], sel_status), v4[0], v1 == (id)1))
  {
    sub_22C9925C8();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_22C9A1E48();
    swift_release();
    swift_release();
    if ((uint64_t)v4[0])
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_22C9A1E48();
      swift_release();
      swift_release();
      if (LOBYTE(v4[0]) == 1) {
        sub_22C9923D8();
      }
    }
    else
    {
      uint64_t v2 = (void *)v0[2];
      v4[4] = sub_22C994A48;
      void v4[5] = v0;
      v4[0] = (id)MEMORY[0x263EF8330];
      v4[1] = (id)1107296256;
      v4[2] = sub_22C9903D8;
      v4[3] = &block_descriptor_95;
      uint64_t v3 = _Block_copy(v4);
      swift_retain();
      swift_release();
      objc_msgSend(v2, sel_setEnabled_completion_, 1, v3);
      _Block_release(v3);
    }
  }
}

uint64_t sub_22C992158(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 592))(v6);
  }
  id v9 = a1;
  uint64_t v10 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
  id v11 = a1;
  id v12 = a1;
  id v13 = sub_22C9A1A98();
  os_log_type_t v14 = sub_22C9A3A88();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412290;
    id v16 = a1;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v20[1] = v17;
    sub_22C9A3C78();
    uint64_t v18 = v20[0];
    *(void *)v20[0] = v17;

    _os_log_impl(&dword_22C821000, v13, v14, "Error enabling PR in showEnableAlert: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v18, -1, -1);
    MEMORY[0x230F710E0](v15, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_22C9923D8()
{
  id v1 = (void *)v0[2];
  id v2 = objc_msgSend(v1, sel_switchOffAlertPrefPaneTitle);
  uint64_t v3 = sub_22C9A36C8();
  uint64_t v5 = v4;

  id v6 = objc_msgSend(v1, sel_switchOffAlertMessage);
  uint64_t v7 = sub_22C9A36C8();
  uint64_t v9 = v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_22C9AEA10;
  id v11 = objc_msgSend(v1, sel_unsupportedSwitchOffCancel);
  uint64_t v12 = sub_22C9A36C8();
  uint64_t v14 = v13;

  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v14;
  *(unsigned char *)(v10 + 48) = 0;
  *(void *)(v10 + 56) = sub_22C994930;
  *(void *)(v10 + 64) = v0;
  swift_retain();
  id v15 = objc_msgSend(v1, sel_switchOffAlertPause);
  uint64_t v16 = sub_22C9A36C8();
  uint64_t v18 = v17;

  *(void *)(v10 + 72) = v16;
  *(void *)(v10 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v18;
  *(unsigned char *)(v10 + 88) = 0;
  *(void *)(v10 + 96) = sub_22C99495C;
  *(void *)(v10 + 104) = v0;
  swift_retain();
  id v19 = objc_msgSend(v1, sel_switchOffAlertTurnOff);
  uint64_t v20 = sub_22C9A36C8();
  uint64_t v22 = v21;

  *(void *)(v10 + 112) = v20;
  *(void *)(v10 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v22;
  *(unsigned char *)(v10 + 128) = 1;
  *(void *)(v10 + 136) = sub_22C994A38;
  *(void *)(v10 + 144) = v0;
  v25[0] = v3;
  v25[1] = v5;
  v25[2] = v7;
  v25[3] = v9;
  v25[4] = v10;
  uint64_t v23 = *(uint64_t (**)(void *))(*v0 + 248);
  swift_retain();
  return v23(v25);
}

uint64_t sub_22C9925C8()
{
  id v1 = v0;
  uint64_t v2 = sub_22C9A1AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*v0 + 400))(v4);
  if (v8)
  {
    uint64_t v9 = v7;
    unint64_t v10 = v8;
  }
  else
  {
    uint64_t v11 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v11, v2);
    uint64_t v12 = sub_22C9A1A98();
    os_log_type_t v13 = sub_22C9A3A88();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_22C821000, v12, v13, "Wifi name unknown. Using placeholder.", v14, 2u);
      MEMORY[0x230F710E0](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    unint64_t v10 = 0xE700000000000000;
    uint64_t v9 = 0x6E776F6E6B6E55;
  }
  id v15 = (void *)v1[2];
  id v16 = objc_msgSend(v15, sel_unsupportedSwitchOffAlertTitle);
  uint64_t v17 = sub_22C9A36C8();
  uint64_t v40 = v18;
  uint64_t v41 = v17;

  id v19 = objc_msgSend(v15, sel_unsupportedWifiSwitchOffAlertMessage);
  sub_22C9A36C8();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D2A10);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_22C9B1320;
  *(void *)(v20 + 56) = MEMORY[0x263F8D310];
  *(void *)(v20 + 64) = sub_22C8DE080();
  *(void *)(v20 + 32) = v9;
  *(void *)(v20 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v10;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_22C9A36E8();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_22C9AEA10;
  id v25 = objc_msgSend(v15, sel_unsupportedSwitchOffNetworkOnly);
  uint64_t v26 = sub_22C9A36C8();
  uint64_t v28 = v27;

  uint64_t v29 = (void *)swift_allocObject();
  void v29[2] = v1;
  v29[3] = v9;
  v29[4] = v10;
  *(void *)(v24 + 32) = v26;
  *(void *)(v24 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v28;
  *(unsigned char *)(v24 + 48) = 0;
  *(void *)(v24 + 56) = sub_22C994810;
  *(void *)(v24 + 64) = v29;
  swift_retain();
  id v30 = objc_msgSend(v15, sel_unsupportedSwitchOffCompletely);
  uint64_t v31 = sub_22C9A36C8();
  uint64_t v33 = v32;

  *(void *)(v24 + 72) = v31;
  *(void *)(v24 + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = v33;
  *(unsigned char *)(v24 + 88) = 0;
  *(void *)(v24 + 96) = sub_22C995280;
  *(void *)(v24 + 104) = v1;
  swift_retain();
  id v34 = objc_msgSend(v15, sel_unsupportedSwitchOffCancel);
  uint64_t v35 = sub_22C9A36C8();
  uint64_t v37 = v36;

  *(void *)(v24 + 112) = v35;
  *(void *)(v24 + 12__isPlatformVersionAtLeast(2, 18, 1, 0) = v37;
  *(unsigned char *)(v24 + 128) = 0;
  *(void *)(v24 + 136) = nullsub_1;
  *(void *)(v24 + 144) = 0;
  v42[0] = v41;
  v42[1] = v40;
  v42[2] = v21;
  v42[3] = v23;
  v42[4] = v24;
  return (*(uint64_t (**)(void *))(*v1 + 248))(v42);
}

uint64_t sub_22C9929BC(void *a1, char a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v8 = a1;
    uint64_t v9 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
    id v10 = a1;
    id v11 = a1;
    uint64_t v12 = sub_22C9A1A98();
    os_log_type_t v13 = sub_22C9A3A88();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      id v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 67109378;
      LODWORD(v2__isPlatformVersionAtLeast(2, 18, 1, 0) = a2 & 1;
      sub_22C9A3C78();
      *(_WORD *)(v14 + 8) = 2112;
      id v15 = a1;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v20 = v16;
      sub_22C9A3C78();
      uint64_t v17 = v19;
      *id v19 = v16;

      _os_log_impl(&dword_22C821000, v12, v13, "Error setting wifi enabled to %{BOOL}d: %@", (uint8_t *)v14, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v17, -1, -1);
      MEMORY[0x230F710E0](v14, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 592))(result);
    return swift_release();
  }
  return result;
}

void sub_22C992C84(char a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v7[0]) = a1;
  swift_retain();
  sub_22C9A1E58();
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v4;
  v7[4] = sub_22C994780;
  _OWORD v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_22C9903D8;
  v7[3] = &block_descriptor_78;
  uint64_t v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v3, sel_setEnabled_completion_, a1 & 1, v6);
  _Block_release(v6);
}

void sub_22C992DD0(void *a1, int a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (!Strong) {
      return;
    }
    (*(void (**)(uint64_t))(*(void *)Strong + 592))(Strong);
    goto LABEL_9;
  }
  id v8 = a1;
  uint64_t v9 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  id v10 = a1;
  id v11 = a1;
  uint64_t v12 = sub_22C9A1A98();
  os_log_type_t v13 = sub_22C9A3A88();
  BOOL v14 = os_log_type_enabled(v12, v13);
  int v22 = a2;
  if (v14)
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 67109378;
    LODWORD(v24) = a2 & 1;
    sub_22C9A3C78();
    *(_WORD *)(v15 + 8) = 2112;
    id v16 = a1;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v24 = v17;
    sub_22C9A3C78();
    uint64_t v18 = v21;
    *uint64_t v21 = v17;

    _os_log_impl(&dword_22C821000, v12, v13, "Error setting PR to enabled %{BOOL}d: %@", (uint8_t *)v15, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v18, -1, -1);
    MEMORY[0x230F710E0](v15, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    BOOL v23 = (v22 & 1) == 0;
    swift_retain();
    sub_22C9A1E58();

LABEL_9:
    swift_release();
    return;
  }
}

uint64_t sub_22C993114(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2 + 16;
  if (a1)
  {
    id v9 = a1;
    uint64_t v10 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
    id v11 = a1;
    id v12 = a1;
    os_log_type_t v13 = sub_22C9A1A98();
    os_log_type_t v14 = sub_22C9A3A88();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v22 = v8;
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 138412290;
      id v16 = a1;
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v23 = v17;
      sub_22C9A3C78();
      uint64_t v18 = v21;
      *uint64_t v21 = v17;

      _os_log_impl(&dword_22C821000, v13, v14, "Error pausing private relay: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v18, -1, -1);
      MEMORY[0x230F710E0](v15, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 592))(result);
    return swift_release();
  }
  return result;
}

uint64_t sub_22C9933C0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PrivateRelayViewModel();
  uint64_t result = sub_22C9A1DE8();
  *a1 = result;
  return result;
}

uint64_t sub_22C993400@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22C993480()
{
  return sub_22C9A1E58();
}

uint64_t sub_22C9934F4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22C993574(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  sub_22C9A1E58();
  return sub_22C98F85C();
}

uint64_t sub_22C9935F0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22C993670()
{
  return sub_22C9A1E58();
}

uint64_t sub_22C9936E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C99374C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_22C99379C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C9937D4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22C993814()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_22C991204((uint64_t)objc_msgSend(v1, sel_status));
    return swift_release();
  }
  return result;
}

uint64_t sub_22C993880()
{
  return objectdestroy_31Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_22C9938AC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22C99392C()
{
  return objectdestroy_31Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

void sub_22C993958()
{
}

uint64_t sub_22C99397C()
{
  return objectdestroy_31Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

uint64_t sub_22C9939A8@<X0>(BOOL *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  uint64_t result = swift_release();
  *a1 = (v3 & 1) == 0;
  return result;
}

uint64_t sub_22C993A30()
{
  return objectdestroy_31Tm(MEMORY[0x263F8EEE8], MEMORY[0x263F8EED8]);
}

void sub_22C993A5C(char *a1)
{
  uint64_t v2 = *(void *)(v1 + 32);
  char v3 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22C9A1E48();
  swift_release();
  swift_release();
  char v4 = v9[0];
  BOOL v5 = (v3 & 1) == 0;
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v9[0]) = v5;
  swift_retain();
  sub_22C9A1E58();
  uint64_t v6 = *(void **)(v2 + 16);
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v2;
  *(unsigned char *)(v7 + 32) = v4;
  v9[4] = sub_22C995144;
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  _OWORD v9[2] = sub_22C9903D8;
  v9[3] = &block_descriptor_112;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_enableLocationSharing_completion_, v5, v8);
  _Block_release(v8);
}

uint64_t sub_22C993BE4()
{
  return sub_22C9A1E58();
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

uint64_t sub_22C993C6C(unint64_t a1)
{
  if (!a1)
  {
    char v4 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_22C9A3F78();
    char v4 = (void *)result;
    if (!result) {
      goto LABEL_8;
    }
  }
  else
  {
    char v4 = *(void **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4)
    {
LABEL_8:
      swift_bridgeObjectRelease();
LABEL_10:
      swift_getKeyPath();
      swift_getKeyPath();
      id v7 = v4;
      swift_retain();
      sub_22C9A1E58();
      sub_22C98F85C();

      objc_msgSend(*(id *)(v1 + 16), sel_isEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      return sub_22C9A1E58();
    }
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x230F6FB60](0, a1);
    goto LABEL_7;
  }
  if (*(void *)(v3 + 16))
  {
    id v6 = *(id *)(a1 + 32);
LABEL_7:
    char v4 = v6;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t sub_22C993DC8()
{
  unint64_t result = qword_2684D3D50;
  if (!qword_2684D3D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3D50);
  }
  return result;
}

uint64_t sub_22C993E1C()
{
  return type metadata accessor for PrivateRelayViewModel();
}

uint64_t type metadata accessor for PrivateRelayViewModel()
{
  uint64_t result = qword_2684E0620;
  if (!qword_2684E0620) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22C993E70()
{
  sub_22C9951E0(319, (unint64_t *)&qword_2684D1CA0, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F)
  {
    sub_22C8BA034(319, &qword_2684D3D58, &qword_2684D1B18);
    if (v1 <= 0x3F)
    {
      sub_22C9951E0(319, &qword_2684D3D60, (uint64_t)&type metadata for PrivateRelayViewModel.LocationSharingOption, MEMORY[0x263EFDE58]);
      if (v2 <= 0x3F)
      {
        sub_22C8BA034(319, &qword_2684D3D68, &qword_2684D3D20);
        if (v3 <= 0x3F)
        {
          sub_22C8BA034(319, &qword_2684D3D70, &qword_2684D1C58);
          if (v4 <= 0x3F)
          {
            sub_22C8BA034(319, &qword_2684D3D78, &qword_2684D3D38);
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

uint64_t method lookup function for PrivateRelayViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PrivateRelayViewModel);
}

uint64_t dispatch thunk of PrivateRelayViewModel.statusString.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 576))();
}

uint64_t destroy for PrivateRelayViewModel.Banner(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for PrivateRelayViewModel.Banner(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v8 = a2 + 6;
  uint64_t v7 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    uint64_t v9 = a2[7];
    a1[6] = v7;
    a1[7] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *v8;
  }
  return a1;
}

void *assignWithCopy for PrivateRelayViewModel.Banner(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[6];
  if (!a1[6])
  {
    if (v4)
    {
      uint64_t v6 = a2[7];
      a1[6] = v4;
      a1[7] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[7];
  a1[6] = v4;
  a1[7] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

void *assignWithTake for PrivateRelayViewModel.Banner(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[6];
  if (!a1[6])
  {
    if (v7)
    {
      uint64_t v9 = a2[7];
      a1[6] = v7;
      a1[7] = v9;
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = a2[7];
  a1[6] = v7;
  a1[7] = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivateRelayViewModel.Banner(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivateRelayViewModel.Banner(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateRelayViewModel.Banner()
{
  return &type metadata for PrivateRelayViewModel.Banner;
}

ValueMetadata *type metadata accessor for PrivateRelayViewModel.Banner.Button()
{
  return &type metadata for PrivateRelayViewModel.Banner.Button;
}

void *assignWithCopy for PrivateRelayViewModel.Alert(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PrivateRelayViewModel.Alert()
{
  return &type metadata for PrivateRelayViewModel.Alert;
}

uint64_t destroy for PrivateRelayViewModel.Alert.Action()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for PrivateRelayViewModel.Alert.Action(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PrivateRelayViewModel.Alert.Action(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PrivateRelayViewModel.Alert.Action(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PrivateRelayViewModel.Alert.Action()
{
  return &type metadata for PrivateRelayViewModel.Alert.Action;
}

unsigned char *storeEnumTagSinglePayload for PrivateRelayViewModel.LocationSharingOption(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x22C994710);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateRelayViewModel.LocationSharingOption()
{
  return &type metadata for PrivateRelayViewModel.LocationSharingOption;
}

uint64_t sub_22C994748()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22C994780(void *a1)
{
  sub_22C992DD0(a1, *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_22C99478C()
{
  return objectdestroy_31Tm(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0]);
}

uint64_t objectdestroy_31Tm(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 32));
  return MEMORY[0x270FA0238](v2, 40, 7);
}

void sub_22C994810()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 16) + 16);
  uint64_t v2 = (void *)sub_22C9A3688();
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = v3;
  v6[4] = sub_22C994924;
  void v6[5] = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_22C9903D8;
  v6[3] = &block_descriptor_88;
  uint64_t v5 = _Block_copy(v6);
  swift_release();
  objc_msgSend(v1, sel_enableWifi_onNetworkName_completion_, 0, v2, v5);
  _Block_release(v5);
}

uint64_t sub_22C994924(void *a1)
{
  return sub_22C9929BC(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_22C994930()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

void sub_22C99495C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = swift_allocObject();
  swift_weakInit();
  v4[4] = sub_22C994A40;
  void v4[5] = v2;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  v4[2] = sub_22C9903D8;
  v4[3] = &block_descriptor_92_0;
  uint64_t v3 = _Block_copy(v4);
  swift_release();
  objc_msgSend(v1, sel_pausePrivateRelayUntilTomorrow_, v3);
  _Block_release(v3);
}

void sub_22C994A38()
{
}

uint64_t sub_22C994A40(void *a1)
{
  return sub_22C993114(a1, v1);
}

uint64_t sub_22C994A48(void *a1)
{
  return sub_22C992158(a1, v1);
}

uint64_t sub_22C994A50(void *a1)
{
  return sub_22C991CF8(a1, v1);
}

id sub_22C994A58(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22C9A14E8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C9A14D8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22C8D6A6C((uint64_t)v10);
    uint64_t v15 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
    swift_bridgeObjectRetain_n();
    id v16 = sub_22C9A1A98();
    os_log_type_t v17 = sub_22C9A3A88();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v24 = v19;
      *(_DWORD *)uint64_t v18 = 136446210;
      v23[1] = v18 + 4;
      swift_bridgeObjectRetain();
      v23[2] = sub_22C8BA27C(a1, a2, &v24);
      sub_22C9A3C78();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22C821000, v16, v17, "Could not create URL from urlString %{public}s. A button will likely do nothing.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v19, -1, -1);
      MEMORY[0x230F710E0](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    id result = objc_msgSend(self, sel_defaultWorkspace);
    if (result)
    {
      uint64_t v21 = result;
      uint64_t v22 = (void *)sub_22C9A14A8();
      objc_msgSend(v21, sel_openURL_configuration_completionHandler_, v22, 0, 0);

      return (id)(*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22C994E10(void *a1)
{
  return sub_22C991670(a1, v1, "Error enabling DNS for Private Relay: %s");
}

uint64_t sub_22C994E34(void *a1)
{
  return sub_22C991670(a1, v1, "Error enabling Safari for Private Relay: %s");
}

unint64_t sub_22C994E58()
{
  unint64_t result = qword_2684D3D88;
  if (!qword_2684D3D88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2684D3D88);
  }
  return result;
}

uint64_t sub_22C994E98(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a2;
  uint64_t v10 = sub_22C9A1A98();
  os_log_type_t v11 = sub_22C9A3A68();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = a1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = (uint64_t)a2;
    uint64_t v24 = v14;
    uint64_t v21 = v4;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = v13 + 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3D90);
    uint64_t v15 = sub_22C9A3C58();
    uint64_t v23 = sub_22C8BA27C(v15, v16, &v24);
    sub_22C9A3C78();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22C821000, v10, v11, "Handling NSP notification: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v14, -1, -1);
    os_log_type_t v17 = v13;
    a1 = v22;
    MEMORY[0x230F710E0](v17, -1, -1);

    uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v21);
  }
  else
  {

    uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 592))(v18);
}

uint64_t sub_22C99510C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

void sub_22C995144(void *a1)
{
  sub_22C99002C(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

void *sub_22C995154(void *a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

void type metadata accessor for CFNotificationName(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_22C9951E0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_22C995284()
{
  return sub_22C9A3DC8();
}

uint64_t sub_22C99531C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22C9A3328();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_22C9A3348();
  MEMORY[0x270FA5388](v3 - 8);
  swift_bridgeObjectRetain();
  sub_22C9A3338();
  uint64_t v4 = MEMORY[0x263F8EE78];
  sub_22C8CE388(MEMORY[0x263F8EE78]);
  sub_22C9A3318();
  sub_22C8CE544(v4);
  sub_22C8CE544(v4);
  sub_22C9A3358();
  uint64_t v5 = sub_22C9A3368();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 0, 1, v5);
}

uint64_t sub_22C99548C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t result = sub_22C8CE690(a1, (uint64_t)a6);
  a6[5] = a2;
  a6[6] = a3;
  a6[7] = a4;
  a6[8] = a5;
  return result;
}

unint64_t sub_22C9954E0()
{
  unint64_t result = qword_2684D3DA8;
  if (!qword_2684D3DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3DA8);
  }
  return result;
}

uint64_t destroy for RecommendationLinkComponentModel(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RecommendationLinkComponentModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RecommendationLinkComponentModel(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (!*(void *)(a1 + 24))
  {
    if (v4)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
LABEL_8:
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *((void *)a2 + 5);
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  *(void *)(a1 + 64) = *((void *)a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for RecommendationLinkComponentModel(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RecommendationLinkComponentModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RecommendationLinkComponentModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RecommendationLinkComponentModel()
{
  return &type metadata for RecommendationLinkComponentModel;
}

id sub_22C995834()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_file);
  swift_beginAccess();
  unint64_t v2 = *v1;
  return v2;
}

void sub_22C99588C(void *a1)
{
  long long v3 = (void **)(v1 + OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_file);
  swift_beginAccess();
  long long v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_22C9958E0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22C99593C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_didUpdateItem);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_22C8CD434(*v1);
  return v2;
}

uint64_t sub_22C995998(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_didUpdateItem);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_22C8CD4A0(v6);
}

uint64_t (*sub_22C9959F8())()
{
  return j__swift_endAccess;
}

id sub_22C995A54(uint64_t a1)
{
  long long v3 = (char *)objc_allocWithZone(v1);
  long long v4 = &v3[OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_didUpdateItem];
  *(void *)long long v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_file] = a1;
  v6.receiver = v3;
  v6.super_class = v1;
  return objc_msgSendSuper2(&v6, sel_init);
}

id sub_22C995AB4(uint64_t a1)
{
  uint64_t v2 = &v1[OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_didUpdateItem];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_file] = a1;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for QuickLookProvider();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for QuickLookProvider()
{
  return self;
}

id sub_22C995B30()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16090]), sel_initWithFPItem_, v1);

  return v2;
}

void sub_22C995CD8()
{
}

id sub_22C995D38()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QuickLookProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_22C995DBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C9A19C8();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v6 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  uint64_t v7 = (void *)((uint64_t (*)(uint64_t))v6)(v3);
  id v28 = objc_msgSend(v7, sel_providerDomainID);

  uint64_t v8 = (void *)v6();
  id v9 = objc_msgSend(v8, sel_itemIdentifier);

  uint64_t v10 = (void *)v6();
  id v11 = objc_msgSend(v10, sel_parentItemIdentifier);

  uint64_t v12 = (void *)v6();
  id v13 = objc_msgSend(v12, sel_filename);

  sub_22C9A36C8();
  uint64_t v14 = (void *)v6();
  id v15 = objc_msgSend(v14, sel_contentType);

  sub_22C9A19B8();
  id v16 = objc_allocWithZone(MEMORY[0x263F054A8]);
  os_log_type_t v17 = (void *)sub_22C9A3688();
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)sub_22C9A19A8();
  uint64_t v19 = v28;
  id v20 = objc_msgSend(v16, sel_initWithProviderDomainID_itemIdentifier_parentItemIdentifier_filename_contentType_, v28, v9, v11, v17, v18);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v30);
  uint64_t v21 = (void *)MEMORY[0x263F8EED0];
  uint64_t v22 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x68);
  id v23 = v20;
  uint64_t v24 = v22();
  id v25 = (void (*)(id))(*(uint64_t (**)(uint64_t))((*v21 & *v1) + 0x78))(v24);
  if (v25)
  {
    uint64_t v26 = (uint64_t)v25;
    v25(v23);

    sub_22C8CD4A0(v26);
  }
  else
  {
  }
}

uint64_t sub_22C9960D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22C9A3328();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_22C9A3348();
  MEMORY[0x270FA5388](v3 - 8);
  sub_22C9A3338();
  uint64_t v4 = MEMORY[0x263F8EE78];
  sub_22C8CE388(MEMORY[0x263F8EE78]);
  sub_22C9A3318();
  sub_22C8CE544(v4);
  sub_22C8CE544(v4);
  sub_22C9A3358();
  uint64_t v5 = sub_22C9A3368();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 0, 1, v5);
}

uint64_t sub_22C996240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_OWORD *)(a3 + 16) = v3;
  *(void *)(a3 + 32) = *(void *)(a1 + 32);
  return sub_22C8CE690(a2, a3 + 40);
}

unint64_t sub_22C996264()
{
  unint64_t result = qword_2684D3EF0;
  if (!qword_2684D3EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D3EF0);
  }
  return result;
}

uint64_t destroy for RecommendationsListComponentModel(uint64_t a1)
{
  uint64_t result = __swift_destroy_boxed_opaque_existential_0(a1);
  if (*(void *)(a1 + 64))
  {
    return __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  }
  return result;
}

uint64_t initializeWithCopy for RecommendationsListComponentModel(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = (_OWORD *)(a1 + 40);
  objc_super v6 = (_OWORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 64);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v8;
    (**(void (***)(_OWORD *, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 56);
    *uint64_t v5 = *v6;
    *(_OWORD *)(a1 + 56) = v9;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  return a1;
}

uint64_t assignWithCopy for RecommendationsListComponentModel(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  uint64_t v4 = *(void *)(a2 + 64);
  if (!*(void *)(a1 + 64))
  {
    if (v4)
    {
      *(void *)(a1 + 64) = v4;
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
      return a1;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 40);
    long long v6 = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(_OWORD *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v5;
    *(_OWORD *)(a1 + 56) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  return a1;
}

uint64_t assignWithTake for RecommendationsListComponentModel(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  }
  long long v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for RecommendationsListComponentModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RecommendationsListComponentModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8__isPlatformVersionAtLeast(2, 18, 1, 0) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RecommendationsListComponentModel()
{
  return &type metadata for RecommendationsListComponentModel;
}

uint64_t *sub_22C996584()
{
  return &qword_2684E0830;
}

uint64_t static ICQUIRemoteExtensionEntry.sharedInstance.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_2684E0830;
  id v1 = (id)qword_2684E0830;
  return v0;
}

void static ICQUIRemoteExtensionEntry.sharedInstance.setter(uint64_t a1)
{
  swift_beginAccess();
  unint64_t v2 = (void *)qword_2684E0830;
  qword_2684E0830 = a1;
}

uint64_t (*static ICQUIRemoteExtensionEntry.sharedInstance.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22C99676C()
{
  id v1 = v0;
  uint64_t v2 = sub_22C9A1AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v1, sel_delegate))
  {
    v11[1] = &unk_26E083A68;
    uint64_t result = swift_dynamicCastObjCProtocolConditional();
    if (result) {
      return result;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v7 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  uint64_t v8 = sub_22C9A1A98();
  os_log_type_t v9 = sub_22C9A3A88();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_22C821000, v8, v9, "Unable to retrieve transformer", v10, 2u);
    MEMORY[0x230F710E0](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0;
}

Swift::Bool __swiftcall ICQUIRemoteExtensionEntry.extensionShouldAccept(_:)(NSXPCConnection a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  os_log_type_t v9 = a1.super.isa;
  uint64_t v10 = sub_22C9A1A98();
  os_log_type_t v11 = sub_22C9A3AA8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v22 = v4;
    uint64_t v12 = swift_slowAlloc();
    id v23 = v2;
    id v13 = (uint8_t *)v12;
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)id v13 = 138412290;
    uint64_t v24 = v9;
    uint64_t v14 = v9;
    uint64_t v4 = v22;
    sub_22C9A3C78();
    id v15 = v21;
    *uint64_t v21 = v9;

    _os_log_impl(&dword_22C821000, v10, v11, "Accepting connection %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v15, -1, -1);
    id v16 = v13;
    uint64_t v2 = v23;
    MEMORY[0x230F710E0](v16, -1, -1);
  }
  else
  {

    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  [(objc_class *)v9 setExportedObject:v2];
  os_log_type_t v17 = self;
  id v18 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_26E05DD38);
  [(objc_class *)v9 setExportedInterface:v18];

  id v19 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_26E075CE0);
  [(objc_class *)v9 setRemoteObjectInterface:v19];

  [(objc_class *)v9 resume];
  objc_msgSend(v2, sel_setCurrentConnection_, v9);
  return 1;
}

void __swiftcall ICQUIRemoteExtensionEntry.extensionMakeContentViewController()(UIViewController_optional *__return_ptr retstr)
{
  id v2 = objc_msgSend(v1, sel_transformer);
  if (v2)
  {
    objc_msgSend(v2, sel_makeContentViewController);
    swift_unknownObjectRelease();
  }
}

uint64_t ICQUIRemoteExtensionEntry.dismissViewController(error:)(void *a1)
{
  id v2 = v1;
  void aBlock[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_22C9A1AA8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  os_log_type_t v11 = (char *)&v39 - v10;
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v39 - v12;
  id v14 = objc_msgSend(v2, sel_currentConnection);
  if (v14)
  {
    id v15 = v14;
    aBlock[4] = sub_22C99731C;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22C8EB658;
    aBlock[3] = &block_descriptor_16;
    id v16 = _Block_copy(aBlock);
    id v17 = objc_msgSend(v15, sel_remoteObjectProxyWithErrorHandler_, v16);
    _Block_release(v16);
    sub_22C9A3CC8();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3F68);
    if (swift_dynamicCast())
    {
      id v18 = v43;
      uint64_t v19 = sub_22C8F8FBC();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v19, v4);
      id v20 = a1;
      id v21 = a1;
      uint64_t v22 = sub_22C9A1A98();
      os_log_type_t v23 = sub_22C9A3AA8();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v41 = v18;
        uint64_t v42 = v2;
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 138412290;
        if (a1)
        {
          id v25 = a1;
          uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
          aBlock[0] = v26;
          sub_22C9A3C78();
        }
        else
        {
          aBlock[0] = 0;
          sub_22C9A3C78();
          uint64_t v26 = 0;
        }
        uint64_t v36 = v40;
        *uint64_t v40 = v26;

        _os_log_impl(&dword_22C821000, v22, v23, "Sending dismiss signal to host with error %@", v24, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2684D2A50);
        swift_arrayDestroy();
        MEMORY[0x230F710E0](v36, -1, -1);
        MEMORY[0x230F710E0](v24, -1, -1);
        id v18 = v41;
        id v2 = v42;
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      if (a1)
      {
        aBlock[0] = a1;
        id v37 = a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2684D3F70);
        sub_22C998508();
        if (swift_dynamicCast()) {
          id v38 = v43;
        }
        else {
          id v38 = 0;
        }
      }
      else
      {
        id v38 = 0;
      }
      objc_msgSend(v18, sel_dismissViewControllerWithError_, v38);

      objc_msgSend(v2, sel_setCurrentConnection_, 0);
      return swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v32 = sub_22C8F8FBC();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v32, v4);
      uint64_t v33 = sub_22C9A1A98();
      os_log_type_t v34 = sub_22C9A3A88();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_22C821000, v33, v34, "Invalid proxy object", v35, 2u);
        MEMORY[0x230F710E0](v35, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    }
  }
  else
  {
    uint64_t v27 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v27, v4);
    id v28 = sub_22C9A1A98();
    os_log_type_t v29 = sub_22C9A3A78();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_22C821000, v28, v29, "View controller was dismissed.", v30, 2u);
      MEMORY[0x230F710E0](v30, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t sub_22C99731C(void *a1)
{
  uint64_t v2 = sub_22C9A1AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  id v8 = a1;
  uint64_t v9 = sub_22C9A1A98();
  os_log_type_t v10 = sub_22C9A3A88();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v12;
    *(_DWORD *)os_log_type_t v11 = 136315138;
    v16[1] = v11 + 4;
    swift_getErrorValue();
    uint64_t v13 = sub_22C9A4138();
    v16[2] = sub_22C8BA27C(v13, v14, &v17);
    sub_22C9A3C78();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22C821000, v9, v10, "Unable to get proxy object %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v12, -1, -1);
    MEMORY[0x230F710E0](v11, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t ICQUIRemoteExtensionEntry.startConnection(context:completion:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v52 = a2;
  uint64_t v7 = sub_22C9A1AA8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  os_log_type_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = sub_22C8F8FBC();
  id v15 = *(void (**)(char *, uint8_t *, uint64_t))(v8 + 16);
  uint64_t v47 = (uint8_t *)v14;
  uint64_t v48 = (char *)(v8 + 16);
  uint64_t v46 = v15;
  ((void (*)(char *))v15)(v13);
  swift_bridgeObjectRetain_n();
  id v16 = sub_22C9A1A98();
  os_log_type_t v17 = sub_22C9A3AA8();
  LODWORD(v51) = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v54 = v45;
    *(_DWORD *)uint64_t v18 = 136315906;
    os_log_t v44 = v16;
    uint64_t v53 = sub_22C8BA27C(0xD000000000000028, 0x800000022C9C1DB0, &v54);
    uint64_t v50 = a3;
    sub_22C9A3C78();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v53 = sub_22C8BA27C(0xD000000000000024, 0x800000022C9C1DE0, &v54);
    sub_22C9A3C78();
    *(_WORD *)(v18 + 22) = 2048;
    uint64_t v53 = 100;
    sub_22C9A3C78();
    *(_WORD *)(v18 + 32) = 2080;
    uint64_t v43 = v18 + 34;
    swift_bridgeObjectRetain();
    uint64_t v49 = v8;
    uint64_t v19 = sub_22C9A3628();
    id v20 = v11;
    uint64_t v21 = v7;
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_22C8BA27C(v19, v23, &v54);
    a3 = v50;
    sub_22C9A3C78();
    swift_bridgeObjectRelease_n();
    uint64_t v7 = v21;
    os_log_type_t v11 = v20;
    swift_bridgeObjectRelease();
    os_log_t v24 = v44;
    _os_log_impl(&dword_22C821000, v44, (os_log_type_t)v51, "%s: %s - line %ld: Connection to extension has been established!, setting offer context %s", (uint8_t *)v18, 0x2Au);
    uint64_t v25 = v45;
    uint64_t v8 = v49;
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v25, -1, -1);
    MEMORY[0x230F710E0](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v13, v7);
  if (sub_22C997B24(a1))
  {
    uint64_t v27 = (void *)sub_22C9A3608();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setOfferContext_, v27);
  }
  else
  {
    v46(v11, v47, v7);
    swift_bridgeObjectRetain_n();
    os_log_type_t v29 = v11;
    uint64_t v30 = sub_22C9A1A98();
    os_log_type_t v31 = sub_22C9A3A88();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v51 = v7;
      uint64_t v32 = swift_slowAlloc();
      uint64_t v48 = v29;
      uint64_t v33 = (uint8_t *)v32;
      uint64_t v34 = swift_slowAlloc();
      uint64_t v50 = a3;
      uint64_t v35 = v34;
      uint64_t v54 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      uint64_t v47 = v33 + 4;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_22C9A3628();
      uint64_t v49 = v8;
      uint64_t v37 = v36;
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      uint64_t v53 = sub_22C8BA27C(v37, v39, &v54);
      sub_22C9A3C78();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22C821000, v30, v31, "Invalid context %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v35, -1, -1);
      MEMORY[0x230F710E0](v33, -1, -1);

      uint64_t v40 = v48;
      uint64_t v41 = v51;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v40 = v29;
      uint64_t v41 = v7;
    }
    uint64_t v28 = ((uint64_t (*)(char *, uint64_t))v26)(v40, v41);
  }
  return v52(v28);
}

unint64_t sub_22C997B24(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2684D1850);
    uint64_t v2 = (void *)sub_22C9A3FA8();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_22C91F4B8();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_22C96D3E4(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_22C8BA924(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_22C96D3E4((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_22C98D800((uint64_t)v30);
      swift_bridgeObjectRelease();
      sub_22C91F4B8();
      swift_release();
      return 0;
    }
    sub_22C8BA924((uint64_t)v31 + 8, (uint64_t)v25);
    sub_22C98D800((uint64_t)v30);
    sub_22C8CEC24(v25, v26);
    long long v27 = v24;
    sub_22C8CEC24(v26, v28);
    long long v16 = v27;
    sub_22C8CEC24(v28, v29);
    sub_22C8CEC24(v29, &v27);
    unint64_t result = sub_22C8F3BF8(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      _OWORD *v8 = v16;
      uint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      unint64_t result = (unint64_t)sub_22C8CEC24(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_22C8CEC24(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void *sub_22C997FDC()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22C99808C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t sub_22C9980E0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x58))();
  *a2 = result;
  return result;
}

uint64_t sub_22C99813C(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & **a2) + 0x60);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_22C9981A4())()
{
  return j__swift_endAccess;
}

id RemoteExtensionScene.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id RemoteExtensionScene.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteExtensionScene();
  return objc_msgSendSuper2(&v2, sel_init);
}

id RemoteExtensionScene.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteExtensionScene();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _sSo25ICQUIRemoteExtensionEntryC13iCloudQuotaUIE34extensionPrepareForSceneConnection4withySo21_EXSceneConfigurationC_tF_0(void *a1)
{
  uint64_t v2 = sub_22C9A1AA8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    int64_t v7 = (void *)v6;
    type metadata accessor for RemoteExtensionScene();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v15 = a1;
    objc_msgSend(v7, sel_setSceneClass_, ObjCClassFromMetadata);
    type metadata accessor for RemoteExtensionViewController();
    objc_msgSend(v7, sel_setViewControllerClass_, swift_getObjCClassFromMetadata());
    uint64_t v9 = v15;
  }
  else
  {
    uint64_t v10 = sub_22C8F8FBC();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
    unint64_t v11 = sub_22C9A1A98();
    os_log_type_t v12 = sub_22C9A3A88();
    if (os_log_type_enabled(v11, v12))
    {
      int64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v13 = 0;
      _os_log_impl(&dword_22C821000, v11, v12, "Unable to retrieve configuration!", v13, 2u);
      MEMORY[0x230F710E0](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4__isPlatformVersionAtLeast(2, 18, 1, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

unint64_t sub_22C998508()
{
  unint64_t result = qword_2684D3F78;
  if (!qword_2684D3F78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2684D3F78);
  }
  return result;
}

uint64_t type metadata accessor for RemoteExtensionScene()
{
  return self;
}

uint64_t method lookup function for RemoteExtensionScene(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RemoteExtensionScene);
}

uint64_t dispatch thunk of RemoteExtensionScene.viewController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of RemoteExtensionScene.viewController.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RemoteExtensionScene.viewController.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t sub_22C998620(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_22C9A1AA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v12 = (char *)&v43 - v11;
  uint64_t v13 = sub_22C8F8FBC();
  uint64_t v14 = *(void (**)(char *, uint8_t *, uint64_t))(v7 + 16);
  uint64_t v48 = (uint8_t *)v13;
  uint64_t v49 = v7 + 16;
  uint64_t v47 = v14;
  ((void (*)(char *))v14)(v12);
  swift_bridgeObjectRetain_n();
  id v15 = sub_22C9A1A98();
  os_log_type_t v16 = sub_22C9A3AA8();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v50 = v10;
    uint64_t v19 = v18;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v54 = v46;
    *(_DWORD *)uint64_t v19 = 136315906;
    int v45 = v17;
    uint64_t v20 = sub_22C8BA27C(0xD000000000000028, 0x800000022C9C1DB0, &v54);
    uint64_t v52 = v6;
    uint64_t v53 = v20;
    sub_22C9A3C78();
    os_log_t v44 = v15;
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v53 = sub_22C8BA27C(0xD000000000000024, 0x800000022C9C1DE0, &v54);
    sub_22C9A3C78();
    *(_WORD *)(v19 + 22) = 2048;
    uint64_t v53 = 100;
    sub_22C9A3C78();
    *(_WORD *)(v19 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v51 = v7;
    uint64_t v21 = a2;
    uint64_t v22 = a3;
    uint64_t v23 = sub_22C9A3628();
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v26 = v23;
    a3 = v22;
    a2 = v21;
    uint64_t v53 = sub_22C8BA27C(v26, v25, &v54);
    uint64_t v6 = v52;
    sub_22C9A3C78();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v27 = v44;
    _os_log_impl(&dword_22C821000, v44, (os_log_type_t)v45, "%s: %s - line %ld: Connection to extension has been established!, setting offer context %s", (uint8_t *)v19, 0x2Au);
    uint64_t v28 = v46;
    uint64_t v7 = v51;
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v28, -1, -1);
    uint64_t v29 = v19;
    uint64_t v10 = v50;
    MEMORY[0x230F710E0](v29, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  v30(v12, v6);
  if (sub_22C997B24(a1))
  {
    os_log_type_t v31 = (void *)sub_22C9A3608();
    swift_bridgeObjectRelease();
    objc_msgSend(a2, sel_setOfferContext_, v31);
  }
  else
  {
    v47(v10, v48, v6);
    swift_bridgeObjectRetain_n();
    uint64_t v32 = sub_22C9A1A98();
    os_log_type_t v33 = sub_22C9A3A88();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v51 = v7;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v52 = v6;
      uint64_t v36 = v35;
      uint64_t v54 = v35;
      uint64_t v49 = a3;
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v48 = v34 + 4;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_22C9A3628();
      uint64_t v50 = v10;
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      uint64_t v53 = sub_22C8BA27C(v37, v39, &v54);
      a3 = v49;
      sub_22C9A3C78();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22C821000, v32, v33, "Invalid context %s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230F710E0](v36, -1, -1);
      MEMORY[0x230F710E0](v34, -1, -1);

      uint64_t v40 = v50;
      uint64_t v41 = v52;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v40 = v10;
      uint64_t v41 = v6;
    }
    v30(v40, v41);
  }
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_22C998B8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SpecifierRow() + 24);
  return sub_22C8DC7C8(v3, a1);
}

uint64_t type metadata accessor for SpecifierRow()
{
  uint64_t result = qword_2684E09E0;
  if (!qword_2684E09E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C998C1C()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SpecifierRow() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C998C5C()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SpecifierRow() + 32));
  swift_retain();
  return v1;
}

uint64_t sub_22C998C9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for SpecifierView();
  MEMORY[0x270FA5388](v29);
  uint64_t v6 = (uint64_t *)((char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D4060);
  MEMORY[0x270FA5388](v27);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D4068);
  uint64_t v9 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SpecifierRow();
  uint64_t v13 = (uint64_t *)((char *)v1 + *(int *)(v12 + 28));
  uint64_t v14 = v13[1];
  if (v14)
  {
    uint64_t v15 = *v13;
    uint64_t v17 = *v1;
    uint64_t v16 = v1[1];
    uint64_t v18 = v1[3];
    uint64_t v26 = v1[2];
    sub_22C8DC7C8((uint64_t)v1 + *(int *)(v12 + 24), (uint64_t)v4);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = nullsub_1(v15, v14);
    sub_22C920894(v17, v16, v26, v18, (uint64_t)v4, v19, v20, v21, v6, v22);
    sub_22C99AF88((uint64_t)v6, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for SpecifierView);
    swift_storeEnumTagMultiPayload();
    sub_22C8C6FAC(&qword_2684D4070, &qword_2684D4068);
    sub_22C999860(&qword_2684D4078, (void (*)(uint64_t))type metadata accessor for SpecifierView);
    sub_22C9A2548();
    return sub_22C99AFF0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for SpecifierView);
  }
  else
  {
    MEMORY[0x270FA5388](v12);
    sub_22C999860(&qword_2684D4078, (void (*)(uint64_t))type metadata accessor for SpecifierView);
    swift_retain();
    sub_22C9A2D88();
    uint64_t v24 = v28;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v8, v11, v28);
    swift_storeEnumTagMultiPayload();
    sub_22C8C6FAC(&qword_2684D4070, &qword_2684D4068);
    sub_22C9A2548();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v24);
  }
}

uint64_t sub_22C9990E8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v11 = type metadata accessor for SpecifierRow();
  sub_22C8DC7C8((uint64_t)a1 + *(int *)(v11 + 24), (uint64_t)v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_22C920894(v7, v8, v9, v10, (uint64_t)v6, 0, 0, 0, a2, 0);
}

uint64_t sub_22C9991D0@<X0>(void *a1@<X8>)
{
  return sub_22C9990E8(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_22C9991D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  uint64_t v15 = (int *)type metadata accessor for SpecifierRow();
  uint64_t result = sub_22C965F58(a5, (uint64_t)a9 + v15[6]);
  uint64_t v17 = (void *)((char *)a9 + v15[7]);
  *uint64_t v17 = a6;
  v17[1] = a7;
  uint64_t v18 = (void *)((char *)a9 + v15[8]);
  *uint64_t v18 = a8;
  v18[1] = a10;
  return result;
}

uint64_t sub_22C999264()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22C9A14E8();
  __swift_allocate_value_buffer(v3, qword_2684E0848);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2684E0848);
  sub_22C9A14D8();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_22C999394()
{
  uint64_t v0 = sub_22C9A21D8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D4080);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D4088);
  sub_22C8C6FAC(&qword_2684D4090, &qword_2684D4088);
  sub_22C9A27D8();
  sub_22C9A2FB8();
  sub_22C8C6FAC(&qword_2684D4098, &qword_2684D4080);
  sub_22C999860((unint64_t *)&qword_2684D1B00, MEMORY[0x263F18F38]);
  sub_22C9A2B48();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_22C9995E4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D40C0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v19 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v19 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684D40C8);
  sub_22C8C6FAC(&qword_2684D40D0, &qword_2684D40C8);
  sub_22C9A2F58();
  sub_22C9A2F58();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v15(v9, v14, v2);
  v15(v6, v12, v2);
  v15(a1, v9, v2);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D40D8);
  v15(&a1[*(int *)(v16 + 48)], v6, v2);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v12, v2);
  v17(v14, v2);
  v17(v6, v2);
  return ((uint64_t (*)(char *, uint64_t))v17)(v9, v2);
}

uint64_t sub_22C999860(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22C9998A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (int *)type metadata accessor for SpecifierRow();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v31 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v30 = (uint64_t)&v29 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)((char *)&v29 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v29 - v12);
  if (qword_2684E0840 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_22C9A14E8();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_2684E0848);
  uint64_t v16 = *(void *)(v14 - 8);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v17(v3, v15, v14);
  uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
  v18(v3, 0, 1, v14);
  *uint64_t v13 = 0xD000000000000014;
  v13[1] = 0x800000022C9C1F90;
  v13[2] = 0;
  uint64_t v13[3] = 0;
  sub_22C965F58((uint64_t)v3, (uint64_t)v13 + v4[6]);
  uint64_t v19 = (void *)((char *)v13 + v4[7]);
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (void *)((char *)v13 + v4[8]);
  *uint64_t v20 = nullsub_1;
  v20[1] = 0;
  uint64_t v21 = (char *)v11 + v4[6];
  v17(v21, v15, v14);
  v18(v21, 0, 1, v14);
  *uint64_t v11 = 0xD000000000000011;
  v11[1] = 0x800000022C9C1FB0;
  void v11[2] = 0xD000000000000012;
  v11[3] = 0x800000022C9C1FD0;
  uint64_t v22 = (void *)((char *)v11 + v4[7]);
  *uint64_t v22 = 0;
  v22[1] = 0;
  uint64_t v23 = (void *)((char *)v11 + v4[8]);
  void *v23 = nullsub_1;
  v23[1] = 0;
  uint64_t v24 = v30;
  sub_22C99AF88((uint64_t)v13, v30, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  uint64_t v25 = v31;
  sub_22C99AF88((uint64_t)v11, v31, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  uint64_t v26 = v32;
  sub_22C99AF88(v24, v32, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D40E0);
  sub_22C99AF88(v25, v26 + *(int *)(v27 + 48), (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  sub_22C99AFF0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  sub_22C99AFF0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  sub_22C99AFF0(v25, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  return sub_22C99AFF0(v24, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
}

uint64_t sub_22C999C38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (int *)type metadata accessor for SpecifierRow();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v30 = (uint64_t)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v29 = (uint64_t)&v28 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)((char *)&v28 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v28 - v12);
  if (qword_2684E0840 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_22C9A14E8();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_2684E0848);
  uint64_t v16 = *(void *)(v14 - 8);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v17(v3, v15, v14);
  uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
  v18(v3, 0, 1, v14);
  *uint64_t v13 = 0xD000000000000015;
  v13[1] = 0x800000022C9C1F20;
  v13[2] = 0;
  uint64_t v13[3] = 0;
  sub_22C965F58((uint64_t)v3, (uint64_t)v13 + v4[6]);
  *(_OWORD *)((char *)v13 + v4[7]) = xmmword_22C9B5D30;
  uint64_t v19 = (void *)((char *)v13 + v4[8]);
  *uint64_t v19 = nullsub_1;
  v19[1] = 0;
  uint64_t v20 = (char *)v11 + v4[6];
  v17(v20, v15, v14);
  v18(v20, 0, 1, v14);
  *uint64_t v11 = 0xD00000000000001ELL;
  v11[1] = 0x800000022C9C1F40;
  void v11[2] = 0;
  v11[3] = 0;
  uint64_t v21 = (void *)((char *)v11 + v4[7]);
  *uint64_t v21 = 0x1000000000000026;
  v21[1] = 0x800000022C9C1F60;
  uint64_t v22 = (void *)((char *)v11 + v4[8]);
  *uint64_t v22 = nullsub_1;
  v22[1] = 0;
  uint64_t v23 = v29;
  sub_22C99AF88((uint64_t)v13, v29, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  uint64_t v24 = v30;
  sub_22C99AF88((uint64_t)v11, v30, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  uint64_t v25 = v31;
  sub_22C99AF88(v23, v31, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2684D40E0);
  sub_22C99AF88(v24, v25 + *(int *)(v26 + 48), (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  sub_22C99AFF0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  sub_22C99AFF0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  sub_22C99AFF0(v24, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
  return sub_22C99AFF0(v23, (uint64_t (*)(void))type metadata accessor for SpecifierRow);
}

uint64_t sub_22C999FD0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22C999FF0()
{
  unint64_t result = qword_2684D40A0;
  if (!qword_2684D40A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D40A0);
  }
  return result;
}

uint64_t sub_22C99A044()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22C99A060(uint64_t a1)
{
  unint64_t v2 = sub_22C99AF2C();
  return MEMORY[0x270F00208](a1, v2);
}

uint64_t sub_22C99A0AC(uint64_t a1)
{
  unint64_t v2 = sub_22C99AF2C();
  return MEMORY[0x270F001F8](a1, v2);
}

uint64_t *sub_22C99A0F8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[6];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_22C9A14E8();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (uint64_t *)((char *)v4 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (uint64_t *)((char *)v4 + v17);
    uint64_t v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_22C99A2C8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_22C9A14E8();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

void *sub_22C99A3B4(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  uint64_t v10 = sub_22C9A14E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v14);
  uint64_t v17 = (void *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = (void *)((char *)a1 + v15);
  uint64_t v20 = (void *)((char *)a2 + v15);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_22C99A538(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22C9A14E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = (void *)((char *)a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_22C99A748(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_22C9A14E8();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  return a1;
}

void *sub_22C99A880(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_22C9A14E8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_22C99AA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C99AA68);
}

uint64_t sub_22C99AA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C99AB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C99AB30);
}

uint64_t sub_22C99AB30(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684D14A8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_22C99ABDC()
{
  sub_22C921CC8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for SpecifierRow.Style(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SpecifierRow.Style(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_22C99AD30(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_22C99AD48(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SpecifierRow.Style()
{
  return &type metadata for SpecifierRow.Style;
}

ValueMetadata *type metadata accessor for SpecifierRow_Previews()
{
  return &type metadata for SpecifierRow_Previews;
}

unint64_t sub_22C99AD8C()
{
  unint64_t result = qword_2684D40A8;
  if (!qword_2684D40A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2684D40B0);
    sub_22C8C6FAC(&qword_2684D4070, &qword_2684D4068);
    sub_22C999860(&qword_2684D4078, (void (*)(uint64_t))type metadata accessor for SpecifierView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D40A8);
  }
  return result;
}

uint64_t sub_22C99AE5C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22C99AF2C()
{
  unint64_t result = qword_2684D40B8;
  if (!qword_2684D40B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684D40B8);
  }
  return result;
}

uint64_t sub_22C99AF88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22C99AFF0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_22C99B050()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2684E09F8 = (uint64_t)result;
  return result;
}

uint64_t sub_22C99B0A4(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0C00);
}

uint64_t sub_22C99B0C8()
{
  return sub_22C99B708(&qword_2684E0A00, (uint64_t)qword_2684E0C00);
}

uint64_t sub_22C99B0EC@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A00, (uint64_t)qword_2684E0C00, a1);
}

uint64_t sub_22C99B110(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0C18);
}

uint64_t sub_22C99B12C()
{
  return sub_22C99B708(&qword_2684E0A08, (uint64_t)qword_2684E0C18);
}

uint64_t sub_22C99B150@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A08, (uint64_t)qword_2684E0C18, a1);
}

uint64_t sub_22C99B174(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0C30);
}

uint64_t sub_22C99B198()
{
  return sub_22C99B708(&qword_2684E0A10, (uint64_t)qword_2684E0C30);
}

uint64_t sub_22C99B1BC@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A10, (uint64_t)qword_2684E0C30, a1);
}

uint64_t sub_22C99B1E0(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0C48);
}

uint64_t sub_22C99B204()
{
  return sub_22C99B708(&qword_2684E0A18, (uint64_t)qword_2684E0C48);
}

uint64_t sub_22C99B228@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A18, (uint64_t)qword_2684E0C48, a1);
}

uint64_t sub_22C99B24C(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0C60);
}

uint64_t sub_22C99B270()
{
  return sub_22C99B708(&qword_2684E0A20, (uint64_t)qword_2684E0C60);
}

uint64_t sub_22C99B294@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A20, (uint64_t)qword_2684E0C60, a1);
}

uint64_t sub_22C99B2B8(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0C78);
}

uint64_t sub_22C99B2DC()
{
  return sub_22C99B708(&qword_2684E0A28, (uint64_t)qword_2684E0C78);
}

uint64_t sub_22C99B300@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A28, (uint64_t)qword_2684E0C78, a1);
}

uint64_t sub_22C99B324(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0C90);
}

uint64_t sub_22C99B348()
{
  return sub_22C99B708(&qword_2684E0A30, (uint64_t)qword_2684E0C90);
}

uint64_t sub_22C99B36C@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A30, (uint64_t)qword_2684E0C90, a1);
}

uint64_t sub_22C99B390(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0CA8);
}

uint64_t sub_22C99B3B4()
{
  return sub_22C99B708(&qword_2684E0A38, (uint64_t)qword_2684E0CA8);
}

uint64_t sub_22C99B3D8@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A38, (uint64_t)qword_2684E0CA8, a1);
}

uint64_t sub_22C99B3FC(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0CC0);
}

uint64_t sub_22C99B420()
{
  return sub_22C99B708(&qword_2684E0A40, (uint64_t)qword_2684E0CC0);
}

uint64_t sub_22C99B444@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A40, (uint64_t)qword_2684E0CC0, a1);
}

uint64_t sub_22C99B468(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0CD8);
}

uint64_t sub_22C99B48C()
{
  return sub_22C99B708(&qword_2684E0A48, (uint64_t)qword_2684E0CD8);
}

uint64_t sub_22C99B4B0@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A48, (uint64_t)qword_2684E0CD8, a1);
}

uint64_t sub_22C99B4D4(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0CF0);
}

uint64_t sub_22C99B4F8()
{
  return sub_22C99B708(&qword_2684E0A50, (uint64_t)qword_2684E0CF0);
}

uint64_t sub_22C99B51C@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A50, (uint64_t)qword_2684E0CF0, a1);
}

uint64_t sub_22C99B540(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0D08);
}

uint64_t sub_22C99B568()
{
  return sub_22C99B708(&qword_2684E0A58, (uint64_t)qword_2684E0D08);
}

uint64_t sub_22C99B58C@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A58, (uint64_t)qword_2684E0D08, a1);
}

uint64_t sub_22C99B5B0(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0D20);
}

uint64_t sub_22C99B5D4()
{
  return sub_22C99B708(&qword_2684E0A60, (uint64_t)qword_2684E0D20);
}

uint64_t sub_22C99B5F8@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A60, (uint64_t)qword_2684E0D20, a1);
}

uint64_t sub_22C99B61C(uint64_t a1)
{
  return sub_22C99B640(a1, qword_2684E0D38);
}

uint64_t sub_22C99B640(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22C9A1998();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_2684E09F0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2684E09F8;
  return sub_22C9A1988();
}

uint64_t sub_22C99B6E4()
{
  return sub_22C99B708(&qword_2684E0A68, (uint64_t)qword_2684E0D38);
}

uint64_t sub_22C99B708(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_22C9A1998();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_22C99B75C@<X0>(uint64_t a1@<X8>)
{
  return sub_22C99B780(&qword_2684E0A68, (uint64_t)qword_2684E0D38, a1);
}

uint64_t sub_22C99B780@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_22C9A1998();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  if (qword_2684E0A80 == -1)
  {
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_2684E0A80, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_2684E0A74 > a2) {
    return 1;
  }
  return dword_2684E0A74 >= a2 && dword_2684E0A78 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_2684E0A88 == -1)
  {
    if (qword_2684E0A90) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_2684E0A88, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2684E0A90) {
      return _availability_version_check();
    }
  }
  if (qword_2684E0A80 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_2684E0A80, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_2684E0A74 > a3) {
    return 1;
  }
  return dword_2684E0A74 >= a3 && dword_2684E0A78 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_2684E0A90;
  if (qword_2684E0A90) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_2684E0A90 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        id v4 = *(unsigned __int8 **)result;
        id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        id result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x230F706D0](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2684E0A74, &dword_2684E0A78);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t __getFALaunchServicesHookClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getINDaemonConnectionClass_block_invoke_cold_1(v0);
}

uint64_t __getINDaemonConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFACircleStateControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getFACircleStateControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFACircleContextClass_block_invoke_cold_1(v0);
}

uint64_t __getFACircleContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICQUIiCloudPlusSpecifierProvider _buildiCloudPlusSpecifiers](v0);
}

uint64_t __getSUManagerClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSUScanOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getSUScanOptionsClass_block_invoke_cold_1()
{
  return __getSUDownloadPolicyFactoryClass_block_invoke_cold_1();
}

uint64_t __getSUDownloadPolicyFactoryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_cold_1(v0);
}

void ICQUSLogForCategory_cold_1()
{
}

uint64_t __getPSGBackupUtilsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_1(v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](v0);
}

uint64_t __getAFUICloudStorageViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKHealthManageStorageViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthManageStorageViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICQLinkInAppAction _launchFlowManagerWithContext:](v0);
}

uint64_t sub_22C9A12B8()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_22C9A12C8()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_22C9A12D8()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_22C9A12E8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_22C9A12F8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_22C9A1308()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_22C9A1318()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_22C9A1328()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_22C9A1338()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_22C9A1348()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_22C9A1358()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_22C9A1368()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_22C9A1378()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22C9A1388()
{
  return MEMORY[0x270F816C0]();
}

uint64_t sub_22C9A1398()
{
  return MEMORY[0x270EEEC10]();
}

uint64_t sub_22C9A13A8()
{
  return MEMORY[0x270EEEC18]();
}

uint64_t sub_22C9A13B8()
{
  return MEMORY[0x270EEEC20]();
}

uint64_t sub_22C9A13C8()
{
  return MEMORY[0x270EEEC28]();
}

uint64_t sub_22C9A13D8()
{
  return MEMORY[0x270EEED68]();
}

uint64_t sub_22C9A13E8()
{
  return MEMORY[0x270EEED70]();
}

uint64_t sub_22C9A13F8()
{
  return MEMORY[0x270EEEDD0]();
}

uint64_t sub_22C9A1408()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_22C9A1418()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_22C9A1428()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_22C9A1438()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_22C9A1448()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_22C9A1458()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_22C9A1468()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_22C9A1478()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_22C9A1488()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22C9A1498()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_22C9A14A8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22C9A14B8()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_22C9A14C8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22C9A14D8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_22C9A14E8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22C9A14F8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22C9A1508()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22C9A1518()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_22C9A1528()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_22C9A1538()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22C9A1548()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22C9A1558()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22C9A1568()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22C9A1578()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22C9A1588()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22C9A1598()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22C9A15A8()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_22C9A15B8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22C9A15C8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22C9A15D8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_22C9A15E8()
{
  return MEMORY[0x270EF1648]();
}

uint64_t sub_22C9A15F8()
{
  return MEMORY[0x270EF1678]();
}

uint64_t sub_22C9A1608()
{
  return MEMORY[0x270EF16A8]();
}

uint64_t sub_22C9A1618()
{
  return MEMORY[0x270EF16B0]();
}

uint64_t sub_22C9A1628()
{
  return MEMORY[0x270EF16C8]();
}

uint64_t sub_22C9A1638()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_22C9A1648()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_22C9A1658()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_22C9A1668()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_22C9A1678()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_22C9A1688()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_22C9A1698()
{
  return MEMORY[0x270F87C78]();
}

uint64_t sub_22C9A16A8()
{
  return MEMORY[0x270F87C80]();
}

uint64_t sub_22C9A16B8()
{
  return MEMORY[0x270F87C88]();
}

uint64_t sub_22C9A16C8()
{
  return MEMORY[0x270F87C90]();
}

uint64_t sub_22C9A16D8()
{
  return MEMORY[0x270F87C98]();
}

uint64_t sub_22C9A16E8()
{
  return MEMORY[0x270F87CA0]();
}

uint64_t sub_22C9A16F8()
{
  return MEMORY[0x270F87CA8]();
}

uint64_t sub_22C9A1708()
{
  return MEMORY[0x270F87CB0]();
}

uint64_t sub_22C9A1728()
{
  return MEMORY[0x270F87CC0]();
}

uint64_t sub_22C9A1738()
{
  return MEMORY[0x270F87CC8]();
}

uint64_t sub_22C9A1748()
{
  return MEMORY[0x270F87CD0]();
}

uint64_t sub_22C9A1758()
{
  return MEMORY[0x270F87CD8]();
}

uint64_t sub_22C9A1768()
{
  return MEMORY[0x270F87CE0]();
}

uint64_t sub_22C9A1778()
{
  return MEMORY[0x270F87CE8]();
}

uint64_t sub_22C9A1788()
{
  return MEMORY[0x270F87CF0]();
}

uint64_t sub_22C9A1798()
{
  return MEMORY[0x270F87CF8]();
}

uint64_t sub_22C9A17A8()
{
  return MEMORY[0x270EEB990]();
}

uint64_t sub_22C9A17B8()
{
  return MEMORY[0x270EEB9A8]();
}

uint64_t sub_22C9A17C8()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_22C9A17D8()
{
  return MEMORY[0x270F53BA0]();
}

uint64_t sub_22C9A17E8()
{
  return MEMORY[0x270F53BA8]();
}

uint64_t sub_22C9A17F8()
{
  return MEMORY[0x270F53BB0]();
}

uint64_t sub_22C9A1808()
{
  return MEMORY[0x270F53BB8]();
}

uint64_t sub_22C9A1818()
{
  return MEMORY[0x270F53BC0]();
}

uint64_t sub_22C9A1828()
{
  return MEMORY[0x270F53BC8]();
}

uint64_t sub_22C9A1838()
{
  return MEMORY[0x270F53BD0]();
}

uint64_t sub_22C9A1848()
{
  return MEMORY[0x270F53BD8]();
}

uint64_t sub_22C9A1858()
{
  return MEMORY[0x270F53BE0]();
}

uint64_t sub_22C9A1868()
{
  return MEMORY[0x270F53BE8]();
}

uint64_t sub_22C9A1878()
{
  return MEMORY[0x270F53BF0]();
}

uint64_t sub_22C9A1888()
{
  return MEMORY[0x270F87660]();
}

uint64_t sub_22C9A1898()
{
  return MEMORY[0x270F87668]();
}

uint64_t sub_22C9A18A8()
{
  return MEMORY[0x270EEB7E8]();
}

uint64_t sub_22C9A18B8()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_22C9A18C8()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_22C9A18D8()
{
  return MEMORY[0x270EEB810]();
}

uint64_t sub_22C9A18E8()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_22C9A18F8()
{
  return MEMORY[0x270EEB830]();
}

uint64_t sub_22C9A1908()
{
  return MEMORY[0x270EEB848]();
}

uint64_t sub_22C9A1928()
{
  return MEMORY[0x270EEB858]();
}

uint64_t sub_22C9A1938()
{
  return MEMORY[0x270EEB870]();
}

uint64_t sub_22C9A1948()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_22C9A1958()
{
  return MEMORY[0x270F16D20]();
}

uint64_t sub_22C9A1968()
{
  return MEMORY[0x270F16D28]();
}

uint64_t sub_22C9A1978()
{
  return MEMORY[0x270F16D50]();
}

uint64_t sub_22C9A1988()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_22C9A1998()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_22C9A19A8()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_22C9A19B8()
{
  return MEMORY[0x270FA17A0]();
}

uint64_t sub_22C9A19C8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_22C9A19D8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_22C9A19E8()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_22C9A19F8()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_22C9A1A08()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_22C9A1A18()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_22C9A1A28()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_22C9A1A38()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_22C9A1A48()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_22C9A1A58()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_22C9A1A68()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_22C9A1A78()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_22C9A1A88()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_22C9A1A98()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22C9A1AA8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22C9A1AB8()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_22C9A1AC8()
{
  return MEMORY[0x270F823E0]();
}

uint64_t sub_22C9A1AD8()
{
  return MEMORY[0x270F823F8]();
}

uint64_t sub_22C9A1AF8()
{
  return MEMORY[0x270F46FF8]();
}

uint64_t sub_22C9A1B08()
{
  return MEMORY[0x270F47010]();
}

uint64_t sub_22C9A1B18()
{
  return MEMORY[0x270F47018]();
}

uint64_t sub_22C9A1B28()
{
  return MEMORY[0x270F47030]();
}

uint64_t sub_22C9A1B58()
{
  return MEMORY[0x270F47060]();
}

uint64_t sub_22C9A1B68()
{
  return MEMORY[0x270F47070]();
}

uint64_t sub_22C9A1B78()
{
  return MEMORY[0x270F47078]();
}

uint64_t sub_22C9A1B88()
{
  return MEMORY[0x270F47098]();
}

uint64_t sub_22C9A1B98()
{
  return MEMORY[0x270F470A0]();
}

uint64_t sub_22C9A1BA8()
{
  return MEMORY[0x270F470B0]();
}

uint64_t sub_22C9A1BB8()
{
  return MEMORY[0x270F470B8]();
}

uint64_t sub_22C9A1BC8()
{
  return MEMORY[0x270F470C0]();
}

uint64_t sub_22C9A1C08()
{
  return MEMORY[0x270F470E0]();
}

uint64_t sub_22C9A1C18()
{
  return MEMORY[0x270F470F0]();
}

uint64_t sub_22C9A1C28()
{
  return MEMORY[0x270F470F8]();
}

uint64_t sub_22C9A1C38()
{
  return MEMORY[0x270F47100]();
}

uint64_t sub_22C9A1C48()
{
  return MEMORY[0x270F47108]();
}

uint64_t sub_22C9A1C58()
{
  return MEMORY[0x270F47118]();
}

uint64_t sub_22C9A1C68()
{
  return MEMORY[0x270F47120]();
}

uint64_t sub_22C9A1C78()
{
  return MEMORY[0x270F47128]();
}

uint64_t sub_22C9A1C88()
{
  return MEMORY[0x270F47138]();
}

uint64_t sub_22C9A1C98()
{
  return MEMORY[0x270F47140]();
}

uint64_t sub_22C9A1CA8()
{
  return MEMORY[0x270F47148]();
}

uint64_t sub_22C9A1CB8()
{
  return MEMORY[0x270F47158]();
}

uint64_t sub_22C9A1CC8()
{
  return MEMORY[0x270F47160]();
}

uint64_t sub_22C9A1CD8()
{
  return MEMORY[0x270F47168]();
}

uint64_t sub_22C9A1CE8()
{
  return MEMORY[0x270F47170]();
}

uint64_t sub_22C9A1CF8()
{
  return MEMORY[0x270F47178]();
}

uint64_t sub_22C9A1D08()
{
  return MEMORY[0x270F47180]();
}

uint64_t sub_22C9A1D18()
{
  return MEMORY[0x270F47198]();
}

uint64_t sub_22C9A1D28()
{
  return MEMORY[0x270F471A8]();
}

uint64_t sub_22C9A1D38()
{
  return MEMORY[0x270F471B8]();
}

uint64_t sub_22C9A1D48()
{
  return MEMORY[0x270F471C8]();
}

uint64_t sub_22C9A1D58()
{
  return MEMORY[0x270F471D0]();
}

uint64_t sub_22C9A1D68()
{
  return MEMORY[0x270F471D8]();
}

uint64_t sub_22C9A1D78()
{
  return MEMORY[0x270F471E8]();
}

uint64_t sub_22C9A1D88()
{
  return MEMORY[0x270F471F0]();
}

uint64_t sub_22C9A1D98()
{
  return MEMORY[0x270F471F8]();
}

uint64_t sub_22C9A1DA8()
{
  return MEMORY[0x270F47200]();
}

uint64_t sub_22C9A1DB8()
{
  return MEMORY[0x270F47208]();
}

uint64_t sub_22C9A1DC8()
{
  return MEMORY[0x270F47210]();
}

uint64_t sub_22C9A1DD8()
{
  return MEMORY[0x270EE3990]();
}

uint64_t sub_22C9A1DE8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_22C9A1DF8()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_22C9A1E08()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_22C9A1E18()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_22C9A1E28()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_22C9A1E38()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_22C9A1E48()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_22C9A1E58()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_22C9A1E68()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_22C9A1E78()
{
  return MEMORY[0x270EE3EA8]();
}

uint64_t sub_22C9A1E88()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_22C9A1E98()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_22C9A1EA8()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_22C9A1EB8()
{
  return MEMORY[0x270EFEC50]();
}

uint64_t sub_22C9A1EC8()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_22C9A1ED8()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_22C9A1EE8()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_22C9A1EF8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_22C9A1F08()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_22C9A1F18()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_22C9A1F28()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_22C9A1F38()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_22C9A1F48()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_22C9A1F58()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_22C9A1F68()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_22C9A1F78()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_22C9A1F88()
{
  return MEMORY[0x270EFF208]();
}

uint64_t sub_22C9A1F98()
{
  return MEMORY[0x270EFF220]();
}

uint64_t sub_22C9A1FA8()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_22C9A1FB8()
{
  return MEMORY[0x270EFF4C8]();
}

uint64_t sub_22C9A1FC8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_22C9A1FD8()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_22C9A1FE8()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_22C9A1FF8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_22C9A2008()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_22C9A2018()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_22C9A2028()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_22C9A2038()
{
  return MEMORY[0x270EFF7E0]();
}

uint64_t sub_22C9A2048()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_22C9A2058()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_22C9A2068()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_22C9A2078()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_22C9A2098()
{
  return MEMORY[0x270EFFA48]();
}

uint64_t sub_22C9A20A8()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_22C9A20B8()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_22C9A20C8()
{
  return MEMORY[0x270EFFAF0]();
}

uint64_t sub_22C9A20D8()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_22C9A20E8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_22C9A20F8()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_22C9A2108()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_22C9A2118()
{
  return MEMORY[0x270EFFBB8]();
}

uint64_t sub_22C9A2128()
{
  return MEMORY[0x270EFFBC0]();
}

uint64_t sub_22C9A2138()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_22C9A2148()
{
  return MEMORY[0x270EFFDD0]();
}

uint64_t sub_22C9A2158()
{
  return MEMORY[0x270EFFDD8]();
}

uint64_t sub_22C9A2168()
{
  return MEMORY[0x270F00148]();
}

uint64_t sub_22C9A2178()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_22C9A2188()
{
  return MEMORY[0x270F001C0]();
}

uint64_t sub_22C9A2198()
{
  return MEMORY[0x270F001F0]();
}

uint64_t sub_22C9A21C8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_22C9A21D8()
{
  return MEMORY[0x270F00388]();
}

uint64_t sub_22C9A21E8()
{
  return MEMORY[0x270F003C0]();
}

uint64_t sub_22C9A21F8()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_22C9A2208()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_22C9A2218()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_22C9A2228()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_22C9A2238()
{
  return MEMORY[0x270F00628]();
}

uint64_t sub_22C9A2248()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_22C9A2268()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_22C9A2278()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_22C9A2288()
{
  return MEMORY[0x270F876F8]();
}

uint64_t sub_22C9A2298()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_22C9A22A8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_22C9A22B8()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_22C9A22C8()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_22C9A22D8()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_22C9A22E8()
{
  return MEMORY[0x270F009D8]();
}

uint64_t sub_22C9A22F8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_22C9A2308()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_22C9A2318()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_22C9A2328()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_22C9A2338()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_22C9A2348()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_22C9A2358()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_22C9A2368()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_22C9A2378()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_22C9A2388()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_22C9A2398()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_22C9A23A8()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_22C9A23B8()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_22C9A23C8()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_22C9A23D8()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_22C9A23E8()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_22C9A23F8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_22C9A2408()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_22C9A2418()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_22C9A2428()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_22C9A2438()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_22C9A2448()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_22C9A2458()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_22C9A2468()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_22C9A2478()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_22C9A2488()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_22C9A2498()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_22C9A24A8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_22C9A24B8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_22C9A24C8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_22C9A24D8()
{
  return MEMORY[0x270F014E8]();
}

uint64_t sub_22C9A24E8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_22C9A24F8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_22C9A2508()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_22C9A2518()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_22C9A2528()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_22C9A2538()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_22C9A2548()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_22C9A2558()
{
  return MEMORY[0x270F01980]();
}

uint64_t sub_22C9A2568()
{
  return MEMORY[0x270F01988]();
}

uint64_t sub_22C9A2578()
{
  return MEMORY[0x270F01998]();
}

uint64_t sub_22C9A2588()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_22C9A2598()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_22C9A25A8()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_22C9A25B8()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_22C9A25C8()
{
  return MEMORY[0x270F01A68]();
}

uint64_t sub_22C9A25D8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_22C9A25E8()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_22C9A25F8()
{
  return MEMORY[0x270F01C20]();
}

uint64_t sub_22C9A2608()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_22C9A2618()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_22C9A2628()
{
  return MEMORY[0x270F021E0]();
}

uint64_t sub_22C9A2638()
{
  return MEMORY[0x270F021E8]();
}

uint64_t sub_22C9A2648()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_22C9A2658()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_22C9A2668()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_22C9A2678()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_22C9A2688()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_22C9A2698()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_22C9A26A8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_22C9A26C8()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_22C9A26D8()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_22C9A26E8()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_22C9A2708()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_22C9A2718()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_22C9A2728()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_22C9A2738()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_22C9A2748()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_22C9A2758()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_22C9A2768()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_22C9A2778()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_22C9A2788()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_22C9A2798()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_22C9A27A8()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_22C9A27B8()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_22C9A27C8()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_22C9A27D8()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_22C9A27E8()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_22C9A27F8()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_22C9A2808()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_22C9A2818()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_22C9A2828()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_22C9A2838()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_22C9A2848()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_22C9A2858()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_22C9A2868()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_22C9A2878()
{
  return MEMORY[0x270F87728]();
}

uint64_t sub_22C9A2888()
{
  return MEMORY[0x270F87738]();
}

uint64_t sub_22C9A2898()
{
  return MEMORY[0x270F47218]();
}

uint64_t sub_22C9A28A8()
{
  return MEMORY[0x270F47220]();
}

uint64_t sub_22C9A28C8()
{
  return MEMORY[0x270F47230]();
}

uint64_t sub_22C9A28D8()
{
  return MEMORY[0x270F03290]();
}

uint64_t sub_22C9A28E8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22C9A28F8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22C9A2908()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_22C9A2918()
{
  return MEMORY[0x270F033D8]();
}

uint64_t sub_22C9A2928()
{
  return MEMORY[0x270F03480]();
}

uint64_t sub_22C9A2938()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_22C9A2948()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_22C9A2958()
{
  return MEMORY[0x270F03500]();
}

uint64_t sub_22C9A2968()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_22C9A2978()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_22C9A2988()
{
  return MEMORY[0x270F03608]();
}

uint64_t sub_22C9A2998()
{
  return MEMORY[0x270F03648]();
}

uint64_t sub_22C9A29A8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22C9A29B8()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_22C9A29C8()
{
  return MEMORY[0x270F03888]();
}

uint64_t sub_22C9A29D8()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_22C9A29E8()
{
  return MEMORY[0x270F03998]();
}

uint64_t sub_22C9A29F8()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_22C9A2A08()
{
  return MEMORY[0x270F03A28]();
}

uint64_t sub_22C9A2A18()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_22C9A2A28()
{
  return MEMORY[0x270F03BA0]();
}

uint64_t sub_22C9A2A38()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_22C9A2A48()
{
  return MEMORY[0x270F03C10]();
}

uint64_t sub_22C9A2A58()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_22C9A2A68()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_22C9A2A78()
{
  return MEMORY[0x270F03D18]();
}

uint64_t sub_22C9A2A88()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_22C9A2A98()
{
  return MEMORY[0x270F03E58]();
}

uint64_t sub_22C9A2AA8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_22C9A2AB8()
{
  return MEMORY[0x270F03F80]();
}

uint64_t sub_22C9A2AC8()
{
  return MEMORY[0x270F03FA0]();
}

uint64_t sub_22C9A2AD8()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_22C9A2AE8()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_22C9A2AF8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_22C9A2B08()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_22C9A2B18()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_22C9A2B28()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_22C9A2B38()
{
  return MEMORY[0x270F04240]();
}

uint64_t sub_22C9A2B48()
{
  return MEMORY[0x270F04248]();
}

uint64_t sub_22C9A2B58()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_22C9A2B68()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_22C9A2B78()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_22C9A2B88()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_22C9A2B98()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_22C9A2BA8()
{
  return MEMORY[0x270F04408]();
}

uint64_t sub_22C9A2BB8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_22C9A2BC8()
{
  return MEMORY[0x270F04440]();
}

uint64_t sub_22C9A2BD8()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_22C9A2BE8()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_22C9A2BF8()
{
  return MEMORY[0x270F04468]();
}

uint64_t sub_22C9A2C08()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_22C9A2C18()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_22C9A2C28()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_22C9A2C38()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_22C9A2C48()
{
  return MEMORY[0x270F044C8]();
}

uint64_t sub_22C9A2C58()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_22C9A2C68()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_22C9A2C78()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_22C9A2C88()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_22C9A2C98()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_22C9A2CA8()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_22C9A2CB8()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_22C9A2CC8()
{
  return MEMORY[0x270F47238]();
}

uint64_t sub_22C9A2CD8()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_22C9A2CE8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_22C9A2CF8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_22C9A2D08()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_22C9A2D18()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_22C9A2D28()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_22C9A2D38()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_22C9A2D48()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_22C9A2D58()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_22C9A2D68()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_22C9A2D78()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_22C9A2D88()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_22C9A2D98()
{
  return MEMORY[0x270F048C8]();
}

uint64_t sub_22C9A2DA8()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_22C9A2DB8()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_22C9A2DC8()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_22C9A2DD8()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_22C9A2DE8()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_22C9A2DF8()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_22C9A2E08()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_22C9A2E18()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_22C9A2E28()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_22C9A2E38()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_22C9A2E48()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_22C9A2E58()
{
  return MEMORY[0x270F04AD0]();
}

uint64_t sub_22C9A2E68()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_22C9A2E78()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_22C9A2E88()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_22C9A2E98()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_22C9A2EA8()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_22C9A2EB8()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_22C9A2EC8()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_22C9A2ED8()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_22C9A2EE8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_22C9A2EF8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_22C9A2F08()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_22C9A2F18()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_22C9A2F38()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_22C9A2F48()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_22C9A2F58()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_22C9A2F68()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_22C9A2F78()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_22C9A2F88()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_22C9A2F98()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_22C9A2FA8()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_22C9A2FB8()
{
  return MEMORY[0x270F051A8]();
}

uint64_t sub_22C9A2FC8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_22C9A2FD8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_22C9A2FE8()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_22C9A2FF8()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_22C9A3008()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22C9A3018()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22C9A3028()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22C9A3038()
{
  return MEMORY[0x270F5D0E8]();
}

uint64_t sub_22C9A3048()
{
  return MEMORY[0x270F44FE8]();
}

uint64_t sub_22C9A3058()
{
  return MEMORY[0x270F45000]();
}

uint64_t sub_22C9A3068()
{
  return MEMORY[0x270F45008]();
}

uint64_t sub_22C9A3078()
{
  return MEMORY[0x270F45020]();
}

uint64_t sub_22C9A3088()
{
  return MEMORY[0x270F45090]();
}

uint64_t sub_22C9A3098()
{
  return MEMORY[0x270F450B0]();
}

uint64_t sub_22C9A30A8()
{
  return MEMORY[0x270F45220]();
}

uint64_t sub_22C9A30B8()
{
  return MEMORY[0x270F45228]();
}

uint64_t sub_22C9A30C8()
{
  return MEMORY[0x270F45250]();
}

uint64_t sub_22C9A30D8()
{
  return MEMORY[0x270F45258]();
}

uint64_t sub_22C9A30E8()
{
  return MEMORY[0x270F45260]();
}

uint64_t sub_22C9A30F8()
{
  return MEMORY[0x270F452B8]();
}

uint64_t sub_22C9A3108()
{
  return MEMORY[0x270F452C8]();
}

uint64_t sub_22C9A3118()
{
  return MEMORY[0x270F452D0]();
}

uint64_t sub_22C9A3128()
{
  return MEMORY[0x270F452E0]();
}

uint64_t sub_22C9A3138()
{
  return MEMORY[0x270F452E8]();
}

uint64_t sub_22C9A3148()
{
  return MEMORY[0x270F45388]();
}

uint64_t sub_22C9A3158()
{
  return MEMORY[0x270F45390]();
}

uint64_t sub_22C9A3168()
{
  return MEMORY[0x270F45398]();
}

uint64_t sub_22C9A3178()
{
  return MEMORY[0x270F453A8]();
}

uint64_t sub_22C9A3188()
{
  return MEMORY[0x270F453B0]();
}

uint64_t sub_22C9A3198()
{
  return MEMORY[0x270F453B8]();
}

uint64_t sub_22C9A31A8()
{
  return MEMORY[0x270F453E0]();
}

uint64_t sub_22C9A31B8()
{
  return MEMORY[0x270F453E8]();
}

uint64_t sub_22C9A31C8()
{
  return MEMORY[0x270F453F0]();
}

uint64_t sub_22C9A31D8()
{
  return MEMORY[0x270F453F8]();
}

uint64_t sub_22C9A31E8()
{
  return MEMORY[0x270F45408]();
}

uint64_t sub_22C9A31F8()
{
  return MEMORY[0x270F454F0]();
}

uint64_t sub_22C9A3208()
{
  return MEMORY[0x270F45510]();
}

uint64_t sub_22C9A3218()
{
  return MEMORY[0x270F45520]();
}

uint64_t sub_22C9A3228()
{
  return MEMORY[0x270F45628]();
}

uint64_t sub_22C9A3238()
{
  return MEMORY[0x270F45768]();
}

uint64_t sub_22C9A3248()
{
  return MEMORY[0x270F457B0]();
}

uint64_t sub_22C9A3258()
{
  return MEMORY[0x270F457F0]();
}

uint64_t sub_22C9A3268()
{
  return MEMORY[0x270F45800]();
}

uint64_t sub_22C9A3278()
{
  return MEMORY[0x270F45808]();
}

uint64_t sub_22C9A3288()
{
  return MEMORY[0x270F45810]();
}

uint64_t sub_22C9A3298()
{
  return MEMORY[0x270F45820]();
}

uint64_t sub_22C9A32A8()
{
  return MEMORY[0x270F87790]();
}

uint64_t sub_22C9A32B8()
{
  return MEMORY[0x270F45898]();
}

uint64_t sub_22C9A32C8()
{
  return MEMORY[0x270F458C8]();
}

uint64_t sub_22C9A32D8()
{
  return MEMORY[0x270F458D0]();
}

uint64_t sub_22C9A32E8()
{
  return MEMORY[0x270F458F0]();
}

uint64_t sub_22C9A3308()
{
  return MEMORY[0x270F45968]();
}

uint64_t sub_22C9A3318()
{
  return MEMORY[0x270F45990]();
}

uint64_t sub_22C9A3328()
{
  return MEMORY[0x270F45998]();
}

uint64_t sub_22C9A3338()
{
  return MEMORY[0x270F45A10]();
}

uint64_t sub_22C9A3348()
{
  return MEMORY[0x270F45A30]();
}

uint64_t sub_22C9A3358()
{
  return MEMORY[0x270F45A40]();
}

uint64_t sub_22C9A3368()
{
  return MEMORY[0x270F45A60]();
}

uint64_t sub_22C9A3378()
{
  return MEMORY[0x270F45A78]();
}

uint64_t sub_22C9A3388()
{
  return MEMORY[0x270F45A80]();
}

uint64_t sub_22C9A3398()
{
  return MEMORY[0x270F45AF0]();
}

uint64_t sub_22C9A33A8()
{
  return MEMORY[0x270F45B00]();
}

uint64_t sub_22C9A33B8()
{
  return MEMORY[0x270F45C98]();
}

uint64_t sub_22C9A33C8()
{
  return MEMORY[0x270F45CA0]();
}

uint64_t sub_22C9A33D8()
{
  return MEMORY[0x270F45D88]();
}

uint64_t sub_22C9A33E8()
{
  return MEMORY[0x270F45DA8]();
}

uint64_t sub_22C9A33F8()
{
  return MEMORY[0x270F45E38]();
}

uint64_t sub_22C9A3408()
{
  return MEMORY[0x270F45EC8]();
}

uint64_t sub_22C9A3418()
{
  return MEMORY[0x270F45ED0]();
}

uint64_t sub_22C9A3428()
{
  return MEMORY[0x270F45ED8]();
}

uint64_t sub_22C9A3438()
{
  return MEMORY[0x270F45F40]();
}

uint64_t sub_22C9A3448()
{
  return MEMORY[0x270F45F48]();
}

uint64_t sub_22C9A3458()
{
  return MEMORY[0x270F45F70]();
}

uint64_t sub_22C9A3468()
{
  return MEMORY[0x270F45F78]();
}

uint64_t sub_22C9A3478()
{
  return MEMORY[0x270F45F88]();
}

uint64_t sub_22C9A3488()
{
  return MEMORY[0x270F45F90]();
}

uint64_t sub_22C9A3498()
{
  return MEMORY[0x270F46008]();
}

uint64_t sub_22C9A34A8()
{
  return MEMORY[0x270F46010]();
}

uint64_t sub_22C9A34B8()
{
  return MEMORY[0x270F46060]();
}

uint64_t sub_22C9A34C8()
{
  return MEMORY[0x270F46068]();
}

uint64_t sub_22C9A34D8()
{
  return MEMORY[0x270F46190]();
}

uint64_t sub_22C9A34E8()
{
  return MEMORY[0x270F46198]();
}

uint64_t sub_22C9A34F8()
{
  return MEMORY[0x270F461A0]();
}

uint64_t sub_22C9A3508()
{
  return MEMORY[0x270F461B8]();
}

uint64_t sub_22C9A3518()
{
  return MEMORY[0x270F461C0]();
}

uint64_t sub_22C9A3528()
{
  return MEMORY[0x270F461E0]();
}

uint64_t sub_22C9A3538()
{
  return MEMORY[0x270F461E8]();
}

uint64_t sub_22C9A3548()
{
  return MEMORY[0x270F461F0]();
}

uint64_t sub_22C9A3558()
{
  return MEMORY[0x270F461F8]();
}

uint64_t sub_22C9A3568()
{
  return MEMORY[0x270F46248]();
}

uint64_t sub_22C9A3578()
{
  return MEMORY[0x270F46278]();
}

uint64_t sub_22C9A3588()
{
  return MEMORY[0x270F46290]();
}

uint64_t sub_22C9A3598()
{
  return MEMORY[0x270F46298]();
}

uint64_t sub_22C9A35A8()
{
  return MEMORY[0x270F46480]();
}

uint64_t sub_22C9A35B8()
{
  return MEMORY[0x270F46530]();
}

uint64_t sub_22C9A35D8()
{
  return MEMORY[0x270F46568]();
}

uint64_t sub_22C9A35E8()
{
  return MEMORY[0x270F46578]();
}

uint64_t sub_22C9A35F8()
{
  return MEMORY[0x270F46588]();
}

uint64_t sub_22C9A3608()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22C9A3618()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22C9A3628()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_22C9A3638()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22C9A3648()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22C9A3658()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_22C9A3668()
{
  return MEMORY[0x270FA2B80]();
}

uint64_t sub_22C9A3678()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22C9A3688()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22C9A3698()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_22C9A36A8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22C9A36B8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22C9A36C8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22C9A36D8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_22C9A36E8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22C9A36F8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22C9A3708()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22C9A3718()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22C9A3728()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22C9A3738()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_22C9A3748()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_22C9A3758()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22C9A3768()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22C9A3778()
{
  return MEMORY[0x270F47240]();
}

uint64_t sub_22C9A3788()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22C9A3798()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22C9A37A8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22C9A37B8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22C9A37D8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22C9A37E8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22C9A37F8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22C9A3808()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22C9A3818()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22C9A3828()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_22C9A3838()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_22C9A3848()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22C9A3858()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22C9A3868()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22C9A3878()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22C9A3888()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_22C9A3898()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22C9A38A8()
{
  return MEMORY[0x270F47248]();
}

uint64_t sub_22C9A38B8()
{
  return MEMORY[0x270F47250]();
}

uint64_t sub_22C9A38C8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22C9A38D8()
{
  return MEMORY[0x270F47258]();
}

uint64_t sub_22C9A38E8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22C9A38F8()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_22C9A3928()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22C9A3938()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22C9A3948()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_22C9A3958()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22C9A3968()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22C9A3988()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_22C9A3998()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_22C9A39A8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_22C9A39B8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_22C9A39C8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22C9A39D8()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_22C9A39E8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22C9A39F8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22C9A3A08()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22C9A3A18()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_22C9A3A28()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_22C9A3A38()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22C9A3A48()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22C9A3A58()
{
  return MEMORY[0x270FA2BD0]();
}

uint64_t sub_22C9A3A68()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22C9A3A78()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22C9A3A88()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22C9A3A98()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22C9A3AA8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22C9A3AB8()
{
  return MEMORY[0x270F28558]();
}

uint64_t sub_22C9A3AC8()
{
  return MEMORY[0x270F28560]();
}

uint64_t sub_22C9A3AD8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22C9A3AE8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22C9A3AF8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_22C9A3B08()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_22C9A3B18()
{
  return MEMORY[0x270EEB9E0]();
}

uint64_t sub_22C9A3B28()
{
  return MEMORY[0x270EEB9F8]();
}

uint64_t sub_22C9A3B38()
{
  return MEMORY[0x270EEBA08]();
}

uint64_t sub_22C9A3B48()
{
  return MEMORY[0x270EF2028]();
}

uint64_t sub_22C9A3B58()
{
  return MEMORY[0x270F46788]();
}

uint64_t sub_22C9A3B68()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22C9A3B78()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_22C9A3B88()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_22C9A3B98()
{
  return MEMORY[0x270F829F8]();
}

uint64_t sub_22C9A3BA8()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_22C9A3BB8()
{
  return MEMORY[0x270F82AB0]();
}

uint64_t sub_22C9A3BC8()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_22C9A3BD8()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_22C9A3BE8()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_22C9A3BF8()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_22C9A3C08()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_22C9A3C18()
{
  return MEMORY[0x270EF2328]();
}

uint64_t sub_22C9A3C28()
{
  return MEMORY[0x270EF2340]();
}

uint64_t sub_22C9A3C38()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_22C9A3C48()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_22C9A3C58()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_22C9A3C68()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22C9A3C78()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22C9A3C88()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22C9A3C98()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_22C9A3CA8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_22C9A3CB8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22C9A3CC8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22C9A3CD8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22C9A3CE8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22C9A3CF8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_22C9A3D08()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_22C9A3D18()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22C9A3D28()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_22C9A3D38()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_22C9A3D48()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_22C9A3D58()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_22C9A3D68()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_22C9A3D78()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_22C9A3D88()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22C9A3D98()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_22C9A3DA8()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_22C9A3DB8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22C9A3DC8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22C9A3DD8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22C9A3DE8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22C9A3DF8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_22C9A3E08()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22C9A3E18()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22C9A3E28()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22C9A3E38()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22C9A3E48()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22C9A3E58()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_22C9A3E68()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_22C9A3E78()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22C9A3E98()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22C9A3EA8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22C9A3EB8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22C9A3EC8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22C9A3ED8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22C9A3EE8()
{
  return MEMORY[0x270FA2188]();
}

uint64_t sub_22C9A3EF8()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_22C9A3F08()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_22C9A3F18()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_22C9A3F28()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_22C9A3F38()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22C9A3F48()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22C9A3F58()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22C9A3F68()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_22C9A3F78()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22C9A3F88()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22C9A3F98()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22C9A3FA8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22C9A3FB8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22C9A3FC8()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_22C9A3FE8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22C9A3FF8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_22C9A4008()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_22C9A4018()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_22C9A4028()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_22C9A4038()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_22C9A4048()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_22C9A4058()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22C9A4068()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_22C9A4078()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_22C9A4088()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22C9A4098()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22C9A40A8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_22C9A40B8()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_22C9A40C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22C9A40D8()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_22C9A40E8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_22C9A40F8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_22C9A4108()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_22C9A4118()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22C9A4128()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22C9A4138()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22C9A4148()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22C9A4158()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22C9A4168()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22C9A4178()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22C9A4188()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22C9A4198()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22C9A41A8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_22C9A41B8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22C9A41C8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22C9A41D8()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_22C9A4208()
{
  return MEMORY[0x270FA0128]();
}

uint64_t ALGetLibrarySizes()
{
  return MEMORY[0x270F53798]();
}

uint64_t AMSGenerateLogCorrelationKey()
{
  return MEMORY[0x270F0E6B0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B90]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPFSSizeStrings()
{
  return MEMORY[0x270F0CD38]();
}

uint64_t CPIsInternalDevice()
{
  return MEMORY[0x270F0CD58]();
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x270F0CDE8]();
}

uint64_t CreateDetailControllerInstanceWithClass()
{
  return MEMORY[0x270F55198]();
}

uint64_t DeviceName()
{
  return MEMORY[0x270F551A0]();
}

uint64_t ICQCreateError()
{
  return MEMORY[0x270F87D00]();
}

uint64_t ICQCreateErrorWithMessage()
{
  return MEMORY[0x270F87D08]();
}

uint64_t ISError()
{
  return MEMORY[0x270F88AF0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t PLCPLSetKeepOriginalsEnabled()
{
  return MEMORY[0x270F53708]();
}

uint64_t PLCanEnableCloudPhotoLibrary()
{
  return MEMORY[0x270F53710]();
}

uint64_t PLCloudPhotoLibraryKeepOriginalsIsEnabled()
{
  return MEMORY[0x270F53728]();
}

uint64_t PLIsCPLDataclassEnabled()
{
  return MEMORY[0x270F53758]();
}

uint64_t PSIsInEDUMode()
{
  return MEMORY[0x270F55220]();
}

uint64_t PSIsInternalInstall()
{
  return MEMORY[0x270F55228]();
}

uint64_t PSIsN56()
{
  return MEMORY[0x270F55238]();
}

uint64_t PSIsiPad()
{
  return MEMORY[0x270F55268]();
}

uint64_t PSTableViewSideInset()
{
  return MEMORY[0x270F55320]();
}

uint64_t PSTextViewInsets()
{
  return MEMORY[0x270F55328]();
}

uint64_t PSToolbarLabelsTextColor()
{
  return MEMORY[0x270F55338]();
}

uint64_t PSUsedByManagedAccount()
{
  return MEMORY[0x270F55348]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x270F55350]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x270F55368]();
}

uint64_t PreferencesTableViewHeaderColor()
{
  return MEMORY[0x270F55370]();
}

uint64_t PreferencesTableViewHeaderFont()
{
  return MEMORY[0x270F55378]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t SSError()
{
  return MEMORY[0x270F78EA0]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F82F28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionGetCellularDataSettings()
{
  return MEMORY[0x270EE8810]();
}

uint64_t _ICQActionForServerActionString()
{
  return MEMORY[0x270F87D10]();
}

uint64_t _ICQActionForString()
{
  return MEMORY[0x270F87D18]();
}

uint64_t _ICQBannerLogSystem()
{
  return MEMORY[0x270F87D20]();
}

uint64_t _ICQGetLogSystem()
{
  return MEMORY[0x270F87D28]();
}

uint64_t _ICQSignpostCreateWithObject()
{
  return MEMORY[0x270F87D30]();
}

uint64_t _ICQSignpostGetNanoseconds()
{
  return MEMORY[0x270F87D38]();
}

uint64_t _ICQSignpostLogSystem()
{
  return MEMORY[0x270F87D40]();
}

uint64_t _ICQStringForAction()
{
  return MEMORY[0x270F87D48]();
}

uint64_t _ICQStringForOfferType()
{
  return MEMORY[0x270F87D50]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

void rewind(FILE *a1)
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}