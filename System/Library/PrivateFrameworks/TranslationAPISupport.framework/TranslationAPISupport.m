void sub_2600D2D6C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (*v9)(uint64_t);
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void (*v23)(void);
  id v24[2];

  v2 = v1;
  v24[1] = *(id *)MEMORY[0x263EF8340];
  v24[0] = 0;
  v3 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, v24);
  v4 = v24[0];
  if (v3)
  {
    v5 = v3;
    v6 = v2 + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_parent;
    v7 = *(void **)(v6 + *(int *)(type metadata accessor for AppExtensionHostView(0) + 20));
    v8 = v4;
    if (objc_msgSend(v7, sel_shouldAcceptWithConnection_, v5))
    {
      v9 = *(void (**)(uint64_t))(v2
                                          + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange);
      if (v9)
      {
        swift_retain();
        v9(1);
        sub_2600D5174((uint64_t)v9);
      }
    }
    else
    {
      if (qword_26A8663D0 != -1) {
        swift_once();
      }
      v19 = sub_2600D9B40();
      __swift_project_value_buffer(v19, (uint64_t)qword_26A866630);
      v20 = sub_2600D9B20();
      v21 = sub_2600D9D00();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_2600D1000, v20, v21, "Host Connection failed", v22, 2u);
        MEMORY[0x26120B500](v22, -1, -1);
      }
    }
  }
  else
  {
    v10 = v24[0];
    v11 = (void *)sub_2600D9A40();

    swift_willThrow();
    if (qword_26A8663D0 != -1) {
      swift_once();
    }
    v12 = sub_2600D9B40();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A866630);
    v13 = v11;
    v14 = sub_2600D9B20();
    v15 = sub_2600D9D00();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (void *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412290;
      v18 = (void *)sub_2600D9A30();
      v24[0] = v18;
      sub_2600D9D60();
      *v17 = v18;

      _os_log_impl(&dword_2600D1000, v14, v15, "Host Connection failed: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8664C8);
      swift_arrayDestroy();
      MEMORY[0x26120B500](v17, -1, -1);
      MEMORY[0x26120B500](v16, -1, -1);
    }
    else
    {
    }
    v23 = *(void (**)(void))(v2
                                        + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange);
    if (v23)
    {
      swift_retain();
      v23(0);

      sub_2600D5174((uint64_t)v23);
    }
    else
    {
    }
  }
}

id sub_2600D3244()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppExtensionHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2600D32FC()
{
  return type metadata accessor for AppExtensionHostView.HostCoordinator(0);
}

uint64_t type metadata accessor for AppExtensionHostView.HostCoordinator(uint64_t a1)
{
  return sub_2600D36D8(a1, (uint64_t *)&unk_26A866440);
}

void sub_2600D3324()
{
  type metadata accessor for AppExtensionHostView(319);
  if (v0 <= 0x3F)
  {
    sub_2600D3424();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for AppExtensionHostView(uint64_t a1)
{
  return sub_2600D36D8(a1, (uint64_t *)&unk_26A866470);
}

void sub_2600D3424()
{
  if (!qword_26A866450)
  {
    sub_2600D9A90();
    unint64_t v0 = sub_2600D9D50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A866450);
    }
  }
}

uint64_t *sub_2600D347C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    swift_retain();
    swift_retain();
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A866458) + 32);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for AppExtensionHostView.Configuration(0);
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v14 = sub_2600D9A90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v9, v10, v14);
      uint64_t v15 = *(int *)(v11 + 20);
      v16 = &v9[v15];
      v17 = &v10[v15];
      uint64_t v18 = *((void *)v17 + 1);
      *(void *)v16 = *(void *)v17;
      *((void *)v16 + 1) = v18;
      v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
      swift_bridgeObjectRetain();
      v19(v9, 0, 1, v11);
    }
    uint64_t v20 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = *v22;
    swift_unknownObjectRetain();
    if (v23)
    {
      uint64_t v24 = v22[1];
      void *v21 = v23;
      v21[1] = v24;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v21 = *(_OWORD *)v22;
    }
  }
  return a1;
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

uint64_t type metadata accessor for AppExtensionHostView.Configuration(uint64_t a1)
{
  return sub_2600D36D8(a1, qword_26A866490);
}

uint64_t sub_2600D36D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2600D3710(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A866458) + 32);
  uint64_t v5 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    uint64_t v6 = sub_2600D9A90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    swift_bridgeObjectRelease();
  }
  uint64_t result = swift_unknownObjectRelease();
  if (*(void *)(a1 + *(int *)(a2 + 24)))
  {
    return swift_release();
  }
  return result;
}

void *sub_2600D382C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_retain();
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A866458) + 32);
  uint64_t v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_2600D9A90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v8, v9, v13);
    uint64_t v14 = *(int *)(v10 + 20);
    uint64_t v15 = &v8[v14];
    v16 = &v9[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
    swift_bridgeObjectRetain();
    v18(v8, 0, 1, v10);
  }
  uint64_t v19 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v20 = (void *)((char *)a1 + v19);
  v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = *v21;
  swift_unknownObjectRetain();
  if (v22)
  {
    uint64_t v23 = v21[1];
    *uint64_t v20 = v22;
    v20[1] = v23;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  }
  return a1;
}

void *sub_2600D39D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A866458) + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      uint64_t v14 = sub_2600D9A90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v7, v8, v14);
      uint64_t v15 = *(int *)(v9 + 20);
      v16 = &v7[v15];
      uint64_t v17 = &v8[v15];
      *(void *)v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56);
      swift_bridgeObjectRetain();
      v18(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    sub_2600D5184((uint64_t)v7, type metadata accessor for AppExtensionHostView.Configuration);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
    memcpy(v7, v8, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v28 = sub_2600D9A90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 24))(v7, v8, v28);
  uint64_t v29 = *(int *)(v9 + 20);
  v30 = &v7[v29];
  v31 = &v8[v29];
  *(void *)v30 = *(void *)v31;
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v20 = *(int *)(a3 + 24);
  v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = *(void *)((char *)a1 + v20);
  uint64_t v24 = *v22;
  if (!v23)
  {
    if (v24)
    {
      uint64_t v26 = v22[1];
      void *v21 = v24;
      v21[1] = v26;
      swift_retain();
      return a1;
    }
LABEL_13:
    *(_OWORD *)v21 = *(_OWORD *)v22;
    return a1;
  }
  if (!v24)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v25 = v22[1];
  void *v21 = v24;
  v21[1] = v25;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_2600D3C94(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A866458) + 32);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_2600D9A90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
    *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v15 = (void *)((char *)a1 + v14);
  v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = *v16;
  if (*v16)
  {
    uint64_t v18 = v16[1];
    *uint64_t v15 = v17;
    v15[1] = v18;
  }
  else
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  }
  return a1;
}

void *sub_2600D3E1C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A866458) + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      uint64_t v14 = sub_2600D9A90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v7, v8, v14);
      *(_OWORD *)&v7[*(int *)(v9 + 20)] = *(_OWORD *)&v8[*(int *)(v9 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    sub_2600D5184((uint64_t)v7, type metadata accessor for AppExtensionHostView.Configuration);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
    memcpy(v7, v8, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v24 = sub_2600D9A90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v7, v8, v24);
  uint64_t v25 = *(int *)(v9 + 20);
  uint64_t v26 = &v7[v25];
  v27 = &v8[v25];
  uint64_t v29 = *(void *)v27;
  uint64_t v28 = *((void *)v27 + 1);
  *(void *)uint64_t v26 = v29;
  *((void *)v26 + 1) = v28;
  swift_bridgeObjectRelease();
LABEL_7:
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_unknownObjectRelease();
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v19 = *(void *)((char *)a1 + v16);
  uint64_t v20 = *v18;
  if (!v19)
  {
    if (v20)
    {
      uint64_t v22 = v18[1];
      void *v17 = v20;
      v17[1] = v22;
      return a1;
    }
LABEL_13:
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    return a1;
  }
  if (!v20)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v21 = v18[1];
  void *v17 = v20;
  v17[1] = v21;
  swift_release();
  return a1;
}

uint64_t sub_2600D4094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2600D40A8);
}

uint64_t sub_2600D40A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A866458);
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

uint64_t sub_2600D416C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2600D4180);
}

uint64_t sub_2600D4180(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A866458);
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

void sub_2600D4240()
{
  sub_2600D42E0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2600D42E0()
{
  if (!qword_26A866480)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A866460);
    unint64_t v0 = sub_2600D9C60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A866480);
    }
  }
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

uint64_t *sub_2600D4384(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_2600D9A90();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    void *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2600D445C(uint64_t a1)
{
  uint64_t v2 = sub_2600D9A90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2600D44D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D9A90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2600D455C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D9A90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2600D45F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D9A90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2600D4674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D9A90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2600D4700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2600D4714);
}

uint64_t sub_2600D4714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D9A90();
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
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2600D47D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2600D47EC);
}

uint64_t sub_2600D47EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2600D9A90();
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

uint64_t sub_2600D48AC()
{
  uint64_t result = sub_2600D9A90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2600D4940()
{
  return sub_2600D50BC(&qword_26A8664A8);
}

id sub_2600D4974()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AppExtensionHostView(0) - 8;
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2600D5100(v1, (uint64_t)v4);
  int v5 = (objc_class *)type metadata accessor for AppExtensionHostView.HostCoordinator(0);
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_connection] = 0;
  uint64_t v7 = (uint64_t *)&v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange];
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = &v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_identity];
  uint64_t v9 = sub_2600D9A90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_2600D5100((uint64_t)v4, (uint64_t)&v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_parent]);
  unint64_t v10 = (uint64_t *)&v4[*(int *)(v2 + 32)];
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = *v7;
  *uint64_t v7 = *v10;
  v7[1] = v12;
  sub_2600D5164(v11);
  sub_2600D5174(v13);
  v16.receiver = v6;
  v16.super_class = v5;
  id v14 = objc_msgSendSuper2(&v16, sel_init);
  sub_2600D5184((uint64_t)v4, type metadata accessor for AppExtensionHostView);
  return v14;
}

uint64_t sub_2600D4AEC(void *a1)
{
  uint64_t v21 = sub_2600D9A90();
  uint64_t v2 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8664B8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  self;
  uint64_t v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8664C0);
    sub_2600D9BD0();
    objc_super v16 = v22;
    objc_msgSend(v14, sel_setDelegate_, v22);

    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A866458);
    MEMORY[0x26120AFD0](v17);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {

      return sub_2600D5280((uint64_t)v8, (uint64_t *)&unk_26A866460);
    }
    else
    {
      sub_2600D51E4((uint64_t)v8, (uint64_t)v12);
      (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v12, v21);
      swift_bridgeObjectRetain();
      sub_2600D9D20();
      uint64_t v19 = sub_2600D9D30();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 0, 1, v19);
      sub_2600D9D40();

      return sub_2600D5184((uint64_t)v12, type metadata accessor for AppExtensionHostView.Configuration);
    }
  }
  else
  {
    uint64_t result = sub_2600D9D80();
    __break(1u);
  }
  return result;
}

id sub_2600D4E68()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E60]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8664C0);
  sub_2600D9BD0();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

id sub_2600D4EEC@<X0>(void *a1@<X8>)
{
  id result = sub_2600D4974();
  *a1 = result;
  return result;
}

uint64_t sub_2600D4F14()
{
  return sub_2600D9B70();
}

uint64_t sub_2600D4F50()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_2600D4F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D50BC(&qword_26A8664B0);

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2600D4FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D50BC(&qword_26A8664B0);

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_2600D505C()
{
  return sub_2600D9C00();
}

void sub_2600D5078()
{
}

uint64_t sub_2600D50BC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AppExtensionHostView(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2600D5100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppExtensionHostView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2600D5164(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2600D5174(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2600D5184(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2600D51E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2600D5280(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_2600D52DC()
{
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration);

  return v1;
}

id sub_2600D5394@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v4 = *(void **)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration);
  *a2 = v4;

  return v4;
}

void sub_2600D5454(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  id v2 = v1;
  sub_2600D9A50();
  swift_release();
}

uint64_t sub_2600D5530()
{
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  sub_2600D5164(v1);
  return v1;
}

uint64_t sub_2600D55F0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion + 8);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_2600D8890;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2600D5164(v4);
}

uint64_t sub_2600D56E8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = sub_2600D8854;
  }
  else
  {
    uint64_t v4 = 0;
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_2600D5164(v2);
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A50();
  sub_2600D5174((uint64_t)v4);
  return swift_release();
}

uint64_t sub_2600D5844@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration;
  swift_beginAccess();
  return sub_2600D8754(v3, a1);
}

uint64_t sub_2600D5910(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2600D8754(a2, (uint64_t)v5);
  uint64_t v6 = a1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration;
  swift_beginAccess();
  sub_2600D88C0((uint64_t)v5, v6);
  return swift_endAccess();
}

void sub_2600D59D4(char a1)
{
  int v2 = a1 & 1;
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v3 = OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote;
  if (*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote) != v2)
  {
    swift_getKeyPath();
    sub_2600D9A60();
    swift_release();
    if (*(unsigned char *)(v1 + v3) == 1)
    {
      swift_getKeyPath();
      sub_2600D9A60();
      swift_release();
      id v4 = objc_retain(*(id *)(v1
                             + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration));
      sub_2600D6608((uint64_t)v4);
    }
  }
}

uint64_t sub_2600D5B18()
{
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
}

uint64_t sub_2600D5BC0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
  return result;
}

uint64_t sub_2600D5C70()
{
  return swift_release();
}

void sub_2600D5D40(uint64_t a1, char a2)
{
  char v3 = *(unsigned char *)(a1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
  *(unsigned char *)(a1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote) = a2;
  sub_2600D59D4(v3);
}

uint64_t sub_2600D5D7C(void *a1, void *a2)
{
  char v3 = v2;
  uint64_t v37 = *MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A866540);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v8 = qword_26A8663D0;
    id v9 = a2;
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2600D9B40();
    __swift_project_value_buffer(v10, (uint64_t)qword_26A866630);
    id v11 = v9;
    uint64_t v12 = sub_2600D9B20();
    os_log_type_t v13 = sub_2600D9D00();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      v35 = v3;
      id v15 = (uint8_t *)v14;
      v34 = (void *)swift_slowAlloc();
      *(_DWORD *)id v15 = 138412290;
      id v36 = v11;
      id v16 = v11;
      sub_2600D9D60();
      uint64_t v17 = v34;
      void *v34 = a2;

      _os_log_impl(&dword_2600D1000, v12, v13, "Got response from extension with error: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8664C8);
      swift_arrayDestroy();
      MEMORY[0x26120B500](v17, -1, -1);
      uint64_t v18 = v15;
      char v3 = v35;
      MEMORY[0x26120B500](v18, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    v35 = v2;
    if (qword_26A8663D0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2600D9B40();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A866630);
    id v20 = a1;
    uint64_t v21 = sub_2600D9B20();
    os_log_type_t v22 = sub_2600D9D10();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 138543362;
      v34 = a1;
      if (a1)
      {
        id v36 = v20;
        id v25 = v20;
      }
      else
      {
        id v36 = 0;
      }
      sub_2600D9D60();
      a1 = v34;
      *uint64_t v24 = v34;

      _os_log_impl(&dword_2600D1000, v21, v22, "Extension UI completed preflight checks with configuration: %{public}@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A8664C8);
      swift_arrayDestroy();
      MEMORY[0x26120B500](v24, -1, -1);
      MEMORY[0x26120B500](v23, -1, -1);
    }
    else
    {
    }
    char v3 = v35;
  }
  uint64_t v26 = sub_2600D9CE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 1, 1, v26);
  sub_2600D9CC0();
  id v27 = a1;
  id v28 = v3;
  id v29 = a2;
  uint64_t v30 = sub_2600D9CB0();
  v31 = (void *)swift_allocObject();
  uint64_t v32 = MEMORY[0x263F8F500];
  v31[2] = v30;
  v31[3] = v32;
  v31[4] = v28;
  v31[5] = a1;
  v31[6] = a2;
  sub_2600D63CC((uint64_t)v7, (uint64_t)&unk_26A866550, (uint64_t)v31);
  return swift_release();
}

uint64_t sub_2600D6200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a1;
  v6[4] = a4;
  sub_2600D9CC0();
  v6[7] = sub_2600D9CB0();
  uint64_t v8 = sub_2600D9C90();
  return MEMORY[0x270FA2498](sub_2600D629C, v8, v7);
}

uint64_t sub_2600D629C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_release();
  swift_getKeyPath();
  *(void *)(v0 + 16) = v1;
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  int v2 = *(void (**)(uint64_t, uint64_t))(v1
                                               + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  if (v2)
  {
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    swift_retain();
    v2(v4, v3);
    sub_2600D5174((uint64_t)v2);
  }
  **(unsigned char **)(v0 + 24) = v2 == 0;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2600D63CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2600D9CE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2600D9CD0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2600D5280(a1, &qword_26A866540);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2600D9C90();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665E8);
  return swift_task_create();
}

void sub_2600D6608(uint64_t a1)
{
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection];
  if (v3
    && (id v4 = objc_msgSend(v3, sel_remoteObjectProxy),
        sub_2600D9D70(),
        swift_unknownObjectRelease(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665B8),
        (swift_dynamicCast() & 1) != 0))
  {
    objc_msgSend(v1, sel_startRequestWithConfiguration_, a1);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_26A8663D0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2600D9B40();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A866630);
    uint64_t v6 = sub_2600D9B20();
    os_log_type_t v7 = sub_2600D9D00();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2600D1000, v6, v7, "Unable to obtain remote object proxy", v8, 2u);
      MEMORY[0x26120B500](v8, -1, -1);
    }
  }
}

void *sub_2600D67E8()
{
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection);
  id v2 = v1;
  return v1;
}

id sub_2600D6898@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  id v4 = *(void **)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection);
  *a2 = v4;

  return v4;
}

void sub_2600D6958(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  id v2 = v1;
  sub_2600D9A50();
  swift_release();
}

uint64_t sub_2600D6A34(void *a1)
{
  objc_msgSend(a1, sel_setExportedObject_, v1);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_270C007F0);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  uint64_t v5 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_270C00900);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v5);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_2600D8318;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2600D6F78;
  aBlock[3] = &block_descriptor;
  os_log_type_t v7 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v7);
  _Block_release(v7);
  objc_msgSend(a1, sel_resume);
  swift_getKeyPath();
  aBlock[0] = v1;
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  id v8 = a1;
  sub_2600D9A50();
  swift_release();

  if (qword_26A8663D0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2600D9B40();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A866630);
  uint64_t v10 = sub_2600D9B20();
  os_log_type_t v11 = sub_2600D9CF0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_2600D1000, v10, v11, "Host Connection established", v12, 2u);
    MEMORY[0x26120B500](v12, -1, -1);
    os_log_type_t v13 = v5;
  }
  else
  {
    os_log_type_t v13 = v10;
    uint64_t v10 = v5;
  }

  return 1;
}

void sub_2600D6D30(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  sub_2600D9C80();
  id v2 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v3 = (void *)sub_2600D9C70();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithDomain_code_userInfo_, v3, 14, 0);

  if (qword_26A8663D0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2600D9B40();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A866630);
  id v6 = v4;
  os_log_type_t v7 = sub_2600D9B20();
  os_log_type_t v8 = sub_2600D9D00();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v6;
    sub_2600D9D60();
    void *v10 = v6;

    _os_log_impl(&dword_2600D1000, v7, v8, "Connection interrupted, finishing translation with error %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8664C8);
    swift_arrayDestroy();
    MEMORY[0x26120B500](v10, -1, -1);
    MEMORY[0x26120B500](v9, -1, -1);
  }
  else
  {
  }
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x26120B5A0](v1);
  if (v12)
  {
    os_log_type_t v13 = (void *)v12;
    id v14 = v6;
    sub_2600D5D7C(0, v6);
  }
}

uint64_t sub_2600D6F78(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_2600D7008()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A866540);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2600D9CE0();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  int v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  id v7 = v0;
  if (v6 == 1)
  {
    sub_2600D5280((uint64_t)v2, &qword_26A866540);
  }
  else
  {
    sub_2600D9CD0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_2600D9C90();
      uint64_t v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        v12[3] = v10;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2600D722C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_2600D9A90();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665C0);
  v4[11] = swift_task_alloc();
  uint64_t v6 = sub_2600D9B10();
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  uint64_t v7 = sub_2600D9AC0();
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  uint64_t v8 = sub_2600D9AE0();
  v4[19] = v8;
  v4[20] = *(void *)(v8 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v9 = sub_2600D9B00();
  v4[22] = v9;
  v4[23] = *(void *)(v9 - 8);
  v4[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2600D74CC, 0, 0);
}

uint64_t sub_2600D74CC()
{
  sub_2600D9AB0();
  sub_2600D9AF0();
  sub_2600D9AD0();
  v0[25] = OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel___observationRegistrar;
  uint64_t v1 = sub_2600D8C44(&qword_26A8665C8, MEMORY[0x263F04D38]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[26] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2600D7604;
  uint64_t v3 = v0[16];
  return MEMORY[0x270FA1E80](v0 + 2, v3, v1);
}

uint64_t sub_2600D7604()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2600D7D94;
  }
  else {
    uint64_t v2 = sub_2600D7718;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2600D7718()
{
  *(void *)(v0 + 224) = *(void *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_2600D773C, 0, 0);
}

uint64_t sub_2600D773C()
{
  if (v0[28])
  {
    sub_2600D9CC0();
    v0[29] = sub_2600D9CB0();
    uint64_t v2 = sub_2600D9C90();
    return MEMORY[0x270FA2498](sub_2600D78EC, v2, v1);
  }
  else
  {
    uint64_t v4 = v0[23];
    uint64_t v3 = v0[24];
    uint64_t v6 = v0[21];
    uint64_t v5 = v0[22];
    uint64_t v7 = v0[19];
    uint64_t v8 = v0[20];
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
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
}

uint64_t sub_2600D78EC()
{
  uint64_t v1 = v0[28];
  swift_release();
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[12];
    uint64_t v3 = v0[13];
    uint64_t v4 = v0[11];
    uint64_t v5 = *(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
    v5(v4, v0[28] + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) != 1)
    {
      uint64_t v7 = v0[14];
      unint64_t v6 = v0[15];
      uint64_t v8 = v0[12];
      uint64_t v25 = v0[13];
      uint64_t v9 = v0[10];
      uint64_t v10 = v0[8];
      uint64_t v11 = v0[9];
      uint64_t v12 = v0[7];
      uint64_t v24 = v0[6];
      (*(void (**)(unint64_t, void, uint64_t))(v25 + 32))(v6, v0[11], v8);
      v5(v7, v6, v8);
      sub_2600D9AA0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v12, v9, v10);
      uint64_t v13 = type metadata accessor for AppExtensionHostView.Configuration(0);
      id v14 = (void *)(v12 + *(int *)(v13 + 20));
      *id v14 = 0xD00000000000001ALL;
      v14[1] = 0x80000002600DAA20;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
      swift_getKeyPath();
      uint64_t v15 = swift_task_alloc();
      *(void *)(v15 + 16) = v24;
      *(void *)(v15 + 24) = v12;
      v0[5] = v24;
      sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
      sub_2600D9A50();
      swift_release();
      swift_task_dealloc();
      sub_2600D5280(v12, (uint64_t *)&unk_26A866460);
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
      (*(void (**)(unint64_t, uint64_t))(v25 + 8))(v6, v8);
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[13] + 56))(v0[11], 1, 1, v0[12]);
  }
  uint64_t v17 = v0[6];
  uint64_t v16 = v0[7];
  sub_2600D5280(v0[11], &qword_26A8665C0);
  uint64_t v18 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  swift_getKeyPath();
  uint64_t v19 = swift_task_alloc();
  *(void *)(v19 + 16) = v17;
  *(void *)(v19 + 24) = v16;
  v0[4] = v17;
  sub_2600D8C44(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A50();
  swift_release();
  swift_task_dealloc();
  sub_2600D5280(v16, (uint64_t *)&unk_26A866460);
LABEL_6:
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_2600D8C44(&qword_26A8665C8, MEMORY[0x263F04D38]);
  uint64_t v21 = (void *)swift_task_alloc();
  v0[26] = v21;
  void *v21 = v0;
  v21[1] = sub_2600D7604;
  uint64_t v22 = v0[16];
  return MEMORY[0x270FA1E80](v0 + 2, v22, v20);
}

uint64_t sub_2600D7D94()
{
  *(void *)(v0 + 24) = *(void *)(v0 + 216);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665D0);
  swift_willThrowTypedImpl();
  return MEMORY[0x270FA2498](sub_2600D7E20, 0, 0);
}

uint64_t sub_2600D7E20()
{
  uint64_t v2 = v0[23];
  uint64_t v1 = v0[24];
  uint64_t v4 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v5 = v0[19];
  uint64_t v6 = v0[20];
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

id LanguageSupportHostModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void LanguageSupportHostModel.init()()
{
}

id LanguageSupportHostModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageSupportHostModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2600D80D4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2600D8124(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_2600D81EC;
  return sub_2600D6200(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2600D81EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2600D82E0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2600D8318()
{
  sub_2600D6D30(v0);
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

void sub_2600D8340()
{
}

uint64_t type metadata accessor for LanguageSupportHostModel()
{
  uint64_t result = qword_26A8665A0;
  if (!qword_26A8665A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2600D83A4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2600D83E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2600D81EC;
  return sub_2600D722C(a1, v4, v5, v6);
}

uint64_t sub_2600D8498()
{
  return type metadata accessor for LanguageSupportHostModel();
}

void sub_2600D84A0()
{
  sub_2600D8660();
  if (v0 <= 0x3F)
  {
    sub_2600D9A80();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for LanguageSupportHostModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LanguageSupportHostModel);
}

uint64_t dispatch thunk of LanguageSupportHostModel.didFinish(finalConfiguration:error:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of LanguageSupportHostModel.shouldAccept(connection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of LanguageSupportHostModel.connectToService()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

void sub_2600D8660()
{
  if (!qword_26A8665B0)
  {
    type metadata accessor for AppExtensionHostView.Configuration(255);
    unint64_t v0 = sub_2600D9D50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A8665B0);
    }
  }
}

void sub_2600D86C0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote) = *(unsigned char *)(v0 + 24);
  sub_2600D59D4(v2);
}

void sub_2600D870C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration);
  *(void *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration) = v2;
  id v4 = v2;
}

uint64_t sub_2600D8754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2600D87C4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  uint64_t v4 = *v3;
  *uint64_t v3 = v1;
  v3[1] = v2;
  sub_2600D5164(v1);
  return sub_2600D5174(v4);
}

uint64_t sub_2600D881C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2600D8854(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_2600D8890(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_2600D88C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2600D8928(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2600D8A08;
  return v5(v2 + 32);
}

uint64_t sub_2600D8A08()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

id sub_2600D8B1C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t *)&v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion];
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = &v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration];
  uint64_t v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection] = 0;
  uint64_t v10 = v3;
  sub_2600D9A70();
  *(void *)&v10[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration] = a1;
  uint64_t v11 = *v7;
  id v12 = a1;
  sub_2600D5164(a2);
  sub_2600D5174(v11);
  *uint64_t v7 = a2;
  v7[1] = a3;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for LanguageSupportHostModel();
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_2600D8C44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2600D8C8C()
{
  return sub_2600D5910(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_2600D8CA8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection);
  *(void *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection) = v2;
  id v4 = v2;
}

uint64_t sub_2600D8CE8(uint64_t a1)
{
  id v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2600D8DA0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A8665D8 + dword_26A8665D8);
  return v6(a1, v4);
}

uint64_t sub_2600D8DAC()
{
  return sub_2600D8C8C();
}

uint64_t sub_2600D8DC4()
{
  uint64_t v0 = sub_2600D9B40();
  __swift_allocate_value_buffer(v0, qword_26A866630);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A866630);
  return sub_2600D9B30();
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

uint64_t sub_2600D8EA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2600D9988(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A60();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration;
  swift_beginAccess();
  return sub_2600D8754(v4, a2);
}

uint64_t sub_2600D8F74(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
  MEMORY[0x270FA5388]();
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2600D8754(a1, (uint64_t)v5);
  uint64_t v6 = *a2;
  swift_getKeyPath();
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  sub_2600D9988(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A50();
  swift_release();
  return sub_2600D99D0((uint64_t)v5);
}

unint64_t RemoteUIExtensionPointIdentifier.getter()
{
  return 0xD000000000000029;
}

id PreflightHostingView.preflightConfiguration.getter()
{
  return *v0;
}

void PreflightHostingView.preflightConfiguration.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*PreflightHostingView.preflightConfiguration.modify())()
{
  return nullsub_1;
}

void PreflightHostingView.init(preflightConfiguration:completion:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  objc_allocWithZone((Class)type metadata accessor for LanguageSupportHostModel());
  id v8 = a1;
  sub_2600D8B1C(v8, a2, a3);
  sub_2600D9C10();
  sub_2600D5174(a2);

  *a4 = v8;
  a4[1] = v9;
  a4[2] = v10;
}

uint64_t PreflightHostingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A866458);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AppExtensionHostView(0) - 8;
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  id v8 = v1[2];
  uint64_t v25 = v1[1];
  uint64_t v26 = v7;
  id v28 = v25;
  id v29 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665F0);
  sub_2600D9C30();
  uint64_t v9 = v30;
  uint64_t v10 = v31;
  uint64_t v11 = v32;
  swift_getKeyPath();
  uint64_t v30 = v9;
  v31 = v10;
  uint64_t v32 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665F8);
  sub_2600D9C50();

  swift_release();
  swift_release();
  swift_release();
  id v12 = v25;
  uint64_t v30 = v25;
  v31 = v8;
  sub_2600D9C20();
  uint64_t v13 = v28;
  objc_super v14 = (uint64_t (*)())swift_allocObject();
  uint64_t v15 = v26;
  *((void *)v14 + 2) = v26;
  *((void *)v14 + 3) = v12;
  *((void *)v14 + 4) = v8;
  sub_2600D9578((uint64_t)v3, (uint64_t)v6);
  *(void *)&v6[*(int *)(v4 + 28)] = v13;
  uint64_t v16 = (uint64_t (**)())&v6[*(int *)(v4 + 32)];
  void *v16 = sub_2600D956C;
  v16[1] = v14;
  uint64_t v17 = (void (*)())swift_allocObject();
  *((void *)v17 + 2) = v15;
  *((void *)v17 + 3) = v12;
  *((void *)v17 + 4) = v8;
  uint64_t v18 = v27;
  sub_2600D5100((uint64_t)v6, v27);
  uint64_t v19 = (void (**)())(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A866600) + 36));
  *uint64_t v19 = sub_2600D962C;
  v19[1] = v17;
  v19[2] = 0;
  v19[3] = 0;
  swift_retain_n();
  id v20 = v15;
  id v21 = v12;
  id v22 = v20;
  id v23 = v21;
  return sub_2600D9638((uint64_t)v6);
}

uint64_t sub_2600D9410()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665F0);
  sub_2600D9C20();
  swift_getKeyPath();
  sub_2600D9988(&qword_26A866560, (void (*)(uint64_t))type metadata accessor for LanguageSupportHostModel);
  sub_2600D9A50();

  return swift_release();
}

void sub_2600D9508()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8665F0);
  sub_2600D9C20();
  sub_2600D7008();
}

uint64_t sub_2600D956C()
{
  return sub_2600D9410();
}

uint64_t sub_2600D9578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A866458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2600D962C()
{
}

uint64_t sub_2600D9638(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppExtensionHostView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2600D9694(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of PreflightHostingView.body>>, 1);
}

uint64_t destroy for PreflightHostingView(id *a1)
{
  return swift_release();
}

void *_s21TranslationAPISupport20PreflightHostingViewVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PreflightHostingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
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

uint64_t assignWithTake for PreflightHostingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreflightHostingView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PreflightHostingView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreflightHostingView()
{
  return &type metadata for PreflightHostingView;
}

unint64_t sub_2600D98B4()
{
  unint64_t result = qword_26A866608;
  if (!qword_26A866608)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A866600);
    sub_2600D9988(&qword_26A8664A8, (void (*)(uint64_t))type metadata accessor for AppExtensionHostView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A866608);
  }
  return result;
}

void sub_2600D9968()
{
  sub_2600D5D40(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_2600D9988(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2600D99D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A866460);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2600D9A30()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2600D9A40()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2600D9A50()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2600D9A60()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2600D9A70()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2600D9A80()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2600D9A90()
{
  return MEMORY[0x270EEB7C0]();
}

uint64_t sub_2600D9AA0()
{
  return MEMORY[0x270EEB7C8]();
}

uint64_t sub_2600D9AB0()
{
  return MEMORY[0x270EEB7E8]();
}

uint64_t sub_2600D9AC0()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_2600D9AD0()
{
  return MEMORY[0x270EEB800]();
}

uint64_t sub_2600D9AE0()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_2600D9AF0()
{
  return MEMORY[0x270EEB810]();
}

uint64_t sub_2600D9B00()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_2600D9B10()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_2600D9B20()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2600D9B30()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2600D9B40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2600D9B50()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2600D9B60()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2600D9B70()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2600D9B90()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2600D9BA0()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2600D9BB0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2600D9BD0()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_2600D9BE0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2600D9BF0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2600D9C00()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2600D9C10()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2600D9C20()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2600D9C30()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2600D9C40()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2600D9C50()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_2600D9C60()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2600D9C70()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2600D9C80()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2600D9C90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2600D9CB0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2600D9CC0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2600D9CD0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2600D9CE0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2600D9CF0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2600D9D00()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2600D9D10()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2600D9D20()
{
  return MEMORY[0x270EEB9C0]();
}

uint64_t sub_2600D9D30()
{
  return MEMORY[0x270EEB9C8]();
}

uint64_t sub_2600D9D40()
{
  return MEMORY[0x270EEB9D0]();
}

uint64_t sub_2600D9D50()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2600D9D60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2600D9D70()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2600D9D80()
{
  return MEMORY[0x270F9EFF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}