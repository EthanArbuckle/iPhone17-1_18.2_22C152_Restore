uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (!strcmp(a1, "in_addr"))
  {
    v5 = 0;
LABEL_18:
    v4 = ((uint64_t (*)(void *))(&OSLogCopyFormattedString_formatters)[2 * v5 + 1])(v3);
    goto LABEL_19;
  }
  if (!strcmp(a1, "in6_addr"))
  {
    v5 = 1;
    goto LABEL_18;
  }
  if (!strcmp(a1, "sockaddr"))
  {
    v5 = 2;
    goto LABEL_18;
  }
  if (!strcmp(a1, "tcp_flags"))
  {
    v5 = 3;
    goto LABEL_18;
  }
  if (!strcmp(a1, "tcp_state"))
  {
    v5 = 4;
    goto LABEL_18;
  }
  if (!strcmp(a1, "tcp_packets"))
  {
    v5 = 5;
    goto LABEL_18;
  }
  if (!strcmp(a1, "quic_packets"))
  {
    v5 = 6;
    goto LABEL_18;
  }
  if (!strcmp(a1, "data"))
  {
    v5 = 7;
    goto LABEL_18;
  }
  v4 = 0;
LABEL_19:

  return v4;
}

uint64_t NWOLCopyFormattedStringIPv6Address(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 bytes] && objc_msgSend(v2, "length"))
    {
      if ([v2 length] != 16)
      {
        id v5 = objc_alloc(MEMORY[0x263F089B8]);
        uint64_t v6 = [[NSString alloc] initWithFormat:@"<fail decode - size> %zu != %lu", [v2 length], 16];
        goto LABEL_11;
      }
      *(_OWORD *)v15 = 0u;
      memset(v16, 0, sizeof(v16));
      v3 = inet_ntop(30, (const void *)[v2 bytes], v15, 0x2Eu);
      id v4 = objc_alloc(MEMORY[0x263F089B8]);
      id v5 = v4;
      if (v3)
      {
        uint64_t v6 = [NSString stringWithUTF8String:v15];
LABEL_11:
        v13 = (void *)v6;
        uint64_t v11 = [v5 initWithString:v6];

        goto LABEL_12;
      }
      v12 = @"<failed conversion>";
    }
    else
    {
      id v4 = objc_alloc(MEMORY[0x263F089B8]);
      v12 = @"<NULL>";
    }
    uint64_t v11 = [v4 initWithString:v12];
LABEL_12:

    goto LABEL_13;
  }
  id v7 = objc_alloc(MEMORY[0x263F089B8]);
  id v8 = [NSString alloc];
  v9 = [v1 description];
  v10 = (void *)[v8 initWithFormat:@"<fail decode - data type> %@", v9];
  uint64_t v11 = [v7 initWithString:v10];

LABEL_13:
  return v11;
}

uint64_t NWOLCopyFormattedStringIPv4Address(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v15 = 0;
  *(void *)v16 = 0;
  uint64_t v17 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 bytes] && objc_msgSend(v2, "length"))
    {
      if ([v2 length] == 4)
      {
        v3 = (int *)[v2 bytes];

        goto LABEL_8;
      }
      id v12 = objc_alloc(MEMORY[0x263F089B8]);
      v13 = [NSString initWithFormat:@"<fail decode - size> %zu != %lu", [v2 length], 4];
      uint64_t v8 = [v12 initWithString:v13];
    }
    else
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<NULL>"];
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x263F089B8]);
    id v10 = [NSString alloc];
    id v7 = [v1 description];
    uint64_t v11 = (void *)[v10 initWithFormat:@"<fail decode - data type> %@", v7];
    uint64_t v8 = [v9 initWithString:v11];

    goto LABEL_12;
  }
  int v15 = [v1 unsignedIntValue];
  v3 = &v15;
LABEL_8:
  id v4 = inet_ntop(2, v3, v16, 0x10u);
  id v5 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v6 = v5;
  if (!v4)
  {
    uint64_t v8 = [v5 initWithString:@"<failed conversion>"];
    goto LABEL_16;
  }
  id v7 = [NSString stringWithUTF8String:v16];
  uint64_t v8 = [v6 initWithString:v7];
LABEL_12:

LABEL_16:
  return v8;
}

uint64_t NWOLCopyFormattedStringData(void *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 bytes] && objc_msgSend(v2, "length"))
    {
      uint64_t v26 = [v2 bytes];
      v27[0] = 0;
      v27[1] = 0;
      char v28 = 0;
      id v25 = v2;
      uint64_t v3 = [v2 length];
      *(void *)&long long v4 = 0x2020202020202020;
      *((void *)&v4 + 1) = 0x2020202020202020;
      long long v29 = v4;
      *(_OWORD *)v30 = v4;
      *(_OWORD *)&v30[15] = v4;
      char v31 = 0;
      if (v3)
      {
        unint64_t v5 = v3;
        unint64_t v6 = 0;
        id v7 = &stru_26C5CCBB0;
        do
        {
          if (v5 - v6 >= 0x10) {
            uint64_t v9 = 16;
          }
          else {
            uint64_t v9 = v5 - v6;
          }
          if (!v9) {
            goto LABEL_6;
          }
          uint64_t v10 = 3 * (v9 - 1);
          uint64_t v11 = (char *)&v29 + 1;
          id v12 = (unsigned __int8 *)(v26 + v6);
          v13 = (char *)v27;
          uint64_t v14 = v9;
          do
          {
            unsigned int v16 = *v12++;
            unint64_t v15 = v16;
            if (v16 - 32 >= 0x5F) {
              char v17 = 46;
            }
            else {
              char v17 = v15;
            }
            char v18 = NWOLCopyFormattedStringData_hexChars[v15 >> 4];
            char *v13 = v17;
            *(v11 - 1) = v18;
            *uint64_t v11 = NWOLCopyFormattedStringData_hexChars[v15 & 0xF];
            if (!v10) {
              *((unsigned char *)v27 + (v9 - 1) + 1) = 0;
            }
            v10 -= 3;
            v11 += 3;
            ++v13;
            --v14;
          }
          while (v14);
          if (v9 <= 0xF) {
LABEL_6:
          }
            memset(&v30[3 * v9 - 16], 32, 3 * (16 - v9) - 1);
          uint64_t v8 = (__CFString *)[[NSString alloc] initWithFormat:@"%@%4zu   %s   %s\n", v7, v6, &v29, v27];

          v6 += v9;
          id v7 = v8;
        }
        while (v6 < v5);
      }
      else
      {
        uint64_t v8 = &stru_26C5CCBB0;
      }
      uint64_t v23 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];

      id v2 = v25;
    }
    else
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<NULL>"];
    }
  }
  else
  {
    id v19 = objc_alloc(MEMORY[0x263F089B8]);
    id v20 = [NSString alloc];
    v21 = [v1 description];
    v22 = (void *)[v20 initWithFormat:@"<fail decode - data type> %@", v21];
    uint64_t v23 = [v19 initWithString:v22];
  }
  return v23;
}

uint64_t NWOLCopyFormattedStringQUICPackets(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    unint64_t v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    uint64_t v3 = (unsigned char *)[v2 bytes];
    if ([v2 length])
    {
      uint64_t v9 = MEMORY[0x263EF8330];
      LOBYTE(v10) = *v3;
      nw_log_ring_parse();
      id v4 = objc_alloc(MEMORY[0x263F089B8]);
      if (v12[5]) {
        unint64_t v5 = (__CFString *)v12[5];
      }
      else {
        unint64_t v5 = &stru_26C5CCBB0;
      }
      uint64_t v6 = [v4 initWithString:v5, v9, 3221225472, __NWOLCopyFormattedStringQUICPackets_block_invoke, &unk_26422EFE8, &v11, v10];
    }
    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<failed conversion>"];
    }
    uint64_t v7 = v6;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<failed conversion>"];
  }

  return v7;
}

void sub_21516194C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

uint64_t __NWOLCopyFormattedStringQUICPackets_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v10, 0, sizeof(v10));
  quic_shorthand_describe_entry();
  id v2 = [[NSString alloc] initWithFormat:@"\t%s", v10];
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v4 + 40))
  {
    uint64_t v5 = [v2 stringByAppendingFormat:@"\n%@", *(void *)(v4 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = v2;
    uint64_t v7 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v8;
  }

  return 1;
}

uint64_t NWOLCopyFormattedStringTCPPackets(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    uint64_t v3 = (unsigned __int8 *)[v2 bytes];
    if ([v2 length])
    {
      if (*v3 != 1)
      {
        id v7 = objc_alloc(MEMORY[0x263F089B8]);
        id v8 = [[NSString alloc] initWithFormat: @"Unsupported verison: %u", *v3];
        uint64_t v6 = [v7 initWithString:v8];

        goto LABEL_11;
      }
      nw_log_ring_parse();
      id v4 = objc_alloc(MEMORY[0x263F089B8]);
      if (v11[5]) {
        uint64_t v5 = (__CFString *)v11[5];
      }
      else {
        uint64_t v5 = &stru_26C5CCBB0;
      }
    }
    else
    {
      id v4 = objc_alloc(MEMORY[0x263F089B8]);
      uint64_t v5 = @"<failed conversion>";
    }
    uint64_t v6 = [v4 initWithString:v5];
LABEL_11:
    _Block_object_dispose(&v10, 8);

    goto LABEL_12;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<failed conversion>"];
LABEL_12:

  return v6;
}

void sub_215161C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __NWOLCopyFormattedStringTCPPackets_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (a2 == 16)
  {
    unsigned int v5 = *(_DWORD *)a3;
    unsigned int v4 = *(_DWORD *)(a3 + 4);
    unsigned int v6 = *(unsigned __int16 *)(a3 + 8);
    uint64_t v7 = *(unsigned __int16 *)(a3 + 10);
    unsigned int v8 = *(unsigned __int8 *)(a3 + 14);
    char v9 = *(unsigned char *)(a3 + 15);
    unsigned int v10 = nw_log_delta_to_ms();
    id v11 = [NSString alloc];
    uint64_t v12 = "rcv";
    if ((v9 & 1) == 0) {
      uint64_t v12 = "snd";
    }
    v37 = v12;
    v38 = v11;
    unint64_t v13 = v10 / 0x3E8uLL;
    uint64_t v36 = v10 % 0x3E8;
    uint64_t v14 = bswap32(v5);
    uint64_t v39 = v7;
    uint64_t v15 = (v8 & 1) + v7 + ((v8 >> 1) & 1) + v14;
    uint64_t v16 = bswap32(v4);
    char v17 = "";
    uint64_t v18 = bswap32(v6) >> 16;
    if (v8) {
      id v19 = "F";
    }
    else {
      id v19 = "";
    }
    id v20 = "S";
    if ((v8 & 2) == 0) {
      id v20 = "";
    }
    v21 = "R";
    if ((v8 & 4) == 0) {
      v21 = "";
    }
    v22 = "P";
    if ((v8 & 8) == 0) {
      v22 = "";
    }
    uint64_t v23 = ".";
    if ((v8 & 0x10) == 0) {
      uint64_t v23 = "";
    }
    v24 = "U";
    if ((v8 & 0x20) == 0) {
      v24 = "";
    }
    id v25 = "E";
    if ((v8 & 0x40) == 0) {
      id v25 = "";
    }
    uint64_t v26 = "C";
    if ((v8 & 0x80u) == 0) {
      uint64_t v26 = "";
    }
    snprintf(__str, 9uLL, "%s%s%s%s%s%s%s%s", v19, v20, v21, v22, v23, v24, v25, v26);
    unsigned int v27 = (v9 & 6) - 2;
    if (v27 <= 4) {
      char v17 = (&off_26422F008)[v27];
    }
    char v28 = [v38 initWithFormat:v37, v13, v36, v14, v15, v16, v18, v39, __str, v17];
    long long v29 = v28;
    uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v30 + 40))
    {
      uint64_t v31 = [v28 stringByAppendingFormat:@"\n%@", *(void *)(v30 + 40)];
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 8);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;
    }
    else
    {
      id v34 = v28;
      v33 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v34;
    }
  }
  return a2 == 16;
}

uint64_t NWOLCopyFormattedStringTCPState(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 intValue];
    id v3 = objc_alloc(MEMORY[0x263F089B8]);
    if (v2 < 0xB)
    {
      uint64_t v4 = [NSString stringWithUTF8String:tcpstates[v2]];
    }
    else
    {
      uint64_t v4 = [[NSString alloc] initWithFormat:@"%d", v2];
    }
    unsigned int v6 = (void *)v4;
    uint64_t v5 = [v3 initWithString:v4];
  }
  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<failed conversion>"];
  }

  return v5;
}

uint64_t NWOLCopyFormattedStringTCPFlags(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v2 = [v1 unsignedCharValue];
    id v3 = objc_alloc(MEMORY[0x263F089B8]);
    id v4 = [NSString alloc];
    uint64_t v5 = "F";
    unsigned int v6 = "";
    if ((v2 & 1) == 0) {
      uint64_t v5 = "";
    }
    uint64_t v7 = "S";
    if ((v2 & 2) == 0) {
      uint64_t v7 = "";
    }
    unsigned int v8 = "R";
    if ((v2 & 4) == 0) {
      unsigned int v8 = "";
    }
    char v9 = "P";
    if ((v2 & 8) == 0) {
      char v9 = "";
    }
    unsigned int v10 = ".";
    if ((v2 & 0x10) == 0) {
      unsigned int v10 = "";
    }
    id v11 = "U";
    if ((v2 & 0x20) == 0) {
      id v11 = "";
    }
    uint64_t v12 = "E";
    if ((v2 & 0x40) == 0) {
      uint64_t v12 = "";
    }
    if (v2 < 0) {
      unsigned int v6 = "C";
    }
    snprintf(__str, 9uLL, "%s%s%s%s%s%s%s%s", v5, v7, v8, v9, v10, v11, v12, v6);
    unint64_t v13 = [v4 initWithFormat:@"[%s]", __str];
    uint64_t v14 = [v3 initWithString:v13];
  }
  else
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x263F089B8]) initWithString:@"<failed conversion>"];
  }

  return v14;
}

uint64_t NWOLCopyFormattedStringSockaddr(void *a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    id v3 = (unsigned __int8 *)[v2 bytes];
    unint64_t v4 = [v2 length];
    if (v3 && (unint64_t v5 = v4) != 0)
    {
      if (v4 > 1)
      {
        unint64_t v17 = *v3;
        if (v4 >= v17)
        {
          switch(v3[1])
          {
            case 1u:
              id v20 = objc_alloc(MEMORY[0x263F089B8]);
              uint64_t v21 = [[NSString alloc] initWithFormat:@"AF_UNIX:\"%.*s\"", *v3 - 2, v3 + 2, v41, v42, v43];
              goto LABEL_25;
            case 2u:
              if (v17 <= 0xF)
              {
                id v20 = objc_alloc(MEMORY[0x263F089B8]);
                id v22 = [NSString alloc];
                uint64_t v23 = *v3;
                uint64_t v24 = 16;
                goto LABEL_24;
              }
              int v28 = getnameinfo((const sockaddr *)v3, v17, v45, 0x10u, v44, 6u, 10);
              if (v28) {
                goto LABEL_42;
              }
              int v29 = *((unsigned __int16 *)v3 + 1);
              id v6 = objc_alloc(MEMORY[0x263F089B8]);
              id v30 = [NSString alloc];
              if (!v29) {
                goto LABEL_51;
              }
              uint64_t v7 = [v30 initWithFormat:@"%s:%s", v45, v44];
              goto LABEL_6;
            case 0x12u:
              uint64_t v25 = v3[5];
              uint64_t v26 = v3[6];
              if (v25 + v26 + (unint64_t)v3[7] + 8 > v17)
              {
                id v20 = objc_alloc(MEMORY[0x263F089B8]);
                uint64_t v21 = [[NSString alloc] initWithFormat:@"<fail decode - size> %d < %zu + %d + %d + %d", *v3, 8, v3[5], v3[6], v3[7]];
                goto LABEL_25;
              }
              if (!(v26 | v25) && !*((_WORD *)v3 + 1))
              {
                id v15 = objc_alloc(MEMORY[0x263F089B8]);
                uint64_t v16 = @"<fail decode - no information>";
                goto LABEL_9;
              }
              uint64_t v31 = [MEMORY[0x263F089D8] string];
              unsigned int v8 = v31;
              uint64_t v32 = v3[5];
              if (v3[6])
              {
                v33 = &v3[v32];
                [v31 appendFormat:@"%x", v3[v32 + 8]];
                if (v3[6] >= 2u)
                {
                  uint64_t v34 = 9;
                  do
                  {
                    [v8 appendFormat:@":%x", v33[v34]];
                    unint64_t v35 = v34 - 7;
                    ++v34;
                  }
                  while (v35 < v3[6]);
                }
                LODWORD(v32) = v3[5];
              }
              if (v32)
              {
                if ([v8 length]) {
                  uint64_t v36 = @"%%%.*s";
                }
                else {
                  uint64_t v36 = @"%.*s";
                }
                [v8 appendFormat:v36, v3[5], v3 + 8];
              }
              else if (*((_WORD *)v3 + 1))
              {
                if ([v8 length]) {
                  uint64_t v39 = @"%%%d";
                }
                else {
                  uint64_t v39 = @"%d";
                }
                [v8 appendFormat:v39, *((unsigned __int16 *)v3 + 1), v40];
              }
              id v9 = objc_alloc(MEMORY[0x263F089B8]);
              goto LABEL_12;
            case 0x1Eu:
              if (v17 > 0x1B)
              {
                int v28 = getnameinfo((const sockaddr *)v3, v17, v45, 0x46u, v44, 6u, 10);
                if (v28)
                {
LABEL_42:
                  int v37 = v28;
                  id v6 = objc_alloc(MEMORY[0x263F089B8]);
                  uint64_t v7 = [[NSString alloc] initWithFormat:@"<failed conversion> %s", gai_strerror(v37), v40];
                }
                else
                {
                  int v38 = *((unsigned __int16 *)v3 + 1);
                  id v6 = objc_alloc(MEMORY[0x263F089B8]);
                  id v30 = [NSString alloc];
                  if (v38) {
                    uint64_t v7 = [v30 initWithFormat:@"%s.%s", v45, v44];
                  }
                  else {
LABEL_51:
                  }
                    uint64_t v7 = [v30 initWithFormat:v45, v40];
                }
                goto LABEL_6;
              }
              id v20 = objc_alloc(MEMORY[0x263F089B8]);
              id v22 = [NSString alloc];
              uint64_t v23 = *v3;
              uint64_t v24 = 28;
LABEL_24:
              uint64_t v21 = [v22 initWithFormat:v23, @"<fail decode - size> %d < %lu", v23, v24, v41, v42, v43];
LABEL_25:
              unsigned int v27 = (void *)v21;
              uint64_t v14 = [v20 initWithString:v21];

              break;
            default:
              id v20 = objc_alloc(MEMORY[0x263F089B8]);
              uint64_t v21 = [[NSString alloc] initWithFormat:@"<fail decode - address family> %d", v3[1], v40, v41, v42, v43];
              goto LABEL_25;
          }
          goto LABEL_13;
        }
        id v18 = objc_alloc(MEMORY[0x263F089B8]);
        unsigned int v8 = [[NSString alloc] initWithFormat:@"<fail decode - size> %d > %zu", *v3, v5];
        id v9 = v18;
      }
      else
      {
        id v6 = objc_alloc(MEMORY[0x263F089B8]);
        uint64_t v7 = [[NSString alloc] initWithFormat:@"<fail decode - size> %zu < %lu", 1, 2];
LABEL_6:
        unsigned int v8 = (void *)v7;
        id v9 = v6;
      }
LABEL_12:
      uint64_t v14 = [v9 initWithString:v8];
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x263F089B8]);
      uint64_t v16 = @"<NULL>";
LABEL_9:
      uint64_t v14 = [v15 initWithString:v16];
    }
LABEL_13:

    goto LABEL_14;
  }
  id v10 = objc_alloc(MEMORY[0x263F089B8]);
  id v11 = [NSString alloc];
  uint64_t v12 = [v1 description];
  unint64_t v13 = (void *)[v11 initWithFormat:@"<fail decode - data type> %@", v12];
  uint64_t v14 = [v10 initWithString:v13];

LABEL_14:
  return v14;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x270ED9B90](*(void *)&a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x270ED9CA8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint64_t nw_log_delta_to_ms()
{
  return MEMORY[0x270EF8478]();
}

uint64_t nw_log_ring_parse()
{
  return MEMORY[0x270EF8498]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

uint64_t quic_shorthand_describe_entry()
{
  return MEMORY[0x270F9B1B0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}