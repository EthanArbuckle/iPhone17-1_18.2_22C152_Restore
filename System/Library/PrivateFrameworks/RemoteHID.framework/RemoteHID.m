void encodeHeader(uint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t a1, char *a2, uint64_t a3), uint64_t (*a4)(uint64_t a1, char *a2, uint64_t a3), uint64_t *a5, int a6)
{
  long long v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  long long v20;
  long long v21;
  unint64_t v22;
  _OWORD v23[9];
  uint64_t v24;

  v24 = 0;
  memset(v23, 0, sizeof(v23));
  v22 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v11;
  v21 = v11;
  pb_ostream_from_buffer(a3, a4, (uint64_t (**)(uint64_t, char *, uint64_t))&v20);
  v17 = 0;
  if (a3) {
    v18 = 1;
  }
  else {
    v18 = a6;
  }
  if (a2 >= 4 && a1 && v18)
  {
    LODWORD(v23[0]) = *(unsigned __int16 *)(a1 + 1);
    BYTE4(v23[0]) = *(unsigned char *)(a1 + 3);
    if (a6)
    {
      if (pb_get_encoded_size((uint64_t)a5, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)v23, v12, v13, v14, v15, v16)) {
        v17 = *a5;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      pb_encode(&v20);
      v17 = *((void *)&v21 + 1);
      if (!v19) {
        v17 = 0;
      }
    }
  }
  *a5 = v17;
}

void encode(int *a1, unint64_t a2, uint64_t (*a3)(uint64_t a1, char *a2, uint64_t a3), uint64_t (*a4)(uint64_t a1, char *a2, uint64_t a3), uint64_t *a5, int a6, int a7)
{
  uint64_t v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v26 = v13;
  long long v27 = v13;
  pb_ostream_from_buffer(a3, a4, (uint64_t (**)(uint64_t, char *, uint64_t))&v26);
  uint64_t v19 = 0;
  unint64_t v20 = 0xFFFFLL;
  if (!a7) {
    unint64_t v20 = a2;
  }
  v25[0] = a1;
  v25[1] = v20;
  if (a3) {
    int v21 = 1;
  }
  else {
    int v21 = a7;
  }
  if (a1 && v21 && v20 >= 4)
  {
    if (!a6)
    {
      int v23 = *a1;
      switch((*a1 >> 17) & 7)
      {
        case 0u:
          if ((v23 & 0x1FFFF) == 0x200)
          {
            *((void *)&v30 + 1) = encodeHostConnect;
            v22 = &v31;
          }
          else
          {
            *((void *)&v31 + 1) = encodeDeviceConnect;
            v22 = &v32;
          }
          goto LABEL_11;
        case 1u:
          *((void *)&v32 + 1) = encodeDeviceDisconnect;
          v22 = &v33;
          goto LABEL_11;
        case 2u:
          *((void *)&v33 + 1) = encodeInputReport;
          v22 = &v34;
          goto LABEL_11;
        case 3u:
          if ((v23 & 0x200000) != 0)
          {
            *((void *)&v35 + 1) = encodeSetReportResponse;
            v22 = &v36;
          }
          else
          {
            *((void *)&v34 + 1) = encodeSetReportRequest;
            v22 = &v35;
          }
          goto LABEL_11;
        case 4u:
          if ((v23 & 0x200000) != 0)
          {
            *((void *)&v37 + 1) = encodeGetReportResponse;
            v22 = (long long *)&v38;
          }
          else
          {
            *((void *)&v36 + 1) = encodeGetReportRequest;
            v22 = &v37;
          }
          goto LABEL_11;
        default:
          goto LABEL_20;
      }
    }
    *((void *)&v29 + 1) = encodeSizeOptimizedInputReport;
    v22 = &v30;
LABEL_11:
    *(void *)v22 = v25;
    if (a7)
    {
      if (pb_get_encoded_size((uint64_t)a5, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)&v29, v14, v15, v16, v17, v18)) {
        uint64_t v19 = *a5;
      }
      else {
LABEL_20:
      }
        uint64_t v19 = 0;
    }
    else
    {
      pb_encode(&v26);
      uint64_t v19 = *((void *)&v27 + 1);
      if (!v24) {
        uint64_t v19 = 0;
      }
    }
  }
  *a5 = v19;
}

void encodeSizeOptimizedInputReport(void *a1, uint64_t a2, unsigned int ***a3)
{
  v3 = *a3;
  v4 = **a3;
  unint64_t v5 = ((unint64_t)*v4 >> 7) & 0x3FF;
  if ((unint64_t)(*a3)[1] >= v5)
  {
    v3[1] = (unsigned int *)(v5 - 5);
    char v7 = *((unsigned char *)v4 + 3);
    char v8 = *((unsigned char *)v4 + 4);
    *(_WORD *)((char *)v4 + 3) = 0;
    *((unsigned char *)v4 + 3) = HIBYTE(*v4) & 0x80 | *v4 & 0x7F;
    pb_encode_tag_for_field(a1, a2);
    if (v9)
    {
      pb_encode_string(a1, (uint64_t)v4 + 3, (unint64_t)v3[1] + 2);
      if (v10)
      {
        *((unsigned char *)v4 + 3) = v7;
        *((unsigned char *)v4 + 4) = v8;
      }
    }
  }
}

void encodeHostConnect(void *a1, uint64_t a2)
{
  char v9 = 0;
  pb_encode_tag_for_field(a1, a2);
  if (v8) {
    pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferHostConnect_msg, (uint64_t)&v9, v3, v4, v5, v6, v7);
  }
}

void encodeDeviceConnect(void *a1, uint64_t a2, void **a3)
{
  v12[0] = 0;
  uint64_t v3 = *a3;
  uint64_t v4 = (_DWORD *)**a3;
  if ((*a3)[1] >= (((unint64_t)*v4 >> 7) & 0x3FF))
  {
    LODWORD(v12[0]) = *v4 & 0x7F;
    v12[1] = encodeData;
    v12[2] = v3;
    *uint64_t v3 = v4 + 1;
    v3[1] = (((unint64_t)*v4 >> 7) & 0x3FF) - 4;
    pb_encode_tag_for_field(a1, a2);
    if (v11) {
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceConnect_msg, (uint64_t)v12, v6, v7, v8, v9, v10);
    }
  }
}

void encodeDeviceDisconnect(void *a1, uint64_t a2, unsigned int ***a3)
{
  if ((unint64_t)(*a3)[1] >= (((unint64_t)***a3 >> 7) & 0x3FF))
  {
    int v10 = ***a3 & 0x7F;
    pb_encode_tag_for_field(a1, a2);
    if (v9) {
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceDisconnect_msg, (uint64_t)&v10, v4, v5, v6, v7, v8);
    }
  }
}

void encodeInputReport(void *a1, uint64_t a2, unsigned int ***a3)
{
  v19[0] = 0;
  uint64_t v3 = *a3;
  uint64_t v4 = **a3;
  unint64_t v5 = *v4;
  if ((unint64_t)(*a3)[1] >= ((v5 >> 7) & 0x3FF))
  {
    LODWORD(v19[0]) = *v4 & 0x7F;
    if ((v5 & 0x100000) != 0) {
      uint64_t v7 = *(void *)((char *)v4 + 5);
    }
    else {
      uint64_t v7 = 0;
    }
    v19[1] = v7;
    v19[2] = encodeData;
    v19[3] = v3;
    if ((v5 & 0x100000) != 0) {
      uint64_t v8 = (char *)v4 + 13;
    }
    else {
      uint64_t v8 = (char *)v4 + 5;
    }
    *uint64_t v3 = (unsigned int *)v8;
    unint64_t v9 = *v4;
    uint64_t v10 = (v9 >> 7) & 0x3FF;
    BOOL v11 = (v9 & 0x100000) == 0;
    uint64_t v12 = -13;
    if (v11) {
      uint64_t v12 = -5;
    }
    v3[1] = (unsigned int *)(v12 + v10);
    pb_encode_tag_for_field(a1, a2);
    if (v18) {
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceInputReport_msg, (uint64_t)v19, v13, v14, v15, v16, v17);
    }
  }
}

void encodeSetReportResponse(void *a1, uint64_t a2, unsigned int ***a3)
{
  uint64_t v12 = 0;
  uint64_t v3 = **a3;
  unint64_t v4 = *v3;
  if ((unint64_t)(*a3)[1] >= ((v4 >> 7) & 0x3FF))
  {
    LODWORD(v12) = *v3 & 0x7F;
    if ((v4 & 0x400000) != 0)
    {
      if ((v4 & 0x1FF80) < 0x401) {
        return;
      }
      HIDWORD(v12) = *(unsigned int *)((char *)v3 + 5);
    }
    pb_encode_tag_for_field(a1, a2);
    if (v11) {
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceSetReportResponse_msg, (uint64_t)&v12, v6, v7, v8, v9, v10);
    }
  }
}

void encodeSetReportRequest(void *a1, uint64_t a2, unsigned int ***a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = **a3;
  if ((unint64_t)(*a3)[1] >= (((unint64_t)*v4 >> 7) & 0x3FF))
  {
    int v6 = *((unsigned __int8 *)v4 + 4);
    v13[0] = *v4 & 0x7F;
    v13[1] = v6;
    uint64_t v14 = encodeData;
    uint64_t v15 = v3;
    *uint64_t v3 = (unsigned int *)((char *)v4 + 5);
    v3[1] = (unsigned int *)((((unint64_t)*v4 >> 7) & 0x3FF) - 5);
    pb_encode_tag_for_field(a1, a2);
    if (v12) {
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceSetReportRequest_msg, (uint64_t)v13, v7, v8, v9, v10, v11);
    }
  }
}

void encodeGetReportResponse(void *a1, uint64_t a2, unsigned int ***a3)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v3 = *a3;
  unint64_t v4 = **a3;
  unint64_t v5 = *v4;
  if ((unint64_t)(*a3)[1] >= ((v5 >> 7) & 0x3FF))
  {
    LODWORD(v13) = *v4 & 0x7F;
    if ((v5 & 0x400000) != 0)
    {
      if ((v5 & 0x1FF80) >= 0x401) {
        HIDWORD(v13) = *(unsigned int *)((char *)v4 + 5);
      }
    }
    else
    {
      uint64_t v14 = encodeData;
      uint64_t v15 = v3;
      *uint64_t v3 = (unsigned int *)((char *)v4 + 5);
      v3[1] = (unsigned int *)((((unint64_t)*v4 >> 7) & 0x3FF) - 5);
    }
    pb_encode_tag_for_field(a1, a2);
    if (v12) {
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceGetReportResponse_msg, (uint64_t)&v13, v7, v8, v9, v10, v11);
    }
  }
}

void encodeGetReportRequest(void *a1, uint64_t a2, unsigned int ***a3)
{
  uint64_t v3 = **a3;
  unint64_t v4 = ((unint64_t)*v3 >> 7) & 0x3FF;
  if (v4) {
    BOOL v5 = (unint64_t)(*a3)[1] >= v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    int v7 = *((unsigned __int8 *)v3 + 4);
    v14[0] = *v3 & 0x7F;
    v14[1] = v7;
    v14[2] = *((unsigned __int8 *)v3 + 5);
    pb_encode_tag_for_field(a1, a2);
    if (v13) {
      pb_encode_submessage((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceGetReportRequest_msg, (uint64_t)v14, v8, v9, v10, v11, v12);
    }
  }
}

void decodeHeader(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v11 = 0;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[1] = v7;
  memset(v10, 0, sizeof(v10));
  v9[0] = v7;
  pb_istream_from_buffer(a1, a2, v9);
  if (a1 && a3 && a4 >= 5)
  {
    pb_decode((uint64_t)v9, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)v10);
    if (v8)
    {
      *(unsigned char *)a3 = 1;
      *(_WORD *)(a3 + 1) = v10[0];
      *(unsigned char *)(a3 + 3) = BYTE4(v10[0]);
    }
  }
}

void decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  v18[0] = 0;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17[0] = v11;
  v17[1] = v11;
  pb_istream_from_buffer(a1, a2, v17);
  uint64_t v12 = 0;
  v15[0] = 0;
  v15[1] = a3;
  v15[2] = a4;
  long long v16 = xmmword_22571F040;
  BYTE8(v16) = a6;
  if (a3) {
    int v13 = 1;
  }
  else {
    int v13 = a6;
  }
  if (a1)
  {
    if (v13)
    {
      v18[1] = decodeSizeOptimizedReport;
      v18[3] = decodeHostConnect;
      v18[5] = decodeDeviceConnect;
      v18[7] = decodeDeviceDisconnect;
      v18[9] = decodeInputReport;
      v18[11] = decodeSetReportRequest;
      v18[13] = decodeSetReportResponse;
      v18[15] = decodeGetReportRequest;
      v18[2] = v15;
      v18[4] = v15;
      v18[6] = v15;
      v18[8] = v15;
      v18[10] = v15;
      v18[12] = v15;
      v18[14] = v15;
      v18[16] = v15;
      v18[17] = decodeGetReportResponse;
      v18[18] = v15;
      pb_decode((uint64_t)v17, (uint64_t)&HIDRTBufferMessage_msg, (uint64_t)v18);
      uint64_t v12 = v16;
      if (!v14) {
        uint64_t v12 = 0;
      }
    }
  }
  *a5 = v12;
}

void decodeSizeOptimizedReport(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = *(void *)(*a3 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(void *)uint64_t v3 = v5 + 3;
  *(void *)(v3 + 24) += v5 + 3;
  if (!*(unsigned char *)(v3 + 32) && *(void *)(v3 + 16) >= v5 + 3)
  {
    pb_read(a1, v4 + 3, v5);
    if (v6)
    {
      uint64_t v7 = *(void *)(v3 + 16) - *(void *)v3;
      *(void *)(v3 + 8) += *(void *)v3;
      *(void *)(v3 + 16) = v7;
      unsigned int v8 = *(_DWORD *)v4 & 0xFFFFFF80 | *(unsigned char *)(v4 + 3) & 0x7F;
      *(_DWORD *)uint64_t v4 = v8;
      *(_DWORD *)uint64_t v4 = v8 & 0xFF80007F | ((*(_DWORD *)v3 & 0x3FF) << 7) | 0x40000;
      *(unsigned char *)(v4 + 4) = 0;
    }
  }
}

void decodeHostConnect(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  char v7 = 0;
  uint64_t v3 = *a3;
  uint64_t v4 = *(unsigned int **)(*a3 + 8);
  uint64_t v5 = *(void *)(*a3 + 16) - 4;
  *(void *)(v3 + 8) = v4 + 1;
  *(void *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferHostConnect_msg, (uint64_t)&v7);
  if (v6)
  {
    *(void *)(v3 + 24) += 4;
    if (!*(unsigned char *)(v3 + 32)) {
      unsigned int *v4 = *v4 & 0xFF800000 | 0x200;
    }
  }
}

void decodeDeviceConnect(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = *(unsigned int **)(*a3 + 8);
  v8[0] = 0;
  v8[1] = decodeData;
  v8[2] = v3;
  uint64_t v5 = *(void *)(v3 + 16) - 4;
  *(void *)(v3 + 8) = v4 + 1;
  *(void *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceConnect_msg, (uint64_t)v8);
  if (v6)
  {
    *(void *)(v3 + 24) += 4;
    if (!*(unsigned char *)(v3 + 32))
    {
      unsigned int v7 = *v4 & 0xFFFFFF80 | v8[0] & 0x7F;
      unsigned int *v4 = v7;
      unsigned int *v4 = ((*(_DWORD *)v3 << 7) + 512) & 0x1FF80 | v7 & 0xFF80007F;
    }
  }
}

void decodeDeviceDisconnect(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v7 = 0;
  uint64_t v3 = *a3;
  uint64_t v4 = *(unsigned int **)(*a3 + 8);
  uint64_t v5 = *(void *)(*a3 + 16) - 4;
  *(void *)(v3 + 8) = v4 + 1;
  *(void *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceDisconnect_msg, (uint64_t)&v7);
  if (v6)
  {
    *(void *)(v3 + 24) += 4;
    if (!*(unsigned char *)(v3 + 32)) {
      unsigned int *v4 = *v4 & 0xFF800000 | v7 & 0x7F | 0x20200;
    }
  }
}

void decodeInputReport(_OWORD *a1, uint64_t a2, uint64_t *a3)
{
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = *a3;
  uint64_t v5 = *(void *)(*a3 + 8);
  long long v6 = a1[1];
  v13[0] = *a1;
  v13[1] = v6;
  pb_decode((uint64_t)v13, (uint64_t)&HIDRTBufferDeviceInputReport_msg, (uint64_t)&v14);
  if (v7)
  {
    *(void *)&long long v15 = decodeData;
    *((void *)&v15 + 1) = v4;
    if (*((void *)&v14 + 1)) {
      uint64_t v8 = 13;
    }
    else {
      uint64_t v8 = 5;
    }
    uint64_t v9 = *(void *)(v4 + 16) - v8;
    *(void *)(v4 + 8) += v8;
    *(void *)(v4 + 16) = v9;
    pb_decode((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceInputReport_msg, (uint64_t)&v14);
    if (v10)
    {
      *(void *)(v4 + 24) += v8;
      if (!*(unsigned char *)(v4 + 32))
      {
        int v11 = *(_DWORD *)v5 & 0xFFFFFF80 | v14 & 0x7F;
        *(_DWORD *)uint64_t v5 = v11;
        uint64_t v12 = *((void *)&v14 + 1);
        *(_DWORD *)uint64_t v5 = v11 & 0xFF80007F | ((((unsigned __int16)*(_DWORD *)v4 + (_WORD)v8) & 0x3FF) << 7) | ((*((void *)&v14 + 1) != 0) << 20) | 0x40000;
        *(unsigned char *)(v5 + 4) = 0;
        if (v12) {
          *(void *)(v5 + 5) = v12;
        }
      }
    }
  }
}

void decodeSetReportRequest(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = *(void *)(*a3 + 8);
  v8[0] = 0;
  v8[1] = decodeData;
  v8[2] = v3;
  uint64_t v5 = *(void *)(v3 + 16) - 5;
  *(void *)(v3 + 8) = v4 + 5;
  *(void *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceSetReportRequest_msg, (uint64_t)v8);
  if (v6)
  {
    *(void *)(v3 + 24) += 5;
    if (!*(unsigned char *)(v3 + 32))
    {
      unsigned int v7 = *(_DWORD *)v4 & 0xFFFFFF80 | v8[0] & 0x7F;
      *(_DWORD *)uint64_t v4 = v7;
      *(_DWORD *)uint64_t v4 = v7 & 0xFF80007F | ((*(_DWORD *)v3 << 7) + 640) & 0x1FF80 | 0x60000;
      *(unsigned char *)(v4 + 4) = BYTE4(v8[0]);
    }
  }
}

uint64_t decodeSetReportResponse(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = 0;
  uint64_t v3 = *a3;
  uint64_t v4 = *(void *)(*a3 + 8);
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceSetReportResponse_msg, (uint64_t)&v14);
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = HIDWORD(v14);
    uint64_t v8 = 4 * (HIDWORD(v14) != 0);
    uint64_t v9 = *(void *)(v3 + 16);
    uint64_t v10 = *(void *)(v3 + 8) + v8 + 5;
    *(void *)uint64_t v3 = v8;
    *(void *)(v3 + 8) = v10;
    uint64_t v11 = *(void *)(v3 + 24) + v8 + 5;
    *(void *)(v3 + 16) = v9 - (v8 + 5);
    *(void *)(v3 + 24) = v11;
    if (!*(unsigned char *)(v3 + 32))
    {
      int v12 = *(_DWORD *)v4 & 0xFFFFFF80 | v14 & 0x7F;
      *(_DWORD *)uint64_t v4 = v12;
      *(_DWORD *)uint64_t v4 = v12 & 0xFF80007F | ((*(_DWORD *)v3 << 7) + 640) & 0x1FF80 | ((v7 != 0) << 22) | 0x260000;
      *(unsigned char *)(v4 + 4) = 2;
      memcpy((void *)(v4 + 5), (char *)&v14 + 4, *(void *)v3);
    }
  }
  return v6;
}

void decodeGetReportRequest(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v9 = 0;
  uint64_t v8 = 0;
  uint64_t v3 = *a3;
  uint64_t v4 = *(void *)(*a3 + 8);
  uint64_t v5 = *(void *)(*a3 + 16) - 6;
  *(void *)(v3 + 8) = v4 + 6;
  *(void *)(v3 + 16) = v5;
  pb_decode(a1, (uint64_t)&HIDRTBufferDeviceGetReportRequest_msg, (uint64_t)&v8);
  if (v6)
  {
    *(void *)(v3 + 24) += 6;
    if (!*(unsigned char *)(v3 + 32))
    {
      *(_DWORD *)uint64_t v4 = *(_DWORD *)v4 & 0xFF800000 | v8 & 0x7F | 0x80300;
      char v7 = v9;
      *(unsigned char *)(v4 + 4) = BYTE4(v8);
      *(unsigned char *)(v4 + 5) = v7;
    }
  }
}

void decodeGetReportResponse(_OWORD *a1, uint64_t a2, uint64_t *a3)
{
  int v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v4 = *a3;
  uint64_t v5 = *(void *)(*a3 + 8);
  long long v6 = a1[1];
  v16[0] = *a1;
  v16[1] = v6;
  pb_decode((uint64_t)v16, (uint64_t)&HIDRTBufferDeviceGetReportResponse_msg, (uint64_t)&v17);
  if (v7)
  {
    int v8 = HIDWORD(v17);
    uint64_t v9 = 4 * (HIDWORD(v17) != 0);
    uint64_t v10 = v9 + 5;
    uint64_t v11 = *(void *)(v4 + 16);
    uint64_t v12 = *(void *)(v4 + 8) + v9 + 5;
    *(void *)uint64_t v4 = v9;
    *(void *)(v4 + 8) = v12;
    *(void *)(v4 + 16) = v11 - (v9 + 5);
    if (!v8)
    {
      int v18 = decodeData;
      uint64_t v19 = v4;
      pb_decode((uint64_t)a1, (uint64_t)&HIDRTBufferDeviceGetReportResponse_msg, (uint64_t)&v17);
      if (!v13) {
        return;
      }
      uint64_t v10 = 5;
    }
    *(void *)(v4 + 24) += v10;
    if (!*(unsigned char *)(v4 + 32))
    {
      int v14 = HIDWORD(v17);
      if (HIDWORD(v17))
      {
        memcpy((void *)(v5 + 5), (char *)&v17 + 4, *(void *)v4);
        int v14 = 0x400000;
      }
      int v15 = *(_DWORD *)v5 & 0xFFFFFF80 | v17 & 0x7F;
      *(_DWORD *)uint64_t v5 = v15;
      *(_DWORD *)uint64_t v5 = v15 & 0xFF80007F | ((*(_DWORD *)v4 << 7) + 640) & 0x1FF80 | v14 | 0x280000;
      *(unsigned char *)(v5 + 4) = 2;
    }
  }
}

void encodeData(void *a1, uint64_t a2, uint64_t **a3)
{
  uint64_t v4 = *a3;
  pb_encode_tag_for_field(a1, a2);
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v4[1];
    pb_encode_string(a1, v6, v7);
  }
}

void decodeData(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  unint64_t v4 = *(void *)(a1 + 16);
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 24) += v4;
  if (!*(unsigned char *)(v3 + 32) && *(void *)(v3 + 16) >= v4)
  {
    pb_read(a1, *(void *)(v3 + 8), v4);
    if (v5)
    {
      uint64_t v6 = *(void *)(v3 + 16) - *(void *)v3;
      *(void *)(v3 + 8) += *(void *)v3;
      *(void *)(v3 + 16) = v6;
    }
  }
}

uint64_t HIDAccesorySessionEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    int v8 = RemoteHIDLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      HIDAccesorySessionEventCallback_cold_1();
    }
  }
  return [a4 btSessionEventHandler:a1 event:a2 result:a3];
}

void HIDAccessoryEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  int v8 = (void *)MEMORY[0x22A633440]();
  [v9 btAccessoryEventHandler:a3 event:a2 state:a4];
}

void HIDAccesoryServiceEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v12 = RemoteHIDLog();
  int v13 = v12;
  if (a5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 67109888;
      int v16 = a3;
      __int16 v17 = 1024;
      int v18 = a4;
      __int16 v19 = 1024;
      int v20 = a5;
      __int16 v21 = 2048;
      v22 = a6;
      _os_log_error_impl(&dword_225713000, v13, OS_LOG_TYPE_ERROR, "HIDAccesoryServiceEventCallback eventType:%d event:%d result:%d data:%p", (uint8_t *)&v15, 0x1Eu);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 67109888;
      int v16 = a3;
      __int16 v17 = 1024;
      int v18 = a4;
      __int16 v19 = 1024;
      int v20 = 0;
      __int16 v21 = 2048;
      v22 = a6;
      _os_log_impl(&dword_225713000, v13, OS_LOG_TYPE_INFO, "HIDAccesoryServiceEventCallback eventType:%d event:%d result:%d data:%p", (uint8_t *)&v15, 0x1Eu);
    }

    int v13 = a6;
    int v14 = (void *)MEMORY[0x22A633440]();
    [v13 btServiceEventHandler:a1 services:a2 eventType:a3 event:a4 result:0];
  }
}

void HIDAccesoryCustomMessageCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  uint64_t v10 = (void *)MEMORY[0x22A633440]();
  [v11 btDeviceMessageHandler:a2 type:a3 data:a4 size:a5];
}

void sub_225717D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_2257192D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225719474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_225719818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id RemoteHIDLog()
{
  if (RemoteHIDLog_onceToken != -1) {
    dispatch_once(&RemoteHIDLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)RemoteHIDLog_log;
  return v0;
}

uint64_t __RemoteHIDLog_block_invoke()
{
  RemoteHIDLog_log = (uint64_t)os_log_create("com.apple.RemoteHID", "default");
  return MEMORY[0x270F9A758]();
}

id RemoteHIDLogPackets()
{
  if (RemoteHIDLogPackets_onceToken != -1) {
    dispatch_once(&RemoteHIDLogPackets_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)RemoteHIDLogPackets_log;
  return v0;
}

uint64_t __RemoteHIDLogPackets_block_invoke()
{
  RemoteHIDLogPackets_log = (uint64_t)os_log_create("com.apple.RemoteHID", "packets");
  return MEMORY[0x270F9A758]();
}

BOOL pb_field_iter_begin(void *a1, uint64_t a2, uint64_t a3)
{
  memset(a1, 0, 0x40uLL);
  *a1 = a2;
  a1[1] = a3;
  return load_descriptor_values((uint64_t)a1);
}

BOOL load_descriptor_values(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int16 *)(a1 + 16);
  v2 = *(uint64_t **)a1;
  unsigned int v3 = *(unsigned __int16 *)(*(void *)a1 + 32);
  if (v1 < v3)
  {
    uint64_t v4 = *v2;
    uint64_t v5 = *(unsigned __int16 *)(a1 + 18);
    unsigned int v6 = *(_DWORD *)(*v2 + 4 * v5);
    *(unsigned char *)(a1 + 30) = BYTE1(v6);
    if ((v6 & 3) == 2)
    {
      LODWORD(v7) = *(_DWORD *)(v4 + 4 * (v5 + 1));
      unsigned int v8 = *(_DWORD *)(v4 + 4 * (v5 + 2));
      int v9 = *(_DWORD *)(v4 + 4 * (v5 + 3));
      *(_WORD *)(a1 + 28) = HIWORD(v6);
      *(_WORD *)(a1 + 24) = (v7 >> 2) & 0xFFC0 | (v6 >> 2);
    }
    else if ((v6 & 3) == 1)
    {
      unsigned int v10 = *(_DWORD *)(v4 + 4 * v5 + 4);
      *(_WORD *)(a1 + 28) = HIWORD(v6) & 0xFFF;
      *(_WORD *)(a1 + 24) = (v10 >> 22) & 0x3C0 | (v6 >> 2);
      LODWORD(v7) = v6 >> 28;
      unsigned int v8 = (unsigned __int16)v10;
      int v9 = HIWORD(v10) & 0xFFF;
    }
    else if ((v6 & 3) != 0)
    {
      unint64_t v7 = (_DWORD *)(v4 + 4 * v5);
      unsigned int v11 = v7[1];
      unsigned int v8 = v7[2];
      int v9 = v7[3];
      *(_WORD *)(a1 + 28) = v7[4];
      *(_WORD *)(a1 + 24) = (v11 >> 2) & 0xFFC0 | (v6 >> 2);
      LOBYTE(v7) = v11;
    }
    else
    {
      *(_WORD *)(a1 + 28) = 1;
      *(_WORD *)(a1 + 24) = v6 >> 2;
      LODWORD(v7) = HIBYTE(v6) & 0xF;
      unsigned int v8 = BYTE2(v6);
      int v9 = v6 >> 28;
    }
    char v12 = BYTE1(v6);
    *(_WORD *)(a1 + 26) = v9;
    uint64_t v13 = *(void *)(a1 + 8);
    if (v13)
    {
      uint64_t v14 = (void *)(v13 + v8);
      int v15 = v6 & 0x3000;
      uint64_t v16 = (char *)(a1 + 28);
      if ((v12 & 0x40 | 0x80) != 0x80) {
        uint64_t v16 = 0;
      }
      *(void *)(a1 + 32) = v14;
      if (v15 == 0x2000) {
        __int16 v17 = v16;
      }
      else {
        __int16 v17 = 0;
      }
      if ((_BYTE)v7) {
        __int16 v17 = (char *)v14 - (char)v7;
      }
      *(void *)(a1 + 48) = v17;
      if ((v12 & 0xC0) == 0x80) {
        *(void *)(a1 + 40) = *v14;
      }
      else {
        *(void *)(a1 + 40) = v14;
      }
    }
    else
    {
      *(void *)(a1 + 32) = 0;
      *(void *)(a1 + 48) = 0;
    }
    if ((v12 & 0xE) == 8) {
      uint64_t v18 = *(void *)(v2[1] + 8 * *(unsigned __int16 *)(a1 + 22));
    }
    else {
      uint64_t v18 = 0;
    }
    *(void *)(a1 + 56) = v18;
  }
  return v1 < v3;
}

BOOL pb_field_iter_begin_extension(void *a1, void *a2)
{
  uint64_t v4 = a2 + 1;
  uint64_t v5 = *(_DWORD ***)(*a2 + 16);
  if ((**v5 & 0xC000) != 0x8000) {
    uint64_t v4 = (void *)*v4;
  }
  BOOL result = pb_field_iter_begin(a1, (uint64_t)v5, (uint64_t)v4);
  a1[6] = a2 + 3;
  return result;
}

BOOL pb_field_iter_next(_WORD *a1)
{
  return a1[8] != 0;
}

double advance_iterator(_WORD *a1)
{
  unsigned __int16 v1 = a1[8] + 1;
  a1[8] = v1;
  if (*(unsigned __int16 *)(*(void *)a1 + 32) <= v1)
  {
    double result = 0.0;
    *((void *)a1 + 2) = 0;
  }
  else
  {
    uint64_t v2 = (unsigned __int16)a1[9];
    int v3 = *(_DWORD *)(**(void **)a1 + 4 * v2);
    a1[9] = v2 + (1 << (v3 & 3));
    __int16 v4 = a1[10];
    if ((v3 & 0x3000) == 0) {
      ++v4;
    }
    a1[10] = v4;
    if ((v3 & 0xE00) == 0x800) {
      __int16 v5 = a1[11] + 1;
    }
    else {
      __int16 v5 = a1[11];
    }
    a1[11] = v5;
  }
  return result;
}

uint64_t pb_field_iter_find(unsigned __int16 *a1, unsigned int a2)
{
  unsigned int v2 = a1[12];
  if (v2 == a2) {
    return 1;
  }
  if (*(unsigned __int16 *)(*(void *)a1 + 36) >= a2)
  {
    int v6 = a1[8];
    if (v2 > a2) {
      a1[8] = *(_WORD *)(*(void *)a1 + 32);
    }
    while (1)
    {
      advance_iterator(a1);
      OUTLINED_FUNCTION_0_0();
      if (((a2 ^ (v7 >> 2)) & 0x3F) == 0)
      {
        load_descriptor_values((uint64_t)a1);
        if (a1[12] == a2 && (a1[15] & 0xF) != 0xA) {
          break;
        }
      }
      if (a1[8] == v6)
      {
        load_descriptor_values((uint64_t)a1);
        return 0;
      }
    }
    return 1;
  }
  return 0;
}

BOOL pb_field_iter_find_extension(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 30) & 0xF) == 0xA) {
    return 1;
  }
  int v3 = *(unsigned __int16 *)(a1 + 16);
  while (1)
  {
    advance_iterator((_WORD *)a1);
    OUTLINED_FUNCTION_0_0();
    if ((v4 & 0xF00) == 0xA00) {
      break;
    }
    if (*(unsigned __int16 *)(a1 + 16) == v3)
    {
      load_descriptor_values(a1);
      return 0;
    }
  }
  return load_descriptor_values(a1);
}

uint64_t pb_default_field_callback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_WORD *)(a3 + 26) == 16)
  {
    int v3 = *(uint64_t (***)(uint64_t, uint64_t, void))(a3 + 40);
    if (v3)
    {
      if (a1)
      {
        __int16 v4 = *v3;
        if (*v3)
        {
          __int16 v5 = v3 + 1;
          return v4(a1, a3, v5);
        }
      }
      if (a2)
      {
        __int16 v4 = *v3;
        if (*v3)
        {
          __int16 v5 = v3 + 1;
          a1 = a2;
          return v4(a1, a3, v5);
        }
      }
    }
  }
  return 1;
}

uint64_t (*pb_ostream_from_buffer@<X0>(uint64_t (*result)(uint64_t a1, char *a2, uint64_t a3)@<X0>, uint64_t (*a2)(uint64_t a1, char *a2, uint64_t a3)@<X1>, uint64_t (**a3)(uint64_t a1, char *a2, uint64_t a3)@<X8>))(uint64_t a1, char *a2, uint64_t a3)
{
  *a3 = buf_write;
  a3[1] = result;
  a3[3] = 0;
  a3[4] = 0;
  a3[2] = a2;
  return result;
}

uint64_t buf_write(uint64_t a1, char *a2, uint64_t a3)
{
  int v3 = *(unsigned char **)(a1 + 8);
  for (*(void *)(a1 + 8) = &v3[a3]; a3; --a3)
  {
    char v4 = *a2++;
    *v3++ = v4;
  }
  return 1;
}

void pb_write(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3
    && *a1
    && ((uint64_t v5 = a1[3], v6 = __CFADD__(v5, a3), v7 = v5 + a3, v6)
     || v7 > a1[2]
     || (((uint64_t (*)(void *, uint64_t, uint64_t))*a1)(a1, a2, a3) & 1) == 0))
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_3_1(v8);
  }
  else
  {
    a1[3] += a3;
  }
}

void pb_encode(void *a1)
{
  if (pb_field_iter_begin_const(v9))
  {
    do
    {
      if ((v10 & 0xF) == 0xA)
      {
        for (i = v11; ; i = v3 + 2)
        {
          int v3 = (void *)*i;
          if (!*i) {
            break;
          }
          if (*(void *)(*v3 + 8))
          {
            uint64_t v4 = OUTLINED_FUNCTION_2_1();
            if ((v5(v4) & 1) == 0) {
              return;
            }
          }
          else
          {
            if ((pb_field_iter_begin_extension_const(v12, v3) & 1) == 0)
            {
              OUTLINED_FUNCTION_1_1();
              OUTLINED_FUNCTION_3_1(v8);
              return;
            }
            encode_field(a1, (uint64_t)v12);
            if (!v6) {
              return;
            }
          }
        }
      }
      else
      {
        encode_field(a1, (uint64_t)v9);
        if (!v7) {
          return;
        }
      }
    }
    while (pb_field_iter_next(v9));
  }
}

void encode_field(void *a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 30);
  if ((v4 & 0x30) == 0x10)
  {
    uint64_t v5 = *(unsigned char **)(a2 + 48);
    if (v5)
    {
      if (!*v5) {
        return;
      }
    }
    else if (v4 <= 0x3F && pb_check_proto3_default_value(a2))
    {
      return;
    }
  }
  else if ((v4 & 0x30) == 0x30 && **(unsigned __int16 **)(a2 + 48) != *(unsigned __int16 *)(a2 + 24))
  {
    return;
  }
  int v6 = *(void **)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 30);
  if (!v6)
  {
    if ((*(unsigned char *)(a2 + 30) & 0x30) != 0) {
      return;
    }
LABEL_16:
    OUTLINED_FUNCTION_6_0();
LABEL_17:
    OUTLINED_FUNCTION_3_1(v9);
    return;
  }
  if ((v7 & 0xC0) == 0x40)
  {
    uint64_t v8 = *(uint64_t (**)(void, void *, uint64_t))(*(void *)a2 + 24);
    if (!v8 || (v8(0, a1, a2) & 1) != 0) {
      return;
    }
    goto LABEL_16;
  }
  if ((v7 & 0x30) == 0x20)
  {
    char v10 = *(_WORD **)(a2 + 48);
    uint64_t v11 = (unsigned __int16)*v10;
    if (!*v10) {
      return;
    }
    if ((v7 & 0xC0) != 0x80 && v11 > *(unsigned __int16 *)(a2 + 28)) {
      goto LABEL_16;
    }
    if ((v7 & 0xEu) >= 6)
    {
      for (unsigned int i = 0; i < v11; ++i)
      {
        if ((*(unsigned char *)(a2 + 30) & 0xCE) == 0x86)
        {
          *(void *)(a2 + 40) = *v6;
          uint64_t v18 = (void *)OUTLINED_FUNCTION_2_1();
          if (v20)
          {
            encode_basic_field(v18, v19);
          }
          else
          {
            pb_encode_tag_for_field(v18, v19);
            if ((v25 & 1) == 0)
            {
              *(void *)(a2 + 40) = v6;
              return;
            }
            pb_encode_varint(a1, 0);
          }
          *(void *)(a2 + 40) = v6;
          if ((v21 & 1) == 0) {
            return;
          }
        }
        else
        {
          v22 = (void *)OUTLINED_FUNCTION_2_1();
          encode_basic_field(v22, v23);
          if (!v24) {
            return;
          }
          int v6 = *(void **)(a2 + 40);
        }
        int v6 = (void *)((char *)v6 + *(unsigned __int16 *)(a2 + 26));
        *(void *)(a2 + 40) = v6;
      }
    }
    else
    {
      pb_encode_tag(a1, 2u, *(unsigned __int16 *)(a2 + 24));
      if (!v14) {
        return;
      }
      int v15 = *(unsigned char *)(a2 + 30) & 0xF;
      if (v15 == 5)
      {
        uint64_t v16 = 8 * v11;
      }
      else
      {
        if (v15 != 4)
        {
          unsigned int v26 = 0;
          uint64_t v38 = 0;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v27 = *(void *)(a2 + 40);
          while (1)
          {
            if (v26 >= v11)
            {
              *(void *)(a2 + 40) = v27;
              uint64_t v16 = *((void *)&v37 + 1);
              goto LABEL_50;
            }
            pb_enc_varint(&v36, a2);
            if ((v28 & 1) == 0) {
              break;
            }
            OUTLINED_FUNCTION_5_1();
            ++v26;
          }
          OUTLINED_FUNCTION_6_0();
          goto LABEL_17;
        }
        uint64_t v16 = 4 * v11;
      }
LABEL_50:
      pb_encode_varint(a1, v16);
      if (v29)
      {
        if (*a1)
        {
          for (unsigned int j = 0; j < v11; ++j)
          {
            long long v31 = (void *)OUTLINED_FUNCTION_2_1();
            if (v33 == 4)
            {
              pb_enc_fixed(v31, v32);
              if ((v34 & 1) == 0) {
                return;
              }
            }
            else
            {
              pb_enc_varint(v31, v32);
              if (!v35) {
                return;
              }
            }
            OUTLINED_FUNCTION_5_1();
          }
        }
        else
        {
          pb_write(a1, 0, v16);
        }
      }
    }
  }
  else
  {
    char v12 = (void *)OUTLINED_FUNCTION_2_1();
    encode_basic_field(v12, v13);
  }
}

void pb_encode_ex(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a4 & 2) != 0)
  {
    pb_encode_submessage((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  }
  else if ((a4 & 4) != 0)
  {
    char v10 = 0;
    pb_encode(a1);
    if (v9) {
      pb_write(a1, (uint64_t)&v10, 1);
    }
  }
  else
  {
    pb_encode(a1);
  }
}

void pb_encode_submessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((OUTLINED_FUNCTION_4_1(a1, a2, a3, a4, a5, a6, a7, a8, v16, v17, v18) & 1) == 0)
  {
    uint64_t v11 = v18;
LABEL_7:
    v8[4] = v11;
    return;
  }
  uint64_t v9 = *((void *)&v17 + 1);
  pb_encode_varint(v8, *((unint64_t *)&v17 + 1));
  if (!v10) {
    return;
  }
  if (!*v8)
  {
    pb_write(v8, 0, *((uint64_t *)&v17 + 1));
    return;
  }
  if (v8[3] + *((void *)&v17 + 1) > v8[2])
  {
    OUTLINED_FUNCTION_1_1();
    char v12 = "stream full";
    goto LABEL_12;
  }
  uint64_t v13 = v8[1];
  *(void *)&long long v16 = *v8;
  *((void *)&v16 + 1) = v13;
  uint64_t v18 = 0;
  long long v17 = *((unint64_t *)&v17 + 1);
  pb_encode(&v16);
  uint64_t v14 = *((void *)&v17 + 1);
  uint64_t v15 = v8[3] + *((void *)&v17 + 1);
  v8[1] = *((void *)&v16 + 1);
  uint64_t v11 = v18;
  void v8[3] = v15;
  v8[4] = v11;
  if (v14 != v9)
  {
    char v12 = "submsg size changed";
LABEL_12:
    if (!v11) {
      uint64_t v11 = (uint64_t)v12;
    }
    goto LABEL_7;
  }
}

uint64_t pb_get_encoded_size(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = OUTLINED_FUNCTION_4_1(a1, a2, a3, a4, a5, a6, a7, a8, v10, v11, v13);
  if (result) {
    *uint64_t v8 = v12;
  }
  return result;
}

void pb_encode_varint(void *a1, unint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2 > 0x7F)
  {
    uint64_t i = 0;
    unint64_t v4 = HIDWORD(a2);
    while (i != 4)
    {
      if (!v4 && a2 < 0x80)
      {
        char v5 = a2 & 0x7F;
        goto LABEL_14;
      }
      v7[i++] = a2 | 0x80;
      LODWORD(a2) = a2 >> 7;
    }
    char v5 = a2 & 0x7F;
    if (v4)
    {
      v5 |= 16 * (v4 & 7);
      unsigned int v6 = v4 >> 3;
      for (uint64_t i = 4; v6; v6 >>= 7)
      {
        v7[i++] = v5 | 0x80;
        char v5 = v6 & 0x7F;
      }
    }
    else
    {
      uint64_t i = 4;
    }
LABEL_14:
    uint64_t v2 = i + 1;
    v7[i] = v5;
  }
  else
  {
    v7[0] = a2;
    uint64_t v2 = 1;
  }
  pb_write(a1, (uint64_t)v7, v2);
}

void pb_encode_svarint(void *a1, uint64_t a2)
{
}

void pb_encode_fixed32(void *a1, int *a2)
{
  int v2 = *a2;
  pb_write(a1, (uint64_t)&v2, 4);
}

void pb_encode_fixed64(void *a1, void *a2)
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = *a2;
  pb_write(a1, (uint64_t)v2, 8);
}

void pb_encode_tag(void *a1, unsigned int a2, unsigned int a3)
{
}

void pb_encode_tag_for_field(void *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned char *)(a2 + 30) & 0xF;
  if v2 < 0xC && ((0xBFFu >> v2)) {
    pb_encode_tag(a1, dword_22571F0F4[v2], *(unsigned __int16 *)(a2 + 24));
  }
  else {
    OUTLINED_FUNCTION_0_1((uint64_t)a1, a1[4]);
  }
}

void pb_encode_string(void *a1, uint64_t a2, unint64_t a3)
{
  pb_encode_varint(a1, a3);
  if (v6)
  {
    pb_write(a1, a2, a3);
  }
}

BOOL pb_check_proto3_default_value(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 30);
  if ((v1 & 0xC0) == 0x80)
  {
    char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 40);
    return v5 == 0;
  }
  if ((v1 & 0xC0) == 0x40)
  {
    if ((v1 & 0xF) == 0xA
      || (char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24),
          v5 == pb_default_field_callback))
    {
      char v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(a1 + 40);
    }
    return v5 == 0;
  }
  if ((v1 & 0xC0) != 0) {
    return 0;
  }
  uint64_t v2 = 0;
  switch((v1 >> 4) & 3)
  {
    case 1u:
      char v7 = *(unsigned __int8 **)(a1 + 48);
      if (v7)
      {
        int v4 = *v7;
        return v4 == 0;
      }
      if (*(void *)(*(void *)a1 + 16)) {
        return 0;
      }
      unsigned int v9 = v1 & 0xF;
      if (v9 > 5)
      {
        uint64_t v2 = 0;
        switch(v9)
        {
          case 6u:
            int v3 = *(unsigned __int16 **)(a1 + 40);
            goto LABEL_6;
          case 7u:
            int v4 = **(unsigned __int8 **)(a1 + 40);
            return v4 == 0;
          case 8u:
          case 9u:
            if (pb_field_iter_begin(v13, *(void *)(a1 + 56), *(void *)(a1 + 40)))
            {
              do
                uint64_t v2 = pb_check_proto3_default_value(v13);
              while (v2 && pb_field_iter_next(v13));
            }
            else
            {
              uint64_t v2 = 1;
            }
            break;
          case 0xBu:
            int v4 = *(unsigned __int16 *)(a1 + 26);
            return v4 == 0;
          default:
            return v2;
        }
      }
      else
      {
        long long v10 = *(unsigned __int8 **)(a1 + 40);
        uint64_t v11 = *(unsigned __int16 *)(a1 + 26);
        do
        {
          uint64_t v2 = v11 == 0;
          if (!v11) {
            break;
          }
          int v12 = *v10++;
          --v11;
        }
        while (!v12);
      }
      break;
    case 2u:
    case 3u:
      int v3 = *(unsigned __int16 **)(a1 + 48);
LABEL_6:
      int v4 = *v3;
      return v4 == 0;
    default:
      return v2;
  }
  return v2;
}

void encode_basic_field(void *a1, uint64_t a2)
{
  if (*(void *)(a2 + 40))
  {
    pb_encode_tag_for_field(a1, a2);
    if (v9)
    {
      unsigned int v10 = *(unsigned __int8 *)(a2 + 30);
      switch(v10 & 0xF)
      {
        case 0u:
          unint64_t v20 = **(unsigned char **)(a2 + 40) != 0;
          pb_encode_varint(a1, v20);
          return;
        case 1u:
        case 2u:
        case 3u:
          uint64_t v11 = (void *)OUTLINED_FUNCTION_2_1();
          pb_enc_varint(v11, v12);
          return;
        case 4u:
        case 5u:
          uint64_t v13 = (void *)OUTLINED_FUNCTION_2_1();
          pb_enc_fixed(v13, v14);
          return;
        case 6u:
          char v21 = *(unsigned __int16 **)(a2 + 40);
          if (!v21)
          {
            char v25 = a1;
            uint64_t v23 = 0;
            unint64_t v22 = 0;
            goto LABEL_45;
          }
          unint64_t v22 = *v21;
          if (v10 > 0x3F || (unint64_t)*(unsigned __int16 *)(a2 + 26) - 2 >= v22)
          {
            uint64_t v23 = (uint64_t)(v21 + 1);
            goto LABEL_44;
          }
          goto LABEL_48;
        case 7u:
          uint64_t v23 = *(void *)(a2 + 40);
          if ((v10 & 0xC0) == 0x80)
          {
            unint64_t v22 = -1;
          }
          else
          {
            if (!*(_WORD *)(a2 + 26)) {
              goto LABEL_48;
            }
            unint64_t v22 = *(unsigned __int16 *)(a2 + 26) - 1;
          }
          if (v23)
          {
            for (unint64_t i = 0; v22 != i; ++i)
            {
              if (!*(unsigned char *)(v23 + i))
              {
                unint64_t v22 = i;
                goto LABEL_44;
              }
            }
            if (*(unsigned char *)(v23 + v22))
            {
LABEL_48:
              OUTLINED_FUNCTION_1_1();
              OUTLINED_FUNCTION_3_1(v26);
              return;
            }
          }
          else
          {
            unint64_t v22 = 0;
          }
LABEL_44:
          char v25 = a1;
LABEL_45:
          pb_encode_string(v25, v23, v22);
          break;
        case 8u:
        case 9u:
          uint64_t v15 = *(void *)(a2 + 56);
          if (!v15) {
            goto LABEL_48;
          }
          if ((v10 & 0xF) != 9) {
            goto LABEL_17;
          }
          uint64_t v16 = *(void *)(a2 + 48);
          if (!v16 || !*(void *)(v16 - 16)) {
            goto LABEL_17;
          }
          uint64_t v17 = OUTLINED_FUNCTION_2_1();
          if (v18(v17))
          {
            uint64_t v15 = *(void *)(a2 + 56);
LABEL_17:
            uint64_t v19 = *(void *)(a2 + 40);
            pb_encode_submessage((uint64_t)a1, v15, v19, v4, v5, v6, v7, v8);
          }
          return;
        case 0xBu:
          uint64_t v23 = *(void *)(a2 + 40);
          unint64_t v22 = *(unsigned __int16 *)(a2 + 26);
          goto LABEL_44;
        default:
          goto LABEL_48;
      }
    }
  }
}

void pb_enc_varint(void *a1, uint64_t a2)
{
  int v2 = *(unsigned char *)(a2 + 30) & 0xF;
  if (v2 == 2)
  {
    switch(*(_WORD *)(a2 + 26))
    {
      case 1:
        unint64_t v3 = **(unsigned __int8 **)(a2 + 40);
        goto LABEL_4;
      case 2:
        unint64_t v3 = **(unsigned __int16 **)(a2 + 40);
        goto LABEL_4;
      case 4:
        unint64_t v3 = **(unsigned int **)(a2 + 40);
        goto LABEL_4;
      case 8:
        unint64_t v3 = **(void **)(a2 + 40);
        goto LABEL_4;
      default:
        goto LABEL_7;
    }
  }
  switch(*(_WORD *)(a2 + 26))
  {
    case 1:
      unint64_t v3 = **(char **)(a2 + 40);
      goto LABEL_14;
    case 2:
      unint64_t v3 = **(__int16 **)(a2 + 40);
      goto LABEL_14;
    case 4:
      unint64_t v3 = **(int **)(a2 + 40);
      goto LABEL_14;
    case 8:
      unint64_t v3 = **(void **)(a2 + 40);
LABEL_14:
      if (v2 == 3) {
        pb_encode_svarint(a1, v3);
      }
      else {
LABEL_4:
      }
        pb_encode_varint(a1, v3);
      break;
    default:
LABEL_7:
      OUTLINED_FUNCTION_0_1((uint64_t)a1, a1[4]);
      break;
  }
}

void pb_enc_fixed(void *a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 26);
  if (v2 == 8)
  {
    pb_encode_fixed64(a1, *(void **)(a2 + 40));
  }
  else if (v2 == 4)
  {
    pb_encode_fixed32(a1, *(int **)(a2 + 40));
  }
  else
  {
    OUTLINED_FUNCTION_0_1((uint64_t)a1, a1[4]);
  }
}

uint64_t OUTLINED_FUNCTION_0_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!a2) {
    a2 = v2;
  }
  *(void *)(a1 + 32) = a2;
  return 0;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  if (!a1) {
    a1 = v1;
  }
  *(void *)(v2 + 32) = a1;
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, uint64_t a11)
{
  a11 = 0;
  a9 = 0u;
  a10 = 0u;
  return pb_encode(&a9);
}

void OUTLINED_FUNCTION_5_1()
{
  *(void *)(v0 + 40) += *(unsigned __int16 *)(v0 + 26);
}

void pb_read(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unint64_t v3 = a3;
    if (a2 || *(uint64_t (**)(uint64_t, unsigned char *, uint64_t))a1 == buf_read)
    {
      if (*(void *)(a1 + 16) >= a3 && ((*(uint64_t (**)(uint64_t))a1)(a1) & 1) != 0)
      {
        *(void *)(a1 + 16) -= v3;
      }
      else
      {
        OUTLINED_FUNCTION_0_2();
        OUTLINED_FUNCTION_1_2();
        *(void *)(a1 + 24) = v5;
      }
    }
    else
    {
      while (v3 >= 0x11)
      {
        if (!pb_read(a1, v6, 16)) {
          return;
        }
        v3 -= 16;
      }
      pb_read(a1, v6, v3);
    }
  }
}

uint64_t buf_read(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  unint64_t v3 = *(char **)(a1 + 8);
  *(void *)(a1 + 8) = &v3[a3];
  if (a2 && a3)
  {
    do
    {
      char v4 = *v3++;
      *a2++ = v4;
      --a3;
    }
    while (a3);
  }
  return 1;
}

uint64_t pb_istream_from_buffer@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = buf_read;
  a3[1] = result;
  a3[2] = a2;
  a3[3] = 0;
  return result;
}

void pb_decode_varint32(uint64_t a1, uint64_t a2)
{
}

void pb_decode_varint32_eof(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  OUTLINED_FUNCTION_3_2();
  pb_readbyte(v6, (uint64_t)&v16);
  if (v7)
  {
    int v8 = v16;
    if ((char)v16 < 0)
    {
      int v8 = v16 & 0x7F;
      unsigned __int8 v9 = 7;
      while (1)
      {
        pb_readbyte(v3, (uint64_t)&v16);
        if (!v10) {
          break;
        }
        int v11 = v9;
        if (v9 < 0x20u)
        {
          v8 |= (v16 & 0x7F) << v9;
        }
        else
        {
          if (v9 >= 0x3Fu) {
            int v12 = 1;
          }
          else {
            int v12 = 255;
          }
          BOOL v14 = v8 < 0 && v12 == v16;
          if ((v16 & 0x7F) == 0) {
            BOOL v14 = 1;
          }
          if (v9 > 0x3Fu || !v14) {
            goto LABEL_28;
          }
        }
        v9 += 7;
        if ((v16 & 0x80) == 0)
        {
          if (v11 == 28 && (v16 & 0x70) != 0)
          {
LABEL_28:
            OUTLINED_FUNCTION_0_2();
            OUTLINED_FUNCTION_1_2();
            *(void *)(v3 + 24) = v15;
            return;
          }
          goto LABEL_3;
        }
      }
    }
    else
    {
LABEL_3:
      int *v4 = v8;
    }
  }
  else if (a3 && !*(void *)(v3 + 16))
  {
    *a3 = 1;
  }
}

void pb_decode_varint()
{
  OUTLINED_FUNCTION_3_2();
  unsigned __int8 v2 = 0;
  uint64_t v3 = 0;
  while (1)
  {
    unsigned __int8 v4 = v2;
    if (v2 >= 0x40u) {
      break;
    }
    pb_readbyte(v0, (uint64_t)&v7);
    if (!v5) {
      return;
    }
    v3 |= (unint64_t)(v7 & 0x7F) << v4;
    unsigned __int8 v2 = v4 + 7;
    if ((v7 & 0x80) == 0)
    {
      *uint64_t v1 = v3;
      return;
    }
  }
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2();
  *(void *)(v0 + 24) = v6;
}

void pb_readbyte(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) && ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t))a1)(a1, a2, 1) & 1) != 0)
  {
    --*(void *)(a1 + 16);
  }
  else
  {
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_1_2();
    *(void *)(a1 + 24) = v3;
  }
}

void pb_decode_tag(uint64_t a1, int *a2, unsigned int *a3, unsigned char *a4)
{
  *a4 = 0;
  *a2 = 0;
  *a3 = 0;
  pb_decode_varint32_eof(a1, (uint64_t)&v8, a4);
  if (v6)
  {
    char v7 = v8;
    *a3 = v8 >> 3;
    *a2 = v7 & 7;
  }
}

void pb_skip_field(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
      do
        pb_read(a1, (uint64_t)&v7, 1uLL);
      while (v3 && v7 < 0);
      break;
    case 1:
      unint64_t v4 = 8;
      goto LABEL_11;
    case 2:
      pb_decode_varint32(a1, (uint64_t)&v8);
      if (v5) {
        pb_read(a1, 0, v8);
      }
      break;
    case 5:
      unint64_t v4 = 4;
LABEL_11:
      pb_read(a1, 0, v4);
      break;
    default:
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_1_2();
      *(void *)(a1 + 24) = v6;
      break;
  }
}

void pb_make_string_substream()
{
  OUTLINED_FUNCTION_3_2();
  pb_decode_varint32(v2, (uint64_t)&v7);
  if (v3)
  {
    long long v4 = *(_OWORD *)(v0 + 16);
    *uint64_t v1 = *(_OWORD *)v0;
    v1[1] = v4;
    uint64_t v5 = v7;
    if (*((void *)v1 + 2) >= (unint64_t)v7)
    {
      *((void *)v1 + 2) = v7;
      *(void *)(v0 + 16) -= v5;
    }
    else
    {
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_1_2();
      *(void *)(v0 + 24) = v6;
    }
  }
}

void pb_close_string_substream()
{
  OUTLINED_FUNCTION_3_2();
  unint64_t v3 = *(void *)(v2 + 16);
  if (!v3 || (pb_read(v1, 0, v3), v4))
  {
    *(void *)(v0 + 8) = *(void *)(v1 + 8);
    *(void *)(v0 + 24) = *(void *)(v1 + 24);
  }
}

uint64_t pb_decode_ex(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 2) != 0)
  {
    pb_make_string_substream();
    if ((v9 & 1) == 0) {
      return 0;
    }
    pb_decode_inner((uint64_t)&v13, a2, a3, a4);
    uint64_t v8 = v10;
    pb_close_string_substream();
    if (!v11) {
      return 0;
    }
  }
  else
  {
    pb_decode_inner(a1, a2, a3, a4);
    return v7;
  }
  return v8;
}

void pb_decode_inner(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unsigned __int16 v53 = 0;
  uint64_t v52 = 0;
  BOOL v6 = pb_field_iter_begin(v44, a2, a3);
  if ((a4 & 1) == 0 && v6)
  {
    pb_message_set_to_defaults((uint64_t)v44, v7, v8, v9, v10, v11, v12, v13);
    if ((v14 & 1) == 0)
    {
      OUTLINED_FUNCTION_0_2();
LABEL_74:
      OUTLINED_FUNCTION_1_2();
      *(void *)(a1 + 24) = v39;
      return;
    }
  }
  int v40 = 0;
  uint64_t v15 = 0;
  unsigned int v16 = 0;
  int v17 = 0xFFFF;
  while (*(void *)(a1 + 16))
  {
    pb_decode_tag(a1, (int *)&v42, &v43, &v41);
    if ((v18 & 1) == 0)
    {
      if (!v41) {
        return;
      }
      break;
    }
    uint64_t v19 = v43;
    if (!v43)
    {
      if ((a4 & 4) == 0)
      {
LABEL_55:
        OUTLINED_FUNCTION_1_2();
        *(void *)(a1 + 24) = v31;
        return;
      }
      break;
    }
    if (pb_field_iter_find(v44, v43) && (v49 & 0xF) != 0xA)
    {
      if ((v49 & 0x30) == 0x20 && v51 == &v48)
      {
        if (v17 != v45)
        {
          if (v17 != 0xFFFF && v53 != v40) {
            goto LABEL_55;
          }
          unsigned __int16 v53 = 0;
          int v40 = v48;
          int v17 = v45;
        }
        v51 = &v53;
      }
      if ((v49 & 0x30) == 0 && v46 <= 0x3Fu) {
        *(_DWORD *)((char *)&v52 + (((unint64_t)v46 >> 3) & 0x1FFC)) |= 1 << v46;
      }
      decode_field(a1, v42, (uint64_t)v44);
      if ((v23 & 1) == 0) {
        return;
      }
    }
    else
    {
      if (!v16)
      {
        if (pb_field_iter_find_extension((uint64_t)v44))
        {
          uint64_t v15 = (void **)*v50;
          unsigned int v20 = v47;
        }
        else
        {
          unsigned int v20 = 0;
        }
        if (v15) {
          unsigned int v16 = v20;
        }
        else {
          unsigned int v16 = -1;
        }
      }
      uint64_t v24 = v42;
      if (v19 < v16) {
        goto LABEL_36;
      }
      uint64_t v26 = *(void *)(a1 + 16);
      uint64_t v27 = v26;
      char v28 = v15;
      if (v15)
      {
        while (v26 == v27)
        {
          int v29 = (uint64_t (*)(uint64_t, void **, uint64_t, uint64_t))**v28;
          if (v29)
          {
            if ((v29(a1, v28, v19, v24) & 1) == 0) {
              return;
            }
          }
          else
          {
            if (!pb_field_iter_begin_extension(v54, v28)) {
              goto LABEL_55;
            }
            if (v19 == v55)
            {
              if (v54[1])
              {
                *((unsigned char *)v28 + 24) = 1;
                decode_field(a1, v24, (uint64_t)v54);
                if (!v30) {
                  return;
                }
              }
            }
          }
          char v28 = (void **)v28[2];
          uint64_t v27 = *(void *)(a1 + 16);
          if (!v28) {
            break;
          }
        }
      }
      if (v26 == v27)
      {
        LODWORD(v24) = v42;
LABEL_36:
        pb_skip_field(a1, v24);
        if ((v25 & 1) == 0) {
          return;
        }
      }
    }
  }
  if (v17 != 0xFFFF && v53 != v40) {
    goto LABEL_73;
  }
  if (*(_WORD *)(*(void *)v44 + 34))
  {
    unsigned int v33 = *(unsigned __int16 *)(*(void *)v44 + 34) >= 0x40u ? 64 : *(unsigned __int16 *)(*(void *)v44 + 34);
    uint64_t v34 = v33 >> 5;
    int v35 = (int *)&v52;
    uint64_t v36 = v34;
    while (v36)
    {
      int v37 = *v35++;
      --v36;
      if (v37 != -1) {
        goto LABEL_73;
      }
    }
    int v38 = v33 & 0x1F;
    if (v38)
    {
      if (*((_DWORD *)&v52 + v34) != 0xFFFFFFFF >> -(char)v38)
      {
LABEL_73:
        OUTLINED_FUNCTION_0_2();
        goto LABEL_74;
      }
    }
  }
}

void pb_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void pb_decode_BOOL(uint64_t a1, BOOL *a2)
{
  pb_decode_varint32(a1, (uint64_t)&v4);
  if (v3) {
    *a2 = v4 != 0;
  }
}

void pb_decode_svarint(uint64_t a1, unint64_t *a2)
{
  pb_decode_varint();
  if (v3) {
    *a2 = -(uint64_t)(v4 & 1) ^ (v4 >> 1);
  }
}

void pb_decode_fixed32(uint64_t a1, _DWORD *a2)
{
  pb_read(a1, (uint64_t)&v4, 4uLL);
  if (v3) {
    *a2 = v4;
  }
}

void pb_decode_fixed64(uint64_t a1, void *a2)
{
  pb_read(a1, (uint64_t)&v4, 8uLL);
  if (v3) {
    *a2 = v4;
  }
}

void pb_message_set_to_defaults(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v26 = 0;
  if (*(void *)(*(void *)a1 + 16))
  {
    *((void *)&v27 + 1) = *(void *)(*(void *)a1 + 16);
    long long v28 = 0xFFFFFFFFFFFFFFFFLL;
    OUTLINED_FUNCTION_5_2(a1, a2, a3, a4, a5, a6, a7, a8, v25, SWORD2(v25), SBYTE6(v25), SHIBYTE(v25), 0, 0, (char)buf_read);
    if (!v9) {
      return;
    }
  }
  while (1)
  {
    char v10 = *(unsigned char *)(a1 + 30);
    if ((v10 & 0xF) == 0xA) {
      break;
    }
    if ((v10 & 0xC0) == 0x80)
    {
      **(void **)(a1 + 32) = 0;
      if ((v10 & 0x20) != 0) {
        goto LABEL_24;
      }
    }
    else if ((*(unsigned char *)(a1 + 30) & 0xC0) == 0)
    {
      int v12 = v10 & 0x30;
      if (v12 == 48 || v12 == 32)
      {
LABEL_24:
        **(_WORD **)(a1 + 48) = 0;
        goto LABEL_25;
      }
      if (v12 == 16)
      {
        uint64_t v13 = *(unsigned char **)(a1 + 48);
        if (v13) {
          *uint64_t v13 = 0;
        }
      }
      if ((v10 & 0xE) == 8
        && ((uint64_t v14 = *(void *)(a1 + 56), *(void *)(v14 + 16)) || *(void *)(v14 + 24) || **(void **)(v14 + 8)))
      {
        if (pb_field_iter_begin(v29, v14, *(void *)(a1 + 40)) && !pb_message_set_to_defaults(v29)) {
          return;
        }
      }
      else
      {
        memset(*(void **)(a1 + 40), 0, *(unsigned __int16 *)(a1 + 26));
      }
    }
LABEL_25:
    if (HIDWORD(v26) && HIDWORD(v26) == *(unsigned __int16 *)(a1 + 24))
    {
      decode_field((uint64_t)&v27, v26, a1);
      if (!v15) {
        return;
      }
      OUTLINED_FUNCTION_5_2(v15, v16, v17, v18, v19, v20, v21, v22, v25, SWORD2(v25), SBYTE6(v25), SHIBYTE(v25), v26, HIDWORD(v26), v27);
      if (!v23) {
        return;
      }
      uint64_t v24 = *(unsigned char **)(a1 + 48);
      if (v24) {
        *uint64_t v24 = 0;
      }
    }
    if (!pb_field_iter_next((_WORD *)a1)) {
      return;
    }
  }
  uint64_t v11 = **(void **)(a1 + 40);
  if (!v11) {
    goto LABEL_25;
  }
  while (1)
  {
    if (pb_field_iter_begin_extension(v29, (void *)v11))
    {
      *(unsigned char *)(v11 + 24) = 0;
      if (!pb_message_set_to_defaults(v29)) {
        break;
      }
    }
    uint64_t v11 = *(void *)(v11 + 16);
    if (!v11) {
      goto LABEL_25;
    }
  }
}

void decode_field(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  unsigned int v4 = *(unsigned __int8 *)(a3 + 30);
  if ((v4 & 0xC0) == 0x80) {
    goto LABEL_19;
  }
  if ((v4 & 0xC0) == 0x40)
  {
    if (!*(void *)(*(void *)a3 + 24))
    {
      pb_skip_field(a1, a2);
      return;
    }
    switch(a2)
    {
      case 2:
        pb_make_string_substream();
        if (!v8) {
          return;
        }
        unint64_t v16 = v43;
        while (1)
        {
          uint64_t v17 = OUTLINED_FUNCTION_2_2(v8, v9, v10, v11, v12, v13, v14, v15, v41, v42[0]);
          uint64_t v8 = v18(v17);
          if ((v8 & 1) == 0) {
            break;
          }
          if (v43) {
            BOOL v19 = v43 >= v16;
          }
          else {
            BOOL v19 = 1;
          }
          unint64_t v16 = v43;
          if (v19)
          {
            pb_close_string_substream();
            return;
          }
        }
        goto LABEL_19;
      case 5:
        uint64_t v21 = 4;
        pb_read(a1, (uint64_t)v45, 4uLL);
        if ((v22 & 1) == 0) {
          return;
        }
        break;
      case 1:
        uint64_t v21 = 8;
        pb_read(a1, (uint64_t)v45, 8uLL);
        if (!v22) {
          return;
        }
        break;
      case 0:
        uint64_t v21 = 0;
        while (v21 != 10)
        {
          pb_read(a1, (uint64_t)&v45[v21], 1uLL);
          if (!v22) {
            return;
          }
          int v30 = (char)v45[v21++];
          if ((v30 & 0x80000000) == 0) {
            goto LABEL_59;
          }
        }
        OUTLINED_FUNCTION_0_2();
        goto LABEL_20;
      default:
LABEL_19:
        OUTLINED_FUNCTION_0_2();
LABEL_20:
        OUTLINED_FUNCTION_1_2();
        *(void *)(a1 + 24) = v20;
        return;
    }
LABEL_59:
    v42[1] = v45;
    unint64_t v43 = v21;
    uint64_t v44 = 0;
    uint64_t v39 = OUTLINED_FUNCTION_2_2(v22, v23, v24, v25, v26, v27, v28, v29, v41, (char)buf_read);
    v40(v39);
    return;
  }
  if ((v4 & 0xC0) != 0) {
    goto LABEL_19;
  }
  switch((v4 >> 4) & 3)
  {
    case 1u:
      uint64_t v7 = *(unsigned char **)(a3 + 48);
      if (v7) {
        *uint64_t v7 = 1;
      }
      goto LABEL_39;
    case 2u:
      unsigned int v31 = v4 & 0xE;
      if (a2 != 2 || v31 > 5)
      {
        unsigned int v33 = *(_WORD **)(a3 + 48);
        unsigned int v34 = (unsigned __int16)*v33;
        *(void *)(a3 + 40) = *(void *)(a3 + 32)
                             + *(unsigned __int16 *)(a3 + 26) * (unint64_t)(unsigned __int16)*v33;
        *unsigned int v33 = v34 + 1;
        if (v34 >= *(unsigned __int16 *)(a3 + 28)) {
          goto LABEL_63;
        }
LABEL_39:
        decode_basic_field(a1, a2, a3);
      }
      else
      {
        uint64_t v36 = *(_WORD **)(a3 + 48);
        *(void *)(a3 + 40) = *(void *)(a3 + 32)
                             + (unsigned __int16)*v36 * (unint64_t)*(unsigned __int16 *)(a3 + 26);
        pb_make_string_substream();
        if (v37)
        {
          while (1)
          {
            if (!v43) {
              goto LABEL_64;
            }
            if ((unsigned __int16)*v36 >= *(unsigned __int16 *)(a3 + 28)) {
              goto LABEL_63;
            }
            decode_basic_field((uint64_t)v42, 255, a3);
            if (!v38) {
              break;
            }
            ++*v36;
            *(void *)(a3 + 40) += *(unsigned __int16 *)(a3 + 26);
          }
          if (v43)
          {
LABEL_63:
            OUTLINED_FUNCTION_0_2();
            goto LABEL_20;
          }
LABEL_64:
          pb_close_string_substream();
        }
      }
      break;
    case 3u:
      if ((v4 & 0xE) == 8 && **(unsigned __int16 **)(a3 + 48) != *(unsigned __int16 *)(a3 + 24))
      {
        memset(*(void **)(a3 + 40), 0, *(unsigned __int16 *)(a3 + 26));
        uint64_t v35 = *(void *)(a3 + 56);
        if ((*(void *)(v35 + 16) || *(void *)(v35 + 24) || **(void **)(v35 + 8))
          && pb_field_iter_begin(v42, v35, *(void *)(a3 + 40))
          && !pb_message_set_to_defaults(v42))
        {
          goto LABEL_20;
        }
      }
      **(_WORD **)(a3 + 48) = *(_WORD *)(a3 + 24);
      decode_basic_field(a1, a2, a3);
      return;
    default:
      goto LABEL_39;
  }
}

void decode_basic_field(uint64_t a1, int a2, uint64_t a3)
{
  int v4 = *(unsigned char *)(a3 + 30) & 0xF;
  switch(*(unsigned char *)(a3 + 30) & 0xF)
  {
    case 0:
      if (a2 && a2 != 255) {
        goto LABEL_45;
      }
      uint64_t v14 = *(BOOL **)(a3 + 40);
      pb_decode_BOOL(a1, v14);
      return;
    case 1:
    case 2:
    case 3:
      if (a2 && a2 != 255) {
        goto LABEL_45;
      }
      if (v4 != 2)
      {
        if (v4 == 3)
        {
          pb_decode_svarint(a1, &v39);
          if (!v25) {
            return;
          }
          int v26 = *(unsigned __int16 *)(a3 + 26);
        }
        else
        {
          pb_decode_varint();
          if (!v27) {
            return;
          }
          int v26 = *(unsigned __int16 *)(a3 + 26);
          unint64_t v28 = v40[0];
          if (v26 == 8)
          {
LABEL_85:
            **(void **)(a3 + 40) = v28;
            return;
          }
          unint64_t v39 = SLODWORD(v40[0]);
        }
        switch(v26)
        {
          case 1:
            unint64_t v7 = v39;
            **(unsigned char **)(a3 + 40) = v39;
            uint64_t v9 = (char)v7;
            goto LABEL_82;
          case 2:
            unint64_t v7 = v39;
            **(_WORD **)(a3 + 40) = v39;
            uint64_t v9 = (__int16)v7;
            goto LABEL_82;
          case 4:
            unint64_t v7 = v39;
            **(_DWORD **)(a3 + 40) = v39;
            uint64_t v9 = (int)v7;
LABEL_82:
            if (v9 != v7) {
              goto LABEL_83;
            }
            return;
          case 8:
            unint64_t v28 = v39;
            goto LABEL_85;
          default:
LABEL_83:
            OUTLINED_FUNCTION_0_2();
            break;
        }
        goto LABEL_46;
      }
      pb_decode_varint();
      if (v6)
      {
        switch(*(_WORD *)(a3 + 26))
        {
          case 1:
            OUTLINED_FUNCTION_4_2();
            *uint64_t v8 = v7;
            uint64_t v9 = v7;
            goto LABEL_82;
          case 2:
            OUTLINED_FUNCTION_4_2();
            *uint64_t v35 = v7;
            uint64_t v9 = (unsigned __int16)v7;
            goto LABEL_82;
          case 4:
            OUTLINED_FUNCTION_4_2();
            *uint64_t v36 = v7;
            uint64_t v9 = v7;
            goto LABEL_82;
          case 8:
            OUTLINED_FUNCTION_4_2();
            *int v38 = v37;
            break;
          default:
            goto LABEL_83;
        }
      }
      return;
    case 4:
      if (a2 != 5 && a2 != 255) {
        goto LABEL_45;
      }
      uint64_t v15 = *(_DWORD **)(a3 + 40);
      pb_decode_fixed32(a1, v15);
      return;
    case 5:
      if (a2 != 1 && a2 != 255) {
        goto LABEL_45;
      }
      unint64_t v16 = *(void **)(a3 + 40);
      pb_decode_fixed64(a1, v16);
      return;
    case 6:
      if (a2 != 2) {
        goto LABEL_45;
      }
      pb_decode_varint32(a1, (uint64_t)v40);
      if (!v17) {
        return;
      }
      unint64_t v18 = LODWORD(v40[0]);
      if (LODWORD(v40[0]) >= 0x10000
        || (*(unsigned char *)(a3 + 30) & 0xC0) == 0x80
        || (unint64_t)LODWORD(v40[0]) + 2 > *(unsigned __int16 *)(a3 + 26))
      {
        goto LABEL_40;
      }
      BOOL v19 = *(_WORD **)(a3 + 40);
      *BOOL v19 = v40[0];
      uint64_t v20 = (uint64_t)(v19 + 1);
      goto LABEL_72;
    case 7:
      if (a2 != 2) {
        goto LABEL_45;
      }
      uint64_t v21 = *(void *)(a3 + 40);
      pb_decode_varint32(a1, (uint64_t)v40);
      if (!v22) {
        return;
      }
      unint64_t v18 = LODWORD(v40[0]);
      if (LODWORD(v40[0]) == -1
        || (*(unsigned char *)(a3 + 30) & 0xC0) == 0x80
        || LODWORD(v40[0]) >= *(unsigned __int16 *)(a3 + 26))
      {
        goto LABEL_40;
      }
      *(unsigned char *)(v21 + LODWORD(v40[0])) = 0;
      uint64_t v34 = a1;
      uint64_t v20 = v21;
      goto LABEL_79;
    case 8:
    case 9:
      if (a2 != 2) {
        goto LABEL_45;
      }
      pb_make_string_substream();
      if (!v10) {
        return;
      }
      if (!*(void *)(a3 + 56))
      {
LABEL_45:
        OUTLINED_FUNCTION_0_2();
        goto LABEL_46;
      }
      if ((*(unsigned char *)(a3 + 30) & 0xF) == 9 && (uint64_t v11 = *(void *)(a3 + 48)) != 0)
      {
        uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 - 16);
        if (v12)
        {
          int v13 = v12(v40, a3, v11 - 8);
          LOBYTE(v12) = v40[2] == 0;
          goto LABEL_58;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
      int v13 = 1;
LABEL_58:
      if ((v12 & 1) == 0 && v13)
      {
        unsigned int v29 = *(unsigned __int8 *)(a3 + 30);
        BOOL v30 = v29 >= 0x40;
        int v31 = v29 & 0x30;
        uint64_t v33 = !v30 && v31 != 32;
        pb_decode_inner(v40, *(void *)(a3 + 56), *(void *)(a3 + 40), v33);
      }
      pb_close_string_substream();
      return;
    case 0xB:
      if (a2 != 2) {
        goto LABEL_45;
      }
      pb_decode_varint32(a1, (uint64_t)v40);
      if (!v23) {
        return;
      }
      if (LODWORD(v40[0]) >= 0x10000) {
        goto LABEL_40;
      }
      if (LODWORD(v40[0]))
      {
        unint64_t v18 = *(unsigned __int16 *)(a3 + 26);
        if (LODWORD(v40[0]) == v18)
        {
          uint64_t v20 = *(void *)(a3 + 40);
LABEL_72:
          uint64_t v34 = a1;
LABEL_79:
          pb_read(v34, v20, v18);
        }
        else
        {
LABEL_40:
          OUTLINED_FUNCTION_0_2();
LABEL_46:
          OUTLINED_FUNCTION_1_2();
          *(void *)(a1 + 24) = v24;
        }
      }
      else
      {
        memset(*(void **)(a3 + 40), 0, *(unsigned __int16 *)(a3 + 26));
      }
      return;
    default:
      goto LABEL_45;
  }
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return 0;
}

char *OUTLINED_FUNCTION_2_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  return &a10;
}

void OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12, int a13, unsigned int a14, char a15)
{
  pb_decode_tag((uint64_t)&a15, &a13, &a14, &a12);
}

void HIDAccesorySessionEventCallback_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_225713000, v1, OS_LOG_TYPE_ERROR, "HIDAccesorySessionEventCallback event:%d result:%d", v2, 0xEu);
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x270F4A960]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x270F4A998]();
}

uint64_t BTAccessoryManagerGetFeatureCapability()
{
  return MEMORY[0x270F4A9E0]();
}

uint64_t BTAccessoryManagerGetTimeSyncId()
{
  return MEMORY[0x270F4AA68]();
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient()
{
  return MEMORY[0x270F4AA90]();
}

uint64_t BTAccessoryManagerRemoteTimeSyncEnable()
{
  return MEMORY[0x270F4AAA0]();
}

uint64_t BTAccessoryManagerSendCustomMessage()
{
  return MEMORY[0x270F4AAB8]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x270F4AB30]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x270F4AB68]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x270F4AB78]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x270F4ACA0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x270F4ACB8]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x270F4AD78]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x270F4AD90]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x270F4AD98]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3F00](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}