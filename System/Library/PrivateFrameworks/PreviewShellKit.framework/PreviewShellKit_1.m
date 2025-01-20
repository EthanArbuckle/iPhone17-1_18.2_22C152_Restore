uint64_t sub_25A21EB5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  v7 = *(void *)(a3[3] - 8);
  v8 = v7 + 40;
  v9 = *(unsigned __int8 *)(v7 + 80);
  v10 = *(void *)(v6 + 24) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  v13 = *(void *)(v8 + 24);
  v14 = *(void *)(a3[4] - 8);
  v15 = v14 + 40;
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = v13 + v16;
  v18 = (v17 + v11) & ~v16;
  v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  v20 = *(void *)(a3[5] - 8);
  (*(void (**)(unint64_t, unint64_t))(v20 + 40))((*(void *)(v15 + 24) + *(unsigned __int8 *)(v20 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80), (*(void *)(v15 + 24) + *(unsigned __int8 *)(v20 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  return a1;
}

uint64_t sub_25A21ECAC(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  uint64_t v5 = *(void *)(a3[2] - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  uint64_t v7 = *(void *)(a3[3] - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6) {
    unsigned int v9 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = a3[5];
  uint64_t v11 = *(void *)(a3[4] - 8);
  unsigned int v12 = *(_DWORD *)(v11 + 84);
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12 <= v9) {
    unsigned int v14 = v9;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v15 = *(unsigned int *)(v13 + 84);
  uint64_t v16 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v18 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = *(void *)(*(void *)(a3[4] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v21 = *(void *)(v13 + 64);
  if (v15 <= v14) {
    unsigned int v22 = v14;
  }
  else {
    unsigned int v22 = *(_DWORD *)(v13 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v23 = *(void *)(*(void *)(a3[2] - 8) + 64) + v16;
  int v24 = a2 - v22;
  if (a2 <= v22) {
    goto LABEL_30;
  }
  uint64_t v25 = ((v19 + v20 + ((v17 + v18 + (v23 & ~v16)) & ~v18)) & ~v20) + v21;
  char v26 = 8 * v25;
  if (v25 <= 3)
  {
    unsigned int v28 = ((v24 + ~(-1 << v26)) >> v26) + 1;
    if (HIWORD(v28))
    {
      int v27 = *(_DWORD *)((char *)a1 + v25);
      if (!v27) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v28 > 0xFF)
    {
      int v27 = *(unsigned __int16 *)((char *)a1 + v25);
      if (!*(unsigned __int16 *)((char *)a1 + v25)) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v28 < 2)
    {
LABEL_30:
      if (v22)
      {
        if (v6 == v22)
        {
          v32 = *(uint64_t (**)(void))(v5 + 48);
          return v32();
        }
        else
        {
          unint64_t v34 = ((unint64_t)a1 + v23) & ~v16;
          if (v8 == v22)
          {
            v35 = *(uint64_t (**)(unint64_t))(v7 + 48);
            return v35(v34);
          }
          else
          {
            unint64_t v36 = (v34 + v17 + v18) & ~v18;
            if (v12 == v22)
            {
              v37 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v11 + 48);
              uint64_t v38 = *(unsigned int *)(v11 + 84);
              uint64_t v39 = a3[4];
            }
            else
            {
              unint64_t v36 = (v36 + v19 + v20) & ~v20;
              v37 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
              uint64_t v38 = v15;
              uint64_t v39 = a3[5];
            }
            return v37(v36, v38, v39);
          }
        }
      }
      return 0;
    }
  }
  int v27 = *((unsigned __int8 *)a1 + v25);
  if (!*((unsigned char *)a1 + v25)) {
    goto LABEL_30;
  }
LABEL_20:
  int v29 = (v27 - 1) << v26;
  if (v25 > 3) {
    int v29 = 0;
  }
  if (v25)
  {
    if (v25 <= 3) {
      int v30 = ((v19 + v20 + ((v17 + v18 + (v23 & ~v16)) & ~v18)) & ~v20) + v21;
    }
    else {
      int v30 = 4;
    }
    switch(v30)
    {
      case 2:
        int v31 = *a1;
        break;
      case 3:
        int v31 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v31 = *(_DWORD *)a1;
        break;
      default:
        int v31 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v31 = 0;
  }
  return v22 + (v31 | v29) + 1;
}

void sub_25A21F06C(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v6 = *(void *)(a4[2] - 8);
  uint64_t v7 = a4[4];
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  uint64_t v9 = *(void *)(a4[3] - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v8) {
    unsigned int v11 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(void *)(v7 - 8);
  unsigned int v13 = *(_DWORD *)(v12 + 84);
  if (v13 <= v11) {
    unsigned int v14 = v11;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v15 = a4[5];
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(*(void *)(a4[2] - 8) + 64);
  uint64_t v18 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = *(void *)(*(void *)(a4[3] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = *(void *)(*(void *)(v7 - 8) + 64);
  uint64_t v22 = *(unsigned __int8 *)(v16 + 80);
  if (*(_DWORD *)(v16 + 84) <= v14) {
    unsigned int v23 = v14;
  }
  else {
    unsigned int v23 = *(_DWORD *)(v16 + 84);
  }
  uint64_t v24 = v17 + v18;
  size_t v25 = ((v21 + v22 + ((v19 + v20 + ((v17 + v18) & ~v18)) & ~v20)) & ~v22) + *(void *)(*(void *)(v15 - 8) + 64);
  BOOL v26 = a3 >= v23;
  unsigned int v27 = a3 - v23;
  if (v27 != 0 && v26)
  {
    if (v25 <= 3)
    {
      unsigned int v31 = ((v27 + ~(-1 << (8 * v25))) >> (8 * v25)) + 1;
      if (HIWORD(v31))
      {
        int v28 = 4;
      }
      else if (v31 >= 0x100)
      {
        int v28 = 2;
      }
      else
      {
        int v28 = v31 > 1;
      }
    }
    else
    {
      int v28 = 1;
    }
  }
  else
  {
    int v28 = 0;
  }
  if (v23 < a2)
  {
    unsigned int v29 = ~v23 + a2;
    if (v25 < 4)
    {
      int v30 = (v29 >> (8 * v25)) + 1;
      if (v25)
      {
        int v32 = v29 & ~(-1 << (8 * v25));
        bzero(a1, v25);
        if (v25 == 3)
        {
          *(_WORD *)a1 = v32;
          a1[2] = BYTE2(v32);
        }
        else if (v25 == 2)
        {
          *(_WORD *)a1 = v32;
        }
        else
        {
          *a1 = v32;
        }
      }
    }
    else
    {
      bzero(a1, v25);
      *(_DWORD *)a1 = v29;
      int v30 = 1;
    }
    switch(v28)
    {
      case 1:
        a1[v25] = v30;
        return;
      case 2:
        *(_WORD *)&a1[v25] = v30;
        return;
      case 3:
        goto LABEL_55;
      case 4:
        *(_DWORD *)&a1[v25] = v30;
        return;
      default:
        return;
    }
  }
  switch(v28)
  {
    case 1:
      a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_55:
      __break(1u);
      JUMPOUT(0x25A21F4CCLL);
    case 4:
      *(_DWORD *)&a1[v25] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        if (v8 == v23)
        {
          v33 = *(void (**)(char *))(v6 + 56);
          unint64_t v34 = a1;
        }
        else
        {
          unint64_t v34 = (char *)((unint64_t)&a1[v24] & ~v18);
          if (v10 == v23)
          {
            v33 = *(void (**)(char *))(v9 + 56);
          }
          else
          {
            unint64_t v34 = (char *)((unint64_t)&v34[v19 + v20] & ~v20);
            if (v13 == v23)
            {
              v33 = *(void (**)(char *))(v12 + 56);
            }
            else
            {
              unint64_t v34 = (char *)((unint64_t)&v34[v21 + v22] & ~v22);
              v33 = *(void (**)(char *))(v16 + 56);
            }
          }
        }
        v33(v34);
      }
      return;
  }
}

uint64_t sub_25A21F4F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A2149E8(a1, v1 + v3, v1 + v6, v1 + v9, v1 + ((v9 + v10 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)));
}

uint64_t sub_25A21F6C4(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A214D0C(a1, v1 + v4, v1 + v7, v1 + v10, v1 + ((v10 + v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)));
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)(type metadata accessor for CanvasControl() - 8);
  uint64_t v44 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v3 = (v44 + 48) & ~v44;
  uint64_t v4 = *(void *)(*(void *)v2 + 64);
  uint64_t v5 = type metadata accessor for CanvasControl();
  uint64_t v43 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v6 = (v3 + v4 + v43) & ~v43;
  uint64_t v7 = *(void *)(*(void *)(v5 - 8) + 64);
  uint64_t v38 = type metadata accessor for CanvasControl();
  uint64_t v42 = *(unsigned __int8 *)(*(void *)(v38 - 8) + 80);
  uint64_t v37 = (v6 + v7 + v42) & ~v42;
  uint64_t v8 = *(void *)(*(void *)(v38 - 8) + 64);
  uint64_t v39 = type metadata accessor for CanvasControl();
  uint64_t v41 = *(unsigned __int8 *)(*(void *)(v39 - 8) + 80);
  uint64_t v9 = v8 + v41;
  uint64_t v40 = *(void *)(*(void *)(v39 - 8) + 64);
  uint64_t v10 = v0 + v3;
  uint64_t v11 = sub_25A236B68();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v13 = v10 + v2[12];
  uint64_t v14 = type metadata accessor for ThumbnailHostFactory();
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14);
  uint64_t v16 = v37;
  if (!v15)
  {
    uint64_t v17 = sub_25A2368A8();
    uint64_t v18 = *(void *)(v17 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v13, 1, v17)) {
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v13, v17);
    }
    swift_release();
    uint64_t v16 = v37;
    uint64_t v9 = v8 + v41;
  }
  uint64_t v19 = v16 + v9;
  uint64_t v20 = v16;
  v12(v1 + v6, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v21 = v1 + v6 + *(int *)(v5 + 40);
  uint64_t v22 = type metadata accessor for ThumbnailHostFactory();
  uint64_t v23 = v20;
  uint64_t v24 = v12;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v21, 1, v22))
  {
    uint64_t v25 = sub_25A2368A8();
    uint64_t v26 = *(void *)(v25 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v21, 1, v25)) {
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v21, v25);
    }
    swift_release();
  }
  uint64_t v27 = v19 & ~v41;
  v24(v1 + v23, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v28 = v1 + v23 + *(int *)(v38 + 40);
  uint64_t v29 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48))(v28, 1, v29))
  {
    uint64_t v30 = sub_25A2368A8();
    uint64_t v31 = *(void *)(v30 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v28, 1, v30)) {
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v28, v30);
    }
    swift_release();
  }
  v24(v1 + v27, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v32 = v1 + v27 + *(int *)(v39 + 40);
  uint64_t v33 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v32, 1, v33))
  {
    uint64_t v34 = sub_25A2368A8();
    uint64_t v35 = *(void *)(v34 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v32, 1, v34)) {
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v32, v34);
    }
    swift_release();
  }

  return MEMORY[0x270FA0238](v1, v27 + v40, v44 | v43 | v42 | v41 | 7);
}

uint64_t sub_25A21FFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4[2];
  uint64_t v6 = v4[3];
  uint64_t v8 = v4[4];
  uint64_t v7 = v4[5];
  uint64_t v9 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v13 = (v10 + v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = *(void *)(v12 + 64);
  uint64_t v15 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v16 = (v13 + v14 + *(unsigned __int8 *)(v15 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = *(void *)(v15 + 64);
  uint64_t v18 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A214EF0(a1, a2, a3, a4, (uint64_t)v4 + v10, (uint64_t)v4 + v13, (uint64_t)v4 + v16, (uint64_t)v4+ ((v16 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), v5, v6, v8, v7);
}

uint64_t type metadata accessor for CanvasControlConfiguration.IndexOutOfBounds()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A2201C0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A2139BC(a1, v1 + v4, v1 + v7, v1 + ((v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)));
}

uint64_t sub_25A220330(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(type metadata accessor for CanvasControl() - 8);
  uint64_t v10 = v1 + ((v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_25A213C48(a1, v1 + v4, v1 + v7, v10);
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)(type metadata accessor for CanvasControl() - 8);
  uint64_t v33 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v3 = (v33 + 40) & ~v33;
  uint64_t v4 = *(void *)(*(void *)v2 + 64);
  uint64_t v5 = type metadata accessor for CanvasControl();
  uint64_t v32 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v6 = (v3 + v4 + v32) & ~v32;
  uint64_t v7 = *(void *)(*(void *)(v5 - 8) + 64);
  uint64_t v8 = type metadata accessor for CanvasControl();
  uint64_t v29 = *(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v30 = v8;
  uint64_t v9 = v6 + v7 + v29;
  uint64_t v31 = *(void *)(*(void *)(v8 - 8) + 64);
  uint64_t v10 = v0 + v3;
  uint64_t v11 = sub_25A236B68();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v13 = v10 + v2[12];
  uint64_t v14 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
  {
    uint64_t v15 = sub_25A2368A8();
    uint64_t v16 = *(void *)(v15 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15)) {
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v13, v15);
    }
    swift_release();
    uint64_t v1 = v0;
  }
  uint64_t v17 = v29;
  uint64_t v18 = v9 & ~v29;
  v12(v1 + v6, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v19 = v1 + v6 + *(int *)(v5 + 40);
  uint64_t v20 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v19, 1, v20))
  {
    uint64_t v21 = sub_25A2368A8();
    uint64_t v22 = *(void *)(v21 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21)) {
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v19, v21);
    }
    swift_release();
    uint64_t v17 = v29;
  }
  v12(v1 + v18, v11);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v23 = v1 + v18 + *(int *)(v30 + 40);
  uint64_t v24 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v23, 1, v24))
  {
    uint64_t v25 = v18;
    uint64_t v26 = sub_25A2368A8();
    uint64_t v27 = *(void *)(v26 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v23, 1, v26)) {
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v23, v26);
    }
    swift_release();
    uint64_t v18 = v25;
  }

  return MEMORY[0x270FA0238](v1, v18 + v31, v33 | v32 | v17 | 7);
}

uint64_t sub_25A220A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  type metadata accessor for CanvasControl();
  return sub_25A213DE8(a1, a2, a3, a4, v4 + v8, v4 + v11);
}

uint64_t sub_25A220BB0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A212DA4(a1, v1 + v4, v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));
}

uint64_t sub_25A220CB0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for CanvasControl() - 8);
  uint64_t v7 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_25A212F6C(a1, v1 + v4, v7);
}

uint64_t objectdestroy_24Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for CanvasControl() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = type metadata accessor for CanvasControl();
  uint64_t v21 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v6 = (v3 + v4 + v21) & ~v21;
  uint64_t v20 = *(void *)(*(void *)(v5 - 8) + 64);
  uint64_t v7 = v0 + v3;
  uint64_t v8 = sub_25A236B68();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v10 = v7 + v1[12];
  uint64_t v11 = v2;
  uint64_t v12 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v10, 1, v12))
  {
    uint64_t v13 = sub_25A2368A8();
    uint64_t v14 = *(void *)(v13 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13)) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v10, v13);
    }
    swift_release();
    uint64_t v11 = v2;
  }
  v9(v0 + v6, v8);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v15 = v0 + v6 + *(int *)(v5 + 40);
  uint64_t v16 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16))
  {
    uint64_t v17 = sub_25A2368A8();
    uint64_t v18 = *(void *)(v17 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17)) {
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v15, v17);
    }
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v6 + v20, v11 | v21 | 7);
}

uint64_t sub_25A22117C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(type metadata accessor for CanvasControl() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A2130B0(a1, a2, a3, a4, v4 + v10, v4 + ((v10 + v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)));
}

uint64_t sub_25A221294(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A212590(a1, v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

uint64_t sub_25A221320(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CanvasControl() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_25A212694(a1, v4);
}

uint64_t objectdestroy_33Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for CanvasControl() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_25A236B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[12];
  uint64_t v7 = type metadata accessor for ThumbnailHostFactory();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    uint64_t v8 = sub_25A2368A8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
    }
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25A2215AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(type metadata accessor for CanvasControl() - 8);
  return sub_25A212780(a1, a2, a3, a4, v4 + ((*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)));
}

unint64_t sub_25A22164C()
{
  unint64_t result = qword_26A40C488[0];
  if (!qword_26A40C488[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A40C480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A40C488);
  }
  return result;
}

uint64_t sub_25A2216AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A225C34(v3, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v11 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = *(void *)(a1 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v12 + v11, (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_25A2384F8();
  return sub_25A221CE4((uint64_t)v10, (uint64_t)&unk_26A40C650, v12, a2);
}

uint64_t sub_25A22184C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v5 = *(void *)(a3 + a2 - 8);
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(type metadata accessor for ThumbnailHostFactory() + 28));
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v5;
  v9[3] = v8;
  v9[4] = v7;
  *a4 = &unk_26A40C628;
  a4[1] = v9;

  return swift_retain();
}

uint64_t sub_25A2218DC(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A1731E8;
  return v9(a1, v5, v6);
}

uint64_t sub_25A2219CC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 8);
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v7;
  v8[4] = v6;
  uint64_t v9 = (void *)(a2 + *(int *)(type metadata accessor for ThumbnailHostFactory() + 28));
  swift_retain();
  uint64_t result = swift_release();
  *uint64_t v9 = &unk_26A40C618;
  v9[1] = v8;
  return result;
}

uint64_t sub_25A221A64(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[2] = a2;
  v4[3] = a3;
  uint64_t v8 = (int *)((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_25A221B54;
  return ((uint64_t (*)(uint64_t, void *))v8)(a1, v4 + 2);
}

uint64_t sub_25A221B54()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ThumbnailHostFactory.makeHost.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 28));
  swift_retain();
  return v2;
}

uint64_t ThumbnailHostFactory.makeHost.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3 + 28));
  uint64_t result = swift_release();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*ThumbnailHostFactory.makeHost.modify())()
{
  return nullsub_1;
}

uint64_t sub_25A221CE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_25A2368A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a4, 1, 1, v8);
  sub_25A227598(a1, a4);
  uint64_t result = type metadata accessor for ThumbnailHostFactory();
  uint64_t v10 = (void *)(a4 + *(int *)(result + 28));
  *uint64_t v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t sub_25A221D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  sub_25A238248();
  v5[12] = sub_25A238238();
  uint64_t v7 = sub_25A238208();
  v5[13] = v7;
  v5[14] = v6;
  return MEMORY[0x270FA2498](sub_25A221E28, v7, v6);
}

uint64_t sub_25A221E28()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for ThumbnailHostFactory() + 28));
  uint64_t v7 = (uint64_t (*)(void *, uint64_t, uint64_t))(*v2 + *(int *)*v2);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[15] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25A221F18;
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  return v7(v0 + 2, v4, v5);
}

uint64_t sub_25A221F18()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 104);
  if (v0) {
    uint64_t v5 = sub_25A2220F8;
  }
  else {
    uint64_t v5 = sub_25A222054;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25A222054()
{
  uint64_t v1 = (uint64_t *)v0[7];
  swift_release();
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  sub_25A22215C(v2, v3, v1);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25A2220F8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A22215C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v10 = a1;
  uint64_t v11 = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v9);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(boxed_opaque_existential_1, v3, a1);
  swift_getAssociatedTypeWitness();
  a3[3] = type metadata accessor for OptionalStateWrapper();
  a3[4] = swift_getWitnessTable();
  uint64_t v7 = swift_allocObject();
  *a3 = v7;
  return sub_25A174C70(&v9, v7 + 16);
}

uint64_t static ThumbnailHostFactory.localHostFactory(expectedGeometry:makeViewController:displayThumbnail:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a6;
  v15[3] = a4;
  v15[4] = a5;
  swift_retain();
  swift_retain();
  static ThumbnailHostFactory.localHostFactory<A>(expectedGeometry:context:makeViewController:displayThumbnail:)(a1, (uint64_t)sub_25A222380, v14, (uint64_t)&unk_26A40C518, (uint64_t)v15, a6, MEMORY[0x263F8EE60] + 8, a7);
  swift_release();

  return swift_release();
}

uint64_t sub_25A222348()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A222380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a2, a3);
}

uint64_t sub_25A2223B0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[2] = sub_25A238248();
  v4[3] = sub_25A238238();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  v4[4] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_25A2224C0;
  return v10(a1, a3);
}

uint64_t sub_25A2224C0(double a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v6;
    uint64_t v8 = sub_25A1EEB6C;
  }
  else
  {
    *(double *)(v4 + 48) = a1;
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v9;
    uint64_t v8 = sub_25A222640;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_25A222640()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(__n128))(v0 + 8);
  v2.n128_u64[0] = *(void *)(v0 + 48);
  return v1(v2);
}

uint64_t sub_25A2226A8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25A2226E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 24);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25A228050;
  return sub_25A2223B0(a1, a2, a3, v8);
}

uint64_t static ThumbnailHostFactory.localHostFactory<A>(expectedGeometry:context:makeViewController:displayThumbnail:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v21 = a4;
  uint64_t v22 = a8;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_allocObject();
  sub_25A225BF4();
  swift_getTupleTypeMetadata2();
  swift_getTupleTypeMetadata2();
  sub_25A2381D8();
  *(void *)(v17 + 16) = sub_25A237F88();
  sub_25A225C34(a1, (uint64_t)v16);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a6;
  v18[3] = a7;
  v18[4] = v17;
  v18[5] = a2;
  uint64_t v19 = v21;
  v18[6] = a3;
  v18[7] = v19;
  v18[8] = a5;
  swift_retain();
  swift_retain();
  return sub_25A221CE4((uint64_t)v16, (uint64_t)&unk_26A40C530, (uint64_t)v18, v22);
}

uint64_t sub_25A222944()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A22297C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[15] = v14;
  v8[16] = v15;
  v8[13] = a7;
  v8[14] = a8;
  v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[7] = a1;
  v8[8] = a2;
  sub_25A225BF4();
  v8[17] = swift_getTupleTypeMetadata2();
  v8[18] = swift_task_alloc();
  uint64_t v9 = *(void *)(v15 - 8);
  v8[19] = v9;
  v8[20] = *(void *)(v9 + 64);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  sub_25A238248();
  v8[23] = sub_25A238238();
  uint64_t v11 = sub_25A238208();
  return MEMORY[0x270FA2498](sub_25A222ADC, v11, v10);
}

uint64_t sub_25A222ADC()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v18 = *(void *)(v0 + 168);
  uint64_t v22 = *(void *)(v0 + 144);
  uint64_t v23 = *(char **)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v16 = *(void *)(v0 + 136);
  uint64_t v19 = *(void *)(v0 + 104);
  uint64_t v20 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v21 = *(void **)(v0 + 56);
  long long v15 = *(_OWORD *)(v0 + 88);
  swift_release();
  uint64_t ObjectType = swift_getObjectType();
  *(void *)(v0 + 40) = (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 8) + 16))(ObjectType);
  *(void *)(v0 + 48) = v7;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = v3;
  *(void *)(v8 + 24) = v2;
  *(_OWORD *)(v8 + 32) = v15;
  *(void *)(v8 + 48) = v5;
  *(void *)(v8 + 56) = v4;
  swift_beginAccess();
  sub_25A237F98();
  swift_getWitnessTable();
  sub_25A236F08();
  swift_endAccess();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v22 + *(int *)(v16 + 48));
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 32);
  v9(v23, v22, v2);
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 16))(v18, v23, v2);
  unint64_t v10 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = v3;
  *((void *)v11 + 3) = v2;
  *((void *)v11 + 4) = v19;
  *((void *)v11 + 5) = v20;
  v9(&v11[v10], v18, v2);
  v21[3] = type metadata accessor for ThumbnailHostFactory.LocalThumbnailHost();
  v21[4] = swift_getWitnessTable();
  *uint64_t v21 = v17;
  v21[1] = &unk_26A40C640;
  v21[2] = v11;
  uint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  swift_retain();
  v12(v23, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_25A222DC4(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_25A238248();
  v5[3] = sub_25A238238();
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  unint64_t v10 = (void *)swift_task_alloc();
  v5[4] = v10;
  *unint64_t v10 = v5;
  v10[1] = sub_25A222EE0;
  return v12(a1, a5, a2);
}

uint64_t sub_25A222EE0(double a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v6;
    uint64_t v8 = sub_25A22804C;
  }
  else
  {
    *(double *)(v4 + 48) = a1;
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v9;
    uint64_t v8 = sub_25A228048;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_25A223060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  v5[2] = a2;
  v5[3] = a3;
  sub_25A236218();
  v5[4] = swift_task_alloc();
  uint64_t v8 = sub_25A236E28();
  v5[5] = v8;
  v5[6] = *(void *)(v8 - 8);
  v5[7] = swift_task_alloc();
  uint64_t v9 = sub_25A236228();
  v5[8] = v9;
  v5[9] = *(void *)(v9 - 8);
  v5[10] = swift_task_alloc();
  uint64_t v10 = swift_task_alloc();
  v5[11] = v10;
  v5[12] = sub_25A238248();
  v5[13] = sub_25A238238();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a5 + *a5);
  uint64_t v11 = (void *)swift_task_alloc();
  v5[14] = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_25A223268;
  return v13(v10, a1);
}

uint64_t sub_25A223268(double a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v6;
    uint64_t v8 = sub_25A223558;
  }
  else
  {
    *(double *)(v4 + 128) = a1;
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v9;
    uint64_t v8 = sub_25A2233E8;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_25A2233E8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v13 = v0[5];
  uint64_t v7 = (void *)v0[3];
  swift_release();
  uint64_t v8 = v7[3];
  uint64_t v12 = v7[4];
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  sub_25A236DC8();
  sub_25A236E18();
  (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v13);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(__n128))v0[1];
  v10.n128_u64[0] = v0[16];
  return v9(v10);
}

uint64_t sub_25A223558()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A2235F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = (int *)v3[1];
  __n128 v10 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v10;
  *__n128 v10 = v4;
  v10[1] = sub_25A228038;
  return sub_25A223060(a1, a2, a3, v8, v9);
}

id sub_25A2236C8()
{
  return *v0;
}

uint64_t sub_25A2236D0()
{
  return sub_25A237748();
}

uint64_t sub_25A22373C()
{
  return sub_25A237748();
}

uint64_t sub_25A2237A8()
{
  return sub_25A237748();
}

uint64_t static ThumbnailHostFactory.remoteHostFactory(expectedGeometry:previewAgentConnector:makeUpdate:validateReply:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v26 = a5;
  uint64_t v27 = a8;
  uint64_t v14 = type metadata accessor for PreviewAgentConnector();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A225C34(a1, (uint64_t)v19);
  sub_25A1B8190(a2, (uint64_t)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v20 = (*(unsigned __int8 *)(v15 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v21 = (v16 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a7;
  sub_25A1B8380((uint64_t)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v20);
  uint64_t v23 = (void *)(v22 + v21);
  *uint64_t v23 = a3;
  v23[1] = a4;
  uint64_t v24 = (void *)(v22 + ((v21 + 23) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v24 = v26;
  v24[1] = a6;
  swift_retain();
  swift_retain();
  return sub_25A221CE4((uint64_t)v19, (uint64_t)&unk_26A40C540, v22, v27);
}

uint64_t sub_25A2239D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[16] = a8;
  v8[17] = v13;
  v8[14] = a6;
  v8[15] = a7;
  v8[12] = a4;
  v8[13] = a5;
  v8[10] = a2;
  v8[11] = a3;
  v8[9] = a1;
  sub_25A238248();
  v8[18] = sub_25A238238();
  uint64_t v10 = sub_25A238208();
  v8[19] = v10;
  v8[20] = v9;
  return MEMORY[0x270FA2498](sub_25A223A88, v10, v9);
}

uint64_t sub_25A223A88()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v1 + 24))(ObjectType, v1);
  return MEMORY[0x270FA2498](sub_25A223B20, 0, 0);
}

uint64_t sub_25A223B20()
{
  uint64_t v1 = *(_DWORD **)(v0 + 96);
  *(_DWORD *)(v0 + 208) = *v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 168) = v2;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0 + 16;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))((int)*MEMORY[0x263F605B8] + MEMORY[0x263F605B8]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25A223C28;
  return v5(v0 + 56, v0 + 208, &unk_26A40C630, v2);
}

uint64_t sub_25A223C28()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25A223EB4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_25A223D44;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A223D44()
{
  sub_25A2274E8(v0 + 16);
  *(_OWORD *)(v0 + 192) = *(_OWORD *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  return MEMORY[0x270FA2498](sub_25A223DB0, v1, v2);
}

uint64_t sub_25A223DB0()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(uint64_t **)(v0 + 72);
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(v0 + 192), *(int8x16_t *)(v0 + 192), 8uLL);
  long long v8 = *(_OWORD *)(v0 + 112);
  swift_release();
  v3[3] = type metadata accessor for ThumbnailHostFactory.RemoteThumbnailHost();
  v3[4] = swift_getWitnessTable();
  uint64_t v4 = swift_allocObject();
  *uint64_t v3 = v4;
  *(int8x16_t *)(v4 + 16) = v7;
  *(void *)(v4 + 32) = v2;
  *(_OWORD *)(v4 + 40) = v8;
  *(void *)(v4 + 56) = v1;
  swift_retain();
  swift_retain();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_25A223EB4()
{
  sub_25A2274E8(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 160);
  return MEMORY[0x270FA2498](sub_25A223F24, v1, v2);
}

uint64_t sub_25A223F24()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t ThumbnailSceneCache.sceneAgent(for:)(uint64_t a1)
{
  *(void *)(v2 + 72) = a1;
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_25A223FB8, 0, 0);
}

uint64_t sub_25A223FB8()
{
  uint64_t v1 = *(_DWORD **)(v0 + 72);
  *(_DWORD *)(v0 + 104) = *v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0 + 16;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))((int)*MEMORY[0x263F605B8] + MEMORY[0x263F605B8]);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *long long v3 = v0;
  v3[1] = sub_25A2240C0;
  return v5(v0 + 56, v0 + 104, &unk_26A40C558, v2);
}

uint64_t sub_25A2240C0()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25A2241F8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_25A2241DC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A2241DC()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 56), *(void *)(v0 + 64));
}

uint64_t sub_25A2241F8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A22425C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_25A236FC8();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v6 = sub_25A236D98();
  v4[9] = v6;
  v4[10] = *(void *)(v6 - 8);
  v4[11] = swift_task_alloc();
  sub_25A238248();
  v4[12] = sub_25A238238();
  uint64_t v8 = sub_25A238208();
  v4[13] = v8;
  v4[14] = v7;
  return MEMORY[0x270FA2498](sub_25A2243B0, v8, v7);
}

uint64_t sub_25A2243B0()
{
  (*(void (**)(void))(v0[5] + 16))(v0[2]);
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_25A16EBCC(v1, v0[3], v0[4]);
  v0[15] = v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[16] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A409AA0);
  *uint64_t v5 = v0;
  v5[1] = sub_25A22452C;
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[6];
  uint64_t v9 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v7, v4, v8, v6, v9);
}

uint64_t sub_25A22452C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[13];
    uint64_t v4 = v2[14];
    uint64_t v5 = sub_25A224748;
  }
  else
  {
    uint64_t v6 = v2[5];
    v2[18] = *(void *)(v6 + 32);
    v2[19] = *(void *)(v6 + 40);
    uint64_t v3 = v2[13];
    uint64_t v4 = v2[14];
    uint64_t v5 = sub_25A224654;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_25A224654()
{
  uint64_t v1 = (double (*)(uint64_t, uint64_t))v0[18];
  uint64_t v2 = v0[17];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[2];
  swift_release();
  double v7 = v1(v3, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(__n128))v0[1];
  if (!v2) {
    v8.n128_f64[0] = v7;
  }
  return v9(v8);
}

uint64_t sub_25A224748()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A2247CC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A28);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = &v6[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25A238248();
  sub_25A238238();
  sub_25A238218();
  swift_release();
  v6[15] = 0;
  uint64_t v3 = sub_25A237F28();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = sub_25A2361C8();
  sub_25A227FD8((uint64_t)v2);
  return v4;
}

uint64_t sub_25A224904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v8 = v3[1];
  *(_OWORD *)(v4 + 16) = *v3;
  *(_OWORD *)(v4 + 32) = v8;
  *(_OWORD *)(v4 + 48) = v3[2];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 64) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25A2249D8;
  return sub_25A22425C(a1, a2, a3);
}

uint64_t sub_25A2249D8(double a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(__n128))(v7 + 8);
  if (!v1) {
    v4.n128_f64[0] = a1;
  }
  return v5(v4);
}

uint64_t sub_25A224AD8()
{
  return sub_25A2247CC();
}

uint64_t sub_25A224B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25A22728C();

  return MEMORY[0x270F55BD0](a1, a2, a3, v6);
}

uint64_t ThumbnailSceneCache.init(in:makeHostingViewController:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26A40C560);
  uint64_t result = sub_25A237598();
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  a5[4] = result;
  return result;
}

uint64_t sub_25A224BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  uint64_t v4 = sub_25A236EC8();
  v3[11] = v4;
  v3[12] = *(void *)(v4 - 8);
  v3[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A224C8C, 0, 0);
}

uint64_t sub_25A224C8C()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = (uint64_t *)v0[10];
  uint64_t v4 = v0[11];
  uint64_t v5 = *v3;
  v0[14] = *v3;
  uint64_t v6 = v3[1];
  id v7 = objc_msgSend(self, sel_previewSceneSpecification);
  v0[15] = v7;
  swift_unknownObjectRetain();
  sub_25A2385F8();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(ObjectType, v6);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  sub_25A2380C8();
  sub_25A236EB8();
  sub_25A227490();
  sub_25A238728();
  sub_25A2380C8();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  v0[16] = v11;
  v0[17] = sub_25A238248();
  v0[18] = sub_25A238238();
  v0[2] = v5;
  v0[3] = v6;
  v0[4] = v9;
  v0[5] = v11;
  v0[6] = v7;
  v0[7] = 0;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[19] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_25A224E84;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)((uint64_t)(v0 + 2), v0 + 7);
}

uint64_t sub_25A224E84(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 160) = a1;
  *(void *)(v3 + 168) = v1;
  swift_task_dealloc();
  uint64_t v5 = sub_25A238208();
  if (v1) {
    uint64_t v6 = sub_25A225198;
  }
  else {
    uint64_t v6 = sub_25A224FC8;
  }
  return MEMORY[0x270FA2498](v6, v5, v4);
}

uint64_t sub_25A224FC8()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA2498](sub_25A225054, 0, 0);
}

uint64_t sub_25A225054()
{
  uint64_t v1 = v0[10];
  v0[22] = *(void *)(v1 + 16);
  v0[23] = *(void *)(v1 + 24);
  v0[24] = sub_25A238238();
  uint64_t v3 = sub_25A238208();
  return MEMORY[0x270FA2498](sub_25A2250F4, v3, v2);
}

uint64_t sub_25A2250F4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[22];
  uint64_t v3 = v0[20];
  swift_release();
  v0[25] = v2(v3);
  v0[26] = v1;
  if (v1) {
    uint64_t v4 = sub_25A22529C;
  }
  else {
    uint64_t v4 = sub_25A225228;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_25A225198()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25A225228()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = (void *)v0[8];
  *uint64_t v2 = v0[20];
  v2[1] = v1;
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25A22529C()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A225308()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v3 + 8) + 8))(v2);
}

uint64_t sub_25A225354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = v4;
  v5[2] = a1;
  v5[3] = a2;
  uint64_t v6 = *(void *)(a4 + 16);
  v5[6] = v6;
  uint64_t v7 = sub_25A2384F8();
  v5[7] = v7;
  v5[8] = *(void *)(v7 - 8);
  v5[9] = swift_task_alloc();
  v5[10] = *(void *)(v6 - 8);
  v5[11] = swift_task_alloc();
  sub_25A238248();
  v5[12] = sub_25A238238();
  uint64_t v9 = sub_25A238208();
  v5[13] = v9;
  v5[14] = v8;
  return MEMORY[0x270FA2498](sub_25A2254A8, v9, v8);
}

uint64_t sub_25A2254A8()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[6];
  (*(void (**)(uint64_t, void, void))(v0[8] + 16))(v1, v0[2], v0[7]);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    uint64_t v5 = v0[8];
    uint64_t v4 = v0[9];
    uint64_t v6 = v0[7];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    type metadata accessor for OptionalStateWrapper.NilState();
    swift_getWitnessTable();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
  else
  {
    uint64_t v9 = (void *)v0[5];
    (*(void (**)(void, void, void))(v0[10] + 32))(v0[11], v0[9], v0[6]);
    uint64_t v10 = v9[3];
    uint64_t v11 = v9[4];
    __swift_project_boxed_opaque_existential_1(v9, v10);
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 + 24)
                                                                              + **(int **)(v11 + 24));
    uint64_t v12 = (void *)swift_task_alloc();
    v0[15] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_25A2256E0;
    uint64_t v13 = v0[11];
    uint64_t v14 = v0[3];
    uint64_t v15 = v0[4];
    return v16(v13, v14, v15, v10, v11);
  }
}

uint64_t sub_25A2256E0(double a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 128) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 104);
    uint64_t v6 = *(void *)(v4 + 112);
    uint64_t v7 = sub_25A2258A4;
  }
  else
  {
    *(double *)(v4 + 136) = a1;
    uint64_t v5 = *(void *)(v4 + 104);
    uint64_t v6 = *(void *)(v4 + 112);
    uint64_t v7 = sub_25A225804;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_25A225804()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(__n128))v0[1];
  v5.n128_u64[0] = v0[17];
  return v4(v5);
}

uint64_t sub_25A2258A4()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25A225944()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v3 + 8) + 16))(v2);
}

uint64_t sub_25A225990()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v3 + 8) + 24))(v2);
}

uint64_t sub_25A2259DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v3 + 8) + 32))(v2);
}

uint64_t sub_25A225A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25A225AE4;
  return sub_25A225354(a1, a2, a3, a4);
}

uint64_t sub_25A225AE4(double a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  __n128 v5 = *(uint64_t (**)(__n128))(v7 + 8);
  if (!v1) {
    v4.n128_f64[0] = a1;
  }
  return v5(v4);
}

unint64_t sub_25A225BF4()
{
  unint64_t result = qword_26A40C520;
  if (!qword_26A40C520)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_26A40C520);
  }
  return result;
}

uint64_t sub_25A225C34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A225C9C()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25A225CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3[4];
  uint64_t v8 = v3[5];
  uint64_t v9 = v3[6];
  uint64_t v10 = v3[7];
  uint64_t v11 = v3[8];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_25A175068;
  return sub_25A22297C(a1, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t sub_25A225DD8()
{
  uint64_t v1 = type metadata accessor for PreviewAgentConnector();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(*(void *)(v1 - 8) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v7 = sub_25A236768();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
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
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v5 + 16, v4);
}

uint64_t sub_25A225F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(type metadata accessor for PreviewAgentConnector() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v10 = (*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = v3 + v9;
  uint64_t v12 = *(void *)(v3 + v10);
  uint64_t v13 = *(void *)(v3 + v10 + 8);
  uint64_t v14 = (uint64_t *)(v3 + ((v10 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v17;
  *uint64_t v17 = v4;
  v17[1] = sub_25A175068;
  return sub_25A2239D8(a1, a2, a3, v11, v12, v13, v15, v16);
}

uint64_t sub_25A2260F4(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25A175068;
  return sub_25A224BC8(a1, v5, v4);
}

uint64_t sub_25A2261A8()
{
  return 8;
}

void *sub_25A2261B4(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_25A2261C0()
{
  sub_25A226C04();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_25A226258(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_25A2368A8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
  }
  swift_retain();
  return a1;
}

uint64_t sub_25A2263D8(uint64_t a1)
{
  uint64_t v2 = sub_25A2368A8();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }

  return swift_release();
}

char *sub_25A2264A8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A2368A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = *((void *)v11 + 1);
  *(void *)uint64_t v10 = *(void *)v11;
  *((void *)v10 + 1) = v12;
  swift_retain();
  return a1;
}

char *sub_25A2265DC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A2368A8();
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
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_25A226780(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A2368A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 28)] = *(_OWORD *)&a2[*(int *)(a3 + 28)];
  return a1;
}

char *sub_25A2268A8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A2368A8();
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
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(_OWORD *)&a1[*(int *)(a3 + 28)] = *(_OWORD *)&a2[*(int *)(a3 + 28)];
  swift_release();
  return a1;
}

uint64_t sub_25A226A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A226A54);
}

uint64_t sub_25A226A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_25A226B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A226B2C);
}

uint64_t sub_25A226B2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailHostFactory()
{
  return __swift_instantiateGenericMetadata();
}

void sub_25A226C04()
{
  if (!qword_26A40C5E8)
  {
    sub_25A2368A8();
    unint64_t v0 = sub_25A2384F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A40C5E8);
    }
  }
}

uint64_t destroy for ThumbnailSceneCache()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ThumbnailSceneCache(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ThumbnailSceneCache(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ThumbnailSceneCache(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for ThumbnailSceneCache()
{
  return &type metadata for ThumbnailSceneCache;
}

uint64_t dispatch thunk of ThumbnailHost.displayThumbnailAndPerformHandshake(for:context:delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 24) + **(int **)(a5 + 24));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_25A226EF4;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_25A226EF4(double a1)
{
  uint64_t v6 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(__n128))(v6 + 8);
  v4.n128_f64[0] = a1;
  return v3(v4);
}

uint64_t dispatch thunk of ThumbnailFactory.generateThumbnail<A>(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 8)
                                                                                     + **(int **)(a6 + 8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_25A175068;
  return v15(a1, a2, a3, a4, a5, a6);
}

void *initializeBufferWithCopyOfBuffer for ThumbnailSceneCache.HostedAgent(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  id v4 = v3;
  return a1;
}

void destroy for ThumbnailSceneCache.HostedAgent(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *assignWithCopy for ThumbnailSceneCache.HostedAgent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  id v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for ThumbnailSceneCache.HostedAgent(uint64_t a1, _OWORD *a2)
{
  swift_release();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for ThumbnailSceneCache.HostedAgent()
{
  return &type metadata for ThumbnailSceneCache.HostedAgent;
}

unint64_t sub_25A227238()
{
  unint64_t result = qword_26A40C600;
  if (!qword_26A40C600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A40C600);
  }
  return result;
}

unint64_t sub_25A22728C()
{
  unint64_t result = qword_26A40C608;
  if (!qword_26A40C608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A40C608);
  }
  return result;
}

uint64_t sub_25A2272E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(int **)(v3 + 24);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_25A175068;
  unint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26A40C610 + dword_26A40C610);
  return v10(a1, a2, a3, v8);
}

uint64_t sub_25A2273C0(uint64_t a1, uint64_t *a2)
{
  id v6 = *(int **)(v2 + 24);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A1731E8;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_26A40C620 + dword_26A40C620);
  return v8(a1, a2, v6);
}

unint64_t sub_25A227490()
{
  unint64_t result = qword_26A40B2C8;
  if (!qword_26A40B2C8)
  {
    sub_25A236EC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A40B2C8);
  }
  return result;
}

uint64_t sub_25A2274E8(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for ThumbnailHostFactory.RemoteThumbnailHost()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A227548()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_25A227598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40B4B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A227600@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, void))v1[4];
  uint64_t v4 = v1[6];
  uint64_t v5 = v1[7];
  sub_25A225BF4();
  uint64_t v6 = *(int *)(swift_getTupleTypeMetadata2() + 48);
  uint64_t result = v3(a1, v4, *(void *)(v5 + 8));
  *(void *)(a1 + v6) = result;
  return result;
}

uint64_t sub_25A22768C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25A227750(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (int *)v2[4];
  uint64_t v7 = v2[5];
  uint64_t v8 = (uint64_t)v2
     + ((*(unsigned __int8 *)(*(void *)(v2[3] - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[3] - 8) + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_25A228050;
  return sub_25A222DC4(a1, a2, v6, v7, v8);
}

uint64_t type metadata accessor for ThumbnailHostFactory.LocalThumbnailHost()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A227874()
{
  uint64_t v1 = *(void *)(type metadata accessor for ThumbnailHostFactory() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = sub_25A2368A8();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_25A2279B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(type metadata accessor for ThumbnailHostFactory() - 8);
  uint64_t v10 = v3 + ((*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_25A175068;
  return sub_25A221D88(a1, a2, a3, v10, v8);
}

uint64_t type metadata accessor for OptionalStateWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A227AD0()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25A227B0C(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *sub_25A227B64(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t sub_25A227B8C(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_25A227BC8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25A227C10(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25A227C58(uint64_t a1, long long *a2)
{
  uint64_t v3 = *((void *)a2 + 2);
  long long v4 = *a2;
  *(_OWORD *)a1 = *a2;
  *(void *)(a1 + 16) = v3;
  id v5 = (id)v4;
  swift_retain();
  return a1;
}

uint64_t sub_25A227C9C(id *a1)
{
  return swift_release();
}

uint64_t sub_25A227CD8(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25A227D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t sub_25A227D7C(id *a1)
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_25A227DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  id v5 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_25A227E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_25A227ECC(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release();
  *(_OWORD *)(a1 + 32) = a2[2];
  swift_release();
  return a1;
}

uint64_t sub_25A227F2C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25A227F74(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for OptionalStateWrapper.NilState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A227FD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of static ServiceConnection.service.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ServiceConnection.init(serviceConnection:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ServiceConnection.onInvalidation(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_25A228094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A40AFA0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for JITManager.Storage.Record();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_25A16C2B8(a1, &qword_26A40AFA0);
    sub_25A228F7C(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_25A16C2B8((uint64_t)v10, &qword_26A40AFA0);
  }
  else
  {
    sub_25A22F6F0(a1, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_25A22CD34((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25A228264(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A40B200);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t updated = type metadata accessor for UpdateRegistry.Update();
  MEMORY[0x270FA5388](updated);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_25A16C2B8(a1, &qword_26A40B200);
    sub_25A229120(a2, (uint64_t)v8);
    uint64_t v13 = sub_25A236858();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_25A16C2B8((uint64_t)v8, &qword_26A40B200);
  }
  else
  {
    sub_25A22F6F0(a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25A22CEA0((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25A236858();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_25A228484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A40B8F8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25A237AC8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_25A16C2B8(a1, &qword_26A40B8F8);
    sub_25A229310(a2, a3, MEMORY[0x263F880F8], MEMORY[0x263F880F8], &qword_26A40C8B0, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_25A16C2B8((uint64_t)v10, &qword_26A40B8F8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_25A22D098((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native, MEMORY[0x263F880F8], &qword_26A40C8B0, MEMORY[0x263F880F8]);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25A2286A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A40BA50);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25A237908();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_25A16C2B8(a1, &qword_26A40BA50);
    unint64_t v13 = sub_25A17E930(a2);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_25A22EC90();
        uint64_t v17 = v21;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, v9);
      sub_25A22C210(v15, v17);
      *uint64_t v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_25A16C2B8((uint64_t)v8, &qword_26A40BA50);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25A22D258((uint64_t)v12, a2, v18);
    *uint64_t v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25A2288FC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_25A174C70((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_25A22D720(v9, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v8;
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_25A236318();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_25A16C2B8(a1, &qword_26A40C888);
    sub_25A229638(a2, (uint64_t)v9);
    uint64_t v7 = sub_25A236318();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a2, v7);
    return sub_25A16C2B8((uint64_t)v9, &qword_26A40C888);
  }
}

void PreviewAgentLauncherRegistry.init()(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE80];
}

uint64_t PreviewAgentLauncherRegistry.registerLauncher(_:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_25A237868();
  uint64_t v27 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A236318();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v25 - v13;
  uint64_t v15 = *v2;
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_25A17E974(a2), (v17 & 1) != 0))
  {
    sub_25A172978(*(void *)(v15 + 56) + 40 * v16, (uint64_t)v29);
    sub_25A16C2B8((uint64_t)v29, &qword_26A40C888);
    sub_25A237828();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
    char v18 = sub_25A237858();
    os_log_type_t v19 = sub_25A238448();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(void *)&v29[0] = v21;
      uint64_t v26 = v5;
      *(_DWORD *)uint64_t v20 = 136446210;
      uint64_t v25 = v20 + 4;
      uint64_t v22 = sub_25A236308();
      uint64_t v28 = sub_25A172A44(v22, v23, (uint64_t *)v29);
      sub_25A238548();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      _os_log_impl(&dword_25A167000, v18, v19, "Skipping duplicate preview agent launcher for %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2FAAE0](v21, -1, -1);
      MEMORY[0x25A2FAAE0](v20, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v7, v26);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

      return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v7, v5);
    }
  }
  else
  {
    uint64_t v30 = 0;
    memset(v29, 0, sizeof(v29));
    sub_25A16C2B8((uint64_t)v29, &qword_26A40C888);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, a2, v8);
    sub_25A172978(a1, (uint64_t)v29);
    return sub_25A2288FC((uint64_t)v29, (uint64_t)v14);
  }
}

double PreviewAgentLauncherRegistry.subscript.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *v2;
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_25A17E974(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(v4 + 56) + 40 * v5;
    sub_25A172978(v7, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewAgentLauncherRegistry()
{
  return &type metadata for PreviewAgentLauncherRegistry;
}

uint64_t sub_25A228E24(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_25A17E688(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25A22F0DC(MEMORY[0x263F60460], &qword_26A40C8C0);
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_25A236EC8();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_25A22C3E0(v4, v7, MEMORY[0x263F60460], &qword_26A40A050, MEMORY[0x263F60460], MEMORY[0x263F60468]);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25A228F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_25A17E75C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25A22E3B4();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for JITManager.Storage.Record();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_25A22F6F0(v12 + *(void *)(v20 + 72) * v8, a3, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
    sub_25A22BA98(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
    char v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for JITManager.Storage.Record();
    char v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_25A229120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25A17E7E4(a1);
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
      sub_25A22E638();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_25A236858();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t updated = type metadata accessor for UpdateRegistry.Update();
    uint64_t v20 = *(void *)(updated - 8);
    sub_25A22F6F0(v12 + *(void *)(v20 + 72) * v6, a2, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
    sub_25A22BCA8(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    char v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = updated;
  }
  else
  {
    uint64_t v18 = type metadata accessor for UpdateRegistry.Update();
    char v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_25A2292EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25A229310(a1, a2, MEMORY[0x263F60BA0], MEMORY[0x263F60BA0], &qword_26A40AA08, a3);
}

uint64_t sub_25A229310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10 = v6;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_25A17E8B8(a1, a2);
  LOBYTE(a2) = v15;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v10;
    uint64_t v27 = *v10;
    *uint64_t v10 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25A22E9CC(a4, a5);
      uint64_t v17 = v27;
    }
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)(v17 + 56);
    uint64_t v19 = a3(0);
    uint64_t v26 = *(void *)(v19 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v26 + 32))(a6, v18 + *(void *)(v26 + 72) * v14, v19);
    sub_25A22BFF0(v14, v17, a4);
    *uint64_t v10 = v17;
    swift_bridgeObjectRelease();
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
    uint64_t v21 = a6;
    uint64_t v22 = 0;
    uint64_t v23 = v19;
  }
  else
  {
    uint64_t v24 = a3(0);
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
    uint64_t v23 = v24;
    uint64_t v21 = a6;
    uint64_t v22 = 1;
  }

  return v20(v21, v22, 1, v23);
}

uint64_t sub_25A2294E0(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_25A17E7E4(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25A22F0DC(MEMORY[0x263F60A78], &qword_26A40C8A8);
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_25A236858();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_25A22C3E0(v4, v7, MEMORY[0x263F60A78], &qword_26A40A030, MEMORY[0x263F60A78], MEMORY[0x263F60A80]);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_25A229638@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25A17E974(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25A22F374();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_25A236318();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_25A174C70((long long *)(*(void *)(v9 + 56) + 40 * v6), a2);
    sub_25A22C6C0(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_25A22976C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ContentKey();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40AA28);
  uint64_t v10 = (void *)sub_25A2386D8();
  if (*(void *)(v9 + 16))
  {
    uint64_t v26 = v3;
    uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v12 = (void *)(v9 + 64);
    uint64_t v13 = -1;
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    unint64_t v14 = v13 & *(void *)(v9 + 64);
    int64_t v15 = (unint64_t)(v11 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    while (1)
    {
      if (v14)
      {
        unint64_t v18 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v19 = v18 | (v17 << 6);
      }
      else
      {
        int64_t v20 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v20 >= v15) {
          goto LABEL_23;
        }
        unint64_t v21 = v12[v20];
        ++v17;
        if (!v21)
        {
          int64_t v17 = v20 + 1;
          if (v20 + 1 >= v15) {
            goto LABEL_23;
          }
          unint64_t v21 = v12[v17];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v15)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v26;
                goto LABEL_30;
              }
              uint64_t v24 = 1 << *(unsigned char *)(v9 + 32);
              if (v24 >= 64) {
                bzero((void *)(v9 + 64), ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v12 = -1 << v24;
              }
              uint64_t v3 = v26;
              *(void *)(v9 + 16) = 0;
              break;
            }
            unint64_t v21 = v12[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v17 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_32;
                }
                if (v17 >= v15) {
                  goto LABEL_23;
                }
                unint64_t v21 = v12[v17];
                ++v22;
                if (v21) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v17 = v22;
          }
        }
LABEL_20:
        unint64_t v14 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v17 << 6);
      }
      uint64_t v23 = *(void *)(v9 + 48) + *(void *)(v6 + 72) * v19;
      if (a2) {
        sub_25A22F6F0(v23, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ContentKey);
      }
      else {
        sub_25A22F688(v23, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ContentKey);
      }
      uint64_t result = sub_25A22D8FC((uint64_t)v8, *(void *)(*(void *)(v9 + 56) + 16 * v19), *(void *)(*(void *)(v9 + 56) + 16 * v19 + 8), v10);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_25A229A1C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25A236EC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8C0);
  int v46 = a2;
  uint64_t v10 = sub_25A2386D8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_25A22F758(&qword_26A40A050, MEMORY[0x263F60460]);
    uint64_t result = sub_25A237FB8();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_25A229E40(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for JITManager.Storage.Record();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40AA18);
  int v43 = a2;
  uint64_t v9 = sub_25A2386D8();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  int64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
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
    if (v22 >= v40) {
      break;
    }
    unint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
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
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    unint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_25A22F6F0(v30, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
    }
    else
    {
      sub_25A22F688(v30, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
      swift_bridgeObjectRetain();
    }
    sub_25A2387F8();
    swift_bridgeObjectRetain();
    sub_25A238098();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25A238838();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *unint64_t v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_25A22F6F0((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_25A22A230(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t updated = type metadata accessor for UpdateRegistry.Update();
  uint64_t v49 = *(void *)(updated - 8);
  MEMORY[0x270FA5388](updated - 8);
  uint64_t v54 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25A236858();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v51 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C890);
  int v50 = a2;
  uint64_t v11 = v10;
  uint64_t v12 = sub_25A2386D8();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  int v46 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v44 = v2;
  int64_t v45 = (unint64_t)(v14 + 63) >> 6;
  v47 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  v52 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v53 = v7;
  uint64_t v18 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v48 = v11;
  unint64_t v21 = v51;
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
    unint64_t v21 = v51;
LABEL_22:
    uint64_t v29 = v8;
    uint64_t v30 = *(void *)(v8 + 72);
    unint64_t v31 = *(void *)(v11 + 48) + v30 * v24;
    if (v50)
    {
      (*v52)(v21, v31, v53);
      uint64_t v32 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_25A22F6F0(v32 + v33 * v24, v54, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
    }
    else
    {
      (*v47)(v21, v31, v53);
      uint64_t v34 = *(void *)(v11 + 56);
      uint64_t v33 = *(void *)(v49 + 72);
      sub_25A22F688(v34 + v33 * v24, v54, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
    }
    sub_25A22F758(&qword_26A40A030, MEMORY[0x263F60A78]);
    uint64_t result = sub_25A237FB8();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      unint64_t v21 = v51;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      unint64_t v21 = v51;
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
    uint64_t result = sub_25A22F6F0(v54, *(void *)(v13 + 56) + v33 * v22, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
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

uint64_t sub_25A22A748(uint64_t a1, int a2)
{
  return sub_25A22A768(a1, a2, MEMORY[0x263F60BA0], &qword_26A40AA08);
}

uint64_t sub_25A22A768(uint64_t a1, int a2, uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v6 = v4;
  uint64_t v52 = a3(0);
  uint64_t v8 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  v51 = (char *)&v44 - v9;
  uint64_t v10 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  int v50 = a2;
  uint64_t v11 = sub_25A2386D8();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 64);
  v47 = (void *)(v10 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  int64_t v45 = v4;
  int64_t v46 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v48 = (void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v49 = v8;
  unint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  uint64_t v18 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
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
    if (v25 >= v46) {
      break;
    }
    unint64_t v26 = v47;
    unint64_t v27 = v47[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v46) {
        goto LABEL_34;
      }
      unint64_t v27 = v47[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v46)
        {
LABEL_34:
          swift_release();
          uint64_t v6 = v45;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v47[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v46) {
              goto LABEL_34;
            }
            unint64_t v27 = v47[v20];
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
    unint64_t v16 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v10 + 56);
    uint64_t v30 = v10;
    unint64_t v31 = (uint64_t *)(*(void *)(v10 + 48) + 16 * v24);
    uint64_t v32 = *v31;
    uint64_t v33 = v31[1];
    uint64_t v34 = *(void *)(v49 + 72);
    uint64_t v35 = v29 + v34 * v24;
    if (v50)
    {
      (*v17)(v51, v35, v52);
    }
    else
    {
      (*v48)(v51, v35, v52);
      swift_bridgeObjectRetain();
    }
    sub_25A2387F8();
    sub_25A238098();
    uint64_t result = sub_25A238838();
    uint64_t v36 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1 << v37) & ~*(void *)(v18 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v37) & ~*(void *)(v18 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v18 + 8 * v38);
      }
      while (v42 == -1);
      unint64_t v21 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    unint64_t v22 = (void *)(*(void *)(v12 + 48) + 16 * v21);
    *unint64_t v22 = v32;
    v22[1] = v33;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 56) + v34 * v21, v51, v52);
    ++*(void *)(v12 + 16);
    uint64_t v10 = v30;
  }
  swift_release();
  uint64_t v6 = v45;
  unint64_t v26 = v47;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v43 = 1 << *(unsigned char *)(v10 + 32);
  if (v43 >= 64) {
    bzero(v26, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v26 = -1 << v43;
  }
  *(void *)(v10 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v6 = v12;
  return result;
}

uint64_t sub_25A22AB54(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = sub_25A237908();
  uint64_t v5 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8B8);
  int v40 = a2;
  uint64_t result = sub_25A2386D8();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v36 = v3;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    unint64_t v38 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v37 = (unint64_t)(v13 + 63) >> 6;
    char v39 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    unint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v17 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v19 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v20 = v19 | (v11 << 6);
      }
      else
      {
        int64_t v21 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v38;
        if (v21 >= v37) {
          goto LABEL_34;
        }
        unint64_t v22 = v38[v21];
        ++v11;
        if (!v22)
        {
          int64_t v11 = v21 + 1;
          if (v21 + 1 >= v37) {
            goto LABEL_34;
          }
          unint64_t v22 = v38[v11];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v37)
            {
LABEL_34:
              if ((v40 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v36;
                goto LABEL_41;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
              if (v35 >= 64) {
                bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *unint64_t v38 = -1 << v35;
              }
              uint64_t v3 = v36;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v22 = v38[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v11 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v37) {
                  goto LABEL_34;
                }
                unint64_t v22 = v38[v11];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v23;
          }
        }
LABEL_21:
        unint64_t v15 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v11 << 6);
      }
      uint64_t v24 = *(void *)(*(void *)(v8 + 48) + 8 * v20);
      uint64_t v25 = v5;
      uint64_t v26 = *(void *)(v5 + 72);
      unint64_t v27 = *(void *)(v8 + 56) + v26 * v20;
      if (v40) {
        (*v16)(v7, v27, v41);
      }
      else {
        (*v39)(v7, v27, v41);
      }
      uint64_t result = sub_25A2387E8();
      uint64_t v28 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v17 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v29) & ~*(void *)(v17 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v17 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v18 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v17 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v10 + 48) + 8 * v18) = v24;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v10 + 56) + v26 * v18, v7, v41);
      ++*(void *)(v10 + 16);
      uint64_t v5 = v25;
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_25A22AEFC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8A0);
  char v42 = a2;
  uint64_t v6 = sub_25A2386D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25A2387F8();
    sub_25A238098();
    uint64_t result = sub_25A238838();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25A22B224(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25A236858();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8A8);
  int v46 = a2;
  uint64_t v10 = sub_25A2386D8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  int64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_25A22F758(&qword_26A40A030, MEMORY[0x263F60A78]);
    uint64_t result = sub_25A237FB8();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_25A22B648(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_25A236318();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C898);
  int v45 = a2;
  uint64_t v9 = sub_25A2386D8();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  int64_t v40 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v38 = v2;
  int64_t v39 = (unint64_t)(v11 + 63) >> 6;
  int64_t v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  int v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  uint64_t v42 = v8;
  uint64_t v43 = v7;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v39) {
      break;
    }
    unint64_t v22 = v40;
    unint64_t v23 = v40[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v23 = v40[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v40[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v39) {
              goto LABEL_34;
            }
            unint64_t v23 = v40[v17];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v24;
      }
    }
LABEL_21:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    uint64_t v25 = v5;
    uint64_t v26 = *(void *)(v5 + 72);
    unint64_t v27 = *(void *)(v8 + 48) + v26 * v20;
    uint64_t v28 = v43;
    uint64_t v29 = v44;
    if (v45)
    {
      (*v46)(v43, v27, v44);
      sub_25A174C70((long long *)(*(void *)(v8 + 56) + 40 * v20), (uint64_t)v47);
    }
    else
    {
      (*v41)(v43, v27, v44);
      sub_25A172978(*(void *)(v8 + 56) + 40 * v20, (uint64_t)v47);
    }
    sub_25A22F758(&qword_26A40A040, MEMORY[0x263F60788]);
    uint64_t result = sub_25A237FB8();
    uint64_t v30 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    (*v46)((char *)(*(void *)(v10 + 48) + v26 * v18), (unint64_t)v28, v29);
    uint64_t result = sub_25A174C70(v47, *(void *)(v10 + 56) + 40 * v18);
    ++*(void *)(v10 + 16);
    uint64_t v5 = v25;
    uint64_t v8 = v42;
  }
  swift_release();
  uint64_t v3 = v38;
  unint64_t v22 = v40;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v8 + 32);
  if (v37 >= 64) {
    bzero(v22, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v37;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_25A22BA98(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25A238588();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_25A2387F8();
        swift_bridgeObjectRetain();
        sub_25A238098();
        uint64_t v9 = sub_25A238838();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for JITManager.Storage.Record() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25A22BCA8(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A236858();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_25A238588();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_25A22F758(&qword_26A40A030, MEMORY[0x263F60A78]);
        uint64_t v19 = sub_25A237FB8();
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
            uint64_t v24 = *(void *)(*(void *)(type metadata accessor for UpdateRegistry.Update() - 8) + 72);
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

unint64_t sub_25A22BFF0(unint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  int64_t v4 = result;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(void *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    uint64_t v9 = ~v6;
    unint64_t result = sub_25A238588();
    if ((*(void *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      unint64_t v10 = (result + 1) & v9;
      while (1)
      {
        sub_25A2387F8();
        swift_bridgeObjectRetain();
        sub_25A238098();
        uint64_t v11 = sub_25A238838();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v9;
        if (v4 >= (uint64_t)v10) {
          break;
        }
        if (v12 < v10) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (_OWORD *)(v13 + 16 * v4);
        uint64_t v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1) {
          *uint64_t v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(a3(0) - 8) + 72);
        int64_t v18 = v17 * v4;
        unint64_t result = v16 + v17 * v4;
        int64_t v19 = v17 * v7;
        unint64_t v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v4 = v7;
          if (v18 == v19) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v4 = v7;
LABEL_6:
        unint64_t v7 = (v7 + 1) & v9;
        if (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v10) {
        goto LABEL_6;
      }
LABEL_11:
      if (v4 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v4) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *uint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25A22C210(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_25A238588();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        unint64_t result = sub_25A2387E8();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        uint64_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *uint64_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t v16 = *(void *)(*(void *)(sub_25A237908() - 8) + 72);
        int64_t v17 = v16 * v3;
        unint64_t result = v15 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25A22C3E0(int64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v43 = a4;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t result = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = a2 + 64;
  uint64_t v14 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v15 = (a1 + 1) & ~v14;
  if (((1 << v15) & *(void *)(a2 + 64 + 8 * (v15 >> 6))) != 0)
  {
    uint64_t v16 = ~v14;
    unint64_t result = sub_25A238588();
    if ((*(void *)(v13 + 8 * (v15 >> 6)) & (1 << v15)) != 0)
    {
      uint64_t v17 = (result + 1) & v16;
      int64_t v41 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v42 = v9 + 16;
      uint64_t v46 = *(void *)(v9 + 72);
      uint64_t v40 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
      do
      {
        uint64_t v18 = v13;
        int64_t v19 = v46 * v15;
        v41(v12, *(void *)(a2 + 48) + v46 * v15, v8);
        unint64_t v20 = v17;
        uint64_t v21 = v16;
        sub_25A22F758(v43, v44);
        uint64_t v22 = sub_25A237FB8();
        unint64_t result = (*v40)(v12, v8);
        uint64_t v23 = v22 & v21;
        uint64_t v16 = v21;
        uint64_t v17 = v20;
        if (a1 >= (uint64_t)v20)
        {
          if (v23 >= v20 && a1 >= v23)
          {
LABEL_17:
            uint64_t v26 = *(void *)(a2 + 48);
            unint64_t result = v26 + v46 * a1;
            unint64_t v27 = v26 + v19 + v46;
            if (v46 * a1 < v19 || result >= v27)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              uint64_t v13 = v18;
            }
            else
            {
              BOOL v29 = v46 * a1 == v19;
              uint64_t v13 = v18;
              if (!v29) {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t v30 = *(void *)(a2 + 56);
            uint64_t v31 = (void *)(v30 + 8 * a1);
            uint64_t v32 = (void *)(v30 + 8 * v15);
            if (a1 != v15 || (a1 = v15, v31 >= v32 + 1))
            {
              *uint64_t v31 = *v32;
              a1 = v15;
            }
            goto LABEL_5;
          }
        }
        else if (v23 >= v20 || a1 >= v23)
        {
          goto LABEL_17;
        }
        uint64_t v13 = v18;
LABEL_5:
        unint64_t v15 = (v15 + 1) & v16;
      }
      while (((*(void *)(v13 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) != 0);
    }
    BOOL v33 = (uint64_t *)(v13 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v34 = *v33;
    uint64_t v35 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v33 = (uint64_t *)(v13 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v35 = *v33;
    uint64_t v34 = (-1 << a1) - 1;
  }
  *BOOL v33 = v35 & v34;
  uint64_t v36 = *(void *)(a2 + 16);
  BOOL v37 = __OFSUB__(v36, 1);
  uint64_t v38 = v36 - 1;
  if (v37)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v38;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25A22C6C0(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A236318();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_25A238588();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      unint64_t v37 = (result + 1) & v12;
      uint64_t v38 = v13;
      uint64_t v14 = *(void *)(v5 + 72);
      uint64_t v39 = v5 + 16;
      uint64_t v36 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v15 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v14;
        int64_t v18 = v14 * v11;
        uint64_t v19 = v15;
        v38(v8, *(void *)(a2 + 48) + v14 * v11, v4);
        sub_25A22F758(&qword_26A40A040, MEMORY[0x263F60788]);
        uint64_t v20 = sub_25A237FB8();
        unint64_t result = (*v36)(v8, v4);
        uint64_t v15 = v19;
        unint64_t v21 = v20 & v19;
        if (a1 >= (uint64_t)v37)
        {
          if (v21 >= v37 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            uint64_t v24 = *(void *)(a2 + 48);
            unint64_t result = v24 + v17 * a1;
            uint64_t v9 = v16;
            if (v17 * a1 < v18 || (uint64_t v14 = v17, result >= v24 + v18 + v17))
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              uint64_t v14 = v17;
              uint64_t v15 = v19;
            }
            else if (v17 * a1 != v18)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            uint64_t v25 = *(void *)(a2 + 56);
            unint64_t v26 = v25 + 40 * a1;
            unint64_t v27 = (long long *)(v25 + 40 * v11);
            if (a1 != v11 || (a1 = v11, v26 >= (unint64_t)v27 + 40))
            {
              long long v28 = *v27;
              long long v29 = v27[1];
              *(void *)(v26 + 32) = *((void *)v27 + 4);
              *(_OWORD *)unint64_t v26 = v28;
              *(_OWORD *)(v26 + 16) = v29;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v37 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
        uint64_t v14 = v17;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v15;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  *uint64_t v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25A22C9DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = type metadata accessor for ContentKey();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_25A17E358(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t result = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= result && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v21 = *v5;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = (uint64_t *)(v21[7] + 16 * v15);
      *uint64_t v22 = a1;
      v22[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25A22E138();
    goto LABEL_7;
  }
  sub_25A22976C(result, a4 & 1);
  uint64_t result = sub_25A17E358(a3);
  if ((v19 & 1) != (v23 & 1))
  {
LABEL_14:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
  unint64_t v15 = result;
  unint64_t v21 = *v5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  sub_25A22F688(a3, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ContentKey);
  return sub_25A22DBE8(v15, (uint64_t)v12, a1, a2, v21);
}

uint64_t sub_25A22CB5C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25A236EC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25A17E688(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_25A22F0DC(MEMORY[0x263F60460], &qword_26A40C8C0);
    goto LABEL_7;
  }
  sub_25A229A1C(v17, a3 & 1);
  unint64_t v23 = sub_25A17E688(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_25A22DFB8(v14, (uint64_t)v11, a1, v20, MEMORY[0x263F60460]);
}

uint64_t sub_25A22CD34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_25A17E75C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    char v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t v20 = type metadata accessor for JITManager.Storage.Record();
      return sub_25A22F620(a1, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v12, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_25A22E3B4();
    goto LABEL_7;
  }
  sub_25A229E40(v15, a4 & 1);
  unint64_t v22 = sub_25A17E75C(a2, a3);
  if ((v16 & 1) != (v23 & 1))
  {
LABEL_15:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
  unint64_t v12 = v22;
  char v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_25A22DCA4(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_25A22CEA0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25A236858();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25A17E7E4(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t updated = type metadata accessor for UpdateRegistry.Update();
      return sub_25A22F620(a1, v21 + *(void *)(*(void *)(updated - 8) + 72) * v14, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_25A22E638();
    goto LABEL_7;
  }
  sub_25A22A230(v17, a3 & 1);
  unint64_t v24 = sub_25A17E7E4(a2);
  if ((v18 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
  unint64_t v14 = v24;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_25A22DD50(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_25A22D074(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_25A22D098(a1, a2, a3, a4, MEMORY[0x263F60BA0], &qword_26A40AA08, MEMORY[0x263F60BA0]);
}

uint64_t sub_25A22D098(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(void), uint64_t *a6, uint64_t (*a7)(void))
{
  uint64_t v10 = (void **)v7;
  uint64_t v15 = (void *)*v7;
  unint64_t v17 = sub_25A17E8B8(a2, a3);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 < v20 || (a4 & 1) == 0)
  {
    if (v22 >= v20 && (a4 & 1) == 0)
    {
      sub_25A22E9CC(a5, a6);
      goto LABEL_7;
    }
    sub_25A22A768(v20, a4 & 1, a5, a6);
    unint64_t v31 = sub_25A17E8B8(a2, a3);
    if ((v21 & 1) == (v32 & 1))
    {
      unint64_t v17 = v31;
      char v23 = *v10;
      if (v21) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
LABEL_7:
  char v23 = *v10;
  if (v21)
  {
LABEL_8:
    uint64_t v24 = v23[7];
    uint64_t v25 = a7(0);
    uint64_t v26 = *(void *)(v25 - 8);
    unint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 40);
    uint64_t v28 = v25;
    uint64_t v29 = v24 + *(void *)(v26 + 72) * v17;
    return v27(v29, a1, v28);
  }
LABEL_13:
  sub_25A22DE58(v17, a2, a3, a1, v23, a5);

  return swift_bridgeObjectRetain();
}

uint64_t sub_25A22D258(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_25A17E930(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_25A22EC90();
      goto LABEL_7;
    }
    sub_25A22AB54(v13, a3 & 1);
    unint64_t v24 = sub_25A17E930(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = sub_25A237908();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:

  return sub_25A22DF0C(v10, a2, a1, v16);
}

uint64_t sub_25A22D3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_25A17E8B8(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_25A22EF20();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_25A22AEFC(v17, a5 & 1);
  unint64_t v23 = sub_25A17E8B8(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  char v25 = (uint64_t *)(v20[6] + 16 * v14);
  *char v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_25A22D548(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25A236858();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25A17E7E4(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_25A22F0DC(MEMORY[0x263F60A78], &qword_26A40C8A8);
    goto LABEL_7;
  }
  sub_25A22B224(v17, a3 & 1);
  unint64_t v23 = sub_25A17E7E4(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_25A22DFB8(v14, (uint64_t)v11, a1, v20, MEMORY[0x263F60A78]);
}

uint64_t sub_25A22D720(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25A236318();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25A17E974(a2);
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
      sub_25A22F374();
      goto LABEL_7;
    }
    sub_25A22B648(v17, a3 & 1);
    unint64_t v23 = sub_25A17E974(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_25A22E074(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_25A238788();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7] + 40 * v14;
  __swift_destroy_boxed_opaque_existential_1Tm(v21);

  return sub_25A174C70(a1, v21);
}

uint64_t sub_25A22D8FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_25A2367A8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409F60);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A2387F8();
  sub_25A236798();
  sub_25A22F758(&qword_26A409F78, MEMORY[0x263F60940]);
  sub_25A237FC8();
  uint64_t v15 = type metadata accessor for ContentKey();
  sub_25A17CAF4(a1 + *(int *)(v15 + 20), (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_25A238818();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v14, v8);
    sub_25A238818();
    sub_25A22F758(&qword_26A409F80, MEMORY[0x263F60968]);
    sub_25A237FC8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  sub_25A238838();
  unint64_t v16 = sub_25A238598();
  *(void *)((char *)a4 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v16;
  uint64_t result = sub_25A22F6F0(a1, a4[6] + *(void *)(*(void *)(v15 - 8) + 72) * v16, (uint64_t (*)(void))type metadata accessor for ContentKey);
  char v18 = (void *)(a4[7] + 16 * v16);
  *char v18 = a2;
  v18[1] = a3;
  ++a4[2];
  return result;
}

uint64_t sub_25A22DBE8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = type metadata accessor for ContentKey();
  uint64_t result = sub_25A22F6F0(a2, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for ContentKey);
  uint64_t v13 = (void *)(a5[7] + 16 * a1);
  *uint64_t v13 = a3;
  v13[1] = a4;
  uint64_t v14 = a5[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a5[2] = v16;
  }
  return result;
}

uint64_t sub_25A22DCA4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for JITManager.Storage.Record();
  uint64_t result = sub_25A22F6F0(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
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

uint64_t sub_25A22DD50(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25A236858();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t updated = type metadata accessor for UpdateRegistry.Update();
  uint64_t result = sub_25A22F6F0(a3, v10 + *(void *)(*(void *)(updated - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
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

uint64_t sub_25A22DE40(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_25A22DE58(a1, a2, a3, a4, a5, MEMORY[0x263F60BA0]);
}

uint64_t sub_25A22DE58(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(void))
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = (void *)(a5[6] + 16 * a1);
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t v10 = a5[7];
  uint64_t v11 = a6(0);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a4, v11);
  uint64_t v13 = a5[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a5[2] = v15;
  }
  return result;
}

uint64_t sub_25A22DF0C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_25A237908();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_25A22DFB8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = a4[6];
  uint64_t v10 = a5(0);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a2, v10);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v12 = a4[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a4[2] = v14;
  }
  return result;
}

uint64_t sub_25A22E074(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25A236318();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_25A174C70(a3, a4[7] + 40 * a1);
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

void *sub_25A22E138()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ContentKey();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40AA28);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25A2386C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  char v24 = v1;
  uint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v25 + 72) * v17;
    sub_25A22F688(*(void *)(v5 + 48) + v18, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ContentKey);
    uint64_t v19 = 16 * v17;
    uint64_t v20 = *(void *)(v7 + 48) + v18;
    long long v26 = *(_OWORD *)(*(void *)(v5 + 56) + v19);
    uint64_t result = (void *)sub_25A22F6F0((uint64_t)v4, v20, (uint64_t (*)(void))type metadata accessor for ContentKey);
    *(_OWORD *)(*(void *)(v7 + 56) + v19) = v26;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_25A22E3B4()
{
  uint64_t v1 = type metadata accessor for JITManager.Storage.Record();
  uint64_t v27 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40AA18);
  char v24 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_25A2386C8();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *char v24 = v6;
    return result;
  }
  uint64_t result = (void *)(v5 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v4 || (unint64_t)result >= v4 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v8);
  }
  uint64_t v25 = v4 + 64;
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v4 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v4 + 64);
  int64_t v26 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v13 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v14 = v13 | (v9 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v14 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_9:
    uint64_t v15 = 16 * v14;
    unint64_t v16 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    unint64_t v19 = *(void *)(v27 + 72) * v14;
    sub_25A22F688(*(void *)(v4 + 56) + v19, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
    uint64_t v20 = (void *)(*(void *)(v6 + 48) + v15);
    *uint64_t v20 = v17;
    v20[1] = v18;
    sub_25A22F6F0((uint64_t)v3, *(void *)(v6 + 56) + v19, (uint64_t (*)(void))type metadata accessor for JITManager.Storage.Record);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

char *sub_25A22E638()
{
  uint64_t updated = type metadata accessor for UpdateRegistry.Update();
  uint64_t v40 = *(void *)(updated - 8);
  MEMORY[0x270FA5388](updated - 8);
  uint64_t v39 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_25A236858();
  uint64_t v3 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  unint64_t v37 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C890);
  char v32 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25A2386C8();
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
        uint64_t result = (char *)sub_25A22F6F0(v18, *(void *)(i + 56) + v25, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update))
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
    sub_25A22F688(v24 + v25, v18, (uint64_t (*)(void))type metadata accessor for UpdateRegistry.Update);
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

void *sub_25A22E9AC()
{
  return sub_25A22E9CC(MEMORY[0x263F60BA0], &qword_26A40AA08);
}

void *sub_25A22E9CC(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v39 = a1(0);
  uint64_t v4 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v6 = (char *)&v33 - v5;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  int64_t v34 = v2;
  uint64_t v7 = *v2;
  uint64_t v8 = sub_25A2386C8();
  uint64_t v9 = *(void *)(v7 + 16);
  uint64_t v40 = v8;
  if (!v9)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v32 = v40;
    uint64_t v31 = v34;
LABEL_28:
    *uint64_t v31 = v32;
    return result;
  }
  uint64_t v10 = v8;
  uint64_t result = (void *)(v8 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12)
  {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v12);
    uint64_t v10 = v40;
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v7 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v7 + 64);
  uint64_t v35 = v7 + 64;
  int64_t v36 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v37 = v4 + 32;
  uint64_t v38 = v4 + 16;
  uint64_t v18 = v39;
  while (1)
  {
    if (v17)
    {
      unint64_t v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    ++v14;
    if (!v29)
    {
      int64_t v14 = v28 + 1;
      if (v28 + 1 >= v36) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v14);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v29 - 1) & v29;
    unint64_t v20 = __clz(__rbit64(v29)) + (v14 << 6);
LABEL_12:
    uint64_t v21 = 16 * v20;
    uint64_t v22 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v20);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    unint64_t v25 = *(void *)(v4 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 56) + v25, v18);
    uint64_t v26 = v40;
    unint64_t v27 = (void *)(*(void *)(v40 + 48) + v21);
    *unint64_t v27 = v23;
    v27[1] = v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v26 + 56) + v25, v6, v18);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v34;
    uint64_t v32 = v40;
    goto LABEL_28;
  }
  unint64_t v29 = *(void *)(v35 + 8 * v30);
  if (v29)
  {
    int64_t v14 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v14 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v14);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25A22EC90()
{
  uint64_t v1 = sub_25A237908();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8B8);
  uint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25A2386C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *uint64_t v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v5 + 48) + 8 * v15);
    unint64_t v18 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v18, v1);
    *(void *)(*(void *)(v7 + 48) + v16) = v17;
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v18, v4, v1);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_25A22EF20()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A2386C8();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25A22F0DC(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v26 - v6;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  int64_t v27 = v2;
  uint64_t v8 = *v2;
  uint64_t v9 = sub_25A2386C8();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *int64_t v27 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v8 + 64);
  uint64_t v28 = v8 + 64;
  int64_t v29 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v30 = v5 + 32;
  uint64_t v31 = v5 + 16;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v19 = v18 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v29) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v14);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v24 - 1) & v24;
    unint64_t v19 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_12:
    unint64_t v20 = *(void *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v20, v4);
    uint64_t v21 = 8 * v19;
    uint64_t v22 = *(void *)(*(void *)(v8 + 56) + 8 * v19);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(void *)(v10 + 48) + v20, v7, v4);
    *(void *)(*(void *)(v10 + 56) + v21) = v22;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v29) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v14 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v14 >= v29) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v14);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25A22F374()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25A236318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C898);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_25A2386C8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  int64_t v23 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 40 * v16;
    sub_25A172978(*(void *)(v6 + 56) + v18, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = (void *)sub_25A174C70(v27, *(void *)(v8 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25A22F620(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A22F688(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A22F6F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A22F758(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_25A22F7A4@<D0>(uint64_t a1@<X8>)
{
  return static PreviewShellPlugin.previewShellSceneBinder.getter(a1);
}

double static PreviewShellPlugin.previewShellSceneBinder.getter@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t dispatch thunk of static PreviewShellPlugin.registerProviders(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static PreviewShellPlugin.registerLaunchers(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static PreviewShellPlugin.previewShellSceneConfigurator.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static PreviewShellPlugin.previewShellSceneBinder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t PreviewAgentConnector.nonUIAgentProxy.getter(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return MEMORY[0x270FA2498](sub_25A22F844, 0, 0);
}

uint64_t sub_25A22F844()
{
  uint64_t v1 = *(int **)(v0 + 40);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)((char *)v1 + *(int *)(type metadata accessor for PreviewAgentConnector() + 24) + 48);
  int v2 = *v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25A22F904;
  uint64_t v4 = *(void *)(v0 + 32);
  return SharedAgentServer<>.requestPreviewNonUIAgent(for:)(v4, v2);
}

uint64_t sub_25A22F904()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25A22FA38, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25A22FA38()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for PreviewAgentConnector()
{
  uint64_t result = qword_26A40C928;
  if (!qword_26A40C928) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id static AgentSceneConfiguration.previewSceneConfiguration(in:specification:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  unint64_t v20 = a3;
  uint64_t v7 = sub_25A236EC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  swift_unknownObjectRetain();
  sub_25A2385F8();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(ObjectType, a2);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v21 = v12;
  unint64_t v22 = v14;
  sub_25A2380C8();
  sub_25A236EB8();
  sub_25A227490();
  sub_25A238728();
  sub_25A2380C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v15 = v21;
  unint64_t v16 = v22;
  *a4 = a1;
  a4[1] = a2;
  a4[2] = v15;
  a4[3] = v16;
  unint64_t v17 = v20;
  a4[4] = v20;

  return v17;
}

uint64_t PreviewAgentConnector.injectScene(configuration:)(long long *a1)
{
  uint64_t v3 = *((void *)a1 + 2);
  *(void *)(v1 + 64) = sub_25A238248();
  long long v6 = *a1;
  long long v7 = *(long long *)((char *)a1 + 24);
  *(void *)(v1 + 72) = sub_25A238238();
  *(_OWORD *)(v1 + 16) = v6;
  *(void *)(v1 + 32) = v3;
  *(_OWORD *)(v1 + 40) = v7;
  *(void *)(v1 + 56) = 0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 80) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_25A22FD44;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v1 + 16, (void *)(v1 + 56));
}

uint64_t sub_25A22FD44(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v6;
    uint64_t v8 = sub_25A22FF00;
  }
  else
  {
    *(void *)(v4 + 96) = a1;
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v9;
    uint64_t v8 = sub_25A22FE98;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_25A22FE98()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 96);
  return v1(v2);
}

uint64_t sub_25A22FF00()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t SceneInjector.init(injectScene:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t PreviewAgentConnector.pid.getter()
{
  return *v0;
}

__n128 PreviewAgentConnector.init(pid:agentBundle:serverFarm:sceneInjector:)@<Q0>(int a1@<W0>, uint64_t a2@<X1>, long long *a3@<X2>, __n128 *a4@<X3>, _DWORD *a5@<X8>)
{
  long long v18 = a3[4];
  long long v19 = a3[5];
  long long v20 = a3[6];
  long long v21 = a3[7];
  long long v14 = *a3;
  long long v15 = a3[1];
  long long v16 = a3[2];
  long long v17 = a3[3];
  *a5 = a1;
  uint64_t v8 = (int *)type metadata accessor for PreviewAgentConnector();
  uint64_t v9 = (char *)a5 + v8[5];
  uint64_t v10 = sub_25A236768();
  __n128 v13 = *a4;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a2, v10);
  uint64_t v11 = (_OWORD *)((char *)a5 + v8[6]);
  v11[4] = v18;
  v11[5] = v19;
  v11[6] = v20;
  v11[7] = v21;
  *uint64_t v11 = v14;
  v11[1] = v15;
  v11[2] = v16;
  v11[3] = v17;
  __n128 result = v13;
  *(__n128 *)((char *)a5 + v8[7]) = v13;
  return result;
}

uint64_t PreviewAgentConnector.connectNonUIAgent()()
{
  uint64_t v1 = type metadata accessor for PreviewAgentConnector();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8E0);
  uint64_t v7 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_25A1B8190(v0, (uint64_t)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v9 = swift_allocObject();
  sub_25A2336DC((uint64_t)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (uint64_t (*)(void))type metadata accessor for PreviewAgentConnector);
  return sub_25A237728();
}

uint64_t sub_25A23024C(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  type metadata accessor for PreviewNonUIAgentProxy();
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A2302DC, 0, 0);
}

uint64_t sub_25A2302DC()
{
  uint64_t v1 = *(int **)(v0 + 40);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)((char *)v1 + *(int *)(type metadata accessor for PreviewAgentConnector() + 24) + 48);
  int v2 = *v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25A23039C;
  uint64_t v4 = *(void *)(v0 + 48);
  return SharedAgentServer<>.requestPreviewNonUIAgent(for:)(v4, v2);
}

uint64_t sub_25A23039C()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    int v2 = sub_25A2305A8;
  }
  else {
    int v2 = sub_25A2304B0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A2304B0()
{
  uint64_t v1 = v0[6];
  int v2 = (uint64_t *)v0[4];
  sub_25A2372E8();
  swift_allocObject();
  *int v2 = sub_25A2372D8();
  uint64_t v3 = type metadata accessor for PreviewNonUIAgent();
  sub_25A2336DC(v1, (uint64_t)v2 + *(int *)(v3 + 20), (uint64_t (*)(void))type metadata accessor for PreviewNonUIAgentProxy);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25A2305A8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t _s15PreviewShellKit0A14AgentConnectorV11agentBundle19PreviewsMessagingOS0D10DescriptorV0G0Vvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PreviewAgentConnector() + 20);
  uint64_t v4 = sub_25A236768();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(uint64_t a1, void *a2)
{
  *(void *)(v3 + 24) = v2;
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a1;
  *(void *)(v3 + 48) = *(void *)(a1 + 16);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a1 + 24);
  *(void *)(v3 + 72) = *a2;
  *(void *)(v3 + 80) = sub_25A238248();
  *(void *)(v3 + 88) = sub_25A238238();
  uint64_t v5 = sub_25A238208();
  *(void *)(v3 + 96) = v5;
  *(void *)(v3 + 104) = v4;
  return MEMORY[0x270FA2498](sub_25A230744, v5, v4);
}

uint64_t sub_25A230744()
{
  uint64_t v1 = *(_DWORD **)(v0 + 24);
  sub_25A238238();
  sub_25A238218();
  swift_release();
  uint64_t v2 = type metadata accessor for PreviewAgentConnector();
  uint64_t v3 = *(uint64_t (**)(void))((char *)v1 + *(int *)(v2 + 28));
  *(_DWORD *)(v0 + 176) = *v1;
  *(void *)(v0 + 112) = v3();
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(int *)(v2 + 24);
  *(_DWORD *)(v0 + 180) = v5;
  *(void *)(v0 + 120) = *(void *)(v4 + v5 + 64);
  return MEMORY[0x270FA2498](sub_25A2308CC, 0, 0);
}

uint64_t sub_25A2308CC()
{
  uint64_t v6 = (uint64_t (*)(int, uint64_t, uint64_t))((char *)&dword_26A40B398 + dword_26A40B398);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25A230988;
  int v2 = *(_DWORD *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  return v6(v2, v3, v4);
}

uint64_t sub_25A230988(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[17] = a1;
  v3[18] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_25A230D10;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = v3[12];
    uint64_t v6 = v3[13];
    uint64_t v4 = sub_25A230AAC;
  }
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25A230AAC()
{
  uint64_t v1 = *(void **)(v0 + 112);
  int v2 = *(void **)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 24) + *(int *)(v0 + 180);
  sub_25A236028();
  uint64_t v5 = *(void *)(v3 + 112);
  uint64_t v4 = *(void *)(v3 + 120);
  *(void *)(v0 + 16) = v2;
  type metadata accessor for PreviewSceneAgentProxy(0);
  swift_allocObject();
  swift_retain();
  id v6 = v1;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  id v7 = v2;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_25A230BE8;
  uint64_t v9 = *(void *)(v0 + 136);
  uint64_t v10 = *(void *)(v0 + 112);
  uint64_t v11 = *(void *)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 40);
  return sub_25A16C4F4(v9, v10, v11, v12, v5, v4, (uint64_t *)(v0 + 16));
}

uint64_t sub_25A230BE8(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 160) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[12];
    uint64_t v6 = v4[13];
    id v7 = sub_25A230E74;
  }
  else
  {
    v4[21] = a1;
    uint64_t v5 = v4[12];
    uint64_t v6 = v4[13];
    id v7 = sub_25A230DF8;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_25A230D10()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  return MEMORY[0x270FA2498](sub_25A230D74, v1, v2);
}

uint64_t sub_25A230D74()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 112);
  sub_25A1997E8(v1);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25A230DF8()
{
  uint64_t v1 = (void *)v0[14];
  swift_release();

  swift_release();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v3 = v0[21];
  return v2(v3);
}

uint64_t sub_25A230E74()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 112);
  sub_25A1997E8(v1);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t PreviewAgentConnector.connectSceneAgent(configuration:)(long long *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PreviewAgentConnector();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = a1[1];
  long long v17 = *a1;
  long long v18 = v10;
  uint64_t v19 = *((void *)a1 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8F8);
  uint64_t v11 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  sub_25A1B8190(v2, (uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  sub_25A2336DC((uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, (uint64_t (*)(void))type metadata accessor for PreviewAgentConnector);
  unint64_t v14 = v13 + ((v6 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v15 = v18;
  *(_OWORD *)unint64_t v14 = v17;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = v19;
  sub_25A2325CC((uint64_t)&v17);
  return sub_25A237728();
}

uint64_t sub_25A231128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return MEMORY[0x270FA2498](sub_25A23114C, 0, 0);
}

uint64_t sub_25A23114C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  *(void *)(v0 + 88) = sub_25A238248();
  *(void *)(v0 + 96) = sub_25A238238();
  uint64_t v2 = *(void *)(v1 + 32);
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 32) = v3;
  *(void *)(v0 + 48) = v2;
  *(void *)(v0 + 56) = 0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25A231224;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v0 + 16, (void *)(v0 + 56));
}

uint64_t sub_25A231224(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v6;
    uint64_t v8 = sub_25A2314A4;
  }
  else
  {
    *(void *)(v4 + 120) = a1;
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v9;
    uint64_t v8 = sub_25A231378;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_25A231378()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_25A2313E0, 0, 0);
}

uint64_t sub_25A2313E0()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = (uint64_t *)v0[8];
  sub_25A2372E8();
  swift_allocObject();
  *uint64_t v2 = sub_25A2372D8();
  v2[1] = v1;
  long long v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25A2314A4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PreviewAgentConnector.connectSceneAgent(configuration:settingsPolicy:)(long long *a1, void **a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for PreviewAgentConnector();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v13 = a1[1];
  long long v23 = *a1;
  long long v24 = v13;
  uint64_t v25 = *((void *)a1 + 4);
  unint64_t v14 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A40C8F8);
  uint64_t v15 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  sub_25A1B8190(v3, (uint64_t)v9);
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  sub_25A2336DC((uint64_t)v9, v18 + v16, (uint64_t (*)(void))type metadata accessor for PreviewAgentConnector);
  unint64_t v19 = v18 + v17;
  long long v20 = v24;
  *(_OWORD *)unint64_t v19 = v23;
  *(_OWORD *)(v19 + 16) = v20;
  *(void *)(v19 + 32) = v25;
  *(void *)(v18 + ((v17 + 47) & 0xFFFFFFFFFFFFFFF8)) = v14;
  sub_25A2325CC((uint64_t)&v23);
  id v21 = v14;
  return sub_25A237728();
}

uint64_t sub_25A23174C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a1;
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 48) = *(void *)(a3 + 32);
  *(void *)(v4 + 56) = a4;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 72) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_25A23180C;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v4 + 16, (void *)(v4 + 56));
}

uint64_t sub_25A23180C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    long long v5 = sub_25A2319F8;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    long long v5 = sub_25A231934;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25A231934()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = (uint64_t *)v0[8];
  sub_25A2372E8();
  swift_allocObject();
  *uint64_t v2 = sub_25A2372D8();
  v2[1] = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25A2319F8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PreviewAgentConnector.connectSceneAgent(configuration:settingsPolicy:)(uint64_t a1, long long *a2, uint64_t *a3)
{
  *(void *)(v3 + 64) = a1;
  uint64_t v5 = *((void *)a2 + 2);
  uint64_t v6 = *a3;
  *(void *)(v3 + 72) = sub_25A238248();
  long long v9 = *a2;
  long long v10 = *(long long *)((char *)a2 + 24);
  *(void *)(v3 + 80) = sub_25A238238();
  *(_OWORD *)(v3 + 16) = v9;
  *(void *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 40) = v10;
  *(void *)(v3 + 56) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 88) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A231B10;
  return PreviewAgentConnector.injectScene(configuration:settingsPolicy:)(v3 + 16, (void *)(v3 + 56));
}

uint64_t sub_25A231B10(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v6;
    uint64_t v8 = sub_25A231D30;
  }
  else
  {
    *(void *)(v4 + 104) = a1;
    uint64_t v5 = sub_25A238208();
    uint64_t v7 = v9;
    uint64_t v8 = sub_25A231C64;
  }
  return MEMORY[0x270FA2498](v8, v5, v7);
}

uint64_t sub_25A231C64()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = (uint64_t *)v0[8];
  swift_release();
  sub_25A2372E8();
  swift_allocObject();
  *uint64_t v2 = sub_25A2372D8();
  v2[1] = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25A231D30()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t AgentSceneConfiguration.previewShellScene.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t AgentSceneConfiguration.previewShellScene.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AgentSceneConfiguration.previewShellScene.modify())()
{
  return nullsub_1;
}

uint64_t AgentSceneConfiguration.sceneIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AgentSceneConfiguration.sceneIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*AgentSceneConfiguration.sceneIdentifier.modify())()
{
  return nullsub_1;
}

id AgentSceneConfiguration.sceneSpecification.getter()
{
  return *(id *)(v0 + 32);
}

void AgentSceneConfiguration.sceneSpecification.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
}

uint64_t (*AgentSceneConfiguration.sceneSpecification.modify())()
{
  return nullsub_1;
}

uint64_t AgentSceneConfiguration.init(previewShellScene:sceneIdentifier:sceneSpecification:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t sub_25A231F00()
{
  uint64_t v1 = type metadata accessor for PreviewAgentConnector();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v7 = sub_25A236768();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
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
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25A232084(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewAgentConnector() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25A175068;
  return sub_25A23024C(a1, v5);
}

id static AgentSceneConfiguration.mainSceneConfiguration(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_25A236EC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  swift_unknownObjectRetain();
  uint64_t v16 = v11(ObjectType, a2);
  uint64_t v17 = v12;
  sub_25A2380C8();
  sub_25A236EB8();
  sub_25A227490();
  sub_25A238728();
  sub_25A2380C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v13 = v16;
  uint64_t v14 = v17;
  id result = objc_msgSend(self, sel_mainSceneSpecification);
  *a3 = a1;
  a3[1] = a2;
  a3[2] = v13;
  a3[3] = v14;
  a3[4] = result;
  return result;
}

uint64_t sub_25A2322F8()
{
  uint64_t v1 = type metadata accessor for PreviewAgentConnector();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v7 = sub_25A236768();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
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
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v5 + 40, v4);
}

uint64_t sub_25A2324AC(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewAgentConnector() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1 + v5;
  uint64_t v7 = v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_25A175068;
  v8[9] = v6;
  v8[10] = v7;
  v8[8] = a1;
  return MEMORY[0x270FA2498](sub_25A23114C, 0, 0);
}

uint64_t sub_25A2325CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return a1;
}

uint64_t sub_25A232610()
{
  uint64_t v1 = type metadata accessor for PreviewAgentConnector();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)(v1 - 8) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 47) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v8 = sub_25A236768();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
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
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6 + 8, v4);
}

uint64_t sub_25A2327D4(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewAgentConnector() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1 + v5;
  uint64_t v8 = v1 + v6;
  uint64_t v9 = *(void *)(v1 + ((v6 + 47) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_25A1731E8;
  return sub_25A23174C(a1, v7, v8, v9);
}

void *initializeBufferWithCopyOfBuffer for SceneInjector(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SceneInjector()
{
  return swift_release();
}

void *assignWithCopy for SceneInjector(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SceneInjector(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SceneInjector()
{
  return &type metadata for SceneInjector;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewAgentConnector(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25A236768();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    uint64_t v13 = (uint64_t *)((char *)v4 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = v14[3];
    v13[2] = v14[2];
    v13[3] = v16;
    uint64_t v17 = v14[5];
    v13[4] = v14[4];
    v13[5] = v17;
    uint64_t v18 = v14[7];
    v13[6] = v14[6];
    v13[7] = v18;
    uint64_t v19 = v14[9];
    v13[8] = v14[8];
    v13[9] = v19;
    uint64_t v20 = v14[11];
    v13[10] = v14[10];
    v13[11] = v20;
    uint64_t v21 = v14[13];
    v13[12] = v14[12];
    v13[13] = v21;
    uint64_t v27 = v14[15];
    v13[14] = v14[14];
    v13[15] = v27;
    unint64_t v22 = (uint64_t *)((char *)v4 + v12);
    long long v23 = (uint64_t *)((char *)a2 + v12);
    uint64_t v24 = v23[1];
    *unint64_t v22 = *v23;
    v22[1] = v24;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for PreviewAgentConnector(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25A236768();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
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
  swift_release();

  return swift_release();
}

_DWORD *initializeWithCopy for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v5 = a3[5];
  unint64_t v6 = (char *)a1 + v5;
  uint64_t v8 = (char *)a2 + v5;
  uint64_t v9 = sub_25A236768();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v6, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = a1;
  uint64_t v27 = a1;
  uint64_t v13 = (void *)((char *)a1 + v10);
  uint64_t v14 = (void *)((char *)a2 + v10);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = v14[3];
  v13[2] = v14[2];
  v13[3] = v16;
  uint64_t v17 = v14[5];
  v13[4] = v14[4];
  v13[5] = v17;
  uint64_t v18 = v14[7];
  v13[6] = v14[6];
  v13[7] = v18;
  uint64_t v19 = v14[9];
  v13[8] = v14[8];
  v13[9] = v19;
  uint64_t v24 = v14[11];
  v13[10] = v14[10];
  v13[11] = v24;
  uint64_t v25 = v14[13];
  v13[12] = v14[12];
  v13[13] = v25;
  uint64_t v26 = v14[15];
  v13[14] = v14[14];
  v13[15] = v26;
  uint64_t v20 = (void *)((char *)v12 + v11);
  uint64_t v21 = (void *)((char *)a2 + v11);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v27;
}

_DWORD *assignWithCopy for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A236768();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  v11[1] = v12[1];
  swift_retain();
  swift_release();
  v11[2] = v12[2];
  swift_retain();
  swift_release();
  v11[3] = v12[3];
  swift_retain();
  swift_release();
  v11[4] = v12[4];
  swift_retain();
  swift_release();
  v11[5] = v12[5];
  swift_retain();
  swift_release();
  v11[6] = v12[6];
  swift_retain();
  swift_release();
  v11[7] = v12[7];
  swift_retain();
  swift_release();
  v11[8] = v12[8];
  swift_retain();
  swift_release();
  v11[9] = v12[9];
  swift_retain();
  swift_release();
  v11[10] = v12[10];
  swift_retain();
  swift_release();
  v11[11] = v12[11];
  swift_retain();
  swift_release();
  v11[12] = v12[12];
  swift_retain();
  swift_release();
  v11[13] = v12[13];
  swift_retain();
  swift_release();
  v11[14] = v12[14];
  swift_retain();
  swift_release();
  v11[15] = v12[15];
  swift_retain();
  swift_release();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  return a1;
}

_DWORD *initializeWithTake for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A236768();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (_OWORD *)((char *)a1 + v10);
  uint64_t v13 = (_OWORD *)((char *)a2 + v10);
  long long v14 = v13[3];
  v12[2] = v13[2];
  v12[3] = v14;
  long long v15 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v15;
  long long v16 = v13[7];
  v12[6] = v13[6];
  v12[7] = v16;
  long long v17 = v13[5];
  v12[4] = v13[4];
  v12[5] = v17;
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

_DWORD *assignWithTake for PreviewAgentConnector(_DWORD *a1, _DWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A236768();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_release();
  v11[1] = v12[1];
  swift_release();
  v11[2] = v12[2];
  swift_release();
  v11[3] = v12[3];
  swift_release();
  v11[4] = v12[4];
  swift_release();
  v11[5] = v12[5];
  swift_release();
  v11[6] = v12[6];
  swift_release();
  v11[7] = v12[7];
  swift_release();
  v11[8] = v12[8];
  swift_release();
  v11[9] = v12[9];
  swift_release();
  v11[10] = v12[10];
  swift_release();
  v11[11] = v12[11];
  swift_release();
  v11[12] = v12[12];
  swift_release();
  v11[13] = v12[13];
  swift_release();
  v11[14] = v12[14];
  swift_release();
  v11[15] = v12[15];
  swift_release();
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewAgentConnector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A2332FC);
}

uint64_t sub_25A2332FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A236768();
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for PreviewAgentConnector(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A2333D4);
}

uint64_t sub_25A2333D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A236768();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25A233494()
{
  uint64_t result = sub_25A236768();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneSettingsPolicy()
{
  return &type metadata for SceneSettingsPolicy;
}

void destroy for AgentSceneConfiguration(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for AgentSceneConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for AgentSceneConfiguration(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v4;
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v5 = (void *)a2[4];
  uint64_t v6 = (void *)a1[4];
  a1[4] = v5;
  id v7 = v5;

  return a1;
}

uint64_t assignWithTake for AgentSceneConfiguration(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

ValueMetadata *type metadata accessor for AgentSceneConfiguration()
{
  return &type metadata for AgentSceneConfiguration;
}

uint64_t sub_25A2336DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t PreviewNonUIAgent.invalidationHandle.getter()
{
  return swift_retain();
}

uint64_t PreviewNonUIAgent.pid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for PreviewNonUIAgent() + 20) + 8);
}

uint64_t type metadata accessor for PreviewNonUIAgent()
{
  uint64_t result = qword_26A40C978;
  if (!qword_26A40C978) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PreviewNonUIAgent.onDisconnect(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for PreviewNonUIAgentProxy();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v2 + *(int *)(type metadata accessor for PreviewNonUIAgent() + 20);
  uint64_t v12 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  sub_25A234004(v11, (uint64_t)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for PreviewNonUIAgentProxy);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  sub_25A234230((uint64_t)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, (uint64_t (*)(void))type metadata accessor for PreviewNonUIAgentProxy);
  long long v15 = (void *)(v14 + ((v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *long long v15 = a1;
  v15[1] = a2;
  swift_retain();
  sub_25A17042C((uint64_t)v10, (uint64_t)&unk_26A40B7B8, v14);
  return swift_release();
}

uint64_t sub_25A2339A8()
{
  unint64_t v1 = (int *)(type metadata accessor for PreviewNonUIAgentProxy() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_25A233AEC(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PreviewNonUIAgentProxy() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_25A175068;
  return sub_25A1D1D28(a1, v6, v7, v8, v10, v11);
}

uint64_t PreviewNonUIAgent.perform<A>(update:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a3;
  uint64_t v25 = a4;
  uint64_t v23 = a1;
  uint64_t v4 = sub_25A236D98();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = type metadata accessor for PreviewNonUIAgent();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_25A237758();
  uint64_t v14 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_25A234004(v22, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for PreviewNonUIAgent);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v4);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v9 + *(unsigned __int8 *)(v5 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = v25;
  *(void *)(v17 + 16) = v21;
  *(void *)(v17 + 24) = v18;
  sub_25A234230((uint64_t)v10, v17 + v15, (uint64_t (*)(void))type metadata accessor for PreviewNonUIAgent);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  return sub_25A237728();
}

uint64_t sub_25A233EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_25A233F24, 0, 0);
}

uint64_t sub_25A233F24()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  type metadata accessor for PreviewNonUIAgent();
  uint64_t v4 = nullsub_1(v1, v2);
  v0[7] = PreviewNonUIAgentProxy.perform<A>(update:expecting:)(v3, v4, v1, v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25A1D22FC;
  uint64_t v6 = v0[2];
  return MEMORY[0x270F55D98](v6);
}

uint64_t sub_25A234004(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A23406C()
{
  uint64_t v1 = (int *)(type metadata accessor for PreviewNonUIAgent() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_25A236D98();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  swift_release();
  uint64_t v11 = v0 + v3 + v1[7];
  swift_release();
  uint64_t v12 = v11 + *(int *)(type metadata accessor for PreviewNonUIAgentProxy() + 24);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_25A234230(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A234298(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(type metadata accessor for PreviewNonUIAgent() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(sub_25A236D98() - 8);
  uint64_t v9 = v1 + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  uint64_t v10 = swift_task_alloc();
  long long v11 = *(_OWORD *)(v1 + 16);
  *(void *)(v3 + 16) = v10;
  *(void *)uint64_t v10 = v3;
  *(void *)(v10 + 8) = sub_25A1731E8;
  *(_OWORD *)(v10 + 40) = v11;
  *(void *)(v10 + 24) = v1 + v6;
  *(void *)(v10 + 32) = v9;
  *(void *)(v10 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25A233F24, 0, 0);
}

uint64_t PreviewNonUIAgent.addMessageStream(for:)(uint64_t a1)
{
  uint64_t v3 = sub_25A236858();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1 + *(int *)(type metadata accessor for PreviewNonUIAgent() + 20);
  uint64_t v10 = (uint64_t *)(v9 + *(int *)(type metadata accessor for PreviewNonUIAgentProxy() + 28));
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  int v13 = *(_DWORD *)(v9 + 8);
  v18[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A40);
  uint64_t v14 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 36) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v12;
  *(void *)(v16 + 24) = v11;
  *(_DWORD *)(v16 + 32) = v13;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v16 + v15, (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  swift_retain();
  swift_retain();
  return sub_25A237728();
}

uint64_t sub_25A234648()
{
  uint64_t v1 = sub_25A236858();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 36) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t PreviewNonUIAgent.sendEndpoint(_:context:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25A236738();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25A236E48();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PreviewNonUIAgent();
  type metadata accessor for PreviewNonUIAgentProxy();
  uint64_t v12 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A409A58) + 48)];
  uint64_t v13 = sub_25A236858();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, a3, v13);
  uint64_t v14 = sub_25A236FC8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, a2, v14);
  sub_25A236728();
  __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  unint64_t v15 = (uint64_t (*)(void))MEMORY[0x263F60EF0];
  sub_25A235500(&qword_26A40B7D0, MEMORY[0x263F60EF0]);
  sub_25A236128();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_25A235548((uint64_t)v11, v15);
}

uint64_t PreviewSceneAgent.invalidationHandle.getter()
{
  return swift_retain();
}

id PreviewSceneAgent.scene.getter()
{
  return *(id *)(*(void *)(v0 + 8) + 24);
}

uint64_t PreviewSceneAgent.onDisconnect(_:)(uint64_t a1, uint64_t a2)
{
  sub_25A238248();
  sub_25A238238();
  sub_25A238218();
  swift_release();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_25A2352B4;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4099C0);
  sub_25A236F88();

  return swift_release();
}

uint64_t PreviewSceneAgent.perform<A>(update:with:delegate:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = PreviewSceneAgentProxy.perform<A>(update:with:delegate:expecting:)(a1, a2, a3, a5, a5, a6);
  sub_25A237758();
  uint64_t v15 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a5;
  v16[3] = a6;
  v16[4] = v14;
  return sub_25A237728();
}

uint64_t sub_25A234C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A409AA0);
  *uint64_t v7 = v3;
  v7[1] = sub_25A175068;
  uint64_t v9 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](a1, a2, a3, v8, v9);
}

uint64_t PreviewSceneAgent.generateStaticOutput<A>(for:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = PreviewSceneAgentProxy.generateStaticOutput<A>(for:expecting:)(a1, a3, a3);
  sub_25A237758();
  uint64_t v11 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v10;
  return sub_25A237728();
}

uint64_t PreviewSceneAgent.addMessageStream(for:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A10);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  PreviewSceneAgentProxy.addMessageStream(for:)(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A409A40);
  uint64_t v5 = sub_25A238268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  return sub_25A237728();
}

uint64_t sub_25A234F78(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = sub_25A2365A8();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A409AA0);
  *uint64_t v5 = v2;
  v5[1] = sub_25A1731E8;
  uint64_t v8 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](a1, a2, v6, v7, v8);
}

uint64_t PreviewSceneAgent.sendEndpoint(_:context:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25A236738();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25A236E78();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A409A58) + 48)];
  uint64_t v13 = sub_25A236858();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, a3, v13);
  uint64_t v14 = sub_25A236FC8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, a2, v14);
  sub_25A236728();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4099E8);
  uint64_t v15 = (uint64_t (*)(void))MEMORY[0x263F60F20];
  sub_25A235500(&qword_26A409A60, MEMORY[0x263F60F20]);
  sub_25A236128();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return sub_25A235548((uint64_t)v11, v15);
}

uint64_t sub_25A23527C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A2352B4()
{
  return sub_25A16EB7C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_25A2352BC(uint64_t a1)
{
  return sub_25A16EBA4(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_25A2352C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25A2352FC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25A175068;
  return sub_25A234C1C(a1, v5, v4);
}

uint64_t sub_25A2353B0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25A175068;
  return sub_25A234C1C(a1, v5, v4);
}

uint64_t sub_25A235464(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25A175068;
  return sub_25A234F78(a1, v1);
}

uint64_t sub_25A235500(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25A235548(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewNonUIAgent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    *(void *)uint64_t v7 = *(uint64_t *)((char *)a2 + v6);
    *((_DWORD *)v7 + 2) = *(_DWORD *)((char *)a2 + v6 + 8);
    uint64_t v9 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
    uint64_t v10 = v9[6];
    uint64_t v11 = &v7[v10];
    uint64_t v12 = &v8[v10];
    swift_retain();
    swift_retain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = v9[7];
    uint64_t v15 = &v7[v14];
    uint64_t v16 = &v8[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v5;
}

uint64_t destroy for PreviewNonUIAgent(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for PreviewNonUIAgentProxy() + 24);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for PreviewNonUIAgent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  *(void *)uint64_t v5 = *(void *)((char *)a2 + v4);
  *((_DWORD *)v5 + 2) = *(_DWORD *)((char *)a2 + v4 + 8);
  uint64_t v7 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  uint64_t v8 = v7[6];
  uint64_t v9 = &v5[v8];
  uint64_t v10 = &v6[v8];
  swift_retain();
  swift_retain();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = v7[7];
  uint64_t v13 = &v5[v12];
  uint64_t v14 = &v6[v12];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  *(void *)&v5[v7[8]] = *(void *)&v6[v7[8]];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PreviewNonUIAgent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((_DWORD *)v7 + 2) = *((_DWORD *)v8 + 2);
  uint64_t v9 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = v9[7];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  *(void *)&v7[v14] = *(void *)&v8[v14];
  swift_retain();
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_retain();
  swift_release();
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for PreviewNonUIAgent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  *(void *)uint64_t v5 = *(void *)((char *)a2 + v4);
  *((_DWORD *)v5 + 2) = *(_DWORD *)((char *)a2 + v4 + 8);
  uint64_t v7 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  uint64_t v8 = v7[6];
  uint64_t v9 = &v5[v8];
  uint64_t v10 = &v6[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)&v5[v7[7]] = *(_OWORD *)&v6[v7[7]];
  *(void *)&v5[v7[8]] = *(void *)&v6[v7[8]];
  return a1;
}

void *assignWithTake for PreviewNonUIAgent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_release();
  *((_DWORD *)v7 + 2) = *((_DWORD *)v8 + 2);
  uint64_t v9 = (int *)type metadata accessor for PreviewNonUIAgentProxy();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(qword_26A40A098);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = v9[7];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  *(void *)&v7[v14] = *(void *)&v8[v14];
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_release();
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewNonUIAgent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A235BC4);
}

uint64_t sub_25A235BC4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for PreviewNonUIAgentProxy();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PreviewNonUIAgent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A235C88);
}

void *sub_25A235C88(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for PreviewNonUIAgentProxy();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A235D30()
{
  uint64_t result = type metadata accessor for PreviewNonUIAgentProxy();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewSceneAgent()
{
  return &type metadata for PreviewSceneAgent;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_25A235E08()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_25A235E18()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25A235E28()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25A235E38()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25A235E48()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25A235E58()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25A235E68()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25A235E78()
{
  return MEMORY[0x270F56A08]();
}

uint64_t sub_25A235E88()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25A235E98()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25A235EA8()
{
  return MEMORY[0x270EEFE08]();
}

uint64_t sub_25A235EB8()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_25A235EC8()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25A235ED8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25A235EE8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25A235EF8()
{
  return MEMORY[0x270EF0030]();
}

uint64_t sub_25A235F08()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25A235F18()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25A235F28()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25A235F38()
{
  return MEMORY[0x270F56DB8]();
}

uint64_t sub_25A235F48()
{
  return MEMORY[0x270F56A10]();
}

uint64_t sub_25A235F58()
{
  return MEMORY[0x270F56A18]();
}

uint64_t sub_25A235F68()
{
  return MEMORY[0x270F56A20]();
}

uint64_t sub_25A235F78()
{
  return MEMORY[0x270F56A28]();
}

uint64_t sub_25A235F88()
{
  return MEMORY[0x270F56A30]();
}

uint64_t sub_25A235F98()
{
  return MEMORY[0x270F56A38]();
}

uint64_t sub_25A235FA8()
{
  return MEMORY[0x270F56A40]();
}

uint64_t sub_25A235FB8()
{
  return MEMORY[0x270F56A48]();
}

uint64_t sub_25A235FC8()
{
  return MEMORY[0x270F56A50]();
}

uint64_t sub_25A235FD8()
{
  return MEMORY[0x270F56A60]();
}

uint64_t sub_25A235FE8()
{
  return MEMORY[0x270F56A68]();
}

uint64_t sub_25A235FF8()
{
  return MEMORY[0x270F56A70]();
}

uint64_t sub_25A236018()
{
  return MEMORY[0x270F56A80]();
}

uint64_t sub_25A236028()
{
  return MEMORY[0x270F56A88]();
}

uint64_t sub_25A236038()
{
  return MEMORY[0x270F56A98]();
}

uint64_t sub_25A236048()
{
  return MEMORY[0x270F56AA0]();
}

uint64_t sub_25A236058()
{
  return MEMORY[0x270F56AA8]();
}

uint64_t sub_25A236068()
{
  return MEMORY[0x270F56AB8]();
}

uint64_t sub_25A236078()
{
  return MEMORY[0x270F56AC0]();
}

uint64_t sub_25A236088()
{
  return MEMORY[0x270F56AC8]();
}

uint64_t sub_25A236098()
{
  return MEMORY[0x270F56AD0]();
}

uint64_t sub_25A2360A8()
{
  return MEMORY[0x270F56AD8]();
}

uint64_t sub_25A2360B8()
{
  return MEMORY[0x270F56AE0]();
}

uint64_t sub_25A2360C8()
{
  return MEMORY[0x270F56AE8]();
}

uint64_t sub_25A2360D8()
{
  return MEMORY[0x270F56AF0]();
}

uint64_t sub_25A2360E8()
{
  return MEMORY[0x270F56AF8]();
}

uint64_t sub_25A2360F8()
{
  return MEMORY[0x270F56B00]();
}

uint64_t sub_25A236108()
{
  return MEMORY[0x270F56B18]();
}

uint64_t sub_25A236118()
{
  return MEMORY[0x270F56B20]();
}

uint64_t sub_25A236128()
{
  return MEMORY[0x270F56B28]();
}

uint64_t sub_25A236138()
{
  return MEMORY[0x270F56B30]();
}

uint64_t sub_25A236148()
{
  return MEMORY[0x270F56B38]();
}

uint64_t sub_25A236158()
{
  return MEMORY[0x270F56B40]();
}

uint64_t sub_25A236168()
{
  return MEMORY[0x270F56B48]();
}

uint64_t sub_25A236178()
{
  return MEMORY[0x270F56B50]();
}

uint64_t sub_25A236188()
{
  return MEMORY[0x270F56B58]();
}

uint64_t sub_25A236198()
{
  return MEMORY[0x270F56B60]();
}

uint64_t sub_25A2361A8()
{
  return MEMORY[0x270F56B68]();
}

uint64_t sub_25A2361B8()
{
  return MEMORY[0x270F56B70]();
}

uint64_t sub_25A2361C8()
{
  return MEMORY[0x270F56B80]();
}

uint64_t sub_25A2361D8()
{
  return MEMORY[0x270F56B88]();
}

uint64_t sub_25A2361E8()
{
  return MEMORY[0x270F56E38]();
}

uint64_t sub_25A2361F8()
{
  return MEMORY[0x270F56E40]();
}

uint64_t sub_25A236208()
{
  return MEMORY[0x270F56E48]();
}

uint64_t sub_25A236218()
{
  return MEMORY[0x270F56E60]();
}

uint64_t sub_25A236228()
{
  return MEMORY[0x270F56EA0]();
}

uint64_t sub_25A236238()
{
  return MEMORY[0x270F56EA8]();
}

uint64_t sub_25A236248()
{
  return MEMORY[0x270F56EC8]();
}

uint64_t sub_25A236258()
{
  return MEMORY[0x270F59A10]();
}

uint64_t sub_25A236268()
{
  return MEMORY[0x270F56010]();
}

uint64_t sub_25A236278()
{
  return MEMORY[0x270F56018]();
}

uint64_t sub_25A236288()
{
  return MEMORY[0x270F56020]();
}

uint64_t sub_25A236298()
{
  return MEMORY[0x270F56028]();
}

uint64_t sub_25A2362A8()
{
  return MEMORY[0x270F56030]();
}

uint64_t sub_25A2362C8()
{
  return MEMORY[0x270F56050]();
}

uint64_t sub_25A2362E8()
{
  return MEMORY[0x270F56060]();
}

uint64_t sub_25A2362F8()
{
  return MEMORY[0x270F56078]();
}

uint64_t sub_25A236308()
{
  return MEMORY[0x270F56088]();
}

uint64_t sub_25A236318()
{
  return MEMORY[0x270F56090]();
}

uint64_t sub_25A236328()
{
  return MEMORY[0x270F56098]();
}

uint64_t sub_25A236338()
{
  return MEMORY[0x270F560A0]();
}

uint64_t sub_25A236348()
{
  return MEMORY[0x270F560B8]();
}

uint64_t sub_25A236358()
{
  return MEMORY[0x270F560C0]();
}

uint64_t sub_25A236368()
{
  return MEMORY[0x270F560C8]();
}

uint64_t sub_25A236378()
{
  return MEMORY[0x270F560D0]();
}

uint64_t sub_25A236388()
{
  return MEMORY[0x270F560E0]();
}

uint64_t sub_25A236398()
{
  return MEMORY[0x270F560F0]();
}

uint64_t sub_25A2363A8()
{
  return MEMORY[0x270F560F8]();
}

uint64_t sub_25A2363B8()
{
  return MEMORY[0x270F56100]();
}

uint64_t sub_25A2363C8()
{
  return MEMORY[0x270F56108]();
}

uint64_t sub_25A2363D8()
{
  return MEMORY[0x270F56110]();
}

uint64_t sub_25A2363E8()
{
  return MEMORY[0x270F56118]();
}

uint64_t sub_25A2363F8()
{
  return MEMORY[0x270F56120]();
}

uint64_t sub_25A236408()
{
  return MEMORY[0x270F56128]();
}

uint64_t sub_25A236418()
{
  return MEMORY[0x270F56130]();
}

uint64_t sub_25A236428()
{
  return MEMORY[0x270F56138]();
}

uint64_t sub_25A236438()
{
  return MEMORY[0x270F56140]();
}

uint64_t sub_25A236448()
{
  return MEMORY[0x270F56148]();
}

uint64_t sub_25A236458()
{
  return MEMORY[0x270F56168]();
}

uint64_t sub_25A236468()
{
  return MEMORY[0x270F56170]();
}

uint64_t sub_25A236478()
{
  return MEMORY[0x270F56178]();
}

uint64_t sub_25A236488()
{
  return MEMORY[0x270F56180]();
}

uint64_t sub_25A236498()
{
  return MEMORY[0x270F56188]();
}

uint64_t sub_25A2364A8()
{
  return MEMORY[0x270F56190]();
}

uint64_t sub_25A2364B8()
{
  return MEMORY[0x270F56198]();
}

uint64_t sub_25A2364C8()
{
  return MEMORY[0x270F561A0]();
}

uint64_t sub_25A2364D8()
{
  return MEMORY[0x270F561A8]();
}

uint64_t sub_25A2364E8()
{
  return MEMORY[0x270F561B0]();
}

uint64_t sub_25A2364F8()
{
  return MEMORY[0x270F561B8]();
}

uint64_t sub_25A236508()
{
  return MEMORY[0x270F561C0]();
}

uint64_t sub_25A236518()
{
  return MEMORY[0x270F561C8]();
}

uint64_t sub_25A236528()
{
  return MEMORY[0x270F561D0]();
}

uint64_t sub_25A236538()
{
  return MEMORY[0x270F561D8]();
}

uint64_t sub_25A236548()
{
  return MEMORY[0x270F561E0]();
}

uint64_t sub_25A236558()
{
  return MEMORY[0x270F561E8]();
}

uint64_t sub_25A236568()
{
  return MEMORY[0x270F561F8]();
}

uint64_t sub_25A236578()
{
  return MEMORY[0x270F56200]();
}

uint64_t sub_25A236588()
{
  return MEMORY[0x270F56208]();
}

uint64_t sub_25A236598()
{
  return MEMORY[0x270F56210]();
}

uint64_t sub_25A2365A8()
{
  return MEMORY[0x270F56218]();
}

uint64_t sub_25A2365B8()
{
  return MEMORY[0x270F56220]();
}

uint64_t sub_25A2365C8()
{
  return MEMORY[0x270F56228]();
}

uint64_t sub_25A2365D8()
{
  return MEMORY[0x270F56230]();
}

uint64_t sub_25A2365E8()
{
  return MEMORY[0x270F56238]();
}

uint64_t sub_25A2365F8()
{
  return MEMORY[0x270F56240]();
}

uint64_t sub_25A236608()
{
  return MEMORY[0x270F56268]();
}

uint64_t sub_25A236618()
{
  return MEMORY[0x270F56270]();
}

uint64_t sub_25A236628()
{
  return MEMORY[0x270F562A8]();
}

uint64_t sub_25A236638()
{
  return MEMORY[0x270F562B0]();
}

uint64_t sub_25A236648()
{
  return MEMORY[0x270F562B8]();
}

uint64_t sub_25A236658()
{
  return MEMORY[0x270F562C0]();
}

uint64_t sub_25A236668()
{
  return MEMORY[0x270F562C8]();
}

uint64_t sub_25A236678()
{
  return MEMORY[0x270F562D0]();
}

uint64_t sub_25A236688()
{
  return MEMORY[0x270F562F0]();
}

uint64_t sub_25A236698()
{
  return MEMORY[0x270F562F8]();
}

uint64_t sub_25A2366A8()
{
  return MEMORY[0x270F56300]();
}

uint64_t sub_25A2366B8()
{
  return MEMORY[0x270F56318]();
}

uint64_t sub_25A2366C8()
{
  return MEMORY[0x270F56328]();
}

uint64_t sub_25A2366D8()
{
  return MEMORY[0x270F56330]();
}

uint64_t sub_25A2366E8()
{
  return MEMORY[0x270F56338]();
}

uint64_t sub_25A2366F8()
{
  return MEMORY[0x270F56370]();
}

uint64_t sub_25A236708()
{
  return MEMORY[0x270F56380]();
}

uint64_t sub_25A236718()
{
  return MEMORY[0x270F56388]();
}

uint64_t sub_25A236728()
{
  return MEMORY[0x270F563A0]();
}

uint64_t sub_25A236738()
{
  return MEMORY[0x270F563A8]();
}

uint64_t sub_25A236748()
{
  return MEMORY[0x270F563B0]();
}

uint64_t sub_25A236758()
{
  return MEMORY[0x270F563C0]();
}

uint64_t sub_25A236768()
{
  return MEMORY[0x270F563C8]();
}

uint64_t sub_25A236778()
{
  return MEMORY[0x270F563D0]();
}

uint64_t sub_25A236788()
{
  return MEMORY[0x270F563D8]();
}

uint64_t sub_25A236798()
{
  return MEMORY[0x270F563F0]();
}

uint64_t sub_25A2367A8()
{
  return MEMORY[0x270F563F8]();
}

uint64_t sub_25A2367B8()
{
  return MEMORY[0x270F56420]();
}

uint64_t sub_25A2367C8()
{
  return MEMORY[0x270F56428]();
}

uint64_t sub_25A2367D8()
{
  return MEMORY[0x270F56430]();
}

uint64_t sub_25A2367E8()
{
  return MEMORY[0x270F56438]();
}

uint64_t sub_25A2367F8()
{
  return MEMORY[0x270F564D0]();
}

uint64_t sub_25A236808()
{
  return MEMORY[0x270F564D8]();
}

uint64_t sub_25A236818()
{
  return MEMORY[0x270F564E0]();
}

uint64_t sub_25A236828()
{
  return MEMORY[0x270F564E8]();
}

uint64_t sub_25A236838()
{
  return MEMORY[0x270F56510]();
}

uint64_t sub_25A236848()
{
  return MEMORY[0x270F56518]();
}

uint64_t sub_25A236858()
{
  return MEMORY[0x270F56520]();
}

uint64_t sub_25A236868()
{
  return MEMORY[0x270F56528]();
}

uint64_t sub_25A236878()
{
  return MEMORY[0x270F56530]();
}

uint64_t sub_25A236888()
{
  return MEMORY[0x270F56550]();
}

uint64_t sub_25A236898()
{
  return MEMORY[0x270F56558]();
}

uint64_t sub_25A2368A8()
{
  return MEMORY[0x270F56578]();
}

uint64_t sub_25A2368B8()
{
  return MEMORY[0x270F56580]();
}

uint64_t sub_25A2368C8()
{
  return MEMORY[0x270F56588]();
}

uint64_t sub_25A2368D8()
{
  return MEMORY[0x270F56590]();
}

uint64_t sub_25A2368E8()
{
  return MEMORY[0x270F56598]();
}

uint64_t sub_25A2368F8()
{
  return MEMORY[0x270F565A0]();
}

uint64_t sub_25A236908()
{
  return MEMORY[0x270F56600]();
}

uint64_t sub_25A236918()
{
  return MEMORY[0x270F56608]();
}

uint64_t sub_25A236928()
{
  return MEMORY[0x270F56610]();
}

uint64_t sub_25A236938()
{
  return MEMORY[0x270F56618]();
}

uint64_t sub_25A236948()
{
  return MEMORY[0x270F56620]();
}

uint64_t sub_25A236958()
{
  return MEMORY[0x270F56628]();
}

uint64_t sub_25A236968()
{
  return MEMORY[0x270F56660]();
}

uint64_t sub_25A236978()
{
  return MEMORY[0x270F56668]();
}

uint64_t sub_25A236988()
{
  return MEMORY[0x270F56670]();
}

uint64_t sub_25A236998()
{
  return MEMORY[0x270F566A8]();
}

uint64_t sub_25A2369A8()
{
  return MEMORY[0x270F566B0]();
}

uint64_t sub_25A2369B8()
{
  return MEMORY[0x270F566B8]();
}

uint64_t sub_25A2369C8()
{
  return MEMORY[0x270F566C0]();
}

uint64_t sub_25A2369D8()
{
  return MEMORY[0x270F566C8]();
}

uint64_t sub_25A2369E8()
{
  return MEMORY[0x270F566D0]();
}

uint64_t sub_25A2369F8()
{
  return MEMORY[0x270F566D8]();
}

uint64_t sub_25A236A08()
{
  return MEMORY[0x270F566E0]();
}

uint64_t sub_25A236A18()
{
  return MEMORY[0x270F566E8]();
}

uint64_t sub_25A236A28()
{
  return MEMORY[0x270F566F0]();
}

uint64_t sub_25A236A38()
{
  return MEMORY[0x270F566F8]();
}

uint64_t sub_25A236A48()
{
  return MEMORY[0x270F56700]();
}

uint64_t sub_25A236A58()
{
  return MEMORY[0x270F56708]();
}

uint64_t sub_25A236A68()
{
  return MEMORY[0x270F56710]();
}

uint64_t sub_25A236A78()
{
  return MEMORY[0x270F56718]();
}

uint64_t sub_25A236A88()
{
  return MEMORY[0x270F56720]();
}

uint64_t sub_25A236A98()
{
  return MEMORY[0x270F56728]();
}

uint64_t sub_25A236AA8()
{
  return MEMORY[0x270F56750]();
}

uint64_t sub_25A236AB8()
{
  return MEMORY[0x270F56758]();
}

uint64_t sub_25A236AC8()
{
  return MEMORY[0x270F56768]();
}

uint64_t sub_25A236AD8()
{
  return MEMORY[0x270F56770]();
}

uint64_t sub_25A236AE8()
{
  return MEMORY[0x270F56778]();
}

uint64_t sub_25A236AF8()
{
  return MEMORY[0x270F56780]();
}

uint64_t sub_25A236B08()
{
  return MEMORY[0x270F56788]();
}

uint64_t sub_25A236B18()
{
  return MEMORY[0x270F56790]();
}

uint64_t sub_25A236B28()
{
  return MEMORY[0x270F56798]();
}

uint64_t sub_25A236B38()
{
  return MEMORY[0x270F567A0]();
}

uint64_t sub_25A236B48()
{
  return MEMORY[0x270F567A8]();
}

uint64_t sub_25A236B58()
{
  return MEMORY[0x270F567B0]();
}

uint64_t sub_25A236B68()
{
  return MEMORY[0x270F567B8]();
}

uint64_t sub_25A236B78()
{
  return MEMORY[0x270F567C0]();
}

uint64_t sub_25A236B88()
{
  return MEMORY[0x270F567C8]();
}

uint64_t sub_25A236B98()
{
  return MEMORY[0x270F56800]();
}

uint64_t sub_25A236BA8()
{
  return MEMORY[0x270F56808]();
}

uint64_t sub_25A236BB8()
{
  return MEMORY[0x270F56810]();
}

uint64_t sub_25A236BC8()
{
  return MEMORY[0x270F56840]();
}

uint64_t sub_25A236BD8()
{
  return MEMORY[0x270F56858]();
}

uint64_t sub_25A236BE8()
{
  return MEMORY[0x270F56860]();
}

uint64_t sub_25A236BF8()
{
  return MEMORY[0x270F56868]();
}

uint64_t sub_25A236C08()
{
  return MEMORY[0x270F568C8]();
}

uint64_t sub_25A236C18()
{
  return MEMORY[0x270F568D0]();
}

uint64_t sub_25A236C28()
{
  return MEMORY[0x270F568D8]();
}

uint64_t sub_25A236C38()
{
  return MEMORY[0x270F568E0]();
}

uint64_t sub_25A236C48()
{
  return MEMORY[0x270F568E8]();
}

uint64_t sub_25A236C58()
{
  return MEMORY[0x270F568F0]();
}

uint64_t sub_25A236C68()
{
  return MEMORY[0x270F568F8]();
}

uint64_t sub_25A236C78()
{
  return MEMORY[0x270F56900]();
}

uint64_t sub_25A236C88()
{
  return MEMORY[0x270F56908]();
}

uint64_t sub_25A236C98()
{
  return MEMORY[0x270F56910]();
}

uint64_t sub_25A236CA8()
{
  return MEMORY[0x270F56918]();
}

uint64_t sub_25A236CB8()
{
  return MEMORY[0x270F56920]();
}

uint64_t sub_25A236CC8()
{
  return MEMORY[0x270F56928]();
}

uint64_t sub_25A236CD8()
{
  return MEMORY[0x270F56930]();
}

uint64_t sub_25A236CE8()
{
  return MEMORY[0x270F56968]();
}

uint64_t sub_25A236CF8()
{
  return MEMORY[0x270F56970]();
}

uint64_t sub_25A236D08()
{
  return MEMORY[0x270F56978]();
}

uint64_t sub_25A236D18()
{
  return MEMORY[0x270F56990]();
}

uint64_t sub_25A236D28()
{
  return MEMORY[0x270F569C8]();
}

uint64_t sub_25A236D38()
{
  return MEMORY[0x270F569D0]();
}

uint64_t sub_25A236D48()
{
  return MEMORY[0x270F56BA8]();
}

uint64_t sub_25A236D58()
{
  return MEMORY[0x270F56BB0]();
}

uint64_t sub_25A236D68()
{
  return MEMORY[0x270F56BC8]();
}

uint64_t sub_25A236D78()
{
  return MEMORY[0x270F56BD8]();
}

uint64_t sub_25A236D88()
{
  return MEMORY[0x270F56BE0]();
}

uint64_t sub_25A236D98()
{
  return MEMORY[0x270F56BF0]();
}

uint64_t sub_25A236DA8()
{
  return MEMORY[0x270F56C30]();
}

uint64_t sub_25A236DB8()
{
  return MEMORY[0x270F56C70]();
}

uint64_t sub_25A236DC8()
{
  return MEMORY[0x270F56C80]();
}

uint64_t sub_25A236DD8()
{
  return MEMORY[0x270F56C90]();
}

uint64_t sub_25A236DE8()
{
  return MEMORY[0x270F56C98]();
}

uint64_t sub_25A236DF8()
{
  return MEMORY[0x270F56CA0]();
}

uint64_t sub_25A236E08()
{
  return MEMORY[0x270F56CD8]();
}

uint64_t sub_25A236E18()
{
  return MEMORY[0x270F56CE0]();
}

uint64_t sub_25A236E28()
{
  return MEMORY[0x270F56CE8]();
}

uint64_t sub_25A236E38()
{
  return MEMORY[0x270F56D08]();
}

uint64_t sub_25A236E48()
{
  return MEMORY[0x270F56D10]();
}

uint64_t sub_25A236E58()
{
  return MEMORY[0x270F56D18]();
}

uint64_t sub_25A236E68()
{
  return MEMORY[0x270F56D20]();
}

uint64_t sub_25A236E78()
{
  return MEMORY[0x270F56D28]();
}

uint64_t sub_25A236E88()
{
  return MEMORY[0x270F56D30]();
}

uint64_t sub_25A236E98()
{
  return MEMORY[0x270F56D40]();
}

uint64_t sub_25A236EA8()
{
  return MEMORY[0x270F56D48]();
}

uint64_t sub_25A236EB8()
{
  return MEMORY[0x270F55618]();
}

uint64_t sub_25A236EC8()
{
  return MEMORY[0x270F55620]();
}

uint64_t sub_25A236ED8()
{
  return MEMORY[0x270F55678]();
}

uint64_t sub_25A236EE8()
{
  return MEMORY[0x270F55710]();
}

uint64_t sub_25A236EF8()
{
  return MEMORY[0x270F55718]();
}

uint64_t sub_25A236F08()
{
  return MEMORY[0x270F55720]();
}

uint64_t sub_25A236F18()
{
  return MEMORY[0x270F55728]();
}

uint64_t sub_25A236F28()
{
  return MEMORY[0x270F55730]();
}

uint64_t sub_25A236F48()
{
  return MEMORY[0x270F55740]();
}

uint64_t sub_25A236F58()
{
  return MEMORY[0x270F55748]();
}

uint64_t sub_25A236F68()
{
  return MEMORY[0x270F55750]();
}

uint64_t sub_25A236F78()
{
  return MEMORY[0x270F557F8]();
}

uint64_t sub_25A236F88()
{
  return MEMORY[0x270F55808]();
}

uint64_t sub_25A236F98()
{
  return MEMORY[0x270F55818]();
}

uint64_t sub_25A236FA8()
{
  return MEMORY[0x270F55828]();
}

uint64_t _s15PreviewShellKit21CanvasContentProviderPAAyt12HostedOutputRtzrlE6encode06hostedH020PreviewsFoundationOS12PropertyListVyt_tFZ_0()
{
  return MEMORY[0x270F55858]();
}

uint64_t sub_25A236FC8()
{
  return MEMORY[0x270F55880]();
}

uint64_t sub_25A236FD8()
{
  return MEMORY[0x270F55888]();
}

uint64_t sub_25A236FE8()
{
  return MEMORY[0x270F55890]();
}

uint64_t sub_25A236FF8()
{
  return MEMORY[0x270F55898]();
}

uint64_t sub_25A237008()
{
  return MEMORY[0x270F558A8]();
}

uint64_t sub_25A237018()
{
  return MEMORY[0x270F558B0]();
}

uint64_t sub_25A237028()
{
  return MEMORY[0x270F558B8]();
}

uint64_t sub_25A237038()
{
  return MEMORY[0x270F558C0]();
}

uint64_t sub_25A237048()
{
  return MEMORY[0x270F558C8]();
}

uint64_t sub_25A237058()
{
  return MEMORY[0x270F558D0]();
}

uint64_t sub_25A237068()
{
  return MEMORY[0x270F558D8]();
}

uint64_t sub_25A237078()
{
  return MEMORY[0x270F558E0]();
}

uint64_t sub_25A237088()
{
  return MEMORY[0x270F55908]();
}

uint64_t sub_25A237098()
{
  return MEMORY[0x270F55910]();
}

uint64_t sub_25A2370A8()
{
  return MEMORY[0x270F55928]();
}

uint64_t sub_25A2370B8()
{
  return MEMORY[0x270F55930]();
}

uint64_t sub_25A2370C8()
{
  return MEMORY[0x270F55938]();
}

uint64_t sub_25A2370D8()
{
  return MEMORY[0x270F55940]();
}

uint64_t sub_25A2370E8()
{
  return MEMORY[0x270F55948]();
}

uint64_t sub_25A2370F8()
{
  return MEMORY[0x270F55950]();
}

uint64_t sub_25A237108()
{
  return MEMORY[0x270F55980]();
}

uint64_t sub_25A237118()
{
  return MEMORY[0x270F55988]();
}

uint64_t sub_25A237128()
{
  return MEMORY[0x270F55998]();
}

uint64_t sub_25A237138()
{
  return MEMORY[0x270F559A0]();
}

uint64_t sub_25A237148()
{
  return MEMORY[0x270F559B0]();
}

uint64_t sub_25A237158()
{
  return MEMORY[0x270F559B8]();
}

uint64_t sub_25A237168()
{
  return MEMORY[0x270F559C0]();
}

uint64_t sub_25A237178()
{
  return MEMORY[0x270F559C8]();
}

uint64_t sub_25A237188()
{
  return MEMORY[0x270F559D0]();
}

uint64_t sub_25A237198()
{
  return MEMORY[0x270F559E0]();
}

uint64_t sub_25A2371A8()
{
  return MEMORY[0x270F559F8]();
}

uint64_t sub_25A2371B8()
{
  return MEMORY[0x270F55A00]();
}

uint64_t sub_25A2371D8()
{
  return MEMORY[0x270F55A10]();
}

uint64_t sub_25A2371E8()
{
  return MEMORY[0x270F55A18]();
}

uint64_t sub_25A2371F8()
{
  return MEMORY[0x270F55A20]();
}

uint64_t sub_25A237218()
{
  return MEMORY[0x270F55A30]();
}

uint64_t sub_25A237228()
{
  return MEMORY[0x270F55A38]();
}

uint64_t sub_25A237238()
{
  return MEMORY[0x270F55A40]();
}

uint64_t sub_25A237248()
{
  return MEMORY[0x270F55A50]();
}

uint64_t sub_25A237258()
{
  return MEMORY[0x270F55A58]();
}

uint64_t sub_25A237268()
{
  return MEMORY[0x270F55A60]();
}

uint64_t sub_25A237278()
{
  return MEMORY[0x270F55A68]();
}

uint64_t sub_25A237288()
{
  return MEMORY[0x270F55A70]();
}

uint64_t sub_25A237298()
{
  return MEMORY[0x270F55A78]();
}

uint64_t sub_25A2372A8()
{
  return MEMORY[0x270F55A80]();
}

uint64_t sub_25A2372B8()
{
  return MEMORY[0x270F55A88]();
}

uint64_t sub_25A2372C8()
{
  return MEMORY[0x270F55A90]();
}

uint64_t sub_25A2372D8()
{
  return MEMORY[0x270F55A98]();
}

uint64_t sub_25A2372E8()
{
  return MEMORY[0x270F55AA0]();
}

uint64_t sub_25A2372F8()
{
  return MEMORY[0x270F55AA8]();
}

uint64_t sub_25A237308()
{
  return MEMORY[0x270F55AB0]();
}

uint64_t sub_25A237318()
{
  return MEMORY[0x270F55AB8]();
}

uint64_t sub_25A237328()
{
  return MEMORY[0x270F55AC0]();
}

uint64_t sub_25A237338()
{
  return MEMORY[0x270F55B18]();
}

uint64_t sub_25A237348()
{
  return MEMORY[0x270F55B20]();
}

uint64_t sub_25A237358()
{
  return MEMORY[0x270F55B28]();
}

uint64_t sub_25A237368()
{
  return MEMORY[0x270F55B30]();
}

uint64_t sub_25A237378()
{
  return MEMORY[0x270F55B38]();
}

uint64_t sub_25A237388()
{
  return MEMORY[0x270F55B40]();
}

uint64_t sub_25A237398()
{
  return MEMORY[0x270F55B48]();
}

uint64_t sub_25A2373A8()
{
  return MEMORY[0x270F55B50]();
}

uint64_t sub_25A2373B8()
{
  return MEMORY[0x270F55B58]();
}

uint64_t sub_25A2373C8()
{
  return MEMORY[0x270F55B60]();
}

uint64_t sub_25A2373D8()
{
  return MEMORY[0x270F55B68]();
}

uint64_t sub_25A2373F8()
{
  return MEMORY[0x270F55B78]();
}

uint64_t sub_25A237418()
{
  return MEMORY[0x270F55B88]();
}

uint64_t sub_25A237428()
{
  return MEMORY[0x270F55BA0]();
}

uint64_t sub_25A237438()
{
  return MEMORY[0x270F55BA8]();
}

uint64_t sub_25A237448()
{
  return MEMORY[0x270F55BB0]();
}

uint64_t sub_25A237458()
{
  return MEMORY[0x270F55BB8]();
}

uint64_t sub_25A237468()
{
  return MEMORY[0x270F55BC0]();
}

uint64_t sub_25A237478()
{
  return MEMORY[0x270F55BC8]();
}

uint64_t sub_25A2374A8()
{
  return MEMORY[0x270F55BE0]();
}

uint64_t sub_25A2374C8()
{
  return MEMORY[0x270F55BF0]();
}

uint64_t sub_25A2374D8()
{
  return MEMORY[0x270F55C00]();
}

uint64_t sub_25A2374E8()
{
  return MEMORY[0x270F55C08]();
}

uint64_t sub_25A2374F8()
{
  return MEMORY[0x270F55C18]();
}

uint64_t sub_25A237508()
{
  return MEMORY[0x270F55C20]();
}

uint64_t sub_25A237518()
{
  return MEMORY[0x270F55C48]();
}

uint64_t sub_25A237528()
{
  return MEMORY[0x270F55C50]();
}

uint64_t sub_25A237538()
{
  return MEMORY[0x270F55C90]();
}

uint64_t sub_25A237548()
{
  return MEMORY[0x270F55C98]();
}

uint64_t sub_25A237558()
{
  return MEMORY[0x270F55CA0]();
}

uint64_t sub_25A237568()
{
  return MEMORY[0x270F55CA8]();
}

uint64_t sub_25A237578()
{
  return MEMORY[0x270F55CB0]();
}

uint64_t sub_25A237588()
{
  return MEMORY[0x270F55CB8]();
}

uint64_t sub_25A237598()
{
  return MEMORY[0x270F55CC0]();
}

uint64_t sub_25A2375A8()
{
  return MEMORY[0x270F55CC8]();
}

uint64_t sub_25A2375B8()
{
  return MEMORY[0x270F55CD0]();
}

uint64_t sub_25A2375C8()
{
  return MEMORY[0x270F55CF0]();
}

uint64_t sub_25A2375D8()
{
  return MEMORY[0x270F55CF8]();
}

uint64_t sub_25A2375E8()
{
  return MEMORY[0x270F55D00]();
}

uint64_t sub_25A2375F8()
{
  return MEMORY[0x270F55D08]();
}

uint64_t sub_25A237608()
{
  return MEMORY[0x270F55D10]();
}

uint64_t sub_25A237618()
{
  return MEMORY[0x270F55D18]();
}

uint64_t sub_25A237628()
{
  return MEMORY[0x270F55D20]();
}

uint64_t sub_25A237638()
{
  return MEMORY[0x270F55D28]();
}

uint64_t sub_25A237648()
{
  return MEMORY[0x270F55D30]();
}

uint64_t sub_25A237658()
{
  return MEMORY[0x270F55D38]();
}

uint64_t sub_25A237668()
{
  return MEMORY[0x270F55D40]();
}

uint64_t sub_25A237678()
{
  return MEMORY[0x270F55D48]();
}

uint64_t sub_25A237688()
{
  return MEMORY[0x270F55D50]();
}

uint64_t sub_25A237698()
{
  return MEMORY[0x270F55D58]();
}

uint64_t sub_25A2376A8()
{
  return MEMORY[0x270F55D60]();
}

uint64_t sub_25A2376B8()
{
  return MEMORY[0x270F55D68]();
}

uint64_t sub_25A2376C8()
{
  return MEMORY[0x270F55D70]();
}

uint64_t sub_25A2376D8()
{
  return MEMORY[0x270F55D78]();
}

uint64_t sub_25A2376E8()
{
  return MEMORY[0x270F55D80]();
}

uint64_t sub_25A2376F8()
{
  return MEMORY[0x270F55D88]();
}

uint64_t sub_25A237728()
{
  return MEMORY[0x270F55DA0]();
}

uint64_t sub_25A237738()
{
  return MEMORY[0x270F55DA8]();
}

uint64_t sub_25A237748()
{
  return MEMORY[0x270F55DB0]();
}

uint64_t sub_25A237758()
{
  return MEMORY[0x270F55DB8]();
}

uint64_t sub_25A237768()
{
  return MEMORY[0x270F55DC0]();
}

uint64_t sub_25A237778()
{
  return MEMORY[0x270F55DC8]();
}

uint64_t sub_25A237788()
{
  return MEMORY[0x270F55DD0]();
}

uint64_t sub_25A237798()
{
  return MEMORY[0x270F55DE0]();
}

uint64_t sub_25A2377A8()
{
  return MEMORY[0x270F55DF8]();
}

uint64_t sub_25A2377B8()
{
  return MEMORY[0x270F55E20]();
}

uint64_t sub_25A2377C8()
{
  return MEMORY[0x270F55E28]();
}

uint64_t sub_25A2377D8()
{
  return MEMORY[0x270F55E40]();
}

uint64_t sub_25A2377E8()
{
  return MEMORY[0x270F55E48]();
}

uint64_t sub_25A2377F8()
{
  return MEMORY[0x270F56D58]();
}

uint64_t sub_25A237808()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25A237818()
{
  return MEMORY[0x270F55E50]();
}

uint64_t sub_25A237828()
{
  return MEMORY[0x270F55E58]();
}

uint64_t sub_25A237838()
{
  return MEMORY[0x270F55E68]();
}

uint64_t sub_25A237848()
{
  return MEMORY[0x270F55E70]();
}

uint64_t sub_25A237858()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A237868()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A237878()
{
  return MEMORY[0x270F87358]();
}

uint64_t sub_25A237888()
{
  return MEMORY[0x270F87360]();
}

uint64_t sub_25A237898()
{
  return MEMORY[0x270F87368]();
}

uint64_t sub_25A2378A8()
{
  return MEMORY[0x270F87370]();
}

uint64_t sub_25A2378B8()
{
  return MEMORY[0x270F87378]();
}

uint64_t sub_25A2378C8()
{
  return MEMORY[0x270F87380]();
}

uint64_t sub_25A2378D8()
{
  return MEMORY[0x270F87388]();
}

uint64_t sub_25A2378E8()
{
  return MEMORY[0x270F87390]();
}

uint64_t sub_25A2378F8()
{
  return MEMORY[0x270F87398]();
}

uint64_t sub_25A237908()
{
  return MEMORY[0x270F873A0]();
}

uint64_t sub_25A237918()
{
  return MEMORY[0x270F873A8]();
}

uint64_t sub_25A237928()
{
  return MEMORY[0x270F873B0]();
}

uint64_t sub_25A237938()
{
  return MEMORY[0x270F873B8]();
}

uint64_t sub_25A237948()
{
  return MEMORY[0x270F873C0]();
}

uint64_t sub_25A237958()
{
  return MEMORY[0x270F873C8]();
}

uint64_t sub_25A237968()
{
  return MEMORY[0x270F873D0]();
}

uint64_t sub_25A237978()
{
  return MEMORY[0x270F873D8]();
}

uint64_t sub_25A237988()
{
  return MEMORY[0x270F873E0]();
}

uint64_t sub_25A237998()
{
  return MEMORY[0x270F873E8]();
}

uint64_t sub_25A2379A8()
{
  return MEMORY[0x270F873F0]();
}

uint64_t sub_25A2379B8()
{
  return MEMORY[0x270F873F8]();
}

uint64_t sub_25A2379C8()
{
  return MEMORY[0x270F87400]();
}

uint64_t sub_25A2379D8()
{
  return MEMORY[0x270F87408]();
}

uint64_t sub_25A2379E8()
{
  return MEMORY[0x270F87410]();
}

uint64_t sub_25A2379F8()
{
  return MEMORY[0x270F87418]();
}

uint64_t sub_25A237A08()
{
  return MEMORY[0x270F87420]();
}

uint64_t sub_25A237A18()
{
  return MEMORY[0x270F87428]();
}

uint64_t sub_25A237A28()
{
  return MEMORY[0x270F87430]();
}

uint64_t sub_25A237A38()
{
  return MEMORY[0x270F87438]();
}

uint64_t sub_25A237A48()
{
  return MEMORY[0x270F87440]();
}

uint64_t sub_25A237A58()
{
  return MEMORY[0x270F87448]();
}

uint64_t sub_25A237A68()
{
  return MEMORY[0x270F87450]();
}

uint64_t sub_25A237A78()
{
  return MEMORY[0x270F87458]();
}

uint64_t sub_25A237A88()
{
  return MEMORY[0x270F87460]();
}

uint64_t sub_25A237A98()
{
  return MEMORY[0x270F87468]();
}

uint64_t sub_25A237AA8()
{
  return MEMORY[0x270F87470]();
}

uint64_t sub_25A237AB8()
{
  return MEMORY[0x270F87478]();
}

uint64_t sub_25A237AC8()
{
  return MEMORY[0x270F87480]();
}

uint64_t sub_25A237AD8()
{
  return MEMORY[0x270F87488]();
}

uint64_t sub_25A237AE8()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_25A237AF8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25A237B08()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_25A237B18()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_25A237B28()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25A237B38()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25A237B48()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_25A237B58()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_25A237B68()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_25A237B78()
{
  return MEMORY[0x270F008B8]();
}

uint64_t sub_25A237B88()
{
  return MEMORY[0x270F008C0]();
}

uint64_t sub_25A237B98()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_25A237BA8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_25A237BB8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25A237BC8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25A237BD8()
{
  return MEMORY[0x270F00B18]();
}

uint64_t sub_25A237BE8()
{
  return MEMORY[0x270F00B20]();
}

uint64_t sub_25A237BF8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25A237C08()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25A237C18()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_25A237C28()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_25A237C38()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25A237C48()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25A237C58()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25A237C68()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_25A237C78()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25A237C88()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25A237C98()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25A237CA8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25A237CB8()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_25A237CC8()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_25A237CD8()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_25A237CE8()
{
  return MEMORY[0x270F02118]();
}

uint64_t sub_25A237CF8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25A237D08()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25A237D18()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_25A237D28()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_25A237D38()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25A237D48()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_25A237D58()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_25A237D68()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_25A237D78()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_25A237D88()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_25A237D98()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_25A237DA8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_25A237DB8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25A237DC8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25A237DD8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25A237DE8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_25A237DF8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25A237E08()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_25A237E18()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_25A237E28()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25A237E38()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25A237E48()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_25A237E58()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_25A237E68()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_25A237E78()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25A237E88()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25A237E98()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25A237EA8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25A237EB8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25A237EC8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_25A237ED8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_25A237EE8()
{
  return MEMORY[0x270F04F78]();
}

uint64_t sub_25A237EF8()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_25A237F08()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25A237F18()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_25A237F28()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25A237F38()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25A237F48()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25A237F58()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25A237F68()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25A237F78()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25A237F88()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25A237F98()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25A237FA8()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25A237FB8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25A237FC8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25A237FD8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25A237FE8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25A237FF8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25A238008()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25A238018()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25A238028()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25A238038()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25A238048()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_25A238058()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25A238068()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25A238078()
{
  return MEMORY[0x270F55E78]();
}

uint64_t sub_25A238088()
{
  return MEMORY[0x270F55E80]();
}

uint64_t sub_25A238098()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A2380A8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25A2380B8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_25A2380C8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A2380D8()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25A2380E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A2380F8()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25A238108()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25A238118()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_25A238138()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25A238148()
{
  return MEMORY[0x270F9D980]();
}

uint64_t sub_25A238158()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_25A238168()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25A238178()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25A238188()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25A238198()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25A2381A8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25A2381B8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25A2381C8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25A2381D8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25A2381E8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25A2381F8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25A238208()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A238218()
{
  return MEMORY[0x270F55EC0]();
}

uint64_t sub_25A238228()
{
  return MEMORY[0x270FA1E08]();
}

uint64_t sub_25A238238()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25A238248()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25A238258()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A238268()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A238278()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_25A238288()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25A238298()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25A2382A8()
{
  return MEMORY[0x270F55ED0]();
}

uint64_t sub_25A2382B8()
{
  return MEMORY[0x270F55ED8]();
}

uint64_t sub_25A2382C8()
{
  return MEMORY[0x270F55EE0]();
}

uint64_t sub_25A2382D8()
{
  return MEMORY[0x270F55EE8]();
}

uint64_t sub_25A2382E8()
{
  return MEMORY[0x270F55EF0]();
}

uint64_t sub_25A238308()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_25A238318()
{
  return MEMORY[0x270F55EF8]();
}

uint64_t sub_25A238328()
{
  return MEMORY[0x270F55F00]();
}

uint64_t sub_25A238338()
{
  return MEMORY[0x270F55F08]();
}

uint64_t sub_25A238368()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t sub_25A238388()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25A238398()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_25A2383A8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25A2383B8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25A2383C8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25A2383D8()
{
  return MEMORY[0x270F55F18]();
}

uint64_t sub_25A2383E8()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25A2383F8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25A238408()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25A238418()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A238428()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25A238438()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A238448()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25A238458()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25A238468()
{
  return MEMORY[0x270F56B78]();
}

uint64_t sub_25A238488()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25A238498()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25A2384A8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25A2384B8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25A2384C8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25A2384D8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25A2384E8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25A2384F8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A238508()
{
  return MEMORY[0x270F55F48]();
}

uint64_t sub_25A238518()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_25A238528()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_25A238538()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25A238548()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A238558()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A238568()
{
  return MEMORY[0x270EF2578]();
}

uint64_t sub_25A238578()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A238588()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25A238598()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25A2385A8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25A2385B8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25A2385C8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25A2385D8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25A2385E8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25A2385F8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A238608()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A238618()
{
  return MEMORY[0x270F9E9E0]();
}

uint64_t sub_25A238628()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25A238638()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A238648()
{
  return MEMORY[0x270F9ECE8]();
}

uint64_t sub_25A238658()
{
  return MEMORY[0x270F9ECF0]();
}

uint64_t sub_25A238668()
{
  return MEMORY[0x270F9ECF8]();
}

uint64_t sub_25A238678()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t sub_25A238688()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A238698()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A2386A8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25A2386B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25A2386C8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25A2386D8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A2386E8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A2386F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A238708()
{
  return MEMORY[0x270F9F148]();
}

uint64_t sub_25A238718()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25A238728()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A238738()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25A238748()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_25A238758()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A238778()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25A238788()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A238798()
{
  return MEMORY[0x270F55F58]();
}

uint64_t sub_25A2387A8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A2387B8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A2387C8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A2387D8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A2387E8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25A2387F8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A238808()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A238818()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25A238828()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25A238838()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A238848()
{
  return MEMORY[0x270F55F68]();
}

uint64_t sub_25A238858()
{
  return MEMORY[0x270FA0128]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5C38](space);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

CGImageByteOrderInfo CGImageGetByteOrderInfo(CGImageRef image)
{
  return MEMORY[0x270EE67B0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x270ED8F88]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_free()
{
  return MEMORY[0x270ED9068]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x270ED9070]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x270ED90B0]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x270ED90C0]();
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}