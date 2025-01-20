@interface DOMAttr
- (BOOL)isId;
- (BOOL)specified;
- (DOMCSSStyleDeclaration)style;
- (DOMElement)ownerElement;
- (NSString)name;
- (NSString)value;
- (void)setValue:(NSString *)value;
@end

@implementation DOMAttr

- (NSString)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v127);
  uint64_t v4 = *((void *)self->super.super._internal + 12);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    *(_DWORD *)v5 += 2;
    uint64_t v6 = *(void *)(v4 + 24);
    if (v6)
    {
      int v7 = *(_DWORD *)(v6 + 4);
      *(_DWORD *)v6 += 2;
      if (v7 < 0) {
        goto LABEL_156;
      }
      int v8 = *(_DWORD *)(v5 + 4);
      BOOL v9 = __OFADD__(v7, 1);
      int v10 = v7 + 1;
      BOOL v11 = v9;
      if (v8 < 0) {
        goto LABEL_156;
      }
    }
    else
    {
      int v8 = *(_DWORD *)(v5 + 4);
      int v10 = 1;
      BOOL v11 = 0;
      if (v8 < 0) {
        goto LABEL_156;
      }
    }
    if (v11) {
      goto LABEL_156;
    }
    uint64_t v12 = (v8 + v10);
    if (__OFADD__(v8, v10)) {
      goto LABEL_156;
    }
    int v13 = *(_DWORD *)(v5 + 16);
    if (v6) {
      BOOL v14 = (*(_DWORD *)(v5 + 16) & 4) == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14) {
      LOBYTE(v13) = *(unsigned char *)(v6 + 16);
    }
    if ((v13 & 4) == 0)
    {
      if (v12 <= 0x7FFFFFEF)
      {
        WTF::tryFastCompactMalloc((WTF *)(2 * v12 + 20));
        v15 = v128;
        if (v128)
        {
          v16 = v128 + 5;
          _DWORD *v128 = 2;
          v15[1] = v12;
          *((void *)v15 + 1) = v15 + 5;
          v15[4] = 0;
          v17 = *(_WORD **)(v5 + 8);
          uint64_t v18 = *(unsigned int *)(v5 + 4);
          if ((*(unsigned char *)(v5 + 16) & 4) == 0)
          {
            if (v18)
            {
              if (v18 == 1) {
                _WORD *v16 = *v17;
              }
              else {
                memcpy(v15 + 5, v17, 2 * v18);
              }
            }
            goto LABEL_65;
          }
          v25 = &v16[v18];
          if (v18 < 0x40)
          {
            unint64_t v26 = (unint64_t)(v15 + 5);
            if (v16 == v25)
            {
LABEL_65:
              uint64_t v49 = *(unsigned int *)(v5 + 4);
              v50 = &v16[v49];
              _WORD *v50 = 58;
              unint64_t v51 = (unint64_t)(v50 + 1);
              if (v6)
              {
                v17 = *(_WORD **)(v6 + 8);
                uint64_t v52 = *(unsigned int *)(v6 + 4);
                if ((*(unsigned char *)(v6 + 16) & 4) == 0)
                {
                  if (v52)
                  {
                    if (v52 == 1)
                    {
                      *(_WORD *)unint64_t v51 = *v17;
                      int v53 = *(_DWORD *)v6 - 2;
                      if (*(_DWORD *)v6 == 2) {
                        goto LABEL_111;
                      }
                      goto LABEL_106;
                    }
                    size_t v68 = 2 * v52;
                    goto LABEL_110;
                  }
                  goto LABEL_105;
                }
                v54 = (_WORD *)(v51 + 2 * v52);
                if (v52 >= 0x40)
                {
                  unint64_t v55 = v51 + 2 * (v52 & 0xFFFFFFC0);
                  long long v56 = 0uLL;
                  do
                  {
                    v130.val[0] = *(int8x16_t *)v17;
                    int8x16_t v57 = *((int8x16_t *)v17 + 1);
                    v132.val[0] = (int8x16_t)*((_OWORD *)v17 + 2);
                    long long v58 = *((_OWORD *)v17 + 3);
                    v17 += 32;
                    long long v59 = v58;
                    v132.val[1] = 0uLL;
                    v134.val[0] = v57;
                    v130.val[1] = 0uLL;
                    v60 = (char *)v51;
                    vst2q_s8(v60, v130);
                    v60 += 32;
                    v134.val[1] = 0uLL;
                    vst2q_s8(v60, v134);
                    v61 = (char *)(v51 + 64);
                    vst2q_s8(v61, v132);
                    v62 = (char *)(v51 + 96);
                    vst2q_s8(v62, *(int8x16x2_t *)(&v56 - 1));
                    v51 += 128;
                  }
                  while (v51 != v55);
                  unint64_t v51 = v55;
                }
                if ((_WORD *)v51 != v54)
                {
                  unint64_t v63 = (unint64_t)v15 + 2 * v49 + 2 * v52 - v51 + 20;
                  if (v63 < 0xE
                    || v51 < (unint64_t)v17 + (v63 >> 1) + 1
                    && (unint64_t)v17 < (v63 & 0xFFFFFFFFFFFFFFFELL) + v51 + 2)
                  {
                    v64 = (_WORD *)v51;
                    v65 = (unsigned __int8 *)v17;
                    goto LABEL_80;
                  }
                  uint64_t v83 = (v63 >> 1) + 1;
                  if (v63 >= 0x3E)
                  {
                    unint64_t v84 = v83 & 0xFFFFFFFFFFFFFFE0;
                    v117 = (uint8x8_t *)(v17 + 8);
                    v118 = (uint16x8_t *)(v51 + 32);
                    unint64_t v119 = v83 & 0xFFFFFFFFFFFFFFE0;
                    do
                    {
                      uint8x16_t v120 = *(uint8x16_t *)v117[-2].i8;
                      uint16x8_t v121 = vmovl_u8(*v117);
                      uint16x8_t v122 = vmovl_high_u8(*(uint8x16_t *)v117->i8);
                      v118[-2] = vmovl_u8(*(uint8x8_t *)v120.i8);
                      v118[-1] = vmovl_high_u8(v120);
                      uint16x8_t *v118 = v121;
                      v118[1] = v122;
                      v118 += 4;
                      v117 += 4;
                      v119 -= 32;
                    }
                    while (v119);
                    if (v83 == v84) {
                      goto LABEL_104;
                    }
                    if ((v83 & 0x18) == 0)
                    {
                      v65 = (unsigned __int8 *)v17 + v84;
                      v64 = (_WORD *)(v51 + 2 * v84);
                      do
                      {
LABEL_80:
                        __int16 v66 = *v65++;
                        *v64++ = v66;
                      }
                      while (v64 != v54);
                      goto LABEL_104;
                    }
                  }
                  else
                  {
                    unint64_t v84 = 0;
                  }
                  v64 = (_WORD *)(v51 + 2 * (v83 & 0xFFFFFFFFFFFFFFF8));
                  v65 = (unsigned __int8 *)v17 + (v83 & 0xFFFFFFFFFFFFFFF8);
                  v123 = (uint8x8_t *)((char *)v17 + v84);
                  v124 = (uint16x8_t *)(v51 + 2 * v84);
                  unint64_t v125 = v84 - (v83 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    uint8x8_t v126 = *v123++;
                    *v124++ = vmovl_u8(v126);
                    v125 += 8;
                  }
                  while (v125);
                  if (v83 != (v83 & 0xFFFFFFFFFFFFFFF8)) {
                    goto LABEL_80;
                  }
                }
              }
LABEL_104:
              if (!v6) {
                goto LABEL_107;
              }
              goto LABEL_105;
            }
          }
          else
          {
            unint64_t v26 = (unint64_t)&v16[v18 & 0xFFFFFFC0];
            long long v27 = 0uLL;
            v28 = (char *)(v15 + 5);
            do
            {
              v129.val[0] = *(int8x16_t *)v17;
              int8x16_t v29 = *((int8x16_t *)v17 + 1);
              v131.val[0] = (int8x16_t)*((_OWORD *)v17 + 2);
              long long v30 = *((_OWORD *)v17 + 3);
              v17 += 32;
              long long v31 = v30;
              v131.val[1] = 0uLL;
              v133.val[0] = v29;
              v129.val[1] = 0uLL;
              v32 = v28;
              vst2q_s8(v32, v129);
              v32 += 32;
              v133.val[1] = 0uLL;
              vst2q_s8(v32, v133);
              v33 = v28 + 64;
              vst2q_s8(v33, v131);
              v34 = v28 + 96;
              vst2q_s8(v34, *(int8x16x2_t *)(&v27 - 1));
              v28 += 128;
            }
            while (v28 != (char *)v26);
            if ((_WORD *)v26 == v25) {
              goto LABEL_65;
            }
          }
          unint64_t v39 = (unint64_t)v15 + 2 * v18 - v26 + 18;
          if (v39 < 0xE
            || (v26 < (unint64_t)v17 + (v39 >> 1) + 1
              ? (BOOL v40 = (unint64_t)v17 >= (v39 & 0xFFFFFFFFFFFFFFFELL) + v26 + 2)
              : (BOOL v40 = 1),
                !v40))
          {
            v46 = (_WORD *)v26;
            v47 = (unsigned __int8 *)v17;
            goto LABEL_62;
          }
          uint64_t v41 = (v39 >> 1) + 1;
          if (v39 >= 0x3E)
          {
            unint64_t v42 = v41 & 0xFFFFFFFFFFFFFFE0;
            v96 = (uint8x8_t *)(v17 + 8);
            v97 = (uint16x8_t *)(v26 + 32);
            unint64_t v98 = v41 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              uint8x16_t v99 = *(uint8x16_t *)v96[-2].i8;
              uint16x8_t v100 = vmovl_u8(*v96);
              uint16x8_t v101 = vmovl_high_u8(*(uint8x16_t *)v96->i8);
              v97[-2] = vmovl_u8(*(uint8x8_t *)v99.i8);
              v97[-1] = vmovl_high_u8(v99);
              uint16x8_t *v97 = v100;
              v97[1] = v101;
              v97 += 4;
              v96 += 4;
              v98 -= 32;
            }
            while (v98);
            if (v41 == v42) {
              goto LABEL_65;
            }
            if ((v41 & 0x18) == 0)
            {
              v47 = (unsigned __int8 *)v17 + v42;
              v46 = (_WORD *)(v26 + 2 * v42);
              do
              {
LABEL_62:
                __int16 v48 = *v47++;
                *v46++ = v48;
              }
              while (v46 != v25);
              goto LABEL_65;
            }
          }
          else
          {
            unint64_t v42 = 0;
          }
          v46 = (_WORD *)(v26 + 2 * (v41 & 0xFFFFFFFFFFFFFFF8));
          v47 = (unsigned __int8 *)v17 + (v41 & 0xFFFFFFFFFFFFFFF8);
          v102 = (uint8x8_t *)((char *)v17 + v42);
          v103 = (uint16x8_t *)(v26 + 2 * v42);
          unint64_t v104 = v42 - (v41 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint8x8_t v105 = *v102++;
            *v103++ = vmovl_u8(v105);
            v104 += 8;
          }
          while (v104);
          if (v41 == (v41 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_65;
          }
          goto LABEL_62;
        }
      }
LABEL_156:
      __break(0xC471u);
      JUMPOUT(0x1E13677ACLL);
    }
    if ((v12 & 0x80000000) != 0) {
      goto LABEL_156;
    }
    WTF::tryFastCompactMalloc((WTF *)(v12 + 20));
    v15 = v128;
    if (!v128) {
      goto LABEL_156;
    }
    v19 = v128 + 5;
    _DWORD *v128 = 2;
    v15[1] = v12;
    *((void *)v15 + 1) = v15 + 5;
    v15[4] = 4;
    v17 = *(_WORD **)(v5 + 8);
    size_t v20 = *(unsigned int *)(v5 + 4);
    if ((*(unsigned char *)(v5 + 16) & 4) != 0)
    {
      if (v20)
      {
        if (v20 == 1) {
          unsigned char *v19 = *(unsigned char *)v17;
        }
        else {
          memcpy(v15 + 5, v17, v20);
        }
      }
      goto LABEL_83;
    }
    v21 = &v19[v20];
    if (v20 < 0x10)
    {
      unint64_t v22 = (unint64_t)(v15 + 5);
      if (v19 == v21)
      {
LABEL_83:
        uint64_t v67 = *(unsigned int *)(v5 + 4);
        v19[v67] = 58;
        unint64_t v51 = (unint64_t)&v19[v67 + 1];
        if (!v6) {
          goto LABEL_104;
        }
        v17 = *(_WORD **)(v6 + 8);
        size_t v68 = *(unsigned int *)(v6 + 4);
        if ((*(unsigned char *)(v6 + 16) & 4) != 0)
        {
          if (v68)
          {
            if (v68 == 1)
            {
              *(unsigned char *)unint64_t v51 = *(unsigned char *)v17;
              int v53 = *(_DWORD *)v6 - 2;
              if (*(_DWORD *)v6 == 2)
              {
LABEL_111:
                WTF::StringImpl::destroy((WTF::StringImpl *)v6, (StringImpl *)v17);
                int v80 = *(_DWORD *)v5 - 2;
                if (*(_DWORD *)v5 == 2) {
                  goto LABEL_112;
                }
                goto LABEL_108;
              }
              goto LABEL_106;
            }
LABEL_110:
            memcpy((void *)v51, v17, v68);
            int v53 = *(_DWORD *)v6 - 2;
            if (*(_DWORD *)v6 == 2) {
              goto LABEL_111;
            }
            goto LABEL_106;
          }
LABEL_105:
          int v53 = *(_DWORD *)v6 - 2;
          if (*(_DWORD *)v6 == 2) {
            goto LABEL_111;
          }
LABEL_106:
          *(_DWORD *)uint64_t v6 = v53;
LABEL_107:
          int v80 = *(_DWORD *)v5 - 2;
          if (*(_DWORD *)v5 == 2)
          {
LABEL_112:
            WTF::StringImpl::destroy((WTF::StringImpl *)v5, (StringImpl *)v17);
            goto LABEL_113;
          }
LABEL_108:
          *(_DWORD *)uint64_t v5 = v80;
          goto LABEL_113;
        }
        v69 = (unsigned char *)(v51 + v68);
        if (v68 >= 0x10)
        {
          unint64_t v70 = v51 + (v68 & 0xFFFFFFF0);
          do
          {
            unsigned long long v71 = (unsigned __int128)vld2q_s8((const char *)v17);
            v17 += 16;
            *(_OWORD *)unint64_t v51 = v71;
            v51 += 16;
          }
          while (v51 != v70);
          unint64_t v51 = v70;
        }
        if ((unsigned char *)v51 == v69) {
          goto LABEL_104;
        }
        size_t v72 = (size_t)v15 + v67 + v68;
        unint64_t v73 = v72 - v51 + 21;
        if (v73 < 8
          || ((unint64_t v74 = (unint64_t)v15 + v68 + v67 + 21, v51 < (unint64_t)&v17[v72 - v51 + 21])
            ? (BOOL v75 = (unint64_t)v17 >= v74)
            : (BOOL v75 = 1),
              !v75))
        {
          v77 = (unsigned char *)v51;
          v78 = (char *)v17;
          goto LABEL_103;
        }
        if (v73 >= 0x20)
        {
          unint64_t v76 = v73 & 0xFFFFFFFFFFFFFFE0;
          v106 = (int8x16_t *)(v17 + 16);
          v107 = (int8x16_t *)(v51 + 16);
          unint64_t v108 = v73 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            int8x16_t v110 = v106[-2];
            int8x16_t v109 = v106[-1];
            int8x16_t v112 = *v106;
            int8x16_t v111 = v106[1];
            v106 += 4;
            v107[-1] = vuzp1q_s8(v110, v109);
            int8x16_t *v107 = vuzp1q_s8(v112, v111);
            v107 += 2;
            v108 -= 32;
          }
          while (v108);
          if (v73 == v76) {
            goto LABEL_104;
          }
          if ((v73 & 0x18) == 0)
          {
            v78 = (char *)&v17[v76];
            v77 = (unsigned char *)(v51 + v76);
            goto LABEL_103;
          }
        }
        else
        {
          unint64_t v76 = 0;
        }
        v77 = (unsigned char *)(v51 + (v73 & 0xFFFFFFFFFFFFFFF8));
        v78 = (char *)&v17[v73 & 0xFFFFFFFFFFFFFFF8];
        v113 = (int16x8_t *)&v17[v76];
        v114 = (int8x8_t *)(v51 + v76);
        unint64_t v115 = v76 - (v73 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          int16x8_t v116 = *v113++;
          *v114++ = vmovn_s16(v116);
          v115 += 8;
        }
        while (v115);
        if (v73 == (v73 & 0xFFFFFFFFFFFFFFF8)) {
          goto LABEL_104;
        }
        do
        {
LABEL_103:
          char v79 = *v78;
          v78 += 2;
          *v77++ = v79;
        }
        while (v77 != v69);
        goto LABEL_104;
      }
    }
    else
    {
      unint64_t v22 = (unint64_t)&v19[v20 & 0xFFFFFFF0];
      v23 = (unsigned long long *)(v15 + 5);
      do
      {
        unsigned long long v24 = (unsigned __int128)vld2q_s8((const char *)v17);
        v17 += 16;
        *v23++ = v24;
      }
      while (v23 != (unsigned long long *)v22);
      if ((unsigned char *)v22 == v21) {
        goto LABEL_83;
      }
    }
    size_t v35 = (size_t)v15 + v20;
    unint64_t v36 = (unint64_t)v15 + v20 - v22 + 20;
    if (v36 < 8
      || (v22 < (unint64_t)&v17[v35 - v22 + 20] ? (BOOL v37 = (unint64_t)v17 >= v35 + 20) : (BOOL v37 = 1), !v37))
    {
      v43 = (unsigned char *)v22;
      v44 = (char *)v17;
      goto LABEL_59;
    }
    if (v36 >= 0x20)
    {
      unint64_t v38 = v36 & 0xFFFFFFFFFFFFFFE0;
      v85 = (int8x16_t *)(v17 + 16);
      v86 = (int8x16_t *)(v22 + 16);
      unint64_t v87 = v36 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        int8x16_t v89 = v85[-2];
        int8x16_t v88 = v85[-1];
        int8x16_t v91 = *v85;
        int8x16_t v90 = v85[1];
        v85 += 4;
        v86[-1] = vuzp1q_s8(v89, v88);
        int8x16_t *v86 = vuzp1q_s8(v91, v90);
        v86 += 2;
        v87 -= 32;
      }
      while (v87);
      if (v36 == v38) {
        goto LABEL_83;
      }
      if ((v36 & 0x18) == 0)
      {
        v44 = (char *)&v17[v38];
        v43 = (unsigned char *)(v22 + v38);
        do
        {
LABEL_59:
          char v45 = *v44;
          v44 += 2;
          *v43++ = v45;
        }
        while (v43 != v21);
        goto LABEL_83;
      }
    }
    else
    {
      unint64_t v38 = 0;
    }
    v43 = (unsigned char *)(v22 + (v36 & 0xFFFFFFFFFFFFFFF8));
    v44 = (char *)&v17[v36 & 0xFFFFFFFFFFFFFFF8];
    v92 = (int16x8_t *)&v17[v38];
    v93 = (int8x8_t *)(v22 + v38);
    unint64_t v94 = v38 - (v36 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      int16x8_t v95 = *v92++;
      *v93++ = vmovn_s16(v95);
      v94 += 8;
    }
    while (v94);
    if (v36 == (v36 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_83;
    }
    goto LABEL_59;
  }
  v15 = *(_DWORD **)(v4 + 24);
  if (!v15)
  {
    v81 = &stru_1F3C7DA90;
    goto LABEL_116;
  }
  *v15 += 2;
LABEL_113:
  v81 = (__CFString *)WTF::StringImpl::operator NSString *();
  if (*v15 == 2) {
    WTF::StringImpl::destroy((WTF::StringImpl *)v15, v3);
  }
  else {
    *v15 -= 2;
  }
LABEL_116:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v127, v3);
  return &v81->isa;
}

- (BOOL)specified
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v2);
  return 1;
}

- (NSString)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Attr::value((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    uint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    uint64_t v5 = v7;
    int v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    uint64_t v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setValue:(NSString *)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)value, v4);
  int v8 = v12;
  WebCore::Attr::setValue();
  if (v10 && v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v5);
      uint64_t v6 = v8;
      if (!v8) {
        goto LABEL_8;
      }
      goto LABEL_6;
    }
    *(_DWORD *)v9 -= 2;
  }
  uint64_t v6 = v8;
  if (!v8)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v6, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v7);
}

- (DOMElement)ownerElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  uint64_t v3 = *((void *)self->super.super._internal + 11);
  if (v3) {
    CFStringRef v4 = *(WebCore::Node **)(v3 + 8);
  }
  else {
    CFStringRef v4 = 0;
  }
  uint64_t v5 = (DOMElement *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (BOOL)isId
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  uint64_t v4 = *((void *)self->super.super._internal + 12);
  uint64_t v5 = *MEMORY[0x1E4FB6898];
  BOOL v6 = v4 == *MEMORY[0x1E4FB6898]
    || *(void *)(v4 + 24) == *(void *)(v5 + 24) && *(void *)(v4 + 32) == *(void *)(v5 + 32);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v6;
}

- (DOMCSSStyleDeclaration)style
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  uint64_t v3 = (DOMObjectInternal *)WebCore::Attr::style(self->super.super._internal);
  uint64_t v4 = (DOMCSSStyleDeclaration *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end