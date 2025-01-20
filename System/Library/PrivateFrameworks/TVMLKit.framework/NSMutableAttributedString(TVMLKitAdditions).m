@interface NSMutableAttributedString(TVMLKitAdditions)
- (void)tv_addLanguageAwareness:()TVMLKitAdditions;
@end

@implementation NSMutableAttributedString(TVMLKitAdditions)

- (void)tv_addLanguageAwareness:()TVMLKitAdditions
{
  v87[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v55 = a1;
  v5 = [a1 string];
  uint64_t v6 = [(__CFString *)v5 length];
  if (v6)
  {
    uint64_t v7 = v6;
    id v53 = v4;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v64 = 0u;
    v79 = v5;
    uint64_t v82 = 0;
    uint64_t v83 = v6;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v80 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    int64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    NSUInteger v13 = 0;
    NSUInteger v56 = 0;
    int64_t v57 = 0;
    uint64_t v54 = 0;
    unsigned __int8 v61 = 0;
    uint64_t v14 = 0;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    v81 = CStringPtr;
    unint64_t v49 = v7 - 1;
    v50 = v5;
    uint64_t v15 = -1;
    uint64_t v51 = *MEMORY[0x263F1C268];
    uint64_t v52 = *MEMORY[0x263F1C2E0];
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v58 = v7;
    while (1)
    {
      uint64_t v59 = v16;
      uint64_t v62 = 0;
      uint64_t CharacterAtIndex = AMPCFStringGetCharacterAtIndex(buffer, v10, &v62);
      int v18 = 0;
      uint64_t v19 = v62;
      unint64_t v20 = v62 + v10;
      LODWORD(v21) = 1;
      if ((CharacterAtIndex - 8206) < 2 || CharacterAtIndex == 0)
      {
        v10 += v62;
        BOOL v23 = 1;
        int v24 = 1;
      }
      else
      {
        int v25 = CharacterAtIndex;
        if (CharacterAtIndex == 65532)
        {
LABEL_12:
          int v26 = 1;
          int v27 = 1;
        }
        else
        {
          int v28 = MEMORY[0x230FC9FD0](CharacterAtIndex);
          int v29 = 0;
          BOOL v30 = 0;
          int v18 = 0;
          uint64_t v21 = 1;
          int v26 = 1;
          int v27 = 1;
          switch(v28)
          {
            case 0:
              goto LABEL_43;
            case 1:
            case 13:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 2;
              goto LABEL_43;
            case 2:
            case 5:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 3;
              goto LABEL_43;
            case 3:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 5;
              goto LABEL_43;
            case 4:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 6;
              goto LABEL_43;
            case 6:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 4;
              goto LABEL_43;
            case 7:
              if (v25 == 8232) {
                goto LABEL_24;
              }
              goto LABEL_34;
            case 8:
              break;
            case 9:
              int v18 = 0;
              LODWORD(v21) = 1;
              if (v25 > 132)
              {
                if (v25 != 133)
                {
                  if (v25 == 8232)
                  {
LABEL_24:
                    int v18 = 1;
                    objc_msgSend(v55, "replaceCharactersInRange:withString:", v10, 1, @"\n", v49);
LABEL_39:
                    LODWORD(v21) = 1;
                    goto LABEL_12;
                  }
                  if (v25 != 8233) {
                    break;
                  }
                }
              }
              else if ((v25 - 10) >= 4)
              {
                break;
              }
LABEL_34:
              int v18 = 1;
              if (v25 == 13 && v20 <= v49)
              {
                if (AMPCFStringGetCharacterAtIndex(buffer, v20, 0) == 10)
                {
                  ++v19;
                  ++v20;
                }
                int v18 = 1;
                goto LABEL_39;
              }
              LODWORD(v21) = 1;
              break;
            case 10:
            case 18:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 13;
              goto LABEL_43;
            case 11:
            case 12:
            case 14:
            case 15:
            case 16:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 7;
              goto LABEL_43;
            case 17:
              int v29 = 0;
              BOOL v30 = 0;
              uint64_t v21 = 14;
              goto LABEL_43;
            case 19:
            case 20:
            case 21:
              BOOL v30 = v54 == 0;
              int v29 = 1;
              uint64_t v21 = 8;
              ++v54;
              goto LABEL_43;
            case 22:
              if (v54)
              {
                BOOL v30 = --v54 == 0;
              }
              else
              {
                uint64_t v54 = 0;
                BOOL v30 = 0;
              }
              int v29 = 1;
              uint64_t v21 = 9;
              goto LABEL_43;
            default:
              uint64_t v21 = 0;
              int v29 = 0;
              BOOL v30 = 0;
LABEL_43:
              v14 += v19;
              if (v54 || v30)
              {
                int v18 = 0;
                LODWORD(v21) = 0;
                v61 |= v15 != -1;
LABEL_48:
                int v26 = v29;
              }
              else
              {
                uint64_t v54 = 0;
                int v18 = 0;
                uint64_t v31 = v21;
                LODWORD(v21) = 0;
                int v26 = v29;
                int v27 = v29;
                switch(v31)
                {
                  case 0:
                  case 7:
                  case 13:
                  case 14:
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v54 = 0;
                    goto LABEL_12;
                  case 1:
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v54 = 0;
                    if (v15 == -1) {
                      uint64_t v15 = 0;
                    }
                    goto LABEL_12;
                  case 2:
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v54 = 0;
                    if (v15 == -1) {
                      uint64_t v15 = 1;
                    }
                    goto LABEL_12;
                  case 3:
                    if (v60 != 0x7FFFFFFFFFFFFFFFLL) {
                      goto LABEL_109;
                    }
                    if (v59 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      int v18 = 0;
                      LODWORD(v21) = 0;
                      uint64_t v54 = 0;
                      uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
                      uint64_t v60 = v10;
                      goto LABEL_48;
                    }
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v54 = 0;
                    int v26 = 1;
                    uint64_t v60 = v59;
                    break;
                  case 4:
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v54 = 0;
                    if (v60 == 0x7FFFFFFFFFFFFFFFLL) {
                      int v26 = 1;
                    }
                    else {
                      int v26 = v29;
                    }
                    break;
                  case 5:
                  case 6:
                    if (v60 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      int v18 = 0;
                      LODWORD(v21) = 0;
                      uint64_t v54 = 0;
                      uint64_t v48 = v59;
                      if (v59 == 0x7FFFFFFFFFFFFFFFLL) {
                        uint64_t v48 = v10;
                      }
                      uint64_t v59 = v48;
                      uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else
                    {
LABEL_109:
                      int v18 = 0;
                      LODWORD(v21) = 0;
                      uint64_t v54 = 0;
                    }
                    goto LABEL_48;
                  case 8:
                  case 9:
                  case 10:
                  case 11:
                  case 12:
                    goto LABEL_50;
                  default:
                    LODWORD(v21) = 0;
                    goto LABEL_48;
                }
              }
              int v27 = v29;
              break;
          }
        }
LABEL_50:
        int v24 = v21;
        LOBYTE(v21) = v26 != 0;
        BOOL v23 = v27 != 0;
        int64_t v10 = v20;
      }
      v13 += v19;
      uint64_t v32 = v58;
      if (v10 == v58)
      {
        int v18 = 1;
        uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v16 = v59;
        if ((v21 & (v59 != 0x7FFFFFFFFFFFFFFFLL)) != 0) {
          uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v33 = v60;
        if (v23 && v60 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v60 = v33;
        if (!v24) {
          goto LABEL_94;
        }
      }
      if (v15) {
        uint64_t v34 = v12;
      }
      else {
        uint64_t v34 = v12 + 1;
      }
      if (v15 == 1) {
        ++v11;
      }
      else {
        uint64_t v12 = v34;
      }
      if (((v14 != 0) & v61) == 1)
      {
        v35 = [NSNumber numberWithInteger:v15];
        v87[0] = v35;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:1];
        objc_msgSend(v55, "addAttribute:value:range:", v52, v36, v57, v14);
      }
      if (v18) {
        break;
      }
      uint64_t v14 = 0;
      unsigned __int8 v61 = 0;
      uint64_t v15 = -1;
      int64_t v57 = v10;
LABEL_94:
      if (v10 == v32)
      {
        id v4 = v53;
        v5 = v50;
        goto LABEL_115;
      }
    }
    if (v11 && (double)v11 / (double)(v11 + v12) >= 0.4)
    {
      if (defaultParagraphStyle_sOnceForRightToLeft != -1) {
        dispatch_once(&defaultParagraphStyle_sOnceForRightToLeft, &__block_literal_global_25_0);
      }
      uint64_t v39 = 1;
      v40 = &defaultParagraphStyle_defaultRTLParagraphStyleAttribute;
      v37 = v53;
      NSUInteger v38 = v56;
    }
    else if (v12 | v11)
    {
      v37 = v53;
      NSUInteger v38 = v56;
      if (defaultParagraphStyle_sOnceForLeftToRight != -1) {
        dispatch_once(&defaultParagraphStyle_sOnceForLeftToRight, &__block_literal_global_44);
      }
      uint64_t v39 = 0;
      v40 = &defaultParagraphStyle_defaultLTRParagraphStyleAttribute;
    }
    else
    {
      v37 = v53;
      NSUInteger v38 = v56;
      if (defaultParagraphStyle_sOnceForNatural != -1) {
        dispatch_once(&defaultParagraphStyle_sOnceForNatural, &__block_literal_global_23_1);
      }
      uint64_t v39 = -1;
      v40 = &defaultParagraphStyle_defaultNaturalParagraphStyleAttribute;
    }
    id v41 = (id)*v40;
    if (v37)
    {
      uint64_t v42 = v16;
      objc_msgSend(v37, "tv_paragraphStyleWithBaseWritingDirection:", v39);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      int v44 = 1;
LABEL_91:

      if (v44) {
        objc_msgSend(v55, "addAttribute:value:range:", v51, v43, v38, v13);
      }

      uint64_t v14 = 0;
      unsigned __int8 v61 = 0;
      NSUInteger v13 = 0;
      uint64_t v12 = 0;
      unint64_t v11 = 0;
      uint64_t v15 = -1;
      NSUInteger v56 = v10;
      int64_t v57 = v10;
      uint64_t v32 = v58;
      uint64_t v16 = v42;
      goto LABEL_94;
    }
    v86.location = 0;
    v86.length = 0;
    v45 = [v55 attribute:v51 atIndex:v38 effectiveRange:&v86];
    uint64_t v42 = v16;
    if (v45)
    {
      v88.location = v38;
      v88.length = v13;
      NSRange v46 = NSIntersectionRange(v86, v88);
      if (v46.location == v38 && v46.length == v13 && [v45 baseWritingDirection] == v39)
      {
        id v43 = v45;
        int v44 = 0;
LABEL_90:

        goto LABEL_91;
      }
      objc_msgSend(v45, "tv_paragraphStyleWithBaseWritingDirection:", v39, v49);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v47 = v41;
    }
    id v43 = v47;
    int v44 = 1;
    goto LABEL_90;
  }
LABEL_115:
}

@end