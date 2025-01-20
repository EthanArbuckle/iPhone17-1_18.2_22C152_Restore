_DWORD *bpf_dump(_DWORD *result, int a2)
{
  int v2;
  unsigned __int16 *v3;
  int i;
  char *v5;

  v2 = *result;
  v3 = (unsigned __int16 *)*((void *)result + 1);
  if (a2 < 3)
  {
    if (a2 == 2)
    {
      if (v2 >= 1)
      {
        do
        {
          result = (_DWORD *)printf("{ 0x%x, %d, %d, 0x%08x },\n", *v3, *((unsigned __int8 *)v3 + 2), *((unsigned __int8 *)v3 + 3), *((_DWORD *)v3 + 1));
          v3 += 4;
          --v2;
        }
        while (v2);
      }
    }
    else if (v2 >= 1)
    {
      for (i = 0; i != v2; ++i)
      {
        v5 = bpf_image(v3, i);
        result = (_DWORD *)puts(v5);
        v3 += 4;
      }
    }
  }
  else
  {
    result = (_DWORD *)printf("%d\n", *result);
    if (v2 >= 1)
    {
      do
      {
        result = (_DWORD *)printf("%u %u %u %u\n", *v3, *((unsigned __int8 *)v3 + 2), *((unsigned __int8 *)v3 + 3), *((_DWORD *)v3 + 1));
        v3 += 4;
        --v2;
      }
      while (v2);
    }
  }
  return result;
}

uint64_t pcap_filter_with_aux_data(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  for (uint64_t i = a1 - 8; ; i += 8)
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
LABEL_3:
            while (1)
            {
              uint64_t result = v4;
              uint64_t v8 = i + 8;
              unsigned int v9 = *(unsigned __int16 *)(i + 8);
              if (v9 > 0x43) {
                break;
              }
              switch(*(_WORD *)(i + 8))
              {
                case 0:
                  uint64_t v4 = *(unsigned int *)(i + 12);
                  i += 8;
                  continue;
                case 1:
                  uint64_t v5 = *(unsigned int *)(i + 12);
                  goto LABEL_112;
                case 2:
                  v39[*(unsigned int *)(i + 12)] = v4;
                  goto LABEL_112;
                case 3:
                  v39[*(unsigned int *)(i + 12)] = v5;
                  goto LABEL_112;
                case 4:
                  uint64_t v4 = (*(_DWORD *)(i + 12) + v4);
                  i += 8;
                  continue;
                case 5:
                  uint64_t v15 = *(int *)(i + 12);
                  goto LABEL_100;
                case 6:
                  return *(unsigned int *)(i + 12);
                case 7:
                  i += 8;
                  uint64_t v5 = v4;
                  continue;
                case 0xC:
                  uint64_t v4 = (v5 + v4);
                  i += 8;
                  continue;
                case 0x14:
                  uint64_t v4 = (v4 - *(_DWORD *)(i + 12));
                  i += 8;
                  continue;
                case 0x15:
                  BOOL v16 = v4 == *(_DWORD *)(i + 12);
                  goto LABEL_41;
                case 0x16:
                  return result;
                case 0x1C:
                  uint64_t v4 = (v4 - v5);
                  i += 8;
                  continue;
                case 0x1D:
                  BOOL v16 = v4 == v5;
LABEL_41:
                  uint64_t v17 = 10;
                  if (!v16) {
                    uint64_t v17 = 11;
                  }
                  goto LABEL_99;
                case 0x20:
                  uint64_t v18 = *(unsigned int *)(i + 12);
                  BOOL v19 = a4 >= v18 && a4 - v18 >= 4;
                  if (!v19) {
                    return 0;
                  }
                  unsigned int v20 = *(_DWORD *)(a2 + v18);
                  goto LABEL_110;
                case 0x24:
                  uint64_t v4 = (*(_DWORD *)(i + 12) * v4);
                  i += 8;
                  continue;
                case 0x25:
                  BOOL v21 = v4 > *(_DWORD *)(i + 12);
                  goto LABEL_93;
                case 0x28:
                  uint64_t v22 = *(unsigned int *)(i + 12);
                  if (a4 < v22 || a4 - v22 < 2) {
                    return 0;
                  }
                  unsigned int v24 = *(unsigned __int16 *)(a2 + v22);
                  goto LABEL_70;
                case 0x2C:
                  uint64_t v4 = (v5 * v4);
                  i += 8;
                  continue;
                case 0x2D:
                  BOOL v21 = v4 > v5;
LABEL_93:
                  uint64_t v17 = 10;
                  if (!v21) {
                    uint64_t v17 = 11;
                  }
                  goto LABEL_99;
                case 0x30:
                  uint64_t v25 = *(unsigned int *)(i + 12);
                  if (v25 >= a4) {
                    return 0;
                  }
                  uint64_t v4 = *(unsigned __int8 *)(a2 + v25);
                  i += 8;
                  continue;
                case 0x34:
                  unsigned int v26 = *(_DWORD *)(i + 12);
                  i += 8;
                  uint64_t v4 = v4 / v26;
                  continue;
                case 0x35:
                  BOOL v27 = v4 >= *(_DWORD *)(i + 12);
                  goto LABEL_97;
                case 0x3C:
                  if (!v5) {
                    return 0;
                  }
                  i += 8;
                  uint64_t v4 = v4 / v5;
                  continue;
                case 0x3D:
                  BOOL v27 = v4 >= v5;
LABEL_97:
                  uint64_t v17 = 10;
                  if (!v27) {
                    uint64_t v17 = 11;
                  }
                  goto LABEL_99;
                case 0x40:
                  unsigned int v33 = *(_DWORD *)(i + 12);
                  unsigned int v34 = v33 + v5;
                  unsigned int v35 = a4 - (v33 + v5);
                  BOOL v19 = a4 >= v33;
                  unsigned int v36 = a4 - v33;
                  if (!v19 || v5 > v36 || v35 < 4) {
                    return 0;
                  }
                  unsigned int v20 = *(_DWORD *)(a2 + v34);
LABEL_110:
                  uint64_t v4 = bswap32(v20);
                  uint64_t i = v8;
                  break;
                default:
                  goto LABEL_117;
              }
            }
            if (*(unsigned __int16 *)(i + 8) > 0x73u) {
              break;
            }
            unsigned int v10 = v9 - 68;
            switch(v10)
            {
              case 0u:
                uint64_t v4 = *(_DWORD *)(i + 12) | v4;
                i += 8;
                continue;
              case 1u:
                BOOL v28 = (*(_DWORD *)(i + 12) & v4) == 0;
                goto LABEL_73;
              case 2u:
              case 3u:
              case 5u:
              case 6u:
              case 7u:
              case 0xAu:
              case 0xBu:
              case 0xDu:
              case 0xEu:
              case 0xFu:
                goto LABEL_117;
              case 4u:
                uint64_t result = 0;
                if (a4 < v5) {
                  return result;
                }
                unsigned int v29 = *(_DWORD *)(i + 12);
                if (v29 > a4 - v5) {
                  return result;
                }
                unsigned int v30 = v29 + v5;
                if (a4 - v30 < 2) {
                  return result;
                }
                unsigned int v24 = *(unsigned __int16 *)(a2 + v30);
LABEL_70:
                uint64_t v4 = __rev16(v24);
                i += 8;
                continue;
              case 8u:
                uint64_t v4 = v5 | v4;
                i += 8;
                continue;
              case 9u:
                BOOL v28 = (v5 & v4) == 0;
LABEL_73:
                if (v28) {
                  uint64_t v17 = 11;
                }
                else {
                  uint64_t v17 = 10;
                }
LABEL_99:
                uint64_t v15 = *(unsigned __int8 *)(i + v17);
LABEL_100:
                uint64_t i = v8 + 8 * v15;
                continue;
              case 0xCu:
                unsigned int v31 = *(_DWORD *)(i + 12);
                if (a4 <= v31 || v5 >= a4 - v31) {
                  return 0;
                }
                uint64_t v4 = *(unsigned __int8 *)(a2 + v31 + v5);
                i += 8;
                break;
              case 0x10u:
                uint64_t v4 = *(_DWORD *)(i + 12) & v4;
                i += 8;
                continue;
              default:
                unsigned int v13 = v10 - 92;
                switch(v13)
                {
                  case 0u:
                    uint64_t v4 = v5 & v4;
                    i += 8;
                    continue;
                  case 1u:
                  case 2u:
                  case 3u:
                  case 6u:
                  case 7u:
                    goto LABEL_117;
                  case 4u:
                    uint64_t v4 = v39[*(unsigned int *)(i + 12)];
                    i += 8;
                    continue;
                  case 5u:
                    uint64_t v5 = v39[*(unsigned int *)(i + 12)];
                    goto LABEL_112;
                  case 8u:
                    uint64_t v4 = (v4 << *(_DWORD *)(i + 12));
                    i += 8;
                    continue;
                  default:
                    if (v13 != 108) {
                      goto LABEL_117;
                    }
                    unsigned int v12 = v4 << v5;
                    break;
                }
                goto LABEL_26;
            }
          }
          if (*(unsigned __int16 *)(i + 8) > 0x93u) {
            break;
          }
          i += 8;
          uint64_t v4 = a3;
          unsigned int v11 = v9 - 124;
          switch(v11)
          {
            case 0u:
              unsigned int v12 = result >> v5;
LABEL_26:
              if (v5 >= 0x20) {
                uint64_t v4 = 0;
              }
              else {
                uint64_t v4 = v12;
              }
              uint64_t i = v8;
              goto LABEL_3;
            case 1u:
            case 2u:
            case 3u:
            case 6u:
            case 7u:
            case 9u:
            case 0xAu:
              goto LABEL_117;
            case 4u:
              goto LABEL_3;
            case 5u:
              uint64_t i = v8;
              uint64_t v4 = result;
              uint64_t v5 = a3;
              goto LABEL_3;
            case 8u:
              uint64_t v4 = -(int)result;
              uint64_t i = v8;
              goto LABEL_3;
            case 0xBu:
              uint64_t i = v8;
              uint64_t v4 = v5;
              goto LABEL_3;
            default:
              if (v11 != 116) {
                goto LABEL_117;
              }
              uint64_t v4 = result >> *(_DWORD *)(v8 + 12);
              uint64_t i = v8;
              break;
          }
        }
        if (*(unsigned __int16 *)(i + 8) <= 0xA3u) {
          break;
        }
        switch(v9)
        {
          case 0xA4u:
            uint64_t v4 = *(_DWORD *)(i + 12) ^ v4;
            i += 8;
            break;
          case 0xACu:
            uint64_t v4 = v5 ^ v4;
            i += 8;
            break;
          case 0xB1u:
            uint64_t v14 = *(unsigned int *)(i + 12);
            if (v14 >= a4) {
              return 0;
            }
            uint64_t v5 = 4 * (*(unsigned char *)(a2 + v14) & 0xFu);
LABEL_112:
            i += 8;
            break;
          default:
            goto LABEL_117;
        }
      }
      if (v9 != 148) {
        break;
      }
      uint64_t v4 = v4 % *(_DWORD *)(i + 12);
      i += 8;
    }
    if (v9 != 156) {
LABEL_117:
    }
      abort();
    if (!v5) {
      break;
    }
    uint64_t v4 = v4 % v5;
  }
  return 0;
}

BOOL pcap_validate_filter(uint64_t a1, unsigned int a2)
{
  if ((int)a2 < 1) {
    return 0;
  }
  uint64_t v2 = 0;
  v3 = (_DWORD *)(a1 + 4);
  while (2)
  {
    uint64_t v4 = v3;
    __int16 v5 = *((_WORD *)v3 - 2);
    v3 += 2;
    switch(v5 & 7)
    {
      case 2:
      case 3:
        goto LABEL_6;
      case 4:
        unsigned int v7 = v5 >> 4;
        if (v7 > 0xA || ((1 << v7) & 0x5F7) == 0 && (v5 & 8) == 0 && !*v4) {
          return 0;
        }
        goto LABEL_19;
      case 5:
        int v8 = v5 >> 4;
        if ((v8 - 1) >= 4)
        {
          if (v8 || (int)v2 + *v4 + 1 >= a2) {
            return 0;
          }
        }
        else if (v2 + *((unsigned __int8 *)v4 - 2) + 1 >= a2 {
               || v2 + *((unsigned __int8 *)v4 - 1) + 1 >= a2)
        }
        {
          return 0;
        }
LABEL_19:
        if (a2 != ++v2) {
          continue;
        }
        BOOL result = (*(_WORD *)(a1 + 8 * (a2 - 1)) & 7) == 6;
        break;
      case 6:
      case 7:
        goto LABEL_19;
      default:
        unsigned int v6 = v5 >> 5;
        if (v6 > 5) {
          return 0;
        }
        if (v6 != 3) {
          goto LABEL_19;
        }
LABEL_6:
        if (*v4 > 0xFu) {
          return 0;
        }
        goto LABEL_19;
    }
    return result;
  }
}

char *bpf_image(unsigned __int16 *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unsigned int v3 = *a1;
  if (v3 <= 0x43)
  {
    switch(*a1)
    {
      case 0u:
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "#0x%x";
        goto LABEL_45;
      case 1u:
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "#0x%x";
        goto LABEL_45;
      case 2u:
      case 3u:
        snprintf(__str, 0x40uLL, "M[%d]", *((_DWORD *)a1 + 1));
        break;
      case 4u:
      case 6u:
      case 0x14u:
      case 0x24u:
      case 0x34u:
        goto LABEL_25;
      case 5u:
        snprintf(__str, 0x40uLL, "%d", a2 + *((_DWORD *)a1 + 1) + 1);
        break;
      case 7u:
      case 0xCu:
      case 0x16u:
      case 0x1Cu:
      case 0x1Du:
      case 0x2Cu:
      case 0x2Du:
      case 0x3Cu:
      case 0x3Du:
        goto LABEL_49;
      case 0x15u:
      case 0x25u:
      case 0x35u:
        goto LABEL_6;
      case 0x20u:
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "[%d]";
        goto LABEL_45;
      case 0x28u:
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "[%d]";
        goto LABEL_45;
      case 0x30u:
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "[%d]";
        goto LABEL_45;
      case 0x40u:
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "[x + %d]";
        goto LABEL_45;
      default:
        goto LABEL_48;
    }
    goto LABEL_49;
  }
  if (*a1 <= 0x6Bu)
  {
    switch(*a1)
    {
      case 'D':
      case 'E':
      case 'T':
        goto LABEL_6;
      case 'F':
      case 'G':
      case 'I':
      case 'J':
      case 'K':
      case 'N':
      case 'O':
      case 'Q':
      case 'R':
      case 'S':
        goto LABEL_48;
      case 'H':
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "[x + %d]";
        goto LABEL_45;
      case 'L':
      case 'M':
        goto LABEL_49;
      case 'P':
        uint64_t v7 = *((unsigned int *)a1 + 1);
        uint64_t v4 = "[x + %d]";
LABEL_45:
        snprintf(__str, 0x40uLL, v4, v7);
        break;
      default:
        switch(*a1)
        {
          case '\\':
            goto LABEL_49;
            uint64_t v7 = *((unsigned int *)a1 + 1);
            uint64_t v4 = "M[%d]";
            goto LABEL_45;
          case 'a':
            uint64_t v7 = *((unsigned int *)a1 + 1);
            uint64_t v4 = "M[%d]";
            goto LABEL_45;
          case 'd':
            goto LABEL_25;
          default:
            goto LABEL_48;
        }
    }
    goto LABEL_49;
  }
  if (*a1 <= 0x86u)
  {
    if (*a1 > 0x7Bu)
    {
      if (v3 == 124 || v3 == 128 || v3 == 132) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    if (v3 == 108) {
      goto LABEL_49;
    }
    if (v3 != 116)
    {
LABEL_48:
      snprintf(__str, 0x40uLL, "0x%x", *a1);
      goto LABEL_49;
    }
LABEL_25:
    snprintf(__str, 0x40uLL, "#%d", *((_DWORD *)a1 + 1));
    goto LABEL_49;
  }
  if (*a1 <= 0xA3u)
  {
    if (v3 == 135) {
      goto LABEL_49;
    }
    if (v3 != 148)
    {
      if (v3 == 156) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    goto LABEL_25;
  }
  if (v3 == 164)
  {
LABEL_6:
    snprintf(__str, 0x40uLL, "#0x%x", *((_DWORD *)a1 + 1));
    goto LABEL_49;
  }
  if (v3 != 172)
  {
    if (v3 == 177)
    {
      snprintf(__str, 0x40uLL, "4*([%d]&0xf)", *((_DWORD *)a1 + 1));
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  if ((*a1 & 7) != 5 || (*a1 & 0xF0) == 0) {
    snprintf(bpf_image_image, 0x100uLL, "(%03d) %-8s %s");
  }
  else {
    snprintf(bpf_image_image, 0x100uLL, "(%03d) %-8s %-16s jt %d\tjf %d");
  }
  return bpf_image_image;
}

pcap_etherent *__cdecl pcap_next_etherent(FILE *a1)
{
  uint64_t v2 = (pcap_etherent *)&pcap_next_etherent_e;
  xmmword_26771CE70 = 0u;
  unk_26771CE80 = 0u;
  xmmword_26771CE50 = 0u;
  unk_26771CE60 = 0u;
  xmmword_26771CE30 = 0u;
  unk_26771CE40 = 0u;
  pcap_next_etherent_e = 0u;
  unk_26771CE20 = 0u;
LABEL_2:
  while (1)
  {
    unsigned int v3 = getc(a1);
    if (v3 + 1 > 0x21) {
      break;
    }
    if (((1 << (v3 + 1)) & 0x200004C00) == 0)
    {
      if (v3 == -1) {
        return 0;
      }
      break;
    }
  }
  if (v3 - 48 >= 0xA && (v3 - 65 > 0x25 || ((1 << (v3 - 65)) & 0x3F0000003FLL) == 0))
  {
    while (1)
    {
      int v9 = getc(a1);
      if (v9 == -1) {
        return 0;
      }
      if (v9 == 10) {
        goto LABEL_2;
      }
    }
  }
  for (uint64_t i = 0; i != 6; ++i)
  {
    char v5 = v3 - 48;
    if ((v3 - 48) >= 0xAu)
    {
      if ((v3 - 97) > 5u) {
        char v5 = v3 - 55;
      }
      else {
        char v5 = v3 - 87;
      }
    }
    unsigned int v3 = getc(a1);
    if (v3 == -1) {
      return 0;
    }
    char v6 = v3 - 48;
    if (v3 - 48 < 0xA || v3 - 65 <= 0x25 && ((1 << (v3 - 65)) & 0x3F0000003FLL) != 0)
    {
      if ((v3 - 48) >= 0xAu)
      {
        if ((v3 - 97) > 5u) {
          char v6 = v3 - 55;
        }
        else {
          char v6 = v3 - 87;
        }
      }
      unsigned int v3 = getc(a1);
      if (v3 == -1) {
        return 0;
      }
      char v5 = v6 | (16 * v5);
    }
    *((unsigned char *)&pcap_next_etherent_e + i) = v5;
    if (v3 != 58) {
      break;
    }
    unsigned int v3 = getc(a1);
    if (v3 == -1) {
      return 0;
    }
  }
  if (v3 > 0x20 || ((1 << v3) & 0x100002600) == 0)
  {
    while (1)
    {
      int v8 = getc(a1);
      if (v8 == -1) {
        return 0;
      }
      if (v8 == 10) {
        goto LABEL_2;
      }
    }
  }
  do
  {
    while (1)
    {
      int v7 = getc(a1);
      if (v7 > 12) {
        break;
      }
      if (v7 != 9)
      {
        if (v7 == -1) {
          return 0;
        }
        if (v7 != 10) {
          goto LABEL_46;
        }
        goto LABEL_2;
      }
    }
  }
  while (v7 == 13 || v7 == 32);
  if (v7 == 35)
  {
    while (1)
    {
      int v10 = getc(a1);
      if (v10 == -1) {
        return 0;
      }
      if (v10 == 10) {
        goto LABEL_2;
      }
    }
  }
LABEL_46:
  uint64_t v11 = 0;
  while (2)
  {
    *((unsigned char *)&pcap_next_etherent_e + v11 + 6) = v7;
    int v7 = getc(a1);
    if ((v7 + 1) > 0x21)
    {
LABEL_50:
      if (++v11 == 121)
      {
        unk_26771CE8F = 0;
        goto LABEL_55;
      }
      continue;
    }
    break;
  }
  if (((1 << (v7 + 1)) & 0x200004C00) == 0)
  {
    if (v7 == -1) {
      return 0;
    }
    goto LABEL_50;
  }
  *((unsigned char *)&pcap_next_etherent_e + v11 + 7) = 0;
  if (v7 == 10) {
    return v2;
  }
  do
LABEL_55:
    int v13 = getc(a1);
  while (v13 != 10 && v13 != -1);
  return (pcap_etherent *)&pcap_next_etherent_e;
}

uint64_t pcap_findalldevs_interfaces(uint64_t *a1, char *a2, unsigned int (*a3)(char *), unsigned int (*a4)(char *, int *, char *))
{
  uint64_t v25 = 0;
  if (getifaddrs(&v25))
  {
    int v8 = __error();
    pcap_fmt_errmsg_for_errno(a2, 0x100uLL, *v8, "getifaddrs");
    return 0xFFFFFFFFLL;
  }
  int v10 = v25;
  if (!v25)
  {
    v23 = 0;
    uint64_t v9 = 0;
    goto LABEL_28;
  }
  while (1)
  {
    ifa_name = v10->ifa_name;
    unsigned int v12 = strchr(ifa_name, 58);
    if (v12)
    {
      uint64_t v13 = 1;
      do
        int v14 = v12[v13++];
      while ((v14 - 48) < 0xA);
      if (!v14)
      {
        *unsigned int v12 = 0;
        ifa_name = v10->ifa_name;
      }
    }
    if (!a3(ifa_name)) {
      goto LABEL_23;
    }
    ifa_addr = v10->ifa_addr;
    if (ifa_addr)
    {
      size_t sa_len = ifa_addr->sa_len;
      ifa_netmask = v10->ifa_netmask;
    }
    else
    {
      ifa_netmask = 0;
      size_t sa_len = 0;
    }
    unsigned int ifa_flags = v10->ifa_flags;
    if ((ifa_flags & 2) != 0)
    {
      ifa_dstaddr = v10->ifa_dstaddr;
      if (ifa_dstaddr)
      {
        size_t v20 = ifa_dstaddr->sa_len;
        if ((ifa_flags & 0x10) == 0) {
          goto LABEL_20;
        }
        goto LABEL_17;
      }
    }
    else
    {
      ifa_dstaddr = 0;
    }
    size_t v20 = 0;
    if ((ifa_flags & 0x10) == 0)
    {
LABEL_20:
      BOOL v21 = 0;
      goto LABEL_21;
    }
LABEL_17:
    BOOL v21 = v10->ifa_dstaddr;
    if (v21)
    {
      size_t v22 = v21->sa_len;
      goto LABEL_22;
    }
LABEL_21:
    size_t v22 = 0;
LABEL_22:
    if ((add_addr_to_if (a1, v10->ifa_name, ifa_flags, a4, ifa_addr, sa_len, ifa_netmask, sa_len, ifa_dstaddr, v20, v21, v22, a2) & 0x80000000) != 0)break; {
LABEL_23:
    }
    int v10 = v10->ifa_next;
    if (!v10)
    {
      uint64_t v9 = 0;
      goto LABEL_27;
    }
  }
  uint64_t v9 = 0xFFFFFFFFLL;
LABEL_27:
  v23 = v25;
LABEL_28:
  MEMORY[0x210560750](v23);
  return v9;
}

uint64_t pcap_fmt_errmsg_for_errno(char *a1, size_t a2, int a3, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(a1, a2, __format, va);
  uint64_t result = strlen(a1);
  if (result + 3 <= a2)
  {
    strcpy(&a1[result], ": ");
    int v8 = &a1[result + 2];
    size_t v9 = a2 - result - 2;
    uint64_t result = strerror_r(a3, v8, v9);
    if (result == 22)
    {
      return snprintf(v8, v9, "Unknown error: %d");
    }
    else if (result == 34)
    {
      return snprintf(v8, v9, "Message for error %d is too long");
    }
  }
  return result;
}

uint64_t bpf_set_error(uint64_t result, char *__format, ...)
{
  va_start(va, __format);
  if (!*(_DWORD *)(result + 200))
  {
    uint64_t v2 = result;
    uint64_t result = vsnprintf((char *)(*(void *)(result + 192) + 208), 0x100uLL, __format, va);
    *(_DWORD *)(v2 + 200) = 1;
  }
  return result;
}

char *sdup(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s) + 1;
  char v5 = (char *)newchunk_nolongjmp(a1, v4);
  char v6 = v5;
  if (v5) {
    strlcpy(v5, __s, v4);
  }
  return v6;
}

size_t newchunk_nolongjmp(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v3 = *(int *)(a1 + 728);
  size_t v4 = (size_t *)(a1 + 16 * v3 + 472);
  size_t v5 = *v4;
  if (v2 <= *v4
    || (*(_DWORD *)(a1 + 728) = v3 + 1, (int)v3 < 15)
    && (size_t v5 = (1024 << (v3 + 1)), v7 = malloc_type_malloc(v5, 0x4C56FACBuLL), (v4[3] = (size_t)v7) != 0)
    && (bzero(v7, v5), v4[2] = v5, v4 += 2, v2 <= v5))
  {
    *size_t v4 = v5 - v2;
    return v4[1] + v5 - v2;
  }
  else
  {
    bpf_set_error(a1, "out of memory");
    return 0;
  }
}

int pcap_compile(pcap_t *a1, bpf_program *a2, const char *a3, int a4, bpf_u_int32 a5)
{
  unsigned int v34 = a3;
  unsigned int v33 = 0;
  v32 = 0;
  if (!*((_DWORD *)a1 + 28))
  {
    strcpy((char *)a1 + 208, "not-yet-activated pcap_t passed to pcap_compile");
    return -1;
  }
  int v48 = 0;
  memset(v42, 0, sizeof(v42));
  long long v39 = 0u;
  uint64_t v40 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  memset(v35, 0, sizeof(v35));
  u_int v31 = 0;
  memset(v49, 0, sizeof(v49));
  int v50 = 0;
  *(void *)&long long v37 = 0;
  v41 = 0;
  v42[0] = 0;
  *(void *)&long long v36 = a1;
  DWORD2(v37) = 0;
  DWORD2(v36) = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  int v47 = 0;
  *(void *)&long long v39 = a5;
  LODWORD(v38) = pcap_snapshot(a1);
  if (!v38)
  {
    strcpy((char *)a1 + 208, "snaplen of 0 rejects all packets");
    goto LABEL_7;
  }
  if (pcap_lex_init((uint64_t *)&v33))
  {
    int v8 = __error();
    pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x100uLL, *v8, "can't initialize scanner");
    goto LABEL_7;
  }
  if (v34) {
    uint64_t v13 = (char *)v34;
  }
  else {
    uint64_t v13 = (char *)&unk_20D914A28;
  }
  v32 = pcap__scan_string(v13, (uint64_t)v33);
  pcap_set_extra((uint64_t)v35, v33);
  LODWORD(v40) = *((_DWORD *)a1 + 18);
  int v14 = pcap_datalink(a1);
  DWORD2(v38) = v14;
  DWORD1(v38) = v14;
  *(_OWORD *)&v42[1] = xmmword_20D914960;
  *(_OWORD *)&v42[3] = xmmword_20D914950;
  *(_OWORD *)&v42[5] = xmmword_20D914970;
  *(_OWORD *)&v42[7] = xmmword_20D914960;
  *(_OWORD *)&v42[9] = xmmword_20D914980;
  memset(&v42[11], 255, 32);
  *((void *)&v39 + 1) = 0;
  HIDWORD(v38) = v14;
  if (v14 > 98)
  {
    switch(v14)
    {
      case 99:
        HIDWORD(v42[7]) = 6;
        int v21 = 44;
        goto LABEL_82;
      case 100:
      case 101:
      case 102:
      case 103:
      case 106:
      case 110:
      case 111:
      case 112:
      case 115:
      case 116:
      case 118:
      case 120:
      case 121:
      case 124:
      case 125:
      case 126:
      case 128:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 193:
      case 195:
      case 196:
      case 198:
      case 199:
      case 201:
        goto LABEL_41;
      case 104:
      case 166:
        goto LABEL_36;
      case 105:
        goto LABEL_32;
      case 107:
      case 114:
        goto LABEL_30;
      case 108:
        goto LABEL_81;
      case 109:
        int v21 = 12;
        goto LABEL_82;
      case 113:
        int v22 = 14;
        goto LABEL_72;
      case 117:
        int v21 = 64;
        goto LABEL_82;
      case 119:
      case 127:
      case 163:
        LODWORD(v42[1]) = 1;
LABEL_32:
        HIDWORD(v42[7]) = 24;
        *(void **)((char *)&v42[5] + 4) = (void *)1;
        goto LABEL_75;
      case 122:
        int v23 = 16;
        goto LABEL_74;
      case 123:
        HIDWORD(v42[8]) = 1;
        v42[10] = (void *)0x200000001;
        LODWORD(v42[11]) = 0;
        int v23 = 4;
        HIDWORD(v42[14]) = 4;
        goto LABEL_74;
      case 129:
        int v19 = 4;
        goto LABEL_50;
      case 130:
      case 131:
      case 134:
      case 179:
      case 180:
      case 181:
        int v15 = 4;
        goto LABEL_24;
      case 132:
        int v18 = 6;
        goto LABEL_55;
      case 133:
        HIDWORD(v42[7]) = 6;
        int v15 = 12;
        goto LABEL_25;
      case 135:
        int v24 = 8;
        goto LABEL_57;
      case 136:
        int v18 = 12;
        goto LABEL_55;
      case 137:
        int v24 = 4;
LABEL_57:
        HIDWORD(v42[7]) = v24;
        LODWORD(v42[6]) = v24;
        unint64_t v16 = 0xA00000000;
        goto LABEL_84;
      case 138:
        HIDWORD(v42[7]) = 16;
        int v21 = 18;
        goto LABEL_82;
      case 139:
        *(_OWORD *)((char *)&v42[11] + 4) = xmmword_20D9149A0;
        uint64_t v25 = 0xB00000008;
        goto LABEL_66;
      case 140:
        *(_OWORD *)((char *)&v42[11] + 4) = xmmword_20D9149B0;
        uint64_t v25 = 0x700000004;
        goto LABEL_66;
      case 164:
        int v15 = 12;
LABEL_24:
        HIDWORD(v42[7]) = v15;
        goto LABEL_25;
      case 165:
      case 202:
        goto LABEL_67;
      case 167:
      case 178:
        LODWORD(v42[6]) = 14;
        HIDWORD(v42[7]) = 16;
        unint64_t v16 = 0x1500000012;
        goto LABEL_84;
      case 168:
        HIDWORD(v42[7]) = 4;
        int v15 = 6;
LABEL_25:
        LODWORD(v42[6]) = v15;
        unint64_t v16 = 0xFFFFFFFF00000000;
        goto LABEL_84;
      case 182:
        HIDWORD(v42[7]) = -1;
        LODWORD(v42[6]) = 0;
        unint64_t v16 = 4;
        goto LABEL_84;
      case 183:
      case 200:
        int v18 = 18;
        goto LABEL_55;
      case 192:
        HIDWORD(v42[7]) = 24;
        *(void **)((char *)&v42[5] + 4) = (void *)1;
        LODWORD(v42[1]) = 1;
        goto LABEL_75;
      case 194:
LABEL_29:
        int v18 = 8;
LABEL_55:
        HIDWORD(v42[7]) = v18;
        goto LABEL_68;
      case 197:
        *(_OWORD *)((char *)&v42[11] + 4) = xmmword_20D914990;
        uint64_t v25 = 0x1B00000018;
LABEL_66:
        *(void **)((char *)&v42[13] + 4) = (void *)v25;
        goto LABEL_67;
      default:
        switch(v14)
        {
          case 226:
            HIDWORD(v42[7]) = 1;
            int v15 = 24;
            goto LABEL_25;
          case 227:
          case 230:
          case 231:
          case 235:
          case 236:
          case 237:
          case 239:
            goto LABEL_41;
          case 228:
          case 229:
            goto LABEL_30;
          case 232:
          case 233:
          case 234:
          case 238:
            goto LABEL_29;
          case 240:
            HIDWORD(v42[1]) = 4;
            HIDWORD(v42[7]) = 16;
            int v17 = 18;
            goto LABEL_104;
          case 241:
            HIDWORD(v42[1]) = 12;
            HIDWORD(v42[7]) = 24;
            int v17 = 26;
            goto LABEL_104;
          default:
            if (v14 != 276) {
              goto LABEL_41;
            }
            int v21 = 20;
            break;
        }
        goto LABEL_82;
    }
  }
  unint64_t v16 = 0x300000008;
  switch(v14)
  {
    case 0:
      goto LABEL_81;
    case 1:
      HIDWORD(v42[7]) = 12;
      int v17 = 14;
LABEL_104:
      LODWORD(v42[6]) = v17;
      unint64_t v16 = 0x300000000;
      goto LABEL_84;
    case 2:
    case 3:
    case 4:
    case 5:
    case 13:
    case 14:
    case 17:
      goto LABEL_41;
    case 6:
      int v23 = 14;
      goto LABEL_74;
    case 7:
      HIDWORD(v42[7]) = 2;
      int v21 = 6;
      goto LABEL_82;
    case 8:
      int v22 = -1;
LABEL_72:
      HIDWORD(v42[7]) = v22;
      int v21 = 16;
      goto LABEL_82;
    case 9:
      goto LABEL_36;
    case 10:
      int v23 = v40 + 13;
LABEL_74:
      HIDWORD(v42[7]) = v23;
      LODWORD(v42[6]) = v23;
LABEL_75:
      unint64_t v16 = 0x300000008;
      goto LABEL_84;
    case 11:
    case 19:
      goto LABEL_84;
    case 12:
LABEL_30:
      HIDWORD(v42[7]) = -1;
      LODWORD(v42[6]) = 0;
      goto LABEL_83;
    case 15:
      int v26 = -1;
      goto LABEL_78;
    case 16:
      int v26 = 5;
LABEL_78:
      HIDWORD(v42[7]) = v26;
      int v21 = 24;
      goto LABEL_82;
    case 18:
      int v20 = -1;
      goto LABEL_80;
    default:
      if (v14 == 50)
      {
LABEL_36:
        int v20 = 2;
LABEL_80:
        HIDWORD(v42[7]) = v20;
LABEL_81:
        int v21 = 4;
        goto LABEL_82;
      }
      if (v14 == 51)
      {
        int v19 = 6;
LABEL_50:
        HIDWORD(v42[7]) = v19;
        int v21 = 8;
LABEL_82:
        LODWORD(v42[6]) = v21;
LABEL_83:
        unint64_t v16 = 0;
        goto LABEL_84;
      }
LABEL_41:
      if ((v14 - 104) > 0xB9)
      {
        bpf_set_error((uint64_t)v35, "unknown data link type %d", v14);
        goto LABEL_7;
      }
LABEL_67:
      HIDWORD(v42[7]) = -1;
LABEL_68:
      LODWORD(v42[6]) = -1;
      unint64_t v16 = -1;
LABEL_84:
      v42[15] = (void *)v16;
      *(void **)((char *)&v42[2] + 4) = v42[1];
      HIDWORD(v42[3]) = v42[2];
      v42[4] = v42[1];
      LODWORD(v42[5]) = v42[2];
      if (pcap_parse())
      {
        if (v41) {
          freeaddrinfo(v41);
        }
        if (v42[0]) {
          free(v42[0]);
        }
        goto LABEL_7;
      }
      uint64_t v27 = v37;
      if (!(void)v37)
      {
        if (setjmp(v35)) {
          goto LABEL_7;
        }
        int v29 = v38;
        size_t v30 = newchunk(v35, 288);
        *(_DWORD *)(v30 + 16) = 6;
        *(void *)(v30 + 152) = v30;
        *(_DWORD *)(v30 + 40) = v29;
        *(void *)&long long v37 = v30;
        uint64_t v27 = v30;
      }
      if (a4 && !DWORD1(v39))
      {
        if (bpf_optimize((uint64_t)&v37, (uint64_t)a1 + 208) == -1) {
          goto LABEL_7;
        }
        uint64_t v27 = v37;
        if (!(void)v37 || *(_DWORD *)(v37 + 16) == 6 && !*(_DWORD *)(v37 + 40))
        {
          strcpy((char *)a1 + 208, "expression rejects all packets");
          goto LABEL_7;
        }
      }
      BOOL v28 = icode_to_fcode((uint64_t)&v37, v27, &v31, (char *)a1 + 208);
      a2->bf_insns = (bpf_insn *)v28;
      if (v28)
      {
        a2->bf_len = v31;
        int v10 = 0;
        goto LABEL_8;
      }
LABEL_7:
      int v10 = -1;
LABEL_8:
      if (v32) {
        pcap__delete_buffer((void **)v32, (uint64_t)v33);
      }
      if (v33) {
        pcap_lex_destroy((uint64_t)v33);
      }
      for (uint64_t i = 0; i != 256; i += 16)
      {
        unsigned int v12 = *(void **)&v49[i + 8];
        if (v12) {
          free(v12);
        }
      }
      return v10;
  }
}

int pcap_compile_nopcap(int a1, int a2, bpf_program *a3, const char *a4, int a5, bpf_u_int32 a6)
{
  int v10 = pcap_open_dead(a2, a1);
  if (!v10) {
    return -1;
  }
  uint64_t v11 = v10;
  int v12 = pcap_compile(v10, a3, a4, a5, a6);
  pcap_close(v11);
  return v12;
}

void pcap_freecode(bpf_program *a1)
{
  a1->bf_len = 0;
  bf_insns = a1->bf_insns;
  if (bf_insns)
  {
    free(bf_insns);
    a1->bf_insns = 0;
  }
}

uint64_t finish_parse(uint64_t a1, uint64_t a2)
{
  if (setjmp((int *)a1)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = *(void *)(a2 + 152);
  if (*(_DWORD *)(a1 + 324) != -1 && *(_DWORD *)(a1 + 280) && *(_DWORD *)(a1 + 288) == -1) {
    *(_DWORD *)(a1 + 288) = alloc_reg(a1);
  }
  char v6 = 0;
  int v7 = *(_DWORD *)(a1 + 236);
  int v8 = v7;
  if (v7 > 162)
  {
    if (v7 == 163)
    {
      if (*(_DWORD *)(a1 + 288) != -1)
      {
        v68 = (_DWORD *)newchunk((int *)a1, 40);
        _DWORD *v68 = 32;
        v68[6] = 4;
        int v10 = v68;
        v69 = (_DWORD *)newchunk((int *)a1, 40);
        _DWORD *v69 = 2;
        v69[6] = *(_DWORD *)(a1 + 288);
        v70 = v10;
        do
        {
          v71 = v70;
          v70 = (_DWORD *)*((void *)v70 + 4);
        }
        while (v70);
        *((void *)v71 + 4) = v69;
        int v26 = (_DWORD *)newchunk((int *)a1, 40);
        *int v26 = 7;
        v72 = v10;
        do
        {
          BOOL v28 = v72;
          v72 = (_DWORD *)*((void *)v72 + 4);
        }
        while (v72);
        goto LABEL_61;
      }
    }
    else
    {
      if (v7 != 192) {
        goto LABEL_62;
      }
      if (*(_DWORD *)(a1 + 288) != -1)
      {
        int v29 = (_DWORD *)newchunk((int *)a1, 40);
        *int v29 = 48;
        v29[6] = 3;
        int v10 = v29;
        size_t v30 = (_DWORD *)newchunk((int *)a1, 40);
        *size_t v30 = 100;
        u_int v31 = v10;
        do
        {
          v32 = v31;
          u_int v31 = (_DWORD *)*((void *)v31 + 4);
        }
        while (v31);
        *((void *)v32 + 4) = v30;
        v30[6] = 8;
        unsigned int v33 = (_DWORD *)newchunk((int *)a1, 40);
        *unsigned int v33 = 7;
        unsigned int v34 = v10;
        do
        {
          jmp_buf v35 = v34;
          unsigned int v34 = (_DWORD *)*((void *)v34 + 4);
        }
        while (v34);
        *((void *)v35 + 4) = v33;
        long long v36 = (_DWORD *)newchunk((int *)a1, 40);
        *long long v36 = 48;
        long long v37 = v10;
        do
        {
          long long v38 = v37;
          long long v37 = (_DWORD *)*((void *)v37 + 4);
        }
        while (v37);
        *((void *)v38 + 4) = v36;
        v36[6] = 2;
        long long v39 = (_DWORD *)newchunk((int *)a1, 40);
        *long long v39 = 76;
        uint64_t v40 = v10;
        do
        {
          v41 = v40;
          uint64_t v40 = (_DWORD *)*((void *)v40 + 4);
        }
        while (v40);
        *((void *)v41 + 4) = v39;
        v42 = (_DWORD *)newchunk((int *)a1, 40);
        _DWORD *v42 = 2;
        v42[6] = *(_DWORD *)(a1 + 288);
        long long v43 = v10;
        do
        {
          long long v44 = v43;
          long long v43 = (_DWORD *)*((void *)v43 + 4);
        }
        while (v43);
        *((void *)v44 + 4) = v42;
        int v26 = (_DWORD *)newchunk((int *)a1, 40);
        *int v26 = 7;
        long long v45 = v10;
        do
        {
          BOOL v28 = v45;
          long long v45 = (_DWORD *)*((void *)v45 + 4);
        }
        while (v45);
        goto LABEL_61;
      }
    }
    goto LABEL_69;
  }
  if (v7 == 119)
  {
    *(_DWORD *)(a1 + 244) = 1;
    if (*(_DWORD *)(a1 + 288) != -1)
    {
      long long v46 = (_DWORD *)newchunk((int *)a1, 40);
      *long long v46 = 32;
      v46[6] = 0;
      int v10 = v46;
      int v47 = (_DWORD *)newchunk((int *)a1, 40);
      *int v47 = 84;
      v47[6] = -4096;
      int v48 = v10;
      do
      {
        v49 = v48;
        int v48 = (_DWORD *)*((void *)v48 + 4);
      }
      while (v48);
      *((void *)v49 + 4) = v47;
      int v50 = (_DWORD *)newchunk((int *)a1, 40);
      *int v50 = 21;
      v50[6] = -2145316864;
      v51 = v50;
      v52 = v10;
      do
      {
        v53 = v52;
        v52 = (_DWORD *)*((void *)v52 + 4);
      }
      while (v52);
      *((void *)v53 + 4) = v50;
      v54 = (_DWORD *)newchunk((int *)a1, 40);
      _DWORD *v54 = 32;
      v54[6] = 4;
      v55 = v10;
      do
      {
        v56 = v55;
        v55 = (_DWORD *)*((void *)v55 + 4);
      }
      while (v55);
      *((void *)v56 + 4) = v54;
      *((void *)v51 + 1) = v54;
      v57 = (_DWORD *)newchunk((int *)a1, 40);
      _DWORD *v57 = 5;
      v57[6] = 1;
      v58 = v57;
      v59 = v10;
      do
      {
        v60 = v59;
        v59 = (_DWORD *)*((void *)v59 + 4);
      }
      while (v59);
      *((void *)v60 + 4) = v57;
      v61 = (_DWORD *)newchunk((int *)a1, 40);
      _DWORD *v61 = 0;
      v61[6] = 144;
      v62 = v10;
      do
      {
        v63 = v62;
        v62 = (_DWORD *)*((void *)v62 + 4);
      }
      while (v62);
      *((void *)v63 + 4) = v61;
      *((void *)v51 + 2) = v61;
      v64 = (_DWORD *)newchunk((int *)a1, 40);
      _DWORD *v64 = 2;
      v64[6] = *(_DWORD *)(a1 + 288);
      v65 = v10;
      do
      {
        v66 = v65;
        v65 = (_DWORD *)*((void *)v65 + 4);
      }
      while (v65);
      *((void *)v66 + 4) = v64;
      *((void *)v58 + 2) = v64;
      int v26 = (_DWORD *)newchunk((int *)a1, 40);
      *int v26 = 7;
      v67 = v10;
      do
      {
        BOOL v28 = v67;
        v67 = (_DWORD *)*((void *)v67 + 4);
      }
      while (v67);
      goto LABEL_61;
    }
LABEL_69:
    if (*(_DWORD *)(a1 + 324) == -1) {
      goto LABEL_122;
    }
    uint64_t v77 = *(void *)(v5 + 8);
    *(_DWORD *)(a1 + 244) = 1;
LABEL_71:
    uint64_t v76 = v77;
    v79 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v79 = 1;
    v79[6] = *(_DWORD *)(a1 + 308);
    v78 = v79;
    goto LABEL_72;
  }
  if (v7 != 127) {
    goto LABEL_62;
  }
  if (*(_DWORD *)(a1 + 288) == -1) {
    goto LABEL_69;
  }
  size_t v9 = (_DWORD *)newchunk((int *)a1, 40);
  *size_t v9 = 48;
  v9[6] = 3;
  int v10 = v9;
  uint64_t v11 = (_DWORD *)newchunk((int *)a1, 40);
  *uint64_t v11 = 100;
  int v12 = v10;
  do
  {
    uint64_t v13 = v12;
    int v12 = (_DWORD *)*((void *)v12 + 4);
  }
  while (v12);
  *((void *)v13 + 4) = v11;
  v11[6] = 8;
  int v14 = (_DWORD *)newchunk((int *)a1, 40);
  *int v14 = 7;
  int v15 = v10;
  do
  {
    unint64_t v16 = v15;
    int v15 = (_DWORD *)*((void *)v15 + 4);
  }
  while (v15);
  *((void *)v16 + 4) = v14;
  int v17 = (_DWORD *)newchunk((int *)a1, 40);
  *int v17 = 48;
  int v18 = v10;
  do
  {
    int v19 = v18;
    int v18 = (_DWORD *)*((void *)v18 + 4);
  }
  while (v18);
  *((void *)v19 + 4) = v17;
  v17[6] = 2;
  int v20 = (_DWORD *)newchunk((int *)a1, 40);
  *int v20 = 76;
  int v21 = v10;
  do
  {
    int v22 = v21;
    int v21 = (_DWORD *)*((void *)v21 + 4);
  }
  while (v21);
  *((void *)v22 + 4) = v20;
  int v23 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v23 = 2;
  v23[6] = *(_DWORD *)(a1 + 288);
  int v24 = v10;
  do
  {
    uint64_t v25 = v24;
    int v24 = (_DWORD *)*((void *)v24 + 4);
  }
  while (v24);
  *((void *)v25 + 4) = v23;
  int v26 = (_DWORD *)newchunk((int *)a1, 40);
  *int v26 = 7;
  uint64_t v27 = v10;
  do
  {
    BOOL v28 = v27;
    uint64_t v27 = (_DWORD *)*((void *)v27 + 4);
  }
  while (v27);
LABEL_61:
  *((void *)v28 + 4) = v26;
  int v8 = *(_DWORD *)(a1 + 236);
  char v6 = v10;
LABEL_62:
  v73 = v6;
  BOOL v74 = (v8 - 105) > 0x3A || ((1 << (v8 - 105)) & 0x400000000404001) == 0;
  if (v74 && v8 != 192 || *(_DWORD *)(a1 + 324) == -1)
  {
    v78 = v6;
    goto LABEL_121;
  }
  uint64_t v75 = *(void *)(v5 + 8);
  *(_DWORD *)(a1 + 244) = 1;
  uint64_t v76 = v75;
  uint64_t v77 = v75;
  v78 = v73;
  if (!v73) {
    goto LABEL_71;
  }
LABEL_72:
  v80 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v80 = 135;
  v81 = v78;
  do
  {
    v82 = v81;
    v81 = (_DWORD *)*((void *)v81 + 4);
  }
  while (v81);
  *((void *)v82 + 4) = v80;
  v83 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v83 = 4;
  v83[6] = 24;
  v84 = v78;
  do
  {
    v85 = v84;
    v84 = (_DWORD *)*((void *)v84 + 4);
  }
  while (v84);
  *((void *)v85 + 4) = v83;
  v86 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v86 = 2;
  v86[6] = *(_DWORD *)(a1 + 324);
  v87 = v78;
  do
  {
    v88 = v87;
    v87 = (_DWORD *)*((void *)v87 + 4);
  }
  while (v87);
  *((void *)v88 + 4) = v86;
  v89 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v89 = 80;
  v89[6] = 0;
  v90 = v78;
  do
  {
    v91 = v90;
    v90 = (_DWORD *)*((void *)v90 + 4);
  }
  while (v90);
  *((void *)v91 + 4) = v89;
  v92 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v92 = 69;
  v92[6] = 8;
  v93 = v92;
  v94 = v78;
  do
  {
    v95 = v94;
    v94 = (_DWORD *)*((void *)v94 + 4);
  }
  while (v94);
  *((void *)v95 + 4) = v92;
  size_t v96 = newchunk((int *)a1, 40);
  *(_DWORD *)size_t v96 = 69;
  *((void *)v93 + 1) = v96;
  *(_DWORD *)(v96 + 24) = 4;
  size_t v97 = v96;
  v98 = v78;
  do
  {
    v99 = v98;
    v98 = (_DWORD *)*((void *)v98 + 4);
  }
  while (v98);
  *((void *)v99 + 4) = v96;
  *((void *)v93 + 2) = v76;
  *(void *)(v96 + 8) = v76;
  v100 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v100 = 69;
  *(void *)(v97 + 16) = v100;
  v100[6] = 128;
  v101 = v100;
  v102 = v78;
  do
  {
    v103 = v102;
    v102 = (_DWORD *)*((void *)v102 + 4);
  }
  while (v102);
  *((void *)v103 + 4) = v100;
  v104 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v104 = 96;
  *((void *)v101 + 1) = v104;
  v104[6] = *(_DWORD *)(a1 + 324);
  v105 = v78;
  do
  {
    v106 = v105;
    v105 = (_DWORD *)*((void *)v105 + 4);
  }
  while (v105);
  *((void *)v106 + 4) = v104;
  v107 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v107 = 4;
  v107[6] = 2;
  v108 = v78;
  do
  {
    v109 = v108;
    v108 = (_DWORD *)*((void *)v108 + 4);
  }
  while (v108);
  *((void *)v109 + 4) = v107;
  v110 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v110 = 2;
  v110[6] = *(_DWORD *)(a1 + 324);
  v111 = v78;
  do
  {
    v112 = v111;
    v111 = (_DWORD *)*((void *)v111 + 4);
  }
  while (v111);
  *((void *)v112 + 4) = v110;
  if (*(_DWORD *)(a1 + 228) == 127)
  {
    v113 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v113 = 32;
    *((void *)v101 + 2) = v113;
    v113[6] = 4;
    v114 = v78;
    do
    {
      v115 = v114;
      v114 = (_DWORD *)*((void *)v114 + 4);
    }
    while (v114);
    *((void *)v115 + 4) = v113;
    size_t v116 = newchunk((int *)a1, 40);
    *(_DWORD *)size_t v116 = 69;
    *(_DWORD *)(v116 + 24) = 0x2000000;
    size_t v117 = v116;
    v118 = v78;
    do
    {
      v119 = v118;
      v118 = (_DWORD *)*((void *)v118 + 4);
    }
    while (v118);
    *((void *)v119 + 4) = v116;
    *(void *)(v116 + 16) = v76;
    size_t v120 = newchunk((int *)a1, 40);
    *(_DWORD *)size_t v120 = 69;
    *(_DWORD *)(v120 + 24) = 128;
    size_t v121 = v120;
    v122 = v78;
    do
    {
      v123 = v122;
      v122 = (_DWORD *)*((void *)v122 + 4);
    }
    while (v122);
    *((void *)v123 + 4) = v120;
    *(void *)(v117 + 8) = v120;
    *(void *)(v120 + 8) = v76;
    v124 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v124 = 69;
    v124[6] = 0x1000000;
    v125 = v124;
    v126 = v78;
    do
    {
      v127 = v126;
      v126 = (_DWORD *)*((void *)v126 + 4);
    }
    while (v126);
    *((void *)v127 + 4) = v124;
    *(void *)(v121 + 16) = v124;
    v128 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v128 = 48;
    v128[6] = 16;
    v129 = v78;
    do
    {
      v130 = v129;
      v129 = (_DWORD *)*((void *)v129 + 4);
    }
    while (v129);
    *((void *)v130 + 4) = v128;
    *((void *)v125 + 1) = v128;
    v131 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v131 = 69;
    v131[6] = 32;
    v132 = v131;
    v133 = v78;
    do
    {
      v134 = v133;
      v133 = (_DWORD *)*((void *)v133 + 4);
    }
    while (v133);
    *((void *)v134 + 4) = v131;
    v135 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v135 = 48;
    v135[6] = 8;
    v136 = v78;
    do
    {
      v137 = v136;
      v136 = (_DWORD *)*((void *)v136 + 4);
    }
    while (v136);
    *((void *)v137 + 4) = v135;
    *((void *)v125 + 2) = v135;
    v138 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v138 = 69;
    v138[6] = 32;
    v139 = v138;
    v140 = v78;
    do
    {
      v141 = v140;
      v140 = (_DWORD *)*((void *)v140 + 4);
    }
    while (v140);
    *((void *)v141 + 4) = v138;
    v142 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v142 = 96;
    v142[6] = *(_DWORD *)(a1 + 324);
    v143 = v142;
    v144 = v78;
    do
    {
      v145 = v144;
      v144 = (_DWORD *)*((void *)v144 + 4);
    }
    while (v144);
    *((void *)v145 + 4) = v142;
    v146 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v146 = 4;
    v146[6] = 3;
    v147 = v78;
    do
    {
      v148 = v147;
      v147 = (_DWORD *)*((void *)v147 + 4);
    }
    while (v147);
    *((void *)v148 + 4) = v146;
    v149 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v149 = 84;
    v149[6] = -4;
    v150 = v78;
    do
    {
      v151 = v150;
      v150 = (_DWORD *)*((void *)v150 + 4);
    }
    while (v150);
    *((void *)v151 + 4) = v149;
    v152 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v152 = 2;
    v152[6] = *(_DWORD *)(a1 + 324);
    v153 = v78;
    do
    {
      v154 = v153;
      v153 = (_DWORD *)*((void *)v153 + 4);
    }
    while (v153);
    *((void *)v154 + 4) = v152;
    *((void *)v132 + 1) = v143;
    *((void *)v132 + 2) = v76;
    v101 = v139;
    *((void *)v139 + 1) = v143;
  }
  *((void *)v101 + 2) = v76;
LABEL_121:
  v155 = v78;
  if (v78)
  {
LABEL_132:
    v164 = v155;
    do
    {
      v165 = v164;
      v164 = (_DWORD *)*((void *)v164 + 4);
    }
    while (v164);
    *((void *)v165 + 4) = *(void *)(v5 + 8);
    *(void *)(v5 + 8) = v155;
    goto LABEL_135;
  }
LABEL_122:
  if (*(_DWORD *)(a1 + 348))
  {
    if (*(_DWORD *)(a1 + 324) == -1) {
      *(_DWORD *)(a1 + 324) = alloc_reg(a1);
    }
    if (*(_DWORD *)(a1 + 336) == -1) {
      *(_DWORD *)(a1 + 336) = alloc_reg(a1);
    }
    v156 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v156 = 0;
    v156[6] = 0;
    v157 = v156;
    v158 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v158 = 2;
    v158[6] = *(_DWORD *)(a1 + 324);
    v159 = v157;
    do
    {
      v160 = v159;
      v159 = (_DWORD *)*((void *)v159 + 4);
    }
    while (v159);
    *((void *)v160 + 4) = v158;
    v161 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v161 = 2;
    v161[6] = *(_DWORD *)(a1 + 336);
    v162 = v157;
    do
    {
      v163 = v162;
      v162 = (_DWORD *)*((void *)v162 + 4);
    }
    while (v162);
    *((void *)v163 + 4) = v161;
    v155 = v157;
    goto LABEL_132;
  }
LABEL_135:
  if (*(_DWORD *)(a1 + 228) == 192)
  {
    v166 = (_DWORD *)newchunk((int *)a1, 40);
    _DWORD *v166 = 32;
    v166[6] = 4;
    size_t v167 = newchunk((int *)a1, 288);
    *(_DWORD *)(v167 + 16) = 21;
    *(void *)(v167 + 152) = v167;
    *(void *)(v167 + 8) = v166;
    *(_DWORD *)(v167 + 40) = 1761607680;
    gen_and(v167, a2);
  }
  int v168 = *(_DWORD *)(a1 + 224);
  size_t v169 = newchunk((int *)a1, 288);
  *(_DWORD *)(v169 + 16) = 6;
  *(void *)(v169 + 152) = v169;
  *(_DWORD *)(v169 + 40) = v168;
  if (a2)
  {
    uint64_t v170 = a2;
    do
    {
      if (*(_DWORD *)(v170 + 68)) {
        uint64_t v171 = 128;
      }
      else {
        uint64_t v171 = 88;
      }
      uint64_t v172 = *(void *)(v170 + v171);
      *(void *)(v170 + v171) = v169;
      uint64_t v170 = v172;
    }
    while (v172);
  }
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(a2 + 68) == 0;
  size_t v173 = newchunk((int *)a1, 288);
  *(_DWORD *)(v173 + 16) = 6;
  *(void *)(v173 + 152) = v173;
  *(_DWORD *)(v173 + 40) = 0;
  uint64_t v174 = a2;
  do
  {
    if (*(_DWORD *)(v174 + 68)) {
      uint64_t v175 = 128;
    }
    else {
      uint64_t v175 = 88;
    }
    uint64_t v176 = *(void *)(v174 + v175);
    *(void *)(v174 + v175) = v173;
    uint64_t v174 = v176;
  }
  while (v176);
  uint64_t result = 0;
  *(void *)(a1 + 208) = *(void *)(a2 + 152);
  return result;
}

uint64_t gen_and(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = *(void *)(a2 + 152);
    uint64_t v3 = result;
    do
    {
      if (*(_DWORD *)(v3 + 68)) {
        uint64_t v4 = 128;
      }
      else {
        uint64_t v4 = 88;
      }
      uint64_t v5 = *(void *)(v3 + v4);
      *(void *)(v3 + v4) = v2;
      uint64_t v3 = v5;
    }
    while (v5);
  }
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
  int v6 = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a2 + 68) = v6 == 0;
  uint64_t v7 = a2;
  do
  {
    uint64_t v8 = v7;
    if (*(_DWORD *)(v7 + 68)) {
      uint64_t v9 = 128;
    }
    else {
      uint64_t v9 = 88;
    }
    uint64_t v7 = *(void *)(v7 + v9);
  }
  while (v7);
  *(void *)(v8 + v9) = result;
  *(_DWORD *)(a2 + 68) = v6 != 0;
  *(void *)(a2 + 152) = *(void *)(result + 152);
  return result;
}

uint64_t gen_or(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 68);
  *(_DWORD *)(result + 68) = v2 == 0;
  uint64_t v3 = *(void *)(a2 + 152);
  uint64_t v4 = result;
  do
  {
    if (*(_DWORD *)(v4 + 68)) {
      uint64_t v5 = 128;
    }
    else {
      uint64_t v5 = 88;
    }
    uint64_t v6 = *(void *)(v4 + v5);
    *(void *)(v4 + v5) = v3;
    uint64_t v4 = v6;
  }
  while (v6);
  *(_DWORD *)(result + 68) = v2 != 0;
  if (a2)
  {
    uint64_t v7 = a2;
    do
    {
      int v8 = *(_DWORD *)(v7 + 68);
      if (v8) {
        uint64_t v9 = 128;
      }
      else {
        uint64_t v9 = 88;
      }
      if (v8) {
        int v10 = (char *)(v7 + 128);
      }
      else {
        int v10 = (char *)(v7 + 88);
      }
      uint64_t v7 = *(void *)(v7 + v9);
    }
    while (v7);
  }
  else
  {
    int v10 = &v11;
  }
  *(void *)int v10 = result;
  *(void *)(a2 + 152) = *(void *)(result + 152);
  return result;
}

uint64_t gen_not(uint64_t result)
{
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
  return result;
}

size_t gen_llc(int *a1)
{
  if (setjmp(a1)) {
    return 0;
  }
  else {
    return gen_llc_internal(a1);
  }
}

size_t gen_llc_internal(int *a1)
{
  int v2 = a1[57];
  if (v2 <= 10)
  {
    if (v2 == 1)
    {
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
      size_t v6 = newchunk(a1, 288);
      *(_DWORD *)(v6 + 16) = 37;
      *(void *)(v6 + 152) = v6;
      *(void *)(v6 + 8) = absoffsetrel;
      *(_DWORD *)(v6 + 40) = 1500;
      *(_DWORD *)(v6 + 68) = *(_DWORD *)(v6 + 68) == 0;
      uint64_t v7 = gen_load_absoffsetrel(a1, a1 + 79, 0, 8);
      size_t v8 = newchunk(a1, 288);
      *(_DWORD *)(v8 + 16) = 21;
      *(void *)(v8 + 152) = v8;
      *(void *)(v8 + 8) = v7;
      *(_DWORD *)(v8 + 40) = 0xFFFF;
      *(_DWORD *)(v8 + 68) = *(_DWORD *)(v8 + 68) == 0;
      gen_and(v6, v8);
      return v8;
    }
    if (v2 != 6 && v2 != 10) {
      goto LABEL_16;
    }
LABEL_17:
    int v10 = (_DWORD *)newchunk(a1, 40);
    *int v10 = 0;
    v10[6] = 0;
    size_t v8 = newchunk(a1, 288);
    *(_DWORD *)(v8 + 16) = 21;
    *(void *)(v8 + 152) = v8;
    *(void *)(v8 + 8) = v10;
    return v8;
  }
  uint64_t v3 = (v2 - 105);
  if (v3 > 0x3A)
  {
LABEL_14:
    if (v2 != 11)
    {
      if (v2 == 192) {
        goto LABEL_4;
      }
LABEL_16:
      uint64_t v9 = pcap_datalink_val_to_description_or_dlt(v2);
      bpf_error((uint64_t)a1, "'llc' not supported for %s", v9);
    }
    goto LABEL_17;
  }
  if (((1 << (v2 - 105)) & 0x400000000404001) == 0)
  {
    if (v3 == 18)
    {
      size_t result = gen_atmfield_code_internal(a1, 53, 2, 16, 0);
      a1[57] = a1[58];
      return result;
    }
    goto LABEL_14;
  }
LABEL_4:

  return gen_check_802_11_data_frame(a1);
}

size_t gen_llc_i(int *a1)
{
  if (setjmp(a1)) {
    return 0;
  }
  size_t v3 = gen_llc_internal(a1);
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, 2, 16);
  size_t v5 = newchunk(a1, 288);
  *(_DWORD *)(v5 + 16) = 69;
  *(void *)(v5 + 152) = v5;
  *(_DWORD *)(v5 + 40) = 1;
  *(void *)(v5 + 8) = absoffsetrel;
  *(_DWORD *)(v5 + 68) = *(_DWORD *)(v5 + 68) == 0;
  gen_and(v3, v5);
  return v5;
}

_DWORD *gen_load_a(int *a1, int a2, int a3, int a4)
{
  int v5 = a3;
  switch(a2)
  {
    case 0:
      int v7 = a4 | 0x20;
      size_t v8 = (_DWORD *)newchunk(a1, 40);
      *size_t v8 = v7;
      v8[6] = v5;
      goto LABEL_20;
    case 1:
      uint64_t v9 = a1 + 70;
      goto LABEL_14;
    case 2:
      uint64_t v9 = a1 + 73;
      goto LABEL_14;
    case 3:
      uint64_t v9 = a1 + 79;
      goto LABEL_14;
    case 4:
      uint64_t v9 = a1 + 79;
      a3 = a3 + a1[98] - 4;
      goto LABEL_14;
    case 5:
      uint64_t v9 = a1 + 82;
      goto LABEL_14;
    case 6:
      uint64_t v9 = a1 + 79;
      int v10 = a1[98];
      goto LABEL_12;
    case 7:
      uint64_t v9 = a1 + 79;
      int v10 = a1[99];
LABEL_12:
      a3 += v10;
      goto LABEL_14;
    case 8:
      size_t v8 = gen_loadx_iphdrlen(a1);
      int v12 = (_DWORD *)newchunk(a1, 40);
      *int v12 = a4 | 0x40;
      v12[6] = a1[80] + v5 + a1[98];
      uint64_t v13 = v8;
      do
      {
        int v14 = v13;
        uint64_t v13 = (_DWORD *)*((void *)v13 + 4);
      }
      while (v13);
      *((void *)v14 + 4) = v12;
      goto LABEL_20;
    case 9:
      uint64_t v9 = a1 + 79;
      a3 += a1[98] + 40;
LABEL_14:
      size_t result = gen_load_absoffsetrel(a1, v9, a3, a4);
      break;
    default:
      size_t v8 = 0;
LABEL_20:
      size_t result = v8;
      break;
  }
  return result;
}

size_t gen_llc_s(int *a1)
{
  if (setjmp(a1)) {
    return 0;
  }
  size_t v3 = gen_llc_internal(a1);
  size_t v4 = gen_ncmp(a1, 3, 2, 16, 3, 16, 0, 1);
  gen_and(v3, v4);
  return v4;
}

size_t gen_llc_u(int *a1)
{
  if (setjmp(a1)) {
    return 0;
  }
  size_t v3 = gen_llc_internal(a1);
  size_t v4 = gen_ncmp(a1, 3, 2, 16, 3, 16, 0, 3);
  gen_and(v3, v4);
  return v4;
}

size_t gen_llc_s_subtype(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  size_t v5 = gen_llc_internal(a1);
  size_t v6 = gen_ncmp(a1, 3, 2, 16, 15, 16, 0, a2);
  gen_and(v5, v6);
  return v6;
}

size_t gen_llc_u_subtype(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  size_t v5 = gen_llc_internal(a1);
  size_t v6 = gen_ncmp(a1, 3, 2, 16, 239, 16, 0, a2);
  gen_and(v5, v6);
  return v6;
}

size_t gen_proto_abbrev(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  else {
    return gen_proto_abbrev_internal(a1, a2);
  }
}

size_t gen_proto_abbrev_internal(int *a1, int a2)
{
  switch(a2)
  {
    case 1:
      bpf_error((uint64_t)a1, "link layer applied in wrong context");
    case 2:
      int v4 = 2048;
      goto LABEL_37;
    case 3:
      int v4 = 2054;
      goto LABEL_37;
    case 4:
      int v4 = 32821;
      goto LABEL_37;
    case 5:
      size_t v5 = gen_proto(a1, 132, 2, 0);
      size_t v6 = a1;
      uint64_t v7 = 132;
      goto LABEL_24;
    case 6:
      size_t v5 = gen_proto(a1, 6, 2, 0);
      size_t v6 = a1;
      uint64_t v7 = 6;
      goto LABEL_24;
    case 7:
      size_t v5 = gen_proto(a1, 17, 2, 0);
      size_t v6 = a1;
      uint64_t v7 = 17;
      goto LABEL_24;
    case 8:
      uint64_t v3 = 1;
      goto LABEL_12;
    case 9:
      uint64_t v3 = 2;
      goto LABEL_12;
    case 10:
      uint64_t v3 = 88;
      goto LABEL_12;
    case 11:
      int v4 = 32923;
      goto LABEL_37;
    case 12:
      int v4 = 24579;
      goto LABEL_37;
    case 13:
      int v4 = 24580;
      goto LABEL_37;
    case 14:
      int v4 = 24583;
      goto LABEL_37;
    case 15:
      int v4 = 24578;
      goto LABEL_37;
    case 16:
      int v4 = 24577;
      goto LABEL_37;
    case 17:
      int v4 = 34525;
      goto LABEL_37;
    case 18:
      uint64_t v3 = 58;
      int v8 = 17;
      goto LABEL_31;
    case 19:
      size_t v5 = gen_proto(a1, 51, 2, 0);
      size_t v6 = a1;
      uint64_t v7 = 51;
      goto LABEL_24;
    case 20:
      size_t v5 = gen_proto(a1, 50, 2, 0);
      size_t v6 = a1;
      uint64_t v7 = 50;
      goto LABEL_24;
    case 21:
      size_t v5 = gen_proto(a1, 103, 2, 0);
      size_t v6 = a1;
      uint64_t v7 = 103;
LABEL_24:
      int v9 = 17;
      goto LABEL_46;
    case 22:
    case 39:
      uint64_t v3 = 112;
LABEL_12:
      int v8 = 2;
      goto LABEL_31;
    case 23:
      int v4 = 33011;
      goto LABEL_37;
    case 24:
      int v4 = 254;
      goto LABEL_37;
    case 25:
      uint64_t v3 = 130;
      goto LABEL_30;
    case 26:
      uint64_t v3 = 131;
      goto LABEL_30;
    case 27:
      uint64_t v3 = 129;
LABEL_30:
      int v8 = 24;
LABEL_31:
      return gen_proto(a1, v3, v8, 0);
    case 28:
      int v4 = 66;
      goto LABEL_37;
    case 29:
      int v4 = 224;
      goto LABEL_37;
    case 30:
      int v4 = 240;
LABEL_37:
      return gen_linktype((uint64_t)a1, v4);
    case 31:
      size_t v11 = gen_proto(a1, 15, 26, 0);
      size_t v5 = gen_proto(a1, 17, 26, 0);
      gen_or(v11, v5);
      size_t v12 = gen_proto(a1, 18, 26, 0);
      gen_or(v12, v5);
      size_t v13 = gen_proto(a1, 24, 26, 0);
      gen_or(v13, v5);
      size_t v6 = a1;
      uint64_t v7 = 26;
      goto LABEL_45;
    case 32:
      size_t v14 = gen_proto(a1, 16, 26, 0);
      size_t v5 = gen_proto(a1, 17, 26, 0);
      gen_or(v14, v5);
      size_t v15 = gen_proto(a1, 20, 26, 0);
      gen_or(v15, v5);
      unint64_t v16 = a1;
      uint64_t v17 = 25;
      goto LABEL_44;
    case 33:
      size_t v18 = gen_proto(a1, 15, 26, 0);
      size_t v5 = gen_proto(a1, 16, 26, 0);
      gen_or(v18, v5);
      size_t v6 = a1;
      uint64_t v7 = 17;
      goto LABEL_45;
    case 34:
      size_t v19 = gen_proto(a1, 24, 26, 0);
      size_t v5 = gen_proto(a1, 25, 26, 0);
      gen_or(v19, v5);
      unint64_t v16 = a1;
      uint64_t v17 = 26;
LABEL_44:
      size_t v20 = gen_proto(v16, v17, 26, 0);
      gen_or(v20, v5);
      size_t v6 = a1;
      uint64_t v7 = 27;
LABEL_45:
      int v9 = 26;
LABEL_46:
      size_t v21 = gen_proto(v6, v7, v9, 0);
      goto LABEL_51;
    case 35:
      size_t v22 = gen_proto(a1, 24, 26, 0);
      int v23 = a1;
      uint64_t v24 = 25;
      goto LABEL_50;
    case 36:
      size_t v22 = gen_proto(a1, 26, 26, 0);
      int v23 = a1;
      uint64_t v24 = 27;
      goto LABEL_50;
    case 37:
      size_t v22 = gen_proto(a1, 18, 26, 0);
      int v23 = a1;
      uint64_t v24 = 20;
LABEL_50:
      size_t v5 = gen_proto(v23, v24, 26, 0);
      size_t v21 = v22;
LABEL_51:
      gen_or(v21, v5);
      return v5;
    case 38:
      bpf_error((uint64_t)a1, "'radio' is not a valid protocol type");
    default:
      abort();
  }
}

size_t gen_portop6(int *a1, int a2, int a3, int a4)
{
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 6, 16);
  size_t v9 = newchunk(a1, 288);
  *(_DWORD *)(v9 + 16) = 21;
  *(void *)(v9 + 152) = v9;
  *(void *)(v9 + 8) = absoffsetrel;
  *(_DWORD *)(v9 + 40) = a3;
  uint64_t v10 = v9;
  switch(a4)
  {
    case 0:
    case 3:
      size_t v11 = gen_portatom6(a1, 0, a2);
      size_t v12 = gen_portatom6(a1, 2, a2);
      gen_or(v11, v12);
      break;
    case 1:
      size_t v13 = a1;
      int v14 = 0;
      goto LABEL_5;
    case 2:
      size_t v13 = a1;
      int v14 = 2;
LABEL_5:
      size_t v12 = gen_portatom6(v13, v14, a2);
      break;
    case 4:
      size_t v15 = gen_portatom6(a1, 0, a2);
      size_t v12 = gen_portatom6(a1, 2, a2);
      gen_and(v15, v12);
      break;
    default:
      abort();
  }
  gen_and(v10, v12);
  return v12;
}

size_t gen_cmp(int *a1, int a2, int a3, int a4, int a5)
{
  a = gen_load_a(a1, a2, a3, a4);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = a;
  *(_DWORD *)(result + 40) = a5;
  return result;
}

size_t gen_portatom6(int *a1, int a2, int a3)
{
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a2 + a1[98] + 40, 8);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 40) = a3;
  return result;
}

size_t gen_scode(uint64_t a1, char *a2, int a3)
{
  *(void *)v42 = 0;
  *(void *)long long v43 = 0;
  if (setjmp((int *)a1)) {
    return 0;
  }
  switch((char)a3)
  {
    case 0:
    case 1:
      if (BYTE1(a3) != 12)
      {
        if (BYTE1(a3) == 1)
        {
          int v7 = *(_DWORD *)(a1 + 228);
          if (v7 <= 104)
          {
            if (v7 != 1)
            {
              if (v7 == 6)
              {
                long long v36 = pcap_ether_hostton(a2);
                if (!v36) {
                  bpf_error(a1, "unknown token ring host '%s'");
                }
                size_t v9 = v36;
                size_t v10 = gen_thostop((int *)a1, v36, BYTE2(a3));
                goto LABEL_95;
              }
              if (v7 == 10)
              {
                int v8 = pcap_ether_hostton(a2);
                if (!v8) {
                  bpf_error(a1, "unknown FDDI host '%s'");
                }
                size_t v9 = v8;
                size_t v10 = gen_fhostop((int *)a1, v8, BYTE2(a3));
LABEL_95:
                size_t v37 = v10;
LABEL_103:
                free(v9);
                return v37;
              }
LABEL_105:
              bpf_error(a1, "only ethernet/FDDI/token ring/802.11/ATM LANE/Fibre Channel supports link-level host name");
            }
LABEL_100:
            long long v39 = pcap_ether_hostton(a2);
            if (!v39) {
              bpf_error(a1, "unknown ether host '%s'");
            }
            size_t v9 = v39;
            size_t v40 = gen_prevlinkhdr_check((int *)a1);
            size_t v37 = gen_ehostop((int *)a1, v9, BYTE2(a3));
            if (v40) {
              gen_and(v40, v37);
            }
            goto LABEL_103;
          }
          uint64_t v34 = (v7 - 105);
          if (v34 <= 0x3A)
          {
            if (((1 << (v7 - 105)) & 0x400000000404001) != 0) {
              goto LABEL_91;
            }
            if (v34 == 17)
            {
              long long v38 = pcap_ether_hostton(a2);
              if (!v38) {
                bpf_error(a1, "unknown Fibre Channel host '%s'");
              }
              size_t v9 = v38;
              size_t v10 = gen_ipfchostop((int *)a1, v38, BYTE2(a3));
              goto LABEL_95;
            }
          }
          if ((v7 - 240) < 2) {
            goto LABEL_100;
          }
          if (v7 != 192) {
            goto LABEL_105;
          }
LABEL_91:
          jmp_buf v35 = pcap_ether_hostton(a2);
          if (!v35) {
            bpf_error(a1, "unknown 802.11 host '%s'");
          }
          size_t v9 = v35;
          size_t v10 = gen_wlanhostop((int *)a1, v35, BYTE2(a3));
          goto LABEL_95;
        }
        v44[0] = -1;
        v44[1] = -1;
        size_t v20 = pcap_nametoaddrinfo(a2);
        if (!v20) {
          bpf_error(a1, "unknown host '%s'");
        }
        uint64_t v21 = 0;
        size_t v22 = v20;
        *(void *)(a1 + 264) = v20;
        BOOL v23 = *(_DWORD *)(a1 + 332) == -1;
        BOOL v24 = BYTE1(a3) == 0;
        if (v23 && v24) {
          int v25 = 2;
        }
        else {
          int v25 = BYTE1(a3);
        }
        if (v23 && v24) {
          int v26 = 17;
        }
        else {
          int v26 = BYTE1(a3);
        }
        v41 = v20;
        while (1)
        {
          int ai_family = v22->ai_family;
          if (ai_family == 30)
          {
            if (v26 != 2)
            {
              size_t v29 = gen_host6((int *)a1, (unsigned int *)&v22->ai_addr->sa_data[6], (unsigned int *)v44, v26, BYTE2(a3), a3);
LABEL_59:
              size_t v30 = v29;
              if (v21) {
                gen_or(v21, v29);
              }
              goto LABEL_61;
            }
          }
          else if (ai_family == 2 && v25 != 17)
          {
            size_t v29 = gen_host((int *)a1, bswap32(*(_DWORD *)&v22->ai_addr->sa_data[2]), 0xFFFFFFFFLL, v25, BYTE2(a3));
            goto LABEL_59;
          }
          size_t v30 = v21;
LABEL_61:
          size_t v22 = v22->ai_next;
          uint64_t v21 = v30;
          if (!v22)
          {
            *(void *)(a1 + 264) = 0;
            freeaddrinfo(v41);
            size_t result = v30;
            if (!v30) {
              bpf_error(a1, "unknown host '%s'%s");
            }
            return result;
          }
        }
      }
      LOWORD(v44[0]) = 0;
      if (!__pcap_nametodnaddr()) {
        bpf_error(a1, "decnet name support not included, '%s' cannot be translated\n");
      }
      return gen_dnhostop((int *)a1, LOWORD(v44[0]), BYTE2(a3));
    case 2:
      uint64_t v11 = pcap_nametonetaddr(a2);
      if (!v11) {
        bpf_error(a1, "unknown network '%s'");
      }
      LODWORD(v12) = v11;
      if (BYTE3(v11))
      {
        uint64_t v15 = 0xFFFFFFFFLL;
        uint64_t v14 = v11;
      }
      else
      {
        LODWORD(v13) = -1;
        do
        {
          uint64_t v12 = (v12 << 8);
          uint64_t v13 = (v13 << 8);
          uint64_t v14 = v12;
          uint64_t v15 = v13;
        }
        while ((v12 - 1) < 0xFFFFFF);
      }
      return gen_host((int *)a1, v14, v15, BYTE1(a3), BYTE2(a3));
    case 3:
      if (BYTE1(a3) - 5 >= 3 && BYTE1(a3)) {
        bpf_error(a1, "illegal qualifier of 'port'");
      }
      if (!pcap_nametoport(a2, &v43[1], v43)) {
        bpf_error(a1, "unknown port '%s'");
      }
      switch(BYTE1(a3))
      {
        case 5u:
          if (v43[0] == 6) {
            goto LABEL_120;
          }
          if (v43[0] != 17)
          {
            int v16 = 132;
            goto LABEL_72;
          }
          break;
        case 6u:
          if (v43[0] == 132) {
            goto LABEL_121;
          }
          if (v43[0] != 17)
          {
            int v16 = 6;
            goto LABEL_72;
          }
          break;
        case 7u:
          if (v43[0] != 132)
          {
            if (v43[0] != 6)
            {
              int v16 = 17;
LABEL_72:
              v43[0] = v16;
LABEL_73:
              if ((v43[1] & 0x80000000) == 0)
              {
                if (v43[1] < 0x10000u)
                {
                  size_t v31 = gen_port((int *)a1, v43[1], v43[0], BYTE2(a3));
                  size_t v32 = v31;
                  size_t v33 = gen_port6((int *)a1, v43[1], v43[0], BYTE2(a3));
LABEL_88:
                  gen_or(v33, v31);
                  return v32;
                }
                goto LABEL_116;
              }
              goto LABEL_115;
            }
LABEL_120:
            bpf_error(a1, "port '%s' is tcp");
          }
LABEL_121:
          bpf_error(a1, "port '%s' is sctp");
        default:
          goto LABEL_73;
      }
      bpf_error(a1, "port '%s' is udp");
    case 4:
      bpf_error(a1, "'gateway' not supported in this configuration");
    case 5:
      uint64_t v17 = lookup_proto(a1, a2, BYTE1(a3));
      v43[0] = v17;
      if ((v17 & 0x80000000) != 0) {
        goto LABEL_106;
      }
      return gen_proto((int *)a1, v17, BYTE1(a3), BYTE2(a3));
    case 6:
      uint64_t v18 = lookup_proto(a1, a2, BYTE1(a3));
      v43[0] = v18;
      if ((v18 & 0x80000000) != 0) {
LABEL_106:
      }
        bpf_error(a1, "unknown protocol: %s");
      return gen_protochain((int *)a1, v18, BYTE1(a3));
    case 7:
      if (BYTE1(a3) - 5 >= 3 && BYTE1(a3)) {
        bpf_error(a1, "illegal qualifier of 'portrange'");
      }
      if (!pcap_nametoportrange(a2, &v42[1], v42, v43)) {
        bpf_error(a1, "unknown port in range '%s'");
      }
      switch(BYTE1(a3))
      {
        case 5u:
          if (v43[0] == 6) {
            goto LABEL_123;
          }
          if (v43[0] != 17)
          {
            int v19 = 132;
            goto LABEL_82;
          }
          break;
        case 6u:
          if (v43[0] == 132) {
            goto LABEL_124;
          }
          if (v43[0] != 17)
          {
            int v19 = 6;
            goto LABEL_82;
          }
          break;
        case 7u:
          if (v43[0] != 132)
          {
            if (v43[0] != 6)
            {
              int v19 = 17;
LABEL_82:
              v43[0] = v19;
              goto LABEL_83;
            }
LABEL_123:
            bpf_error(a1, "port in range '%s' is tcp");
          }
LABEL_124:
          bpf_error(a1, "port in range '%s' is sctp");
        default:
LABEL_83:
          if ((v42[1] & 0x80000000) == 0)
          {
            if (v42[1] >= 0x10000u) {
              goto LABEL_116;
            }
            if ((v42[0] & 0x80000000) == 0)
            {
              if (v42[0] < 0x10000u)
              {
                size_t v31 = gen_portrange((int *)a1, v42[1], v42[0], v43[0], BYTE2(a3));
                size_t v32 = v31;
                size_t v33 = gen_portrange6((int *)a1, v42[1], v42[0], v43[0], BYTE2(a3));
                goto LABEL_88;
              }
LABEL_116:
              bpf_error(a1, "illegal port number %d > 65535");
            }
          }
LABEL_115:
          bpf_error(a1, "illegal port number %d < 0");
      }
      bpf_error(a1, "port in range '%s' is udp");
    default:
      if (a3 == 255) {
        syntax(a1);
      }
      abort();
  }
}

void bpf_error(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf((char *)(*(void *)(a1 + 192) + 208), 0x100uLL, __format, va);
  longjmp((int *)a1, 1);
}

size_t gen_host(int *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  switch(a4)
  {
    case 0:
      size_t v9 = gen_hostop(a1, a2, a3, a5, 2048, 12, 16);
      if (!a1[62])
      {
        size_t v10 = gen_hostop(a1, a2, a3, a5, 2054, 14, 24);
        gen_or(v9, v10);
        size_t v9 = gen_hostop(a1, a2, a3, a5, 32821, 14, 24);
        gen_or(v10, v9);
      }
      return v9;
    case 1:
      bpf_error((uint64_t)a1, "link-layer modifier applied to %s");
    case 2:
      int v12 = a5;
      uint64_t v13 = 2048;
      uint64_t v14 = 12;
      uint64_t v15 = 16;
      goto LABEL_9;
    case 3:
      int v12 = a5;
      uint64_t v13 = 2054;
      goto LABEL_8;
    case 4:
      int v12 = a5;
      uint64_t v13 = 32821;
LABEL_8:
      uint64_t v14 = 14;
      uint64_t v15 = 24;
LABEL_9:
      size_t result = gen_hostop(a1, a2, a3, v12, v13, v14, v15);
      break;
    case 5:
      bpf_error((uint64_t)a1, "'sctp' modifier applied to %s");
    case 6:
      bpf_error((uint64_t)a1, "'tcp' modifier applied to %s");
    case 7:
      bpf_error((uint64_t)a1, "'udp' modifier applied to %s");
    case 8:
      bpf_error((uint64_t)a1, "'icmp' modifier applied to %s");
    case 9:
      bpf_error((uint64_t)a1, "'igmp' modifier applied to %s");
    case 10:
      bpf_error((uint64_t)a1, "'igrp' modifier applied to %s");
    case 11:
      bpf_error((uint64_t)a1, "AppleTalk host filtering not implemented");
    case 12:
      size_t result = gen_dnhostop(a1, a2, a5);
      break;
    case 13:
      bpf_error((uint64_t)a1, "LAT host filtering not implemented");
    case 14:
      bpf_error((uint64_t)a1, "SCA host filtering not implemented");
    case 15:
      bpf_error((uint64_t)a1, "MOPRC host filtering not implemented");
    case 16:
      bpf_error((uint64_t)a1, "MOPDL host filtering not implemented");
    case 17:
      bpf_error((uint64_t)a1, "'ip6' modifier applied to ip host");
    case 18:
      bpf_error((uint64_t)a1, "'icmp6' modifier applied to %s");
    case 19:
      bpf_error((uint64_t)a1, "'ah' modifier applied to %s");
    case 20:
      bpf_error((uint64_t)a1, "'esp' modifier applied to %s");
    case 21:
      bpf_error((uint64_t)a1, "'pim' modifier applied to %s");
    case 22:
      bpf_error((uint64_t)a1, "'vrrp' modifier applied to %s");
    case 23:
      bpf_error((uint64_t)a1, "AARP host filtering not implemented");
    case 24:
      bpf_error((uint64_t)a1, "ISO host filtering not implemented");
    case 25:
      bpf_error((uint64_t)a1, "'esis' modifier applied to %s");
    case 26:
      bpf_error((uint64_t)a1, "'isis' modifier applied to %s");
    case 27:
      bpf_error((uint64_t)a1, "'clnp' modifier applied to %s");
    case 28:
      bpf_error((uint64_t)a1, "'stp' modifier applied to %s");
    case 29:
      bpf_error((uint64_t)a1, "IPX host filtering not implemented");
    case 30:
      bpf_error((uint64_t)a1, "'netbeui' modifier applied to %s");
    case 31:
      bpf_error((uint64_t)a1, "'l1' modifier applied to %s");
    case 32:
      bpf_error((uint64_t)a1, "'l2' modifier applied to %s");
    case 33:
      bpf_error((uint64_t)a1, "'iih' modifier applied to %s");
    case 34:
      bpf_error((uint64_t)a1, "'snp' modifier applied to %s");
    case 35:
      bpf_error((uint64_t)a1, "'csnp' modifier applied to %s");
    case 36:
      bpf_error((uint64_t)a1, "'psnp' modifier applied to %s");
    case 37:
      bpf_error((uint64_t)a1, "'lsp' modifier applied to %s");
    case 38:
      bpf_error((uint64_t)a1, "'radio' modifier applied to %s");
    case 39:
      bpf_error((uint64_t)a1, "'carp' modifier applied to %s");
    default:
      abort();
  }
  return result;
}

size_t gen_prevlinkhdr_check(int *a1)
{
  if (a1[86])
  {
    absoffsetrel = (_DWORD *)newchunk(a1, 40);
    _DWORD *absoffsetrel = 96;
    absoffsetrel[6] = a1[72];
    uint64_t v3 = (_DWORD *)newchunk(a1, 40);
    _DWORD *v3 = 97;
    v3[6] = a1[81];
    int v4 = absoffsetrel;
    do
    {
      size_t v5 = v4;
      int v4 = (_DWORD *)*((void *)v4 + 4);
    }
    while (v4);
    *((void *)v5 + 4) = v3;
    size_t result = newchunk(a1, 288);
    int v7 = 0;
    int v8 = 29;
    goto LABEL_7;
  }
  if (a1[58] == 123)
  {
    absoffsetrel = gen_load_absoffsetrel(a1, a1 + 73, 4, 8);
    size_t result = newchunk(a1, 288);
    int v7 = 65280;
    int v8 = 21;
LABEL_7:
    *(_DWORD *)(result + 16) = v8;
    *(void *)(result + 152) = result;
    *(void *)(result + 8) = absoffsetrel;
    *(_DWORD *)(result + 40) = v7;
    *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
    return result;
  }
  return 0;
}

size_t gen_ehostop(int *a1, unsigned __int8 *a2, int a3)
{
  switch(a3)
  {
    case 0:
    case 3:
      size_t v5 = gen_bcmp(a1, 1, 6, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, 0, 6u, a2);
      gen_or(v5, v6);
      goto LABEL_9;
    case 1:
      int v7 = 6;
      goto LABEL_5;
    case 2:
      int v7 = 0;
LABEL_5:
      size_t result = gen_bcmp(a1, 1, v7, 6u, a2);
      break;
    case 4:
      size_t v9 = gen_bcmp(a1, 1, 6, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, 0, 6u, a2);
      gen_and(v9, v6);
LABEL_9:
      size_t result = v6;
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are only supported on 802.11 with 802.11 headers");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are only supported on 802.11 with 802.11 headers");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are only supported on 802.11 with 802.11 headers");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are only supported on 802.11 with 802.11 headers");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is only supported on 802.11 with 802.11 headers");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is only supported on 802.11 with 802.11 headers");
    default:
      abort();
  }
  return result;
}

size_t gen_fhostop(int *a1, unsigned __int8 *a2, int a3)
{
  switch(a3)
  {
    case 0:
    case 3:
      size_t v5 = gen_bcmp(a1, 1, a1[64] + 7, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, a1[64] + 1, 6u, a2);
      gen_or(v5, v6);
      goto LABEL_9;
    case 1:
      int v7 = a1[64] + 7;
      goto LABEL_5;
    case 2:
      int v7 = a1[64] + 1;
LABEL_5:
      size_t result = gen_bcmp(a1, 1, v7, 6u, a2);
      break;
    case 4:
      size_t v9 = gen_bcmp(a1, 1, a1[64] + 7, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, a1[64] + 1, 6u, a2);
      gen_and(v9, v6);
LABEL_9:
      size_t result = v6;
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are only supported on 802.11");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are only supported on 802.11");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are only supported on 802.11");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are only supported on 802.11");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is only supported on 802.11");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is only supported on 802.11");
    default:
      abort();
  }
  return result;
}

size_t gen_thostop(int *a1, unsigned __int8 *a2, int a3)
{
  switch(a3)
  {
    case 0:
    case 3:
      size_t v5 = gen_bcmp(a1, 1, 8, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, 2, 6u, a2);
      gen_or(v5, v6);
      goto LABEL_9;
    case 1:
      int v7 = 8;
      goto LABEL_5;
    case 2:
      int v7 = 2;
LABEL_5:
      size_t result = gen_bcmp(a1, 1, v7, 6u, a2);
      break;
    case 4:
      size_t v9 = gen_bcmp(a1, 1, 8, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, 2, 6u, a2);
      gen_and(v9, v6);
LABEL_9:
      size_t result = v6;
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are only supported on 802.11");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are only supported on 802.11");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are only supported on 802.11");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are only supported on 802.11");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is only supported on 802.11");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is only supported on 802.11");
    default:
      abort();
  }
  return result;
}

size_t gen_wlanhostop(int *a1, unsigned __int8 *a2, int a3)
{
  switch(a3)
  {
    case 0:
    case 3:
      uint64_t v5 = gen_wlanhostop(a1, a2, 1);
      size_t v6 = gen_wlanhostop(a1, a2, 2);
      gen_or(v5, v6);
      return v6;
    case 1:
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
      size_t v8 = newchunk(a1, 288);
      *(_DWORD *)(v8 + 16) = 69;
      *(void *)(v8 + 152) = v8;
      *(_DWORD *)(v8 + 40) = 1;
      *(void *)(v8 + 8) = absoffsetrel;
      size_t v6 = gen_bcmp(a1, 1, 24, 6u, a2);
      gen_and(v8, v6);
      size_t v9 = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
      size_t v10 = newchunk(a1, 288);
      *(_DWORD *)(v10 + 16) = 69;
      *(void *)(v10 + 152) = v10;
      *(_DWORD *)(v10 + 40) = 1;
      *(void *)(v10 + 8) = v9;
      *(_DWORD *)(v10 + 68) = *(_DWORD *)(v10 + 68) == 0;
      size_t v11 = gen_bcmp(a1, 1, 16, 6u, a2);
      gen_and(v10, v11);
      gen_or(v11, v6);
      int v12 = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
      size_t v13 = newchunk(a1, 288);
      *(_DWORD *)(v13 + 16) = 69;
      *(void *)(v13 + 152) = v13;
      *(_DWORD *)(v13 + 40) = 2;
      *(void *)(v13 + 8) = v12;
      gen_and(v13, v6);
      uint64_t v14 = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
      size_t v15 = newchunk(a1, 288);
      *(_DWORD *)(v15 + 16) = 69;
      *(void *)(v15 + 152) = v15;
      *(_DWORD *)(v15 + 40) = 2;
      *(void *)(v15 + 8) = v14;
      *(_DWORD *)(v15 + 68) = *(_DWORD *)(v15 + 68) == 0;
      size_t v16 = gen_bcmp(a1, 1, 10, 6u, a2);
      gen_and(v15, v16);
      gen_or(v16, v6);
      uint64_t v17 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v18 = newchunk(a1, 288);
      *(_DWORD *)(v18 + 16) = 69;
      *(void *)(v18 + 152) = v18;
      *(_DWORD *)(v18 + 40) = 8;
      *(void *)(v18 + 8) = v17;
      gen_and(v18, v6);
      int v19 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v20 = newchunk(a1, 288);
      *(_DWORD *)(v20 + 16) = 69;
      *(void *)(v20 + 152) = v20;
      *(_DWORD *)(v20 + 40) = 8;
      *(void *)(v20 + 8) = v19;
      *(_DWORD *)(v20 + 68) = *(_DWORD *)(v20 + 68) == 0;
      size_t v21 = gen_bcmp(a1, 1, 10, 6u, a2);
      gen_and(v20, v21);
      gen_or(v21, v6);
      size_t v22 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v23 = newchunk(a1, 288);
      *(_DWORD *)(v23 + 16) = 69;
      *(void *)(v23 + 152) = v23;
      *(_DWORD *)(v23 + 40) = 4;
      goto LABEL_5;
    case 2:
      BOOL v24 = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
      size_t v25 = newchunk(a1, 288);
      *(_DWORD *)(v25 + 16) = 69;
      *(void *)(v25 + 152) = v25;
      *(_DWORD *)(v25 + 40) = 1;
      *(void *)(v25 + 8) = v24;
      size_t v6 = gen_bcmp(a1, 1, 16, 6u, a2);
      gen_and(v25, v6);
      int v26 = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
      size_t v27 = newchunk(a1, 288);
      *(_DWORD *)(v27 + 16) = 69;
      *(void *)(v27 + 152) = v27;
      *(_DWORD *)(v27 + 40) = 1;
      *(void *)(v27 + 8) = v26;
      *(_DWORD *)(v27 + 68) = *(_DWORD *)(v27 + 68) == 0;
      size_t v28 = gen_bcmp(a1, 1, 4, 6u, a2);
      gen_and(v27, v28);
      gen_or(v28, v6);
      size_t v29 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v30 = newchunk(a1, 288);
      *(_DWORD *)(v30 + 16) = 69;
      *(void *)(v30 + 152) = v30;
      *(_DWORD *)(v30 + 40) = 8;
      *(void *)(v30 + 8) = v29;
      gen_and(v30, v6);
      size_t v31 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v32 = newchunk(a1, 288);
      *(_DWORD *)(v32 + 16) = 69;
      *(void *)(v32 + 152) = v32;
      *(_DWORD *)(v32 + 40) = 8;
      *(void *)(v32 + 8) = v31;
      *(_DWORD *)(v32 + 68) = *(_DWORD *)(v32 + 68) == 0;
      size_t v33 = gen_bcmp(a1, 1, 4, 6u, a2);
      gen_and(v32, v33);
      gen_or(v33, v6);
      size_t v22 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v23 = newchunk(a1, 288);
      *(_DWORD *)(v23 + 16) = 69;
      *(void *)(v23 + 152) = v23;
      *(_DWORD *)(v23 + 40) = 4;
LABEL_5:
      *(void *)(v23 + 8) = v22;
      *(_DWORD *)(v23 + 68) = *(_DWORD *)(v23 + 68) == 0;
      break;
    case 4:
      size_t v34 = gen_wlanhostop(a1, a2, 1);
      size_t v35 = gen_wlanhostop(a1, a2, 2);
      goto LABEL_15;
    case 5:
      return gen_bcmp(a1, 1, 4, 6u, a2);
    case 6:
      size_t v37 = gen_ncmp(a1, 1, 0, 16, 12, 16, 0, 4);
      *(_DWORD *)(v37 + 68) = *(_DWORD *)(v37 + 68) == 0;
      size_t v38 = gen_ncmp(a1, 1, 0, 16, 240, 16, 0, 192);
      *(_DWORD *)(v38 + 68) = *(_DWORD *)(v38 + 68) == 0;
      size_t v39 = gen_ncmp(a1, 1, 0, 16, 240, 16, 0, 208);
      *(_DWORD *)(v39 + 68) = *(_DWORD *)(v39 + 68) == 0;
      gen_and(v38, v39);
      gen_or(v37, v39);
      goto LABEL_17;
    case 7:
      size_t v34 = gen_ncmp(a1, 1, 0, 16, 12, 16, 0, 4);
      *(_DWORD *)(v34 + 68) = *(_DWORD *)(v34 + 68) == 0;
      size_t v40 = a1;
      int v41 = 16;
      goto LABEL_14;
    case 8:
      size_t v34 = gen_ncmp(a1, 1, 1, 16, 3, 16, 0, 3);
      size_t v40 = a1;
      int v41 = 24;
      goto LABEL_14;
    case 9:
      v42 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v34 = newchunk(a1, 288);
      *(_DWORD *)(v34 + 16) = 69;
      *(void *)(v34 + 152) = v34;
      *(_DWORD *)(v34 + 40) = 8;
      *(void *)(v34 + 8) = v42;
      size_t v40 = a1;
      int v41 = 4;
LABEL_14:
      size_t v35 = gen_bcmp(v40, 1, v41, 6u, a2);
LABEL_15:
      size_t v6 = v35;
      size_t v23 = v34;
      break;
    case 10:
      size_t v43 = gen_ncmp(a1, 1, 0, 16, 12, 16, 0, 4);
      *(_DWORD *)(v43 + 68) = *(_DWORD *)(v43 + 68) == 0;
      size_t v44 = gen_ncmp(a1, 1, 0, 16, 240, 16, 0, 192);
      *(_DWORD *)(v44 + 68) = *(_DWORD *)(v44 + 68) == 0;
      size_t v39 = gen_ncmp(a1, 1, 0, 16, 240, 16, 0, 208);
      *(_DWORD *)(v39 + 68) = *(_DWORD *)(v39 + 68) == 0;
      gen_and(v44, v39);
      gen_or(v43, v39);
      long long v45 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v46 = newchunk(a1, 288);
      *(_DWORD *)(v46 + 16) = 69;
      *(void *)(v46 + 152) = v46;
      *(_DWORD *)(v46 + 40) = 8;
      *(void *)(v46 + 8) = v45;
      gen_and(v46, v39);
LABEL_17:
      size_t v6 = gen_bcmp(a1, 1, 10, 6u, a2);
      size_t v23 = v39;
      break;
    default:
      abort();
  }
  gen_and(v23, v6);
  return v6;
}

size_t gen_ipfchostop(int *a1, unsigned __int8 *a2, int a3)
{
  switch(a3)
  {
    case 0:
    case 3:
      size_t v5 = gen_bcmp(a1, 1, 10, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, 2, 6u, a2);
      gen_or(v5, v6);
      goto LABEL_9;
    case 1:
      int v7 = 10;
      goto LABEL_5;
    case 2:
      int v7 = 2;
LABEL_5:
      size_t result = gen_bcmp(a1, 1, v7, 6u, a2);
      break;
    case 4:
      size_t v9 = gen_bcmp(a1, 1, 10, 6u, a2);
      size_t v6 = gen_bcmp(a1, 1, 2, 6u, a2);
      gen_and(v9, v6);
LABEL_9:
      size_t result = v6;
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are only supported on 802.11");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are only supported on 802.11");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are only supported on 802.11");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are only supported on 802.11");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is only supported on 802.11");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is only supported on 802.11");
    default:
      abort();
  }
  return result;
}

size_t gen_host6(int *a1, unsigned int *a2, unsigned int *a3, int a4, int a5, int a6)
{
  size_t v6 = "host";
  if (a6 == 2) {
    size_t v6 = "net";
  }
  switch(a4)
  {
    case 0:
    case 17:
      return gen_hostop6(a1, a2, a3, a5);
    case 1:
      bpf_error((uint64_t)a1, "link-layer modifier applied to ip6 %s", v6);
    case 2:
      bpf_error((uint64_t)a1, "'ip' modifier applied to ip6 %s", v6);
    case 3:
      bpf_error((uint64_t)a1, "'arp' modifier applied to ip6 %s", v6);
    case 4:
      bpf_error((uint64_t)a1, "'rarp' modifier applied to ip6 %s", v6);
    case 5:
      bpf_error((uint64_t)a1, "'sctp' modifier applied to ip6 %s", v6);
    case 6:
      bpf_error((uint64_t)a1, "'tcp' modifier applied to ip6 %s", v6);
    case 7:
      bpf_error((uint64_t)a1, "'udp' modifier applied to ip6 %s", v6);
    case 8:
      bpf_error((uint64_t)a1, "'icmp' modifier applied to ip6 %s", v6);
    case 9:
      bpf_error((uint64_t)a1, "'igmp' modifier applied to ip6 %s", v6);
    case 10:
      bpf_error((uint64_t)a1, "'igrp' modifier applied to ip6 %s", v6);
    case 11:
      bpf_error((uint64_t)a1, "AppleTalk modifier applied to ip6 %s", v6);
    case 12:
      bpf_error((uint64_t)a1, "'decnet' modifier applied to ip6 %s", v6);
    case 13:
      bpf_error((uint64_t)a1, "'lat' modifier applied to ip6 %s", v6);
    case 14:
      bpf_error((uint64_t)a1, "'sca' modifier applied to ip6 %s", v6);
    case 15:
      bpf_error((uint64_t)a1, "'moprc' modifier applied to ip6 %s", v6);
    case 16:
      bpf_error((uint64_t)a1, "'mopdl' modifier applied to ip6 %s", v6);
    case 18:
      bpf_error((uint64_t)a1, "'icmp6' modifier applied to ip6 %s", v6);
    case 19:
      bpf_error((uint64_t)a1, "'ah' modifier applied to ip6 %s", v6);
    case 20:
      bpf_error((uint64_t)a1, "'esp' modifier applied to ip6 %s", v6);
    case 21:
      bpf_error((uint64_t)a1, "'pim' modifier applied to ip6 %s", v6);
    case 22:
      bpf_error((uint64_t)a1, "'vrrp' modifier applied to ip6 %s", v6);
    case 23:
      bpf_error((uint64_t)a1, "'aarp' modifier applied to ip6 %s", v6);
    case 24:
      bpf_error((uint64_t)a1, "'iso' modifier applied to ip6 %s", v6);
    case 25:
      bpf_error((uint64_t)a1, "'esis' modifier applied to ip6 %s", v6);
    case 26:
      bpf_error((uint64_t)a1, "'isis' modifier applied to ip6 %s", v6);
    case 27:
      bpf_error((uint64_t)a1, "'clnp' modifier applied to ip6 %s", v6);
    case 28:
      bpf_error((uint64_t)a1, "'stp' modifier applied to ip6 %s", v6);
    case 29:
      bpf_error((uint64_t)a1, "'ipx' modifier applied to ip6 %s", v6);
    case 30:
      bpf_error((uint64_t)a1, "'netbeui' modifier applied to ip6 %s", v6);
    case 31:
      bpf_error((uint64_t)a1, "'l1' modifier applied to ip6 %s", v6);
    case 32:
      bpf_error((uint64_t)a1, "'l2' modifier applied to ip6 %s", v6);
    case 33:
      bpf_error((uint64_t)a1, "'iih' modifier applied to ip6 %s", v6);
    case 34:
      bpf_error((uint64_t)a1, "'snp' modifier applied to ip6 %s", v6);
    case 35:
      bpf_error((uint64_t)a1, "'csnp' modifier applied to ip6 %s", v6);
    case 36:
      bpf_error((uint64_t)a1, "'psnp' modifier applied to ip6 %s", v6);
    case 37:
      bpf_error((uint64_t)a1, "'lsp' modifier applied to ip6 %s", v6);
    case 38:
      bpf_error((uint64_t)a1, "'radio' modifier applied to ip6 %s", v6);
    case 39:
      bpf_error((uint64_t)a1, "'carp' modifier applied to ip6 %s", v6);
    default:
      abort();
  }
}

size_t gen_port(int *a1, int a2, int a3, int a4)
{
  size_t v8 = gen_linktype((uint64_t)a1, 2048);
  if (a3 > 16)
  {
    if (a3 != 132 && a3 != 17) {
LABEL_10:
    }
      abort();
  }
  else
  {
    if (a3 == -1)
    {
      size_t v10 = gen_portop(a1, a2, 6, a4);
      size_t v9 = gen_portop(a1, a2, 17, a4);
      gen_or(v10, v9);
      size_t v11 = gen_portop(a1, a2, 132, a4);
      gen_or(v11, v9);
      goto LABEL_9;
    }
    if (a3 != 6) {
      goto LABEL_10;
    }
  }
  size_t v9 = gen_portop(a1, a2, a3, a4);
LABEL_9:
  gen_and(v8, v9);
  return v9;
}

size_t gen_port6(int *a1, int a2, int a3, int a4)
{
  size_t v8 = gen_linktype((uint64_t)a1, 34525);
  if (a3 > 16)
  {
    if (a3 != 132 && a3 != 17) {
LABEL_10:
    }
      abort();
  }
  else
  {
    if (a3 == -1)
    {
      size_t v10 = gen_portop6(a1, a2, 6, a4);
      size_t v9 = gen_portop6(a1, a2, 17, a4);
      gen_or(v10, v9);
      size_t v11 = gen_portop6(a1, a2, 132, a4);
      gen_or(v11, v9);
      goto LABEL_9;
    }
    if (a3 != 6) {
      goto LABEL_10;
    }
  }
  size_t v9 = gen_portop6(a1, a2, a3, a4);
LABEL_9:
  gen_and(v8, v9);
  return v9;
}

size_t gen_portrange(int *a1, unsigned int a2, unsigned int a3, int a4, int a5)
{
  size_t v10 = gen_linktype((uint64_t)a1, 2048);
  if (a4 > 16)
  {
    if (a4 != 132 && a4 != 17) {
LABEL_10:
    }
      abort();
  }
  else
  {
    if (a4 == -1)
    {
      size_t v12 = gen_portrangeop(a1, a2, a3, 6, a5);
      size_t v11 = gen_portrangeop(a1, a2, a3, 17, a5);
      gen_or(v12, v11);
      size_t v13 = gen_portrangeop(a1, a2, a3, 132, a5);
      gen_or(v13, v11);
      goto LABEL_9;
    }
    if (a4 != 6) {
      goto LABEL_10;
    }
  }
  size_t v11 = gen_portrangeop(a1, a2, a3, a4, a5);
LABEL_9:
  gen_and(v10, v11);
  return v11;
}

size_t gen_portrange6(int *a1, unsigned int a2, unsigned int a3, int a4, int a5)
{
  size_t v10 = gen_linktype((uint64_t)a1, 34525);
  if (a4 > 16)
  {
    if (a4 != 132 && a4 != 17) {
LABEL_10:
    }
      abort();
  }
  else
  {
    if (a4 == -1)
    {
      size_t v12 = gen_portrangeop6(a1, a2, a3, 6, a5);
      size_t v11 = gen_portrangeop6(a1, a2, a3, 17, a5);
      gen_or(v12, v11);
      size_t v13 = gen_portrangeop6(a1, a2, a3, 132, a5);
      gen_or(v13, v11);
      goto LABEL_9;
    }
    if (a4 != 6) {
      goto LABEL_10;
    }
  }
  size_t v11 = gen_portrangeop6(a1, a2, a3, a4, a5);
LABEL_9:
  gen_and(v10, v11);
  return v11;
}

uint64_t lookup_proto(uint64_t a1, char *__s1, int a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 <= 1)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        uint64_t result = pcap_nametoeproto(__s1);
        if (result == -1)
        {
          uint64_t result = pcap_nametollc(__s1);
          if (result == -1) {
            bpf_error(a1, "unknown ether proto '%s'");
          }
        }
      }
      return result;
    }
LABEL_11:
    uint64_t result = pcap_nametoproto(__s1);
    if (result == -1) {
      bpf_error(a1, "unknown ip proto '%s'");
    }
    return result;
  }
  if (a3 == 2) {
    goto LABEL_11;
  }
  if (a3 != 24)
  {
    if (a3 != 17) {
      return result;
    }
    goto LABEL_11;
  }
  if (!strcmp(__s1, "esis")) {
    return 130;
  }
  if (!strcmp(__s1, "isis")) {
    return 131;
  }
  if (strcmp(__s1, "clnp")) {
    bpf_error(a1, "unknown osi proto '%s'");
  }
  return 129;
}

size_t gen_proto(int *a1, uint64_t a2, int a3, int a4)
{
  if (a4) {
    bpf_error((uint64_t)a1, "direction applied to 'proto'");
  }
  switch(a3)
  {
    case 0:
      uint64_t v6 = gen_proto(a1, a2, 2, 0);
      size_t v7 = gen_proto(a1, a2, 17, 0);
      gen_or(v6, v7);
      return v7;
    case 1:
      return gen_linktype((uint64_t)a1, a2);
    case 2:
      size_t v9 = gen_linktype((uint64_t)a1, 2048);
      size_t v10 = a1 + 79;
      int v11 = a1[98] + 9;
      goto LABEL_15;
    case 3:
      bpf_error((uint64_t)a1, "arp does not encapsulate another protocol");
    case 4:
      bpf_error((uint64_t)a1, "rarp does not encapsulate another protocol");
    case 5:
      bpf_error((uint64_t)a1, "'sctp proto' is bogus");
    case 6:
      bpf_error((uint64_t)a1, "'tcp proto' is bogus");
    case 7:
      bpf_error((uint64_t)a1, "'udp proto' is bogus");
    case 8:
      bpf_error((uint64_t)a1, "'icmp proto' is bogus");
    case 9:
      bpf_error((uint64_t)a1, "'igmp proto' is bogus");
    case 10:
      bpf_error((uint64_t)a1, "'igrp proto' is bogus");
    case 11:
      bpf_error((uint64_t)a1, "AppleTalk encapsulation is not specifiable");
    case 12:
      bpf_error((uint64_t)a1, "DECNET encapsulation is not specifiable");
    case 13:
      bpf_error((uint64_t)a1, "LAT does not encapsulate another protocol");
    case 14:
      bpf_error((uint64_t)a1, "SCA does not encapsulate another protocol");
    case 15:
      bpf_error((uint64_t)a1, "MOPRC does not encapsulate another protocol");
    case 16:
      bpf_error((uint64_t)a1, "MOPDL does not encapsulate another protocol");
    case 17:
      size_t v9 = gen_linktype((uint64_t)a1, 34525);
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 6, 16);
      size_t v13 = newchunk(a1, 288);
      *(_DWORD *)(v13 + 16) = 21;
      *(void *)(v13 + 152) = v13;
      *(void *)(v13 + 8) = absoffsetrel;
      *(_DWORD *)(v13 + 40) = 44;
      uint64_t v14 = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 40, 16);
      size_t v7 = newchunk(a1, 288);
      *(_DWORD *)(v7 + 16) = 21;
      *(void *)(v7 + 152) = v7;
      *(void *)(v7 + 8) = v14;
      *(_DWORD *)(v7 + 40) = a2;
      gen_and(v13, v7);
      size_t v15 = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 6, 16);
      size_t v16 = newchunk(a1, 288);
      *(_DWORD *)(v16 + 16) = 21;
      *(void *)(v16 + 152) = v16;
      *(void *)(v16 + 8) = v15;
      *(_DWORD *)(v16 + 40) = a2;
      gen_or(v16, v7);
      goto LABEL_16;
    case 18:
      bpf_error((uint64_t)a1, "'icmp6 proto' is bogus");
    case 19:
      bpf_error((uint64_t)a1, "'ah proto' is bogus");
    case 20:
      bpf_error((uint64_t)a1, "'esp proto' is bogus");
    case 21:
      bpf_error((uint64_t)a1, "'pim proto' is bogus");
    case 22:
      bpf_error((uint64_t)a1, "'vrrp proto' is bogus");
    case 23:
      bpf_error((uint64_t)a1, "'aarp proto' is bogus");
    case 24:
      int v17 = a1[57];
      if (v17 == 104)
      {
        size_t v9 = gen_linktype((uint64_t)a1, 65278);
        size_t v10 = a1 + 79;
        int v11 = a1[99] + 1;
      }
      else
      {
        if (v17 == 107)
        {
          int v18 = a2 | 0x300;
          int v19 = gen_load_absoffsetrel(a1, a1 + 70, 2, 8);
          size_t v7 = newchunk(a1, 288);
          *(_DWORD *)(v7 + 16) = 21;
          *(void *)(v7 + 152) = v7;
          *(void *)(v7 + 8) = v19;
          *(_DWORD *)(v7 + 40) = v18;
          return v7;
        }
        size_t v9 = gen_linktype((uint64_t)a1, 254);
        size_t v10 = a1 + 79;
        int v11 = a1[99];
      }
LABEL_15:
      size_t v20 = gen_load_absoffsetrel(a1, v10, v11, 16);
      size_t v7 = newchunk(a1, 288);
      *(_DWORD *)(v7 + 16) = 21;
      *(void *)(v7 + 152) = v7;
      *(void *)(v7 + 8) = v20;
      *(_DWORD *)(v7 + 40) = a2;
LABEL_16:
      gen_and(v9, v7);
      return v7;
    case 25:
      bpf_error((uint64_t)a1, "'esis proto' is bogus");
    case 26:
      size_t v9 = gen_proto(a1, 131, 24, 0);
      size_t v10 = a1 + 79;
      int v11 = a1[99] + 4;
      goto LABEL_15;
    case 27:
      bpf_error((uint64_t)a1, "'clnp proto' is not supported");
    case 28:
      bpf_error((uint64_t)a1, "'stp proto' is bogus");
    case 29:
      bpf_error((uint64_t)a1, "'ipx proto' is bogus");
    case 30:
      bpf_error((uint64_t)a1, "'netbeui proto' is bogus");
    case 31:
      bpf_error((uint64_t)a1, "'l1 proto' is bogus");
    case 32:
      bpf_error((uint64_t)a1, "'l2 proto' is bogus");
    case 33:
      bpf_error((uint64_t)a1, "'iih proto' is bogus");
    case 34:
      bpf_error((uint64_t)a1, "'snp proto' is bogus");
    case 35:
      bpf_error((uint64_t)a1, "'csnp proto' is bogus");
    case 36:
      bpf_error((uint64_t)a1, "'psnp proto' is bogus");
    case 37:
      bpf_error((uint64_t)a1, "'lsp proto' is bogus");
    case 38:
      bpf_error((uint64_t)a1, "'radio proto' is bogus");
    case 39:
      bpf_error((uint64_t)a1, "'carp proto' is bogus");
    default:
      abort();
  }
}

size_t gen_protochain(int *a1, uint64_t a2, int a3)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  int v6 = alloc_reg((uint64_t)a1);
  bzero(&v57, 0x318uLL);
  if (a3 == 17 || a3 == 2)
  {
    if (a1[79]) {
      bpf_error((uint64_t)a1, "'protochain' not supported with variable length headers");
    }
    a1[61] = 1;
    size_t v9 = (_DWORD *)newchunk(a1, 40);
    *size_t v9 = 0;
    v56 = v9;
    if (a3 == 17)
    {
      size_t v55 = gen_linktype((uint64_t)a1, 34525);
      int v12 = 40;
      size_t v13 = (_DWORD *)newchunk(a1, 40);
      *size_t v13 = 48;
      v57 = v13;
      v13[6] = a1[80] + a1[98] + 6;
      int v11 = (_DWORD *)newchunk(a1, 40);
      *int v11 = 1;
      v58 = v11;
    }
    else
    {
      size_t v55 = gen_linktype((uint64_t)a1, 2048);
      size_t v10 = (_DWORD *)newchunk(a1, 40);
      *size_t v10 = 48;
      v57 = v10;
      v10[6] = a1[80] + a1[98] + 9;
      int v11 = (_DWORD *)newchunk(a1, 40);
      *int v11 = 177;
      v58 = v11;
      int v12 = a1[98] + a1[80];
    }
    v11[6] = v12;
    size_t v14 = newchunk(a1, 40);
    *(_DWORD *)size_t v14 = 21;
    size_t v59 = v14;
    *(_DWORD *)(v14 + 24) = a2;
    *(void *)(v14 + 8) = 0;
    *(void *)(v59 + 16) = 0;
    size_t v15 = newchunk(a1, 40);
    *(_DWORD *)size_t v15 = 21;
    size_t v60 = v15;
    *(void *)(v15 + 8) = 0;
    *(void *)(v60 + 16) = 0;
    size_t v16 = v60;
    *(_DWORD *)(v60 + 24) = 59;
    *(void *)(v59 + 16) = v16;
    size_t v17 = newchunk(a1, 40);
    if (a3 == 17)
    {
      *(_DWORD *)size_t v17 = 21;
      size_t v61 = v17;
      *(void *)(v17 + 8) = 0;
      *(void *)(v61 + 16) = 0;
      size_t v18 = v61;
      *(_DWORD *)(v61 + 24) = 0;
      *(void *)(v60 + 16) = v18;
      int v19 = (_DWORD *)newchunk(a1, 40);
      *int v19 = 21;
      v62 = v19;
      *(void *)(v61 + 16) = v19;
      *((void *)v62 + 1) = 0;
      *((void *)v62 + 2) = 0;
      size_t v20 = v62;
      v62[6] = 60;
      size_t v21 = (_DWORD *)newchunk(a1, 40);
      *size_t v21 = 21;
      v63 = v21;
      *((void *)v20 + 2) = v21;
      *((void *)v63 + 1) = 0;
      *((void *)v63 + 2) = 0;
      size_t v22 = v63;
      v63[6] = 43;
      size_t v23 = (_DWORD *)newchunk(a1, 40);
      _DWORD *v23 = 21;
      v64 = v23;
      *((void *)v22 + 2) = v23;
      *((void *)v64 + 1) = 0;
      *((void *)v64 + 2) = 0;
      v64[6] = 44;
      BOOL v24 = (_DWORD *)newchunk(a1, 40);
      *BOOL v24 = 80;
      v65 = v24;
      v24[6] = a1[98] + a1[80];
      size_t v25 = (_DWORD *)newchunk(a1, 40);
      *size_t v25 = 2;
      v66 = v25;
      v25[6] = v6;
      int v26 = (_DWORD *)newchunk(a1, 40);
      *int v26 = 80;
      v67 = v26;
      v26[6] = a1[80] + a1[98] + 1;
      size_t v27 = (_DWORD *)newchunk(a1, 40);
      *size_t v27 = 4;
      v68 = v27;
      v27[6] = 1;
      size_t v28 = (_DWORD *)newchunk(a1, 40);
      *size_t v28 = 36;
      v69 = v28;
      uint64_t v29 = 8;
      v28[6] = 8;
      size_t v30 = (_DWORD *)newchunk(a1, 40);
      *size_t v30 = 12;
      v70 = v30;
      v30[6] = 0;
      size_t v31 = (_DWORD *)newchunk(a1, 40);
      *size_t v31 = 7;
      v71 = v31;
      size_t v32 = newchunk(a1, 40);
      *(_DWORD *)size_t v32 = 96;
      size_t v72 = v32;
      *(_DWORD *)(v32 + 24) = v6;
      size_t v33 = (_DWORD *)newchunk(a1, 40);
      uint64_t v34 = 0;
      *size_t v33 = 5;
      v73 = v33;
      v33[6] = -15;
      *(void *)(v32 + 16) = v33;
      do
      {
        *(void *)(*(size_t *)((char *)&v61 + v34) + 8) = v65;
        v34 += 8;
      }
      while (v34 != 32);
      unsigned int v35 = 18;
    }
    else
    {
      uint64_t v29 = 0;
      *(_DWORD *)size_t v17 = 4;
      size_t v61 = v17;
      *(_DWORD *)(v17 + 24) = 0;
      *(void *)(v60 + 16) = v17;
      unsigned int v35 = 6;
    }
    size_t v36 = newchunk(a1, 40);
    *(_DWORD *)size_t v36 = 21;
    (&v56)[v35] = (_DWORD *)v36;
    *(void *)(v36 + 8) = 0;
    *((void *)(&v56)[v35] + 2) = 0;
    size_t v37 = (&v56)[v35];
    v37[6] = 51;
    if (a3 == 17) {
      *((void *)(&v56)[v29] + 2) = v37;
    }
    size_t v38 = (_DWORD *)newchunk(a1, 40);
    *size_t v38 = 135;
    (&v56)[v35 | 1] = v38;
    *((void *)(&v56)[v35] + 1) = v38;
    size_t v39 = (_DWORD *)newchunk(a1, 40);
    *size_t v39 = 80;
    *(&v56 + v35 + 2) = v39;
    v39[6] = a1[98] + a1[80];
    size_t v40 = newchunk(a1, 40);
    *(_DWORD *)size_t v40 = 2;
    *(&v56 + v35 + 3) = (_DWORD *)v40;
    *(_DWORD *)(v40 + 24) = v6;
    int v41 = (_DWORD *)newchunk(a1, 40);
    _DWORD *v41 = 135;
    (&v56)[v35 + 1] = v41;
    *(void *)(v40 + 8) = v41;
    v42 = (_DWORD *)newchunk(a1, 40);
    _DWORD *v42 = 4;
    *(&v56 + v35 + 5) = v42;
    v42[6] = 1;
    size_t v43 = (_DWORD *)newchunk(a1, 40);
    *size_t v43 = 7;
    *(&v56 + v35 + 6) = v43;
    size_t v44 = (_DWORD *)newchunk(a1, 40);
    *size_t v44 = 80;
    *(&v56 + v35 + 7) = v44;
    v44[6] = a1[98] + a1[80];
    long long v45 = (_DWORD *)newchunk(a1, 40);
    *long long v45 = 4;
    (&v56)[v35 | 8] = v45;
    v45[6] = 2;
    size_t v46 = (_DWORD *)newchunk(a1, 40);
    *size_t v46 = 36;
    (&v56)[v35 | 9] = v46;
    v46[6] = 4;
    int v47 = (_DWORD *)newchunk(a1, 40);
    *int v47 = 7;
    *(&v56 + v35 + 10) = v47;
    int v48 = (_DWORD *)newchunk(a1, 40);
    *int v48 = 96;
    *(&v56 + v35 + 11) = v48;
    v48[6] = v6;
    v49 = (_DWORD *)newchunk(a1, 40);
    _DWORD *v49 = 5;
    (&v56)[v35 + 3] = v49;
    v49[6] = -10 - v35;
    uint64_t v50 = v35 + 13;
    v51 = (_DWORD *)newchunk(a1, 40);
    _DWORD *v51 = 4;
    (&v56)[v50] = v51;
    v51[6] = 0;
    *(void *)(v60 + 8) = v51;
    *((void *)(&v56)[v35] + 2) = (&v56)[v50];
    *(void *)(v59 + 8) = (&v56)[v50];
    v52 = &v57;
    uint64_t v53 = v50;
    do
    {
      *(void *)(*(v52 - 1) + 32) = *v52;
      ++v52;
      --v53;
    }
    while (v53);
    *((void *)(&v56)[v50] + 4) = 0;
    size_t v8 = newchunk(a1, 288);
    *(_DWORD *)(v8 + 16) = 21;
    *(void *)(v8 + 152) = v8;
    *(void *)(v8 + 8) = v57;
    *(_DWORD *)(v8 + 40) = a2;
    a1[v6 + 100] = 0;
    gen_and(v55, v8);
  }
  else
  {
    if (a3) {
      bpf_error((uint64_t)a1, "bad protocol applied for 'protochain'");
    }
    uint64_t v7 = gen_protochain(a1, a2, 2);
    size_t v8 = gen_protochain(a1, a2, 17);
    gen_or(v7, v8);
  }
  return v8;
}

void syntax(uint64_t a1)
{
}

size_t gen_mcode(int *a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t v19 = 0;
  if (setjmp(a1)) {
    return 0;
  }
  int v11 = __pcap_atoin(a2, (int *)&v19 + 1);
  if (v11 < 0) {
    goto LABEL_18;
  }
  uint64_t v13 = (HIDWORD(v19) << -(char)v11);
  HIDWORD(v19) <<= -(char)v11;
  if (!a3)
  {
    if (a4 >= 0x21) {
      bpf_error((uint64_t)a1, "mask length must be <= 32");
    }
    if (a4) {
      uint64_t v18 = (-1 << -(char)a4);
    }
    else {
      uint64_t v18 = 0;
    }
    LODWORD(v19) = v18;
    if ((v13 & ~v18) != 0) {
      bpf_error((uint64_t)a1, "non-network bits set in \"%s/%d\"", v12);
    }
    uint64_t v16 = v18;
    uint64_t v17 = v13;
    goto LABEL_14;
  }
  int v14 = __pcap_atoin(a3, (int *)&v19);
  if (v14 < 0) {
LABEL_18:
  }
    bpf_error((uint64_t)a1, "invalid IPv4 address '%s'", v12);
  uint64_t v15 = (v19 << -(char)v14);
  LODWORD(v19) = v15;
  if ((HIDWORD(v19) & ~v15) != 0) {
    bpf_error((uint64_t)a1, "non-network bits set in \"%s mask %s\"", v12);
  }
  uint64_t v16 = v15;
  uint64_t v17 = HIDWORD(v19);
LABEL_14:
  if (a5 != 2) {
    bpf_error((uint64_t)a1, "Mask syntax for networks only", v16);
  }
  return gen_host(a1, v17, v16, BYTE1(a5), BYTE2(a5));
}

size_t gen_ncode(int *a1, const char *a2, unsigned int a3, int a4)
{
  unsigned int v21 = a3;
  if (setjmp(a1)) {
    return 0;
  }
  if (a2)
  {
    if (BYTE1(a4) == 12)
    {
      int v8 = __pcap_atodn(a2, (int *)&v21);
      if (!v8) {
        bpf_error((uint64_t)a1, "malformed decnet address '%s'");
      }
    }
    else
    {
      int v8 = __pcap_atoin((uint64_t)a2, (int *)&v21);
      if (v8 < 0) {
        bpf_error((uint64_t)a1, "invalid IPv4 address '%s'");
      }
    }
  }
  else
  {
    int v8 = 32;
  }
  int v9 = BYTE2(a4);
  switch((char)a4)
  {
    case 0:
    case 1:
    case 2:
      if (BYTE1(a4) == 12) {
        return gen_dnhostop(a1, v21, BYTE2(a4));
      }
      if (BYTE1(a4) == 1) {
        bpf_error((uint64_t)a1, "illegal link layer address");
      }
      if (a2 || a4 != 2)
      {
        int v20 = -v8;
        v21 <<= v20;
        uint64_t v14 = (-1 << v20);
        uint64_t v12 = v21;
      }
      else if (v21 - 1 > 0xFFFFFE)
      {
        uint64_t v14 = 0xFFFFFFFFLL;
        uint64_t v12 = v21;
      }
      else
      {
        int v10 = -1;
        unsigned int v11 = v21;
        do
        {
          uint64_t v13 = (v10 << 8);
          v10 <<= 8;
          v11 <<= 8;
          uint64_t v12 = v11;
        }
        while (v11 - 1 < 0xFFFFFF);
        unsigned int v21 = v11;
        uint64_t v14 = v13;
      }
      return gen_host(a1, v12, v14, BYTE1(a4), BYTE2(a4));
    case 3:
      if (BYTE1(a4) >= 8u || ((0xE1u >> SBYTE1(a4)) & 1) == 0) {
        bpf_error((uint64_t)a1, "illegal qualifier of 'port'");
      }
      if (v21 >= 0x10000) {
        goto LABEL_39;
      }
      int v15 = dword_20D914A30[SBYTE1(a4)];
      size_t v16 = gen_port(a1, v21, v15, BYTE2(a4));
      size_t v17 = v16;
      size_t v18 = gen_port6(a1, v21, v15, v9);
      break;
    case 4:
      bpf_error((uint64_t)a1, "'gateway' requires a name");
    case 5:
      return gen_proto(a1, v21, BYTE1(a4), BYTE2(a4));
    case 6:
      return gen_protochain(a1, v21, BYTE1(a4));
    case 7:
      if (BYTE1(a4) >= 8u || ((0xE1u >> SBYTE1(a4)) & 1) == 0) {
        bpf_error((uint64_t)a1, "illegal qualifier of 'portrange'");
      }
      if (v21 >= 0x10000) {
LABEL_39:
      }
        bpf_error((uint64_t)a1, "illegal port number %u > 65535");
      int v19 = dword_20D914A30[SBYTE1(a4)];
      size_t v16 = gen_portrange(a1, v21, v21, v19, BYTE2(a4));
      size_t v17 = v16;
      size_t v18 = gen_portrange6(a1, v21, v21, v19, v9);
      break;
    default:
      if (a4 == 255) {
        syntax((uint64_t)a1);
      }
      abort();
  }
  gen_or(v18, v16);
  return v17;
}

size_t gen_mcode6(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, int a5)
{
  if (setjmp((int *)a1)) {
    return 0;
  }
  if (a3) {
    bpf_error(a1, "no mask %s supported");
  }
  unsigned int v11 = pcap_nametoaddrinfo(a2);
  if (!v11) {
    bpf_error(a1, "invalid ip6 address %s");
  }
  *(void *)(a1 + 264) = v11;
  if (v11->ai_next) {
    bpf_error(a1, "%s resolved to multiple address");
  }
  if (a4 >= 0x81) {
    bpf_error(a1, "mask length must be <= %u");
  }
  uint64_t v12 = v11;
  ai_addr = v11->ai_addr;
  long long v15 = 0uLL;
  __memset_chk();
  if ((a4 & 7) != 0) {
    *((unsigned char *)&v15 + ((unint64_t)a4 >> 3)) = 255 << (8 - (a4 & 7));
  }
  if ((*(_DWORD *)&ai_addr->sa_data[6] & ~v15) != 0
    || (*(void *)&ai_addr->sa_data[10] & ~*(void *)((char *)&v15 + 4)) != 0
    || (*(_DWORD *)&ai_addr[1].sa_data[2] & ~HIDWORD(v15)) != 0)
  {
    bpf_error(a1, "non-network bits set in \"%s/%d\"");
  }
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      bpf_error(a1, "invalid qualifier against IPv6 address");
    }
  }
  else if (a4 != 128)
  {
    bpf_error(a1, "Mask syntax for networks only");
  }
  size_t v14 = gen_host6((int *)a1, (unsigned int *)&ai_addr->sa_data[6], (unsigned int *)&v15, BYTE1(a5), BYTE2(a5), a5);
  *(void *)(a1 + 264) = 0;
  freeaddrinfo(v12);
  return v14;
}

size_t gen_ecode(uint64_t a1, const char *a2, unint64_t a3)
{
  if (setjmp((int *)a1)) {
    return 0;
  }
  if ((a3 & 0xFFFE) != 0x100) {
    bpf_error(a1, "ethernet address used in non-ether expression");
  }
  uint64_t v7 = pcap_ether_aton(a2);
  *(void *)(a1 + 272) = v7;
  if (!v7) {
    bpf_error(a1, "malloc");
  }
  unint64_t v8 = a3 >> 16;
  int v9 = *(_DWORD *)(a1 + 228);
  if (v9 > 104)
  {
    uint64_t v11 = (v9 - 105);
    if (v11 <= 0x3A)
    {
      if (((1 << (v9 - 105)) & 0x400000000404001) != 0) {
        goto LABEL_12;
      }
      if (v11 == 17)
      {
        size_t v10 = gen_ipfchostop((int *)a1, v7, BYTE2(a3));
        goto LABEL_14;
      }
    }
    if ((v9 - 240) < 2)
    {
LABEL_18:
      size_t v13 = gen_prevlinkhdr_check((int *)a1);
      size_t v12 = gen_ehostop((int *)a1, *(unsigned __int8 **)(a1 + 272), v8);
      if (v13) {
        gen_and(v13, v12);
      }
      goto LABEL_20;
    }
    if (v9 != 192) {
      goto LABEL_22;
    }
LABEL_12:
    size_t v10 = gen_wlanhostop((int *)a1, v7, BYTE2(a3));
    goto LABEL_14;
  }
  if (v9 == 1) {
    goto LABEL_18;
  }
  if (v9 == 6)
  {
    size_t v10 = gen_thostop((int *)a1, v7, BYTE2(a3));
    goto LABEL_14;
  }
  if (v9 != 10)
  {
LABEL_22:
    free(v7);
    *(void *)(a1 + 272) = 0;
    bpf_error(a1, "ethernet addresses supported only on ethernet/FDDI/token ring/802.11/ATM LANE/Fibre Channel");
  }
  size_t v10 = gen_fhostop((int *)a1, v7, BYTE2(a3));
LABEL_14:
  size_t v12 = v10;
LABEL_20:
  free(*(void **)(a1 + 272));
  *(void *)(a1 + 272) = 0;
  return v12;
}

uint64_t sappend(uint64_t result, uint64_t a2)
{
  do
  {
    uint64_t v2 = result;
    uint64_t result = *(void *)(result + 32);
  }
  while (result);
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t gen_load(int *a1, int a2, uint64_t a3, int a4)
{
  if (setjmp(a1)) {
    return 0;
  }
  gen_load_internal(a1, a2, a3, a4);
  return a3;
}

uint64_t gen_load_internal(int *a1, int a2, uint64_t a3, int a4)
{
  int v8 = alloc_reg((uint64_t)a1);
  a1[*(int *)(a3 + 16) + 100] = 0;
  switch(a4)
  {
    case 1:
      int v9 = 80;
      break;
    case 2:
      int v9 = 72;
      break;
    case 4:
      int v9 = 64;
      break;
    default:
      bpf_error((uint64_t)a1, "data size must be 1, 2, or 4");
  }
  switch(a2)
  {
    case 1:
      int v47 = gen_abs_offset_varpart(a1, a1 + 70);
      int v48 = (_DWORD *)newchunk(a1, 40);
      if (v47)
      {
        *int v48 = 96;
        v48[6] = *(_DWORD *)(a3 + 16);
        v49 = v47;
        do
        {
          uint64_t v50 = v49;
          v49 = (_DWORD *)*((void *)v49 + 4);
        }
        while (v49);
        *((void *)v50 + 4) = v48;
        v51 = (_DWORD *)newchunk(a1, 40);
        _DWORD *v51 = 12;
        v52 = v47;
        do
        {
          uint64_t v53 = v52;
          v52 = (_DWORD *)*((void *)v52 + 4);
        }
        while (v52);
        *((void *)v53 + 4) = v51;
        v54 = (_DWORD *)newchunk(a1, 40);
        _DWORD *v54 = 7;
        size_t v55 = v47;
        do
        {
          v56 = v55;
          size_t v55 = (_DWORD *)*((void *)v55 + 4);
        }
        while (v55);
        *((void *)v56 + 4) = v54;
      }
      else
      {
        *int v48 = 97;
        v48[6] = *(_DWORD *)(a3 + 16);
        int v47 = v48;
      }
      v78 = (_DWORD *)newchunk(a1, 40);
      _DWORD *v78 = v9;
      v78[6] = a1[71];
      v79 = v47;
      do
      {
        v80 = v79;
        v79 = (_DWORD *)*((void *)v79 + 4);
      }
      while (v79);
      *((void *)v80 + 4) = v78;
      uint64_t v81 = *(void *)(a3 + 8);
      do
      {
        uint64_t v77 = v81;
        uint64_t v81 = *(void *)(v81 + 32);
      }
      while (v81);
      goto LABEL_80;
    case 2:
    case 3:
    case 4:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
      size_t v10 = gen_abs_offset_varpart(a1, a1 + 79);
      uint64_t v11 = (_DWORD *)newchunk(a1, 40);
      if (v10)
      {
        *uint64_t v11 = 96;
        v11[6] = *(_DWORD *)(a3 + 16);
        size_t v12 = v10;
        do
        {
          size_t v13 = v12;
          size_t v12 = (_DWORD *)*((void *)v12 + 4);
        }
        while (v12);
        *((void *)v13 + 4) = v11;
        size_t v14 = (_DWORD *)newchunk(a1, 40);
        *size_t v14 = 12;
        long long v15 = v10;
        do
        {
          size_t v16 = v15;
          long long v15 = (_DWORD *)*((void *)v15 + 4);
        }
        while (v15);
        *((void *)v16 + 4) = v14;
        size_t v17 = (_DWORD *)newchunk(a1, 40);
        *size_t v17 = 7;
        size_t v18 = v10;
        do
        {
          int v19 = v18;
          size_t v18 = (_DWORD *)*((void *)v18 + 4);
        }
        while (v18);
        *((void *)v19 + 4) = v17;
      }
      else
      {
        *uint64_t v11 = 97;
        v11[6] = *(_DWORD *)(a3 + 16);
        size_t v10 = v11;
      }
      size_t v38 = (_DWORD *)newchunk(a1, 40);
      *size_t v38 = v9;
      v38[6] = a1[98] + a1[80];
      size_t v39 = v10;
      do
      {
        size_t v40 = v39;
        size_t v39 = (_DWORD *)*((void *)v39 + 4);
      }
      while (v39);
      *((void *)v40 + 4) = v38;
      uint64_t v41 = *(void *)(a3 + 8);
      do
      {
        uint64_t v42 = v41;
        uint64_t v41 = *(void *)(v41 + 32);
      }
      while (v41);
      *(void *)(v42 + 32) = v10;
      size_t v36 = gen_proto_abbrev_internal(a1, a2);
      uint64_t v37 = *(void *)a3;
      if (*(void *)a3) {
        goto LABEL_35;
      }
      goto LABEL_36;
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 21:
    case 22:
    case 39:
      int v20 = gen_loadx_iphdrlen(a1);
      unsigned int v21 = (_DWORD *)newchunk(a1, 40);
      *unsigned int v21 = 96;
      v21[6] = *(_DWORD *)(a3 + 16);
      size_t v22 = v20;
      do
      {
        size_t v23 = v22;
        size_t v22 = (_DWORD *)*((void *)v22 + 4);
      }
      while (v22);
      *((void *)v23 + 4) = v21;
      BOOL v24 = (_DWORD *)newchunk(a1, 40);
      *BOOL v24 = 12;
      size_t v25 = v20;
      do
      {
        int v26 = v25;
        size_t v25 = (_DWORD *)*((void *)v25 + 4);
      }
      while (v25);
      *((void *)v26 + 4) = v24;
      size_t v27 = (_DWORD *)newchunk(a1, 40);
      *size_t v27 = 7;
      size_t v28 = v20;
      do
      {
        uint64_t v29 = v28;
        size_t v28 = (_DWORD *)*((void *)v28 + 4);
      }
      while (v28);
      *((void *)v29 + 4) = v27;
      size_t v30 = (_DWORD *)newchunk(a1, 40);
      *size_t v30 = v9;
      size_t v31 = v20;
      do
      {
        size_t v32 = v31;
        size_t v31 = (_DWORD *)*((void *)v31 + 4);
      }
      while (v31);
      *((void *)v32 + 4) = v30;
      v30[6] = a1[98] + a1[80];
      uint64_t v33 = *(void *)(a3 + 8);
      do
      {
        uint64_t v34 = v33;
        uint64_t v33 = *(void *)(v33 + 32);
      }
      while (v33);
      *(void *)(v34 + 32) = v20;
      size_t v35 = gen_proto_abbrev_internal(a1, a2);
      size_t v36 = gen_ipfrag(a1);
      gen_and(v35, v36);
      if (*(void *)a3) {
        gen_and(*(void *)a3, v36);
      }
      uint64_t v37 = gen_linktype((uint64_t)a1, 2048);
LABEL_35:
      gen_and(v37, v36);
LABEL_36:
      *(void *)a3 = v36;
      goto LABEL_37;
    case 18:
      size_t v57 = gen_linktype((uint64_t)a1, 34525);
      if (*(void *)a3) {
        gen_and(*(void *)a3, v57);
      }
      *(void *)a3 = v57;
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 6, 16);
      size_t v59 = newchunk(a1, 288);
      *(_DWORD *)(v59 + 16) = 21;
      *(void *)(v59 + 152) = v59;
      *(void *)(v59 + 8) = absoffsetrel;
      *(_DWORD *)(v59 + 40) = 58;
      if (*(void *)a3) {
        gen_and(*(void *)a3, v59);
      }
      *(void *)a3 = v59;
      int v47 = gen_abs_offset_varpart(a1, a1 + 79);
      size_t v60 = (_DWORD *)newchunk(a1, 40);
      if (v47)
      {
        _DWORD *v60 = 96;
        v60[6] = *(_DWORD *)(a3 + 16);
        size_t v61 = v47;
        do
        {
          v62 = v61;
          size_t v61 = (_DWORD *)*((void *)v61 + 4);
        }
        while (v61);
        *((void *)v62 + 4) = v60;
        v63 = (_DWORD *)newchunk(a1, 40);
        _DWORD *v63 = 12;
        v64 = v47;
        do
        {
          v65 = v64;
          v64 = (_DWORD *)*((void *)v64 + 4);
        }
        while (v64);
        *((void *)v65 + 4) = v63;
        v66 = (_DWORD *)newchunk(a1, 40);
        _DWORD *v66 = 7;
        v67 = v47;
        do
        {
          v68 = v67;
          v67 = (_DWORD *)*((void *)v67 + 4);
        }
        while (v67);
        *((void *)v68 + 4) = v66;
      }
      else
      {
        _DWORD *v60 = 97;
        v60[6] = *(_DWORD *)(a3 + 16);
        int v47 = v60;
      }
      v82 = (_DWORD *)newchunk(a1, 40);
      _DWORD *v82 = v9;
      v82[6] = a1[80] + a1[98] + 40;
      v83 = v47;
      do
      {
        v84 = v83;
        v83 = (_DWORD *)*((void *)v83 + 4);
      }
      while (v83);
      *((void *)v84 + 4) = v82;
      uint64_t v85 = *(void *)(a3 + 8);
      do
      {
        uint64_t v77 = v85;
        uint64_t v85 = *(void *)(v85 + 32);
      }
      while (v85);
      goto LABEL_80;
    case 38:
      unsigned int v69 = a1[57] - 119;
      BOOL v70 = v69 > 0x2C;
      uint64_t v71 = (1 << v69) & 0x100000000101;
      if (v70 || v71 == 0) {
        bpf_error((uint64_t)a1, "radio information not present in capture");
      }
      int v47 = (_DWORD *)newchunk(a1, 40);
      *int v47 = 97;
      v47[6] = *(_DWORD *)(a3 + 16);
      v73 = (_DWORD *)newchunk(a1, 40);
      _DWORD *v73 = v9;
      uint64_t v74 = v47;
      do
      {
        uint64_t v75 = v74;
        uint64_t v74 = (_DWORD *)*((void *)v74 + 4);
      }
      while (v74);
      *((void *)v75 + 4) = v73;
      uint64_t v76 = *(void *)(a3 + 8);
      do
      {
        uint64_t v77 = v76;
        uint64_t v76 = *(void *)(v76 + 32);
      }
      while (v76);
LABEL_80:
      *(void *)(v77 + 32) = v47;
LABEL_37:
      *(_DWORD *)(a3 + 16) = v8;
      size_t v43 = (_DWORD *)newchunk(a1, 40);
      *size_t v43 = 2;
      v43[6] = v8;
      uint64_t v44 = *(void *)(a3 + 8);
      do
      {
        uint64_t v45 = v44;
        uint64_t v44 = *(void *)(v44 + 32);
      }
      while (v44);
      *(void *)(v45 + 32) = v43;
      return a3;
    default:
      bpf_error((uint64_t)a1, "unsupported index operation");
  }
}

size_t gen_relation(int *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  if (setjmp(a1)) {
    return 0;
  }
  else {
    return gen_relation_internal(a1, a2, a3, a4, a5);
  }
}

size_t gen_relation_internal(int *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  size_t v10 = (_DWORD *)newchunk(a1, 40);
  *size_t v10 = 97;
  v10[6] = *(_DWORD *)(a4 + 16);
  uint64_t v11 = (_DWORD *)newchunk(a1, 40);
  *uint64_t v11 = 96;
  v11[6] = *(_DWORD *)(a3 + 16);
  if (a2 != 16)
  {
    int v16 = a2 | 0xD;
    size_t v13 = newchunk(a1, 288);
    *(_DWORD *)(v13 + 16) = v16;
    *(void *)(v13 + 152) = v13;
    if (!a5) {
      goto LABEL_8;
    }
LABEL_7:
    *(_DWORD *)(v13 + 68) = *(_DWORD *)(v13 + 68) == 0;
    goto LABEL_8;
  }
  size_t v12 = (_DWORD *)newchunk(a1, 40);
  *size_t v12 = 28;
  size_t v13 = newchunk(a1, 288);
  *(_DWORD *)(v13 + 16) = 21;
  *(void *)(v13 + 152) = v13;
  size_t v14 = v11;
  do
  {
    long long v15 = v14;
    size_t v14 = (_DWORD *)*((void *)v14 + 4);
  }
  while (v14);
  *((void *)v15 + 4) = v12;
  if (a5) {
    goto LABEL_7;
  }
LABEL_8:
  size_t v17 = v10;
  do
  {
    size_t v18 = v17;
    size_t v17 = (_DWORD *)*((void *)v17 + 4);
  }
  while (v17);
  *((void *)v18 + 4) = v11;
  uint64_t v19 = *(void *)(a4 + 8);
  uint64_t v20 = v19;
  do
  {
    uint64_t v21 = v20;
    uint64_t v20 = *(void *)(v20 + 32);
  }
  while (v20);
  *(void *)(v21 + 32) = v10;
  uint64_t v22 = *(void *)(a3 + 8);
  uint64_t v23 = v22;
  do
  {
    uint64_t v24 = v23;
    uint64_t v23 = *(void *)(v23 + 32);
  }
  while (v23);
  *(void *)(v24 + 32) = v19;
  a1[*(int *)(a3 + 16) + 100] = 0;
  *(void *)(v13 + 8) = v22;
  a1[*(int *)(a4 + 16) + 100] = 0;
  uint64_t v25 = *(void *)a4;
  if (*(void *)a3)
  {
    if (v25) {
      gen_and(*(void *)a3, v25);
    }
    else {
      uint64_t v25 = *(void *)a3;
    }
  }
  else if (!v25)
  {
    return v13;
  }
  gen_and(v25, v13);
  return v13;
}

size_t gen_loadlen(int *a1)
{
  if (setjmp(a1)) {
    return 0;
  }
  int v3 = alloc_reg((uint64_t)a1);
  size_t v4 = newchunk(a1, 24);
  size_t v5 = newchunk(a1, 40);
  *(_DWORD *)size_t v5 = 128;
  int v6 = (_DWORD *)newchunk(a1, 40);
  *int v6 = 2;
  *(void *)(v5 + 32) = v6;
  v6[6] = v3;
  *(void *)(v4 + 8) = v5;
  size_t result = v4;
  *(_DWORD *)(v4 + 16) = v3;
  return result;
}

uint64_t alloc_reg(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 464);
  for (int i = -16; ; ++i)
  {
    uint64_t v3 = a1 + 4 * v1;
    if (!*(_DWORD *)(v3 + 400)) {
      break;
    }
    int v4 = v1 + 1;
    BOOL v5 = -v4 < 0;
    int v6 = -v4 & 0xF;
    int v1 = v4 & 0xF;
    if (!v5) {
      int v1 = -v6;
    }
    *(_DWORD *)(a1 + 464) = v1;
    if (__CFADD__(i, 1)) {
      bpf_error(a1, "too many registers needed to evaluate expression");
    }
  }
  *(_DWORD *)(v3 + 400) = 1;
  return *(unsigned int *)(a1 + 464);
}

size_t newchunk(int *a1, uint64_t a2)
{
  size_t result = newchunk_nolongjmp((uint64_t)a1, a2);
  if (!result) {
    longjmp(a1, 1);
  }
  return result;
}

size_t gen_loadi(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  else {
    return gen_loadi_internal(a1, a2);
  }
}

size_t gen_loadi_internal(int *a1, int a2)
{
  size_t v4 = newchunk(a1, 24);
  int v5 = alloc_reg((uint64_t)a1);
  size_t v6 = newchunk(a1, 40);
  *(_DWORD *)size_t v6 = 0;
  *(_DWORD *)(v6 + 24) = a2;
  uint64_t v7 = (_DWORD *)newchunk(a1, 40);
  *uint64_t v7 = 2;
  *(void *)(v6 + 32) = v7;
  v7[6] = v5;
  *(void *)(v4 + 8) = v6;
  *(_DWORD *)(v4 + 16) = v5;
  return v4;
}

uint64_t gen_neg(int *a1, uint64_t a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  int v5 = (_DWORD *)newchunk(a1, 40);
  *int v5 = 96;
  v5[6] = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 8);
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = *(void *)(v6 + 32);
  }
  while (v6);
  *(void *)(v7 + 32) = v5;
  int v8 = (_DWORD *)newchunk(a1, 40);
  *int v8 = 132;
  v8[6] = 0;
  uint64_t v9 = *(void *)(a2 + 8);
  do
  {
    uint64_t v10 = v9;
    uint64_t v9 = *(void *)(v9 + 32);
  }
  while (v9);
  *(void *)(v10 + 32) = v8;
  uint64_t v11 = (_DWORD *)newchunk(a1, 40);
  *uint64_t v11 = 2;
  v11[6] = *(_DWORD *)(a2 + 16);
  uint64_t v12 = *(void *)(a2 + 8);
  do
  {
    uint64_t v13 = v12;
    uint64_t v12 = *(void *)(v12 + 32);
  }
  while (v12);
  *(void *)(v13 + 32) = v11;
  return a2;
}

uint64_t gen_arth(int *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a2 == 144)
  {
    uint64_t v10 = *(_DWORD **)(a4 + 8);
    if (!*v10 && !v10[6]) {
      bpf_error((uint64_t)a1, "modulus by zero");
    }
  }
  else if (a2 == 48)
  {
    uint64_t v9 = *(_DWORD **)(a4 + 8);
    if (!*v9 && !v9[6]) {
      bpf_error((uint64_t)a1, "division by zero");
    }
  }
  else if ((a2 & 0xFFFFFFEF) == 0x60)
  {
    uint64_t v11 = *(_DWORD **)(a4 + 8);
    if (!*v11 && v11[6] >= 0x20u) {
      bpf_error((uint64_t)a1, "shift by more than 31 bits");
    }
  }
  uint64_t v12 = (_DWORD *)newchunk(a1, 40);
  *uint64_t v12 = 97;
  v12[6] = *(_DWORD *)(a4 + 16);
  uint64_t v13 = v12;
  size_t v14 = (_DWORD *)newchunk(a1, 40);
  *size_t v14 = 96;
  v14[6] = *(_DWORD *)(a3 + 16);
  long long v15 = v14;
  int v16 = (_DWORD *)newchunk(a1, 40);
  *int v16 = a2 | 0xC;
  size_t v17 = v15;
  do
  {
    size_t v18 = v17;
    size_t v17 = (_DWORD *)*((void *)v17 + 4);
  }
  while (v17);
  *((void *)v18 + 4) = v16;
  uint64_t v19 = v13;
  do
  {
    uint64_t v20 = v19;
    uint64_t v19 = (_DWORD *)*((void *)v19 + 4);
  }
  while (v19);
  *((void *)v20 + 4) = v15;
  uint64_t v21 = *(void *)(a4 + 8);
  uint64_t v22 = v21;
  do
  {
    uint64_t v23 = v22;
    uint64_t v22 = *(void *)(v22 + 32);
  }
  while (v22);
  *(void *)(v23 + 32) = v13;
  uint64_t v24 = *(void *)(a3 + 8);
  do
  {
    uint64_t v25 = v24;
    uint64_t v24 = *(void *)(v24 + 32);
  }
  while (v24);
  *(void *)(v25 + 32) = v21;
  a1[*(int *)(a3 + 16) + 100] = 0;
  a1[*(int *)(a4 + 16) + 100] = 0;
  int v26 = (_DWORD *)newchunk(a1, 40);
  *int v26 = 2;
  int v27 = alloc_reg((uint64_t)a1);
  v26[6] = v27;
  *(_DWORD *)(a3 + 16) = v27;
  uint64_t v28 = *(void *)(a3 + 8);
  do
  {
    uint64_t v29 = v28;
    uint64_t v28 = *(void *)(v28 + 32);
  }
  while (v28);
  *(void *)(v29 + 32) = v26;
  return a3;
}

size_t gen_greater(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  int v5 = (_DWORD *)newchunk(a1, 40);
  *int v5 = 128;
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 53;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = v5;
  *(_DWORD *)(result + 40) = a2;
  return result;
}

size_t gen_less(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  int v5 = (_DWORD *)newchunk(a1, 40);
  *int v5 = 128;
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 37;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = v5;
  *(_DWORD *)(result + 40) = a2;
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
  return result;
}

size_t gen_byteop(int *a1, int a2, int a3, int a4)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a2 > 60)
  {
    switch(a2)
    {
      case '=':
        absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, a3, 16);
        size_t result = newchunk(a1, 288);
        int v13 = 21;
        break;
      case '>':
        absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, a3, 16);
        size_t result = newchunk(a1, 288);
        int v13 = 37;
        break;
      case '|':
        uint64_t v9 = (_DWORD *)newchunk(a1, 40);
        int v10 = 68;
LABEL_15:
        *uint64_t v9 = v10;
        size_t v14 = v9;
        v9[6] = a4;
        size_t result = newchunk(a1, 288);
        *(_DWORD *)(result + 16) = 21;
        *(void *)(result + 152) = result;
        *(void *)(result + 8) = v14;
        goto LABEL_16;
      default:
        goto LABEL_17;
    }
    *(_DWORD *)(result + 16) = v13;
    *(void *)(result + 152) = result;
    *(void *)(result + 8) = absoffsetrel;
    *(_DWORD *)(result + 40) = a4;
    return result;
  }
  if (a2 == 38)
  {
    uint64_t v9 = (_DWORD *)newchunk(a1, 40);
    int v10 = 84;
    goto LABEL_15;
  }
  if (a2 != 60) {
LABEL_17:
  }
    abort();
  uint64_t v11 = gen_load_absoffsetrel(a1, a1 + 70, a3, 16);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 53;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = v11;
  *(_DWORD *)(result + 40) = a4;
LABEL_16:
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
  return result;
}

size_t gen_broadcast(int *a1, unsigned int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a2 >= 2)
  {
    if (a2 != 2) {
      bpf_error((uint64_t)a1, "only link-layer/IP broadcast filters supported");
    }
    if (a1[60] == -1) {
      bpf_error((uint64_t)a1, "netmask not known, so 'ip broadcast' not supported");
    }
    size_t v7 = gen_linktype((uint64_t)a1, 2048);
    int v8 = ~a1[60];
    size_t v9 = gen_ncmp(a1, 6, 16, 0, v8, 16, 0, 0);
    size_t v10 = gen_ncmp(a1, 6, 16, 0, v8, 16, 0, v8);
    gen_or(v9, v10);
    gen_and(v7, v10);
    return v10;
  }
  int v5 = a1[57];
  if (v5 <= 104)
  {
    switch(v5)
    {
      case 1:
        goto LABEL_17;
      case 6:
        goto LABEL_20;
      case 7:
        goto LABEL_21;
      case 10:
        int v14 = a1[64] + 1;
        int v13 = gen_broadcast_ebroadcast;
        goto LABEL_23;
      default:
        goto LABEL_26;
    }
  }
  uint64_t v6 = (v5 - 105);
  if (v6 <= 0x3A)
  {
    if (((1 << (v5 - 105)) & 0x400000000404001) != 0) {
      return gen_wlanhostop(a1, gen_broadcast_ebroadcast, 2);
    }
    if (v6 == 17)
    {
LABEL_20:
      int v13 = gen_broadcast_ebroadcast;
      int v14 = 2;
LABEL_23:
      unsigned int v16 = 6;
      long long v15 = a1;
    }
    else
    {
      if (v6 != 24) {
        goto LABEL_9;
      }
LABEL_21:
      int v13 = (unsigned __int8 *)&unk_20D914A28;
      long long v15 = a1;
      int v14 = 1;
      unsigned int v16 = 1;
    }
    return gen_bcmp(v15, 1, v14, v16, v13);
  }
LABEL_9:
  if ((v5 - 240) >= 2)
  {
    if (v5 != 192) {
LABEL_26:
    }
      bpf_error((uint64_t)a1, "not a broadcast link");
    return gen_wlanhostop(a1, gen_broadcast_ebroadcast, 2);
  }
LABEL_17:
  size_t v11 = gen_prevlinkhdr_check(a1);
  size_t v12 = gen_bcmp(a1, 1, 0, 6u, gen_broadcast_ebroadcast);
  if (v11) {
    gen_and(v11, v12);
  }
  return v12;
}

size_t gen_linktype(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 248))
  {
    if (a2 == 34525)
    {
      size_t v4 = gen_ncmp((int *)a1, 6, -2, 16, 1, 16, 0, 1);
      int v5 = (int *)a1;
      int v6 = 96;
    }
    else
    {
      if (a2 != 2048) {
        bpf_error(a1, "unsupported protocol over mpls");
      }
      size_t v4 = gen_ncmp((int *)a1, 6, -2, 16, 1, 16, 0, 1);
      int v5 = (int *)a1;
      int v6 = 64;
    }
    size_t v13 = gen_ncmp(v5, 6, 0, 16, 240, 16, 0, v6);
LABEL_13:
    size_t v14 = v13;
LABEL_14:
    gen_and(v4, v14);
    return v14;
  }
  else
  {
    int v7 = *(_DWORD *)(a1 + 228);
    if (v7 <= 103)
    {
      switch(v7)
      {
        case 0:
LABEL_25:
          if (a2 == 34525)
          {
            if (*(void *)(*(void *)(a1 + 192) + 64))
            {
              size_t v30 = gen_loopback_linktype(a1, 0x18u);
              size_t v14 = gen_loopback_linktype(a1, 0x1Cu);
              gen_or(v30, v14);
              size_t v31 = gen_loopback_linktype(a1, 0x1Eu);
              goto LABEL_89;
            }
            uint64_t v16 = a1;
            unsigned int v17 = 30;
          }
          else
          {
            if (a2 != 2048) {
              goto LABEL_75;
            }
            uint64_t v16 = a1;
            unsigned int v17 = 2;
          }
          return gen_loopback_linktype(v16, v17);
        case 1:
LABEL_28:
          if (*(_DWORD *)(a1 + 344))
          {
            return gen_ether_linktype((int *)a1, a2);
          }
          size_t v4 = gen_prevlinkhdr_check((int *)a1);
          size_t v14 = gen_ether_linktype((int *)a1, a2);
          if (v4) {
            goto LABEL_14;
          }
          return v14;
        case 2:
        case 3:
        case 4:
        case 5:
        case 13:
        case 14:
        case 17:
          goto LABEL_94;
        case 6:
        case 10:
        case 11:
        case 19:
LABEL_17:
          return gen_llc_linktype((int *)a1, a2);
        case 7:
LABEL_34:
          if (a2 > 32820)
          {
            switch(a2)
            {
              case 32821:
                uint64_t v20 = (int *)a1;
                int v21 = 5;
                int v22 = 0;
                int v23 = 16;
                int v24 = 214;
                break;
              case 32923:
                uint64_t v20 = (int *)a1;
                int v21 = 5;
                int v22 = 0;
                int v23 = 16;
                int v24 = 221;
                break;
              case 34525:
                uint64_t v20 = (int *)a1;
                int v21 = 5;
                int v22 = 0;
                int v23 = 16;
                int v24 = 196;
                break;
              default:
                goto LABEL_75;
            }
            break;
          }
          if (a2 == 2048)
          {
            size_t v26 = gen_cmp((int *)a1, 5, 0, 16, 212);
            int v27 = (int *)a1;
            int v28 = 16;
            int v29 = 240;
          }
          else
          {
            if (a2 != 2054) {
              goto LABEL_75;
            }
            size_t v26 = gen_cmp((int *)a1, 5, 0, 16, 213);
            int v27 = (int *)a1;
            int v28 = 16;
            int v29 = 241;
          }
          goto LABEL_87;
        case 8:
        case 12:
        case 15:
          if (a2 == 34525)
          {
            int v8 = (int *)a1;
            int v9 = 16;
            int v10 = 240;
            int v11 = 96;
          }
          else
          {
            if (a2 != 2048)
            {
LABEL_75:
              return gen_false((int *)a1);
            }
            int v8 = (int *)a1;
            int v9 = 16;
            int v10 = 240;
            int v11 = 64;
          }
LABEL_8:
          return gen_ncmp(v8, 1, 0, v9, v10, 16, 0, v11);
        case 9:
          goto LABEL_33;
        case 16:
          if (a2 != 2048)
          {
            int v24 = ethertype_to_ppptype(a2);
LABEL_79:
            uint64_t v20 = (int *)a1;
            int v21 = 5;
            int v22 = 0;
            int v23 = 8;
            break;
          }
          size_t v25 = gen_cmp((int *)a1, 5, 0, 8, 33);
          size_t v26 = gen_cmp((int *)a1, 5, 0, 8, 45);
          gen_or(v25, v26);
          int v27 = (int *)a1;
          int v28 = 8;
          int v29 = 47;
LABEL_87:
          size_t v14 = gen_cmp(v27, 5, 0, v28, v29);
LABEL_88:
          size_t v31 = v26;
LABEL_89:
          gen_or(v31, v14);
          return v14;
        case 18:
          bpf_error(a1, "PFSYNC link-layer type filtering not implemented");
        default:
          if ((v7 - 50) < 2)
          {
LABEL_33:
            int v18 = ethertype_to_ppptype(a2);
            absoffsetrel = gen_load_absoffsetrel((int *)a1, (_DWORD *)(a1 + 328), 0, 8);
            size_t v14 = newchunk((int *)a1, 288);
            *(_DWORD *)(v14 + 16) = 21;
            *(void *)(v14 + 152) = v14;
            *(void *)(v14 + 8) = absoffsetrel;
            *(_DWORD *)(v14 + 40) = v18;
            return v14;
          }
LABEL_94:
          if (*(_DWORD *)(a1 + 332) == -1)
          {
            pcap_datalink_val_to_description_or_dlt(v7);
            bpf_error(a1, "%s link-layer type filtering not implemented");
          }
          uint64_t v20 = (int *)a1;
          int v21 = 5;
          int v22 = 0;
          int v23 = 8;
          int v24 = a2;
          break;
      }
    }
    else
    {
      switch(v7)
      {
        case 104:
          if (a2 == 254) {
            int v24 = 65278;
          }
          else {
            int v24 = a2;
          }
          goto LABEL_79;
        case 105:
        case 119:
        case 127:
        case 163:
        case 192:
          size_t v15 = gen_check_802_11_data_frame((int *)a1);
          goto LABEL_21;
        case 106:
        case 110:
        case 111:
        case 112:
        case 115:
        case 116:
        case 118:
        case 120:
        case 121:
        case 124:
        case 125:
        case 126:
        case 128:
        case 138:
        case 141:
        case 142:
        case 145:
        case 146:
        case 147:
        case 148:
        case 149:
        case 150:
        case 151:
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 169:
        case 170:
        case 171:
        case 172:
        case 173:
        case 174:
        case 175:
        case 176:
        case 184:
        case 185:
        case 188:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 216:
        case 217:
        case 218:
        case 219:
        case 221:
        case 222:
        case 223:
        case 224:
        case 225:
        case 231:
        case 235:
        case 236:
        case 237:
        case 242:
        case 243:
        case 244:
        case 245:
        case 246:
        case 247:
        case 248:
          goto LABEL_94;
        case 107:
          switch(a2)
          {
            case 254:
              size_t v26 = gen_cmp((int *)a1, 1, 2, 8, 897);
              size_t v33 = gen_cmp((int *)a1, 1, 2, 8, 898);
              size_t v14 = gen_cmp((int *)a1, 1, 2, 8, 899);
              gen_or(v33, v14);
              goto LABEL_88;
            case 34525:
              uint64_t v20 = (int *)a1;
              int v21 = 1;
              int v22 = 2;
              int v23 = 8;
              int v24 = 910;
              break;
            case 2048:
              uint64_t v20 = (int *)a1;
              int v21 = 1;
              int v22 = 2;
              int v23 = 8;
              int v24 = 972;
              break;
            default:
              goto LABEL_75;
          }
          break;
        case 108:
        case 109:
          goto LABEL_25;
        case 113:
          return gen_linux_sll_linktype((int *)a1, a2);
        case 114:
          int v32 = 32923;
          goto LABEL_68;
        case 117:
          if (a2 == 34525)
          {
            uint64_t v20 = (int *)a1;
            int v21 = 1;
            int v22 = 1;
            int v23 = 16;
            int v24 = 30;
          }
          else
          {
            if (a2 != 2048) {
              goto LABEL_75;
            }
            uint64_t v20 = (int *)a1;
            int v21 = 1;
            int v22 = 1;
            int v23 = 16;
            int v24 = 2;
          }
          break;
        case 122:
          goto LABEL_17;
        case 123:
          size_t v15 = gen_atmfield_code_internal((int *)a1, 53, 2, 16, 0);
LABEL_21:
          size_t v4 = v15;
          size_t v13 = gen_llc_linktype((int *)a1, a2);
          goto LABEL_13;
        case 129:
          goto LABEL_34;
        case 130:
        case 131:
        case 132:
        case 133:
        case 134:
        case 135:
        case 136:
        case 137:
        case 164:
        case 167:
        case 168:
        case 178:
        case 179:
        case 180:
        case 181:
        case 183:
        case 194:
        case 200:
        case 232:
        case 233:
        case 234:
        case 238:
          int v8 = (int *)a1;
          int v9 = 0;
          int v10 = -256;
          int v11 = 1296515840;
          goto LABEL_8;
        case 139:
        case 140:
          bpf_error(a1, "MTP2 link-layer type filtering not implemented");
        case 143:
          bpf_error(a1, "DOCSIS link-layer type filtering not implemented");
        case 144:
          bpf_error(a1, "IrDA link-layer type filtering not implemented");
        case 165:
          int v8 = (int *)a1;
          int v9 = 0;
          int v10 = -65536;
          int v11 = 1442775040;
          goto LABEL_8;
        case 166:
          goto LABEL_33;
        case 177:
          bpf_error(a1, "LAPD link-layer type filtering not implemented");
        case 182:
          bpf_error(a1, "Multi-link Frame Relay link-layer type filtering not implemented");
        case 186:
        case 189:
        case 220:
        case 249:
          bpf_error(a1, "USB link-layer type filtering not implemented");
        case 187:
        case 201:
          bpf_error(a1, "Bluetooth link-layer type filtering not implemented");
        case 190:
        case 227:
          bpf_error(a1, "CAN link-layer type filtering not implemented");
        case 191:
        case 195:
        case 215:
        case 230:
          goto LABEL_100;
        case 193:
          bpf_error(a1, "IEEE 802.16 link-layer type filtering not implemented");
        case 196:
          bpf_error(a1, "SITA link-layer type filtering not implemented");
        case 197:
          bpf_error(a1, "ERF link-layer type filtering not implemented");
        case 198:
          bpf_error(a1, "RAIF1 link-layer type filtering not implemented");
        case 199:
        case 209:
          bpf_error(a1, "IPMB link-layer type filtering not implemented");
        case 202:
          bpf_error(a1, "AX.25 link-layer type filtering not implemented");
        case 226:
          return gen_ipnet_linktype((int *)a1, a2);
        case 228:
          if (a2 != 2048) {
            goto LABEL_75;
          }
          goto LABEL_69;
        case 229:
          int v32 = 34525;
LABEL_68:
          if (a2 != v32) {
            goto LABEL_75;
          }
LABEL_69:
          return gen_true((int *)a1);
        case 239:
          bpf_error(a1, "NFLOG link-layer type filtering not implemented");
        case 240:
        case 241:
          goto LABEL_28;
        default:
          if (v7 == 283) {
LABEL_100:
          }
            bpf_error(a1, "IEEE 802.15.4 link-layer type filtering not implemented");
          goto LABEL_94;
      }
    }
    return gen_cmp(v20, v21, v22, v23, v24);
  }
}

size_t gen_multicast(int *a1, unsigned int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a2 >= 2)
  {
    if (a2 == 2)
    {
      size_t v5 = gen_linktype((uint64_t)a1, 2048);
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 16, 16);
      size_t v7 = newchunk(a1, 288);
      uint64_t v8 = v7;
      size_t v9 = v7;
      *(_DWORD *)(v7 + 16) = 53;
      *(void *)(v7 + 152) = v7;
      *(void *)(v7 + 8) = absoffsetrel;
      int v10 = 224;
      goto LABEL_12;
    }
    if (a2 == 17)
    {
      size_t v5 = gen_linktype((uint64_t)a1, 34525);
      int v6 = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 24, 16);
      size_t v7 = newchunk(a1, 288);
      uint64_t v8 = v7;
      size_t v9 = v7;
      *(_DWORD *)(v7 + 16) = 21;
      *(void *)(v7 + 152) = v7;
      *(void *)(v7 + 8) = v6;
      int v10 = 255;
LABEL_12:
      *(_DWORD *)(v7 + 40) = v10;
      uint64_t v30 = v5;
      goto LABEL_13;
    }
LABEL_26:
    bpf_error((uint64_t)a1, "link-layer multicast filters supported only on ethernet/FDDI/token ring/ARCNET/802.11/ATM LANE/Fibre Channel");
  }
  int v11 = a1[57];
  if (v11 <= 104)
  {
    switch(v11)
    {
      case 1:
        goto LABEL_21;
      case 6:
        goto LABEL_23;
      case 7:
        return gen_bcmp(a1, 1, 1, 1u, (unsigned __int8 *)&unk_20D914A28);
      case 10:
        int v31 = 1;
        return gen_mac_multicast(a1, v31);
      default:
        goto LABEL_26;
    }
  }
  uint64_t v12 = (v11 - 105);
  if (v12 > 0x3A) {
    goto LABEL_20;
  }
  if (((1 << (v11 - 105)) & 0x400000000404001) != 0) {
    goto LABEL_10;
  }
  if (v12 != 17)
  {
    if (v12 == 24) {
      return gen_bcmp(a1, 1, 1, 1u, (unsigned __int8 *)&unk_20D914A28);
    }
LABEL_20:
    if ((v11 - 240) < 2)
    {
LABEL_21:
      size_t v32 = gen_prevlinkhdr_check(a1);
      size_t v33 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
      size_t v9 = newchunk(a1, 288);
      *(_DWORD *)(v9 + 16) = 69;
      *(void *)(v9 + 152) = v9;
      *(_DWORD *)(v9 + 40) = 1;
      *(void *)(v9 + 8) = v33;
      if (!v32) {
        return v9;
      }
      uint64_t v30 = v32;
      uint64_t v8 = v9;
LABEL_13:
      gen_and(v30, v8);
      return v9;
    }
    if (v11 != 192) {
      goto LABEL_26;
    }
LABEL_10:
    size_t v13 = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
    size_t v14 = newchunk(a1, 288);
    *(_DWORD *)(v14 + 16) = 69;
    *(void *)(v14 + 152) = v14;
    *(_DWORD *)(v14 + 40) = 1;
    *(void *)(v14 + 8) = v13;
    size_t v15 = gen_load_absoffsetrel(a1, a1 + 70, 16, 16);
    size_t v16 = newchunk(a1, 288);
    *(_DWORD *)(v16 + 16) = 69;
    *(void *)(v16 + 152) = v16;
    *(_DWORD *)(v16 + 40) = 1;
    *(void *)(v16 + 8) = v15;
    gen_and(v14, v16);
    unsigned int v17 = gen_load_absoffsetrel(a1, a1 + 70, 1, 16);
    size_t v18 = newchunk(a1, 288);
    *(_DWORD *)(v18 + 16) = 69;
    *(void *)(v18 + 152) = v18;
    *(_DWORD *)(v18 + 40) = 1;
    *(void *)(v18 + 8) = v17;
    *(_DWORD *)(v18 + 68) = *(_DWORD *)(v18 + 68) == 0;
    uint64_t v19 = gen_load_absoffsetrel(a1, a1 + 70, 4, 16);
    size_t v20 = newchunk(a1, 288);
    *(_DWORD *)(v20 + 16) = 69;
    *(void *)(v20 + 152) = v20;
    *(_DWORD *)(v20 + 40) = 1;
    *(void *)(v20 + 8) = v19;
    gen_and(v18, v20);
    gen_or(v20, v16);
    int v21 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
    size_t v22 = newchunk(a1, 288);
    *(_DWORD *)(v22 + 16) = 69;
    *(void *)(v22 + 152) = v22;
    *(_DWORD *)(v22 + 40) = 8;
    *(void *)(v22 + 8) = v21;
    gen_and(v22, v16);
    int v23 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
    size_t v24 = newchunk(a1, 288);
    *(_DWORD *)(v24 + 16) = 69;
    *(void *)(v24 + 152) = v24;
    *(_DWORD *)(v24 + 40) = 8;
    *(void *)(v24 + 8) = v23;
    *(_DWORD *)(v24 + 68) = *(_DWORD *)(v24 + 68) == 0;
    size_t v25 = gen_load_absoffsetrel(a1, a1 + 70, 4, 16);
    size_t v26 = newchunk(a1, 288);
    *(_DWORD *)(v26 + 16) = 69;
    *(void *)(v26 + 152) = v26;
    *(_DWORD *)(v26 + 40) = 1;
    *(void *)(v26 + 8) = v25;
    gen_and(v24, v26);
    gen_or(v26, v16);
    int v27 = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
    size_t v28 = newchunk(a1, 288);
    *(_DWORD *)(v28 + 16) = 69;
    *(void *)(v28 + 152) = v28;
    *(_DWORD *)(v28 + 40) = 4;
    *(void *)(v28 + 8) = v27;
    *(_DWORD *)(v28 + 68) = *(_DWORD *)(v28 + 68) == 0;
    gen_and(v28, v16);
    return v16;
  }
LABEL_23:
  int v31 = 2;
  return gen_mac_multicast(a1, v31);
}

size_t gen_mac_multicast(int *a1, int a2)
{
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, a2, 16);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 69;
  *(void *)(result + 152) = result;
  *(_DWORD *)(result + 40) = 1;
  *(void *)(result + 8) = absoffsetrel;
  return result;
}

size_t gen_ifindex(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  int v5 = a1[57];
  if (v5 != 276)
  {
    size_t v7 = pcap_datalink_val_to_description_or_dlt(v5);
    bpf_error((uint64_t)a1, "ifindex not supported on %s", v7);
  }
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, 4, 0);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 40) = a2;
  return result;
}

size_t gen_inbound(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  int v5 = a1[57];
  if (v5 <= 177)
  {
    uint64_t v6 = (v5 - 117);
    if (v6 > 0x33) {
      goto LABEL_14;
    }
    if (((1 << (v5 - 117)) & 0xC8000001FE000) == 0)
    {
      if (v5 == 117)
      {
        if (a2) {
          int v13 = 2;
        }
        else {
          int v13 = 1;
        }
        int v7 = 60;
        int v8 = 16;
        uint64_t v12 = a1;
        return gen_cmp(v12, 1, v7, v8, v13);
      }
      if (v6 == 49)
      {
        int v7 = 0;
        if (!a2)
        {
          int v8 = 16;
          uint64_t v12 = a1;
          int v13 = 0;
          return gen_cmp(v12, 1, v7, v8, v13);
        }
        int v8 = 16;
LABEL_20:
        uint64_t v12 = a1;
        int v13 = 1;
        return gen_cmp(v12, 1, v7, v8, v13);
      }
LABEL_14:
      if (v5 == 8)
      {
        size_t v14 = gen_loadi_internal(a1, 0);
        gen_load_internal(a1, 1, v14, 1);
        size_t v15 = gen_loadi_internal(a1, 0);
        return gen_relation_internal(a1, 16, v14, v15, a2);
      }
      if (v5 == 113)
      {
        int v10 = 0;
        int v11 = 8;
        goto LABEL_23;
      }
LABEL_33:
      size_t v16 = pcap_datalink_val_to_description_or_dlt(v5);
      bpf_error((uint64_t)a1, "inbound/outbound not supported on %s", v16);
    }
    return gen_ncmp(a1, 1, 3, 16, 1, 16, 0, a2 == 0);
  }
  uint64_t v9 = (v5 - 178);
  if (v9 <= 0x3C)
  {
    if (((1 << (v5 + 78)) & 0x11C000000041002FLL) != 0) {
      return gen_ncmp(a1, 1, 3, 16, 1, 16, 0, a2 == 0);
    }
    if (v9 == 48)
    {
      if (!a2)
      {
        int v8 = 8;
        int v7 = 2;
        uint64_t v12 = a1;
        int v13 = 2;
        return gen_cmp(v12, 1, v7, v8, v13);
      }
      int v7 = 2;
      int v8 = 8;
      goto LABEL_20;
    }
  }
  if (v5 != 276) {
    goto LABEL_33;
  }
  int v10 = 10;
  int v11 = 16;
LABEL_23:
  size_t result = gen_cmp(a1, 1, v10, v11, 4);
  if (!a2) {
    *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
  }
  return result;
}

size_t gen_pf_ifname(int *a1, char *a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a1[57] != 117) {
    bpf_error((uint64_t)a1, "ifname supported only on PF linktype");
  }
  size_t v5 = strlen(a2);
  if (v5 >= 0x10) {
    bpf_error((uint64_t)a1, "ifname interface names can only be %d characters");
  }
  return gen_bcmp(a1, 1, 4, v5, (unsigned __int8 *)a2);
}

size_t gen_bcmp(int *a1, int a2, int a3, unsigned int a4, unsigned __int8 *a5)
{
  unsigned int v5 = a4;
  if (a4 < 4)
  {
    size_t v13 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    int v9 = a3 - 4;
    uint64_t v10 = (uint64_t)&a5[a4 - 1];
    do
    {
      unsigned int v11 = bswap32(*(_DWORD *)(v10 - 3));
      a = gen_load_a(a1, a2, v9 + v5, 0);
      size_t v13 = newchunk(a1, 288);
      *(_DWORD *)(v13 + 16) = 21;
      *(void *)(v13 + 152) = v13;
      *(void *)(v13 + 8) = a;
      *(_DWORD *)(v13 + 40) = v11;
      if (v8) {
        gen_and(v8, v13);
      }
      v10 -= 4;
      v5 -= 4;
      uint64_t v8 = v13;
    }
    while (v5 > 3);
  }
  if (v5 >= 2)
  {
    uint64_t v14 = (uint64_t)&a5[v5 - 1];
    do
    {
      unsigned int v15 = __rev16(*(unsigned __int16 *)(v14 - 1));
      size_t v16 = gen_load_a(a1, a2, a3 - 2 + v5, 8);
      size_t v17 = newchunk(a1, 288);
      *(_DWORD *)(v17 + 16) = 21;
      *(void *)(v17 + 152) = v17;
      *(void *)(v17 + 8) = v16;
      *(_DWORD *)(v17 + 40) = v15;
      if (v13) {
        gen_and(v13, v17);
      }
      v14 -= 2;
      v5 -= 2;
      size_t v13 = v17;
    }
    while (v5 > 1);
    if (v5) {
      goto LABEL_14;
    }
    return v17;
  }
  size_t v17 = v13;
  if (!v5) {
    return v17;
  }
LABEL_14:
  int v18 = *a5;
  uint64_t v19 = gen_load_a(a1, a2, a3, 16);
  size_t v20 = newchunk(a1, 288);
  *(_DWORD *)(v20 + 16) = 21;
  *(void *)(v20 + 152) = v20;
  *(void *)(v20 + 8) = v19;
  *(_DWORD *)(v20 + 40) = v18;
  if (v17) {
    gen_and(v17, v20);
  }
  return v20;
}

size_t gen_pf_ruleset(int *a1, char *a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a1[57] != 117) {
    bpf_error((uint64_t)a1, "ruleset supported only on PF linktype");
  }
  size_t v5 = strlen(a2);
  if (v5 >= 0x10) {
    bpf_error((uint64_t)a1, "ruleset names can only be %ld characters");
  }
  return gen_bcmp(a1, 1, 20, v5, (unsigned __int8 *)a2);
}

size_t gen_pf_rnr(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a1[57] != 117) {
    bpf_error((uint64_t)a1, "rnr supported only on PF linktype");
  }
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, 36, 0);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 40) = a2;
  return result;
}

size_t gen_pf_srnr(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a1[57] != 117) {
    bpf_error((uint64_t)a1, "srnr supported only on PF linktype");
  }
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, 40, 0);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 40) = a2;
  return result;
}

size_t gen_pf_reason(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a1[57] != 117) {
    bpf_error((uint64_t)a1, "reason supported only on PF linktype");
  }
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, 3, 16);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 40) = a2;
  return result;
}

size_t gen_pf_action(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a1[57] != 117) {
    bpf_error((uint64_t)a1, "action supported only on PF linktype");
  }
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, 2, 16);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 40) = a2;
  return result;
}

size_t gen_p80211_type(int *a1, int a2, int a3)
{
  if (setjmp(a1)) {
    return 0;
  }
  if ((a1[57] - 105) > 0x3A || ((1 << (*((unsigned char *)a1 + 228) - 105)) & 0x400000000404001) == 0) {
    bpf_error((uint64_t)a1, "802.11 link-layer types supported only on 802.11");
  }
  return gen_ncmp(a1, 1, 0, 16, a3, 16, 0, a2);
}

size_t gen_p80211_fcdir(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if ((a1[57] - 105) > 0x3A || ((1 << (*((unsigned char *)a1 + 228) - 105)) & 0x400000000404001) == 0) {
    bpf_error((uint64_t)a1, "frame direction supported only with 802.11 headers");
  }
  return gen_ncmp(a1, 1, 1, 16, 3, 16, 0, a2);
}

size_t gen_acode(uint64_t a1, const char *a2, int a3)
{
  if (setjmp((int *)a1)) {
    return 0;
  }
  int v7 = *(_DWORD *)(a1 + 228);
  if (v7 != 129 && v7 != 7) {
    bpf_error(a1, "aid supported only on ARCnet");
  }
  if ((a3 & 0xFFFE) != 0x100) {
    bpf_error(a1, "ARCnet address used in non-arc expression");
  }
  int v9 = pcap_ether_aton(a2);
  *(void *)(a1 + 272) = v9;
  if (!v9) {
    bpf_error(a1, "malloc");
  }
  int v10 = BYTE2(a3);
  unsigned int v11 = v9;
  switch(v10)
  {
    case 0:
    case 3:
      size_t v12 = gen_bcmp((int *)a1, 1, 0, 1u, v9);
      size_t v13 = gen_bcmp((int *)a1, 1, 1, 1u, v11);
      gen_or(v12, v13);
      goto LABEL_16;
    case 1:
      int v14 = 0;
      unsigned int v15 = (int *)a1;
      goto LABEL_14;
    case 2:
      unsigned int v15 = (int *)a1;
      int v14 = 1;
LABEL_14:
      size_t v16 = gen_bcmp(v15, 1, v14, 1u, v11);
      break;
    case 4:
      size_t v17 = gen_bcmp((int *)a1, 1, 0, 1u, v9);
      size_t v13 = gen_bcmp((int *)a1, 1, 1, 1u, v11);
      gen_and(v17, v13);
LABEL_16:
      size_t v16 = v13;
      break;
    case 5:
      bpf_error(a1, "'addr1' and 'address1' are only supported on 802.11");
    case 6:
      bpf_error(a1, "'addr2' and 'address2' are only supported on 802.11");
    case 7:
      bpf_error(a1, "'addr3' and 'address3' are only supported on 802.11");
    case 8:
      bpf_error(a1, "'addr4' and 'address4' are only supported on 802.11");
    case 9:
      bpf_error(a1, "'ra' is only supported on 802.11");
    case 10:
      bpf_error(a1, "'ta' is only supported on 802.11");
    default:
      abort();
  }
  size_t v18 = v16;
  free(*(void **)(a1 + 272));
  *(void *)(a1 + 272) = 0;
  return v18;
}

size_t gen_vlan(int *a1, unsigned int a2, int a3)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a1[62]) {
    bpf_error((uint64_t)a1, "no VLAN match after MPLS");
  }
  int v7 = a1[57];
  if (((v7 - 105) > 0x3A || ((1 << (v7 - 105)) & 0x400000000404001) == 0)
    && (v7 - 240) >= 2
    && v7 != 1)
  {
    pcap_datalink_val_to_description_or_dlt(v7);
    bpf_error((uint64_t)a1, "no VLAN support for %s");
  }
  size_t result = gen_vlan_no_bpf_extensions(a1, a2, a3);
  ++a1[63];
  return result;
}

size_t gen_vlan_no_bpf_extensions(int *a1, unsigned int a2, int a3)
{
  size_t v6 = gen_linktype((uint64_t)a1, 33024);
  size_t v7 = gen_linktype((uint64_t)a1, 34984);
  gen_or(v6, v7);
  size_t v8 = gen_linktype((uint64_t)a1, 37120);
  gen_or(v7, v8);
  if (a3)
  {
    if (a2 >= 0x1000) {
      bpf_error((uint64_t)a1, "VLAN tag %u greater than maximum %u", a2, 4095);
    }
    size_t v9 = gen_ncmp(a1, 6, 0, 8, 4095, 16, 0, a2);
    gen_and(v8, v9);
    size_t v8 = v9;
  }
  a1[80] += 4;
  a1[83] += 4;
  return v8;
}

uint64_t gen_mpls(int32x2_t *a1, unsigned int a2, int a3)
{
  if (setjmp((int *)a1)) {
    return 0;
  }
  if (!a1[31].i32[0])
  {
    int v7 = a1[28].i32[1];
    if (v7 > 239)
    {
      if ((v7 - 240) > 1)
      {
LABEL_9:
        pcap_datalink_val_to_description_or_dlt(v7);
        bpf_error((uint64_t)a1, "no MPLS support for %s");
      }
    }
    else if (v7 != 1)
    {
      if (v7 == 9)
      {
        int v8 = 641;
        goto LABEL_13;
      }
      if (v7 != 104) {
        goto LABEL_9;
      }
    }
    int v8 = 34887;
LABEL_13:
    size_t v6 = gen_linktype((uint64_t)a1, v8);
    goto LABEL_14;
  }
  size_t v6 = gen_ncmp((int *)a1, 4, 2, 16, 1, 16, 0, 0);
LABEL_14:
  uint64_t v9 = v6;
  if (a3)
  {
    if (a2 >= 0x100000) {
      bpf_error((uint64_t)a1, "MPLS label %u greater than maximum %u");
    }
    size_t v10 = gen_ncmp((int *)a1, 6, 0, 0, -4096, 16, 0, a2 << 12);
    gen_and(v9, v10);
    uint64_t v9 = v10;
  }
  a1[49] = vadd_s32(a1[49], (int32x2_t)0x400000004);
  ++a1[31].i32[0];
  return v9;
}

size_t gen_pppoed(int *a1)
{
  if (setjmp(a1)) {
    return 0;
  }
  else {
    return gen_linktype((uint64_t)a1, 34915);
  }
}

size_t gen_pppoes(uint64_t a1, unsigned int a2, int a3)
{
  if (setjmp((int *)a1)) {
    return 0;
  }
  size_t v7 = gen_linktype(a1, 34916);
  if (a3)
  {
    if (a2 >= 0x10000) {
      bpf_error(a1, "PPPoE session number %u greater than maximum %u", a2, 0xFFFF);
    }
    size_t v8 = gen_ncmp((int *)a1, 6, 0, 0, 0xFFFF, 16, 0, a2);
    gen_and(v7, v8);
    size_t v7 = v8;
  }
  *(void *)(a1 + 292) = *(void *)(a1 + 280);
  int v9 = *(_DWORD *)(a1 + 228);
  *(_DWORD *)(a1 + 300) = *(_DWORD *)(a1 + 288);
  *(_DWORD *)(a1 + 228) = 9;
  *(_DWORD *)(a1 + 232) = v9;
  *(_DWORD *)(a1 + 280) = *(_DWORD *)(a1 + 316);
  int v10 = *(_DWORD *)(a1 + 392) + *(_DWORD *)(a1 + 320);
  *(_DWORD *)(a1 + 284) = v10 + 6;
  int v11 = *(_DWORD *)(a1 + 324);
  *(_DWORD *)(a1 + 288) = v11;
  *(_DWORD *)(a1 + 344) = 0;
  *(_DWORD *)(a1 + 336) = v11;
  *(void *)(a1 + 328) = *(void *)(a1 + 280);
  *(_DWORD *)(a1 + 320) = v10 + 8;
  *(void *)(a1 + 392) = 0;
  return v7;
}

size_t gen_geneve(uint64_t a1, unsigned int a2, int a3)
{
  if (setjmp((int *)a1)) {
    return 0;
  }
  size_t v7 = gen_geneve_check((int *)a1, (uint64_t (*)(int *, uint64_t, uint64_t, uint64_t))gen_port, 8, a2, a3);
  size_t v8 = gen_loadx_iphdrlen((int *)a1);
  int v9 = (_DWORD *)newchunk((int *)a1, 40);
  *int v9 = 135;
  int v10 = v8;
  do
  {
    int v11 = v10;
    int v10 = (_DWORD *)*((void *)v10 + 4);
  }
  while (v10);
  *((void *)v11 + 4) = v9;
  size_t v12 = newchunk((int *)a1, 288);
  *(_DWORD *)(v12 + 16) = 29;
  *(void *)(v12 + 152) = v12;
  *(void *)(v12 + 8) = v8;
  *(_DWORD *)(v12 + 40) = 0;
  gen_and(v7, v12);
  size_t v13 = gen_geneve_check((int *)a1, (uint64_t (*)(int *, uint64_t, uint64_t, uint64_t))gen_port6, 9, a2, a3);
  int v14 = gen_abs_offset_varpart((int *)a1, (_DWORD *)(a1 + 316));
  unsigned int v15 = (_DWORD *)newchunk((int *)a1, 40);
  *unsigned int v15 = 0;
  v15[6] = 40;
  if (v14)
  {
    size_t v16 = v14;
    do
    {
      size_t v17 = v16;
      size_t v16 = (_DWORD *)*((void *)v16 + 4);
    }
    while (v16);
    *((void *)v17 + 4) = v15;
    size_t v18 = (_DWORD *)newchunk((int *)a1, 40);
    *size_t v18 = 12;
    v18[6] = 0;
    uint64_t v19 = v14;
    do
    {
      size_t v20 = v19;
      uint64_t v19 = (_DWORD *)*((void *)v19 + 4);
    }
    while (v19);
    *((void *)v20 + 4) = v18;
    int v21 = v14;
  }
  else
  {
    int v21 = v15;
  }
  uint64_t v22 = v12;
  int v23 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v23 = 7;
  size_t v24 = v21;
  do
  {
    size_t v25 = v24;
    size_t v24 = (_DWORD *)*((void *)v24 + 4);
  }
  while (v24);
  *((void *)v25 + 4) = v23;
  size_t v26 = newchunk((int *)a1, 288);
  *(_DWORD *)(v26 + 16) = 29;
  *(void *)(v26 + 152) = v26;
  uint64_t v27 = v26;
  *(void *)(v26 + 8) = v21;
  *(_DWORD *)(v26 + 40) = 0;
  gen_and(v13, v26);
  gen_or(v22, v26);
  size_t v28 = (_DWORD *)newchunk((int *)a1, 40);
  *size_t v28 = 4;
  v28[6] = *(_DWORD *)(a1 + 320) + *(_DWORD *)(a1 + 392) + 8;
  int v29 = v28;
  uint64_t v30 = (_DWORD *)newchunk((int *)a1, 40);
  *uint64_t v30 = 7;
  int v31 = v29;
  do
  {
    size_t v32 = v31;
    int v31 = (_DWORD *)*((void *)v31 + 4);
  }
  while (v31);
  *((void *)v32 + 4) = v30;
  size_t v33 = (_DWORD *)newchunk((int *)a1, 40);
  *size_t v33 = 4;
  v33[6] = 2;
  uint64_t v34 = v29;
  do
  {
    size_t v35 = v34;
    uint64_t v34 = (_DWORD *)*((void *)v34 + 4);
  }
  while (v34);
  *((void *)v35 + 4) = v33;
  *(_DWORD *)(a1 + 336) = alloc_reg(a1);
  *(void *)(a1 + 328) = 1;
  size_t v36 = (_DWORD *)newchunk((int *)a1, 40);
  *size_t v36 = 2;
  v36[6] = *(_DWORD *)(a1 + 336);
  uint64_t v37 = v29;
  do
  {
    size_t v38 = v37;
    uint64_t v37 = (_DWORD *)*((void *)v37 + 4);
  }
  while (v37);
  *((void *)v38 + 4) = v36;
  size_t v39 = (_DWORD *)newchunk((int *)a1, 40);
  *size_t v39 = 80;
  v39[6] = 0;
  size_t v40 = v29;
  do
  {
    uint64_t v41 = v40;
    size_t v40 = (_DWORD *)*((void *)v40 + 4);
  }
  while (v40);
  *((void *)v41 + 4) = v39;
  uint64_t v42 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v42 = 84;
  v42[6] = 63;
  size_t v43 = v29;
  do
  {
    uint64_t v44 = v43;
    size_t v43 = (_DWORD *)*((void *)v43 + 4);
  }
  while (v43);
  *((void *)v44 + 4) = v42;
  uint64_t v45 = (_DWORD *)newchunk((int *)a1, 40);
  *uint64_t v45 = 36;
  v45[6] = 4;
  size_t v46 = v29;
  do
  {
    int v47 = v46;
    size_t v46 = (_DWORD *)*((void *)v46 + 4);
  }
  while (v46);
  *((void *)v47 + 4) = v45;
  int v48 = (_DWORD *)newchunk((int *)a1, 40);
  *int v48 = 4;
  v48[6] = 8;
  v49 = v29;
  do
  {
    uint64_t v50 = v49;
    v49 = (_DWORD *)*((void *)v49 + 4);
  }
  while (v49);
  *((void *)v50 + 4) = v48;
  v51 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v51 = 12;
  v51[6] = 0;
  v52 = v29;
  do
  {
    uint64_t v53 = v52;
    v52 = (_DWORD *)*((void *)v52 + 4);
  }
  while (v52);
  *((void *)v53 + 4) = v51;
  int v54 = *(_DWORD *)(a1 + 228);
  *(void *)(a1 + 292) = *(void *)(a1 + 280);
  *(_DWORD *)(a1 + 300) = *(_DWORD *)(a1 + 288);
  *(_DWORD *)(a1 + 228) = 1;
  *(_DWORD *)(a1 + 232) = v54;
  *(void *)(a1 + 280) = 1;
  *(_DWORD *)(a1 + 288) = alloc_reg(a1);
  *(_DWORD *)(a1 + 344) = 0;
  size_t v55 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v55 = 2;
  v55[6] = *(_DWORD *)(a1 + 288);
  v56 = v29;
  do
  {
    size_t v57 = v56;
    v56 = (_DWORD *)*((void *)v56 + 4);
  }
  while (v56);
  *((void *)v57 + 4) = v55;
  *(_DWORD *)(a1 + 244) = 1;
  v58 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v58 = 72;
  v58[6] = 2;
  size_t v59 = v29;
  do
  {
    size_t v60 = v59;
    size_t v59 = (_DWORD *)*((void *)v59 + 4);
  }
  while (v59);
  *((void *)v60 + 4) = v58;
  size_t v61 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v61 = 97;
  v61[6] = *(_DWORD *)(a1 + 288);
  v62 = v29;
  do
  {
    v63 = v62;
    v62 = (_DWORD *)*((void *)v62 + 4);
  }
  while (v62);
  *((void *)v63 + 4) = v61;
  v64 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v64 = 21;
  v64[6] = 25944;
  v65 = v64;
  v66 = v29;
  do
  {
    v67 = v66;
    v66 = (_DWORD *)*((void *)v66 + 4);
  }
  while (v66);
  *((void *)v67 + 4) = v64;
  v68 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v68 = 135;
  unsigned int v69 = v29;
  do
  {
    BOOL v70 = v69;
    unsigned int v69 = (_DWORD *)*((void *)v69 + 4);
  }
  while (v69);
  *((void *)v70 + 4) = v68;
  *((void *)v65 + 1) = v68;
  uint64_t v71 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v71 = 4;
  v71[6] = 12;
  size_t v72 = v29;
  do
  {
    v73 = v72;
    size_t v72 = (_DWORD *)*((void *)v72 + 4);
  }
  while (v72);
  *((void *)v73 + 4) = v71;
  uint64_t v74 = (_DWORD *)newchunk((int *)a1, 40);
  *uint64_t v74 = 2;
  v74[6] = *(_DWORD *)(a1 + 336);
  uint64_t v75 = v29;
  do
  {
    uint64_t v76 = v75;
    uint64_t v75 = (_DWORD *)*((void *)v75 + 4);
  }
  while (v75);
  *((void *)v76 + 4) = v74;
  uint64_t v77 = (_DWORD *)newchunk((int *)a1, 40);
  *uint64_t v77 = 4;
  v77[6] = 2;
  v78 = v29;
  do
  {
    v79 = v78;
    v78 = (_DWORD *)*((void *)v78 + 4);
  }
  while (v78);
  *((void *)v79 + 4) = v77;
  v80 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v80 = 7;
  uint64_t v81 = v29;
  do
  {
    v82 = v81;
    uint64_t v81 = (_DWORD *)*((void *)v81 + 4);
  }
  while (v81);
  *((void *)v82 + 4) = v80;
  *(_DWORD *)(a1 + 324) = alloc_reg(a1);
  *(void *)(a1 + 316) = 1;
  v83 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v83 = 3;
  v83[6] = *(_DWORD *)(a1 + 324);
  v84 = v29;
  do
  {
    uint64_t v85 = v84;
    v84 = (_DWORD *)*((void *)v84 + 4);
  }
  while (v84);
  *((void *)v85 + 4) = v83;
  *((void *)v65 + 2) = v83;
  *(_DWORD *)(a1 + 392) = 0;
  v86 = (_DWORD *)newchunk((int *)a1, 40);
  _DWORD *v86 = 0;
  v86[6] = 0;
  v87 = v86;
  size_t v88 = newchunk((int *)a1, 288);
  size_t v89 = v88;
  *(_DWORD *)(v88 + 16) = 21;
  *(void *)(v88 + 152) = v88;
  v90 = v29;
  do
  {
    v91 = v90;
    v90 = (_DWORD *)*((void *)v90 + 4);
  }
  while (v90);
  *((void *)v91 + 4) = v87;
  *(void *)(v88 + 8) = v29;
  gen_and(v27, v88);
  *(_DWORD *)(a1 + 344) = 1;
  return v89;
}

size_t gen_true(int *a1)
{
  uint64_t v2 = (_DWORD *)newchunk(a1, 40);
  *uint64_t v2 = 0;
  v2[6] = 0;
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = v2;
  return result;
}

size_t gen_atmfield_code(int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (setjmp(a1)) {
    return 0;
  }
  else {
    return gen_atmfield_code_internal(a1, a2, a3, a4, a5);
  }
}

size_t gen_atmfield_code_internal(int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = a5;
  int v6 = a4;
  int v7 = a3;
  switch(a2)
  {
    case '3':
      if (!a1[85]) {
        bpf_error((uint64_t)a1, "'vpi' supported only on raw ATM", a3, a4, a5, a4, a5, a3);
      }
      int v8 = a1[88];
      goto LABEL_10;
    case '4':
      if (!a1[85]) {
        bpf_error((uint64_t)a1, "'vci' supported only on raw ATM", a3, a4, a5, a4, a5, a3);
      }
      int v8 = a1[89];
      if (v8 == -1) {
        goto LABEL_19;
      }
      int v9 = 8;
      goto LABEL_15;
    case '5':
      int v8 = a1[90];
      if (v8 == -1) {
        goto LABEL_19;
      }
      int v9 = 16;
      int v10 = 15;
      goto LABEL_16;
    case '6':
      int v11 = a1[97];
      if (v11 == -1) {
        goto LABEL_19;
      }
      int v8 = v11 + 5;
      goto LABEL_11;
    case '7':
      if (!a1[85]) {
        bpf_error((uint64_t)a1, "'callref' supported only on raw ATM", a3, a4, a5, a4, a5, a3);
      }
      int v8 = a1[90];
LABEL_10:
      if (v8 == -1) {
        goto LABEL_19;
      }
LABEL_11:
      int v9 = 16;
LABEL_15:
      int v10 = -1;
LABEL_16:
      return gen_ncmp(a1, 1, v8, v9, v10, v6, v5, v7);
    default:
LABEL_19:
      abort();
  }
}

double gen_atmtype_abbrev(uint64_t a1, int a2)
{
  if (!setjmp((int *)a1))
  {
    switch(a2)
    {
      case 22:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'metac' supported only on raw ATM");
        }
        gen_atmtype_metac((int *)a1);
        return result;
      case 23:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'bcc' supported only on raw ATM");
        }
        size_t v5 = gen_atmfield_code_internal((int *)a1, 51, 0, 16, 0);
        uint64_t v6 = 2;
        goto LABEL_11;
      case 24:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'oam4sc' supported only on raw ATM");
        }
        size_t v5 = gen_atmfield_code_internal((int *)a1, 51, 0, 16, 0);
        uint64_t v6 = 3;
        goto LABEL_11;
      case 25:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'oam4ec' supported only on raw ATM");
        }
        size_t v5 = gen_atmfield_code_internal((int *)a1, 51, 0, 16, 0);
        uint64_t v6 = 4;
LABEL_11:
        int v7 = (int *)a1;
        goto LABEL_16;
      case 26:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'sc' supported only on raw ATM");
        }
        gen_atmtype_sc((int *)a1);
        return result;
      case 27:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'ilmic' supported only on raw ATM");
        }
        size_t v5 = gen_atmfield_code_internal((int *)a1, 51, 0, 16, 0);
        int v7 = (int *)a1;
        uint64_t v6 = 16;
LABEL_16:
        size_t v8 = gen_atmfield_code_internal(v7, 52, v6, 16, 0);
        gen_and(v5, v8);
        break;
      case 30:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'lane' supported only on raw ATM");
        }
        gen_atmfield_code_internal((int *)a1, 53, 1, 16, 0);
        *(void *)(a1 + 292) = *(void *)(a1 + 280);
        int v9 = *(_DWORD *)(a1 + 228);
        *(_DWORD *)(a1 + 300) = *(_DWORD *)(a1 + 288);
        *(_DWORD *)(a1 + 228) = 1;
        *(_DWORD *)(a1 + 232) = v9;
        *(_DWORD *)(a1 + 280) = 0;
        int v10 = *(_DWORD *)(a1 + 388);
        *(_DWORD *)(a1 + 284) = v10 + 2;
        *(_DWORD *)(a1 + 288) = -1;
        *(_DWORD *)(a1 + 344) = 0;
        *(_DWORD *)(a1 + 332) = v10 + 14;
        *(_DWORD *)(a1 + 320) = v10 + 16;
        *(void *)&double result = 0x300000000;
        *(void *)(a1 + 392) = 0x300000000;
        break;
      case 31:
        if (!*(_DWORD *)(a1 + 340)) {
          bpf_error(a1, "'llc' supported only on raw ATM");
        }
        gen_atmfield_code_internal((int *)a1, 53, 2, 16, 0);
        *(_DWORD *)(a1 + 228) = *(_DWORD *)(a1 + 232);
        break;
      default:
        abort();
    }
  }
  return result;
}

size_t gen_atmtype_metac(int *a1)
{
  size_t v2 = gen_atmfield_code_internal(a1, 51, 0, 16, 0);
  size_t v3 = gen_atmfield_code_internal(a1, 52, 1, 16, 0);
  gen_and(v2, v3);
  return v3;
}

size_t gen_atmtype_sc(int *a1)
{
  size_t v2 = gen_atmfield_code_internal(a1, 51, 0, 16, 0);
  size_t v3 = gen_atmfield_code_internal(a1, 52, 5, 16, 0);
  gen_and(v2, v3);
  return v3;
}

size_t gen_mtp2type_abbrev(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  switch(a2)
  {
    case 22:
      int v5 = a1[57];
      if ((v5 - 139) >= 2 && v5 != 197) {
        bpf_error((uint64_t)a1, "'fisu' supported only on MTP2");
      }
      int v6 = a1[91];
      int v7 = 63;
      int v8 = 16;
      int v9 = a1;
      int v10 = 16;
      goto LABEL_16;
    case 23:
      int v11 = a1[57];
      if ((v11 - 139) >= 2 && v11 != 197) {
        bpf_error((uint64_t)a1, "'lssu' supported only on MTP2");
      }
      int v12 = 16;
      int v13 = 63;
      size_t v14 = gen_ncmp(a1, 0, a1[91], 16, 63, 32, 1, 2);
      size_t v15 = v14;
      int v16 = a1[91];
      goto LABEL_20;
    case 24:
      int v17 = a1[57];
      if ((v17 - 139) >= 2 && v17 != 197) {
        bpf_error((uint64_t)a1, "'msu' supported only on MTP2");
      }
      int v6 = a1[91];
      int v8 = 16;
      int v7 = 63;
      int v10 = 32;
      int v18 = 2;
      goto LABEL_24;
    case 25:
      int v19 = a1[57];
      if ((v19 - 139) >= 2 && v19 != 197) {
        bpf_error((uint64_t)a1, "'hfisu' supported only on MTP2_HSL");
      }
      int v6 = a1[92];
      int v8 = 8;
      int v7 = 65408;
      int v10 = 16;
      int v9 = a1;
LABEL_16:
      int v18 = 0;
      goto LABEL_25;
    case 26:
      int v20 = a1[57];
      if ((v20 - 139) >= 2 && v20 != 197) {
        bpf_error((uint64_t)a1, "'hlssu' supported only on MTP2_HSL");
      }
      int v12 = 8;
      int v13 = 65408;
      size_t v14 = gen_ncmp(a1, 0, a1[92], 8, 65408, 32, 1, 256);
      size_t v15 = v14;
      int v16 = a1[92];
LABEL_20:
      size_t v21 = gen_ncmp(a1, 0, v16, v12, v13, 32, 0, 0);
      gen_and(v21, v14);
      return v15;
    case 27:
      int v22 = a1[57];
      if ((v22 - 139) >= 2 && v22 != 197) {
        bpf_error((uint64_t)a1, "'hmsu' supported only on MTP2_HSL");
      }
      int v6 = a1[92];
      int v8 = 8;
      int v7 = 65408;
      int v10 = 32;
      int v18 = 256;
LABEL_24:
      int v9 = a1;
LABEL_25:
      size_t result = gen_ncmp(v9, 0, v6, v8, v7, v10, 0, v18);
      break;
    default:
      abort();
  }
  return result;
}

size_t gen_ncmp(int *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  a = gen_load_a(a1, a2, a3, a4);
  if (a5 != -1)
  {
    size_t v14 = (_DWORD *)newchunk(a1, 40);
    *size_t v14 = 84;
    v14[6] = a5;
    size_t v15 = a;
    do
    {
      int v16 = v15;
      size_t v15 = (_DWORD *)*((void *)v15 + 4);
    }
    while (v15);
    *((void *)v16 + 4) = v14;
  }
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = a6 | 5;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = a;
  *(_DWORD *)(result + 40) = a8;
  if (a7)
  {
    if ((a6 & 0xFFFFFFEF) == 0x20) {
      *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
    }
  }
  return result;
}

size_t gen_mtp3field_code(int *a1, int a2, unsigned int a3, int a4, int a5)
{
  if (setjmp(a1)) {
    return 0;
  }
  unsigned int v10 = a1[93];
  uint64_t v11 = v10;
  int v12 = a1[94];
  int v13 = v12;
  int v14 = a1[95];
  int v15 = v14;
  unsigned int v16 = a1[96];
  uint64_t v17 = v16;
  switch(a2)
  {
    case 1:
      goto LABEL_5;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_13;
    case 4:
      goto LABEL_18;
    case 5:
      uint64_t v11 = v10 + 3;
LABEL_5:
      if (v10 == -1) {
        bpf_error((uint64_t)a1, "'sio' supported only on SS7", v11, v16);
      }
      int v18 = a3;
      if (a3 >= 0x100) {
        bpf_error((uint64_t)a1, "sio value %u too big; max value = 255", v11, v16);
      }
      int v19 = 16;
      int v20 = -1;
      goto LABEL_21;
    case 6:
      int v13 = v12 + 3;
LABEL_9:
      if (v12 == -1) {
        bpf_error((uint64_t)a1, "'opc' supported only on SS7", v10, v16);
      }
      if (a3 >= 0x4000) {
        bpf_error((uint64_t)a1, "opc value %u too big; max value = 16383", v10, v16);
      }
      LODWORD(v11) = v13;
      int v18 = (a3 << 6) & 0xFF00 | (a3 >> 10) & 0xF | ((a3 & 3) << 22);
      int v20 = 12648207;
      goto LABEL_16;
    case 7:
      int v15 = v14 + 3;
LABEL_13:
      if (v14 == -1) {
        bpf_error((uint64_t)a1, "'dpc' supported only on SS7", v10, v16);
      }
      if (a3 >= 0x4000) {
        bpf_error((uint64_t)a1, "dpc value %u too big; max value = 16383", v10, v16);
      }
      LODWORD(v11) = v15;
      int v18 = (a3 << 8) & 0x3F0000 | (a3 << 24);
      int v20 = -12648448;
LABEL_16:
      size_t v21 = a1;
      int v19 = 0;
      break;
    case 8:
      uint64_t v17 = v16 + 3;
LABEL_18:
      if (v16 == -1) {
        bpf_error((uint64_t)a1, "'sls' supported only on SS7");
      }
      if (a3 >= 0x10) {
        bpf_error((uint64_t)a1, "sls value %u too big; max value = 15", v10, v17);
      }
      LODWORD(v11) = v17;
      int v18 = 16 * a3;
      int v19 = 16;
      int v20 = 240;
LABEL_21:
      size_t v21 = a1;
      break;
    default:
      abort();
  }
  return gen_ncmp(v21, 0, v11, v19, v20, a4, a5, v18);
}

size_t gen_atmmulti_abbrev(int *a1, int a2)
{
  if (setjmp(a1)) {
    return 0;
  }
  if (a2 <= 69)
  {
    if (a2 == 28)
    {
      if (!a1[85]) {
        bpf_error((uint64_t)a1, "'oam' supported only on raw ATM");
      }
      goto LABEL_13;
    }
    if (a2 == 29)
    {
      if (!a1[85]) {
        bpf_error((uint64_t)a1, "'oamf4' supported only on raw ATM");
      }
LABEL_13:
      size_t v12 = gen_atmfield_code_internal(a1, 52, 3, 16, 0);
      size_t v13 = gen_atmfield_code_internal(a1, 52, 4, 16, 0);
      gen_or(v12, v13);
      size_t v14 = gen_atmfield_code_internal(a1, 51, 0, 16, 0);
      gen_and(v14, v13);
      return v13;
    }
LABEL_17:
    abort();
  }
  if (a2 == 70)
  {
    if (!a1[85]) {
      bpf_error((uint64_t)a1, "'connectmsg' supported only on raw ATM");
    }
    size_t v15 = gen_atmfield_code_internal(a1, 54, 5, 16, 0);
    size_t v6 = gen_atmfield_code_internal(a1, 54, 2, 16, 0);
    size_t v7 = v6;
    gen_or(v15, v6);
    size_t v16 = gen_atmfield_code_internal(a1, 54, 7, 16, 0);
    gen_or(v16, v6);
    size_t v17 = gen_atmfield_code_internal(a1, 54, 15, 16, 0);
    gen_or(v17, v6);
    size_t v18 = gen_atmfield_code_internal(a1, 54, 77, 16, 0);
    gen_or(v18, v6);
    size_t v19 = gen_atmfield_code_internal(a1, 54, 90, 16, 0);
    gen_or(v19, v6);
    size_t v11 = gen_atmtype_sc(a1);
  }
  else
  {
    if (a2 != 71) {
      goto LABEL_17;
    }
    if (!a1[85]) {
      bpf_error((uint64_t)a1, "'metaconnect' supported only on raw ATM");
    }
    size_t v5 = gen_atmfield_code_internal(a1, 54, 5, 16, 0);
    size_t v6 = gen_atmfield_code_internal(a1, 54, 2, 16, 0);
    size_t v7 = v6;
    gen_or(v5, v6);
    size_t v8 = gen_atmfield_code_internal(a1, 54, 7, 16, 0);
    gen_or(v8, v6);
    size_t v9 = gen_atmfield_code_internal(a1, 54, 77, 16, 0);
    gen_or(v9, v6);
    size_t v10 = gen_atmfield_code_internal(a1, 54, 90, 16, 0);
    gen_or(v10, v6);
    size_t v11 = gen_atmtype_metac(a1);
  }
  gen_and(v11, v6);
  return v7;
}

size_t gen_check_802_11_data_frame(int *a1)
{
  size_t v2 = a1 + 70;
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 70, 0, 16);
  size_t v4 = newchunk(a1, 288);
  *(_DWORD *)(v4 + 16) = 69;
  *(void *)(v4 + 152) = v4;
  *(_DWORD *)(v4 + 40) = 8;
  *(void *)(v4 + 8) = absoffsetrel;
  size_t v5 = gen_load_absoffsetrel(a1, v2, 0, 16);
  size_t v6 = newchunk(a1, 288);
  *(_DWORD *)(v6 + 16) = 69;
  *(void *)(v6 + 152) = v6;
  *(_DWORD *)(v6 + 40) = 4;
  *(void *)(v6 + 8) = v5;
  *(_DWORD *)(v6 + 68) = *(_DWORD *)(v6 + 68) == 0;
  gen_and(v6, v4);
  return v4;
}

_DWORD *gen_load_absoffsetrel(int *a1, _DWORD *a2, int a3, int a4)
{
  size_t v8 = gen_abs_offset_varpart(a1, a2);
  size_t v9 = (_DWORD *)newchunk(a1, 40);
  if (v8)
  {
    *size_t v9 = a4 | 0x40;
    v9[6] = a2[1] + a3;
    size_t v10 = v8;
    do
    {
      size_t v11 = v10;
      size_t v10 = (_DWORD *)*((void *)v10 + 4);
    }
    while (v10);
    *((void *)v11 + 4) = v9;
  }
  else
  {
    *size_t v9 = a4 | 0x20;
    v9[6] = a2[1] + a3;
    return v9;
  }
  return v8;
}

_DWORD *gen_loadx_iphdrlen(int *a1)
{
  size_t v2 = gen_abs_offset_varpart(a1, a1 + 79);
  size_t v3 = (_DWORD *)newchunk(a1, 40);
  if (v2)
  {
    _DWORD *v3 = 80;
    v3[6] = a1[98] + a1[80];
    size_t v4 = v2;
    do
    {
      size_t v5 = v4;
      size_t v4 = (_DWORD *)*((void *)v4 + 4);
    }
    while (v4);
    *((void *)v5 + 4) = v3;
    size_t v6 = (_DWORD *)newchunk(a1, 40);
    *size_t v6 = 84;
    v6[6] = 15;
    size_t v7 = v2;
    do
    {
      size_t v8 = v7;
      size_t v7 = (_DWORD *)*((void *)v7 + 4);
    }
    while (v7);
    *((void *)v8 + 4) = v6;
    size_t v9 = (_DWORD *)newchunk(a1, 40);
    *size_t v9 = 100;
    v9[6] = 2;
    size_t v10 = v2;
    do
    {
      size_t v11 = v10;
      size_t v10 = (_DWORD *)*((void *)v10 + 4);
    }
    while (v10);
    *((void *)v11 + 4) = v9;
    size_t v12 = (_DWORD *)newchunk(a1, 40);
    *size_t v12 = 12;
    size_t v13 = v2;
    do
    {
      size_t v14 = v13;
      size_t v13 = (_DWORD *)*((void *)v13 + 4);
    }
    while (v13);
    *((void *)v14 + 4) = v12;
    size_t v15 = (_DWORD *)newchunk(a1, 40);
    *size_t v15 = 7;
    size_t v16 = v2;
    do
    {
      size_t v17 = v16;
      size_t v16 = (_DWORD *)*((void *)v16 + 4);
    }
    while (v16);
    *((void *)v17 + 4) = v15;
  }
  else
  {
    _DWORD *v3 = 177;
    v3[6] = a1[98] + a1[80];
    return v3;
  }
  return v2;
}

_DWORD *gen_abs_offset_varpart(int *a1, _DWORD *a2)
{
  if (!*a2) {
    return 0;
  }
  if (a2[2] == -1) {
    a2[2] = alloc_reg((uint64_t)a1);
  }
  size_t result = (_DWORD *)newchunk(a1, 40);
  *size_t result = 97;
  result[6] = a2[2];
  return result;
}

size_t gen_hostop(int *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = a6;
  switch(a4)
  {
    case 0:
    case 3:
      uint64_t v13 = gen_hostop(a1, a2, a3, 1, a5, a6, a7);
      size_t v14 = gen_hostop(a1, a2, a3, 2, a5, v8, a7);
      gen_or(v13, v14);
      return v14;
    case 1:
      goto LABEL_4;
    case 2:
      LODWORD(v8) = a7;
LABEL_4:
      size_t v15 = gen_linktype((uint64_t)a1, a5);
      size_t v14 = gen_ncmp(a1, 6, v8, 0, a3, 16, 0, a2);
      uint64_t v16 = v15;
      break;
    case 4:
      uint64_t v17 = gen_hostop(a1, a2, a3, 1, a5, a6, a7);
      size_t v14 = gen_hostop(a1, a2, a3, 2, a5, v8, a7);
      uint64_t v16 = v17;
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is not a valid qualifier for addresses other than 802.11 MAC addresses");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is not a valid qualifier for addresses other than 802.11 MAC addresses");
    default:
      abort();
  }
  gen_and(v16, v14);
  return v14;
}

size_t gen_dnhostop(int *a1, uint64_t a2, int a3)
{
  int v5 = 1;
  int v6 = 7;
  switch(a3)
  {
    case 0:
    case 3:
      uint64_t v7 = gen_dnhostop(a1, a2, 1);
      size_t v8 = gen_dnhostop(a1, a2, 2);
      gen_or(v7, v8);
      return v8;
    case 1:
      int v5 = 3;
      int v6 = 15;
      goto LABEL_4;
    case 2:
LABEL_4:
      size_t v9 = gen_linktype((uint64_t)a1, 24579);
      size_t v10 = gen_ncmp(a1, 6, 2, 8, 65287, 16, 0, 33030);
      unsigned int v11 = bswap32(a2) >> 16;
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, v6 + a1[98] + 3, 8);
      size_t v8 = newchunk(a1, 288);
      *(_DWORD *)(v8 + 16) = 21;
      *(void *)(v8 + 152) = v8;
      *(void *)(v8 + 8) = absoffsetrel;
      *(_DWORD *)(v8 + 40) = v11;
      gen_and(v10, v8);
      size_t v13 = gen_ncmp(a1, 6, 2, 16, 7, 16, 0, 6);
      size_t v14 = gen_load_absoffsetrel(a1, a1 + 79, v6 + a1[98] + 2, 8);
      size_t v15 = newchunk(a1, 288);
      *(_DWORD *)(v15 + 16) = 21;
      *(void *)(v15 + 152) = v15;
      *(void *)(v15 + 8) = v14;
      *(_DWORD *)(v15 + 40) = v11;
      gen_and(v13, v15);
      gen_or(v15, v8);
      size_t v16 = gen_ncmp(a1, 6, 2, 8, 65287, 16, 0, 33026);
      uint64_t v17 = gen_load_absoffsetrel(a1, a1 + 79, v5 + a1[98] + 3, 8);
      size_t v18 = newchunk(a1, 288);
      *(_DWORD *)(v18 + 16) = 21;
      *(void *)(v18 + 152) = v18;
      *(void *)(v18 + 8) = v17;
      *(_DWORD *)(v18 + 40) = v11;
      gen_and(v16, v18);
      gen_or(v18, v8);
      size_t v19 = gen_ncmp(a1, 6, 2, 16, 7, 16, 0, 2);
      int v20 = gen_load_absoffsetrel(a1, a1 + 79, v5 + a1[98] + 2, 8);
      size_t v21 = newchunk(a1, 288);
      *(_DWORD *)(v21 + 16) = 21;
      *(void *)(v21 + 152) = v21;
      *(void *)(v21 + 8) = v20;
      *(_DWORD *)(v21 + 40) = v11;
      gen_and(v19, v21);
      gen_or(v21, v8);
      break;
    case 4:
      size_t v9 = gen_dnhostop(a1, a2, 1);
      size_t v8 = gen_dnhostop(a1, a2, 2);
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is not a valid qualifier for addresses other than 802.11 MAC addresses");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is not a valid qualifier for addresses other than 802.11 MAC addresses");
    default:
      abort();
  }
  gen_and(v9, v8);
  return v8;
}

size_t gen_hostop6(int *a1, unsigned int *a2, unsigned int *a3, int a4)
{
  int v7 = 8;
  switch(a4)
  {
    case 0:
    case 3:
      uint64_t v8 = gen_hostop6(a1, a2, a3, 1);
      size_t v9 = gen_hostop6(a1, a2, a3, 2);
      gen_or(v8, v9);
      return v9;
    case 1:
      goto LABEL_4;
    case 2:
      int v7 = 24;
LABEL_4:
      size_t v9 = gen_ncmp(a1, 6, v7 + 12, 0, bswap32(a3[3]), 16, 0, bswap32(a2[3]));
      size_t v10 = gen_ncmp(a1, 6, v7 + 8, 0, bswap32(a3[2]), 16, 0, bswap32(a2[2]));
      gen_and(v10, v9);
      size_t v11 = gen_ncmp(a1, 6, v7 | 4u, 0, bswap32(a3[1]), 16, 0, bswap32(a2[1]));
      gen_and(v11, v9);
      size_t v12 = gen_ncmp(a1, 6, v7, 0, bswap32(*a3), 16, 0, bswap32(*a2));
      gen_and(v12, v9);
      size_t v13 = gen_linktype((uint64_t)a1, 34525);
      break;
    case 4:
      uint64_t v14 = gen_hostop6(a1, a2, a3, 1);
      size_t v9 = gen_hostop6(a1, a2, a3, 2);
      size_t v13 = v14;
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are not valid qualifiers for addresses other than 802.11 MAC addresses");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is not a valid qualifier for addresses other than 802.11 MAC addresses");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is not a valid qualifier for addresses other than 802.11 MAC addresses");
    default:
      abort();
  }
  gen_and(v13, v9);
  return v9;
}

size_t gen_portop(int *a1, int a2, int a3, int a4)
{
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 9, 16);
  size_t v9 = newchunk(a1, 288);
  *(_DWORD *)(v9 + 16) = 21;
  *(void *)(v9 + 152) = v9;
  *(void *)(v9 + 8) = absoffsetrel;
  *(_DWORD *)(v9 + 40) = a3;
  size_t v10 = gen_ipfrag(a1);
  gen_and(v9, v10);
  switch(a4)
  {
    case 0:
    case 3:
      a = gen_load_a(a1, 8, 0, 8);
      size_t v12 = newchunk(a1, 288);
      *(_DWORD *)(v12 + 16) = 21;
      *(void *)(v12 + 152) = v12;
      *(void *)(v12 + 8) = a;
      *(_DWORD *)(v12 + 40) = a2;
      size_t v13 = gen_load_a(a1, 8, 2, 8);
      size_t v14 = newchunk(a1, 288);
      *(_DWORD *)(v14 + 16) = 21;
      *(void *)(v14 + 152) = v14;
      *(void *)(v14 + 8) = v13;
      *(_DWORD *)(v14 + 40) = a2;
      gen_or(v12, v14);
      break;
    case 1:
      size_t v15 = a1;
      int v16 = 0;
      goto LABEL_5;
    case 2:
      size_t v15 = a1;
      int v16 = 2;
LABEL_5:
      uint64_t v17 = gen_load_a(v15, 8, v16, 8);
      size_t v14 = newchunk(a1, 288);
      *(_DWORD *)(v14 + 16) = 21;
      *(void *)(v14 + 152) = v14;
      *(void *)(v14 + 8) = v17;
      *(_DWORD *)(v14 + 40) = a2;
      break;
    case 4:
      size_t v18 = gen_load_a(a1, 8, 0, 8);
      size_t v19 = newchunk(a1, 288);
      *(_DWORD *)(v19 + 16) = 21;
      *(void *)(v19 + 152) = v19;
      *(void *)(v19 + 8) = v18;
      *(_DWORD *)(v19 + 40) = a2;
      int v20 = gen_load_a(a1, 8, 2, 8);
      size_t v14 = newchunk(a1, 288);
      *(_DWORD *)(v14 + 16) = 21;
      *(void *)(v14 + 152) = v14;
      *(void *)(v14 + 8) = v20;
      *(_DWORD *)(v14 + 40) = a2;
      gen_and(v19, v14);
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are not valid qualifiers for ports");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are not valid qualifiers for ports");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are not valid qualifiers for ports");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are not valid qualifiers for ports");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is not a valid qualifier for ports");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is not a valid qualifier for ports");
    default:
      abort();
  }
  gen_and(v10, v14);
  return v14;
}

size_t gen_ipfrag(int *a1)
{
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 6, 8);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 69;
  *(void *)(result + 152) = result;
  *(_DWORD *)(result + 40) = 0x1FFF;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
  return result;
}

size_t gen_portrangeop(int *a1, unsigned int a2, unsigned int a3, int a4, int a5)
{
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 9, 16);
  size_t v11 = newchunk(a1, 288);
  *(_DWORD *)(v11 + 16) = 21;
  *(void *)(v11 + 152) = v11;
  *(void *)(v11 + 8) = absoffsetrel;
  *(_DWORD *)(v11 + 40) = a4;
  size_t v12 = gen_ipfrag(a1);
  gen_and(v11, v12);
  switch(a5)
  {
    case 0:
    case 3:
      size_t v13 = gen_portrangeatom(a1, 0, a2, a3);
      size_t v14 = gen_portrangeatom(a1, 2, a2, a3);
      gen_or(v13, v14);
      break;
    case 1:
      size_t v15 = a1;
      int v16 = 0;
      goto LABEL_5;
    case 2:
      size_t v15 = a1;
      int v16 = 2;
LABEL_5:
      size_t v14 = gen_portrangeatom(v15, v16, a2, a3);
      break;
    case 4:
      size_t v17 = gen_portrangeatom(a1, 0, a2, a3);
      size_t v14 = gen_portrangeatom(a1, 2, a2, a3);
      gen_and(v17, v14);
      break;
    case 5:
      bpf_error((uint64_t)a1, "'addr1' and 'address1' are not valid qualifiers for port ranges");
    case 6:
      bpf_error((uint64_t)a1, "'addr2' and 'address2' are not valid qualifiers for port ranges");
    case 7:
      bpf_error((uint64_t)a1, "'addr3' and 'address3' are not valid qualifiers for port ranges");
    case 8:
      bpf_error((uint64_t)a1, "'addr4' and 'address4' are not valid qualifiers for port ranges");
    case 9:
      bpf_error((uint64_t)a1, "'ra' is not a valid qualifier for port ranges");
    case 10:
      bpf_error((uint64_t)a1, "'ta' is not a valid qualifier for port ranges");
    default:
      abort();
  }
  gen_and(v12, v14);
  return v14;
}

size_t gen_portrangeatom(int *a1, int a2, unsigned int a3, unsigned int a4)
{
  if (a3 <= a4) {
    int v6 = a4;
  }
  else {
    int v6 = a3;
  }
  if (a3 >= a4) {
    unsigned int v7 = a4;
  }
  else {
    unsigned int v7 = a3;
  }
  a = gen_load_a(a1, 8, a2, 8);
  size_t v9 = newchunk(a1, 288);
  *(_DWORD *)(v9 + 16) = 53;
  *(void *)(v9 + 152) = v9;
  *(void *)(v9 + 8) = a;
  *(_DWORD *)(v9 + 40) = v7;
  size_t v10 = gen_cmp_le(a1, 8, a2, v6);
  gen_and(v9, v10);
  return v10;
}

size_t gen_cmp_le(int *a1, int a2, int a3, int a4)
{
  a = gen_load_a(a1, a2, a3, 8);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 37;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = a;
  *(_DWORD *)(result + 40) = a4;
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) == 0;
  return result;
}

size_t gen_portrangeop6(int *a1, unsigned int a2, unsigned int a3, int a4, int a5)
{
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a1[98] + 6, 16);
  size_t v11 = newchunk(a1, 288);
  *(_DWORD *)(v11 + 16) = 21;
  *(void *)(v11 + 152) = v11;
  *(void *)(v11 + 8) = absoffsetrel;
  *(_DWORD *)(v11 + 40) = a4;
  uint64_t v12 = v11;
  switch(a5)
  {
    case 0:
    case 3:
      size_t v13 = gen_portrangeatom6(a1, 0, a2, a3);
      size_t v14 = gen_portrangeatom6(a1, 2, a2, a3);
      gen_or(v13, v14);
      break;
    case 1:
      size_t v15 = a1;
      int v16 = 0;
      goto LABEL_5;
    case 2:
      size_t v15 = a1;
      int v16 = 2;
LABEL_5:
      size_t v14 = gen_portrangeatom6(v15, v16, a2, a3);
      break;
    case 4:
      size_t v17 = gen_portrangeatom6(a1, 0, a2, a3);
      size_t v14 = gen_portrangeatom6(a1, 2, a2, a3);
      gen_and(v17, v14);
      break;
    default:
      abort();
  }
  gen_and(v12, v14);
  return v14;
}

size_t gen_portrangeatom6(int *a1, int a2, unsigned int a3, unsigned int a4)
{
  if (a3 <= a4) {
    int v6 = a4;
  }
  else {
    int v6 = a3;
  }
  if (a3 >= a4) {
    unsigned int v7 = a4;
  }
  else {
    unsigned int v7 = a3;
  }
  absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, a2 + a1[98] + 40, 8);
  size_t v9 = newchunk(a1, 288);
  *(_DWORD *)(v9 + 16) = 53;
  *(void *)(v9 + 152) = v9;
  *(void *)(v9 + 8) = absoffsetrel;
  *(_DWORD *)(v9 + 40) = v7;
  size_t v10 = gen_cmp_le(a1, 9, a2, v6);
  gen_and(v9, v10);
  return v10;
}

size_t gen_ether_linktype(int *a1, int a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  if (a2 <= 253)
  {
    if (a2 == 6) {
      goto LABEL_10;
    }
    if (a2 != 224)
    {
      if (a2 != 240) {
        goto LABEL_5;
      }
LABEL_10:
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
      size_t v10 = newchunk(a1, 288);
      *(_DWORD *)(v10 + 16) = 37;
      *(void *)(v10 + 152) = v10;
      *(void *)(v10 + 8) = absoffsetrel;
      *(_DWORD *)(v10 + 40) = 1500;
      *(_DWORD *)(v10 + 68) = *(_DWORD *)(v10 + 68) == 0;
      int v11 = a2 | (a2 << 8);
      uint64_t v12 = gen_load_absoffsetrel(a1, a1 + 79, 0, 8);
      size_t v6 = newchunk(a1, 288);
      *(_DWORD *)(v6 + 16) = 21;
      *(void *)(v6 + 152) = v6;
      *(void *)(v6 + 8) = v12;
      *(_DWORD *)(v6 + 40) = v11;
      gen_and(v10, v6);
      return v6;
    }
    int v16 = gen_load_absoffsetrel(a1, a1 + 79, 0, 16);
    size_t v17 = newchunk(a1, 288);
    *(_DWORD *)(v17 + 16) = 21;
    *(void *)(v17 + 152) = v17;
    *(void *)(v17 + 8) = v16;
    *(_DWORD *)(v17 + 40) = 224;
    size_t v18 = gen_load_absoffsetrel(a1, a1 + 79, 0, 8);
    size_t v6 = newchunk(a1, 288);
    *(_DWORD *)(v6 + 16) = 21;
    *(void *)(v6 + 152) = v6;
    *(void *)(v6 + 8) = v18;
    *(_DWORD *)(v6 + 40) = 0xFFFF;
    gen_or(v17, v6);
    v26[0] = 0x378100000003AAAALL;
    size_t v19 = gen_bcmp(a1, 3, 0, 8u, (unsigned __int8 *)v26);
    gen_or(v19, v6);
    int v20 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v21 = newchunk(a1, 288);
    *(_DWORD *)(v21 + 16) = 37;
    *(void *)(v21 + 152) = v21;
    *(void *)(v21 + 8) = v20;
    *(_DWORD *)(v21 + 40) = 1500;
    *(_DWORD *)(v21 + 68) = *(_DWORD *)(v21 + 68) == 0;
    gen_and(v21, v6);
    int v22 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v23 = newchunk(a1, 288);
    *(_DWORD *)(v23 + 16) = 21;
    *(void *)(v23 + 152) = v23;
    *(void *)(v23 + 8) = v22;
    *(_DWORD *)(v23 + 40) = 33079;
LABEL_16:
    gen_or(v23, v6);
    return v6;
  }
  if (a2 == 33011 || a2 == 32923)
  {
    size_t v13 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v14 = newchunk(a1, 288);
    *(_DWORD *)(v14 + 16) = 37;
    *(void *)(v14 + 152) = v14;
    *(void *)(v14 + 8) = v13;
    *(_DWORD *)(v14 + 40) = 1500;
    *(_DWORD *)(v14 + 68) = *(_DWORD *)(v14 + 68) == 0;
    if (a2 == 32923) {
      unint64_t v15 = 0x9B8007000803AAAALL;
    }
    else {
      unint64_t v15 = 0xF38000000003AAAALL;
    }
    v26[0] = v15;
    size_t v6 = gen_bcmp(a1, 3, 0, 8u, (unsigned __int8 *)v26);
    gen_and(v14, v6);
    size_t v24 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v23 = newchunk(a1, 288);
    *(_DWORD *)(v23 + 16) = 21;
    *(void *)(v23 + 152) = v23;
    *(void *)(v23 + 8) = v24;
    *(_DWORD *)(v23 + 40) = a2;
    goto LABEL_16;
  }
  if (a2 == 254) {
    goto LABEL_10;
  }
LABEL_5:
  size_t v4 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
  size_t v5 = newchunk(a1, 288);
  size_t v6 = v5;
  if (a2 > 0x5DC)
  {
    *(_DWORD *)(v5 + 16) = 21;
    *(void *)(v5 + 152) = v5;
    *(void *)(v5 + 8) = v4;
    *(_DWORD *)(v5 + 40) = a2;
  }
  else
  {
    *(_DWORD *)(v5 + 16) = 37;
    *(void *)(v5 + 152) = v5;
    *(void *)(v5 + 8) = v4;
    *(_DWORD *)(v5 + 40) = 1500;
    *(_DWORD *)(v5 + 68) = *(_DWORD *)(v5 + 68) == 0;
    unsigned int v7 = gen_load_absoffsetrel(a1, a1 + 82, 2, 16);
    size_t v8 = newchunk(a1, 288);
    *(_DWORD *)(v8 + 16) = 21;
    *(void *)(v8 + 152) = v8;
    *(void *)(v8 + 8) = v7;
    *(_DWORD *)(v8 + 40) = a2;
    gen_and(v6, v8);
    return v8;
  }
  return v6;
}

size_t gen_llc_linktype(int *a1, int a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a2 <= 239)
  {
    if (a2 != 6)
    {
      if (a2 == 224)
      {
        absoffsetrel = gen_load_absoffsetrel(a1, a1 + 79, 0, 16);
        size_t result = newchunk(a1, 288);
        *(_DWORD *)(result + 16) = 21;
        *(void *)(result + 152) = result;
        *(void *)(result + 8) = absoffsetrel;
        *(_DWORD *)(result + 40) = 224;
        return result;
      }
      goto LABEL_11;
    }
LABEL_9:
    int v6 = a2 | (a2 << 8);
    unsigned int v7 = gen_load_absoffsetrel(a1, a1 + 79, 0, 8);
    size_t result = newchunk(a1, 288);
    *(_DWORD *)(result + 16) = 21;
    *(void *)(result + 152) = result;
    *(void *)(result + 8) = v7;
    *(_DWORD *)(result + 40) = v6;
    return result;
  }
  switch(a2)
  {
    case 240:
      goto LABEL_9;
    case 32923:
      v11[0] = 0x9B8007000803AAAALL;
      return gen_bcmp(a1, 3, 0, 8u, (unsigned __int8 *)v11);
    case 254:
      goto LABEL_9;
  }
LABEL_11:
  if (a2 > 0x5DC)
  {
    int v8 = 6;
    int v9 = 8;
  }
  else
  {
    int v8 = 0;
    int v9 = 16;
  }
  size_t v10 = gen_load_absoffsetrel(a1, a1 + 79, v8, v9);
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = v10;
  *(_DWORD *)(result + 40) = a2;
  return result;
}

size_t gen_linux_sll_linktype(int *a1, int a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  if (a2 <= 253)
  {
    if (a2 == 6) {
      goto LABEL_10;
    }
    if (a2 != 224)
    {
      if (a2 != 240) {
        goto LABEL_5;
      }
LABEL_10:
      absoffsetrel = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
      size_t v10 = newchunk(a1, 288);
      *(_DWORD *)(v10 + 16) = 21;
      *(void *)(v10 + 152) = v10;
      *(void *)(v10 + 8) = absoffsetrel;
      *(_DWORD *)(v10 + 40) = 4;
      int v11 = a2 | (a2 << 8);
      uint64_t v12 = gen_load_absoffsetrel(a1, a1 + 79, 0, 8);
      size_t v6 = newchunk(a1, 288);
      *(_DWORD *)(v6 + 16) = 21;
      *(void *)(v6 + 152) = v6;
      *(void *)(v6 + 8) = v12;
      *(_DWORD *)(v6 + 40) = v11;
      gen_and(v10, v6);
      return v6;
    }
    int v16 = gen_load_absoffsetrel(a1, a1 + 79, 0, 16);
    size_t v17 = newchunk(a1, 288);
    *(_DWORD *)(v17 + 16) = 21;
    *(void *)(v17 + 152) = v17;
    *(void *)(v17 + 8) = v16;
    *(_DWORD *)(v17 + 40) = 224;
    v26[0] = 0x378100000003AAAALL;
    size_t v6 = gen_bcmp(a1, 3, 0, 8u, (unsigned __int8 *)v26);
    gen_or(v17, v6);
    size_t v18 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v19 = newchunk(a1, 288);
    *(_DWORD *)(v19 + 16) = 21;
    *(void *)(v19 + 152) = v19;
    *(void *)(v19 + 8) = v18;
    *(_DWORD *)(v19 + 40) = 4;
    gen_and(v19, v6);
    int v20 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v21 = newchunk(a1, 288);
    *(_DWORD *)(v21 + 16) = 21;
    *(void *)(v21 + 152) = v21;
    *(void *)(v21 + 8) = v20;
    *(_DWORD *)(v21 + 40) = 1;
    gen_or(v21, v6);
    int v22 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v23 = newchunk(a1, 288);
    *(_DWORD *)(v23 + 16) = 21;
    *(void *)(v23 + 152) = v23;
    *(void *)(v23 + 8) = v22;
    *(_DWORD *)(v23 + 40) = 33079;
LABEL_16:
    gen_or(v23, v6);
    return v6;
  }
  if (a2 == 33011 || a2 == 32923)
  {
    size_t v13 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v14 = newchunk(a1, 288);
    *(_DWORD *)(v14 + 16) = 21;
    *(void *)(v14 + 152) = v14;
    *(void *)(v14 + 8) = v13;
    *(_DWORD *)(v14 + 40) = 4;
    if (a2 == 32923) {
      unint64_t v15 = 0x9B8007000803AAAALL;
    }
    else {
      unint64_t v15 = 0xF38000000003AAAALL;
    }
    v26[0] = v15;
    size_t v6 = gen_bcmp(a1, 3, 0, 8u, (unsigned __int8 *)v26);
    gen_and(v14, v6);
    size_t v24 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
    size_t v23 = newchunk(a1, 288);
    *(_DWORD *)(v23 + 16) = 21;
    *(void *)(v23 + 152) = v23;
    *(void *)(v23 + 8) = v24;
    *(_DWORD *)(v23 + 40) = a2;
    goto LABEL_16;
  }
  if (a2 == 254) {
    goto LABEL_10;
  }
LABEL_5:
  size_t v4 = gen_load_absoffsetrel(a1, a1 + 82, 0, 8);
  size_t v5 = newchunk(a1, 288);
  size_t v6 = v5;
  *(_DWORD *)(v5 + 16) = 21;
  *(void *)(v5 + 152) = v5;
  *(void *)(v5 + 8) = v4;
  if (a2 > 0x5DC)
  {
    *(_DWORD *)(v5 + 40) = a2;
  }
  else
  {
    *(_DWORD *)(v5 + 40) = 4;
    unsigned int v7 = gen_load_absoffsetrel(a1, a1 + 70, a1[80], 16);
    size_t v8 = newchunk(a1, 288);
    *(_DWORD *)(v8 + 16) = 21;
    *(void *)(v8 + 152) = v8;
    *(void *)(v8 + 8) = v7;
    *(_DWORD *)(v8 + 40) = a2;
    gen_and(v6, v8);
    return v8;
  }
  return v6;
}

size_t gen_false(int *a1)
{
  size_t v2 = (_DWORD *)newchunk(a1, 40);
  *size_t v2 = 0;
  v2[6] = 1;
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = v2;
  return result;
}

uint64_t ethertype_to_ppptype(int a1)
{
  if (a1 == 34525) {
    int v1 = 87;
  }
  else {
    int v1 = a1;
  }
  if (a1 == 32923) {
    int v2 = 41;
  }
  else {
    int v2 = v1;
  }
  if (a1 == 24579) {
    int v3 = 39;
  }
  else {
    int v3 = a1;
  }
  if (a1 == 2048) {
    int v4 = 33;
  }
  else {
    int v4 = v3;
  }
  if (a1 <= 32922) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (a1 == 1536) {
    int v6 = 37;
  }
  else {
    int v6 = a1;
  }
  if (a1 == 254) {
    unsigned int v7 = 35;
  }
  else {
    unsigned int v7 = v6;
  }
  if (a1 == 224) {
    int v8 = 43;
  }
  else {
    int v8 = a1;
  }
  if (a1 == 66) {
    int v9 = 49;
  }
  else {
    int v9 = v8;
  }
  if (a1 <= 253) {
    unsigned int v7 = v9;
  }
  if (a1 <= 2047) {
    return v7;
  }
  else {
    return v5;
  }
}

size_t gen_loopback_linktype(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = a2;
  int v4 = *(_DWORD *)(a1 + 228);
  if (v4 == 109 || v4 == 0)
  {
    uint64_t v6 = *(void *)(a1 + 192);
    if (*(void *)(v6 + 64))
    {
      if (*(_DWORD *)(v6 + 56)) {
        unsigned int v2 = a2 << 24;
      }
      else {
        unsigned int v2 = a2;
      }
    }
    unsigned int v2 = bswap32(v2);
  }
  absoffsetrel = gen_load_absoffsetrel((int *)a1, (_DWORD *)(a1 + 280), 0, 0);
  size_t result = newchunk((int *)a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = absoffsetrel;
  *(_DWORD *)(result + 40) = v2;
  return result;
}

size_t gen_ipnet_linktype(int *a1, int a2)
{
  if (a2 == 34525)
  {
    absoffsetrel = gen_load_absoffsetrel(a1, a1 + 82, 0, 16);
    size_t result = newchunk(a1, 288);
    *(_DWORD *)(result + 16) = 21;
    *(void *)(result + 152) = result;
    *(void *)(result + 8) = absoffsetrel;
    int v5 = 26;
    goto LABEL_5;
  }
  if (a2 == 2048)
  {
    int v3 = gen_load_absoffsetrel(a1, a1 + 82, 0, 16);
    size_t result = newchunk(a1, 288);
    *(_DWORD *)(result + 16) = 21;
    *(void *)(result + 152) = result;
    *(void *)(result + 8) = v3;
    int v5 = 2;
LABEL_5:
    *(_DWORD *)(result + 40) = v5;
    return result;
  }
  unsigned int v7 = (_DWORD *)newchunk(a1, 40);
  *unsigned int v7 = 0;
  v7[6] = 1;
  size_t result = newchunk(a1, 288);
  *(_DWORD *)(result + 16) = 21;
  *(void *)(result + 152) = result;
  *(void *)(result + 8) = v7;
  return result;
}

size_t gen_geneve_check(int *a1, uint64_t (*a2)(int *, uint64_t, uint64_t, uint64_t), int a3, unsigned int a4, int a5)
{
  uint64_t v9 = a2(a1, 6081, 17, 2);
  size_t v10 = gen_ncmp(a1, a3, 8, 16, 192, 16, 0, 0);
  gen_and(v9, v10);
  if (a5)
  {
    if (HIBYTE(a4)) {
      bpf_error((uint64_t)a1, "Geneve VNI %u greater than maximum %u", a4, 0xFFFFFF);
    }
    size_t v11 = gen_ncmp(a1, a3, 12, 0, -256, 16, 0, a4 << 8);
    gen_and(v10, v11);
    return v11;
  }
  return v10;
}

bpf_u_int32 **__cdecl pcap_nametoaddr(const char *a1)
{
  size_t result = (bpf_u_int32 **)gethostbyname(a1);
  if (result)
  {
    size_t result = (bpf_u_int32 **)result[3];
    unsigned int v2 = *result;
    if (*result)
    {
      uint64_t v3 = 1;
      do
      {
        *unsigned int v2 = bswap32(*v2);
        unsigned int v2 = result[v3++];
      }
      while (v2);
    }
  }
  return result;
}

addrinfo *__cdecl pcap_nametoaddrinfo(const char *a1)
{
  unsigned int v2 = 0;
  *(void *)&v3.ai_flags = 0;
  memset(&v3.ai_addrlen, 0, 32);
  *(void *)&v3.ai_socktype = 0x600000001;
  if (getaddrinfo(a1, 0, &v3, &v2)) {
    return 0;
  }
  else {
    return v2;
  }
}

bpf_u_int32 pcap_nametonetaddr(const char *a1)
{
  int v1 = getnetbyname(a1);
  if (v1) {
    LODWORD(v1) = v1->n_net;
  }
  return v1;
}

int pcap_nametoport(const char *a1, int *a2, int *a3)
{
  int v22 = 0;
  *(void *)&v23.ai_flags = 0;
  memset(&v23.ai_addrlen, 0, 32);
  *(void *)&v23.ai_socktype = 0x600000001;
  int v6 = getaddrinfo(0, a1, &v23, &v22);
  if (v6)
  {
    if ((v6 - 10) < 0xFFFFFFFE) {
      return 0;
    }
    unsigned int v12 = -1;
  }
  else
  {
    if (v22)
    {
      int v8 = v22;
      while (1)
      {
        ai_addr = v8->ai_addr;
        if (ai_addr)
        {
          int sa_family = ai_addr->sa_family;
          if (sa_family == 30 || sa_family == 2) {
            break;
          }
        }
        int v8 = v8->ai_next;
        if (!v8) {
          goto LABEL_12;
        }
      }
      unsigned int v12 = bswap32(*(unsigned __int16 *)ai_addr->sa_data) >> 16;
    }
    else
    {
LABEL_12:
      unsigned int v12 = -1;
    }
    freeaddrinfo(v22);
  }
  memset(&v23.ai_addrlen, 0, 32);
  *(void *)&v23.ai_flags = 0;
  *(void *)&v23.ai_socktype = 0x1100000002;
  int v13 = getaddrinfo(0, a1, &v23, &v22);
  if (!v13)
  {
    if (v22)
    {
      int v16 = v22;
      while (1)
      {
        size_t v17 = v16->ai_addr;
        if (v17)
        {
          int v18 = v17->sa_family;
          if (v18 == 30 || v18 == 2) {
            break;
          }
        }
        int v16 = v16->ai_next;
        if (!v16) {
          goto LABEL_28;
        }
      }
      signed int v15 = bswap32(*(unsigned __int16 *)v17->sa_data) >> 16;
    }
    else
    {
LABEL_28:
      signed int v15 = -1;
    }
    freeaddrinfo(v22);
    if ((v12 & 0x80000000) != 0)
    {
      if (v15 < 0) {
        return 0;
      }
      *a2 = v15;
      int v21 = 17;
      goto LABEL_37;
    }
LABEL_31:
    *a2 = v12;
    if (v15 != v12 || v15 <= -1) {
      int v21 = 6;
    }
    else {
      int v21 = -1;
    }
LABEL_37:
    *a3 = v21;
    return 1;
  }
  int v14 = v13;
  int result = 0;
  if ((v14 & 0xFFFFFFFE) == 8 && (v12 & 0x80000000) == 0)
  {
    signed int v15 = -1;
    goto LABEL_31;
  }
  return result;
}

int pcap_nametoportrange(const char *a1, int *a2, int *a3, int *a4)
{
  uint64_t v15 = 0;
  if (sscanf(a1, "%d-%d", (char *)&v15 + 4, &v15) != 2)
  {
    int v8 = strdup(a1);
    if (!v8) {
      return (int)v8;
    }
    uint64_t v9 = v8;
    size_t v10 = strchr(v8, 45);
    if (v10 && (v11 = v10, *size_t v10 = 0, pcap_nametoport(v9, a2, a4)))
    {
      int v12 = *a4;
      int v13 = pcap_nametoport(v11 + 1, a3, a4);
      free(v9);
      if (v13)
      {
        if (*a4 == v12) {
          goto LABEL_4;
        }
        goto LABEL_3;
      }
    }
    else
    {
      free(v9);
    }
    LODWORD(v8) = 0;
    return (int)v8;
  }
  *a2 = HIDWORD(v15);
  *a3 = v15;
LABEL_3:
  *a4 = -1;
LABEL_4:
  LODWORD(v8) = 1;
  return (int)v8;
}

int pcap_nametoproto(const char *a1)
{
  int v1 = getprotobyname(a1);
  if (v1) {
    return v1->p_proto;
  }
  else {
    return -1;
  }
}

int pcap_nametoeproto(const char *a1)
{
  unsigned int v2 = (const char *)eproto_db;
  if (!eproto_db) {
    return -1;
  }
  addrinfo v3 = &off_26771CC48;
  while (strcmp(v2, a1))
  {
    int v4 = *v3;
    v3 += 2;
    unsigned int v2 = v4;
    if (!v4) {
      return -1;
    }
  }
  return *((unsigned __int16 *)v3 - 4);
}

int pcap_nametollc(const char *a1)
{
  unsigned int v2 = "iso";
  addrinfo v3 = &off_264121BE0;
  while (strcmp(v2, a1))
  {
    int v4 = *v3;
    v3 += 2;
    unsigned int v2 = v4;
    if (!v4) {
      return -1;
    }
  }
  return *((unsigned __int16 *)v3 - 4);
}

uint64_t __pcap_atoin(uint64_t result, int *a2)
{
  unsigned int v2 = (unsigned __int8 *)result;
  int v3 = 0;
  LODWORD(result) = 0;
  *a2 = 0;
  while (2)
  {
    for (unsigned int i = 0; ; unsigned int i = (char)v5 + 10 * i - 48)
    {
      int v5 = *v2++;
      if (!*(v2 - 1) || v5 == 46) {
        break;
      }
      if (i > 0x19) {
        return 0xFFFFFFFFLL;
      }
    }
    if (i > 0xFF) {
      return 0xFFFFFFFFLL;
    }
    int v3 = i | (v3 << 8);
    *a2 = v3;
    int result = (result + 8);
    if (*(v2 - 1)) {
      continue;
    }
    break;
  }
  return result;
}

uint64_t __pcap_atodn(const char *a1, int *a2)
{
  int v6 = 0;
  int v5 = 0;
  int v3 = sscanf(a1, "%d.%d", &v5, &v6);
  uint64_t result = 0;
  if (v3 == 2)
  {
    *a2 = v6 & 0x3FF | ((v5 & 0x3F) << 10);
    return 32;
  }
  return result;
}

u_char *__cdecl pcap_ether_aton(const char *a1)
{
  uint64_t result = (u_char *)malloc_type_malloc(6uLL, 0xF9ED1A19uLL);
  if (result)
  {
    for (unsigned int i = result; ; ++i)
    {
      int v4 = *(unsigned __int8 *)a1;
      if ((v4 - 45) < 2 || v4 == 58)
      {
        int v5 = *(unsigned __int8 *)++a1;
        int v4 = v5;
      }
      else if (!*a1)
      {
        return result;
      }
      int v6 = a1 + 1;
      unsigned int v7 = v4 - 48;
      unsigned int v8 = v4 - 97;
      u_char v9 = v4 - 55;
      u_char v10 = v4 - 87;
      if (v8 > 5) {
        u_char v10 = v9;
      }
      if (v7 < 0xA) {
        u_char v10 = v7;
      }
      int v11 = *(unsigned __int8 *)v6;
      char v12 = v11 - 48;
      if ((v11 - 48) >= 0xA)
      {
        if ((v11 - 65) >= 6)
        {
          if ((v11 - 97) > 5) {
            goto LABEL_18;
          }
          char v12 = v11 - 87;
        }
        else
        {
          char v12 = v11 - 55;
        }
      }
      int v6 = a1 + 2;
      u_char v10 = v12 | (16 * v10);
LABEL_18:
      *unsigned int i = v10;
      a1 = v6;
    }
  }
  return result;
}

u_char *__cdecl pcap_ether_hostton(const char *a1)
{
  if (ether_hostton(a1, &v3)) {
    return 0;
  }
  uint64_t result = (u_char *)malloc_type_malloc(6uLL, 0xB7DE37EDuLL);
  if (result)
  {
    int v2 = *(_DWORD *)v3.octet;
    *((_WORD *)result + 2) = *(_WORD *)&v3.octet[4];
    *(_DWORD *)uint64_t result = v2;
  }
  return result;
}

uint64_t __pcap_nametodnaddr()
{
  return 0;
}

uint64_t bpf_optimize(uint64_t a1, uint64_t a2)
{
  bzero(v69, 0x7E8uLL);
  uint64_t v70 = a2;
  if (setjmp(v69))
  {
    uint64_t v4 = 0xFFFFFFFFLL;
    goto LABEL_87;
  }
  ++*(_DWORD *)(a1 + 8);
  int v5 = count_blocks(a1, *(void *)a1);
  size_t v72 = (uint64_t *)malloc_type_calloc(v5, 8uLL, 0x2004093837F09uLL);
  if (!v72) {
    goto LABEL_88;
  }
  ++*(_DWORD *)(a1 + 8);
  LODWORD(count) = 0;
  number_blks_r((uint64_t)v69, a1, *(void *)a1);
  if (!count) {
    opt_error((char **)v69, "filter has no instructions; please report this as a libpcap issue");
  }
  unsigned int v73 = 2 * count;
  if ((count & 0x80000000) != 0) {
    goto LABEL_89;
  }
  uint64_t v74 = malloc_type_calloc((2 * count), 8uLL, 0x2004093837F09uLL);
  if (!v74) {
    goto LABEL_88;
  }
  if (!malloc_type_calloc(count, 8uLL, 0x2004093837F09uLL)) {
    goto LABEL_88;
  }
  unsigned int v75 = (count >> 5) + 1;
  unsigned int v76 = (v73 >> 5) + 1;
  unint64_t v6 = count * (unint64_t)v75;
  if ((v6 & 0xFFFFFFFF00000000) != 0
    || (unint64_t v7 = v73 * (unint64_t)((v73 >> 5) + 1), (v7 & 0xFFFFFFFF00000000) != 0))
  {
LABEL_89:
    opt_error((char **)v69, "filter is too complex to optimize");
  }
  unsigned int v8 = (char *)malloc_type_malloc(8 * v6 + 4 * v7, 0xE17FFE30uLL);
  v78 = v8;
  if (!v8) {
    goto LABEL_88;
  }
  u_char v9 = v8;
  v79 = v8;
  if (v5 < 1)
  {
    v80 = v8;
    uint64_t v81 = v8;
    unsigned int v32 = 0;
  }
  else
  {
    u_char v10 = v72;
    uint64_t v11 = 4 * v75;
    char v12 = v72;
    uint64_t v13 = v5;
    int v14 = v9;
    do
    {
      uint64_t v15 = *v12++;
      *(void *)(v15 + 168) = v14;
      int v16 = &v14[v11];
      v14 += v11;
      --v13;
    }
    while (v13);
    v80 = v16;
    uint64_t v17 = v5;
    do
    {
      uint64_t v18 = *v10++;
      *(void *)(v18 + 176) = v16;
      size_t v19 = &v16[v11];
      v16 += v11;
      --v17;
    }
    while (v17);
    uint64_t v81 = v19;
    uint64_t v20 = 4 * v76;
    uint64_t v21 = 8 * v76;
    int v22 = count;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v24 = v72[i];
      *(void *)(v24 + 80) = v19;
      *(void *)(v24 + 120) = &v19[v20];
      *(_DWORD *)(v24 + 72) = i;
      v74[i] = v24 + 72;
      *(_DWORD *)(v24 + 112) = v22 + i;
      v74[(v22 + i)] = v24 + 112;
      *(void *)(v24 + 96) = v24;
      *(void *)(v24 + 136) = v24;
      v19 += v21;
    }
    uint64_t v25 = 0;
    int v26 = 0;
    do
    {
      int v27 = v26;
      if (*(void *)(v72[v25] + 8))
      {
        uint64_t v28 = *(void *)(v72[v25] + 8);
        int v29 = 0;
        do
        {
          if (*(_DWORD *)v28 != -1) {
            ++v29;
          }
          uint64_t v28 = *(void *)(v28 + 32);
          int v30 = v29;
        }
        while (v28);
      }
      else
      {
        int v30 = 0;
      }
      int v31 = v27 + v30 + 1;
      int v26 = v31;
      ++v25;
    }
    while (v25 != v5);
    unsigned int v32 = 3 * v31;
  }
  v82[0] = v32;
  *(void *)&v82[1] = malloc_type_calloc(v32, 8uLL, 0x100004000313F17uLL);
  if (!*(void *)&v82[1] || (v83 = malloc_type_calloc(v82[0], 0x18uLL, 0x10200403ED2C137uLL)) == 0) {
LABEL_88:
  }
    opt_error((char **)v69, "malloc");
  opt_loop((uint64_t)v69, (uint64_t *)a1, 0);
  opt_loop((uint64_t)v69, (uint64_t *)a1, 1);
  unsigned int v33 = count;
  while (1)
  {
    if (v33)
    {
      uint64_t v34 = v33;
      size_t v35 = v72;
      uint64_t v36 = v34;
      do
      {
        uint64_t v37 = *v35++;
        *(void *)(v37 + 160) = 0;
        --v36;
      }
      while (v36);
    }
    ++*(_DWORD *)(a1 + 8);
    make_marks(a1, *(void *)a1);
    unint64_t v38 = count;
    unsigned int v33 = count;
    size_t v39 = v72;
    if (count != 1) {
      break;
    }
    uint64_t v40 = 1;
LABEL_70:
    int v56 = 1;
    size_t v57 = v39;
    uint64_t v58 = v40;
    do
    {
      uint64_t v59 = *v57;
      uint64_t v60 = *(void *)(*v57 + 88);
      if (v60)
      {
        uint64_t v61 = *(void *)(v60 + 160);
        if (v61)
        {
          int v56 = 0;
          *(void *)(v59 + 88) = v61;
        }
        uint64_t v62 = *(void *)(*(void *)(v59 + 128) + 160);
        if (v62)
        {
          int v56 = 0;
          *(void *)(v59 + 128) = v62;
        }
      }
      ++v57;
      --v58;
    }
    while (v58);
    if (v56) {
      goto LABEL_78;
    }
  }
  uint64_t v40 = count;
  int v41 = *(_DWORD *)(a1 + 8);
  unint64_t v42 = (count - 1);
  do
  {
    unint64_t v43 = v42 - 1;
    if (v42 < v38)
    {
      uint64_t v44 = v39[v43];
      if (*(_DWORD *)(v44 + 48) == v41)
      {
        uint64_t v45 = v39[v43];
        size_t v46 = (uint64_t *)(v44 + 8);
        unint64_t v47 = v42;
        while (1)
        {
          uint64_t v48 = v39[v47];
          if (*(_DWORD *)(v48 + 48) == v41
            && *(_DWORD *)(v45 + 16) == *(_DWORD *)(v48 + 16)
            && *(_DWORD *)(v45 + 40) == *(_DWORD *)(v48 + 40)
            && *(void *)(v45 + 88) == *(void *)(v48 + 88)
            && *(void *)(v45 + 128) == *(void *)(v48 + 128))
          {
            v49 = (uint64_t *)(v48 + 8);
            uint64_t v50 = v46;
            while (1)
            {
              uint64_t v51 = *v50;
              if (v51)
              {
                uint64_t v52 = v51;
                do
                {
                  BOOL v53 = *(_DWORD *)v52 == -1;
                  if (*(_DWORD *)v52 != -1) {
                    break;
                  }
                  uint64_t v52 = *(void *)(v52 + 32);
                }
                while (v52);
                char v54 = v53;
              }
              else
              {
                char v54 = 1;
                uint64_t v52 = 0;
              }
              uint64_t v55 = *v49;
              if (!v55) {
                break;
              }
              while (*(_DWORD *)v55 == -1)
              {
                uint64_t v55 = *(void *)(v55 + 32);
                if (!v55) {
                  goto LABEL_60;
                }
              }
              if ((v54 & 1) != 0 || *(_DWORD *)v52 != *(_DWORD *)v55 || *(_DWORD *)(v52 + 24) != *(_DWORD *)(v55 + 24)) {
                goto LABEL_61;
              }
              uint64_t v50 = (uint64_t *)(v52 + 32);
              v49 = (uint64_t *)(v55 + 32);
            }
LABEL_60:
            if (v54) {
              break;
            }
          }
LABEL_61:
          if (v38 == ++v47) {
            goto LABEL_62;
          }
        }
        if (*(void *)(v48 + 160)) {
          uint64_t v48 = *(void *)(v39[v47] + 160);
        }
        *(void *)(v45 + 160) = v48;
      }
    }
LABEL_62:
    unint64_t v42 = v43;
  }
  while (v43);
  if (v33) {
    goto LABEL_70;
  }
LABEL_78:
  uint64_t v63 = *(void *)(*(void *)a1 + 8);
  *(void *)(*(void *)a1 + 8) = 0;
  uint64_t v64 = *(void *)a1;
  if ((*(_DWORD *)(*(void *)a1 + 16) & 7) == 5)
  {
    uint64_t v65 = *(void *)a1;
    do
    {
      uint64_t v64 = v65;
      uint64_t v65 = *(void *)(v65 + 88);
      if (v65 != *(void *)(v64 + 128)) {
        break;
      }
      *(void *)a1 = v65;
      uint64_t v64 = v65;
    }
    while ((*(_DWORD *)(v65 + 16) & 7) == 5);
  }
  uint64_t v66 = *(void *)(v64 + 8);
  if (v66)
  {
    sappend(v63, v66);
    uint64_t v64 = *(void *)a1;
  }
  *(void *)(v64 + 8) = v63;
  uint64_t v67 = *(void *)a1;
  if ((*(_DWORD *)(*(void *)a1 + 16) & 7) == 6)
  {
    uint64_t v4 = 0;
    *(void *)(v67 + 8) = 0;
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_87:
  opt_cleanup((uint64_t)v69);
  return v4;
}

void opt_cleanup(uint64_t a1)
{
  free(*(void **)(a1 + 2008));
  free(*(void **)(a1 + 2000));
  free(*(void **)(a1 + 232));
  free(*(void **)(a1 + 256));
  free(*(void **)(a1 + 248));
  int v2 = *(void **)(a1 + 216);

  free(v2);
}

unint64_t opt_loop(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v4 = (uint64_t)a2;
  int v6 = 0;
  uint64_t v185 = *MEMORY[0x263EF8340];
  v166 = (void *)(a1 + 288);
  while (1)
  {
    int v167 = v6;
    *(void *)(a1 + 200) = 1;
    bzero(*(void **)(a1 + 248), 8 * *(unsigned int *)(a1 + 208));
    ++*(_DWORD *)(v4 + 8);
    find_levels_r(a1, v4, *(void *)v4);
    uint64_t v7 = *(void *)v4;
    unsigned int v8 = *(_DWORD *)(a1 + 240);
    if (v8 * *(_DWORD *)(a1 + 208))
    {
      memset(*(void **)(a1 + 264), 255, 4 * v8 * *(_DWORD *)(a1 + 208));
      unsigned int v8 = *(_DWORD *)(a1 + 240);
    }
    if (v8) {
      bzero(*(void **)(v7 + 168), 4 * v8);
    }
    uint64_t v9 = *(unsigned int *)(v7 + 60);
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = *(void *)(a1 + 248);
      do
      {
        for (uint64_t i = *(unsigned int **)(v10 + 8 * v9); i; uint64_t i = (unsigned int *)*((void *)i + 20))
        {
          char v12 = (int *)*((void *)i + 21);
          *(int *)((char *)v12 + (((unint64_t)*i >> 3) & 0x1FFFFFFC)) |= 1 << *i;
          uint64_t v13 = *((void *)i + 11);
          if (v13)
          {
            int v14 = *(_DWORD **)(v13 + 168);
            int v15 = *(_DWORD *)(a1 + 240);
            int v16 = v12;
            do
            {
              int v17 = *v16++;
              *v14++ &= v17;
              --v15;
            }
            while (v15);
            uint64_t v18 = *(_DWORD **)(*((void *)i + 16) + 168);
            int v19 = *(_DWORD *)(a1 + 240);
            do
            {
              int v20 = *v12++;
              *v18++ &= v20;
              --v19;
            }
            while (v19);
          }
        }
        BOOL v21 = v9-- <= 0;
      }
      while (!v21);
    }
    bzero(*(void **)(a1 + 272), 4 * (*(_DWORD *)(a1 + 240) * *(_DWORD *)(a1 + 208)));
    uint64_t v22 = *(unsigned int *)(v7 + 60);
    if ((v22 & 0x80000000) == 0)
    {
      uint64_t v23 = *(void *)(a1 + 248);
      do
      {
        for (j = *(unsigned int **)(v23 + 8 * v22); j; j = (unsigned int *)*((void *)j + 20))
        {
          uint64_t v25 = (int *)*((void *)j + 22);
          *(int *)((char *)v25 + (((unint64_t)*j >> 3) & 0x1FFFFFFC)) |= 1 << *j;
          uint64_t v26 = *((void *)j + 11);
          if (v26)
          {
            int v27 = *(_DWORD **)(v26 + 176);
            int v28 = *(_DWORD *)(a1 + 240);
            int v29 = v25;
            do
            {
              int v30 = *v29++;
              *v27++ |= v30;
              --v28;
            }
            while (v28);
            int v31 = *(_DWORD **)(*((void *)j + 16) + 176);
            int v32 = *(_DWORD *)(a1 + 240);
            do
            {
              int v33 = *v25++;
              *v31++ |= v33;
              --v32;
            }
            while (v32);
          }
        }
        BOOL v21 = v22-- <= 0;
      }
      while (!v21);
    }
    uint64_t v34 = *(void *)v4;
    uint64_t v35 = *(unsigned int *)(*(void *)v4 + 60);
    if ((v35 & 0x80000000) == 0)
    {
      uint64_t v172 = *(void *)v4;
      uint64_t v174 = *(void *)(a1 + 248);
      int v170 = *(_DWORD *)(*(void *)v4 + 60);
      do
      {
        for (uint64_t k = *(void *)(v174 + 8 * v35); k; uint64_t k = *(void *)(k + 160))
        {
          uint64_t v37 = *(void *)(k + 8);
          if (v37)
          {
            int v38 = 0;
            int v39 = 0;
            int v40 = 0;
            do
            {
              if (*(_DWORD *)v37 != -1)
              {
                unsigned int v41 = atomuse((int *)v37);
                if ((v41 & 0x80000000) == 0)
                {
                  if (v41 == 18)
                  {
                    int v42 = ~v40 & 0x30000;
                  }
                  else
                  {
                    if (v41 > 0x11) {
                      goto LABEL_392;
                    }
                    int v42 = 1 << v41;
                    if (((1 << v41) & v40) != 0) {
                      int v42 = 0;
                    }
                  }
                  v39 |= v42;
                }
                int v43 = atomdef((int *)v37);
                if (((1 << v43) & v39) != 0) {
                  int v44 = 0;
                }
                else {
                  int v44 = 1 << v43;
                }
                int v45 = v44 | v38;
                if (v43 >= 0)
                {
                  v40 |= 1 << v43;
                  int v38 = v45;
                }
              }
              uint64_t v37 = *(void *)(v37 + 32);
            }
            while (v37);
          }
          else
          {
            int v40 = 0;
            int v39 = 0;
            int v38 = 0;
          }
          if ((*(_DWORD *)(k + 16) & 7) == 5)
          {
            unsigned int v46 = atomuse((int *)(k + 16));
            if ((v46 & 0x80000000) == 0)
            {
              if (v46 == 18)
              {
                int v47 = ~v40 & 0x30000;
              }
              else
              {
                if (v46 > 0x11) {
LABEL_392:
                }
                  abort();
                int v47 = 1 << v46;
                if (((1 << v46) & v40) != 0) {
                  int v47 = 0;
                }
              }
              v39 |= v47;
            }
          }
          *(_DWORD *)(k + 192) = v40;
          *(_DWORD *)(k + 196) = v38;
          *(_DWORD *)(k + 200) = v39;
          *(_DWORD *)(k + 204) = 0;
        }
        BOOL v21 = v35-- <= 0;
      }
      while (!v21);
      uint64_t v34 = v172;
      uint64_t v4 = (uint64_t)a2;
      if (v170 >= 1)
      {
        uint64_t v48 = 1;
        do
        {
          for (uint64_t m = *(void *)(v174 + 8 * v48); m; uint64_t m = *(void *)(m + 160))
          {
            int v50 = *(_DWORD *)(*(void *)(m + 128) + 200) | *(_DWORD *)(*(void *)(m + 88) + 200) | *(_DWORD *)(m + 204);
            *(_DWORD *)(m + 200) |= v50 & ~*(_DWORD *)(m + 196);
            *(_DWORD *)(m + 204) = v50;
          }
          ++v48;
        }
        while (v48 != v170 + 1);
      }
    }
    unsigned int v51 = *(_DWORD *)(a1 + 244);
    if (v51 * *(_DWORD *)(a1 + 224))
    {
      memset(*(void **)(a1 + 280), 255, 4 * v51 * *(_DWORD *)(a1 + 224));
      unsigned int v51 = *(_DWORD *)(a1 + 244);
    }
    bzero(*(void **)(v34 + 80), 4 * v51);
    bzero(*(void **)(v34 + 120), 4 * *(unsigned int *)(a1 + 244));
    uint64_t v52 = *(unsigned int *)(v34 + 60);
    if ((v52 & 0x80000000) == 0)
    {
      do
      {
        for (uint64_t n = *(void *)(*(void *)(a1 + 248) + 8 * v52); n; uint64_t n = *(void *)(n + 160))
        {
          propedom(a1, (unsigned int *)(n + 72));
          propedom(a1, (unsigned int *)(n + 112));
        }
        BOOL v21 = v52-- <= 0;
      }
      while (!v21);
    }
    *(_DWORD *)(a1 + 1992) = 0;
    *(void *)(a1 + 2016) = *(void *)(a1 + 2008);
    bzero(*(void **)(a1 + 2000), 8 * *(unsigned int *)(a1 + 1996));
    bzero(v166, 0x6A8uLL);
    uint64_t v54 = *(unsigned int *)(*(void *)v4 + 60);
    unint64_t result = find_inedges(a1, *(void *)v4);
    int v169 = v54;
    if ((v54 & 0x80000000) == 0)
    {
      uint64_t v56 = v54;
      do
      {
        uint64_t v171 = v56;
        uint64_t v57 = *(void *)(*(void *)(a1 + 248) + 8 * v56);
        if (!v57) {
          goto LABEL_316;
        }
        do
        {
          uint64_t v58 = *(void *)(v57 + 184);
          uint64_t v59 = (_OWORD *)(v57 + 212);
          if (v58)
          {
            uint64_t v60 = *(void *)(v58 + 24);
            _OWORD *v59 = *(_OWORD *)(v60 + 212);
            long long v61 = *(_OWORD *)(v60 + 228);
            long long v62 = *(_OWORD *)(v60 + 244);
            long long v63 = *(_OWORD *)(v60 + 260);
            *(void *)(v57 + 276) = *(void *)(v60 + 276);
            *(_OWORD *)(v57 + 244) = v62;
            *(_OWORD *)(v57 + 260) = v63;
            *(_OWORD *)(v57 + 228) = v61;
            while (1)
            {
              uint64_t v58 = *(void *)(v58 + 32);
              if (!v58) {
                break;
              }
              uint64_t v64 = 0;
              uint64_t v65 = *(void *)(v58 + 24) + 212;
              do
              {
                if (*(_DWORD *)((char *)v59 + v64) != *(_DWORD *)(v65 + v64)) {
                  *(_DWORD *)((char *)v59 + v64) = 0;
                }
                v64 += 4;
              }
              while (v64 != 72);
            }
          }
          else
          {
            *(void *)(v57 + 276) = 0;
            *(_OWORD *)(v57 + 244) = 0u;
            *(_OWORD *)(v57 + 260) = 0u;
            _OWORD *v59 = 0u;
            *(_OWORD *)(v57 + 228) = 0u;
          }
          int v175 = *(_DWORD *)(v57 + 276);
          int v173 = *(_DWORD *)(v57 + 280);
          uint64_t v66 = *(void *)(v57 + 8);
          if (v66)
          {
            while (1)
            {
              int v67 = *(_DWORD *)v66;
              if (*(int *)v66 <= 75) {
                break;
              }
              if (v67 <= 123)
              {
                if (v67 > 91)
                {
                  switch(v67)
                  {
                    case '\\':
                      goto LABEL_147;
                    case ']':
                    case '^':
                    case '_':
                    case 'b':
                    case 'c':
                      goto LABEL_187;
                      uint64_t v68 = *((unsigned int *)v59 + *(unsigned int *)(v66 + 24));
                      if (a3)
                      {
                        uint64_t v69 = *(void *)(a1 + 2000);
                        if (*(_DWORD *)(v69 + 8 * v68))
                        {
                          *(_DWORD *)uint64_t v66 = 0;
                          *(_DWORD *)(v66 + 24) = *(_DWORD *)(v69 + 8 * v68 + 4);
                          *(void *)(a1 + 200) = 0x100000000;
                        }
                        if (v68 && *(_DWORD *)(v57 + 276) == v68) {
                          goto LABEL_181;
                        }
                      }
                      *(_DWORD *)(v57 + 276) = v68;
                      goto LABEL_187;
                    case 'a':
                      uint64_t v100 = *((unsigned int *)v59 + *(unsigned int *)(v66 + 24));
                      if (a3)
                      {
                        uint64_t v101 = *(void *)(a1 + 2000);
                        if (*(_DWORD *)(v101 + 8 * v100))
                        {
                          *(_DWORD *)uint64_t v66 = 1;
                          *(_DWORD *)(v66 + 24) = *(_DWORD *)(v101 + 8 * v100 + 4);
                          *(void *)(a1 + 200) = 0x100000000;
                        }
                        if (v100 && *(_DWORD *)(v57 + 280) == v100) {
                          goto LABEL_181;
                        }
                      }
                      *(_DWORD *)(v57 + 280) = v100;
                      goto LABEL_187;
                    case 'd':
                      goto LABEL_151;
                    default:
                      if (v67 == 108) {
                        goto LABEL_147;
                      }
                      if (v67 != 116) {
                        goto LABEL_187;
                      }
                      goto LABEL_151;
                  }
                }
                if (v67 != 76)
                {
                  if (v67 != 80)
                  {
                    if (v67 != 84) {
                      goto LABEL_187;
                    }
                    goto LABEL_151;
                  }
LABEL_123:
                  uint64_t v76 = *(unsigned int *)(v57 + 280);
                  if (a3)
                  {
                    uint64_t v77 = *(void *)(a1 + 2000);
                    if (*(_DWORD *)(v77 + 8 * v76))
                    {
                      unsigned int v78 = *(_DWORD *)v66 & 0x18 | 0x20;
                      *(_DWORD *)uint64_t v66 = v78;
                      int v79 = *(_DWORD *)(v66 + 24) + *(_DWORD *)(v77 + 8 * v76 + 4);
                      *(_DWORD *)(v66 + 24) = v79;
                      int v80 = F(a1, v78, v79, 0);
                      *(void *)(a1 + 200) = 0x100000000;
LABEL_179:
                      if (!v80) {
                        goto LABEL_186;
                      }
LABEL_180:
                      if (*(_DWORD *)(v57 + 276) != v80) {
                        goto LABEL_186;
                      }
                      goto LABEL_181;
                    }
                  }
                  int v70 = *(_DWORD *)(v66 + 24);
                  uint64_t v71 = a1;
                  unsigned int v72 = *(_DWORD *)v66;
LABEL_178:
                  int v80 = F(v71, v72, v70, v76);
                  if (!a3) {
                    goto LABEL_186;
                  }
                  goto LABEL_179;
                }
LABEL_147:
                uint64_t v82 = *(unsigned int *)(v57 + 280);
                if (!a3)
                {
                  LODWORD(v85) = *(_DWORD *)(v57 + 276);
LABEL_159:
                  uint64_t v91 = a1;
                  unsigned int v92 = *(_DWORD *)v66;
                  goto LABEL_185;
                }
                int v83 = *(_DWORD *)v66 & 0xF0;
                uint64_t v84 = *(void *)(a1 + 2000);
                uint64_t v85 = *(unsigned int *)(v57 + 276);
                int v86 = *(_DWORD *)(v84 + 8 * v85);
                if (*(_DWORD *)(v84 + 8 * v82))
                {
                  if (v86)
                  {
                    uint64_t v87 = a1;
                    size_t v88 = (_DWORD *)v66;
                    goto LABEL_155;
                  }
                  int v93 = v83 | 4;
                  *(_DWORD *)uint64_t v66 = v83 | 4;
                  unsigned int v94 = *(_DWORD *)(v84 + 8 * *(unsigned int *)(v57 + 280) + 4);
                  *(_DWORD *)(v66 + 24) = v94;
                  if ((v67 & 0xE0) == 0x60 && v94 >= 0x20) {
                    opt_error((char **)a1, "shift by more than 31 bits");
                  }
                  *(void *)(a1 + 200) = 0x100000000;
                  int v95 = *(_DWORD *)(v57 + 276);
                  LODWORD(v82) = F(a1, 0, v94, 0);
                  uint64_t v91 = a1;
                  unsigned int v92 = v93;
                  LODWORD(v85) = v95;
                  goto LABEL_185;
                }
                if (!v86 || *(_DWORD *)(v84 + 8 * v85 + 4)) {
                  goto LABEL_159;
                }
                if ((v67 & 0xB0) == 0 || v83 == 160)
                {
                  *(_DWORD *)uint64_t v66 = 135;
                  int v81 = *(_DWORD *)(v57 + 280);
                  if (!v81) {
                    goto LABEL_217;
                  }
LABEL_216:
                  if (*(_DWORD *)(v57 + 276) != v81) {
                    goto LABEL_217;
                  }
LABEL_181:
                  *(_DWORD *)uint64_t v66 = -1;
                  goto LABEL_187;
                }
                if ((*(_DWORD *)v66 & 0xE0) != 0x60 && v83 != 80 && (*(_DWORD *)v66 & 0xE0) != 0x20 && v83 != 144)
                {
                  if (v83 != 128) {
                    goto LABEL_159;
                  }
                  goto LABEL_181;
                }
                *(_DWORD *)uint64_t v66 = 0;
                *(_DWORD *)(v66 + 24) = 0;
                int v80 = F(a1, 0, 0, 0);
                if (!v80) {
                  goto LABEL_186;
                }
                goto LABEL_180;
              }
              if (v67 <= 147)
              {
                if (v67 > 131)
                {
                  if (v67 == 132)
                  {
                    if (a3)
                    {
                      uint64_t v102 = *(void *)(a1 + 2000);
                      uint64_t v85 = *(unsigned int *)(v57 + 276);
                      if (*(_DWORD *)(v102 + 8 * v85))
                      {
                        *(_DWORD *)uint64_t v66 = 0;
                        LODWORD(v85) = -*(_DWORD *)(v102 + 8 * *(unsigned int *)(v57 + 276) + 4);
                        *(_DWORD *)(v66 + 24) = v85;
                        goto LABEL_156;
                      }
                    }
                    else
                    {
                      LODWORD(v85) = *(_DWORD *)(v57 + 276);
                    }
                    uint64_t v91 = a1;
                    unsigned int v92 = 132;
LABEL_157:
                    LODWORD(v82) = 0;
                    goto LABEL_185;
                  }
                  if (v67 == 135)
                  {
                    int v81 = *(_DWORD *)(v57 + 280);
                    if (!a3 || !v81)
                    {
LABEL_217:
                      *(_DWORD *)(v57 + 276) = v81;
                      goto LABEL_187;
                    }
                    goto LABEL_216;
                  }
                }
                else
                {
                  if (v67 == 124) {
                    goto LABEL_147;
                  }
                  if (v67 == 128)
                  {
                    uint64_t v71 = a1;
                    unsigned int v72 = 128;
                    int v70 = 0;
                    goto LABEL_141;
                  }
                }
              }
              else if (v67 <= 163)
              {
                if (v67 == 148) {
                  goto LABEL_151;
                }
                if (v67 == 156) {
                  goto LABEL_147;
                }
              }
              else
              {
                switch(v67)
                {
                  case 164:
                    goto LABEL_151;
                  case 172:
                    goto LABEL_147;
                  case 177:
                    int v73 = *(_DWORD *)(v66 + 24);
                    uint64_t v74 = a1;
                    unsigned int v75 = 177;
LABEL_196:
                    int v99 = F(v74, v75, v73, 0);
                    if (!a3 || !v99 || *(_DWORD *)(v57 + 280) != v99)
                    {
                      *(_DWORD *)(v57 + 280) = v99;
                      break;
                    }
                    goto LABEL_181;
                }
              }
LABEL_187:
              uint64_t v66 = *(void *)(v66 + 32);
              if (!v66) {
                goto LABEL_220;
              }
            }
            if (v67 <= 31)
            {
              switch(v67)
              {
                case 0:
                  int v70 = *(_DWORD *)(v66 + 24);
                  uint64_t v71 = a1;
                  unsigned int v72 = 0;
                  goto LABEL_141;
                case 1:
                  int v73 = *(_DWORD *)(v66 + 24);
                  uint64_t v74 = a1;
                  unsigned int v75 = 0;
                  goto LABEL_196;
                case 2:
                  uint64_t v96 = *(unsigned int *)(v66 + 24);
                  int v97 = *(_DWORD *)(v57 + 276);
                  if (!a3) {
                    goto LABEL_203;
                  }
                  goto LABEL_201;
                case 3:
                  uint64_t v96 = *(unsigned int *)(v66 + 24);
                  int v97 = *(_DWORD *)(v57 + 280);
                  if (!a3) {
                    goto LABEL_203;
                  }
LABEL_201:
                  if (v97 && *((_DWORD *)v59 + v96) == v97) {
                    goto LABEL_181;
                  }
LABEL_203:
                  *((_DWORD *)v59 + v96) = v97;
                  break;
                case 4:
                  goto LABEL_151;
                case 5:
                case 6:
                case 8:
                case 9:
                case 10:
                case 11:
                  goto LABEL_187;
                case 7:
                  int v98 = *(_DWORD *)(v57 + 276);
                  if (a3 && v98 && *(_DWORD *)(v57 + 280) == v98) {
                    goto LABEL_181;
                  }
                  *(_DWORD *)(v57 + 280) = v98;
                  goto LABEL_187;
                case 12:
                  goto LABEL_147;
                default:
                  if (v67 == 20) {
                    goto LABEL_151;
                  }
                  if (v67 != 28) {
                    goto LABEL_187;
                  }
                  goto LABEL_147;
              }
              goto LABEL_187;
            }
            if (v67 > 51)
            {
              if (v67 <= 63)
              {
                if (v67 != 52)
                {
                  if (v67 != 60) {
                    goto LABEL_187;
                  }
                  goto LABEL_147;
                }
              }
              else
              {
                if (v67 == 64) {
                  goto LABEL_123;
                }
                if (v67 != 68)
                {
                  if (v67 != 72) {
                    goto LABEL_187;
                  }
                  goto LABEL_123;
                }
              }
            }
            else
            {
              if (v67 > 39)
              {
                if (v67 != 40)
                {
                  if (v67 == 44) {
                    goto LABEL_147;
                  }
                  if (v67 != 48) {
                    goto LABEL_187;
                  }
                }
LABEL_140:
                int v70 = *(_DWORD *)(v66 + 24);
                uint64_t v71 = a1;
                unsigned int v72 = *(_DWORD *)v66;
LABEL_141:
                LODWORD(v76) = 0;
                goto LABEL_178;
              }
              if (v67 == 32) {
                goto LABEL_140;
              }
              if (v67 != 36) {
                goto LABEL_187;
              }
            }
LABEL_151:
            if (!a3)
            {
              LODWORD(v90) = *(_DWORD *)(v57 + 276);
              int v89 = *(_DWORD *)(v66 + 24);
              goto LABEL_161;
            }
            int v89 = *(_DWORD *)(v66 + 24);
            if (v89)
            {
LABEL_153:
              uint64_t v90 = *(unsigned int *)(v57 + 276);
              if (*(_DWORD *)(*(void *)(a1 + 2000) + 8 * v90))
              {
                LODWORD(v82) = F(a1, 0, v89, 0);
                uint64_t v87 = a1;
                size_t v88 = (_DWORD *)v66;
                LODWORD(v85) = v90;
LABEL_155:
                fold_op(v87, v88, v85, v82);
                LODWORD(v85) = *(_DWORD *)(v66 + 24);
LABEL_156:
                uint64_t v91 = a1;
                unsigned int v92 = 0;
                goto LABEL_157;
              }
LABEL_161:
              LODWORD(v82) = F(a1, 0, v89, 0);
              uint64_t v91 = a1;
              unsigned int v92 = v67;
              LODWORD(v85) = v90;
LABEL_185:
              int v80 = F(v91, v92, v85, v82);
LABEL_186:
              *(_DWORD *)(v57 + 276) = v80;
              goto LABEL_187;
            }
            if ((*(_DWORD *)v66 & 0xF0) != 0xA0 && (v67 & 0xB0) != 0 && (*(_DWORD *)v66 & 0xE0) != 0x60)
            {
              switch(((*(_DWORD *)v66 & 0xF0u) - 32) >> 4)
              {
                case 0u:
                case 3u:
                  *(_DWORD *)uint64_t v66 = 0;
                  uint64_t v91 = a1;
                  unsigned int v92 = 0;
                  LODWORD(v85) = 0;
                  goto LABEL_157;
                case 1u:
                  opt_error((char **)a1, "division by zero");
                case 7u:
                  opt_error((char **)a1, "modulus by zero");
                default:
                  goto LABEL_153;
              }
            }
            goto LABEL_181;
          }
LABEL_220:
          if (a3
            && (!*(_DWORD *)(v57 + 204)
             && v175
             && *(_DWORD *)(v57 + 276) == v175
             && v173
             && *(_DWORD *)(v57 + 280) == v173
             || (*(_DWORD *)(v57 + 16) & 7) == 6))
          {
            if (*(void *)(v57 + 8))
            {
              *(void *)(v57 + 8) = 0;
              *(void *)(a1 + 200) = 0x100000000;
            }
            goto LABEL_310;
          }
          uint64_t v103 = *(void *)(v57 + 8);
          if (!v103)
          {
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v176 = 0u;
            goto LABEL_305;
          }
          v104 = *(_DWORD **)(v57 + 8);
          while (1)
          {
            v105 = v104;
            while (1)
            {
              int v106 = *v105;
              v107 = (int *)*((void *)v105 + 4);
              if (*v105 != -1) {
                break;
              }
              v105 = (_DWORD *)*((void *)v105 + 4);
              if (!v107) {
                goto LABEL_267;
              }
            }
            if (!v107) {
              break;
            }
            while (1)
            {
              int v108 = *v107;
              if (*v107 != -1) {
                break;
              }
              v107 = (int *)*((void *)v107 + 4);
              if (!v107) {
                goto LABEL_267;
              }
            }
            if (v106)
            {
              v104 = v107;
              if (v106 == 2)
              {
                v104 = v107;
                if (v108 == 97)
                {
                  v104 = v107;
                  if (v105[6] == v107[6])
                  {
                    *(void *)(a1 + 200) = 0x100000000;
                    int *v107 = 7;
                    v104 = v107;
                    if (!*v105) {
                      goto LABEL_246;
                    }
                  }
                }
              }
            }
            else if (v108 == 7)
            {
LABEL_246:
              _DWORD *v105 = 1;
              int *v107 = 135;
LABEL_247:
              *(void *)(a1 + 200) = 0x100000000;
LABEL_248:
              v104 = v107;
            }
            else
            {
              v104 = v107;
              if ((*(unsigned char *)(v57 + 206) & 2) == 0)
              {
                v109 = v107;
                if (v108 == 177)
                {
                  v109 = (int *)*((void *)v107 + 4);
                  v104 = v107;
                  if (v109)
                  {
                    while (1)
                    {
                      int v108 = *v109;
                      if (*v109 != -1) {
                        goto LABEL_255;
                      }
                      v109 = (int *)*((void *)v109 + 4);
                      if (!v109) {
                        goto LABEL_248;
                      }
                    }
                  }
                }
                else
                {
LABEL_255:
                  v104 = v107;
                  if (v108 == 12)
                  {
                    uint64_t v110 = *((void *)v109 + 4);
                    v104 = v107;
                    if (v110)
                    {
                      while (*(_DWORD *)v110 == -1)
                      {
                        uint64_t v110 = *(void *)(v110 + 32);
                        if (!v110) {
                          goto LABEL_248;
                        }
                      }
                      v104 = v107;
                      if (*(_DWORD *)v110 == 7)
                      {
                        uint64_t v111 = *(void *)(v110 + 32);
                        v104 = v107;
                        if (v111)
                        {
                          while (*(_DWORD *)v111 == -1)
                          {
                            uint64_t v111 = *(void *)(v111 + 32);
                            if (!v111) {
                              goto LABEL_248;
                            }
                          }
                          v104 = v107;
                          if ((*(_DWORD *)v111 & 0xE7) == 0x40)
                          {
                            *(_DWORD *)(v111 + 24) += v105[6];
                            _DWORD *v105 = -1;
                            int *v109 = -1;
                            *(_DWORD *)uint64_t v110 = -1;
                            goto LABEL_247;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_267:
          int v112 = *(_DWORD *)(v57 + 16);
          if (v112 != 21)
          {
            if (v112 == 69)
            {
              int v113 = *(_DWORD *)(v57 + 40);
              goto LABEL_270;
            }
            goto LABEL_288;
          }
          if (*(unsigned char *)(v57 + 206)) {
            goto LABEL_287;
          }
          int v114 = *v104;
          if (*v104 == 20)
          {
            _DWORD *v104 = -1;
            *(_DWORD *)(v57 + 40) += v104[6];
LABEL_283:
            *(void *)(a1 + 200) = 0x100000000;
            goto LABEL_287;
          }
          if (v114 != 84)
          {
            if (v114 == 28)
            {
              uint64_t v115 = *(unsigned int *)(v57 + 280);
              uint64_t v116 = *(void *)(a1 + 2000);
              if (*(_DWORD *)(v116 + 8 * v115))
              {
                *(_DWORD *)(v57 + 40) += *(_DWORD *)(v116 + 8 * v115 + 4);
                _DWORD *v104 = -1;
                goto LABEL_283;
              }
              if (!*(_DWORD *)(v57 + 40))
              {
                _DWORD *v104 = -1;
                int v112 = 29;
                *(_DWORD *)(v57 + 16) = 29;
                *(void *)(a1 + 200) = 0x100000000;
                goto LABEL_288;
              }
            }
LABEL_287:
            int v112 = 21;
            goto LABEL_288;
          }
          if (*(_DWORD *)(v57 + 40)) {
            goto LABEL_287;
          }
          int v113 = v104[6];
          *(_DWORD *)(v57 + 40) = v113;
          *(_DWORD *)(v57 + 16) = 69;
          _DWORD *v104 = -1;
          *(void *)(a1 + 200) = 0x100000000;
          uint64_t v117 = *(void *)(v57 + 88);
          *(void *)(v57 + 88) = *(void *)(v57 + 128);
          *(void *)(v57 + 128) = v117;
LABEL_270:
          if (v113 == -1)
          {
            *(void *)(v57 + 128) = *(void *)(v57 + 88);
          }
          else if (!v113)
          {
            *(void *)(v57 + 88) = *(void *)(v57 + 128);
          }
          int v112 = 69;
LABEL_288:
          uint64_t v118 = *(void *)(a1 + 2000);
          if ((v112 & 8) != 0)
          {
            uint64_t v119 = *(unsigned int *)(v57 + 280);
            if (*(_DWORD *)(v118 + 8 * v119))
            {
              int v120 = *(_DWORD *)(v118 + 8 * v119 + 4);
              v112 &= ~8u;
              *(_DWORD *)(v57 + 16) = v112;
              *(_DWORD *)(v57 + 40) = v120;
            }
          }
          if ((v112 & 8) == 0)
          {
            uint64_t v121 = *(unsigned int *)(v57 + 276);
            if (*(_DWORD *)(v118 + 8 * v121))
            {
              unsigned int v122 = ((v112 & 0xF0u) - 16) >> 4;
              unsigned int v123 = *(_DWORD *)(v118 + 8 * v121 + 4);
              switch(v122)
              {
                case 0u:
                  int v124 = v123 == *(_DWORD *)(v57 + 40);
                  goto LABEL_298;
                case 1u:
                  int v124 = v123 > *(_DWORD *)(v57 + 40);
                  goto LABEL_298;
                case 2u:
                  int v124 = v123 >= *(_DWORD *)(v57 + 40);
                  goto LABEL_298;
                case 3u:
                  int v124 = *(_DWORD *)(v57 + 40) & v123;
LABEL_298:
                  uint64_t v125 = *(void *)(v57 + 128);
                  uint64_t v126 = *(void *)(v57 + 88);
                  if (v125 != v126) {
                    *(void *)(a1 + 200) = 0x100000000;
                  }
                  if (v124) {
                    *(void *)(v57 + 128) = v126;
                  }
                  else {
                    *(void *)(v57 + 88) = v125;
                  }
                  break;
                default:
                  goto LABEL_392;
              }
            }
          }
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          long long v177 = 0u;
          long long v178 = 0u;
          long long v176 = 0u;
          do
          {
            deadstmt(a1, (int *)v103, (uint64_t)&v176);
            uint64_t v103 = *(void *)(v103 + 32);
          }
          while (v103);
LABEL_305:
          deadstmt(a1, (int *)(v57 + 16), (uint64_t)&v176);
          for (iuint64_t i = 0; ii != 18; ++ii)
          {
            v128 = (_DWORD *)*((void *)&v176 + ii);
            if (v128 && ((*(_DWORD *)(v57 + 204) >> ii) & 1) == 0)
            {
              _DWORD *v128 = -1;
              *(void *)(a1 + 200) = 0x100000000;
            }
          }
LABEL_310:
          int v129 = *(_DWORD *)(v57 + 16);
          if ((v129 & 8) != 0)
          {
            unint64_t result = *(unsigned int *)(v57 + 280);
          }
          else
          {
            unint64_t result = F(a1, 0, *(_DWORD *)(v57 + 40), 0);
            int v129 = *(_DWORD *)(v57 + 16);
          }
          *(_DWORD *)(v57 + 208) = result;
          *(_DWORD *)(v57 + 76) = v129;
          *(_DWORD *)(v57 + 116) = -v129;
          uint64_t v57 = *(void *)(v57 + 160);
        }
        while (v57);
LABEL_316:
        uint64_t v56 = v171 - 1;
      }
      while (v171 > 0);
    }
    uint64_t v4 = (uint64_t)a2;
    if (!a3)
    {
      if (v169 <= 0)
      {
        unint64_t result = find_inedges(a1, *a2);
      }
      else
      {
        uint64_t v130 = (v169 + 1);
        uint64_t v131 = 1;
        do
        {
          for (jj = *(void **)(*(void *)(a1 + 248) + 8 * v131); jj; jj = (void *)jj[20])
          {
            opt_j(a1, jj + 9);
            opt_j(a1, jj + 14);
          }
          ++v131;
        }
        while (v131 != v130);
        unint64_t result = find_inedges(a1, *a2);
        uint64_t v133 = 1;
        do
        {
          for (kuint64_t k = *(void **)(*(void *)(a1 + 248) + 8 * v133); kk; kuint64_t k = (void *)kk[20])
          {
            uint64_t v135 = kk[23];
            if (v135)
            {
              uint64_t v136 = *(void *)(v135 + 24);
              int v137 = *(_DWORD *)(v136 + 276);
              uint64_t v138 = kk[23];
              while (1)
              {
                uint64_t v138 = *(void *)(v138 + 32);
                if (!v138) {
                  break;
                }
                if (v137 != *(_DWORD *)(*(void *)(v138 + 24) + 276)) {
                  goto LABEL_341;
                }
              }
              v139 = (unint64_t *)(v136 + 88);
              v140 = *(void **)(v136 + 88);
              BOOL v141 = v140 == kk;
              if (v140 == kk) {
                uint64_t v142 = 88;
              }
              else {
                uint64_t v142 = 128;
              }
              if (!v141) {
                v139 = (unint64_t *)(v136 + 128);
              }
              unint64_t v143 = *(void *)(v136 + v142);
              if (v143)
              {
                char v144 = 0;
                uint64_t v145 = kk[11];
                do
                {
                  if (*(void *)(v143 + 88) != v145) {
                    break;
                  }
                  unint64_t result = *(unsigned int *)kk;
                  unint64_t v146 = result >> 5;
                  int v147 = 1 << result;
                  if (((1 << result) & *(_DWORD *)(*(void *)(v143 + 168) + 4 * (result >> 5))) == 0) {
                    break;
                  }
                  unint64_t result = *(unsigned int *)(v143 + 276);
                  if (result != v137)
                  {
                    while (1)
                    {
                      unint64_t result = v143;
                      unint64_t v143 = *(void *)(v143 + 128);
                      if (!v143
                        || *(void *)(v143 + 88) != v145
                        || (*(_DWORD *)(*(void *)(v143 + 168) + 4 * v146) & v147) == 0)
                      {
                        goto LABEL_341;
                      }
                      if (*(_DWORD *)(v143 + 276) == v137)
                      {
                        *(void *)(result + 128) = *(void *)(v143 + 128);
                        *(void *)(v143 + 128) = *v139;
                        if (v144)
                        {
                          unint64_t *v139 = v143;
                        }
                        else
                        {
                          for (muint64_t m = kk[23]; mm; muint64_t m = *(void *)(mm + 32))
                          {
                            uint64_t v161 = *(void *)(mm + 24);
                            if (*(void **)(v161 + 88) == kk) {
                              uint64_t v162 = 88;
                            }
                            else {
                              uint64_t v162 = 128;
                            }
                            *(void *)(v161 + v162) = v143;
                          }
                        }
                        *(_DWORD *)(a1 + 200) = 0;
                        uint64_t v135 = kk[23];
                        goto LABEL_341;
                      }
                    }
                  }
                  v139 = (unint64_t *)(v143 + 128);
                  char v144 = 1;
                  unint64_t v143 = *(void *)(v143 + 128);
                }
                while (v143);
              }
LABEL_341:
              if (v135)
              {
                uint64_t v148 = *(void *)(v135 + 24);
                int v149 = *(_DWORD *)(v148 + 276);
                while (1)
                {
                  uint64_t v135 = *(void *)(v135 + 32);
                  if (!v135) {
                    break;
                  }
                  if (v149 != *(_DWORD *)(*(void *)(v135 + 24) + 276)) {
                    goto LABEL_364;
                  }
                }
                v150 = *(void **)(v148 + 88);
                if (v150 == kk) {
                  uint64_t v151 = 88;
                }
                else {
                  uint64_t v151 = 128;
                }
                if (v150 == kk) {
                  v152 = (void *)(v148 + 88);
                }
                else {
                  v152 = (void *)(v148 + 128);
                }
                uint64_t v153 = *(void *)(v148 + v151);
                if (v153)
                {
                  char v154 = 0;
                  uint64_t v155 = kk[16];
                  do
                  {
                    if (*(void *)(v153 + 128) != v155) {
                      break;
                    }
                    unint64_t v156 = *(unsigned int *)kk;
                    unint64_t v157 = v156 >> 5;
                    unint64_t result = *(unsigned int *)(*(void *)(v153 + 168) + 4 * (v156 >> 5));
                    int v158 = 1 << v156;
                    if (((1 << v156) & result) == 0) {
                      break;
                    }
                    if (*(_DWORD *)(v153 + 276) != v149)
                    {
                      while (1)
                      {
                        uint64_t v159 = v153;
                        uint64_t v153 = *(void *)(v153 + 88);
                        if (!v153) {
                          goto LABEL_364;
                        }
                        unint64_t result = *(void *)(v153 + 128);
                        if (result != v155) {
                          goto LABEL_364;
                        }
                        unint64_t result = *(unsigned int *)(*(void *)(v153 + 168) + 4 * v157);
                        if ((result & v158) == 0) {
                          goto LABEL_364;
                        }
                        unint64_t result = *(unsigned int *)(v153 + 276);
                        if (result == v149)
                        {
                          *(void *)(v159 + 88) = *(void *)(v153 + 88);
                          *(void *)(v153 + 88) = *v152;
                          if (v154)
                          {
                            void *v152 = v153;
                          }
                          else
                          {
                            for (nuint64_t n = kk[23]; nn; nuint64_t n = *(void *)(nn + 32))
                            {
                              uint64_t v164 = *(void *)(nn + 24);
                              if (*(void **)(v164 + 88) == kk) {
                                uint64_t v165 = 88;
                              }
                              else {
                                uint64_t v165 = 128;
                              }
                              *(void *)(v164 + v165) = v153;
                            }
                          }
                          *(_DWORD *)(a1 + 200) = 0;
                          goto LABEL_364;
                        }
                      }
                    }
                    v152 = (void *)(v153 + 88);
                    char v154 = 1;
                    uint64_t v153 = *(void *)(v153 + 88);
                  }
                  while (v153);
                }
              }
            }
LABEL_364:
            ;
          }
          ++v133;
        }
        while (v133 != v130);
      }
    }
    int v6 = *(_DWORD *)(a1 + 200);
    if (v6) {
      return result;
    }
    if (!*(_DWORD *)(a1 + 204))
    {
      int v6 = v167 + 1;
      if (v167 >= 99) {
        break;
      }
    }
  }
  *(_DWORD *)(a1 + 200) = 1;
  return result;
}

char *icode_to_fcode(uint64_t a1, uint64_t a2, unsigned int *a3, void *a4)
{
  v20[1] = 0;
  memset(v19, 0, sizeof(v19));
  BOOL v21 = 0;
  v20[0] = a4;
  if (setjmp((int *)v19))
  {
    free(v20[1]);
    return 0;
  }
  else
  {
    ++*(_DWORD *)(a1 + 8);
    unsigned int v9 = count_stmts(a1, a2);
    *a3 = v9;
    size_t v10 = 8 * v9;
    uint64_t v11 = (char *)malloc_type_malloc(v10, 0x100004000313F17uLL);
    if (v11)
    {
      uint64_t v12 = v9;
      size_t v13 = v10;
      int v14 = v11;
      while (1)
      {
        uint64_t v15 = v12;
        bzero(v14, v13);
        v20[1] = v14;
        BOOL v21 = &v14[8 * v15];
        ++*(_DWORD *)(a1 + 8);
        if (convert_code_r((uint64_t)v19, a1, a2)) {
          return v14;
        }
        free(v14);
        ++*(_DWORD *)(a1 + 8);
        unsigned int v16 = count_stmts(a1, a2);
        *a3 = v16;
        uint64_t v17 = v16;
        size_t v18 = 8 * v16;
        int v14 = (char *)malloc_type_malloc(v18, 0x100004000313F17uLL);
        size_t v13 = v18;
        uint64_t v12 = v17;
        if (!v14) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      unint64_t result = 0;
      strcpy((char *)a4, "malloc");
    }
  }
  return result;
}

uint64_t count_stmts(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 8);
  if (*(_DWORD *)(a2 + 48) == v4) {
    return 0;
  }
  *(_DWORD *)(a2 + 48) = v4;
  int v6 = count_stmts(a1, *(void *)(a2 + 88));
  int v7 = count_stmts(a1, *(void *)(a2 + 128));
  uint64_t v8 = *(void *)(a2 + 8);
  if (v8)
  {
    int v9 = 0;
    do
    {
      if (*(_DWORD *)v8 != -1) {
        ++v9;
      }
      uint64_t v8 = *(void *)(v8 + 32);
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
  }
  return (v6 + v7 + *(_DWORD *)(a2 + 56) + v9 + *(_DWORD *)(a2 + 52) + 1);
}

uint64_t convert_code_r(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 1;
  }
  int v5 = *(_DWORD *)(a2 + 8);
  if (*(_DWORD *)(a3 + 48) == v5) {
    return 1;
  }
  *(_DWORD *)(a3 + 48) = v5;
  uint64_t result = convert_code_r(a1, a2, *(void *)(a3 + 128));
  if (result)
  {
    uint64_t result = convert_code_r(a1, a2, *(void *)(a3 + 88));
    if (result)
    {
      uint64_t v8 = *(void *)(a3 + 8);
      if (v8)
      {
        unsigned int v9 = 0;
        do
        {
          if (*(_DWORD *)v8 != -1) {
            ++v9;
          }
          uint64_t v8 = *(void *)(v8 + 32);
        }
        while (v8);
      }
      else
      {
        unsigned int v9 = 0;
      }
      uint64_t v10 = *(void *)(a1 + 200);
      uint64_t v11 = *(void *)(a1 + 208) - 8 * (v9 + *(_DWORD *)(a3 + 52) + *(_DWORD *)(a3 + 56) + 1);
      *(void *)(a1 + 208) = v11;
      *(_DWORD *)(a3 + 64) = (unint64_t)(v11 - v10) >> 3;
      if (v9)
      {
        uint64_t v12 = malloc_type_calloc(v9, 8uLL, 0x2004093837F09uLL);
        if (!v12) {
          conv_error(a1, "not enough core", v36, v37, *(void *)__format, *(void *)&__format[8], *(_OWORD *)&__format[16], *(void *)&__format[32], *(void *)&__format[40]);
        }
        size_t v13 = *(int **)(a3 + 8);
        if (!v13)
        {
LABEL_26:
          if (v13)
          {
            uint64_t v16 = 0;
            do
            {
              int v17 = *v13;
              if (*v13 != -1)
              {
                *(_WORD *)uint64_t v11 = v17;
                *(_DWORD *)(v11 + 4) = v13[6];
                if (v17 != 5 && (v17 & 7) == 5 && v16 != v9 - 2)
                {
                  strcpy(__format, "%s for block-local relative jump: off=%d");
                  uint64_t v20 = *((void *)v13 + 1);
                  if (v20 && (uint64_t v21 = *((void *)v13 + 2)) != 0)
                  {
                    if (!v9) {
                      goto LABEL_70;
                    }
                    uint64_t v22 = 0;
                    int v23 = 0;
                    int v24 = 0;
                    int v25 = ~v16;
                    do
                    {
                      uint64_t v26 = v12[v22];
                      if (v26 == v20)
                      {
                        if (v24) {
                          goto LABEL_66;
                        }
                        if ((v25 + v22) >= 0x100)
                        {
LABEL_67:
                          free(v12);
                          uint64_t v35 = "out-of-range jump";
                          goto LABEL_68;
                        }
                        *(unsigned char *)(v11 + 2) = v25 + v22;
                        int v24 = 1;
                      }
                      if (v26 == v21)
                      {
                        if (v23)
                        {
LABEL_66:
                          free(v12);
                          uint64_t v35 = "multiple matches";
                          goto LABEL_68;
                        }
                        if ((v25 + v22) >= 0x100) {
                          goto LABEL_67;
                        }
                        *(unsigned char *)(v11 + 3) = v25 + v22;
                        int v23 = 1;
                      }
                      ++v22;
                    }
                    while (v9 != v22);
                    if (v24 && v23) {
                      goto LABEL_51;
                    }
LABEL_70:
                    free(v12);
                    uint64_t v35 = "no destination found";
                  }
                  else
                  {
                    free(v12);
                    uint64_t v35 = "no jmp destination";
                  }
LABEL_68:
                  conv_error(a1, __format, v35, v16, *(void *)__format, *(void *)&__format[8], *(_OWORD *)&__format[16], *(void *)&__format[32], *(void *)&__format[40]);
                }
LABEL_51:
                v11 += 8;
                uint64_t v16 = (v16 + 1);
              }
              size_t v13 = (int *)*((void *)v13 + 4);
            }
            while (v13);
          }
          if (v12) {
            free(v12);
          }
          *(_WORD *)uint64_t v11 = *(_DWORD *)(a3 + 16);
          *(_DWORD *)(v11 + 4) = *(_DWORD *)(a3 + 40);
          uint64_t v27 = *(void *)(a3 + 88);
          if (v27)
          {
            int v28 = *(_DWORD *)(v27 + 64);
            int v29 = ~(*(_DWORD *)(a3 + 64) + v9);
            int v30 = v28 + v29;
            if ((v28 + v29) < 0x100)
            {
              int v31 = 0;
              *(unsigned char *)(v11 + 2) = v30;
            }
            else
            {
              if (!*(_DWORD *)(a3 + 52))
              {
                uint64_t result = 0;
                *(_DWORD *)(a3 + 52) = 1;
                return result;
              }
              *(unsigned char *)(v11 + 2) = 0;
              *(_WORD *)(v11 + 8) = 5;
              *(_DWORD *)(v11 + 12) = v30 - 1;
              int v31 = 1;
            }
            unsigned int v32 = *(_DWORD *)(*(void *)(a3 + 128) + 64) + v29;
            if (v32 < 0x100)
            {
              *(unsigned char *)(v11 + 3) = v32;
            }
            else
            {
              if (!*(_DWORD *)(a3 + 56))
              {
                uint64_t result = 0;
                *(_DWORD *)(a3 + 56) = 1;
                return result;
              }
              *(unsigned char *)(v11 + 3) = v31;
              unsigned int v33 = v31 + 1;
              uint64_t v34 = v11 + 8 * v33;
              *(_WORD *)uint64_t v34 = 5;
              *(_DWORD *)(v34 + 4) = v32 - v33;
            }
          }
          return 1;
        }
        unint64_t v14 = 0;
        do
        {
          v12[v14++] = v13;
          size_t v13 = (int *)*((void *)v13 + 4);
        }
        while (v14 < v9 && v13 != 0);
      }
      else
      {
        uint64_t v12 = 0;
      }
      size_t v13 = *(int **)(a3 + 8);
      goto LABEL_26;
    }
  }
  return result;
}

uint64_t install_bpf_program(uint64_t a1, const void **a2)
{
  if (pcap_validate_filter((uint64_t)a2[1], *(_DWORD *)a2))
  {
    pcap_freecode((bpf_program *)(a1 + 192));
    uint64_t v4 = *(unsigned int *)a2;
    size_t v5 = 8 * v4;
    *(_DWORD *)(a1 + 192) = v4;
    int v6 = malloc_type_malloc(8 * v4, 0x908A8E07uLL);
    *(void *)(a1 + 200) = v6;
    if (v6)
    {
      memcpy(v6, a2[1], v5);
      return 0;
    }
    uint64_t v8 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x101uLL, *v8, "malloc");
  }
  else
  {
    strcpy((char *)(a1 + 208), "BPF program is not valid");
  }
  return 0xFFFFFFFFLL;
}

uint64_t find_levels_r(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a2 + 8);
  if (*(_DWORD *)(a3 + 48) != v3)
  {
    uint64_t v5 = result;
    *(_DWORD *)(a3 + 48) = v3;
    *(void *)(a3 + 160) = 0;
    if (*(void *)(a3 + 88))
    {
      find_levels_r(result);
      uint64_t result = find_levels_r(v5);
      int v6 = *(_DWORD *)(*(void *)(a3 + 88) + 60);
      if (v6 <= *(_DWORD *)(*(void *)(a3 + 128) + 60)) {
        int v6 = *(_DWORD *)(*(void *)(a3 + 128) + 60);
      }
      int v7 = v6 + 1;
    }
    else
    {
      int v7 = 0;
    }
    *(_DWORD *)(a3 + 60) = v7;
    uint64_t v8 = *(void *)(v5 + 248);
    *(void *)(a3 + 160) = *(void *)(v8 + 8 * v7);
    *(void *)(v8 + 8 * v7) = a3;
  }
  return result;
}

uint64_t atomuse(int *a1)
{
  int v1 = *a1;
  if (*a1 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 16;
  switch(v1 & 7)
  {
    case 2:
      return result;
    case 3:
      goto LABEL_10;
    case 4:
    case 5:
      if ((v1 & 8) != 0) {
        return 18;
      }
      else {
        return 16;
      }
    case 6:
      int v5 = v1 & 0x18;
      if (v5 == 8) {
        unsigned int v6 = 17;
      }
      else {
        unsigned int v6 = -1;
      }
      if (v5 == 16) {
        return 16;
      }
      else {
        return v6;
      }
    case 7:
      if ((v1 & 0xF8) == 0x80) {
        return 17;
      }
      else {
        return 16;
      }
    default:
      int v4 = v1 & 0xE0;
      if (v4 == 64)
      {
LABEL_10:
        uint64_t result = 17;
      }
      else
      {
        if (v4 != 96) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = a1[6];
      }
      break;
  }
  return result;
}

uint64_t atomdef(int *a1)
{
  int v1 = *a1;
  if (*a1 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 16;
  switch(v1 & 7)
  {
    case 0:
    case 4:
      return result;
    case 1:
      uint64_t result = 17;
      break;
    case 2:
    case 3:
      uint64_t result = a1[6];
      break;
    case 7:
      if ((v1 & 0xF8) != 0) {
        uint64_t result = 16;
      }
      else {
        uint64_t result = 17;
      }
      break;
    default:
      return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t propedom(uint64_t result, unsigned int *a2)
{
  unint64_t v2 = *a2;
  int v3 = 1 << v2;
  uint64_t v4 = (v2 >> 3) & 0x1FFFFFFC;
  int v5 = (int *)*((void *)a2 + 1);
  uint64_t v6 = *((void *)a2 + 2);
  *(int *)((char *)v5 + v4) |= v3;
  if (v6)
  {
    int v7 = *(_DWORD **)(v6 + 80);
    int v8 = *(_DWORD *)(result + 244);
    unsigned int v9 = v5;
    do
    {
      int v10 = *v9++;
      *v7++ &= v10;
      --v8;
    }
    while (v8);
    uint64_t v11 = *(_DWORD **)(v6 + 120);
    int v12 = *(_DWORD *)(result + 244);
    do
    {
      int v13 = *v5++;
      *v11++ &= v13;
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t find_inedges(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 208);
  if (v2)
  {
    int v3 = *(uint64_t **)(result + 216);
    do
    {
      uint64_t v4 = *v3++;
      *(void *)(v4 + 184) = 0;
      --v2;
    }
    while (v2);
  }
  uint64_t v5 = *(unsigned int *)(a2 + 60);
  if ((int)v5 >= 1)
  {
    uint64_t v6 = *(void *)(result + 248);
    do
    {
      for (uint64_t i = *(void **)(v6 + 8 * v5); i; uint64_t i = (void *)i[20])
      {
        uint64_t v8 = i[11];
        i[13] = *(void *)(v8 + 184);
        *(void *)(v8 + 184) = i + 9;
        uint64_t v9 = i[16];
        i[18] = *(void *)(v9 + 184);
        *(void *)(v9 + 184) = i + 14;
      }
    }
    while (v5-- > 1);
  }
  return result;
}

uint64_t opt_j(uint64_t result, void *a2)
{
  uint64_t v2 = a2[2];
  uint64_t v3 = *(void *)(v2 + 88);
  if (v3)
  {
    if (v3 == *(void *)(v2 + 128))
    {
      unsigned int v4 = *(_DWORD *)(v3 + 204);
      if (!v4)
      {
LABEL_9:
        *(void *)(result + 200) = 0x100000000;
        a2[2] = v3;
LABEL_10:
        uint64_t v6 = *(unsigned int *)(result + 244);
        if (!v6) {
          return result;
        }
        uint64_t v7 = a2[1];
LABEL_12:
        uint64_t v8 = 0;
        uint64_t v9 = (_DWORD *)v3;
        int v10 = (uint64_t *)(v3 + 128);
        uint64_t v11 = (uint64_t *)(v3 + 88);
        while (1)
        {
          unsigned int v12 = *(_DWORD *)(v7 + 4 * v8);
          if (v12) {
            break;
          }
LABEL_34:
          if (++v8 == v6) {
            return result;
          }
        }
        int v13 = v9[4];
        while (1)
        {
          unsigned int v14 = __clz(__rbit32(v12));
          uint64_t v15 = *(void *)(*(void *)(result + 232) + 8 * (v14 | (32 * v8)));
          int v16 = *(_DWORD *)(v15 + 4);
          if (v16 >= 0) {
            int v17 = *(_DWORD *)(v15 + 4);
          }
          else {
            int v17 = -v16;
          }
          if (v13 != v17) {
            goto LABEL_33;
          }
          uint64_t v18 = *(void *)(v15 + 24);
          if (v9[69] != *(_DWORD *)(v18 + 276)) {
            goto LABEL_33;
          }
          if (v9[52] == *(_DWORD *)(v18 + 208))
          {
            if (v16 < 0) {
              int v19 = v10;
            }
            else {
              int v19 = v11;
            }
          }
          else
          {
            if (v16 < 0) {
              goto LABEL_33;
            }
            int v19 = v10;
            if (v13 != 21) {
              goto LABEL_33;
            }
          }
          uint64_t v3 = *v19;
          if (v3)
          {
            unsigned int v20 = *(_DWORD *)(v3 + 204);
            if (!v20)
            {
LABEL_36:
              *(_DWORD *)(result + 200) = 0;
              a2[2] = v3;
              if (!*(void *)(v3 + 88)) {
                return result;
              }
              goto LABEL_12;
            }
            uint64_t v21 = 0;
            while (((v20 >> v21) & 1) == 0 || *(_DWORD *)(a2[3] + 212 + 4 * v21) == *(_DWORD *)(v3 + 212 + 4 * v21))
            {
              if (++v21 == 18) {
                goto LABEL_36;
              }
            }
          }
LABEL_33:
          v12 &= ~(1 << v14);
          if (!v12) {
            goto LABEL_34;
          }
        }
      }
      uint64_t v5 = 0;
      while (((v4 >> v5) & 1) == 0 || *(_DWORD *)(a2[3] + 212 + 4 * v5) == *(_DWORD *)(v3 + 212 + 4 * v5))
      {
        if (++v5 == 18) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v3 = a2[2];
    goto LABEL_10;
  }
  return result;
}

uint64_t F(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t v4 = a1 + 8 * (((16 * a3) ^ (a4 << 8) ^ a2) % 0xD5);
  uint64_t v5 = *(void *)(v4 + 288);
  if (v5)
  {
    uint64_t v6 = *(void *)(v4 + 288);
    while (*(_DWORD *)v6 != a2 || *(_DWORD *)(v6 + 4) != a3 || *(_DWORD *)(v6 + 8) != a4)
    {
      uint64_t v6 = *(void *)(v6 + 16);
      if (!v6) {
        goto LABEL_7;
      }
    }
    return *(unsigned int *)(v6 + 12);
  }
  else
  {
LABEL_7:
    uint64_t v7 = (void *)(v4 + 288);
    uint64_t v8 = (*(_DWORD *)(a1 + 1992) + 1);
    *(_DWORD *)(a1 + 1992) = v8;
    if ((a2 & 0xE6) == 0)
    {
      uint64_t v9 = (_DWORD *)(*(void *)(a1 + 2000) + 8 * v8);
      *uint64_t v9 = 1;
      v9[1] = a3;
    }
    uint64_t v10 = *(void *)(a1 + 2016);
    *(void *)(a1 + 2016) = v10 + 24;
    *(_DWORD *)uint64_t v10 = a2;
    *(_DWORD *)(v10 + 4) = a3;
    *(_DWORD *)(v10 + 8) = a4;
    *(_DWORD *)(v10 + 12) = v8;
    *(void *)(v10 + 16) = v5;
    *uint64_t v7 = v10;
  }
  return v8;
}

void opt_error(char **a1, char *__format, ...)
{
  va_start(va, __format);
  if (a1[24]) {
    vsnprintf(a1[24], 0x100uLL, __format, va);
  }
  longjmp((int *)a1, 1);
}

double fold_op(uint64_t a1, _DWORD *a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(a1 + 2000);
  unsigned int v5 = *(_DWORD *)(v4 + 8 * a3 + 4);
  unsigned int v6 = *(_DWORD *)(v4 + 8 * a4 + 4);
  switch(*a2 >> 4)
  {
    case 0:
      int v7 = v6 + v5;
      break;
    case 1:
      int v7 = v5 - v6;
      break;
    case 2:
      int v7 = v6 * v5;
      break;
    case 3:
      if (!v6) {
        opt_error((char **)a1, "division by zero");
      }
      int v7 = v5 / v6;
      break;
    case 4:
      int v7 = v6 | v5;
      break;
    case 5:
      int v7 = v6 & v5;
      break;
    case 6:
      int v7 = v5 << v6;
      goto LABEL_14;
    case 7:
      int v7 = v5 >> v6;
LABEL_14:
      if (v6 >= 0x20) {
        int v7 = 0;
      }
      break;
    case 9:
      if (!v6) {
        opt_error((char **)a1, "modulus by zero");
      }
      int v7 = v5 % v6;
      break;
    case 10:
      int v7 = v6 ^ v5;
      break;
    default:
      abort();
  }
  a2[6] = v7;
  *a2 = 0;
  *(void *)&double result = 0x100000000;
  *(void *)(a1 + 200) = 0x100000000;
  return result;
}

uint64_t deadstmt(uint64_t a1, int *a2, uint64_t a3)
{
  unsigned int v6 = atomuse(a2);
  if ((v6 & 0x80000000) == 0)
  {
    if (v6 == 18)
    {
      *(void *)(a3 + 128) = 0;
      *(void *)(a3 + 136) = 0;
    }
    else
    {
      *(void *)(a3 + 8 * v6) = 0;
    }
  }
  uint64_t result = atomdef(a2);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v8 = *(_DWORD **)(a3 + 8 * result);
    if (v8)
    {
      *(void *)(a1 + 200) = 0x100000000;
      *uint64_t v8 = -1;
    }
    *(void *)(a3 + 8 * result) = a2;
  }
  return result;
}

uint64_t make_marks(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 8);
  if (*(_DWORD *)(a2 + 48) != v2)
  {
    uint64_t v3 = a2;
    uint64_t v4 = result;
    do
    {
      *(_DWORD *)(v3 + 48) = v2;
      if ((*(_DWORD *)(v3 + 16) & 7) == 6) {
        break;
      }
      uint64_t result = make_marks(v4, *(void *)(v3 + 88));
      uint64_t v3 = *(void *)(v3 + 128);
      int v2 = *(_DWORD *)(v4 + 8);
    }
    while (*(_DWORD *)(v3 + 48) != v2);
  }
  return result;
}

uint64_t count_blocks(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  for (uint64_t i = 0; v2; uint64_t i = (v6 + i + 1))
  {
    int v5 = *(_DWORD *)(a1 + 8);
    if (*(_DWORD *)(v2 + 48) == v5) {
      break;
    }
    *(_DWORD *)(v2 + 48) = v5;
    int v6 = count_blocks(a1, *(void *)(v2 + 88));
    uint64_t v2 = *(void *)(v2 + 128);
  }
  return i;
}

uint64_t number_blks_r(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = result;
    do
    {
      int v6 = *(_DWORD *)(a2 + 8);
      if (*(_DWORD *)(v3 + 48) == v6) {
        break;
      }
      *(_DWORD *)(v3 + 48) = v6;
      uint64_t v7 = *(unsigned int *)(v5 + 208);
      *(_DWORD *)(v5 + 208) = v7 + 1;
      if (v7 == -1) {
        opt_error((char **)v5, "filter is too complex to optimize");
      }
      *(_DWORD *)uint64_t v3 = v7;
      *(void *)(*(void *)(v5 + 216) + 8 * v7) = v3;
      uint64_t result = number_blks_r(v5, a2, *(void *)(v3 + 88));
      uint64_t v3 = *(void *)(v3 + 128);
    }
    while (v3);
  }
  return result;
}

void conv_error(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(*(char **)(a1 + 192), 0x100uLL, __format, va);
  longjmp((int *)a1, 1);
}

void pcap_create_interface(uint64_t a1, char *a2)
{
  pcap_create_common(a2, 0x4A0uLL, 1168);
  if (v2)
  {
    *(void *)(v2 + 792) = pcap_activate_bpf;
    *(void *)(v2 + 800) = pcap_can_set_rfmon_bpf;
  }
}

uint64_t pcap_activate_bpf(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(char ***)(a1 + 48);
  long long v50 = 0uLL;
  int v48 = 1;
  unsigned int _802_11 = 0;
  unsigned int v47 = 0;
  int v45 = 0;
  uint64_t v46 = 0;
  uint64_t v44 = 0;
  uint64_t v3 = (char *)(a1 + 208);
  uint64_t v4 = bpf_open(a1 + 208);
  uint64_t v5 = v4;
  if ((v4 & 0x80000000) != 0) {
    goto LABEL_19;
  }
  *(_DWORD *)(a1 + 16) = v4;
  if (ioctl(v4, 0x40044271uLL, (char *)&v50 + 12) < 0)
  {
    int v7 = *__error();
    uint64_t v8 = "BIOCVERSION";
    goto LABEL_12;
  }
  if (WORD6(v50) != 1 || !HIWORD(v50))
  {
    strcpy(v3, "kernel bpf filter out of date");
    goto LABEL_18;
  }
  if ((*(_DWORD *)(a1 + 96) - 524289) <= 0xFFF7FFFF) {
    *(_DWORD *)(a1 + 96) = 0x80000;
  }
  if (ioctl(*(_DWORD *)(a1 + 16), 0xC004427FuLL, a1 + 912) < 0)
  {
    uint64_t v10 = __error();
    pcap_strerror(*v10);
    snprintf(v3, 0x100uLL, "BIOCSWANTPKTAP: %s");
    goto LABEL_18;
  }
  unsigned int v47 = *(_DWORD *)(a1 + 916);
  if (v47 && ioctl(*(_DWORD *)(a1 + 16), 0x80044281uLL, &v47))
  {
    int v6 = __error();
    pcap_strerror(*v6);
    snprintf(v3, 0x100uLL, "BIOCSTRUNCATE: %s");
LABEL_18:
    uint64_t v5 = 0xFFFFFFFFLL;
LABEL_19:
    pcap_cleanup_bpf(a1);
    return v5;
  }
  unsigned int v47 = *(_DWORD *)(a1 + 920);
  if (v47 && ioctl(*(_DWORD *)(a1 + 16), 0x80044284uLL, &v47))
  {
    uint64_t v9 = __error();
    pcap_strerror(*v9);
    snprintf(v3, 0x100uLL, "BIOCSPKTHDRV2: %s");
    goto LABEL_18;
  }
  unsigned int v47 = *(_DWORD *)(a1 + 928);
  if (v47 == 1)
  {
    if (ioctl(*(_DWORD *)(a1 + 16), 0x80044287uLL, &v47))
    {
      int v13 = __error();
      pcap_strerror(*v13);
      snprintf(v3, 0x100uLL, "BIOCSHDRCOMP: %s");
      goto LABEL_18;
    }
    if (ioctl(*(_DWORD *)(a1 + 16), 0x40044289uLL, &v47))
    {
      unsigned int v14 = __error();
      pcap_strerror(*v14);
      snprintf(v3, 0x100uLL, "BIOCGHDRCOMPON: %s");
      goto LABEL_18;
    }
    if (v47 == 1) {
      *(_DWORD *)(a1 + 932) = 1;
    }
  }
  if (*(_DWORD *)(a1 + 924))
  {
    unsigned int v47 = 1;
    if (ioctl(*(_DWORD *)(a1 + 16), 0x80044280uLL, &v47))
    {
      uint64_t v15 = __error();
      pcap_strerror(*v15);
      snprintf(v3, 0x100uLL, "BIOCSHEADDROP: %s");
      goto LABEL_18;
    }
  }
  int v16 = strdup(*(const char **)(a1 + 120));
  *uint64_t v2 = v16;
  if (!v16)
  {
    int v7 = *__error();
    uint64_t v8 = "strdup";
    goto LABEL_12;
  }
  memset(&v51, 0, 512);
  int v17 = uname(&v51);
  if (!v17 && *(_DWORD *)(a1 + 140))
  {
    if (v51.release[0] <= 55 && v51.release[1] == 46) {
      goto LABEL_36;
    }
    if (v51.release[0] == 56 && v51.release[1] == 46)
    {
      uint64_t v18 = *(const char **)(a1 + 120);
      if (strncmp(v18, "en", 2uLL))
      {
        int v19 = socket(2, 2, 0);
        if (v19 == -1)
        {
          int v30 = __error();
          pcap_fmt_errmsg_for_errno(v3, 0x100uLL, *v30, "socket() failed");
          uint64_t v5 = 4294967291;
        }
        else
        {
          int v20 = v19;
          unsigned int v21 = device_exists(v19, *(char **)(a1 + 120), v3);
          if (v21) {
            uint64_t v5 = v21;
          }
          else {
            uint64_t v5 = 4294967290;
          }
          close(v20);
        }
        goto LABEL_19;
      }
      size_t v22 = strlen(v18);
      int v23 = (char *)malloc_type_malloc(v22 + 2, 0x250E088uLL);
      if (!v23) {
        goto LABEL_112;
      }
      int v24 = v23;
      *(_DWORD *)int v23 = 7629943;
      strcat(v23, (const char *)(*(void *)(a1 + 120) + 2));
      free(*(void **)(a1 + 120));
      *(void *)(a1 + 120) = v24;
    }
  }
  if (*(_DWORD *)(a1 + 132))
  {
    if ((ioctl(v5, 0xC0044266uLL, a1 + 132) & 0x80000000) == 0)
    {
      uint64_t v25 = bpf_bind(v5, *(char **)(a1 + 120), v3);
      uint64_t v11 = v25;
      if (v25)
      {
        if (v25 != 1)
        {
LABEL_52:
          uint64_t v5 = check_setif_failure(a1, v11);
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      goto LABEL_63;
    }
    int v7 = *__error();
    uint64_t v41 = *(void *)(a1 + 120);
    uint64_t v8 = "BIOCSBLEN: %s";
LABEL_12:
    pcap_fmt_errmsg_for_errno(v3, 0x100uLL, v7, v8, v41);
    goto LABEL_18;
  }
  if (ioctl(v5, 0x40044266uLL, &v47) < 0 || !(v47 >> 19)) {
    unsigned int v47 = 0x80000;
  }
  while (1)
  {
    ioctl(v5, 0xC0044266uLL, &v47);
    uint64_t v11 = bpf_bind(v5, *(char **)(a1 + 120), v3);
    if (!v11) {
      break;
    }
    if (*__error() != 1) {
      goto LABEL_52;
    }
    unsigned int v26 = v47;
    unsigned int v27 = v47 >> 1;
    v47 >>= 1;
    if (v26 <= 1) {
      goto LABEL_62;
    }
  }
  unsigned int v27 = v47;
LABEL_62:
  if (!v27)
  {
    snprintf(v3, 0x100uLL, "BIOCSBLEN: %s: No buffer size worked");
    goto LABEL_18;
  }
LABEL_63:
  if (ioctl(v5, 0x4004426AuLL, &v47) < 0)
  {
    int v7 = *__error();
    uint64_t v8 = "BIOCGDLT";
    goto LABEL_12;
  }
  if (get_dlt_list(v5, v47, (unsigned int *)&v50, v3) == -1) {
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 468) = v50;
  *(void *)(a1 + 472) = *(void *)((char *)&v50 + 4);
  if (v17
    || v51.release[0] - 48 > 9
    || v51.release[0] != 57 && v51.release[1] - 48 > 9)
  {
    goto LABEL_81;
  }
  unsigned int _802_11 = find_802_11((unsigned int *)&v50);
  int v28 = *(_DWORD *)(a1 + 140);
  if (_802_11 == -1)
  {
    if (v28)
    {
LABEL_36:
      uint64_t v5 = 4294967290;
      goto LABEL_19;
    }
    goto LABEL_81;
  }
  if (!v28)
  {
    if (!*(_DWORD *)(a1 + 116)) {
      remove_802_11(a1);
    }
    goto LABEL_81;
  }
  remove_non_802_11(a1);
  unsigned int v29 = _802_11;
  if (_802_11 != v47)
  {
    if (ioctl(*(_DWORD *)(a1 + 16), 0x80044278uLL, &_802_11) != -1)
    {
      unsigned int v29 = _802_11;
      unsigned int v47 = _802_11;
      goto LABEL_82;
    }
LABEL_81:
    unsigned int v29 = v47;
  }
LABEL_82:
  if (v29 == 1 && !*(_DWORD *)(a1 + 468))
  {
    int v31 = malloc_type_malloc(8uLL, 0x100004052888210uLL);
    *(void *)(a1 + 472) = v31;
    if (v31)
    {
      *int v31 = 0x8F00000001;
      *(_DWORD *)(a1 + 468) = 2;
    }
  }
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 100) = v47;
  if (ioctl(v5, 0x80044275uLL, &v48) == -1)
  {
    int v7 = *__error();
    uint64_t v8 = "BIOCSHDRCMPLT";
    goto LABEL_12;
  }
  int v32 = *(_DWORD *)(a1 + 128);
  if (v32)
  {
    v43[0] = v32 / 1000;
    v43[1] = (1000 * v32 % 1000000);
    if (ioctl(*(_DWORD *)(a1 + 16), 0x8010426DuLL, v43) < 0)
    {
      size_t v36 = *__error();
      pcap_fmt_errmsg_for_errno(v3, v36, 256, "BIOCSRTIMEOUT", v42);
      goto LABEL_18;
    }
  }
  if (*(_DWORD *)(a1 + 144))
  {
    unsigned int v47 = 1;
    if (ioctl(*(_DWORD *)(a1 + 16), 0x80044270uLL, &v47) < 0)
    {
      int v7 = *__error();
      uint64_t v8 = "BIOCIMMEDIATE";
      goto LABEL_12;
    }
  }
  if (*(_DWORD *)(a1 + 136) && ioctl(*(_DWORD *)(a1 + 16), 0x20004269uLL, 0) < 0)
  {
    unsigned int v33 = __error();
    pcap_fmt_errmsg_for_errno(v3, 0x100uLL, *v33, "BIOCPROMISC");
    uint64_t v11 = 2;
  }
  if (ioctl(v5, 0x40044266uLL, &v47) < 0)
  {
    int v7 = *__error();
    uint64_t v8 = "BIOCGBLEN";
    goto LABEL_12;
  }
  unsigned int v34 = v47;
  *(_DWORD *)(a1 + 20) = v47;
  if (*(_DWORD *)(a1 + 928))
  {
    int v35 = 256;
    *(_DWORD *)(a1 + 936) = 256;
  }
  else
  {
    int v35 = *(_DWORD *)(a1 + 936);
  }
  uint64_t v37 = malloc_type_malloc(v35 + v34, 0xC8E8A3FuLL);
  *(void *)(a1 + 24) = v37;
  if (!v37
    || (size_t v38 = *(unsigned int *)(a1 + 936), v38)
    && (uint64_t v39 = malloc_type_malloc(v38, 0x4C2AB3BFuLL), (*(void *)(a1 + 944) = v39) == 0))
  {
LABEL_112:
    int v7 = *__error();
    uint64_t v8 = "malloc";
    goto LABEL_12;
  }
  int v40 = *(_DWORD *)(a1 + 96);
  LODWORD(v46) = 6;
  HIDWORD(v46) = v40;
  LODWORD(v44) = 1;
  int v45 = &v46;
  if (ioctl(*(_DWORD *)(a1 + 16), 0x80104267uLL, &v44) < 0)
  {
    int v7 = *__error();
    uint64_t v8 = "BIOCSETF";
    goto LABEL_12;
  }
  *(_DWORD *)(a1 + 176) = *(_DWORD *)(a1 + 16);
  if (!v17
    && *(void *)v51.sysname == 0x44534265657246
    && (*(_DWORD *)v51.release == 758328884 || *(_DWORD *)v51.release == 758394420))
  {
    *(_DWORD *)(a1 + 176) = -1;
  }
  *(void *)a1 = pcap_read_bpf;
  *(void *)(a1 + 808) = pcap_inject_bpf;
  *(void *)(a1 + 824) = pcap_setfilter_bpf;
  *(void *)(a1 + 832) = pcap_setdirection_bpf;
  *(void *)(a1 + 840) = pcap_set_datalink_bpf;
  *(void *)(a1 + 848) = pcap_getnonblock_bpf;
  *(void *)(a1 + 856) = pcap_setnonblock_bpf;
  *(void *)(a1 + 864) = pcap_stats_bpf;
  *(void *)(a1 + 888) = pcap_cleanup_bpf;
  return v11;
}

uint64_t pcap_can_set_rfmon_bpf(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  memset(&v15, 0, 512);
  memset(v14, 0, 12);
  if (uname(&v15) == -1 || v15.release[0] <= 55 && v15.release[1] == 46) {
    return 0;
  }
  if (v15.release[0] != 56 || v15.release[1] != 46)
  {
    uint64_t v4 = bpf_open(a1 + 208);
    uint64_t v2 = v4;
    if ((v4 & 0x80000000) != 0) {
      return v2;
    }
    unsigned int v5 = bpf_bind(v4, *(char **)(a1 + 120), (char *)(a1 + 208));
    if (v5)
    {
      unsigned int v6 = v5;
      close(v2);
      if (v6 == 1) {
        return 0xFFFFFFFFLL;
      }
      else {
        return v6;
      }
    }
    if (get_dlt_list(v2, 0, (unsigned int *)v14, (char *)(a1 + 208)) != -1)
    {
      BOOL v9 = find_802_11((unsigned int *)v14) != -1;
      free(*(void **)((char *)v14 + 4));
      close(v2);
      return v9;
    }
    int v12 = v2;
    goto LABEL_24;
  }
  __s = 0;
  if (strncmp(*(const char **)(a1 + 120), "en", 2uLL)) {
    return 0;
  }
  int v7 = socket(2, 2, 0);
  if (v7 == -1)
  {
    uint64_t v10 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v10, "socket");
    return 0xFFFFFFFFLL;
  }
  int v8 = v7;
  if (asprintf(&__s, "wlt%s", (const char *)(*(void *)(a1 + 120) + 2)) == -1)
  {
    uint64_t v11 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v11, "malloc");
    int v12 = v8;
LABEL_24:
    close(v12);
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = device_exists(v8, __s, (char *)(a1 + 208));
  free(__s);
  close(v8);
  if (v2 == -5) {
    return 0;
  }
  if (!v2) {
    return 1;
  }
  return v2;
}

uint64_t pcap_platform_finddevs(uint64_t *a1, char *a2)
{
  if (pcap_findalldevs_interfaces(a1, a2, (unsigned int (*)(char *))check_bpf_bindable, (unsigned int (*)(char *, int *, char *))get_if_flags) == -1)return 0xFFFFFFFFLL; {
  else
  }
    return 0;
}

uint64_t check_bpf_bindable(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (strncmp((const char *)a1, "wlt", 3uLL))
  {
    int v2 = bpf_open_and_bind((char *)a1, v9);
    if ((v2 & 0x80000000) == 0)
    {
LABEL_3:
      close(v2);
      return 1;
    }
    return v2 != -5;
  }
  size_t v4 = strlen((const char *)a1);
  unsigned int v5 = (char *)malloc_type_malloc(v4, 0xB1C20A23uLL);
  if (v5)
  {
    unsigned int v6 = v5;
    strcpy(v5, "en");
    int v7 = strcat(v5, (const char *)(a1 + 3));
    int v2 = bpf_open_and_bind(v7, v9);
    free(v6);
    if ((v2 & 0x80000000) == 0) {
      goto LABEL_3;
    }
    return v2 != -5;
  }
  int v8 = __error();
  pcap_fmt_errmsg_for_errno(v9, 0x100uLL, *v8, "malloc");
  return 0xFFFFFFFFLL;
}

uint64_t get_if_flags(const char *a1, int *a2, char *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v6 = socket(2, 2, 0);
  if (v6 == -1)
  {
    uint64_t v11 = __error();
    pcap_fmt_errmsg_for_errno(a3, 0x100uLL, *v11, "Can't create socket to get media information for %s", a1);
    return 0xFFFFFFFFLL;
  }
  int v7 = v6;
  memset(v13, 0, 44);
  __strlcpy_chk();
  if (ioctl(v7, 0xC02C6938uLL, v13) < 0)
  {
    if (*__error() == 102
      || *__error() == 22
      || *__error() == 25
      || *__error() == 19
      || *__error() == 1
      || *__error() == 82)
    {
      *a2 |= 0x30u;
      close(v7);
      return 0;
    }
    int v12 = __error();
    pcap_fmt_errmsg_for_errno(a3, 0x100uLL, *v12, "SIOCGIFMEDIA on %s failed", a1);
    close(v7);
    return 0xFFFFFFFFLL;
  }
  close(v7);
  if ((BYTE12(v13[1]) & 0xE0) == 0x80) {
    *a2 |= 8u;
  }
  if ((BYTE8(v13[1]) & 1) == 0) {
    return 0;
  }
  int v8 = *a2;
  uint64_t result = 0;
  if ((BYTE8(v13[1]) & 2) != 0) {
    int v10 = v8 | 0x10;
  }
  else {
    int v10 = v8 | 0x20;
  }
  *a2 = v10;
  return result;
}

const char *pcap_lib_version(void)
{
  return "libpcap version 1.10.1";
}

uint64_t device_exists(int a1, char *__s, char *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (strlen(__s) > 0xF) {
    return 4294967291;
  }
  memset(v8, 0, sizeof(v8));
  __strlcpy_chk();
  if ((ioctl(a1, 0xC0206911uLL, v8) & 0x80000000) == 0) {
    return 0;
  }
  if (*__error() == 6 || *__error() == 22) {
    return 4294967291;
  }
  int v7 = __error();
  pcap_fmt_errmsg_for_errno(a3, 0x100uLL, *v7, "Can't get interface flags on %s", __s);
  return 0xFFFFFFFFLL;
}

uint64_t bpf_open(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (bpf_open_no_cloning_bpf) {
    goto LABEL_7;
  }
  uint64_t v2 = open("/dev/bpf", 2);
  if (v2 == -1 && (*__error() != 13 && *__error() != 2 || (uint64_t v2 = open("/dev/bpf", 0), v2 == -1)))
  {
    if (*__error() == 2)
    {
      bpf_open_no_cloning_bpf = 1;
      goto LABEL_7;
    }
    if (*__error() == 13) {
      uint64_t v2 = 4294967288;
    }
    else {
      uint64_t v2 = 0xFFFFFFFFLL;
    }
    int v10 = __error();
    pcap_fmt_errmsg_for_errno((char *)a1, 0x100uLL, *v10, "(cannot open device) %s", "/dev/bpf");
  }
  else
  {
    if (bpf_open_no_cloning_bpf == 1)
    {
LABEL_7:
      int v3 = 0;
      while (1)
      {
        snprintf(__str, 0x13uLL, "/dev/bpf%d", v3);
        uint64_t v4 = open(__str, 2);
        uint64_t v2 = v4;
        if (v4 == -1)
        {
          if (*__error() == 13)
          {
            uint64_t v2 = open(__str, 0);
            if ((v2 & 0x80000000) == 0) {
              return v2;
            }
          }
        }
        else if ((v4 & 0x80000000) == 0)
        {
          return v2;
        }
        ++v3;
        if (*__error() != 16) {
          goto LABEL_17;
        }
      }
    }
    if ((v2 & 0x80000000) != 0)
    {
      int v3 = 0;
LABEL_17:
      int v5 = *__error();
      if (v5 == 13)
      {
        int v7 = __error();
        pcap_fmt_errmsg_for_errno((char *)a1, 0x100uLL, *v7, "(cannot open BPF device) %s", __str);
        return 4294967288;
      }
      else
      {
        if (v5 == 2)
        {
          if (v3 == 1) {
            int v6 = "(there are no BPF devices)";
          }
          else {
            int v6 = "(all BPF devices are busy)";
          }
          *(_OWORD *)a1 = *(_OWORD *)v6;
          *(_OWORD *)(a1 + 11) = *(_OWORD *)(v6 + 11);
        }
        else
        {
          int v8 = __error();
          pcap_fmt_errmsg_for_errno((char *)a1, 0x100uLL, *v8, "(cannot open BPF device) %s", __str);
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return v2;
}

uint64_t bpf_bind(int a1, char *__s, char *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (strlen(__s) > 0xF) {
    return 4294967291;
  }
  memset(v10, 0, sizeof(v10));
  __strlcpy_chk();
  if ((ioctl(a1, 0x8020426CuLL, v10) & 0x80000000) == 0) {
    return 0;
  }
  int v7 = *__error();
  switch(v7)
  {
    case 6:
      return 4294967291;
    case 55:
      int v8 = __error();
      pcap_fmt_errmsg_for_errno(a3, 0x100uLL, *v8, "The requested buffer size for %s is too large", __s);
      return 1;
    case 50:
      return 4294967287;
    default:
      uint64_t v9 = __error();
      pcap_fmt_errmsg_for_errno(a3, 0x100uLL, *v9, "Binding interface %s to BPF device failed", __s);
      return 0xFFFFFFFFLL;
  }
}

uint64_t get_dlt_list(int a1, int a2, unsigned int *a3, char *a4)
{
  a3[2] = 0;
  *(void *)a3 = 0;
  if (ioctl(a1, 0xC00C4279uLL, a3))
  {
    if (*__error() == 22) {
      return 0;
    }
    int v16 = *__error();
    pcap_fmt_errmsg_for_errno(a4, 0x100uLL, v16, "BIOCGDLTLIST");
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = malloc_type_malloc(4 * (*a3 + 1), 0x100004052888210uLL);
  *(void *)(a3 + 1) = v9;
  if (!v9)
  {
    int v17 = *__error();
    pcap_fmt_errmsg_for_errno(a4, 0x100uLL, v17, "malloc");
    return 0xFFFFFFFFLL;
  }
  if (ioctl(a1, 0xC00C4279uLL, a3) < 0)
  {
    uint64_t v18 = __error();
    pcap_fmt_errmsg_for_errno(a4, 0x100uLL, *v18, "BIOCGDLTLIST");
    free(*(void **)(a3 + 1));
    return 0xFFFFFFFFLL;
  }
  if (a2 != 1) {
    return 0;
  }
  uint64_t v10 = *a3;
  if (v10)
  {
    uint64_t v11 = *a3;
    uint64_t v12 = *(int **)(a3 + 1);
    while (1)
    {
      int v14 = *v12++;
      int v13 = v14;
      if (v14 != 226 && v13 != 1) {
        return 0;
      }
      if (!--v11) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_21:
  uint64_t result = 0;
  *(_DWORD *)(*(void *)(a3 + 1) + 4 * v10) = 143;
  ++*a3;
  return result;
}

uint64_t find_802_11(unsigned int *a1)
{
  uint64_t v1 = *a1;
  if (v1)
  {
    uint64_t v2 = *(int **)(a1 + 1);
    uint64_t result = 0xFFFFFFFFLL;
    while (1)
    {
      int v5 = *v2++;
      unsigned int v4 = v5;
      if (v5 <= 126) {
        break;
      }
      if (v4 == 127)
      {
        uint64_t result = 127;
      }
      else if (v4 == 163)
      {
        goto LABEL_13;
      }
LABEL_17:
      if (!--v1) {
        return result;
      }
    }
    if (v4 - 119 >= 2)
    {
      if (result == -1) {
        unsigned int v6 = 105;
      }
      else {
        unsigned int v6 = result;
      }
      if (v4 == 105) {
        uint64_t result = v6;
      }
      else {
        uint64_t result = result;
      }
      goto LABEL_17;
    }
LABEL_13:
    if (result == 127) {
      uint64_t result = 127;
    }
    else {
      uint64_t result = v4;
    }
    goto LABEL_17;
  }
  return 0xFFFFFFFFLL;
}

uint64_t check_setif_failure(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 != -5) {
    return v2;
  }
  if (!*(_DWORD *)(a1 + 140) || strncmp(*(const char **)(a1 + 120), "wlt", 3uLL)) {
    return 4294967291;
  }
  int v5 = socket(2, 2, 0);
  if (v5 == -1)
  {
    int v8 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), *v8, 256, "socket() failed");
    return 4294967291;
  }
  int v6 = v5;
  uint64_t v10 = (const char *)(*(void *)(a1 + 120) + 3);
  __s = 0;
  if (asprintf(&__s, "en%s", v10) == -1)
  {
    uint64_t v9 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v9, "malloc");
    close(v6);
    return 4294967291;
  }
  unsigned int v7 = device_exists(v6, __s, (char *)(a1 + 208));
  free(__s);
  if (v7 == -5) {
    uint64_t v2 = 4294967290;
  }
  else {
    uint64_t v2 = v7;
  }
  close(v6);
  return v2;
}

uint64_t remove_non_802_11(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 468);
  if (v1 < 1)
  {
    int v3 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    int v3 = 0;
    uint64_t v4 = *(void *)(result + 472);
    do
    {
      int v5 = *(_DWORD *)(v4 + 4 * v2);
      if (v5 != 1 && v5 != 12)
      {
        *(_DWORD *)(v4 + 4 * v3++) = v5;
        int v1 = *(_DWORD *)(result + 468);
      }
      ++v2;
    }
    while (v2 < v1);
  }
  *(_DWORD *)(result + 468) = v3;
  return result;
}

uint64_t remove_802_11(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 468);
  if (v1 < 1)
  {
    int v3 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    int v3 = 0;
    uint64_t v4 = *(void *)(result + 472);
    do
    {
      int v5 = *(_DWORD *)(v4 + 4 * v2);
      BOOL v6 = (v5 - 105) > 0x3A || ((1 << (v5 - 105)) & 0x40000000040C001) == 0;
      if (v6 && v5 != 192)
      {
        *(_DWORD *)(v4 + 4 * v3++) = v5;
        int v1 = *(_DWORD *)(result + 468);
      }
      ++v2;
    }
    while (v2 < v1);
  }
  *(_DWORD *)(result + 468) = v3;
  return result;
}

uint64_t pcap_read_bpf(size_t a1, int a2, void (*a3)(uint64_t, long long *, char *), uint64_t a4)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(a1 + 48);
  while (1)
  {
    if (*(_DWORD *)(a1 + 44)) {
      goto LABEL_56;
    }
    int v8 = *(_DWORD *)(a1 + 40);
    if (v8)
    {
      uint64_t v11 = *(int **)(a1 + 32);
      goto LABEL_13;
    }
    int v8 = read(*(_DWORD *)(a1 + 16), (void *)(*(void *)(a1 + 24) + *(unsigned int *)(a1 + 936)), *(unsigned int *)(a1 + 20));
    if ((v8 & 0x80000000) == 0) {
      break;
    }
    if (*__error() == 22)
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "read EINVAL buffer %p %p bufsize %u compress_head_space %u");
      return 0xFFFFFFFFLL;
    }
    int v9 = *__error();
    if (v9 != 4)
    {
      if ((v9 - 5) >= 2)
      {
        if (v9 == 35) {
          return 0;
        }
        int v24 = __error();
        pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v24, "read");
      }
      else
      {
        strcpy((char *)(a1 + 208), "The interface disappeared");
      }
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t v11 = (int *)(*(void *)(a1 + 24) + *(unsigned int *)(a1 + 936));
LABEL_13:
  if (v8 < 1)
  {
    uint64_t v10 = 0;
LABEL_46:
    unsigned int v25 = *(_DWORD *)(a1 + 936);
    if (v25 && *(_DWORD *)(a1 + 932))
    {
      unsigned int v26 = *(_DWORD *)(a1 + 960);
      if (v26 >= v25) {
        size_t v27 = v25;
      }
      else {
        size_t v27 = v26;
      }
      memcpy(*(void **)(a1 + 944), *(const void **)(a1 + 952), v27);
      *(void *)(a1 + 952) = *(void *)(a1 + 944);
      unsigned int v28 = *(_DWORD *)(a1 + 960);
      if (v28 >= *(_DWORD *)(a1 + 936)) {
        unsigned int v28 = *(_DWORD *)(a1 + 936);
      }
      *(_DWORD *)(a1 + 960) = v28;
    }
    *(_DWORD *)(a1 + 40) = 0;
    return v10;
  }
  uint64_t v10 = 0;
  int v30 = (int *)((char *)v11 + v8);
  while (!*(_DWORD *)(a1 + 44))
  {
    uint64_t v12 = v11[2];
    int v13 = v11[2];
    uint64_t v14 = *((unsigned __int16 *)v11 + 8);
    utsname v15 = (char *)v11 + v14;
    if (!*(_DWORD *)(v7 + 8)
      && !pcap_filter(*(void *)(a1 + 200), (char *)v11 + v14, v11[3], v11[2]))
    {
      uint64_t v11 = (int *)((char *)v11 + (((v12 + v14) + 3) & 0x1FFFFFFFCLL));
      goto LABEL_40;
    }
    uint64_t v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    *(void *)&long long v32 = *v11;
    DWORD2(v32) = v11[1];
    LODWORD(v33) = v13;
    DWORD1(v33) = v11[3];
    pcap_read_bpf_header(a1, (uint64_t)v11, (uint64_t)&v32);
    int v16 = *(_DWORD *)(a1 + 928);
    if (v16 == 2)
    {
      uint64_t v19 = *(void *)(a1 + 952);
      if (v19)
      {
        uint64_t v20 = 0;
        do
        {
          int v21 = v15[v20];
          int v22 = *(unsigned __int8 *)(v19 + v20++);
        }
        while (v21 == v22);
        unsigned __int8 v23 = v20 - 1;
        if (v23)
        {
          ++*(void *)(a1 + 1000);
          *(void *)(a1 + 1008) += v23;
          if (*(unsigned __int8 *)(a1 + 1016) < v23) {
            *(unsigned char *)(a1 + 1016) = v23;
          }
LABEL_36:
          *(void *)(a1 + 976) += v12;
          *(void *)(a1 + 984) += v14;
          *(void *)(a1 + 952) = v15;
LABEL_37:
          *(_DWORD *)(a1 + 960) = v13;
          goto LABEL_38;
        }
      }
      else
      {
        ++*(void *)(a1 + 968);
      }
      ++*(void *)(a1 + 992);
      goto LABEL_36;
    }
    if (v16 == 1)
    {
      unsigned int v17 = *((unsigned __int8 *)v11 + 18);
      if (*((unsigned char *)v11 + 18) && *(_DWORD *)(a1 + 932))
      {
        uint64_t v18 = *(const void **)(a1 + 952);
        if (!v18)
        {
          snprintf((char *)(a1 + 208), 0x100uLL, "prev_datap NULL bh_complen %u prev_caplen %u caplen %u \n");
          return 0xFFFFFFFFLL;
        }
        v15 -= *((unsigned __int8 *)v11 + 18);
        if ((unint64_t)v15 < *(void *)(a1 + 24) - (unint64_t)*(unsigned int *)(a1 + 936))
        {
          snprintf((char *)(a1 + 208), 0x100uLL, "datap underflow bh_complen %u prev_caplen %u caplen %u \n");
          return 0xFFFFFFFFLL;
        }
        if (*(_DWORD *)(a1 + 960) < v17)
        {
          snprintf((char *)(a1 + 208), 0x100uLL, "bh_complen prev_caplen bh_complen %u prev_caplen %u caplen %u \n");
          return 0xFFFFFFFFLL;
        }
        memmove(v15, v18, *((unsigned __int8 *)v11 + 18));
        LODWORD(v33) = v12 + v17;
      }
      *(void *)(a1 + 952) = v15;
      int v13 = v12 + v17;
      goto LABEL_37;
    }
LABEL_38:
    a3(a4, &v32, v15);
    uint64_t v11 = (int *)((char *)v11 + (((v12 + v14) + 3) & 0x1FFFFFFFCLL));
    uint64_t v10 = (v10 + 1);
    if (a2 >= 1 && (int)v10 >= a2)
    {
      *(void *)(a1 + 32) = v11;
      *(_DWORD *)(a1 + 40) = (v30 - v11) & ~(((int)v30 - (int)v11) >> 31);
      return v10;
    }
LABEL_40:
    if (v11 >= v30) {
      goto LABEL_46;
    }
  }
  *(void *)(a1 + 32) = v11;
  *(_DWORD *)(a1 + 40) = (v30 - v11) & ~(((int)v30 - (int)v11) >> 31);
  if (v10) {
    return v10;
  }
LABEL_56:
  *(_DWORD *)(a1 + 44) = 0;
  return 4294967294;
}

ssize_t pcap_inject_bpf(uint64_t a1, const void *a2, int a3)
{
  size_t v5 = a3;
  ssize_t result = write(*(_DWORD *)(a1 + 16), a2, a3);
  if (result == -1)
  {
    if (*__error() == 47)
    {
      int v9 = 0;
      if (ioctl(*(_DWORD *)(a1 + 16), 0x80044275uLL, &v9) == -1)
      {
        int v8 = *__error();
        pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, v8, "send: can't turn off BIOCSHDRCMPLT");
        return 0xFFFFFFFFLL;
      }
      ssize_t result = write(*(_DWORD *)(a1 + 16), a2, v5);
      if (result != -1) {
        return result;
      }
    }
    int v7 = *__error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, v7, "send");
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t pcap_setfilter_bpf(uint64_t a1, const void **a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  pcap_freecode((bpf_program *)(a1 + 192));
  uint64_t result = ioctl(*(_DWORD *)(a1 + 16), 0x80104267uLL, a2);
  if (!result)
  {
    *(_DWORD *)(v4 + 8) = 1;
    *(_DWORD *)(a1 + 40) = 0;
    return result;
  }
  if (*__error() != 22)
  {
    BOOL v6 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v6, "BIOCSETF");
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 928))
  {
    strcpy((char *)(a1 + 208), "compression mode requires in kernel filtering");
    return 0xFFFFFFFFLL;
  }
  if ((install_bpf_program(a1, a2) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(_DWORD *)(v4 + 8) = 0;
  return result;
}

uint64_t pcap_setdirection_bpf(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 3:
      int v6 = 0;
      int v3 = "\"none\"";
      break;
    case 2:
      int v6 = 2;
      int v3 = "\"outgoing only\"";
      break;
    case 1:
      int v6 = 1;
      int v3 = "\"incoming only\"";
      break;
    default:
      int v6 = 3;
      int v3 = "\"incoming and outgoing\"";
      break;
  }
  if (ioctl(*(_DWORD *)(a1 + 16), 0x8004428BuLL, &v6) != -1) {
    return 0;
  }
  size_t v5 = __error();
  pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x101uLL, *v5, "Cannot set direction to %s", v3);
  return 0xFFFFFFFFLL;
}

uint64_t pcap_set_datalink_bpf(uint64_t a1, int a2)
{
  int v5 = a2;
  if (ioctl(*(_DWORD *)(a1 + 16), 0x80044278uLL, &v5) != -1) {
    return 0;
  }
  uint64_t v4 = __error();
  pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x101uLL, *v4, "Cannot set DLT %d", v5);
  return 0xFFFFFFFFLL;
}

uint64_t pcap_stats_bpf(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 16);
  uint64_t v7 = 0;
  if (ioctl(v4, 0x4008426FuLL, &v7) < 0)
  {
    int v6 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v6, "BIOCGSTATS");
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
    *(void *)a2 = v7;
    *(_DWORD *)(a2 + 8) = 0;
  }
  return result;
}

void pcap_cleanup_bpf(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (*(_DWORD *)(v2 + 12))
  {
    pcap_remove_from_pcaps_to_close(a1);
    *(_DWORD *)(v2 + 12) = 0;
  }
  if (*(void *)v2)
  {
    free(*(void **)v2);
    *(void *)uint64_t v2 = 0;
  }

  pcap_cleanup_live_common(a1);
}

uint64_t bpf_open_and_bind(char *a1, char *a2)
{
  uint64_t v4 = bpf_open((uint64_t)a2);
  uint64_t v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    unsigned int v6 = bpf_bind(v4, a1, a2);
    if (v6)
    {
      unsigned int v7 = v6;
      close(v5);
      if (v7 == 1) {
        return 0xFFFFFFFFLL;
      }
      else {
        return v7;
      }
    }
  }
  return v5;
}

pcap_t *__cdecl pcap_open(const char *source, int snaplen, int flags, int read_timeout, pcap_rmtauth *auth, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return 0;
}

int pcap_createsrcstr(char *source, int type, const char *host, const char *port, const char *name, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return -1;
}

int pcap_parsesrcstr(const char *source, int *type, char *host, char *port, char *name, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return -1;
}

int pcap_findalldevs_ex(const char *source, pcap_rmtauth *auth, pcap_if_t **alldevs, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return -1;
}

pcap_samp *__cdecl pcap_setsampling(pcap_t *p)
{
  return 0;
}

int pcap_remoteact_accept(const char *address, const char *port, const char *hostlist, char *connectinghost, pcap_rmtauth *auth, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return -1;
}

int pcap_remoteact_accept_ex(const char *address, const char *port, const char *hostlist, char *connectinghost, pcap_rmtauth *auth, int uses_ssl, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return -1;
}

int pcap_remoteact_list(char *hostlist, char sep, int size, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return -1;
}

int pcap_remoteact_close(const char *host, char *errbuf)
{
  if (errbuf) {
    strcpy(errbuf, "not supported");
  }
  return -1;
}

uint64_t dlt_to_linktype(uint64_t result)
{
  if (result == 18) {
    return 246;
  }
  if (result != 149 && (result - 104) >= 0xBA)
  {
    uint64_t v1 = 0;
    int v2 = 0;
    while (v2 != result)
    {
      int v2 = map[v1 + 2];
      v1 += 2;
      if (v1 == 40) {
        return 0xFFFFFFFFLL;
      }
    }
    return map[v1 + 1];
  }
  return result;
}

uint64_t linktype_to_dlt(uint64_t result)
{
  if (result == 246) {
    return 18;
  }
  if (result != 149 && (result == 106 || (result - 104) >= 0xBA))
  {
    uint64_t v1 = 0;
    while (map[v1 + 1] != result)
    {
      v1 += 2;
      if (v1 == 40) {
        return result;
      }
    }
    return map[v1];
  }
  return result;
}

uint64_t max_snaplen_for_dlt(int a1)
{
  if (a1 == 279) {
    int v1 = 0x800000;
  }
  else {
    int v1 = 0x80000;
  }
  if (a1 == 249) {
    unsigned int v2 = 0x100000;
  }
  else {
    unsigned int v2 = v1;
  }
  if (a1 == 231) {
    return 0x8000000;
  }
  else {
    return v2;
  }
}

uint64_t swap_pseudo_headers(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((int)result > 219)
  {
    if (result == 220)
    {
      return swap_linux_usb_header(a2, a3, 1);
    }
    else if (result == 239)
    {
      unsigned int v3 = *(_DWORD *)(a2 + 16);
      unsigned int v4 = *(_DWORD *)(a2 + 20);
      BOOL v6 = v3 >= 4;
      unsigned int v5 = v3 - 4;
      BOOL v6 = v6 && v4 >= 4;
      if (v6 && !*(unsigned char *)(a3 + 1) && v5 >= 4)
      {
        unsigned int v7 = (unsigned __int16 *)(a3 + 4);
        unsigned int v8 = v4 - 4;
        do
        {
          v7[1] = bswap32(v7[1]) >> 16;
          unsigned int v9 = bswap32(*v7) >> 16;
          *unsigned int v7 = v9;
          __int16 v10 = v9 + 3;
          if ((v10 & 0xFFFC) == 0) {
            break;
          }
          unsigned __int16 v11 = v10 & 0xFFFC;
          if (v5 < v11 || v8 < v11) {
            break;
          }
          v8 -= v11;
          v5 -= v11;
          unsigned int v7 = (unsigned __int16 *)((char *)v7 + v11);
        }
        while (v5 > 3);
      }
    }
  }
  else if (result == 113)
  {
    unsigned int v13 = *(_DWORD *)(a2 + 16);
    unsigned int v14 = *(_DWORD *)(a2 + 20);
    if (v13 >= 0x10
      && v14 >= 0x10
      && __rev16(*(unsigned __int16 *)(a3 + 14)) - 14 >= 0xFFFFFFFE
      && v13 >= 0x14
      && v14 >= 0x14)
    {
      *(_DWORD *)(a3 + 16) = bswap32(*(_DWORD *)(a3 + 16));
    }
  }
  else if (result == 189)
  {
    return swap_linux_usb_header(a2, a3, 0);
  }
  return result;
}

uint64_t swap_linux_usb_header(uint64_t result, uint64_t a2, int a3)
{
  unsigned int v3 = *(_DWORD *)(result + 16);
  if (v3 >= 8)
  {
    *(void *)a2 = bswap64(*(void *)a2);
    if (v3 >= 0xE)
    {
      *(_WORD *)(a2 + 12) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
      if (v3 >= 0x18)
      {
        *(void *)(a2 + 16) = bswap64(*(void *)(a2 + 16));
        if (v3 >= 0x1C)
        {
          *(_DWORD *)(a2 + 24) = bswap32(*(_DWORD *)(a2 + 24));
          if (v3 >= 0x20)
          {
            *(_DWORD *)(a2 + 28) = bswap32(*(_DWORD *)(a2 + 28));
            if (v3 >= 0x24)
            {
              *(_DWORD *)(a2 + 32) = bswap32(*(_DWORD *)(a2 + 32));
              if (v3 >= 0x28)
              {
                *(_DWORD *)(a2 + 36) = bswap32(*(_DWORD *)(a2 + 36));
                int v4 = *(unsigned __int8 *)(a2 + 9);
                if (*(unsigned char *)(a2 + 9))
                {
                  if (!a3) {
                    return result;
                  }
                }
                else
                {
                  if (v3 < 0x2C) {
                    return result;
                  }
                  *(_DWORD *)(a2 + 40) = bswap32(*(_DWORD *)(a2 + 40));
                  if (*(_DWORD *)(result + 16) < 0x30u) {
                    return result;
                  }
                  *(_DWORD *)(a2 + 44) = bswap32(*(_DWORD *)(a2 + 44));
                  if (!a3) {
                    return result;
                  }
                }
                unsigned int v5 = *(_DWORD *)(result + 16);
                if (v5 >= 0x34)
                {
                  *(_DWORD *)(a2 + 48) = bswap32(*(_DWORD *)(a2 + 48));
                  if (v5 >= 0x38)
                  {
                    *(_DWORD *)(a2 + 52) = bswap32(*(_DWORD *)(a2 + 52));
                    if (v5 >= 0x3C)
                    {
                      *(_DWORD *)(a2 + 56) = bswap32(*(_DWORD *)(a2 + 56));
                      if (v5 >= 0x40)
                      {
                        unsigned int v6 = *(_DWORD *)(a2 + 60);
                        unsigned int v7 = bswap32(v6);
                        *(_DWORD *)(a2 + 60) = v7;
                        if (!v4 && v6 && v5 >= 0x44)
                        {
                          unsigned int v8 = 1;
                          uint64_t v9 = 64;
                          do
                          {
                            uint64_t v10 = a2 + v9;
                            *(_DWORD *)(a2 + v9) = bswap32(*(_DWORD *)(a2 + v9));
                            if (v5 < (int)v9 + 8) {
                              break;
                            }
                            *(_DWORD *)(v10 + 4) = bswap32(*(_DWORD *)(v10 + 4));
                            if (v5 < (int)v9 + 12) {
                              break;
                            }
                            *(_DWORD *)(v10 + 8) = bswap32(*(_DWORD *)(v10 + 8));
                            if (v8 >= v7) {
                              break;
                            }
                            unsigned int v11 = v9 + 20;
                            ++v8;
                            v9 += 16;
                          }
                          while (v5 >= v11);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t pcap_cleanup_pktap_interface(const char *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t result = pcap_cleanup_pktap_interface_internal(a1, v2);
  if (result) {
    return fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v2);
  }
  return result;
}

uint64_t pcap_cleanup_pktap_interface_internal(const char *a1, char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = socket(2, 2, 0);
  if (v4 != -1)
  {
    int v5 = v4;
    int v18 = 0;
    memset(v17, 0, sizeof(v17));
    __strlcpy_chk();
    if (ioctl(v5, 0xC0946990uLL, v17) < 0)
    {
      uint64_t v12 = __error();
      strerror(*v12);
      snprintf(a2, 0x100uLL, "%s: ioctl SIOCGIFDESC %s - %s");
    }
    else
    {
      if (!LODWORD(v17[1])
        || (*(void *)((char *)&v17[1] + 4) == 0x207061637062696CLL
          ? (BOOL v6 = *(void *)((char *)&v17[1] + 12) == 0x6F6C63206F747561)
          : (BOOL v6 = 0),
            v6 ? (BOOL v7 = *(void *)((char *)&v17[2] + 4) == 0x697665642064656ELL) : (BOOL v7 = 0),
            v7 ? (BOOL v8 = WORD6(v17[2]) == 25955) : (BOOL v8 = 0),
            !v8
         || pcap_get_if_attach_count(a1, a2) != 1
         || (long long v15 = 0u, v16 = 0u, __strlcpy_chk(), (ioctl(v5, 0x80206979uLL, &v15) & 0x80000000) == 0)))
      {
        uint64_t v9 = 0;
LABEL_23:
        close(v5);
        return v9;
      }
      unsigned int v14 = __error();
      strerror(*v14);
      snprintf(a2, 0x100uLL, "%s: ioctl(SIOCIFDESTROY) fail - %s");
    }
    uint64_t v9 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  uint64_t v10 = __error();
  unsigned int v11 = strerror(*v10);
  snprintf(a2, 0x100uLL, "%s: socket failed - %s", "pcap_cleanup_pktap_interface_internal", v11);
  return 0xFFFFFFFFLL;
}

char *pcap_setup_pktap_interface(char *a1, char *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  long long v57 = 0u;
  long long v58 = 0u;
  int v56 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  memset(v49, 0, sizeof(v49));
  long long v48 = 0u;
  int v4 = (char *)malloc_type_calloc(1uLL, 0x18uLL, 0x220B0E49uLL);
  if (!v4)
  {
    BOOL v7 = __error();
    BOOL v8 = pcap_strerror(*v7);
    snprintf(a2, 0x100uLL, "malloc(): %s", v8);
    return v4;
  }
  int v5 = socket(2, 2, 0);
  if (v5 == -1)
  {
    uint64_t v9 = __error();
    pcap_strerror(*v9);
    snprintf(a2, 0x100uLL, "socket(): %s");
    goto LABEL_17;
  }
  if (!strncmp(a1, "pktap", 5uLL))
  {
    uint64_t v12 = strchr(a1, 44);
    uint64_t v10 = v12;
    if (v12) {
      size_t v13 = v12 - a1;
    }
    else {
      size_t v13 = strlen(a1);
    }
    if (v13 - 24 < 0xFFFFFFFFFFFFFFE7) {
      goto LABEL_16;
    }
    __memmove_chk();
    v4[v13] = 0;
    unsigned int v11 = "pktap";
    sscanf(v4, "pktap%d");
  }
  else if (!strcmp(a1, "all") || !strcmp(a1, "any"))
  {
    uint64_t v10 = "all";
    unsigned int v11 = "pktap";
  }
  else
  {
    if (strncmp(a1, "iptap", 5uLL))
    {
      if (strncmp(a1, "droptap", 7uLL))
      {
        BOOL v6 = __error();
        pcap_strerror(*v6);
        snprintf(a2, 0x100uLL, "bad device name: %s");
LABEL_17:
        long long v15 = 0;
        goto LABEL_79;
      }
      if ((unint64_t)__strlcpy_chk() < 0x18)
      {
        uint64_t v10 = 0;
        unsigned int v11 = "droptap";
        sscanf(v4, "droptap%d");
        goto LABEL_19;
      }
LABEL_16:
      unsigned int v14 = __error();
      pcap_strerror(*v14);
      snprintf(a2, 0x100uLL, "device name too long: %s");
      goto LABEL_17;
    }
    if ((unint64_t)__strlcpy_chk() >= 0x18) {
      goto LABEL_16;
    }
    uint64_t v10 = 0;
    unsigned int v11 = "iptap";
    sscanf(v4, "iptap%d");
  }
LABEL_19:
  long long v16 = if_nameindex();
  long long v15 = v16;
  if (v16)
  {
    if (v16->if_index)
    {
      long long v43 = a2;
      int v42 = 0;
      p_if_name = &v16->if_name;
      do
      {
        size_t v18 = strlen(v11);
        if (!strncmp(*p_if_name, v11, v18))
        {
          int v56 = 0;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          memset(v49, 0, sizeof(v49));
          long long v48 = 0u;
          __strlcpy_chk();
          if (ioctl(v5, 0xC0946990uLL, &v48) < 0)
          {
            long long v39 = __error();
            uint64_t v41 = (uint64_t)pcap_strerror(*v39);
            int v24 = "ioctl(SIOCGIFDESC): %s";
LABEL_77:
            long long v38 = v43;
            goto LABEL_78;
          }
          if (v49[0])
          {
            BOOL v20 = *(void *)&v49[1] == 0x207061637062696CLL && *(void *)&v49[3] == 0x6F6C63206F747561;
            BOOL v21 = v20 && *(void *)&v49[5] == 0x697665642064656ELL;
            if (v21 && LOWORD(v49[7]) == 25955)
            {
              if (pcap_get_if_attach_count(*p_if_name, a2))
              {
                *a2 = 0;
              }
              else
              {
                __strlcpy_chk();
                int v42 = 1;
              }
            }
          }
        }
        int v19 = *((_DWORD *)p_if_name + 2);
        p_if_name += 2;
      }
      while (v19);
      if (v42) {
        goto LABEL_45;
      }
    }
    long long v57 = 0u;
    long long v58 = 0u;
    __strlcpy_chk();
    if (ioctl(v5, 0xC0206978uLL, &v57) < 0)
    {
      long long v37 = __error();
      uint64_t v41 = (uint64_t)pcap_strerror(*v37);
      int v24 = "ioctl(SIOCIFCREATE): %s";
    }
    else
    {
      snprintf(v4, 0x18uLL, "%s", (const char *)&v57);
LABEL_45:
      int v56 = 0;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      memset(v49, 0, sizeof(v49));
      long long v48 = 0u;
      __strlcpy_chk();
      unsigned int v25 = getprogname();
      pid_t v26 = getpid();
      unsigned int v27 = snprintf((char *)&v49[1], 0x80uLL, "%s - %s.%d", "libpcap auto cloned device", v25, v26);
      if (v27 < 0x80) {
        int v28 = v27 + 1;
      }
      else {
        int v28 = 128;
      }
      v49[0] = v28;
      if ((ioctl(v5, 0xC094698FuLL, &v48) & 0x80000000) == 0)
      {
        if (v10)
        {
          long long v43 = a2;
          long long v29 = 0uLL;
          memset(v47, 0, sizeof(v47));
          if (*v10)
          {
            int v30 = 0;
            do
            {
              *(_OWORD *)__str = v29;
              long long v45 = v29;
              if (*v10 == 44)
              {
                size_t v31 = 1;
              }
              else
              {
                if (v30 >= 8)
                {
                  uint64_t v41 = 8;
                  int v24 = "Too many pktap parameters, max is %u";
                  goto LABEL_77;
                }
                long long v32 = strchr(v10, 44);
                if (v32) {
                  size_t v31 = v32 - v10;
                }
                else {
                  size_t v31 = strlen(v10);
                }
                if (v31 >= 0x18)
                {
                  strcpy(a2, "Interface name too big for filter");
                  goto LABEL_79;
                }
                if (!strcmp(v10, "all") || !strcmp(v10, "any"))
                {
                  *(void *)__str = 0x100000001;
                  *(_DWORD *)&__str[8] = 0;
                }
                else
                {
                  *(void *)__str = 0x200000001;
                  __strncpy_chk();
                }
                long long v33 = v45;
                long long v34 = &v47[2 * v30];
                *long long v34 = *(_OWORD *)__str;
                v34[1] = v33;
                ++v30;
                long long v29 = 0uLL;
              }
              v10 += v31;
            }
            while (*v10);
            if (v30 >= 1)
            {
              memset(__str, 0, sizeof(__str));
              snprintf(__str, 0x10uLL, "%s", v4);
              long long v45 = xmmword_20D914B30;
              long long v46 = v47;
              if (ioctl(v5, 0x8028697BuLL, __str) == -1)
              {
                long long v35 = __error();
                uint64_t v41 = (uint64_t)pcap_strerror(*v35);
                int v24 = "ioctl(SIOCSDRVSPEC): %s";
                goto LABEL_77;
              }
            }
          }
        }
        goto LABEL_80;
      }
      long long v36 = __error();
      uint64_t v41 = (uint64_t)pcap_strerror(*v36);
      int v24 = "ioctl(SIOCSIFDESC): %s";
    }
  }
  else
  {
    unsigned __int8 v23 = __error();
    uint64_t v41 = (uint64_t)pcap_strerror(*v23);
    int v24 = "if_nameindex: %s";
  }
  long long v38 = a2;
LABEL_78:
  snprintf(v38, 0x100uLL, v24, v41);
LABEL_79:
  free(v4);
  int v4 = 0;
LABEL_80:
  if (v15) {
    MEMORY[0x210560850](v15);
  }
  if (v5 != -1) {
    close(v5);
  }
  return v4;
}

uint64_t pcap_get_if_attach_count(const char *a1, char *a2)
{
  int v4 = 0;
  uint64_t v14 = *MEMORY[0x263EF8340];
  while (1)
  {
    snprintf(__str, 0x13uLL, "/dev/bpf%d", v4);
    int v5 = open(__str, 0);
    if ((v5 & 0x80000000) == 0) {
      break;
    }
    ++v4;
    if (*__error() != 16) {
      return 0xFFFFFFFFLL;
    }
  }
  int v7 = v5;
  long long v11 = 0u;
  long long v12 = 0u;
  __strlcpy_chk();
  if (ioctl(v7, 0xC020427DuLL, &v11) == -1)
  {
    BOOL v8 = __error();
    uint64_t v9 = strerror(*v8);
    snprintf(a2, 0x100uLL, "ioctl BIOCGIFATTACHCOUNT %s failed - %s", a1, v9);
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v6 = v12;
  }
  close(v7);
  return v6;
}

void pktap_cleanup(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unsigned int v2 = *(void (**)(void, unsigned char *))(a1 + 1024);
  if (v2) {
    v2(*(void *)(a1 + 120), v4);
  }
  (*(void (**)(uint64_t))(a1 + 1048))(a1);
  uint64_t v3 = *(void **)(a1 + 1032);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 1032) = 0;
  }
}

uint64_t pktap_create(char *a1, char *a2, _DWORD *a3)
{
  if (a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = "pktap";
  }
  if (!strncmp(v5, "pktap", 5uLL)
    || !strncmp(v5, "iptap", 5uLL)
    || !strncmp(v5, "droptap", 7uLL)
    || !strcmp(v5, "all")
    || !strcmp(v5, "any"))
  {
    *a3 = 1;
    pcap_create_interface((uint64_t)a2, 0);
    uint64_t v6 = v7;
    if (v7)
    {
      BOOL v8 = pcap_setup_pktap_interface(v5, a2);
      if (v8)
      {
        *(void *)(v6 + 1032) = v8;
        *(void *)(v6 + 1024) = pcap_cleanup_pktap_interface_internal;
        *(void *)(v6 + 1040) = *(void *)(v6 + 792);
        *(void *)(v6 + 792) = pktap_activate;
      }
      else
      {
        pcap_close((pcap_t *)v6);
        return 0;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
    *a3 = 0;
  }
  return v6;
}

uint64_t pktap_activate(uint64_t a1)
{
  free(*(void **)(a1 + 120));
  *(void *)(a1 + 120) = *(void *)(a1 + 1032);
  *(void *)(a1 + 1032) = 0;
  if (*(_DWORD *)(a1 + 96) <= 0x9Bu) {
    *(_DWORD *)(a1 + 96) = 0x80000;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1040))(a1);
  if (!result)
  {
    *(void *)(a1 + 1048) = *(void *)(a1 + 888);
    *(void *)(a1 + 888) = pktap_cleanup;
  }
  return result;
}

uint64_t pcap_ng_dump_shb_comment(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((pcap_ng_dump_shb_comment_info_done & 1) == 0)
  {
    if (uname((utsname *)&pcap_ng_dump_shb_comment_utsname) == -1)
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: uname() failed");
      return 0;
    }
    pid_t v6 = getpid();
    if (proc_pidinfo(v6, 13, 1uLL, &pcap_ng_dump_shb_comment_bsdinfo, 64) < 0)
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: proc_pidinfo(PROC_PIDT_SHORTBSDINFO) failed");
      return 0;
    }
    pcap_ng_dump_shb_comment_info_done = 1;
  }
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7 || (pcap_ng_block_alloc(*(int *)(a1 + 96) + 4096), uint64_t v7 = v8, (*(void *)(a2 + 16) = v8) != 0))
  {
    if (*(_DWORD *)(a1 + 1104) && *(_DWORD *)(a2 + 8)) {
      return 1;
    }
    if (pcap_ng_block_reset(v7, 168627466))
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_reset(PCAPNG_BT_SHB) failed");
    }
    else if (pcap_ng_block_add_option_with_string(v7, 2, byte_26ABEC574))
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_add_option_with_string(PCAPNG_SHB_HARDWARE) failed");
    }
    else
    {
      snprintf(__str, 0x100uLL, "%s", byte_26ABEC474);
      if (pcap_ng_block_add_option_with_string(v7, 3, __str))
      {
        snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_add_option_with_string(PCAPNG_SHB_OS) failed");
      }
      else
      {
        uint64_t v10 = pcap_lib_version();
        snprintf(__str, 0x100uLL, "%s (%s)", byte_26ABEC140, v10);
        if (pcap_ng_block_add_option_with_string(v7, 4, __str))
        {
          snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_add_option_with_string(PCAPNG_SHB_USERAPPL) failed");
        }
        else
        {
          if (!a3 || !*a3 || !pcap_ng_block_add_option_with_string(v7, 1, a3))
          {
            pcap_ng_dump_block(a2, v7);
            uint64_t result = 1;
            *(_DWORD *)(a1 + 1104) = 1;
            *(_DWORD *)(a2 + 8) = 1;
            return result;
          }
          snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_add_option_with_string(PCAPNG_OPT_COMMENT) failed");
        }
      }
    }
  }
  else
  {
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_alloc() failed ");
  }
  return 0;
}

uint64_t pcap_ng_dump_shb(uint64_t a1, uint64_t a2)
{
  return pcap_ng_dump_shb_comment(a1, a2, 0);
}

uint64_t pcap_ng_dump_proc_info(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!*(_DWORD *)(a4 + 24))
  {
    if (pcap_ng_block_reset(a3, -2147483647))
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_reset(PCAPNG_BT_PIB) failed");
    }
    else
    {
      *(_DWORD *)pcap_ng_get_process_information_fields(a3) = *(_DWORD *)(v4 + 8);
      if (pcap_ng_block_add_option_with_string(a3, 2, *(char **)(v4 + 16)))
      {
        snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_add_option_with_string(PCAPNG_PIB_NAME, %s) failed");
      }
      else
      {
        if (uuid_is_null((const unsigned __int8 *)(v4 + 28))
          || !pcap_ng_block_add_option_with_uuid(a3, 4, (void *)(v4 + 28)))
        {
          pcap_ng_dump_block(a2, a3);
          *(_DWORD *)(v4 + 24) = 1;
          int v9 = *(_DWORD *)(a2 + 64);
          *(_DWORD *)(a2 + 64) = v9 + 1;
          *(_DWORD *)(v4 + 4) = v9;
          return v4;
        }
        snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_add_option_with_uuid(PCAPNG_PIB_UUID) failed");
      }
    }
    return 0;
  }
  return v4;
}

uint64_t pcap_ng_dump_kern_event(uint64_t a1, uint64_t a2, int *a3, uint64_t *a4)
{
  if (pcap_ng_dump_shb_comment(a1, a2, 0))
  {
    uint64_t v8 = *(void *)(a2 + 16);
    if (!pcap_ng_block_reset(v8, -2147483646))
    {
      os_event_fields = (_DWORD *)pcap_ng_get_os_event_fields(v8);
      uint64_t v9 = 1;
      uint64_t v11 = *a4;
      _DWORD *os_event_fields = 1;
      os_event_fields[1] = v11;
      int v12 = *a3;
      os_event_fields[2] = *((_DWORD *)a4 + 2);
      os_event_fields[3] = v12;
      pcap_ng_block_packet_set_data(v8, (uint64_t)a3, v12);
      pcap_ng_dump_block(a2, v8);
      return v9;
    }
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_reset(PCAPNG_BT_OSEV) failed", "pcap_ng_dump_kern_event");
  }
  return 0;
}

uint64_t pcap_ng_dump_if_info(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!*(_DWORD *)(a4 + 40))
  {
    if (pcap_ng_block_reset(a3, 1))
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_reset(PCAPNG_BT_IDB) failed");
    }
    else
    {
      uint64_t interface_description_fields = pcap_ng_get_interface_description_fields(a3);
      *(_WORD *)uint64_t interface_description_fields = dlt_to_linktype(*(unsigned int *)(v4 + 16));
      *(_DWORD *)(interface_description_fields + 4) = *(_DWORD *)(v4 + 20);
      if (!pcap_ng_block_add_option_with_string(a3, 2, *(char **)(v4 + 8)))
      {
        pcap_ng_dump_block(a2, a3);
        *(_DWORD *)(v4 + 40) = 1;
        int v10 = *(_DWORD *)(a2 + 40);
        *(_DWORD *)(a2 + 40) = v10 + 1;
        *(_DWORD *)(v4 + 4) = v10;
        return v4;
      }
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_add_option_with_string(PCAPNG_IF_NAME, %s) failed");
    }
    return 0;
  }
  return v4;
}

uint64_t pcap_ng_dump_pktap_comment(uint64_t a1, uint64_t a2, int32x2_t *a3, unsigned int *a4, char *a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t __src = 0;
  if (a3[2].i32[1] < 0x9Cu || (unsigned int v7 = a3[2].u32[0], v7 < 0x9C) || *a4 > v7)
  {
    uint64_t v9 = (char *)(a1 + 208);
LABEL_5:
    snprintf(v9, 0x100uLL, "%s: Packet too short");
    return 0;
  }
  uint64_t result = pcap_ng_dump_shb_comment(a1, a2, 0);
  if (result)
  {
    uint64_t v13 = *(void *)(a2 + 16);
    uint64_t v14 = pcap_if_info_set_find_by_name((unsigned int *)(a2 + 24), (char *)a4 + 12);
    if (v14
      || (uint64_t result = (uint64_t)pcap_if_info_set_add((int *)(a2 + 24), (char *)a4 + 12, 0xFFFFFFFF, a4[2], *(_DWORD *)(a1 + 96), *(const char **)(a1 + 1096), (char *)(a1 + 208)), (v14 = result) != 0))
    {
      if (a3[2].i32[1] < 0x9Cu || (unsigned int v15 = a3[2].u32[0], v15 < 0x9C) || (v16 = *a4, v16 > v15))
      {
        uint64_t v9 = (char *)(a1 + 208);
        goto LABEL_5;
      }
      if (!*(void *)(v14 + 32)
        || (memcpy(&__dst, a3, sizeof(__dst)),
            *(int32x2_t *)&__dst.capleuint64_t n = vsub_s32(*(int32x2_t *)&__dst.caplen, vdup_n_s32(v16)),
            uint64_t result = pcap_offline_filter((const bpf_program *)(v14 + 24), &__dst, (const u_char *)a4 + v16),
            result))
      {
        uint64_t result = pcap_ng_dump_if_info(a1, a2, v13, v14);
        if (result)
        {
          uint64_t v17 = result;
          int v18 = a4[13];
          if ((v18 + 1) <= 1 && !*((unsigned char *)a4 + 56))
          {
            if (uuid_is_null((const unsigned __int8 *)a4 + 124))
            {
              uint64_t v19 = 0;
              goto LABEL_24;
            }
            int v18 = a4[13];
          }
          uint64_t result = (uint64_t)pcap_ng_dump_proc(a1, a2, v13, v18, (char *)a4 + 56, (unsigned __int8 *)a4 + 124);
          uint64_t v19 = result;
          if (!result) {
            return result;
          }
LABEL_24:
          int v20 = a4[21];
          if ((v20 + 1) <= 1 && !*((unsigned char *)a4 + 88))
          {
            if (uuid_is_null((const unsigned __int8 *)a4 + 140))
            {
              uint64_t v21 = 0;
              goto LABEL_30;
            }
            int v20 = a4[21];
          }
          uint64_t result = (uint64_t)pcap_ng_dump_proc(a1, a2, v13, v20, (char *)a4 + 88, (unsigned __int8 *)a4 + 140);
          uint64_t v21 = result;
          if (!result) {
            return result;
          }
LABEL_30:
          if (pcap_ng_block_reset(v13, 6))
          {
            snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_reset(PCAPNG_BT_EPB) failed");
            return 0;
          }
          if (a4[1] == 2)
          {
            if (*((unsigned char *)a4 + 160)) {
              uint64_t v22 = *((unsigned __int8 *)a4 + 160) + 165;
            }
            else {
              uint64_t v22 = 161;
            }
          }
          else
          {
            uint64_t v22 = *a4;
          }
          uint64_t enhanced_packet_fields = pcap_ng_get_enhanced_packet_fields(v13);
          *(_DWORD *)uint64_t enhanced_packet_fields = *(_DWORD *)(v17 + 4);
          int v24 = (const float *)a4;
          int32x2_t v26 = (int32x2_t)vld1_dup_f32(v24);
          uint64_t v25 = (uint64_t)v24 + v22;
          int32x2_t v27 = vsub_s32(a3[2], v26);
          *(int32x2_t *)(enhanced_packet_fields + 12) = v27;
          *(void *)(enhanced_packet_fields + 4) = __ROR8__(a3[1].i32[0] + 1000000 * *(void *)a3, 32);
          pcap_ng_block_packet_set_data(v13, v25, v27.i32[0]);
          if (v19) {
            pcap_ng_block_add_option_with_value(v13, 32769, (void *)(v19 + 4), 4uLL);
          }
          if (v21) {
            pcap_ng_block_add_option_with_value(v13, 32771, (void *)(v21 + 4), 4uLL);
          }
          unsigned int v28 = a4[9];
          if (v28)
          {
            int v29 = 1;
          }
          else
          {
            if ((v28 & 2) == 0)
            {
              if (!HIDWORD(__src))
              {
LABEL_51:
                if (a4[19] != -1) {
                  pcap_ng_block_add_option_with_value(v13, 32770, a4 + 19, 4uLL);
                }
                if (a4[27]) {
                  pcap_ng_block_add_option_with_value(v13, 32773, a4 + 27, 4uLL);
                }
                if (*((_WORD *)a4 + 37)) {
                  pcap_ng_block_add_option_with_value(v13, 32774, (char *)a4 + 74, 2uLL);
                }
                if (a4[1] == 2)
                {
                  pcap_ng_block_add_option_with_value(v13, 32775, a4 + 39, 4uLL);
                  if (*((unsigned char *)a4 + 160))
                  {
                    pcap_ng_block_add_option_with_value(v13, 32776, (char *)a4 + 162, 2uLL);
                    pcap_ng_block_add_option_with_string(v13, 32777, (char *)a4 + 164);
                  }
                }
                if (a5 && *a5) {
                  pcap_ng_block_add_option_with_string(v13, 1, a5);
                }
                unsigned int v30 = a4[9];
                if ((v30 & 0x4000) != 0)
                {
                  LODWORD(__src) = __src | 1;
                  if ((v30 & 0x8000) == 0)
                  {
LABEL_65:
                    if ((v30 & 0x10000) == 0) {
                      goto LABEL_66;
                    }
                    goto LABEL_74;
                  }
                }
                else if ((v30 & 0x8000) == 0)
                {
                  goto LABEL_65;
                }
                LODWORD(__src) = __src | 4;
                if ((v30 & 0x10000) == 0)
                {
LABEL_66:
                  if ((v30 & 0x20000) == 0) {
                    goto LABEL_67;
                  }
                  goto LABEL_75;
                }
LABEL_74:
                LODWORD(__src) = __src | 2;
                if ((v30 & 0x20000) == 0)
                {
LABEL_67:
                  if ((v30 & 0x40000) == 0) {
                    goto LABEL_69;
                  }
                  goto LABEL_68;
                }
LABEL_75:
                LODWORD(__src) = __src | 8;
                if ((v30 & 0x40000) == 0)
                {
LABEL_69:
                  if ((v30 & 0x100000) != 0)
                  {
                    LODWORD(__src) = __src | 0x20;
                  }
                  else if (!__src)
                  {
                    goto LABEL_79;
                  }
                  pcap_ng_block_add_option_with_value(v13, 32772, &__src, 4uLL);
LABEL_79:
                  unsigned int v32 = a4[28];
                  size_t v31 = a4 + 28;
                  if (v32) {
                    pcap_ng_block_add_option_with_value(v13, 32778, v31, 4uLL);
                  }
                  pcap_ng_dump_block(a2, v13);
                  return 1;
                }
LABEL_68:
                LODWORD(__src) = __src | 0x10;
                goto LABEL_69;
              }
LABEL_50:
              pcap_ng_block_add_option_with_value(v13, 2, (char *)&__src + 4, 4uLL);
              goto LABEL_51;
            }
            int v29 = 2;
          }
          HIDWORD(__src) = v29;
          goto LABEL_50;
        }
      }
    }
  }
  return result;
}

void *pcap_ng_dump_proc(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char *__s1, unsigned __int8 *uu1)
{
  int v12 = (int *)(a2 + 48);
  uint64_t uuid = pcap_proc_info_set_find_uuid((int *)(a2 + 48), a4, __s1, uu1);
  if (uuid
    || (uint64_t result = pcap_proc_info_set_add_uuid(v12, a4, __s1, uu1, (char *)(a1 + 208)), (uuid = (uint64_t)result) != 0))
  {
    return (void *)pcap_ng_dump_proc_info(a1, a2, a3, uuid);
  }
  return result;
}

uint64_t pcap_ng_dump_pktap(uint64_t a1, uint64_t a2, int32x2_t *a3, unsigned int *a4)
{
  return pcap_ng_dump_pktap_comment(a1, a2, a3, a4, 0);
}

uint64_t pcap_ng_dump_decryption_secrets(uint64_t a1, uint64_t a2, int a3, unint64_t a4, uint64_t a5)
{
  if (HIDWORD(a4)) {
    return 0;
  }
  int v7 = a4;
  uint64_t result = pcap_ng_dump_shb_comment(a1, a2, 0);
  if (result)
  {
    uint64_t v11 = *(void *)(a2 + 16);
    if (pcap_ng_block_reset(v11, 10))
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_reset(PCAPNG_BT_DSB) failed", "pcap_ng_dump_decryption_secrets");
      return 0;
    }
    else
    {
      decryption_secrets_fields = (_DWORD *)pcap_ng_get_decryption_secrets_fields(v11);
      _DWORD *decryption_secrets_fields = a3;
      decryption_secrets_fields[1] = v7;
      pcap_ng_block_packet_set_data(v11, a5, v7);
      pcap_ng_dump_block(a2, v11);
      return 1;
    }
  }
  return result;
}

int pcap_apple_set_exthdr(pcap_t *p, int a2)
{
  int v6 = a2;
  if (ioctl(*((_DWORD *)p + 4), 0x8004427CuLL, &v6) < 0)
  {
    uint64_t v4 = __error();
    uint64_t v5 = pcap_strerror(*v4);
    snprintf((char *)p + 208, 0x100uLL, "BIOCSEXTHDR: %s", v5);
    return -1;
  }
  else
  {
    int result = 0;
    *((_DWORD *)p + 227) = v6;
  }
  return result;
}

uint64_t pcap_set_want_pktap(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 912) = a2 != 0;
  return 0;
}

uint64_t pcap_set_truncation_mode(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 916) = a2;
  return 0;
}

uint64_t pcap_set_pktap_hdr_v2(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 920) = a2;
  return 0;
}

uint64_t pcap_set_compression(uint64_t a1, unsigned int a2)
{
  if (a2 > 2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 928) = a2;
  return result;
}

uint64_t pcap_set_head_drop(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 924) = a2 != 0;
  return 0;
}

uint64_t pcap_get_head_drop(uint64_t a1)
{
  return *(unsigned int *)(a1 + 924);
}

uint64_t pcap_get_compression_stats(uint64_t a1, char *a2, size_t a3)
{
  int v6 = *(_DWORD *)(a1 + 928);
  if (v6 == 2)
  {
    snprintf(a2, a3, "U tot_rd %llu tot_sz %llu tot_hdr_sz %llu no_prfx_cnt %llu prfx_cnt %llu tot_prfx_sz %llu max_prfx_sz %u", *(void *)(a1 + 968), *(void *)(a1 + 976));
    return 0;
  }
  if (v6 == 1)
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    if ((ioctl(*(_DWORD *)(a1 + 16), 0x40384288uLL, v9) & 0x80000000) == 0)
    {
      snprintf(a2, a3, "K tot_rd %llu tot_sz %llu tot_hdr_sz %llu no_prfx_cnt %llu prfx_cnt %llu tot_prfx_sz %llu max_prfx_sz %llu", v9[0]);
      return 0;
    }
    uint64_t v8 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v8, "BIOCGHDRCOMPSTATS");
  }
  return 0xFFFFFFFFLL;
}

size_t pcap_read_bpf_header(size_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(unsigned char *)(a3 + 24) = 0;
  uint64_t v3 = (char *)(a3 + 24);
  if (!*(_DWORD *)(result + 908)) {
    return result;
  }
  uint64_t v5 = (const char *)&unk_20D920C8F;
  if (*(unsigned char *)(a2 + 24))
  {
    int v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    *(_OWORD *)__str = 0u;
    long long v14 = 0u;
    if (snprintf(__str, 0x64uLL, "%sproc %s:%d", (const char *)&unk_20D920C8F, (const char *)(a2 + 24), *(_DWORD *)(a2 + 20)) >= 1)
    {
      strlcat(v3, __str, 0x100uLL);
      uint64_t v5 = ", ";
    }
  }
  int v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)__str = 0u;
  long long v14 = 0u;
  int v6 = *(_DWORD *)(a2 + 44);
  if (v6 <= 499)
  {
    if (v6 <= 199)
    {
      if (!v6)
      {
        int v7 = "BE";
        goto LABEL_31;
      }
      if (v6 == 100)
      {
        int v7 = "BK_SYS";
        goto LABEL_31;
      }
    }
    else
    {
      switch(v6)
      {
        case 200:
          int v7 = "BK";
          goto LABEL_31;
        case 300:
          int v7 = "RD";
          goto LABEL_31;
        case 400:
          int v7 = "OAM";
          goto LABEL_31;
      }
    }
  }
  else if (v6 > 799)
  {
    switch(v6)
    {
      case 800:
        int v7 = "VO";
        goto LABEL_31;
      case 900:
        int v7 = "CTL";
        goto LABEL_31;
      case 10002:
        int v7 = "SIG";
        goto LABEL_31;
    }
  }
  else
  {
    switch(v6)
    {
      case 500:
        int v7 = "AV";
        goto LABEL_31;
      case 600:
        int v7 = "RV";
        goto LABEL_31;
      case 700:
        int v7 = "VI";
        goto LABEL_31;
    }
  }
  int v7 = pcap_svc2str_svcstr;
  snprintf(pcap_svc2str_svcstr, 0xAuLL, "%u", *(_DWORD *)(a2 + 44));
LABEL_31:
  if (snprintf(__str, 0x64uLL, "%ssvc %s", v5, v7) >= 1)
  {
    strlcat(v3, __str, 0x100uLL);
    uint64_t v5 = ", ";
  }
  if (*(unsigned char *)(a2 + 41))
  {
    if (*(unsigned char *)(a2 + 41))
    {
      int v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      *(_OWORD *)__str = 0u;
      long long v14 = 0u;
      if (snprintf(__str, 0x64uLL, "%sre", v5) >= 1)
      {
        strlcat(v3, __str, 0x100uLL);
        uint64_t v5 = ", ";
      }
    }
    if ((*(unsigned char *)(a2 + 41) & 2) != 0)
    {
      int v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      *(_OWORD *)__str = 0u;
      long long v14 = 0u;
      if (snprintf(__str, 0x64uLL, "%sst", v5) >= 1)
      {
        strlcat(v3, __str, 0x100uLL);
        uint64_t v5 = ", ";
      }
    }
    if ((*(unsigned char *)(a2 + 41) & 4) != 0)
    {
      int v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      *(_OWORD *)__str = 0u;
      long long v14 = 0u;
      if (snprintf(__str, 0x64uLL, "%slp", v5) >= 1)
      {
        strlcat(v3, __str, 0x100uLL);
        uint64_t v5 = ", ";
      }
    }
    if ((*(unsigned char *)(a2 + 41) & 8) != 0)
    {
      int v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      *(_OWORD *)__str = 0u;
      long long v14 = 0u;
      if (snprintf(__str, 0x64uLL, "%swk", v5) >= 1)
      {
        strlcat(v3, __str, 0x100uLL);
        uint64_t v5 = ", ";
      }
    }
  }
  int v8 = *(_DWORD *)(a2 + 52);
  if (v8)
  {
    int v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    *(_OWORD *)__str = 0u;
    long long v14 = 0u;
    if (snprintf(__str, 0x64uLL, "%sunsent %u", v5, v8) >= 1)
    {
      strlcat(v3, __str, 0x100uLL);
      uint64_t v5 = ", ";
    }
  }
  char v9 = *(unsigned char *)(a2 + 19);
  *(_OWORD *)__str = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v19 = 0;
  if (v9)
  {
    uint64_t result = snprintf(__str, 0x64uLL, "%sout", v5);
    if ((int)result < 1) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  uint64_t result = snprintf(__str, 0x64uLL, "%sin", v5);
  if ((int)result > 0)
  {
LABEL_53:
    uint64_t result = strlcat(v3, __str, 0x100uLL);
    uint64_t v5 = ", ";
  }
LABEL_54:
  int v10 = *(_DWORD *)(a2 + 48);
  if (v10)
  {
    int v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    *(_OWORD *)__str = 0u;
    long long v14 = 0u;
    uint64_t result = snprintf(__str, 0x64uLL, "%sflowid 0x%x", v5, v10);
    if ((int)result >= 1)
    {
      uint64_t result = strlcat(v3, __str, 0x100uLL);
      uint64_t v5 = ", ";
    }
  }
  int v11 = *(unsigned __int16 *)(a2 + 42);
  if (*(_WORD *)(a2 + 42))
  {
    int v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    *(_OWORD *)__str = 0u;
    long long v14 = 0u;
    uint64_t result = snprintf(__str, 0x64uLL, "%sttag 0x%x", v5, v11);
    if ((int)result >= 1)
    {
      uint64_t result = strlcat(v3, __str, 0x100uLL);
      uint64_t v5 = ", ";
    }
  }
  int v12 = *(_DWORD *)(a2 + 60);
  if (v12)
  {
    int v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    *(_OWORD *)__str = 0u;
    long long v14 = 0u;
    uint64_t result = snprintf(__str, 0x64uLL, "%scmpgc 0x%x", v5, v12);
    if ((int)result >= 1) {
      return strlcat(v3, __str, 0x100uLL);
    }
  }
  return result;
}

uint64_t pcap_ng_dump_pktap_v2(uint64_t a1, uint64_t a2, int32x2_t *a3, unsigned __int8 *a4, char *a5)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t __src = 0;
  if (a3[2].i32[1] < 0x28u || (unsigned int v7 = a3[2].u32[0], v7 < 0x28) || v7 < *a4)
  {
    char v9 = (char *)(a1 + 208);
LABEL_5:
    snprintf(v9, 0x100uLL, "%s: Packet too short");
    return 0;
  }
  uint64_t v11 = a4[3];
  if (!a4[3])
  {
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: No ifame");
    return 0;
  }
  uint64_t result = pcap_ng_dump_shb_comment(a1, a2, 0);
  if (!result) {
    return result;
  }
  long long v14 = (char *)&a4[v11];
  uint64_t v15 = *(void *)(a2 + 16);
  uint64_t v16 = pcap_if_info_set_find_by_name((unsigned int *)(a2 + 24), v14);
  if (!v16)
  {
    uint64_t result = (uint64_t)pcap_if_info_set_add((int *)(a2 + 24), v14, 0xFFFFFFFF, *((unsigned __int16 *)a4 + 3), *(_DWORD *)(a1 + 96), *(const char **)(a1 + 1096), (char *)(a1 + 208));
    uint64_t v16 = result;
    if (!result) {
      return result;
    }
  }
  if (a3[2].i32[1] < 0x28u || (unsigned int v17 = a3[2].u32[0], v17 < 0x28) || (v18 = *a4, v17 < v18))
  {
    char v9 = (char *)(a1 + 208);
    goto LABEL_5;
  }
  if (!a4[3]) {
    return 0;
  }
  if (*(void *)(v16 + 32))
  {
    memcpy(&__dst, a3, sizeof(__dst));
    *(int32x2_t *)&__dst.capleuint64_t n = vsub_s32(*(int32x2_t *)&__dst.caplen, vdup_n_s32(v18));
    uint64_t result = pcap_offline_filter((const bpf_program *)(v16 + 24), &__dst, &a4[v18]);
    if (!result) {
      return result;
    }
  }
  uint64_t result = pcap_ng_dump_if_info(a1, a2, v15, v16);
  if (!result) {
    return result;
  }
  uint64_t v19 = result;
  uint64_t v20 = a4[4];
  if (a4[4]) {
    uint64_t v21 = (char *)&a4[v20];
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = a4[1];
  if (a4[1]) {
    unsigned __int8 v23 = &a4[v22];
  }
  else {
    unsigned __int8 v23 = 0;
  }
  int v24 = *((_DWORD *)a4 + 7);
  if (v24)
  {
    if (v24 == -1 && !a4[4] && !a4[1]) {
      goto LABEL_31;
    }
LABEL_33:
    uint64_t result = (uint64_t)pcap_ng_dump_proc(a1, a2, v15, v24, v21, v23);
    uint64_t v25 = result;
    if (!result) {
      return result;
    }
    goto LABEL_34;
  }
  if (v20 | v22) {
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v25 = 0;
LABEL_34:
  uint64_t v26 = a4[5];
  if (a4[5]) {
    int32x2_t v27 = (char *)&a4[v26];
  }
  else {
    int32x2_t v27 = 0;
  }
  uint64_t v28 = a4[2];
  if (a4[2]) {
    int v29 = &a4[v28];
  }
  else {
    int v29 = 0;
  }
  int v30 = *((_DWORD *)a4 + 8);
  if (v30)
  {
    if (v30 == -1 && !a4[5] && !a4[2]) {
      goto LABEL_44;
    }
  }
  else if (!(v26 | v28))
  {
LABEL_44:
    uint64_t v31 = 0;
    goto LABEL_47;
  }
  uint64_t result = (uint64_t)pcap_ng_dump_proc(a1, a2, v15, v30, v27, v29);
  uint64_t v31 = result;
  if (result)
  {
LABEL_47:
    if (pcap_ng_block_reset(v15, 6))
    {
      snprintf((char *)(a1 + 208), 0x100uLL, "%s: pcap_ng_block_reset(PCAPNG_BT_EPB) failed");
      return 0;
    }
    uint64_t v32 = (uint64_t)&a4[*a4];
    uint64_t enhanced_packet_fields = pcap_ng_get_enhanced_packet_fields(v15);
    unsigned int v34 = *a4;
    *(_DWORD *)uint64_t enhanced_packet_fields = *(_DWORD *)(v19 + 4);
    int32x2_t v35 = vsub_s32(a3[2], vdup_n_s32(v34));
    *(int32x2_t *)(enhanced_packet_fields + 12) = v35;
    *(void *)(enhanced_packet_fields + 4) = __ROR8__(a3[1].i32[0] + 1000000 * *(void *)a3, 32);
    pcap_ng_block_packet_set_data(v15, v32, v35.i32[0]);
    if (v25) {
      pcap_ng_block_add_option_with_value(v15, 32769, (void *)(v25 + 4), 4uLL);
    }
    if (v31) {
      pcap_ng_block_add_option_with_value(v15, 32771, (void *)(v31 + 4), 4uLL);
    }
    int v36 = *((_DWORD *)a4 + 9);
    if (v36)
    {
      int v37 = 1;
    }
    else
    {
      if ((v36 & 2) == 0)
      {
        if (!HIDWORD(__src))
        {
LABEL_61:
          if (*((_DWORD *)a4 + 5) != 0xFFFF)
          {
            LODWORD(__dst.ts.tv_sec) = *((_DWORD *)a4 + 5);
            pcap_ng_block_add_option_with_value(v15, 32770, &__dst, 4uLL);
          }
          if (*((_DWORD *)a4 + 6)) {
            pcap_ng_block_add_option_with_value(v15, 32773, a4 + 24, 4uLL);
          }
          if (a5)
          {
            if (*a5) {
              pcap_ng_block_add_option_with_string(v15, 1, a5);
            }
          }
          int v38 = *((_DWORD *)a4 + 9);
          if ((v38 & 0x4000) != 0)
          {
            LODWORD(__src) = __src | 1;
            if ((v38 & 0x8000) == 0)
            {
LABEL_70:
              if ((v38 & 0x10000) == 0) {
                goto LABEL_71;
              }
              goto LABEL_79;
            }
          }
          else if ((v38 & 0x8000) == 0)
          {
            goto LABEL_70;
          }
          LODWORD(__src) = __src | 4;
          if ((v38 & 0x10000) == 0)
          {
LABEL_71:
            if ((v38 & 0x20000) == 0) {
              goto LABEL_72;
            }
            goto LABEL_80;
          }
LABEL_79:
          LODWORD(__src) = __src | 2;
          if ((v38 & 0x20000) == 0)
          {
LABEL_72:
            if ((v38 & 0x40000) == 0) {
              goto LABEL_74;
            }
            goto LABEL_73;
          }
LABEL_80:
          LODWORD(__src) = __src | 8;
          if ((v38 & 0x40000) == 0)
          {
LABEL_74:
            if ((v38 & 0x100000) != 0)
            {
              LODWORD(__src) = __src | 0x20;
            }
            else if (!__src)
            {
              goto LABEL_84;
            }
            pcap_ng_block_add_option_with_value(v15, 32772, &__src, 4uLL);
LABEL_84:
            pcap_ng_dump_block(a2, v15);
            return 1;
          }
LABEL_73:
          LODWORD(__src) = __src | 0x10;
          goto LABEL_74;
        }
LABEL_60:
        pcap_ng_block_add_option_with_value(v15, 2, (char *)&__src + 4, 4uLL);
        goto LABEL_61;
      }
      int v37 = 2;
    }
    HIDWORD(__src) = v37;
    goto LABEL_60;
  }
  return result;
}

void pcap_ng_dump_init_section_info(_DWORD *a1)
{
  a1[2] = 0;
  pcap_if_info_set_clear(a1 + 6);

  pcap_proc_info_set_clear(a1 + 12);
}

uint64_t pcap_set_max_write_size(uint64_t a1, int a2)
{
  int v5 = a2;
  uint64_t result = ioctl(*(_DWORD *)(a1 + 16), 0x8004428CuLL, &v5);
  if (result)
  {
    uint64_t v4 = __error();
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: BIOCSWRITEMAX errno %d", "pcap_set_max_write_size", *v4);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t pcap_get_max_write_size(uint64_t a1, uint64_t a2)
{
  uint64_t result = ioctl(*(_DWORD *)(a1 + 16), 0x4004428DuLL, a2);
  if (result)
  {
    uint64_t v4 = __error();
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: BIOCGWRITEMAX errno %d", "pcap_get_max_write_size", *v4);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t pcap_set_send_multiple(uint64_t a1, int a2)
{
  int v5 = a2;
  uint64_t result = ioctl(*(_DWORD *)(a1 + 16), 0x8004428FuLL, &v5);
  if (result)
  {
    uint64_t v4 = __error();
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: BIOCSBATCHWRITE errno %d", "pcap_set_send_multiple", *v4);
    return 0xFFFFFFFFLL;
  }
  else
  {
    *(_DWORD *)(a1 + 1064) = v5 != 0;
  }
  return result;
}

uint64_t pcap_get_send_multiple(uint64_t a1, uint64_t a2)
{
  uint64_t result = ioctl(*(_DWORD *)(a1 + 16), 0x4004428EuLL, a2);
  if (result)
  {
    uint64_t v4 = __error();
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: BIOCGBATCHWRITE errno %d", "pcap_get_send_multiple", *v4);
    return 0xFFFFFFFFLL;
  }
  return result;
}

size_t pcap_sendpacket_multiple(uint64_t a1, size_t count, uint64_t a3)
{
  size_t v3 = count;
  if (count >= 0x101)
  {
    int v5 = (char *)(a1 + 208);
    size_t v46 = count;
    uint64_t v47 = 256;
    int v6 = "pcap_sendpacket_multiple: count %u greater than max %d";
LABEL_3:
    snprintf(v5, 0x100uLL, v6, v46, v47);
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = a3;
  uint64_t v9 = count;
  if (*(_DWORD *)(a1 + 1064))
  {
    if (*(_DWORD *)(a1 + 1068) >= count)
    {
      if (count)
      {
LABEL_21:
        int v16 = 0;
        unsigned int v17 = (unsigned int *)(v8 + 12);
        uint64_t v18 = v3;
        while (1)
        {
          unsigned int v20 = *v17;
          v17 += 6;
          unsigned int v19 = v20;
          if (v20 >= 0x81) {
            break;
          }
          v16 += v19;
          if (!--v18)
          {
            char v21 = 0;
            goto LABEL_29;
          }
        }
        snprintf((char *)(a1 + 208), 0x100uLL, "pcap_sendpacket_multiple: pcap_priv_iov_count %u greater that max %d");
        return 0xFFFFFFFFLL;
      }
      int v16 = 0;
      char v21 = 1;
LABEL_29:
      unsigned int v23 = v16 + 2 * v3;
      if (*(_DWORD *)(a1 + 1080) < v23)
      {
        int v24 = *(void **)(a1 + 1088);
        if (v24)
        {
          free(v24);
          *(void *)(a1 + 1088) = 0;
        }
        *(_DWORD *)(a1 + 1080) = 0;
        uint64_t v25 = malloc_type_calloc(3 * v23, 0x10uLL, 0x1080040FC6463CFuLL);
        *(void *)(a1 + 1088) = v25;
        if (!v25)
        {
          long long v45 = __error();
          snprintf((char *)(a1 + 208), 0x100uLL, "pcap_sendpacket_multiple: calloc iovec array errno %d", *v45);
          free(*(void **)(a1 + 1072));
          *(void *)(a1 + 1072) = 0;
          *(_DWORD *)(a1 + 1068) = 0;
          return 0xFFFFFFFFLL;
        }
        *(_DWORD *)(a1 + 1080) = v23;
      }
      if (v21)
      {
        int v26 = 0;
      }
      else
      {
        uint64_t v27 = 0;
        int v28 = 0;
        uint64_t v48 = v8;
        do
        {
          int v29 = (int32x2_t *)(*(void *)(a1 + 1072) + 20 * v27);
          LOBYTE(v30) = 18;
          v29[2].i16[0] = 18;
          uint64_t v31 = v29 + 2;
          uint64_t v32 = v8 + 24 * v27;
          unsigned int v33 = *(_DWORD *)(v32 + 8);
          v29[1] = vdup_n_s32(v33);
          unsigned int v34 = (int32x2_t **)(*(void *)(a1 + 1088) + 16 * v28);
          *unsigned int v34 = v29;
          v34[1] = (int32x2_t *)18;
          int v36 = *(_DWORD *)(v32 + 12);
          int32x2_t v35 = (unsigned int *)(v32 + 12);
          int v26 = v28 + 1;
          if (v36)
          {
            uint64_t v49 = (unsigned int *)&v29[1];
            uint64_t v37 = 0;
            unint64_t v38 = 0;
            long long v39 = (void *)(v8 + 24 * v27 + 16);
            uint64_t v40 = 16 * v26;
            do
            {
              if (v38 >= *(unsigned int *)(a1 + 1080))
              {
                uint64_t v41 = __error();
                snprintf((char *)(a1 + 208), 0x100uLL, "pcap_sendpacket_multiple: calloc iovec array errno %d", *v41);
              }
              *(_OWORD *)(*(void *)(a1 + 1088) + v40 + v37) = *(_OWORD *)(*v39 + v37);
              ++v38;
              v37 += 16;
            }
            while (v38 < *v35);
            v28 += v38;
            int v26 = v28 + 1;
            __int16 v30 = v31->i16[0];
            uint64_t v9 = v3;
            unsigned int v33 = *v49;
            uint64_t v8 = v48;
          }
          int v42 = ((_BYTE)v33 + (_BYTE)v30) & 3;
          if (v42)
          {
            long long v43 = (void *)(*(void *)(a1 + 1088) + 16 * v26);
            *long long v43 = &v50;
            v43[1] = (4 - v42);
            int v26 = v28 + 2;
          }
          ++v27;
          int v28 = v26;
        }
        while (v27 != v9);
      }
      if ((writev(*(_DWORD *)(a1 + 16), *(const iovec **)(a1 + 1088), v26) & 0x8000000000000000) == 0) {
        return v9;
      }
      uint64_t v22 = (char *)(a1 + 208);
      size_t v46 = *__error();
      int v6 = "pcap_sendpacket_multiple: writev failed errno %d";
    }
    else
    {
      int v10 = *(void **)(a1 + 1072);
      if (v10)
      {
        free(v10);
        *(void *)(a1 + 1072) = 0;
      }
      *(_DWORD *)(a1 + 1068) = 0;
      uint64_t v11 = malloc_type_calloc(v3, 0x14uLL, 0x1000040EF768F96uLL);
      *(void *)(a1 + 1072) = v11;
      if (v11)
      {
        *(_DWORD *)(a1 + 1068) = v3;
        goto LABEL_21;
      }
      uint64_t v22 = (char *)(a1 + 208);
      size_t v46 = *__error();
      int v6 = "pcap_sendpacket_multiple: calloc bpf_hdr array errno %d";
    }
    int v5 = v22;
    goto LABEL_3;
  }
  if (count)
  {
    int v12 = (unsigned int *)(a3 + 12);
    uint64_t v13 = count;
    do
    {
      unsigned int v14 = *v12;
      v12 += 6;
      if (v14 >= 0x81)
      {
        snprintf((char *)(a1 + 208), 0x100uLL, "pcap_sendpacket_multiple: pcap_priv_iov_count %u greater than max %d");
        return 0xFFFFFFFFLL;
      }
      --v13;
    }
    while (v13);
    size_t v3 = 0;
    for (uint64_t i = (const iovec **)(a3 + 16);
          (writev(*(_DWORD *)(a1 + 16), *i, *((_DWORD *)i - 1)) & 0x8000000000000000) == 0;
          i += 3)
    {
      if (v9 == ++v3) {
        return v9;
      }
    }
    long long v44 = __error();
    pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v44, "pcap_sendpacket_multiple: writev %d failed: %s", v3, (const char *)(a1 + 208));
  }
  return v3;
}

uint64_t pcap_get_divert_input(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t result = ioctl(*(_DWORD *)(a1 + 16), 0x40044292uLL, &v5);
  if (result)
  {
    uint64_t v4 = __error();
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: BIOCGDVRTIN errno %d", "pcap_get_divert_input", *v4);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t pcap_set_divert_input(uint64_t a1, int a2)
{
  int v6 = a2;
  uint64_t result = ioctl(*(_DWORD *)(a1 + 16), 0x80044292uLL, &v6);
  if (result)
  {
    int v4 = v6;
    uint64_t v5 = __error();
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: BIOCSDVRTIN %d errno %d", "pcap_set_divert_input", v4, *v5);
    return 0xFFFFFFFFLL;
  }
  return result;
}

void *skywalk_create(const char *a1, char *a2, _DWORD *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v6 = getenv("PCAP_SKYWALK_DEBUG");
  if (v6) {
    skywalk_debug = atoi(v6);
  }
  int v7 = strncmp(a1, "skywalk:", 8uLL);
  *a3 = v7 == 0;
  if (v7) {
    return 0;
  }
  memset(uu, 0, sizeof(uu));
  uint64_t v8 = strdup(a1 + 8);
  __stringp = v8;
  uint64_t v9 = strsep(&__stringp, ":");
  int v10 = strsep(&__stringp, ":");
  if (v10 && *v10) {
    unsigned __int16 v11 = strtoul(v10, 0, 10);
  }
  else {
    unsigned __int16 v11 = 0;
  }
  if (uuid_parse(v9, uu))
  {
    snprintf(a2, 0x100uLL, "invalid UUID: %s", v9);
    free(v8);
    return 0;
  }
  pcap_create_common(a2, 0x4D8uLL, 1168);
  int v12 = v14;
  if (skywalk_debug)
  {
    printf("%s: ", "skywalk_create");
    printf("%p, uuid %s, port %u\n", v12, v9, v11);
  }
  free(v8);
  if (v12)
  {
    v12[99] = skywalk_activate;
    uint64_t v15 = v12[6];
    *(void *)(v15 + 64) = 0;
    *(_OWORD *)(v15 + 32) = 0u;
    *(_OWORD *)(v15 + 48) = 0u;
    *(_OWORD *)uint64_t v15 = 0u;
    *(_OWORD *)(v15 + 16) = 0u;
    uuid_copy((unsigned __int8 *)(v15 + 4), uu);
    *(_WORD *)(v15 + 20) = v11;
  }
  return v12;
}

uint64_t skywalk_activate(char *a1)
{
  if (skywalk_debug)
  {
    printf("%s: ", "skywalk_activate");
    printf("%p\n", a1);
  }
  uint64_t v2 = *((void *)a1 + 6);
  int v3 = kqueue();
  *(_DWORD *)uint64_t v2 = v3;
  if (v3 < 0)
  {
    uint64_t v9 = __error();
    pcap_strerror(*v9);
    snprintf(a1 + 208, 0x100uLL, "unable to create a kqueue: %s");
    return 0xFFFFFFFFLL;
  }
  if (!os_channel_attr_create())
  {
    int v10 = __error();
    pcap_strerror(*v10);
    snprintf(a1 + 208, 0x100uLL, "unable to create an attribute: %s");
    return 0xFFFFFFFFLL;
  }
  os_channel_attr_set();
  uint64_t extended = os_channel_create_extended();
  *(void *)(v2 + 24) = extended;
  if (!extended)
  {
    unsigned __int16 v11 = __error();
    int v12 = pcap_strerror(*v11);
    snprintf(a1 + 208, 0x100uLL, "unable to create an RX channel: %s", v12);
LABEL_18:
    os_channel_attr_destroy();
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = os_channel_create_extended();
  *(void *)(v2 + 32) = v5;
  if (!v5)
  {
    uint64_t v13 = __error();
    unsigned int v14 = pcap_strerror(*v13);
    snprintf(a1 + 208, 0x100uLL, "unable to create a TX channel: %s", v14);
    os_channel_destroy();
    *(void *)(v2 + 24) = 0;
    goto LABEL_18;
  }
  os_channel_attr_destroy();
  *(_DWORD *)(v2 + 48) = os_channel_ring_id();
  *(_DWORD *)(v2 + 52) = os_channel_ring_id();
  *(_DWORD *)(v2 + 56) = os_channel_ring_id();
  *(_DWORD *)(v2 + 60) = os_channel_ring_id();
  if (skywalk_debug)
  {
    printf("%s: ", "skywalk_activate");
    printf("rx[%u,%u], tx[%u,%u]\n", *(_DWORD *)(v2 + 48), *(_DWORD *)(v2 + 52), *(_DWORD *)(v2 + 56), *(_DWORD *)(v2 + 60));
  }
  *(_DWORD *)(v2 + 40) = os_channel_get_fd();
  *(_DWORD *)(v2 + 44) = os_channel_get_fd();
  *((_DWORD *)a1 + 25) = 1;
  int v6 = malloc_type_malloc(0x14uLL, 0x100004052888210uLL);
  *((void *)a1 + 59) = v6;
  if (v6)
  {
    *(_OWORD *)int v6 = xmmword_20D914B40;
    v6[4] = 229;
    *((_DWORD *)a1 + 117) = 5;
  }
  *((void *)a1 + 105) = skywalk_set_datalink;
  *((_DWORD *)a1 + 4) = -1;
  int v7 = malloc_type_malloc(8uLL, 0x100004052888210uLL);
  *((void *)a1 + 112) = v7;
  if (v7)
  {
    **((_DWORD **)a1 + 112) = os_channel_get_fd();
    *(_DWORD *)(*((void *)a1 + 112) + 4) = os_channel_get_fd();
    *((_DWORD *)a1 + 226) = 2;
  }
  uint64_t result = 0;
  *(void *)a1 = skywalk_dispatch;
  *((void *)a1 + 101) = skywalk_inject;
  *((void *)a1 + 103) = install_bpf_program;
  *((void *)a1 + 104) = 0;
  *((void *)a1 + 106) = pcap_getnonblock_fd;
  *((void *)a1 + 107) = pcap_setnonblock_fd;
  *((void *)a1 + 108) = skywalk_stats;
  *((void *)a1 + 111) = skywalk_close;
  return result;
}

uint64_t skywalk_set_datalink(_DWORD *a1, int a2)
{
  if (skywalk_debug)
  {
    printf("%s: ", "skywalk_set_datalink");
    printf("%p dlt %d\n", a1, a2);
  }
  a1[25] = a2;
  return 0;
}

uint64_t skywalk_dispatch(uint64_t a1, int a2, uint64_t (*a3)(uint64_t, timeval *, void), uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v22 = a2;
  int v7 = *(int **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 200);
  int v20 = v7[16];
  if (skywalk_debug)
  {
    printf("%s: ", "skywalk_dispatch");
    printf("%p priv %p\n", (const void *)a1, *(const void **)(a1 + 48));
  }
  memset(&eventlist, 0, sizeof(eventlist));
  *(_DWORD *)&changelist.filter = 393215;
  memset(&changelist.fflags, 0, 20);
  int v25 = 393215;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  int v28 = 0;
  while (1)
  {
    if (*(_DWORD *)(a1 + 44))
    {
      *(_DWORD *)(a1 + 44) = 0;
      return 4294967294;
    }
    uint64_t v9 = v7[11];
    changelist.ident = v7[10];
    uint64_t v24 = v9;
    int v10 = kevent(*v7, &changelist, 2, &eventlist, 1, 0);
    if (skywalk_debug)
    {
      printf("%s: ", "skywalk_dispatch");
      printf("ev %d\n", v10);
    }
    if (v10 <= 0 && *__error() && *__error() != 35) {
      break;
    }
    for (unsigned int i = v7[12]; i <= v7[13] && !*(_DWORD *)(a1 + 44); ++i)
    {
      int v12 = (const void *)os_channel_rx_ring();
      int v13 = os_channel_available_slot_count();
      if (skywalk_debug)
      {
        printf("%s: ", "skywalk_dispatch");
        printf("rx ring %p avail %u\n", v12, v13);
      }
      if (v13) {
        skywalk_dispatch_ring((uint64_t)v7, v8, a3, a4, (uint64_t)v12, &v22);
      }
    }
    for (unsigned int j = v7[14]; j <= v7[15] && !*(_DWORD *)(a1 + 44); ++j)
    {
      uint64_t v15 = (const void *)os_channel_rx_ring();
      int v16 = os_channel_available_slot_count();
      if (skywalk_debug)
      {
        printf("%s: ", "skywalk_dispatch");
        printf("tx ring %p avail %u\n", v15, v16);
      }
      if (v16) {
        skywalk_dispatch_ring((uint64_t)v7, v8, a3, a4, (uint64_t)v15, &v22);
      }
    }
    if (!v22) {
      return v7[16] - v20 > 0;
    }
  }
  if (*(_DWORD *)(a1 + 44)) {
    return 4294967294;
  }
  uint64_t v18 = __error();
  unsigned int v19 = pcap_strerror(*v18);
  snprintf((char *)(a1 + 208), 0x100uLL, "kevent: %s", v19);
  return 0xFFFFFFFFLL;
}

uint64_t skywalk_inject(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t skywalk_stats(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = *(_DWORD *)(v2 + 64);
  return 0;
}

void skywalk_close(void *a1)
{
  uint64_t v2 = a1[6];
  if (skywalk_debug)
  {
    printf("%s: ", "skywalk_close");
    printf("%p priv %p\n", a1, (const void *)a1[6]);
  }
  os_channel_destroy();
  *(void *)(v2 + 24) = 0;
  os_channel_destroy();
  *(void *)(v2 + 32) = 0;
  int v3 = (void *)a1[59];
  if (v3) {
    free(v3);
  }
  int v4 = (void *)a1[112];
  if (v4)
  {
    free(v4);
  }
}

uint64_t skywalk_dispatch_ring(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, timeval *, void), uint64_t a4, uint64_t a5, int *a6)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  timeval v15 = (timeval)0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v32 = 0;
  uint64_t result = os_channel_get_next_slot();
  if (result)
  {
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = result;
      ++*(_DWORD *)(a1 + 64);
      *(void *)&long long v16 = 0;
      gettimeofday(&v15, 0);
      if (skywalk_debug)
      {
        printf("%s: ", "skywalk_dispatch_ring");
        printf("pkt %p len %u\n", 0, DWORD1(v16));
      }
      if (!a2 || bpf_filter(a2, 0, DWORD1(v16), v16))
      {
        uint64_t result = a3(a4, &v15, 0);
        BOOL v14 = *a6 == 1;
        if (*a6 >= 1)
        {
          --*a6;
          if (v14) {
            break;
          }
        }
      }
      uint64_t result = os_channel_get_next_slot();
      uint64_t v12 = v13;
      if (!result) {
        return os_channel_advance_slot();
      }
    }
    if (!v12) {
      return result;
    }
    return os_channel_advance_slot();
  }
  return result;
}

void pcap_if_info_set_clear(int *a1)
{
  uint64_t v2 = (void *)*((void *)a1 + 1);
  if (v2)
  {
    if (*a1 >= 1)
    {
      uint64_t v3 = 0;
      do
        pcap_if_info_set_free((unsigned int *)a1, *(void *)(*((void *)a1 + 1) + 8 * v3++));
      while (v3 < *a1);
      uint64_t v2 = (void *)*((void *)a1 + 1);
    }
    free(v2);
    *((void *)a1 + 1) = 0;
  }
  *a1 = 0;
  a1[4] = 0;
}

void pcap_if_info_set_free(unsigned int *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *a1;
    if ((int)v3 >= 1)
    {
      int v4 = (void *)*((void *)a1 + 1);
      while (*v4 != a2)
      {
        ++v4;
        if (!--v3) {
          goto LABEL_9;
        }
      }
      *int v4 = 0;
    }
LABEL_9:
    pcap_freecode((bpf_program *)(a2 + 24));
    free((void *)a2);
  }
}

uint64_t pcap_if_info_set_find_by_name(unsigned int *a1, char *__s1)
{
  uint64_t v2 = *a1;
  if ((int)v2 < 1) {
    return 0;
  }
  for (unsigned int i = (uint64_t *)*((void *)a1 + 1); ; ++i)
  {
    uint64_t v5 = *i;
    if (!strcmp(__s1, *(const char **)(*i + 8))) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  return v5;
}

_DWORD *pcap_if_info_set_find_by_id(unsigned int *a1, int a2)
{
  if (a2 == -1) {
    return 0;
  }
  uint64_t v2 = *a1;
  if ((int)v2 < 1) {
    return 0;
  }
  for (unsigned int i = (void *)*((void *)a1 + 1); ; ++i)
  {
    uint64_t result = (_DWORD *)*i;
    if (*(_DWORD *)*i == a2) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  return result;
}

char *pcap_if_info_set_add(int *a1, char *__s, unsigned int a3, int a4, int a5, const char *a6, char *a7)
{
  size_t v14 = strlen(__s);
  timeval v15 = (char *)malloc_type_calloc(1uLL, v14 + 49, 0x4DD9E9ACuLL);
  if (!v15)
  {
    if (a7) {
      snprintf(a7, 0x100uLL, "%s: calloc() failed", "pcap_if_info_set_add");
    }
    return 0;
  }
  long long v16 = v15;
  long long v17 = v15 + 48;
  *((void *)v16 + 1) = v17;
  if (v14)
  {
    memmove(v17, __s, v14);
    long long v17 = (void *)*((void *)v16 + 1);
  }
  *((unsigned char *)v17 + v14) = 0;
  if (a3 == -1) {
    a3 = *a1;
  }
  *(_DWORD *)long long v16 = a3;
  *((_DWORD *)v16 + 4) = a4;
  *((_DWORD *)v16 + 5) = a5;
  if (a6 && *a6)
  {
    long long v18 = pcap_open_dead(a4, a5);
    if (!v18) {
      goto LABEL_20;
    }
    long long v19 = v18;
    int v20 = pcap_compile(v18, (bpf_program *)(v16 + 24), a6, 0, 0xFFFFFFFF);
    int v21 = v20;
    if (a7 && v20) {
      strlcpy(a7, (const char *)v19 + 208, 0x100uLL);
    }
    pcap_close(v19);
    if (v21 == -1)
    {
LABEL_20:
      free(v16);
      return 0;
    }
  }
  long long v22 = malloc_type_realloc(*((void **)a1 + 1), 8 * *a1 + 8, 0x2004093837F09uLL);
  if (!v22)
  {
    if (a7) {
      snprintf(a7, 0x100uLL, "%s: realloc() failed", "pcap_if_info_set_add");
    }
    pcap_if_info_set_free((unsigned int *)a1, (uint64_t)v16);
    return 0;
  }
  *((void *)a1 + 1) = v22;
  uint64_t v23 = *a1;
  v22[v23] = v16;
  *a1 = v23 + 1;
  return v16;
}

void pcap_clear_if_infos(uint64_t a1)
{
}

uint64_t pcap_find_if_info_by_name(uint64_t a1, char *a2)
{
  return pcap_if_info_set_find_by_name((unsigned int *)(a1 + 1112), a2);
}

_DWORD *pcap_find_if_info_by_id(uint64_t a1, int a2)
{
  if (a2 == -1) {
    return 0;
  }
  uint64_t v2 = *(unsigned int *)(a1 + 1112);
  if ((int)v2 < 1) {
    return 0;
  }
  for (unsigned int i = *(void **)(a1 + 1120); ; ++i)
  {
    uint64_t result = (_DWORD *)*i;
    if (*(_DWORD *)*i == a2) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  return result;
}

void pcap_free_if_info(uint64_t a1, uint64_t a2)
{
}

char *pcap_add_if_info(uint64_t a1, char *a2, unsigned int a3, int a4, int a5)
{
  *(void *)(a1 + 1160) = pcap_ng_init_section_info;
  return pcap_if_info_set_add((int *)(a1 + 1112), a2, a3, a4, a5, *(const char **)(a1 + 1096), (char *)(a1 + 208));
}

void pcap_ng_init_section_info(_DWORD *a1)
{
  a1[276] = 0;
  pcap_if_info_set_clear(a1 + 278);

  pcap_proc_info_set_clear(a1 + 284);
}

void pcap_proc_info_set_clear(int *a1)
{
  uint64_t v2 = (void *)*((void *)a1 + 1);
  if (v2)
  {
    if (*a1 >= 1)
    {
      uint64_t v3 = 0;
      do
        pcap_proc_info_set_free((unsigned int *)a1, *(void **)(*((void *)a1 + 1) + 8 * v3++));
      while (v3 < *a1);
      uint64_t v2 = (void *)*((void *)a1 + 1);
    }
    free(v2);
    *((void *)a1 + 1) = 0;
  }
  *a1 = 0;
  a1[4] = 0;
}

void pcap_proc_info_set_free(unsigned int *a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *a1;
    if ((int)v2 >= 1)
    {
      uint64_t v3 = (void **)*((void *)a1 + 1);
      while (*v3 != a2)
      {
        ++v3;
        if (!--v2) {
          goto LABEL_9;
        }
      }
      void *v3 = 0;
    }
LABEL_9:
    free(a2);
  }
}

uint64_t pcap_proc_info_set_find(int *a1, int a2, char *a3)
{
  return pcap_proc_info_set_find_uuid(a1, a2, a3, 0);
}

uint64_t pcap_proc_info_set_find_uuid(int *a1, int a2, char *__s1, unsigned __int8 *uu1)
{
  if (__s1 && uu1)
  {
    int v8 = *a1;
    if (*a1 >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t v10 = *(void *)(*((void *)a1 + 1) + 8 * v9);
        if (*(_DWORD *)(v10 + 8) == a2 && !strcmp(__s1, *(const char **)(v10 + 16)))
        {
          if (!uuid_compare(uu1, (const unsigned __int8 *)(v10 + 28))) {
            return v10;
          }
          int v8 = *a1;
        }
        ++v9;
      }
      while (v9 < v8);
    }
    return 0;
  }
  if (!__s1)
  {
    if (uu1)
    {
      int v13 = *a1;
      if (*a1 >= 1)
      {
        uint64_t v14 = 0;
        do
        {
          uint64_t v10 = *(void *)(*((void *)a1 + 1) + 8 * v14);
          if (*(_DWORD *)(v10 + 8) == a2)
          {
            if (!uuid_compare(uu1, (const unsigned __int8 *)(v10 + 28))) {
              return v10;
            }
            int v13 = *a1;
          }
          ++v14;
        }
        while (v14 < v13);
      }
    }
    return 0;
  }
  uint64_t v11 = *a1;
  if ((int)v11 < 1) {
    return 0;
  }
  for (unsigned int i = (uint64_t *)*((void *)a1 + 1); ; ++i)
  {
    uint64_t v10 = *i;
    if (*(_DWORD *)(*i + 8) == a2 && !strcmp(__s1, *(const char **)(v10 + 16))) {
      break;
    }
    if (!--v11) {
      return 0;
    }
  }
  return v10;
}

_DWORD *pcap_proc_info_set_find_by_index(unsigned int *a1, int a2)
{
  uint64_t v2 = *a1;
  if ((int)v2 < 1) {
    return 0;
  }
  for (unsigned int i = (void *)*((void *)a1 + 1); ; ++i)
  {
    uint64_t result = (_DWORD *)*i;
    if (*(_DWORD *)*i == a2) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  return result;
}

void *pcap_proc_info_set_add_uuid(int *a1, int a2, char *__s, const unsigned __int8 *a4, char *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (__s) {
    size_t v10 = strlen(__s);
  }
  else {
    size_t v10 = 0;
  }
  memset(out, 0, 37);
  if (!a4 && (null_uu_inited & 1) == 0)
  {
    uuid_clear(null_uu);
    null_uu_inited = 1;
  }
  uint64_t v11 = (char *)malloc_type_calloc(1uLL, v10 + 49, 0xA39C05C7uLL);
  if (!v11)
  {
    if (a5) {
      snprintf(a5, 0x100uLL, "%s: calloc() failed", "pcap_proc_info_set_add_uuid");
    }
    return 0;
  }
  uint64_t v12 = v11;
  int v13 = v11 + 48;
  *((void *)v12 + 2) = v13;
  if (v10)
  {
    memmove(v13, __s, v10);
    int v13 = (void *)*((void *)v12 + 2);
  }
  *((unsigned char *)v13 + v10) = 0;
  *((_DWORD *)v12 + 2) = a2;
  *(_DWORD *)uint64_t v12 = *a1;
  if (a4) {
    uint64_t v14 = a4;
  }
  else {
    uint64_t v14 = null_uu;
  }
  uuid_copy((unsigned __int8 *)v12 + 28, v14);
  uuid_unparse_lower((const unsigned __int8 *)v12 + 28, out);
  timeval v15 = malloc_type_realloc(*((void **)a1 + 1), 8 * *a1 + 8, 0x2004093837F09uLL);
  if (!v15)
  {
    if (a5) {
      snprintf(a5, 0x100uLL, "%s: malloc() failed", "pcap_proc_info_set_add_uuid");
    }
    free(v12);
    return 0;
  }
  *((void *)a1 + 1) = v15;
  uint64_t v16 = *a1;
  v15[v16] = v12;
  *a1 = v16 + 1;
  return v12;
}

void pcap_clear_proc_infos(uint64_t a1)
{
}

uint64_t pcap_find_proc_info(uint64_t a1, int a2, char *a3)
{
  return pcap_proc_info_set_find_uuid((int *)(a1 + 1136), a2, a3, 0);
}

uint64_t pcap_find_proc_info_uuid(uint64_t a1, int a2, char *a3, unsigned __int8 *a4)
{
  return pcap_proc_info_set_find_uuid((int *)(a1 + 1136), a2, a3, a4);
}

_DWORD *pcap_find_proc_info_by_index(uint64_t a1, int a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 1136);
  if ((int)v2 < 1) {
    return 0;
  }
  for (unsigned int i = *(void **)(a1 + 1144); ; ++i)
  {
    uint64_t result = (_DWORD *)*i;
    if (*(_DWORD *)*i == a2) {
      break;
    }
    if (!--v2) {
      return 0;
    }
  }
  return result;
}

void pcap_free_proc_info(uint64_t a1, void *a2)
{
}

void *pcap_add_proc_info_uuid(uint64_t a1, int a2, char *a3, const unsigned __int8 *a4)
{
  *(void *)(a1 + 1160) = pcap_ng_init_section_info;
  return pcap_proc_info_set_add_uuid((int *)(a1 + 1136), a2, a3, a4, (char *)(a1 + 208));
}

void *pcap_add_proc_info(uint64_t a1, int a2, char *a3)
{
  *(void *)(a1 + 1160) = pcap_ng_init_section_info;
  return pcap_proc_info_set_add_uuid((int *)(a1 + 1136), a2, a3, 0, (char *)(a1 + 208));
}

uint64_t pcap_set_filter_info(uint64_t a1, char *__s1)
{
  int v4 = *(void **)(a1 + 1096);
  if (v4) {
    free(v4);
  }
  if (__s1)
  {
    uint64_t v5 = strdup(__s1);
    *(void *)(a1 + 1096) = v5;
    if (!v5) {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    *(void *)(a1 + 1096) = 0;
  }
  return 0;
}

void pcap_darwin_cleanup(uint64_t a1)
{
  *(_DWORD *)(a1 + 1104) = 0;
  pcap_if_info_set_clear((int *)(a1 + 1112));
  pcap_proc_info_set_clear((int *)(a1 + 1136));
  uint64_t v2 = *(void **)(a1 + 944);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 944) = 0;
  }
  uint64_t v3 = *(void **)(a1 + 1072);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 1072) = 0;
  }
  int v4 = *(void **)(a1 + 1088);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 1088) = 0;
  }
  *(_DWORD *)(a1 + 1068) = 0;
  uint64_t v5 = *(void **)(a1 + 1096);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 1096) = 0;
  }
}

int pcap_init(unsigned int a1, char *a2)
{
  if (a1 == 1)
  {
    if (pcap_init_initialized == 1 && pcap_utf_8_mode == 0) {
      goto LABEL_15;
    }
    pcap_utf_8_mode = 1;
  }
  else
  {
    if (a1)
    {
      strcpy(a2, "Unknown options specified");
      return -1;
    }
    if (pcap_init_initialized == 1 && pcap_utf_8_mode != 0)
    {
LABEL_15:
      strcpy(a2, "Multiple pcap_init calls with different character encodings");
      return -1;
    }
  }
  pcap_fmt_set_encoding();
  int result = 0;
  if ((pcap_init_initialized & 1) == 0)
  {
    pcap_init_initialized = 1;
    pcap_new_apunsigned int i = 1;
  }
  return result;
}

int pcap_can_set_rfmon(pcap_t *a1)
{
  return (*((uint64_t (**)(void))a1 + 100))();
}

int pcap_list_tstamp_types(pcap_t *a1, int **a2)
{
  size_t v4 = *((int *)a1 + 120);
  if (v4)
  {
    uint64_t v5 = (int *)malloc_type_calloc(4uLL, v4, 0xC711BF9FuLL);
    *a2 = v5;
    if (v5)
    {
      memcpy(v5, *((const void **)a1 + 61), 4 * *((int *)a1 + 120));
      return *((_DWORD *)a1 + 120);
    }
  }
  else
  {
    int v7 = (int *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
    *a2 = v7;
    if (v7)
    {
      *int v7 = 0;
      return 1;
    }
  }
  int v8 = __error();
  pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x101uLL, *v8, "malloc");
  return -1;
}

void *pcap_oneshot(uint64_t a1, const void *a2, uint64_t a3)
{
  int result = memcpy(*(void **)a1, a2, 0x118uLL);
  **(void **)(a1 + 8) = a3;
  return result;
}

const u_char *__cdecl pcap_next(pcap_t *a1, pcap_pkthdr *a2)
{
  uint64_t v3 = 0;
  v4[0] = a2;
  v4[1] = &v3;
  v4[2] = a1;
  if ((*(int (**)(pcap_t *, uint64_t, void, void *))a1)(a1, 1, *((void *)a1 + 110), v4) >= 1) {
    return v3;
  }
  else {
    return 0;
  }
}

int pcap_dispatch(pcap_t *a1, int a2, pcap_handler a3, u_char *a4)
{
  return (*(uint64_t (**)(pcap_t *, void, pcap_handler, u_char *))a1)(a1, *(void *)&a2, a3, a4);
}

int pcap_next_ex(pcap_t *a1, pcap_pkthdr **a2, const u_char **a3)
{
  v6[0] = (char *)a1 + 512;
  v6[1] = a3;
  v6[2] = a1;
  *a2 = (pcap_pkthdr *)((char *)a1 + 512);
  uint64_t v3 = *((void *)a1 + 8);
  int result = (*(uint64_t (**)(pcap_t *, uint64_t, void, void *))a1)(a1, 1, *((void *)a1 + 110), v6);
  if (result) {
    int v5 = result;
  }
  else {
    int v5 = -2;
  }
  if (v3) {
    return v5;
  }
  return result;
}

int pcap_findalldevs(pcap_if_t **a1, char *a2)
{
  int v7 = 0;
  int v3 = pcap_platform_finddevs((uint64_t *)&v7, a2);
  size_t v4 = v7;
  if (v3 == -1)
  {
    if (v7)
    {
      pcap_freealldevs(v7);
      size_t v4 = 0;
    }
    int v5 = -1;
  }
  else
  {
    int v5 = 0;
  }
  *a1 = v4;
  return v5;
}

void pcap_freealldevs(pcap_if_t *a1)
{
  if (a1)
  {
    int v1 = a1;
    do
    {
      next = v1->next;
      addresses = v1->addresses;
      if (addresses)
      {
        do
        {
          int v5 = addresses->next;
          addr = addresses->addr;
          if (addr) {
            free(addr);
          }
          netmasuint64_t k = addresses->netmask;
          if (netmask) {
            free(netmask);
          }
          broadaddr = addresses->broadaddr;
          if (broadaddr) {
            free(broadaddr);
          }
          dstaddr = addresses->dstaddr;
          if (dstaddr) {
            free(dstaddr);
          }
          free(addresses);
          addresses = v5;
        }
        while (v5);
      }
      free(v1->name);
      descriptiouint64_t n = v1->description;
      if (description) {
        free(description);
      }
      free(v1);
      int v1 = next;
    }
    while (next);
  }
}

uint64_t *find_or_add_if (uint64_t *a1, char *a2, unsigned int a3, unsigned int (*a4)(char *, int *, char *), char *a5)
{
  return find_or_add_dev(a1, a2, (a3 >> 3) & 1 | (2 * (a3 & 1)) | (a3 >> 4) & 4, a4, 0, a5);
}

uint64_t *find_or_add_dev(uint64_t *a1, char *__s1, int a3, unsigned int (*a4)(char *, int *, char *), const char *a5, char *a6)
{
  int v13 = a3;
  uint64_t v11 = a1;
  while (1)
  {
    uint64_t v11 = (uint64_t *)*v11;
    if (!v11) {
      break;
    }
    if (!strcmp(__s1, (const char *)v11[1])) {
      return v11;
    }
  }
  if (a4(__s1, &v13, a6) == -1) {
    return 0;
  }
  else {
    return add_dev(a1, __s1, v13, a5, a6);
  }
}

uint64_t add_addr_to_if (uint64_t *a1, char *a2, unsigned int a3, unsigned int (*a4)(char *, int *, char *), const void *a5, size_t a6, const void *a7, size_t a8, const void *a9, size_t a10, const void *a11, size_t a12, char *a13)
{
  long long v17 = find_or_add_dev(a1, a2, (a3 >> 3) & 1 | (2 * (a3 & 1)) | (a3 >> 4) & 4, a4, 0, a13);
  if (!v17) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0;
  }

  return add_addr_to_dev((uint64_t)v17, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t add_addr_to_dev(uint64_t a1, const void *a2, size_t a3, const void *a4, size_t a5, const void *a6, size_t a7, const void *a8, size_t size, char *a10)
{
  long long v18 = malloc_type_malloc(0x28uLL, 0x20040769AC3DAuLL);
  if (!v18)
  {
    long long v22 = __error();
    pcap_fmt_errmsg_for_errno(a10, 0x100uLL, *v22, "malloc");
    return 0xFFFFFFFFLL;
  }
  uint64_t v19 = v18;
  *long long v18 = 0;
  if (a2 && a3)
  {
    int v20 = dup_sockaddr(a2, a3);
    v19[1] = v20;
    if (!v20)
    {
      int v21 = __error();
      pcap_fmt_errmsg_for_errno(a10, 0x100uLL, *v21, "malloc");
LABEL_27:
      free(v19);
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    v18[1] = 0;
  }
  if (a4 && a5)
  {
    uint64_t v23 = dup_sockaddr(a4, a5);
    v19[2] = v23;
    if (!v23)
    {
      long long v24 = __error();
      pcap_fmt_errmsg_for_errno(a10, 0x100uLL, *v24, "malloc");
LABEL_25:
      long long v31 = (void *)v19[1];
      if (v31) {
        free(v31);
      }
      goto LABEL_27;
    }
  }
  else
  {
    v19[2] = 0;
  }
  if (a6 && a7)
  {
    long long v25 = dup_sockaddr(a6, a7);
    v19[3] = v25;
    if (!v25)
    {
      long long v26 = __error();
      pcap_fmt_errmsg_for_errno(a10, 0x100uLL, *v26, "malloc");
LABEL_23:
      long long v30 = (void *)v19[2];
      if (v30) {
        free(v30);
      }
      goto LABEL_25;
    }
  }
  else
  {
    v19[3] = 0;
  }
  if (a8 && size)
  {
    long long v27 = dup_sockaddr(a8, size);
    v19[4] = v27;
    if (!v27)
    {
      long long v28 = __error();
      pcap_fmt_errmsg_for_errno(a10, 0x100uLL, *v28, "malloc");
      long long v29 = (void *)v19[3];
      if (v29) {
        free(v29);
      }
      goto LABEL_23;
    }
  }
  else
  {
    v19[4] = 0;
  }
  uint64_t v33 = *(void **)(a1 + 24);
  while (v33)
  {
    unsigned int v34 = v33;
    uint64_t v33 = (void *)*v33;
    if (!v33)
    {
      uint64_t result = 0;
      *unsigned int v34 = v19;
      return result;
    }
  }
  uint64_t result = 0;
  *(void *)(a1 + 24) = v19;
  return result;
}

void *dup_sockaddr(const void *a1, size_t size)
{
  size_t v4 = malloc_type_malloc(size, 0xF39BFD8BuLL);
  int v5 = v4;
  if (v4) {
    memcpy(v4, a1, size);
  }
  return v5;
}

uint64_t **find_dev(uint64_t **a1, char *__s1)
{
  do
    a1 = (uint64_t **)*a1;
  while (a1 && strcmp(__s1, (const char *)a1[1]));
  return a1;
}

uint64_t *add_dev(uint64_t *a1, const char *a2, int a3, const char *a4, char *a5)
{
  size_t v10 = (uint64_t *)malloc_type_malloc(0x28uLL, 0x1030040C90965D9uLL);
  uint64_t v11 = v10;
  if (v10)
  {
    *size_t v10 = 0;
    uint64_t v12 = strdup(a2);
    v11[1] = (uint64_t)v12;
    if (!v12)
    {
      uint64_t v16 = __error();
      pcap_fmt_errmsg_for_errno(a5, 0x100uLL, *v16, "malloc");
      goto LABEL_8;
    }
    if (a4)
    {
      int v13 = strdup(a4);
      void v11[2] = (uint64_t)v13;
      if (!v13)
      {
        uint64_t v14 = __error();
        pcap_fmt_errmsg_for_errno(a5, 0x100uLL, *v14, "malloc");
        free((void *)v11[1]);
LABEL_8:
        free(v11);
        return 0;
      }
    }
    else
    {
      void v11[2] = 0;
    }
    v11[3] = 0;
    *((_DWORD *)v11 + 8) = a3;
    unsigned int figure_of_merit = get_figure_of_merit((uint64_t)v11);
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = (void *)v18;
      if (v18) {
        int v20 = (uint64_t *)v18;
      }
      else {
        int v20 = a1;
      }
      uint64_t v18 = *v20;
    }
    while (*v20 && figure_of_merit >= get_figure_of_merit(*v20));
    *uint64_t v11 = v18;
    if (v19) {
      *uint64_t v19 = v11;
    }
    else {
      *a1 = (uint64_t)v11;
    }
  }
  else
  {
    timeval v15 = __error();
    pcap_fmt_errmsg_for_errno(a5, 0x100uLL, *v15, "malloc");
  }
  return v11;
}

uint64_t get_figure_of_merit(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if ((v1 & 0x38) == 0x20) {
    unsigned int v2 = ~(v1 << 29) & 0xC0000000 | 0x20000000;
  }
  else {
    unsigned int v2 = ~(v1 << 29) & 0xC0000000;
  }
  unsigned int v3 = v2 & 0xEFFFFFFF | ((v1 & 1) << 28);
  if (!strcmp(*(const char **)(a1 + 8), "any")) {
    return v3 | 0x8000000;
  }
  else {
    return v3;
  }
}

char *__cdecl pcap_lookupdev(char *a1)
{
  if (pcap_new_api)
  {
    unsigned int v2 = 0;
    strcpy(a1, "pcap_lookupdev() is deprecated and is not supported in programs calling pcap_init()");
  }
  else
  {
    int v5 = 0;
    if (pcap_findalldevs(&v5, a1) == -1)
    {
      return 0;
    }
    else
    {
      unsigned int v3 = v5;
      if (!v5 || (v5->flags & 1) != 0)
      {
        unsigned int v2 = 0;
        strcpy(a1, "no suitable device found");
      }
      else
      {
        unsigned int v2 = (char *)&pcap_lookupdev_device;
        __strlcpy_chk();
      }
      pcap_freealldevs(v3);
    }
  }
  return v2;
}

int pcap_lookupnet(const char *a1, bpf_u_int32 *a2, bpf_u_int32 *a3, char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a1 || !strcmp(a1, "any"))
  {
    int result = 0;
    *a3 = 0;
    *a2 = 0;
    return result;
  }
  int v7 = socket(2, 2, 0);
  if (v7 < 0)
  {
    uint64_t v12 = __error();
    pcap_fmt_errmsg_for_errno(a4, 0x100uLL, *v12, "socket");
    return -1;
  }
  int v8 = v7;
  long long v15 = 0u;
  long long v16 = 0u;
  __strlcpy_chk();
  if (ioctl(v8, 0xC0206921uLL, &v15) < 0)
  {
    if (*__error() == 49)
    {
      *a3 = 0;
      *a2 = 0;
      close(v8);
      return 0;
    }
    int v14 = *__error();
    pcap_fmt_errmsg_for_errno(a4, 0x100uLL, v14, "SIOCGIFADDR: %s");
    goto LABEL_15;
  }
  *a2 = DWORD1(v16);
  long long v15 = 0u;
  long long v16 = 0u;
  __strlcpy_chk();
  if (ioctl(v8, 0xC0206925uLL, &v15) < 0)
  {
    int v13 = *__error();
    pcap_fmt_errmsg_for_errno(a4, 0x100uLL, v13, "SIOCGIFNETMASK: %s");
LABEL_15:
    close(v8);
    return -1;
  }
  close(v8);
  bpf_u_int32 v9 = DWORD1(v16);
  *a3 = DWORD1(v16);
  if (!v9)
  {
    bpf_u_int32 v10 = *a2;
    if ((*a2 & 0x80000000) == 0)
    {
      bpf_u_int32 v9 = -16777216;
LABEL_21:
      *a3 = v9;
      goto LABEL_22;
    }
    if (v10 >> 30 == 2)
    {
      bpf_u_int32 v9 = -65536;
      goto LABEL_21;
    }
    if (v10 >> 29 == 6)
    {
      bpf_u_int32 v9 = -256;
      goto LABEL_21;
    }
    snprintf(a4, 0x100uLL, "inet class for 0x%x unknown", *a2);
    return -1;
  }
LABEL_22:
  int result = 0;
  *a2 &= v9;
  return result;
}

pcap_t *__cdecl pcap_create(const char *a1, char *a2)
{
  if (!a1) {
    a1 = "any";
  }
  unsigned int v3 = strdup(a1);
  if (v3)
  {
    for (uint64_t i = 0; i != 32; i += 16)
    {
      int v7 = 0;
      int result = (pcap_t *)(*(uint64_t (**)(char *, char *, int *))((char *)&capture_source_types + i + 8))(v3, a2, &v7);
      if (v7)
      {
        if (result) {
          goto LABEL_8;
        }
        goto LABEL_11;
      }
    }
    pcap_create_interface((uint64_t)v3, a2);
    if (result)
    {
LABEL_8:
      *((void *)result + 15) = v3;
      return result;
    }
LABEL_11:
    free(v3);
  }
  else
  {
    int v6 = __error();
    pcap_fmt_errmsg_for_errno(a2, 0x100uLL, *v6, "malloc");
  }
  return 0;
}

double pcap_create_common(char *a1, size_t a2, uint64_t a3)
{
  unsigned int v3 = pcap_alloc_pcap_t(a1, a2, a3);
  if (v3)
  {
    *((void *)v3 + 100) = pcap_cant_set_rfmon;
    *((void *)v3 + 107) = pcap_setnonblock_unactivated;
    *(void *)unsigned int v3 = pcap_read_not_initialized;
    *((void *)v3 + 101) = pcap_inject_not_initialized;
    *((void *)v3 + 103) = pcap_setfilter_not_initialized;
    *((void *)v3 + 104) = pcap_setdirection_not_initialized;
    *((void *)v3 + 105) = pcap_set_datalink_not_initialized;
    *((void *)v3 + 106) = pcap_getnonblock_not_initialized;
    *((void *)v3 + 108) = pcap_stats_not_initialized;
    *((void *)v3 + 111) = pcap_cleanup_live_common;
    *((void *)v3 + 110) = pcap_oneshot;
    *((void *)v3 + 109) = pcap_breakloop_common;
    v3[24] = 0;
    *((void *)v3 + 16) = 0;
    *((void *)v3 + 17) = 0;
    v3[36] = 0;
    *(void *)&double result = 0xFFFFFFFFLL;
    *((void *)v3 + 19) = 0xFFFFFFFFLL;
    v3[43] = 0;
  }
  return result;
}

_DWORD *pcap_alloc_pcap_t(char *a1, size_t count, uint64_t a3)
{
  int v5 = malloc_type_calloc(count, 1uLL, 0x516F5029uLL);
  int v6 = v5;
  if (v5)
  {
    v5[4] = -1;
    v5[44] = -1;
    *((void *)v5 + 23) = 0;
    *((void *)v5 + 6) = (char *)v5 + a3;
  }
  else
  {
    int v7 = __error();
    pcap_fmt_errmsg_for_errno(a1, 0x100uLL, *v7, "malloc");
  }
  return v6;
}

uint64_t pcap_cant_set_rfmon()
{
  return 0;
}

uint64_t pcap_setnonblock_unactivated(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 148) = a2;
  return 0;
}

uint64_t pcap_check_activated(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 112)) {
    return 0;
  }
  strcpy((char *)(a1 + 208), "can't perform  operation on activated capture");
  return 0xFFFFFFFFLL;
}

int pcap_set_snaplen(pcap_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 28);
  if (v2)
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  else
  {
    *((_DWORD *)a1 + 24) = a2;
  }
  return v2;
}

int pcap_set_promisc(pcap_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 28);
  if (v2)
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  else
  {
    *((_DWORD *)a1 + 34) = a2;
  }
  return v2;
}

int pcap_set_rfmon(pcap_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 28);
  if (v2)
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  else
  {
    *((_DWORD *)a1 + 35) = a2;
  }
  return v2;
}

int pcap_set_timeout(pcap_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 28);
  if (v2)
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  else
  {
    *((_DWORD *)a1 + 32) = a2;
  }
  return v2;
}

int pcap_set_tstamp_type(pcap_t *a1, int a2)
{
  if (*((_DWORD *)a1 + 28))
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  if (a2 < 0) {
    return 3;
  }
  uint64_t v3 = *((unsigned int *)a1 + 120);
  if (!v3)
  {
    if (!a2)
    {
      int v2 = 0;
      *((_DWORD *)a1 + 38) = 0;
      return v2;
    }
    return 3;
  }
  if ((int)v3 < 1) {
    return 3;
  }
  size_t v4 = (int *)*((void *)a1 + 61);
  while (1)
  {
    int v5 = *v4++;
    if (v5 == a2) {
      break;
    }
    if (!--v3) {
      return 3;
    }
  }
  int v2 = 0;
  *((_DWORD *)a1 + 38) = a2;
  return v2;
}

int pcap_set_immediate_mode(pcap_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 28);
  if (v2)
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  else
  {
    *((_DWORD *)a1 + 36) = a2;
  }
  return v2;
}

int pcap_set_buffer_size(pcap_t *a1, int a2)
{
  if (*((_DWORD *)a1 + 28))
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  else
  {
    int v2 = 0;
    if (a2 >= 1) {
      *((_DWORD *)a1 + 33) = a2;
    }
  }
  return v2;
}

int pcap_set_tstamp_precision(pcap_t *a1, int a2)
{
  if (*((_DWORD *)a1 + 28))
  {
    strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
    return -4;
  }
  if (a2 < 0) {
    return -12;
  }
  uint64_t v3 = *((unsigned int *)a1 + 124);
  if (!v3)
  {
    if (!a2)
    {
      int v2 = 0;
      *((_DWORD *)a1 + 39) = 0;
      return v2;
    }
    return -12;
  }
  if ((int)v3 < 1) {
    return -12;
  }
  size_t v4 = (int *)*((void *)a1 + 63);
  while (1)
  {
    int v5 = *v4++;
    if (v5 == a2) {
      break;
    }
    if (!--v3) {
      return -12;
    }
  }
  int v2 = 0;
  *((_DWORD *)a1 + 39) = a2;
  return v2;
}

int pcap_get_tstamp_precision(pcap_t *a1)
{
  return *((_DWORD *)a1 + 39);
}

int pcap_activate(pcap_t *a1)
{
  if (!*((_DWORD *)a1 + 28))
  {
    int v3 = (*((uint64_t (**)(pcap_t *))a1 + 99))(a1);
    int v2 = v3;
    if (v3 < 0)
    {
      if (!*((unsigned char *)a1 + 208))
      {
        size_t v4 = pcap_statustostr(v3);
        snprintf((char *)a1 + 208, 0x100uLL, "%s", v4);
      }
    }
    else
    {
      if (!*((_DWORD *)a1 + 37)
        || (int v2 = (*((uint64_t (**)(pcap_t *, uint64_t))a1 + 107))(a1, 1), (v2 & 0x80000000) == 0))
      {
        *((_DWORD *)a1 + 28) = 1;
        return v2;
      }
      (*((void (**)(pcap_t *))a1 + 111))(a1);
    }
    *(void *)a1 = pcap_read_not_initialized;
    *((void *)a1 + 101) = pcap_inject_not_initialized;
    *((void *)a1 + 103) = pcap_setfilter_not_initialized;
    *((void *)a1 + 104) = pcap_setdirection_not_initialized;
    *((void *)a1 + 105) = pcap_set_datalink_not_initialized;
    *((void *)a1 + 106) = pcap_getnonblock_not_initialized;
    *((void *)a1 + 108) = pcap_stats_not_initialized;
    *((void *)a1 + 111) = pcap_cleanup_live_common;
    *((void *)a1 + 110) = pcap_oneshot;
    *((void *)a1 + 109) = pcap_breakloop_common;
    return v2;
  }
  strcpy((char *)a1 + 208, "can't perform  operation on activated capture");
  return -4;
}

const char *__cdecl pcap_statustostr(int a1)
{
  int v1 = a1 + 12;
  if (a1 + 12) < 0x10 && ((0xEFFFu >> v1)) {
    return off_264122B38[v1];
  }
  int v2 = pcap_statustostr_ebuf;
  snprintf(pcap_statustostr_ebuf, 0x1AuLL, "Unknown error: %d", a1);
  return v2;
}

pcap_t *__cdecl pcap_open_live(const char *a1, int a2, int a3, int a4, char *a5)
{
  bpf_u_int32 v9 = pcap_create(a1, a5);
  bpf_u_int32 v10 = v9;
  if (v9)
  {
    if (*((_DWORD *)v9 + 28))
    {
      strcpy((char *)v9 + 208, "can't perform  operation on activated capture");
      int v11 = -4;
      goto LABEL_4;
    }
    *((_DWORD *)v9 + 24) = a2;
    *((_DWORD *)v9 + 34) = a3;
    *((_DWORD *)v9 + 32) = a4;
    *((_DWORD *)v9 + 29) = 1;
    int v11 = pcap_activate(v9);
    if ((v11 & 0x80000000) == 0) {
      return v10;
    }
    if (v11 > -6)
    {
      if (v11 != -5)
      {
        if (v11 == -1)
        {
          snprintf(a5, 0x100uLL, "%s: %.*s");
          goto LABEL_5;
        }
LABEL_4:
        pcap_statustostr(v11);
        snprintf(a5, 0x100uLL, "%s: %s");
LABEL_5:
        pcap_close(v10);
        return 0;
      }
    }
    else if (v11 != -11 && v11 != -8)
    {
      goto LABEL_4;
    }
    pcap_statustostr(v11);
    snprintf(a5, 0x100uLL, "%s: %s (%.*s)");
    goto LABEL_5;
  }
  return v10;
}

void pcap_close(pcap_t *a1)
{
  (*((void (**)(void))a1 + 111))();
  int v2 = (void *)*((void *)a1 + 15);
  if (v2) {
    free(v2);
  }

  free(a1);
}

_DWORD *pcap_open_offline_common(char *a1, size_t a2, uint64_t a3)
{
  double result = pcap_alloc_pcap_t(a1, a2, a3);
  if (result) {
    result[39] = 0;
  }
  return result;
}

int pcap_loop(pcap_t *a1, int a2, pcap_handler a3, u_char *a4)
{
  uint64_t v6 = *(void *)&a2;
  while (1)
  {
    if (*((void *)a1 + 8))
    {
      int result = (*(uint64_t (**)(pcap_t *, uint64_t, pcap_handler, u_char *))a1)(a1, v6, a3, a4);
    }
    else
    {
      do
        int result = (*(uint64_t (**)(pcap_t *, uint64_t, pcap_handler, u_char *))a1)(a1, v6, a3, a4);
      while (!result);
    }
    if (result < 1) {
      break;
    }
    if ((int)v6 >= 1)
    {
      BOOL v9 = __OFSUB__(v6, result);
      uint64_t v6 = (v6 - result);
      if (((int)v6 < 0) ^ v9 | (v6 == 0)) {
        return 0;
      }
    }
  }
  return result;
}

void pcap_breakloop(pcap_t *a1)
{
}

int pcap_datalink(pcap_t *a1)
{
  if (*((_DWORD *)a1 + 28)) {
    return *((_DWORD *)a1 + 25);
  }
  else {
    return -3;
  }
}

int pcap_datalink_ext(pcap_t *a1)
{
  if (*((_DWORD *)a1 + 28)) {
    return *((_DWORD *)a1 + 26);
  }
  else {
    return -3;
  }
}

int pcap_list_datalinks(pcap_t *a1, int **a2)
{
  if (!*((_DWORD *)a1 + 28)) {
    return -3;
  }
  size_t v4 = *((int *)a1 + 117);
  if (v4)
  {
    int v5 = (int *)malloc_type_calloc(4uLL, v4, 0x2A2B5C2AuLL);
    *a2 = v5;
    if (v5)
    {
      memcpy(v5, *((const void **)a1 + 59), 4 * *((int *)a1 + 117));
      return *((_DWORD *)a1 + 117);
    }
  }
  else
  {
    int v7 = (int *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
    *a2 = v7;
    if (v7)
    {
      *int v7 = *((_DWORD *)a1 + 25);
      return 1;
    }
  }
  int v8 = __error();
  pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x101uLL, *v8, "malloc");
  return -1;
}

int pcap_set_datalink(pcap_t *a1, int a2)
{
  if (a2 < 0) {
    goto LABEL_12;
  }
  uint64_t v4 = *((unsigned int *)a1 + 117);
  if (!v4 || (int v5 = (uint64_t (*)(pcap_t *, void))*((void *)a1 + 105)) == 0)
  {
    if (*((_DWORD *)a1 + 25) == a2) {
      return 0;
    }
LABEL_11:
    if (a2 == 151)
    {
LABEL_15:
      snprintf((char *)a1 + 208, 0x101uLL, "%s is not one of the DLTs supported by this device");
      return -1;
    }
LABEL_12:
    BOOL v9 = &dword_264121C48;
    while (*((void *)v9 - 2))
    {
      int v10 = *v9;
      v9 += 6;
      if (v10 == a2) {
        goto LABEL_15;
      }
    }
    snprintf((char *)a1 + 208, 0x101uLL, "DLT %d is not one of the DLTs supported by this device");
    return -1;
  }
  if ((int)v4 < 1) {
    goto LABEL_11;
  }
  uint64_t v6 = 0;
  int v7 = (_DWORD *)*((void *)a1 + 59);
  while (v7[v6] != a2)
  {
    if (v4 == ++v6) {
      goto LABEL_11;
    }
  }
  if (v4 == 2 && a2 == 143 && *v7 == 1)
  {
    int result = 0;
    *((_DWORD *)a1 + 25) = 143;
  }
  else
  {
    int result = v5(a1, *(void *)&a2);
    if (result != -1)
    {
      int result = 0;
      *((_DWORD *)a1 + 25) = a2;
    }
  }
  return result;
}

const char *__cdecl pcap_datalink_val_to_name(int a1)
{
  if (a1 == 151) {
    return "PCAPNG";
  }
  int v3 = &dword_264121C48;
  do
  {
    int result = (const char *)*((void *)v3 - 2);
    if (!result) {
      break;
    }
    int v4 = *v3;
    v3 += 6;
  }
  while (v4 != a1);
  return result;
}

uint64_t pcap_strcasecmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    uint64_t v2 = *a1;
    uint64_t v3 = charmap[v2] - charmap[*a2];
    if (v3) {
      break;
    }
    ++a2;
    ++a1;
    if (!v2) {
      return 0;
    }
  }
  return v3;
}

int pcap_datalink_name_to_val(const char *a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = "PCAPNG";
  do
  {
    for (uint64_t i = a1; ; ++i)
    {
      uint64_t v4 = *(unsigned __int8 *)v2;
      if (charmap[v4] != charmap[*(unsigned __int8 *)i]) {
        break;
      }
      ++v2;
      if (!v4) {
        return (int)dlt_choices[3 * v1 + 2];
      }
    }
    ++v1;
    uint64_t v2 = dlt_choices[3 * v1];
  }
  while (v2);
  return -1;
}

const char *__cdecl pcap_datalink_val_to_description(int a1)
{
  for (uint64_t i = off_264121C38; *((_DWORD *)i - 2) != a1; i += 3)
  {
    if (!*i) {
      return 0;
    }
  }
  return *(i - 2);
}

const char *__cdecl pcap_datalink_val_to_description_or_dlt(int a1)
{
  uint64_t v1 = off_264121C38;
  uint64_t v2 = 153;
  while (*((_DWORD *)v1 - 2) != a1)
  {
    uint64_t v3 = *v1;
    v1 += 3;
    --v2;
    if (!v3) {
      goto LABEL_7;
    }
  }
  if (v2) {
    return *(v1 - 2);
  }
LABEL_7:
  uint64_t v4 = pcap_datalink_val_to_description_or_dlt_unkbuf;
  snprintf(pcap_datalink_val_to_description_or_dlt_unkbuf, 0x28uLL, "DLT %u", a1);
  return v4;
}

int pcap_tstamp_type_name_to_val(const char *a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = "host";
  do
  {
    for (uint64_t i = a1; ; ++i)
    {
      uint64_t v4 = *(unsigned __int8 *)v2;
      if (charmap[v4] != charmap[*(unsigned __int8 *)i]) {
        break;
      }
      ++v2;
      if (!v4) {
        return (int)tstamp_type_choices[3 * v1 + 2];
      }
    }
    ++v1;
    uint64_t v2 = tstamp_type_choices[3 * v1];
  }
  while (v1 != 6);
  return -1;
}

const char *__cdecl pcap_tstamp_type_val_to_name(int a1)
{
  if (!a1) {
    return "host";
  }
  uint64_t v1 = 0;
  do
  {
    uint64_t v2 = v1;
    v1 += 24;
  }
  while (v1 != 144 && *(_DWORD *)((char *)&tstamp_type_choices[5] + v2) != a1);
  return *(char **)((char *)&tstamp_type_choices[3] + v2);
}

const char *__cdecl pcap_tstamp_type_val_to_description(int a1)
{
  uint64_t v1 = 0;
  while (LODWORD(tstamp_type_choices[v1 + 2]) != a1)
  {
    v1 += 3;
    if (v1 == 18) {
      return 0;
    }
  }
  return tstamp_type_choices[v1 + 1];
}

int pcap_snapshot(pcap_t *a1)
{
  if (*((_DWORD *)a1 + 28)) {
    return *((_DWORD *)a1 + 24);
  }
  else {
    return -3;
  }
}

int pcap_is_swapped(pcap_t *a1)
{
  if (*((_DWORD *)a1 + 28)) {
    return *((_DWORD *)a1 + 14);
  }
  else {
    return -3;
  }
}

int pcap_major_version(pcap_t *a1)
{
  if (*((_DWORD *)a1 + 28)) {
    return *((_DWORD *)a1 + 22);
  }
  else {
    return -3;
  }
}

int pcap_minor_version(pcap_t *a1)
{
  if (*((_DWORD *)a1 + 28)) {
    return *((_DWORD *)a1 + 23);
  }
  else {
    return -3;
  }
}

int pcap_bufsize(pcap_t *a1)
{
  if (*((_DWORD *)a1 + 28)) {
    return *((_DWORD *)a1 + 5);
  }
  else {
    return -3;
  }
}

FILE *__cdecl pcap_file(pcap_t *a1)
{
  return (FILE *)*((void *)a1 + 8);
}

int pcap_fileno(pcap_t *a1)
{
  return *((_DWORD *)a1 + 4);
}

int pcap_get_selectable_fd(pcap_t *a1)
{
  return *((_DWORD *)a1 + 44);
}

const timeval *__cdecl pcap_get_required_select_timeout(pcap_t *a1)
{
  return (const timeval *)*((void *)a1 + 23);
}

int pcap_get_selectable_fd_list(pcap_t *a1, int **a2)
{
  int v3 = *((_DWORD *)a1 + 226);
  if (v3)
  {
    size_t v4 = (4 * v3);
    int v5 = (char *)*((void *)a1 + 112);
  }
  else
  {
    int v5 = (char *)a1 + 176;
    size_t v4 = 4;
  }
  uint64_t v6 = (int *)malloc_type_malloc(v4, 0xE7510F19uLL);
  *a2 = v6;
  if (v6)
  {
    memcpy(v6, v5, v4);
    return v4 >> 2;
  }
  else
  {
    LODWORD(v7) = -1;
  }
  return v7;
}

void pcap_perror(pcap_t *a1, const char *a2)
{
}

char *__cdecl pcap_geterr(pcap_t *a1)
{
  return (char *)a1 + 208;
}

int pcap_getnonblock(pcap_t *a1, char *a2)
{
  int v4 = (*((uint64_t (**)(void))a1 + 106))();
  if (v4 == -1) {
    strlcpy(a2, (const char *)a1 + 208, 0x100uLL);
  }
  return v4;
}

uint64_t pcap_getnonblock_fd(uint64_t a1)
{
  unsigned int v2 = fcntl(*(_DWORD *)(a1 + 16), 3, 0);
  if (v2 != -1) {
    return (v2 >> 2) & 1;
  }
  int v4 = __error();
  pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v4, "F_GETFL");
  return 0xFFFFFFFFLL;
}

int pcap_setnonblock(pcap_t *a1, int a2, char *a3)
{
  int v5 = (*((uint64_t (**)(pcap_t *, void))a1 + 107))(a1, *(void *)&a2);
  if (v5 == -1) {
    strlcpy(a3, (const char *)a1 + 208, 0x100uLL);
  }
  return v5;
}

uint64_t pcap_setnonblock_fd(uint64_t a1, int a2)
{
  int v4 = fcntl(*(_DWORD *)(a1 + 16), 3, 0);
  if (v4 == -1)
  {
    uint64_t v6 = "F_GETFL";
  }
  else
  {
    if (fcntl(*(_DWORD *)(a1 + 16), 4, v4 & 0xFFFFFFFB | (4 * (a2 != 0))) != -1) {
      return 0;
    }
    uint64_t v6 = "F_SETFL";
  }
  uint64_t v7 = __error();
  pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v7, v6);
  return 0xFFFFFFFFLL;
}

int pcap_setfilter(pcap_t *a1, bpf_program *a2)
{
  return (*((uint64_t (**)(pcap_t *, bpf_program *))a1 + 103))(a1, a2);
}

int pcap_setdirection(pcap_t *a1, pcap_direction_t a2)
{
  unsigned int v2 = (uint64_t (*)(void))*((void *)a1 + 104);
  if (v2)
  {
    if (a2 <= PCAP_D_NONE) {
      return v2();
    }
    strcpy((char *)a1 + 208, "Invalid direction");
  }
  else
  {
    strcpy((char *)a1 + 208, "Setting direction is not supported on this device");
  }
  return -1;
}

int pcap_stats(pcap_t *a1, pcap_stat *a2)
{
  return (*((uint64_t (**)(pcap_t *, pcap_stat *))a1 + 108))(a1, a2);
}

uint64_t pcap_do_addexit()
{
  if (did_atexit) {
    return 1;
  }
  if (atexit(pcap_close_all))
  {
    __strlcpy_chk();
    return 0;
  }
  else
  {
    uint64_t result = 1;
    did_atexit = 1;
  }
  return result;
}

void pcap_close_all()
{
  v0 = (pcap_t *)pcaps_to_close;
  while (v0)
  {
    pcap_close(v0);
    BOOL v1 = pcaps_to_close == (void)v0;
    v0 = (pcap_t *)pcaps_to_close;
    if (v1) {
      abort();
    }
  }
}

uint64_t pcap_add_to_pcaps_to_close(uint64_t result)
{
  *(void *)(result + 80) = pcaps_to_close;
  pcaps_to_close = result;
  return result;
}

uint64_t pcap_remove_from_pcaps_to_close(uint64_t result)
{
  uint64_t v1 = pcaps_to_close;
  if (pcaps_to_close)
  {
    if (pcaps_to_close == result)
    {
      uint64_t v3 = 0;
LABEL_8:
      if (v3) {
        int v4 = (uint64_t *)(v3 + 80);
      }
      else {
        int v4 = &pcaps_to_close;
      }
      *int v4 = *(void *)(result + 80);
    }
    else
    {
      while (1)
      {
        uint64_t v2 = *(void *)(v1 + 80);
        if (!v2) {
          break;
        }
        uint64_t v3 = v1;
        uint64_t v1 = *(void *)(v1 + 80);
        if (v2 == result) {
          goto LABEL_8;
        }
      }
    }
  }
  return result;
}

uint64_t pcap_breakloop_common(uint64_t result)
{
  *(_DWORD *)(result + 44) = 1;
  return result;
}

void pcap_cleanup_live_common(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v3 = *(void **)(a1 + 472);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 472) = 0;
    *(_DWORD *)(a1 + 468) = 0;
  }
  int v4 = *(void **)(a1 + 488);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 488) = 0;
    *(_DWORD *)(a1 + 480) = 0;
  }
  int v5 = *(void **)(a1 + 504);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 504) = 0;
    *(_DWORD *)(a1 + 496) = 0;
  }
  pcap_freecode((bpf_program *)(a1 + 192));
  int v6 = *(_DWORD *)(a1 + 16);
  if ((v6 & 0x80000000) == 0)
  {
    close(v6);
    *(_DWORD *)(a1 + 16) = -1;
  }
  *(_DWORD *)(a1 + 176) = -1;

  pcap_darwin_cleanup(a1);
}

int pcap_sendpacket(pcap_t *a1, const u_char *a2, int a3)
{
  if (a3 <= 0)
  {
    int v4 = (char *)a1 + 208;
    int v5 = __error();
    pcap_fmt_errmsg_for_errno(v4, 0x100uLL, *v5, "The number of bytes to be sent must be positive");
    return -1;
  }
  else if ((*((unsigned int (**)(pcap_t *, const u_char *))a1 + 101))(a1, a2) == -1)
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

int pcap_inject(pcap_t *a1, const void *a2, size_t a3)
{
  if (a3 >> 31)
  {
    uint64_t v3 = (char *)a1 + 208;
    int v4 = *__error();
    pcap_fmt_errmsg_for_errno(v3, 0x100uLL, v4, "More than %d bytes cannot be injected");
    return -1;
  }
  if (!a3)
  {
    uint64_t v7 = (char *)a1 + 208;
    int v8 = *__error();
    pcap_fmt_errmsg_for_errno(v7, 0x100uLL, v8, "The number of bytes to be injected must not be zero");
    return -1;
  }
  int v5 = (uint64_t (*)(void))*((void *)a1 + 101);

  return v5();
}

int pcap_offline_filter(const bpf_program *a1, const pcap_pkthdr *a2, const u_char *a3)
{
  bf_insns = a1->bf_insns;
  if (bf_insns) {
    LODWORD(bf_insns) = pcap_filter(bf_insns, a3, a2->len, a2->caplen);
  }
  return (int)bf_insns;
}

pcap_t *__cdecl pcap_open_dead_with_tstamp_precision(int a1, int a2, u_int a3)
{
  int v6 = (char *)malloc_type_malloc(0x490uLL, 0x10F0040E9B4F734uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    if (a3 >= 2) {
      a3 = 0;
    }
    bzero(v6 + 8, 0x488uLL);
    *((_DWORD *)v7 + 24) = a2;
    *((_DWORD *)v7 + 25) = a1;
    *((_DWORD *)v7 + 39) = a3;
    *((void *)v7 + 100) = pcap_can_set_rfmon_dead;
    *(void *)uint64_t v7 = pcap_read_dead;
    *((void *)v7 + 101) = pcap_inject_dead;
    *((void *)v7 + 103) = pcap_setfilter_dead;
    *((void *)v7 + 104) = pcap_setdirection_dead;
    *((void *)v7 + 105) = pcap_set_datalink_dead;
    *((void *)v7 + 106) = pcap_getnonblock_dead;
    *((void *)v7 + 107) = pcap_setnonblock_dead;
    *((void *)v7 + 108) = pcap_stats_dead;
    *((void *)v7 + 111) = pcap_cleanup_dead;
    *((_DWORD *)v7 + 28) = 1;
  }
  return (pcap_t *)v7;
}

uint64_t pcap_can_set_rfmon_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_read_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_inject_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_setfilter_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_setdirection_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_set_datalink_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_getnonblock_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_setnonblock_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t pcap_stats_dead(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

pcap_t *__cdecl pcap_open_dead(int a1, int a2)
{
  return pcap_open_dead_with_tstamp_precision(a1, a2, 0);
}

uint64_t pcap_read_not_initialized(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    strcpy((char *)(a1 + 208), "This operation isn't properly handled by that device");
  }
  else {
    strcpy((char *)(a1 + 208), "This handle hasn't been activated yet");
  }
  return 4294967293;
}

uint64_t pcap_inject_not_initialized(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    strcpy((char *)(a1 + 208), "This operation isn't properly handled by that device");
  }
  else {
    strcpy((char *)(a1 + 208), "This handle hasn't been activated yet");
  }
  return 4294967293;
}

uint64_t pcap_setfilter_not_initialized(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    strcpy((char *)(a1 + 208), "This operation isn't properly handled by that device");
  }
  else {
    strcpy((char *)(a1 + 208), "This handle hasn't been activated yet");
  }
  return 4294967293;
}

uint64_t pcap_setdirection_not_initialized(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    strcpy((char *)(a1 + 208), "This operation isn't properly handled by that device");
  }
  else {
    strcpy((char *)(a1 + 208), "This handle hasn't been activated yet");
  }
  return 4294967293;
}

uint64_t pcap_set_datalink_not_initialized(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    strcpy((char *)(a1 + 208), "This operation isn't properly handled by that device");
  }
  else {
    strcpy((char *)(a1 + 208), "This handle hasn't been activated yet");
  }
  return 4294967293;
}

uint64_t pcap_getnonblock_not_initialized(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    strcpy((char *)(a1 + 208), "This operation isn't properly handled by that device");
  }
  else {
    strcpy((char *)(a1 + 208), "This handle hasn't been activated yet");
  }
  return 4294967293;
}

uint64_t pcap_stats_not_initialized(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    strcpy((char *)(a1 + 208), "This operation isn't properly handled by that device");
  }
  else {
    strcpy((char *)(a1 + 208), "This handle hasn't been activated yet");
  }
  return 4294967293;
}

double pcap_ng_block_alloc(unint64_t a1)
{
  if (a1 <= 0x100000)
  {
    uint64_t v2 = malloc_type_malloc(a1 + 112, 0x3970CF8AuLL);
    if (v2)
    {
      double result = 0.0;
      v2[5] = 0u;
      v2[6] = 0u;
      v2[3] = 0u;
      v2[4] = 0u;
      v2[1] = 0u;
      v2[2] = 0u;
      *uint64_t v2 = 0u;
      *(void *)uint64_t v2 = v2 + 7;
      *((void *)v2 + 1) = a1;
    }
  }
  return result;
}

uint64_t pcap_ng_block_size_max()
{
  return 0x100000;
}

uint64_t pcap_ng_block_get_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t pcap_ng_block_get_len(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t pcap_ng_block_is_swapped(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t pcap_ng_block_reset(uint64_t a1, int a2)
{
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  uint64_t v2 = 0xFFFFFFFFLL;
  if (a2 > 0)
  {
    switch(a2)
    {
      case 1:
        int v3 = 1;
        goto LABEL_16;
      case 2:
        int v5 = 2;
        goto LABEL_14;
      case 3:
        *(_DWORD *)(a1 + 20) = 3;
        goto LABEL_18;
      case 4:
        *(_DWORD *)(a1 + 20) = 4;
        *(void *)(a1 + 40) = 0;
        goto LABEL_20;
      case 5:
        *(_DWORD *)(a1 + 20) = 5;
        uint64_t v4 = 12;
        goto LABEL_19;
      case 6:
        int v5 = 6;
LABEL_14:
        *(_DWORD *)(a1 + 20) = v5;
        uint64_t v4 = 20;
        goto LABEL_19;
      case 7:
      case 8:
      case 9:
        return v2;
      case 10:
        int v3 = 10;
LABEL_16:
        *(_DWORD *)(a1 + 20) = v3;
        uint64_t v4 = 8;
        goto LABEL_19;
      default:
        if (a2 != 168627466) {
          return v2;
        }
        *(_DWORD *)(a1 + 20) = 168627466;
        *(void *)(a1 + 40) = 16;
        *(void *)(a1 + 88) = 0x11A2B3C4DLL;
        *(void *)(a1 + 96) = -1;
        break;
    }
    goto LABEL_20;
  }
  if (a2 == -2147483647)
  {
    *(_DWORD *)(a1 + 20) = -2147483647;
LABEL_18:
    uint64_t v4 = 4;
    goto LABEL_19;
  }
  if (a2 == -2147483646)
  {
    *(_DWORD *)(a1 + 20) = -2147483646;
    uint64_t v4 = 16;
LABEL_19:
    *(void *)(a1 + 40) = v4;
LABEL_20:
    *(void *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    pcapng_update_block_length((void *)a1);
    return 0;
  }
  return v2;
}

void *pcapng_update_block_length(void *result)
{
  unint64_t v1 = result[5] + result[7] + result[9] + result[10] + 12;
  result[3] = v1;
  unint64_t v2 = result[1];
  if (v1 > v2) {
    errx(70, "%s block len %lu greater than buffer size %lu", "pcapng_update_block_length", v1, v2);
  }
  return result;
}

uint64_t pcap_ng_get_section_header_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == 168627466) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t pcap_ng_get_interface_description_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == 1) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t pcap_ng_get_enhanced_packet_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == 6) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t pcap_ng_get_simple_packet_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == 3) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t pcap_ng_get_packet_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == 2) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t pcap_ng_get_process_information_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == -2147483647) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t pcap_ng_get_os_event_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == -2147483646) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t pcap_ng_get_decryption_secrets_fields(uint64_t result)
{
  if (result)
  {
    if (*(_DWORD *)(result + 20) == 10) {
      result += 88;
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL pcap_ng_block_does_support_data(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 20);
  return v1 <= 0xA && ((1 << v1) & 0x44C) != 0 || v1 == -2147483646;
}

uint64_t pcap_ng_block_packet_get_data_ptr(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 20);
  if (v1 <= 0xA && ((1 << v1) & 0x44C) != 0 || v1 == -2147483646) {
    return *(void *)(a1 + 48);
  }
  else {
    return 0;
  }
}

uint64_t pcap_ng_block_packet_get_data_len(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 20);
  if (v1 <= 0xA && ((1 << v1) & 0x44C) != 0 || v1 == -2147483646) {
    return *(unsigned int *)(a1 + 64);
  }
  else {
    return 0;
  }
}

uint64_t pcap_ng_block_packet_copy_data(uint64_t a1, void *__src, size_t __len)
{
  unsigned int v3 = *(_DWORD *)(a1 + 20);
  if ((v3 > 0xA || ((1 << v3) & 0x44C) == 0) && v3 != -2147483646) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = __len;
  uint64_t v8 = (__len + 3) & 0xFFFFFFFC;
  unint64_t v9 = *(void *)(a1 + 8);
  if (*(void *)(a1 + 24) + (unint64_t)v8 > v9)
  {
    warnx("%s block len %lu greater than buffer size %lu", "pcap_ng_block_packet_copy_data", *(void *)(a1 + 24), v9);
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = *(void *)(a1 + 72);
  if (*(_OWORD *)(a1 + 72) != 0)
  {
    if (v3 == 3)
    {
      uint64_t v12 = 0;
    }
    else if (v3 == 4)
    {
      uint64_t v12 = (char *)(*(void *)a1 + *(void *)(a1 + 40) + 8);
      if (!*(_DWORD *)(a1 + 68)) {
        v12 += *(void *)(a1 + 56);
      }
    }
    else
    {
      uint64_t v13 = *(void *)a1 + *(void *)(a1 + 40) + 8;
      if (!*(_DWORD *)(a1 + 68)) {
        v13 += *(void *)(a1 + 56);
      }
      uint64_t v12 = (char *)(v13 + v11);
    }
    memmove(&v12[(int)v8 - *(_DWORD *)(a1 + 56)], v12, *(void *)(a1 + 80) + v11);
  }
  *(_DWORD *)(a1 + 68) = 0;
  int v14 = (void *)(*(void *)a1 + *(void *)(a1 + 40) + 8);
  *(void *)(a1 + 48) = v14;
  memmove(v14, __src, v6);
  if (v8 != v6) {
    bzero((void *)(*(void *)(a1 + 48) + v6), v8 - v6);
  }
  *(_DWORD *)(a1 + 64) = v6;
  *(void *)(a1 + 56) = v8;
  pcapng_update_block_length((void *)a1);
  return 0;
}

uint64_t pcap_ng_block_packet_set_data(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 20);
  if ((v3 > 0xA || ((1 << v3) & 0x44C) == 0) && v3 != -2147483646) {
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 64) = a3;
  *(_DWORD *)(a1 + 68) = 1;
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 56) = (a3 + 3) & 0xFFFFFFFC;
  pcapng_update_block_length((void *)a1);
  return 0;
}

uint64_t pcap_ng_block_add_option_with_value(uint64_t a1, uint64_t a2, void *__src, size_t __len)
{
  if (*(_DWORD *)(a1 + 20) == 3)
  {
    warnx("%s options not supported for block type %u", a2, __src, __len);
    return 0xFFFFFFFFLL;
  }
  unsigned int v4 = __len;
  int v6 = (__len + 3) & 0x1FFFC;
  uint64_t v7 = (v6 + 4);
  uint64_t v8 = *(void *)a1 + *(void *)(a1 + 40) + 8;
  if (!*(_DWORD *)(a1 + 68)) {
    v8 += *(void *)(a1 + 56);
  }
  if ((unint64_t)(*(void *)(a1 + 24) + v7) > *(void *)(a1 + 8))
  {
    warnx("%s block len %lu greater than buffer size %lu", a2, __src, __len);
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *(void *)(a1 + 80);
  int v10 = (_WORD *)(v8 + *(void *)(a1 + 72));
  uint64_t v11 = (_WORD *)((char *)v10 + v9 - 4);
  if (!v9) {
    uint64_t v11 = v10;
  }
  *uint64_t v11 = a2;
  v11[1] = __len;
  uint64_t v12 = v11 + 2;
  memmove(v11 + 2, __src, __len);
  if (v6 != v4) {
    bzero((char *)v12 + v4, v6 - v4);
  }
  uint64_t v13 = *(void *)(a1 + 80);
  if (!v13) {
    uint64_t v13 = 4;
  }
  uint64_t v14 = v13 + v7;
  *(void *)(a1 + 80) = v14;
  *(_DWORD *)((char *)v10 + v14 - 4) = 0;
  pcapng_update_block_length((void *)a1);
  return 0;
}

uint64_t pcap_ng_block_add_option_with_string(uint64_t a1, uint64_t a2, char *__s)
{
  size_t v6 = (unsigned __int16)strlen(__s);

  return pcap_ng_block_add_option_with_value(a1, a2, __s, v6);
}

uint64_t pcap_ng_block_add_option_with_uuid(uint64_t a1, uint64_t a2, void *a3)
{
  return pcap_ng_block_add_option_with_value(a1, a2, a3, 0x10uLL);
}

uint64_t pcap_ng_block_get_option(uint64_t a1, int a2, uint64_t a3)
{
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a1 + 80);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v18 = 0;
  int v7 = *(_DWORD *)(a1 + 32);
  LODWORD(v18) = *(_DWORD *)(a1 + 20);
  if (v18 != 3)
  {
    uint64_t v8 = *(void *)a1 + *(void *)(a1 + 40) + 8;
    if (!*(_DWORD *)(a1 + 68)) {
      v8 += *(void *)(a1 + 56);
    }
    uint64_t v6 = v8 + *(void *)(a1 + 72);
  }
  v17[0] = v6;
  v17[1] = v3;
  while (1)
  {
    uint64_t result = get_from_block_data(v17, 4uLL, pcap_ng_block_get_option_errbuf);
    if (!result) {
      break;
    }
    unsigned int v10 = bswap32(*(_DWORD *)result) >> 16;
    unsigned int v11 = __rev16(HIWORD(*(_DWORD *)result));
    if (v7) {
      unsigned int v12 = v11;
    }
    else {
      unsigned int v12 = HIWORD(*(_DWORD *)result);
    }
    if (v7) {
      unsigned __int16 v13 = v10;
    }
    else {
      unsigned __int16 v13 = *(_DWORD *)result;
    }
    uint64_t v14 = get_from_block_data(v17, (v12 + 3) & 0x1FFFC, pcap_ng_block_get_option_errbuf);
    if (v12) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15) {
      return 0;
    }
    if (a2 == v13)
    {
      uint64_t v16 = v14;
      *(_WORD *)a3 = a2;
      *(_WORD *)(a3 + 2) = v12;
      uint64_t result = 1;
      *(void *)(a3 + 8) = v16;
      return result;
    }
    if (!v13) {
      return 0;
    }
  }
  return result;
}

uint64_t pcapng_block_iterate_options(uint64_t a1, void (*a2)(uint64_t, void *, uint64_t), uint64_t a3)
{
  uint64_t i = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    uint64_t v7 = 0;
    uint64_t v22 = 0;
    int v8 = *(_DWORD *)(a1 + 32);
    LODWORD(v22) = *(_DWORD *)(a1 + 20);
    if (v22 != 3)
    {
      uint64_t v9 = *(void *)a1 + *(void *)(a1 + 40) + 8;
      if (!*(_DWORD *)(a1 + 68)) {
        v9 += *(void *)(a1 + 56);
      }
      uint64_t v7 = v9 + *(void *)(a1 + 72);
    }
    uint64_t v10 = *(void *)(a1 + 80);
    v21[0] = v7;
    v21[1] = v10;
    unsigned int v11 = (unsigned int *)get_from_block_data(v21, 4uLL, pcapng_block_iterate_options_errbuf);
    for (uint64_t i = 0; v11; uint64_t i = (i + 1))
    {
      unsigned int v12 = *v11;
      unsigned int v13 = __rev16(HIWORD(*v11));
      unsigned int v14 = v8 ? v13 : HIWORD(*v11);
      uint64_t v15 = get_from_block_data(v21, (v14 + 3) & 0x1FFFC, pcapng_block_iterate_options_errbuf);
      v20[0] = 0;
      if (v14 && v15 == 0) {
        break;
      }
      unsigned int v17 = bswap32(v12) >> 16;
      if (!v8) {
        LOWORD(v17) = v12;
      }
      LOWORD(v20[0]) = v17;
      int v18 = (unsigned __int16)v17;
      WORD1(v20[0]) = v14;
      v20[1] = v15;
      a2(a1, v20, a3);
      if (!v18) {
        return (i + 1);
      }
      unsigned int v11 = (unsigned int *)get_from_block_data(v21, 4uLL, pcapng_block_iterate_options_errbuf);
    }
  }
  return i;
}

uint64_t pcapng_block_iterate_name_records(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    uint64_t v17 = 0;
    int v4 = *(_DWORD *)(a1 + 32);
    LODWORD(v17) = *(_DWORD *)(a1 + 20);
    if (v17 == 4)
    {
      uint64_t v3 = *(void *)a1 + *(void *)(a1 + 40) + 8;
      if (!*(_DWORD *)(a1 + 68)) {
        v3 += *(void *)(a1 + 56);
      }
    }
    uint64_t v2 = 0;
    uint64_t v5 = *(void *)(a1 + 72);
    v16[0] = v3;
    v16[1] = v5;
    do
    {
      uint64_t v6 = (unsigned int *)get_from_block_data(v16, 4uLL, pcapng_block_iterate_name_records_errbuf);
      if (!v6) {
        break;
      }
      unsigned int v7 = bswap32(*v6) >> 16;
      unsigned int v8 = __rev16(HIWORD(*v6));
      unsigned int v9 = v4 ? v8 : HIWORD(*v6);
      __int16 v10 = v4 ? v7 : *v6;
      uint64_t v11 = get_from_block_data(v16, (v9 + 3) & 0x1FFFC, pcapng_block_iterate_name_records_errbuf);
      BOOL v12 = v9 && v11 == 0;
      BOOL v13 = !v12;
      uint64_t v2 = v12 ? v2 : (v2 + 1);
    }
    while (v13 && v10 != 0);
  }
  return v2;
}

uint64_t pcap_ng_block_add_name_record_with_ip4(uint64_t a1, void *__src, const char **a3)
{
  if (*(_DWORD *)(a1 + 20) == 4) {
    return pcap_ng_block_add_name_record_common(a1, 4uLL, __src, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t pcap_ng_block_add_name_record_common(uint64_t a1, size_t __len, void *__src, const char **a4)
{
  if (*(_DWORD *)(a1 + 20) != 4) {
    return 0xFFFFFFFFLL;
  }
  int v8 = *(_DWORD *)(a1 + 68);
  uint64_t v9 = *(void *)a1 + *(void *)(a1 + 40) + 8;
  __int16 v10 = (_WORD *)v9;
  if (!v8) {
    __int16 v10 = (_WORD *)(v9 + *(void *)(a1 + 56));
  }
  uint64_t v11 = *a4;
  if (*a4)
  {
    uint64_t v12 = 0;
    BOOL v13 = a4 + 1;
    do
    {
      if (!*v11) {
        break;
      }
      v12 += strlen(v11) + 1;
      unsigned int v14 = *v13++;
      uint64_t v11 = v14;
    }
    while (v14);
  }
  else
  {
    uint64_t v12 = 0;
  }
  unint64_t v15 = (v12 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  size_t v16 = __len + v15 + 4;
  size_t v17 = *(void *)(a1 + 8);
  if (*(void *)(a1 + 24) + v16 > v17)
  {
    warnx("%s block len %lu greater than buffer size %lu", "pcap_ng_block_add_name_record_common", *(void *)(a1 + 24), v17);
    return 0xFFFFFFFFLL;
  }
  size_t v18 = *(void *)(a1 + 80);
  if (v18)
  {
    if (!v8) {
      v9 += *(void *)(a1 + 56);
    }
    memmove((void *)(v9 + *(void *)(a1 + 72) + v16), (const void *)(v9 + *(void *)(a1 + 72)), v18);
  }
  uint64_t v19 = *(void *)(a1 + 72);
  if (v19) {
    int v20 = (_WORD *)((char *)v10 + v19 - 4);
  }
  else {
    int v20 = v10;
  }
  *int v20 = 1;
  v20[1] = v15 + __len;
  int v21 = (char *)(v20 + 2);
  memmove(v20 + 2, __src, __len);
  uint64_t v22 = *a4;
  if (*a4)
  {
    uint64_t v23 = a4 + 1;
    do
    {
      if (!*v22) {
        break;
      }
      unsigned __int16 v24 = strlen(v22) + 1;
      memmove(v21, v22, v24);
      __len += v24;
      long long v25 = *v23++;
      uint64_t v22 = v25;
    }
    while (v25);
  }
  if (v15 != v12) {
    bzero(&v21[__len], v15 - v12);
  }
  *(void *)(a1 + 72) += v16;
  pcapng_update_block_length((void *)a1);
  return 0;
}

uint64_t pcap_ng_block_add_name_record_with_ip6(uint64_t a1, void *__src, const char **a3)
{
  if (*(_DWORD *)(a1 + 20) == 4) {
    return pcap_ng_block_add_name_record_common(a1, 0x10uLL, __src, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

unint64_t *pcap_ng_externalize_block(unint64_t *result, unint64_t a2, uint64_t a3)
{
  if (result)
  {
    unint64_t v4 = *(void *)(a3 + 24);
    if (v4 > a2) {
      return 0;
    }
    uint64_t v5 = result;
    uint64_t result = 0;
    int __src = 0;
    *uint64_t v5 = *(unsigned int *)(a3 + 20) | (v4 << 32);
    int v6 = *(_DWORD *)(a3 + 20);
    if (v6 <= 0)
    {
      if (v6 != -2147483647)
      {
        if (v6 != -2147483646) {
          return result;
        }
        if (!*(_DWORD *)(a3 + 100)) {
          *(_DWORD *)(a3 + 100) = *(_DWORD *)(a3 + 64);
        }
      }
LABEL_18:
      size_t v7 = *(void *)(a3 + 40);
      if (v7)
      {
        memmove(v5 + 1, (const void *)(a3 + 88), v7);
        unsigned int v8 = *(_DWORD *)(a3 + 40) + 8;
      }
      else
      {
        unsigned int v8 = 8;
      }
      if (*(void *)(a3 + 56))
      {
        unsigned int v9 = *(_DWORD *)(a3 + 64);
        memmove((char *)v5 + v8, *(const void **)(a3 + 48), v9);
        v8 += *(_DWORD *)(a3 + 64);
        size_t v10 = ((v9 + 3) & 0xFFFFFFFC) - v9;
        if (v10)
        {
          bzero((char *)v5 + v8, v10);
          v8 += v10;
        }
      }
      size_t v11 = *(void *)(a3 + 72);
      if (v11)
      {
        if (*(_DWORD *)(a3 + 20) == 4)
        {
          uint64_t v12 = (char *)(*(void *)a3 + *(void *)(a3 + 40) + 8);
          if (!*(_DWORD *)(a3 + 68)) {
            v12 += *(void *)(a3 + 56);
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
        memmove((char *)v5 + v8, v12, v11);
        uint64_t v13 = *(void *)(a3 + 72);
        v8 += v13;
      }
      else
      {
        uint64_t v13 = 0;
      }
      size_t v14 = *(void *)(a3 + 80);
      if (v14)
      {
        if (*(_DWORD *)(a3 + 20) == 3)
        {
          unint64_t v15 = 0;
        }
        else
        {
          uint64_t v16 = *(void *)a3 + *(void *)(a3 + 40) + 8;
          if (!*(_DWORD *)(a3 + 68)) {
            v16 += *(void *)(a3 + 56);
          }
          unint64_t v15 = (const void *)(v16 + v13);
        }
        memmove((char *)v5 + v8, v15, v14);
        v8 += *(_DWORD *)(a3 + 80);
      }
      int __src = *(void *)(a3 + 24);
      memmove((char *)v5 + v8, &__src, v8);
      return (unint64_t *)(v8 + 4);
    }
    else
    {
      switch(v6)
      {
        case 1:
        case 4:
        case 5:
          goto LABEL_18;
        case 2:
        case 6:
          if (!*(_DWORD *)(a3 + 100)) {
            *(_DWORD *)(a3 + 100) = *(_DWORD *)(a3 + 64);
          }
          if (!*(_DWORD *)(a3 + 104)) {
            *(_DWORD *)(a3 + 104) = *(_DWORD *)(a3 + 64);
          }
          goto LABEL_18;
        case 3:
          if (!*(_DWORD *)(a3 + 88)) {
            *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 64);
          }
          goto LABEL_18;
        default:
          if (v6 == 168627466) {
            goto LABEL_18;
          }
          break;
      }
    }
  }
  return result;
}

ssize_t pcap_ng_dump_block(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  char v25 = 0;
  __int16 v24 = 0;
  unint64_t v4 = *(unsigned int **)a2;
  unsigned int v5 = *(_DWORD *)(a2 + 20);
  *unint64_t v4 = v5;
  v4[1] = *(void *)(a2 + 24);
  if (v5 > 0xA) {
    goto LABEL_9;
  }
  if (((1 << v5) & 0x432) != 0) {
    goto LABEL_14;
  }
  if (v5 == 2 || v5 == 6)
  {
    if (!*(_DWORD *)(a2 + 100)) {
      *(_DWORD *)(a2 + 100) = *(_DWORD *)(a2 + 64);
    }
    if (!*(_DWORD *)(a2 + 104)) {
      *(_DWORD *)(a2 + 104) = *(_DWORD *)(a2 + 64);
    }
  }
  else
  {
LABEL_9:
    if (v5 + 0x7FFFFFFF >= 2 && v5 != 168627466) {
      return 0;
    }
  }
LABEL_14:
  size_t v7 = *(void *)(a2 + 40);
  if (v7)
  {
    memmove(v4 + 2, (const void *)(a2 + 88), v7);
    unsigned int v8 = *(unsigned int **)a2;
    uint64_t v9 = *(void *)(a2 + 40);
  }
  else
  {
    uint64_t v9 = 0;
    unsigned int v8 = v4;
  }
  size_t v10 = v9 + 8;
  size_t v11 = (char *)v8 + v9 + 8;
  uint64_t v12 = *(void *)(a2 + 56);
  if (*(_DWORD *)(a2 + 68)) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = *(void *)(a2 + 56);
  }
  size_t v14 = &v11[v13];
  uint64_t v16 = *(void *)(a2 + 72);
  uint64_t v15 = *(void *)(a2 + 80);
  size_t v17 = &v14[v16 + v15];
  *(_DWORD *)size_t v17 = v4[1];
  v26.iov_base = v8;
  v26.iov_leuint64_t n = v10;
  if (v12)
  {
    uint64_t v18 = *(unsigned int *)(a2 + 64);
    uint64_t v27 = *(void *)(a2 + 48);
    uint64_t v28 = v18;
    uint64_t v19 = ((v18 + 3) & 0xFFFFFFFC) - v18;
    if (v19)
    {
      long long v29 = &v24;
      uint64_t v30 = v19;
      unsigned int v20 = 3;
    }
    else
    {
      unsigned int v20 = 2;
    }
  }
  else
  {
    unsigned int v20 = 1;
  }
  int v21 = &v26 + v20;
  v21->iov_leuint64_t n = v16 + v15 + 4;
  if (v16)
  {
    size_t v17 = 0;
    int v22 = 4;
    goto LABEL_29;
  }
  if (v15)
  {
    int v22 = 3;
    size_t v17 = v14;
    size_t v14 = 0;
LABEL_29:
    if (*(_DWORD *)(a2 + 20) == v22) {
      size_t v17 = v14;
    }
  }
  v21->iov_base = v17;
  return writev(*(__int16 *)(*(void *)a1 + 18), &v26, v20 + 1);
}

uint64_t pcap_ng_block_init_with_raw_block(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v4 = a1;
  return pcap_ng_block_internalize_common(&v4, a2, a3);
}

uint64_t pcap_ng_block_internalize_common(uint64_t *a1, uint64_t a2, unsigned int *a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    int v6 = *(_DWORD *)(a2 + 56);
  }
  else {
    int v6 = 0;
  }
  unsigned int v8 = bswap32(*a3);
  unsigned int v9 = bswap32(a3[1]);
  if (v6) {
    int v10 = v8;
  }
  else {
    int v10 = *a3;
  }
  if (v6) {
    unsigned int v11 = v9;
  }
  else {
    unsigned int v11 = a3[1];
  }
  if ((v10 > 0xA || ((1 << v10) & 0x47E) == 0) && (v10 + 0x7FFFFFFF) >= 2)
  {
    if (v10 != 168627466)
    {
      snprintf((char *)(a2 + 208), 0x100uLL, "%s: Unknown block type length %u");
      return 0xFFFFFFFFLL;
    }
    pcap_ng_init_section_info((_DWORD *)a2);
  }
  if (v11 > 0x100000)
  {
    snprintf((char *)(a2 + 208), 0x100uLL, "%s: Block total length %u is greater than 16 MB");
    return 0xFFFFFFFFLL;
  }
  unsigned int v14 = v11 + 3;
  uint64_t v15 = (v11 + 3) & 0xFFFFFFFC;
  uint64_t v16 = *a1;
  if (!*a1)
  {
    pcap_ng_block_alloc(v14 & 0xFFFFFFFC);
    uint64_t v16 = v17;
    if (!v17)
    {
      snprintf((char *)(a2 + 208), 0x100uLL, "%s: Unknown block type %u");
      return 0xFFFFFFFFLL;
    }
  }
  int v84 = 0;
  *(void *)uint64_t v16 = a3;
  *(void *)(v16 + 8) = v15;
  *(_DWORD *)(v16 + 16) = 1;
  pcap_ng_block_reset(v16, v10);
  *(void *)(v16 + 24) = v15;
  *(_DWORD *)(v16 + 32) = v6;
  v82[0] = (uint64_t)(a3 + 2);
  v82[1] = v15 - 12;
  int v83 = v10;
  if (v10 > 0)
  {
    switch(v10)
    {
      case 1:
        if (*(_DWORD *)(v16 + 20) == 1) {
          uint64_t v18 = v16 + 88;
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = (unsigned __int16 *)get_from_block_data(v82, 8uLL, (char *)(a2 + 208));
        if (!v19) {
          goto LABEL_112;
        }
        unsigned int v20 = *v19;
        *(_WORD *)uint64_t v18 = v20;
        unsigned int v21 = v19[1];
        *(_WORD *)(v18 + 2) = v21;
        unsigned int v22 = *((_DWORD *)v19 + 1);
        *(_DWORD *)(v18 + 4) = v22;
        if (v6)
        {
          *(_WORD *)uint64_t v18 = __rev16(v20);
          *(_WORD *)(v18 + 2) = __rev16(v21);
          *(_DWORD *)(v18 + 4) = bswap32(v22);
        }
        goto LABEL_104;
      case 2:
        if (*(_DWORD *)(v16 + 20) == 2) {
          uint64_t v37 = v16 + 88;
        }
        else {
          uint64_t v37 = 0;
        }
        unint64_t v38 = (char *)(a2 + 208);
        long long v39 = (unsigned __int16 *)get_from_block_data(v82, 0x14uLL, (char *)(a2 + 208));
        if (!v39) {
          goto LABEL_112;
        }
        unsigned int v40 = *v39;
        *(_WORD *)uint64_t v37 = v40;
        unsigned int v41 = v39[1];
        *(_WORD *)(v37 + 2) = v41;
        unsigned int v42 = *((_DWORD *)v39 + 1);
        *(_DWORD *)(v37 + 4) = v42;
        unsigned int v43 = *((_DWORD *)v39 + 2);
        *(_DWORD *)(v37 + 8) = v43;
        unsigned int v44 = *((_DWORD *)v39 + 3);
        *(_DWORD *)(v37 + 12) = v44;
        unsigned int v45 = *((_DWORD *)v39 + 4);
        *(_DWORD *)(v37 + 16) = v45;
        if (!v6) {
          goto LABEL_84;
        }
        *(_WORD *)uint64_t v37 = __rev16(v40);
        *(_WORD *)(v37 + 2) = __rev16(v41);
        *(_DWORD *)(v37 + 4) = bswap32(v42);
        *(_DWORD *)(v37 + 8) = bswap32(v43);
        unsigned int v44 = bswap32(v44);
        unsigned int v46 = bswap32(v45);
        *(_DWORD *)(v37 + 12) = v44;
        goto LABEL_83;
      case 3:
        int v47 = *(_DWORD *)(v16 + 20);
        __int16 v24 = (char *)(a2 + 208);
        uint64_t v48 = (unsigned int *)get_from_block_data(v82, 4uLL, (char *)(a2 + 208));
        if (!v48) {
          goto LABEL_112;
        }
        uint64_t v49 = (unsigned int *)(v16 + 88);
        if (v47 != 3) {
          uint64_t v49 = 0;
        }
        unsigned int v50 = *v48;
        unsigned int v51 = bswap32(*v48);
        if (v6) {
          unsigned int v50 = v51;
        }
        unsigned int *v49 = v50;
        if ((int)v15 - 16 >= v50) {
          unsigned int v52 = v50;
        }
        else {
          unsigned int v52 = v15 - 16;
        }
        goto LABEL_96;
      case 4:
        break;
      case 5:
        if (*(_DWORD *)(v16 + 20) == 5) {
          uint64_t v58 = v16 + 88;
        }
        else {
          uint64_t v58 = 0;
        }
        uint64_t v59 = (unsigned __int16 *)get_from_block_data(v82, 0xCuLL, (char *)(a2 + 208));
        if (!v59) {
          goto LABEL_112;
        }
        unsigned int v60 = *v59;
        *(_WORD *)uint64_t v58 = v60;
        unsigned int v61 = *((_DWORD *)v59 + 1);
        *(_DWORD *)(v58 + 4) = v61;
        unsigned int v62 = *((_DWORD *)v59 + 2);
        *(_DWORD *)(v58 + 8) = v62;
        if (v6)
        {
          *(_WORD *)uint64_t v58 = __rev16(v60);
          *(_DWORD *)(v58 + 4) = bswap32(v61);
          *(_DWORD *)(v58 + 8) = bswap32(v62);
        }
        goto LABEL_104;
      case 6:
        if (*(_DWORD *)(v16 + 20) == 6) {
          uint64_t v37 = v16 + 88;
        }
        else {
          uint64_t v37 = 0;
        }
        unint64_t v38 = (char *)(a2 + 208);
        long long v63 = (unsigned int *)get_from_block_data(v82, 0x14uLL, (char *)(a2 + 208));
        if (!v63) {
          goto LABEL_112;
        }
        unsigned int v64 = *v63;
        *(_DWORD *)uint64_t v37 = *v63;
        unsigned int v65 = v63[1];
        *(_DWORD *)(v37 + 4) = v65;
        unsigned int v66 = v63[2];
        *(_DWORD *)(v37 + 8) = v66;
        unsigned int v44 = v63[3];
        *(_DWORD *)(v37 + 12) = v44;
        unsigned int v67 = v63[4];
        *(_DWORD *)(v37 + 16) = v67;
        if (!v6) {
          goto LABEL_84;
        }
        *(_DWORD *)uint64_t v37 = bswap32(v64);
        *(_DWORD *)(v37 + 4) = bswap32(v65);
        unsigned int v44 = bswap32(v44);
        *(_DWORD *)(v37 + 8) = bswap32(v66);
        *(_DWORD *)(v37 + 12) = v44;
        unsigned int v46 = bswap32(v67);
LABEL_83:
        *(_DWORD *)(v37 + 16) = v46;
LABEL_84:
        uint64_t v68 = get_from_block_data(v82, (v44 + 3) & 0xFFFFFFFC, v38);
        if (!v68) {
          goto LABEL_112;
        }
        *(_DWORD *)(v16 + 68) = 0;
        *(void *)(v16 + 48) = v68;
        int v69 = *(_DWORD *)(v37 + 12);
        *(_DWORD *)(v16 + 64) = v69;
        *(void *)(v16 + 56) = (v69 + 3) & 0xFFFFFFFC;
        goto LABEL_104;
      case 7:
      case 8:
      case 9:
        goto LABEL_112;
      case 10:
        if (*(_DWORD *)(v16 + 20) == 10) {
          int v70 = (unsigned int *)(v16 + 88);
        }
        else {
          int v70 = 0;
        }
        __int16 v24 = (char *)(a2 + 208);
        uint64_t v71 = (unsigned int *)get_from_block_data(v82, 8uLL, (char *)(a2 + 208));
        if (!v71) {
          goto LABEL_112;
        }
        unsigned int v72 = *v71;
        unsigned int *v70 = *v71;
        unsigned int v29 = v71[1];
        v70[1] = v29;
        if (v6)
        {
          unsigned int v29 = bswap32(v29);
          unsigned int *v70 = bswap32(v72);
          v70[1] = v29;
        }
        unsigned int v30 = v15 - 20;
        goto LABEL_93;
      default:
        if (v10 != 168627466) {
          goto LABEL_112;
        }
        uint64_t v31 = *(_DWORD *)(v16 + 20) == 168627466 ? v16 + 88 : 0;
        uint64_t v32 = get_from_block_data(v82, 0x10uLL, (char *)(a2 + 208));
        if (!v32) {
          goto LABEL_112;
        }
        unsigned int v33 = *(_DWORD *)v32;
        *(_DWORD *)uint64_t v31 = *(_DWORD *)v32;
        unsigned int v34 = *(unsigned __int16 *)(v32 + 4);
        *(_WORD *)(v31 + 4) = v34;
        unsigned int v35 = *(unsigned __int16 *)(v32 + 6);
        *(_WORD *)(v31 + 6) = v35;
        unint64_t v36 = *(void *)(v32 + 8);
        *(void *)(v31 + 8) = v36;
        if (v6)
        {
          *(_DWORD *)uint64_t v31 = bswap32(v33);
          *(_WORD *)(v31 + 4) = __rev16(v34);
          *(_WORD *)(v31 + 6) = __rev16(v35);
          *(void *)(v31 + 8) = bswap64(v36);
        }
        goto LABEL_104;
    }
    while (1)
    {
      uint64_t v53 = get_from_block_data(v82, 4uLL, (char *)(a2 + 208));
      if (!v53) {
        goto LABEL_112;
      }
      long long v54 = (_WORD *)v53;
      unsigned int v55 = *(unsigned __int16 *)(v53 + 2);
      unsigned int v56 = bswap32(v55) >> 16;
      if (v6) {
        LOWORD(v55) = v56;
      }
      unint64_t v57 = ((unsigned __int16)v55 + 3) & 0x1FFFC;
      if (!get_from_block_data(v82, v57, (char *)(a2 + 208))) {
        goto LABEL_112;
      }
      *(void *)(v16 + 72) += v57 + 4;
      if (!*v54) {
        goto LABEL_104;
      }
    }
  }
  if (v10 != -2147483647)
  {
    if (v10 == -2147483646)
    {
      uint64_t v23 = *(_DWORD *)(v16 + 20) == -2147483646 ? (unsigned int *)(v16 + 88) : 0;
      __int16 v24 = (char *)(a2 + 208);
      char v25 = (unsigned int *)get_from_block_data(v82, 0x10uLL, (char *)(a2 + 208));
      if (v25)
      {
        unsigned int v26 = *v25;
        unsigned int *v23 = *v25;
        unsigned int v27 = v25[1];
        v23[1] = v27;
        unsigned int v28 = v25[2];
        v23[2] = v28;
        unsigned int v29 = v25[3];
        v23[3] = v29;
        if (v6)
        {
          unsigned int *v23 = bswap32(v26);
          v23[1] = bswap32(v27);
          unsigned int v29 = bswap32(v29);
          v23[2] = bswap32(v28);
          v23[3] = v29;
        }
        unsigned int v30 = v15 - 28;
LABEL_93:
        unsigned int v52 = v30 >= v29 ? v29 : v30;
LABEL_96:
        uint64_t v73 = get_from_block_data(v82, (v52 + 3) & 0xFFFFFFFC, v24);
        if (v73)
        {
          *(_DWORD *)(v16 + 64) = v52;
          *(_DWORD *)(v16 + 68) = 0;
          *(void *)(v16 + 48) = v73;
          *(void *)(v16 + 56) = (v52 + 3) & 0xFFFFFFFC;
          goto LABEL_104;
        }
      }
    }
LABEL_112:
    if (!*a1) {
      free((void *)v16);
    }
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(v16 + 20) == -2147483647) {
    uint64_t v74 = (unsigned int *)(v16 + 88);
  }
  else {
    uint64_t v74 = 0;
  }
  unsigned int v75 = (unsigned int *)get_from_block_data(v82, 4uLL, (char *)(a2 + 208));
  if (!v75) {
    goto LABEL_112;
  }
  *uint64_t v74 = *v75;
  if (v6) {
    *uint64_t v74 = bswap32(*(unsigned __int16 *)v75) >> 16;
  }
LABEL_104:
  uint64_t v76 = (char *)(a2 + 208);
  do
  {
    uint64_t v77 = get_from_block_data(v82, 4uLL, v76);
    if (!v77) {
      break;
    }
    unsigned int v78 = (_WORD *)v77;
    unsigned int v79 = *(unsigned __int16 *)(v77 + 2);
    unsigned int v80 = bswap32(v79) >> 16;
    if (v6) {
      LOWORD(v79) = v80;
    }
    unint64_t v81 = ((unsigned __int16)v79 + 3) & 0x1FFFC;
    if (!get_from_block_data(v82, v81, v76)) {
      goto LABEL_112;
    }
    *(void *)(v16 + 80) += v81 + 4;
  }
  while (*v78);
  uint64_t result = 0;
  if (!*a1) {
    *a1 = v16;
  }
  return result;
}

uint64_t pcap_ng_block_alloc_with_raw_block(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = 0;
  if (pcap_ng_block_internalize_common(&v3, a1, a2)) {
    return 0;
  }
  else {
    return v3;
  }
}

void sf_cleanup(uint64_t a1)
{
  uint64_t v2 = *(FILE **)(a1 + 64);
  if (v2 != (FILE *)*MEMORY[0x263EF8350]) {
    fclose(v2);
  }
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3) {
    free(v3);
  }

  pcap_freecode((bpf_program *)(a1 + 192));
}

pcap_t *__cdecl pcap_open_offline_with_tstamp_precision(pcap_t *result, u_int a2, char *a3)
{
  if (!result)
  {
    strcpy(a3, "A null pointer was supplied as the file name");
    return result;
  }
  uint64_t v4 = *(void *)&a2;
  unsigned int v5 = result;
  if (*(unsigned char *)result == 45 && !*((unsigned char *)result + 1))
  {
    int v6 = (FILE *)*MEMORY[0x263EF8350];
    if (!*MEMORY[0x263EF8350])
    {
      uint64_t result = 0;
      strcpy(a3, "The standard input is not open");
      return result;
    }
  }
  else
  {
    int v6 = fopen((const char *)result, "rb");
    if (!v6)
    {
      size_t v7 = __error();
      pcap_fmt_errmsg_for_errno(a3, 0x100uLL, *v7, "%s", (const char *)v5);
      return 0;
    }
  }
  uint64_t result = (pcap_t *)pcap_fopen_offline_internal(v6, v4, (uint64_t)a3, 0);
  if (!result && v6 != (FILE *)*MEMORY[0x263EF8350])
  {
    fclose(v6);
    return 0;
  }
  return result;
}

pcap_t *__cdecl pcap_fopen_offline_with_tstamp_precision(FILE *a1, u_int a2, char *a3)
{
  return (pcap_t *)pcap_fopen_offline_internal(a1, *(uint64_t *)&a2, (uint64_t)a3, 0);
}

pcap_t *__cdecl pcap_open_offline(const char *a1, char *a2)
{
  return pcap_open_offline_with_tstamp_precision(a1, 0, a2);
}

uint64_t pcap_adjust_snapshot(int a1, uint64_t a2)
{
  if ((int)a2 <= 0) {
    return max_snaplen_for_dlt(a1);
  }
  else {
    return a2;
  }
}

uint64_t pcap_fopen_offline_internal(FILE *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a1)
  {
    uint64_t v12 = 0;
    strcpy((char *)a3, "Null FILE * pointer provided to savefile open routine");
    return v12;
  }
  int v22 = 0;
  off_t v8 = ftello(a1);
  size_t v9 = fread(&__ptr, 1uLL, 4uLL, a1);
  if (v9 != 4)
  {
    size_t v15 = v9;
    if (ferror(a1))
    {
      uint64_t v16 = __error();
      pcap_fmt_errmsg_for_errno((char *)a3, 0x100uLL, *v16, "error reading dump file");
    }
    else
    {
      snprintf((char *)a3, 0x100uLL, "truncated dump file; tried to read %zu file header bytes, only got %zu",
        4uLL,
        v15);
    }
LABEL_18:
    fseeko(a1, v8, 0);
    return 0;
  }
  if (!a4)
  {
    uint64_t v17 = 0;
    char v18 = 1;
    while (1)
    {
      char v19 = v18;
      uint64_t v10 = ((uint64_t (*)(int *, FILE *, uint64_t, uint64_t, int *, void))*(&check_headers + v17))(&__ptr, a1, a2, a3, &v22, 0);
      unsigned int v11 = pcap_offline_read;
      if (v10) {
        goto LABEL_5;
      }
      if (v22) {
        goto LABEL_18;
      }
      char v18 = 0;
      uint64_t v17 = 1;
      if ((v19 & 1) == 0)
      {
        *(_DWORD *)(a3 + 16) = 7627117;
        unsigned int v20 = "unknown file format";
        goto LABEL_17;
      }
    }
  }
  uint64_t v10 = pcap_ng_check_header(&__ptr, a1, a2, (__n128 *)a3, &v22, 1);
  unsigned int v11 = pcap_ng_offline_read;
  if (!v10)
  {
    if (!v22)
    {
      *(_DWORD *)(a3 + 15) = 6646889;
      unsigned int v20 = "not a pcap-ng file";
LABEL_17:
      *(_OWORD *)a3 = *(_OWORD *)v20;
    }
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  *(void *)(v10 + 64) = a1;
  *(_DWORD *)(v10 + 72) = 0;
  int v14 = fileno(a1);
  *(_DWORD *)(v12 + 172) = 0;
  *(_DWORD *)(v12 + 176) = v14;
  *(void *)uint64_t v12 = v13;
  *(void *)(v12 + 808) = sf_inject;
  *(void *)(v12 + 824) = install_bpf_program;
  *(void *)(v12 + 832) = sf_setdirection;
  *(void *)(v12 + 840) = 0;
  *(void *)(v12 + 848) = sf_getnonblock;
  *(void *)(v12 + 856) = sf_setnonblock;
  *(void *)(v12 + 864) = sf_stats;
  *(void *)(v12 + 880) = pcap_oneshot;
  *(void *)(v12 + 872) = pcap_breakloop_common;
  *(_DWORD *)(v12 + 112) = 1;
  return v12;
}

uint64_t pcap_ng_open_offline(uint64_t __filename, char *a2)
{
  if (!__filename)
  {
    strcpy(a2, "A null pointer was supplied as the file name");
    return __filename;
  }
  uint64_t v3 = (const char *)__filename;
  if (*(unsigned char *)__filename == 45 && !*(unsigned char *)(__filename + 1))
  {
    uint64_t v4 = (FILE *)*MEMORY[0x263EF8350];
  }
  else
  {
    uint64_t v4 = fopen((const char *)__filename, "r");
    if (!v4)
    {
      unsigned int v5 = __error();
      int v6 = pcap_strerror(*v5);
      snprintf(a2, 0x100uLL, "%s: %s", v3, v6);
      return 0;
    }
  }
  __filename = pcap_fopen_offline_internal(v4, 0, (uint64_t)a2, 1);
  if (!__filename && v4 != (FILE *)*MEMORY[0x263EF8350])
  {
    fclose(v4);
    return 0;
  }
  return __filename;
}

uint64_t pcap_ng_fopen_offline(FILE *a1, uint64_t a2)
{
  return pcap_fopen_offline_internal(a1, 0, a2, 1);
}

pcap_t *__cdecl pcap_fopen_offline(FILE *a1, char *a2)
{
  return (pcap_t *)pcap_fopen_offline_internal(a1, 0, (uint64_t)a2, 0);
}

uint64_t pcap_offline_read(uint64_t a1, int a2, void (*a3)(uint64_t, long long *, uint64_t), uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a1 + 44))
  {
    uint64_t v5 = 0;
    uint64_t v12 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v30 = 0;
    do
    {
      unsigned int v9 = (*(uint64_t (**)(uint64_t, long long *, uint64_t *))(a1 + 8))(a1, &v13, &v12);
      if (v9)
      {
        if (v9 == 1) {
          return 0;
        }
        else {
          return v9;
        }
      }
      uint64_t v10 = *(void *)(a1 + 200);
      if (!v10 || pcap_filter(v10, v12, DWORD1(v14), v14))
      {
        a3(a4, &v13, v12);
        uint64_t v5 = (v5 + 1);
        if (a2 >= 1 && (int)v5 >= a2) {
          return v5;
        }
      }
      uint64_t v30 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
    }
    while (!*(_DWORD *)(a1 + 44));
    if (v5) {
      return v5;
    }
  }
  *(_DWORD *)(a1 + 44) = 0;
  return 4294967294;
}

uint64_t pcap_ng_offline_read(uint64_t a1, int a2, void (*a3)(uint64_t, long long *, void), uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a1 + 44))
  {
    uint64_t v5 = 0;
    uint64_t v12 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v30 = 0;
    do
    {
      unsigned int v9 = (*(uint64_t (**)(uint64_t, long long *, uint64_t *))(a1 + 8))(a1, &v13, &v12);
      if (v9)
      {
        if (v9 == 1) {
          return 0;
        }
        else {
          return v9;
        }
      }
      if (*(void *)(a1 + 200)) {
        BOOL v10 = v12 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10 || bpf_filter())
      {
        a3(a4, &v13, *(void *)(a1 + 24));
        uint64_t v5 = (v5 + 1);
        if (a2 >= 1 && (int)v5 >= a2) {
          return v5;
        }
      }
      uint64_t v30 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
    }
    while (!*(_DWORD *)(a1 + 44));
    if (v5) {
      return v5;
    }
  }
  *(_DWORD *)(a1 + 44) = 0;
  return 4294967294;
}

uint64_t sf_inject()
{
  return 0xFFFFFFFFLL;
}

uint64_t sf_setdirection(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t sf_getnonblock()
{
  return 0;
}

uint64_t sf_setnonblock(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

uint64_t sf_stats(uint64_t a1)
{
  return 0xFFFFFFFFLL;
}

_DWORD *pcap_check_header(unsigned int *a1, FILE *__stream, int a3, char *a4, _DWORD *a5)
{
  unsigned int v9 = 0;
  *a5 = 0;
  unsigned int v10 = *a1;
  if ((int)*a1 <= -725372256)
  {
    if (v10 != -1582154675 && v10 != -1582119980 && v10 != -1582117580) {
      return v9;
    }
    int v13 = 0;
    unsigned int v14 = *a1;
LABEL_20:
    memset(v29, 0, sizeof(v29));
    if (fread(v29, 1uLL, 0x14uLL, __stream) != 20)
    {
      if (ferror(__stream))
      {
        long long v18 = __error();
        pcap_fmt_errmsg_for_errno(a4, 0x100uLL, *v18, "error reading dump file");
      }
      else
      {
        snprintf(a4, 0x100uLL, "truncated dump file; tried to read %zu file header bytes, only got %zu");
      }
      goto LABEL_66;
    }
    if (v10 != -1582154675 && v10 != -1582119980 && v10 != -1582117580)
    {
      LOWORD(v29[0]) = bswap32(LOWORD(v29[0])) >> 16;
      HIWORD(v29[0]) = bswap32(HIWORD(v29[0])) >> 16;
      *(int8x8_t *)&v29[3] = vrev32_s8(*(int8x8_t *)&v29[3]);
    }
    int v17 = LOWORD(v29[0]);
    if (LOWORD(v29[0]) <= 1u)
    {
      unsigned int v9 = 0;
      strcpy(a4, "archaic pcap savefile format");
LABEL_67:
      *a5 = 1;
      return v9;
    }
    unsigned int v19 = HIWORD(v29[0]);
    if ((LOWORD(v29[0]) != 2 || HIWORD(v29[0]) >= 5u) && (LOWORD(v29[0]) != 543 || HIWORD(v29[0])))
    {
      snprintf(a4, 0x100uLL, "unsupported pcap savefile version %u.%u");
LABEL_66:
      unsigned int v9 = 0;
      goto LABEL_67;
    }
    long long v20 = pcap_open_offline_common(a4, 0x4A0uLL, 1168);
    unsigned int v9 = v20;
    if (!v20) {
      goto LABEL_67;
    }
    v20[14] = v13;
    v20[22] = v17;
    v20[23] = v19;
    int v21 = v29[4];
    int v22 = linktype_to_dlt(v29[4] & 0x3FFFFFF);
    v9[25] = v22;
    v9[26] = v21 & 0xFC000000;
    LODWORD(v23) = pcap_adjust_snapshot(v22, v29[3]);
    v9[24] = v23;
    *((void *)v9 + 1) = pcap_next_packet;
    uint64_t v24 = *((void *)v9 + 6);
    v9[39] = a3;
    if (a3 == 1)
    {
      if (v14 != -1582154675)
      {
        int v25 = 1;
        goto LABEL_44;
      }
    }
    else
    {
      if (a3)
      {
        snprintf(a4, 0x100uLL, "unknown time stamp resolution %u", a3);
LABEL_65:
        free(v9);
        goto LABEL_66;
      }
      if (v14 == -1582154675)
      {
        int v25 = 2;
LABEL_44:
        *(_DWORD *)(v24 + 12) = v25;
        goto LABEL_45;
      }
    }
    *(_DWORD *)(v24 + 12) = 0;
LABEL_45:
    if (v17 == 543 || v19 <= 2)
    {
      int v26 = 1;
    }
    else
    {
      if (v19 != 3)
      {
        *(_DWORD *)(v24 + 8) = 0;
        goto LABEL_52;
      }
      int v26 = 2;
    }
    *(_DWORD *)(v24 + 8) = v26;
LABEL_52:
    if (v14 == -1582117580)
    {
      *(void *)uint64_t v24 = 24;
      if (v9[25] == 1)
      {
        if ((int)v23 > 2147483633) {
          LODWORD(v23) = 0x7FFFFFFF;
        }
        else {
          LODWORD(v23) = v23 + 14;
        }
        v9[24] = v23;
      }
    }
    else
    {
      *(void *)uint64_t v24 = 16;
    }
    if (v23 >= 0x800) {
      size_t v23 = 2048;
    }
    else {
      size_t v23 = v23;
    }
    v9[5] = v23;
    long long v27 = malloc_type_malloc(v23, 0x44CD27F2uLL);
    *((void *)v9 + 3) = v27;
    if (v27)
    {
      *((void *)v9 + 119) = 0;
      v9[240] = 0;
      *(_OWORD *)(v9 + 242) = 0u;
      *((void *)v9 + 124) = 0;
      *((void *)v9 + 126) = 0;
      *((void *)v9 + 125) = 0;
      *((unsigned char *)v9 + 1016) = 0;
      *((void *)v9 + 111) = sf_cleanup;
      return v9;
    }
    strcpy(a4, "out of memory");
    goto LABEL_65;
  }
  if (v10 == -725372255 || v10 == 1295823521 || v10 == 885895841)
  {
    unsigned int v14 = bswap32(v10);
    int v13 = 1;
    goto LABEL_20;
  }
  return v9;
}

uint64_t pcap_next_packet()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t __ptr = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  size_t v7 = *(FILE **)(v0 + 64);
  size_t v8 = fread(&__ptr, 1uLL, *(void *)v6, v7);
  if (v8 == *(void *)v6)
  {
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 248) = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    *(_OWORD *)(v4 + 216) = 0u;
    *(_OWORD *)(v4 + 232) = 0u;
    *(_OWORD *)(v4 + 184) = 0u;
    *(_OWORD *)(v4 + 200) = 0u;
    *(_OWORD *)(v4 + 152) = 0u;
    *(_OWORD *)(v4 + 168) = 0u;
    *(_OWORD *)(v4 + 120) = 0u;
    *(_OWORD *)(v4 + 136) = 0u;
    *(_OWORD *)(v4 + 88) = 0u;
    *(_OWORD *)(v4 + 104) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 72) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    unsigned int v9 = v36;
    if (*(_DWORD *)(v5 + 56))
    {
      unsigned int v9 = bswap32(v36);
      unsigned int v10 = bswap32(HIDWORD(v36));
      uint64_t v11 = bswap32(__ptr);
      signed int v12 = bswap32(HIDWORD(__ptr));
    }
    else
    {
      unsigned int v10 = HIDWORD(v36);
      signed int v12 = HIDWORD(__ptr);
      uint64_t v11 = (int)__ptr;
    }
    *(_DWORD *)(v4 + 16) = v9;
    *(_DWORD *)(v4 + 20) = v10;
    *(void *)uint64_t v4 = v11;
    *(_DWORD *)(v4 + 8) = v12;
    int v16 = *(_DWORD *)(v6 + 12);
    if (v16 == 2)
    {
      int v17 = v12 / 1000;
    }
    else
    {
      if (v16 != 1)
      {
LABEL_15:
        int v18 = *(_DWORD *)(v6 + 8);
        if (v18 == 1 || v18 == 2 && v9 > v10)
        {
          *(_DWORD *)(v4 + 16) = v10;
          *(_DWORD *)(v4 + 20) = v9;
        }
        else
        {
          unsigned int v10 = v9;
        }
        unsigned int v19 = max_snaplen_for_dlt(*(_DWORD *)(v5 + 100));
        unsigned int v20 = *(_DWORD *)(v4 + 16);
        LODWORD(v21) = *(_DWORD *)(v5 + 96);
        if (v10 > v19)
        {
          if (v20 <= v21)
          {
            max_snaplen_for_dlt(*(_DWORD *)(v5 + 100));
            snprintf((char *)(v5 + 208), 0x100uLL, "invalid packet capture length %u, bigger than maximum of %u");
          }
          else
          {
            snprintf((char *)(v5 + 208), 0x100uLL, "invalid packet capture length %u, bigger than snaplen of %d");
          }
          return 0xFFFFFFFFLL;
        }
        if (v20 > v21)
        {
          int v22 = *(void **)(v5 + 24);
          if (v20 <= *(_DWORD *)(v5 + 20)) {
            goto LABEL_27;
          }
          int v22 = malloc_type_realloc(v22, *(unsigned int *)(v5 + 96), 0x389B9402uLL);
          if (v22)
          {
            *(void *)(v5 + 24) = v22;
            *(_DWORD *)(v5 + 20) = v21;
            LODWORD(v21) = *(_DWORD *)(v5 + 96);
LABEL_27:
            size_t v23 = fread(v22, 1uLL, (int)v21, v7);
            uint64_t v24 = *(unsigned int *)(v5 + 96);
            if (v23 == v24)
            {
              int v25 = *(_DWORD *)(v4 + 16);
              unint64_t v26 = (v25 - v24);
              if (v25 != v24)
              {
                while (1)
                {
                  size_t v27 = v26 >= 0x1000 ? 4096 : v26;
                  size_t v28 = fread(v38, 1uLL, v27, v7);
                  v23 += v28;
                  if (v28 != v27) {
                    break;
                  }
                  v26 -= v27;
                  if (!v26)
                  {
                    LODWORD(v24) = *(_DWORD *)(v5 + 96);
                    goto LABEL_35;
                  }
                }
                unsigned int v14 = (char *)(v5 + 208);
                if (!ferror(v7)) {
                  goto LABEL_52;
                }
                goto LABEL_6;
              }
LABEL_35:
              *(_DWORD *)(v4 + 16) = v24;
              goto LABEL_48;
            }
            goto LABEL_51;
          }
LABEL_53:
          strcpy((char *)(v5 + 208), "out of memory");
          return 0xFFFFFFFFLL;
        }
        if (v20 <= *(_DWORD *)(v5 + 20))
        {
          unsigned int v33 = *(void **)(v5 + 24);
        }
        else
        {
          unsigned int v30 = (v20 - 1) | ((v20 - 1) >> 1) | (((v20 - 1) | ((v20 - 1) >> 1)) >> 2);
          unsigned int v31 = v30 | (v30 >> 4) | ((v30 | (v30 >> 4)) >> 8);
          int v32 = v31 | HIWORD(v31);
          if (v32 + 1 < v21) {
            size_t v21 = (v32 + 1);
          }
          else {
            size_t v21 = v21;
          }
          unsigned int v33 = malloc_type_realloc(*(void **)(v5 + 24), v21, 0x389B9402uLL);
          if (!v33) {
            goto LABEL_53;
          }
          *(void *)(v5 + 24) = v33;
          *(_DWORD *)(v5 + 20) = v21;
          unsigned int v20 = *(_DWORD *)(v4 + 16);
        }
        if (fread(v33, 1uLL, v20, v7) == *(_DWORD *)(v4 + 16))
        {
LABEL_48:
          uint64_t v34 = *(void *)(v5 + 24);
          *uint64_t v2 = v34;
          if (*(_DWORD *)(v5 + 56)) {
            swap_pseudo_headers(*(unsigned int *)(v5 + 100), v4, v34);
          }
          return 0;
        }
LABEL_51:
        unsigned int v14 = (char *)(v5 + 208);
        if (!ferror(v7))
        {
LABEL_52:
          snprintf(v14, 0x100uLL, "truncated dump file; tried to read %u captured bytes, only got %zu");
          return 0xFFFFFFFFLL;
        }
        goto LABEL_6;
      }
      int v17 = 1000 * v12;
    }
    *(_DWORD *)(v4 + 8) = v17;
    goto LABEL_15;
  }
  size_t v13 = v8;
  if (ferror(v7))
  {
    unsigned int v14 = (char *)(v5 + 208);
LABEL_6:
    long long v15 = __error();
    pcap_fmt_errmsg_for_errno(v14, 0x100uLL, *v15, "error reading dump file");
    return 0xFFFFFFFFLL;
  }
  if (v13)
  {
    snprintf((char *)(v5 + 208), 0x100uLL, "truncated dump file; tried to read %zu header bytes, only got %zu");
    return 0xFFFFFFFFLL;
  }
  return 1;
}

void pcap_dump(u_char *a1, const pcap_pkthdr *a2, const u_char *a3)
{
  uint64_t v5 = *(FILE **)a1;
  __darwin_suseconds_t tv_usec = a2->ts.tv_usec;
  v7[0] = a2->ts.tv_sec;
  v7[1] = tv_usec;
  uint64_t v8 = *(void *)&a2->caplen;
  fwrite(v7, 0x10uLL, 1uLL, v5);
  fwrite(a3, a2->caplen, 1uLL, v5);
}

void *pcap_alloc_dumper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_calloc(1uLL, 0x48uLL, 0x10A0040AD783C20uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    *uint64_t v4 = a2;
  }
  else
  {
    uint64_t v6 = __error();
    size_t v7 = strerror(*v6);
    snprintf((char *)(a1 + 208), 0x100uLL, "cannot allocate struct pcap_dumper, error %s", v7);
  }
  return v5;
}

pcap_dumper_t *__cdecl pcap_dump_open(pcap_t *a1, const char *a2)
{
  if (!*((_DWORD *)a1 + 28))
  {
    snprintf((char *)a1 + 208, 0x100uLL, "%s: not-yet-activated pcap_t passed to pcap_dump_open");
    return 0;
  }
  unsigned int v4 = dlt_to_linktype(*((unsigned int *)a1 + 25));
  if (v4 == -1)
  {
    snprintf((char *)a1 + 208, 0x100uLL, "%s: link-layer type %d isn't supported in savefiles");
    return 0;
  }
  if (!a2)
  {
    strcpy((char *)a1 + 208, "A null pointer was supplied as the file name");
    return 0;
  }
  unsigned int v5 = v4;
  int v6 = *((_DWORD *)a1 + 26);
  if (*a2 == 45 && !a2[1])
  {
    uint64_t v8 = (FILE *)*MEMORY[0x263EF8358];
    a2 = "standard output";
    goto LABEL_14;
  }
  size_t v7 = fopen(a2, "wb");
  if (!v7)
  {
    unsigned int v10 = __error();
    pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x100uLL, *v10, "%s", a2);
    return 0;
  }
  uint64_t v8 = v7;
LABEL_14:

  return (pcap_dumper_t *)pcap_setup_dump((uint64_t)a1, v6 | v5, v8, a2);
}

void *pcap_setup_dump(uint64_t a1, int a2, FILE *a3, const char *a4)
{
  uint64_t v8 = pcap_alloc_dumper(a1, (uint64_t)a3);
  if (v8)
  {
    int v9 = *(_DWORD *)(a1 + 96);
    int v10 = *(_DWORD *)(a1 + 156) == 1 ? -1582154675 : -1582119980;
    __ptr[0] = v10;
    __ptr[1] = 262146;
    uint64_t v14 = 0;
    int v15 = v9;
    int v16 = a2;
    if (fwrite(__ptr, 0x18uLL, 1uLL, a3) != 1)
    {
      free(v8);
      uint64_t v11 = __error();
      pcap_fmt_errmsg_for_errno((char *)(a1 + 208), 0x100uLL, *v11, "Can't write to %s", a4);
      if ((FILE *)*MEMORY[0x263EF8358] != a3) {
        fclose(a3);
      }
      return 0;
    }
  }
  return v8;
}

pcap_dumper_t *__cdecl pcap_dump_fopen(pcap_t *a1, FILE *fp)
{
  int v4 = dlt_to_linktype(*((unsigned int *)a1 + 25));
  if (v4 == -1)
  {
    snprintf((char *)a1 + 208, 0x100uLL, "stream: link-layer type %d isn't supported in savefiles", *((_DWORD *)a1 + 25));
    return 0;
  }
  else
  {
    int v5 = *((_DWORD *)a1 + 26) | v4;
    return (pcap_dumper_t *)pcap_setup_dump((uint64_t)a1, v5, fp, "stream");
  }
}

pcap_dumper_t *__cdecl pcap_dump_open_append(pcap_t *a1, const char *a2)
{
  int v4 = dlt_to_linktype(*((unsigned int *)a1 + 25));
  if (v4 == -1)
  {
    snprintf((char *)a1 + 208, 0x100uLL, "%s: link-layer type %d isn't supported in savefiles", a2, -1);
    return 0;
  }
  if (!a2)
  {
    uint64_t v8 = 0;
    strcpy((char *)a1 + 208, "A null pointer was supplied as the file name");
    return v8;
  }
  int v5 = v4;
  if (*a2 != 45 || a2[1])
  {
    int v6 = fopen(a2, "ab+");
    if (v6)
    {
      size_t v7 = v6;
      uint64_t v8 = (pcap_dumper_t *)pcap_alloc_dumper((uint64_t)a1, (uint64_t)v6);
      if (fseek(v7, 0, 0) == -1)
      {
        int v11 = *__error();
        pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x100uLL, v11, "Can't seek to the beginning of %s");
        goto LABEL_50;
      }
      __ptr[0] = 0;
      __ptr[1] = 0;
      uint64_t v21 = 0;
      size_t v9 = fread(__ptr, 1uLL, 0x18uLL, v7);
      if (v9 != 24)
      {
        size_t v14 = v9;
        if (ferror(v7))
        {
          int v15 = *__error();
          pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x100uLL, v15, "%s");
          goto LABEL_50;
        }
        int v17 = feof(v7);
        if (v14 && v17)
        {
          snprintf((char *)a1 + 208, 0x100uLL, "%s: truncated pcap file header");
          goto LABEL_50;
        }
        if (!v14)
        {
          if (sf_write_header((uint64_t)a1, v7, v5, *((_DWORD *)a1 + 24)) == -1)
          {
            int v19 = *__error();
            pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x100uLL, v19, "Can't write to %s");
            goto LABEL_50;
          }
          goto LABEL_43;
        }
      }
      if (SLODWORD(__ptr[0]) <= -725372256)
      {
        if (SLODWORD(__ptr[0]) <= -1582119981)
        {
          if (LODWORD(__ptr[0]) != -1591002035)
          {
            if (LODWORD(__ptr[0]) == -1582154675)
            {
              if (*((_DWORD *)a1 + 39) == 1) {
                goto LABEL_13;
              }
              goto LABEL_46;
            }
LABEL_47:
            snprintf((char *)a1 + 208, 0x100uLL, "%s: not a pcap file");
            goto LABEL_50;
          }
LABEL_40:
          snprintf((char *)a1 + 208, 0x100uLL, "%s: not a pcap file to which we can append");
          goto LABEL_50;
        }
        if (LODWORD(__ptr[0]) == -1582119980)
        {
          if (!*((_DWORD *)a1 + 39))
          {
LABEL_13:
            if (WORD2(__ptr[0]) != 2 || HIWORD(__ptr[0]) != 4)
            {
              snprintf((char *)a1 + 208, 0x100uLL, "%s: version is %u.%u, cannot append to file");
              goto LABEL_50;
            }
            if (v5 != HIDWORD(v21))
            {
              snprintf((char *)a1 + 208, 0x100uLL, "%s: different linktype, cannot append to file");
              goto LABEL_50;
            }
            if (*((_DWORD *)a1 + 24) == v21)
            {
LABEL_43:
              if (fseek(v7, 0, 2) == -1)
              {
                int v18 = *__error();
                pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x100uLL, v18, "Can't seek to the end of %s");
                goto LABEL_50;
              }
              return v8;
            }
            snprintf((char *)a1 + 208, 0x100uLL, "%s: different snaplen, cannot append to file");
LABEL_50:
            pcap_dump_close(v8);
            return 0;
          }
LABEL_46:
          snprintf((char *)a1 + 208, 0x100uLL, "%s: different time stamp precision, cannot append to file");
          goto LABEL_50;
        }
        int v16 = -1582117580;
LABEL_35:
        if (LODWORD(__ptr[0]) != v16) {
          goto LABEL_47;
        }
        goto LABEL_40;
      }
      if (SLODWORD(__ptr[0]) > 1295788960)
      {
        if (LODWORD(__ptr[0]) == 1295788961) {
          goto LABEL_40;
        }
        if (LODWORD(__ptr[0]) != 1295823521) {
          goto LABEL_47;
        }
      }
      else if (LODWORD(__ptr[0]) != -725372255)
      {
        int v16 = 885895841;
        goto LABEL_35;
      }
      snprintf((char *)a1 + 208, 0x100uLL, "%s: different byte order, cannot append to file");
      goto LABEL_50;
    }
    int v10 = __error();
    pcap_fmt_errmsg_for_errno((char *)a1 + 208, 0x100uLL, *v10, "%s", a2);
    return 0;
  }
  signed int v12 = (FILE *)*MEMORY[0x263EF8358];

  return (pcap_dumper_t *)pcap_setup_dump((uint64_t)a1, v4, v12, "standard output");
}

void pcap_dump_close(pcap_dumper_t *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)*((void *)a1 + 2);
    if (v2)
    {
      pcap_ng_free_block(v2);
      *((void *)a1 + 2) = 0;
    }
    pcap_if_info_set_clear((int *)a1 + 6);
    pcap_proc_info_set_clear((int *)a1 + 12);
    fclose(*(FILE **)a1);
    free(a1);
  }
}

uint64_t sf_write_header(uint64_t a1, FILE *__stream, int a3, int a4)
{
  if (*(_DWORD *)(a1 + 156) == 1) {
    int v4 = -1582154675;
  }
  else {
    int v4 = -1582119980;
  }
  __ptr[0] = v4;
  __ptr[1] = 262146;
  uint64_t v7 = 0;
  int v8 = a4;
  int v9 = a3;
  if (fwrite(__ptr, 0x18uLL, 1uLL, __stream) == 1) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

FILE *__cdecl pcap_dump_file(pcap_dumper_t *a1)
{
  return *(FILE **)a1;
}

uint64_t pcap_dump_ftell(pcap_dumper_t *a1)
{
  return ftello(*(FILE **)a1);
}

int64_t pcap_dump_ftell64(pcap_dumper_t *a1)
{
  return ftello(*(FILE **)a1);
}

int pcap_dump_flush(pcap_dumper_t *a1)
{
  if (fflush(*(FILE **)a1) == -1) {
    return -1;
  }
  else {
    return 0;
  }
}

uint64_t get_from_block_data(uint64_t *a1, unint64_t a2, char *__str)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = v3 - a2;
  if (v3 >= a2)
  {
    uint64_t v5 = *a1;
    *a1 += a2;
    a1[1] = v4;
  }
  else
  {
    snprintf(__str, 0x100uLL, "block of type %u in pcapng dump file is too short", *((_DWORD *)a1 + 4));
    return 0;
  }
  return v5;
}

uint64_t pcap_ng_check_header(_DWORD *a1, FILE *__stream, int a3, __n128 *a4, _DWORD *a5, int a6)
{
  off_t v12 = ftello(__stream);
  *a5 = 0;
  if (*a1 != 168627466) {
    return 0;
  }
  uint64_t v13 = v12;
  unsigned int __ptr = 0;
  if (fread(&__ptr, 1uLL, 4uLL, __stream) <= 3 || (int v40 = 0, fread(&v40, 1uLL, 4uLL, __stream) <= 3))
  {
    if (ferror(__stream))
    {
      size_t v14 = __error();
      pcap_fmt_errmsg_for_errno((char *)a4, 0x100uLL, *v14, "error reading dump file");
LABEL_6:
      uint64_t v15 = 0;
LABEL_7:
      *a5 = 1;
      return v15;
    }
    return 0;
  }
  if (v40 == 1295788826)
  {
    unsigned int v17 = bswap32(0x4D3C2B1Au);
    unsigned int v18 = bswap32(__ptr);
    int v16 = 1;
  }
  else
  {
    if (v40 != 439041101) {
      return 0;
    }
    int v16 = 0;
    unsigned int v17 = 439041101;
    unsigned int v18 = __ptr;
  }
  if (v18 - 1048577 <= 0xFFF0001A)
  {
    snprintf((char *)a4, 0x100uLL, "Section Header Block in pcapng dump file has invalid length %zu < _%u_ < %u (BT_SHB_INSANE_MAX)", 0x1CuLL, v18, 0x100000);
    goto LABEL_6;
  }
  unsigned int v36 = v17;
  unsigned int v20 = pcap_open_offline_common((char *)a4, 0x4B0uLL, 1168);
  uint64_t v15 = (uint64_t)v20;
  if (!v20) {
    goto LABEL_7;
  }
  v20[14] = v16;
  uint64_t v21 = (uint64_t *)*((void *)v20 + 6);
  if (a3)
  {
    if (a3 != 1)
    {
      snprintf((char *)a4, 0x100uLL, "unknown time stamp resolution %u", a3);
LABEL_42:
      free((void *)v15);
      goto LABEL_6;
    }
    uint64_t v22 = 1000000000;
  }
  else
  {
    uint64_t v22 = 1000000;
  }
  *uint64_t v21 = v22;
  v20[39] = a3;
  if (v18 <= 0x800) {
    size_t v23 = 2048;
  }
  else {
    size_t v23 = v18;
  }
  *(_DWORD *)(v15 + 20) = v23;
  uint64_t v24 = malloc_type_malloc(v23, 0xD4267BDBuLL);
  *(void *)(v15 + 24) = v24;
  if (!v24)
  {
    strcpy((char *)a4, "out of memory");
    goto LABEL_42;
  }
  int v25 = v21;
  unint64_t v26 = v24;
  unsigned int v35 = v25;
  *((_DWORD *)v25 + 2) = 0x1000000;
  *uint64_t v24 = 168627466;
  v24[1] = v18;
  v24[2] = v36;
  size_t v27 = (unsigned __int16 *)(v24 + 3);
  if (read_bytes(__stream, v24 + 3, v18 - 12, 1, (char *)a4) != -1)
  {
    unsigned int v28 = *v27;
    if (*(_DWORD *)(v15 + 56))
    {
      unsigned int v28 = __rev16(v28);
      *((_WORD *)v26 + 6) = v28;
      *((_WORD *)v26 + 7) = bswap32(*((unsigned __int16 *)v26 + 7)) >> 16;
    }
    int v29 = *((unsigned __int16 *)v26 + 7);
    if (v28 == 1 && (v29 | 2) == 2)
    {
      *(void *)uint64_t v37 = 0;
      unint64_t v38 = 0;
      uint64_t v39 = 0;
      *(_DWORD *)(v15 + 88) = 1;
      *(_DWORD *)(v15 + 92) = v29;
      *(_DWORD *)(v15 + 156) = a3;
      while (1)
      {
        blocuint64_t k = read_block(__stream, v15, (uint64_t)v37, (char *)a4);
        if (block == -1) {
          break;
        }
        if (!block)
        {
          strcpy((char *)a4, "the capture file has no Interface Description Blocks");
          break;
        }
        if ((v39 - 2) < 2 || v39 == 6)
        {
          strcpy((char *)a4, "the capture file has a packet block before any Interface Description Blocks");
          break;
        }
        if (v39 == 1)
        {
          if (v38 <= 7)
          {
            snprintf((char *)a4, 0x100uLL, "block of type %u in pcapng dump file is too short");
            break;
          }
          int v32 = *(unsigned __int16 **)v37;
          *(void *)v37 += 8;
          v38 -= 8;
          if (!v32) {
            break;
          }
          if (*(_DWORD *)(v15 + 56))
          {
            unsigned __int16 *v32 = bswap32(*v32) >> 16;
            *((_DWORD *)v32 + 1) = bswap32(*((_DWORD *)v32 + 1));
          }
          add_interface(v15, (uint64_t)v32, (uint64_t *)v37, a4);
          if (!v33) {
            break;
          }
          int v34 = linktype_to_dlt(*v32);
          *(_DWORD *)(v15 + 100) = v34;
          *(_DWORD *)(v15 + 96) = pcap_adjust_snapshot(v34, *((unsigned int *)v32 + 1));
          *(_DWORD *)(v15 + 104) = 0;
          if ((unint64_t)max_snaplen_for_dlt(*(_DWORD *)(v15 + 100)) + 131104 > *((unsigned int *)v35 + 2)) {
            *((_DWORD *)v35 + 2) = max_snaplen_for_dlt(*(_DWORD *)(v15 + 100)) + 131104;
          }
          *(void *)(v15 + 8) = pcap_ng_next_packet;
          *(void *)(v15 + 888) = pcap_ng_cleanup;
          if (a6)
          {
            *(void *)(v15 + 8) = pcap_ng_next_block;
            if (v13 <= 3)
            {
              strcpy((char *)a4, "bad file offset");
              break;
            }
            fseek(__stream, v13 - 4, 0);
            *(_DWORD *)(v15 + 100) = 151;
          }
          return v15;
        }
      }
    }
    else
    {
      snprintf((char *)a4, 0x100uLL, "unsupported pcapng savefile version %u.%u");
    }
  }
  free((void *)v35[3]);
  free(*(void **)(v15 + 24));
  free((void *)v15);
  uint64_t v15 = 0;
  *a5 = 1;
  return v15;
}

uint64_t read_bytes(FILE *__stream, void *__ptr, size_t a3, int a4, char *a5)
{
  uint64_t v9 = 1;
  size_t v10 = fread(__ptr, 1uLL, a3, __stream);
  if (v10 != a3)
  {
    size_t v11 = v10;
    if (ferror(__stream))
    {
      off_t v12 = __error();
      pcap_fmt_errmsg_for_errno(a5, 0x100uLL, *v12, "error reading dump file");
      return 0xFFFFFFFFLL;
    }
    if (a4 || v11)
    {
      snprintf(a5, 0x100uLL, "truncated pcapng dump file; tried to read %zu bytes, only got %zu", a3, v11);
      return 0xFFFFFFFFLL;
    }
    return 0;
  }
  return v9;
}

uint64_t read_block(FILE *a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t __ptr = 0;
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t result = read_bytes(a1, &__ptr, 8uLL, 0, a4);
  if ((int)result >= 1)
  {
    if (*(_DWORD *)(a2 + 56))
    {
      unsigned int v10 = bswap32(HIDWORD(__ptr));
      unint64_t __ptr = __PAIR64__(v10, bswap32(__ptr));
    }
    else
    {
      unsigned int v10 = HIDWORD(__ptr);
    }
    uint64_t v11 = v10;
    if (v10 <= 0xB)
    {
      snprintf(a4, 0x100uLL, "block in pcapng dump file has a length of %u < %zu");
      return 0xFFFFFFFFLL;
    }
    if ((v10 & 3) != 0)
    {
      snprintf(a4, 0x100uLL, "block in pcapng dump file has a length of %u that is not a multiple of 4");
      return 0xFFFFFFFFLL;
    }
    if (*(_DWORD *)(a2 + 20) >= v10)
    {
      off_t v12 = *(void **)(a2 + 24);
    }
    else
    {
      if (v10 > *(_DWORD *)(v8 + 8))
      {
        snprintf(a4, 0x100uLL, "pcapng block size %u > maximum %u");
        return 0xFFFFFFFFLL;
      }
      off_t v12 = malloc_type_realloc(*(void **)(a2 + 24), v10, 0x409BDDAEuLL);
      if (!v12)
      {
        strcpy(a4, "out of memory");
        return 0xFFFFFFFFLL;
      }
      *(void *)(a2 + 24) = v12;
    }
    *off_t v12 = __ptr;
    uint64_t v13 = *(void *)(a2 + 24);
    uint64_t result = read_bytes(a1, (void *)(v13 + 8), v11 - 8, 1, a4);
    if (result != -1)
    {
      unsigned int v14 = *(_DWORD *)(v13 + v11 - 4);
      if (*(_DWORD *)(a2 + 56))
      {
        unsigned int v14 = bswap32(v14);
        *(_DWORD *)(v13 + v11 - 4) = v14;
      }
      if (v11 == v14)
      {
        *(void *)a3 = v13 + 8;
        *(void *)(a3 + 8) = v11 - 12;
        *(_DWORD *)(a3 + 16) = __ptr;
        return 1;
      }
      strcpy(a4, "block total length in header and trailer don't match");
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

__n128 add_interface(uint64_t a1, uint64_t a2, uint64_t *a3, __n128 *__str)
{
  uint64_t v8 = *(unint64_t **)(a1 + 48);
  unsigned int v9 = *((_DWORD *)v8 + 3);
  unsigned int v10 = *((_DWORD *)v8 + 4);
  *((_DWORD *)v8 + 3) = v9 + 1;
  if (v9 + 1 <= v10)
  {
    uint64_t v13 = (_DWORD *)v8[3];
  }
  else
  {
    if (v10)
    {
      if ((v10 & 0x80000000) != 0 || (int v11 = 2 * v10, v12 = 80 * v10, v12 < 2 * v10))
      {
        snprintf((char *)__str, 0x100uLL, "more than %u interfaces in the file");
        return result;
      }
      uint64_t v13 = malloc_type_realloc((void *)v8[3], v12, 0x10000401089DE20uLL);
      if (!v13) {
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v13 = malloc_type_malloc(0x28uLL, 0x10000401089DE20uLL);
      int v11 = 1;
      if (!v13)
      {
LABEL_45:
        snprintf((char *)__str, 0x100uLL, "out of memory for per-interface information (%u interfaces)");
        return result;
      }
    }
    *((_DWORD *)v8 + 4) = v11;
    v8[3] = (unint64_t)v13;
    unsigned int v9 = *((_DWORD *)v8 + 3) - 1;
  }
  unint64_t v15 = 1000000;
  v13[10 * v9] = *(_DWORD *)(a2 + 4);
  if (a3[1])
  {
    unint64_t v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 0;
    while (1)
    {
      opthdr_from_block_data = get_opthdr_from_block_data(a1, a3, (char *)__str);
      if (!opthdr_from_block_data) {
        return result;
      }
      uint64_t v21 = opthdr_from_block_data;
      uint64_t v22 = (unint64_t *)get_from_block_data(a3, (opthdr_from_block_data[1] + 3) & 0x1FFFC, (char *)__str);
      if (!v22) {
        return result;
      }
      int v23 = *v21;
      if (v23 == 9)
      {
        if (v21[1] != 1)
        {
          snprintf((char *)__str, 0x100uLL, "Interface Description Block has if_tsresol option with length %u != 1");
          return result;
        }
        if (v19)
        {
          int v34 = "Interface Description Block has more than one if_tsresol option";
          goto LABEL_57;
        }
        int v24 = *(char *)v22;
        if (v24 < 0)
        {
          unsigned int v27 = v24 & 0x7F;
          if (v27 > 0x3F)
          {
            snprintf((char *)__str, 0x100uLL, "Interface Description Block if_tsresol option resolution 2^-%u is too high");
            return result;
          }
          int v17 = 1;
          unint64_t v15 = 1 << v27;
        }
        else
        {
          unsigned int v25 = *(unsigned __int8 *)v22;
          if (v25 >= 0x14)
          {
            snprintf((char *)__str, 0x100uLL, "Interface Description Block if_tsresol option resolution 10^-%u is too high");
            return result;
          }
          if (*(unsigned char *)v22)
          {
            unint64_t v15 = 1;
            do
            {
              v15 *= 10;
              --v25;
            }
            while (v25);
            int v17 = 0;
          }
          else
          {
            int v17 = 0;
            unint64_t v15 = 1;
          }
        }
        int v19 = 1;
      }
      else if (v23 == 14)
      {
        if (v21[1] != 8)
        {
          snprintf((char *)__str, 0x100uLL, "Interface Description Block has if_tsoffset option with length %u != 8");
          return result;
        }
        if (v18)
        {
          __str[4].n128_u8[0] = 0;
          int v34 = "Interface Description Block has more than one if_tsoffset option";
LABEL_57:
          __n128 v36 = *((__n128 *)v34 + 1);
          *__str = *(__n128 *)v34;
          __str[1] = v36;
          __n128 result = *((__n128 *)v34 + 2);
          __n128 v37 = *((__n128 *)v34 + 3);
          __str[2] = result;
          __str[3] = v37;
          return result;
        }
        unint64_t v26 = bswap64(*v22);
        if (*(_DWORD *)(a1 + 56)) {
          unint64_t v16 = v26;
        }
        else {
          unint64_t v16 = *v22;
        }
        int v18 = 1;
      }
      else if (!*v21)
      {
        if (!v21[1]) {
          goto LABEL_38;
        }
        snprintf((char *)__str, 0x100uLL, "Interface Description Block has opt_endofopt option with length %u != 0");
        return result;
      }
      if (!a3[1]) {
        goto LABEL_38;
      }
    }
  }
  unint64_t v16 = 0;
  int v17 = 0;
LABEL_38:
  unint64_t v28 = v8[3];
  unsigned int v29 = *((_DWORD *)v8 + 3) - 1;
  unint64_t v30 = v28 + 40 * v29;
  *(void *)(v30 + 8) = v15;
  *(void *)(v30 + 32) = v16;
  unint64_t v31 = *v8;
  if (v15 == *v8)
  {
    *(_DWORD *)(v28 + 40 * v29 + 16) = 0;
    return result;
  }
  if (v15 <= *v8)
  {
    if (!v17)
    {
      unint64_t v35 = v28 + 40 * v29;
      *(void *)(v35 + 24) = v31 / v15;
      *(_DWORD *)(v35 + 16) = 1;
      return result;
    }
    unint64_t v32 = v28 + 40 * v29;
    int v33 = 3;
  }
  else
  {
    unint64_t v32 = v28 + 40 * v29;
    if (v17)
    {
      int v33 = 4;
    }
    else
    {
      *(void *)(v32 + 24) = v15 / v31;
      int v33 = 2;
    }
  }
  *(_DWORD *)(v32 + 16) = v33;
  return result;
}

uint64_t pcap_ng_next_packet(__n128 *a1, uint64_t a2, uint64_t *a3)
{
  return pcap_ng_next_internal(a1, a2, a3, 1);
}

void pcap_ng_cleanup(uint64_t a1)
{
  free(*(void **)(*(void *)(a1 + 48) + 24));

  sf_cleanup(a1);
}

uint64_t pcap_ng_next_block(__n128 *a1, uint64_t a2, uint64_t *a3)
{
  return pcap_ng_next_internal(a1, a2, a3, 0);
}

void *pcap_ng_dump_open(uint64_t a1, char *__filename)
{
  uint64_t v2 = __filename;
  if (!*(_DWORD *)(a1 + 112))
  {
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: not-yet-activated pcap_t passed to pcap_ng_dump_open");
    return 0;
  }
  if (*__filename != 45 || __filename[1])
  {
    unint64_t v4 = fopen(__filename, "wb");
    if (v4)
    {
      uint64_t v5 = v4;
      goto LABEL_10;
    }
    int v6 = __error();
    pcap_strerror(*v6);
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: %s");
    return 0;
  }
  uint64_t v5 = (FILE *)*MEMORY[0x263EF8358];
  uint64_t v2 = "standard output";
LABEL_10:
  pcap_ng_init_section_info((_DWORD *)a1);
  uint64_t v8 = *(unsigned int *)(a1 + 100);
  if ((v8 | 2) == 0x97)
  {
    return pcap_alloc_dumper(a1, (uint64_t)v5);
  }
  if (dlt_to_linktype(v8) == -1)
  {
    snprintf((char *)(a1 + 208), 0x100uLL, "%s: link-layer type %d isn't supported in savefiles", v2, *(_DWORD *)(a1 + 100));
    if (v5 != (FILE *)*MEMORY[0x263EF8358]) {
      fclose(v5);
    }
    return 0;
  }

  return pcap_ng_setup_dump(a1, (uint64_t)v5);
}

void *pcap_ng_setup_dump(uint64_t a1, uint64_t a2)
{
  __n128 result = pcap_alloc_dumper(a1, a2);
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    if (pcap_ng_dump_shb(a1, (uint64_t)result))
    {
      __n128 result = pcap_if_info_set_add((int *)(v4 + 24), *(char **)(a1 + 120), 0xFFFFFFFF, *(_DWORD *)(a1 + 100), *(_DWORD *)(a1 + 96), *(const char **)(a1 + 1096), (char *)(a1 + 208));
      if (result)
      {
        if (pcap_ng_dump_if_info(a1, v4, *(void *)(v4 + 16), (uint64_t)result)) {
          return (void *)v4;
        }
        else {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *pcap_ng_dump_fopen(uint64_t a1, uint64_t a2)
{
  if (dlt_to_linktype(*(unsigned int *)(a1 + 100)) == -1)
  {
    snprintf((char *)(a1 + 208), 0x100uLL, "stream: link-layer type %d isn't supported in savefiles", *(_DWORD *)(a1 + 100));
    return 0;
  }
  else
  {
    return pcap_ng_setup_dump(a1, a2);
  }
}

ssize_t pcap_ng_dump(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ssize_t result = pcap_ng_block_reset(*(void *)(a1 + 16), 6);
  if (!result)
  {
    uint64_t enhanced_packet_fields = pcap_ng_get_enhanced_packet_fields(*(void *)(a1 + 16));
    *(_DWORD *)uint64_t enhanced_packet_fields = 0;
    uint64_t v8 = *(void *)(a2 + 16);
    *(void *)(enhanced_packet_fields + 12) = v8;
    *(void *)(enhanced_packet_fields + 4) = __ROR8__(*(int *)(a2 + 8) + 1000000 * *(void *)a2, 32);
    pcap_ng_block_packet_set_data(*(void *)(a1 + 16), a3, v8);
    int v10 = *(unsigned __int8 *)(a2 + 24);
    unsigned int v9 = (char *)(a2 + 24);
    if (v10) {
      pcap_ng_block_add_option_with_string(*(void *)(a1 + 16), 1, v9);
    }
    uint64_t v11 = *(void *)(a1 + 16);
    return pcap_ng_dump_block(a1, v11);
  }
  return result;
}

unsigned __int16 *get_opthdr_from_block_data(uint64_t a1, uint64_t *a2, char *a3)
{
  ssize_t result = (unsigned __int16 *)get_from_block_data(a2, 4uLL, a3);
  if (result)
  {
    if (*(_DWORD *)(a1 + 56))
    {
      *ssize_t result = bswap32(*result) >> 16;
      result[1] = bswap32(result[1]) >> 16;
    }
  }
  return result;
}

uint64_t pcap_ng_next_internal(__n128 *a1, uint64_t a2, uint64_t *a3, int a4)
{
  unint64_t v5 = a1[3].n128_u64[0];
  if (!*(void *)v5)
  {
    strcpy((char *)&a1[13], "internal error, check_header did not set user_tsresol");
    return 0xFFFFFFFFLL;
  }
  *(void *)unsigned int v52 = 0;
  uint64_t v8 = (FILE *)a1[4].n128_u64[0];
  unint64_t v53 = 0;
  uint64_t v54 = 0;
  unsigned int v9 = a1 + 13;
  while (2)
  {
    uint64_t result = read_block(v8, (uint64_t)a1, (uint64_t)v52, (char *)&a1[13]);
    if (result == -1) {
      return result;
    }
    if (!result) {
      return 1;
    }
    int v11 = v54;
    switch((int)v54)
    {
      case 1:
        if (v53 <= 7) {
          goto LABEL_40;
        }
        size_t v12 = *(unsigned int **)v52;
        *(void *)v52 += 8;
        v53 -= 8;
        if (!v12) {
          return 0xFFFFFFFFLL;
        }
        if (a1[3].n128_u32[2])
        {
          *(_WORD *)size_t v12 = bswap32(*(unsigned __int16 *)v12) >> 16;
          v12[1] = bswap32(v12[1]);
        }
        if (a4)
        {
          int v13 = a1[6].n128_i32[1];
          if (v13 != *(unsigned __int16 *)v12)
          {
            snprintf((char *)&a1[13], 0x100uLL, "an interface has a type %u different from the type of the first interface");
            return 0xFFFFFFFFLL;
          }
          unsigned __int32 v14 = a1[6].n128_u32[0];
          if (v14 != pcap_adjust_snapshot(v13, v12[1]))
          {
            snprintf((char *)&a1[13], 0x100uLL, "an interface has a snapshot length %u different from the snapshot length of the first interface");
            return 0xFFFFFFFFLL;
          }
        }
        add_interface((uint64_t)a1, (uint64_t)v12, (uint64_t *)v52, a1 + 13);
        if (v15 && a4) {
          continue;
        }
        if (v15) {
          return 0;
        }
        else {
          return 0xFFFFFFFFLL;
        }
      case 2:
        if (v53 <= 0x13) {
          goto LABEL_40;
        }
        int v18 = *(unsigned int **)v52;
        uint64_t v19 = *(void *)v52 + 20;
        *(void *)v52 += 20;
        if (!v18) {
          return 0xFFFFFFFFLL;
        }
        unint64_t v20 = v53 - 20;
        unsigned int v21 = *(unsigned __int16 *)v18;
        if (!a1[3].n128_u32[2]) {
          goto LABEL_60;
        }
        unsigned int v21 = __rev16(v21);
        goto LABEL_59;
      case 3:
        if (v53 <= 3) {
          goto LABEL_40;
        }
        if (!*(void *)v52) {
          return 0xFFFFFFFFLL;
        }
        unsigned int v21 = 0;
        unint64_t v22 = 0;
        unint64_t v20 = v53 - 4;
        uint64_t v19 = *(void *)v52 + 4;
        unsigned int v23 = **(_DWORD **)v52;
        unsigned int v24 = bswap32(**(_DWORD **)v52);
        if (a1[3].n128_u32[2]) {
          unsigned int v23 = v24;
        }
        *(_DWORD *)(a2 + 20) = v23;
        if (v23 >= a1[6].n128_u32[0]) {
          unsigned int v23 = a1[6].n128_u32[0];
        }
        *(_DWORD *)(a2 + 16) = v23;
        goto LABEL_62;
      case 4:
      case 5:
        goto LABEL_24;
      case 6:
        if (v53 <= 0x13) {
          goto LABEL_40;
        }
        int v18 = *(unsigned int **)v52;
        if (!*(void *)v52) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v19 = *(void *)v52 + 20;
        unint64_t v20 = v53 - 20;
        unsigned int v21 = **(_DWORD **)v52;
        if (a1[3].n128_u32[2])
        {
          unsigned int v21 = bswap32(v21);
LABEL_59:
          int8x8_t v25 = vrev32_s8(*(int8x8_t *)(v18 + 3));
          *(int8x8_t *)(a2 + 16) = v25;
          unint64_t v22 = bswap64(*(void *)(v18 + 1));
        }
        else
        {
LABEL_60:
          int8x8_t v25 = *(int8x8_t *)(v18 + 3);
          *(int8x8_t *)(a2 + 16) = v25;
          unint64_t v22 = v18[2] | ((unint64_t)v18[1] << 32);
        }
        unsigned int v23 = v25.i32[0];
LABEL_62:
        if (v21 >= *(_DWORD *)(v5 + 12))
        {
          snprintf((char *)&a1[13], 0x100uLL, "a packet arrived on interface %u, but there's no Interface Description Block for that interface");
          return 0xFFFFFFFFLL;
        }
        uint64_t v26 = *(void *)(v5 + 24);
        if (v23 > *(_DWORD *)(v26 + 40 * v21))
        {
          snprintf((char *)&a1[13], 0x100uLL, "invalid packet capture length %u, bigger than snaplen of %d");
          return 0xFFFFFFFFLL;
        }
        unsigned int v27 = v21;
        uint64_t v28 = v26 + 40 * v21;
        unint64_t v29 = *(void *)(v28 + 8);
        unint64_t v30 = *(void *)(v28 + 32) + v22 / v29;
        unint64_t v31 = v22 % v29;
        switch(*(_DWORD *)(v28 + 16))
        {
          case 1:
            v31 *= *(void *)(v26 + 40 * v27 + 24);
            break;
          case 2:
            v31 /= *(void *)(v26 + 40 * v27 + 24);
            break;
          case 3:
          case 4:
            unint64_t v31 = *(void *)v5 * v31 / v29;
            break;
          default:
            break;
        }
        *(void *)a2 = v30;
        *(_DWORD *)(a2 + 8) = v31;
        if (v20 < v23)
        {
          snprintf((char *)&a1[13], 0x100uLL, "block of type %u in pcapng dump file is too short", v11);
          *a3 = 0;
          return 0xFFFFFFFFLL;
        }
        uint64_t v32 = v19 + v23;
        unint64_t v33 = v20 - v23;
        *(void *)unsigned int v52 = v32;
        unint64_t v53 = v33;
        *a3 = v19;
        if ((v23 & 3) == 0) {
          goto LABEL_76;
        }
        unint64_t v34 = 4 - (v23 & 3);
        BOOL v35 = v33 >= v34;
        unint64_t v36 = v33 - v34;
        if (!v35) {
          goto LABEL_40;
        }
        *(void *)unsigned int v52 = v32 + v34;
        unint64_t v53 = v36;
LABEL_76:
        *(_OWORD *)(a2 + 24) = 0u;
        *(_OWORD *)(a2 + 248) = 0u;
        *(_OWORD *)(a2 + 264) = 0u;
        *(_OWORD *)(a2 + 216) = 0u;
        *(_OWORD *)(a2 + 232) = 0u;
        *(_OWORD *)(a2 + 184) = 0u;
        *(_OWORD *)(a2 + 200) = 0u;
        *(_OWORD *)(a2 + 152) = 0u;
        *(_OWORD *)(a2 + 168) = 0u;
        *(_OWORD *)(a2 + 120) = 0u;
        *(_OWORD *)(a2 + 136) = 0u;
        *(_OWORD *)(a2 + 88) = 0u;
        *(_OWORD *)(a2 + 104) = 0u;
        *(_OWORD *)(a2 + 56) = 0u;
        *(_OWORD *)(a2 + 72) = 0u;
        *(_OWORD *)(a2 + 40) = 0u;
        opthdr_from_block_data = get_opthdr_from_block_data((uint64_t)a1, (uint64_t *)v52, (char *)&a1[13]);
        if (!opthdr_from_block_data || *opthdr_from_block_data != 1 || !opthdr_from_block_data[1]) {
          goto LABEL_82;
        }
        if (v53 < ((opthdr_from_block_data[1] + 3) & 0x1FFFCu))
        {
LABEL_40:
          snprintf((char *)&a1[13], 0x100uLL, "block of type %u in pcapng dump file is too short");
          return 0xFFFFFFFFLL;
        }
        unint64_t v38 = *(unsigned int **)v52;
        if (!*(void *)v52) {
          return 0xFFFFFFFFLL;
        }
        long long v39 = **(_OWORD **)v52;
        long long v40 = *(_OWORD *)(*(void *)v52 + 16);
        long long v41 = *(_OWORD *)(*(void *)v52 + 48);
        *(_OWORD *)(a2 + 56) = *(_OWORD *)(*(void *)v52 + 32);
        *(_OWORD *)(a2 + 72) = v41;
        *(_OWORD *)(a2 + 24) = v39;
        *(_OWORD *)(a2 + 40) = v40;
        long long v42 = *((_OWORD *)v38 + 4);
        long long v43 = *((_OWORD *)v38 + 5);
        long long v44 = *((_OWORD *)v38 + 7);
        *(_OWORD *)(a2 + 120) = *((_OWORD *)v38 + 6);
        *(_OWORD *)(a2 + 136) = v44;
        *(_OWORD *)(a2 + 88) = v42;
        *(_OWORD *)(a2 + 104) = v43;
        long long v45 = *((_OWORD *)v38 + 8);
        long long v46 = *((_OWORD *)v38 + 9);
        long long v47 = *((_OWORD *)v38 + 11);
        *(_OWORD *)(a2 + 184) = *((_OWORD *)v38 + 10);
        *(_OWORD *)(a2 + 200) = v47;
        *(_OWORD *)(a2 + 152) = v45;
        *(_OWORD *)(a2 + 168) = v46;
        long long v48 = *((_OWORD *)v38 + 12);
        long long v49 = *((_OWORD *)v38 + 13);
        long long v50 = *((_OWORD *)v38 + 15);
        *(_OWORD *)(a2 + 248) = *((_OWORD *)v38 + 14);
        *(_OWORD *)(a2 + 264) = v50;
        *(_OWORD *)(a2 + 216) = v48;
        *(_OWORD *)(a2 + 232) = v49;
LABEL_82:
        if (a1[3].n128_u32[2]) {
          swap_pseudo_headers(a1[6].n128_u32[1], a2, *a3);
        }
        return 0;
      default:
        if (v54 != 168627466) {
          goto LABEL_24;
        }
        if (v53 <= 0xF) {
          goto LABEL_40;
        }
        unint64_t v16 = *(unsigned int **)v52;
        *(void *)v52 += 16;
        v53 -= 16;
        if (!v16) {
          return 0xFFFFFFFFLL;
        }
        unsigned int v17 = *v16;
        if (a1[3].n128_u32[2])
        {
          unsigned int v17 = bswap32(v17);
          *unint64_t v16 = v17;
          *((_WORD *)v16 + 2) = bswap32(*((unsigned __int16 *)v16 + 2)) >> 16;
        }
        if (v17 == 439041101)
        {
          if (*((_WORD *)v16 + 2) != 1)
          {
            snprintf((char *)&a1[13], 0x100uLL, "unknown pcapng savefile major version number %u");
            return 0xFFFFFFFFLL;
          }
          *(_DWORD *)(v5 + 12) = 0;
LABEL_24:
          if (!a4) {
            return 0;
          }
          continue;
        }
        if (v17 == 1295788826)
        {
          *unsigned int v9 = *(__n128 *)"the file has sections with different byte orders";
          strcpy((char *)&a1[14], "tions with different byte orders");
        }
        else
        {
          *unsigned int v9 = *(__n128 *)"the file has a section with a bad byte order magic field";
          strcpy((char *)&a1[14], "ection with a bad byte order magic field");
        }
        return 0xFFFFFFFFLL;
    }
  }
}

uint64_t pcap_parse()
{
  uint64_t v111 = MEMORY[0x270FA5388]();
  *(void *)int v112 = v0;
  int v1 = 0;
  v118[50] = *MEMORY[0x263EF8340];
  uint64_t v2 = v117;
  uint64_t v3 = 200;
  long long v115 = 0uLL;
  uint64_t v116 = 0;
  int __src = v117;
  uint64_t v4 = (char *)v118;
  unint64_t v5 = (char *)v118;
  int v114 = -2;
  while (1)
  {
    *(_WORD *)uint64_t v4 = v1;
    if (&v5[2 * v3 - 2] <= v4)
    {
      if ((unint64_t)v3 >> 4 > 0x270
        || ((unint64_t)(2 * v3) >= 0x2710 ? (uint64_t v3 = 10000) : (v3 *= 2),
            (int v6 = (char *)malloc_type_malloc(26 * v3 + 23, 0xBB16C4C0uLL)) == 0))
      {
        bpf_set_error(*(uint64_t *)v112, "can't parse filter expression: %s", "memory exhausted");
        uint64_t v50 = 2;
        goto LABEL_299;
      }
      uint64_t v7 = v6;
      uint64_t v8 = (v4 - v5) >> 1;
      uint64_t v9 = v8 + 1;
      memcpy(v6, v5, 2 * (v8 + 1));
      memcpy(&v7[24 * ((unsigned __int16)(2 * v3 + 23) / 0x18u)], __src, 24 * (v8 + 1));
      if (v5 != (char *)v118) {
        free(v5);
      }
      if (v3 <= v9)
      {
        uint64_t v50 = 1;
        unint64_t v5 = v7;
        goto LABEL_299;
      }
      uint64_t v4 = &v7[2 * v8];
      uint64_t v2 = &v7[24 * ((unsigned __int16)(2 * v3 + 23) / 0x18u) - 24 + 24 * v9];
      int __src = &v7[24 * ((unsigned __int16)(2 * v3 + 23) / 0x18u)];
      unint64_t v5 = v7;
    }
    int v10 = yypact[v1];
    if (v10 != -217)
    {
      int v11 = v114;
      if (v114 == -2) {
        int v11 = pcap_lex((uint64_t)&v115, v111);
      }
      if (v11 < 1)
      {
        int v12 = 0;
        int v114 = 0;
      }
      else
      {
        int v114 = v11;
        int v12 = v11 > 0x17A ? 2 : yytranslate[v11];
      }
      uint64_t v13 = (v12 + v10);
      if (v13 <= 0x320 && v12 == (__int16)yycheck[v13]) {
        break;
      }
    }
    unsigned int v15 = yydefact[v1];
    if (!v15) {
      goto LABEL_296;
    }
LABEL_29:
    uint64_t v16 = yyr2[v15];
    unsigned int v17 = (unsigned __int8 *)&v2[-24 * v16];
    unint64_t v18 = *((void *)v17 + 3);
    int v19 = *((_DWORD *)v17 + 8);
    int v20 = *((_DWORD *)v17 + 9);
    size_t v21 = *((void *)v17 + 5);
    switch(v15)
    {
      case 2u:
        int v25 = *((_DWORD *)v17 + 8);
        int v26 = *((_DWORD *)v17 + 9);
        int v27 = finish_parse(*(uint64_t *)v112, *((void *)v2 + 2));
        int v20 = v26;
        int v19 = v25;
        if (v27 == -1) {
          goto LABEL_297;
        }
        break;
      case 4u:
        goto LABEL_109;
      case 6u:
      case 7u:
      case 0x1Bu:
        gen_and(*((void *)v2 - 4), *((void *)v2 + 2));
        goto LABEL_50;
      case 8u:
      case 9u:
      case 0x1Cu:
      case 0xC8u:
      case 0xDDu:
        gen_or(*((void *)v2 - 4), *((void *)v2 + 2));
        goto LABEL_50;
      case 0xAu:
      case 0xBu:
      case 0xEu:
      case 0x18u:
      case 0x19u:
        unint64_t v18 = *((void *)v2 - 3);
        int v19 = *((_DWORD *)v2 - 4);
        int v20 = *((_DWORD *)v2 - 3);
        size_t v21 = *((void *)v2 - 1);
        break;
      case 0xDu:
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v28 = *(int **)v112;
        unsigned int v29 = *(_DWORD *)v2;
        uint64_t v30 = *((unsigned int *)v2 - 6);
        int v31 = *((_DWORD *)v2 - 6);
        uint64_t v32 = 0;
        unint64_t v108 = v108 & 0xFFFFFFFF00000000 | v30;
        goto LABEL_93;
      case 0xFu:
        unint64_t v33 = *(char **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v30 = *((unsigned int *)v2 - 6);
        int v34 = *((_DWORD *)v2 - 6);
        unint64_t v106 = v106 & 0xFFFFFFFF00000000 | v30;
        size_t v35 = gen_scode(*(uint64_t *)v112, v33, v34);
        if (!v35) {
          goto LABEL_297;
        }
        goto LABEL_94;
      case 0x10u:
        uint64_t v36 = *((void *)v2 - 6);
        if (!v36) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        __n128 v37 = *(int **)v112;
        unsigned int v38 = *(_DWORD *)v2;
        uint64_t v30 = *((unsigned int *)v2 - 18);
        int v39 = *((_DWORD *)v2 - 18);
        uint64_t v40 = 0;
        unint64_t v105 = v105 & 0xFFFFFFFF00000000 | v30;
        goto LABEL_75;
      case 0x11u:
        uint64_t v36 = *((void *)v2 - 6);
        if (!v36) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        __n128 v37 = *(int **)v112;
        uint64_t v40 = *(void *)v2;
        uint64_t v30 = *((unsigned int *)v2 - 18);
        int v39 = *((_DWORD *)v2 - 18);
        unsigned int v38 = 0;
        unint64_t v104 = v104 & 0xFFFFFFFF00000000 | v30;
LABEL_75:
        size_t v35 = gen_mcode(v37, v36, v40, v38, v39);
        if (!v35) {
          goto LABEL_297;
        }
        goto LABEL_94;
      case 0x12u:
        uint64_t v32 = *(const char **)v2;
        if (*(void *)v2)
        {
          uint64_t v30 = *((unsigned int *)v2 - 6);
          switch(*((_DWORD *)v2 - 6))
          {
            case 3u:
              bpf_set_error(*(uint64_t *)v112, "'port' modifier applied to ip host");
              goto LABEL_297;
            case 5u:
              bpf_set_error(*(uint64_t *)v112, "'proto' modifier applied to ip host");
              goto LABEL_297;
            case 6u:
              bpf_set_error(*(uint64_t *)v112, "'protochain' modifier applied to ip host");
              goto LABEL_297;
            case 7u:
              bpf_set_error(*(uint64_t *)v112, "'portrange' modifier applied to ip host");
              goto LABEL_297;
            default:
              int v109 = *((_DWORD *)v17 + 8);
              int v110 = v20;
              uint64_t v28 = *(int **)v112;
              int v31 = v30;
              unsigned int v29 = 0;
              unint64_t v99 = v99 & 0xFFFFFFFF00000000 | v30;
              goto LABEL_93;
          }
        }
        goto LABEL_297;
      case 0x13u:
        long long v41 = (const char *)*((void *)v2 - 6);
        if (!v41) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v42 = *(void *)v112;
        unsigned int v43 = *(_DWORD *)v2;
        uint64_t v30 = *((unsigned int *)v2 - 18);
        int v44 = *((_DWORD *)v2 - 18);
        unint64_t v103 = v103 & 0xFFFFFFFF00000000 | v30;
        goto LABEL_84;
      case 0x14u:
        long long v41 = *(const char **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v42 = *(void *)v112;
        uint64_t v30 = *((unsigned int *)v2 - 6);
        int v44 = *((_DWORD *)v2 - 6);
        unsigned int v43 = 128;
        unint64_t v102 = v102 & 0xFFFFFFFF00000000 | v30;
LABEL_84:
        size_t v35 = gen_mcode6(v42, v41, 0, v43, v44);
        if (!v35) {
          goto LABEL_297;
        }
        goto LABEL_94;
      case 0x15u:
        long long v45 = *(const char **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v30 = *((unsigned int *)v2 - 6);
        unint64_t v101 = v101 & 0xFFFFFFFF00000000 | v30;
        size_t v35 = gen_ecode(*(uint64_t *)v112, v45, v101);
        if (!v35) {
          goto LABEL_297;
        }
        goto LABEL_94;
      case 0x16u:
        long long v46 = *(const char **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v30 = *((unsigned int *)v2 - 6);
        unint64_t v100 = v100 & 0xFFFFFFFF00000000 | v30;
        size_t v35 = gen_acode(*(uint64_t *)v112, v46, *((_DWORD *)v2 - 6));
        if (!v35) {
          goto LABEL_297;
        }
        goto LABEL_94;
      case 0x17u:
      case 0x20u:
        gen_not(*((void *)v2 + 2));
        goto LABEL_50;
      case 0x1Du:
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v28 = *(int **)v112;
        unsigned int v29 = *(_DWORD *)v2;
        uint64_t v30 = *((unsigned int *)v2 - 6);
        int v31 = *((_DWORD *)v2 - 6);
        uint64_t v32 = 0;
        unint64_t v107 = v107 & 0xFFFFFFFF00000000 | v30;
LABEL_93:
        size_t v35 = gen_ncode(v28, v32, v29, v31);
        if (!v35) {
          goto LABEL_297;
        }
LABEL_94:
        size_t v21 = v35;
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | v30;
        goto LABEL_95;
      case 0x21u:
        unint64_t v23 = v18 & 0xFFFFFFFFFF000000 | (unsigned __int16)(*((_DWORD *)v2 - 12) << 8) | ((unint64_t)*((_DWORD *)v2 - 6) << 16);
        goto LABEL_97;
      case 0x22u:
        unint64_t v18 = v18 & 0xFFFFFFFFFF000000 | (unsigned __int16)(*((_DWORD *)v2 - 6) << 8) | ((unint64_t)*(_DWORD *)v2 << 16);
        break;
      case 0x23u:
      case 0x26u:
        unint64_t v23 = v18 & 0xFFFFFFFFFF000000 | ((unint64_t)*((_DWORD *)v2 - 6) << 8);
LABEL_97:
        uint64_t v24 = *v2;
        goto LABEL_239;
      case 0x24u:
        unint64_t v23 = v18 & 0xFFFFFFFFFF000000 | ((unint64_t)*((_DWORD *)v2 - 6) << 8);
        uint64_t v24 = 5;
        goto LABEL_239;
      case 0x25u:
        unint64_t v18 = v18 & 0xFFFFFFFFFF000000 | ((unint64_t)*((_DWORD *)v2 - 6) << 8) | 6;
        break;
      case 0x27u:
LABEL_50:
        unint64_t v18 = *(void *)v2;
        int v19 = *((_DWORD *)v2 + 2);
        int v20 = *((_DWORD *)v2 + 3);
        size_t v21 = *((void *)v2 + 2);
        break;
      case 0x28u:
        size_t v21 = *((void *)v2 - 1);
        uint64_t v24 = *((unsigned int *)v2 - 12);
        goto LABEL_238;
      case 0x29u:
        int v47 = *((_DWORD *)v17 + 9);
        int v48 = *((_DWORD *)v17 + 8);
        size_t v49 = gen_proto_abbrev(*(int **)v112, *(_DWORD *)v2);
        if (!v49) {
          goto LABEL_297;
        }
        goto LABEL_115;
      case 0x2Au:
        int v47 = *((_DWORD *)v17 + 9);
        int v48 = *((_DWORD *)v17 + 8);
        size_t v49 = gen_relation(*(int **)v112, *((_DWORD *)v2 - 6), *((void *)v2 - 6), *(void *)v2, 0);
        if (!v49) {
          goto LABEL_297;
        }
        goto LABEL_115;
      case 0x2Bu:
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v50 = 1;
        size_t v51 = gen_relation(*(int **)v112, *((_DWORD *)v2 - 6), *((void *)v2 - 6), *(void *)v2, 1);
        if (!v51) {
          goto LABEL_299;
        }
        size_t v21 = v51;
        v18 |= 0xFFFFFFFFuLL;
        goto LABEL_95;
      case 0x2Cu:
        size_t v21 = *(void *)v2;
        goto LABEL_109;
      case 0x2Du:
        int v47 = *((_DWORD *)v17 + 9);
        int v48 = *((_DWORD *)v17 + 8);
        gen_atmtype_abbrev(*(uint64_t *)v112, *(_DWORD *)v2);
        if (!v49) {
          goto LABEL_297;
        }
        goto LABEL_115;
      case 0x2Eu:
        int v47 = *((_DWORD *)v17 + 9);
        int v48 = *((_DWORD *)v17 + 8);
        size_t v49 = gen_atmmulti_abbrev(*(int **)v112, *(_DWORD *)v2);
        if (!v49) {
          goto LABEL_297;
        }
        goto LABEL_115;
      case 0x2Fu:
      case 0x31u:
        size_t v21 = *((void *)v2 + 2);
        goto LABEL_109;
      case 0x30u:
        int v47 = *((_DWORD *)v17 + 9);
        int v48 = *((_DWORD *)v17 + 8);
        size_t v49 = gen_mtp2type_abbrev(*(int **)v112, *(_DWORD *)v2);
        if (!v49) {
          goto LABEL_297;
        }
LABEL_115:
        size_t v21 = v49;
        v18 |= 0xFFFFFFFFuLL;
        goto LABEL_116;
      case 0x33u:
        v18 &= 0xFFFFFFFF00000000;
        break;
      case 0x34u:
      case 0x40u:
      case 0x45u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 1;
        break;
      case 0x35u:
      case 0x41u:
      case 0x46u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 2;
        break;
      case 0x36u:
      case 0x37u:
      case 0x42u:
      case 0x47u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 3;
        break;
      case 0x38u:
      case 0x39u:
      case 0x44u:
      case 0x48u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 4;
        break;
      case 0x3Au:
      case 0x49u:
        unsigned int v22 = 5;
        goto LABEL_242;
      case 0x3Bu:
      case 0x4Au:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 6;
        break;
      case 0x3Cu:
      case 0x43u:
      case 0x4Bu:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 7;
        break;
      case 0x3Du:
      case 0x4Cu:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 8;
        break;
      case 0x3Eu:
      case 0x4Du:
        unsigned int v22 = 9;
        goto LABEL_242;
      case 0x3Fu:
      case 0x4Eu:
        unsigned int v22 = 10;
        goto LABEL_242;
      case 0x4Fu:
        unsigned int v22 = 21;
        goto LABEL_242;
      case 0x50u:
      case 0xB6u:
      case 0xC9u:
        unsigned int v22 = 22;
        goto LABEL_242;
      case 0x51u:
        unsigned int v22 = 39;
        goto LABEL_242;
      case 0x52u:
        unsigned int v22 = 11;
        goto LABEL_242;
      case 0x53u:
      case 0xB7u:
      case 0xCAu:
        unsigned int v22 = 23;
        goto LABEL_242;
      case 0x54u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0xC;
        break;
      case 0x55u:
        unsigned int v22 = 13;
        goto LABEL_242;
      case 0x56u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0xE;
        break;
      case 0x57u:
      case 0x99u:
      case 0x9Cu:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x10;
        break;
      case 0x58u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0xF;
        break;
      case 0x59u:
        unsigned int v22 = 17;
        goto LABEL_242;
      case 0x5Au:
        unsigned int v22 = 18;
        goto LABEL_242;
      case 0x5Bu:
        unsigned int v22 = 19;
        goto LABEL_242;
      case 0x5Cu:
        unsigned int v22 = 20;
        goto LABEL_242;
      case 0x5Du:
      case 0xB9u:
      case 0xCBu:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x18;
        break;
      case 0x5Eu:
      case 0xB8u:
      case 0xCCu:
        unsigned int v22 = 25;
        goto LABEL_242;
      case 0x5Fu:
      case 0xBAu:
      case 0xCDu:
        unsigned int v22 = 26;
        goto LABEL_242;
      case 0x60u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x1F;
        break;
      case 0x61u:
      case 0x97u:
      case 0x9Au:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x20;
        break;
      case 0x62u:
        unsigned int v22 = 33;
        goto LABEL_242;
      case 0x63u:
        unsigned int v22 = 37;
        goto LABEL_242;
      case 0x64u:
        unsigned int v22 = 34;
        goto LABEL_242;
      case 0x65u:
        unsigned int v22 = 36;
        goto LABEL_242;
      case 0x66u:
        unsigned int v22 = 35;
        goto LABEL_242;
      case 0x67u:
      case 0xBBu:
      case 0xCEu:
        unsigned int v22 = 27;
        goto LABEL_242;
      case 0x68u:
      case 0xBCu:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x1C;
        break;
      case 0x69u:
      case 0xBDu:
        unsigned int v22 = 29;
        goto LABEL_242;
      case 0x6Au:
      case 0xB5u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x1E;
        break;
      case 0x6Bu:
      case 0xAEu:
        unsigned int v22 = 38;
        goto LABEL_242;
      case 0x6Cu:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_broadcast(*(int **)v112, *((_DWORD *)v2 - 6));
        goto LABEL_228;
      case 0x6Du:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_multicast(*(int **)v112, *((_DWORD *)v2 - 6));
        goto LABEL_228;
      case 0x6Eu:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_less(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x6Fu:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_greater(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x70u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_byteop(*(int **)v112, *((_DWORD *)v2 - 6), *((_DWORD *)v2 - 12), *(_DWORD *)v2);
        goto LABEL_228;
      case 0x71u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_inbound(*(int **)v112, 0);
        goto LABEL_228;
      case 0x72u:
        uint64_t v50 = 1;
        int v55 = *((_DWORD *)v17 + 8);
        int v56 = *((_DWORD *)v17 + 9);
        size_t v57 = gen_inbound(*(int **)v112, 1);
        goto LABEL_214;
      case 0x73u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_ifindex(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x74u:
        uint64_t v50 = 1;
        int v55 = *((_DWORD *)v17 + 8);
        int v56 = *((_DWORD *)v17 + 9);
        size_t v57 = gen_vlan(*(int **)v112, *(_DWORD *)v2, 1);
        goto LABEL_214;
      case 0x75u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_vlan(*(int **)v112, 0, 0);
        goto LABEL_228;
      case 0x76u:
        uint64_t v50 = 1;
        int v55 = *((_DWORD *)v17 + 8);
        int v56 = *((_DWORD *)v17 + 9);
        size_t v57 = gen_mpls(*(int32x2_t **)v112, *(_DWORD *)v2, 1);
        goto LABEL_214;
      case 0x77u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_mpls(*(int32x2_t **)v112, 0, 0);
        goto LABEL_228;
      case 0x78u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pppoed(*(int **)v112);
        goto LABEL_228;
      case 0x79u:
        uint64_t v50 = 1;
        int v55 = *((_DWORD *)v17 + 8);
        int v56 = *((_DWORD *)v17 + 9);
        size_t v57 = gen_pppoes(*(uint64_t *)v112, *(_DWORD *)v2, 1);
        goto LABEL_214;
      case 0x7Au:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pppoes(*(uint64_t *)v112, 0, 0);
        goto LABEL_228;
      case 0x7Bu:
        uint64_t v50 = 1;
        int v55 = *((_DWORD *)v17 + 8);
        int v56 = *((_DWORD *)v17 + 9);
        size_t v57 = gen_geneve(*(uint64_t *)v112, *(_DWORD *)v2, 1);
        goto LABEL_214;
      case 0x7Cu:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_geneve(*(uint64_t *)v112, 0, 0);
        goto LABEL_228;
      case 0x7Du:
      case 0x7Eu:
      case 0x7Fu:
        unint64_t v18 = *(void *)v2;
        break;
      case 0x80u:
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pf_ifname(*(int **)v112, *(char **)v2);
        goto LABEL_228;
      case 0x81u:
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pf_ruleset(*(int **)v112, *(char **)v2);
        goto LABEL_228;
      case 0x82u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pf_rnr(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x83u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pf_srnr(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x84u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pf_reason(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x85u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_pf_action(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x86u:
        int v58 = *(_DWORD *)v2 | *((_DWORD *)v2 - 12);
        goto LABEL_163;
      case 0x87u:
        int v58 = *(_DWORD *)v2;
        uint64_t v59 = *(int **)v112;
        int v60 = 12;
        goto LABEL_164;
      case 0x88u:
        int v58 = *(_DWORD *)v2;
LABEL_163:
        uint64_t v59 = *(int **)v112;
        int v60 = 252;
LABEL_164:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_p80211_type(v59, v58, v60);
        goto LABEL_228;
      case 0x89u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_p80211_fcdir(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x8Au:
        uint64_t v24 = *(unsigned int *)v2;
        if ((v24 & 0xFFFFFFF3) == 0) {
          goto LABEL_238;
        }
        bpf_set_error(*(uint64_t *)v112, "invalid 802.11 type value 0x%02x");
        goto LABEL_297;
      case 0x8Bu:
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v47 = *((_DWORD *)v17 + 9);
        int v48 = *((_DWORD *)v17 + 8);
        unsigned int v61 = str2tok(*(unsigned __int8 **)v2, ieee80211_types);
        if (v61 == -1)
        {
          bpf_set_error(*(uint64_t *)v112, "unknown 802.11 type name \"%s\"");
          goto LABEL_297;
        }
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | v61;
LABEL_116:
        int v19 = v48;
        int v20 = v47;
        break;
      case 0x8Cu:
        uint64_t v24 = *(unsigned int *)v2;
        if ((v24 & 0xFFFFFF0F) == 0) {
          goto LABEL_238;
        }
        bpf_set_error(*(uint64_t *)v112, "invalid 802.11 subtype value 0x%02x");
        goto LABEL_297;
      case 0x8Du:
        unsigned int v62 = *(unsigned __int8 **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v110 = *((_DWORD *)v17 + 9);
        int v63 = v19;
        uint64_t v64 = 0;
        while (*((_DWORD *)v2 - 12) != ieee80211_type_subtypes[v64])
        {
          v64 += 4;
          if (v64 == 12)
          {
            bpf_set_error(*(uint64_t *)v112, "unknown 802.11 type");
            goto LABEL_297;
          }
        }
        unsigned int v96 = str2tok(v62, *(unsigned int **)&ieee80211_type_subtypes[v64 + 2]);
        if (v96 == -1)
        {
          bpf_set_error(*(uint64_t *)v112, "unknown 802.11 subtype name \"%s\"");
          goto LABEL_297;
        }
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | v96;
        goto LABEL_287;
      case 0x8Eu:
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v65 = 0;
        while (1)
        {
          unsigned int v66 = str2tok(*(unsigned __int8 **)v2, *(unsigned int **)&ieee80211_type_subtypes[v65 + 2]);
          if (v66 != -1) {
            break;
          }
          v18 |= 0xFFFFFFFFuLL;
          v65 += 4;
          if (v65 == 12)
          {
            bpf_set_error(*(uint64_t *)v112, "unknown 802.11 type name");
            goto LABEL_297;
          }
        }
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | ieee80211_type_subtypes[v65] | v66;
LABEL_95:
        int v19 = v109;
        int v20 = v110;
        break;
      case 0x8Fu:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_llc(*(int **)v112);
        goto LABEL_228;
      case 0x90u:
        unsigned int v67 = *(unsigned __int8 **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v110 = *((_DWORD *)v17 + 9);
        int v68 = v19;
        if (pcap_strcasecmp(v67, "i"))
        {
          if (pcap_strcasecmp(*(unsigned __int8 **)v2, "s"))
          {
            if (pcap_strcasecmp(*(unsigned __int8 **)v2, "u"))
            {
              int v69 = str2tok(*(unsigned __int8 **)v2, llc_s_subtypes);
              if (v69 == -1)
              {
                int v97 = str2tok(*(unsigned __int8 **)v2, llc_u_subtypes);
                if (v97 == -1)
                {
                  bpf_set_error(*(uint64_t *)v112, "unknown LLC type name \"%s\"");
                  goto LABEL_297;
                }
                size_t v70 = gen_llc_u_subtype(*(int **)v112, v97);
              }
              else
              {
                size_t v70 = gen_llc_s_subtype(*(int **)v112, v69);
              }
            }
            else
            {
              size_t v70 = gen_llc_u(*(int **)v112);
            }
          }
          else
          {
            size_t v70 = gen_llc_s(*(int **)v112);
          }
        }
        else
        {
          size_t v70 = gen_llc_i(*(int **)v112);
        }
        unint64_t v18 = v70;
        int v19 = v68;
        int v20 = v110;
        if (!v70) {
          goto LABEL_297;
        }
        break;
      case 0x91u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_llc_s_subtype(*(int **)v112, 5);
        goto LABEL_228;
      case 0x92u:
      case 0x94u:
        uint64_t v24 = *(unsigned int *)v2;
        goto LABEL_238;
      case 0x93u:
        uint64_t v71 = *(unsigned __int8 **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v110 = *((_DWORD *)v17 + 9);
        int v63 = v19;
        if (pcap_strcasecmp(v71, "nods"))
        {
          if (pcap_strcasecmp(*(unsigned __int8 **)v2, "tods"))
          {
            if (pcap_strcasecmp(*(unsigned __int8 **)v2, "fromds"))
            {
              if (pcap_strcasecmp(*(unsigned __int8 **)v2, "dstods"))
              {
                bpf_set_error(*(uint64_t *)v112, "unknown 802.11 direction");
LABEL_297:
                uint64_t v50 = 1;
                goto LABEL_299;
              }
              unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 3;
            }
            else
            {
              unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 2;
            }
          }
          else
          {
            unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 1;
          }
        }
        else
        {
          v18 &= 0xFFFFFFFF00000000;
        }
LABEL_287:
        int v19 = v63;
        int v20 = v110;
        break;
      case 0x95u:
        unsigned int v72 = *(unsigned __int8 **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        uint64_t v73 = 0;
        while (pcap_strcasecmp(v72, (unsigned __int8 *)off_264122FE8[v73]))
        {
          if (++v73 == 17)
          {
            bpf_set_error(*(uint64_t *)v112, "unknown PF reason \"%s\"");
            goto LABEL_297;
          }
        }
        int v19 = v109;
        int v20 = v110;
        if (v73 == 0xFFFFFFFFLL) {
          goto LABEL_297;
        }
        unint64_t v18 = (v18 & 0xFFFFFFFF00000000) + v73;
        break;
      case 0x96u:
        uint64_t v74 = *(unsigned __int8 **)v2;
        if (!*(void *)v2) {
          goto LABEL_297;
        }
        int v109 = *((_DWORD *)v17 + 8);
        int v110 = v20;
        if (pcap_strcasecmp(v74, "pass") && pcap_strcasecmp(v74, "accept"))
        {
          if (pcap_strcasecmp(v74, "drop") && pcap_strcasecmp(v74, "block"))
          {
            if (pcap_strcasecmp(v74, "rdr"))
            {
              if (pcap_strcasecmp(v74, "nat"))
              {
                if (pcap_strcasecmp(v74, "binat"))
                {
                  if (pcap_strcasecmp(v74, "nordr"))
                  {
                    bpf_set_error(*(uint64_t *)v112, "unknown PF action \"%s\"");
                    goto LABEL_297;
                  }
                  uint64_t v75 = 9;
                }
                else
                {
                  uint64_t v75 = 6;
                }
              }
              else
              {
                uint64_t v75 = 4;
              }
            }
            else
            {
              uint64_t v75 = 8;
            }
          }
          else
          {
            uint64_t v75 = 1;
          }
        }
        else
        {
          uint64_t v75 = 0;
        }
        int v19 = v109;
        int v20 = v110;
        unint64_t v18 = v75 | v18 & 0xFFFFFFFF00000000;
        break;
      case 0x98u:
      case 0x9Bu:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x30;
        break;
      case 0x9Du:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_loadi(*(int **)v112, *(_DWORD *)v2);
        goto LABEL_228;
      case 0x9Fu:
        uint64_t v50 = 1;
        int v55 = *((_DWORD *)v17 + 8);
        int v56 = *((_DWORD *)v17 + 9);
        size_t v57 = gen_load(*(int **)v112, *((_DWORD *)v2 - 18), *((void *)v2 - 3), 1);
LABEL_214:
        int v20 = v56;
        int v19 = v55;
        unint64_t v18 = v57;
        if (!v57) {
          goto LABEL_299;
        }
        break;
      case 0xA0u:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_load(*(int **)v112, *((_DWORD *)v2 - 30), *((void *)v2 - 9), *((_DWORD *)v2 - 6));
        goto LABEL_228;
      case 0xA1u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 0;
        goto LABEL_227;
      case 0xA2u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 16;
        goto LABEL_227;
      case 0xA3u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 32;
        goto LABEL_227;
      case 0xA4u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 48;
        goto LABEL_227;
      case 0xA5u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 144;
        goto LABEL_227;
      case 0xA6u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 80;
        goto LABEL_227;
      case 0xA7u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 64;
        goto LABEL_227;
      case 0xA8u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 160;
        goto LABEL_227;
      case 0xA9u:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 96;
        goto LABEL_227;
      case 0xAAu:
        uint64_t v76 = *((void *)v2 - 6);
        uint64_t v77 = *(void *)v2;
        unsigned int v78 = *(int **)v112;
        int v79 = 112;
LABEL_227:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_arth(v78, v79, v76, v77);
        goto LABEL_228;
      case 0xABu:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_neg(*(int **)v112, *(void *)v2);
        goto LABEL_228;
      case 0xACu:
        unint64_t v18 = *((void *)v2 - 3);
        break;
      case 0xADu:
        int v52 = *((_DWORD *)v17 + 8);
        int v53 = *((_DWORD *)v17 + 9);
        size_t v54 = gen_loadlen(*(int **)v112);
LABEL_228:
        int v20 = v53;
        int v19 = v52;
        unint64_t v18 = v54;
        if (!v54) {
          goto LABEL_297;
        }
        break;
      case 0xAFu:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x7C;
        break;
      case 0xB0u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x3C;
        break;
      case 0xB1u:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | 0x3E;
        break;
      case 0xB2u:
        unsigned int v22 = 61;
        goto LABEL_242;
      case 0xB4u:
        uint64_t v24 = *((unsigned int *)v2 - 6);
LABEL_238:
        unint64_t v23 = v18 & 0xFFFFFFFF00000000;
LABEL_239:
        unint64_t v18 = v23 | v24;
        break;
      case 0xBEu:
        unsigned int v22 = 70;
        goto LABEL_242;
      case 0xBFu:
        unsigned int v22 = 71;
LABEL_242:
        unint64_t v18 = v18 & 0xFFFFFFFF00000000 | v22;
        break;
      case 0xC0u:
        uint64_t v83 = 0x3300000000;
        goto LABEL_250;
      case 0xC1u:
        uint64_t v83 = 0x3400000000;
LABEL_250:
        unint64_t v18 = v83 & 0xFFFFFFFF00000000 | v18;
        break;
      case 0xC3u:
        int v84 = *((_DWORD *)v17 + 8);
        int v85 = *((_DWORD *)v17 + 9);
        size_t v86 = gen_atmfield_code(*(int **)v112, *((_DWORD *)v2 - 11), *(unsigned int *)v2, *((unsigned int *)v2 - 6), 0);
        goto LABEL_271;
      case 0xC4u:
        uint64_t v50 = 1;
        int v87 = *((_DWORD *)v17 + 8);
        int v88 = *((_DWORD *)v17 + 9);
        size_t v89 = gen_atmfield_code(*(int **)v112, *((_DWORD *)v2 - 11), *(unsigned int *)v2, *((unsigned int *)v2 - 6), 1);
        goto LABEL_266;
      case 0xC5u:
      case 0xDAu:
        size_t v21 = *((void *)v2 - 1);
LABEL_109:
        v18 |= 0xFFFFFFFFuLL;
        break;
      case 0xC6u:
        unsigned int v90 = *((_DWORD *)v2 - 5);
        unint64_t v18 = *((void *)v17 + 3) | ((unint64_t)v90 << 32);
        if (v90 - 51 > 1) {
          break;
        }
        int v47 = *((_DWORD *)v17 + 9);
        int v48 = *((_DWORD *)v17 + 8);
        size_t v91 = gen_atmfield_code(*(int **)v112, v90, *(unsigned int *)v2, 16, 0);
        if (!v91) {
          goto LABEL_297;
        }
        size_t v21 = v91;
        goto LABEL_116;
      case 0xCFu:
        int v19 = 1;
        break;
      case 0xD0u:
        int v19 = 2;
        break;
      case 0xD1u:
        int v19 = 3;
        break;
      case 0xD2u:
        int v19 = 4;
        break;
      case 0xD3u:
        int v19 = 5;
        break;
      case 0xD4u:
        int v19 = 6;
        break;
      case 0xD5u:
        int v19 = 7;
        break;
      case 0xD6u:
        int v19 = 8;
        break;
      case 0xD8u:
        int v92 = *((_DWORD *)v2 - 10);
        unsigned int v93 = *(_DWORD *)v2;
        int v94 = *((_DWORD *)v2 - 6);
        int v95 = *(int **)v112;
        goto LABEL_270;
      case 0xD9u:
        uint64_t v50 = 1;
        int v87 = *((_DWORD *)v17 + 8);
        int v88 = *((_DWORD *)v17 + 9);
        size_t v89 = gen_mtp3field_code(*(int **)v112, *((_DWORD *)v2 - 10), *(_DWORD *)v2, *((_DWORD *)v2 - 6), 1);
LABEL_266:
        int v20 = v88;
        int v19 = v87;
        size_t v21 = v89;
        if (!v89) {
          goto LABEL_299;
        }
        break;
      case 0xDBu:
        int v19 = *((_DWORD *)v2 - 4);
        if ((v19 - 1) <= 7)
        {
          unsigned int v93 = *(_DWORD *)v2;
          int v95 = *(int **)v112;
          int v92 = *((_DWORD *)v2 - 4);
          int v94 = 16;
LABEL_270:
          int v84 = v19;
          int v85 = *((_DWORD *)v17 + 9);
          size_t v86 = gen_mtp3field_code(v95, v92, v93, v94, 0);
LABEL_271:
          int v20 = v85;
          int v19 = v84;
          size_t v21 = v86;
          if (!v86) {
            goto LABEL_297;
          }
        }
        break;
      default:
        break;
    }
    unsigned int v80 = (unsigned __int8 *)&v2[-24 * (int)v16];
    *((void *)v80 + 3) = v18;
    uint64_t v2 = (char *)(v80 + 24);
    v4 -= 2 * v16;
    *((_DWORD *)v2 + 2) = v19;
    *((_DWORD *)v2 + 3) = v20;
    *((void *)v2 + 2) = v21;
    uint64_t v81 = yyr1[v15] - 141;
    uint64_t v82 = (*(__int16 *)v4 + yypgoto[v81]);
    if (v82 <= 0x320 && yycheck[v82] == *(unsigned __int16 *)v4) {
      int v1 = yytable[v82];
    }
    else {
      int v1 = yydefgoto[v81];
    }
LABEL_247:
    v4 += 2;
  }
  int v1 = yytable[v13];
  if (v1 <= 0)
  {
    if (!yytable[v13])
    {
LABEL_296:
      bpf_set_error(*(uint64_t *)v112, "can't parse filter expression: %s");
      goto LABEL_297;
    }
    unsigned int v15 = -v1;
    goto LABEL_29;
  }
  if (v13 != 34)
  {
    if (v114) {
      int v14 = -2;
    }
    else {
      int v14 = 0;
    }
    int v114 = v14;
    *(_OWORD *)(v2 + 24) = v115;
    *((void *)v2 + 5) = v116;
    v2 += 24;
    goto LABEL_247;
  }
  uint64_t v50 = 0;
LABEL_299:
  if (v5 != (char *)v118) {
    free(v5);
  }
  return v50;
}

uint64_t str2tok(unsigned __int8 *a1, unsigned int *a2)
{
  uint64_t v3 = (unsigned __int8 *)*((void *)a2 + 1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = a2;
  while (pcap_strcasecmp(v3, a1))
  {
    uint64_t v3 = (unsigned __int8 *)*((void *)v4 + 3);
    v4 += 4;
    if (!v3) {
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t result = *v4;
  if (result == -1) {
    abort();
  }
  return result;
}

uint64_t pcap_lex(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 152) = a1;
  if (!*(_DWORD *)(a2 + 80))
  {
    *(_DWORD *)(a2 + 80) = 1;
    if (!*(_DWORD *)(a2 + 84)) {
      *(_DWORD *)(a2 + 84) = 1;
    }
    if (!*(void *)(a2 + 8)) {
      *(void *)(a2 + 8) = *MEMORY[0x263EF8350];
    }
    if (!*(void *)(a2 + 16)) {
      *(void *)(a2 + 16) = *MEMORY[0x263EF8358];
    }
    uint64_t v3 = *(void *)(a2 + 40);
    if (!v3 || (uint64_t v4 = *(void *)(a2 + 24), (v5 = *(void *)(v3 + 8 * v4)) == 0))
    {
      pcap_ensure_buffer_stack((void *)a2);
      uint64_t buffer = pcap__create_buffer(*(void *)(a2 + 8), 0x4000, a2);
      uint64_t v4 = *(void *)(a2 + 24);
      *(void *)(*(void *)(a2 + 40) + 8 * v4) = buffer;
      uint64_t v3 = *(void *)(a2 + 40);
      uint64_t v5 = *(void *)(v3 + 8 * v4);
    }
    *(void *)(a2 + 56) = *(void *)(v5 + 32);
    uint64_t v7 = *(unsigned char **)(v5 + 16);
    *(void *)(a2 + 72) = v7;
    *(void *)(a2 + 136) = v7;
    *(void *)(a2 + 8) = **(void **)(v3 + 8 * v4);
    *(unsigned char *)(a2 + 48) = *v7;
  }
  uint64_t v82 = (unint64_t *)(a2 + 72);
  uint64_t v8 = (unsigned char **)(a2 + 120);
  uint64_t v9 = yy_nxt;
LABEL_13:
  int v10 = *(unsigned char **)(a2 + 72);
  *int v10 = *(unsigned char *)(a2 + 48);
  int v11 = *(_DWORD *)(a2 + 84);
  int v12 = v10;
  while (1)
  {
    do
    {
LABEL_14:
      uint64_t v13 = yy_ec[*v10];
      if (yy_accept[v11])
      {
        *(_DWORD *)(a2 + 112) = v11;
        *(void *)(a2 + 120) = v10;
      }
      uint64_t v14 = v11;
      uint64_t v15 = yy_base[v11] + v13;
      if (v11 != (__int16)yy_chk[v15])
      {
        do
        {
          uint64_t v14 = yy_def[v14];
          if (v14 >= 1785) {
            uint64_t v13 = *((unsigned __int8 *)&yy_meta + v13);
          }
          uint64_t v15 = yy_base[v14] + v13;
        }
        while (yy_chk[v15] != (unsigned __int16)v14);
      }
      int v11 = v9[v15];
      ++v10;
    }
    while (v11 != 1784);
    while (2)
    {
      int v16 = *(_DWORD *)(a2 + 112);
      unsigned int v17 = v8;
LABEL_22:
      unint64_t v18 = *v17;
      int v19 = (__int16)yy_accept[v16];
      *(void *)(a2 + 136) = v12;
      *(void *)(a2 + 64) = v18 - v12;
      *(unsigned char *)(a2 + 48) = *v18;
      *unint64_t v18 = 0;
      *(void *)(a2 + 72) = v18;
LABEL_23:
      switch(v19)
      {
        case 0:
          *unint64_t v18 = *(unsigned char *)(a2 + 48);
          continue;
        case 1:
          return 258;
        case 2:
          return 259;
        case 3:
        case 4:
          return 311;
        case 5:
          return 271;
        case 6:
          return 272;
        case 7:
          return 273;
        case 8:
          return 274;
        case 9:
          return 275;
        case 10:
          return 276;
        case 11:
          return 277;
        case 12:
          return 278;
        case 13:
          return 279;
        case 14:
          return 280;
        case 15:
          return 281;
        case 16:
          return 282;
        case 17:
          return 360;
        case 18:
          return 323;
        case 19:
          return 324;
        case 20:
          return 325;
        case 21:
          return 326;
        case 22:
          return 283;
        case 23:
          return 284;
        case 24:
          return 285;
        case 25:
          return 286;
        case 26:
          return 287;
        case 27:
          return 288;
        case 28:
          return 289;
        case 29:
          return 332;
        case 30:
        case 31:
          return 333;
        case 32:
        case 33:
          return 335;
        case 34:
          return 336;
        case 35:
          return 337;
        case 36:
          return 338;
        case 37:
          return 339;
        case 38:
          return 340;
        case 39:
          return 341;
        case 40:
          return 342;
        case 41:
          return 334;
        case 42:
          return 343;
        case 43:
          return 344;
        case 44:
          return 345;
        case 45:
          return 260;
        case 46:
          return 262;
        case 47:
          return 263;
        case 48:
          return 264;
        case 49:
          return 265;
        case 50:
          return 268;
        case 51:
          return 269;
        case 52:
          return 261;
        case 53:
          return 302;
        case 54:
          return 303;
        case 55:
          return 304;
        case 56:
          return 305;
        case 57:
          return 306;
        case 58:
          return 307;
        case 59:
          return 308;
        case 60:
          return 309;
        case 61:
          return 310;
        case 62:
          return 266;
        case 63:
          return 267;
        case 64:
          return 270;
        case 65:
          return 290;
        case 66:
          return 291;
        case 67:
          return 376;
        case 68:
          return 377;
        case 69:
          return 33;
        case 70:
          return 322;
        case 71:
          return 293;
        case 72:
          return 294;
        case 73:
          return 295;
        case 74:
          return 327;
        case 75:
          return 328;
        case 76:
          return 329;
        case 77:
          return 330;
        case 78:
          return 331;
        case 79:
          return 346;
        case 80:
          return 347;
        case 81:
          return 348;
        case 82:
          return 349;
        case 83:
          return 354;
        case 84:
          return 355;
        case 85:
          return 352;
        case 86:
          return 353;
        case 87:
          return 350;
        case 88:
          return 351;
        case 89:
          return 358;
        case 90:
          return 359;
        case 91:
          return 356;
        case 92:
          return 357;
        case 93:
          return 296;
        case 94:
          return 297;
        case 95:
          return 298;
        case 96:
          return 299;
        case 97:
          return 300;
        case 98:
          return 301;
        case 99:
          return 361;
        case 100:
        case 101:
          return 362;
        case 102:
          return 363;
        case 103:
          return 364;
        case 104:
          return 365;
        case 105:
          return 366;
        case 106:
          return 367;
        case 107:
          return 368;
        case 108:
          return 369;
        case 109:
          return 370;
        case 110:
          return 371;
        case 111:
          return 372;
        case 112:
          return 373;
        case 113:
          return 374;
        case 114:
          goto LABEL_13;
        case 115:
          return **(char **)(a2 + 136);
        case 116:
          return 312;
        case 117:
          return 313;
        case 118:
          return 314;
        case 119:
          return 61;
        case 120:
          return 320;
        case 121:
          return 321;
        case 122:
          **(void **)(a2 + 152) = sdup(*(void *)a2, *(char **)(a2 + 136));
          return 319;
        case 123:
          **(void **)(a2 + 152) = sdup(*(void *)a2, *(char **)(a2 + 136));
          return 316;
        case 124:
          int v69 = *(unsigned __int8 **)(a2 + 136);
          size_t v70 = *(unsigned int **)(a2 + 152);
          uint64_t v71 = *(void *)a2;
          return stou(v69, v70, v71);
        case 125:
          **(void **)(a2 + 152) = sdup(*(void *)a2, *(char **)(a2 + 136));
          return 317;
        case 126:
          uint64_t v83 = 0;
          memset(&v84.ai_socktype, 0, 40);
          *(void *)&v84.ai_flags = 0x1E00000004;
          if (getaddrinfo(*(const char **)(a2 + 136), 0, &v84, &v83))
          {
            bpf_set_error(*(void *)a2, "bogus IPv6 address %s", *(const char **)(a2 + 136));
            unsigned int v72 = 0;
          }
          else
          {
            freeaddrinfo(v83);
            unsigned int v72 = sdup(*(void *)a2, *(char **)(a2 + 136));
          }
          **(void **)(a2 + 152) = v72;
          return 318;
        case 127:
          bpf_set_error(*(void *)a2, "bogus ethernet address %s", *(const char **)(a2 + 136));
          **(void **)(a2 + 152) = 0;
          return 316;
        case 128:
        case 130:
        case 145:
          **(_DWORD **)(a2 + 152) = 0;
          return 292;
        case 129:
        case 146:
        case 147:
        case 177:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 1;
          goto LABEL_264;
        case 131:
        case 149:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 3;
          goto LABEL_264;
        case 132:
        case 150:
        case 179:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 4;
          goto LABEL_264;
        case 133:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 5;
          goto LABEL_264;
        case 134:
        case 180:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 8;
          goto LABEL_264;
        case 135:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 9;
          goto LABEL_264;
        case 136:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 10;
          goto LABEL_264;
        case 137:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 11;
          goto LABEL_264;
        case 138:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 12;
          goto LABEL_264;
        case 139:
        case 176:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 13;
          goto LABEL_264;
        case 140:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 14;
          goto LABEL_264;
        case 141:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 15;
          goto LABEL_264;
        case 142:
        case 181:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 16;
          goto LABEL_264;
        case 143:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 17;
          goto LABEL_264;
        case 144:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 18;
          goto LABEL_264;
        case 148:
        case 178:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 2;
          goto LABEL_264;
        case 151:
        case 184:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 128;
          goto LABEL_264;
        case 152:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 129;
          goto LABEL_264;
        case 153:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 130;
          goto LABEL_264;
        case 154:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 131;
          goto LABEL_264;
        case 155:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 132;
          goto LABEL_264;
        case 156:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 133;
          goto LABEL_264;
        case 157:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 134;
          goto LABEL_264;
        case 158:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 135;
          goto LABEL_264;
        case 159:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 136;
          goto LABEL_264;
        case 160:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 137;
          goto LABEL_264;
        case 161:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 138;
          goto LABEL_264;
        case 162:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 139;
          goto LABEL_264;
        case 163:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 140;
          goto LABEL_264;
        case 164:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 141;
          goto LABEL_264;
        case 165:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 142;
          goto LABEL_264;
        case 166:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 143;
          goto LABEL_264;
        case 167:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 144;
          goto LABEL_264;
        case 168:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 145;
          goto LABEL_264;
        case 169:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 146;
          goto LABEL_264;
        case 170:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 147;
          goto LABEL_264;
        case 171:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 148;
          goto LABEL_264;
        case 172:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 149;
          goto LABEL_264;
        case 173:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 151;
          goto LABEL_264;
        case 174:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 152;
          goto LABEL_264;
        case 175:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 153;
          goto LABEL_264;
        case 182:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 32;
          goto LABEL_264;
        case 183:
          unsigned int v66 = *(int **)(a2 + 152);
          int v67 = 64;
LABEL_264:
          int *v66 = v67;
          return 292;
        case 185:
          uint64_t v73 = *(void *)a2;
          uint64_t v74 = *(char **)(a2 + 136);
          goto LABEL_269;
        case 186:
          uint64_t v73 = *(void *)a2;
          uint64_t v74 = (char *)(*(void *)(a2 + 136) + 1);
LABEL_269:
          **(void **)(a2 + 152) = sdup(v73, v74);
          return 315;
        case 187:
          return 375;
        case 188:
          fwrite(*(const void **)(a2 + 136), *(void *)(a2 + 64), 1uLL, *(FILE **)(a2 + 16));
          goto LABEL_13;
        case 189:
          uint64_t v78 = *(void *)(a2 + 136);
          uint64_t v81 = v18;
          *unint64_t v18 = *(unsigned char *)(a2 + 48);
          uint64_t v20 = *(void *)(a2 + 40);
          uint64_t v21 = *(void *)(a2 + 24);
          uint64_t v22 = *(void *)(v20 + 8 * v21);
          if (*(_DWORD *)(v22 + 64))
          {
            uint64_t v23 = *(void *)(a2 + 56);
          }
          else
          {
            uint64_t v23 = *(void *)(v22 + 32);
            *(void *)(a2 + 56) = v23;
            *(void *)uint64_t v22 = *(void *)(a2 + 8);
            uint64_t v22 = *(void *)(v20 + 8 * v21);
            *(_DWORD *)(v22 + 64) = 1;
          }
          unint64_t v24 = *v82;
          int v25 = *(unsigned char **)(v22 + 8);
          if (*v82 <= (unint64_t)&v25[v23])
          {
            *(void *)(a2 + 72) = *(void *)(a2 + 136) + ~v78 + (int)v81;
            int previous_state = yy_get_previous_state(a2);
            if (yy_accept[previous_state])
            {
              uint64_t v61 = *(void *)(a2 + 72);
              *(_DWORD *)(a2 + 112) = previous_state;
              *(void *)(a2 + 120) = v61;
            }
            uint64_t v62 = previous_state;
            uint64_t v63 = yy_base[previous_state] + 1;
            if (previous_state != (__int16)yy_chk[v63])
            {
              do
              {
                int v64 = (unsigned __int16)yy_def[v62];
                uint64_t v62 = (__int16)v64;
                uint64_t v63 = yy_base[(__int16)v64] + 1;
              }
              while (v64 != yy_chk[v63]);
            }
            int v65 = (unsigned __int16)v9[v63];
            int v12 = *(unsigned char **)(a2 + 136);
            if (v9[v63] && v65 != 1784)
            {
              int v11 = (__int16)v65;
              int v10 = (unsigned char *)(*v82 + 1);
              unint64_t *v82 = (unint64_t)v10;
              goto LABEL_14;
            }
            continue;
          }
          if (v24 > (unint64_t)&v25[v23 + 1]) {
            yy_fatal_error("fatal flex scanner internal error--end of buffer missed");
          }
          int v26 = *(char **)(a2 + 136);
          if (!*(_DWORD *)(v22 + 60))
          {
            if (v24 - (void)v26 != 1) {
              goto LABEL_83;
            }
            goto LABEL_77;
          }
          int v27 = ~v26 + v24;
          if (v27 >= 1)
          {
            int v28 = ~v26 + v24;
            do
            {
              char v29 = *v26++;
              *v25++ = v29;
              --v28;
            }
            while (v28);
            uint64_t v22 = *(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24));
          }
          uint64_t v79 = v27;
          unsigned int v80 = v8;
          if (*(_DWORD *)(v22 + 64) == 2)
          {
            *(void *)(a2 + 56) = 0;
            goto LABEL_36;
          }
          int v32 = ~v27;
          int v33 = *(_DWORD *)(v22 + 24);
          unsigned int v34 = v33 + ~v27;
          int v76 = v27;
          if (!v34)
          {
            size_t v35 = (char *)*v82;
            do
            {
              if (!*(_DWORD *)(v22 + 40))
              {
                *(void *)(v22 + 8) = 0;
LABEL_275:
                yy_fatal_error("fatal error - scanner input buffer overflow");
              }
              uint64_t v36 = v12;
              __n128 v37 = *(void **)(v22 + 8);
              int v38 = 2 * v33;
              *(_DWORD *)(v22 + 24) = v38;
              int v39 = (char *)malloc_type_realloc(v37, v38 + 2, 0x6B826E7EuLL);
              *(void *)(v22 + 8) = v39;
              if (!v39) {
                goto LABEL_275;
              }
              size_t v35 = &v39[(int)v35 - (int)v37];
              *(void *)(a2 + 72) = v35;
              uint64_t v22 = *(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24));
              int v33 = *(_DWORD *)(v22 + 24);
              unsigned int v34 = v33 + v32;
              int v12 = v36;
            }
            while (!(v33 + v32));
            uint64_t v9 = yy_nxt;
          }
          uint64_t v75 = v12;
          if (v34 >= 0x2000) {
            size_t v40 = 0x2000;
          }
          else {
            size_t v40 = v34;
          }
          if (!*(_DWORD *)(v22 + 44))
          {
            *__error() = 0;
            size_t v43 = fread((void *)(*(void *)(*(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24)) + 8) + v76), 1uLL, v40, *(FILE **)(a2 + 8));
            size_t v30 = (int)v43;
            *(void *)(a2 + 56) = (int)v43;
            int v12 = v75;
            if (v43 << 32) {
              goto LABEL_68;
            }
            while (ferror(*(FILE **)(a2 + 8)))
            {
              if (*__error() != 4) {
                goto LABEL_278;
              }
              *__error() = 0;
              clearerr(*(FILE **)(a2 + 8));
              size_t v44 = fread((void *)(*(void *)(*(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24)) + 8) + v79), 1uLL, v40, *(FILE **)(a2 + 8));
              size_t v30 = (int)v44;
              *(void *)(a2 + 56) = (int)v44;
              if (v44 << 32)
              {
                int v12 = v75;
                goto LABEL_68;
              }
            }
            uint64_t v22 = *(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24));
            int v12 = v75;
            int v27 = v76;
LABEL_36:
            *(void *)(v22 + 32) = 0;
            if (!v27) {
              goto LABEL_71;
            }
LABEL_37:
            size_t v30 = 0;
            int v31 = 2;
            *(_DWORD *)(v22 + 64) = 2;
            goto LABEL_72;
          }
          size_t v30 = 0;
          while (1)
          {
            int v41 = getc(*(FILE **)(a2 + 8));
            if (v41 == -1 || v41 == 10) {
              break;
            }
            *(unsigned char *)(*(void *)(*(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24)) + 8) + v79 + v30++) = v41;
            if (v40 == v30)
            {
              size_t v30 = v40;
              break;
            }
          }
          if (v41 == -1)
          {
            int v45 = ferror(*(FILE **)(a2 + 8));
            int v12 = v75;
            if (v45) {
LABEL_278:
            }
              yy_fatal_error("input in flex scanner failed");
          }
          else
          {
            if (v41 == 10) {
              *(unsigned char *)(*(void *)(*(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24)) + 8) + v79 + v30++) = 10;
            }
            int v12 = v75;
          }
          *(void *)(a2 + 56) = v30;
LABEL_68:
          uint64_t v22 = *(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24));
          *(void *)(v22 + 32) = v30;
          if (v30)
          {
            int v31 = 0;
            int v27 = v76;
            goto LABEL_72;
          }
          int v27 = v76;
          if (v76) {
            goto LABEL_37;
          }
LABEL_71:
          int v46 = v27;
          int v47 = v12;
          pcap_restart(*(void *)(a2 + 8), a2);
          int v27 = v46;
          int v12 = v47;
          size_t v30 = *(void *)(a2 + 56);
          uint64_t v22 = *(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24));
          int v31 = 1;
LABEL_72:
          unint64_t v48 = v30 + v27;
          if (v48 <= *(int *)(v22 + 24))
          {
            uint64_t v56 = *(void *)(v22 + 8);
          }
          else
          {
            int v77 = v31;
            size_t v49 = v9;
            uint64_t v50 = v12;
            size_t v51 = v48 + (v30 >> 1);
            int v52 = malloc_type_realloc(*(void **)(v22 + 8), v51, 0x6B826E7EuLL);
            uint64_t v53 = *(void *)(a2 + 40);
            uint64_t v54 = *(void *)(a2 + 24);
            *(void *)(*(void *)(v53 + 8 * v54) + 8) = v52;
            uint64_t v55 = *(void *)(v53 + 8 * v54);
            uint64_t v56 = *(void *)(v55 + 8);
            if (!v56) {
              yy_fatal_error("out of dynamic memory in yy_get_next_buffer()");
            }
            *(_DWORD *)(v55 + 24) = v51 - 2;
            unint64_t v48 = *(void *)(a2 + 56) + v79;
            int v12 = v50;
            uint64_t v9 = v49;
            int v31 = v77;
          }
          *(void *)(a2 + 56) = v48;
          *(unsigned char *)(v56 + v48) = 0;
          *(unsigned char *)(*(void *)(a2 + 56)
                   + *(void *)(*(void *)(*(void *)(a2 + 40) + 8 * *(void *)(a2 + 24)) + 8)
                   + 1) = 0;
          uint64_t v57 = *(void *)(a2 + 40);
          uint64_t v58 = *(void *)(a2 + 24);
          int v26 = *(char **)(*(void *)(v57 + 8 * v58) + 8);
          *(void *)(a2 + 136) = v26;
          uint64_t v8 = v80;
          if (v31 == 1)
          {
LABEL_77:
            *(_DWORD *)(a2 + 88) = 0;
            *(void *)(a2 + 72) = v26;
            int v59 = *(_DWORD *)(a2 + 84);
            if (v59 >= 1) {
              --v59;
            }
            int v19 = (v59 >> 1) + 190;
            unint64_t v18 = v81;
            goto LABEL_23;
          }
          if (v31)
          {
            int v25 = *(unsigned char **)(*(void *)(v57 + 8 * v58) + 8);
            uint64_t v23 = *(void *)(a2 + 56);
LABEL_83:
            *(void *)(a2 + 72) = &v25[v23];
            int v16 = yy_get_previous_state(a2);
            int v12 = *(unsigned char **)(a2 + 136);
            unsigned int v17 = (unsigned char **)(a2 + 72);
            goto LABEL_22;
          }
          *(void *)(a2 + 72) = &v26[~v78 + (int)v81];
          int v11 = yy_get_previous_state(a2);
          int v10 = *(unsigned char **)(a2 + 72);
          int v12 = *(unsigned char **)(a2 + 136);
          break;
        case 190:
          return 0;
        default:
          yy_fatal_error("fatal flex scanner internal error--no action found");
      }
      break;
    }
  }
}

double pcap_ensure_buffer_stack(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    uint64_t v3 = a1[4];
    if (a1[3] >= (unint64_t)(v3 - 1))
    {
      uint64_t v4 = v3 + 8;
      uint64_t v5 = (char *)malloc_type_realloc(v2, 8 * (v3 + 8), 0x6B826E7EuLL);
      a1[5] = v5;
      if (v5)
      {
        int v6 = &v5[8 * a1[4]];
        double result = 0.0;
        *((_OWORD *)v6 + 2) = 0u;
        *((_OWORD *)v6 + 3) = 0u;
        *(_OWORD *)int v6 = 0u;
        *((_OWORD *)v6 + 1) = 0u;
        a1[4] = v4;
        return result;
      }
LABEL_8:
      yy_fatal_error("out of dynamic memory in yyensure_buffer_stack()");
    }
  }
  else
  {
    uint64_t v8 = malloc_type_malloc(8uLL, 0x8CBA9C6CuLL);
    a1[5] = v8;
    if (!v8) {
      goto LABEL_8;
    }
    *uint64_t v8 = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 3) = xmmword_20D916050;
  }
  return result;
}

uint64_t pcap__create_buffer(uint64_t a1, int a2, uint64_t a3)
{
  int v6 = malloc_type_malloc(0x48uLL, 0x8CBA9C6CuLL);
  if (!v6
    || (v7 = (uint64_t)v6, v6[6] = a2, uint64_t v8 = malloc_type_malloc(a2 + 2, 0x8CBA9C6CuLL), (*(void *)(v7 + 8) = v8) == 0))
  {
    yy_fatal_error("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v7 + 40) = 1;
  pcap__init_buffer(v7, a1, a3);
  return v7;
}

uint64_t stou(unsigned __int8 *a1, unsigned int *a2, uint64_t a3)
{
  unsigned int v3 = *a1;
  if (*a1)
  {
    if (v3 != 48)
    {
      LOBYTE(v8) = *a1;
      uint64_t v9 = 1;
      unsigned int v3 = 0;
      while (1)
      {
        unsigned int v10 = (char)v8 - 48;
        if (v3 > 0x19999999 || v3 == 429496729 && v10 >= 6) {
          goto LABEL_28;
        }
        unsigned int v3 = v10 + 10 * v3;
        int v8 = a1[v9++];
        if (!v8) {
          goto LABEL_31;
        }
      }
    }
    unsigned int v3 = a1[1];
    if (a1[1])
    {
      if (v3 != 88 && v3 != 120)
      {
        LOBYTE(v11) = a1[1];
        uint64_t v12 = 2;
        unsigned int v3 = 0;
        while ((v11 & 0xF8) == 0x30)
        {
          if (v3 >> 29) {
            goto LABEL_28;
          }
          unsigned int v3 = (char)v11 + 8 * v3 - 48;
          int v11 = a1[v12++];
          if (!v11) {
            goto LABEL_31;
          }
        }
        bpf_set_error(a3, "number %s contains non-octal digit");
        return 375;
      }
      LOBYTE(v4) = a1[2];
      if ((_BYTE)v4)
      {
        unsigned int v3 = 0;
        uint64_t v5 = 3;
        while (!(v3 >> 28))
        {
          if ((v4 - 97) >= 6u) {
            int v6 = -55;
          }
          else {
            int v6 = -87;
          }
          if ((v4 - 48) >= 0xAu) {
            int v7 = v6;
          }
          else {
            int v7 = -48;
          }
          unsigned int v3 = v7 + (char)v4 + 16 * v3;
          int v4 = a1[v5++];
          if (!v4) {
            goto LABEL_31;
          }
        }
LABEL_28:
        bpf_set_error(a3, "number %s overflows 32 bits");
        return 375;
      }
      unsigned int v3 = 0;
    }
  }
LABEL_31:
  *a2 = v3;
  return 292;
}

uint64_t yy_get_previous_state(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 84);
  uint64_t v2 = *(unsigned char **)(a1 + 136);
  unsigned int v3 = *(unsigned char **)(a1 + 72);
  if (v2 < v3)
  {
    do
    {
      if (*v2) {
        uint64_t v4 = yy_ec[*v2];
      }
      else {
        uint64_t v4 = 1u;
      }
      if (yy_accept[(int)v1])
      {
        *(_DWORD *)(a1 + 112) = v1;
        *(void *)(a1 + 120) = v2;
      }
      uint64_t v5 = (int)v1;
      uint64_t v6 = yy_base[(int)v1] + v4;
      if (v1 != (__int16)yy_chk[v6])
      {
        do
        {
          uint64_t v5 = yy_def[v5];
          if (v5 >= 1785) {
            uint64_t v4 = *((unsigned __int8 *)&yy_meta + v4);
          }
          uint64_t v6 = yy_base[v5] + v4;
        }
        while (yy_chk[v6] != (unsigned __int16)v5);
      }
      uint64_t v1 = yy_nxt[v6];
      ++v2;
    }
    while (v2 != v3);
  }
  return v1;
}

void yy_fatal_error(const char *a1)
{
}

int *pcap_restart(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 40);
  if (v4 && (uint64_t v5 = *(void *)(a2 + 24), *(void *)(v4 + 8 * v5))
    || (pcap_ensure_buffer_stack((void *)a2),
        uint64_t buffer = pcap__create_buffer(*(void *)(a2 + 8), 0x4000, a2),
        uint64_t v5 = *(void *)(a2 + 24),
        *(void *)(*(void *)(a2 + 40) + 8 * v5) = buffer,
        (uint64_t v4 = *(void *)(a2 + 40)) != 0))
  {
    uint64_t v7 = *(void *)(v4 + 8 * v5);
  }
  else
  {
    uint64_t v7 = 0;
  }
  double result = pcap__init_buffer(v7, a1, a2);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(v9 + 8 * v10);
  *(void *)(a2 + 56) = *(void *)(v11 + 32);
  uint64_t v12 = *(unsigned char **)(v11 + 16);
  *(void *)(a2 + 72) = v12;
  *(void *)(a2 + 136) = v12;
  *(void *)(a2 + 8) = **(void **)(v9 + 8 * v10);
  *(unsigned char *)(a2 + 48) = *v12;
  return result;
}

int *pcap__init_buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *__error();
  pcap__flush_buffer(a1, a3);
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 60) = 1;
  uint64_t v7 = *(void *)(a3 + 40);
  if (v7) {
    uint64_t v7 = *(void *)(v7 + 8 * *(void *)(a3 + 24));
  }
  if (v7 != a1) {
    *(void *)(a1 + 52) = 1;
  }
  *(_DWORD *)(a1 + 44) = 0;
  double result = __error();
  *double result = v6;
  return result;
}

void pcap__switch_to_buffer(uint64_t a1, uint64_t a2)
{
  pcap_ensure_buffer_stack((void *)a2);
  uint64_t v4 = *(void *)(a2 + 40);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 24);
    uint64_t v6 = *(void *)(v4 + 8 * v5);
    if (v6 != a1)
    {
      if (v6)
      {
        **(unsigned char **)(a2 + 72) = *(unsigned char *)(a2 + 48);
        uint64_t v4 = *(void *)(a2 + 40);
        uint64_t v5 = *(void *)(a2 + 24);
        *(void *)(*(void *)(v4 + 8 * v5) + 16) = *(void *)(a2 + 72);
        *(void *)(*(void *)(v4 + 8 * v5) + 32) = *(void *)(a2 + 56);
      }
      *(void *)(v4 + 8 * v5) = a1;
      uint64_t v7 = *(void *)(a2 + 40);
      uint64_t v8 = *(void *)(v7 + 8 * v5);
      *(void *)(a2 + 56) = *(void *)(v8 + 32);
      uint64_t v9 = *(unsigned char **)(v8 + 16);
      *(void *)(a2 + 72) = v9;
      *(void *)(a2 + 136) = v9;
      *(void *)(a2 + 8) = **(void **)(v7 + 8 * v5);
      *(unsigned char *)(a2 + 48) = *v9;
      *(_DWORD *)(a2 + 88) = 1;
    }
  }
}

void *pcap_alloc(size_t a1)
{
  return malloc_type_malloc(a1, 0x8CBA9C6CuLL);
}

void pcap__delete_buffer(void **a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a2 + 40);
    if (v3) {
      uint64_t v4 = *(void ***)(v3 + 8 * *(void *)(a2 + 24));
    }
    else {
      uint64_t v4 = 0;
    }
    if (v4 == a1) {
      *(void *)(v3 + 8 * *(void *)(a2 + 24)) = 0;
    }
    if (*((_DWORD *)a1 + 10)) {
      free(a1[1]);
    }
    free(a1);
  }
}

uint64_t pcap__flush_buffer(uint64_t result, uint64_t a2)
{
  if (result)
  {
    *(void *)(result + 32) = 0;
    **(unsigned char **)(result + 8) = 0;
    *(unsigned char *)(*(void *)(result + 8) + 1) = 0;
    *(void *)(result + 16) = *(void *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    uint64_t v2 = *(void *)(a2 + 40);
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 8 * *(void *)(a2 + 24));
    }
    else {
      uint64_t v3 = 0;
    }
    if (v3 == result)
    {
      uint64_t v4 = *(void *)(a2 + 24);
      uint64_t v5 = *(void *)(v2 + 8 * v4);
      *(void *)(a2 + 56) = *(void *)(v5 + 32);
      uint64_t v6 = *(unsigned char **)(v5 + 16);
      *(void *)(a2 + 72) = v6;
      *(void *)(a2 + 136) = v6;
      *(void *)(a2 + 8) = **(void **)(v2 + 8 * v4);
      *(unsigned char *)(a2 + 48) = *v6;
    }
  }
  return result;
}

void pcap_push_buffer_state(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    pcap_ensure_buffer_stack((void *)a2);
    uint64_t v4 = *(void *)(a2 + 40);
    uint64_t v5 = *(void *)(a2 + 24);
    if (*(void *)(v4 + 8 * v5))
    {
      **(unsigned char **)(a2 + 72) = *(unsigned char *)(a2 + 48);
      uint64_t v4 = *(void *)(a2 + 40);
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(*(void *)(v4 + 8 * v6) + 16) = *(void *)(a2 + 72);
      *(void *)(*(void *)(v4 + 8 * v6) + 32) = *(void *)(a2 + 56);
      uint64_t v5 = v6 + 1;
      *(void *)(a2 + 24) = v6 + 1;
    }
    *(void *)(v4 + 8 * v5) = a1;
    uint64_t v7 = *(void *)(a2 + 40);
    uint64_t v8 = *(void *)(v7 + 8 * v5);
    *(void *)(a2 + 56) = *(void *)(v8 + 32);
    uint64_t v9 = *(unsigned char **)(v8 + 16);
    *(void *)(a2 + 72) = v9;
    *(void *)(a2 + 136) = v9;
    *(void *)(a2 + 8) = **(void **)(v7 + 8 * v5);
    *(unsigned char *)(a2 + 48) = *v9;
    *(_DWORD *)(a2 + 88) = 1;
  }
}

void pcap_pop_buffer_state(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = *(void ***)(v1 + 8 * *(void *)(a1 + 24));
    if (v3)
    {
      pcap__delete_buffer(v3, a1);
      uint64_t v4 = *(void *)(a1 + 24);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = 0;
      if (v4) {
        *(void *)(a1 + 24) = --v4;
      }
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5)
      {
        uint64_t v6 = *(void *)(v5 + 8 * v4);
        if (v6)
        {
          *(void *)(a1 + 56) = *(void *)(v6 + 32);
          uint64_t v7 = *(unsigned char **)(v6 + 16);
          *(void *)(a1 + 72) = v7;
          *(void *)(a1 + 136) = v7;
          *(void *)(a1 + 8) = **(void **)(v5 + 8 * v4);
          *(unsigned char *)(a1 + 48) = *v7;
          *(_DWORD *)(a1 + 88) = 1;
        }
      }
    }
  }
}

char *pcap__scan_buffer(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = a2 - 2;
  if (a2 < 2 || *(unsigned char *)(a1 + v3) || *(unsigned char *)(a2 + a1 - 1)) {
    return 0;
  }
  uint64_t v8 = (char *)malloc_type_malloc(0x48uLL, 0x8CBA9C6CuLL);
  if (!v8) {
    yy_fatal_error("out of dynamic memory in yy_scan_buffer()");
  }
  uint64_t v5 = v8;
  *((_DWORD *)v8 + 6) = v3;
  *((void *)v8 + 1) = a1;
  *((void *)v8 + 2) = a1;
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 4) = (int)v3;
  *((void *)v8 + 5) = 0;
  *((_DWORD *)v8 + 12) = 1;
  *(void *)(v8 + 60) = 0;
  pcap__switch_to_buffer((uint64_t)v8, a3);
  return v5;
}

char *pcap__scan_string(char *a1, uint64_t a2)
{
  uint64_t v4 = (int)strlen(a1);

  return pcap__scan_bytes(a1, v4, a2);
}

char *pcap__scan_bytes(char *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = a2 + 2;
  uint64_t v7 = malloc_type_malloc(a2 + 2, 0x8CBA9C6CuLL);
  if (!v7) {
    yy_fatal_error("out of dynamic memory in yy_scan_bytes()");
  }
  if (a2)
  {
    uint64_t v8 = v7;
    uint64_t v9 = a2;
    do
    {
      char v10 = *a1++;
      *v8++ = v10;
      --v9;
    }
    while (v9);
  }
  *(_WORD *)&v7[a2] = 0;
  double result = pcap__scan_buffer((uint64_t)v7, v6, a3);
  if (!result) {
    yy_fatal_error("bad buffer in yy_scan_bytes()");
  }
  *((_DWORD *)result + 10) = 1;
  return result;
}

uint64_t pcap_get_extra(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t pcap_get_lineno(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 && (uint64_t v2 = *(void *)(v1 + 8 * *(void *)(a1 + 24))) != 0) {
    return *(unsigned int *)(v2 + 52);
  }
  else {
    return 0;
  }
}

uint64_t pcap_get_column(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 && (uint64_t v2 = *(void *)(v1 + 8 * *(void *)(a1 + 24))) != 0) {
    return *(unsigned int *)(v2 + 56);
  }
  else {
    return 0;
  }
}

uint64_t pcap_get_in(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t pcap_get_out(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t pcap_get_leng(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t pcap_get_text(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t pcap_set_extra(uint64_t result, void *a2)
{
  *a2 = result;
  return result;
}

uint64_t pcap_set_lineno(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if (!v2 || (uint64_t v3 = *(void *)(v2 + 8 * *(void *)(a2 + 24))) == 0) {
    yy_fatal_error("yyset_lineno called with no buffer");
  }
  *(_DWORD *)(v3 + 52) = result;
  return result;
}

uint64_t pcap_set_column(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if (!v2 || (uint64_t v3 = *(void *)(v2 + 8 * *(void *)(a2 + 24))) == 0) {
    yy_fatal_error("yyset_column called with no buffer");
  }
  *(_DWORD *)(v3 + 56) = result;
  return result;
}

uint64_t pcap_set_in(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 8) = result;
  return result;
}

uint64_t pcap_set_out(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 16) = result;
  return result;
}

uint64_t pcap_get_debug(uint64_t a1)
{
  return *(unsigned int *)(a1 + 132);
}

uint64_t pcap_set_debug(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 132) = result;
  return result;
}

uint64_t pcap_get_lval(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

uint64_t pcap_set_lval(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 152) = result;
  return result;
}

uint64_t pcap_lex_init(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = malloc_type_malloc(0xA0uLL, 0x8CBA9C6CuLL);
    *a1 = (uint64_t)v2;
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t result = 0;
      v3[8] = 0u;
      v3[9] = 0u;
      v3[6] = 0u;
      v3[7] = 0u;
      v3[4] = 0u;
      v3[5] = 0u;
      v3[2] = 0u;
      v3[3] = 0u;
      _OWORD *v3 = 0u;
      v3[1] = 0u;
      uint64_t v5 = *a1;
      *(_DWORD *)(v5 + 92) = 0;
      *(_DWORD *)(v5 + 96) = 0;
      *(void *)(v5 + 104) = 0;
      *(_OWORD *)(v5 + 8) = 0u;
      *(_OWORD *)(v5 + 24) = 0u;
      *(void *)(v5 + 40) = 0;
      *(void *)(v5 + 72) = 0;
      *(void *)(v5 + 80) = 0;
      return result;
    }
    unint64_t v6 = __error();
    int v7 = 12;
  }
  else
  {
    unint64_t v6 = __error();
    int v7 = 22;
  }
  *unint64_t v6 = v7;
  return 1;
}

uint64_t pcap_lex_init_extra(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = malloc_type_malloc(0xA0uLL, 0x8CBA9C6CuLL);
    *a2 = v4;
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t result = 0;
      v5[8] = 0u;
      v5[9] = 0u;
      v5[6] = 0u;
      v5[7] = 0u;
      v5[4] = 0u;
      v5[5] = 0u;
      v5[2] = 0u;
      v5[3] = 0u;
      *uint64_t v5 = 0u;
      v5[1] = 0u;
      *(void *)*a2 = a1;
      int v7 = (void *)*a2;
      *((_DWORD *)v7 + 23) = 0;
      *((_DWORD *)v7 + 24) = 0;
      v7[13] = 0;
      *(_OWORD *)(v7 + 1) = 0u;
      *(_OWORD *)(v7 + 3) = 0u;
      v7[5] = 0;
      v7[9] = 0;
      v7[10] = 0;
      return result;
    }
    uint64_t v8 = __error();
    int v9 = 12;
  }
  else
  {
    uint64_t v8 = __error();
    int v9 = 22;
  }
  *uint64_t v8 = v9;
  return 1;
}

uint64_t pcap_lex_destroy(uint64_t a1)
{
  for (uint64_t i = *(void **)(a1 + 40); i; uint64_t i = *(void **)(a1 + 40))
  {
    if (!i[*(void *)(a1 + 24)]) {
      break;
    }
    pcap__delete_buffer((void **)i[*(void *)(a1 + 24)], a1);
    *(void *)(*(void *)(a1 + 40) + 8 * *(void *)(a1 + 24)) = 0;
    pcap_pop_buffer_state(a1);
  }
  free(i);
  *(void *)(a1 + 40) = 0;
  free(*(void **)(a1 + 104));
  free((void *)a1);
  return 0;
}

void *pcap_realloc(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x6B826E7EuLL);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x270ED7EF0]();
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x270ED86D8](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void clearerr(FILE *a1)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void errx(int a1, const char *a2, ...)
{
}

int ether_hostton(const char *a1, ether_addr *a2)
{
  return MEMORY[0x270ED97B8](a1, a2);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270ED9B20](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

int getc(FILE *a1)
{
  return MEMORY[0x270ED9BC0](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x270ED9C48](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

netent *__cdecl getnetbyname(const char *a1)
{
  return (netent *)MEMORY[0x270ED9CB0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

protoent *__cdecl getprotobyname(const char *a1)
{
  return (protoent *)MEMORY[0x270ED9D08](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

void if_freenameindex(if_nameindex *a1)
{
}

if_nameindex *if_nameindex(void)
{
  return (if_nameindex *)MEMORY[0x270ED9E78]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x270ED9F60](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x270ED9F90]();
}

void longjmp(jmp_buf a1, int a2)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x270EDA8A8]();
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x270EDA8B0]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x270EDA8B8]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x270EDA8C0]();
}

uint64_t os_channel_available_slot_count()
{
  return MEMORY[0x270EDA8C8]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x270EDA8D0]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x270EDA8D8]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x270EDA8E0]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x270EDA8E8]();
}

uint64_t os_channel_ring_id()
{
  return MEMORY[0x270EDA8F0]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x270EDA8F8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x270EDB3F8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB5A0](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

void warnx(const char *a1, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}