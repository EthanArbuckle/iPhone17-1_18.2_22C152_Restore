uint64_t assignWithCopy for MatchesCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
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
  uint64_t v21;
  unsigned __int16 *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  unint64_t v29;
  uint64_t (*v30)(unint64_t, uint64_t, uint64_t);
  unsigned __int16 *v31;
  uint64_t v32;
  size_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  uint64_t v38;
  char v39;
  int v40;
  int v41;
  int v42;
  uint64_t (*v43)(unsigned __int16 *, uint64_t, uint64_t);
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  void (*v51)(unsigned __int16 *, uint64_t);
  int v52;
  size_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(unsigned __int16 *, unsigned __int8 *, uint64_t);
  void (*v58)(unsigned __int16 *, unsigned __int8 *, uint64_t);
  size_t v59;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v5 = *(void *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, AssociatedTypeWitness);
  v8 = *(void *)(v7 + 40);
  v9 = *(void *)(v5 - 8);
  v10 = v9 + 24;
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = v8 + v11;
  v68 = a1;
  v71 = (v12 + a1) & ~v11;
  v73 = (v12 + a2) & ~v11;
  (*(void (**)(void))(v9 + 24))();
  v69 = *(void *)(v10 + 40);
  swift_getAssociatedConformanceWitness();
  v65 = swift_getAssociatedTypeWitness();
  v13 = *(void *)(v65 - 8);
  v14 = v13;
  v15 = *(unsigned __int8 *)(v13 + 80);
  v75 = swift_getAssociatedTypeWitness();
  v16 = *(void *)(v75 - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = swift_getAssociatedTypeWitness();
  v19 = v13;
  v20 = *(unsigned __int8 *)(*(void *)(v18 - 8) + 80);
  v21 = v17 | v20 | v15;
  v22 = (unsigned __int16 *)((v21 + v69 + v71) & ~v21);
  v23 = (unsigned __int8 *)((v21 + v69 + v73) & ~v21);
  v72 = (void *)v14;
  v74 = v16;
  v24 = *(unsigned int *)(v14 + 84);
  v25 = *(unsigned int *)(v16 + 84);
  v26 = *(void *)(v19 + 64);
  v27 = ((v26 + v15) & ~v15) + v26 + v17;
  v28 = (v27 & ~v17) + *(void *)(v16 + 64);
  v66 = v18;
  v67 = *(void *)(v18 - 8);
  v70 = v25 | v24;
  v63 = ~v15;
  v64 = ~v17;
  v62 = v26 + v15;
  if (!(v25 | v24))
  {
    v39 = 8 * v28;
    v38 = v65;
    if (*((unsigned char *)v22 + v28))
    {
      v40 = (*((unsigned __int8 *)v22 + v28) - 1) << v39;
      if (v28 > 3) {
        v40 = 0;
      }
      if (v28)
      {
        v41 = v28 <= 3 ? v28 : 4;
        switch(v41)
        {
          case 2:
            v42 = *v22;
            break;
          case 3:
            v42 = *v22 | (*((unsigned __int8 *)v22 + 2) << 16);
            break;
          case 4:
            v42 = *(_DWORD *)v22;
            break;
          default:
            v42 = *(unsigned __int8 *)v22;
            break;
        }
      }
      else
      {
        v42 = 0;
      }
      if ((v42 | v40) != 0xFFFFFFFF)
      {
        if (!v23[v28]) {
          goto LABEL_57;
        }
        v45 = (v23[v28] - 1) << v39;
        if (v28 > 3) {
          v45 = 0;
        }
        if (v28)
        {
          v46 = v28 <= 3 ? v28 : 4;
          switch(v46)
          {
            case 2:
              v47 = *(unsigned __int16 *)v23;
              break;
            case 3:
              v47 = *(unsigned __int16 *)v23 | (v23[2] << 16);
              break;
            case 4:
              v47 = *(_DWORD *)v23;
              break;
            default:
              v47 = *v23;
              break;
          }
        }
        else
        {
          v47 = 0;
        }
        if ((v47 | v45) == 0xFFFFFFFF) {
          goto LABEL_57;
        }
LABEL_48:
        v52 = v70;
        if (v70) {
          v53 = v28;
        }
        else {
          v53 = v28 + 1;
        }
        memcpy(v22, v23, v53);
        v54 = v67;
        v55 = v68;
        v56 = v66;
        goto LABEL_59;
      }
    }
    if (!v23[v28]) {
      goto LABEL_52;
    }
    v48 = (v23[v28] - 1) << v39;
    if (v28 > 3) {
      v48 = 0;
    }
    if (v28)
    {
      v49 = v28 <= 3 ? v28 : 4;
      switch(v49)
      {
        case 2:
          v50 = *(unsigned __int16 *)v23;
          break;
        case 3:
          v50 = *(unsigned __int16 *)v23 | (v23[2] << 16);
          break;
        case 4:
          v50 = *(_DWORD *)v23;
          break;
        default:
          v50 = *v23;
          break;
      }
    }
    else
    {
      v50 = 0;
    }
    if ((v50 | v48) == 0xFFFFFFFF)
    {
LABEL_52:
      v57 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v72[3];
      v57(v22, v23, v38);
      v57((unsigned __int16 *)(((unint64_t)v22 + v62) & v63), (unsigned __int8 *)((unint64_t)&v23[v62] & v63), v38);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v74 + 24))(((unint64_t)v22 + v27) & v64, (unint64_t)&v23[v27] & v64, v75);
      v54 = v67;
      v55 = v68;
      v56 = v66;
      v52 = v70;
      goto LABEL_59;
    }
LABEL_47:
    v51 = (void (*)(unsigned __int16 *, uint64_t))v72[1];
    v51(v22, v38);
    v51((unsigned __int16 *)(((unint64_t)v22 + v62) & v63), v38);
    (*(void (**)(unint64_t, uint64_t))(v74 + 8))(((unint64_t)v22 + v27) & v64, v75);
    goto LABEL_48;
  }
  if (v24 < v25)
  {
    v29 = ((unint64_t)v22 + v27) & ~v17;
    v30 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v74 + 48);
    v31 = v22;
    v32 = v20;
    v33 = v28;
    v34 = v23;
    v35 = ((v26 + v15) & ~v15) + v26 + v17;
    v61 = v30(v29, v25, v75);
    v36 = (unint64_t)&v34[v35] & ~v17;
    v27 = v35;
    v23 = v34;
    v28 = v33;
    v20 = v32;
    v22 = v31;
    v37 = v30(v36, v25, v75);
    v38 = v65;
    if (v61) {
      goto LABEL_4;
    }
LABEL_16:
    if (!v37) {
      goto LABEL_52;
    }
    goto LABEL_47;
  }
  v43 = (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t))v72[6];
  v38 = v65;
  v44 = v43(v22, v24, v65);
  v37 = v43((unsigned __int16 *)v23, v24, v65);
  if (!v44) {
    goto LABEL_16;
  }
LABEL_4:
  if (v37) {
    goto LABEL_48;
  }
LABEL_57:
  v58 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v72[2];
  v58(v22, v23, v38);
  v58((unsigned __int16 *)(((unint64_t)v22 + v62) & v63), (unsigned __int8 *)((unint64_t)&v23[v62] & v63), v38);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v74 + 16))(((unint64_t)v22 + v27) & v64, (unint64_t)&v23[v27] & v64, v75);
  v54 = v67;
  v55 = v68;
  v56 = v66;
  v52 = v70;
  if (!v70) {
    *((unsigned char *)v22 + v28) = 0;
  }
LABEL_59:
  if (v52) {
    v59 = v28;
  }
  else {
    v59 = v28 + 1;
  }
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v54 + 24))(((unint64_t)v22 + v20 + v59) & ~v20, (unint64_t)&v23[v20 + v59] & ~v20, v56);
  return v55;
}

uint64_t initializeWithTake for MatchesCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v7 + 32);
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v10 = v9 + 32;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = v8 + v11;
  uint64_t v52 = a1;
  uint64_t v47 = (v12 + a1) & ~v11;
  uint64_t v49 = (v12 + a2) & ~v11;
  (*(void (**)(void))(v9 + 32))();
  uint64_t v45 = *(void *)(v10 + 32);
  swift_getAssociatedConformanceWitness();
  uint64_t v44 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v44 - 8);
  uint64_t v14 = v13;
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v43 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v43 - 8);
  uint64_t v17 = v16;
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_getAssociatedTypeWitness();
  uint64_t v20 = v13;
  uint64_t v21 = *(unsigned __int8 *)(*(void *)(v19 - 8) + 80);
  uint64_t v22 = v18 | v21 | v15;
  v23 = (void *)((v22 + v45 + v47) & ~v22);
  v24 = (unsigned __int8 *)((v22 + v45 + v49) & ~v22);
  uint64_t v48 = v14;
  uint64_t v25 = *(unsigned int *)(v14 + 84);
  unsigned int v26 = *(_DWORD *)(v16 + 84);
  uint64_t v27 = *(void *)(v20 + 64);
  uint64_t v28 = v15;
  uint64_t v29 = ((v27 + v15) & ~v15) + v27 + v18;
  size_t v30 = (v29 & ~v18) + *(void *)(v16 + 64);
  int v31 = v26 | v25;
  uint64_t v50 = *(void *)(v19 - 8);
  uint64_t v51 = v19;
  uint64_t v46 = v29;
  uint64_t v42 = v27 + v15;
  if (v26 | v25)
  {
    if (v25 >= v26) {
      int v32 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v48 + 48))(v24, v25, v44);
    }
    else {
      int v32 = (*(uint64_t (**)(unint64_t))(v17 + 48))((unint64_t)&v24[v29] & ~v18);
    }
    v33 = v23;
    if (v32)
    {
LABEL_15:
      if (v31) {
        size_t v37 = v30;
      }
      else {
        size_t v37 = v30 + 1;
      }
      memcpy(v33, v24, v37);
      goto LABEL_26;
    }
  }
  else
  {
    v33 = v23;
    if (v24[v30])
    {
      int v34 = (v24[v30] - 1) << (8 * v30);
      if (v30 > 3) {
        int v34 = 0;
      }
      if (v30)
      {
        int v35 = v30 <= 3 ? v30 : 4;
        switch(v35)
        {
          case 2:
            int v36 = *(unsigned __int16 *)v24;
            break;
          case 3:
            int v36 = *(unsigned __int16 *)v24 | (v24[2] << 16);
            break;
          case 4:
            int v36 = *(_DWORD *)v24;
            break;
          default:
            int v36 = *v24;
            break;
        }
      }
      else
      {
        int v36 = 0;
      }
      if ((v36 | v34) != 0xFFFFFFFF) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v38 = ~v18;
  v39 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v48 + 32);
  v39(v33, v24, v44);
  v39((void *)(((unint64_t)v33 + v42) & ~v28), (unsigned __int8 *)((unint64_t)&v24[v42] & ~v28), v44);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 32))(((unint64_t)v33 + v46) & v38, (unint64_t)&v24[v46] & v38, v43);
  if (!v31) {
    *((unsigned char *)v33 + v30) = 0;
  }
LABEL_26:
  if (v31) {
    size_t v40 = v30;
  }
  else {
    size_t v40 = v30 + 1;
  }
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 32))(((unint64_t)v33 + v21 + v40) & ~v21, (unint64_t)&v24[v21 + v40] & ~v21, v51);
  return v52;
}

uint64_t assignWithTake for MatchesCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v7 + 24);
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v10 = v9 + 40;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = v8 + v11;
  uint64_t v68 = a1;
  uint64_t v71 = (v12 + a1) & ~v11;
  uint64_t v73 = (v12 + a2) & ~v11;
  (*(void (**)(void))(v9 + 40))();
  uint64_t v69 = *(void *)(v10 + 24);
  swift_getAssociatedConformanceWitness();
  uint64_t v65 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v65 - 8);
  uint64_t v14 = v13;
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v75 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v75 - 8);
  uint64_t v17 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = v13;
  uint64_t v20 = *(unsigned __int8 *)(*(void *)(v18 - 8) + 80);
  uint64_t v21 = v17 | v20 | v15;
  uint64_t v22 = (unsigned __int16 *)((v21 + v69 + v71) & ~v21);
  v23 = (unsigned __int8 *)((v21 + v69 + v73) & ~v21);
  v72 = (void *)v14;
  uint64_t v74 = v16;
  uint64_t v24 = *(unsigned int *)(v14 + 84);
  uint64_t v25 = *(unsigned int *)(v16 + 84);
  uint64_t v26 = *(void *)(v19 + 64);
  uint64_t v27 = ((v26 + v15) & ~v15) + v26 + v17;
  size_t v28 = (v27 & ~v17) + *(void *)(v16 + 64);
  uint64_t v66 = v18;
  uint64_t v67 = *(void *)(v18 - 8);
  int v70 = v25 | v24;
  uint64_t v63 = ~v15;
  uint64_t v64 = ~v17;
  uint64_t v62 = v26 + v15;
  if (!(v25 | v24))
  {
    char v39 = 8 * v28;
    uint64_t v38 = v65;
    if (*((unsigned char *)v22 + v28))
    {
      int v40 = (*((unsigned __int8 *)v22 + v28) - 1) << v39;
      if (v28 > 3) {
        int v40 = 0;
      }
      if (v28)
      {
        int v41 = v28 <= 3 ? v28 : 4;
        switch(v41)
        {
          case 2:
            int v42 = *v22;
            break;
          case 3:
            int v42 = *v22 | (*((unsigned __int8 *)v22 + 2) << 16);
            break;
          case 4:
            int v42 = *(_DWORD *)v22;
            break;
          default:
            int v42 = *(unsigned __int8 *)v22;
            break;
        }
      }
      else
      {
        int v42 = 0;
      }
      if ((v42 | v40) != 0xFFFFFFFF)
      {
        if (!v23[v28]) {
          goto LABEL_57;
        }
        int v45 = (v23[v28] - 1) << v39;
        if (v28 > 3) {
          int v45 = 0;
        }
        if (v28)
        {
          int v46 = v28 <= 3 ? v28 : 4;
          switch(v46)
          {
            case 2:
              int v47 = *(unsigned __int16 *)v23;
              break;
            case 3:
              int v47 = *(unsigned __int16 *)v23 | (v23[2] << 16);
              break;
            case 4:
              int v47 = *(_DWORD *)v23;
              break;
            default:
              int v47 = *v23;
              break;
          }
        }
        else
        {
          int v47 = 0;
        }
        if ((v47 | v45) == 0xFFFFFFFF) {
          goto LABEL_57;
        }
LABEL_48:
        int v52 = v70;
        if (v70) {
          size_t v53 = v28;
        }
        else {
          size_t v53 = v28 + 1;
        }
        memcpy(v22, v23, v53);
        uint64_t v54 = v67;
        uint64_t v55 = v68;
        uint64_t v56 = v66;
        goto LABEL_59;
      }
    }
    if (!v23[v28]) {
      goto LABEL_52;
    }
    int v48 = (v23[v28] - 1) << v39;
    if (v28 > 3) {
      int v48 = 0;
    }
    if (v28)
    {
      int v49 = v28 <= 3 ? v28 : 4;
      switch(v49)
      {
        case 2:
          int v50 = *(unsigned __int16 *)v23;
          break;
        case 3:
          int v50 = *(unsigned __int16 *)v23 | (v23[2] << 16);
          break;
        case 4:
          int v50 = *(_DWORD *)v23;
          break;
        default:
          int v50 = *v23;
          break;
      }
    }
    else
    {
      int v50 = 0;
    }
    if ((v50 | v48) == 0xFFFFFFFF)
    {
LABEL_52:
      v57 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v72[5];
      v57(v22, v23, v38);
      v57((unsigned __int16 *)(((unint64_t)v22 + v62) & v63), (unsigned __int8 *)((unint64_t)&v23[v62] & v63), v38);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v74 + 40))(((unint64_t)v22 + v27) & v64, (unint64_t)&v23[v27] & v64, v75);
      uint64_t v54 = v67;
      uint64_t v55 = v68;
      uint64_t v56 = v66;
      int v52 = v70;
      goto LABEL_59;
    }
LABEL_47:
    uint64_t v51 = (void (*)(unsigned __int16 *, uint64_t))v72[1];
    v51(v22, v38);
    v51((unsigned __int16 *)(((unint64_t)v22 + v62) & v63), v38);
    (*(void (**)(unint64_t, uint64_t))(v74 + 8))(((unint64_t)v22 + v27) & v64, v75);
    goto LABEL_48;
  }
  if (v24 < v25)
  {
    unint64_t v29 = ((unint64_t)v22 + v27) & ~v17;
    size_t v30 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v74 + 48);
    int v31 = v22;
    uint64_t v32 = v20;
    size_t v33 = v28;
    int v34 = v23;
    uint64_t v35 = ((v26 + v15) & ~v15) + v26 + v17;
    int v61 = v30(v29, v25, v75);
    unint64_t v36 = (unint64_t)&v34[v35] & ~v17;
    uint64_t v27 = v35;
    v23 = v34;
    size_t v28 = v33;
    uint64_t v20 = v32;
    uint64_t v22 = v31;
    int v37 = v30(v36, v25, v75);
    uint64_t v38 = v65;
    if (v61) {
      goto LABEL_4;
    }
LABEL_16:
    if (!v37) {
      goto LABEL_52;
    }
    goto LABEL_47;
  }
  uint64_t v43 = (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t))v72[6];
  uint64_t v38 = v65;
  int v44 = v43(v22, v24, v65);
  int v37 = v43((unsigned __int16 *)v23, v24, v65);
  if (!v44) {
    goto LABEL_16;
  }
LABEL_4:
  if (v37) {
    goto LABEL_48;
  }
LABEL_57:
  v58 = (void (*)(unsigned __int16 *, unsigned __int8 *, uint64_t))v72[4];
  v58(v22, v23, v38);
  v58((unsigned __int16 *)(((unint64_t)v22 + v62) & v63), (unsigned __int8 *)((unint64_t)&v23[v62] & v63), v38);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v74 + 32))(((unint64_t)v22 + v27) & v64, (unint64_t)&v23[v27] & v64, v75);
  uint64_t v54 = v67;
  uint64_t v55 = v68;
  uint64_t v56 = v66;
  int v52 = v70;
  if (!v70) {
    *((unsigned char *)v22 + v28) = 0;
  }
LABEL_59:
  if (v52) {
    size_t v59 = v28;
  }
  else {
    size_t v59 = v28 + 1;
  }
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v54 + 40))(((unint64_t)v22 + v20 + v59) & ~v20, (unint64_t)&v23[v20 + v59] & ~v20, v56);
  return v55;
}

uint64_t getEnumTagSinglePayload for MatchesCollection(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v51 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v52 = *(void *)(v3 - 8);
  unsigned int v5 = *(_DWORD *)(v52 + 84);
  unsigned int v46 = v5;
  unsigned int v47 = *(_DWORD *)(v51 + 84);
  if (v5 <= v47) {
    unsigned int v5 = *(_DWORD *)(v51 + 84);
  }
  unsigned int v50 = v5;
  swift_getAssociatedConformanceWitness();
  uint64_t v49 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v6 = *(_DWORD *)(v49 + 84);
  uint64_t v43 = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(v43 - 8);
  unsigned int v44 = v6;
  unsigned int v45 = *(_DWORD *)(v7 + 84);
  if (v45 > v6) {
    unsigned int v6 = *(_DWORD *)(*(void *)(v43 - 8) + 84);
  }
  if (v6) {
    unsigned int v8 = v6 - 1;
  }
  else {
    unsigned int v8 = 0;
  }
  uint64_t v9 = v3;
  uint64_t v10 = *(void *)(v43 - 8);
  uint64_t v11 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v12 = v11;
  unsigned int v13 = *(_DWORD *)(v11 + 84);
  if (v13 <= v8) {
    unsigned int v14 = v8;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  if (v14 <= v50) {
    unsigned int v14 = v50;
  }
  uint64_t v15 = *(unsigned __int8 *)(v52 + 80);
  uint64_t v16 = *(void *)(v52 + 64);
  uint64_t v17 = *(unsigned __int8 *)(v49 + 80);
  uint64_t v18 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v19 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v20 = *(void *)(v11 + 64);
  uint64_t result = a2;
  if (v6) {
    uint64_t v22 = *(void *)(v7 + 64);
  }
  else {
    uint64_t v22 = *(void *)(v7 + 64) + 1;
  }
  if (a2)
  {
    uint64_t v23 = *(void *)(v51 + 64) + v15;
    uint64_t v24 = v18 | v19 | v17;
    uint64_t v25 = ((*(void *)(v49 + 64) + v17) & ~v17) + *(void *)(v49 + 64) + v18;
    uint64_t v26 = v22 + (v25 & ~v18);
    uint64_t v27 = a1;
    if (a2 <= v14) {
      goto LABEL_36;
    }
    uint64_t v28 = ((v24 + v16 + (v23 & ~v15)) & ~v24) + v20 + ((v26 + v19) & ~v19);
    char v29 = 8 * v28;
    if (v28 > 3)
    {
LABEL_19:
      int v30 = *((unsigned __int8 *)a1 + v28);
      if (!*((unsigned char *)a1 + v28)) {
        goto LABEL_36;
      }
      goto LABEL_26;
    }
    unsigned int v31 = ((a2 - v14 + ~(-1 << v29)) >> v29) + 1;
    if (HIWORD(v31))
    {
      int v30 = *(_DWORD *)((char *)a1 + v28);
      if (!v30) {
        goto LABEL_36;
      }
    }
    else
    {
      if (v31 <= 0xFF)
      {
        if (v31 < 2)
        {
LABEL_36:
          if (v14)
          {
            if (v47 == v14)
            {
              uint64_t v35 = AssociatedTypeWitness;
              unint64_t v36 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v51 + 48);
              uint64_t v37 = v47;
              return v36(v27, v37, v35);
            }
            uint64_t v27 = (unsigned __int16 *)(((unint64_t)a1 + v23) & ~v15);
            if (v46 == v14)
            {
              unint64_t v36 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v52 + 48);
              uint64_t v37 = v46;
              uint64_t v35 = v9;
              return v36(v27, v37, v35);
            }
            unint64_t v38 = ((unint64_t)v27 + v16 + v24) & ~v24;
            if (v8 < v13)
            {
              uint64_t v39 = (v38 + v19 + v26) & ~v19;
              int v40 = *(uint64_t (**)(uint64_t))(v12 + 48);
              return v40(v39);
            }
            if (v6)
            {
              int v41 = v44 >= v45
                  ? (*(uint64_t (**)(unint64_t))(v49 + 48))(v38)
                  : (*(unint64_t (**)(unint64_t, void, uint64_t))(v10 + 48))((v25 + v38) & ~v18, v45, v43);
              BOOL v42 = v41 != 0;
              uint64_t result = (v41 - 1);
              if (result != 0 && v42) {
                return result;
              }
            }
          }
          return 0;
        }
        goto LABEL_19;
      }
      int v30 = *(unsigned __int16 *)((char *)a1 + v28);
      if (!*(unsigned __int16 *)((char *)a1 + v28)) {
        goto LABEL_36;
      }
    }
LABEL_26:
    int v32 = (v30 - 1) << v29;
    if (v28 > 3) {
      int v32 = 0;
    }
    if (v28)
    {
      if (v28 <= 3) {
        int v33 = v28;
      }
      else {
        int v33 = 4;
      }
      switch(v33)
      {
        case 2:
          int v34 = *a1;
          break;
        case 3:
          int v34 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v34 = *(_DWORD *)a1;
          break;
        default:
          int v34 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v34 = 0;
    }
    return v14 + (v34 | v32) + 1;
  }
  return result;
}

void storeEnumTagSinglePayload for MatchesCollection(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v58 = *(void *)(v4 - 8);
  unsigned int v6 = *(_DWORD *)(v58 + 84);
  unsigned int v54 = v6;
  if (v6 <= *(_DWORD *)(v57 + 84)) {
    unsigned int v6 = *(_DWORD *)(v57 + 84);
  }
  unsigned int v55 = *(_DWORD *)(v57 + 84);
  unsigned int v56 = v6;
  swift_getAssociatedConformanceWitness();
  uint64_t v50 = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(v50 - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v51 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v51 - 8);
  unsigned int v52 = v8;
  unsigned int v53 = *(_DWORD *)(v9 + 84);
  if (v53 <= v8) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  if (v10) {
    unsigned int v11 = v10 - 1;
  }
  else {
    unsigned int v11 = 0;
  }
  int v12 = 0;
  uint64_t v13 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v14 = v13;
  unsigned int v15 = *(_DWORD *)(v13 + 84);
  if (v15 <= v11) {
    unsigned int v16 = v11;
  }
  else {
    unsigned int v16 = *(_DWORD *)(v13 + 84);
  }
  if (v16 <= v56) {
    unsigned int v17 = v56;
  }
  else {
    unsigned int v17 = v16;
  }
  uint64_t v18 = *(unsigned __int8 *)(v58 + 80);
  uint64_t v19 = *(void *)(v57 + 64) + v18;
  uint64_t v20 = *(void *)(v58 + 64);
  uint64_t v21 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v24 = v22 | v23 | v21;
  size_t v25 = ((*(void *)(v7 + 64) + v21) & ~v21) + *(void *)(v7 + 64);
  size_t v26 = ((v25 + v22) & ~v22) + *(void *)(v9 + 64);
  if (v10) {
    size_t v27 = ((v25 + v22) & ~v22) + *(void *)(v9 + 64);
  }
  else {
    size_t v27 = v26 + 1;
  }
  size_t v28 = ((v27 + v23) & ~v23) + *(void *)(v13 + 64);
  size_t v29 = v28 + ((v24 + v20 + (v19 & ~v18)) & ~v24);
  if (a3 > v17)
  {
    if (v29 <= 3)
    {
      unsigned int v30 = ((a3 - v17 + ~(-1 << (8 * v29))) >> (8 * v29)) + 1;
      if (HIWORD(v30))
      {
        int v12 = 4;
      }
      else if (v30 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v30 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  if (v17 < a2)
  {
    unsigned int v31 = ~v17 + a2;
    if (v29 < 4)
    {
      int v32 = (v31 >> (8 * v29)) + 1;
      if (v29)
      {
        int v34 = v31 & ~(-1 << (8 * v29));
        bzero(a1, v28 + ((v24 + v20 + (v19 & ~v18)) & ~v24));
        if (v29 == 3)
        {
          *(_WORD *)a1 = v34;
          a1[2] = BYTE2(v34);
        }
        else if (v29 == 2)
        {
          *(_WORD *)a1 = v34;
        }
        else
        {
          *a1 = v34;
        }
      }
    }
    else
    {
      bzero(a1, v28 + ((v24 + v20 + (v19 & ~v18)) & ~v24));
      *(_DWORD *)a1 = v31;
      int v32 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v29] = v32;
        return;
      case 2:
        *(_WORD *)&a1[v29] = v32;
        return;
      case 3:
        goto LABEL_102;
      case 4:
        *(_DWORD *)&a1[v29] = v32;
        return;
      default:
        return;
    }
  }
  int v33 = a1;
  switch(v12)
  {
    case 1:
      a1[v29] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 2:
      *(_WORD *)&a1[v29] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 3:
LABEL_102:
      __break(1u);
      JUMPOUT(0x209FA2470);
    case 4:
      *(_DWORD *)&a1[v29] = 0;
      goto LABEL_37;
    default:
LABEL_37:
      if (!a2) {
        return;
      }
LABEL_38:
      if (v55 == v17)
      {
        uint64_t v35 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v57 + 56);
        uint64_t v36 = a2;
        uint64_t v37 = v55;
        uint64_t v38 = AssociatedTypeWitness;
LABEL_42:
        v35(v33, v36, v37, v38);
        return;
      }
      int v33 = (unsigned char *)((unint64_t)&a1[v19] & ~v18);
      if (v54 == v17)
      {
        uint64_t v35 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v58 + 56);
        uint64_t v36 = a2;
        uint64_t v37 = v54;
        uint64_t v38 = v4;
        goto LABEL_42;
      }
      unint64_t v39 = (unint64_t)&v33[v20 + v24] & ~v24;
      if (v16 >= a2)
      {
        if (v11 >= v15)
        {
          if (v11 >= a2)
          {
            if (a2 + 1 <= v10)
            {
              if (a2 == -1) {
                return;
              }
              uint64_t v37 = v52;
              if (v52 < v53)
              {
                int v33 = (unsigned char *)((v25 + v22 + v39) & ~v22);
                uint64_t v35 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
                uint64_t v36 = a2 + 1;
                uint64_t v37 = v53;
                uint64_t v38 = v51;
                goto LABEL_42;
              }
              if (a2 + 1 <= v52)
              {
                uint64_t v35 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
                int v33 = (unsigned char *)((unint64_t)&v33[v20 + v24] & ~v24);
                uint64_t v36 = a2 + 1;
                uint64_t v38 = v50;
                goto LABEL_42;
              }
              if (v25 <= 3) {
                int v48 = ~(-1 << (8 * v25));
              }
              else {
                int v48 = -1;
              }
              if (v25)
              {
                int v41 = v48 & (a2 - v52);
                if (v25 <= 3) {
                  int v49 = v25;
                }
                else {
                  int v49 = 4;
                }
                bzero((void *)((unint64_t)&v33[v20 + v24] & ~v24), v25);
                switch(v49)
                {
                  case 2:
LABEL_98:
                    *(_WORD *)unint64_t v39 = v41;
                    break;
                  case 3:
LABEL_99:
                    *(_WORD *)unint64_t v39 = v41;
                    *(unsigned char *)(v39 + 2) = BYTE2(v41);
                    break;
                  case 4:
LABEL_100:
                    *(_DWORD *)unint64_t v39 = v41;
                    break;
                  default:
LABEL_85:
                    *(unsigned char *)unint64_t v39 = v41;
                    break;
                }
              }
            }
            else
            {
              if (v26 <= 3) {
                int v46 = ~(-1 << (8 * v26));
              }
              else {
                int v46 = -1;
              }
              if (v26)
              {
                int v41 = v46 & (a2 - v10);
                if (v26 <= 3) {
                  int v47 = v26;
                }
                else {
                  int v47 = 4;
                }
                bzero((void *)((unint64_t)&v33[v20 + v24] & ~v24), v26);
                switch(v47)
                {
                  case 2:
                    goto LABEL_98;
                  case 3:
                    goto LABEL_99;
                  case 4:
                    goto LABEL_100;
                  default:
                    goto LABEL_85;
                }
              }
            }
          }
          else
          {
            if (v27 <= 3) {
              int v44 = ~(-1 << (8 * v27));
            }
            else {
              int v44 = -1;
            }
            if (v27)
            {
              int v41 = v44 & (~v11 + a2);
              if (v27 <= 3) {
                int v45 = v27;
              }
              else {
                int v45 = 4;
              }
              bzero((void *)((unint64_t)&v33[v20 + v24] & ~v24), v27);
              switch(v45)
              {
                case 2:
                  goto LABEL_98;
                case 3:
                  goto LABEL_99;
                case 4:
                  goto LABEL_100;
                default:
                  goto LABEL_85;
              }
            }
          }
        }
        else
        {
          uint64_t v43 = *(void (**)(unint64_t, void))(v14 + 56);
          v43((v39 + v23 + v27) & ~v23, a2);
        }
      }
      else
      {
        if (v28 <= 3) {
          int v40 = ~(-1 << (8 * v28));
        }
        else {
          int v40 = -1;
        }
        if (v28)
        {
          int v41 = v40 & (~v16 + a2);
          if (v28 <= 3) {
            int v42 = v28;
          }
          else {
            int v42 = 4;
          }
          bzero((void *)((unint64_t)&v33[v20 + v24] & ~v24), v28);
          switch(v42)
          {
            case 2:
              goto LABEL_98;
            case 3:
              goto LABEL_99;
            case 4:
              goto LABEL_100;
            default:
              goto LABEL_85;
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for MatchesCollection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for MatchesCollection.Index()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Range();
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for MatchesCollection.Index(void *a1, unsigned __int16 *a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned int *)(v2 + 84);
  uint64_t v39 = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(v39 - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = *(unsigned int *)(v4 + 84);
  uint64_t v7 = *(void *)(v2 + 64);
  uint64_t v37 = v2;
  uint64_t v38 = v4;
  int v8 = *(_DWORD *)(v2 + 80);
  uint64_t v34 = v7 + v8;
  uint64_t v9 = v5;
  unint64_t v36 = (v34 & ~(unint64_t)v8) + v7 + v5;
  uint64_t v10 = *(void *)(v4 + 64);
  int v11 = v6 | v3;
  uint64_t v41 = (v36 & ~(unint64_t)v5) + v10;
  if (v6 | v3) {
    unint64_t v12 = (v36 & ~(unint64_t)v5) + v10;
  }
  else {
    unint64_t v12 = (v36 & ~(unint64_t)*(_DWORD *)(v4 + 80)) + v10 + 1;
  }
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = *(_DWORD *)(v14 + 80);
  size_t __n = v12;
  unint64_t v16 = v12 + v15;
  unint64_t v17 = v5 | v15 | v8;
  if (v17 <= 7
    && ((v5 | *(_DWORD *)(v14 + 80) | v8) & 0x100000) == 0
    && ((v12 + v15) & ~v15) + *(void *)(*(void *)(v13 - 8) + 64) <= 0x18)
  {
    uint64_t v21 = a1;
    uint64_t v22 = ~v9;
    uint64_t v23 = ~v15;
    uint64_t v32 = ~v9;
    uint64_t v33 = v13;
    if (v11)
    {
      uint64_t v24 = a2;
      if (v3 >= v6) {
        int v25 = (*(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v37 + 48))(a2, v3, AssociatedTypeWitness);
      }
      else {
        int v25 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v38 + 48))(((unint64_t)a2 + v36) & v22, v6, v39);
      }
      uint64_t v26 = v41;
      if (v25)
      {
LABEL_27:
        memcpy(a1, v24, __n);
LABEL_35:
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v14 + 16))(((unint64_t)a1 + v16) & v23, ((unint64_t)v24 + v16) & v23, v33);
        return v21;
      }
    }
    else
    {
      uint64_t v24 = a2;
      uint64_t v26 = v41;
      if (*((unsigned char *)a2 + v41))
      {
        int v27 = (*((unsigned __int8 *)a2 + v41) - 1) << (8 * v41);
        if (v41 > 3) {
          int v27 = 0;
        }
        if (v41)
        {
          int v28 = v41 <= 3 ? v41 : 4;
          switch(v28)
          {
            case 2:
              int v29 = *a2;
              break;
            case 3:
              int v29 = *a2 | (*((unsigned __int8 *)a2 + 2) << 16);
              break;
            case 4:
              int v29 = *(_DWORD *)a2;
              break;
            default:
              int v29 = *(unsigned __int8 *)a2;
              break;
          }
        }
        else
        {
          int v29 = 0;
        }
        if ((v29 | v27) != 0xFFFFFFFF) {
          goto LABEL_27;
        }
      }
    }
    unsigned int v30 = *(void (**)(void *, unsigned __int16 *, uint64_t))(v37 + 16);
    v30(a1, v24, AssociatedTypeWitness);
    v30((void *)(((unint64_t)a1 + v34) & ~(unint64_t)v8), (unsigned __int16 *)(((unint64_t)v24 + v34) & ~(unint64_t)v8), AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v38 + 16))(((unint64_t)a1 + v36) & v32, ((unint64_t)v24 + v36) & v32, v39);
    if (!v11) {
      *((unsigned char *)a1 + v26) = 0;
    }
    goto LABEL_35;
  }
  uint64_t v20 = *(void *)a2;
  *a1 = *(void *)a2;
  uint64_t v21 = (void *)(v20 + ((v17 + 16) & ~v17));
  swift_retain();
  return v21;
}

uint64_t destroy for MatchesCollection.Index(unsigned __int16 *a1)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned int *)(v3 + 84);
  uint64_t v6 = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned int *)(v7 + 84);
  uint64_t v10 = *(void *)(v3 + 64);
  uint64_t v11 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v12 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = ((v10 + v11) & ~v11) + v10 + v12;
  uint64_t v14 = (v13 & ~v12) + *(void *)(v7 + 64);
  int v15 = v9 | v5;
  uint64_t v29 = ~v12;
  uint64_t v30 = v6;
  uint64_t v28 = v10 + v11;
  if (v9 | v5)
  {
    if (v5 >= v9) {
      int v16 = (*(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v4 + 48))(a1, v5, AssociatedTypeWitness);
    }
    else {
      int v16 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(((unint64_t)a1 + v13) & ~v12, v9, v6);
    }
    if (!v16)
    {
LABEL_15:
      uint64_t v20 = *(void (**)(unsigned __int16 *, uint64_t))(v4 + 8);
      v20(a1, AssociatedTypeWitness);
      v20((unsigned __int16 *)(((unint64_t)a1 + v28) & ~v11), AssociatedTypeWitness);
      (*(void (**)(unint64_t, uint64_t))(v8 + 8))(((unint64_t)a1 + v13) & v29, v30);
    }
  }
  else
  {
    if (!*((unsigned char *)a1 + v14)) {
      goto LABEL_15;
    }
    int v17 = (*((unsigned __int8 *)a1 + v14) - 1) << (8 * v14);
    if (v14 > 3) {
      int v17 = 0;
    }
    if (v14)
    {
      int v18 = v14 <= 3 ? (v13 & ~v12) + *(_DWORD *)(v7 + 64) : 4;
      switch(v18)
      {
        case 2:
          int v19 = *a1;
          break;
        case 3:
          int v19 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v19 = *(_DWORD *)a1;
          break;
        default:
          int v19 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v19 = 0;
    }
    if ((v19 | v17) == 0xFFFFFFFF) {
      goto LABEL_15;
    }
  }
  uint64_t v21 = swift_getAssociatedTypeWitness();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(unint64_t, uint64_t))(v22 + 8);
  if (v15) {
    uint64_t v24 = a1;
  }
  else {
    uint64_t v24 = (unsigned __int16 *)((char *)a1 + 1);
  }
  uint64_t v25 = v21;
  unint64_t v26 = ((unint64_t)v24 + *(unsigned __int8 *)(v22 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);

  return v23(v26, v25);
}

void *initializeWithCopy for MatchesCollection.Index(void *a1, unsigned __int8 *a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned int *)(v4 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  uint64_t v11 = *(void *)(v4 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = ((v11 + v12) & ~v12) + v11 + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(v8 + 64);
  int v16 = v10 | v6;
  uint64_t v30 = v11 + v12;
  uint64_t v31 = ~v13;
  if (v10 | v6)
  {
    if (v6 >= v10) {
      int v17 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48))(a2, v6, AssociatedTypeWitness);
    }
    else {
      int v17 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))((unint64_t)&a2[v14] & ~v13, v10, v7);
    }
    if (v17)
    {
LABEL_15:
      if (v16) {
        size_t v21 = v15;
      }
      else {
        size_t v21 = v15 + 1;
      }
      uint64_t v22 = a1;
      memcpy(a1, a2, v21);
      goto LABEL_26;
    }
  }
  else if (a2[v15])
  {
    int v18 = (a2[v15] - 1) << (8 * v15);
    if (v15 > 3) {
      int v18 = 0;
    }
    if (v15)
    {
      int v19 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
      switch(v19)
      {
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          break;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
          int v20 = *(_DWORD *)a2;
          break;
        default:
          int v20 = *a2;
          break;
      }
    }
    else
    {
      int v20 = 0;
    }
    if ((v20 | v18) != 0xFFFFFFFF) {
      goto LABEL_15;
    }
  }
  uint64_t v23 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v5 + 16);
  uint64_t v29 = v7;
  uint64_t v24 = AssociatedTypeWitness;
  uint64_t v22 = a1;
  v23(a1, a2, v24);
  v23((void *)(((unint64_t)a1 + v30) & ~v12), (unsigned __int8 *)((unint64_t)&a2[v30] & ~v12), v24);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v14) & v31, (unint64_t)&a2[v14] & v31, v29);
  if (!v16) {
    *((unsigned char *)a1 + v15) = 0;
  }
LABEL_26:
  if (v16) {
    size_t v25 = v15;
  }
  else {
    size_t v25 = v15 + 1;
  }
  uint64_t v26 = swift_getAssociatedTypeWitness();
  uint64_t v27 = *(void *)(v26 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 16))(((unint64_t)v22 + v25 + *(unsigned __int8 *)(v27 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (unint64_t)&a2[v25 + *(unsigned __int8 *)(v27 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), v26);
  return v22;
}

unsigned __int16 *assignWithCopy for MatchesCollection.Index(unsigned __int16 *a1, unsigned __int8 *a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned int *)(v4 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v4;
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = ((v11 + v12) & ~v12) + v11 + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(v8 + 64);
  int v16 = v10 | v6;
  uint64_t v53 = ~v13;
  uint64_t v54 = v7;
  uint64_t v49 = v8;
  uint64_t v50 = v11 + v12;
  uint64_t v51 = ~v12;
  uint64_t v52 = v14;
  if (!(v10 | v6))
  {
    char v26 = 8 * v15;
    if (*((unsigned char *)a1 + v15))
    {
      int v27 = (*((unsigned __int8 *)a1 + v15) - 1) << v26;
      if (v15 > 3) {
        int v27 = 0;
      }
      if (v15)
      {
        int v28 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
        switch(v28)
        {
          case 2:
            int v29 = *a1;
            break;
          case 3:
            int v29 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            int v29 = *(_DWORD *)a1;
            break;
          default:
            int v29 = *(unsigned __int8 *)a1;
            break;
        }
      }
      else
      {
        int v29 = 0;
      }
      if ((v29 | v27) != 0xFFFFFFFF)
      {
        if (!a2[v15]) {
          goto LABEL_61;
        }
        int v34 = (a2[v15] - 1) << v26;
        if (v15 > 3) {
          int v34 = 0;
        }
        if (v15)
        {
          int v35 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
          switch(v35)
          {
            case 2:
              int v36 = *(unsigned __int16 *)a2;
              break;
            case 3:
              int v36 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              break;
            case 4:
              int v36 = *(_DWORD *)a2;
              break;
            default:
              int v36 = *a2;
              break;
          }
        }
        else
        {
          int v36 = 0;
        }
        if ((v36 | v34) == 0xFFFFFFFF) {
          goto LABEL_61;
        }
LABEL_48:
        if (v16) {
          size_t v41 = v15;
        }
        else {
          size_t v41 = v15 + 1;
        }
        memcpy(a1, a2, v41);
        goto LABEL_53;
      }
    }
    if (!a2[v15]) {
      goto LABEL_52;
    }
    int v37 = (a2[v15] - 1) << v26;
    if (v15 > 3) {
      int v37 = 0;
    }
    if (v15)
    {
      int v38 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
      switch(v38)
      {
        case 2:
          int v39 = *(unsigned __int16 *)a2;
          break;
        case 3:
          int v39 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
          int v39 = *(_DWORD *)a2;
          break;
        default:
          int v39 = *a2;
          break;
      }
    }
    else
    {
      int v39 = 0;
    }
    uint64_t v8 = *(void *)(v7 - 8);
    if ((v39 | v37) == 0xFFFFFFFF)
    {
LABEL_52:
      int v42 = *(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 24);
      v42(a1, a2, AssociatedTypeWitness);
      v42((unsigned __int16 *)(((unint64_t)a1 + v50) & v51), (unsigned __int8 *)((unint64_t)&a2[v50] & v51), AssociatedTypeWitness);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))(((unint64_t)a1 + v52) & v53, (unint64_t)&a2[v52] & v53, v54);
      goto LABEL_53;
    }
LABEL_47:
    int v40 = *(void (**)(unsigned __int16 *, uint64_t))(v5 + 8);
    v40(a1, AssociatedTypeWitness);
    v40((unsigned __int16 *)(((unint64_t)a1 + v50) & v51), AssociatedTypeWitness);
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(((unint64_t)a1 + v52) & v53, v54);
    goto LABEL_48;
  }
  if (v6 < v10)
  {
    unint64_t v17 = ((unint64_t)a1 + v14) & ~v13;
    int v18 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48);
    int v19 = a1;
    size_t v20 = (v14 & ~v13) + *(void *)(*(void *)(v7 - 8) + 64);
    uint64_t v21 = v7;
    uint64_t v22 = ~v13;
    uint64_t v23 = ((v11 + v12) & ~v12) + v11 + v13;
    int v48 = v18(v17, v10, v7);
    uint64_t v24 = v21;
    size_t v15 = v20;
    a1 = v19;
    int v25 = v18((unint64_t)&a2[v23] & v22, v10, v24);
    if (v48) {
      goto LABEL_4;
    }
LABEL_16:
    uint64_t v8 = v49;
    if (!v25) {
      goto LABEL_52;
    }
    goto LABEL_47;
  }
  int v30 = v10 | v6;
  uint64_t v31 = a2;
  uint64_t v32 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
  int v33 = v32(a1, v6, AssociatedTypeWitness);
  int v25 = v32((unsigned __int16 *)v31, v6, AssociatedTypeWitness);
  a2 = v31;
  int v16 = v30;
  if (!v33) {
    goto LABEL_16;
  }
LABEL_4:
  if (v25) {
    goto LABEL_48;
  }
LABEL_61:
  int v47 = *(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 16);
  v47(a1, a2, AssociatedTypeWitness);
  v47((unsigned __int16 *)(((unint64_t)a1 + v50) & v51), (unsigned __int8 *)((unint64_t)&a2[v50] & v51), AssociatedTypeWitness);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v49 + 16))(((unint64_t)a1 + v52) & v53, (unint64_t)&a2[v52] & v53, v54);
  if (!v16) {
    *((unsigned char *)a1 + v15) = 0;
  }
LABEL_53:
  if (v16) {
    size_t v43 = v15;
  }
  else {
    size_t v43 = v15 + 1;
  }
  uint64_t v44 = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(v44 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 24))(((unint64_t)a1 + v43 + *(unsigned __int8 *)(v45 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80), (unint64_t)&a2[v43 + *(unsigned __int8 *)(v45 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v45 + 80), v44);
  return a1;
}

void *initializeWithTake for MatchesCollection.Index(void *a1, unsigned __int8 *a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned int *)(v4 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  uint64_t v11 = *(void *)(v4 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = ((v11 + v12) & ~v12) + v11 + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(v8 + 64);
  int v16 = v10 | v6;
  uint64_t v30 = v11 + v12;
  uint64_t v31 = ~v13;
  if (v10 | v6)
  {
    if (v6 >= v10) {
      int v17 = (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v5 + 48))(a2, v6, AssociatedTypeWitness);
    }
    else {
      int v17 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))((unint64_t)&a2[v14] & ~v13, v10, v7);
    }
    if (v17)
    {
LABEL_15:
      if (v16) {
        size_t v21 = v15;
      }
      else {
        size_t v21 = v15 + 1;
      }
      uint64_t v22 = a1;
      memcpy(a1, a2, v21);
      goto LABEL_26;
    }
  }
  else if (a2[v15])
  {
    int v18 = (a2[v15] - 1) << (8 * v15);
    if (v15 > 3) {
      int v18 = 0;
    }
    if (v15)
    {
      int v19 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
      switch(v19)
      {
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          break;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
          int v20 = *(_DWORD *)a2;
          break;
        default:
          int v20 = *a2;
          break;
      }
    }
    else
    {
      int v20 = 0;
    }
    if ((v20 | v18) != 0xFFFFFFFF) {
      goto LABEL_15;
    }
  }
  uint64_t v23 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v5 + 32);
  uint64_t v29 = v7;
  uint64_t v24 = AssociatedTypeWitness;
  uint64_t v22 = a1;
  v23(a1, a2, v24);
  v23((void *)(((unint64_t)a1 + v30) & ~v12), (unsigned __int8 *)((unint64_t)&a2[v30] & ~v12), v24);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))(((unint64_t)a1 + v14) & v31, (unint64_t)&a2[v14] & v31, v29);
  if (!v16) {
    *((unsigned char *)a1 + v15) = 0;
  }
LABEL_26:
  if (v16) {
    size_t v25 = v15;
  }
  else {
    size_t v25 = v15 + 1;
  }
  uint64_t v26 = swift_getAssociatedTypeWitness();
  uint64_t v27 = *(void *)(v26 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v27 + 32))(((unint64_t)v22 + v25 + *(unsigned __int8 *)(v27 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (unint64_t)&a2[v25 + *(unsigned __int8 *)(v27 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), v26);
  return v22;
}

unsigned __int16 *assignWithTake for MatchesCollection.Index(unsigned __int16 *a1, unsigned __int8 *a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned int *)(v4 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v4;
  uint64_t v10 = *(unsigned int *)(v8 + 84);
  uint64_t v11 = *(void *)(v9 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = ((v11 + v12) & ~v12) + v11 + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(v8 + 64);
  int v16 = v10 | v6;
  uint64_t v53 = ~v13;
  uint64_t v54 = v7;
  uint64_t v49 = v8;
  uint64_t v50 = v11 + v12;
  uint64_t v51 = ~v12;
  uint64_t v52 = v14;
  if (!(v10 | v6))
  {
    char v26 = 8 * v15;
    if (*((unsigned char *)a1 + v15))
    {
      int v27 = (*((unsigned __int8 *)a1 + v15) - 1) << v26;
      if (v15 > 3) {
        int v27 = 0;
      }
      if (v15)
      {
        int v28 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
        switch(v28)
        {
          case 2:
            int v29 = *a1;
            break;
          case 3:
            int v29 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            int v29 = *(_DWORD *)a1;
            break;
          default:
            int v29 = *(unsigned __int8 *)a1;
            break;
        }
      }
      else
      {
        int v29 = 0;
      }
      if ((v29 | v27) != 0xFFFFFFFF)
      {
        if (!a2[v15]) {
          goto LABEL_61;
        }
        int v34 = (a2[v15] - 1) << v26;
        if (v15 > 3) {
          int v34 = 0;
        }
        if (v15)
        {
          int v35 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
          switch(v35)
          {
            case 2:
              int v36 = *(unsigned __int16 *)a2;
              break;
            case 3:
              int v36 = *(unsigned __int16 *)a2 | (a2[2] << 16);
              break;
            case 4:
              int v36 = *(_DWORD *)a2;
              break;
            default:
              int v36 = *a2;
              break;
          }
        }
        else
        {
          int v36 = 0;
        }
        if ((v36 | v34) == 0xFFFFFFFF) {
          goto LABEL_61;
        }
LABEL_48:
        if (v16) {
          size_t v41 = v15;
        }
        else {
          size_t v41 = v15 + 1;
        }
        memcpy(a1, a2, v41);
        goto LABEL_53;
      }
    }
    if (!a2[v15]) {
      goto LABEL_52;
    }
    int v37 = (a2[v15] - 1) << v26;
    if (v15 > 3) {
      int v37 = 0;
    }
    if (v15)
    {
      int v38 = v15 <= 3 ? (v14 & ~v13) + *(_DWORD *)(v8 + 64) : 4;
      switch(v38)
      {
        case 2:
          int v39 = *(unsigned __int16 *)a2;
          break;
        case 3:
          int v39 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          break;
        case 4:
          int v39 = *(_DWORD *)a2;
          break;
        default:
          int v39 = *a2;
          break;
      }
    }
    else
    {
      int v39 = 0;
    }
    uint64_t v8 = *(void *)(v7 - 8);
    if ((v39 | v37) == 0xFFFFFFFF)
    {
LABEL_52:
      int v42 = *(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 40);
      v42(a1, a2, AssociatedTypeWitness);
      v42((unsigned __int16 *)(((unint64_t)a1 + v50) & v51), (unsigned __int8 *)((unint64_t)&a2[v50] & v51), AssociatedTypeWitness);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)a1 + v52) & v53, (unint64_t)&a2[v52] & v53, v54);
      goto LABEL_53;
    }
LABEL_47:
    int v40 = *(void (**)(unsigned __int16 *, uint64_t))(v5 + 8);
    v40(a1, AssociatedTypeWitness);
    v40((unsigned __int16 *)(((unint64_t)a1 + v50) & v51), AssociatedTypeWitness);
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(((unint64_t)a1 + v52) & v53, v54);
    goto LABEL_48;
  }
  if (v6 < v10)
  {
    unint64_t v17 = ((unint64_t)a1 + v14) & ~v13;
    int v18 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48);
    int v19 = a1;
    size_t v20 = (v14 & ~v13) + *(void *)(*(void *)(v7 - 8) + 64);
    uint64_t v21 = v7;
    uint64_t v22 = ~v13;
    uint64_t v23 = ((v11 + v12) & ~v12) + v11 + v13;
    int v48 = v18(v17, v10, v7);
    uint64_t v24 = v21;
    size_t v15 = v20;
    a1 = v19;
    int v25 = v18((unint64_t)&a2[v23] & v22, v10, v24);
    if (v48) {
      goto LABEL_4;
    }
LABEL_16:
    uint64_t v8 = v49;
    if (!v25) {
      goto LABEL_52;
    }
    goto LABEL_47;
  }
  int v30 = v10 | v6;
  uint64_t v31 = a2;
  uint64_t v32 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
  int v33 = v32(a1, v6, AssociatedTypeWitness);
  int v25 = v32((unsigned __int16 *)v31, v6, AssociatedTypeWitness);
  a2 = v31;
  int v16 = v30;
  if (!v33) {
    goto LABEL_16;
  }
LABEL_4:
  if (v25) {
    goto LABEL_48;
  }
LABEL_61:
  int v47 = *(void (**)(unsigned __int16 *, unsigned __int8 *, uint64_t))(v5 + 32);
  v47(a1, a2, AssociatedTypeWitness);
  v47((unsigned __int16 *)(((unint64_t)a1 + v50) & v51), (unsigned __int8 *)((unint64_t)&a2[v50] & v51), AssociatedTypeWitness);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v49 + 32))(((unint64_t)a1 + v52) & v53, (unint64_t)&a2[v52] & v53, v54);
  if (!v16) {
    *((unsigned char *)a1 + v15) = 0;
  }
LABEL_53:
  if (v16) {
    size_t v43 = v15;
  }
  else {
    size_t v43 = v15 + 1;
  }
  uint64_t v44 = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(v44 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 40))(((unint64_t)a1 + v43 + *(unsigned __int8 *)(v45 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80), (unint64_t)&a2[v43 + *(unsigned __int8 *)(v45 + 80)] & ~(unint64_t)*(unsigned __int8 *)(v45 + 80), v44);
  return a1;
}

uint64_t getEnumTagSinglePayload for MatchesCollection.Index(unsigned __int16 *a1, unsigned int a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v2 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v3 = *(_DWORD *)(v2 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v29 = *(_DWORD *)(v4 + 84);
  unsigned int v30 = v3;
  if (v29 > v3) {
    unsigned int v3 = *(_DWORD *)(v4 + 84);
  }
  if (v3) {
    unsigned int v5 = v3 - 1;
  }
  else {
    unsigned int v5 = 0;
  }
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v7 = v6;
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  if (v8 <= v5) {
    unsigned int v9 = v5;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = *(void *)(v4 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = *(void *)(v6 + 64);
  if (!v3) {
    ++v11;
  }
  if (!a2) {
    return 0;
  }
  unint64_t v14 = ((*(void *)(v2 + 64) + *(unsigned __int8 *)(v2 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
      + *(void *)(v2 + 64)
      + v10;
  uint64_t v15 = v11 + (v14 & ~v10) + v12;
  if (a2 <= v9) {
    goto LABEL_31;
  }
  uint64_t v16 = (v15 & ~v12) + v13;
  char v17 = 8 * v16;
  if (v16 <= 3)
  {
    unsigned int v19 = ((a2 - v9 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      int v18 = *(_DWORD *)((char *)a1 + v16);
      if (!v18) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
    if (v19 > 0xFF)
    {
      int v18 = *(unsigned __int16 *)((char *)a1 + v16);
      if (!*(unsigned __int16 *)((char *)a1 + v16)) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
    if (v19 < 2)
    {
LABEL_31:
      if (v9)
      {
        if (v5 < v8)
        {
          uint64_t v23 = *(uint64_t (**)(unint64_t))(v7 + 48);
          return v23(((unint64_t)a1 + v15) & ~v12);
        }
        if (v3)
        {
          if (v30 >= v29)
          {
            int v27 = (*(uint64_t (**)(unsigned __int16 *))(v2 + 48))(a1);
            BOOL v26 = v27 != 0;
            uint64_t result = (v27 - 1);
            if (result != 0 && v26) {
              return result;
            }
          }
          else
          {
            int v25 = (*(uint64_t (**)(unint64_t, void, uint64_t))(v4 + 48))(((unint64_t)a1 + v14) & ~v10, v29, AssociatedTypeWitness);
            BOOL v26 = v25 != 0;
            uint64_t result = (v25 - 1);
            if (result != 0 && v26) {
              return result;
            }
          }
        }
      }
      return 0;
    }
  }
  int v18 = *((unsigned __int8 *)a1 + v16);
  if (!*((unsigned char *)a1 + v16)) {
    goto LABEL_31;
  }
LABEL_21:
  int v20 = (v18 - 1) << v17;
  if (v16 > 3) {
    int v20 = 0;
  }
  if (v16)
  {
    if (v16 <= 3) {
      int v21 = v16;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v9 + (v22 | v20) + 1;
}

void storeEnumTagSinglePayload for MatchesCollection.Index(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v3 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v4 = *(_DWORD *)(v3 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  unsigned int v36 = v4;
  if (v6 <= v4) {
    unsigned int v7 = v4;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  if (v7) {
    unsigned int v8 = v7 - 1;
  }
  else {
    unsigned int v8 = 0;
  }
  int v9 = 0;
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v8) {
    unsigned int v13 = v8;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  size_t v14 = ((*(void *)(v3 + 64) + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
      + *(void *)(v3 + 64);
  uint64_t v15 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = *(void *)(v5 + 64);
  size_t v17 = ((v14 + v15) & ~v15) + v16;
  if (v7) {
    size_t v18 = ((v14 + v15) & ~v15) + v16;
  }
  else {
    size_t v18 = v17 + 1;
  }
  uint64_t v19 = *(unsigned __int8 *)(v10 + 80);
  size_t v20 = ((v18 + v19) & ~v19) + *(void *)(v10 + 64);
  if (a3 > v13)
  {
    if (v20 <= 3)
    {
      unsigned int v21 = ((a3 - v13 + ~(-1 << (8 * v20))) >> (8 * v20)) + 1;
      if (HIWORD(v21))
      {
        int v9 = 4;
      }
      else if (v21 >= 0x100)
      {
        int v9 = 2;
      }
      else
      {
        int v9 = v21 > 1;
      }
    }
    else
    {
      int v9 = 1;
    }
  }
  if (v13 < a2)
  {
    unsigned int v22 = ~v13 + a2;
    if (v20 < 4)
    {
      int v23 = (v22 >> (8 * v20)) + 1;
      if (v20)
      {
        int v24 = v22 & ~(-1 << (8 * v20));
        bzero(a1, v20);
        if (v20 == 3)
        {
          *(_WORD *)a1 = v24;
          a1[2] = BYTE2(v24);
        }
        else if (v20 == 2)
        {
          *(_WORD *)a1 = v24;
        }
        else
        {
          *a1 = v24;
        }
      }
    }
    else
    {
      bzero(a1, v20);
      *(_DWORD *)a1 = v22;
      int v23 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v20] = v23;
        return;
      case 2:
        *(_WORD *)&a1[v20] = v23;
        return;
      case 3:
        goto LABEL_85;
      case 4:
        *(_DWORD *)&a1[v20] = v23;
        return;
      default:
        return;
    }
  }
  switch(v9)
  {
    case 1:
      a1[v20] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v20] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_85:
      __break(1u);
      JUMPOUT(0x209FA4BB4);
    case 4:
      *(_DWORD *)&a1[v20] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v8 >= v12)
        {
          if (v8 >= a2)
          {
            if (a2 + 1 <= v7)
            {
              if (a2 != -1)
              {
                if (v36 >= v6)
                {
                  if (a2 + 1 <= v36)
                  {
                    int v34 = *(void (**)(unsigned char *, void))(v3 + 56);
                    v34(a1, a2 + 1);
                  }
                  else
                  {
                    if (v14 <= 3) {
                      int v32 = ~(-1 << (8 * v14));
                    }
                    else {
                      int v32 = -1;
                    }
                    if (v14)
                    {
                      int v27 = v32 & (a2 - v36);
                      if (v14 <= 3) {
                        int v33 = v14;
                      }
                      else {
                        int v33 = 4;
                      }
                      bzero(a1, v14);
                      switch(v33)
                      {
                        case 2:
LABEL_79:
                          *(_WORD *)a1 = v27;
                          break;
                        case 3:
LABEL_80:
                          *(_WORD *)a1 = v27;
                          a1[2] = BYTE2(v27);
                          break;
                        case 4:
LABEL_81:
                          *(_DWORD *)a1 = v27;
                          break;
                        default:
LABEL_57:
                          *a1 = v27;
                          break;
                      }
                    }
                  }
                }
                else
                {
                  uint64_t v31 = *(void (**)(unint64_t, void, uint64_t, uint64_t))(v5 + 56);
                  v31((unint64_t)&a1[v14 + v15] & ~v15, a2 + 1, v6, AssociatedTypeWitness);
                }
              }
            }
            else
            {
              if (v17 <= 3) {
                int v29 = ~(-1 << (8 * v17));
              }
              else {
                int v29 = -1;
              }
              if (v17)
              {
                int v27 = v29 & (a2 - v7);
                if (v17 <= 3) {
                  int v30 = v17;
                }
                else {
                  int v30 = 4;
                }
                bzero(a1, v17);
                switch(v30)
                {
                  case 2:
                    goto LABEL_79;
                  case 3:
                    goto LABEL_80;
                  case 4:
                    goto LABEL_81;
                  default:
                    goto LABEL_57;
                }
              }
            }
          }
          else
          {
            if (v18 <= 3) {
              int v26 = ~(-1 << (8 * v18));
            }
            else {
              int v26 = -1;
            }
            if (v18)
            {
              int v27 = v26 & (~v8 + a2);
              if (v18 <= 3) {
                int v28 = v18;
              }
              else {
                int v28 = 4;
              }
              bzero(a1, v18);
              switch(v28)
              {
                case 2:
                  goto LABEL_79;
                case 3:
                  goto LABEL_80;
                case 4:
                  goto LABEL_81;
                default:
                  goto LABEL_57;
              }
            }
          }
        }
        else
        {
          int v25 = *(void (**)(unint64_t, void))(v11 + 56);
          v25((unint64_t)&a1[v18 + v19] & ~v19, a2);
        }
      }
      return;
  }
}

uint64_t type metadata completion function for ReversedMatchesCollection()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ReversedMatchesCollection(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(void *)(v5 - 8);
  int v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = *(void *)(v7 + 64) + v9;
  uint64_t v11 = (*(unsigned char *)(v7 + 80) | v9);
  if (v11 > 7
    || ((*(_DWORD *)(v7 + 80) | v9) & 0x100000) != 0
    || (v10 & ~(unint64_t)v9) + *(void *)(v8 + 64) > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    unint64_t v15 = ~(unint64_t)v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v15, ((unint64_t)a2 + v10) & v15, v5);
  }
  return a1;
}

uint64_t destroy for ReversedMatchesCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v5)(a1, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  unint64_t v8 = (*(void *)(v5 + 56) + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v8, v3);
}

uint64_t initializeWithCopy for ReversedMatchesCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 48) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v5);
  return a1;
}

uint64_t assignWithCopy for ReversedMatchesCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 40) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v5);
  return a1;
}

uint64_t initializeWithTake for ReversedMatchesCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 32) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v5);
  return a1;
}

uint64_t assignWithTake for ReversedMatchesCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(void *)(v7 + 24) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReversedMatchesCollection(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= v8) {
    unsigned int v12 = *(_DWORD *)(v7 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + v11;
  if (a2 <= v12) {
    goto LABEL_24;
  }
  uint64_t v14 = (v13 & ~v11) + *(void *)(*(void *)(v5 - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v12 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v12)
      {
        if (v8 >= v10)
        {
          int v23 = *(uint64_t (**)(unsigned __int16 *))(v7 + 48);
          return v23(a1);
        }
        else
        {
          unsigned int v21 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48);
          return v21(((unint64_t)a1 + v13) & ~v11, v10, v5);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = (v13 & ~v11) + *(_DWORD *)(*(void *)(v5 - 8) + 64);
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v12 + (v20 | v18) + 1;
}

void storeEnumTagSinglePayload for ReversedMatchesCollection(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  if (v11 <= v9) {
    unsigned int v13 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v14 = *(void *)(v8 + 64) + v12;
  size_t v15 = (v14 & ~v12) + *(void *)(*(void *)(v7 - 8) + 64);
  if (a3 <= v13)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 - v13 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v17 = ~v13 + a2;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v15)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x209FA57DCLL);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v11)
        {
          unsigned int v22 = *(void (**)(unsigned char *, uint64_t))(v8 + 56);
          v22(a1, a2);
        }
        else
        {
          unsigned int v21 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
          v21((unint64_t)&a1[v14] & ~v12, a2, v11, v7);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for ReversedMatchesCollection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for ReversedMatchesCollection.Iterator()
{
  return type metadata completion function for MatchesIterator();
}

uint64_t *initializeBufferWithCopyOfBuffer for ReversedMatchesCollection.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for MatchesIterator(a1, a2, a3);
}

uint64_t destroy for ReversedMatchesCollection.Iterator(uint64_t a1, uint64_t a2)
{
  return destroy for MatchesIterator(a1, a2);
}

uint64_t initializeWithCopy for ReversedMatchesCollection.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithCopy for MatchesIterator(a1, a2, a3);
}

uint64_t assignWithCopy for ReversedMatchesCollection.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithCopy for MatchesIterator(a1, a2, a3);
}

uint64_t initializeWithTake for ReversedMatchesCollection.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return initializeWithTake for MatchesIterator(a1, a2, a3);
}

uint64_t assignWithTake for ReversedMatchesCollection.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return assignWithTake for MatchesIterator(a1, a2, a3);
}

uint64_t getEnumTagSinglePayload for ReversedMatchesCollection.Iterator(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  return getEnumTagSinglePayload for MatchesIterator(a1, a2, a3);
}

void storeEnumTagSinglePayload for ReversedMatchesCollection.Iterator(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
}

uint64_t type metadata completion function for _BackwardMatchResult()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _BackwardMatchResult(uint64_t *a1, uint64_t *a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = (*(unsigned char *)(v5 + 80) | *(unsigned char *)(v8 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || (v10 & (unint64_t)~v9) + *(void *)(*(void *)(v7 - 8) + 64) > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    uint64_t v15 = v7;
    uint64_t v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v16, ((unint64_t)a2 + v10) & v16, v15);
  }
  return a1;
}

uint64_t destroy for _BackwardMatchResult(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v3)(a1, AssociatedTypeWitness);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v5;
  unint64_t v9 = (v4 + a1 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v9, v8);
}

uint64_t initializeWithCopy for _BackwardMatchResult(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t assignWithCopy for _BackwardMatchResult(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t initializeWithTake for _BackwardMatchResult(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t assignWithTake for _BackwardMatchResult(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for _BackwardMatchResult(unsigned __int16 *a1, unsigned int a2)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  if (v9 <= v6) {
    unsigned int v10 = v6;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(v5 + 64) + v11;
  if (a2 <= v10) {
    goto LABEL_24;
  }
  uint64_t v13 = (v12 & ~v11) + *(void *)(*(void *)(v7 - 8) + 64);
  char v14 = 8 * v13;
  if (v13 <= 3)
  {
    unsigned int v16 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v16))
    {
      int v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 > 0xFF)
    {
      int v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(unsigned __int16 *)((char *)a1 + v13)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 < 2)
    {
LABEL_24:
      if (v10)
      {
        if (v6 >= v9)
        {
          unsigned int v22 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
          return v22(a1, v6, AssociatedTypeWitness);
        }
        else
        {
          int v20 = *(uint64_t (**)(unint64_t))(v8 + 48);
          return v20(((unint64_t)a1 + v12) & ~v11);
        }
      }
      return 0;
    }
  }
  int v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((unsigned char *)a1 + v13)) {
    goto LABEL_24;
  }
LABEL_14:
  int v17 = (v15 - 1) << v14;
  if (v13 > 3) {
    int v17 = 0;
  }
  if (v13)
  {
    if (v13 <= 3) {
      int v18 = v13;
    }
    else {
      int v18 = 4;
    }
    switch(v18)
    {
      case 2:
        int v19 = *a1;
        break;
      case 3:
        int v19 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v19 = *(_DWORD *)a1;
        break;
      default:
        int v19 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v19 = 0;
  }
  return v10 + (v19 | v17) + 1;
}

void storeEnumTagSinglePayload for _BackwardMatchResult(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v10 = v9;
  unsigned int v11 = *(_DWORD *)(v9 + 84);
  if (v11 <= v8) {
    unsigned int v12 = v8;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = *(void *)(v7 + 64) + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(v9 + 64);
  if (a3 <= v12)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 - v12 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (v12 < a2)
  {
    unsigned int v17 = ~v12 + a2;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v15)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x209FA7AACLL);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v8 >= v11)
        {
          unsigned int v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
          v22(a1, a2, v8, AssociatedTypeWitness);
        }
        else
        {
          unsigned int v21 = *(void (**)(unint64_t, uint64_t))(v10 + 56);
          v21((unint64_t)&a1[v14] & ~v13, a2);
        }
      }
      return;
  }
}

uint64_t type metadata completion function for ManyConsumer()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ConsumerSearcher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for FixedPatternConsumer()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for FixedPatternConsumer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t destroy for FixedPatternConsumer(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();
}

uint64_t initializeWithCopy for FixedPatternConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithCopy for FixedPatternConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t initializeWithTake for FixedPatternConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithTake for FixedPatternConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for FixedPatternConsumer(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
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
        return (*(uint64_t (**)(void))(v4 + 48))();
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

void storeEnumTagSinglePayload for FixedPatternConsumer(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
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
      JUMPOUT(0x209FA81A4);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        int v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for NaivePatternSearcher()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata completion function for PatternOrEmpty()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    int v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    int v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
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
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void storeEnumTagSinglePayload for Optional(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
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
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x209FA8D18);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          unsigned int v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for PatternOrEmpty()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for PatternOrEmpty.State()
{
  uint64_t result = type metadata accessor for PatternOrEmpty.State.Representation();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PatternOrEmpty.State.Representation(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  int v10 = *(_DWORD *)(v8 + 80);
  uint64_t v11 = v10;
  uint64_t v12 = v9 + v10;
  unint64_t v13 = ((v9 + v11) & ~v11) + v9;
  if (v13 <= v6) {
    unint64_t v14 = v6;
  }
  else {
    unint64_t v14 = v13;
  }
  size_t v15 = v14 + 1;
  int v16 = *(_DWORD *)(v5 + 80) | v10;
  uint64_t v17 = v16;
  int v18 = v16 & 0x100000;
  if (v17 > 7 || v18 != 0 || v15 > 0x18)
  {
    uint64_t v21 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v21 + ((v17 + 16) & ~v17));
    swift_retain();
  }
  else
  {
    uint64_t v22 = v7;
    unsigned int v23 = a2[v14];
    unsigned int v24 = v23 - 2;
    if (v23 >= 2)
    {
      if (v14 <= 3) {
        uint64_t v25 = v14;
      }
      else {
        uint64_t v25 = 4;
      }
      switch(v25)
      {
        case 1:
          int v26 = *a2;
          if (v14 >= 4) {
            goto LABEL_29;
          }
          goto LABEL_23;
        case 2:
          int v26 = *(unsigned __int16 *)a2;
          if (v14 >= 4) {
            goto LABEL_29;
          }
          goto LABEL_23;
        case 3:
          int v26 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v14 < 4) {
            goto LABEL_23;
          }
          goto LABEL_29;
        case 4:
          int v26 = *(_DWORD *)a2;
          if (v14 < 4)
          {
LABEL_23:
            unsigned int v23 = (v26 | (v24 << (8 * v14))) + 2;
            break;
          }
LABEL_29:
          unsigned int v23 = v26 + 2;
          if (v23 == 1) {
            goto LABEL_30;
          }
          goto LABEL_25;
        default:
          break;
      }
    }
    if (v23 == 1)
    {
LABEL_30:
      uint64_t v27 = ~v11;
      int v28 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v8 + 16);
      v28(a1, a2, v7);
      v28((void *)(((unint64_t)a1 + v12) & v27), (unsigned __int8 *)((unint64_t)&a2[v12] & v27), v22);
      *((unsigned char *)a1 + v14) = 1;
    }
    else
    {
LABEL_25:
      if (v23)
      {
        memcpy(a1, a2, v15);
      }
      else
      {
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
        *((unsigned char *)a1 + v14) = 0;
      }
    }
  }
  return a1;
}

uint64_t destroy for PatternOrEmpty.State.Representation(unsigned __int8 *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v3 = *(void *)(v19 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v4 = swift_getAssociatedTypeWitness();
  uint64_t result = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(result + 64);
  uint64_t v7 = *(unsigned __int8 *)(result + 80);
  uint64_t v8 = v6 + v7;
  unint64_t v9 = ((v6 + v7) & ~v7) + v6;
  if (v9 <= v3) {
    unint64_t v9 = v3;
  }
  unsigned int v10 = a1[v9];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2)
  {
    if (v9 <= 3) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a1;
        goto LABEL_12;
      case 2:
        int v13 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v13 = *(_DWORD *)a1;
LABEL_12:
        int v14 = (v13 | (v11 << (8 * v9))) + 2;
        unsigned int v10 = v13 + 2;
        if (v9 < 4) {
          unsigned int v10 = v14;
        }
        break;
      default:
        break;
    }
  }
  if (v10 == 1)
  {
    uint64_t v18 = ~v7;
    int v20 = *(void (**)(unsigned __int8 *, uint64_t))(result + 8);
    v20(a1, v4);
    int v16 = (unsigned __int8 *)((unint64_t)&a1[v8] & v18);
    uint64_t v17 = v4;
    size_t v15 = (uint64_t (*)(unsigned __int8 *, uint64_t))v20;
  }
  else
  {
    if (v10) {
      return result;
    }
    size_t v15 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v19 + 8);
    int v16 = a1;
    uint64_t v17 = AssociatedTypeWitness;
  }

  return v15(v16, v17);
}

unsigned char *initializeWithCopy for PatternOrEmpty.State.Representation(unsigned char *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v9 + v10;
  unint64_t v12 = ((v9 + v10) & ~v10) + v9;
  if (v12 <= v6) {
    unint64_t v13 = v6;
  }
  else {
    unint64_t v13 = v12;
  }
  unsigned int v14 = a2[v13];
  unsigned int v15 = v14 - 2;
  if (v14 >= 2)
  {
    if (v13 <= 3) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *a2;
        goto LABEL_13;
      case 2:
        int v17 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v17 = *(_DWORD *)a2;
LABEL_13:
        int v18 = (v17 | (v15 << (8 * v13))) + 2;
        unsigned int v14 = v17 + 2;
        if (v13 < 4) {
          unsigned int v14 = v18;
        }
        break;
      default:
        break;
    }
  }
  if (v14 == 1)
  {
    uint64_t v19 = ~v10;
    int v20 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v8 + 16);
    v20(a1, a2, v7);
    v20((unsigned char *)((unint64_t)&a1[v11] & v19), (unsigned __int8 *)((unint64_t)&a2[v11] & v19), v7);
    a1[v13] = 1;
  }
  else if (v14)
  {
    memcpy(a1, a2, v13 + 1);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    a1[v13] = 0;
  }
  return a1;
}

unsigned __int8 *assignWithCopy for PatternOrEmpty.State.Representation(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    unint64_t v6 = *(void *)(v5 + 64);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t v7 = swift_getAssociatedTypeWitness();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void *)(v8 + 64);
    uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v11 = v9 + v10;
    unint64_t v12 = ((v9 + v10) & ~v10) + v9;
    if (v12 <= v6) {
      unint64_t v13 = v6;
    }
    else {
      unint64_t v13 = v12;
    }
    unsigned int v14 = a1[v13];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v16 = v13;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a1;
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 2:
          int v17 = *(unsigned __int16 *)a1;
          if (v13 >= 4) {
            goto LABEL_17;
          }
          goto LABEL_15;
        case 3:
          int v17 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 4:
          int v17 = *(_DWORD *)a1;
          if (v13 < 4) {
LABEL_15:
          }
            unsigned int v14 = (v17 | (v15 << (8 * v13))) + 2;
          else {
LABEL_17:
          }
            unsigned int v14 = v17 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v18 = ~v10;
    if (v14 == 1)
    {
      uint64_t v27 = AssociatedTypeWitness;
      uint64_t v19 = v5;
      int v20 = *(void (**)(unsigned __int8 *, uint64_t))(v8 + 8);
      v20(a1, v7);
      v20((unsigned __int8 *)((unint64_t)&a1[v11] & v18), v7);
      uint64_t v5 = v19;
      uint64_t AssociatedTypeWitness = v27;
    }
    else if (!v14)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    }
    unsigned int v21 = a2[v13];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v23 = v13;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *a2;
          if (v13 >= 4) {
            goto LABEL_38;
          }
          goto LABEL_32;
        case 2:
          int v24 = *(unsigned __int16 *)a2;
          if (v13 >= 4) {
            goto LABEL_38;
          }
          goto LABEL_32;
        case 3:
          int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v13 < 4) {
            goto LABEL_32;
          }
          goto LABEL_38;
        case 4:
          int v24 = *(_DWORD *)a2;
          if (v13 < 4)
          {
LABEL_32:
            unsigned int v21 = (v24 | (v22 << (8 * v13))) + 2;
            break;
          }
LABEL_38:
          unsigned int v21 = v24 + 2;
          if (v21 == 1) {
            goto LABEL_39;
          }
          goto LABEL_34;
        default:
          break;
      }
    }
    if (v21 == 1)
    {
LABEL_39:
      uint64_t v25 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v8 + 16);
      v25(a1, a2, v7);
      v25((unsigned __int8 *)((unint64_t)&a1[v11] & v18), (unsigned __int8 *)((unint64_t)&a2[v11] & v18), v7);
      a1[v13] = 1;
    }
    else
    {
LABEL_34:
      if (v21)
      {
        memcpy(a1, a2, v13 + 1);
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
        a1[v13] = 0;
      }
    }
  }
  return a1;
}

unsigned char *initializeWithTake for PatternOrEmpty.State.Representation(unsigned char *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v9 + v10;
  unint64_t v12 = ((v9 + v10) & ~v10) + v9;
  if (v12 <= v6) {
    unint64_t v13 = v6;
  }
  else {
    unint64_t v13 = v12;
  }
  unsigned int v14 = a2[v13];
  unsigned int v15 = v14 - 2;
  if (v14 >= 2)
  {
    if (v13 <= 3) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 4;
    }
    switch(v16)
    {
      case 1:
        int v17 = *a2;
        goto LABEL_13;
      case 2:
        int v17 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v17 = *(_DWORD *)a2;
LABEL_13:
        int v18 = (v17 | (v15 << (8 * v13))) + 2;
        unsigned int v14 = v17 + 2;
        if (v13 < 4) {
          unsigned int v14 = v18;
        }
        break;
      default:
        break;
    }
  }
  if (v14 == 1)
  {
    uint64_t v19 = ~v10;
    int v20 = *(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v8 + 32);
    v20(a1, a2, v7);
    v20((unsigned char *)((unint64_t)&a1[v11] & v19), (unsigned __int8 *)((unint64_t)&a2[v11] & v19), v7);
    a1[v13] = 1;
  }
  else if (v14)
  {
    memcpy(a1, a2, v13 + 1);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    a1[v13] = 0;
  }
  return a1;
}

unsigned __int8 *assignWithTake for PatternOrEmpty.State.Representation(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    unint64_t v6 = *(void *)(v5 + 64);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t v7 = swift_getAssociatedTypeWitness();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void *)(v8 + 64);
    uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v11 = v9 + v10;
    unint64_t v12 = ((v9 + v10) & ~v10) + v9;
    if (v12 <= v6) {
      unint64_t v13 = v6;
    }
    else {
      unint64_t v13 = v12;
    }
    unsigned int v14 = a1[v13];
    unsigned int v15 = v14 - 2;
    if (v14 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v16 = v13;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a1;
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 2:
          int v17 = *(unsigned __int16 *)a1;
          if (v13 >= 4) {
            goto LABEL_17;
          }
          goto LABEL_15;
        case 3:
          int v17 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v13 < 4) {
            goto LABEL_15;
          }
          goto LABEL_17;
        case 4:
          int v17 = *(_DWORD *)a1;
          if (v13 < 4) {
LABEL_15:
          }
            unsigned int v14 = (v17 | (v15 << (8 * v13))) + 2;
          else {
LABEL_17:
          }
            unsigned int v14 = v17 + 2;
          break;
        default:
          break;
      }
    }
    uint64_t v18 = ~v10;
    if (v14 == 1)
    {
      uint64_t v27 = AssociatedTypeWitness;
      uint64_t v19 = v5;
      int v20 = *(void (**)(unsigned __int8 *, uint64_t))(v8 + 8);
      v20(a1, v7);
      v20((unsigned __int8 *)((unint64_t)&a1[v11] & v18), v7);
      uint64_t v5 = v19;
      uint64_t AssociatedTypeWitness = v27;
    }
    else if (!v14)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    }
    unsigned int v21 = a2[v13];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v13 <= 3) {
        uint64_t v23 = v13;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *a2;
          if (v13 >= 4) {
            goto LABEL_38;
          }
          goto LABEL_32;
        case 2:
          int v24 = *(unsigned __int16 *)a2;
          if (v13 >= 4) {
            goto LABEL_38;
          }
          goto LABEL_32;
        case 3:
          int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v13 < 4) {
            goto LABEL_32;
          }
          goto LABEL_38;
        case 4:
          int v24 = *(_DWORD *)a2;
          if (v13 < 4)
          {
LABEL_32:
            unsigned int v21 = (v24 | (v22 << (8 * v13))) + 2;
            break;
          }
LABEL_38:
          unsigned int v21 = v24 + 2;
          if (v21 == 1) {
            goto LABEL_39;
          }
          goto LABEL_34;
        default:
          break;
      }
    }
    if (v21 == 1)
    {
LABEL_39:
      uint64_t v25 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v8 + 32);
      v25(a1, a2, v7);
      v25((unsigned __int8 *)((unint64_t)&a1[v11] & v18), (unsigned __int8 *)((unint64_t)&a2[v11] & v18), v7);
      a1[v13] = 1;
    }
    else
    {
LABEL_34:
      if (v21)
      {
        memcpy(a1, a2, v13 + 1);
      }
      else
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
        a1[v13] = 0;
      }
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PatternOrEmpty.State.Representation(unsigned __int16 *a1, unsigned int a2)
{
  unint64_t v4 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v5 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v6 = ((*(void *)(v5 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(void *)(v5 + 64);
  if (v6 <= v4) {
    unint64_t v7 = v4;
  }
  else {
    unint64_t v7 = v6;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_23;
  }
  unint64_t v8 = v7 + 1;
  char v9 = 8 * (v7 + 1);
  if ((v7 + 1) <= 3)
  {
    unsigned int v12 = ((a2 + ~(-1 << v9) - 253) >> v9) + 1;
    if (HIWORD(v12))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v12 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v12 < 2)
    {
LABEL_23:
      unsigned int v14 = *((unsigned __int8 *)a1 + v7);
      if (v14 >= 3) {
        return (v14 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_23;
  }
LABEL_15:
  int v13 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v13 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v8 | v13) + 254;
}

void storeEnumTagSinglePayload for PatternOrEmpty.State.Representation(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v6 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v8 = ((*(void *)(v7 + 64) + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
     + *(void *)(v7 + 64);
  if (v8 <= v6) {
    unint64_t v8 = v6;
  }
  size_t v9 = v8 + 1;
  if (a3 < 0xFE)
  {
    int v10 = 0;
  }
  else if (v9 <= 3)
  {
    unsigned int v13 = ((a3 + ~(-1 << (8 * v9)) - 253) >> (8 * v9)) + 1;
    if (HIWORD(v13))
    {
      int v10 = 4;
    }
    else if (v13 >= 0x100)
    {
      int v10 = 2;
    }
    else
    {
      int v10 = v13 > 1;
    }
  }
  else
  {
    int v10 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v11 = a2 - 254;
    if (v9 < 4)
    {
      int v12 = (v11 >> (8 * v9)) + 1;
      if (v8 != -1)
      {
        int v14 = v11 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v14;
          a1[2] = BYTE2(v14);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v14;
        }
        else
        {
          *a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v8 + 1);
      *(_DWORD *)a1 = v11;
      int v12 = 1;
    }
    switch(v10)
    {
      case 1:
        a1[v9] = v12;
        break;
      case 2:
        *(_WORD *)&a1[v9] = v12;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x209FAA4DCLL);
      case 4:
        *(_DWORD *)&a1[v9] = v12;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v10)
    {
      case 1:
        a1[v9] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v9] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v9] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v8] = -(char)a2;
        break;
    }
  }
}

void *assignWithCopy for PredicateConsumer(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t type metadata accessor for PredicateSearcher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for Executor(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for MEProgram(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  uint64_t v6 = *a2;
  *(void *)a1 = *a2;
  if ((v5 & 0x20000) != 0)
  {
    a1 = v6 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = (int *)v4;
    uint64_t v8 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v8;
    uint64_t v9 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v9;
    uint64_t v10 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v10;
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 17);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 19);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 21);
    *(void *)(a1 + 184) = a2[23];
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 13);
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 15);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    *(_WORD *)(a1 + 192) = *((_WORD *)a2 + 96);
    uint64_t v11 = *(int *)(v4 + 56);
    uint64_t v15 = (uint64_t)a2 + v11;
    uint64_t v16 = a1 + v11;
    uint64_t v12 = type metadata accessor for CaptureList();
    int v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v16, v15, v12);
    *(void *)(a1 + v7[15]) = *(uint64_t *)((char *)a2 + v7[15]);
    *(void *)(a1 + v7[16]) = *(uint64_t *)((char *)a2 + v7[16]);
    *(unsigned char *)(a1 + v7[17]) = *((unsigned char *)a2 + v7[17]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Executor(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for MEProgram(0) + 56);
  uint64_t v3 = type metadata accessor for CaptureList();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Executor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  long long v7 = *(_OWORD *)(a2 + 72);
  long long v8 = *(_OWORD *)(a2 + 88);
  long long v9 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v9;
  *(_OWORD *)(a1 + 88) = v8;
  *(_OWORD *)(a1 + 72) = v7;
  long long v10 = *(_OWORD *)(a2 + 136);
  long long v11 = *(_OWORD *)(a2 + 152);
  long long v12 = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = v12;
  *(_OWORD *)(a1 + 152) = v11;
  *(_OWORD *)(a1 + 136) = v10;
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  unsigned int v13 = (int *)type metadata accessor for MEProgram(0);
  uint64_t v14 = v13[14];
  uint64_t v18 = a2 + v14;
  uint64_t v19 = a1 + v14;
  uint64_t v15 = type metadata accessor for CaptureList();
  int v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v19, v18, v15);
  *(void *)(a1 + v13[15]) = *(void *)(a2 + v13[15]);
  *(void *)(a1 + v13[16]) = *(void *)(a2 + v13[16]);
  *(unsigned char *)(a1 + v13[17]) = *(unsigned char *)(a2 + v13[17]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Executor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  uint64_t v4 = (int *)type metadata accessor for MEProgram(0);
  uint64_t v5 = v4[14];
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for CaptureList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  *(void *)(a1 + v4[15]) = *(void *)(a2 + v4[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + v4[16]) = *(void *)(a2 + v4[16]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v4[17]) = *(unsigned char *)(a2 + v4[17]);
  return a1;
}

uint64_t initializeWithTake for Executor(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  uint64_t v5 = (int *)type metadata accessor for MEProgram(0);
  uint64_t v6 = v5[14];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for CaptureList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)(a1 + v5[15]) = *(void *)(a2 + v5[15]);
  *(void *)(a1 + v5[16]) = *(void *)(a2 + v5[16]);
  *(unsigned char *)(a1 + v5[17]) = *(unsigned char *)(a2 + v5[17]);
  return a1;
}

uint64_t assignWithTake for Executor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  long long v4 = (int *)type metadata accessor for MEProgram(0);
  uint64_t v5 = v4[14];
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for CaptureList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  *(void *)(a1 + v4[15]) = *(void *)(a2 + v4[15]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + v4[16]) = *(void *)(a2 + v4[16]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v4[17]) = *(unsigned char *)(a2 + v4[17]);
  return a1;
}

uint64_t getEnumTagSinglePayload for Engine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_209FAAE50);
}

uint64_t sub_209FAAE50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, type metadata accessor for MEProgram);
}

uint64_t storeEnumTagSinglePayload for Engine(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_209FAAE7C);
}

uint64_t sub_209FAAE7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, type metadata accessor for MEProgram);
}

uint64_t destroy for Processor.Registers()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Processor.Registers(void *a1, void *a2)
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
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Processor.Registers(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
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

uint64_t assignWithTake for Processor.Registers(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Processor.Registers(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Processor.Registers(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Processor.Registers()
{
  return &type metadata for Processor.Registers;
}

uint64_t destroy for Processor.SavePoint()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Processor.SavePoint(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Processor.SavePoint(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  long long v5 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for Processor.SavePoint(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Processor.SavePoint(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Processor.SavePoint(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Processor.SavePoint()
{
  return &type metadata for Processor.SavePoint;
}

void *initializeBufferWithCopyOfBuffer for StringLiteralBuilder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for StringLiteralBuilder()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for StringLiteralBuilder(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for StringLiteralBuilder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StringLiteralBuilder(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StringLiteralBuilder(uint64_t result, int a2, int a3)
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

void *type metadata accessor for StringLiteralBuilder()
{
  return &unk_26BE09880;
}

uint64_t type metadata accessor for TypedInt()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for _CharacterClassModel.Representation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for _CharacterClassModel.Representation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x209FAB788);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _CharacterClassModel.Representation()
{
  return &type metadata for _CharacterClassModel.Representation;
}

_DWORD *__swift_memcpy4_1(_DWORD *result, _DWORD *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _CharacterClassModel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 1);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for _CharacterClassModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 1) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _CharacterClassModel()
{
  return &type metadata for _CharacterClassModel;
}

uint64_t destroy for CaptureTransform(uint64_t a1)
{
  return outlined consume of CaptureTransform.Closure(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for CaptureTransform(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 32);
  outlined copy of CaptureTransform.Closure(v3, v4, v5);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithCopy for CaptureTransform(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 32);
  outlined copy of CaptureTransform.Closure(v3, v4, v5);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v5;
  outlined consume of CaptureTransform.Closure(v6, v7, v8);
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

uint64_t assignWithTake for CaptureTransform(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  unsigned __int8 v7 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  outlined consume of CaptureTransform.Closure(v4, v5, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for CaptureTransform(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureTransform(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptureTransform()
{
  return &type metadata for CaptureTransform;
}

uint64_t initializeBufferWithCopyOfBuffer for CaptureTransform.Closure(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return initializeBufferWithCopyOfBuffer for RegexCompilationError(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))outlined copy of CaptureTransform.Closure);
}

uint64_t destroy for CaptureTransform.Closure(uint64_t a1)
{
  return outlined consume of CaptureTransform.Closure(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for RegexCompilationError(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for CaptureTransform.Closure(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return assignWithCopy for RegexCompilationError(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))outlined copy of CaptureTransform.Closure, (void (*)(uint64_t, uint64_t, uint64_t))outlined consume of CaptureTransform.Closure);
}

uint64_t *assignWithCopy for RegexCompilationError(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for CaptureTransform.Closure(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return assignWithTake for RegexCompilationError(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))outlined consume of CaptureTransform.Closure);
}

uint64_t *assignWithTake for RegexCompilationError(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CaptureTransform.Closure(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptureTransform.Closure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t destructiveInjectEnumTag for CaptureTransform.Closure(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CaptureTransform.Closure()
{
  return &type metadata for CaptureTransform.Closure;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for MEProgram.RegisterInfo(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MEProgram.RegisterInfo(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
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
  *(unsigned char *)(result + 136) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MEProgram.RegisterInfo()
{
  return &type metadata for MEProgram.RegisterInfo;
}

void destroy for Processor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  JUMPOUT(0x21050FBD0);
}

uint64_t initializeWithCopy for Processor(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  uint64_t v8 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  uint64_t v11 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v11;
  uint64_t v12 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v12;
  uint64_t v9 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v9;
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  uint64_t v13 = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x21050FBE0](v13);
  *(void *)(a1 + 200) = v13;
  return a1;
}

uint64_t assignWithCopy for Processor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = v4;
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  uint64_t v5 = *(void *)(a1 + 200);
  uint64_t v6 = *(void *)(a2 + 200);
  MEMORY[0x21050FBE0](v6);
  *(void *)(a1 + 200) = v6;
  MEMORY[0x21050FBD0](v5);
  return a1;
}

__n128 __swift_memcpy208_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

uint64_t assignWithTake for Processor(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  uint64_t v6 = *(void *)(a1 + 200);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  MEMORY[0x21050FBD0](v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Processor(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 208)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Processor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 200) = 0;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 208) = 1;
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
    *(unsigned char *)(result + 208) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Processor()
{
  return &type metadata for Processor;
}

uint64_t destroy for Processor._StoredCapture(uint64_t result)
{
  if (*(void *)(result + 48)) {
    return __swift_destroy_boxed_opaque_existential_0(result + 24);
  }
  return result;
}

uint64_t initializeWithCopy for Processor._StoredCapture(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = (_OWORD *)(a1 + 24);
  long long v5 = (_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  if (v6)
  {
    *(void *)(a1 + 48) = v6;
    (**(void (***)(_OWORD *, _OWORD *))(v6 - 8))(v4, v5);
  }
  else
  {
    long long v7 = v5[1];
    *uint64_t v4 = *v5;
    v4[1] = v7;
  }
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for Processor._StoredCapture(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v4;
  long long v5 = (_OWORD *)(a1 + 24);
  uint64_t v6 = (long long *)((char *)a2 + 24);
  uint64_t v7 = *((void *)a2 + 6);
  if (!*(void *)(a1 + 48))
  {
    if (v7)
    {
      *(void *)(a1 + 48) = v7;
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 24, (uint64_t)a2 + 24);
      goto LABEL_8;
    }
LABEL_7:
    long long v8 = v6[1];
    *long long v5 = *v6;
    v5[1] = v8;
    goto LABEL_8;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_0(a1 + 24);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 24), (uint64_t *)a2 + 3);
LABEL_8:
  uint64_t v9 = *((void *)a2 + 7);
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 56) = v9;
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Processor._StoredCapture(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v4 = (_OWORD *)(a1 + 24);
  if (*(void *)(a1 + 48)) {
    __swift_destroy_boxed_opaque_existential_0(a1 + 24);
  }
  long long v5 = *(_OWORD *)(a2 + 40);
  *long long v4 = *(_OWORD *)(a2 + 24);
  v4[1] = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for Processor._StoredCapture(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 65)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Processor._StoredCapture(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(void *)(result + 48) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Processor._StoredCapture()
{
  return &type metadata for Processor._StoredCapture;
}

uint64_t getEnumTagSinglePayload for DSLTree.CustomCharacterClass.AsciiBitset(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DSLTree.CustomCharacterClass.AsciiBitset(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DSLTree.CustomCharacterClass.AsciiBitset()
{
  return &type metadata for DSLTree.CustomCharacterClass.AsciiBitset;
}

ValueMetadata *type metadata accessor for _InstructionAddress()
{
  return &type metadata for _InstructionAddress;
}

ValueMetadata *type metadata accessor for Instruction()
{
  return &type metadata for Instruction;
}

uint64_t type metadata completion function for TypedIndex()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ManyConsumer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = a1;
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
    *unsigned int v3 = *a2;
    unsigned int v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t destroy for ManyConsumer(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t initializeWithCopy for ManyConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithCopy for ManyConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t initializeWithTake for ManyConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t assignWithTake for ManyConsumer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for ManyConsumer(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
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
        return (*(uint64_t (**)(void))(v4 + 48))();
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

void storeEnumTagSinglePayload for ManyConsumer(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
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
      JUMPOUT(0x209FACCD4);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for TypedIndex()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for AnyHashableType(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyHashableType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyHashableType()
{
  return &type metadata for AnyHashableType;
}

unint64_t destroy for RegexMatchesCollection.Index(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for RegexMatchesCollection.Index(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    long long v4 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for RegexMatchesCollection.Index(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 1);
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(_OWORD *)(a1 + 24) = *(long long *)((char *)a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  return a1;
}

uint64_t assignWithTake for RegexMatchesCollection.Index(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for RegexMatchesCollection.Index(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
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

uint64_t storeEnumTagSinglePayload for RegexMatchesCollection.Index(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t getEnumTag for RegexMatchesCollection.Index(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double destructiveInjectEnumTag for RegexMatchesCollection.Index(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(void *)(a1 + 8) = (a2 - 1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LazyMapSequence(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unsigned int v10 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = v10[1];
    unsigned int v12 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *unsigned int v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for LazyMapSequence(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();

  return swift_release();
}

uint64_t initializeWithCopy for LazyMapSequence(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for LazyMapSequence(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  size_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for LazyMapSequence(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for LazyMapSequence(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LazyMapSequence(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x209FAD598);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void storeEnumTagSinglePayload for LazyMapSequence(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x209FAD78CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v19 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            uint64_t v19 = a2 - 1;
          }
          *uint64_t v18 = v19;
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

unint64_t lazy protocol witness table accessor for type AnyHashableType and conformance AnyHashableType()
{
  unint64_t result = lazy protocol witness table cache variable for type AnyHashableType and conformance AnyHashableType;
  if (!lazy protocol witness table cache variable for type AnyHashableType and conformance AnyHashableType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyHashableType and conformance AnyHashableType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Instruction and conformance Instruction()
{
  unint64_t result = lazy protocol witness table cache variable for type Instruction and conformance Instruction;
  if (!lazy protocol witness table cache variable for type Instruction and conformance Instruction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Instruction and conformance Instruction);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CaptureTransform and conformance CaptureTransform()
{
  unint64_t result = lazy protocol witness table cache variable for type CaptureTransform and conformance CaptureTransform;
  if (!lazy protocol witness table cache variable for type CaptureTransform and conformance CaptureTransform)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CaptureTransform and conformance CaptureTransform);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _CharacterClassModel and conformance _CharacterClassModel()
{
  unint64_t result = lazy protocol witness table cache variable for type _CharacterClassModel and conformance _CharacterClassModel;
  if (!lazy protocol witness table cache variable for type _CharacterClassModel and conformance _CharacterClassModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _CharacterClassModel and conformance _CharacterClassModel);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _CharacterClassModel.Representation and conformance _CharacterClassModel.Representation()
{
  unint64_t result = lazy protocol witness table cache variable for type _CharacterClassModel.Representation and conformance _CharacterClassModel.Representation;
  if (!lazy protocol witness table cache variable for type _CharacterClassModel.Representation and conformance _CharacterClassModel.Representation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _CharacterClassModel.Representation and conformance _CharacterClassModel.Representation);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SubstringSearcher and conformance SubstringSearcher()
{
  unint64_t result = lazy protocol witness table cache variable for type SubstringSearcher and conformance SubstringSearcher;
  if (!lazy protocol witness table cache variable for type SubstringSearcher and conformance SubstringSearcher)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SubstringSearcher and conformance SubstringSearcher);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SentinelValue and conformance SentinelValue()
{
  unint64_t result = lazy protocol witness table cache variable for type SentinelValue and conformance SentinelValue;
  if (!lazy protocol witness table cache variable for type SentinelValue and conformance SentinelValue)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SentinelValue and conformance SentinelValue);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Instruction.OpCode and conformance Instruction.OpCode()
{
  unint64_t result = lazy protocol witness table cache variable for type Instruction.OpCode and conformance Instruction.OpCode;
  if (!lazy protocol witness table cache variable for type Instruction.OpCode and conformance Instruction.OpCode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Instruction.OpCode and conformance Instruction.OpCode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type QuantifyPayload.PayloadType and conformance QuantifyPayload.PayloadType()
{
  unint64_t result = lazy protocol witness table cache variable for type QuantifyPayload.PayloadType and conformance QuantifyPayload.PayloadType;
  if (!lazy protocol witness table cache variable for type QuantifyPayload.PayloadType and conformance QuantifyPayload.PayloadType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type QuantifyPayload.PayloadType and conformance QuantifyPayload.PayloadType);
  }
  return result;
}

ValueMetadata *type metadata accessor for Processor.ProcessorMetrics()
{
  return &type metadata for Processor.ProcessorMetrics;
}

uint64_t getEnumTagSinglePayload for RegexRepetitionBehavior(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RegexRepetitionBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x209FADC38);
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

ValueMetadata *type metadata accessor for State()
{
  return &type metadata for State;
}

ValueMetadata *type metadata accessor for Controller()
{
  return &type metadata for Controller;
}

ValueMetadata *type metadata accessor for MatchMode()
{
  return &type metadata for MatchMode;
}

ValueMetadata *type metadata accessor for _CallStackAddress()
{
  return &type metadata for _CallStackAddress;
}

ValueMetadata *type metadata accessor for MEProgram.Builder._AddressToken()
{
  return &type metadata for MEProgram.Builder._AddressToken;
}

ValueMetadata *type metadata accessor for _PositionRegister()
{
  return &type metadata for _PositionRegister;
}

ValueMetadata *type metadata accessor for _ValueRegister()
{
  return &type metadata for _ValueRegister;
}

ValueMetadata *type metadata accessor for _CaptureRegister()
{
  return &type metadata for _CaptureRegister;
}

ValueMetadata *type metadata accessor for _IntRegister()
{
  return &type metadata for _IntRegister;
}

uint64_t destroy for TypedSetVector()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for TypedSetVector(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TypedSetVector(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for TypedSetVector(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PredicateConsumer(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PredicateConsumer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for TypedSetVector()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for RegexSemanticLevel(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RegexSemanticLevel(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x209FAE000);
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

unsigned char *destructiveInjectEnumTag for MatchingOptions.SemanticLevel(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MatchingOptions.SemanticLevel()
{
  return &type metadata for MatchingOptions.SemanticLevel;
}

unint64_t lazy protocol witness table accessor for type MatchingOptions.SemanticLevel and conformance MatchingOptions.SemanticLevel()
{
  unint64_t result = lazy protocol witness table cache variable for type MatchingOptions.SemanticLevel and conformance MatchingOptions.SemanticLevel;
  if (!lazy protocol witness table cache variable for type MatchingOptions.SemanticLevel and conformance MatchingOptions.SemanticLevel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MatchingOptions.SemanticLevel and conformance MatchingOptions.SemanticLevel);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MatchMode and conformance MatchMode()
{
  unint64_t result = lazy protocol witness table cache variable for type MatchMode and conformance MatchMode;
  if (!lazy protocol witness table cache variable for type MatchMode and conformance MatchMode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MatchMode and conformance MatchMode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type State and conformance State()
{
  unint64_t result = lazy protocol witness table cache variable for type State and conformance State;
  if (!lazy protocol witness table cache variable for type State and conformance State)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type State and conformance State);
  }
  return result;
}

uint64_t _swift_string_processing_getScalarBitArrayIdx(unsigned int a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1 / 0x4400uLL;
  unint64_t v4 = *a2;
  if (*a2 < v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = (a1 / 0x110uLL) & 0x3F;
  unint64_t v6 = a2[v3 + 1];
  if (((v6 >> v5) & 1) == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned __int16 v7 = *(_WORD *)(a3 + 2 * v3);
  if (v5) {
    v7 += vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v6 << -(char)v5)));
  }
  uint64_t v8 = 5 * v7;
  uint64_t v9 = (uint64_t)&a2[5 * v7 + 1 + v4];
  uint64_t v10 = (a1 % 0x110) >> 6;
  unint64_t v11 = *(void *)(v9 + 8 * v10);
  if (((v11 >> (a1 % 0x110)) & 1) == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v12 = (a1 % 0x110) & 0x3F;
  unsigned __int16 v13 = *(_WORD *)(a3 + 2 * (v4 + v10 + v8));
  unsigned __int16 v14 = v13 + vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v11 << -(char)v12)));
  if (v12) {
    unsigned __int16 v13 = v14;
  }
  return (*(void *)(v9 + 32) >> 16) + v13;
}

uint64_t _swift_string_processing_getScript(unsigned int a1)
{
  int v1 = 0;
  int v2 = 1638;
  while (1)
  {
    int v3 = v2 - v1;
    if (v2 < v1) {
      ++v3;
    }
    int v4 = v1 + (v3 >> 1);
    int v5 = v4;
    unsigned int v6 = v4 == 1638 ? 1114111 : (_swift_stdlib_scripts[v4 + 1] & 0x1FFFFF) - 1;
    unsigned int v7 = _swift_stdlib_scripts[v4];
    if ((v7 & 0x1FFFFF) <= a1 && v6 >= a1) {
      break;
    }
    if ((v7 & 0x1FFFFF) <= a1) {
      int v9 = v2;
    }
    else {
      int v9 = v4 - 1;
    }
    if (v6 < a1) {
      int v1 = v5 + 1;
    }
    else {
      int v2 = v9;
    }
    if (v2 < v1) {
      return 255;
    }
  }
  return v7 >> 21;
}

char *_swift_string_processing_getScriptExtensions(unsigned int a1, unsigned char *a2)
{
  uint64_t ScalarBitArrayIdx = _swift_string_processing_getScalarBitArrayIdx(a1, _swift_stdlib_script_extensions, (uint64_t)&_swift_stdlib_script_extensions_ranks);
  if (ScalarBitArrayIdx == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unsigned int v5 = _swift_stdlib_script_extensions_data_indices[ScalarBitArrayIdx];
  *a2 = v5 >> 11;
  return (char *)&_swift_stdlib_script_extensions_data + (v5 & 0x7FF);
}

Swift::Int_optional __swiftcall CaptureList.indexOfCapture(named:)(Swift::String named)
{
  Swift::Int v1 = MEMORY[0x270FA24A0](named._countAndFlagsBits, named._object);
  result.value = v1;
  result.is_nil = v2;
  return result;
}

uint64_t CaptureList.Capture.optionalDepth.getter()
{
  return MEMORY[0x270FA24A8]();
}

uint64_t CaptureList.Capture.visibleInTypedOutput.getter()
{
  return MEMORY[0x270FA24B0]();
}

uint64_t CaptureList.Capture.init(name:type:optionalDepth:visibleInTypedOutput:_:)()
{
  return MEMORY[0x270FA24B8]();
}

uint64_t CaptureList.Capture.name.getter()
{
  return MEMORY[0x270FA24C0]();
}

uint64_t CaptureList.Capture.type.getter()
{
  return MEMORY[0x270FA24C8]();
}

uint64_t type metadata accessor for CaptureList.Capture()
{
  return MEMORY[0x270FA24D0]();
}

uint64_t CaptureList.init(arrayLiteral:)()
{
  return MEMORY[0x270FA24D8]();
}

uint64_t CaptureList.append(_:)()
{
  return MEMORY[0x270FA24E0]();
}

uint64_t CaptureList.Builder.addCaptures(of:optionalNesting:visibleInTypedOutput:)()
{
  return MEMORY[0x270FA24E8]();
}

uint64_t CaptureList.Builder.OptionalNesting.addingOptional.getter()
{
  return MEMORY[0x270FA24F0]();
}

uint64_t CaptureList.Builder.OptionalNesting.disablingNesting.getter()
{
  return MEMORY[0x270FA24F8]();
}

uint64_t CaptureList.Builder.OptionalNesting.depth.getter()
{
  return MEMORY[0x270FA2500]();
}

uint64_t CaptureList.Builder.OptionalNesting.init(canNest:)()
{
  return MEMORY[0x270FA2508]();
}

uint64_t type metadata accessor for CaptureList.Builder.OptionalNesting()
{
  return MEMORY[0x270FA2510]();
}

uint64_t CaptureList.Builder.captures.modify()
{
  return MEMORY[0x270FA2518]();
}

uint64_t CaptureList.Builder.captures.getter()
{
  return MEMORY[0x270FA2520]();
}

uint64_t CaptureList.Builder.init()()
{
  return MEMORY[0x270FA2528]();
}

uint64_t type metadata accessor for CaptureList.Builder()
{
  return MEMORY[0x270FA2530]();
}

uint64_t CaptureList.captures.getter()
{
  return MEMORY[0x270FA2538]();
}

uint64_t type metadata accessor for CaptureList()
{
  return MEMORY[0x270FA2540]();
}

uint64_t Diagnostics.init()()
{
  return MEMORY[0x270FA2548]();
}

uint64_t type metadata accessor for Diagnostics()
{
  return MEMORY[0x270FA2550]();
}

uint64_t type metadata accessor for Unreachable()
{
  return MEMORY[0x270FA2558]();
}

uint64_t Unreachable.init(_:file:line:)()
{
  return MEMORY[0x270FA2560]();
}

uint64_t type metadata accessor for Unsupported()
{
  return MEMORY[0x270FA2568]();
}

uint64_t Unsupported.init(_:file:line:)()
{
  return MEMORY[0x270FA2570]();
}

uint64_t PrettyPrinter.printBlock(_:startDelimiter:endDelimiter:_:)()
{
  return MEMORY[0x270FA2578]();
}

uint64_t PrettyPrinter.printIndented(_:)()
{
  return MEMORY[0x270FA2580]();
}

Swift::Void __swiftcall PrettyPrinter.terminateLine()()
{
}

uint64_t PrettyPrinter.init(maxTopDownLevels:minBottomUpLevels:)()
{
  return MEMORY[0x270FA2590]();
}

uint64_t PrettyPrinter.maxTopDownLevels.getter()
{
  return MEMORY[0x270FA2598]();
}

uint64_t PrettyPrinter.printAsCanonical(_:delimiters:terminateLine:)()
{
  return MEMORY[0x270FA25A0]();
}

uint64_t PrettyPrinter.minBottomUpLevels.getter()
{
  return MEMORY[0x270FA25A8]();
}

Swift::tuple_OpaquePointer_Bool __swiftcall PrettyPrinter.popMatchingOptions()()
{
  v0 = (void *)MEMORY[0x270FA25B0]();
  result._0._rawValue = v0;
  result._1 = v1;
  return result;
}

Swift::Void __swiftcall PrettyPrinter.pushMatchingOptions(_:isAdded:)(Swift::OpaquePointer _, Swift::Bool isAdded)
{
}

uint64_t PrettyPrinter.inlineMatchingOptions.getter()
{
  return MEMORY[0x270FA25C0]();
}

uint64_t PrettyPrinter.quantificationBehavior.getter()
{
  return MEMORY[0x270FA25C8]();
}

uint64_t PrettyPrinter.quantificationBehavior.setter()
{
  return MEMORY[0x270FA25D0]();
}

uint64_t PrettyPrinter.depth.getter()
{
  return MEMORY[0x270FA25D8]();
}

Swift::Void __swiftcall PrettyPrinter.print(_:)(Swift::String a1)
{
}

Swift::String __swiftcall PrettyPrinter.finish()()
{
  uint64_t v0 = MEMORY[0x270FA25E8]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::Void __swiftcall PrettyPrinter.indent()()
{
}

Swift::Void __swiftcall PrettyPrinter.output(_:)(Swift::String a1)
{
}

uint64_t type metadata accessor for PrettyPrinter()
{
  return MEMORY[0x270FA2600]();
}

uint64_t static SyntaxOptions.traditional.getter()
{
  return MEMORY[0x270FA2608]();
}

uint64_t type metadata accessor for SyntaxOptions()
{
  return MEMORY[0x270FA2610]();
}

uint64_t static TypeConstruction.tupleType<A>(of:labels:)()
{
  return MEMORY[0x270FA2618]();
}

uint64_t static TypeConstruction.optionalType<A>(of:depth:)()
{
  return MEMORY[0x270FA2620]();
}

uint64_t static TypeConstruction.optionalType(of:)()
{
  return MEMORY[0x270FA2628]();
}

uint64_t static TypeConstruction.tuple<A>(of:)()
{
  return MEMORY[0x270FA2630]();
}

uint64_t parseWithDelimiters<A>(_:)()
{
  return MEMORY[0x270FA2638]();
}

uint64_t AST.Alternation.children.getter()
{
  return MEMORY[0x270FA2640]();
}

uint64_t type metadata accessor for AST.Alternation()
{
  return MEMORY[0x270FA2648]();
}

uint64_t AST.Conditional.trueBranch.getter()
{
  return MEMORY[0x270FA2650]();
}

uint64_t AST.Conditional.falseBranch.getter()
{
  return MEMORY[0x270FA2658]();
}

uint64_t type metadata accessor for AST.Conditional.Condition.Kind()
{
  return MEMORY[0x270FA2660]();
}

uint64_t AST.Conditional.Condition.kind.getter()
{
  return MEMORY[0x270FA2668]();
}

uint64_t type metadata accessor for AST.Conditional.Condition()
{
  return MEMORY[0x270FA2670]();
}

uint64_t AST.Conditional.condition.getter()
{
  return MEMORY[0x270FA2678]();
}

uint64_t type metadata accessor for AST.Conditional()
{
  return MEMORY[0x270FA2680]();
}

uint64_t AST.Concatenation.children.getter()
{
  return MEMORY[0x270FA2688]();
}

uint64_t type metadata accessor for AST.Concatenation()
{
  return MEMORY[0x270FA2690]();
}

uint64_t type metadata accessor for AST.AbsentFunction.Kind()
{
  return MEMORY[0x270FA2698]();
}

uint64_t AST.AbsentFunction.kind.getter()
{
  return MEMORY[0x270FA26A0]();
}

uint64_t AST.AbsentFunction.children.getter()
{
  return MEMORY[0x270FA26A8]();
}

uint64_t type metadata accessor for AST.AbsentFunction()
{
  return MEMORY[0x270FA26B0]();
}

uint64_t type metadata accessor for AST.MatchingOption.Kind()
{
  return MEMORY[0x270FA26B8]();
}

uint64_t AST.MatchingOption.kind.getter()
{
  return MEMORY[0x270FA26C0]();
}

uint64_t type metadata accessor for AST.MatchingOption()
{
  return MEMORY[0x270FA26C8]();
}

uint64_t AST.MatchingOption.init(_:location:)()
{
  return MEMORY[0x270FA26D0]();
}

uint64_t type metadata accessor for AST.Quantification.Kind()
{
  return MEMORY[0x270FA26D8]();
}

uint64_t AST.Quantification.kind.getter()
{
  return MEMORY[0x270FA26E0]();
}

uint64_t AST.Quantification.child.getter()
{
  return MEMORY[0x270FA26E8]();
}

uint64_t AST.Quantification.Amount.bounds.getter()
{
  return MEMORY[0x270FA26F0]();
}

uint64_t type metadata accessor for AST.Quantification.Amount()
{
  return MEMORY[0x270FA26F8]();
}

uint64_t AST.Quantification.amount.getter()
{
  return MEMORY[0x270FA2700]();
}

uint64_t type metadata accessor for AST.Quantification()
{
  return MEMORY[0x270FA2708]();
}

uint64_t AST.CustomCharacterClass.isInverted.getter()
{
  return MEMORY[0x270FA2710]();
}

uint64_t AST.CustomCharacterClass.Range.lhs.getter()
{
  return MEMORY[0x270FA2718]();
}

uint64_t AST.CustomCharacterClass.Range.rhs.getter()
{
  return MEMORY[0x270FA2720]();
}

uint64_t type metadata accessor for AST.CustomCharacterClass.Range()
{
  return MEMORY[0x270FA2728]();
}

uint64_t type metadata accessor for AST.CustomCharacterClass.SetOp()
{
  return MEMORY[0x270FA2730]();
}

uint64_t type metadata accessor for AST.CustomCharacterClass.Member()
{
  return MEMORY[0x270FA2738]();
}

uint64_t AST.CustomCharacterClass.members.getter()
{
  return MEMORY[0x270FA2740]();
}

uint64_t type metadata accessor for AST.CustomCharacterClass()
{
  return MEMORY[0x270FA2748]();
}

uint64_t AST.MatchingOptionSequence.resetsCurrentOptions.getter()
{
  return MEMORY[0x270FA2750]();
}

uint64_t AST.MatchingOptionSequence.init(adding:)()
{
  return MEMORY[0x270FA2758]();
}

uint64_t AST.MatchingOptionSequence.adding.getter()
{
  return MEMORY[0x270FA2760]();
}

uint64_t AST.MatchingOptionSequence.caretLoc.getter()
{
  return MEMORY[0x270FA2768]();
}

uint64_t AST.MatchingOptionSequence.init(removing:)()
{
  return MEMORY[0x270FA2770]();
}

uint64_t AST.MatchingOptionSequence.removing.getter()
{
  return MEMORY[0x270FA2778]();
}

uint64_t type metadata accessor for AST.MatchingOptionSequence()
{
  return MEMORY[0x270FA2780]();
}

uint64_t type metadata accessor for AST.GlobalMatchingOptionSequence()
{
  return MEMORY[0x270FA2788]();
}

uint64_t AST.Atom.EscapedBuiltin.scalarValue.getter()
{
  return MEMORY[0x270FA2790]();
}

uint64_t AST.Atom.EscapedBuiltin.character.getter()
{
  return MEMORY[0x270FA2798]();
}

uint64_t type metadata accessor for AST.Atom.EscapedBuiltin()
{
  return MEMORY[0x270FA27A0]();
}

uint64_t AST.Atom.ScalarSequence.scalarValues.getter()
{
  return MEMORY[0x270FA27A8]();
}

uint64_t type metadata accessor for AST.Atom.ScalarSequence()
{
  return MEMORY[0x270FA27B0]();
}

uint64_t AST.Atom.isQuantifiable.getter()
{
  return MEMORY[0x270FA27B8]();
}

uint64_t AST.Atom.CharacterProperty.isInverted.getter()
{
  return MEMORY[0x270FA27C0]();
}

uint64_t type metadata accessor for AST.Atom.CharacterProperty.JavaSpecial()
{
  return MEMORY[0x270FA27C8]();
}

uint64_t type metadata accessor for AST.Atom.CharacterProperty.PCRESpecialCategory()
{
  return MEMORY[0x270FA27D0]();
}

uint64_t type metadata accessor for AST.Atom.CharacterProperty.Kind.MapKind()
{
  return MEMORY[0x270FA27D8]();
}

uint64_t type metadata accessor for AST.Atom.CharacterProperty.Kind()
{
  return MEMORY[0x270FA27E0]();
}

uint64_t AST.Atom.CharacterProperty.kind.getter()
{
  return MEMORY[0x270FA27E8]();
}

uint64_t type metadata accessor for AST.Atom.CharacterProperty()
{
  return MEMORY[0x270FA27F0]();
}

uint64_t AST.Atom.CharacterProperty.init(_:isInverted:isPOSIX:)()
{
  return MEMORY[0x270FA27F8]();
}

uint64_t AST.Atom.literalStringValue.getter()
{
  return MEMORY[0x270FA2800]();
}

uint64_t type metadata accessor for AST.Atom.Kind()
{
  return MEMORY[0x270FA2808]();
}

uint64_t AST.Atom.kind.getter()
{
  return MEMORY[0x270FA2810]();
}

uint64_t AST.Atom.Number.value.getter()
{
  return MEMORY[0x270FA2818]();
}

uint64_t type metadata accessor for AST.Atom.Number()
{
  return MEMORY[0x270FA2820]();
}

uint64_t AST.Atom.Number.init(_:at:)()
{
  return MEMORY[0x270FA2828]();
}

uint64_t AST.Atom.Scalar.value.getter()
{
  return MEMORY[0x270FA2830]();
}

uint64_t type metadata accessor for AST.Atom.Scalar()
{
  return MEMORY[0x270FA2838]();
}

uint64_t type metadata accessor for AST.Atom()
{
  return MEMORY[0x270FA2840]();
}

uint64_t AST.Atom.init(_:_:)()
{
  return MEMORY[0x270FA2848]();
}

uint64_t type metadata accessor for AST.Node()
{
  return MEMORY[0x270FA2850]();
}

uint64_t AST.root.getter()
{
  return MEMORY[0x270FA2858]();
}

uint64_t AST.Group.Kind.lookaroundKind.getter()
{
  return MEMORY[0x270FA2860]();
}

uint64_t static AST.Group.Kind.== infix(_:_:)()
{
  return MEMORY[0x270FA2868]();
}

uint64_t type metadata accessor for AST.Group.Kind()
{
  return MEMORY[0x270FA2870]();
}

uint64_t AST.Group.kind.getter()
{
  return MEMORY[0x270FA2878]();
}

uint64_t AST.Group.child.getter()
{
  return MEMORY[0x270FA2880]();
}

uint64_t type metadata accessor for AST.Group()
{
  return MEMORY[0x270FA2888]();
}

uint64_t AST.Quote.literal.getter()
{
  return MEMORY[0x270FA2890]();
}

uint64_t type metadata accessor for AST.Quote()
{
  return MEMORY[0x270FA2898]();
}

uint64_t AST.Trivia.contents.getter()
{
  return MEMORY[0x270FA28A0]();
}

uint64_t type metadata accessor for AST.Trivia()
{
  return MEMORY[0x270FA28A8]();
}

uint64_t AST.Reference.recursesWholePattern.getter()
{
  return MEMORY[0x270FA28B0]();
}

uint64_t type metadata accessor for AST.Reference.Kind()
{
  return MEMORY[0x270FA28B8]();
}

uint64_t AST.Reference.kind.getter()
{
  return MEMORY[0x270FA28C0]();
}

uint64_t type metadata accessor for AST.Reference()
{
  return MEMORY[0x270FA28C8]();
}

uint64_t type metadata accessor for AST()
{
  return MEMORY[0x270FA28D0]();
}

uint64_t AST.init(_:globalOptions:diags:)()
{
  return MEMORY[0x270FA28D8]();
}

uint64_t parse<A>(_:_:)()
{
  return MEMORY[0x270FA28E0]();
}

uint64_t Source.Located.value.getter()
{
  return MEMORY[0x270FA28E8]();
}

uint64_t static Source.Location.fake.getter()
{
  return MEMORY[0x270FA28F0]();
}

uint64_t type metadata accessor for Source.Location()
{
  return MEMORY[0x270FA28F8]();
}

uint64_t _TreeNode.height.getter()
{
  return MEMORY[0x270FA2900]();
}

uint64_t Array.init()()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t Character.asciiValue.getter()
{
  return MEMORY[0x270F9D358]();
}

Swift::String __swiftcall Character.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D360]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t Character.isConfusable.getter()
{
  return MEMORY[0x270FA2908]();
}

uint64_t Character.isWordCharacter.getter()
{
  return MEMORY[0x270FA2910]();
}

uint64_t Character.hasExactlyOneScalar.getter()
{
  return MEMORY[0x270FA2918]();
}

uint64_t Character.isWhitespace.getter()
{
  return MEMORY[0x270F9D380]();
}

uint64_t Character._isLowercased.getter()
{
  return MEMORY[0x270F9D388]();
}

uint64_t Character._isUppercased.getter()
{
  return MEMORY[0x270F9D390]();
}

uint64_t Character._isSingleScalar.getter()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t Character.hash(into:)()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t Character.write<A>(to:)()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t Character.isNumber.getter()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t dispatch thunk of BidirectionalCollection.index(before:)()
{
  return MEMORY[0x270F9D3F8]();
}

uint64_t dispatch thunk of BidirectionalCollection.formIndex(before:)()
{
  return MEMORY[0x270F9D410]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x270F9D488]();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x270F9D490]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D4C8]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t MutableCollection.partition(by:)()
{
  return MEMORY[0x270F9D4E0]();
}

uint64_t dispatch thunk of MutableCollection.subscript.modify()
{
  return MEMORY[0x270F9D528]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String._wordIndex(after:)()
{
  return MEMORY[0x270F9D5D8]();
}

uint64_t String.isOnGraphemeClusterBoundary(_:)()
{
  return MEMORY[0x270FA2920]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

Swift::Void __swiftcall String.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t String.UnicodeScalarView._foreignIndex(after:)()
{
  return MEMORY[0x270F9D678]();
}

uint64_t String.UnicodeScalarView._foreignIndex(before:)()
{
  return MEMORY[0x270F9D680]();
}

uint64_t String.UnicodeScalarView.append(_:)()
{
  return MEMORY[0x270F9D698]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String._nfc.getter()
{
  return MEMORY[0x270F9D6F8]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x270F9D748]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x270F9D750]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9D758]();
}

uint64_t String.append(contentsOf:)()
{
  return MEMORY[0x270F9D780]();
}

uint64_t String.append<A>(contentsOf:)()
{
  return MEMORY[0x270F9D788]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

{
  MEMORY[0x270F9D798](a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x270F9D7D8]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(before:)()
{
  return MEMORY[0x270F9D7F0]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = MEMORY[0x270F9D898](repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x270F9D948]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return MEMORY[0x270F9E070]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection._failEarlyRangeCheck(_:bounds:)()
{
  return MEMORY[0x270F9E090]();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return MEMORY[0x270F9E0A8]();
}

uint64_t dispatch thunk of Collection.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9E0B0]();
}

uint64_t dispatch thunk of Collection.index(_:offsetBy:)()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t dispatch thunk of Collection.distance(from:to:)()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection.firstIndex(where:)()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
}

uint64_t Collection.prefix(_:)()
{
  return MEMORY[0x270F9E168]();
}

uint64_t Collection.dropFirst(_:)()
{
  return MEMORY[0x270F9E190]();
}

uint64_t Collection.subscript.getter()
{
  return MEMORY[0x270F9E1A8]();
}

{
  return MEMORY[0x270F9E1B0]();
}

uint64_t Collection<>.firstIndex(of:)()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t dispatch thunk of Collection.subscript.getter()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.removeSubrange(_:)()
{
  return MEMORY[0x270F9E1F8]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.append<A>(contentsOf:)()
{
  return MEMORY[0x270F9E210]();
}

uint64_t RangeReplaceableCollection.removeSubrange<A>(_:)()
{
  return MEMORY[0x270F9E258]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.init()()
{
  return MEMORY[0x270F9E2F8]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.init<A>(_:)()
{
  return MEMORY[0x270F9E300]();
}

uint64_t Range.isEmpty.getter()
{
  return MEMORY[0x270F9E318]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x270F9E330]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t Substring.index(after:)()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t Substring.index(before:)()
{
  return MEMORY[0x270F9E4A8]();
}

uint64_t Substring.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t Substring.distance(from:to:)()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t Substring.subscript.getter()
{
  return MEMORY[0x270F9E4F8]();
}

{
  return MEMORY[0x270F9E508]();
}

uint64_t Substring.init(_:)()
{
  return MEMORY[0x270F9E500]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t BinaryInteger.description.getter()
{
  return MEMORY[0x270F9E658]();
}

uint64_t ArraySlice.startIndex.getter()
{
  return MEMORY[0x270F9E6C0]();
}

Swift::Bool __swiftcall ArraySlice._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x270F9E6E0]();
}

uint64_t ArraySlice.endIndex.getter()
{
  return MEMORY[0x270F9E700]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x270F9E9A0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t static MemoryLayout.tupleElementIndex<A>(of:elementTypes:)()
{
  return MEMORY[0x270FA2928]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t _arrayForceCast<A, B>(_:)()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t type metadata accessor for IndexingIterator()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t type metadata accessor for PartialRangeFrom()
{
  return MEMORY[0x270F9EDA8]();
}

uint64_t type metadata accessor for PartialRangeUpTo()
{
  return MEMORY[0x270F9EDB0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _writeBackMutableSlice<A, B>(_:bounds:slice:)()
{
  return MEMORY[0x270F9F4D8]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t type metadata accessor for Slice()
{
  return MEMORY[0x270F9FBD8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t type metadata accessor for Unicode.NumericType()
{
  return MEMORY[0x270F9FDE0]();
}

uint64_t Unicode.POSIXProperty.rawValue.getter()
{
  return MEMORY[0x270FA2930]();
}

uint64_t type metadata accessor for Unicode.POSIXProperty()
{
  return MEMORY[0x270FA2938]();
}

uint64_t Unicode.BinaryProperty.rawValue.getter()
{
  return MEMORY[0x270FA2940]();
}

uint64_t type metadata accessor for Unicode.BinaryProperty()
{
  return MEMORY[0x270FA2948]();
}

uint64_t Unicode.ExtendedGeneralCategory.rawValue.getter()
{
  return MEMORY[0x270FA2950]();
}

uint64_t type metadata accessor for Unicode.ExtendedGeneralCategory()
{
  return MEMORY[0x270FA2958]();
}

uint64_t type metadata accessor for Unicode.Block()
{
  return MEMORY[0x270FA2960]();
}

uint64_t Unicode.Script.rawValue.getter()
{
  return MEMORY[0x270FA2968]();
}

uint64_t type metadata accessor for Unicode.Script()
{
  return MEMORY[0x270FA2970]();
}

uint64_t static Unicode.GeneralCategory.== infix(_:_:)()
{
  return MEMORY[0x270F9FDE8]();
}

uint64_t type metadata accessor for Unicode.GeneralCategory()
{
  return MEMORY[0x270F9FDF0]();
}

uint64_t static Unicode.CanonicalCombiningClass.== infix(_:_:)()
{
  return MEMORY[0x270F9FE20]();
}

uint64_t type metadata accessor for Unicode.CanonicalCombiningClass()
{
  return MEMORY[0x270F9FE30]();
}

uint64_t Unicode._NFC.makeIterator()()
{
  return MEMORY[0x270F9FE38]();
}

uint64_t Unicode._NFC.Iterator.next()()
{
  return MEMORY[0x270F9FE40]();
}

uint64_t type metadata accessor for Unicode._NFC.Iterator()
{
  return MEMORY[0x270F9FE48]();
}

uint64_t type metadata accessor for Unicode._NFC()
{
  return MEMORY[0x270F9FE50]();
}

uint64_t Unicode.Scalar.Properties.isHexDigit.getter()
{
  return MEMORY[0x270F9FE58]();
}

uint64_t Unicode.Scalar.Properties.numericType.getter()
{
  return MEMORY[0x270F9FE78]();
}

uint64_t Unicode.Scalar.Properties.isAlphabetic.getter()
{
  return MEMORY[0x270F9FE80]();
}

uint64_t Unicode.Scalar.Properties.isWhitespace.getter()
{
  return MEMORY[0x270F9FE88]();
}

uint64_t Unicode.Scalar.Properties.numericValue.getter()
{
  return MEMORY[0x270F9FE90]();
}

uint64_t Unicode.Scalar.Properties.isJoinControl.getter()
{
  return MEMORY[0x270F9FE98]();
}

uint64_t Unicode.Scalar.Properties.generalCategory.getter()
{
  return MEMORY[0x270F9FEA0]();
}

uint64_t Unicode.Scalar.Properties.isASCIIHexDigit.getter()
{
  return MEMORY[0x270F9FEA8]();
}

uint64_t Unicode.Scalar.Properties.lowercaseMapping.getter()
{
  return MEMORY[0x270F9FEB8]();
}

uint64_t Unicode.Scalar.Properties.uppercaseMapping.getter()
{
  return MEMORY[0x270F9FEC0]();
}

uint64_t Unicode.Scalar.Properties.changesWhenLowercased.getter()
{
  return MEMORY[0x270F9FEE8]();
}

uint64_t Unicode.Scalar.Properties.changesWhenUppercased.getter()
{
  return MEMORY[0x270F9FEF0]();
}

uint64_t Unicode.Scalar.Properties.canonicalCombiningClass.getter()
{
  return MEMORY[0x270F9FEF8]();
}

uint64_t Unicode.Scalar.Properties.age.getter()
{
  return MEMORY[0x270F9FF00]();
}

uint64_t Unicode.Scalar.Properties.name.getter()
{
  return MEMORY[0x270F9FF08]();
}

uint64_t Unicode.Scalar.Properties.isDash.getter()
{
  return MEMORY[0x270F9FF10]();
}

uint64_t Unicode.Scalar.Properties.isCased.getter()
{
  return MEMORY[0x270F9FF18]();
}

uint64_t Unicode.Scalar.Properties.nameAlias.getter()
{
  return MEMORY[0x270F9FF28]();
}

uint64_t type metadata accessor for Unicode.Scalar.Properties()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t Unicode.Scalar.properties.getter()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t Unicode.Scalar.write<A>(to:)()
{
  return MEMORY[0x270F9FF40]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x270FA0328]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}