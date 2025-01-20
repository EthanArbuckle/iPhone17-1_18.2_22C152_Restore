uint64_t sub_1005572E8(uint64_t a1, uint64_t a2)
{
  unint64_t *v2;
  unsigned __int8 v3;
  uint64_t v4;
  unint64_t v5;
  unsigned char v7[8];
  unsigned char v8[8];
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;

  v2 = (unint64_t *)*(&off_100682E60
                           + ((127 * ((dword_1006A5558 + dword_10069D110) ^ 0x1C)) ^ byte_1005B5B20[byte_10063DEC0[(127 * ((dword_1006A5558 + dword_10069D110) ^ 0x1C))] ^ 0x4C])
                           + 265);
  v3 = 127 * ((dword_1006A5558 - *v2) ^ 0x1C);
  v4 = (uint64_t)*(&off_100682E60
                + (byte_10063E0C8[~byte_10061B0C8[v3 - 8] - 8] ^ v3)
                + 549);
  v5 = 971699327 * ((unint64_t)&v7[*v2 + *(void *)(v4 - 4)] ^ 0xF8F82EB9AE22FA1CLL);
  *v2 = v5;
  *(void *)(v4 - 4) = v5;
  v11 = (290670313 * ((v8 - 1640435865 - 2 * (v8 & 0x9E38EF67)) ^ 0xB509D6AE)) ^ 0x3B8E9C6E;
  v9 = a1 + 144;
  v10 = a2;
  LOBYTE(v4) = 127 * ((*(_DWORD *)(v4 - 4) + *(_DWORD *)v2) ^ 0x1C);
  (*((void (**)(unsigned char *))*(&off_100682E60
                                    + ((127 * ((dword_1006A5558 + dword_10069D110) ^ 0x1C)) ^ byte_10063E0C0[~byte_10061B0C0[(127 * ((dword_1006A5558 + dword_10069D110) ^ 0x1C))]])
                                    + 417)
   + (byte_1005B5E24[(byte_10063DFC8[v4 - 8] ^ 0x4B) - 4] ^ v4)
   + 12581))(v8);
  return 0;
}

void sub_1005574E8(uint64_t a1, uint64_t a2)
{
  v2 = (unint64_t *)*(&off_100682E60
                           + ((127 * ((dword_1006A5558 + dword_10069D160) ^ 0x1C)) ^ byte_1005B5E20[byte_10063DFC0[(127 * ((dword_1006A5558 + dword_10069D160) ^ 0x1C))] ^ 0x4B])
                           + 575);
  uint64_t v3 = (uint64_t)*(&off_100682E60
                + ((127 * ((dword_1006A5558 - *v2) ^ 0x1C)) ^ byte_1005E07C0[byte_1005B5A20[(127 * ((dword_1006A5558 - *v2) ^ 0x1C))] ^ 0x3E])
                + 526);
  unint64_t v4 = (*(void *)(v3 - 4) - *v2) ^ (unint64_t)&v8;
  unint64_t *v2 = (971699327 * v4) ^ 0xF8F82EB9AE22FA1CLL;
  *(void *)(v3 - 4) = 971699327 * (v4 ^ 0xF8F82EB9AE22FA1CLL);
  uint64_t v11 = a2;
  unsigned int v10 = -738757634 - 1358963743 * (&v9 ^ 0x2B33248C);
  uint64_t v5 = (uint64_t)*(&off_100682E60
                + ((127 * (dword_10069D160 ^ 0x1C ^ dword_1006A5558)) ^ byte_1005E07C0[byte_1005B5A20[(127 * (dword_10069D160 ^ 0x1C ^ dword_1006A5558))] ^ 0x8B])
                + 397);
  (*(void (**)(uint64_t *))(v5
                                    + 8
                                    * ((byte_1005B5B20[byte_10063DEC0[(127 * ((*(_DWORD *)(v3 - 4) - *(_DWORD *)v2) ^ 0x1C))] ^ 0x31] ^ (127 * ((*(_DWORD *)(v3 - 4) - *(_DWORD *)v2) ^ 0x1C)))
                                     + 12641)))(&v9);
  uint64_t v6 = v9 - 0x1655264E004F25B7;
  *(void *)(a1 + 16) = (*(uint64_t (**)(void, uint64_t))(v5
                                                                    + 8
                                                                    * (((127 * ((*(_DWORD *)(v3 - 4) + *(_DWORD *)v2) ^ 0x1C)) ^ byte_1005B5B20[byte_10063DEC0[(127 * ((*(_DWORD *)(v3 - 4) + *(_DWORD *)v2) ^ 0x1C))] ^ 0x5D])
                                                                     + 12588)))((*(_DWORD *)(v9 - 0x1655264E004F25B7) - 714054161), 3103194670);
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1005577AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = (v2 - 1400285292);
  unint64_t v7 = (((a2 + v6) * v3) ^ (((a2 + v6) * v3) >> 16)) * v3;
  *(unsigned char *)(a1 + v6) = byte_100628ACC[(v7 >> 24) - 12] ^ *(unsigned char *)(a2 + v6) ^ byte_1006130C4[(v7 >> 24) - 3] ^ byte_10062F618[(v7 >> 24) - 5] ^ v7 ^ (-45 * (((((a2 + v6) * v3) ^ (((a2 + v6) * v3) >> 16)) * v3) >> 24));
  return (*(uint64_t (**)(void))(v5 + 8 * ((13392 * (v2 - 1 == v4)) ^ 0x16BAu)))();
}

uint64_t sub_100557844(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 24) = ((v2 + 495) ^ 0x231) + *v3;
  return 0;
}

uint64_t sub_1005578A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t)*(&off_100682E60
                + ((127 * ((dword_1006A5558 - dword_10069D150) ^ 0x1C)) ^ byte_1005E07C0[byte_1005B5A20[(127 * ((dword_1006A5558 - dword_10069D150) ^ 0x1C))] ^ 0xC7])
                + 103);
  uint64_t v3 = *(void *)(v2 - 4);
  uint64_t v4 = (uint64_t)*(&off_100682E60
                + (byte_10063E0C8[(byte_10061B0C8[(127
                                                                                                 * ((dword_1006A5558 + v3) ^ 0x1C))
                                                                               - 8] ^ 0x19)
                                                               - 8] ^ (127 * ((dword_1006A5558 + v3) ^ 0x1C)))
                + 595);
  uint64_t v5 = (*(void *)(v4 - 4) ^ v3) - (void)&v7;
  *(void *)(v2 - 4) = 971699327 * (v5 + 0x707D14651DD05E4);
  *(void *)(v4 - 4) = 971699327 * (v5 ^ 0xF8F82EB9AE22FA1CLL);
  unsigned int v11 = (290670313 * (((v8 | 0xF738AF07) - (v8 & 0xF738AF07)) ^ 0xDC0996CE)) ^ 0x3B8E9C6E;
  uint64_t v9 = a1 + 8;
  uint64_t v10 = a2;
  LOBYTE(v4) = 127 * ((*(_DWORD *)(v4 - 4) + *(_DWORD *)(v2 - 4)) ^ 0x1C);
  (*((void (**)(unsigned char *))*(&off_100682E60
                                    + ((127 * (dword_10069D150 ^ 0x1C ^ dword_1006A5558)) ^ byte_1005E07C0[byte_1005B5A20[(127 * (dword_10069D150 ^ 0x1C ^ dword_1006A5558))] ^ 0xC7])
                                    + 486)
   + (byte_1005E07C4[(byte_1005B5A28[v4 - 8] ^ 0x3E) - 4] ^ v4)
   + 12486))(v8);
  return 0;
}

void sub_100557A98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(&off_100682E60
       + ((127 * (dword_1006A5C18 ^ 0x1C ^ dword_1006A5558)) ^ byte_1005B5B20[byte_10063DEC0[(127 * (dword_1006A5C18 ^ 0x1C ^ dword_1006A5558))] ^ 0x5D])
       + 353);
  unsigned __int8 v4 = 127 * ((dword_1006A5558 - *v3) ^ 0x1C);
  uint64_t v5 = (uint64_t)*(&off_100682E60
                + (byte_1005E09CC[(byte_1005B5D24[v4 - 4] ^ 0x59) - 12] ^ v4)
                + 598);
  unint64_t v6 = (unint64_t)&v11[*(void *)(v5 - 4) ^ *v3];
  *uint64_t v3 = 971699327 * v6 + 0x1D271DBF9354C3E4;
  *(void *)(v5 - 4) = 971699327 * (v6 ^ 0xF8F82EB9AE22FA1CLL);
  uint64_t v14 = a2;
  unsigned int v13 = -738757634 - 1358963743 * (((&v12 | 0x20FEA24) - (&v12 & 0x20FEA24)) ^ 0x293CCEA8);
  LOBYTE(v6) = 127 * ((*(_DWORD *)(v5 - 4) - *(_DWORD *)v3) ^ 0x1C);
  uint64_t v7 = (uint64_t)*(&off_100682E60
                + ((127 * (dword_1006A5C18 ^ 0x1C ^ dword_1006A5558)) ^ byte_1005B5B20[byte_10063DEC0[(127 * (dword_1006A5C18 ^ 0x1C ^ dword_1006A5558))] ^ 0xD8])
                + 420);
  (*(void (**)(uint64_t *))(v7
                                    + 8
                                    * ((aUj7B[byte_1005B5C28[v6 - 8] ^ 0x22] ^ v6)
                                     + 12454)))(&v12);
  uint64_t v8 = v12;
  uint64_t v9 = *(unsigned int *)(a1 + 160);
  *(_DWORD *)(a1 + 160) = v9 + 1;
  *(_DWORD *)(*(void *)(a1 + 152) + 4 * v9) = *(_DWORD *)(v8 - 0x1655264E004F25B7) - 714054161;
  unsigned __int8 v10 = 127 * (*(_DWORD *)v3 ^ 0x1C ^ *(_DWORD *)(v5 - 4));
  *(void *)(*(void *)(a1 + 144) + 8 * v9) = (*(uint64_t (**)(void, uint64_t))(v7
                                                                                           + 8
                                                                                           * ((byte_10063E0C8[(byte_10061B0C8[v10 - 8] ^ 0xA7) - 8] ^ v10)
                                                                                            + 12591)))((*(_DWORD *)(v8 - 0x1655264E004F25B7) - 714054161), 12514161);
  __asm { BRAA            X13, X17 }
}

uint64_t sub_100557DB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v8 = (v4 - 1400285292);
  unint64_t v9 = (((v1 + v8) * v5) ^ (((v1 + v8) * v5) >> 16)) * v5;
  *(unsigned char *)(a1 + v8) = byte_100628ACC[(v9 >> 24) - 12] ^ *(unsigned char *)(v1 + v8) ^ byte_1006130C4[(v9 >> 24) - 3] ^ byte_10062F618[(v9 >> 24) - 5] ^ v9 ^ (-45 * (((((v1 + v8) * v5) ^ (((v1 + v8) * v5) >> 16)) * v5) >> 24));
  return (*(uint64_t (**)(void))(v7 + 8 * (((v4 - 1 != v6) * v2) ^ v3)))();
}

uint64_t sub_100557E44()
{
  return 0;
}

char *sub_100557E84(char *result, char *a2, unint64_t a3)
{
  if (((a2 ^ result) & 7) != 0)
  {
    if ((a3 + 7) >= 8)
    {
      unsigned int v3 = (a3 + 7) >> 3;
      switch(a3 & 7)
      {
        case 1uLL:
          goto LABEL_23;
        case 2uLL:
          goto LABEL_22;
        case 3uLL:
          goto LABEL_21;
        case 4uLL:
          goto LABEL_20;
        case 5uLL:
          goto LABEL_19;
        case 6uLL:
          goto LABEL_18;
        case 7uLL:
          goto LABEL_17;
        default:
          do
          {
            char v15 = *result++;
            *a2++ = v15;
LABEL_17:
            char v16 = *result++;
            *a2++ = v16;
LABEL_18:
            char v17 = *result++;
            *a2++ = v17;
LABEL_19:
            char v18 = *result++;
            *a2++ = v18;
LABEL_20:
            char v19 = *result++;
            *a2++ = v19;
LABEL_21:
            char v20 = *result++;
            *a2++ = v20;
LABEL_22:
            char v21 = *result++;
            *a2++ = v21;
LABEL_23:
            char v22 = *result++;
            *a2++ = v22;
            --v3;
          }
          while (v3);
          break;
      }
    }
  }
  else
  {
    unint64_t v4 = -(int)result & 7;
    switch((int)v4)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 5:
        goto LABEL_7;
      case 6:
        goto LABEL_6;
      case 7:
        char v5 = *result++;
        *a2++ = v5;
LABEL_6:
        char v6 = *result++;
        *a2++ = v6;
LABEL_7:
        char v7 = *result++;
        *a2++ = v7;
LABEL_8:
        char v8 = *result++;
        *a2++ = v8;
LABEL_9:
        char v9 = *result++;
        *a2++ = v9;
LABEL_10:
        char v10 = *result++;
        *a2++ = v10;
LABEL_11:
        char v11 = *result++;
        *a2++ = v11;
        break;
      default:
        break;
    }
    BOOL v12 = a3 >= v4;
    unint64_t v13 = a3 - v4;
    if (!v12) {
      unint64_t v13 = 0;
    }
    if (v13 >= 8)
    {
      unint64_t v14 = ((v13 >> 3) + 7) >> 3;
      switch((v13 >> 3) & 7)
      {
        case 1uLL:
          goto LABEL_32;
        case 2uLL:
          goto LABEL_31;
        case 3uLL:
          goto LABEL_30;
        case 4uLL:
          goto LABEL_29;
        case 5uLL:
          goto LABEL_28;
        case 6uLL:
          goto LABEL_27;
        case 7uLL:
          goto LABEL_26;
        default:
          do
          {
            uint64_t v23 = *(void *)result;
            result += 8;
            *(void *)a2 = v23;
            a2 += 8;
LABEL_26:
            uint64_t v24 = *(void *)result;
            result += 8;
            *(void *)a2 = v24;
            a2 += 8;
LABEL_27:
            uint64_t v25 = *(void *)result;
            result += 8;
            *(void *)a2 = v25;
            a2 += 8;
LABEL_28:
            uint64_t v26 = *(void *)result;
            result += 8;
            *(void *)a2 = v26;
            a2 += 8;
LABEL_29:
            uint64_t v27 = *(void *)result;
            result += 8;
            *(void *)a2 = v27;
            a2 += 8;
LABEL_30:
            uint64_t v28 = *(void *)result;
            result += 8;
            *(void *)a2 = v28;
            a2 += 8;
LABEL_31:
            uint64_t v29 = *(void *)result;
            result += 8;
            *(void *)a2 = v29;
            a2 += 8;
LABEL_32:
            uint64_t v30 = *(void *)result;
            result += 8;
            *(void *)a2 = v30;
            a2 += 8;
            --v14;
          }
          while (v14);
          break;
      }
    }
    switch(v13 & 7)
    {
      case 1uLL:
        goto LABEL_40;
      case 2uLL:
        goto LABEL_39;
      case 3uLL:
        goto LABEL_38;
      case 4uLL:
        goto LABEL_37;
      case 5uLL:
        goto LABEL_36;
      case 6uLL:
        goto LABEL_35;
      case 7uLL:
        char v31 = *result++;
        *a2++ = v31;
LABEL_35:
        char v32 = *result++;
        *a2++ = v32;
LABEL_36:
        char v33 = *result++;
        *a2++ = v33;
LABEL_37:
        char v34 = *result++;
        *a2++ = v34;
LABEL_38:
        char v35 = *result++;
        *a2++ = v35;
LABEL_39:
        char v36 = *result++;
        *a2++ = v36;
LABEL_40:
        *a2 = *result;
        break;
      default:
        return result;
    }
  }
  return result;
}

unsigned char *sub_1005580E0(unsigned char *result, unsigned int a2, unint64_t a3)
{
  unint64_t v3 = -(int)result & 7;
  if (v3 > a3) {
    LODWORD(v3) = a3;
  }
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  unint64_t v4 = a3 - v3;
  if (v4 >= 8)
  {
    uint64_t v5 = 0x101010101010101 * a2;
    unint64_t v6 = ((v4 >> 3) + 7) >> 3;
    switch((v4 >> 3) & 7)
    {
      case 1uLL:
        goto LABEL_20;
      case 2uLL:
        goto LABEL_19;
      case 3uLL:
        goto LABEL_18;
      case 4uLL:
        goto LABEL_17;
      case 5uLL:
        goto LABEL_16;
      case 6uLL:
        goto LABEL_15;
      case 7uLL:
        goto LABEL_14;
      default:
        do
        {
          *(void *)result = v5;
          result += 8;
LABEL_14:
          *(void *)result = v5;
          result += 8;
LABEL_15:
          *(void *)result = v5;
          result += 8;
LABEL_16:
          *(void *)result = v5;
          result += 8;
LABEL_17:
          *(void *)result = v5;
          result += 8;
LABEL_18:
          *(void *)result = v5;
          result += 8;
LABEL_19:
          *(void *)result = v5;
          result += 8;
LABEL_20:
          *(void *)result = v5;
          result += 8;
          --v6;
        }
        while (v6);
        break;
    }
  }
  switch(v4 & 7)
  {
    case 1uLL:
      goto LABEL_28;
    case 2uLL:
      goto LABEL_27;
    case 3uLL:
      goto LABEL_26;
    case 4uLL:
      goto LABEL_25;
    case 5uLL:
      goto LABEL_24;
    case 6uLL:
      goto LABEL_23;
    case 7uLL:
      *result++ = a2;
LABEL_23:
      *result++ = a2;
LABEL_24:
      *result++ = a2;
LABEL_25:
      *result++ = a2;
LABEL_26:
      *result++ = a2;
LABEL_27:
      *result++ = a2;
LABEL_28:
      *result = a2;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100558248(mach_port_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  int v15 = 1;
  uint64_t v16 = a2;
  int v17 = 16777472;
  int v18 = a3;
  NDR_record_t v19 = NDR_record;
  int v20 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = reply_port;
  v14.msgh_bits = -2147478253;
  *(void *)&v14.msgh_voucher_port = 0x4B000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v14);
    mach_port_t reply_port = v14.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&v14, 3, 0x38u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v14.msgh_local_port);
    return v10;
  }
  if (v9)
  {
    mig_dealloc_reply_port(v14.msgh_local_port);
    return v10;
  }
  if (v14.msgh_id == 71)
  {
    uint64_t v12 = 4294966988;
  }
  else if (v14.msgh_id == 1300)
  {
    if ((v14.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v12 = 4294966996;
      if (v15 == 1 && v14.msgh_size == 56 && !v14.msgh_remote_port && HIBYTE(v17) == 1)
      {
        int v13 = v18;
        if (v18 == v20)
        {
          *a4 = v16;
          *a5 = v13;
          return 0;
        }
      }
    }
    else if (v14.msgh_size == 36)
    {
      uint64_t v12 = 4294966996;
      if (HIDWORD(v16))
      {
        if (v14.msgh_remote_port) {
          uint64_t v12 = 4294966996;
        }
        else {
          uint64_t v12 = HIDWORD(v16);
        }
      }
    }
    else
    {
      uint64_t v12 = 4294966996;
    }
  }
  else
  {
    uint64_t v12 = 4294966995;
  }
  mach_msg_destroy(&v14);
  return v12;
}

void sub_100558434(uint64_t a1)
{
  __asm { BRAA            X9, X17 }
}

uint64_t sub_100558470@<X0>(uint64_t a1@<X8>)
{
  return 0;
}

uint64_t sub_100558494(uint64_t a1)
{
  unsigned int v1 = 2052531167 * (((a1 | 0x5A1B0962) - a1 + (a1 & 0xA5E4F69D)) ^ 0x9F91BE4E);
  return (*(uint64_t (**)(void))((char *)*(&off_100685FD0 + ((*(_DWORD *)(a1 + 4) + v1) & 0x4475CA3C))
                              + 8
                              * (int)((44 * ((*(_DWORD *)(a1 + 8) ^ v1) - 476898052 < 0x46)) ^ (*(_DWORD *)(a1 + 4) + v1))
                              - 4))();
}

_DWORD *sub_100558520@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  *result = *(_DWORD *)(*(void *)(v3 + 8 * (a2 - 8)) + 4 * v2);
  return result;
}

_DWORD *sub_100558534(_DWORD *result)
{
  *result = 1894000537;
  return result;
}

void sub_100558544(id a1, void *a2)
{
  int v2 = (uint64_t *)*(&off_100685FD0
                  + ((45 * ((dword_1006A5D00 + dword_1006A5CF8) ^ 0x81)) ^ byte_10063FE20[byte_10063FB20[(45 * ((dword_1006A5D00 + dword_1006A5CF8) ^ 0x81))] ^ 0xE1])
                  - 12);
  uint64_t v3 = (uint64_t)*(&off_100685FD0
                + ((45 * ((dword_1006A5D00 - *v2) ^ 0x81)) ^ byte_10063F700[byte_100640040[(45 * ((dword_1006A5D00 - *v2) ^ 0x81))] ^ 0x1C]));
  uint64_t v4 = *(void *)(v3 - 4) - *v2 - (void)&v11;
  uint64_t v5 = 1703593261 * (v4 + 0x45DB50ACE0D5DB7FLL);
  unint64_t v6 = 1703593261 * (v4 ^ 0xBA24AF531F2A2481);
  uint64_t *v2 = v5;
  *(void *)(v3 - 4) = v6;
  LOBYTE(v6) = 45 * ((v6 + *(_DWORD *)v2) ^ 0x81);
  char v7 = (char *)*(&off_100685FD0
               + ((45 * ((dword_1006A5D00 - dword_1006A5CF8) ^ 0x81)) ^ byte_10063F800[byte_100640140[(45 * ((dword_1006A5D00 - dword_1006A5CF8) ^ 0x81))] ^ 0xDA])
               - 27)
     - 4;
  uint64_t v8 = (*(uint64_t (**)(void *))&v7[8
                                            * (byte_10063FD20[byte_10063FA20[v6] ^ 0xD1] ^ v6)
                                            + 1656])(a2);
  unsigned __int8 v9 = 45 * ((*(_DWORD *)(v3 - 4) - *(_DWORD *)v2) ^ 0x81);
  uint64_t v10 = *(void (**)(uint64_t))&v7[8
                                          * (byte_10063FC24[(byte_10063F924[v9 - 4] ^ 0xEC) - 4] ^ v9)
                                          - 112];

  v10(v8);
}

void sub_100558738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2) {
    BOOL v5 = a3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v8 = v5 || a4 == 0 || a5 == 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1005587B0(uint64_t a1, void *a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  BOOL v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 1272))(24, 4101018099) != 0;
  return (*(uint64_t (**)(void))(v5 + 8 * (v6 | (4 * v6) | 0x82u)))();
}

uint64_t sub_100558810(uint64_t a1)
{
  *(void *)(v6 - 216) = v4;
  *(void *)(v6 - 200) = v3;
  *(void *)(v6 - 160) = v2;
  *(void *)(v6 - 152) = v1;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 73371605;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 1272))(4096, 1358311088);
  *(void *)a1 = v8;
  return (*(uint64_t (**)(void))(v5 + 8 * ((50 * ((((v8 == 0) ^ 0xE) & 1) == 0)) ^ 0x98u)))();
}

uint64_t sub_10055889C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v8 - 144) = 0;
  *(void *)(v8 - 136) = 0;
  *(_DWORD *)(v8 - 180) = 0;
  *(_DWORD *)(v6 + 8) = v7 + 4096;
  unsigned __int8 v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                             + 8
                                                                             * ((((v4 + 11) ^ (18 * (v4 ^ 0xB)) ^ 0xE)
                                                                               * (v6 == 0)) ^ v4));
  *(void *)(v8 - 208) = (char *)*(&off_100685FD0 + (v4 ^ 0xA)) - 4;
  return v9(a1, a2, a3, a4, 877739467);
}

uint64_t sub_100558940()
{
  unsigned int v4 = (((v0 - 23) | 0x50) ^ 0xD6D37FFC ^ (5 * (v0 ^ v1))) + *(_DWORD *)(v3 + 12);
  unsigned int v5 = *(_DWORD *)(v3 + 8) - 764153823;
  BOOL v6 = v4 < 0xD6D37FF6;
  BOOL v7 = v4 > v5;
  if (v5 < 0xD6D37FF6 != v6) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v7;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((39 * v8) ^ v0)))(v3 + 8);
}

uint64_t sub_1005589C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(void *)(v19 - 144) = 0;
  *(void *)(v19 - 136) = 0;
  *(_DWORD *)(v19 - 180) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8 * (((((v18 == 0) ^ (v16 - 102)) & 1) * ((((unsigned __int16)v16 + 22391) & 0xA87B) - 57)) ^ v16)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_100558A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25)
{
  unsigned int v28 = ((2 * (2 * a25 - 146743210)) & 0xBFF7FEC)
      + ((2 * a25 - 146743210) ^ 0x5FFBFF7)
      + (((v25 & 0x34533FDB) - a5 + 120) ^ 0x87ABC603);
  BOOL v29 = v28 < 0x8DAB8672;
  BOOL v30 = v28 > a25 - 1991510367;
  if ((a25 - 1991510367) < 0x8DAB8672 != v29) {
    BOOL v31 = v29;
  }
  else {
    BOOL v31 = v30;
  }
  return (*(uint64_t (**)(void))(v27 + 8 * ((90 * v31) ^ (v26 + (v25 & 0x34533FDB) - 85))))();
}

uint64_t sub_100558ADC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 + v0 - 81) ^ v0 ^ (v1 - 6)) * (v3 == 0)) ^ v0)))();
}

uint64_t sub_100558B0C@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v1 + 8 * (a1 - 877739234)))(v2);
  return v3;
}

void sub_10055C210(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Biome error %@", (uint8_t *)&v2, 0xCu);
}

void sub_10055C288(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Biome error: unknown %@ stream, %@", (uint8_t *)&v3, 0x16u);
}

void sub_10055C310(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Internal error doing this", v1, 2u);
}

void sub_10055C354(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "asd:listener:shouldRejectNewConnection", v1, 2u);
}

void sub_10055C398(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ASGeoCodeResult class not found - should be in CoreODIEssentials", v1, 2u);
}

void sub_10055C3DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Access after release", v1, 2u);
}

void sub_10055C420(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Malloc failed!", v1, 2u);
}

void sub_10055C464(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unexpected nil", v1, 2u);
}

void sub_10055C4A8()
{
  sub_1000108D4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[Precomputation] Error in database clean: %@)", v1, 0xCu);
}

void sub_10055C51C(void *a1)
{
  id v2 = a1;
  int v3 = [(id)sub_1000108E0() localizedDescription];
  sub_1000108D4();
  sub_1000108B4((void *)&_mh_execute_header, v4, v5, "Error in database clean: %@)", v6, v7, v8, v9, v10);
}

void sub_10055C5AC(void *a1)
{
  id v2 = a1;
  int v3 = [(id)sub_1000108E0() localizedDescription];
  sub_1000108D4();
  sub_1000108B4((void *)&_mh_execute_header, v4, v5, "Errror in payload expiry: %@)", v6, v7, v8, v9, v10);
}

void sub_10055C63C(void *a1)
{
  id v2 = a1;
  int v3 = [(id)sub_1000108E0() localizedDescription];
  sub_1000108D4();
  sub_1000108B4((void *)&_mh_execute_header, v4, v5, "[ASCleanupManager] Error purging JSON Bag data: %@", v6, v7, v8, v9, v10);
}

void sub_10055C6CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "WP error (likely df evaluation): %@", (uint8_t *)&v2, 0xCu);
}

void sub_10055C744(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = 61;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error %ld in WP %d", (uint8_t *)&v3, 0x12u);
}

void sub_10055C7D0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "WP error (likely expression parsing): %@ ", (uint8_t *)&v2, 0xCu);
}

void sub_10055C848(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unsupported DF type %d", (uint8_t *)v3, 8u);
}

void sub_10055C8C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unhandled dataframe type", v1, 2u);
}

void sub_10055C908(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to obtain SE: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10055C980(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055C9B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055C9F0()
{
  sub_1000108D4();
  sub_100016E00((void *)&_mh_execute_header, v0, v1, "Failed to create the path for persistent store: %@", v2, v3, v4, v5, v6);
}

void sub_10055CA58()
{
  sub_1000108D4();
  sub_100016E00((void *)&_mh_execute_header, v0, v1, "Failed to resolve URL for CoreAS DB using: %@", v2, v3, v4, v5, v6);
}

void sub_10055CAC0()
{
  sub_1000108D4();
  sub_100016E00((void *)&_mh_execute_header, v0, v1, "Failed to load Core Data stack: %@", v2, v3, v4, v5, v6);
}

void sub_10055CB28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055CB60(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to read existing DB data, %@", buf, 0xCu);
}

void sub_10055CBB8()
{
  sub_1000108D4();
  sub_100016E00((void *)&_mh_execute_header, v0, v1, "Failed to migrate stack (re-insertion of existing bag failed): %@", v2, v3, v4, v5, v6);
}

void sub_10055CC20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055CC90()
{
  sub_1000108D4();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Failed to read CoreData directory %@", v1, 0xCu);
}

void sub_10055CD04(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ASCoreDataManager] Failed to execute batch delete request for entity %@. Error: %@", buf, 0x16u);
}

void sub_10055CD6C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to start RavioliManager", v1, 2u);
}

void sub_10055CDB0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set user dir suffix", v1, 2u);
}

void sub_10055CDF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "PhotoLibrary unavailable - Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10055CE6C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "WARNING unsupported propertyset", buf, 2u);
}

void sub_10055CEAC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)a1 + 8) + 40);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 localizedDescription];
  uint8_t v6 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) userInfo];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint8_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error fetching DB_R09283478 object: %@\n%@", (uint8_t *)&v7, 0x16u);
}

void sub_10055CF90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No DB_R09283478 object found", v1, 2u);
}

void sub_10055CFD4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error unexpected type fetching DB_R09283478 object.", v1, 2u);
}

void sub_10055D018(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ADIORequest failed with error %d", (uint8_t *)v2, 8u);
}

void sub_10055D090(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Ignoring error %@", (uint8_t *)&v5, 0xCu);
}

void sub_10055D138()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "IDS error nil or no conforming enoding for PAC", v2, v3, v4, v5, v6);
}

void sub_10055D16C()
{
  sub_10001D2BC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error %d, (0x%lx)", v1, 0x12u);
}

void sub_10055D1E0()
{
  sub_10001D2BC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error %d (0x%lx)", v1, 0x12u);
}

void sub_10055D254()
{
  sub_10001D294();
  sub_10001D2A0((void *)&_mh_execute_header, v0, v1, "SEID missing, unexpected.", v2, v3, v4, v5, v6);
}

void sub_10055D288()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "Expected ASRiskScoreEngine - fetchGeoCodingsForAddresses not to be used", v2, v3, v4, v5, v6);
}

void sub_10055D2BC()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "Expected ASRiskScoreEngine - updateGeoCodingsForAddresses not to be used", v2, v3, v4, v5, v6);
}

void sub_10055D2F0()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "Expected ASRiskScoreEngine - updateRavioliWithCompletion not to be used", v2, v3, v4, v5, v6);
}

void sub_10055D324()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "ASRiskScoreEngine fetchConfigWithCompletion was not expected to be called", v2, v3, v4, v5, v6);
}

void sub_10055D358()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "ASRiskScoreEngine fetchConfigThrowingWithCompletion was not expected to be called", v2, v3, v4, v5, v6);
}

void sub_10055D38C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055D404(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055D47C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055D4F4()
{
  sub_10001D294();
  sub_10001D2A0((void *)&_mh_execute_header, v0, v1, "Not implemented", v2, v3, v4, v5, v6);
}

void sub_10055D528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055D5A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055D618(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "ERROR in CoreData: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10055D690(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055D6FC()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "Error getting entities for DB_C56902430\n", v2, v3, v4, v5, v6);
}

void sub_10055D730()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "Error getting entities for DB_R101288420\n", v2, v3, v4, v5, v6);
}

void sub_10055D764()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "Unexpected result type from cache cleanup batch delete", v2, v3, v4, v5, v6);
}

void sub_10055D798(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected result type from cache cleanup batch delete", buf, 2u);
}

void sub_10055D7D8()
{
  sub_1000252DC();
  sub_1000252C4(v2, v3, v4, 5.778e-34);
  sub_1000252F0((void *)&_mh_execute_header, "Geocoding Removal failed: %@\n%@", v5, v6);
}

void sub_10055D820(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error expected only CLLocation or NSNull in locations argument", buf, 2u);
}

void sub_10055D860(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error fetching ASGeoCodeCacheEntries for deletion: %@", buf, 0xCu);
}

void sub_10055D8B8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error getting ASGeoCodeCacheEntry count: %@", buf, 0xCu);
}

void sub_10055D910()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "ASGeoCodeResult class not found - should be in CoreODIEssentials", v2, v3, v4, v5, v6);
}

void sub_10055D944()
{
  sub_1000252DC();
  sub_1000252C4(v2, v3, v4, 5.778e-34);
  sub_1000252F0((void *)&_mh_execute_header, "Binding Removal failed: %@\n%@", v5, v6);
}

void sub_10055D98C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055DA04()
{
  sub_10001D294();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "This function is not implemented", v1, 2u);
}

void sub_10055DA44(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error fetching JSONBag with ID %@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10055DAD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055DB40(uint64_t a1, void *a2, uint64_t a3)
{
  sub_1000252C4(a1, (uint64_t)a2, a3, 5.778e-34);
  sub_1000252F0((void *)&_mh_execute_header, "Error fetching JSON Bag with ID %@: %@", v4, v5);
}

void sub_10055DB8C()
{
  sub_1000252DC();
  sub_1000252C4(v2, v3, v4, 5.778e-34);
  sub_1000252F0((void *)&_mh_execute_header, "Error fetching DB_R09283478 object: %@\n%@", v5, v6);
}

void sub_10055DBD4()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "No DB_R09283478 object found", v2, v3, v4, v5, v6);
}

void sub_10055DC08()
{
  sub_10001D294();
  sub_100016E1C((void *)&_mh_execute_header, v0, v1, "Error unexpected type fetching DB_R09283478 object.", v2, v3, v4, v5, v6);
}

void sub_10055DC3C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055DCA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055DD14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10055DD80(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "TimedOut error %d", (uint8_t *)v2, 8u);
}

void sub_10055DDF8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to set UUID into Keychain: %d", (uint8_t *)v2, 8u);
}

uint64_t static FinanceStore.shared.getter()
{
  return static FinanceStore.shared.getter();
}

uint64_t type metadata accessor for FinanceStore()
{
  return type metadata accessor for FinanceStore();
}

uint64_t MapsInsight.merchant.getter()
{
  return MapsInsight.merchant.getter();
}

uint64_t type metadata accessor for MapsInsight()
{
  return type metadata accessor for MapsInsight();
}

uint64_t type metadata accessor for Transaction.Insight()
{
  return type metadata accessor for Transaction.Insight();
}

uint64_t MapsMerchant.locationLatitude.getter()
{
  return MapsMerchant.locationLatitude.getter();
}

uint64_t MapsMerchant.locationLongitude.getter()
{
  return MapsMerchant.locationLongitude.getter();
}

uint64_t type metadata accessor for MapsMerchant()
{
  return type metadata accessor for MapsMerchant();
}

uint64_t TransactionType.rawValue.getter()
{
  return TransactionType.rawValue.getter();
}

uint64_t type metadata accessor for TransactionType()
{
  return type metadata accessor for TransactionType();
}

uint64_t InternalTransaction.transactionDate.getter()
{
  return InternalTransaction.transactionDate.getter();
}

uint64_t InternalTransaction.transactionType.getter()
{
  return InternalTransaction.transactionType.getter();
}

uint64_t InternalTransaction.id.getter()
{
  return InternalTransaction.id.getter();
}

uint64_t type metadata accessor for InternalTransaction()
{
  return type metadata accessor for InternalTransaction();
}

uint64_t InternalTransactionResult.transactions.getter()
{
  return InternalTransactionResult.transactions.getter();
}

uint64_t type metadata accessor for InternalTransactionResult()
{
  return type metadata accessor for InternalTransactionResult();
}

uint64_t ApplePayTransactionInsight.isCoarseLocation.getter()
{
  return ApplePayTransactionInsight.isCoarseLocation.getter();
}

uint64_t ApplePayTransactionInsight.Location.latitude.getter()
{
  return ApplePayTransactionInsight.Location.latitude.getter();
}

uint64_t ApplePayTransactionInsight.Location.longitude.getter()
{
  return ApplePayTransactionInsight.Location.longitude.getter();
}

uint64_t type metadata accessor for ApplePayTransactionInsight.Location()
{
  return type metadata accessor for ApplePayTransactionInsight.Location();
}

uint64_t ApplePayTransactionInsight.location.getter()
{
  return ApplePayTransactionInsight.location.getter();
}

uint64_t type metadata accessor for ApplePayTransactionInsight()
{
  return type metadata accessor for ApplePayTransactionInsight();
}

uint64_t URLRequest.debugDescription.getter()
{
  return URLRequest.debugDescription.getter();
}

uint64_t URLRequest.allHTTPHeaderFields.getter()
{
  return URLRequest.allHTTPHeaderFields.getter();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.url.getter()
{
  return URLRequest.url.getter();
}

Swift::Void __swiftcall URLRequest.addValue(_:forHTTPHeaderField:)(Swift::String _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::Void __swiftcall URL.append(queryItems:)(Swift::OpaquePointer queryItems)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.InlineData.init(_:)()
{
  return Data.InlineData.init(_:)();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.LargeSlice.init(_:)()
{
  return Data.LargeSlice.init(_:)();
}

uint64_t Data.InlineSlice.init(_:)()
{
  return Data.InlineSlice.init(_:)();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.init(count:)()
{
  return Data._Representation.init(count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t Data._Representation.init(_:)()
{
  return Data._Representation.init(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.count.getter()
{
  return Data.count.getter();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.+ infix(_:_:)()
{
  return static Date.+ infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Locale.Region.identifier.getter()
{
  return Locale.Region.identifier.getter();
}

uint64_t type metadata accessor for Locale.Region()
{
  return type metadata accessor for Locale.Region();
}

uint64_t Locale.region.getter()
{
  return Locale.region.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t SQLDatabase.databasePath()()
{
  return SQLDatabase.databasePath()();
}

uint64_t type metadata accessor for SQLDatabase()
{
  return type metadata accessor for SQLDatabase();
}

uint64_t static DatabaseResource.database(useCase:)()
{
  return static DatabaseResource.database(useCase:)();
}

uint64_t Configuration.init()()
{
  return Configuration.init()();
}

uint64_t type metadata accessor for Configuration()
{
  return type metadata accessor for Configuration();
}

uint64_t DatabaseQueue.init(path:configuration:)()
{
  return DatabaseQueue.init(path:configuration:)();
}

uint64_t DatabaseQueue.read<A>(_:)()
{
  return DatabaseQueue.read<A>(_:)();
}

uint64_t type metadata accessor for DatabaseQueue()
{
  return type metadata accessor for DatabaseQueue();
}

uint64_t dispatch thunk of DatabaseCursor.statement.getter()
{
  return dispatch thunk of DatabaseCursor.statement.getter();
}

uint64_t dispatch thunk of _DatabaseCursor._isDone.getter()
{
  return dispatch thunk of _DatabaseCursor._isDone.getter();
}

uint64_t dispatch thunk of _DatabaseCursor._isDone.setter()
{
  return dispatch thunk of _DatabaseCursor._isDone.setter();
}

uint64_t dispatch thunk of _DatabaseCursor._element(sqliteStatement:)()
{
  return dispatch thunk of _DatabaseCursor._element(sqliteStatement:)();
}

uint64_t RowDecodingContext.init(row:key:)()
{
  return RowDecodingContext.init(row:key:)();
}

uint64_t StatementArguments.init()()
{
  return StatementArguments.init()();
}

uint64_t type metadata accessor for StatementArguments()
{
  return type metadata accessor for StatementArguments();
}

uint64_t static DatabaseValueConvertible<>._valueMismatch(fromStatement:atUncheckedIndex:context:)()
{
  return static DatabaseValueConvertible<>._valueMismatch(fromStatement:atUncheckedIndex:context:)();
}

uint64_t Row.fastDecode<A>(_:atUncheckedIndex:)()
{
  return Row.fastDecode<A>(_:atUncheckedIndex:)();
}

uint64_t Row._checkIndex(_:file:line:)()
{
  return Row._checkIndex(_:file:line:)();
}

uint64_t static Row.fetchCursor(_:sql:arguments:adapter:)()
{
  return static Row.fetchCursor(_:sql:arguments:adapter:)();
}

uint64_t Row.sqliteStatement.getter()
{
  return Row.sqliteStatement.getter();
}

uint64_t type metadata accessor for Row()
{
  return type metadata accessor for Row();
}

uint64_t type metadata accessor for RowKey()
{
  return type metadata accessor for RowKey();
}

uint64_t Statement.step<A>(_:)()
{
  return Statement.step<A>(_:)();
}

uint64_t static RegexComponentBuilder.buildExpression<A>(_:)()
{
  return static RegexComponentBuilder.buildExpression<A>(_:)();
}

uint64_t static RegexComponentBuilder.buildPartialBlock<A>(first:)()
{
  return static RegexComponentBuilder.buildPartialBlock<A>(first:)();
}

uint64_t makeFactory()()
{
  return makeFactory()();
}

uint64_t type metadata accessor for CharacterClass()
{
  return type metadata accessor for CharacterClass();
}

uint64_t static Anchor.endOfLine.getter()
{
  return static Anchor.endOfLine.getter();
}

uint64_t type metadata accessor for Anchor()
{
  return type metadata accessor for Anchor();
}

uint64_t OneOrMore.init(_:)()
{
  return OneOrMore.init(_:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason();
}

uint64_t GenerativeModelsAvailability.Availability.UnavailableInfo.reasons.getter()
{
  return GenerativeModelsAvailability.Availability.UnavailableInfo.reasons.getter();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability();
}

uint64_t GenerativeModelsAvailability.Parameters.init(useCaseIdentifier:)()
{
  return GenerativeModelsAvailability.Parameters.init(useCaseIdentifier:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Parameters()
{
  return type metadata accessor for GenerativeModelsAvailability.Parameters();
}

uint64_t GenerativeModelsAvailability.availability.getter()
{
  return GenerativeModelsAvailability.availability.getter();
}

uint64_t static GenerativeModelsAvailability.current(parameters:)()
{
  return static GenerativeModelsAvailability.current(parameters:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability()
{
  return type metadata accessor for GenerativeModelsAvailability();
}

uint64_t type metadata accessor for DUATaskType()
{
  return type metadata accessor for DUATaskType();
}

uint64_t BindingsKeys.rawValue.getter()
{
  return BindingsKeys.rawValue.getter();
}

uint64_t type metadata accessor for BindingsKeys()
{
  return type metadata accessor for BindingsKeys();
}

uint64_t static DIPODNHelper.generateDUAData(tData:duration:computationTaskType:isDeviceLocked:)()
{
  return static DIPODNHelper.generateDUAData(tData:duration:computationTaskType:isDeviceLocked:)();
}

uint64_t static DIPODNHelper.convertAssessmentGUIDToData(_:)()
{
  return static DIPODNHelper.convertAssessmentGUIDToData(_:)();
}

uint64_t type metadata accessor for DIPODNHelper()
{
  return type metadata accessor for DIPODNHelper();
}

uint64_t dispatch thunk of ConfigManager.setConfiguration(configDict:)()
{
  return dispatch thunk of ConfigManager.setConfiguration(configDict:)();
}

uint64_t static ConfigManager.shared.getter()
{
  return static ConfigManager.shared.getter();
}

uint64_t type metadata accessor for ConfigManager()
{
  return type metadata accessor for ConfigManager();
}

uint64_t JWSSignedJSON.payload.getter()
{
  return JWSSignedJSON.payload.getter();
}

uint64_t ODIClientGUID.seeds.getter()
{
  return ODIClientGUID.seeds.getter();
}

uint64_t ODIClientGUID.asString.getter()
{
  return ODIClientGUID.asString.getter();
}

uint64_t type metadata accessor for ODIClientGUID()
{
  return type metadata accessor for ODIClientGUID();
}

uint64_t static ODIDeviceInfo.isDeviceLocked()()
{
  return static ODIDeviceInfo.isDeviceLocked()();
}

uint64_t dispatch thunk of ODIDeviceInfo.getCTPhoneNumber(useDefaultVoiceNumber:)()
{
  return dispatch thunk of ODIDeviceInfo.getCTPhoneNumber(useDefaultVoiceNumber:)();
}

uint64_t type metadata accessor for ODIDeviceInfo()
{
  return type metadata accessor for ODIDeviceInfo();
}

uint64_t HTTPStatusCode.description.getter()
{
  return HTTPStatusCode.description.getter();
}

uint64_t static HTTPStatusCode.== infix(_:_:)()
{
  return static HTTPStatusCode.== infix(_:_:)();
}

uint64_t type metadata accessor for HTTPStatusCode()
{
  return type metadata accessor for HTTPStatusCode();
}

uint64_t BindingsHelpers.init()()
{
  return BindingsHelpers.init()();
}

uint64_t type metadata accessor for BindingsHelpers()
{
  return type metadata accessor for BindingsHelpers();
}

uint64_t AssessmentConfig.refreshTtl.getter()
{
  return AssessmentConfig.refreshTtl.getter();
}

uint64_t AssessmentConfig.useSendOTD.getter()
{
  return AssessmentConfig.useSendOTD.getter();
}

uint64_t AssessmentConfig.primaryDSID.getter()
{
  return AssessmentConfig.primaryDSID.getter();
}

uint64_t AssessmentConfig.destinations.getter()
{
  return AssessmentConfig.destinations.getter();
}

uint64_t AssessmentConfig.bindingsToCompare.getter()
{
  return AssessmentConfig.bindingsToCompare.getter();
}

uint64_t AssessmentConfig.bindingsDictSource.getter()
{
  return AssessmentConfig.bindingsDictSource.getter();
}

uint64_t type metadata accessor for AssessmentConfig.Sources()
{
  return type metadata accessor for AssessmentConfig.Sources();
}

uint64_t type metadata accessor for AssessmentConfig()
{
  return type metadata accessor for AssessmentConfig();
}

uint64_t AugmentedProfile.profileInfo.getter()
{
  return AugmentedProfile.profileInfo.getter();
}

uint64_t AugmentedProfile.assessmentConfig.getter()
{
  return AugmentedProfile.assessmentConfig.getter();
}

uint64_t AugmentedProfile.profile.getter()
{
  return AugmentedProfile.profile.getter();
}

uint64_t AugmentedProfile.profileID.getter()
{
  return AugmentedProfile.profileID.getter();
}

uint64_t type metadata accessor for AugmentedProfile()
{
  return type metadata accessor for AugmentedProfile();
}

uint64_t static DeviceInformation.shared.getter()
{
  return static DeviceInformation.shared.getter();
}

uint64_t type metadata accessor for DeviceInformation()
{
  return type metadata accessor for DeviceInformation();
}

uint64_t static ODIAccountManager.shared.getter()
{
  return static ODIAccountManager.shared.getter();
}

uint64_t type metadata accessor for ODIAccountManager()
{
  return type metadata accessor for ODIAccountManager();
}

uint64_t type metadata accessor for ODIClientGUIDSeeds()
{
  return type metadata accessor for ODIClientGUIDSeeds();
}

uint64_t type metadata accessor for DIPClientGUIDFactory()
{
  return type metadata accessor for DIPClientGUIDFactory();
}

uint64_t PrecomputationSession.__allocating_init(workflowID:)()
{
  return PrecomputationSession.__allocating_init(workflowID:)();
}

uint64_t type metadata accessor for PrecomputationSession()
{
  return type metadata accessor for PrecomputationSession();
}

uint64_t EncryptedDataContainer.data.getter()
{
  return EncryptedDataContainer.data.getter();
}

uint64_t static ODIiCloudAccountManager.shared.getter()
{
  return static ODIiCloudAccountManager.shared.getter();
}

uint64_t type metadata accessor for ODIiCloudAccountManager()
{
  return type metadata accessor for ODIiCloudAccountManager();
}

uint64_t static ODNAssessmentGUIDManager.getECv3SHEncryptedContainers(tsidEncryptionCertString:tsid:assessmentGUID:)()
{
  return static ODNAssessmentGUIDManager.getECv3SHEncryptedContainers(tsidEncryptionCertString:tsid:assessmentGUID:)();
}

uint64_t type metadata accessor for ODNAssessmentGUIDManager()
{
  return type metadata accessor for ODNAssessmentGUIDManager();
}

uint64_t AssessmentServerDestinations.tsidEncryptionCert.getter()
{
  return AssessmentServerDestinations.tsidEncryptionCert.getter();
}

uint64_t AssessmentServerDestinations.otd.getter()
{
  return AssessmentServerDestinations.otd.getter();
}

uint64_t type metadata accessor for AssessmentServerDestinations()
{
  return type metadata accessor for AssessmentServerDestinations();
}

uint64_t DistributedNotificationsAsyncSequence.init()()
{
  return DistributedNotificationsAsyncSequence.init()();
}

uint64_t type metadata accessor for DistributedNotificationsAsyncSequence()
{
  return type metadata accessor for DistributedNotificationsAsyncSequence();
}

uint64_t TSID.init(tsid:session_id:ts_nonce:)()
{
  return TSID.init(tsid:session_id:ts_nonce:)();
}

uint64_t type metadata accessor for TSID()
{
  return type metadata accessor for TSID();
}

uint64_t type metadata accessor for DsidType()
{
  return type metadata accessor for DsidType();
}

uint64_t _RegexFactory.accumulate<A, B, C>(_:_:)()
{
  return _RegexFactory.accumulate<A, B, C>(_:_:)();
}

uint64_t _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)()
{
  return _RegexFactory.ignoreCapturesInTypedOutput<A>(_:)();
}

uint64_t _RegexFactory.oneOrMore<A, B>(_:_:)()
{
  return _RegexFactory.oneOrMore<A, B>(_:_:)();
}

uint64_t type metadata accessor for _RegexFactory()
{
  return type metadata accessor for _RegexFactory();
}

uint64_t static RegexComponent<>.digit.getter()
{
  return static RegexComponent<>.digit.getter();
}

uint64_t type metadata accessor for RegexRepetitionBehavior()
{
  return type metadata accessor for RegexRepetitionBehavior();
}

uint64_t Regex.init<A>(_:)()
{
  return Regex.init<A>(_:)();
}

uint64_t CompanionDevice.SessionInfo.end.getter()
{
  return CompanionDevice.SessionInfo.end.getter();
}

uint64_t CompanionDevice.SessionInfo.start.getter()
{
  return CompanionDevice.SessionInfo.start.getter();
}

uint64_t type metadata accessor for CompanionDevice.SessionInfo()
{
  return type metadata accessor for CompanionDevice.SessionInfo();
}

uint64_t CompanionDevice.latestSessionInfo.getter()
{
  return CompanionDevice.latestSessionInfo.getter();
}

uint64_t type metadata accessor for CompanionDevice()
{
  return type metadata accessor for CompanionDevice();
}

uint64_t static CompanionDeviceManager.Options.sessionInfo.getter()
{
  return static CompanionDeviceManager.Options.sessionInfo.getter();
}

uint64_t type metadata accessor for CompanionDeviceManager.Options()
{
  return type metadata accessor for CompanionDeviceManager.Options();
}

uint64_t dispatch thunk of CompanionDeviceManager.devices(with:)()
{
  return dispatch thunk of CompanionDeviceManager.devices(with:)();
}

uint64_t CompanionDeviceManager.__allocating_init()()
{
  return CompanionDeviceManager.__allocating_init()();
}

uint64_t type metadata accessor for CompanionDeviceManager()
{
  return type metadata accessor for CompanionDeviceManager();
}

uint64_t type metadata accessor for Library.Databases.ApplePay.Security.Features()
{
  return type metadata accessor for Library.Databases.ApplePay.Security.Features();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t noErr.getter()
{
  return noErr.getter();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t static DispatchWorkItemFlags.barrier.getter()
{
  return static DispatchWorkItemFlags.barrier.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return DispatchTime.uptimeNanoseconds.getter();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return Dictionary.init(minimumCapacity:)();
}

uint64_t Dictionary.debugDescription.getter()
{
  return Dictionary.debugDescription.getter();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t Character._isSingleScalar.getter()
{
  return Character._isSingleScalar.getter();
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)()
{
  return BidirectionalCollection<>.firstMatch<A, B>(of:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

Swift::String __swiftcall String.init(_:)(NSString a1)
{
  uint64_t v1 = String.init(_:)(a1);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

Swift::String __swiftcall String.init(sqliteStatement:index:)(Swift::OpaquePointer sqliteStatement, Swift::Int32 index)
{
  uint64_t v2 = String.init(sqliteStatement:index:)(sqliteStatement._rawValue, *(void *)&index);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = String.Iterator.next()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t type metadata accessor for CancellationError()
{
  return type metadata accessor for CancellationError();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

Swift::Void __swiftcall TaskGroup.cancelAll()()
{
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

Swift::Double __swiftcall Double.init(sqliteStatement:index:)(Swift::OpaquePointer sqliteStatement, Swift::Int32 index)
{
  Double.init(sqliteStatement:index:)(sqliteStatement._rawValue, *(void *)&index);
  return result;
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.Attributes.concurrent.getter()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static ODIServiceProviderId.workflowIdFromServiceProviderId(_:)()
{
  return static ODIServiceProviderId.workflowIdFromServiceProviderId(_:)();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t NSManagedObjectContext.performAndWait<A>(_:)()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t NSManagedObjectContext.fetch<A>(_:)()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

Swift::String __swiftcall Substring.lowercased()()
{
  uint64_t v0 = Substring.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t BinaryInteger.description.getter()
{
  return BinaryInteger.description.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t AsyncCompactMapSequence.init(_:transform:)()
{
  return AsyncCompactMapSequence.init(_:transform:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

NSNumber __swiftcall Int32._bridgeToObjectiveC()()
{
  return (NSNumber)Int32._bridgeToObjectiveC()();
}

Swift::Int64 __swiftcall Int64.init(sqliteStatement:index:)(Swift::OpaquePointer sqliteStatement, Swift::Int32 index)
{
  return Int64.init(sqliteStatement:index:)(sqliteStatement._rawValue, *(void *)&index);
}

uint64_t Slice<>.withUnsafeBytes<A>(_:)()
{
  return Slice<>.withUnsafeBytes<A>(_:)();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)UInt64._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t CFPhoneNumberCopyISOCountryCode()
{
  return _CFPhoneNumberCopyISOCountryCode();
}

uint64_t CFPhoneNumberCreate()
{
  return _CFPhoneNumberCreate();
}

uint64_t CFPhoneNumberCreateString()
{
  return _CFPhoneNumberCreateString();
}

uint64_t CFPhoneNumberGetITUCountryCodeForISOCountryCode()
{
  return _CFPhoneNumberGetITUCountryCodeForISOCountryCode();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t SecCMSVerify()
{
  return _SecCMSVerify();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

uint64_t SecPolicyCreateApplePayModelSigning()
{
  return _SecPolicyCreateApplePayModelSigning();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

long double cos(long double __x)
{
  return _cos(__x);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocBox()
{
  return _swift_deallocBox();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassFromObject()
{
  return _swift_getObjCClassFromObject();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_A6B42kYrDuXnlUJs_IaS2bByRUGdVAKHz_(void *a1, const char *a2, ...)
{
  return [a1 A6B42kYrDuXnlUJs:IaS2bByRUGdVAKHz:];
}

id objc_msgSend_Dp2N5iuaONVuK1T4_JMJGqFLtbMZn4EGN_QsX3tfdMvsGwvY0F_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "Dp2N5iuaONVuK1T4:JMJGqFLtbMZn4EGN:QsX3tfdMvsGwvY0F:withCompletion:");
}

id objc_msgSend_E5J0OeRApCYQUXDZ_completion_(void *a1, const char *a2, ...)
{
  return [a1 E5J0OeRApCYQUXDZ:completion:];
}

id objc_msgSend_GyF0atX3JpCKc9pK(void *a1, const char *a2, ...)
{
  return _[a1 GyF0atX3JpCKc9pK];
}

id objc_msgSend_HeSoUpzppdCV64Ik_xNtFS0jGMQPgkTi7_i4KDOQicW9Xd5WBz_(void *a1, const char *a2, ...)
{
  return [a1 HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:];
}

id objc_msgSend_ILEFYKTi2wz6Hf5l_(void *a1, const char *a2, ...)
{
  return [a1 ILEFYKTi2wz6Hf5l:];
}

id objc_msgSend_ISOCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 ISOCountryCode];
}

id objc_msgSend_Iv2P4WxadRhQ5ldX_GymwzUEOAaggmTfe_Y16kne8dG6NtD3ma_completion_yVhet0BX5E1CDncz_(void *a1, const char *a2, ...)
{
  return [a1 Iv2P4WxadRhQ5ldX:GymwzUEOAaggmTfe:Y16kne8dG6NtD3ma:completion:yVhet0BX5E1CDncz:];
}

id objc_msgSend_JI0A3nkqsab9cUj8_completion_(void *a1, const char *a2, ...)
{
  return [a1 JI0A3nkqsab9cUj8:completion:];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:x0 options:x1 error:x2];
}

id objc_msgSend_JmiV9VW8P3Gxz1H7(void *a1, const char *a2, ...)
{
  return _[a1 JmiV9VW8P3Gxz1H7];
}

id objc_msgSend_KKbGrSwDukIWFRjI_i4KDOQicW9Xd5WBz_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "KKbGrSwDukIWFRjI:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:");
}

id objc_msgSend_KqWH25SjlYcX4wo6_completion_(void *a1, const char *a2, ...)
{
  return [a1 KqWH25SjlYcX4wo6:completion:];
}

id objc_msgSend_KvXBZ2Y159GbeEgH_(void *a1, const char *a2, ...)
{
  return [a1 KvXBZ2Y159GbeEgH:];
}

id objc_msgSend_L2S3goqpYnHiXTRg_(void *a1, const char *a2, ...)
{
  return [a1 L2S3goqpYnHiXTRg:];
}

id objc_msgSend_LjU00AjDrcTJbVJD(void *a1, const char *a2, ...)
{
  return _[a1 LjU00AjDrcTJbVJD];
}

id objc_msgSend_LygrmXh7W0Hs2O8n_(void *a1, const char *a2, ...)
{
  return [a1 LygrmXh7W0Hs2O8n:];
}

id objc_msgSend_N2XtGIRzgUKLkZMS_(void *a1, const char *a2, ...)
{
  return [a1 N2XtGIRzgUKLkZMS];
}

id objc_msgSend_N6iJbZh5ycxf9a3z(void *a1, const char *a2, ...)
{
  return _[a1 N6iJbZh5ycxf9a3z];
}

id objc_msgSend_N8Azi3NI6QrNPsLP(void *a1, const char *a2, ...)
{
  return _[a1 N8Azi3NI6QrNPsLP];
}

id objc_msgSend_OiM1BBSmKozL6ooU(void *a1, const char *a2, ...)
{
  return _[a1 OiM1BBSmKozL6ooU];
}

id objc_msgSend_OtYQBavMHoCfV2sk_(void *a1, const char *a2, ...)
{
  return [a1 OtYQBavMHoCfV2sk:];
}

id objc_msgSend_PJ7tY2vmxQ3CBhNO(void *a1, const char *a2, ...)
{
  return _[a1 PJ7tY2vmxQ3CBhNO];
}

id objc_msgSend_PLMCCRRqEw4moT9R_UtPlzRffoEpw7Ue1_SFkZRA5Ek9YzhDRs_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "PLMCCRRqEw4moT9R:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:");
}

id objc_msgSend_PpszCwt7GD641hHj(void *a1, const char *a2, ...)
{
  return _[a1 PpszCwt7GD641hHj];
}

id objc_msgSend_QRKmlh1jb9SsY8of_(void *a1, const char *a2, ...)
{
  return [a1 QRKmlh1jb9SsY8of];
}

id objc_msgSend_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "QeMnG23X94qgz7jT:hostChallenge:challengeResponse:seid:nonce:completion:");
}

id objc_msgSend_SKiIwgejuzELNOY0_completion_(void *a1, const char *a2, ...)
{
  return [a1 SKiIwgejuzELNOY0:completion:];
}

id objc_msgSend_SNfHoVX7xML3tdWp(void *a1, const char *a2, ...)
{
  return _[a1 SNfHoVX7xML3tdWp];
}

id objc_msgSend_SvXmeMlpC8nbshta_name_(void *a1, const char *a2, ...)
{
  return [a1 SvXmeMlpC8nbshta:name:];
}

id objc_msgSend_U4k02bIWNYQCLSGK_completion_(void *a1, const char *a2, ...)
{
  return [a1 U4k02bIWNYQCLSGK:completion:];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return [a1 URLsForDirectory:inDomains:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_Uh5ScKFVtUOjeURk(void *a1, const char *a2, ...)
{
  return _[a1 Uh5ScKFVtUOjeURk];
}

id objc_msgSend_UupMWO2j2nYek7xf_exi2C8VfynTXu5cU_TYPlhTGwKuAdWgfx_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [a1 UupMWO2j2nYek7xf:exi2C8VfynTXu5cU:TYPlhTGwKuAdWgfx:TWWnmIjkBlMfHmma:];
}

id objc_msgSend_WnJ3gJFPRgsreXQi_(void *a1, const char *a2, ...)
{
  return [a1 WnJ3gJFPRgsreXQi:];
}

id objc_msgSend_XIxEGt72u9dQYi43_S6srINK5PmHWLUdD_(void *a1, const char *a2, ...)
{
  return [a1 XIxEGt72u9dQYi43:S6srINK5PmHWLUdD:];
}

id objc_msgSend_Xj38ZYkbLwtCgBTH(void *a1, const char *a2, ...)
{
  return _[a1 Xj38ZYkbLwtCgBTH];
}

id objc_msgSend_Xw2iAzNBHudJx7Ph_(void *a1, const char *a2, ...)
{
  return [a1 Xw2iAzNBHudJx7Ph:];
}

id objc_msgSend_YGGzx6XAo42A7s6x(void *a1, const char *a2, ...)
{
  return _[a1 YGGzx6XAo42A7s6x];
}

id objc_msgSend_YKIcrg8ijyspX6ho_forVersion_(void *a1, const char *a2, ...)
{
  return [a1 YKIcrg8ijyspX6ho:forVersion:];
}

id objc_msgSend_YKIcrg8ijyspX6ho_forVersion_entityName_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "YKIcrg8ijyspX6ho:forVersion:entityName:");
}

id objc_msgSend_YMeSiVAJwqHb7P3U_completion_(void *a1, const char *a2, ...)
{
  return [a1 YMeSiVAJwqHb7P3U:completion:];
}

id objc_msgSend_YdwGDxa5y8ubHXip_(void *a1, const char *a2, ...)
{
  return [a1 YdwGDxa5y8ubHXip];
}

id objc_msgSend_Z0E7K4HXPkrVY9dm_(void *a1, const char *a2, ...)
{
  return [a1 Z0E7K4HXPkrVY9dm:];
}

id objc_msgSend_ZfE6lVphNUVrZcKx_completion_(void *a1, const char *a2, ...)
{
  return [a1 ZfE6lVphNUVrZcKx:completion:];
}

id objc_msgSend_ZkTXckPDVjRWZuVM_QsX3tfdMvsGwvY0F_oMKZEzaKOVd8YlLk_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "ZkTXckPDVjRWZuVM:QsX3tfdMvsGwvY0F:oMKZEzaKOVd8YlLk:withCompletion:");
}

id objc_msgSend__crossPlatformUnifiedMeContactWithKeysToFetch_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:");
}

id objc_msgSend__ex9HyFJUdpLOOtaX_inS0qtOusqaPbbgj_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_ex9HyFJUdpLOOtaX:inS0qtOusqaPbbgj:");
}

id objc_msgSend__extractPHAssetPropertySets_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_extractPHAssetPropertySets:");
}

id objc_msgSend__initWithSuiteName_container_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithSuiteName:container:");
}

id objc_msgSend__uTjOtNxowyWuuBCA_N3UHg1ij3irF9uUu_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_uTjOtNxowyWuuBCA:N3UHg1ij3irF9uUu:");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryAppleAccount];
}

id objc_msgSend_aa_primaryEmail(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryEmail];
}

id objc_msgSend_accountHandles(void *a1, const char *a2, ...)
{
  return _[a1 accountHandles];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:")];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assessment(void *a1, const char *a2, ...)
{
  return _[a1 assessment];
}

id objc_msgSend_assessmentGUID(void *a1, const char *a2, ...)
{
  return _[a1 assessmentGUID];
}

id objc_msgSend_assessmentGUIDSeeds(void *a1, const char *a2, ...)
{
  return _[a1 assessmentGUIDSeeds];
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return [a1 attributeForKey:];
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return _[a1 attributeSet];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "attributesOfItemAtPath:error:")];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authenticationCertificateSignatures(void *a1, const char *a2, ...)
{
  return _[a1 authenticationCertificateSignatures];
}

id objc_msgSend_authorAddresses(void *a1, const char *a2, ...)
{
  return _[a1 authorAddresses];
}

id objc_msgSend_authorEmailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 authorEmailAddresses];
}

id objc_msgSend_authorizationStatusForEntityType_(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatusForEntityType:];
}

id objc_msgSend_ax7Szgk7yfiKNgSDError_(void *a1, const char *a2, ...)
{
  return [a1 ax7Szgk7yfiKNgSDError:];
}

id objc_msgSend_b8mzIZQ1GCTnhVAP_completion_(void *a1, const char *a2, ...)
{
  return [a1 b8mzIZQ1GCTnhVAP:completion:];
}

id objc_msgSend_bQfuQcBGI0pnDtDP_completion_(void *a1, const char *a2, ...)
{
  return [a1 bQfuQcBGI0pnDtDP:completion:];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_bagIDForDF_(void *a1, const char *a2, ...)
{
  return [a1 bagIDForDF:];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_bfeta0KhydoCRvAc(void *a1, const char *a2, ...)
{
  return _[a1 bfeta0KhydoCRvAc];
}

id objc_msgSend_bindings(void *a1, const char *a2, ...)
{
  return _[a1 bindings];
}

id objc_msgSend_bindingsEvaluator(void *a1, const char *a2, ...)
{
  return _[a1 bindingsEvaluator];
}

id objc_msgSend_bindingsToCompare(void *a1, const char *a2, ...)
{
  return _[a1 bindingsToCompare];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_c94QZ147F1UWY71l_jkjlhN0UgO78kW6q_error_(void *a1, const char *a2, ...)
{
  return [a1 c94QZ147F1UWY71l:jkjlhN0UgO78kW6q:error:];
}

id objc_msgSend_cGauGmZFPJJkT1d3_(void *a1, const char *a2, ...)
{
  return [a1 cGauGmZFPJJkT1d3:];
}

id objc_msgSend_cLH5z0XbtucU9RrW_(void *a1, const char *a2, ...)
{
  return [a1 cLH5z0XbtucU9RrW:];
}

id objc_msgSend_cR9LfsxC1Nz4IZKu(void *a1, const char *a2, ...)
{
  return _[a1 cR9LfsxC1Nz4IZKu];
}

id objc_msgSend_cZK3HwMuoGcCgDQI(void *a1, const char *a2, ...)
{
  return _[a1 cZK3HwMuoGcCgDQI];
}

id objc_msgSend_cacheManager(void *a1, const char *a2, ...)
{
  return _[a1 cacheManager];
}

id objc_msgSend_cacheV2MaxAge(void *a1, const char *a2, ...)
{
  return _[a1 cacheV2MaxAge];
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _[a1 callStatus];
}

id objc_msgSend_canSerialize_(void *a1, const char *a2, ...)
{
  return [a1 canSerialize:];
}

id objc_msgSend_canonicalStringForAddress_(void *a1, const char *a2, ...)
{
  return [a1 canonicalStringForAddress:];
}

id objc_msgSend_captureWithBindings_(void *a1, const char *a2, ...)
{
  return [a1 captureWithBindings:];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 checkResourceIsReachableAndReturnError:];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return _[a1 city];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByCharactersInSet:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compute_UtPlzRffoEpw7Ue1_SFkZRA5Ek9YzhDRs_jAVr67FQ6j4EzsgV_i4KDOQicW9Xd5WBz_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "compute:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:jAVr67FQ6j4EzsgV:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:");
}

id objc_msgSend_computeHash_jAVr67FQ6j4EzsgV_i4KDOQicW9Xd5WBz_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [a1 computeHash:jAVr67FQ6j4EzsgV:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:];
}

id objc_msgSend_configDictionaryForCoreODI(void *a1, const char *a2, ...)
{
  return _[a1 configDictionaryForCoreODI];
}

id objc_msgSend_configurePush(void *a1, const char *a2, ...)
{
  return _[a1 configurePush];
}

id objc_msgSend_connectedDate(void *a1, const char *a2, ...)
{
  return _[a1 connectedDate];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 containerURLForSecurityApplicationGroupIdentifier:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtPath:x0 error:x1];
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_coreDataManager(void *a1, const char *a2, ...)
{
  return _[a1 coreDataManager];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 countForFetchRequest:x0 error:x1];
}

id objc_msgSend_countOfCallsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 countOfCallsPassingTest:];
}

id objc_msgSend_countTransactionsWithStartDateOffset_endDateOffset_transactionSources_locationType_locationFilterDistance_lat_lon_maxCount_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:completionHandler:");
}

id objc_msgSend_counter(void *a1, const char *a2, ...)
{
  return _[a1 counter];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return _[a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createdAt(void *a1, const char *a2, ...)
{
  return _[a1 createdAt];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_cv2QAcQ2CDdiHuN6_(void *a1, const char *a2, ...)
{
  return [a1 cv2QAcQ2CDdiHuN6:];
}

id objc_msgSend_dKsJLlNX54lzKt5n_eqF2XJh3hHBJQf2K_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "dKsJLlNX54lzKt5n:eqF2XJh3hHBJQf2K:");
}

id objc_msgSend_dOcbonNWKg7PJwsF_QlGRpofDrDPpBRod_mfJ8r89KwA6nfqNY_(void *a1, const char *a2, ...)
{
  return [a1 dOcbonNWKg7PJwsF:QlGRpofDrDPpBRod:mfJ8r89KwA6nfqNY:];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:length:];
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return [a1 dataWithData:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSince1970:];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return [a1 deleteObject:];
}

id objc_msgSend_dependenciesForStringExpression_(void *a1, const char *a2, ...)
{
  return [a1 dependenciesForStringExpression:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dfMaxAge(void *a1, const char *a2, ...)
{
  return _[a1 dfMaxAge];
}

id objc_msgSend_dfVal(void *a1, const char *a2, ...)
{
  return _[a1 dfVal];
}

id objc_msgSend_df_ttl(void *a1, const char *a2, ...)
{
  return [a1 df_ttl];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfURL:error:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_digestIndex(void *a1, const char *a2, ...)
{
  return _[a1 digestIndex];
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return [a1 distanceFromLocation:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_eJSthhES04gLkDjz_i4KDOQicW9Xd5WBz_TWWnmIjkBlMfHmma_eZh1LWn1FH2uQtPX_(void *a1, const char *a2, ...)
{
  return [a1 eJSthhES04gLkDjz:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:eZh1LWn1FH2uQtPX:];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return _[a1 email];
}

id objc_msgSend_embeddedSecureElementWithError_(void *a1, const char *a2, ...)
{
  return [a1 embeddedSecureElementWithError:];
}

id objc_msgSend_enableCHShowProtectedAppsForManager_(void *a1, const char *a2, ...)
{
  return [a1 enableCHShowProtectedAppsForManager:];
}

id objc_msgSend_encodeBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 encodeBytes:length:];
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt32:forKey:];
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt:forKey:];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:forKey:];
}

id objc_msgSend_encodeObject_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_encryptedAGUID(void *a1, const char *a2, ...)
{
  return _[a1 encryptedAGUID];
}

id objc_msgSend_encryptedTSID(void *a1, const char *a2, ...)
{
  return _[a1 encryptedTSID];
}

id objc_msgSend_endSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 endSessionWithCompletion:];
}

id objc_msgSend_endpointID(void *a1, const char *a2, ...)
{
  return _[a1 endpointID];
}

id objc_msgSend_endpointIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 endpointIdentifier];
}

id objc_msgSend_engineType(void *a1, const char *a2, ...)
{
  return _[a1 engineType];
}

id objc_msgSend_entityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 entityForName:inManagedObjectContext:];
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return _[a1 entityName];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtPath:];
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return _[a1 errorDomain];
}

id objc_msgSend_errorFromUnderlyingError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "errorFromUnderlyingError:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_evaluateWithAttribute_expression_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithAttribute:expression:];
}

id objc_msgSend_evaluateWithObject_substitutionVariables_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithObject:x0 substitutionVariables:x1];
}

id objc_msgSend_evrtH713YbFfEOzk_error_(void *a1, const char *a2, ...)
{
  return [a1 evrtH713YbFfEOzk:error:];
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeFetchRequest:error];
}

id objc_msgSend_executeRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeRequest:error];
}

id objc_msgSend_expressionDictionary(void *a1, const char *a2, ...)
{
  return _[a1 expressionDictionary];
}

id objc_msgSend_expressionValueWithObject_context_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "expressionValueWithObject:context:");
}

id objc_msgSend_expressionWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 expressionWithFormat:];
}

id objc_msgSend_f5FVXJrOBjzaLi8u_(void *a1, const char *a2, ...)
{
  return [a1 f5FVXJrOBjzaLi8u:];
}

id objc_msgSend_f7RoJXIsBwkuxLd1_completionBlock_fNW5Ll4jBXJAcsCk_(void *a1, const char *a2, ...)
{
  return [a1 f7RoJXIsBwkuxLd1:completionBlock:fNW54jBXJAcsCk:];
}

id objc_msgSend_f9CcEr7NPHjNuSLf_error_(void *a1, const char *a2, ...)
{
  return [a1 f9CcEr7NPHjNuSLf:error:];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fetchAnonymousXPCEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 fetchAnonymousXPCEndpoint];
}

id objc_msgSend_fetchAssetsWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 fetchAssetsWithOptions:];
}

id objc_msgSend_fetchFor_withBindings_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchFor:withBindings:completionHandler:");
}

id objc_msgSend_fetchGeoCodingsForAddresses_(void *a1, const char *a2, ...)
{
  return [a1 fetchGeoCodingsForAddresses:];
}

id objc_msgSend_fetchRavioliDataFromStoreFor_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchRavioliDataFromStoreFor:completion:");
}

id objc_msgSend_fetchRemoteControlStatus_(void *a1, const char *a2, ...)
{
  return [a1 fetchRemoteControlStatus:];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _[a1 fetchRequest];
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return [a1 fetchRequestWithEntityName:];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return _[a1 fields];
}

id objc_msgSend_fileAttributes(void *a1, const char *a2, ...)
{
  return _[a1 fileAttributes];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReadingAtPath:];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_filterWithIsIncluded_(void *a1, const char *a2, ...)
{
  return [a1 filterWithIsIncluded:];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finalResult(void *a1, const char *a2, ...)
{
  return _[a1 finalResult];
}

id objc_msgSend_findForUuid_(void *a1, const char *a2, ...)
{
  return [a1 findForUuid:];
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return _[a1 finishEncoding];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fjcJHNNiQ83H10La(void *a1, const char *a2, ...)
{
  return _[a1 fjcJHNNiQ83H10La];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_foundItemCount(void *a1, const char *a2, ...)
{
  return _[a1 foundItemCount];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_gFJw2BGPtEQWyLz5(void *a1, const char *a2, ...)
{
  return _[a1 gFJw2BGPtEQWyLz5];
}

id objc_msgSend_generatePhoneAuthenticationSignatureOverData_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "generatePhoneAuthenticationSignatureOverData:withCompletion:")];
}

id objc_msgSend_getActiveContexts_(void *a1, const char *a2, ...)
{
  return [a1 getActiveContexts:];
}

id objc_msgSend_getCryptogram_challengeResponse_(void *a1, const char *a2, ...)
{
  return [a1 getCryptogram:challengeResponse:];
}

id objc_msgSend_getEnvironmentValue(void *a1, const char *a2, ...)
{
  return _[a1 getEnvironmentValue];
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return _[a1 getHwSupport];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalUrl];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_ggQex4P6Prvm5Zac(void *a1, const char *a2, ...)
{
  return _[a1 ggQex4P6Prvm5Zac];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_hKjCyPlJs74k9vMV_(void *a1, const char *a2, ...)
{
  return [a1 hKjCyPlJs74k9vMV:];
}

id objc_msgSend_hSmO2OC6etXclsKP_edrv2qHmtbt1iEyf_QsX3tfdMvsGwvY0F_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "hSmO2OC6etXclsKP:edrv2qHmtbt1iEyf:QsX3tfdMvsGwvY0F:completion:")];
}

id objc_msgSend_hasActiveCalls_(void *a1, const char *a2, ...)
{
  return [a1 hasActiveCalls:];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasChanges];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hi5ump20ke7n4x6o_(void *a1, const char *a2, ...)
{
  return [a1 hi5ump20ke7n4x6o:];
}

id objc_msgSend_hi5ump20ke7n4x6o_hikv315wqxcu0dpl_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "hi5ump20ke7n4x6o:hikv315wqxcu0dpl:");
}

id objc_msgSend_hiMi2bftgysHNCmu(void *a1, const char *a2, ...)
{
  return _[a1 hiMi2bftgysHNCmu];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAccuracy];
}

id objc_msgSend_i4KDOQicW9Xd5WBz(void *a1, const char *a2, ...)
{
  return _[a1 i4KDOQicW9Xd5WBz];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return _[a1 id];
}

id objc_msgSend_initLocationManager_dko5Pwm7el1Ulopu_(void *a1, const char *a2, ...)
{
  return [a1 initLocationManager:dko5Pwm7el1Ulopu:];
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return [a1 initRequiringSecureCoding:];
}

id objc_msgSend_initWithAddress_location_updated_(void *a1, const char *a2, ...)
{
  return [a1 initWithAddress:x0 location:x1 updated:x2];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithBase64EncodedString:options:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithCoreDataManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithCoreDataManager:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithEffectiveBundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffectiveBundle:];
}

id objc_msgSend_initWithEntity_insertIntoManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntity:x0 insertIntoManagedObjectContext:x1];
}

id objc_msgSend_initWithEntityName_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntityName:];
}

id objc_msgSend_initWithFetchRequest_(void *a1, const char *a2, ...)
{
  return [a1 initWithFetchRequest:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithGyF0atX3JpCKc9pK_qfSDGTGvqd3Hruzg_(void *a1, const char *a2, ...)
{
  return [a1 initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:];
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:x0 ascending:x1];
}

id objc_msgSend_initWithKey_updatedDate_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:x0 updatedDate:x1 value:x2];
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return [a1 initWithLatitude:x0 longitude:x1];
}

id objc_msgSend_initWithListenerEndpoint_callCenter_(void *a1, const char *a2, ...)
{
  return [a1 initWithListenerEndpoint:x0 callCenter:x1];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithName_managedObjectModel_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 managedObjectModel:x1];
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return [a1 initWithObject:];
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithPattern:x0 options:x1 error:x2];
}

id objc_msgSend_initWithQueryString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueryString:attributes:];
}

id objc_msgSend_initWithQueryString_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueryString:x0 context:x1];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithSmoothFunctions_X5iUjoUzZPsj1b68_(void *a1, const char *a2, ...)
{
  return [a1 initWithSmoothFunctions:X5iUjoUzZPsj1b68:];
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartDate:x0 endDate:x1 maxEvents:x2 lastN:x3 reversed:x4];
}

id objc_msgSend_initWithStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithStore:];
}

id objc_msgSend_initWithStore_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithStore:options:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimeIntervalSinceNow:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_initWithZKQesNL3BCNYUjZw_(void *a1, const char *a2, ...)
{
  return [a1 initWithZKQesNL3BCNYUjZw:];
}

id objc_msgSend_initWithdEyUJuqYjUufZYGN_(void *a1, const char *a2, ...)
{
  return [a1 initWithdEyUJuqYjUufZYGN:];
}

id objc_msgSend_initWithdEyUJuqYjUufZYGN_CYjHC6NGGdOD33W9_g8citQiyynNCr9c4_(void *a1, const char *a2, ...)
{
  return [a1 initWithdEyUJuqYjUufZYGN:CYjHC6NGGdOD33W9:g8citQiyynNCr9c4:];
}

id objc_msgSend_initWithdEyUJuqYjUufZYGN_Po0NnEfbQHpSgzj7_jHoy3L8RogTTbjjB_X5iUjoUzZPsj1b68_(void *a1, const char *a2, ...)
{
  return [a1 initWithdEyUJuqYjUufZYGN:Po0NnEfbQHpSgzj7:jHoy3L8RogTTbjjB:X5iUjoUzZPsj1b68:];
}

id objc_msgSend_initWithfOZWnqN9bY6jwOMf_(void *a1, const char *a2, ...)
{
  return [a1 initWithfOZWnqN9bY6jwOMf:];
}

id objc_msgSend_initWithsk6s81V5EsZL9icr_(void *a1, const char *a2, ...)
{
  return [a1 initWithsk6s81V5EsZL9icr:];
}

id objc_msgSend_initWithtaDFBApmLBObrNlM_itCyNcNHxjurvzrS_(void *a1, const char *a2, ...)
{
  return [a1 initWithtaDFBApmLBObrNlM:itCyNcNHxjurvzrS:];
}

id objc_msgSend_initializeNFHardwareManagerStateWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initializeNFHardwareManagerStateWithCompletion:");
}

id objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 insertNewObjectForEntityForName:inManagedObjectContext:];
}

id objc_msgSend_insertNewObjectInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 insertNewObjectInManagedObjectContext:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_isConversation(void *a1, const char *a2, ...)
{
  return _[a1 isConversation];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFeatureEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isFeatureEnabled];
}

id objc_msgSend_isFromMDM(void *a1, const char *a2, ...)
{
  return _[a1 isFromMDM];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isProducedByAccessory(void *a1, const char *a2, ...)
{
  return _[a1 isProducedByAccessory];
}

id objc_msgSend_isSimulatedBySoftware(void *a1, const char *a2, ...)
{
  return _[a1 isSimulatedBySoftware];
}

id objc_msgSend_j2Xe3JZjJDN8Y8xD_(void *a1, const char *a2, ...)
{
  return [a1 j2Xe3JZjJDN8Y8xD:];
}

id objc_msgSend_jCbmcix0xxhNVOSS_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "jCbmcix0xxhNVOSS:TWWnmIjkBlMfHmma:");
}

id objc_msgSend_jzyh7hNN2V5AZJR1(void *a1, const char *a2, ...)
{
  return _[a1 jzyh7hNN2V5AZJR1];
}

id objc_msgSend_kernelInfoEvaluator(void *a1, const char *a2, ...)
{
  return _[a1 kernelInfoEvaluator];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_lL9A0cjB5y6UgZsI(void *a1, const char *a2, ...)
{
  return _[a1 lL9A0cjB5y6UgZsI];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_listDependencies_jAVr67FQ6j4EzsgV_(void *a1, const char *a2, ...)
{
  return [a1 listDependencies:jAVr67FQ6j4EzsgV:];
}

id objc_msgSend_listDependenciesForDataframe_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "listDependenciesForDataframe:");
}

id objc_msgSend_listDependenciesForIntExpression_(void *a1, const char *a2, ...)
{
  return [a1 listDependenciesForIntExpression:];
}

id objc_msgSend_listDependenciesForStringType_(void *a1, const char *a2, ...)
{
  return [a1 listDependenciesForStringType:];
}

id objc_msgSend_loadAllFromPreferencesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "loadAllFromPreferencesWithCompletionHandler:");
}

id objc_msgSend_loadPersistentStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadPersistentStoresWithCompletionHandler:];
}

id objc_msgSend_loadScreenMirroringStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadScreenMirroringStatusWithCompletionHandler:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_m2fzkz0hfx3YgwiD(void *a1, const char *a2, ...)
{
  return _[a1 m2fzkz0hfx3YgwiD];
}

id objc_msgSend_mF9a0iyS9JaiQAjp_pXKoPMsQI9AYa6US_(void *a1, const char *a2, ...)
{
  return [a1 mF9a0iyS9JaiQAjp:pXKoPMsQI9AYa6US:];
}

id objc_msgSend_mILKmibfRWMwFVWD_iZGmRj7VI4MJ9lO1_AndError_(void *a1, const char *a2, ...)
{
  return [a1 mILKmibfRWMwFVWD:iZGmRj7VI4MJ9lO1:AndError:];
}

id objc_msgSend_macVal(void *a1, const char *a2, ...)
{
  return _[a1 macVal];
}

id objc_msgSend_matchesInString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 matchesInString:x0 options:x1 range:x2];
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return [a1 methodForSelector:];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return _[a1 middleName];
}

id objc_msgSend_migrateCoreDataManager(void *a1, const char *a2, ...)
{
  return _[a1 migrateCoreDataManager];
}

id objc_msgSend_missingBag(void *a1, const char *a2, ...)
{
  return _[a1 missingBag];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nC4QvxwoXaT2I88i(void *a1, const char *a2, ...)
{
  return _[a1 nC4QvxwoXaT2I88i];
}

id objc_msgSend_nQ82YhFf5OQDL4Qk_UtPlzRffoEpw7Ue1_SFkZRA5Ek9YzhDRs_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [a1 nQ82YhFf5OQDL4Qk:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:];
}

id objc_msgSend_nYOW3DfIUVSEf2Hm_rTZQrPNUbDSIifrh_(void *a1, const char *a2, ...)
{
  return [a1 nYOW3DfIUVSEf2Hm:rTZQrPNUbDSIifrh:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_namePrefix(void *a1, const char *a2, ...)
{
  return _[a1 namePrefix];
}

id objc_msgSend_nameSuffix(void *a1, const char *a2, ...)
{
  return _[a1 nameSuffix];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return _[a1 newBackgroundContext];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return _[a1 nickname];
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedValue];
}

id objc_msgSend_notifyCachesWereRemovedWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 notifyCachesWereRemovedWithCompletionHandler:];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfMatchesInString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 numberOfMatchesInString:x0 options:x1 range:x2];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openAndWaitWithUpgrade_error_(void *a1, const char *a2, ...)
{
  return [a1 openAndWaitWithUpgrade:error];
}

id objc_msgSend_originalDataLength(void *a1, const char *a2, ...)
{
  return _[a1 originalDataLength];
}

id objc_msgSend_otdDestinationHost(void *a1, const char *a2, ...)
{
  return _[a1 otdDestinationHost];
}

id objc_msgSend_otlAmd6vMhhfwQLu_withObject_errorValue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "otlAmd6vMhhfwQLu:withObject:errorValue:")];
}

id objc_msgSend_p3IhAuuUciVQl4AK(void *a1, const char *a2, ...)
{
  return _[a1 p3IhAuuUciVQl4AK];
}

id objc_msgSend_pDYAPbGDBo6ZMVXG_(void *a1, const char *a2, ...)
{
  return [a1 pDYAPbGDBo6ZMVXG:];
}

id objc_msgSend_pEmail(void *a1, const char *a2, ...)
{
  return _[a1 pEmail];
}

id objc_msgSend_pPhone(void *a1, const char *a2, ...)
{
  return _[a1 pPhone];
}

id objc_msgSend_pRfmPXmMPeo7rsRf_N3UHg1ij3irF9uUu_QsX3tfdMvsGwvY0F_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 pRfmPXmMPeo7rsRf:N3UHg1ij3irF9uUu:QsX3tfdMvsGwvY0F:completionBlock:];
}

id objc_msgSend_passesOfStyles_(void *a1, const char *a2, ...)
{
  return [a1 passesOfStyles:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pausePrecomputationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 pausePrecomputationsWithCompletionHandler:];
}

id objc_msgSend_payloadWorkflowTTLs(void *a1, const char *a2, ...)
{
  return _[a1 payloadWorkflowTTLs];
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return [a1 performBlock:];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performBlockAndWait:];
}

id objc_msgSend_persistentStoreDescriptionWithURL_(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreDescriptionWithURL:];
}

id objc_msgSend_personNameComponentsFromString_(void *a1, const char *a2, ...)
{
  return [a1 personNameComponentsFromString:];
}

id objc_msgSend_phone(void *a1, const char *a2, ...)
{
  return _[a1 phone];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return _[a1 postalCode];
}

id objc_msgSend_ppirDXSrO0poQaQJ(void *a1, const char *a2, ...)
{
  return _[a1 ppirDXSrO0poQaQJ];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_presentTime(void *a1, const char *a2, ...)
{
  return _[a1 presentTime];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processServerJSONDataframeForBagWithID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processServerJSONDataframeForBagWithID:");
}

id objc_msgSend_profID(void *a1, const char *a2, ...)
{
  return _[a1 profID];
}

id objc_msgSend_profileID(void *a1, const char *a2, ...)
{
  return _[a1 profileID];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [a1 propertyListWithData:x0 options:x1 format:x2 error:x3];
}

id objc_msgSend_propertySets(void *a1, const char *a2, ...)
{
  return _[a1 propertySets];
}

id objc_msgSend_protocolConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 protocolConfiguration];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return _[a1 publisher];
}

id objc_msgSend_publisherFromStartTime_(void *a1, const char *a2, ...)
{
  return [a1 publisherFromStartTime:];
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 publisherWithOptions:];
}

id objc_msgSend_publisherWithStartTime_endTime_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:")];
}

id objc_msgSend_pushInitialCoreODIConfig(void *a1, const char *a2, ...)
{
  return _[a1 pushInitialCoreODIConfig];
}

id objc_msgSend_qSbwrv1Q3SgLu8BN_gXKoR0dNwQUyaeOl_lEWFPyiFIAJ2uoyd_(void *a1, const char *a2, ...)
{
  return [a1 qSbwrv1Q3SgLu8BN:gXKoR0dNwQUyaeOl:lEWFPyiFIAJ2uoyd:];
}

id objc_msgSend_qY1DoQqvimc9pbAA_(void *a1, const char *a2, ...)
{
  return [a1 qY1DoQqvimc9pbAA:];
}

id objc_msgSend_qfSDGTGvqd3Hruzg(void *a1, const char *a2, ...)
{
  return _[a1 qfSDGTGvqd3Hruzg];
}

id objc_msgSend_qnmnskUkG0QuvlrL(void *a1, const char *a2, ...)
{
  return _[a1 qnmnskUkG0QuvlrL];
}

id objc_msgSend_queryKey(void *a1, const char *a2, ...)
{
  return _[a1 queryKey];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _[a1 queryMetaDataSync];
}

id objc_msgSend_queryTransactionsWithStartDateOffset_endDateOffset_transactionSources_locationType_locationFilterDistance_lat_lon_maxCount_sortOrder_sortByAttributes_attributes_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "queryTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:sortOrder:sortByAttributes:attributes:completionHandler:");
}

id objc_msgSend_qvdJFx0260C4oDQI(void *a1, const char *a2, ...)
{
  return _[a1 qvdJFx0260C4oDQI];
}

id objc_msgSend_r2wriXQ3o6jv840j_gXKoR0dNwQUyaeOl_lEWFPyiFIAJ2uoyd_(void *a1, const char *a2, ...)
{
  return [a1 r2wriXQ3o6jv840j:gXKoR0dNwQUyaeOl:lEWFPyiFIAJ2uoyd:];
}

id objc_msgSend_rEI50SHLlVc37Bvu(void *a1, const char *a2, ...)
{
  return _[a1 rEI50SHLlVc37Bvu];
}

id objc_msgSend_rKKialn8e4bTPAC9_error_(void *a1, const char *a2, ...)
{
  return [a1 rKKialn8e4bTPAC9:error:];
}

id objc_msgSend_rUC18JCl8oMcmXim(void *a1, const char *a2, ...)
{
  return _[a1 rUC18JCl8oMcmXim];
}

id objc_msgSend_ratchetState(void *a1, const char *a2, ...)
{
  return _[a1 ratchetState];
}

id objc_msgSend_ravioli(void *a1, const char *a2, ...)
{
  return _[a1 ravioli];
}

id objc_msgSend_ravioliUUID(void *a1, const char *a2, ...)
{
  return _[a1 ravioliUUID];
}

id objc_msgSend_rawValue(void *a1, const char *a2, ...)
{
  return _[a1 rawValue];
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return [a1 readDataUpToLength:x0 error:x1];
}

id objc_msgSend_recentCallsWithPredicate_(void *a1, const char *a2, ...)
{
  return [a1 recentCallsWithPredicate:];
}

id objc_msgSend_recipientAddresses(void *a1, const char *a2, ...)
{
  return _[a1 recipientAddresses];
}

id objc_msgSend_recipientEmailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 recipientEmailAddresses];
}

id objc_msgSend_refreshTTL(void *a1, const char *a2, ...)
{
  return _[a1 refreshTTL];
}

id objc_msgSend_registerEventListener_(void *a1, const char *a2, ...)
{
  return [a1 registerEventListener:];
}

id objc_msgSend_registerICloud(void *a1, const char *a2, ...)
{
  return _[a1 registerICloud];
}

id objc_msgSend_registerObservers(void *a1, const char *a2, ...)
{
  return _[a1 registerObservers];
}

id objc_msgSend_registerWithActivity_(void *a1, const char *a2, ...)
{
  return [a1 registerWithActivity:];
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 regularExpressionWithPattern:x0 options:x1 error:x2];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return _[a1 relativePath];
}

id objc_msgSend_releaseData(void *a1, const char *a2, ...)
{
  return _[a1 releaseData];
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandles];
}

id objc_msgSend_removeAllBindings(void *a1, const char *a2, ...)
{
  return _[a1 removeAllBindings];
}

id objc_msgSend_removeAllGeocodings(void *a1, const char *a2, ...)
{
  return _[a1 removeAllGeocodings];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeRavioli(void *a1, const char *a2, ...)
{
  return _[a1 removeRavioli];
}

id objc_msgSend_removeStoreWithURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeStoreWithURL:error:];
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return _[a1 requestLocation];
}

id objc_msgSend_requestRavioliFetchWithProbabiliticThrottleWithBagID_notificationId_(void *a1, const char *a2, ...)
{
  return [a1 requestRavioliFetchWithProbabiliticThrottleWithBagID:notificationId:];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumePrecomputationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 resumePrecomputationsWithCompletionHandler:];
}

id objc_msgSend_retrieveLegacyRavioliWithCoreDataManager_(void *a1, const char *a2, ...)
{
  return [a1 retrieveLegacyRavioliWithCoreDataManager:];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rk4Hn364TkSyMq2q_version_(void *a1, const char *a2, ...)
{
  return [a1 rk4Hn364TkSyMq2q:version:];
}

id objc_msgSend_rsNB9HkZVEH0l6fT_gsx0MJUoOpcxcozG_(void *a1, const char *a2, ...)
{
  return [a1 rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:];
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return [a1 runUntilDate:];
}

id objc_msgSend_runWithQuery_inputColNames_inputColTypes_error_(void *a1, const char *a2, ...)
{
  return [a1 runWithQuery:x0 inputColNames:x1 inputColTypes:x2 error:x3];
}

id objc_msgSend_sFFfMcUAtN14Bjc5(void *a1, const char *a2, ...)
{
  return _[a1 sFFfMcUAtN14Bjc5];
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return [a1 save:];
}

id objc_msgSend_scanLongLong_(void *a1, const char *a2, ...)
{
  return [a1 scanLongLong:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_sensitiveLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 sensitiveLoggingEnabled];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serverVerifiableEncoding(void *a1, const char *a2, ...)
{
  return _[a1 serverVerifiableEncoding];
}

id objc_msgSend_sessionStart(void *a1, const char *a2, ...)
{
  return _[a1 sessionStart];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return [a1 setAddress:];
}

id objc_msgSend_setAddressForLookup_(void *a1, const char *a2, ...)
{
  return [a1 setAddressForLookup:];
}

id objc_msgSend_setAllowsExpensiveAccess_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsExpensiveAccess:];
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return [a1 setBag:];
}

id objc_msgSend_setChunkSizeForFetch_(void *a1, const char *a2, ...)
{
  return [a1 setChunkSizeForFetch:];
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionHandler:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredAccuracy:];
}

id objc_msgSend_setDfMaxAge_(void *a1, const char *a2, ...)
{
  return [a1 setDfMaxAge:];
}

id objc_msgSend_setDfVal_(void *a1, const char *a2, ...)
{
  return [a1 setDfVal:];
}

id objc_msgSend_setDf_ttl_(void *a1, const char *a2, ...)
{
  return [a1 setDf_ttl:];
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return [a1 setDiscretionary:];
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceFilter:];
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return [a1 setDoNotBlockBeforeFirstUnlock:];
}

id objc_msgSend_setEmail_(void *a1, const char *a2, ...)
{
  return [a1 setEmail:];
}

id objc_msgSend_setEndpointID_(void *a1, const char *a2, ...)
{
  return [a1 setEndpointID:];
}

id objc_msgSend_setEndpointIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setEndpointIdentifier:];
}

id objc_msgSend_setEngineType_(void *a1, const char *a2, ...)
{
  return [a1 setEngineType:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setExpressionDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setExpressionDictionary:];
}

id objc_msgSend_setFetchAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setFetchAttributes:];
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return [a1 setFetchLimit:];
}

id objc_msgSend_setFetchOffset_(void *a1, const char *a2, ...)
{
  return [a1 setFetchOffset:];
}

id objc_msgSend_setFetchPropertySets_(void *a1, const char *a2, ...)
{
  return [a1 setFetchPropertySets:];
}

id objc_msgSend_setFields_(void *a1, const char *a2, ...)
{
  return [a1 setFields:];
}

id objc_msgSend_setFirstName_(void *a1, const char *a2, ...)
{
  return [a1 setFirstName:];
}

id objc_msgSend_setFoundItemsHandler_(void *a1, const char *a2, ...)
{
  return [a1 setFoundItemsHandler:];
}

id objc_msgSend_setFullName_(void *a1, const char *a2, ...)
{
  return [a1 setFullName:];
}

id objc_msgSend_setGgQex4P6Prvm5Zac_(void *a1, const char *a2, ...)
{
  return [a1 setGgQex4P6Prvm5Zac:];
}

id objc_msgSend_setGyF0atX3JpCKc9pK_(void *a1, const char *a2, ...)
{
  return [a1 setGyF0atX3JpCKc9pK:];
}

id objc_msgSend_setId_(void *a1, const char *a2, ...)
{
  return [a1 setId:];
}

id objc_msgSend_setIncludeUserActivities_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeUserActivities:];
}

id objc_msgSend_setInternalPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setInternalPredicate:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setJmiV9VW8P3Gxz1H7_(void *a1, const char *a2, ...)
{
  return [a1 setJmiV9VW8P3Gxz1H7:];
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return [a1 setKey:];
}

id objc_msgSend_setKp3LsdVLlXwFNqJV_(void *a1, const char *a2, ...)
{
  return [a1 setKp3LsdVLlXwFNqJV:];
}

id objc_msgSend_setLastAccessed_(void *a1, const char *a2, ...)
{
  return [a1 setLastAccessed:];
}

id objc_msgSend_setLastName_(void *a1, const char *a2, ...)
{
  return [a1 setLastName:];
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:];
}

id objc_msgSend_setMacVal_(void *a1, const char *a2, ...)
{
  return [a1 setMacVal:];
}

id objc_msgSend_setMaxCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxCount:];
}

id objc_msgSend_setMergePolicy_(void *a1, const char *a2, ...)
{
  return [a1 setMergePolicy:];
}

id objc_msgSend_setN8Azi3NI6QrNPsLP_(void *a1, const char *a2, ...)
{
  return [a1 setN8Azi3NI6QrNPsLP:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOption_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setOption:forKey:];
}

id objc_msgSend_setPEmail_(void *a1, const char *a2, ...)
{
  return [a1 setPEmail:];
}

id objc_msgSend_setPPhone_(void *a1, const char *a2, ...)
{
  return [a1 setPPhone:];
}

id objc_msgSend_setPersistentStoreDescriptions_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentStoreDescriptions:];
}

id objc_msgSend_setPhone_(void *a1, const char *a2, ...)
{
  return [a1 setPhone:];
}

id objc_msgSend_setPhotoLibrary_(void *a1, const char *a2, ...)
{
  return [a1 setPhotoLibrary:];
}

id objc_msgSend_setPpszCwt7GD641hHj_(void *a1, const char *a2, ...)
{
  return [a1 setPpszCwt7GD641hHj:];
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPredicate:];
}

id objc_msgSend_setPresentTime_(void *a1, const char *a2, ...)
{
  return [a1 setPresentTime:];
}

id objc_msgSend_setProfID_(void *a1, const char *a2, ...)
{
  return [a1 setProfID:];
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesToFetch:];
}

id objc_msgSend_setPropertiesToGroupBy_(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesToGroupBy:];
}

id objc_msgSend_setProtectionClasses_(void *a1, const char *a2, ...)
{
  return [a1 setProtectionClasses:];
}

id objc_msgSend_setQfSDGTGvqd3Hruzg_(void *a1, const char *a2, ...)
{
  return [a1 setQfSDGTGvqd3Hruzg:];
}

id objc_msgSend_setQueryKey_(void *a1, const char *a2, ...)
{
  return [a1 setQueryKey:];
}

id objc_msgSend_setRUC18JCl8oMcmXim_(void *a1, const char *a2, ...)
{
  return [a1 setRUC18JCl8oMcmXim:];
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresPowerPluggedIn:];
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return [a1 setResultType:];
}

id objc_msgSend_setReturnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return [a1 setReturnsObjectsAsFaults:];
}

id objc_msgSend_setSet_(void *a1, const char *a2, ...)
{
  return [a1 setSet:];
}

id objc_msgSend_setSettingsType_(void *a1, const char *a2, ...)
{
  return [a1 setSettingsType:];
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setSortDescriptors:];
}

id objc_msgSend_setUpdated_(void *a1, const char *a2, ...)
{
  return [a1 setUpdated:];
}

id objc_msgSend_setUpdatedAt_(void *a1, const char *a2, ...)
{
  return [a1 setUpdatedAt:];
}

id objc_msgSend_setVCWRguBEmim3giZ9_(void *a1, const char *a2, ...)
{
  return [a1 setVCWRguBEmim3giZ9:];
}

id objc_msgSend_setVal_(void *a1, const char *a2, ...)
{
  return [a1 setVal:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return [a1 setVersion:];
}

id objc_msgSend_setWgZJLy8f4tn41Pge_(void *a1, const char *a2, ...)
{
  return [a1 setWgZJLy8f4tn41Pge:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_setWorkflowID_(void *a1, const char *a2, ...)
{
  return [a1 setWorkflowID:];
}

id objc_msgSend_setXc4PEFTuh2u6xE7M_(void *a1, const char *a2, ...)
{
  return [a1 setXc4PEFTuh2u6xE7M:];
}

id objc_msgSend_setYABQBiEYyLNkt6IY_(void *a1, const char *a2, ...)
{
  return [a1 setYABQBiEYyLNkt6IY:];
}

id objc_msgSend_setYOtBxuHAYKqZrNQN_(void *a1, const char *a2, ...)
{
  return [a1 setYOtBxuHAYKqZrNQN:];
}

id objc_msgSend_setZDlKxUFITTJsP8iN_(void *a1, const char *a2, ...)
{
  return [a1 setZDlKxUFITTJsP8iN:];
}

id objc_msgSend_setZKQesNL3BCNYUjZw_(void *a1, const char *a2, ...)
{
  return [a1 setZKQesNL3BCNYUjZw:];
}

id objc_msgSend_settingsType(void *a1, const char *a2, ...)
{
  return _[a1 settingsType];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedHardwareManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 sharedPhotoLibrary];
}

id objc_msgSend_shouldSendOTD(void *a1, const char *a2, ...)
{
  return _[a1 shouldSendOTD];
}

id objc_msgSend_sinkWithCompletion_shouldContinue_(void *a1, const char *a2, ...)
{
  return [a1 sinkWithCompletion:shouldContinue:];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return _[a1 skipDescendants];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sortedArrayUsingDescriptors:")
}

id objc_msgSend_sourceInformation(void *a1, const char *a2, ...)
{
  return _[a1 sourceInformation];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return [a1 startCatalogDownload:x0 options:x1 then:x2];
}

id objc_msgSend_startSecureElementManagerSessionWithPriority_(void *a1, const char *a2, ...)
{
  return [a1 startSecureElementManagerSessionWithPriority:];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingLocation];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingLocation];
}

id objc_msgSend_storeNameWithExtensionForStoreWithName_(void *a1, const char *a2, ...)
{
  return [a1 storeNameWithExtensionForStoreWithName:];
}

id objc_msgSend_streamWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 streamWithIdentifier:error:];
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return _[a1 street];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_string_orDefault_(void *a1, const char *a2, ...)
{
  return [a1 string:orDefault:];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingMatchesInString:x0 options:x1 range:x2 withTemplate:x3];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subAdministrativeArea(void *a1, const char *a2, ...)
{
  return _[a1 subAdministrativeArea];
}

id objc_msgSend_subLocality(void *a1, const char *a2, ...)
{
  return _[a1 subLocality];
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subdataWithRange:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_takeDataAndOwnership(void *a1, const char *a2, ...)
{
  return _[a1 takeDataAndOwnership];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toDictionary];
}

id objc_msgSend_traHoYtdjqKLUZYc_(void *a1, const char *a2, ...)
{
  return [a1 traHoYtdjqKLUZYc:];
}

id objc_msgSend_trainingData(void *a1, const char *a2, ...)
{
  return _[a1 trainingData];
}

id objc_msgSend_trainingGUID(void *a1, const char *a2, ...)
{
  return _[a1 trainingGUID];
}

id objc_msgSend_trainingGUIDSeeds(void *a1, const char *a2, ...)
{
  return _[a1 trainingGUIDSeeds];
}

id objc_msgSend_trainingSignalID(void *a1, const char *a2, ...)
{
  return _[a1 trainingSignalID];
}

id objc_msgSend_triggerAllPrecomputationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 triggerAllPrecomputationsWithCompletionHandler:];
}

id objc_msgSend_triggerDuePrecomputationsWithDataProtectionClass_shouldDefer_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerDuePrecomputationsWithDataProtectionClass:shouldDefer:completionHandler:");
}

id objc_msgSend_triggerImmediateRavioliFetchWithBagID_notificationId_completion_(void *a1, const char *a2, ...)
{
  return [a1 triggerImmediateRavioliFetchWithBagID:notificationId:completion:];
}

id objc_msgSend_triggerPrecomputationWithWorkflowID_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 triggerPrecomputationWithWorkflowID:completionHandler:];
}

id objc_msgSend_triggerPregenerationWithWorkflowID_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerPregenerationWithWorkflowID:completionHandler:")];
}

id objc_msgSend_tuV7J33gT8DSDOWz_forDFVersion_(void *a1, const char *a2, ...)
{
  return [a1 tuV7J33gT8DSDOWz:forDFVersion:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:")
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClasses:fromData:error:];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return _[a1 unregister];
}

id objc_msgSend_unregisterEventListener_(void *a1, const char *a2, ...)
{
  return [a1 unregisterEventListener:];
}

id objc_msgSend_updateGeoCodeForAddresses_locations_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateGeoCodeForAddresses:locations:error:");
}

id objc_msgSend_updated(void *a1, const char *a2, ...)
{
  return _[a1 updated];
}

id objc_msgSend_updatedAt(void *a1, const char *a2, ...)
{
  return _[a1 updatedAt];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_vWMDLV5jN1a2h2p2_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 vWMDLV5jN1a2h2p2:completionHandler:];
}

id objc_msgSend_val(void *a1, const char *a2, ...)
{
  return _[a1 val];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_vffg4lwI2HftPvpO_(void *a1, const char *a2, ...)
{
  return [a1 vffg4lwI2HftPvpO:];
}

id objc_msgSend_voicePreferred(void *a1, const char *a2, ...)
{
  return _[a1 voicePreferred];
}

id objc_msgSend_wQx5zziHtNxqlbwU_(void *a1, const char *a2, ...)
{
  return [a1 wQx5zziHtNxqlbwU:];
}

id objc_msgSend_waitForNotification(void *a1, const char *a2, ...)
{
  return _[a1 waitForNotification];
}

id objc_msgSend_wgZJLy8f4tn41Pge(void *a1, const char *a2, ...)
{
  return _[a1 wgZJLy8f4tn41Pge];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_workflowID(void *a1, const char *a2, ...)
{
  return _[a1 workflowID];
}

id objc_msgSend_wrongXPCParameterError(void *a1, const char *a2, ...)
{
  return _[a1 wrongXPCParameterError];
}

id objc_msgSend_x7PkBasAKbApbiZS_(void *a1, const char *a2, ...)
{
  return [a1 x7PkBasAKbApbiZS:];
}

id objc_msgSend_xc4PEFTuh2u6xE7M(void *a1, const char *a2, ...)
{
  return _[a1 xc4PEFTuh2u6xE7M];
}

id objc_msgSend_xkNh5bfoCwq3gGYr_(void *a1, const char *a2, ...)
{
  return [a1 xkNh5bfoCwq3gGYr:];
}

id objc_msgSend_xpc(void *a1, const char *a2, ...)
{
  return _[a1 xpc];
}

id objc_msgSend_y6doGzfhnVRCi9Iy(void *a1, const char *a2, ...)
{
  return _[a1 y6doGzfhnVRCi9Iy];
}

id objc_msgSend_y8DihfZYjxGbiiEE_QsX3tfdMvsGwvY0F_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "y8DihfZYjxGbiiEE:QsX3tfdMvsGwvY0F:withCompletion:");
}

id objc_msgSend_yOtBxuHAYKqZrNQN(void *a1, const char *a2, ...)
{
  return _[a1 yOtBxuHAYKqZrNQN];
}

id objc_msgSend_yVPDC4E5nNW5DSMa_UtPlzRffoEpw7Ue1_SFkZRA5Ek9YzhDRs_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [a1 yVPDC4E5nNW5DSMa:UtPlzRffoEpw7Ue1:SFkZRA5Ek9YzhDRs:TWWnmIjkBlMfHmma:];
}

id objc_msgSend_ygKhjfpV8v6SMJkN_(void *a1, const char *a2, ...)
{
  return [a1 ygKhjfpV8v6SMJkN:];
}

id objc_msgSend_yv5QRLoFvJ66jYJS_xNtFS0jGMQPgkTi7_i4KDOQicW9Xd5WBz_TWWnmIjkBlMfHmma_(void *a1, const char *a2, ...)
{
  return [a1 yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:];
}

id objc_msgSend_zGi22DPZsVGfawap_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "zGi22DPZsVGfawap:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:");
}

id objc_msgSend_zKQesNL3BCNYUjZw(void *a1, const char *a2, ...)
{
  return _[a1 zKQesNL3BCNYUjZw];
}

id objc_msgSend_zdkFgT82CObMtwJn_D2AyhLGEbXMCneo6_(void *a1, const char *a2, ...)
{
  return [a1 zdkFgT82CObMtwJn:D2AyhLGEbXMCneo6:];
}

id objc_msgSend_zjSRqCgYhfa1wFgr_gqhuZKS8Xs6ugnFL_wRPFKB7h3xbveJFz_x1IqrF8Flbgd3Jhk_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "zjSRqCgYhfa1wFgr:gqhuZKS8Xs6ugnFL:wRPFKB7h3xbveJFz:x1IqrF8Flbgd3Jhk:");
}

id objc_msgSend_zjSRqCgYhfa1wFgr_nN3snF4sAp0Cxy6t_wRPFKB7h3xbveJFz_tNXuX79TcZPxzyjn_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "zjSRqCgYhfa1wFgr:nN3snF4sAp0Cxy6t:wRPFKB7h3xbveJFz:tNXuX79TcZPxzyjn:");
}