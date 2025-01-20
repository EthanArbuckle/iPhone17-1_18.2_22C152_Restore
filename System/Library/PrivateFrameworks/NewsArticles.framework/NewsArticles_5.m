uint64_t RouterType.route(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4;

  v4 = 0;
  return (*(uint64_t (**)(uint64_t, char *, void, uint64_t, uint64_t))(a3 + 8))(a1, &v4, 0, a2, a3);
}

uint64_t sub_1BF7DA0F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1BF7DFDD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DFDC8();
  sub_1BF77242C(a1, (uint64_t)v8, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t RouterType.route(to:option:tracker:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_1BF7DFDD8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DFDC8();
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(a5 + 16))(a1, v12, a3, a4, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t RouterType.route(to:option:tracker:contextBuilder:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7 = *a2;
  return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(a6 + 8))(a1, &v7, a3, a5, a6);
}

uint64_t RouterType.preview(for:tracker:contextBuilder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 40))(a1, a2, a4, a5);
}

uint64_t RouterType.route(to:options:tracker:contextBuilder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 16))(a1, a2, a3, a5, a6);
}

uint64_t RouterType.preview(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(a3 + 40))(a1, 0, a2, a3);
}

void *initializeBufferWithCopyOfBuffer for RouteModel(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        sub_1BF772EB0();
        uint64_t v10 = v9;
        uint64_t v11 = *(int *)(v9 + 48);
        v12 = (void **)((char *)a1 + v11);
        v13 = (void **)((char *)a2 + v11);
        uint64_t v14 = type metadata accessor for ArticleNavigationAction();
        swift_unknownObjectRetain();
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          sub_1BF4DC4F4();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v27 - 8) + 16))(v12, v13, v27);
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload == 1)
        {
          v25 = *v13;
          char *v12 = *v13;
          id v26 = v25;
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload)
        {
          memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
        }
        else
        {
          v16 = v13[1];
          char *v12 = *v13;
          v12[1] = v16;
          swift_bridgeObjectRetain();
          swift_storeEnumTagMultiPayload();
        }
        uint64_t v28 = *(int *)(v10 + 64);
        long long v29 = *(_OWORD *)((char *)a2 + v28 + 24);
        *(_OWORD *)((char *)a1 + v28 + 24) = v29;
        (**(void (***)(void))(v29 - 8))();
        *(_OWORD *)((char *)a1 + *(int *)(v10 + 80)) = *(_OWORD *)((char *)a2 + *(int *)(v10 + 80));
        swift_unknownObjectRetain();
        goto LABEL_26;
      case 2u:
        type metadata accessor for ArticleRouteModel();
        int v7 = swift_getEnumCaseMultiPayload();
        *a1 = *a2;
        if (v7 == 1)
        {
          swift_retain();
        }
        else
        {
          sub_1BF6EAB38();
          uint64_t v19 = *(int *)(v18 + 48);
          v20 = (void **)((char *)a1 + v19);
          v21 = (void **)((char *)a2 + v19);
          uint64_t v22 = type metadata accessor for ArticleNavigationAction();
          swift_retain();
          int v23 = swift_getEnumCaseMultiPayload();
          if (v23 == 2)
          {
            sub_1BF4DC4F4();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v30 - 8) + 16))(v20, v21, v30);
          }
          else if (v23 == 1)
          {
            v31 = *v21;
            *v20 = *v21;
            id v32 = v31;
          }
          else
          {
            if (v23)
            {
              memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
              goto LABEL_25;
            }
            v24 = v21[1];
            *v20 = *v21;
            v20[1] = v24;
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
LABEL_25:
        swift_storeEnumTagMultiPayload();
        sub_1BF7CEDFC();
        *((unsigned char *)a1 + *(int *)(v33 + 48)) = *((unsigned char *)a2 + *(int *)(v33 + 48));
LABEL_26:
        swift_storeEnumTagMultiPayload();
        return a1;
      case 3u:
        uint64_t v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        swift_bridgeObjectRetain();
        goto LABEL_26;
      case 4u:
        uint64_t v8 = sub_1BF7DD068();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        goto LABEL_26;
      default:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_26;
    }
  }
  uint64_t v6 = *a2;
  *a1 = *a2;
  a1 = (void *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

void destroy for RouteModel(void **a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      goto LABEL_21;
    case 1u:
      swift_unknownObjectRelease();
      sub_1BF772EB0();
      uint64_t v5 = v4;
      uint64_t v6 = (void **)((char *)a1 + *(int *)(v4 + 48));
      type metadata accessor for ArticleNavigationAction();
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      switch(EnumCaseMultiPayload)
      {
        case 2:
          sub_1BF4DC4F4();
          (*(void (**)(id *, uint64_t))(*(void *)(v11 - 8) + 8))(v6, v11);
          break;
        case 1:

          break;
        case 0:
          swift_bridgeObjectRelease();
          break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + *(int *)(v5 + 64));
LABEL_21:
      swift_unknownObjectRelease();
      return;
    case 2u:
      type metadata accessor for ArticleRouteModel();
      int v8 = swift_getEnumCaseMultiPayload();
      swift_release();
      if (v8 == 1) {
        return;
      }
      sub_1BF6EAB38();
      a1 = (void **)((char *)a1 + *(int *)(v9 + 48));
      type metadata accessor for ArticleNavigationAction();
      int v10 = swift_getEnumCaseMultiPayload();
      switch(v10)
      {
        case 2:
          sub_1BF4DC4F4();
LABEL_3:
          v3 = *(void (**)(void **, uint64_t))(*(void *)(v2 - 8) + 8);
          v3(a1, v2);
          break;
        case 1:
          v12 = *a1;

          break;
        case 0:
LABEL_15:
          swift_bridgeObjectRelease();
          break;
      }
      return;
    case 3u:
      goto LABEL_15;
    case 4u:
      uint64_t v2 = sub_1BF7DD068();
      goto LABEL_3;
    default:
      return;
  }
}

void *initializeWithCopy for RouteModel(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *a1 = *a2;
      sub_1BF772EB0();
      uint64_t v7 = v6;
      uint64_t v8 = *(int *)(v6 + 48);
      uint64_t v9 = (void **)((char *)a1 + v8);
      int v10 = (void **)((char *)a2 + v8);
      uint64_t v11 = type metadata accessor for ArticleNavigationAction();
      swift_unknownObjectRetain();
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        sub_1BF4DC4F4();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v24 - 8) + 16))(v9, v10, v24);
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload == 1)
      {
        uint64_t v22 = *v10;
        *uint64_t v9 = *v10;
        id v23 = v22;
        swift_storeEnumTagMultiPayload();
      }
      else if (EnumCaseMultiPayload)
      {
        memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        v13 = v10[1];
        *uint64_t v9 = *v10;
        v9[1] = v13;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v25 = *(int *)(v7 + 64);
      long long v26 = *(_OWORD *)((char *)a2 + v25 + 24);
      *(_OWORD *)((char *)a1 + v25 + 24) = v26;
      (**(void (***)(void))(v26 - 8))();
      *(_OWORD *)((char *)a1 + *(int *)(v7 + 80)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 80));
      swift_unknownObjectRetain();
      goto LABEL_24;
    case 2u:
      type metadata accessor for ArticleRouteModel();
      int v4 = swift_getEnumCaseMultiPayload();
      *a1 = *a2;
      if (v4 == 1)
      {
        swift_retain();
      }
      else
      {
        sub_1BF6EAB38();
        uint64_t v16 = *(int *)(v15 + 48);
        uint64_t v17 = (void **)((char *)a1 + v16);
        uint64_t v18 = (void **)((char *)a2 + v16);
        uint64_t v19 = type metadata accessor for ArticleNavigationAction();
        swift_retain();
        int v20 = swift_getEnumCaseMultiPayload();
        if (v20 == 2)
        {
          sub_1BF4DC4F4();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v27 - 8) + 16))(v17, v18, v27);
        }
        else if (v20 == 1)
        {
          uint64_t v28 = *v18;
          *uint64_t v17 = *v18;
          id v29 = v28;
        }
        else
        {
          if (v20)
          {
            memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
            goto LABEL_23;
          }
          v21 = v18[1];
          *uint64_t v17 = *v18;
          v17[1] = v21;
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
LABEL_23:
      swift_storeEnumTagMultiPayload();
      sub_1BF7CEDFC();
      *((unsigned char *)a1 + *(int *)(v30 + 48)) = *((unsigned char *)a2 + *(int *)(v30 + 48));
      goto LABEL_24;
    case 3u:
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_bridgeObjectRetain();
      goto LABEL_24;
    case 4u:
      uint64_t v5 = sub_1BF7DD068();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      goto LABEL_24;
    default:
      *a1 = *a2;
      swift_unknownObjectRetain();
LABEL_24:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

void *assignWithCopy for RouteModel(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1BF6EDE40((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        sub_1BF772EB0();
        uint64_t v7 = v6;
        uint64_t v8 = *(int *)(v6 + 48);
        uint64_t v9 = (void **)((char *)a1 + v8);
        int v10 = (void **)((char *)a2 + v8);
        uint64_t v11 = type metadata accessor for ArticleNavigationAction();
        swift_unknownObjectRetain();
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          sub_1BF4DC4F4();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v21 - 8) + 16))(v9, v10, v21);
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload == 1)
        {
          uint64_t v19 = *v10;
          *uint64_t v9 = *v10;
          id v20 = v19;
          swift_storeEnumTagMultiPayload();
        }
        else if (EnumCaseMultiPayload)
        {
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          *uint64_t v9 = *v10;
          v9[1] = v10[1];
          swift_bridgeObjectRetain();
          swift_storeEnumTagMultiPayload();
        }
        uint64_t v22 = *(int *)(v7 + 64);
        id v23 = (char *)a1 + v22;
        uint64_t v24 = *(void *)((char *)a2 + v22 + 24);
        *((void *)v23 + 3) = v24;
        *((void *)v23 + 4) = *(void *)((char *)a2 + v22 + 32);
        (**(void (***)(void))(v24 - 8))();
        *(_OWORD *)((char *)a1 + *(int *)(v7 + 80)) = *(_OWORD *)((char *)a2 + *(int *)(v7 + 80));
        swift_unknownObjectRetain();
        goto LABEL_25;
      case 2u:
        type metadata accessor for ArticleRouteModel();
        int v4 = swift_getEnumCaseMultiPayload();
        *a1 = *a2;
        if (v4 == 1)
        {
          swift_retain();
        }
        else
        {
          sub_1BF6EAB38();
          uint64_t v14 = *(int *)(v13 + 48);
          uint64_t v15 = (void **)((char *)a1 + v14);
          uint64_t v16 = (void **)((char *)a2 + v14);
          uint64_t v17 = type metadata accessor for ArticleNavigationAction();
          swift_retain();
          int v18 = swift_getEnumCaseMultiPayload();
          if (v18 == 2)
          {
            sub_1BF4DC4F4();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v25 - 8) + 16))(v15, v16, v25);
          }
          else if (v18 == 1)
          {
            long long v26 = *v16;
            *uint64_t v15 = *v16;
            id v27 = v26;
          }
          else
          {
            if (v18)
            {
              memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
              goto LABEL_24;
            }
            *uint64_t v15 = *v16;
            v15[1] = v16[1];
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
LABEL_24:
        swift_storeEnumTagMultiPayload();
        sub_1BF7CEDFC();
        *((unsigned char *)a1 + *(int *)(v28 + 48)) = *((unsigned char *)a2 + *(int *)(v28 + 48));
LABEL_25:
        swift_storeEnumTagMultiPayload();
        return a1;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_25;
      case 4u:
        uint64_t v5 = sub_1BF7DD068();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        goto LABEL_25;
      default:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_25;
    }
  }
  return a1;
}

uint64_t type metadata accessor for RouteModel()
{
  uint64_t result = qword_1EA1586F8;
  if (!qword_1EA1586F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *initializeWithTake for RouteModel(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 4:
      uint64_t v14 = sub_1BF7DD068();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
LABEL_17:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 2:
      uint64_t v15 = type metadata accessor for ArticleRouteModel();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        sub_1BF6EAB38();
        uint64_t v21 = *(int *)(v20 + 48);
        uint64_t v22 = (char *)a1 + v21;
        id v23 = (char *)a2 + v21;
        uint64_t v24 = type metadata accessor for ArticleNavigationAction();
        if (swift_getEnumCaseMultiPayload() == 2)
        {
          sub_1BF4DC4F4();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
        }
        swift_storeEnumTagMultiPayload();
      }
      sub_1BF7CEDFC();
      *((unsigned char *)a1 + *(int *)(v26 + 48)) = *((unsigned char *)a2 + *(int *)(v26 + 48));
      goto LABEL_17;
    case 1:
      *a1 = *a2;
      sub_1BF772EB0();
      uint64_t v8 = v7;
      uint64_t v9 = *(int *)(v7 + 48);
      int v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = type metadata accessor for ArticleNavigationAction();
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        sub_1BF4DC4F4();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
      }
      uint64_t v16 = *(int *)(v8 + 64);
      uint64_t v17 = (char *)a1 + v16;
      int v18 = (char *)a2 + v16;
      long long v19 = *((_OWORD *)v18 + 1);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *((_OWORD *)v17 + 1) = v19;
      *((void *)v17 + 4) = *((void *)v18 + 4);
      *(_OWORD *)((char *)a1 + *(int *)(v8 + 80)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 80));
      goto LABEL_17;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithTake for RouteModel(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1BF6EDE40((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 4:
        uint64_t v14 = sub_1BF7DD068();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
LABEL_18:
        swift_storeEnumTagMultiPayload();
        return a1;
      case 2:
        uint64_t v15 = type metadata accessor for ArticleRouteModel();
        if (swift_getEnumCaseMultiPayload())
        {
          memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          *a1 = *a2;
          sub_1BF6EAB38();
          uint64_t v21 = *(int *)(v20 + 48);
          uint64_t v22 = (char *)a1 + v21;
          id v23 = (char *)a2 + v21;
          uint64_t v24 = type metadata accessor for ArticleNavigationAction();
          if (swift_getEnumCaseMultiPayload() == 2)
          {
            sub_1BF4DC4F4();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
            swift_storeEnumTagMultiPayload();
          }
          else
          {
            memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
          }
          swift_storeEnumTagMultiPayload();
        }
        sub_1BF7CEDFC();
        *((unsigned char *)a1 + *(int *)(v26 + 48)) = *((unsigned char *)a2 + *(int *)(v26 + 48));
        goto LABEL_18;
      case 1:
        *a1 = *a2;
        sub_1BF772EB0();
        uint64_t v8 = v7;
        uint64_t v9 = *(int *)(v7 + 48);
        int v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = type metadata accessor for ArticleNavigationAction();
        if (swift_getEnumCaseMultiPayload() == 2)
        {
          sub_1BF4DC4F4();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
        }
        uint64_t v16 = *(int *)(v8 + 64);
        uint64_t v17 = (char *)a1 + v16;
        int v18 = (char *)a2 + v16;
        long long v19 = *((_OWORD *)v18 + 1);
        *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
        *((_OWORD *)v17 + 1) = v19;
        *((void *)v17 + 4) = *((void *)v18 + 4);
        *(_OWORD *)((char *)a1 + *(int *)(v8 + 80)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 80));
        goto LABEL_18;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1BF7DB7D8()
{
  int v10 = "\b";
  uint64_t v5 = "\b";
  uint64_t result = type metadata accessor for ArticleNavigationAction();
  if (v1 <= 0x3F)
  {
    uint64_t v6 = *(void *)(result - 8) + 64;
    uint64_t v7 = &unk_1BF8085C0;
    uint64_t v8 = &unk_1BF8085D8;
    swift_getTupleTypeLayout();
    uint64_t v11 = &v9;
    uint64_t result = type metadata accessor for ArticleRouteModel();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v12 = &v4;
      uint64_t v13 = &unk_1BF8085D8;
      uint64_t result = sub_1BF7DD068();
      if (v3 <= 0x3F)
      {
        uint64_t v14 = *(void *)(result - 8) + 64;
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t dispatch thunk of RouterType.route(to:option:tracker:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of RouterType.route(to:options:tracker:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of RouterType.route(to:option:tracker:contextBuilder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of RouterType.route(to:options:tracker:contextBuilder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of RouterType.preview(for:tracker:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of RouterType.preview(for:tracker:contextBuilder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t type metadata accessor for Router()
{
  return self;
}

uint64_t dispatch thunk of PDFReplicaCoordinatorType.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PDFReplicaCoordinatorType.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PDFReplicaCoordinatorType.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PDFReplicaCoordinatorType.startViewSession(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PDFReplicaCoordinatorType.endViewSession(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PDFReplicaCoordinatorType.didFailLoading(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of PDFReplicaCoordinatorType.trackPaywallVisible(isVisible:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t ArticleViewerBlueprintProvider.__allocating_init(blueprint:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ArticleViewerBlueprint(0);
  MEMORY[0x1F4188790](v2 - 8);
  char v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = swift_allocObject();
  sub_1BF4D1E64(a1, (uint64_t)v4);
  sub_1BF4D1EC8();
  swift_allocObject();
  uint64_t v6 = sub_1BF7DDBF8();
  sub_1BF4D1F20(a1);
  *(void *)(v5 + 16) = v6;
  return v5;
}

uint64_t sub_1BF7DBB20(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1BF7DBB80()
{
  return swift_retain();
}

uint64_t sub_1BF7DBBB8(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_1BF7DBC00())()
{
  return j__swift_endAccess;
}

uint64_t ArticleViewerBlueprintProvider.init(blueprint:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ArticleViewerBlueprint(0);
  MEMORY[0x1F4188790](v4 - 8);
  sub_1BF4D1E64(a1, (uint64_t)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BF4D1EC8();
  swift_allocObject();
  uint64_t v6 = sub_1BF7DDBF8();
  sub_1BF4D1F20(a1);
  *(void *)(v2 + 16) = v6;
  return v2;
}

uint64_t ArticleViewerBlueprintProvider.deinit()
{
  swift_release();
  return v0;
}

uint64_t ArticleViewerBlueprintProvider.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1BF7DBD64()
{
  return swift_retain();
}

uint64_t sub_1BF7DBDA8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_retain();
}

uint64_t dispatch thunk of ArticleViewerBlueprintProviderType.blueprint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for ArticleViewerBlueprintProvider()
{
  return self;
}

uint64_t method lookup function for ArticleViewerBlueprintProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArticleViewerBlueprintProvider);
}

uint64_t dispatch thunk of ArticleViewerBlueprintProvider.blueprint.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of ArticleViewerBlueprintProvider.blueprint.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ArticleViewerBlueprintProvider.blueprint.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ArticleViewerBlueprintProvider.__allocating_init(blueprint:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1BF7DBEC8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BF4A9B28((uint64_t)a1, (uint64_t)v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF7DD778();
  uint64_t result = sub_1BF7DDA58();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = type metadata accessor for ArticleSharingModule();
    uint64_t v7 = swift_allocObject();
    uint64_t result = sub_1BF4A9BF4(v8, v7 + 16);
    *(void *)(v7 + 56) = v5;
    a2[3] = v6;
    a2[4] = (uint64_t)&protocol witness table for ArticleSharingModule;
    *a2 = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF7DBF78()
{
  type metadata accessor for ArticleSharingViewController();
  sub_1BF7DDEA8();
  swift_release();
  sub_1BF4D639C(0, &qword_1EA158710);
  sub_1BF7DDEB8();
  swift_release();
  sub_1BF4D639C(0, &qword_1EA158718);
  sub_1BF7DDEB8();
  swift_release();
  sub_1BF4D639C(0, &qword_1EA158720);
  sub_1BF7DDEB8();
  return swift_release();
}

uint64_t sub_1BF7DC0B0(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF4D639C(0, &qword_1EA158710);
  uint64_t result = sub_1BF7DDA68();
  if (!v25)
  {
    __break(1u);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF4D639C(0, &qword_1EA158718);
  uint64_t result = sub_1BF7DDA68();
  uint64_t v3 = v22;
  if (!v22)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = v23;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF7DD778();
  uint64_t result = sub_1BF7DDA58();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
    double v7 = MEMORY[0x1F4188790](v6);
    char v9 = (void *)((char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v10 + 16))(v9, v7);
    uint64_t v11 = *v9;
    uint64_t v20 = type metadata accessor for ArticleSharingStyler();
    uint64_t v21 = &off_1F1AD5E98;
    v19[0] = v11;
    uint64_t v12 = (char *)objc_allocWithZone((Class)type metadata accessor for ArticleSharingViewController());
    uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
    double v14 = MEMORY[0x1F4188790](v13);
    uint64_t v16 = (void *)((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *, double))(v17 + 16))(v16, v14);
    int v18 = sub_1BF7DC764(*v16, v3, v4, v5, v12);
    swift_unknownObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    return (uint64_t)v18;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1BF7DC374@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF4D639C(0, &qword_1EBA65340);
  uint64_t result = sub_1BF7DDA68();
  if (v7)
  {
    uint64_t v4 = type metadata accessor for ArticleSharingStyler();
    uint64_t v5 = swift_allocObject();
    uint64_t result = sub_1BF4A9BF4(&v6, v5 + 16);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_1F1AD5E98;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF7DC428@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF4D639C(0, &qword_1EA158720);
  uint64_t result = sub_1BF7DDA68();
  if (v7)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BF7DD778();
    uint64_t result = sub_1BF7DDA58();
    if (result)
    {
      uint64_t v5 = result;
      type metadata accessor for ArticleSharingEventHandler();
      long long v6 = (void *)swift_allocObject();
      v6[3] = 0;
      swift_unknownObjectWeakInit();
      v6[4] = v7;
      v6[5] = v8;
      v6[6] = v5;
      *(void *)(v7 + 24) = &off_1F1AC8818;
      uint64_t result = swift_unknownObjectWeakAssign();
      *a2 = v6;
      a2[1] = &off_1F1AC8820;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BF7DC548@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF4BCCBC();
  uint64_t result = sub_1BF7DDA58();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v5 = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF4D639C(0, (unint64_t *)&qword_1EBA65B30);
  uint64_t result = sub_1BF7DDA68();
  if (!v8)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF7DD778();
  uint64_t result = sub_1BF7DDA58();
  if (result)
  {
    uint64_t v6 = result;
    type metadata accessor for ArticleSharingInteractor();
    uint64_t v7 = (void *)swift_allocObject();
    v7[3] = 0;
    uint64_t result = swift_unknownObjectWeakInit();
    v7[4] = v5;
    v7[5] = v8;
    v7[6] = v9;
    v7[7] = v6;
    *a2 = v7;
    a2[1] = &off_1F1AD1110;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ArticleSharingAssembly()
{
  return self;
}

uint64_t sub_1BF7DC6AC()
{
  sub_1BF7DDB58();
  sub_1BF4D639C(0, (unint64_t *)&unk_1EBA625F0);
  sub_1BF7DDEB8();
  swift_release();
  swift_release();
  sub_1BF7DDB68();
  sub_1BF7DDE98();
  return swift_release();
}

char *sub_1BF7DC764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v21[3] = type metadata accessor for ArticleSharingStyler();
  v21[4] = &off_1F1AD5E98;
  v21[0] = a1;
  swift_unknownObjectWeakInit();
  uint64_t v11 = OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareButton;
  uint64_t v12 = self;
  uint64_t v13 = a5;
  *(void *)&a5[v11] = objc_msgSend(v12, sel_buttonWithType_, 1);
  uint64_t v14 = OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareAction;
  sub_1BF5DF588();
  *(void *)&v13[v14] = objc_msgSend(objc_allocWithZone(v15), sel_init);
  *(void *)&v13[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_topPadding] = 0x403C000000000000;
  *(void *)&v13[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_bottomPadding] = 0x404C000000000000;
  sub_1BF4A9B28((uint64_t)v21, (uint64_t)&v13[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_styler]);
  uint64_t v16 = &v13[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_eventHandler];
  *(void *)uint64_t v16 = a2;
  *((void *)v16 + 1) = a3;
  *(void *)&v13[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_tracker] = a4;
  swift_unknownObjectRetain();
  swift_retain();

  v20.receiver = v13;
  v20.super_class = ObjectType;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, 0, 0);
  *(void *)(*(void *)&v17[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_eventHandler] + 24) = &off_1F1AD7CE8;
  swift_unknownObjectWeakAssign();
  int v18 = v17;
  sub_1BF7E0848();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  return v18;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1BF7DCA38()
{
  return MEMORY[0x1F40D3A80]();
}

uint64_t sub_1BF7DCA48()
{
  return MEMORY[0x1F40D3A98]();
}

uint64_t sub_1BF7DCA58()
{
  return MEMORY[0x1F40D3AA0]();
}

uint64_t sub_1BF7DCA68()
{
  return MEMORY[0x1F40D3B10]();
}

uint64_t sub_1BF7DCA78()
{
  return MEMORY[0x1F40D3B20]();
}

uint64_t sub_1BF7DCA98()
{
  return MEMORY[0x1F40D3C40]();
}

uint64_t sub_1BF7DCAA8()
{
  return MEMORY[0x1F40D3C48]();
}

uint64_t sub_1BF7DCAB8()
{
  return MEMORY[0x1F40D3C88]();
}

uint64_t sub_1BF7DCAF8()
{
  return MEMORY[0x1F40D3DA0]();
}

uint64_t sub_1BF7DCB08()
{
  return MEMORY[0x1F40D3E98]();
}

uint64_t sub_1BF7DCB18()
{
  return MEMORY[0x1F40D3EC8]();
}

uint64_t sub_1BF7DCB28()
{
  return MEMORY[0x1F40D3F08]();
}

uint64_t sub_1BF7DCB38()
{
  return MEMORY[0x1F40D3F20]();
}

uint64_t sub_1BF7DCB48()
{
  return MEMORY[0x1F40D3FC0]();
}

uint64_t sub_1BF7DCB58()
{
  return MEMORY[0x1F40D4018]();
}

uint64_t sub_1BF7DCB68()
{
  return MEMORY[0x1F40D4080]();
}

uint64_t sub_1BF7DCB78()
{
  return MEMORY[0x1F40D4090]();
}

uint64_t sub_1BF7DCB88()
{
  return MEMORY[0x1F40D40A0]();
}

uint64_t sub_1BF7DCB98()
{
  return MEMORY[0x1F40D40B8]();
}

uint64_t sub_1BF7DCBA8()
{
  return MEMORY[0x1F40D4108]();
}

uint64_t sub_1BF7DCBB8()
{
  return MEMORY[0x1F40D4200]();
}

uint64_t sub_1BF7DCBC8()
{
  return MEMORY[0x1F40D43C8]();
}

uint64_t sub_1BF7DCBD8()
{
  return MEMORY[0x1F40D43D8]();
}

uint64_t sub_1BF7DCBE8()
{
  return MEMORY[0x1F40D45E0]();
}

uint64_t sub_1BF7DCBF8()
{
  return MEMORY[0x1F40D4608]();
}

uint64_t sub_1BF7DCC08()
{
  return MEMORY[0x1F40D4678]();
}

uint64_t sub_1BF7DCC28()
{
  return MEMORY[0x1F40D46B0]();
}

uint64_t sub_1BF7DCC38()
{
  return MEMORY[0x1F40D46E0]();
}

uint64_t sub_1BF7DCC48()
{
  return MEMORY[0x1F40D4708]();
}

uint64_t sub_1BF7DCC58()
{
  return MEMORY[0x1F40D4720]();
}

uint64_t sub_1BF7DCC68()
{
  return MEMORY[0x1F40D4730]();
}

uint64_t sub_1BF7DCC78()
{
  return MEMORY[0x1F40D4750]();
}

uint64_t sub_1BF7DCC88()
{
  return MEMORY[0x1F40D4798]();
}

uint64_t sub_1BF7DCC98()
{
  return MEMORY[0x1F40D4820]();
}

uint64_t sub_1BF7DCCA8()
{
  return MEMORY[0x1F40D48B0]();
}

uint64_t sub_1BF7DCCB8()
{
  return MEMORY[0x1F40D48D0]();
}

uint64_t sub_1BF7DCCD8()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1BF7DCCE8()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1BF7DCCF8()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1BF7DCD08()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1BF7DCD18()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1BF7DCD28()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1BF7DCD38()
{
  return MEMORY[0x1F40E30A0]();
}

uint64_t sub_1BF7DCD48()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1BF7DCD58()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1BF7DCD68()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1BF7DCD78()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1BF7DCD88()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1BF7DCD98()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1BF7DCDA8()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1BF7DCDB8()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1BF7DCDC8()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1BF7DCDD8()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1BF7DCDE8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1BF7DCDF8()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1BF7DCE08()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1BF7DCE18()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1BF7DCE28()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1BF7DCE38()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1BF7DCE48()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1BF7DCE58()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1BF7DCE68()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1BF7DCE78()
{
  return MEMORY[0x1F40E3750]();
}

uint64_t sub_1BF7DCE88()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1BF7DCE98()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1BF7DCEA8()
{
  return MEMORY[0x1F41656C0]();
}

uint64_t sub_1BF7DCEB8()
{
  return MEMORY[0x1F41656D8]();
}

uint64_t sub_1BF7DCEC8()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_1BF7DCED8()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1BF7DCEE8()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1BF7DCEF8()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1BF7DCF08()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1BF7DCF18()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1BF7DCF28()
{
  return MEMORY[0x1F41656F0]();
}

uint64_t sub_1BF7DCF38()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1BF7DCF48()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BF7DCF58()
{
  return MEMORY[0x1F40E4570]();
}

uint64_t sub_1BF7DCF68()
{
  return MEMORY[0x1F40E4588]();
}

uint64_t sub_1BF7DCF78()
{
  return MEMORY[0x1F40E4590]();
}

uint64_t sub_1BF7DCF88()
{
  return MEMORY[0x1F40E45B8]();
}

uint64_t sub_1BF7DCF98()
{
  return MEMORY[0x1F40E45C8]();
}

uint64_t sub_1BF7DCFA8()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1BF7DCFB8()
{
  return MEMORY[0x1F415D928]();
}

uint64_t sub_1BF7DCFC8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1BF7DCFD8()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1BF7DCFE8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1BF7DCFF8()
{
  return MEMORY[0x1F40E49B0]();
}

uint64_t sub_1BF7DD008()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1BF7DD018()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1BF7DD028()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1BF7DD038()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1BF7DD048()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1BF7DD058()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1BF7DD068()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1BF7DD078()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1BF7DD088()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1BF7DD098()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BF7DD0A8()
{
  return MEMORY[0x1F40E4EF0]();
}

uint64_t sub_1BF7DD0B8()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1BF7DD0C8()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1BF7DD0D8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1BF7DD0E8()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1BF7DD0F8()
{
  return MEMORY[0x1F40E51D0]();
}

uint64_t sub_1BF7DD108()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1BF7DD118()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1BF7DD128()
{
  return MEMORY[0x1F40E5320]();
}

uint64_t sub_1BF7DD138()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1BF7DD148()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BF7DD158()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1BF7DD168()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1BF7DD178()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BF7DD188()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1BF7DD198()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1BF7DD1A8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1BF7DD1B8()
{
  return MEMORY[0x1F40E5BA0]();
}

uint64_t sub_1BF7DD1C8()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1BF7DD1D8()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1BF7DD1E8()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1BF7DD1F8()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1BF7DD208()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1BF7DD218()
{
  return MEMORY[0x1F4138ED0]();
}

uint64_t sub_1BF7DD228()
{
  return MEMORY[0x1F4138EE0]();
}

uint64_t sub_1BF7DD238()
{
  return MEMORY[0x1F4138EE8]();
}

uint64_t sub_1BF7DD248()
{
  return MEMORY[0x1F4138EF0]();
}

uint64_t sub_1BF7DD258()
{
  return MEMORY[0x1F4138EF8]();
}

uint64_t sub_1BF7DD268()
{
  return MEMORY[0x1F4130BC8]();
}

uint64_t sub_1BF7DD278()
{
  return MEMORY[0x1F4130BD0]();
}

uint64_t sub_1BF7DD288()
{
  return MEMORY[0x1F4130BD8]();
}

uint64_t sub_1BF7DD298()
{
  return MEMORY[0x1F4130BE0]();
}

uint64_t sub_1BF7DD2A8()
{
  return MEMORY[0x1F4130BE8]();
}

uint64_t sub_1BF7DD2B8()
{
  return MEMORY[0x1F4130BF0]();
}

uint64_t sub_1BF7DD2C8()
{
  return MEMORY[0x1F4130BF8]();
}

uint64_t sub_1BF7DD2D8()
{
  return MEMORY[0x1F4130C00]();
}

uint64_t sub_1BF7DD2E8()
{
  return MEMORY[0x1F4130C50]();
}

uint64_t sub_1BF7DD2F8()
{
  return MEMORY[0x1F4130C58]();
}

uint64_t sub_1BF7DD308()
{
  return MEMORY[0x1F4130C60]();
}

uint64_t sub_1BF7DD318()
{
  return MEMORY[0x1F4130C68]();
}

uint64_t sub_1BF7DD328()
{
  return MEMORY[0x1F4134230]();
}

uint64_t sub_1BF7DD358()
{
  return MEMORY[0x1F415F248]();
}

uint64_t sub_1BF7DD368()
{
  return MEMORY[0x1F415F250]();
}

uint64_t sub_1BF7DD378()
{
  return MEMORY[0x1F415F258]();
}

uint64_t sub_1BF7DD388()
{
  return MEMORY[0x1F415F260]();
}

uint64_t sub_1BF7DD398()
{
  return MEMORY[0x1F415F268]();
}

uint64_t sub_1BF7DD3A8()
{
  return MEMORY[0x1F415F270]();
}

uint64_t sub_1BF7DD3B8()
{
  return MEMORY[0x1F415F278]();
}

uint64_t _s11TeaSettings0B0C12NewsArticlesE0cD7ModulesV16EndOfArticleFeedV15ConfigOverridesCfd_0()
{
  return MEMORY[0x1F415F290]();
}

uint64_t sub_1BF7DD3D8()
{
  return MEMORY[0x1F415F2E8]();
}

uint64_t sub_1BF7DD3E8()
{
  return MEMORY[0x1F415F2F0]();
}

uint64_t sub_1BF7DD3F8()
{
  return MEMORY[0x1F415F300]();
}

uint64_t sub_1BF7DD408()
{
  return MEMORY[0x1F415F370]();
}

uint64_t sub_1BF7DD418()
{
  return MEMORY[0x1F415F3E8]();
}

uint64_t sub_1BF7DD428()
{
  return MEMORY[0x1F415F3F0]();
}

uint64_t sub_1BF7DD438()
{
  return MEMORY[0x1F415F3F8]();
}

uint64_t sub_1BF7DD448()
{
  return MEMORY[0x1F415F400]();
}

uint64_t sub_1BF7DD458()
{
  return MEMORY[0x1F415F408]();
}

uint64_t sub_1BF7DD468()
{
  return MEMORY[0x1F415F410]();
}

uint64_t sub_1BF7DD478()
{
  return MEMORY[0x1F415F418]();
}

uint64_t sub_1BF7DD488()
{
  return MEMORY[0x1F415F428]();
}

uint64_t sub_1BF7DD498()
{
  return MEMORY[0x1F415F430]();
}

uint64_t sub_1BF7DD4A8()
{
  return MEMORY[0x1F415F440]();
}

uint64_t sub_1BF7DD4B8()
{
  return MEMORY[0x1F415F448]();
}

uint64_t sub_1BF7DD4C8()
{
  return MEMORY[0x1F415F450]();
}

uint64_t sub_1BF7DD4D8()
{
  return MEMORY[0x1F415F4D0]();
}

uint64_t sub_1BF7DD4E8()
{
  return MEMORY[0x1F415F4D8]();
}

uint64_t sub_1BF7DD508()
{
  return MEMORY[0x1F415F540]();
}

uint64_t sub_1BF7DD518()
{
  return MEMORY[0x1F415F548]();
}

uint64_t sub_1BF7DD528()
{
  return MEMORY[0x1F415F578]();
}

uint64_t sub_1BF7DD538()
{
  return MEMORY[0x1F415F590]();
}

uint64_t sub_1BF7DD548()
{
  return MEMORY[0x1F415F598]();
}

uint64_t sub_1BF7DD558()
{
  return MEMORY[0x1F415F5A0]();
}

uint64_t sub_1BF7DD568()
{
  return MEMORY[0x1F415F5A8]();
}

uint64_t sub_1BF7DD578()
{
  return MEMORY[0x1F415F5B0]();
}

uint64_t sub_1BF7DD588()
{
  return MEMORY[0x1F415F5E8]();
}

uint64_t sub_1BF7DD598()
{
  return MEMORY[0x1F415F6B8]();
}

uint64_t sub_1BF7DD5A8()
{
  return MEMORY[0x1F415F6C0]();
}

uint64_t sub_1BF7DD5B8()
{
  return MEMORY[0x1F415F6C8]();
}

uint64_t sub_1BF7DD5C8()
{
  return MEMORY[0x1F415F708]();
}

uint64_t sub_1BF7DD5D8()
{
  return MEMORY[0x1F415F748]();
}

uint64_t sub_1BF7DD5E8()
{
  return MEMORY[0x1F415F760]();
}

uint64_t sub_1BF7DD5F8()
{
  return MEMORY[0x1F415F780]();
}

uint64_t sub_1BF7DD608()
{
  return MEMORY[0x1F415F798]();
}

uint64_t sub_1BF7DD618()
{
  return MEMORY[0x1F415F7A0]();
}

uint64_t sub_1BF7DD628()
{
  return MEMORY[0x1F415F860]();
}

uint64_t sub_1BF7DD638()
{
  return MEMORY[0x1F415F888]();
}

uint64_t sub_1BF7DD648()
{
  return MEMORY[0x1F415F890]();
}

uint64_t sub_1BF7DD668()
{
  return MEMORY[0x1F415F8C0]();
}

uint64_t sub_1BF7DD678()
{
  return MEMORY[0x1F415F8C8]();
}

uint64_t sub_1BF7DD688()
{
  return MEMORY[0x1F415F8D8]();
}

uint64_t sub_1BF7DD698()
{
  return MEMORY[0x1F415F8E0]();
}

uint64_t sub_1BF7DD6A8()
{
  return MEMORY[0x1F415F8E8]();
}

uint64_t sub_1BF7DD6B8()
{
  return MEMORY[0x1F415F928]();
}

uint64_t sub_1BF7DD6C8()
{
  return MEMORY[0x1F415F930]();
}

uint64_t sub_1BF7DD6D8()
{
  return MEMORY[0x1F415F938]();
}

uint64_t sub_1BF7DD6E8()
{
  return MEMORY[0x1F415F958]();
}

uint64_t sub_1BF7DD6F8()
{
  return MEMORY[0x1F415F9E0]();
}

uint64_t sub_1BF7DD708()
{
  return MEMORY[0x1F415F9E8]();
}

uint64_t sub_1BF7DD718()
{
  return MEMORY[0x1F415F9F8]();
}

uint64_t sub_1BF7DD728()
{
  return MEMORY[0x1F41086C0]();
}

uint64_t sub_1BF7DD738()
{
  return MEMORY[0x1F4131790]();
}

uint64_t sub_1BF7DD748()
{
  return MEMORY[0x1F4108780]();
}

uint64_t sub_1BF7DD758()
{
  return MEMORY[0x1F4108790]();
}

uint64_t sub_1BF7DD768()
{
  return MEMORY[0x1F4108798]();
}

uint64_t sub_1BF7DD778()
{
  return MEMORY[0x1F41087C0]();
}

uint64_t sub_1BF7DD788()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_1BF7DD798()
{
  return MEMORY[0x1F4132D20]();
}

uint64_t sub_1BF7DD7A8()
{
  return MEMORY[0x1F415D9B0]();
}

uint64_t sub_1BF7DD7B8()
{
  return MEMORY[0x1F415D9C0]();
}

uint64_t sub_1BF7DD7C8()
{
  return MEMORY[0x1F415D9C8]();
}

uint64_t sub_1BF7DD7D8()
{
  return MEMORY[0x1F415D9D8]();
}

uint64_t sub_1BF7DD7E8()
{
  return MEMORY[0x1F415D9E8]();
}

uint64_t sub_1BF7DD7F8()
{
  return MEMORY[0x1F415D9F0]();
}

uint64_t sub_1BF7DD808()
{
  return MEMORY[0x1F415D9F8]();
}

uint64_t sub_1BF7DD818()
{
  return MEMORY[0x1F415DA08]();
}

uint64_t sub_1BF7DD828()
{
  return MEMORY[0x1F415DA10]();
}

uint64_t sub_1BF7DD838()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1BF7DD848()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1BF7DD858()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1BF7DD868()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1BF7DD878()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1BF7DD888()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1BF7DD898()
{
  return MEMORY[0x1F415DB20]();
}

uint64_t sub_1BF7DD8A8()
{
  return MEMORY[0x1F415DB28]();
}

uint64_t sub_1BF7DD8B8()
{
  return MEMORY[0x1F415DB40]();
}

uint64_t sub_1BF7DD8C8()
{
  return MEMORY[0x1F415DB48]();
}

uint64_t sub_1BF7DD8D8()
{
  return MEMORY[0x1F415DB50]();
}

uint64_t sub_1BF7DD8E8()
{
  return MEMORY[0x1F415DB58]();
}

uint64_t sub_1BF7DD8F8()
{
  return MEMORY[0x1F415DB60]();
}

uint64_t sub_1BF7DD908()
{
  return MEMORY[0x1F415DB68]();
}

uint64_t sub_1BF7DD918()
{
  return MEMORY[0x1F415DB70]();
}

uint64_t sub_1BF7DD928()
{
  return MEMORY[0x1F415DB78]();
}

uint64_t sub_1BF7DD938()
{
  return MEMORY[0x1F415DB80]();
}

uint64_t sub_1BF7DD948()
{
  return MEMORY[0x1F415DB88]();
}

uint64_t sub_1BF7DD958()
{
  return MEMORY[0x1F415DB90]();
}

uint64_t sub_1BF7DD968()
{
  return MEMORY[0x1F415DBF8]();
}

uint64_t sub_1BF7DD978()
{
  return MEMORY[0x1F415DC68]();
}

uint64_t sub_1BF7DD988()
{
  return MEMORY[0x1F415DCA0]();
}

uint64_t sub_1BF7DD998()
{
  return MEMORY[0x1F415DCB8]();
}

uint64_t sub_1BF7DD9A8()
{
  return MEMORY[0x1F415DCD0]();
}

uint64_t sub_1BF7DD9B8()
{
  return MEMORY[0x1F415DCD8]();
}

uint64_t sub_1BF7DD9C8()
{
  return MEMORY[0x1F415DCE0]();
}

uint64_t sub_1BF7DD9D8()
{
  return MEMORY[0x1F415DCF8]();
}

uint64_t sub_1BF7DD9E8()
{
  return MEMORY[0x1F415DD00]();
}

uint64_t sub_1BF7DD9F8()
{
  return MEMORY[0x1F415DD18]();
}

uint64_t sub_1BF7DDA08()
{
  return MEMORY[0x1F415DD40]();
}

uint64_t sub_1BF7DDA18()
{
  return MEMORY[0x1F415DD48]();
}

uint64_t sub_1BF7DDA28()
{
  return MEMORY[0x1F415DD50]();
}

uint64_t sub_1BF7DDA38()
{
  return MEMORY[0x1F415DD58]();
}

uint64_t sub_1BF7DDA48()
{
  return MEMORY[0x1F415DD60]();
}

uint64_t sub_1BF7DDA58()
{
  return MEMORY[0x1F415DD68]();
}

uint64_t sub_1BF7DDA68()
{
  return MEMORY[0x1F415DD70]();
}

uint64_t sub_1BF7DDA78()
{
  return MEMORY[0x1F415DD78]();
}

uint64_t sub_1BF7DDA88()
{
  return MEMORY[0x1F415DD80]();
}

uint64_t sub_1BF7DDA98()
{
  return MEMORY[0x1F415DD90]();
}

uint64_t sub_1BF7DDAA8()
{
  return MEMORY[0x1F415DD98]();
}

uint64_t sub_1BF7DDAB8()
{
  return MEMORY[0x1F415DDA8]();
}

uint64_t sub_1BF7DDAC8()
{
  return MEMORY[0x1F415DDC0]();
}

uint64_t sub_1BF7DDAD8()
{
  return MEMORY[0x1F415DE28]();
}

uint64_t sub_1BF7DDAE8()
{
  return MEMORY[0x1F415DEB8]();
}

uint64_t sub_1BF7DDAF8()
{
  return MEMORY[0x1F4134320]();
}

uint64_t sub_1BF7DDB08()
{
  return MEMORY[0x1F415DEE0]();
}

uint64_t sub_1BF7DDB18()
{
  return MEMORY[0x1F415DF30]();
}

uint64_t sub_1BF7DDB28()
{
  return MEMORY[0x1F415DF70]();
}

uint64_t sub_1BF7DDB38()
{
  return MEMORY[0x1F415DF80]();
}

uint64_t sub_1BF7DDB48()
{
  return MEMORY[0x1F415DF88]();
}

uint64_t sub_1BF7DDB58()
{
  return MEMORY[0x1F415DF90]();
}

uint64_t sub_1BF7DDB68()
{
  return MEMORY[0x1F415DF98]();
}

uint64_t sub_1BF7DDB78()
{
  return MEMORY[0x1F415DFA0]();
}

uint64_t sub_1BF7DDB88()
{
  return MEMORY[0x1F415DFA8]();
}

uint64_t sub_1BF7DDB98()
{
  return MEMORY[0x1F415DFB0]();
}

uint64_t sub_1BF7DDBA8()
{
  return MEMORY[0x1F415DFC0]();
}

uint64_t sub_1BF7DDBB8()
{
  return MEMORY[0x1F415DFC8]();
}

uint64_t sub_1BF7DDBC8()
{
  return MEMORY[0x1F415DFD0]();
}

uint64_t sub_1BF7DDBD8()
{
  return MEMORY[0x1F415DFD8]();
}

uint64_t sub_1BF7DDBE8()
{
  return MEMORY[0x1F415DFE0]();
}

uint64_t sub_1BF7DDBF8()
{
  return MEMORY[0x1F415DFE8]();
}

uint64_t sub_1BF7DDC08()
{
  return MEMORY[0x1F415DFF0]();
}

uint64_t sub_1BF7DDC18()
{
  return MEMORY[0x1F415DFF8]();
}

uint64_t sub_1BF7DDC28()
{
  return MEMORY[0x1F415E000]();
}

uint64_t sub_1BF7DDC38()
{
  return MEMORY[0x1F415E008]();
}

uint64_t sub_1BF7DDC48()
{
  return MEMORY[0x1F415E010]();
}

uint64_t sub_1BF7DDC58()
{
  return MEMORY[0x1F415E018]();
}

uint64_t sub_1BF7DDC68()
{
  return MEMORY[0x1F415E0F0]();
}

uint64_t sub_1BF7DDC78()
{
  return MEMORY[0x1F415E0F8]();
}

uint64_t sub_1BF7DDC88()
{
  return MEMORY[0x1F415E108]();
}

uint64_t sub_1BF7DDC98()
{
  return MEMORY[0x1F415E118]();
}

uint64_t sub_1BF7DDCA8()
{
  return MEMORY[0x1F415E120]();
}

uint64_t sub_1BF7DDCB8()
{
  return MEMORY[0x1F415E128]();
}

uint64_t sub_1BF7DDCC8()
{
  return MEMORY[0x1F415E138]();
}

uint64_t sub_1BF7DDCE8()
{
  return MEMORY[0x1F415E230]();
}

uint64_t sub_1BF7DDCF8()
{
  return MEMORY[0x1F415E2A8]();
}

uint64_t sub_1BF7DDD08()
{
  return MEMORY[0x1F415E2C8]();
}

uint64_t sub_1BF7DDD18()
{
  return MEMORY[0x1F415E330]();
}

uint64_t sub_1BF7DDD28()
{
  return MEMORY[0x1F415E338]();
}

uint64_t sub_1BF7DDD58()
{
  return MEMORY[0x1F415E3B0]();
}

uint64_t sub_1BF7DDD78()
{
  return MEMORY[0x1F415E3C0]();
}

uint64_t sub_1BF7DDD88()
{
  return MEMORY[0x1F415E3C8]();
}

uint64_t sub_1BF7DDD98()
{
  return MEMORY[0x1F415E3D8]();
}

uint64_t sub_1BF7DDDB8()
{
  return MEMORY[0x1F415E400]();
}

uint64_t sub_1BF7DDDC8()
{
  return MEMORY[0x1F415E460]();
}

uint64_t sub_1BF7DDDD8()
{
  return MEMORY[0x1F4134340]();
}

uint64_t sub_1BF7DDDE8()
{
  return MEMORY[0x1F4134350]();
}

uint64_t sub_1BF7DDDF8()
{
  return MEMORY[0x1F415E478]();
}

uint64_t sub_1BF7DDE08()
{
  return MEMORY[0x1F415E588]();
}

uint64_t sub_1BF7DDE18()
{
  return MEMORY[0x1F415E590]();
}

uint64_t sub_1BF7DDE28()
{
  return MEMORY[0x1F415E5D0]();
}

uint64_t sub_1BF7DDE38()
{
  return MEMORY[0x1F415E5E0]();
}

uint64_t sub_1BF7DDE48()
{
  return MEMORY[0x1F415E5E8]();
}

uint64_t sub_1BF7DDE58()
{
  return MEMORY[0x1F415E5F0]();
}

uint64_t sub_1BF7DDE68()
{
  return MEMORY[0x1F415E5F8]();
}

uint64_t sub_1BF7DDE78()
{
  return MEMORY[0x1F415E600]();
}

uint64_t sub_1BF7DDE88()
{
  return MEMORY[0x1F415E608]();
}

uint64_t sub_1BF7DDE98()
{
  return MEMORY[0x1F415E6A0]();
}

uint64_t sub_1BF7DDEA8()
{
  return MEMORY[0x1F415E6A8]();
}

uint64_t sub_1BF7DDEB8()
{
  return MEMORY[0x1F415E6B0]();
}

uint64_t sub_1BF7DDEC8()
{
  return MEMORY[0x1F415E6F8]();
}

uint64_t sub_1BF7DDED8()
{
  return MEMORY[0x1F415E708]();
}

uint64_t sub_1BF7DDEE8()
{
  return MEMORY[0x1F415E798]();
}

uint64_t sub_1BF7DDEF8()
{
  return MEMORY[0x1F415E7B0]();
}

uint64_t sub_1BF7DDF08()
{
  return MEMORY[0x1F415E7C0]();
}

uint64_t sub_1BF7DDF18()
{
  return MEMORY[0x1F415E840]();
}

uint64_t sub_1BF7DDF28()
{
  return MEMORY[0x1F415E848]();
}

uint64_t sub_1BF7DDF38()
{
  return MEMORY[0x1F415E970]();
}

uint64_t sub_1BF7DDF48()
{
  return MEMORY[0x1F415E990]();
}

uint64_t sub_1BF7DDF58()
{
  return MEMORY[0x1F415E9D8]();
}

uint64_t sub_1BF7DDF68()
{
  return MEMORY[0x1F415E9E0]();
}

uint64_t sub_1BF7DDF78()
{
  return MEMORY[0x1F415E9F0]();
}

uint64_t sub_1BF7DDF88()
{
  return MEMORY[0x1F415E9F8]();
}

uint64_t sub_1BF7DDF98()
{
  return MEMORY[0x1F415EA28]();
}

uint64_t sub_1BF7DDFA8()
{
  return MEMORY[0x1F415EA70]();
}

uint64_t sub_1BF7DDFB8()
{
  return MEMORY[0x1F415EA78]();
}

uint64_t sub_1BF7DDFC8()
{
  return MEMORY[0x1F415EA98]();
}

uint64_t sub_1BF7DDFD8()
{
  return MEMORY[0x1F415EAA0]();
}

uint64_t sub_1BF7DDFE8()
{
  return MEMORY[0x1F415EAA8]();
}

uint64_t sub_1BF7DDFF8()
{
  return MEMORY[0x1F415EB10]();
}

uint64_t sub_1BF7DE008()
{
  return MEMORY[0x1F415EB28]();
}

uint64_t sub_1BF7DE018()
{
  return MEMORY[0x1F415EBA0]();
}

uint64_t sub_1BF7DE038()
{
  return MEMORY[0x1F415EBE8]();
}

uint64_t sub_1BF7DE048()
{
  return MEMORY[0x1F415EC10]();
}

uint64_t sub_1BF7DE058()
{
  return MEMORY[0x1F415EC18]();
}

uint64_t sub_1BF7DE068()
{
  return MEMORY[0x1F415EC20]();
}

uint64_t sub_1BF7DE078()
{
  return MEMORY[0x1F415EC28]();
}

uint64_t sub_1BF7DE088()
{
  return MEMORY[0x1F415EC48]();
}

uint64_t sub_1BF7DE098()
{
  return MEMORY[0x1F415EC50]();
}

uint64_t sub_1BF7DE0A8()
{
  return MEMORY[0x1F415EC60]();
}

uint64_t sub_1BF7DE0B8()
{
  return MEMORY[0x1F415EC70]();
}

uint64_t sub_1BF7DE0C8()
{
  return MEMORY[0x1F415EC78]();
}

uint64_t sub_1BF7DE0D8()
{
  return MEMORY[0x1F415EC80]();
}

uint64_t sub_1BF7DE0E8()
{
  return MEMORY[0x1F415EC90]();
}

uint64_t sub_1BF7DE0F8()
{
  return MEMORY[0x1F415EC98]();
}

uint64_t sub_1BF7DE108()
{
  return MEMORY[0x1F415ECA0]();
}

uint64_t sub_1BF7DE118()
{
  return MEMORY[0x1F415ECC8]();
}

uint64_t sub_1BF7DE128()
{
  return MEMORY[0x1F415ED08]();
}

uint64_t sub_1BF7DE138()
{
  return MEMORY[0x1F415EDF0]();
}

uint64_t sub_1BF7DE148()
{
  return MEMORY[0x1F415EDF8]();
}

uint64_t sub_1BF7DE158()
{
  return MEMORY[0x1F415EE08]();
}

uint64_t sub_1BF7DE168()
{
  return MEMORY[0x1F415EE18]();
}

uint64_t sub_1BF7DE188()
{
  return MEMORY[0x1F415EF20]();
}

uint64_t sub_1BF7DE198()
{
  return MEMORY[0x1F415EF88]();
}

uint64_t sub_1BF7DE1A8()
{
  return MEMORY[0x1F415EF90]();
}

uint64_t sub_1BF7DE1C8()
{
  return MEMORY[0x1F40DFA68]();
}

uint64_t sub_1BF7DE1D8()
{
  return MEMORY[0x1F4138F30]();
}

uint64_t sub_1BF7DE1E8()
{
  return MEMORY[0x1F4138F48]();
}

uint64_t sub_1BF7DE1F8()
{
  return MEMORY[0x1F4138F50]();
}

uint64_t sub_1BF7DE208()
{
  return MEMORY[0x1F4138F58]();
}

uint64_t sub_1BF7DE218()
{
  return MEMORY[0x1F4138F70]();
}

uint64_t sub_1BF7DE228()
{
  return MEMORY[0x1F4138F98]();
}

uint64_t sub_1BF7DE238()
{
  return MEMORY[0x1F4138FD8]();
}

uint64_t sub_1BF7DE248()
{
  return MEMORY[0x1F4138FE8]();
}

uint64_t sub_1BF7DE258()
{
  return MEMORY[0x1F4139000]();
}

uint64_t sub_1BF7DE268()
{
  return MEMORY[0x1F4139020]();
}

uint64_t sub_1BF7DE278()
{
  return MEMORY[0x1F4139028]();
}

uint64_t sub_1BF7DE288()
{
  return MEMORY[0x1F4139060]();
}

uint64_t sub_1BF7DE298()
{
  return MEMORY[0x1F4139078]();
}

uint64_t sub_1BF7DE2A8()
{
  return MEMORY[0x1F41390A0]();
}

uint64_t sub_1BF7DE2B8()
{
  return MEMORY[0x1F41390A8]();
}

uint64_t sub_1BF7DE2C8()
{
  return MEMORY[0x1F41390B0]();
}

uint64_t sub_1BF7DE2D8()
{
  return MEMORY[0x1F41390B8]();
}

uint64_t sub_1BF7DE2E8()
{
  return MEMORY[0x1F41390C8]();
}

uint64_t sub_1BF7DE2F8()
{
  return MEMORY[0x1F41390D0]();
}

uint64_t sub_1BF7DE308()
{
  return MEMORY[0x1F41390D8]();
}

uint64_t sub_1BF7DE318()
{
  return MEMORY[0x1F41390E0]();
}

uint64_t sub_1BF7DE328()
{
  return MEMORY[0x1F41390E8]();
}

uint64_t sub_1BF7DE338()
{
  return MEMORY[0x1F4139128]();
}

uint64_t sub_1BF7DE348()
{
  return MEMORY[0x1F4139138]();
}

uint64_t sub_1BF7DE358()
{
  return MEMORY[0x1F4139140]();
}

uint64_t sub_1BF7DE368()
{
  return MEMORY[0x1F4139178]();
}

uint64_t sub_1BF7DE378()
{
  return MEMORY[0x1F4139188]();
}

uint64_t sub_1BF7DE388()
{
  return MEMORY[0x1F41391A0]();
}

uint64_t sub_1BF7DE398()
{
  return MEMORY[0x1F41391F0]();
}

uint64_t sub_1BF7DE3A8()
{
  return MEMORY[0x1F4139208]();
}

uint64_t sub_1BF7DE3B8()
{
  return MEMORY[0x1F4139250]();
}

uint64_t sub_1BF7DE3C8()
{
  return MEMORY[0x1F4139258]();
}

uint64_t sub_1BF7DE3D8()
{
  return MEMORY[0x1F4139270]();
}

uint64_t sub_1BF7DE3E8()
{
  return MEMORY[0x1F4139278]();
}

uint64_t sub_1BF7DE3F8()
{
  return MEMORY[0x1F4139280]();
}

uint64_t sub_1BF7DE408()
{
  return MEMORY[0x1F4139288]();
}

uint64_t sub_1BF7DE418()
{
  return MEMORY[0x1F4139290]();
}

uint64_t sub_1BF7DE428()
{
  return MEMORY[0x1F4139298]();
}

uint64_t sub_1BF7DE438()
{
  return MEMORY[0x1F41392B0]();
}

uint64_t sub_1BF7DE448()
{
  return MEMORY[0x1F4139308]();
}

uint64_t sub_1BF7DE458()
{
  return MEMORY[0x1F4139318]();
}

uint64_t sub_1BF7DE468()
{
  return MEMORY[0x1F4139320]();
}

uint64_t sub_1BF7DE478()
{
  return MEMORY[0x1F4139328]();
}

uint64_t sub_1BF7DE488()
{
  return MEMORY[0x1F4139330]();
}

uint64_t sub_1BF7DE498()
{
  return MEMORY[0x1F4139348]();
}

uint64_t sub_1BF7DE4A8()
{
  return MEMORY[0x1F4139350]();
}

uint64_t sub_1BF7DE4B8()
{
  return MEMORY[0x1F4139378]();
}

uint64_t sub_1BF7DE4C8()
{
  return MEMORY[0x1F4139380]();
}

uint64_t sub_1BF7DE4D8()
{
  return MEMORY[0x1F4139388]();
}

uint64_t sub_1BF7DE4E8()
{
  return MEMORY[0x1F41393F0]();
}

uint64_t sub_1BF7DE4F8()
{
  return MEMORY[0x1F4139438]();
}

uint64_t sub_1BF7DE508()
{
  return MEMORY[0x1F4139450]();
}

uint64_t sub_1BF7DE518()
{
  return MEMORY[0x1F41394B8]();
}

uint64_t sub_1BF7DE528()
{
  return MEMORY[0x1F41394C0]();
}

uint64_t sub_1BF7DE538()
{
  return MEMORY[0x1F41394F0]();
}

uint64_t sub_1BF7DE548()
{
  return MEMORY[0x1F41394F8]();
}

uint64_t sub_1BF7DE558()
{
  return MEMORY[0x1F4139508]();
}

uint64_t sub_1BF7DE568()
{
  return MEMORY[0x1F4139510]();
}

uint64_t sub_1BF7DE578()
{
  return MEMORY[0x1F4139520]();
}

uint64_t sub_1BF7DE588()
{
  return MEMORY[0x1F4139538]();
}

uint64_t sub_1BF7DE598()
{
  return MEMORY[0x1F41395A0]();
}

uint64_t sub_1BF7DE5A8()
{
  return MEMORY[0x1F41395A8]();
}

uint64_t sub_1BF7DE5B8()
{
  return MEMORY[0x1F41395B0]();
}

uint64_t sub_1BF7DE5C8()
{
  return MEMORY[0x1F41395D0]();
}

uint64_t sub_1BF7DE5D8()
{
  return MEMORY[0x1F41395D8]();
}

uint64_t sub_1BF7DE5E8()
{
  return MEMORY[0x1F41395E8]();
}

uint64_t sub_1BF7DE5F8()
{
  return MEMORY[0x1F41395F0]();
}

uint64_t sub_1BF7DE608()
{
  return MEMORY[0x1F41395F8]();
}

uint64_t sub_1BF7DE618()
{
  return MEMORY[0x1F4139600]();
}

uint64_t sub_1BF7DE628()
{
  return MEMORY[0x1F4139608]();
}

uint64_t sub_1BF7DE638()
{
  return MEMORY[0x1F4139610]();
}

uint64_t sub_1BF7DE648()
{
  return MEMORY[0x1F4139618]();
}

uint64_t sub_1BF7DE658()
{
  return MEMORY[0x1F4139620]();
}

uint64_t sub_1BF7DE668()
{
  return MEMORY[0x1F4139628]();
}

uint64_t sub_1BF7DE678()
{
  return MEMORY[0x1F4139630]();
}

uint64_t sub_1BF7DE688()
{
  return MEMORY[0x1F4139638]();
}

uint64_t sub_1BF7DE698()
{
  return MEMORY[0x1F4139670]();
}

uint64_t sub_1BF7DE6A8()
{
  return MEMORY[0x1F4139678]();
}

uint64_t sub_1BF7DE6B8()
{
  return MEMORY[0x1F4139698]();
}

uint64_t sub_1BF7DE6C8()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BF7DE6D8()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1BF7DE6E8()
{
  return MEMORY[0x1F415FB60]();
}

uint64_t sub_1BF7DE6F8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BF7DE708()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BF7DE718()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BF7DE728()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1BF7DE738()
{
  return MEMORY[0x1F41343C8]();
}

uint64_t sub_1BF7DE748()
{
  return MEMORY[0x1F415FB80]();
}

uint64_t sub_1BF7DE758()
{
  return MEMORY[0x1F415FB90]();
}

uint64_t sub_1BF7DE768()
{
  return MEMORY[0x1F415FBF8]();
}

uint64_t sub_1BF7DE778()
{
  return MEMORY[0x1F415FC28]();
}

uint64_t sub_1BF7DE788()
{
  return MEMORY[0x1F415FC30]();
}

uint64_t sub_1BF7DE798()
{
  return MEMORY[0x1F415FC58]();
}

uint64_t sub_1BF7DE7A8()
{
  return MEMORY[0x1F415FC60]();
}

uint64_t sub_1BF7DE7B8()
{
  return MEMORY[0x1F415FC68]();
}

uint64_t sub_1BF7DE7C8()
{
  return MEMORY[0x1F415FCA8]();
}

uint64_t sub_1BF7DE7D8()
{
  return MEMORY[0x1F415FCB0]();
}

uint64_t sub_1BF7DE7E8()
{
  return MEMORY[0x1F415FCE0]();
}

uint64_t sub_1BF7DE7F8()
{
  return MEMORY[0x1F415FCE8]();
}

uint64_t sub_1BF7DE808()
{
  return MEMORY[0x1F415FCF0]();
}

uint64_t sub_1BF7DE818()
{
  return MEMORY[0x1F415FCF8]();
}

uint64_t sub_1BF7DE828()
{
  return MEMORY[0x1F415FD08]();
}

uint64_t sub_1BF7DE838()
{
  return MEMORY[0x1F415FD18]();
}

uint64_t sub_1BF7DE848()
{
  return MEMORY[0x1F41343D0]();
}

uint64_t sub_1BF7DE858()
{
  return MEMORY[0x1F41343D8]();
}

uint64_t sub_1BF7DE868()
{
  return MEMORY[0x1F41343E0]();
}

uint64_t sub_1BF7DE878()
{
  return MEMORY[0x1F415FD20]();
}

uint64_t sub_1BF7DE888()
{
  return MEMORY[0x1F415FD48]();
}

uint64_t sub_1BF7DE898()
{
  return MEMORY[0x1F415FD60]();
}

uint64_t sub_1BF7DE8A8()
{
  return MEMORY[0x1F415FD70]();
}

uint64_t sub_1BF7DE8B8()
{
  return MEMORY[0x1F415FD78]();
}

uint64_t sub_1BF7DE8C8()
{
  return MEMORY[0x1F415FD80]();
}

uint64_t sub_1BF7DE8D8()
{
  return MEMORY[0x1F415FDD0]();
}

uint64_t sub_1BF7DE8E8()
{
  return MEMORY[0x1F415FDE0]();
}

uint64_t sub_1BF7DE8F8()
{
  return MEMORY[0x1F415FE48]();
}

uint64_t sub_1BF7DE908()
{
  return MEMORY[0x1F415FE50]();
}

uint64_t sub_1BF7DE918()
{
  return MEMORY[0x1F415FE58]();
}

uint64_t sub_1BF7DE928()
{
  return MEMORY[0x1F415FE70]();
}

uint64_t sub_1BF7DE938()
{
  return MEMORY[0x1F415FE78]();
}

uint64_t sub_1BF7DE948()
{
  return MEMORY[0x1F415FE80]();
}

uint64_t sub_1BF7DE958()
{
  return MEMORY[0x1F415FE98]();
}

uint64_t sub_1BF7DE968()
{
  return MEMORY[0x1F415FEA8]();
}

uint64_t sub_1BF7DE978()
{
  return MEMORY[0x1F415FEC0]();
}

uint64_t sub_1BF7DE988()
{
  return MEMORY[0x1F415FF00]();
}

uint64_t sub_1BF7DE998()
{
  return MEMORY[0x1F415FF08]();
}

uint64_t sub_1BF7DE9A8()
{
  return MEMORY[0x1F415FF10]();
}

uint64_t sub_1BF7DE9B8()
{
  return MEMORY[0x1F415FF20]();
}

uint64_t sub_1BF7DE9C8()
{
  return MEMORY[0x1F415FF70]();
}

uint64_t sub_1BF7DE9D8()
{
  return MEMORY[0x1F415FF78]();
}

uint64_t sub_1BF7DE9E8()
{
  return MEMORY[0x1F415FF80]();
}

uint64_t sub_1BF7DE9F8()
{
  return MEMORY[0x1F415FFC8]();
}

uint64_t sub_1BF7DEA08()
{
  return MEMORY[0x1F415FFD0]();
}

uint64_t sub_1BF7DEA18()
{
  return MEMORY[0x1F415FFE8]();
}

uint64_t sub_1BF7DEA28()
{
  return MEMORY[0x1F4160000]();
}

uint64_t sub_1BF7DEA38()
{
  return MEMORY[0x1F4160008]();
}

uint64_t sub_1BF7DEA48()
{
  return MEMORY[0x1F4160050]();
}

uint64_t sub_1BF7DEA58()
{
  return MEMORY[0x1F4160068]();
}

uint64_t sub_1BF7DEA68()
{
  return MEMORY[0x1F4160070]();
}

uint64_t sub_1BF7DEA78()
{
  return MEMORY[0x1F4160078]();
}

uint64_t sub_1BF7DEA88()
{
  return MEMORY[0x1F41600B8]();
}

uint64_t sub_1BF7DEA98()
{
  return MEMORY[0x1F41600D0]();
}

uint64_t sub_1BF7DEAA8()
{
  return MEMORY[0x1F41600D8]();
}

uint64_t sub_1BF7DEAB8()
{
  return MEMORY[0x1F41600E0]();
}

uint64_t sub_1BF7DEAC8()
{
  return MEMORY[0x1F41600E8]();
}

uint64_t sub_1BF7DEAD8()
{
  return MEMORY[0x1F41600F0]();
}

uint64_t sub_1BF7DEAE8()
{
  return MEMORY[0x1F4160120]();
}

uint64_t sub_1BF7DEAF8()
{
  return MEMORY[0x1F4160128]();
}

uint64_t sub_1BF7DEB08()
{
  return MEMORY[0x1F4160130]();
}

uint64_t sub_1BF7DEB18()
{
  return MEMORY[0x1F4160138]();
}

uint64_t sub_1BF7DEB28()
{
  return MEMORY[0x1F4160140]();
}

uint64_t sub_1BF7DEB38()
{
  return MEMORY[0x1F4160148]();
}

uint64_t sub_1BF7DEB48()
{
  return MEMORY[0x1F4160150]();
}

uint64_t sub_1BF7DEB58()
{
  return MEMORY[0x1F4160158]();
}

uint64_t sub_1BF7DEB68()
{
  return MEMORY[0x1F4160238]();
}

uint64_t sub_1BF7DEB78()
{
  return MEMORY[0x1F4160240]();
}

uint64_t sub_1BF7DEB88()
{
  return MEMORY[0x1F4160280]();
}

uint64_t sub_1BF7DEB98()
{
  return MEMORY[0x1F4160290]();
}

uint64_t sub_1BF7DEBA8()
{
  return MEMORY[0x1F4160300]();
}

uint64_t sub_1BF7DEBB8()
{
  return MEMORY[0x1F4160310]();
}

uint64_t sub_1BF7DEBC8()
{
  return MEMORY[0x1F4160338]();
}

uint64_t sub_1BF7DEBD8()
{
  return MEMORY[0x1F4160340]();
}

uint64_t sub_1BF7DEBE8()
{
  return MEMORY[0x1F4160348]();
}

uint64_t sub_1BF7DEBF8()
{
  return MEMORY[0x1F4134428]();
}

uint64_t sub_1BF7DEC08()
{
  return MEMORY[0x1F4134430]();
}

uint64_t sub_1BF7DEC18()
{
  return MEMORY[0x1F4134448]();
}

uint64_t sub_1BF7DEC28()
{
  return MEMORY[0x1F4160368]();
}

uint64_t sub_1BF7DEC38()
{
  return MEMORY[0x1F41603B8]();
}

uint64_t sub_1BF7DEC48()
{
  return MEMORY[0x1F4160410]();
}

uint64_t sub_1BF7DEC58()
{
  return MEMORY[0x1F4160438]();
}

uint64_t sub_1BF7DEC68()
{
  return MEMORY[0x1F4160440]();
}

uint64_t sub_1BF7DEC78()
{
  return MEMORY[0x1F4160448]();
}

uint64_t sub_1BF7DEC88()
{
  return MEMORY[0x1F4160450]();
}

uint64_t sub_1BF7DEC98()
{
  return MEMORY[0x1F4160458]();
}

uint64_t sub_1BF7DECA8()
{
  return MEMORY[0x1F4160460]();
}

uint64_t sub_1BF7DECB8()
{
  return MEMORY[0x1F4160480]();
}

uint64_t sub_1BF7DECC8()
{
  return MEMORY[0x1F41604A0]();
}

uint64_t sub_1BF7DECE8()
{
  return MEMORY[0x1F41604E8]();
}

uint64_t sub_1BF7DECF8()
{
  return MEMORY[0x1F4160510]();
}

uint64_t sub_1BF7DED08()
{
  return MEMORY[0x1F4160520]();
}

uint64_t sub_1BF7DED18()
{
  return MEMORY[0x1F4130C70]();
}

uint64_t sub_1BF7DED28()
{
  return MEMORY[0x1F4160558]();
}

uint64_t sub_1BF7DED38()
{
  return MEMORY[0x1F4160560]();
}

uint64_t sub_1BF7DED48()
{
  return MEMORY[0x1F4134470]();
}

uint64_t sub_1BF7DED58()
{
  return MEMORY[0x1F4134478]();
}

uint64_t sub_1BF7DED68()
{
  return MEMORY[0x1F4134488]();
}

uint64_t sub_1BF7DED78()
{
  return MEMORY[0x1F41344A0]();
}

uint64_t sub_1BF7DED88()
{
  return MEMORY[0x1F41344A8]();
}

uint64_t sub_1BF7DED98()
{
  return MEMORY[0x1F41344B0]();
}

uint64_t sub_1BF7DEDA8()
{
  return MEMORY[0x1F41344B8]();
}

uint64_t sub_1BF7DEDB8()
{
  return MEMORY[0x1F4160570]();
}

uint64_t sub_1BF7DEDC8()
{
  return MEMORY[0x1F41605A8]();
}

uint64_t sub_1BF7DEDD8()
{
  return MEMORY[0x1F41605B0]();
}

uint64_t _s12NewsArticles21InterstitialAdSessionV10identifierSSvg_0()
{
  return MEMORY[0x1F4160648]();
}

uint64_t sub_1BF7DEDF8()
{
  return MEMORY[0x1F4160650]();
}

uint64_t sub_1BF7DEE08()
{
  return MEMORY[0x1F4160658]();
}

uint64_t sub_1BF7DEE18()
{
  return MEMORY[0x1F4160660]();
}

uint64_t sub_1BF7DEE28()
{
  return MEMORY[0x1F4160670]();
}

uint64_t sub_1BF7DEE38()
{
  return MEMORY[0x1F41606C0]();
}

uint64_t sub_1BF7DEE48()
{
  return MEMORY[0x1F41606D0]();
}

uint64_t sub_1BF7DEE58()
{
  return MEMORY[0x1F41606D8]();
}

uint64_t sub_1BF7DEE68()
{
  return MEMORY[0x1F4160728]();
}

uint64_t sub_1BF7DEE78()
{
  return MEMORY[0x1F4160730]();
}

uint64_t sub_1BF7DEE88()
{
  return MEMORY[0x1F4160738]();
}

uint64_t sub_1BF7DEE98()
{
  return MEMORY[0x1F4160758]();
}

uint64_t sub_1BF7DEEA8()
{
  return MEMORY[0x1F4160760]();
}

uint64_t sub_1BF7DEEB8()
{
  return MEMORY[0x1F41344E0]();
}

uint64_t sub_1BF7DEEC8()
{
  return MEMORY[0x1F41607B0]();
}

uint64_t sub_1BF7DEED8()
{
  return MEMORY[0x1F41607C8]();
}

uint64_t sub_1BF7DEEE8()
{
  return MEMORY[0x1F41607D0]();
}

uint64_t sub_1BF7DEEF8()
{
  return MEMORY[0x1F41607D8]();
}

uint64_t sub_1BF7DEF08()
{
  return MEMORY[0x1F41607E8]();
}

uint64_t sub_1BF7DEF18()
{
  return MEMORY[0x1F41607F0]();
}

uint64_t sub_1BF7DEF28()
{
  return MEMORY[0x1F41607F8]();
}

uint64_t sub_1BF7DEF38()
{
  return MEMORY[0x1F4160808]();
}

uint64_t sub_1BF7DEF48()
{
  return MEMORY[0x1F4160838]();
}

uint64_t sub_1BF7DEF58()
{
  return MEMORY[0x1F4160848]();
}

uint64_t sub_1BF7DEF68()
{
  return MEMORY[0x1F4160850]();
}

uint64_t sub_1BF7DEF78()
{
  return MEMORY[0x1F4160868]();
}

uint64_t sub_1BF7DEF88()
{
  return MEMORY[0x1F4160888]();
}

uint64_t sub_1BF7DEF98()
{
  return MEMORY[0x1F4160890]();
}

uint64_t sub_1BF7DEFA8()
{
  return MEMORY[0x1F4160898]();
}

uint64_t sub_1BF7DEFB8()
{
  return MEMORY[0x1F41608A0]();
}

uint64_t sub_1BF7DEFC8()
{
  return MEMORY[0x1F41608C8]();
}

uint64_t sub_1BF7DEFD8()
{
  return MEMORY[0x1F41608D0]();
}

uint64_t sub_1BF7DEFE8()
{
  return MEMORY[0x1F41608F0]();
}

uint64_t sub_1BF7DEFF8()
{
  return MEMORY[0x1F41608F8]();
}

uint64_t sub_1BF7DF008()
{
  return MEMORY[0x1F4160900]();
}

uint64_t sub_1BF7DF018()
{
  return MEMORY[0x1F4160928]();
}

uint64_t sub_1BF7DF028()
{
  return MEMORY[0x1F4160930]();
}

uint64_t sub_1BF7DF038()
{
  return MEMORY[0x1F4160938]();
}

uint64_t sub_1BF7DF048()
{
  return MEMORY[0x1F4160940]();
}

uint64_t sub_1BF7DF058()
{
  return MEMORY[0x1F4160980]();
}

uint64_t sub_1BF7DF068()
{
  return MEMORY[0x1F4160988]();
}

uint64_t sub_1BF7DF078()
{
  return MEMORY[0x1F4160990]();
}

uint64_t sub_1BF7DF088()
{
  return MEMORY[0x1F41609A8]();
}

uint64_t sub_1BF7DF098()
{
  return MEMORY[0x1F41609D0]();
}

uint64_t sub_1BF7DF0A8()
{
  return MEMORY[0x1F4160A10]();
}

uint64_t sub_1BF7DF0B8()
{
  return MEMORY[0x1F4160A18]();
}

uint64_t sub_1BF7DF0C8()
{
  return MEMORY[0x1F4160A20]();
}

uint64_t sub_1BF7DF0D8()
{
  return MEMORY[0x1F4160A30]();
}

uint64_t sub_1BF7DF0E8()
{
  return MEMORY[0x1F4160A38]();
}

uint64_t sub_1BF7DF0F8()
{
  return MEMORY[0x1F4160A40]();
}

uint64_t sub_1BF7DF108()
{
  return MEMORY[0x1F4160A50]();
}

uint64_t sub_1BF7DF118()
{
  return MEMORY[0x1F4160A60]();
}

uint64_t sub_1BF7DF128()
{
  return MEMORY[0x1F4160A70]();
}

uint64_t sub_1BF7DF138()
{
  return MEMORY[0x1F4160A90]();
}

uint64_t sub_1BF7DF148()
{
  return MEMORY[0x1F4160A98]();
}

uint64_t sub_1BF7DF158()
{
  return MEMORY[0x1F4160AC0]();
}

uint64_t sub_1BF7DF168()
{
  return MEMORY[0x1F4160AE8]();
}

uint64_t sub_1BF7DF178()
{
  return MEMORY[0x1F4160AF8]();
}

uint64_t sub_1BF7DF188()
{
  return MEMORY[0x1F4160B00]();
}

uint64_t sub_1BF7DF198()
{
  return MEMORY[0x1F4160B08]();
}

uint64_t sub_1BF7DF1A8()
{
  return MEMORY[0x1F4160B18]();
}

uint64_t sub_1BF7DF1B8()
{
  return MEMORY[0x1F4160B20]();
}

uint64_t sub_1BF7DF1C8()
{
  return MEMORY[0x1F4160B28]();
}

uint64_t sub_1BF7DF1D8()
{
  return MEMORY[0x1F4160B38]();
}

uint64_t sub_1BF7DF1E8()
{
  return MEMORY[0x1F4160B40]();
}

uint64_t sub_1BF7DF1F8()
{
  return MEMORY[0x1F4160B48]();
}

uint64_t sub_1BF7DF208()
{
  return MEMORY[0x1F4160B60]();
}

uint64_t sub_1BF7DF218()
{
  return MEMORY[0x1F4160B68]();
}

uint64_t sub_1BF7DF228()
{
  return MEMORY[0x1F4160B80]();
}

uint64_t sub_1BF7DF238()
{
  return MEMORY[0x1F4160B88]();
}

uint64_t sub_1BF7DF248()
{
  return MEMORY[0x1F4160BA0]();
}

uint64_t sub_1BF7DF258()
{
  return MEMORY[0x1F4160BA8]();
}

uint64_t sub_1BF7DF268()
{
  return MEMORY[0x1F4160BB0]();
}

uint64_t sub_1BF7DF278()
{
  return MEMORY[0x1F4160BD8]();
}

uint64_t sub_1BF7DF288()
{
  return MEMORY[0x1F4160BF0]();
}

uint64_t sub_1BF7DF298()
{
  return MEMORY[0x1F4160C48]();
}

uint64_t sub_1BF7DF2A8()
{
  return MEMORY[0x1F4160C50]();
}

uint64_t sub_1BF7DF2B8()
{
  return MEMORY[0x1F4160C78]();
}

uint64_t sub_1BF7DF2C8()
{
  return MEMORY[0x1F4160C80]();
}

uint64_t sub_1BF7DF2D8()
{
  return MEMORY[0x1F4160C88]();
}

uint64_t sub_1BF7DF2E8()
{
  return MEMORY[0x1F4160C90]();
}

uint64_t sub_1BF7DF2F8()
{
  return MEMORY[0x1F4160CB0]();
}

uint64_t sub_1BF7DF308()
{
  return MEMORY[0x1F4160CB8]();
}

uint64_t sub_1BF7DF318()
{
  return MEMORY[0x1F4160CC8]();
}

uint64_t sub_1BF7DF328()
{
  return MEMORY[0x1F4160CD0]();
}

uint64_t sub_1BF7DF338()
{
  return MEMORY[0x1F4160CE0]();
}

uint64_t sub_1BF7DF348()
{
  return MEMORY[0x1F4160D00]();
}

uint64_t sub_1BF7DF358()
{
  return MEMORY[0x1F4160D10]();
}

uint64_t sub_1BF7DF368()
{
  return MEMORY[0x1F4160D18]();
}

uint64_t sub_1BF7DF378()
{
  return MEMORY[0x1F4160D40]();
}

uint64_t sub_1BF7DF388()
{
  return MEMORY[0x1F4160D78]();
}

uint64_t sub_1BF7DF398()
{
  return MEMORY[0x1F4160D80]();
}

uint64_t sub_1BF7DF3A8()
{
  return MEMORY[0x1F4160D88]();
}

uint64_t sub_1BF7DF3B8()
{
  return MEMORY[0x1F4160D90]();
}

uint64_t sub_1BF7DF3C8()
{
  return MEMORY[0x1F4160DA0]();
}

uint64_t sub_1BF7DF3D8()
{
  return MEMORY[0x1F4160DF8]();
}

uint64_t sub_1BF7DF3E8()
{
  return MEMORY[0x1F4160E50]();
}

uint64_t sub_1BF7DF3F8()
{
  return MEMORY[0x1F4160E58]();
}

uint64_t sub_1BF7DF408()
{
  return MEMORY[0x1F4160E60]();
}

uint64_t sub_1BF7DF418()
{
  return MEMORY[0x1F4160E68]();
}

uint64_t sub_1BF7DF428()
{
  return MEMORY[0x1F4160E70]();
}

uint64_t sub_1BF7DF438()
{
  return MEMORY[0x1F4160E78]();
}

uint64_t sub_1BF7DF448()
{
  return MEMORY[0x1F4160E80]();
}

uint64_t sub_1BF7DF458()
{
  return MEMORY[0x1F4160E88]();
}

uint64_t sub_1BF7DF468()
{
  return MEMORY[0x1F4160E90]();
}

uint64_t sub_1BF7DF478()
{
  return MEMORY[0x1F4160E98]();
}

uint64_t sub_1BF7DF488()
{
  return MEMORY[0x1F4160EA0]();
}

uint64_t sub_1BF7DF498()
{
  return MEMORY[0x1F4160EA8]();
}

uint64_t sub_1BF7DF4A8()
{
  return MEMORY[0x1F4160EB0]();
}

uint64_t sub_1BF7DF4B8()
{
  return MEMORY[0x1F4160ED8]();
}

uint64_t sub_1BF7DF4C8()
{
  return MEMORY[0x1F4160EE0]();
}

uint64_t sub_1BF7DF4D8()
{
  return MEMORY[0x1F4160EE8]();
}

uint64_t sub_1BF7DF4E8()
{
  return MEMORY[0x1F4160EF8]();
}

uint64_t sub_1BF7DF4F8()
{
  return MEMORY[0x1F4160F00]();
}

uint64_t sub_1BF7DF508()
{
  return MEMORY[0x1F4160F08]();
}

uint64_t sub_1BF7DF518()
{
  return MEMORY[0x1F4160F20]();
}

uint64_t sub_1BF7DF528()
{
  return MEMORY[0x1F4160F28]();
}

uint64_t sub_1BF7DF538()
{
  return MEMORY[0x1F4160F30]();
}

uint64_t sub_1BF7DF548()
{
  return MEMORY[0x1F4160F38]();
}

uint64_t sub_1BF7DF558()
{
  return MEMORY[0x1F4160F40]();
}

uint64_t sub_1BF7DF568()
{
  return MEMORY[0x1F4160F48]();
}

uint64_t sub_1BF7DF578()
{
  return MEMORY[0x1F4160F50]();
}

uint64_t sub_1BF7DF588()
{
  return MEMORY[0x1F4160F88]();
}

uint64_t sub_1BF7DF598()
{
  return MEMORY[0x1F4160F90]();
}

uint64_t sub_1BF7DF5A8()
{
  return MEMORY[0x1F4160F98]();
}

uint64_t sub_1BF7DF5B8()
{
  return MEMORY[0x1F4161070]();
}

uint64_t sub_1BF7DF5C8()
{
  return MEMORY[0x1F4161078]();
}

uint64_t sub_1BF7DF5D8()
{
  return MEMORY[0x1F4161080]();
}

uint64_t sub_1BF7DF5E8()
{
  return MEMORY[0x1F4161098]();
}

uint64_t sub_1BF7DF5F8()
{
  return MEMORY[0x1F41610A8]();
}

uint64_t sub_1BF7DF608()
{
  return MEMORY[0x1F41610B0]();
}

uint64_t sub_1BF7DF618()
{
  return MEMORY[0x1F41610B8]();
}

uint64_t sub_1BF7DF628()
{
  return MEMORY[0x1F41610C0]();
}

uint64_t sub_1BF7DF638()
{
  return MEMORY[0x1F41610C8]();
}

uint64_t sub_1BF7DF648()
{
  return MEMORY[0x1F41610D0]();
}

uint64_t sub_1BF7DF658()
{
  return MEMORY[0x1F41610D8]();
}

uint64_t sub_1BF7DF668()
{
  return MEMORY[0x1F41610E0]();
}

uint64_t sub_1BF7DF678()
{
  return MEMORY[0x1F41610E8]();
}

uint64_t sub_1BF7DF688()
{
  return MEMORY[0x1F41610F0]();
}

uint64_t sub_1BF7DF698()
{
  return MEMORY[0x1F41610F8]();
}

uint64_t sub_1BF7DF6A8()
{
  return MEMORY[0x1F4161100]();
}

uint64_t sub_1BF7DF6B8()
{
  return MEMORY[0x1F4161108]();
}

uint64_t sub_1BF7DF6C8()
{
  return MEMORY[0x1F4161118]();
}

uint64_t sub_1BF7DF6D8()
{
  return MEMORY[0x1F4161120]();
}

uint64_t sub_1BF7DF6E8()
{
  return MEMORY[0x1F4161140]();
}

uint64_t sub_1BF7DF6F8()
{
  return MEMORY[0x1F4161178]();
}

uint64_t sub_1BF7DF708()
{
  return MEMORY[0x1F4161190]();
}

uint64_t sub_1BF7DF718()
{
  return MEMORY[0x1F41611D0]();
}

uint64_t sub_1BF7DF728()
{
  return MEMORY[0x1F4161200]();
}

uint64_t sub_1BF7DF738()
{
  return MEMORY[0x1F4161208]();
}

uint64_t sub_1BF7DF748()
{
  return MEMORY[0x1F4161210]();
}

uint64_t sub_1BF7DF758()
{
  return MEMORY[0x1F4161218]();
}

uint64_t sub_1BF7DF768()
{
  return MEMORY[0x1F4161220]();
}

uint64_t sub_1BF7DF788()
{
  return MEMORY[0x1F4161248]();
}

uint64_t sub_1BF7DF798()
{
  return MEMORY[0x1F4161290]();
}

uint64_t sub_1BF7DF7A8()
{
  return MEMORY[0x1F4161298]();
}

uint64_t sub_1BF7DF7B8()
{
  return MEMORY[0x1F41612A0]();
}

uint64_t sub_1BF7DF7C8()
{
  return MEMORY[0x1F41612D8]();
}

uint64_t sub_1BF7DF7D8()
{
  return MEMORY[0x1F41612F8]();
}

uint64_t sub_1BF7DF7E8()
{
  return MEMORY[0x1F4161300]();
}

uint64_t sub_1BF7DF7F8()
{
  return MEMORY[0x1F4161308]();
}

uint64_t sub_1BF7DF808()
{
  return MEMORY[0x1F4161310]();
}

uint64_t sub_1BF7DF818()
{
  return MEMORY[0x1F4161318]();
}

uint64_t sub_1BF7DF828()
{
  return MEMORY[0x1F4161328]();
}

uint64_t sub_1BF7DF838()
{
  return MEMORY[0x1F4161330]();
}

uint64_t sub_1BF7DF848()
{
  return MEMORY[0x1F4161338]();
}

uint64_t sub_1BF7DF858()
{
  return MEMORY[0x1F4161348]();
}

uint64_t sub_1BF7DF868()
{
  return MEMORY[0x1F4161350]();
}

uint64_t sub_1BF7DF878()
{
  return MEMORY[0x1F4161368]();
}

uint64_t sub_1BF7DF888()
{
  return MEMORY[0x1F4161370]();
}

uint64_t sub_1BF7DF8A8()
{
  return MEMORY[0x1F4161390]();
}

uint64_t sub_1BF7DF8B8()
{
  return MEMORY[0x1F41613F0]();
}

uint64_t sub_1BF7DF8C8()
{
  return MEMORY[0x1F4161400]();
}

uint64_t sub_1BF7DF8D8()
{
  return MEMORY[0x1F4161408]();
}

uint64_t sub_1BF7DF8E8()
{
  return MEMORY[0x1F4161418]();
}

uint64_t sub_1BF7DF8F8()
{
  return MEMORY[0x1F4161450]();
}

uint64_t sub_1BF7DF908()
{
  return MEMORY[0x1F4161458]();
}

uint64_t sub_1BF7DF918()
{
  return MEMORY[0x1F4161460]();
}

uint64_t sub_1BF7DF928()
{
  return MEMORY[0x1F41615D8]();
}

uint64_t sub_1BF7DF938()
{
  return MEMORY[0x1F4161620]();
}

uint64_t sub_1BF7DF948()
{
  return MEMORY[0x1F4161630]();
}

uint64_t sub_1BF7DF958()
{
  return MEMORY[0x1F4161638]();
}

uint64_t sub_1BF7DF968()
{
  return MEMORY[0x1F4161640]();
}

uint64_t sub_1BF7DF978()
{
  return MEMORY[0x1F4161648]();
}

uint64_t sub_1BF7DF988()
{
  return MEMORY[0x1F4161650]();
}

uint64_t sub_1BF7DF998()
{
  return MEMORY[0x1F4161658]();
}

uint64_t sub_1BF7DF9A8()
{
  return MEMORY[0x1F4161668]();
}

uint64_t sub_1BF7DF9B8()
{
  return MEMORY[0x1F4161678]();
}

uint64_t sub_1BF7DF9C8()
{
  return MEMORY[0x1F4161688]();
}

uint64_t sub_1BF7DF9D8()
{
  return MEMORY[0x1F41616D8]();
}

uint64_t sub_1BF7DF9E8()
{
  return MEMORY[0x1F41616E0]();
}

uint64_t sub_1BF7DF9F8()
{
  return MEMORY[0x1F41616E8]();
}

uint64_t sub_1BF7DFA08()
{
  return MEMORY[0x1F4161700]();
}

uint64_t sub_1BF7DFA18()
{
  return MEMORY[0x1F4161708]();
}

uint64_t sub_1BF7DFA28()
{
  return MEMORY[0x1F4161710]();
}

uint64_t sub_1BF7DFA38()
{
  return MEMORY[0x1F4161798]();
}

uint64_t sub_1BF7DFA48()
{
  return MEMORY[0x1F41617A8]();
}

uint64_t sub_1BF7DFA58()
{
  return MEMORY[0x1F41617B0]();
}

uint64_t sub_1BF7DFA68()
{
  return MEMORY[0x1F41617B8]();
}

uint64_t sub_1BF7DFA78()
{
  return MEMORY[0x1F41617C0]();
}

uint64_t sub_1BF7DFA88()
{
  return MEMORY[0x1F41617D0]();
}

uint64_t sub_1BF7DFA98()
{
  return MEMORY[0x1F41617D8]();
}

uint64_t sub_1BF7DFAA8()
{
  return MEMORY[0x1F41617E0]();
}

uint64_t sub_1BF7DFAB8()
{
  return MEMORY[0x1F41617F0]();
}

uint64_t sub_1BF7DFAC8()
{
  return MEMORY[0x1F41617F8]();
}

uint64_t sub_1BF7DFAD8()
{
  return MEMORY[0x1F4161800]();
}

uint64_t sub_1BF7DFAE8()
{
  return MEMORY[0x1F4161808]();
}

uint64_t sub_1BF7DFAF8()
{
  return MEMORY[0x1F4161810]();
}

uint64_t sub_1BF7DFB08()
{
  return MEMORY[0x1F4161850]();
}

uint64_t sub_1BF7DFB18()
{
  return MEMORY[0x1F4161858]();
}

uint64_t sub_1BF7DFB28()
{
  return MEMORY[0x1F4161860]();
}

uint64_t sub_1BF7DFB38()
{
  return MEMORY[0x1F4161868]();
}

uint64_t sub_1BF7DFB48()
{
  return MEMORY[0x1F4161870]();
}

uint64_t sub_1BF7DFB58()
{
  return MEMORY[0x1F4161878]();
}

uint64_t sub_1BF7DFB68()
{
  return MEMORY[0x1F4161880]();
}

uint64_t sub_1BF7DFB78()
{
  return MEMORY[0x1F4161950]();
}

uint64_t sub_1BF7DFB88()
{
  return MEMORY[0x1F41619C8]();
}

uint64_t sub_1BF7DFB98()
{
  return MEMORY[0x1F41619D0]();
}

uint64_t sub_1BF7DFBA8()
{
  return MEMORY[0x1F4161A00]();
}

uint64_t sub_1BF7DFBB8()
{
  return MEMORY[0x1F4161A10]();
}

uint64_t sub_1BF7DFBC8()
{
  return MEMORY[0x1F4161A60]();
}

uint64_t sub_1BF7DFBD8()
{
  return MEMORY[0x1F4161A80]();
}

uint64_t sub_1BF7DFBE8()
{
  return MEMORY[0x1F4161A90]();
}

uint64_t sub_1BF7DFBF8()
{
  return MEMORY[0x1F4161AB0]();
}

uint64_t sub_1BF7DFC08()
{
  return MEMORY[0x1F4161AC0]();
}

uint64_t sub_1BF7DFC18()
{
  return MEMORY[0x1F4161AC8]();
}

uint64_t sub_1BF7DFC28()
{
  return MEMORY[0x1F4161AD0]();
}

uint64_t sub_1BF7DFC38()
{
  return MEMORY[0x1F4161AD8]();
}

uint64_t sub_1BF7DFC48()
{
  return MEMORY[0x1F4161AE0]();
}

uint64_t sub_1BF7DFC58()
{
  return MEMORY[0x1F4161B18]();
}

uint64_t sub_1BF7DFC68()
{
  return MEMORY[0x1F4161B20]();
}

uint64_t sub_1BF7DFC78()
{
  return MEMORY[0x1F4161B30]();
}

uint64_t sub_1BF7DFC88()
{
  return MEMORY[0x1F4161BA8]();
}

uint64_t sub_1BF7DFC98()
{
  return MEMORY[0x1F4161BB0]();
}

uint64_t sub_1BF7DFCA8()
{
  return MEMORY[0x1F4161BB8]();
}

uint64_t sub_1BF7DFCB8()
{
  return MEMORY[0x1F4161C10]();
}

uint64_t sub_1BF7DFCC8()
{
  return MEMORY[0x1F4161C48]();
}

uint64_t sub_1BF7DFCD8()
{
  return MEMORY[0x1F4161C50]();
}

uint64_t sub_1BF7DFCE8()
{
  return MEMORY[0x1F4161C58]();
}

uint64_t sub_1BF7DFCF8()
{
  return MEMORY[0x1F4161C60]();
}

uint64_t sub_1BF7DFD08()
{
  return MEMORY[0x1F4161C78]();
}

uint64_t sub_1BF7DFD18()
{
  return MEMORY[0x1F4161C98]();
}

uint64_t sub_1BF7DFD28()
{
  return MEMORY[0x1F4161CA0]();
}

uint64_t sub_1BF7DFD38()
{
  return MEMORY[0x1F4161CA8]();
}

uint64_t sub_1BF7DFD48()
{
  return MEMORY[0x1F4161CD0]();
}

uint64_t sub_1BF7DFD58()
{
  return MEMORY[0x1F4161CE0]();
}

uint64_t sub_1BF7DFD68()
{
  return MEMORY[0x1F4161CE8]();
}

uint64_t sub_1BF7DFD78()
{
  return MEMORY[0x1F4161CF0]();
}

uint64_t sub_1BF7DFD88()
{
  return MEMORY[0x1F4161D18]();
}

uint64_t sub_1BF7DFD98()
{
  return MEMORY[0x1F4161D20]();
}

uint64_t sub_1BF7DFDA8()
{
  return MEMORY[0x1F4161DB8]();
}

uint64_t sub_1BF7DFDB8()
{
  return MEMORY[0x1F4161E18]();
}

uint64_t sub_1BF7DFDC8()
{
  return MEMORY[0x1F4161E28]();
}

uint64_t sub_1BF7DFDD8()
{
  return MEMORY[0x1F4161E30]();
}

uint64_t sub_1BF7DFDE8()
{
  return MEMORY[0x1F4161E40]();
}

uint64_t sub_1BF7DFDF8()
{
  return MEMORY[0x1F4161E48]();
}

uint64_t sub_1BF7DFE08()
{
  return MEMORY[0x1F4161E50]();
}

uint64_t sub_1BF7DFE18()
{
  return MEMORY[0x1F4161E58]();
}

uint64_t sub_1BF7DFE28()
{
  return MEMORY[0x1F4161E60]();
}

uint64_t sub_1BF7DFE38()
{
  return MEMORY[0x1F4161E78]();
}

uint64_t sub_1BF7DFE48()
{
  return MEMORY[0x1F4161E80]();
}

uint64_t sub_1BF7DFE58()
{
  return MEMORY[0x1F4161E88]();
}

uint64_t sub_1BF7DFE68()
{
  return MEMORY[0x1F4161E90]();
}

uint64_t sub_1BF7DFE78()
{
  return MEMORY[0x1F4161F20]();
}

uint64_t sub_1BF7DFE88()
{
  return MEMORY[0x1F4161F40]();
}

uint64_t sub_1BF7DFE98()
{
  return MEMORY[0x1F4161F48]();
}

uint64_t sub_1BF7DFEA8()
{
  return MEMORY[0x1F4161F50]();
}

uint64_t sub_1BF7DFEB8()
{
  return MEMORY[0x1F4161F60]();
}

uint64_t sub_1BF7DFEC8()
{
  return MEMORY[0x1F4161F68]();
}

uint64_t sub_1BF7DFED8()
{
  return MEMORY[0x1F4161F98]();
}

uint64_t sub_1BF7DFEE8()
{
  return MEMORY[0x1F4161FA0]();
}

uint64_t sub_1BF7DFEF8()
{
  return MEMORY[0x1F4161FA8]();
}

uint64_t sub_1BF7DFF08()
{
  return MEMORY[0x1F4161FB0]();
}

uint64_t sub_1BF7DFF18()
{
  return MEMORY[0x1F4162020]();
}

uint64_t sub_1BF7DFF28()
{
  return MEMORY[0x1F4162030]();
}

uint64_t sub_1BF7DFF38()
{
  return MEMORY[0x1F4162048]();
}

uint64_t sub_1BF7DFF48()
{
  return MEMORY[0x1F4162050]();
}

uint64_t sub_1BF7DFF58()
{
  return MEMORY[0x1F4162058]();
}

uint64_t sub_1BF7DFF68()
{
  return MEMORY[0x1F4162060]();
}

uint64_t sub_1BF7DFF78()
{
  return MEMORY[0x1F41620C8]();
}

uint64_t sub_1BF7DFF88()
{
  return MEMORY[0x1F41620D0]();
}

uint64_t sub_1BF7DFF98()
{
  return MEMORY[0x1F4162160]();
}

uint64_t sub_1BF7DFFA8()
{
  return MEMORY[0x1F4162168]();
}

uint64_t sub_1BF7DFFB8()
{
  return MEMORY[0x1F41621B0]();
}

uint64_t sub_1BF7DFFC8()
{
  return MEMORY[0x1F41621D8]();
}

uint64_t sub_1BF7DFFD8()
{
  return MEMORY[0x1F4162228]();
}

uint64_t sub_1BF7DFFE8()
{
  return MEMORY[0x1F4162230]();
}

uint64_t sub_1BF7DFFF8()
{
  return MEMORY[0x1F4162238]();
}

uint64_t sub_1BF7E0008()
{
  return MEMORY[0x1F4162258]();
}

uint64_t sub_1BF7E0018()
{
  return MEMORY[0x1F4162260]();
}

uint64_t sub_1BF7E0028()
{
  return MEMORY[0x1F4162280]();
}

uint64_t sub_1BF7E0038()
{
  return MEMORY[0x1F4162288]();
}

uint64_t sub_1BF7E0048()
{
  return MEMORY[0x1F4162298]();
}

uint64_t sub_1BF7E0058()
{
  return MEMORY[0x1F41622A0]();
}

uint64_t sub_1BF7E0068()
{
  return MEMORY[0x1F41622E0]();
}

uint64_t sub_1BF7E0078()
{
  return MEMORY[0x1F41622E8]();
}

uint64_t sub_1BF7E0088()
{
  return MEMORY[0x1F4162378]();
}

uint64_t sub_1BF7E0098()
{
  return MEMORY[0x1F4162390]();
}

uint64_t sub_1BF7E00A8()
{
  return MEMORY[0x1F4162398]();
}

uint64_t sub_1BF7E00B8()
{
  return MEMORY[0x1F41623A0]();
}

uint64_t sub_1BF7E00C8()
{
  return MEMORY[0x1F41623B8]();
}

uint64_t sub_1BF7E00D8()
{
  return MEMORY[0x1F41623E0]();
}

uint64_t sub_1BF7E00E8()
{
  return MEMORY[0x1F41623E8]();
}

uint64_t sub_1BF7E00F8()
{
  return MEMORY[0x1F41623F0]();
}

uint64_t sub_1BF7E0108()
{
  return MEMORY[0x1F41623F8]();
}

uint64_t sub_1BF7E0118()
{
  return MEMORY[0x1F4162400]();
}

uint64_t sub_1BF7E0128()
{
  return MEMORY[0x1F4162420]();
}

uint64_t sub_1BF7E0138()
{
  return MEMORY[0x1F4162428]();
}

uint64_t sub_1BF7E0148()
{
  return MEMORY[0x1F4162468]();
}

uint64_t sub_1BF7E0158()
{
  return MEMORY[0x1F4162478]();
}

uint64_t sub_1BF7E0168()
{
  return MEMORY[0x1F4162480]();
}

uint64_t sub_1BF7E0178()
{
  return MEMORY[0x1F4162490]();
}

uint64_t sub_1BF7E0188()
{
  return MEMORY[0x1F4162498]();
}

uint64_t sub_1BF7E0198()
{
  return MEMORY[0x1F41624A0]();
}

uint64_t sub_1BF7E01A8()
{
  return MEMORY[0x1F41624B0]();
}

uint64_t sub_1BF7E01B8()
{
  return MEMORY[0x1F41624B8]();
}

uint64_t sub_1BF7E01C8()
{
  return MEMORY[0x1F41624E0]();
}

uint64_t sub_1BF7E01D8()
{
  return MEMORY[0x1F41624E8]();
}

uint64_t sub_1BF7E01E8()
{
  return MEMORY[0x1F41624F0]();
}

uint64_t sub_1BF7E0228()
{
  return MEMORY[0x1F4162510]();
}

uint64_t sub_1BF7E0238()
{
  return MEMORY[0x1F4162518]();
}

uint64_t sub_1BF7E0278()
{
  return MEMORY[0x1F4162538]();
}

uint64_t sub_1BF7E0288()
{
  return MEMORY[0x1F4162540]();
}

uint64_t sub_1BF7E0298()
{
  return MEMORY[0x1F4162590]();
}

uint64_t sub_1BF7E02A8()
{
  return MEMORY[0x1F41625A8]();
}

uint64_t sub_1BF7E02B8()
{
  return MEMORY[0x1F41625B8]();
}

uint64_t sub_1BF7E02C8()
{
  return MEMORY[0x1F41625C0]();
}

uint64_t sub_1BF7E02D8()
{
  return MEMORY[0x1F41625C8]();
}

uint64_t sub_1BF7E02E8()
{
  return MEMORY[0x1F41625D0]();
}

uint64_t sub_1BF7E02F8()
{
  return MEMORY[0x1F41625D8]();
}

uint64_t sub_1BF7E0308()
{
  return MEMORY[0x1F41625E8]();
}

uint64_t sub_1BF7E0318()
{
  return MEMORY[0x1F4162640]();
}

uint64_t sub_1BF7E0328()
{
  return MEMORY[0x1F4162700]();
}

uint64_t sub_1BF7E0338()
{
  return MEMORY[0x1F4162708]();
}

uint64_t sub_1BF7E0348()
{
  return MEMORY[0x1F4162710]();
}

uint64_t sub_1BF7E0358()
{
  return MEMORY[0x1F4162718]();
}

uint64_t sub_1BF7E0368()
{
  return MEMORY[0x1F4162720]();
}

uint64_t sub_1BF7E0378()
{
  return MEMORY[0x1F4162728]();
}

uint64_t sub_1BF7E0388()
{
  return MEMORY[0x1F41627C0]();
}

uint64_t sub_1BF7E0398()
{
  return MEMORY[0x1F41627C8]();
}

uint64_t sub_1BF7E03A8()
{
  return MEMORY[0x1F41627D0]();
}

uint64_t sub_1BF7E03B8()
{
  return MEMORY[0x1F4162818]();
}

uint64_t sub_1BF7E03C8()
{
  return MEMORY[0x1F4162820]();
}

uint64_t sub_1BF7E03D8()
{
  return MEMORY[0x1F4162830]();
}

uint64_t sub_1BF7E03E8()
{
  return MEMORY[0x1F4162838]();
}

uint64_t sub_1BF7E03F8()
{
  return MEMORY[0x1F4162840]();
}

uint64_t sub_1BF7E0408()
{
  return MEMORY[0x1F4162848]();
}

uint64_t sub_1BF7E0418()
{
  return MEMORY[0x1F4162870]();
}

uint64_t sub_1BF7E0428()
{
  return MEMORY[0x1F4162880]();
}

uint64_t sub_1BF7E0438()
{
  return MEMORY[0x1F4162888]();
}

uint64_t sub_1BF7E0448()
{
  return MEMORY[0x1F4162890]();
}

uint64_t sub_1BF7E0458()
{
  return MEMORY[0x1F4162898]();
}

uint64_t sub_1BF7E0468()
{
  return MEMORY[0x1F41628A0]();
}

uint64_t sub_1BF7E0478()
{
  return MEMORY[0x1F41628A8]();
}

uint64_t sub_1BF7E0488()
{
  return MEMORY[0x1F41628D0]();
}

uint64_t sub_1BF7E0498()
{
  return MEMORY[0x1F41628D8]();
}

uint64_t sub_1BF7E04A8()
{
  return MEMORY[0x1F41628F8]();
}

uint64_t sub_1BF7E04B8()
{
  return MEMORY[0x1F4162908]();
}

uint64_t sub_1BF7E04C8()
{
  return MEMORY[0x1F4162950]();
}

uint64_t sub_1BF7E04D8()
{
  return MEMORY[0x1F4162958]();
}

uint64_t sub_1BF7E04E8()
{
  return MEMORY[0x1F4162960]();
}

uint64_t sub_1BF7E0508()
{
  return MEMORY[0x1F4162970]();
}

uint64_t sub_1BF7E0518()
{
  return MEMORY[0x1F41629D0]();
}

uint64_t sub_1BF7E0528()
{
  return MEMORY[0x1F4162A38]();
}

uint64_t sub_1BF7E0538()
{
  return MEMORY[0x1F4162A40]();
}

uint64_t sub_1BF7E0548()
{
  return MEMORY[0x1F4162A68]();
}

uint64_t sub_1BF7E0558()
{
  return MEMORY[0x1F4162A70]();
}

uint64_t sub_1BF7E0568()
{
  return MEMORY[0x1F4162A80]();
}

uint64_t sub_1BF7E0588()
{
  return MEMORY[0x1F4162A90]();
}

uint64_t sub_1BF7E0598()
{
  return MEMORY[0x1F4162A98]();
}

uint64_t sub_1BF7E05B8()
{
  return MEMORY[0x1F4162AA8]();
}

uint64_t sub_1BF7E05C8()
{
  return MEMORY[0x1F4162AB0]();
}

uint64_t sub_1BF7E0628()
{
  return MEMORY[0x1F4162AE0]();
}

uint64_t sub_1BF7E0648()
{
  return MEMORY[0x1F4162AF0]();
}

uint64_t sub_1BF7E0658()
{
  return MEMORY[0x1F4162AF8]();
}

uint64_t sub_1BF7E0668()
{
  return MEMORY[0x1F4162B00]();
}

uint64_t sub_1BF7E0678()
{
  return MEMORY[0x1F4162B08]();
}

uint64_t sub_1BF7E0688()
{
  return MEMORY[0x1F4162B10]();
}

uint64_t sub_1BF7E0698()
{
  return MEMORY[0x1F4162B18]();
}

uint64_t sub_1BF7E06A8()
{
  return MEMORY[0x1F4162B20]();
}

uint64_t sub_1BF7E06D8()
{
  return MEMORY[0x1F4162B38]();
}

uint64_t sub_1BF7E06F8()
{
  return MEMORY[0x1F4162B48]();
}

uint64_t sub_1BF7E0708()
{
  return MEMORY[0x1F4162BF8]();
}

uint64_t sub_1BF7E0718()
{
  return MEMORY[0x1F4162C00]();
}

uint64_t sub_1BF7E0728()
{
  return MEMORY[0x1F4162C10]();
}

uint64_t sub_1BF7E0738()
{
  return MEMORY[0x1F4162C20]();
}

uint64_t sub_1BF7E0748()
{
  return MEMORY[0x1F4162CC8]();
}

uint64_t sub_1BF7E0758()
{
  return MEMORY[0x1F4162D40]();
}

uint64_t sub_1BF7E0768()
{
  return MEMORY[0x1F4162D48]();
}

uint64_t sub_1BF7E0778()
{
  return MEMORY[0x1F4162D50]();
}

uint64_t sub_1BF7E0788()
{
  return MEMORY[0x1F4162D58]();
}

uint64_t sub_1BF7E0798()
{
  return MEMORY[0x1F4162DE0]();
}

uint64_t sub_1BF7E07B8()
{
  return MEMORY[0x1F41344F8]();
}

uint64_t sub_1BF7E07C8()
{
  return MEMORY[0x1F4162E90]();
}

uint64_t sub_1BF7E07D8()
{
  return MEMORY[0x1F4162E98]();
}

uint64_t sub_1BF7E07E8()
{
  return MEMORY[0x1F4162EA8]();
}

uint64_t sub_1BF7E07F8()
{
  return MEMORY[0x1F4162ED0]();
}

uint64_t sub_1BF7E0808()
{
  return MEMORY[0x1F4162F30]();
}

uint64_t sub_1BF7E0818()
{
  return MEMORY[0x1F4162F38]();
}

uint64_t sub_1BF7E0828()
{
  return MEMORY[0x1F4162F40]();
}

uint64_t sub_1BF7E0838()
{
  return MEMORY[0x1F4162F50]();
}

uint64_t sub_1BF7E0848()
{
  return MEMORY[0x1F4162F58]();
}

uint64_t sub_1BF7E0858()
{
  return MEMORY[0x1F4162F60]();
}

uint64_t sub_1BF7E0868()
{
  return MEMORY[0x1F4162FE8]();
}

uint64_t sub_1BF7E0878()
{
  return MEMORY[0x1F4162FF8]();
}

uint64_t sub_1BF7E0888()
{
  return MEMORY[0x1F4163018]();
}

uint64_t sub_1BF7E0898()
{
  return MEMORY[0x1F4163038]();
}

uint64_t sub_1BF7E08A8()
{
  return MEMORY[0x1F4163048]();
}

uint64_t sub_1BF7E08B8()
{
  return MEMORY[0x1F4163050]();
}

uint64_t sub_1BF7E08C8()
{
  return MEMORY[0x1F4163058]();
}

uint64_t sub_1BF7E08D8()
{
  return MEMORY[0x1F4130C78]();
}

uint64_t sub_1BF7E08E8()
{
  return MEMORY[0x1F4134508]();
}

uint64_t sub_1BF7E08F8()
{
  return MEMORY[0x1F4134540]();
}

uint64_t sub_1BF7E0908()
{
  return MEMORY[0x1F4134548]();
}

uint64_t sub_1BF7E0918()
{
  return MEMORY[0x1F4134558]();
}

uint64_t sub_1BF7E0928()
{
  return MEMORY[0x1F4134588]();
}

uint64_t sub_1BF7E0938()
{
  return MEMORY[0x1F4134590]();
}

uint64_t sub_1BF7E0948()
{
  return MEMORY[0x1F41345D0]();
}

uint64_t sub_1BF7E0958()
{
  return MEMORY[0x1F41345D8]();
}

uint64_t sub_1BF7E0968()
{
  return MEMORY[0x1F41345F8]();
}

uint64_t sub_1BF7E0978()
{
  return MEMORY[0x1F4134610]();
}

uint64_t sub_1BF7E0988()
{
  return MEMORY[0x1F4134630]();
}

uint64_t sub_1BF7E0998()
{
  return MEMORY[0x1F4134640]();
}

uint64_t sub_1BF7E09A8()
{
  return MEMORY[0x1F4134650]();
}

uint64_t sub_1BF7E09B8()
{
  return MEMORY[0x1F4134658]();
}

uint64_t sub_1BF7E09C8()
{
  return MEMORY[0x1F4134668]();
}

uint64_t sub_1BF7E09D8()
{
  return MEMORY[0x1F4134670]();
}

uint64_t sub_1BF7E09E8()
{
  return MEMORY[0x1F4134678]();
}

uint64_t sub_1BF7E09F8()
{
  return MEMORY[0x1F4134680]();
}

uint64_t sub_1BF7E0A08()
{
  return MEMORY[0x1F4134688]();
}

uint64_t sub_1BF7E0A18()
{
  return MEMORY[0x1F4134690]();
}

uint64_t sub_1BF7E0A28()
{
  return MEMORY[0x1F41346B8]();
}

uint64_t sub_1BF7E0A38()
{
  return MEMORY[0x1F41346C0]();
}

uint64_t sub_1BF7E0A48()
{
  return MEMORY[0x1F41346F0]();
}

uint64_t sub_1BF7E0A58()
{
  return MEMORY[0x1F41346F8]();
}

uint64_t sub_1BF7E0A68()
{
  return MEMORY[0x1F4134708]();
}

uint64_t sub_1BF7E0A78()
{
  return MEMORY[0x1F4134710]();
}

uint64_t sub_1BF7E0A88()
{
  return MEMORY[0x1F4134718]();
}

uint64_t sub_1BF7E0A98()
{
  return MEMORY[0x1F4134720]();
}

uint64_t sub_1BF7E0AA8()
{
  return MEMORY[0x1F4134728]();
}

uint64_t sub_1BF7E0AB8()
{
  return MEMORY[0x1F4134730]();
}

uint64_t sub_1BF7E0AC8()
{
  return MEMORY[0x1F4134738]();
}

uint64_t sub_1BF7E0AD8()
{
  return MEMORY[0x1F4134748]();
}

uint64_t sub_1BF7E0AE8()
{
  return MEMORY[0x1F4134758]();
}

uint64_t sub_1BF7E0AF8()
{
  return MEMORY[0x1F4163070]();
}

uint64_t sub_1BF7E0B08()
{
  return MEMORY[0x1F4163078]();
}

uint64_t sub_1BF7E0B18()
{
  return MEMORY[0x1F4163080]();
}

uint64_t sub_1BF7E0B28()
{
  return MEMORY[0x1F4163088]();
}

uint64_t sub_1BF7E0B38()
{
  return MEMORY[0x1F41630A8]();
}

uint64_t sub_1BF7E0B48()
{
  return MEMORY[0x1F41630B0]();
}

uint64_t sub_1BF7E0B58()
{
  return MEMORY[0x1F41630B8]();
}

uint64_t sub_1BF7E0B68()
{
  return MEMORY[0x1F41630C0]();
}

uint64_t sub_1BF7E0B78()
{
  return MEMORY[0x1F4134768]();
}

uint64_t sub_1BF7E0B88()
{
  return MEMORY[0x1F41630F8]();
}

uint64_t sub_1BF7E0B98()
{
  return MEMORY[0x1F4163130]();
}

uint64_t sub_1BF7E0BA8()
{
  return MEMORY[0x1F4163160]();
}

uint64_t sub_1BF7E0BB8()
{
  return MEMORY[0x1F4163168]();
}

uint64_t sub_1BF7E0BC8()
{
  return MEMORY[0x1F4163178]();
}

uint64_t sub_1BF7E0BD8()
{
  return MEMORY[0x1F4163180]();
}

uint64_t sub_1BF7E0BE8()
{
  return MEMORY[0x1F4163188]();
}

uint64_t sub_1BF7E0BF8()
{
  return MEMORY[0x1F4163190]();
}

uint64_t sub_1BF7E0C08()
{
  return MEMORY[0x1F4163198]();
}

uint64_t sub_1BF7E0C18()
{
  return MEMORY[0x1F41631A0]();
}

uint64_t sub_1BF7E0C28()
{
  return MEMORY[0x1F41631A8]();
}

uint64_t sub_1BF7E0C38()
{
  return MEMORY[0x1F41631B0]();
}

uint64_t sub_1BF7E0C48()
{
  return MEMORY[0x1F41631B8]();
}

uint64_t sub_1BF7E0C58()
{
  return MEMORY[0x1F41631C0]();
}

uint64_t sub_1BF7E0C68()
{
  return MEMORY[0x1F41631C8]();
}

uint64_t sub_1BF7E0C78()
{
  return MEMORY[0x1F41631D0]();
}

uint64_t sub_1BF7E0C88()
{
  return MEMORY[0x1F41631F8]();
}

uint64_t sub_1BF7E0C98()
{
  return MEMORY[0x1F4163200]();
}

uint64_t sub_1BF7E0CA8()
{
  return MEMORY[0x1F4163208]();
}

uint64_t sub_1BF7E0CB8()
{
  return MEMORY[0x1F4163240]();
}

uint64_t sub_1BF7E0CC8()
{
  return MEMORY[0x1F4134770]();
}

uint64_t sub_1BF7E0CD8()
{
  return MEMORY[0x1F4134780]();
}

uint64_t sub_1BF7E0CE8()
{
  return MEMORY[0x1F4163250]();
}

uint64_t sub_1BF7E0CF8()
{
  return MEMORY[0x1F4163258]();
}

uint64_t sub_1BF7E0D08()
{
  return MEMORY[0x1F4163260]();
}

uint64_t sub_1BF7E0D18()
{
  return MEMORY[0x1F4163290]();
}

uint64_t sub_1BF7E0D28()
{
  return MEMORY[0x1F41632A8]();
}

uint64_t sub_1BF7E0D38()
{
  return MEMORY[0x1F41632B8]();
}

uint64_t sub_1BF7E0D48()
{
  return MEMORY[0x1F41632C0]();
}

uint64_t sub_1BF7E0D58()
{
  return MEMORY[0x1F41632F8]();
}

uint64_t sub_1BF7E0D68()
{
  return MEMORY[0x1F4163320]();
}

uint64_t sub_1BF7E0D78()
{
  return MEMORY[0x1F4163328]();
}

uint64_t sub_1BF7E0D88()
{
  return MEMORY[0x1F4134790]();
}

uint64_t sub_1BF7E0D98()
{
  return MEMORY[0x1F41347B0]();
}

uint64_t sub_1BF7E0DA8()
{
  return MEMORY[0x1F4163418]();
}

uint64_t sub_1BF7E0DB8()
{
  return MEMORY[0x1F4163428]();
}

uint64_t sub_1BF7E0DC8()
{
  return MEMORY[0x1F4165A48]();
}

uint64_t sub_1BF7E0DD8()
{
  return MEMORY[0x1F4165AD0]();
}

uint64_t sub_1BF7E0DE8()
{
  return MEMORY[0x1F4165AD8]();
}

uint64_t sub_1BF7E0DF8()
{
  return MEMORY[0x1F4165CA0]();
}

uint64_t sub_1BF7E0E08()
{
  return MEMORY[0x1F4165D18]();
}

uint64_t sub_1BF7E0E18()
{
  return MEMORY[0x1F4165D30]();
}

uint64_t sub_1BF7E0E28()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1BF7E0E38()
{
  return MEMORY[0x1F4165F78]();
}

uint64_t sub_1BF7E0E48()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1BF7E0E58()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1BF7E0E68()
{
  return MEMORY[0x1F4130C88]();
}

uint64_t sub_1BF7E0E78()
{
  return MEMORY[0x1F4130C90]();
}

uint64_t sub_1BF7E0E88()
{
  return MEMORY[0x1F4130CB0]();
}

uint64_t sub_1BF7E0E98()
{
  return MEMORY[0x1F4130CB8]();
}

uint64_t sub_1BF7E0EA8()
{
  return MEMORY[0x1F4130CF0]();
}

uint64_t sub_1BF7E0EB8()
{
  return MEMORY[0x1F4130CF8]();
}

uint64_t sub_1BF7E0EC8()
{
  return MEMORY[0x1F4130D10]();
}

uint64_t sub_1BF7E0ED8()
{
  return MEMORY[0x1F4130D18]();
}

uint64_t sub_1BF7E0EE8()
{
  return MEMORY[0x1F4130D20]();
}

uint64_t sub_1BF7E0EF8()
{
  return MEMORY[0x1F4130D28]();
}

uint64_t sub_1BF7E0F08()
{
  return MEMORY[0x1F4130D78]();
}

uint64_t sub_1BF7E0F18()
{
  return MEMORY[0x1F4130DC8]();
}

uint64_t sub_1BF7E0F28()
{
  return MEMORY[0x1F4130DD0]();
}

uint64_t sub_1BF7E0F38()
{
  return MEMORY[0x1F4130DD8]();
}

uint64_t sub_1BF7E0F48()
{
  return MEMORY[0x1F4130DE0]();
}

uint64_t sub_1BF7E0F58()
{
  return MEMORY[0x1F4130E20]();
}

uint64_t sub_1BF7E0F68()
{
  return MEMORY[0x1F4130E30]();
}

uint64_t sub_1BF7E0F78()
{
  return MEMORY[0x1F4130E40]();
}

uint64_t sub_1BF7E0F88()
{
  return MEMORY[0x1F4130E48]();
}

uint64_t sub_1BF7E0F98()
{
  return MEMORY[0x1F4130E50]();
}

uint64_t sub_1BF7E0FA8()
{
  return MEMORY[0x1F4130E58]();
}

uint64_t sub_1BF7E0FB8()
{
  return MEMORY[0x1F4130E60]();
}

uint64_t sub_1BF7E0FC8()
{
  return MEMORY[0x1F4130E68]();
}

uint64_t sub_1BF7E0FD8()
{
  return MEMORY[0x1F4130E70]();
}

uint64_t sub_1BF7E0FE8()
{
  return MEMORY[0x1F4130E98]();
}

uint64_t sub_1BF7E0FF8()
{
  return MEMORY[0x1F4130EA0]();
}

uint64_t sub_1BF7E1008()
{
  return MEMORY[0x1F4130EB8]();
}

uint64_t sub_1BF7E1018()
{
  return MEMORY[0x1F4130EC0]();
}

uint64_t sub_1BF7E1028()
{
  return MEMORY[0x1F4130EE8]();
}

uint64_t sub_1BF7E1038()
{
  return MEMORY[0x1F4130EF0]();
}

uint64_t sub_1BF7E1048()
{
  return MEMORY[0x1F4130EF8]();
}

uint64_t sub_1BF7E1058()
{
  return MEMORY[0x1F4130F00]();
}

uint64_t sub_1BF7E1068()
{
  return MEMORY[0x1F4130F08]();
}

uint64_t sub_1BF7E1078()
{
  return MEMORY[0x1F4130F10]();
}

uint64_t sub_1BF7E1088()
{
  return MEMORY[0x1F4130F18]();
}

uint64_t sub_1BF7E1098()
{
  return MEMORY[0x1F4130F20]();
}

uint64_t sub_1BF7E10A8()
{
  return MEMORY[0x1F4130F28]();
}

uint64_t sub_1BF7E10B8()
{
  return MEMORY[0x1F4130F30]();
}

uint64_t sub_1BF7E10C8()
{
  return MEMORY[0x1F4130F50]();
}

uint64_t sub_1BF7E10D8()
{
  return MEMORY[0x1F4130F80]();
}

uint64_t sub_1BF7E10E8()
{
  return MEMORY[0x1F4130FA0]();
}

uint64_t sub_1BF7E10F8()
{
  return MEMORY[0x1F4130FD0]();
}

uint64_t sub_1BF7E1108()
{
  return MEMORY[0x1F4130FD8]();
}

uint64_t sub_1BF7E1118()
{
  return MEMORY[0x1F4130FE0]();
}

uint64_t sub_1BF7E1128()
{
  return MEMORY[0x1F4130FE8]();
}

uint64_t sub_1BF7E1138()
{
  return MEMORY[0x1F4130FF0]();
}

uint64_t sub_1BF7E1148()
{
  return MEMORY[0x1F4130FF8]();
}

uint64_t sub_1BF7E1158()
{
  return MEMORY[0x1F4131000]();
}

uint64_t sub_1BF7E1168()
{
  return MEMORY[0x1F4131008]();
}

uint64_t sub_1BF7E1178()
{
  return MEMORY[0x1F4131010]();
}

uint64_t sub_1BF7E1188()
{
  return MEMORY[0x1F4131028]();
}

uint64_t sub_1BF7E1198()
{
  return MEMORY[0x1F4131038]();
}

uint64_t sub_1BF7E11A8()
{
  return MEMORY[0x1F4131048]();
}

uint64_t sub_1BF7E11B8()
{
  return MEMORY[0x1F4131050]();
}

uint64_t sub_1BF7E11C8()
{
  return MEMORY[0x1F4131058]();
}

uint64_t sub_1BF7E11D8()
{
  return MEMORY[0x1F4131060]();
}

uint64_t sub_1BF7E11E8()
{
  return MEMORY[0x1F4131068]();
}

uint64_t sub_1BF7E11F8()
{
  return MEMORY[0x1F4131070]();
}

uint64_t sub_1BF7E1208()
{
  return MEMORY[0x1F4131078]();
}

uint64_t sub_1BF7E1218()
{
  return MEMORY[0x1F41310A0]();
}

uint64_t sub_1BF7E1228()
{
  return MEMORY[0x1F41310A8]();
}

uint64_t sub_1BF7E1238()
{
  return MEMORY[0x1F4131100]();
}

uint64_t sub_1BF7E1248()
{
  return MEMORY[0x1F4131108]();
}

uint64_t sub_1BF7E1258()
{
  return MEMORY[0x1F4131110]();
}

uint64_t sub_1BF7E1268()
{
  return MEMORY[0x1F4131118]();
}

uint64_t sub_1BF7E1278()
{
  return MEMORY[0x1F4131120]();
}

uint64_t sub_1BF7E1288()
{
  return MEMORY[0x1F4131128]();
}

uint64_t sub_1BF7E1298()
{
  return MEMORY[0x1F4131130]();
}

uint64_t sub_1BF7E12A8()
{
  return MEMORY[0x1F4131168]();
}

uint64_t sub_1BF7E12B8()
{
  return MEMORY[0x1F4131170]();
}

uint64_t sub_1BF7E12C8()
{
  return MEMORY[0x1F4131178]();
}

uint64_t sub_1BF7E12D8()
{
  return MEMORY[0x1F4131180]();
}

uint64_t sub_1BF7E12E8()
{
  return MEMORY[0x1F4131188]();
}

uint64_t sub_1BF7E12F8()
{
  return MEMORY[0x1F4131190]();
}

uint64_t sub_1BF7E1308()
{
  return MEMORY[0x1F41311A0]();
}

uint64_t sub_1BF7E1318()
{
  return MEMORY[0x1F41311B0]();
}

uint64_t sub_1BF7E1328()
{
  return MEMORY[0x1F41311B8]();
}

uint64_t sub_1BF7E1338()
{
  return MEMORY[0x1F41311C0]();
}

uint64_t sub_1BF7E1348()
{
  return MEMORY[0x1F41311C8]();
}

uint64_t sub_1BF7E1358()
{
  return MEMORY[0x1F41311E0]();
}

uint64_t sub_1BF7E1368()
{
  return MEMORY[0x1F41311E8]();
}

uint64_t sub_1BF7E1378()
{
  return MEMORY[0x1F41311F0]();
}

uint64_t sub_1BF7E1388()
{
  return MEMORY[0x1F41311F8]();
}

uint64_t sub_1BF7E1398()
{
  return MEMORY[0x1F4131200]();
}

uint64_t sub_1BF7E13A8()
{
  return MEMORY[0x1F4131208]();
}

uint64_t sub_1BF7E13B8()
{
  return MEMORY[0x1F4131210]();
}

uint64_t sub_1BF7E13C8()
{
  return MEMORY[0x1F4131218]();
}

uint64_t sub_1BF7E13D8()
{
  return MEMORY[0x1F41312C0]();
}

uint64_t sub_1BF7E13E8()
{
  return MEMORY[0x1F41312C8]();
}

uint64_t sub_1BF7E13F8()
{
  return MEMORY[0x1F41312E8]();
}

uint64_t sub_1BF7E1408()
{
  return MEMORY[0x1F41312F0]();
}

uint64_t sub_1BF7E1418()
{
  return MEMORY[0x1F41312F8]();
}

uint64_t sub_1BF7E1428()
{
  return MEMORY[0x1F4131300]();
}

uint64_t sub_1BF7E1438()
{
  return MEMORY[0x1F4131308]();
}

uint64_t sub_1BF7E1448()
{
  return MEMORY[0x1F4131310]();
}

uint64_t sub_1BF7E1458()
{
  return MEMORY[0x1F4131318]();
}

uint64_t sub_1BF7E1468()
{
  return MEMORY[0x1F4131330]();
}

uint64_t sub_1BF7E1478()
{
  return MEMORY[0x1F4131338]();
}

uint64_t sub_1BF7E1488()
{
  return MEMORY[0x1F4131340]();
}

uint64_t sub_1BF7E1498()
{
  return MEMORY[0x1F4131348]();
}

uint64_t sub_1BF7E14A8()
{
  return MEMORY[0x1F4131350]();
}

uint64_t sub_1BF7E14B8()
{
  return MEMORY[0x1F4131358]();
}

uint64_t sub_1BF7E14C8()
{
  return MEMORY[0x1F4131360]();
}

uint64_t sub_1BF7E14D8()
{
  return MEMORY[0x1F4131368]();
}

uint64_t sub_1BF7E14E8()
{
  return MEMORY[0x1F4131370]();
}

uint64_t sub_1BF7E14F8()
{
  return MEMORY[0x1F4131378]();
}

uint64_t sub_1BF7E1508()
{
  return MEMORY[0x1F4131380]();
}

uint64_t sub_1BF7E1518()
{
  return MEMORY[0x1F4131388]();
}

uint64_t sub_1BF7E1528()
{
  return MEMORY[0x1F41313C0]();
}

uint64_t sub_1BF7E1538()
{
  return MEMORY[0x1F41313C8]();
}

uint64_t sub_1BF7E1548()
{
  return MEMORY[0x1F41313D0]();
}

uint64_t sub_1BF7E1558()
{
  return MEMORY[0x1F41313D8]();
}

uint64_t sub_1BF7E1568()
{
  return MEMORY[0x1F41313E0]();
}

uint64_t sub_1BF7E1578()
{
  return MEMORY[0x1F41313E8]();
}

uint64_t sub_1BF7E1588()
{
  return MEMORY[0x1F4131400]();
}

uint64_t sub_1BF7E1598()
{
  return MEMORY[0x1F4131408]();
}

uint64_t sub_1BF7E15A8()
{
  return MEMORY[0x1F4131410]();
}

uint64_t sub_1BF7E15B8()
{
  return MEMORY[0x1F4131418]();
}

uint64_t sub_1BF7E15C8()
{
  return MEMORY[0x1F4131430]();
}

uint64_t sub_1BF7E15D8()
{
  return MEMORY[0x1F4131438]();
}

uint64_t sub_1BF7E15E8()
{
  return MEMORY[0x1F4131440]();
}

uint64_t sub_1BF7E15F8()
{
  return MEMORY[0x1F4131448]();
}

uint64_t sub_1BF7E1608()
{
  return MEMORY[0x1F4131450]();
}

uint64_t sub_1BF7E1618()
{
  return MEMORY[0x1F4131458]();
}

uint64_t sub_1BF7E1628()
{
  return MEMORY[0x1F4131460]();
}

uint64_t sub_1BF7E1638()
{
  return MEMORY[0x1F4131468]();
}

uint64_t sub_1BF7E1648()
{
  return MEMORY[0x1F4131470]();
}

uint64_t sub_1BF7E1658()
{
  return MEMORY[0x1F4131478]();
}

uint64_t sub_1BF7E1668()
{
  return MEMORY[0x1F4131480]();
}

uint64_t sub_1BF7E1678()
{
  return MEMORY[0x1F4131488]();
}

uint64_t sub_1BF7E1688()
{
  return MEMORY[0x1F4131498]();
}

uint64_t sub_1BF7E1698()
{
  return MEMORY[0x1F41314A0]();
}

uint64_t sub_1BF7E16A8()
{
  return MEMORY[0x1F41314A8]();
}

uint64_t sub_1BF7E16B8()
{
  return MEMORY[0x1F41314B0]();
}

uint64_t sub_1BF7E16C8()
{
  return MEMORY[0x1F41314B8]();
}

uint64_t sub_1BF7E16D8()
{
  return MEMORY[0x1F41314C0]();
}

uint64_t sub_1BF7E16E8()
{
  return MEMORY[0x1F41314C8]();
}

uint64_t sub_1BF7E16F8()
{
  return MEMORY[0x1F41314D0]();
}

uint64_t sub_1BF7E1708()
{
  return MEMORY[0x1F41314D8]();
}

uint64_t sub_1BF7E1718()
{
  return MEMORY[0x1F41314E0]();
}

uint64_t sub_1BF7E1728()
{
  return MEMORY[0x1F41314E8]();
}

uint64_t sub_1BF7E1738()
{
  return MEMORY[0x1F41314F8]();
}

uint64_t sub_1BF7E1748()
{
  return MEMORY[0x1F4131500]();
}

uint64_t sub_1BF7E1758()
{
  return MEMORY[0x1F4131508]();
}

uint64_t sub_1BF7E1768()
{
  return MEMORY[0x1F4131510]();
}

uint64_t sub_1BF7E1778()
{
  return MEMORY[0x1F4131518]();
}

uint64_t sub_1BF7E1788()
{
  return MEMORY[0x1F4131530]();
}

uint64_t sub_1BF7E1798()
{
  return MEMORY[0x1F4131538]();
}

uint64_t sub_1BF7E17A8()
{
  return MEMORY[0x1F4131540]();
}

uint64_t sub_1BF7E17B8()
{
  return MEMORY[0x1F4131548]();
}

uint64_t sub_1BF7E17C8()
{
  return MEMORY[0x1F4131550]();
}

uint64_t sub_1BF7E17D8()
{
  return MEMORY[0x1F4131558]();
}

uint64_t sub_1BF7E17E8()
{
  return MEMORY[0x1F4131560]();
}

uint64_t sub_1BF7E17F8()
{
  return MEMORY[0x1F4131568]();
}

uint64_t sub_1BF7E1808()
{
  return MEMORY[0x1F4131570]();
}

uint64_t sub_1BF7E1818()
{
  return MEMORY[0x1F4131578]();
}

uint64_t sub_1BF7E1828()
{
  return MEMORY[0x1F4131580]();
}

uint64_t sub_1BF7E1838()
{
  return MEMORY[0x1F4131588]();
}

uint64_t sub_1BF7E1848()
{
  return MEMORY[0x1F4131590]();
}

uint64_t sub_1BF7E1858()
{
  return MEMORY[0x1F41315A0]();
}

uint64_t sub_1BF7E1868()
{
  return MEMORY[0x1F41315A8]();
}

uint64_t sub_1BF7E1878()
{
  return MEMORY[0x1F41315B0]();
}

uint64_t sub_1BF7E1888()
{
  return MEMORY[0x1F41315B8]();
}

uint64_t sub_1BF7E1898()
{
  return MEMORY[0x1F41315C0]();
}

uint64_t sub_1BF7E18A8()
{
  return MEMORY[0x1F41315C8]();
}

uint64_t sub_1BF7E18B8()
{
  return MEMORY[0x1F41315D8]();
}

uint64_t sub_1BF7E18C8()
{
  return MEMORY[0x1F4131610]();
}

uint64_t sub_1BF7E18D8()
{
  return MEMORY[0x1F4131620]();
}

uint64_t sub_1BF7E18E8()
{
  return MEMORY[0x1F4131630]();
}

uint64_t sub_1BF7E18F8()
{
  return MEMORY[0x1F4131638]();
}

uint64_t sub_1BF7E1908()
{
  return MEMORY[0x1F4131648]();
}

uint64_t sub_1BF7E1918()
{
  return MEMORY[0x1F4131660]();
}

uint64_t sub_1BF7E1928()
{
  return MEMORY[0x1F4131678]();
}

uint64_t sub_1BF7E1938()
{
  return MEMORY[0x1F4131690]();
}

uint64_t sub_1BF7E1948()
{
  return MEMORY[0x1F4131698]();
}

uint64_t sub_1BF7E1958()
{
  return MEMORY[0x1F41316A0]();
}

uint64_t sub_1BF7E1968()
{
  return MEMORY[0x1F41316A8]();
}

uint64_t sub_1BF7E1978()
{
  return MEMORY[0x1F41316B0]();
}

uint64_t sub_1BF7E1988()
{
  return MEMORY[0x1F41316C8]();
}

uint64_t sub_1BF7E1998()
{
  return MEMORY[0x1F41316D8]();
}

uint64_t sub_1BF7E19A8()
{
  return MEMORY[0x1F41316F0]();
}

uint64_t sub_1BF7E19B8()
{
  return MEMORY[0x1F41316F8]();
}

uint64_t sub_1BF7E19C8()
{
  return MEMORY[0x1F4131700]();
}

uint64_t sub_1BF7E19D8()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1BF7E19E8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BF7E19F8()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1BF7E1A08()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BF7E1A18()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1BF7E1A28()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BF7E1A38()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1BF7E1A48()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1BF7E1A58()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1BF7E1A68()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1BF7E1A78()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1BF7E1A88()
{
  return MEMORY[0x1F4134800]();
}

uint64_t sub_1BF7E1A98()
{
  return MEMORY[0x1F4134808]();
}

uint64_t sub_1BF7E1AA8()
{
  return MEMORY[0x1F4134878]();
}

uint64_t sub_1BF7E1AB8()
{
  return MEMORY[0x1F4134880]();
}

uint64_t sub_1BF7E1AC8()
{
  return MEMORY[0x1F4134888]();
}

uint64_t sub_1BF7E1AD8()
{
  return MEMORY[0x1F41348E0]();
}

uint64_t sub_1BF7E1AE8()
{
  return MEMORY[0x1F41348E8]();
}

uint64_t sub_1BF7E1AF8()
{
  return MEMORY[0x1F41348F0]();
}

uint64_t sub_1BF7E1B08()
{
  return MEMORY[0x1F41348F8]();
}

uint64_t sub_1BF7E1B18()
{
  return MEMORY[0x1F4134900]();
}

uint64_t sub_1BF7E1B28()
{
  return MEMORY[0x1F4134938]();
}

uint64_t sub_1BF7E1B38()
{
  return MEMORY[0x1F4134940]();
}

uint64_t sub_1BF7E1B48()
{
  return MEMORY[0x1F4134958]();
}

uint64_t sub_1BF7E1B58()
{
  return MEMORY[0x1F4134968]();
}

uint64_t sub_1BF7E1B68()
{
  return MEMORY[0x1F4134990]();
}

uint64_t sub_1BF7E1B78()
{
  return MEMORY[0x1F41349A0]();
}

uint64_t sub_1BF7E1B88()
{
  return MEMORY[0x1F41349C0]();
}

uint64_t sub_1BF7E1B98()
{
  return MEMORY[0x1F41349D0]();
}

uint64_t sub_1BF7E1BA8()
{
  return MEMORY[0x1F4134A18]();
}

uint64_t sub_1BF7E1BB8()
{
  return MEMORY[0x1F4134A20]();
}

uint64_t _s12NewsArticles10BaseStylerV5style14navigationItem15backgroundColorySo012UINavigationG0C_So7UIColorCtF_0()
{
  return MEMORY[0x1F4134A30]();
}

uint64_t sub_1BF7E1BD8()
{
  return MEMORY[0x1F4134A38]();
}

uint64_t sub_1BF7E1BE8()
{
  return MEMORY[0x1F4134AC0]();
}

uint64_t sub_1BF7E1BF8()
{
  return MEMORY[0x1F4134AD0]();
}

uint64_t sub_1BF7E1C08()
{
  return MEMORY[0x1F4134AD8]();
}

uint64_t sub_1BF7E1C18()
{
  return MEMORY[0x1F4134AE8]();
}

uint64_t sub_1BF7E1C28()
{
  return MEMORY[0x1F4134B70]();
}

uint64_t sub_1BF7E1C38()
{
  return MEMORY[0x1F4134B78]();
}

uint64_t sub_1BF7E1C48()
{
  return MEMORY[0x1F4134B80]();
}

uint64_t sub_1BF7E1C58()
{
  return MEMORY[0x1F4134BA8]();
}

uint64_t sub_1BF7E1C68()
{
  return MEMORY[0x1F4134BB0]();
}

uint64_t sub_1BF7E1C78()
{
  return MEMORY[0x1F4134BD0]();
}

uint64_t sub_1BF7E1C88()
{
  return MEMORY[0x1F4134BE8]();
}

uint64_t sub_1BF7E1C98()
{
  return MEMORY[0x1F4134C18]();
}

uint64_t sub_1BF7E1CA8()
{
  return MEMORY[0x1F4134C80]();
}

uint64_t sub_1BF7E1CB8()
{
  return MEMORY[0x1F4134C90]();
}

uint64_t sub_1BF7E1CC8()
{
  return MEMORY[0x1F4134C98]();
}

uint64_t sub_1BF7E1CD8()
{
  return MEMORY[0x1F4134CD8]();
}

uint64_t sub_1BF7E1CE8()
{
  return MEMORY[0x1F4134CE0]();
}

uint64_t sub_1BF7E1CF8()
{
  return MEMORY[0x1F4134D00]();
}

uint64_t sub_1BF7E1D08()
{
  return MEMORY[0x1F4134D10]();
}

uint64_t sub_1BF7E1D18()
{
  return MEMORY[0x1F4134D40]();
}

uint64_t sub_1BF7E1D28()
{
  return MEMORY[0x1F4134D58]();
}

uint64_t sub_1BF7E1D38()
{
  return MEMORY[0x1F4134D60]();
}

uint64_t sub_1BF7E1D48()
{
  return MEMORY[0x1F4134D80]();
}

uint64_t sub_1BF7E1D58()
{
  return MEMORY[0x1F4134DA8]();
}

uint64_t sub_1BF7E1D68()
{
  return MEMORY[0x1F4134DB0]();
}

uint64_t sub_1BF7E1D78()
{
  return MEMORY[0x1F4134E40]();
}

uint64_t sub_1BF7E1D88()
{
  return MEMORY[0x1F4134E58]();
}

uint64_t sub_1BF7E1D98()
{
  return MEMORY[0x1F4134ED8]();
}

uint64_t sub_1BF7E1DA8()
{
  return MEMORY[0x1F4134EE0]();
}

uint64_t sub_1BF7E1DB8()
{
  return MEMORY[0x1F4134EE8]();
}

uint64_t sub_1BF7E1DC8()
{
  return MEMORY[0x1F4134EF0]();
}

uint64_t sub_1BF7E1DD8()
{
  return MEMORY[0x1F4134F50]();
}

uint64_t sub_1BF7E1DE8()
{
  return MEMORY[0x1F4134F98]();
}

uint64_t sub_1BF7E1DF8()
{
  return MEMORY[0x1F4134FA0]();
}

uint64_t sub_1BF7E1E08()
{
  return MEMORY[0x1F4134FA8]();
}

uint64_t sub_1BF7E1E18()
{
  return MEMORY[0x1F4134FB0]();
}

uint64_t sub_1BF7E1E28()
{
  return MEMORY[0x1F4135080]();
}

uint64_t sub_1BF7E1E38()
{
  return MEMORY[0x1F41350C0]();
}

uint64_t sub_1BF7E1E48()
{
  return MEMORY[0x1F41350C8]();
}

uint64_t _s8NewsFeed0B14ScalingManagerC0A8ArticlesE10canZoomOutSbyF_0()
{
  return MEMORY[0x1F41350D0]();
}

uint64_t _s8NewsFeed0B14ScalingManagerC0A8ArticlesE9canZoomInSbyF_0()
{
  return MEMORY[0x1F41350D8]();
}

uint64_t sub_1BF7E1E78()
{
  return MEMORY[0x1F41350E0]();
}

uint64_t sub_1BF7E1E88()
{
  return MEMORY[0x1F41350E8]();
}

uint64_t sub_1BF7E1E98()
{
  return MEMORY[0x1F41350F0]();
}

uint64_t sub_1BF7E1EA8()
{
  return MEMORY[0x1F41350F8]();
}

uint64_t sub_1BF7E1EB8()
{
  return MEMORY[0x1F4135108]();
}

uint64_t sub_1BF7E1EC8()
{
  return MEMORY[0x1F4135118]();
}

uint64_t sub_1BF7E1ED8()
{
  return MEMORY[0x1F4135120]();
}

uint64_t sub_1BF7E1EE8()
{
  return MEMORY[0x1F4135168]();
}

uint64_t sub_1BF7E1EF8()
{
  return MEMORY[0x1F41351C0]();
}

uint64_t sub_1BF7E1F08()
{
  return MEMORY[0x1F4135218]();
}

uint64_t sub_1BF7E1F28()
{
  return MEMORY[0x1F4135240]();
}

uint64_t sub_1BF7E1F38()
{
  return MEMORY[0x1F4135248]();
}

uint64_t sub_1BF7E1F48()
{
  return MEMORY[0x1F4135260]();
}

uint64_t sub_1BF7E1F58()
{
  return MEMORY[0x1F4135268]();
}

uint64_t sub_1BF7E1F68()
{
  return MEMORY[0x1F4135270]();
}

uint64_t sub_1BF7E1F78()
{
  return MEMORY[0x1F4135278]();
}

uint64_t sub_1BF7E1F88()
{
  return MEMORY[0x1F4135280]();
}

uint64_t sub_1BF7E1F98()
{
  return MEMORY[0x1F4135290]();
}

uint64_t sub_1BF7E1FA8()
{
  return MEMORY[0x1F4135298]();
}

uint64_t sub_1BF7E1FB8()
{
  return MEMORY[0x1F41352B0]();
}

uint64_t sub_1BF7E1FC8()
{
  return MEMORY[0x1F41352B8]();
}

uint64_t sub_1BF7E1FD8()
{
  return MEMORY[0x1F41352D0]();
}

uint64_t sub_1BF7E1FE8()
{
  return MEMORY[0x1F4135300]();
}

uint64_t sub_1BF7E1FF8()
{
  return MEMORY[0x1F4135318]();
}

uint64_t sub_1BF7E2008()
{
  return MEMORY[0x1F4135320]();
}

uint64_t sub_1BF7E2018()
{
  return MEMORY[0x1F4135328]();
}

uint64_t sub_1BF7E2028()
{
  return MEMORY[0x1F4135330]();
}

uint64_t sub_1BF7E2038()
{
  return MEMORY[0x1F4135338]();
}

uint64_t sub_1BF7E2048()
{
  return MEMORY[0x1F4135340]();
}

uint64_t sub_1BF7E2058()
{
  return MEMORY[0x1F4135350]();
}

uint64_t sub_1BF7E2068()
{
  return MEMORY[0x1F4135358]();
}

uint64_t sub_1BF7E2078()
{
  return MEMORY[0x1F41353A8]();
}

uint64_t sub_1BF7E2088()
{
  return MEMORY[0x1F41353B0]();
}

uint64_t sub_1BF7E20A8()
{
  return MEMORY[0x1F41353C0]();
}

uint64_t sub_1BF7E20B8()
{
  return MEMORY[0x1F41353C8]();
}

uint64_t sub_1BF7E20C8()
{
  return MEMORY[0x1F41353D0]();
}

uint64_t sub_1BF7E20D8()
{
  return MEMORY[0x1F41354B0]();
}

uint64_t sub_1BF7E20E8()
{
  return MEMORY[0x1F41354B8]();
}

uint64_t sub_1BF7E20F8()
{
  return MEMORY[0x1F41354C8]();
}

uint64_t sub_1BF7E2108()
{
  return MEMORY[0x1F41354D0]();
}

uint64_t sub_1BF7E2118()
{
  return MEMORY[0x1F41354F8]();
}

uint64_t sub_1BF7E2128()
{
  return MEMORY[0x1F4135550]();
}

uint64_t sub_1BF7E2138()
{
  return MEMORY[0x1F4135590]();
}

uint64_t sub_1BF7E2148()
{
  return MEMORY[0x1F4135598]();
}

uint64_t sub_1BF7E2158()
{
  return MEMORY[0x1F41355A0]();
}

uint64_t sub_1BF7E2168()
{
  return MEMORY[0x1F41355A8]();
}

uint64_t sub_1BF7E2178()
{
  return MEMORY[0x1F41355B0]();
}

uint64_t sub_1BF7E2188()
{
  return MEMORY[0x1F41355C0]();
}

uint64_t sub_1BF7E2198()
{
  return MEMORY[0x1F41355D0]();
}

uint64_t sub_1BF7E21A8()
{
  return MEMORY[0x1F41355E8]();
}

uint64_t sub_1BF7E21B8()
{
  return MEMORY[0x1F41355F0]();
}

uint64_t sub_1BF7E21C8()
{
  return MEMORY[0x1F41355F8]();
}

uint64_t sub_1BF7E21D8()
{
  return MEMORY[0x1F4135658]();
}

uint64_t sub_1BF7E21E8()
{
  return MEMORY[0x1F41356D8]();
}

uint64_t sub_1BF7E21F8()
{
  return MEMORY[0x1F41356E0]();
}

uint64_t sub_1BF7E2208()
{
  return MEMORY[0x1F4135718]();
}

uint64_t sub_1BF7E2218()
{
  return MEMORY[0x1F41357E8]();
}

uint64_t sub_1BF7E2228()
{
  return MEMORY[0x1F41357F0]();
}

uint64_t sub_1BF7E2238()
{
  return MEMORY[0x1F4135830]();
}

uint64_t sub_1BF7E2248()
{
  return MEMORY[0x1F4135838]();
}

uint64_t sub_1BF7E2258()
{
  return MEMORY[0x1F4135858]();
}

uint64_t sub_1BF7E2268()
{
  return MEMORY[0x1F4135898]();
}

uint64_t sub_1BF7E2278()
{
  return MEMORY[0x1F41358A0]();
}

uint64_t sub_1BF7E2288()
{
  return MEMORY[0x1F41358A8]();
}

uint64_t sub_1BF7E2298()
{
  return MEMORY[0x1F41358E0]();
}

uint64_t sub_1BF7E22A8()
{
  return MEMORY[0x1F41358E8]();
}

uint64_t sub_1BF7E22B8()
{
  return MEMORY[0x1F4135900]();
}

uint64_t sub_1BF7E22C8()
{
  return MEMORY[0x1F4135908]();
}

uint64_t sub_1BF7E22D8()
{
  return MEMORY[0x1F4135910]();
}

uint64_t sub_1BF7E22E8()
{
  return MEMORY[0x1F4135918]();
}

uint64_t sub_1BF7E22F8()
{
  return MEMORY[0x1F4135938]();
}

uint64_t sub_1BF7E2308()
{
  return MEMORY[0x1F4135940]();
}

uint64_t sub_1BF7E2318()
{
  return MEMORY[0x1F4135948]();
}

uint64_t sub_1BF7E2328()
{
  return MEMORY[0x1F4135950]();
}

uint64_t sub_1BF7E2338()
{
  return MEMORY[0x1F4135958]();
}

uint64_t sub_1BF7E2348()
{
  return MEMORY[0x1F4135968]();
}

uint64_t sub_1BF7E2358()
{
  return MEMORY[0x1F4135970]();
}

uint64_t sub_1BF7E2368()
{
  return MEMORY[0x1F4135978]();
}

uint64_t sub_1BF7E2378()
{
  return MEMORY[0x1F4135980]();
}

uint64_t sub_1BF7E2388()
{
  return MEMORY[0x1F4135988]();
}

uint64_t sub_1BF7E2398()
{
  return MEMORY[0x1F4135990]();
}

uint64_t sub_1BF7E23A8()
{
  return MEMORY[0x1F4135998]();
}

uint64_t sub_1BF7E23B8()
{
  return MEMORY[0x1F41359A0]();
}

uint64_t sub_1BF7E23C8()
{
  return MEMORY[0x1F41359A8]();
}

uint64_t sub_1BF7E23D8()
{
  return MEMORY[0x1F41359B0]();
}

uint64_t sub_1BF7E23E8()
{
  return MEMORY[0x1F41359B8]();
}

uint64_t sub_1BF7E23F8()
{
  return MEMORY[0x1F41359C0]();
}

uint64_t sub_1BF7E2408()
{
  return MEMORY[0x1F41359C8]();
}

uint64_t sub_1BF7E2418()
{
  return MEMORY[0x1F41359D0]();
}

uint64_t sub_1BF7E2428()
{
  return MEMORY[0x1F41359D8]();
}

uint64_t sub_1BF7E2438()
{
  return MEMORY[0x1F4135A00]();
}

uint64_t sub_1BF7E2448()
{
  return MEMORY[0x1F4135AC8]();
}

uint64_t sub_1BF7E2458()
{
  return MEMORY[0x1F4135AF8]();
}

uint64_t sub_1BF7E2468()
{
  return MEMORY[0x1F4135B08]();
}

uint64_t sub_1BF7E2478()
{
  return MEMORY[0x1F4135BD8]();
}

uint64_t sub_1BF7E2488()
{
  return MEMORY[0x1F4135BE0]();
}

uint64_t sub_1BF7E2498()
{
  return MEMORY[0x1F4135C18]();
}

uint64_t sub_1BF7E24A8()
{
  return MEMORY[0x1F4135C20]();
}

uint64_t sub_1BF7E24B8()
{
  return MEMORY[0x1F4135C28]();
}

uint64_t sub_1BF7E24C8()
{
  return MEMORY[0x1F4135CB0]();
}

uint64_t sub_1BF7E24D8()
{
  return MEMORY[0x1F4135D38]();
}

uint64_t sub_1BF7E24E8()
{
  return MEMORY[0x1F4135D50]();
}

uint64_t sub_1BF7E24F8()
{
  return MEMORY[0x1F4135DA8]();
}

uint64_t sub_1BF7E2508()
{
  return MEMORY[0x1F4135E10]();
}

uint64_t sub_1BF7E2518()
{
  return MEMORY[0x1F4135E20]();
}

uint64_t sub_1BF7E2528()
{
  return MEMORY[0x1F4135E30]();
}

uint64_t sub_1BF7E2538()
{
  return MEMORY[0x1F4135E38]();
}

uint64_t sub_1BF7E2548()
{
  return MEMORY[0x1F4135EB8]();
}

uint64_t sub_1BF7E2558()
{
  return MEMORY[0x1F4135EC0]();
}

uint64_t sub_1BF7E2568()
{
  return MEMORY[0x1F4135EC8]();
}

uint64_t sub_1BF7E2578()
{
  return MEMORY[0x1F4135ED0]();
}

uint64_t sub_1BF7E2588()
{
  return MEMORY[0x1F4135EF8]();
}

uint64_t sub_1BF7E2598()
{
  return MEMORY[0x1F4135F40]();
}

uint64_t sub_1BF7E25A8()
{
  return MEMORY[0x1F4135F50]();
}

uint64_t sub_1BF7E25B8()
{
  return MEMORY[0x1F4135F60]();
}

uint64_t sub_1BF7E25C8()
{
  return MEMORY[0x1F4135F68]();
}

uint64_t sub_1BF7E25D8()
{
  return MEMORY[0x1F4135F78]();
}

uint64_t sub_1BF7E25E8()
{
  return MEMORY[0x1F4135F80]();
}

uint64_t sub_1BF7E25F8()
{
  return MEMORY[0x1F4135FA0]();
}

uint64_t sub_1BF7E2608()
{
  return MEMORY[0x1F4135FC0]();
}

uint64_t sub_1BF7E2618()
{
  return MEMORY[0x1F4135FF0]();
}

uint64_t sub_1BF7E2628()
{
  return MEMORY[0x1F4135FF8]();
}

uint64_t sub_1BF7E2638()
{
  return MEMORY[0x1F4136048]();
}

uint64_t sub_1BF7E2648()
{
  return MEMORY[0x1F41360C0]();
}

uint64_t sub_1BF7E2658()
{
  return MEMORY[0x1F41360C8]();
}

uint64_t sub_1BF7E2668()
{
  return MEMORY[0x1F41360D0]();
}

uint64_t sub_1BF7E2678()
{
  return MEMORY[0x1F41360D8]();
}

uint64_t sub_1BF7E2688()
{
  return MEMORY[0x1F41360E0]();
}

uint64_t sub_1BF7E2698()
{
  return MEMORY[0x1F41360E8]();
}

uint64_t sub_1BF7E26A8()
{
  return MEMORY[0x1F4136100]();
}

uint64_t sub_1BF7E26B8()
{
  return MEMORY[0x1F4136118]();
}

uint64_t sub_1BF7E26C8()
{
  return MEMORY[0x1F4136138]();
}

uint64_t sub_1BF7E26D8()
{
  return MEMORY[0x1F4136258]();
}

uint64_t sub_1BF7E26E8()
{
  return MEMORY[0x1F41362F8]();
}

uint64_t sub_1BF7E26F8()
{
  return MEMORY[0x1F41363A0]();
}

uint64_t sub_1BF7E2708()
{
  return MEMORY[0x1F41363A8]();
}

uint64_t sub_1BF7E2718()
{
  return MEMORY[0x1F41363B0]();
}

uint64_t sub_1BF7E2728()
{
  return MEMORY[0x1F41363C0]();
}

uint64_t sub_1BF7E2738()
{
  return MEMORY[0x1F41363F0]();
}

uint64_t sub_1BF7E2748()
{
  return MEMORY[0x1F41363F8]();
}

uint64_t sub_1BF7E2758()
{
  return MEMORY[0x1F4136410]();
}

uint64_t sub_1BF7E2768()
{
  return MEMORY[0x1F4136418]();
}

uint64_t sub_1BF7E2778()
{
  return MEMORY[0x1F4136428]();
}

uint64_t sub_1BF7E2788()
{
  return MEMORY[0x1F4136430]();
}

uint64_t sub_1BF7E2798()
{
  return MEMORY[0x1F4136440]();
}

uint64_t sub_1BF7E27A8()
{
  return MEMORY[0x1F4136458]();
}

uint64_t sub_1BF7E27C8()
{
  return MEMORY[0x1F4136478]();
}

uint64_t sub_1BF7E27D8()
{
  return MEMORY[0x1F4136480]();
}

uint64_t sub_1BF7E27E8()
{
  return MEMORY[0x1F4136488]();
}

uint64_t sub_1BF7E27F8()
{
  return MEMORY[0x1F4136490]();
}

uint64_t sub_1BF7E2808()
{
  return MEMORY[0x1F41364A0]();
}

uint64_t sub_1BF7E2818()
{
  return MEMORY[0x1F41364C0]();
}

uint64_t sub_1BF7E2828()
{
  return MEMORY[0x1F41364D0]();
}

uint64_t sub_1BF7E2838()
{
  return MEMORY[0x1F4136508]();
}

uint64_t sub_1BF7E2858()
{
  return MEMORY[0x1F4136518]();
}

uint64_t sub_1BF7E2868()
{
  return MEMORY[0x1F4136520]();
}

uint64_t sub_1BF7E2878()
{
  return MEMORY[0x1F4136528]();
}

uint64_t sub_1BF7E2898()
{
  return MEMORY[0x1F4136538]();
}

uint64_t sub_1BF7E28B8()
{
  return MEMORY[0x1F4136548]();
}

uint64_t sub_1BF7E28C8()
{
  return MEMORY[0x1F4136570]();
}

uint64_t sub_1BF7E28D8()
{
  return MEMORY[0x1F4136580]();
}

uint64_t sub_1BF7E28E8()
{
  return MEMORY[0x1F4136588]();
}

uint64_t sub_1BF7E28F8()
{
  return MEMORY[0x1F41365B8]();
}

uint64_t sub_1BF7E2908()
{
  return MEMORY[0x1F41365E8]();
}

uint64_t sub_1BF7E2918()
{
  return MEMORY[0x1F4136618]();
}

uint64_t sub_1BF7E2928()
{
  return MEMORY[0x1F4136620]();
}

uint64_t sub_1BF7E2938()
{
  return MEMORY[0x1F4136660]();
}

uint64_t sub_1BF7E2948()
{
  return MEMORY[0x1F4136698]();
}

uint64_t sub_1BF7E2958()
{
  return MEMORY[0x1F41366A0]();
}

uint64_t sub_1BF7E2968()
{
  return MEMORY[0x1F41366F8]();
}

uint64_t sub_1BF7E2978()
{
  return MEMORY[0x1F4136700]();
}

uint64_t sub_1BF7E2988()
{
  return MEMORY[0x1F4136710]();
}

uint64_t sub_1BF7E2998()
{
  return MEMORY[0x1F4136720]();
}

uint64_t sub_1BF7E29A8()
{
  return MEMORY[0x1F4136728]();
}

uint64_t sub_1BF7E29B8()
{
  return MEMORY[0x1F4136738]();
}

uint64_t sub_1BF7E29C8()
{
  return MEMORY[0x1F4136740]();
}

uint64_t sub_1BF7E29D8()
{
  return MEMORY[0x1F4136748]();
}

uint64_t sub_1BF7E29E8()
{
  return MEMORY[0x1F4136750]();
}

uint64_t sub_1BF7E29F8()
{
  return MEMORY[0x1F41367A8]();
}

uint64_t sub_1BF7E2A08()
{
  return MEMORY[0x1F4136820]();
}

uint64_t sub_1BF7E2A18()
{
  return MEMORY[0x1F4136880]();
}

uint64_t sub_1BF7E2A28()
{
  return MEMORY[0x1F41368C8]();
}

uint64_t sub_1BF7E2A38()
{
  return MEMORY[0x1F41368E0]();
}

uint64_t sub_1BF7E2A48()
{
  return MEMORY[0x1F41368E8]();
}

uint64_t sub_1BF7E2A58()
{
  return MEMORY[0x1F4136900]();
}

uint64_t sub_1BF7E2A68()
{
  return MEMORY[0x1F4136910]();
}

uint64_t sub_1BF7E2A78()
{
  return MEMORY[0x1F4136918]();
}

uint64_t sub_1BF7E2A88()
{
  return MEMORY[0x1F4136920]();
}

uint64_t sub_1BF7E2A98()
{
  return MEMORY[0x1F41369E0]();
}

uint64_t sub_1BF7E2AA8()
{
  return MEMORY[0x1F41369E8]();
}

uint64_t sub_1BF7E2AB8()
{
  return MEMORY[0x1F41369F0]();
}

uint64_t sub_1BF7E2AC8()
{
  return MEMORY[0x1F41369F8]();
}

uint64_t sub_1BF7E2AD8()
{
  return MEMORY[0x1F4136A00]();
}

uint64_t sub_1BF7E2AE8()
{
  return MEMORY[0x1F4136A08]();
}

uint64_t sub_1BF7E2AF8()
{
  return MEMORY[0x1F4136A40]();
}

uint64_t sub_1BF7E2B08()
{
  return MEMORY[0x1F4136A48]();
}

uint64_t sub_1BF7E2B18()
{
  return MEMORY[0x1F4136A80]();
}

uint64_t sub_1BF7E2B28()
{
  return MEMORY[0x1F4136A88]();
}

uint64_t sub_1BF7E2B38()
{
  return MEMORY[0x1F4136A98]();
}

uint64_t sub_1BF7E2B48()
{
  return MEMORY[0x1F4136AA0]();
}

uint64_t sub_1BF7E2B58()
{
  return MEMORY[0x1F4136AB0]();
}

uint64_t sub_1BF7E2B68()
{
  return MEMORY[0x1F4136AB8]();
}

uint64_t sub_1BF7E2B78()
{
  return MEMORY[0x1F4136AC0]();
}

uint64_t sub_1BF7E2B88()
{
  return MEMORY[0x1F4136AC8]();
}

uint64_t sub_1BF7E2B98()
{
  return MEMORY[0x1F4136AD0]();
}

uint64_t sub_1BF7E2BA8()
{
  return MEMORY[0x1F4136AE0]();
}

uint64_t sub_1BF7E2BB8()
{
  return MEMORY[0x1F4136AE8]();
}

uint64_t sub_1BF7E2BC8()
{
  return MEMORY[0x1F4136AF0]();
}

uint64_t sub_1BF7E2BD8()
{
  return MEMORY[0x1F4136AF8]();
}

uint64_t sub_1BF7E2BE8()
{
  return MEMORY[0x1F4136B00]();
}

uint64_t sub_1BF7E2BF8()
{
  return MEMORY[0x1F4136B18]();
}

uint64_t sub_1BF7E2C08()
{
  return MEMORY[0x1F4136B60]();
}

uint64_t sub_1BF7E2C18()
{
  return MEMORY[0x1F4136B68]();
}

uint64_t sub_1BF7E2C28()
{
  return MEMORY[0x1F4136B70]();
}

uint64_t sub_1BF7E2C38()
{
  return MEMORY[0x1F4136B78]();
}

uint64_t sub_1BF7E2C48()
{
  return MEMORY[0x1F4136BD0]();
}

uint64_t sub_1BF7E2C58()
{
  return MEMORY[0x1F4136BE8]();
}

uint64_t sub_1BF7E2C68()
{
  return MEMORY[0x1F4136C68]();
}

uint64_t sub_1BF7E2C78()
{
  return MEMORY[0x1F4136C70]();
}

uint64_t sub_1BF7E2C88()
{
  return MEMORY[0x1F4136C90]();
}

uint64_t sub_1BF7E2C98()
{
  return MEMORY[0x1F4136C98]();
}

uint64_t sub_1BF7E2CA8()
{
  return MEMORY[0x1F4136CD0]();
}

uint64_t sub_1BF7E2CB8()
{
  return MEMORY[0x1F4136CE8]();
}

uint64_t sub_1BF7E2CC8()
{
  return MEMORY[0x1F4136D68]();
}

uint64_t sub_1BF7E2CD8()
{
  return MEMORY[0x1F4136E40]();
}

uint64_t sub_1BF7E2CE8()
{
  return MEMORY[0x1F4136EB8]();
}

uint64_t sub_1BF7E2CF8()
{
  return MEMORY[0x1F4136EC0]();
}

uint64_t sub_1BF7E2D08()
{
  return MEMORY[0x1F4136EC8]();
}

uint64_t sub_1BF7E2D18()
{
  return MEMORY[0x1F4136ED0]();
}

uint64_t sub_1BF7E2D28()
{
  return MEMORY[0x1F4136ED8]();
}

uint64_t sub_1BF7E2D38()
{
  return MEMORY[0x1F4136EE0]();
}

uint64_t sub_1BF7E2D48()
{
  return MEMORY[0x1F4136EE8]();
}

uint64_t sub_1BF7E2D58()
{
  return MEMORY[0x1F4136EF0]();
}

uint64_t sub_1BF7E2D68()
{
  return MEMORY[0x1F4136EF8]();
}

uint64_t sub_1BF7E2D78()
{
  return MEMORY[0x1F4136F08]();
}

uint64_t sub_1BF7E2D88()
{
  return MEMORY[0x1F4136F50]();
}

uint64_t sub_1BF7E2D98()
{
  return MEMORY[0x1F4136F70]();
}

uint64_t sub_1BF7E2DA8()
{
  return MEMORY[0x1F4136F78]();
}

uint64_t sub_1BF7E2DB8()
{
  return MEMORY[0x1F4136F98]();
}

uint64_t sub_1BF7E2DC8()
{
  return MEMORY[0x1F4136FA0]();
}

uint64_t sub_1BF7E2DD8()
{
  return MEMORY[0x1F4136FB8]();
}

uint64_t sub_1BF7E2DE8()
{
  return MEMORY[0x1F4136FC0]();
}

uint64_t sub_1BF7E2DF8()
{
  return MEMORY[0x1F4136FC8]();
}

uint64_t sub_1BF7E2E08()
{
  return MEMORY[0x1F4136FD8]();
}

uint64_t sub_1BF7E2E18()
{
  return MEMORY[0x1F4136FE8]();
}

uint64_t sub_1BF7E2E28()
{
  return MEMORY[0x1F4136FF0]();
}

uint64_t sub_1BF7E2E38()
{
  return MEMORY[0x1F4137070]();
}

uint64_t sub_1BF7E2E48()
{
  return MEMORY[0x1F4137080]();
}

uint64_t sub_1BF7E2E58()
{
  return MEMORY[0x1F4137090]();
}

uint64_t sub_1BF7E2E68()
{
  return MEMORY[0x1F4137098]();
}

uint64_t sub_1BF7E2E78()
{
  return MEMORY[0x1F41370A0]();
}

uint64_t sub_1BF7E2E88()
{
  return MEMORY[0x1F41370A8]();
}

uint64_t sub_1BF7E2E98()
{
  return MEMORY[0x1F41370C8]();
}

uint64_t sub_1BF7E2EA8()
{
  return MEMORY[0x1F41370D8]();
}

uint64_t sub_1BF7E2EB8()
{
  return MEMORY[0x1F41370E8]();
}

uint64_t sub_1BF7E2EC8()
{
  return MEMORY[0x1F41370F0]();
}

uint64_t sub_1BF7E2ED8()
{
  return MEMORY[0x1F41370F8]();
}

uint64_t sub_1BF7E2EE8()
{
  return MEMORY[0x1F4137100]();
}

uint64_t sub_1BF7E2EF8()
{
  return MEMORY[0x1F4137118]();
}

uint64_t sub_1BF7E2F08()
{
  return MEMORY[0x1F4137120]();
}

uint64_t sub_1BF7E2F18()
{
  return MEMORY[0x1F4137178]();
}

uint64_t sub_1BF7E2F28()
{
  return MEMORY[0x1F41371E0]();
}

uint64_t sub_1BF7E2F38()
{
  return MEMORY[0x1F41371E8]();
}

uint64_t sub_1BF7E2F48()
{
  return MEMORY[0x1F41371F0]();
}

uint64_t sub_1BF7E2F58()
{
  return MEMORY[0x1F4137230]();
}

uint64_t sub_1BF7E2F68()
{
  return MEMORY[0x1F4137248]();
}

uint64_t sub_1BF7E2F78()
{
  return MEMORY[0x1F4137288]();
}

uint64_t sub_1BF7E2F88()
{
  return MEMORY[0x1F4137290]();
}

uint64_t sub_1BF7E2F98()
{
  return MEMORY[0x1F4137298]();
}

uint64_t sub_1BF7E2FA8()
{
  return MEMORY[0x1F41372A0]();
}

uint64_t sub_1BF7E2FB8()
{
  return MEMORY[0x1F41372A8]();
}

uint64_t sub_1BF7E2FC8()
{
  return MEMORY[0x1F41372B0]();
}

uint64_t sub_1BF7E2FD8()
{
  return MEMORY[0x1F41372C0]();
}

uint64_t sub_1BF7E2FE8()
{
  return MEMORY[0x1F41372D0]();
}

uint64_t sub_1BF7E2FF8()
{
  return MEMORY[0x1F41372E8]();
}

uint64_t sub_1BF7E3008()
{
  return MEMORY[0x1F41372F0]();
}

uint64_t sub_1BF7E3018()
{
  return MEMORY[0x1F41372F8]();
}

uint64_t sub_1BF7E3028()
{
  return MEMORY[0x1F4137300]();
}

uint64_t sub_1BF7E3038()
{
  return MEMORY[0x1F4137370]();
}

uint64_t sub_1BF7E3048()
{
  return MEMORY[0x1F41373D8]();
}

uint64_t sub_1BF7E3058()
{
  return MEMORY[0x1F41373F8]();
}

uint64_t sub_1BF7E3068()
{
  return MEMORY[0x1F4137460]();
}

uint64_t sub_1BF7E3078()
{
  return MEMORY[0x1F41374A0]();
}

uint64_t sub_1BF7E3098()
{
  return MEMORY[0x1F41374C8]();
}

uint64_t sub_1BF7E30A8()
{
  return MEMORY[0x1F41374D8]();
}

uint64_t sub_1BF7E30B8()
{
  return MEMORY[0x1F41374F0]();
}

uint64_t sub_1BF7E30C8()
{
  return MEMORY[0x1F41374F8]();
}

uint64_t sub_1BF7E30D8()
{
  return MEMORY[0x1F4137538]();
}

uint64_t sub_1BF7E30E8()
{
  return MEMORY[0x1F4137548]();
}

uint64_t sub_1BF7E30F8()
{
  return MEMORY[0x1F4137550]();
}

uint64_t sub_1BF7E3108()
{
  return MEMORY[0x1F4137558]();
}

uint64_t sub_1BF7E3118()
{
  return MEMORY[0x1F41375D0]();
}

uint64_t sub_1BF7E3128()
{
  return MEMORY[0x1F4137610]();
}

uint64_t sub_1BF7E3138()
{
  return MEMORY[0x1F4137618]();
}

uint64_t sub_1BF7E3148()
{
  return MEMORY[0x1F4137660]();
}

uint64_t sub_1BF7E3158()
{
  return MEMORY[0x1F4137668]();
}

uint64_t sub_1BF7E3168()
{
  return MEMORY[0x1F4137670]();
}

uint64_t sub_1BF7E3178()
{
  return MEMORY[0x1F4137678]();
}

uint64_t sub_1BF7E3188()
{
  return MEMORY[0x1F4137680]();
}

uint64_t sub_1BF7E3198()
{
  return MEMORY[0x1F4137688]();
}

uint64_t sub_1BF7E31A8()
{
  return MEMORY[0x1F4137690]();
}

uint64_t sub_1BF7E31B8()
{
  return MEMORY[0x1F4137698]();
}

uint64_t sub_1BF7E31C8()
{
  return MEMORY[0x1F41376A0]();
}

uint64_t sub_1BF7E31D8()
{
  return MEMORY[0x1F41376A8]();
}

uint64_t sub_1BF7E31E8()
{
  return MEMORY[0x1F41376B0]();
}

uint64_t sub_1BF7E31F8()
{
  return MEMORY[0x1F41376B8]();
}

uint64_t sub_1BF7E3208()
{
  return MEMORY[0x1F41376C8]();
}

uint64_t sub_1BF7E3218()
{
  return MEMORY[0x1F4137700]();
}

uint64_t sub_1BF7E3228()
{
  return MEMORY[0x1F4137708]();
}

uint64_t sub_1BF7E3238()
{
  return MEMORY[0x1F4137710]();
}

uint64_t sub_1BF7E3248()
{
  return MEMORY[0x1F4137718]();
}

uint64_t sub_1BF7E3258()
{
  return MEMORY[0x1F41377D8]();
}

uint64_t sub_1BF7E3268()
{
  return MEMORY[0x1F41377E0]();
}

uint64_t sub_1BF7E3278()
{
  return MEMORY[0x1F4137860]();
}

uint64_t sub_1BF7E3288()
{
  return MEMORY[0x1F4137868]();
}

uint64_t sub_1BF7E3298()
{
  return MEMORY[0x1F4137878]();
}

uint64_t sub_1BF7E32A8()
{
  return MEMORY[0x1F4137880]();
}

uint64_t sub_1BF7E32B8()
{
  return MEMORY[0x1F41378F0]();
}

uint64_t sub_1BF7E32C8()
{
  return MEMORY[0x1F4137908]();
}

uint64_t sub_1BF7E32D8()
{
  return MEMORY[0x1F4137910]();
}

uint64_t sub_1BF7E32E8()
{
  return MEMORY[0x1F4137990]();
}

uint64_t sub_1BF7E32F8()
{
  return MEMORY[0x1F41379C0]();
}

uint64_t sub_1BF7E3308()
{
  return MEMORY[0x1F41379E8]();
}

uint64_t sub_1BF7E3318()
{
  return MEMORY[0x1F4137A28]();
}

uint64_t sub_1BF7E3328()
{
  return MEMORY[0x1F4137A38]();
}

uint64_t sub_1BF7E3338()
{
  return MEMORY[0x1F4137A98]();
}

uint64_t sub_1BF7E3348()
{
  return MEMORY[0x1F4137AA8]();
}

uint64_t sub_1BF7E3358()
{
  return MEMORY[0x1F4137B40]();
}

uint64_t sub_1BF7E3368()
{
  return MEMORY[0x1F4137B48]();
}

uint64_t sub_1BF7E3378()
{
  return MEMORY[0x1F4137B50]();
}

uint64_t sub_1BF7E3388()
{
  return MEMORY[0x1F4137BA8]();
}

uint64_t sub_1BF7E3398()
{
  return MEMORY[0x1F4137BB8]();
}

uint64_t sub_1BF7E33A8()
{
  return MEMORY[0x1F4137BC8]();
}

uint64_t sub_1BF7E33B8()
{
  return MEMORY[0x1F4137BD8]();
}

uint64_t sub_1BF7E33C8()
{
  return MEMORY[0x1F4137BE8]();
}

uint64_t sub_1BF7E33D8()
{
  return MEMORY[0x1F4137BF8]();
}

uint64_t sub_1BF7E33E8()
{
  return MEMORY[0x1F4137C00]();
}

uint64_t sub_1BF7E33F8()
{
  return MEMORY[0x1F4137C10]();
}

uint64_t sub_1BF7E3408()
{
  return MEMORY[0x1F4137C18]();
}

uint64_t sub_1BF7E3418()
{
  return MEMORY[0x1F4137C20]();
}

uint64_t sub_1BF7E3428()
{
  return MEMORY[0x1F4137C38]();
}

uint64_t sub_1BF7E3438()
{
  return MEMORY[0x1F4137C80]();
}

uint64_t sub_1BF7E3448()
{
  return MEMORY[0x1F4137C88]();
}

uint64_t sub_1BF7E3458()
{
  return MEMORY[0x1F4137CE0]();
}

uint64_t sub_1BF7E3468()
{
  return MEMORY[0x1F4137CE8]();
}

uint64_t sub_1BF7E3478()
{
  return MEMORY[0x1F4137D00]();
}

uint64_t sub_1BF7E3488()
{
  return MEMORY[0x1F4137D18]();
}

uint64_t sub_1BF7E3498()
{
  return MEMORY[0x1F4137D50]();
}

uint64_t sub_1BF7E34A8()
{
  return MEMORY[0x1F4137D60]();
}

uint64_t sub_1BF7E34B8()
{
  return MEMORY[0x1F4137E58]();
}

uint64_t sub_1BF7E34C8()
{
  return MEMORY[0x1F4137E60]();
}

uint64_t sub_1BF7E34D8()
{
  return MEMORY[0x1F4137E80]();
}

uint64_t sub_1BF7E34E8()
{
  return MEMORY[0x1F4137EA8]();
}

uint64_t sub_1BF7E34F8()
{
  return MEMORY[0x1F4137F90]();
}

uint64_t sub_1BF7E3508()
{
  return MEMORY[0x1F4137F98]();
}

uint64_t sub_1BF7E3518()
{
  return MEMORY[0x1F4137FA0]();
}

uint64_t sub_1BF7E3528()
{
  return MEMORY[0x1F4137FB0]();
}

uint64_t sub_1BF7E3538()
{
  return MEMORY[0x1F4137FB8]();
}

uint64_t sub_1BF7E3548()
{
  return MEMORY[0x1F4138038]();
}

uint64_t sub_1BF7E3558()
{
  return MEMORY[0x1F4138060]();
}

uint64_t sub_1BF7E3568()
{
  return MEMORY[0x1F4138068]();
}

uint64_t sub_1BF7E3578()
{
  return MEMORY[0x1F4138070]();
}

uint64_t sub_1BF7E3588()
{
  return MEMORY[0x1F4138078]();
}

uint64_t sub_1BF7E3598()
{
  return MEMORY[0x1F4138098]();
}

uint64_t sub_1BF7E35A8()
{
  return MEMORY[0x1F41380A8]();
}

uint64_t sub_1BF7E35B8()
{
  return MEMORY[0x1F41380B0]();
}

uint64_t sub_1BF7E35C8()
{
  return MEMORY[0x1F4138160]();
}

uint64_t sub_1BF7E35D8()
{
  return MEMORY[0x1F4138178]();
}

uint64_t sub_1BF7E35E8()
{
  return MEMORY[0x1F41381C0]();
}

uint64_t sub_1BF7E35F8()
{
  return MEMORY[0x1F41381C8]();
}

uint64_t sub_1BF7E3608()
{
  return MEMORY[0x1F4138210]();
}

uint64_t sub_1BF7E3618()
{
  return MEMORY[0x1F4138218]();
}

uint64_t sub_1BF7E3628()
{
  return MEMORY[0x1F4138268]();
}

uint64_t sub_1BF7E3638()
{
  return MEMORY[0x1F4138270]();
}

uint64_t sub_1BF7E3648()
{
  return MEMORY[0x1F4138298]();
}

uint64_t sub_1BF7E3658()
{
  return MEMORY[0x1F41382B8]();
}

uint64_t sub_1BF7E3668()
{
  return MEMORY[0x1F41382C0]();
}

uint64_t sub_1BF7E3678()
{
  return MEMORY[0x1F41382C8]();
}

uint64_t sub_1BF7E3688()
{
  return MEMORY[0x1F41382D0]();
}

uint64_t sub_1BF7E3698()
{
  return MEMORY[0x1F41382D8]();
}

uint64_t sub_1BF7E36A8()
{
  return MEMORY[0x1F41382E0]();
}

uint64_t sub_1BF7E36B8()
{
  return MEMORY[0x1F41382E8]();
}

uint64_t sub_1BF7E36C8()
{
  return MEMORY[0x1F41383C0]();
}

uint64_t sub_1BF7E36D8()
{
  return MEMORY[0x1F41383C8]();
}

uint64_t sub_1BF7E36E8()
{
  return MEMORY[0x1F4138448]();
}

uint64_t sub_1BF7E36F8()
{
  return MEMORY[0x1F4138450]();
}

uint64_t sub_1BF7E3708()
{
  return MEMORY[0x1F4138458]();
}

uint64_t sub_1BF7E3718()
{
  return MEMORY[0x1F4138460]();
}

uint64_t sub_1BF7E3728()
{
  return MEMORY[0x1F4138478]();
}

uint64_t sub_1BF7E3738()
{
  return MEMORY[0x1F4138488]();
}

uint64_t sub_1BF7E3748()
{
  return MEMORY[0x1F41384A0]();
}

uint64_t sub_1BF7E3758()
{
  return MEMORY[0x1F41384B8]();
}

uint64_t sub_1BF7E3768()
{
  return MEMORY[0x1F41384C0]();
}

uint64_t sub_1BF7E3778()
{
  return MEMORY[0x1F4138590]();
}

uint64_t sub_1BF7E3788()
{
  return MEMORY[0x1F41385D0]();
}

uint64_t sub_1BF7E3798()
{
  return MEMORY[0x1F41385D8]();
}

uint64_t sub_1BF7E37A8()
{
  return MEMORY[0x1F41385F8]();
}

uint64_t sub_1BF7E37B8()
{
  return MEMORY[0x1F4138608]();
}

uint64_t sub_1BF7E37C8()
{
  return MEMORY[0x1F4138610]();
}

uint64_t sub_1BF7E37D8()
{
  return MEMORY[0x1F4138620]();
}

uint64_t sub_1BF7E37E8()
{
  return MEMORY[0x1F4138628]();
}

uint64_t sub_1BF7E37F8()
{
  return MEMORY[0x1F4138638]();
}

uint64_t sub_1BF7E3808()
{
  return MEMORY[0x1F4138640]();
}

uint64_t sub_1BF7E3818()
{
  return MEMORY[0x1F4138648]();
}

uint64_t sub_1BF7E3828()
{
  return MEMORY[0x1F4138658]();
}

uint64_t sub_1BF7E3838()
{
  return MEMORY[0x1F4138660]();
}

uint64_t sub_1BF7E3848()
{
  return MEMORY[0x1F4138668]();
}

uint64_t sub_1BF7E3858()
{
  return MEMORY[0x1F4138670]();
}

uint64_t sub_1BF7E3868()
{
  return MEMORY[0x1F4138678]();
}

uint64_t sub_1BF7E3878()
{
  return MEMORY[0x1F41869E0]();
}

uint64_t sub_1BF7E3888()
{
  return MEMORY[0x1F40E5FD8]();
}

uint64_t sub_1BF7E3898()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BF7E38A8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BF7E38B8()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BF7E38C8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1BF7E38D8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1BF7E38E8()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1BF7E38F8()
{
  return MEMORY[0x1F4183710]();
}

uint64_t sub_1BF7E3908()
{
  return MEMORY[0x1F4183718]();
}

uint64_t sub_1BF7E3918()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1BF7E3928()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BF7E3938()
{
  return MEMORY[0x1F40E60A8]();
}

uint64_t sub_1BF7E3948()
{
  return MEMORY[0x1F40E60F0]();
}

uint64_t sub_1BF7E3958()
{
  return MEMORY[0x1F40E6110]();
}

uint64_t sub_1BF7E3968()
{
  return MEMORY[0x1F40E6128]();
}

uint64_t sub_1BF7E3978()
{
  return MEMORY[0x1F40E6130]();
}

uint64_t sub_1BF7E3988()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1BF7E3998()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BF7E39A8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BF7E39B8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BF7E39C8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BF7E39D8()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1BF7E39E8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1BF7E39F8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1BF7E3A08()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1BF7E3A18()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1BF7E3A28()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BF7E3A38()
{
  return MEMORY[0x1F415EFF0]();
}

uint64_t sub_1BF7E3A48()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1BF7E3A58()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1BF7E3A68()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BF7E3A78()
{
  return MEMORY[0x1F4163440]();
}

uint64_t sub_1BF7E3A88()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1BF7E3A98()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BF7E3AA8()
{
  return MEMORY[0x1F4131708]();
}

uint64_t sub_1BF7E3AB8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BF7E3AC8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1BF7E3AD8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1BF7E3AE8()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1BF7E3AF8()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1BF7E3B08()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1BF7E3B18()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1BF7E3B28()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_1BF7E3B38()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1BF7E3B48()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1BF7E3B58()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1BF7E3B68()
{
  return MEMORY[0x1F415F010]();
}

uint64_t sub_1BF7E3B78()
{
  return MEMORY[0x1F415F030]();
}

uint64_t sub_1BF7E3B88()
{
  return MEMORY[0x1F4183BC0]();
}

uint64_t sub_1BF7E3B98()
{
  return MEMORY[0x1F41386D8]();
}

uint64_t sub_1BF7E3BA8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1BF7E3BB8()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1BF7E3BC8()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1BF7E3BD8()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1BF7E3BE8()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1BF7E3BF8()
{
  return MEMORY[0x1F4183C90]();
}

uint64_t sub_1BF7E3C38()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1BF7E3C48()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1BF7E3C58()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1BF7E3C68()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BF7E3C78()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BF7E3C88()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1BF7E3C98()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1BF7E3CA8()
{
  return MEMORY[0x1F415F088]();
}

uint64_t sub_1BF7E3CB8()
{
  return MEMORY[0x1F415F0B0]();
}

uint64_t sub_1BF7E3CC8()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1BF7E3CD8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1BF7E3CE8()
{
  return MEMORY[0x1F41396A0]();
}

uint64_t sub_1BF7E3CF8()
{
  return MEMORY[0x1F41396A8]();
}

uint64_t sub_1BF7E3D08()
{
  return MEMORY[0x1F41396B0]();
}

uint64_t sub_1BF7E3D18()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1BF7E3D28()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1BF7E3D38()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1BF7E3D48()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1BF7E3D58()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1BF7E3D68()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1BF7E3D78()
{
  return MEMORY[0x1F4163460]();
}

uint64_t sub_1BF7E3D88()
{
  return MEMORY[0x1F4163468]();
}

uint64_t sub_1BF7E3D98()
{
  return MEMORY[0x1F4163470]();
}

uint64_t sub_1BF7E3DA8()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1BF7E3DB8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1BF7E3DC8()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1BF7E3DD8()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1BF7E3DE8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1BF7E3DF8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BF7E3E08()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1BF7E3E18()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1BF7E3E28()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1BF7E3E38()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1BF7E3E48()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1BF7E3E58()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1BF7E3E68()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1BF7E3E78()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1BF7E3E88()
{
  return MEMORY[0x1F4138720]();
}

uint64_t sub_1BF7E3E98()
{
  return MEMORY[0x1F4138728]();
}

uint64_t sub_1BF7E3EA8()
{
  return MEMORY[0x1F416AAD0]();
}

uint64_t sub_1BF7E3EB8()
{
  return MEMORY[0x1F415F0F0]();
}

uint64_t sub_1BF7E3EC8()
{
  return MEMORY[0x1F41840C0]();
}

uint64_t sub_1BF7E3ED8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1BF7E3EE8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1BF7E3EF8()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1BF7E3F08()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1BF7E3F18()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1BF7E3F28()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1BF7E3F38()
{
  return MEMORY[0x1F415F108]();
}

uint64_t sub_1BF7E3F48()
{
  return MEMORY[0x1F415F118]();
}

uint64_t sub_1BF7E3F58()
{
  return MEMORY[0x1F415F120]();
}

uint64_t sub_1BF7E3F68()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1BF7E3F78()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1BF7E3F88()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1BF7E3F98()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1BF7E3FA8()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1BF7E3FB8()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1BF7E3FC8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1BF7E3FD8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1BF7E3FE8()
{
  return MEMORY[0x1F4184568]();
}

uint64_t sub_1BF7E3FF8()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1BF7E4008()
{
  return MEMORY[0x1F41634A0]();
}

uint64_t sub_1BF7E4018()
{
  return MEMORY[0x1F41634C0]();
}

uint64_t sub_1BF7E4028()
{
  return MEMORY[0x1F41634C8]();
}

uint64_t sub_1BF7E4038()
{
  return MEMORY[0x1F41634D0]();
}

uint64_t sub_1BF7E4048()
{
  return MEMORY[0x1F41634D8]();
}

uint64_t sub_1BF7E4058()
{
  return MEMORY[0x1F4163500]();
}

uint64_t sub_1BF7E4068()
{
  return MEMORY[0x1F4163508]();
}

uint64_t sub_1BF7E4078()
{
  return MEMORY[0x1F4163520]();
}

uint64_t sub_1BF7E4088()
{
  return MEMORY[0x1F4138778]();
}

uint64_t sub_1BF7E4098()
{
  return MEMORY[0x1F4138780]();
}

uint64_t sub_1BF7E40A8()
{
  return MEMORY[0x1F4138788]();
}

uint64_t sub_1BF7E40B8()
{
  return MEMORY[0x1F4138790]();
}

uint64_t sub_1BF7E40C8()
{
  return MEMORY[0x1F4138798]();
}

uint64_t sub_1BF7E40D8()
{
  return MEMORY[0x1F41387A8]();
}

uint64_t sub_1BF7E40E8()
{
  return MEMORY[0x1F41387C0]();
}

uint64_t sub_1BF7E40F8()
{
  return MEMORY[0x1F4163540]();
}

uint64_t sub_1BF7E4108()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BF7E4118()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BF7E4128()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1BF7E4138()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BF7E4148()
{
  return MEMORY[0x1F41664C0]();
}

uint64_t sub_1BF7E4158()
{
  return MEMORY[0x1F4163558]();
}

uint64_t sub_1BF7E4168()
{
  return MEMORY[0x1F4138880]();
}

uint64_t sub_1BF7E4178()
{
  return MEMORY[0x1F4163590]();
}

uint64_t sub_1BF7E4188()
{
  return MEMORY[0x1F41635A0]();
}

uint64_t sub_1BF7E4198()
{
  return MEMORY[0x1F41635A8]();
}

uint64_t sub_1BF7E41A8()
{
  return MEMORY[0x1F41635B0]();
}

uint64_t sub_1BF7E41B8()
{
  return MEMORY[0x1F41635B8]();
}

uint64_t sub_1BF7E41C8()
{
  return MEMORY[0x1F41635C0]();
}

uint64_t sub_1BF7E41D8()
{
  return MEMORY[0x1F41635D8]();
}

uint64_t _s12NewsArticles21ArticleViewControllerC12isPreviewingSbyF_0()
{
  return MEMORY[0x1F41635E8]();
}

uint64_t sub_1BF7E41F8()
{
  return MEMORY[0x1F4163618]();
}

uint64_t sub_1BF7E4208()
{
  return MEMORY[0x1F4166570]();
}

uint64_t sub_1BF7E4218()
{
  return MEMORY[0x1F4166578]();
}

uint64_t sub_1BF7E4228()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1BF7E4238()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1BF7E4248()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BF7E4258()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1BF7E4268()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BF7E4278()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1BF7E4288()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BF7E4298()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BF7E42A8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1BF7E42B8()
{
  return MEMORY[0x1F4163628]();
}

uint64_t sub_1BF7E42C8()
{
  return MEMORY[0x1F4163638]();
}

uint64_t sub_1BF7E42D8()
{
  return MEMORY[0x1F41396C8]();
}

uint64_t sub_1BF7E42E8()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1BF7E42F8()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1BF7E4308()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1BF7E4318()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1BF7E4328()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1BF7E4338()
{
  return MEMORY[0x1F4133B38]();
}

uint64_t sub_1BF7E4348()
{
  return MEMORY[0x1F41388E0]();
}

uint64_t sub_1BF7E4358()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1BF7E4368()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1BF7E4378()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1BF7E4388()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1BF7E4398()
{
  return MEMORY[0x1F4163640]();
}

uint64_t sub_1BF7E43A8()
{
  return MEMORY[0x1F41872D0]();
}

uint64_t sub_1BF7E43B8()
{
  return MEMORY[0x1F4138928]();
}

uint64_t sub_1BF7E43C8()
{
  return MEMORY[0x1F415FAB8]();
}

uint64_t sub_1BF7E43D8()
{
  return MEMORY[0x1F415FAC8]();
}

uint64_t sub_1BF7E43E8()
{
  return MEMORY[0x1F4163680]();
}

uint64_t sub_1BF7E43F8()
{
  return MEMORY[0x1F4163688]();
}

uint64_t sub_1BF7E4408()
{
  return MEMORY[0x1F4163698]();
}

uint64_t sub_1BF7E4418()
{
  return MEMORY[0x1F41636A8]();
}

uint64_t sub_1BF7E4428()
{
  return MEMORY[0x1F415FAD0]();
}

uint64_t sub_1BF7E4438()
{
  return MEMORY[0x1F415FAE0]();
}

uint64_t sub_1BF7E4448()
{
  return MEMORY[0x1F41636B0]();
}

uint64_t sub_1BF7E4458()
{
  return MEMORY[0x1F41636D0]();
}

uint64_t sub_1BF7E4468()
{
  return MEMORY[0x1F4186B50]();
}

uint64_t sub_1BF7E4478()
{
  return MEMORY[0x1F41636F8]();
}

uint64_t sub_1BF7E4488()
{
  return MEMORY[0x1F4163710]();
}

uint64_t sub_1BF7E4498()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1BF7E44A8()
{
  return MEMORY[0x1F4163750]();
}

uint64_t sub_1BF7E44B8()
{
  return MEMORY[0x1F4163758]();
}

uint64_t sub_1BF7E44C8()
{
  return MEMORY[0x1F4163780]();
}

uint64_t sub_1BF7E44D8()
{
  return MEMORY[0x1F41667D8]();
}

uint64_t sub_1BF7E44E8()
{
  return MEMORY[0x1F415FAF0]();
}

uint64_t sub_1BF7E44F8()
{
  return MEMORY[0x1F415FAF8]();
}

uint64_t sub_1BF7E4508()
{
  return MEMORY[0x1F4138968]();
}

uint64_t sub_1BF7E4518()
{
  return MEMORY[0x1F41637B8]();
}

uint64_t sub_1BF7E4528()
{
  return MEMORY[0x1F41637C0]();
}

uint64_t sub_1BF7E4538()
{
  return MEMORY[0x1F41637C8]();
}

uint64_t sub_1BF7E4548()
{
  return MEMORY[0x1F4138978]();
}

uint64_t sub_1BF7E4558()
{
  return MEMORY[0x1F4138980]();
}

uint64_t sub_1BF7E4568()
{
  return MEMORY[0x1F4163840]();
}

uint64_t sub_1BF7E4578()
{
  return MEMORY[0x1F4163848]();
}

uint64_t sub_1BF7E4588()
{
  return MEMORY[0x1F40E68E8]();
}

uint64_t sub_1BF7E4598()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1BF7E45A8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1BF7E45B8()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1BF7E45C8()
{
  return MEMORY[0x1F4166870]();
}

uint64_t sub_1BF7E45D8()
{
  return MEMORY[0x1F41668B8]();
}

uint64_t sub_1BF7E45E8()
{
  return MEMORY[0x1F4166910]();
}

uint64_t sub_1BF7E45F8()
{
  return MEMORY[0x1F4166950]();
}

uint64_t sub_1BF7E4608()
{
  return MEMORY[0x1F4166968]();
}

uint64_t sub_1BF7E4618()
{
  return MEMORY[0x1F41669C0]();
}

uint64_t sub_1BF7E4628()
{
  return MEMORY[0x1F41669E8]();
}

uint64_t sub_1BF7E4638()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1BF7E4648()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1BF7E4658()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1BF7E4668()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1BF7E4678()
{
  return MEMORY[0x1F415F180]();
}

uint64_t sub_1BF7E4688()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1BF7E4698()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BF7E46A8()
{
  return MEMORY[0x1F40E6B80]();
}

uint64_t sub_1BF7E46B8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BF7E46C8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BF7E46D8()
{
  return MEMORY[0x1F40E6BF0]();
}

uint64_t sub_1BF7E46E8()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1BF7E46F8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1BF7E4708()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1BF7E4718()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1BF7E4728()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BF7E4748()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BF7E4758()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BF7E4768()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1BF7E4778()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1BF7E4788()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1BF7E4798()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BF7E47A8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BF7E47B8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1BF7E47C8()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1BF7E47D8()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1BF7E47E8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BF7E47F8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BF7E4808()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1BF7E4818()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1BF7E4828()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BF7E4838()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1BF7E4848()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BF7E4858()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1BF7E4868()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1BF7E4878()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1BF7E4888()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1BF7E4898()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1BF7E48A8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1BF7E48B8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1BF7E48C8()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1BF7E48D8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1BF7E48E8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1BF7E48F8()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1BF7E4908()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BF7E4918()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1BF7E4928()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1BF7E4938()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BF7E4948()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BF7E4958()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1BF7E4968()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1BF7E4978()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1BF7E4988()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1BF7E4998()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1BF7E49A8()
{
  return MEMORY[0x1F4185340]();
}

uint64_t sub_1BF7E49B8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BF7E49C8()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1BF7E49D8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BF7E49E8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BF7E49F8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BF7E4A08()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1BF7E4A18()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BF7E4A38()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BF7E4A48()
{
  return MEMORY[0x1F415F1A0]();
}

uint64_t sub_1BF7E4A58()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1BF7E4A68()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1BF7E4A78()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1BF7E4A88()
{
  return MEMORY[0x1F4185520]();
}

uint64_t sub_1BF7E4A98()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1BF7E4AA8()
{
  return MEMORY[0x1F4185538]();
}

uint64_t sub_1BF7E4AB8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1BF7E4AC8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1BF7E4AD8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1BF7E4AE8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BF7E4AF8()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1BF7E4B08()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1BF7E4B18()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1BF7E4B28()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1BF7E4B38()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1BF7E4B48()
{
  return MEMORY[0x1F4185650]();
}

uint64_t sub_1BF7E4B58()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1BF7E4B68()
{
  return MEMORY[0x1F4185660]();
}

uint64_t sub_1BF7E4B78()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1BF7E4B88()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1BF7E4B98()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1BF7E4BA8()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BF7E4BB8()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1BF7E4BC8()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1BF7E4BD8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1BF7E4BE8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BF7E4BF8()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1BF7E4C08()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1BF7E4C18()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1BF7E4C28()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1BF7E4C38()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1BF7E4C48()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1BF7E4C58()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BF7E4C68()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1BF7E4C78()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1BF7E4C88()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1BF7E4C98()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1BF7E4CA8()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1BF7E4CB8()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1BF7E4CC8()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1BF7E4CD8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1BF7E4CE8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BF7E4CF8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BF7E4D08()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1BF7E4D18()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BF7E4D28()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BF7E4D38()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BF7E4D48()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BF7E4D58()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BF7E4D68()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BF7E4D78()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1BF7E4D88()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BF7E4D98()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1BF7E4DA8()
{
  return MEMORY[0x1F415F1B8]();
}

uint64_t sub_1BF7E4DB8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1BF7E4DC8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BF7E4DD8()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1BF7E4DE8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1BF7E4DF8()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_1BF7E4E28()
{
  return MEMORY[0x1F4186318]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

uint64_t FCNarrativeTrackForSubscription()
{
  return MEMORY[0x1F4133C18]();
}

uint64_t FCURLForContainerizedUserAccountDocumentDirectory()
{
  return MEMORY[0x1F4133CA0]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x1F412EC20]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x1F4166AE0](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x1F4166B10]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1F4166B38]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4166B50]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}