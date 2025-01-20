@interface UICollectionViewSubviewRouter
@end

@implementation UICollectionViewSubviewRouter

void __72___UICollectionViewSubviewRouter_addControlledSubview_zIndex_orderMode___block_invoke(uint64_t a1, void *obj, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (obj)
  {
    uint64_t v9 = obj[3];
    if (v9 == -10000) {
      return;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10 < v9)
  {
LABEL_4:
    *a5 = 1;
    return;
  }
  if (v10 == v9)
  {
    if (obj)
    {
      uint64_t v11 = obj[2];
      uint64_t v12 = *(void *)(a1 + 64);
      if (v11 == v12) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 64);
      if (!v12)
      {
LABEL_8:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
        if (*(unsigned char *)(a1 + 72))
        {
          if (obj)
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = obj[1] + a4;
            ++obj[1];
          }
          else
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
          }
        }
        else
        {
          if (obj) {
            uint64_t v13 = obj[1];
          }
          else {
            uint64_t v13 = 0;
          }
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4 + v13 - 1;
        }
        goto LABEL_4;
      }
      uint64_t v11 = 0;
    }
    if (v12 < v11) {
      goto LABEL_4;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + 1;
  if (obj) {
    uint64_t v14 = obj[1];
  }
  else {
    uint64_t v14 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14 + a4;
}

void *__101___UICollectionViewSubviewRouter_shouldAddSubview_atPosition_relativeTo_creatingBookmarkIfNecessary___block_invoke(void *result, uint64_t a2, uint64_t a3, unint64_t a4, BOOL *a5)
{
  v6 = result;
  uint64_t v7 = *(void *)(result[7] + 8);
  if ((*(void *)(v7 + 24) & 0x8000000000000000) != 0 && result[4] == a2) {
    *(void *)(v7 + 24) = a3;
  }
  uint64_t v8 = *(void *)(result[8] + 8);
  if ((*(void *)(v8 + 24) & 0x8000000000000000) != 0)
  {
    unint64_t v9 = result[10];
    switch(v9)
    {
      case 0xFFFFFFFFFFFFFFFDLL:
        if (result[6] != a2) {
          goto LABEL_26;
        }
        *(void *)(v8 + 24) = a3;
        break;
      case 0xFFFFFFFFFFFFFFFELL:
        if (result[6] != a2) {
          goto LABEL_26;
        }
        *(void *)(v8 + 24) = a3 + 1;
        if (a2) {
          uint64_t v10 = *(void *)(a2 + 8);
        }
        else {
          uint64_t v10 = 0;
        }
        a4 += v10;
        break;
      case 0xFFFFFFFFFFFFFFFFLL:
        result = (void *)[*(id *)(result[5] + 8) count];
        *(void *)(*(void *)(v6[8] + 8) + 24) = result;
        a4 = v6[11];
        break;
      default:
        if (a2)
        {
          if (v9 < a4) {
            goto LABEL_26;
          }
          uint64_t v11 = *(void *)(a2 + 8);
          unint64_t v12 = v11 + a4;
          unint64_t v13 = v11 + a4 - 1;
          if (v13 < v9) {
            goto LABEL_26;
          }
        }
        else
        {
          if (v9 < a4) {
            goto LABEL_26;
          }
          unint64_t v13 = a4 - 1;
          if (a4 - 1 < v9) {
            goto LABEL_26;
          }
          uint64_t v11 = 0;
          unint64_t v12 = a4;
        }
        uint64_t v14 = result[4];
        if (v14) {
          uint64_t v14 = *(void *)(v14 + 8);
        }
        if (v11 == v14) {
          unint64_t v9 = *(void *)(*(void *)(result[7] + 8) + 24) >> 63;
        }
        else {
          LODWORD(v9) = v9 - a4 <= v13 - v9;
        }
        *(void *)(v8 + 24) = (v9 ^ 1) + a3;
        if (!v9) {
          a4 = v12;
        }
        break;
    }
    *(void *)(*(void *)(v6[9] + 8) + 24) = a4;
  }
LABEL_26:
  BOOL v15 = (*(void *)(*(void *)(v6[7] + 8) + 24) & 0x8000000000000000) == 0
     && *(void *)(*(void *)(v6[8] + 8) + 24) >= 0;
  *a5 = v15;
  return result;
}

void *__82___UICollectionViewSubviewRouter_shouldExchangeSubviewAtIndex_withSubviewAtIndex___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v5 = *(void *)(result[6] + 8);
  uint64_t v8 = *(void *)(v5 + 24);
  v6 = (void *)(v5 + 24);
  uint64_t v7 = v8;
  if (v8 < 0 && result[4] == a2
    || (uint64_t v9 = *(void *)(result[7] + 8), v10 = *(void *)(v9 + 24), v6 = (void *)(v9 + 24), v10 < 0)
    && result[5] == a2)
  {
    void *v6 = a3;
    uint64_t v7 = *(void *)(*(void *)(result[6] + 8) + 24);
  }
  BOOL v11 = (v7 & 0x8000000000000000) == 0 && *(void *)(*(void *)(result[7] + 8) + 24) >= 0;
  *a5 = v11;
  return result;
}

@end