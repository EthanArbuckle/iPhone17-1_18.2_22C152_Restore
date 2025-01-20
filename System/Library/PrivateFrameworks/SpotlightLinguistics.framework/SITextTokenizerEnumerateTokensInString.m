@interface SITextTokenizerEnumerateTokensInString
@end

@implementation SITextTokenizerEnumerateTokensInString

__n128 __SITextTokenizerEnumerateTokensInString_block_invoke_2(uint64_t a1, CFIndex *a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  unint64_t v6 = a2[2];
  uint64_t v7 = (v6 >> 10) & 1;
  int CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 160), *a2);
  UniChar v9 = CharacterAtIndex;
  uint64_t v10 = a2[1];
  if (v10 == 1 && (CharacterAtIndex == 45 || CharacterAtIndex == 38)) {
    LODWORD(v7) = 0;
  }
  unint64_t v11 = v6 & 0x800;
  BOOL v12 = CharacterAtIndex == 9 || CharacterAtIndex == 8200;
  if (v12 || CharacterAtIndex == 12288)
  {
    int v13 = 1;
    BOOL v14 = 1;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      goto LABEL_22;
    }
  }
  else
  {
    int v13 = 0;
  }
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  int IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v9);
  BOOL v14 = IsCharacterMember != 0;
  if (IsCharacterMember || (v6 & 0x800) == 0)
  {
    uint64_t v10 = a2[1];
  }
  else
  {
    uint64_t v10 = a2[1];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = v10 <= 1;
    }
    BOOL v14 = !v17;
  }
LABEL_22:
  CFIndex v18 = *a2;
  uint64_t v19 = v10 + *a2;
  uint64_t v20 = *(void *)(a1 + 168);
  uint64_t v21 = *(void *)(a1 + 176);
  int v22 = (v13 | v14) ^ 1;
  if ((v6 & 0x800) != 0) {
    int v22 = 0;
  }
  uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v24 = *(void *)(v23 + 40);
  if (v14 || v19 >= *(void *)(v23 + 48) + v24)
  {
    *(void *)(v23 + 48) = v19 - v24;
    int v25 = 1;
  }
  else
  {
    int v25 = 0;
  }
  int v26 = v14 | v7;
  uint64_t v27 = v21 + v20;
  if (v22)
  {
    CFIndex v28 = v18 - v20;
    CFIndex v29 = a2[1];
    v30 = (void *)(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
                   + 16 * *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
    void *v30 = v28;
    v30[1] = v29;
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
              + 8 * (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))++) = a2[2];
  }
  if (v19 >= v27) {
    int v31 = 1;
  }
  else {
    int v31 = v26;
  }
  if ((v31 | v25) == 1)
  {
    uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 48)
        + *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    CFIndex v33 = a2[1] + *a2;
    v34 = *(unsigned char **)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    CFIndex v46 = v33 - v32;
    if (v33 == v32)
    {
      char v36 = 0;
    }
    else
    {
      uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 48)
          + *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      int v44 = v25;
      v45 = a3;
      if (v35 < 1)
      {
LABEL_44:
        unsigned char *v34 = 0;
        char v36 = 1;
      }
      else
      {
        uint64_t v37 = 0;
        uint64_t v38 = *(void *)(a1 + 184);
        v39 = (void *)(*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) + 8);
        v40 = (void *)(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 8);
        while (v38 > *v40 && !CFStringEncodingUnicodeToBytes())
        {
          *(v39 - 1) = 0;
          void *v39 = 0;
          ++v37;
          v39 += 2;
          v40 += 2;
          if (v37 >= v35) {
            goto LABEL_44;
          }
        }
        char v36 = 0;
      }
      unint64_t v11 = v6 & 0x800;
      a3 = v45;
      int v25 = v44;
      uint64_t v32 = v43;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = v36;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 0;
        *a3 = 1;
      }
      if (v25)
      {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) += *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                 + 48);
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) = *(void *)(a1 + 200)
                                                                    + *(void *)(a1 + 192)
                                                                    - *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 40);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11 >> 11;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24)
      || !*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24))
    {
      *a3 = 1;
    }
    uint64_t v41 = *(void *)(*(void *)(a1 + 96) + 8);
    *(void *)(v41 + 40) = v32;
    *(void *)(v41 + 48) = v46;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11 >> 11;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;
  }
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) = *(_OWORD *)a2;
  *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 144) + 8)
                                                                           + 48)
                                                               + *(void *)(*(void *)(*(void *)(a1 + 144) + 8)
                                                                           + 40);
  return result;
}

@end