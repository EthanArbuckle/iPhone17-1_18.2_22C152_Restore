@interface NSMutableAttributedString(TFCoreAdditions)
- (void)tf_addLanguageAwareness:()TFCoreAdditions;
@end

@implementation NSMutableAttributedString(TFCoreAdditions)

- (void)tf_addLanguageAwareness:()TFCoreAdditions
{
  v114[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v77 = a1;
  v5 = [a1 string];
  uint64_t v6 = [(__CFString *)v5 length];
  if (v6)
  {
    uint64_t v7 = v6;
    v73 = v4;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v90 = 0u;
    v105 = v5;
    uint64_t v108 = 0;
    uint64_t v109 = v6;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v106 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    uint64_t v86 = 0;
    NSUInteger range2 = 0;
    int64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v74 = 0;
    NSUInteger v75 = 0;
    int v82 = 0;
    uint64_t v13 = 0;
    int64_t v78 = 0;
    uint64_t v80 = 0;
    unint64_t v70 = v7 - 1;
    v71 = v5;
    uint64_t v110 = 0;
    uint64_t v111 = 0;
    v107 = CStringPtr;
    uint64_t v76 = *MEMORY[0x263F1C2E0];
    uint64_t v72 = *MEMORY[0x263F1C268];
    uint64_t v81 = -1;
    uint64_t v85 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v15 = v7;
    uint64_t v79 = v7;
    while (1)
    {
      unint64_t v84 = v11;
      uint64_t v88 = 0;
      uint64_t CharacterAtIndex = TFAMPCFStringGetCharacterAtIndex(buffer, v10, &v88);
      int v17 = CharacterAtIndex;
      int v18 = 0;
      uint64_t v19 = v88;
      unint64_t v20 = v88 + v10;
      LODWORD(v21) = 1;
      BOOL v22 = (CharacterAtIndex - 8206) < 2 || CharacterAtIndex == 0;
      if (v22)
      {
        v10 += v88;
        BOOL v23 = 1;
        int v24 = 1;
      }
      else
      {
        if (CharacterAtIndex == 65532)
        {
LABEL_12:
          int v25 = 1;
          int v26 = 1;
        }
        else
        {
          int v27 = MEMORY[0x223CADD80](CharacterAtIndex);
          BOOL v28 = 0;
          int v18 = 0;
          uint64_t v21 = 1;
          int v25 = 1;
          int v26 = 1;
          switch(v27)
          {
            case 0:
              goto LABEL_34;
            case 1:
            case 13:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 2;
              goto LABEL_34;
            case 2:
            case 5:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 3;
              goto LABEL_34;
            case 3:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 5;
              goto LABEL_34;
            case 4:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 6;
              goto LABEL_34;
            case 6:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 4;
              goto LABEL_34;
            case 7:
              int v18 = 1;
              if (v17 == 13 && v20 <= v70)
              {
                int v29 = TFAMPCFStringGetCharacterAtIndex(buffer, v20, 0);
                int v18 = 1;
                LODWORD(v21) = 1;
                if (v29 == 10)
                {
                  ++v19;
                  ++v20;
                }
                int v25 = 1;
                int v26 = 1;
              }
              else
              {
                LODWORD(v21) = 1;
              }
              break;
            case 8:
            case 9:
              break;
            case 10:
            case 18:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 13;
              goto LABEL_34;
            case 11:
            case 12:
            case 14:
            case 15:
            case 16:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 7;
              goto LABEL_34;
            case 17:
              int v27 = 0;
              BOOL v28 = 0;
              uint64_t v21 = 14;
              goto LABEL_34;
            case 19:
            case 20:
            case 21:
              BOOL v28 = v74 == 0;
              int v27 = 1;
              uint64_t v21 = 8;
              ++v74;
              goto LABEL_34;
            case 22:
              if (v74)
              {
                BOOL v28 = --v74 == 0;
              }
              else
              {
                uint64_t v74 = 0;
                BOOL v28 = 0;
              }
              int v27 = 1;
              uint64_t v21 = 9;
              goto LABEL_34;
            default:
              uint64_t v21 = 0;
              int v27 = 0;
              BOOL v28 = 0;
LABEL_34:
              v13 += v19;
              if (!v74 && !v28)
              {
                uint64_t v74 = 0;
                int v18 = 0;
                uint64_t v30 = v21;
                LODWORD(v21) = 0;
                int v25 = v27;
                int v26 = v27;
                switch(v30)
                {
                  case 0:
                  case 7:
                  case 13:
                  case 14:
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v74 = 0;
                    goto LABEL_12;
                  case 1:
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v74 = 0;
                    BOOL v49 = 1;
                    int v50 = v82;
                    if ((unint64_t)(v81 + 1) >= 2) {
                      int v50 = 1;
                    }
                    int v82 = v50;
                    int v25 = 1;
                    int v26 = 1;
                    if ((unint64_t)(v81 + 1) < 2) {
                      BOOL v49 = 0;
                    }
                    goto LABEL_109;
                  case 2:
                    int v51 = v82;
                    if (v81 == 1) {
                      int v52 = v82;
                    }
                    else {
                      int v52 = 1;
                    }
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v74 = 0;
                    if (v81 != -1) {
                      int v51 = v52;
                    }
                    int v82 = v51;
                    int v25 = 1;
                    int v26 = 1;
                    BOOL v49 = v81 == -1 || v81 == 1;
LABEL_109:
                    uint64_t v81 = v49;
                    goto LABEL_41;
                  case 3:
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v74 = 0;
                    uint64_t v54 = v85;
                    uint64_t v53 = v86;
                    if (v85 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v53 = v80;
                      uint64_t v54 = v10;
                      int v55 = v27;
                    }
                    else
                    {
                      int v55 = 1;
                    }
                    uint64_t v56 = v83;
                    if (v83 == 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v57 = v53;
                    }
                    else {
                      uint64_t v57 = v80;
                    }
                    if (v83 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v56 = v54;
                      int v25 = v55;
                    }
                    else
                    {
                      int v25 = v27;
                    }
                    uint64_t v80 = v57 + v19;
                    uint64_t v83 = v56;
                    unint64_t v14 = v57 + v19 + v56 - 1;
                    goto LABEL_40;
                  case 4:
                    uint64_t v58 = v83;
                    BOOL v59 = v83 == 0x7FFFFFFFFFFFFFFFLL;
                    uint64_t v60 = v80;
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v74 = 0;
                    if (v83 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v60 = v19 + v80;
                    }
                    uint64_t v80 = v60;
                    if (v83 == 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    uint64_t v83 = v58;
                    if (v59) {
                      int v25 = 1;
                    }
                    else {
                      int v25 = v27;
                    }
                    goto LABEL_40;
                  case 5:
                    uint64_t v61 = v85;
                    uint64_t v62 = v86;
                    uint64_t v63 = v19 + v86;
                    BOOL v64 = v85 == 0x7FFFFFFFFFFFFFFFLL;
                    goto LABEL_132;
                  case 6:
                    uint64_t v61 = v85;
                    uint64_t v62 = v86;
                    BOOL v64 = v85 == 0x7FFFFFFFFFFFFFFFLL;
                    if (v85 == 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v65 = 0;
                    }
                    else {
                      uint64_t v65 = v19;
                    }
                    uint64_t v63 = v86 + v65;
LABEL_132:
                    if (v64) {
                      int64_t v66 = v10;
                    }
                    else {
                      int64_t v66 = v61;
                    }
                    uint64_t v67 = v80;
                    uint64_t v68 = v83;
                    BOOL v69 = v83 == 0x7FFFFFFFFFFFFFFFLL;
                    int v18 = 0;
                    LODWORD(v21) = 0;
                    uint64_t v74 = 0;
                    if (v83 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v67 = v19 + v80;
                    }
                    uint64_t v80 = v67;
                    if (v83 == 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v68 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    uint64_t v83 = v68;
                    if (v69)
                    {
                      uint64_t v62 = v63;
                      uint64_t v61 = v66;
                    }
                    uint64_t v85 = v61;
                    uint64_t v86 = v62;
                    goto LABEL_39;
                  case 8:
                  case 9:
                  case 10:
                  case 11:
                  case 12:
                    goto LABEL_41;
                  default:
                    LODWORD(v21) = 0;
                    goto LABEL_39;
                }
              }
              int v18 = 0;
              LODWORD(v21) = 0;
              v82 |= v81 != -1;
LABEL_39:
              int v25 = v27;
LABEL_40:
              int v26 = v27;
              break;
          }
        }
LABEL_41:
        int v24 = v21;
        LOBYTE(v21) = v25 != 0;
        BOOL v23 = v26 != 0;
        int64_t v10 = v20;
      }
      if (v10 == v15)
      {
        LOBYTE(v21) = 1;
        BOOL v23 = 1;
        int v31 = 1;
      }
      else
      {
        int v31 = v24;
      }
      if (v10 == v15) {
        int v32 = 1;
      }
      else {
        int v32 = v18;
      }
      uint64_t v33 = v85;
      BOOL v22 = (v21 & (v85 != 0x7FFFFFFFFFFFFFFFLL)) == 0;
      uint64_t v34 = v86;
      if (!v22)
      {
        uint64_t v34 = 0;
        uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v85 = v33;
      uint64_t v86 = v34;
      if (v23 && v83 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((v17 & 0x1FFFFE) != 0x200E)
        {
          if (v14 < v80 + v83 - 1) {
            uint64_t v35 = v14 - v83 + 1;
          }
          else {
            uint64_t v35 = v80;
          }
          v36 = [NSNumber numberWithInteger:0];
          v114[0] = v36;
          v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:1];
          objc_msgSend(v77, "addAttribute:value:range:", v76, v37, v83, v35);

          uint64_t v15 = v79;
        }
        uint64_t v80 = 0;
        unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
      }
      range2 += v19;
      if (v31)
      {
        unint64_t v11 = v84;
        if (v81 == 1)
        {
          unint64_t v11 = v84 + 1;
        }
        else if (!v81)
        {
          ++v12;
        }
        if (((v13 != 0) & v82) == 1)
        {
          v38 = objc_msgSend(NSNumber, "numberWithInteger:");
          v113 = v38;
          v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
          objc_msgSend(v77, "addAttribute:value:range:", v76, v39, v78, v13);

          uint64_t v15 = v79;
        }
        if (v32)
        {
          if (v11 && (double)v11 / (double)(v11 + v12) >= 0.4)
          {
            if (defaultParagraphStyle_sOnceForRightToLeft != -1) {
              dispatch_once(&defaultParagraphStyle_sOnceForRightToLeft, &__block_literal_global_8);
            }
            uint64_t v40 = 1;
            v41 = &defaultParagraphStyle_defaultRTLParagraphStyleAttribute;
          }
          else if (v12 | v11)
          {
            if (defaultParagraphStyle_sOnceForLeftToRight != -1) {
              dispatch_once(&defaultParagraphStyle_sOnceForLeftToRight, &__block_literal_global_4);
            }
            uint64_t v40 = 0;
            v41 = &defaultParagraphStyle_defaultLTRParagraphStyleAttribute;
          }
          else
          {
            if (defaultParagraphStyle_sOnceForNatural != -1) {
              dispatch_once(&defaultParagraphStyle_sOnceForNatural, &__block_literal_global_6);
            }
            uint64_t v40 = -1;
            v41 = &defaultParagraphStyle_defaultNaturalParagraphStyleAttribute;
          }
          id v42 = (id)*v41;
          if (v73)
          {
            objc_msgSend(v73, "tf_paragraphStyleWithBaseWritingDirection:", v40);
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            int v44 = 1;
LABEL_91:

            if (v44) {
              objc_msgSend(v77, "addAttribute:value:range:", v72, v43, v75, range2);
            }

            uint64_t v13 = 0;
            int v82 = 0;
            NSUInteger range2 = 0;
            uint64_t v12 = 0;
            unint64_t v11 = 0;
            uint64_t v81 = -1;
            int64_t v78 = v10;
            NSUInteger v75 = v10;
            uint64_t v15 = v79;
            goto LABEL_94;
          }
          unint64_t v45 = v14;
          v112.location = 0;
          v112.length = 0;
          v46 = [v77 attribute:v72 atIndex:v75 effectiveRange:&v112];
          if (v46)
          {
            v115.location = v75;
            v115.length = range2;
            NSRange v47 = NSIntersectionRange(v112, v115);
            if (v47.location == v75 && v47.length == range2 && [v46 baseWritingDirection] == v40)
            {
              id v43 = v46;
              int v44 = 0;
LABEL_90:

              unint64_t v14 = v45;
              goto LABEL_91;
            }
            objc_msgSend(v46, "tf_paragraphStyleWithBaseWritingDirection:", v40);
            id v48 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v48 = v42;
          }
          id v43 = v48;
          int v44 = 1;
          goto LABEL_90;
        }
        uint64_t v13 = 0;
        int v82 = 0;
        uint64_t v81 = -1;
        int64_t v78 = v10;
      }
      else
      {
        unint64_t v11 = v84;
      }
LABEL_94:
      if (v10 == v15)
      {
        id v4 = v73;
        v5 = v71;
        break;
      }
    }
  }
}

@end