@interface NSLocale(isEqualToLocaleForWeather)
- (uint64_t)isEqualToLocaleForWeather:()isEqualToLocaleForWeather;
@end

@implementation NSLocale(isEqualToLocaleForWeather)

- (uint64_t)isEqualToLocaleForWeather:()isEqualToLocaleForWeather
{
  id v8 = a3;
  id v9 = [a1 localeIdentifier];
  id v101 = [v8 localeIdentifier];
  id v102 = v9;
  if (v9 == v101)
  {
    unint64_t v99 = 0;
    unint64_t v100 = 0;
    uint64_t v97 = 0;
    uint64_t v98 = 0;
    long long v103 = 0uLL;
    memset(v96, 0, sizeof(v96));
    memset(v95, 0, sizeof(v95));
    int v16 = 0;
    int v17 = 0;
    memset(v94, 0, sizeof(v94));
    int v18 = 0;
    int v19 = 0;
    int v20 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = [a1 localeIdentifier];
  uint64_t v4 = v10 != 0;
  v93 = (void *)v10;
  if (v10)
  {
    uint64_t v11 = [v8 localeIdentifier];
    if (v11)
    {
      v84 = (void *)v11;
      v12 = [a1 localeIdentifier];
      v75 = [v8 localeIdentifier];
      v76 = v12;
      if (objc_msgSend(v12, "isEqualToString:"))
      {
        uint64_t v3 = [a1 languageCode];
        uint64_t v13 = [v8 languageCode];
        v59 = (void *)v3;
        if (v3 == v13)
        {
          *(_DWORD *)&v94[24] = 1;
          *(_OWORD *)&v94[28] = 0uLL;
          uint64_t v98 = 0;
          unint64_t v99 = 0;
          long long v103 = 0uLL;
          uint64_t v97 = 0;
          memset(v96, 0, sizeof(v96));
          memset(v95, 0, sizeof(v95));
          int v16 = 0;
          int v17 = 0;
          memset(v94, 0, 24);
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          v58 = (void *)v3;
          unint64_t v100 = 0x100000001;
          goto LABEL_8;
        }
        v58 = (void *)v13;
        uint64_t v14 = 1;
        uint64_t v15 = 1;
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v14 = 1;
      }
    }
    else
    {
      v84 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  v5 = [a1 languageCode];
  uint64_t v3 = v5 != 0;
  unint64_t v100 = __PAIR64__(v14, v15);
  v92 = v5;
  if (v5)
  {
    uint64_t v22 = [v8 languageCode];
    if (v22)
    {
      v82 = (void *)v22;
      v23 = [a1 languageCode];
      v73 = [v8 languageCode];
      v74 = v23;
      if (objc_msgSend(v23, "isEqualToString:"))
      {
        uint64_t v6 = [a1 countryCode];
        uint64_t v24 = [v8 countryCode];
        v57 = (void *)v6;
        if (v6 == v24)
        {
          *(_DWORD *)&v94[24] = v4;
          *(_DWORD *)&v94[28] = 1;
          long long v103 = 0uLL;
          uint64_t v97 = 0;
          memset(v96, 0, sizeof(v96));
          memset(v95, 0, sizeof(v95));
          *(void *)&v94[32] = 0;
          int v16 = 0;
          *(_DWORD *)&v94[40] = 0;
          int v17 = 0;
          memset(v94, 0, 24);
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          unint64_t v99 = 0x100000001;
          v56 = (void *)v6;
          uint64_t v98 = 1;
          goto LABEL_8;
        }
        v56 = (void *)v24;
        uint64_t v6 = 1;
        LODWORD(v98) = 1;
      }
      else
      {
        LODWORD(v98) = 0;
        uint64_t v6 = 1;
      }
    }
    else
    {
      v82 = 0;
      uint64_t v6 = 0;
      LODWORD(v98) = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
    LODWORD(v98) = 0;
  }
  v91 = [a1 countryCode];
  unint64_t v99 = __PAIR64__(v3, v6);
  HIDWORD(v103) = v91 != 0;
  *(_DWORD *)&v94[24] = v4;
  if (v91)
  {
    uint64_t v25 = [v8 countryCode];
    if (v25)
    {
      v81 = (void *)v25;
      v26 = [a1 countryCode];
      v70 = [v8 countryCode];
      v71 = v26;
      if (objc_msgSend(v26, "isEqualToString:"))
      {
        uint64_t v4 = [a1 scriptCode];
        uint64_t v27 = [v8 scriptCode];
        v55 = (void *)v4;
        if (v4 == v27)
        {
          *(_DWORD *)&v94[28] = 1;
          *(void *)((char *)&v103 + 4) = 0;
          memset(v96, 0, sizeof(v96));
          memset(v95, 0, sizeof(v95));
          *(void *)&v94[32] = 0;
          int v16 = 0;
          LODWORD(v103) = 0;
          *(_DWORD *)&v94[40] = 0;
          int v17 = 0;
          memset(v94, 0, 20);
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          *(_DWORD *)&v94[20] = 1;
          HIDWORD(v103) = 1;
          HIDWORD(v98) = 1;
          v54 = (void *)v4;
          uint64_t v97 = 1;
          goto LABEL_8;
        }
        v54 = (void *)v27;
        uint64_t v4 = 1;
        LODWORD(v97) = 1;
      }
      else
      {
        LODWORD(v97) = 0;
        uint64_t v4 = 1;
      }
    }
    else
    {
      v81 = 0;
      uint64_t v4 = 0;
      LODWORD(v97) = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
    LODWORD(v97) = 0;
  }
  v90 = [a1 scriptCode];
  HIDWORD(v98) = v4;
  DWORD2(v103) = v90 != 0;
  if (v90)
  {
    uint64_t v28 = [v8 scriptCode];
    if (v28)
    {
      v80 = (void *)v28;
      v29 = [a1 scriptCode];
      v68 = [v8 scriptCode];
      v69 = v29;
      if (objc_msgSend(v29, "isEqualToString:"))
      {
        uint64_t v3 = [a1 calendarIdentifier];
        uint64_t v30 = [v8 calendarIdentifier];
        v53 = (void *)v3;
        if (v3 == v30)
        {
          *(_DWORD *)&v94[28] = 1;
          *(void *)&v94[8] = 0;
          HIDWORD(v97) = 0;
          memset(v95, 0, sizeof(v95));
          *(void *)&long long v103 = 0;
          *(void *)&v94[32] = 0;
          int v16 = 0;
          *(_DWORD *)&v94[40] = 0;
          int v17 = 0;
          *(void *)v94 = 0;
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          *(void *)&v94[16] = 0x100000001;
          DWORD2(v103) = 1;
          *(void *)&v96[4] = 1;
          v52 = (void *)v3;
          *(_DWORD *)v96 = 1;
          goto LABEL_8;
        }
        v52 = (void *)v30;
        *(void *)v96 = 0x100000001;
      }
      else
      {
        *(void *)v96 = 0x100000000;
      }
    }
    else
    {
      v80 = 0;
      *(void *)v96 = 0;
    }
  }
  else
  {
    *(void *)v96 = 0;
  }
  uint64_t v31 = [a1 calendarIdentifier];
  uint64_t v3 = v31 != 0;
  v89 = (void *)v31;
  if (v31)
  {
    uint64_t v32 = [v8 calendarIdentifier];
    if (v32)
    {
      v79 = (void *)v32;
      uint64_t v15 = [a1 calendarIdentifier];
      v66 = [v8 calendarIdentifier];
      v67 = (void *)v15;
      if (objc_msgSend((id)v15, "isEqualToString:"))
      {
        uint64_t v15 = [a1 decimalSeparator];
        uint64_t v33 = [v8 decimalSeparator];
        if (v15 == v33)
        {
          *(_DWORD *)&v94[28] = 1;
          *(void *)&v94[4] = 0;
          *(void *)&long long v103 = 0;
          *(_DWORD *)&v96[8] = 0;
          *(void *)&v94[32] = 0;
          int v16 = 0;
          *(_DWORD *)&v94[40] = 0;
          v44 = (void *)v15;
          int v17 = 0;
          *(_DWORD *)v94 = 0;
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          *(_DWORD *)&v94[16] = 1;
          *(_DWORD *)&v94[20] = 1;
          *(_DWORD *)&v94[12] = 1;
          HIDWORD(v97) = 1;
          *(void *)&v95[4] = 1;
          v88 = v44;
          v51 = v44;
          *(_DWORD *)v95 = 1;
          goto LABEL_8;
        }
        v51 = (void *)v33;
        *(void *)v95 = 0x100000001;
      }
      else
      {
        *(void *)v95 = 0x100000000;
      }
    }
    else
    {
      v79 = 0;
      *(void *)v95 = 0;
    }
  }
  else
  {
    *(void *)v95 = 0;
  }
  v87 = [a1 decimalSeparator];
  HIDWORD(v97) = v3;
  DWORD1(v103) = v87 != 0;
  v88 = (void *)v15;
  if (v87)
  {
    uint64_t v34 = [v8 decimalSeparator];
    if (v34)
    {
      v78 = (void *)v34;
      uint64_t v14 = [a1 decimalSeparator];
      v64 = [v8 decimalSeparator];
      v65 = (void *)v14;
      if (objc_msgSend((id)v14, "isEqualToString:"))
      {
        uint64_t v14 = [a1 groupingSeparator];
        uint64_t v35 = [v8 groupingSeparator];
        if (v14 == v35)
        {
          *(_DWORD *)&v94[28] = 1;
          v45 = (void *)v14;
          int v16 = 0;
          *(void *)&v94[36] = 0;
          int v17 = 0;
          *(_DWORD *)&v95[8] = 0;
          *(void *)v94 = 0;
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          *(void *)&v94[16] = 0x100000001;
          *(void *)&v94[8] = 0x100000001;
          *(void *)&long long v103 = 0x100000000;
          *(_DWORD *)&v96[8] = 1;
          v86 = v45;
          v50 = v45;
          *(_DWORD *)&v94[32] = 1;
          goto LABEL_8;
        }
        v50 = (void *)v35;
        uint64_t v4 = 1;
        *(_DWORD *)&v94[32] = 1;
      }
      else
      {
        *(_DWORD *)&v94[32] = 0;
        uint64_t v4 = 1;
      }
    }
    else
    {
      v78 = 0;
      uint64_t v4 = 0;
      *(_DWORD *)&v94[32] = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
    *(_DWORD *)&v94[32] = 0;
  }
  uint64_t v36 = [a1 groupingSeparator];
  LODWORD(v103) = v36 != 0;
  v85 = (void *)v36;
  *(_DWORD *)&v96[8] = v4;
  v86 = (void *)v14;
  if (v36)
  {
    uint64_t v37 = [v8 groupingSeparator];
    if (v37)
    {
      v77 = (void *)v37;
      v38 = [a1 groupingSeparator];
      v62 = [v8 groupingSeparator];
      v63 = v38;
      if (objc_msgSend(v38, "isEqualToString:"))
      {
        uint64_t v6 = [a1 quotationBeginDelimiter];
        uint64_t v39 = [v8 quotationBeginDelimiter];
        v49 = (void *)v6;
        if (v6 == v39)
        {
          *(_DWORD *)&v94[28] = 1;
          int v17 = 0;
          *(_DWORD *)&v95[8] = 0;
          *(void *)v94 = 0;
          int v18 = 0;
          int v19 = 0;
          int v20 = 0;
          *(_DWORD *)&v94[16] = 1;
          *(_DWORD *)&v94[20] = 1;
          *(_DWORD *)&v94[8] = 1;
          *(_DWORD *)&v94[12] = 1;
          int v16 = 1;
          LODWORD(v103) = 1;
          *(_DWORD *)&v94[40] = 1;
          v48 = (void *)v6;
          *(_DWORD *)&v94[36] = 1;
          goto LABEL_8;
        }
        v48 = (void *)v39;
        *(_DWORD *)&v94[36] = 1;
        *(_DWORD *)&v94[40] = 1;
      }
      else
      {
        *(_DWORD *)&v94[36] = 0;
        *(_DWORD *)&v94[40] = 1;
      }
    }
    else
    {
      v77 = 0;
      *(void *)&v94[36] = 0;
    }
  }
  else
  {
    *(void *)&v94[36] = 0;
  }
  uint64_t v6 = [a1 quotationBeginDelimiter];
  v83 = (void *)v6;
  if (v6)
  {
    uint64_t v40 = [v8 quotationBeginDelimiter];
    if (v40)
    {
      v72 = (void *)v40;
      v41 = [a1 quotationBeginDelimiter];
      v60 = [v8 quotationBeginDelimiter];
      v61 = v41;
      if (objc_msgSend(v41, "isEqualToString:"))
      {
        v5 = [a1 quotationEndDelimiter];
        uint64_t v42 = [v8 quotationEndDelimiter];
        v47 = v5;
        if (v5 != (void *)v42)
        {
          *(void *)v94 = 0x100000001;
          objc_msgSend(a1, "quotationEndDelimiter", v42, v5, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59);
          goto LABEL_69;
        }
        *(_DWORD *)&v94[28] = 1;
        int v18 = 0;
        int v19 = 0;
        int v20 = 0;
        *(_DWORD *)&v94[16] = 1;
        *(_DWORD *)&v94[20] = 1;
        *(_DWORD *)&v94[8] = 1;
        *(_DWORD *)&v94[12] = 1;
        int v16 = 1;
        int v17 = 1;
        *(_DWORD *)&v95[8] = 1;
        *(_DWORD *)&v94[4] = 1;
        v46 = v5;
        *(_DWORD *)v94 = 1;
LABEL_8:
        uint64_t v21 = 1;
        goto LABEL_75;
      }
      *(void *)v94 = 0x100000000;
    }
    else
    {
      v72 = 0;
      *(void *)v94 = 0;
    }
  }
  else
  {
    *(void *)v94 = 0;
  }
  objc_msgSend(a1, "quotationEndDelimiter", v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59);
  v5 = LABEL_69:;
  *(_DWORD *)&v95[8] = v6 != 0;
  if (v5)
  {
    uint64_t v6 = [v8 quotationEndDelimiter];
    if (v6)
    {
      uint64_t v4 = [a1 quotationEndDelimiter];
      uint64_t v3 = [v8 quotationEndDelimiter];
      uint64_t v21 = [(id)v4 isEqualToString:v3];
      int v20 = 1;
    }
    else
    {
      int v20 = 0;
      uint64_t v21 = 0;
    }
    *(_DWORD *)&v94[28] = 1;
    *(void *)&v94[16] = 0x100000001;
    *(void *)&v94[8] = 0x100000001;
    int v16 = 1;
    int v17 = 1;
    int v18 = 1;
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
    int v20 = 0;
    uint64_t v21 = 0;
    *(_DWORD *)&v94[28] = 1;
    *(void *)&v94[16] = 0x100000001;
    *(void *)&v94[8] = 0x100000001;
    int v16 = 1;
    int v17 = 1;
    int v18 = 1;
  }
LABEL_75:
  if (v20)
  {
  }
  if (v19) {

  }
  if (v18) {
  if (*(_DWORD *)v94)
  }
  {
  }
  if (*(_DWORD *)&v94[4])
  {
  }
  if (*(_DWORD *)&v95[8]) {

  }
  if (v17) {
  if (*(_DWORD *)&v94[36])
  }
  {
  }
  if (*(_DWORD *)&v94[40])
  {
  }
  if (v103) {

  }
  if (v16) {
  if (*(_DWORD *)&v94[32])
  }
  {
  }
  if (*(_DWORD *)&v96[8])
  {
  }
  if (DWORD1(v103)) {

  }
  if (*(_DWORD *)&v94[8]) {
  if (*(_DWORD *)v95)
  }
  {
  }
  if (*(_DWORD *)&v95[4])
  {
  }
  if (HIDWORD(v97)) {

  }
  if (*(_DWORD *)&v94[12]) {
  if (*(_DWORD *)v96)
  }
  {
  }
  if (*(_DWORD *)&v96[4])
  {
  }
  if (DWORD2(v103)) {

  }
  if (*(_DWORD *)&v94[16]) {
  if (v97)
  }
  {
  }
  if (HIDWORD(v98))
  {
  }
  if (HIDWORD(v103)) {

  }
  if (*(_DWORD *)&v94[20])
  {

    if (!v98) {
      goto LABEL_129;
    }
  }
  else if (!v98)
  {
LABEL_129:
    if (v99) {
      goto LABEL_130;
    }
LABEL_134:
    if (!HIDWORD(v99)) {
      goto LABEL_136;
    }
    goto LABEL_135;
  }

  if (!v99) {
    goto LABEL_134;
  }
LABEL_130:

  if (HIDWORD(v99)) {
LABEL_135:
  }

LABEL_136:
  if (*(_DWORD *)&v94[28])
  {

    if (!v100) {
      goto LABEL_138;
    }
  }
  else if (!v100)
  {
LABEL_138:
    if (!HIDWORD(v100)) {
      goto LABEL_140;
    }
    goto LABEL_139;
  }

  if (HIDWORD(v100))
  {
LABEL_139:
  }
LABEL_140:
  if (*(_DWORD *)&v94[24]) {

  }
  if (v102 != v101) {
  return v21;
  }
}

@end