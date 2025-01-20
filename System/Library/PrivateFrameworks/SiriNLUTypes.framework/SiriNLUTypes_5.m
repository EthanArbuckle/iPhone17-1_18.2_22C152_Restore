uint64_t SIRINLUINTERNALSNLP_INTERMEDIATENLv4ContextFeaturizerResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUINTERNALSNLP_INTERMEDIATEContextFeaturizerResponse *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUINTERNALSNLP_INTERMEDIATEContextFeaturizerResponse);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUINTERNALSNLP_INTERMEDIATEContextFeaturizerResponseReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sirinluexternal::SemVer::formatText(sirinluexternal::SemVer *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 20);
  if (v5)
  {
    PB::TextFormatter::format(a2, "major_version");
    char v5 = *((unsigned char *)this + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)this + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "minor_version");
  if ((*((unsigned char *)this + 20) & 4) != 0) {
LABEL_4:
  }
    PB::TextFormatter::format(a2, "patch_version");
LABEL_5:
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::SemVer::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 20);
  if ((v4 & 1) == 0)
  {
    if ((*(unsigned char *)(this + 20) & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 20) & 4) == 0) {
      return this;
    }
    goto LABEL_7;
  }
  this = PB::Writer::writeVarInt(a2);
  char v4 = *(unsigned char *)(v3 + 20);
  if ((v4 & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v4 & 4) == 0) {
    return this;
  }
LABEL_7:
  return PB::Writer::writeVarInt(a2);
}

uint64_t sirinluexternal::SemVer::readFrom(sirinluexternal::SemVer *this, PB::Reader *a2)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v2 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v3 + 1;
        *((void *)a2 + 1) = v3 + 1;
        char v13 = *(unsigned char *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v3 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_31;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 20) |= 4u;
        unint64_t v27 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v28 = *(void *)a2;
        if (v27 > 0xFFFFFFFFFFFFFFF5 || v27 + 10 > v2)
        {
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v31 = 0;
          if (v2 <= v27) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v27)
            {
              LODWORD(v31) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_83;
            }
            unint64_t v45 = v27 + 1;
            char v46 = *(unsigned char *)(v28 + v27);
            *((void *)a2 + 1) = v45;
            v31 |= (unint64_t)(v46 & 0x7F) << v43;
            if ((v46 & 0x80) == 0) {
              break;
            }
            v43 += 7;
            unint64_t v27 = v45;
            BOOL v14 = v44++ > 8;
            if (v14)
            {
              LODWORD(v31) = 0;
              goto LABEL_82;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v31) = 0;
          }
LABEL_82:
          unint64_t v3 = v45;
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            unint64_t v3 = v27 + 1;
            *((void *)a2 + 1) = v27 + 1;
            char v32 = *(unsigned char *)(v28 + v27);
            v31 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v27 = v3;
            BOOL v14 = v30++ > 8;
            if (v14)
            {
              LODWORD(v31) = 0;
              break;
            }
          }
        }
LABEL_83:
        *((_DWORD *)this + 4) = v31;
      }
      else if (v19 == 2)
      {
        *((unsigned char *)this + 20) |= 2u;
        unint64_t v33 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v34 = *(void *)a2;
        if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v2)
        {
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v37 = 0;
          if (v2 <= v33) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v33)
            {
              LODWORD(v37) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_88;
            }
            unint64_t v49 = v33 + 1;
            char v50 = *(unsigned char *)(v34 + v33);
            *((void *)a2 + 1) = v49;
            v37 |= (unint64_t)(v50 & 0x7F) << v47;
            if ((v50 & 0x80) == 0) {
              break;
            }
            v47 += 7;
            unint64_t v33 = v49;
            BOOL v14 = v48++ > 8;
            if (v14)
            {
              LODWORD(v37) = 0;
              goto LABEL_87;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v37) = 0;
          }
LABEL_87:
          unint64_t v3 = v49;
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            unint64_t v3 = v33 + 1;
            *((void *)a2 + 1) = v33 + 1;
            char v38 = *(unsigned char *)(v34 + v33);
            v37 |= (unint64_t)(v38 & 0x7F) << v35;
            if ((v38 & 0x80) == 0) {
              break;
            }
            v35 += 7;
            unint64_t v33 = v3;
            BOOL v14 = v36++ > 8;
            if (v14)
            {
              LODWORD(v37) = 0;
              break;
            }
          }
        }
LABEL_88:
        *((_DWORD *)this + 3) = v37;
      }
      else if (v19 == 1)
      {
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v21 = *(void *)a2;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v2)
        {
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v24 = 0;
          if (v2 <= v20) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v20)
            {
              LODWORD(v24) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_78;
            }
            unint64_t v41 = v20 + 1;
            char v42 = *(unsigned char *)(v21 + v20);
            *((void *)a2 + 1) = v41;
            v24 |= (unint64_t)(v42 & 0x7F) << v39;
            if ((v42 & 0x80) == 0) {
              break;
            }
            v39 += 7;
            unint64_t v20 = v41;
            BOOL v14 = v40++ > 8;
            if (v14)
            {
              LODWORD(v24) = 0;
              goto LABEL_77;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v24) = 0;
          }
LABEL_77:
          unint64_t v3 = v41;
        }
        else
        {
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            unint64_t v3 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v25 = *(unsigned char *)(v21 + v20);
            v24 |= (unint64_t)(v25 & 0x7F) << v22;
            if ((v25 & 0x80) == 0) {
              break;
            }
            v22 += 7;
            unint64_t v20 = v3;
            BOOL v14 = v23++ > 8;
            if (v14)
            {
              LODWORD(v24) = 0;
              break;
            }
          }
        }
LABEL_78:
        *((_DWORD *)this + 2) = v24;
      }
      else
      {
LABEL_31:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v3 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
      }
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v3 > v2) {
      unint64_t v2 = v3;
    }
    while (v2 != v3)
    {
      unint64_t v17 = v3 + 1;
      char v18 = *(unsigned char *)(v8 + v3);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v3 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_31;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::SemVer::~SemVer(sirinluexternal::SemVer *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1CB772580);
}

uint64_t sirinluexternal::SemVer::SemVer(uint64_t this)
{
  *(void *)this = &unk_1F232E698;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

{
  *(void *)this = &unk_1F232E698;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

uint64_t sirinluexternal::SemVer::SemVer(uint64_t this, const sirinluexternal::SemVer *a2)
{
  *(void *)this = &unk_1F232E698;
  *(_DWORD *)(this + 20) = 0;
  char v2 = *((unsigned char *)a2 + 20);
  if (v2)
  {
    int v4 = *((_DWORD *)a2 + 2);
    char v3 = 1;
    *(unsigned char *)(this + 20) = 1;
    *(_DWORD *)(this + 8) = v4;
    char v2 = *((unsigned char *)a2 + 20);
    if ((v2 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v3 = 0;
  if ((*((unsigned char *)a2 + 20) & 2) != 0)
  {
LABEL_5:
    int v5 = *((_DWORD *)a2 + 3);
    v3 |= 2u;
    *(unsigned char *)(this + 20) = v3;
    *(_DWORD *)(this + 12) = v5;
    char v2 = *((unsigned char *)a2 + 20);
  }
LABEL_6:
  if ((v2 & 4) != 0)
  {
    int v6 = *((_DWORD *)a2 + 4);
    *(unsigned char *)(this + 20) = v3 | 4;
    *(_DWORD *)(this + 16) = v6;
  }
  return this;
}

uint64_t sirinluexternal::SemVer::operator=(uint64_t a1, const sirinluexternal::SemVer *a2)
{
  if ((const sirinluexternal::SemVer *)a1 != a2)
  {
    sirinluexternal::SemVer::SemVer((uint64_t)v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    PB::Base::~Base((PB::Base *)v5);
  }
  return a1;
}

_DWORD *sirinluexternal::swap(_DWORD *this, sirinluexternal::SemVer *a2, sirinluexternal::SemVer *a3)
{
  int v3 = this[5];
  this[5] = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  int v4 = this[2];
  this[2] = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v4;
  int v5 = this[3];
  this[3] = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v5;
  int v6 = this[4];
  this[4] = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v6;
  return this;
}

uint64_t sirinluexternal::SemVer::SemVer(uint64_t result, _DWORD *a2)
{
  *(void *)uint64_t result = &unk_1F232E698;
  *(_DWORD *)(result + 20) = a2[5];
  a2[5] = 0;
  *(_DWORD *)(result + 8) = a2[2];
  *(_DWORD *)(result + 12) = a2[3];
  *(_DWORD *)(result + 16) = a2[4];
  return result;
}

{
  *(void *)uint64_t result = &unk_1F232E698;
  *(_DWORD *)(result + 20) = a2[5];
  a2[5] = 0;
  *(_DWORD *)(result + 8) = a2[2];
  *(_DWORD *)(result + 12) = a2[3];
  *(_DWORD *)(result + 16) = a2[4];
  return result;
}

uint64_t sirinluexternal::SemVer::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    int v6 = &unk_1F232E698;
    long long v3 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a2 + 20) = 0;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v3;
    long long v7 = v4;
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

BOOL sirinluexternal::SemVer::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 20))
  {
    if ((*(unsigned char *)(a2 + 20) & 1) == 0 || *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 20))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 20) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 20) & 2) == 0 || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 12)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 20) & 2) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 20) & 4) == 0;
  if ((*(unsigned char *)(a1 + 20) & 4) != 0) {
    return (*(unsigned char *)(a2 + 20) & 4) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
  }
  return v2;
}

uint64_t sirinluexternal::SemVer::hash_value(sirinluexternal::SemVer *this)
{
  if ((*((unsigned char *)this + 20) & 1) == 0)
  {
    uint64_t v1 = 0;
    if ((*((unsigned char *)this + 20) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v2 = 0;
    if ((*((unsigned char *)this + 20) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v3 = 0;
    return v2 ^ v1 ^ v3;
  }
  uint64_t v1 = *((unsigned int *)this + 2);
  if ((*((unsigned char *)this + 20) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v2 = *((unsigned int *)this + 3);
  if ((*((unsigned char *)this + 20) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v3 = *((unsigned int *)this + 4);
  return v2 ^ v1 ^ v3;
}

uint64_t SIRINLUEXTERNALSystemOfferedReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(SIRINLUEXTERNALUserDialogAct);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || !SIRINLUEXTERNALUserDialogActReadFrom((id *)&v17->super.super.isa, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t sirinluinternalsnlp_intermediate::LinearizedTensor::formatText(sirinluinternalsnlp_intermediate::LinearizedTensor *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 7);
  for (uint64_t i = *((void *)this + 8); v5 != i; v5 += 24)
    PB::TextFormatter::format();
  uint64_t v7 = *((void *)this + 1);
  uint64_t v8 = *((void *)this + 2);
  while (v7 != v8)
  {
    v7 += 4;
    PB::TextFormatter::format(a2, "numericalized_feature");
  }
  uint64_t v9 = *((void *)this + 4);
  uint64_t v10 = *((void *)this + 5);
  while (v9 != v10)
  {
    v9 += 4;
    PB::TextFormatter::format(a2, "shape");
  }
  return MEMORY[0x1F4147498](a2);
}

void *sirinluinternalsnlp_intermediate::LinearizedTensor::writeTo(void *this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = this[4];
  uint64_t v5 = this[5];
  while (v4 != v5)
  {
    v4 += 4;
    this = (void *)PB::Writer::writeVarInt(a2);
  }
  uint64_t v6 = v3[1];
  uint64_t v7 = v3[2];
  while (v6 != v7)
  {
    v6 += 4;
    this = (void *)PB::Writer::writeVarInt(a2);
  }
  uint64_t v9 = v3[7];
  uint64_t v8 = v3[8];
  while (v9 != v8)
  {
    this = (void *)PB::Writer::write();
    v9 += 24;
  }
  return this;
}

BOOL sirinluinternalsnlp_intermediate::LinearizedTensor::readFrom(sirinluinternalsnlp_intermediate::LinearizedTensor *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    uint64_t v8 = (std::vector<std::string> *)((char *)this + 56);
    uint64_t v9 = (std::allocator<std::string> *)((char *)this + 72);
    do
    {
      uint64_t v10 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        char v16 = 0;
        unsigned int v17 = 0;
        unint64_t v13 = 0;
        if (v2 > v3) {
          unint64_t v3 = v2;
        }
        while (v3 != v2)
        {
          unint64_t v18 = v2 + 1;
          char v19 = *(unsigned char *)(v10 + v2);
          *((void *)a2 + 1) = v18;
          v13 |= (unint64_t)(v19 & 0x7F) << v16;
          if ((v19 & 0x80) == 0) {
            goto LABEL_26;
          }
          v16 += 7;
          unint64_t v2 = v18;
          BOOL v40 = v17++ > 8;
          if (v40) {
            goto LABEL_20;
          }
        }
        int v4 = 1;
        *((unsigned char *)a2 + 24) = 1;
        return v4 == 0;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        unint64_t v14 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v15 = *(unsigned char *)(v10 + v2);
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0) {
          break;
        }
        v11 += 7;
        unint64_t v2 = v14;
        BOOL v40 = v12++ > 8;
        if (v40) {
          goto LABEL_20;
        }
      }
LABEL_26:
      int v21 = v13 & 7;
      if (v21 == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v22 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        char v46 = (char *)*((void *)this + 8);
        unint64_t v45 = *((void *)this + 9);
        if ((unint64_t)v46 >= v45)
        {
          unint64_t v72 = 0xAAAAAAAAAAAAAAABLL * ((v46 - (char *)v8->__begin_) >> 3);
          unint64_t v73 = v72 + 1;
          if (v72 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v74 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v45 - (unint64_t)v8->__begin_) >> 3);
          if (2 * v74 > v73) {
            unint64_t v73 = 2 * v74;
          }
          if (v74 >= 0x555555555555555) {
            unint64_t v75 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v75 = v73;
          }
          __v.__end_cap_.__value_ = v9;
          if (v75) {
            unint64_t v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v75);
          }
          else {
            uint64_t v76 = 0;
          }
          v91 = (std::string *)(v75 + 24 * v72);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v75;
          __v.__begin_ = v91;
          __v.__end_cap_.__value_ = (std::string *)(v75 + 24 * v76);
          v91->__r_.__value_.__r.__words[0] = 0;
          v91->__r_.__value_.__l.__size_ = 0;
          v91->__r_.__value_.__r.__words[2] = 0;
          __v.__end_ = v91 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(v8, &__v);
          char v47 = (void *)*((void *)this + 8);
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          *(void *)char v46 = 0;
          *((void *)v46 + 1) = 0;
          char v47 = v46 + 24;
          *((void *)v46 + 2) = 0;
        }
        *((void *)this + 8) = v47;
        PB::Reader::read();
        goto LABEL_21;
      }
      if (v22 == 2)
      {
        if (v21 != 2)
        {
          v78 = (char *)*((void *)this + 2);
          unint64_t v77 = *((void *)this + 3);
          if ((unint64_t)v78 >= v77)
          {
            v85 = (char *)*((void *)this + 1);
            uint64_t v86 = (v78 - v85) >> 2;
            unint64_t v87 = v86 + 1;
            if ((unint64_t)(v86 + 1) >> 62) {
LABEL_206:
            }
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            uint64_t v88 = v77 - (void)v85;
            if (v88 >> 1 > v87) {
              unint64_t v87 = v88 >> 1;
            }
            if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v89 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v89 = v87;
            }
            if (v89)
            {
              unint64_t v89 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v89);
              v85 = (char *)*((void *)this + 1);
              v78 = (char *)*((void *)this + 2);
            }
            else
            {
              uint64_t v90 = 0;
            }
            v105 = (_DWORD *)(v89 + 4 * v86);
            _DWORD *v105 = 0;
            v71 = v105 + 1;
            while (v78 != v85)
            {
              int v106 = *((_DWORD *)v78 - 1);
              v78 -= 4;
              *--v105 = v106;
            }
            *((void *)this + 1) = v105;
            *((void *)this + 2) = v71;
            *((void *)this + 3) = v89 + 4 * v90;
            if (v85) {
              operator delete(v85);
            }
          }
          else
          {
            *(_DWORD *)v78 = 0;
            v71 = v78 + 4;
          }
          *((void *)this + 2) = v71;
          unint64_t v107 = *((void *)a2 + 1);
          unint64_t v108 = *((void *)a2 + 2);
          uint64_t v109 = *(void *)a2;
          char v110 = 0;
          unsigned int v111 = 0;
          if (v107 <= 0xFFFFFFFFFFFFFFF5 && v107 + 10 <= v108)
          {
            uint64_t v102 = 0;
            while (1)
            {
              unint64_t v115 = v107 + 1;
              *((void *)a2 + 1) = v107 + 1;
              char v116 = *(unsigned char *)(v109 + v107);
              v102 |= (unint64_t)(v116 & 0x7F) << v110;
              if ((v116 & 0x80) == 0) {
                goto LABEL_200;
              }
              v110 += 7;
              unint64_t v107 = v115;
              BOOL v40 = v111++ > 8;
              if (v40) {
                goto LABEL_196;
              }
            }
          }
          uint64_t v102 = 0;
          if (v108 <= v107) {
            unint64_t v108 = *((void *)a2 + 1);
          }
          while (v108 != v107)
          {
            unint64_t v113 = v107 + 1;
            char v114 = *(unsigned char *)(v109 + v107);
            *((void *)a2 + 1) = v113;
            v102 |= (unint64_t)(v114 & 0x7F) << v110;
            if ((v114 & 0x80) == 0)
            {
LABEL_198:
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v102) = 0;
              }
              goto LABEL_200;
            }
            v110 += 7;
            unint64_t v107 = v113;
            BOOL v40 = v111++ > 8;
            if (v40)
            {
LABEL_196:
              LODWORD(v102) = 0;
              goto LABEL_200;
            }
          }
          goto LABEL_197;
        }
        if (PB::Reader::placeMark()) {
          return 0;
        }
        if (*((void *)a2 + 1) < *((void *)a2 + 2) && !*((unsigned char *)a2 + 24))
        {
          unsigned int v23 = (char *)*((void *)this + 2);
          while (1)
          {
            unint64_t v48 = *((void *)this + 3);
            if ((unint64_t)v23 >= v48)
            {
              unint64_t v49 = (char *)*((void *)this + 1);
              uint64_t v50 = (v23 - v49) >> 2;
              unint64_t v51 = v50 + 1;
              if ((unint64_t)(v50 + 1) >> 62) {
                goto LABEL_206;
              }
              uint64_t v52 = v48 - (void)v49;
              if (v52 >> 1 > v51) {
                unint64_t v51 = v52 >> 1;
              }
              if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v53 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v53 = v51;
              }
              if (v53)
              {
                unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v53);
                unint64_t v49 = (char *)*((void *)this + 1);
                unsigned int v23 = (char *)*((void *)this + 2);
              }
              else
              {
                uint64_t v54 = 0;
              }
              v55 = (_DWORD *)(v53 + 4 * v50);
              _DWORD *v55 = 0;
              v56 = (char *)(v55 + 1);
              while (v23 != v49)
              {
                int v57 = *((_DWORD *)v23 - 1);
                v23 -= 4;
                *--v55 = v57;
              }
              *((void *)this + 1) = v55;
              *((void *)this + 2) = v56;
              *((void *)this + 3) = v53 + 4 * v54;
              if (v49) {
                operator delete(v49);
              }
              unsigned int v23 = v56;
            }
            else
            {
              *(_DWORD *)unsigned int v23 = 0;
              v23 += 4;
            }
            *((void *)this + 2) = v23;
            unint64_t v59 = *((void *)a2 + 1);
            unint64_t v58 = *((void *)a2 + 2);
            uint64_t v60 = *(void *)a2;
            char v61 = 0;
            unsigned int v62 = 0;
            uint64_t v63 = 0;
            if (v59 > 0xFFFFFFFFFFFFFFF5 || v59 + 10 > v58) {
              break;
            }
            while (1)
            {
              unint64_t v66 = v59 + 1;
              *((void *)a2 + 1) = v59 + 1;
              char v68 = *(unsigned char *)(v60 + v59);
              v63 |= (unint64_t)(v68 & 0x7F) << v61;
              if ((v68 & 0x80) == 0) {
                break;
              }
              v61 += 7;
              unint64_t v59 = v66;
              BOOL v40 = v62++ > 8;
              if (v40) {
                goto LABEL_114;
              }
            }
LABEL_117:
            *((_DWORD *)v23 - 1) = v63;
            if (v66 >= v58 || *((unsigned char *)a2 + 24)) {
              goto LABEL_133;
            }
          }
          if (v58 <= v59) {
            uint64_t v65 = *((void *)a2 + 1);
          }
          else {
            uint64_t v65 = *((void *)a2 + 2);
          }
          while (v65 != v59)
          {
            unint64_t v66 = v59 + 1;
            char v67 = *(unsigned char *)(v60 + v59);
            *((void *)a2 + 1) = v66;
            v63 |= (unint64_t)(v67 & 0x7F) << v61;
            if ((v67 & 0x80) == 0)
            {
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v63) = 0;
              }
              goto LABEL_117;
            }
            v61 += 7;
            unint64_t v59 = v66;
            BOOL v40 = v62++ > 8;
            if (v40)
            {
LABEL_114:
              LODWORD(v63) = 0;
              goto LABEL_117;
            }
          }
LABEL_132:
          *((unsigned char *)a2 + 24) = 1;
          *((_DWORD *)v23 - 1) = 0;
        }
      }
      else
      {
        if (v22 != 1)
        {
LABEL_20:
          if ((PB::Reader::skip(a2) & 1) == 0) {
            return 0;
          }
          goto LABEL_21;
        }
        if (v21 != 2)
        {
          v70 = (char *)*((void *)this + 5);
          unint64_t v69 = *((void *)this + 6);
          if ((unint64_t)v70 >= v69)
          {
            v79 = (char *)*((void *)this + 4);
            uint64_t v80 = (v70 - v79) >> 2;
            unint64_t v81 = v80 + 1;
            if ((unint64_t)(v80 + 1) >> 62) {
              goto LABEL_206;
            }
            uint64_t v82 = v69 - (void)v79;
            if (v82 >> 1 > v81) {
              unint64_t v81 = v82 >> 1;
            }
            if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v83 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v83 = v81;
            }
            if (v83)
            {
              unint64_t v83 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v83);
              v79 = (char *)*((void *)this + 4);
              v70 = (char *)*((void *)this + 5);
            }
            else
            {
              uint64_t v84 = 0;
            }
            v92 = (_DWORD *)(v83 + 4 * v80);
            _DWORD *v92 = 0;
            v71 = v92 + 1;
            while (v70 != v79)
            {
              int v93 = *((_DWORD *)v70 - 1);
              v70 -= 4;
              *--v92 = v93;
            }
            *((void *)this + 4) = v92;
            *((void *)this + 5) = v71;
            *((void *)this + 6) = v83 + 4 * v84;
            if (v79) {
              operator delete(v79);
            }
          }
          else
          {
            *(_DWORD *)v70 = 0;
            v71 = v70 + 4;
          }
          *((void *)this + 5) = v71;
          unint64_t v94 = *((void *)a2 + 1);
          unint64_t v95 = *((void *)a2 + 2);
          uint64_t v96 = *(void *)a2;
          char v97 = 0;
          unsigned int v98 = 0;
          if (v94 <= 0xFFFFFFFFFFFFFFF5 && v94 + 10 <= v95)
          {
            uint64_t v102 = 0;
            while (1)
            {
              unint64_t v103 = v94 + 1;
              *((void *)a2 + 1) = v94 + 1;
              char v104 = *(unsigned char *)(v96 + v94);
              v102 |= (unint64_t)(v104 & 0x7F) << v97;
              if ((v104 & 0x80) == 0) {
                goto LABEL_200;
              }
              v97 += 7;
              unint64_t v94 = v103;
              BOOL v40 = v98++ > 8;
              if (v40) {
                goto LABEL_196;
              }
            }
          }
          uint64_t v102 = 0;
          if (v95 <= v94) {
            unint64_t v95 = *((void *)a2 + 1);
          }
          while (v95 != v94)
          {
            unint64_t v100 = v94 + 1;
            char v101 = *(unsigned char *)(v96 + v94);
            *((void *)a2 + 1) = v100;
            v102 |= (unint64_t)(v101 & 0x7F) << v97;
            if ((v101 & 0x80) == 0) {
              goto LABEL_198;
            }
            v97 += 7;
            unint64_t v94 = v100;
            BOOL v40 = v98++ > 8;
            if (v40) {
              goto LABEL_196;
            }
          }
LABEL_197:
          LODWORD(v102) = 0;
          *((unsigned char *)a2 + 24) = 1;
LABEL_200:
          *(v71 - 1) = v102;
          goto LABEL_21;
        }
        if (PB::Reader::placeMark()) {
          return 0;
        }
        if (*((void *)a2 + 1) < *((void *)a2 + 2) && !*((unsigned char *)a2 + 24))
        {
          unsigned int v23 = (char *)*((void *)this + 5);
          do
          {
            unint64_t v24 = *((void *)this + 6);
            if ((unint64_t)v23 >= v24)
            {
              char v25 = (char *)*((void *)this + 4);
              uint64_t v26 = (v23 - v25) >> 2;
              unint64_t v27 = v26 + 1;
              if ((unint64_t)(v26 + 1) >> 62) {
                goto LABEL_206;
              }
              uint64_t v28 = v24 - (void)v25;
              if (v28 >> 1 > v27) {
                unint64_t v27 = v28 >> 1;
              }
              if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v29 = v27;
              }
              if (v29)
              {
                unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v29);
                char v25 = (char *)*((void *)this + 4);
                unsigned int v23 = (char *)*((void *)this + 5);
              }
              else
              {
                uint64_t v30 = 0;
              }
              uint64_t v31 = (_DWORD *)(v29 + 4 * v26);
              *uint64_t v31 = 0;
              char v32 = (char *)(v31 + 1);
              while (v23 != v25)
              {
                int v33 = *((_DWORD *)v23 - 1);
                v23 -= 4;
                *--uint64_t v31 = v33;
              }
              *((void *)this + 4) = v31;
              *((void *)this + 5) = v32;
              *((void *)this + 6) = v29 + 4 * v30;
              if (v25) {
                operator delete(v25);
              }
              unsigned int v23 = v32;
            }
            else
            {
              *(_DWORD *)unsigned int v23 = 0;
              v23 += 4;
            }
            *((void *)this + 5) = v23;
            unint64_t v35 = *((void *)a2 + 1);
            unint64_t v34 = *((void *)a2 + 2);
            uint64_t v36 = *(void *)a2;
            char v37 = 0;
            unsigned int v38 = 0;
            uint64_t v39 = 0;
            BOOL v40 = v35 > 0xFFFFFFFFFFFFFFF5 || v35 + 10 > v34;
            if (v40)
            {
              if (v34 <= v35) {
                uint64_t v41 = *((void *)a2 + 1);
              }
              else {
                uint64_t v41 = *((void *)a2 + 2);
              }
              while (1)
              {
                if (v41 == v35) {
                  goto LABEL_132;
                }
                unint64_t v42 = v35 + 1;
                char v43 = *(unsigned char *)(v36 + v35);
                *((void *)a2 + 1) = v42;
                v39 |= (unint64_t)(v43 & 0x7F) << v37;
                if ((v43 & 0x80) == 0) {
                  break;
                }
                v37 += 7;
                unint64_t v35 = v42;
                BOOL v40 = v38++ > 8;
                if (v40)
                {
LABEL_68:
                  LODWORD(v39) = 0;
                  goto LABEL_71;
                }
              }
              if (*((unsigned char *)a2 + 24)) {
                LODWORD(v39) = 0;
              }
            }
            else
            {
              while (1)
              {
                unint64_t v42 = v35 + 1;
                *((void *)a2 + 1) = v35 + 1;
                char v44 = *(unsigned char *)(v36 + v35);
                v39 |= (unint64_t)(v44 & 0x7F) << v37;
                if ((v44 & 0x80) == 0) {
                  break;
                }
                v37 += 7;
                unint64_t v35 = v42;
                BOOL v40 = v38++ > 8;
                if (v40) {
                  goto LABEL_68;
                }
              }
            }
LABEL_71:
            *((_DWORD *)v23 - 1) = v39;
          }
          while (v42 < v34 && !*((unsigned char *)a2 + 24));
        }
      }
LABEL_133:
      PB::Reader::recallMark();
LABEL_21:
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && v4 == 0);
  }
  return v4 == 0;
}

void sirinluinternalsnlp_intermediate::LinearizedTensor::~LinearizedTensor(sirinluinternalsnlp_intermediate::LinearizedTensor *this)
{
  sirinluinternalsnlp_intermediate::LinearizedTensor::~LinearizedTensor(this);
  JUMPOUT(0x1CB772580);
}

{
  void *v2;
  void *v3;
  void **v4;
  uint64_t vars8;

  *(void *)this = &unk_1F232E6E8;
  int v4 = (void **)((char *)this + 56);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  unint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    *((void *)this + 5) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 1);
  if (v3)
  {
    *((void *)this + 2) = v3;
    operator delete(v3);
  }
  PB::Base::~Base(this);
}

double sirinluinternalsnlp_intermediate::LinearizedTensor::LinearizedTensor(sirinluinternalsnlp_intermediate::LinearizedTensor *this)
{
  *(void *)this = &unk_1F232E6E8;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 9) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232E6E8;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 9) = 0;
  return result;
}

sirinluinternalsnlp_intermediate::LinearizedTensor *sirinluinternalsnlp_intermediate::LinearizedTensor::LinearizedTensor(sirinluinternalsnlp_intermediate::LinearizedTensor *this, const sirinluinternalsnlp_intermediate::LinearizedTensor *a2)
{
  *(void *)this = &unk_1F232E6E8;
  *(_OWORD *)((char *)this + 8) = 0u;
  unint64_t v3 = (void *)((char *)this + 8);
  *(_OWORD *)((char *)this + 56) = 0u;
  int v4 = (std::vector<std::string> *)((char *)this + 56);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 9) = 0;
  if (this != a2)
  {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((void *)this + 4, *((char **)a2 + 4), *((char **)a2 + 5), (uint64_t)(*((void *)a2 + 5) - *((void *)a2 + 4)) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v3, *((char **)a2 + 1), *((char **)a2 + 2), (uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 2);
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(v4, *((std::string **)a2 + 7), *((long long **)a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 3));
  }
  return this;
}

uint64_t sirinluinternalsnlp_intermediate::LinearizedTensor::operator=(uint64_t a1, const sirinluinternalsnlp_intermediate::LinearizedTensor *a2)
{
  if ((const sirinluinternalsnlp_intermediate::LinearizedTensor *)a1 != a2)
  {
    sirinluinternalsnlp_intermediate::LinearizedTensor::LinearizedTensor((sirinluinternalsnlp_intermediate::LinearizedTensor *)&v9, a2);
    long long v3 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v12 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    long long v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v11 = v5;
    long long v6 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    long long v13 = v6;
    uint64_t v7 = *(void *)(a1 + 72);
    *(void *)(a1 + 72) = v14;
    uint64_t v14 = v7;
    sirinluinternalsnlp_intermediate::LinearizedTensor::~LinearizedTensor((sirinluinternalsnlp_intermediate::LinearizedTensor *)&v9);
  }
  return a1;
}

void *sirinluinternalsnlp_intermediate::swap(void *this, sirinluinternalsnlp_intermediate::LinearizedTensor *a2, sirinluinternalsnlp_intermediate::LinearizedTensor *a3)
{
  uint64_t v3 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v3;
  uint64_t v4 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v4;
  uint64_t v5 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v5;
  uint64_t v6 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v6;
  uint64_t v7 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v7;
  uint64_t v8 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v8;
  uint64_t v9 = this[7];
  this[7] = *((void *)a2 + 7);
  *((void *)a2 + 7) = v9;
  uint64_t v10 = this[8];
  this[8] = *((void *)a2 + 8);
  *((void *)a2 + 8) = v10;
  uint64_t v11 = this[9];
  this[9] = *((void *)a2 + 9);
  *((void *)a2 + 9) = v11;
  return this;
}

uint64_t sirinluinternalsnlp_intermediate::LinearizedTensor::LinearizedTensor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232E6E8;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (void *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  uint64_t v5 = *(void **)(a1 + 8);
  if (v5)
  {
    *(void *)(a1 + 16) = v5;
    operator delete(v5);
    *uint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  return a1;
}

uint64_t sirinluinternalsnlp_intermediate::LinearizedTensor::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternalsnlp_intermediate::LinearizedTensor::LinearizedTensor((uint64_t)&v9, a2);
    long long v3 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v12 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    long long v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v11 = v5;
    long long v6 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    long long v13 = v6;
    uint64_t v7 = *(void *)(a1 + 72);
    *(void *)(a1 + 72) = v14;
    uint64_t v14 = v7;
    sirinluinternalsnlp_intermediate::LinearizedTensor::~LinearizedTensor((sirinluinternalsnlp_intermediate::LinearizedTensor *)&v9);
  }
  return a1;
}

BOOL sirinluinternalsnlp_intermediate::LinearizedTensor::operator==(void *a1, void *a2)
{
  long long v5 = a1 + 4;
  long long v4 = (const void *)a1[4];
  size_t v6 = v5[1] - (void)v4;
  uint64_t v8 = a2 + 4;
  uint64_t v7 = (const void *)a2[4];
  if (v6 != v8[1] - (void)v7) {
    return 0;
  }
  if (memcmp(v4, v7, v6)) {
    return 0;
  }
  uint64_t v9 = (const void *)a1[1];
  size_t v10 = a1[2] - (void)v9;
  long long v11 = (const void *)a2[1];
  if (v10 != a2[2] - (void)v11) {
    return 0;
  }
  if (memcmp(v9, v11, v10)) {
    return 0;
  }
  uint64_t v14 = a1 + 7;
  long long v12 = (unsigned __int8 *)a1[7];
  long long v13 = (unsigned __int8 *)v14[1];
  char v16 = a2 + 7;
  char v15 = (unsigned __int8 *)a2[7];
  if (v13 - v12 != v16[1] - (void)v15) {
    return 0;
  }
  if (v12 == v13) {
    return 1;
  }
  do
  {
    BOOL result = std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v12, v15);
    if (!result) {
      break;
    }
    v12 += 24;
    v15 += 24;
  }
  while (v12 != v13);
  return result;
}

uint64_t sirinluinternalsnlp_intermediate::LinearizedTensor::hash_value(sirinluinternalsnlp_intermediate::LinearizedTensor *this)
{
  uint64_t v2 = PBHashBytes();
  uint64_t v3 = PBHashBytes();
  uint64_t v4 = *((void *)this + 7);
  uint64_t v5 = *((void *)this + 8);
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      v6 ^= std::__string_hash<char>::operator()[abi:ne180100](v4);
      v4 += 24;
    }
    while (v4 != v5);
  }
  return v3 ^ v2 ^ v6;
}

uint64_t SIRINLUINTERNALQUERYREWRITEQRTokenReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 40;
          goto LABEL_40;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 52) |= 4u;
          while (2)
          {
            uint64_t v24 = *v3;
            uint64_t v25 = *(void *)(a2 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_51:
          uint64_t v45 = 32;
          goto LABEL_56;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
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
              v23 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v15 = v29++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_55:
          uint64_t v45 = 16;
LABEL_56:
          *(_DWORD *)(a1 + v45) = v23;
          continue;
        case 4u:
          *(unsigned char *)(a1 + 52) |= 1u;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v36 = 0;
          }
          *(void *)(a1 + 8) = v36;
          continue;
        case 5u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
LABEL_40:
          char v37 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 6u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 52) |= 8u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v3;
        uint64_t v42 = *(void *)(a2 + v41);
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)(a2 + *v4)) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
        *(void *)(a2 + v41) = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0) {
          goto LABEL_58;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          uint64_t v40 = 0;
          goto LABEL_60;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v40 = 0;
      }
LABEL_60:
      *(unsigned char *)(a1 + 48) = v40 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRINLUINTERNALMENTION_DETECTORMentionDetectorRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        unsigned int v17 = objc_alloc_init(SIRINLUEXTERNALUUID);
        uint64_t v18 = 40;
        goto LABEL_23;
      case 2u:
        unsigned int v17 = objc_alloc_init(SIRINLUEXTERNALUUID);
        uint64_t v18 = 32;
LABEL_23:
        objc_storeStrong((id *)(a1 + v18), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_52;
        }
        goto LABEL_44;
      case 3u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 48;
        goto LABEL_28;
      case 4u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 64;
LABEL_28:
        unsigned int v22 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        goto LABEL_45;
      case 5u:
        unsigned int v17 = objc_alloc_init(SIRINLUINTERNALTokenChain);
        objc_storeStrong((id *)(a1 + 56), v17);
        if (!PBReaderPlaceMark() || !SIRINLUINTERNALTokenChainReadFrom((char *)v17, a2)) {
          goto LABEL_52;
        }
        goto LABEL_44;
      case 6u:
        unsigned int v17 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUINTERNALNLv4EmbeddingTensorReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_52;
        }
        goto LABEL_44;
      case 7u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 72) |= 1u;
        while (2)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              BOOL v14 = v24++ >= 9;
              if (v14)
              {
                uint64_t v25 = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_50:
        *(void *)(a1 + 8) = v25;
        goto LABEL_45;
      case 8u:
        unsigned int v17 = objc_alloc_init(SIRINLUEXTERNALRequestID);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (SIRINLUEXTERNALRequestIDReadFrom((uint64_t)v17, a2))
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_45:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_52:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_45;
    }
  }
}

id loggerContext(int a1)
{
  if (a1 >= 2) {
    __cxa_rethrow();
  }
  if (loggerContext(SiriNLUTypesLogCategory)::onceToken != -1) {
    dispatch_once(&loggerContext(SiriNLUTypesLogCategory)::onceToken, &__block_literal_global_15041);
  }
  uint64_t v2 = (void *)loggerContext(SiriNLUTypesLogCategory)::logObjects[a1];
  return v2;
}

uint64_t ___Z13loggerContext23SiriNLUTypesLogCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.siri.sirinlutypes", "SELFLog");
  uint64_t v1 = (void *)loggerContext(SiriNLUTypesLogCategory)::logObjects[0];
  loggerContext(SiriNLUTypesLogCategory)::logObjects[0] = (uint64_t)v0;

  qword_1EBC71060 = (uint64_t)os_log_create("com.apple.siri.sirinlutypes", "Converter");
  return MEMORY[0x1F41817F8]();
}

uint64_t sirinluexternal::UserWantedToPause::formatText(sirinluexternal::UserWantedToPause *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "reference");
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "task_id");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::UserWantedToPause::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 8);
  if (v5)
  {
    return PB::Writer::writeSubmessage(a2, v5);
  }
  return this;
}

uint64_t sirinluexternal::UserWantedToPause::readFrom(sirinluexternal::UserWantedToPause *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::UserWantedToPause::~UserWantedToPause(sirinluexternal::UserWantedToPause *this)
{
  sirinluexternal::UserWantedToPause::~UserWantedToPause(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232E778;
  unint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

void *sirinluexternal::UserWantedToPause::UserWantedToPause(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232E778;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232E778;
  return this;
}

void *sirinluexternal::UserWantedToPause::UserWantedToPause(void *this, const sirinluexternal::UserWantedToPause *a2)
{
  *this = &unk_1F232E778;
  this[1] = 0;
  this[2] = 0;
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserWantedToPause::operator=(uint64_t a1, const sirinluexternal::UserWantedToPause *a2)
{
  if ((const sirinluexternal::UserWantedToPause *)a1 != a2)
  {
    sirinluexternal::UserWantedToPause::UserWantedToPause(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::UserWantedToPause::~UserWantedToPause((sirinluexternal::UserWantedToPause *)&v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::UserWantedToPause *a2, sirinluexternal::UserWantedToPause *a3)
{
  uint64_t v3 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  return this;
}

void *sirinluexternal::UserWantedToPause::UserWantedToPause(void *a1, uint64_t a2)
{
  a1[1] = 0;
  uint64_t v4 = a1 + 1;
  *a1 = &unk_1F232E778;
  a1[2] = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = a1[2];
  a1[2] = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v8 = *v4;
  *uint64_t v4 = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  return a1;
}

uint64_t sirinluexternal::UserWantedToPause::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::UserWantedToPause::UserWantedToPause(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::UserWantedToPause::~UserWantedToPause((sirinluexternal::UserWantedToPause *)&v5);
  }
  return a1;
}

uint64_t sirinluexternal::UserWantedToPause::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (v5 && sirinluexternal::UUID::operator==(v4, v5)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (v5) {
    return 0;
  }
LABEL_4:
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a2 + 8);
  uint64_t result = (v6 | v7) == 0;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unint64_t v10 = *(void **)(a1 + 8);
    return sirinluexternal::UsoGraph::operator==(v10, (void *)v7);
  }
  return result;
}

unint64_t sirinluexternal::UserWantedToPause::hash_value(sirinluexternal::UserWantedToPause *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (!v1)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v1 + 28) & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)(v1 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v1 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)(v1 + 8);
  if ((*(unsigned char *)(v1 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v3 = *(void *)(v1 + 16);
  if ((*(unsigned char *)(v1 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v4 = *(int *)(v1 + 24);
LABEL_10:
  uint64_t v5 = v3 ^ v2 ^ v4;
LABEL_11:
  unint64_t v6 = *((void *)this + 1);
  if (v6) {
    unint64_t v6 = sirinluexternal::UsoGraph::hash_value((sirinluexternal::UsoGraph *)v6);
  }
  return v6 ^ v5;
}

uint64_t sirinluexternal::UserWantedToPause::makeTaskId(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserWantedToPause::makeReference(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::TurnInput::formatText(sirinluexternal::TurnInput *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  unint64_t v6 = (uint64_t *)*((void *)this + 2);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "active_tasks");
  }
  uint64_t v8 = (uint64_t *)*((void *)this + 4);
  BOOL v9 = (uint64_t *)*((void *)this + 5);
  while (v8 != v9)
  {
    uint64_t v10 = *v8++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, a2, "asr_outputs");
  }
  uint64_t v11 = *((void *)this + 7);
  if (v11) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "correction_outcome_override");
  }
  char v12 = (uint64_t *)*((void *)this + 8);
  BOOL v13 = (uint64_t *)*((void *)this + 9);
  while (v12 != v13)
  {
    uint64_t v14 = *v12++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v14 + 32))(v14, a2, "executed_tasks");
  }
  if (*((void *)this + 11)) {
    PB::TextFormatter::format();
  }
  unsigned int v15 = (uint64_t *)*((void *)this + 12);
  unint64_t v16 = (uint64_t *)*((void *)this + 13);
  while (v15 != v16)
  {
    uint64_t v17 = *v15++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v17 + 32))(v17, a2, "salient_entities");
  }
  if (*((unsigned char *)this + 148)) {
    PB::TextFormatter::format(a2, "start_timestamp");
  }
  uint64_t v18 = *((void *)this + 16);
  if (v18) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v18 + 32))(v18, a2, "system_dialog_act_group");
  }
  if ((*((unsigned char *)this + 148) & 2) != 0) {
    PB::TextFormatter::format(a2, "tap_to_edit");
  }
  uint64_t v19 = *((void *)this + 17);
  if (v19) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v19 + 32))(v19, a2, "turn_context");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::TurnInput::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 128);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base ***)(v3 + 96);
  unint64_t v6 = *(const PB::Base ***)(v3 + 104);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  uint64_t v8 = *(const PB::Base ***)(v3 + 8);
  BOOL v9 = *(const PB::Base ***)(v3 + 16);
  while (v8 != v9)
  {
    uint64_t v10 = *v8++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  uint64_t v11 = *(const PB::Base ***)(v3 + 64);
  char v12 = *(const PB::Base ***)(v3 + 72);
  while (v11 != v12)
  {
    BOOL v13 = *v11++;
    this = PB::Writer::writeSubmessage(a2, v13);
  }
  uint64_t v14 = *(const PB::Base ***)(v3 + 32);
  unsigned int v15 = *(const PB::Base ***)(v3 + 40);
  while (v14 != v15)
  {
    unint64_t v16 = *v14++;
    this = PB::Writer::writeSubmessage(a2, v16);
  }
  uint64_t v17 = *(const PB::Base **)(v3 + 136);
  if (v17) {
    this = PB::Writer::writeSubmessage(a2, v17);
  }
  if (*(void *)(v3 + 88)) {
    this = PB::Writer::write();
  }
  char v18 = *(unsigned char *)(v3 + 148);
  if ((v18 & 2) != 0)
  {
    this = PB::Writer::write(a2);
    char v18 = *(unsigned char *)(v3 + 148);
  }
  if (v18) {
    this = PB::Writer::writeVarInt(a2);
  }
  uint64_t v19 = *(const PB::Base **)(v3 + 56);
  if (v19)
  {
    return PB::Writer::writeSubmessage(a2, v19);
  }
  return this;
}

uint64_t sirinluexternal::TurnInput::readFrom(sirinluexternal::TurnInput *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        PB::PtrVector<sirinluexternal::EntityCandidate>::emplace_back<>();
      case 3u:
        PB::PtrVector<sirinluexternal::Task>::emplace_back<>();
      case 4u:
        PB::PtrVector<sirinluexternal::Task>::emplace_back<>();
      case 5u:
        operator new();
      case 6u:
        operator new();
      case 7u:
        operator new();
      case 8u:
        *((unsigned char *)this + 148) |= 2u;
        unint64_t v20 = *((void *)a2 + 1);
        if (v20 >= *((void *)a2 + 2))
        {
          BOOL v23 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v21 = v20 + 1;
          int v22 = *(unsigned __int8 *)(*(void *)a2 + v20);
          *((void *)a2 + 1) = v21;
          BOOL v23 = v22 != 0;
        }
        *((unsigned char *)this + 144) = v23;
        goto LABEL_31;
      case 9u:
        *((unsigned char *)this + 148) |= 1u;
        unint64_t v25 = *((void *)a2 + 1);
        unint64_t v26 = *((void *)a2 + 2);
        uint64_t v27 = *(void *)a2;
        if (v25 <= 0xFFFFFFFFFFFFFFF5 && v25 + 10 <= v26)
        {
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          do
          {
            unint64_t v31 = v25 + 1;
            *((void *)a2 + 1) = v25 + 1;
            char v32 = *(unsigned char *)(v27 + v25);
            v30 |= (unint64_t)(v32 & 0x7F) << v28;
            if ((v32 & 0x80) == 0) {
              goto LABEL_57;
            }
            v28 += 7;
            unint64_t v25 = v31;
            BOOL v14 = v29++ > 8;
          }
          while (!v14);
LABEL_53:
          uint64_t v30 = 0;
          goto LABEL_57;
        }
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v30 = 0;
        if (v26 <= v25) {
          unint64_t v26 = *((void *)a2 + 1);
        }
        break;
      case 0xAu:
        operator new();
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v26 == v25)
      {
        uint64_t v30 = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_57;
      }
      unint64_t v35 = v25 + 1;
      char v36 = *(unsigned char *)(v27 + v25);
      *((void *)a2 + 1) = v35;
      v30 |= (unint64_t)(v36 & 0x7F) << v33;
      if ((v36 & 0x80) == 0) {
        break;
      }
      v33 += 7;
      unint64_t v25 = v35;
      BOOL v14 = v34++ > 8;
      if (v14) {
        goto LABEL_53;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      uint64_t v30 = 0;
    }
LABEL_57:
    *((void *)this + 15) = v30;
LABEL_31:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_31;
  }
  return result;
}

void sub_1C8BD375C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluexternal::TurnInput::~TurnInput(sirinluexternal::TurnInput *this)
{
  sirinluexternal::TurnInput::~TurnInput(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  uint64_t vars8;

  *(void *)this = &unk_1F232E7C8;
  unint64_t v2 = *((void *)this + 17);
  *((void *)this + 17) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 16);
  *((void *)this + 16) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  unint64_t v6 = (void **)((char *)this + 96);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  int v4 = *((void *)this + 11);
  *((void *)this + 11) = 0;
  if (v4) {
    std::default_delete<std::string>::operator()[abi:ne180100](v4);
  }
  unint64_t v6 = (void **)((char *)this + 64);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  uint64_t v5 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  if (*((void *)this + 4))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 4);
    operator delete(*((void **)this + 4));
  }
  unint64_t v6 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  PB::Base::~Base(this);
}

double sirinluexternal::TurnInput::TurnInput(sirinluexternal::TurnInput *this)
{
  *(void *)this = &unk_1F232E7C8;
  *((_DWORD *)this + 37) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232E7C8;
  *((_DWORD *)this + 37) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  return result;
}

uint64_t sirinluexternal::TurnInput::TurnInput(uint64_t this, const sirinluexternal::TurnInput *a2)
{
  *(void *)this = &unk_1F232E7C8;
  *(_OWORD *)(this + 8) = 0u;
  *(void *)(this + 128) = 0;
  *(_DWORD *)(this + 148) = 0;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_OWORD *)(this + 72) = 0u;
  *(_OWORD *)(this + 88) = 0u;
  *(_OWORD *)(this + 104) = 0u;
  *(void *)(this + 136) = 0;
  if (*((void *)a2 + 16)) {
    operator new();
  }
  if (*((void *)a2 + 12) != *((void *)a2 + 13)) {
    PB::PtrVector<sirinluexternal::EntityCandidate>::emplace_back<sirinluexternal::EntityCandidate const&>();
  }
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    PB::PtrVector<sirinluexternal::Task>::emplace_back<sirinluexternal::Task const&>();
  }
  if (*((void *)a2 + 8) != *((void *)a2 + 9)) {
    PB::PtrVector<sirinluexternal::Task>::emplace_back<sirinluexternal::Task const&>();
  }
  if (*((void *)a2 + 4) != *((void *)a2 + 5)) {
    operator new();
  }
  if (*((void *)a2 + 17)) {
    operator new();
  }
  if (*((void *)a2 + 11)) {
    operator new();
  }
  char v2 = *((unsigned char *)a2 + 148);
  if ((v2 & 2) != 0)
  {
    char v3 = *((unsigned char *)a2 + 144);
    *(unsigned char *)(this + 148) |= 2u;
    *(unsigned char *)(this + 144) = v3;
    char v2 = *((unsigned char *)a2 + 148);
  }
  if (v2)
  {
    uint64_t v4 = *((void *)a2 + 15);
    *(unsigned char *)(this + 148) |= 1u;
    *(void *)(this + 120) = v4;
  }
  if (*((void *)a2 + 7)) {
    operator new();
  }
  return this;
}

void sub_1C8BD3D9C(void *a1)
{
}

uint64_t sirinluexternal::TurnInput::operator=(uint64_t a1, const sirinluexternal::TurnInput *a2)
{
  if ((const sirinluexternal::TurnInput *)a1 != a2)
  {
    sirinluexternal::TurnInput::TurnInput((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::TurnInput *)v5, v3);
    sirinluexternal::TurnInput::~TurnInput((sirinluexternal::TurnInput *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::TurnInput *a2, sirinluexternal::TurnInput *a3)
{
  int v3 = *(_DWORD *)(this + 148);
  *(_DWORD *)(this + 148) = *((_DWORD *)a2 + 37);
  *((_DWORD *)a2 + 37) = v3;
  uint64_t v4 = *(void *)(this + 128);
  *(void *)(this + 128) = *((void *)a2 + 16);
  *((void *)a2 + 16) = v4;
  uint64_t v5 = *(void *)(this + 96);
  *(void *)(this + 96) = *((void *)a2 + 12);
  *((void *)a2 + 12) = v5;
  uint64_t v6 = *(void *)(this + 104);
  *(void *)(this + 104) = *((void *)a2 + 13);
  *((void *)a2 + 13) = v6;
  uint64_t v7 = *(void *)(this + 112);
  uint64_t v8 = *(void *)(this + 120);
  uint64_t v9 = *((void *)a2 + 15);
  *(void *)(this + 112) = *((void *)a2 + 14);
  *(void *)(this + 120) = v9;
  *((void *)a2 + 14) = v7;
  uint64_t v10 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v10;
  uint64_t v11 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v11;
  uint64_t v12 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v12;
  uint64_t v13 = *(void *)(this + 64);
  *(void *)(this + 64) = *((void *)a2 + 8);
  *((void *)a2 + 8) = v13;
  uint64_t v14 = *(void *)(this + 72);
  *(void *)(this + 72) = *((void *)a2 + 9);
  *((void *)a2 + 9) = v14;
  uint64_t v15 = *(void *)(this + 80);
  *(void *)(this + 80) = *((void *)a2 + 10);
  *((void *)a2 + 10) = v15;
  uint64_t v16 = *(void *)(this + 32);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v16;
  uint64_t v17 = *(void *)(this + 40);
  *(void *)(this + 40) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v17;
  uint64_t v18 = *(void *)(this + 48);
  *(void *)(this + 48) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v18;
  uint64_t v19 = *(void *)(this + 136);
  *(void *)(this + 136) = *((void *)a2 + 17);
  *((void *)a2 + 17) = v19;
  uint64_t v20 = *(void *)(this + 88);
  *(void *)(this + 88) = *((void *)a2 + 11);
  *((void *)a2 + 11) = v20;
  LOBYTE(v20) = *(unsigned char *)(this + 144);
  *(unsigned char *)(this + 144) = *((unsigned char *)a2 + 144);
  *((unsigned char *)a2 + 144) = v20;
  *((void *)a2 + 15) = v8;
  uint64_t v21 = *(void *)(this + 56);
  *(void *)(this + 56) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v21;
  return this;
}

uint64_t sirinluexternal::TurnInput::TurnInput(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (void **)(a1 + 8);
  *(void *)a1 = &unk_1F232E7C8;
  uint64_t v5 = (void **)(a1 + 64);
  uint64_t v6 = (void **)(a1 + 96);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 148) = *(_DWORD *)(a2 + 148);
  *(_DWORD *)(a2 + 148) = 0;
  uint64_t v7 = *(void *)(a2 + 128);
  *(void *)(a2 + 128) = 0;
  uint64_t v8 = *(void *)(a1 + 128);
  *(void *)(a1 + 128) = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v6);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = 0;
  *(void *)(a2 + 112) = 0;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v5);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  if (*(void *)(a1 + 32))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 32));
    operator delete(*(void **)(a1 + 32));
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  uint64_t v9 = *(void *)(a2 + 136);
  *(void *)(a2 + 136) = 0;
  uint64_t v10 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  uint64_t v11 = *(void *)(a2 + 88);
  *(void *)(a2 + 88) = 0;
  uint64_t v12 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = v11;
  if (v12) {
    std::default_delete<std::string>::operator()[abi:ne180100](v12);
  }
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v13 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v14 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v13;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  return a1;
}

uint64_t sirinluexternal::TurnInput::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::TurnInput::TurnInput((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::TurnInput *)v5, v3);
    sirinluexternal::TurnInput::~TurnInput((sirinluexternal::TurnInput *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::TurnInput::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 128);
  uint64_t v5 = *(void *)(a2 + 128);
  if (v4)
  {
    if (!v5 || (sirinluexternal::SystemDialogActGroup::operator==(v4, v5) & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t result = PB::PtrVector<sirinluexternal::EntityCandidate>::operator==((uint64_t *)(a1 + 96), *(uint64_t **)(a2 + 96), *(void *)(a2 + 104));
  if (!result) {
    return result;
  }
  uint64_t result = PB::PtrVector<sirinluexternal::Task>::operator==((uint64_t *)(a1 + 8), *(void ***)(a2 + 8), *(void *)(a2 + 16));
  if (!result) {
    return result;
  }
  uint64_t result = PB::PtrVector<sirinluexternal::Task>::operator==((uint64_t *)(a1 + 64), *(void ***)(a2 + 64), *(void *)(a2 + 72));
  if (!result) {
    return result;
  }
  uint64_t v8 = *(uint64_t **)(a1 + 32);
  uint64_t v7 = *(uint64_t **)(a1 + 40);
  uint64_t v9 = *(uint64_t **)(a2 + 32);
  if ((char *)v7 - (char *)v8 != *(void *)(a2 + 40) - (void)v9) {
    return 0;
  }
  while (v8 != v7)
  {
    uint64_t result = sirinluexternal::AsrHypothesis::operator==(*v8, *v9);
    if (!result) {
      return result;
    }
    ++v8;
    ++v9;
  }
  uint64_t v10 = *(void *)(a1 + 136);
  uint64_t v11 = *(void *)(a2 + 136);
  if (v10)
  {
    if (!v11 || !sirinluexternal::TurnContext::operator==(v10, v11)) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  uint64_t v12 = *(unsigned __int8 **)(a1 + 88);
  uint64_t v13 = *(unsigned __int8 **)(a2 + 88);
  if (v12)
  {
    if (!v13 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v12, v13)) {
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 148) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 148) & 2) == 0 || *(unsigned __int8 *)(a1 + 144) != *(unsigned __int8 *)(a2 + 144)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 148) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 148) & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 148) & 1) == 0) {
      goto LABEL_35;
    }
    return 0;
  }
  if ((*(unsigned char *)(a2 + 148) & 1) == 0 || *(void *)(a1 + 120) != *(void *)(a2 + 120)) {
    return 0;
  }
LABEL_35:
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a2 + 56);
  uint64_t result = (v14 | v15) == 0;
  if (v14 && v15)
  {
    if (*(unsigned char *)(v14 + 12))
    {
      if ((*(unsigned char *)(v15 + 12) & 1) != 0 && *(_DWORD *)(v14 + 8) == *(_DWORD *)(v15 + 8)) {
        return 1;
      }
    }
    else if ((*(unsigned char *)(v15 + 12) & 1) == 0)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sirinluexternal::TurnInput::hash_value(sirinluexternal::TurnInput *this)
{
  char v2 = (sirinluexternal::SystemDialogActGroup *)*((void *)this + 16);
  if (v2) {
    unint64_t v3 = sirinluexternal::SystemDialogActGroup::hash_value(v2);
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = (sirinluexternal::EntityCandidate **)*((void *)this + 12);
  uint64_t v5 = (sirinluexternal::EntityCandidate **)*((void *)this + 13);
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *v4++;
      v6 ^= sirinluexternal::EntityCandidate::hash_value(v7);
    }
    while (v4 != v5);
  }
  uint64_t v8 = (sirinluexternal::Task **)*((void *)this + 1);
  uint64_t v9 = (sirinluexternal::Task **)*((void *)this + 2);
  if (v8 == v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = *v8++;
      v10 ^= sirinluexternal::Task::hash_value(v11);
    }
    while (v8 != v9);
  }
  uint64_t v12 = (sirinluexternal::Task **)*((void *)this + 8);
  uint64_t v13 = (sirinluexternal::Task **)*((void *)this + 9);
  if (v12 == v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = *v12++;
      v14 ^= sirinluexternal::Task::hash_value(v15);
    }
    while (v12 != v13);
  }
  uint64_t v16 = (sirinluexternal::AsrHypothesis **)*((void *)this + 4);
  uint64_t v17 = (sirinluexternal::AsrHypothesis **)*((void *)this + 5);
  if (v16 == v17)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = *v16++;
      v18 ^= sirinluexternal::AsrHypothesis::hash_value(v19);
    }
    while (v16 != v17);
  }
  uint64_t v20 = (sirinluexternal::TurnContext *)*((void *)this + 17);
  if (v20) {
    unint64_t v21 = sirinluexternal::TurnContext::hash_value(v20);
  }
  else {
    unint64_t v21 = 0;
  }
  unint64_t v22 = *((void *)this + 11);
  if (v22) {
    unint64_t v22 = std::__string_hash<char>::operator()[abi:ne180100](v22);
  }
  if ((*((unsigned char *)this + 148) & 2) != 0)
  {
    uint64_t v23 = *((unsigned __int8 *)this + 144);
    if (*((unsigned char *)this + 148)) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if (*((unsigned char *)this + 148))
    {
LABEL_31:
      uint64_t v24 = *((void *)this + 15);
      goto LABEL_34;
    }
  }
  uint64_t v24 = 0;
LABEL_34:
  uint64_t v25 = *((void *)this + 7);
  if (v25)
  {
    if (*(unsigned char *)(v25 + 12)) {
      uint64_t v25 = *(int *)(v25 + 8);
    }
    else {
      uint64_t v25 = 0;
    }
  }
  return v6 ^ v3 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v10 ^ v14 ^ v18;
}

uint64_t sirinluexternal::TurnInput::makeSystemDialogActGroup(uint64_t this)
{
  if (!*(void *)(this + 128)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::TurnInput::makeTurnContext(uint64_t this)
{
  if (!*(void *)(this + 136)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::TurnInput::makeCorrectionOutcomeOverride(uint64_t this)
{
  if (!*(void *)(this + 56)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::PayloadAttachmentInfo::formatText(sirinluexternal::PayloadAttachmentInfo *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 12)) {
    PB::TextFormatter::format(a2, "attachment_type");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::PayloadAttachmentInfo::writeTo(uint64_t this, PB::Writer *a2)
{
  if (*(unsigned char *)(this + 12)) {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t sirinluexternal::PayloadAttachmentInfo::readFrom(sirinluexternal::PayloadAttachmentInfo *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_29;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        *((unsigned char *)this + 12) |= 1u;
        unint64_t v19 = *((void *)a2 + 1);
        unint64_t v3 = *((void *)a2 + 2);
        uint64_t v20 = *(void *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v3)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v23 = 0;
          if (v3 <= v19) {
            unint64_t v2 = *((void *)a2 + 1);
          }
          else {
            unint64_t v2 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v2 == v19)
            {
              LODWORD(v23) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_43;
            }
            unint64_t v28 = v19 + 1;
            char v29 = *(unsigned char *)(v20 + v19);
            *((void *)a2 + 1) = v28;
            v23 |= (unint64_t)(v29 & 0x7F) << v26;
            if ((v29 & 0x80) == 0) {
              break;
            }
            v26 += 7;
            unint64_t v19 = v28;
            BOOL v14 = v27++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_42;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v23) = 0;
          }
LABEL_42:
          unint64_t v2 = v28;
        }
        else
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (1)
          {
            unint64_t v2 = v19 + 1;
            *((void *)a2 + 1) = v19 + 1;
            char v24 = *(unsigned char *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v21 += 7;
            unint64_t v19 = v2;
            BOOL v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_43:
        *((_DWORD *)this + 2) = v23;
      }
      else
      {
LABEL_29:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v2 = *((void *)a2 + 1);
        unint64_t v3 = *((void *)a2 + 2);
      }
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_29;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::PayloadAttachmentInfo::~PayloadAttachmentInfo(sirinluexternal::PayloadAttachmentInfo *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1CB772580);
}

void *sirinluexternal::PayloadAttachmentInfo::PayloadAttachmentInfo(void *this)
{
  *this = &unk_1F232E818;
  this[1] = 0;
  return this;
}

{
  *this = &unk_1F232E818;
  this[1] = 0;
  return this;
}

uint64_t sirinluexternal::PayloadAttachmentInfo::PayloadAttachmentInfo(uint64_t this, const sirinluexternal::PayloadAttachmentInfo *a2)
{
  *(void *)this = &unk_1F232E818;
  *(void *)(this + 8) = 0;
  if (*((unsigned char *)a2 + 12))
  {
    int v2 = *((_DWORD *)a2 + 2);
    *(unsigned char *)(this + 12) = 1;
    *(_DWORD *)(this + 8) = v2;
  }
  return this;
}

{
  int v2;

  *(void *)this = &unk_1F232E818;
  *(void *)(this + 8) = 0;
  if (*((unsigned char *)a2 + 12))
  {
    int v2 = *((_DWORD *)a2 + 2);
    *(unsigned char *)(this + 12) = 1;
    *(_DWORD *)(this + 8) = v2;
  }
  return this;
}

uint64_t sirinluexternal::PayloadAttachmentInfo::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    v6[0] = &unk_1F232E818;
    int v3 = *(unsigned __int8 *)(a2 + 12);
    uint64_t v4 = *(void *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = (v3 << 31 >> 31) & *(_DWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 12) = v3 & 1;
    v6[1] = v4;
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;
  void v6[2];

  if (a1 != a2)
  {
    v6[0] = &unk_1F232E818;
    int v3 = *(void *)(a2 + 8);
    *(_DWORD *)(a2 + 12) = 0;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v3;
    v6[1] = v4;
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::PayloadAttachmentInfo *a2, sirinluexternal::PayloadAttachmentInfo *a3)
{
  int v3 = *(_DWORD *)(this + 12);
  *(_DWORD *)(this + 12) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v3;
  int v4 = *(_DWORD *)(this + 8);
  *(_DWORD *)(this + 8) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v4;
  return this;
}

uint64_t sirinluexternal::PayloadAttachmentInfo::PayloadAttachmentInfo(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = &unk_1F232E818;
  *(_DWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  return result;
}

{
  *(void *)uint64_t result = &unk_1F232E818;
  *(_DWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  return result;
}

BOOL sirinluexternal::PayloadAttachmentInfo::operator==(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 12);
  BOOL result = (*(unsigned char *)(a2 + 12) & 1) == 0;
  if (v3) {
    return (*(unsigned char *)(a2 + 12) & 1) != 0 && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8);
  }
  return result;
}

uint64_t sirinluexternal::PayloadAttachmentInfo::hash_value(sirinluexternal::PayloadAttachmentInfo *this)
{
  if (*((unsigned char *)this + 12)) {
    return *((int *)this + 2);
  }
  else {
    return 0;
  }
}

uint64_t sirinluexternalnlu_router::RequestSummary::formatText(sirinluexternalnlu_router::RequestSummary *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "turn_summaries");
  }
  if (*((void *)this + 4)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternalnlu_router::RequestSummary::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 32)) {
    this = PB::Writer::write();
  }
  uint64_t v5 = *(const PB::Base ***)(v3 + 8);
  int v4 = *(const PB::Base ***)(v3 + 16);
  while (v5 != v4)
  {
    uint64_t v6 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  return this;
}

uint64_t sirinluexternalnlu_router::RequestSummary::readFrom(sirinluexternalnlu_router::RequestSummary *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_1C8BD507C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluexternalnlu_router::RequestSummary::~RequestSummary(sirinluexternalnlu_router::RequestSummary *this)
{
  sirinluexternalnlu_router::RequestSummary::~RequestSummary(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_1F232E868;
  unint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  if (*((void *)this + 1))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 1);
    operator delete(*((void **)this + 1));
  }
  PB::Base::~Base(this);
}

double sirinluexternalnlu_router::RequestSummary::RequestSummary(sirinluexternalnlu_router::RequestSummary *this)
{
  *(void *)this = &unk_1F232E868;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232E868;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

uint64_t sirinluexternalnlu_router::RequestSummary::RequestSummary(uint64_t this, const sirinluexternalnlu_router::RequestSummary *a2)
{
  *(void *)this = &unk_1F232E868;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    operator new();
  }
  return this;
}

void sub_1C8BD5380(void *a1)
{
}

uint64_t sirinluexternalnlu_router::RequestSummary::operator=(uint64_t a1, const sirinluexternalnlu_router::RequestSummary *a2)
{
  if ((const sirinluexternalnlu_router::RequestSummary *)a1 != a2)
  {
    sirinluexternalnlu_router::RequestSummary::RequestSummary((uint64_t)v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v7 = v3;
    long long v8 = v4;
    sirinluexternalnlu_router::RequestSummary::~RequestSummary((sirinluexternalnlu_router::RequestSummary *)v6);
  }
  return a1;
}

void *sirinluexternalnlu_router::swap(void *this, sirinluexternalnlu_router::RequestSummary *a2, sirinluexternalnlu_router::RequestSummary *a3)
{
  uint64_t v3 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v3;
  uint64_t v4 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v5;
  uint64_t v6 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  return this;
}

uint64_t sirinluexternalnlu_router::RequestSummary::RequestSummary(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (void **)(a1 + 8);
  *(void *)a1 = &unk_1F232E868;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v5;
  if (v6) {
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  }
  if (*v4)
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100](v4);
    operator delete(*v4);
    *uint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluexternalnlu_router::RequestSummary::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternalnlu_router::RequestSummary::RequestSummary((uint64_t)v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v7 = v3;
    long long v8 = v4;
    sirinluexternalnlu_router::RequestSummary::~RequestSummary((sirinluexternalnlu_router::RequestSummary *)v6);
  }
  return a1;
}

BOOL sirinluexternalnlu_router::RequestSummary::operator==(void *a1, uint64_t a2)
{
  long long v4 = (unsigned __int8 *)a1[4];
  uint64_t v5 = *(unsigned __int8 ***)(a2 + 32);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      long long v7 = (unsigned __int8 *)v4[23];
    }
    else {
      long long v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    long long v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      long long v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      unint64_t v10 = *(unsigned __int8 **)(a2 + 32);
    }
    else {
      unint64_t v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_18;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  uint64_t v11 = a1[1];
  uint64_t v12 = a1[2];
  uint64_t v14 = a2 + 8;
  BOOL v13 = *(uint64_t **)(a2 + 8);
  if (v12 - v11 != *(void *)(v14 + 8) - (void)v13) {
    return 0;
  }
  if (v11 == v12) {
    return 1;
  }
  uint64_t v15 = v11 + 8;
  do
  {
    uint64_t v16 = *v13++;
    BOOL result = sirinluexternalnlu_router::TurnSummary::operator==(*(void *)(v15 - 8), v16);
    BOOL v18 = !result || v15 == v12;
    v15 += 8;
  }
  while (!v18);
  return result;
}

unint64_t sirinluexternalnlu_router::RequestSummary::hash_value(sirinluexternalnlu_router::RequestSummary *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v5 = (sirinluexternalnlu_router::TurnSummary **)*((void *)this + 1);
  long long v4 = (sirinluexternalnlu_router::TurnSummary **)*((void *)this + 2);
  if (v5 == v4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      long long v7 = *v5++;
      v6 ^= sirinluexternalnlu_router::TurnSummary::hash_value(v7);
    }
    while (v5 != v4);
  }
  return v6 ^ v3;
}

uint64_t SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponseReadFrom(void *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(SIRINLUINTERNALMatchingSpan);
        [a1 addContextualSpans:v17];
        if (!PBReaderPlaceMark() || (SIRINLUINTERNALMatchingSpanReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t SIRINLUINTERNALITFMITFMParserResponseReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
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
        *(unsigned char *)(a1 + 36) |= 2u;
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
            goto LABEL_38;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_40;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_38:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_40:
        *(unsigned char *)(a1 + 32) = v20 != 0;
        goto LABEL_43;
      case 2u:
        *(unsigned char *)(a1 + 36) |= 1u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(void *)(a2 + *v4))
        {
          int v28 = *(_DWORD *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v28 = 0;
        }
        *(_DWORD *)(a1 + 8) = v28;
        goto LABEL_43;
      case 3u:
        char v29 = objc_alloc_init(SIRINLUEXTERNALParser);
        objc_storeStrong((id *)(a1 + 24), v29);
        if (!PBReaderPlaceMark() || !SIRINLUEXTERNALParserReadFrom((uint64_t)v29, a2)) {
          goto LABEL_45;
        }
        goto LABEL_36;
      case 4u:
        char v29 = objc_alloc_init(SIRINLUINTERNALITFMITFMHypothesis);
        [(id)a1 addHypotheses:v29];
        if PBReaderPlaceMark() && (SIRINLUINTERNALITFMITFMHypothesisReadFrom((uint64_t)v29, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_45:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_43;
    }
  }
}

uint64_t siri::ontology::createUsoGraphProtoReaderLogContext(siri::ontology *this)
{
  if (siri::ontology::createUsoGraphProtoReaderLogContext(void)::once != -1) {
    dispatch_once(&siri::ontology::createUsoGraphProtoReaderLogContext(void)::once, &__block_literal_global_15248);
  }
  return siri::ontology::createUsoGraphProtoReaderLogContext(void)::rdLogContext;
}

os_log_t ___ZN4siri8ontology35createUsoGraphProtoReaderLogContextEv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.siri.SiriNLUTypes.Serializer", "UsoGraphProtoReader");
  siri::ontology::createUsoGraphProtoReaderLogContext(void)::rdLogContext = (uint64_t)result;
  return result;
}

uint64_t siri::ontology::UsoGraphProtoReader::getOrCreateNodeName(siri::ontology::UsoGraphProtoReader *this, const sirinluexternal::UsoNode *a2)
{
  unsigned int v2 = *((_DWORD *)a2 + 18);
  if (v2)
  {
    uint64_t v3 = MEMORY[0x1CB7723C0](*(void *)this, *((unsigned int *)a2 + 18));
    if (!v4)
    {
      std::string::basic_string[abi:ne180100]<0>(v16, "UsoGraphProtoReaderException");
      std::to_string(&v12, v2);
      unsigned int v9 = std::string::insert(&v12, 0, "Invalid node element id: ");
      long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
      std::string::size_type v14 = v9->__r_.__value_.__r.__words[2];
      long long v13 = v10;
      v9->__r_.__value_.__l.__size_ = 0;
      v9->__r_.__value_.__r.__words[2] = 0;
      v9->__r_.__value_.__r.__words[0] = 0;
      siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,std::string>((uint64_t)v16, 66, "getOrCreateNodeName");
    }
    return v3;
  }
  else
  {
    uint64_t v6 = (long long *)*((void *)a2 + 1);
    if (!v6)
    {
      uint64_t v11 = std::string::basic_string[abi:ne180100]<0>(v16, "UsoGraphProtoReaderException");
      siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,char const*>((uint64_t)v11, 55, "getOrCreateNodeName", "element id 0 (custom) used without an entity label set");
    }
    if (*((char *)v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)v6, *((void *)v6 + 1));
    }
    else
    {
      long long v7 = *v6;
      v15.__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
      *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v7;
    }
    uint64_t CustomEntityName = siri::ontology::UsoVocabManager::createCustomEntityName();
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
  }
  return CustomEntityName;
}

void sub_1C8BD7240(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v28 - 17) < 0) {
    operator delete(*(void **)(v28 - 40));
  }
  _Unwind_Resume(exception_object);
}

void siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,char const*>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  exception = __cxa_allocate_exception(0x70uLL);
  std::string::basic_string[abi:ne180100]<0>(v9, "/Library/Caches/com.apple.xbs/Sources/SiriNLUTypes/serializers/SiriOntology/cpp/UsoGraphProtoReader.cpp");
  std::string::basic_string[abi:ne180100]<0>(v8, a3);
  std::string::basic_string[abi:ne180100]<0>(v7, a4);
  siri::ontology::OntologyBaseException::OntologyBaseException();
  void *exception = &unk_1F232E930;
}

void sub_1C8BD7368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0)
  {
    operator delete(a22);
    if ((v28 & 1) == 0) {
LABEL_10:
    }
      _Unwind_Resume(a1);
  }
  else if (!v28)
  {
    goto LABEL_10;
  }
  __cxa_free_exception(v27);
  goto LABEL_10;
}

void siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,std::string>(uint64_t a1, uint64_t a2, char *a3)
{
  exception = __cxa_allocate_exception(0x70uLL);
  std::string::basic_string[abi:ne180100]<0>(v6, "/Library/Caches/com.apple.xbs/Sources/SiriNLUTypes/serializers/SiriOntology/cpp/UsoGraphProtoReader.cpp");
  std::string::basic_string[abi:ne180100]<0>(v5, a3);
  siri::ontology::OntologyBaseException::OntologyBaseException();
  void *exception = &unk_1F232E930;
}

void sub_1C8BD749C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0)
  {
    operator delete(a15);
    if ((v21 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
}

void siri::ontology::UsoGraphProtoReaderException::~UsoGraphProtoReaderException(std::exception *this)
{
  siri::ontology::OntologyBaseException::~OntologyBaseException(this);
  JUMPOUT(0x1CB772580);
}

uint64_t siri::ontology::UsoGraphProtoReader::getOrCreateEdgeName(siri::ontology::UsoVocabManager **this, const sirinluexternal::UsoEdgeLabel *a2)
{
  unsigned int v2 = *((_DWORD *)a2 + 5);
  if (v2)
  {
    uint64_t EdgeName = siri::ontology::UsoVocabManager::getEdgeName(*this);
    if (!v4)
    {
      std::string::basic_string[abi:ne180100]<0>(v19, "UsoGraphProtoReaderException");
      std::to_string(&v15, v2);
      std::string v12 = std::string::insert(&v15, 0, "Invalid edge element id: ");
      long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
      std::string::size_type v17 = v12->__r_.__value_.__r.__words[2];
      long long v16 = v13;
      v12->__r_.__value_.__l.__size_ = 0;
      v12->__r_.__value_.__r.__words[2] = 0;
      v12->__r_.__value_.__r.__words[0] = 0;
      siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,std::string>((uint64_t)v19, 91, "getOrCreateEdgeName");
    }
    return EdgeName;
  }
  uint64_t v6 = *((void *)a2 + 1);
  if (!v6)
  {
    std::string::size_type v14 = std::string::basic_string[abi:ne180100]<0>(v19, "UsoGraphProtoReaderException");
    siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,char const*>((uint64_t)v14, 77, "getOrCreateEdgeName", "baseEdgeLabel is NULL when edgeId being 0 (i.e. custom edge)");
  }
  uint64_t v7 = *(void *)(v6 + 8);
  if (!v7) {
    goto LABEL_14;
  }
  if ((*(char *)(v7 + 23) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v7 + 23))
    {
      std::string::size_type v8 = *(void *)(v7 + 16);
      *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)v7;
      v18.__r_.__value_.__r.__words[2] = v8;
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v11 = std::string::basic_string[abi:ne180100]<0>(v19, "UsoGraphProtoReaderException");
    siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,char const*>((uint64_t)v11, 82, "getOrCreateEdgeName", "Empty baseEdgeLabel when edgeId being 0 (i.e. custom edge)");
  }
  std::string::size_type v9 = *(void *)(v7 + 8);
  if (!v9) {
    goto LABEL_14;
  }
  std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)v7, v9);
LABEL_11:
  Customuint64_t EdgeName = siri::ontology::UsoVocabManager::createCustomEdgeName();
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  return CustomEdgeName;
}

void sub_1C8BD76AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v28 - 17) < 0) {
    operator delete(*(void **)(v28 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t siri::ontology::UsoGraphProtoReader::getOrCreateVerbName(siri::ontology::UsoVocabManager **this, const sirinluexternal::UsoNode *a2)
{
  unsigned int v2 = *(_DWORD *)(*((void *)a2 + 7) + 8);
  if (v2)
  {
    uint64_t VerbName = siri::ontology::UsoVocabManager::getVerbName(*this);
    if (!v4)
    {
      std::string::basic_string[abi:ne180100]<0>(v16, "UsoGraphProtoReaderException");
      std::to_string(&v12, v2);
      std::string::size_type v9 = std::string::insert(&v12, 0, "Invalid verb element id: ");
      long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
      std::string::size_type v14 = v9->__r_.__value_.__r.__words[2];
      long long v13 = v10;
      v9->__r_.__value_.__l.__size_ = 0;
      v9->__r_.__value_.__r.__words[2] = 0;
      v9->__r_.__value_.__r.__words[0] = 0;
      siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,std::string>((uint64_t)v16, 109, "getOrCreateVerbName");
    }
    return VerbName;
  }
  else
  {
    uint64_t v6 = (long long *)*((void *)a2 + 8);
    if (!v6)
    {
      uint64_t v11 = std::string::basic_string[abi:ne180100]<0>(v16, "UsoGraphProtoReaderException");
      siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,char const*>((uint64_t)v11, 100, "getOrCreateVerbName", "verb element id 0 (custom) used without a verbLabel set");
    }
    if (*((char *)v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)v6, *((void *)v6 + 1));
    }
    else
    {
      long long v7 = *v6;
      v15.__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
      *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v7;
    }
    Customuint64_t VerbName = siri::ontology::UsoVocabManager::createCustomVerbName();
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
  }
  return CustomVerbName;
}

void sub_1C8BD7848(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v28 - 17) < 0) {
    operator delete(*(void **)(v28 - 40));
  }
  _Unwind_Resume(exception_object);
}

void siri::ontology::populateUtteranceSpan(siri::ontology *this, const sirinluexternal::UtteranceSpan *a2)
{
}

void siri::ontology::populateAlternative(siri::ontology *this, const sirinluexternal::AsrAlternative *a2)
{
  if (*((void *)this + 1)) {
    operator new();
  }
  std::string::basic_string[abi:ne180100]<0>(&v2, "UsoGraphProtoReaderException");
  siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,char const*>((uint64_t)&v2, 133, "populateAlternative", "AsrAlternative without alternative value");
}

void sub_1C8BD7A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  MEMORY[0x1CB772580](v14, 0x1012C40F498771DLL);
  _Unwind_Resume(a1);
}

void siri::ontology::populateSpanProperty(siri::ontology *this, const sirinluexternal::SpanProperty *a2)
{
  if (*((void *)this + 1)) {
    operator new();
  }
  std::string::basic_string[abi:ne180100]<0>(&v2, "UsoGraphProtoReaderException");
  siri::ontology::throwException<siri::ontology::UsoGraphProtoReaderException,char const*,int,char const*,char const*>((uint64_t)&v2, 148, "populateSpanProperty", "span property map without a key existance");
}

void sub_1C8BD7BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  *std::string v15 = 0;
  std::default_delete<siri::ontology::SpanProperty>::operator()[abi:ne180100](v14);
  _Unwind_Resume(a1);
}

uint64_t std::default_delete<siri::ontology::SpanProperty>::operator()[abi:ne180100](uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 48) && *(char *)(result + 47) < 0) {
      operator delete(*(void **)(result + 24));
    }
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    JUMPOUT(0x1CB772580);
  }
  return result;
}

void siri::ontology::populateMatchInfo(siri::ontology *this, const sirinluexternal::MatchInfo *a2)
{
}

void sub_1C8BD8004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t *a9)
{
  if (v9) {
    operator delete(v9);
  }
  uint64_t v11 = *a9;
  *a9 = 0;
  if (v11) {
    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v11);
  }
  _Unwind_Resume(exception_object);
}

void std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](uint64_t a1)
{
  long long v2 = *(void **)(a1 + 72);
  if (v2)
  {
    *(void *)(a1 + 80) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1CB772580);
}

uint64_t siri::ontology::buildEntitySpanMap(uint64_t result)
{
  if (*(void *)(result + 104) != *(void *)(result + 112)) {
    operator new();
  }
  return result;
}

void sub_1C8BD84E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void sub_1C8BD8528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    std::default_delete<siri::ontology::AsrAlternative>::operator()[abi:ne180100](a10);
  }
  JUMPOUT(0x1C8BD8518);
}

__n128 std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(uint64_t a1, __n128 *a2)
{
  if (*(unsigned __int8 *)(a1 + 24) == a2[1].n128_u8[8])
  {
    if (*(unsigned char *)(a1 + 24))
    {
      if (*(char *)(a1 + 23) < 0) {
        operator delete(*(void **)a1);
      }
      __n128 result = *a2;
      *(void *)(a1 + 16) = a2[1].n128_u64[0];
      *(__n128 *)a1 = result;
      a2[1].n128_u8[7] = 0;
      a2->n128_u8[0] = 0;
    }
  }
  else if (*(unsigned char *)(a1 + 24))
  {
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    *(unsigned char *)(a1 + 24) = 0;
  }
  else
  {
    __n128 result = *a2;
    *(void *)(a1 + 16) = a2[1].n128_u64[0];
    *(__n128 *)a1 = result;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    a2->n128_u64[0] = 0;
    *(unsigned char *)(a1 + 24) = 1;
  }
  return result;
}

void std::default_delete<siri::ontology::AsrAlternative>::operator()[abi:ne180100](uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  JUMPOUT(0x1CB772580);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t *a1, unint64_t a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v7 = a1[1];
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    std::string::size_type v9 = *(void ***)(*a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  std::string v12 = a1 + 2;
  uint64_t i = operator new(0x30uLL);
  *uint64_t i = 0;
  i[1] = v5;
  i[2] = *a3;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  float v13 = (float)(unint64_t)(a1[3] + 1);
  float v14 = *((float *)a1 + 8);
  if (v7 && (float)(v14 * (float)v7) >= v13)
  {
    unint64_t v5 = v3;
    goto LABEL_64;
  }
  BOOL v15 = 1;
  if (v7 >= 3) {
    BOOL v15 = (v7 & (v7 - 1)) != 0;
  }
  unint64_t v16 = v15 | (2 * v7);
  unint64_t v17 = vcvtps_u32_f32(v13 / v14);
  if (v16 <= v17) {
    int8x8_t prime = (int8x8_t)v17;
  }
  else {
    int8x8_t prime = (int8x8_t)v16;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v7 = a1[1];
  }
  if (*(void *)&prime <= v7)
  {
    if (*(void *)&prime >= v7) {
      goto LABEL_60;
    }
    unint64_t v25 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
    if (v7 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
    {
      unint64_t v25 = std::__next_prime(v25);
    }
    else
    {
      uint64_t v27 = 1 << -(char)__clz(v25 - 1);
      if (v25 >= 2) {
        unint64_t v25 = v27;
      }
    }
    if (*(void *)&prime <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    if (*(void *)&prime >= v7)
    {
      unint64_t v7 = a1[1];
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      unsigned int v34 = (void *)*a1;
      *a1 = 0;
      if (v34) {
        operator delete(v34);
      }
      unint64_t v7 = 0;
      a1[1] = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unsigned int v19 = operator new(8 * *(void *)&prime);
  uint64_t v20 = (void *)*a1;
  *a1 = (uint64_t)v19;
  if (v20) {
    operator delete(v20);
  }
  uint64_t v21 = 0;
  a1[1] = (uint64_t)prime;
  do
    *(void *)(*a1 + 8 * v21++) = 0;
  while (*(void *)&prime != v21);
  uint64_t v22 = (void *)*v12;
  if (*v12)
  {
    unint64_t v23 = v22[1];
    uint8x8_t v24 = (uint8x8_t)vcnt_s8(prime);
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      if (v23 >= *(void *)&prime) {
        v23 %= *(void *)&prime;
      }
    }
    else
    {
      v23 &= *(void *)&prime - 1;
    }
    *(void *)(*a1 + 8 * v23) = v12;
    uint64_t v28 = (void *)*v22;
    if (*v22)
    {
      do
      {
        unint64_t v29 = v28[1];
        if (v24.u32[0] > 1uLL)
        {
          if (v29 >= *(void *)&prime) {
            v29 %= *(void *)&prime;
          }
        }
        else
        {
          v29 &= *(void *)&prime - 1;
        }
        if (v29 != v23)
        {
          if (!*(void *)(*a1 + 8 * v29))
          {
            *(void *)(*a1 + 8 * v29) = v22;
            goto LABEL_56;
          }
          *uint64_t v22 = *v28;
          *uint64_t v28 = **(void **)(*a1 + 8 * v29);
          **(void **)(*a1 + 8 * v29) = v28;
          uint64_t v28 = v22;
        }
        unint64_t v29 = v23;
LABEL_56:
        uint64_t v22 = v28;
        uint64_t v28 = (void *)*v28;
        unint64_t v23 = v29;
      }
      while (v28);
    }
  }
  unint64_t v7 = (unint64_t)prime;
LABEL_60:
  if ((v7 & (v7 - 1)) != 0)
  {
    if (v7 <= v5) {
      v5 %= v7;
    }
  }
  else
  {
    v5 &= v7 - 1;
  }
LABEL_64:
  uint64_t v30 = *a1;
  unint64_t v31 = *(void **)(*a1 + 8 * v5);
  if (v31)
  {
    *uint64_t i = *v31;
LABEL_72:
    *unint64_t v31 = i;
    goto LABEL_73;
  }
  *uint64_t i = *v12;
  *std::string v12 = i;
  *(void *)(v30 + 8 * v5) = v12;
  if (*i)
  {
    unint64_t v32 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v32 >= v7) {
        v32 %= v7;
      }
    }
    else
    {
      v32 &= v7 - 1;
    }
    unint64_t v31 = (void *)(*a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_1C8BD8A14(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void siri::ontology::UsoEntitySpan::~UsoEntitySpan(void **this)
{
  if (*((unsigned char *)this + 176) && *((char *)this + 175) < 0) {
    operator delete(this[19]);
  }
  unint64_t v3 = this + 16;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](&v3);
  unint64_t v3 = this + 11;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](&v3);
  if (*((unsigned char *)this + 80))
  {
    uint64_t v2 = (uint64_t)this[9];
    this[9] = 0;
    if (v2) {
      std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v2);
    }
  }
  if (*((unsigned char *)this + 64) && *((char *)this + 63) < 0) {
    operator delete(this[5]);
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((char *)this + 23) < 0) {
      operator delete(*this);
    }
  }
}

void **std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](void ***a1)
{
  __n128 result = *a1;
  *a1 = 0;
  if (result)
  {
    siri::ontology::UsoEntitySpan::~UsoEntitySpan(result);
    JUMPOUT(0x1CB772580);
  }
  return result;
}

void std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    char v4 = v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v7 = *--v4;
        uint64_t v6 = v7;
        *char v4 = 0;
        if (v7) {
          std::default_delete<siri::ontology::AsrAlternative>::operator()[abi:ne180100](v6);
        }
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    char v4 = v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v7 = *--v4;
        uint64_t v6 = v7;
        *char v4 = 0;
        if (v7) {
          std::default_delete<siri::ontology::SpanProperty>::operator()[abi:ne180100](v6);
        }
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    unint64_t v3 = __p + 3;
    std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void ***)**a1;
  if (v2)
  {
    char v4 = (void ***)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](--v4);
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void siri::ontology::UsoGraphProtoReader::fromProtobuf(siri::ontology::UsoGraphProtoReader *this, const sirinluexternal::UsoGraph *a2, siri::ontology::UsoGraph *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *((void *)a2 + 16);
  if (v3)
  {
    char v4 = (void *)(v3 + 8);
    unint64_t v5 = (int *)(v3 + 16);
  }
  else
  {
    char v4 = *(void **)(*(void *)this + 128);
    unint64_t v5 = (int *)(v4 + 1);
  }
  int v6 = *v5;
  *((void *)a3 + 1) = *v4;
  *((_DWORD *)a3 + 4) = v6;
  operator new();
}

void sub_1C8BD9F38(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100](v51 + 3);
  operator delete(v51);
  if (a2 == 2)
  {
    v55 = __cxa_begin_catch(a1);
    if (siri::ontology::createUsoGraphProtoReaderLogContext(void)::once != -1) {
      dispatch_once(&siri::ontology::createUsoGraphProtoReaderLogContext(void)::once, &__block_literal_global_15248);
    }
    v56 = siri::ontology::createUsoGraphProtoReaderLogContext(void)::rdLogContext;
    if (os_log_type_enabled((os_log_t)siri::ontology::createUsoGraphProtoReaderLogContext(void)::rdLogContext, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = (*(uint64_t (**)(void *))(*(void *)v55 + 16))(v55);
      *(_DWORD *)(v52 - 144) = 136315138;
      *(void *)(v52 - 140) = v59;
      _os_log_error_impl(&dword_1C8881000, v56, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)(v52 - 144), 0xCu);
    }
  }
  else
  {
    if (a2 != 1)
    {
      std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>>>::~__hash_table((uint64_t)&a29);
      std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>>>::~__hash_table((uint64_t)&a35);
      std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>>>::~__hash_table((uint64_t)&a45);
      if (v50) {
        operator delete(v50);
      }
      std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a50);
      _Unwind_Resume(a1);
    }
    int v57 = __cxa_begin_catch(a1);
    if (siri::ontology::createUsoGraphProtoReaderLogContext(void)::once != -1) {
      dispatch_once(&siri::ontology::createUsoGraphProtoReaderLogContext(void)::once, &__block_literal_global_15248);
    }
    unint64_t v58 = siri::ontology::createUsoGraphProtoReaderLogContext(void)::rdLogContext;
    if (os_log_type_enabled((os_log_t)siri::ontology::createUsoGraphProtoReaderLogContext(void)::rdLogContext, OS_LOG_TYPE_ERROR))
    {
      uint64_t v60 = (*(uint64_t (**)(void *))(*(void *)v57 + 16))(v57);
      *(_DWORD *)(v52 - 144) = 136315138;
      *(void *)(v52 - 140) = v60;
      _os_log_error_impl(&dword_1C8881000, v58, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)(v52 - 144), 0xCu);
    }
  }
  __cxa_end_catch();
  JUMPOUT(0x1C8BD9D04);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t *a1, unint64_t a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v7 = a1[1];
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    std::string::size_type v9 = *(void ***)(*a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  std::string v12 = a1 + 2;
  uint64_t i = operator new(0x30uLL);
  *uint64_t i = 0;
  i[1] = v5;
  i[2] = *a3;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  float v13 = (float)(unint64_t)(a1[3] + 1);
  float v14 = *((float *)a1 + 8);
  if (v7 && (float)(v14 * (float)v7) >= v13)
  {
    unint64_t v5 = v3;
    goto LABEL_64;
  }
  BOOL v15 = 1;
  if (v7 >= 3) {
    BOOL v15 = (v7 & (v7 - 1)) != 0;
  }
  unint64_t v16 = v15 | (2 * v7);
  unint64_t v17 = vcvtps_u32_f32(v13 / v14);
  if (v16 <= v17) {
    int8x8_t prime = (int8x8_t)v17;
  }
  else {
    int8x8_t prime = (int8x8_t)v16;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v7 = a1[1];
  }
  if (*(void *)&prime <= v7)
  {
    if (*(void *)&prime >= v7) {
      goto LABEL_60;
    }
    unint64_t v25 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
    if (v7 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
    {
      unint64_t v25 = std::__next_prime(v25);
    }
    else
    {
      uint64_t v27 = 1 << -(char)__clz(v25 - 1);
      if (v25 >= 2) {
        unint64_t v25 = v27;
      }
    }
    if (*(void *)&prime <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    if (*(void *)&prime >= v7)
    {
      unint64_t v7 = a1[1];
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      unsigned int v34 = (void *)*a1;
      *a1 = 0;
      if (v34) {
        operator delete(v34);
      }
      unint64_t v7 = 0;
      a1[1] = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unsigned int v19 = operator new(8 * *(void *)&prime);
  uint64_t v20 = (void *)*a1;
  *a1 = (uint64_t)v19;
  if (v20) {
    operator delete(v20);
  }
  uint64_t v21 = 0;
  a1[1] = (uint64_t)prime;
  do
    *(void *)(*a1 + 8 * v21++) = 0;
  while (*(void *)&prime != v21);
  uint64_t v22 = (void *)*v12;
  if (*v12)
  {
    unint64_t v23 = v22[1];
    uint8x8_t v24 = (uint8x8_t)vcnt_s8(prime);
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      if (v23 >= *(void *)&prime) {
        v23 %= *(void *)&prime;
      }
    }
    else
    {
      v23 &= *(void *)&prime - 1;
    }
    *(void *)(*a1 + 8 * v23) = v12;
    uint64_t v28 = (void *)*v22;
    if (*v22)
    {
      do
      {
        unint64_t v29 = v28[1];
        if (v24.u32[0] > 1uLL)
        {
          if (v29 >= *(void *)&prime) {
            v29 %= *(void *)&prime;
          }
        }
        else
        {
          v29 &= *(void *)&prime - 1;
        }
        if (v29 != v23)
        {
          if (!*(void *)(*a1 + 8 * v29))
          {
            *(void *)(*a1 + 8 * v29) = v22;
            goto LABEL_56;
          }
          *uint64_t v22 = *v28;
          *uint64_t v28 = **(void **)(*a1 + 8 * v29);
          **(void **)(*a1 + 8 * v29) = v28;
          uint64_t v28 = v22;
        }
        unint64_t v29 = v23;
LABEL_56:
        uint64_t v22 = v28;
        uint64_t v28 = (void *)*v28;
        unint64_t v23 = v29;
      }
      while (v28);
    }
  }
  unint64_t v7 = (unint64_t)prime;
LABEL_60:
  if ((v7 & (v7 - 1)) != 0)
  {
    if (v7 <= v5) {
      v5 %= v7;
    }
  }
  else
  {
    v5 &= v7 - 1;
  }
LABEL_64:
  uint64_t v30 = *a1;
  unint64_t v31 = *(void **)(*a1 + 8 * v5);
  if (v31)
  {
    *uint64_t i = *v31;
LABEL_72:
    *unint64_t v31 = i;
    goto LABEL_73;
  }
  *uint64_t i = *v12;
  *std::string v12 = i;
  *(void *)(v30 + 8 * v5) = v12;
  if (*i)
  {
    unint64_t v32 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v32 >= v7) {
        v32 %= v7;
      }
    }
    else
    {
      v32 &= v7 - 1;
    }
    unint64_t v31 = (void *)(*a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_1C8BDA948(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72) && *(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  JUMPOUT(0x1CB772580);
}

uint64_t *std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1 = *result;
  *__n128 result = 0;
  if (v1)
  {
    uint64_t v2 = *(void **)(v1 + 8);
    if (v2)
    {
      unint64_t v3 = *(void **)(v1 + 16);
      char v4 = *(void **)(v1 + 8);
      if (v3 != v2)
      {
        do
        {
          uint64_t v6 = *--v3;
          uint64_t v5 = v6;
          *unint64_t v3 = 0;
          if (v6) {
            MEMORY[0x1CB772580](v5, 0x1000C405AAC83ABLL);
          }
        }
        while (v3 != v2);
        char v4 = *(void **)(v1 + 8);
      }
      *(void *)(v1 + 16) = v2;
      operator delete(v4);
    }
    JUMPOUT(0x1CB772580);
  }
  return result;
}

void std::vector<std::reference_wrapper<siri::ontology::UsoGraphNode>>::__throw_out_of_range[abi:ne180100]()
{
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(char **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = *(char **)v2;
      uint64_t v6 = (void **)(v2 + 24);
      std::vector<std::unique_ptr<siri::ontology::UsoEntitySpan>>::__destroy_vector::operator()[abi:ne180100](&v6);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  char v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100](v2 + 3);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  char v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(char **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = *(char **)v2;
      uint64_t v6 = (void **)(v2 + 24);
      std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v6);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  char v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    char v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v7 = *--v4;
        uint64_t v6 = v7;
        *char v4 = 0;
        if (v7) {
          std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v6);
        }
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E65764F0, MEMORY[0x1E4FBA1D0]);
}

void sub_1C8BDACA4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  __n128 result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      unint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  uint8x8_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    float v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *uint8x8_t v8 = *v14;
          *float v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          float v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        uint8x8_t v8 = v14;
        float v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    unint64_t v3 = __p + 3;
    std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void siri::ontology::UsoGraphProtoReader::fromProtobuf(siri::ontology::UsoGraphProtoReader *this, const sirinluexternal::UsoGraph *a2)
{
}

void sub_1C8BDAFC0(_Unwind_Exception *a1)
{
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluexternal::SystemReportedSuccess::formatText(sirinluexternal::SystemReportedSuccess *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "task");
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "task_id");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::SystemReportedSuccess::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int8x8_t v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 8);
  if (v5)
  {
    return PB::Writer::writeSubmessage(a2, v5);
  }
  return this;
}

uint64_t sirinluexternal::SystemReportedSuccess::readFrom(sirinluexternal::SystemReportedSuccess *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::SystemReportedSuccess::~SystemReportedSuccess(sirinluexternal::SystemReportedSuccess *this)
{
  sirinluexternal::SystemReportedSuccess::~SystemReportedSuccess(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232E980;
  unint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

void *sirinluexternal::SystemReportedSuccess::SystemReportedSuccess(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232E980;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232E980;
  return this;
}

void *sirinluexternal::SystemReportedSuccess::SystemReportedSuccess(void *this, const sirinluexternal::SystemReportedSuccess *a2)
{
  *this = &unk_1F232E980;
  this[1] = 0;
  this[2] = 0;
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::SystemReportedSuccess::operator=(uint64_t a1, const sirinluexternal::SystemReportedSuccess *a2)
{
  if ((const sirinluexternal::SystemReportedSuccess *)a1 != a2)
  {
    sirinluexternal::SystemReportedSuccess::SystemReportedSuccess(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::SystemReportedSuccess::~SystemReportedSuccess((sirinluexternal::SystemReportedSuccess *)&v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::SystemReportedSuccess *a2, sirinluexternal::SystemReportedSuccess *a3)
{
  uint64_t v3 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  return this;
}

void *sirinluexternal::SystemReportedSuccess::SystemReportedSuccess(void *a1, uint64_t a2)
{
  a1[1] = 0;
  uint64_t v4 = a1 + 1;
  *a1 = &unk_1F232E980;
  a1[2] = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = a1[2];
  a1[2] = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v8 = *v4;
  *uint64_t v4 = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  return a1;
}

uint64_t sirinluexternal::SystemReportedSuccess::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::SystemReportedSuccess::SystemReportedSuccess(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::SystemReportedSuccess::~SystemReportedSuccess((sirinluexternal::SystemReportedSuccess *)&v5);
  }
  return a1;
}

uint64_t sirinluexternal::SystemReportedSuccess::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (v5 && sirinluexternal::UUID::operator==(v4, v5)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (v5) {
    return 0;
  }
LABEL_4:
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a2 + 8);
  uint64_t result = (v6 | v7) == 0;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unint64_t v10 = *(void **)(a1 + 8);
    return sirinluexternal::UsoGraph::operator==(v10, (void *)v7);
  }
  return result;
}

unint64_t sirinluexternal::SystemReportedSuccess::hash_value(sirinluexternal::SystemReportedSuccess *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (!v1)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v1 + 28) & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)(v1 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v1 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)(v1 + 8);
  if ((*(unsigned char *)(v1 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v3 = *(void *)(v1 + 16);
  if ((*(unsigned char *)(v1 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v4 = *(int *)(v1 + 24);
LABEL_10:
  uint64_t v5 = v3 ^ v2 ^ v4;
LABEL_11:
  unint64_t v6 = *((void *)this + 1);
  if (v6) {
    unint64_t v6 = sirinluexternal::UsoGraph::hash_value((sirinluexternal::UsoGraph *)v6);
  }
  return v6 ^ v5;
}

uint64_t sirinluexternal::SystemReportedSuccess::makeTaskId(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::SystemReportedSuccess::makeTask(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t SIRINLUINTERNALRewriteHypothesisReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 1u:
          std::string v18 = objc_alloc_init(SIRINLUEXTERNALUUID);
          objc_storeStrong((id *)(a1 + 16), v18);
          if PBReaderPlaceMark() && (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v20;

          continue;
        case 3u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v24 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v24 = 0;
          }
          *(void *)(a1 + 8) = v24;
          continue;
        case 4u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v28 = *v3;
        uint64_t v29 = *(void *)(a2 + v28);
        unint64_t v30 = v29 + 1;
        if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v28) = v30;
        v27 |= (unint64_t)(v31 & 0x7F) << v25;
        if ((v31 & 0x80) == 0) {
          goto LABEL_36;
        }
        v25 += 7;
        BOOL v15 = v26++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v27) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 24) = v27;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SIRINLUINTERNALSNLP_INTERMEDIATEITFMContextFeaturizerResponseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = objc_alloc_init(SIRINLUINTERNALSNLP_INTERMEDIATEContextFeaturizerResponse);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUINTERNALSNLP_INTERMEDIATEContextFeaturizerResponseReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
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
    char v17 = *(SIRINLUINTERNALSNLP_INTERMEDIATEContextFeaturizerResponse **)(a1 + 8);
    *(void *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sirinluexternal::UserParse::formatText(sirinluexternal::UserParse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 88)) {
    PB::TextFormatter::format(a2, "comparable_probability", *((double *)this + 1));
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "correction_outcome");
  }
  uint64_t v6 = *((void *)this + 3);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "id_a");
  }
  uint64_t v7 = *((void *)this + 4);
  if (v7) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "parser");
  }
  if (*((void *)this + 5)) {
    PB::TextFormatter::format();
  }
  if ((*((unsigned char *)this + 88) & 2) != 0) {
    PB::TextFormatter::format(a2, "probability", *((double *)this + 6));
  }
  uint64_t v8 = *((void *)this + 7);
  if (v8) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "repetition_result");
  }
  unsigned int v9 = (uint64_t *)*((void *)this + 8);
  unint64_t v10 = (uint64_t *)*((void *)this + 9);
  while (v9 != v10)
  {
    uint64_t v11 = *v9++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "user_dialog_acts");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::UserParse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 24);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base ***)(v3 + 64);
  uint64_t v6 = *(const PB::Base ***)(v3 + 72);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  if ((*(unsigned char *)(v3 + 88) & 2) != 0) {
    this = PB::Writer::write(a2, *(double *)(v3 + 48));
  }
  if (*(void *)(v3 + 40)) {
    this = PB::Writer::write();
  }
  uint64_t v8 = *(const PB::Base **)(v3 + 56);
  if (v8) {
    this = PB::Writer::writeSubmessage(a2, v8);
  }
  unsigned int v9 = *(const PB::Base **)(v3 + 32);
  if (v9) {
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  if (*(unsigned char *)(v3 + 88)) {
    this = PB::Writer::write(a2, *(double *)(v3 + 8));
  }
  unint64_t v10 = *(const PB::Base **)(v3 + 16);
  if (v10)
  {
    return PB::Writer::writeSubmessage(a2, v10);
  }
  return this;
}

uint64_t sirinluexternal::UserParse::readFrom(sirinluexternal::UserParse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        PB::PtrVector<sirinluexternal::UserDialogAct>::emplace_back<>();
      case 3u:
        *((unsigned char *)this + 88) |= 2u;
        unint64_t v20 = *((void *)a2 + 1);
        if (v20 > 0xFFFFFFFFFFFFFFF7 || v20 + 8 > *((void *)a2 + 2)) {
          goto LABEL_34;
        }
        *((void *)this + 6) = *(void *)(*(void *)a2 + v20);
        goto LABEL_36;
      case 4u:
        operator new();
      case 5u:
        operator new();
      case 6u:
        operator new();
      case 7u:
        *((unsigned char *)this + 88) |= 1u;
        unint64_t v21 = *((void *)a2 + 1);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 1) = *(void *)(*(void *)a2 + v21);
LABEL_36:
          *((void *)a2 + 1) += 8;
        }
        else
        {
LABEL_34:
          *((unsigned char *)a2 + 24) = 1;
        }
        break;
      case 8u:
        operator new();
      default:
        goto LABEL_19;
    }
LABEL_37:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_37;
  }
  return result;
}

void sirinluexternal::UserParse::~UserParse(sirinluexternal::UserParse *this)
{
  sirinluexternal::UserParse::~UserParse(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  uint64_t vars8;

  *(void *)this = &unk_1F232E9D0;
  uint64_t v7 = (void **)((char *)this + 64);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v7);
  unint64_t v2 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  }
  int v4 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  PB::Base::~Base(this);
}

double sirinluexternal::UserParse::UserParse(sirinluexternal::UserParse *this)
{
  *(void *)this = &unk_1F232E9D0;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232E9D0;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 0;
  return result;
}

uint64_t sirinluexternal::UserParse::UserParse(uint64_t this, const sirinluexternal::UserParse *a2)
{
  *(void *)this = &unk_1F232E9D0;
  *(_OWORD *)(this + 16) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_OWORD *)(this + 32) = 0u;
  *(_OWORD *)(this + 72) = 0u;
  *(_DWORD *)(this + 88) = 0;
  if (*((void *)a2 + 3)) {
    operator new();
  }
  if (*((void *)a2 + 8) != *((void *)a2 + 9)) {
    PB::PtrVector<sirinluexternal::UserDialogAct>::emplace_back<sirinluexternal::UserDialogAct const&>();
  }
  if ((*((unsigned char *)a2 + 88) & 2) != 0)
  {
    uint64_t v2 = *((void *)a2 + 6);
    *(unsigned char *)(this + 88) |= 2u;
    *(void *)(this + 48) = v2;
  }
  if (*((void *)a2 + 5)) {
    operator new();
  }
  if (*((void *)a2 + 7)) {
    operator new();
  }
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 88))
  {
    uint64_t v3 = *((void *)a2 + 1);
    *(unsigned char *)(this + 88) |= 1u;
    *(void *)(this + 8) = v3;
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserParse::operator=(uint64_t a1, const sirinluexternal::UserParse *a2)
{
  if ((const sirinluexternal::UserParse *)a1 != a2)
  {
    sirinluexternal::UserParse::UserParse((uint64_t)&v12, a2);
    long long v3 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v18;
    long long v18 = v3;
    uint64_t v4 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = v16;
    uint64_t v16 = v4;
    long long v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v17;
    long long v17 = v5;
    uint64_t v6 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v13;
    uint64_t v13 = v6;
    long long v7 = v15;
    long long v9 = *(_OWORD *)(a1 + 16);
    long long v8 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a1 + 16) = v14;
    *(_OWORD *)(a1 + 32) = v7;
    int v10 = *(_DWORD *)(a1 + 88);
    *(_DWORD *)(a1 + 88) = v19;
    int v19 = v10;
    long long v14 = v9;
    long long v15 = v8;
    sirinluexternal::UserParse::~UserParse((sirinluexternal::UserParse *)&v12);
  }
  return a1;
}

double sirinluexternal::swap(sirinluexternal *this, sirinluexternal::UserParse *a2, sirinluexternal::UserParse *a3)
{
  int v3 = *((_DWORD *)this + 22);
  *((_DWORD *)this + 22) = *((_DWORD *)a2 + 22);
  *((_DWORD *)a2 + 22) = v3;
  uint64_t v4 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v4;
  uint64_t v5 = *((void *)this + 8);
  *((void *)this + 8) = *((void *)a2 + 8);
  *((void *)a2 + 8) = v5;
  uint64_t v6 = *((void *)this + 9);
  *((void *)this + 9) = *((void *)a2 + 9);
  *((void *)a2 + 9) = v6;
  uint64_t v7 = *((void *)this + 10);
  *((void *)this + 10) = *((void *)a2 + 10);
  *((void *)a2 + 10) = v7;
  uint64_t v8 = *((void *)this + 6);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v8;
  uint64_t v9 = *((void *)this + 5);
  *((void *)this + 5) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v9;
  uint64_t v10 = *((void *)this + 7);
  *((void *)this + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v10;
  uint64_t v11 = *((void *)this + 4);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v11;
  double result = *((double *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((double *)a2 + 1) = result;
  uint64_t v13 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v13;
  return result;
}

uint64_t sirinluexternal::UserParse::UserParse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 56) = 0u;
  uint64_t v4 = (uint64_t *)(a1 + 56);
  *(void *)a1 = &unk_1F232E9D0;
  uint64_t v5 = (void **)(a1 + 64);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a2 + 88) = 0;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v5);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  if (v9) {
    std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v11 = *v4;
  *uint64_t v4 = v10;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  uint64_t v12 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v12;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v15 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  return a1;
}

uint64_t sirinluexternal::UserParse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::UserParse::UserParse((uint64_t)&v12, a2);
    long long v3 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v18;
    long long v18 = v3;
    uint64_t v4 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = v16;
    uint64_t v16 = v4;
    long long v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v17;
    long long v17 = v5;
    uint64_t v6 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v13;
    uint64_t v13 = v6;
    long long v7 = v15;
    long long v9 = *(_OWORD *)(a1 + 16);
    long long v8 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a1 + 16) = v14;
    *(_OWORD *)(a1 + 32) = v7;
    int v10 = *(_DWORD *)(a1 + 88);
    *(_DWORD *)(a1 + 88) = v19;
    int v19 = v10;
    long long v14 = v9;
    long long v15 = v8;
    sirinluexternal::UserParse::~UserParse((sirinluexternal::UserParse *)&v12);
  }
  return a1;
}

BOOL sirinluexternal::UserParse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  BOOL result = PB::PtrVector<sirinluexternal::UserDialogAct>::operator==((uint64_t *)(a1 + 64), *(void ***)(a2 + 64), *(void *)(a2 + 72));
  if (!result) {
    return result;
  }
  char v7 = *(unsigned char *)(a1 + 88);
  char v8 = *(unsigned char *)(a2 + 88);
  if ((v7 & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 88) & 2) == 0 || *(double *)(a1 + 48) != *(double *)(a2 + 48)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 88) & 2) != 0)
  {
    return 0;
  }
  long long v9 = *(unsigned __int8 **)(a1 + 40);
  int v10 = *(unsigned __int8 ***)(a2 + 40);
  if (v9)
  {
    if (!v10) {
      return 0;
    }
    uint64_t v11 = v9[23];
    if ((v11 & 0x80u) == 0) {
      uint64_t v12 = (unsigned __int8 *)v9[23];
    }
    else {
      uint64_t v12 = (unsigned __int8 *)*((void *)v9 + 1);
    }
    uint64_t v13 = (unsigned __int8 *)*((unsigned __int8 *)v10 + 23);
    int v14 = (char)v13;
    if ((char)v13 < 0) {
      uint64_t v13 = v10[1];
    }
    if (v12 != v13) {
      return 0;
    }
    if (v14 >= 0) {
      long long v15 = *(unsigned __int8 **)(a2 + 40);
    }
    else {
      long long v15 = *v10;
    }
    if ((v11 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v9, v15, *((void *)v9 + 1))) {
        return 0;
      }
    }
    else if (v9[23])
    {
      uint64_t v16 = v11 - 1;
      do
      {
        int v18 = *v9++;
        int v17 = v18;
        int v20 = *v15++;
        int v19 = v20;
        BOOL v22 = v16-- != 0;
      }
      while (v17 == v19 && v22);
      if (v17 != v19) {
        return 0;
      }
    }
  }
  else if (v10)
  {
    return 0;
  }
  uint64_t v23 = *(void *)(a1 + 56);
  uint64_t v24 = *(void *)(a2 + 56);
  if (v23)
  {
    if (!v24 || !sirinluexternal::RepetitionResult::operator==(v23, v24)) {
      return 0;
    }
  }
  else if (v24)
  {
    return 0;
  }
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v26 = *(void *)(a2 + 32);
  if (v25)
  {
    if (!v26 || !sirinluexternal::Parser::operator==(v25, v26)) {
      return 0;
    }
  }
  else if (v26)
  {
    return 0;
  }
  if ((v7 & 1) == 0)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_53;
    }
    return 0;
  }
  if ((v8 & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8)) {
    return 0;
  }
LABEL_53:
  uint64_t v27 = *(void *)(a1 + 16);
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL result = (v27 | v28) == 0;
  if (v27 && v28)
  {
    if (*(unsigned char *)(v27 + 12))
    {
      if ((*(unsigned char *)(v28 + 12) & 1) != 0 && *(_DWORD *)(v27 + 8) == *(_DWORD *)(v28 + 8)) {
        return 1;
      }
    }
    else if ((*(unsigned char *)(v28 + 12) & 1) == 0)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sirinluexternal::UserParse::hash_value(sirinluexternal::UserParse *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 28) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(void *)(v2 + 16);
  if ((*(unsigned char *)(v2 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(int *)(v2 + 24);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  char v7 = (sirinluexternal::UserDialogAct **)*((void *)this + 8);
  char v8 = (sirinluexternal::UserDialogAct **)*((void *)this + 9);
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    do
    {
      int v10 = *v7++;
      v9 ^= sirinluexternal::UserDialogAct::hash_value(v10);
    }
    while (v7 != v8);
  }
  char v11 = *((unsigned char *)this + 88);
  if ((v11 & 2) != 0)
  {
    if (*((double *)this + 6) == 0.0) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = *((void *)this + 6);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  unint64_t v13 = *((void *)this + 5);
  if (v13) {
    unint64_t v13 = std::__string_hash<char>::operator()[abi:ne180100](v13);
  }
  uint64_t v14 = *((void *)this + 7);
  if (v14)
  {
    if (*(unsigned char *)(v14 + 16))
    {
      uint64_t v15 = *(unsigned int *)(v14 + 8);
      if ((*(unsigned char *)(v14 + 16) & 2) != 0) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v15 = 0;
      if ((*(unsigned char *)(v14 + 16) & 2) != 0)
      {
LABEL_26:
        uint64_t v16 = *(int *)(v14 + 12);
LABEL_29:
        uint64_t v14 = v16 ^ v15;
        goto LABEL_30;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_29;
  }
LABEL_30:
  uint64_t v17 = *((void *)this + 4);
  if (!v17) {
    goto LABEL_37;
  }
  if (*(unsigned char *)(v17 + 16))
  {
    uint64_t v18 = *(int *)(v17 + 8);
    if ((*(unsigned char *)(v17 + 16) & 2) != 0) {
      goto LABEL_33;
    }
LABEL_35:
    uint64_t v19 = 0;
    goto LABEL_36;
  }
  uint64_t v18 = 0;
  if ((*(unsigned char *)(v17 + 16) & 2) == 0) {
    goto LABEL_35;
  }
LABEL_33:
  uint64_t v19 = *(int *)(v17 + 12);
LABEL_36:
  uint64_t v17 = v19 ^ v18;
LABEL_37:
  if (v11)
  {
    double v20 = *((double *)this + 1);
    if (v20 == 0.0) {
      double v20 = 0.0;
    }
  }
  else
  {
    double v20 = 0.0;
  }
  uint64_t v21 = *((void *)this + 2);
  if (v21)
  {
    if (*(unsigned char *)(v21 + 12)) {
      uint64_t v21 = *(int *)(v21 + 8);
    }
    else {
      uint64_t v21 = 0;
    }
  }
  return v9 ^ v6 ^ v12 ^ v13 ^ v14 ^ v17 ^ *(void *)&v20 ^ v21;
}

uint64_t sirinluexternal::UserParse::makeIdA(uint64_t this)
{
  if (!*(void *)(this + 24)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserParse::makeRepetitionResult(uint64_t this)
{
  if (!*(void *)(this + 56)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserParse::makeParser(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserParse::makeCorrectionOutcome(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternal::RewriteUtterance::formatText(sirinluinternal::RewriteUtterance *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "asr_id");
  }
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  char v7 = (uint64_t *)*((void *)this + 3);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "asr_utterance_tokens");
  }
  if (*((unsigned char *)this + 80)) {
    PB::TextFormatter::format(a2, "confidence", *((double *)this + 5));
  }
  uint64_t v9 = (uint64_t *)*((void *)this + 6);
  int v10 = (uint64_t *)*((void *)this + 7);
  while (v9 != v10)
  {
    uint64_t v11 = *v9++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "nlu_internal_tokens");
  }
  if (*((void *)this + 9)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::RewriteUtterance::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(void *)(v3 + 72)) {
    this = PB::Writer::write();
  }
  uint64_t v5 = *(const PB::Base ***)(v3 + 16);
  uint64_t v6 = *(const PB::Base ***)(v3 + 24);
  while (v5 != v6)
  {
    char v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  if (*(unsigned char *)(v3 + 80)) {
    this = PB::Writer::write(a2, *(double *)(v3 + 40));
  }
  uint64_t v9 = *(const PB::Base ***)(v3 + 48);
  uint64_t v8 = *(const PB::Base ***)(v3 + 56);
  while (v9 != v8)
  {
    int v10 = *v9++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  return this;
}

uint64_t sirinluinternal::RewriteUtterance::readFrom(sirinluinternal::RewriteUtterance *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_21;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
LABEL_31:
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) != 4)
    {
      switch((v11 >> 3))
      {
        case 1u:
          operator new();
        case 2u:
          operator new();
        case 4u:
          operator new();
        case 5u:
          *((unsigned char *)this + 80) |= 1u;
          unint64_t v20 = *((void *)a2 + 1);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *((void *)a2 + 2))
          {
            *((void *)this + 5) = *(void *)(*(void *)a2 + v20);
            *((void *)a2 + 1) += 8;
          }
          else
          {
            *((unsigned char *)a2 + 24) = 1;
          }
          goto LABEL_31;
        case 6u:
          PB::PtrVector<sirinluinternal::Token>::emplace_back<>();
        default:
          goto LABEL_19;
      }
    }
    int v4 = 0;
  }
  return v4 == 0;
}

void sub_1C8BDEA1C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluinternal::RewriteUtterance::~RewriteUtterance(sirinluinternal::RewriteUtterance *this)
{
  sirinluinternal::RewriteUtterance::~RewriteUtterance(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  void **v4;
  uint64_t vars8;

  *(void *)this = &unk_1F232EA20;
  unint64_t v2 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  int v4 = (void **)((char *)this + 48);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v4);
  if (*((void *)this + 2))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 2);
    operator delete(*((void **)this + 2));
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

double sirinluinternal::RewriteUtterance::RewriteUtterance(sirinluinternal::RewriteUtterance *this)
{
  *(void *)this = &unk_1F232EA20;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EA20;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

uint64_t sirinluinternal::RewriteUtterance::RewriteUtterance(uint64_t this, const sirinluinternal::RewriteUtterance *a2)
{
  *(void *)this = &unk_1F232EA20;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 48) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 64) = 0u;
  *(_DWORD *)(this + 80) = 0;
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 9)) {
    operator new();
  }
  if (*((void *)a2 + 2) != *((void *)a2 + 3)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 80))
  {
    uint64_t v2 = *((void *)a2 + 5);
    *(unsigned char *)(this + 80) |= 1u;
    *(void *)(this + 40) = v2;
  }
  if (*((void *)a2 + 6) != *((void *)a2 + 7)) {
    PB::PtrVector<sirinluinternal::Token>::emplace_back<sirinluinternal::Token const&>();
  }
  return this;
}

void sub_1C8BDEE44(void *a1)
{
}

uint64_t sirinluinternal::RewriteUtterance::operator=(uint64_t a1, const sirinluinternal::RewriteUtterance *a2)
{
  if ((const sirinluinternal::RewriteUtterance *)a1 != a2)
  {
    sirinluinternal::RewriteUtterance::RewriteUtterance((uint64_t)v11, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    long long v12 = v3;
    long long v13 = v4;
    uint64_t v5 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v14;
    uint64_t v14 = v5;
    long long v6 = v16;
    long long v7 = *(_OWORD *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v6;
    int v9 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    int v17 = v9;
    long long v15 = v7;
    long long v16 = v8;
    sirinluinternal::RewriteUtterance::~RewriteUtterance((sirinluinternal::RewriteUtterance *)v11);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::RewriteUtterance *a2, sirinluinternal::RewriteUtterance *a3)
{
  int v3 = *((_DWORD *)this + 20);
  *((_DWORD *)this + 20) = *((_DWORD *)a2 + 20);
  *((_DWORD *)a2 + 20) = v3;
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *((void *)this + 9);
  *((void *)this + 9) = *((void *)a2 + 9);
  *((void *)a2 + 9) = v5;
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v6;
  uint64_t v7 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v7;
  uint64_t v8 = *((void *)this + 4);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v8;
  double result = *((double *)this + 5);
  *((void *)this + 5) = *((void *)a2 + 5);
  *((double *)a2 + 5) = result;
  uint64_t v10 = *((void *)this + 6);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v10;
  uint64_t v11 = *((void *)this + 7);
  *((void *)this + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v11;
  uint64_t v12 = *((void *)this + 8);
  *((void *)this + 8) = *((void *)a2 + 8);
  *((void *)a2 + 8) = v12;
  return result;
}

uint64_t sirinluinternal::RewriteUtterance::RewriteUtterance(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EA20;
  *(_OWORD *)(a1 + 48) = 0u;
  uint64_t v4 = (void **)(a1 + 48);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_DWORD *)(a2 + 80) = 0;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v6 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  uint64_t v8 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v7;
  if (v8) {
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  }
  int v9 = (void **)(a1 + 16);
  if (*(void *)(a1 + 16))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 16));
    operator delete(*v9);
    *int v9 = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  return a1;
}

uint64_t sirinluinternal::RewriteUtterance::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::RewriteUtterance::RewriteUtterance((uint64_t)v11, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    long long v12 = v3;
    long long v13 = v4;
    uint64_t v5 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v14;
    uint64_t v14 = v5;
    long long v6 = v16;
    long long v7 = *(_OWORD *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v6;
    int v9 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    int v17 = v9;
    long long v15 = v7;
    long long v16 = v8;
    sirinluinternal::RewriteUtterance::~RewriteUtterance((sirinluinternal::RewriteUtterance *)v11);
  }
  return a1;
}

BOOL sirinluinternal::RewriteUtterance::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  long long v6 = *(unsigned __int8 **)(a1 + 72);
  long long v7 = *(unsigned __int8 ***)(a2 + 72);
  if (!v6)
  {
    if (!v7) {
      goto LABEL_23;
    }
    return 0;
  }
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v6[23];
  if ((v8 & 0x80u) == 0) {
    int v9 = (unsigned __int8 *)v6[23];
  }
  else {
    int v9 = (unsigned __int8 *)*((void *)v6 + 1);
  }
  uint64_t v10 = (unsigned __int8 *)*((unsigned __int8 *)v7 + 23);
  int v11 = (char)v10;
  if ((char)v10 < 0) {
    uint64_t v10 = v7[1];
  }
  if (v9 != v10) {
    return 0;
  }
  if (v11 >= 0) {
    long long v12 = *(unsigned __int8 **)(a2 + 72);
  }
  else {
    long long v12 = *v7;
  }
  if ((v8 & 0x80) != 0)
  {
    if (memcmp(*(const void **)v6, v12, *((void *)v6 + 1))) {
      return 0;
    }
  }
  else if (v6[23])
  {
    while (*v6 == *v12)
    {
      ++v6;
      ++v12;
      if (!--v8) {
        goto LABEL_23;
      }
    }
    return 0;
  }
LABEL_23:
  uint64_t v14 = *(uint64_t **)(a1 + 16);
  long long v13 = *(uint64_t **)(a1 + 24);
  long long v15 = *(uint64_t **)(a2 + 16);
  if ((char *)v13 - (char *)v14 != *(void *)(a2 + 24) - (void)v15) {
    return 0;
  }
  while (v14 != v13)
  {
    if (!sirinluinternal::RewriteToken::operator==(*v14, *v15)) {
      return 0;
    }
    ++v14;
    ++v15;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    if ((*(unsigned char *)(a2 + 80) & 1) == 0 || *(double *)(a1 + 40) != *(double *)(a2 + 40)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 80))
  {
    return 0;
  }
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  char v18 = *(uint64_t **)(a2 + 48);
  uint64_t v19 = *(void *)(a2 + 56);
  return PB::PtrVector<sirinluinternal::Token>::operator==(v16, v17, v18, v19);
}

unint64_t sirinluinternal::RewriteUtterance::hash_value(sirinluinternal::RewriteUtterance *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 28) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(void *)(v2 + 16);
  if ((*(unsigned char *)(v2 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(int *)(v2 + 24);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  uint64_t v7 = *((void *)this + 9);
  if (v7) {
    unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](v7);
  }
  else {
    unint64_t v8 = 0;
  }
  int v9 = (sirinluinternal::RewriteToken **)*((void *)this + 2);
  uint64_t v10 = (sirinluinternal::RewriteToken **)*((void *)this + 3);
  if (v9 == v10)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    do
    {
      long long v12 = *v9++;
      v11 ^= sirinluinternal::RewriteToken::hash_value(v12);
    }
    while (v9 != v10);
  }
  if (*((unsigned char *)this + 80))
  {
    if (*((double *)this + 5) == 0.0) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = *((void *)this + 5);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  long long v15 = (sirinluinternal::Token **)*((void *)this + 6);
  uint64_t v14 = (sirinluinternal::Token **)*((void *)this + 7);
  if (v15 == v14)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = *v15++;
      v16 ^= sirinluinternal::Token::hash_value(v17);
    }
    while (v15 != v14);
  }
  return v8 ^ v6 ^ v11 ^ v13 ^ v16;
}

uint64_t sirinluinternal::RewriteUtterance::makeAsrId(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternal::PLUMSpanData::formatText(sirinluinternal::PLUMSpanData *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 16)) {
    PB::TextFormatter::format(a2, "score", *((double *)this + 1));
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::PLUMSpanData::writeTo(uint64_t this, PB::Writer *a2)
{
  if (*(unsigned char *)(this + 16)) {
    return PB::Writer::write(a2, *(double *)(this + 8));
  }
  return this;
}

uint64_t sirinluinternal::PLUMSpanData::readFrom(sirinluinternal::PLUMSpanData *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_25;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        *((unsigned char *)this + 16) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 1) = *(void *)(*(void *)a2 + v2);
          unint64_t v2 = *((void *)a2 + 1) + 8;
          *((void *)a2 + 1) = v2;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
      }
      else
      {
LABEL_25:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v2 = *((void *)a2 + 1);
      }
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_25;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluinternal::PLUMSpanData::~PLUMSpanData(sirinluinternal::PLUMSpanData *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1CB772580);
}

uint64_t sirinluinternal::PLUMSpanData::PLUMSpanData(uint64_t this)
{
  *(void *)this = &unk_1F232EA70;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = &unk_1F232EA70;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

double sirinluinternal::PLUMSpanData::PLUMSpanData(sirinluinternal::PLUMSpanData *this, const sirinluinternal::PLUMSpanData *a2)
{
  *(void *)this = &unk_1F232EA70;
  *((_DWORD *)this + 4) = 0;
  if (*((unsigned char *)a2 + 16))
  {
    double result = *((double *)a2 + 1);
    *((unsigned char *)this + 16) = 1;
    *((double *)this + 1) = result;
  }
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EA70;
  *((_DWORD *)this + 4) = 0;
  if (*((unsigned char *)a2 + 16))
  {
    double result = *((double *)a2 + 1);
    *((unsigned char *)this + 16) = 1;
    *((double *)this + 1) = result;
  }
  return result;
}

uint64_t sirinluinternal::PLUMSpanData::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    v7[0] = &unk_1F232EA70;
    uint64_t v3 = *(void *)(a2 + 8);
    int v4 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 1;
    int v8 = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v3;
    v7[1] = v5;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void v8[2];
  int v9;

  if (a1 != a2)
  {
    v8[0] = &unk_1F232EA70;
    uint64_t v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    int v4 = *(void *)(a2 + 8);
    uint64_t v5 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v3;
    char v9 = v5;
    uint64_t v6 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v4;
    v8[1] = v6;
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::PLUMSpanData *a2, sirinluinternal::PLUMSpanData *a3)
{
  int v3 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  double result = *((double *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((double *)a2 + 1) = result;
  return result;
}

double sirinluinternal::PLUMSpanData::PLUMSpanData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EA70;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  double result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

{
  double result;

  *(void *)a1 = &unk_1F232EA70;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  double result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

BOOL sirinluinternal::PLUMSpanData::operator==(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 16);
  BOOL result = (*(unsigned char *)(a2 + 16) & 1) == 0;
  if (v3) {
    return (*(unsigned char *)(a2 + 16) & 1) != 0 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
  }
  return result;
}

uint64_t sirinluinternal::PLUMSpanData::hash_value(sirinluinternal::PLUMSpanData *this)
{
  if ((*((unsigned char *)this + 16) & 1) == 0) {
    return 0;
  }
  if (*((double *)this + 1) == 0.0) {
    return 0;
  }
  return *((void *)this + 1);
}

uint64_t sirinluexternal::RewriteMessage::formatText(sirinluexternal::RewriteMessage *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 20)) {
    PB::TextFormatter::format(a2, "rewrite_type");
  }
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::RewriteMessage::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v2 = this;
  if (*(unsigned char *)(this + 20)) {
    this = PB::Writer::writeVarInt(a2);
  }
  if (*(void *)(v2 + 8))
  {
    return PB::Writer::write();
  }
  return this;
}

uint64_t sirinluexternal::RewriteMessage::readFrom(sirinluexternal::RewriteMessage *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_30;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2) {
        operator new();
      }
      if ((v11 >> 3) == 1)
      {
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v19 = *((void *)a2 + 1);
        unint64_t v20 = *((void *)a2 + 2);
        uint64_t v21 = *(void *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v20)
        {
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v24 = 0;
          if (v20 <= v19) {
            unint64_t v20 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v20 == v19)
            {
              LODWORD(v24) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_43;
            }
            unint64_t v30 = v19 + 1;
            char v31 = *(unsigned char *)(v21 + v19);
            *((void *)a2 + 1) = v30;
            v24 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0) {
              break;
            }
            v28 += 7;
            unint64_t v19 = v30;
            BOOL v14 = v29++ > 8;
            if (v14)
            {
LABEL_39:
              LODWORD(v24) = 0;
              goto LABEL_43;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v24) = 0;
          }
        }
        else
        {
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            unint64_t v25 = v19 + 1;
            *((void *)a2 + 1) = v19 + 1;
            char v26 = *(unsigned char *)(v21 + v19);
            v24 |= (unint64_t)(v26 & 0x7F) << v22;
            if ((v26 & 0x80) == 0) {
              break;
            }
            v22 += 7;
            unint64_t v19 = v25;
            BOOL v14 = v23++ > 8;
            if (v14) {
              goto LABEL_39;
            }
          }
        }
LABEL_43:
        *((_DWORD *)this + 4) = v24;
      }
      else
      {
LABEL_30:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_30;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::RewriteMessage::~RewriteMessage(sirinluexternal::RewriteMessage *this)
{
  sirinluexternal::RewriteMessage::~RewriteMessage(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t vars8;

  unint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F232EAC0;
  *((void *)this + 1) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  PB::Base::~Base(this);
}

void *sirinluexternal::RewriteMessage::RewriteMessage(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232EAC0;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232EAC0;
  return this;
}

uint64_t sirinluexternal::RewriteMessage::RewriteMessage(uint64_t this, const sirinluexternal::RewriteMessage *a2)
{
  *(void *)this = &unk_1F232EAC0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  if (*((unsigned char *)a2 + 20))
  {
    int v2 = *((_DWORD *)a2 + 4);
    *(unsigned char *)(this + 20) = 1;
    *(_DWORD *)(this + 16) = v2;
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

const sirinluexternal::RewriteMessage *sirinluexternal::RewriteMessage::operator=(const sirinluexternal::RewriteMessage *a1, const sirinluexternal::RewriteMessage *a2)
{
  if (a1 != a2)
  {
    sirinluexternal::RewriteMessage::RewriteMessage((uint64_t)v6, a2);
    uint64_t v3 = *((void *)a1 + 2);
    *((void *)a1 + 2) = v8;
    uint64_t v8 = v3;
    uint64_t v4 = *((void *)a1 + 1);
    *((void *)a1 + 1) = v7;
    uint64_t v7 = v4;
    sirinluexternal::RewriteMessage::~RewriteMessage((sirinluexternal::RewriteMessage *)v6);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::RewriteMessage *a2, sirinluexternal::RewriteMessage *a3)
{
  int v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  int v4 = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  return this;
}

uint64_t sirinluexternal::RewriteMessage::RewriteMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EAC0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  if (v4) {
    std::default_delete<std::string>::operator()[abi:ne180100](v4);
  }
  return a1;
}

uint64_t sirinluexternal::RewriteMessage::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::RewriteMessage::RewriteMessage((uint64_t)v6, a2);
    uint64_t v3 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v8;
    uint64_t v8 = v3;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v7;
    uint64_t v7 = v4;
    sirinluexternal::RewriteMessage::~RewriteMessage((sirinluexternal::RewriteMessage *)v6);
  }
  return a1;
}

uint64_t sirinluexternal::RewriteMessage::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 20))
  {
    if ((*(unsigned char *)(a2 + 20) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 20))
  {
    return 0;
  }
  int v2 = *(unsigned __int8 **)(a1 + 8);
  uint64_t v3 = *(unsigned __int8 ***)(a2 + 8);
  uint64_t result = v3 == 0;
  if (!v2) {
    return result;
  }
  if (!v3) {
    return 0;
  }
  uint64_t v5 = v2[23];
  if ((v5 & 0x80u) == 0) {
    uint64_t v6 = (unsigned __int8 *)v2[23];
  }
  else {
    uint64_t v6 = (unsigned __int8 *)*((void *)v2 + 1);
  }
  uint64_t v7 = (unsigned __int8 *)*((unsigned __int8 *)v3 + 23);
  int v8 = (char)v7;
  if ((char)v7 < 0) {
    uint64_t v7 = v3[1];
  }
  if (v6 != v7) {
    return 0;
  }
  if (v8 >= 0) {
    char v9 = *(unsigned __int8 **)(a2 + 8);
  }
  else {
    char v9 = *v3;
  }
  if ((v5 & 0x80) != 0) {
    return !memcmp(*(const void **)v2, v9, *((void *)v2 + 1));
  }
  if (!v2[23]) {
    return 1;
  }
  uint64_t v10 = v5 - 1;
  do
  {
    int v12 = *v2++;
    int v11 = v12;
    int v14 = *v9++;
    int v13 = v14;
    BOOL v16 = v10-- != 0;
    uint64_t result = v11 == v13;
  }
  while (v11 == v13 && v16);
  return result;
}

unint64_t sirinluexternal::RewriteMessage::hash_value(sirinluexternal::RewriteMessage *this)
{
  if (*((unsigned char *)this + 20)) {
    uint64_t v1 = *((int *)this + 4);
  }
  else {
    uint64_t v1 = 0;
  }
  unint64_t v2 = *((void *)this + 1);
  if (v2) {
    unint64_t v2 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  return v2 ^ v1;
}

uint64_t sirinluexternal::RRMetadata::formatText(sirinluexternal::RRMetadata *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "bounding_box");
  }
  if (*((unsigned char *)this + 44)) {
    PB::TextFormatter::format(a2, "data_source");
  }
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  uint64_t v7 = (uint64_t *)*((void *)this + 3);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "surrounding_texts");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::RRMetadata::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base ***)(v3 + 16);
  uint64_t v6 = *(const PB::Base ***)(v3 + 24);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  if (*(unsigned char *)(v3 + 44))
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t sirinluexternal::RRMetadata::readFrom(sirinluexternal::RRMetadata *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_19;
        }
      }
LABEL_21:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v20 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 44) |= 1u;
        unint64_t v21 = *((void *)a2 + 1);
        unint64_t v22 = *((void *)a2 + 2);
        uint64_t v23 = *(void *)a2;
        if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v22)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v26 = 0;
          if (v22 <= v21) {
            unint64_t v22 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v22 == v21)
            {
              LODWORD(v26) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_44;
            }
            unint64_t v31 = v21 + 1;
            char v32 = *(unsigned char *)(v23 + v21);
            *((void *)a2 + 1) = v31;
            v26 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v21 = v31;
            BOOL v14 = v30++ > 8;
            if (v14)
            {
LABEL_40:
              LODWORD(v26) = 0;
              goto LABEL_44;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v26) = 0;
          }
        }
        else
        {
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          while (1)
          {
            unint64_t v27 = v21 + 1;
            *((void *)a2 + 1) = v21 + 1;
            char v28 = *(unsigned char *)(v23 + v21);
            v26 |= (unint64_t)(v28 & 0x7F) << v24;
            if ((v28 & 0x80) == 0) {
              break;
            }
            v24 += 7;
            unint64_t v21 = v27;
            BOOL v14 = v25++ > 8;
            if (v14) {
              goto LABEL_40;
            }
          }
        }
LABEL_44:
        *((_DWORD *)this + 10) = v26;
      }
      else
      {
        if (v20 == 2) {
          operator new();
        }
        if (v20 == 1) {
          operator new();
        }
LABEL_19:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_21;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_1C8BE17B0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluexternal::RRMetadata::~RRMetadata(sirinluexternal::RRMetadata *this)
{
  sirinluexternal::RRMetadata::~RRMetadata(this);
  JUMPOUT(0x1CB772580);
}

{
  void **v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232EB10;
  unint64_t v2 = (void **)((char *)this + 16);
  if (*((void *)this + 2))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 2);
    operator delete(*v2);
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

double sirinluexternal::RRMetadata::RRMetadata(sirinluexternal::RRMetadata *this)
{
  *(void *)this = &unk_1F232EB10;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EB10;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  return result;
}

uint64_t sirinluexternal::RRMetadata::RRMetadata(uint64_t this, const sirinluexternal::RRMetadata *a2)
{
  *(void *)this = &unk_1F232EB10;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(void *)(this + 40) = 0;
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 2) != *((void *)a2 + 3)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 44))
  {
    int v2 = *((_DWORD *)a2 + 10);
    *(unsigned char *)(this + 44) |= 1u;
    *(_DWORD *)(this + 40) = v2;
  }
  return this;
}

void sub_1C8BE1AFC(void *a1)
{
}

uint64_t sirinluexternal::RRMetadata::operator=(uint64_t a1, const sirinluexternal::RRMetadata *a2)
{
  if ((const sirinluexternal::RRMetadata *)a1 != a2)
  {
    sirinluexternal::RRMetadata::RRMetadata((uint64_t)&v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v3;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v8 = v4;
    *(void *)&long long v4 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v9;
    uint64_t v9 = v4;
    sirinluexternal::RRMetadata::~RRMetadata((sirinluexternal::RRMetadata *)&v6);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::RRMetadata *a2, sirinluexternal::RRMetadata *a3)
{
  int v3 = *(_DWORD *)(this + 44);
  *(_DWORD *)(this + 44) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v5;
  uint64_t v6 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  uint64_t v7 = *(void *)(this + 32);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v7;
  LODWORD(v7) = *(_DWORD *)(this + 40);
  *(_DWORD *)(this + 40) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v7;
  return this;
}

uint64_t sirinluexternal::RRMetadata::RRMetadata(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EB10;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = (void **)(a1 + 16);
  if (*(void *)(a1 + 16))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 16));
    operator delete(*v6);
    *uint64_t v6 = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t sirinluexternal::RRMetadata::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::RRMetadata::RRMetadata((uint64_t)&v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v3;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v8 = v4;
    *(void *)&long long v4 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v9;
    uint64_t v9 = v4;
    sirinluexternal::RRMetadata::~RRMetadata((sirinluexternal::RRMetadata *)&v6);
  }
  return a1;
}

BOOL sirinluexternal::RRMetadata::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !sirinluexternal::RRBoundingBox::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  long long v7 = *(uint64_t **)(a1 + 16);
  uint64_t v6 = *(uint64_t **)(a1 + 24);
  long long v8 = *(uint64_t **)(a2 + 16);
  if ((char *)v6 - (char *)v7 != *(void *)(a2 + 24) - (void)v8) {
    return 0;
  }
  while (v7 != v6)
  {
    BOOL result = sirinluexternal::RRSurroundingText::operator==(*v7, *v8);
    if (!result) {
      return result;
    }
    ++v7;
    ++v8;
  }
  BOOL result = (*(unsigned char *)(a2 + 44) & 1) == 0;
  if (*(unsigned char *)(a1 + 44)) {
    return (*(unsigned char *)(a2 + 44) & 1) != 0 && *(_DWORD *)(a1 + 40) == *(_DWORD *)(a2 + 40);
  }
  return result;
}

uint64_t sirinluexternal::RRMetadata::hash_value(sirinluexternal::RRMetadata *this)
{
  int v2 = (sirinluexternal::RRBoundingBox *)*((void *)this + 1);
  if (v2) {
    uint64_t v3 = sirinluexternal::RRBoundingBox::hash_value(v2);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (sirinluexternal::RRSurroundingText **)*((void *)this + 2);
  uint64_t v5 = (sirinluexternal::RRSurroundingText **)*((void *)this + 3);
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      long long v7 = *v4++;
      v6 ^= sirinluexternal::RRSurroundingText::hash_value(v7);
    }
    while (v4 != v5);
  }
  if (*((unsigned char *)this + 44)) {
    uint64_t v8 = *((int *)this + 10);
  }
  else {
    uint64_t v8 = 0;
  }
  return v6 ^ v3 ^ v8;
}

uint64_t sirinluexternal::RRMetadata::makeBoundingBox(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::formatText(sirinluinternaluaap_parser::UaaPParserRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "embeddings");
  }
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  long long v7 = (uint64_t *)*((void *)this + 3);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "matching_spans");
  }
  if (*((unsigned char *)this + 72)) {
    PB::TextFormatter::format(a2, "max_num_parses");
  }
  uint64_t v9 = *((void *)this + 6);
  if (v9) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "request_id");
  }
  uint64_t v10 = *((void *)this + 7);
  if (v10) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, a2, "token_chain");
  }
  uint64_t v11 = *((void *)this + 8);
  if (v11) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "turn_input");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 48);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 56);
  if (v5) {
    this = PB::Writer::writeSubmessage(a2, v5);
  }
  uint64_t v6 = *(const PB::Base **)(v3 + 8);
  if (v6) {
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  long long v7 = *(const PB::Base ***)(v3 + 16);
  uint64_t v8 = *(const PB::Base ***)(v3 + 24);
  while (v7 != v8)
  {
    uint64_t v9 = *v7++;
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  uint64_t v10 = *(const PB::Base **)(v3 + 64);
  if (v10) {
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  if (*(unsigned char *)(v3 + 72))
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::readFrom(sirinluinternaluaap_parser::UaaPParserRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        operator new();
      case 3u:
        operator new();
      case 4u:
        PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<>();
      case 5u:
        operator new();
      case 6u:
        *((unsigned char *)this + 72) |= 1u;
        unint64_t v21 = *((void *)a2 + 1);
        unint64_t v22 = *((void *)a2 + 2);
        uint64_t v23 = *(void *)a2;
        if (v21 <= 0xFFFFFFFFFFFFFFF5 && v21 + 10 <= v22)
        {
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          do
          {
            unint64_t v27 = v21 + 1;
            *((void *)a2 + 1) = v21 + 1;
            char v28 = *(unsigned char *)(v23 + v21);
            v26 |= (unint64_t)(v28 & 0x7F) << v24;
            if ((v28 & 0x80) == 0) {
              goto LABEL_50;
            }
            v24 += 7;
            unint64_t v21 = v27;
            BOOL v14 = v25++ > 8;
          }
          while (!v14);
LABEL_46:
          uint64_t v26 = 0;
          goto LABEL_50;
        }
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v26 = 0;
        if (v22 <= v21) {
          unint64_t v22 = *((void *)a2 + 1);
        }
        break;
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v22 == v21)
      {
        uint64_t v26 = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_50;
      }
      unint64_t v31 = v21 + 1;
      char v32 = *(unsigned char *)(v23 + v21);
      *((void *)a2 + 1) = v31;
      v26 |= (unint64_t)(v32 & 0x7F) << v29;
      if ((v32 & 0x80) == 0) {
        break;
      }
      v29 += 7;
      unint64_t v21 = v31;
      BOOL v14 = v30++ > 8;
      if (v14) {
        goto LABEL_46;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      uint64_t v26 = 0;
    }
LABEL_50:
    *((void *)this + 5) = v26;
LABEL_28:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_28;
  }
  return result;
}

void sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest(sirinluinternaluaap_parser::UaaPParserRequest *this)
{
  sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  uint64_t vars8;

  *(void *)this = &unk_1F232EB60;
  unint64_t v2 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  int v4 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v6 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  PB::Base::~Base(this);
}

double sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest(sirinluinternaluaap_parser::UaaPParserRequest *this)
{
  *(void *)this = &unk_1F232EB60;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 18) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EB60;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 18) = 0;
  return result;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest(uint64_t this, const sirinluinternaluaap_parser::UaaPParserRequest *a2)
{
  *(_OWORD *)(this + 8) = 0u;
  *(void *)(this + 48) = 0;
  *(void *)this = &unk_1F232EB60;
  *(_OWORD *)(this + 24) = 0u;
  *(void *)(this + 56) = 0;
  *(void *)(this + 64) = 0;
  *(_DWORD *)(this + 72) = 0;
  if (*((void *)a2 + 6)) {
    operator new();
  }
  if (*((void *)a2 + 7)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 2) != *((void *)a2 + 3)) {
    PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<sirinluinternal::MatchingSpan const&>();
  }
  if (*((void *)a2 + 8)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 72))
  {
    uint64_t v2 = *((void *)a2 + 5);
    *(unsigned char *)(this + 72) |= 1u;
    *(void *)(this + 40) = v2;
  }
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::operator=(uint64_t a1, const sirinluinternaluaap_parser::UaaPParserRequest *a2)
{
  if ((const sirinluinternaluaap_parser::UaaPParserRequest *)a1 != a2)
  {
    sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest((uint64_t)&v10, a2);
    int v3 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(a1 + 72) = v16;
    int v16 = v3;
    long long v4 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(a1 + 48) = v14;
    long long v14 = v4;
    long long v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v11;
    long long v11 = v5;
    long long v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v12;
    long long v12 = v6;
    uint64_t v7 = *(void *)(a1 + 64);
    *(void *)(a1 + 64) = v15;
    uint64_t v15 = v7;
    uint64_t v8 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v13;
    uint64_t v13 = v8;
    sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest((sirinluinternaluaap_parser::UaaPParserRequest *)&v10);
  }
  return a1;
}

uint64_t sirinluinternaluaap_parser::swap(uint64_t this, sirinluinternaluaap_parser::UaaPParserRequest *a2, sirinluinternaluaap_parser::UaaPParserRequest *a3)
{
  int v3 = *(_DWORD *)(this + 72);
  *(_DWORD *)(this + 72) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = v3;
  uint64_t v4 = *(void *)(this + 48);
  *(void *)(this + 48) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v4;
  uint64_t v5 = *(void *)(this + 56);
  *(void *)(this + 56) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v5;
  uint64_t v6 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v6;
  uint64_t v7 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v7;
  uint64_t v8 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v8;
  uint64_t v9 = *(void *)(this + 32);
  uint64_t v10 = *(void *)(this + 40);
  uint64_t v11 = *((void *)a2 + 5);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *(void *)(this + 40) = v11;
  *((void *)a2 + 4) = v9;
  uint64_t v12 = *(void *)(this + 64);
  *(void *)(this + 64) = *((void *)a2 + 8);
  *((void *)a2 + 8) = v12;
  *((void *)a2 + 5) = v10;
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)a1 = &unk_1F232EB60;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a2 + 72) = 0;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  uint64_t v6 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v8 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  uint64_t v9 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v10 = *v4;
  *uint64_t v4 = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((void **)(a1 + 16));
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  uint64_t v11 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  uint64_t v12 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v11;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest((uint64_t)&v10, a2);
    int v3 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(a1 + 72) = v16;
    int v16 = v3;
    long long v4 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(a1 + 48) = v14;
    long long v14 = v4;
    long long v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v11;
    long long v11 = v5;
    long long v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v12;
    long long v12 = v6;
    uint64_t v7 = *(void *)(a1 + 64);
    *(void *)(a1 + 64) = v15;
    uint64_t v15 = v7;
    uint64_t v8 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v13;
    uint64_t v13 = v8;
    sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest((sirinluinternaluaap_parser::UaaPParserRequest *)&v10);
  }
  return a1;
}

BOOL sirinluinternaluaap_parser::UaaPParserRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a2 + 48);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  long long v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void **)(a2 + 56);
  if (v6)
  {
    if (!v7 || !sirinluinternal::TokenChain::operator==(v6, v7)) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a2 + 8);
  if (v8)
  {
    if (!v9 || !sirinluinternal::NLv4EmbeddingTensor::operator==(v8, v9)) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  BOOL result = PB::PtrVector<sirinluinternal::MatchingSpan>::operator==((uint64_t *)(a1 + 16), *(uint64_t **)(a2 + 16), *(void *)(a2 + 24));
  if (!result) {
    return result;
  }
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a2 + 64);
  if (!v11)
  {
    if (!v12) {
      goto LABEL_24;
    }
    return 0;
  }
  if (!v12 || (sirinluexternal::TurnInput::operator==(v11, v12) & 1) == 0) {
    return 0;
  }
LABEL_24:
  BOOL result = (*(unsigned char *)(a2 + 72) & 1) == 0;
  if (*(unsigned char *)(a1 + 72)) {
    return (*(unsigned char *)(a2 + 72) & 1) != 0 && *(void *)(a1 + 40) == *(void *)(a2 + 40);
  }
  return result;
}

unint64_t sirinluinternaluaap_parser::UaaPParserRequest::hash_value(sirinluinternaluaap_parser::UaaPParserRequest *this)
{
  uint64_t v2 = *((void *)this + 6);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 28) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(void *)(v2 + 16);
  if ((*(unsigned char *)(v2 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(int *)(v2 + 24);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  uint64_t v7 = (sirinluinternal::TokenChain *)*((void *)this + 7);
  if (v7) {
    unint64_t v8 = sirinluinternal::TokenChain::hash_value(v7);
  }
  else {
    unint64_t v8 = 0;
  }
  uint64_t v9 = (sirinluinternal::NLv4EmbeddingTensor *)*((void *)this + 1);
  if (v9) {
    unint64_t v10 = sirinluinternal::NLv4EmbeddingTensor::hash_value(v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v11 = (sirinluinternal::MatchingSpan **)*((void *)this + 2);
  uint64_t v12 = (sirinluinternal::MatchingSpan **)*((void *)this + 3);
  if (v11 == v12)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    do
    {
      long long v14 = *v11++;
      v13 ^= sirinluinternal::MatchingSpan::hash_value(v14);
    }
    while (v11 != v12);
  }
  unint64_t v15 = *((void *)this + 8);
  if (v15) {
    unint64_t v15 = sirinluexternal::TurnInput::hash_value((sirinluexternal::TurnInput *)v15);
  }
  if (*((unsigned char *)this + 72)) {
    uint64_t v16 = *((void *)this + 5);
  }
  else {
    uint64_t v16 = 0;
  }
  return v8 ^ v6 ^ v15 ^ v16 ^ v10 ^ v13;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::makeRequestId(uint64_t this)
{
  if (!*(void *)(this + 48)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::makeTokenChain(uint64_t this)
{
  if (!*(void *)(this + 56)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::makeEmbeddings(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::makeTurnInput(uint64_t this)
{
  if (!*(void *)(this + 64)) {
    operator new();
  }
  return this;
}

BOOL SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutputReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v10 >> 3))
      {
        case 3u:
          unint64_t v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERRetrievedContext);
          [a1 addRequiredContext:v17];
          if (PBReaderPlaceMark()
            && (SIRINLUEXTERNALNLU_ROUTERRetrievedContextReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();
            goto LABEL_32;
          }

          return 0;
        case 5u:
          PBReaderReadString();
          unint64_t v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [a1 addOriginalRankedTools:v17];
          }
          goto LABEL_32;
        case 6u:
          PBReaderReadString();
          unint64_t v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [a1 addAdjustedRankedTools:v17];
          }
          goto LABEL_32;
        case 7u:
          PBReaderReadString();
          unint64_t v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [a1 addOriginalRankedSpans:v17];
          }
          goto LABEL_32;
        case 8u:
          PBReaderReadString();
          unint64_t v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [a1 addAdjustedRankedSpans:v17];
          }
LABEL_32:

          goto LABEL_33;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_33:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERNLParseResponseReadFrom(void *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(SIRINLUEXTERNALUserParse);
        [a1 addUserParses:v17];
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUserParseReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t SIRINLUEXTERNALNLU_ROUTERAppReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        char v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

BOOL SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResultReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERNLParseResponse);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALNLU_ROUTERNLParseResponseReadFrom(v17, a2) & 1) == 0) {
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
    uint64_t v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERPommesResponse);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark()
      || (SIRINLUEXTERNALNLU_ROUTERPommesResponseReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERRetrievedContextReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 5)
      {
        uint64_t v23 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERTypedValue);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark()
          || (SIRINLUEXTERNALNLU_ROUTERTypedValueReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 3)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
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
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 8) = v19;
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

uint64_t SIRINLUEXTERNALNLU_ROUTERTypedValueReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERPrimitiveValue);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUEXTERNALNLU_ROUTERPrimitiveValueReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
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

uint64_t SIRINLUEXTERNALNLU_ROUTERPommesResponseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 4)
      {
        uint64_t v17 = PBReaderReadString();
        unsigned int v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

void sub_1C8BE74F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x1CB772580](v7, 0x1030C40E9F947FBLL);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

void sub_1C8BE7728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

void sub_1C8BE7878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C8BE7B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t siricommon::FloatValue::formatText(siricommon::FloatValue *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 12)) {
    PB::TextFormatter::format(a2, "value", *((float *)this + 2));
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t siricommon::FloatValue::writeTo(uint64_t this, PB::Writer *a2)
{
  if (*(unsigned char *)(this + 12)) {
    return PB::Writer::write(a2, *(float *)(this + 8));
  }
  return this;
}

uint64_t siricommon::FloatValue::readFrom(siricommon::FloatValue *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_25;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        *((unsigned char *)this + 12) |= 1u;
        unint64_t v2 = *((void *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((void *)a2 + 2))
        {
          *((_DWORD *)this + 2) = *(_DWORD *)(*(void *)a2 + v2);
          unint64_t v2 = *((void *)a2 + 1) + 4;
          *((void *)a2 + 1) = v2;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
      }
      else
      {
LABEL_25:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v2 = *((void *)a2 + 1);
      }
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_25;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void siricommon::FloatValue::~FloatValue(siricommon::FloatValue *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1CB772580);
}

uint64_t siricommon::FloatValue::FloatValue(uint64_t this)
{
  *(void *)this = &unk_1F232EC10;
  *(_DWORD *)(this + 12) = 0;
  return this;
}

{
  *(void *)this = &unk_1F232EC10;
  *(_DWORD *)(this + 12) = 0;
  return this;
}

float siricommon::FloatValue::FloatValue(siricommon::FloatValue *this, const siricommon::FloatValue *a2)
{
  *(void *)this = &unk_1F232EC10;
  *((_DWORD *)this + 3) = 0;
  if (*((unsigned char *)a2 + 12))
  {
    float result = *((float *)a2 + 2);
    *((unsigned char *)this + 12) = 1;
    *((float *)this + 2) = result;
  }
  return result;
}

{
  float result;

  *(void *)this = &unk_1F232EC10;
  *((_DWORD *)this + 3) = 0;
  if (*((unsigned char *)a2 + 12))
  {
    float result = *((float *)a2 + 2);
    *((unsigned char *)this + 12) = 1;
    *((float *)this + 2) = result;
  }
  return result;
}

uint64_t siricommon::FloatValue::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v7 = &unk_1F232EC10;
    int v3 = *(_DWORD *)(a2 + 8);
    int v4 = *(_DWORD *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = *(unsigned char *)(a2 + 12) & 1;
    int v9 = v4;
    int v5 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = v3;
    int v8 = v5;
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

{
  int v3;
  int v4;
  int v5;
  int v6;
  void *v8;
  int v9;
  int v10;

  if (a1 != a2)
  {
    int v8 = &unk_1F232EC10;
    int v3 = *(_DWORD *)(a2 + 12);
    *(_DWORD *)(a2 + 12) = 0;
    int v4 = *(_DWORD *)(a2 + 8);
    int v5 = *(_DWORD *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v3;
    unsigned int v10 = v5;
    uint64_t v6 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = v4;
    int v9 = v6;
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

float siricommon::swap(siricommon *this, siricommon::FloatValue *a2, siricommon::FloatValue *a3)
{
  int v3 = *((_DWORD *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v3;
  float result = *((float *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((float *)a2 + 2) = result;
  return result;
}

float siricommon::FloatValue::FloatValue(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EC10;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = 0;
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

{
  float result;

  *(void *)a1 = &unk_1F232EC10;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = 0;
  float result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

BOOL siricommon::FloatValue::operator==(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 12);
  BOOL result = (*(unsigned char *)(a2 + 12) & 1) == 0;
  if (v3) {
    return (*(unsigned char *)(a2 + 12) & 1) != 0 && *(float *)(a1 + 8) == *(float *)(a2 + 8);
  }
  return result;
}

float siricommon::FloatValue::hash_value(siricommon::FloatValue *this)
{
  if (*((unsigned char *)this + 12)) {
    return *((float *)this + 2);
  }
  return result;
}

uint64_t sirinluinternal::NluRequestRule::formatText(sirinluinternal::NluRequestRule *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  if (*((void *)this + 3)) {
    PB::TextFormatter::format();
  }
  int v5 = (uint64_t *)*((void *)this + 4);
  uint64_t v6 = (uint64_t *)*((void *)this + 5);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "turn_input_rules");
  }
  if (*((void *)this + 7)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

void *sirinluinternal::NluRequestRule::writeTo(void *this, PB::Writer *a2)
{
  char v3 = this;
  if (this[2]) {
    this = (void *)PB::Writer::write();
  }
  if (v3[3]) {
    this = (void *)PB::Writer::write();
  }
  if (v3[1]) {
    this = (void *)PB::Writer::write();
  }
  if (v3[7]) {
    this = (void *)PB::Writer::write();
  }
  int v5 = (const PB::Base **)v3[4];
  int v4 = (const PB::Base **)v3[5];
  while (v5 != v4)
  {
    uint64_t v6 = *v5++;
    this = (void *)PB::Writer::writeSubmessage(a2, v6);
  }
  return this;
}

uint64_t sirinluinternal::NluRequestRule::readFrom(sirinluinternal::NluRequestRule *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_19;
        }
      }
LABEL_21:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          operator new();
        case 2u:
          operator new();
        case 3u:
          operator new();
        case 4u:
          operator new();
        case 5u:
          operator new();
        default:
          break;
      }
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_21;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_1C8BE85D0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluinternal::NluRequestRule::~NluRequestRule(sirinluinternal::NluRequestRule *this)
{
  sirinluinternal::NluRequestRule::~NluRequestRule(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars8;

  *(void *)this = &unk_1F232EC60;
  unint64_t v2 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  if (*((void *)this + 4))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 4);
    operator delete(*((void **)this + 4));
  }
  unint64_t v3 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  }
  int v4 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    std::default_delete<std::string>::operator()[abi:ne180100](v4);
  }
  int v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    std::default_delete<std::string>::operator()[abi:ne180100](v5);
  }
  PB::Base::~Base(this);
}

double sirinluinternal::NluRequestRule::NluRequestRule(sirinluinternal::NluRequestRule *this)
{
  *(void *)this = &unk_1F232EC60;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EC60;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  return result;
}

uint64_t sirinluinternal::NluRequestRule::NluRequestRule(uint64_t this, const sirinluinternal::NluRequestRule *a2)
{
  *(void *)this = &unk_1F232EC60;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(void *)(this + 56) = 0;
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 3)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 7)) {
    operator new();
  }
  if (*((void *)a2 + 4) != *((void *)a2 + 5)) {
    operator new();
  }
  return this;
}

void sub_1C8BE8A54(void *a1)
{
}

uint64_t sirinluinternal::NluRequestRule::operator=(uint64_t a1, const sirinluinternal::NluRequestRule *a2)
{
  if ((const sirinluinternal::NluRequestRule *)a1 != a2)
  {
    sirinluinternal::NluRequestRule::NluRequestRule((uint64_t)&v8, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v9 = v3;
    uint64_t v4 = *(void *)(a1 + 56);
    *(void *)(a1 + 56) = v12;
    uint64_t v12 = v4;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v10 = v5;
    long long v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    long long v11 = v6;
    sirinluinternal::NluRequestRule::~NluRequestRule((sirinluinternal::NluRequestRule *)&v8);
  }
  return a1;
}

void *sirinluinternal::swap(void *this, sirinluinternal::NluRequestRule *a2, sirinluinternal::NluRequestRule *a3)
{
  uint64_t v3 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v4;
  uint64_t v5 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  uint64_t v6 = this[7];
  this[7] = *((void *)a2 + 7);
  *((void *)a2 + 7) = v6;
  uint64_t v7 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v7;
  uint64_t v8 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v8;
  uint64_t v9 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v9;
  return this;
}

uint64_t sirinluinternal::NluRequestRule::NluRequestRule(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EC60;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  if (v6) {
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  }
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  uint64_t v8 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  if (v8) {
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  }
  uint64_t v9 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v10 = *v4;
  *uint64_t v4 = v9;
  if (v10) {
    std::default_delete<std::string>::operator()[abi:ne180100](v10);
  }
  uint64_t v11 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v12 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v11;
  if (v12) {
    std::default_delete<std::string>::operator()[abi:ne180100](v12);
  }
  BOOL v13 = (void **)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 32));
    operator delete(*v13);
    *BOOL v13 = 0;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return a1;
}

uint64_t sirinluinternal::NluRequestRule::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::NluRequestRule::NluRequestRule((uint64_t)&v8, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v9 = v3;
    uint64_t v4 = *(void *)(a1 + 56);
    *(void *)(a1 + 56) = v12;
    uint64_t v12 = v4;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v10 = v5;
    long long v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    long long v11 = v6;
    sirinluinternal::NluRequestRule::~NluRequestRule((sirinluinternal::NluRequestRule *)&v8);
  }
  return a1;
}

BOOL sirinluinternal::NluRequestRule::operator==(void *a1, void *a2)
{
  uint64_t v4 = (unsigned __int8 *)a1[2];
  long long v5 = (unsigned __int8 **)a2[2];
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      uint64_t v7 = (unsigned __int8 *)v4[23];
    }
    else {
      uint64_t v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      uint64_t v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      long long v10 = (unsigned __int8 *)a2[2];
    }
    else {
      long long v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_20;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_20:
  uint64_t v12 = (unsigned __int8 *)a1[3];
  BOOL v13 = (unsigned __int8 **)a2[3];
  if (v12)
  {
    if (!v13) {
      return 0;
    }
    uint64_t v14 = v12[23];
    if ((v14 & 0x80u) == 0) {
      unsigned int v15 = (unsigned __int8 *)v12[23];
    }
    else {
      unsigned int v15 = (unsigned __int8 *)*((void *)v12 + 1);
    }
    unint64_t v16 = (unsigned __int8 *)*((unsigned __int8 *)v13 + 23);
    int v17 = (char)v16;
    if ((char)v16 < 0) {
      unint64_t v16 = v13[1];
    }
    if (v15 != v16) {
      return 0;
    }
    if (v17 >= 0) {
      char v18 = (unsigned __int8 *)a2[3];
    }
    else {
      char v18 = *v13;
    }
    if ((v14 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v12, v18, *((void *)v12 + 1))) {
        return 0;
      }
    }
    else if (v12[23])
    {
      while (*v12 == *v18)
      {
        ++v12;
        ++v18;
        if (!--v14) {
          goto LABEL_37;
        }
      }
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
LABEL_37:
  uint64_t v19 = (unsigned __int8 *)a1[1];
  uint64_t v20 = (unsigned __int8 **)a2[1];
  if (v19)
  {
    if (!v20) {
      return 0;
    }
    uint64_t v21 = v19[23];
    if ((v21 & 0x80u) == 0) {
      char v22 = (unsigned __int8 *)v19[23];
    }
    else {
      char v22 = (unsigned __int8 *)*((void *)v19 + 1);
    }
    uint64_t v23 = (unsigned __int8 *)*((unsigned __int8 *)v20 + 23);
    int v24 = (char)v23;
    if ((char)v23 < 0) {
      uint64_t v23 = v20[1];
    }
    if (v22 != v23) {
      return 0;
    }
    if (v24 >= 0) {
      unsigned int v25 = (unsigned __int8 *)a2[1];
    }
    else {
      unsigned int v25 = *v20;
    }
    if ((v21 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v19, v25, *((void *)v19 + 1))) {
        return 0;
      }
    }
    else if (v19[23])
    {
      while (*v19 == *v25)
      {
        ++v19;
        ++v25;
        if (!--v21) {
          goto LABEL_54;
        }
      }
      return 0;
    }
  }
  else if (v20)
  {
    return 0;
  }
LABEL_54:
  uint64_t v26 = (unsigned __int8 *)a1[7];
  unint64_t v27 = (unsigned __int8 *)a2[7];
  if (!v26)
  {
    if (!v27) {
      goto LABEL_61;
    }
    return 0;
  }
  if (!v27 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v26, v27)) {
    return 0;
  }
LABEL_61:
  char v28 = (uint64_t *)a2[4];
  uint64_t v29 = a2[5];
  return PB::PtrVector<sirinluinternal::TurnInputRule>::operator==(a1 + 4, v28, v29);
}

BOOL PB::PtrVector<sirinluinternal::TurnInputRule>::operator==(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (v4 - *a1 != a3 - (void)a2) {
    return 0;
  }
  if (v3 == v4) {
    return 1;
  }
  long long v5 = a2;
  uint64_t v6 = v3 + 8;
  do
  {
    uint64_t v7 = *v5++;
    BOOL result = sirinluinternal::TurnInputRule::operator==(*(uint64_t **)(v6 - 8), v7);
    BOOL v9 = !result || v6 == v4;
    v6 += 8;
  }
  while (!v9);
  return result;
}

unint64_t sirinluinternal::NluRequestRule::hash_value(sirinluinternal::NluRequestRule *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = *((void *)this + 3);
  if (v4) {
    unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100](v4);
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = *((void *)this + 1);
  if (v6) {
    unint64_t v7 = std::__string_hash<char>::operator()[abi:ne180100](v6);
  }
  else {
    unint64_t v7 = 0;
  }
  uint64_t v8 = *((void *)this + 7);
  if (v8) {
    unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](v8);
  }
  else {
    unint64_t v9 = 0;
  }
  long long v11 = (sirinluinternal::TurnInputRule **)*((void *)this + 4);
  long long v10 = (sirinluinternal::TurnInputRule **)*((void *)this + 5);
  if (v11 == v10)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    do
    {
      BOOL v13 = *v11++;
      v12 ^= sirinluinternal::TurnInputRule::hash_value(v13);
    }
    while (v11 != v10);
  }
  return v5 ^ v3 ^ v7 ^ v9 ^ v12;
}

uint64_t SIRINLUEXTERNALUsoEntitySpanReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        *(unsigned char *)(a1 + 96) |= 1u;
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
            goto LABEL_61;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_63;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_63:
        uint64_t v32 = 40;
        goto LABEL_68;
      case 2u:
        int v24 = objc_alloc_init(SIRICOMMONStringValue);
        uint64_t v25 = 48;
        goto LABEL_52;
      case 3u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 96) |= 2u;
        while (2)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 1;
            v19 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_67:
        uint64_t v32 = 80;
LABEL_68:
        *(_DWORD *)(a1 + v32) = v19;
        goto LABEL_58;
      case 4u:
        int v24 = objc_alloc_init(SIRICOMMONStringValue);
        uint64_t v25 = 24;
        goto LABEL_52;
      case 5u:
        int v24 = objc_alloc_init(SIRINLUEXTERNALMatchInfo);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALMatchInfoReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_70;
        }
        goto LABEL_57;
      case 6u:
        int v24 = objc_alloc_init(SIRINLUEXTERNALSpanProperty);
        [(id)a1 addProperties:v24];
        if (!PBReaderPlaceMark() || !SIRINLUEXTERNALSpanPropertyReadFrom((uint64_t)v24, a2)) {
          goto LABEL_70;
        }
        goto LABEL_57;
      case 7u:
        int v24 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v31 = 88;
        goto LABEL_45;
      case 8u:
        int v24 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v31 = 16;
LABEL_45:
        objc_storeStrong((id *)(a1 + v31), v24);
        if (!PBReaderPlaceMark() || (SIRICOMMONUInt32ValueReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_70;
        }
        goto LABEL_57;
      case 9u:
        int v24 = objc_alloc_init(SIRINLUEXTERNALAsrAlternative);
        [(id)a1 addAlternatives:v24];
        if (!PBReaderPlaceMark() || !SIRINLUEXTERNALAsrAlternativeReadFrom((uint64_t)v24, a2)) {
          goto LABEL_70;
        }
        goto LABEL_57;
      case 0xAu:
        int v24 = objc_alloc_init(SIRICOMMONStringValue);
        uint64_t v25 = 56;
LABEL_52:
        objc_storeStrong((id *)(a1 + v25), v24);
        if (!PBReaderPlaceMark() || (SIRICOMMONStringValueReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_70;
        }
        goto LABEL_57;
      case 0xBu:
        int v24 = objc_alloc_init(SIRINLUEXTERNALPayloadAttachmentInfo);
        objc_storeStrong((id *)(a1 + 64), v24);
        if (PBReaderPlaceMark()
          && (SIRINLUEXTERNALPayloadAttachmentInfoReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_57:
          PBReaderRecallMark();

LABEL_58:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_70:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_58;
    }
  }
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::formatText(sirinluinternaltokenizer::TokenizerRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "asrId");
  }
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  if (*((void *)this + 3)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 24)) {
    this = PB::Writer::write();
  }
  if (*(void *)(v3 + 16)) {
    this = PB::Writer::write();
  }
  uint64_t v4 = *(const PB::Base **)(v3 + 8);
  if (v4)
  {
    return PB::Writer::writeSubmessage(a2, v4);
  }
  return this;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::readFrom(sirinluinternaltokenizer::TokenizerRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_19;
        }
      }
LABEL_21:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        operator new();
      }
      if (v19 == 2) {
        operator new();
      }
      if (v19 == 1) {
        operator new();
      }
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_21;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest(sirinluinternaltokenizer::TokenizerRequest *this)
{
  sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  *(void *)this = &unk_1F232ECB0;
  unint64_t v2 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  unint64_t v3 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  }
  int v4 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  PB::Base::~Base(this);
}

void *sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(void *this)
{
  *this = &unk_1F232ECB0;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &unk_1F232ECB0;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void *sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(void *this, const sirinluinternaltokenizer::TokenizerRequest *a2)
{
  *this = &unk_1F232ECB0;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  if (*((void *)a2 + 3)) {
    operator new();
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::operator=(uint64_t a1, const sirinluinternaltokenizer::TokenizerRequest *a2)
{
  if ((const sirinluinternaltokenizer::TokenizerRequest *)a1 != a2)
  {
    sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(&v6, a2);
    uint64_t v3 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v8;
    uint64_t v8 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v4;
    sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest((sirinluinternaltokenizer::TokenizerRequest *)&v6);
  }
  return a1;
}

void *sirinluinternaltokenizer::swap(void *this, sirinluinternaltokenizer::TokenizerRequest *a2, sirinluinternaltokenizer::TokenizerRequest *a3)
{
  uint64_t v3 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v3;
  uint64_t v4 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  uint64_t v5 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  return this;
}

void *sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(void *a1, void *a2)
{
  *a1 = &unk_1F232ECB0;
  a1[1] = 0;
  uint64_t v4 = a1 + 1;
  a1[2] = 0;
  a1[3] = 0;
  uint64_t v5 = a2[3];
  a2[3] = 0;
  uint64_t v6 = a1[3];
  a1[3] = v5;
  if (v6) {
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  }
  uint64_t v7 = a2[2];
  a2[2] = 0;
  uint64_t v8 = a1[2];
  a1[2] = v7;
  if (v8) {
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  }
  uint64_t v9 = a2[1];
  a2[1] = 0;
  uint64_t v10 = *v4;
  *uint64_t v4 = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  return a1;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::operator=(uint64_t a1, void *a2)
{
  if ((void *)a1 != a2)
  {
    sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(&v6, a2);
    uint64_t v3 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v8;
    uint64_t v8 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v4;
    sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest((sirinluinternaltokenizer::TokenizerRequest *)&v6);
  }
  return a1;
}

BOOL sirinluinternaltokenizer::TokenizerRequest::operator==(void *a1, void *a2)
{
  long long v4 = (unsigned __int8 *)a1[3];
  uint64_t v5 = (unsigned __int8 **)a2[3];
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      long long v7 = (unsigned __int8 *)v4[23];
    }
    else {
      long long v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      uint64_t v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      uint64_t v10 = (unsigned __int8 *)a2[3];
    }
    else {
      uint64_t v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_21;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_21:
  char v12 = (unsigned __int8 *)a1[2];
  BOOL v13 = (unsigned __int8 **)a2[2];
  if (!v12)
  {
    if (!v13) {
      goto LABEL_38;
    }
    return 0;
  }
  if (!v13) {
    return 0;
  }
  uint64_t v14 = v12[23];
  if ((v14 & 0x80u) == 0) {
    unsigned int v15 = (unsigned __int8 *)v12[23];
  }
  else {
    unsigned int v15 = (unsigned __int8 *)*((void *)v12 + 1);
  }
  unint64_t v16 = (unsigned __int8 *)*((unsigned __int8 *)v13 + 23);
  int v17 = (char)v16;
  if ((char)v16 < 0) {
    unint64_t v16 = v13[1];
  }
  if (v15 != v16) {
    return 0;
  }
  if (v17 >= 0) {
    unsigned int v18 = (unsigned __int8 *)a2[2];
  }
  else {
    unsigned int v18 = *v13;
  }
  if ((v14 & 0x80) != 0)
  {
    if (!memcmp(*(const void **)v12, v18, *((void *)v12 + 1))) {
      goto LABEL_38;
    }
    return 0;
  }
  if (v12[23])
  {
    while (*v12 == *v18)
    {
      ++v12;
      ++v18;
      if (!--v14) {
        goto LABEL_38;
      }
    }
    return 0;
  }
LABEL_38:
  uint64_t v19 = a1[1];
  uint64_t v20 = a2[1];
  BOOL result = (v19 | v20) == 0;
  if (v19) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    uint64_t v22 = a1[1];
    return sirinluexternal::UUID::operator==(v22, v20);
  }
  return result;
}

unint64_t sirinluinternaltokenizer::TokenizerRequest::hash_value(sirinluinternaltokenizer::TokenizerRequest *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = *((void *)this + 2);
  if (v4) {
    unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100](v4);
  }
  uint64_t v5 = *((void *)this + 1);
  if (v5)
  {
    if (*(unsigned char *)(v5 + 28))
    {
      uint64_t v6 = *(void *)(v5 + 8);
      if ((*(unsigned char *)(v5 + 28) & 2) != 0)
      {
LABEL_9:
        uint64_t v7 = *(void *)(v5 + 16);
        if ((*(unsigned char *)(v5 + 28) & 4) != 0)
        {
LABEL_10:
          uint64_t v8 = *(int *)(v5 + 24);
LABEL_14:
          uint64_t v5 = v7 ^ v6 ^ v8;
          return v4 ^ v3 ^ v5;
        }
LABEL_13:
        uint64_t v8 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v6 = 0;
      if ((*(unsigned char *)(v5 + 28) & 2) != 0) {
        goto LABEL_9;
      }
    }
    uint64_t v7 = 0;
    if ((*(unsigned char *)(v5 + 28) & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  return v4 ^ v3 ^ v5;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::makeAsrId(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

BOOL SIRINLUEXTERNALCDMNluRequestReadFrom(id *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        unsigned int v18 = objc_alloc_init(SIRINLUEXTERNALTurnInput);
        objc_storeStrong(a1 + 1, v18);
        goto LABEL_26;
      }
      if (v17 == 1)
      {
        unsigned int v18 = objc_alloc_init(SIRINLUEXTERNALRequestID);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALRequestIDReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_33;
        }
LABEL_28:
        PBReaderRecallMark();

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unsigned int v18 = objc_alloc_init(SIRINLUEXTERNALTurnInput);
    [a1 addPreviousTurnInputs:v18];
LABEL_26:
    if (!PBReaderPlaceMark() || (SIRINLUEXTERNALTurnInputReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_33:

      return 0;
    }
    goto LABEL_28;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::formatText(sirinluexternalcdm_planner::CdmPlannerRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "cdm_planner_request_identifier");
  }
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 16)) {
    this = PB::Writer::write();
  }
  unint64_t v4 = *(const PB::Base **)(v3 + 8);
  if (v4)
  {
    return PB::Writer::writeSubmessage(a2, v4);
  }
  return this;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::readFrom(sirinluexternalcdm_planner::CdmPlannerRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest(sirinluexternalcdm_planner::CdmPlannerRequest *this)
{
  sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232ED00;
  unint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

void *sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232ED00;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232ED00;
  return this;
}

void *sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(void *this, const sirinluexternalcdm_planner::CdmPlannerRequest *a2)
{
  *this = &unk_1F232ED00;
  this[1] = 0;
  this[2] = 0;
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::operator=(uint64_t a1, const sirinluexternalcdm_planner::CdmPlannerRequest *a2)
{
  if ((const sirinluexternalcdm_planner::CdmPlannerRequest *)a1 != a2)
  {
    sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest((sirinluexternalcdm_planner::CdmPlannerRequest *)&v5);
  }
  return a1;
}

uint64_t sirinluexternalcdm_planner::swap(uint64_t this, sirinluexternalcdm_planner::CdmPlannerRequest *a2, sirinluexternalcdm_planner::CdmPlannerRequest *a3)
{
  uint64_t v3 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  return this;
}

void *sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(void *a1, uint64_t a2)
{
  a1[1] = 0;
  uint64_t v4 = a1 + 1;
  *a1 = &unk_1F232ED00;
  a1[2] = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = a1[2];
  a1[2] = v5;
  if (v6) {
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  }
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v8 = *v4;
  *uint64_t v4 = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  return a1;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest((sirinluexternalcdm_planner::CdmPlannerRequest *)&v5);
  }
  return a1;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 **)(a1 + 16);
  uint64_t v5 = *(unsigned __int8 ***)(a2 + 16);
  if (!v4)
  {
    if (!v5) {
      goto LABEL_21;
    }
    return 0;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v4[23];
  if ((v6 & 0x80u) == 0) {
    uint64_t v7 = (unsigned __int8 *)v4[23];
  }
  else {
    uint64_t v7 = (unsigned __int8 *)*((void *)v4 + 1);
  }
  uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
  int v9 = (char)v8;
  if ((char)v8 < 0) {
    uint64_t v8 = v5[1];
  }
  if (v7 != v8) {
    return 0;
  }
  if (v9 >= 0) {
    unint64_t v10 = *(unsigned __int8 **)(a2 + 16);
  }
  else {
    unint64_t v10 = *v5;
  }
  if ((v6 & 0x80) != 0)
  {
    if (!memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
      goto LABEL_21;
    }
    return 0;
  }
  if (v4[23])
  {
    while (*v4 == *v10)
    {
      ++v4;
      ++v10;
      if (!--v6) {
        goto LABEL_21;
      }
    }
    return 0;
  }
LABEL_21:
  uint64_t v12 = *(void *)(a1 + 8);
  unint64_t v13 = *(void *)(a2 + 8);
  uint64_t result = (v12 | v13) == 0;
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    unsigned int v15 = *(void **)(a1 + 8);
    return sirinluexternalcdm_planner::CDMPlannerRequestIdentifier::operator==(v15, (void *)v13);
  }
  return result;
}

unint64_t sirinluexternalcdm_planner::CdmPlannerRequest::hash_value(sirinluexternalcdm_planner::CdmPlannerRequest *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = *((void *)this + 1);
  if (v4) {
    unint64_t v4 = sirinluexternalcdm_planner::CDMPlannerRequestIdentifier::hash_value((sirinluexternalcdm_planner::CDMPlannerRequestIdentifier *)v4);
  }
  return v4 ^ v3;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::makeCdmPlannerRequestIdentifier(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t SIRINLUINTERNALSSUSSUEncodingResultReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (!*(unsigned char *)(a2 + *v5))
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
        if (v9++ >= 9)
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
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_24;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_24;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
LABEL_24:
          uint64_t v22 = *(void **)(a1 + v21);
          *(void *)(a1 + v21) = v20;

          goto LABEL_25;
        case 4u:
          if (v18 == 2)
          {
            uint64_t result = PBReaderPlaceMark();
            if (!result) {
              return result;
            }
            while (1)
            {
              uint64_t v23 = (unint64_t *)(a2 + *v3);
              unint64_t v24 = *v23;
              unint64_t v25 = *(void *)(a2 + *v4);
              if (*v23 >= v25) {
                break;
              }
              uint64_t v26 = *v5;
              if (*(unsigned char *)(a2 + v26)) {
                break;
              }
              if (v24 > 0xFFFFFFFFFFFFFFFBLL || v24 + 4 > v25) {
                *(unsigned char *)(a2 + v26) = 1;
              }
              else {
                *uint64_t v23 = v24 + 4;
              }
              PBRepeatedFloatAdd();
            }
            PBReaderRecallMark();
          }
          else
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)(a2 + *v4)) {
              *(void *)(a2 + v27) = v28 + 4;
            }
            else {
              *(unsigned char *)(a2 + v16) = 1;
            }
            PBRepeatedFloatAdd();
          }
LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            goto LABEL_25;
          }
          return 0;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRINLUINTERNALQUERYREWRITEQRInteractionReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        int v17 = objc_alloc_init(SIRINLUINTERNALQUERYREWRITEQRUtterance);
        [(id)a1 addOriginalUtterances:v17];
        if (PBReaderPlaceMark()
          && (SIRINLUINTERNALQUERYREWRITEQRUtteranceReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_26;
        }
        goto LABEL_52;
      case 2u:
        int v17 = objc_alloc_init(SIRINLUINTERNALToken);
        [(id)a1 addSiriResponse:v17];
        if PBReaderPlaceMark() && (SIRINLUINTERNALTokenReadFrom(v17, a2))
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_50:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_52:

        return 0;
      case 3u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v19;

        goto LABEL_50;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_45:
        *(unsigned char *)(a1 + 40) = v23 != 0;
        goto LABEL_50;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_49:
        *(void *)(a1 + 8) = v29;
        goto LABEL_50;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_50;
    }
  }
}

uint64_t sirinluinternal::RewriteHypothesis::formatText(sirinluinternal::RewriteHypothesis *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "asr_id");
  }
  char v6 = *((unsigned char *)this + 36);
  if (v6)
  {
    PB::TextFormatter::format(a2, "confidence", *((double *)this + 2));
    char v6 = *((unsigned char *)this + 36);
  }
  if ((v6 & 2) != 0) {
    PB::TextFormatter::format(a2, "rewrite_type");
  }
  if (*((void *)this + 3)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::RewriteHypothesis::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  unint64_t v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(void *)(v3 + 24)) {
    this = PB::Writer::write();
  }
  char v5 = *(unsigned char *)(v3 + 36);
  if (v5)
  {
    this = PB::Writer::write(a2, *(double *)(v3 + 16));
    char v5 = *(unsigned char *)(v3 + 36);
  }
  if ((v5 & 2) != 0)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t sirinluinternal::RewriteHypothesis::readFrom(sirinluinternal::RewriteHypothesis *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_25;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      goto LABEL_20;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_25:
    if ((v11 & 7) == 4) {
      break;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        operator new();
      case 3u:
        *((unsigned char *)this + 36) |= 1u;
        unint64_t v21 = *((void *)a2 + 1);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 2) = *(void *)(*(void *)a2 + v21);
          *((void *)a2 + 1) += 8;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
        goto LABEL_20;
      case 4u:
        *((unsigned char *)this + 36) |= 2u;
        unint64_t v22 = *((void *)a2 + 1);
        unint64_t v23 = *((void *)a2 + 2);
        uint64_t v24 = *(void *)a2;
        if (v22 <= 0xFFFFFFFFFFFFFFF5 && v22 + 10 <= v23)
        {
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          do
          {
            unint64_t v28 = v22 + 1;
            *((void *)a2 + 1) = v22 + 1;
            char v29 = *(unsigned char *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0) {
              goto LABEL_50;
            }
            v25 += 7;
            unint64_t v22 = v28;
            BOOL v14 = v26++ > 8;
          }
          while (!v14);
LABEL_45:
          LODWORD(v27) = 0;
          goto LABEL_50;
        }
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v27 = 0;
        if (v23 <= v22) {
          unint64_t v23 = *((void *)a2 + 1);
        }
        break;
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v23 == v22)
      {
        LODWORD(v27) = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_50;
      }
      unint64_t v32 = v22 + 1;
      char v33 = *(unsigned char *)(v24 + v22);
      *((void *)a2 + 1) = v32;
      v27 |= (unint64_t)(v33 & 0x7F) << v30;
      if ((v33 & 0x80) == 0) {
        break;
      }
      v30 += 7;
      unint64_t v22 = v32;
      BOOL v14 = v31++ > 8;
      if (v14) {
        goto LABEL_45;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      LODWORD(v27) = 0;
    }
LABEL_50:
    *((_DWORD *)this + 8) = v27;
LABEL_20:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  int v4 = 0;
  return v4 == 0;
}

void sirinluinternal::RewriteHypothesis::~RewriteHypothesis(sirinluinternal::RewriteHypothesis *this)
{
  sirinluinternal::RewriteHypothesis::~RewriteHypothesis(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232ED70;
  unint64_t v2 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

void *sirinluinternal::RewriteHypothesis::RewriteHypothesis(void *this)
{
  *this = &unk_1F232ED70;
  this[1] = 0;
  this[3] = 0;
  this[4] = 0;
  return this;
}

{
  *this = &unk_1F232ED70;
  this[1] = 0;
  this[3] = 0;
  this[4] = 0;
  return this;
}

uint64_t sirinluinternal::RewriteHypothesis::RewriteHypothesis(uint64_t this, const sirinluinternal::RewriteHypothesis *a2)
{
  *(void *)this = &unk_1F232ED70;
  *(void *)(this + 8) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 3)) {
    operator new();
  }
  char v2 = *((unsigned char *)a2 + 36);
  if (v2)
  {
    uint64_t v3 = *((void *)a2 + 2);
    *(unsigned char *)(this + 36) |= 1u;
    *(void *)(this + 16) = v3;
    char v2 = *((unsigned char *)a2 + 36);
  }
  if ((v2 & 2) != 0)
  {
    int v4 = *((_DWORD *)a2 + 8);
    *(unsigned char *)(this + 36) |= 2u;
    *(_DWORD *)(this + 32) = v4;
  }
  return this;
}

const sirinluinternal::RewriteHypothesis *sirinluinternal::RewriteHypothesis::operator=(const sirinluinternal::RewriteHypothesis *a1, const sirinluinternal::RewriteHypothesis *a2)
{
  if (a1 != a2)
  {
    sirinluinternal::RewriteHypothesis::RewriteHypothesis((uint64_t)v8, a2);
    uint64_t v3 = *((void *)a1 + 1);
    *((void *)a1 + 1) = v9;
    uint64_t v9 = v3;
    uint64_t v4 = *((void *)a1 + 3);
    *((void *)a1 + 3) = v11;
    uint64_t v11 = v4;
    uint64_t v5 = *((void *)a1 + 2);
    *((void *)a1 + 2) = v10;
    uint64_t v10 = v5;
    uint64_t v6 = *((void *)a1 + 4);
    *((void *)a1 + 4) = v12;
    uint64_t v12 = v6;
    sirinluinternal::RewriteHypothesis::~RewriteHypothesis((sirinluinternal::RewriteHypothesis *)v8);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::RewriteHypothesis *a2, sirinluinternal::RewriteHypothesis *a3)
{
  int v3 = *((_DWORD *)this + 9);
  *((_DWORD *)this + 9) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v3;
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v5;
  double result = *((double *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((double *)a2 + 2) = result;
  LODWORD(v5) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v5;
  return result;
}

uint64_t sirinluinternal::RewriteHypothesis::RewriteHypothesis(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232ED70;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a2 + 36) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  if (v7) {
    std::default_delete<std::string>::operator()[abi:ne180100](v7);
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

void *sirinluinternal::RewriteHypothesis::operator=(void *a1, uint64_t a2)
{
  if (a1 != (void *)a2)
  {
    sirinluinternal::RewriteHypothesis::RewriteHypothesis((uint64_t)v8, a2);
    uint64_t v3 = a1[1];
    a1[1] = v9;
    uint64_t v9 = v3;
    uint64_t v4 = a1[3];
    a1[3] = v11;
    uint64_t v11 = v4;
    uint64_t v5 = a1[2];
    a1[2] = v10;
    uint64_t v10 = v5;
    uint64_t v6 = a1[4];
    a1[4] = v12;
    uint64_t v12 = v6;
    sirinluinternal::RewriteHypothesis::~RewriteHypothesis((sirinluinternal::RewriteHypothesis *)v8);
  }
  return a1;
}

BOOL sirinluinternal::RewriteHypothesis::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = *(unsigned __int8 **)(a1 + 24);
  uint64_t v7 = *(unsigned __int8 ***)(a2 + 24);
  if (v6)
  {
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v6[23];
    if ((v8 & 0x80u) == 0) {
      uint64_t v9 = (unsigned __int8 *)v6[23];
    }
    else {
      uint64_t v9 = (unsigned __int8 *)*((void *)v6 + 1);
    }
    uint64_t v10 = (unsigned __int8 *)*((unsigned __int8 *)v7 + 23);
    int v11 = (char)v10;
    if ((char)v10 < 0) {
      uint64_t v10 = v7[1];
    }
    if (v9 != v10) {
      return 0;
    }
    if (v11 >= 0) {
      uint64_t v12 = *(unsigned __int8 **)(a2 + 24);
    }
    else {
      uint64_t v12 = *v7;
    }
    if ((v8 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v6, v12, *((void *)v6 + 1))) {
        return 0;
      }
    }
    else if (v6[23])
    {
      while (*v6 == *v12)
      {
        ++v6;
        ++v12;
        if (!--v8) {
          goto LABEL_23;
        }
      }
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
LABEL_23:
  if (*(unsigned char *)(a1 + 36))
  {
    if ((*(unsigned char *)(a2 + 36) & 1) == 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 36))
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 36) & 2) == 0;
  if ((*(unsigned char *)(a1 + 36) & 2) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 36) & 2) != 0 && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32);
}

unint64_t sirinluinternal::RewriteHypothesis::hash_value(sirinluinternal::RewriteHypothesis *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 28) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(void *)(v2 + 16);
  if ((*(unsigned char *)(v2 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(int *)(v2 + 24);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  unint64_t v7 = *((void *)this + 3);
  if (v7) {
    unint64_t v7 = std::__string_hash<char>::operator()[abi:ne180100](v7);
  }
  if (*((unsigned char *)this + 36))
  {
    double v8 = *((double *)this + 2);
    if (v8 == 0.0) {
      double v8 = 0.0;
    }
    if ((*((unsigned char *)this + 36) & 2) != 0) {
      goto LABEL_15;
    }
LABEL_19:
    uint64_t v9 = 0;
    return v7 ^ v6 ^ *(void *)&v8 ^ v9;
  }
  double v8 = 0.0;
  if ((*((unsigned char *)this + 36) & 2) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v9 = *((int *)this + 8);
  return v7 ^ v6 ^ *(void *)&v8 ^ v9;
}

uint64_t sirinluinternal::RewriteHypothesis::makeAsrId(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::formatText(sirinluinternal::SpanDataForNamedCaptureGroup *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  char v5 = *((unsigned char *)this + 24);
  if (v5)
  {
    PB::TextFormatter::format(a2, "target_node_idx");
    char v5 = *((unsigned char *)this + 24);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "target_uda_idx");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 8)) {
    this = PB::Writer::write();
  }
  char v4 = *(unsigned char *)(v3 + 24);
  if (v4)
  {
    this = PB::Writer::writeVarInt(a2);
    char v4 = *(unsigned char *)(v3 + 24);
  }
  if ((v4 & 2) != 0)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::readFrom(sirinluinternal::SpanDataForNamedCaptureGroup *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_25;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v22 = *((void *)a2 + 1);
        unint64_t v23 = *((void *)a2 + 2);
        uint64_t v24 = *(void *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v27 = 0;
          if (v23 <= v22) {
            unint64_t v23 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_62;
            }
            unint64_t v40 = v22 + 1;
            char v41 = *(unsigned char *)(v24 + v22);
            *((void *)a2 + 1) = v40;
            v27 |= (unint64_t)(v41 & 0x7F) << v38;
            if ((v41 & 0x80) == 0) {
              break;
            }
            v38 += 7;
            unint64_t v22 = v40;
            BOOL v14 = v39++ > 8;
            if (v14)
            {
LABEL_51:
              LODWORD(v27) = 0;
              goto LABEL_62;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v27) = 0;
          }
        }
        else
        {
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (1)
          {
            unint64_t v28 = v22 + 1;
            *((void *)a2 + 1) = v22 + 1;
            char v29 = *(unsigned char *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0) {
              break;
            }
            v25 += 7;
            unint64_t v22 = v28;
            BOOL v14 = v26++ > 8;
            if (v14) {
              goto LABEL_51;
            }
          }
        }
LABEL_62:
        *((_DWORD *)this + 5) = v27;
      }
      else if (v19 == 2)
      {
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v30 = *((void *)a2 + 1);
        unint64_t v31 = *((void *)a2 + 2);
        uint64_t v32 = *(void *)a2;
        if (v30 > 0xFFFFFFFFFFFFFFF5 || v30 + 10 > v31)
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v35 = 0;
          if (v31 <= v30) {
            unint64_t v31 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v31 == v30)
            {
              LODWORD(v35) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_66;
            }
            unint64_t v44 = v30 + 1;
            char v45 = *(unsigned char *)(v32 + v30);
            *((void *)a2 + 1) = v44;
            v35 |= (unint64_t)(v45 & 0x7F) << v42;
            if ((v45 & 0x80) == 0) {
              break;
            }
            v42 += 7;
            unint64_t v30 = v44;
            BOOL v14 = v43++ > 8;
            if (v14)
            {
LABEL_58:
              LODWORD(v35) = 0;
              goto LABEL_66;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v35) = 0;
          }
        }
        else
        {
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          while (1)
          {
            unint64_t v36 = v30 + 1;
            *((void *)a2 + 1) = v30 + 1;
            char v37 = *(unsigned char *)(v32 + v30);
            v35 |= (unint64_t)(v37 & 0x7F) << v33;
            if ((v37 & 0x80) == 0) {
              break;
            }
            v33 += 7;
            unint64_t v30 = v36;
            BOOL v14 = v34++ > 8;
            if (v14) {
              goto LABEL_58;
            }
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v35;
      }
      else
      {
        if (v19 == 1) {
          operator new();
        }
LABEL_25:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_25;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup(sirinluinternal::SpanDataForNamedCaptureGroup *this)
{
  sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t vars8;

  unint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F232EDC0;
  *((void *)this + 1) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup(uint64_t this)
{
  *(void *)this = &unk_1F232EDC0;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_1F232EDC0;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup(uint64_t this, const sirinluinternal::SpanDataForNamedCaptureGroup *a2)
{
  *(void *)this = &unk_1F232EDC0;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  if (*((void *)a2 + 1)) {
    operator new();
  }
  char v2 = *((unsigned char *)a2 + 24);
  if (v2)
  {
    int v3 = *((_DWORD *)a2 + 4);
    *(unsigned char *)(this + 24) |= 1u;
    *(_DWORD *)(this + 16) = v3;
    char v2 = *((unsigned char *)a2 + 24);
  }
  if ((v2 & 2) != 0)
  {
    int v4 = *((_DWORD *)a2 + 5);
    *(unsigned char *)(this + 24) |= 2u;
    *(_DWORD *)(this + 20) = v4;
  }
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::operator=(uint64_t a1, const sirinluinternal::SpanDataForNamedCaptureGroup *a2)
{
  if ((const sirinluinternal::SpanDataForNamedCaptureGroup *)a1 != a2)
  {
    sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup((uint64_t)&v7, a2);
    int v3 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v10;
    int v10 = v3;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v8;
    uint64_t v8 = v4;
    uint64_t v5 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    uint64_t v9 = v5;
    sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup((sirinluinternal::SpanDataForNamedCaptureGroup *)&v7);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::SpanDataForNamedCaptureGroup *a2, sirinluinternal::SpanDataForNamedCaptureGroup *a3)
{
  int v3 = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EDC0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    std::default_delete<std::string>::operator()[abi:ne180100](v5);
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  return a1;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup((uint64_t)&v7, a2);
    int v3 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v10;
    int v10 = v3;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v8;
    uint64_t v8 = v4;
    uint64_t v5 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    uint64_t v9 = v5;
    sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup((sirinluinternal::SpanDataForNamedCaptureGroup *)&v7);
  }
  return a1;
}

BOOL sirinluinternal::SpanDataForNamedCaptureGroup::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 **)(a1 + 8);
  uint64_t v5 = *(unsigned __int8 ***)(a2 + 8);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      uint64_t v7 = (unsigned __int8 *)v4[23];
    }
    else {
      uint64_t v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      uint64_t v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      int v10 = *(unsigned __int8 **)(a2 + 8);
    }
    else {
      int v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_18;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  if (*(unsigned char *)(a1 + 24))
  {
    if ((*(unsigned char *)(a2 + 24) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 24))
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 24) & 2) == 0;
  if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 24) & 2) != 0 && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20);
}

unint64_t sirinluinternal::SpanDataForNamedCaptureGroup::hash_value(sirinluinternal::SpanDataForNamedCaptureGroup *this)
{
  unint64_t v2 = *((void *)this + 1);
  if (v2) {
    unint64_t v2 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  if (*((unsigned char *)this + 24))
  {
    uint64_t v3 = *((int *)this + 4);
    if ((*((unsigned char *)this + 24) & 2) != 0) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v3 = 0;
  if ((*((unsigned char *)this + 24) & 2) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v4 = *((int *)this + 5);
  return v3 ^ v2 ^ v4;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::formatText(sirinluinternal::NLv4EmbeddingTensor *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 4)) {
    PB::TextFormatter::format();
  }
  char v5 = *((unsigned char *)this + 64);
  if (v5)
  {
    PB::TextFormatter::format(a2, "embedding_dim");
    char v5 = *((unsigned char *)this + 64);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)this + 64) & 2) == 0)
  {
    goto LABEL_5;
  }
  PB::TextFormatter::format(a2, "num_layer");
  if ((*((unsigned char *)this + 64) & 4) != 0) {
LABEL_6:
  }
    PB::TextFormatter::format(a2, "num_token");
LABEL_7:
  uint64_t v6 = (float *)*((void *)this + 1);
  uint64_t v7 = (float *)*((void *)this + 2);
  while (v6 != v7)
  {
    float v8 = *v6++;
    PB::TextFormatter::format(a2, "values", v8);
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(float **)(this + 8);
  char v5 = *(float **)(this + 16);
  while (v4 != v5)
  {
    float v6 = *v4++;
    this = PB::Writer::write(a2, v6);
  }
  char v7 = *(unsigned char *)(v3 + 64);
  if ((v7 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v7 = *(unsigned char *)(v3 + 64);
    if ((v7 & 2) == 0)
    {
LABEL_6:
      if ((v7 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)(v3 + 64) & 2) == 0)
  {
    goto LABEL_6;
  }
  this = PB::Writer::writeVarInt(a2);
  if (*(unsigned char *)(v3 + 64)) {
LABEL_7:
  }
    this = PB::Writer::writeVarInt(a2);
LABEL_8:
  if (*(void *)(v3 + 32))
  {
    return PB::Writer::write();
  }
  return this;
}

BOOL sirinluinternal::NLv4EmbeddingTensor::readFrom(sirinluinternal::NLv4EmbeddingTensor *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (2)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_19;
        }
      }
LABEL_25:
      if ((v11 & 7) != 4)
      {
        switch((v11 >> 3))
        {
          case 1u:
            if ((v11 & 7) == 2)
            {
              if (PB::Reader::placeMark()) {
                return 0;
              }
              unint64_t v20 = *((void *)a2 + 1);
              unint64_t v21 = *((void *)a2 + 2);
              while (v20 < v21 && !*((unsigned char *)a2 + 24))
              {
                unint64_t v23 = (char *)*((void *)this + 2);
                unint64_t v22 = *((void *)this + 3);
                if ((unint64_t)v23 >= v22)
                {
                  char v25 = (char *)*((void *)this + 1);
                  uint64_t v26 = (v23 - v25) >> 2;
                  unint64_t v27 = v26 + 1;
                  if ((unint64_t)(v26 + 1) >> 62) {
                    goto LABEL_132;
                  }
                  uint64_t v28 = v22 - (void)v25;
                  if (v28 >> 1 > v27) {
                    unint64_t v27 = v28 >> 1;
                  }
                  if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v29 = v27;
                  }
                  if (v29)
                  {
                    unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v29);
                    char v25 = (char *)*((void *)this + 1);
                    unint64_t v23 = (char *)*((void *)this + 2);
                  }
                  else
                  {
                    uint64_t v30 = 0;
                  }
                  unint64_t v31 = (_DWORD *)(v29 + 4 * v26);
                  *unint64_t v31 = 0;
                  uint64_t v24 = v31 + 1;
                  while (v23 != v25)
                  {
                    int v32 = *((_DWORD *)v23 - 1);
                    v23 -= 4;
                    *--unint64_t v31 = v32;
                  }
                  *((void *)this + 1) = v31;
                  *((void *)this + 2) = v24;
                  *((void *)this + 3) = v29 + 4 * v30;
                  if (v25) {
                    operator delete(v25);
                  }
                }
                else
                {
                  *(_DWORD *)unint64_t v23 = 0;
                  uint64_t v24 = v23 + 4;
                }
                *((void *)this + 2) = v24;
                unint64_t v33 = *((void *)a2 + 1);
                if (v33 > 0xFFFFFFFFFFFFFFFBLL || v33 + 4 > *((void *)a2 + 2))
                {
                  *((unsigned char *)a2 + 24) = 1;
                  break;
                }
                *(v24 - 1) = *(_DWORD *)(*(void *)a2 + v33);
                unint64_t v21 = *((void *)a2 + 2);
                unint64_t v20 = *((void *)a2 + 1) + 4;
                *((void *)a2 + 1) = v20;
              }
              PB::Reader::recallMark();
            }
            else
            {
              uint64_t v59 = (char *)*((void *)this + 2);
              unint64_t v58 = *((void *)this + 3);
              if ((unint64_t)v59 >= v58)
              {
                unint64_t v73 = (char *)*((void *)this + 1);
                uint64_t v74 = (v59 - v73) >> 2;
                unint64_t v75 = v74 + 1;
                if ((unint64_t)(v74 + 1) >> 62) {
LABEL_132:
                }
                  std::vector<std::string>::__throw_length_error[abi:ne180100]();
                uint64_t v76 = v58 - (void)v73;
                if (v76 >> 1 > v75) {
                  unint64_t v75 = v76 >> 1;
                }
                if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v77 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v77 = v75;
                }
                if (v77)
                {
                  unint64_t v77 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v77);
                  unint64_t v73 = (char *)*((void *)this + 1);
                  uint64_t v59 = (char *)*((void *)this + 2);
                }
                else
                {
                  uint64_t v78 = 0;
                }
                v79 = (_DWORD *)(v77 + 4 * v74);
                _DWORD *v79 = 0;
                uint64_t v60 = v79 + 1;
                while (v59 != v73)
                {
                  int v80 = *((_DWORD *)v59 - 1);
                  v59 -= 4;
                  *--v79 = v80;
                }
                *((void *)this + 1) = v79;
                *((void *)this + 2) = v60;
                *((void *)this + 3) = v77 + 4 * v78;
                if (v73) {
                  operator delete(v73);
                }
              }
              else
              {
                *(_DWORD *)uint64_t v59 = 0;
                uint64_t v60 = v59 + 4;
              }
              *((void *)this + 2) = v60;
              unint64_t v81 = *((void *)a2 + 1);
              if (v81 <= 0xFFFFFFFFFFFFFFFBLL && v81 + 4 <= *((void *)a2 + 2))
              {
                *(v60 - 1) = *(_DWORD *)(*(void *)a2 + v81);
                *((void *)a2 + 1) += 4;
              }
              else
              {
                *((unsigned char *)a2 + 24) = 1;
              }
            }
LABEL_20:
            unint64_t v2 = *((void *)a2 + 1);
            unint64_t v3 = *((void *)a2 + 2);
            int v4 = *((unsigned __int8 *)a2 + 24);
            if (v2 >= v3 || v4 != 0) {
              return v4 == 0;
            }
            continue;
          case 2u:
            *((unsigned char *)this + 64) |= 4u;
            unint64_t v34 = *((void *)a2 + 1);
            unint64_t v35 = *((void *)a2 + 2);
            uint64_t v36 = *(void *)a2;
            if (v34 <= 0xFFFFFFFFFFFFFFF5 && v34 + 10 <= v35)
            {
              char v37 = 0;
              unsigned int v38 = 0;
              uint64_t v39 = 0;
              do
              {
                unint64_t v40 = v34 + 1;
                *((void *)a2 + 1) = v34 + 1;
                char v41 = *(unsigned char *)(v36 + v34);
                v39 |= (unint64_t)(v41 & 0x7F) << v37;
                if ((v41 & 0x80) == 0) {
                  goto LABEL_109;
                }
                v37 += 7;
                unint64_t v34 = v40;
                BOOL v14 = v38++ > 8;
              }
              while (!v14);
LABEL_81:
              uint64_t v39 = 0;
              goto LABEL_109;
            }
            char v61 = 0;
            unsigned int v62 = 0;
            uint64_t v39 = 0;
            if (v35 <= v34) {
              unint64_t v35 = *((void *)a2 + 1);
            }
            while (2)
            {
              if (v35 == v34)
              {
                uint64_t v39 = 0;
                *((unsigned char *)a2 + 24) = 1;
              }
              else
              {
                unint64_t v63 = v34 + 1;
                char v64 = *(unsigned char *)(v36 + v34);
                *((void *)a2 + 1) = v63;
                v39 |= (unint64_t)(v64 & 0x7F) << v61;
                if (v64 < 0)
                {
                  v61 += 7;
                  unint64_t v34 = v63;
                  BOOL v14 = v62++ > 8;
                  if (v14) {
                    goto LABEL_81;
                  }
                  continue;
                }
                if (*((unsigned char *)a2 + 24)) {
                  uint64_t v39 = 0;
                }
              }
              break;
            }
LABEL_109:
            *((void *)this + 7) = v39;
            goto LABEL_20;
          case 3u:
            *((unsigned char *)this + 64) |= 2u;
            unint64_t v42 = *((void *)a2 + 1);
            unint64_t v43 = *((void *)a2 + 2);
            uint64_t v44 = *(void *)a2;
            if (v42 <= 0xFFFFFFFFFFFFFFF5 && v42 + 10 <= v43)
            {
              char v45 = 0;
              unsigned int v46 = 0;
              uint64_t v47 = 0;
              do
              {
                unint64_t v48 = v42 + 1;
                *((void *)a2 + 1) = v42 + 1;
                char v49 = *(unsigned char *)(v44 + v42);
                v47 |= (unint64_t)(v49 & 0x7F) << v45;
                if ((v49 & 0x80) == 0) {
                  goto LABEL_112;
                }
                v45 += 7;
                unint64_t v42 = v48;
                BOOL v14 = v46++ > 8;
              }
              while (!v14);
LABEL_88:
              uint64_t v47 = 0;
              goto LABEL_112;
            }
            char v65 = 0;
            unsigned int v66 = 0;
            uint64_t v47 = 0;
            if (v43 <= v42) {
              unint64_t v43 = *((void *)a2 + 1);
            }
            while (2)
            {
              if (v43 == v42)
              {
                uint64_t v47 = 0;
                *((unsigned char *)a2 + 24) = 1;
              }
              else
              {
                unint64_t v67 = v42 + 1;
                char v68 = *(unsigned char *)(v44 + v42);
                *((void *)a2 + 1) = v67;
                v47 |= (unint64_t)(v68 & 0x7F) << v65;
                if (v68 < 0)
                {
                  v65 += 7;
                  unint64_t v42 = v67;
                  BOOL v14 = v66++ > 8;
                  if (v14) {
                    goto LABEL_88;
                  }
                  continue;
                }
                if (*((unsigned char *)a2 + 24)) {
                  uint64_t v47 = 0;
                }
              }
              break;
            }
LABEL_112:
            *((void *)this + 6) = v47;
            goto LABEL_20;
          case 4u:
            *((unsigned char *)this + 64) |= 1u;
            unint64_t v50 = *((void *)a2 + 1);
            unint64_t v51 = *((void *)a2 + 2);
            uint64_t v52 = *(void *)a2;
            if (v50 <= 0xFFFFFFFFFFFFFFF5 && v50 + 10 <= v51)
            {
              char v53 = 0;
              unsigned int v54 = 0;
              uint64_t v55 = 0;
              do
              {
                unint64_t v56 = v50 + 1;
                *((void *)a2 + 1) = v50 + 1;
                char v57 = *(unsigned char *)(v52 + v50);
                v55 |= (unint64_t)(v57 & 0x7F) << v53;
                if ((v57 & 0x80) == 0) {
                  goto LABEL_115;
                }
                v53 += 7;
                unint64_t v50 = v56;
                BOOL v14 = v54++ > 8;
              }
              while (!v14);
LABEL_95:
              uint64_t v55 = 0;
              goto LABEL_115;
            }
            char v69 = 0;
            unsigned int v70 = 0;
            uint64_t v55 = 0;
            if (v51 <= v50) {
              unint64_t v51 = *((void *)a2 + 1);
            }
            while (2)
            {
              if (v51 == v50)
              {
                uint64_t v55 = 0;
                *((unsigned char *)a2 + 24) = 1;
              }
              else
              {
                unint64_t v71 = v50 + 1;
                char v72 = *(unsigned char *)(v52 + v50);
                *((void *)a2 + 1) = v71;
                v55 |= (unint64_t)(v72 & 0x7F) << v69;
                if (v72 < 0)
                {
                  v69 += 7;
                  unint64_t v50 = v71;
                  BOOL v14 = v70++ > 8;
                  if (v14) {
                    goto LABEL_95;
                  }
                  continue;
                }
                if (*((unsigned char *)a2 + 24)) {
                  uint64_t v55 = 0;
                }
              }
              break;
            }
LABEL_115:
            *((void *)this + 5) = v55;
            goto LABEL_20;
          case 5u:
            operator new();
          default:
            goto LABEL_19;
        }
      }
      int v4 = 0;
      return v4 == 0;
    }
    break;
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_25;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  if (PB::Reader::skip(a2)) {
    goto LABEL_20;
  }
  return 0;
}

void sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor(sirinluinternal::NLv4EmbeddingTensor *this)
{
  sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  void *v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232EE10;
  unint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  unint64_t v3 = (void *)*((void *)this + 1);
  if (v3)
  {
    *((void *)this + 2) = v3;
    operator delete(v3);
  }
  PB::Base::~Base(this);
}

double sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(sirinluinternal::NLv4EmbeddingTensor *this)
{
  *(void *)this = &unk_1F232EE10;
  *((_DWORD *)this + 16) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EE10;
  *((_DWORD *)this + 16) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

sirinluinternal::NLv4EmbeddingTensor *sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(char **this, char **a2)
{
  *this = (char *)&unk_1F232EE10;
  *(_OWORD *)(this + 1) = 0u;
  int v4 = this + 1;
  *((_DWORD *)this + 16) = 0;
  *(_OWORD *)(this + 3) = 0u;
  if (this != a2) {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v4, a2[1], a2[2], (a2[2] - a2[1]) >> 2);
  }
  char v5 = *((unsigned char *)a2 + 64);
  if ((v5 & 4) != 0)
  {
    char v7 = a2[7];
    *((unsigned char *)this + 64) |= 4u;
    this[7] = v7;
    char v5 = *((unsigned char *)a2 + 64);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if (((_BYTE)a2[8] & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v8 = a2[6];
  *((unsigned char *)this + 64) |= 2u;
  this[6] = v8;
  if ((_BYTE)a2[8])
  {
LABEL_6:
    float v6 = a2[5];
    *((unsigned char *)this + 64) |= 1u;
    this[5] = v6;
  }
LABEL_7:
  if (a2[4]) {
    operator new();
  }
  return (sirinluinternal::NLv4EmbeddingTensor *)this;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::operator=(uint64_t a1, char **a2)
{
  if ((char **)a1 != a2)
  {
    sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(&v9, a2);
    int v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(a1 + 64) = v14;
    int v14 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    uint64_t v5 = *(void *)(a1 + 56);
    *(void *)(a1 + 56) = v13;
    uint64_t v13 = v5;
    long long v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v12 = v6;
    long long v7 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v10 = v4;
    long long v11 = v7;
    sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor((sirinluinternal::NLv4EmbeddingTensor *)&v9);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::NLv4EmbeddingTensor *a2, sirinluinternal::NLv4EmbeddingTensor *a3)
{
  int v3 = *(_DWORD *)(this + 64);
  *(_DWORD *)(this + 64) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v5;
  uint64_t v6 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  uint64_t v7 = *(void *)(this + 56);
  *(void *)(this + 56) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v7;
  uint64_t v8 = *(void *)(this + 48);
  *(void *)(this + 48) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v8;
  uint64_t v10 = *(void *)(this + 32);
  uint64_t v9 = *(void *)(this + 40);
  uint64_t v11 = *((void *)a2 + 5);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *(void *)(this + 40) = v11;
  *((void *)a2 + 4) = v10;
  *((void *)a2 + 5) = v9;
  return this;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EE10;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (void *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 64) = 0;
  uint64_t v5 = (void *)(a2 + 8);
  uint64_t v6 = *(void **)(a1 + 8);
  if (v6)
  {
    *(void *)(a1 + 16) = v6;
    operator delete(v6);
    *uint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  v5[1] = 0;
  v5[2] = 0;
  *uint64_t v5 = 0;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v7;
  if (v9) {
    std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  return a1;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor((uint64_t)v9, a2);
    int v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(a1 + 64) = v14;
    int v14 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    uint64_t v5 = *(void *)(a1 + 56);
    *(void *)(a1 + 56) = v13;
    uint64_t v13 = v5;
    long long v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v12 = v6;
    long long v7 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v10 = v4;
    long long v11 = v7;
    sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor((sirinluinternal::NLv4EmbeddingTensor *)v9);
  }
  return a1;
}

BOOL sirinluinternal::NLv4EmbeddingTensor::operator==(uint64_t a1, uint64_t a2)
{
  int v3 = *(float **)(a1 + 8);
  unint64_t v2 = *(float **)(a1 + 16);
  long long v4 = *(float **)(a2 + 8);
  if ((char *)v2 - (char *)v3 != *(void *)(a2 + 16) - (void)v4) {
    return 0;
  }
  while (v3 != v2)
  {
    if (*v3 != *v4) {
      return 0;
    }
    ++v3;
    ++v4;
  }
  if ((*(unsigned char *)(a1 + 64) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 64) & 4) == 0 || *(void *)(a1 + 56) != *(void *)(a2 + 56)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 64) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 64) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 64) & 2) == 0 || *(void *)(a1 + 48) != *(void *)(a2 + 48)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 64) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 64) & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 64) & 1) == 0) {
      goto LABEL_20;
    }
    return 0;
  }
  if ((*(unsigned char *)(a2 + 64) & 1) == 0 || *(void *)(a1 + 40) != *(void *)(a2 + 40)) {
    return 0;
  }
LABEL_20:
  uint64_t v5 = *(unsigned __int8 **)(a1 + 32);
  long long v6 = *(unsigned __int8 **)(a2 + 32);
  BOOL result = ((unint64_t)v5 | (unint64_t)v6) == 0;
  if (v5)
  {
    if (v6) {
      return std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v5, v6);
    }
  }
  return result;
}

unint64_t sirinluinternal::NLv4EmbeddingTensor::hash_value(sirinluinternal::NLv4EmbeddingTensor *this)
{
  uint64_t v2 = PBHashBytes();
  if ((*((unsigned char *)this + 64) & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 64) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*((unsigned char *)this + 64)) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = *((void *)this + 7);
  if ((*((unsigned char *)this + 64) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = *((void *)this + 6);
  if (*((unsigned char *)this + 64))
  {
LABEL_4:
    uint64_t v5 = *((void *)this + 5);
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = *((void *)this + 4);
  if (v6) {
    unint64_t v6 = std::__string_hash<char>::operator()[abi:ne180100](v6);
  }
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

BOOL SIRINLUEXTERNALUserWantedToPauseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v17 = objc_alloc_init(SIRINLUEXTERNALUUID);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v17, a2) & 1) == 0) {
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
    unint64_t v17 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !SIRINLUEXTERNALUsoGraphReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sirinluexternal::MatchInfo::formatText(sirinluexternal::MatchInfo *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 4);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "edit_distance");
  }
  uint64_t v6 = *((void *)this + 5);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "match_score");
  }
  if (*((unsigned char *)this + 100)) {
    PB::TextFormatter::format(a2, "match_signal_bitset");
  }
  uint64_t v7 = *((void *)this + 6);
  if (v7) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "matched_alias_count");
  }
  uint64_t v8 = *((void *)this + 1);
  uint64_t v9 = *((void *)this + 2);
  while (v8 != v9)
  {
    v8 += 4;
    PB::TextFormatter::format(a2, "matched_alias_types");
  }
  uint64_t v10 = *((void *)this + 7);
  if (v10) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, a2, "matched_stop_word_count");
  }
  uint64_t v11 = *((void *)this + 8);
  if (v11) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "matched_token_count");
  }
  uint64_t v12 = *((void *)this + 9);
  if (v12) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v12 + 32))(v12, a2, "max_alias_count");
  }
  uint64_t v13 = *((void *)this + 10);
  if (v13) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v13 + 32))(v13, a2, "max_stop_word_count");
  }
  uint64_t v14 = *((void *)this + 11);
  if (v14) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v14 + 32))(v14, a2, "max_token_count");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::MatchInfo::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = (void *)this;
  if (*(unsigned char *)(this + 100)) {
    this = PB::Writer::writeFixed(a2);
  }
  uint64_t v4 = (const PB::Base *)v3[5];
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = (const PB::Base *)v3[11];
  if (v5) {
    this = PB::Writer::writeSubmessage(a2, v5);
  }
  uint64_t v6 = (const PB::Base *)v3[8];
  if (v6) {
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  uint64_t v7 = (const PB::Base *)v3[10];
  if (v7) {
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  uint64_t v8 = (const PB::Base *)v3[7];
  if (v8) {
    this = PB::Writer::writeSubmessage(a2, v8);
  }
  uint64_t v9 = (const PB::Base *)v3[4];
  if (v9) {
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  uint64_t v10 = (const PB::Base *)v3[9];
  if (v10) {
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  uint64_t v11 = (const PB::Base *)v3[6];
  if (v11) {
    this = PB::Writer::writeSubmessage(a2, v11);
  }
  uint64_t v13 = v3[1];
  uint64_t v12 = v3[2];
  while (v13 != v12)
  {
    v13 += 4;
    this = PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL sirinluexternal::MatchInfo::readFrom(sirinluexternal::MatchInfo *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v37 = v10++ > 8;
      if (v37) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        *((unsigned char *)this + 100) |= 1u;
        unint64_t v18 = *((void *)a2 + 1);
        if (v18 <= 0xFFFFFFFFFFFFFFFBLL && v18 + 4 <= *((void *)a2 + 2))
        {
          *((_DWORD *)this + 24) = *(_DWORD *)(*(void *)a2 + v18);
          *((void *)a2 + 1) += 4;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
        break;
      case 2u:
        operator new();
      case 3u:
        operator new();
      case 4u:
        operator new();
      case 5u:
        operator new();
      case 6u:
        operator new();
      case 7u:
        operator new();
      case 8u:
        operator new();
      case 9u:
        operator new();
      case 0xAu:
        if ((v11 & 7) == 2)
        {
          if (PB::Reader::placeMark()) {
            return 0;
          }
          if (*((void *)a2 + 1) < *((void *)a2 + 2) && !*((unsigned char *)a2 + 24))
          {
            unint64_t v20 = (char *)*((void *)this + 2);
            while (1)
            {
              unint64_t v21 = *((void *)this + 3);
              if ((unint64_t)v20 >= v21)
              {
                unint64_t v22 = (char *)*((void *)this + 1);
                uint64_t v23 = (v20 - v22) >> 2;
                unint64_t v24 = v23 + 1;
                if ((unint64_t)(v23 + 1) >> 62) {
                  goto LABEL_126;
                }
                uint64_t v25 = v21 - (void)v22;
                if (v25 >> 1 > v24) {
                  unint64_t v24 = v25 >> 1;
                }
                if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v26 = v24;
                }
                if (v26)
                {
                  unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v26);
                  unint64_t v22 = (char *)*((void *)this + 1);
                  unint64_t v20 = (char *)*((void *)this + 2);
                }
                else
                {
                  uint64_t v27 = 0;
                }
                uint64_t v28 = (_DWORD *)(v26 + 4 * v23);
                *uint64_t v28 = 0;
                unint64_t v29 = (char *)(v28 + 1);
                while (v20 != v22)
                {
                  int v30 = *((_DWORD *)v20 - 1);
                  v20 -= 4;
                  *--uint64_t v28 = v30;
                }
                *((void *)this + 1) = v28;
                *((void *)this + 2) = v29;
                *((void *)this + 3) = v26 + 4 * v27;
                if (v22) {
                  operator delete(v22);
                }
                unint64_t v20 = v29;
              }
              else
              {
                *(_DWORD *)unint64_t v20 = 0;
                v20 += 4;
              }
              *((void *)this + 2) = v20;
              unint64_t v32 = *((void *)a2 + 1);
              unint64_t v31 = *((void *)a2 + 2);
              uint64_t v33 = *(void *)a2;
              char v34 = 0;
              unsigned int v35 = 0;
              uint64_t v36 = 0;
              BOOL v37 = v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v31;
              if (v37) {
                break;
              }
              while (1)
              {
                unint64_t v39 = v32 + 1;
                *((void *)a2 + 1) = v32 + 1;
                char v41 = *(unsigned char *)(v33 + v32);
                v36 |= (unint64_t)(v41 & 0x7F) << v34;
                if ((v41 & 0x80) == 0) {
                  break;
                }
                v34 += 7;
                unint64_t v32 = v39;
                BOOL v37 = v35++ > 8;
                if (v37) {
                  goto LABEL_78;
                }
              }
LABEL_81:
              *((_DWORD *)v20 - 1) = v36;
              if (v39 >= v31 || *((unsigned char *)a2 + 24)) {
                goto LABEL_34;
              }
            }
            if (v31 <= v32) {
              uint64_t v38 = *((void *)a2 + 1);
            }
            else {
              uint64_t v38 = *((void *)a2 + 2);
            }
            while (v38 != v32)
            {
              unint64_t v39 = v32 + 1;
              char v40 = *(unsigned char *)(v33 + v32);
              *((void *)a2 + 1) = v39;
              v36 |= (unint64_t)(v40 & 0x7F) << v34;
              if ((v40 & 0x80) == 0)
              {
                if (*((unsigned char *)a2 + 24)) {
                  LODWORD(v36) = 0;
                }
                goto LABEL_81;
              }
              v34 += 7;
              unint64_t v32 = v39;
              BOOL v37 = v35++ > 8;
              if (v37)
              {
LABEL_78:
                LODWORD(v36) = 0;
                goto LABEL_81;
              }
            }
            *((unsigned char *)a2 + 24) = 1;
            *((_DWORD *)v20 - 1) = 0;
          }
LABEL_34:
          PB::Reader::recallMark();
        }
        else
        {
          unint64_t v43 = (char *)*((void *)this + 2);
          unint64_t v42 = *((void *)this + 3);
          if ((unint64_t)v43 >= v42)
          {
            char v45 = (char *)*((void *)this + 1);
            uint64_t v46 = (v43 - v45) >> 2;
            unint64_t v47 = v46 + 1;
            if ((unint64_t)(v46 + 1) >> 62) {
LABEL_126:
            }
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            uint64_t v48 = v42 - (void)v45;
            if (v48 >> 1 > v47) {
              unint64_t v47 = v48 >> 1;
            }
            if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v49 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v49 = v47;
            }
            if (v49)
            {
              unint64_t v49 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v49);
              char v45 = (char *)*((void *)this + 1);
              unint64_t v43 = (char *)*((void *)this + 2);
            }
            else
            {
              uint64_t v50 = 0;
            }
            unint64_t v51 = (_DWORD *)(v49 + 4 * v46);
            *unint64_t v51 = 0;
            uint64_t v44 = v51 + 1;
            while (v43 != v45)
            {
              int v52 = *((_DWORD *)v43 - 1);
              v43 -= 4;
              *--unint64_t v51 = v52;
            }
            *((void *)this + 1) = v51;
            *((void *)this + 2) = v44;
            *((void *)this + 3) = v49 + 4 * v50;
            if (v45) {
              operator delete(v45);
            }
          }
          else
          {
            *(_DWORD *)unint64_t v43 = 0;
            uint64_t v44 = v43 + 4;
          }
          *((void *)this + 2) = v44;
          unint64_t v53 = *((void *)a2 + 1);
          unint64_t v54 = *((void *)a2 + 2);
          uint64_t v55 = *(void *)a2;
          char v56 = 0;
          unsigned int v57 = 0;
          if (v53 > 0xFFFFFFFFFFFFFFF5 || v53 + 10 > v54)
          {
            uint64_t v61 = 0;
            if (v54 <= v53) {
              unint64_t v54 = *((void *)a2 + 1);
            }
            while (1)
            {
              if (v54 == v53)
              {
                LODWORD(v61) = 0;
                *((unsigned char *)a2 + 24) = 1;
                goto LABEL_121;
              }
              unint64_t v59 = v53 + 1;
              char v60 = *(unsigned char *)(v55 + v53);
              *((void *)a2 + 1) = v59;
              v61 |= (unint64_t)(v60 & 0x7F) << v56;
              if ((v60 & 0x80) == 0) {
                break;
              }
              v56 += 7;
              unint64_t v53 = v59;
              BOOL v37 = v57++ > 8;
              if (v37)
              {
LABEL_117:
                LODWORD(v61) = 0;
                goto LABEL_121;
              }
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v61) = 0;
            }
          }
          else
          {
            uint64_t v61 = 0;
            while (1)
            {
              unint64_t v62 = v53 + 1;
              *((void *)a2 + 1) = v53 + 1;
              char v63 = *(unsigned char *)(v55 + v53);
              v61 |= (unint64_t)(v63 & 0x7F) << v56;
              if ((v63 & 0x80) == 0) {
                break;
              }
              v56 += 7;
              unint64_t v53 = v62;
              BOOL v37 = v57++ > 8;
              if (v37) {
                goto LABEL_117;
              }
            }
          }
LABEL_121:
          *(v44 - 1) = v61;
        }
        break;
      default:
        goto LABEL_19;
    }
LABEL_35:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v14 = 0;
  unsigned int v15 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v16 = v2 + 1;
    char v17 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v16;
    v11 |= (unint64_t)(v17 & 0x7F) << v14;
    if ((v17 & 0x80) == 0) {
      goto LABEL_21;
    }
    v14 += 7;
    unint64_t v2 = v16;
    BOOL v37 = v15++ > 8;
  }
  while (!v37);
LABEL_19:
  if (PB::Reader::skip(a2)) {
    goto LABEL_35;
  }
  return 0;
}

void sirinluexternal::MatchInfo::~MatchInfo(sirinluexternal::MatchInfo *this)
{
  sirinluexternal::MatchInfo::~MatchInfo(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t vars8;

  *(void *)this = &unk_1F232EE60;
  unint64_t v2 = *((void *)this + 11);
  *((void *)this + 11) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  int v4 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  char v9 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  unsigned int v10 = (void *)*((void *)this + 1);
  if (v10)
  {
    *((void *)this + 2) = v10;
    operator delete(v10);
  }
  PB::Base::~Base(this);
}

double sirinluexternal::MatchInfo::MatchInfo(sirinluexternal::MatchInfo *this)
{
  *(void *)this = &unk_1F232EE60;
  *((_DWORD *)this + 25) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((void *)this + 11) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EE60;
  *((_DWORD *)this + 25) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((void *)this + 11) = 0;
  return result;
}

sirinluexternal::MatchInfo *sirinluexternal::MatchInfo::MatchInfo(sirinluexternal::MatchInfo *this, const sirinluexternal::MatchInfo *a2)
{
  *(void *)this = &unk_1F232EE60;
  *(_OWORD *)((char *)this + 8) = 0u;
  unint64_t v3 = (void *)((char *)this + 8);
  *((_DWORD *)this + 25) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((void *)this + 11) = 0;
  if (*((unsigned char *)a2 + 100))
  {
    int v4 = *((_DWORD *)a2 + 24);
    *((unsigned char *)this + 100) = 1;
    *((_DWORD *)this + 24) = v4;
  }
  if (*((void *)a2 + 5)) {
    operator new();
  }
  if (*((void *)a2 + 11)) {
    operator new();
  }
  if (*((void *)a2 + 8)) {
    operator new();
  }
  if (*((void *)a2 + 10)) {
    operator new();
  }
  if (*((void *)a2 + 7)) {
    operator new();
  }
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 9)) {
    operator new();
  }
  if (*((void *)a2 + 6)) {
    operator new();
  }
  if (this != a2)
  {
    uint64_t v5 = (char *)*((void *)a2 + 1);
    uint64_t v6 = (unsigned char *)*((void *)a2 + 2);
    size_t v7 = v6 - v5;
    unint64_t v8 = (v6 - v5) >> 2;
    uint64_t v9 = *((void *)this + 3);
    unsigned int v10 = (char *)*((void *)this + 1);
    if (v8 <= (v9 - (uint64_t)v10) >> 2)
    {
      char v13 = (void **)((char *)this + 16);
      unsigned int v15 = (unsigned char *)*((void *)this + 2);
      unint64_t v16 = (v15 - v10) >> 2;
      if (v16 < v8)
      {
        char v17 = &v5[4 * v16];
        if (v15 != v10)
        {
          memmove(*((void **)this + 1), v5, v15 - v10);
          unsigned int v10 = (char *)*v13;
        }
        size_t v7 = v6 - v17;
        if (v6 == v17) {
          goto LABEL_39;
        }
        unint64_t v18 = v10;
        unint64_t v19 = v17;
        goto LABEL_38;
      }
    }
    else
    {
      if (v10)
      {
        *((void *)this + 2) = v10;
        operator delete(v10);
        uint64_t v9 = 0;
        *unint64_t v3 = 0;
        v3[1] = 0;
        v3[2] = 0;
      }
      if ((v7 & 0x8000000000000000) != 0) {
        goto LABEL_41;
      }
      uint64_t v11 = v9 >> 1;
      if (v9 >> 1 <= v8) {
        uint64_t v11 = (v6 - v5) >> 2;
      }
      unint64_t v12 = (unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v11;
      if (v12 >> 62) {
LABEL_41:
      }
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      unsigned int v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v12);
      *((void *)this + 2) = v10;
      char v13 = (void **)((char *)this + 16);
      *((void *)this + 1) = v10;
      *((void *)this + 3) = &v10[4 * v14];
    }
    if (v6 == v5)
    {
LABEL_39:
      *char v13 = &v10[v7];
      return this;
    }
    unint64_t v18 = v10;
    unint64_t v19 = v5;
LABEL_38:
    memmove(v18, v19, v7);
    goto LABEL_39;
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::operator=(uint64_t a1, const sirinluexternal::MatchInfo *a2)
{
  if ((const sirinluexternal::MatchInfo *)a1 != a2)
  {
    sirinluexternal::MatchInfo::MatchInfo((sirinluexternal::MatchInfo *)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::MatchInfo *)v5, v3);
    sirinluexternal::MatchInfo::~MatchInfo((sirinluexternal::MatchInfo *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::MatchInfo *a2, sirinluexternal::MatchInfo *a3)
{
  int v3 = *(_DWORD *)(this + 100);
  *(_DWORD *)(this + 100) = *((_DWORD *)a2 + 25);
  *((_DWORD *)a2 + 25) = v3;
  int v4 = *(_DWORD *)(this + 96);
  *(_DWORD *)(this + 96) = *((_DWORD *)a2 + 24);
  *((_DWORD *)a2 + 24) = v4;
  uint64_t v5 = *(void *)(this + 40);
  *(void *)(this + 40) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v5;
  uint64_t v6 = *(void *)(this + 88);
  *(void *)(this + 88) = *((void *)a2 + 11);
  *((void *)a2 + 11) = v6;
  uint64_t v7 = *(void *)(this + 64);
  *(void *)(this + 64) = *((void *)a2 + 8);
  *((void *)a2 + 8) = v7;
  uint64_t v8 = *(void *)(this + 80);
  *(void *)(this + 80) = *((void *)a2 + 10);
  *((void *)a2 + 10) = v8;
  uint64_t v9 = *(void *)(this + 56);
  *(void *)(this + 56) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v9;
  uint64_t v10 = *(void *)(this + 32);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v10;
  uint64_t v11 = *(void *)(this + 72);
  *(void *)(this + 72) = *((void *)a2 + 9);
  *((void *)a2 + 9) = v11;
  uint64_t v12 = *(void *)(this + 48);
  *(void *)(this + 48) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v12;
  uint64_t v13 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v13;
  uint64_t v14 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v14;
  uint64_t v15 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v15;
  return this;
}

uint64_t sirinluexternal::MatchInfo::MatchInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EE60;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(void *)(a1 + 88) = 0;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  *(_DWORD *)(a2 + 100) = 0;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a2 + 88) = 0;
  uint64_t v8 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  uint64_t v10 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a2 + 80) = 0;
  uint64_t v12 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v11;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  uint64_t v13 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v14 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v13;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  uint64_t v15 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v16 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v15;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  uint64_t v17 = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  uint64_t v18 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v17;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  uint64_t v19 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  uint64_t v20 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v19;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  unint64_t v21 = *(void **)v4;
  if (*(void *)v4)
  {
    *(void *)(a1 + 16) = v21;
    operator delete(v21);
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
    *(void *)(v4 + 16) = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluexternal::MatchInfo::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::MatchInfo::MatchInfo((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::MatchInfo *)v5, v3);
    sirinluexternal::MatchInfo::~MatchInfo((sirinluexternal::MatchInfo *)v5);
  }
  return a1;
}

BOOL sirinluexternal::MatchInfo::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 100))
  {
    if ((*(unsigned char *)(a2 + 100) & 1) == 0 || *(_DWORD *)(a1 + 96) != *(_DWORD *)(a2 + 96)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 100))
  {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a2 + 40);
  if (v2)
  {
    if (!v3) {
      return 0;
    }
    if (*(unsigned char *)(v2 + 12))
    {
      if ((*(unsigned char *)(v3 + 12) & 1) == 0 || *(float *)(v2 + 8) != *(float *)(v3 + 8)) {
        return 0;
      }
    }
    else if (*(unsigned char *)(v3 + 12))
    {
      return 0;
    }
  }
  else if (v3)
  {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a2 + 88);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    if (*(unsigned char *)(v4 + 12))
    {
      if ((*(unsigned char *)(v5 + 12) & 1) == 0 || *(_DWORD *)(v4 + 8) != *(_DWORD *)(v5 + 8)) {
        return 0;
      }
    }
    else if (*(unsigned char *)(v5 + 12))
    {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a2 + 64);
  if (v6)
  {
    if (!v7) {
      return 0;
    }
    if (*(unsigned char *)(v6 + 12))
    {
      if ((*(unsigned char *)(v7 + 12) & 1) == 0 || *(_DWORD *)(v6 + 8) != *(_DWORD *)(v7 + 8)) {
        return 0;
      }
    }
    else if (*(unsigned char *)(v7 + 12))
    {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a2 + 80);
  if (v8)
  {
    if (!v9) {
      return 0;
    }
    if (*(unsigned char *)(v8 + 12))
    {
      if ((*(unsigned char *)(v9 + 12) & 1) == 0 || *(_DWORD *)(v8 + 8) != *(_DWORD *)(v9 + 8)) {
        return 0;
      }
    }
    else if (*(unsigned char *)(v9 + 12))
    {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a2 + 56);
  if (v10)
  {
    if (!v11) {
      return 0;
    }
    if (*(unsigned char *)(v10 + 12))
    {
      if ((*(unsigned char *)(v11 + 12) & 1) == 0 || *(_DWORD *)(v10 + 8) != *(_DWORD *)(v11 + 8)) {
        return 0;
      }
    }
    else if (*(unsigned char *)(v11 + 12))
    {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a2 + 32);
  if (v12)
  {
    if (!v13) {
      return 0;
    }
    if (*(unsigned char *)(v12 + 12))
    {
      if ((*(unsigned char *)(v13 + 12) & 1) == 0 || *(_DWORD *)(v12 + 8) != *(_DWORD *)(v13 + 8)) {
        return 0;
      }
    }
    else if (*(unsigned char *)(v13 + 12))
    {
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(a2 + 72);
  if (v14)
  {
    if (!v15) {
      return 0;
    }
    if (*(unsigned char *)(v14 + 12))
    {
      if ((*(unsigned char *)(v15 + 12) & 1) == 0 || *(_DWORD *)(v14 + 8) != *(_DWORD *)(v15 + 8)) {
        return 0;
      }
    }
    else if (*(unsigned char *)(v15 + 12))
    {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a2 + 48);
  if (!v16)
  {
    if (!v17) {
      goto LABEL_78;
    }
    return 0;
  }
  if (!v17) {
    return 0;
  }
  if (*(unsigned char *)(v16 + 12))
  {
    if ((*(unsigned char *)(v17 + 12) & 1) == 0 || *(_DWORD *)(v16 + 8) != *(_DWORD *)(v17 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(v17 + 12))
  {
    return 0;
  }
LABEL_78:
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v20 = *(int **)(a2 + 8);
  if (v18 - v19 != *(void *)(a2 + 16) - (void)v20) {
    return 0;
  }
  if (v19 == v18) {
    return 1;
  }
  uint64_t v21 = v19 + 4;
  do
  {
    int v22 = *v20++;
    BOOL result = *(_DWORD *)(v21 - 4) == v22;
    BOOL v24 = *(_DWORD *)(v21 - 4) != v22 || v21 == v18;
    v21 += 4;
  }
  while (!v24);
  return result;
}

uint64_t sirinluexternal::MatchInfo::hash_value(sirinluexternal::MatchInfo *this)
{
  if (*((unsigned char *)this + 100)) {
    uint64_t v1 = *((unsigned int *)this + 24);
  }
  else {
    uint64_t v1 = 0;
  }
  uint64_t v2 = *((void *)this + 5);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 12))
    {
      float v3 = *(float *)(v2 + 8);
      uint64_t v2 = LODWORD(v3);
      if (v3 == 0.0) {
        uint64_t v2 = 0;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  uint64_t v4 = *((void *)this + 11);
  if (v4)
  {
    if (*(unsigned char *)(v4 + 12)) {
      uint64_t v4 = *(unsigned int *)(v4 + 8);
    }
    else {
      uint64_t v4 = 0;
    }
  }
  uint64_t v5 = *((void *)this + 8);
  if (v5)
  {
    if (*(unsigned char *)(v5 + 12)) {
      uint64_t v5 = *(unsigned int *)(v5 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
  }
  uint64_t v6 = *((void *)this + 10);
  if (v6)
  {
    if (*(unsigned char *)(v6 + 12)) {
      uint64_t v6 = *(unsigned int *)(v6 + 8);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  uint64_t v7 = *((void *)this + 7);
  if (v7)
  {
    if (*(unsigned char *)(v7 + 12)) {
      uint64_t v7 = *(unsigned int *)(v7 + 8);
    }
    else {
      uint64_t v7 = 0;
    }
  }
  uint64_t v8 = *((void *)this + 4);
  if (v8)
  {
    if (*(unsigned char *)(v8 + 12)) {
      uint64_t v8 = *(unsigned int *)(v8 + 8);
    }
    else {
      uint64_t v8 = 0;
    }
  }
  uint64_t v9 = *((void *)this + 9);
  if (v9)
  {
    if (*(unsigned char *)(v9 + 12)) {
      uint64_t v9 = *(unsigned int *)(v9 + 8);
    }
    else {
      uint64_t v9 = 0;
    }
  }
  uint64_t v10 = *((void *)this + 6);
  if (v10)
  {
    if (*(unsigned char *)(v10 + 12)) {
      uint64_t v10 = *(unsigned int *)(v10 + 8);
    }
    else {
      uint64_t v10 = 0;
    }
  }
  return v2 ^ v1 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ PBHashBytes();
}

uint64_t sirinluexternal::MatchInfo::makeMatchScore(uint64_t this)
{
  if (!*(void *)(this + 40)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::makeMaxTokenCount(uint64_t this)
{
  if (!*(void *)(this + 88)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::makeMatchedTokenCount(uint64_t this)
{
  if (!*(void *)(this + 64)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::makeMaxStopWordCount(uint64_t this)
{
  if (!*(void *)(this + 80)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::makeMatchedStopWordCount(uint64_t this)
{
  if (!*(void *)(this + 56)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::makeEditDistance(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::makeMaxAliasCount(uint64_t this)
{
  if (!*(void *)(this + 72)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::makeMatchedAliasCount(uint64_t this)
{
  if (!*(void *)(this + 48)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::formatText(sirinluinternalitfm::ITFMParserResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 48);
  if ((v5 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "classification_label");
    char v5 = *((unsigned char *)this + 48);
  }
  if (v5) {
    PB::TextFormatter::format(a2, "classification_probability", *((float *)this + 10));
  }
  uint64_t v6 = (uint64_t *)*((void *)this + 1);
  uint64_t v7 = (uint64_t *)*((void *)this + 2);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "hypotheses");
  }
  uint64_t v9 = *((void *)this + 4);
  if (v9) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "parser");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 48);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2);
    char v4 = *(unsigned char *)(v3 + 48);
  }
  if (v4) {
    this = PB::Writer::write(a2, *(float *)(v3 + 40));
  }
  char v5 = *(const PB::Base **)(v3 + 32);
  if (v5) {
    this = PB::Writer::writeSubmessage(a2, v5);
  }
  uint64_t v7 = *(const PB::Base ***)(v3 + 8);
  uint64_t v6 = *(const PB::Base ***)(v3 + 16);
  while (v7 != v6)
  {
    uint64_t v8 = *v7++;
    this = PB::Writer::writeSubmessage(a2, v8);
  }
  return this;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::readFrom(sirinluinternalitfm::ITFMParserResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_21;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
LABEL_33:
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) != 4)
    {
      switch((v11 >> 3))
      {
        case 1u:
          *((unsigned char *)this + 48) |= 2u;
          unint64_t v20 = *((void *)a2 + 1);
          if (v20 >= *((void *)a2 + 2))
          {
            BOOL v23 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v21 = v20 + 1;
            int v22 = *(unsigned __int8 *)(*(void *)a2 + v20);
            *((void *)a2 + 1) = v21;
            BOOL v23 = v22 != 0;
          }
          *((unsigned char *)this + 44) = v23;
          goto LABEL_33;
        case 2u:
          *((unsigned char *)this + 48) |= 1u;
          unint64_t v24 = *((void *)a2 + 1);
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *((void *)a2 + 2))
          {
            *((_DWORD *)this + 10) = *(_DWORD *)(*(void *)a2 + v24);
            *((void *)a2 + 1) += 4;
          }
          else
          {
            *((unsigned char *)a2 + 24) = 1;
          }
          goto LABEL_33;
        case 3u:
          operator new();
        case 4u:
          operator new();
        default:
          goto LABEL_19;
      }
    }
    int v4 = 0;
  }
  return v4 == 0;
}

void sub_1C8BF43A0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this)
{
  sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_1F232EEB0;
  unint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((void *)this + 1))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 1);
    operator delete(*((void **)this + 1));
  }
  PB::Base::~Base(this);
}

double sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this)
{
  *(void *)this = &unk_1F232EEB0;
  *((_DWORD *)this + 12) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EEB0;
  *((_DWORD *)this + 12) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(uint64_t this, const sirinluinternalitfm::ITFMParserResponse *a2)
{
  *(void *)this = &unk_1F232EEB0;
  *(_OWORD *)(this + 8) = 0u;
  *(_DWORD *)(this + 48) = 0;
  *(_OWORD *)(this + 24) = 0u;
  if ((*((unsigned char *)a2 + 48) & 2) != 0)
  {
    char v3 = *((unsigned char *)a2 + 44);
    *(unsigned char *)(this + 48) = 2;
    *(unsigned char *)(this + 44) = v3;
    char v2 = 3;
    if ((*((unsigned char *)a2 + 48) & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v2 = 1;
  if (*((unsigned char *)a2 + 48))
  {
LABEL_5:
    int v4 = *((_DWORD *)a2 + 10);
    *(unsigned char *)(this + 48) = v2;
    *(_DWORD *)(this + 40) = v4;
  }
LABEL_6:
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    operator new();
  }
  return this;
}

void sub_1C8BF4718(void *a1)
{
}

uint64_t sirinluinternalitfm::ITFMParserResponse::operator=(uint64_t a1, const sirinluinternalitfm::ITFMParserResponse *a2)
{
  if ((const sirinluinternalitfm::ITFMParserResponse *)a1 != a2)
  {
    sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse((uint64_t)v8, a2);
    int v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(a1 + 48) = v13;
    int v13 = v3;
    LOBYTE(v3) = *(unsigned char *)(a1 + 44);
    *(unsigned char *)(a1 + 44) = v12;
    char v12 = v3;
    int v4 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = v11;
    int v11 = v4;
    long long v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v9 = v5;
    long long v10 = v6;
    sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse((sirinluinternalitfm::ITFMParserResponse *)v8);
  }
  return a1;
}

float sirinluinternalitfm::swap(sirinluinternalitfm *this, sirinluinternalitfm::ITFMParserResponse *a2, sirinluinternalitfm::ITFMParserResponse *a3)
{
  int v3 = *((_DWORD *)this + 12);
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v3;
  LOBYTE(v3) = *((unsigned char *)this + 44);
  *((unsigned char *)this + 44) = *((unsigned char *)a2 + 44);
  *((unsigned char *)a2 + 44) = v3;
  float result = *((float *)this + 10);
  *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
  *((float *)a2 + 10) = result;
  uint64_t v5 = *((void *)this + 4);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v5;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v6;
  uint64_t v7 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v7;
  uint64_t v8 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v8;
  return result;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EEB0;
  *(_OWORD *)(a1 + 8) = 0u;
  int v4 = (void **)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a2 + 48) = 0;
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  if (*v4)
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100](v4);
    operator delete(*v4);
    *int v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse((uint64_t)v8, a2);
    int v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(a1 + 48) = v13;
    int v13 = v3;
    LOBYTE(v3) = *(unsigned char *)(a1 + 44);
    *(unsigned char *)(a1 + 44) = v12;
    char v12 = v3;
    int v4 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = v11;
    int v11 = v4;
    long long v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v9 = v5;
    long long v10 = v6;
    sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse((sirinluinternalitfm::ITFMParserResponse *)v8);
  }
  return a1;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::operator==(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 48) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 48) & 2) == 0 || *(unsigned __int8 *)(a1 + 44) != *(unsigned __int8 *)(a2 + 44)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 48) & 2) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if ((*(unsigned char *)(a2 + 48) & 1) == 0 || *(float *)(a1 + 40) != *(float *)(a2 + 40)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 48))
  {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 32);
  if (v4)
  {
    if (!v5 || !sirinluexternal::Parser::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v9 = a2 + 8;
  uint64_t v8 = *(uint64_t **)(a2 + 8);
  if (v7 - v6 != *(void *)(v9 + 8) - (void)v8) {
    return 0;
  }
  if (v6 == v7) {
    return 1;
  }
  uint64_t v10 = v6 + 8;
  do
  {
    uint64_t v11 = *v8++;
    uint64_t result = sirinluinternalitfm::ITFMHypothesis::operator==(*(void *)(v10 - 8), v11);
    if (result) {
      BOOL v13 = v10 == v7;
    }
    else {
      BOOL v13 = 1;
    }
    v10 += 8;
  }
  while (!v13);
  return result;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::hash_value(sirinluinternalitfm::ITFMParserResponse *this)
{
  if ((*((unsigned char *)this + 48) & 2) == 0)
  {
    uint64_t v1 = 0;
    if (*((unsigned char *)this + 48)) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v3 = 0;
    goto LABEL_8;
  }
  uint64_t v1 = *((unsigned __int8 *)this + 44);
  if ((*((unsigned char *)this + 48) & 1) == 0) {
    goto LABEL_7;
  }
LABEL_3:
  float v2 = *((float *)this + 10);
  if (v2 == 0.0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = LODWORD(v2);
  }
LABEL_8:
  uint64_t v4 = *((void *)this + 4);
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_16;
  }
  if (*(unsigned char *)(v4 + 16))
  {
    uint64_t v5 = *(int *)(v4 + 8);
    if ((*(unsigned char *)(v4 + 16) & 2) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v6 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)(v4 + 16) & 2) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v6 = *(int *)(v4 + 12);
LABEL_15:
  uint64_t v7 = v6 ^ v5;
LABEL_16:
  uint64_t v8 = (sirinluinternalitfm::ITFMHypothesis **)*((void *)this + 1);
  uint64_t v9 = (sirinluinternalitfm::ITFMHypothesis **)*((void *)this + 2);
  if (v8 == v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = *v8++;
      v10 ^= sirinluinternalitfm::ITFMHypothesis::hash_value(v11);
    }
    while (v8 != v9);
  }
  return v3 ^ v1 ^ v7 ^ v10;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::makeParser(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new();
  }
  return this;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERTurnSummaryReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_23;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_23:
        unint64_t v20 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_38;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 16) = v23;
        goto LABEL_38;
      case 4u:
        uint64_t v27 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadata);
        objc_storeStrong((id *)(a1 + 24), v27);
        if (PBReaderPlaceMark()
          && SIRINLUEXTERNALNLU_ROUTERNLRoutingGenAIMetadataReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

uint64_t sirinluexternal::UserWantedToRepeat::formatText(sirinluexternal::UserWantedToRepeat *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "reference");
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "system_dialog_act_id");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::UserWantedToRepeat::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 8);
  if (v5)
  {
    return PB::Writer::writeSubmessage(a2, v5);
  }
  return this;
}

uint64_t sirinluexternal::UserWantedToRepeat::readFrom(sirinluexternal::UserWantedToRepeat *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat(sirinluexternal::UserWantedToRepeat *this)
{
  sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232EF00;
  unint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

void *sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232EF00;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232EF00;
  return this;
}

void *sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(void *this, const sirinluexternal::UserWantedToRepeat *a2)
{
  *this = &unk_1F232EF00;
  this[1] = 0;
  this[2] = 0;
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserWantedToRepeat::operator=(uint64_t a1, const sirinluexternal::UserWantedToRepeat *a2)
{
  if ((const sirinluexternal::UserWantedToRepeat *)a1 != a2)
  {
    sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat((sirinluexternal::UserWantedToRepeat *)&v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::UserWantedToRepeat *a2, sirinluexternal::UserWantedToRepeat *a3)
{
  uint64_t v3 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  return this;
}

void *sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(void *a1, uint64_t a2)
{
  a1[1] = 0;
  uint64_t v4 = a1 + 1;
  *a1 = &unk_1F232EF00;
  a1[2] = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = a1[2];
  a1[2] = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v8 = *v4;
  *uint64_t v4 = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  return a1;
}

uint64_t sirinluexternal::UserWantedToRepeat::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat((sirinluexternal::UserWantedToRepeat *)&v5);
  }
  return a1;
}

uint64_t sirinluexternal::UserWantedToRepeat::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (v5 && sirinluexternal::UUID::operator==(v4, v5)) {
      goto LABEL_4;
    }
    return 0;
  }
  if (v5) {
    return 0;
  }
LABEL_4:
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a2 + 8);
  uint64_t result = (v6 | v7) == 0;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unint64_t v10 = *(void **)(a1 + 8);
    return sirinluexternal::UsoGraph::operator==(v10, (void *)v7);
  }
  return result;
}

unint64_t sirinluexternal::UserWantedToRepeat::hash_value(sirinluexternal::UserWantedToRepeat *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (!v1)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v1 + 28) & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)(v1 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v1 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)(v1 + 8);
  if ((*(unsigned char *)(v1 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v3 = *(void *)(v1 + 16);
  if ((*(unsigned char *)(v1 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v4 = *(int *)(v1 + 24);
LABEL_10:
  uint64_t v5 = v3 ^ v2 ^ v4;
LABEL_11:
  unint64_t v6 = *((void *)this + 1);
  if (v6) {
    unint64_t v6 = sirinluexternal::UsoGraph::hash_value((sirinluexternal::UsoGraph *)v6);
  }
  return v6 ^ v5;
}

uint64_t sirinluexternal::UserWantedToRepeat::makeSystemDialogActId(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::UserWantedToRepeat::makeReference(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

BOOL SIRINLUEXTERNALNLUSupplementaryOutputReadFrom(id *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 3)
      {
        uint64_t v18 = objc_alloc_init(SIRINLUEXTERNALCorrectionOutcome);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALCorrectionOutcomeReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(SIRINLUEXTERNALSpan);
        [a1 addMatchingSpans:v18];
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALSpanReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(SIRINLUEXTERNALRewriteMessage);
    objc_storeStrong(a1 + 3, v18);
    if (!PBReaderPlaceMark() || (SIRINLUEXTERNALRewriteMessageReadFrom((uint64_t)v18, a2) & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sirinluinternal::Token::formatText(sirinluinternal::Token *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 92)) {
    PB::TextFormatter::format(a2, "begin");
  }
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  uint64_t v5 = *((void *)this + 2);
  for (uint64_t i = *((void *)this + 3); v5 != i; v5 += 24)
    PB::TextFormatter::format();
  char v7 = *((unsigned char *)this + 92);
  if ((v7 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "end");
    char v7 = *((unsigned char *)this + 92);
    if ((v7 & 0x10) == 0)
    {
LABEL_9:
      if ((v7 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)this + 92) & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PB::TextFormatter::format(a2, "is_significant");
  char v7 = *((unsigned char *)this + 92);
  if ((v7 & 0x20) == 0)
  {
LABEL_10:
    if ((v7 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PB::TextFormatter::format(a2, "is_whitespace");
  if ((*((unsigned char *)this + 92) & 4) != 0) {
LABEL_11:
  }
    PB::TextFormatter::format(a2, "non_whitespace_token_index");
LABEL_12:
  uint64_t v8 = *((void *)this + 5);
  for (uint64_t j = *((void *)this + 6); v8 != j; v8 += 24)
    PB::TextFormatter::format();
  if ((*((unsigned char *)this + 92) & 8) != 0) {
    PB::TextFormatter::format(a2, "token_index");
  }
  if (*((void *)this + 8)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::Token::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 64)) {
    this = PB::Writer::write();
  }
  char v4 = *(unsigned char *)(v3 + 92);
  if (v4)
  {
    this = PB::Writer::writeVarInt(a2);
    char v4 = *(unsigned char *)(v3 + 92);
    if ((v4 & 2) == 0)
    {
LABEL_5:
      if ((v4 & 0x10) == 0) {
        goto LABEL_6;
      }
LABEL_23:
      this = PB::Writer::write(a2);
      if ((*(unsigned char *)(v3 + 92) & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)(v3 + 92) & 2) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  char v4 = *(unsigned char *)(v3 + 92);
  if ((v4 & 0x10) != 0) {
    goto LABEL_23;
  }
LABEL_6:
  if ((v4 & 0x20) != 0) {
LABEL_7:
  }
    this = PB::Writer::write(a2);
LABEL_8:
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  while (v5 != v6)
  {
    this = PB::Writer::write();
    v5 += 24;
  }
  char v7 = *(unsigned char *)(v3 + 92);
  if ((v7 & 8) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v7 = *(unsigned char *)(v3 + 92);
  }
  if ((v7 & 4) != 0) {
    this = PB::Writer::writeVarInt(a2);
  }
  if (*(void *)(v3 + 8)) {
    this = PB::Writer::write();
  }
  uint64_t v9 = *(void *)(v3 + 40);
  uint64_t v8 = *(void *)(v3 + 48);
  while (v9 != v8)
  {
    this = PB::Writer::write();
    v9 += 24;
  }
  return this;
}

uint64_t sirinluinternal::Token::readFrom(sirinluinternal::Token *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  uint64_t v8 = (std::vector<std::string> *)((char *)this + 40);
  uint64_t v9 = (std::allocator<std::string> *)((char *)this + 56);
  unint64_t v10 = (std::vector<std::string> *)((char *)this + 16);
  uint64_t v11 = (std::allocator<std::string> *)((char *)this + 32);
  while (1)
  {
    uint64_t v12 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      unint64_t v16 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v17 = *(unsigned char *)(v12 + v2);
      v15 |= (unint64_t)(v17 & 0x7F) << v13;
      if ((v17 & 0x80) == 0) {
        break;
      }
      v13 += 7;
      unint64_t v2 = v16;
      BOOL v18 = v14++ > 8;
      if (v18) {
        goto LABEL_20;
      }
    }
LABEL_26:
    if ((v15 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v15 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        *((unsigned char *)this + 92) |= 1u;
        unint64_t v25 = *((void *)a2 + 1);
        unint64_t v26 = *((void *)a2 + 2);
        uint64_t v27 = *(void *)a2;
        if (v25 <= 0xFFFFFFFFFFFFFFF5 && v25 + 10 <= v26)
        {
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          do
          {
            unint64_t v31 = v25 + 1;
            *((void *)a2 + 1) = v25 + 1;
            char v32 = *(unsigned char *)(v27 + v25);
            v30 |= (unint64_t)(v32 & 0x7F) << v28;
            if ((v32 & 0x80) == 0) {
              goto LABEL_127;
            }
            v28 += 7;
            unint64_t v25 = v31;
            BOOL v18 = v29++ > 8;
          }
          while (!v18);
LABEL_72:
          LODWORD(v30) = 0;
          goto LABEL_127;
        }
        char v71 = 0;
        unsigned int v72 = 0;
        uint64_t v30 = 0;
        if (v26 <= v25) {
          unint64_t v26 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v26 == v25)
          {
            LODWORD(v30) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v73 = v25 + 1;
            char v74 = *(unsigned char *)(v27 + v25);
            *((void *)a2 + 1) = v73;
            v30 |= (unint64_t)(v74 & 0x7F) << v71;
            if (v74 < 0)
            {
              v71 += 7;
              unint64_t v25 = v73;
              BOOL v18 = v72++ > 8;
              if (v18) {
                goto LABEL_72;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v30) = 0;
            }
          }
          break;
        }
LABEL_127:
        *((_DWORD *)this + 18) = v30;
        goto LABEL_21;
      case 3u:
        *((unsigned char *)this + 92) |= 2u;
        unint64_t v33 = *((void *)a2 + 1);
        unint64_t v34 = *((void *)a2 + 2);
        uint64_t v35 = *(void *)a2;
        if (v33 <= 0xFFFFFFFFFFFFFFF5 && v33 + 10 <= v34)
        {
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          do
          {
            unint64_t v39 = v33 + 1;
            *((void *)a2 + 1) = v33 + 1;
            char v40 = *(unsigned char *)(v35 + v33);
            v38 |= (unint64_t)(v40 & 0x7F) << v36;
            if ((v40 & 0x80) == 0) {
              goto LABEL_130;
            }
            v36 += 7;
            unint64_t v33 = v39;
            BOOL v18 = v37++ > 8;
          }
          while (!v18);
LABEL_79:
          LODWORD(v38) = 0;
          goto LABEL_130;
        }
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v38 = 0;
        if (v34 <= v33) {
          unint64_t v34 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v34 == v33)
          {
            LODWORD(v38) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v77 = v33 + 1;
            char v78 = *(unsigned char *)(v35 + v33);
            *((void *)a2 + 1) = v77;
            v38 |= (unint64_t)(v78 & 0x7F) << v75;
            if (v78 < 0)
            {
              v75 += 7;
              unint64_t v33 = v77;
              BOOL v18 = v76++ > 8;
              if (v18) {
                goto LABEL_79;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v38) = 0;
            }
          }
          break;
        }
LABEL_130:
        *((_DWORD *)this + 19) = v38;
        goto LABEL_21;
      case 4u:
        *((unsigned char *)this + 92) |= 0x10u;
        unint64_t v41 = *((void *)a2 + 1);
        if (v41 >= *((void *)a2 + 2))
        {
          BOOL v44 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v42 = v41 + 1;
          int v43 = *(unsigned __int8 *)(*(void *)a2 + v41);
          *((void *)a2 + 1) = v42;
          BOOL v44 = v43 != 0;
        }
        *((unsigned char *)this + 88) = v44;
        goto LABEL_21;
      case 5u:
        *((unsigned char *)this + 92) |= 0x20u;
        unint64_t v45 = *((void *)a2 + 1);
        if (v45 >= *((void *)a2 + 2))
        {
          BOOL v48 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v46 = v45 + 1;
          int v47 = *(unsigned __int8 *)(*(void *)a2 + v45);
          *((void *)a2 + 1) = v46;
          BOOL v48 = v47 != 0;
        }
        *((unsigned char *)this + 89) = v48;
        goto LABEL_21;
      case 6u:
        uint64_t v50 = (char *)*((void *)this + 3);
        unint64_t v49 = *((void *)this + 4);
        if ((unint64_t)v50 >= v49)
        {
          unint64_t v79 = 0xAAAAAAAAAAAAAAABLL * ((v50 - (char *)v10->__begin_) >> 3);
          unint64_t v80 = v79 + 1;
          if (v79 + 1 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_141;
          }
          unint64_t v81 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v49 - (unint64_t)v10->__begin_) >> 3);
          if (2 * v81 > v80) {
            unint64_t v80 = 2 * v81;
          }
          if (v81 >= 0x555555555555555) {
            unint64_t v82 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v82 = v80;
          }
          __v.__end_cap_.__value_ = v11;
          if (v82) {
            unint64_t v82 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v82);
          }
          else {
            uint64_t v83 = 0;
          }
          char v97 = (std::string *)(v82 + 24 * v79);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v82;
          __v.__begin_ = v97;
          __v.__end_cap_.__value_ = (std::string *)(v82 + 24 * v83);
          v97->__r_.__value_.__r.__words[0] = 0;
          v97->__r_.__value_.__l.__size_ = 0;
          v97->__r_.__value_.__r.__words[2] = 0;
          __v.__end_ = v97 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(v10, &__v);
          unint64_t v51 = (void *)*((void *)this + 3);
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          *(void *)uint64_t v50 = 0;
          *((void *)v50 + 1) = 0;
          unint64_t v51 = v50 + 24;
          *((void *)v50 + 2) = 0;
        }
        *((void *)this + 3) = v51;
        break;
      case 7u:
        *((unsigned char *)this + 92) |= 8u;
        unint64_t v52 = *((void *)a2 + 1);
        unint64_t v53 = *((void *)a2 + 2);
        uint64_t v54 = *(void *)a2;
        if (v52 <= 0xFFFFFFFFFFFFFFF5 && v52 + 10 <= v53)
        {
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          do
          {
            unint64_t v58 = v52 + 1;
            *((void *)a2 + 1) = v52 + 1;
            char v59 = *(unsigned char *)(v54 + v52);
            v57 |= (unint64_t)(v59 & 0x7F) << v55;
            if ((v59 & 0x80) == 0) {
              goto LABEL_133;
            }
            v55 += 7;
            unint64_t v52 = v58;
            BOOL v18 = v56++ > 8;
          }
          while (!v18);
LABEL_98:
          LODWORD(v57) = 0;
          goto LABEL_133;
        }
        char v84 = 0;
        unsigned int v85 = 0;
        uint64_t v57 = 0;
        if (v53 <= v52) {
          unint64_t v53 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v53 == v52)
          {
            LODWORD(v57) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v86 = v52 + 1;
            char v87 = *(unsigned char *)(v54 + v52);
            *((void *)a2 + 1) = v86;
            v57 |= (unint64_t)(v87 & 0x7F) << v84;
            if (v87 < 0)
            {
              v84 += 7;
              unint64_t v52 = v86;
              BOOL v18 = v85++ > 8;
              if (v18) {
                goto LABEL_98;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v57) = 0;
            }
          }
          break;
        }
LABEL_133:
        *((_DWORD *)this + 21) = v57;
        goto LABEL_21;
      case 8u:
        *((unsigned char *)this + 92) |= 4u;
        unint64_t v60 = *((void *)a2 + 1);
        unint64_t v61 = *((void *)a2 + 2);
        uint64_t v62 = *(void *)a2;
        if (v60 <= 0xFFFFFFFFFFFFFFF5 && v60 + 10 <= v61)
        {
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v65 = 0;
          do
          {
            unint64_t v66 = v60 + 1;
            *((void *)a2 + 1) = v60 + 1;
            char v67 = *(unsigned char *)(v62 + v60);
            v65 |= (unint64_t)(v67 & 0x7F) << v63;
            if ((v67 & 0x80) == 0) {
              goto LABEL_136;
            }
            v63 += 7;
            unint64_t v60 = v66;
            BOOL v18 = v64++ > 8;
          }
          while (!v18);
LABEL_105:
          LODWORD(v65) = 0;
          goto LABEL_136;
        }
        char v88 = 0;
        unsigned int v89 = 0;
        uint64_t v65 = 0;
        if (v61 <= v60) {
          unint64_t v61 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v61 == v60)
          {
            LODWORD(v65) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v90 = v60 + 1;
            char v91 = *(unsigned char *)(v62 + v60);
            *((void *)a2 + 1) = v90;
            v65 |= (unint64_t)(v91 & 0x7F) << v88;
            if (v91 < 0)
            {
              v88 += 7;
              unint64_t v60 = v90;
              BOOL v18 = v89++ > 8;
              if (v18) {
                goto LABEL_105;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v65) = 0;
            }
          }
          break;
        }
LABEL_136:
        *((_DWORD *)this + 20) = v65;
        goto LABEL_21;
      case 9u:
        operator new();
      case 0xAu:
        char v69 = (char *)*((void *)this + 6);
        unint64_t v68 = *((void *)this + 7);
        if ((unint64_t)v69 >= v68)
        {
          unint64_t v92 = 0xAAAAAAAAAAAAAAABLL * ((v69 - (char *)v8->__begin_) >> 3);
          unint64_t v93 = v92 + 1;
          if (v92 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_141:
          }
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          unint64_t v94 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68 - (unint64_t)v8->__begin_) >> 3);
          if (2 * v94 > v93) {
            unint64_t v93 = 2 * v94;
          }
          if (v94 >= 0x555555555555555) {
            unint64_t v95 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v95 = v93;
          }
          __v.__end_cap_.__value_ = v9;
          if (v95) {
            unint64_t v95 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v95);
          }
          else {
            uint64_t v96 = 0;
          }
          unsigned int v98 = (std::string *)(v95 + 24 * v92);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v95;
          __v.__begin_ = v98;
          __v.__end_cap_.__value_ = (std::string *)(v95 + 24 * v96);
          v98->__r_.__value_.__r.__words[0] = 0;
          v98->__r_.__value_.__l.__size_ = 0;
          v98->__r_.__value_.__r.__words[2] = 0;
          __v.__end_ = v98 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(v8, &__v);
          unsigned int v70 = (void *)*((void *)this + 6);
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          *(void *)char v69 = 0;
          *((void *)v69 + 1) = 0;
          unsigned int v70 = v69 + 24;
          *((void *)v69 + 2) = 0;
        }
        *((void *)this + 6) = v70;
        break;
      default:
        goto LABEL_20;
    }
    PB::Reader::read();
LABEL_21:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v19 = 0;
  unsigned int v20 = 0;
  unint64_t v15 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v21 = v2 + 1;
    char v22 = *(unsigned char *)(v12 + v2);
    *((void *)a2 + 1) = v21;
    v15 |= (unint64_t)(v22 & 0x7F) << v19;
    if ((v22 & 0x80) == 0) {
      goto LABEL_26;
    }
    v19 += 7;
    unint64_t v2 = v21;
    BOOL v18 = v20++ > 8;
  }
  while (!v18);
LABEL_20:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_21;
  }
  return result;
}

void sirinluinternal::Token::~Token(sirinluinternal::Token *this)
{
  sirinluinternal::Token::~Token(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  void **v4;
  uint64_t vars8;

  *(void *)this = &unk_1F232EF50;
  unint64_t v2 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  int v4 = (void **)((char *)this + 40);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  int v4 = (void **)((char *)this + 16);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  }
  PB::Base::~Base(this);
}

double sirinluinternal::Token::Token(sirinluinternal::Token *this)
{
  *(void *)this = &unk_1F232EF50;
  *((_DWORD *)this + 23) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EF50;
  *((_DWORD *)this + 23) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

sirinluinternal::Token *sirinluinternal::Token::Token(sirinluinternal::Token *this, const sirinluinternal::Token *a2)
{
  *(void *)this = &unk_1F232EF50;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  int v4 = (std::vector<std::string> *)((char *)this + 40);
  *((_DWORD *)this + 23) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  if (*((void *)a2 + 8)) {
    operator new();
  }
  char v5 = *((unsigned char *)a2 + 92);
  if (v5)
  {
    int v10 = *((_DWORD *)a2 + 18);
    *((unsigned char *)this + 92) |= 1u;
    *((_DWORD *)this + 18) = v10;
    char v5 = *((unsigned char *)a2 + 92);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)a2 + 92) & 2) == 0)
  {
    goto LABEL_5;
  }
  int v11 = *((_DWORD *)a2 + 19);
  *((unsigned char *)this + 92) |= 2u;
  *((_DWORD *)this + 19) = v11;
  char v5 = *((unsigned char *)a2 + 92);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  char v12 = *((unsigned char *)a2 + 88);
  *((unsigned char *)this + 92) |= 0x10u;
  *((unsigned char *)this + 88) = v12;
  if ((*((unsigned char *)a2 + 92) & 0x20) != 0)
  {
LABEL_7:
    char v6 = *((unsigned char *)a2 + 89);
    *((unsigned char *)this + 92) |= 0x20u;
    *((unsigned char *)this + 89) = v6;
  }
LABEL_8:
  if (this != a2) {
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((std::vector<std::string> *)((char *)this + 16), *((std::string **)a2 + 2), *((long long **)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 3) - *((void *)a2 + 2)) >> 3));
  }
  char v7 = *((unsigned char *)a2 + 92);
  if ((v7 & 8) != 0)
  {
    int v8 = *((_DWORD *)a2 + 21);
    *((unsigned char *)this + 92) |= 8u;
    *((_DWORD *)this + 21) = v8;
    char v7 = *((unsigned char *)a2 + 92);
  }
  if ((v7 & 4) != 0)
  {
    int v9 = *((_DWORD *)a2 + 20);
    *((unsigned char *)this + 92) |= 4u;
    *((_DWORD *)this + 20) = v9;
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (this != a2) {
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(v4, *((std::string **)a2 + 5), *((long long **)a2 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 3));
  }
  return this;
}

uint64_t sirinluinternal::Token::operator=(uint64_t a1, const sirinluinternal::Token *a2)
{
  if ((const sirinluinternal::Token *)a1 != a2)
  {
    sirinluinternal::Token::Token((sirinluinternal::Token *)v5, a2);
    sirinluinternal::swap(a1, (sirinluinternal::Token *)v5, v3);
    sirinluinternal::Token::~Token((sirinluinternal::Token *)v5);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::Token *a2, sirinluinternal::Token *a3)
{
  int v3 = *(_DWORD *)(this + 92);
  *(_DWORD *)(this + 92) = *((_DWORD *)a2 + 23);
  *((_DWORD *)a2 + 23) = v3;
  uint64_t v4 = *(void *)(this + 64);
  *(void *)(this + 64) = *((void *)a2 + 8);
  *((void *)a2 + 8) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 72);
  *(_DWORD *)(this + 72) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 76);
  *(_DWORD *)(this + 76) = *((_DWORD *)a2 + 19);
  *((_DWORD *)a2 + 19) = v4;
  LOBYTE(v4) = *(unsigned char *)(this + 88);
  *(unsigned char *)(this + 88) = *((unsigned char *)a2 + 88);
  *((unsigned char *)a2 + 88) = v4;
  LOBYTE(v4) = *(unsigned char *)(this + 89);
  *(unsigned char *)(this + 89) = *((unsigned char *)a2 + 89);
  *((unsigned char *)a2 + 89) = v4;
  uint64_t v5 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v5;
  uint64_t v6 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  uint64_t v7 = *(void *)(this + 32);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v7;
  LODWORD(v7) = *(_DWORD *)(this + 84);
  *(_DWORD *)(this + 84) = *((_DWORD *)a2 + 21);
  *((_DWORD *)a2 + 21) = v7;
  LODWORD(v7) = *(_DWORD *)(this + 80);
  *(_DWORD *)(this + 80) = *((_DWORD *)a2 + 20);
  *((_DWORD *)a2 + 20) = v7;
  uint64_t v8 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v8;
  uint64_t v9 = *(void *)(this + 40);
  *(void *)(this + 40) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v9;
  uint64_t v10 = *(void *)(this + 48);
  *(void *)(this + 48) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v10;
  uint64_t v11 = *(void *)(this + 56);
  *(void *)(this + 56) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v11;
  return this;
}

uint64_t sirinluinternal::Token::Token(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EF50;
  uint64_t v4 = (std::vector<std::string> *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a2 + 92) = 0;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  uint64_t v6 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v5;
  if (v6) {
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  }
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  std::vector<std::string>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a2 + 24) = 0u;
  int v7 = *(_DWORD *)(a2 + 84);
  uint64_t v8 = *(void *)(a2 + 8);
  *(_OWORD *)(a2 + 8) = 0u;
  *(_DWORD *)(a1 + 84) = v7;
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  uint64_t v9 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v8;
  if (v9) {
    std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return a1;
}

uint64_t sirinluinternal::Token::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::Token::Token((uint64_t)v5, a2);
    sirinluinternal::swap(a1, (sirinluinternal::Token *)v5, v3);
    sirinluinternal::Token::~Token((sirinluinternal::Token *)v5);
  }
  return a1;
}

BOOL sirinluinternal::Token::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 **)(a1 + 64);
  uint64_t v5 = *(unsigned __int8 ***)(a2 + 64);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      int v7 = (unsigned __int8 *)v4[23];
    }
    else {
      int v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      uint64_t v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      uint64_t v10 = *(unsigned __int8 **)(a2 + 64);
    }
    else {
      uint64_t v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_18;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  char v11 = *(unsigned char *)(a1 + 92);
  char v12 = *(unsigned char *)(a2 + 92);
  if (v11)
  {
    if ((*(unsigned char *)(a2 + 92) & 1) == 0 || *(_DWORD *)(a1 + 72) != *(_DWORD *)(a2 + 72)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 92))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 92) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 92) & 2) == 0 || *(_DWORD *)(a1 + 76) != *(_DWORD *)(a2 + 76)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 92) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 92) & 0x10) != 0)
  {
    if ((*(unsigned char *)(a2 + 92) & 0x10) == 0 || *(unsigned __int8 *)(a1 + 88) != *(unsigned __int8 *)(a2 + 88)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 92) & 0x10) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 92) & 0x20) != 0)
  {
    if ((*(unsigned char *)(a2 + 92) & 0x20) == 0 || *(unsigned __int8 *)(a1 + 89) != *(unsigned __int8 *)(a2 + 89)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 92) & 0x20) != 0)
  {
    return 0;
  }
  if (!std::operator==[abi:ne180100]<std::string,std::allocator<std::string>>(*(unsigned __int8 **)(a1 + 16), *(unsigned __int8 **)(a1 + 24), *(unsigned __int8 **)(a2 + 16), *(void *)(a2 + 24)))return 0; {
  if ((v11 & 8) != 0)
  }
  {
    if ((v12 & 8) == 0 || *(_DWORD *)(a1 + 84) != *(_DWORD *)(a2 + 84)) {
      return 0;
    }
  }
  else if ((v12 & 8) != 0)
  {
    return 0;
  }
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || *(_DWORD *)(a1 + 80) != *(_DWORD *)(a2 + 80)) {
      return 0;
    }
  }
  else if ((v12 & 4) != 0)
  {
    return 0;
  }
  char v13 = *(unsigned __int8 **)(a1 + 8);
  unsigned int v14 = *(unsigned __int8 **)(a2 + 8);
  if (!v13)
  {
    if (!v14) {
      goto LABEL_54;
    }
    return 0;
  }
  if (!v14 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v13, v14)) {
    return 0;
  }
LABEL_54:
  unint64_t v15 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v16 = *(unsigned __int8 **)(a1 + 48);
  char v17 = *(unsigned __int8 **)(a2 + 40);
  uint64_t v18 = *(void *)(a2 + 48);
  return std::operator==[abi:ne180100]<std::string,std::allocator<std::string>>(v15, v16, v17, v18);
}

unint64_t sirinluinternal::Token::hash_value(sirinluinternal::Token *this)
{
  uint64_t v2 = *((void *)this + 8);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  char v4 = *((unsigned char *)this + 92);
  if (v4)
  {
    uint64_t v19 = *((int *)this + 18);
    if ((*((unsigned char *)this + 92) & 2) != 0)
    {
LABEL_6:
      uint64_t v18 = *((int *)this + 19);
      if ((*((unsigned char *)this + 92) & 0x10) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v5 = 0;
      if ((*((unsigned char *)this + 92) & 0x20) != 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*((unsigned char *)this + 92) & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v18 = 0;
  if ((*((unsigned char *)this + 92) & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v5 = *((unsigned __int8 *)this + 88);
  if ((*((unsigned char *)this + 92) & 0x20) != 0)
  {
LABEL_8:
    uint64_t v6 = *((unsigned __int8 *)this + 89);
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
LABEL_13:
  uint64_t v8 = *((void *)this + 2);
  uint64_t v7 = *((void *)this + 3);
  if (v8 == v7)
  {
    uint64_t v9 = 0;
    if ((*((unsigned char *)this + 92) & 8) == 0) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v10 = *((int *)this + 21);
    if ((v4 & 4) != 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  uint64_t v9 = 0;
  do
  {
    v9 ^= std::__string_hash<char>::operator()[abi:ne180100](v8);
    v8 += 24;
  }
  while (v8 != v7);
  if ((v4 & 8) != 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v10 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_18:
    uint64_t v11 = *((int *)this + 20);
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v11 = 0;
LABEL_22:
  uint64_t v12 = *((void *)this + 1);
  if (v12) {
    unint64_t v13 = std::__string_hash<char>::operator()[abi:ne180100](v12);
  }
  else {
    unint64_t v13 = 0;
  }
  uint64_t v14 = *((void *)this + 5);
  uint64_t v15 = *((void *)this + 6);
  if (v14 == v15)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      v16 ^= std::__string_hash<char>::operator()[abi:ne180100](v14);
      v14 += 24;
    }
    while (v14 != v15);
  }
  return v19 ^ v3 ^ v18 ^ v5 ^ v6 ^ v9 ^ v10 ^ v11 ^ v13 ^ v16;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::formatText(sirinluinternalcontextupdate::ReformedTurnInputBundle *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "current_turn");
  }
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  uint64_t v7 = (uint64_t *)*((void *)this + 3);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "previous_turns");
  }
  if (*((unsigned char *)this + 44)) {
    PB::TextFormatter::format(a2, "type");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::writeTo(uint64_t this, PB::Writer *a2)
{
  unint64_t v3 = (void *)this;
  if (*(unsigned char *)(this + 44)) {
    this = PB::Writer::writeVarInt(a2);
  }
  char v4 = (const PB::Base *)v3[1];
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v6 = (const PB::Base **)v3[2];
  uint64_t v5 = (const PB::Base **)v3[3];
  while (v6 != v5)
  {
    uint64_t v7 = *v6++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::readFrom(sirinluinternalcontextupdate::ReformedTurnInputBundle *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_31;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v19 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<>();
      }
      if (v19 == 2) {
        operator new();
      }
      if (v19 == 1)
      {
        *((unsigned char *)this + 44) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        uint64_t v22 = *(void *)a2;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v21)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v25 = 0;
          if (v21 <= v20) {
            unint64_t v21 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v21 == v20)
            {
              LODWORD(v25) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_45;
            }
            unint64_t v31 = v20 + 1;
            char v32 = *(unsigned char *)(v22 + v20);
            *((void *)a2 + 1) = v31;
            v25 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v20 = v31;
            BOOL v14 = v30++ > 8;
            if (v14)
            {
LABEL_41:
              LODWORD(v25) = 0;
              goto LABEL_45;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v25) = 0;
          }
        }
        else
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (1)
          {
            unint64_t v26 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              break;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
            if (v14) {
              goto LABEL_41;
            }
          }
        }
LABEL_45:
        *((_DWORD *)this + 10) = v25;
      }
      else
      {
LABEL_31:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_31;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle(sirinluinternalcontextupdate::ReformedTurnInputBundle *this)
{
  sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  void **v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232EFA0;
  unint64_t v3 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v3);
  unint64_t v2 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  PB::Base::~Base(this);
}

double sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle(sirinluinternalcontextupdate::ReformedTurnInputBundle *this)
{
  *(void *)this = &unk_1F232EFA0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232EFA0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  return result;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle(uint64_t this, const sirinluinternalcontextupdate::ReformedTurnInputBundle *a2)
{
  *(void *)this = &unk_1F232EFA0;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(void *)(this + 40) = 0;
  if (*((unsigned char *)a2 + 44))
  {
    int v2 = *((_DWORD *)a2 + 10);
    *(unsigned char *)(this + 44) = 1;
    *(_DWORD *)(this + 40) = v2;
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 2) != *((void *)a2 + 3)) {
    PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<sirinluexternal::TurnInput const&>();
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::operator=(uint64_t a1, const sirinluinternalcontextupdate::ReformedTurnInputBundle *a2)
{
  if ((const sirinluinternalcontextupdate::ReformedTurnInputBundle *)a1 != a2)
  {
    sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle((uint64_t)&v7, a2);
    uint64_t v3 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v10;
    uint64_t v10 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v8;
    long long v8 = v4;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v9;
    long long v9 = v5;
    sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle((sirinluinternalcontextupdate::ReformedTurnInputBundle *)&v7);
  }
  return a1;
}

uint64_t sirinluinternalcontextupdate::swap(uint64_t this, sirinluinternalcontextupdate::ReformedTurnInputBundle *a2, sirinluinternalcontextupdate::ReformedTurnInputBundle *a3)
{
  int v3 = *(_DWORD *)(this + 44);
  *(_DWORD *)(this + 44) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v3;
  int v4 = *(_DWORD *)(this + 40);
  *(_DWORD *)(this + 40) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  uint64_t v6 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v6;
  uint64_t v7 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v7;
  uint64_t v8 = *(void *)(this + 32);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v8;
  return this;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EFA0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((void **)(a1 + 16));
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  return a1;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle((uint64_t)&v7, a2);
    uint64_t v3 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v10;
    uint64_t v10 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v8;
    long long v8 = v4;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v9;
    long long v9 = v5;
    sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle((sirinluinternalcontextupdate::ReformedTurnInputBundle *)&v7);
  }
  return a1;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 44))
  {
    if ((*(unsigned char *)(a2 + 44) & 1) == 0 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 44))
  {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || (sirinluexternal::TurnInput::operator==(v4, v5) & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = *(uint64_t **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  return PB::PtrVector<sirinluexternal::TurnInput>::operator==((uint64_t *)(a1 + 16), v6, v7);
}

unint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::hash_value(sirinluinternalcontextupdate::ReformedTurnInputBundle *this)
{
  if (*((unsigned char *)this + 44)) {
    uint64_t v2 = *((int *)this + 10);
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = (sirinluexternal::TurnInput *)*((void *)this + 1);
  if (v3) {
    unint64_t v4 = sirinluexternal::TurnInput::hash_value(v3);
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v6 = (sirinluexternal::TurnInput **)*((void *)this + 2);
  uint64_t v5 = (sirinluexternal::TurnInput **)*((void *)this + 3);
  if (v6 == v5)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    do
    {
      long long v8 = *v6++;
      v7 ^= sirinluexternal::TurnInput::hash_value(v8);
    }
    while (v6 != v5);
  }
  return v4 ^ v2 ^ v7;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::makeCurrentTurn(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::AsrTokenInformation::formatText(sirinluexternal::AsrTokenInformation *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 60);
  if ((v5 & 0x20) != 0)
  {
    PB::TextFormatter::format(a2, "add_space_after");
    char v5 = *((unsigned char *)this + 60);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)this + 60) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "begin_index");
  char v5 = *((unsigned char *)this + 60);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  PB::TextFormatter::format(a2, "confidence_score", *((double *)this + 1));
  char v5 = *((unsigned char *)this + 60);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_23:
  PB::TextFormatter::format(a2, "end_index");
  if ((*((unsigned char *)this + 60) & 8) != 0) {
LABEL_6:
  }
    PB::TextFormatter::format(a2, "end_milli_seconds");
LABEL_7:
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  if (*((void *)this + 3)) {
    PB::TextFormatter::format();
  }
  if (*((void *)this + 4)) {
    PB::TextFormatter::format();
  }
  char v6 = *((unsigned char *)this + 60);
  if ((v6 & 0x40) != 0)
  {
    PB::TextFormatter::format(a2, "remove_space_after");
    char v6 = *((unsigned char *)this + 60);
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)this + 60) & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PB::TextFormatter::format(a2, "remove_space_before");
  if ((*((unsigned char *)this + 60) & 0x10) != 0) {
LABEL_16:
  }
    PB::TextFormatter::format(a2, "start_milli_seconds");
LABEL_17:
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::AsrTokenInformation::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 32)) {
    this = PB::Writer::write();
  }
  if (*(void *)(v3 + 24)) {
    this = PB::Writer::write();
  }
  if (*(void *)(v3 + 16)) {
    this = PB::Writer::write();
  }
  char v4 = *(unsigned char *)(v3 + 60);
  if ((v4 & 0x20) != 0)
  {
    this = PB::Writer::write(a2);
    char v4 = *(unsigned char *)(v3 + 60);
    if ((v4 & 0x40) == 0)
    {
LABEL_9:
      if ((v4 & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)(v3 + 60) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  this = PB::Writer::write(a2);
  char v4 = *(unsigned char *)(v3 + 60);
  if ((v4 & 0x80) == 0)
  {
LABEL_10:
    if ((v4 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  this = PB::Writer::write(a2);
  char v4 = *(unsigned char *)(v3 + 60);
  if ((v4 & 1) == 0)
  {
LABEL_11:
    if ((v4 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  this = PB::Writer::write(a2, *(double *)(v3 + 8));
  char v4 = *(unsigned char *)(v3 + 60);
  if ((v4 & 2) == 0)
  {
LABEL_12:
    if ((v4 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  this = PB::Writer::writeVarInt(a2);
  char v4 = *(unsigned char *)(v3 + 60);
  if ((v4 & 4) == 0)
  {
LABEL_13:
    if ((v4 & 0x10) == 0) {
      goto LABEL_14;
    }
LABEL_22:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 60) & 8) == 0) {
      return this;
    }
    goto LABEL_23;
  }
LABEL_21:
  this = PB::Writer::writeVarInt(a2);
  char v4 = *(unsigned char *)(v3 + 60);
  if ((v4 & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_14:
  if ((v4 & 8) == 0) {
    return this;
  }
LABEL_23:
  return PB::Writer::writeVarInt(a2);
}

uint64_t sirinluexternal::AsrTokenInformation::readFrom(sirinluexternal::AsrTokenInformation *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v11 = 0;
      if (v2 > v3) {
        unint64_t v3 = v2;
      }
      do
      {
        if (v3 == v2)
        {
          int v4 = 1;
          *((unsigned char *)a2 + 24) = 1;
          return v4 == 0;
        }
        unint64_t v17 = v2 + 1;
        char v18 = *(unsigned char *)(v8 + v2);
        *((void *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0) {
          goto LABEL_25;
        }
        v15 += 7;
        unint64_t v2 = v17;
        BOOL v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      goto LABEL_20;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_25:
    if ((v11 & 7) == 4) {
      break;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        operator new();
      case 3u:
        operator new();
      case 4u:
        *((unsigned char *)this + 60) |= 0x20u;
        unint64_t v21 = *((void *)a2 + 1);
        if (v21 >= *((void *)a2 + 2))
        {
          BOOL v24 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v22 = v21 + 1;
          int v23 = *(unsigned __int8 *)(*(void *)a2 + v21);
          *((void *)a2 + 1) = v22;
          BOOL v24 = v23 != 0;
        }
        *((unsigned char *)this + 56) = v24;
        goto LABEL_20;
      case 5u:
        *((unsigned char *)this + 60) |= 0x40u;
        unint64_t v25 = *((void *)a2 + 1);
        if (v25 >= *((void *)a2 + 2))
        {
          BOOL v28 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v26 = v25 + 1;
          int v27 = *(unsigned __int8 *)(*(void *)a2 + v25);
          *((void *)a2 + 1) = v26;
          BOOL v28 = v27 != 0;
        }
        *((unsigned char *)this + 57) = v28;
        goto LABEL_20;
      case 6u:
        *((unsigned char *)this + 60) |= 0x80u;
        unint64_t v29 = *((void *)a2 + 1);
        if (v29 >= *((void *)a2 + 2))
        {
          BOOL v32 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v30 = v29 + 1;
          int v31 = *(unsigned __int8 *)(*(void *)a2 + v29);
          *((void *)a2 + 1) = v30;
          BOOL v32 = v31 != 0;
        }
        *((unsigned char *)this + 58) = v32;
        goto LABEL_20;
      case 7u:
        *((unsigned char *)this + 60) |= 1u;
        unint64_t v33 = *((void *)a2 + 1);
        if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 1) = *(void *)(*(void *)a2 + v33);
          *((void *)a2 + 1) += 8;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
        goto LABEL_20;
      case 8u:
        *((unsigned char *)this + 60) |= 2u;
        unint64_t v34 = *((void *)a2 + 1);
        unint64_t v35 = *((void *)a2 + 2);
        uint64_t v36 = *(void *)a2;
        if (v34 <= 0xFFFFFFFFFFFFFFF5 && v34 + 10 <= v35)
        {
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          do
          {
            unint64_t v40 = v34 + 1;
            *((void *)a2 + 1) = v34 + 1;
            char v41 = *(unsigned char *)(v36 + v34);
            v39 |= (unint64_t)(v41 & 0x7F) << v37;
            if ((v41 & 0x80) == 0) {
              goto LABEL_105;
            }
            v37 += 7;
            unint64_t v34 = v40;
            BOOL v14 = v38++ > 8;
          }
          while (!v14);
LABEL_79:
          LODWORD(v39) = 0;
          goto LABEL_105;
        }
        char v66 = 0;
        unsigned int v67 = 0;
        uint64_t v39 = 0;
        if (v35 <= v34) {
          unint64_t v35 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v35 == v34)
          {
            LODWORD(v39) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v68 = v34 + 1;
            char v69 = *(unsigned char *)(v36 + v34);
            *((void *)a2 + 1) = v68;
            v39 |= (unint64_t)(v69 & 0x7F) << v66;
            if (v69 < 0)
            {
              v66 += 7;
              unint64_t v34 = v68;
              BOOL v14 = v67++ > 8;
              if (v14) {
                goto LABEL_79;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v39) = 0;
            }
          }
          break;
        }
LABEL_105:
        *((_DWORD *)this + 10) = v39;
        goto LABEL_20;
      case 9u:
        *((unsigned char *)this + 60) |= 4u;
        unint64_t v42 = *((void *)a2 + 1);
        unint64_t v43 = *((void *)a2 + 2);
        uint64_t v44 = *(void *)a2;
        if (v42 <= 0xFFFFFFFFFFFFFFF5 && v42 + 10 <= v43)
        {
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          do
          {
            unint64_t v48 = v42 + 1;
            *((void *)a2 + 1) = v42 + 1;
            char v49 = *(unsigned char *)(v44 + v42);
            v47 |= (unint64_t)(v49 & 0x7F) << v45;
            if ((v49 & 0x80) == 0) {
              goto LABEL_109;
            }
            v45 += 7;
            unint64_t v42 = v48;
            BOOL v14 = v46++ > 8;
          }
          while (!v14);
LABEL_86:
          LODWORD(v47) = 0;
          goto LABEL_109;
        }
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v47 = 0;
        if (v43 <= v42) {
          unint64_t v43 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v43 == v42)
          {
            LODWORD(v47) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v72 = v42 + 1;
            char v73 = *(unsigned char *)(v44 + v42);
            *((void *)a2 + 1) = v72;
            v47 |= (unint64_t)(v73 & 0x7F) << v70;
            if (v73 < 0)
            {
              v70 += 7;
              unint64_t v42 = v72;
              BOOL v14 = v71++ > 8;
              if (v14) {
                goto LABEL_86;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v47) = 0;
            }
          }
          break;
        }
LABEL_109:
        *((_DWORD *)this + 11) = v47;
        goto LABEL_20;
      case 0xAu:
        *((unsigned char *)this + 60) |= 0x10u;
        unint64_t v50 = *((void *)a2 + 1);
        unint64_t v51 = *((void *)a2 + 2);
        uint64_t v52 = *(void *)a2;
        if (v50 <= 0xFFFFFFFFFFFFFFF5 && v50 + 10 <= v51)
        {
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          do
          {
            unint64_t v56 = v50 + 1;
            *((void *)a2 + 1) = v50 + 1;
            char v57 = *(unsigned char *)(v52 + v50);
            v55 |= (unint64_t)(v57 & 0x7F) << v53;
            if ((v57 & 0x80) == 0) {
              goto LABEL_113;
            }
            v53 += 7;
            unint64_t v50 = v56;
            BOOL v14 = v54++ > 8;
          }
          while (!v14);
LABEL_93:
          LODWORD(v55) = 0;
          goto LABEL_113;
        }
        char v74 = 0;
        unsigned int v75 = 0;
        uint64_t v55 = 0;
        if (v51 <= v50) {
          unint64_t v51 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v51 == v50)
          {
            LODWORD(v55) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v76 = v50 + 1;
            char v77 = *(unsigned char *)(v52 + v50);
            *((void *)a2 + 1) = v76;
            v55 |= (unint64_t)(v77 & 0x7F) << v74;
            if (v77 < 0)
            {
              v74 += 7;
              unint64_t v50 = v76;
              BOOL v14 = v75++ > 8;
              if (v14) {
                goto LABEL_93;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v55) = 0;
            }
          }
          break;
        }
LABEL_113:
        *((_DWORD *)this + 13) = v55;
        goto LABEL_20;
      case 0xBu:
        *((unsigned char *)this + 60) |= 8u;
        unint64_t v58 = *((void *)a2 + 1);
        unint64_t v59 = *((void *)a2 + 2);
        uint64_t v60 = *(void *)a2;
        if (v58 <= 0xFFFFFFFFFFFFFFF5 && v58 + 10 <= v59)
        {
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          do
          {
            unint64_t v64 = v58 + 1;
            *((void *)a2 + 1) = v58 + 1;
            char v65 = *(unsigned char *)(v60 + v58);
            v63 |= (unint64_t)(v65 & 0x7F) << v61;
            if ((v65 & 0x80) == 0) {
              goto LABEL_117;
            }
            v61 += 7;
            unint64_t v58 = v64;
            BOOL v14 = v62++ > 8;
          }
          while (!v14);
LABEL_100:
          LODWORD(v63) = 0;
          goto LABEL_117;
        }
        char v78 = 0;
        unsigned int v79 = 0;
        uint64_t v63 = 0;
        if (v59 <= v58) {
          unint64_t v59 = *((void *)a2 + 1);
        }
        break;
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v59 == v58)
      {
        LODWORD(v63) = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_117;
      }
      unint64_t v80 = v58 + 1;
      char v81 = *(unsigned char *)(v60 + v58);
      *((void *)a2 + 1) = v80;
      v63 |= (unint64_t)(v81 & 0x7F) << v78;
      if ((v81 & 0x80) == 0) {
        break;
      }
      v78 += 7;
      unint64_t v58 = v80;
      BOOL v14 = v79++ > 8;
      if (v14) {
        goto LABEL_100;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      LODWORD(v63) = 0;
    }
LABEL_117:
    *((_DWORD *)this + 12) = v63;
LABEL_20:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  int v4 = 0;
  return v4 == 0;
}

void sirinluexternal::AsrTokenInformation::~AsrTokenInformation(sirinluexternal::AsrTokenInformation *this)
{
  sirinluexternal::AsrTokenInformation::~AsrTokenInformation(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  *(void *)this = &unk_1F232EFF0;
  unint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  unint64_t v3 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  }
  int v4 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    std::default_delete<std::string>::operator()[abi:ne180100](v4);
  }
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::AsrTokenInformation::AsrTokenInformation(uint64_t this)
{
  *(void *)this = &unk_1F232EFF0;
  *(_DWORD *)(this + 60) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = &unk_1F232EFF0;
  *(_DWORD *)(this + 60) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 16) = 0;
  return this;
}

uint64_t sirinluexternal::AsrTokenInformation::AsrTokenInformation(uint64_t this, const sirinluexternal::AsrTokenInformation *a2)
{
  *(void *)this = &unk_1F232EFF0;
  *(void *)(this + 16) = 0;
  *(_DWORD *)(this + 60) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 3)) {
    operator new();
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  char v2 = *((unsigned char *)a2 + 60);
  if ((v2 & 0x20) != 0)
  {
    char v4 = *((unsigned char *)a2 + 56);
    *(unsigned char *)(this + 60) |= 0x20u;
    *(unsigned char *)(this + 56) = v4;
    char v2 = *((unsigned char *)a2 + 60);
    if ((v2 & 0x40) == 0)
    {
LABEL_9:
      if ((v2 & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)a2 + 60) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  char v5 = *((unsigned char *)a2 + 57);
  *(unsigned char *)(this + 60) |= 0x40u;
  *(unsigned char *)(this + 57) = v5;
  char v2 = *((unsigned char *)a2 + 60);
  if ((v2 & 0x80) == 0)
  {
LABEL_10:
    if ((v2 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  char v6 = *((unsigned char *)a2 + 58);
  *(unsigned char *)(this + 60) |= 0x80u;
  *(unsigned char *)(this + 58) = v6;
  char v2 = *((unsigned char *)a2 + 60);
  if ((v2 & 1) == 0)
  {
LABEL_11:
    if ((v2 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v7 = *((void *)a2 + 1);
  *(unsigned char *)(this + 60) |= 1u;
  *(void *)(this + 8) = v7;
  char v2 = *((unsigned char *)a2 + 60);
  if ((v2 & 2) == 0)
  {
LABEL_12:
    if ((v2 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  int v8 = *((_DWORD *)a2 + 10);
  *(unsigned char *)(this + 60) |= 2u;
  *(_DWORD *)(this + 40) = v8;
  char v2 = *((unsigned char *)a2 + 60);
  if ((v2 & 4) == 0)
  {
LABEL_13:
    if ((v2 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  int v9 = *((_DWORD *)a2 + 11);
  *(unsigned char *)(this + 60) |= 4u;
  *(_DWORD *)(this + 44) = v9;
  char v2 = *((unsigned char *)a2 + 60);
  if ((v2 & 0x10) == 0)
  {
LABEL_14:
    if ((v2 & 8) == 0) {
      return this;
    }
    goto LABEL_15;
  }
LABEL_23:
  int v10 = *((_DWORD *)a2 + 13);
  *(unsigned char *)(this + 60) |= 0x10u;
  *(_DWORD *)(this + 52) = v10;
  if ((*((unsigned char *)a2 + 60) & 8) == 0) {
    return this;
  }
LABEL_15:
  int v3 = *((_DWORD *)a2 + 12);
  *(unsigned char *)(this + 60) |= 8u;
  *(_DWORD *)(this + 48) = v3;
  return this;
}

sirinluexternal *sirinluexternal::AsrTokenInformation::operator=(sirinluexternal *a1, const sirinluexternal::AsrTokenInformation *a2)
{
  if (a1 != a2)
  {
    sirinluexternal::AsrTokenInformation::AsrTokenInformation((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::AsrTokenInformation *)v5, v3);
    sirinluexternal::AsrTokenInformation::~AsrTokenInformation((sirinluexternal::AsrTokenInformation *)v5);
  }
  return a1;
}

double sirinluexternal::swap(sirinluexternal *this, sirinluexternal::AsrTokenInformation *a2, sirinluexternal::AsrTokenInformation *a3)
{
  int v3 = *((_DWORD *)this + 15);
  *((_DWORD *)this + 15) = *((_DWORD *)a2 + 15);
  *((_DWORD *)a2 + 15) = v3;
  uint64_t v4 = *((void *)this + 4);
  *((void *)this + 4) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v4;
  uint64_t v5 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v5;
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v6;
  LOBYTE(v6) = *((unsigned char *)this + 56);
  *((unsigned char *)this + 56) = *((unsigned char *)a2 + 56);
  *((unsigned char *)a2 + 56) = v6;
  LOBYTE(v6) = *((unsigned char *)this + 57);
  *((unsigned char *)this + 57) = *((unsigned char *)a2 + 57);
  *((unsigned char *)a2 + 57) = v6;
  LOBYTE(v6) = *((unsigned char *)this + 58);
  *((unsigned char *)this + 58) = *((unsigned char *)a2 + 58);
  *((unsigned char *)a2 + 58) = v6;
  double result = *((double *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((double *)a2 + 1) = result;
  LODWORD(v6) = *((_DWORD *)this + 10);
  *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v6;
  LODWORD(v6) = *((_DWORD *)this + 11);
  *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v6;
  LODWORD(v6) = *((_DWORD *)this + 13);
  *((_DWORD *)this + 13) = *((_DWORD *)a2 + 13);
  *((_DWORD *)a2 + 13) = v6;
  LODWORD(v6) = *((_DWORD *)this + 12);
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v6;
  return result;
}

uint64_t sirinluexternal::AsrTokenInformation::AsrTokenInformation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232EFF0;
  *(void *)(a1 + 16) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 16);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a2 + 60) = 0;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v5;
  if (v6) {
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  }
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  uint64_t v8 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  if (v8) {
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  }
  uint64_t v9 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v10 = *v4;
  *uint64_t v4 = v9;
  if (v10) {
    std::default_delete<std::string>::operator()[abi:ne180100](v10);
  }
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  return a1;
}

sirinluexternal *sirinluexternal::AsrTokenInformation::operator=(sirinluexternal *a1, uint64_t a2)
{
  if (a1 != (sirinluexternal *)a2)
  {
    sirinluexternal::AsrTokenInformation::AsrTokenInformation((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::AsrTokenInformation *)v5, v3);
    sirinluexternal::AsrTokenInformation::~AsrTokenInformation((sirinluexternal::AsrTokenInformation *)v5);
  }
  return a1;
}

BOOL sirinluexternal::AsrTokenInformation::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 ***)(a2 + 32);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      uint64_t v7 = (unsigned __int8 *)v4[23];
    }
    else {
      uint64_t v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      uint64_t v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      uint64_t v10 = *(unsigned __int8 **)(a2 + 32);
    }
    else {
      uint64_t v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_18;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  unint64_t v11 = *(unsigned __int8 **)(a1 + 24);
  unint64_t v12 = *(unsigned __int8 ***)(a2 + 24);
  if (v11)
  {
    if (!v12) {
      return 0;
    }
    uint64_t v13 = v11[23];
    if ((v13 & 0x80u) == 0) {
      BOOL v14 = (unsigned __int8 *)v11[23];
    }
    else {
      BOOL v14 = (unsigned __int8 *)*((void *)v11 + 1);
    }
    char v15 = (unsigned __int8 *)*((unsigned __int8 *)v12 + 23);
    int v16 = (char)v15;
    if ((char)v15 < 0) {
      char v15 = v12[1];
    }
    if (v14 != v15) {
      return 0;
    }
    if (v16 >= 0) {
      unint64_t v17 = *(unsigned __int8 **)(a2 + 24);
    }
    else {
      unint64_t v17 = *v12;
    }
    if ((v13 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v11, v17, *((void *)v11 + 1))) {
        return 0;
      }
    }
    else if (v11[23])
    {
      while (*v11 == *v17)
      {
        ++v11;
        ++v17;
        if (!--v13) {
          goto LABEL_35;
        }
      }
      return 0;
    }
  }
  else if (v12)
  {
    return 0;
  }
LABEL_35:
  char v18 = *(unsigned __int8 **)(a1 + 16);
  unint64_t v19 = *(unsigned __int8 ***)(a2 + 16);
  if (v18)
  {
    if (!v19) {
      return 0;
    }
    uint64_t v20 = v18[23];
    if ((v20 & 0x80u) == 0) {
      unint64_t v21 = (unsigned __int8 *)v18[23];
    }
    else {
      unint64_t v21 = (unsigned __int8 *)*((void *)v18 + 1);
    }
    unint64_t v22 = (unsigned __int8 *)*((unsigned __int8 *)v19 + 23);
    int v23 = (char)v22;
    if ((char)v22 < 0) {
      unint64_t v22 = v19[1];
    }
    if (v21 != v22) {
      return 0;
    }
    if (v23 >= 0) {
      BOOL v24 = *(unsigned __int8 **)(a2 + 16);
    }
    else {
      BOOL v24 = *v19;
    }
    if ((v20 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v18, v24, *((void *)v18 + 1))) {
        return 0;
      }
    }
    else if (v18[23])
    {
      while (*v18 == *v24)
      {
        ++v18;
        ++v24;
        if (!--v20) {
          goto LABEL_54;
        }
      }
      return 0;
    }
  }
  else if (v19)
  {
    return 0;
  }
LABEL_54:
  int v25 = *(unsigned __int8 *)(a1 + 60);
  int v26 = *(unsigned __int8 *)(a2 + 60);
  if ((v25 & 0x20) != 0)
  {
    if ((v26 & 0x20) == 0 || *(unsigned __int8 *)(a1 + 56) != *(unsigned __int8 *)(a2 + 56)) {
      return 0;
    }
  }
  else if ((v26 & 0x20) != 0)
  {
    return 0;
  }
  if ((v25 & 0x40) != 0)
  {
    if ((v26 & 0x40) == 0 || *(unsigned __int8 *)(a1 + 57) != *(unsigned __int8 *)(a2 + 57)) {
      return 0;
    }
  }
  else if ((v26 & 0x40) != 0)
  {
    return 0;
  }
  if ((v25 & v26 & 0x80) != 0)
  {
    if (*(unsigned __int8 *)(a1 + 58) != *(unsigned __int8 *)(a2 + 58)) {
      return 0;
    }
  }
  else if (((v25 | v26) & 0x80) != 0)
  {
    return 0;
  }
  if (v25)
  {
    if ((v26 & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8)) {
      return 0;
    }
  }
  else if (v26)
  {
    return 0;
  }
  if ((v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40)) {
      return 0;
    }
  }
  else if ((v26 & 2) != 0)
  {
    return 0;
  }
  if ((v25 & 4) != 0)
  {
    if ((v26 & 4) == 0 || *(_DWORD *)(a1 + 44) != *(_DWORD *)(a2 + 44)) {
      return 0;
    }
  }
  else if ((v26 & 4) != 0)
  {
    return 0;
  }
  if ((v25 & 0x10) != 0)
  {
    if ((v26 & 0x10) == 0 || *(_DWORD *)(a1 + 52) != *(_DWORD *)(a2 + 52)) {
      return 0;
    }
  }
  else if ((v26 & 0x10) != 0)
  {
    return 0;
  }
  BOOL result = (v26 & 8) == 0;
  if ((v25 & 8) == 0) {
    return result;
  }
  return (v26 & 8) != 0 && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48);
}

unint64_t sirinluexternal::AsrTokenInformation::hash_value(sirinluexternal::AsrTokenInformation *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = *((void *)this + 3);
  if (v4) {
    unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100](v4);
  }
  else {
    unint64_t v5 = 0;
  }
  unint64_t v6 = *((void *)this + 2);
  if (v6) {
    unint64_t v6 = std::__string_hash<char>::operator()[abi:ne180100](v6);
  }
  if ((*((unsigned char *)this + 60) & 0x20) != 0)
  {
    uint64_t v7 = *((unsigned __int8 *)this + 56);
    if ((*((unsigned char *)this + 60) & 0x40) != 0)
    {
LABEL_11:
      uint64_t v8 = *((unsigned __int8 *)this + 57);
      if ((*((unsigned char *)this + 60) & 0x80) != 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*((unsigned char *)this + 60) & 0x40) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v8 = 0;
  if ((*((unsigned char *)this + 60) & 0x80) != 0)
  {
LABEL_12:
    uint64_t v9 = *((unsigned __int8 *)this + 58);
    if (*((unsigned char *)this + 60)) {
      goto LABEL_13;
    }
LABEL_23:
    double v10 = 0.0;
    if ((*((unsigned char *)this + 60) & 2) != 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v9 = 0;
  if ((*((unsigned char *)this + 60) & 1) == 0) {
    goto LABEL_23;
  }
LABEL_13:
  double v10 = *((double *)this + 1);
  if (v10 == 0.0) {
    double v10 = 0.0;
  }
  if ((*((unsigned char *)this + 60) & 2) != 0)
  {
LABEL_16:
    uint64_t v11 = *((unsigned int *)this + 10);
    if ((*((unsigned char *)this + 60) & 4) != 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v11 = 0;
  if ((*((unsigned char *)this + 60) & 4) != 0)
  {
LABEL_17:
    uint64_t v12 = *((unsigned int *)this + 11);
    if ((*((unsigned char *)this + 60) & 0x10) != 0) {
      goto LABEL_18;
    }
LABEL_26:
    uint64_t v13 = 0;
    if ((*((unsigned char *)this + 60) & 8) != 0) {
      goto LABEL_19;
    }
LABEL_27:
    uint64_t v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ *(void *)&v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_25:
  uint64_t v12 = 0;
  if ((*((unsigned char *)this + 60) & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_18:
  uint64_t v13 = *((int *)this + 13);
  if ((*((unsigned char *)this + 60) & 8) == 0) {
    goto LABEL_27;
  }
LABEL_19:
  uint64_t v14 = *((int *)this + 12);
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ *(void *)&v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::formatText(sirinluinternalnlv4_parser::NLv4ParserRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "embeddings");
  }
  unint64_t v6 = (uint64_t *)*((void *)this + 2);
  uint64_t v7 = (uint64_t *)*((void *)this + 3);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "matching_spans");
  }
  if (*((unsigned char *)this + 80)) {
    PB::TextFormatter::format(a2, "max_num_parses");
  }
  uint64_t v9 = *((void *)this + 6);
  if (v9) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "nlu_request_id");
  }
  uint64_t v10 = *((void *)this + 7);
  if (v10) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, a2, "request_id");
  }
  uint64_t v11 = *((void *)this + 8);
  if (v11) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "tokenised_utterance");
  }
  uint64_t v12 = *((void *)this + 9);
  if (v12) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v12 + 32))(v12, a2, "turn_input");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 56);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 64);
  if (v5) {
    this = PB::Writer::writeSubmessage(a2, v5);
  }
  unint64_t v6 = *(const PB::Base **)(v3 + 8);
  if (v6) {
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  uint64_t v7 = *(const PB::Base ***)(v3 + 16);
  uint64_t v8 = *(const PB::Base ***)(v3 + 24);
  while (v7 != v8)
  {
    uint64_t v9 = *v7++;
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  uint64_t v10 = *(const PB::Base **)(v3 + 72);
  if (v10) {
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  if (*(unsigned char *)(v3 + 80)) {
    this = PB::Writer::writeVarInt(a2);
  }
  uint64_t v11 = *(const PB::Base **)(v3 + 48);
  if (v11)
  {
    return PB::Writer::writeSubmessage(a2, v11);
  }
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::readFrom(sirinluinternalnlv4_parser::NLv4ParserRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        operator new();
      case 3u:
        operator new();
      case 4u:
        PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<>();
      case 5u:
        operator new();
      case 6u:
        *((unsigned char *)this + 80) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        uint64_t v22 = *(void *)a2;
        if (v20 <= 0xFFFFFFFFFFFFFFF5 && v20 + 10 <= v21)
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          do
          {
            unint64_t v26 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              goto LABEL_51;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
          }
          while (!v14);
LABEL_47:
          uint64_t v25 = 0;
          goto LABEL_51;
        }
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v25 = 0;
        if (v21 <= v20) {
          unint64_t v21 = *((void *)a2 + 1);
        }
        break;
      case 7u:
        operator new();
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v21 == v20)
      {
        uint64_t v25 = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_51;
      }
      unint64_t v31 = v20 + 1;
      char v32 = *(unsigned char *)(v22 + v20);
      *((void *)a2 + 1) = v31;
      v25 |= (unint64_t)(v32 & 0x7F) << v29;
      if ((v32 & 0x80) == 0) {
        break;
      }
      v29 += 7;
      unint64_t v20 = v31;
      BOOL v14 = v30++ > 8;
      if (v14) {
        goto LABEL_47;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      uint64_t v25 = 0;
    }
LABEL_51:
    *((void *)this + 5) = v25;
LABEL_36:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_36;
  }
  return result;
}

void sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest(sirinluinternalnlv4_parser::NLv4ParserRequest *this)
{
  sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  uint64_t vars8;

  *(void *)this = &unk_1F232F040;
  unint64_t v2 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  int v4 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v7 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v7);
  unint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  PB::Base::~Base(this);
}

double sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest(sirinluinternalnlv4_parser::NLv4ParserRequest *this)
{
  *(void *)this = &unk_1F232F040;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F040;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest(uint64_t this, const sirinluinternalnlv4_parser::NLv4ParserRequest *a2)
{
  *(void *)this = &unk_1F232F040;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 48) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 64) = 0u;
  *(_DWORD *)(this + 80) = 0;
  if (*((void *)a2 + 7)) {
    operator new();
  }
  if (*((void *)a2 + 8)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 2) != *((void *)a2 + 3)) {
    PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<sirinluinternal::MatchingSpan const&>();
  }
  if (*((void *)a2 + 9)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 80))
  {
    uint64_t v2 = *((void *)a2 + 5);
    *(unsigned char *)(this + 80) |= 1u;
    *(void *)(this + 40) = v2;
  }
  if (*((void *)a2 + 6)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::operator=(uint64_t a1, const sirinluinternalnlv4_parser::NLv4ParserRequest *a2)
{
  if ((const sirinluinternalnlv4_parser::NLv4ParserRequest *)a1 != a2)
  {
    sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest((uint64_t)v11, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    long long v12 = v3;
    long long v13 = v4;
    long long v5 = v16;
    long long v7 = *(_OWORD *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v5;
    int v8 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    int v17 = v8;
    uint64_t v9 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v14;
    uint64_t v14 = v9;
    long long v16 = v6;
    long long v15 = v7;
    sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest((sirinluinternalnlv4_parser::NLv4ParserRequest *)v11);
  }
  return a1;
}

uint64_t sirinluinternalnlv4_parser::swap(uint64_t this, sirinluinternalnlv4_parser::NLv4ParserRequest *a2, sirinluinternalnlv4_parser::NLv4ParserRequest *a3)
{
  int v3 = *(_DWORD *)(this + 80);
  *(_DWORD *)(this + 80) = *((_DWORD *)a2 + 20);
  *((_DWORD *)a2 + 20) = v3;
  uint64_t v4 = *(void *)(this + 56);
  *(void *)(this + 56) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v4;
  uint64_t v5 = *(void *)(this + 64);
  *(void *)(this + 64) = *((void *)a2 + 8);
  *((void *)a2 + 8) = v5;
  uint64_t v6 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v6;
  uint64_t v7 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v7;
  uint64_t v8 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v8;
  uint64_t v9 = *(void *)(this + 32);
  uint64_t v10 = *(void *)(this + 40);
  uint64_t v11 = *((void *)a2 + 5);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *(void *)(this + 40) = v11;
  *((void *)a2 + 4) = v9;
  uint64_t v12 = *(void *)(this + 72);
  *(void *)(this + 72) = *((void *)a2 + 9);
  *((void *)a2 + 9) = v12;
  *((void *)a2 + 5) = v10;
  uint64_t v13 = *(void *)(this + 48);
  *(void *)(this + 48) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v13;
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F040;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_DWORD *)(a2 + 80) = 0;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v6 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  uint64_t v8 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  uint64_t v9 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v10 = *v4;
  *uint64_t v4 = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((void **)(a1 + 16));
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  uint64_t v11 = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  uint64_t v12 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v11;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  uint64_t v13 = *(void *)(a2 + 40);
  uint64_t v14 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  uint64_t v15 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = v13;
  *(void *)(a1 + 48) = v14;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  return a1;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest((uint64_t)v11, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    long long v12 = v3;
    long long v13 = v4;
    long long v5 = v16;
    long long v7 = *(_OWORD *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v5;
    int v8 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    int v17 = v8;
    uint64_t v9 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v14;
    uint64_t v14 = v9;
    long long v16 = v6;
    long long v15 = v7;
    sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest((sirinluinternalnlv4_parser::NLv4ParserRequest *)v11);
  }
  return a1;
}

BOOL sirinluinternalnlv4_parser::NLv4ParserRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a2 + 56);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  long long v6 = *(void **)(a1 + 64);
  long long v7 = *(void **)(a2 + 64);
  if (v6)
  {
    if (!v7 || !sirinluinternalnlv4_parser::Tokenisation::operator==(v6, v7)) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a2 + 8);
  if (v8)
  {
    if (!v9 || !sirinluinternal::NLv4EmbeddingTensor::operator==(v8, v9)) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  BOOL result = PB::PtrVector<sirinluinternal::MatchingSpan>::operator==((uint64_t *)(a1 + 16), *(uint64_t **)(a2 + 16), *(void *)(a2 + 24));
  if (!result) {
    return result;
  }
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a2 + 72);
  if (v11)
  {
    if (!v12 || (sirinluexternal::TurnInput::operator==(v11, v12) & 1) == 0) {
      return 0;
    }
  }
  else if (v12)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 80) & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 80) & 1) == 0) {
      goto LABEL_29;
    }
    return 0;
  }
  if ((*(unsigned char *)(a2 + 80) & 1) == 0 || *(void *)(a1 + 40) != *(void *)(a2 + 40)) {
    return 0;
  }
LABEL_29:
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a2 + 48);
  BOOL result = (v13 | v14) == 0;
  if (v13 && v14)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    return sirinluexternal::RequestID::operator==(v15, v14);
  }
  return result;
}

unint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::hash_value(sirinluinternalnlv4_parser::NLv4ParserRequest *this)
{
  uint64_t v2 = *((void *)this + 7);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 28) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(void *)(v2 + 16);
  if ((*(unsigned char *)(v2 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(int *)(v2 + 24);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  long long v7 = (sirinluinternalnlv4_parser::Tokenisation *)*((void *)this + 8);
  if (v7) {
    unint64_t v8 = sirinluinternalnlv4_parser::Tokenisation::hash_value(v7);
  }
  else {
    unint64_t v8 = 0;
  }
  uint64_t v9 = (sirinluinternal::NLv4EmbeddingTensor *)*((void *)this + 1);
  if (v9) {
    unint64_t v10 = sirinluinternal::NLv4EmbeddingTensor::hash_value(v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v11 = (sirinluinternal::MatchingSpan **)*((void *)this + 2);
  uint64_t v12 = (sirinluinternal::MatchingSpan **)*((void *)this + 3);
  if (v11 == v12)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = *v11++;
      v13 ^= sirinluinternal::MatchingSpan::hash_value(v14);
    }
    while (v11 != v12);
  }
  uint64_t v15 = (sirinluexternal::TurnInput *)*((void *)this + 9);
  if (v15) {
    unint64_t v16 = sirinluexternal::TurnInput::hash_value(v15);
  }
  else {
    unint64_t v16 = 0;
  }
  if (*((unsigned char *)this + 80)) {
    uint64_t v17 = *((void *)this + 5);
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = *((void *)this + 6);
  if (v18) {
    unint64_t v18 = sirinluexternal::RequestID::hash_value((sirinluexternal::RequestID *)v18);
  }
  return v8 ^ v6 ^ v16 ^ v17 ^ v18 ^ v10 ^ v13;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::makeRequestId(uint64_t this)
{
  if (!*(void *)(this + 56)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::makeTokenisedUtterance(uint64_t this)
{
  if (!*(void *)(this + 64)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::makeEmbeddings(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::makeTurnInput(uint64_t this)
{
  if (!*(void *)(this + 72)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::makeNluRequestId(uint64_t this)
{
  if (!*(void *)(this + 48)) {
    operator new();
  }
  return this;
}

uint64_t SIRINLUEXTERNALMatchInfoReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
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
        *(unsigned char *)(a1 + 104) |= 1u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v21 = v20 + 4, v20 + 4 <= *(void *)(a2 + *v4)))
        {
          int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v21;
        }
        else
        {
          int v22 = 0;
          *(unsigned char *)(a2 + *v5) = 1;
        }
        *(_DWORD *)(a1 + 48) = v22;
        goto LABEL_37;
      case 2u:
        char v23 = objc_alloc_init(SIRICOMMONFloatValue);
        objc_storeStrong((id *)(a1 + 40), v23);
        if (!PBReaderPlaceMark() || (SIRICOMMONFloatValueReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_66;
        }
        goto LABEL_36;
      case 3u:
        char v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v24 = 96;
        goto LABEL_34;
      case 4u:
        char v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v24 = 72;
        goto LABEL_34;
      case 5u:
        char v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v24 = 88;
        goto LABEL_34;
      case 6u:
        char v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v24 = 64;
        goto LABEL_34;
      case 7u:
        char v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v24 = 32;
        goto LABEL_34;
      case 8u:
        char v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v24 = 80;
        goto LABEL_34;
      case 9u:
        char v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        uint64_t v24 = 56;
LABEL_34:
        objc_storeStrong((id *)(a1 + v24), v23);
        if PBReaderPlaceMark() && (SIRICOMMONUInt32ValueReadFrom((uint64_t)v23, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_37:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_66:

        return 0;
      case 0xAu:
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v26 = 0;
            unsigned int v27 = 0;
            uint64_t v28 = 0;
            while (1)
            {
              uint64_t v29 = *v3;
              uint64_t v30 = *(void *)(a2 + v29);
              unint64_t v31 = v30 + 1;
              if (v30 == -1 || v31 > *(void *)(a2 + *v4)) {
                break;
              }
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_51;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_51:
            PBRepeatedInt32Add();
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
            goto LABEL_61;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_61:
          PBRepeatedInt32Add();
        }
        goto LABEL_37;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_37;
    }
  }
}

uint64_t SIRINLUEXTERNALUsoEdgeReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = objc_alloc_init(SIRINLUEXTERNALUsoEdgeLabel);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUsoEdgeLabelReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        if (v17 == 2)
        {
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          while (1)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v20 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0) {
              goto LABEL_45;
            }
            v25 += 7;
            BOOL v14 = v26++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_47:
          uint64_t v31 = 24;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_41;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_43;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_43:
          uint64_t v31 = 8;
        }
        *(_DWORD *)(a1 + v31) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::formatText(sirinluinternalcontextupdate::ContextUpdateRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "current_turn");
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "nlu_request_id");
  }
  long long v7 = (uint64_t *)*((void *)this + 3);
  char v8 = (uint64_t *)*((void *)this + 4);
  while (v7 != v8)
  {
    uint64_t v9 = *v7++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v9 + 32))(v9, a2, "previous_turns");
  }
  unint64_t v10 = (uint64_t *)*((void *)this + 6);
  uint64_t v11 = (uint64_t *)*((void *)this + 7);
  while (v10 != v11)
  {
    uint64_t v12 = *v10++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v12 + 32))(v12, a2, "qr_hypotheses");
  }
  uint64_t v13 = *((void *)this + 9);
  if (v13) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v13 + 32))(v13, a2, "request_id");
  }
  if (*((void *)this + 10)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = (void *)this;
  uint64_t v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = (const PB::Base **)v3[3];
  uint64_t v6 = (const PB::Base **)v3[4];
  while (v5 != v6)
  {
    long long v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  char v8 = (const PB::Base **)v3[6];
  uint64_t v9 = (const PB::Base **)v3[7];
  while (v8 != v9)
  {
    unint64_t v10 = *v8++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  uint64_t v11 = (const PB::Base *)v3[9];
  if (v11) {
    this = PB::Writer::writeSubmessage(a2, v11);
  }
  if (v3[10]) {
    this = PB::Writer::write();
  }
  uint64_t v12 = (const PB::Base *)v3[2];
  if (v12)
  {
    return PB::Writer::writeSubmessage(a2, v12);
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::readFrom(sirinluinternalcontextupdate::ContextUpdateRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_19;
        }
      }
LABEL_21:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          operator new();
        case 2u:
          PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<>();
        case 3u:
          PB::PtrVector<sirinluinternal::RewriteHypothesis>::emplace_back<>();
        case 4u:
          operator new();
        case 5u:
          operator new();
        case 6u:
          operator new();
        default:
          break;
      }
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_21;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest(sirinluinternalcontextupdate::ContextUpdateRequest *this)
{
  sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  uint64_t vars8;

  *(void *)this = &unk_1F232F090;
  unint64_t v2 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  unint64_t v3 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v6 = (void **)((char *)this + 48);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  uint64_t v6 = (void **)((char *)this + 24);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  int v4 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  PB::Base::~Base(this);
}

double sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest(sirinluinternalcontextupdate::ContextUpdateRequest *this)
{
  *(void *)this = &unk_1F232F090;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F090;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest(uint64_t this, const sirinluinternalcontextupdate::ContextUpdateRequest *a2)
{
  *(void *)this = &unk_1F232F090;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_OWORD *)(this + 72) = 0u;
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 3) != *((void *)a2 + 4)) {
    PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<sirinluexternal::TurnInput const&>();
  }
  if (*((void *)a2 + 6) != *((void *)a2 + 7)) {
    PB::PtrVector<sirinluinternal::RewriteHypothesis>::emplace_back<sirinluinternal::RewriteHypothesis const&>();
  }
  if (*((void *)a2 + 9)) {
    operator new();
  }
  if (*((void *)a2 + 10)) {
    operator new();
  }
  if (*((void *)a2 + 2)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::operator=(uint64_t a1, const sirinluinternalcontextupdate::ContextUpdateRequest *a2)
{
  if ((const sirinluinternalcontextupdate::ContextUpdateRequest *)a1 != a2)
  {
    sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest((uint64_t)v9, a2);
    long long v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v11 = v3;
    long long v12 = v4;
    long long v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    long long v6 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    long long v13 = v5;
    long long v14 = v6;
    long long v7 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    long long v10 = v7;
    sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest((sirinluinternalcontextupdate::ContextUpdateRequest *)v9);
  }
  return a1;
}

void *sirinluinternalcontextupdate::swap(void *this, sirinluinternalcontextupdate::ContextUpdateRequest *a2, sirinluinternalcontextupdate::ContextUpdateRequest *a3)
{
  uint64_t v3 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  uint64_t v4 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v4;
  uint64_t v5 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v5;
  uint64_t v6 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v6;
  uint64_t v7 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v7;
  uint64_t v8 = this[7];
  this[7] = *((void *)a2 + 7);
  *((void *)a2 + 7) = v8;
  uint64_t v9 = this[8];
  this[8] = *((void *)a2 + 8);
  *((void *)a2 + 8) = v9;
  uint64_t v10 = this[9];
  this[9] = *((void *)a2 + 9);
  *((void *)a2 + 9) = v10;
  uint64_t v11 = this[10];
  this[10] = *((void *)a2 + 10);
  *((void *)a2 + 10) = v11;
  uint64_t v12 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v12;
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F090;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v4 = (void **)(a1 + 24);
  uint64_t v5 = (void **)(a1 + 48);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 24) = 0u;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v5);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 72);
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  uint64_t v9 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v8;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a2 + 80) = 0;
  uint64_t v11 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v10;
  if (v11) {
    std::default_delete<std::string>::operator()[abi:ne180100](v11);
  }
  uint64_t v12 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v13 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  return a1;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest((uint64_t)v9, a2);
    long long v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v11 = v3;
    long long v12 = v4;
    long long v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    long long v6 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    long long v13 = v5;
    long long v14 = v6;
    long long v7 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    long long v10 = v7;
    sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest((sirinluinternalcontextupdate::ContextUpdateRequest *)v9);
  }
  return a1;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::operator==(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || (sirinluexternal::TurnInput::operator==(v4, v5) & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t result = PB::PtrVector<sirinluexternal::TurnInput>::operator==(a1 + 3, *(uint64_t **)(a2 + 24), *(void *)(a2 + 32));
  if (!result) {
    return result;
  }
  uint64_t result = PB::PtrVector<sirinluinternal::RewriteHypothesis>::operator==(a1[6], a1[7], *(uint64_t **)(a2 + 48), *(void *)(a2 + 56));
  if (!result) {
    return result;
  }
  uint64_t v7 = a1[9];
  uint64_t v8 = *(void *)(a2 + 72);
  if (v7)
  {
    if (!v8 || !sirinluexternal::UUID::operator==(v7, v8)) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  uint64_t v9 = (unsigned __int8 *)a1[10];
  long long v10 = *(unsigned __int8 **)(a2 + 80);
  if (!v9)
  {
    if (!v10) {
      goto LABEL_20;
    }
    return 0;
  }
  if (!v10 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v9, v10)) {
    return 0;
  }
LABEL_20:
  uint64_t v11 = a1[2];
  uint64_t v12 = *(void *)(a2 + 16);
  uint64_t result = (v11 | v12) == 0;
  if (v11 && v12)
  {
    uint64_t v13 = a1[2];
    return sirinluexternal::UUID::operator==(v13, v12);
  }
  return result;
}

unint64_t sirinluinternalcontextupdate::ContextUpdateRequest::hash_value(sirinluinternalcontextupdate::ContextUpdateRequest *this)
{
  unint64_t v2 = (sirinluexternal::TurnInput *)*((void *)this + 1);
  if (v2) {
    unint64_t v3 = sirinluexternal::TurnInput::hash_value(v2);
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = (sirinluexternal::TurnInput **)*((void *)this + 3);
  uint64_t v5 = (sirinluexternal::TurnInput **)*((void *)this + 4);
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *v4++;
      v6 ^= sirinluexternal::TurnInput::hash_value(v7);
    }
    while (v4 != v5);
  }
  uint64_t v8 = (sirinluinternal::RewriteHypothesis **)*((void *)this + 6);
  uint64_t v9 = (sirinluinternal::RewriteHypothesis **)*((void *)this + 7);
  if (v8 == v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = *v8++;
      v10 ^= sirinluinternal::RewriteHypothesis::hash_value(v11);
    }
    while (v8 != v9);
  }
  uint64_t v12 = *((void *)this + 9);
  if (!v12)
  {
    uint64_t v16 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)(v12 + 28) & 1) == 0)
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)(v12 + 28) & 2) != 0) {
      goto LABEL_17;
    }
LABEL_21:
    uint64_t v14 = 0;
    if ((*(unsigned char *)(v12 + 28) & 4) != 0) {
      goto LABEL_18;
    }
LABEL_22:
    uint64_t v15 = 0;
    goto LABEL_23;
  }
  uint64_t v13 = *(void *)(v12 + 8);
  if ((*(unsigned char *)(v12 + 28) & 2) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v14 = *(void *)(v12 + 16);
  if ((*(unsigned char *)(v12 + 28) & 4) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v15 = *(int *)(v12 + 24);
LABEL_23:
  uint64_t v16 = v14 ^ v13 ^ v15;
LABEL_24:
  unint64_t v17 = *((void *)this + 10);
  if (v17) {
    unint64_t v17 = std::__string_hash<char>::operator()[abi:ne180100](v17);
  }
  uint64_t v18 = *((void *)this + 2);
  if (v18)
  {
    if (*(unsigned char *)(v18 + 28))
    {
      uint64_t v19 = *(void *)(v18 + 8);
      if ((*(unsigned char *)(v18 + 28) & 2) != 0)
      {
LABEL_29:
        uint64_t v20 = *(void *)(v18 + 16);
        if ((*(unsigned char *)(v18 + 28) & 4) != 0)
        {
LABEL_30:
          uint64_t v21 = *(int *)(v18 + 24);
LABEL_34:
          uint64_t v18 = v20 ^ v19 ^ v21;
          return v6 ^ v3 ^ v17 ^ v18 ^ v10 ^ v16;
        }
LABEL_33:
        uint64_t v21 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v19 = 0;
      if ((*(unsigned char *)(v18 + 28) & 2) != 0) {
        goto LABEL_29;
      }
    }
    uint64_t v20 = 0;
    if ((*(unsigned char *)(v18 + 28) & 4) != 0) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  return v6 ^ v3 ^ v17 ^ v18 ^ v10 ^ v16;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::makeCurrentTurn(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::makeRequestId(uint64_t this)
{
  if (!*(void *)(this + 72)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::makeNluRequestId(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::TurnContext::formatText(sirinluexternal::TurnContext *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "legacy_nl_context");
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "nl_context");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::TurnContext::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = *(const PB::Base **)(v3 + 8);
  if (v5)
  {
    return PB::Writer::writeSubmessage(a2, v5);
  }
  return this;
}

uint64_t sirinluexternal::TurnContext::readFrom(sirinluexternal::TurnContext *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::TurnContext::~TurnContext(sirinluexternal::TurnContext *this)
{
  sirinluexternal::TurnContext::~TurnContext(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232F0E0;
  unint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  PB::Base::~Base(this);
}

void *sirinluexternal::TurnContext::TurnContext(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232F0E0;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_1F232F0E0;
  return this;
}

void *sirinluexternal::TurnContext::TurnContext(void *this, const sirinluexternal::TurnContext *a2)
{
  *this = &unk_1F232F0E0;
  this[1] = 0;
  this[2] = 0;
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::TurnContext::operator=(uint64_t a1, const sirinluexternal::TurnContext *a2)
{
  if ((const sirinluexternal::TurnContext *)a1 != a2)
  {
    sirinluexternal::TurnContext::TurnContext(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::TurnContext::~TurnContext((sirinluexternal::TurnContext *)&v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::TurnContext *a2, sirinluexternal::TurnContext *a3)
{
  uint64_t v3 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  return this;
}

void *sirinluexternal::TurnContext::TurnContext(void *a1, uint64_t a2)
{
  a1[1] = 0;
  uint64_t v4 = a1 + 1;
  *a1 = &unk_1F232F0E0;
  a1[2] = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = a1[2];
  a1[2] = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v8 = *v4;
  *uint64_t v4 = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  return a1;
}

uint64_t sirinluexternal::TurnContext::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::TurnContext::TurnContext(&v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    long long v6 = v3;
    sirinluexternal::TurnContext::~TurnContext((sirinluexternal::TurnContext *)&v5);
  }
  return a1;
}

BOOL sirinluexternal::TurnContext::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (v5 && (sirinluexternal::NLContext::operator==(v4, v5) & 1) != 0) {
      goto LABEL_4;
    }
    return 0;
  }
  if (v5) {
    return 0;
  }
LABEL_4:
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a2 + 8);
  BOOL result = (v6 | v7) == 0;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = *(void *)(a1 + 8);
    return sirinluexternal::LegacyNLContext::operator==(v10, v7);
  }
  return result;
}

unint64_t sirinluexternal::TurnContext::hash_value(sirinluexternal::TurnContext *this)
{
  unint64_t v2 = (sirinluexternal::NLContext *)*((void *)this + 2);
  if (v2) {
    unint64_t v3 = sirinluexternal::NLContext::hash_value(v2);
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = *((void *)this + 1);
  if (v4) {
    unint64_t v4 = sirinluexternal::LegacyNLContext::hash_value((sirinluexternal::LegacyNLContext *)v4);
  }
  return v4 ^ v3;
}

uint64_t sirinluexternal::TurnContext::makeNlContext(uint64_t this)
{
  if (!*(void *)(this + 16)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::TurnContext::makeLegacyNlContext(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternal::RewriteToken::formatText(sirinluinternal::RewriteToken *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 44);
  if (v5)
  {
    PB::TextFormatter::format(a2, "asr_confidence", *((double *)this + 1));
    char v5 = *((unsigned char *)this + 44);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "end_index");
  }
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  char v6 = *((unsigned char *)this + 44);
  if ((v6 & 8) != 0)
  {
    PB::TextFormatter::format(a2, "remove_space_after");
    char v6 = *((unsigned char *)this + 44);
  }
  if ((v6 & 4) != 0) {
    PB::TextFormatter::format(a2, "start_index");
  }
  if (*((void *)this + 3)) {
    PB::TextFormatter::format();
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::RewriteToken::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 24)) {
    this = PB::Writer::write();
  }
  char v4 = *(unsigned char *)(v3 + 44);
  if ((v4 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v4 = *(unsigned char *)(v3 + 44);
    if ((v4 & 2) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)(v3 + 44) & 2) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  if (*(unsigned char *)(v3 + 44)) {
LABEL_6:
  }
    this = PB::Writer::write(a2, *(double *)(v3 + 8));
LABEL_7:
  if (*(void *)(v3 + 16)) {
    this = PB::Writer::write();
  }
  if ((*(unsigned char *)(v3 + 44) & 8) != 0)
  {
    return PB::Writer::write(a2);
  }
  return this;
}

uint64_t sirinluinternal::RewriteToken::readFrom(sirinluinternal::RewriteToken *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        *((unsigned char *)this + 44) |= 4u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        uint64_t v22 = *(void *)a2;
        if (v20 <= 0xFFFFFFFFFFFFFFF5 && v20 + 10 <= v21)
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          do
          {
            unint64_t v26 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              goto LABEL_64;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
          }
          while (!v14);
LABEL_50:
          LODWORD(v25) = 0;
          goto LABEL_64;
        }
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v25 = 0;
        if (v21 <= v20) {
          unint64_t v21 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v21 == v20)
          {
            LODWORD(v25) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v43 = v20 + 1;
            char v44 = *(unsigned char *)(v22 + v20);
            *((void *)a2 + 1) = v43;
            v25 |= (unint64_t)(v44 & 0x7F) << v41;
            if (v44 < 0)
            {
              v41 += 7;
              unint64_t v20 = v43;
              BOOL v14 = v42++ > 8;
              if (v14) {
                goto LABEL_50;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v25) = 0;
            }
          }
          break;
        }
LABEL_64:
        *((_DWORD *)this + 9) = v25;
        goto LABEL_69;
      case 3u:
        *((unsigned char *)this + 44) |= 2u;
        unint64_t v28 = *((void *)a2 + 1);
        unint64_t v29 = *((void *)a2 + 2);
        uint64_t v30 = *(void *)a2;
        if (v28 <= 0xFFFFFFFFFFFFFFF5 && v28 + 10 <= v29)
        {
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          do
          {
            unint64_t v34 = v28 + 1;
            *((void *)a2 + 1) = v28 + 1;
            char v35 = *(unsigned char *)(v30 + v28);
            v33 |= (unint64_t)(v35 & 0x7F) << v31;
            if ((v35 & 0x80) == 0) {
              goto LABEL_68;
            }
            v31 += 7;
            unint64_t v28 = v34;
            BOOL v14 = v32++ > 8;
          }
          while (!v14);
LABEL_57:
          LODWORD(v33) = 0;
          goto LABEL_68;
        }
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v33 = 0;
        if (v29 <= v28) {
          unint64_t v29 = *((void *)a2 + 1);
        }
        break;
      case 4u:
        *((unsigned char *)this + 44) |= 1u;
        unint64_t v36 = *((void *)a2 + 1);
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *((void *)a2 + 2))
        {
          *((void *)this + 1) = *(void *)(*(void *)a2 + v36);
          *((void *)a2 + 1) += 8;
        }
        else
        {
          *((unsigned char *)a2 + 24) = 1;
        }
        goto LABEL_69;
      case 5u:
        operator new();
      case 6u:
        *((unsigned char *)this + 44) |= 8u;
        unint64_t v37 = *((void *)a2 + 1);
        if (v37 >= *((void *)a2 + 2))
        {
          BOOL v40 = 0;
          *((unsigned char *)a2 + 24) = 1;
        }
        else
        {
          unint64_t v38 = v37 + 1;
          int v39 = *(unsigned __int8 *)(*(void *)a2 + v37);
          *((void *)a2 + 1) = v38;
          BOOL v40 = v39 != 0;
        }
        *((unsigned char *)this + 40) = v40;
        goto LABEL_69;
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v29 == v28)
      {
        LODWORD(v33) = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_68;
      }
      unint64_t v47 = v28 + 1;
      char v48 = *(unsigned char *)(v30 + v28);
      *((void *)a2 + 1) = v47;
      v33 |= (unint64_t)(v48 & 0x7F) << v45;
      if ((v48 & 0x80) == 0) {
        break;
      }
      v45 += 7;
      unint64_t v28 = v47;
      BOOL v14 = v46++ > 8;
      if (v14) {
        goto LABEL_57;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      LODWORD(v33) = 0;
    }
LABEL_68:
    *((_DWORD *)this + 8) = v33;
LABEL_69:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_69;
  }
  return result;
}

void sirinluinternal::RewriteToken::~RewriteToken(sirinluinternal::RewriteToken *this)
{
  sirinluinternal::RewriteToken::~RewriteToken(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232F130;
  unint64_t v2 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v2) {
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  }
  unint64_t v3 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  }
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::RewriteToken::RewriteToken(uint64_t this)
{
  *(void *)this = &unk_1F232F130;
  *(_DWORD *)(this + 44) = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_1F232F130;
  *(_DWORD *)(this + 44) = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  return this;
}

uint64_t sirinluinternal::RewriteToken::RewriteToken(uint64_t this, const sirinluinternal::RewriteToken *a2)
{
  *(void *)this = &unk_1F232F130;
  *(void *)(this + 16) = 0;
  *(_DWORD *)(this + 44) = 0;
  *(void *)(this + 24) = 0;
  if (*((void *)a2 + 3)) {
    operator new();
  }
  char v2 = *((unsigned char *)a2 + 44);
  if ((v2 & 4) != 0)
  {
    int v4 = *((_DWORD *)a2 + 9);
    *(unsigned char *)(this + 44) |= 4u;
    *(_DWORD *)(this + 36) = v4;
    char v2 = *((unsigned char *)a2 + 44);
    if ((v2 & 2) == 0)
    {
LABEL_5:
      if ((v2 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)a2 + 44) & 2) == 0)
  {
    goto LABEL_5;
  }
  int v5 = *((_DWORD *)a2 + 8);
  *(unsigned char *)(this + 44) |= 2u;
  *(_DWORD *)(this + 32) = v5;
  if (*((unsigned char *)a2 + 44))
  {
LABEL_6:
    uint64_t v3 = *((void *)a2 + 1);
    *(unsigned char *)(this + 44) |= 1u;
    *(void *)(this + 8) = v3;
  }
LABEL_7:
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if ((*((unsigned char *)a2 + 44) & 8) != 0)
  {
    char v6 = *((unsigned char *)a2 + 40);
    *(unsigned char *)(this + 44) |= 8u;
    *(unsigned char *)(this + 40) = v6;
  }
  return this;
}

uint64_t sirinluinternal::RewriteToken::operator=(uint64_t a1, const sirinluinternal::RewriteToken *a2)
{
  if ((const sirinluinternal::RewriteToken *)a1 != a2)
  {
    sirinluinternal::RewriteToken::RewriteToken((uint64_t)&v8, a2);
    int v3 = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(a1 + 44) = v13;
    int v13 = v3;
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = v11;
    uint64_t v11 = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v9;
    uint64_t v9 = v5;
    long long v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v10;
    long long v10 = v6;
    LOBYTE(v3) = *(unsigned char *)(a1 + 40);
    *(unsigned char *)(a1 + 40) = v12;
    char v12 = v3;
    sirinluinternal::RewriteToken::~RewriteToken((sirinluinternal::RewriteToken *)&v8);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::RewriteToken *a2, sirinluinternal::RewriteToken *a3)
{
  int v3 = *((_DWORD *)this + 11);
  *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v3;
  uint64_t v4 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v4;
  LODWORD(v4) = *((_DWORD *)this + 9);
  *((_DWORD *)this + 9) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v4;
  LODWORD(v4) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v4;
  double result = *((double *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((double *)a2 + 1) = result;
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v6;
  LOBYTE(v6) = *((unsigned char *)this + 40);
  *((unsigned char *)this + 40) = *((unsigned char *)a2 + 40);
  *((unsigned char *)a2 + 40) = v6;
  return result;
}

uint64_t sirinluinternal::RewriteToken::RewriteToken(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F130;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  if (v5) {
    std::default_delete<std::string>::operator()[abi:ne180100](v5);
  }
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v6;
  if (v7) {
    std::default_delete<std::string>::operator()[abi:ne180100](v7);
  }
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t sirinluinternal::RewriteToken::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::RewriteToken::RewriteToken((uint64_t)&v8, a2);
    int v3 = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(a1 + 44) = v13;
    int v13 = v3;
    uint64_t v4 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = v11;
    uint64_t v11 = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v9;
    uint64_t v9 = v5;
    long long v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v10;
    long long v10 = v6;
    LOBYTE(v3) = *(unsigned char *)(a1 + 40);
    *(unsigned char *)(a1 + 40) = v12;
    char v12 = v3;
    sirinluinternal::RewriteToken::~RewriteToken((sirinluinternal::RewriteToken *)&v8);
  }
  return a1;
}

BOOL sirinluinternal::RewriteToken::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned __int8 **)(a1 + 24);
  uint64_t v5 = *(unsigned __int8 ***)(a2 + 24);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      uint64_t v7 = (unsigned __int8 *)v4[23];
    }
    else {
      uint64_t v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      uint64_t v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      long long v10 = *(unsigned __int8 **)(a2 + 24);
    }
    else {
      long long v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_18;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  char v11 = *(unsigned char *)(a1 + 44);
  char v12 = *(unsigned char *)(a2 + 44);
  if ((v11 & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 44) & 4) == 0 || *(_DWORD *)(a1 + 36) != *(_DWORD *)(a2 + 36)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 44) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 44) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 44) & 2) == 0 || *(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 44) & 2) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 44))
  {
    if ((*(unsigned char *)(a2 + 44) & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 44))
  {
    return 0;
  }
  int v13 = *(unsigned __int8 **)(a1 + 16);
  BOOL v14 = *(unsigned __int8 **)(a2 + 16);
  if (v13)
  {
    if (!v14 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v13, v14)) {
      return 0;
    }
  }
  else if (v14)
  {
    return 0;
  }
  BOOL result = (v12 & 8) == 0;
  if ((v11 & 8) == 0) {
    return result;
  }
  return (v12 & 8) != 0 && *(unsigned __int8 *)(a1 + 40) == *(unsigned __int8 *)(a2 + 40);
}

unint64_t sirinluinternal::RewriteToken::hash_value(sirinluinternal::RewriteToken *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  char v4 = *((unsigned char *)this + 44);
  if ((v4 & 4) != 0)
  {
    uint64_t v5 = *((unsigned int *)this + 9);
    if ((*((unsigned char *)this + 44) & 2) != 0)
    {
LABEL_6:
      uint64_t v6 = *((unsigned int *)this + 8);
      if (*((unsigned char *)this + 44)) {
        goto LABEL_7;
      }
LABEL_12:
      uint64_t v7 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*((unsigned char *)this + 44) & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*((unsigned char *)this + 44) & 1) == 0) {
    goto LABEL_12;
  }
LABEL_7:
  if (*((double *)this + 1) == 0.0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *((void *)this + 1);
  }
LABEL_13:
  unint64_t v8 = *((void *)this + 2);
  if (v8) {
    unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](v8);
  }
  if ((v4 & 8) != 0) {
    uint64_t v9 = *((unsigned __int8 *)this + 40);
  }
  else {
    uint64_t v9 = 0;
  }
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9;
}

uint64_t sirinluexternal::RepetitionResult::formatText(sirinluexternal::RepetitionResult *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 16);
  if (v5)
  {
    PB::TextFormatter::format(a2, "asr_hypothesis_index");
    char v5 = *((unsigned char *)this + 16);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "repetition_type");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::RepetitionResult::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 16);
  if (v4)
  {
    this = PB::Writer::writeVarInt(a2);
    char v4 = *(unsigned char *)(v3 + 16);
  }
  if ((v4 & 2) != 0)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t sirinluexternal::RepetitionResult::readFrom(sirinluexternal::RepetitionResult *this, PB::Reader *a2)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v2 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v3 + 1;
        *((void *)a2 + 1) = v3 + 1;
        char v13 = *(unsigned char *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v3 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_30;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((unsigned char *)this + 16) |= 2u;
        unint64_t v26 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v27 = *(void *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v30 = 0;
          if (v2 <= v26) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v26)
            {
              LODWORD(v30) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_64;
            }
            unint64_t v38 = v26 + 1;
            char v39 = *(unsigned char *)(v27 + v26);
            *((void *)a2 + 1) = v38;
            v30 |= (unint64_t)(v39 & 0x7F) << v36;
            if ((v39 & 0x80) == 0) {
              break;
            }
            v36 += 7;
            unint64_t v26 = v38;
            BOOL v14 = v37++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              goto LABEL_63;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v30) = 0;
          }
LABEL_63:
          unint64_t v3 = v38;
        }
        else
        {
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          while (1)
          {
            unint64_t v3 = v26 + 1;
            *((void *)a2 + 1) = v26 + 1;
            char v31 = *(unsigned char *)(v27 + v26);
            v30 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0) {
              break;
            }
            v28 += 7;
            unint64_t v26 = v3;
            BOOL v14 = v29++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              break;
            }
          }
        }
LABEL_64:
        *((_DWORD *)this + 3) = v30;
      }
      else if ((v11 >> 3) == 1)
      {
        *((unsigned char *)this + 16) |= 1u;
        unint64_t v19 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v20 = *(void *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v2)
        {
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          if (v2 <= v19) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v19)
            {
              LODWORD(v23) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_60;
            }
            unint64_t v34 = v19 + 1;
            char v35 = *(unsigned char *)(v20 + v19);
            *((void *)a2 + 1) = v34;
            v23 |= (unint64_t)(v35 & 0x7F) << v32;
            if ((v35 & 0x80) == 0) {
              break;
            }
            v32 += 7;
            unint64_t v19 = v34;
            BOOL v14 = v33++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_59;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v23) = 0;
          }
LABEL_59:
          unint64_t v3 = v34;
        }
        else
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (1)
          {
            unint64_t v3 = v19 + 1;
            *((void *)a2 + 1) = v19 + 1;
            char v24 = *(unsigned char *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v21 += 7;
            unint64_t v19 = v3;
            BOOL v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_60:
        *((_DWORD *)this + 2) = v23;
      }
      else
      {
LABEL_30:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v3 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
      }
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v3 > v2) {
      unint64_t v2 = v3;
    }
    while (v2 != v3)
    {
      unint64_t v17 = v3 + 1;
      char v18 = *(unsigned char *)(v8 + v3);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v3 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_30;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluexternal::RepetitionResult::~RepetitionResult(sirinluexternal::RepetitionResult *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1CB772580);
}

uint64_t sirinluexternal::RepetitionResult::RepetitionResult(uint64_t this)
{
  *(void *)this = &unk_1F232F180;
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(void *)this = &unk_1F232F180;
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

uint64_t sirinluexternal::RepetitionResult::RepetitionResult(uint64_t this, const sirinluexternal::RepetitionResult *a2)
{
  *(void *)this = &unk_1F232F180;
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  if (*((unsigned char *)a2 + 16))
  {
    int v3 = *((_DWORD *)a2 + 2);
    *(unsigned char *)(this + 16) = 1;
    *(_DWORD *)(this + 8) = v3;
    char v2 = 3;
    if ((*((unsigned char *)a2 + 16) & 2) == 0) {
      return this;
    }
    goto LABEL_5;
  }
  char v2 = 2;
  if ((*((unsigned char *)a2 + 16) & 2) != 0)
  {
LABEL_5:
    int v4 = *((_DWORD *)a2 + 3);
    *(unsigned char *)(this + 16) = v2;
    *(_DWORD *)(this + 12) = v4;
  }
  return this;
}

uint64_t sirinluexternal::RepetitionResult::operator=(uint64_t a1, const sirinluexternal::RepetitionResult *a2)
{
  if ((const sirinluexternal::RepetitionResult *)a1 != a2)
  {
    sirinluexternal::RepetitionResult::RepetitionResult((uint64_t)v6, a2);
    int v3 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v8;
    int v8 = v3;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v7;
    uint64_t v7 = v4;
    PB::Base::~Base((PB::Base *)v6);
  }
  return a1;
}

double sirinluexternal::swap(sirinluexternal *this, sirinluexternal::RepetitionResult *a2, sirinluexternal::RepetitionResult *a3)
{
  int v3 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  double result = *((double *)a2 + 1);
  uint64_t v5 = *((void *)this + 1);
  *((double *)this + 1) = result;
  *((void *)a2 + 1) = v5;
  return result;
}

double sirinluexternal::RepetitionResult::RepetitionResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F180;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  double result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

{
  double result;

  *(void *)a1 = &unk_1F232F180;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  double result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

uint64_t sirinluexternal::RepetitionResult::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    v7[0] = &unk_1F232F180;
    int v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    int v8 = *(_DWORD *)(a1 + 16);
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 16) = v3;
    *(void *)(a1 + 8) = v5;
    v7[1] = v4;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

BOOL sirinluexternal::RepetitionResult::operator==(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    if ((*(unsigned char *)(a2 + 16) & 1) == 0 || *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 16))
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 16) & 2) == 0;
  if ((*(unsigned char *)(a1 + 16) & 2) != 0) {
    return (*(unsigned char *)(a2 + 16) & 2) != 0 && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12);
  }
  return v2;
}

uint64_t sirinluexternal::RepetitionResult::hash_value(sirinluexternal::RepetitionResult *this)
{
  if (*((unsigned char *)this + 16))
  {
    uint64_t v1 = *((unsigned int *)this + 2);
    if ((*((unsigned char *)this + 16) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = 0;
    return v2 ^ v1;
  }
  uint64_t v1 = 0;
  if ((*((unsigned char *)this + 16) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v2 = *((int *)this + 3);
  return v2 ^ v1;
}

BOOL SIRINLUEXTERNALSystemReportedFailureReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v18 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
        uint64_t v19 = 8;
        goto LABEL_26;
      }
      if (v17 == 1)
      {
        char v18 = objc_alloc_init(SIRINLUEXTERNALUUID);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_33;
        }
LABEL_28:
        PBReaderRecallMark();

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v18 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    uint64_t v19 = 16;
LABEL_26:
    objc_storeStrong((id *)(a1 + v19), v18);
    if (!PBReaderPlaceMark() || !SIRINLUEXTERNALUsoGraphReadFrom((id *)&v18->super.super.isa, a2))
    {
LABEL_33:

      return 0;
    }
    goto LABEL_28;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sirinluexternal::LanguageVariantResult::formatText(sirinluexternal::LanguageVariantResult *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "multilingual_variant");
  }
  uint64_t v8 = *((void *)this + 4);
  if (v8) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "parser");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::LanguageVariantResult::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base ***)(this + 8);
  uint64_t v5 = *(const PB::Base ***)(this + 16);
  while (v4 != v5)
  {
    uint64_t v6 = *v4++;
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  uint64_t v7 = *(const PB::Base **)(v3 + 32);
  if (v7)
  {
    return PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

uint64_t sirinluexternal::LanguageVariantResult::readFrom(sirinluexternal::LanguageVariantResult *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_1C8C01944(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluexternal::LanguageVariantResult::~LanguageVariantResult(sirinluexternal::LanguageVariantResult *this)
{
  sirinluexternal::LanguageVariantResult::~LanguageVariantResult(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_1F232F1D0;
  unint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((void *)this + 1))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 1);
    operator delete(*((void **)this + 1));
  }
  PB::Base::~Base(this);
}

double sirinluexternal::LanguageVariantResult::LanguageVariantResult(sirinluexternal::LanguageVariantResult *this)
{
  *(void *)this = &unk_1F232F1D0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F1D0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

uint64_t sirinluexternal::LanguageVariantResult::LanguageVariantResult(uint64_t this, const sirinluexternal::LanguageVariantResult *a2)
{
  *(void *)this = &unk_1F232F1D0;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 4)) {
    operator new();
  }
  return this;
}

void sub_1C8C01C64(void *a1)
{
}

uint64_t sirinluexternal::LanguageVariantResult::operator=(uint64_t a1, const sirinluexternal::LanguageVariantResult *a2)
{
  if ((const sirinluexternal::LanguageVariantResult *)a1 != a2)
  {
    sirinluexternal::LanguageVariantResult::LanguageVariantResult((uint64_t)v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v7 = v3;
    long long v8 = v4;
    sirinluexternal::LanguageVariantResult::~LanguageVariantResult((sirinluexternal::LanguageVariantResult *)v6);
  }
  return a1;
}

void *sirinluexternal::swap(void *this, sirinluexternal::LanguageVariantResult *a2, sirinluexternal::LanguageVariantResult *a3)
{
  uint64_t v3 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  uint64_t v4 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  uint64_t v5 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v5;
  uint64_t v6 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v6;
  return this;
}

uint64_t sirinluexternal::LanguageVariantResult::LanguageVariantResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F1D0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a2 + 8) = 0u;
  uint64_t v3 = *(void *)(a2 + 32);
  *(_OWORD *)(a2 + 24) = 0u;
  uint64_t v4 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v3;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

uint64_t sirinluexternal::LanguageVariantResult::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::LanguageVariantResult::LanguageVariantResult((uint64_t)v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v7 = v3;
    long long v8 = v4;
    sirinluexternal::LanguageVariantResult::~LanguageVariantResult((sirinluexternal::LanguageVariantResult *)v6);
  }
  return a1;
}

BOOL sirinluexternal::LanguageVariantResult::operator==(void *a1, void *a2)
{
  long long v3 = (uint64_t *)a1[1];
  unint64_t v2 = (uint64_t *)a1[2];
  long long v4 = (uint64_t *)a2[1];
  if ((char *)v2 - (char *)v3 != a2[2] - (void)v4) {
    return 0;
  }
  while (v3 != v2)
  {
    BOOL result = sirinluexternal::MultilingualVariant::operator==(*v3, *v4);
    if (!result) {
      return result;
    }
    ++v3;
    ++v4;
  }
  uint64_t v8 = a1[4];
  uint64_t v9 = a2[4];
  BOOL result = (v8 | v9) == 0;
  if (v8 && v9)
  {
    uint64_t v10 = a1[4];
    return sirinluexternal::Parser::operator==(v10, v9);
  }
  return result;
}

uint64_t sirinluexternal::LanguageVariantResult::hash_value(sirinluexternal::LanguageVariantResult *this)
{
  unint64_t v2 = (sirinluexternal::MultilingualVariant **)*((void *)this + 1);
  long long v3 = (sirinluexternal::MultilingualVariant **)*((void *)this + 2);
  if (v2 == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *v2++;
      v4 ^= sirinluexternal::MultilingualVariant::hash_value(v5);
    }
    while (v2 != v3);
  }
  uint64_t v6 = *((void *)this + 4);
  if (v6)
  {
    if (*(unsigned char *)(v6 + 16))
    {
      uint64_t v7 = *(int *)(v6 + 8);
      if ((*(unsigned char *)(v6 + 16) & 2) != 0) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v7 = 0;
      if ((*(unsigned char *)(v6 + 16) & 2) != 0)
      {
LABEL_9:
        uint64_t v8 = *(int *)(v6 + 12);
LABEL_12:
        uint64_t v6 = v8 ^ v7;
        return v6 ^ v4;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  return v6 ^ v4;
}

uint64_t sirinluexternal::LanguageVariantResult::makeParser(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new();
  }
  return this;
}

uint64_t SIRINLUINTERNALEMBEDDINGEmbeddingResponseReadFrom(uint64_t a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        uint64_t v18 = 40;
        goto LABEL_47;
      case 2u:
        char v17 = objc_alloc_init(SIRINLUINTERNALTokenChain);
        objc_storeStrong((id *)(a1 + 80), v17);
        if (!PBReaderPlaceMark() || !SIRINLUINTERNALTokenChainReadFrom((char *)v17, a2)) {
          goto LABEL_84;
        }
        goto LABEL_64;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 88) |= 8u;
        while (2)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_68:
        uint64_t v41 = 32;
        goto LABEL_81;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 88) |= 2u;
        while (2)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 1;
            v22 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_72:
        uint64_t v41 = 16;
        goto LABEL_81;
      case 5u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 88) |= 1u;
        while (2)
        {
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 1;
            v22 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_76:
        uint64_t v41 = 8;
        goto LABEL_81;
      case 6u:
        char v17 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        uint64_t v18 = 56;
LABEL_47:
        objc_storeStrong((id *)(a1 + v18), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUINTERNALNLv4EmbeddingTensorReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_84;
        }
        goto LABEL_64;
      case 7u:
        char v17 = objc_alloc_init(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput);
        [(id)a1 addEmbeddingTensorOutputs:v17];
        goto LABEL_62;
      case 8u:
        char v17 = objc_alloc_init(SIRINLUINTERNALSubwordTokenChain);
        objc_storeStrong((id *)(a1 + 72), v17);
        if (!PBReaderPlaceMark() || !SIRINLUINTERNALSubwordTokenChainReadFrom(v17, a2)) {
          goto LABEL_84;
        }
        goto LABEL_64;
      case 9u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 88) |= 4u;
        while (2)
        {
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v39 + 1;
            v22 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              BOOL v14 = v37++ >= 9;
              if (v14)
              {
                uint64_t v22 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_80:
        uint64_t v41 = 24;
LABEL_81:
        *(void *)(a1 + v41) = v22;
        goto LABEL_82;
      case 0xAu:
        char v17 = objc_alloc_init(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput);
        [(id)a1 addSubwordEmbeddingTensorOutputs:v17];
LABEL_62:
        if (PBReaderPlaceMark()
          && (SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutputReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_64:
          PBReaderRecallMark();

LABEL_82:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_84:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_82;
    }
  }
}

BOOL SIRINLUEXTERNALSystemPromptedReadFrom(uint64_t a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = objc_alloc_init(SIRINLUEXTERNALUUID);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v17, a2) & 1) == 0) {
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
    char v17 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !SIRINLUEXTERNALUsoGraphReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersionReadFrom(uint64_t a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = objc_alloc_init(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersionReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
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
    char v17 = *(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion **)(a1 + 8);
    *(void *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRICOMMONBytesValueReadFrom(uint64_t a1, uint64_t a2)
{
  long long v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

uint64_t sirinluexternalcdm::NluResponse::formatText(sirinluexternalcdm::NluResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "language_variant_result");
  }
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  uint64_t v7 = (uint64_t *)*((void *)this + 3);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "parses");
  }
  unsigned int v9 = (uint64_t *)*((void *)this + 5);
  unint64_t v10 = (uint64_t *)*((void *)this + 6);
  while (v9 != v10)
  {
    uint64_t v11 = *v9++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "repetition_results");
  }
  uint64_t v12 = *((void *)this + 8);
  if (v12) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v12 + 32))(v12, a2, "request_id");
  }
  uint64_t v13 = *((void *)this + 9);
  if (v13) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v13 + 32))(v13, a2, "response_status");
  }
  uint64_t v14 = *((void *)this + 10);
  if (v14) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v14 + 32))(v14, a2, "supplementary_output");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternalcdm::NluResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  long long v3 = (void *)this;
  uint64_t v4 = *(const PB::Base **)(this + 64);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = (const PB::Base **)v3[2];
  uint64_t v6 = (const PB::Base **)v3[3];
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  uint64_t v8 = (const PB::Base *)v3[9];
  if (v8) {
    this = PB::Writer::writeSubmessage(a2, v8);
  }
  unsigned int v9 = (const PB::Base **)v3[5];
  unint64_t v10 = (const PB::Base **)v3[6];
  while (v9 != v10)
  {
    uint64_t v11 = *v9++;
    this = PB::Writer::writeSubmessage(a2, v11);
  }
  uint64_t v12 = (const PB::Base *)v3[1];
  if (v12) {
    this = PB::Writer::writeSubmessage(a2, v12);
  }
  uint64_t v13 = (const PB::Base *)v3[10];
  if (v13)
  {
    return PB::Writer::writeSubmessage(a2, v13);
  }
  return this;
}

uint64_t sirinluexternalcdm::NluResponse::readFrom(sirinluexternalcdm::NluResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_19;
        }
      }
LABEL_21:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          operator new();
        case 2u:
          PB::PtrVector<sirinluexternal::UserParse>::emplace_back<>();
        case 3u:
          operator new();
        case 4u:
          operator new();
        case 5u:
          operator new();
        case 6u:
          operator new();
        default:
          break;
      }
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_21;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_1C8C05840(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluexternalcdm::NluResponse::~NluResponse(sirinluexternalcdm::NluResponse *this)
{
  sirinluexternalcdm::NluResponse::~NluResponse(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  uint64_t vars8;

  *(void *)this = &unk_1F232F220;
  unint64_t v2 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  int v4 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  if (*((void *)this + 5))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 5);
    operator delete(*((void **)this + 5));
  }
  uint64_t v6 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  PB::Base::~Base(this);
}

double sirinluexternalcdm::NluResponse::NluResponse(sirinluexternalcdm::NluResponse *this)
{
  *(void *)this = &unk_1F232F220;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F220;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

uint64_t sirinluexternalcdm::NluResponse::NluResponse(uint64_t this, const sirinluexternalcdm::NluResponse *a2)
{
  *(void *)this = &unk_1F232F220;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_OWORD *)(this + 72) = 0u;
  if (*((void *)a2 + 8)) {
    operator new();
  }
  if (*((void *)a2 + 2) != *((void *)a2 + 3)) {
    PB::PtrVector<sirinluexternal::UserParse>::emplace_back<sirinluexternal::UserParse const&>();
  }
  if (*((void *)a2 + 9)) {
    operator new();
  }
  if (*((void *)a2 + 5) != *((void *)a2 + 6)) {
    operator new();
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 10)) {
    operator new();
  }
  return this;
}

void sub_1C8C05D8C(void *a1)
{
}

uint64_t sirinluexternalcdm::NluResponse::operator=(uint64_t a1, const sirinluexternalcdm::NluResponse *a2)
{
  if ((const sirinluexternalcdm::NluResponse *)a1 != a2)
  {
    sirinluexternalcdm::NluResponse::NluResponse((uint64_t)v9, a2);
    long long v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v11 = v3;
    long long v12 = v4;
    long long v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    long long v10 = v6;
    long long v7 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    long long v13 = v5;
    long long v14 = v7;
    sirinluexternalcdm::NluResponse::~NluResponse((sirinluexternalcdm::NluResponse *)v9);
  }
  return a1;
}

void *sirinluexternalcdm::swap(void *this, sirinluexternalcdm::NluResponse *a2, sirinluexternalcdm::NluResponse *a3)
{
  uint64_t v3 = this[8];
  this[8] = *((void *)a2 + 8);
  *((void *)a2 + 8) = v3;
  uint64_t v4 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  uint64_t v5 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v5;
  uint64_t v6 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v6;
  uint64_t v7 = this[9];
  this[9] = *((void *)a2 + 9);
  *((void *)a2 + 9) = v7;
  uint64_t v8 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v8;
  uint64_t v9 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v9;
  uint64_t v10 = this[7];
  this[7] = *((void *)a2 + 7);
  *((void *)a2 + 7) = v10;
  uint64_t v11 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v11;
  uint64_t v12 = this[10];
  this[10] = *((void *)a2 + 10);
  *((void *)a2 + 10) = v12;
  return this;
}

uint64_t sirinluexternalcdm::NluResponse::NluResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F220;
  uint64_t v4 = (void **)(a1 + 16);
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v5 = (void **)(a1 + 40);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  uint64_t v7 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v8;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  if (*v5)
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100](v5);
    operator delete(*v5);
    *uint64_t v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  uint64_t v10 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v11 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v10;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  uint64_t v12 = *(void *)(a2 + 80);
  *(void *)(a2 + 80) = 0;
  uint64_t v13 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v12;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  return a1;
}

uint64_t sirinluexternalcdm::NluResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternalcdm::NluResponse::NluResponse((uint64_t)v9, a2);
    long long v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    long long v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    long long v11 = v3;
    long long v12 = v4;
    long long v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    long long v10 = v6;
    long long v7 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    long long v13 = v5;
    long long v14 = v7;
    sirinluexternalcdm::NluResponse::~NluResponse((sirinluexternalcdm::NluResponse *)v9);
  }
  return a1;
}

BOOL sirinluexternalcdm::NluResponse::operator==(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a2 + 64);
  if (v4)
  {
    if (!v5 || !sirinluexternal::RequestID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  BOOL result = PB::PtrVector<sirinluexternal::UserParse>::operator==(a1 + 2, *(uint64_t **)(a2 + 16), *(void *)(a2 + 24));
  if (!result) {
    return result;
  }
  uint64_t v7 = a1[9];
  uint64_t v8 = *(void *)(a2 + 72);
  if (v7)
  {
    if (!v8 || (sirinluexternal::ResponseStatus::operator==(v7, v8) & 1) == 0) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  long long v10 = (uint64_t *)a1[5];
  uint64_t v9 = (uint64_t *)a1[6];
  long long v11 = *(uint64_t **)(a2 + 40);
  if ((char *)v9 - (char *)v10 != *(void *)(a2 + 48) - (void)v11) {
    return 0;
  }
  while (v10 != v9)
  {
    BOOL result = sirinluexternal::RepetitionResult::operator==(*v10, *v11);
    if (!result) {
      return result;
    }
    ++v10;
    ++v11;
  }
  long long v12 = (void *)a1[1];
  long long v13 = *(void **)(a2 + 8);
  if (!v12)
  {
    if (!v13) {
      goto LABEL_23;
    }
    return 0;
  }
  if (!v13 || !sirinluexternal::LanguageVariantResult::operator==(v12, v13)) {
    return 0;
  }
LABEL_23:
  uint64_t v14 = a1[10];
  uint64_t v15 = *(void *)(a2 + 80);
  BOOL result = (v14 | v15) == 0;
  if (v14 && v15)
  {
    unint64_t v16 = (void *)a1[10];
    return sirinluexternal::NLUSupplementaryOutput::operator==(v16, v15);
  }
  return result;
}

unint64_t sirinluexternalcdm::NluResponse::hash_value(sirinluexternalcdm::NluResponse *this)
{
  unint64_t v2 = (sirinluexternal::RequestID *)*((void *)this + 8);
  if (v2) {
    unint64_t v3 = sirinluexternal::RequestID::hash_value(v2);
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = (sirinluexternal::UserParse **)*((void *)this + 2);
  uint64_t v5 = (sirinluexternal::UserParse **)*((void *)this + 3);
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *v4++;
      v6 ^= sirinluexternal::UserParse::hash_value(v7);
    }
    while (v4 != v5);
  }
  uint64_t v8 = *((void *)this + 9);
  if (v8)
  {
    if (*(unsigned char *)(v8 + 20)) {
      uint64_t v9 = *(int *)(v8 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    unint64_t v11 = *(void *)(v8 + 8);
    if (v11) {
      unint64_t v11 = std::__string_hash<char>::operator()[abi:ne180100](v11);
    }
    unint64_t v10 = v11 ^ v9;
  }
  else
  {
    unint64_t v10 = 0;
  }
  long long v12 = (uint64_t *)*((void *)this + 5);
  long long v13 = (uint64_t *)*((void *)this + 6);
  if (v12 != v13)
  {
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *v12;
      if (*(unsigned char *)(*v12 + 16))
      {
        uint64_t v16 = *(unsigned int *)(v15 + 8);
        if ((*(unsigned char *)(*v12 + 16) & 2) == 0)
        {
LABEL_23:
          uint64_t v17 = 0;
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v16 = 0;
        if ((*(unsigned char *)(*v12 + 16) & 2) == 0) {
          goto LABEL_23;
        }
      }
      uint64_t v17 = *(int *)(v15 + 12);
LABEL_24:
      v14 ^= v17 ^ v16;
      if (++v12 == v13) {
        goto LABEL_27;
      }
    }
  }
  uint64_t v14 = 0;
LABEL_27:
  uint64_t v18 = (sirinluexternal::LanguageVariantResult *)*((void *)this + 1);
  if (v18) {
    uint64_t v19 = sirinluexternal::LanguageVariantResult::hash_value(v18);
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v20 = *((void *)this + 10);
  if (v20) {
    unint64_t v20 = sirinluexternal::NLUSupplementaryOutput::hash_value((sirinluexternal::NLUSupplementaryOutput *)v20);
  }
  return v6 ^ v3 ^ v19 ^ v20 ^ v10 ^ v14;
}

uint64_t sirinluexternalcdm::NluResponse::makeRequestId(uint64_t this)
{
  if (!*(void *)(this + 64)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternalcdm::NluResponse::makeResponseStatus(uint64_t this)
{
  if (!*(void *)(this + 72)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternalcdm::NluResponse::makeLanguageVariantResult(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternalcdm::NluResponse::makeSupplementaryOutput(uint64_t this)
{
  if (!*(void *)(this + 80)) {
    operator new();
  }
  return this;
}

uint64_t sirinluexternal::SystemInformed::formatText(sirinluexternal::SystemInformed *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "entities");
  }
  uint64_t v8 = *((void *)this + 4);
  if (v8) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "task_id");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::SystemInformed::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(const PB::Base **)(this + 32);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v6 = *(const PB::Base ***)(v3 + 8);
  uint64_t v5 = *(const PB::Base ***)(v3 + 16);
  while (v6 != v5)
  {
    uint64_t v7 = *v6++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

uint64_t sirinluexternal::SystemInformed::readFrom(sirinluexternal::SystemInformed *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_24;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        operator new();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
LABEL_24:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_24;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_1C8C06AEC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluexternal::SystemInformed::~SystemInformed(sirinluexternal::SystemInformed *this)
{
  sirinluexternal::SystemInformed::~SystemInformed(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_1F232F270;
  unint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((void *)this + 1))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 1);
    operator delete(*((void **)this + 1));
  }
  PB::Base::~Base(this);
}

double sirinluexternal::SystemInformed::SystemInformed(sirinluexternal::SystemInformed *this)
{
  *(void *)this = &unk_1F232F270;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F270;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

uint64_t sirinluexternal::SystemInformed::SystemInformed(uint64_t this, const sirinluexternal::SystemInformed *a2)
{
  *(void *)this = &unk_1F232F270;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  if (*((void *)a2 + 4)) {
    operator new();
  }
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    operator new();
  }
  return this;
}

void sub_1C8C06E0C(void *a1)
{
}

uint64_t sirinluexternal::SystemInformed::operator=(uint64_t a1, const sirinluexternal::SystemInformed *a2)
{
  if ((const sirinluexternal::SystemInformed *)a1 != a2)
  {
    sirinluexternal::SystemInformed::SystemInformed((uint64_t)v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v7 = v3;
    long long v8 = v4;
    sirinluexternal::SystemInformed::~SystemInformed((sirinluexternal::SystemInformed *)v6);
  }
  return a1;
}

void *sirinluexternal::swap(void *this, sirinluexternal::SystemInformed *a2, sirinluexternal::SystemInformed *a3)
{
  uint64_t v3 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v3;
  uint64_t v4 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v5;
  uint64_t v6 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  return this;
}

uint64_t sirinluexternal::SystemInformed::SystemInformed(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (void **)(a1 + 8);
  *(void *)a1 = &unk_1F232F270;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a2 + 32) = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  if (*v4)
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100](v4);
    operator delete(*v4);
    *uint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluexternal::SystemInformed::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluexternal::SystemInformed::SystemInformed((uint64_t)v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    long long v7 = v3;
    long long v8 = v4;
    sirinluexternal::SystemInformed::~SystemInformed((sirinluexternal::SystemInformed *)v6);
  }
  return a1;
}

uint64_t sirinluexternal::SystemInformed::operator==(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a2 + 32);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v9 = a2 + 8;
  long long v8 = *(void ***)(a2 + 8);
  if (v7 - v6 != *(void *)(v9 + 8) - (void)v8) {
    return 0;
  }
  if (v6 == v7) {
    return 1;
  }
  uint64_t v10 = v6 + 8;
  do
  {
    unint64_t v11 = *v8++;
    uint64_t result = sirinluexternal::UsoGraph::operator==(*(void **)(v10 - 8), v11);
    if (result) {
      BOOL v13 = v10 == v7;
    }
    else {
      BOOL v13 = 1;
    }
    v10 += 8;
  }
  while (!v13);
  return result;
}

uint64_t sirinluexternal::SystemInformed::hash_value(sirinluexternal::SystemInformed *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (!v1)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v1 + 28) & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)(v1 + 28) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v1 + 28) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)(v1 + 8);
  if ((*(unsigned char *)(v1 + 28) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v3 = *(void *)(v1 + 16);
  if ((*(unsigned char *)(v1 + 28) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v4 = *(int *)(v1 + 24);
LABEL_10:
  uint64_t v5 = v3 ^ v2 ^ v4;
LABEL_11:
  uint64_t v6 = (sirinluexternal::UsoGraph **)*((void *)this + 1);
  uint64_t v7 = (sirinluexternal::UsoGraph **)*((void *)this + 2);
  if (v6 == v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = *v6++;
      v8 ^= sirinluexternal::UsoGraph::hash_value(v9);
    }
    while (v6 != v7);
  }
  return v8 ^ v5;
}

uint64_t sirinluexternal::SystemInformed::makeTaskId(uint64_t this)
{
  if (!*(void *)(this + 32)) {
    operator new();
  }
  return this;
}

BOOL SIRINLUINTERNALMentionResolverSpanDataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        if (v9++ >= 9)
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
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v23 = &OBJC_IVAR___SIRINLUINTERNALMentionResolverSpanData__jointScore;
LABEL_32:
        *(void *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_33:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 24) |= 2u;
    uint64_t v21 = *v3;
    unint64_t v22 = *(void *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
      *(void *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v20 = 0;
    }
    uint64_t v23 = &OBJC_IVAR___SIRINLUINTERNALMentionResolverSpanData__modelScore;
    goto LABEL_32;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALResponseStatusReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 3)
      {
        uint64_t v23 = PBReaderReadString();
        unint64_t v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 2)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
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
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 8) = v19;
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

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::formatText(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "contextual_spans");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v2 = *(const PB::Base ***)(this + 8);
  for (uint64_t i = *(const PB::Base ***)(this + 16); v2 != i; this = PB::Writer::writeSubmessage(a2, v5))
    uint64_t v5 = *v2++;
  return this;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::readFrom(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_23;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 1) {
        PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<>();
      }
LABEL_23:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_23;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::~ContextualSpanMatcherResponse(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this)
{
  *(void *)this = &unk_1F232F2C0;
  unint64_t v2 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v2);
  PB::Base::~Base(this);
  JUMPOUT(0x1CB772580);
}

{
  void **v2;
  uint64_t vars8;

  *(void *)this = &unk_1F232F2C0;
  unint64_t v2 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v2);
  PB::Base::~Base(this);
}

{
  void **v2;
  uint64_t vars8;

  *(void *)this = &unk_1F232F2C0;
  unint64_t v2 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v2);
  PB::Base::~Base(this);
}

void *sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse(void *this)
{
  *this = &unk_1F232F2C0;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &unk_1F232F2C0;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void *sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse(void *this, const sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a2)
{
  this[1] = 0;
  *this = &unk_1F232F2C0;
  this[2] = 0;
  this[3] = 0;
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<sirinluinternal::MatchingSpan const&>();
  }
  return this;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::operator=(uint64_t a1, const sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a2)
{
  if ((const sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *)a1 != a2)
  {
    sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse(&v6, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    long long v7 = v3;
    uint64_t v4 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v8;
    uint64_t v8 = v4;
    uint64_t v6 = &unk_1F232F2C0;
    unsigned int v9 = (void **)&v7;
    std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v9);
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

void *sirinluinternalcontextual_span_matcher::swap(void *this, sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a2, sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a3)
{
  uint64_t v3 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  uint64_t v4 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  uint64_t v5 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v5;
  return this;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F2C0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((void **)(a1 + 8));
  *uint64_t v4 = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return a1;
}

{
  _OWORD *v4;

  *(void *)a1 = &unk_1F232F2C0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((void **)(a1 + 8));
  *uint64_t v4 = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v9 = &unk_1F232F2C0;
    long long v10 = 0uLL;
    uint64_t v11 = 0;
    std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((void **)&v10);
    uint64_t v4 = *(void *)(a2 + 24);
    long long v5 = *(_OWORD *)(a2 + 8);
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = 0;
    *(void *)(a2 + 8) = 0;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v5;
    long long v10 = v6;
    uint64_t v7 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v4;
    uint64_t v11 = v7;
    char v12 = (void **)&v10;
    unsigned int v9 = &unk_1F232F2C0;
    std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v12);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

BOOL sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::operator==(uint64_t a1, uint64_t a2)
{
  return PB::PtrVector<sirinluinternal::MatchingSpan>::operator==((uint64_t *)(a1 + 8), *(uint64_t **)(a2 + 8), *(void *)(a2 + 16));
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::hash_value(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this)
{
  uint64_t v1 = (sirinluinternal::MatchingSpan **)*((void *)this + 1);
  unint64_t v2 = (sirinluinternal::MatchingSpan **)*((void *)this + 2);
  if (v1 == v2) {
    return 0;
  }
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *v1++;
    v3 ^= sirinluinternal::MatchingSpan::hash_value(v4);
  }
  while (v1 != v2);
  return v3;
}

BOOL SIRINLUEXTERNALReferenceContextReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            unint64_t v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__contextualReference;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            uint64_t v19 = 0;
            unint64_t v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__contextualReference;
            goto LABEL_41;
          }
        }
        unint64_t v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__contextualReference;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_41:
        *(unsigned char *)(a1 + *v24) = v19 != 0;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 12) |= 2u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        unint64_t v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__disambiguationNeeded;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        uint64_t v19 = 0;
        unint64_t v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__disambiguationNeeded;
        goto LABEL_41;
      }
    }
    unint64_t v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__disambiguationNeeded;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        char v17 = objc_alloc_init(SIRINLUEXTERNALRequestID);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALRequestIDReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
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
    char v17 = *(SIRINLUEXTERNALRequestID **)(a1 + 16);
    *(void *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL SIRINLUEXTERNALRRAnnotationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      if ((v10 >> 3) == 2)
      {
        char v17 = objc_alloc_init(SIRICOMMONStringValue);
        uint64_t v18 = 16;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        char v17 = objc_alloc_init(SIRICOMMONStringValue);
        uint64_t v18 = 8;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || (SIRICOMMONStringValueReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutputReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v17;

        goto LABEL_49;
      case 2u:
        uint64_t v20 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        uint64_t v21 = 16;
        goto LABEL_24;
      case 3u:
        uint64_t v20 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        uint64_t v21 = 32;
LABEL_24:
        objc_storeStrong((id *)(a1 + v21), v20);
        if (PBReaderPlaceMark()
          && (SIRINLUINTERNALNLv4EmbeddingTensorReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_49:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        while (2)
        {
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 == -1 || v26 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              BOOL v14 = v23++ >= 9;
              if (v14)
              {
                uint64_t v24 = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_44:
        *(void *)(a1 + 8) = v24;
        goto LABEL_49;
      case 5u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v14 = v29++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_48:
        *(unsigned char *)(a1 + 40) = v30 != 0;
        goto LABEL_49;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_49;
    }
  }
}

uint64_t sirinluinternal::UtteranceRule::formatText(sirinluinternal::UtteranceRule *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "compare_options");
  }
  if (*((void *)this + 2)) {
    PB::TextFormatter::format();
  }
  long long v6 = (uint64_t *)*((void *)this + 3);
  uint64_t v7 = (uint64_t *)*((void *)this + 4);
  while (v6 != v7)
  {
    uint64_t v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v8 + 32))(v8, a2, "spans_for_named_capture_groups");
  }
  if (*((unsigned char *)this + 52)) {
    PB::TextFormatter::format(a2, "type");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::UtteranceRule::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  if (*(void *)(this + 16)) {
    this = PB::Writer::write();
  }
  if (*(unsigned char *)(v3 + 52)) {
    this = PB::Writer::writeVarInt(a2);
  }
  uint64_t v4 = *(const PB::Base **)(v3 + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  long long v6 = *(const PB::Base ***)(v3 + 24);
  uint64_t v5 = *(const PB::Base ***)(v3 + 32);
  while (v6 != v5)
  {
    uint64_t v7 = *v6++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

uint64_t sirinluinternal::UtteranceRule::readFrom(sirinluinternal::UtteranceRule *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        operator new();
      case 2u:
        *((unsigned char *)this + 52) |= 1u;
        unint64_t v20 = *((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        uint64_t v22 = *(void *)a2;
        if (v20 <= 0xFFFFFFFFFFFFFFF5 && v20 + 10 <= v21)
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          do
          {
            unint64_t v26 = v20 + 1;
            *((void *)a2 + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              goto LABEL_43;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
          }
          while (!v14);
LABEL_39:
          LODWORD(v25) = 0;
          goto LABEL_43;
        }
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v25 = 0;
        if (v21 <= v20) {
          unint64_t v21 = *((void *)a2 + 1);
        }
        break;
      case 3u:
        operator new();
      case 4u:
        operator new();
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v21 == v20)
      {
        LODWORD(v25) = 0;
        *((unsigned char *)a2 + 24) = 1;
        goto LABEL_43;
      }
      unint64_t v30 = v20 + 1;
      char v31 = *(unsigned char *)(v22 + v20);
      *((void *)a2 + 1) = v30;
      v25 |= (unint64_t)(v31 & 0x7F) << v28;
      if ((v31 & 0x80) == 0) {
        break;
      }
      v28 += 7;
      unint64_t v20 = v30;
      BOOL v14 = v29++ > 8;
      if (v14) {
        goto LABEL_39;
      }
    }
    if (*((unsigned char *)a2 + 24)) {
      LODWORD(v25) = 0;
    }
LABEL_43:
    *((_DWORD *)this + 12) = v25;
LABEL_44:
    unint64_t v2 = *((void *)a2 + 1);
    unint64_t v3 = *((void *)a2 + 2);
    int v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0) {
      return v4 == 0;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_21;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_44;
  }
  return result;
}

void sub_1C8C0B768(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluinternal::UtteranceRule::~UtteranceRule(sirinluinternal::UtteranceRule *this)
{
  sirinluinternal::UtteranceRule::~UtteranceRule(this);
  JUMPOUT(0x1CB772580);
}

{
  void **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  *(void *)this = &unk_1F232F310;
  unint64_t v2 = (void **)((char *)this + 24);
  if (*((void *)this + 3))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 3);
    operator delete(*v2);
  }
  unint64_t v3 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  }
  int v4 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  PB::Base::~Base(this);
}

double sirinluinternal::UtteranceRule::UtteranceRule(sirinluinternal::UtteranceRule *this)
{
  *(void *)this = &unk_1F232F310;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F310;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  return result;
}

uint64_t sirinluinternal::UtteranceRule::UtteranceRule(uint64_t this, const sirinluinternal::UtteranceRule *a2)
{
  *(_OWORD *)(this + 8) = 0u;
  *(void *)this = &unk_1F232F310;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  if (*((void *)a2 + 2)) {
    operator new();
  }
  if (*((unsigned char *)a2 + 52))
  {
    int v2 = *((_DWORD *)a2 + 12);
    *(unsigned char *)(this + 52) |= 1u;
    *(_DWORD *)(this + 48) = v2;
  }
  if (*((void *)a2 + 1)) {
    operator new();
  }
  if (*((void *)a2 + 3) != *((void *)a2 + 4)) {
    operator new();
  }
  return this;
}

void sub_1C8C0BB34(void *a1)
{
}

uint64_t sirinluinternal::UtteranceRule::operator=(uint64_t a1, const sirinluinternal::UtteranceRule *a2)
{
  if ((const sirinluinternal::UtteranceRule *)a1 != a2)
  {
    sirinluinternal::UtteranceRule::UtteranceRule((uint64_t)v8, a2);
    uint64_t v3 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = v12;
    uint64_t v12 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v9 = v4;
    long long v10 = v5;
    uint64_t v6 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v11;
    uint64_t v11 = v6;
    sirinluinternal::UtteranceRule::~UtteranceRule((sirinluinternal::UtteranceRule *)v8);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::UtteranceRule *a2, sirinluinternal::UtteranceRule *a3)
{
  int v3 = *(_DWORD *)(this + 52);
  *(_DWORD *)(this + 52) = *((_DWORD *)a2 + 13);
  *((_DWORD *)a2 + 13) = v3;
  uint64_t v4 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 48);
  *(_DWORD *)(this + 48) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  uint64_t v6 = *(void *)(this + 24);
  *(void *)(this + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  uint64_t v7 = *(void *)(this + 32);
  *(void *)(this + 32) = *((void *)a2 + 4);
  *((void *)a2 + 4) = v7;
  uint64_t v8 = *(void *)(this + 40);
  *(void *)(this + 40) = *((void *)a2 + 5);
  *((void *)a2 + 5) = v8;
  return this;
}

uint64_t sirinluinternal::UtteranceRule::UtteranceRule(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F310;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  if (v5) {
    std::default_delete<std::string>::operator()[abi:ne180100](v5);
  }
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = (void **)(a1 + 24);
  if (*(void *)(a1 + 24))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 24));
    operator delete(*v8);
    *uint64_t v8 = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return a1;
}

uint64_t sirinluinternal::UtteranceRule::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::UtteranceRule::UtteranceRule((uint64_t)v8, a2);
    uint64_t v3 = *(void *)(a1 + 48);
    *(void *)(a1 + 48) = v12;
    uint64_t v12 = v3;
    long long v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v9 = v4;
    long long v10 = v5;
    uint64_t v6 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = v11;
    uint64_t v11 = v6;
    sirinluinternal::UtteranceRule::~UtteranceRule((sirinluinternal::UtteranceRule *)v8);
  }
  return a1;
}

BOOL sirinluinternal::UtteranceRule::operator==(uint64_t a1, uint64_t a2)
{
  long long v4 = *(unsigned __int8 **)(a1 + 16);
  long long v5 = *(unsigned __int8 ***)(a2 + 16);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = v4[23];
    if ((v6 & 0x80u) == 0) {
      uint64_t v7 = (unsigned __int8 *)v4[23];
    }
    else {
      uint64_t v7 = (unsigned __int8 *)*((void *)v4 + 1);
    }
    uint64_t v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    int v9 = (char)v8;
    if ((char)v8 < 0) {
      uint64_t v8 = v5[1];
    }
    if (v7 != v8) {
      return 0;
    }
    if (v9 >= 0) {
      long long v10 = *(unsigned __int8 **)(a2 + 16);
    }
    else {
      long long v10 = *v5;
    }
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((void *)v4 + 1))) {
        return 0;
      }
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6) {
          goto LABEL_18;
        }
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  if (*(unsigned char *)(a1 + 52))
  {
    if ((*(unsigned char *)(a2 + 52) & 1) == 0 || *(_DWORD *)(a1 + 48) != *(_DWORD *)(a2 + 48)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 52))
  {
    return 0;
  }
  uint64_t v11 = *(unsigned __int8 **)(a1 + 8);
  uint64_t v12 = *(unsigned __int8 **)(a2 + 8);
  if (!v11)
  {
    if (!v12) {
      goto LABEL_30;
    }
    return 0;
  }
  if (!v12 || !sirinluinternal::CompareOptions::operator==(v11, v12)) {
    return 0;
  }
LABEL_30:
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v16 = a2 + 24;
  char v15 = *(uint64_t **)(a2 + 24);
  if (v14 - v13 != *(void *)(v16 + 8) - (void)v15) {
    return 0;
  }
  if (v13 == v14) {
    return 1;
  }
  uint64_t v17 = v13 + 8;
  do
  {
    uint64_t v18 = *v15++;
    BOOL result = sirinluinternal::AdjacentSpans::operator==(*(void **)(v17 - 8), v18);
    BOOL v20 = !result || v17 == v14;
    v17 += 8;
  }
  while (!v20);
  return result;
}

unint64_t sirinluinternal::UtteranceRule::hash_value(sirinluinternal::UtteranceRule *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    unint64_t v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  }
  else {
    unint64_t v3 = 0;
  }
  if (*((unsigned char *)this + 52)) {
    uint64_t v4 = *((int *)this + 12);
  }
  else {
    uint64_t v4 = 0;
  }
  long long v5 = (unsigned __int8 *)*((void *)this + 1);
  if (!v5)
  {
    uint64_t v9 = 0;
    goto LABEL_17;
  }
  if ((v5[12] & 1) == 0)
  {
    uint64_t v6 = 0;
    if ((v5[12] & 2) != 0) {
      goto LABEL_10;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((v5[12] & 4) != 0) {
      goto LABEL_11;
    }
LABEL_15:
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = v5[8];
  if ((v5[12] & 2) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v7 = v5[9];
  if ((v5[12] & 4) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v8 = v5[10];
LABEL_16:
  uint64_t v9 = v7 ^ v6 ^ v8;
LABEL_17:
  uint64_t v11 = (sirinluinternal::AdjacentSpans **)*((void *)this + 3);
  long long v10 = (sirinluinternal::AdjacentSpans **)*((void *)this + 4);
  if (v11 == v10)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = *v11++;
      v12 ^= sirinluinternal::AdjacentSpans::hash_value(v13);
    }
    while (v11 != v10);
  }
  return v4 ^ v3 ^ v9 ^ v12;
}

uint64_t sirinluinternal::UtteranceRule::makeCompareOptions(uint64_t this)
{
  if (!*(void *)(this + 8)) {
    operator new();
  }
  return this;
}

BOOL SIRINLUINTERNALTokenChainReadFrom(char *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v19 = 8;
LABEL_26:
        BOOL v20 = *(SIRINLUINTERNALToken **)&a1[v19];
        *(void *)&a1[v19] = v18;
LABEL_27:

        goto LABEL_29;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    BOOL v20 = objc_alloc_init(SIRINLUINTERNALToken);
    [a1 addTokens:v20];
    if (!PBReaderPlaceMark() || (SIRINLUINTERNALTokenReadFrom(v20, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t SIRINLUINTERNALSpanDataForNamedCaptureGroupReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 24) |= 2u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_39;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_41:
        uint64_t v32 = 20;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = *(void **)(a1 + 8);
            *(void *)(a1 + 8) = v18;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0) {
            goto LABEL_43;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_45:
        uint64_t v32 = 16;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1C8C0D7DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C8C0D8D8(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C8C0DA24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C8C0DB2C(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C8C0DC28(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C8C0DD1C(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C8C0DE10(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C8C0DF5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C8C0E058(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C8C0E1A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C8C0E2F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C8C0E3E8(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C8C0E49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t SIRICOMMONStringValueReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

void sub_1C8C0E93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C8C0E9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C8C0EA4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C8C0EAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C8C0EB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1C8C0EB84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C8C0EC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sirinluexternal::UsoGraph::formatText(sirinluexternal::UsoGraph *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  long long v5 = (uint64_t *)*((void *)this + 1);
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "alignments");
  }
  char v8 = (uint64_t *)*((void *)this + 4);
  unsigned int v9 = (uint64_t *)*((void *)this + 5);
  while (v8 != v9)
  {
    uint64_t v10 = *v8++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, a2, "edges");
  }
  uint64_t v11 = (uint64_t *)*((void *)this + 7);
  unint64_t v12 = (uint64_t *)*((void *)this + 8);
  while (v11 != v12)
  {
    uint64_t v13 = *v11++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v13 + 32))(v13, a2, "identifiers");
  }
  BOOL v14 = (uint64_t *)*((void *)this + 10);
  int v15 = (uint64_t *)*((void *)this + 11);
  while (v14 != v15)
  {
    uint64_t v16 = *v14++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v16 + 32))(v16, a2, "nodes");
  }
  uint64_t v17 = (uint64_t *)*((void *)this + 13);
  uint64_t v18 = (uint64_t *)*((void *)this + 14);
  while (v17 != v18)
  {
    uint64_t v19 = *v17++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v19 + 32))(v19, a2, "spans");
  }
  uint64_t v20 = *((void *)this + 16);
  if (v20) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v20 + 32))(v20, a2, "version");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluexternal::UsoGraph::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = (void *)this;
  uint64_t v4 = *(const PB::Base **)(this + 128);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  long long v5 = (const PB::Base **)v3[10];
  uint64_t v6 = (const PB::Base **)v3[11];
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  char v8 = (const PB::Base **)v3[4];
  unsigned int v9 = (const PB::Base **)v3[5];
  while (v8 != v9)
  {
    uint64_t v10 = *v8++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  uint64_t v11 = (const PB::Base **)v3[7];
  unint64_t v12 = (const PB::Base **)v3[8];
  while (v11 != v12)
  {
    uint64_t v13 = *v11++;
    this = PB::Writer::writeSubmessage(a2, v13);
  }
  BOOL v14 = (const PB::Base **)v3[1];
  int v15 = (const PB::Base **)v3[2];
  while (v14 != v15)
  {
    uint64_t v16 = *v14++;
    this = PB::Writer::writeSubmessage(a2, v16);
  }
  uint64_t v18 = (const PB::Base **)v3[13];
  uint64_t v17 = (const PB::Base **)v3[14];
  while (v18 != v17)
  {
    uint64_t v19 = *v18++;
    this = PB::Writer::writeSubmessage(a2, v19);
  }
  return this;
}

uint64_t sirinluexternal::UsoGraph::readFrom(sirinluexternal::UsoGraph *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_19;
        }
      }
LABEL_21:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          operator new();
        case 2u:
          operator new();
        case 3u:
          operator new();
        case 4u:
          operator new();
        case 5u:
          operator new();
        case 6u:
          operator new();
        default:
          break;
      }
LABEL_19:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_21;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void sub_1C8C0F674(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluexternal::UsoGraph::~UsoGraph(sirinluexternal::UsoGraph *this)
{
  sirinluexternal::UsoGraph::~UsoGraph(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_1F232F360;
  unint64_t v2 = *((void *)this + 16);
  *((void *)this + 16) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((void *)this + 13))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 13);
    operator delete(*((void **)this + 13));
  }
  if (*((void *)this + 10))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 10);
    operator delete(*((void **)this + 10));
  }
  if (*((void *)this + 7))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 7);
    operator delete(*((void **)this + 7));
  }
  if (*((void *)this + 4))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 4);
    operator delete(*((void **)this + 4));
  }
  if (*((void *)this + 1))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)this + 1);
    operator delete(*((void **)this + 1));
  }
  PB::Base::~Base(this);
}

double sirinluexternal::UsoGraph::UsoGraph(sirinluexternal::UsoGraph *this)
{
  *(void *)this = &unk_1F232F360;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F360;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  return result;
}

uint64_t sirinluexternal::UsoGraph::UsoGraph(uint64_t this, const sirinluexternal::UsoGraph *a2)
{
  *(void *)this = &unk_1F232F360;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_OWORD *)(this + 104) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(_OWORD *)(this + 72) = 0u;
  *(_OWORD *)(this + 88) = 0u;
  *(_OWORD *)(this + 120) = 0u;
  if (*((void *)a2 + 16)) {
    operator new();
  }
  if (*((void *)a2 + 10) != *((void *)a2 + 11)) {
    operator new();
  }
  if (*((void *)a2 + 4) != *((void *)a2 + 5)) {
    operator new();
  }
  if (*((void *)a2 + 7) != *((void *)a2 + 8)) {
    operator new();
  }
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    operator new();
  }
  if (*((void *)a2 + 13) != *((void *)a2 + 14)) {
    operator new();
  }
  return this;
}

void sub_1C8C0FE20(void *a1)
{
}

const sirinluexternal::UsoGraph *sirinluexternal::UsoGraph::operator=(const sirinluexternal::UsoGraph *a1, const sirinluexternal::UsoGraph *a2)
{
  if (a1 != a2)
  {
    sirinluexternal::UsoGraph::UsoGraph((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::UsoGraph *)v5, v3);
    sirinluexternal::UsoGraph::~UsoGraph((sirinluexternal::UsoGraph *)v5);
  }
  return a1;
}

void *sirinluexternal::swap(void *this, sirinluexternal::UsoGraph *a2, sirinluexternal::UsoGraph *a3)
{
  uint64_t v3 = this[16];
  this[16] = *((void *)a2 + 16);
  *((void *)a2 + 16) = v3;
  uint64_t v4 = this[10];
  this[10] = *((void *)a2 + 10);
  *((void *)a2 + 10) = v4;
  uint64_t v5 = this[11];
  this[11] = *((void *)a2 + 11);
  *((void *)a2 + 11) = v5;
  uint64_t v6 = this[12];
  this[12] = *((void *)a2 + 12);
  *((void *)a2 + 12) = v6;
  uint64_t v7 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v7;
  uint64_t v8 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v8;
  uint64_t v9 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v9;
  uint64_t v10 = this[7];
  this[7] = *((void *)a2 + 7);
  *((void *)a2 + 7) = v10;
  uint64_t v11 = this[8];
  this[8] = *((void *)a2 + 8);
  *((void *)a2 + 8) = v11;
  uint64_t v12 = this[9];
  this[9] = *((void *)a2 + 9);
  *((void *)a2 + 9) = v12;
  uint64_t v13 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v13;
  uint64_t v14 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v14;
  uint64_t v15 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v15;
  uint64_t v16 = this[13];
  this[13] = *((void *)a2 + 13);
  *((void *)a2 + 13) = v16;
  uint64_t v17 = this[14];
  this[14] = *((void *)a2 + 14);
  *((void *)a2 + 14) = v17;
  uint64_t v18 = this[15];
  this[15] = *((void *)a2 + 15);
  *((void *)a2 + 15) = v18;
  return this;
}

uint64_t sirinluexternal::UsoGraph::UsoGraph(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (void **)(a1 + 8);
  *(void *)a1 = &unk_1F232F360;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  uint64_t v5 = *(void *)(a2 + 128);
  *(void *)(a2 + 128) = 0;
  uint64_t v6 = *(void *)(a1 + 128);
  *(void *)(a1 + 128) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = (void **)(a1 + 80);
  if (*(void *)(a1 + 80))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 80));
    operator delete(*v7);
    *uint64_t v7 = 0;
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 96) = 0;
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = 0;
  if (*(void *)(a1 + 32))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 32));
    operator delete(*(void **)(a1 + 32));
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  if (*(void *)(a1 + 56))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 56));
    operator delete(*(void **)(a1 + 56));
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
    *(void *)(a1 + 72) = 0;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  if (*(void *)(a1 + 8))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100](v4);
    operator delete(*v4);
    *uint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  if (*(void *)(a1 + 104))
  {
    std::vector<std::unique_ptr<siricommon::StringValue>>::__clear[abi:ne180100]((void *)(a1 + 104));
    operator delete(*(void **)(a1 + 104));
    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 112) = 0;
    *(void *)(a1 + 120) = 0;
  }
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a2 + 104) = 0;
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 120) = 0;
  return a1;
}

void *sirinluexternal::UsoGraph::operator=(void *a1, uint64_t a2)
{
  if (a1 != (void *)a2)
  {
    sirinluexternal::UsoGraph::UsoGraph((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::UsoGraph *)v5, v3);
    sirinluexternal::UsoGraph::~UsoGraph((sirinluexternal::UsoGraph *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::UsoGraph::operator==(void *a1, void *a2)
{
  uint64_t v4 = a1[16];
  uint64_t v5 = a2[16];
  if (v4)
  {
    if (!v5 || !sirinluexternal::SemVer::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v7 = (uint64_t *)a1[10];
  uint64_t v6 = (uint64_t *)a1[11];
  uint64_t v8 = (uint64_t *)a2[10];
  if ((char *)v6 - (char *)v7 != a2[11] - (void)v8) {
    return 0;
  }
  while (v7 != v6)
  {
    uint64_t result = sirinluexternal::UsoNode::operator==(*v7, *v8);
    if (!result) {
      return result;
    }
    ++v7;
    ++v8;
  }
  uint64_t v11 = (uint64_t *)a1[4];
  uint64_t v10 = (uint64_t *)a1[5];
  uint64_t v12 = (uint64_t *)a2[4];
  if ((char *)v10 - (char *)v11 != a2[5] - (void)v12) {
    return 0;
  }
  while (v11 != v10)
  {
    uint64_t result = sirinluexternal::UsoEdge::operator==(*v11, *v12);
    if (!result) {
      return result;
    }
    ++v11;
    ++v12;
  }
  uint64_t v14 = (uint64_t *)a1[7];
  uint64_t v13 = (uint64_t *)a1[8];
  uint64_t v15 = (uint64_t *)a2[7];
  if ((char *)v13 - (char *)v14 != a2[8] - (void)v15) {
    return 0;
  }
  while (v14 != v13)
  {
    uint64_t result = sirinluexternal::UsoEntityIdentifier::operator==(*v14, *v15);
    if (!result) {
      return result;
    }
    ++v14;
    ++v15;
  }
  uint64_t v17 = (uint64_t *)a1[1];
  uint64_t v16 = (uint64_t *)a1[2];
  uint64_t v18 = (uint64_t *)a2[1];
  if ((char *)v16 - (char *)v17 != a2[2] - (void)v18) {
    return 0;
  }
  while (v17 != v16)
  {
    uint64_t result = sirinluexternal::UtteranceAlignment::operator==(*v17, *v18);
    if (!result) {
      return result;
    }
    ++v17;
    ++v18;
  }
  uint64_t v19 = a1[13];
  uint64_t v20 = a1[14];
  uint64_t v22 = a2 + 13;
  unsigned int v21 = (uint64_t *)a2[13];
  if (v20 - v19 != v22[1] - (void)v21) {
    return 0;
  }
  if (v19 == v20) {
    return 1;
  }
  uint64_t v23 = v19 + 8;
  do
  {
    uint64_t v24 = *v21++;
    uint64_t result = sirinluexternal::UsoEntitySpan::operator==(*(void *)(v23 - 8), v24);
    if (result) {
      BOOL v25 = v23 == v20;
    }
    else {
      BOOL v25 = 1;
    }
    v23 += 8;
  }
  while (!v25);
  return result;
}

uint64_t sirinluexternal::UsoGraph::hash_value(sirinluexternal::UsoGraph *this)
{
  uint64_t v2 = *((void *)this + 16);
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v2 + 20) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)(v2 + 20) & 2) != 0) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v4 = 0;
    if ((*(unsigned char *)(v2 + 20) & 4) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = *(unsigned int *)(v2 + 8);
  if ((*(unsigned char *)(v2 + 20) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(unsigned int *)(v2 + 12);
  if ((*(unsigned char *)(v2 + 20) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = *(unsigned int *)(v2 + 16);
LABEL_10:
  uint64_t v6 = v4 ^ v3 ^ v5;
LABEL_11:
  uint64_t v7 = (sirinluexternal::UsoNode **)*((void *)this + 10);
  uint64_t v8 = (sirinluexternal::UsoNode **)*((void *)this + 11);
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *v7++;
      v9 ^= sirinluexternal::UsoNode::hash_value(v10);
    }
    while (v7 != v8);
  }
  uint64_t v11 = (sirinluexternal::UsoEdge **)*((void *)this + 4);
  uint64_t v12 = (sirinluexternal::UsoEdge **)*((void *)this + 5);
  if (v11 == v12)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = *v11++;
      v13 ^= sirinluexternal::UsoEdge::hash_value(v14);
    }
    while (v11 != v12);
  }
  uint64_t v15 = (sirinluexternal::UsoEntityIdentifier **)*((void *)this + 7);
  uint64_t v16 = (sirinluexternal::UsoEntityIdentifier **)*((void *)this + 8);
  if (v15 == v16)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = *v15++;
      v17 ^= sirinluexternal::UsoEntityIdentifier::hash_value(v18);
    }
    while (v15 != v16);
  }
  uint64_t v19 = (sirinluexternal::UtteranceAlignment **)*((void *)this + 1);
  uint64_t v20 = (sirinluexternal::UtteranceAlignment **)*((void *)this + 2);
  if (v19 == v20)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    do
    {
      uint64_t v22 = *v19++;
      v21 ^= sirinluexternal::UtteranceAlignment::hash_value(v22);
    }
    while (v19 != v20);
  }
  uint64_t v24 = (sirinluexternal::UsoEntitySpan **)*((void *)this + 13);
  uint64_t v23 = (sirinluexternal::UsoEntitySpan **)*((void *)this + 14);
  if (v24 == v23)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    do
    {
      char v26 = *v24++;
      v25 ^= sirinluexternal::UsoEntitySpan::hash_value(v26);
    }
    while (v24 != v23);
  }
  return v9 ^ v6 ^ v13 ^ v17 ^ v21 ^ v25;
}

uint64_t sirinluexternal::UsoGraph::makeVersion(uint64_t this)
{
  if (!*(void *)(this + 128)) {
    operator new();
  }
  return this;
}

uint64_t sirinluinternal::TurnInputRule::formatText(sirinluinternal::TurnInputRule *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, a2, "negative_context_rules");
  }
  uint64_t v8 = (uint64_t *)*((void *)this + 4);
  uint64_t v9 = (uint64_t *)*((void *)this + 5);
  while (v8 != v9)
  {
    uint64_t v10 = *v8++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, a2, "positive_context_rules");
  }
  uint64_t v11 = *((void *)this + 7);
  if (v11) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v11 + 32))(v11, a2, "utterance_rule");
  }
  return MEMORY[0x1F4147498](a2);
}

uint64_t sirinluinternal::TurnInputRule::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = (void *)this;
  uint64_t v4 = *(const PB::Base **)(this + 56);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  uint64_t v5 = (const PB::Base **)v3[4];
  uint64_t v6 = (const PB::Base **)v3[5];
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  uint64_t v9 = (const PB::Base **)v3[1];
  uint64_t v8 = (const PB::Base **)v3[2];
  while (v9 != v8)
  {
    uint64_t v10 = *v9++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  return this;
}

uint64_t sirinluinternal::TurnInputRule::readFrom(sirinluinternal::TurnInputRule *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        BOOL v13 = v9++ > 8;
        if (v13) {
          goto LABEL_25;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<>();
      }
      if (v18 == 2) {
        PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<>();
      }
      if (v18 == 1) {
        operator new();
      }
LABEL_25:
      uint64_t result = PB::Reader::skip(a2);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)a2 + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      BOOL v13 = v15++ > 8;
      if (v13) {
        goto LABEL_25;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

void PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<>()
{
}

void sub_1C8C10B78(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sirinluinternal::TurnInputRule::~TurnInputRule(sirinluinternal::TurnInputRule *this)
{
  sirinluinternal::TurnInputRule::~TurnInputRule(this);
  JUMPOUT(0x1CB772580);
}

{
  uint64_t v2;
  void **v3;
  uint64_t vars8;

  *(void *)this = &unk_1F232F3B0;
  unint64_t v2 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unint64_t v3 = (void **)((char *)this + 32);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v3);
  unint64_t v3 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v3);
  PB::Base::~Base(this);
}

double sirinluinternal::TurnInputRule::TurnInputRule(sirinluinternal::TurnInputRule *this)
{
  *(void *)this = &unk_1F232F3B0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F232F3B0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  return result;
}

uint64_t sirinluinternal::TurnInputRule::TurnInputRule(uint64_t this, const sirinluinternal::TurnInputRule *a2)
{
  *(void *)this = &unk_1F232F3B0;
  *(_OWORD *)(this + 8) = 0u;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(void *)(this + 56) = 0;
  if (*((void *)a2 + 7)) {
    operator new();
  }
  if (*((void *)a2 + 4) != *((void *)a2 + 5)) {
    PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<sirinluinternal::ContextRule const&>();
  }
  if (*((void *)a2 + 1) != *((void *)a2 + 2)) {
    PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<sirinluinternal::ContextRule const&>();
  }
  return this;
}

void PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<sirinluinternal::ContextRule const&>()
{
}

void sub_1C8C10F14(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluinternal::TurnInputRule::operator=(uint64_t a1, const sirinluinternal::TurnInputRule *a2)
{
  if ((const sirinluinternal::TurnInputRule *)a1 != a2)
  {
    sirinluinternal::TurnInputRule::TurnInputRule((uint64_t)&v8, a2);
    uint64_t v3 = *(void *)(a1 + 56);
    *(void *)(a1 + 56) = v12;
    uint64_t v12 = v3;
    long long v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    long long v11 = v4;
    long long v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v9 = v5;
    long long v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v10 = v6;
    sirinluinternal::TurnInputRule::~TurnInputRule((sirinluinternal::TurnInputRule *)&v8);
  }
  return a1;
}

void *sirinluinternal::swap(void *this, sirinluinternal::TurnInputRule *a2, sirinluinternal::TurnInputRule *a3)
{
  uint64_t v3 = this[7];
  this[7] = *((void *)a2 + 7);
  *((void *)a2 + 7) = v3;
  uint64_t v4 = this[4];
  this[4] = *((void *)a2 + 4);
  *((void *)a2 + 4) = v4;
  uint64_t v5 = this[5];
  this[5] = *((void *)a2 + 5);
  *((void *)a2 + 5) = v5;
  uint64_t v6 = this[6];
  this[6] = *((void *)a2 + 6);
  *((void *)a2 + 6) = v6;
  uint64_t v7 = this[1];
  this[1] = *((void *)a2 + 1);
  *((void *)a2 + 1) = v7;
  uint64_t v8 = this[2];
  this[2] = *((void *)a2 + 2);
  *((void *)a2 + 2) = v8;
  uint64_t v9 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v9;
  return this;
}

uint64_t sirinluinternal::TurnInputRule::TurnInputRule(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F232F3B0;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (void **)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  uint64_t v6 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((void **)(a1 + 32));
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluinternal::TurnInputRule::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sirinluinternal::TurnInputRule::TurnInputRule((uint64_t)&v8, a2);
    uint64_t v3 = *(void *)(a1 + 56);
    *(void *)(a1 + 56) = v12;
    uint64_t v12 = v3;
    long long v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    long long v11 = v4;
    long long v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    long long v9 = v5;
    long long v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    long long v10 = v6;
    sirinluinternal::TurnInputRule::~TurnInputRule((sirinluinternal::TurnInputRule *)&v8);
  }
  return a1;
}

BOOL sirinluinternal::TurnInputRule::operator==(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a2 + 56);
  if (v4)
  {
    if (!v5 || !sirinluinternal::UtteranceRule::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if (!PB::PtrVector<sirinluinternal::ContextRule>::operator==(a1 + 4, *(uint64_t **)(a2 + 32), *(void *)(a2 + 40))) {
    return 0;
  }
  long long v6 = *(uint64_t **)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  return PB::PtrVector<sirinluinternal::ContextRule>::operator==(a1 + 1, v6, v7);
}

BOOL PB::PtrVector<sirinluinternal::ContextRule>::operator==(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (v4 - *a1 != a3 - (void)a2) {
    return 0;
  }
  if (v3 == v4) {
    return 1;
  }
  uint64_t v5 = a2;
  uint64_t v6 = v3 + 8;
  do
  {
    uint64_t v7 = *v5++;
    BOOL result = sirinluinternal::ContextRule::operator==(*(void *)(v6 - 8), v7);
    BOOL v9 = !result || v6 == v4;
    v6 += 8;
  }
  while (!v9);
  return result;
}

unint64_t sirinluinternal::TurnInputRule::hash_value(sirinluinternal::TurnInputRule *this)
{
  unint64_t v2 = (sirinluinternal::UtteranceRule *)*((void *)this + 7);
  if (v2) {
    unint64_t v3 = sirinluinternal::UtteranceRule::hash_value(v2);
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = (sirinluinternal::ContextRule **)*((void *)this + 4);
  uint64_t v5 = (sirinluinternal::ContextRule **)*((void *)this + 5);
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *v4++;
      v6 ^= sirinluinternal::ContextRule::hash_value(v7);
    }
    while (v4 != v5);
  }
  BOOL v9 = (sirinluinternal::ContextRule **)*((void *)this + 1);
  uint64_t v8 = (sirinluinternal::ContextRule **)*((void *)this + 2);
  if (v9 == v8)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      long long v11 = *v9++;
      v10 ^= sirinluinternal::ContextRule::hash_value(v11);
    }
    while (v9 != v8);
  }
  return v6 ^ v3 ^ v10;
}

uint64_t sirinluinternal::TurnInputRule::makeUtteranceRule(uint64_t this)
{
  if (!*(void *)(this + 56)) {
    operator new();
  }
  return this;
}

uint64_t sub_1C8C113F8()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C8C11408()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C8C11418()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C8C11428()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C8C11438()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1C8C11448()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C8C11458()
{
  return MEMORY[0x1F40E4D80]();
}

uint64_t sub_1C8C11468()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C8C11478()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1C8C11488()
{
  return MEMORY[0x1F40E4E00]();
}

uint64_t sub_1C8C11498()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1C8C114A8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1C8C114B8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C8C114C8()
{
  return MEMORY[0x1F4155D28]();
}

uint64_t sub_1C8C114D8()
{
  return MEMORY[0x1F4155D30]();
}

uint64_t sub_1C8C114E8()
{
  return MEMORY[0x1F4155D40]();
}

uint64_t sub_1C8C114F8()
{
  return MEMORY[0x1F4155D48]();
}

uint64_t sub_1C8C11508()
{
  return MEMORY[0x1F4155D50]();
}

uint64_t sub_1C8C11518()
{
  return MEMORY[0x1F4155D58]();
}

uint64_t sub_1C8C11528()
{
  return MEMORY[0x1F4155D70]();
}

uint64_t sub_1C8C11538()
{
  return MEMORY[0x1F4155D78]();
}

uint64_t sub_1C8C11548()
{
  return MEMORY[0x1F4155D80]();
}

uint64_t sub_1C8C11558()
{
  return MEMORY[0x1F4155D88]();
}

uint64_t sub_1C8C11568()
{
  return MEMORY[0x1F4155D90]();
}

uint64_t sub_1C8C11578()
{
  return MEMORY[0x1F4155D98]();
}

uint64_t sub_1C8C11588()
{
  return MEMORY[0x1F4155DA0]();
}

uint64_t sub_1C8C11598()
{
  return MEMORY[0x1F4155DA8]();
}

uint64_t sub_1C8C115A8()
{
  return MEMORY[0x1F4155DB0]();
}

uint64_t sub_1C8C115B8()
{
  return MEMORY[0x1F4155DC0]();
}

uint64_t sub_1C8C115C8()
{
  return MEMORY[0x1F4155DD0]();
}

uint64_t sub_1C8C115D8()
{
  return MEMORY[0x1F4155DE0]();
}

uint64_t sub_1C8C115E8()
{
  return MEMORY[0x1F4155DE8]();
}

uint64_t sub_1C8C115F8()
{
  return MEMORY[0x1F4155DF0]();
}

uint64_t sub_1C8C11608()
{
  return MEMORY[0x1F4155DF8]();
}

uint64_t sub_1C8C11618()
{
  return MEMORY[0x1F4155E10]();
}

uint64_t sub_1C8C11628()
{
  return MEMORY[0x1F4155E18]();
}

uint64_t sub_1C8C11638()
{
  return MEMORY[0x1F4155E20]();
}

uint64_t sub_1C8C11648()
{
  return MEMORY[0x1F4155E28]();
}

uint64_t sub_1C8C11658()
{
  return MEMORY[0x1F4155E30]();
}

uint64_t sub_1C8C11668()
{
  return MEMORY[0x1F4155E38]();
}

uint64_t sub_1C8C11678()
{
  return MEMORY[0x1F4155E40]();
}

uint64_t sub_1C8C11688()
{
  return MEMORY[0x1F4155E58]();
}

uint64_t sub_1C8C11698()
{
  return MEMORY[0x1F4155E60]();
}

uint64_t sub_1C8C116A8()
{
  return MEMORY[0x1F4155E80]();
}

uint64_t sub_1C8C116B8()
{
  return MEMORY[0x1F4155E88]();
}

uint64_t sub_1C8C116C8()
{
  return MEMORY[0x1F4155E90]();
}

uint64_t sub_1C8C116D8()
{
  return MEMORY[0x1F4155E98]();
}

uint64_t sub_1C8C116E8()
{
  return MEMORY[0x1F4155EA0]();
}

uint64_t sub_1C8C116F8()
{
  return MEMORY[0x1F4155EA8]();
}

uint64_t sub_1C8C11708()
{
  return MEMORY[0x1F4155EB0]();
}

uint64_t sub_1C8C11718()
{
  return MEMORY[0x1F4155EB8]();
}

uint64_t sub_1C8C11728()
{
  return MEMORY[0x1F4155EC0]();
}

uint64_t sub_1C8C11738()
{
  return MEMORY[0x1F4155EC8]();
}

uint64_t sub_1C8C11748()
{
  return MEMORY[0x1F4155ED0]();
}

uint64_t sub_1C8C11758()
{
  return MEMORY[0x1F4155ED8]();
}

uint64_t sub_1C8C11768()
{
  return MEMORY[0x1F4155EE0]();
}

uint64_t sub_1C8C11778()
{
  return MEMORY[0x1F4155EE8]();
}

uint64_t sub_1C8C11788()
{
  return MEMORY[0x1F4155EF0]();
}

uint64_t sub_1C8C11798()
{
  return MEMORY[0x1F4155EF8]();
}

uint64_t sub_1C8C117A8()
{
  return MEMORY[0x1F4155F00]();
}

uint64_t sub_1C8C117B8()
{
  return MEMORY[0x1F4156240]();
}

uint64_t sub_1C8C117C8()
{
  return MEMORY[0x1F41562E0]();
}

uint64_t sub_1C8C117D8()
{
  return MEMORY[0x1F4156310]();
}

uint64_t sub_1C8C117E8()
{
  return MEMORY[0x1F4156318]();
}

uint64_t sub_1C8C117F8()
{
  return MEMORY[0x1F4156320]();
}

uint64_t sub_1C8C11808()
{
  return MEMORY[0x1F4156328]();
}

uint64_t sub_1C8C11818()
{
  return MEMORY[0x1F4156370]();
}

uint64_t sub_1C8C11838()
{
  return MEMORY[0x1F4156380]();
}

uint64_t sub_1C8C11848()
{
  return MEMORY[0x1F41563E0]();
}

uint64_t sub_1C8C11858()
{
  return MEMORY[0x1F41563E8]();
}

uint64_t sub_1C8C11868()
{
  return MEMORY[0x1F41563F0]();
}

uint64_t sub_1C8C11878()
{
  return MEMORY[0x1F41563F8]();
}

uint64_t sub_1C8C11888()
{
  return MEMORY[0x1F4156400]();
}

uint64_t sub_1C8C11898()
{
  return MEMORY[0x1F4156408]();
}

uint64_t sub_1C8C118A8()
{
  return MEMORY[0x1F41565D8]();
}

uint64_t sub_1C8C118B8()
{
  return MEMORY[0x1F4157340]();
}

uint64_t sub_1C8C118C8()
{
  return MEMORY[0x1F4157348]();
}

uint64_t sub_1C8C118D8()
{
  return MEMORY[0x1F4157350]();
}

uint64_t sub_1C8C118E8()
{
  return MEMORY[0x1F4157358]();
}

uint64_t sub_1C8C118F8()
{
  return MEMORY[0x1F4157360]();
}

uint64_t sub_1C8C11908()
{
  return MEMORY[0x1F4157370]();
}

uint64_t sub_1C8C11918()
{
  return MEMORY[0x1F4157378]();
}

uint64_t sub_1C8C11928()
{
  return MEMORY[0x1F4157380]();
}

uint64_t sub_1C8C11938()
{
  return MEMORY[0x1F4157388]();
}

uint64_t sub_1C8C11948()
{
  return MEMORY[0x1F4157390]();
}

uint64_t sub_1C8C11958()
{
  return MEMORY[0x1F4157398]();
}

uint64_t sub_1C8C11968()
{
  return MEMORY[0x1F41573A0]();
}

uint64_t sub_1C8C11978()
{
  return MEMORY[0x1F41573A8]();
}

uint64_t sub_1C8C11988()
{
  return MEMORY[0x1F41573B0]();
}

uint64_t sub_1C8C11998()
{
  return MEMORY[0x1F41573B8]();
}

uint64_t sub_1C8C119A8()
{
  return MEMORY[0x1F41573C0]();
}

uint64_t sub_1C8C119B8()
{
  return MEMORY[0x1F41573C8]();
}

uint64_t sub_1C8C119C8()
{
  return MEMORY[0x1F41573D0]();
}

uint64_t sub_1C8C119D8()
{
  return MEMORY[0x1F41573D8]();
}

uint64_t sub_1C8C119E8()
{
  return MEMORY[0x1F41573E0]();
}

uint64_t sub_1C8C119F8()
{
  return MEMORY[0x1F41573E8]();
}

uint64_t sub_1C8C11A08()
{
  return MEMORY[0x1F41573F0]();
}

uint64_t sub_1C8C11A18()
{
  return MEMORY[0x1F4157400]();
}

uint64_t sub_1C8C11A28()
{
  return MEMORY[0x1F4157408]();
}

uint64_t sub_1C8C11A38()
{
  return MEMORY[0x1F4157418]();
}

uint64_t sub_1C8C11A48()
{
  return MEMORY[0x1F4157420]();
}

uint64_t sub_1C8C11A58()
{
  return MEMORY[0x1F4157430]();
}

uint64_t sub_1C8C11A68()
{
  return MEMORY[0x1F4157438]();
}

uint64_t sub_1C8C11A78()
{
  return MEMORY[0x1F4157440]();
}

uint64_t sub_1C8C11A88()
{
  return MEMORY[0x1F4157448]();
}

uint64_t sub_1C8C11A98()
{
  return MEMORY[0x1F4157470]();
}

uint64_t sub_1C8C11AA8()
{
  return MEMORY[0x1F4157478]();
}

uint64_t sub_1C8C11AB8()
{
  return MEMORY[0x1F4157488]();
}

uint64_t sub_1C8C11AC8()
{
  return MEMORY[0x1F4157490]();
}

uint64_t sub_1C8C11AD8()
{
  return MEMORY[0x1F4157498]();
}

uint64_t sub_1C8C11AE8()
{
  return MEMORY[0x1F41574A0]();
}

uint64_t sub_1C8C11AF8()
{
  return MEMORY[0x1F41574B0]();
}

uint64_t sub_1C8C11B08()
{
  return MEMORY[0x1F41574B8]();
}

uint64_t sub_1C8C11B18()
{
  return MEMORY[0x1F41574C8]();
}

uint64_t sub_1C8C11B28()
{
  return MEMORY[0x1F41574D0]();
}

uint64_t sub_1C8C11B38()
{
  return MEMORY[0x1F41574D8]();
}

uint64_t sub_1C8C11B48()
{
  return MEMORY[0x1F4157608]();
}

uint64_t sub_1C8C11B58()
{
  return MEMORY[0x1F4157610]();
}

uint64_t sub_1C8C11B68()
{
  return MEMORY[0x1F4157618]();
}

uint64_t sub_1C8C11B78()
{
  return MEMORY[0x1F4157620]();
}

uint64_t sub_1C8C11B88()
{
  return MEMORY[0x1F4157628]();
}

uint64_t sub_1C8C11B98()
{
  return MEMORY[0x1F4157630]();
}

uint64_t sub_1C8C11BA8()
{
  return MEMORY[0x1F4157638]();
}

uint64_t sub_1C8C11BB8()
{
  return MEMORY[0x1F4157640]();
}

uint64_t sub_1C8C11BC8()
{
  return MEMORY[0x1F4157648]();
}

uint64_t sub_1C8C11BD8()
{
  return MEMORY[0x1F4157650]();
}

uint64_t sub_1C8C11BE8()
{
  return MEMORY[0x1F4157658]();
}

uint64_t sub_1C8C11BF8()
{
  return MEMORY[0x1F4157660]();
}

uint64_t sub_1C8C11C08()
{
  return MEMORY[0x1F4157668]();
}

uint64_t sub_1C8C11C18()
{
  return MEMORY[0x1F4157670]();
}

uint64_t sub_1C8C11C28()
{
  return MEMORY[0x1F4157678]();
}

uint64_t sub_1C8C11C38()
{
  return MEMORY[0x1F4126E78]();
}

uint64_t sub_1C8C11C48()
{
  return MEMORY[0x1F4126E80]();
}

uint64_t sub_1C8C11C58()
{
  return MEMORY[0x1F4126E88]();
}

uint64_t sub_1C8C11C68()
{
  return MEMORY[0x1F4126E90]();
}

uint64_t sub_1C8C11C78()
{
  return MEMORY[0x1F4126E98]();
}

uint64_t sub_1C8C11C88()
{
  return MEMORY[0x1F4126EA0]();
}

uint64_t sub_1C8C11C98()
{
  return MEMORY[0x1F4126EB0]();
}

uint64_t sub_1C8C11CA8()
{
  return MEMORY[0x1F4126EB8]();
}

uint64_t sub_1C8C11CB8()
{
  return MEMORY[0x1F4126EC0]();
}

uint64_t sub_1C8C11CC8()
{
  return MEMORY[0x1F4126EC8]();
}

uint64_t sub_1C8C11CD8()
{
  return MEMORY[0x1F4126ED8]();
}

uint64_t sub_1C8C11CE8()
{
  return MEMORY[0x1F4126EE0]();
}

uint64_t sub_1C8C11CF8()
{
  return MEMORY[0x1F4126EE8]();
}

uint64_t sub_1C8C11D08()
{
  return MEMORY[0x1F4126EF0]();
}

uint64_t sub_1C8C11D18()
{
  return MEMORY[0x1F4126F08]();
}

uint64_t sub_1C8C11D28()
{
  return MEMORY[0x1F4126F10]();
}

uint64_t sub_1C8C11D38()
{
  return MEMORY[0x1F4126F18]();
}

uint64_t sub_1C8C11D48()
{
  return MEMORY[0x1F4126F20]();
}

uint64_t sub_1C8C11D58()
{
  return MEMORY[0x1F4126F38]();
}

uint64_t sub_1C8C11D68()
{
  return MEMORY[0x1F4126F40]();
}

uint64_t sub_1C8C11D78()
{
  return MEMORY[0x1F4126F48]();
}

uint64_t sub_1C8C11D88()
{
  return MEMORY[0x1F4126F50]();
}

uint64_t sub_1C8C11D98()
{
  return MEMORY[0x1F4126F60]();
}

uint64_t sub_1C8C11DA8()
{
  return MEMORY[0x1F4126F68]();
}

uint64_t sub_1C8C11DB8()
{
  return MEMORY[0x1F4126F70]();
}

uint64_t sub_1C8C11DC8()
{
  return MEMORY[0x1F4126F78]();
}

uint64_t sub_1C8C11DD8()
{
  return MEMORY[0x1F4126F80]();
}

uint64_t sub_1C8C11DE8()
{
  return MEMORY[0x1F4126F88]();
}

uint64_t sub_1C8C11DF8()
{
  return MEMORY[0x1F4126FC0]();
}

uint64_t sub_1C8C11E08()
{
  return MEMORY[0x1F4127060]();
}

uint64_t _s12SiriNLUTypes0A40_Nlu_Internal_NlRouter_OverrideMatchRuleV16PlannerPromptingVAEycfC_0()
{
  return MEMORY[0x1F4127078]();
}

uint64_t sub_1C8C11E28()
{
  return MEMORY[0x1F4127088]();
}

uint64_t sub_1C8C11E38()
{
  return MEMORY[0x1F41270F8]();
}

uint64_t sub_1C8C11E48()
{
  return MEMORY[0x1F4127100]();
}

uint64_t sub_1C8C11E58()
{
  return MEMORY[0x1F4127110]();
}

uint64_t sub_1C8C11E68()
{
  return MEMORY[0x1F4127118]();
}

uint64_t sub_1C8C11E78()
{
  return MEMORY[0x1F4127138]();
}

uint64_t sub_1C8C11EA8()
{
  return MEMORY[0x1F4127180]();
}

uint64_t sub_1C8C11EB8()
{
  return MEMORY[0x1F4127190]();
}

uint64_t sub_1C8C11EC8()
{
  return MEMORY[0x1F4127198]();
}

uint64_t sub_1C8C11ED8()
{
  return MEMORY[0x1F41271A0]();
}

uint64_t sub_1C8C11EE8()
{
  return MEMORY[0x1F41271A8]();
}

uint64_t sub_1C8C11EF8()
{
  return MEMORY[0x1F41271B0]();
}

uint64_t sub_1C8C11F08()
{
  return MEMORY[0x1F41271D8]();
}

uint64_t sub_1C8C11F18()
{
  return MEMORY[0x1F41271F0]();
}

uint64_t sub_1C8C11F28()
{
  return MEMORY[0x1F4127208]();
}

uint64_t sub_1C8C11F38()
{
  return MEMORY[0x1F4127218]();
}

uint64_t sub_1C8C11F48()
{
  return MEMORY[0x1F4127248]();
}

uint64_t sub_1C8C11F58()
{
  return MEMORY[0x1F4127258]();
}

uint64_t sub_1C8C11F68()
{
  return MEMORY[0x1F4127268]();
}

uint64_t sub_1C8C11F78()
{
  return MEMORY[0x1F4127280]();
}

uint64_t sub_1C8C11F88()
{
  return MEMORY[0x1F4127290]();
}

uint64_t sub_1C8C11F98()
{
  return MEMORY[0x1F4127298]();
}

uint64_t sub_1C8C11FA8()
{
  return MEMORY[0x1F41272A8]();
}

uint64_t sub_1C8C11FB8()
{
  return MEMORY[0x1F41272C8]();
}

uint64_t sub_1C8C11FC8()
{
  return MEMORY[0x1F41272E0]();
}

uint64_t sub_1C8C11FD8()
{
  return MEMORY[0x1F4127300]();
}

uint64_t sub_1C8C11FE8()
{
  return MEMORY[0x1F4127320]();
}

uint64_t sub_1C8C11FF8()
{
  return MEMORY[0x1F4127330]();
}

uint64_t sub_1C8C12008()
{
  return MEMORY[0x1F4127340]();
}

uint64_t sub_1C8C12018()
{
  return MEMORY[0x1F4127348]();
}

uint64_t sub_1C8C12028()
{
  return MEMORY[0x1F4127358]();
}

uint64_t sub_1C8C12048()
{
  return MEMORY[0x1F4127398]();
}

uint64_t sub_1C8C12058()
{
  return MEMORY[0x1F4127408]();
}

uint64_t sub_1C8C12068()
{
  return MEMORY[0x1F4127410]();
}

uint64_t sub_1C8C12078()
{
  return MEMORY[0x1F4127418]();
}

uint64_t sub_1C8C12088()
{
  return MEMORY[0x1F4127440]();
}

uint64_t sub_1C8C12098()
{
  return MEMORY[0x1F4127458]();
}

uint64_t sub_1C8C120A8()
{
  return MEMORY[0x1F4127460]();
}

uint64_t sub_1C8C120B8()
{
  return MEMORY[0x1F4127468]();
}

uint64_t sub_1C8C120C8()
{
  return MEMORY[0x1F4127488]();
}

uint64_t sub_1C8C120E8()
{
  return MEMORY[0x1F4127498]();
}

uint64_t sub_1C8C120F8()
{
  return MEMORY[0x1F41274A8]();
}

uint64_t sub_1C8C12108()
{
  return MEMORY[0x1F41274B8]();
}

uint64_t sub_1C8C12118()
{
  return MEMORY[0x1F41274C8]();
}

uint64_t sub_1C8C12128()
{
  return MEMORY[0x1F41274D0]();
}

uint64_t sub_1C8C12138()
{
  return MEMORY[0x1F41274D8]();
}

uint64_t sub_1C8C12148()
{
  return MEMORY[0x1F41274E8]();
}

uint64_t sub_1C8C12158()
{
  return MEMORY[0x1F4127500]();
}

uint64_t sub_1C8C12168()
{
  return MEMORY[0x1F4127508]();
}

uint64_t sub_1C8C12178()
{
  return MEMORY[0x1F4127510]();
}

uint64_t sub_1C8C12188()
{
  return MEMORY[0x1F4127518]();
}

uint64_t sub_1C8C12198()
{
  return MEMORY[0x1F4127520]();
}

uint64_t sub_1C8C121A8()
{
  return MEMORY[0x1F4127528]();
}

uint64_t sub_1C8C121B8()
{
  return MEMORY[0x1F4127530]();
}

uint64_t sub_1C8C121C8()
{
  return MEMORY[0x1F4127538]();
}

uint64_t sub_1C8C121D8()
{
  return MEMORY[0x1F4127540]();
}

uint64_t sub_1C8C121E8()
{
  return MEMORY[0x1F4127548]();
}

uint64_t sub_1C8C121F8()
{
  return MEMORY[0x1F4127550]();
}

uint64_t sub_1C8C12208()
{
  return MEMORY[0x1F4127558]();
}

uint64_t sub_1C8C12218()
{
  return MEMORY[0x1F4127560]();
}

uint64_t sub_1C8C12228()
{
  return MEMORY[0x1F4127568]();
}

uint64_t sub_1C8C12238()
{
  return MEMORY[0x1F4127570]();
}

uint64_t sub_1C8C12248()
{
  return MEMORY[0x1F4127578]();
}

uint64_t sub_1C8C12258()
{
  return MEMORY[0x1F4127580]();
}

uint64_t sub_1C8C12268()
{
  return MEMORY[0x1F4127588]();
}

uint64_t sub_1C8C12278()
{
  return MEMORY[0x1F4127590]();
}

uint64_t sub_1C8C12288()
{
  return MEMORY[0x1F4127598]();
}

uint64_t sub_1C8C12298()
{
  return MEMORY[0x1F41275A0]();
}

uint64_t sub_1C8C122A8()
{
  return MEMORY[0x1F41275A8]();
}

uint64_t sub_1C8C122B8()
{
  return MEMORY[0x1F41275B0]();
}

uint64_t sub_1C8C122C8()
{
  return MEMORY[0x1F41275B8]();
}

uint64_t sub_1C8C122D8()
{
  return MEMORY[0x1F41275C0]();
}

uint64_t sub_1C8C122E8()
{
  return MEMORY[0x1F41275C8]();
}

uint64_t sub_1C8C122F8()
{
  return MEMORY[0x1F41275D0]();
}

uint64_t sub_1C8C12308()
{
  return MEMORY[0x1F41275D8]();
}

uint64_t sub_1C8C12318()
{
  return MEMORY[0x1F41275E0]();
}

uint64_t sub_1C8C12328()
{
  return MEMORY[0x1F41275E8]();
}

uint64_t sub_1C8C12338()
{
  return MEMORY[0x1F41275F0]();
}

uint64_t sub_1C8C12348()
{
  return MEMORY[0x1F41275F8]();
}

uint64_t sub_1C8C12358()
{
  return MEMORY[0x1F4127600]();
}

uint64_t sub_1C8C12368()
{
  return MEMORY[0x1F4127608]();
}

uint64_t sub_1C8C12378()
{
  return MEMORY[0x1F4127610]();
}

uint64_t sub_1C8C12388()
{
  return MEMORY[0x1F4127618]();
}

uint64_t sub_1C8C12398()
{
  return MEMORY[0x1F4127620]();
}

uint64_t sub_1C8C123A8()
{
  return MEMORY[0x1F4127628]();
}

uint64_t sub_1C8C123B8()
{
  return MEMORY[0x1F4127630]();
}

uint64_t sub_1C8C123C8()
{
  return MEMORY[0x1F4127638]();
}

uint64_t sub_1C8C123D8()
{
  return MEMORY[0x1F4127640]();
}

uint64_t sub_1C8C123E8()
{
  return MEMORY[0x1F4127648]();
}

uint64_t sub_1C8C123F8()
{
  return MEMORY[0x1F4127650]();
}

uint64_t sub_1C8C12408()
{
  return MEMORY[0x1F4127658]();
}

uint64_t sub_1C8C12418()
{
  return MEMORY[0x1F4127660]();
}

uint64_t sub_1C8C12428()
{
  return MEMORY[0x1F4127678]();
}

uint64_t sub_1C8C12438()
{
  return MEMORY[0x1F4127680]();
}

uint64_t sub_1C8C12448()
{
  return MEMORY[0x1F4127690]();
}

uint64_t sub_1C8C12458()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1C8C12468()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1C8C12478()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1C8C12488()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C8C12498()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C8C124A8()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1C8C124B8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1C8C124C8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C8C124D8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C8C124E8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C8C124F8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1C8C12508()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1C8C12518()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1C8C12528()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C8C12538()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C8C12548()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C8C12558()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1C8C12568()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C8C12578()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C8C12588()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1C8C12598()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C8C125A8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C8C125B8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C8C125C8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C8C125D8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C8C125E8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C8C125F8()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C8C12608()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C8C12618()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return MEMORY[0x1F41471C8]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBHashBytes()
{
  return MEMORY[0x1F4147258]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1F4147328]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1F4147330]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1F4147338]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1F4147340]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1F4147348]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1F4147350]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1F4147360]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1F4147368]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1F4147370]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1F4147378]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1F4147380]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1F41473D0]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1F41473D8]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1F41473E0]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1F41473E8]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1F41473F0]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1F41473F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1F4147448](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x1F4147450]();
}

{
  return MEMORY[0x1F4147458]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1F4147460](this, a2);
}

{
  return MEMORY[0x1F4147478](this, a2);
}

{
  return MEMORY[0x1F4147480](this, a2);
}

{
  return MEMORY[0x1F4147488](this, a2);
}

{
  return MEMORY[0x1F4147490](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x1F4147468](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return MEMORY[0x1F4147470](this, a2, a3);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Data::Data()
{
  return MEMORY[0x1F41474B8]();
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x1F41474C0]();
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x1F41474C8]();
}

{
  return MEMORY[0x1F41474D0]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x1F41474E0](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x1F41474E8]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1F41474F0](this, a2);
}

uint64_t PB::Writer::writeFixed(PB::Writer *this)
{
  return MEMORY[0x1F4147500](this);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x1F4147510](this);
}

{
  return MEMORY[0x1F4147518](this);
}

{
  return MEMORY[0x1F4147528](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x1F4147530](this, a2);
}

uint64_t PB::Writer::write()
{
  return MEMORY[0x1F4147538]();
}

{
  return MEMORY[0x1F4147540]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x1F4147550](this);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2)
{
  return MEMORY[0x1F4147558](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2)
{
  return MEMORY[0x1F4147560](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1F4147578](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t siri::ontology::UsoGraphNode::setSuccessor()
{
  return MEMORY[0x1F41576C8]();
}

uint64_t siri::ontology::UsoEntityNode::addEntitySpan()
{
  return MEMORY[0x1F41576D0]();
}

uint64_t siri::ontology::UsoEntityNode::addIdentifier()
{
  return MEMORY[0x1F41576D8]();
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment()
{
  return MEMORY[0x1F41576E8]();
}

uint64_t siri::ontology::UsoEntitySpan::addAlternative()
{
  return MEMORY[0x1F4157700]();
}

uint64_t siri::ontology::UsoEntitySpan::addSpanProperty()
{
  return MEMORY[0x1F4157708]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEdgeName()
{
  return MEMORY[0x1F4157710]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomVerbName()
{
  return MEMORY[0x1F4157718]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEntityName()
{
  return MEMORY[0x1F4157720]();
}

uint64_t siri::ontology::OntologyBaseException::OntologyBaseException()
{
  return MEMORY[0x1F4157728]();
}

uint64_t siri::ontology::UsoUtteranceAlignment::addSpan()
{
  return MEMORY[0x1F4157730]();
}

uint64_t siri::ontology::getSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x1F4157738](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::primitive_String(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1F41578A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::primitive_Integer(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1F41578C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Root(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1F4157D50](this);
}

uint64_t siri::ontology::UsoGraph::createIntNode()
{
  return MEMORY[0x1F4157D58]();
}

uint64_t siri::ontology::UsoGraph::createTaskNode()
{
  return MEMORY[0x1F4157D60]();
}

uint64_t siri::ontology::UsoGraph::createEntityNode()
{
  return MEMORY[0x1F4157D68]();
}

uint64_t siri::ontology::UsoGraph::createStringNode()
{
  return MEMORY[0x1F4157D70]();
}

uint64_t siri::ontology::UsoGraph::createOperatorNode()
{
  return MEMORY[0x1F4157D78]();
}

uint64_t siri::ontology::UsoGraph::UsoGraph()
{
  return MEMORY[0x1F4157D80]();
}

{
  return MEMORY[0x1F4157D88]();
}

void siri::ontology::UsoGraph::~UsoGraph(siri::ontology::UsoGraph *this)
{
}

uint64_t siri::ontology::operator==()
{
  return MEMORY[0x1F4157D98]();
}

uint64_t PB::Data::operator==()
{
  return MEMORY[0x1F4147588]();
}

uint64_t siri::ontology::UsoEntityNode::getEntitySpans(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1F4157DA8](this);
}

uint64_t siri::ontology::UsoEntityNode::getIdentifiers(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1F4157DB0](this);
}

uint64_t siri::ontology::UsoEntityNode::getUtteranceAlignment(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1F4157DB8](this);
}

uint64_t siri::ontology::UsoEntitySpan::getAlternatives(siri::ontology::UsoEntitySpan *this)
{
  return MEMORY[0x1F4157DC0](this);
}

uint64_t siri::ontology::UsoEntitySpan::getSpanProperties(siri::ontology::UsoEntitySpan *this)
{
  return MEMORY[0x1F4157DC8](this);
}

uint64_t siri::ontology::UsoVocabManager::getEdgeName(siri::ontology::UsoVocabManager *this)
{
  return MEMORY[0x1F4157DD8](this);
}

uint64_t siri::ontology::UsoVocabManager::getNodeName(siri::ontology::UsoVocabManager *this)
{
  return MEMORY[0x1F4157DE8](this);
}

uint64_t siri::ontology::UsoVocabManager::getVerbName(siri::ontology::UsoVocabManager *this)
{
  return MEMORY[0x1F4157DF8](this);
}

uint64_t siri::ontology::UsoUtteranceAlignment::getSpans(siri::ontology::UsoUtteranceAlignment *this)
{
  return MEMORY[0x1F4157E00](this);
}

uint64_t siri::ontology::UsoGraph::prettyPrint()
{
  return MEMORY[0x1F4157E08]();
}

uint64_t siri::ontology::UsoGraph::deepCopyToGraph()
{
  return MEMORY[0x1F4157E28]();
}

uint64_t siri::ontology::UsoGraph::getEdges(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x1F4157E40](this);
}

uint64_t siri::ontology::UsoGraph::getNodes(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x1F4157E48](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4C0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE98](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}