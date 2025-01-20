BOOL OTICDPRecordSilentContextReadFrom(uint64_t a1, uint64_t a2)
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
  OTCDPRecoveryInformation *v17;

  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(OTCDPRecoveryInformation);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (OTCDPRecoveryInformationReadFrom((uint64_t)v17, a2) & 1) == 0) {
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
    v17 = objc_alloc_init(OTEscrowAuthenticationInformation);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (OTEscrowAuthenticationInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTWalrusReadFrom(uint64_t a1, uint64_t a2)
{
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
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v19 != 0;
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

BOOL OTSecureElementPeerIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTEscrowAuthenticationInformationReadFrom(uint64_t a1, uint64_t a2)
{
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_42;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_42;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_42;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_42;
        case 5u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 68) |= 1u;
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
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_46:
          BOOL v33 = v22 != 0;
          uint64_t v34 = 64;
          goto LABEL_51;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 68) |= 2u;
          break;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_42;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_42;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
LABEL_42:
          v32 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_48;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          uint64_t v28 = 0;
          goto LABEL_50;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_48:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v28 = 0;
      }
LABEL_50:
      BOOL v33 = v28 != 0;
      uint64_t v34 = 65;
LABEL_51:
      *(unsigned char *)(a1 + v34) = v33;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24;
        goto LABEL_45;
      case 2u:
        char v20 = objc_alloc_init(OTEscrowRecordMetadataClientMetadata);
        objc_storeStrong((id *)(a1 + 56), v20);
        if (!PBReaderPlaceMark()
          || (OTEscrowRecordMetadataClientMetadataReadFrom((uint64_t)v20, a2) & 1) == 0)
        {
          goto LABEL_60;
        }
        goto LABEL_48;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 96) |= 2u;
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
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_52:
        uint64_t v33 = 16;
        goto LABEL_57;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_45;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 96) |= 1u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_56:
        uint64_t v33 = 8;
LABEL_57:
        *(void *)(a1 + v33) = v23;
        goto LABEL_58;
      case 6u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 64;
        goto LABEL_45;
      case 7u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 80;
        goto LABEL_45;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_45;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 88;
        goto LABEL_45;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
LABEL_45:
        v32 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_58;
      case 0xBu:
        char v20 = objc_alloc_init(OTEscrowRecordMetadataPasscodeGeneration);
        objc_storeStrong((id *)(a1 + 72), v20);
        if (PBReaderPlaceMark()
          && (OTEscrowRecordMetadataPasscodeGenerationReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
LABEL_48:
          PBReaderRecallMark();

LABEL_58:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_60:

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

BOOL OTAccountSettingsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = objc_alloc_init(OTWalrus);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (OTWalrusReadFrom((uint64_t)v17, a2) & 1) == 0) {
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
    uint64_t v17 = objc_alloc_init(OTWebAccess);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (OTWebAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id getkSecureBackupEscrowDateKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupEscrowDateKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupEscrowDateKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowDateKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupEscrowDateKey");
    getkSecureBackupEscrowDateKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupRemainingAttemptsKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr;
  if (!getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupRemainingAttemptsKey");
    getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupRecordLabelKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupRecordLabelKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupRecordLabelKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordLabelKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupRecordLabelKey");
    getkSecureBackupRecordLabelKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupRecordStatusKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordStatusKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupRecordStatusKey");
    getkSecureBackupRecordStatusKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupRecordIDKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupRecordIDKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupRecordIDKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupRecordIDKey");
    getkSecureBackupRecordIDKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupPeerInfoSerialNumberKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr;
  if (!getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupPeerInfoSerialNumberKey");
    getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupCoolOffEndKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupCoolOffEndKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupCoolOffEndKeySymbolLoc_ptr;
  if (!getkSecureBackupCoolOffEndKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupCoolOffEndKey");
    getkSecureBackupCoolOffEndKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupRecoveryStatusKey()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkSecureBackupRecoveryStatusKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupRecoveryStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecoveryStatusKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupRecoveryStatusKey");
    getkSecureBackupRecoveryStatusKeySymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

void *__getkSecureBackupRecoveryStatusKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupRecoveryStatusKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecoveryStatusKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CloudServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CloudServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E58FE1F0;
    uint64_t v5 = 0;
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v1 = (void *)v3[0];
    uint64_t v0 = CloudServicesLibraryCore_frameworkLibrary;
    if (CloudServicesLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CloudServicesLibraryCore_frameworkLibrary;
}

uint64_t __CloudServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkSecureBackupCoolOffEndKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupCoolOffEndKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupCoolOffEndKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupPeerInfoSerialNumberKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRecordIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupRecordIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecordIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRecordStatusKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupRecordStatusKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecordStatusKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRecordLabelKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupRecordLabelKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecordLabelKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRemainingAttemptsKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupRemainingAttemptsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupEscrowDateKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupEscrowDateKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupEscrowDateKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkSecureBackupClientMetadataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupClientMetadataKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupClientMetadataKeySymbolLoc_ptr;
  if (!getkSecureBackupClientMetadataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupClientMetadataKey");
    getkSecureBackupClientMetadataKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupUsesMultipleiCSCKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUsesMultipleiCSCKey");
    getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupBottleIDKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupBottleIDKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupBottleIDKeySymbolLoc_ptr;
  if (!getkSecureBackupBottleIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupBottleIDKey");
    getkSecureBackupBottleIDKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupEscrowedSPKIKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupEscrowedSPKIKey");
    getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupPeerInfoDataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupPeerInfoDataKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupPeerInfoDataKeySymbolLoc_ptr;
  if (!getkSecureBackupPeerInfoDataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupPeerInfoDataKey");
    getkSecureBackupPeerInfoDataKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupSerialNumberKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupSerialNumberKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupSerialNumberKeySymbolLoc_ptr;
  if (!getkSecureBackupSerialNumberKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupSerialNumberKey");
    getkSecureBackupSerialNumberKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupBuildVersionKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupBuildVersionKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupBuildVersionKeySymbolLoc_ptr;
  if (!getkSecureBackupBuildVersionKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupBuildVersionKey");
    getkSecureBackupBuildVersionKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupPasscodeGenerationKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr;
  if (!getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupPasscodeGenerationKey");
    getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupNumericPassphraseLengthKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  if (!getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupNumericPassphraseLengthKey");
    getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupUsesComplexPassphraseKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUsesComplexPassphraseKey");
    getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupUsesNumericPassphraseKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUsesNumericPassphraseKey");
    getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

void *__getkSecureBackupUsesNumericPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupUsesNumericPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesComplexPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupUsesComplexPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupNumericPassphraseLengthKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupNumericPassphraseLengthKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupPasscodeGenerationKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupPasscodeGenerationKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupBuildVersionKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupBuildVersionKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupBuildVersionKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupSerialNumberKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupSerialNumberKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupSerialNumberKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupPeerInfoDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupPeerInfoDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupPeerInfoDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupEscrowedSPKIKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupEscrowedSPKIKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupBottleIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupBottleIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupBottleIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesMultipleiCSCKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupUsesMultipleiCSCKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupClientMetadataKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupClientMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupClientMetadataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkSecureBackupPassphraseKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupPassphraseKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupPassphraseKey");
    getkSecureBackupPassphraseKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupUseCachedPassphraseKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUseCachedPassphraseKey");
    getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupRecoveryKeyKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
  if (!getkSecureBackupRecoveryKeyKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupRecoveryKeyKey");
    getkSecureBackupRecoveryKeyKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupUsesRecoveryKeyKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupUsesRecoveryKeyKey");
    getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupSilentRecoveryAttemptKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr;
  if (!getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupSilentRecoveryAttemptKey");
    getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupContainsiCDPDataKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr;
  if (!getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupContainsiCDPDataKey");
    getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupNonViableRepairKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupNonViableRepairKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupNonViableRepairKeySymbolLoc_ptr;
  if (!getkSecureBackupNonViableRepairKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupNonViableRepairKey");
    getkSecureBackupNonViableRepairKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

void *__getkSecureBackupNonViableRepairKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupNonViableRepairKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupNonViableRepairKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupContainsiCDPDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupContainsiCDPDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupSilentRecoveryAttemptKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUsesRecoveryKeyKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupUsesRecoveryKeyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRecoveryKeyKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupRecoveryKeyKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecoveryKeyKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupUseCachedPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupUseCachedPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupPassphraseKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupPassphraseKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupPassphraseKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkSecureBackupAuthenticationAppleID()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationAppleID");
    getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupAuthenticationAuthToken()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationAuthToken");
    getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupAuthenticationDSID()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationDSIDSymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupAuthenticationDSIDSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationDSIDSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationDSID");
    getkSecureBackupAuthenticationDSIDSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupAuthenticationEscrowProxyURL()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationEscrowProxyURL");
    getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupAuthenticationiCloudEnvironment()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationiCloudEnvironment");
    getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupAuthenticationPassword()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationPasswordSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupAuthenticationPassword");
    getkSecureBackupAuthenticationPasswordSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupFMiPUUIDKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupFMiPUUIDKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupFMiPUUIDKeySymbolLoc_ptr;
  if (!getkSecureBackupFMiPUUIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupFMiPUUIDKey");
    getkSecureBackupFMiPUUIDKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupFMiPRecoveryKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr;
  if (!getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupFMiPRecoveryKey");
    getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getkSecureBackupIDMSRecoveryKey()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr;
  uint64_t v8 = getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr;
  if (!getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v6[3] = (uint64_t)dlsym(v1, "kSecureBackupIDMSRecoveryKey");
    getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    dlerror();
    long long v4 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

void *__getkSecureBackupIDMSRecoveryKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupIDMSRecoveryKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupFMiPRecoveryKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupFMiPRecoveryKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupFMiPUUIDKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupFMiPUUIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupFMiPUUIDKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationPasswordSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationPassword");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationPasswordSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationiCloudEnvironment");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationEscrowProxyURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationDSIDSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationDSID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationDSIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationAuthTokenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationAuthToken");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupAuthenticationAppleIDSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary();
  uint64_t result = dlsym(v2, "kSecureBackupAuthenticationAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OTEscrowRecordMetadataClientMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
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
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 104) |= 2u;
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
              goto LABEL_65;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_67;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_65:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_67:
          uint64_t v47 = 16;
          goto LABEL_84;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 104) |= 4u;
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
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_71:
          uint64_t v47 = 24;
          goto LABEL_84;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 104) |= 8u;
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
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_75:
          uint64_t v47 = 32;
          goto LABEL_84;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 104) |= 0x10u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_79:
          uint64_t v47 = 40;
          goto LABEL_84;
        case 5u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 48;
          goto LABEL_56;
        case 6u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 56;
          goto LABEL_56;
        case 7u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 64;
          goto LABEL_56;
        case 8u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 72;
          goto LABEL_56;
        case 9u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 80;
          goto LABEL_56;
        case 0xAu:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 88;
          goto LABEL_56;
        case 0xBu:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 96;
LABEL_56:
          v41 = *(void **)(a1 + v40);
          *(void *)(a1 + v40) = v39;

          continue;
        case 0xCu:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 104) |= 1u;
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
        uint64_t v44 = *v3;
        unint64_t v45 = *(void *)(a2 + v44);
        if (v45 == -1 || v45 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
        *(void *)(a2 + v44) = v45 + 1;
        v19 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0) {
          goto LABEL_81;
        }
        v42 += 7;
        BOOL v14 = v43++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_83;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_81:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_83:
      uint64_t v47 = 8;
LABEL_84:
      *(void *)(a1 + v47) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordMetadataPasscodeGenerationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 1u;
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
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(void *)(a1 + 8) = v19;
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

BOOL OTEscrowMoveRequestContextReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
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
    uint64_t v19 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTWebAccessReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
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
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v19 != 0;
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

BOOL OTCurrentSecureElementIdentitiesReadFrom(char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
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
      if (v17 != 2)
      {
        if (v17 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          goto LABEL_29;
        }
        unsigned int v18 = objc_alloc_init(OTSecureElementPeerIdentity);
        uint64_t v19 = 8;
        goto LABEL_23;
      }
      unsigned int v18 = objc_alloc_init(OTSecureElementPeerIdentity);
      [a1 addTrustedPeerSecureElementIdentities:v18];
LABEL_25:
      if (!PBReaderPlaceMark() || !OTSecureElementPeerIdentityReadFrom((uint64_t)v18, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unsigned int v18 = objc_alloc_init(OTSecureElementPeerIdentity);
    uint64_t v19 = 16;
LABEL_23:
    objc_storeStrong((id *)&a1[v19], v18);
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19C7C71EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

id getSecureBackupClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSecureBackupClass_softClass;
  uint64_t v7 = getSecureBackupClass_softClass;
  if (!getSecureBackupClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSecureBackupClass_block_invoke;
    v3[3] = &unk_1E58FE3C8;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19C7C76D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSecureBackupClass_block_invoke(uint64_t a1)
{
  CloudServicesLibrary_678();
  Class result = objc_getClass("SecureBackup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSecureBackupClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)CloudServicesLibrary_678();
  }
  return result;
}

uint64_t CloudServicesLibrary_678()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CloudServicesLibraryCore_frameworkLibrary_679)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CloudServicesLibraryCore_block_invoke_680;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E58FE3E8;
    uint64_t v5 = 0;
    CloudServicesLibraryCore_frameworkLibrary_679 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = CloudServicesLibraryCore_frameworkLibrary_679;
    if (CloudServicesLibraryCore_frameworkLibrary_679)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CloudServicesLibraryCore_frameworkLibrary_679;
}

uint64_t __CloudServicesLibraryCore_block_invoke_680()
{
  uint64_t result = _sl_dlopen();
  CloudServicesLibraryCore_frameworkLibrary_679 = result;
  return result;
}

void sub_19C7C8104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19C7C8518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7C894C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7C8D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7C91A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7C95D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7C99B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7C9DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19C7CA2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19C7CA790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19C7CB39C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19C7CBD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7CC6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7CCAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7CD228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19C7CDAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkSecureBackupErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary_678();
  uint64_t result = dlsym(v2, "kSecureBackupErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19C7CE1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C7CE768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19C7CF2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkSecureBackupRecordLabelKeySymbolLoc_block_invoke_704(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary_678();
  uint64_t result = dlsym(v2, "kSecureBackupRecordLabelKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecordLabelKeySymbolLoc_ptr_703 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19C7D001C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkSecureBackupMetadataKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary_678();
  uint64_t result = dlsym(v2, "kSecureBackupMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupMetadataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupRecordIDKeySymbolLoc_block_invoke_706(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary_678();
  uint64_t result = dlsym(v2, "kSecureBackupRecordIDKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupRecordIDKeySymbolLoc_ptr_705 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19C7D0D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void *__getkEscrowServiceRecordDataKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary_678();
  uint64_t result = dlsym(v2, "kEscrowServiceRecordDataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkEscrowServiceRecordDataKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupKeybagDigestKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary_678();
  uint64_t result = dlsym(v2, "kSecureBackupKeybagDigestKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupKeybagDigestKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSecureBackupBagPasswordKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CloudServicesLibrary_678();
  uint64_t result = dlsym(v2, "kSecureBackupBagPasswordKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupBagPasswordKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OTCDPRecoveryInformationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_30;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 32) |= 8u;
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
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_69:
          BOOL v57 = v22 != 0;
          uint64_t v58 = 27;
          goto LABEL_90;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_30:
          uint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 32) |= 0x10u;
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
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_73:
          BOOL v57 = v29 != 0;
          uint64_t v58 = 28;
          goto LABEL_90;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (v14)
                {
                  uint64_t v35 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v35 = 0;
          }
LABEL_77:
          BOOL v57 = v35 != 0;
          uint64_t v58 = 26;
          goto LABEL_90;
        case 6u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (2)
          {
            uint64_t v42 = *v3;
            unint64_t v43 = *(void *)(a2 + v42);
            if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v14 = v40++ >= 9;
                if (v14)
                {
                  uint64_t v41 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v41 = 0;
          }
LABEL_81:
          BOOL v57 = v41 != 0;
          uint64_t v58 = 24;
          goto LABEL_90;
        case 7u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          *(unsigned char *)(a1 + 32) |= 0x20u;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v48) = v49 + 1;
              v47 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (v14)
                {
                  uint64_t v47 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v47 = 0;
          }
LABEL_85:
          BOOL v57 = v47 != 0;
          uint64_t v58 = 29;
          goto LABEL_90;
        case 8u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
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
        uint64_t v54 = *v3;
        unint64_t v55 = *(void *)(a2 + v54);
        if (v55 == -1 || v55 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v56 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
        *(void *)(a2 + v54) = v55 + 1;
        v53 |= (unint64_t)(v56 & 0x7F) << v51;
        if ((v56 & 0x80) == 0) {
          goto LABEL_87;
        }
        v51 += 7;
        BOOL v14 = v52++ >= 9;
        if (v14)
        {
          uint64_t v53 = 0;
          goto LABEL_89;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_87:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v53 = 0;
      }
LABEL_89:
      BOOL v57 = v53 != 0;
      uint64_t v58 = 25;
LABEL_90:
      *(unsigned char *)(a1 + v58) = v57;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x1E940E000uLL;
  unint64_t v8 = 0x1E940E000uLL;
  unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
  unint64_t v10 = 0x1E940E000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 2u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v9) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_87;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            uint64_t v22 = 0;
            goto LABEL_89;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_87:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_89:
        uint64_t v70 = *(int *)(v8 + 2004);
        goto LABEL_110;
      case 2u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 4u;
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
            char v30 = *(unsigned char *)(*(void *)(a2 + *v9) + v29);
            *(void *)(a2 + v28) = v29 + 1;
            v22 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              BOOL v17 = v27++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_93:
        uint64_t v70 = *(int *)(v10 + 2008);
        goto LABEL_110;
      case 3u:
        unint64_t v31 = v7;
        unint64_t v32 = v10;
        unint64_t v33 = v8;
        unsigned int v34 = objc_alloc_init(OTEscrowRecordMetadata);
        objc_storeStrong((id *)(a1 + 40), v34);
        if PBReaderPlaceMark() && (OTEscrowRecordMetadataReadFrom((uint64_t)v34, a2))
        {
          PBReaderRecallMark();

          unint64_t v8 = v33;
          unint64_t v10 = v32;
          unint64_t v7 = v31;
LABEL_120:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 64;
        goto LABEL_85;
      case 9u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 8u;
        while (2)
        {
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v9) + v41);
            *(void *)(a2 + v40) = v41 + 1;
            v22 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v38 += 7;
              BOOL v17 = v39++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_97:
        uint64_t v70 = 32;
        goto LABEL_110;
      case 0xAu:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v45 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 0x10u;
        while (2)
        {
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v9) + v47);
            *(void *)(a2 + v46) = v47 + 1;
            v45 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              BOOL v17 = v44++ >= 9;
              if (v17)
              {
                LODWORD(v45) = 0;
                goto LABEL_101;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v45) = 0;
        }
LABEL_101:
        uint64_t v71 = 80;
        goto LABEL_119;
      case 0xBu:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 72;
        goto LABEL_85;
      case 0xCu:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v45 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 0x40u;
        while (2)
        {
          uint64_t v51 = *v3;
          unint64_t v52 = *(void *)(a2 + v51);
          if (v52 == -1 || v52 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + *v9) + v52);
            *(void *)(a2 + v51) = v52 + 1;
            v45 |= (unint64_t)(v53 & 0x7F) << v49;
            if (v53 < 0)
            {
              v49 += 7;
              BOOL v17 = v50++ >= 9;
              if (v17)
              {
                LODWORD(v45) = 0;
                goto LABEL_105;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v45) = 0;
        }
LABEL_105:
        uint64_t v71 = 88;
        goto LABEL_119;
      case 0xDu:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 1u;
        while (2)
        {
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 == -1 || v57 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + *v9) + v57);
            *(void *)(a2 + v56) = v57 + 1;
            v22 |= (unint64_t)(v58 & 0x7F) << v54;
            if (v58 < 0)
            {
              v54 += 7;
              BOOL v17 = v55++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_109;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_109:
        uint64_t v70 = 8;
LABEL_110:
        *(void *)(a1 + v70) = v22;
        goto LABEL_120;
      case 0xEu:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 96;
        goto LABEL_85;
      case 0xFu:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v45 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 0x20u;
        while (2)
        {
          uint64_t v61 = *v3;
          unint64_t v62 = *(void *)(a2 + v61);
          if (v62 == -1 || v62 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)(a2 + *v9) + v62);
            *(void *)(a2 + v61) = v62 + 1;
            v45 |= (unint64_t)(v63 & 0x7F) << v59;
            if (v63 < 0)
            {
              v59 += 7;
              BOOL v17 = v60++ >= 9;
              if (v17)
              {
                LODWORD(v45) = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v45) = 0;
        }
LABEL_114:
        uint64_t v71 = 84;
        goto LABEL_119;
      case 0x10u:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v45 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2000)) |= 0x80u;
        while (2)
        {
          uint64_t v66 = *v3;
          unint64_t v67 = *(void *)(a2 + v66);
          if (v67 == -1 || v67 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + *v9) + v67);
            *(void *)(a2 + v66) = v67 + 1;
            v45 |= (unint64_t)(v68 & 0x7F) << v64;
            if (v68 < 0)
            {
              v64 += 7;
              BOOL v17 = v65++ >= 9;
              if (v17)
              {
                LODWORD(v45) = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v45) = 0;
        }
LABEL_118:
        uint64_t v71 = 104;
LABEL_119:
        *(_DWORD *)(a1 + v71) = v45;
        goto LABEL_120;
      case 0x11u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 56;
        goto LABEL_85;
      case 0x12u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = 48;
LABEL_85:
        v69 = *(void **)(a1 + v36);
        *(void *)(a1 + v36) = v35;

        goto LABEL_120;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_120;
    }
  }
}

BOOL OTICDPRecordContextReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
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
        BOOL v17 = objc_alloc_init(OTCDPRecoveryInformation);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (OTCDPRecoveryInformationReadFrom((uint64_t)v17, a2) & 1) == 0) {
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
    BOOL v17 = objc_alloc_init(OTEscrowAuthenticationInformation);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (OTEscrowAuthenticationInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
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

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
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

uint64_t SOSCCCopyMyPeerInfo()
{
  return MEMORY[0x1F40F6830]();
}

uint64_t SOSCCCopyMyPeerWithNewDeviceRecoverySecret()
{
  return MEMORY[0x1F40F6838]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x1F40F6840]();
}

uint64_t SOSCCPushResetCircle()
{
  return MEMORY[0x1F40F6848]();
}

uint64_t SOSCCRegisterRecoveryPublicKey()
{
  return MEMORY[0x1F40F6850]();
}

uint64_t SOSCCRequestToJoinCircleAfterRestore()
{
  return MEMORY[0x1F40F6868]();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return MEMORY[0x1F40F6888]();
}

uint64_t SOSPeerInfoCopyBackupKey()
{
  return MEMORY[0x1F40F6898]();
}

uint64_t SOSPeerInfoCopySerialNumber()
{
  return MEMORY[0x1F40F68A0]();
}

uint64_t SOSPeerInfoCreateFromData()
{
  return MEMORY[0x1F40F68A8]();
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x1F40F6FA8]();
}

uint64_t SecPasswordValidatePasswordFormat()
{
  return MEMORY[0x1F40F6FC0]();
}

uint64_t SecRKCreateRecoveryKeyString()
{
  return MEMORY[0x1F40F70D8]();
}

uint64_t SecRKCreateRecoveryKeyWithError()
{
  return MEMORY[0x1F40F70E0]();
}

uint64_t SecRKRegisterBackupPublicKey()
{
  return MEMORY[0x1F40F70E8]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _OctagonSignpostCreate()
{
  return MEMORY[0x1F40F72D0]();
}

uint64_t _OctagonSignpostGetNanoseconds()
{
  return MEMORY[0x1F40F72D8]();
}

uint64_t _OctagonSignpostLogSystem()
{
  return MEMORY[0x1F40F72E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return MEMORY[0x1F40CA6D8]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1F40CA6E0]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1F40CA9B0]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1F40CABC0]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

uint64_t ccwrap_auth_decrypt()
{
  return MEMORY[0x1F40CB308]();
}

uint64_t ccwrap_auth_encrypt()
{
  return MEMORY[0x1F40CB310]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1F40CB318]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1F40CB320]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t secLogObjForScope()
{
  return MEMORY[0x1F40F7340]();
}