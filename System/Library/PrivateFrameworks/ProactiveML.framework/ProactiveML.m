void sub_2212A3398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2212A3778(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2212A3CF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingEvaluationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_41;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_43:
        *(void *)(a1 + 8) = v19;
        goto LABEL_44;
      case 2u:
        v24 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v24, a2)) {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 3u:
        v24 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 4u:
        v24 = objc_alloc_init(AWDProactiveModelFittingEvalMetrics);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 5u:
        v24 = objc_alloc_init(AWDProactiveModelFittingPrecisionAtKPair);
        [(id)a1 addPrecisionAtK:v24];
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingPrecisionAtKPairReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_46:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_44;
    }
  }
}

uint64_t AWDProactiveModelFittingLogRegWeightsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 72) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_53;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_55:
        *(void *)(a1 + 8) = v20;
        goto LABEL_61;
      case 2u:
        v26 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v26, a2)) {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 3u:
        v26 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 4u:
        v26 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 5u:
        v26 = objc_alloc_init(AWDProactiveModelFittingEvalMetrics);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 6u:
        v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseVector);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 7u:
        *(unsigned char *)(a1 + 72) |= 4u;
        uint64_t v27 = *v3;
        unint64_t v28 = *(void *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v32 = 68;
        goto LABEL_60;
      case 8u:
        *(unsigned char *)(a1 + 72) |= 2u;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v32 = 64;
LABEL_60:
        *(_DWORD *)(a1 + v32) = v29;
        goto LABEL_61;
      case 9u:
        v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedDenseVector);
        objc_storeStrong((id *)(a1 + 16), v26);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedDenseVectorReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_51:
          PBReaderRecallMark();

LABEL_61:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_63:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_61;
    }
  }
}

void sub_2212A8158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__315(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__316(uint64_t a1)
{
}

uint64_t AWDProactiveModelFittingLinRegObjectiveFeaturesReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_47;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_49;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_49:
        *(void *)(a1 + 8) = v20;
        goto LABEL_55;
      case 2u:
        v25 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 32), v25);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v25, a2)) {
          goto LABEL_57;
        }
        goto LABEL_39;
      case 3u:
        v25 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 40), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_39;
      case 4u:
        v25 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 24), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_39;
      case 6u:
        v25 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseVector);
        objc_storeStrong((id *)(a1 + 48), v25);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)v25, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_55:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_57:

        return 0;
      case 7u:
        *(unsigned char *)(a1 + 56) |= 4u;
        uint64_t v27 = *v3;
        unint64_t v28 = *(void *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v32 = 20;
        goto LABEL_54;
      case 8u:
        *(unsigned char *)(a1 + 56) |= 2u;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v32 = 16;
LABEL_54:
        *(_DWORD *)(a1 + v32) = v29;
        goto LABEL_55;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_55;
    }
  }
}

uint64_t AWDProactiveModelFittingQuantizedSparseVectorReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v17 = v10 & 7;
    if (v16 || v17 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        if (v17 != 2)
        {
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          while (1)
          {
            uint64_t v49 = *v3;
            uint64_t v50 = *(void *)(a2 + v49);
            unint64_t v51 = v50 + 1;
            if (v50 == -1 || v51 > *(void *)(a2 + *v4)) {
              break;
            }
            char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
            *(void *)(a2 + v49) = v51;
            v48 |= (unint64_t)(v52 & 0x7F) << v46;
            if (v52 < 0)
            {
              v46 += 7;
              BOOL v15 = v47++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_80;
          }
LABEL_79:
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_80:
          PBRepeatedUInt32Add();
LABEL_86:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        uint64_t result = PBReaderPlaceMark();
        if (result)
        {
          while (1)
          {
            if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4) || *(unsigned char *)(a2 + *v5)) {
              goto LABEL_60;
            }
            char v20 = 0;
            unsigned int v21 = 0;
            uint64_t v22 = 0;
            while (1)
            {
              uint64_t v23 = *v3;
              uint64_t v24 = *(void *)(a2 + v23);
              unint64_t v25 = v24 + 1;
              if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
                break;
              }
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_31;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedUInt32Add();
          }
        }
        return result;
      case 2u:
        if (v17 != 2)
        {
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          while (1)
          {
            uint64_t v56 = *v3;
            uint64_t v57 = *(void *)(a2 + v56);
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)(a2 + *v4)) {
              goto LABEL_79;
            }
            char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v58;
            v55 |= (unint64_t)(v59 & 0x7F) << v53;
            if (v59 < 0)
            {
              v53 += 7;
              BOOL v15 = v54++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_80;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (1)
          {
            uint64_t v30 = *v3;
            uint64_t v31 = *(void *)(a2 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              BOOL v15 = v28++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_46;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          PBRepeatedUInt32Add();
        }
LABEL_60:
        PBReaderRecallMark();
        goto LABEL_86;
      case 3u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(unsigned char *)(a1 + 68) |= 2u;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              BOOL v15 = v35++ >= 9;
              if (v15)
              {
                LODWORD(v36) = 0;
                goto LABEL_64;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v36) = 0;
        }
LABEL_64:
        *(_DWORD *)(a1 + 60) = v36;
        goto LABEL_86;
      case 4u:
        *(unsigned char *)(a1 + 68) |= 4u;
        uint64_t v41 = *v3;
        unint64_t v42 = *(void *)(a2 + v41);
        if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(void *)(a2 + *v4))
        {
          int v43 = *(_DWORD *)(*(void *)(a2 + *v7) + v42);
          *(void *)(a2 + v41) = v42 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v43 = 0;
        }
        uint64_t v60 = 64;
        goto LABEL_85;
      case 5u:
        *(unsigned char *)(a1 + 68) |= 1u;
        uint64_t v44 = *v3;
        unint64_t v45 = *(void *)(a2 + v44);
        if (v45 <= 0xFFFFFFFFFFFFFFFBLL && v45 + 4 <= *(void *)(a2 + *v4))
        {
          int v43 = *(_DWORD *)(*(void *)(a2 + *v7) + v45);
          *(void *)(a2 + v44) = v45 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v43 = 0;
        }
        uint64_t v60 = 56;
LABEL_85:
        *(_DWORD *)(a1 + v60) = v43;
        goto LABEL_86;
      default:
        if (PBReaderSkipValueWithTag()) {
          goto LABEL_86;
        }
        return 0;
    }
  }
}

BOOL AWDProactiveModelFittingModelInfoStatsPairReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        int v17 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v17, a2)) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    int v17 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark()
      || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_2212ACF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__716(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__717(uint64_t a1)
{
}

uint64_t AWDProactiveModelFittingLinRegFeatureMatrixReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_47;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_49;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_49:
        *(void *)(a1 + 8) = v20;
        goto LABEL_55;
      case 2u:
        unint64_t v25 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 32), v25);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v25, a2)) {
          goto LABEL_57;
        }
        goto LABEL_37;
      case 3u:
        unint64_t v25 = objc_alloc_init(AWDProactiveModelFittingSparseFloatMatrix);
        objc_storeStrong((id *)(a1 + 40), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatMatrixReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_37;
      case 4u:
        unint64_t v25 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 24), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_37;
      case 5u:
        unint64_t v25 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseMatrix);
        objc_storeStrong((id *)(a1 + 48), v25);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedSparseMatrixReadFrom((uint64_t)v25, a2) & 1) != 0)
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_55:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_57:

        return 0;
      case 8u:
        *(unsigned char *)(a1 + 56) |= 4u;
        uint64_t v27 = *v3;
        unint64_t v28 = *(void *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v32 = 20;
        goto LABEL_54;
      case 9u:
        *(unsigned char *)(a1 + 56) |= 2u;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(void *)(a2 + *v4))
        {
          int v29 = *(_DWORD *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v29 = 0;
        }
        uint64_t v32 = 16;
LABEL_54:
        *(_DWORD *)(a1 + v32) = v29;
        goto LABEL_55;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_55;
    }
  }
}

uint64_t AWDProactiveModelFittingSparseFloatVectorReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v18 = v10 & 7;
      if (v17 || v18 == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v20 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 64) |= 1u;
        while (1)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4)) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v34;
          v31 |= (unint64_t)(v35 & 0x7F) << v29;
          if ((v35 & 0x80) == 0) {
            goto LABEL_54;
          }
          v29 += 7;
          BOOL v15 = v30++ >= 9;
          if (v15)
          {
            uint64_t v31 = 0;
            goto LABEL_56;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_56:
        *(void *)(a1 + 56) = v31;
        goto LABEL_71;
      }
      if (v20 == 2) {
        break;
      }
      if (v20 == 1)
      {
        if (v18 != 2)
        {
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          while (1)
          {
            uint64_t v43 = *v3;
            uint64_t v44 = *(void *)(a2 + v43);
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)(a2 + *v4)) {
              break;
            }
            char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
            *(void *)(a2 + v43) = v45;
            v42 |= (unint64_t)(v46 & 0x7F) << v40;
            if (v46 < 0)
            {
              v40 += 7;
              BOOL v15 = v41++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_68;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_68:
          PBRepeatedUInt64Add();
          goto LABEL_71;
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            uint64_t v25 = *v3;
            uint64_t v26 = *(void *)(a2 + v25);
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
              break;
            }
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              BOOL v15 = v23++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_33;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
          PBRepeatedUInt64Add();
        }
LABEL_52:
        PBReaderRecallMark();
        goto LABEL_71;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_71:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    if (v18 != 2)
    {
      uint64_t v47 = *v3;
      unint64_t v48 = *(void *)(a2 + v47);
      if (v48 <= 0xFFFFFFFFFFFFFFFBLL && v48 + 4 <= *(void *)(a2 + *v4)) {
        *(void *)(a2 + v47) = v48 + 4;
      }
      else {
        *(unsigned char *)(a2 + v16) = 1;
      }
      PBRepeatedFloatAdd();
      goto LABEL_71;
    }
    uint64_t result = PBReaderPlaceMark();
    if (!result) {
      return result;
    }
    while (1)
    {
      uint64_t v36 = (unint64_t *)(a2 + *v3);
      unint64_t v37 = *v36;
      unint64_t v38 = *(void *)(a2 + *v4);
      if (*v36 >= v38) {
        break;
      }
      uint64_t v39 = *v5;
      if (*(unsigned char *)(a2 + v39)) {
        break;
      }
      if (v37 > 0xFFFFFFFFFFFFFFFBLL || v37 + 4 > v38) {
        *(unsigned char *)(a2 + v39) = 1;
      }
      else {
        *uint64_t v36 = v37 + 4;
      }
      PBRepeatedFloatAdd();
    }
    goto LABEL_52;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_2212B06B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212B0B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1067(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1068(uint64_t a1)
{
}

void sub_2212B151C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212B18B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212B2350(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2212B2514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212B3450(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2212B40AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_2212B49F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2212B4F58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2212B5830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_2212B61C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_2212B6DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_2212B721C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212B7628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingSparseFloatMatrixReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    uint64_t v16 = *v5;
    int v17 = *(unsigned __int8 *)(a2 + v16);
    if (*(unsigned char *)(a2 + v16)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v18 = v10 & 7;
    if (v17 || v18 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        if (v18 != 2)
        {
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          while (1)
          {
            uint64_t v56 = *v3;
            uint64_t v57 = *(void *)(a2 + v56);
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)(a2 + *v4)) {
              break;
            }
            char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v58;
            v55 |= (unint64_t)(v59 & 0x7F) << v53;
            if (v59 < 0)
            {
              v53 += 7;
              BOOL v15 = v54++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_95;
          }
LABEL_94:
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_95:
          PBRepeatedUInt64Add();
LABEL_101:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        uint64_t result = PBReaderPlaceMark();
        if (result)
        {
          while (1)
          {
            if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4) || *(unsigned char *)(a2 + *v5)) {
              goto LABEL_70;
            }
            char v21 = 0;
            unsigned int v22 = 0;
            uint64_t v23 = 0;
            while (1)
            {
              uint64_t v24 = *v3;
              uint64_t v25 = *(void *)(a2 + v24);
              unint64_t v26 = v25 + 1;
              if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
                break;
              }
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_31;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedUInt64Add();
          }
        }
        return result;
      case 2u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 96) |= 1u;
        while (2)
        {
          uint64_t v31 = *v3;
          uint64_t v32 = *(void *)(a2 + v31);
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                uint64_t v30 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_74:
        uint64_t v52 = 80;
        goto LABEL_79;
      case 3u:
        if (v18 != 2)
        {
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v62 = 0;
          while (1)
          {
            uint64_t v63 = *v3;
            uint64_t v64 = *(void *)(a2 + v63);
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)(a2 + *v4)) {
              goto LABEL_94;
            }
            char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v64);
            *(void *)(a2 + v63) = v65;
            v62 |= (unint64_t)(v66 & 0x7F) << v60;
            if (v66 < 0)
            {
              v60 += 7;
              BOOL v15 = v61++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_95;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            uint64_t v38 = *v3;
            uint64_t v39 = *(void *)(a2 + v38);
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)(a2 + *v4)) {
              break;
            }
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              BOOL v15 = v36++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_53;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          PBRepeatedUInt64Add();
        }
        goto LABEL_70;
      case 4u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 96) |= 2u;
        while (2)
        {
          uint64_t v44 = *v3;
          uint64_t v45 = *(void *)(a2 + v44);
          unint64_t v46 = v45 + 1;
          if (v45 == -1 || v46 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v46;
            v30 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              BOOL v15 = v43++ >= 9;
              if (v15)
              {
                uint64_t v30 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_78:
        uint64_t v52 = 88;
LABEL_79:
        *(void *)(a1 + v52) = v30;
        goto LABEL_101;
      case 5u:
        if (v18 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            unint64_t v48 = (unint64_t *)(a2 + *v3);
            unint64_t v49 = *v48;
            unint64_t v50 = *(void *)(a2 + *v4);
            if (*v48 >= v50) {
              break;
            }
            uint64_t v51 = *v5;
            if (*(unsigned char *)(a2 + v51)) {
              break;
            }
            if (v49 > 0xFFFFFFFFFFFFFFFBLL || v49 + 4 > v50) {
              *(unsigned char *)(a2 + v51) = 1;
            }
            else {
              *unint64_t v48 = v49 + 4;
            }
            PBRepeatedFloatAdd();
          }
LABEL_70:
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v67 = *v3;
          unint64_t v68 = *(void *)(a2 + v67);
          if (v68 <= 0xFFFFFFFFFFFFFFFBLL && v68 + 4 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v67) = v68 + 4;
          }
          else {
            *(unsigned char *)(a2 + v16) = 1;
          }
          PBRepeatedFloatAdd();
        }
        goto LABEL_101;
      default:
        if (PBReaderSkipValueWithTag()) {
          goto LABEL_101;
        }
        return 0;
    }
  }
}

uint64_t AWDProactiveModelFittingQuantizedSparseMatrixReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v17 = v10 & 7;
    if (v16 || v17 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        if (v17 != 2)
        {
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v62 = 0;
          while (1)
          {
            uint64_t v63 = *v3;
            uint64_t v64 = *(void *)(a2 + v63);
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)(a2 + *v4)) {
              break;
            }
            char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v64);
            *(void *)(a2 + v63) = v65;
            v62 |= (unint64_t)(v66 & 0x7F) << v60;
            if (v66 < 0)
            {
              v60 += 7;
              BOOL v15 = v61++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_112;
          }
LABEL_111:
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_112:
          PBRepeatedUInt32Add();
LABEL_118:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        uint64_t result = PBReaderPlaceMark();
        if (result)
        {
          while (1)
          {
            if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4) || *(unsigned char *)(a2 + *v5)) {
              goto LABEL_74;
            }
            char v20 = 0;
            unsigned int v21 = 0;
            uint64_t v22 = 0;
            while (1)
            {
              uint64_t v23 = *v3;
              uint64_t v24 = *(void *)(a2 + v23);
              unint64_t v25 = v24 + 1;
              if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
                break;
              }
              char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_31;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedUInt32Add();
          }
        }
        return result;
      case 2u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 96) |= 2u;
        while (2)
        {
          uint64_t v30 = *v3;
          uint64_t v31 = *(void *)(a2 + v30);
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              BOOL v15 = v28++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_84:
        uint64_t v59 = 84;
        goto LABEL_89;
      case 3u:
        if (v17 != 2)
        {
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v69 = 0;
          while (1)
          {
            uint64_t v70 = *v3;
            uint64_t v71 = *(void *)(a2 + v70);
            unint64_t v72 = v71 + 1;
            if (v71 == -1 || v72 > *(void *)(a2 + *v4)) {
              goto LABEL_111;
            }
            char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v71);
            *(void *)(a2 + v70) = v72;
            v69 |= (unint64_t)(v73 & 0x7F) << v67;
            if (v73 < 0)
            {
              v67 += 7;
              BOOL v15 = v68++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_112;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          while (1)
          {
            uint64_t v37 = *v3;
            uint64_t v38 = *(void *)(a2 + v37);
            unint64_t v39 = v38 + 1;
            if (v38 == -1 || v39 > *(void *)(a2 + *v4)) {
              break;
            }
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              BOOL v15 = v35++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_53;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          PBRepeatedUInt32Add();
        }
        goto LABEL_74;
      case 4u:
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 96) |= 8u;
        while (2)
        {
          uint64_t v43 = *v3;
          uint64_t v44 = *(void *)(a2 + v43);
          unint64_t v45 = v44 + 1;
          if (v44 == -1 || v45 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
            *(void *)(a2 + v43) = v45;
            v29 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              BOOL v15 = v42++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v29) = 0;
        }
LABEL_88:
        uint64_t v59 = 92;
LABEL_89:
        *(_DWORD *)(a1 + v59) = v29;
        goto LABEL_118;
      case 5u:
        if (v17 != 2)
        {
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v76 = 0;
          while (1)
          {
            uint64_t v77 = *v3;
            uint64_t v78 = *(void *)(a2 + v77);
            unint64_t v79 = v78 + 1;
            if (v78 == -1 || v79 > *(void *)(a2 + *v4)) {
              goto LABEL_111;
            }
            char v80 = *(unsigned char *)(*(void *)(a2 + *v7) + v78);
            *(void *)(a2 + v77) = v79;
            v76 |= (unint64_t)(v80 & 0x7F) << v74;
            if (v80 < 0)
            {
              v74 += 7;
              BOOL v15 = v75++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_112;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          while (1)
          {
            uint64_t v50 = *v3;
            uint64_t v51 = *(void *)(a2 + v50);
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)(a2 + *v4)) {
              break;
            }
            char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
            *(void *)(a2 + v50) = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              BOOL v15 = v48++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_73;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_73:
          PBRepeatedUInt32Add();
        }
LABEL_74:
        PBReaderRecallMark();
        goto LABEL_118;
      case 6u:
        *(unsigned char *)(a1 + 96) |= 4u;
        uint64_t v54 = *v3;
        unint64_t v55 = *(void *)(a2 + v54);
        if (v55 <= 0xFFFFFFFFFFFFFFFBLL && v55 + 4 <= *(void *)(a2 + *v4))
        {
          int v56 = *(_DWORD *)(*(void *)(a2 + *v7) + v55);
          *(void *)(a2 + v54) = v55 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v56 = 0;
        }
        uint64_t v81 = 88;
        goto LABEL_117;
      case 7u:
        *(unsigned char *)(a1 + 96) |= 1u;
        uint64_t v57 = *v3;
        unint64_t v58 = *(void *)(a2 + v57);
        if (v58 <= 0xFFFFFFFFFFFFFFFBLL && v58 + 4 <= *(void *)(a2 + *v4))
        {
          int v56 = *(_DWORD *)(*(void *)(a2 + *v7) + v58);
          *(void *)(a2 + v57) = v58 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v56 = 0;
        }
        uint64_t v81 = 80;
LABEL_117:
        *(_DWORD *)(a1 + v81) = v56;
        goto LABEL_118;
      default:
        if (PBReaderSkipValueWithTag()) {
          goto LABEL_118;
        }
        return 0;
    }
  }
}

uint64_t internChunk(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 count];
  [v3 addObject:v4];

  v6 = NSNumber;
  return [v6 numberWithUnsignedInteger:v5];
}

id arrayFromFloats(int *a1, int a2)
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a2];
  if (a2 >= 1)
  {
    uint64_t v6 = a2;
    do
    {
      int v7 = *a1++;
      LODWORD(v5) = v7;
      char v8 = [NSNumber numberWithFloat:v5];
      [v4 addObject:v8];

      --v6;
    }
    while (v6);
  }
  return v4;
}

id PMLBuildChunkFile(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  id v3 = [v1 toPlistWithChunks:v2];

  if (v3)
  {
    id v4 = +[PMLDataChunkPlist chunkWithPlist:v3];
    if (v4) {
      [v2 addObject:v4];
    }
  }
  double v5 = +[PMLDataChunk serializeChunks:v2];

  return v5;
}

void PMLWriteChunkFile(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  id v4 = (void *)MEMORY[0x223C7E5C0]();
  double v5 = PMLBuildChunkFile(v6);
  [v5 writeToFile:v3 atomically:1];
}

id PMLReadChunkFile(uint64_t a1, objc_class *a2, void *a3)
{
  id v5 = a3;
  id v6 = +[PMLDataChunk chunksFromFileAtPath:a1];
  int v7 = loadChunkFileChunks(v6, a2, v5);

  return v7;
}

id loadChunkFileChunks(void *a1, objc_class *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  int v7 = [v5 lastObject];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v8 = [v7 plist];
    if (v8) {
      unsigned int v9 = (void *)[[a2 alloc] initWithPlist:v8 chunks:v5 context:v6];
    }
    else {
      unsigned int v9 = 0;
    }
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

id PMLReadChunkData(uint64_t a1, objc_class *a2, void *a3)
{
  id v5 = a3;
  id v6 = +[PMLDataChunk chunksFromData:a1];
  int v7 = loadChunkFileChunks(v6, a2, v5);

  return v7;
}

void sub_2212BE7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t ixvalCompareIndex(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

char *appendIxval(unint64_t *a1, uint64_t a2, float a3)
{
  unint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  if (*a1 >= v7)
  {
    unint64_t v9 = v7 + (v7 >> 1);
    if (v9 <= 8) {
      unint64_t v9 = 8;
    }
    a1[1] = v9;
    uint64_t result = (char *)reallocf((void *)a1[2], 16 * v9);
    a1[2] = (unint64_t)result;
    unint64_t v6 = *a1;
  }
  else
  {
    uint64_t result = (char *)a1[2];
  }
  *a1 = v6 + 1;
  unint64_t v10 = (float *)&result[16 * v6];
  *(void *)unint64_t v10 = a2;
  v10[2] = a3;
  return result;
}

void sub_2212BEC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212BEE74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2212BF398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL AWDProactiveModelFittingModelInfoReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_24:
        char v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void migrateSessionsToFloats(uint64_t a1, void *a2)
{
  id v2 = a2;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __migrateSessionsToFloats_block_invoke;
  v4[3] = &unk_26459F1E0;
  id v5 = v2;
  id v3 = v2;
  [v3 prepAndRunQuery:@"SELECT id, covariatesValues FROM sessions", 0, v4, &__block_literal_global_398 onPrep onRow onError];
}

uint64_t __migrateSessionsToFloats_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v19 = [v3 getInt64ForColumn:0];
  id v4 = [v3 getNSDataForColumn:1];
  id v5 = (double *)[v4 bytes];
  unint64_t v6 = [v4 length];
  unint64_t v7 = (float *)malloc_type_malloc(4 * (v6 >> 3), 0x100004052888210uLL);
  if (v6 >= 8)
  {
    if (v6 >> 3 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v6 >> 3;
    }
    unsigned int v9 = v7;
    do
    {
      double v10 = *v5++;
      float v11 = v10;
      *v9++ = v11;
      --v8;
    }
    while (v8);
  }
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__2115;
  v16[4] = __Block_byref_object_dispose__2116;
  id v17 = 0;
  id v17 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v7 length:4 * (v6 >> 3) freeWhenDone:1];
  unint64_t v12 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __migrateSessionsToFloats_block_invoke_389;
  v15[3] = &unk_26459F178;
  v15[4] = v16;
  v15[5] = v18;
  [v12 prepAndRunQuery:@"UPDATE sessions SET covariatesValues = :data WHERE id = :rowId" onPrep:v15 onRow:&__block_literal_global_2117 onError:&__block_literal_global_396];
  char v13 = (unsigned __int8 *)MEMORY[0x263F61EC8];
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  return *v13;
}

void sub_2212C125C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __migrateSessionsToFloats_block_invoke_4()
{
  return *MEMORY[0x263F61ED0];
}

uint64_t __Block_byref_object_copy__2115(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2116(uint64_t a1)
{
}

void __migrateSessionsToFloats_block_invoke_389(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  [v4 bindNamedParam:":data" toNSData:v3];
  [v4 bindNamedParam:":rowId" toInt64:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __migrateSessionsToFloats_block_invoke_3()
{
  return *MEMORY[0x263F61ED0];
}

uint64_t __migrateSessionsToFloats_block_invoke_2()
{
  return *MEMORY[0x263F61EC8];
}

void sub_2212C1764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingEvalMetricsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unint64_t v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v15 = v9++ >= 9;
          if (v15)
          {
            unint64_t v10 = 0;
            uint64_t v16 = *v5;
            int v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(unsigned char *)(a2 + v16)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              *(unsigned char *)(a1 + 100) |= 0x20u;
              uint64_t v20 = *v3;
              unint64_t v21 = *(void *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v21);
                *(void *)(a2 + v20) = v21 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v63 = 92;
              goto LABEL_103;
            case 2u:
              *(unsigned char *)(a1 + 100) |= 0x10u;
              uint64_t v23 = *v3;
              unint64_t v24 = *(void *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v63 = 88;
              goto LABEL_103;
            case 3u:
              char v25 = 0;
              unsigned int v26 = 0;
              uint64_t v27 = 0;
              *(unsigned char *)(a1 + 100) |= 8u;
              while (2)
              {
                uint64_t v28 = *v3;
                uint64_t v29 = *(void *)(a2 + v28);
                unint64_t v30 = v29 + 1;
                if (v29 == -1 || v30 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
                  *(void *)(a2 + v28) = v30;
                  v27 |= (unint64_t)(v31 & 0x7F) << v25;
                  if (v31 < 0)
                  {
                    v25 += 7;
                    BOOL v15 = v26++ >= 9;
                    if (v15)
                    {
                      uint64_t v27 = 0;
                      goto LABEL_80;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v27 = 0;
              }
LABEL_80:
              uint64_t v60 = 80;
              goto LABEL_93;
            case 4u:
              char v32 = 0;
              unsigned int v33 = 0;
              uint64_t v27 = 0;
              *(unsigned char *)(a1 + 100) |= 4u;
              while (2)
              {
                uint64_t v34 = *v3;
                uint64_t v35 = *(void *)(a2 + v34);
                unint64_t v36 = v35 + 1;
                if (v35 == -1 || v36 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
                  *(void *)(a2 + v34) = v36;
                  v27 |= (unint64_t)(v37 & 0x7F) << v32;
                  if (v37 < 0)
                  {
                    v32 += 7;
                    BOOL v15 = v33++ >= 9;
                    if (v15)
                    {
                      uint64_t v27 = 0;
                      goto LABEL_84;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v27 = 0;
              }
LABEL_84:
              uint64_t v60 = 72;
              goto LABEL_93;
            case 5u:
              char v38 = 0;
              unsigned int v39 = 0;
              uint64_t v27 = 0;
              *(unsigned char *)(a1 + 100) |= 2u;
              while (2)
              {
                uint64_t v40 = *v3;
                uint64_t v41 = *(void *)(a2 + v40);
                unint64_t v42 = v41 + 1;
                if (v41 == -1 || v42 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
                  *(void *)(a2 + v40) = v42;
                  v27 |= (unint64_t)(v43 & 0x7F) << v38;
                  if (v43 < 0)
                  {
                    v38 += 7;
                    BOOL v15 = v39++ >= 9;
                    if (v15)
                    {
                      uint64_t v27 = 0;
                      goto LABEL_88;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v27 = 0;
              }
LABEL_88:
              uint64_t v60 = 64;
              goto LABEL_93;
            case 6u:
              char v44 = 0;
              unsigned int v45 = 0;
              uint64_t v27 = 0;
              *(unsigned char *)(a1 + 100) |= 1u;
              while (2)
              {
                uint64_t v46 = *v3;
                uint64_t v47 = *(void *)(a2 + v46);
                unint64_t v48 = v47 + 1;
                if (v47 == -1 || v48 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
                  *(void *)(a2 + v46) = v48;
                  v27 |= (unint64_t)(v49 & 0x7F) << v44;
                  if (v49 < 0)
                  {
                    v44 += 7;
                    BOOL v15 = v45++ >= 9;
                    if (v15)
                    {
                      uint64_t v27 = 0;
                      goto LABEL_92;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v27 = 0;
              }
LABEL_92:
              uint64_t v60 = 56;
LABEL_93:
              *(void *)(a1 + v60) = v27;
              goto LABEL_106;
            case 7u:
              if (v18 != 2) {
                goto LABEL_94;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                uint64_t v50 = (unint64_t *)(a2 + *v3);
                unint64_t v51 = *v50;
                unint64_t v52 = *(void *)(a2 + *v4);
                if (*v50 >= v52) {
                  break;
                }
                uint64_t v53 = *v5;
                if (*(unsigned char *)(a2 + v53)) {
                  break;
                }
                if (v51 > 0xFFFFFFFFFFFFFFFBLL || v51 + 4 > v52) {
                  *(unsigned char *)(a2 + v53) = 1;
                }
                else {
                  *uint64_t v50 = v51 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_76;
            case 8u:
              if (v18 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (1)
                {
                  uint64_t v54 = (unint64_t *)(a2 + *v3);
                  unint64_t v55 = *v54;
                  unint64_t v56 = *(void *)(a2 + *v4);
                  if (*v54 >= v56) {
                    break;
                  }
                  uint64_t v57 = *v5;
                  if (*(unsigned char *)(a2 + v57)) {
                    break;
                  }
                  if (v55 > 0xFFFFFFFFFFFFFFFBLL || v55 + 4 > v56) {
                    *(unsigned char *)(a2 + v57) = 1;
                  }
                  else {
                    *uint64_t v54 = v55 + 4;
                  }
                  PBRepeatedFloatAdd();
                }
LABEL_76:
                PBReaderRecallMark();
              }
              else
              {
LABEL_94:
                uint64_t v61 = *v3;
                unint64_t v62 = *(void *)(a2 + v61);
                if (v62 <= 0xFFFFFFFFFFFFFFFBLL && v62 + 4 <= *(void *)(a2 + *v4)) {
                  *(void *)(a2 + v61) = v62 + 4;
                }
                else {
                  *(unsigned char *)(a2 + v16) = 1;
                }
                PBRepeatedFloatAdd();
              }
LABEL_106:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            case 9u:
              *(unsigned char *)(a1 + 100) |= 0x40u;
              uint64_t v58 = *v3;
              unint64_t v59 = *(void *)(a2 + v58);
              if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(void *)(a2 + *v4))
              {
                int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v59);
                *(void *)(a2 + v58) = v59 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v22 = 0;
              }
              uint64_t v63 = 96;
LABEL_103:
              *(_DWORD *)(a1 + v63) = v22;
              goto LABEL_106;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_106;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_2212C4700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPFLPrivatizeSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __PrivateFederatedLearningLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_26459F288;
    uint64_t v7 = 0;
    PrivateFederatedLearningLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)PrivateFederatedLearningLibraryCore_frameworkLibrary;
  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *PrivateFederatedLearningLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PMLSeparatedDPNoiseStrategy.m", 18, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "PFLPrivatize");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getPFLPrivatizeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __PrivateFederatedLearningLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PrivateFederatedLearningLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2212C4E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212C4EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212C75C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 160), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2942(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2943(uint64_t a1)
{
}

void sub_2212C8C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2212C90F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingSessionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 4u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_52;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_54;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_54:
        uint64_t v42 = 24;
        goto LABEL_63;
      case 2u:
        unsigned int v26 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v26, a2)) {
          goto LABEL_68;
        }
        goto LABEL_40;
      case 3u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (2)
        {
          uint64_t v29 = *v3;
          uint64_t v30 = *(void *)(a2 + v29);
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v15 = v28++ >= 9;
              if (v15)
              {
                uint64_t v20 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_58:
        uint64_t v42 = 8;
        goto LABEL_63;
      case 4u:
        unsigned int v26 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_40:
          PBReaderRecallMark();

LABEL_66:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_68:

        return 0;
      case 5u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 2u;
        while (2)
        {
          uint64_t v35 = *v3;
          uint64_t v36 = *(void *)(a2 + v35);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v37;
            v20 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v15 = v34++ >= 9;
              if (v15)
              {
                uint64_t v20 = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_62:
        uint64_t v42 = 16;
LABEL_63:
        *(void *)(a1 + v42) = v20;
        goto LABEL_66;
      case 6u:
        *(unsigned char *)(a1 + 56) |= 8u;
        uint64_t v39 = *v3;
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(void *)(a2 + *v4))
        {
          int v41 = *(_DWORD *)(*(void *)(a2 + *v7) + v40);
          *(void *)(a2 + v39) = v40 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v41 = 0;
        }
        *(_DWORD *)(a1 + 32) = v41;
        goto LABEL_66;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_66;
    }
  }
}

uint64_t AWDProactiveModelFittingLabelSupportPairReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 20) |= 2u;
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(void *)(a2 + *v4))
        {
          int v27 = *(_DWORD *)(*(void *)(a2 + *v7) + v26);
          *(void *)(a2 + v25) = v26 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v27 = 0;
        }
        *(_DWORD *)(a1 + 16) = v27;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_35:
        *(void *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DescribeTensorDescriptor(uint64_t a1)
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  uint64_t v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"Printing tensor information for %s", a1);
  [v2 addObject:v3];

  unsigned __int8 v110 = 0;
  if (e5rt_tensor_desc_dtype_get_num_components())
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v106 objects:v119 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v107;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v107 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v106 + 1) + 8 * v8);
          unint64_t v10 = PML_LogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v118 = v9;
            _os_log_fault_impl(&dword_2212A0000, v10, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v106 objects:v119 count:16];
      }
      while (v6);
    }

    uint64_t last_error_message = e5rt_get_last_error_message();
    uint64_t v12 = PML_LogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v118 = last_error_message;
LABEL_69:
    _os_log_fault_impl(&dword_2212A0000, v12, OS_LOG_TYPE_FAULT, "E5RT operation failed with message = %s", buf, 0xCu);
LABEL_70:

    uint64_t v52 = 0xFFFFFFFFLL;
    goto LABEL_71;
  }
  unint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Num components per element = %u", v110);
  [v2 addObject:v13];

  unsigned int v105 = 0;
  if (e5rt_tensor_desc_dtype_get_component_dtype())
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v14 = v2;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v101 objects:v116 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v102;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v102 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v101 + 1) + 8 * v18);
          uint64_t v20 = PML_LogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v118 = v19;
            _os_log_fault_impl(&dword_2212A0000, v20, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v101 objects:v116 count:16];
      }
      while (v16);
    }

    uint64_t v21 = e5rt_get_last_error_message();
    uint64_t v12 = PML_LogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v118 = v21;
    goto LABEL_69;
  }
  switch(v105)
  {
    case 0u:
      uint64_t v22 = @"Component data type is UINT";
      goto LABEL_32;
    case 1u:
      uint64_t v22 = @"Component data type is INT";
      goto LABEL_32;
    case 2u:
      uint64_t v22 = @"Component data type is UNORM";
      goto LABEL_32;
    case 3u:
      uint64_t v22 = @"Component data type is SNORM";
      goto LABEL_32;
    case 4u:
      uint64_t v22 = @"Component data type is FLOAT";
LABEL_32:
      [v2 addObject:v22];
      break;
    default:
      id v23 = [NSString alloc];
      char v24 = [NSNumber numberWithUnsignedInt:v105];
      uint64_t v25 = (void *)[v23 initWithFormat:@"Component data type is UNKNOWN w/ ctype %@", v24];
      [v2 addObject:v25];

      break;
  }
  uint64_t v100 = 0;
  if (e5rt_tensor_desc_dtype_get_component_size())
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v26 = v2;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v96 objects:v115 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v97;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v97 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v96 + 1) + 8 * v30);
          char v32 = PML_LogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v118 = v31;
            _os_log_fault_impl(&dword_2212A0000, v32, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v96 objects:v115 count:16];
      }
      while (v28);
    }

    uint64_t v33 = e5rt_get_last_error_message();
    uint64_t v12 = PML_LogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v118 = v33;
    goto LABEL_69;
  }
  unsigned int v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Component size is %zu bytes", v100);
  [v2 addObject:v34];

  uint64_t v95 = 0;
  if (e5rt_tensor_desc_dtype_get_element_size())
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v35 = v2;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v91 objects:v114 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v92;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v92 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v91 + 1) + 8 * v39);
          int v41 = PML_LogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v118 = v40;
            _os_log_fault_impl(&dword_2212A0000, v41, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v39;
        }
        while (v37 != v39);
        uint64_t v37 = [v35 countByEnumeratingWithState:&v91 objects:v114 count:16];
      }
      while (v37);
    }

    uint64_t v42 = e5rt_get_last_error_message();
    uint64_t v12 = PML_LogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v118 = v42;
    goto LABEL_69;
  }
  char v43 = objc_msgSend([NSString alloc], "initWithFormat:", @"Element size is %zu bytes", v95);
  [v2 addObject:v43];

  uint64_t v90 = 0;
  if (e5rt_tensor_desc_get_rank())
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v44 = v2;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v86 objects:v113 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v87;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v87 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v86 + 1) + 8 * v48);
          uint64_t v50 = PML_LogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v118 = v49;
            _os_log_fault_impl(&dword_2212A0000, v50, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v48;
        }
        while (v46 != v48);
        uint64_t v46 = [v44 countByEnumeratingWithState:&v86 objects:v113 count:16];
      }
      while (v46);
    }

    uint64_t v51 = e5rt_get_last_error_message();
    uint64_t v12 = PML_LogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_70;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v118 = v51;
    goto LABEL_69;
  }
  uint64_t v54 = objc_msgSend([NSString alloc], "initWithFormat:", @"Tensor rank is %zu", v90);
  [v2 addObject:v54];

  uint64_t v85 = 0;
  if (e5rt_tensor_desc_get_shape())
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v55 = v2;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v81 objects:v112 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v82;
      do
      {
        uint64_t v59 = 0;
        do
        {
          if (*(void *)v82 != v58) {
            objc_enumerationMutation(v55);
          }
          uint64_t v60 = *(void *)(*((void *)&v81 + 1) + 8 * v59);
          uint64_t v61 = PML_LogHandle();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v118 = v60;
            _os_log_fault_impl(&dword_2212A0000, v61, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v59;
        }
        while (v57 != v59);
        uint64_t v57 = [v55 countByEnumeratingWithState:&v81 objects:v112 count:16];
      }
      while (v57);
    }

    uint64_t v62 = e5rt_get_last_error_message();
    uint64_t v63 = PML_LogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v118 = v62;
      _os_log_fault_impl(&dword_2212A0000, v63, OS_LOG_TYPE_FAULT, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    uint64_t v52 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v63 = objc_opt_new();
    [v63 appendString:@"Tensor shape is { "];
    uint64_t v52 = 0;
    [v63 appendString:@"}"];
    [v2 addObject:v63];
    uint64_t v80 = 0;
    if (e5rt_tensor_desc_get_strides())
    {
      unsigned int v75 = v63;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v64 = v2;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v76 objects:v111 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v77;
        do
        {
          uint64_t v68 = 0;
          do
          {
            if (*(void *)v77 != v67) {
              objc_enumerationMutation(v64);
            }
            uint64_t v69 = *(void *)(*((void *)&v76 + 1) + 8 * v68);
            uint64_t v70 = PML_LogHandle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v118 = v69;
              _os_log_fault_impl(&dword_2212A0000, v70, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
            }

            ++v68;
          }
          while (v66 != v68);
          uint64_t v66 = [v64 countByEnumeratingWithState:&v76 objects:v111 count:16];
        }
        while (v66);
      }

      uint64_t v71 = e5rt_get_last_error_message();
      unint64_t v72 = PML_LogHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v118 = v71;
        _os_log_fault_impl(&dword_2212A0000, v72, OS_LOG_TYPE_FAULT, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      uint64_t v52 = 0xFFFFFFFFLL;
      uint64_t v63 = v75;
    }
    else
    {
      unint64_t v72 = objc_opt_new();
      [v72 appendString:@"Tensor strides is { "];
      [v72 appendString:@"} \n\n"];
      [v2 addObject:v72];
      char v73 = PML_LogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        char v74 = [v2 componentsJoinedByString:@"; "];
        *(_DWORD *)buf = 138412290;
        uint64_t v118 = (uint64_t)v74;
        _os_log_debug_impl(&dword_2212A0000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
LABEL_71:

  return v52;
}

void hashingVectorizeTokens(void *a1, void *a2, int a3, int a4, int a5, void *a6, int a7, int a8, char a9, char a10)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v17 = a1;
  id v18 = a6;
  if (!a4 || a5 == a4)
  {
LABEL_45:

    return;
  }
  uint64_t v53 = a2;
  id v54 = v18;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v49 = (4 * (a5 - 1)) | 3;
  LODWORD(v51) = a8;
  int v48 = a7;
  if (v49 > 0x200)
  {
    int v44 = malloc_type_posix_memalign((void **)&v68, 8uLL, 4 * (a5 - 1), 0x270294DDuLL);
    LOBYTE(v69) = 0;
    if (v44)
    {
      id v45 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF570] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v45);
    }
    int v19 = a3;
    uint64_t v20 = v17;
    uint64_t v22 = v68;
  }
  else
  {
    int v19 = a3;
    uint64_t v20 = v17;
    MEMORY[0x270FA5388]();
    uint64_t v22 = (char *)&v46 - ((v21 + 15) & 0x7FFFFFFF0);
    bzero(v22, v21);
  }
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  int v62 = 0;
  bzero(v22, 4 * (a5 - 1));
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __hashingVectorizeTokens_block_invoke;
  v55[3] = &unk_26459F4E8;
  uint64_t v50 = v22;
  v55[4] = v61;
  v55[5] = v22;
  int v56 = a5;
  int v57 = a4;
  char v59 = a10;
  v55[6] = v53;
  int v58 = v19;
  char v60 = a9;
  id v17 = v20;
  id v23 = v20;
  CFLocaleRef v52 = (CFLocaleRef)v54;
  uint64_t v53 = v55;
  objc_opt_class();
  int v24 = (int)v51;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = v53;
    v72.length = CFStringGetLength(v23);
    v72.location = 0;
    id v26 = CFStringTokenizerCreate(0, v23, v72, 4 * (v52 != 0), v52);
    if (v26)
    {
      bzero(&v68, 0x3E8uLL);
      CFAllocatorRef v47 = (CFAllocatorRef)*MEMORY[0x263EFFB28];
      CFMutableStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, (UniChar *)&v68, 0, 500, v47);
      if (v52)
      {
        if (v48) {
          CFCharacterSetPredefinedSet v28 = kCFCharacterSetWhitespace;
        }
        else {
          CFCharacterSetPredefinedSet v28 = kCFCharacterSetWhitespaceAndNewline;
        }
        CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(v28);
        CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, Predefined);
      }
      else
      {
        CFCharacterSetRef InvertedSet = 0;
      }
      while (CFStringTokenizerAdvanceToNextToken(v26))
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v26);
        if (CurrentTokenRange.length <= 500
          && (!InvertedSet || CFStringFindCharacterFromSet(v23, InvertedSet, CurrentTokenRange, 0, 0)))
        {
          CFStringGetCharacters(v23, CurrentTokenRange, (UniChar *)&v68);
          CFStringSetExternalCharactersNoCopy(MutableWithExternalCharactersNoCopy, (UniChar *)&v68, CurrentTokenRange.length, 500);
          if (v24)
          {
            CFStringFold(MutableWithExternalCharactersNoCopy, 0x181uLL, 0);
            CFStringNormalize(MutableWithExternalCharactersNoCopy, kCFStringNormalizationFormKC);
          }
          if (CFStringGetCharactersPtr(MutableWithExternalCharactersNoCopy) == (const UniChar *)&v68)
          {
            unint64_t Length = CFStringGetLength(MutableWithExternalCharactersNoCopy);
            if (Length >= 0x1F4) {
              uint64_t v42 = 500;
            }
            else {
              uint64_t v42 = Length;
            }
            getHashOfUTF16((uint64_t)&v68, v42, v25);
          }
          else
          {
            CFRelease(MutableWithExternalCharactersNoCopy);
            CFMutableStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, (UniChar *)&v68, 0, 500, v47);
          }
        }
      }
      if (InvertedSet) {
        CFRelease(InvertedSet);
      }
      CFRelease(MutableWithExternalCharactersNoCopy);
      CFRelease(v26);
    }

    uint64_t v39 = v50;
LABEL_42:
    BOOL v43 = v49 > 0x200;

    if (v43) {
      free(v39);
    }
    _Block_object_dispose(v61, 8);
    id v18 = v54;
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v31 = v23;
    char v32 = v53;
    bzero(&v68, 0x3E8uLL);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v33 = [(__CFString *)v31 countByEnumeratingWithState:&v63 objects:v67 count:16];
    id v51 = v17;
    if (v33)
    {
      uint64_t v34 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v64 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(__CFString **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v37 = [(__CFString *)v36 length];
          if ((int)v37 <= 500)
          {
            CharactersPtr = CFStringGetCharactersPtr(v36);
            if (!CharactersPtr)
            {
              v71.length = (int)v37;
              CharactersPtr = (const UniChar *)&v68;
              v71.location = 0;
              CFStringGetCharacters(v36, v71, (UniChar *)&v68);
            }
            getHashOfUTF16((uint64_t)CharactersPtr, v37, v32);
          }
        }
        uint64_t v33 = [(__CFString *)v31 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v33);
    }

    uint64_t v39 = v50;
    id v17 = v51;

    goto LABEL_42;
  }
  __break(1u);
}

void sub_2212D00D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 144), 8);
  _Unwind_Resume(a1);
}

void hashingVectorizeCharacters(void *a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, int a6, char a7, char a8)
{
  uint64_t v15 = a1;
  if (a4)
  {
    if (a5 != a4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a6)
        {
          uint64_t v16 = (__CFString *)[(__CFString *)v15 mutableCopy];
          CFStringFold(v16, 0x181uLL, 0);
          CFStringNormalize(v16, kCFStringNormalizationFormKC);

          uint64_t v15 = v16;
        }
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __hashingVectorizeCharacters_block_invoke;
        v36[3] = &__block_descriptor_46_e8_v12__0I8l;
        char v38 = a8;
        v36[4] = a2;
        int v37 = a3;
        char v39 = a7;
        uint64_t v15 = v15;
        unsigned int v17 = [(__CFString *)v15 length];
        if (v17)
        {
          id v18 = v15;
          uint64_t v19 = [(__CFString *)v18 length];
          uint64_t v20 = 2 * v19;
          CharactersPtr = CFStringGetCharactersPtr(v18);
          id v35 = v15;
          if (CharactersPtr)
          {
            id v22 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:CharactersPtr length:v20 freeWhenDone:0];
          }
          else
          {
            id v22 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v20];
            -[__CFString getCharacters:range:](v18, "getCharacters:range:", [v22 mutableBytes], 0, v19);
          }

          id v34 = v22;
          uint64_t v23 = [v34 bytes];
          unsigned int v24 = 0;
          do
          {
            unsigned int v25 = 0;
            unsigned int v26 = v24;
            do
            {
              if ((*(_WORD *)(v23 + 2 * v26) & 0xFC00) == 0xD800) {
                int v27 = 2;
              }
              else {
                int v27 = 1;
              }
              unsigned int v28 = v27 + v26;
              if (v28 >= v17) {
                unsigned int v26 = v17;
              }
              else {
                unsigned int v26 = v28;
              }
              ++v25;
            }
            while (v25 < a4 && v28 < v17);
            if (v25 != a4) {
              break;
            }
            if (a5 > a4)
            {
              unsigned int v29 = a5 - a4;
              do
              {
                getHashOfUTF16(v23 + 2 * v24, v26 - v24, v36);
                if (v26 >= v17) {
                  break;
                }
                int v30 = (*(_WORD *)(v23 + 2 * v26) & 0xFC00) == 0xD800 ? 2 : 1;
                unsigned int v31 = v30 + v26;
                unsigned int v26 = v31 >= v17 ? v17 : v31;
                --v29;
              }
              while (v29);
            }
            int v32 = (*(_WORD *)(v23 + 2 * v24) & 0xFC00) == 0xD800 ? 2 : 1;
            unsigned int v33 = v32 + v24;
            unsigned int v24 = v33 >= v17 ? v17 : v33;
          }
          while (v33 < v17);

          uint64_t v15 = v35;
        }
      }
    }
  }
}

char *__hashingVectorizeCharacters_block_invoke(uint64_t a1, char *a2)
{
  uint64_t v3 = *(unsigned int **)(a1 + 32);
  unsigned int v4 = *(_DWORD *)(a1 + 40);
  if (*(unsigned char *)(a1 + 44)) {
    return appendHashToVector(a2, v3, v4);
  }
  else {
    return applyHashToVector(a2, v3, v4, *(unsigned char *)(a1 + 45));
  }
}

void getHashOfUTF16(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = a3;
  uint64_t v3 = _PASMurmur3_x86_32();
  v4[2](v4, v3);
}

char *applyHashToVector(char *result, unsigned int *a2, unsigned int a3, unsigned __int8 a4)
{
  if ((((result & 1) == 0) & a4) != 0) {
    int v5 = -1;
  }
  else {
    int v5 = 1;
  }
  unsigned int v6 = (result >> 1) % a3;
  uint64_t v7 = *a2;
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (int *)*((void *)a2 + 1);
    while (1)
    {
      int v10 = *v9;
      v9 += 2;
      if (v10 == v6) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_8;
      }
    }
    *(_DWORD *)(*((void *)a2 + 1) + 8 * v8 + 4) += v5;
  }
  else
  {
LABEL_8:
    unsigned int v11 = a2[1];
    if (v7 >= v11)
    {
      unsigned int v12 = 2 * v11;
      if (2 * v11 <= 8) {
        unsigned int v12 = 8;
      }
      a2[1] = v12;
      uint64_t result = (char *)reallocf(*((void **)a2 + 1), 8 * v12);
      *((void *)a2 + 1) = result;
      LODWORD(v7) = *a2;
    }
    else
    {
      uint64_t result = (char *)*((void *)a2 + 1);
    }
    *a2 = v7 + 1;
    unint64_t v13 = (unsigned int *)&result[8 * v7];
    *unint64_t v13 = v6;
    v13[1] = v5;
  }
  return result;
}

char *appendHashToVector(unsigned int a1, unsigned int *a2, unsigned int a3)
{
  unsigned int v6 = *a2;
  unsigned int v7 = a2[1];
  if (*a2 >= v7)
  {
    unsigned int v9 = 2 * v7;
    if (2 * v7 <= 8) {
      unsigned int v9 = 8;
    }
    a2[1] = v9;
    uint64_t result = (char *)reallocf(*((void **)a2 + 1), 8 * v9);
    *((void *)a2 + 1) = result;
    unsigned int v6 = *a2;
  }
  else
  {
    uint64_t result = (char *)*((void *)a2 + 1);
  }
  *a2 = v6 + 1;
  int v10 = (int *)&result[8 * v6];
  *int v10 = (a1 >> 1) % a3;
  v10[1] = 1;
  return result;
}

uint64_t __hashingVectorizeTokens_block_invoke(uint64_t result, int a2)
{
  id v2 = *(_DWORD **)(result + 40);
  uint64_t v3 = (*(_DWORD *)(result + 56) - 2);
  if (*(_DWORD *)(result + 56) != 2)
  {
    do
    {
      LODWORD(v4) = a2 ^ __ROR4__(v2[(v3 - 1)], 9);
      HIDWORD(v4) = v4;
      v2[v3--] = (v4 >> 5) + a2;
    }
    while (v3);
  }
  *id v2 = a2;
  ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  int v6 = *(_DWORD *)(result + 56);
  int v5 = *(_DWORD *)(result + 60);
  unsigned int v7 = *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  id v14 = __hashingVectorizeTokens_block_invoke_2;
  uint64_t v15 = &__block_descriptor_46_e8_v12__0I8l;
  char v18 = *(unsigned char *)(result + 68);
  uint64_t v16 = *(void *)(result + 48);
  int v17 = *(_DWORD *)(result + 64);
  char v19 = *(unsigned char *)(result + 69);
  unsigned int v8 = v5 - 1;
  unsigned int v9 = v6 - 1;
  if (v9 >= v7) {
    unsigned int v9 = v7;
  }
  if (v8 < v9)
  {
    int v10 = v9 - v5 + 1;
    unsigned int v11 = &v2[v8];
    do
    {
      unsigned int v12 = *v11++;
      uint64_t result = (uint64_t)v14((uint64_t)v13, (char *)v12);
      --v10;
    }
    while (v10);
  }
  return result;
}

char *__hashingVectorizeTokens_block_invoke_2(uint64_t a1, char *a2)
{
  uint64_t v3 = *(unsigned int **)(a1 + 32);
  unsigned int v4 = *(_DWORD *)(a1 + 40);
  if (*(unsigned char *)(a1 + 44)) {
    return appendHashToVector(a2, v3, v4);
  }
  else {
    return applyHashToVector(a2, v3, v4, *(unsigned char *)(a1 + 45));
  }
}

uint64_t compareHashAndCounts(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

id PML_LogHandle()
{
  if (PML_LogHandle__pasOnceToken0 != -1) {
    dispatch_once(&PML_LogHandle__pasOnceToken0, &__block_literal_global_4171);
  }
  v0 = (void *)PML_LogHandle__pasExprOnceResult;
  return v0;
}

void sub_2212D4738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingQuantizedDenseVectorReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  int v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unsigned int v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v17 = v10 & 7;
      if (v16 || v17 == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v19 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v19 == 2)
      {
        *(unsigned char *)(a1 + 40) |= 2u;
        uint64_t v31 = *v3;
        unint64_t v32 = *(void *)(a2 + v31);
        if (v32 <= 0xFFFFFFFFFFFFFFFBLL && v32 + 4 <= *(void *)(a2 + *v4))
        {
          int v30 = *(_DWORD *)(*(void *)(a2 + *v7) + v32);
          *(void *)(a2 + v31) = v32 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v30 = 0;
        }
        uint64_t v40 = 36;
LABEL_56:
        *(_DWORD *)(a1 + v40) = v30;
        goto LABEL_57;
      }
      if (v19 == 1)
      {
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v21 = 0;
            unsigned int v22 = 0;
            uint64_t v23 = 0;
            while (1)
            {
              uint64_t v24 = *v3;
              uint64_t v25 = *(void *)(a2 + v24);
              unint64_t v26 = v25 + 1;
              if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
                break;
              }
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_33;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          while (1)
          {
            uint64_t v36 = *v3;
            uint64_t v37 = *(void *)(a2 + v36);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)(a2 + *v4)) {
              break;
            }
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v38;
            v35 |= (unint64_t)(v39 & 0x7F) << v33;
            if (v39 < 0)
            {
              v33 += 7;
              BOOL v15 = v34++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_51;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_51:
          PBRepeatedUInt32Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
LABEL_57:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 40) |= 1u;
    uint64_t v28 = *v3;
    unint64_t v29 = *(void *)(a2 + v28);
    if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)(a2 + *v4))
    {
      int v30 = *(_DWORD *)(*(void *)(a2 + *v7) + v29);
      *(void *)(a2 + v28) = v29 + 4;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      int v30 = 0;
    }
    uint64_t v40 = 32;
    goto LABEL_56;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_2212D8A58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2212D9510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingMinibatchStatsReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  int v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    unsigned int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unsigned int v22 = objc_alloc_init(AWDProactiveModelFittingLabelSupportPair);
        [(id)a1 addPerLabelSupport:v22];
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLabelSupportPairReadFrom((uint64_t)v22, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v18 == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0) {
            goto LABEL_37;
          }
          v23 += 7;
          BOOL v15 = v24++ >= 9;
          if (v15)
          {
            uint64_t v25 = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_39:
        *(void *)(a1 + 8) = v25;
      }
      else if (v18 == 1)
      {
        *(unsigned char *)(a1 + 28) |= 2u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFFBLL && v20 + 4 <= *(void *)(a2 + *v4))
        {
          int v21 = *(_DWORD *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v21 = 0;
        }
        *(_DWORD *)(a1 + 24) = v21;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL AWDProactiveModelFittingParsecFeedbackEnvelopeReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  int v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unsigned int v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = objc_alloc_init(AWDProactiveModelFittingEvaluation);
        objc_storeStrong(a1 + 1, v17);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingEvaluationReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_35;
        }
        goto LABEL_39;
      case 2u:
        uint64_t v17 = objc_alloc_init(AWDProactiveModelFittingLogRegWeights);
        objc_storeStrong(a1 + 5, v17);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLogRegWeightsReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 3u:
        uint64_t v17 = objc_alloc_init(AWDProactiveModelFittingLogRegGradient);
        objc_storeStrong(a1 + 4, v17);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLogRegGradientReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 4u:
        uint64_t v17 = objc_alloc_init(AWDProactiveModelFittingLinRegFeatureMatrix);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLinRegFeatureMatrixReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 5u:
        uint64_t v17 = objc_alloc_init(AWDProactiveModelFittingLinRegObjectiveFeatures);
        objc_storeStrong(a1 + 3, v17);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingLinRegObjectiveFeaturesReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_36:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_36;
    }
  }
}

void sub_2212DCA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212DCFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2212DD564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2212DDFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5932(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5933(uint64_t a1)
{
}

void sub_2212DF600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void collectPerLabelCounts(void *a1, unint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    float v10 = (float)a2;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        char v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "label"));
        char v14 = [v6 objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 unsignedIntegerValue];

        [v12 support];
        uint64_t v17 = [NSNumber numberWithUnsignedInteger:v15 + vcvtas_u32_f32(v16 * v10)];
        unint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "label"));
        [v6 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

uint64_t AWDProactiveModelFittingPrecisionAtKPairReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 20) |= 2u;
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(void *)(a2 + *v4))
        {
          int v27 = *(_DWORD *)(*(void *)(a2 + *v7) + v26);
          *(void *)(a2 + v25) = v26 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v27 = 0;
        }
        *(_DWORD *)(a1 + 16) = v27;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_35:
        *(void *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AWDProactiveModelFittingLogRegGradientReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  unsigned int v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 80) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_60;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_62;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_62:
        uint64_t v38 = 16;
        goto LABEL_67;
      case 2u:
        unint64_t v26 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v26, a2)) {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 3u:
        unint64_t v26 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 64), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 4u:
        unint64_t v26 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 5u:
        unint64_t v26 = objc_alloc_init(AWDProactiveModelFittingEvalMetrics);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 6u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 80) |= 1u;
        while (2)
        {
          uint64_t v29 = *v3;
          uint64_t v30 = *(void *)(a2 + v29);
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v15 = v28++ >= 9;
              if (v15)
              {
                uint64_t v20 = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_66:
        uint64_t v38 = 8;
LABEL_67:
        *(void *)(a1 + v38) = v20;
        goto LABEL_73;
      case 7u:
        unint64_t v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseVector);
        objc_storeStrong((id *)(a1 + 72), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 8u:
        *(unsigned char *)(a1 + 80) |= 8u;
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(void *)(a2 + *v4))
        {
          int v35 = *(_DWORD *)(*(void *)(a2 + *v7) + v34);
          *(void *)(a2 + v33) = v34 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v35 = 0;
        }
        uint64_t v39 = 44;
        goto LABEL_72;
      case 9u:
        *(unsigned char *)(a1 + 80) |= 4u;
        uint64_t v36 = *v3;
        unint64_t v37 = *(void *)(a2 + v36);
        if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(void *)(a2 + *v4))
        {
          int v35 = *(_DWORD *)(*(void *)(a2 + *v7) + v37);
          *(void *)(a2 + v36) = v37 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v35 = 0;
        }
        uint64_t v39 = 40;
LABEL_72:
        *(_DWORD *)(a1 + v39) = v35;
        goto LABEL_73;
      case 0xAu:
        unint64_t v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedDenseVector);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedDenseVectorReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_58:
          PBReaderRecallMark();

LABEL_73:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_75:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_73;
    }
  }
}

uint64_t AWDPostMetric()
{
  return MEMORY[0x270F858D0]();
}

uint64_t CFBurstTrieAdd()
{
  return MEMORY[0x270EE4628]();
}

uint64_t CFBurstTrieCreate()
{
  return MEMORY[0x270EE4648]();
}

uint64_t CFBurstTrieGetCount()
{
  return MEMORY[0x270EE4688]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x270EE4690]();
}

uint64_t CFBurstTrieSerialize()
{
  return MEMORY[0x270EE4698]();
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4728](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x270EE4768](theSet, *(void *)&theChar);
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x270EE50C0](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE5100](alloc, chars, numChars, contentsDeallocator);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x270F24B58]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x270F58528]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x270F58530]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x270F58558]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x270F58648]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x270F58650]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x270F58658]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x270F58660]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x270F58668]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x270F58670]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x270F586F8]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x270F58708]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x270F58710]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x270F58720]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x270F58730]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x270F58740]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x270F58760]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x270F58768]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x270F58770]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x270F58778]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x270F58780]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x270F58788]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PASIterateLongChars()
{
  return MEMORY[0x270F57F80]();
}

uint64_t _PASMurmur3_x86_32()
{
  return MEMORY[0x270F57F90]();
}

uint64_t _PASRngSeed64()
{
  return MEMORY[0x270F57FA0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void catlas_saxpby(const int __N, const float __alpha, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
}

int cblas_isamax(const int __N, const float *__X, const int __incX)
{
  return MEMORY[0x270EDE3E8](*(void *)&__N, __X, *(void *)&__incX);
}

float cblas_sasum(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x270EDE3F8](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  MEMORY[0x270EDE420](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x270EDE478](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x270F27B00]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x270F27B20]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x270F27BC0]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x270F27C28]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x270F27C40]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x270F27DF8]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x270F27E10]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x270F27E20]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x270F27E28]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x270F27E30]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x270F27E38]();
}

uint64_t e5rt_tensor_desc_get_rank()
{
  return MEMORY[0x270F27E48]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x270F27E58]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x270F27E68]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x270F27E88]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x270F27ED8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x270F28008]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x270F28010]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

sparse_status sparse_commit(void *A)
{
  return MEMORY[0x270EDE850](A);
}

sparse_status sparse_extract_sparse_row_float(sparse_matrix_float A, sparse_index row, sparse_index column_start, sparse_index *column_end, sparse_dimension nz, float *val, sparse_index *jndx)
{
  return MEMORY[0x270EDE858](A, row, column_start, column_end, nz, val, jndx);
}

uint64_t sparse_get_matrix_nonzero_count(void *A)
{
  return MEMORY[0x270EDE860](A);
}

uint64_t sparse_get_matrix_nonzero_count_for_row(void *A, sparse_index i)
{
  return MEMORY[0x270EDE868](A, i);
}

sparse_dimension sparse_get_matrix_number_of_columns(void *A)
{
  return MEMORY[0x270EDE870](A);
}

sparse_dimension sparse_get_matrix_number_of_rows(void *A)
{
  return MEMORY[0x270EDE878](A);
}

float sparse_inner_product_dense_float(sparse_dimension nz, const float *x, const sparse_index *indx, const float *y, sparse_stride incy)
{
  MEMORY[0x270EDE880](nz, x, indx, y, incy);
  return result;
}

sparse_status sparse_insert_entry_float(sparse_matrix_float A, float val, sparse_index i, sparse_index j)
{
  return MEMORY[0x270EDE888](A, i, j, val);
}

sparse_status sparse_insert_row_float(sparse_matrix_float A, sparse_index i, sparse_dimension nz, const float *val, const sparse_index *jndx)
{
  return MEMORY[0x270EDE890](A, i, nz, val, jndx);
}

sparse_matrix_float sparse_matrix_create_float(sparse_dimension M, sparse_dimension N)
{
  return (sparse_matrix_float)MEMORY[0x270EDE898](M, N);
}

sparse_status sparse_matrix_destroy(void *A)
{
  return MEMORY[0x270EDE8A0](A);
}

sparse_status sparse_matrix_vector_product_dense_float(CBLAS_TRANSPOSE transa, float alpha, sparse_matrix_float A, const float *x, sparse_stride incx, float *y, sparse_stride incy)
{
  return MEMORY[0x270EDE8A8](*(void *)&transa, A, x, incx, y, incy, alpha);
}

void sparse_vector_add_with_scale_dense_float(sparse_dimension nz, float alpha, const float *x, const sparse_index *indx, float *y, sparse_stride incy)
{
}