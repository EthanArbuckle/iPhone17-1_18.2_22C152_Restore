@interface UITintColorVisitor
@end

@implementation UITintColorVisitor

uint64_t __34___UITintColorVisitor__visitView___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(result + 32) + 24))
  {
    result = [*(id *)(result + 40) _interactionTintColor];
    if (result)
    {
      if (*(unsigned char *)(v1 + 80)) {
        *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
      v2 = *(void **)(v1 + 48);
      if (!v2) {
        goto LABEL_9;
      }
      if (qword_1EB25EAA8 != -1) {
        dispatch_once(&qword_1EB25EAA8, &__block_literal_global_668);
      }
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
      {
        uint64_t v3 = 0x100000000000;
        if ((v2[13] & 0x100000000000) == 0)
        {
          result = [v2 _definesTintColor];
          if (!result) {
            uint64_t v3 = 0;
          }
        }
      }
      else
      {
LABEL_9:
        uint64_t v3 = 0;
      }
      uint64_t v4 = *(void *)(v1 + 40);
      if (v4)
      {
        v5 = (uint64_t *)(v4 + 96);
        unint64_t v6 = v5[1] & 0xFFFFEFFFFFFFFFFFLL | v3;
        uint64_t v7 = *v5;
        *((_DWORD *)v5 + 4) = *((_DWORD *)v5 + 4);
        uint64_t *v5 = v7;
        v5[1] = v6;
      }
    }
  }
  if ((*(unsigned char *)(*(void *)(v1 + 32) + 24) & 2) != 0)
  {
    uint64_t v8 = *(void *)(v1 + 40);
    if (v8 && ((*(void *)(v8 + 104) & 0x1800000000) != 0 || *(_WORD *)(v8 + 208)))
    {
      if (*(unsigned char *)(v1 + 80)) {
        *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
      uint64_t v9 = *(void *)(v1 + 48);
      if (!v9) {
        goto LABEL_22;
      }
      if (qword_1EB25EAA8 != -1) {
        dispatch_once(&qword_1EB25EAA8, &__block_literal_global_668);
      }
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
      {
        unint64_t v21 = *(void *)(v9 + 104);
        if ((v21 & 0x200000000000) != 0)
        {
          unint64_t v10 = 0x200000000000;
        }
        else
        {
          uint64_t v22 = (v21 >> 35) & 3;
          if (!v22) {
            uint64_t v22 = 2 * (*(_WORD *)(v9 + 208) != 0);
          }
          unint64_t v10 = (unint64_t)(v22 != 0) << 45;
        }
      }
      else
      {
LABEL_22:
        unint64_t v10 = 0;
      }
      uint64_t v11 = *(void *)(v1 + 40);
      if (v11)
      {
        v12 = (uint64_t *)(v11 + 96);
        unint64_t v13 = v12[1] & 0xFFFFDFFFFFFFFFFFLL | v10;
        uint64_t v14 = *v12;
        *((_DWORD *)v12 + 4) = *((_DWORD *)v12 + 4);
        uint64_t *v12 = v14;
        v12[1] = v13;
      }
    }
  }
  uint64_t v15 = *(void *)(*(void *)(v1 + 32) + 24);
  if ((v15 & 4) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    uint64_t v15 = *(void *)(*(void *)(v1 + 32) + 24);
  }
  if ((v15 & 8) != 0)
  {
    if ([*(id *)(v1 + 40) accessibilityIgnoresInvertColors])
    {
      *(unsigned char *)(*(void *)(*(void *)(v1 + 72) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 1;
    }
    result = *(void *)(v1 + 48);
    if (result)
    {
      uint64_t v16 = 0x400000000000;
      if ((*(void *)(result + 104) & 0x400000000000) == 0)
      {
        result = [(id)result accessibilityIgnoresInvertColors];
        if (!result) {
          uint64_t v16 = 0;
        }
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = *(void *)(v1 + 40);
    if (v17)
    {
      v18 = (uint64_t *)(v17 + 96);
      unint64_t v19 = v18[1] & 0xFFFFBFFFFFFFFFFFLL | v16;
      uint64_t v20 = *v18;
      *((_DWORD *)v18 + 4) = *((_DWORD *)v18 + 4);
      uint64_t *v18 = v20;
      v18[1] = v19;
    }
  }
  return result;
}

@end