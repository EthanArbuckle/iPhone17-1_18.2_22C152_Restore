@interface NSData(VCSEncodings)
- (id)VCSConvert8bitBufferToUTF8From:()VCSEncodings;
- (id)VCSDecodeBase64;
- (id)VCSDecodeQuotedPrintableForText:()VCSEncodings;
@end

@implementation NSData(VCSEncodings)

- (id)VCSDecodeBase64
{
  id v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
    goto LABEL_73;
  }
  v3 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", (unint64_t)(3 * objc_msgSend(v1, "length")) >> 2);
  id v4 = v2;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];
  if (v6 < 1) {
    goto LABEL_73;
  }
  v31 = v2;
  unsigned int v7 = 0;
  int v8 = 0;
  unint64_t v9 = v5 + v6;
LABEL_4:
  v10 = (char *)v5;
  while (2)
  {
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    v13 = v10 + 1;
    uint64_t v14 = 1;
LABEL_6:
    uint64_t v15 = v14;
    uint64_t v14 = 0;
    switch(Decode64Table[*(v13 - 1) & 0x7F])
    {
      case -6:
        v16 = v13 + 1;
        if ((unint64_t)(v13 + 1) < v9 && *v13 == 10 && *v16 == 32)
        {
          v20 = v13 + 1;
        }
        else
        {
          if ((unint64_t)(v13 + 2) >= v9 || *v13 != 13 || *v16 != 10 || v13[2] != 32)
          {
            uint64_t v14 = 0;
            goto LABEL_32;
          }
          v20 = v13 + 2;
        }
        goto LABEL_40;
      case -5:
        LODWORD(v14) = v11 == 0;
        if (v11) {
          uint64_t v17 = v12;
        }
        else {
          uint64_t v17 = v12 + 1;
        }
        if ((unint64_t)(v12 + 1) >= 0xA) {
          LODWORD(v14) = 0;
        }
        if (v15) {
          uint64_t v14 = v14;
        }
        else {
          uint64_t v14 = 0;
        }
        if (v15) {
          uint64_t v12 = v17;
        }
        goto LABEL_32;
      case -4:
        if ((v15 & (v11 == 0)) != 0) {
          unint64_t v11 = (unint64_t)(v13 - 1);
        }
        uint64_t v14 = v15;
        goto LABEL_32;
      case -3:
        v20 = v13 - 1;
        if ((unint64_t)v13 < v9 && *v13 == 10) {
          v20 = v13;
        }
        goto LABEL_40;
      case -2:
        v20 = v13 - 1;
LABEL_40:
        v21 = v20 + 1;
        BOOL v22 = (unint64_t)(v20 + 1) < v9;
        if ((v15 & 1) == 0)
        {
          if (!v22)
          {
LABEL_66:
            objc_msgSend(v3, "appendBytes:length:", v10, v9 - (void)v10, v31);
            goto LABEL_67;
          }
          [v3 appendBytes:v10 length:v21 - v10];
          v10 = v21;
          continue;
        }
        BOOL v34 = v22;
        v23 = v13 - 1;
        if (v11) {
          v24 = (char *)v11;
        }
        else {
          v24 = v23;
        }
        v25 = &v10[v12];
        if (&v10[v12] == v24)
        {
          v10 = v21;
          if (!v22) {
            goto LABEL_67;
          }
          continue;
        }
        uint64_t v32 = (uint64_t)v21;
LABEL_57:
        uint64_t v26 = v24 - v25;
        int v33 = v8;
        do
        {
          char v27 = *v10++;
          int v28 = Decode64Table[v27 & 0x7F];
          if ((v28 & 0x80000000) == 0)
          {
            unsigned int v7 = v28 + (v7 << 6);
            if ((~v8 & 3) == 0)
            {
              char v35 = BYTE2(v7);
              [v3 appendBytes:&v35 length:1];
              char v36 = BYTE1(v7);
              [v3 appendBytes:&v36 length:1];
              char v37 = v7;
              [v3 appendBytes:&v37 length:1];
              unsigned int v7 = 0;
            }
          }
          ++v8;
          --v26;
        }
        while (v26);
        int v8 = v33 - v25 + v24;
        uint64_t v5 = v32;
        if (v34) {
          goto LABEL_4;
        }
LABEL_67:
        if ((v8 & 3) == 2)
        {
          char v40 = v7 >> 4;
          v29 = &v40;
LABEL_71:
          objc_msgSend(v3, "appendBytes:length:", v29, 1, v31);
        }
        else if ((v8 & 3) == 3)
        {
          char v38 = v7 >> 10;
          [v3 appendBytes:&v38 length:1];
          char v39 = v7 >> 2;
          v29 = &v39;
          goto LABEL_71;
        }
        v2 = v31;
LABEL_73:

        return v3;
      case -1:
        goto LABEL_32;
      default:
        uint64_t v14 = (v15 & 1) != 0 && (v12 | v11) == 0;
LABEL_32:
        v18 = v13 + 1;
        if ((unint64_t)v13++ < v9) {
          goto LABEL_6;
        }
        if ((v14 & 1) == 0) {
          goto LABEL_66;
        }
        if (v11) {
          v24 = (char *)v11;
        }
        else {
          v24 = (char *)v9;
        }
        v25 = &v10[v12];
        if (&v10[v12] == v24) {
          goto LABEL_67;
        }
        BOOL v34 = 0;
        uint64_t v32 = (uint64_t)(v18 - 1);
        goto LABEL_57;
    }
  }
}

- (id)VCSConvert8bitBufferToUTF8From:()VCSEncodings
{
  id v5 = [NSString alloc];
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = a1;
  int v8 = objc_msgSend(v6, "dataWithBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length") - 1);
  unint64_t v9 = (void *)[v5 initWithData:v8 encoding:CFStringConvertEncodingToNSStringEncoding(a3)];

  if (v9)
  {
    v10 = (const char *)[v9 UTF8String];
    unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v10 length:strlen(v10)];
  }
  else
  {
    uint64_t v12 = VCSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSData(VCSEncodings) VCSConvert8bitBufferToUTF8From:](v12);
    }

    unint64_t v11 = 0;
  }

  return v11;
}

- (id)VCSDecodeQuotedPrintableForText:()VCSEncodings
{
  if (a1)
  {
    id v5 = a1;
    uint64_t v6 = VCSByteBufferWithCapacity([a1 length] / 3uLL);
    id v7 = v5;
    uint64_t v8 = [v7 bytes];
    uint64_t v9 = [v7 length];
    if (v9)
    {
      uint64_t v10 = 0;
      unint64_t v11 = (unsigned __int8 *)v8;
      while (1)
      {
        unint64_t v12 = v9 - 1;
        int v14 = *v11++;
        int v13 = v14;
        if (v14 != 61)
        {
          if (v13 == 10 && v10 != 0) {
            v6[1] -= v10;
          }
          if (v13 == 32) {
            ++v10;
          }
          else {
            uint64_t v10 = 0;
          }
          if (v13 == 10) {
            char v21 = a3;
          }
          else {
            char v21 = 1;
          }
          if ((v21 & 1) == 0) {
            VCSByteBufferAppendByte((uint64_t)v6, 13);
          }
          VCSByteBufferAppendByte((uint64_t)v6, v13);
          goto LABEL_41;
        }
        if (v9 == 1) {
          goto LABEL_42;
        }
        int v15 = *v11;
        if (v15 == 32 || v15 == 10) {
          break;
        }
        if (v12 >= 2)
        {
          unint64_t v11 = (unsigned __int8 *)(v8 + 3);
          char v22 = *(unsigned char *)(v8 + 2);
          int v23 = DecodeHexTable[v15 & 0x7F];
          unint64_t v12 = v9 - 3;
          if (v23 < 0 || (int v24 = DecodeHexTable[v22 & 0x7F], v24 < 0))
          {
            VCSByteBufferAppendByte((uint64_t)v6, 61);
            VCSByteBufferAppendByte((uint64_t)v6, v15);
            char v25 = v22;
          }
          else
          {
            char v25 = v24 + 16 * v23;
          }
          VCSByteBufferAppendByte((uint64_t)v6, v25);
LABEL_40:
          uint64_t v10 = 0;
          goto LABEL_41;
        }
        uint64_t v10 = 0;
        unint64_t v12 = 1;
LABEL_41:
        uint64_t v9 = v12;
        uint64_t v8 = (uint64_t)v11;
        if (!v12) {
          goto LABEL_42;
        }
      }
      unint64_t v17 = v9 - 2;
      if (v9 >= 2)
      {
        v18 = v11;
        while (1)
        {
          int v19 = *v18;
          if (v19 != 32) {
            break;
          }
          ++v18;
          --v17;
          if ((unint64_t)v18 >= v8 + v9) {
            goto LABEL_40;
          }
        }
        if (v19 == 10)
        {
          unint64_t v11 = v18 + 1;
          unint64_t v12 = v17;
        }
        uint64_t v10 = 0;
        goto LABEL_41;
      }
      goto LABEL_40;
    }
LABEL_42:
    a1 = VCSByteBufferData(v6);
    uint64_t v3 = vars8;
  }
  return a1;
}

- (void)VCSConvert8bitBufferToUTF8From:()VCSEncodings .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1DB9BF000, log, OS_LOG_TYPE_ERROR, "8bits to UTF-8 failed.", v1, 2u);
}

@end