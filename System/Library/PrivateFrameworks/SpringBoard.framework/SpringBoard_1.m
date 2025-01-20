uint64_t sub_1D8EFA86C(int a1, uint64_t a2, void *a3, int a4, uint64_t a5, int a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  unsigned int v25;
  unsigned int v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  BOOL v35;
  unint64_t v36;

  v35 = v25 > v30;
  v36 = (*(_DWORD *)(a25 + 4 * (v34 + a1)) ^ v26)
      + HIDWORD(v28)
      + a7 * (unint64_t)(*(_DWORD *)(*a3 + 4 * (v34 + a1)) ^ v26);
  *(_DWORD *)(a25 + 4 * ((a6 ^ v31 ^ (a1 + 946)) + v34)) = v36 + v26 - (v27 & (2 * v36));
  if (v35 == v34 + v32 < v33) {
    v35 = v34 + v32 < a4;
  }
  return (*(uint64_t (**)(void))(v29 + 8 * ((2 * !v35) | (!v35 << 6) | a6)))();
}

uint64_t sub_1D8EFA8FC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((1604 * (v1 - 1755777584 < ((v0 + 116) ^ 0xFFFFFEE7))) ^ v0)))();
}

uint64_t sub_1D8EFA938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(_DWORD *)(v16 - 112) = (v13 + 1429) ^ (1755732067
                                         * ((((v16 - 144) | 0x4C54933A) - (v16 - 144) + ((v16 - 144) & 0xB3AB6CC0)) ^ 0x92922EE1));
  *(void *)(v16 - 104) = v11;
  *(void *)(v16 - 144) = v11;
  *(void *)(v16 - 136) = v12;
  *(void *)(v16 - 128) = v14;
  *(void *)(v16 - 120) = a10;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v10 + 8 * (v13 ^ 0x66C)))(v16 - 144);
  return (*(uint64_t (**)(uint64_t))(v10
                                            + 8
                                            * ((452 * (v15 - 1 < (v13 + 2147483170))) ^ (v13 + 1251))))(v17);
}

uint64_t sub_1D8EFA9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26,uint64_t a27,unsigned __int8 a28,unint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  return sub_1D8EC5758(a2, 3102594147, a5, a6, a7, a8, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

void sub_1D8EFA9F4()
{
  int v1 = (const float *)(v0 + 908);
  vld1q_dup_f32(v1);
  JUMPOUT(0x1D8EFAA18);
}

uint64_t sub_1D8EFAADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v10 = LODWORD(STACK[0x47C]) - v7 == 1388428834 && v6 != v5 + 782 + a5;
  return (*(uint64_t (**)(void))(v8 + 8 * ((109 * v10) ^ v5)))();
}

uint64_t sub_1D8EFAB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,uint64_t a58)
{
  *(_DWORD *)(v61 + 360) = 1755777584;
  uint64_t v65 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t *, unint64_t, void, uint64_t, unint64_t *, unint64_t *))(v63 + 8 * (v58 ^ 0x6E8)))(v60, 2, &STACK[0x434], STACK[0x480], (v59 - 1576401730), a6, &STACK[0x4D8], &STACK[0x5C4]);
  int v67 = ((2 * v65) & 0xFEFF9FE8) + (v65 ^ 0x7F7FCFF4);
  if (v67 == -1887449097)
  {
    LODWORD(STACK[0x4E8]) = 1008845312;
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v63
                                                                                  + 8
                                                                                  * (((STACK[0x4D8] == 0)
                                                                                    * (((3 * (v62 ^ 0x80)) ^ 0x569) - 416)) ^ (v62 + 135))))(v65, STACK[0x4D8], v66, 1008845537);
  }
  else
  {
    if (v67 == 2139082740)
    {
      STACK[0x388] = STACK[0x4D8];
      LODWORD(STACK[0x380]) = STACK[0x5C4];
      JUMPOUT(0x1D8ECF1CCLL);
    }
    int v69 = 1224239923 * ((((2 * (v64 - 200)) | 0x81022F18) - (v64 - 200) - 1082201996) ^ 0xB232EA5B);
    *(_DWORD *)(v64 - 184) = v69 + v62 + 1225;
    *(void *)(v64 - 192) = a58;
    *(_DWORD *)(v64 - 200) = v67
                           - v69
                           + 1147062597
                           + ~(2 * ((v67 + 8400908) & a57 ^ ((v65 ^ 0xF4) + 4) & 7));
    uint64_t v70 = (*(uint64_t (**)(uint64_t))(v63 + 8 * (v62 + 1791)))(v64 - 200);
    return (*(uint64_t (**)(uint64_t))(v63
                                              + 8
                                              * (((STACK[0x4D8] == 0) * (((3 * (v62 ^ 0x80)) ^ 0x569) - 416)) ^ (v62 + 135))))(v70);
  }
}

void sub_1D8EFAD1C()
{
}

void sub_1D8EFAD40(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 16) - 1225351577 * ((-2 - ((a1 | 0xFF7726BA) + (~a1 | 0x88D945))) ^ 0x23120153);
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned int v6 = v1 - 1755732067 * ((((2 * &v4) | 0xE2B1507C) - &v4 - 1901635646) ^ 0xAF9E15E5) + 1001;
  uint64_t v5 = v2;
  v3 = (char *)*(&off_1F3082620 + (v1 ^ 0x4A)) - 4;
  (*(void (**)(int *))&v3[8 * (v1 ^ 0x712)])(&v4);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1D8EFAE9C(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((713 * (v4 - 715497359 + ((a3 + 170) ^ 0x1D4) >= 0)) ^ a3)))();
}

void sub_1D8EFAEE0()
{
}

uint64_t sub_1D8EFAEF4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  int v10 = *(_DWORD *)(v9 - 252 + ((v7 + v5) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a4 + (v7 + v5)) = (HIBYTE(v10) ^ 0xB6)
                                           - ((((v6 + a3) & 0xB2) + 6) & (2 * (HIBYTE(v10) ^ 0xB6)))
                                           + 84;
  *(unsigned char *)(a4 + (v7 + v5 + 2)) = (BYTE1(v10) ^ 0x3D) - ((2 * (BYTE1(v10) ^ 0x3D)) & 0xA8) + 84;
  *(unsigned char *)(a4 + (v7 + v5 + 1)) = (BYTE2(v10) ^ 0xDE)
                                               + ~(2 * ((BYTE2(v10) ^ 0xDE) & 0x55 ^ BYTE2(v10) & 1))
                                               + 85;
  *(unsigned char *)(a4 + (v7 + v5 + 3)) = v10 ^ 0x34;
  unsigned int v11 = *(_DWORD *)(v9 - 160) + 2054455463;
  BOOL v12 = v11 < v4;
  BOOL v13 = v7 + 1352640557 < v11;
  if (v7 + 1352640557 < v4 != v12) {
    BOOL v13 = v12;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((1540 * v13) ^ v6)))();
}

uint64_t sub_1D8EFAFF0()
{
  unsigned int v5 = (v0 + 1494780780) & 0xA6E771DF;
  *uint64_t v2 = v2[623];
  uint64_t v6 = 1225351577
     * ((~((v4 - 200) | 0x54B59BECDD5CA8C0) + ((v4 - 200) & 0x54B59BECDD5CA8C0)) ^ 0x46DCCC4B01398F29);
  *(void *)(v4 - 184) = (v1 - 570597186) ^ (unint64_t)v6;
  *(void *)(v4 - 168) = v6 ^ 0xF1260384;
  *(_DWORD *)(v4 - 200) = v5 + 519880957 - v6 + 205;
  *(_DWORD *)(v4 - 192) = v6 + v5 + 519880957 + 80;
  *(_DWORD *)(v4 - 188) = v6;
  *(_DWORD *)(v4 - 176) = (v5 + 519880957) ^ v6;
  *(_DWORD *)(v4 - 172) = (v5 - 1689051783) ^ v6;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v3 + 8 * (int)(v5 ^ 0x6A0)))(v4 - 200);
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * *(int *)(v4 - 196)))(v7);
}

uint64_t sub_1D8EFB0E8@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)((((a1 + 1095361909) & 0xBEB61DDE ^ 0x4C7)
                                     * ((unint64_t)(v3 - a2 - 0x7C014C707EC20828 + v2) > 0xF)) ^ a1)))();
}

void sub_1D8EFB150()
{
}

uint64_t sub_1D8EFB158()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((474 * (v3 + 1 == v2 + 32)) ^ v0)))((v0 - 1242988316) & 0x4A167AFF);
}

uint64_t sub_1D8EFB234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int a37)
{
  v41 = (unsigned __int8 *)(a4 + a2 + v40);
  int v42 = *v41 ^ 0x54;
  LODWORD(v41) = ((*(unsigned __int8 *)(a4 + ((a37 - 177) ^ (unint64_t)(v40 - 14)) + a2) ^ 0x54) << 16) | ((v41[3] ^ 0x54) << 24) | v42 | ((v41[1] ^ 0x54) << 8);
  *(_DWORD *)(v38 + ((a2 + v40) & 0xFFFFFFFFFFFFFFFCLL)) = v41
                                                         + v37
                                                         - 2 * (v41 & 0x43DE993B ^ v42 & 3);
  return (*(uint64_t (**)(void))(v39 + 8 * ((2001 * ((unint64_t)(a2 + 4 + v40) < 0x40)) ^ a37)))();
}

void sub_1D8EFB2DC(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(a1 - 0x774B811B42847B1FLL) + 4 * (v6 + v4)) = v2
                                                                        - 1875394368
                                                                        + ~((2 * v2 + 1414843374) & v5);
  *(_DWORD *)(a1 - 0x774B811B42847B23) = (((v6 + ((v3 + 1376478882) & 0xADF497FD) - 988 + v4) * (v1 - 731987366)) ^ 0x6AA5DBFF)
                                         - 1073758472
                                         + ((2 * (v6 + ((v3 + 1376478882) & 0xADF497FD) - 988 + v4) * (v1 - 731987366)) & 0xD54BB7FE);
}

void sub_1D8EFB3C8(uint64_t a1)
{
  int v2 = (unint64_t *)*(&off_1F3082620
                           + ((107 * ((qword_1EA8BEAE8 - dword_1EA8BEA60) ^ 0x58)) ^ byte_1D8FDC6E0[byte_1D8FD8A20[(107 * ((qword_1EA8BEAE8 - dword_1EA8BEA60) ^ 0x58))] ^ 0x61])
                           - 152);
  int v3 = (unint64_t *)*(&off_1F3082620
                           + (*((unsigned char *)off_1F30828B8
                                               + (*((unsigned __int8 *)off_1F3082950
                                                  + (107 * ((qword_1EA8BEAE8 + *v2) ^ 0x58))) ^ 0x53u)
                                               - 12) ^ (107 * ((qword_1EA8BEAE8 + *v2) ^ 0x58)))
                           - 140);
  unint64_t v4 = *v2 - (void)&v8 + *v3;
  unint64_t v5 = (139864171 * v4) ^ 0x945BD3199FE9FF58;
  unint64_t v6 = 139864171 * (v4 ^ 0x945BD3199FE9FF58);
  *int v2 = v5;
  unint64_t *v3 = v6;
  LODWORD(v3) = *(_DWORD *)v2;
  uint64_t v7 = (char *)*(&off_1F3082620
               + ((107 * (dword_1EA8BEA60 ^ 0x58 ^ qword_1EA8BEAE8)) ^ byte_1D8FDF640[byte_1D8FDC5E0[(107 * (dword_1EA8BEA60 ^ 0x58 ^ qword_1EA8BEAE8))] ^ 0x9D])
               + 91)
     - 4;
  (*(void (**)(void, uint64_t (*)()))&v7[8
                                                   * (*((unsigned char *)off_1F3082658
                                                                       + (*((unsigned __int8 *)off_1F30829D0
                                                                          + (107
                                                                                            * ((v6 + (_BYTE)v3) ^ 0x58))
                                                                          - 8) ^ 0xADu)) ^ (107
                                                                                          * ((v6 + (_BYTE)v3) ^ 0x58)))
                                                   + 15216])(*(&off_1F3082620+ (*((unsigned char *)off_1F3082818+ (*((unsigned __int8 *)off_1F3082A80+ (107 * (v3 ^ 0x58 ^ v6))- 12) ^ 0x90u)) ^ (107 * (v3 ^ 0x58 ^ v6)))- 56), sub_1D8EF1318);
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1D8EFB5B8()
{
  uint64_t v6 = *v9;
  int v7 = 1755732067 * ((v5 - 144) ^ 0xDEC6BDDB);
  *(_DWORD *)(v5 - 144) = v4 - v7 - 776;
  *(_DWORD *)(v5 - 128) = v7 ^ 0x4B8F258;
  *(void *)(v5 - 136) = v10;
  (*(void (**)(uint64_t))(v0 + 8 * (v4 + 284)))(v5 - 144);
  *(_DWORD *)(v5 - 112) = (v4 + 178) ^ v7;
  *(void *)(v5 - 104) = v1;
  *(void *)(v5 - 128) = v3;
  *(void *)(v5 - 120) = v10;
  *(void *)(v5 - 144) = v1;
  *(void *)(v5 - 136) = v2;
  (*(void (**)(uint64_t))(v0 + 8 * (v4 ^ 0x171)))(v5 - 144);
  *(_DWORD *)(v5 - 128) = v4 + 1374699841 * ((2 * ((v5 - 144) & 0x575707B0) - (v5 - 144) + 682162248) ^ 0x455CE041) - 28;
  *(void *)(v5 - 144) = v6;
  *(void *)(v5 - 136) = v1;
  return (*(uint64_t (**)(uint64_t))(v0 + 8 * (v4 + 250)))(v5 - 144);
}

uint64_t sub_1D8EFB6D4@<X0>(char a1@<W3>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  unint64_t v7 = a3 + v4;
  *(unsigned char *)(v7 + a2 - 1) = a1;
  return (*(uint64_t (**)(void))(v6 + 8 * (int)(((v7 < 0x38) * v5) ^ (v3 + 520897603) & 0xE0F3BABA)))();
}

uint64_t sub_1D8EFB720()
{
  BOOL v5 = v0 < v4;
  if (v5 == v2 - 0x2AB8BA7D19F7BB1DLL < v4) {
    BOOL v5 = v2 - 0x2AB8BA7D19F7BB1DLL < v0;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((v1 - 19) ^ (60 * v5))))();
}

uint64_t sub_1D8EFB78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(unsigned char *)(v8 - 252 + v5 - 539915761) = 84;
  return (*(uint64_t (**)(void))(v7 + 8 * ((1932 * ((unint64_t)(v5 - 539915760) < 0x40)) ^ (a5 + v6 + 493))))();
}

uint64_t sub_1D8EFB7D8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((19 * (v0 + 1 != v3 + 4)) ^ v1)))();
}

uint64_t sub_1D8EFB8AC@<X0>(int a1@<W8>)
{
  *(unsigned char *)(*v1 + (v2 + v6)) = *(unsigned char *)(*v1 + (v6 + v4));
  return (*(uint64_t (**)(void))(v7 + 8 * (((v6 - 1 == v3) * v5) ^ a1)))();
}

uint64_t sub_1D8EFB8E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((((2 * ((v5 - 438502617) & 0x1A2305EF ^ 0x6FB)) ^ 0x487) * (v4 == a4)) ^ v5)))();
}

uint64_t sub_1D8EFB928()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1583
                                * ((((*(unsigned __int8 *)(v3 + 8) - 5) << (-27 * (v2 ^ 0xEE) + 82)) & v1)
                                 + ((*(unsigned __int8 *)(v3 + 8) - 5) ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_1D8EFB974@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8 * ((((a1 + ((v2 - 299948837) & 0x11E0D7FA) - 378) ^ (a1 - 584)) * (a2 == v3)) ^ v2)))();
}

uint64_t sub_1D8EFB9C0()
{
  int v3 = (v1 - 1625756520) & 0x60E7169D;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((63
                                * ((((((v3 ^ 0xFFFFF96B) & v0)
                                    - ((2 * ((v3 ^ 0xFFFFF96B) & v0)) & 0x25299ECA)
                                    + 311742309) << (8 * (((v3 + 109) | 0x82) ^ 0x30) + 105)) & 0x6FBFFEB0 ^ 0x25299E80)
                                 + ((((v3 ^ 0xFFFFF96B) & v0) - ((2 * ((v3 ^ 0xFFFFF96B) & v0)) & 0x25299ECA) + 311742309) ^ 0xE54B303D)
                                 + 1534981104 == 1398666056)) ^ v3)))();
}

uint64_t sub_1D8EFBA80(int a1)
{
  return (*(uint64_t (**)(void))(v2 + 8
                                   * ((1013 * (((((v1 + 1176516070) & 0xB9DFC57D) - 329) & a1) == v1 - 1517)) ^ v1)))();
}

uint64_t sub_1D8EFBACC()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 ^ 0x15B) * (v0 == v2 - 1413654045)) ^ v1)))();
}

uint64_t sub_1D8EFBB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned char *a20)
{
  v23 = *(unsigned char **)(a8 + 96);
  v23[1167] = a20[19];
  v23[1166] = a20[18];
  v23[1165] = a20[17];
  v23[1164] = a20[16];
  v23[1163] = a20[15];
  v23[1162] = a20[14];
  v23[1161] = a20[13];
  v23[1160] = a20[12];
  v23[1159] = a20[11];
  v23[1158] = a20[10];
  v23[1157] = a20[9];
  v23[1156] = a20[8];
  v23[1155] = a20[7];
  v23[1154] = a20[6];
  v23[1153] = a20[5];
  v23[1152] = a20[4];
  v23[1151] = a20[3];
  v23[1150] = a20[2];
  v23[1149] = a20[1];
  v23[1148] = *a20;
  return (*(uint64_t (**)(uint64_t))(v21
                                            + 8
                                            * (((a5 + ((((v20 - 616) | 0x218) - 502758873) | 0x5914918) - 87)
                                              * (*(_DWORD *)(a8 + 72) == a6)) ^ (((v20 - 616) | 0x218) + 521))))(v22);
}

void sub_1D8EFBC28()
{
  int v1 = (const float *)(v0 + 908);
  vld1q_dup_f32(v1);
  JUMPOUT(0x1D8EFBC9CLL);
}

void sub_1D8EFBD54(uint64_t a1)
{
  int v1 = 460628867 * ((((2 * a1) | 0xC002B2F8) - a1 - 1610701180) ^ 0x2C97DB01);
  int v2 = *(_DWORD *)(a1 + 8) ^ v1;
  int v3 = *(_DWORD *)(a1 + 32) ^ v1;
  BOOL v5 = (v3 & 0x30000000) != 0x20000000 && (v3 & 0x3F000000) != 50331648;
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1D8EFBE34@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t a21,uint64_t (*a22)(uint64_t))
{
  int v26 = v22 ^ 0x26;
  *(unsigned char *)(a1 + (a3 + 2)) = *(unsigned char *)(a2 + (v22 ^ 0x832C3B78) + v23);
  int v27 = 535753261 * ((((2 * (v25 - 168)) | 0xC4187D24) - (v25 - 168) - 1644969618) ^ 0x68F830BD);
  *(_DWORD *)(v25 - 160) = 753493626 - v27;
  *(_DWORD *)(v25 - 156) = (v26 + 36) ^ v27;
  STACK[0x358] = a21;
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(v24 + 8 * (v26 ^ 0x7CC)))(v25 - 168);
  return a22(v28);
}

uint64_t sub_1D8EFBF30@<X0>(uint64_t a1@<X8>)
{
  return sub_1D8EFBFCC(a1 - 0x774B811B42847B1FLL, (v1 - 1845666039), 1845666171, 0x775FFFBFF0F9EF9FLL, 0x1E1F3DF3ELL, 0x9BBDF77B7FDE3EE4, 1494974883, 1087979611);
}

uint64_t sub_1D8EFBFCC(void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v19 = 4 * (v17 + v14);
  int v20 = v8 + v11 + (*(_DWORD *)(*v12 + v19) ^ v15) - (*(_DWORD *)(*v13 + v19) ^ (v15 + (a2 & a3) - 355));
  *(_DWORD *)(*a1 + v19) = v20 + v15 - (v18 & (2 * v20));
  BOOL v22 = v17 + a7 < a8 && v17 + a7 >= v10;
  return (*(uint64_t (**)(void))(v16 + 8 * ((56 * v22) ^ v9)))();
}

uint64_t sub_1D8EFC054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v71 = *(unsigned __int8 *)(v68 - 0x7C014C707EC207C8) ^ 0xDB;
  if (v71 == 1)
  {
    unsigned int v80 = *(_DWORD *)(v68 - 0x7C014C707EC207E4);
    *(unsigned char *)(v68 - 0x7C014C707EC207F0) = ((8 * v80) ^ 0xF0) - ((2 * ((8 * v80) ^ 0xF0)) & 0xAA) + 84;
    char v79 = -88;
    *(unsigned char *)(v68 - 0x7C014C707EC207EFLL) = ((v69 - 115) ^ (v80 >> 5)) - ((2 * ((v69 - 115) ^ (v80 >> 5))) & 0xA8) + 84;
    *(unsigned char *)(v68 - 0x7C014C707EC207EELL) = ((v80 >> 13) ^ 0xE0)
                                           - 2 * (((v80 >> 13) ^ 0xE0) & 0x56 ^ (v80 >> 13) & 2)
                                           + 84;
    *(unsigned char *)(v68 - 0x7C014C707EC207EDLL) = ((v80 >> 21) ^ 0x59) - ((2 * ((v80 >> 21) ^ 0x59)) & 0xA8) + 84;
    unsigned int v81 = *(_DWORD *)(v68 - 0x7C014C707EC207E8);
    HIDWORD(v82) = v81 ^ 3;
    LODWORD(v82) = ~v80;
    *(unsigned char *)(v68 - 0x7C014C707EC207ECLL) = (v82 >> 29) + (~(2 * (v82 >> 29)) | 0x57) + 85;
    int v77 = v69 + 1668;
    *(unsigned char *)(v68 - 0x7C014C707EC207EBLL) = ((v81 >> 5) ^ 0x48)
                                           + ~(2 * (((v81 >> 5) ^ 0x48) & 0x57 ^ (v81 >> 5) & 3))
                                           + 85;
    *(unsigned char *)(v68 - 0x7C014C707EC207EALL) = ((v81 >> 13) ^ 0x41) - ((2 * ((v81 >> 13) ^ 0x41)) & 0xA8) + 84;
    unsigned int v78 = (v81 >> 21) ^ 0xFFFFFFD7;
  }
  else
  {
    int v72 = v69;
    if (v71 != 2) {
      goto LABEL_6;
    }
    unsigned int v73 = *(_DWORD *)(v68 - 0x7C014C707EC207E8);
    char v74 = ((v73 >> 5) ^ 0x48) - 2 * (((v73 >> 5) ^ 0x48) & 0x57 ^ (v73 >> 5) & 3);
    unsigned int v75 = *(_DWORD *)(v68 - 0x7C014C707EC207E4);
    HIDWORD(v76) = v73 ^ 3;
    LODWORD(v76) = ~v75;
    *(unsigned char *)(v68 - 0x7C014C707EC207F0) = ((v73 >> 21) ^ 0xD7) - ((2 * ((v73 >> 21) ^ 0xD7)) & 0xA8) + 84;
    *(unsigned char *)(v68 - 0x7C014C707EC207EFLL) = ((v73 >> 13) ^ 0x41)
                                           - 2 * (((v73 >> 13) ^ 0x41) & (v69 + 61) ^ (v73 >> 13) & 2)
                                           + 84;
    int v77 = v69 + 1668;
    *(unsigned char *)(v68 - 0x7C014C707EC207EELL) = v74 + 84;
    *(unsigned char *)(v68 - 0x7C014C707EC207EDLL) = (v76 >> 29) - ((2 * (v76 >> 29)) & 0xA8) + 84;
    *(unsigned char *)(v68 - 0x7C014C707EC207ECLL) = ((v75 >> 21) ^ 0x59)
                                           - 2 * (((v75 >> 21) ^ 0x59) & 0x56 ^ (v75 >> 21) & 2)
                                           + 84;
    *(unsigned char *)(v68 - 0x7C014C707EC207EBLL) = ((v75 >> 13) ^ 0xE0)
                                           - 2 * (((v75 >> 13) ^ 0xE0) & 0x55 ^ ((v75 & 0x2000) != 0))
                                           + 84;
    LOBYTE(v78) = (8 * v75) ^ 0xF0;
    char v79 = -96;
    *(unsigned char *)(v68 - 0x7C014C707EC207EALL) = ((v75 >> 5) ^ 0xA6)
                                           - 2 * (((v75 >> 5) ^ 0xA6) & 0x55 ^ ((v75 & 0x20) != 0))
                                           + 84;
  }
  int v72 = (v77 - 1677) | 9;
  *(unsigned char *)(v68 - 0x7C014C707EC207E9) = v78 - (v79 & (2 * v78)) + (v72 ^ 0x4D);
LABEL_6:
  STACK[0x508] = *(void *)(v70 + 8 * (v72 - 269));
  STACK[0x638] = v68;
  STACK[0x640] = v68 - 0x7C014C707EC20828;
  unint64_t v83 = STACK[0x5B0];
  v84 = (char *)&a9 + STACK[0x5B0] - 0x61CB92A9D1FA177FLL;
  STACK[0x648] = (unint64_t)v84;
  STACK[0x5B0] = v83 + 320;
  int v85 = *(_DWORD *)(v68 + a8);
  LODWORD(STACK[0x5A4]) = v85;
  int v86 = *(_DWORD *)(v68 - 0x7C014C707EC207DCLL);
  LODWORD(STACK[0x584]) = v86;
  int v87 = *(_DWORD *)(v68 - 0x7C014C707EC207D8);
  LODWORD(STACK[0x5F4]) = v87;
  int v88 = *(_DWORD *)(v68 - 0x7C014C707EC207D4);
  LODWORD(STACK[0x54C]) = v88;
  int v89 = *(unsigned __int8 *)(v68 - 0x7C014C707EC207C8) ^ 0xDB;
  if (v89 == 2)
  {
    LODWORD(STACK[0x4B0]) = *(_DWORD *)(v68 - 0x7C014C707EC207D0);
    LODWORD(STACK[0x524]) = 1417906743;
    return (*(uint64_t (**)(uint64_t))(v70 + 8 * ((734 * (v69 != 0x159)) ^ v69 ^ 0x475)))(253);
  }
  else if (v89 == 1)
  {
    STACK[0x3F8] = v83 + 320;
    LODWORD(STACK[0x524]) = v67;
    BOOL v91 = v68 - 0x7C014C707EC20828 >= a67 + v83 || (unint64_t)v84 >= v68 - 0x7C014C707EC207E8;
    return (*(uint64_t (**)(void))(v70 + 8 * ((((LODWORD(STACK[0x364]) + 8) ^ (v69 + 194)) * v91) | (v69 + 1195))))();
  }
  else
  {
    unsigned int v93 = (*(_DWORD *)(v68 + a8) ^ 0xB6DE3D60) + (v85 ^ 0xB6DE3D60);
    *(_DWORD *)(v68 + a8) = v93 - 1226949280 - ((2 * v93) & 0x6DBC7AC0);
    unsigned int v94 = (*(_DWORD *)(v68 - 0x7C014C707EC207DCLL) ^ 0xB6DE3D60) + (v86 ^ 0xB6DE3D60);
    *(_DWORD *)(v68 - 0x7C014C707EC207DCLL) = v94 - 1226949280 - ((2 * v94) & 0x6DBC7AC0);
    unsigned int v95 = (*(_DWORD *)(v68 - 0x7C014C707EC207D8) ^ 0xB6DE3D60) + (v87 ^ 0xB6DE3D60);
    *(_DWORD *)(v68 - 0x7C014C707EC207D8) = v95 - 1226949280 - ((2 * v95) & 0x6DBC7AC0);
    unsigned int v96 = (*(_DWORD *)(v68 - 0x7C014C707EC207D4) ^ 0xB6DE3D60) + (v88 ^ 0xB6DE3D60);
    *(_DWORD *)(v68 - 0x7C014C707EC207D4) = v96 - 1226949280 - ((2 * v96) & 0x6DBC7AC0);
    STACK[0x5B0] = v83;
    return ((uint64_t (*)(void))STACK[0x508])();
  }
}

void sub_1D8EFC3FC()
{
}

void mm0Euuzhc()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *(&off_1F3082620
       + ((107 * ((qword_1EA8BEAE8 + dword_1EA8BF698) ^ 0x58)) ^ byte_1D8FD8B20[byte_1D8FE2990[(107 * ((qword_1EA8BEAE8 + dword_1EA8BF698) ^ 0x58))] ^ 0xA7])
       - 138);
  unsigned __int8 v1 = 107 * (*v0 ^ qword_1EA8BEAE8 ^ 0x58);
  int v2 = *(&off_1F3082620
       + (*((unsigned char *)off_1F3082A98 + (*((unsigned __int8 *)off_1F3082870 + v1 - 4) ^ 0x61u)) ^ v1)
       - 91);
  unint64_t v3 = (unint64_t)&v5[*v2 - *v0];
  *uint64_t v0 = 139864171 * v3 + 0x12F84548EE4379C8;
  *int v2 = 139864171 * (v3 ^ 0x945BD3199FE9FF58);
  v6[1] = -504207030 - 1734042137 * (((v6 | 0x8FC1DD99) + (~v6 | 0x703E2266)) ^ 0xD30F1ED5);
  LOBYTE(v2) = 107 * ((*(_DWORD *)v2 + *(_DWORD *)v0) ^ 0x58);
  uint64_t v4 = (char *)*(&off_1F3082620
               + ((107 * ((qword_1EA8BEAE8 - dword_1EA8BF698) ^ 0x58)) ^ byte_1D8FD8B20[byte_1D8FE2990[(107 * ((qword_1EA8BEAE8 - dword_1EA8BF698) ^ 0x58))] ^ 0xA7])
               - 56)
     - 4;
  (*(void (**)(_DWORD *))&v4[8
                                      * (*((unsigned char *)off_1F30828B8
                                                          + (*((unsigned __int8 *)off_1F3082950 + v2) ^ 0xF2u)
                                                          - 12) ^ v2)
                                      + 15768])(v6);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1D8EFC620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v7
                                                                                        + 8
                                                                                        * ((((v5 & 8) == ((v6 - 364) ^ 0x21D))
                                                                                          * ((v6 - 764406858) & 0x2D8FECFE ^ 0x41E)) | v6)))(a1, a2, a3, a4, a5, (a4 - a5));
}

uint64_t sub_1D8EFC670@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  *(unsigned char *)(a1 + v3 + v4) = v5;
  return (*(uint64_t (**)(void))(v6 + 8 * ((((unint64_t)(v3 + 1 + v4) > 0x3F) * a2) ^ v2)))();
}

uint64_t sub_1D8EFC69C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,uint64_t a25,uint64_t a26,unsigned __int8 a27,unint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int a37)
{
  return sub_1D8EC5758(a1, a2, a3, a4, a5, a6, a7 + 34, a8, a9, a10, a11, a12, a13, a14, v37 - 204, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37);
}

uint64_t sub_1D8EFC6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, unsigned int a16)
{
  a14 = v16;
  a15 = a10;
  a16 = 3804331 * (((&a13 | 0x3E79ACC6) - (&a13 & 0x3E79ACC6)) ^ 0xC4E75F90) + 795;
  uint64_t v19 = (*(uint64_t (**)(int *))(v18 + 16336))(&a13);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((500 * (a13 == v17)) ^ 0x631u)))(v19);
}

void sub_1D8EFC75C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 1734042137 * ((2 * (a1 & 0xD46ACE1E) - a1 + 731197921) ^ 0x775BF2AC);
  __asm { BRAA            X12, X17 }
}

uint64_t sub_1D8EFC86C()
{
  unsigned int v3 = LODWORD(STACK[0x47C]) + 519180286;
  unsigned int v4 = v0 + 487 + v1 + 1907607702;
  int v5 = (v4 < 0xCFA9C962) ^ (v3 < (((v0 - 799) | 0x42) ^ 0xCFA9C9A4));
  BOOL v6 = v3 < v4;
  if (v5) {
    BOOL v6 = v4 < 0xCFA9C962;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((116 * !v6) ^ v0)))();
}

uint64_t sub_1D8EFC8EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  int v31 = v30 - 144;
  *(void *)(v30 - 144) = a22;
  *(_DWORD *)(v30 - 136) = v27
                         + 7
                         - 1374699841 * ((~((v30 - 144) | 0xE767908B) + ((v30 - 144) & 0xE767908B)) ^ 0x756C777D);
  *(void *)(v30 - 112) = v29;
  *(void *)(v30 - 128) = a22;
  *(void *)(v30 - 120) = a24;
  (*(void (**)(uint64_t))(v25 + 8 * (v27 + 770)))(v30 - 144);
  *(_DWORD *)(v30 - 136) = v27
                         + 7
                         - 1374699841
                         * (((((v30 - 144) | 0xB16E66B2) ^ 0xFFFFFFFE) - (~(v30 - 144) | 0x4E91994D)) ^ 0x23658144);
  *(void *)(v30 - 144) = a22;
  *(void *)(v30 - 120) = a24;
  *(void *)(v30 - 112) = v29;
  *(void *)(v30 - 128) = a22;
  (*(void (**)(uint64_t))(a25 + 8 * (v27 ^ 0x31E)))(v30 - 144);
  *(void *)(v30 - 144) = a22;
  *(void *)(v30 - 120) = a24;
  *(void *)(v30 - 112) = v29;
  *(_DWORD *)(v30 - 136) = v27
                         + 7
                         - 1374699841 * ((((v30 - 144) | 0xD70F159B) - ((v30 - 144) & 0xD70F159B)) ^ 0xBAFB0D92);
  *(void *)(v30 - 128) = a22;
  (*(void (**)(uint64_t))(a25 + 8 * (v27 ^ 0x31E)))(v30 - 144);
  int v32 = 460628867 * (((v31 | 0x26BC37B0) - (v31 & 0x26BC37B0)) ^ 0x6A2AB5CD);
  *(_DWORD *)(v30 - 128) = v27 - 900 + v32;
  *(void *)(v30 - 136) = v26;
  *(_DWORD *)(v30 - 144) = v32 + v28 - 1999839576;
  (*(void (**)(uint64_t))(a25 + 8 * (v27 ^ 0x32B)))(v30 - 144);
  BOOL v33 = *(_DWORD *)(v30 - 140) == -1022760981;
  unsigned int v34 = 460628867 * (((v31 | 0x8A6259B2) - (v31 & 0x8A6259B2)) ^ 0xC6F4DBCF);
  *(_DWORD *)(v30 - 128) = v27 - 900 + v34;
  *(_DWORD *)(v30 - 144) = v28 - 1999839576 + v34 - 1;
  *(void *)(v30 - 136) = v26;
  uint64_t v35 = (*(uint64_t (**)(uint64_t))(a25 + 8 * (v27 + 791)))(v30 - 144);
  return (*(uint64_t (**)(uint64_t))(a25 + 8 * ((28 * (((v27 + 51) ^ v33) & 1)) ^ v27)))(v35);
}

void sub_1D8EFCB34()
{
}

uint64_t sub_1D8EFCBA4@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  LODWORD(STACK[0x520]) = v2 - 10;
  unint64_t v4 = STACK[0x510];
  unint64_t v5 = LODWORD(STACK[0x4BC]);
  STACK[0x4A0] = v5;
  return (*(uint64_t (**)(uint64_t, unint64_t))(v3
                                                              + 8
                                                              * (((v5 == ((a2 - 526) | 0x80) - 390) * (a2 - 742)) ^ (a2 + 648))))(a1, v4);
}

void sub_1D8EFCBEC(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  a5 = v7
     + 1374699841 * ((1362823709 - (&a3 | 0x513B0A1D) + (&a3 | 0xAEC4F5E2)) ^ 0xC330EDEB)
     + 1121;
  a3 = v6;
  a4 = a1;
  (*(void (**)(uint64_t *))(v5 + 8 * (v7 + 1399)))(&a3);
  JUMPOUT(0x1D8EC5184);
}

uint64_t sub_1D8EFCC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v78 = (((v75 | 0x5A56A733) + (~v75 | 0xA5A958CC)) ^ 0x16C0254F) * v71;
  *(void *)(v77 - 200) = a71;
  *(void *)(v77 - 184) = v74;
  *(void *)(v77 - 176) = a70;
  *(_DWORD *)(v77 - 168) = v78 ^ 0x43F274F1;
  *(_DWORD *)(v77 - 192) = (v73 - 812) ^ v78;
  uint64_t v79 = (*(uint64_t (**)(uint64_t))(v76 + 8 * (v73 + 1016)))(v77 - 200);
  return (*(uint64_t (**)(uint64_t))(v76
                                            + 8 * ((2004 * (*(_DWORD *)(v77 - 164) != v72 + v73 - 933 - 78)) ^ v73)))(v79);
}

uint64_t sub_1D8EFCD00@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((*(_DWORD *)(a1 + 1424) == ((v1 + 476177279) & 0xE39E17FF) + 70636072) | v1)))();
}

uint64_t sub_1D8EFCD44(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return sub_1D8EECFC0(a1, a2, a3, a4);
}

uint64_t sub_1D8EFCD70()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((967 * (STACK[0x540] != 0)) ^ (v0 + 1254))))();
}

uint64_t sub_1D8EFCD9C@<X0>(int a1@<W8>, uint64_t a2)
{
  BOOL v8 = v3 < v2;
  *(unsigned char *)(a2 + (v5 - 685189316)) = *(unsigned char *)(v7 + (v5 - 685189316))
                                                  - ((*(unsigned char *)(v7 + (v5 - 685189316)) << ((a1 - 36) ^ 0x1A)) & 0xA8)
                                                  + 84;
  if (v8 == v5 - 1220857919 < v2) {
    BOOL v8 = v5 - 1220857919 < v3;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * ((v8 * v4) ^ a1)))();
}

uint64_t sub_1D8EFCE1C()
{
  *(void *)(v3 + (v1 | 1)) = v6;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 == 0) * v5) ^ v0)))();
}

uint64_t sub_1D8EFCE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v9
                                                                               + 8
                                                                               * (int)((((a8 + 120361368) & 0xF8D36FEF ^ 0x358 ^ (26 * (a8 ^ 0x1C0)))
                                                                                      * (v8 < 0x10)) ^ a8)))(a1, a2, a3, a4, 0);
}

uint64_t sub_1D8EFCE98(uint64_t a1, int a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int a37)
{
  BOOL v41 = v38 != a4 + a5 + (v37 ^ a2) + 1318 - 1603 || a37 != a6;
  return (*(uint64_t (**)(void))(v39 + 8 * ((1720 * v41) ^ v37)))();
}

void sub_1D8EFCEDC(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 - 0x5BBAD1DEA41281ADLL) = 1;
  JUMPOUT(0x1D8ECE094);
}

uint64_t sub_1D8EFCEF8()
{
  return sub_1D8EFCF10();
}

uint64_t sub_1D8EFCF10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  return (*(uint64_t (**)(void))(v12
                              + 8
                              * (((*(_DWORD *)(v11 + (v10 + a6) * (uint64_t)a7) != (((v7 ^ 0x47B) * v8) ^ 0x5342A730))
                                * v9) ^ v7)))();
}

uint64_t sub_1D8EFCF54@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 - 3 + v5 + v3 + (a1 ^ 0x38Eu)) = *(_DWORD *)(v2 - 3 + v5 + v3 + (a1 ^ 0x38Eu));
  return (*(uint64_t (**)(void))(v6 + 8 * ((62 * (v4 == 4)) ^ (a1 + 139))))();
}

void sub_1D8EFCFA4()
{
  int v7 = ((((2 * (v6 - 144)) | 0x915946F0) - (v6 - 144) + 928210056) ^ 0x3232502E) * v4;
  *(void *)(v6 - 120) = v0;
  *(void *)(v6 - 144) = v5;
  *(_DWORD *)(v6 - 136) = (v1 + 1136) ^ v7;
  *(_DWORD *)(v6 - 132) = ((v1 ^ 0x36C534E1) + v2) ^ v7;
  (*(void (**)(uint64_t))(v3 + 8 * (v1 ^ 0x664)))(v6 - 144);
  JUMPOUT(0x1D8EFD01CLL);
}

void sub_1D8EFD458()
{
}

uint64_t sub_1D8EFD46C()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 + v3 + 63 < (v0 + v3)) ^ (v1 + 48)) & 1)
                                * (v1 - 1181)) ^ v1)))();
}

void sub_1D8EFD4C4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 1224239923 * ((~a1 & 0xC46B4FA3 | a1 & 0x3B94B05C) ^ 0x36D8B274);
  int v2 = *(_DWORD *)a1 + v1;
  int v3 = (*(unsigned char *)(a1 + 16) + v1);
  int v4 = (char *)*(&off_1F3082620 + v2 - 937) - 4;
  (*(void (**)(void, uint64_t (*)()))&v4[8 * (v2 ^ 0x3F7)])(*(&off_1F3082620 + v2 - 925), sub_1D8F03808);
  uint64_t v6 = *(void *)((char *)*(&off_1F3082620 + (v2 ^ 0x44F)) - 4);
  unsigned int v5 = (3804331
      * (((&v5 | 0x2C75F771) - &v5 + (&v5 & 0xD38A0888)) ^ 0xD6EB0427)) ^ (v2 + 31);
  (*(void (**)(unsigned int *))&v4[8 * (v2 | 0x394)])(&v5);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1D8EFD634()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v1 + 1951995097) & 0x8BA6EAF7) - 324) * ((v0 - 100) > 0x9B)) ^ v1)))();
}

uint64_t sub_1D8EFD678()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((49 * (((((v1 - 1551) | 0x408) - 1129) ^ v0) > 7)) ^ v1)))();
}

uint64_t sub_1D8EFD6B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v12 = (((*(unsigned __int8 *)(a2 + 9) - 1) << (((v8 + 94) | 0x2A) ^ (v6 + 1))) & v10)
      + ((*(unsigned __int8 *)(a2 + 9) - 1) ^ (((v8 + 1086362458) | 0x8008292E) + a4)) == v9
     && (v4 + v5 + 4) < 0xC9;
  return (*(uint64_t (**)(void))(v7 + 8 * ((1052 * v12) ^ v8)))();
}

uint64_t sub_1D8EFD734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  unsigned int v31 = v26 + v25 + a4;
  if (v31 <= 0x40) {
    int v32 = 64;
  }
  else {
    int v32 = v31;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * ((43 * ((int)a2 + v28 + v29 + v32 + 29 <= ((v31 - 1) ^ v27 ^ 0x475 ^ (v27 - 1137) ^ 0xFFFFFF1B))) ^ v27)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1D8EFD7A4@<X0>(unsigned int a1@<W8>)
{
  uint64_t v4 = a1;
  unint64_t v5 = ((v1 - 277) ^ 0xFFFFFFFFDFD18821) + a1;
  if (v5 <= 0x38) {
    unint64_t v5 = 56;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * (((v5 - v4 + 539915761 > 7) * ((v3 + v1 - 838) ^ (v3 + 28))) ^ v1)))();
}

uint64_t sub_1D8EFD80C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (((((v1 - 102) | 0x61) ^ 0x5F7) * (*(_DWORD *)(v2 - 0x65EF48AAD10F56FCLL) == -1008821960)) ^ v1)))();
}

uint64_t sub_1D8EFD85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  int v49 = 535753261 * ((((2 * (v48 - 168)) | 0x724C342) - (v48 - 168) - 59924897) ^ 0x9666F8E);
  *(_DWORD *)(v48 - 160) = a13 - v49;
  *(_DWORD *)(v48 - 156) = (v47 + 17) ^ v49;
  STACK[0x358] = a26;
  uint64_t v50 = (*(uint64_t (**)(uint64_t))(v46 + 8 * (v47 ^ 0x7A1)))(v48 - 168);
  uint64_t v51 = a46 & 0x3F ^ (v47 - 52);
  *(&a37 + v51) = -44;
  return (*(uint64_t (**)(uint64_t))(v46 + 8 * (((v51 > 0x37) * (v47 + 1664)) ^ v47)))(v50);
}

void sub_1D8EFD950(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v1 = 1755732067 * (((a1 | 0x92FAE161) - a1 + (a1 & 0x6D051E9E)) ^ 0x4C3C5CBA);
  int v2 = *(_DWORD *)(a1 + 20) - v1;
  int v3 = *(_DWORD *)(a1 + 48) - v1;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 8);
  int v6 = (*(_DWORD *)(a1 + 16) ^ v1) - ((2 * (*(_DWORD *)(a1 + 16) ^ v1) + 406827792) & 0x5810409E) - 131597865;
  unsigned int v7 = 1225351577 * ((&v9 & 0xE90EA516 | ~(&v9 | 0xE90EA516)) ^ 0x356B82FF);
  uint64_t v16 = *(void *)a1;
  uint64_t v9 = v16;
  int v14 = v7 ^ (v2 + 1695026961);
  int v15 = v7 ^ (696906779 * v3 - 877901658);
  int v10 = v6 ^ v7;
  uint64_t v11 = v5;
  uint64_t v12 = v4;
  int v8 = (char *)*(&off_1F3082620 + v2 - 339) - 4;
  (*(void (**)(uint64_t *))&v8[8 * (v2 ^ 0x69D)])(&v9);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1D8EFDAEC(uint64_t a1)
{
  return sub_1D8EFDAF4(a1, *v1);
}

uint64_t sub_1D8EFDAF4(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(v3 + 8 * (v2 + 1311)))(*v6, a2, *(_DWORD *)(v4 - 0x65EF48AAD10F570CLL) + ((v2 + 146) ^ 0xE2D3F4C9));
  *uint64_t v9 = v8;
  *(_DWORD *)(v4 - 0x65EF48AAD10F570CLL) = v7;
  *uint64_t v5 = v7;
  return result;
}

void sub_1D8EFDB6C()
{
}

uint64_t sub_1D8EFDBFC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int32x4_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return sub_1D8EC5E64(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, v63 - 188, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a9);
}

void sub_1D8EFDC14()
{
}

uint64_t sub_1D8EFDD88(double a1)
{
  *int v2 = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 == 0) * v3) ^ v1)))();
}

void sub_1D8EFDDAC(_DWORD *a1, uint64_t a2, int a3)
{
  *((unsigned char *)a1 + v5 + 4) = -115;
  *((unsigned char *)a1 + (v4 + v3) + 4) = -127;
  *a1 = (a3 ^ (v6 + 90)) + 360031049 + v4 - 360031210;
  int v7 = a1 + 1;
  *((unsigned char *)v7 + (v3 + 1 + v4)) = 124;
  *((unsigned char *)v7 + (v3 + v4 - 2)) = 103;
  *((unsigned char *)v7 + (v4 - 1908186910)) = 117;
  *((unsigned char *)v7 + (v4 - 1908186909)) = 56;
  JUMPOUT(0x1D8F01B74);
}

uint64_t sub_1D8EFDDD8@<X0>(void *a1@<X1>, int a2@<W2>, int a3@<W6>, int a4@<W7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  unint64_t v32 = (*(_DWORD *)(a24 + 4 * (a5 + 1 + v26)) ^ v24)
      + HIDWORD(v29)
      + v31 * (unint64_t)(*(_DWORD *)(*a1 + 4 * (a5 + 1 + v26)) ^ v24);
  *(_DWORD *)(a24 + 4 * (a5 + v26)) = v24 + (a3 ^ (2 * v30)) + v32 - (v25 & (2 * v32)) - 1906;
  BOOL v34 = a5 + a4 < v27 && a5 + a4 >= a2;
  return (*(uint64_t (**)(void))(v28 + 8 * (((4 * v34) | (8 * v34)) ^ v30)))();
}

uint64_t sub_1D8EFDE4C()
{
  *(_DWORD *)(*(void *)(v0 + 96) + 1428) = 596678635;
  return sub_1D8EC5C98();
}

uint64_t sub_1D8EFDE74()
{
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8 * (((v0 == ((v1 ^ 0xD0) - 21)) * (v1 + 1681)) ^ v1)))(4294925278);
}

uint64_t sub_1D8EFDEA4@<X0>(int a1@<W8>)
{
  int v3 = (a1 + 809) | 0x10;
  *(_DWORD *)(v2 - 200) = v3
                        - 235795823 * ((((v2 - 200) | 0x350D6635) + (~(v2 - 200) | 0xCAF299CA)) ^ 0xA1A02F6D)
                        - 231789896;
  (*(void (**)(uint64_t))(v1 + 8 * (v3 ^ 0x3BB)))(v2 - 200);
  int v4 = (((v3 - 88) ^ (v3 - 1)) ^ ((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v3 ^ 0x3B3)))(336, 1777295586) == 0)) & 1;
  return (*(uint64_t (**)(void))(v1 + 8 * (v4 | (4 * v4) | v3)))();
}

void sub_1D8EFDF84(uint64_t a1)
{
  int v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 24) - 0x17980B1E60F15496) + 1210911083;
  unsigned int v3 = *(_DWORD *)(a1 + 20) + v1 - 1319899541;
  BOOL v4 = v2 < 0xF8E4C2CE;
  BOOL v5 = v2 > v3;
  if (v3 < 0xF8E4C2CE != v4) {
    BOOL v5 = v4;
  }
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1D8EFE070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20,uint64_t a21,int a22,int a23)
{
  int v26 = (a23 ^ v25) - ((2 * (a23 ^ v25)) & 0xC0EA0376) + 1618279968 + a22;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8 * ((((2 * v26) & 0xBD0FF6B6 ^ 0x800A0236) + (v26 ^ 0x3EF2FAE0) - 67178563 != 1518791448) ^ (v24 + 1274))))(a1, a2, a3, a19 & 0x9DB4BBF7, a5, a6, 2776175847, 150, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_1D8EFE128(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, uint64_t))(v3
                                                    + 8
                                                    * ((((v2 ^ 0xA6E7A704) != (((a2 - 1313) | 0x581) ^ 0x5CD))
                                                      * ((a2 - 1313) ^ 0xAF)) ^ a2)))((v2 ^ 0xA6E7A704) + 487737530, 1872467169);
}

uint64_t sub_1D8EFE188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * ((1023
                                * (((((v8 - 198) | 0x119) - 273) & *(_DWORD *)(v10 + (v9 + a6) * (uint64_t)a7 + 40)) == ((v8 + a8) & 0x7E4DDFFE) - 928)) ^ v8)))();
}

uint64_t sub_1D8EFE1E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v5 + 8 * ((226 * (v4 + 1 != v6 + 64)) ^ a4)))();
}

uint64_t sub_1D8EFE298(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34)
{
  int v38 = v34 ^ 0x4F6;
  int v39 = ((v34 ^ 0x4F6) - 1210422904) & 0x482594FB;
  int v40 = (v34 ^ 0x4F6) - 444;
  unsigned int v41 = v36 + v35 - 2046223212;
  if (v41 <= 0x40) {
    int v42 = 64;
  }
  else {
    int v42 = v36 + v35 - 2046223212;
  }
  BOOL v43 = a1 + 2046221019 + a34 + v39 + v42 + 1991 <= ((v41 - 1) ^ v40 ^ 0xFFFFFF75);
  return (*(uint64_t (**)(void))(v37 + 8 * (((2 * v43) | (8 * v43)) ^ v38)))();
}

uint64_t sub_1D8EFE330(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((127 * (a8 + 1 == v9 + 80)) ^ a4)))();
}

void sub_1D8EFE3E4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 8)
     + 1755732067 * (((a1 ^ 0xB0C02B5A) + 1315759944 - 2 * ((a1 ^ 0xB0C02B5A) & 0x4E6CE748)) ^ 0x206A71C9);
  if (*(_DWORD *)(*(void *)(a1 + 24) - 0x774B811B42847B23) - 715496183 >= 0) {
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 24) - 0x774B811B42847B23) - 715496183;
  }
  else {
    unsigned int v3 = 715496183 - *(_DWORD *)(*(void *)(a1 + 24) - 0x774B811B42847B23);
  }
  uint64_t v2 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 - 0x774B811B42847B23) - 715496183 >= 0) {
    unsigned int v4 = *(_DWORD *)(v2 - 0x774B811B42847B23) - 715496183;
  }
  else {
    unsigned int v4 = 715496183 - *(_DWORD *)(v2 - 0x774B811B42847B23);
  }
  uint64_t v8 = *(void *)(a1 + 24);
  unsigned int v7 = (535753261 * ((((2 * &v7) | 0xD29455A8) - &v7 + 381015340) ^ 0xE3BE24FB)) ^ (v1 - 924);
  uint64_t v5 = (char *)*(&off_1F3082620 + (v1 ^ 0x4EC)) - 4;
  (*(void (**)(unsigned int *))&v5[8 * (v1 ^ 0x3EA)])(&v7);
  if (v3 >= v4) {
    unsigned int v6 = v4;
  }
  else {
    unsigned int v6 = v3;
  }
  __asm { BRAA            X13, X17 }
}

uint64_t sub_1D8EFE584@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, char a20)
{
  BOOL v27 = v21 < a1;
  *(&a20 + (a3 - 730294624)) = *(unsigned char *)(v24 + (v20 + v26))
                                           - ((*(unsigned char *)(v24 + (v20 + v26)) << (v23 ^ 0x2F)) & 0xA8)
                                           + 84;
  if (v27 == v20 + a2 < a1) {
    BOOL v27 = v20 + a2 < v21;
  }
  return (*(uint64_t (**)(void))(v25 + 8 * (v27 | (4 * v27) | v22)))();
}

uint64_t sub_1D8EFE600()
{
  STACK[0x380] = v1;
  STACK[0x5B0] = v1 - 112;
  return v0();
}

uint64_t sub_1D8EFE61C(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((933 * (v5 + 1 == v4 + 60)) ^ a3)))();
}

uint64_t sub_1D8EFE6D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,int a39)
{
  if (a17 == 2) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v39
  }
                                                       + 8
                                                       * (((a39 != 891668432) * ((2 * (a6 ^ (a6 - 541))) ^ 0x453)) ^ (a6 + a4))))(3096986284, a10);
  if (a17 == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v39
  }
                                                       + 8
                                                       * (((a39 != 891668432) * ((a6 + a4) ^ 0x479)) ^ (a6 + a4 + 142))))(3096986284, a10);
  uint64_t v41 = (a4 - 1197981081) | 0x9Au;
  unint64_t v42 = ((unint64_t)&a22 ^ 0x4F67FF5FBEF3D96ALL ^ v41)
      + ((2 * (void)&a22) & 0x9ECFFEBF7DE7BBE0)
      - 0xA00EA5000417FF1;
  a38 = (((a4 + 103) | 0x9A) ^ (a6 - 117) ^ v42 ^ 0x16) * (v42 + 17);
  return (*(uint64_t (**)(uint64_t))(v39 + 8 * (int)v41))(3096986284);
}

uint64_t sub_1D8EFE85C@<X0>(void *a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v7 = (a2 - 985) | 0x26Au;
  *(void *)(*a1 - 0x15227257BF786DCCLL) = v6 + v5 + v7 - 626;
  return (*(uint64_t (**)(void))(a3 + 8
                                   * (int)((479 * (*v3 == v4 + ((v7 - 148428803) & 0x8D8D7FD) - 629)) ^ v7)))();
}

void sub_1D8EFE8DC()
{
}

void sub_1D8EFE8E4()
{
  if (v0 == 85169082) {
    int v1 = -1008821960;
  }
  else {
    int v1 = 1008845536;
  }
  *(_DWORD *)(v2 + 32) = v1;
}

uint64_t sub_1D8EFE948(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                              + 8 * (int)((((v5 ^ 0x7D6) + ((v5 + 277858363) & 0xEF7037CF) - 1348) * (v4 == a4)) ^ v5)))();
}

void sub_1D8EFE98C()
{
}

uint64_t sub_1D8EFE9D8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, int a7)
{
  unsigned int v13 = ((2 * (&a3 & 0x28C77998) - &a3 - 684161440) ^ 0xF4A25E76) * v7;
  a3 = v8;
  a4 = v9;
  a5 = (((2 * (v11 - 2083989067)) & 0xFDBFC7BE)
      + ((v11 - 2083989067) ^ 0xFEDFE3DF)
      + ((v12 + 959470811) & 0xC6CFA37B ^ 0x39B25D67)) ^ v13;
  a6 = a1 - v13;
  a7 = (v12 - 160) ^ v13;
  uint64_t v14 = (*(uint64_t (**)(uint64_t *))(v10 + 8 * (v12 ^ 0x51E)))(&a3);
  return (*(uint64_t (**)(uint64_t))(v10
                                            + 8
                                            * ((1651 * (*(_DWORD *)(v9 - 0x65EF48AAD10F56FCLL) == -1008821960)) ^ v12)))(v14);
}

uint64_t sub_1D8EFEACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D8EFEB0C(588, 1366, 984, a4, 102, 4129713926, 2064856963, 178694817);
}

uint64_t sub_1D8EFEB0C@<X0>(unint64_t a1@<X8>)
{
  BOOL v5 = v2 + (unint64_t)(v1 ^ v3) - 1046 < a1;
  return (*(uint64_t (**)(void))(v4 + 8 * (((2 * v5) | (32 * v5)) ^ v1)))();
}

uint64_t sub_1D8EFEB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * ((((v10 - 199324015) & 0xBE1733F ^ (a8 - 739) ^ ((v10 + 814761973) | 0x460E148A))
                                * (v8 - v9 == -295310829)) ^ v10)))();
}

uint64_t sub_1D8EFEBD0()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((14
                                * ((*(_DWORD *)(*v2 + 4 * v5) ^ (v1 + v4)) > (*(_DWORD *)(*v3 + 4 * v5) ^ (v4 + v1)))) ^ v4)))();
}

uint64_t sub_1D8EFEC20@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(*a1 - 0x15227257BF786DCCLL) = 0;
  return (*(uint64_t (**)(void))(a2 + 8 * ((479 * (*v2 == v3 + ((v4 - 148428803) & 0x8D8D7FD) - 629)) ^ v4)))();
}

uint64_t sub_1D8EFEC80()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (v0 ^ (1758 * (v1 == v3)))))();
}

void sub_1D8EFECA4()
{
  int v4 = (v1 - 807110667) & 0x301B87FF;
  *(_DWORD *)(v3 - 160) = v2;
  *(void *)(v3 - 136) = v0 - 7;
  *(void *)(v3 - 152) = *(void *)(v3 - 120) - 7;
  *(_DWORD *)(v3 - 168) = (v4 ^ 0xFFFFFC4F) & v2;
  *(_DWORD *)(v3 - 144) = v4;
  *(_DWORD *)(v3 - 124) = v4 ^ 0x344;
  JUMPOUT(0x1D8EFED38);
}

uint64_t sub_1D8EFEE28()
{
  return (*(uint64_t (**)(void))(v0
                              + 8 * ((114 * (((v1 == 2083989067) ^ (v2 + 123)) & 1)) ^ (v2 + 1147))))();
}

uint64_t sub_1D8EFEE70(void *a1)
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)((((((v2 & 0xFD) + 78) ^ (*(_DWORD *)(*a1 + v4) == v3)) & 1)
                                     * ((((v2 & 0xE48721FD) + 1040782330) & 0xC1F6EFBB) - 472)) ^ v2 & 0xE48721FD)))();
}

uint64_t sub_1D8EFEECC@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((91 * (a1 + 1 != v3 + 48)) ^ a2)))();
}

uint64_t sub_1D8EFEFA8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((*(void *)(*(void *)(v1 + 8 * (a1 - 366)) - 4) != 0)
                                     * ((a1 ^ 0xBDDC9241) + 1109617742)) | a1)))();
}

uint64_t sub_1D8EFEFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v11 = v7 - 355;
  int v12 = *(unsigned __int8 *)STACK[0x598]
      - ((((v11 - 34) | 0x10) ^ 0xFB)
                        + *(unsigned char *)(*(void *)(v9 + v8 * (uint64_t)a7 + 24) - 0x4019A21BF4676349));
  return (*(uint64_t (**)(void))(v10 + 8
                                    * ((583 * (((2 * v12) & 0x8FBFAEFC) + (v12 ^ 0x47DFD77E) == 1205852030)) ^ v11)))();
}

void sub_1D8EFF0A4(uint64_t a1)
{
  int v1 = 3804331 * (((a1 | 0xE97B4C4E) - a1 + (a1 & 0x1684B3B1)) ^ 0x13E5BF18);
  __asm { BRAA            X11, X17 }
}

void sub_1D8EFF1B0()
{
}

uint64_t sub_1D8EFF248@<X0>(int a1@<W8>)
{
  return sub_1D8EC5660(a1);
}

void sub_1D8EFF26C()
{
}

uint64_t sub_1D8EFF27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  BOOL v14 = a12 + 8126631 + ((v13 - 164606746) & 0x9CFADDAu) > 0x7FFFFFFD;
  return (*(uint64_t (**)(void))(v12 + 8 * ((v14 | (8 * v14)) ^ v13)))();
}

uint64_t sub_1D8EFF2E8(uint64_t a1, uint64_t a2, int a3, int32x4_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return sub_1D8EC5E64(a1, a2, a3, 2200714081, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a4);
}

uint64_t sub_1D8EFF2F4()
{
  int v5 = 628203409 * ((((v4 - 120) | 0x75C4A665) - ((v4 - 120) & 0x75C4A665)) ^ 0xF74CAA56);
  *(_DWORD *)(v4 - 104) = v5 + v2 - 73;
  *(_DWORD *)(v4 - 120) = v3 - v5 + ((v2 - 304) ^ 0xEA2A0915);
  *(void *)(v4 - 112) = v0;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v2 ^ 0x497)))(v4 - 120);
  return sub_1D8EFF374(v6);
}

uint64_t sub_1D8EFF374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(_DWORD *)(v26 - 120) = v22 + ((v24 - ((v26 - 120) | v24) + ((v26 - 120) | 0xD62C86FB)) ^ 0x4281CFA2) * v25 + 784;
  *(void *)(v26 - 112) = a19;
  *(void *)(v26 - 104) = a21;
  uint64_t v27 = (*(uint64_t (**)(uint64_t))(v21 + 8 * (v22 + 1448)))(v26 - 120);
  int v28 = *(_DWORD *)(v26 - 116) > (((v22 - 563) | 0x184) ^ ((v22 ^ 0x63Cu) + v23));
  return (*(uint64_t (**)(uint64_t))(v21 + 8 * (((32 * v28) | (v28 << 6)) ^ v22)))(v27);
}

void sub_1D8EFF410()
{
}

void sub_1D8EFF41C()
{
}

uint64_t sub_1D8EFF438(_DWORD *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  signed int v1 = (*a1 ^ (1374699841 * ((a1 - 1542394297 - 2 * (a1 & 0xA410EE47)) ^ 0xC9E4F64E)))
     - 2138963346;
  uint64_t v2 = *(void *)((char *)*(&off_1F3082620 + v1) - 4);
  unsigned int v5 = v1
     + 3804331 * (((&v4 | 0xBBF09D3) - &v4 + (&v4 & 0xF440F628)) ^ 0xF121FA85)
     + 1214;
  uint64_t v4 = v2;
  return (*(uint64_t (**)(uint64_t *))((char *)*(&off_1F3082620 + v1 + 138) + 8 * v1 + 16388))(&v4);
}

uint64_t sub_1D8EFF540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  uint64_t v55 = *(void *)(v51 + 24);
  *(int8x16_t *)(v53 - 112) = veorq_s8(*(int8x16_t *)(*(void *)(v51 + 16) - 0x7E73F30E3C909666), (int8x16_t)xmmword_1D8FE2BC0);
  if (v52) {
    BOOL v56 = v55 == 0x4CA0F7536780EB2FLL;
  }
  else {
    BOOL v56 = 1;
  }
  char v57 = v56;
  HIDWORD(a27) = v50 << (a6 - 119);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 8 * (int)((232 * (((a6 + 119) ^ v57) & 1)) ^ a6)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_1D8EFF5D0()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 - 237)))();
}

uint64_t sub_1D8EFF5F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, int a15)
{
  a13 = &STACK[0xB36971A36B56DCC];
  a15 = 420 - 460628867 * ((&a13 + 105572375 - 2 * ((unint64_t)&a13 & 0x64AE817)) ^ 0x4ADC6A6A);
  uint64_t v17 = (*(uint64_t (**)(unint64_t **))(v16 + 16048))(&a13);
  return (*(uint64_t (**)(uint64_t))(v16 + 8 * ((110 * (a14 != ((v15 + 590) ^ 0x2BE))) ^ 0x2ACu)))(v17);
}

void sub_1D8EFF698(uint64_t a1)
{
  BOOL v4 = *(void *)(a1 + 16) != 0x65EF48AAD10F5714
    && *(void *)(a1 + 32) != 0x34F67AB82E5E9025
    && *(void *)(a1 + 8) != 0x3F5860029363B1D6;
  int v1 = *(_DWORD *)a1 + 1734042137 * (((a1 | 0x244186C0) - (a1 | 0xDBBE793F) - 608274113) ^ 0x788F458D);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1D8EFF7B4()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((203 * (((((v3 + v2) & 0x1F) == 9) ^ (29 * (v0 ^ 0x71))) & 1)) ^ v0)))();
}

uint64_t sub_1D8EFF828@<X0>(unsigned int a1@<W6>, int a2@<W7>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  if (!a3) {
    return (*(uint64_t (**)(void))(v59
  }
                                + 8
                                * ((732 * ((int)a14 - 632876696 < ((v61 + a2 + 1020) | 0xC6u) - 1207)) ^ (v61 + a2 + 346))))();
  if (a3 != 3) {
    return (*(uint64_t (**)(void))(v59
  }
                                + 8
                                * ((97 * (*(_DWORD *)(v58 + 48 * v60 + 36) + 736910439 >= a1)) ^ (v61 + 1990090519))))();
  int v62 = v61 + a2 + 1218;
  uint64_t v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 48 * v60 + 8))(a5, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 8 * ((927 * (v63 - 1008821960 - ((2 * v63) & 0x87BD3270) == -1008821960)) ^ v62)))(v63, v64, 3286145336, v65, 2929871293, 2884394087, 2147483652, 1990090206, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58);
}

uint64_t sub_1D8EFF9C8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((506 * (v0 == ((v1 - 420623169) & 0xDFBBF0F2 ^ (v3 - 5)))) ^ v1)))();
}

uint64_t sub_1D8EFFA14@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  return (*(uint64_t (**)(void))(v23
                              + 8
                              * ((11
                                * (*(_DWORD *)(a20 + 4 * ((v20 ^ 0x84u) + a1 + v22)) != (((v20 ^ 0x78A) - 1769) ^ (v21 - 135)))) ^ ((v20 ^ 0x78A) - 1787))))();
}

void sub_1D8EFFA68()
{
}

uint64_t sub_1D8EFFB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  uint64_t v38 = *(void *)(v35 + 24);
  *(int8x16_t *)(v37 - 112) = veorq_s8(*(int8x16_t *)(*(void *)(v35 + 40) - 0x18C386E3A064890BLL), (int8x16_t)xmmword_1D8FE2BA0);
  if (*(void *)(v37 - 120)) {
    BOOL v39 = v38 == 0x4CA0F7536780EB2FLL;
  }
  else {
    BOOL v39 = 1;
  }
  int v40 = v39;
  HIDWORD(a12) = 2 * v34;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (int)((v40 * (((a7 - 1731979282) & 0x673BE7F7) - 1426)) ^ a7)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

void sub_1D8EFFBDC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a1 + a2) = 715496183;
  JUMPOUT(0x1D8ECC2B0);
}

uint64_t sub_1D8EFFBEC()
{
  return sub_1D8EFFC3C((v0 + 98661294), 4196306927, 3697484538, 3202741533, 881);
}

uint64_t sub_1D8EFFC3C@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  BOOL v19 = v14 > v17;
  uint64_t v20 = 4 * (v12 + a6 + (a1 & a2));
  *(_DWORD *)(a12 + v20) = *(_DWORD *)(*v16 + v20);
  if (v19 == v12 + a3 < a4) {
    BOOL v19 = v12 + a3 < v15;
  }
  return (*(uint64_t (**)(void))(v18 + 8 * ((v19 * a5) ^ (v13 + 80))))();
}

uint64_t sub_1D8EFFCA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  a15 = 420 - 460628867 * (((&a13 | 0x9D7D7D30) - (&a13 & 0x9D7D7D30)) ^ 0xD1EBFF4D);
  a13 = &STACK[0xB36971A36B56DC4];
  uint64_t v17 = (*(uint64_t (**)(unint64_t **))(v15 + 16048))(&a13);
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * ((1171 * (a14 == (v16 ^ 0xF7F92E59) - 874156944)) ^ v16)))(v17);
}

uint64_t sub_1D8EFFD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a21 == 2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21
  }
                                                                         + 8
                                                                         * (a5
                                                                          + v23
                                                                          + (*(_DWORD *)(v22 - 160) != 891668432)
                                                                          * ((v23 ^ (v23 + 103)) - 399)
                                                                          + 1093)))(a1, 1576401730, 3753632324, a14);
  if (a21 != 1) {
    JUMPOUT(0x1D8EFFEF4);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21
                                                              + 8
                                                              * ((63
                                                                * (*(_DWORD *)(v22 - 160) == ((v23 - 1877203252) & 0xA93A1DF3 ^ 0x3525C2B2))) ^ (a5 + v23 + 119))))(a1, 1576401730, a14);
}

uint64_t sub_1D8EFFF28()
{
  *(void *)(v4 - 1202683318 + v1 + v2 - 786) = 0x5454545454545454;
  return (*(uint64_t (**)(void))(v3 + 8 * (int)((480 * (((v2 - 730) & v0) != 8)) ^ (v2 - 548))))();
}

uint64_t sub_1D8EFFF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (((((13 * (a7 ^ 0x28E) - 1693) & a8) == 2108814608) * (((a7 ^ 0x28E) + 1795) ^ 0xDB)) ^ a7)))();
}

uint64_t sub_1D8EFFFDC()
{
  *(_DWORD *)(v7 - 136) = v6 - 1374699841 * ((~((v7 - 144) | 0x2708FB5) + ((v7 - 144) & 0x2708FB5)) ^ 0x907B6843) + 607;
  *(void *)(v7 - 120) = v4;
  *(void *)(v7 - 112) = v5;
  *(void *)(v7 - 144) = v2;
  *(void *)(v7 - 128) = v2;
  (*(void (**)(uint64_t))(v1 + 8 * (v6 + 1370)))(v7 - 144);
  int v8 = 460628867 * ((v7 - 798053516 - 2 * ((v7 - 144) & 0xD06EAC04)) ^ 0x9CF82E79);
  *(void *)(v7 - 136) = v0;
  *(_DWORD *)(v7 - 144) = v8 + v3 - 1999839575;
  *(_DWORD *)(v7 - 128) = v8 + v6 - 300;
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v6 + 1391)))(v7 - 144);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (((*(_DWORD *)(v7 - 140) == -1022760981) * ((v6 - 329) ^ v6 ^ 0x3AB)) ^ v6)))(v9);
}

void sub_1D8F000EC()
{
}

void sub_1D8F00554(int a1@<W5>, int a2@<W8>)
{
  *(_DWORD *)(v5 - 164) = (v3 ^ v2) + (a1 ^ v2) - (v4 & (2 * ((v3 ^ v2) + (a1 ^ v2)))) + ((a2 - 961953915) ^ 0x7077FDC2);
  JUMPOUT(0x1D8F005A8);
}

void sub_1D8F00868()
{
}

void sub_1D8F008C0()
{
}

void sub_1D8F008C8()
{
}

uint64_t sub_1D8F009C4(uint64_t a1)
{
  int v1 = 460628867 * ((a1 & 0x873FB66C | ~(a1 | 0x873FB66C)) ^ 0x3456CBEE);
  int v2 = *(_DWORD *)(a1 + 16) - v1;
  int v3 = *(_DWORD *)a1 - v1;
  if (v3 < 0) {
    int v3 = -v3;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) - 0x774B811B42847B23);
  unsigned int v6 = v4 - 715496183;
  BOOL v5 = v4 - 715496183 < 0;
  unsigned int v7 = 715496183 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return (*(uint64_t (**)(void))((char *)*(&off_1F3082620 + (v2 ^ 0x1D2))
                              + 8 * ((989 * (v3 >> 5 < v7)) ^ v2)
                              - 4))();
}

uint64_t sub_1D8F00A7C()
{
  int v4 = ((v0 + 936) ^ 0xEBA40BE9) + v2;
  int v5 = (v3 > 0x2C9E3264) ^ (v4 < -748565093);
  BOOL v6 = v4 < (int)(((v0 + 265) ^ 0x5361CFF7) + v3);
  if (v5) {
    BOOL v6 = v3 > 0x2C9E3264;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 ^ (16 * v6))))();
}

void sub_1D8F00AE8()
{
}

uint64_t sub_1D8F00B30()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((117 * (((((7 * (v1 ^ 0x27D)) ^ 0x790) - 701) ^ v0) > 7)) ^ v1)))();
}

uint64_t sub_1D8F00B70()
{
  BOOL v5 = v0 < v1;
  unint64_t v6 = (v2 ^ 0xC6D4DBCEBD702EACLL) + v3;
  int v7 = v5 ^ (v6 < 0xA5373690);
  BOOL v8 = v6 < v0;
  if (!v7) {
    BOOL v5 = v8;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * (int)((1524 * v5) ^ (v2 - 433))))();
}

void sub_1D8F00BD8()
{
}

uint64_t sub_1D8F00D88()
{
  LODWORD(STACK[0x620]) = 1008845548;
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((STACK[0x470] == 0x70459CB0620F0DF9) * (((v0 - 263) | 0x10C) ^ 0xC9)) ^ (v0 + 1460))))();
}

void sub_1D8F00DEC()
{
  LODWORD(STACK[0x3D8]) = v0;
  JUMPOUT(0x1D8ECF2D0);
}

uint64_t sub_1D8F00DF8@<X0>(int a1@<W8>)
{
  int v4 = v2 + a1;
  if (v4 >= 0) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = -v4;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 ^ 0x626) * (v5 > 0x82)) ^ v1)))();
}

void sub_1D8F00E24()
{
}

uint64_t sub_1D8F00EF4@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  uint64_t v55 = (*(uint64_t (**)(void, void, uint64_t))(v53 + 8 * (a1 + 1816)))(LODWORD(STACK[0x580]), (v51 + v50 + 1), a45);
  int v61 = ((2 * v55) & 0xAF7E5DEA) + (v55 ^ 0xD7BF2EF5);
  unint64_t v62 = STACK[0x380];
  if (v61 == -675336459)
  {
    uint64_t v64 = (char *)&STACK[0x670] + v62 - 0x61CB92A9D1FA1DEFLL;
    STACK[0x518] = (unint64_t)(v64 - 1824);
    STACK[0x3D0] = (unint64_t)(v64 - 1596);
    LODWORD(STACK[0x428]) = 449729482;
    STACK[0x5B0] = v62 - 192;
    STACK[0x5E8] = 0;
    LODWORD(STACK[0x53C]) = 1576401730;
    STACK[0x3D8] = (unint64_t)(v64 - 1824);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 8 * ((v52 + 888) ^ ((v64 - 1824 != (char *)-248) | (8 * (v64 - 1824 != (char *)-248))))))(v55, v56, v57, 1008845537, v58, v59, v60);
  }
  else if (v61 == -406901000)
  {
    LODWORD(STACK[0x4E8]) = 1008845312;
    return (*(uint64_t (**)(void))(v53
                                + 8 * (((STACK[0x4D8] == 0) * (((3 * (v52 ^ 0x80)) ^ 0x569) - 416)) ^ (v52 + 135))))();
  }
  else
  {
    int v65 = 1224239923 * ((((v54 - 200) | 0xABB2E131) + (~(v54 - 200) | 0x544D1ECE)) ^ 0x59011CE7);
    *(_DWORD *)(v54 - 184) = v65 + v52 + 1225;
    *(void *)(v54 - 192) = a50;
    *(_DWORD *)(v54 - 200) = v61 - v65 - 2 * (((_BYTE)v61 + 3) & 6 ^ (v61 + 675336459) & 0x43DE993E) - 333485501;
    uint64_t v66 = (*(uint64_t (**)(uint64_t))(v53 + 8 * (v52 + 1791)))(v54 - 200);
    return (*(uint64_t (**)(uint64_t))(v53
                                              + 8
                                              * (((STACK[0x4D8] == 0) * (((3 * (v52 ^ 0x80)) ^ 0x569) - 416)) ^ (v52 + 135))))(v66);
  }
}

uint64_t sub_1D8F01148(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 + 127962867 - 2 * (a1 & 0x7A08EF3)) ^ 0xD9663328));
  return (*(uint64_t (**)(void))((char *)*(&off_1F3082620 + v1 - 477)
                              + 8
                              * (((*(void *)(a1 + 8) == 0x65EF48AAD10F5714) * ((2 * (v1 ^ 0x348)) ^ 0x275)) ^ v1)
                              - 4))();
}

uint64_t sub_1D8F011DC(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((a1 - 708) | 0x42) + 50 * (a1 ^ 0x36C) - 2046) * (v1 == v2)) ^ a1)))();
}

uint64_t sub_1D8F0121C()
{
  (*(void (**)(void))(v1 + 8 * (v0 + 1739)))();
  return (*(uint64_t (**)(void))(v1 + 8 * ((114 * (STACK[0x4C0] == 0)) ^ (v0 + 1168))))();
}

void sub_1D8F01258()
{
}

void sub_1D8F01260(int a1@<W8>)
{
  int v7 = ((((2 * (v6 - 144)) | 0x1F1B3018) - (v6 - 144) + 1886545908) ^ 0xC31B1A71) * v1;
  *(void *)(v6 - 128) = v2;
  *(_DWORD *)(v6 - 120) = v7 + v3 + (a1 ^ 0xF3FD6C8);
  *(void *)(v6 - 144) = v5;
  *(_DWORD *)(v6 - 136) = v7 + a1 - 613;
  (*(void (**)(uint64_t))(v4 + 8 * (a1 ^ 0x334)))(v6 - 144);
  JUMPOUT(0x1D8F012E4);
}

uint64_t sub_1D8F01404()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * ((((v4 + v1 - 786) ^ ((v1 + 8685813) | 0x4F4973B0) ^ 0x62E) * (v2 == v0)) ^ v1)))();
}

uint64_t sub_1D8F01448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  unsigned int v31 = a8 - 1024156330;
  unint64_t v32 = (_DWORD *)(a25 + 24 * v31);
  HIDWORD(a27) = v32[4];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((35 * (((*v32 + (int)a3) & 0xFFFFFFFFFFFFFFDLL) == 0)) ^ v28)))(a1, a2, a3, a4, a5, a6, *(void *)(v30 + 24 * v31 + 16), a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

void sub_1D8F014EC()
{
}

uint64_t sub_1D8F014F8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((1019
                                * (((2 * v1) & 0x5FFF7B7E ^ 0x565A381A) + (v1 ^ 0xD4D2A1B2) + 1396506568 == (v0 ^ 0x47F) + 54310862)) ^ v0)))();
}

uint64_t sub_1D8F01564()
{
  uint64_t v4 = v0;
  unint64_t v5 = (((v3 + 454) | 0x100u) ^ (unint64_t)(v1 + 252)) + v0;
  if (v5 <= 0x38) {
    unint64_t v5 = 56;
  }
  return (*(uint64_t (**)(void))(v2 + 8
                                   * ((496 * ((((v3 + 1224) | 0xA0u) ^ 0x3E005393) - v4 + v5 > 7)) ^ (v3 + 1699))))();
}

void sub_1D8F015D4(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  unsigned int v11 = ((&a3 & 0xF520D92A | ~(&a3 | 0xF520D92A)) ^ 0x2945FEC3) * v7;
  a7 = (v8 - 160) ^ v11;
  a5 = v11 ^ 0x3892425B;
  a6 = a1 - v11;
  a3 = 0x2B2B4D831A99DB82;
  a4 = v9;
  (*(void (**)(uint64_t *))(v10 + 8 * (v8 + 1302)))(&a3);
  sub_1D8ED3388();
}

void sub_1D8F01650()
{
}

uint64_t sub_1D8F01674()
{
  *(unsigned char *)(v2 - 184) = 29 - 51 * ((2 * ((v2 + 56) & 0xF8) - (v2 + 56) + 5) ^ 0xD2);
  *(_DWORD *)(v2 - 200) = v0 - 1224239923 * ((2 * ((v2 - 200) & 0x95EA2F8) - (v2 - 200) - 157197051) ^ 0x412A0D2) + 238;
  STACK[0x288] = (unint64_t)&STACK[0x1B326768DCF9E7D6];
  *(void *)(v2 - 176) = &STACK[0x1B326768DCF9E7D6];
  STACK[0x290] = (unint64_t)&STACK[0x7078B7EF70D8BBA7];
  *(void *)(v2 - 192) = &STACK[0x7078B7EF70D8BBA7];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 + 1207)))(v2 - 200);
  int v4 = *(_DWORD *)(v2 - 196);
  LODWORD(STACK[0x520]) = v4;
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((1424 * (v4 == ((3 * (v0 ^ 0x3F8) - 237) | 0x2B) - 1008822279)) ^ v0)))(v3);
}

void sub_1D8F0176C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  *uint64_t v37 = -223944149;
  (*(void (**)(uint64_t))(v36 + 8 * (v35 + 1913)))(a35);
  JUMPOUT(0x1D8F017A4);
}

void sub_1D8F018E4()
{
  *(_DWORD *)(v0 - 0x65EF48AAD10F56FCLL) = 1008845548;
  JUMPOUT(0x1D8EFDB4CLL);
}

uint64_t sub_1D8F01904@<X0>(int a1@<W8>)
{
  BOOL v4 = (((v3 + 341 + a1) ^ v2) & 0x80000000) == ((v3 - 1235869324) & 0x49A9D8BF) - 151;
  return (*(uint64_t (**)(void))(v1 + 8 * ((v4 | (4 * v4)) ^ (v3 + 341))))();
}

uint64_t sub_1D8F01960@<X0>(uint64_t a1@<X8>)
{
  uint64_t v7 = v3;
  uint64_t v8 = v1;
  uint64_t v9 = v3;
  unsigned int v6 = v4 + 18 - (((&v6 | 0x439509F7) - (&v6 & 0x439509F7)) ^ 0x1F5BCABA) * v2 + 716;
  return (*(uint64_t (**)(unsigned int *))(a1 + 8 * ((v4 + 18) ^ 0x6E8)))(&v6);
}

uint64_t sub_1D8F019C0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (unint64_t)&v8[qword_1EA8BEAE8 - qword_1EA8BF6A0];
  qword_1EA8BF6A0 = 139864171 * v2 - 0x6BA42CE6601600A8;
  qword_1EA8BEAE8 = 139864171 * (v2 ^ 0x945BD3199FE9FF58);
  int v3 = *(_DWORD *)(a2 + 4);
  unsigned __int8 v4 = 107 * ((qword_1EA8BEAE8 + 107 * v2 + 88) ^ 0x58);
  unint64_t v5 = (char *)*(&off_1F3082620 + (v4 ^ byte_1D8FDC6E0[byte_1D8FD8A20[v4] ^ 0x3A]) - 18) - 4;
  if (v3 == 1576401733) {
    __asm { BRAA            X1, X17 }
  }
  if (v3 == 1576401740)
  {
    int v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BRAA            X3, X17 }
  }
  return 4294925278;
}

uint64_t sub_1D8F01B80(int a1, uint64_t a2, int a3, int a4)
{
  *(_DWORD *)(a2 + (v6 - a4 + a1)) = *(_DWORD *)(v4 + (v6 - a4 + a1));
  return (*(uint64_t (**)(void))(v7 + 8 * ((62 * (a4 + 4 == v5)) ^ a3)))();
}

uint64_t sub_1D8F01BB4()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((973 * (v0 == ((((v1 + 1560090110) & 0xA302EA3F) + 909) ^ 0x5A4))) ^ v1)))();
}

uint64_t sub_1D8F01BF8()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((247
                                * (((v0 - 865847690) & 0x339BCEFE ^ (LODWORD(STACK[0x5AC]) - 1576401730) ^ 0x597FE8D99FFE7338)
                                 + ((2 * (LODWORD(STACK[0x5AC]) - 1576401730)) & 0x13FFCEB6CLL)
                                 - 0x597FE8D8FAC73F26 != 2771859088)) ^ (v0 + 609))))();
}

uint64_t sub_1D8F01CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(uint64_t, void))(v7
                                                    + 8
                                                    * (int)((((a5 ^ 0xFFFFFED0) + (a5 ^ 0x13E)) * ((v5 & 0x18) == 0)) ^ a5)))(a1, (v6 - a1));
}

uint64_t sub_1D8F01CF4@<X0>(int a1@<W8>)
{
  int v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x563));
  return v3(v1);
}

uint64_t sub_1D8F01D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  BOOL v14 = v11 < v9;
  int v15 = v8 + 1;
  *(unsigned char *)(*v13 + (v15 + a7)) = 84;
  if (v14 == v15 + v7 < v9) {
    BOOL v14 = v15 + v7 < v11;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * ((v14 * (v10 - 1188)) ^ v10)))();
}

uint64_t sub_1D8F01D7C(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (v3 ^ ((LODWORD(STACK[0x3D8]) == 596678603) * a3))))();
}

uint64_t sub_1D8F01DC0@<X0>(int a1@<W8>)
{
  int v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 | 0x584));
  return v3(v1);
}

uint64_t sub_1D8F01DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v32 = v28 + v27 - 2079290923;
  unsigned int v33 = v28 + v27 - 2079290358;
  if (v33 <= 0x40) {
    unsigned int v33 = 64;
  }
  BOOL v34 = __CFADD__(v32 + 564, v30 + v33);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * ((116 * ((v34 ^ (((v29 - 35) & 0xFD) - 70)) & 1)) ^ v29)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1D8F01E6C@<X0>(uint64_t a1@<X1>, char a2@<W5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32)
{
  int v36 = *(_DWORD *)(&a20 + ((v34 + a3) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v34 + a3)) = v36 ^ 0x34;
  *(unsigned char *)(a1 + (v34 + a3 + 1)) = (BYTE1(v36) ^ 0x3D)
                                                + ((a2 + v33 - 70) ^ 0xF8)
                                                - ((2 * (BYTE1(v36) ^ 0x3D)) & 0xA8);
  *(unsigned char *)(a1 + (v34 + a3 + 2)) = (BYTE2(v36) ^ 0xDE) - ((2 * (BYTE2(v36) ^ 0xDE)) & 0xA8) + 84;
  *(unsigned char *)(a1 + (v34 + a3 + 3)) = (HIBYTE(v36) ^ 0xB6) - ((2 * (HIBYTE(v36) ^ 0xB6)) & 0xA8) + 84;
  BOOL v37 = v34 - 1090920842 < (a32 - 1770865171);
  if (v34 - 1090920842 < v32 != a32 - 1770865171 < v32) {
    BOOL v37 = a32 - 1770865171 < v32;
  }
  return (*(uint64_t (**)(void))(v35 + 8 * ((527 * v37) ^ v33)))();
}

uint64_t sub_1D8F01F4C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned int a23)
{
  BOOL v25 = a23 < 0xAF34DFCC;
  if (v25 == (v23 + 1747104815) < 0xAF34DFCC) {
    BOOL v25 = v23 + 1747104815 < a23;
  }
  return (*(uint64_t (**)(uint64_t))(v24 + 8 * ((v25 * (((2 * a1) ^ 0x3E2) - 24)) ^ a1)))(2259238812);
}

uint64_t sub_1D8F01FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  uint64_t v15 = (v9 + a6 + 873);
  *(unsigned char *)(v13 + v15) ^= *(unsigned char *)(v10 + (v15 & 0xF)) ^ *(unsigned char *)(v12 + (v15 & 0xF)) ^ *(unsigned char *)(v11 + (v15 & 0xF)) ^ (5 * (v15 & 0xF)) ^ 0x54;
  return (*(uint64_t (**)(void))(v14 + 8 * ((1950 * (a6 - 1 == v8)) ^ (a8 - 547))))();
}

uint64_t sub_1D8F0201C()
{
  int v6 = (unint64_t *)((char *)&STACK[0x670] + STACK[0x380] + (v1 ^ 0x9E346D562E05E403 ^ v0));
  STACK[0x470] = v3 + 0x70459CB0620F0DF9;
  *int v6 = 0xABABABABABABABABLL;
  v6[1] = 0x5454545452545446;
  int v7 = 628203409 * ((-625822081 - ((v5 - 200) | 0xDAB2B67F) + ((v5 - 200) | 0x254D4980)) ^ 0xA7C545B3);
  *(_DWORD *)(v5 - 200) = v2 - v7 + 1064656099;
  *(_DWORD *)(v5 - 192) = -1069069088 - v7;
  (*(void (**)(uint64_t))(v4 + 8 * (v2 + 1410)))(v5 - 200);
  LODWORD(STACK[0x444]) = 1576402066;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8 * (v2 + 1425)))(336, 1925803308);
  STACK[0x4A8] = v8;
  return (*(uint64_t (**)(void))(v4
                              + 8 * (((v8 == 0) * ((v2 - 561111889) & 0x2171E5FA ^ ((v2 - 328) | 0x11) ^ 0x5E8)) ^ v2)))();
}

uint64_t sub_1D8F02174(uint64_t result)
{
  *(_DWORD *)(result + 28) = 822078247;
  return result;
}

uint64_t sub_1D8F02180(uint64_t a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6, int a7)
{
  uint64_t v14 = (v10 + a3);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(v7 + (v14 & 0xF)) ^ *(unsigned char *)(v8 + (v14 & 0xF)) ^ *(unsigned char *)((v14 & 0xF) + v9 + 2) ^ ((v14 & 0xF) * a5) ^ ((*(unsigned char *)(v12 + v14) ^ 0x83) + (((v11 - 56) ^ a4) & (2 * *(unsigned char *)(v12 + v14))) + 123);
  return (*(uint64_t (**)(void))(v13 + 8 * ((v10 - 1 == a7) | v11)))();
}

uint64_t sub_1D8F021E8(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((((107 * (a2 ^ 0x3AA)) ^ 0x1EF) - 1385) * (v5 < a4)) ^ a2)))();
}

uint64_t sub_1D8F02220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((73 * ((a8 & 0xFFFFFFF0) != ((4 * (a5 - 1103)) ^ 0x293) + 2097150717)) ^ (a5 - 1103))))();
}

uint64_t sub_1D8F0226C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (int)((212 * (a2 - v5 - a4 >= (a3 ^ 0x455uLL))) ^ a3)))();
}

void sub_1D8F022A8()
{
}

void sub_1D8F022F8()
{
}

uint64_t sub_1D8F0230C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (((((v5 - 840) ^ 0x316) - 846) * (v6 != a5 + 955)) ^ (v5 - 840))))();
}

uint64_t sub_1D8F02340()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((*v0 != 0x2B2B4D831A99DB82) * (((v1 - 1299) | 9) ^ 0x20D)) ^ v1)))();
}

uint64_t sub_1D8F02394(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(result + 28) = a3;
  return result;
}

void sub_1D8F0239C()
{
}

void sub_1D8F02400()
{
  *(_DWORD *)(v2 + v1) = v0;
  JUMPOUT(0x1D8F02414);
}

uint64_t sub_1D8F024B0()
{
  *(void *)(v4 - 252 + v2 - 539915761) = 0x5454545454545454;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v1 & 0xFFFFFFFFFFFFFFF8) == 8) * (v0 + 1005)) ^ v0)))();
}

uint64_t sub_1D8F024FC(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((a2 + v4 - 690) ^ (8 * (((v4 - 529999800) & 0xCFC92EF9) + v2 - 1202684883 < 0x38)))))();
}

uint64_t sub_1D8F02544@<X0>(int a1@<W8>)
{
  STACK[0x2A8] = v1;
  int v4 = (a1 - 962) | 0x710;
  STACK[0x438] = 0;
  int v5 = 460628867 * ((v3 - 200) ^ 0x4C96827D);
  *(void *)(v3 - 200) = STACK[0x2A0];
  *(_DWORD *)(v3 - 168) = v5 ^ 0x43F274F4;
  *(_DWORD *)(v3 - 192) = (v4 - 1613) ^ v5;
  unint64_t v6 = STACK[0x298];
  *(void *)(v3 - 184) = 0x19D396D9A609BEA0;
  *(void *)(v3 - 176) = v6;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v4 + 215)))(v3 - 200);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (int)(((*(_DWORD *)(v3 - 164) == -1008821960)
                                                   * (v4 - 1531 + ((v4 + 1712715610) & 0x99EA07FF) - 1836)) ^ v4)))(v7);
}

uint64_t sub_1D8F02614@<X0>(int a1@<W1>, unsigned int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((*(unsigned __int8 *)(v3 + (v2 - 1 + a1)) == ((a2 - 49) ^ 0xC1)) ^ a2)))();
}

uint64_t sub_1D8F02654()
{
  return ((uint64_t (*)(void))STACK[0x490])();
}

uint64_t sub_1D8F02688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25)
{
  return (*(uint64_t (**)(void))(v28
                              + 8
                              * ((13
                                * ((unint64_t)(&a25 + a14 + (v26 + v25 - 1)) >= ((8 * (v27 ^ 0x341u) - 292) ^ 0x24CuLL))) ^ v27 ^ 0x3E1)))();
}

void sub_1D8F026E0(unint64_t a1)
{
  STACK[0x5E8] = a1;
  LODWORD(STACK[0x53C]) = v1;
  JUMPOUT(0x1D8F026FCLL);
}

uint64_t sub_1D8F02778@<X0>(int a1@<W4>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v4 ^ (v4 + 2)) + 636) ^ (269 * (v4 ^ (v4 + 2)))) * (a2 == v2)) ^ (a1 + v4 - 45))))();
}

uint64_t sub_1D8F027C4(unsigned int a1)
{
  LODWORD(STACK[0x444]) = v2;
  return (*(uint64_t (**)(void))(v4 + 8 * (((a1 < ((v1 - 440) ^ 0x2A6u)) * v3) ^ v1)))();
}

uint64_t sub_1D8F02800@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)(((((v1 - 715496865 + (v2 ^ 0x255u)) * (v3 - 715496183)) >> 31) * (v2 + 253)) ^ v2)))();
}

uint64_t sub_1D8F02840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  *(_DWORD *)(v23 - 112) = (v21 + 289) ^ (1734042137
                                        * ((((2 * ((v23 - 120) ^ 0x50584DC6)) | 0x846CAAD6)
                                          - ((v23 - 120) ^ 0x50584DC6)
                                          + 1036626581) ^ 0xCEA0DBE0));
  *(void *)(v23 - 120) = v19;
  *(void *)(v23 - 104) = a19;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v20 + 8 * (v21 + 1660)))(v23 - 120);
  return (*(uint64_t (**)(uint64_t))(v20
                                            + 8
                                            * (((((51 * (v21 ^ 0x170) - 1) | 1) ^ 0x386) * (v22 != 1251276904)) ^ v21)))(v24);
}

uint64_t sub_1D8F02900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x508] = *(void *)(v72 + 8 * v67);
  STACK[0x638] = v70;
  STACK[0x640] = v68;
  unint64_t v73 = STACK[0x5B0];
  uint64_t v74 = (char *)&a9 + STACK[0x5B0] - 0x61CB92A9D1FA177FLL;
  STACK[0x648] = (unint64_t)v74;
  STACK[0x5B0] = v73 + 320;
  int v75 = *(_DWORD *)(v70 + a8);
  LODWORD(STACK[0x5A4]) = v75;
  int v76 = *(_DWORD *)(v70 - 0x7C014C707EC207DCLL);
  LODWORD(STACK[0x584]) = v76;
  int v77 = *(_DWORD *)(v70 - 0x7C014C707EC207D8);
  LODWORD(STACK[0x5F4]) = v77;
  int v78 = *(_DWORD *)(v70 - 0x7C014C707EC207D4);
  LODWORD(STACK[0x54C]) = v78;
  int v79 = *(unsigned __int8 *)(v70 - 0x7C014C707EC207C8) ^ 0xDB;
  if (v79 == 2)
  {
    LODWORD(STACK[0x4B0]) = *(_DWORD *)(v70 - 0x7C014C707EC207D0);
    LODWORD(STACK[0x524]) = 1417906743;
    return (*(uint64_t (**)(uint64_t))(v72 + 8 * ((734 * (v71 != 0x159)) ^ v71 ^ 0x475)))(253);
  }
  else if (v79 == 1)
  {
    STACK[0x3F8] = v73 + 320;
    LODWORD(STACK[0x524]) = v69;
    BOOL v81 = v68 >= a67 + v73 || (unint64_t)v74 >= v68 + 64;
    return (*(uint64_t (**)(void))(v72 + 8 * ((((LODWORD(STACK[0x364]) + 8) ^ (v71 + 194)) * v81) | (v71 + 1195))))();
  }
  else
  {
    unsigned int v83 = (*(_DWORD *)(v70 + a8) ^ 0xB6DE3D60) + (v75 ^ 0xB6DE3D60);
    *(_DWORD *)(v70 + a8) = v83 - 1226949280 - ((2 * v83) & 0x6DBC7AC0);
    unsigned int v84 = (*(_DWORD *)(v70 - 0x7C014C707EC207DCLL) ^ 0xB6DE3D60) + (v76 ^ 0xB6DE3D60);
    *(_DWORD *)(v70 - 0x7C014C707EC207DCLL) = v84 - 1226949280 - ((2 * v84) & 0x6DBC7AC0);
    unsigned int v85 = (*(_DWORD *)(v70 - 0x7C014C707EC207D8) ^ 0xB6DE3D60) + (v77 ^ 0xB6DE3D60);
    *(_DWORD *)(v70 - 0x7C014C707EC207D8) = v85 - 1226949280 - ((2 * v85) & 0x6DBC7AC0);
    unsigned int v86 = (*(_DWORD *)(v70 - 0x7C014C707EC207D4) ^ 0xB6DE3D60) + (v78 ^ 0xB6DE3D60);
    *(_DWORD *)(v70 - 0x7C014C707EC207D4) = v86 - 1226949280 - ((2 * v86) & 0x6DBC7AC0);
    STACK[0x5B0] = v73;
    return ((uint64_t (*)(void))STACK[0x508])();
  }
}

uint64_t sub_1D8F0290C()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((45
                                * (((v2 ^ 0x367 ^ (v1 - v3 - 1167 < (unint64_t)((v2 + 706083052) & 0xD5EA054D)
                                                                  - 1321)) & 1) == 0)) ^ v2)))();
}

void sub_1D8F0298C(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1374699841 * ((((2 * a1) | 0x97E9331C) - a1 + 873162354) ^ 0xA6008187));
  __asm { BRAA            X8, X17 }
}

void sub_1D8F02A74()
{
  *(_DWORD *)(v0 + 8) = -1008821960;
}

uint64_t sub_1D8F02AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                + 8
                                                                                * ((832
                                                                                  * (*(void *)(v5
                                                                                               + 8
                                                                                               * ((v4 & 0x3482ECF5) - 110))
                                                                                   - a1
                                                                                   - (((v4 & 0x3482ECF5) - 202441170) & 0xC1103F7 ^ 0x259uLL)
                                                                                   + 335 < 0x20)) ^ v4 & 0x3482ECF5u)))(937, 1584, 985697508, a4, 1161787223);
}

void sub_1D8F02B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26)
{
  int v30 = 1225351577 * ((((v29 - 144) | 0x5D966E65) - ((v29 - 144) & 0x5D966E65)) ^ 0x7E0CB673);
  *(_DWORD *)(v29 - 120) = v30 + v28 + 966 - 244;
  *(void *)(v29 - 128) = a26;
  *(_DWORD *)(v29 - 136) = v30 + a25 + 1619753341 + v28 + 556;
  *(void *)(v29 - 144) = v27;
  (*(void (**)(uint64_t))(v26 + 8 * ((v28 + 966) ^ 0xD59)))(v29 - 144);
  JUMPOUT(0x1D8EDC814);
}

void sub_1D8F02BEC(int a1@<W8>, uint64_t a2, int a3, unsigned int a4)
{
  unsigned int v8 = 1755732067 * (((&a2 | 0x4690B055) - (&a2 & 0x4690B055)) ^ 0x98560D8E);
  a3 = v8 + v6 + 1246;
  a4 = a1 - ((v7 - 1769867034) & 0xBEA5EE12) - v8 + (v6 ^ 0xAA93F24D);
  a2 = v5;
  (*(void (**)(uint64_t *))(v4 + 8 * (v6 ^ 0x6CF)))(&a2);
  JUMPOUT(0x1D8EDB5CCLL);
}

void sub_1D8F02CC8(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((a1 + 503769263 - 2 * (a1 & 0x1E06E8AF)) ^ 0xC0C05574);
  int v2 = *(_DWORD *)(*(void *)a1 - 0x774B811B42847B23);
  uint64_t v5 = *(void *)a1;
  unsigned int v4 = (535753261 * ((((&v4 | 0xFE862F58) ^ 0xFFFFFFFE) - (~&v4 | 0x179D0A7)) ^ 0xB8DDE88)) ^ (v1 - 1335);
  uint64_t v3 = (char *)*(&off_1F3082620 + v1 - 1399) - 4;
  (*(void (**)(unsigned int *))&v3[8 * v1 + 3192])(&v4);
  __asm { BRAA            X8, X17 }
}

void sub_1D8F02E10(int a1@<W8>)
{
  unint64_t v6 = STACK[0x5F8];
  int v7 = LODWORD(STACK[0x548]) - ((2 * LODWORD(STACK[0x548]) + 1565638936) & ((a1 ^ 0x6CF) + 1477460036)) - 625934117;
  int v8 = 1225351577 * ((323586429 - ((v5 - 200) | 0x1349897D) + ((v5 - 200) | 0xECB67682)) ^ 0xCF2CAE94);
  *(_DWORD *)(v5 - 164) = (a1 + 1695025767) ^ v8;
  *(_DWORD *)(v5 - 160) = (696906779 * v2 + 445231003) ^ v8;
  *(_DWORD *)(v5 - 192) = v7 ^ v8;
  *(void *)(v5 - 200) = STACK[0x368];
  *(void *)(v5 - 184) = v1;
  *(void *)(v5 - 176) = v3;
  *(void *)(v5 - 152) = v6;
  (*(void (**)(uint64_t))(v4 + 8 * (a1 ^ 0x1E3u)))(v5 - 200);
  LODWORD(STACK[0x520]) = *(_DWORD *)(v5 - 168);
  JUMPOUT(0x1D8ED2D30);
}

uint64_t sub_1D8F02EFC()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((((v2 + 237915324) ^ 0x33B) * (v3 < v1)) ^ (v2 + 237915324))))();
}

uint64_t sub_1D8F02F38()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v0 + 241918968) & 0xF19498BF) - 163)
                                     * (((v1 - 1576401727) & 0xFFFFFFFC) - LODWORD(STACK[0x3D0]) == -1576401730)) ^ v0)))();
}

void sub_1D8F02F8C()
{
}

uint64_t sub_1D8F02FE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1D8ED9E48(115, a1);
}

void sub_1D8F03048()
{
}

uint64_t sub_1D8F0305C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((v10 + 1350041754) <= 0x40) {
    int v12 = 64;
  }
  else {
    int v12 = v10 + 1350041754;
  }
  uint64_t v13 = (a3 - v8 - v9);
  uint64_t v14 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 8 * ((9 * ((v13 + v12) > 0xE)) ^ 0x3C7u));
  return v14(v13, v14, a3, a4, 3564672672, a6, a7, a8);
}

uint64_t sub_1D8F030E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v12 = (a6 - 1102148613);
  *(unsigned char *)(*(void *)(v11 - 120) + v12) ^= *(unsigned char *)(v9 + (v12 & 0xF)) ^ *(unsigned char *)((v12 & 0xF) + v7 + 2) ^ *(unsigned char *)((v12 & 0xF) + v8 + 4) ^ (119 * (v12 & 0xF));
  return (*(uint64_t (**)(void))(v10 + 8 * ((248 * (a6 - 1 == v6)) ^ (a5 - 1815))))();
}

void sub_1D8F0315C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1374699841 * ((a1 + 25318649 - 2 * (a1 & 0x18254F9)) ^ 0x6C764CF0);
  __asm { BRAA            X14, X17 }
}

uint64_t sub_1D8F03284()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((819
                                * ((((*(unsigned __int8 *)(v3 + 1) - 134) << ((v2 - 46) & 0xEF ^ 0xAE)) & v1)
                                 + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_1D8F032DC(uint64_t a1, int32x4_t a2, int32x4_t a3, int32x4_t a4, int32x4_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  return sub_1D8ECFFF8(a1, 2956067867, 2952790016, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, v33, a20, a21, a22, a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a2,
           a3,
           a4,
           a5);
}

uint64_t sub_1D8F032F0()
{
  STACK[0x4C8] = v0;
  return sub_1D8EC69B8();
}

uint64_t sub_1D8F03310@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((((a1 ^ 0x93) - 455) | 0x193) ^ 0x303) * (v2 == v1)) ^ a1 ^ 0x93)))();
}

void sub_1D8F0336C(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4, unsigned int a5, uint64_t a6)
{
  a5 = v7
     + 535753261
     * (((&a4 | 0x64DB4A1A) - &a4 + (&a4 & 0x9B24B5E0)) ^ 0x6E2F4435)
     + 683;
  a6 = a1;
  (*(void (**)(char *))(v6 + 8 * (v7 ^ 0x634u)))(&a4);
  JUMPOUT(0x1D8F033CCLL);
}

uint64_t sub_1D8F0340C()
{
  int v4 = 628203409 * ((((v3 - 200) | 0x9D8A8964) - (v3 - 200) + ((v3 - 200) & 0x62757698)) ^ 0x1F028557);
  unint64_t v5 = STACK[0x390];
  *(void *)(v3 - 200) = STACK[0x3A0];
  *(void *)(v3 - 192) = v5;
  *(_DWORD *)(v3 - 184) = v0 - v4 + 456;
  *(_DWORD *)(v3 - 180) = v1 - v4 - 375727839;
  *(void *)(v3 - 176) = STACK[0x3A8];
  unint64_t v6 = STACK[0x398];
  *(void *)(v3 - 160) = STACK[0x3D8];
  *(void *)(v3 - 152) = v6;
  (*(void (**)(uint64_t))(v2 + 8 * (v0 + 1850)))(v3 - 200);
  return (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v2
                                                             + 8
                                                             * (((*(_DWORD *)(v3 - 168) == -1008821960)
                                                               * (((v0 - 68) ^ 0x19B) + ((v0 - 68) | 0x411) - 787)) ^ v0)))(41, 583083080, (__n128)0);
}

uint64_t sub_1D8F0351C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3
                                                     + 8
                                                     * ((((v2 + 237916195) ^ 0x47A) * (v1 > 0x792ECF95)) ^ (v2 + 237915468))))(a1, 4057052139);
}

uint64_t sub_1D8F03568@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W4>, uint64_t a4@<X8>)
{
  int v10 = v8 & 7;
  int v11 = v9 + v8;
  *(void *)(a4 - 7 + v11 + v7 - a3 + ((a1 + 1017) ^ v6)) = *(void *)(v5
                                                                               - 7
                                                                               + v11
                                                                               + v7
                                                                               - a3
                                                                               + ((a1 + 1017) ^ v6));
  return (*(uint64_t (**)(uint64_t, void))(v4 + 8 * (int)(a1 ^ (16 * (v11 + a2 - a3 == v10)))))(a1, (v11 + a2 - a3 - v10 - 8));
}

void sub_1D8F035C4()
{
  *(_DWORD *)(v2 - 200) = (v0 + 2138963270) ^ (1374699841
                                             * (((v2 - 200) & 0x38489C1B | ~((v2 - 200) | 0x38489C1B)) ^ 0xAA437BED));
  (*(void (**)(uint64_t))(v1 + 8 * (v0 + 1955)))(v2 - 200);
  *(void *)(v2 - 192) = STACK[0x290];
  *(void *)(v2 - 176) = STACK[0x288];
  *(_DWORD *)(v2 - 200) = v0 - 1224239923 * ((v2 - 200 - 2 * ((v2 - 200) & 0x240E3B28) + 604912424) ^ 0xD6BDC6FF) + 999;
  *(unsigned char *)(v2 - 184) = 30 - 51 * ~(v2 + 56 - 2 * ((v2 + 56) & 0x28) + 40);
  (*(void (**)(uint64_t))(v1 + 8 * (v0 + 1968)))(v2 - 200);
  STACK[0x368] = 0;
  LODWORD(STACK[0x2F4]) = 1364664180;
  JUMPOUT(0x1D8F036B0);
}

uint64_t sub_1D8F036EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,uint64_t a24,int a25,int a26,uint64_t a27,int a28,uint64_t a29,uint64_t a30)
{
  unsigned int v33 = 628203409 * (((&a23 | 0x69391FCD) + (~&a23 | 0x96C6E032)) ^ 0xEBB113FF);
  a29 = a20;
  a30 = a13;
  a27 = a15;
  a25 = v30 - v33 + 36;
  a26 = -375727839 - v33 + a22;
  a23 = a14;
  a24 = a12;
  uint64_t v34 = (*(uint64_t (**)(uint64_t *))(v32 + 8 * (v30 ^ 0xA6A)))(&a23);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32
                                                                                         + 8
                                                                                         * ((1105
                                                                                           * (a28 == ((v30 - 386839468) & 0x170EB35B ^ 0xC3DE9B22))) ^ v30)))(v34, v31, 2393867127, 2415166058, 409351303, 1576401740);
}

uint64_t sub_1D8F03808()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v0 = (unint64_t *)*(&off_1F3082620
                           + ((107 * ((qword_1EA8BEAE8 - dword_1EA8BF6E0) ^ 0x58)) ^ byte_1D8FDF640[byte_1D8FDC5E0[(107 * ((qword_1EA8BEAE8 - dword_1EA8BF6E0) ^ 0x58))] ^ 0xB9])
                           - 42);
  uint64_t v1 = (char *)off_1F3082870 - 4;
  uint64_t v2 = off_1F3082A98;
  uint64_t v3 = (unint64_t *)*(&off_1F3082620
                           + (*((unsigned char *)off_1F3082A98
                                               + (*((unsigned __int8 *)off_1F3082870
                                                  + (107 * (*v0 ^ qword_1EA8BEAE8 ^ 0x58))
                                                  - 4) ^ 0x61u)) ^ (107 * (*v0 ^ qword_1EA8BEAE8 ^ 0x58)))
                           - 91);
  unint64_t v4 = (*v3 ^ *v0) - (void)&v10;
  unint64_t v5 = (139864171 * v4) ^ 0x945BD3199FE9FF58;
  unint64_t v6 = 139864171 * (v4 ^ 0x945BD3199FE9FF58);
  *int v0 = v5;
  unint64_t *v3 = v6;
  LOBYTE(v6) = 107 * (*(_DWORD *)v0 ^ 0x58 ^ v6);
  int v11 = (char *)*(&off_1F3082620
                + (*((unsigned char *)off_1F3082898
                                                  + (*((unsigned __int8 *)off_1F30827A0 + v6) ^ 0x34u)
                                                  - 4) ^ v6)
                + 13)
      - 4;
  unsigned int v12 = 1722 - 3804331 * (&v11 ^ 0xFA9EF356);
  LOBYTE(v6) = 107 * (*(_DWORD *)v0 ^ 0x58 ^ *(_DWORD *)v3);
  int v7 = (char *)*(&off_1F3082620
               + ((107 * (dword_1EA8BF6E0 ^ 0x58 ^ qword_1EA8BEAE8)) ^ byte_1D8FDC6E0[byte_1D8FD8A20[(107 * (dword_1EA8BF6E0 ^ 0x58 ^ qword_1EA8BEAE8))] ^ 0x45])
               + 102)
     - 4;
  (*(void (**)(char **))&v7[8
                                     * (*((unsigned char *)off_1F3082818
                                                         + (*((unsigned __int8 *)off_1F3082A80 + v6
                                                                                               - 12) ^ 0x90u)) ^ v6)
                                     + 15008])(&v11);
  int v11 = (char *)*(&off_1F3082620
                + ((107 * ((*(_DWORD *)v3 + *(_DWORD *)v0) ^ 0x58)) ^ v2[v1[(107 * ((*(_DWORD *)v3 + *(_DWORD *)v0) ^ 0x58))] ^ 0x3A]));
  unsigned int v12 = 1722
      - 3804331
      * (((&v11 | 0x9C15EF6E) - &v11 + (&v11 & 0x63EA1090)) ^ 0x668B1C38);
  (*(void (**)(char **))&v7[8
                                     * ((107 * ((*(_DWORD *)v3 + *(_DWORD *)v0) ^ 0x58)) ^ v2[v1[(107 * ((*(_DWORD *)v3 + *(_DWORD *)v0) ^ 0x58))] ^ 0x61])
                                     + 14616])(&v11);
  unsigned int v8 = 3804331
     * (((&v11 | 0x535E46B9) - &v11 + (&v11 & 0xACA1B940)) ^ 0xA9C0B5EF);
  HIDWORD(v11) = v8 + 996;
  LOBYTE(v11) = v8 ^ 0x7D;
  return (*(uint64_t (**)(char **))&v7[8
                                               * ((107 * ((*(_DWORD *)v3 - *(_DWORD *)v0) ^ 0x58)) ^ v2[v1[(107 * ((*(_DWORD *)v3 - *(_DWORD *)v0) ^ 0x58))] ^ 0x3A])
                                               + 15152])(&v11);
}

void sub_1D8F03B94(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x774B811B42847B23) = (((v3 + v2) * (v1 - 731987366)) ^ 0xBFFDDFFF)
                                         + 1789377272
                                         + ((2 * (v3 + v2) * (v1 - 731987366)) & 0x7FFBBFFE);
}

uint64_t sub_1D8F03C20(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  return sub_1D8F03CA0(a10 - 0x3303C932EE2955CFLL, a23 - 0x774B811B42847B1FLL, (v23 - 2139720646), v23 + (a1 ^ 0x2DA) - 433, 1730, 1225, 1652, 1364404617);
}

uint64_t sub_1D8F03CA0@<X0>(int a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (a2 ^ ((v2 > 1) * a1))))();
}

uint64_t sub_1D8F03D00@<X0>(unsigned int a1@<W0>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v16 = v15 > a1;
  *(_DWORD *)(a9 + 4 * (a3 + v9 + 939)) = a2;
  int v17 = (((v10 + 221) | 0x60) ^ (v12 + 873)) + v9;
  int v18 = v16 ^ (v17 < v11);
  BOOL v19 = v17 < v13;
  if (!v18) {
    BOOL v16 = v19;
  }
  return (*(uint64_t (**)(void))(v14 + 8 * ((103 * !v16) ^ v10)))();
}

uint64_t sub_1D8F03D68@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W6>, uint64_t a4@<X8>)
{
  *(_DWORD *)(*v6 + 4 * (v5 + v4)) = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4
                                                     + 8
                                                     * (((((6 * (v9 ^ a3) - 461) | 0x20) ^ v8) * (v7 == 0)) ^ (6 * (v9 ^ a3)))))(a1, 2785893064);
}

void sub_1D8F03DC4(uint64_t a1)
{
  int v1 = 1734042137 * (((a1 ^ 0xE6425DAD | 0xA65DFB69) - ((a1 ^ 0xE6425DAD) & 0xA65DFB69)) ^ 0x1CD16589);
  unsigned int v2 = *(_DWORD *)(*(void *)a1 - 0x65EF48AAD10F5708) - 156237695;
  unsigned int v3 = (*(_DWORD *)(a1 + 16) ^ v1) - 741383572;
  int v4 = (v3 < 0x13DC08CB) ^ (v2 < 0x13DC08CB);
  BOOL v5 = v2 < v3;
  if (v4) {
    BOOL v5 = v3 < 0x13DC08CB;
  }
  __asm { BRAA            X12, X17 }
}

void sub_1D8F03EE8(uint64_t a1, uint64_t a2, int a3)
{
  if ((v3 + v4 - 1) >= 0x7FFFFFFF) {
    int v8 = a3 - v5;
  }
  else {
    int v8 = v7;
  }
  *unint64_t v6 = v8;
  JUMPOUT(0x1D8F03F0CLL);
}

uint64_t sub_1D8F03F20(double a1)
{
  *unsigned int v2 = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 == 0) * v3) ^ v1)))();
}

uint64_t sub_1D8F03F44@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41)
{
  return (*(uint64_t (**)(void))(v42 + 8 * ((100 * ((a41 & a1) != 0)) ^ (v41 + 1055))))();
}

void sub_1D8F03F6C()
{
}

void sub_1D8F041FC()
{
}

uint64_t sub_1D8F04300()
{
  uint64_t v5 = v2 | 0xALL;
  unint64_t v6 = STACK[0x578];
  int v7 = 460628867 * ((v4 + 865504456 - 2 * ((v4 - 200) & 0x33968D90)) ^ 0x7F000FED);
  *(void *)(v4 - 200) = STACK[0x578];
  *(_DWORD *)(v4 - 188) = -1882357475 - v7 + v5;
  *(_DWORD *)(v4 - 184) = v7 + 1678855235;
  (*(void (**)(uint64_t))(v3 + 8 * (int)(v5 ^ 0x803)))(v4 - 200);
  STACK[0x458] = *(void *)(v3 + 8 * v5);
  unint64_t v8 = STACK[0x3F0];
  STACK[0x628] = v6;
  LODWORD(STACK[0x634]) = 744212085;
  STACK[0x530] = v8;
  BOOL v0 = ((*(_DWORD *)(v6 - 0x7C014C707EC207E4) << ((v5 + 116) ^ 0x7E)) & 0x4C ^ 0xC)
     + (*(_DWORD *)(v6 - 0x7C014C707EC207E4) & 0x3F ^ 0x43FD9DB8u)
     - 1140694485 >= ((v5 + 745) ^ 0x4BCu) - 1672;
  return (*(uint64_t (**)(void))(v3 + 8 * ((v0 | (8 * v0)) ^ ((int)v5 + 745))))();
}

uint64_t sub_1D8F043AC@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((1144 * ((v1 ^ 0x9Cu) - 715496465 + *(_DWORD *)(a1 + 532) < 0x7FFFFFFF)) | v1)))();
}

uint64_t sub_1D8F043F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v8 = v6 + ((((v3 - 1152252990) & 0x44ADFCF6) - 2079290923) ^ v3 ^ 0x174);
  if (v8 <= 0x40) {
    unsigned int v8 = 64;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                       + 8
                                                                       * ((2028 * (2079290358 - v4 - v5 + v8 > 0xE)) ^ v3)))(a1, a2, a3, 1388383568);
}

uint64_t sub_1D8F04484(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((451 * (a7 + 1 == v8 + 44)) ^ a4)))();
}

uint64_t sub_1D8F04550(int a1, uint64_t a2, int a3)
{
  int v9 = v7 - 150;
  int v10 = v4 + v3;
  int v11 = v10 + v5;
  if ((v10 + v5) <= 0x40) {
    int v11 = v6;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * (((302 * (v9 ^ 0x333) - 593) * (a3 - v10 < (a1 + v11))) ^ v9)))();
}

uint64_t sub_1D8F0459C(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5, int a6)
{
  *(unsigned char *)(a1 + v7 + a4 + (v6 ^ a3) * a6) = *(unsigned char *)(v8 + v7 + a4 + (v6 ^ a3) * a6);
  return (*(uint64_t (**)(void))(v9 + 8 * ((v6 + 23) ^ (4 * (v7 - 1 != a5)))))();
}

void sub_1D8F045D4()
{
}

uint64_t sub_1D8F045E0(uint64_t a1, int a2)
{
  BOOL v8 = v2 == v6 && v4 != a2;
  return (*(uint64_t (**)(void))(v5 + 8 * ((((v8 ^ (v3 - 66)) & 1) * (66 * (v3 ^ 0x3C6) + 1583)) ^ v3)))();
}

uint64_t sub_1D8F04638@<X0>(int a1@<W1>, int a2@<W8>)
{
  uint64_t v8 = 4 * (v4 - 172602597);
  unsigned int v9 = *(_DWORD *)(v6 + 4 * (v4 - 172602598));
  unsigned int v10 = (((2 * (v9 >> 30)) ^ 0xFFFFFFFD) + ((v9 >> 30) ^ (v3 + 2))) ^ v9;
  int v11 = ((v3 + 1566083941 * v10 - ((-1162799414 * v10) & v5)) ^ *(_DWORD *)(v6 + v8)) - v4;
  *(_DWORD *)(v6 + v8) = v11 - ((2 * v11 + 345205194) & v5) + 2096142096;
  uint64_t v12 = 1225351577
      * ((~((v7 - 144) | 0x217B100DE68A7068) + ((v7 - 144) & 0x217B100DE68A7068)) ^ 0x331247AA3AEF5781);
  *(void *)(v7 - 112) = v12 ^ 0x792ECD26;
  *(void *)(v7 - 128) = (v4 + 1860507714) ^ (unint64_t)v12;
  *(_DWORD *)(v7 - 144) = a2 + 750987848 - v12 + 63;
  *(_DWORD *)(v7 - 136) = ((a2 + 750987848) ^ 0x3D) + v12;
  *(_DWORD *)(v7 - 132) = v12;
  *(_DWORD *)(v7 - 120) = (a2 + 750987848) ^ v12;
  *(_DWORD *)(v7 - 116) = (a2 - 1926966970) ^ v12;
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 + a2 + 1666)))(v7 - 144);
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * *(int *)(v7 - 140)))(v13);
}

void sub_1D8F0479C()
{
}

uint64_t sub_1D8F047A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8 + 8 * (((a8 == ((v9 - 1518) ^ 0x5193885A)) * (((v9 - 1579) | 0x109) ^ 0x174)) ^ v9)))();
}

uint64_t sub_1D8F04800()
{
  *(_DWORD *)(*v2 + 4 * (v4 - 1 + v0)) = v1;
  return (*(uint64_t (**)(void))(v6 + 8 * ((((v3 ^ 0x5D0 ^ (v0 - 412)) + v4 >= 0) * v5) ^ v3)))();
}

void sub_1D8F04840()
{
}

uint64_t sub_1D8F04848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (int)(((a10 + 4 >= a10) * (((v11 ^ 0x5F9) + 196150639) & 0xF44EF7EF ^ 0x11C)) ^ v11 ^ 0x5F9)))();
}

uint64_t sub_1D8F048E4()
{
  return sub_1D8F048EC();
}

uint64_t sub_1D8F048EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int8x16_t v14 = *(int8x16_t *)(v10 + (v5 + a3 + v7));
  *(int8x16_t *)(a5 + v7) = vaddq_s8(vsubq_s8(v14, vandq_s8(vaddq_s8(v14, v14), v12)), v13);
  return (*(uint64_t (**)(void))(v11 + 8 * ((v6 + 247) ^ (16 * ((((v6 - 7) | v8) ^ v9) + v7 != 64)))))();
}

uint64_t sub_1D8F04938@<X0>(int a1@<W4>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((a2 - 539915761) < 0x38) * (((a1 + v2 + 231) | 0x142) - 378)) ^ (a1 + v2 + 839))))();
}

void sub_1D8F04978()
{
}

uint64_t sub_1D8F049EC@<X0>(uint64_t a1@<X2>, char a2@<W3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v12 = (v8 + v10);
  *(unsigned char *)(a1 + v12 + 4) = *(unsigned char *)(a3 + v12) ^ *(unsigned char *)(v4 + ((v7 - 34) & v12)) ^ *(unsigned char *)(((v7 - 34) & v12) + v5 + 1) ^ *(unsigned char *)(a4 + ((v7 - 34) & v12)) ^ (((v7 - 34) & v12) * a2) ^ v9;
  LODWORD(v12) = v8 - 1 != ((((v7 - 48) | 0x30) - 46) ^ v6);
  return (*(uint64_t (**)(void))(v11 + 8 * (int)((v12 | (8 * v12)) ^ (v7 + 1138))))();
}

void sub_1D8F04A64()
{
}

uint64_t sub_1D8F04A6C()
{
  BOOL v7 = v0 > v5;
  if (v7 == v1 + 524367443 < -869386372) {
    LOBYTE(v7) = v1 + 524367443 < v4;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v2 - 34) ^ v7) & 1) * v6) ^ v2)))();
}

uint64_t sub_1D8F04ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v7 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v6
                                                                   + 8
                                                                   * (v4 | (16
                                                                          * (((v5 > 0) ^ (v4 + 54)) & 1))));
  return v7(v7, a2, a3, a4);
}

void sub_1D8F04B58()
{
}

uint64_t sub_1D8F04B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)(v18 - 128) = v14;
  *(void *)(v18 - 120) = a13;
  *(_DWORD *)(v18 - 136) = v17 + ((((v18 - 136) | 0x35917215) - ((v18 - 136) & 0x35917215)) ^ 0xA13C3B4C) * v13 + 352;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v15 + 8 * (v17 ^ 0x438)))(v18 - 136);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * ((11 * (*(_DWORD *)(v18 - 132) > ((v17 - 704) ^ (v16 - 225)))) ^ v17)))(v19);
}

void sub_1D8F04C04()
{
}

uint64_t sub_1D8F04C98()
{
  return (*(uint64_t (**)(void))(*(void *)(v2 + 8 * (v0 ^ 0x31F))
                              - 4
                              + 8 * ((13 * ((v0 + v1 - 1) < 0x7FFFFFFF)) ^ v0)))();
}

uint64_t sub_1D8F04CD8@<X0>(int a1@<W8>)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 | 0x700u));
  return v3(v1);
}

uint64_t sub_1D8F04D0C(unsigned int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  int v11 = v7 + v6;
  int v12 = v11 + v8;
  if ((v11 + v8) <= 0x40) {
    int v12 = a4;
  }
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (((a6 - v11 < a2 + v9 + ((a1 + 258180742) & 0x1C77FD ^ (a6 - 1071)) + v12)
                                * ((131 * (a1 ^ 0x5A0)) ^ 0x6BE)) ^ a1)))();
}

void sub_1D8F04D80()
{
}

uint64_t sub_1D8F04E0C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v5 + 96) + 1428) = 596678623;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((*(_DWORD *)(a2 + 4) != v2 + v3 + 450 - 687) * ((149 * (v3 ^ 0xEF)) ^ 0x13D)) ^ v3)))();
}

uint64_t sub_1D8F04E6C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((a4 + a3 + ((v4 - 1533) | 0x445u) + 2147482389 < 8) * ((v4 - 1533) ^ 0xA5)) ^ v4)))();
}

unsigned char *sub_1D8F04EF0(unsigned char *result, unsigned int a2, unint64_t a3)
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
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_14:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_15:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_16:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_17:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_18:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_19:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_20:
          *(void *)uint64_t result = v5;
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
      *uint64_t result = a2;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D8F04FDC@<X0>(uint64_t a1@<X2>, int a2@<W8>)
{
  int v7 = *(_DWORD *)((char *)&STACK[0x250] + ((v5 + a2) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v5 + a2)) = v7 ^ 0x34;
  *(unsigned char *)(a1 + (v5 + a2 + 1)) = (BYTE1(v7) ^ 0x3D) + (v3 ^ 0x1B) - ((2 * (BYTE1(v7) ^ 0x3D)) & 0xA8);
  *(unsigned char *)(a1 + (v5 + a2 + 2)) = (BYTE2(v7) ^ 0xDE) - ((2 * (BYTE2(v7) ^ 0xDE)) & 0xA8) + 84;
  *(unsigned char *)(a1 + (v5 + a2 + 3)) = (HIBYTE(v7) ^ 0xB6) - ((2 * (HIBYTE(v7) ^ 0xB6)) & 0xA8) + 84;
  unsigned int v8 = LODWORD(STACK[0x2AC]) + 1866080202;
  BOOL v9 = v8 < v2;
  BOOL v10 = v5 + 2095141348 < v8;
  if (v5 + 2095141348 < v2 != v9) {
    BOOL v10 = v9;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * ((v10 * v4) ^ v3)))();
}

void sub_1D8F050BC()
{
  LODWORD(STACK[0x520]) = v0 + 133;
  JUMPOUT(0x1D8EF0504);
}

void sub_1D8F050CC()
{
}

uint64_t sub_1D8F050D4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  *(unsigned char *)(*v12 + (v10 + a7)) = *(unsigned char *)(*v12 + (v9 + a2));
  return (*(uint64_t (**)(void))(v11 + 8 * (v7 ^ (4 * ((((v7 + 123) ^ (v8 == 1723469490)) & 1) == 0)))))();
}

void SBSystemAppMain_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "failed to create tempPath for lastRestoreIdentifier : '%@'", (uint8_t *)&v2, 0xCu);
}

void SBSystemAppMain_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "failed to move '%@' to lastRestoreIdentifierPath : error=%@");
}

void SBSystemAppMain_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "failed to write lastRestoreIdentifier to '%@' : error=%@");
}

void SBSystemAppMain_cold_4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "finished purging defunct image caches", v2, v3, v4, v5, v6);
}

void SBSystemAppMain_cold_5()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "not checking for defunct image caches because the last build is too recent", v2, v3, v4, v5, v6);
}

void SBSystemAppMain_cold_6()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "no lastRestoreIdentifier to read", v2, v3, v4, v5, v6);
}

void SBSystemAppMain_cold_7(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "could not read lastRestoreIdentifier : error=%{public}@", (uint8_t *)&v2, 0xCu);
}

void SBSystemAppMain_cold_8(NSObject *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  uint64_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  int v7 = v4;
  _os_log_error_impl(&dword_1D85BA000, a1, OS_LOG_TYPE_ERROR, "Error setting low space io policy: %d (%s)", (uint8_t *)v5, 0x12u);
}

void ___languageMayHaveChanged_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Unknown language: [NSLocale preferredLanguages] is nil.", v1, 2u);
}

void ___languageMayHaveChanged_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = SBBootLanguages;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Got a language change notification but we're not doing anything! Boot languages: %{public}@, new preferred languages: %{public}@", (uint8_t *)&v2, 0x16u);
}

void __getWFSpringBoardWebClipMetadataClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWFSpringBoardWebClipMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIController.m", 217, @"Unable to find class %s", "WFSpringBoardWebClipMetadata");

  __break(1u);
}

void VoiceShortcutClientLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *VoiceShortcutClientLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBUIController.m", 215, @"%s", *a1);

  __break(1u);
}

void __getWFSpringBoardWorkflowRunnerClientClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWFSpringBoardWorkflowRunnerClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUIController.m", 216, @"Unable to find class %s", "WFSpringBoardWorkflowRunnerClient");

  __break(1u);
}

void SBWorkspaceApplicationForURLWithError_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "Unable to launch url %{public}@ due to restrictions on %{public}@");
}

void _SBWorkspaceCanLaunchApplication_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Cannot launch nil SBApplication (workspace app:%{public}@ url:%@)", (uint8_t *)&v2, 0x16u);
}

void _SBWorkspaceCanLaunchApplication_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Cannot launch application scene %{public}@ while restart manager is pending exit", v2, v3, v4, v5, v6);
}

void _SBWorkspaceCanLaunchApplication_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Cannot launch application scene %{public}@ while a termination assertion is held on to it's application", v2, v3, v4, v5, v6);
}

void _SBWorkspaceCanLaunchApplication_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Cannot launch application scene %{public}@ because it's application is being uninstalled", v2, v3, v4, v5, v6);
}

void _SBWorkspaceCanLaunchApplication_cold_5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Attempted to launch restricted application scene %{public}@", v2, v3, v4, v5, v6);
}

void _SBWorkspaceCanLaunchApplication_cold_6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Attempted to activate application scene %{public}@ while device locked", v2, v3, v4, v5, v6);
}

void _SBWorkspaceCanLaunchApplication_cold_7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Cannot launch application scene %{public}@ while it's application is being updated", v2, v3, v4, v5, v6);
}

void _SBWorkspaceCanLaunchApplication_cold_8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Cannot open URL in application scene %{public}@ while running setup.", v2, v3, v4, v5, v6);
}

void SBWorkspaceLauncherIsActive_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "don't call SBWorkspaceLauncherIsActive() without a window scene!", v1, 2u);
}

void SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void _SBEmergencyCallBackModeChangeHandler_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[SBTelephonyManager] _SBEmergencyCallBackModeChangeHandler: could not understand payload for %@ -> %@", (uint8_t *)&v3, 0x16u);
}

void __getRTTSettingsClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *RTTUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBTelephonyManager.m", 97, @"%s", *a1);

  __break(1u);
}

void __getRTTSettingsClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getRTTSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBTelephonyManager.m", 98, @"Unable to find class %s", "RTTSettings");

  __break(1u);
}

void ___updateLocale_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 8);
  int v3 = *(_DWORD *)(v2 + 32);
  LODWORD(v2) = *(_DWORD *)(v2 + 36);
  v4[0] = 67109634;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = v2;
  __int16 v7 = 2080;
  uint64_t v8 = "void _updateLocale(SBTelephonyManager *__strong, CTError (^__strong)(CTServerConnectionRef, CFStringRef *), void "
       "(^__strong)(CFStringRef), void (^__strong)(void))_block_invoke_2";
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "background CTServerConnection returned error: (%i, %i) in %s", (uint8_t *)v4, 0x18u);
}

void SPDNotificationCallback_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SPDNotificationErrorCallback_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SBCADifferenceMaskCalculate_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(NSString, "stringWithUTF8String:", "SBCADisplayDifferenceMask SBCADifferenceMaskCalculate(CADisplay *__strong _Nonnull, CADisplayMode *__strong _Nonnull, NSString *__strong _Nonnull, CGSize, NSUInteger)");
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  int v6 = @"SBDisplayControlling.m";
  __int16 v7 = 1024;
  int v8 = 68;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

void _SBXXDisplayIdentifierForPID_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXDisplayIdentifiersForPID_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void serializePropertyListObject_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "SBMIG: Unable to serialize property list object: %{public}@", v2, v3, v4, v5, v6);
}

void _SBXXAppSwitcherServiceRegister_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXApplicationDisplayIdentifiers_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXFrontmostApplicationDisplayIdentifier_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXBundlePathForDisplayIdentifier_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXLocalizedApplicationNameForDisplayIdentifier_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSuspendFrontmostApp_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXInterruptKeybagRefetch_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetWantsVolumeButtonEvents_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _SBXXSetWantsLockButtonEvents_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "kern_return_t _SBXXSetWantsLockButtonEvents(mach_port_t, int32_t, audit_token_t)";
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, v1, "Entitlement %{public}@ required to use %s", v2);
}

void _SBXXPresentPowerDownUI_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXReboot_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXShutDown_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetApplicationBadgeNumber_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetApplicationBadgeString_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetApplicationShowsProgress_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetAllApplicationsShowProgress_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetAllApplicationsShowSyncIndicator_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetShowsOverridesForRecording_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void _SBXXEnableLockScreenBundle_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXLockDeviceAndFeatures_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXDimScreen_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "%{public}@ requested screen dim, which is not supported", v2, v3, v4, v5, v6);
}

void _SBXXDimScreen_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetBatteryAwakeTime_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetRecentSleepsWakes_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetScheduledPowerEvents_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetBatteryUsageTimesInSeconds_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXAddWebClipToHomeScreen_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error: clip identifier '%@' is not a valid UUID", v2, v3, v4, v5, v6);
}

void _SBXXAddWebClipToHomeScreen_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXRemoveWebClipFromHomeScreen_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetNowPlayingAppBundleIdentifier_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetTopButtonFrames_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetDisplayIdentifiers_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetDisplayIdentifiersForExternalAccessoryProtocols_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetVoiceControlEnabled_cold_1(void *a1)
{
  [a1 pid];
  uint64_t v1 = BSProcessDescriptionForPID();
  uint64_t v2 = BSPrettyFunctionName();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x20u);
}

void _SBXXGetMediaVolume_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetMediaVolume_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetIconState_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetPendingIconState_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetFlattenedIconState_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetIconState_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetIconPNGData_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetVoiceRecognitionAudioInputPaths_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetAssistantRecognitionStrings_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "_SBXXSetAssistantRecognitionStrings";
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, v1, "%s %@", (uint8_t *)&v2);
}

void _SBXXSetAssistantRecognitionStrings_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetAlertSuppressionContexts_cold_1()
{
  BSPIDForAuditToken();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void _SBXXSetAlertSuppressionContextsBySectionIdentifier_cold_1()
{
  BSPIDForAuditToken();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 8u);
}

void _SBXXSetAppIsConnectedToEA_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "kern_return_t _SBXXSetAppIsConnectedToEA(mach_port_t, pid_t, uint8_t, audit_token_t)";
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, v1, "Entitlement %{public}@ required to use %s", v2);
}

void _SBXXGetWallpaperPreviewSurface_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315394;
  *(void *)(a2 + 4) = "_SBXXGetWallpaperPreviewSurface";
  *(_WORD *)(a2 + 12) = 2114;
  *(void *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, a3, (uint64_t)a3, "%s %{public}@", (uint8_t *)a2);
}

void _SBXXGetWallpaperPreview_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetWallpaperOptionsForLocations_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void _SBXXActivateAssistantWithContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _SBXXActivateAssistantWithContext_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "kern_return_t _SBXXActivateAssistantWithContext(mach_port_t, audit_token_t, uint32_t, sbs_property_list_data_t, m"
       "ach_msg_type_number_t)";
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, v0, v1, "Entitlement %{public}@ required to use %s", v2);
}

void _SBXXSetProceduralWallpaper_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void _SBXXSetWallpaperImageForLocations_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void _SBXXSetWallpaperImageSurfaceForLocations_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315394;
  *(void *)(a2 + 4) = "_SBXXSetWallpaperImageSurfaceForLocations";
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, a3, (uint64_t)a3, "%s %@", (uint8_t *)a2);
}

void _SBXXClearWallpaperAsset_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void _SBXXGetWallpaperOptions_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void _SBXXSetWallpaperVariant_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXGetWallpaperLegibilitySettings_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %@", v4, v5, v6, v7, 2u);
}

void _SBXXAddWallpaperAnimationSuspensionAssertion_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXAddAlertItemsSuppressionAssertion_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXAddBiometricAssertion_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetReachabilityEnabled_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXOverrideDisplayedDate_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void _SBXXSetIdleText_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v2, v3, "%s %{public}@", v4, v5, v6, v7, 2u);
}

void __getAAUIProfilePictureStoreClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppleAccountUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBDashBoardSetupViewController.m", 59, @"%s", *a1);

  __break(1u);
}

void __getAAUIProfilePictureStoreClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAAUIProfilePictureStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBDashBoardSetupViewController.m", 60, @"Unable to find class %s", "AAUIProfilePictureStore");

  __break(1u);
}

void protobufDisplayItemTypeFromType_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "We should not be serializing a capture extension display item", v1, 2u);
}

void protobufDisplayItemTypeFromType_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "We should not be serializing a plus display item", v1, 2u);
}

void _SBUnhideProtectedAppAlertControllerFor_cold_1(void *a1)
{
  uint64_t v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "Could not find bundle record to fetch localized name for: %@", v4, v5, v6, v7, v8);
}

void __getDMFApplicationPolicyMonitorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DeviceManagementLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBActivityManager.m", 44, @"%s", *a1);

  __break(1u);
}

void __getDMFApplicationPolicyMonitorClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getDMFApplicationPolicyMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBActivityManager.m", 45, @"Unable to find class %s", "DMFApplicationPolicyMonitor");

  __break(1u);
}

void _UIPhysicalButtonStateFromSBPhysicalButtonResult_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"_UIPhysicalButtonState _UIPhysicalButtonStateFromSBPhysicalButtonResult(SBPhysicalButtonResult)"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = @"SBPhysicalButtonCompletionHandling.m";
  __int16 v7 = 1024;
  int v8 = 24;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

void indexingAscendingLUT_cold_1()
{
  __assert_rtn("indexingAscendingLUT", "SBCornerFingerGestureClassifier.m", 19, "size >= 1");
}

void indexingAscendingLUT_cold_2()
{
}

void SBCreateResourceImageWithoutCaching_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "UIImage *SBCreateResourceImageWithoutCaching(NSString *__strong)";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%s ERROR: Could not open image \"%{public}@\" in the SpringBoard bundle.", (uint8_t *)&v2, 0x16u);
}

void SBChainableModifierMethodCacheQueryTrampolineForMethod_cold_1(const char *a1, uint64_t a2)
{
  __int16 v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "IMP  _Nonnull SBChainableModifierMethodCacheQueryTrampolineForMethod(struct objc_method_description, NSUInteger)");
  uint64_t v6 = NSStringFromSelector(a1);
  [v4 handleFailureInFunction:v5, @"SBChainableModifierMethodCache.m", 373, @"unsupported method signature! Please add an entry for %s to SUPPORTED_METHOD_SIGNATURES for %@", a2, v6 file lineNumber description];

  __break(1u);
}

void SBChainableModifierMethodCacheContextTrampolineForMethod_cold_1(const char *a1, uint64_t a2)
{
  __int16 v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "IMP  _Nonnull SBChainableModifierMethodCacheContextTrampolineForMethod(struct objc_method_description, NSUInteger)");
  uint64_t v6 = NSStringFromSelector(a1);
  [v4 handleFailureInFunction:v5, @"SBChainableModifierMethodCache.m", 386, @"unsupported method signature! Please add an entry for %s to SUPPORTED_METHOD_SIGNATURES for %@", a2, v6 file lineNumber description];

  __break(1u);
}

void SBTraitsSceneParticipantDelegateOrientationChangeInspector_cold_1()
{
}

void __getPRIconUserInterfaceSizeLargeSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBWallpaperIconStyleCoordinator.m", 28, @"%s", *a1);

  __break(1u);
}

void __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PosterUIFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBWallpaperIconStyleCoordinator.m", 25, @"%s", *a1);

  __break(1u);
}

void __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPUIMutableStylePickerHomeScreenConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBWallpaperIconStyleCoordinator.m", 26, @"Unable to find class %s", "PUIMutableStylePickerHomeScreenConfiguration");

  __break(1u);
}

void SBCommonInitialize_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SpringBoard failed to Clear the Board™: %@", (uint8_t *)&v2, 0xCu);
}

void SBFloatingConfigurationForMovingFloatingApplication_cold_1()
{
}

void SBFloatingConfigurationForMovingFloatingApplication_cold_2()
{
}

void SBFloatingConfigurationForMovingFloatingApplication_cold_3()
{
}

void HangTracerLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *HangTracerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBHungApplicationInteractionObserver.m", 27, @"%s", *a1);

  __break(1u);
}

void _SBIndirectGestureLog_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 name];
  __int16 v7 = objc_msgSend(a1, "sb_stringForState");
  OUTLINED_FUNCTION_0_20();
  uint64_t v11 = v8;
  __int16 v12 = v9;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "SBIndirectPanGestureRecognizer (%@, %@) – %@", v10, 0x20u);
}

void __getLNAppConnectionListenerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppIntentsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBMainDisplaySceneManager.m", 119, @"%s", *a1);

  __break(1u);
}

void __getLNAppConnectionListenerClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getLNAppConnectionListenerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBMainDisplaySceneManager.m", 120, @"Unable to find class %s", "LNAppConnectionListener");

  __break(1u);
}

void __SBSALogDictionaryDescribableDebug_block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = a2;
  int v6 = 134349314;
  uint64_t v7 = [v4 queryIteration];
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEBUG, "[%{public}lu] %@", (uint8_t *)&v6, 0x16u);
}

void SBStaticInitializer_cold_1()
{
}

void __getPBServerConnectionClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PasteboardLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SBProductivityGestureController.m", 32, @"%s", *a1);

  __break(1u);
}

void __getPBServerConnectionClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPBServerConnectionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBProductivityGestureController.m", 33, @"Unable to find class %s", "PBServerConnection");

  __break(1u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1F41071E0]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x1F4107208]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1F4107218]();
}

uint64_t ADMonotonicTimeGetCurrent()
{
  return MEMORY[0x1F4107228]();
}

uint64_t ADPushTimeIntervalForDistributionKeySinceStartTime()
{
  return MEMORY[0x1F4107230]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1F410ACF0]();
}

uint64_t AFHasGMSCapability()
{
  return MEMORY[0x1F410AD28]();
}

uint64_t AFSiriAnnouncementPlatformGetName()
{
  return MEMORY[0x1F410AE98]();
}

uint64_t AFSiriDeactivationReasonGetIsValidAndSpecified()
{
  return MEMORY[0x1F410AEA8]();
}

uint64_t AFSiriDeactivationReasonGetName()
{
  return MEMORY[0x1F410AEB0]();
}

uint64_t AFSiriUserNotificationAnnouncementSpeakingStateGetName()
{
  return MEMORY[0x1F410AEB8]();
}

uint64_t AFVisualIntelligenceCameraRestricted()
{
  return MEMORY[0x1F410AF90]();
}

uint64_t AMStringForAmbientMountState()
{
  return MEMORY[0x1F41081A8]();
}

uint64_t AMStringForAmbientPresentationState()
{
  return MEMORY[0x1F41081B0]();
}

uint64_t AMStringForAmbientTriggerState()
{
  return MEMORY[0x1F41081B8]();
}

uint64_t AMUIAmbientDisplayStyleIsRedMode()
{
  return MEMORY[0x1F41081C0]();
}

uint64_t AMUIAmbientDisplayStyleString()
{
  return MEMORY[0x1F41081C8]();
}

uint64_t APCoreFunctionalityEnabled()
{
  return MEMORY[0x1F4109008]();
}

uint64_t APGetDescriptionFor()
{
  return MEMORY[0x1F4109018]();
}

uint64_t AVCaptureCancelPrewarm()
{
  return MEMORY[0x1F40D0E70]();
}

uint64_t AVCapturePrewarmWithOptions()
{
  return MEMORY[0x1F40D0E80]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

OSStatus AudioServicesAddSystemSoundCompletion(SystemSoundID inSystemSoundID, CFRunLoopRef inRunLoop, CFStringRef inRunLoopMode, AudioServicesSystemSoundCompletionProc inCompletionRoutine, void *inClientData)
{
  return MEMORY[0x1F40D4E08](*(void *)&inSystemSoundID, inRunLoop, inRunLoopMode, inCompletionRoutine, inClientData);
}

uint64_t AudioServicesCreateSystemSoundIDWithPath()
{
  return MEMORY[0x1F40D4E20]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t AudioServicesPlaySystemSoundWithVibration()
{
  return MEMORY[0x1F40D4E50]();
}

void AudioServicesRemoveSystemSoundCompletion(SystemSoundID inSystemSoundID)
{
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1F40D4E70]();
}

uint64_t BBServerRun()
{
  return MEMORY[0x1F410D0F8]();
}

uint64_t BBServerSetAllowsPublication()
{
  return MEMORY[0x1F410D100]();
}

uint64_t BBServerSetDefaultExpirationComponents()
{
  return MEMORY[0x1F410D108]();
}

uint64_t BKHIDServicesGetCurrentDeviceOrientation()
{
  return MEMORY[0x1F410BD80]();
}

uint64_t BKHIDServicesGetNonFlatDeviceOrientation()
{
  return MEMORY[0x1F410BD88]();
}

uint64_t BKLogDisplay()
{
  return MEMORY[0x1F410BD98]();
}

uint64_t BKLogOrientationClient()
{
  return MEMORY[0x1F410BDB8]();
}

uint64_t BKLogOrientationDevice()
{
  return MEMORY[0x1F410BDC0]();
}

uint64_t BKLogOrientationGlobal()
{
  return MEMORY[0x1F410BDC8]();
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return MEMORY[0x1F410BDD0]();
}

uint64_t BKSDisplayBrightnessRestoreSystemBrightness()
{
  return MEMORY[0x1F410BDD8]();
}

uint64_t BKSDisplayBrightnessSet()
{
  return MEMORY[0x1F410BDE0]();
}

uint64_t BKSDisplayBrightnessSetWithImplicitTransaction()
{
  return MEMORY[0x1F410BDE8]();
}

uint64_t BKSDisplayBrightnessTransactionCreate()
{
  return MEMORY[0x1F410BDF0]();
}

uint64_t BKSDisplayServicesArchiveWithOptionsAndCompletion()
{
  return MEMORY[0x1F410BDF8]();
}

uint64_t BKSDisplayServicesDisplayIsTethered()
{
  return MEMORY[0x1F410BE00]();
}

uint64_t BKSDisplayServicesSetArrangement()
{
  return MEMORY[0x1F410BE18]();
}

uint64_t BKSDisplayServicesSetBlankingRemovesPower()
{
  return MEMORY[0x1F410BE20]();
}

uint64_t BKSDisplayServicesSetDisplayBlanked()
{
  return MEMORY[0x1F410BE28]();
}

uint64_t BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay()
{
  return MEMORY[0x1F410BE30]();
}

uint64_t BKSDisplayServicesTetherPrefsNeedImmediateUpdate()
{
  return MEMORY[0x1F410BE48]();
}

uint64_t BKSDisplayServicesUpdateMirroredDisplayOrientationWithInterfaceOrientation()
{
  return MEMORY[0x1F410BE50]();
}

uint64_t BKSDisplayServicesUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation()
{
  return MEMORY[0x1F410BE58]();
}

uint64_t BKSHIDEventGetBaseAttributes()
{
  return MEMORY[0x1F410BE80]();
}

uint64_t BKSHIDEventGetConciseDescription()
{
  return MEMORY[0x1F410BE88]();
}

uint64_t BKSHIDEventGetDigitizerAttributes()
{
  return MEMORY[0x1F410BE90]();
}

uint64_t BKSHIDEventGetPointerAttributes()
{
  return MEMORY[0x1F410BEA0]();
}

uint64_t BKSHIDEventGetProximityAttributes()
{
  return MEMORY[0x1F410BEA8]();
}

uint64_t BKSHIDEventGetSmartCoverAttributes()
{
  return MEMORY[0x1F410BEB8]();
}

uint64_t BKSHIDEventGetSmartCoverStateFromEvent()
{
  return MEMORY[0x1F410BEC0]();
}

uint64_t BKSHIDEventSendToProcess()
{
  return MEMORY[0x1F410BED8]();
}

uint64_t BKSHIDEventSendToProcessAndFollowDeferringRules()
{
  return MEMORY[0x1F410BEE0]();
}

uint64_t BKSHIDKeyboardGetDeviceProperties()
{
  return MEMORY[0x1F410BF28]();
}

uint64_t BKSHIDServicesAmbientLightSensorDisableAutoBrightness()
{
  return MEMORY[0x1F410BF48]();
}

uint64_t BKSHIDServicesAmbientLightSensorEnableAutoBrightness()
{
  return MEMORY[0x1F410BF50]();
}

uint64_t BKSHIDServicesCancelTouchesOnDisplay()
{
  return MEMORY[0x1F410BF58]();
}

uint64_t BKSHIDServicesCancelTouchesOnMainDisplay()
{
  return MEMORY[0x1F410BF60]();
}

uint64_t BKSHIDServicesGetRingerState()
{
  return MEMORY[0x1F410BF98]();
}

uint64_t BKSHIDServicesIsOrientationLockedWithOrientation()
{
  return MEMORY[0x1F410BFA8]();
}

uint64_t BKSHIDServicesIsSmartCoverClosed()
{
  return MEMORY[0x1F410BFB0]();
}

uint64_t BKSHIDServicesLastUserEventTime()
{
  return MEMORY[0x1F410BFB8]();
}

uint64_t BKSHIDServicesLockOrientation()
{
  return MEMORY[0x1F410BFC0]();
}

uint64_t BKSHIDServicesProximityDetectionActive()
{
  return MEMORY[0x1F410BFC8]();
}

uint64_t BKSHIDServicesProximityDetectionModePriority()
{
  return MEMORY[0x1F410BFD0]();
}

uint64_t BKSHIDServicesSetObjectInProximityIgnoresTouches()
{
  return MEMORY[0x1F410C028]();
}

uint64_t BKSHIDServicesSetOrientationClient()
{
  return MEMORY[0x1F410C030]();
}

uint64_t BKSHIDServicesUnlockOrientation()
{
  return MEMORY[0x1F410C038]();
}

uint64_t BKSHIDTouchSensitiveButtonRequestScanMode()
{
  return MEMORY[0x1F410C040]();
}

uint64_t BLSBacklightStateIsActive()
{
  return MEMORY[0x1F410C0C8]();
}

uint64_t BNEffectivePresentableDescription()
{
  return MEMORY[0x1F410C118]();
}

uint64_t BNIsPresentableIdentifiedByIdentification()
{
  return MEMORY[0x1F410C120]();
}

uint64_t BSAbsoluteMachTimeNow()
{
  return MEMORY[0x1F410C138]();
}

uint64_t BSAbsoluteTimeFromMachTime()
{
  return MEMORY[0x1F410C140]();
}

uint64_t BSAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x1F410C168]();
}

uint64_t BSBundleIDForAuditToken()
{
  return MEMORY[0x1F410C170]();
}

uint64_t BSCGFloatEpsilon()
{
  return MEMORY[0x1F410C190]();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x1F410C1B0]();
}

uint64_t BSCreateDeserializedArrayFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C1B8]();
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x1F410C1E8]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1F410C1F8]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C200]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C208]();
}

uint64_t BSDeserializeCFValueFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C210]();
}

uint64_t BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C228]();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C230]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C238]();
}

uint64_t BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C248]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C258]();
}

uint64_t BSDeviceOrientationDescription()
{
  return MEMORY[0x1F410C260]();
}

uint64_t BSDispatchBlockCreateWithQualityOfService()
{
  return MEMORY[0x1F410C268]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSDispatchQueueAssertNotMain()
{
  return MEMORY[0x1F410C298]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1F410C2B0]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1F410C2B8]();
}

uint64_t BSDispatchTimeWithInterval()
{
  return MEMORY[0x1F410C2C0]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1F410C2C8]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1F410C2D0]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1F410C2D8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1F410C2F0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSExecutablePathForPID()
{
  return MEMORY[0x1F410C308]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F410C310]();
}

uint64_t BSFloatByLinearlyInterpolatingFloats()
{
  return MEMORY[0x1F410C318]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1F410C340]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1F410C348]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1F410C358]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1F410C368]();
}

uint64_t BSFormattedTimeFromSeconds()
{
  return MEMORY[0x1F410C370]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1F410C398]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1F410C3A0]();
}

uint64_t BSInterfaceOrientationIsPortrait()
{
  return MEMORY[0x1F410C3A8]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x1F410C3B0]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x1F410C3C0]();
}

uint64_t BSIntervalMap()
{
  return MEMORY[0x1F410C3E0]();
}

uint64_t BSIntervalSubIntervalValueForValue()
{
  return MEMORY[0x1F410C400]();
}

uint64_t BSIsBeingDebugged()
{
  return MEMORY[0x1F410C410]();
}

uint64_t BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle()
{
  return MEMORY[0x1F410C418]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSLogGetAllRegisteredStateCaptureBlocks()
{
  return MEMORY[0x1F410C430]();
}

uint64_t BSLogStateCaptureCheckPlistSizeIsPermitted()
{
  return MEMORY[0x1F410C438]();
}

uint64_t BSMachSendRightRelease()
{
  return MEMORY[0x1F410C458]();
}

uint64_t BSMachTimeForTimeDifferenceFromMachTime()
{
  return MEMORY[0x1F410C468]();
}

uint64_t BSMonotonicReferencedTimeFromMachTime()
{
  return MEMORY[0x1F410C470]();
}

uint64_t BSNSStringFromCGRect()
{
  return MEMORY[0x1F410C488]();
}

uint64_t BSPIDExists()
{
  return MEMORY[0x1F410C4A0]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1F410C4A8]();
}

uint64_t BSPathExistsOnSystemPartition()
{
  return MEMORY[0x1F410C4C0]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1F410C4D0]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x1F410C4E0]();
}

uint64_t BSPrettyFunctionName()
{
  return MEMORY[0x1F410C4E8]();
}

uint64_t BSProcessDescriptionForPID()
{
  return MEMORY[0x1F410C4F8]();
}

uint64_t BSProcessNameForPID()
{
  return MEMORY[0x1F410C500]();
}

uint64_t BSPthreadCurrentEffectiveQualityOfService()
{
  return MEMORY[0x1F410C508]();
}

uint64_t BSRadiansToDegrees()
{
  return MEMORY[0x1F410C518]();
}

uint64_t BSRectByLinearlyInterpolatingRects()
{
  return MEMORY[0x1F410C520]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1F410C530]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1F410C538]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x1F410C540]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

uint64_t BSRunLoopPerformRelativeToCACommit()
{
  return MEMORY[0x1F410C558]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C568]();
}

uint64_t BSSerializeArrayToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C570]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C578]();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C580]();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5A8]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5C8]();
}

uint64_t BSSetMainThreadPriorityFixedForUI()
{
  return MEMORY[0x1F410C5D0]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x1F410C5D8]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x1F410C5E8]();
}

uint64_t BSSettingFlagIsExplicitNo()
{
  return MEMORY[0x1F410C5F0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x1F410C608]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x1F410C610]();
}

uint64_t BSSizeGreaterThanOrEqualToSize()
{
  return MEMORY[0x1F410C620]();
}

uint64_t BSSizeLessThanSize()
{
  return MEMORY[0x1F410C628]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1F410C630]();
}

uint64_t BSSizeSwap()
{
  return MEMORY[0x1F410C638]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1F410C650]();
}

uint64_t BSSystemHasCapability()
{
  return MEMORY[0x1F410C670]();
}

uint64_t BSTemporaryFileAtPath()
{
  return MEMORY[0x1F410C690]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x1F410C698]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1F410C6F8]();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return MEMORY[0x1F410C700]();
}

uint64_t BSUISurfaceWithColorSpaceAndDrawBlock()
{
  return MEMORY[0x1F410C710]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1F410C6B8]();
}

uint64_t BYSetupAssistantEnsureShortLivedTokenUpgrade()
{
  return MEMORY[0x1F414B078]();
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return MEMORY[0x1F414B080]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x1F414B088]();
}

uint64_t BYSetupAssistantPrepareLaunchSentinel()
{
  return MEMORY[0x1F414B098]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetContext()
{
  return MEMORY[0x1F40F4BD8]();
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1F40F4BE8]();
}

uint64_t CAMIsCameraButtonEnabled()
{
  return MEMORY[0x1F410FAA0]();
}

uint64_t CAMIsCameraOverlayAvailable()
{
  return MEMORY[0x1F410FAA8]();
}

uint64_t CAMIsCameraOverlayEnabled()
{
  return MEMORY[0x1F410FAB0]();
}

uint64_t CAMIsRemoteCameraOverlayEnabled()
{
  return MEMORY[0x1F410FAB8]();
}

uint64_t CAPointApplyTransform()
{
  return MEMORY[0x1F40F4C28]();
}

uint64_t CARenderRelease()
{
  return MEMORY[0x1F40F4C38]();
}

uint64_t CARenderRetain()
{
  return MEMORY[0x1F40F4C40]();
}

uint64_t CARenderServerCaptureLayerWithTransform()
{
  return MEMORY[0x1F40F4C48]();
}

uint64_t CARenderServerFlushIRDC()
{
  return MEMORY[0x1F40F4C50]();
}

uint64_t CARenderServerSetCacheAsynchronousSurfaces()
{
  return MEMORY[0x1F40F4CA8]();
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x1F40F4CC0]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1F40F4CE0](a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40F4CE8](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x1F40F4D00](t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1F40F4D10](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

uint64_t CATransform3DTranslateRight()
{
  return MEMORY[0x1F40F4D70]();
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x1F40F4DE8]();
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x1F4113058]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1F40D80A0](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8180](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86F8]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8700](allocator, name, tryAbbrev);
}

CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz)
{
  return (CFStringRef)MEMORY[0x1F40D8710](tz);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1F40D9C90]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1F40D9CB8]();
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1F40E96E0]();
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1F40DA9A8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99A8](provider, options);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x1F40DB0C8](path1, path2);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGRegionContainsPoint()
{
  return MEMORY[0x1F40DB318]();
}

uint64_t CGRegionCreateDifferenceWithRegion()
{
  return MEMORY[0x1F40DB328]();
}

uint64_t CGRegionCreateIntersectionWithRegion()
{
  return MEMORY[0x1F40DB338]();
}

uint64_t CGRegionCreateUnionWithRegion()
{
  return MEMORY[0x1F40DB348]();
}

uint64_t CGRegionCreateWithRect()
{
  return MEMORY[0x1F40DB350]();
}

uint64_t CGRegionGetBoundingBox()
{
  return MEMORY[0x1F40DB358]();
}

uint64_t CGRegionIntersectsRegion()
{
  return MEMORY[0x1F40DB360]();
}

uint64_t CGRegionIsEmpty()
{
  return MEMORY[0x1F40DB368]();
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

CGSize CGSizeFromString(NSString *string)
{
  MEMORY[0x1F4102AE0](string);
  result.height = v2;
  result.width = v1;
  return result;
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

uint64_t CHSIsWidgetExtensionPoint()
{
  return MEMORY[0x1F4111778]();
}

uint64_t CHSWidgetFamilyDescription()
{
  return MEMORY[0x1F4111788]();
}

uint64_t CHSWidgetFamilyForSBHIconGridSizeClass()
{
  return MEMORY[0x1F415BDE0]();
}

uint64_t CHSWidgetFamilyFromString()
{
  return MEMORY[0x1F4111790]();
}

uint64_t CHSWidgetFamilyMaskContainsFamily()
{
  return MEMORY[0x1F41117A8]();
}

uint64_t CPDateFormatStringForFormatType()
{
  return MEMORY[0x1F41092E0]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1F4109338]();
}

uint64_t CPPhoneNumberCopyActiveCountryCodeNoDefault()
{
  return MEMORY[0x1F4109340]();
}

uint64_t CPPhoneNumberSetActiveCountryCode()
{
  return MEMORY[0x1F4109390]();
}

uint64_t CPPhoneNumberSetHomeCountryCode()
{
  return MEMORY[0x1F4109398]();
}

uint64_t CPPhoneNumberSetNetworkCountryCode()
{
  return MEMORY[0x1F41093A0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CPSqliteSetDefaultPageCacheSize()
{
  return MEMORY[0x1F41098A0]();
}

uint64_t CPSqliteSetDefaultSharedCacheModeEnabledState()
{
  return MEMORY[0x1F41098A8]();
}

uint64_t CSAutobahnEnabledForPlatform()
{
  return MEMORY[0x1F4116E10]();
}

uint64_t CSComponentTransitionInputsMake()
{
  return MEMORY[0x1F4116E18]();
}

uint64_t CSEventShouldBeLogged()
{
  return MEMORY[0x1F4116E20]();
}

uint64_t CSMagSafeAccessoryTypeForSBSAccessoryType()
{
  return MEMORY[0x1F4116E28]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

uint64_t CTStartOTASP()
{
  return MEMORY[0x1F40DEFB8]();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return MEMORY[0x1F40DEFC0]();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return MEMORY[0x1F40DEFC8]();
}

uint64_t CTTelephonyCenterSetDefaultRunloop()
{
  return MEMORY[0x1F40DEFE0]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

uint64_t DNDModeSemanticTypeToString()
{
  return MEMORY[0x1F41175E0]();
}

uint64_t DOCCreateDefaultHomeScreenWidgetIntent()
{
  return MEMORY[0x1F4117758]();
}

uint64_t FBSApplicationTerminationReasonDescription()
{
  return MEMORY[0x1F411A178]();
}

uint64_t FBSApplicationTerminationReasonIsGraceful()
{
  return MEMORY[0x1F411A180]();
}

uint64_t FBSDisplayHDRModeToCADisplayHDRMode()
{
  return MEMORY[0x1F411A188]();
}

uint64_t FBSDisplayOverscanCompensationDescription()
{
  return MEMORY[0x1F411A190]();
}

uint64_t FBSDisplayOverscanCompensationForDisplayValue()
{
  return MEMORY[0x1F415BF98]();
}

uint64_t FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment()
{
  return MEMORY[0x1F411A198]();
}

uint64_t FBSInstallTypeIsCloudDemoted()
{
  return MEMORY[0x1F411A1B0]();
}

uint64_t FBSOpenApplicationErrorCreate()
{
  return MEMORY[0x1F411A1C0]();
}

uint64_t FBSProcessPrettyDescription()
{
  return MEMORY[0x1F411A1D0]();
}

uint64_t FBSProcessResourceAllowanceScale()
{
  return MEMORY[0x1F411A1F0]();
}

uint64_t FBSSceneSnapshotActionResponseForErrorCode()
{
  return MEMORY[0x1F411A200]();
}

uint64_t FBSystemAppBundleID()
{
  return MEMORY[0x1F4119F70]();
}

uint64_t FBSystemShellInitialize()
{
  return MEMORY[0x1F4119F78]();
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x1F40E0AA0]();
}

uint64_t FigCreateCGImageFromJPEG()
{
  return MEMORY[0x1F410FB98]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1F4103088]();
}

uint64_t GSEventDeviceOrientation()
{
  return MEMORY[0x1F411C8A0]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1F411C8F8]();
}

uint64_t GSMainScreenOrientation()
{
  return MEMORY[0x1F411C9E8]();
}

uint64_t GSMainScreenPixelSize()
{
  return MEMORY[0x1F411C9F0]();
}

uint64_t GetThermalState()
{
  return MEMORY[0x1F4116E68]();
}

uint64_t IOAccessoryManagerConfigurePower()
{
  return MEMORY[0x1F417A6A0]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x1F40E8948]();
}

uint64_t IOHIDEventCreateProximtyEvent()
{
  return MEMORY[0x1F40E8958]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1F40E89C8]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x1F40E89D0]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1F40E89F8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x1F40E8A18]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1F40E8A20]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1F40E8A28]();
}

uint64_t IOHIDEventGetTimeStampOfType()
{
  return MEMORY[0x1F40E8A30]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x1F40E8A80]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F88](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x1F40E8FB8](*(void *)&theAssertion, theProperty, theValue);
}

IOReturn IOPMCopyAssertionsByProcess(CFDictionaryRef *AssertionsByPID)
{
  return MEMORY[0x1F40E8FE8](AssertionsByPID);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9018]();
}

uint64_t IOPMUpdateDominoState()
{
  return MEMORY[0x1F40E90B8]();
}

uint64_t IOPMUpdateOnenessState()
{
  return MEMORY[0x1F40E90C0]();
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x1F40E90D0]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1F40E90D8]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1F40E90F0](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9118](blob, ps);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1F40E91F8](*(void *)&entry, entryID);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1F417A738]();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return MEMORY[0x1F417A778]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1F417A798]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x1F417A7A8]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1F417A7D0]();
}

uint64_t IOReportStateGetCount()
{
  return MEMORY[0x1F417A800]();
}

uint64_t IOReportStateGetInTransitions()
{
  return MEMORY[0x1F417A810]();
}

uint64_t IOReportStateGetNameForIndex()
{
  return MEMORY[0x1F417A818]();
}

uint64_t IOReportStateGetResidency()
{
  return MEMORY[0x1F417A820]();
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1F40E9238](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9318](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1F40E94E0]();
}

uint64_t IsBlankedForBLSBacklightDisplayMode()
{
  return MEMORY[0x1F410C108]();
}

uint64_t LCSFeatureEnabled()
{
  return MEMORY[0x1F412AB50]();
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x1F412F540]();
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1F417CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1F417CDF8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1F417CE50]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

uint64_t MRApplicationActivityGetStatus()
{
  return MEMORY[0x1F412DDC0]();
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return MEMORY[0x1F412DE08]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1F412E598]();
}

uint64_t MRMediaRemoteGetNowPlayingClientForOrigin()
{
  return MEMORY[0x1F412E5D0]();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return MEMORY[0x1F412E710]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueSync()
{
  return MEMORY[0x1F412E748]();
}

uint64_t MRMediaRemoteSendCommand()
{
  return MEMORY[0x1F412E750]();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return MEMORY[0x1F412E850]();
}

uint64_t MRNowPlayingClientGetProcessIdentifier()
{
  return MEMORY[0x1F412E880]();
}

uint64_t MRPlaybackQueueGetContentItemAtOffset()
{
  return MEMORY[0x1F412E8F0]();
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  return MEMORY[0x1F412E910]();
}

uint64_t MobileWiFiContainsRadio()
{
  return MEMORY[0x1F412FD80]();
}

uint64_t NCRegisterUserNotificationsUILogging()
{
  return MEMORY[0x1F4167420]();
}

uint64_t NCStringFromStageChangeTrigger()
{
  return MEMORY[0x1F4167460]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FE0](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1F40E7198](table, key, originalKey, value);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromAnalyticsEventType()
{
  return MEMORY[0x1F415BFA0]();
}

uint64_t NSStringFromBKSDisplayServicesCloneMirroringMode()
{
  return MEMORY[0x1F410C060]();
}

uint64_t NSStringFromBKSHIDEventSource()
{
  return MEMORY[0x1F410C070]();
}

uint64_t NSStringFromBKSHIDServicesProximityDetectionMode()
{
  return MEMORY[0x1F410C078]();
}

uint64_t NSStringFromBKSHIDUISensorChangeSource()
{
  return MEMORY[0x1F410C080]();
}

uint64_t NSStringFromBKSHIDUISensorDisplayState()
{
  return MEMORY[0x1F410C088]();
}

uint64_t NSStringFromBKSKeyModifierFlags()
{
  return MEMORY[0x1F410C090]();
}

uint64_t NSStringFromBKSSceneHostTouchBehavior()
{
  return MEMORY[0x1F410C098]();
}

uint64_t NSStringFromBLSAlwaysOnSuppressionReason()
{
  return MEMORY[0x1F410C0D8]();
}

uint64_t NSStringFromBLSAlwaysOnSuppressionType()
{
  return MEMORY[0x1F410C0E0]();
}

uint64_t NSStringFromBLSBacklightDisplayMode()
{
  return MEMORY[0x1F410C110]();
}

uint64_t NSStringFromBLSBacklightState()
{
  return MEMORY[0x1F410C0E8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

uint64_t NSStringFromBSVersionedPID()
{
  return MEMORY[0x1F410C6C8]();
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1F4102AE8](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

uint64_t NSStringFromCSHostableEntityContentMode()
{
  return MEMORY[0x1F4116E30]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromCoverSheetEventType()
{
  return MEMORY[0x1F4116E38]();
}

NSString *__cdecl NSStringFromDirectionalEdgeInsets(NSDirectionalEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4102B08](*(__n128 *)&insets.top, *(__n128 *)&insets.leading, *(__n128 *)&insets.bottom, *(__n128 *)&insets.trailing);
}

uint64_t NSStringFromFBProcessTaskState()
{
  return MEMORY[0x1F4119F80]();
}

uint64_t NSStringFromFBProcessVisibility()
{
  return MEMORY[0x1F4119F88]();
}

uint64_t NSStringFromFBSSceneActivityMode()
{
  return MEMORY[0x1F411A240]();
}

uint64_t NSStringFromFBSSceneJetsamMode()
{
  return MEMORY[0x1F411A250]();
}

uint64_t NSStringFromFBSceneContentState()
{
  return MEMORY[0x1F4119F90]();
}

uint64_t NSStringFromIdleTimerDuration()
{
  return MEMORY[0x1F415BAD8]();
}

uint64_t NSStringFromIdleWarnMode()
{
  return MEMORY[0x1F415BAE0]();
}

uint64_t NSStringFromLockSource()
{
  return MEMORY[0x1F415C4F0]();
}

uint64_t NSStringFromMTLumaDodgePillBackgroundLuminance()
{
  return MEMORY[0x1F412C688]();
}

uint64_t NSStringFromMTLumaDodgePillStyle()
{
  return MEMORY[0x1F412C690]();
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSStringFromSBFIdleTimerMode()
{
  return MEMORY[0x1F415BAE8]();
}

uint64_t NSStringFromSBINCameraCaptureDevice()
{
  return MEMORY[0x1F415BF88]();
}

uint64_t NSStringFromSBINCameraCaptureMode()
{
  return MEMORY[0x1F415BF90]();
}

uint64_t NSStringFromSBIdleTimerConfigSettingPrecedence()
{
  return MEMORY[0x1F415BFB8]();
}

uint64_t NSStringFromSBSAccessoryType()
{
  return MEMORY[0x1F415BFC0]();
}

uint64_t NSStringFromSBSAccidentalActivationMitigationSessionState()
{
  return MEMORY[0x1F415BFC8]();
}

uint64_t NSStringFromSBSAnalyticsActionButtonInteractionType()
{
  return MEMORY[0x1F415BFD0]();
}

uint64_t NSStringFromSBSHardwareButtonKind()
{
  return MEMORY[0x1F415BFD8]();
}

uint64_t NSStringFromSBSHardwareButtonSystemGlowStyle()
{
  return MEMORY[0x1F415BFE0]();
}

uint64_t NSStringFromSBSLibraryPodPresentationErrorCode()
{
  return MEMORY[0x1F415BFE8]();
}

uint64_t NSStringFromSBSceneViewDisplayMode()
{
  return MEMORY[0x1F415C4F8]();
}

uint64_t NSStringFromSBUIBiometricEvent()
{
  return MEMORY[0x1F415C550]();
}

uint64_t NSStringFromSBUIBiometricMatchMode()
{
  return MEMORY[0x1F415C558]();
}

uint64_t NSStringFromSBUIContinuityButtonEventType()
{
  return MEMORY[0x1F415C560]();
}

uint64_t NSStringFromSBUIContinuitySessionStep()
{
  return MEMORY[0x1F415C568]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4102B10](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t NSStringFromUnlockIntent()
{
  return MEMORY[0x1F415C500]();
}

uint64_t NSStringFromUnlockSource()
{
  return MEMORY[0x1F415C508]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1F4116EA8]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
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

uint64_t PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration()
{
  return MEMORY[0x1F4139FD8]();
}

uint64_t PBUIMaterialsIsLowQualityDevice()
{
  return MEMORY[0x1F413A008]();
}

uint64_t PBUIPostExternalWallpaperChangeNotificationAsSystemShell()
{
  return MEMORY[0x1F413A010]();
}

uint64_t PBUIStringForWallpaperVariant()
{
  return MEMORY[0x1F413A038]();
}

uint64_t PBUIWallpaperEnumerateVariantsForLocations()
{
  return MEMORY[0x1F413A040]();
}

uint64_t PBUIWallpaperLocationForVariant()
{
  return MEMORY[0x1F413A048]();
}

uint64_t PBUIWallpaperStyleDescription()
{
  return MEMORY[0x1F413A050]();
}

uint64_t PBUIWallpaperStyleTransitionStateMake()
{
  return MEMORY[0x1F413A058]();
}

uint64_t PKLegacyStockholmLog()
{
  return MEMORY[0x1F413B188]();
}

uint64_t PLCleanupForStoreDemoMode()
{
  return MEMORY[0x1F413F3E0]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

uint64_t PLLogTimeSensitiveRegisteredEvent()
{
  return MEMORY[0x1F4145D98]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1F4145DA8]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DC0]();
}

uint64_t PSCityForSpecifier()
{
  return MEMORY[0x1F4145E70]();
}

uint64_t PTUIClientInterface()
{
  return MEMORY[0x1F4147590]();
}

uint64_t PTUIServerInterface()
{
  return MEMORY[0x1F4147598]();
}

uint64_t RPTAmplitudeFromPagesOfView()
{
  return MEMORY[0x1F4147AA0]();
}

uint64_t SAEffectiveElementDescription()
{
  return MEMORY[0x1F415CA50]();
}

uint64_t SAElementDescription()
{
  return MEMORY[0x1F415CA58]();
}

uint64_t SAElementIdentityDescription()
{
  return MEMORY[0x1F415CA60]();
}

uint64_t SAElementIdentityEqualToIdentity()
{
  return MEMORY[0x1F415CA68]();
}

uint64_t SAHasActivityBehavior()
{
  return MEMORY[0x1F415CA70]();
}

uint64_t SAHasAlertBehavior()
{
  return MEMORY[0x1F415CA78]();
}

uint64_t SATargetElementFromBehaviorOverrider()
{
  return MEMORY[0x1F415CA80]();
}

uint64_t SAUILayoutSpecifyingOverriderForElement()
{
  return MEMORY[0x1F415CA88]();
}

uint64_t SAUILayoutSpecifyingOverriderForElementViewController()
{
  return MEMORY[0x1F415CA90]();
}

uint64_t SAUIStringFromElementViewInteractionResult()
{
  return MEMORY[0x1F415CA98]();
}

uint64_t SAUIStringFromElementViewLayoutMode()
{
  return MEMORY[0x1F415CAA0]();
}

uint64_t SBAlertItemIsUserDeactivate()
{
  return MEMORY[0x1F415C510]();
}

uint64_t SBBackgroundActivityAssertionServerInterface()
{
  return MEMORY[0x1F415C018]();
}

uint64_t SBBitmaskUnionIf()
{
  return MEMORY[0x1F415BAF0]();
}

uint64_t SBCardItemsControllerClientInterface()
{
  return MEMORY[0x1F415C020]();
}

uint64_t SBCardItemsControllerServerInterface()
{
  return MEMORY[0x1F415C028]();
}

uint64_t SBExternalDisplayEducationReasonMaskDescription()
{
  return MEMORY[0x1F415BAF8]();
}

uint64_t SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay()
{
  return MEMORY[0x1F415C040]();
}

uint64_t SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation()
{
  return MEMORY[0x1F415BB00]();
}

uint64_t SBFAudioCategoriesDisablingVolumeHUDIncludesCategory()
{
  return MEMORY[0x1F415BB18]();
}

uint64_t SBFAudioCategoriesDisablingVolumeHUDUnion()
{
  return MEMORY[0x1F415BB20]();
}

uint64_t SBFBSInterfaceOrientationMaskForBSInterfaceOrientation()
{
  return MEMORY[0x1F415BB28]();
}

uint64_t SBFCachesPathForSandboxPath()
{
  return MEMORY[0x1F415BB38]();
}

uint64_t SBFCreateIOSurfaceForImage()
{
  return MEMORY[0x1F415BB48]();
}

uint64_t SBFDescriptionForSensorType()
{
  return MEMORY[0x1F415BB50]();
}

uint64_t SBFEdgeInsetsRotateToInterfaceOrientation()
{
  return MEMORY[0x1F415BB60]();
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x1F415BB68]();
}

uint64_t SBFEffectiveDeviceClass()
{
  return MEMORY[0x1F415BB70]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1F415BB80]();
}

uint64_t SBFFirstInterfaceOrientationInInterfaceOrientationMask()
{
  return MEMORY[0x1F415BB98]();
}

uint64_t SBFInterfaceOrientationDescription()
{
  return MEMORY[0x1F415BBC0]();
}

uint64_t SBFInterfaceOrientationMaskContainsInterfaceOrientation()
{
  return MEMORY[0x1F415BBC8]();
}

uint64_t SBFInterfaceOrientationMaskForInterfaceOrientation()
{
  return MEMORY[0x1F415BBD0]();
}

uint64_t SBFIsChamoisExternalDisplayControllerAvailable()
{
  return MEMORY[0x1F415BBD8]();
}

uint64_t SBFIsChamoisFullScreenToStripGroupOpacityAvailable()
{
  return MEMORY[0x1F415BBE0]();
}

uint64_t SBFIsChamoisOverflowGestureAvailable()
{
  return MEMORY[0x1F415BBE8]();
}

uint64_t SBFIsChamoisStripDisabledWhenHiddenAvailable()
{
  return MEMORY[0x1F415BBF0]();
}

uint64_t SBFIsChamoisWindowingUIAvailable()
{
  return MEMORY[0x1F415BBF8]();
}

uint64_t SBFIsIRDCResetAvailable()
{
  return MEMORY[0x1F415BC00]();
}

uint64_t SBFIsMoreForegroundAppsAvailable()
{
  return MEMORY[0x1F415BC08]();
}

uint64_t SBFIsOnenessAvailable()
{
  return MEMORY[0x1F415BC10]();
}

uint64_t SBFIsOnenessHomeScreenEditingAvailable()
{
  return MEMORY[0x1F415BC18]();
}

uint64_t SBFIsOnenessHomeScreenOnEmbeddedAvailable()
{
  return MEMORY[0x1F415BC20]();
}

uint64_t SBFIsSAEHungryHomeAffordanceAvailable()
{
  return MEMORY[0x1F415BC28]();
}

uint64_t SBFIsSAEIncreasedInsetAvailable()
{
  return MEMORY[0x1F415BC30]();
}

uint64_t SBFIsSAEPersistentSiriAvailable()
{
  return MEMORY[0x1F415BC38]();
}

uint64_t SBFIsScreenLongevityAvailable()
{
  return MEMORY[0x1F415BC40]();
}

uint64_t SBFIsShellSceneKitAvailable()
{
  return MEMORY[0x1F415BC48]();
}

uint64_t SBFModifiedImageNameForName()
{
  return MEMORY[0x1F415BC68]();
}

uint64_t SBFRectApproximatelyEqualToRect()
{
  return MEMORY[0x1F415BC80]();
}

uint64_t SBFSafeProtocolCast()
{
  return MEMORY[0x1F415BC98]();
}

uint64_t SBFStringForAppearState()
{
  return MEMORY[0x1F415BCA0]();
}

uint64_t SBFStringForBSDeviceOrientation()
{
  return MEMORY[0x1F415BCA8]();
}

uint64_t SBFStringForBSInterfaceOrientation()
{
  return MEMORY[0x1F415BCB0]();
}

uint64_t SBFStringForUIInterfaceOrientation()
{
  return MEMORY[0x1F415BCB8]();
}

uint64_t SBFStringForUIInterfaceOrientationMask()
{
  return MEMORY[0x1F415BCC0]();
}

uint64_t SBFStringForUIUserInterfaceStyle()
{
  return MEMORY[0x1F415BCC8]();
}

uint64_t SBFTransformFromOrientationToOrientation()
{
  return MEMORY[0x1F415BCF0]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x1F415BCF8]();
}

uint64_t SBFloatEqualsFloat()
{
  return MEMORY[0x1F415C570]();
}

uint64_t SBFloatFloorForScale()
{
  return MEMORY[0x1F415C578]();
}

uint64_t SBFloatGreaterThanFloat()
{
  return MEMORY[0x1F415C580]();
}

uint64_t SBFloatRoundForMainScreenScale()
{
  return MEMORY[0x1F415C588]();
}

uint64_t SBFloatRoundForScale()
{
  return MEMORY[0x1F415C590]();
}

uint64_t SBHBundle()
{
  return MEMORY[0x1F415BDF0]();
}

uint64_t SBHCacheIconImagesForApplications()
{
  return MEMORY[0x1F415BDF8]();
}

uint64_t SBHConfigurationIdentifierFromDataSource()
{
  return MEMORY[0x1F415BE00]();
}

uint64_t SBHDefaultIconImageContinuousCornerRadiusForIconSize()
{
  return MEMORY[0x1F415BE08]();
}

uint64_t SBHDisplayCornerRadiusForScreenType()
{
  return MEMORY[0x1F415BE10]();
}

uint64_t SBHEmitEvent()
{
  return MEMORY[0x1F415BE18]();
}

uint64_t SBHEnumerateScreenTypes()
{
  return MEMORY[0x1F415BE20]();
}

uint64_t SBHGetApplicationIconImage()
{
  return MEMORY[0x1F415BE28]();
}

uint64_t SBHGetApplicationIconImageWithTraitCollection()
{
  return MEMORY[0x1F415BE30]();
}

uint64_t SBHGetApplicationIconLayerWithTraitCollection()
{
  return MEMORY[0x1F415BE38]();
}

uint64_t SBHGetScreenSpecification()
{
  return MEMORY[0x1F415BE40]();
}

uint64_t SBHHasCachedIconImagesForApplications()
{
  return MEMORY[0x1F415BE48]();
}

uint64_t SBHHomeScreenSearchAffordanceEnabled()
{
  return MEMORY[0x1F415BE50]();
}

uint64_t SBHIconGridSizeClassForString()
{
  return MEMORY[0x1F415BE60]();
}

uint64_t SBHIconGridSizeClassToStackLayoutSize()
{
  return MEMORY[0x1F415BE68]();
}

uint64_t SBHIconServicesOptionsForImageOptions()
{
  return MEMORY[0x1F415BE88]();
}

uint64_t SBHLibraryPresentationErrorForCode()
{
  return MEMORY[0x1F415BE90]();
}

uint64_t SBHPinViewWithinView()
{
  return MEMORY[0x1F415BE98]();
}

uint64_t SBHScreenTypeForCurrentDevice()
{
  return MEMORY[0x1F415BEA0]();
}

uint64_t SBHScreenTypeForShortString()
{
  return MEMORY[0x1F415BEA8]();
}

uint64_t SBHScreenTypeHasHomeButton()
{
  return MEMORY[0x1F415BEB0]();
}

uint64_t SBHScreenTypeIsMoreSpace()
{
  return MEMORY[0x1F415BEB8]();
}

uint64_t SBHScreenTypeIsPad()
{
  return MEMORY[0x1F415BEC0]();
}

uint64_t SBHScreenTypeIsPhone()
{
  return MEMORY[0x1F415BEC8]();
}

uint64_t SBHScreenTypeIsZoomed()
{
  return MEMORY[0x1F415BED0]();
}

uint64_t SBHSearchAffordancePresentationAnimationEnabled()
{
  return MEMORY[0x1F415BED8]();
}

uint64_t SBHShortStringForScreenType()
{
  return MEMORY[0x1F415BEE0]();
}

uint64_t SBHStringForIconGridSizeClass()
{
  return MEMORY[0x1F415BEF0]();
}

uint64_t SBHStringForScreenType()
{
  return MEMORY[0x1F415BEF8]();
}

uint64_t SBHStringFromContentVisibility()
{
  return MEMORY[0x1F415BF00]();
}

uint64_t SBHZPositionForScale()
{
  return MEMORY[0x1F415BF08]();
}

uint64_t SBIconImageInfoMake()
{
  return MEMORY[0x1F415BF28]();
}

uint64_t SBIconLocationGroupAddLocation()
{
  return MEMORY[0x1F415BF30]();
}

uint64_t SBIconLocationGroupContainsLocation()
{
  return MEMORY[0x1F415BF38]();
}

uint64_t SBIconViewQueryingBestIconViewForIcon()
{
  return MEMORY[0x1F415BF48]();
}

uint64_t SBIconViewQueryingDisplayingIconView()
{
  return MEMORY[0x1F415BF50]();
}

uint64_t SBLayoutDefaultSideLayoutElementWidth()
{
  return MEMORY[0x1F415C598]();
}

uint64_t SBLayoutSupportsSideLayoutRole()
{
  return MEMORY[0x1F415C5A0]();
}

uint64_t SBLogAccessibilityWindowHosting()
{
  return MEMORY[0x1F415C080]();
}

uint64_t SBLogActiveDisplay()
{
  return MEMORY[0x1F415C088]();
}

uint64_t SBLogAnalytics()
{
  return MEMORY[0x1F415C090]();
}

uint64_t SBLogAppQuitMonitor()
{
  return MEMORY[0x1F415C098]();
}

uint64_t SBLogAppShortcuts()
{
  return MEMORY[0x1F415C0A0]();
}

uint64_t SBLogApplicationRestrictionMonitoring()
{
  return MEMORY[0x1F415C0A8]();
}

uint64_t SBLogAutoLaunching()
{
  return MEMORY[0x1F415C0D8]();
}

uint64_t SBLogBanners()
{
  return MEMORY[0x1F415C0E0]();
}

uint64_t SBLogBiometricResource()
{
  return MEMORY[0x1F415C0E8]();
}

uint64_t SBLogCFUserNotifications()
{
  return MEMORY[0x1F415C0F0]();
}

uint64_t SBLogCameraCaptureAccidentalActivationMitigationSession()
{
  return MEMORY[0x1F415C0F8]();
}

uint64_t SBLogCameraCaptureAppConfiguration()
{
  return MEMORY[0x1F415C100]();
}

uint64_t SBLogCommon()
{
  return MEMORY[0x1F415BF58]();
}

uint64_t SBLogContinuitySessionService()
{
  return MEMORY[0x1F415C5A8]();
}

uint64_t SBLogCoverSheet()
{
  return MEMORY[0x1F415C110]();
}

uint64_t SBLogDashBoard()
{
  return MEMORY[0x1F415C128]();
}

uint64_t SBLogDashBoardHostedAppViewController()
{
  return MEMORY[0x1F415C138]();
}

uint64_t SBLogDisplayAssertions()
{
  return MEMORY[0x1F415C150]();
}

uint64_t SBLogDisplayControlling()
{
  return MEMORY[0x1F415C158]();
}

uint64_t SBLogDisplayEducation()
{
  return MEMORY[0x1F415C160]();
}

uint64_t SBLogDisplayScaleMapping()
{
  return MEMORY[0x1F415C168]();
}

uint64_t SBLogDisplayTransforming()
{
  return MEMORY[0x1F415C170]();
}

uint64_t SBLogDoNotDisturbWhileDriving()
{
  return MEMORY[0x1F415C180]();
}

uint64_t SBLogDockRecents()
{
  return MEMORY[0x1F415C188]();
}

uint64_t SBLogFBDisplayManagerCallbacks()
{
  return MEMORY[0x1F415C190]();
}

uint64_t SBLogFocusModes()
{
  return MEMORY[0x1F415C198]();
}

uint64_t SBLogHangTracer()
{
  return MEMORY[0x1F415C1A0]();
}

uint64_t SBLogHearingTestMode()
{
  return MEMORY[0x1F415C1B0]();
}

uint64_t SBLogHomeScreenConfiguration()
{
  return MEMORY[0x1F415C1B8]();
}

uint64_t SBLogIconDragging()
{
  return MEMORY[0x1F415C1C0]();
}

uint64_t SBLogIdleTimer()
{
  return MEMORY[0x1F415C1C8]();
}

uint64_t SBLogInCallPresentation()
{
  return MEMORY[0x1F415C1D0]();
}

uint64_t SBLogInputUI()
{
  return MEMORY[0x1F415C1D8]();
}

uint64_t SBLogKeyboardDismissal()
{
  return MEMORY[0x1F415C1E0]();
}

uint64_t SBLogKeyboardFocus()
{
  return MEMORY[0x1F415C1E8]();
}

uint64_t SBLogLockScreenBiometricCoordinator()
{
  return MEMORY[0x1F415C1F0]();
}

uint64_t SBLogLockScreenMesaUnlockBehaviors()
{
  return MEMORY[0x1F415C210]();
}

uint64_t SBLogLockScreenMesaWalletPreArm()
{
  return MEMORY[0x1F415C218]();
}

uint64_t SBLogLockScreenNowPlaying()
{
  return MEMORY[0x1F415C220]();
}

uint64_t SBLogMedusaDropDestination()
{
  return MEMORY[0x1F415C228]();
}

uint64_t SBLogMedusaKeyboard()
{
  return MEMORY[0x1F415C230]();
}

uint64_t SBLogPIP()
{
  return MEMORY[0x1F415C248]();
}

uint64_t SBLogProductivityGestures()
{
  return MEMORY[0x1F415C258]();
}

uint64_t SBLogRootController()
{
  return MEMORY[0x1F415C260]();
}

uint64_t SBLogSceneResolution()
{
  return MEMORY[0x1F415C268]();
}

uint64_t SBLogSceneSnapshots()
{
  return MEMORY[0x1F415C270]();
}

uint64_t SBLogScreenWake()
{
  return MEMORY[0x1F415C278]();
}

uint64_t SBLogSpotlight()
{
  return MEMORY[0x1F415C280]();
}

uint64_t SBLogStatusBarish()
{
  return MEMORY[0x1F415C288]();
}

uint64_t SBLogSystemApertureHosting()
{
  return MEMORY[0x1F415C290]();
}

uint64_t SBLogSystemNotes()
{
  return MEMORY[0x1F415C298]();
}

uint64_t SBLogSystemUIScene()
{
  return MEMORY[0x1F415C2A0]();
}

uint64_t SBLogTraitsArbiter()
{
  return MEMORY[0x1F415C2A8]();
}

uint64_t SBLogTransientOverlay()
{
  return MEMORY[0x1F415C2B0]();
}

uint64_t SBLogWallet()
{
  return MEMORY[0x1F415C2B8]();
}

uint64_t SBLogWallpaper()
{
  return MEMORY[0x1F415BD10]();
}

uint64_t SBLogWidgets()
{
  return MEMORY[0x1F415BF60]();
}

uint64_t SBLogZStack()
{
  return MEMORY[0x1F415C2C8]();
}

uint64_t SBPhoneOnPadFallbackLaunchSize()
{
  return MEMORY[0x1F415C5B0]();
}

uint64_t SBRectContainsPoint()
{
  return MEMORY[0x1F415C5B8]();
}

uint64_t SBRectCornerRadiiForRadius()
{
  return MEMORY[0x1F415C5C0]();
}

uint64_t SBRectEqualsRect()
{
  return MEMORY[0x1F415C5C8]();
}

uint64_t SBRectWithSize()
{
  return MEMORY[0x1F415C5D0]();
}

uint64_t SBRootFolderPageStateIsOnIconPage()
{
  return MEMORY[0x1F415BF68]();
}

uint64_t SBRootFolderPageStateIsOnLeadingCustomPage()
{
  return MEMORY[0x1F415BF70]();
}

uint64_t SBRootFolderPageStateIsSearch()
{
  return MEMORY[0x1F415BF78]();
}

uint64_t SBSBackgroundActivityAssertionClientInterface()
{
  return MEMORY[0x1F415C2D0]();
}

uint64_t SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary()
{
  return MEMORY[0x1F415C2E0]();
}

uint64_t SBSConvertPointFromDisplayToNeighboringDisplay()
{
  return MEMORY[0x1F415C2E8]();
}

uint64_t SBSConvertRectFromDisplayToNeighboringDisplay()
{
  return MEMORY[0x1F415C2F0]();
}

uint64_t SBSCreateOpenApplicationService()
{
  return MEMORY[0x1F415C330]();
}

uint64_t SBSDiffSystemNotesPresentationConfigurations()
{
  return MEMORY[0x1F415C340]();
}

uint64_t SBSDisplayEdgeAdjacentToNeighboringDisplay()
{
  return MEMORY[0x1F415C348]();
}

uint64_t SBSDisplayLayoutBacklightTransitionReasonForBacklightChangeSource()
{
  return MEMORY[0x1F415C350]();
}

uint64_t SBSDisplayLayoutTransitionReasonForSourceApplication()
{
  return MEMORY[0x1F415C358]();
}

uint64_t SBSDisplayScaleMaskFromScale()
{
  return MEMORY[0x1F415C368]();
}

uint64_t SBSHearingTestModeDescription()
{
  return MEMORY[0x1F415C388]();
}

uint64_t SBSIdentifierForSecureAppType()
{
  return MEMORY[0x1F415C390]();
}

uint64_t SBSInCallPresentationModeDescription()
{
  return MEMORY[0x1F415C398]();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x1F415C3A0]();
}

uint64_t SBSLibraryPodPresentationErrorCodeForErrorCode()
{
  return MEMORY[0x1F415BF80]();
}

uint64_t SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason()
{
  return MEMORY[0x1F415C3F0]();
}

uint64_t SBSRemoteAlertHandleInvalidationErrorDescription()
{
  return MEMORY[0x1F415C3F8]();
}

uint64_t SBSSecureAppTypeForIdentifier()
{
  return MEMORY[0x1F415C418]();
}

uint64_t SBSSetRequiredContextIdsForMedusaDragAndDropForSpotlightOnly()
{
  return MEMORY[0x1F415C430]();
}

uint64_t SBSStringFromWebClipServiceLaunchOrigin()
{
  return MEMORY[0x1F415C458]();
}

uint64_t SBSSystemNotesPresentationModeDescription()
{
  return MEMORY[0x1F415C460]();
}

uint64_t SBSUIHardwareButtonEventTypeDescription()
{
  return MEMORY[0x1F415C5E0]();
}

uint64_t SBSUIHardwareButtonEventTypeIsValid()
{
  return MEMORY[0x1F415C5E8]();
}

uint64_t SBSUIInCallWindowSceneSessionDestructionReasonDescription()
{
  return MEMORY[0x1F415C5F0]();
}

uint64_t SBSizeEqualsSize()
{
  return MEMORY[0x1F415C5F8]();
}

uint64_t SBStringFromAlertItemDeactivateReason()
{
  return MEMORY[0x1F415C518]();
}

uint64_t SBStringFromAnimationUpdateMode()
{
  return MEMORY[0x1F415BD18]();
}

uint64_t SBTransformFromOrientationToOrientation()
{
  return MEMORY[0x1F415C610]();
}

uint64_t SBTransformedRectWithScale()
{
  return MEMORY[0x1F415C618]();
}

uint64_t SBTransformedSizeWithScale()
{
  return MEMORY[0x1F415C620]();
}

uint64_t SBUICommonInitialize()
{
  return MEMORY[0x1F415C630]();
}

uint64_t SBUIContinuitySessionErrorCreate()
{
  return MEMORY[0x1F415C638]();
}

uint64_t SBUIConvertLockSourceToBacklightChangeSource()
{
  return MEMORY[0x1F415C520]();
}

uint64_t SBUIConvertUnlockSourceToBacklightChangeSource()
{
  return MEMORY[0x1F415C528]();
}

uint64_t SBUICurrentPasscodeStyleForUser()
{
  return MEMORY[0x1F415C640]();
}

uint64_t SBUIHasHIDRingerButton()
{
  return MEMORY[0x1F415C530]();
}

uint64_t SBUIHasHIDRingerSwitch()
{
  return MEMORY[0x1F415C538]();
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return MEMORY[0x1F415C650]();
}

uint64_t SBUILegibilitySettingsAreEqual()
{
  return MEMORY[0x1F415C660]();
}

uint64_t SBUIPrewarmKeyboard()
{
  return MEMORY[0x1F415C540]();
}

uint64_t SBUISystemApertureControlEdgeSpacing()
{
  return MEMORY[0x1F415C670]();
}

uint64_t SBUISystemApertureDefaultContentSizeCategory()
{
  return MEMORY[0x1F415C678]();
}

uint64_t SBUISystemApertureHorizontalItemSpacing()
{
  return MEMORY[0x1F415C680]();
}

uint64_t SBUISystemApertureInterItemSpacing()
{
  return MEMORY[0x1F415C688]();
}

uint64_t SBUISystemApertureVerticalItemSpacing()
{
  return MEMORY[0x1F415C698]();
}

uint64_t SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration()
{
  return MEMORY[0x1F415C6A0]();
}

uint64_t SBUnintegralizedRectCenteredAboutPoint()
{
  return MEMORY[0x1F415C6A8]();
}

uint64_t SBVelocityMatrixForUniform2DScaling()
{
  return MEMORY[0x1F415C6B0]();
}

uint64_t SBWakeLoggerSourceFromBacklightChangeSource()
{
  return MEMORY[0x1F415BD20]();
}

uint64_t SB_NSStringFromUIPressType()
{
  return MEMORY[0x1F415BD28]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

uint64_t SFLocalizedStringFromTableInBundleForLanguage()
{
  return MEMORY[0x1F414B030]();
}

uint64_t SFRegulatoryImage()
{
  return MEMORY[0x1F414B058]();
}

uint64_t STActivityAttributionUnsafeAuditTokenForPID()
{
  return MEMORY[0x1F415CAA8]();
}

uint64_t STBackgroundActivityIdentifierDescription()
{
  return MEMORY[0x1F415CAB0]();
}

uint64_t STBackgroundActivityIdentifiersDescription()
{
  return MEMORY[0x1F415CAB8]();
}

uint64_t STStatusItemIdentifierDescription()
{
  return MEMORY[0x1F415CB10]();
}

uint64_t STSystemStatusDescriptionForDomain()
{
  return MEMORY[0x1F415CB18]();
}

uint64_t STUIBackgroundActivityIdentiferRepresentsStyleOverride()
{
  return MEMORY[0x1F415CB30]();
}

uint64_t STUIBackgroundActivityIdentifierForStyleOverride()
{
  return MEMORY[0x1F415CB38]();
}

uint64_t STUIBackgroundActivityIdentifiersForStyleOverrides()
{
  return MEMORY[0x1F415CB40]();
}

uint64_t STUIStyleOverrideForBackgroundActivityIdentifier()
{
  return MEMORY[0x1F415CB48]();
}

uint64_t STUIStyleOverridesForBackgroundActivityIdentifiers()
{
  return MEMORY[0x1F415CB50]();
}

uint64_t SUSUICreateInstallationKeybagWithSecret()
{
  return MEMORY[0x1F415B168]();
}

uint64_t SUSUIRequiresAlertPresentationAfterUpdate()
{
  return MEMORY[0x1F415B170]();
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1F40F7180](task);
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1F415CB78]();
}

uint64_t TMIsAutomaticTimeZoneEnabled()
{
  return MEMORY[0x1F4115C80]();
}

uint64_t TUISOCountryCodeForMCC()
{
  return MEMORY[0x1F4163A50]();
}

uint64_t TUInCallRemoteAlertViewControllerClassName()
{
  return MEMORY[0x1F4163A58]();
}

uint64_t TUIsCallHandoffActivityType()
{
  return MEMORY[0x1F4163A68]();
}

uint64_t TUShouldShowCallHandoff()
{
  return MEMORY[0x1F4163AC0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1F4102B48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4102B58]();
}

BOOL UIAccessibilityShouldDifferentiateWithoutColor(void)
{
  return MEMORY[0x1F4102B70]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x1F4102B80](*(void *)&argc, argv, principalClassName, delegateClassName);
}

uint64_t UIApplicationSceneDeactivationReasonDescription()
{
  return MEMORY[0x1F4102B88]();
}

uint64_t UIApplicationSceneDeactivationReasonMaskContainsReason()
{
  return MEMORY[0x1F4102B90]();
}

uint64_t UIApplicationSceneDeactivationReasonMaskDescriptionComponents()
{
  return MEMORY[0x1F4102B98]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1F4102BA8]();
}

uint64_t UIContentSizeCategoryClip()
{
  return MEMORY[0x1F415C6B8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1F4102BD0]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4102BE0]();
}

uint64_t UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper()
{
  return MEMORY[0x1F4102BE8]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1F4102BF0]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1F4102BF8]();
}

uint64_t UIEdgeInsetsMin()
{
  return MEMORY[0x1F4102C00]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1F4102C10]();
}

uint64_t UIFormattedPhoneNumberFromString()
{
  return MEMORY[0x1F4102C20]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1F4102C98]();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1F4102CA8]();
}

uint64_t UIKeyboardForceOrderOutAutomaticAnimated()
{
  return MEMORY[0x1F4102CE0]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1F4102D40]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4102D50]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4102D58]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4102D60]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4102D68]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4102D70]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4102D78]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4102D80]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4102D88]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4102D90]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4102DC0]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x1F4102DC8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4102DD0]();
}

uint64_t UIRectIsDiscrete()
{
  return MEMORY[0x1F4102DD8]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1F4102DE0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4102DF0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4102E00]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4102E10]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1F4102E18]();
}

uint64_t UIStatusBarLocalizedNotChargingString()
{
  return MEMORY[0x1F4102E20]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1F4102E38]();
}

uint64_t UIViewControllerFromPresentable()
{
  return MEMORY[0x1F410C130]();
}

uint64_t UNSBuildForegroundAction()
{
  return MEMORY[0x1F4167428]();
}

uint64_t UNSDidCompleteDeliveryOfForegroundAction()
{
  return MEMORY[0x1F4167430]();
}

uint64_t UNSUserNotificationServerRun()
{
  return MEMORY[0x1F4167438]();
}

uint64_t VSPreferencesCopyAvailableLanguageIdentifiers()
{
  return MEMORY[0x1F4167D00]();
}

uint64_t VSPreferencesCopySpokenLanguageIdentifier()
{
  return MEMORY[0x1F4167D10]();
}

uint64_t VSRecognitionModelCopyResourceURL()
{
  return MEMORY[0x1F4167D28]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t WFCreateShortcutsSmallWidgetConfigurationIntent()
{
  return MEMORY[0x1F4176DD8]();
}

uint64_t WFCreateShortcutsWidgetConfigurationIntent()
{
  return MEMORY[0x1F4176DE0]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1F412FD90]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x1F412FDB0]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x1F412FDB8]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x1F412FDC8]();
}

uint64_t WiFiDeviceClientGetTypeID()
{
  return MEMORY[0x1F412FDD0]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x1F412FE00]();
}

uint64_t WiFiDeviceClientRegisterLQMCallback()
{
  return MEMORY[0x1F412FE10]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x1F412FE18]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x1F412FE38]();
}

uint64_t WiFiDeviceClientScanCancel()
{
  return MEMORY[0x1F412FE40]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1F412FE78]();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return MEMORY[0x1F412FE98]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1F412FEF0]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x1F412FF00]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1F412FF20]();
}

uint64_t WiFiManagerClientSetPower()
{
  return MEMORY[0x1F412FF30]();
}

uint64_t WiFiManagerClientSetProperty()
{
  return MEMORY[0x1F412FF38]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x1F412FF58]();
}

uint64_t WiFiNetworkGet11dCountryCodeFromIe()
{
  return MEMORY[0x1F412FF88]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1F412FFC8]();
}

uint64_t WiFiNetworkIsApplePersonalHotspot()
{
  return MEMORY[0x1F412FFF0]();
}

uint64_t XBApplicationSnapshotContentTypeMaskForContentType()
{
  return MEMORY[0x1F415B2E0]();
}

uint64_t XBCachesPathForApplicationInfo()
{
  return MEMORY[0x1F415B2E8]();
}

uint64_t XBInterfaceOrientationForString()
{
  return MEMORY[0x1F415B2F0]();
}

uint64_t XBInterfaceOrientationMaskForInterfaceOrientation()
{
  return MEMORY[0x1F415B2F8]();
}

uint64_t XBInterfaceOrientationMaskForInterfaceOrientationPair()
{
  return MEMORY[0x1F415B300]();
}

uint64_t XBInterfaceOrientationsAreOrthogonal()
{
  return MEMORY[0x1F415B308]();
}

uint64_t XBLogCapture()
{
  return MEMORY[0x1F415B310]();
}

uint64_t XBLogFileManifest()
{
  return MEMORY[0x1F415B318]();
}

uint64_t XBNextClockwiseInterfaceOrientation()
{
  return MEMORY[0x1F415B320]();
}

uint64_t XBOppositeInterfaceOrientation()
{
  return MEMORY[0x1F415B328]();
}

uint64_t XBRotationDegreesForInterfaceOrientationRotation()
{
  return MEMORY[0x1F415B330]();
}

uint64_t XBStatusBarStateMaskMatchesSettings()
{
  return MEMORY[0x1F415B338]();
}

uint64_t XBStringForInterfaceOrientation()
{
  return MEMORY[0x1F415B340]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1F41788E0]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x1F4178948]();
}

uint64_t _AXSClassicInvertColorsEnabled()
{
  return MEMORY[0x1F41789F8]();
}

uint64_t _AXSHandleHomeButtonPressSwallowedForGuidedAccess()
{
  return MEMORY[0x1F4178B30]();
}

uint64_t _AXSHandleTripleClickHomeButtonPress()
{
  return MEMORY[0x1F4178B38]();
}

uint64_t _AXSHomeButtonAssistant()
{
  return MEMORY[0x1F4178B68]();
}

uint64_t _AXSHomeButtonRestingUnlock()
{
  return MEMORY[0x1F4178B70]();
}

uint64_t _AXSHomeClickSpeed()
{
  return MEMORY[0x1F4178B78]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x1F4178CE8]();
}

uint64_t _AXSLockClickDownPressDurationScaleFactor()
{
  return MEMORY[0x1F4178D78]();
}

uint64_t _AXSLockClickVarianceScaleFactor()
{
  return MEMORY[0x1F4178D80]();
}

uint64_t _AXSPearlAuthenticationHapticsEnabled()
{
  return MEMORY[0x1F4178DD0]();
}

uint64_t _AXSSideButtonClickSpeed()
{
  return MEMORY[0x1F4179018]();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return MEMORY[0x1F4179088]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1F4179118]();
}

uint64_t _AXSVoiceOverTouchScreenCurtainEnabled()
{
  return MEMORY[0x1F4179138]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x1F4179218]();
}

uint64_t _BSHasInternalSettings()
{
  return MEMORY[0x1F410C6D8]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1F40D8D00]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1F40D8D18]();
}

uint64_t _CFPreferencesAppFullCloudSynchronize()
{
  return MEMORY[0x1F40D8F30]();
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x1F40D8F38]();
}

uint64_t _CFPreferencesGetAppBooleanValueWithContainer()
{
  return MEMORY[0x1F40D8F68]();
}

uint64_t _CTServerConnectionCopyMobileCountryCode()
{
  return MEMORY[0x1F40DF060]();
}

uint64_t _CTServerConnectionCopyMobileSubscriberHomeCountryList()
{
  return MEMORY[0x1F40DF070]();
}

uint64_t _CTServerConnectionCopyOperatorName()
{
  return MEMORY[0x1F40DF078]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1F40DF0E0]();
}

uint64_t _CTServerConnectionDisableRegistration()
{
  return MEMORY[0x1F40DF0E8]();
}

uint64_t _CTServerConnectionDormancySuspendAssertionCreate()
{
  return MEMORY[0x1F40DF0F0]();
}

uint64_t _CTServerConnectionDumpBasebandState()
{
  return MEMORY[0x1F40DF100]();
}

uint64_t _CTServerConnectionEnableRegistration()
{
  return MEMORY[0x1F40DF108]();
}

uint64_t _CTServerConnectionGetEmergencyCallBackMode()
{
  return MEMORY[0x1F40DF140]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1F40DF218]();
}

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return MEMORY[0x1F40DEE98]();
}

uint64_t _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle()
{
  return MEMORY[0x1F412C698]();
}

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x1F4130810]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x1F4130828]();
}

uint64_t _NETRBClientGetDynamicStoreKey()
{
  return MEMORY[0x1F4130830]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1F40E7358]();
}

uint64_t _NSStringFromUIPhysicalButton()
{
  return MEMORY[0x1F4102E58]();
}

uint64_t _NSStringFromUIPhysicalButtonState()
{
  return MEMORY[0x1F4102E60]();
}

uint64_t _SBApplicationStateGetMonitor()
{
  return MEMORY[0x1F415C4A8]();
}

uint64_t _SBFLoggingMethodProem()
{
  return MEMORY[0x1F415BD30]();
}

uint64_t _SBF_Private_IsD16()
{
  return MEMORY[0x1F415BD40]();
}

uint64_t _SBF_Private_IsD17()
{
  return MEMORY[0x1F415BD48]();
}

uint64_t _SBF_Private_IsD33OrSimilarDevice()
{
  return MEMORY[0x1F415BD50]();
}

uint64_t _SBF_Private_IsD52OrSimilarDevice()
{
  return MEMORY[0x1F415BD58]();
}

uint64_t _SBF_Private_IsD52ZoomedOrSimilarDevice()
{
  return MEMORY[0x1F415BD60]();
}

uint64_t _SBF_Private_IsD53()
{
  return MEMORY[0x1F415BD68]();
}

uint64_t _SBF_Private_IsD54()
{
  return MEMORY[0x1F415BD70]();
}

uint64_t _SBF_Private_IsD63()
{
  return MEMORY[0x1F415BD78]();
}

uint64_t _SBF_Private_IsD63Like()
{
  return MEMORY[0x1F415BD80]();
}

uint64_t _SBF_Private_IsD64()
{
  return MEMORY[0x1F415BD88]();
}

uint64_t _SBF_Private_IsD64Like()
{
  return MEMORY[0x1F415BD90]();
}

uint64_t _SBF_Private_IsD93Like()
{
  return MEMORY[0x1F415BD98]();
}

uint64_t _SBF_Private_IsD94Like()
{
  return MEMORY[0x1F415BDA0]();
}

uint64_t _SBF_Private_IsN84OrSimilarDevice()
{
  return MEMORY[0x1F415BDA8]();
}

uint64_t _SBF_Private_IsN84ZoomedOrSimilarDevice()
{
  return MEMORY[0x1F415BDB0]();
}

uint64_t _SBSAutolockTimerPostExternalChangeNotification()
{
  return MEMORY[0x1F415C4B8]();
}

uint64_t _UICreateCGImageFromIOSurfaceWithOptions()
{
  return MEMORY[0x1F4102ED8]();
}

uint64_t _UICreateScreenUIImageWithRotation()
{
  return MEMORY[0x1F4102EE0]();
}

uint64_t _UIDragInteractionDefaultLiftDelay()
{
  return MEMORY[0x1F4102EE8]();
}

uint64_t _UIHomeAffordanceSingleTapGatingEnabled()
{
  return MEMORY[0x1F4102EF8]();
}

uint64_t _UIInitializeDraggingSystem()
{
  return MEMORY[0x1F4102F10]();
}

uint64_t _UIMachTimeForMediaTime()
{
  return MEMORY[0x1F4102F20]();
}

uint64_t _UIPhysicalButtonSetForPhysicalButton()
{
  return MEMORY[0x1F4102F28]();
}

uint64_t _UIRenderDisplay()
{
  return MEMORY[0x1F4102F30]();
}

uint64_t _UIRenderingBufferCreate()
{
  return MEMORY[0x1F4102F38]();
}

uint64_t _UISheetFormSize()
{
  return MEMORY[0x1F4102F50]();
}

uint64_t _UISheetMinimumTopInset()
{
  return MEMORY[0x1F4102F58]();
}

uint64_t _UISheetPageSize()
{
  return MEMORY[0x1F4102F60]();
}

uint64_t _UISheetTransform()
{
  return MEMORY[0x1F4102F68]();
}

uint64_t _UIStatusBarResolvedStyleFromStyle()
{
  return MEMORY[0x1F4102F70]();
}

uint64_t _UIStatusBarStyleFromLegibilityStyle()
{
  return MEMORY[0x1F4102F78]();
}

uint64_t _UIStringFromWhitePointAdaptivityStyle()
{
  return MEMORY[0x1F4102F90]();
}

uint64_t _UISystemGestureLocationForScrollEventInView()
{
  return MEMORY[0x1F4102FA0]();
}

uint64_t _UISystemGestureLocationForTouchInView()
{
  return MEMORY[0x1F4102FA8]();
}

uint64_t _UISystemGestureLocationInView()
{
  return MEMORY[0x1F4102FB0]();
}

uint64_t _UISystemGestureTranslationInView()
{
  return MEMORY[0x1F4102FC0]();
}

uint64_t _UISystemGestureVelocityInView()
{
  return MEMORY[0x1F4102FC8]();
}

uint64_t _UIUserInterfaceSizeClassForHeight()
{
  return MEMORY[0x1F4103000]();
}

uint64_t _UIUserInterfaceSizeClassForWidth()
{
  return MEMORY[0x1F4103008]();
}

uint64_t _UIVisibilityEnvironmentForSceneIdentityToken()
{
  return MEMORY[0x1F4103010]();
}

uint64_t _UIWhitePointAdaptivityStyleFromString()
{
  return MEMORY[0x1F4103018]();
}

uint64_t _UIWindowConvertPointFromOrientationToOrientation()
{
  return MEMORY[0x1F4103020]();
}

uint64_t _UIWindowConvertRectFromOrientationToOrientation()
{
  return MEMORY[0x1F4103028]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WallpaperBackdropParametersForStyleAndAverageColor()
{
  return MEMORY[0x1F413A060]();
}

uint64_t _WallpaperStyleForBackgroundStyle()
{
  return MEMORY[0x1F413A070]();
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __SBSEventObserverGetDarwinNotificationFromEvent()
{
  return MEMORY[0x1F415C4C8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1F415C4D0]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1F415C4E0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

uint64_t _checkApplicationRestorationState()
{
  return MEMORY[0x1F4103030]();
}

uint64_t _deleteStateRestorationArchiveForApplication()
{
  return MEMORY[0x1F4103038]();
}

uint64_t _interfaceOrientedRegionGivenScreenRegion()
{
  return MEMORY[0x1F4103040]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _screenRegionGivenInterfaceOrientedRegion()
{
  return MEMORY[0x1F4103048]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t alm_app_will_activate_with_details()
{
  return MEMORY[0x1F417DDD8]();
}

uint64_t alm_app_will_activate_with_signpost_id()
{
  return MEMORY[0x1F417DDE0]();
}

uint64_t alm_app_will_launch_with_details_and_metrics_payload()
{
  return MEMORY[0x1F417DDE8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1F40CA540]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t convertDampingMassAndStiffnessToDampingRatioAndResponse()
{
  return MEMORY[0x1F415BDB8]();
}

uint64_t convertDampingRatioAndResponseToTensionAndFriction()
{
  return MEMORY[0x1F415BDC0]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1F40CBB40]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1F40CBB48]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CBB68]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1F40CC348](a1, a2, a3, a4);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1F4181598](block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40CC728](*(void *)&a1, *(void *)&a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

uint64_t logEventForAppleCare()
{
  return MEMORY[0x1F4116ED0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
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

void method_exchangeImplementations(Method m1, Method m2)
{
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1F41815F0](m);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

uint64_t msl_turn_on_stack_logging()
{
  return MEMORY[0x1F412C590]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40CD038](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x1F4181650](superclass, name, extraBytes);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_registerClassPair(Class cls)
{
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t pid_hibernate()
{
  return MEMORY[0x1F40CD758]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181B00](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return MEMORY[0x1F4181B20](proto, other);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

uint64_t secureAppTypeName()
{
  return MEMORY[0x1F415C4E8]();
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CDF78](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

uint64_t spd_client_session_create()
{
  return MEMORY[0x1F4181ED8]();
}

uint64_t spd_client_session_set_callbacks()
{
  return MEMORY[0x1F4181EE0]();
}

uint64_t spd_client_session_set_dispatch_queue()
{
  return MEMORY[0x1F4181EE8]();
}

int sqlite3_config(int a1, ...)
{
  return MEMORY[0x1F41820F8](*(void *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

long double tanh(long double __x)
{
  MEMORY[0x1F40CE430](__x);
  return result;
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1F415CCA8]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x1F415CD60]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x1F415CDB8]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1F415CDF8]();
}

uint64_t tcp_connection_fallback_watcher_create()
{
  return MEMORY[0x1F40F40D8]();
}

uint64_t tcp_connection_fallback_watcher_destroy()
{
  return MEMORY[0x1F40F40E0]();
}

uint64_t tcp_fallback_watcher_fallback_inuse()
{
  return MEMORY[0x1F40F4278]();
}

uint64_t tzlink()
{
  return MEMORY[0x1F4182548]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

void warnc(int a1, const char *a2, ...)
{
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_transactions_enable()
{
  return MEMORY[0x1F40CF308]();
}