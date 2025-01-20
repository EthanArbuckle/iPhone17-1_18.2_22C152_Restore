@interface UITextInputControllerTokenizer
@end

@implementation UITextInputControllerTokenizer

void __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 string];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v7 = [v6 beginningOfDocument];
  uint64_t v8 = [WeakRetained offsetFromPosition:v7 toPosition:*(void *)(a1 + 40)];

  CFIndex v9 = [(__CFString *)v4 length];
  if (*(uint64_t *)(a1 + 64) < 1)
  {
    CFIndex v14 = 0;
    goto LABEL_17;
  }
  uint64_t v102 = v8;
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v11 = [v10 positionFromPosition:*(void *)(a1 + 40) offset:-*(void *)(a1 + 64)];

  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v13 = [v12 positionFromPosition:*(void *)(a1 + 40) offset:*(void *)(a1 + 64)];

  if (v11)
  {
    if (v13) {
      goto LABEL_4;
    }
  }
  else
  {
    id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    v11 = [v25 beginningOfDocument];

    if (v13) {
      goto LABEL_4;
    }
  }
  id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v13 = [v26 endOfDocument];

LABEL_4:
  CFIndex v14 = 0;
  if (v11 && v13)
  {
    id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    v16 = [v15 textRangeFromPosition:v11 toPosition:v13];

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      id v101 = v3;
      id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      [v18 beginningOfDocument];
      v19 = v100 = v16;
      CFIndex v14 = [v17 offsetFromPosition:v19 toPosition:v11];

      id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      v22 = [v21 beginningOfDocument];
      uint64_t v23 = [v20 offsetFromPosition:v22 toPosition:v13];

      id v3 = v101;
      unint64_t v24 = [(__CFString *)v4 length];
      if (v23 - v14 >= v24) {
        CFIndex v9 = v24;
      }
      else {
        CFIndex v9 = v23 - v14;
      }
      v16 = v100;
    }
    else
    {
      CFIndex v14 = 0;
    }
  }
  uint64_t v8 = v102;
LABEL_17:
  uint64_t v27 = *(void *)(a1 + 32);
  if (v27)
  {
    uint64_t v28 = *(void *)(a1 + 72);
    uint64_t v29 = 1;
    if (v28 == 1) {
      uint64_t v29 = 2;
    }
    v30 = (CFIndex *)(v27 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v29]);
    CFIndex v31 = *v30;
    if (*v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      CFIndex v32 = v30[1] + v31;
      BOOL v33 = v14 >= v31 && v14 + v9 <= v32;
      if (!v33)
      {
        BOOL v43 = v28 == 1;
        uint64_t v34 = 6;
        if (v43) {
          uint64_t v34 = 5;
        }
        *(unsigned char *)(v27 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v34]) = 1;
      }
    }
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_29:
    *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = xmmword_186B93450;
    goto LABEL_121;
  }
  uint64_t v35 = *(void *)(a1 + 72);
  unsigned int v36 = 0x2000000;
  switch(v35)
  {
    case 0:
      *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = xmmword_186B93450;
      if (!*(unsigned char *)(a1 + 80))
      {
        uint64_t v39 = v8 - 1;
        if (v8 < 1) {
          goto LABEL_121;
        }
        v38 = v4;
        goto LABEL_113;
      }
      uint64_t v37 = v8 + 1;
      if (v8 + 1 < (unint64_t)[(__CFString *)v4 length])
      {
        v38 = v4;
        uint64_t v39 = v8 + 1;
LABEL_113:
        uint64_t v83 = [(__CFString *)v38 rangeOfComposedCharacterSequenceAtIndex:v39];
        uint64_t v84 = *(void *)(*(void *)(a1 + 56) + 8);
        *(void *)(v84 + 32) = v83;
        *(void *)(v84 + 40) = v85;
        goto LABEL_121;
      }
      if (v37 == [(__CFString *)v4 length])
      {
        uint64_t v99 = *(void *)(*(void *)(a1 + 56) + 8);
        *(void *)(v99 + 32) = v37;
        *(void *)(v99 + 40) = 0;
      }
      goto LABEL_121;
    case 1:
      goto LABEL_37;
    case 2:
      unsigned int v36 = 1;
      goto LABEL_37;
    case 3:
      unsigned int v36 = 2;
      goto LABEL_37;
    case 4:
      unsigned int v36 = 3;
LABEL_37:
      uint64_t v40 = *(void *)(a1 + 32);
      if (!v40) {
        goto LABEL_50;
      }
      uint64_t v41 = 3;
      if (v35 == 1) {
        uint64_t v41 = 4;
      }
      v42 = *(__CFStringTokenizer **)(v40 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v41]);
      if (v42) {
        BOOL v43 = v36 == *(_DWORD *)(v40 + 48);
      }
      else {
        BOOL v43 = 1;
      }
      if (!v43)
      {
        -[_UITextInputControllerTokenizer setTokenizer:forGranularity:](v40, 0, v35);
        goto LABEL_50;
      }
      if (!v42)
      {
LABEL_50:
        v111.CFIndex location = v14;
        v111.length = v9;
        v42 = CFStringTokenizerCreate(0, v4, v111, v36, 0);
        -[_UITextInputControllerTokenizer setTokenizer:forGranularity:](*(void *)(a1 + 32), (uint64_t)v42, *(void *)(a1 + 72));
        uint64_t v45 = *(void *)(a1 + 32);
        if (!v45 || *(void *)(a1 + 72) == 1)
        {
LABEL_54:
          if (v45)
          {
            uint64_t v46 = 6;
            if (*(void *)(a1 + 72) == 1) {
              uint64_t v46 = 5;
            }
            *(unsigned char *)(v45 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v46]) = 0;
            uint64_t v47 = *(void *)(a1 + 32);
            if (v47)
            {
              uint64_t v48 = 1;
              if (*(void *)(a1 + 72) == 1) {
                uint64_t v48 = 2;
              }
              v49 = (CFIndex *)(v47 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v48]);
              CFIndex *v49 = v14;
              v49[1] = v9;
            }
          }
          goto LABEL_61;
        }
        *(_DWORD *)(v45 + 48) = v36;
LABEL_53:
        uint64_t v45 = *(void *)(a1 + 32);
        goto LABEL_54;
      }
      uint64_t v44 = 6;
      if (v35 == 1) {
        uint64_t v44 = 5;
      }
      if (*(unsigned char *)(v40 + OBJC_IVAR____UITextInputControllerTokenizer__textInput[v44]))
      {
        v110.CFIndex location = v14;
        v110.length = v9;
        CFStringTokenizerSetString(v42, v4, v110);
        goto LABEL_53;
      }
LABEL_61:
      uint64_t v105 = 0;
      v106 = &v105;
      uint64_t v107 = 0x3010000000;
      v108 = &unk_186D7DBA7;
      long long v109 = xmmword_186B9D9A0;
      if (*(unsigned char *)(a1 + 80))
      {
        CFIndex v50 = v14 + v9;
        for (unint64_t i = v8; i < [(__CFString *)v4 length]; ++i)
        {
          CFStringTokenizerGoToTokenAtIndex(v42, i);
          CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v42);
          if (CurrentTokenRange.location == -1)
          {
            v63 = v106;
            v106[4] = -1;
            v61 = v63 + 4;
            v61[1] = CurrentTokenRange.length;
            v60 = v61 + 1;
          }
          else
          {
            if (CurrentTokenRange.location <= v14) {
              CFIndex location = v14;
            }
            else {
              CFIndex location = CurrentTokenRange.location;
            }
            CFIndex v54 = CurrentTokenRange.location + CurrentTokenRange.length;
            if (CurrentTokenRange.location + CurrentTokenRange.length >= v50) {
              CFIndex v54 = v50;
            }
            BOOL v55 = v54 <= location;
            CFIndex v56 = v54 - location;
            if (v55) {
              CFIndex v57 = 0;
            }
            else {
              CFIndex v57 = v56;
            }
            if (v55) {
              CFIndex v58 = 0;
            }
            else {
              CFIndex v58 = location;
            }
            v59 = v106;
            v106[5] = v57;
            v60 = v59 + 5;
            *(v60 - 1) = v58;
            v61 = v60 - 1;
            if (v58 != -1)
            {
              CFIndex v62 = v58 + v57;
              if (v62 > v8)
              {
                uint64_t v70 = *(void *)off_1E52D1F50;
                v104[0] = MEMORY[0x1E4F143A8];
                v104[1] = 3221225472;
                v104[2] = __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_2;
                v104[3] = &unk_1E530BC18;
                v104[4] = &v105;
                objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v70, v8, v62 - v8, 0, v104);
                break;
              }
            }
          }
          void *v61 = -1;
          void *v60 = 0;
        }
      }
      else
      {
        if (*(void *)(a1 + 72) == 3)
        {
          uint64_t v64 = v8;
          id v65 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
          uint64_t v66 = [v65 selectionAffinity];

          if (v66) {
            uint64_t v67 = -1;
          }
          else {
            uint64_t v67 = 0;
          }
          uint64_t v8 = v64;
        }
        else
        {
          uint64_t v67 = -1;
        }
        uint64_t v71 = v67 + v8;
        if (v67 + v8 >= 0)
        {
          CFIndex v72 = v14 + v9;
          CFIndex v73 = v67 + v8;
          do
          {
            CFStringTokenizerGoToTokenAtIndex(v42, v73);
            CFRange v74 = CFStringTokenizerGetCurrentTokenRange(v42);
            if (v74.location == -1)
            {
              v82 = v106;
              v106[4] = -1;
              v82[5] = v74.length;
            }
            else
            {
              if (v74.location <= v14) {
                CFIndex v75 = v14;
              }
              else {
                CFIndex v75 = v74.location;
              }
              CFIndex v76 = v74.location + v74.length;
              if (v74.location + v74.length >= v72) {
                CFIndex v76 = v72;
              }
              BOOL v77 = v76 <= v75;
              CFIndex v78 = v76 - v75;
              if (v77) {
                CFIndex v78 = 0;
              }
              if (v77) {
                CFIndex v79 = 0;
              }
              else {
                CFIndex v79 = v75;
              }
              v80 = v106;
              v106[4] = v79;
              v80[5] = v78;
              if (v79 != -1 && v71 >= v79)
              {
                uint64_t v86 = *(void *)off_1E52D1F50;
                v103[0] = MEMORY[0x1E4F143A8];
                v103[1] = 3221225472;
                v103[2] = __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_3;
                v103[3] = &unk_1E530BC18;
                v103[4] = &v105;
                objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v86, v79, v71 - v79, 2, v103);
                break;
              }
            }
            BOOL v33 = v73-- < 1;
          }
          while (!v33);
        }
      }
      v87 = v106;
      uint64_t v88 = v106[4];
      if (v88 == -1) {
        uint64_t v88 = 0x7FFFFFFFFFFFFFFFLL;
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v88;
      uint64_t v89 = v87[5];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v89;
      if (v89 >= 1)
      {
        v90 = [v3 string];
        v91 = objc_msgSend(v90, "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
        v92 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        uint64_t v93 = [v91 rangeOfCharacterFromSet:v92 options:4];
        uint64_t v95 = v94;

        uint64_t v96 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v97 = *(void *)(v96 + 32);
        if (v97 + v93 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v98 = *(void *)(v96 + 40);
          if (v97 + v93 + v95 == v98 + v97) {
            *(void *)(v96 + 40) = v98 - v95;
          }
        }
      }
      _Block_object_dispose(&v105, 8);
LABEL_121:

      return;
    case 5:
      uint64_t v68 = [(__CFString *)v4 length];
      uint64_t v69 = *(void *)(*(void *)(a1 + 56) + 8);
      *(void *)(v69 + 32) = 0;
      *(void *)(v69 + 40) = v68;
      goto LABEL_121;
    default:
      goto LABEL_29;
  }
}

void __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  if (v8)
  {
    id v10 = v8;
    BOOL v9 = [v8 embeddingType] == 1;
    id v8 = v10;
    if (v9)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a3
                                                                  - *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 32);
      *a5 = 1;
    }
  }
}

void __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if (v9)
  {
    id v13 = v9;
    BOOL v10 = [v9 embeddingType] == 1;
    id v9 = v13;
    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      unint64_t v12 = *(void *)(v11 + 32);
      if (a3 + a4 >= v12) {
        *(void *)(v11 + 40) = a3 + a4 - v12;
      }
      *a5 = 1;
    }
  }
}

@end