void sub_1A2DF3998(void *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  *v2 = v1;
  *(void *)(v1 + 8) = *a1;
  *a1 = v1;
  JUMPOUT(0x1A2D43478);
}

uint64_t sub_1A2DF39B0()
{
  int v4 = (v0 - 85673100) & 0x51B57FF;
  uint64_t v5 = (*(uint64_t (**)(void))(v2 + 8 * (v0 + 5256)))(*v3);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (((((v4 - 613450023) & 0x24907DBF)
                                               + ((v4 - 1260942453) & 0x4B286CFF)
                                               - 6951)
                                              * (*v1 == 0)) ^ v4)))(v5);
}

uint64_t sub_1A2DF3A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v12 = (a6 - 1444960371);
  *(unsigned char *)(*(void *)(v11 - 120) + v12) ^= *(unsigned char *)(v8 + (v12 & 0xF)) ^ *(unsigned char *)((v12 & 0xF) + v7 + 2) ^ *(unsigned char *)((v12 & 0xF) + v9 + 4) ^ (119 * (v12 & 0xF));
  return (*(uint64_t (**)(void))(v10 + 8 * ((30 * (a6 - 1 == v6)) ^ (a5 - 722))))();
}

void sub_1A2DF3AAC()
{
}

void sub_1A2DF3B58()
{
}

uint64_t sub_1A2DF3B64@<X0>(int a1@<W0>, int a2@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (((a2 == ((a1 + 920) ^ 0x7A38A904)) * (a1 + 1671)) ^ a1)))(4294925278);
}

uint64_t sub_1A2DF3B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned int a13, uint64_t a14, unsigned int a15, int a16)
{
  unsigned int v18 = 366490169 * ((&a13 & 0xDD2C9BF0 | ~(&a13 | 0xDD2C9BF0)) ^ 0x347D324B);
  a14 = a11;
  a13 = v16 - ((2 * v16) & 0xC95D55D8) - 458315028 + v18;
  a15 = v18 + 2977;
  uint64_t v19 = (*(uint64_t (**)(unsigned int *))(v17 + 41200))(&a13);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8 * ((58 * ((((a16 == 1877363113) ^ 0x2E3BD524) & 1) == 0)) ^ 0x483u)))(v19);
}

void PIc2v4FsmbHb6FcVO9Fu()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * ((qword_1E95A4840 + dword_1E95A4858) ^ 0xD4)) ^ byte_1A302D080[byte_1A3028FA0[(-43 * ((qword_1E95A4840 + dword_1E95A4858) ^ 0xD4))] ^ 0x1D])
                + 71);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1EF5F46E0
                + (*((unsigned char *)off_1EF5F4D50
                                                  + (*((unsigned __int8 *)off_1EF5F4D68
                                                     + (-43 * (v1 ^ qword_1E95A4840 ^ 0xD4))
                                                     - 8) ^ 9u)
                                                  - 4) ^ (-43 * (v1 ^ qword_1E95A4840 ^ 0xD4)))
                + 183);
  unint64_t v3 = (unint64_t)&v5[*(void *)(v2 - 4) - v1];
  *(void *)(v0 - 4) = 1946842069 * v3 - 0x311DF6E51EDE312CLL;
  *(void *)(v2 - 4) = 1946842069 * (v3 ^ 0xCEE2091AE121CED4);
  v6[1] = 31090337 * (((v6 | 0xFFD9D2CD) + (~v6 | 0x262D32)) ^ 0x3858B285) + 1655392376;
  LOBYTE(v0) = -43 * (*(_DWORD *)(v0 - 4) ^ 0xD4 ^ *(_DWORD *)(v2 - 4));
  uint64_t v4 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * (dword_1E95A4858 ^ 0xD4 ^ qword_1E95A4840)) ^ byte_1A30292A0[byte_1A3023190[(-43 * (dword_1E95A4858 ^ 0xD4 ^ qword_1E95A4840))] ^ 9])
                + 55);
  (*(void (**)(_DWORD *))(v4
                                   + 8
                                   * ((*((unsigned char *)off_1EF5F49D0
                                                                      + (*((unsigned __int8 *)off_1EF5F4CF0
                                                                         + v0
                                                                         - 8) ^ 5u)
                                                                      - 4) ^ v0)
                                    + 4962)))(v6);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DF3EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(a9 + v11) = v13;
  return (*(uint64_t (**)(void))(v12
                              + 8
                              * ((7 * ((v9 & 0xFFFFFFFFFFFFFFF8) - ((v10 ^ 0x1D63u) - 576) == -2930)) ^ v10 ^ 0x1D63)))();
}

uint64_t sub_1A2DF3FF0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  *(void *)(a3 + v9) = *(void *)(v8 + v9);
  return (*(uint64_t (**)(void))(v10 + 8 * (((a7 == 0) * v7) ^ a4)))();
}

void sub_1A2DF4020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  STACK[0x490] = *(void *)(a6 + 8 * v6);
  JUMPOUT(0x1A2DF4038);
}

uint64_t sub_1A2DF4040(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v7
                              + 8 * (int)((((a5 + 2036) ^ (v6 - 764) ^ (a5 - 100932) & 0xDB7BDBFE) * (v5 == a3)) ^ a5)))();
}

uint64_t sub_1A2DF4080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49)
{
  unsigned int v54 = *(_DWORD *)(&a37 + ((v52 + v49) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v52 + v49)) = v54 ^ 0xD6;
  char v55 = (v54 >> (((v51 - 35) | 0x58) ^ 0x50)) ^ 0x26;
  *(unsigned char *)(a1 + (v52 + v49 + 2)) = (BYTE2(v54) ^ 0x70) - ((v54 >> 15) & 6) - 125;
  *(unsigned char *)(a1 + (v52 + v49 + 1)) = v55 - 2 * (v55 & 3) - 125;
  *(unsigned char *)(a1 + (v52 + v49 + 3)) = (HIBYTE(v54) ^ 0x17)
                                                 - 2 * ((HIBYTE(v54) ^ 0x17) & 0xB ^ HIBYTE(v54) & 8)
                                                 - 125;
  BOOL v56 = v52 + 237842976 < (a49 - 588083479);
  if (v52 + 237842976 < v50 != a49 - 588083479 < v50) {
    BOOL v56 = a49 - 588083479 < v50;
  }
  return (*(uint64_t (**)(void))(v53 + 8 * ((3799 * v56) ^ v51)))();
}

void sub_1A2DF4190()
{
}

void sub_1A2DF419C()
{
}

uint64_t sub_1A2DF4200(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(unsigned char *)(STACK[0x708] + (431 * a4 + 1455674282) % 0x3BDu) = a4 - ((((_BYTE)a4 << (v5 - 73)) + 38) & 0x36) - 50;
  return (*(uint64_t (**)(void))(a5 + 8 * ((228 * (a4 == 1700658652)) ^ v5)))();
}

uint64_t sub_1A2DF4288()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((25 * (((((v1 + 81) ^ 0xADC) - 3589) ^ v0) > 7)) ^ (v1 + 81))))();
}

uint64_t sub_1A2DF42C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  return (*(uint64_t (**)(void))(v9 + 8 * ((((a7 + v7) ^ (a5 + 1942) ^ ((a7 - 3149) | 0x1C0)) * (v8 == a6)) ^ a7)))();
}

uint64_t sub_1A2DF42F4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((53 * (STACK[0x4A0] != 0)) ^ (v0 + 2069))))();
}

void sub_1A2DF431C()
{
}

void lCUad()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * (dword_1E95A4560 ^ 0xD4 ^ qword_1E95A4840)) ^ byte_1A302D380[byte_1A30293A0[(-43 * (dword_1E95A4560 ^ 0xD4 ^ qword_1E95A4840))] ^ 0xB])
                + 64);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * (v1 ^ qword_1E95A4840 ^ 0xD4)) ^ byte_1A302D080[byte_1A3028FA0[(-43 * (v1 ^ qword_1E95A4840 ^ 0xD4))] ^ 0x4E])
                + 14);
  unint64_t v3 = (unint64_t)&v5[*(void *)(v2 - 4) ^ v1];
  *(void *)(v0 - 4) = 1946842069 * v3 + 0x311DF6E51EDE312CLL;
  *(void *)(v2 - 4) = 1946842069 * (v3 ^ 0xCEE2091AE121CED4);
  v6[1] = 31090337
        * (((v6 | 0x38DE38CA) - v6 + (v6 & 0xC721C730)) ^ 0xFF5F5883)
        + 1655392376;
  LOBYTE(v2) = -43 * (*(_DWORD *)(v0 - 4) ^ 0xD4 ^ *(_DWORD *)(v2 - 4));
  uint64_t v4 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * ((qword_1E95A4840 - dword_1E95A4560) ^ 0xD4)) ^ byte_1A3032870[byte_1A302D280[(-43 * ((qword_1E95A4840 - dword_1E95A4560) ^ 0xD4))] ^ 0xEE])
                + 26);
  (*(void (**)(_DWORD *))(v4
                                   + 8
                                   * ((*((unsigned char *)off_1EF5F49D0
                                                                      + (*((unsigned __int8 *)off_1EF5F4CF0
                                                                         + v2
                                                                         - 8) ^ 0xE6u)
                                                                      - 4) ^ v2)
                                    + 5044)))(v6);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DF463C()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((((v0 - 1642) | 0x200) ^ ((v0 ^ 0x4AA) + 1606))
                                * (*(_DWORD *)(v2 - 128) == *(_DWORD *)(v2 - 132))) ^ v0)))();
}

uint64_t sub_1A2DF4678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (((((a5 - 961631516) & 0x39514DBF) - 2450) * (v5 != v6)) ^ a5)))();
}

void sub_1A2DF46B4()
{
}

void sub_1A2DF4718(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W5>, char a6@<W8>)
{
  unint64_t v19 = ((a5 ^ v8) + 438391921) * (a5 ^ v8) + 757067451;
  unint64_t v20 = v19 % 0xC95119CF - (v11 & (2 * (v19 % 0xC95119CF))) + (a4 ^ (a1 + 4) ^ v12);
  unint64_t v21 = (v20 ^ v13) * v14 + (a2 ^ v8) * (unint64_t)(a2 ^ v8) + v15;
  unint64_t v22 = v21 - ((unint64_t)((v21 * (unsigned __int128)v16) >> 64) >> 31) * v17;
  unint64_t v23 = v22 * (v20 ^ v13) - (v18 & (2 * v22 * (v20 ^ v13))) + v10;
  uint64_t v24 = (a3 - 1923268849);
  *(unsigned char *)(v7 + v24) = (((v23 >> 15) ^ 7) - 2 * (((v23 >> 15) ^ 7) & 3) - 125) ^ *(unsigned char *)(v6 + v24);
  *(unsigned char *)(v7 + (a3 - 1923268848)) = (((v23 >> 23) ^ a6) - 2 * (((v23 >> 23) ^ a6) & 3) - 125) ^ *(unsigned char *)(v6 + (a3 - 1923268848));
  *(unsigned char *)(v7 + (a3 - 1923268847)) = (((v23 >> 31) ^ v9) - 2 * (((v23 >> 31) ^ v9) & 3) - 125) ^ *(unsigned char *)(v6 + (a3 - 1923268847));
  *(unsigned char *)(v7 + (v24 | 3)) = ((v23 >> 39) - 2 * ((v23 >> 39) & 3) + 3) ^ *(unsigned char *)(v6 + (v24 | 3));
  JUMPOUT(0x1A2DB6860);
}

uint64_t sub_1A2DF484C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  a15 = 2800 - ((((2 * &a13) | 0xDC55A5CA) - &a13 - 1848300261) ^ 0xA9ABB2AC) * v16;
  a13 = &STACK[0x370A1A23408CA0E];
  uint64_t v19 = (*(uint64_t (**)(unint64_t **))(v15 + 40952))(&a13);
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * ((5294 * (a14 == v18)) ^ v17)))(v19);
}

uint64_t sub_1A2DF48D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, int a20)
{
  v28 = &a20 + 6 * ((a9 - 790047027) & 0x2F171FFD ^ 0x902999BD) + 6 * v20;
  v28[2] = v21;
  v28[3] = v22;
  *((void *)v28 + 2) = v26;
  v28[6] = a17;
  a20 = ((a9 - a6 - 3416) ^ (v24 - 1)) + v20;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8 * ((858 * ((*(_DWORD *)(v27 + 48 * v25 + 32) + 1269729152) < 0x80000004)) ^ a9)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11);
}

uint64_t sub_1A2DF4980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  a14 = 31090337
      * (((&a13 | 0xBDBB4E1B) - &a13 + (&a13 & 0x4244B1E0)) ^ 0x7A3A2E52)
      + 1655392376;
  uint64_t v15 = (*(uint64_t (**)(int *))(v14 + 41128))(&a13);
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((511 * (((a13 == 1877363113) ^ 0x55) & 1)) ^ 0x8FEu)))(v15);
}

uint64_t sub_1A2DF4A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  a14 = v15 + 31090337 * (&a13 ^ 0xC7816049) + 1655391064;
  uint64_t v16 = (*(uint64_t (**)(int *))(v14 + 8 * (v15 ^ 0x1135)))(&a13);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * (((a13 == 1877363113) * (((v15 + 1098922724) | 0x260A1442) ^ 0x678A4202)) ^ v15)))(v16);
}

uint64_t sub_1A2DF4AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned int a13, uint64_t a14, unsigned int a15, uint64_t a16, unsigned int a17)
{
  unsigned int v22 = 366490169
      * (((&a13 | 0x9ADFDBD4) - &a13 + (&a13 & 0x65202428)) ^ 0x8C718D90);
  a14 = a11;
  a13 = v18 - ((2 * v18) & 0xC95D55D8) - 458315028 + v22;
  a15 = v22 + 2977;
  (*(void (**)(unsigned int *))(v19 + 41200))(&a13);
  uint64_t v23 = *(void *)(v17 + 8);
  unsigned int v24 = ((2 * (&a13 & 0x4AAD7078) - &a13 - 1252880509) ^ 0x72D3EFCA) * v21;
  a17 = (*(_DWORD *)v17 ^ 0xEAEEDFFE) - v24 + ((2 * *(_DWORD *)v17) & 0xD5DDBFFC) + 1606417012;
  a16 = a11;
  a15 = v24 + 2212;
  a14 = v23;
  (*(void (**)(unsigned int *))(v19 + 41280))(&a13);
  int v25 = *(_DWORD *)(v17 + 16);
  unsigned int v26 = (&a13 ^ 0xC7816049) * v21;
  a14 = *(void *)(v17 + 24);
  a15 = v26 + 2212;
  a17 = (v25 ^ 0xDEFEFBFE) - v26 + ((2 * v25) & 0xBDFDF7FC) + 1806687860;
  a16 = a11;
  uint64_t v27 = (*(uint64_t (**)(unsigned int *))(v19 + 41280))(&a13);
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * ((903 * (a13 == v20)) ^ 0x99Du)))(v27);
}

uint64_t sub_1A2DF4C88()
{
  uint64_t v8 = v6;
  unsigned int v9 = v1
     + v2
     + 366490169
     * (((&v7 | 0xD07089EE) - &v7 + (&v7 & 0x2F8F7610)) ^ 0xC6DEDFAA)
     + 2737;
  (*(void (**)(uint64_t *))(v0 + 8 * (v1 + v2 + 3940)))(&v7);
  uint64_t v8 = v5;
  unsigned int v9 = v1 + 366490169 * (((&v7 | 0x3C1B8A0) - (&v7 & 0x3C1B8A0)) ^ 0x156FEEE4) + v2 + 2737;
  (*(void (**)(uint64_t *))(v0 + 8 * (v2 ^ 0x2E3BC139)))(&v7);
  return (v3 - 1877363113);
}

void sub_1A2DF4DE4(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 + 1697562443 * ((a1 - 543953222 - 2 * (a1 & 0xDF93EEBA)) ^ 0x803D63E);
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = (uint64_t)*(&off_1EF5F46E0 + (v1 ^ 0x129));
  (*(void (**)(void, uint64_t (*)()))(v3 + 8 * (v1 ^ 0x1572)))(*(&off_1EF5F46E0 + v1 - 291), sub_1A2D41DCC);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1A2DF4E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(v5 + v7 + a3 + v4 - 129) = v6;
  return (*(uint64_t (**)(void))(v9 + 8 * ((((unint64_t)(v5 + v7) < 0x38) * v8) ^ v3)))();
}

uint64_t sub_1A2DF4ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  a14 = 31090337 * (((&a13 | 0xF2C51168) - (&a13 & 0xF2C51168)) ^ 0x35447121) + 1655392376;
  uint64_t v15 = (*(uint64_t (**)(int *))(v14 + 41128))(&a13);
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((222 * (a13 == 1877363113)) ^ 0x25Eu)))(v15);
}

uint64_t sub_1A2DF4F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((106 * (a7 + 1 != v8 + 64)) ^ a5)))();
}

uint64_t sub_1A2DF503C(uint64_t a1, uint64_t a2)
{
  return sub_1A2DF5064(a1, a2, 0);
}

uint64_t sub_1A2DF5064(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int a7)
{
  uint64_t v14 = (v11 + v10 - a3);
  long long v15 = *(_OWORD *)(v9 + v14 - 15);
  long long v16 = *(_OWORD *)(v9 + v14 - 31);
  uint64_t v17 = v8 + v14;
  *(_OWORD *)(v17 - 15) = v15;
  *(_OWORD *)(v17 - 31) = v16;
  return (*(uint64_t (**)(void))(v7 + 8 * (((a6 + a3 == v12) * a7) ^ (v13 + a4 + 223))))();
}

void sub_1A2DF50AC()
{
}

uint64_t sub_1A2DF50B4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 1761959447 * (((a1 | 0xFABB8A99) - a1 + (a1 & 0x5447566)) ^ 0x5B1C4B5D);
  return (*((uint64_t (**)(void))*(&off_1EF5F46E0 + (v1 ^ 0x11B9))
          + ((((*((_DWORD *)*(&off_1EF5F46E0 + v1 - 4450) - 1) - 646796618) < 0xFFFFFFD1)
            * (143 * (v1 ^ 0x11C2) - 1815)) ^ v1)))();
}

void sub_1A2DF5160()
{
}

uint64_t sub_1A2DF51C8(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 8) - 1314530549 * (a1 ^ 0xB10986CE);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)a1;
  unsigned int v6 = (375636451 * (((v5 | 0xBD6B362B) + (~v5 | 0x4294C9D4)) ^ 0xEE556CA6)) ^ (v1 + 1676534660);
  v5[0] = v2;
  v5[1] = v3;
  return (*((uint64_t (**)(void *))*(&off_1EF5F46E0 + v1 + 1676531055) + (int)(v1 ^ 0x9C123F0C)))(v5);
}

uint64_t sub_1A2DF52B0@<X0>(char a1@<W1>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + v3 + a2) = a1;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((((unint64_t)(v3 + 1 + a2) < 0x38) * (((v4 - 1238) ^ 0xD22) + 943)) ^ (v4 - 1238))))();
}

uint64_t sub_1A2DF52EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unint64_t *a20,int a21,uint64_t a22,unsigned int a23,int a24,int a25)
{
  if (a12) {
    int v28 = 580079467;
  }
  else {
    int v28 = 825641246;
  }
  unsigned int v29 = 1314530549 * ((((2 * &a20) | 0x657AD56C) - &a20 - 851274422) ^ 0x83B4EC78);
  a20 = &STACK[0x67CF598A0A88731];
  a22 = a16;
  a21 = (v25 + 1780979794) ^ v29;
  a25 = v28 ^ v29;
  a23 = -1072269845 - v29;
  uint64_t v30 = (*(uint64_t (**)(unint64_t **))(v26 + 8 * (v25 + 3819)))(&a20);
  return (*(uint64_t (**)(uint64_t))(v26
                                            + 8
                                            * (((a24 == (v25 ^ 0x215 ^ (v27 + 1296)))
                                              * ((v25 - 1016127030) & 0x1DF6 ^ 0x49A)) ^ v25)))(v30);
}

void sub_1A2DF53F8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) ^ (366490169 * (a1 ^ 0x16AE5644));
  __asm { BRAA            X10, X17 }
}

void sub_1A2DF54FC()
{
  STACK[0x638] = 0x62E55A5149BFD944;
  JUMPOUT(0x1A2DF943CLL);
}

uint64_t sub_1A2DF5524()
{
  int v6 = (v8 + 2143286352) & 0x7F6FAFFF;
  *(void *)(v0 + 8) = v1;
  *(_DWORD *)(v5 - 136) = v6
                        - ((2 * ((v5 - 136) & 0x790EEF40) - (v5 - 136) - 2031021895) ^ 0x905F46FD) * v4
                        - 1486660025;
  (*(void (**)(uint64_t))(v3 + 8 * (v2 + v6 + 3301)))(v5 - 136);
  return (v6 ^ 0x90C865DE) + (v9 ^ 0x7FFE7BA9) + ((2 * v9) & 0xFFFCF752) - 1877363113;
}

uint64_t sub_1A2DF5618@<X0>(unsigned int a1@<W8>)
{
  unint64_t v4 = v1 + v2;
  if (v4 <= 0x38) {
    unint64_t v4 = 56;
  }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((v4 - v1 + (a1 ^ 0x100482F4) < 8) * ((a1 + 1933270710) & 0x8CC49FE7 ^ 0xED8)) ^ a1)))();
}

uint64_t sub_1A2DF568C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (int)((((v1 ^ 0x8F9A367D) + v1 + 1885718205) * (v0 == v2)) ^ v1)))();
}

uint64_t sub_1A2DF5720()
{
  return sub_1A2DF5744();
}

uint64_t sub_1A2DF5744@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W6>, void *a5@<X7>, unsigned int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v25 = 4 * (v20 + v21 + ((v22 - 1365) ^ (a2 + 1997)));
  unint64_t v26 = (v18 ^ HIDWORD(v24))
      + v23 * (unint64_t)(*(_DWORD *)(*a5 + 4 * v21) ^ v12)
      + (*(_DWORD *)(a12 + v25) ^ v12);
  *(_DWORD *)(a12 + v25) = (v26 + a1 - (v15 & (2 * v26))) ^ v16;
  LODWORD(v25) = v21 + 1 + a3;
  LODWORD(v26) = (v14 > a6) ^ ((int)v25 < v17);
  BOOL v27 = (int)v25 < a4;
  if (v26) {
    BOOL v27 = v14 > a6;
  }
  return (*(uint64_t (**)(void))(v19 + 8 * ((v27 * v13) ^ v22)))();
}

uint64_t sub_1A2DF57D4@<X0>(int a1@<W4>, int a2@<W6>, int a3@<W8>)
{
  *(unsigned char *)(v8 - 220 + (a3 + v3)) = *(unsigned char *)(v4 + v7 - 1428834616)
                                                 - 2 * (*(unsigned char *)(v4 + v7 - 1428834616) & 3)
                                                 - 125;
  return (*(uint64_t (**)(void))(v6 + 8 * ((a2 + v5 + 1511) ^ (2 * ((a1 + a3 + 1) > 0x3F)))))();
}

uint64_t sub_1A2DF583C@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((4 * (a1 + 1 != v3 + 48)) | (8 * (a1 + 1 != v3 + 48))) ^ a2)))();
}

void sub_1A2DF592C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  *unsigned int v29 = 0x80000000;
  (*(void (**)(uint64_t))(v28 + 8 * (v27 ^ 0x1322)))(a27);
  JUMPOUT(0x1A2DF596CLL);
}

uint64_t sub_1A2DF59D0@<X0>(uint64_t a1@<X0>, unsigned int a2@<W2>, unint64_t a3@<X3>, int a4@<W4>, uint64_t a5@<X8>, int8x16_t a6@<Q0>, int8x16_t a7@<Q1>, int8x16_t a8@<Q4>, int8x16_t a9@<Q5>, int8x16_t a10@<Q6>, int32x4_t a11@<Q7>)
{
  uint64_t v14 = 4 * a5;
  uint64_t v15 = v12 + 4 * a5;
  unint64_t v16 = ((v11 + 3543) | a2) ^ a3 | a5;
  uint64_t v17 = a5 + 4;
  LODWORD(v16) = *(_DWORD *)(v12 + 4 * v16);
  a7.i32[0] = v16;
  a7.i32[1] = *(_DWORD *)(v12 + (v14 | 8));
  a7.i32[2] = *(_DWORD *)(v12 + (v14 | 0xC));
  int8x16_t v18 = vextq_s8(a6, a7, 0xCuLL);
  int8x16_t v19 = a7;
  v19.i32[3] = *(_DWORD *)(v12 + 4 * v17);
  int32x4_t v20 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v19, a9), vandq_s8(v18, a8)), 1uLL), *(int8x16_t *)(v15 + 1588));
  v18.i32[0] = *(_DWORD *)(v13 + 4 * (v16 & 1));
  v18.i32[1] = *(_DWORD *)(v13 + 4 * (*(_DWORD *)(v12 + (v14 | 8)) & 1));
  v18.i32[2] = *(_DWORD *)(v13 + 4 * (*(_DWORD *)(v12 + (v14 | 0xC)) & 1));
  v18.i32[3] = *(_DWORD *)(v13 + 4 * (v19.i8[12] & 1));
  *(int8x16_t *)uint64_t v15 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v20, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v20, v20), a10)), a11), v18);
  return (*(uint64_t (**)(void))(a1 + 8 * (((v17 == 224) * a4) ^ v11)))();
}

uint64_t sub_1A2DF5A9C@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  STACK[0x770] = v2;
  return (*(uint64_t (**)(void))(a1 + 8 * (((a2 ^ 0x99B ^ ((a2 - 2249) | 0x81)) * (v3 != v4)) ^ a2)))();
}

uint64_t sub_1A2DF5ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v6
                                                                               + 8
                                                                               * ((427
                                                                                 * (((v4 < (v5 ^ 0x1F55u) - 4011) ^ (v5 - 3)) & 1)) ^ v5)))(a1, a2, a3, a4, 0);
}

uint64_t sub_1A2DF5B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v8
                                                                               + 8
                                                                               * ((113
                                                                                 * ((v7 & 0x18) == ((a6 - 1659) ^ v6 ^ (v6 - 1877)))) ^ a6)))(a1, a2, a3, a4, (a2 - a4));
}

uint64_t sub_1A2DF5B64()
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * (int)(((359 * ((v0 + 1620220780) & 0x9F6D5B68 ^ 0x90A) - 712) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_1A2DF5BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v24 = (v8 + a5);
  uint64_t v25 = __ROR8__(a6 + v24, 8);
  unint64_t v26 = ((a4 + 2 * (v25 & 0xF8FFFFFFFFFFFFFFLL)) & a8) - (v25 & 0xF8FFFFFFFFFFFFFFLL) + 0x631E2561D4D50596;
  unint64_t v27 = (__ROR8__(v26 ^ 0x2EE9B9F2AABCF30FLL, 8) + (v26 ^ v15)) ^ a3;
  *((void *)&v28 + 1) = v26 ^ v15;
  *(void *)&long long v28 = v26;
  uint64_t v29 = v27 ^ (v28 >> 61);
  uint64_t v30 = (__ROR8__(v27, 8) + v29) ^ v16;
  uint64_t v31 = v30 ^ __ROR8__(v29, 61);
  uint64_t v32 = (__ROR8__(v30, 8) + v31) ^ 0x15BD713010A0DACFLL;
  uint64_t v33 = v32 ^ __ROR8__(v31, 61);
  *(void *)&long long v28 = __ROR8__(v32, 8);
  uint64_t v34 = __ROR8__((v9 - ((v10 | ~(v28 + v33)) + ((v28 + v33) | v18))) ^ v14, 8);
  uint64_t v35 = (v9 - ((v10 | ~(v28 + v33)) + ((v28 + v33) | v18))) ^ v14 ^ __ROR8__(v33, 61);
  uint64_t v36 = (v34 + v35) ^ a2;
  uint64_t v37 = v36 ^ __ROR8__(v35, 61);
  *(void *)&long long v28 = __ROR8__(v36, 8);
  uint64_t v38 = (v9 - ((v13 | ~(v28 + v37)) + ((v28 + v37) | v21))) ^ v19;
  uint64_t v39 = v38 ^ __ROR8__(v37, 61);
  *(void *)&long long v28 = __ROR8__(v38, 8);
  char v40 = (((v9 - ((v23 | ~((void)v28 + v39)) + (((void)v28 + v39) | 0x2F40927D7CB34D5BLL))) ^ v22) >> (8 * ((a6 + v8 + a5) & 7))) ^ *(unsigned char *)(a6 + v24 + a7);
  *(unsigned char *)(v11 + v24) = (v40 ^ v17) + (v20 & (2 * v40)) + 127;
  return (*(uint64_t (**)(void))(a1 + 8 * ((23 * (v8 != 290812274)) ^ (v12 - 1360))))();
}

uint64_t sub_1A2DF5D14()
{
  return sub_1A2DF5D4C();
}

uint64_t sub_1A2DF5D4C(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  *(void *)(a5 + (v6 + v5 - v7)) = *(void *)(v8 + (v6 + v5 - v7));
  return (*(uint64_t (**)(void))(v10 + 8 * (((v7 + a3 - 2608 != a2) * v9) ^ a4)))();
}

uint64_t sub_1A2DF5D80()
{
  *(void *)(v5 - 128) = v3;
  *(void *)(v5 - 112) = v1;
  *(_DWORD *)(v5 - 120) = (v2 - 673) ^ (1697562443 * ((v5 + 2043360442 - 2 * ((v5 - 128) & 0x79CB353A)) ^ 0xAE5B0DBE));
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v0 + 8 * (v2 + 2330)))(v5 - 128);
  return (*(uint64_t (**)(uint64_t))(v0
                                            + 8
                                            * (((((v2 ^ 0xB7C) + 1901) ^ (9 * (v2 ^ 0xB7C))) * (v4 == 1154773071)) ^ v2)))(v6);
}

uint64_t sub_1A2DF5E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((4429
                                * ((*(_DWORD *)(v8 + (v6 + a5) * (uint64_t)v7 + 40) & 8) == (v5 ^ 0xD71 ^ (v5 + 1855) ^ 0x64E))) | v5)))();
}

uint64_t sub_1A2DF5E74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *a1 = 0;
  a1[1] = 0;
  STACK[0x5E0] = (unint64_t)a1 + 0x62E55A5149BFD944;
  STACK[0x4C0] = *(void *)(a6 + 8 * v7);
  return (*(uint64_t (**)(void))(a6
                              + 8
                              * (int)((((void *)((char *)a1 + 0x62E55A5149BFD944) == (void *)0x62E55A5149BFD944)
                                     * (((v7 + 1406934318) & 0xAC23E2FF) - 155)) ^ (v7 + 1698))))();
}

uint64_t sub_1A2DF5EB0()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v2 | (16 * (((v0 == v1) ^ ((v2 ^ 0xFC) - 113)) & 1)))))();
}

void sub_1A2DF5EE0()
{
}

uint64_t sub_1A2DF5EFC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 - STACK[0x428] < 0x20) * (((v1 + 2092) ^ 0xA20) + 325)) ^ (v1 + 2092))))();
}

uint64_t sub_1A2DF5F44@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * ((461 * (STACK[0x600] != 0)) ^ (a2 + ((a2 + 2328) ^ 0x1990) + 96))))();
}

uint64_t sub_1A2DF5F80(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6)
{
  *(void *)(a4 + (v6 + a6 + a3)) = *(void *)(a2 + (v6 + a6 + a3));
  return (*(uint64_t (**)(void))(v9 + 8 * (((v8 + a6 != 8) * a5) ^ v7)))();
}

uint64_t sub_1A2DF5FB4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(v2 + a2) = *v5;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8 * (((a1 == 0) * v4) ^ v3)))(a1 - 16, a2 + 16);
}

void DeKxOzK1QT(uint64_t a1)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DF6048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50)
{
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * (a50 - 2361)))();
}

void sub_1A2DF605C()
{
}

void sub_1A2DF6068()
{
}

uint64_t sub_1A2DF60AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v8 + 8 * (((((v6 + a5) & a6 ^ v7) + v9 != 32) * v10) ^ v6)))();
}

void sub_1A2DF60B4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 8) - 673918253 * ((-2 - ((a1 | 0x4C235D67) + (~a1 | 0xB3DCA298))) ^ 0x2994B930);
  uint64_t v2 = *(void *)a1 + 0x297860FE8E3DC88ELL;
  unsigned int v3 = 1401278017 * (((&v5 | 0x13859B0D) + (~&v5 | 0xEC7A64F2)) ^ 0x17A6EDEB);
  uint64_t v5 = *(void *)a1 + 0x2A092353A54BE3D6;
  uint64_t v9 = v2;
  int v6 = v1 - v3 + 145;
  int v8 = v3 ^ 0x4B3C7CD;
  uint64_t v4 = (uint64_t)*(&off_1EF5F46E0 + (v1 ^ 0x723));
  (*(void (**)(uint64_t *))(v4 + 8 * (v1 + 3389)))(&v5);
  __asm { BRAA            X9, X17 }
}

void sub_1A2DF6218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  STACK[0x490] = *(void *)(a6 + 8 * v6);
  JUMPOUT(0x1A2D201F8);
}

void sub_1A2DF6230(uint64_t a1, int a2)
{
  LODWORD(STACK[0x610]) = a2;
  LODWORD(STACK[0x62C]) = LODWORD(STACK[0x6E0]) + 1535;
  LODWORD(STACK[0x6EC]) = 173444;
  LODWORD(STACK[0x6E0]) = 174768;
  LODWORD(STACK[0x6D0]) = 175430;
  LODWORD(STACK[0x6C8]) = 176092;
  LODWORD(STACK[0x6C4]) = 177416;
  LODWORD(STACK[0x6B8]) = 178078;
  LODWORD(STACK[0x6B0]) = 178740;
  LODWORD(STACK[0x6AC]) = 179402;
  LODWORD(STACK[0x61C]) = 180064;
  LODWORD(STACK[0x6A0]) = 180726;
  LODWORD(STACK[0x698]) = 393890;
  LODWORD(STACK[0x690]) = 395876;
  LODWORD(STACK[0x688]) = 396538;
  LODWORD(STACK[0x684]) = 397200;
  LODWORD(STACK[0x678]) = 398524;
  LODWORD(STACK[0x670]) = 399186;
  LODWORD(STACK[0x668]) = 399848;
  LODWORD(STACK[0x664]) = 400510;
  LODWORD(STACK[0x658]) = 401172;
  LODWORD(STACK[0x654]) = 401834;
  LODWORD(STACK[0x650]) = 402496;
  LODWORD(STACK[0x64C]) = 403158;
  LODWORD(STACK[0x640]) = 393228;
  LODWORD(STACK[0x63C]) = 176754;
  JUMPOUT(0x1A2DF637CLL);
}

uint64_t sub_1A2DF76FC@<X0>(void *a1@<X3>, uint64_t a2@<X4>, int a3@<W8>)
{
  *a1 = 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((a3 - 1889908710) ^ ((2 * (a2 == 0)) | (32 * (a2 == 0))))))();
}

uint64_t sub_1A2DF7730(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(qword_1EF5F4A90 + 8 * ((1203 * (*(_DWORD *)(a2 + 4) == 2050534423)) ^ 0xBCEu)))();
}

uint64_t sub_1A2DF776C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  a15 = 2800 - (((&a13 | 0x43754A8C) - (&a13 & 0x43754A8C)) ^ 0x84F42AC5) * v16;
  a13 = &STACK[0x370A1A23408CA0E];
  uint64_t v17 = (*(uint64_t (**)(unint64_t **))(v15 + 40952))(&a13);
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * ((51 * (((a14 == 1877363113) ^ 0x55) & 1)) ^ 0x5DDu)))(v17);
}

uint64_t sub_1A2DF7818()
{
  return sub_1A2DF7820();
}

uint64_t sub_1A2DF7820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v8 = *(void *)(v7 + 24);
  STACK[0x710] = v6 + 2224;
  STACK[0x470] = v8;
  STACK[0x708] = (unint64_t)&STACK[0x840] + v6 + 1104;
  STACK[0x4C8] = (unint64_t)&STACK[0x840] + v6 + 2064;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5
                                                                    + 8 * (((v8 == 0) * (v5 ^ 0xA1B)) ^ (v5 - 1079)));
  STACK[0x6D0] = (unint64_t)&STACK[0x840] + v6;
  STACK[0x4C0] = (unint64_t)&STACK[0x840] + v6 + 2144;
  return v9(a1, 1867446118, a3, 1700658637);
}

uint64_t sub_1A2DF78E4(uint64_t result)
{
  unint64_t v1 = 31090337 * ((-2 - ((~result | 0x4C7FCC96781261BELL) + (result | 0xB380336987ED9E41))) ^ 0xEBDDE768BF9301F7);
  int v2 = *(_DWORD *)(result + 8) - v1;
  int v3 = *(_DWORD *)(result + 4) + v1;
  int v4 = *(_DWORD *)result - v1;
  int v5 = *(_DWORD *)(result + 24) - v1;
  unint64_t v6 = *(void *)(result + 40) + v1;
  unint64_t v7 = *(void *)(result + 16) - v1;
  BOOL v8 = (uint64_t)v7 < (uint64_t)v6;
  BOOL v9 = v7 < v6;
  int v10 = v8;
  if (v5) {
    BOOL v9 = v10;
  }
  if (v9) {
    int v11 = v3;
  }
  else {
    int v11 = v4;
  }
  *(_DWORD *)(result + 32) = v11 ^ v2;
  return result;
}

unint64_t sub_1A2DF798C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v25[16] = ((v30 + 61) | 0xF0) ^ BYTE2(v5) ^ 0xB8;
  v29[12] = v5 ^ 0x65;
  v27[12] = BYTE5(v5) ^ 0x47;
  v25[6] = HIBYTE(v5) ^ 0xB1;
  v29[13] = (BYTE3(v5) ^ 0xC7) - ((2 * (BYTE3(v5) ^ 0xC7)) & 0xFB) + 125;
  v25[10] = v9;
  v25[26] = BYTE6(v5) ^ 0xC;
  v27[22] = BYTE1(v5) ^ 0x91;
  v25[1] = BYTE4(v5) ^ 0x7F;
  unsigned int v10 = *(unsigned __int8 *)(v24 + ((-31 * BYTE1(v9)) ^ 0x4FLL));
  v27[26] = BYTE3(v9);
  v29[16] = BYTE6(v9) - ((2 * BYTE6(v9)) & 0xFB) + 125;
  v27[17] = BYTE4(v9);
  unint64_t v11 = HIBYTE(v4);
  *unint64_t v27 = BYTE2(v9);
  v25[2] = BYTE5(v9);
  v27[7] = (((((v10 >> 1) | (v10 << 7)) ^ 0xFFFFFFE5) & 0x80) != 0) | (2 * (((v10 >> 1) | ((_BYTE)v10 << 7)) ^ 0xE5));
  v25[4] = HIBYTE(v9);
  unsigned __int8 v13 = ((v4 ^ 0x97420FBF8C71C3F8) >> (v6 & 8 ^ 8u) >> (v6 & 8)) - 51;
  int v14 = v11 ^ 0xFE;
  if (!v32) {
    int v14 = 105;
  }
  uint64_t v12 = (v7 >> 6) | (4 * (v7 & 0x3F));
  v27[1] = (v12 ^ 0x8B ^ *(unsigned char *)(v33 + (v12 ^ 0xAC))) - 29;
  char v15 = *(unsigned char *)(v23 + (v13 ^ 0x21)) + 102;
  v27[5] = BYTE3(v7) ^ 0x8C;
  char v16 = ((v15 ^ 0x75) >> 6) | (4 * (v15 ^ 0x75));
  v29[9] = v16 - ((2 * v16) & 0xFB) + 125;
  v29[1] = (BYTE2(v7) ^ 0x71) + ~(2 * (BYTE2(v7) ^ 0x71 ^ BYTE2(v7) & 2)) + 126;
  unsigned int v17 = ((v8 >> 8) ^ 0xFEAC15) - ((2 * ((v8 >> 8) ^ 0xFEAC15)) & 0x1117C2) + 1963494369;
  unsigned __int8 v18 = (*(unsigned char *)(v23 + (((BYTE4(v7) ^ 0xBF) - 51) ^ 0x21)) + 102) ^ 0x75;
  int v19 = (((v11 & 0x69 ^ 0x97) >> 3) | (32 * (v11 & 0x69 ^ 0xFFFFFF97))) ^ 0xFFFFFFCC ^ (((v14 | v11 ^ 0x97) >> 3) | (32 * (v14 | v11 ^ 0x97)));
  unint64_t result = (v8 >> 40) ^ 0xFFFFFFC7;
  v27[18] = (v18 >> 6) | (4 * v18);
  v25[14] = BYTE6(v7) ^ 0x42;
  v25[27] = BYTE5(v7) ^ 0xF;
  v25[18] = BYTE4(v8) ^ 0xC6;
  v25[7] = ((v19 >> 5) | (8 * v19)) ^ 0x99;
  v25[8] = BYTE2(v8) ^ 0xAC;
  v25[28] = (v17 & 0x2C ^ 0x20 ^ -(v17 & 0x2C ^ 0x20) ^ ((((BYTE1(v8) ^ 0x15) - ((2 * (BYTE1(v8) ^ 0x15)) & 0xC2) - 31) ^ 0x1E)
                                                       + (((BYTE1(v8) ^ 0x15) - ((2 * (BYTE1(v8) ^ 0x15)) & 0xC2) - 31) & 0xD3 ^ 0xC1)
                                                       + 1))
          + (v17 & 0xD3 ^ 0xC1);
  v25[5] = BYTE3(v8) ^ 0xFE;
  v27[21] = v8 ^ 0x80;
  v27[14] = BYTE5(v8) ^ 0xC7;
  LOBYTE(v19) = *(unsigned char *)(v33 + (((v8 >> 54) & 3 | (v8 >> 46) & 0xFC) ^ 0x76));
  char v21 = v31 & 6;
  v25[13] = BYTE1(a4) ^ 0x46;
  v27[2] = HIBYTE(v8) ^ 5;
  v27[23] = a4 ^ 2;
  v27[4] = (((v8 >> 54) & 3 | (v8 >> 46) & 0xFC) ^ 0x51 ^ v19) - 29;
  char v22 = *(unsigned char *)(v33
                 + ((((unint64_t)(BYTE2(a4) ^ 0x25u) >> (v21 ^ 4u) >> (v21 ^ 2u)) | (4 * (BYTE2(a4) ^ 0x25))) ^ 0xB9)
                 + ((2
                   * (((unint64_t)(BYTE2(a4) ^ 0x25u) >> (v21 ^ 4u) >> (v21 ^ 2u)) | (4
                                                                                           * ((a4 >> 16) ^ 0xABAC8725)))) & 0x1EC ^ 0xFFFFFE9F)
                 + 247);
  v27[15] = BYTE3(a4) ^ 0x87;
  v25[15] = HIBYTE(a4) ^ 0xA6;
  v27[24] = BYTE5(a4) ^ 0xAB;
  v27[19] = ((((unint64_t)(BYTE2(a4) ^ 0x25u) >> (v31 & 6 ^ 4u) >> (v31 & 6 ^ 2u)) | (4 * (BYTE2(a4) ^ 0x25))) ^ 0x68 ^ v22)
          - 29;
  v27[6] = BYTE4(a4) ^ 0xAC;
  *uint64_t v25 = BYTE6(a4) ^ 0x5F;
  *(_DWORD *)(*(void *)v28 + 8) = v26 - 1056963550;
  return result;
}

void sub_1A2DF7E40()
{
  unint64_t v4 = STACK[0x528] + 0x14E110F44ADD9B4BLL;
  STACK[0x4C8] = v4;
  int v5 = 673918253 * ((2 * ((v2 - 192) & 0x2EAABCD8) - (v2 - 192) - 782941406) ^ 0x4B1D588A);
  *(void *)(v2 - 176) = v4;
  *(_DWORD *)(v2 - 188) = v5 ^ 0xB9244036;
  *(_DWORD *)(v2 - 184) = v0 - 452158241 + v5 + 11;
  (*(void (**)(uint64_t))(v3 + 8 * ((int)v0 + 5106)))(v2 - 192);
  STACK[0x4F0] = *(void *)(STACK[0x2D8] + 8 * v0);
  STACK[0x2C0] = v1;
  JUMPOUT(0x1A2D91CF8);
}

void sub_1A2DF7F14()
{
}

uint64_t sub_1A2DF8048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,int a61,uint64_t a62,unint64_t a63)
{
  unint64_t v66 = STACK[0x4C8];
  STACK[0x4F0] = *(void *)(v65 + 8 * (LODWORD(STACK[0x2D4]) - 2299));
  STACK[0x570] = v66;
  LODWORD(STACK[0x57C]) = 429018383;
  int v63 = *(_DWORD *)(v66 - 0x14E110F44ADD9A87);
  STACK[0x308] = a63;
  return (*(uint64_t (**)(uint64_t))(v65
                                            + 8
                                            * (int)((4324
                                                   * (((((a61 & 0xE19B5AAF) - 504247514) & 0x1E0E3E7B ^ ((a61 & 0xE19B5AAF ^ 0x977) + 109)) & (2 * v63) ^ 0x60)
                                                    + (v63 & 0x3F ^ 0x3F9E9FCB)
                                                    - 1067360294 < 0xFFFFFFC0)) ^ a61 & 0xE19B5AAF)))(1067360249);
}

uint64_t sub_1A2DF8074()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((2448
                                * (*(unsigned __int8 *)((v2 | ((unint64_t)(v2 < v1) << 32)) + v4 - 2138079294) == (v0 ^ 0x72))) ^ v0)))();
}

uint64_t sub_1A2DF80D0()
{
  return sub_1A2DF811C(2694, 0x8DB7FFC6F4FDF87DLL, 0x1E9FBF0FALL, 0x77EEABFF9F87BFFCLL);
}

uint64_t sub_1A2DF811C()
{
  uint64_t v13 = 4 * (v8 + v6);
  int v14 = v11 + v9 + (*(_DWORD *)(*v4 + v13) ^ v10);
  *(_DWORD *)(*v5 + v13) = v14 + v10 - (v7 & (2 * v14));
  int v15 = v8 + 1 + v0;
  BOOL v17 = v15 > v1 || v15 < v3;
  return (*(uint64_t (**)(void))(v12 + 8 * (((4 * v17) | (8 * v17)) ^ (v2 + 2441))))();
}

uint64_t sub_1A2DF8198()
{
  BOOL v5 = ((v4 << (v3 + 31)) & v0) == 0;
  return (*(uint64_t (**)(void))(v1 + 8 * ((v5 | (2 * v5)) ^ v2)))();
}

uint64_t sub_1A2DF81C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v12
                              + 8
                              * ((78
                                * (((*(_DWORD *)(v11 + v10 * (uint64_t)v9 + 36) == a8) ^ (v8 + 1)) & 1)) ^ v8)))();
}

void MpmZulZW()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v0 = *(&off_1EF5F46E0
       + ((-43 * (dword_1E95A4808 ^ 0xD4 ^ qword_1E95A4840)) ^ byte_1A302D380[byte_1A30293A0[(-43 * (dword_1E95A4808 ^ 0xD4 ^ qword_1E95A4840))] ^ 0xB])
       + 44);
  uint64_t v1 = (unsigned __int8 *)off_1EF5F48A0;
  int v2 = (char *)off_1EF5F47E0 - 12;
  uint64_t v3 = (uint64_t)*(&off_1EF5F46E0
                + (*((unsigned char *)off_1EF5F47E0
                                                  + (*((unsigned __int8 *)off_1EF5F48A0
                                                     + (-43 * (*v0 ^ qword_1E95A4840 ^ 0xD4))) ^ 0x49u)
                                                  - 12) ^ (-43 * (*v0 ^ qword_1E95A4840 ^ 0xD4)))
                + 9);
  unint64_t v4 = (*(void *)(v3 - 4) + *v0) ^ (unint64_t)&v6;
  *int v0 = 1946842069 * (v4 + 0x311DF6E51EDE312CLL);
  *(void *)(v3 - 4) = 1946842069 * (v4 ^ 0xCEE2091AE121CED4);
  v7[1] = 31090337 * ((((2 * v7) | 0xBD4D8552) - v7 - 1587987113) ^ 0x9927A2E0) + 1655392376;
  LOBYTE(v3) = -43 * ((*(_DWORD *)(v3 - 4) - *(_DWORD *)v0) ^ 0xD4);
  uint64_t v5 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * (dword_1E95A4808 ^ 0xD4 ^ qword_1E95A4840)) ^ byte_1A30290A0[byte_1A3023090[(-43 * (dword_1E95A4808 ^ 0xD4 ^ qword_1E95A4840))] ^ 0xDD])
                + 113);
  (*(void (**)(_DWORD *))(v5
                                   + 8
                                   * ((v3 ^ v2[v1[v3] ^ 0x46]) + 5131)))(v7);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DF8410@<X0>(int a1@<W1>, unsigned int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, int a15, int a16, uint64_t a17, int a18, int a19, char a20,int a21,int a22,int a23,char a24,int a25,int a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,unsigned __int8 a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  unsigned __int8 v48 = a11 ^ a1 ^ 0xA;
  unsigned __int8 v49 = a20 ^ a1 ^ 0x5D;
  uint64_t v85 = a12 ^ a1 ^ 0x39;
  uint64_t v84 = a10 ^ a1 ^ 2u;
  uint64_t v83 = a13 ^ a1 ^ 0xFFFFFFC7;
  unsigned int v50 = *(unsigned __int8 *)(a47 + (BYTE4(a5) ^ 0xB ^ a1 ^ 0x74u ^ 0xBDLL));
  unsigned int v51 = *(unsigned __int8 *)(a47 + ((a5 ^ v47) ^ 0x4BLL));
  unsigned int v52 = *(unsigned __int8 *)(a47 + ((a1 ^ a7) ^ 0x55));
  LODWORD(v82) = ((v51 >> 4) ^ (v51 >> 3) ^ 0x1D) - 2 * (((v51 >> 4) ^ (v51 >> 3) ^ 0x1D) & 0xF);
  unsigned int v53 = *(unsigned __int8 *)(a47 + ((a1 ^ a24) ^ 0x2BLL));
  unsigned int v54 = *(unsigned __int8 *)(a47 + (v49 ^ 0x9ALL));
  HIDWORD(v82) = ((v53 >> 4) ^ (v53 >> 3) ^ 0x1D) - ((2 * ((v53 >> 4) ^ (v53 >> 3) ^ 0x1D)) & 0x2C);
  LODWORD(a12) = ((v54 >> 4) ^ (v54 >> 3) ^ 0x1D) - ((2 * ((v54 >> 4) ^ (v54 >> 3) ^ 0x1D)) & 0x38);
  unsigned int v55 = *(unsigned __int8 *)(a47 + (a1 ^ 0xA5u ^ a14 ^ 0x1DLL));
  LODWORD(a13) = ((v55 >> 4) ^ (v55 >> 3) ^ 0x1D) - ((2 * ((v55 >> 4) ^ (v55 >> 3) ^ 0x1D)) & 0x1C);
  unsigned int v56 = *(unsigned __int8 *)(a47 + (v48 ^ 0xFLL));
  unsigned int v57 = *(unsigned __int8 *)(a47 + (a27 ^ 0xA8));
  LODWORD(a27) = ((v56 >> 4) ^ (v56 >> 3) ^ 0x1D) - ((2 * ((v56 >> 4) ^ (v56 >> 3) ^ 0x1D)) & 0x20);
  unsigned int v58 = *(unsigned __int8 *)(a47 + (a32 ^ 0xA8));
  unsigned int v59 = *(unsigned __int8 *)(a47 + (a43 ^ 0xA8));
  unsigned int v60 = *(unsigned __int8 *)(a47 + (a34 ^ 0xA8));
  int v61 = v50 ^ (((v50 >> 4) ^ (v50 >> 3) ^ 0x1D) - ((2 * ((v50 >> 4) ^ (v50 >> 3) ^ 0x1D)) & 0x2C) - 10) ^ (v60 >> 3) ^ (v60 >> 4) ^ 0x5D;
  unsigned int v62 = *(unsigned __int8 *)(a47 + (a17 ^ 0xA8));
  unsigned __int8 v63 = v60 ^ 0x8B ^ (v61 - ((2 * v61) & 0x7A) + 61);
  int v64 = (v62 >> 4) ^ (v62 >> 3);
  LOBYTE(v60) = v62 ^ 0x54 ^ v64;
  LOBYTE(v62) = v62 ^ 0xB6;
  char v65 = (v62 + v60 + 1) ^ ((v64 ^ 0xE2) + 1);
  LOBYTE(v64) = (v64 ^ 0xB2 ^ (v65 - ((2 * v65) & 0x5E) - 81)) + v62;
  int v66 = v57 ^ (((v57 >> 4) ^ (v57 >> 3) ^ 0x1D) - 2 * (((v57 >> 4) ^ (v57 >> 3) ^ 0x1D) & 7) + 103);
  unsigned int v67 = *(unsigned __int8 *)(a47 + ((a6 ^ a1) ^ 0xD5));
  unsigned int v68 = (v67 >> 4) ^ (v67 >> 3) ^ v66 ^ 0xFFFFFFCC;
  LOBYTE(v61) = v67 ^ 0x47 ^ (v68 - ((2 * v68) & 0xE3) - 15);
  unsigned int v69 = *(unsigned __int8 *)(a47 + (a35 ^ 0xA8));
  unsigned int v70 = v52 ^ (((v52 >> 4) ^ (v52 >> 3) ^ 0x1D) + (~(2 * ((v52 >> 4) ^ (v52 >> 3) ^ 0x1D)) | 0xFFFFFFE7) + 13) ^ (v69 >> 3) ^ (v69 >> 4) ^ 0xFFFFFFA7;
  unsigned __int8 v71 = v69 ^ 0x9C ^ (v70 - ((2 * v70) & 0x55) + 42);
  unsigned int v72 = *(unsigned __int8 *)(a47 + (a38 ^ 0xA8));
  int v73 = v55 ^ (a13 - 114) ^ (v72 >> 3) ^ (v72 >> 4) ^ 0x25;
  LOBYTE(v73) = v72 ^ 0x9A ^ (v73 - ((2 * v73) & 0x58) + 44);
  unsigned int v74 = *(unsigned __int8 *)(a47 + (v83 ^ 0x61));
  unsigned int v75 = (v74 >> 4) ^ (v74 >> 3) ^ v58 ^ (((v58 >> 4) ^ (v58 >> 3) ^ 0x1D)
                                       - ((2 * ((v58 >> 4) ^ (v58 >> 3) ^ 0x1D)) & 0xFFFFFFFB)
                                       + 93) ^ 0xFFFFFFF6;
  unsigned int v76 = *(unsigned __int8 *)(a47 + (a44 ^ 0xA8));
  int v77 = v56 ^ (a27 + 80) ^ (v76 >> 3) ^ (v76 >> 4) ^ 0xFFFFFFFB;
  unsigned int v78 = *(unsigned __int8 *)(a47 + ((BYTE4(a7) ^ a1) ^ 0xF3));
  LOBYTE(v52) = v76 ^ 0xA3 ^ (v77 - ((2 * v77) & 0x2A) + 21);
  int v79 = (v78 >> 4) ^ (v78 >> 3) ^ v59 ^ (((v59 >> 4) ^ (v59 >> 3) ^ 0x1D)
                                       + ((2 * (((v59 >> 4) ^ (v59 >> 3) ^ 0x1D | 0x7B) ^ (v59 >> 4) ^ (v59 >> 3))) ^ 0x33)
                                       + 60);
  unsigned int v80 = *(unsigned __int8 *)(a47 + (v85 ^ 0x34));
  LODWORD(a43) = v52;
  return sub_1A2DFB564(((v74 ^ 0x31 ^ (v75 - 2 * (v75 & 7) - 121)) << 24) | (((v78 ^ ((v79 ^ 0x90)- 2* ((v79 ^ 0x90) & 0x3A ^ v79 & 2)- 72)) ^ 0xE) << 16), v73, 2263981388, v71, v63, 2030985208, (v51 ^ 0x57 ^ (((v51 >> 4) ^ (v51 >> 3) ^ 0x1D)- 2 * (((v51 >> 4) ^ (v51 >> 3) ^ 0x1D) & 0xF)+ 79)) << 8, v61 << 16, a3, a4, a5, a6, a7, a8,
           a9,
           v82,
           a12,
           a13,
           a6 ^ a1 ^ 0x1D,
           a16 ^ a1 ^ 0x21u,
           a17,
           a1 ^ 0xFFFFFFA5 ^ a18,
           v83,
           a22 ^ 0xFFFFFFB9 ^ a1 ^ 0x74,
           HIDWORD(a7) ^ a1 ^ 0x26u,
           HIDWORD(a6) ^ a1 ^ (a26 + 82) ^ a2,
           a27,
           v84,
           a29,
           v85,
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
           v80 ^ 0x51u ^ (((v80 >> 4) ^ (v80 >> 3) ^ v64 ^ 0x1D)
                                                          - ((2 * ((v80 >> 4) ^ (v80 >> 3) ^ v64 ^ 0x1D)) & 0xCF)
                                                          - 25));
}

void sub_1A2DF8538()
{
  unint64_t v0 = STACK[0x3E0];
  STACK[0x2C0] = STACK[0x5C8];
  STACK[0x240] = v0;
  STACK[0x260] = v0 + 0x4AABD7BB73BA3568;
  *(int64x2_t *)&STACK[0x280] = vdupq_n_s64(0x38uLL);
  *(_OWORD *)&STACK[0x290] = xmmword_1A3032970;
  STACK[0x250] = STACK[0x618];
  JUMPOUT(0x1A2DF8808);
}

uint64_t sub_1A2DF8884@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  STACK[0x4A8] = 0;
  STACK[0x848] = 0x722007246BD524B1;
  return (*(uint64_t (**)(void))(a1 + 8 * ((((245 * (((v2 - 1641) | 0x20) ^ 0x21)) ^ 0x99F) * (a2 != v3)) ^ v2)))();
}

uint64_t sub_1A2DF88DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return (*(uint64_t (**)(void))(v14
                              + 8
                              * ((189
                                * ((((a13 - ((2 * a13) & 0xE5873CB4) - 222060966) << (((v13 + 102) | 0x12) + 11)) & 0xFEB3B764 ^ 0xE4833424)
                                 + ((a13 - ((2 * a13) & 0xE5873CB4) - 222060966) ^ 0x8D9A45E8)
                                 - 536922144 != 1599673234)) ^ v13)))();
}

uint64_t sub_1A2DF896C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,unint64_t a58)
{
  if ((*(_DWORD *)(v58 + 1428) | 4) == 0x41851C34) {
    return (*(uint64_t (**)(void))(v60
  }
                                + 8
                                * (((*(_DWORD *)(a1 + 476) == 1028516871) * LODWORD(STACK[0x2B8])) ^ (LODWORD(STACK[0x2D4]) - 1051))))();
  STACK[0x3A0] = a58;
  return v59();
}

void sub_1A2DF8A64()
{
}

void sub_1A2DF8AC0(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 12) + 673918253 * ((-1279141011 - (a1 | 0xB3C1DB6D) + (a1 | 0x4C3E2492)) ^ 0xD6763F3A);
  v3[1] = v1 + 31090337 * (v3 ^ 0xC7816049) + 1655390929;
  uint64_t v2 = (uint64_t)*(&off_1EF5F46E0 + v1 - 1329);
  (*(void (**)(_DWORD *))(v2 + 8 * (v1 ^ 0x11B2)))(v3);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DF8BBC(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  *(void *)(a6 + (a7 - v8)) = *(void *)(a5 + (a7 - v8));
  return (*(uint64_t (**)(void))(v10 + 8 * (((a8 + v8 != a3) * v9) ^ a4)))();
}

uint64_t sub_1A2DF8BE8@<X0>(uint64_t a1@<X2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47,int a48)
{
  unsigned int v52 = *((_DWORD *)&a36 + ((v50 + a2) >> ((v49 + 82) ^ 0xBD)) + 18);
  *(unsigned char *)(a1 + (v50 + a2 + 1)) = (BYTE2(v52) ^ 0x70) - ((v52 >> 15) & 6) - 125;
  *(unsigned char *)(a1 + (v50 + a2 + 2)) = (BYTE1(v52) ^ 0x26) - 2 * ((BYTE1(v52) ^ 0x26) & 3) - 125;
  *(unsigned char *)(a1 + (v50 + a2)) = (HIBYTE(v52) ^ 0x17) + (~(2 * (HIBYTE(v52) ^ 0x17)) | 0xF9) - 124;
  *(unsigned char *)(a1 + (v50 + a2 + 3)) = v52 ^ 0xD6;
  BOOL v53 = v50 - 594478025 < (a48 - 843517581);
  if (v50 - 594478025 < v48 != a48 - 843517581 < v48) {
    BOOL v53 = a48 - 843517581 < v48;
  }
  return (*(uint64_t (**)(void))(v51 + 8 * (v49 | (2 * !v53))))();
}

uint64_t sub_1A2DF8CCC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, unsigned int a7, unint64_t a8)
{
  int v15 = (int *)(v13 + 4 * v10);
  uint64_t v16 = v10 + 1;
  uint64_t v17 = *(unsigned int *)(v13 + 4 * v16);
  int v18 = v15[397] ^ ((unint64_t)(v17 & 0x7FFFFFFE | v9 & 0x80000000) >> 1);
  *int v15 = (v18 + v12 - (a2 & (2 * v18))) ^ *(_DWORD *)(v14 + 4 * (v17 & ((v8 + a6) & a7 ^ a8)));
  return (*(uint64_t (**)(void))(a1 + 8 * (((v16 == 227) * v11) ^ v8)))();
}

uint64_t sub_1A2DF8D34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(qword_1EF5F4A90 + 8 * ((462 * (*(_DWORD *)(a2 + 4) == 2050534423)) ^ 0x69Eu)))();
}

void sub_1A2DF8D6C(unint64_t a1@<X1>, int a2@<W8>)
{
  *(void *)(v4 + 1516) = v2;
  *(void *)(v4 + 1524) = v2;
  *(_DWORD *)(v4 + 1532) = v3;
  *(void *)(a1 + 96) = v4;
  *(_DWORD *)(v4 + 476) = 1028516871;
  unint64_t v5 = STACK[0x3A0];
  STACK[0x260] = STACK[0x3A0];
  STACK[0x258] = v5 + ((a2 + 1664) ^ 0x733);
  STACK[0x2B8] = STACK[0x3E0];
  STACK[0x268] = a1;
  JUMPOUT(0x1A2DF8DDCLL);
}

uint64_t sub_1A2DF8EF0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 48) = *(void *)(a2 + 8);
  return 0;
}

void YHrWZQ6wU()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * ((qword_1E95A4840 - dword_1E95A47C0) ^ 0xD4)) ^ byte_1A302D080[byte_1A3028FA0[(-43 * ((qword_1E95A4840 - dword_1E95A47C0) ^ 0xD4))] ^ 5])
                - 172);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1EF5F46E0
                + (*((unsigned char *)off_1EF5F47E0
                                                  + (*((unsigned __int8 *)off_1EF5F48A0
                                                     + (-43 * ((qword_1E95A4840 + v1) ^ 0xD4))) ^ 0x1Fu)
                                                  - 12) ^ (-43 * ((qword_1E95A4840 + v1) ^ 0xD4)))
                + 91);
  uint64_t v3 = (*(void *)(v2 - 4) ^ v1) - (void)&v5;
  *(void *)(v0 - 4) = 1946842069 * v3 - 0x311DF6E51EDE312CLL;
  *(void *)(v2 - 4) = 1946842069 * (v3 ^ 0xCEE2091AE121CED4);
  v6[1] = 31090337 * ((-1295288572 - (v6 | 0xB2CB7704) + (v6 | 0x4D3488FB)) ^ 0x8AB5E8B2)
        + 1655392376;
  LOBYTE(v2) = -43 * ((*(_DWORD *)(v2 - 4) + *(_DWORD *)(v0 - 4)) ^ 0xD4);
  uint64_t v4 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * ((qword_1E95A4840 - dword_1E95A47C0) ^ 0xD4)) ^ byte_1A302D180[byte_1A30291A0[(-43 * ((qword_1E95A4840 - dword_1E95A47C0) ^ 0xD4))] ^ 0x4F])
                + 84);
  (*(void (**)(_DWORD *))(v4
                                   + 8
                                   * ((*((unsigned char *)off_1EF5F4D50
                                                                      + (*((unsigned __int8 *)off_1EF5F4D68
                                                                         + v2
                                                                         - 8) ^ 9u)
                                                                      - 4) ^ v2)
                                    + 5078)))(v6);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DF9138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6
                              + 8
                              * ((53 * (((v6 == 0) ^ (113 * (v7 ^ 0x91) + 118)) & 1)) ^ (1393 * (v7 ^ 0x991)))))();
}

uint64_t sub_1A2DF92F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LODWORD(STACK[0x724]) = v8;
  STACK[0x4F8] = STACK[0x638];
  STACK[0x610] = *(void *)(a6 + 8 * (v7 - 2306));
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a6
                                                                               + 8
                                                                               * (int)(((&STACK[0x4F8] == 0)
                                                                                      * ((((((((v7 + 902705769) & 0xCA31C667)
                                                                                            - 322) | 0xC6)
                                                                                          + 2205) | 3)
                                                                                        - 99) ^ (((((v7 + 902705769) & 0xCA31C667)
                                                                                                 - 322) | 0xC6)
                                                                                               + 333605304) & 0xEC1D9DF2)) ^ ((((v7 + 902705769) & 0xCA31C667) - 322) | 0xC6))))((v9 - 2326), 2689, 701, 0x62E55A5149BFD944, 1);
}

uint64_t sub_1A2DF9330@<X0>(uint64_t a1@<X3>, _DWORD *a2@<X6>, int a3@<W8>)
{
  *a2 = 0;
  return (*(uint64_t (**)(void))(v4 + 8 * ((a3 + v3 + 692) ^ (53 * (a1 != 0)))))();
}

uint64_t sub_1A2DF935C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  a15 = 2800
      - (((&a13 | 0x22F7542E) - &a13 + (&a13 & 0xDD08ABD0)) ^ 0xE5763467)
      * v17;
  a13 = &STACK[0x370A1A23408CA06];
  uint64_t v19 = (*(uint64_t (**)(unint64_t **))(v16 + 40952))(&a13);
  return (*(uint64_t (**)(uint64_t))(v16 + 8 * ((62 * (a14 == ((v15 + 1245) ^ 0x72F))) ^ v18)))(v19);
}

uint64_t sub_1A2DF93F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50)
{
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * (a50 - 2310)))();
}

void sub_1A2DF940C()
{
}

uint64_t sub_1A2DF9430()
{
  LODWORD(STACK[0x724]) = v0;
  *(void *)STACK[0x398] = STACK[0x638];
  return ((uint64_t (*)(void))STACK[0x418])();
}

uint64_t sub_1A2DF9454@<X0>(int a1@<W8>)
{
  int v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x1CEEu));
  return v3(v1);
}

uint64_t sub_1A2DF9488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  HIDWORD(a26) = v26;
  uint64_t v29 = (*(uint64_t (**)(uint64_t, void))(v28 + 8 * (v27 ^ 0x1E8D)))(a12, 0);
  uint64_t v30 = 8 * (v27 ^ 0x1EFE);
  (*(void (**)(uint64_t))(v28 + v30))(v29);
  uint64_t v31 = (*(uint64_t (**)(void))(v28 + v30))();
  return sub_1A2D383B0(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           v31);
}

void sub_1A2DF9500()
{
}

uint64_t sub_1A2DF9508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8 * ((((4 * v7) ^ 0x4D1A) * (v6 != 0)) ^ v7)))();
}

void sub_1A2DF9540()
{
}

void sub_1A2DF954C()
{
}

uint64_t sub_1A2DF9554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned int a13, uint64_t a14, int a15, uint64_t a16, unsigned int a17)
{
  int v24 = v21 - 1161;
  unsigned int v25 = 366490169 * ((((2 * &a13) | 0x1BCA45E4) - &a13 + 1914363150) ^ 0x9B4B74B6);
  a13 = v19 + v25 - ((v19 << ((v24 ^ 0x9E) + 55)) & 0xC95D55D8) - 458315028;
  a15 = v25 + v24 + 2637;
  a14 = a12;
  (*(void (**)(unsigned int *))(v20 + 8 * (v24 + 4810)))(&a13);
  unsigned int v26 = ((1099769716 - (&a13 | 0x418D2774) + (&a13 | 0xBE72D88B)) ^ 0x79F3B8C2) * v23;
  a17 = (v18 ^ 0xDEFEFEFF) + ((2 * v18) & 0xBDFDFDFE) - v26 + 1806687091;
  a16 = a12;
  a14 = v17;
  a15 = v26 + v24 + 1872;
  uint64_t v27 = (*(uint64_t (**)(unsigned int *))(v20 + 8 * (v24 ^ 0x157C)))(&a13);
  return (*(uint64_t (**)(uint64_t))(v20 + 8 * ((53 * (a13 == v22)) ^ v24)))(v27);
}

uint64_t sub_1A2DF96C8()
{
  return sub_1A2DF96E0();
}

uint64_t sub_1A2DF96E0@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2 + v5 + a2) = v7;
  return (*(uint64_t (**)(void))(v6 + 8 * ((501 * (((v4 + 896739335) & 0xCA8CD5DF ^ 0x4C7) + a2 == v3)) ^ v4)))();
}

void sub_1A2DF9730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  LODWORD(STACK[0x700]) = a5 ^ 0x459;
  JUMPOUT(0x1A2DF97E8);
}

uint64_t sub_1A2DF9AC8(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 24) - 1761959447 * ((a1 + 1955828336 - 2 * (a1 & 0x74939270)) ^ 0xD53453B4);
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)a1;
  unsigned int v5 = 673918253 * ((((2 * &v7) | 0xD469487A) - &v7 + 365648835) ^ 0x707CBF95);
  uint64_t v12 = *(void *)(a1 + 16);
  unsigned int v10 = v2 - 166303607 + v5;
  unsigned int v11 = v5 + 899196418;
  uint64_t v8 = v4;
  uint64_t v9 = v3;
  uint64_t result = (*((uint64_t (**)(int *))*(&off_1EF5F46E0 + v2 - 166308301) + (v2 ^ 0x9E9BE67)))(&v7);
  *(_DWORD *)(a1 + 28) = v7;
  return result;
}

uint64_t sub_1A2DF9BF8()
{
  return sub_1A2DF9C24();
}

uint64_t sub_1A2DF9C24@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (v15 + v11);
  char v17 = *(unsigned char *)(v10 + v16);
  uint64_t v18 = v16 + v8;
  unint64_t v19 = 1554976193 * (((1554976193 * (v18 + 10)) >> v12) ^ (1554976193 * (v18 + 10)));
  *(unsigned char *)(v18 + 10) = *(unsigned char *)(a8 + (v19 >> 24)) ^ v17 ^ *(unsigned char *)(a7 + (v19 >> 24)) ^ *(unsigned char *)((v19 >> 24) + a6 + 2) ^ v19 ^ (((1554976193 * (((1554976193 * (v18 + 10)) >> v12) ^ (1554976193 * (v18 + 10)))) >> 24) * v13);
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * (((v15 - 1 != a1) * v14) ^ v9)))();
}

uint64_t sub_1A2DF9CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, uint64_t a15, int a16, int a17, int a18)
{
  int v22 = 1314530549 * ((&a13 + 1106563762 - 2 * ((unint64_t)&a13 & 0x41F4D2B2)) ^ 0xF0FD547C);
  a14 = (v20 + 1780978813) ^ v22;
  a15 = a11;
  a13 = &STACK[0x67CF598A0A88721];
  a18 = v22 ^ 0x13F055B8;
  a16 = -1329770081 - v22;
  uint64_t v23 = (*(uint64_t (**)(unint64_t **))(v18 + 8 * (v20 + 2838)))(&a13);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * (((a17 == 1877363113)
                                              * (v19 + v20 - v21 + 1680 + 695 * (v20 ^ 0x8D8) + 176)) ^ v20)))(v23);
}

uint64_t sub_1A2DF9DA0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 32) = *(void *)(a2 + 8);
  return 0;
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1A2DF9DF0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7, int a8)
{
  *(void *)(a3 + (v8 + a8)) = *(void *)(v9 + (v8 + a8));
  return (*(uint64_t (**)(void))(v10 + 8 * (((a6 == a8) * a7) ^ a4)))();
}

uint64_t sub_1A2DF9E1C@<X0>(int a1@<W0>, int a2@<W8>)
{
  *(unsigned char *)(v4 + (v3 - 668862590)) = *(unsigned char *)(v2 + (v3 - 668862590));
  return (*(uint64_t (**)(void))(v5 + 8 * ((98 * (v3 - 1 == ((1097 * (a1 ^ 0x8A2)) ^ a2))) ^ a1)))();
}

uint64_t sub_1A2DF9E68()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((536 * (((v1 - 1798) ^ 0x93ELL) + v0 == ((v1 - 4118) ^ v2))) | v1)))();
}

void sub_1A2DF9EA4(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int v3 = 1314530549 * ((~a1 & 0xADFDBFF9 | a1 & 0x52024006) ^ 0x1CF43937);
  int v4 = *(_DWORD *)a1 ^ v3;
  int v38 = *(_DWORD *)(a1 + 32) ^ v3;
  int v5 = *(_DWORD *)(a1 + 48);
  unint64_t v17 = 1314530549 * ((~a1 & 0x302D9B35ADFDBFF9 | a1 & 0xCFD264CA52024006) ^ 0x97081BA81CF43937);
  int v6 = v5 - v3;
  unsigned int v7 = 673918253 * ((-876833129 - (v46 | 0xCBBC9697) + (v46 | 0x34436968)) ^ 0xAE0B72C0);
  uint64_t v23 = &STACK[0x14E110F44ADD9DB7];
  int v49 = &STACK[0x14E110F44ADD9DB7];
  unsigned int v47 = v7 ^ 0xB9244036;
  unsigned int v48 = v4 + v7 - 452158298;
  uint64_t v8 = (uint64_t)*(&off_1EF5F46E0 + (v4 ^ 0xF6));
  (*(void (**)(unsigned char *))(v8 + 8 * (v4 ^ 0x14AE)))(v46);
  int v34 = v6 + 1974647536;
  int v16 = v6 - 1542576107;
  int v19 = v6 - 1455423819;
  int v20 = v6 - 19764275;
  uint64_t v30 = &v43;
  v9[0] = v44;
  v9[1] = (char *)&v9[-33591807] + 7;
  int v14 = v4 - 1430139012;
  int v11 = (v4 - 2002707121) & 0x775EEEBF;
  unsigned int v13 = v11 ^ 0xFFFFF34F;
  int32x4_t v26 = vdupq_n_s32(0xEEB4B5BC);
  int v29 = 23 * (v4 ^ 0xBB);
  int32x4_t v28 = vdupq_n_s32(0xF75A5ADE);
  unsigned int v18 = (v4 + 2105264767) & 0x828437F6;
  int v12 = v4 + 4450;
  int v33 = v4 ^ 0x734D6453;
  int32x4_t v25 = vdupq_n_s32(0x775A5AFEu);
  int v10 = 509 * (v4 ^ 0x88);
  int v27 = v4 + 4304;
  unsigned int v24 = ((v4 - 453617313) & 0x1B09AEFF) - 2143;
  uint64_t v36 = v24;
  uint64_t v37 = v24;
  uint64_t v21 = a1;
  int v31 = v4 ^ 0x9BC;
  int v32 = v4;
  int v15 = v4 ^ 0x389;
  uint64_t v35 = *(void *)(a1 + 24);
  uint64_t v22 = *(void *)(v8 + 8 * v4);
  unsigned int v1 = v38 - ((2 * v38 + 65526796) & 0x2BFDCE2E) + 2012402973;
  char v39 = ((v1 >> ((v4 ^ 0x89) + 15)) ^ 0x95) + (~(2 * ((v1 >> ((v4 ^ 0x89) + 15)) ^ 0x95)) | 0xF9) - 124;
  char v40 = (BYTE2(v1) ^ 0xFE) - 2 * ((BYTE2(v1) ^ 0xFE) & 3) - 125;
  char v41 = (BYTE1(v1) ^ 0xE7) - 2 * ((BYTE1(v1) ^ 0xE7) & 3) - 125;
  char v42 = v1 ^ 0x94;
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1A2DFA1F0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 ^ 0x8E5) + 178) ^ v0 ^ 0x1EB) * ((v1 + v3 - 1) < 0x7FFFFFFF)) ^ v0)))();
}

uint64_t sub_1A2DFA230@<X0>(uint64_t a1@<X8>)
{
  int v3 = *(uint64_t (**)(void))(v2
                           + 8
                           * ((22
                             * ((((v1 + 1426) ^ ((*(uint64_t (**)(uint64_t, uint64_t))(v2
                                                                                             + 8
                                                                                             * (v1 + 4392)))(a1, 2866087519) == 0)) & 1) == 0)) ^ (v1 + 1525)));
  return v3();
}

uint64_t sub_1A2DFA290()
{
  int v5 = 31090337 * ((((v4 - 128) | 0x7E514D29) - ((v4 - 128) & 0x7E514D29)) ^ 0xB9D02D60);
  *(_DWORD *)(v4 - 128) = v2 + v5 + ((v0 + 1215) ^ 0xBC612A72);
  *(void *)(v4 - 120) = v3;
  *(_DWORD *)(v4 - 112) = (v0 + 3747) ^ v5;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 ^ 0x1607)))(v4 - 128);
  return sub_1A2DFA310(v6);
}

uint64_t sub_1A2DFA310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(v15 - 116) = (v14 + 2441) ^ (366490169
                                         * ((((2 * (v15 - 128)) | 0xCF98DEA6) - (v15 - 128) + 406032557) ^ 0xF1623917));
  *(void *)(v15 - 128) = v13;
  *(void *)(v15 - 112) = a12;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(v12 + 8 * (v14 + 3371)))(v15 - 128);
  return (*(uint64_t (**)(uint64_t))(v12
                                            + 8
                                            * (((*(_DWORD *)(v15 - 120) - 1824482249 < ((v14 + 855438565) & 0xCD030EFD)
                                                                                     - 307215348)
                                              * ((v14 + 619) ^ 0x4AC)) ^ v14)))(v16);
}

uint64_t sub_1A2DFA3D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v8
                              + 8 * ((31 * (*(_DWORD *)(v10 + 48 * (v7 + a7)) == (v9 ^ 0x1041) + 931636863)) ^ v9)))();
}

uint64_t sub_1A2DFA41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,uint64_t a24,int a25,int a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,int a59,int a60)
{
  int v61 = a26 - ((2 * a23) & 0xA8C4360) + (((a60 - 4510) | 0x20) ^ 0x17098FCE);
  return (*(uint64_t (**)(void))(v60
                              + 8
                              * ((39
                                * (((2 * v61) & 0xEEFF758A ^ 0xA8C4100) + (v61 ^ 0x72399B75) + 2129852540 == 1987228481)) ^ a60)))();
}

void sub_1A2DFA4F4()
{
}

uint64_t sub_1A2DFA4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(v10
                              + 8 * (((((v9 | 0x1128) - 1083) ^ ((v9 | 0x1128) - 1168)) * (a9 != 0)) ^ (v9 | 0x1128))))();
}

void sub_1A2DFA560(uint64_t a1)
{
  void *v1 = a1;
  JUMPOUT(0x1A2DFA57CLL);
}

uint64_t sub_1A2DFA6C0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3)
{
  return sub_1A2DFA744(a3 - 0xA7A2E88B1D690E5, (v3 + 1882498124), v3 + 3 * (a1 ^ 0x5B5) - 847);
}

uint64_t sub_1A2DFA744()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 ^ (2813 * (v0 > 1)))))();
}

void sub_1A2DFA7C0()
{
}

uint64_t sub_1A2DFA7D8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  LODWORD(STACK[0x218]) = v66 ^ 0x203;
  *(_DWORD *)(v63 + 392) = a1;
  *(_DWORD *)(v63 + 396) = STACK[0x374];
  *(void *)(v63 + 400) = STACK[0x4E0];
  *(_DWORD *)(v63 + 408) = 858960442 - v62 + LODWORD(STACK[0x518]);
  *(void *)(v63 + 416) = STACK[0x2B8] + (v62 - 2046769026);
  int v68 = (*(uint64_t (**)(unint64_t, uint64_t))(v67 + v65 * (uint64_t)v64 + 8))(STACK[0x268], a62);
  return (*(uint64_t (**)(__n128))(STACK[0x2D8]
                                           + 8
                                           * ((3617
                                             * ((v68 ^ 0xFFF75BA9) + (v66 ^ 0x6FEEEC00) + ((2 * v68) & 0xFFEEB752) == 789 * LODWORD(STACK[0x218]) + 1877360746)) ^ v66)))((__n128)0);
}

uint64_t sub_1A2DFA8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, int a8)
{
  return (*(uint64_t (**)(void))(v10 + 8 * (((v9 == (((9 * (v8 ^ a5) + a6) & a7) + 123)) * a8) ^ v8)))();
}

void sub_1A2DFA908()
{
  *(_DWORD *)(v0 + 20) = (v1 ^ 0xEFEFCBAD) + 2146860540 + ((2 * v1) & 0xDFDE905A);
}

uint64_t sub_1A2DFA978()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 - 1451726374) & 0x56879AEE ^ 0x1051) * (v0 != 110143211)) ^ v1)))();
}

uint64_t sub_1A2DFA9C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, char a10, uint64_t a11, char a12, __int16 a13, char a14, uint64_t a15, int a16, unsigned int a17, uint64_t a18, char *a19)
{
  a17 = (v19 + 2125) ^ (((2 * (&a16 & 0x61EC3368) - &a16 - 1642869616) ^ 0x2F1A4A5E) * v20);
  a18 = a11;
  a19 = &a12;
  (*(void (**)(int *))(v21 + 8 * (v19 + 4789)))(&a16);
  a18 = a11;
  a19 = &a14;
  a17 = (v19 + 2125) ^ (((2 * (&a16 & 0x66559BC8) - &a16 - 1716886478) ^ 0x28A3E2FC) * v20);
  (*(void (**)(int *))(v21 + 8 * (v19 ^ 0x12DBu)))(&a16);
  a18 = a11;
  a19 = &a10;
  a17 = (v19 + 2125) ^ (((&a16 - 941475311 - 2 * (&a16 & 0xC7E23A11)) ^ 0x76EBBCDF) * v20);
  (*(void (**)(int *))(v21 + 8 * (v19 + 4789)))(&a16);
  LODWORD(a19) = v19
               - 476588053 * ((((2 * &a16) | 0x15176174) - &a16 - 176926906) ^ 0xB776B4F9)
               - 17;
  a18 = a11;
  uint64_t v23 = (*(uint64_t (**)(int *))(v21 + 8 * (v19 ^ 0x1517u)))(&a16);
  return (*(uint64_t (**)(uint64_t))(v21 + 8 * (((a16 == v22) * (v19 - 209)) ^ v19)))(v23);
}

uint64_t sub_1A2DFAB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,uint64_t a21,uint64_t a22,int a23,int a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v31 = ((v29 >> (((a5 + 86) | 0x10u) + 110)) ^ (a1 + 478 * (a5 ^ 0x44Bu) - 3346))
      + HIDWORD(a8)
      + (*(_DWORD *)(a27 + a13) ^ v27);
  *(_DWORD *)(a27 + 4 * a16) = v27 + v31 - (v28 & (2 * v31));
  *(_DWORD *)(a27 + a13) = HIDWORD(v31) | v27;
  BOOL v33 = a24 - 1776138027 > 1259421079 || a24 - 1776138027 < a20;
  return (*(uint64_t (**)(void))(v30 + 8 * (a5 ^ (3570 * v33))))();
}

uint64_t sub_1A2DFAC10@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8
                                                    * (((*(_DWORD *)(*v4 + 4 * v5) != v3) * (((a2 - 2) | 0xA) ^ 0xC82)) | a2)))(a1, (a2 - 1132));
}

void sub_1A2DFAC50()
{
}

uint64_t sub_1A2DFAC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  int v46 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, char *))(v45 + 8 * (v44 ^ 0x141C)))(*(unsigned int *)(a10 - 8), 21, v43, 552, v43, &a43);
  return (*(uint64_t (**)(void))(v45
                              + 8
                              * ((2852
                                * ((v46 ^ (v44 - 270115027)) + ((v44 + 337) ^ 0x7FFFE831) + ((2 * v46) & 0xDFCCBF56) == 1877363113)) ^ v44)))();
}

void sub_1A2DFACEC()
{
}

uint64_t sub_1A2DFB564(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  uint64_t v57 = *(void *)(v50 + 8 * ((v53 | (8 * v56)) ^ 0x8E49BCCF));
  *((void *)&v58 + 1) = v57 ^ 0x1187E54A1;
  *(void *)&long long v58 = v57 ^ 0xC00A70E000000000;
  unint64_t v59 = (v58 >> 37)
      - 0x3D22EBEF885D29A4
      - (((unint64_t)(v58 >> 37) << ((v51 + a3) & a6 ^ 0x99u)) & 0x85BA2820EF45ACB8);
  *(void *)(a49 + 8 * (v56 ^ v54)) = v59 ^ 0x54192E77A4E9ABB6 ^ ((v52 ^ (v59 >> 3) & 0x1347E31C7F10F947 ^ 0x1043A2000E105843)
                                                                     - 0x3D22EBEF885D29A4
                                                                     - 2
                                                                     * ((v52 ^ (v59 >> 3) & 0x1347E31C7F10F947 ^ 0x1043A2000E105843) & 0x42DD141077A2D67CLL ^ v55));
  return (*(uint64_t (**)(void))(a50
                              + 8
                              * (v51 ^ (4
                                      * ((((v56 ^ 0x91C937B1)
                                         - 1849083983
                                         + (~(2 * (v56 ^ 0x91C937B1) + 2) | 0xDC6D909D)
                                         + 2) ^ 0x91C93780) > 0x3F)))))();
}

uint64_t sub_1A2DFB694(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((2476 * ((a7 + 1 + v7) < 0x20)) ^ a3)))();
}

uint64_t sub_1A2DFB774(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, unsigned int a14)
{
  int v20 = *a1 + v18 - 567690322 + *(_DWORD *)(v14 - 0x5571DF7BBE96A37DLL);
  unsigned int v21 = 375636451 * ((2 * (&a11 & 0x3AF9C08) - &a11 + 2085643255) ^ 0x2F6E397B);
  a13 = v14;
  a12 = (((v19 - 908) | 0x226) ^ 0x70BC82F) + v21 + v20;
  a11 = v21 + v19 + 3659;
  a14 = 1102258364 - v21;
  uint64_t v22 = (*(uint64_t (**)(int *))(v16 + 8 * (v19 + 4027)))(&a11);
  return (*(uint64_t (**)(uint64_t))(v16 + 8 * ((295 * (*v15 == v17)) ^ v19)))(v22);
}

uint64_t sub_1A2DFB860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15, uint64_t a16, char *a17)
{
  a15 = ((v20 & 0xCED) + 1303) ^ (((2 * (&a14 & 0x7E67A6D0) - &a14 + 26761514) ^ 0xB091DFE4)
                                * v19);
  a16 = a12;
  a17 = &a11;
  (*(void (**)(int *))(v17 + 8 * (v20 & 0xCED ^ 0x1781u)))(&a14);
  LODWORD(a17) = (v20 & 0xCED)
               - 476588053
               * (((&a14 | 0xB7006F0D) - &a14 + (&a14 & 0x48FF90F0)) ^ 0xAFD6B4E)
               - 839;
  a16 = a12;
  uint64_t v21 = (*(uint64_t (**)(int *))(v17 + 8 * (v20 & 0xCED ^ 0x104Du)))(&a14);
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8
                                            * ((252 * (a14 == (((v20 & 0xCED) - 29062) & 0xFFC ^ (v18 + 420)))) ^ v20 & 0xCEDu)))(v21);
}

void sub_1A2DFB968()
{
}

uint64_t sub_1A2DFB9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  return (*(uint64_t (**)(void))(v22 + 8 * (((a21 == -1301572304) * ((2 * v21) ^ 0x610)) ^ v21)))();
}

uint64_t sub_1A2DFBA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, _DWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  *a5 = 0;
  *a6 = 0;
  a20 = 31090337 * ((&a19 + 1539456959 - 2 * ((unint64_t)&a19 & 0x5BC23FBF)) ^ 0x9C435FF6)
      + 1655392376;
  uint64_t v21 = (*(uint64_t (**)(int *))(v20 + 41128))(&a19);
  return (*(uint64_t (**)(uint64_t))(v20 + 8 * ((13 * (((a19 == 1877363113) ^ 0xF5) & 1)) ^ 0x3D5u)))(v21);
}

uint64_t sub_1A2DFBAF4@<X0>(int a1@<W0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  uint64_t v9 = (a1 - 313925767);
  *(unsigned char *)(a2 + v9) = *(unsigned char *)(v7 + v9) ^ *(unsigned char *)(v4 + (v9 & 0xF)) ^ *(unsigned char *)(v3 + (v9 & 0xF)) ^ *(unsigned char *)(v6 - 1042 + a3 + (v9 & 0xF) - 866) ^ (-73 * (v9 & 0xF)) ^ 0x83;
  return (*(uint64_t (**)(void))(v8 + 8 * ((3501 * (a1 - 1 == v5)) ^ v6)))();
}

uint64_t sub_1A2DFBB68()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((22 * (v1 > 0xEE6894D4)) ^ 0x925)))();
}

uint64_t sub_1A2DFBBC4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((124 * (STACK[0x500] == 0)) ^ (v0 + 1279))))();
}

void sub_1A2DFBBFC()
{
}

uint64_t sub_1A2DFBC08@<X0>(unsigned int a1@<W1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44)
{
  unint64_t v44 = STACK[0x950] + (a2 ^ a1) - 0x28A67116B7518001;
  BOOL v45 = v44 < 0x3AC79B3A;
  BOOL v46 = v44 > STACK[0x948] + 986159930;
  if (STACK[0x948] > 0xFFFFFFFFC53864C5 != v45) {
    BOOL v46 = v45;
  }
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * ((58 * !v46) ^ (a44 + 903))))();
}

void sub_1A2DFBC98()
{
}

void sub_1A2DFC0D0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15)
{
  unsigned int v19 = (v15 ^ 0xC985FA3A ^ (a1 - 553651974) & 0xFFF5DF6F) + (a15 ^ v16);
  *(_DWORD *)(v18 - 132) = v16 + v19 - (v17 & (2 * v19));
  JUMPOUT(0x1A2DFC130);
}

uint64_t sub_1A2DFC1B4(uint64_t a1)
{
  BOOL v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 1392)))(a1, 3209139829) != 0;
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 ^ (16 * v3))))();
}

void sub_1A2DFC1F4()
{
}

uint64_t sub_1A2DFC26C(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v10 = (a3 + a2 + 570425344);
  uint64_t v11 = v10 + v4;
  uint64_t v12 = v10 + *(void *)(v9 - 120);
  uint64_t v13 = (a3 + a2) & 0xF;
  unint64_t v14 = v13 + v7 - v12;
  unint64_t v15 = (v13 | v6) - v12;
  unint64_t v16 = (v13 | v5) - v12;
  BOOL v20 = (unint64_t)(v11 - v12) > 0xF
     && v14 > 0xF
     && v15 > 0xF
     && v16 >= (unint64_t)((a4 - 1973080245) & 0x759ACF3D) - 2860;
  return (*(uint64_t (**)(void))(v8 + 8 * ((119 * v20) ^ a4)))();
}

void sub_1A2DFC2F4()
{
  int v7 = ((v6 - 144) ^ 0x16AE5644) * v3;
  *(void *)(v6 - 136) = v0;
  *(void *)(v6 - 120) = v4;
  *(_DWORD *)(v6 - 144) = ((v1 | 0xD20) + 1547) ^ v7;
  *(_DWORD *)(v6 - 124) = v2 - v7 + ((v1 | 0xD20) ^ 0xD5837E2C);
  (*(void (**)(uint64_t))(v5 + 8 * ((v1 | 0xD20) ^ 0x1E81)))(v6 - 144);
  JUMPOUT(0x1A2DB5218);
}

uint64_t sub_1A2DFC364@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W8>)
{
  int v14 = *(unsigned __int8 *)(v7 + v9 + 3);
  int v15 = (*(unsigned __int8 *)(v7 + v9) << (v8 ^ 0x8A)) | (*(unsigned __int8 *)(v7 + v9 + 1) << 16) | (*(unsigned __int8 *)(v7 + v9 + 2) << (v10 ^ 0x88)) | v14;
  int v16 = v15 - 997180220 - 2 * (v15 & 0x44903CDF ^ v14 & v12);
  LOWORD(v14) = _byteswap_ushort(*(_WORD *)(v7
                                          + ((2 * (v9 + 4)) & 0xFB5F7FADF7EABFB6)
                                          + ((v9 + 4) ^ 0x7DAFBFD6FBF55FDBLL)
                                          - 0x7DAFBFD6FBF55FDBLL));
  LOWORD(v14) = v14 - ((2 * v14) & 0x9DA2);
  unsigned __int16 v17 = v14 + 20189;
  __int16 v18 = v14 + 20177;
  uint64_t v19 = v9 + 10;
  unint64_t v20 = v11 + 10;
  switch(v17)
  {
    case 0x1E16u:
      STACK[0x7F0] = v7 + v19;
      STACK[0x4B0] = v20;
      return (*(uint64_t (**)(void))(a6 + 8 * ((3932 * (v16 == ((v13 + 1312) ^ 0xC4903276))) ^ (v13 - 917))))();
    case 0xCA60u:
      uint64_t v21 = (v13 - 917);
      uint64_t v25 = ((2 * v19) & 0xBFF7BDCE7FC3FB76) + (v19 ^ 0x5FFBDEE73FE1FDBBLL) + v7;
      unint64_t v26 = ((unint64_t)*(unsigned __int8 *)(v25 - 0x5FFBDEE73FE1FDBBLL) << 56) | ((unint64_t)*(unsigned __int8 *)(v25 + (v21 ^ 0xA0042118C01E07BBLL)) << 48) | ((unint64_t)*(unsigned __int8 *)(v25 - 0x5FFBDEE73FE1FDB9) << 40) | ((unint64_t)*(unsigned __int8 *)(v25 - 0x5FFBDEE73FE1FDB8) << 32) | ((unint64_t)*(unsigned __int8 *)(v25 - 0x5FFBDEE73FE1FDB7) << 24) | ((unint64_t)*(unsigned __int8 *)(v25 - 0x5FFBDEE73FE1FDB6) << 16) | ((unint64_t)*(unsigned __int8 *)(v25 - 0x5FFBDEE73FE1FDB5) << 8) | *(unsigned __int8 *)(v25 - 0x5FFBDEE73FE1FDB4);
      STACK[0x718] = v26 - 0x6C518827C8765D2ALL - ((2 * v26) & 0x275CEFB06F1345ACLL);
      goto LABEL_7;
    case 0xD9B2u:
      LODWORD(v21) = v13 ^ 0xC6F;
      uint64_t v22 = (unsigned __int8 *)(((v19 << (v13 ^ 0x93u)) & 0xAFDF7BFF7FFFBCDELL)
                              + (v19 ^ 0xD7EFBDFFBFFFDE6FLL)
                              + v7
                              + 0x2810420040002191);
      int v23 = (*v22 << 24) | (v22[1] << 16) | (v22[2] << 8);
      LODWORD(STACK[0x6EC]) = (v23 | v22[3]) - 997180220 - 2 * ((v23 | v22[3]) & 0x44903CDF ^ v22[3] & 0x1B);
LABEL_7:
      int v27 = v21 - 1341;
      STACK[0x4B0] = v20;
      unint64_t v28 = STACK[0x638];
      int v29 = STACK[0x6EC];
      unint64_t v30 = STACK[0x718];
      unint64_t v31 = STACK[0x7F0];
      STACK[0x818] = *(void *)(a6 + 8 * v27);
      STACK[0x698] = v28;
      LODWORD(STACK[0xA48]) = v16;
      LOWORD(STACK[0xA4E]) = v18;
      LODWORD(STACK[0xA50]) = a7;
      LODWORD(STACK[0xA54]) = v29;
      STACK[0xA58] = v30;
      STACK[0xA60] = v31;
      return (*(uint64_t (**)(void))(a6
                                  + 8
                                  * (int)(((v28 == 0x62E55A5149BFD944)
                                         * (((v27 + 1986) | 0x110) + ((v27 + 67) ^ 0xFFFFF788))) ^ (v27 + 3428))))();
  }
  return sub_1A2DF92F8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1A2DFC650@<X0>(int a1@<W0>, uint64_t a2@<X3>, int a3@<W7>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  int v44 = v40 ^ a1;
  unsigned int v45 = a4 - v40 - 660947031 + (v40 ^ a1 ^ 0x919F4805);
  LODWORD(STACK[0x638]) = (((v41 ^ 0xBA57BAFC) - 1877997212 + v39) ^ v42 ^ v41 ^ 0xA1B96940)
                        + 1542741948
                        + ((2 * (((v41 ^ 0xBA57BAFC) - 1877997212 + v39) ^ v42 ^ v41)) & 0xF95FE8AA ^ 0xB80D282A);
  return (*(uint64_t (**)(void, void, void))(a2
                                                           + 8
                                                           * ((23
                                                             * ((v38 ^ 0xE2A5EEB4) != ((a38 + 1703947888) & 0x9A6FCFFF)
                                                                                    + (a38 ^ 0x166D4B60))) ^ a38)))(((((v45 - 1412210675 - ((2 * v45) & 0x57A6C01A)) ^ 0xABD3600D) + 366088407) ^ 0x335B9D1E)- 33718530+ ((2 * (((v45 - 1412210675 - ((2 * v45) & 0x57A6C01A)) ^ 0xABD3600D) + 366088407)) & 0x66B73A3C), (((v44 ^ a3) - 873973114) ^ 0xFDDDEF98) - 542411024 + ((2 * ((v44 ^ a3) - 873973114)) & 0xFBBBDF30), (v44 ^ (v43 - v40 + 1451877318) ^ 0x9D164A17)+ 2147446716+ ((2 * (v44 ^ (v43 - v40 + 1451877318))) & 0xE6EDFBDA ^ 0xC4C16BD0)+ 1631);
}

void sub_1A2DFC8F0(uint64_t a1, int a2)
{
  STACK[0x490] = *(void *)(STACK[0x2A8] + 8 * ((a2 + 457376259) & 0xFFFFFFFFE4BCF47ELL));
  JUMPOUT(0x1A2D21EE0);
}

void sub_1A2DFC97C()
{
}

uint64_t sub_1A2DFCAAC@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + (v6 + v4)) = *(unsigned char *)(v7 + (v6 + v4)) ^ *(unsigned char *)(v3
                                                                                                 + ((v6 + v4) & 0xFLL)) ^ *(unsigned char *)(v2 + ((v6 + v4) & 0xFLL)) ^ *(unsigned char *)(((v6 + v4) & 0xFLL) + a2 + 2) ^ (-73 * ((v6 + v4) & 0xF)) ^ 0x83;
  return (*(uint64_t (**)(void))(v8 + 8 * ((3395 * (v6 + 1 + v4 >= (v5 - 1608))) ^ v5)))();
}

uint64_t sub_1A2DFCB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, int a18, uint64_t a19, unsigned int a20,int a21,int a22)
{
  unsigned int v26 = 1314530549
      * (((&a17 | 0x1A4ED317) - &a17 + (&a17 & 0xE5B12CE8)) ^ 0xAB4755D9);
  a18 = (v22 + 1780980014) ^ v26;
  a20 = 115673090 - v26;
  a22 = v26 ^ 0x13F055B8;
  a19 = a13;
  a17 = &STACK[0x67CF598A0A88731];
  uint64_t v27 = (*(uint64_t (**)(unint64_t **))(v25 + 8 * (v22 + 4039)))(&a17);
  return (*(uint64_t (**)(uint64_t))(v25 + 8 * (((a21 == v23) * ((v22 ^ 0x6EE) + v24 - 3229)) ^ v22)))(v27);
}

uint64_t sub_1A2DFCBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8 * (((*(void *)(v6 + 24) != 0) * (((v7 + v10) & v8) + v9)) ^ v7)))();
}

uint64_t sub_1A2DFCC20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, uint64_t a17, unsigned int a18, int a19)
{
  uint64_t v24 = *v19;
  uint64_t v25 = v19[6];
  unsigned int v26 = 366490169 * ((&a12 & 0xC1B1AC5E | ~(&a12 | 0xC1B1AC5E)) ^ 0x28E005E5);
  a13 = a11;
  a14 = a11;
  a18 = (a10 ^ 0x5FF7FEBE) - v26 - 274859012 + ((a10 << (((v23 + 48) & 0xBB) + 104)) & 0xBFEFFD7C);
  a19 = v26 + v23 + 1106909947;
  a12 = v21 - v26 - 829564197;
  a16 = v25;
  a17 = v24;
  uint64_t v27 = (*(uint64_t (**)(int *))(v22 + 8 * (v23 + 1201)))(&a12);
  return (*(uint64_t (**)(uint64_t))(v22 + 8 * ((26 * (a15 != v20)) ^ v23)))(v27);
}

uint64_t sub_1A2DFCD1C()
{
  LODWORD(STACK[0x520]) = v10;
  STACK[0x3F0] = *(void *)(v16 + 8 * v12);
  STACK[0x580] = v13;
  STACK[0x588] = v11;
  unint64_t v0 = STACK[0x3A0];
  int v1 = (char *)&STACK[0x5E0] + STACK[0x3A0];
  STACK[0x590] = (unint64_t)v1;
  STACK[0x3A0] = v0 + 320;
  LODWORD(STACK[0x40C]) = *(_DWORD *)(v13 - 0x14E110F44ADD9A83);
  LODWORD(STACK[0x450]) = *(_DWORD *)(v13 - 0x14E110F44ADD9A7FLL);
  LODWORD(STACK[0x524]) = *(_DWORD *)(v13 - 0x14E110F44ADD9A7BLL);
  LODWORD(STACK[0x3BC]) = *(_DWORD *)(v13 - 0x14E110F44ADD9A77);
  int v2 = *(unsigned __int8 *)(v13 - 0x14E110F44ADD9A6BLL) ^ 8;
  if (v2 == 2)
  {
    unsigned int v9 = STACK[0x298] & 0xD049CB99;
    LODWORD(STACK[0x328]) = *(_DWORD *)(v13 - 0x14E110F44ADD9A73);
    LODWORD(STACK[0x2E4]) = 1040973164;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16
                                                                         + 8
                                                                         * (int)((2691
                                                                                * (((39 * (v9 ^ 0x193)) ^ 0x109 ^ LODWORD(STACK[0x2B0]))
                                                                                 + 1040973164 < 0x40)) ^ v9)))(2002410206, 131, 4116, 3253998328);
  }
  else
  {
    if (v2 != 1) {
      JUMPOUT(0x1A2D656F4);
    }
    int v3 = LODWORD(STACK[0x2D4]) - 1132;
    int v4 = LODWORD(STACK[0x2D4]) + 1971;
    LODWORD(STACK[0x2E4]) = v14;
    unint64_t v5 = STACK[0x2A0] + v0;
    BOOL v7 = (unint64_t)v1 < v11 + 64 && v11 < v5;
    return (*(uint64_t (**)(void))(v16 + 8 * (int)((((v3 ^ 0xFFFFFFE8) + v15) * v7) ^ v4)))();
  }
}

void sub_1A2DFCD38()
{
}

void sub_1A2DFCD68()
{
}

uint64_t sub_1A2DFCD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11, uint64_t a12, uint64_t a13, int a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21,unsigned int a22,uint64_t a23,uint64_t a24,unint64_t *a25)
{
  a21 = &a15;
  a22 = (v26 + 1229) ^ (1401278017
                      * ((2 * (&a21 & 0x15269478) - &a21 - 354849920) ^ 0xEEFA1D67));
  a25 = &STACK[0xCACAEBD78BF8384];
  a23 = a18;
  uint64_t v28 = (*(uint64_t (**)(char **))(v27 + 8 * (v26 ^ 0x123E)))(&a21);
  return (*(uint64_t (**)(uint64_t))(v27 + 8 * ((((v26 + 1162843193) & 0x6FF7 ^ 0x17D9) * (a11 < v25)) ^ v26)))(v28);
}

uint64_t sub_1A2DFCE60(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((7843
                                * ((v6 & 0x18) == v4
                                                + (a4 ^ 0x17C ^ (v5 + 210))
                                                + (((a4 ^ 0x17C) - 77704572) & 0x4A1A7BB)
                                                + 1083)) ^ a4 ^ 0x17C)))();
}

void sub_1A2DFCEBC(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)a1 - 1437274309 * (((a1 | 0x71DC8019) - (a1 & 0x71DC8019)) ^ 0x53D2FD2C);
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x5762211BC84F9B38);
  uint64_t v4 = *(void *)(a1 + 8);
  unsigned int v5 = v1 - 142545853 * ((&v4 & 0x346C2ADB | ~(&v4 | 0x346C2ADB)) ^ 0xE16C7A4B) - 2126;
  uint64_t v3 = (uint64_t)*(&off_1EF5F46E0 + (v1 ^ 0x10C8));
  (*(void (**)(uint64_t *))(v3 + 8 * (v1 ^ 0x498)))(&v4);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DFD000(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)(v7 + v6 - 0x14E110F4C1F74480 + (v4 ^ a3)) = v9;
  return (*(uint64_t (**)(void))(v8 + 8 * (int)((((v5 & 0xFFFFFFFFFFFFFFF8) == 8) * a4) ^ v4)))();
}

void sub_1A2DFD050()
{
}

void sub_1A2DFD088()
{
  STACK[0x428] = 0;
  STACK[0x490] = *(void *)(STACK[0x2A8] + 8 * (v0 - 2417));
  JUMPOUT(0x1A2D21EE8);
}

uint64_t sub_1A2DFD0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LODWORD(STACK[0x6CC]) = 440783816;
  return (*(uint64_t (**)(void))(a6 + 8 * ((494 * ((v6 ^ v7 ^ (887 * (v6 ^ 0x8E8) + 440782837)) == 440783816)) ^ v6)))();
}

uint64_t sub_1A2DFD110@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((((v4 - 1347694729) & 0xD77C6FDD) + 725829084) ^ a1) == v1 - 799637334)
                                     * ((v4 - 972) ^ 0x8728436F ^ v2)) ^ (v4 - 972))))();
}

uint64_t sub_1A2DFD184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v7 = STACK[0x53C];
  STACK[0x518] -= 80;
  return (*(uint64_t (**)(void))(a6 + 8 * (((v7 == 1877363113) * (((v6 - 524) ^ 0x919) + 1545)) ^ v6)))();
}

uint64_t sub_1A2DFD1C8(int8x8_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, int a7)
{
  *(int8x8_t *)(a3 + (v7 + a7)) = veor_s8(*(int8x8_t *)(v8 + (v7 + a7)), a1);
  return (*(uint64_t (**)(void))(v10 + 8 * (((v9 == a7) * a6) ^ a4)))();
}

uint64_t sub_1A2DFD1F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(qword_1EF5F4A90
                                            + 8
                                            * (((16 * (*(_DWORD *)(a2 + 4) == 2050534435)) | (32
                                                                                            * (*(_DWORD *)(a2 + 4) == 2050534435))) ^ 0xA5Fu)))(4294925278);
}

uint64_t sub_1A2DFD238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, uint64_t a15, unsigned int a16, int a17, int a18)
{
  unsigned int v21 = 1314530549 * (((&a13 | 0x51BF97F7) + (~&a13 | 0xAE406808)) ^ 0xE0B61138);
  a15 = a10;
  a14 = (v20 + 1780978404) ^ v21;
  a13 = &STACK[0x67CF598A0A88719];
  a16 = -164946312 - v21;
  a18 = v21 ^ 0x13F055B8;
  uint64_t v22 = (*(uint64_t (**)(unint64_t **))(v18 + 8 * (v20 ^ 0x1983)))(&a13);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * ((249
                                              * (((v20 + 52) ^ (a17 == (v20 ^ 0x80B ^ (v19 + 552)))) & 1)) ^ v20)))(v22);
}

uint64_t sub_1A2DFD320()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((v1 - 3973)
                                * ((int)((v3 ^ 0x7FFFB6F1) - 23105729 + (v0 & 0xFFFF6DE2) - 2124359217) >= 0)) ^ v1)))();
}

uint64_t sub_1A2DFD438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  STACK[0x7B0] = STACK[0x9A8];
  return (*(uint64_t (**)(void))(a6
                              + 8
                              * ((((2 * ((v6 + 1678) | 0xD0)) ^ 0x20B8) * (LODWORD(STACK[0x9B4]) == v7)) ^ ((v6 + 1678) | 0xD0))))();
}

uint64_t sub_1A2DFD490@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  unsigned int v6 = a2 + v4 + v3 - 909;
  unsigned int v7 = *(_DWORD *)((char *)&STACK[0x2EC] + (v6 & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + v6) = v7 ^ 0xD6;
  *(unsigned char *)(a1 + (a2 + v4 + 130)) = (BYTE2(v7) ^ 0x70) - ((v7 >> 15) & 6) - 125;
  *(unsigned char *)(a1 + (a2 + v4 + 129)) = (BYTE1(v7) ^ 0x26) - 2 * ((BYTE1(v7) ^ 0x26) & 3) - 125;
  *(unsigned char *)(a1 + (a2 + v4 + 131)) = (HIBYTE(v7) ^ 0x17)
                                                 - 2 * ((HIBYTE(v7) ^ 0x17) & 0xB ^ HIBYTE(v7) & 8)
                                                 - 125;
  unsigned int v8 = LODWORD(STACK[0x348]) - 1499737448;
  BOOL v9 = v8 < v2;
  BOOL v10 = v4 + 106699950 < v8;
  if (v4 + 106699950 < v2 != v9) {
    BOOL v10 = v9;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((89 * !v10) ^ v3)))();
}

uint64_t sub_1A2DFD580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  *(_DWORD *)(v61 + 1424) = 1744239321;
  *(_DWORD *)(v61 + 1428) = 1099242528;
  *(void *)(v61 + 1432) = v59;
  *(void *)(v61 + 1440) = v59;
  *(_DWORD *)(v61 + 1448) = v60;
  *(__n128 *)(v61 + 1452) = a9;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 8 * ((((v58 ^ 0x292) == -45) * (int)a1) ^ v58)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
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

void sub_1A2DFD6D4()
{
  *(_DWORD *)(v5 - 144) = v3 + ((((v5 - 144) | 0xA73C6A7) + (~(v5 - 144) | 0xF58C3958)) ^ 0x1CDD90E2) * v0 + 774;
  *(void *)(v5 - 136) = v4;
  *(void *)(v5 - 128) = v2;
  (*(void (**)(uint64_t))(v1 + 8 * (v3 + 2458)))(v5 - 144);
  JUMPOUT(0x1A2DFD724);
}

void sub_1A2DFD96C()
{
}

uint64_t sub_1A2DFD9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8 * (v15 + 3989)))(a1, 1171689746);
  return (*(uint64_t (**)(void))(a15 + 8 * (int)(((((2 * v15) ^ 0xFFFFFB2E) + 43 * (v15 ^ 0x4D4)) * (v17 == 0)) ^ v15)))();
}

void sub_1A2DFDA1C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1401278017 * (a1 ^ 0x42376E7));
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2DFDACC@<X0>(uint64_t a1@<X1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,unsigned int *a58)
{
  unsigned int v59 = (a2 + 1679292381) & 0x9BE80B9E;
  uint64_t v60 = (*(uint64_t (**)(void, uint64_t, void))(v58 + 8 * (a2 + 3226)))(*a58, a1, LODWORD(STACK[0x4D8]));
  return (*(uint64_t (**)(uint64_t))(STACK[0x2D8]
                                            + 8
                                            * (int)((6504 * (LODWORD(STACK[0x314]) == (v59 ^ 0x6FE648C9) + v59 - 1324)) ^ v59)))(v60);
}

uint64_t sub_1A2DFDB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58)
{
  return (*(uint64_t (**)(void))(a4
                              + 8
                              * ((60 * (LODWORD(STACK[0x304]) - a58 == ((v58 - 3451) ^ (v58 - 1757) ^ 0xF144BE51))) ^ v58)))();
}

uint64_t sub_1A2DFDB9C(int *a1)
{
  unsigned int v2 = a1[1] - 31090337 * (a1 ^ 0xC7816049);
  unsigned int v3 = v2 - 1655392249;
  uint64_t result = (*((uint64_t (**)(char *, void (*)()))*(&off_1EF5F46E0 + (int)(v2 ^ 0x62AB480E))
            + (int)(v2 ^ 0x62AB5C55)))((char *)*(&off_1EF5F46E0 + (int)(v2 - 1655392249)) - 8, sub_1A2D74BEC);
  int v5 = *(_DWORD *)*(&off_1EF5F46E0 + (int)(v3 + 70));
  if (result) {
    int v5 = 1877320807;
  }
  *a1 = v5;
  return result;
}

uint64_t sub_1A2DFDC54()
{
  int v4 = v2 + 1585137133 + (v0 ^ 0xDEA) + 2805;
  int v5 = (v3 > 0xEFA2B62) ^ (v4 < 3 * (v0 ^ 0xDEA) - 251280880);
  BOOL v6 = v4 < (int)(v3 + 1896207517);
  if (v5) {
    BOOL v6 = v3 > 0xEFA2B62;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 | (2 * !v6))))();
}

uint64_t sub_1A2DFDCCC()
{
  *(void *)(v0 - 0xF1D64C7E308EC03) = (*v1 - 816837588) + *(void *)(v3 - 0x5571DF7BBE96A38DLL) + 8;
  return (*(uint64_t (**)(void))(v5 + 8 * ((194 * ((v2 ^ 0x68 ^ (*v4 == v6)) & 1)) ^ v2 ^ 0x768)))();
}

void sub_1A2DFDD40(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 48) - 1437274309 * ((2 * (a1 & 0x2F1A4CF2) - a1 - 790252787) ^ 0xF2EBCE38);
  __asm { BRAA            X9, X17 }
}

void sub_1A2DFDE80()
{
}

void sub_1A2DFDF5C()
{
}

uint64_t sub_1A2DFDF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unsigned int a22,unint64_t a23,int a24,int a25,unint64_t a26)
{
  int v32 = 366490169 * ((((2 * v28) | 0x7AEF86C4) - v28 + 1116224670) ^ 0xABD99526);
  a22 = v31 - ((2 * v31) & 0xC95D55D8) - 458315028 + v32;
  a23 = a16;
  a24 = v27 - 678 + v32;
  (*(void (**)(unsigned int *))(v26 + 8 * (v27 + 1495)))(&a22);
  uint64_t v33 = 366490169 * (v28 ^ 0x2A9EB51416AE5644);
  a24 = v27 - v33 - 3324;
  a26 = a16;
  a23 = v30 - ((2 * v30) & 0xF3C6351A26D1B28ALL) - v33 - 0x61CE572EC9726BBLL;
  (*(void (**)(unsigned int *))(a15 + 8 * (v27 ^ 0x1D89)))(&a22);
  int v34 = 366490169 * (((v28 | 0x35DF1818) - (v28 & 0x35DF1818)) ^ 0x23714E5C);
  a24 = v27 - 678 + v34;
  a23 = a16;
  a22 = v29 - 458315028 + v34 - ((v29 << (v27 - 70)) & 0xC95D55D8);
  uint64_t v35 = (*(uint64_t (**)(unsigned int *))(a15 + 8 * (v27 + 1495)))(&a22);
  return (*(uint64_t (**)(uint64_t))(a15 + 8 * ((7696 * (a25 == 1877363113)) ^ v27)))(v35);
}

void sub_1A2DFE140(int a1@<W8>)
{
  sub_1A2D870EC((a1 & 0xBFFFFFFF ^ 0x49BE659F) - ((2 * (a1 & 0xBFFFFFFF ^ 0x49BE659F)) & 0x937CCB3E) + 1237213458 + 5 * (v1 ^ 0x4A6));
}

uint64_t sub_1A2DFE180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v8 = STACK[0x3E0];
  unint64_t v9 = STACK[0x410];
  unint64_t v10 = STACK[0x618];
  STACK[0xA38] = (unint64_t)&STACK[0xA90] + v6 - 0x3C1F285C35AAF87;
  STACK[0x518] = v6;
  STACK[0x5E8] = v9;
  STACK[0x6B8] = v10;
  uint64_t v11 = (*(uint64_t (**)(void))(a6 + 8 * (v7 + 1318)))();
  unint64_t v12 = STACK[0x2A8];
  STACK[0x3C0] = 0;
  BOOL v15 = v8 != -72 && v9 != 0x1F9C54008879B75FLL && v10 != 0x755C9EE36E09A9FFLL;
  return (*(uint64_t (**)(uint64_t))(v12
                                            + 8
                                            * (int)((v15 * ((((v7 ^ 0x601) - 1648) ^ 0xFFFFEC1A) + 2 * (v7 ^ 0x601))) ^ v7)))(v11);
}

uint64_t sub_1A2DFE23C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, __int16 a16, char a17, char *a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23,char *a24,char *a25,unint64_t *a26,unsigned int a27,unint64_t *a28)
{
  a27 = v29
      + 1761959447 * ((&a24 & 0x9979D645 | ~(&a24 | 0x9979D645)) ^ 0xC721E87E)
      + 166307179;
  a26 = &STACK[0x2025EE26DBFC4C37];
  a24 = a18;
  a25 = &a15;
  (*(void (**)(char **))(v30 + 8 * (v29 + 3932)))(&a24);
  a24 = &a23;
  a28 = &STACK[0xCACAEBD78BF8384];
  a26 = (unint64_t *)a18;
  LODWORD(a25) = (v29 + 442) ^ (1401278017 * (&a24 ^ 0x42376E7));
  (*(void (**)(char **))(v30 + 8 * (v29 + 3875)))(&a24);
  a25 = a18;
  a26 = (unint64_t *)&a17;
  HIDWORD(a24) = (v29 + 1196) ^ (((2 * (&a24 & 0x3B7A8010) - &a24 + 1149599727) ^ 0xF58CF921)
                               * v28);
  (*(void (**)(char **))(v30 + 8 * (v29 + 3860)))(&a24);
  LODWORD(a26) = v29 - 476588053 * (&a24 ^ 0xBDFD0443) - 946;
  a25 = a18;
  uint64_t v31 = (*(uint64_t (**)(char **))(v30 + 8 * (v29 + 3912)))(&a24);
  return (*(uint64_t (**)(uint64_t))(v30
                                            + 8
                                            * (((a24 == ((v29 - 32) ^ 0x6FE64D11)) * ((v29 + 1432) ^ 0x1F5E)) ^ v29)))(v31);
}

void sub_1A2DFE3FC()
{
}

uint64_t sub_1A2DFE424@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  return sub_1A2D255A4(a1, (a3 + 460098872) & 0xE4937F76, 208, *(_DWORD *)(*v5 + 4 * (a2 - 1383402404)), v4, a4);
}

uint64_t sub_1A2DFE46C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((**(void **)(v3 + 8 * (v2 ^ 0x1B1)) == 0) * (a1 ^ 0x18EA)) ^ v2)))();
}

uint64_t sub_1A2DFE4A0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  __int16 v2 = *(_DWORD *)(result + 4) ^ (11565 * (result ^ 0x1BA8));
  *(_DWORD *)(v1 - 0x14E110F44ADD9A6BLL) = ((v2 & 3) + 536903679 + (v2 & 0x1FC ^ 0x46664FC1)) ^ 0x10F235FC;
  *(void *)(v1 - 0x14E110F44ADD9A8BLL) = 0x57B84DB108D47413;
  *(_DWORD *)(v1 - 0x14E110F44ADD9A6FLL) = 1615134885;
  int v3 = v2 ^ 0x34;
  if (v3 == 1)
  {
    int v4 = 1615134901;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x14E110F44ADD9A73) = -727529563;
    int v4 = 1615134905;
LABEL_5:
    *(void *)(v1 - 0x14E110F44ADD9A83) = 0xF8BD8DDC70350554;
    *(void *)(v1 - 0x14E110F44ADD9A7BLL) = 0x74272238FCAFAABLL;
    *(_DWORD *)(v1 - 0x14E110F44ADD9A6FLL) = v4;
  }
  *(_DWORD *)uint64_t result = 2043368649;
  return result;
}

void sub_1A2DFE5EC(uint64_t a1)
{
  __asm { BRAA            X13, X17 }
}

uint64_t sub_1A2DFE704@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (v9 - 904168601);
  int v11 = v7 + v10;
  char v12 = *(unsigned char *)(v7 + v10);
  uint64_t v13 = v10 + v6;
  unint64_t v14 = 1554976193 * ((1554976193 * v11) ^ ((1554976193 * v11) >> 16));
  unint64_t v15 = (unint64_t)(1554976193
                         * ((1554976193 * (v13 + 10)) ^ ((1554976193 * (v13 + 10)) >> 16))) >> 24;
  *(unsigned char *)(v13 + 10) = *(unsigned char *)(a4 + (v14 >> 24)) ^ v12 ^ *(unsigned char *)((v14 >> 24) + a3 + 1) ^ *(unsigned char *)((v14 >> 24) + a5 + 5) ^ *(unsigned char *)(a4 + v15) ^ *(unsigned char *)(v15 + a3 + 1) ^ *(unsigned char *)(v15 + a5 + 5) ^ (-63 * ((-63 * (v13 + 10)) ^ ((1554976193 * (v13 + 10)) >> 16))) ^ v14 ^ (-105 * BYTE3(v14)) ^ (-105 * ((1554976193 * ((1554976193 * (v13 + 10)) ^ ((1554976193 * (v13 + 10)) >> 16))) >> 24));
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * (((((v5 + 1683) ^ 0xFFFFF66D) + v9 != a1) * v8) ^ v5)))();
}

void sub_1A2DFE7E0()
{
}

uint64_t sub_1A2DFE920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22)
{
  return (*(uint64_t (**)(void))(v22
                              + 8
                              * ((((v23 + ((a11 - 1894002197) & 0x70E42DFB) - 462) ^ (a11 + 2095891434))
                                * (a22 == 1877363113)) ^ a11)))();
}

uint64_t sub_1A2DFE988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3
                              + 8
                              * (v5
                               + 988432889
                               + (((v3 - 79) ^ (v4 < ((v3 + 988435377) ^ 0x8B1337AC))) & 1)
                               - 709)))();
}

uint64_t sub_1A2DFE9D4@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W8>)
{
  *(_DWORD *)(v9 + 4 * (a3 + v6 + v8)) = a3 + v6 + v8 + (a1 ^ (a1 >> 30)) * v7;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 < 0x26F) * a2) ^ v5)))();
}

uint64_t sub_1A2DFE9E0()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((v2 + 988434404) ^ (1021 * (v3 > v1 + 623)))))();
}

void sub_1A2DFEA14()
{
}

uint64_t sub_1A2DFEA84(int a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((v2 + 970353207) & 0xC62999BF ^ 0xFFFFF7EB) + ((v2 - 936156169) & 0x37CC9FFF))
                                     * (v1 == a1)) | v2)))();
}

uint64_t sub_1A2DFEAE0@<X0>(__int16 a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43)
{
  LOWORD(STACK[0x8B6]) = a1;
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * (a43 - 2352)))();
}

void sub_1A2DFEAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49)
{
  STACK[0x2C8] = 0;
  if ((((v50 - 867) ^ 0x59C) & a49) != 0) {
    int v51 = 538847450;
  }
  else {
    int v51 = 538847446;
  }
  if ((a49 & 2) != 0) {
    int v51 = 538847445;
  }
  LODWORD(STACK[0x3F8]) = v51;
  LODWORD(STACK[0x2A8]) = 174173088;
  LODWORD(STACK[0x2B0]) = 1240793883;
  int v49 = (char *)&STACK[0x5E0] + STACK[0x2C8];
  STACK[0x290] = (unint64_t)(v49 + 2048);
  STACK[0x298] = (unint64_t)(v49 + 2176);
  STACK[0x2C0] = (unint64_t)v49;
  STACK[0x2A0] = (unint64_t)(v49 + 2304);
  JUMPOUT(0x1A2D2C5BCLL);
}

void sub_1A2DFEB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49,uint64_t a50,int a51,int a52)
{
  LOBYTE(STACK[0x4D7]) = (v52 & 0x20) == 0;
  if ((v52 & 0x20) != 0) {
    int v55 = 538847449;
  }
  else {
    int v55 = 538847446;
  }
  LODWORD(STACK[0x354]) = v55;
  if (a52 <= -691825431)
  {
    if (a52 > -1628044266)
    {
      if (a52 > -1257990305)
      {
        if (a52 > -776774181)
        {
          if (a52 != -776774180)
          {
            int v56 = -768028126;
            goto LABEL_47;
          }
        }
        else if (a52 != -1257990304)
        {
          int v56 = -1093575040;
          goto LABEL_47;
        }
        goto LABEL_44;
      }
      if (a52 == -1628044265 || a52 == -1276231227) {
        goto LABEL_48;
      }
      int v56 = -1263039325;
    }
    else
    {
      if (a52 <= -1746618422)
      {
        if (a52 == -2026375659) {
          goto LABEL_48;
        }
        if (a52 != -1905400730 && a52 != -1857064614) {
          goto LABEL_29;
        }
        goto LABEL_44;
      }
      if (a52 > -1634768128)
      {
        if (a52 == -1634768127) {
          goto LABEL_48;
        }
        int v56 = -1632651504;
      }
      else
      {
        if (a52 == -1746618421) {
          goto LABEL_48;
        }
        int v56 = -1743145802;
      }
    }
LABEL_47:
    if (a52 == v56) {
      goto LABEL_48;
    }
LABEL_29:
    sub_1A2DFEAF4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
      a49);
    return;
  }
  if (a52 <= -115977915)
  {
    if (a52 <= -518733242)
    {
      if (a52 == -691825430 || a52 == -644486429) {
        goto LABEL_48;
      }
      int v56 = -573539530;
    }
    else if (a52 > -257611402)
    {
      if (a52 == -257611401) {
        goto LABEL_48;
      }
      int v56 = -182879487;
    }
    else
    {
      if (a52 == -518733241) {
        goto LABEL_48;
      }
      int v56 = -257611408;
    }
    goto LABEL_47;
  }
  if (a52 > 1216129906)
  {
    if (a52 <= 1701841173)
    {
      if (a52 != 1216129907)
      {
        int v56 = 1514520008;
        goto LABEL_47;
      }
      goto LABEL_44;
    }
    if (a52 == 1701841174) {
      goto LABEL_48;
    }
    int v56 = 2004638276;
    goto LABEL_47;
  }
  if (a52 > -25502896)
  {
    if (a52 != -25502895)
    {
      int v56 = 328500259;
      goto LABEL_47;
    }
LABEL_44:
    *(_OWORD *)&STACK[0x1860] = xmmword_1A3032990;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 8 * (int)((((v53 + 1177535658) & 0xB9D032BE ^ 0x9B) * ((a49 & 0x20) == 0)) ^ (v53 + 1045))))(a1, a2, a3, a4, a5, a6, a7, a8);
    return;
  }
  if (a52 != -115977914)
  {
    int v56 = -61885076;
    goto LABEL_47;
  }
LABEL_48:
  *(_OWORD *)&STACK[0x1860] = xmmword_1A30329B0;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54
                                                                                                 + 8
                                                                                                 * (int)(((v53 - 2311) * ((a49 >> 5) & 1)) ^ (v53 + 208))))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1A2DFEE78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned int a17, uint64_t a18, unsigned int a19, uint64_t a20,unsigned int a21)
{
  unsigned int v27 = 366490169 * (&a17 ^ 0x16AE5644);
  a17 = v23 - ((2 * v23) & 0xC95D55D8) - 458315028 + v27;
  a18 = a13;
  a19 = v27 + 2977;
  (*(void (**)(unsigned int *))(v24 + 41200))(&a17);
  unsigned int v28 = ((&a17 + 22912828 - 2 * (&a17 & 0x15D9F3C)) ^ 0xC6DCFF75) * v26;
  a21 = ((2 * v22) & 0xDF7DFEEC) - v28 + (v22 ^ 0x6FBEFF76) - 621815044;
  a20 = a13;
  a19 = v28 + 2212;
  a18 = v21;
  uint64_t v29 = (*(uint64_t (**)(unsigned int *))(v24 + 41280))(&a17);
  return (*(uint64_t (**)(uint64_t))(v24 + 8 * ((((a17 != v25) << 7) | ((a17 != v25) << 8)) ^ 0x4ECu)))(v29);
}

uint64_t sub_1A2DFEFD0@<X0>(int a1@<W5>, int a2@<W8>)
{
  if ((v3 + 1301572320) <= 0x18 && ((1 << (v3 - 32)) & 0x1000581) != 0)
  {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFLL;
    if (v9)
    {
      if (v9 == 3)
      {
        int v10 = v6 + a1;
        int v11 = (*(uint64_t (**)())(v7 + 48 * a2 + 8))();
        __asm { BRAA            X8, X17 }
      }
      BOOL v12 = ((v13 - 2050534422) ^ 0xFDBEBDF77ABDBFFCLL)
          + ((v6 - 1430070160) & 0xC452D3FE ^ 0x2414208BBB6E3E7)
          + (((unint64_t)(v13 - 2050534422) << ((v6 ^ (v4 - 64))
                                                                   + 23)) & 0xF57B7FF8) == 913612809;
      __asm { BRAA            X2, X17 }
    }
    __asm { BRAA            X10, X17 }
  }
  return 4294925278;
}

uint64_t sub_1A2DFF1F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  BOOL v18 = a15 < 0x571FFD;
  if (v18 == (v16 - 1625635503) < 0x571FFD) {
    BOOL v18 = v16 - 1625635503 < a15;
  }
  return (*(uint64_t (**)(void))(v17 + 8 * ((!v18 * ((v15 ^ 0x861) - 134)) ^ v15)))();
}

uint64_t sub_1A2DFF26C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(uint64_t, void))(v10
                                                    + 8
                                                    * ((((((v7 & 0x18) == 0) ^ (a6 - 26)) & 1)
                                                      * (v6 + a2 + a6 + 1638 + 1159)) ^ a6)))(a1, (v8 - v9));
}

uint64_t sub_1A2DFF2A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v9 + 8 * (a8 | (v8 == a4))))();
}

uint64_t sub_1A2DFF2C4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v6 + 8 * (((v5 != a4) * ((a5 - 3680) ^ 0x3DB)) ^ a5)))(a1, a2, (a5 - 3652) | 0x311u);
}

uint64_t sub_1A2DFF2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,_DWORD **a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v37 = 2 * (v34 ^ 0xD2C494D6);
  int v38 = *a22;
  if (((unint64_t)*a22 & ((v34 ^ 0xD2C49439) - 969)) != (v37 ^ 0x646)
    || (int v39 = *(void **)(v35 + 8 * (v34 + 758868164)), *v39))
  {
    *a9 = 1877321064;
    JUMPOUT(0x1A2DF7DC8);
  }
  *int v39 = v38;
  **(_DWORD **)(v35 + 8 * (int)(v37 ^ 0x6FE)) = 255;
  *v38 |= ~v38[*v38 & 0x3ELL] << 16;
  v38[4] |= ~v38[v38[4] & (v37 - 1544)] << 16;
  v38[8] |= (v38[v38[8] & 0x3ELL] ^ (v37 - 1607)) << 16;
  v38[12] |= ~v38[v38[12] & 0x3ELL] << 16;
  v38[16] |= ~v38[v38[16] & 0x3ELL] << 16;
  v38[20] |= ~v38[v38[20] & 0x3ELL] << 16;
  v38[24] |= ~v38[v38[24] & 0x3ELL] << 16;
  v38[28] |= ~v38[v38[28] & 0x3ELL] << 16;
  v38[32] |= ~v38[v38[32] & 0x3ELL] << 16;
  v38[36] |= ~v38[v38[36] & 0x3ELL] << 16;
  v38[40] |= ~v38[v38[40] & 0x3ELL] << 16;
  v38[44] |= ~v38[v38[44] & 0x3ELL] << 16;
  v38[48] |= ~v38[v38[48] & 0x3ELL] << 16;
  v38[52] |= ~v38[v38[52] & 0x3ELL] << 16;
  v38[56] |= ~v38[v38[56] & 0x3ELL] << 16;
  v38[60] |= ~v38[v38[60] & 0x3ELL] << 16;
  *(_DWORD *)(v36 - 144) = v37 + 2998 - 1697562443 * ((v36 + 1190996108 - 2 * ((v36 - 144) & 0x46FD291C)) ^ 0x916D1198);
  *(void *)(v36 - 136) = *(void *)(v35 + 8 * (int)(v37 ^ 0x608)) - 4;
  (*(void (**)(uint64_t))(v33 + 8 * (int)(v37 ^ 0x15A3)))(v36 - 144);
  *(_DWORD *)(v36 - 144) = v37
                         + 2998
                         - 1697562443 * ((((v36 - 144) | 0xA1E73199) - ((v36 - 144) & 0xA1E73199)) ^ 0x7677091D);
  *(void *)(v36 - 136) = *(void *)(v35 + 8 * ((int)v37 - 1534)) - 4;
  uint64_t v40 = (*(uint64_t (**)(uint64_t))(a33 + 8 * (int)(v37 ^ 0x15A3)))(v36 - 144);
  return (*(uint64_t (**)(uint64_t))(a33 + 8 * (int)((3991 * (*(_DWORD *)(v36 - 140) == 0)) ^ v37)))(v40);
}

uint64_t sub_1A2DFF604(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((((a2 + a8 + a6 - 4044 - 624) < 0xFFFFFFF0) * ((a6 - 2947) ^ 0x6CA)) ^ a6)))();
}

uint64_t sub_1A2DFF644(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5 + 8 * ((1143 * ((v3 & 0x18) == ((a3 + 1109803651) | 0x11002AA) + v4)) ^ a3)))();
}

uint64_t sub_1A2DFF68C()
{
  return sub_1A2DFF6AC();
}

uint64_t sub_1A2DFF6AC()
{
  uint64_t v6 = (v2 ^ 0x1E5B ^ ((v2 - 3624) | v4) ^ 0x839BCB0CBCDADC90) + v3;
  int v7 = *(unsigned __int8 *)(v0 + v6) == *(unsigned __int8 *)(v1 + v6);
  return (*(uint64_t (**)(void))(v5 + 8 * (((8 * v7) | (v7 << 6)) ^ v2)))();
}

uint64_t sub_1A2DFF700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v10 = *(_DWORD *)(v8 + (a5 + v6 + (v5 ^ 0x1A54) - 2153) * (uint64_t)v7) == 1882836458;
  return (*(uint64_t (**)(void))(v9 + 8 * ((v10 | (2 * v10)) ^ v5)))();
}

uint64_t sub_1A2DFF744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned int a17, uint64_t a18, unsigned int a19, uint64_t a20,unsigned int a21)
{
  unsigned int v26 = 366490169
      * (((&a17 | 0xE449FA41) - &a17 + (&a17 & 0x1BB605B8)) ^ 0xF2E7AC05);
  a18 = a13;
  a19 = v26 + 2977;
  a17 = v24 - ((2 * v24) & 0xC95D55D8) - 458315028 + v26;
  (*(void (**)(unsigned int *))(v25 + 41200))(&a17);
  unsigned int v27 = (((&a17 | 0xB77E717E) - &a17 + (&a17 & 0x48818E80)) ^ 0x70FF1137)
      * v21;
  a19 = v27 + 2212;
  a18 = v22;
  a20 = a13;
  a21 = (v23 ^ 0x7BAEDAFA) - v27 + ((2 * v23) & 0xF75DB5F4) - 822083720;
  uint64_t v28 = (*(uint64_t (**)(unsigned int *))(v25 + 41280))(&a17);
  return (*(uint64_t (**)(uint64_t))(v25 + 8 * ((1449 * (a17 == 1877363113)) ^ 0x1DDu)))(v28);
}

void sub_1A2DFF8C4()
{
}

void sub_1A2DFF8CC()
{
  int *v1 = v0 | 0x15;
  JUMPOUT(0x1A2DF7DC8);
}

uint64_t sub_1A2DFF8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19, uint64_t a20,unsigned int a21,uint64_t a22,unsigned int a23)
{
  unsigned int v29 = 366490169 * ((&a19 & 0x502B296F | ~(&a19 | 0x502B296F)) ^ 0xB97A80D4);
  a19 = v25 - ((2 * v25) & 0xC95D55D8) - 458315028 + v29;
  a20 = a13;
  a21 = v29 + 2977;
  (*(void (**)(unsigned int *))(v26 + 41200))(&a19);
  unsigned int v30 = (((&a19 | 0x490047BD) - (&a19 & 0x490047BD)) ^ 0x8E8127F4) * v28;
  a23 = (v24 ^ 0x5BAEDF7F) - v30 + ((2 * v24) & 0xB75DBEFE) - 285213965;
  a20 = v23;
  a21 = v30 + 2212;
  a22 = a13;
  uint64_t v31 = (*(uint64_t (**)(unsigned int *))(v26 + 41280))(&a19);
  return (*(uint64_t (**)(uint64_t))(v26 + 8 * ((1002 * (a19 == v27)) ^ 0x8BAu)))(v31);
}

uint64_t sub_1A2DFFA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, _DWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, unsigned int a20)
{
  *a6 = 0;
  *a7 = 0;
  a20 = 31090337 * ((1505852218 - (&a19 | 0x59C17B3A) + (&a19 | 0xA63E84C5)) ^ 0x61BFE48C)
      + 1655392376;
  uint64_t v21 = (*(uint64_t (**)(int *))(v20 + 41128))(&a19);
  return (*(uint64_t (**)(uint64_t))(v20 + 8 * ((371 * (a19 != 1877363113)) ^ 0x671u)))(v21);
}

uint64_t sub_1A2DFFC54()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * (((((v2 - 187077055) & 0xB268DFC) + ((v2 - 2891) ^ 0x143A)) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A2DFFCA4@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  unsigned int v5 = v4 + v3 - 1030 + 359133840;
  BOOL v6 = v5 < 0x8DBA42A0;
  BOOL v7 = v2 - 1917173088 < v5;
  if (v2 > 0x7245BD5F != v6) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v7;
  }
  if (v8) {
    int v9 = a2;
  }
  else {
    int v9 = a2 + 1;
  }
  *(_DWORD *)(result + 8) = v9;
  return result;
}

uint64_t sub_1A2DFFD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8 * ((v7 - 1423) ^ (3906 * (v6 == v8)))))();
}

uint64_t sub_1A2DFFD94@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*v2 + 4 * (v6 + v5)) = *(_DWORD *)(*v3 + 4 * (v6 + v5));
  return (*(uint64_t (**)(void))(a1 + 8 * (((v6 - 1 != v1) * v7) | v4)))();
}

uint64_t sub_1A2DFFE34@<X0>(char a1@<W1>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  *(unsigned char *)(v5 + v4 + a2) = a1;
  return (*(uint64_t (**)(void))(v6 + 8 * (v3 ^ (8 * (v4 + 1 + a2 < (a3 ^ 0x60uLL))))))();
}

uint64_t sub_1A2DFFE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v10
                                                                      + 8
                                                                      * ((7476 * ((v9 & 0x18) == (a8 ^ a5) - v8 - 1076)) ^ a8)))(a1, a2, a3, (a2 - a3));
}

uint64_t sub_1A2DFFE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v9
                                                             + 8
                                                             * ((455
                                                               * ((v7 & 0x18) == ((1114 * (a7 ^ 0x12A8)) ^ 0xFFFFE6E6)
                                                                               + ((2 * a7) ^ 0x2D2A))) ^ a7)))(a1, a2, (v8 - a2));
}

void sub_1A2DFFEE8()
{
}

uint64_t sub_1A2DFFEF0()
{
  return sub_1A2DF4C88();
}

void sub_1A2DFFF3C(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v1 = 142545853 * (a1 ^ 0x2AFFAF6F);
  int v2 = *(_DWORD *)(a1 + 16) + v1;
  int v3 = *(_DWORD *)(a1 + 8) + v1;
  int v4 = *(_DWORD *)(a1 + 20) ^ v1;
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned int v6 = 1437274309 * ((((2 * v8) | 0x8DD65334) - v8 - 1189816730) ^ 0x64E554AF);
  int v9 = v6 ^ (v3 - 998774830);
  int v11 = v6 ^ (v2 + 3371);
  unsigned int v12 = v4 - 927048243 + v6;
  v8[0] = &STACK[0x3AE89F76A1641AA6];
  v8[1] = v5;
  int v13 = &STACK[0x31628349650E7801];
  uint64_t v7 = (uint64_t)*(&off_1EF5F46E0 + v2 - 1267);
  (*(void (**)(void *))(v7 + 8 * (v2 ^ 0x112D)))(v8);
  __asm { BRAA            X9, X17 }
}

void ImNUOAOCCj1zIAp6X14h(int a1)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E0010C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, int a14, char a15, char *a16, uint64_t a17, int a18, char a19, uint64_t a20,char *a21,char *a22,char *a23,uint64_t a24,unint64_t *a25)
{
  LODWORD(a22) = (v25 + 932) ^ (1401278017 * (&a21 ^ 0x42376E7));
  a21 = &a19;
  a25 = &STACK[0xCACAEBD78BF837C];
  a23 = a16;
  (*(void (**)(char **))(v27 + 8 * (v25 ^ 0x1115u)))(&a21);
  LODWORD(a22) = v25
               + 673918253
               * ((-729414076 - (&a21 | 0xD4860644) + (&a21 | 0x2B79F9BB)) ^ 0xB131E213)
               + 3092;
  a21 = &a12;
  a23 = a16;
  (*(void (**)(char **))(v27 + 8 * (v25 + 4427)))(&a21);
  HIDWORD(a21) = (v25 + 1686) ^ (((2 * (&a21 & 0x4B6D8C88) - &a21 - 1265470602) ^ 0x59BF5B8)
                               * v26);
  a22 = a16;
  a23 = &a15;
  (*(void (**)(char **))(v27 + 8 * (v25 + 4350)))(&a21);
  LODWORD(a23) = v25 - 476588053 * (&a21 ^ 0xBDFD0443) - 456;
  a22 = a16;
  uint64_t v29 = (*(uint64_t (**)(char **))(v27 + 8 * (v25 + 4402)))(&a21);
  return (*(uint64_t (**)(uint64_t))(v27
                                            + 8
                                            * (((a21 == v28)
                                              * (((v25 ^ 0x6B3) + 1158) ^ (2 * (v25 ^ 0x6B3)) ^ 0x9C2)) ^ v25)))(v29);
}

void OsjTR(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E00330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7 = *(void *)(STACK[0x6F8] + 24);
  STACK[0x590] = v7;
  return (*(uint64_t (**)(void))(a6 + 8 * (((v7 == 0) * (((v6 + 56) | 0x58C) - 3463)) | v6)))();
}

void sub_1A2E00370()
{
}

uint64_t sub_1A2E0037C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8 * ((2699 * ((v6 ^ 0xC4903E58 ^ LODWORD(STACK[0x40C])) > v6 - 633)) ^ v6)))();
}

void sub_1A2E003CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  int v14 = v9 - v13 - (((v8 + 2202) ^ 0x1A8FB0AC) & (2 * (v9 - v13) + 12891754)) + 766130471;
  int v15 = STACK[0x6B8];
  int v16 = v12 - v15 - ((2 * (v12 - v15) + 2061553262) & 0x791422E2) - 101025624;
  int v17 = (v14 ^ 0x72B8220D) + a5 - v13 - ((2 * ((v14 ^ 0x72B8220D) + a5 - v13) + 1015574602) & 0x3DF5F79E) + 490681332;
  unsigned int v18 = (v14 ^ (v11 - 100766683) ^ 0x8D47DDF2)
      - 2 * ((v14 ^ (v11 - 100766683) ^ 0x8D47DDF2) & 0xA4651DE ^ (v14 ^ (v11 - 100766683)) & 0xC)
      - 1975103022;
  int v19 = (v17 & 0x65163206 ^ 0x61040000) + (v17 & 0x65163206 ^ 0x4123206);
  int v20 = LODWORD(STACK[0x6C4])
      - v12
      - v19
      - 726077129
      + (~(2 * (LODWORD(STACK[0x6C4]) - v12 - v19 - 138285171)) | 0x4611FCAB)
      + 1;
  LODWORD(STACK[0x53C]) = ((LODWORD(STACK[0x404]) + (v16 ^ 0xACD0E8C7)) ^ 0xEFFBEFF9)
                        + 1579097088
                        + (STACK[0x3CC] & (2 * (LODWORD(STACK[0x404]) + (v16 ^ 0xACD0E8C7))));
  unsigned int v21 = ((2 * (v13 - 1912402035 + (v14 ^ 0x9D1D2444))) & 0x9FF3AD6A)
      + ((v13 - 1912402035 + (v14 ^ 0x9D1D2444)) ^ 0xCFF9D6B5);
  unsigned int v22 = v21 - ((2 * v21 - 1943912258) & 0xA6DEF650) + 427858823;
  unsigned int v23 = v18 ^ 0xDE38795B;
  unsigned int v24 = ((2 * (v15 - 1691636216 + (v16 ^ 0xACD0E8C7) + v19)) & 0xFFE9F1DE)
      + ((v15 - 1691636216 + (v16 ^ 0xACD0E8C7) + v19) ^ 0x7FF4F8EF);
  LODWORD(STACK[0x548]) = ((2 * (LODWORD(STACK[0x3E4]) + (v20 ^ 0x2308FE55))) & 0x89FF672E)
                        + ((LODWORD(STACK[0x3E4]) + (v20 ^ 0x2308FE55)) ^ 0x44FFB397)
                        - 69210257;
  int v25 = v18 & a8;
  unsigned int v26 = v25 ^ 0xB1C7EEF6;
  int v27 = v25 ^ LODWORD(STACK[0x3C8]);
  LODWORD(STACK[0x530]) = ((LODWORD(STACK[0x3E0]) + (v16 ^ v10 ^ 0x4C7B0CFB)) ^ 0x7FDFDB77)
                        - 151128114
                        + ((2 * (LODWORD(STACK[0x3E0]) + (v16 ^ v10 ^ 0x4C7B0CFB))) & 0xFFBFB6EE);
  unsigned int v28 = (v14 ^ 0x83E7DF8B ^ v17) - ((2 * (v14 ^ 0x83E7DF8B ^ v17) + 609772064) & 0xB06CBACC) + 1784843894;
  LODWORD(STACK[0x558]) = ((LODWORD(STACK[0x3DC]) + (v14 ^ 0x62E2DBBB)) ^ 0x74F1BD4F)
                        - 272633920
                        + ((2 * (LODWORD(STACK[0x3DC]) + (v14 ^ 0x62E2DBBB))) & 0xE9E37A9E);
  LODWORD(STACK[0x538]) = ((LODWORD(STACK[0x3D8]) + (v22 ^ 0xAC9084D7)) ^ 0xFFC4BEFB)
                        + 1002135542
                        + ((2 * (LODWORD(STACK[0x3D8]) + (v22 ^ 0xAC9084D7))) & 0xFF897DF6);
  int v29 = v17 ^ 0x4D9580E7 ^ v22;
  int v30 = v23 - v21 + v26 + v27 + v29 - 1981221172;
  LODWORD(STACK[0x6E0]) = ((2 * v30) & 0xBBDEAF6E) + (v30 ^ 0x5DEF57B7) - 1225212711;
  unsigned int v31 = ((v20 ^ (v24 - 2146760943) ^ 0xDCF701AA)
       + 846283028
       - ((2 * (v20 ^ (v24 - 2146760943) ^ 0xDCF701AA)) & 0x64E28228)) ^ 0x32714114;
  unsigned int v32 = (v16 ^ v10 ^ 0xB384F304) + 2146760943 - v24 + v31;
  LODWORD(STACK[0x6EC]) = ((2 * v32) & 0xFCEFBBFE) + (v32 ^ 0x7E77DDFF) - 1679217858;
  LODWORD(STACK[0x700]) = (((v28 ^ 0xB5E59396) + v29 + ((2 * v28) & 0xDBA79DE0 ^ 0x902498C0)) ^ LODWORD(STACK[0x3C4]))
                        + 2133579774
                        + (STACK[0x3C0] & (2 * ((v28 ^ 0xB5E59396) + v29 + ((2 * v28) & 0xDBA79DE0 ^ 0x902498C0))));
  LODWORD(STACK[0x6F0]) = ((v31 + (v16 ^ 0x7027E96D ^ v20)) ^ 0xF7FE67B8)
                        + 2144591832
                        + ((2 * (v31 + (v16 ^ 0x7027E96D ^ v20))) & 0xEFFCCF70);
  STACK[0x478] = STACK[0x470];
  JUMPOUT(0x1A2E009E8);
}

uint64_t sub_1A2E00C28(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  *(void *)(a6 + (v7 - v8 + 668)) = *(void *)(a2 + (v7 - v8 + 668));
  return (*(uint64_t (**)(void))(v9 + 8 * ((56 * (a7 + v8 == a4)) ^ a3)))();
}

void sub_1A2E00C5C()
{
}

uint64_t sub_1A2E00C68()
{
  *(void *)(v2 - 136) = &STACK[0x9A8DB97A07E9248];
  *(_DWORD *)(v2 - 128) = v0 + 673918253 * ((v2 - 136) ^ 0x9A481BA8) - 201;
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 ^ 0x1C13)))(v2 - 136);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((6650
                                              * (*(_DWORD *)(v2 - 124) == (((v0 ^ 0x5446E18C) - 1413932212) ^ 0x6FE64D77))) ^ v0)))(v3);
}

uint64_t sub_1A2E00D10(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 476588053 * ((2 * (a1 & 0x438627AE) - a1 + 1014618193) ^ 0x8184DC12);
  return (*((uint64_t (**)(void))*(&off_1EF5F46E0 + v1 - 906) + ((*(void *)(a1 + 8) == *(void *)a1) ^ v1)))();
}

void hwgAS7(uint64_t a1)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E00DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15, uint64_t a16, char *a17)
{
  a16 = a9;
  a17 = &a11;
  a15 = (v19 + 1993) ^ (((((2 * &a14) | 0x476E827C) - &a14 - 599212350) ^ 0x92BEC7F0) * v20);
  (*(void (**)(int *))(v17 + 8 * (v19 ^ 0x1257)))(&a14);
  a16 = a9;
  LODWORD(a17) = v19
               - 476588053
               * (((&a14 | 0x41493FC0) - &a14 + (&a14 & 0xBEB6C038)) ^ 0xFCB43B83)
               - 149;
  uint64_t v21 = (*(uint64_t (**)(int *))(v17 + 8 * (v19 ^ 0x159B)))(&a14);
  return (*(uint64_t (**)(uint64_t))(v17 + 8 * ((4132 * (a14 == (v19 ^ 0xC03) + v18)) ^ v19)))(v21);
}

uint64_t sub_1A2E00ED8()
{
  *(_DWORD *)(*v2 + 4 * (v0 + v4 - 1)) = v1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v0 + v4 - 2 >= 0) * ((v3 - 3540) ^ 0x1EA)) ^ v3)))();
}

uint64_t sub_1A2E00F18@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  int v6 = v2 + v5;
  int v7 = ((v4 + 1295) ^ 0xC83) + v2;
  *(_DWORD *)(*(void *)(v3 - 0x5762211BC84F9B34) + 4 * v6) = a1;
  *(_DWORD *)(v3 - 0x5762211BC84F9B38) = v7;
  int v8 = ((v4 + 1295) ^ 0xBF0223B4) + v7;
  if (v8 < 0) {
    int v8 = -v8;
  }
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((((int)((v8 ^ 0x63FDFEEB) + ((2 * v8) & 0xC7FBFDD6) - 1677590252) > ((((v4 + 1295) ^ 8) - 1551215828) & 0x5C75ACCB) - 3203)
                                * (((((v4 + 1295) ^ 8) - 3210) | 0x816) ^ 0x1643)) ^ (v4 + 1295) ^ 8)))();
}

uint64_t sub_1A2E01018@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 119) = *(unsigned char *)(v1 + 103);
  *(unsigned char *)(a1 + 118) = *(unsigned char *)(v1 + 102);
  *(unsigned char *)(a1 + 117) = *(unsigned char *)(v1 + 101);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(v1 + 100);
  *(unsigned char *)(a1 + 115) = *(unsigned char *)(v1 + 99);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(v1 + 98);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(v1 + 97);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(v1 + 96);
  *(unsigned char *)(a1 + 111) = *(unsigned char *)(v1 + 95);
  *(unsigned char *)(a1 + 110) = *(unsigned char *)(v1 + 94);
  *(unsigned char *)(a1 + 109) = *(unsigned char *)(v1 + 93);
  *(unsigned char *)(a1 + 108) = *(unsigned char *)(v1 + 92);
  *(unsigned char *)(a1 + 107) = *(unsigned char *)(v1 + 91);
  *(unsigned char *)(a1 + 106) = *(unsigned char *)(v1 + 90);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(v1 + 89);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(v1 + 88);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(v1 + 4);
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * (((*(_DWORD *)(v1 + 4) == v2 + 956785173) * (v2 - 2457)) | v2)))();
}

uint64_t sub_1A2E010E4(uint64_t a1, __n128 a2)
{
  a2.n128_u16[0] = -31869;
  a2.n128_u8[2] = -125;
  a2.n128_u8[3] = -125;
  a2.n128_u8[4] = -125;
  a2.n128_u8[5] = -125;
  a2.n128_u8[6] = -125;
  a2.n128_u8[7] = -125;
  return sub_1A2E0110C(a1, a1 - 7, a2);
}

uint64_t sub_1A2E0110C(int8x8_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7)
{
  *(int8x8_t *)(a3 + (v8 + v7 - v9)) = veor_s8(*(int8x8_t *)(v10 + (v8 + v7 - v9)), a1);
  return (*(uint64_t (**)(void))(v11 + 8 * (((v9 + a6 - 2865 == a4) * a7) ^ a5)))();
}

uint64_t sub_1A2E01144(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (int)((((a4 ^ 0x91F1D3BE) + 1846422672) * ((v5 + v4 - 2132278090) < 8)) ^ a4)))();
}

uint64_t sub_1A2E011B4@<X0>(int a1@<W8>, uint64_t a2)
{
  STACK[0x2C8] = v2;
  unsigned int v5 = (a1 + 1620497709) & 0x9F69277F;
  *(_DWORD *)(v3 - 192) = (v5 - 2019207886) ^ (1314530549 * ((v3 - 192) ^ 0xB10986CE));
  (*(void (**)(uint64_t))(v4 + 8 * (int)(v5 ^ 0x1202)))(v3 - 192);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(STACK[0x2D8] + 8 * (int)(v5 + 3503)))(336, 1777295586);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x2D8] + 8 * (int)(((v6 == 0) * (v5 + 728 + (v5 ^ 0x1C9) - 4129)) ^ v5)))(v6, v7, v8, v9, v10, v11, v12, v13, a2);
}

void sub_1A2E01290()
{
}

uint64_t sub_1A2E012B0()
{
  int v3 = STACK[0x2D4];
  LODWORD(STACK[0x560]) = v1;
  return (*(uint64_t (**)(void))(v2 + 8 * (v3 - 2187)))();
}

void sub_1A2E012D0(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)*(&off_1EF5F46E0
                  + ((-43 * ((qword_1E95A4840 + dword_1E95A4550) ^ 0xD4)) ^ byte_1A30290A0[byte_1A3023090[(-43 * ((qword_1E95A4840 + dword_1E95A4550) ^ 0xD4))] ^ 0xDD])
                  + 100);
  uint64_t v3 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * ((qword_1E95A4840 - *v2) ^ 0xD4)) ^ byte_1A302D080[byte_1A3028FA0[(-43 * ((qword_1E95A4840 - *v2) ^ 0xD4))] ^ 0x4E])
                + 14);
  uint64_t v4 = *v2 - (void)&v8 + *(void *)(v3 - 4);
  uint64_t v5 = 1946842069 * v4 + 0x311DF6E51EDE312CLL;
  unint64_t v6 = 1946842069 * (v4 ^ 0xCEE2091AE121CED4);
  *uint64_t v2 = v5;
  *(void *)(v3 - 4) = v6;
  LODWORD(v3) = *(_DWORD *)v2;
  LOBYTE(v2) = -43 * ((v6 + *(_DWORD *)v2) ^ 0xD4);
  uint64_t v7 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * (dword_1E95A4550 ^ 0xD4 ^ qword_1E95A4840)) ^ byte_1A30290A0[byte_1A3023090[(-43 * (dword_1E95A4550 ^ 0xD4 ^ qword_1E95A4840))] ^ 0xDD])
                + 113);
  (*(void (**)(void, uint64_t (*)()))(v7
                                                + 8
                                                * ((*((unsigned char *)off_1EF5F47E0
                                                                                   + (*((unsigned __int8 *)off_1EF5F48A0
                                                                                      + v2) ^ 0x49u)
                                                                                   - 12) ^ v2)
                                                 + 4928)))(*(&off_1EF5F46E0+ ((-43 * ((v6 - v3) ^ 0xD4)) ^ *((unsigned char *)off_1EF5F47E0+ (*((unsigned __int8 *)off_1EF5F48A0+ (-43 * ((v6 - v3) ^ 0xD4))) ^ 0x49u)- 12))- 177), sub_1A2D41DCC);
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1A2E014A4(_DWORD *a1)
{
  unsigned int v1 = 142545853 * ((-2 - ((a1 | 0x88D5AA22) + (~a1 | 0x772A55DD))) ^ 0x5DD5FAB2);
  return (*((uint64_t (**)(void))*(&off_1EF5F46E0 + (int)((a1[4] ^ v1) - 2348))
          + (int)(((*a1 + v1 - 1877363114 < 0x63) * ((((a1[4] ^ v1) + 1321077335) & 0xB141ED87) - 362)) ^ a1[4] ^ v1)))();
}

uint64_t sub_1A2E01548(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((((v4 == a4) ^ (v5 - 4)) & 1) * (v5 - 3397)) | v5)))();
}

uint64_t sub_1A2E01574(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (((((a5 ^ (v5 + 736)) - v5) ^ 0xDAE) * (v6 == a4)) ^ a5)))();
}

uint64_t sub_1A2E015A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 8 * (v6 + 518)))(64, 3984933173);
  unint64_t v8 = STACK[0x2A8];
  STACK[0x620] = v7;
  return (*(uint64_t (**)(void))(v8 + 8 * (((v7 == 0) * ((v6 ^ 0xB4) - 4768)) ^ v6)))();
}

uint64_t sub_1A2E015F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  BOOL v8 = v6 >= ((a5 - 1619701540) & 0xA6FFE9FA) + v5 - 1788;
  return (*(uint64_t (**)(uint64_t, void))(v7 + 8 * (((2 * v8) | (8 * v8)) ^ a5)))(a1, 0);
}

void sub_1A2E01638(_DWORD *a1)
{
  unsigned int v1 = *a1
     + 1697562443 * (((a1 | 0x177EF40C) - a1 + (a1 & 0xE8810BF3)) ^ 0xC0EECC88);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1A2E016E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, int a18, unsigned int a19)
{
  a17 = &STACK[0x370A1A23408CA16];
  a19 = 2800
      - ((((&a17 | 0x69F3772A) ^ 0xFFFFFFFE) - (~&a17 | 0x960C88D5)) ^ 0x518DE89C) * v20;
  uint64_t v22 = (*(uint64_t (**)(unint64_t **))(v21 + 40952))(&a17);
  return (*(uint64_t (**)(uint64_t))(v21 + 8 * ((2020 * (a18 != v19)) ^ 0xBE6u)))(v22);
}

void sub_1A2E0177C()
{
}

void Mt76Vq80ux(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a5) {
    BOOL v6 = a6 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1A2E01870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,uint64_t a23,int a24,uint64_t a25,unsigned int a26)
{
  unsigned int v31 = ((2 * (&a22 & 0xB961CF0) - &a22 - 194387185) ^ 0x33E88346) * v30;
  a23 = v28;
  a26 = (v29 ^ 0xDAFFFEF6) - v31 + 1873730428 + ((v27 ^ 0xB5FFF3AA) & (2 * v29));
  a25 = a16;
  a24 = v31 + v27 - 1443;
  uint64_t v32 = (*(uint64_t (**)(int *))(v26 + 8 * (v27 ^ 0x1A6F)))(&a22);
  return (*(uint64_t (**)(uint64_t))(a15 + 8 * ((199 * (a22 == 1877363113)) ^ v27)))(v32);
}

uint64_t sub_1A2E01940@<X0>(unsigned int a1@<W0>, int a2@<W1>, uint64_t a3@<X2>, unsigned int a4@<W3>, int a5@<W4>, unsigned int a6@<W5>, int a7@<W6>, uint64_t a8@<X7>, int a9@<W8>)
{
  BOOL v14 = a4 < a1;
  char v15 = *(unsigned char *)(a8 + ((a9 + a5) & a6) + a2 + v9);
  *(unsigned char *)(a3 + (v10 + v12)) = v15 - 2 * (v15 & 3) - 125;
  unsigned int v16 = v9 + 1 + v11;
  int v17 = v14 ^ (v16 < a1);
  BOOL v18 = v16 < a4;
  if (!v17) {
    BOOL v14 = v18;
  }
  return (*(uint64_t (**)(void))(v13 + 8 * ((!v14 * a7) ^ a9)))();
}

uint64_t sub_1A2E019B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  a15 = v17 - (((&a13 | 0x32CF4185) + (~&a13 | 0xCD30BE7A)) ^ 0xF54E21CD) * v16 + 1488;
  a13 = &STACK[0x370A1A23408C9FE];
  uint64_t v19 = (*(uint64_t (**)(unint64_t **))(v15 + 8 * (v17 ^ 0x16DF)))(&a13);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * (((a14 == v18) * (((v17 - 6301873) & 0x678A57D6) - 1737113024)) ^ v17)))(v19);
}

uint64_t sub_1A2E01A5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = (*(uint64_t (**)(void, void, void))(v4 + 8 * (v2 ^ 0x1B46)))(**(unsigned int **)(a1 + 8 * (v2 ^ 0xFB3)), *v3, *(_DWORD *)(v5 - 0x5571DF7BBE96A385) + ((4 * v2) ^ 0x334C ^ v1));
  return sub_1A2E01AA8(v6);
}

void sub_1A2E01AA8()
{
}

uint64_t sub_1A2E01B50(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  BOOL v73 = a3 == a3 + LODWORD(STACK[0x2D4]) - 2214 - 169;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v72
                                                     + 8 * (((8 * v73) | (32 * v73)) ^ (LODWORD(STACK[0x2D4]) + 861))))(a72, a49);
}

uint64_t sub_1A2E01BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,int a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t v69 = STACK[0x4C8];
  STACK[0x4F0] = *(void *)(v68 + 8 * (LODWORD(STACK[0x2D4]) - 2295));
  STACK[0x570] = v69;
  LODWORD(STACK[0x57C]) = 429018383;
  int v66 = *(_DWORD *)(v69 - 0x14E110F44ADD9A87);
  STACK[0x308] = a66;
  return (*(uint64_t (**)(uint64_t))(v68
                                            + 8
                                            * ((4324
                                              * (((((a60 & 0x8ACA3FF) - 504247514) & 0x1E0E3E7B ^ ((a60 & 0x8ACA3FF ^ 0x977)
                                                                                                 + 109)) & (2 * v66) ^ 0x60)
                                               + (v66 & 0x3F ^ 0x3F9E9FCBu)
                                               - 1067360294 < 0xFFFFFFC0)) ^ a60 & 0x8ACA3FF)))(1067360249);
}

void sub_1A2E01BDC()
{
}

uint64_t sub_1A2E01BE4@<X0>(uint64_t a1@<X5>, int a2@<W6>, unsigned int a3@<W8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((43
                                * (*(unsigned __int8 *)(v4 + (v3 - 1 + a2)) == (((a3 ^ 0x6D) + 63) ^ 0x7F))) | a3)))();
}

uint64_t sub_1A2E01C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((((STACK[0x240] & 0x4DA29E3F) + 2615) * (v7 == a6)) ^ (v6 - 2353))))();
}

uint64_t sub_1A2E01C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  if (v13) {
    BOOL v16 = a13 == ((v14 + 1228290263) & 0xCBA5 ^ 0xFFFFF1C0) + v14 - 333;
  }
  else {
    BOOL v16 = 0;
  }
  int v17 = !v16;
  return (*(uint64_t (**)(void))(v15 + 8 * ((41 * v17) ^ (v14 + 2251))))();
}

uint64_t sub_1A2E01CAC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  *(void *)(a6 + v7) = *(void *)(v8 + v7);
  return (*(uint64_t (**)(void))(v10 + 8 * (((a5 != v9) * v6) ^ a4)))();
}

uint64_t sub_1A2E01CDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + (v3 + v2)) = *(unsigned char *)(a2 + (v3 + v2));
  return (*(uint64_t (**)(void))(v7 + 8 * ((232 * (v3 - 1 != v5)) ^ (v6 + v4 + 1868))))();
}

uint64_t sub_1A2E01D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, __int16 a14, char a15, __int16 a16, char a17, uint64_t a18, char a19, uint64_t a20,unsigned int a21)
{
  *(unsigned char *)uint64_t v21 = a15;
  *(_DWORD *)(v21 + 4) = a9;
  *(unsigned char *)(v21 + 8) = a17;
  *(_WORD *)(v21 + 10) = a13;
  a21 = (v23 ^ 0x17FD)
      + 366490169 * (((~&a19 & 0x261B1F9E) - (~&a19 | 0x261B1F9F)) ^ 0x30B549DB)
      - 460;
  a20 = a10;
  (*(void (**)(char *))(v22 + 8 * (v23 ^ 0x12D6)))(&a19);
  return sub_1A2D3CD84();
}

uint64_t sub_1A2E01E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (((v6 == (v5 + 99)) * a5) ^ v5)))();
}

void sub_1A2E01E38()
{
}

uint64_t sub_1A2E01E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, unsigned int a20,int a21,uint64_t a22)
{
  a19 = 101 - -11 * ((((2 * &a19) | 0x44) - &a19 + 94) ^ 0x6C);
  a22 = v25;
  a20 = (v22 + 1277) ^ (1314530549
                      * ((((2 * &a19) | 0x65D49D44) - &a19 + 1293267294) ^ 0x3E3C86C));
  uint64_t v26 = (*(uint64_t (**)(char *))(v23 + 8 * (v22 + 4105)))(&a19);
  return (*(uint64_t (**)(uint64_t))(v23
                                            + 8
                                            * (((a21 == (((v22 - 1173) | 0x14C) ^ (v24 - 196)))
                                              * (((v22 - 1164) | 0xC14) - 3052)) ^ v22)))(v26);
}

uint64_t sub_1A2E01F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned int a13, uint64_t a14, unsigned int a15, uint64_t a16, unsigned int a17)
{
  unsigned int v23 = 366490169 * (((&a13 | 0x555B2650) - (&a13 & 0x555B2650)) ^ 0x43F57014);
  a14 = a10;
  a15 = v23 + 2977;
  a13 = v21 + ~((2 * v21) & 0xC95D55D8) - 458315027 + v23;
  (*(void (**)(unsigned int *))(v22 + 41200))(&a13);
  unsigned int v24 = 31090337 * ((&a13 & 0xB3E3105C | ~(&a13 | 0xB3E3105C)) ^ 0x8B9D8FEA);
  a15 = v24 + 2212;
  a17 = (v20 ^ 0xCBEFDF7F) + ((2 * v20) & 0x97DFBEFE) - v24 + 2126445299;
  a14 = v19;
  a16 = a10;
  (*(void (**)(unsigned int *))(v22 + 41280))(&a13);
  unsigned int v25 = 31090337
      * (((&a13 | 0x6A5E16C) - &a13 + (&a13 & 0xF95A1E90)) ^ 0xC1248125);
  a17 = (v18 ^ 0x4FEEFBF7) + ((2 * v18) & 0x9FDDF7EE) - v25 - 88088965;
  a16 = a10;
  a15 = v25 + 2212;
  a14 = v17;
  uint64_t v26 = (*(uint64_t (**)(unsigned int *))(v22 + 41280))(&a13);
  return (*(uint64_t (**)(uint64_t))(v22 + 8 * (((a13 == 1877363113) | (2 * (a13 == 1877363113))) ^ 0x7DCu)))(v26);
}

uint64_t sub_1A2E0211C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, uint64_t a16, unsigned int a17, int a18, uint64_t a19, unsigned int a20)
{
  unsigned int v24 = 366490169 * ((&a15 & 0x2CBCA379 | ~(&a15 | 0x2CBCA379)) ^ 0xC5ED0AC2);
  a16 = a13;
  a15 = a10 - ((2 * a10) & 0xC95D55D8) - 458315028 + v24;
  a17 = v24 + 2977;
  (*(void (**)(unsigned int *))(v23 + 41200))(&a15);
  unsigned int v25 = 31090337 * ((-1001676757 - (&a15 | 0xC44BA02B) + (&a15 | 0x3BB45FD4)) ^ 0xFC353F9D);
  a19 = a13;
  a20 = (v22 ^ 0x5ABEDAF6) - v25 + ((2 * v22) & 0xB57DB5EC) - 269484164;
  a16 = v21;
  a17 = v25 + 2212;
  (*(void (**)(unsigned int *))(v23 + 41280))(&a15);
  unsigned int v26 = 31090337 * ((&a15 & 0x818F2F51 | ~(&a15 | 0x818F2F51)) ^ 0xB9F1B0E7);
  a16 = 0;
  a17 = v26 + 2212;
  a20 = 1252973170 - v26;
  a19 = a13;
  (*(void (**)(unsigned int *))(v23 + 41280))(&a15);
  unsigned int v27 = 366490169 * (((&a15 | 0x75D52187) - (&a15 & 0x75D52187)) ^ 0x637B77C3);
  a15 = v20 - ((2 * v20) & 0xC95D55D8) - 458315028 + v27;
  a17 = v27 + 2977;
  a16 = a13;
  uint64_t v28 = (*(uint64_t (**)(unsigned int *))(v23 + 41200))(&a15);
  return (*(uint64_t (**)(uint64_t))(v23 + 8 * ((5090 * (a18 == 1877363113)) ^ 0x37Bu)))(v28);
}

void sub_1A2E02388()
{
}

void sub_1A2E02390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  STACK[0x418] = *(void *)(a6 + 8 * (v6 - 2432));
  JUMPOUT(0x1A2E023ACLL);
}

void sub_1A2E0245C()
{
}

uint64_t sub_1A2E025C0()
{
  return 4294925278;
}

uint64_t sub_1A2E025C8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((a1 - 2139411319 < (v1 ^ 0x4DDu) + 2147483144) * (v1 + 2470)) ^ v1)))();
}

uint64_t sub_1A2E02614()
{
  int v5 = 31090337 * ((v4 + 473883657 - 2 * ((v4 - 120) & 0x1C3EE481)) ^ 0xDBBF84C8);
  *(_DWORD *)(v4 - 120) = v0 + ((v2 - 129) ^ 0xD7F7E4DC) + v5;
  *(void *)(v4 - 112) = v3;
  *(_DWORD *)(v4 - 104) = (v2 + 1485) ^ v5;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v2 + 2347)))(v4 - 120);
  return sub_1A2E02690(v6);
}

uint64_t sub_1A2E02690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  *(void *)(v24 - 120) = a20;
  *(void *)(v24 - 104) = a22;
  *(_DWORD *)(v24 - 108) = (v23 + 1523) ^ (366490169
                                         * ((((v24 - 120) ^ 0xD80D622B | 0x28286B7B)
                                           - ((v24 - 120) ^ 0xD80D622B)
                                           + (((v24 - 120) ^ 0xD80D622B) & 0xD7D79480)) ^ 0xE68B5F14));
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(v22 + 8 * (v23 ^ 0x1EF5)))(v24 - 120);
  return (*(uint64_t (**)(uint64_t))(v22
                                            + 8
                                            * (((*(_DWORD *)(v24 - 112) == ((v23 + 55063871) & 0xFCB7C33A) + 1824481438)
                                              * ((v23 + 75) ^ 0xAF8)) ^ v23)))(v25);
}

void Mib5yocT(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v12 = !v8 && a6 != 0 && a7 != 0 && a8 != 0;
  __asm { BRAA            X9, X17 }
}

void sub_1A2E027EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x2C8] = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8 * a67))(a69, 2965982036);
  *unsigned int v70 = (*(uint64_t (**)(void))(STACK[0x2D8] + 8 * (v69 + 2788)))();
  JUMPOUT(0x1A2E02858);
}

uint64_t sub_1A2E02890@<X0>(void *a1@<X1>, int a2@<W2>, unsigned int a3@<W7>, unint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  unint64_t v35 = ((v25 + v30) & v31 ^ (v23 - 1311) ^ *(_DWORD *)(a23 + 4 * (v34 + 1 + v27)))
      + HIDWORD(a4)
      + v26 * (unint64_t)(*(_DWORD *)(*a1 + 4 * (v34 + 1 + v27)) ^ v23);
  *(_DWORD *)(a23 + 4 * (v34 + v27)) = v35 + v23 - (v24 & (2 * v35));
  if (a3 > v28 != v34 + v32 < v33) {
    BOOL v36 = a3 > v28;
  }
  else {
    BOOL v36 = v34 + v32 < a2;
  }
  return (*(uint64_t (**)(void))(v29 + 8 * (v25 | (16 * !v36))))();
}

uint64_t sub_1A2E02920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v16 = 1697562443 * ((~((v15 - 136) | 0x966E0915) + ((v15 - 136) & 0x966E0915)) ^ 0xBE01CE6E);
  *(_DWORD *)(v15 - 112) = v16 + 1420518076;
  *(void *)(v14 + 16) = a12;
  *(_DWORD *)(v15 - 136) = 626369722 - v16;
  *(_DWORD *)(v15 - 128) = v12 - v16 - 232;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v13 + 8 * (v12 ^ 0x16FD)))(v15 - 136);
  return (*(uint64_t (**)(uint64_t))(v13
                                            + 8
                                            * ((4599
                                              * (*(_DWORD *)(v15 - 132) == (((v12 + 671141193) | 0x6C80DA0) ^ 0x412E9409))) ^ v12)))(v17);
}

uint64_t sub_1A2E029F0@<X0>(uint64_t a1@<X2>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,unsigned int a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  unsigned int v50 = v49[396] ^ ((*v49 & 0x7FFFFFFE | ((a3 + 988430334) ^ 0xBAEA49F9) & v49[623]) >> 1);
  v49[623] = (v50 + v47 - (a2 & (2 * v50))) ^ *((_DWORD *)&a47 + (*v49 & ((a3 + 988430334) ^ (v48 - 1))));
  return (*(uint64_t (**)(void))(a1 + 8 * ((6473 * (a32 > 0x26F)) ^ a3)))();
}

void sub_1A2E02A74(int a1@<W1>, int a2@<W6>, uint64_t a3@<X8>)
{
  *(_DWORD *)(v6 - 140) = v4;
  unsigned int v8 = v4 & 0xFFFFFFF8;
  *(void *)(v6 - 120) = v3 - 7;
  *(void *)(v6 - 128) = a3 - 7;
  *(_DWORD *)(v6 - 152) = v8;
  *(_DWORD *)(v6 - 132) = -v8;
  *(_DWORD *)(v6 - 136) = a1 + v7 + v5 + 1027;
  *(_DWORD *)(v6 - 160) = (a2 + 3651910) & 0xFFC847BF;
  JUMPOUT(0x1A2E02AF4);
}

uint64_t sub_1A2E02BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, int a18, uint64_t a19, int a20,int a21,int a22)
{
  int v25 = 1314530549 * ((&a17 + 1138074477 - 2 * ((unint64_t)&a17 & 0x43D5A36D)) ^ 0xF2DC25A3);
  a17 = &STACK[0x67CF598A0A88739];
  a20 = 161736899 - v25;
  a22 = v25 ^ 0x13F055B8;
  a18 = (v22 + 1780979691) ^ v25;
  a19 = a13;
  uint64_t v26 = (*(uint64_t (**)(unint64_t **))(v23 + 8 * (v22 ^ 0x169C)))(&a17);
  return (*(uint64_t (**)(uint64_t))(v23
                                            + 8
                                            * ((4002
                                              * (a21 == (((v22 ^ 0x442) + 710) ^ (v24 - 2418)) + 5 * (v22 ^ 0x442))) ^ v22)))(v26);
}

void sub_1A2E02CE0()
{
}

uint64_t sub_1A2E02E6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,char a43)
{
  *(unsigned char *)(a5 + (a9 + a2)) = *(&a43 + a36 - 1297750892);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 8 * ((194 * ((((v43 - 132) | 0x46) ^ a4) + a3 + a9 < 0x40)) ^ ((v43 - 132) | 0x46))))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A2E02ED0@<X0>(unsigned int a1@<W2>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(a2 + 8 * (((*(_DWORD *)(*v4 + 4 * a1) == v2) * (v3 ^ 0x13E9)) ^ v3)))();
}

void sub_1A2E02F00()
{
}

uint64_t sub_1A2E03064@<X0>(int a1@<W5>, int a2@<W8>)
{
  LODWORD(STACK[0x314]) = a1;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((5938
                                * (*(_DWORD *)(STACK[0x210] + 360) - 538847446 < ((a2 + 901690817) & 0xCA414B7F ^ 0xFFFFF6C1))) ^ a2)))();
}

uint64_t sub_1A2E030C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8 * (((5 * (v7 ^ 0x9B8) - 113) * (v6 != 1877321061)) ^ (v7 - 1375))))();
}

uint64_t sub_1A2E03108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8 * ((2241 * (v6 == v7 + 1877360663)) ^ (v7 - 716))))();
}

uint64_t sub_1A2E03140()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((v2 + 474457974) ^ (45 * (v0 == 0)))))();
}

uint64_t sub_1A2E03170(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((((37 * (v5 ^ 0x5DB)) ^ 0xE1D) + 1841) * (v4 == a4)) ^ v5)))();
}

uint64_t sub_1A2E031AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unsigned char *a22)
{
  int v24 = *(unsigned char **)(a19 + 96);
  v24[1167] = a22[19];
  v24[1166] = a22[18];
  v24[1165] = a22[17];
  v24[1164] = a22[16];
  v24[1163] = a22[15];
  v24[1162] = a22[14];
  v24[1161] = a22[13];
  v24[1160] = a22[12];
  v24[1159] = a22[11];
  v24[1158] = a22[10];
  v24[1157] = a22[9];
  v24[1156] = a22[8];
  v24[1155] = a22[7];
  v24[1154] = a22[6];
  v24[1153] = a22[5];
  v24[1152] = a22[4];
  v24[1151] = a22[3];
  v24[1150] = a22[2];
  v24[1149] = a22[1];
  v24[1148] = *a22;
  return (*(uint64_t (**)(void))(v23
                                           + 8
                                           * ((97
                                             * (*(_DWORD *)(a19 + 72) == ((319 * (v22 ^ 0x254) - a8 - 53103975) & 0x67531FB3 ^ 0x7A38BC13))) ^ (319 * (v22 ^ 0x254)))))(a12);
}

uint64_t sub_1A2E032E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v9 = STACK[0x558];
  int v10 = 1761959447 * ((2 * ((v8 - 224) & 0x65142BC0) - (v8 - 224) + 451662910) ^ 0xBB4C15FA);
  *(_DWORD *)(v8 - 224) = (LODWORD(STACK[0x664]) ^ 0xAB7BC6A2 ^ (((v6 - 238) | 0x20) + 1638))
                        - v10
                        + ((2 * LODWORD(STACK[0x664])) & 0xDFD7F9D4 ^ 0x89007980)
                        - 1258854408;
  *(_DWORD *)(v8 - 204) = v10 + v6 + 1950;
  *(void *)(v8 - 216) = v9;
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(a6 + 8 * (v6 + 4998)))(v8 - 224);
  return (*(uint64_t (**)(uint64_t))(STACK[0x2A8] + 8 * ((2277 * (*(_DWORD *)(v8 - 208) == v7)) ^ v6)))(v11);
}

uint64_t sub_1A2E033CC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43)
{
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * ((14 * (a1 != LODWORD(STACK[0xA74]))) ^ (a43 - 1087))))();
}

uint64_t sub_1A2E03410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6
                              + 8
                              * ((((4 * ((v6 - 140710325) & 0x8631B67)) ^ 0x4D1A) * (STACK[0x830] != 0)) ^ (v6 - 140710325) & 0x8631B67)))();
}

uint64_t sub_1A2E03468(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v4
                                                    + 8
                                                    * ((224
                                                      * (((v2 == v3) ^ (((a2 + 78) | 1) - 108)) & 1)) ^ ((a2 + 1358) | 1))))(a1, ((a2 + 1358) | 1) ^ 0x15B2u);
}

uint64_t sub_1A2E034A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, char a13, int a14, unsigned int a15, uint64_t a16, char *a17)
{
  a15 = (v19 + 1804) ^ ((((&a14 | 0xD3628EFF) - (&a14 & 0xD3628EFF)) ^ 0x626B0831) * v20);
  a16 = a11;
  a17 = &a13;
  (*(void (**)(int *))(v17 + 8 * (v19 ^ 0x1194)))(&a14);
  LODWORD(a17) = v19
               - 476588053
               * ((((&a14 ^ 0x8045020A | 0x3728FDC4) ^ 0xFFFFFFFE)
                 - (&a14 ^ 0x24283C04 | 0xC8D7023B)) ^ 0xE66FC5B2)
               - 338;
  a16 = a11;
  uint64_t v21 = (*(uint64_t (**)(int *))(v17 + 8 * (v19 ^ 0x1658)))(&a14);
  return (*(uint64_t (**)(uint64_t))(v17 + 8 * (((a14 == v18) * (v19 + 788)) ^ v19)))(v21);
}

uint64_t sub_1A2E035A4()
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((((((v1 + 1853) ^ 0xF21) + 1624) ^ 0x87B) * ((v0 & 0x18) == 0)) ^ (v1 + 1853))))();
}

void sub_1A2E035DC(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X10, X17 }
}

void sub_1A2E03624()
{
  STACK[0x2C0] = v2;
  *(_DWORD *)(STACK[0x590] + ((((LODWORD(STACK[0x268]) | 0x80) ^ (v0 + 121)) + LODWORD(STACK[0x2E4])) & 0xFFFFFFFC)) = v1;
  JUMPOUT(0x1A2D6564CLL);
}

void sub_1A2E0365C()
{
}

uint64_t sub_1A2E03668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,int a29,int a30,unint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,unsigned int a53,uint64_t a54,unsigned __int8 a55)
{
  return sub_1A2DA0054(a1, a2, 2663621972, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a55);
}

void sub_1A2E03674()
{
}

void sub_1A2E036FC()
{
}

uint64_t sub_1A2E03708@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  uint64_t v4 = (a2 + 122) | 0xC08u;
  *(unsigned char *)(STACK[0x330] + (v4 ^ 0xFFFFFFFFC782A5A5) + v3) = 0;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)((291 * (v3 + v2 + ((v4 + 1181) ^ 0xC782B800) + 8 < 0x20)) ^ v4)))();
}

void sub_1A2E0376C()
{
}

void sub_1A2E037C8()
{
}

uint64_t sub_1A2E037D8(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((4 * (a2 ^ 0xE5F) - 1938925573) & 0x73919AC8 ^ 0x1DD4) * (v2 < 0x20)) ^ (4 * (a2 ^ 0xE5F)))))();
}

void sub_1A2E03824(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X11, X17 }
}

void sub_1A2E03860()
{
  *(_DWORD *)(v0 + 20) = v1 + 3522;
}

uint64_t sub_1A2E038A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  int v53 = (_DWORD *)(a31 + 24 * v45);
  *int v53 = v49;
  v53[1] = v46;
  *(void *)(v52 + 24 * v45 + 16) = v51;
  v53[4] = HIDWORD(a34);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 8 * (int)((((*(_DWORD *)(v47 + 48 * v50 + 32) + 534534445) < 0x80000003) * (a6 + ((v44 + 69205515) | 0x83084B58) + 2876)) ^ v44)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a44);
}

void sub_1A2E03938()
{
}

uint64_t sub_1A2E0399C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v8
                              + 8 * (((a5 + 1229 + v7 + a5 - v6 - 243) * ((unint64_t)(v5 - a1) > 0x1F)) ^ a5)))();
}

uint64_t sub_1A2E039D4@<X0>(__int16 a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43)
{
  LOWORD(STACK[0x8DC]) = a1;
  return (*(uint64_t (**)(void))(STACK[0x2A8] + 8 * (a43 - 2332)))();
}

uint64_t sub_1A2E039EC()
{
  return sub_1A2E03A04();
}

uint64_t sub_1A2E03A04@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  LODWORD(STACK[0x3BC]) = v4;
  *(void *)STACK[0x458] = a2;
  LODWORD(STACK[0x79C]) = 1877363113;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)(((v4 + (((((v3 - 3884) | 0x6C1) ^ 0x15D) - 1972) | 0x90) != 1877363265)
                                     * (((((v3 - 3884) | 0x6C1) ^ 0x15D) + 1463542195) & 0xA8C41FF5 ^ 0x93E)) ^ ((v3 - 3884) | 0x6C1) ^ 0x15D)))();
}

uint64_t sub_1A2E03A28()
{
  return sub_1A2E03A40();
}

uint64_t sub_1A2E03A40(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v11 = (v7 + v6 - a3);
  long long v12 = *(_OWORD *)(v4 + v11 - 15);
  long long v13 = *(_OWORD *)(v4 + v11 - 31);
  uint64_t v14 = v9 + v11;
  *(_OWORD *)(v14 - 15) = v12;
  *(_OWORD *)(v14 - 31) = v13;
  return (*(uint64_t (**)(void))(v10 + 8 * ((255 * (a4 + a3 == v8)) ^ (v5 + a1 + 3059))))();
}

uint64_t sub_1A2E03A8C@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((((a2 - 1201990099) & 0x47A4E57F ^ 0xF33 ^ ((a2 + 1) | 2)) * (STACK[0x558] != 0)) ^ a2)))();
}

void sub_1A2E03ADC()
{
  LODWORD(STACK[0x320]) = v0;
  JUMPOUT(0x1A2E03C78);
}

uint64_t sub_1A2E03DB8()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((62
                                * (((((v0 - 3454) | 0x1A0) + 1762904787) ^ (v2 - ((2 * v1) & 0x2C086B00) + 369374605))
                                 + ((2 * (v2 - ((2 * v1) & 0x2C086B00) + 369374605)) & 0xFE2FF680 ^ 0x2C086541 ^ v0 ^ 0x893)
                                 - 34873922 == 2097404168)) ^ v0)))();
}

uint64_t sub_1A2E03E78()
{
  BOOL v4 = *(_DWORD *)(*v1 + 4 * v2) == ((347 * (v0 ^ 0x567)) ^ 0xFD7E715D);
  return (*(uint64_t (**)(void))(v3 + 8 * (v4 | (8 * v4) | v0)))();
}

uint64_t sub_1A2E03EC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((105 * (v1 - a1 < (unint64_t)((v2 + 1744693755) & 0xB9FB5BEF) - 569987531)) ^ (v2 + 147))))();
}

uint64_t sub_1A2E03F10()
{
  *int v2 = v2[623];
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v1 - 2381) ^ 0x1E9) * (v0 != 1)) ^ (v1 - 744))))();
}

uint64_t sub_1A2E03F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6
                              + 8
                              * ((240
                                * ((v6 ^ 0x6B ^ (*(unsigned __int8 *)(STACK[0x3E0] + 5) == (v6 + 3))) & 1)) ^ v6)))();
}

uint64_t sub_1A2E03F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  a15 = 2800
      - ((-1498518037 - (&a13 | 0xA6AE6DEB) + (&a13 | 0x59519214)) ^ 0x9ED0F25D) * v18;
  a13 = &STACK[0x370A1A23408CA06];
  uint64_t v19 = (*(uint64_t (**)(unint64_t **))(v15 + 40952))(&a13);
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * ((2648 * (a14 == v16)) ^ v17)))(v19);
}

uint64_t sub_1A2E04020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                + 8
                                                                                * ((((v4 - 1998166817) < 0x38)
                                                                                  * ((v5 + 1364) ^ 0xEA5)) ^ (v5 - 1314))))(a1, a2, a3, a4, 889516850);
}

uint64_t sub_1A2E04064()
{
  return sub_1A2E040A8(3211, 3971852929, 2957750620, v0 ^ 0x87Du);
}

uint64_t sub_1A2E040A8@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  BOOL v17 = v12 > v15;
  *(_DWORD *)(a10 + 4 * (v10 + a4)) = *(_DWORD *)(*v14 + 4 * (v10 + a4));
  if (v17 == v10 + a1 < a2) {
    BOOL v17 = v10 + a1 < v13;
  }
  return (*(uint64_t (**)(void))(v16 + 8 * ((v17 * a3) ^ (v11 - 1072))))();
}

uint64_t sub_1A2E04108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = (*(uint64_t (**)(void))(a6 + 8 * (v6 ^ 0x1F3B)))();
  uint64_t v9 = STACK[0x2A8];
  *(void *)(v7 + 24) = 0;
  return sub_1A2D47AC0(v8, v10, v11, v12, v13, v9);
}

uint64_t sub_1A2E04140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v7 = v6 - 1105;
  (*(void (**)(void))(a6 + 8 * (v6 ^ 0x1E0E)))();
  return (*(uint64_t (**)(void))(STACK[0x2A8]
                              + 8
                              * ((((v7 - 1201990099) & 0x47A4E57F ^ 0xF33 ^ ((v7 + 1) | 2)) * (STACK[0x558] != 0)) ^ v7)))();
}

void sub_1A2E041AC()
{
}

uint64_t sub_1A2E04258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(v9 + 8 * ((v7 + v8 + 1230) ^ (489 * (a7 != 0)))))();
}

void sub_1A2E04288()
{
}

void Xr9TNsiQ(uint64_t a1, uint64_t a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E042FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, char a14, char *a15, int a16, char a17, uint64_t a18, int a19, char a20,uint64_t a21,char *a22,char *a23,char *a24,uint64_t a25,unint64_t *a26)
{
  LODWORD(a23) = (v26 + 913) ^ (1401278017
                              * ((-865416224 - (&a22 | 0xCC6ACBE0) + (&a22 | 0x3395341F)) ^ 0x37B642F8));
  a22 = &a17;
  a24 = a15;
  a26 = &STACK[0xCACAEBD78BF835C];
  (*(void (**)(char **))(v27 + 8 * (v26 ^ 0x10FA)))(&a22);
  LODWORD(a23) = (v26 + 913) ^ (1401278017
                              * ((1495862421 - (&a22 | 0x59290C95) + (&a22 | 0xA6D6F36A)) ^ 0xA2F5858D));
  a24 = a15;
  a26 = &STACK[0xCACAEBD78BF838C];
  a22 = &a14;
  (*(void (**)(char **))(v27 + 8 * (v26 | 0x10FA)))(&a22);
  a23 = a15;
  a24 = &a20;
  HIDWORD(a22) = (v26 + 1667) ^ (1314530549
                               * ((&a22 & 0x3A8CC75E | ~(&a22 | 0x3A8CC75E)) ^ 0x747ABE6F));
  (*(void (**)(char **))(v27 + 8 * (v26 + 4331)))(&a22);
  a23 = a15;
  LODWORD(a24) = v26
               - 476588053
               * ((-1586369350 - (&a22 | 0xA171ECBA) + (&a22 | 0x5E8E1345)) ^ 0xE3731706)
               - 475;
  uint64_t v28 = (*(uint64_t (**)(char **))(v27 + 8 * (v26 ^ 0x1721)))(&a22);
  return (*(uint64_t (**)(uint64_t))(v27
                                            + 8
                                            * (int)(((a22 == 1877363113)
                                                   * ((((v26 + 836230396) & 0xCE2821F7) + 1856) ^ 0x1B5B)) ^ v26)))(v28);
}

uint64_t sub_1A2E04528@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((2189 * ((a2 ^ 0xC4903CC4) < (((v2 ^ 0x10E8) - 7047) ^ (10 * (v2 ^ 0x1F6u))))) ^ v2)))();
}

uint64_t sub_1A2E04574(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(uint64_t, void))(v6 + 8 * (a3 ^ (45 * ((unint64_t)(v3 - v5) < 0x20)))))(v4, (a3 + 4201557) | 0x20804022u);
}

uint64_t sub_1A2E045B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((v1 - a1 >= (unint64_t)(v2 + 1924807333) - 1924811498)
                                * (7 * (v2 ^ 0x11B3) - 3054)) ^ v2)))();
}

uint64_t sub_1A2E04600(uint64_t a1, uint64_t a2, char a3, int a4, char a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  int v19 = *(unsigned __int8 *)(v16
                           + (v11 ^ (a4 + 4)) * v12
                           + 538400
                           - ((v11 ^ (a4 + 4)) * v12 + 538400) / 0x4A0 * v8);
  unsigned int v20 = v18 + (v19 ^ a5 ^ (((v19 << ((a3 ^ (2 * v9)) - 67)) ^ (16 * v19)) - 125)) * v17;
  *(unsigned char *)(v13
           + v10 * v17
           - 1018560698
           - ((((v10 * v17 - 1018560698) * (unint64_t)v14) >> 32) >> 4) * v15) = *(unsigned char *)(v13 + (v20 - ((v20 * (unint64_t)a8) >> 32) * v15));
  return (*(uint64_t (**)(void))(STACK[0x6D8] + 8 * (v9 ^ (4 * (v10 == -348805474)))))();
}

void aC4q7GWh()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v0 = *(&off_1EF5F46E0
       + ((-43 * ((qword_1E95A4840 - dword_1E95A4780) ^ 0xD4)) ^ byte_1A30290A0[byte_1A3023090[(-43 * ((qword_1E95A4840 - dword_1E95A4780) ^ 0xD4))] ^ 0x1F])
       - 113);
  uint64_t v1 = (uint64_t)*(&off_1EF5F46E0
                + (*((unsigned char *)off_1EF5F4C20
                                                  + (*((unsigned __int8 *)off_1EF5F4740
                                                     + (-43 * (*v0 ^ qword_1E95A4840 ^ 0xD4))) ^ 0x86u)
                                                  - 4) ^ (-43 * (*v0 ^ qword_1E95A4840 ^ 0xD4)))
                + 38);
  unint64_t v2 = (unint64_t)&v4[*(void *)(v1 - 4) ^ *v0];
  *int v0 = 1946842069 * (v2 + 0x311DF6E51EDE312CLL);
  *(void *)(v1 - 4) = 1946842069 * (v2 ^ 0xCEE2091AE121CED4);
  v5[1] = 31090337 * ((v5 & 0x9FCC7A01 | ~(v5 | 0x9FCC7A01)) ^ 0xA7B2E5B7) + 1655392376;
  LOBYTE(v0) = -43 * ((*(_DWORD *)(v1 - 4) + *(_DWORD *)v0) ^ 0xD4);
  uint64_t v3 = (uint64_t)*(&off_1EF5F46E0
                + ((-43 * ((qword_1E95A4840 + dword_1E95A4780) ^ 0xD4)) ^ byte_1A302D380[byte_1A30293A0[(-43 * ((qword_1E95A4840 + dword_1E95A4780) ^ 0xD4))] ^ 0x86])
                - 90);
  (*(void (**)(_DWORD *))(v3
                                   + 8
                                   * ((*((unsigned char *)off_1EF5F47E0
                                                                      + (*((unsigned __int8 *)off_1EF5F48A0
                                                                         + v0) ^ 0x1Fu)
                                                                      - 12) ^ v0)
                                    + 4986)))(v5);
  __asm { BRAA            X8, X17 }
}

void sub_1A2E048F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10)
{
  int v15 = ((((v14 - 144) ^ 0x90C035FA | 0x86F579C2)
        - ((v14 - 144) ^ 0x90C035FA)
        + (((v14 - 144) ^ 0x90C035FA) & 0x790A8638)) ^ 0x9B1A7C)
      * a9;
  *(_DWORD *)(v14 - 144) = v10 + v15 - 738453228 + v13 + 172;
  *(_DWORD *)(v14 - 140) = v13 - v15 - 2615;
  *(void *)(v14 - 136) = a10;
  *(void *)(v14 - 128) = v12;
  (*(void (**)(uint64_t))(v11 + 8 * (v13 ^ 0x1951u)))(v14 - 144);
  JUMPOUT(0x1A2E0497CLL);
}

uint64_t sub_1A2E049D0(uint64_t a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  *(void *)(a6 + (v6 + a2)) = *(void *)(v7 + (v6 + a2));
  return (*(uint64_t (**)(uint64_t, void))(v9 + 8 * (((a5 + a2 != 8) * v8) ^ a4)))(a1, (a2 - 8));
}

void sub_1A2E04A00()
{
  LODWORD(STACK[0x388]) = STACK[0x2A8];
  LODWORD(STACK[0x35C]) = STACK[0x2B0];
  STACK[0x498] = STACK[0x290];
  STACK[0x368] = STACK[0x298];
  STACK[0x480] = STACK[0x2A0];
  LODWORD(STACK[0x314]) = v0;
  sub_1A2D19CE4();
}

uint64_t sub_1A2E04A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unsigned int a25,uint64_t a26,uint64_t a27,unsigned int a28,uint64_t a29,uint64_t a30,uint64_t a31,unsigned int a32,uint64_t a33)
{
  uint64_t v38 = __ROR8__((a4 ^ 0x918C6B4656CB60DLL) & (v37 ^ 0xA3839CB456AD3D64), 51);
  unint64_t v39 = v38 - 0x3828D049ABE39258 - ((v38 << (((v36 - 88) | 0x88) ^ 0xCDu)) & 0x8FAE5F6CA838DB50);
  uint64_t v40 = a4 ^ v34;
  unint64_t v41 = ((v33 ^ a27) - ((2 * (v33 ^ a27)) & 0xC2EC888F7FCAB8D0) + 0x61764447BFE55C68) ^ a26;
  unint64_t v42 = v41 ^ v35;
  uint64_t v43 = v42 ^ 0x7F328E1992C14CB5;
  uint64_t v44 = __ROR8__(((v39 & 0x100000000000)+ (v39 & 0xFFFFEFFFFFFFFFFFLL ^ 0xC7D72FB6541C6DA8)+ ((2 * v39) & 0x689B82004824F326 ^ 0xF775FDFFF7DF2CFFLL)+ 0x344DC10024127994) ^ __ROR8__(a4 ^ 0x918C6B4656CB60DLL | v37 ^ 0xA3839CB456AD3D64, 51), 13);
  unint64_t v45 = v41 & (v40 ^ 0xD559C6F7EF41F154);
  uint64_t v46 = v40 ^ 0x2AA6390810BE0EABLL;
  uint64_t v47 = v44 ^ 0x33665D91F7FEDF6CLL;
  uint64_t v48 = (v42 ^ 0x7F328E1992C14CB5) & ~v41 ^ v40 ^ 0x2AA6390810BE0EABLL;
  unint64_t v49 = ((v44 ^ 0xCC99A26E08012093) & (v37 ^ 0x5C7C634BA952C29BLL))
      + 0x451AB3FEEB80E83DLL
      - ((2 * ((v44 ^ 0xCC99A26E08012093) & (v37 ^ 0x5C7C634BA952C29BLL))) & 0x8A3567FDD701D07ALL);
  uint64_t v50 = __ROR8__((v42 ^ 0x80CD71E66D3EB34ALL) & (v37 ^ 0xA3839CB456AD3D64), 17);
  unint64_t v51 = v41 ^ 0x32931DCBC2A04E1ELL ^ (v48 - ((2 * v48) & 0xC790895D0F35AEDELL) + 0x63C844AE879AD76FLL);
  unint64_t v52 = (v42 ^ 0x80CD71E66D3EB34ALL) + 1;
  unint64_t v53 = v42 ^ 0xC5D7C21886BE5B77 ^ v49;
  v49 ^= 0x451AB3FEEB80E83DuLL;
  unint64_t v54 = v53 + v49;
  unint64_t v55 = v44 ^ v45;
  uint64_t v56 = (v54 + 1) & v43 ^ v52;
  uint64_t v57 = v55 ^ (v48 - ((2 * v48) & 0x2D8FFE2BFC776C7ELL) + 0x16C7FF15FE3BB63FLL);
  unint64_t v58 = (v56 ^ ((v54 + 1) | v43)) + v49;
  unint64_t v59 = __ROR8__(v50 ^ __ROR8__(v51, 17) ^ 0x7C70844191B1BA4CLL, 47);
  unint64_t v60 = ((v47 & v46) - ((2 * (v47 & v46)) & 0xB4A5869BCB5D2774) + 0x5A52C34DE5AE93BALL) ^ v37 ^ v58;
  *((void *)&v62 + 1) = v59 ^ 0x7AB9AAAD25;
  *(void *)&long long v62 = v59 ^ 0xD366820000000000;
  uint64_t v61 = v62 >> 39;
  unint64_t v63 = ((8 * v59) ^ 0x9B3413D5CD556928)
      + 0x2BCC99623BF92010
      - ((2 * ((8 * v59) ^ 0x9B3413D5CD556928)) & 0x579932C477F24020);
  *((void *)&v62 + 1) = v57 ^ 0x2C75A;
  *(void *)&long long v62 = v57 ^ 0xD566E28CC5F80000;
  unint64_t v64 = v59 ^ (v59 >> 61) ^ v61;
  uint64_t v65 = (v62 >> 19) ^ ((v57 ^ 0xDA5E5D7BF63A96ACLL) << 36) ^ ((v57 ^ 0xDA5E5D7BF63A96ACLL) >> 28) ^ 0x3C051F60F38BFF73;
  *((void *)&v62 + 1) = v58 ^ 3;
  *(void *)&long long v62 = v58 ^ 0x92CFC162FD513140;
  unint64_t v66 = ((v64 ^ 0xD366827AB9AAAD23) + (v64 ^ 0x755E4E77DAC72CCLL ^ v63) + 1) ^ v63 ^ ((v63 ^ 0xD433669DC406DFEFLL) + 1);
  unint64_t v67 = (v55 >> 7) ^ (v55 << 23) ^ (v55 >> 41);
  unint64_t v68 = (v55 << 57) ^ v55 ^ ((v67 ^ 0xCC5B667B020D4D82)
                           + 0x53EF9B6BBF200D4FLL
                           - 2 * ((v67 ^ 0xCC5B667B020D4D82) & 0x53EF9B6BBF200D6FLL ^ v67 & 0x20));
  uint64_t v69 = (v62 >> 6) ^ (v58 >> 1);
  unint64_t v70 = v69 ^ (((unint64_t)~v58 << 63) | 0x4967E0B17EA898A1);
  unint64_t v71 = v58 ^ 0x8AAB56887599E548 ^ (v70 + 0x186497EA88C8D40BLL - 2 * (v70 & 0x186497EA88C8D41BLL ^ v69 & 0x10));
  unint64_t v72 = (v64 ^ 0xF8AA1B1882538D33 ^ v66) + 2 * ((v66 ^ 0x2BCC99623BF92010) & (v64 ^ 0x5366827AB9AAAD23));
  uint64_t v73 = v72 - 0x68F8355888E2BCEALL - ((2 * v72) & 0x2E0F954EEE3A862CLL);
  unint64_t v74 = (v60 << 47) ^ (v60 >> 10) ^ (v60 >> 17) ^ (0x40000000000001 * (v60 ^ 0x484EBDCD9896C909)
                                                 - (((v60 << 55) ^ 0x8480000000000000) & ((2 * v60) ^ 0x909D7B9B312D9212)));
  uint64_t v75 = v74 ^ 0x48AAECB7DD642B74;
  uint64_t v76 = v74 ^ 0x48AAECB7DD642B74 ^ v68;
  uint64_t v77 = (v71 - 0x68F8355888E2BCEALL - ((2 * v71) & 0x2E0F954EEE3A862CLL)) ^ v73;
  *((void *)&v62 + 1) = v76 ^ 3;
  *(void *)&long long v62 = v76 ^ 0xC67345CD178A2FA0;
  uint64_t v78 = (v65 - ((2 * v65) & 0x26490CA4D76A558ALL) - 0x6CDB79AD944AD53BLL) ^ v57 ^ v68;
  uint64_t v79 = (v74 ^ 0x6496B7882D80E9F9) & ~v77;
  unint64_t v80 = v74 ^ 0x9B694877D27F1606;
  unint64_t v81 = (v62 >> 5) ^ 0xAE5E82AE6F4A7F5ELL;
  unint64_t v82 = v80 & (v68 ^ 0xEA4F1EF2E76EED2ELL);
  uint64_t v83 = 32 * v81 - 0x7191E39E9495B4E5;
  unint64_t v84 = v77 ^ v82;
  unint64_t v85 = (((v83 - ((v81 << 6) & 0x1CDC38C2D6D49600)) ^ 0x8E6E1C616B6A4B1BLL | (v81 >> 59)) ^ 0x342FAA3216B0142ALL) & (v78 ^ 0xAC0D7A2C492100B1);
  unint64_t v86 = v78 ^ 0x99B7678F1028D219 ^ ((v71 & (v73 ^ 0x68F8355888E2BCE9))
                                    - ((2 * (v71 & (v73 ^ 0x68F8355888E2BCE9))) & 0x6B743B46B213A550)
                                    + 0x35BA1DA35909D2A8);
  uint64_t v87 = (v85 - ((2 * v85) & 0x5878B67FE1C9851ALL) + 0x2C3C5B3FF0E4C28DLL) ^ v75;
  unint64_t v88 = (v87 - ((2 * v87) & 0xCAC648060450EDA6) - 0x1A9CDBFCFDD7892DLL) ^ v84;
  unint64_t v89 = (v78 ^ 0x53F285D3B6DEFF4ELL) & (v73 ^ 0x9707CAA7771D4316);
  unint64_t v90 = v86 ^ v73 ^ (v79 - 0x68F8355888E2BCEALL - ((2 * v79) & 0x2E0F954EEE3A862CLL));
  unint64_t v91 = v76 ^ v89;
  unint64_t v92 = (v86 - ((2 * v86) & 0x5273369AF6F8E400) + 0x29399B4D7B7C7200) ^ v91;
  unint64_t v93 = v92 ^ 0xEF4ADE806CF65DA3;
  *((void *)&v62 + 1) = v90 ^ 0x56;
  *(void *)&long long v62 = v90 ^ 0x5747C156E755AE80;
  uint64_t v94 = v62 >> 7;
  *(void *)&long long v62 = __ROR8__(v90, 46);
  unint64_t v95 = ((v62 & 0xFE0000000003FFFFLL ^ 0x400000000015D1FLL) & 0x7000000000014BE6 ^ v94 & 0x70478D26B6AD4BE6 | (v62 & 0xFE0000000003FFFFLL ^ 0x400000000015D1FLL) & 0x8E0000000002B419 ^ v94 & 0x8FB872D94952B419) ^ 0x39C72D7F057B6F4DLL;
  unint64_t v96 = (v92 >> 19) ^ ((v92 ^ 0xEF4ADE806CF65DA3) << 36) ^ ((v92 ^ 0xEF4ADE806CF65DA3) >> 28) ^ ((v92 ^ 0xEF4ADE806CF65DA3) << 45) ^ 0xBEEA365C1DEE72FALL;
  uint64_t v97 = v96 - ((2 * v96) & 0x423B8A5EDA3EF3FCLL) - 0x5EE23AD092E08602;
  unint64_t v98 = (v91 & 2 | (4 * (((v91 & 2) >> 1) & 1)) | 0x7FCDDFEE5D7BEDB9) ^ 4;
  unint64_t v99 = (((v90 << 25) ^ (8 * v90)) & 0xFFFFFFFFFFFFFFF8 | (v90 >> 61)) ^ (v95 >> 57) ^ (v95 << 7);
  unint64_t v100 = ((v84 >> 6) | (v84 << 63)) ^ (v84 >> 1);
  unint64_t v101 = ((v100 ^ (v84 << 58) ^ 0xDE1FAE11AA0A9F1DLL)
        + 0x4D0FA1E97D98ED55
        - 2 * ((v100 ^ (v84 << 58) ^ 0xDE1FAE11AA0A9F1DLL) & 0x4D0FA1E97D98ED77 ^ v100 & 0x22)) ^ v84;
  if (((v98 + 0x322011A2841245) & ((v91 >> 7) ^ 0xB896F26B2C14B5)) != 0) {
    unint64_t v102 = 0xFF5BB732A2B79ADCLL - v98;
  }
  else {
    unint64_t v102 = v98 - 0x4008AA1840409ALL;
  }
  unint64_t v103 = ((v91 << 23) ^ (v91 << 57) ^ (v91 >> 7) ^ 0x567393DF182C14B5) - 0x7F8DD744453BAD21 + v102;
  unint64_t v104 = v101 ^ v99;
  unint64_t v105 = v91 & 0xFFFFFFFFFFFFFFFDLL ^ (v91 >> 41) ^ v103;
  unint64_t v106 = v105 ^ v93 ^ v97;
  unint64_t v107 = v88 ^ (v88 >> 17) ^ (v88 >> 10) ^ (v88 << 47) ^ (v88 << 54);
  unint64_t v108 = v107 & 0x10000 ^ 0xB5FF63DE5EFBABBALL;
  unint64_t v109 = v108 + 0x7F28FE77FBCFDCE0;
  unint64_t v110 = v99 & 0x2510C7929B9C3A9ELL ^ 0xDBC9AE2A43365C0ELL ^ (v104 ^ 0xF33C0F8C6441C7DFLL) & (v99 ^ 0xB99E197D4E52FD1);
  uint64_t v111 = v110 - ((2 * v110) & 0x79333CC06479EC9CLL) - 0x4366619FCDC309B2;
  unint64_t v112 = v108 + 0x4A009C21A1055446;
  uint64_t v113 = v105 ^ 0x5C4B793596247F58;
  unint64_t v114 = 0xEB27C634B9C53454 - v108;
  if ((v112 & v113) == 0) {
    unint64_t v114 = v109;
  }
  unint64_t v115 = v113 - 0x352862565ACA889ALL + v114;
  unint64_t v116 = v115 ^ v107 & 0xFFFFFFFFFFFEFFFFLL;
  unint64_t v117 = (((v107 ^ 0x2DA7894EF99B11FCLL) & (v104 ^ 0x29D337E1002202BELL))
        - ((2 * ((v107 ^ 0x2DA7894EF99B11FCLL) & (v104 ^ 0x29D337E1002202BELL))) & 0x92864CEB144B6BB4)
        - 0x36BCD98A75DA4A26) ^ v99;
  uint64_t v118 = v106 ^ 0x512AB3EEFA1E6345;
  unint64_t v119 = (v106 ^ 0x512AB3EEFA1E6345) + (v106 ^ 0xC895BDC9E46F1C6ALL ^ v111) + 1;
  unint64_t v120 = v116 ^ (v99 ^ 0xF4661E682B1AD02ELL) & (v106 ^ 0xAED54C1105E19CBALL);
  unint64_t v121 = (v116 ^ 0xD25876B10665EE03) & v118;
  unint64_t v122 = v115 & (v107 ^ 0xD25876B10664EE03) ^ v104;
  uint64_t v123 = (v122 & 0x2000000000000000 ^ 0x7BBBFAF7F6EEF73CLL) + 2 * (v122 & 0x2000000000000000);
  uint64_t v124 = v123 - 0x689A4284420A8100;
  unint64_t v125 = v119 ^ ((v111 ^ 0x99BF0E271E717F2FLL) + 1);
  BOOL v126 = ((v123 - 0x7BBBFAF7F6EEF73CLL) & (v107 ^ 0x2000000000000000)) == 0;
  unint64_t v127 = 0x8EDDB36BABD36D78 - v123;
  if (v126) {
    unint64_t v127 = v124;
  }
  unint64_t v128 = (v111 ^ 0xD8C586D57CE616D1 ^ (v125 - ((2 * v125) & 0x7D0AEE1B3AD12C02) - 0x417A88F2629769FFLL)) + v118;
  unint64_t v129 = ((v120 ^ 0x10FC0DFAD4343E4DLL ^ (((((2 * v120) & 0xDC0982B22B570C14 ^ 0x5809029023140010)
                                          + (v120 ^ 0xD25876B10665EE03)
                                          + 1) ^ ((v120 ^ 0xD25876B10665EE03) + 1))
                                        - ((2
                                          * ((((2 * v120) & 0xDC0982B22B570C14 ^ 0x5809029023140010)
                                            + (v120 ^ 0xD25876B10665EE03)
                                            + 1) ^ ((v120 ^ 0xD25876B10665EE03) + 1))) & 0x7AB709685B5C5F62)
                                        + 0x3D5B84B42DAE2FB1))
        + 0x6E04C15915AB860ALL) ^ v128;
  unint64_t v130 = v121 ^ v122 & 0xDFFFFFFFFFFFFFFFLL ^ ((v107 ^ 0x2DA7894EF99B11FCLL) - 0x1321B873B4E4763CLL + v127);
  *((void *)&v131 + 1) = v129;
  *(void *)&long long v131 = v129 ^ 0x8572380239CAC000 ^ (((v129 << 36) ^ (v129 << 45))
                                                  - ((2 * ((v129 << 36) ^ (v129 << 45))) & 0xAE4700000000000)
                                                  - 0x7A8DC7FDC635244FLL);
  uint64_t v132 = __ROR8__(__ROR8__(v129, 42) & 0xFFFC0000003FFFFFLL ^ 0xE8C01916E3099B4FLL ^ (v131 >> 14), 50);
  *((void *)&v131 + 1) = v120 ^ 0xA9843AE8;
  *(void *)&long long v131 = v120 ^ 0xB30C25600000000;
  unint64_t v133 = (((8 * (v117 ^ v128)) ^ ((v117 ^ v128) << 25)) & 0xFFFFFFFFFFFFFFF8 | ((v117 ^ v128) >> 61)) ^ v117 ^ v128 ^ ((v117 ^ v128 ^ 0xF5DC0255F7CB748) >> (v83 & 0x20) >> (v83 & 0x20 ^ 0x27));
  unint64_t v134 = v132 ^ (v129 >> 19);
  unint64_t v135 = (v131 >> 33) ^ __ROR8__(v120, 10) & 0xFFC000007FFFFFFFLL ^ 0x9E57071BDC7F1D7BLL;
  unint64_t v136 = v130 ^ (v130 >> 10) ^ (v130 << 47) ^ ((v130 >> 17) | (v130 << 54));
  unint64_t v137 = v136 ^ 0x82EE2549B54793B9;
  uint64_t v138 = (v122 >> 1) ^ (v122 >> 6) ^ (v122 << 58) ^ 0x610175F29380F7B3;
  unint64_t v139 = v122 ^ 0xEB7605DCD6D53D53 ^ ((v138 ^ ((unint64_t)~v122 << 63))
                                      - ((2 * v138) & 0x881E4E5CC880F03CLL)
                                      + 0x440F272E6440781ELL);
  unint64_t v140 = v133 ^ v139;
  unint64_t v141 = v133 ^ v139 ^ 0xC0F2C79ECB66F2F7;
  unint64_t v142 = (v133 ^ 0xC0F2C79ECB66F2F7) & v139;
  unint64_t v143 = (v136 ^ 0xA38EE1C1807D9ACCLL) & v141;
  uint64_t v144 = 0x6C3214879F538862 - ((((v135 >> 2) & 1) << 35) | 0x36190A43CFA9C431);
  if (((v135 << 33) & 0x800000000 & (v120 >> 7)) == 0) {
    uint64_t v144 = (((v135 >> 2) & 1) << 35) | 0x36190A43CFA9C431;
  }
  unint64_t v145 = ((v120 >> 41) | (v120 << 57)) ^ (v135 >> 31) ^ (v135 << 33) & 0xFFFFFFF7FFFFFFFFLL ^ (((v120 >> 7) ^ 0x166184AD530875)
                                                                                             - 0x36190A43CFA9C431
                                                                                             + v144);
  unint64_t v146 = (v134 - ((2 * v134) & 0x2C1E9AB884B5DB52) - 0x69F0B2A3BDA51257) ^ v145 ^ 0xD5A5B5B60AF17BFFLL;
  unint64_t v147 = v137 ^ v145 ^ 0xD5A5B5B60AF17BFFLL;
  uint64_t v148 = v146 ^ 0x645B8C266D3FA30;
  uint64_t v149 = v146 ^ 0x645B8C266D3FA30 ^ v142;
  unint64_t v150 = (v143 - ((2 * v143) & 0xBD433714BEC4B2F2) - 0x215E6475A09DA687) ^ v133 ^ v149;
  unint64_t v151 = (v146 ^ 0xF9BA473D992C05CFLL) & (v133 ^ 0x3F0D386134990D08);
  uint64_t v152 = (v136 ^ 0x5C711E3E7F826533) & (v145 ^ 0x43AAF8EA48AB9656);
  unint64_t v153 = v147 & 0xF3FE9056A4775F94;
  unint64_t v154 = v152 & 0xFFFEFFFFFFFFFFFFLL;
  unint64_t v155 = (v152 & 0x1000000000000 ^ 0xD3BFF53BFFFCD79CLL) + 2 * (v152 & 0x1000000000000);
  unint64_t v156 = v155 + 0x3FEFFAFFDF3BEE78;
  unint64_t v157 = v155 + 0x2C400AC400032864;
  uint64_t v158 = v140 ^ 0x3F0D386134990D08;
  unint64_t v159 = v151 ^ v147 & 0xF3FE9056A4775F94 ^ v147 & 0xC016FA95B88A06BLL;
  unint64_t v160 = v159 ^ v149;
  uint64_t v161 = v148 & (v147 ^ 0x4890762B889F1B23);
  unint64_t v162 = 0xE76FE577DF359DB0 - v155;
  if ((v157 & v158) == 0) {
    unint64_t v162 = v156;
  }
  uint64_t v163 = (v161 - ((2 * v161) & 0x42C189106A7412EALL) + 0x2160C488353A0975) ^ v137;
  unint64_t v164 = (v158 - 0x13AFF03BDF38C614 + v162) ^ v154;
  unint64_t v165 = (v163 - ((2 * v163) & 0x8F5C854794702F4) + 0x47AE42A3CA3817ALL) ^ v164;
  unint64_t v166 = ((v164 << 58) ^ 0xE800000000000000)
       - 0x21BDB6362FE093EFLL
       - ((2 * ((v164 << 58) ^ 0xE800000000000000)) & 0xBFFFFFFFFFFFFFFFLL);
  *((void *)&v168 + 1) = v160 ^ 0x1156;
  *(void *)&long long v168 = v160 ^ 0x20992E3181880000;
  uint64_t v167 = v168 >> 19;
  *((void *)&v168 + 1) = v164;
  *(void *)&long long v168 = v164 ^ 0xD3DA1E3360BF843ALL;
  uint64_t v169 = (v165 >> 10) ^ 0x102CCC56E659C9;
  uint64_t v170 = v164 ^ 0xD11327BA9A292742 ^ (((v168 >> 1) ^ (v164 >> 6) ^ 0x34F6878CD82FE10)
                                      + 0x2C93989FA96A378
                                      - 2
                                      * (((v168 >> 1) ^ (v164 >> 6) ^ 0x34F6878CD82FE10) & 0x2C93989FA96A37ALL ^ ((v168 >> 1) ^ (v164 >> 6)) & 2));
  unint64_t v171 = (v165 ^ 0xBF5CE268307E8250 ^ (v165 >> 10)) + v169 + 1;
  unint64_t v172 = v167 ^ ((v160 ^ 0xB76F89D47760E4DCLL) << 36) ^ ((v160 ^ 0xB76F89D47760E4DCLL) >> 28) ^ 0x6E8F58A97F6A7E5FLL;
  unint64_t v173 = v160 ^ 0x75DCE941366837D6 ^ (v172 - ((2 * v172) & 0xAA8B8EE16FC04D00) + 0x5545C770B7E02680);
  unint64_t v174 = ((v171 - ((2 * v171) & 0x539BCBCBB2144F78) - 0x56321A1A26F5D844) ^ v165 ^ 0xE97ED4BE406D03DALL) & 0xA3DEE8F1697476E2 | ((v171 - ((2 * v171) & 0x539BCBCBB2144F78) + 0x29CDE5E5D90A27BCLL) ^ v165 ^ 0xE97ED4BE406D03DALL) & 0x5C21170E968B891DLL;
  uint64_t v175 = ~v166 & 0x4000000000000000;
  *((void *)&v168 + 1) = v159 ^ 0x1078404D921;
  *(void *)&long long v168 = v159 ^ 0xC7A8200000000000;
  uint64_t v176 = v168 >> 41;
  unint64_t v177 = (v174 ^ ((v165 ^ 0xBF4CCEA46698DB99) + 1)) + v169;
  uint64_t v178 = v150 ^ (8 * v150) ^ (v150 >> 39) ^ (v150 >> 61) ^ (v150 << 25);
  uint64_t v179 = v178 ^ 0x18DB0C53B233DDC9;
  uint64_t v180 = v159 ^ 0x594AE809DDDCF5A4 ^ (((v159 << 57) ^ 0x4200000000000000)
                                      - ((2 * ((v159 << 57) ^ 0x4200000000000000)) & 0x3C00000000000000)
                                      - 0x611D36F1A627D37BLL);
  uint64_t v181 = (4 * v159) ^ 0x1EA0841E10136484;
  unint64_t v182 = v181 & 0xFFFFFFFDFFFFFE00 | ((v151 ^ ~v153) >> 62);
  unint64_t v183 = v166 ^ 0x9FD1DD23A6EF9002;
  unint64_t v184 = v166 ^ 0xDE4249C9D01F6C11;
  if (!v177) {
    unint64_t v183 = 0xBE6C6B15890F03ECLL;
  }
  *((void *)&v185 + 1) = ((2 * (v180 - 3931281785)) & 0x1D4A532F2) + ((v180 - 3931281785) ^ 0xEA529979);
  *(void *)&long long v185 = v180;
  unint64_t v186 = v177 ^ (((v165 << 54) ^ (v165 << 47)) & 0xFFFF800000000000 | (v165 >> 17));
  unint64_t v187 = v186 ^ 0xA88C88174DC5BE17;
  unint64_t v188 = v183 & v184 ^ (v170 & 0x419394EA76F0FC13 ^ v175 | v170 & 0xBE6C6B15890F03ECLL);
  uint64_t v189 = (v188 + 0x499E89EB49CD6B6 - ((2 * v188) & 0x933D13D6939AD6CLL)) ^ v179;
  uint64_t v190 = v176 ^ __ROR8__(v182 ^ (v181 & 0x200000000 | 0x14C80F3D556A6088) ^ (v185 >> 55), 9);
  unint64_t v191 = (v186 ^ 0x8BB3205998ADCCB3) & ~v189;
  unint64_t v192 = v186 ^ v190;
  unint64_t v193 = v190 ^ v173;
  unint64_t v194 = (v192 ^ 0xCFB9445E06077983) & (v186 ^ 0x744CDFA66752334CLL);
  unint64_t v195 = v192 ^ 0xCFB9445E06077983 ^ (v193 ^ 0xBBF59BF861554ACFLL) & (v178 ^ 0x1C42E4CD06AF0B7FLL);
  *((void *)&v185 + 1) = v193 ^ 0xB530;
  *(void *)&long long v185 = v193 ^ 0x440A64079EAA0000;
  unint64_t v196 = v192 ^ 0x9AE55959D4AECCFDLL ^ (((v192 ^ 0x3046BBA1F9F8867CLL) & (v193 ^ 0x440A64079EAAB530))
                                      - ((2 * ((v192 ^ 0x3046BBA1F9F8867CLL) & (v193 ^ 0x440A64079EAAB530))) & 0x22ACF2009806009CLL)
                                      + 0x115679004C03004ELL);
  *(void *)&long long v185 = __ROR8__((v185 >> 16) ^ __ROR8__(v188 & (v178 ^ 0xE3BD1B32F950F480), 16) ^ 0xE271E5A9EF02FD14, 48);
  uint64_t v197 = v185 ^ v195;
  unint64_t v198 = (v187 ^ (v173 + 0x233FA84ED56872A4 - ((2 * v173) & 0x467F509DAAD0E548)))
       + (v193 ^ 0xE95C3238856D9489 ^ (v196 - ((2 * v196) & 0x2D479B8EF524D6ECLL) + 0x16A3CDC77A926B76))
       + 1;
  unint64_t v199 = v185 ^ v179 ^ (v191 + 0x499E89EB49CD6B6 - ((2 * v191) & 0x933D13D6939AD6CLL));
  unint64_t v200 = v189 ^ v194;
  uint64_t v201 = (v198 + 0x233FA84ED56872A4 - ((2 * v198) & 0x467F509DAAD0E548)) ^ v187;
  unint64_t v202 = (v201 - ((2 * v201) & 0xF295409C22BF38CALL) + 0x794AA04E115F9C65) ^ v189 ^ v194;
  unint64_t v203 = v185 ^ v195 ^ 0x2F888EB79354C7BELL ^ (((((unint64_t)v185 ^ v195) >> 19) ^ 0x1D92B9883CCCLL)
                                             - ((2 * ((((unint64_t)v185 ^ v195) >> 19) ^ 0x1D92B9883CCCLL)) & 0x5ECEA6DE3A0)
                                             - 0x3CE2BD098AC90E30);
  uint64_t v204 = (8 * v199) ^ 0x2D6289BDBA7A9618;
  unint64_t v205 = v203
       + ((((unint64_t)v185 ^ v195) >> 28) ^ 0xEC95CC41ELL)
       - 2 * (v203 & ((((unint64_t)v185 ^ v195) >> 28) ^ 0xEC95CC41ELL));
  unint64_t v206 = ((*(unsigned char *)(a29 + (((v199 >> 59) ^ 0xF) & 0x1C ^ 0x53)) ^ ((v199 >> 59) ^ 0xF) & 0x1C ^ 0x74)
                         - 29) ^ v199;
  uint64_t v207 = ((v189 ^ v194) >> 1) ^ 0x36E27D85EA7FFFA2;
  uint64_t v208 = (v199 >> 39) ^ 0x7A53AEC849BBF59ELL ^ v206;
  v206 ^= 0x85AC5137B74F52C3;
  unint64_t v209 = (v208 + v206 + 1) ^ (((v199 >> 39) ^ 0xFFFFFFFFFEF4A75DLL) + 1);
  unint64_t v210 = ((v199 >> 39) ^ 0xCFAF49F47A897D14 ^ (v209 - ((2 * v209) & 0x9F5E93E8F7044B6CLL) - 0x3050B60B847DDA4ALL))
       + v206;
  uint64_t v211 = (v204 & 0x800000000 ^ 0x79DBFADFECFFD3E9) + 2 * (v204 & 0x800000000);
  uint64_t v212 = v211 - 0x908A8440510028;
  uint64_t v213 = v211 - 0x79DBFADFECFFD3E9;
  unint64_t v214 = __ROR8__(v202, 14) & 0xF003FFFFFFFFFFFFLL;
  unint64_t v215 = 0xF3276B3B99AEA7AALL - v211;
  if ((v210 & v213) == 0) {
    unint64_t v215 = v212;
  }
  uint64_t v216 = __ROR8__(v214 ^ __ROR8__(v202 ^ 0x9C057F16E7A199B2 ^ (((v202 >> 17) ^ 0x451F0027E16FLL)- ((2 * ((v202 >> 17) ^ 0x451F0027E16FLL)) & 0xFEB24AFD702ALL)+ 0x163B7F59257EB815), 4) ^ 0x6ADCB99075AD3B3BLL, 60);
  unint64_t v217 = v216 ^ (v202 << 54);
  unint64_t v218 = (v216 & 0x100000 ^ 0xDFB5C7FF9EF6F9ECLL) + 2 * (v216 & 0x100000);
  BOOL v126 = ((v218 + 0x204A380061090614) & (v217 ^ 0x69C0000000000000)) == 0;
  uint64_t v219 = v207 & (v200 ^ 0x6DC4FB0BD4FFFF44);
  uint64_t v220 = v207 | v200 ^ 0x6DC4FB0BD4FFFF44;
  unint64_t v221 = v210 - 0x794B705BACAED3C1 + v215;
  unint64_t v222 = ((v200 << 58) ^ (v200 << 63)) & 0xFC00000000000000 | (v200 >> 6);
  unint64_t v223 = (v202 << 47) ^ 0x90D3800000000000;
  uint64_t v224 = v223 & 0x3A2000000000000;
  unint64_t v225 = v220 ^ v219 ^ v222;
  unint64_t v226 = v218 + 0x28DFFEC77B7DA780;
  unint64_t v227 = v204 & 0xFFFFFFF7FFFFFFFFLL ^ (v199 << 25) ^ v221;
  unint64_t v228 = v195 ^ (v195 << 57) ^ (v195 << 23) ^ (v195 >> 7) ^ (v195 >> 41);
  unint64_t v229 = v217 ^ 0xC42916874923047ELL | 0xFC5D8B67F5492418;
  uint64_t v230 = v225 ^ 0x11B713EC2F53FFFDLL;
  unint64_t v231 = (v217 ^ 0xC42916874923047ELL) & 0x3A274980AB6DBE7;
  unint64_t v232 = v217 & 0xFFFFFFFFFFEFFFFFLL;
  uint64_t v233 = (v223 >> 38) & 0x3F17600;
  unint64_t v234 = 0xE84B8EC6B96B9B58 - v218;
  if (v126) {
    unint64_t v234 = v226;
  }
  uint64_t v235 = __ROR8__(v233 ^ __ROR8__(v232 ^ 0x38749DE0BC6A2066 ^ (v229 - 0x895C6C71A74A16CLL + v234), 38) ^ 0x17FF1617F2209BDBLL, 26);
  unint64_t v236 = (v235 ^ 0x8826F6C5FFC585FCLL | v231 ^ v224)
       - 0x41C8A28CF7C085CELL
       - ((2 * (v235 ^ 0x8826F6C5FFC585FCLL | v231 ^ v224)) & 0x7C6EBAE6107EF464);
  uint64_t v237 = v227 ^ (v230 - ((2 * v230) & 0x13F4112F1C03EB6ELL) + 0x9FA08978E01F5B7);
  unint64_t v238 = (v236 ^ 0x41C8A28CF7C085CDLL) & (v228 ^ 0xD82D26E3706F750CLL);
  unint64_t v239 = v236 ^ v228 ^ (v227 ^ 0x6F6E9EA586000000) & (v228 ^ (v197 << 36) ^ (v197 << 45) ^ v205 ^ 0x73C7FFC8F908AF3);
  BOOL v240 = a32 - 1742291541 < a25;
  if (a28 > 0xEB9BD7C8 != a32 - 1742291541 < 0x14642837) {
    BOOL v240 = a28 > 0xEB9BD7C8;
  }
  return (*(uint64_t (**)(void, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(a33 + 8 * (v36 ^ (92 * v240))))(a32, v238 ^ v237 ^ ((v238 ^ v237) >> 1), a3, v239 ^ (v239 >> 7) ^ (v239 << 23) ^ ((v239 >> 41) | (v239 << 57)), a5, a6, a7, a33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           (v36 - 1112) | 0x388u);
}

void sub_1A2E06990()
{
}

void sub_1A2E06AA4()
{
}

void sub_1A2E06AB4()
{
}

void sub_1A2E06AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(a2 + 8 * (v3 + 930)))(3);
  uint64_t v6 = *(void *)(v2 + 8 * (v3 - 4212));
  *(void *)(v6 - 4) = v5;
  (*(void (**)(void))(a2 + 8 * (v3 ^ 0x4A8)))();
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a2 + 8 * (v3 + 930)))(30);
  uint64_t v8 = *(void *)(v2 + 8 * (v3 - 4103));
  *(void *)(v8 - 4) = v7;
  v8 -= 4;
  (*(void (**)(void))(a2 + 8 * (v3 + 936)))();
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(a2 + 8 * (v3 + 930)))(27);
  int v10 = *(uint64_t **)(v2 + 8 * (v3 ^ 0x10DE));
  *(uint64_t *)((char *)v10 - 4) = v9;
  int v10 = (uint64_t *)((char *)v10 - 4);
  (*(void (**)(void))(a2 + 8 * (v3 ^ 0x4A8)))();
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(a2 + 8 * (v3 ^ 0x4AE)))(7);
  uint64_t v12 = *(void *)(v2 + 8 * (v3 - 4117));
  *(void *)(v12 - 4) = v11;
  uint64_t v13 = v12;
  (*(void (**)(void))(a2 + 8 * (v3 + 936)))();
  *(_DWORD *)(*(void *)v8 + 20) = 0;
  *(_DWORD *)(*v10 + 8) = 0;
  uint64_t v14 = *(void *)(v2 + 8 * (v3 ^ 0x1036));
  int v15 = *(unsigned char **)v8;
  uint64_t v16 = (unsigned char *)*v10;
  int v17 = *(unsigned char **)(v6 - 4);
  uint64_t v18 = *(void *)(v13 - 4);
  *(_WORD *)(v14 + 10) = 12857;
  *(unsigned char *)uint64_t v18 = 99;
  *(unsigned char *)(v14 + 16) = 95;
  v16[13] = 96;
  v16[16] = 1;
  v15[3] = -22;
  *(unsigned char *)(v18 + 1) = -121;
  *(unsigned char *)(v14 - 4) = 27;
  *(unsigned char *)(v14 + 1) = 52;
  *(_WORD *)(v18 + 5) = -8570;
  *(unsigned char *)(v14 + 4) = 45;
  *(unsigned char *)(v18 + 3) = -72;
  *(unsigned char *)(v14 - 1) = 75;
  v15[25] = -80;
  *(unsigned char *)(v18 + 4) = 26;
  *(unsigned char *)(v14 + 6) = -120;
  v15[24] = 47;
  *(unsigned char *)(v14 - 2) = 78;
  v15[9] = -113;
  v15[12] = -15;
  v16[3] = 80;
  v15[17] = 119;
  *int v17 = 39;
  v15[29] = -5;
  v16[25] = 88;
  v16[20] = -52;
  *(_WORD *)(v14 + 2) = -4439;
  v15[19] = -59;
  *(unsigned char *)(v14 + 13) = 126;
  v17[2] = -77;
  v15[11] = 25;
  *(unsigned char *)(v14 + 14) = 108;
  v17[1] = 83;
  *(unsigned char *)(v18 + 2) = 73;
  *(unsigned char *)(v14 + 15) = 70;
  *(unsigned char *)uint64_t v14 = -95;
  *(unsigned char *)(v14 + 7) = 106;
  int v19 = *(unsigned char **)v8;
  uint64_t v20 = *v10;
  *(unsigned char *)(v20 + 6) = 79;
  v19[16] = -39;
  *(unsigned char *)(v20 + 22) = -87;
  v19[27] = -15;
  *(unsigned char *)(v14 + 12) = 89;
  *(unsigned char *)(v14 + 8) = -42;
  *(unsigned char *)(v20 + 26) = 32;
  v19[4] = -116;
  v19[26] = -16;
  v19[6] = -90;
  v19[28] = -92;
  v19[13] = 34;
  *(unsigned char *)(v14 + 5) = -29;
  *(unsigned char *)(v20 + 12) = 31;
  *(unsigned char *)(v20 + 17) = 66;
  v19[14] = -86;
  *(unsigned char *)(v20 + 18) = -33;
  v19[1] = 113;
  *(unsigned char *)(v20 + 7) = 52;
  *(unsigned char *)(v14 + 9) = -113;
  *(unsigned char *)uint64_t v20 = 15;
  v19[5] = 105;
  v19[7] = -105;
  *(unsigned char *)(v20 + 23) = 72;
  v19[2] = 13;
  *int v19 = -119;
  v19[10] = 45;
  v19[8] = -15;
  v19[18] = 120;
  *(unsigned char *)(v20 + 1) = 77;
  *(unsigned char *)(v20 + 5) = -72;
  *(unsigned char *)(v20 + 21) = -39;
  *(unsigned char *)(v14 - 3) = 56;
  *(unsigned char *)(v20 + 4) = 32;
  *(unsigned char *)(v20 + 19) = -105;
  *(_WORD *)(v20 + 14) = 14983;
  *(unsigned char *)(v20 + 2) = -17;
  v19[15] = -15;
  *(unsigned char *)(v20 + 24) = 73;
  JUMPOUT(0x1A2E0729CLL);
}

uint64_t sub_1A2E072E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, uint64_t a15, unsigned int a16, int a17, int a18)
{
  unsigned int v21 = 1314530549 * (((&a13 | 0x4D79D99C) - (&a13 & 0x4D79D99C)) ^ 0xFC705F52);
  a14 = (v20 + 1780977505) ^ v21;
  a16 = -1072269845 - v21;
  a18 = v21 ^ 0x22934F6B;
  a15 = a11;
  a13 = &STACK[0x67CF598A0A88711];
  uint64_t v22 = (*(uint64_t (**)(unint64_t **))(v18 + 8 * (v20 ^ 0x1E06)))(&a13);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((1023 * (a17 != (v20 ^ 0x4BD) + v19 + 1877358090)) ^ v20)))(v22);
}

uint64_t sub_1A2E073C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6
                              + 8
                              * (((((101 * (v7 ^ 0xE98)) ^ 0x1030) + (v7 ^ 0x1E2) - 3910) * (*v6 != 0)) ^ v7 ^ 0x1E2)))();
}

uint64_t sub_1A2E07458()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v1 < (((v0 - 2556) | 0x20A) ^ 0x35Au)) * ((v0 - 171) ^ 0xAF3)) ^ v0)))();
}

uint64_t sub_1A2E07498()
{
  STACK[0x2B8] = v1;
  return (*(uint64_t (**)(void))(v3
                              + 8 * ((47 * (v2 + LODWORD(STACK[0x3FC]) - 2049 < ((v0 - 2798) | 0x827u) - 4416)) ^ v0)))();
}

void HN0R(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E07544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  a14 = 31090337 * ((&a13 - 2016193444 - 2 * ((unint64_t)&a13 & 0x87D3545C)) ^ 0x40523415)
      + 1655392376;
  uint64_t v15 = (*(uint64_t (**)(int *))(v14 + 41128))(&a13);
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((5424 * (a13 == 1877363113)) ^ 0x4FAu)))(v15);
}

uint64_t sub_1A2E075DC()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * (int)(((((2 * v1) ^ 0x1D4E) + ((v1 + 1684328231) & 0x9B9B3BDF) - 8849)
                                     * ((v2 - 1657089211) < 0x1E)) ^ v1)))();
}

void sub_1A2E07634()
{
}

uint64_t sub_1A2E076F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  *a13 = a15;
  if (a11) {
    BOOL v23 = a21 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  int v25 = !v23 && a12 != 0;
  return (*(uint64_t (**)(void))(v22
                              + 8
                              * (int)((v25 * (((471 * (v21 ^ 0x586)) ^ 0xFFFFF239) + (((v21 ^ 0x373) - 1362) | 0x840))) ^ v21 ^ 0x373)))();
}

void sub_1A2E07764(uint64_t a1)
{
  int v1 = 375636451 * ((a1 & 0x668C9593 | ~(a1 | 0x668C9593)) ^ 0xCA4D30E0);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x5571DF7BBE96A381) - 2146378257;
  unsigned int v3 = *(_DWORD *)(a1 + 4) - v1 + 1292428472;
  BOOL v4 = v3 < 0x84C4A394;
  int v5 = v4 ^ (v2 < 0x84C4A394);
  BOOL v6 = v2 < v3;
  if (!v5) {
    LOBYTE(v4) = v6;
  }
  __asm { BRAA            X12, X17 }
}

uint64_t sub_1A2E07884()
{
  int v5 = 31090337 * ((((v4 - 120) | 0xD9736565) + (~(v4 - 120) | 0x268C9A9A)) ^ 0x1EF2052D);
  *(void *)(v4 - 112) = v0;
  *(_DWORD *)(v4 - 104) = (v1 + 2729) ^ v5;
  *(_DWORD *)(v4 - 120) = v3 + v5 + (v1 ^ 0xAE4E973F);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 + 3591)))(v4 - 120);
  return sub_1A2E07904(v6);
}

uint64_t sub_1A2E07904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  *(_DWORD *)(v27 - 108) = (v26 + 1847) ^ (((v27 + 2066845248 - 2 * ((v27 - 120) & 0x7B318EB8)) ^ 0x6D9FD8FC) * v24);
  *(void *)(v27 - 120) = a21;
  *(void *)(v27 - 104) = a23;
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(v23 + 8 * (v26 + 2777)))(v27 - 120);
  return (*(uint64_t (**)(uint64_t))(v23
                                            + 8
                                            * ((221
                                              * (*(_DWORD *)(v27 - 112) + v25 >= ((v26 + 1568246417) & 0xA2867EFF)
                                                                               - 421725457)) ^ v26)))(v28);
}

void sub_1A2E079BC(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *uint64_t v18 = 0x80000000;
  (*(void (**)(uint64_t))(v19 + 8 * (a1 | 0x12EC)))(a18);
  JUMPOUT(0x1A2D4A0A0);
}

uint64_t sub_1A2E079F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,int a32,int a33,uint64_t a34)
{
  *uint64_t v38 = v38[623];
  *(_DWORD *)(v39 - 136) = a31 + v35;
  *(_DWORD *)(v39 - 144) = v35 + a33 - 4;
  *(_DWORD *)(v39 - 140) = a33 - v35;
  *(_DWORD *)(v39 - 120) = v35;
  *(_DWORD *)(v39 - 116) = -641131748 - v35 + v36;
  *(void *)(v39 - 104) = (v37 + 1) - v35;
  *(void *)(v39 - 128) = v35 + 3;
  uint64_t v40 = (*(uint64_t (**)(uint64_t))(v34 + 8 * (v36 - 988427716)))(v39 - 144);
  return (*(uint64_t (**)(uint64_t))(a34 + 8 * *(int *)(v39 - 112)))(v40);
}

uint64_t sub_1A2E07A84(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(v6 - 120) = a5 + 10;
  *(_DWORD *)(v6 - 128) = a5 + 3;
  v7.n128_u64[0] = ((_BYTE)a5 + 9) & 0xF;
  v7.n128_u64[1] = ((_BYTE)a5 + 8) & 0xF;
  v8.n128_u64[0] = ((_BYTE)a5 + 7) & 0xF;
  v8.n128_u64[1] = ((_BYTE)a5 + 6) & 0xF;
  v9.n128_u64[0] = ((_BYTE)a5 + 5) & 0xF;
  v9.n128_u64[1] = ((_BYTE)a5 + 4) & 0xF;
  v10.n128_u64[0] = 0x1717171717171717;
  v10.n128_u64[1] = 0x1717171717171717;
  return sub_1A2E07B74(v5, a1, v7, v8, v9, (__n128)xmmword_1A3032970, v10);
}

uint64_t sub_1A2E07B74(double a1, __n128 a2, __n128 a3, __n128 a4, int8x16_t a5, int8x16_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v76 = (a10 + v67 - a13);
  uint64_t v77 = ((_BYTE)a10 + (_BYTE)v67 - (_BYTE)a13) & 0xF;
  uint64_t v78 = v68;
  v79.i64[0] = vqtbl4q_s8(*(int8x16x4_t *)(&a2 - 1), a5).u64[0];
  v79.i64[1] = vqtbl4q_s8(*(int8x16x4_t *)&v72, a5).u64[0];
  int8x16_t v80 = vrev64q_s8(vmulq_s8(v79, a6));
  *(int8x16_t *)(v69 + v76) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v66 + (v76 & 0xF) - 15), *(int8x16_t *)(a14 + v76)), veorq_s8(*(int8x16_t *)(v64 + (v76 & 0xF) - 15), *(int8x16_t *)((v76 & 0xF) + v65 - 14))), vextq_s8(v80, v80, 8uLL));
  return (*(uint64_t (**)(void))(a64 + 8 * (((v70 + a13 == a11) * v71) ^ a12)))();
}

void sub_1A2E07BF4()
{
}

uint64_t sub_1A2E07D84(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)(a5 + v7 + v8) = a1;
  return (*(uint64_t (**)(void))(v9 + 8 * ((((unint64_t)(v7 + 1 + v8) < 0x40) * v6) ^ v5)))();
}

uint64_t sub_1A2E07DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, int a18, unsigned int a19)
{
  a19 = 2800 - ((&a17 & 0x4F9123D1 | ~(&a17 | 0x4F9123D1)) ^ 0x77EFBC67) * v22;
  a17 = &STACK[0x370A1A23408CA16];
  uint64_t v23 = (*(uint64_t (**)(unint64_t **))(v20 + 40952))(&a17);
  return (*(uint64_t (**)(uint64_t))(v20 + 8 * ((5414 * (a18 == v21)) ^ v19)))(v23);
}

uint64_t sub_1A2E07E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 8 * (v6 ^ 0x1949)))(32, 3984933173);
  unint64_t v8 = STACK[0x2A8];
  STACK[0x448] = v7;
  return (*(uint64_t (**)(void))(v8 + 8 * (((v7 == 0) * ((v6 ^ 0xAB1) + (v6 ^ 0x5E6) - 4050)) ^ v6)))();
}

void sub_1A2E07EA4()
{
}

uint64_t sub_1A2E07F04(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(uint64_t, void))(v5 + 8 * (a3 | (32 * (v3 != v4)))))(a1, a3 ^ 0x7065C094u);
}

void sub_1A2E07F28(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v8 = 3 * (a4 ^ 0x16FB) - v4;
  if ((v5 + 3343) < 0x7FFFFFFF) {
    int v8 = v6;
  }
  *uint64_t v7 = v8;
  JUMPOUT(0x1A2D5905CLL);
}

uint64_t sub_1A2E07F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, uint64_t a15, unsigned int a16, int a17, int a18)
{
  unsigned int v21 = 1314530549
      * ((-1533440695 - (&a13 | 0xA4998D49) + (&a13 | 0x5B6672B6)) ^ 0xEA6FF478);
  a14 = (v19 + 1780979067) ^ v21;
  a13 = &STACK[0x67CF598A0A88719];
  a15 = a10;
  a16 = -1806264698 - v21;
  a18 = v21 ^ 0x13F055B8;
  uint64_t v22 = (*(uint64_t (**)(unint64_t **))(v18 + 8 * (v19 ^ 0x142Cu)))(&a13);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * (((a17 == v19 + 1877361101) * (v20 + (v19 ^ 0x24013366) - 238)) ^ v19)))(v22);
}

uint64_t sub_1A2E08054@<X0>(uint64_t a1@<X2>, unsigned int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47,int a48)
{
  unsigned int v52 = *(_DWORD *)(&a36 + ((v50 + v48) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v50 + v48)) = v52 ^ 0xD6;
  *(unsigned char *)(a1 + (v50 + v48 + 2)) = (BYTE2(v52) ^ 0x70) - ((v52 >> 15) & 6) - 125;
  *(unsigned char *)(a1 + (v50 + v48 + 1)) = (BYTE1(v52) ^ 0x26)
                                                 - ((((v52 >> 8) ^ 0x26) << (((v49 - 53) ^ 0xE) & 0x4F)) & 6)
                                                 - 125;
  *(unsigned char *)(a1 + (v50 + v48 + 3)) = (HIBYTE(v52) ^ 0x17)
                                                 - 2 * ((HIBYTE(v52) ^ 0x17) & 0xB ^ HIBYTE(v52) & 8)
                                                 - 125;
  BOOL v53 = v50 + 943638187 < (a48 + 1189007491);
  if (v50 + 943638187 < a2 != a48 + 1189007491 < a2) {
    BOOL v53 = a48 + 1189007491 < a2;
  }
  return (*(uint64_t (**)(void))(v51 + 8 * ((47 * !v53) ^ v49)))();
}

void sub_1A2E08158(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) ^ (1401278017 * ((-2 - ((a1 | 0xD1E13745) + (~a1 | 0x2E1EC8BA))) ^ 0x2A3DBE5D));
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1A2E08220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  return (*(uint64_t (**)(void))(v22
                              + 8
                              * ((2013
                                * (((v21 + 1885718739) ^ (2 * (a21 - ((2 * a21) & 0x2C086B1A) + 369374605)) & 0xFE2FF694 ^ 0x5C6DAE87)
                                 + ((v21 - 1061828165) & 0x3F4A3BBD ^ (a21 - ((2 * a21) & 0x2C086B1A) + 369374605) ^ 0x6913C7FA) == 2132278090)) ^ v21)))();
}

uint64_t sub_1A2E08304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v32 = v28 + v27;
  unsigned int v33 = v32 + (v29 ^ 0x4008837B);
  if (v33 <= 0x40) {
    unsigned int v33 = 64;
  }
  BOOL v34 = __CFADD__(v32 + 1074299396, v30 + v33);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * ((v34 * ((v29 + 2362) ^ 0xA43)) ^ v29)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

void sub_1A2E08370()
{
  int v2 = 673918253 * ((2 * (((v1 - 192) ^ 0xD489D6F8) & 0xFD19818) - ((v1 - 192) ^ 0xD489D6F8) + 1882089442) ^ 0x3EEFAAB2);
  *(void *)(v1 - 176) = STACK[0x4C8];
  *(_DWORD *)(v1 - 188) = v2 ^ 0xB9244036;
  *(_DWORD *)(v1 - 184) = v0 - 452158241 + v2 + 22;
  JUMPOUT(0x1A2DE6D08);
}

void sub_1A2E083F4(void *a1@<X8>)
{
  *a1 = v1;
  *(void *)(v2 - 0x62E55A5149BFD944) = v1;
  JUMPOUT(0x1A2D3EA08);
}

void sub_1A2E08414()
{
}

void sub_1A2E084C0()
{
}

unsigned char *sub_1A2E084E0(unsigned char *result, unsigned int a2, unint64_t a3)
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

void sub_1A2E08628(int a1@<W8>)
{
  LODWORD(STACK[0x890]) = a1;
  JUMPOUT(0x1A2D22B98);
}

void sub_1A2E0863C()
{
  LODWORD(STACK[0x430]) = v0 - 379;
  JUMPOUT(0x1A2D25408);
}

uint64_t sub_1A2E08654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v33 = v28 + 51384334;
  if ((v28 + 51384334) <= 0x40) {
    int v33 = 64;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * ((63 * (-v30 - 51387495 - v29 + (HIDWORD(a15) ^ 0xD82u) * v32 + v33 < 0xF)) ^ HIDWORD(a15))))(-v30, 2534825757, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

void sub_1A2E09994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E09A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E09D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ICGetCloudDAAPClientPrefix()
{
  if (ICGetCloudDAAPClientPrefix_onceToken != -1) {
    dispatch_once(&ICGetCloudDAAPClientPrefix_onceToken, &__block_literal_global_6160);
  }
  int v0 = (void *)ICGetCloudDAAPClientPrefix_cloudDAAPClientPrefix;

  return v0;
}

id ICCreateLoggableValueForDSID(void *a1)
{
  uint64_t v1 = [a1 stringValue];
  uint64_t v2 = ICCreateLoggableValueForDSIDString(v1);

  return v2;
}

void sub_1A2E0C4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t _ServerJaliscoUpdateInProgressDidChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _serverJaliscoUpdateInProgressDidChange];
}

id ICMusicSubscriptionStatusCapabilitiesGetDescription(int a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"fullCatalogPlayback"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"voiceActivatedCatalogPlayback"];
  if ((a1 & 0x80) != 0) {
LABEL_4:
  }
    [v3 addObject:@"anyCatalogPlayback"];
LABEL_5:
  if ((unint64_t)[v3 count] >= 2)
  {
    int v15 = a1;
    unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EF5F5C40];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v6 length]) {
            [v6 appendString:@","];
          }
          uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"CatalogPlayback" withString:&stru_1EF5F5C40];
          [v6 appendString:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v6 appendString:&stru_1EF5F5C40];
    [v7 removeAllObjects];
    uint64_t v14 = [NSString stringWithFormat:@"catalogPlayback[%@]", v6];
    [v7 addObject:v14];

    a1 = v15;
    if ((v15 & 0x100) == 0)
    {
LABEL_7:
      if ((a1 & 0x200) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((a1 & 0x100) == 0)
  {
    goto LABEL_7;
  }
  [v3 addObject:@"cloudLibraryEligible"];
  if ((a1 & 0x200) == 0)
  {
LABEL_8:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_29:
  [v3 addObject:@"addCatalogContentToCloudLibrary"];
  if ((a1 & 0x10000) != 0) {
LABEL_9:
  }
    [v3 addObject:@"catalogLyricsViewing"];
LABEL_10:
  if (![v3 count]) {
    [v3 addObject:@"none"];
  }
  unint64_t v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

void sub_1A2E0F25C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1A2E160B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E164B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E18A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2E1956C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ICFairPlayGetHardwareInfo(uint64_t a1)
{
  id v2 = (char *)MGCopyAnswer();
  ICFairPlayGetHardwareInfoFromDeviceUDID(v2, a1);
  BOOL v4 = v3 == 0;

  return v4;
}

void ICFairPlayGetHardwareInfoFromDeviceUDID(char *a1, uint64_t a2)
{
  if (a1)
  {
    int v3 = (const char *)[a1 UTF8String];
    size_t v4 = strlen(v3);
    a1 = (char *)v3;
  }
  else
  {
    size_t v4 = 0;
  }

  zxcm2Qme0x((uint64_t)a1, v4, a2);
}

void __CopyHelper(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)a1[1];
  id v35 = a2;
  unint64_t v6 = a1;
  uint64_t v7 = [v5 copyWithZone:a3];
  uint64_t v8 = (void *)*((void *)v35 + 1);
  *((void *)v35 + 1) = v7;

  uint64_t v9 = [(id)v6[2] copyWithZone:a3];
  uint64_t v10 = (void *)*((void *)v35 + 2);
  *((void *)v35 + 2) = v9;

  *((unsigned char *)v35 + 24) = *((unsigned char *)v6 + 24);
  *((unsigned char *)v35 + 25) = *((unsigned char *)v6 + 25);
  uint64_t v11 = [(id)v6[4] copyWithZone:a3];
  uint64_t v12 = (void *)*((void *)v35 + 4);
  *((void *)v35 + 4) = v11;

  uint64_t v13 = [(id)v6[5] copyWithZone:a3];
  uint64_t v14 = (void *)*((void *)v35 + 5);
  *((void *)v35 + 5) = v13;

  uint64_t v15 = [(id)v6[6] copyWithZone:a3];
  long long v16 = (void *)*((void *)v35 + 6);
  *((void *)v35 + 6) = v15;

  uint64_t v17 = [(id)v6[7] copyWithZone:a3];
  long long v18 = (void *)*((void *)v35 + 7);
  *((void *)v35 + 7) = v17;

  uint64_t v19 = [(id)v6[8] copyWithZone:a3];
  int v20 = (void *)*((void *)v35 + 8);
  *((void *)v35 + 8) = v19;

  *((unsigned char *)v35 + 72) = *((unsigned char *)v6 + 72);
  *((unsigned char *)v35 + 73) = *((unsigned char *)v6 + 73);
  uint64_t v21 = [(id)v6[10] copyWithZone:a3];
  uint64_t v22 = (void *)*((void *)v35 + 10);
  *((void *)v35 + 10) = v21;

  *((unsigned char *)v35 + 88) = *((unsigned char *)v6 + 88);
  uint64_t v23 = [(id)v6[12] copyWithZone:a3];
  int v24 = (void *)*((void *)v35 + 12);
  *((void *)v35 + 12) = v23;

  uint64_t v25 = [(id)v6[13] copyWithZone:a3];
  int v26 = (void *)*((void *)v35 + 13);
  *((void *)v35 + 13) = v25;

  uint64_t v27 = [(id)v6[14] copyWithZone:a3];
  int v28 = (void *)*((void *)v35 + 14);
  *((void *)v35 + 14) = v27;

  uint64_t v29 = [(id)v6[15] copyWithZone:a3];
  int v30 = (void *)*((void *)v35 + 15);
  *((void *)v35 + 15) = v29;

  objc_storeStrong((id *)v35 + 16, (id)v6[16]);
  *((unsigned char *)v35 + 136) = *((unsigned char *)v6 + 136);
  *((unsigned char *)v35 + 137) = *((unsigned char *)v6 + 137);
  uint64_t v31 = [(id)v6[18] copyWithZone:a3];
  int v32 = (void *)*((void *)v35 + 18);
  *((void *)v35 + 18) = v31;

  uint64_t v33 = [(id)v6[19] copyWithZone:a3];
  BOOL v34 = (void *)*((void *)v35 + 19);
  *((void *)v35 + 19) = v33;

  LOBYTE(a3) = *((unsigned char *)v6 + 160);
  *((unsigned char *)v35 + 160) = a3;
}

void sub_1A2E1EF8C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2E1EFA0(_Unwind_Exception *a1)
{
}

void sub_1A2E200AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t _ICURLResponseAuthenticationProviderIsAllowedForClassName(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (_ICURLResponseAuthenticationProviderIsAllowedForClassName_sAllowableAuthenticationProviderClassNamesOnceToken != -1)
  {
    dispatch_once(&_ICURLResponseAuthenticationProviderIsAllowedForClassName_sAllowableAuthenticationProviderClassNamesOnceToken, &__block_literal_global_18891);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = [(id)_ICURLResponseAuthenticationProviderIsAllowedForClassName_sAllowableAuthenticationProviderClassNames containsObject:v2];
LABEL_6:

  return v3;
}

id ICDefaultCacheDirectory()
{
  int v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v1 = [v0 firstObject];

  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v1, @"Caches", @"com.apple.iTunesCloud", 0);
  uint64_t v3 = [NSString pathWithComponents:v2];

  return v3;
}

void sub_1A2E2805C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E29124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2E2B648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ICURLResponseStatusCodeGetExtendedDescription(uint64_t a1)
{
  id v2 = ICURLResponseStatusCodeGetDescription(a1);
  uint64_t v3 = [NSString stringWithFormat:@"%@ (%ld)", v2, a1];

  return v3;
}

__CFString *ICURLResponseStatusCodeGetDescription(uint64_t a1)
{
  if (a1 <= 398)
  {
    if (a1 > 298)
    {
      switch(a1)
      {
        case 299:
          return @"Success Range End";
        case 300:
          return @"Multiple Choices";
        case 304:
          return @"Not Modified";
      }
    }
    else
    {
      switch(a1)
      {
        case 200:
          return @"OK";
        case 204:
          return @"No Content";
        case 206:
          return @"Partial Content";
      }
    }
    return @"Unknown";
  }
  else
  {
    switch(a1)
    {
      case 499:
        uint64_t result = @"Client Error Range End";
        break;
      case 500:
        uint64_t result = @"Internal Server Error";
        break;
      case 501:
        uint64_t result = @"Not Implemented";
        break;
      case 502:
        uint64_t result = @"Bad Gateway";
        break;
      case 503:
        uint64_t result = @"Service Unavailable";
        break;
      default:
        if (a1 != 599) {
          return @"Unknown";
        }
        uint64_t result = @"Server Error Range End";
        break;
    }
  }
  return result;
}

void sub_1A2E2D8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E32130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

__CFString *ICCreateLoggableValueForDSIDString(void *a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    size_t v4 = @"nil";
    goto LABEL_52;
  }
  id v2 = +[ICDeviceInfo currentDeviceInfo];
  char v3 = [v2 isInternalBuild];

  size_t v4 = (__CFString *)v1;
  if (v3) {
    goto LABEL_52;
  }
  memset(v56, 0, sizeof(v56));
  CC_SHA1_Init((CC_SHA1_CTX *)v56);
  uint64_t v5 = v4;
  CC_SHA1_Update((CC_SHA1_CTX *)v56, (const void *)[(__CFString *)v5 UTF8String], [(__CFString *)v5 length]);

  memset(&v57[8], 0, 64);
  *(void *)uint64_t v57 = 4001;
  CC_SHA1_Final(&v57[8], (CC_SHA1_CTX *)v56);
  v58[0] = *(_OWORD *)v57;
  v58[1] = *(_OWORD *)&v57[16];
  v58[2] = *(_OWORD *)&v57[32];
  v58[3] = *(_OWORD *)&v57[48];
  uint64_t v59 = *(void *)&v57[64];
  if (*(uint64_t *)v57 > 3999)
  {
    if (*(uint64_t *)v57 > 4255)
    {
      if (*(void *)v57 == 4256)
      {
        uint64_t v47 = (unsigned __int8 *)v58 + 8;
        int v48 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        int v49 = v48;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v51 = *v47++;
          unsigned int v52 = &v48[i];
          *unsigned int v52 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v51 >> 4];
          v52[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v51 & 0xF];
        }
        id v18 = [NSString alloc];
        uint64_t v19 = v49;
        uint64_t v20 = 64;
      }
      else
      {
        if (*(void *)v57 != 4512) {
          goto LABEL_55;
        }
        uint64_t v25 = (unsigned __int8 *)v58 + 8;
        int v26 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v27 = v26;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v29 = *v25++;
          int v30 = &v26[j];
          *int v30 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v29 >> 4];
          v30[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v29 & 0xF];
        }
        id v18 = [NSString alloc];
        uint64_t v19 = v27;
        uint64_t v20 = 128;
      }
    }
    else if (*(void *)v57 == 4000)
    {
      int v37 = (unsigned __int8 *)v58 + 8;
      uint64_t v38 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v39 = v38;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v41 = *v37++;
        unint64_t v42 = &v38[k];
        *unint64_t v42 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v41 >> 4];
        v42[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v41 & 0xF];
      }
      id v18 = [NSString alloc];
      uint64_t v19 = v39;
      uint64_t v20 = 32;
    }
    else
    {
      if (*(void *)v57 != 4001) {
        goto LABEL_55;
      }
      uint64_t v12 = (unsigned __int8 *)v58 + 8;
      uint64_t v13 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v14 = v13;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v16 = *v12++;
        uint64_t v17 = &v13[m];
        *uint64_t v17 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v16 >> 4];
        v17[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v16 & 0xF];
      }
      id v18 = [NSString alloc];
      uint64_t v19 = v14;
      uint64_t v20 = 40;
    }
LABEL_49:
    CFStringRef v36 = (CFStringRef)objc_msgSend(v18, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v19, v20, 4, 1, 4001, *(void *)v56);
    goto LABEL_50;
  }
  if (*(uint64_t *)v57 > 2999)
  {
    if (*(void *)v57 == 3000)
    {
      LODWORD(v60[0]) = bswap32(DWORD2(v58[0]));
      uint64_t v43 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v44 = 0;
      unint64_t v45 = v43 + 1;
      do
      {
        unint64_t v46 = *((unsigned __int8 *)v60 + v44);
        *(v45 - 1) = MSVFastHexStringFromBytes_hexCharacters_41692[v46 >> 4];
        *unint64_t v45 = MSVFastHexStringFromBytes_hexCharacters_41692[v46 & 0xF];
        v45 += 2;
        ++v44;
      }
      while (v44 != 4);
      id v18 = [NSString alloc];
      uint64_t v19 = v43;
      uint64_t v20 = 8;
    }
    else
    {
      if (*(void *)v57 != 3001) {
        goto LABEL_55;
      }
      v60[0] = bswap64(*((unint64_t *)&v58[0] + 1));
      uint64_t v21 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v22 = 0;
      uint64_t v23 = v21 + 1;
      do
      {
        unint64_t v24 = *((unsigned __int8 *)v60 + v22);
        *(v23 - 1) = MSVFastHexStringFromBytes_hexCharacters_41692[v24 >> 4];
        *uint64_t v23 = MSVFastHexStringFromBytes_hexCharacters_41692[v24 & 0xF];
        v23 += 2;
        ++v22;
      }
      while (v22 != 8);
      id v18 = [NSString alloc];
      uint64_t v19 = v21;
      uint64_t v20 = 16;
    }
    goto LABEL_49;
  }
  if (*(void *)v57 == 1000)
  {
    uint64_t v31 = *((void *)&v58[0] + 1);
    int v32 = (char *)&v61 + 1;
    uint64_t quot = *((void *)&v58[0] + 1);
    do
    {
      lldiv_t v34 = lldiv(quot, 10);
      uint64_t quot = v34.quot;
      if (v34.rem >= 0) {
        LOBYTE(v35) = v34.rem;
      }
      else {
        uint64_t v35 = -v34.rem;
      }
      *(v32 - 2) = v35 + 48;
      uint64_t v11 = (const UInt8 *)(v32 - 2);
      --v32;
    }
    while (v34.quot);
    if (v31 < 0)
    {
      *(v32 - 2) = 45;
      uint64_t v11 = (const UInt8 *)(v32 - 2);
    }
    uint64_t v10 = (char *)((char *)&v61 - (char *)v11);
    goto LABEL_39;
  }
  if (*(void *)v57 != 2000)
  {
LABEL_55:
    unint64_t v54 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 4001, *(void *)v56);
    unint64_t v55 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
    [v54 handleFailureInFunction:v55 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

    size_t v4 = &stru_1EF5F5C40;
    goto LABEL_51;
  }
  uint64_t v6 = DWORD2(v58[0]);
  uint64_t v7 = &v61;
  do
  {
    ldiv_t v8 = ldiv(v6, 10);
    uint64_t v6 = v8.quot;
    if (v8.rem >= 0) {
      LOBYTE(v9) = v8.rem;
    }
    else {
      uint64_t v9 = -v8.rem;
    }
    *((unsigned char *)v7 - 1) = v9 + 48;
    uint64_t v7 = (uint64_t *)((char *)v7 - 1);
  }
  while (v8.quot);
  uint64_t v10 = (char *)((char *)&v61 - (char *)v7);
  uint64_t v11 = (const UInt8 *)v7;
LABEL_39:
  CFStringRef v36 = CFStringCreateWithBytes(0, v11, (CFIndex)v10, 0x8000100u, 0);
LABEL_50:
  size_t v4 = (__CFString *)v36;
LABEL_51:

LABEL_52:

  return v4;
}

Class __getCWFInterfaceClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __CoreWiFiLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5ACD510;
    uint64_t v8 = 0;
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    size_t v4 = [NSString stringWithUTF8String:"void *CoreWiFiLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"ICEnvironmentMonitor.m", 46, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CWFInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getCWFInterfaceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICEnvironmentMonitor.m", 47, @"Unable to find class %s", "CWFInterface");

LABEL_10:
    __break(1u);
  }
  getCWFInterfaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A2E35940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2E384D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A2E38E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E399C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a29);
  _Unwind_Resume(a1);
}

void sub_1A2E3A0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2E3A360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E3A4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E3AC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2E3AF78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A2E3B478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2E3B860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2E3BC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t ICSystemApplicationIsInstalled(uint64_t a1)
{
  id v1 = ICBundleIdentifierForSystemApplicationType(a1);
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v1 allowPlaceholder:1 error:0];
  char v3 = [v2 applicationState];
  uint64_t v4 = [v3 isValid];

  return v4;
}

uint64_t ICCloudServerSupportedServiceForName(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  id v2 = _ICCloudServerSupportedServiceGetNamesBidirectionalDictionary();
  char v3 = [v2 keyForObject:v1];

  if (v3) {
    uint64_t v4 = [v3 integerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

id ICBundleIdentifierForSystemApplicationType(uint64_t a1)
{
  if (ICBundleIdentifierForSystemApplicationType_onceToken != -1) {
    dispatch_once(&ICBundleIdentifierForSystemApplicationType_onceToken, &__block_literal_global_31312);
  }
  id v2 = (void *)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap;
  char v3 = [NSNumber numberWithInteger:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v7 = [NSString stringWithUTF8String:"NSString * _Nonnull ICBundleIdentifierForSystemApplicationType(ICSystemApplicationType)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"ICSystemApplication.m", 44, @"No bundle identifier defined for application type %d", a1);
  }

  return v4;
}

id ICCloudServerSupportedServiceGetName(uint64_t a1)
{
  id v2 = _ICCloudServerSupportedServiceGetNamesBidirectionalDictionary();
  char v3 = [NSNumber numberWithInteger:a1];
  uint64_t v4 = [v2 objectForKey:v3];

  return v4;
}

id _ICCloudServerSupportedServiceGetNamesBidirectionalDictionary()
{
  if (_ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_sCloudServerSupportedServiceNamesOnceToken != -1) {
    dispatch_once(&_ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_sCloudServerSupportedServiceNamesOnceToken, &__block_literal_global_11568);
  }
  int v0 = (void *)_ICCloudServerSupportedServiceGetNamesBidirectionalDictionary_sCloudServerSupportedServiceNames;

  return v0;
}

BOOL ICCurrentApplicationIsSystemApp(uint64_t a1)
{
  id v2 = +[ICClientInfo defaultInfo];
  char v3 = [v2 bundleIdentifier];
  BOOL v4 = ICSystemApplicationTypeForBundleIdentifier(v3) == a1;

  return v4;
}

uint64_t ICSystemApplicationTypeForBundleIdentifier(void *a1)
{
  id v1 = a1;
  if (ICSystemApplicationTypeForBundleIdentifier_onceToken != -1) {
    dispatch_once(&ICSystemApplicationTypeForBundleIdentifier_onceToken, &__block_literal_global_47);
  }
  id v2 = [(id)ICSystemApplicationTypeForBundleIdentifier___bundleIdentifierToSystemTypeMap objectForKeyedSubscript:v1];
  char v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = -1;
  }

  return v4;
}

void sub_1A2E3FE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E40124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E402A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E4388C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

BOOL ICEnvironmentNetworkTypeIsWiFi(uint64_t a1)
{
  return (unint64_t)(a1 - 1000) < 0x3E8;
}

void __ICGetCloudDAAPClientPrefix_block_invoke()
{
  id v1 = +[ICDeviceInfo currentDeviceInfo];
  if ([v1 isAppleTV]) {
    int v0 = @"ATV-";
  }
  else {
    int v0 = @"iOS-";
  }
  objc_storeStrong((id *)&ICGetCloudDAAPClientPrefix_cloudDAAPClientPrefix, v0);
}

uint64_t __ICSystemApplicationTypeForBundleIdentifier_block_invoke()
{
  ICSystemApplicationTypeForBundleIdentifier___bundleIdentifierToSystemTypeMap = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1EF640BB8];

  return MEMORY[0x1F41817F8]();
}

void __ICBundleIdentifierForSystemApplicationType_block_invoke()
{
  v9[5] = *MEMORY[0x1E4F143B8];
  int v0 = (void *)MEMORY[0x1E4F1CA60];
  v8[0] = &unk_1EF640A80;
  v8[1] = &unk_1EF640A98;
  v9[0] = @"com.apple.Music";
  v9[1] = @"com.apple.tv";
  void v8[2] = &unk_1EF640AB0;
  v8[3] = &unk_1EF640AC8;
  void v9[2] = @"com.apple.iBooks";
  v9[3] = @"com.apple.podcasts";
  v8[4] = &unk_1EF640AE0;
  v9[4] = @"com.apple.AppStore";
  id v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  uint64_t v2 = [v0 dictionaryWithDictionary:v1];
  char v3 = (void *)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap;
  ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap = v2;

  uint64_t v4 = +[ICDeviceInfo currentDeviceInfo];
  if ([v4 isWatch])
  {
    [(id)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap setObject:@"com.apple.NanoMusic" forKeyedSubscript:&unk_1EF640A80];
    uint64_t v5 = (void *)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap;
    uint64_t v6 = @"com.apple.NanoBooks";
    long long v7 = &unk_1EF640AB0;
LABEL_5:
    [v5 setObject:v6 forKeyedSubscript:v7];
    goto LABEL_6;
  }
  if ([v4 isAppleTV])
  {
    [(id)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap setObject:@"com.apple.TVMusic" forKeyedSubscript:&unk_1EF640A80];
    uint64_t v5 = (void *)ICBundleIdentifierForSystemApplicationType___systemTypeToBundleIdentifierMap;
    uint64_t v6 = @"com.apple.TVWatchList";
    long long v7 = &unk_1EF640A98;
    goto LABEL_5;
  }
LABEL_6:
}

void sub_1A2E48D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A2E492A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1A2E49900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ICDAAPUtilitiesCreateData(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v7 = [NSString stringWithUTF8String:"NSData * _Nonnull ICDAAPUtilitiesCreateData(void (^__strong _Nonnull)(DKDAAPWriter *__strong))"];
    [v6 handleFailureInFunction:v7, @"ICDAAPUtilities.m", 12, @"Invalid parameter not satisfying: %@", @"block" file lineNumber description];
  }
  uint64_t v2 = [MEMORY[0x1E4F1CAA8] outputStreamToMemory];
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F5E540]) initWithStream:v2];
  v1[2](v1, v3);
  [v3 close];
  uint64_t v4 = [v2 propertyForKey:*MEMORY[0x1E4F1C4C0]];

  return v4;
}

__CFString *ICCloudClientGetStringForRequestReason(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      Class result = @"unknown reason";
      break;
    case 1:
      Class result = @"initial load";
      break;
    case 2:
      Class result = @"push notification";
      break;
    case 3:
      Class result = @"user initiated poll";
      break;
    case 4:
      Class result = @"periodic poll";
      break;
    case 5:
      Class result = @"periodic reload";
      break;
    case 6:
      Class result = @"user initiated reload";
      break;
    case 7:
      Class result = @"app launch poll";
      break;
    case 8:
      Class result = @"edit initiated poll";
      break;
    case 9:
      Class result = @"edit error reload";
      break;
    case 10:
      Class result = @"subscribed playlist periodic poll";
      break;
    case 11:
      Class result = @"subscribed playlist TTL refresh";
      break;
    case 12:
      Class result = @"subscribed playlist manual refresh";
      break;
    default:
      uint64_t v2 = @"supported sync media types changed";
      if (a1 != 1001) {
        uint64_t v2 = 0;
      }
      if (a1 == 1000) {
        Class result = @"deferred push notification";
      }
      else {
        Class result = v2;
      }
      break;
  }
  return result;
}

void sub_1A2E4C170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *OnBoardingKitLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5ACA3F8;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  int v0 = (void *)OnBoardingKitLibraryCore_frameworkLibrary;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    int v0 = [MEMORY[0x1E4F28B00] currentHandler];
    char v3 = [NSString stringWithUTF8String:"void *OnBoardingKitLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICPrivacyInfo.m", 45, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1A2E4D0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2E4DB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t ICCloudClientMigrateStoreAllowAutomaticDownloadsOnCellularToMusicAllowDownloadOnCellular()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = CFPreferencesGetAppBooleanValue(@"HasMigratedMusicDownloadsOnCellularDataSwitch", @"com.apple.mobileipod", 0);
  if (!result)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(@"AllowsCellularDataDownloads", @"com.apple.Music", &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      Boolean v4 = 0;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", &v4);
      if (v4)
      {
        int v2 = AppBooleanValue;
        char v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          BOOL v7 = v2 != 0;
          _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "MIGRATION: migrating store auto download setting to music download setting: %d", buf, 8u);
        }

        CFPreferencesSetAppValue(@"AllowsCellularDataDownloads", (CFPropertyListRef)[NSNumber numberWithBool:v2 != 0], @"com.apple.Music");
        CFPreferencesAppSynchronize(@"com.apple.Music");
        notify_post("com.apple.Music-AllowsCellularDataDownloads");
      }
    }
    CFPreferencesSetAppValue(@"HasMigratedMusicDownloadsOnCellularDataSwitch", MEMORY[0x1E4F1CC38], @"com.apple.mobileipod");
    return CFPreferencesAppSynchronize(@"com.apple.mobileipod");
  }
  return result;
}

void ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular()
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!CFPreferencesGetAppBooleanValue(@"HasMigratedMusicMatchCellularDataSwitch", @"com.apple.mobileipod", 0))
  {
    uint64_t v33 = 0;
    lldiv_t v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
    id v1 = +[ICUserIdentityStore defaultIdentityStore];
    int v2 = +[ICUserIdentity activeLockerAccount];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular_block_invoke;
    v30[3] = &unk_1E5AC7850;
    int v32 = &v33;
    char v3 = v0;
    uint64_t v31 = v3;
    [v1 getPropertiesForUserIdentity:v2 completionHandler:v30];

    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowMatchOnCellular", @"com.apple.mobileipod", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v5 = AppBooleanValue == 0;
    }
    else {
      BOOL v5 = 0;
    }
    int v6 = !v5;
    uint64_t v23 = 0;
    unint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    int v26 = __Block_byref_object_copy__4222;
    uint64_t v27 = __Block_byref_object_dispose__4223;
    id v28 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular_block_invoke_2;
    v20[3] = &unk_1E5AC9078;
    uint64_t v22 = &v23;
    uint64_t v9 = v7;
    uint64_t v21 = v9;
    objc_msgSend(v8, "ic_activeStoreAccountWithCompletion:", v20);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v10 = [(id)v24[5] count];
    int v11 = CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0);
    int v12 = v11;
    uint64_t v13 = 0;
    if (*((unsigned char *)v34 + 24)) {
      int v14 = v6;
    }
    else {
      int v14 = 1;
    }
    if (v10) {
      BOOL v15 = v11 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    char v16 = !v15;
    if (v14 == 1 && (v16 & 1) != 0)
    {
      if (v10) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = v6;
      }
      if (*((unsigned char *)v34 + 24)) {
        uint64_t v13 = v17;
      }
      else {
        uint64_t v13 = v11 != 0;
      }
    }
    id v18 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *((unsigned __int8 *)v34 + 24);
      *(_DWORD *)buf = 67110144;
      int v38 = v19;
      __int16 v39 = 1024;
      int v40 = v6;
      __int16 v41 = 1024;
      BOOL v42 = v10 != 0;
      __int16 v43 = 1024;
      BOOL v44 = v12 != 0;
      __int16 v45 = 1024;
      int v46 = v13;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "MIGRATION: isMatchAuthenticated: %d, isMatchCellularDataEnabled: %d, hasAutomaticDownloads: %d, isAutomaticDownloadCellularDataEnabled: %d. New cellular data state: %d", buf, 0x20u);
    }

    CFPreferencesSetAppValue(@"AllowAutoDownloadOnCellular", (CFPropertyListRef)[NSNumber numberWithBool:v13], @"com.apple.itunesstored");
    CFPreferencesAppSynchronize(@"com.apple.itunesstored");
    CFPreferencesSetAppValue(@"HasMigratedMusicMatchCellularDataSwitch", MEMORY[0x1E4F1CC38], @"com.apple.mobileipod");
    CFPreferencesAppSynchronize(@"com.apple.mobileipod");
    notify_post("com.apple.itunesstored.autodownloaddefaultschange");

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v33, 8);
  }
}

void sub_1A2E50FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_1A2E519E4(mach_port_t a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  int v15 = 1;
  uint64_t v16 = a2;
  int v17 = 16777472;
  int v18 = a3;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  int v20 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = reply_port;
  v14.msgh_bits = -2147478253;
  *(void *)&v14.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1E4F14B18])
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

uint64_t jkag7Bg01u(uint64_t a1, uint64_t a2)
{
  if (unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8))) {
    __asm { BRAA            X8, X17 }
  }
  return 4294922295;
}

void sub_1A2E520E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _DWORD *a15, uint64_t a16, int a17, int a18)
{
  *(void *)(v21 - 208) = v18;
  uint64_t v22 = *(void **)(v21 - 136);
  (*(void (**)(void))(v19 + 8 * (v20 ^ (v20 - 1871))))(*v22);
  *uint64_t v22 = a14;
  *a15 = a18;
  JUMPOUT(0x1A2E52128);
}

uint64_t sub_1A2E521C8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)((((((v0 - 410) | 0x119) ^ 0xFFFFFE3A) + v0 - 132) * (v1 == 0)) ^ v0)))();
}

uint64_t sub_1A2E52208()
{
  unsigned int v3 = ((v0 - 82150104) & 0x4E585D9) - 437759 + *(_DWORD *)(v1 + 12) - 1044;
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 1123084877;
  BOOL v5 = v3 < 0xFFF95201;
  BOOL v6 = v3 > v4;
  if (v4 < 0xFFF95201 != v5) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((63 * !v6) ^ v0)))();
}

uint64_t sub_1A2E52290@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v31 = *(void *)(v30 - 144);
  int v32 = v27 + 3;
  *(void *)(v30 - 144) = v31;
  uint64_t v33 = *(void *)(v31 - 0x3B66C28959A1DD8DLL);
  unsigned int v34 = ((2 * a9) & 0x7FAEFDDE) + (a9 ^ 0xBFD77EEF);
  *(unsigned char *)(v33 + v34 + (v32 ^ 0x40288008)) = -123;
  v34 += 1076396040;
  *(unsigned char *)(v33 + v34 + 266) = -2;
  *(unsigned char *)(v33 + v34 + 267) = 99;
  *(unsigned char *)(v33 + v34 + 268) = -80;
  *a1 += 4;
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((v32 + 554792680) | 0x5E208106) ^ (v29 + 950) ^ v32)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E52570()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v1 - 1569420586) & 0x5D8B77FA) + ((v1 + 247399078) & 0xF140FEEF) - 1659)
                                     * (v0 == 0)) ^ (v1 + 1549))))();
}

uint64_t sub_1A2E525D0()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1642909503;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 1529410671;
  BOOL v5 = v3 < 0x9E1330BD;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < (((v0 - 1000) | 0x234) ^ 0x9E132B7A) + 15 * (v0 ^ 0x395)) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1050 * v6) ^ v0)))();
}

uint64_t sub_1A2E52660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  HIDWORD(a25) = v25;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((((v26 - 1367) | 0x40) ^ (v26 - 1313)) * (v27 != 0)) | v26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A2E526A0()
{
  unsigned int v3 = v0 - 1793147892;
  BOOL v4 = (v0 - 1793147892) < 0xD808F856;
  unsigned int v5 = (((2 * v1) ^ 0xA5F7FD48) & (2 * (2 * v0 + 2049673060))) + ((2 * v0 + 2049673060) ^ 0x52FBFCFE);
  if (v4 != v5 - 2062746792 < 0xD808F856) {
    BOOL v6 = v5 - 2062746792 < 0xD808F856;
  }
  else {
    BOOL v6 = v5 - 2062746792 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((367 * v6) ^ v1)))();
}

uint64_t sub_1A2E52748@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v30 = *(void *)(v29 - 144);
  int v31 = (v26 - 11) | 0x84;
  *(void *)(v29 - 144) = v30;
  uint64_t v32 = *(void *)(v30 - 0x3B66C28959A1DD8DLL);
  unsigned int v33 = (a9 ^ 0x6BDF3CEF) - 1809792925 + ((2 * a9) & 0xD7BE79DE);
  *(unsigned char *)(v32 + v33 + 686) = 0;
  *(unsigned char *)(v32 + v33 + v31) = 0;
  *(unsigned char *)(v32 + v33 + 688) = 0;
  *(unsigned char *)(v32 + v33 + 689) = 1;
  *a1 += 4;
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * ((v31 - 197) ^ (v28 + 143) ^ v31 ^ (v28 + 673) ^ v31)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A2E5290C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((3 * (v0 ^ 0xB7) - 52) * (v1 == 0)) ^ v0)))();
}

uint64_t sub_1A2E52948()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + 1189778007;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 67130881;
  BOOL v5 = v3 < (v0 ^ 0x61Eu) + 1189777478;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x46EA924F) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((49 * !v6) ^ v0)))();
}

uint64_t sub_1A2E529C8@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v30 = *(void *)(v29 - 144);
  uint64_t v31 = (v25 - 240);
  unint64_t v32 = v26 - ((v31 ^ 0xF99431D3CA63CD40) & (2 * v26)) + 0x7CCA18E9E531E62CLL;
  *(void *)(v29 - 144) = v30;
  unsigned int v33 = (unsigned char *)(*(void *)(v30 - 0x3B66C28959A1DD8DLL)
                + ((2 * a9) & 0x1F6BAFABALL)
                + (a9 ^ 0x67AF3FFFFB5D7D5DLL)
                - 0x67AF3FFFFB5D7D5DLL);
  *unsigned int v33 = HIBYTE(v32) ^ 0x7C;
  v33[1] = BYTE6(v32) ^ 0xCA;
  v33[2] = BYTE5(v32) ^ 0x18;
  v33[3] = BYTE4(v32) ^ 0xE9;
  v33[4] = ((v26 - ((v31 ^ 0xCA63CD40) & (2 * v26)) - 449714644) >> 24) ^ 0xE5;
  v33[5] = ((v26 - ((v31 ^ 0xCA63CD40) & (2 * v26)) - 449714644) >> 16) ^ 0x31;
  v33[6] = ((unsigned __int16)(v26 - ((v31 ^ 0xCD40) & (2 * v26)) - 6612) >> 8) ^ 0xE6;
  v33[7] = v32 ^ 0x2C;
  *a1 += 8;
  return (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (int)(v31 ^ (v28 - 233) ^ (v28 + 1628) ^ ((v31 - 279) | 0x61C) ^ v31)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A2E52D20()
{
  *(void *)(v4 - 120) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((46 * (((v1 == 0) ^ (v3 + v0)) & 1)) ^ v0)))();
}

uint64_t sub_1A2E52D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v32 = v28 ^ 0x5A8;
  uint64_t v33 = (*(uint64_t (**)(void))(v29 + 8 * ((v28 ^ 0x5A8) + 1387)))();
  (*(void (**)(uint64_t, char *, void, void))(v29 + 8 * (v32 ^ 0xB5F)))(v33, (char *)*(&off_1E5AC6910 + (v32 ^ 0x3B3)) - 3, **(void **)(v31 - 136), *(unsigned int *)(*(void *)(v31 - 136) + 12));
  uint64_t v34 = (*(uint64_t (**)(void, void))(v29 + 8 * (v32 ^ 0xB49)))(*(void *)(v31 - 160), 0);
  *(void *)(v31 - 184) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v34 == 0) * ((v32 + 2134898241) & 0xFFF1FF0F ^ (v30 + 2))) ^ v32)))(v34, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_1A2E52E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  *(void *)(v29 - 192) = a1;
  uint64_t v30 = (*(uint64_t (**)(void, void, void))(v28 + 8 * (v27 + 1358)))(*(void *)(v29 - 160), *(void *)(v29 - 192), 0);
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((((v30 == 0) ^ (v27 - 47)) & 1) * (((v27 + 2147219409) ^ 0x7FFBFA0C) - 268)) ^ (v27 - 247)));
  *(void *)(v29 - 184) = *(void *)(v29 - 192);
  return v31(v30, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E52EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  (*(void (**)(uint64_t, char *))(v37 + 8 * (v36 ^ 0x8B8)))(a1, (char *)*(&off_1E5AC6910 + v36 - 364) - 12);
  (*(void (**)(uint64_t))(v37 + 8 * (v36 + 1830)))(a1);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v36 ^ 0x8A7)))(a1, a36);
  uint64_t v39 = (void *)(*(uint64_t (**)(void))(v37 + 8 * (v36 + 1927)))();
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (int)(((v39 == *(&off_1E5AC6910 + (v36 ^ 0x181))) * ((v36 + 497444452) & 0xE2599FFF ^ ((v36 ^ 0xA4) + 188))) ^ v36)))(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A2E52F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  return (*(uint64_t (**)(void))(v31
                              + 8
                              * (((a31 == (void)*(&off_1E5AC6910 + v32 - 284) - 8)
                                * (5 * (v32 ^ 0x160) + ((v32 + 2133981144) ^ 0x7F31FEA1))) ^ v32)))();
}

uint64_t sub_1A2E52FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v38 ^ 0x8A7)))(a28, a36);
  uint64_t v39 = (*(uint64_t (**)(void))(v37 + 8 * (v38 ^ 0x899)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (((v39 == v36) * ((((v38 - 1633085932) & 0x6156EF60) + 239) ^ 0x560)) ^ v38)))(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A2E53064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  return (*(uint64_t (**)(void))(v32
                              + 8
                              * ((((v33 ^ 0x7F31FE07) - 2133979208 + ((v33 - 8035729) & 0x7A97FF) - 2600) * (a31 == v31)) ^ v33)))();
}

uint64_t sub_1A2E530D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v38 + 1981)))(a28, a36);
  uint64_t v39 = (*(uint64_t (**)(void))(v37 + 8 * (v38 + 1955)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * ((228 * (((v38 + 52) ^ (v39 == v36)) & 1)) ^ v38)))(v39, v40, v41, v42, v43, v44, v45, v46, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A2E53130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 8 * (v33 + 295)))(a31, v32, v34 - 120);
  uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (((((v33 + 24) ^ (v35 == 0)) & 1) * ((v33 - 339) ^ 0x684)) ^ v33));
  *(void *)(v34 - 200) = 0x50417EF54FC55D4FLL;
  return v36(v35, v37, v38, v39, v40, v41, v42, v43);
}

uint64_t sub_1A2E531B8()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 + 623)))(24, 4101018099);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (((v3 == 0) * (((v0 + 254851689) | 0x70013802) ^ 0x7F31FE07 ^ ((v0 - 658) | 0x330))) ^ v0));
  *(void *)(v2 - 200) = 0x50417EF54FC55D4FLL;
  return v4(v3, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1A2E53254(uint64_t a1)
{
  *(void *)(v3 - 176) = a1 + 0x50417EF54FC55D4FLL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 917342576;
  *(_DWORD *)(a1 + 12) = 437737774;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 ^ 0xE31)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v1 - 1) ^ (v5 == 0)) & 1) * (((v1 - 1786) | 0x482) - 1212)) ^ v1)))();
}

uint64_t sub_1A2E532E8()
{
  *(_DWORD *)(v3 + 8) = v1 + 4096;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 + 37) ^ (*(void *)(v4 - 120) > (unint64_t)(v1 - 917338480))) & 1)
                                * ((v0 - 1038699979) & 0x3DE94D9F ^ 0x491)) ^ v0)))();
}

uint64_t sub_1A2E53360@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  *(void *)(v28 - 200) = 0x50417EF54FC55D4FLL;
  *(void *)(v28 - 184) = *(void *)(v28 - 192);
  uint64_t v29 = *(void *)(v28 - 176);
  *(void *)(v28 - 176) = v29;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (int)(((a16 <= *(void *)(v29 - 0x50417EF54FC55D4FLL)) * ((a8 & 0xBE1EC43B ^ 0x289) + 326 + 3 * (a8 & 0xBE1EC43B ^ 0x14C) - 1996)) ^ a8 & 0xBE1EC43B ^ 0x289)))(*(void *)(v29 - 0x50417EF54FC55D4FLL), a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, v29, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

void sub_1A2E5398C()
{
  uint64_t v2 = *(void *)(v1 - 176);
  *(_DWORD *)(v2 - 0x50417EF54FC55D47) = (*(_DWORD *)(v1 - 120) ^ 0x3EFDEB73)
                                         - 139485699
                                         + ((2 * *(_DWORD *)(v1 - 120)) & 0x7DFBD6E6);
  *(_DWORD *)(v2 - 0x50417EF54FC55D43) = 437737774;
  *(void *)(v1 - 152) = v0;
  uint64_t v3 = *(void *)(v1 - 184);
  *(void *)(v1 - 200) = v2;
  *(void *)(v1 - 192) = v3;
  JUMPOUT(0x1A2E53A0CLL);
}

uint64_t sub_1A2E53A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v36 = (*(uint64_t (**)(void))(v33 + 8 * v34))();
  uint64_t v37 = *(uint64_t (**)(uint64_t))(v33 + 8 * ((v32 - 504) ^ ((2 * (a31 == 0)) | (8 * (a31 == 0)))));
  *(void *)(v35 - 184) = v31;
  return v37(v36);
}

uint64_t sub_1A2E53ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v39 = (*(uint64_t (**)(uint64_t))(v34 + 8 * (*(_DWORD *)(v38 - 168) ^ v31)))(a31);
  uint64_t v40 = *(void *)(v38 - 136);
  *(void *)(v38 - 184) = v32;
  if (v35 == -45004)
  {
    *(void *)(v38 - 176) = v33;
    *(void *)(v38 - 128) = 0;
    *(_DWORD *)(v38 - 112) = 0;
    uint64_t v41 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v34 + 8 * (v37 ^ (v37 - 2278))))(*(unsigned int *)*(&off_1E5AC6910 + (v37 ^ (v37 + 8))), *(void *)v40, *(unsigned int *)(v40 + 12), v38 - 128, v38 - 112);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((1119 * ((v41 ^ 0x4FDFFACD) - 92409924 + ((2 * v41) & 0x9FBFF59A) == 1516104332)) ^ (v36 + v37 - 1898))))(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27);
  }
  else if (v35)
  {
    return (*(uint64_t (**)(uint64_t))(v34 + 8 * ((v36 + 2133979614) ^ (v40 == 0))))(v39);
  }
  else
  {
    return (*(uint64_t (**)(uint64_t))(v34
                                              + 8
                                              * (((*(void *)(v38 - 200) == 0x50417EF54FC55D4FLL)
                                                * ((2133983642 - v37) ^ 0x97C)) ^ (v36 + 2133979454))))(v39);
  }
}

uint64_t sub_1A2E5416C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((((v0 - v1 + 2076) ^ 0xFFFFF1B0) + v0 - v1 + 2076) * (v3 == 0)) ^ v0)))();
}

uint64_t sub_1A2E541A0()
{
  (*(void (**)(uint64_t))(v1 + 8 * (v0 ^ (v4 - 1871))))(v3);
  uint64_t v6 = (*(uint64_t (**)(void, void, void))(v1 + 8 * (v0 ^ (v4 - 2286))))(*(unsigned int *)*(&off_1E5AC6910 + (v0 ^ (v4 + 18))), *(void *)(v5 - 128), *(unsigned int *)(v5 - 112));
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v1 + 8 * ((417 * (v2 == 0)) ^ (v0 - 2133980316)));
  *(void *)(v5 - 200) = 0x50417EF54FC55D4FLL;
  return v7(v6);
}

uint64_t sub_1A2E541CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29,int a30,int a31)
{
  uint64_t v37 = (*(uint64_t (**)(void))(v32 + 8 * (v35 + v34)))(*(void *)(v31 - 0x50417EF54FC55D4FLL));
  *(void *)(v31 - 0x50417EF54FC55D4FLL) = a23;
  *a29 = a31;
  *(void *)(v36 - 152) = v33;
  return (*(uint64_t (**)(uint64_t))(v32
                                            + 8
                                            * ((117 * ((((v35 + v34 - 2228) ^ 0x42E) & 1) == 0)) ^ (v35 + v34 - 267))))(v37);
}

void sub_1A2E54258()
{
  *(void *)(v1 - 168) = v0;
  JUMPOUT(0x1A2E5428CLL);
}

uint64_t sub_1A2E542EC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((233 * (((v0 == 0) ^ (v1 + 58) & 0x7F) & 1)) ^ v1)))();
}

uint64_t sub_1A2E54334()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((143 * ((v0 ^ (v1 < ((v0 + 2143287426) & 0xFF71FD5F ^ (v3 + 8)))) & 1)) ^ v0)))();
}

uint64_t sub_1A2E54380()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((472
                                * (v1 >= (((v0 ^ 0x5D2) + 649353352) & 0xD94BA6C6 ^ 0xFFFFFFFF80CE015FLL)
                                       + (((v0 ^ 0x5D2) + 2134766672) & 0xFFF3FDBF))) ^ v0 ^ 0x5D2)))();
}

uint64_t sub_1A2E543EC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((46 * (v0 >= ((v1 + 86010557) | 0x7A118804u) - v3 + 32)) ^ v1)))();
}

uint64_t sub_1A2E54434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = a2 + (v2 - 1);
  long long v8 = *(_OWORD *)(v7 - 31);
  uint64_t v9 = a1 + (v2 - 1);
  *(_OWORD *)(v9 - 15) = *(_OWORD *)(v7 - 15);
  *(_OWORD *)(v9 - 31) = v8;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v2 & 0xFFFFFFE0) == 32) * ((251 * (v3 ^ (v6 - 7))) ^ 0x2B8)) ^ (v5 + v3 - 1728))))();
}

void sub_1A2E54498()
{
}

uint64_t sub_1A2E544A4()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v1 - 375861489) & 0x16672FFB) - 760) * (v0 != 0)) | v1)))();
}

uint64_t sub_1A2E544DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v7 = v2 > 7 && (unint64_t)(a1 - a2) > 0x1F;
  return (*(uint64_t (**)(void))(v4 + 8 * (((((v3 + 503442954) | 0x61300802) + ((v3 + 316) ^ (v5 - 877))) * v7) ^ v3)))();
}

uint64_t sub_1A2E5452C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 > 0x1F) * (((v1 - 805) | 0x424) ^ 0x540)) ^ v1)))();
}

uint64_t sub_1A2E54560@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((957
                                * (((((v3 + 1291863241) | 0x3231B007) - 82874673) & 0x85BE9E7F) - 1590 != (v2 & 0xFFFFFFE0))) ^ (v5 + ((v3 + 1291863241) | 0x3231B007) - 1811))))();
}

uint64_t sub_1A2E545DC()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v0 == v1) ^ (v4 + v2)) & 1) * (v2 - 1576)) ^ v2)))();
}

uint64_t sub_1A2E54608()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v1 - 576) | 0x120) ^ (v3 + 1584) ^ (v1 + 2142630713) & 0xFF7BFF77)
                                     * ((v0 & 0x18) == 0)) ^ (v1 - 543))))();
}

uint64_t sub_1A2E54658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 - (v3 & 0xFFFFFFF8) == -8) * ((7 * (v4 ^ 0x55B)) ^ 0x8F)) ^ v4)))();
}

uint64_t sub_1A2E546AC(uint64_t a1, uint64_t a2)
{
  void *v3 = *v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8 * (((a2 == 0) * v5) ^ v2)))(a1, a2 + 8);
}

uint64_t sub_1A2E546D4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v2 + 335607052) | 0x6B310100) ^ (v2 - 4719404) & 0x7F79F937 ^ 0x482) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A2E54728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + v2) = *(unsigned char *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * ((1482 * (v2 + 1 == v3)) ^ (v6 + v4 - 1598))))();
}

uint64_t sub_1A2E5475C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v0 == v1) ^ (v4 + v2 + 1)) & 1) * ((v2 - 515) ^ 0x4E3)) ^ v2)))();
}

uint64_t sub_1A2E54794()
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((407 * ((v0 & 0x18) == (((v1 + 588330028) | 0x5C20C001u) ^ 0x7F31F907))) ^ v1)))();
}

uint64_t sub_1A2E547E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 - 7 + ((((2 * (v4 ^ 0xF)) ^ 0x42E) - 879) ^ v2) + v3) = *(void *)(a2
                                                                                                 - 7
                                                                                                 + ((((2 * (v4 ^ 0xF)) ^ 0x42E) - 879) ^ v2)
                                                                                                 + v3);
  return (*(uint64_t (**)(void))(v5 + 8 * ((15 * ((v3 & 0xFFFFFFF8) - 8 != v2)) ^ v4 ^ 0xF)))();
}

void sub_1A2E54840()
{
}

uint64_t sub_1A2E54848()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v2 ^ (v1 == v0))))();
}

uint64_t sub_1A2E54868()
{
  return v0();
}

uint64_t sub_1A2E54870()
{
  uint64_t v3 = *(void *)(v2 - 168);
  *(_DWORD *)(v3 - 0x50417EF54FC55D47) = (*(_DWORD *)(v2 - 112) ^ 0x76FDD9F0)
                                         - 1079005312
                                         + ((2 * *(_DWORD *)(v2 - 112)) & 0xEDFBB3E0);
  *(_DWORD *)(v3 - 0x50417EF54FC55D43) = 437737774;
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(v0 + 8 * ((v1 - 2286) ^ 0x7F31F907)))(*(unsigned int *)*(&off_1E5AC6910 + ((v1 + 18) ^ 0x7F31F907)), *(void *)(v2 - 128), *(unsigned int *)(v2 - 112));
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 11856);
  *(void *)(v2 - 200) = v3;
  return v5(v4);
}

uint64_t sub_1A2E548E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v6 = v2 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a2 + v6);
  return (*(uint64_t (**)(void))(v4 + 8 * ((v5 + v3 - 643) ^ (2 * (v6 != 0)))))();
}

uint64_t sub_1A2E5490C()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((((v2 == 0x50417EF54FC55D4FLL) ^ (v0 ^ (v3 + 28))) & 1)
                                * ((v0 - 956) ^ 0x2F)) ^ v0)))();
}

uint64_t sub_1A2E54958@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((((a1 + 1244690586) | 0x35018005) - 2133981210)
                                * (*(void *)(v2 - 0x50417EF54FC55D4FLL) == 0)) ^ a1)))();
}

void sub_1A2E549B4()
{
  *uint64_t v2 = 0;
  *(_DWORD *)(v4 - 0x50417EF54FC55D47) = 917342576;
  *(_DWORD *)(v4 - 0x50417EF54FC55D43) = 437737774;
  (*(void (**)(void *))(v3 + 8 * (v0 + v1)))(v2);
  JUMPOUT(0x1A2E54A1CLL);
}

uint64_t sub_1A2E54ADC()
{
  uint64_t v4 = *(void *)(v3 - 200);
  int v5 = *(_DWORD *)(v4 - 0x50417EF54FC55D47);
  LODWORD(v4) = *(_DWORD *)(v4 - 0x50417EF54FC55D43) + 68792889;
  BOOL v6 = v4 < 0x1E310B63;
  BOOL v7 = v4 > v5 - 410811917;
  if (v6 != v5 - 410811917 < ((v2 + v0 - 2195) ^ 0x6100F264u)) {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((67 * (((v0 ^ (v2 - 1)) ^ v7) & 1)) ^ v0)))();
}

uint64_t sub_1A2E54B94@<X0>(int a1@<W8>)
{
  BOOL v6 = (void *)(*(void *)(v5 - 200) - 0x50417EF54FC55D4FLL);
  int v7 = (*(unsigned __int8 *)(*v6 + (a1 - 437737774)) << 24) | (*(unsigned __int8 *)(*v6
                                                                                                + (a1 - 437737773)) << 16) | (*(unsigned __int8 *)(*v6 + (a1 - 437737772)) << 8);
  int v8 = *(unsigned __int8 *)(*v6 + (a1 - 437737771));
  _DWORD *v1 = a1 + 4;
  if (!(v7 | v8)) {
    return (*(uint64_t (**)(void))(v2 + 8 * ((53 * (*(void *)(v5 - 200) == 0x50417EF54FC55D4FLL)) ^ (v3 + v4 + 20))))();
  }
  if ((v7 | v8) == 0xFFFF4FFB) {
    return (*(uint64_t (**)(void))(v2
  }
                                + 8
                                * (((*((void *)*(&off_1E5AC6910 + (v4 ^ (v4 + 10))) + 1) == 0)
                                  * ((v3 + v4 - 374) ^ 0x725)) ^ (v3 + v4 - 771))))();
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((111 * ((v4 - 7) ^ 0x7F31F907)) ^ 0x360)
                                * (*(void *)(v5 - 200) == 0x50417EF54FC55D4FLL)) ^ (v3 + 2133980234))))();
}

uint64_t sub_1A2E5500C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((*v1 == 0) ^ (a1 ^ (v4 + 7))) & 1)
                                * (v3 + ((a1 + 907035900) | 0x4921B102) - 2232)) ^ a1)))();
}

void sub_1A2E5505C()
{
  (*(void (**)(void))(v4 + 8 * (v2 + v5)))();
  void *v1 = 0;
  _DWORD *v3 = 917342576;
  *int v0 = 437737774;
  (*(void (**)(void *))(v4 + 8 * (v2 + v5)))(v1);
  JUMPOUT(0x1A2E550A4);
}

uint64_t sub_1A2E550C8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((((v1 - v4 + 1445046535) | 0x29105000) ^ 0xFFFFFED2) + v1 - v4 + 1631 - v3 + 608)
                                     * (*v0 == 0)) ^ (v1 - v4 + 1631))))();
}

void sub_1A2E5511C()
{
  *(void *)uint64_t v0 = 0;
  *(_DWORD *)(v0 + 8) = 1122647118;
  *(_DWORD *)(v0 + 12) = 0;
  JUMPOUT(0x1A2E55150);
}

void uv5t6nhkui()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t *)*(&off_1E5AC6910
                  + ((9 * ((dword_1E95A44F8 - dword_1E95A44F0) ^ 0x7D)) ^ byte_1A3019C20[byte_1A301A690[(9 * ((dword_1E95A44F8 - dword_1E95A44F0) ^ 0x7D))] ^ 0x92])
                  - 198);
  unsigned __int8 v1 = 9 * (*v0 ^ dword_1E95A44F8 ^ 0x7D);
  uint64_t v2 = (uint64_t)*(&off_1E5AC6910 + (byte_1A301A454[(byte_1A301A034[v1 - 4] ^ 0xC8) - 4] ^ v1) - 130);
  uint64_t v3 = *v0 - (void)&v8 + *(void *)(v2 - 4);
  uint64_t v4 = 1787074057 * v3 - 0x6585E11862ED39BLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  *uint64_t v0 = v4;
  *(void *)(v2 - 4) = v5;
  LOBYTE(v2) = 9 * ((v5 + *(_DWORD *)v0) ^ 0x7D);
  BOOL v6 = (char *)*(&off_1E5AC6910
               + ((9 * (dword_1E95A44F0 ^ 0x7D ^ dword_1E95A44F8)) ^ byte_1A3019D20[byte_1A301A790[(9 * (dword_1E95A44F0 ^ 0x7D ^ dword_1E95A44F8))] ^ 0xF2])
               - 58)
     - 4;
  uint64_t v7 = *(void *)&v6[8
                    * ((29
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v6[8
                                                                        * (byte_1A3019D28[(byte_1A301A79C[v2 - 12] ^ 0xF2) - 8] ^ v2)
                                                                        + 17776])(24, 4101018099) != 0)) ^ 0x586)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E55344(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 378813108;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((46 * (v3 != 0)) ^ 0x3C8u)))();
}

uint64_t sub_1A2E553A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(v13 - 244) = v12;
  *(void *)(v13 - 192) = v11;
  *(_DWORD *)(v13 - 224) = v8;
  *(_DWORD *)(v13 - 220) = v10;
  *(void *)(v13 - 208) = v9;
  *(_DWORD *)(v5 + 8) = v6 + 4096;
  mach_msg_header_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                                       + 8
                                                                                       * ((43 * (((v5 == 0) ^ 0xE7) & 1)) ^ 0x4D2));
  *(void *)(v13 - 200) = 0x3972785B6BCAF92ALL;
  return v14(a1, a2, a3, a4, a5, 3793274687);
}

uint64_t sub_1A2E55444()
{
  int v3 = v0 & 0xEBD;
  unsigned int v4 = ((v3 - 428) ^ 0x81BC0EF4) + *(_DWORD *)(v1 + 12);
  unsigned int v5 = *(_DWORD *)(v1 + 8) + 1797771605;
  BOOL v6 = v4 < (((v3 - 1164) | 0x2E0) ^ 0x81BC0EF0);
  BOOL v7 = v4 > v5;
  if (v6 != v5 < 0x81BC0C09) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v7;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((111 * v8) ^ v3)))(v1 + 8);
}

uint64_t sub_1A2E554D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8 * (((((v16 == 0) ^ (a6 + v15 + 7)) & 1) * (v15 ^ 0x319)) ^ v15));
  *(void *)(v18 - 200) = 0x3972785B6BCAF92ALL;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a1);
}

uint64_t sub_1A2E55530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  int v23 = (a20 << ((v20 ^ (a6 + 100)) + 101)) - 757626216;
  unsigned int v24 = ((2 * v23) & 0x2FAFF5F8) + (v23 ^ 0x97D7FAFC);
  if ((a20 + 26154070) < 0x18234F06 != v24 - 2142546934 < 0x18234F06) {
    BOOL v25 = v24 - 2142546934 < 0x18234F06;
  }
  else {
    BOOL v25 = v24 - 2142546934 > a20 + 26154070;
  }
  return (*(uint64_t (**)(void))(v21 + 8 * (((2 * !v25) | (16 * !v25)) ^ (v22 + v20 - 2003))))();
}

uint64_t sub_1A2E555E4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (int)((((v2 - 24) ^ 0xE218C73F) * (v0 == 0)) ^ 0x66B)))();
}

uint64_t sub_1A2E55624@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v2 + 8 * (int)(a1 ^ 0xE218CF80)))(v1);
  return v3;
}

void Gg9q7vHg34(unint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 > 0xFFFFFFFFFFFFFFEFLL && a2 != 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E58CE4(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
  BOOL v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 18520))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((120 * v3) ^ 0x599u)))();
}

uint64_t sub_1A2E58D30(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 35853729;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((103 * (v3 != 0)) ^ 0x137)))();
}

uint64_t sub_1A2E58DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  *(void *)(v35 - 152) = v34 + 0x1F534F2566915141;
  *(_DWORD *)(v34 + 8) = v31 + 4096;
  uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8 * (int)(((((v34 == 0) ^ (v29 + 102)) & 1) * (((v29 - 316339610) ^ 0xED250A23) - 321)) ^ (v29 + 1540)));
  *(void *)(v35 - 168) = (char *)*(&off_1E5AC6910 + v29 - 298) - 8;
  *(void *)(v35 - 200) = 0x2B2216E748EAFB5FLL;
  *(void *)(v35 - 144) = v34;
  return v36(a1, a2, a3, a4, a5, a6, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           v30,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           v32);
}

uint64_t sub_1A2E58E50()
{
  int v3 = v0 & 0x17FB;
  unsigned int v4 = *(_DWORD *)(v2 + 12) + 255685404;
  unsigned int v5 = *(_DWORD *)(v2 + 8) + 219831671;
  BOOL v6 = v4 < 0xF3D7318;
  BOOL v7 = v4 > v5;
  if (v6 != v5 < 0xF3D7318) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v7;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((!v8 * (((v3 - 647) | 0x629) ^ 0x70C)) ^ v3)))();
}

void sub_1A2E58ED4(int a1@<W6>, int a2@<W7>, int a3@<W8>)
{
  *(void *)(v8 - 200) = 0x2B2216E748EAFB5FLL;
  uint64_t v9 = *v7;
  unsigned int v10 = ((a3 << (v4 ^ 0x3A)) & 0x4FFE7BFE) + (a3 ^ 0x27FF3DFF) - 671038975;
  *(unsigned char *)(*v7 + v10) = 0;
  *(unsigned char *)(v9 + v10 + 1) = 0;
  *(unsigned char *)(v9 + v10 + 2) = 0;
  *(unsigned char *)(v9 + v10 + 3) = 1;
  *v3 += 4;
  *(void *)(v8 - 160) = v6;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E59214()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)((((v0 - 137) ^ 0x9A3 ^ (v0 + 1825921279) & 0x932A9FFF) * (v2 == 0)) ^ (v0 - 119))))();
}

uint64_t sub_1A2E59264()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) - 1129964345;
  unsigned int v4 = *(_DWORD *)(v2 + 8) - 1165818078;
  BOOL v5 = v3 < 0xBCA61CC3;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((v0 + 522693193) & 0xE0D84DFF ^ 0xBCA61CBC)) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((89 * v6) ^ v0)))();
}

uint64_t sub_1A2E592EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (((((v28 == 0) ^ (v25 - 119)) & 1) * ((v25 - 1975) ^ 0x9E)) ^ (v25 - 1975)));
  *(void *)(v29 - 160) = v27;
  return v30(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A2E59350()
{
  int v3 = ((v1 ^ 0x329) - 334) | 0x130;
  unsigned int v4 = (v3 ^ 0x1425AD21) + v0;
  unsigned int v5 = ((v3 - 1536722772) & (2 * (2 * v0 - 71707458))) + ((2 * v0 - 71707458) ^ 0xD233BDF3);
  if (v4 < 0x1648C3B6 != v5 + 1142228419 < 0x1648C3B6) {
    BOOL v6 = v5 + 1142228419 < 0x1648C3B6;
  }
  else {
    BOOL v6 = v5 + 1142228419 > v4;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((110 * !v6) ^ v3)))();
}

uint64_t sub_1A2E59408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v30 = *(void *)(v29 - 152);
  int v31 = (v27 - 2030371456) & 0x790503BE;
  *(void *)(v29 - 152) = v30;
  uint64_t v32 = *(void *)(v30 - 0x1F534F2566915141);
  int v33 = ((2 * a9) & 0x57DFFDDE) + (a9 ^ 0x2BEFFEEF);
  *(unsigned char *)(v32 + v33 + (v31 ^ 0xD41000AF)) = 56;
  v33 -= 737148753;
  *(unsigned char *)(v32 + (v33 + 99)) = 91;
  *(unsigned char *)(v32 + (v33 + 100)) = 44;
  *(unsigned char *)(v32 + (v33 + 101)) = -24;
  *v26 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (int)((a7 + a8 + (v31 ^ 0x5E9) - 1111 - 1238) ^ v31)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A2E595F0()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((((v0 ^ 0x440) + 931) ^ (39 * (v0 ^ 0x440))) * (v2 == 0)) ^ v0)))();
}

uint64_t sub_1A2E59630()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) + 2103532965;
  unsigned int v4 = *(_DWORD *)(v2 + 8) + 2067679232;
  BOOL v5 = v3 < (v0 ^ 0x7D615E20u);
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((v0 - 373) | 0x42u) + 2103532371) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((1844 * v6) ^ v0)))();
}

uint64_t sub_1A2E596B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  HIDWORD(a23) = v24;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * ((((v25 ^ 0x28) - 582) * (v27 != 0)) ^ v25)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_1A2E596F4()
{
  int v3 = 3 * (v1 ^ 0x2AC);
  unsigned int v4 = v0 - 1615262585 + v3;
  unsigned int v5 = (((2 * v0 - 71707458) << ((v3 + 75) ^ 0xA8)) & 0xA776EB70) + ((2 * v0 - 71707458) ^ 0xD3BB75B9);
  if (v4 < 0xA1DC2482 != v5 - 836718903 < 0xA1DC2482) {
    BOOL v6 = v5 - 836718903 < 0xA1DC2482;
  }
  else {
    BOOL v6 = v5 - 836718903 > v4;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((56 * !v6) ^ v3)))();
}

uint64_t sub_1A2E597C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v29 = *(void *)(v28 - 152);
  int v30 = (v26 - 589) | 0x38A;
  *(void *)(v28 - 152) = v29;
  uint64_t v31 = *(void *)(v29 - 0x1F534F2566915141);
  unsigned int v32 = ((2 * a9) & 0x478E7FDE) + (a9 ^ 0x23C73FEF);
  unsigned int v33 = v32 + (v30 ^ 0xDC38C399);
  v32 -= 600260591;
  *(unsigned char *)(v31 + v32) = 0;
  *(unsigned char *)(v31 + v33) = 0;
  *(unsigned char *)(v31 + v32 + 2) = 0;
  *(unsigned char *)(v31 + v32 + 3) = 1;
  *v25 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (int)((((9 * (v30 ^ 0x33C)) ^ (a7 + 557)) + v30 - a7 + 1332) ^ v30)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A2E599A4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((((((2 * v0) ^ 0xD60) - 312) | 0x618) ^ 0x684) * (v2 == 0)) ^ v0)))();
}

uint64_t sub_1A2E599E4()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) + 1658655541;
  unsigned int v4 = *(_DWORD *)(v2 + 8) + ((v0 + 190) ^ 0x60B9FAD0);
  BOOL v5 = v3 < ((v0 - 1534) | 0x10Au) + 1658655107;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x62DD132D) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((3611 * v6) ^ v0)))();
}

uint64_t sub_1A2E59A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  LODWORD(a23) = v23;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8 * (((((2 * v24) ^ 0xF06) + ((v24 - 1704) | 0x509) - 1852) * (v26 == 0)) ^ v24)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A2E59AB0()
{
  unsigned int v3 = v0 - 1610165446;
  BOOL v4 = (v0 - 1610165446) < 0xA229E8D3;
  unsigned int v5 = ((2 * (2 * v0 - 71707458)) & 0xB677EFD4) + ((2 * v0 - 71707458) ^ ((v1 ^ 0x29A) - 616828732));
  if (v4 != v5 - 957484824 < 0xA229E8D3) {
    BOOL v6 = v5 - 957484824 < 0xA229E8D3;
  }
  else {
    BOOL v6 = v5 - 957484824 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((527 * v6) ^ v1)))();
}

uint64_t sub_1A2E59B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v35 = *(void *)(v34 - 152);
  uint64_t v36 = (v32 + 20);
  *(void *)(v34 - 152) = v35;
  uint64_t v37 = *(void *)(v35 - 0x1F534F2566915141);
  uint64_t v38 = ((2 * a9) & 0x1CAB9FBB6) + (a9 ^ 0x7BAFA3BFE55CFDDBLL);
  *(unsigned char *)(v37 + v38 + (v36 ^ 0x84505C401AA3039BLL)) = -1;
  uint64_t v39 = v37 - 0x7BAFA3BFE55CFDDALL + v38;
  *(_WORD *)uint64_t v39 = -1;
  *(_DWORD *)(v39 + 2) = -1;
  *(unsigned char *)(v39 + 6) = (a31 - ((2 * a31) & 0x58) + 44) ^ 0x2C;
  *v31 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8 * (int)((v36 - a7 + 1793) ^ (a8 + 46) ^ v36 ^ 0x571 ^ v36)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_1A2E59D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  *(void *)(v10 - 128) = 0;
  return (*(uint64_t (**)(void))(v8 + 8 * (int)(((a7 + ((v7 - 4851920) & 0xB47F2FBF) - 2216) * (v9 == 0)) ^ v7)))();
}

uint64_t sub_1A2E59DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v31 = v27 - 796;
  uint64_t v32 = (*(uint64_t (**)(void))(v28 + 8 * ((v27 - 796) ^ 0x892)))();
  (*(void (**)(uint64_t, uint64_t, void, void))(v28 + 8 * (v31 + 1846)))(v32, *(void *)(v29 + 8 * (v31 - 430)) - 3, **(void **)(v30 - 144), *(unsigned int *)(*(void *)(v30 - 144) + 12));
  uint64_t v33 = (*(uint64_t (**)(void, void))(v28 + 8 * (v31 + 1868)))(*(void *)(v30 - 168), 0);
  *(void *)(v30 - 192) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((v33 == 0) * (v31 + (v31 ^ 0x7F) + 33)) ^ v31)))(v33, v34, v35, v36, v37, v38, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E59E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v30 = (*(uint64_t (**)(void, uint64_t, void))(v27 + 8 * (v26 + 1848)))(*(void *)(v28 - 168), a1, 0);
  int v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * ((v30 == 0) ^ v26));
  *(void *)(v28 - 192) = a1;
  return v31(v30, v32, v33, v34, v35, v36, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A2E59EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  int v39 = v35 ^ 0x248;
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v39 + 1455)))(a1, *(void *)(v37 + 8 * (v39 - 869)) - 12);
  (*(void (**)(uint64_t))(v36 + 8 * (v39 + 1325)))(a1);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v39 ^ 0xAA8)))(a1, a35);
  uint64_t v40 = (*(uint64_t (**)(void))(v36 + 8 * (v39 ^ 0xA96)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (int)(((v40 != *(void *)(v37 + 8 * (v39 - 890))) * ((v39 - 1176667641) ^ 0xB9DD7D70 ^ (v39 - 1176667641) & 0x462282FC ^ 0x66)) ^ v39)))(v40, v41, v42, v43, v44, v45, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A2E59FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  unsigned int v33 = (a8 + v30 - 1321618659) & 0x9A9128FD;
  uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 8 * (v30 + 2075)))(a29, v31, v32 - 128);
  int v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29
                                                                                                + 8
                                                                                                * (int)(((v34 == 0) * (v33 ^ 0x946)) ^ v30));
  *(void *)(v32 - 200) = 0x2B2216E748EAFB5FLL;
  return v35(v34, v36, v37, v38, v39, v40, 1271586048);
}

uint64_t sub_1A2E5A05C()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 + 54)))(24, 4101018099);
  BOOL v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1
                                                                                               + 8
                                                                                               * (((v3 != 0)
                                                                                                 * (((v0 - 2078269644) | 0x301503B6)
                                                                                                  + 1271583817)) ^ v0));
  *(void *)(v2 - 200) = 0x2B2216E748EAFB5FLL;
  return v4(v3, v5, v6, v7, v8, v9, 1271586048);
}

uint64_t sub_1A2E5A0F0(uint64_t a1)
{
  *(void *)(v3 - 176) = a1 + 0x2B2216E748EAFB5FLL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 445517218;
  *(_DWORD *)(a1 + 12) = 661609844;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 54)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v5 != 0) * ((v1 - 1723) ^ 0x27F)) ^ (v1 - 2070))))();
}

uint64_t sub_1A2E5A174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_DWORD *)(v9 + 8) = v8 + 4096;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8 * (((*(void *)(v10 - 128) > (unint64_t)(v8 - 445513122)) * ((5 * ((v6 | 0x21) ^ 0x22D)) ^ 0xB4C)) ^ (v6 | 0x21))))(a1, a2, a3, a4, a5, a6, 1271586048, 3023383487);
}

uint64_t sub_1A2E5A1DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2
                                                     + 8
                                                     * (((((v4 == 0) ^ ((v3 ^ 7) + 59) ^ 0x69) & 1)
                                                       * ((((v3 ^ 0x707) - 1211718341) & 0x48395B7F) - 2080)) ^ v3 ^ 0x707)))(a1, a2);
}

uint64_t sub_1A2E5A23C@<X0>(int a1@<W8>)
{
  int v5 = v2 - 108;
  unsigned int v6 = v1 + v3 + a1;
  int v7 = ((2 * ((a1 << (v5 ^ 0x60)) - 891034436)) & 0x3D1E9BCC) + (((a1 << (v5 ^ 0x60)) - 891034436) ^ 0x1E8F4DE7);
  if (v6 > 0xA80F72B4 != (v7 + 962674532) < 0x57F08D4B) {
    BOOL v8 = (v7 + 962674532) < 0x57F08D4B;
  }
  else {
    BOOL v8 = v7 + 962674532 > (v5 ^ 0x57F08E2A) + v6;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8 * ((172 * !v8) ^ v5)))(1025416140, 4227776443, 962674532);
}

uint64_t sub_1A2E5A300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v29
                              + 8
                              * (int)(((a29 == (void)*(&off_1E5AC6910 + v30 - 117) - 8)
                                     * ((a8 + ((v30 + 376) | 0x191) - 1689) ^ (v30 - 1258295497) & 0xFF353BFF)) ^ v30)))();
}

uint64_t sub_1A2E5A378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v37 + 8 * (v36 + 1435));
  *(void *)(v38 - 176) = v35;
  v39(a26, a35);
  uint64_t v40 = (*(uint64_t (**)(void))(v37 + 8 * (v36 ^ 0xA83)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (int)(((v40 == *(void *)(v38 - 176)) * (v36 - 553 + ((v36 + 1399813486) & 0xAC9087FB) + 966)) ^ v36)))(v40, v41, v42, v43, v44, v45, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A2E5A400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v30 + 8 * (((a7 + ((v31 + 521) ^ (a8 - 753)) - 989) * (a29 == v29)) ^ v31)))();
}

uint64_t sub_1A2E5A448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v35 + 1467)))(a26, a35);
  uint64_t v38 = (*(uint64_t (**)(void))(v36 + 8 * (v35 ^ 0xA63)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (((((v35 - 20) ^ (v38 == *(void *)(v37 - 176))) & 1) * ((v35 + 1550007276) ^ 0x5C633FBD)) ^ v35)))(v38, v39, v40, v41, v42, v43, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A2E5A4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v30
                              + 8
                              * (int)(((((a29 == v29) ^ (v31 + 52)) & 1)
                                     * (((v31 & 0xA39CC0FF) - 42599518) & 0xB6BF2FBF ^ (a8 - 85))) ^ v31 & 0xA39CC0FF)))();
}

uint64_t sub_1A2E5A538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  (*(void (**)(uint64_t, uint64_t))(v36 + 8 * (v35 + 1435)))(a26, a35);
  uint64_t v38 = (*(uint64_t (**)(void))(v36 + 8 * (v35 + 1409)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * (int)(((v38 == *(void *)(v37 - 176)) * (((v35 + 1187161198) & 0xB93D58FB) + (v35 ^ 0x7D))) ^ v35)))(v38, v39, v40, v41, v42, v43, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A2E5A5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return (*(uint64_t (**)(void))(v31
                              + 8
                              * (int)((((((v29 ^ 0x319) + 248) | 0x211) ^ (a8 + 659) ^ ((v29 ^ 0x319) - 33706121) & 0xB6377BBF)
                                     * (a29 == v30)) ^ v29 ^ 0x319)))();
}

uint64_t sub_1A2E5A620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v38 = v35;
  (*(void (**)(uint64_t, uint64_t))(v37 + 8 * (v36 ^ 0xABD)))(a26, a35);
  uint64_t v39 = (*(uint64_t (**)(void))(v37 + 8 * (v36 ^ 0xA83)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (int)(((v39 == v38) * ((v36 ^ 0x36A) + 1271586048 + ((v36 - 1119912850) & 0xF6F5ABBF) - 1392)) ^ v36)))(v39, v40, v41, v42, v43, v44, 1271586048, 3023383487, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21);
}

uint64_t sub_1A2E5A6C8()
{
  uint64_t v4 = *(uint64_t (**)(void))(v1 + 8 * (int)((((v0 ^ 0xB43529A5) + 1271584009) * (v2 == 0)) ^ v0 ^ 0x25A));
  *(void *)(v3 - 200) = 0x2B2216E748EAFB5FLL;
  return v4();
}

uint64_t sub_1A2E5A728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  (*(void (**)(uint64_t))(v36 + 8 * (v37 ^ (a8 - 2239))))(v38);
  *(void *)(v39 - 200) = 0x2B2216E748EAFB5FLL;
  (*(void (**)(uint64_t))(v36 + 8 * (int)(v37 ^ 0xB43522BA)))(v35);
  (*(void (**)(uint64_t))(v36 + 8 * (v37 & 0x4240C905)))(a26);
  return (*(uint64_t (**)(void))(v36 + 8 * ((4033 * (a35 != 0)) ^ (v37 + 1271585819))))();
}

uint64_t sub_1A2E5AB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v34 = (*(uint64_t (**)(void))(v32 + 8 * v30))();
  uint64_t v35 = *(uint64_t (**)(uint64_t))(v32 + 8 * ((v29 - 1233) ^ (1982 * (a29 != 0))));
  *(void *)(v33 - 192) = v31;
  return v35(v34);
}

uint64_t sub_1A2E5AB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v36 = (*(uint64_t (**)(uint64_t))(v31 + 8 * (v34 & 0x88905)))(a29);
  *(void *)(v35 - 192) = v30;
  if (v32 == -45004)
  {
    *(void *)(v35 - 176) = v29;
    *(void *)(v35 - 120) = 0;
    *(_DWORD *)(v35 - 132) = 0;
    uint64_t v37 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v31 + 18736))(**(unsigned int **)(v33 + 64), **(void **)(v35 - 144), *(unsigned int *)(*(void *)(v35 - 144) + 12), v35 - 120, v35 - 132);
    int v38 = (v37 ^ 0x5B5FEEA9) - 285344800 + ((2 * v37) & 0xB6BFDD52) != 1516104332;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * ((v38 | (v38 << 6)) ^ 0x419)))(v37, v39, v40, v41, v42, v43, v44, v45, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26);
  }
  else if (v32)
  {
    return (*(uint64_t (**)(uint64_t))(v31
                                              + 8 * ((32 * (((*(void *)(v35 - 144) == 0) ^ 0x43) & 1)) | 0x107)))(v36);
  }
  else
  {
    return (*(uint64_t (**)(uint64_t))(v31
                                              + 8 * ((63 * (*(void *)(v35 - 200) == 0x2B2216E748EAFB5FLL)) ^ 0x29D)))(v36);
  }
}

uint64_t sub_1A2E5B2C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = ((((v3 + 483) ^ 0x749) - 810) ^ 0x76B21497) + *(_DWORD *)(a3 - 0x2B2216E748EAFB53);
  unsigned int v6 = *(_DWORD *)(a3 - 0x2B2216E748EAFB57) - 2087492361;
  BOOL v7 = v5 < 0x9E217299;
  BOOL v8 = v5 > v6;
  if (v6 < 0x9E217299 != v7) {
    BOOL v8 = v7;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((87 * !v8) ^ (v3 + 483))))();
}

uint64_t sub_1A2E5B36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 - 0x2B2216E748EAFB5FLL);
  int v8 = (*(unsigned __int8 *)(v7 + ((((v5 + 1353215190) & 0xAF578FFF) - 661607984) ^ (v5 + 790672959) & 0xD0DF4DDA) + v4) << 24) | (*(unsigned __int8 *)(v7 + (v4 - 661609843)) << 16) | (*(unsigned __int8 *)(v7 + (v4 - 661609842)) << 8) | *(unsigned __int8 *)(v7 + (v4 - 661609841));
  _DWORD *v3 = v4 + 4;
  return (*(uint64_t (**)(void))(v6 + 8 * ((3178 * (v8 == 0)) ^ v5)))();
}

uint64_t sub_1A2E5B41C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((((86 * (v3 ^ 0x90C)) ^ 0x4A5) * (a3 != 0x2B2216E748EAFB5FLL)) | v3)))();
}

uint64_t sub_1A2E5B46C(int a1)
{
  unsigned int v4 = ((((a1 + 1570025802) & 0xA26B4BBF) + 810) ^ 0x686C2B9) + v2;
  int v5 = ((v1 - 106596729) < 0x2114D3F3) ^ (v4 < 0x2114D3F3);
  BOOL v6 = v1 - 106596729 > v4;
  if (v5) {
    BOOL v6 = (v1 - 106596729) < 0x2114D3F3;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((92 * v6) ^ a1)))();
}

uint64_t sub_1A2E5B4EC@<X0>(uint64_t a1@<X2>, int a2@<W6>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int *a15)
{
  int v21 = (*(unsigned __int8 *)(v17 + (v18 + v16 + 3)) << (v19 + 48)) | (*(unsigned __int8 *)(v17 + (v18 + v16 + 4)) << 16) | (*(unsigned __int8 *)(v17 + (v18 + v16 + 5)) << 8) | *(unsigned __int8 *)(v17 + (v18 + v16 + 6));
  *int v15 = v16 + 8;
  *a15 = v21;
  return (*(uint64_t (**)(void))(v20
                              + 8
                              * (int)(((a2 + v19 - 591 + ((v19 - 188926185) & 0xBF77EFBF) - 2786) * (a1 != a3)) ^ (v19 - 810))))();
}

uint64_t sub_1A2E5B580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  BOOL v11 = *(void *)(*(void *)(v10 - 200) - 0x2B2216E748EAFB5FLL) == 0;
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (((v11 ^ (a8 + v8 + 103)) & 1 | (32
                                                                                * ((v11 ^ (a8 + v8 + 103)) & 1))) ^ v8)))();
}

void sub_1A2E5B5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  (*(void (**)(void))(v11 + 8 * (v10 ^ (a8 - 2239))))();
  *uint64_t v9 = 0;
  *(_DWORD *)(v8 - 0x2B2216E748EAFB57) = 445517218;
  *(_DWORD *)(v8 - 0x2B2216E748EAFB53) = 661609844;
  (*(void (**)(void *))(v11 + 8 * (v10 + 1271586048)))(v9);
  JUMPOUT(0x1A2E5BEA0);
}

uint64_t sub_1A2E5B64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,_DWORD *a27,int a28,int a29)
{
  unsigned int v33 = (a8 - 1337304249) & 0x9B807CF9;
  uint64_t v34 = (*(uint64_t (**)(void))(v30 + 8 * (a8 ^ (a8 - 2239))))(*(void *)(v29 - 0x2B2216E748EAFB5FLL));
  *(void *)(v29 - 0x2B2216E748EAFB5FLL) = a22;
  *a27 = a29;
  *(void *)(v32 - 160) = v31;
  return (*(uint64_t (**)(uint64_t))(v30 + 8 * (int)(((v33 ^ 0x5C0) - 342) | v33)))(v34);
}

void sub_1A2E5B6E4()
{
  *(void *)(v1 - 184) = v0;
  JUMPOUT(0x1A2E5B710);
}

uint64_t sub_1A2E5B780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (int)((((v9 - 159553200) ^ 0xF67D6DC8 ^ (a8 - 449) ^ (v9 - 159553200) & 0xBDB7BBBF)
                                     * (v8 != 0)) ^ v9)))();
}

uint64_t sub_1A2E5B7C8@<X0>(uint64_t a1@<X0>, int a2@<W7>, uint64_t a3@<X8>)
{
  BOOL v7 = v3 < 8 || a1 - a3 < ((v4 - 2023158380) & 0x7896F5B7 ^ 0x5A3uLL);
  return (*(uint64_t (**)(void))(v5 + 8 * (int)((v7 * ((v4 - 1133041272) & 0xF7BDFFFF ^ (a2 + 38))) ^ v4)))();
}

uint64_t sub_1A2E5B82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v10 + 8 * (((a7 + a8 + (v9 ^ 0x2E2) - 1889 - 2202) * (v8 > 0x1F)) ^ v9)))();
}

uint64_t sub_1A2E5B864@<X0>(_OWORD *a1@<X0>, int a2@<W6>, int a3@<W7>, _OWORD *a4@<X8>)
{
  long long v7 = a4[1];
  *a1 = *a4;
  a1[1] = v7;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((37 * (((v5 - a3 + 910) ^ 0x3AELL) == (v4 & 0xFFFFFFE0))) ^ (a2 + v5 - 618))))();
}

uint64_t sub_1A2E5B8BC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v0 == 0) ^ (5 * (v1 ^ 0xEE))) & 1) * (v1 - 1908)) ^ v1)))();
}

uint64_t sub_1A2E5B8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v11 = v8 < ((((v9 - 2147212921) | 0x34310817) - a8 + 1057) ^ 0x429u);
  return (*(uint64_t (**)(void))(v10 + 8 * ((v11 | (4 * v11)) ^ v9)))();
}

uint64_t sub_1A2E5B938()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((14 * (v1 >= ((v0 + 178) ^ 0x4F3uLL))) | v0)))();
}

uint64_t sub_1A2E5B970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v9 + 8 * (((v7 >= a7 + ((v8 - 1128928468) & 0xF77F3BBF) - 2207) * (v8 ^ 0x4D5)) ^ v8)))();
}

uint64_t sub_1A2E5B9C0@<X0>(uint64_t a1@<X0>, int a2@<W6>, int a3@<W7>, uint64_t a4@<X8>)
{
  uint64_t v7 = (v4 - 1);
  long long v8 = *(_OWORD *)(a4 + v7 - 15);
  long long v9 = *(_OWORD *)(a4 + v7 - 31);
  uint64_t v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((633 * (2 * (v5 ^ (a3 - 299)) - 566 == (v4 & 0xFFFFFFE0))) ^ (a2 + v5 - 1147))))();
}

uint64_t sub_1A2E5BA28()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 ^ 0x60D) - 1381) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A2E5BA50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8 * (int)((((v9 - 151669188) & 0xBD3F6FFF ^ (a8 - 950)) * ((v8 & 0x18) == 0)) ^ v9)))();
}

uint64_t sub_1A2E5BA90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5 + 8 * ((3867 * (((27 * (v4 ^ 0x776u)) ^ 0x265) + v2 == (v3 & 0xFFFFFFF8))) ^ v4)))();
}

uint64_t sub_1A2E5BAE0()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v2 - 386) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A2E5BB08@<X0>(uint64_t a1@<X0>, int a2@<W6>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a1 + v3) = *(unsigned char *)(a3 + v3);
  return (*(uint64_t (**)(void))(v6 + 8 * ((29 * (v3 + 1 != v4)) | (a2 + v5 - 1695))))();
}

uint64_t sub_1A2E5BB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v11 + 8 * ((((v10 - a7 + 1641) ^ (a8 + 941) ^ 0x4D9) * (v8 == v9)) ^ v10)))();
}

uint64_t sub_1A2E5BB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8 * ((711 * ((v8 & 0x18) == ((a8 + v9 + 1295515245) & 0xFE92D59E) - 1182)) ^ v9)))();
}

uint64_t sub_1A2E5BBBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 - 7 + (v2 ^ 0xFFFFFDDB ^ ((v4 - 638) | 4)) + v3) = *(void *)(a2
                                                                                            - 7
                                                                                            + (v2 ^ 0xFFFFFDDB ^ ((v4 - 638) | 4))
                                                                                            + v3);
  return (*(uint64_t (**)(void))(v5 + 8 * ((726 * ((v3 & 0xFFFFFFF8) - 8 == v2)) ^ v4)))();
}

void sub_1A2E5BC10()
{
}

uint64_t sub_1A2E5BC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v11 + 8 * (((v10 ^ (a8 - 548) ^ (v10 - a7 + 2022)) * (v9 == v8)) ^ v10)))();
}

uint64_t sub_1A2E5BC4C()
{
  return v0();
}

uint64_t sub_1A2E5BC54()
{
  uint64_t v2 = *(void *)(v1 - 184);
  *(_DWORD *)(v2 - 0x2B2216E748EAFB57) = (*(_DWORD *)(v1 - 132) ^ 0x7AAF7FB3)
                                         - 1612804625
                                         + ((2 * *(_DWORD *)(v1 - 132)) & 0xF55EFF66);
  *(_DWORD *)(v2 - 0x2B2216E748EAFB53) = 661609844;
  uint64_t v3 = v2;
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(v0 + 18672))(MEMORY[0x1EB1CB748], *(void *)(v1 - 120), *(unsigned int *)(v1 - 132));
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 7448);
  *(void *)(v1 - 200) = v3;
  return v5(v4);
}

uint64_t sub_1A2E5BCC4@<X0>(uint64_t a1@<X0>, int a2@<W6>, uint64_t a3@<X8>)
{
  unsigned int v6 = v3 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a3 + v6);
  return (*(uint64_t (**)(void))(v5 + 8 * ((225 * (v6 == 0)) ^ (a2 + v4 - 423))))();
}

uint64_t sub_1A2E5BCF8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((v1 != 0x2B2216E748EAFB5FLL) | v0)))();
}

uint64_t sub_1A2E5BD34@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((((a1 | 0xC9) - 1124648714) & 0xF73DEFFF) - 21) ^ (a1 | 0xC9) ^ 0xB4352976)
                                     * (*(void *)(v1 - 0x2B2216E748EAFB5FLL) == 0)) ^ (a1 | 0xC9))))();
}

void sub_1A2E5BDA0(int a1@<W8>)
{
  *uint64_t v2 = 0;
  *(_DWORD *)(v3 - 0x2B2216E748EAFB57) = 445517218;
  *(_DWORD *)(v3 - 0x2B2216E748EAFB53) = 661609844;
  (*(void (**)(void *))(v4 + 8 * (a1 ^ (v1 - 2239))))(v2);
  JUMPOUT(0x1A2E5BE20);
}

uint64_t sub_1A2E5BED4@<X0>(int a1@<W6>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((*v3 != 0) * (a1 + ((a2 + 607126217) | 0x900523B3) - 2187)) | a2)))();
}

void sub_1A2E5BF14()
{
  (*(void (**)(void))(v1 + 8 * (v0 & 0x200CCFF)))();
  *(void *)uint64_t v2 = 0;
  *(_DWORD *)(v2 + 8) = 35853729;
  *(_DWORD *)(v2 + 12) = 0;
  JUMPOUT(0x1A2E5BF48);
}

void p435tmhbla()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1E5AC6910
                + ((9 * ((dword_1E95A44F8 + dword_1E95A4518) ^ 0x7D)) ^ byte_1A3019C20[byte_1A301A690[(9 * ((dword_1E95A44F8 + dword_1E95A4518) ^ 0x7D))] ^ 0x1A])
                - 159);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A454[(byte_1A301A034[(9 * ((dword_1E95A44F8 + v1) ^ 0x7D))
                                                                 - 4] ^ 0xC8)
                                                 - 4] ^ (9 * ((dword_1E95A44F8 + v1) ^ 0x7D)))
                - 130);
  unint64_t v3 = 1787074057 * ((*(void *)(v2 - 4) - v1 - (void)&v6) ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v3;
  *(void *)(v2 - 4) = v3;
  LOBYTE(v2) = 9 * ((v3 + *(_DWORD *)(v0 - 4)) ^ 0x7D);
  uint64_t v4 = (char *)*(&off_1E5AC6910
               + ((9 * ((dword_1E95A44F8 + dword_1E95A4518) ^ 0x7D)) ^ byte_1A3019C20[byte_1A301A690[(9 * ((dword_1E95A44F8 + dword_1E95A4518) ^ 0x7D))] ^ 0x92])
               - 183)
     - 4;
  uint64_t v5 = *(void *)&v4[8
                    * ((8
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v4[8
                                                                        * (byte_1A301A350[byte_1A3019F38[v2 - 8] ^ 0xF5] ^ v2)
                                                                        + 16592])(24, 4101018099) != 0)) | 0x740)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E5C14C(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 1640180093;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * (((2 * (v3 == 0)) | (8 * (v3 == 0))) ^ 0x6C2u)))();
}

uint64_t sub_1A2E5C1A0()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((15 * (((v0 == 0) ^ 0xED) & 1)) ^ 0x486u)))();
}

uint64_t sub_1A2E5C1D8@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * ((a1 & 0x36DFEF7) - 57533478)))(v1);
  return v2;
}

int *sub_1A2E5F9F4(int *result)
{
  int v1 = 1607344658;
  unsigned int v2 = result[2] ^ (2052531167
                  * (((result | 0x5A1B0962) - result + (result & 0xA5E4F69D)) ^ 0x9F91BE4E));
  if (v2 - 1830816770 > 0x39
    || ((1 << ((*((unsigned char *)result + 8) ^ (-33
                                                           * (((result | 0x62)
                                                             - (_BYTE)result
                                                             + (result & 0x9D)) ^ 0x4E)))
               - 2)) & 0x3C8E3C03CE503CFLL) == 0)
  {
    unsigned int v4 = v2 - 1830818786;
    BOOL v5 = v4 > 0xD;
    int v6 = (1 << v4) & 0x203F;
    if (v5 || v6 == 0) {
      int v1 = 1607344657;
    }
  }
  *uint64_t result = v1;
  return result;
}

void tn46gtiuhw(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4) {
    BOOL v7 = a5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v10 = v7 || a6 == 0 || a7 == 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E5FB58(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  return (*(uint64_t (**)(void))(v7 + 8 * ((50 * (qword_1E95A6A60 == 0)) ^ 0x45Au)))();
}

uint64_t sub_1A2E5FBB8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((4 * (*(void *)(v3 + 24) == 0)) | (8 * (*(void *)(v3 + 24) == 0))) ^ (v0 + v1 - 986))))();
}

uint64_t sub_1A2E5FBE4()
{
  (*(void (**)(void))(v2 + 8 * (v1 + v0)))();
  *(void *)(v3 + 24) = 0;
  *(_DWORD *)(v3 + 36) = 0;
  *(void *)uint64_t v3 = 0;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((4 * (*(void *)(v3 + 48) != 0)) | (16 * (*(void *)(v3 + 48) != 0)) | (v0 + v1 - 733))))();
}

uint64_t sub_1A2E5FC2C()
{
  (*(void (**)(void))(v2 + 8 * (v1 ^ (v1 - 2221))))();
  *(void *)(v3 + 48) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((63 * (*(void *)(v3 + 64) == 0)) ^ (v0 + v1 - 1451))))();
}

uint64_t sub_1A2E5FC70()
{
  *(_DWORD *)(v3 + 76) = 0;
  *(void *)(v3 + 40) = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v0 + v1 + 76)))(24, 4101018099);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 8 * (((v4 == 0) * ((v1 ^ (v1 + 12)) - 980)) | (v0 + v1 - 1126))))(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1A2E5FD88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 120617518;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8 * (v9 + 1303)))(4096, 1358311088);
  *(void *)a1 = v12;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8 * (int)(((v12 == 0) * ((2 * v9) ^ 0x186 ^ (v9 + 492302575) & 0xE2A80FBE ^ 0x2C5)) ^ v9)))(v12, v13, v14, v15, v16, v17, v18, v19, a9);
}

uint64_t sub_1A2E5FE14()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 + v0 - 1261) ^ (v0 - v4 + 1053)) * (v3 == 0)) | v0)))();
}

uint64_t sub_1A2E5FE48@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v2 + 8 * ((a1 - 1186) ^ (v1 - 2221))))(v3);
  return v4;
}

void fy34trz2st()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A350[byte_1A3019F38[(9
                                                                                                * ((dword_1E95A44F8
                                                                                                  + dword_1E95A4510) ^ 0x7D))
                                                                              - 8] ^ 0x6E] ^ (9
                                                                                            * ((dword_1E95A44F8
                                                                                              + dword_1E95A4510) ^ 0x7D)))
                + 15);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A250[byte_1A3019E30[(9 * (v1 ^ dword_1E95A44F8 ^ 0x7D))] ^ 0x19] ^ (9 * (v1 ^ dword_1E95A44F8 ^ 0x7D)))
                - 39);
  uint64_t v3 = *(void *)(v2 - 4) - v1 - (void)&v8;
  unint64_t v4 = (1787074057 * v3) ^ 0xEDEBC87B5EDF1A7DLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v4;
  *(void *)(v2 - 4) = v5;
  uint64_t v6 = (char *)*(&off_1E5AC6910
               + ((9 * ((dword_1E95A44F8 + dword_1E95A4510) ^ 0x7D)) ^ byte_1A301A550[byte_1A301A130[(9 * ((dword_1E95A44F8 + dword_1E95A4510) ^ 0x7D))] ^ 0x81])
               - 132)
     - 4;
  uint64_t v7 = *(void *)&v6[8
                    * ((1009
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v6[8
                                                                        * ((9
                                                                                           * ((v5 - *(_DWORD *)(v0 - 4)) ^ 0x7D)) ^ byte_1A301A250[byte_1A3019E30[(9 * ((v5 - *(_DWORD *)(v0 - 4)) ^ 0x7D))] ^ 0xB5])
                                                                        + 17320])(24, 4101018099) != 0)) ^ 0x5F2)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E63D64(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 933984072;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((40 * (v3 == 0)) ^ 0x480u)))();
}

uint64_t sub_1A2E63DDC()
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v1 - v2 - 509) ^ v1 ^ (v3 + 1040) ^ 0xA3) * (v0 == 0)) ^ v1)))();
}

uint64_t sub_1A2E63E18@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a1 - 937701277)))(v1);
  return v2;
}

void jk24uiwqrg(uint64_t a1)
{
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1A2E66E78@<X0>(uint64_t a1@<X8>)
{
  return 0;
}

void asabc800ag(uint64_t a1, uint64_t a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = v2;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E66EFC(void *a1, _DWORD *a2)
{
  *a1 = 0;
  *a2 = 0;
  BOOL v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 18520))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((4085 * v3) ^ 0x7E7u)))();
}

uint64_t sub_1A2E66F4C(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 1411182149;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((2 * (((v3 == 0) ^ 0xF7) & 1)) ^ 0x40Du)))();
}

uint64_t sub_1A2E66FB8(uint64_t a1, uint64_t a2)
{
  *(void *)(v7 - 152) = v5;
  *(void *)(v7 - 232) = v6 + 0x3797084C688F39EALL;
  *(_DWORD *)(v6 + 8) = v3 + 4096;
  char v8 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void))(v4
                                                                           + 8
                                                                           * ((((179 * (v2 & 0x46B7 ^ 0x6A5)) ^ 0x173)
                                                                             * (v6 == 0)) ^ v2 & 0x46B7u));
  uint64_t v9 = (char *)*(&off_1E5AC6910 + (v2 & 0x46B7 ^ 0x6AAu)) - 8;
  *(void *)(v7 - 224) = v9;
  *(void *)(v7 - 216) = v6;
  *(void *)(v7 - 208) = v9;
  return v8(a1, a2, 0, 0x3935222BFCD46514, 0);
}

uint64_t sub_1A2E67064()
{
  unsigned int v3 = *(_DWORD *)(v2 + 12) + 1775094903;
  unsigned int v4 = (v0 ^ 0x1C8) + 363912576 + *(_DWORD *)(v2 + 8);
  BOOL v5 = v3 < 0x69CDCC73;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x69CDCC73) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((v7 * ((((v0 ^ 0x1C8) - 792126199) & 0x136E65C) + 765)) ^ v0 ^ 0x1C8u)))(v2 + 8);
}

uint64_t sub_1A2E670F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (2 * (v4 ^ 0x4A7)) ^ 0x16D;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void))(v5 + 8 * ((v8 * (v6 == 0)) | v4));
  *(void *)(v7 - 208) = v8;
  return v9(a1, a2, 0, a4, 0);
}

uint64_t sub_1A2E67140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,int a29)
{
  unsigned int v31 = ((2 * (2 * a29 + 1472602998)) & 0xE9FFDCF8) + ((2 * a29 + 1472602998) ^ 0x74FFEE7D);
  if ((a29 + 296586160) < 0x65CA79F1 != v31 - 255161484 < (((v29 ^ 0x9A) - 460) ^ 0x65CA7B33u)) {
    BOOL v32 = v31 - 255161484 < (((v29 ^ 0x9A) - 460) ^ 0x65CA7B33u);
  }
  else {
    BOOL v32 = v31 - 255161484 > a29 + 296586160;
  }
  return (*(uint64_t (**)(void))(v30 + 8 * ((348 * v32) ^ v29 ^ 0x9Au)))();
}

uint64_t sub_1A2E671EC()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((((((v0 | 0x262) - 771456489) | 0x20284704) - 2) ^ (((v0 | 0x262) + 51350) | 0xF22C0085))
                                     * (v2 == 0)) ^ (v0 | 0x262))))();
}

uint64_t sub_1A2E67244@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v1 + 8 * (int)(a1 ^ 0xF22CC72A)))(v3);
  return v2;
}

void zcamdt242h(uint64_t a1, int a2)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E6A8B4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((233 * (((*(void *)(v0 + 16) == 0) ^ 0x91) & 1)) ^ 0x27D)))();
}

uint64_t sub_1A2E6A8FC()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v0 + 234) ^ 0x1EE ^ (14 * (v0 ^ 0x99))) * (*(void *)(v1 + 32 * v3 + 24) == 0)) ^ v0)))();
}

uint64_t sub_1A2E6A940@<X0>(int a1@<W8>)
{
  unsigned int v4 = (a1 + 2125858659) & 0x8149F97E;
  uint64_t v5 = (*(uint64_t (**)(void))(v1 + 8 * (a1 | 0x825)))();
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (int)((((((v4 + 196) | 0x3D) ^ 0xFFFFFFE4) + v4 + 481) * (v2 + 1 == v3)) ^ v4)))(v5);
}

uint64_t sub_1A2E6A9A8()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((727 * (v0 == 0)) ^ 0x18A)))();
}

uint64_t sub_1A2E6A9E0@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((233 * (((*(void *)(v1 + 32 * v3 + 16) == 0) ^ (a1 + 20)) & 1)) ^ a1)))();
}

uint64_t sub_1A2E6AA1C@<X0>(int a1@<W8>)
{
  int v4 = 73 * (a1 ^ 0x27F);
  (*(void (**)(void))(v2 + 8 * (a1 + 1602)))();
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v4 + 234) ^ 0x1EE ^ (14 * (v4 ^ 0x99))) * (*(void *)(v1 + 32 * v3 + 24) == 0)) ^ v4)))();
}

uint64_t sub_1A2E6AA80()
{
  return (*(uint64_t (**)(void))(v1 + 8
                                   * (int)((((((v0 + 196) | 0x3D) ^ 0xFFFFFFE4) + v0 + 481) * (v2 + 1 == v3)) ^ v0)))();
}

uint64_t sub_1A2E6AABC()
{
  (*(void (**)(uint64_t))(v2 + 8 * (v0 + 1378)))(v1);
  return 0;
}

uint64_t sub_1A2E6AAE8()
{
  uint64_t v0 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A350[byte_1A3019E38[(9
                                                                                  * (dword_1E95A4500 ^ 0x7D ^ dword_1E95A44F8))
                                                                + 248] ^ 0xF5] ^ (9
                                                                                * (dword_1E95A4500 ^ 0x7D ^ dword_1E95A44F8)))
                - 238);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A554[(byte_1A301A130[(9 * ((dword_1E95A44F8 - v1) ^ 0x7D))] ^ 0x60)
                                                 - 4] ^ (9 * ((dword_1E95A44F8 - v1) ^ 0x7D)))
                - 113);
  unint64_t v3 = v1 ^ (unint64_t)&v13 ^ *(void *)(v2 - 4);
  uint64_t v4 = 1787074057 * v3 - 0x6585E11862ED39BLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v4;
  *(void *)(v2 - 4) = v5;
  LOBYTE(v4) = *(_DWORD *)(v0 - 4);
  uint64_t v6 = (char *)*(&off_1E5AC6910
               + ((9 * (dword_1E95A4500 ^ 0x7D ^ dword_1E95A44F8)) ^ byte_1A3019C20[byte_1A301A690[(9 * (dword_1E95A4500 ^ 0x7D ^ dword_1E95A44F8))] ^ 0x92])
               - 183)
     - 4;
  (*(void (**)(void))&v6[8
                                    * ((9 * ((v5 - v4) ^ 0x7D)) ^ byte_1A3019C20[byte_1A301A690[(9 * ((v5 - v4) ^ 0x7D))] ^ 0x84])
                                    + 18800])(*(unsigned int *)*(&off_1E5AC6910
                                                               + (byte_1A3019C20[byte_1A301A690[(9 * ((v5 + v4) ^ 0x7D))] ^ 0x8A] ^ (9 * ((v5 + v4) ^ 0x7D)))
                                                               - 29));
  char v7 = *(_DWORD *)(v0 - 4);
  char v8 = *(_DWORD *)(v2 - 4);
  (*(void (**)(void))&v6[8
                                    * (byte_1A301A454[(byte_1A301A034[(9 * ((v8 + v7) ^ 0x7D))
                                                                                     - 4] ^ 0x5E)
                                                                     - 4] ^ (9 * ((v8 + v7) ^ 0x7D)))
                                    + 18208])(*(unsigned int *)*(&off_1E5AC6910
                                                               + (byte_1A301A258[(byte_1A3019E38[(9 * (v7 ^ 0x7D ^ v8)) - 8] ^ 0xD)
                                                                                                - 8] ^ (9 * (v7 ^ 0x7D ^ v8)))
                                                               - 101));
  unsigned __int8 v9 = 9 * (*(_DWORD *)(v0 - 4) ^ 0x7D ^ *(_DWORD *)(v2 - 4));
  uint64_t v10 = *(unsigned int *)*(&off_1E5AC6910 + (v9 ^ byte_1A301A350[byte_1A3019E38[v9 + 248] ^ 0x78])
                                          - 173);
  uint64_t v11 = *(uint64_t (**)(uint64_t))&v6[8
                                             * (byte_1A3019D28[(byte_1A301A79C[v9 - 12] ^ 0xC0) - 8] ^ v9)
                                             + 18344];

  return v11(v10);
}

void rsegvyrt87(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E6AE28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5)
{
  *a4 = 0;
  *a5 = 0;
  BOOL v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 18520))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v5 + 8 * ((115 * v6) ^ 0x333u)))();
}

uint64_t sub_1A2E6AE88(uint64_t a1)
{
  *(void *)(v5 - 216) = v3;
  *(void *)(v5 - 168) = v2;
  *(_DWORD *)(v5 - 184) = v1;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 650052673;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 18520))(4096, 1358311088);
  *(void *)a1 = v7;
  return (*(uint64_t (**)(void))(v4 + 8 * ((255 * (v7 != 0)) ^ 0x66A)))();
}

uint64_t sub_1A2E6AF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v26 - 224) = v25;
  *(void *)(v26 - 176) = 0;
  *(_DWORD *)(v26 - 180) = 0;
  *(void *)(v26 - 136) = v21 + 0x5B68E37D168561B2;
  *(_DWORD *)(v21 + 8) = v24 + 4096;
  uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8 * (((((v22 - 648) | 0x142) - 83) * (v21 == 0)) ^ (v22 + 1271)));
  uint64_t v28 = (uint64_t)*(&off_1E5AC6910 + ((v22 + 1271) ^ 0x769u));
  *(void *)(v26 - 200) = (char *)*(&off_1E5AC6910 + ((v22 + 1271) ^ 0x772u)) - 8;
  *(void *)(v26 - 192) = v28;
  *(void *)(v26 - 152) = 0x7D34AE117A9B271ALL;
  return v27(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_1A2E6AFA8()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + 2057538897;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + ((v0 + 793321141) & 0xD0B6E37E) + (((v0 + 1855) | 0x42) ^ 0x53E48D55);
  BOOL v5 = v3 < 0x7AA38D4D;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x7AA38D4D) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((1595 * v7) ^ v0)))(v1 + 8);
}

uint64_t sub_1A2E6B03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(void *)(v21 - 176) = 0;
  *(_DWORD *)(v21 - 180) = 0;
  int v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 8 * (int)((((v18 + 1606807577) ^ 0x56000807 ^ (v18 + 1606807577) & 0xA9FFF7FF) * (v19 == 0)) ^ v18));
  *(void *)(v21 - 152) = 0x7D34AE117A9B271ALL;
  return v22(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a1);
}

uint64_t sub_1A2E6B0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27)
{
  unsigned int v29 = ((2 * (2 * a27 - 1300105346)) & 0x7FFE9AD4) + ((2 * a27 - 1300105346) ^ 0xBFFF4D6B);
  if ((a27 + 1884709690) < 0x97156777 != v29 - 686417396 < ((v27 - 163965510) | 0x48u) - 1760206695) {
    BOOL v30 = v29 - 686417396 < ((v27 - 163965510) | 0x48u) - 1760206695;
  }
  else {
    BOOL v30 = v29 - 686417396 > a27 + 1884709690;
  }
  return (*(uint64_t (**)(void))(v28 + 8 * ((219 * v30) ^ (v27 - 163965034))))();
}

uint64_t sub_1A2E6B180()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((69 * ((((v1 + 138464844) ^ v1 ^ (v2 + 376) ^ (v0 == 0)) & 1) == 0)) | v1)))();
}

uint64_t sub_1A2E6B1C4@<X0>(int a1@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a1 ^ (v2 + 1927))))(v1);
  return v4;
}

uint64_t gJa8aF901k(uint64_t a1)
{
  if (unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8)))
  {
    uint64_t v1 = *((void *)&unk_1EF5E4FA0
         + ((16
           * ((*(uint64_t (**)(uint64_t, uint64_t))((char *)&unk_1EF5E4FA4 + 18516))(24, 4101018099) != 0)) | 0x568EF585u)
         - 1452207770);
    __asm { BRAA            X8, X17 }
  }
  return 4294922295;
}

void sub_1A2E6F264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  (*(void (**)(void))(v22 + 8 * (v24 + v23)))(*v21);
  *uint64_t v21 = a13;
  *a14 = a21;
  JUMPOUT(0x1A2E6F298);
}

uint64_t sub_1A2E6F358()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v1 == 0) ^ (5 * (v0 ^ 0xA))) & 1)
                                * (((v0 + 158939080) & 0x7686C7E4) - 23)) ^ v0)))();
}

uint64_t sub_1A2E6F3AC()
{
  unsigned int v3 = ((v0 - 1146) ^ 0x5867432D) + *(_DWORD *)(v1 + 12);
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 337859105;
  BOOL v5 = v3 < v0 + 1483160741;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x58674236) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((615 * v6) ^ v0)))();
}

uint64_t sub_1A2E6F428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8 * ((50 * (v24 != 0)) ^ v23));
  HIDWORD(a22) = v22;
  *(void *)(v27 - 144) = v26;
  return v28(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22);
}

uint64_t sub_1A2E6F47C()
{
  unsigned int v3 = v1 - 1239118730;
  BOOL v4 = (v1 - 1239118730) < 0xFA687C87;
  unsigned int v5 = ((2 * (2 * v1 + 2004361174)) & 0x9DAFFA3C)
     + ((2 * v1 + 2004361174) ^ (((v0 - 2141645342) & 0xD635ED3F) - 824707069));
  if (v4 != v5 + 730890088 < 0xFA687C87) {
    BOOL v6 = v5 + 730890088 < 0xFA687C87;
  }
  else {
    BOOL v6 = v5 + 730890088 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((19 * !v6) ^ (v0 + 1452212725))))();
}

uint64_t sub_1A2E6F544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v28 = *(void *)(v27 - 136);
  int v29 = 98 * (v24 ^ 0x115);
  *(void *)(v27 - 136) = v28;
  uint64_t v30 = *(void *)(v28 - 0x29BAE573B9AE997FLL);
  int v31 = ((2 * a9) & 0x7FBEFFDE) + (a9 ^ 0x3FDF7FEF) - 1071612081;
  *(unsigned char *)(v30 + (v31 + 194)) = 99;
  *(unsigned char *)(v30 + (v31 + 195)) = 43;
  *(unsigned char *)(v30 + (v31 + v29)) = -115;
  *(unsigned char *)(v30 + (v31 + 197)) = 110;
  *v23 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8 * ((v29 + 1851) ^ (v26 + 799) ^ (v29 - 1452211914) ^ v29)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23);
}

uint64_t sub_1A2E6F708()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((6 * (v0 ^ 0x735) + ((v0 - 1982) | 0x306) + 2036) * (v1 == 0)) ^ v0)))();
}

uint64_t sub_1A2E6F750()
{
  unsigned int v3 = ((v0 + 214) ^ 0xC898193A) + *(_DWORD *)(v1 + 12);
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 2074858353;
  BOOL v5 = v3 < 0xC8981CA4;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0xC8981CA4) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v6 * (10 * (v0 ^ 0x4E9) - 487)) ^ v0)))();
}

uint64_t sub_1A2E6F7D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  HIDWORD(a24) = v25;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((((v26 - 421) ^ 0x199) * (v27 != 0)) ^ v26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           v28);
}

uint64_t sub_1A2E6F810()
{
  unsigned int v3 = v1 - 641974977;
  BOOL v4 = (v1 - 641974977) < 0x1E002D50;
  unsigned int v5 = ((2 * (((v0 + 731) | 0x104) + 2004361174 + 2 * v1 - 1420)) & 0xD88FF0A8)
     + ((((v0 + 731) | 0x104) + 2004361174 + 2 * v1 - 1420) ^ 0xEC47F855);
  if (v4 != v5 + 834155771 < 0x1E002D50) {
    BOOL v6 = v5 + 834155771 < 0x1E002D50;
  }
  else {
    BOOL v6 = v5 + 834155771 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1113 * v6) ^ v0)))();
}

uint64_t sub_1A2E6F8BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v32 = *(void *)(v31 - 136);
  int v33 = v28 - 587;
  *(void *)(v31 - 136) = v32;
  uint64_t v34 = *(void *)(v32 - 0x29BAE573B9AE997FLL);
  unsigned int v35 = ((a9 << (v33 ^ 0x46)) & 0xDFFFF9FE) + (a9 ^ 0x6FFFFCFF) - 1879047423;
  *(unsigned char *)(v34 + v35) = 0;
  *(unsigned char *)(v34 + v35 + 1) = 0;
  *(unsigned char *)(v34 + v35 + 2) = 0;
  *(unsigned char *)(v34 + v35 + 3) = 1;
  *v27 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((v30 + ((v33 - 830) | 0x3A2) - 330) ^ v33 ^ (v30 + 195) ^ v33)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E6FA78()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v0 ^ 0x161) - 360) ^ 0x173) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_1A2E6FAB0()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1382934046;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + (v0 ^ 0x694E2B0F);
  BOOL v5 = v3 < 0xAD9219DA;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0xAD9219DA) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v6 * ((v0 + 1354) ^ 0x83D)) ^ v0)))();
}

uint64_t sub_1A2E6FB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  LODWORD(a25) = v27;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (((v28 - 995 + 177 * (v28 ^ 0x816) - 1425) * (v29 == 0)) | v28)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E6FB6C()
{
  unsigned int v3 = v0 + 477223401;
  BOOL v4 = (v0 + 477223401) < 0x60B5C9F6;
  unsigned int v5 = ((2 * (2 * v0 + 2004361174)) & 0xEDF7E8F8) + ((v1 + 958998766) & 0xC6D6D7FF ^ (2 * v0 + 2004361174) ^ 0x76FBF162);
  if (v4 != v5 - 373697159 < 0x60B5C9F6) {
    BOOL v6 = v5 - 373697159 < 0x60B5C9F6;
  }
  else {
    BOOL v6 = v5 - 373697159 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((3291 * v6) ^ v1)))();
}

uint64_t sub_1A2E6FC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v33 = *(void *)(v32 - 136);
  uint64_t v34 = *(void *)(v32 - 216);
  unint64_t v35 = v34 - ((2 * v34) & 0xF99431D3CA63CC58) + (v28 ^ 0x7CCA18E9E531E4E6);
  *(void *)(v32 - 136) = v33;
  uint64_t v36 = (unsigned char *)(((2 * a9) & 0x1D3F8DBB6)
                + (a9 ^ 0xA3BF793FE9FC6DDBLL)
                + *(void *)(v33 - 0x29BAE573B9AE997FLL)
                + 0x5C4086C016039225);
  *uint64_t v36 = HIBYTE(v35) ^ 0x7C;
  v36[1] = BYTE6(v35) ^ 0xCA;
  v36[2] = BYTE5(v35) ^ 0x18;
  v36[3] = BYTE4(v35) ^ 0xE9;
  v36[4] = ((v34 - ((2 * v34) & 0xCA63CC58) + (v28 ^ 0xE531E4E6)) >> 24) ^ 0xE5;
  v36[5] = BYTE2(v35) ^ 0x31;
  v36[6] = BYTE1(v35) ^ 0xE6;
  v36[7] = v35 ^ 0x2C;
  *v29 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (int)(((v28 ^ 0x3A8 ^ (v31 - 354)) - v31 + 189) ^ v28 ^ 0x3A8)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A2E6FE60()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((((v0 + 229) ^ 0xE0) + 349) ^ 0xFFFFFD8E) + 251 * ((v0 + 229) ^ 0xE0))
                                     * (v1 == 0)) ^ (v0 + 229))))();
}

uint64_t sub_1A2E6FEA4()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1452124039;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + ((v0 - 452) ^ 0x652E6B7F);
  BOOL v5 = v3 < 0xA9725871;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 73 * (v0 ^ 0x4ECu) - 1452124850) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((3568 * v6) ^ v0)))();
}

uint64_t sub_1A2E6FF2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  HIDWORD(a25) = v28;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (((4 * (((v30 == 0) ^ (v29 + 48)) & 1)) & 0xF7 | (8 * (((v30 == 0) ^ (v29 - 720)) & 1))) ^ v29)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_1A2E6FF74()
{
  unsigned int v3 = v1 + 1498273165;
  BOOL v4 = (v1 + 1498273165) < 0x9D91C59A;
  unsigned int v5 = ((2 * ((v0 ^ 0x77781F84) + 2 * v1)) & 0x9DA7E77C) + (((v0 ^ 0x77781F84) + 2 * v1) ^ 0xCED3F3BF);
  if (v4 != v5 - 826420773 < 0x9D91C59A) {
    BOOL v6 = v5 - 826420773 < 0x9D91C59A;
  }
  else {
    BOOL v6 = v5 - 826420773 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1763 * v6) ^ v0)))();
}

uint64_t sub_1A2E7001C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v34 = *(void *)(v33 - 136);
  int v35 = 118 * (v30 ^ 0x320);
  unint64_t v36 = *(void *)(v33 - 208)
      + 0x7CCA18E9E531E62CLL
      - ((*(void *)(v33 - 208) << (v35 ^ 0x63u)) & 0xF99431D3CA63CC58);
  *(void *)(v33 - 136) = v34;
  uint64_t v37 = (unsigned char *)(((2 * a9) & 0x1CFBF7B3ELL)
                + (a9 ^ 0x7BEFE7FBE7DFBD9FLL)
                + *(void *)(v34 - 0x29BAE573B9AE997FLL)
                - 0x7BEFE7FBE7DFBD9FLL);
  *uint64_t v37 = HIBYTE(v36) ^ 0x7C;
  v37[1] = BYTE6(v36) ^ 0xCA;
  v37[2] = BYTE5(v36) ^ 0x18;
  v37[3] = BYTE4(v36) ^ 0xE9;
  v37[4] = BYTE3(v36) ^ 0xE5;
  v37[5] = BYTE2(v36) ^ 0x31;
  v37[6] = BYTE1(v36) ^ 0xE6;
  v37[7] = v36 ^ 0x2C;
  *v29 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (int)((((v35 - 1459617898) ^ 0xA9000418 ^ (v32 + 285)) + ((v35 - 1459617898) | 0x710102)) ^ v35)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1A2E70290()
{
  *(void *)(v5 - 192) = v2;
  *(void *)(v5 - 128) = 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v0 ^ (v4 + 800)) - v4 + 2) * (v1 == 0)) | v0)))();
}

uint64_t sub_1A2E702D8@<X0>(int a1@<W8>)
{
  int v4 = a1 + 2034;
  uint64_t v5 = (*(uint64_t (**)(void))(v1 + 8 * (a1 + 2337)))();
  BOOL v6 = *(void (**)(void))(v1 + 8 * (v4 + 247));
  *(void *)(v3 - 200) = v5;
  v6();
  uint64_t v7 = (*(uint64_t (**)(void, void))(v1 + 8 * (v4 ^ 0xF0D)))(*(void *)(v3 - 160), 0);
  *(void *)(v3 - 176) = 0;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v7 == 0) * ((v4 ^ (v2 + 1038)) - v2 + 4091)) ^ v4)))();
}

uint64_t sub_1A2E70370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v33 = v29 + 433;
  uint64_t v34 = (*(uint64_t (**)(void, uint64_t, void))(v30 + 8 * (v33 + 1875)))(*(void *)(v31 - 160), a1, 0);
  int v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (((v34 == 0) * (((7 * (v33 ^ 0x1D4)) ^ 0x568EFCAE) + ((v33 - 1993343167) | 0x20410108))) ^ v33));
  *(void *)(v31 - 176) = a1;
  return v35(v34, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1A2E70408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  (*(void (**)(uint64_t, char *))(v26 + 8 * (v25 ^ 0xBF0)))(a1, (char *)*(&off_1E5AC6910 + (v25 ^ 0x2DC)) - 12);
  (*(void (**)(uint64_t))(v26 + 8 * (v25 ^ 0xA72)))(a1);
  (*(void (**)(uint64_t, void))(v26 + 8 * (v25 + 1641)))(a1, *(void *)(v27 - 200));
  int v29 = (void *)(*(uint64_t (**)(void))(v26 + 8 * (v25 + 1615)))();
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (((((v25 ^ 0x36B ^ (v29 == *(&off_1E5AC6910 + v25 - 697))) & 1) == 0) * (((v25 - 651) | 0x586) - 1001)) ^ v25)))(v29, v30, v31, v32, v33, v34, v35, v36, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A2E704C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 8 * (v35 + 856)))(a33, v34, v36 - 128);
  uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33
                                                                                                + 8
                                                                                                * (int)(((v37 == 0) * (v35 + ((v35 + 550736449) & 0xDF2C6BDB) - 2357)) ^ v35));
  *(void *)(v36 - 184) = 0x79483BA612D83A8ELL;
  *(void *)(v36 - 152) = 0x79483BA612D83A8ELL;
  return v38(v37, v39, v40, v41, v42, v43, v44);
}

uint64_t sub_1A2E70550()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 ^ 0xAD0)))(24, 4101018099);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1
                                                                                               + 8
                                                                                               * (((2
                                                                                                  * (((v3 == 0) ^ (v0 - 59 + v0 - 75 + 1)) & 1)) & 0xDF | (32 * (((v3 == 0) ^ (v0 - 59 + v0 - 75 + 1)) & 1))) ^ v0));
  *(void *)(v2 - 184) = 0x79483BA612D83A8ELL;
  *(void *)(v2 - 152) = 0x79483BA612D83A8ELL;
  return v4(v3, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1A2E705DC(uint64_t a1)
{
  *(void *)(v3 - 152) = a1 + 0x79483BA612D83A8ELL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 1171913814;
  *(void *)(a1 + 12) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 107)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v5 == 0) * ((13 * (v1 ^ 0x833) - 1036) ^ (v1 - 1341))) | v1)))();
}

uint64_t sub_1A2E70664()
{
  int v4 = *(uint64_t (**)(void))(v0 + 8 * (int)((((v1 - 1451809149) & 0xFFF9D3FF ^ 0xA9710120) * (v2 != 0)) ^ v1));
  *(void *)(v3 - 184) = 0x79483BA612D83A8ELL;
  return v4();
}

uint64_t sub_1A2E706C8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v24 = a1 - 4088;
  (*(void (**)(uint64_t))(v21 + 8 * (a1 + 1452209869)))(v22);
  *(void *)(v23 - 184) = 0x79483BA612D83A8ELL;
  *(void *)(v23 - 152) = 0x79483BA612D83A8ELL;
  (*(void (**)(uint64_t))(v21 + 8 * (v24 + 1452214027)))(v20);
  (*(void (**)(uint64_t))(v21 + 8 * (int)(v24 ^ 0xA97108FF)))(a20);
  return (*(uint64_t (**)(void))(v21
                              + 8
                              * (((4 * (*(void *)(v23 - 200) == 0)) | (8 * (*(void *)(v23 - 200) == 0))) ^ (v24 + 1452212699))))();
}

uint64_t sub_1A2E70FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 8 * ((v34 + 3496) ^ (79 * (a33 == 0))));
  *(void *)(v36 - 176) = v33;
  return v37(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1A2E70FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v38 = (*(uint64_t (**)(void))(v36 + 8 * v35))();
  uint64_t v39 = *(uint64_t (**)(uint64_t))(v36 + 8 * ((v34 + 3496) ^ (79 * (a33 == 0))));
  *(void *)(v37 - 176) = v33;
  return v39(v38);
}

uint64_t sub_1A2E7103C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v41 = (*(uint64_t (**)(uint64_t))(v36 + 8 * (v38 + 1452214027)))(a33);
  *(void *)(v40 - 176) = v34;
  if (v37 == -45004)
  {
    *(void *)(v40 - 152) = v35;
    *(void *)(v40 - 120) = 0;
    *(_DWORD *)(v40 - 112) = 0;
    uint64_t v42 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v36 + 8 * (v39 + 1452214060)))(*(unsigned int *)*(&off_1E5AC6910 + (v39 ^ (v39 - 8))), *(void *)v33, *(unsigned int *)(v33 + 12), v40 - 120, v40 - 112);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * ((824 * ((v42 ^ 0x5E5DEEB9) - 335545392 + ((2 * v42) & 0xBCBBDD72) == 1516104332)) ^ (v39 + 1452212148))))(v42, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29);
  }
  else if (v37)
  {
    return (*(uint64_t (**)(uint64_t))(v36 + 8 * ((120 * (v33 == 0)) ^ 0x5B7)))(v41);
  }
  else
  {
    return (*(uint64_t (**)(uint64_t))(v36
                                              + 8 * ((25 * (*(void *)(v40 - 184) != 0x79483BA612D83A8ELL)) ^ 0x347)))(v41);
  }
}

uint64_t sub_1A2E71768()
{
  uint64_t v3 = *(void *)(v2 - 184);
  unsigned int v4 = *(_DWORD *)(v3 - 0x79483BA612D83A82) - 886711989;
  unsigned int v5 = *(_DWORD *)(v3 - 0x79483BA612D83A86) - 2058625807;
  int v6 = (v4 < 0xCB25D947) ^ (v5 < ((v0 - 1989083064) | 0x20000050u) + 565499725);
  BOOL v7 = v4 > v5;
  if (v6) {
    BOOL v7 = v4 < 0xCB25D947;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((!v7 * ((v0 ^ 0x99F) - 2290)) ^ v0)))();
}

uint64_t sub_1A2E71828@<X0>(int a1@<W8>)
{
  uint64_t v5 = *(void *)(v4 - 184);
  *uint64_t v2 = v1 + 4;
  return (*(uint64_t (**)(void))(v3 + 8 * (a1 ^ ((v5 == 0x79483BA612D83A8ELL) | (2 * (v5 == 0x79483BA612D83A8ELL))))))();
}

void sub_1A2E718F4(int a1@<W8>)
{
  uint64_t v5 = 8 * (a1 - 62);
  (*(void (**)(void))(v4 + v5))();
  void *v1 = 0;
  _DWORD *v3 = 1171913814;
  *uint64_t v2 = 0;
  (*(void (**)(void *))(v4 + v5))(v1);
  JUMPOUT(0x1A2E72250);
}

uint64_t sub_1A2E7194C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,_DWORD *a31,int a32,int a33)
{
  uint64_t v39 = (*(uint64_t (**)(void))(v35 + 8 * (v37 ^ (v37 + 1867))))(*(void *)(v33 - 0x79483BA612D83A8ELL));
  *(void *)(v33 - 0x79483BA612D83A8ELL) = a23;
  *a31 = a33;
  *(void *)(v38 - 144) = v36;
  return (*(uint64_t (**)(uint64_t))(v35 + 8 * (v34 + v37 + 4103)))(v39);
}

void sub_1A2E719EC()
{
  *(void *)(v1 - 168) = v0;
  JUMPOUT(0x1A2E71A1CLL);
}

uint64_t sub_1A2E71A98()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v3 + ((v1 - 177) | 2) - 341) ^ ((v1 - 2127495305) | 0x2840010A)) * (v0 != 0)) ^ v1)))();
}

uint64_t sub_1A2E71AE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v7 = (unint64_t)(a1 - a2) < 0x20 || v2 < v4 + ((40 * (v3 ^ 0xD0) - 1418502162) & 0xFDFD9DFA) + 2185;
  return (*(uint64_t (**)(void))(v5 + 8 * (((2 * v7) | (32 * v7)) ^ v3)))();
}

uint64_t sub_1A2E71B3C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((51
                                * (v0 < v2 + ((v1 - 919523605) ^ 0x60403301) + ((v1 - 919523605) & 0x36CECDFDu) + 1960)) ^ v1)))();
}

uint64_t sub_1A2E71B90@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v2 & 0xFFFFFFE0) == 32) * (((v3 + 2690) | 0x52) - 579)) ^ (v3 + 2914))))();
}

void sub_1A2E71BD8()
{
}

uint64_t sub_1A2E71BE8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v3 + ((v1 - 1605304555) | 0x92000DA) - 67) ^ (63 * (v1 ^ 0x229))) * (v0 == 0)) ^ v1)))();
}

uint64_t sub_1A2E71C38()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * ((58 * (v1 >= ((v0 - 1451527264) & 0xFFF585FB) + v2 + 115 * (v0 ^ 0x84D))) ^ v0)))();
}

uint64_t sub_1A2E71C8C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 - v3 + 54) ^ (v4 + 32) ^ 0x3D9) * (v0 < 0x20)) ^ v1)))();
}

uint64_t sub_1A2E71CC4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v0 < 0x20) ^ (v1 - v2 - 96)) & 1) * (((v1 - 722) | 1) + 1718)) ^ v1)))();
}

uint64_t sub_1A2E71D00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v8 = (v3 - 3169 - v7 + 1975) ^ v6;
  uint64_t v9 = a2 + (v8 & (v2 - 1));
  long long v10 = *(_OWORD *)(v9 - 31);
  uint64_t v11 = a1 + (v8 & (v2 - 1));
  *(_OWORD *)(v11 - 15) = *(_OWORD *)(v9 - 15);
  *(_OWORD *)(v11 - 31) = v10;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((2 * ((v2 & 0xFFFFFFE0) == 32)) | (32 * ((v2 & 0xFFFFFFE0) == 32)) | (v4 + v3 - 3169 + 3841))))();
}

void sub_1A2E71D60()
{
}

uint64_t sub_1A2E71D6C(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((((a2 ^ (v5 - 1) ^ (v2 == v3)) & 1) == 0) * (a2 - 547)) ^ a2)))();
}

uint64_t sub_1A2E71DA0(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((a2 - 346) ^ (v4 - 247) ^ (v4 - 3)) * ((v2 & 0x18) == 0)) | (a2 + 221))))();
}

uint64_t sub_1A2E71DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((53 * (((v4 + 1196036742) & 0xB8B5EFBD ^ 0x335) + v2 != ((v6 + v4 - 45 + 1764) & v3))) ^ (v4 - 45))))();
}

uint64_t sub_1A2E71E38()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (int)(((v4 + v2 + ((v2 + 155188541) | 0xA0310180) - 38) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A2E71E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + v2) = *(unsigned char *)(a2 + v2);
  return (*(uint64_t (**)(void))(v6 + 8 * ((61 * (v2 + 1 == v3)) ^ (v5 + v4 + 4038))))();
}

uint64_t sub_1A2E71EAC()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((127 * (v0 != v1)) ^ v2)))();
}

uint64_t sub_1A2E71ECC()
{
  int v4 = 2 * ((v1 - 335606200) & 0x3D71EBFA ^ (v3 - 246));
  return (*(uint64_t (**)(void))(v2 + 8 * ((973 * ((v0 & 0x18) == (v4 - 237) - 271)) ^ v4)))();
}

uint64_t sub_1A2E71F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = (v6 + 33 * (v4 ^ 0x11Eu) + 1414) & (~v2 + v3);
  *(void *)(a1 - 7 + v7) = *(void *)(a2 - 7 + v7);
  return (*(uint64_t (**)(void))(v5 + 8 * ((1711 * (v2 - (v3 & 0xFFFFFFF8) == -8)) ^ v4)))();
}

void sub_1A2E71F94()
{
}

uint64_t sub_1A2E71FA0(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)((((((a3 - 2006909079) | 0x21100060) ^ 0xFFFE0319) + ((a3 - 34363954) & 0xAB7D59FA))
                                     * (v4 == v3)) ^ a3)))();
}

uint64_t sub_1A2E71FFC()
{
  return v0();
}

uint64_t sub_1A2E72004()
{
  uint64_t v3 = *(void *)(v2 - 168);
  *(_DWORD *)(v3 - 0x79483BA612D83A86) = (*(_DWORD *)(v2 - 112) ^ 0xF7FDFE57)
                                         + 1306263039
                                         + ((2 * *(_DWORD *)(v2 - 112)) & 0xEFFBFCAE);
  *(_DWORD *)(v3 - 0x79483BA612D83A82) = 0;
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(v0 + 18672))(*(unsigned int *)*(&off_1E5AC6910 + (int)((v1 - 22) ^ 0xA97101FA)), *(void *)(v2 - 120), *(unsigned int *)(v2 - 112));
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 13320);
  *(void *)(v2 - 184) = v3;
  return v5(v4);
}

uint64_t sub_1A2E7206C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v6 = v2 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a2 + v6);
  return (*(uint64_t (**)(void))(v5 + 8 * ((3401 * (v6 == 0)) ^ (v4 + v3 + 3606))))();
}

uint64_t sub_1A2E720A0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((872 * (v0 ^ 0x32) - 1452213462) ^ 0xA971030E) - 708)
                                     * (v1 == 0x79483BA612D83A8ELL)) ^ (872 * (v0 ^ 0x32)))))();
}

uint64_t sub_1A2E720FC@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((*(void *)(v1 - 0x79483BA612D83A8ELL) == 0) ^ (a1 - 1)) & 1)
                                * (v3 + a1 + 1452210976)) ^ a1)))();
}

void sub_1A2E72154(int a1@<W8>)
{
  unsigned int v5 = (a1 + 24116700) | 0xA801012A;
  (*(void (**)(void))(v3 + 8 * (int)(v5 ^ (v4 + 1867))))();
  void *v1 = 0;
  *(_DWORD *)(v2 - 0x79483BA612D83A86) = 1171913814;
  *(_DWORD *)(v2 - 0x79483BA612D83A82) = 0;
  (*(void (**)(void *))(v3 + 8 * (int)(v5 + 1452213957)))(v1);
  JUMPOUT(0x1A2E721D4);
}

uint64_t sub_1A2E72284@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((*v1 == 0) * ((v4 + a1 - 215 - 2040) ^ (a1 - v3))) ^ (a1 - 215))))();
}

void sub_1A2E722BC(int a1@<W8>)
{
  (*(void (**)(void))(v2 + 8 * (a1 - 2024 + v3)))();
  *(void *)uint64_t v1 = 0;
  *(_DWORD *)(v1 + 8) = 1145303061;
  *(_DWORD *)(v1 + 12) = 0;
  JUMPOUT(0x1A2E722E4);
}

void aslgmuibau()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A258[(byte_1A3019E38[(9
                                                                                   * ((dword_1E95A44F8 - dword_1E95A4508) ^ 0x7D))
                                                                 - 8] ^ 0x19)
                                                 - 8] ^ (9 * ((dword_1E95A44F8 - dword_1E95A4508) ^ 0x7D)))
                - 29);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A350[byte_1A3019F38[(9 * ((dword_1E95A44F8 - v1) ^ 0x7D))
                                                                - 8] ^ 0x78] ^ (9 * ((dword_1E95A44F8 - v1) ^ 0x7D)))
                - 187);
  unint64_t v3 = (unint64_t)&v8[v1 + *(void *)(v2 - 4)];
  uint64_t v4 = 1787074057 * v3 - 0x6585E11862ED39BLL;
  unint64_t v5 = 1787074057 * (v3 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v0 - 4) = v4;
  *(void *)(v2 - 4) = v5;
  LOBYTE(v2) = 9 * ((v5 - *(_DWORD *)(v0 - 4)) ^ 0x7D);
  unsigned int v6 = (char *)*(&off_1E5AC6910
               + ((9 * ((dword_1E95A44F8 - dword_1E95A4508) ^ 0x7D)) ^ byte_1A3019C20[byte_1A301A690[(9 * ((dword_1E95A44F8 - dword_1E95A4508) ^ 0x7D))] ^ 0x8A])
               - 1)
     - 4;
  uint64_t v7 = *(void *)&v6[8
                    * ((84
                      * ((*(uint64_t (**)(uint64_t, uint64_t))&v6[8
                                                                        * (byte_1A3019C24[(byte_1A301A69C[v2 - 12] ^ 0xB1) - 4] ^ v2)
                                                                        + 16728])(24, 4101018099) == 0)) ^ 0x412)];
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E724BC(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 912148809;
  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 18520))(4096, 1358311088);
  *(void *)a1 = v3;
  return (*(uint64_t (**)(void))(v1 + 8 * ((213 * (v3 != 0)) ^ 0x67Du)))();
}

uint64_t sub_1A2E72510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v25 - 152) = v21 + 0x2A5C32E9989AD503;
  *(_DWORD *)(v21 + 8) = v22 + 4096;
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8 * ((57 * (v21 == 0)) ^ 0x4C8));
  *(void *)(v25 - 168) = *(void *)(v23 + 104) - 8;
  *(void *)(v25 - 200) = 0x1A44E0EB4FC706ALL;
  return v26(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_1A2E725B0()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + ((v0 + 1147767190) & 0x154D) - 312355264 - 1288;
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 1224504073;
  BOOL v5 = v3 < 0xED61D640;
  BOOL v6 = v3 > v4;
  if (v4 < 0xED61D640 != v5) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((2 * (((v0 - 125) ^ v7) & 1)) & 0xFB | (4 * (((v0 - 1149) ^ v7) & 1)) | v0)))();
}

void sub_1A2E7263C(int a1@<W8>)
{
  *(void *)(v7 - 200) = 0x1A44E0EB4FC706ALL;
  int v8 = ((v1 | 0x10) + 71) | 0x24;
  uint64_t v9 = *v3;
  unsigned int v10 = ((v8 - 806356520) & (2 * a1)) + (a1 ^ 0xE7F7FDFF) + 403177985;
  *(unsigned char *)(*v3 + v10) = 0;
  *(unsigned char *)(v9 + v10 + 1) = 0;
  *(unsigned char *)(v9 + v10 + 2) = 0;
  *(unsigned char *)(v9 + v10 + 3) = 1;
  *v2 += 4;
  *(void *)(v7 - 160) = v5;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E7297C()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v1 == 0) ^ (v0 + 43)) & 1) * ((v0 - 33160169) & 0x1F9F5FB ^ 0x1E7)) ^ v0)))();
}

uint64_t sub_1A2E729D0()
{
  unsigned int v3 = (v0 ^ 0x7FEF5C30) + *(_DWORD *)(v1 + 12);
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 1234244748;
  BOOL v5 = v3 < 0x7FEF5DD5;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((v0 + 1028) ^ 0x7FEF5838)) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1889 * v6) ^ v0)))();
}

uint64_t sub_1A2E72A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (int)(((((v28 - 1544683122) & 0x411FC95) + (v28 ^ 0xFFFFFA32)) * (v29 == 0)) ^ v28));
  HIDWORD(a23) = v27;
  *(void *)(v32 - 160) = v30;
  return v33(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E72AA0()
{
  unsigned int v3 = v0 + 262598220;
  BOOL v4 = (v0 + 262598220) < 0x46053791;
  int v5 = ((2 * ((v0 << (v1 ^ 0xEC)) - 1824297618)) & 0x7DBD96D0) + (((v0 << (v1 ^ 0xEC)) - 1824297618) ^ 0x3EDECB69);
  if (v4 != (v5 + 119958568) < 0x46053791) {
    BOOL v6 = (v5 + 119958568) < 0x46053791;
  }
  else {
    BOOL v6 = v5 + 119958568 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((3447 * v6) ^ v1 ^ 0x17u)))();
}

uint64_t sub_1A2E72B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v33 = *(void *)(v32 - 152);
  int v34 = (v29 - 643) | 0x401;
  *(void *)(v32 - 152) = v33;
  uint64_t v35 = *(void *)(v33 - 0x2A5C32E9989AD503);
  unsigned int v36 = ((a9 << (v34 - 16)) & 0x47FF7FFE) + (a9 ^ 0xA3FFBFFF) + 1543520257;
  *(unsigned char *)(v35 + v36 + 1) = -19;
  *(unsigned char *)(v35 + v36 + 2) = -89;
  *(unsigned char *)(v35 + v36) = -80;
  *(unsigned char *)(v35 + v36 + 3) = -81;
  *v28 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (((v34 ^ 0x55BE1C0F) + v34 - v30 + 1198) ^ v34)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1A2E72D14()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 ^ 0x637) + 3 * (v1 ^ 0x508) - 1375) * (v0 == 0)) ^ v1 ^ 0x7F)))();
}

uint64_t sub_1A2E72D58()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) - 1729931730 + ((v0 + 1039902712) & 0xC20456FD) + ((v0 - 875780956) & 0x34335DFB) - 2088;
  unsigned int v4 = *(_DWORD *)(v1 + 8) + 1652886757;
  BOOL v5 = v3 < 0x98E3562E;
  BOOL v6 = v3 > v4;
  if (v4 < 0x98E3562E != v5) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((240 * v6) ^ v0)))();
}

uint64_t sub_1A2E72DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  LODWORD(a24) = v25;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v26 + 868 + ((v26 + 1787091309) & 0x957B2677) - 1958) * (v27 == 0)) ^ v26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           v28);
}

uint64_t sub_1A2E72E48()
{
  unsigned int v3 = v1 + 63784098;
  BOOL v4 = (v1 + 63784098) < 0x3A2B8DE7;
  unsigned int v5 = ((2 * (((v0 + 58) ^ 0x934368B1) + 2 * v1)) & 0x6FFFDEDC) + ((((v0 + 58) ^ 0x934368B1) + 2 * v1) ^ 0xB7FFEF6F);
  if (v4 != v5 - 2111070600 < 0x3A2B8DE7) {
    BOOL v6 = v5 - 2111070600 < 0x3A2B8DE7;
  }
  else {
    BOOL v6 = v5 - 2111070600 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * (((2 * v6) | (8 * v6)) ^ v0)))();
}

uint64_t sub_1A2E72EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v32 = *(void *)(v31 - 152);
  *(void *)(v31 - 152) = v32;
  uint64_t v33 = *(void *)(v32 - 0x2A5C32E9989AD503);
  unsigned int v34 = ((v28 ^ 0xDFCEFE15) & (2 * a9)) + (a9 ^ 0xEFE77DFF) + 270041601;
  *(unsigned char *)(v33 + v34) = 0;
  *(unsigned char *)(v33 + v34 + 1) = 0;
  *(unsigned char *)(v33 + v34 + 2) = 0;
  *(unsigned char *)(v33 + v34 + 3) = 1;
  *v27 += 4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (int)((v29 + (((v28 ^ 0x7CD) + 561505745) & 0xDE881EDA) - 1443) ^ ((v28 ^ 0x7CD) - 338166480) & 0xBE69F4EF ^ v28 ^ 0x7CD)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E730CC()
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * (int)((((v0 - 1152) ^ 0x746 ^ (v0 + 2074093803) & 0x845FD567) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_1A2E73118()
{
  unsigned int v3 = *(_DWORD *)(v1 + 12) + 60653252;
  unsigned int v4 = *(_DWORD *)(v1 + 8) - 851495565;
  BOOL v5 = v3 < 0x39D7EBC;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x39D7EBC) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v6 * ((v0 + 774) ^ 0x560)) ^ v0)))();
}

uint64_t sub_1A2E73188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  HIDWORD(a24) = v24;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((((v25 == 0) ^ v27 ^ 0x7D) & 1) * ((v27 ^ 0x22B) - 1848)) ^ v27)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           v26);
}

uint64_t sub_1A2E731D0()
{
  unsigned int v3 = v1 + 724353512;
  BOOL v4 = (v1 + 724353512) < 0x618B0B29;
  unsigned int v5 = (((v0 - 1066) ^ 0x6FFFB89D) & (2 * (2 * v1 - 1824297618))) + ((2 * v1 - 1824297618) ^ 0xB7FFDDEB);
  if (v4 != v5 - 1450496706 < 0x618B0B29) {
    BOOL v6 = v5 - 1450496706 < 0x618B0B29;
  }
  else {
    BOOL v6 = v5 - 1450496706 > v3;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((188 * v6) ^ v0)))();
}

uint64_t sub_1A2E73270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v36 = *(void *)(v35 - 152);
  uint64_t v37 = (v31 + 1721066143) & 0x996A9D2D;
  unint64_t v38 = a30 - ((2 * a30) & 0xF99431D3CA63CC58) + 0x7CCA18E9E531E62CLL;
  *(void *)(v35 - 152) = v36;
  uint64_t v39 = (unsigned char *)(*(void *)(v36 - 0x2A5C32E9989AD503)
                + (a9 ^ 0x7BAEB7BBF9DF2D9FLL)
                - 0x7BAEB7BBF9DF2D9FLL
                + ((v37 ^ 0x1F3BE5E1ALL) & (2 * a9)));
  *uint64_t v39 = HIBYTE(v38) ^ 0x7C;
  v39[1] = BYTE6(v38) ^ 0xCA;
  v39[2] = BYTE5(v38) ^ 0x18;
  v39[3] = BYTE4(v38) ^ 0xE9;
  v39[4] = ((a30 - ((2 * a30) & 0xCA63CC58) - 449714644) >> 24) ^ 0xE5;
  v39[5] = BYTE2(v38) ^ 0x31;
  v39[6] = BYTE1(v38) ^ 0xE6;
  v39[7] = v38 ^ 0x2C;
  *v30 += 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * (int)((v32 + v33 + v37 - 1317 - 1681) ^ (v37 - 1189) ^ v37)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1A2E734E4()
{
  *(void *)(v4 - 128) = 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 + v0 - 128) ^ (v2 + 782) ^ ((v0 - 64) | 0x30C)) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_1A2E73540()
{
  uint64_t v3 = (*(uint64_t (**)(void))(v1 + 8 * (v0 + 1493)))();
  uint64_t v4 = *(void (**)(void))(v1 + 8 * (v0 ^ 0xBA5));
  *(void *)(v2 - 208) = v3;
  v4();
  uint64_t v5 = (*(uint64_t (**)(void, void))(v1 + 8 * (v0 + 1459)))(*(void *)(v2 - 168), 0);
  *(void *)(v2 - 192) = 0;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v5 == 0) * (((v0 - 2143211338) | 0x2A00C044) + 1438518261)) ^ v0)))();
}

uint64_t sub_1A2E735F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v32 = v28 - 625;
  uint64_t v33 = (*(uint64_t (**)(void, uint64_t, void))(v29 + 8 * (v32 ^ 0x9DF)))(*(void *)(v30 - 168), a1, 0);
  uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v33 != 0) * (v32 ^ 0xAA41F49D ^ (v32 - 1438518427))) ^ v32));
  *(void *)(v30 - 192) = a1;
  return v34(v33, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_1A2E73678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  (*(void (**)(uint64_t, uint64_t))(v22 + 8 * (v20 ^ 0x8A1)))(a1, *(void *)(v21 + 8 * (v20 - 371)) - 12);
  (*(void (**)(uint64_t))(v22 + 8 * (v20 ^ 0x923)))(a1);
  (*(void (**)(uint64_t, void))(v22 + 8 * (v20 ^ 0x8BE)))(a1, *(void *)(v23 - 208));
  uint64_t v25 = (*(uint64_t (**)(void))(v22 + 8 * (v20 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8 * (((v25 == *(void *)(v21 + 8 * (v20 ^ 0x198))) * (v20 + 1126 + 5 * (v20 ^ 0x18C) - 694)) ^ v20)))(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A2E7372C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v29
                              + 8
                              * (int)(((a28 == (void)*(&off_1E5AC6910 + (v28 ^ 0x85)) - 8)
                                     * (v28 ^ 0xAA41F1EA ^ ((v28 + 541156268) | 0x8A009004))) ^ v28)))();
}

uint64_t sub_1A2E737AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 + 1946)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 + 1920)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v31 == v28) * (((v27 - 254) ^ 0xFFFFFF26) + (v27 ^ 0x46A))) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A2E7380C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v30 + 8 * (((a28 != v29) * ((v28 + 254) ^ 0x190)) | v28)))();
}

uint64_t sub_1A2E73860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 ^ 0x8BE)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (((v31 == v28) * (((v27 ^ 0x46A) - 710) ^ 0x1E8)) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A2E738C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v30
                              + 8
                              * (int)((((((v28 + 1126639268) & 0xBCD8D7BB) - 1438518604) ^ 0xAA41F073) * (a28 == v29)) ^ v28)))();
}

uint64_t sub_1A2E73928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 + 1946)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (int)(((v31 == v28) * (((v27 + 333592173) & 0xEC1DCDF8 ^ 0xFFFFFA8C) + v27 - 252)) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A2E7399C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return (*(uint64_t (**)(void))(v30 + 8 * ((((v28 + 252) ^ 0x75A) * (a28 == v29)) ^ v28)))();
}

uint64_t sub_1A2E739F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, void))(v29 + 8 * (v27 + 1946)))(a27, *(void *)(v30 - 208));
  uint64_t v31 = (*(uint64_t (**)(void))(v29 + 8 * (v27 ^ 0x880)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (((v31 == v28) * (v27 + 1438521567 + v27 - 1438518604 - 3095)) ^ v27)))(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1A2E73A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 8 * (v28 ^ 0xCEE)))(a28, v29, v31 - 128);
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (((v32 == 0) * ((v28 + 68) ^ (v28 + 66))) | v28));
  *(void *)(v31 - 200) = 0x1A44E0EB4FC706ALL;
  return v33(v32, v34, v35, v36, v37, v38, v39, v40);
}

uint64_t sub_1A2E73AFC()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 ^ 0xF31)))(24, 4101018099);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 8 * (((v3 == 0) * ((v0 + 156) ^ v0 ^ 0x96)) ^ v0));
  *(void *)(v2 - 200) = 0x1A44E0EB4FC706ALL;
  return v4(v3, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1A2E73B84(uint64_t a1)
{
  *(void *)(v3 - 184) = a1 + 0x1A44E0EB4FC706ALL;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 1814571000;
  *(void *)(a1 + 12) = 0;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 ^ 0xFA7)))(4096, 1358311088);
  *(void *)a1 = v5;
  return (*(uint64_t (**)(void))(v2
                              + 8 * (((((v1 - 107) ^ (v5 == 0)) & 1) * ((v1 ^ 0x664) - 178)) ^ v1)))();
}

uint64_t sub_1A2E73C0C()
{
  *(_DWORD *)(v2 + 8) = v1 + 4096;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((*(void *)(v4 - 128) > (unint64_t)(v0
                                                                                          - 652
                                                                                          + v1
                                                                                          - 1814566904
                                                                                          - 693))
                                * ((v0 ^ 0x504) + 515)) ^ v0)))();
}

uint64_t sub_1A2E73C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8 * ((((v3 + 360) ^ 0x413) * (v4 != 0)) ^ v3)))(a1, a2, a3);
}

uint64_t sub_1A2E73C98@<X0>(int a1@<W8>)
{
  unsigned int v5 = v1 + v2 + a1;
  unsigned int v6 = (((2 * a1 + 665825296) << (v3 ^ 0x1C)) & 0xFD5FDFF8) + ((2 * a1 + 665825296) ^ 0x7EAFEFFC);
  if (v5 > 0x4762EDD != v6 + 2094653734 < 0xFB89D122) {
    BOOL v7 = v6 + 2094653734 < 0xFB89D122;
  }
  else {
    BOOL v7 = v6 + 2094653734 > v5 - 74854110;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8 * ((367 * v7) ^ v3 ^ 0x2B4)))(4250918904, 3984078844, 2094653734);
}

uint64_t sub_1A2E73D58()
{
  uint64_t v4 = *(uint64_t (**)(void))(v2 + 8 * (int)((((v0 - 95685618) & 0xAFF5FF6F ^ 0xAA41F451) * (v1 == 0)) | v0));
  *(void *)(v3 - 200) = 0x1A44E0EB4FC706ALL;
  return v4();
}

uint64_t sub_1A2E73DBC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v24 = a1 - 200;
  (*(void (**)(uint64_t))(v22 + 8 * (a1 + 1438520241)))(v21);
  *(void *)(v23 - 200) = 0x1A44E0EB4FC706ALL;
  (*(void (**)(uint64_t))(v22 + 8 * (v24 + 1438520511)))(v20);
  (*(void (**)(uint64_t))(v22 + 8 * (int)(v24 ^ 0xAA41FD43)))(a20);
  return (*(uint64_t (**)(void))(v22 + 8 * ((74 * (*(void *)(v23 - 208) != 0)) | (v24 + 1438519375))))();
}

uint64_t sub_1A2E74164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v33 = (*(uint64_t (**)(void))(v31 + 8 * v29))();
  uint64_t v34 = *(uint64_t (**)(uint64_t))(v31 + 8 * ((v28 - 510) ^ ((a28 == 0) | (4 * (a28 == 0)))));
  *(void *)(v32 - 192) = v30;
  return v34(v33);
}

uint64_t sub_1A2E741A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v36 = (*(uint64_t (**)(uint64_t))(v34 + 8 * (int)(v29 ^ 0xAA41FD43)))(a28);
  *(void *)(v35 - 192) = v30;
  if (v31 == -45004)
  {
    *(void *)(v35 - 184) = v33;
    *(void *)(v35 - 144) = 0;
    *(_DWORD *)(v35 - 132) = 0;
    uint64_t v44 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(v34 + 18736))(**(unsigned int **)(v32 + 64), *(void *)v28, *(unsigned int *)(v28 + 12), v35 - 144, v35 - 132);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((1320 * ((v44 ^ 0x7FFFFEAB) - 899814434 + ((2 * v44) & 0xFFFFFD56) == 1516104332)) ^ 0x153)))(v44, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
  else if (v31)
  {
    return (*(uint64_t (**)(uint64_t))(v34 + 8 * ((10 * (v28 == 0)) ^ 0x83)))(v36);
  }
  else
  {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((462 * (*(void *)(v35 - 200) != 0x1A44E0EB4FC706ALL)) ^ 0xED)))(*(void *)(v35 - 200), v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
}

uint64_t sub_1A2E748D8(uint64_t a1)
{
  int v3 = (v1 - 469144713) & 0x71B4A762;
  unsigned int v4 = *(_DWORD *)(a1 - 0x1A44E0EB4FC705ELL) + 2002279202;
  unsigned int v5 = ((v3 - 1420259747) & 0x54A76E93 ^ 0xB303737) + *(_DWORD *)(a1 - 0x1A44E0EB4FC7062);
  int v6 = (v4 < 0x77585B1E) ^ (v5 < 0x77585B1E);
  BOOL v7 = v4 > v5;
  if (v6) {
    BOOL v7 = v4 < 0x77585B1E;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v7 * (v3 - 1702)) ^ v3)))();
}

uint64_t sub_1A2E74994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *uint64_t v2 = v3 + 4;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (int)(((((a1 == a2) ^ (((v4 + 81) & 0x9F) - 82)) & 1)
                                     * ((v5 + ((v4 + 575506257) & 0xDDB2759F) - 1041) ^ (v5 - 22))) ^ (v4 + 575506257) & 0xDDB2759F)))();
}

uint64_t sub_1A2E74A64()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((*(void *)(*(void *)(v3 - 200) - 0x1A44E0EB4FC706ALL) == 0) ^ ((v0 & 0xC9) - 68)) & 1)
                                     * (v0 & 0x8E77A3C9 ^ (v1 + 905) ^ (v1 + 36))) ^ v0 & 0x8E77A3C9)))();
}

void sub_1A2E74ACC(int a1@<W8>)
{
  unsigned int v5 = (a1 + 171965627) | 0xA001F402;
  (*(void (**)(void))(v4 + 8 * (int)(v5 ^ (v3 + 2227))))();
  void *v1 = 0;
  *(_DWORD *)(v2 - 0x1A44E0EB4FC7062) = 1814571000;
  *(_DWORD *)(v2 - 0x1A44E0EB4FC705ELL) = 0;
  (*(void (**)(void *))(v4 + 8 * (int)(v5 ^ (v3 + 2227))))(v1);
  JUMPOUT(0x1A2E75454);
}

uint64_t sub_1A2E74B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,_DWORD *a30,int a31,int a32)
{
  uint64_t v37 = (*(uint64_t (**)(void))(v35 + 8 * (v34 ^ (v34 + 2227))))(*(void *)(v33 - 0x1A44E0EB4FC706ALL));
  *(void *)(v33 - 0x1A44E0EB4FC706ALL) = a22;
  *a30 = a32;
  *(void *)(v36 - 160) = v32;
  return (*(uint64_t (**)(uint64_t))(v35
                                            + 8
                                            * ((((((167 * (v34 ^ (v34 + 8)) - 1270) ^ 1) & 1) == 0)
                                              * (((167 * (v34 ^ (v34 + 8)) - 1304) | 0x41) ^ 9)) ^ (167
                                                                                                  * (v34 ^ (v34 + 8))))))(v37);
}

void sub_1A2E74BEC()
{
  *(void *)(v1 - 176) = v0;
  JUMPOUT(0x1A2E74C20);
}

uint64_t sub_1A2E74C88()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((((v1 - 1476338727) | 0x2411404) ^ (v3 + 168)) * (v0 == v2)) ^ v1)))();
}

uint64_t sub_1A2E74CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v6 = v3 - 524;
  unsigned int v7 = 5 * ((v3 - 344459283) & 0xBEC9F7EF ^ (v4 - 57));
  BOOL v9 = v2 > 7 && (unint64_t)(a1 - a2) > 0x1F;
  return (*(uint64_t (**)(void))(v5 + 8 * (int)(((v7 - 323) * v9) ^ v6)))();
}

uint64_t sub_1A2E74D20()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * ((213 * (v0 >= (v1 ^ 0x2EC ^ (v2 + 951) ^ ((v1 + 37868175) | 0xA8002040)))) ^ v1)))();
}

uint64_t sub_1A2E74D70@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((1533 * ((v2 & 0xFFFFFFE0) - (unint64_t)(v4 + v3 - 157) == -2050)) ^ (v4 + v3 - 1401))))();
}

uint64_t sub_1A2E74DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v7 = *(_OWORD *)(a3 + a2 + 16);
  uint64_t v8 = (_OWORD *)(a1 + a2);
  *uint64_t v8 = *(_OWORD *)(a3 + a2);
  v8[1] = v7;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 == a2) * v5) ^ v4)))();
}

uint64_t sub_1A2E74DF0()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 + ((v2 - 2109649952) | 0x2800A044) - 2214) * (v0 != v1)) | v2)))();
}

uint64_t sub_1A2E74E2C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((194 * (((v1 - 1707 - v2 + 1864 + ((v1 - 1952) | 0x319) + 1438517303) & v0) == 0)) ^ (v1 - 1707))))();
}

uint64_t sub_1A2E74E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v2) = *(void *)(a2 + v2);
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((((v4 ^ 3 ^ (v5 + 941)) & v3) - 8 != v2) * ((((v4 ^ 3) - 828) | 0x201) - 602)) | v4 ^ 3)))();
}

uint64_t sub_1A2E74EC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + v5) = *(void *)(a2 + v5);
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 != v5) * v4) | v2)))();
}

uint64_t sub_1A2E74EEC()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 ^ (v3 + 469) ^ (v3 - 819)) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1A2E74F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + v2) = *(unsigned char *)(a2 + v2);
  return (*(uint64_t (**)(void))(v6 + 8 * ((44 * (v2 + 1 == v3)) ^ (v5 + v4 - 1074))))();
}

uint64_t sub_1A2E74F4C()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)((((v3 + ((v1 + 117195770) & 0xF903BBFF) - 982) ^ (v3 + 26)) * (v0 != v2)) ^ v1)))();
}

uint64_t sub_1A2E74F98()
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 + v3 + ((v0 - 925) | 0x500) - 1337 - 225) * (v1 > 7)) ^ v0)))();
}

uint64_t sub_1A2E74FD4()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 ^ (v2 - 711) ^ (v2 - 13)) * (v0 > 0x1F)) ^ v1)))();
}

uint64_t sub_1A2E75004()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((247
                                * (v0 < ((v1 - 278529498) & 0xBADBF4E6 ^ (v2 + 950) ^ (v1 - 1783889306) & 0x6A53FBFA))) ^ (v1 + 300))))();
}

uint64_t sub_1A2E75068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = (v4 + (v3 ^ (v6 + 210)) + 1518) & (v2 - 1);
  long long v9 = *(_OWORD *)(a2 + v8 - 15);
  long long v10 = *(_OWORD *)(a2 + v8 - 31);
  uint64_t v11 = a1 + v8;
  *(_OWORD *)(v11 - 15) = v9;
  *(_OWORD *)(v11 - 31) = v10;
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((4 * ((v2 & 0xFFFFFFE0) == 32)) | (8 * ((v2 & 0xFFFFFFE0) == 32)) | (v5 + v3 - 1468))))();
}

void sub_1A2E750C8()
{
}

uint64_t sub_1A2E750D4()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v2 ^ (v0 == v1)) & 1) == 0) * (((v2 - 285) | 0x80) - 147)) ^ v2)))();
}

uint64_t sub_1A2E75108()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((39
                                * ((v0 & 0x18) == ((v1 - v2 + 2046) ^ 0xFFFFFFFF55BE0820)
                                                + (v1 + 729))) ^ v1)))();
}

uint64_t sub_1A2E7514C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 - 7 + (~v2 + v3)) = *(void *)(a2 - 7 + (~v2 + v3));
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 - (v3 & 0xFFFFFFF8) == -8) * ((v4 + 415) ^ 0x189)) ^ v4)))();
}

uint64_t sub_1A2E751A4(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  *(void *)(v6 + a3) = *(void *)(v5 + a3);
  return (*(uint64_t (**)(void))(v7 + 8 * (((a4 == 0) * a2) ^ v4)))();
}

uint64_t sub_1A2E751D4()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v0 + v0 + 902 - 2685) * (v2 == v1)) ^ v0)))();
}

uint64_t sub_1A2E75204()
{
  return v0();
}

uint64_t sub_1A2E7520C()
{
  uint64_t v4 = *(void *)(v3 - 176);
  *(_DWORD *)(v4 - 0x1A44E0EB4FC7062) = (*(_DWORD *)(v3 - 132) ^ 0xEE787FFD)
                                        + 2108663803
                                        + ((2 * *(_DWORD *)(v3 - 132)) & 0xDCF0FFFA);
  *(_DWORD *)(v4 - 0x1A44E0EB4FC705ELL) = 0;
  uint64_t v5 = (*(uint64_t (**)(void, void, void))(v2 + 8 * (int)((v1 + 2322) ^ 0xAA41F446)))(*(unsigned int *)*(&off_1E5AC6910 + v0 - 1438520411), *(void *)(v3 - 144), *(unsigned int *)(v3 - 132));
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v2 + 8 * ((v0 - 1438519891) ^ 0x7C5));
  *(void *)(v3 - 200) = v4;
  return v6(v5);
}

uint64_t sub_1A2E75274@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v6 = v2 - 1;
  *(unsigned char *)(a1 + v6) = *(unsigned char *)(a2 + v6);
  return (*(uint64_t (**)(void))(v5 + 8 * (((2 * (v6 != 0)) | (8 * (v6 != 0))) ^ (v4 + v3 - 763))))();
}

uint64_t sub_1A2E752A8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v1 == 0x1A44E0EB4FC706ALL) ^ ((v0 | 0xAC) - 35)) & 1)
                                     * (((v0 | 0x1AC) - 1438518696) ^ 0xAA41F45E)) ^ (v0 | 0x1AC))))();
}

uint64_t sub_1A2E7530C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((*(void *)(v1 - 0x1A44E0EB4FC706ALL) == 0) ^ (a1 + 58)) & 1)
                                     * ((a1 - 1100091773) & 0xEBD3FFF7 ^ (v2 + 859))) ^ a1)))();
}

void sub_1A2E75374(int a1@<W8>)
{
  int v5 = (a1 - 1572753863) | 0x8004042;
  (*(void (**)(void))(v4 + 8 * (v5 ^ (v3 + 2227))))();
  *int v2 = 0;
  *(_DWORD *)(v1 - 0x1A44E0EB4FC7062) = 1814571000;
  *(_DWORD *)(v1 - 0x1A44E0EB4FC705ELL) = 0;
  (*(void (**)(void *))(v4 + 8 * (v5 ^ (v3 + 2227))))(v2);
  JUMPOUT(0x1A2E753F4);
}

uint64_t sub_1A2E75494@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((a1 - 1149634183) ^ (*v1 == 0)) & 1) == 0)
                                     * ((a1 - 1149634183) & 0xEEC7F55F ^ (v2 + 19))) ^ a1)))();
}

void sub_1A2E754E0()
{
  (*(void (**)(void))(v3 + 8 * (v1 ^ (v2 + 2227))))();
  *(void *)uint64_t v0 = 0;
  *(_DWORD *)(v0 + 8) = 912148809;
  *(_DWORD *)(v0 + 12) = 0;
  JUMPOUT(0x1A2E7551CLL);
}

void qi864985u0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

uint64_t sub_1A2E75620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_DWORD *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  *a30 = 0;
  *a29 = 0;
  *a31 = 0;
  *a24 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, const char *, void *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, void *, _DWORD *, void *, void *, void *, uint64_t, uint64_t))(v34 + 8 * ((59 * (a1 == 0)) ^ 0x2D1)))(a1, a2, a3, a4, 992817389, 3302152146, a7, a8, a9, a10, "com.apple.adid", &unk_1E95A6AA8, &unk_1E95A6AAC, 0x1E95A6A54, a15, a16, a17, a18, a19,
           a20,
           a21,
           &unk_1E95A6AB0,
           a23,
           a24,
           a25,
           a1,
           a27,
           &unk_1E95A6AAC,
           a29,
           a30,
           a31,
           &unk_1E95A6A58,
           a33,
           a34);
}

uint64_t sub_1A2E75704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((38 * (v5 == (((v6 + 452984265) | 0x202D3005) ^ a5))) ^ v6)))();
}

uint64_t sub_1A2E75744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v7 = v5 + 76;
  int v8 = v7 ^ (a5 + 665);
  BOOL v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8 * (v7 ^ 0xA60)))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v6 + 8 * ((v9 * (v8 - 992815150 + 134 * (v7 ^ 0x36E) - 2677)) ^ v7)))();
}

uint64_t sub_1A2E757B4(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 1337481487;
  *(void *)(a1 + 12) = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 1645)))(4096, 1358311088);
  *(void *)a1 = v4;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v4 == 0) * ((v1 ^ 0x39B) - 200)) ^ v1)))();
}

uint64_t sub_1A2E75814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(v4 + 8) = v7 + 4096;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                         + 8
                                                                                         * (((((14
                                                                                              * ((v5 + 1727) ^ 0x7D5)) ^ 0x3F6)
                                                                                            - 783)
                                                                                           * (v4 == 0)) | (v5 + 1727))))(a1, a2, a3, a4, 992817389, 3302152146);
}

uint64_t sub_1A2E7588C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46)
{
  unsigned int v49 = *(_DWORD *)(v47 + 12) - 130544155;
  unsigned int v50 = *(_DWORD *)(v47 + 8) - 1468025646;
  BOOL v51 = v49 < 0xF8380DE1;
  BOOL v52 = v49 > v50;
  if (v51 != v50 < 0xF8380DE1) {
    unsigned __int8 v53 = v51;
  }
  else {
    unsigned __int8 v53 = v52;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 8 * (((((5 * (v46 ^ 0x3D)) ^ v53) & 1) * (55 * (v46 ^ 0x31C) - 162)) ^ v46)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a46);
}

void sub_1A2E7591C(int a1@<W8>)
{
  int v5 = (v2 - 81) | 0x86;
  uint64_t v6 = *(void *)(v3 - 0x53F82AF96D6B682ELL);
  unsigned int v7 = ((2 * a1) & 0x6FBFFBDE) + (a1 ^ 0x37DFFDEF);
  *(unsigned char *)(v6 + v7 + (v5 ^ 0xC82002FF)) = 0;
  v7 -= 937426414;
  *(unsigned char *)(v6 + v7) = 0;
  *(unsigned char *)(v6 + v7 + 1) = 0;
  *(unsigned char *)(v6 + v7 + 2) = 1;
  *v1 += 4;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E7711C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 8 * ((45 * (a39 != 0x53F82AF96D6B682ELL)) ^ v49)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a49);
}

uint64_t sub_1A2E77160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  unsigned int v53 = (v50 + 1211070133) & 0xB7D087FE;
  unsigned int v54 = *(_DWORD *)(v51 - 0x53F82AF96D6B6822) - 1322609147;
  unsigned int v55 = *(_DWORD *)(v51 - 0x53F82AF96D6B6826) + 1634876658;
  BOOL v56 = v54 < (((v53 ^ 0x7F8) - 1322611214) ^ (v53 + 91));
  BOOL v57 = v54 > v55;
  if (v56 != v55 < 0xB12A9601) {
    BOOL v58 = v56;
  }
  else {
    BOOL v58 = v57;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 8 * (int)((41 * v58) ^ v53)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_1A2E77218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  LODWORD(a43) = v51;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 8 * (int)((((v52 - 850) ^ (a5 - 181) ^ (a5 + 17)) * (v53 == 0x53F82AF96D6B682ELL)) ^ v52)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a51);
}

uint64_t sub_1A2E77264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v9 = ((2 * (a6 + v7 + 1620003779 + 2 * v6 - 1696)) & 0xFFF8B73C)
     + ((a6 + v7 + 1620003779 + 2 * v6 - 1696) ^ 0x7FFC5B9F)
     + 784619079;
  BOOL v10 = v9 < 0xAEC0B1E6;
  BOOL v11 = v9 > v6 + 1594382555;
  if ((v6 + 1594382555) < 0xAEC0B1E6 != v10) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * ((28 * !v12) ^ (a6 + v7 - 981))))(784619079);
}

uint64_t sub_1A2E77314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  LODWORD(a43) = v52;
  uint64_t v62 = (*(uint64_t (**)(void, uint64_t))(v54 + 8 * (v55 + 619)))(v53 + ((v55 + 1719611453) & 0x9980C9F7) + ((v55 - 1632) | 0x22) - 2147245270, 1120292948);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 8 * ((v62 == 0) ^ v55)))(v62, v56, v57, v58, 992817389, 3302152146, v59, v60, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a52);
}

void sub_1A2E773A4()
{
}

uint64_t sub_1A2E773E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,_DWORD *a59,uint64_t a60)
{
  uint64_t v61 = (*(uint64_t (**)(void))(v60 + 8 * (a5 + a6)))(*(void *)(a57 - 0x53F82AF96D6B682ELL));
  *(void *)(a57 - 0x53F82AF96D6B682ELL) = a60;
  *a59 = a43;
  return sub_1A2E77454(v61);
}

uint64_t sub_1A2E77454@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v5 = *(void *)(v2 - 0x53F82AF96D6B682ELL);
  unsigned int v6 = ((v1 << (((v3 - 55) & 0xD7) + 44)) & 0x7FAFFDFE) + (v1 ^ 0x3FD7FEFF) - 1071120127;
  *(unsigned char *)(v5 + v6 + 1) = -32;
  *(unsigned char *)(v5 + v6 + 2) = -76;
  *(unsigned char *)(v5 + v6) = -49;
  *(unsigned char *)(v5 + v6 + 3) = 106;
  *a1 += 4;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)((((((v3 + 1679218889) & 0x9BE923D7 ^ 0x786) & 1) == 0)
                                     * (13 * ((v3 + 1679218889) & 0x9BE923D7 ^ 0xB2) - 1280)) ^ (v3 + 1679218889) & 0x9BE923D7)))();
}

uint64_t sub_1A2E7752C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 8 * (((v54 & ~((17 * (v53 ^ 0x75C)) ^ (a39 == 0x53F82AF96D6B682ELL))) * ((v53 ^ 0x11E) - 1550)) ^ v53)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a53);
}

uint64_t sub_1A2E77588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  unsigned int v57 = *(_DWORD *)(v55 - 0x53F82AF96D6B6822) + 58686617;
  unsigned int v58 = ((v54 + 1014413480) & 0xC389497F) - 1278797038 + *(_DWORD *)(v55 - 0x53F82AF96D6B6826);
  BOOL v59 = v57 < ((v54 + 866148595) & 0xCC5F9AFF) + 58686038;
  BOOL v60 = v57 > v58;
  if (v59 != v58 < 0x37F7C95) {
    BOOL v61 = v59;
  }
  else {
    BOOL v61 = v60;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 8 * ((50 * v61) | v54)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a54);
}

uint64_t sub_1A2E77650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  HIDWORD(a48) = v55;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8 * (int)(((((v57 == 0x53F82AF96D6B682ELL) ^ (v56 - 1)) & 1) * (a6 + (v56 ^ (a5 + 1964)) - 2002)) ^ v56)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a55);
}

uint64_t sub_1A2E776B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v9 = ((2 * (2 * v6 + 1620004322)) & 0xFF73B31C) + ((2 * v6 + 1620004322) ^ 0xFFB9D98F) + 350686845;
  BOOL v10 = v9 < 0x14A0E80C;
  BOOL v11 = v9 > v6 - 991391999;
  if ((v6 - 991391999) < 0x14A0E80C != v10) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((2982 * v12) ^ (a6 + v7 - 1299))))();
}

uint64_t sub_1A2E77768@<X0>(int a1@<W8>)
{
  uint64_t v5 = *(void *)(v2 - 0x53F82AF96D6B682ELL);
  int v6 = v3 - 337;
  unsigned int v7 = ((2 * a1) & 0xD7BE7BFE) + (a1 ^ 0x6BDF3DFF) - 1809792749;
  *(unsigned char *)(v5 + v7 + v6) = 0;
  *(unsigned char *)(v5 + v7 + 239) = 0;
  *(unsigned char *)(v5 + v7 + 240) = 0;
  *(unsigned char *)(v5 + v7 + 241) = 1;
  *v1 += 4;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((233 * (v6 ^ 0xEC)) ^ 0x5D) + ((v3 - 517) | 0x501)) ^ v6)))();
}

uint64_t sub_1A2E7795C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8 * (((a39 == 0x53F82AF96D6B682ELL) * (v57 ^ 0x59D ^ v57 ^ 0x13C ^ 0x491)) ^ v57)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a57);
}

uint64_t sub_1A2E779B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  unsigned int v61 = (((v58 - 604) | 0x608) ^ 0x16946541) + *(_DWORD *)(v59 - 0x53F82AF96D6B6822);
  unsigned int v62 = *(_DWORD *)(v59 - 0x53F82AF96D6B6826) - 958658141;
  BOOL v63 = v61 < v58 + 378822243;
  BOOL v64 = v61 > v62;
  if (v63 != v62 < 0x169462B2) {
    BOOL v65 = v63;
  }
  else {
    BOOL v65 = v64;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 8 * ((753 * v65) ^ v58)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_1A2E77A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  LODWORD(a44) = v59;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 8 * ((4085 * (((v61 == 0x53F82AF96D6B682ELL) ^ (v60 + 4)) & 1)) ^ v60)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a58,
           a59);
}

uint64_t sub_1A2E77AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  unsigned int v9 = ((2 * (2 * v6 + 1620004322)) & 0x9F79FE9C)
     + ((2 * v6 + 1620004322) ^ 0x4FBCFF4F)
     + (((v7 & 0xFF3DBDED) - a5 + 1930) ^ 0x737EEADB);
  BOOL v10 = v9 < 0xC33BECA0;
  BOOL v11 = v9 > v6 + 1938002841;
  if ((v6 + 1938002841) < 0xC33BECA0 != v10) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * (int)((2057 * v12) ^ (a6 + (v7 & 0xFF3DBDED) - 2075))))();
}

uint64_t sub_1A2E77B64@<X0>(_DWORD *a1@<X8>)
{
  int v6 = v3 ^ 0x764;
  unint64_t v7 = v5 - ((2 * v5) & 0xF99431D3CA63CC58) + 0x7CCA18E9E531E62CLL;
  uint64_t v8 = (unsigned char *)((((unint64_t)v1 << (v6 + 19)) & 0x1EFFD5FF2)
               + (v1 ^ 0x23FE2B3FF7FEAFF9)
               + *(void *)(v2 - 0x53F82AF96D6B682ELL)
               - 0x23FE2B3FF7FEAFF9);
  *uint64_t v8 = HIBYTE(v7) ^ 0x7C;
  v8[1] = BYTE6(v7) ^ 0xCA;
  void v8[2] = BYTE5(v7) ^ 0x18;
  v8[3] = BYTE4(v7) ^ 0xE9;
  v8[4] = ((v5 - ((2 * v5) & 0xCA63CC58) - 449714644) >> 24) ^ 0xE5;
  void v8[5] = ((v5 - ((2 * v5) & 0xCA63CC58) - 449714644) >> 16) ^ 0x31;
  v8[6] = ((unsigned __int16)(v5 - ((2 * v5) & 0xCC58) - 6612) >> 8) ^ 0xE6;
  v8[7] = v7 ^ 0x2C;
  *a1 += 8;
  return (*(uint64_t (**)(void))(v4 + 8 * (int)((v6 + 1299785425) & 0xB286DD7B ^ 0x9E ^ v6)))();
}

uint64_t sub_1A2E77E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t))(v40 + 8 * (int)(((a39 == 0x53F82AF96D6B682ELL) * ((v39 + 2072) ^ 0x3B2D39EB ^ (a5 + 1780) ^ (5 * ((v39 + 2072) ^ 0x861)))) ^ (v39 + 2072))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           0,
           a39);
}

uint64_t sub_1A2E77E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  int v64 = (v63 - 635) ^ (a5 + 888);
  (*(void (**)(void))(v62 + 8 * (v63 + 542)))();
  (*(void (**)(void))(v62 + 8 * (v63 ^ 0xFEA)))();
  uint64_t v71 = (*(uint64_t (**)(uint64_t, void))(v62 + 8 * (v63 ^ 0xFFC)))(a11, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 8 * (((v71 != 0) * (v64 - 992815150 + ((v63 - 635) | 0x30) - 3430)) ^ v63)))(v71, v65, v66, v67, 992817389, 3302152146, v68, v69, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a58,
           a59,
           a60,
           a61,
           a62);
}

uint64_t sub_1A2E77F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned __int8 v65 = v63 ^ (a5 + 104);
  uint64_t v72 = (*(uint64_t (**)(uint64_t, uint64_t, void))(v64 + 8 * (v63 ^ 0xDBC)))(a11, a1, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v64 + 8 * ((((v65 ^ (v72 == 0)) & 1) * ((17 * (v63 ^ 0x4A5)) ^ 0x188)) ^ v63)))(v72, v66, v67, v68, 992817389, 3302152146, v69, v70, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

#error "1A2E78080: call analysis failed (funcsize=42)"

uint64_t sub_1A2E78084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10 = v8 - 1727;
  int v11 = 181 * ((v8 - 68324306) & 0x3F3FB3FF ^ (v5 - 3));
  BOOL v12 = v7 == *(void *)(v9 + 8 * (v10 - 493)) - 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                         + 8
                                                                                         * (((4
                                                                                            * ((v12 ^ v11) & 1)) & 0xF7 | (8 * ((v12 ^ v11) & 1))) ^ v10)))(a1, a2, a3, a4, a5, 3302152146);
}

uint64_t sub_1A2E780EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v31 = a6 + ((v30 + 1073689354) & 0xFB2DF8EF);
  uint64_t v32 = v27;
  (*(void (**)(uint64_t, uint64_t))(v29 + 8 * (v30 + 1081)))(a27, v28);
  BOOL v33 = (*(uint64_t (**)(void))(v29 + 8 * (v30 + 1055)))() == v32;
  return (*(uint64_t (**)(void))(v29 + 8 * ((v33 * (v31 - 1691)) ^ v30)))();
}

uint64_t sub_1A2E78164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((a6 + ((v9 + 36444165) | 0x39011029) + 329) * (v8 == v7)) ^ (v9 - 1715))))();
}

uint64_t sub_1A2E781A4@<X0>(int a1@<W5>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v24 = a2 + 743;
  int v25 = ((a2 + 743) ^ 0x4F1) - a1 + 2237;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8 * ((a2 + 743) ^ 0xDDF)))(a21, v21);
  BOOL v26 = (*(uint64_t (**)(void))(v23 + 8 * (v24 + 1055)))() == v22;
  return (*(uint64_t (**)(void))(v23 + 8 * ((v26 * (v25 ^ 0x3B2D3E45 ^ (262 * (v24 ^ 0x4F1)))) ^ v24)))();
}

uint64_t sub_1A2E7822C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((((a6 + ((v9 + 957152885) | 0x220306C) - 2117) ^ (v9 - 423651853) & 0x19406CF3)
                                * (v8 == v7)) ^ v9)))();
}

uint64_t sub_1A2E78284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(uint64_t, uint64_t))(v29 + 8 * (v30 + 1081)))(a27, v27);
  BOOL v31 = (*(uint64_t (**)(void))(v29 + 8 * (v30 ^ 0xDE1u)))() == v28;
  return (*(uint64_t (**)(void))(v29 + 8 * ((v31 * ((v30 - 743) ^ 0x3EC)) ^ v30)))();
}

uint64_t sub_1A2E782FC()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((((v3 + 992816865) ^ 0x3B2D33DB ^ (7 * (v3 ^ 0x2B9))) * (v2 == v1)) ^ v3)))();
}

uint64_t sub_1A2E7834C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v32 = v31 ^ (v27 + 817);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8 * (v31 + 1081)))(a27, v28);
  BOOL v33 = (*(uint64_t (**)(void))(v30 + 8 * (v31 + 1055)))() == v29;
  return (*(uint64_t (**)(void))(v30 + 8 * ((v33 * (v32 ^ 0x3B2D3C34)) ^ v31)))();
}

uint64_t sub_1A2E783B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v31 = a6 + v27;
  (*(void (**)(uint64_t))(v29 + 8 * (a6 + v27 + 70)))(v30);
  uint64_t v32 = (*(uint64_t (**)(uint64_t))(v29 + 8 * (v27 ^ 0x3B2D39E8)))(a27);
  return (*(uint64_t (**)(uint64_t))(v29 + 8 * ((27 * (v28 != 0)) | (v31 - 123))))(v32);
}

void sub_1A2E783C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,int a37)
{
  unint64_t v38 = STACK[0x208];
  (*(void (**)(void))(v37 + 8 * (a5 ^ (a5 + 1893))))(*(void *)(STACK[0x208]
                                                                                            - 0xE22A8927A3C9258));
  *(void *)(v38 - 0xE22A8927A3C9258) = STACK[0x218];
  *(_DWORD *)STACK[0x210] = a37;
  JUMPOUT(0x1A2E79B10);
}

uint64_t sub_1A2E78470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(a47 - 0xE22A8927A3C9250) = (a38 ^ 0x7FDE7DAB) - 268964865 + ((2 * a38) & 0xFFBCFB56);
  *(_DWORD *)(a47 - 0xE22A8927A3C924CLL) = 1241410955;
  int v72 = a6 + 992817266;
  (*(void (**)(uint64_t))(v71 + 8 * (a6 + 992817459)))(a70);
  uint64_t v73 = (*(uint64_t (**)(uint64_t))(v71 + 18472))(a71);
  return (*(uint64_t (**)(uint64_t))(v71 + 8 * ((27 * (a69 != 0)) | v72)))(v73);
}

void sub_1A2E784F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41)
{
  unint64_t v42 = STACK[0x220];
  (*(void (**)(void))(v41 + 8 * (a5 ^ (a5 + 1893))))(*(void *)(STACK[0x220]
                                                                                            - 0xE22A8927A3C9258));
  *(void *)(v42 - 0xE22A8927A3C9258) = STACK[0x230];
  *(_DWORD *)STACK[0x228] = a41;
  LODWORD(STACK[0x238]) = 0;
  JUMPOUT(0x1A2E7622CLL);
}

uint64_t sub_1A2E7854C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,unsigned int a47)
{
  *(_DWORD *)(a45 - 0xE22A8927A3C9250) = (a47 ^ 0x6FFEF9FE) - 2658388 + ((a6 + a5 - 537007299) & (2 * a47));
  *(_DWORD *)(a45 - 0xE22A8927A3C924CLL) = 1241410955;
  int v48 = STACK[0x238];
  uint64_t v50 = (*(uint64_t (**)(void, uint64_t, void))(v47 + 8 * ((a6 + a5 - 1682) ^ 0xB33)))(*(unsigned int *)*(&off_1E5AC6910 + ((a6 + a5 - 1682) ^ 0x233)), a34, a47);
  return (*(uint64_t (**)(uint64_t))(v47
                                            + 8
                                            * (((v48 == 0)
                                              * (((a5 - 2130254574) & 0x43CBEAEE ^ 0x203)
                                               + ((a5 - 2130254574) & 0x43CBEAEE ^ 0x5D5)
                                               - 475)) ^ (a5 - 2130254574) & 0x43CBEAEE)))(v50);
}

uint64_t sub_1A2E785C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v42 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(v39 + 8 * (v38 - 992815063)))(v40, v41, &a38);
  STACK[0x200] = v42;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 8 * (((v42 != 0) * (v38 - 992813338)) ^ (v38 - 992815352))))(v42, v43, v44, v45, v46, 3302152146, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_1A2E785D8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((v1 - 2050267004) ^ 0x85CB68A7 ^ (v1 - 2050267004) & 0x7A349774 ^ 7) * (a1 == 0)) ^ v1)))();
}

void sub_1A2E78620(uint64_t a1@<X8>, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unsigned int a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  (*(void (**)(uint64_t))(v27 + 8 * (v25 + 1347)))(a1);
  *BOOL v26 = 0;
  *a3 = 0;
  *(_DWORD *)(a25 + 40 * a18 + 36) = 0;
  JUMPOUT(0x1A2E78670);
}

uint64_t sub_1A2E78700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * (int)(((a6 + ((a5 + ((v6 + 1668856151) & 0x9C8746BD) + 12583246) & 0xFF3FF7FD) - 2123)
                                     * (*(void *)(v8 - 0xE22A8927A3C9258) == 0)) ^ (v6 + 1668856151) & 0x9C8746BD)))();
}

uint64_t sub_1A2E7876C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  *uint64_t v39 = 0;
  *(_DWORD *)(v42 - 0xE22A8927A3C9250) = 1876322730;
  *(_DWORD *)(v42 - 0xE22A8927A3C924CLL) = 1241410955;
  uint64_t v43 = (*(uint64_t (**)(void *))(v41 + 8 * (v40 + a6)))(v39);
  return (*(uint64_t (**)(uint64_t))(v41
                                            + 8
                                            * (((((v40 - 50) & 0x7F ^ (a39 == 0x53F82AF96D6B682ELL) ^ 0xEC) & 1)
                                              * (((v40 - 1036569394) & 0x29B9F7F) - 1193)) ^ (v40 - 1036569394) & 0x29B9F7F)))(v43);
}

uint64_t sub_1A2E78850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (((*(void *)(v6 - 0x53F82AF96D6B682ELL) == 0) * ((v7 - 70 - a6 + 970) ^ (a5 - 7))) ^ (v7 - 70))))();
}

void sub_1A2E78898()
{
  void *v1 = 0;
  *(_DWORD *)(v0 - 0x53F82AF96D6B6826) = 1337481487;
  *(_DWORD *)(v0 - 0x53F82AF96D6B6822) = 0;
  JUMPOUT(0x1A2E788F4);
}

uint64_t sub_1A2E78948()
{
  int v4 = 171 * (v0 & 0xC35A7B7 ^ 0x303);
  uint64_t v5 = (*(uint64_t (**)(void))(v2 + 8 * ((v0 & 0xC35A7B7u) + 1465)))();
  void *v3 = 0;
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (int)((((v4 - 2050267004) ^ 0x85CB68A7 ^ (v4 - 2050267004) & 0x7A349774 ^ 7)
                                                   * (*v1 == 0)) ^ v4)))(v5);
}

void sub_1A2E789C4()
{
}

uint64_t sub_1A2E78A44()
{
  BOOL v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * ((v0 + 2029) ^ 0xEE6)))(24, 4101018099) == 0;
  return (*(uint64_t (**)(void))(v1 + 8 * ((v3 * (((v2 + v0) ^ 0x3B2D3B26) + ((v0 + 2029) ^ 0x3F8))) ^ (v0 + 2029))))();
}

uint64_t sub_1A2E78AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 1876322730;
  *(void *)(a1 + 12) = 1241410955;
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8 * (v15 ^ 0xD1E)))(4096, 1358311088);
  *(void *)a1 = v17;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 8 * (((v17 == 0) * (v15 - 696 + ((2 * v15) ^ 0xF3C) - 2110)) ^ v15)))(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1A2E78B4C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (int)(((((v3 + v2 + 5393845) & 0xFFADB0ED) - 992817348) * (v0 != 0)) ^ v2)))();
}

void sub_1A2E78B90(int a1@<W5>, int a2@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a2 - 349 + a1)))(v2);
  JUMPOUT(0x1A2E78D08);
}

uint64_t sub_1A2E78D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  (*(void (**)(uint64_t))(v74 + 8 * v75))(v72);
  return (*(uint64_t (**)(void))(v74 + 8 * ((15 * (a72 != 0)) ^ (v73 - 1261))))();
}

uint64_t sub_1A2E78DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9 = (*(uint64_t (**)(void))(v7 + 8 * (a6 + v6 + 70)))();
  return (*(uint64_t (**)(uint64_t))(v7
                                            + 8
                                            * (((v8 == v6 - 992862393) * ((v6 - 992816798) ^ 0xF55)) ^ (v6 - 992815916))))(v9);
}

uint64_t sub_1A2E78E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,int a47)
{
  unsigned int v50 = ((v48 + 992965294) & 0xFFFDBBEF) - a5 + 593;
  a34 = 0;
  a47 = 0;
  a45 = 0xE22A8927A3C9258;
  uint64_t v51 = (*(uint64_t (**)(void, void, void, uint64_t *, int *))(v47 + 8 * (v48 + 1751)))(**(unsigned int **)(v49 + 8 * (v48 - 583)), *(void *)(a39 - 0x53F82AF96D6B682ELL), *(unsigned int *)(a39 - 0x53F82AF96D6B6822), &a34, &a47);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 8 * ((30 * ((v51 ^ 0x7F5DEF89) - 889193728 + ((2 * v51) & 0xFEBBDF12) != (v50 ^ 0x5A5DE8DD))) ^ v48)))(v51, v52, v53, v54, v55, v56, v57, v58, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a38);
}

uint64_t sub_1A2E78F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  BOOL v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v12 + 8 * (v11 ^ 0xB63)))(**(unsigned int **)(v15 + 8 * (v11 ^ 0x244)), a11, v13) == 0;
  return (*(uint64_t (**)(void))(v12 + 8 * ((v16 * (v14 + ((v11 + 941956527) | 0x30810ED) - 398)) ^ v11)))();
}

uint64_t sub_1A2E78F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,int a47)
{
  int v53 = (*(uint64_t (**)(void, void, void, char *, int *))(v48 + 8 * (v47 ^ 0xB77)))(*v50, *v49, *v51, &a34, &a47);
  unsigned int v54 = (v53 ^ 0xEEDDEBCD) + 1535114940 + ((((v47 + 34340311) | 0x392130C5) ^ 0xE696E777) & (2 * v53));
  if (v54 == 1516104332) {
LABEL_6:
  }
    JUMPOUT(0x1A2E79508);
  if (v54 != 1247668873)
  {
    int v57 = 2052531167 * (((v52 - 108) & 0xAC0229D1 | ~((v52 - 108) | 0xAC0229D1)) ^ 0x96776102);
    *(_DWORD *)(v52 - 104) = -1239432284 - v57;
    *(_DWORD *)(v52 - 100) = (v54 - ((2 * v54 + 725887726) & 0x25BEB83A) + 1216442772) ^ v57;
    (*(void (**)(uint64_t))(v48 + 18568))(v52 - 108);
    goto LABEL_6;
  }
  uint64_t v55 = *(uint64_t (**)(void))(v48
                            + 8
                            * ((110
                              * ((*(uint64_t (**)(uint64_t, uint64_t))(v48 + 18520))(24, 4101018099) != 0)) ^ 0x1B2));
  return v55();
}

uint64_t sub_1A2E793B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(void))(v73 + 8 * ((15 * (a72 != 0)) ^ (v72 - 1261))))();
}

uint64_t sub_1A2E793F0()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 - 80777191) & 0x3FFDBEED ^ (v1 + 992816921)) * (v0 != 0)) ^ v1)))();
}

void sub_1A2E79438(int a1@<W5>, int a2@<W8>)
{
  (*(void (**)(uint64_t))(v3 + 8 * (a2 + 1753 + a1)))(v2);
  JUMPOUT(0x1A2E794C4);
}

uint64_t sub_1A2E79578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34
                                                                                                  + 8 * (((a33 == 0xE22A8927A3C9258) * ((13 * (v33 ^ 0x27A)) ^ (v33 + 854))) ^ v33)))(a1, a2, a3, a4, a5, a6, 3053556341);
}

uint64_t sub_1A2E795D0@<X0>(int a1@<W8>)
{
  unsigned int v3 = *(_DWORD *)(v2 - 0xE22A8927A3C924CLL) + 90537754;
  unsigned int v4 = *(_DWORD *)(v2 - 0xE22A8927A3C9250) - 544374025;
  BOOL v5 = v3 < ((a1 - 268) ^ 0x4F63EA3Eu);
  BOOL v6 = v3 > v4;
  if (v5 != v4 < 0x4F63ECA1) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((!v6 * (a1 - 1956)) ^ a1)))();
}

uint64_t sub_1A2E7966C@<X0>(int a1@<W6>, int a2@<W8>)
{
  uint64_t v6 = *(void *)(v5 - 0xE22A8927A3C9258);
  int v7 = (*(unsigned __int8 *)(v6 + (v3 + a1 + 1)) << (((a2 + 52) & 0xBF) + 113)) | (*(unsigned __int8 *)(v6 + (v3 + a1)) << (a2 + 109)) | (*(unsigned __int8 *)(v6 + (v3 + a1 + 2)) << 8) | *(unsigned __int8 *)(v6 + (v3 + a1 + 3));
  *uint64_t v2 = v3 + 4;
  return (*(uint64_t (**)(void))(v4 + 8 * ((1774 * (v7 == 0)) ^ (a2 - 1036))))();
}

uint64_t sub_1A2E79700()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((((v0 + 230) ^ 0x7E8) + 818) ^ 0x68C) * (v2 == 0xE22A8927A3C9258)) ^ (v0 + 230))))();
}

uint64_t sub_1A2E79748()
{
  BOOL v4 = v0 - 1551494817 > (v1 + 2108560696);
  if ((v1 + 2108560696) < 0xED847EE2 != v0 - 1551494817 < ((v2 + 1063) ^ 0x10Bu) - 310085565) {
    BOOL v4 = v0 - 1551494817 < ((v2 + 1063) ^ 0x10Bu) - 310085565;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((242 * v4) ^ v2)))();
}

uint64_t sub_1A2E797BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v33 = *(unsigned __int8 *)(v29 + (a7 + v28 + 6));
  *uint64_t v27 = v28 + 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (v30 ^ (53 * (v32 != 0xE22A8927A3C9258)))))(53, v33, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1A2E79848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v12 = v10 + v9 + ((v8 + 897) ^ (a7 + 629));
  unsigned int v13 = v12 + 1862066372;
  unsigned int v14 = v7 - 14256479 + (v8 ^ 0x367);
  BOOL v15 = v12 > 0x91031F3B;
  BOOL v16 = v13 > v14;
  if (v14 < 0x6EFCE0C4 == v15) {
    BOOL v15 = v16;
  }
  return (*(uint64_t (**)(void))(v11 + 8 * ((47 * !v15) ^ v8)))();
}

uint64_t sub_1A2E798C8(int a1)
{
  _DWORD *v1 = v2;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v4 == 0xE22A8927A3C9258) ^ (a1 - 80)) & 1)
                                * ((a1 + 1574) ^ 0x667)) ^ a1)))();
}

uint64_t sub_1A2E79914()
{
  BOOL v4 = v1 - 412460064 > (v0 - 1047371843);
  if ((v0 - 1047371843) < 0x3168C967 != v1 - 412460064 < ((v2 + 94) | 0x218u) + 828949192) {
    BOOL v4 = v1 - 412460064 < ((v2 + 94) | 0x218u) + 828949192;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((!v4 * (((v2 - 752) | 0x42) ^ 0x17E)) ^ v2)))();
}

uint64_t sub_1A2E7999C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v39 = (*(unsigned __int8 *)(v34 + a7 + v35 + (v36 ^ 0x102u) - 121) << (((v36 - 111) | 0x12) - 6)) | (*(unsigned __int8 *)(v34 + (a7 + v35 + 1)) << 16) | (*(unsigned __int8 *)(v34 + (a7 + v35 + 2)) << 8) | *(unsigned __int8 *)(v34 + (a7 + v35 + 3));
  uint64_t v40 = (v35 + 4);
  *uint64_t v33 = v40;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (v36 ^ (229 * (v38 != 0xE22A8927A3C9258)))))(v39, v40, 229, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a33);
}

uint64_t sub_1A2E79A2C(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v10 = a1 + a2 + a7;
  unsigned int v11 = v10 + 1495197972;
  unsigned int v12 = v7 - 381124815 + 3 * (v8 ^ 0x70D);
  BOOL v13 = v10 > 0xA6E116EB;
  int v14 = v13 ^ (v12 < 0x591EE914);
  BOOL v15 = v11 > v12;
  if (v14) {
    BOOL v15 = v13;
  }
  return (*(uint64_t (**)(void))(v9 + 8 * ((!v15 * ((v8 ^ 0x70D) + 26)) ^ v8)))();
}

void sub_1A2E79AAC(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  *uint64_t v23 = v24;
  LODWORD(STACK[0x23C]) = 0;
  *a23 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8 * (a1 + 352)))(v25, 925082483);
  JUMPOUT(0x1A2E79B0CLL);
}

void sub_1A2E79BC4()
{
  LODWORD(STACK[0x23C]) = v0;
  JUMPOUT(0x1A2E786A0);
}

uint64_t sub_1A2E79BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v35 = (*(uint64_t (**)(void, uint64_t))(v34 + 8 * (v33 + 239)))(v32 - 2144798872 + 1103 * (v33 ^ 0x81Eu), 1120292948);
  STACK[0x230] = v35;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * (((v35 == 0) * (v33 - 2013)) ^ v33)))(v35, v36, v37, v38, v39, 3302152146, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a32);
}

uint64_t sub_1A2E79C40()
{
  LODWORD(STACK[0x238]) = v2;
  return (*(uint64_t (**)(void))(v1 + 8 * (((((v3 ^ 0x959) + 102) ^ 0x216) * (v0 == 0)) ^ v3)))();
}

uint64_t sub_1A2E79C74@<X0>(int a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * (int)(((*v2 == 0) * (((a2 - a1 + 1784) ^ 0xFFFFFFF6) + a2 + 992816934)) ^ a2)))();
}

uint64_t sub_1A2E79CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,unsigned int a47)
{
  int v57 = a6 + v49 - 1682;
  *(void *)uint64_t v51 = 0;
  *(_DWORD *)(v51 + 8) = v55;
  *(_DWORD *)(v51 + 12) = v53;
  (*(void (**)(uint64_t))(v52 + 8 * (v49 ^ (v50 + 1893))))(v51);
  uint64_t v47 = (*(uint64_t (**)(void, uint64_t, void))(v52 + 8 * (v57 ^ 0xB33)))(**(unsigned int **)(v56 + 8 * (v57 ^ 0x233)), a34, a47);
  return (*(uint64_t (**)(uint64_t))(v52
                                            + 8
                                            * (((v54 == 0)
                                              * (((v57 - 1137437742) & 0x43CBEAEE ^ 0x203)
                                               + ((v57 - 1137437742) & 0x43CBEAEE ^ 0x5D5)
                                               - 475)) ^ (v57 - 1137437742) & 0x43CBEAEE)))(v47);
}

uint64_t sub_1A2E79D58(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v30 = v28 + 133;
  uint64_t v31 = (*(uint64_t (**)(void, uint64_t))(v29 + 8 * (v28 + 432)))(((v28 - 1172) ^ 0x90089486) + a2, 1120292948);
  STACK[0x218] = v31;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * (((v31 == 0) * ((v30 ^ 0x7A9) - 56)) | v30)))(v31, v32, v33, v34, 992817389, 3302152146, v35, v36, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_1A2E79DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (((a6 + (v8 ^ (a5 + 317)) + (v8 ^ 0x226) - 2449) * (v6 == 0)) ^ v8)))();
}

uint64_t sub_1A2E79E08@<X0>(char a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((*v2 == 0) ^ (a2 - a1 - 34)) & 1)
                                * ((a2 - 8425460) & 0x3BADBFFF ^ 0x3B2D30E3)) | a2)))();
}

uint64_t sub_1A2E79E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  (*(void (**)(void))(v31 + 8 * (v29 + a6)))();
  *(void *)a23 = 0;
  *(_DWORD *)(a23 + 8) = a20;
  *(_DWORD *)(a23 + 12) = 1241410955;
  (*(void (**)(uint64_t))(v31 + 8 * (v29 ^ 0x3B2D3852)))(a23);
  (*(void (**)(uint64_t))(v31 + 8 * (v29 - 992815080)))(v32);
  uint64_t v27 = (*(uint64_t (**)(uint64_t))(v31 + 8 * (v29 ^ 0x3B2D39E8)))(a27);
  return (*(uint64_t (**)(uint64_t))(v31 + 8 * ((27 * (v30 != 0)) | (v29 - 992815273))))(v27);
}

uint64_t sub_1A2E79EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t)*(&off_1E5AC6910
                + ((9 * ((dword_1E95A44F8 + dword_1E95A4520) ^ 0x7D)) ^ byte_1A3019D20[byte_1A301A790[(9 * ((dword_1E95A44F8 + dword_1E95A4520) ^ 0x7D))] ^ 0xC0])
                - 30);
  uint64_t v3 = *(void *)(v2 - 4);
  uint64_t v4 = (uint64_t)*(&off_1E5AC6910
                + (byte_1A301A258[(byte_1A3019E38[(9 * ((dword_1E95A44F8 + v3) ^ 0x7D))
                                                                 - 8] ^ 0x19)
                                                 - 8] ^ (9 * ((dword_1E95A44F8 + v3) ^ 0x7D)))
                - 39);
  unint64_t v5 = (unint64_t)&v13[*(void *)(v4 - 4) ^ v3];
  uint64_t v6 = 1787074057 * v5 + 0x12143784A120E583;
  unint64_t v7 = 1787074057 * (v5 ^ 0xEDEBC87B5EDF1A7DLL);
  *(void *)(v2 - 4) = v6;
  *(void *)(v4 - 4) = v7;
  LOBYTE(v7) = 9 * ((v7 - *(_DWORD *)(v2 - 4)) ^ 0x7D);
  int v8 = (char *)*(&off_1E5AC6910
               + ((9 * ((dword_1E95A44F8 + dword_1E95A4520) ^ 0x7D)) ^ byte_1A3019C20[byte_1A301A690[(9 * ((dword_1E95A44F8 + dword_1E95A4520) ^ 0x7D))] ^ 0xB1])
               - 189)
     - 4;
  uint64_t v9 = (*(uint64_t (**)(uint64_t))&v8[8
                                             * (byte_1A301A554[(byte_1A301A130[v7] ^ 0x81)
                                                                              - 4] ^ v7)
                                             + 16984])(a2);
  unsigned __int8 v10 = 9 * ((*(_DWORD *)(v4 - 4) - *(_DWORD *)(v2 - 4)) ^ 0x7D);
  unsigned int v11 = *(uint64_t (**)(uint64_t))&v8[8
                                             * (byte_1A3019C24[(byte_1A301A69C[v10 - 12] ^ 0x1A) - 4] ^ v10)
                                             + 16440];

  return v11(v9);
}

void fm23w5mn5o()
{
  uint64_t v0 = (uint64_t)*(&off_1E5AC6910
                + ((9 * ((dword_1E95A44F8 - qword_1E95A4528) ^ 0x7D)) ^ byte_1A3019C20[byte_1A301A690[(9 * ((dword_1E95A44F8 - qword_1E95A4528) ^ 0x7D))] ^ 0x92])
                - 204);
  unint64_t v1 = (unint64_t)&v4 ^ qword_1E95A4528 ^ *(void *)(v0 - 4);
  unint64_t v2 = (1787074057 * v1) ^ 0xEDEBC87B5EDF1A7DLL;
  unint64_t v3 = 1787074057 * (v1 ^ 0xEDEBC87B5EDF1A7DLL);
  qword_1E95A4528 = v2;
  *(void *)(v0 - 4) = v3;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1A2E7A1F0()
{
  (*(void (**)(void))(v1 + 17912))();
  *(void *)(v0 + 8) = 0;
  return (*(uint64_t (**)(void))(v1 + 8 * ((127 * (*(void *)(v0 + 24) == 0)) ^ 0x827)))();
}

uint64_t sub_1A2E7A24C()
{
  *(_DWORD *)(v0 + 36) = 0;
  *(void *)uint64_t v0 = 0;
  return (*(uint64_t (**)(void))(v1
                              + 8 * ((980 * ((v2 ^ 0xD7 ^ (*(void *)(v0 + 48) == 0)) & 1)) ^ v2)))();
}

uint64_t sub_1A2E7A288@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((*(void *)(v1 + 64) == 0) * ((a1 + 3) ^ (a1 - 1169327030) ^ 0xBA4D845A)) ^ a1)))();
}

uint64_t sub_1A2E7A2C8()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((127 * (*(void *)(v0 + 24) == 0)) ^ 0x827)))();
}

uint64_t sub_1A2E7A314@<X0>(int a1@<W8>)
{
  unsigned int v3 = a1 + 1057;
  (*(void (**)(void))(v2 + 8 * (a1 ^ 0x902u)))();
  *(void *)(v1 + 24) = 0;
  *(_DWORD *)(v1 + 36) = 0;
  *(void *)uint64_t v1 = 0;
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((980 * ((v3 ^ 0xD7 ^ (*(void *)(v1 + 48) == 0)) & 1)) ^ v3)))();
}

uint64_t sub_1A2E7A36C()
{
  (*(void (**)(void))(v1 + 8 * (v2 + 737)))();
  *(void *)(v0 + 48) = 0;
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((*(void *)(v0 + 64) == 0) * ((v2 - 466) ^ (v2 - 1169327499) ^ 0xBA4D845A)) ^ (v2 - 469))))();
}

uint64_t sub_1A2E7A3C4()
{
  (*(void (**)(void))(v2 + 8 * (v0 + 1203)))();
  *(void *)(v1 + 64) = 0;
  *(_DWORD *)(v1 + 76) = 0;
  *(void *)(v1 + 40) = 0;
  return 0;
}

void sub_1A2E7A404(uint64_t a1)
{
  __asm { BRAA            X9, X10 }
}

uint64_t sub_1A2E7A440@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v3 = -769513831 * a2;
  int v4 = ((uint64_t (*)(void))qword_1EF5E9A00[-769513831 * a2 + 2])();
  qword_1EF5E9A00[v3 + 1](a1);
  if (v4 == 16) {
    unsigned int v5 = -42029;
  }
  else {
    unsigned int v5 = -42030;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

void sub_1A2E7A4D0(uint64_t a1)
{
  __asm { BRAA            X10, X11 }
}

uint64_t sub_1A2E7A518@<X0>(int a1@<W8>)
{
  int v3 = (-21985942 * v1) | a1;
  uint64_t v4 = ((uint64_t (*)(uint64_t))qword_1EF5E9A00[v3 - 1])(200);
  return (*(uint64_t (**)(void))(v2 + 8 * (v3 + 2 * (v4 != 0))))();
}

uint64_t sub_1A2E7A584@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v8 = (*(uint64_t (**)(uint64_t, void))(v5 + 8 * (v6 + a2 * (v4 - 1) + 21985945)))(a1, 0);
  if (v8 == 16)
  {
    int v3 = 1537719254;
    goto LABEL_7;
  }
  if (v8 == 12)
  {
LABEL_7:
    (*(void (**)(uint64_t))(v5 + 8 * (v4 + 21985943)))(a1);
    return (1510190423 * v3 + 277669913);
  }
  if (v8)
  {
    int v3 = 292433263;
    goto LABEL_7;
  }
  *uint64_t v2 = a1;
  int v3 = 1191165937;
  return (1510190423 * v3 + 277669913);
}

void fd3fa4R8(int a1, uint64_t a2)
{
  __asm { BRAA            X8, X10 }
}

uint64_t sub_1A2E7A6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  int v20 = -191875503 * (v19 ^ 1) - 2 * v19 + 5;
  *(&a19 + 16 * (void)&a19 - 144 * (((unint64_t)&a9 - 0x36F214C141B3E0BELL) / 9) - 0x6F214C141B3E10D1) = *(unsigned char *)(qword_1E5AC6A30[v20 + 6] + 8) ^ *(unsigned char *)(a2 + 15) ^ 0xD1 ^ *(unsigned char *)(qword_1E5AC6A30[v20 + 1] + 13) ^ *(unsigned char *)(qword_1E5AC6A30[v20 + 5] + 14);
  return (*(uint64_t (**)(void))(a5 + 8 * v20))();
}

void sub_1A2E7A7B4()
{
}

uint64_t sub_1A2E7A7C4()
{
  return 4294925273;
}

void sub_1A2E7F10C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL ICIAMImpressionNodeReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        int v19 = *(void **)(a1 + v18);
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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ICDelegateTokenPersistentValueForTokenType(uint64_t a1)
{
  if (a1 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

BOOL ICDelegateTokenTypeForPersistentValue(uint64_t a1, BOOL *a2)
{
  BOOL v2 = a1 == 1 || a1 == 2;
  BOOL result = a1 != 1 && a1 == 2;
  *a2 = v2;
  return result;
}

uint64_t _ICLLPlayNowQueueItemsCommandReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
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
        *(unsigned char *)(a1 + 52) |= 2u;
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
            goto LABEL_45;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_47:
        uint64_t v33 = 48;
        goto LABEL_52;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
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
                LODWORD(v19) = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_51:
        uint64_t v33 = 16;
LABEL_52:
        *(_DWORD *)(a1 + v33) = v19;
        goto LABEL_53;
      case 3u:
        int v29 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLPlayNowQueueItemsCommand addItems:](a1, v29);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemReadFrom((uint64_t)v29, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_43;
      case 4u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 24;
        goto LABEL_40;
      case 5u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 32;
LABEL_40:
        uint64_t v32 = *(void **)(a1 + v31);
        *(void *)(a1 + v31) = v30;

        goto LABEL_53;
      case 6u:
        int v29 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 40), v29);
        if (PBReaderPlaceMark() && _ICLLRadioSourceReadFrom((uint64_t)v29, a2))
        {
LABEL_43:
          PBReaderRecallMark();

LABEL_53:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_55:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_53;
    }
  }
}

void sub_1A2E82CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

uint64_t __Block_byref_object_copy__324(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__325(uint64_t a1)
{
}

BOOL _ICLLReactionCommandReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
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
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

_DWORD *_MSV_XXH_XXH32_update(_DWORD *result, char *__src, size_t __n)
{
  if (__src)
  {
    int v3 = __n;
    int v4 = __src;
    uint64_t v5 = result;
    int v6 = result[1];
    unsigned int v7 = *result + __n;
    *uint64_t result = v7;
    result[1] = v6 | (v7 > 0xF);
    uint64_t v8 = result[10];
    if (v8 + __n <= 0xF)
    {
      uint64_t result = memcpy((char *)result + v8 + 24, __src, __n);
      LODWORD(v9) = v5[10] + v3;
LABEL_12:
      _DWORD v5[10] = v9;
      return result;
    }
    unint64_t v10 = &__src[__n];
    if (v8)
    {
      uint64_t result = memcpy((char *)result + v8 + 24, __src, (16 - v8));
      HIDWORD(v11) = v5[2] - 2048144777 * v5[6];
      LODWORD(v11) = HIDWORD(v11);
      int v12 = -1640531535 * (v11 >> 19);
      HIDWORD(v11) = v5[3] - 2048144777 * v5[7];
      LODWORD(v11) = HIDWORD(v11);
      void v5[2] = v12;
      v5[3] = -1640531535 * (v11 >> 19);
      HIDWORD(v11) = v5[4] - 2048144777 * v5[8];
      LODWORD(v11) = HIDWORD(v11);
      v5[4] = -1640531535 * (v11 >> 19);
      HIDWORD(v11) = v5[5] - 2048144777 * v5[9];
      LODWORD(v11) = HIDWORD(v11);
      v5[5] = -1640531535 * (v11 >> 19);
      v4 += (16 - v5[10]);
      _DWORD v5[10] = 0;
    }
    if (v4 <= v10 - 16)
    {
      int v13 = v5[2];
      int v14 = v5[3];
      int v15 = v5[4];
      int v16 = v5[5];
      do
      {
        HIDWORD(v17) = v13 - 2048144777 * *(_DWORD *)v4;
        LODWORD(v17) = HIDWORD(v17);
        int v13 = -1640531535 * (v17 >> 19);
        HIDWORD(v17) = v14 - 2048144777 * *((_DWORD *)v4 + 1);
        LODWORD(v17) = HIDWORD(v17);
        int v14 = -1640531535 * (v17 >> 19);
        HIDWORD(v17) = v15 - 2048144777 * *((_DWORD *)v4 + 2);
        LODWORD(v17) = HIDWORD(v17);
        int v15 = -1640531535 * (v17 >> 19);
        HIDWORD(v17) = v16 - 2048144777 * *((_DWORD *)v4 + 3);
        LODWORD(v17) = HIDWORD(v17);
        int v16 = -1640531535 * (v17 >> 19);
        v4 += 16;
      }
      while (v4 <= v10 - 16);
      void v5[2] = v13;
      v5[3] = v14;
      v5[4] = v15;
      v5[5] = v16;
    }
    if (v4 < v10)
    {
      size_t v9 = v10 - v4;
      uint64_t result = memcpy(v5 + 6, v4, v9);
      goto LABEL_12;
    }
  }
  return result;
}

char *_MSV_XXH_XXH64_update(char *result, char *__src, size_t __n)
{
  if (__src)
  {
    int v3 = __n;
    int v4 = __src;
    uint64_t v5 = result;
    *(void *)result += __n;
    uint64_t v6 = *((unsigned int *)result + 18);
    if (v6 + __n <= 0x1F)
    {
      uint64_t result = (char *)memcpy(&result[v6 + 40], __src, __n);
      LODWORD(v7) = *((_DWORD *)v5 + 18) + v3;
LABEL_12:
      *((_DWORD *)v5 + 18) = v7;
      return result;
    }
    uint64_t v8 = &__src[__n];
    if (v6)
    {
      uint64_t result = (char *)memcpy(&result[v6 + 40], __src, (32 - v6));
      uint64_t v9 = __ROR8__(*((void *)v5 + 2) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 6), 33);
      *((void *)v5 + 1) = 0x9E3779B185EBCA87
                          * __ROR8__(*((void *)v5 + 1) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 5), 33);
      *((void *)v5 + 2) = 0x9E3779B185EBCA87 * v9;
      unint64_t v10 = 0x9E3779B185EBCA87 * __ROR8__(*((void *)v5 + 4) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 8), 33);
      *((void *)v5 + 3) = 0x9E3779B185EBCA87
                          * __ROR8__(*((void *)v5 + 3) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 7), 33);
      *((void *)v5 + 4) = v10;
      v4 += (32 - *((_DWORD *)v5 + 18));
      *((_DWORD *)v5 + 18) = 0;
    }
    if (v4 + 32 <= v8)
    {
      unint64_t v11 = *((void *)v5 + 1);
      unint64_t v12 = *((void *)v5 + 2);
      unint64_t v14 = *((void *)v5 + 3);
      unint64_t v13 = *((void *)v5 + 4);
      do
      {
        unint64_t v11 = 0x9E3779B185EBCA87 * __ROR8__(v11 - 0x3D4D51C2D82B14B1 * *(void *)v4, 33);
        unint64_t v12 = 0x9E3779B185EBCA87 * __ROR8__(v12 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 1), 33);
        unint64_t v14 = 0x9E3779B185EBCA87 * __ROR8__(v14 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 2), 33);
        unint64_t v13 = 0x9E3779B185EBCA87 * __ROR8__(v13 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 3), 33);
        v4 += 32;
      }
      while (v4 <= v8 - 32);
      *((void *)v5 + 1) = v11;
      *((void *)v5 + 2) = v12;
      *((void *)v5 + 3) = v14;
      *((void *)v5 + 4) = v13;
    }
    if (v4 < v8)
    {
      size_t v7 = v8 - v4;
      uint64_t result = (char *)memcpy(v5 + 40, v4, v7);
      goto LABEL_12;
    }
  }
  return result;
}

uint64_t _ICLLQueueSyncActionReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  size_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        unint64_t v17 = objc_alloc_init(_ICLLQueue);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (_ICLLQueueReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v19;

        goto LABEL_39;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
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
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        *(_DWORD *)(a1 + 32) = v23;
        goto LABEL_39;
      case 4u:
        unint64_t v17 = objc_alloc_init(_ICLLPlaybackControlSettings);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (_ICLLPlaybackControlSettingsReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

BOOL _ICLLDisplayMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    size_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadString();
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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _ICLLPlaybackControlSettingsCommandReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    size_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = objc_alloc_init(_ICLLPlaybackControlSettings);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackControlSettingsReadFrom((uint64_t)v17, a2) & 1) == 0)
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

uint64_t ICIAMApplicationMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  size_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 64;
        goto LABEL_73;
      case 2u:
        PBReaderReadString();
        char v21 = (ICIAMMessageContent *)objc_claimAutoreleasedReturnValue();
        if (v21) {
          [(id)a1 addTarget:v21];
        }
        goto LABEL_109;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 156) |= 0x20u;
        while (2)
        {
          uint64_t v25 = *v3;
          uint64_t v26 = *(void *)(a2 + v25);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              BOOL v15 = v23++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_120;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_120:
        uint64_t v87 = 92;
        goto LABEL_149;
      case 4u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(_WORD *)(a1 + 156) |= 0x100u;
        while (2)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if (v35 < 0)
            {
              v29 += 7;
              BOOL v15 = v30++ >= 9;
              if (v15)
              {
                uint64_t v31 = 0;
                goto LABEL_124;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_124:
        BOOL v88 = v31 != 0;
        uint64_t v89 = 152;
        goto LABEL_154;
      case 5u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 156) |= 0x80u;
        while (2)
        {
          uint64_t v38 = *v3;
          uint64_t v39 = *(void *)(a2 + v38);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v40;
            v24 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              BOOL v15 = v37++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_128;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_128:
        uint64_t v87 = 112;
        goto LABEL_149;
      case 6u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 136;
        goto LABEL_73;
      case 7u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 156) |= 0x10u;
        while (2)
        {
          uint64_t v44 = *v3;
          uint64_t v45 = *(void *)(a2 + v44);
          unint64_t v46 = v45 + 1;
          if (v45 == -1 || v46 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v46;
            v24 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              BOOL v15 = v43++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_132;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_132:
        uint64_t v87 = 88;
        goto LABEL_149;
      case 8u:
        *(_WORD *)(a1 + 156) |= 2u;
        uint64_t v48 = *v3;
        unint64_t v49 = *(void *)(a2 + v48);
        if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v50 = *(void *)(*(void *)(a2 + *v7) + v49);
          *(void *)(a2 + v48) = v49 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v50 = 0;
        }
        uint64_t v90 = 16;
        goto LABEL_159;
      case 9u:
        *(_WORD *)(a1 + 156) |= 1u;
        uint64_t v51 = *v3;
        unint64_t v52 = *(void *)(a2 + v51);
        if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v50 = *(void *)(*(void *)(a2 + *v7) + v52);
          *(void *)(a2 + v51) = v52 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v50 = 0;
        }
        uint64_t v90 = 8;
LABEL_159:
        *(void *)(a1 + v90) = v50;
        goto LABEL_160;
      case 0xAu:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v55 = 0;
        *(_WORD *)(a1 + 156) |= 0x200u;
        while (2)
        {
          uint64_t v56 = *v3;
          uint64_t v57 = *(void *)(a2 + v56);
          unint64_t v58 = v57 + 1;
          if (v57 == -1 || v58 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v58;
            v55 |= (unint64_t)(v59 & 0x7F) << v53;
            if (v59 < 0)
            {
              v53 += 7;
              BOOL v15 = v54++ >= 9;
              if (v15)
              {
                uint64_t v55 = 0;
                goto LABEL_136;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v55 = 0;
        }
LABEL_136:
        BOOL v88 = v55 != 0;
        uint64_t v89 = 153;
        goto LABEL_154;
      case 0xBu:
        char v21 = objc_alloc_init(ICIAMMessageContent);
        [(id)a1 addContentPages:v21];
        if (!PBReaderPlaceMark() || !ICIAMMessageContentReadFrom((char *)v21, a2)) {
          goto LABEL_162;
        }
        goto LABEL_108;
      case 0xCu:
        char v21 = objc_alloc_init(ICIAMMessageRule);
        objc_storeStrong((id *)(a1 + 120), v21);
        if (!PBReaderPlaceMark() || (ICIAMMessageRuleReadFrom((uint64_t)v21, a2) & 1) == 0) {
          goto LABEL_162;
        }
        goto LABEL_108;
      case 0xDu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 144;
LABEL_73:
        int v60 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_160;
      case 0xEu:
        char v61 = 0;
        unsigned int v62 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 156) |= 0x40u;
        while (2)
        {
          uint64_t v63 = *v3;
          uint64_t v64 = *(void *)(a2 + v63);
          unint64_t v65 = v64 + 1;
          if (v64 == -1 || v65 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v64);
            *(void *)(a2 + v63) = v65;
            v24 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              BOOL v15 = v62++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_140;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_140:
        uint64_t v87 = 96;
        goto LABEL_149;
      case 0xFu:
        char v67 = 0;
        unsigned int v68 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 156) |= 8u;
        while (2)
        {
          uint64_t v69 = *v3;
          uint64_t v70 = *(void *)(a2 + v69);
          unint64_t v71 = v70 + 1;
          if (v70 == -1 || v71 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
            *(void *)(a2 + v69) = v71;
            v24 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v67 += 7;
              BOOL v15 = v68++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_144;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_144:
        uint64_t v87 = 48;
        goto LABEL_149;
      case 0x10u:
        char v73 = 0;
        unsigned int v74 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 156) |= 4u;
        while (2)
        {
          uint64_t v75 = *v3;
          uint64_t v76 = *(void *)(a2 + v75);
          unint64_t v77 = v76 + 1;
          if (v76 == -1 || v77 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
            *(void *)(a2 + v75) = v77;
            v24 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              v73 += 7;
              BOOL v15 = v74++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_148;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_148:
        uint64_t v87 = 32;
LABEL_149:
        *(_DWORD *)(a1 + v87) = v24;
        goto LABEL_160;
      case 0x11u:
        char v21 = objc_alloc_init(ICIAMMetricEvent);
        uint64_t v79 = 56;
        goto LABEL_100;
      case 0x12u:
        char v21 = objc_alloc_init(ICIAMLocalNotification);
        objc_storeStrong((id *)(a1 + 80), v21);
        if (!PBReaderPlaceMark() || (ICIAMLocalNotificationReadFrom((uint64_t)v21, a2) & 1) == 0) {
          goto LABEL_162;
        }
        goto LABEL_108;
      case 0x13u:
        char v21 = objc_alloc_init(ICIAMMetricEvent);
        uint64_t v79 = 72;
LABEL_100:
        objc_storeStrong((id *)(a1 + v79), v21);
        if (!PBReaderPlaceMark() || (ICIAMMetricEventReadFrom((uint64_t)v21, a2) & 1) == 0) {
          goto LABEL_162;
        }
        goto LABEL_108;
      case 0x14u:
        char v21 = objc_alloc_init(ICIAMMessagePresentationTrigger);
        [(id)a1 addPresentationTriggers:v21];
        if (!PBReaderPlaceMark() || (ICIAMMessagePresentationTriggerReadFrom((uint64_t)v21, a2) & 1) == 0) {
          goto LABEL_162;
        }
        goto LABEL_108;
      case 0x15u:
        char v21 = objc_alloc_init(ICIAMApplicationBadge);
        objc_storeStrong((id *)(a1 + 24), v21);
        if (PBReaderPlaceMark() && ICIAMApplicationBadgeReadFrom((uint64_t)v21, a2))
        {
LABEL_108:
          PBReaderRecallMark();
LABEL_109:

LABEL_160:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_162:

        return 0;
      case 0x16u:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v82 = 0;
        *(_WORD *)(a1 + 156) |= 0x400u;
        while (2)
        {
          uint64_t v83 = *v3;
          uint64_t v84 = *(void *)(a2 + v83);
          unint64_t v85 = v84 + 1;
          if (v84 == -1 || v85 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v86 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
            *(void *)(a2 + v83) = v85;
            v82 |= (unint64_t)(v86 & 0x7F) << v80;
            if (v86 < 0)
            {
              v80 += 7;
              BOOL v15 = v81++ >= 9;
              if (v15)
              {
                uint64_t v82 = 0;
                goto LABEL_153;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v82 = 0;
        }
LABEL_153:
        BOOL v88 = v82 != 0;
        uint64_t v89 = 154;
LABEL_154:
        *(unsigned char *)(a1 + v89) = v88;
        goto LABEL_160;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_160;
    }
  }
}

uint64_t __Block_byref_object_copy__1106(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1107(uint64_t a1)
{
}

uint64_t _ICLLParticipantReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    size_t v7 = (int *)MEMORY[0x1E4F940B8];
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
          *(unsigned char *)(a1 + 40) |= 1u;
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
              goto LABEL_46;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_48;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_48:
          *(void *)(a1 + 8) = v19;
          continue;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 16;
          goto LABEL_30;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
LABEL_30:
          uint64_t v26 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
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
                  LODWORD(v29) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v29) = 0;
          }
LABEL_52:
          uint64_t v38 = 32;
          goto LABEL_57;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
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
        uint64_t v35 = *v3;
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v36 + 1;
        v29 |= (unint64_t)(v37 & 0x7F) << v33;
        if ((v37 & 0x80) == 0) {
          goto LABEL_54;
        }
        v33 += 7;
        BOOL v14 = v34++ >= 9;
        if (v14)
        {
          LODWORD(v29) = 0;
          goto LABEL_56;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v29) = 0;
      }
LABEL_56:
      uint64_t v38 = 36;
LABEL_57:
      *(_DWORD *)(a1 + v38) = v29;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ICDelegateAccountStoreServiceClientGetInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF65AD10];
}

id ICDelegateAccountStoreServiceGetInterface()
{
  int v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6533E0];
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  int v3 = objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_addDelegationUUIDs_forUserIdentity_completionHandler_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v3 forSelector:sel_removeDelegationUUIDs_forUserIdentity_completionHandler_ argumentIndex:0 ofReply:0];

  return v0;
}

__CFString *NSStringFromICErrorCode(uint64_t a1)
{
  if (a1 <= -7408)
  {
    if (a1 <= -7808)
    {
      if (a1 <= -8105)
      {
        if (a1 > -8203)
        {
          switch(a1)
          {
            case -8202:
              uint64_t v2 = @"DeveloperTokenFormatUnsupported";
              break;
            case -8201:
              uint64_t v2 = @"DeveloperTokenInvalidationFailed";
              break;
            case -8200:
              uint64_t v2 = @"DeveloperTokenFetchingFailed";
              break;
            default:
              goto LABEL_206;
          }
        }
        else
        {
          switch(a1)
          {
            case -8302:
              uint64_t v2 = @"AssetDownloadMediaServicesLost";
              break;
            case -8301:
              uint64_t v2 = @"AssetDownloadMediaResponseItemInvalid";
              break;
            case -8300:
              uint64_t v2 = @"AssetDownloadSessionUnavailable";
              break;
            default:
              goto LABEL_206;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case -8104:
            uint64_t v2 = @"MusicUserTokenInvalidationFailed";
            break;
          case -8103:
            uint64_t v2 = @"MusicUserTokenCachingFailed";
            break;
          case -8102:
            uint64_t v2 = @"MusicUserTokenFetchingFailed";
            break;
          case -8101:
            uint64_t v2 = @"MusicUserTokenFetchingUnauthorized";
            break;
          case -8100:
            uint64_t v2 = @"MusicUserTokenRevoked";
            break;
          default:
            if (a1 == -8000)
            {
              uint64_t v2 = @"TelephonyFailedToSendTextMessage";
            }
            else
            {
              if (a1 != -7901) {
                goto LABEL_206;
              }
              uint64_t v2 = @"InvalidAuthenticationToken";
            }
            break;
        }
      }
    }
    else if (a1 > -7701)
    {
      if (a1 > -7601)
      {
        switch(a1)
        {
          case -7503:
            uint64_t v2 = @"FairPlayMissingSICData";
            break;
          case -7502:
            uint64_t v2 = @"FairPlayInvalidData";
            break;
          case -7501:
            uint64_t v2 = @"FairPlayContextCreationFailed";
            break;
          case -7500:
            uint64_t v2 = @"FairPlayHardwareInfoInvalid";
            break;
          default:
            if (a1 != -7600) {
              goto LABEL_206;
            }
            uint64_t v2 = @"MusicSubscriptionCannotInitiateLease";
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case -7700:
            uint64_t v2 = @"DatabaseCouldNotOpen";
            break;
          case -7602:
            uint64_t v2 = @"MusicSubscriptionCapabilityMissing";
            break;
          case -7601:
            uint64_t v2 = @"MusicSubscriptionCarrierBundlingHeaderEnrichmentFailed";
            break;
          default:
            goto LABEL_206;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case -7807:
          uint64_t v2 = @"DelegationServiceSecuritySettingsLoadingFailure";
          break;
        case -7806:
          uint64_t v2 = @"DelegationServiceDataEncryptionFailure";
          break;
        case -7805:
          uint64_t v2 = @"DelegationServiceDataDecryptionFailure";
          break;
        case -7804:
          uint64_t v2 = @"DelegationServiceInvalidMessage";
          break;
        case -7803:
          uint64_t v2 = @"DelegationServiceStreamClosed";
          break;
        case -7802:
          uint64_t v2 = @"DelegationServiceStreamPreparationFailure";
          break;
        case -7801:
          uint64_t v2 = @"DelegationServiceStreamResolutionFailure";
          break;
        default:
          if (a1 != -7701) {
            goto LABEL_206;
          }
          uint64_t v2 = @"DatabaseReadOnly";
          break;
      }
    }
  }
  else if (a1 > -7014)
  {
    switch(a1)
    {
      case -7013:
        uint64_t v2 = @"PermissionDenied";
        break;
      case -7012:
        uint64_t v2 = @"NotEnoughMemory";
        break;
      case -7011:
        uint64_t v2 = @"DaemonConnectionMessageSendingFailed";
        break;
      case -7010:
        uint64_t v2 = @"DaemonConnectionEstablishmentFailed";
        break;
      case -7009:
        uint64_t v2 = @"OperationNotAllowed";
        break;
      case -7008:
        uint64_t v2 = @"ItemNotFound";
        break;
      case -7007:
        uint64_t v2 = @"PrivacyAcknowledgementRequired";
        break;
      case -7006:
        uint64_t v2 = @"FirstUnlockRequired";
        break;
      case -7005:
        uint64_t v2 = @"SerializationFailed";
        break;
      case -7004:
        uint64_t v2 = @"Cancelled";
        break;
      case -7003:
        uint64_t v2 = @"Timeout";
        break;
      case -7002:
        uint64_t v2 = @"NotSupported";
        break;
      default:
        if (a1)
        {
          if (a1 != 6001) {
            goto LABEL_206;
          }
          uint64_t v2 = @"MusicMultiUserSharedIdNotFound";
        }
        else
        {
          uint64_t v2 = @"Unknown";
        }
        break;
    }
  }
  else
  {
    if (a1 <= -7203)
    {
      switch(a1)
      {
        case -7407:
          uint64_t v2 = @"AccountAccessFailed";
          break;
        case -7406:
          uint64_t v2 = @"ITunesAccountSigninRequired";
          break;
        case -7405:
          uint64_t v2 = @"SiriServiceFailed";
          break;
        case -7404:
          uint64_t v2 = @"SiriServiceUnavailable";
          break;
        case -7403:
          uint64_t v2 = @"AuthenticationFailed";
          break;
        case -7402:
          uint64_t v2 = @"AuthenticationNotAllowed";
          break;
        case -7401:
          uint64_t v2 = @"AccountNotFound";
          break;
        case -7400:
          uint64_t v2 = @"InvalidUserIdentity";
          break;
        default:
          if (a1 != -7300) {
            goto LABEL_206;
          }
          uint64_t v2 = @"MissingCertificateData";
          break;
      }
      return v2;
    }
    if (a1 > -7105)
    {
      switch(a1)
      {
        case -7104:
          uint64_t v2 = @"ResourceUnavailable";
          break;
        case -7103:
          uint64_t v2 = @"RetryRequired";
          break;
        case -7102:
          uint64_t v2 = @"InvalidResponse";
          break;
        case -7101:
          uint64_t v2 = @"InvalidRequest";
          break;
        case -7100:
          uint64_t v2 = @"ConnectionFailed";
          break;
        default:
          goto LABEL_206;
      }
      return v2;
    }
    switch(a1)
    {
      case -7202:
        uint64_t v2 = @"BagInvalidValueType";
        break;
      case -7201:
        uint64_t v2 = @"BagMissingKey";
        break;
      case -7200:
        uint64_t v2 = @"BagLoadingFailure";
        return v2;
      default:
LABEL_206:
        objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v2;
    }
  }
  return v2;
}

__CFString *NSStringFromICStoreServerErrorCode(uint64_t a1)
{
  if (a1 <= 3058)
  {
    if (a1 <= 2039)
    {
      if (a1 <= 1002)
      {
        if (a1 == -128)
        {
          uint64_t v2 = @"StorefrontMismatch";
        }
        else if (a1)
        {
          if (a1 != 1001) {
            goto LABEL_74;
          }
          uint64_t v2 = @"AccountMissing";
        }
        else
        {
          uint64_t v2 = @"Unknown";
        }
      }
      else if (a1 > 2001)
      {
        if (a1 == 2002)
        {
          uint64_t v2 = @"BadToken";
        }
        else
        {
          if (a1 != 2034) {
            goto LABEL_74;
          }
          uint64_t v2 = @"ExpiredToken";
        }
      }
      else if (a1 == 1003)
      {
        uint64_t v2 = @"SecureTokenMissing";
      }
      else
      {
        if (a1 != 1004) {
          goto LABEL_74;
        }
        uint64_t v2 = @"WeakTokenMissing";
      }
    }
    else if (a1 > 2070)
    {
      if (a1 > 3046)
      {
        if (a1 == 3047)
        {
          uint64_t v2 = @"RedownloadSlotLimit";
        }
        else
        {
          if (a1 != 3049) {
            goto LABEL_74;
          }
          uint64_t v2 = @"StreamingSlotTransferWarning";
        }
      }
      else if (a1 == 2071)
      {
        uint64_t v2 = @"ASNBadPasswordToken";
      }
      else
      {
        if (a1 != 2072) {
          goto LABEL_74;
        }
        uint64_t v2 = @"ASNExpiredPasswordToken";
      }
    }
    else if (a1 > 2046)
    {
      if (a1 == 2047)
      {
        uint64_t v2 = @"RedownloadNotOwned";
      }
      else
      {
        if (a1 != 2070) {
          goto LABEL_74;
        }
        uint64_t v2 = @"ASNTokenMissing";
      }
    }
    else if (a1 == 2040)
    {
      uint64_t v2 = @"ItemNotFound";
    }
    else
    {
      if (a1 != 2046) {
        goto LABEL_74;
      }
      uint64_t v2 = @"InvalidWeakTokenForMatchStatus";
    }
  }
  else if (a1 <= 3700)
  {
    switch(a1)
    {
      case 3059:
        uint64_t v2 = @"StreamingSlotLimit";
        break;
      case 3060:
        uint64_t v2 = @"StreamingSlotTaken";
        break;
      case 3061:
      case 3065:
      case 3066:
      case 3067:
      case 3068:
      case 3069:
      case 3070:
      case 3071:
      case 3072:
      case 3074:
      case 3075:
      case 3080:
      case 3081:
      case 3082:
      case 3083:
        goto LABEL_74;
      case 3062:
        uint64_t v2 = @"FuseLeaseProbableAbuse";
        break;
      case 3063:
        uint64_t v2 = @"FuseNoActiveSubscription";
        break;
      case 3064:
        uint64_t v2 = @"StoragePurchaseOnNonStorageCapableAccount";
        break;
      case 3073:
        uint64_t v2 = @"PurchaseBlockedForSpecialEdu";
        break;
      case 3076:
        uint64_t v2 = @"ItemNotAvailableForFuse";
        break;
      case 3077:
        uint64_t v2 = @"ItemNotFoundForFuse";
        break;
      case 3078:
        uint64_t v2 = @"SlotTransferWarningFuseBuy";
        break;
      case 3079:
        uint64_t v2 = @"SecondaryAuthRequired";
        break;
      case 3084:
        uint64_t v2 = @"StreamingSlotTakenWithFamilyUpsell";
        break;
      default:
        if (a1 != 3604) {
          goto LABEL_74;
        }
        uint64_t v2 = @"ContentRestoreNotAvailable";
        break;
    }
  }
  else
  {
    if (a1 > 3771)
    {
      switch(a1)
      {
        case 510000:
          uint64_t v2 = @"SuzeLeaseNoSlotsAvailable";
          break;
        case 510001:
          uint64_t v2 = @"SuzeLeaseMissingDSID";
          break;
        case 510002:
          uint64_t v2 = @"SuzeLeaseMissingGUID";
          break;
        case 510003:
          uint64_t v2 = @"SuzeLeaseMissingMediaKind";
          break;
        case 510004:
          uint64_t v2 = @"SuzeLeaseMissingClientData";
          break;
        case 510005:
          uint64_t v2 = @"SuzeLeaseInvalidAuthenticationToken";
          break;
        case 510006:
          uint64_t v2 = @"SuzeLeaseMissingLeaseID";
          break;
        case 510007:
          uint64_t v2 = @"SuzeLeaseExceptionThrown";
          break;
        case 510008:
          uint64_t v2 = @"SuzeLeaseServerCacheMissingLeaseKey";
          break;
        default:
          if (a1 != 3772) {
            goto LABEL_74;
          }
          uint64_t v2 = @"LinkAccountToPerformAgeVerification";
          break;
      }
      return v2;
    }
    switch(a1)
    {
      case 3701:
        uint64_t v2 = @"PodcastEpisodeNotFound";
        break;
      case 3770:
        uint64_t v2 = @"AgeVerificationRequiredForExplicitContent";
        break;
      case 3771:
        uint64_t v2 = @"UpgradeToPerformAgeVerification";
        return v2;
      default:
LABEL_74:
        objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v2;
    }
  }
  return v2;
}

__CFString *NSStringFromICMusicSubscriptionCarrierBundlingServerErrorCode(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 2001)
    {
      uint64_t v2 = @"PhoneNumberPortingException";
    }
    else if (a1 == 1001)
    {
      uint64_t v2 = @"StorefrontMismatch";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"Unknown";
  }
  return v2;
}

__CFString *NSStringFromICRadioServerErrorCode(uint64_t a1)
{
  switch(a1)
  {
    case 101:
      uint64_t v2 = @"UserOptedOut";
      break;
    case 102:
      uint64_t v2 = @"UserNotOptedIn";
      break;
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 126:
    case 127:
    case 128:
    case 129:
      goto LABEL_9;
    case 120:
      uint64_t v2 = @"NoStationMatch";
      break;
    case 121:
      uint64_t v2 = @"FallbackStationFound";
      break;
    case 122:
      uint64_t v2 = @"PlayHistoryClearFailed";
      break;
    case 123:
      uint64_t v2 = @"UserIsFreeloader";
      break;
    case 124:
      uint64_t v2 = @"UnableToReturnTracks";
      break;
    case 125:
      uint64_t v2 = @"NoAvailableVersion";
      break;
    case 130:
      uint64_t v2 = @"SharedStationWasDeleted";
      break;
    case 131:
      uint64_t v2 = @"SharedStationNotAvailableForStorefront";
      break;
    case 132:
      uint64_t v2 = @"StationNotShared";
      break;
    case 133:
      uint64_t v2 = @"StationSubscriptionFailure";
      break;
    case 134:
      uint64_t v2 = @"TermsAndConditionsNotAccepted";
      break;
    case 135:
      uint64_t v2 = @"HeartbeatInvalid";
      break;
    case 136:
      uint64_t v2 = @"InvalidStation";
      break;
    case 137:
      uint64_t v2 = @"StreamingSlotLimitReached";
      break;
    case 138:
      uint64_t v2 = @"SKDKeyCreationFailure";
      break;
    case 139:
      uint64_t v2 = @"SubscriptionLeaseError";
      break;
    case 140:
      uint64_t v2 = @"SubscriptionRequired";
      break;
    case 141:
      uint64_t v2 = @"RestrictedLocation";
      break;
    default:
      if (a1)
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v2 = @"Unknown";
      }
      break;
  }
  return v2;
}

__CFString *NSStringFromICKeyServerErrorCode(uint64_t a1)
{
  switch(a1)
  {
    case -1021:
      uint64_t v2 = @"DRMError";
      break;
    case -1020:
      uint64_t v2 = @"BadRequest";
      break;
    case -1019:
      uint64_t v2 = @"RefreshNotAllowed";
      break;
    case -1018:
      uint64_t v2 = @"InvalidCheckIn";
      break;
    case -1017:
      uint64_t v2 = @"NotAvailableInDeviceLocation";
      break;
    case -1016:
      uint64_t v2 = @"ContentPerSubscription";
      break;
    case -1015:
      uint64_t v2 = @"DevicesPerContentPerSubscription";
      break;
    case -1014:
      uint64_t v2 = @"DevicesPerSubscription";
      break;
    case -1013:
      uint64_t v2 = @"NotDownloadable";
      break;
    case -1012:
      uint64_t v2 = @"DeviceNotSupported";
      break;
    case -1011:
      uint64_t v2 = @"AnisetteProvisioningRequired";
      break;
    case -1010:
      uint64_t v2 = @"LoginRequired";
      break;
    case -1009:
      uint64_t v2 = @"RentalExpired";
      break;
    case -1008:
      uint64_t v2 = @"RentalCheckoutNotElegible";
      break;
    case -1007:
      uint64_t v2 = @"RentalNotCheckedOut";
      break;
    case -1006:
      uint64_t v2 = @"RentalKeyNotFound";
      break;
    case -1005:
      uint64_t v2 = @"UnknownLeaseAction";
      break;
    case -1004:
      uint64_t v2 = @"NoOfflineSlot";
      break;
    case -1003:
      uint64_t v2 = @"ExceptionThrown";
      break;
    case -1002:
      uint64_t v2 = @"NotEntitled";
      break;
    case -1001:
      uint64_t v2 = @"KeyNotFound";
      break;
    default:
      if (a1)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v2 = @"Unknown";
      }
      break;
  }
  return v2;
}

__CFString *NSStringFromICMediaUserStateErrorCode(uint64_t a1)
{
  switch(a1)
  {
    case 9001:
      uint64_t v2 = @"FailedToCreateSynchronousServer";
      break;
    case 9002:
      uint64_t v2 = @"FailedToCreateAsynchronousServer";
      break;
    case 9003:
      uint64_t v2 = @"FailedToForceRefreshUserState";
      break;
    case 9004:
      uint64_t v2 = @"ConnectionInterrupted";
      break;
    default:
      if (a1)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v2 = @"Unknown";
      }
      break;
  }
  return v2;
}

__CFString *NSStringFromICFairPlayErrorCode(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"Unknown";
  }
  return v2;
}

__CFString *NSStringFromICSQLiteErrorCode(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"Unknown";
  }
  return v2;
}

__CFString *NSStringFromICMusicKitServerErrorCode(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"Unknown";
  }
  return v2;
}

uint64_t ICPAAudioQualityDictionaryReadFrom(uint64_t a1, uint64_t a2)
{
  int v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    size_t v7 = (int *)MEMORY[0x1E4F940B8];
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
          *(unsigned char *)(a1 + 48) |= 2u;
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
              goto LABEL_58;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_60;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_60:
          uint64_t v48 = 16;
          goto LABEL_73;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
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
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_64:
          uint64_t v48 = 8;
          goto LABEL_73;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v29;

          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + 48) |= 8u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v33) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v33) = 0;
          }
LABEL_68:
          *(_DWORD *)(a1 + 40) = v33;
          continue;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          while (2)
          {
            uint64_t v39 = *v3;
            unint64_t v40 = *(void *)(a2 + v39);
            if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
              *(void *)(a2 + v39) = v40 + 1;
              v19 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                BOOL v14 = v38++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_72:
          uint64_t v48 = 24;
LABEL_73:
          *(void *)(a1 + v48) = v19;
          continue;
        case 6u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          *(unsigned char *)(a1 + 48) |= 0x10u;
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
        uint64_t v45 = *v3;
        unint64_t v46 = *(void *)(a2 + v45);
        if (v46 == -1 || v46 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
        *(void *)(a2 + v45) = v46 + 1;
        v44 |= (unint64_t)(v47 & 0x7F) << v42;
        if ((v47 & 0x80) == 0) {
          goto LABEL_75;
        }
        v42 += 7;
        BOOL v14 = v43++ >= 9;
        if (v14)
        {
          uint64_t v44 = 0;
          goto LABEL_77;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_75:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v44 = 0;
      }
LABEL_77:
      *(unsigned char *)(a1 + 44) = v44 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A2E98764(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2541(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2542(uint64_t a1)
{
}

void sub_1A2E9C180(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A2EA1F48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A2EA283C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1A2EA76F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getHMHomeManagerStatusToStringSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMHomeManagerStatusToString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMHomeManagerStatusToStringSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *HomeKitLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __HomeKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5AC7408;
    uint64_t v6 = 0;
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  int v0 = (void *)HomeKitLibraryCore_frameworkLibrary;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    int v0 = [MEMORY[0x1E4F28B00] currentHandler];
    int v3 = [NSString stringWithUTF8String:"void *HomeKitLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICHomeManager.m", 21, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HomeKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A2EA7DEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void __getHMHomeManagerClass_block_invoke(uint64_t a1)
{
  HomeKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HMHomeManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHMHomeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    int v3 = [NSString stringWithUTF8String:"Class getHMHomeManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICHomeManager.m", 22, @"Unable to find class %s", "HMHomeManager");

    __break(1u);
  }
}

uint64_t _ICRemoteRequestOperationResponseIsAllowedForClassName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (_ICRemoteRequestOperationResponseIsAllowedForClassName_sAllowableRemoteRequestOperationResponseClassNamesOnceToken != -1)
  {
    dispatch_once(&_ICRemoteRequestOperationResponseIsAllowedForClassName_sAllowableRemoteRequestOperationResponseClassNamesOnceToken, &__block_literal_global_3130);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = [(id)_ICRemoteRequestOperationResponseIsAllowedForClassName_sAllowableRemoteRequestOperationResponseClassNames containsObject:v2];
LABEL_6:

  return v3;
}

uint64_t _ICLLActionMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
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
    unint64_t v17 = v10 >> 3;
    switch((v10 >> 3))
    {
      case 0u:
        unsigned int v18 = 0;
        do
        {
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 == -1 || v20 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_80;
          }
          unint64_t v21 = v20 + 1;
          int v22 = *(char *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v21;
          if ((v22 & 0x80000000) == 0) {
            break;
          }
        }
        while (v18++ <= 8);
        goto LABEL_80;
      case 1u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 148) |= 1u;
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
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                uint64_t v28 = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_93:
        *(void *)(a1 + 8) = v28;
        goto LABEL_80;
      case 2u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 1;
        char v24 = objc_alloc_init(_ICLLPlaybackSyncAction);
        objc_storeStrong((id *)(a1 + 96), v24);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackSyncActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 3u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 2;
        char v24 = objc_alloc_init(_ICLLAddQueueItemsAction);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || (_ICLLAddQueueItemsActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 4u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 3;
        char v24 = objc_alloc_init(_ICLLRemoveQueueItemAction);
        objc_storeStrong((id *)(a1 + 120), v24);
        if (!PBReaderPlaceMark() || (_ICLLRemoveQueueItemActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 5u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 4;
        char v24 = objc_alloc_init(_ICLLMoveQueueItemAction);
        objc_storeStrong((id *)(a1 + 64), v24);
        if (!PBReaderPlaceMark() || (_ICLLMoveQueueItemActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 6u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 5;
        char v24 = objc_alloc_init(_ICLLCurrentItemChangeAction);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark() || (_ICLLCurrentItemChangeActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 7u:
      case 0xDu:
        goto LABEL_31;
      case 8u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 6;
        char v24 = objc_alloc_init(_ICLLReactionAction);
        objc_storeStrong((id *)(a1 + 112), v24);
        if (!PBReaderPlaceMark() || !_ICLLReactionActionReadFrom((uint64_t)v24, a2)) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 9u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 7;
        char v24 = objc_alloc_init(_ICLLParticipantChangeAction);
        objc_storeStrong((id *)(a1 + 80), v24);
        if (!PBReaderPlaceMark() || (_ICLLParticipantChangeActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 0xAu:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 8;
        char v24 = objc_alloc_init(_ICLLServerNoticeAction);
        objc_storeStrong((id *)(a1 + 136), v24);
        if (!PBReaderPlaceMark() || (_ICLLServerNoticeActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 0xBu:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 9;
        char v24 = objc_alloc_init(_ICLLClientInfoAction);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || (_ICLLClientInfoActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 0xCu:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 10;
        char v24 = objc_alloc_init(_ICLLReplaceQueueItemsAction);
        objc_storeStrong((id *)(a1 + 128), v24);
        if (!PBReaderPlaceMark() || (_ICLLReplaceQueueItemsActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 0xEu:
        uint64_t v32 = PBReaderReadString();
        uint64_t v33 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v32;

        goto LABEL_80;
      case 0xFu:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 11;
        char v24 = objc_alloc_init(_ICLLPlayNowQueueItemsAction);
        objc_storeStrong((id *)(a1 + 88), v24);
        if (!PBReaderPlaceMark() || (_ICLLPlayNowQueueItemsActionReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 0x10u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 12;
        char v24 = objc_alloc_init(_ICLLCurrentItemTransitionAction);
        objc_storeStrong((id *)(a1 + 48), v24);
        if (!PBReaderPlaceMark() || !_ICLLCurrentItemTransitionActionReadFrom((uint64_t)v24, a2)) {
          goto LABEL_99;
        }
        goto LABEL_79;
      case 0x11u:
        -[_ICLLActionMessage clearOneofValuesForAction](a1);
        *(unsigned char *)(a1 + 148) |= 2u;
        *(_DWORD *)(a1 + 16) = 13;
        char v24 = objc_alloc_init(_ICLLQueueSyncAction);
        objc_storeStrong((id *)(a1 + 104), v24);
        if PBReaderPlaceMark() && (_ICLLQueueSyncActionReadFrom((uint64_t)v24, a2)) {
          goto LABEL_79;
        }
        goto LABEL_99;
      default:
        if (v17 == 50)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 148) |= 4u;
          while (1)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if ((v39 & 0x80) == 0) {
              goto LABEL_95;
            }
            v34 += 7;
            BOOL v14 = v35++ >= 9;
            if (v14)
            {
              uint64_t v36 = 0;
              goto LABEL_97;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_95:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v36 = 0;
          }
LABEL_97:
          *(unsigned char *)(a1 + 144) = v36 != 0;
          goto LABEL_80;
        }
        if (v17 != 51)
        {
LABEL_31:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_80;
        }
        char v24 = objc_alloc_init(_ICLLDisplayMessage);
        objc_storeStrong((id *)(a1 + 56), v24);
        if (PBReaderPlaceMark() && _ICLLDisplayMessageReadFrom((uint64_t)v24, a2))
        {
LABEL_79:
          PBReaderRecallMark();

LABEL_80:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_99:

        return 0;
    }
  }
}

uint64_t _ICLLReplaceQueueItemsCommandReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
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
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_52;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_52;
      case 1u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                LODWORD(v26) = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_51:
        *(_DWORD *)(a1 + 48) = v26;
        goto LABEL_52;
      case 2u:
        unint64_t v30 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLReplaceQueueItemsCommand addItems:](a1, v30);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemReadFrom((uint64_t)v30, a2) & 1) == 0) {
          goto LABEL_54;
        }
        goto LABEL_46;
      case 3u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 24;
        goto LABEL_40;
      case 4u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = 32;
LABEL_40:
        uint64_t v33 = *(void **)(a1 + v32);
        *(void *)(a1 + v32) = v31;

        goto LABEL_52;
      case 5u:
        -[_ICLLReplaceQueueItemsCommand clearOneofValuesForTrackGenerationSource](a1);
        *(unsigned char *)(a1 + 56) |= 2u;
        *(_DWORD *)(a1 + 52) = 1;
        unint64_t v30 = objc_alloc_init(_ICLLAutoPlaySource);
        objc_storeStrong((id *)(a1 + 8), v30);
        if (!PBReaderPlaceMark() || !ICPBDGSFinishDelegationResponseReadFrom(a2)) {
          goto LABEL_54;
        }
        goto LABEL_46;
      case 6u:
        -[_ICLLReplaceQueueItemsCommand clearOneofValuesForTrackGenerationSource](a1);
        *(unsigned char *)(a1 + 56) |= 2u;
        *(_DWORD *)(a1 + 52) = 2;
        unint64_t v30 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 40), v30);
        if (PBReaderPlaceMark() && _ICLLRadioSourceReadFrom((uint64_t)v30, a2))
        {
LABEL_46:
          PBReaderRecallMark();

LABEL_52:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_54:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_52;
    }
  }
}

void sub_1A2EAC5F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3453(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3454(uint64_t a1)
{
}

void sub_1A2EAD74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3520(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3521(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__3856(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3857(uint64_t a1)
{
}

uint64_t _ICLLAddQueueItemsCommandReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
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
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 52) |= 4u;
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
            goto LABEL_50;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_52;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_52:
        uint64_t v37 = 48;
        goto LABEL_61;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 52) |= 2u;
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
                LODWORD(v19) = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_56:
        uint64_t v37 = 24;
        goto LABEL_61;
      case 3u:
        char v29 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLAddQueueItemsCommand addItems:](a1, v29);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemReadFrom((uint64_t)v29, a2) & 1) == 0) {
          goto LABEL_64;
        }
        goto LABEL_48;
      case 4u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
        while (2)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_60:
        uint64_t v37 = 8;
LABEL_61:
        *(_DWORD *)(a1 + v37) = v19;
        goto LABEL_62;
      case 5u:
        uint64_t v35 = PBReaderReadString();
        uint64_t v36 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v35;

        goto LABEL_62;
      case 6u:
        char v29 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 40), v29);
        if (PBReaderPlaceMark() && _ICLLRadioSourceReadFrom((uint64_t)v29, a2))
        {
LABEL_48:
          PBReaderRecallMark();

LABEL_62:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_64:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_62;
    }
  }
}

uint64_t _ICLLRadioSeedReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
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

uint64_t _ServerSagaUpdateInProgressDidChangeNotification(uint64_t a1, void *a2)
{
  return [a2 _serverSagaUpdateInProgressDidChange];
}

uint64_t _ServerDidCompleteSetup(uint64_t a1, void *a2)
{
  return [a2 _serverSetupDidComplete];
}

id getML3MusicLibraryClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)getML3MusicLibraryClass_softClass;
  uint64_t v7 = getML3MusicLibraryClass_softClass;
  if (!getML3MusicLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getML3MusicLibraryClass_block_invoke;
    v3[3] = &unk_1E5ACD4F0;
    v3[4] = &v4;
    __getML3MusicLibraryClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A2EB5764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getML3MusicLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MusicLibraryLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MusicLibraryLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5AC7730;
    uint64_t v8 = 0;
    MusicLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MusicLibraryLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *MusicLibraryLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"ICCloudClient.m", 31, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("ML3MusicLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"Class getML3MusicLibraryClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICCloudClient.m", 32, @"Unable to find class %s", "ML3MusicLibrary");

LABEL_10:
    __break(1u);
  }
  getML3MusicLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MusicLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MusicLibraryLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A2EBEA28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4222(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4223(uint64_t a1)
{
}

uint64_t ICCloudClientIsSagaEnabledInURLBag(void *a1, const char *a2)
{
  return [a1 BOOLValueForBagKey:@"isMatchServiceEnabled"];
}

id ICCloudClientCreateArtworkInfoDictionary(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  long long v7 = a1;
  uint64_t v8 = @"dmap.dictionary";
  uint64_t v6 = @"full-url";
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9E8];
  id v2 = a1;
  uint64_t v3 = [v1 dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

intptr_t __ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (a2 | a3) != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = objc_msgSend(a2, "ic_automaticDownloadKinds");
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  uint64_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

__CFString *ICCloudClientGetStringForAddToPlaylistBehavior(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E5AC7748[a1];
  }
}

__CFString *ICCloudClientGetStringForAddToLibraryBehavior(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E5AC7760[a1];
  }
}

uint64_t __Block_byref_object_copy__4367(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6240BF0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__4368(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__4401(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4402(uint64_t a1)
{
}

void sub_1A2ECC480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5287(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5288(uint64_t a1)
{
}

void sub_1A2ECCD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5445(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5446(uint64_t a1)
{
}

void sub_1A2ECD6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5542(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5543(uint64_t a1)
{
}

uint64_t _ICLLPlayNowQueueItemsActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
        *(unsigned char *)(a1 + 52) |= 2u;
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
            goto LABEL_46;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_48;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_48:
        uint64_t v32 = 48;
        goto LABEL_53;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
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
                LODWORD(v19) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_52:
        uint64_t v32 = 16;
LABEL_53:
        *(_DWORD *)(a1 + v32) = v19;
        goto LABEL_54;
      case 3u:
        char v29 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLPlayNowQueueItemsAction addItems:](a1, v29);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemReadFrom((uint64_t)v29, a2) & 1) == 0) {
          goto LABEL_56;
        }
        goto LABEL_44;
      case 4u:
        uint64_t v30 = PBReaderReadString();
        unsigned int v31 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v30;

        goto LABEL_54;
      case 5u:
        char v29 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 32), v29);
        if (!PBReaderPlaceMark() || (_ICLLQueueQueryReadFrom((uint64_t)v29, a2) & 1) == 0) {
          goto LABEL_56;
        }
        goto LABEL_44;
      case 6u:
        char v29 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 40), v29);
        if (PBReaderPlaceMark() && _ICLLRadioSourceReadFrom((uint64_t)v29, a2))
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_54:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_56:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_54;
    }
  }
}

uint64_t _ICLLRemoveQueueItemActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
        *(unsigned char *)(a1 + 44) |= 2u;
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
            goto LABEL_43;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_45:
        uint64_t v32 = 40;
        goto LABEL_50;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        unsigned int v25 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v24;

        goto LABEL_51;
      case 3u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
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
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_49:
        uint64_t v32 = 24;
LABEL_50:
        *(_DWORD *)(a1 + v32) = v19;
        goto LABEL_51;
      case 4u:
        PBReaderReadString();
        unsigned int v31 = (_ICLLQueueQuery *)objc_claimAutoreleasedReturnValue();
        if (v31) {
          -[_ICLLRemoveQueueItemAction addRemovedItemIds:](a1, v31);
        }
        goto LABEL_41;
      case 5u:
        unsigned int v31 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 16), v31);
        if PBReaderPlaceMark() && (_ICLLQueueQueryReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();
LABEL_41:

LABEL_51:
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
        goto LABEL_51;
    }
  }
}

void sub_1A2ED4F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6279(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6280(uint64_t a1)
{
}

void sub_1A2ED64A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICPBDGSPlayerDelegateInfoTokenReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 32;
          goto LABEL_33;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          break;
        case 3u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v30 = 0;
          }
          *(void *)(a1 + 8) = v30;
          continue;
        case 4u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
LABEL_33:
          unsigned int v31 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

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
        uint64_t v24 = *v3;
        uint64_t v25 = *(void *)(a2 + v24);
        unint64_t v26 = v25 + 1;
        if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v26;
        v23 |= (unint64_t)(v27 & 0x7F) << v21;
        if ((v27 & 0x80) == 0) {
          goto LABEL_35;
        }
        v21 += 7;
        BOOL v15 = v22++ >= 9;
        if (v15)
        {
          uint64_t v23 = 0;
          goto LABEL_37;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_37:
      *(void *)(a1 + 16) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _ICLLReplaceQueueItemsActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_53;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_53;
      case 1u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                LODWORD(v26) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_52:
        *(_DWORD *)(a1 + 48) = v26;
        goto LABEL_53;
      case 2u:
        uint64_t v30 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLReplaceQueueItemsAction addItems:](a1, v30);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemReadFrom((uint64_t)v30, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_47;
      case 3u:
        uint64_t v31 = PBReaderReadString();
        uint64_t v32 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v31;

        goto LABEL_53;
      case 4u:
        uint64_t v30 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 32), v30);
        if (!PBReaderPlaceMark() || (_ICLLQueueQueryReadFrom((uint64_t)v30, a2) & 1) == 0) {
          goto LABEL_55;
        }
        goto LABEL_47;
      case 5u:
        -[_ICLLReplaceQueueItemsAction clearOneofValuesForTrackGenerationSource](a1);
        *(unsigned char *)(a1 + 56) |= 2u;
        *(_DWORD *)(a1 + 52) = 1;
        uint64_t v30 = objc_alloc_init(_ICLLAutoPlaySource);
        objc_storeStrong((id *)(a1 + 8), v30);
        if (!PBReaderPlaceMark() || !ICPBDGSFinishDelegationResponseReadFrom(a2)) {
          goto LABEL_55;
        }
        goto LABEL_47;
      case 6u:
        -[_ICLLReplaceQueueItemsAction clearOneofValuesForTrackGenerationSource](a1);
        *(unsigned char *)(a1 + 56) |= 2u;
        *(_DWORD *)(a1 + 52) = 2;
        uint64_t v30 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 40), v30);
        if (PBReaderPlaceMark() && _ICLLRadioSourceReadFrom((uint64_t)v30, a2))
        {
LABEL_47:
          PBReaderRecallMark();

LABEL_53:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_55:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_53;
    }
  }
}

void sub_1A2ED87D0(void *a1)
{
}

void sub_1A2ED87DC(_Unwind_Exception *a1)
{
}

void sub_1A2ED89CC(_Unwind_Exception *a1)
{
}

ICSQLiteConnectionOptions *__SQLiteOptionsWithAccountStoreOptions(void *a1)
{
  id v1 = a1;
  id v2 = [ICSQLiteConnectionOptions alloc];
  uint64_t v3 = [v1 databasePath];

  uint64_t v4 = [(ICSQLiteConnectionOptions *)v2 initWithDatabasePath:v3];

  return v4;
}

BOOL __SetupSingleWriterWithConnection(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  unint64_t v19 = __Block_byref_object_copy__6716;
  unint64_t v20 = __Block_byref_object_dispose__6717;
  id v21 = 0;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = ____SetupSingleWriterWithConnection_block_invoke;
  v8[3] = &unk_1E5AC7C40;
  id v4 = v3;
  id v9 = v4;
  unint64_t v10 = &v16;
  uint64_t v11 = &v12;
  [v4 performTransaction:v8];
  int v5 = *((unsigned __int8 *)v13 + 24);
  if (a2 && !*((unsigned char *)v13 + 24))
  {
    *a2 = (id) v17[5];
    int v5 = *((unsigned __int8 *)v13 + 24);
  }
  BOOL v6 = v5 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void sub_1A2ED8F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6716(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6717(uint64_t a1)
{
}

void sub_1A2ED936C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A2EDA544()
{
}

void sub_1A2EDA588()
{
}

void sub_1A2EDA594()
{
  if (v0) {
    JUMPOUT(0x1A2EDA59CLL);
  }
  JUMPOUT(0x1A2EDA5A0);
}

uint64_t ICDelegateAccountStoreRaiseInvalidUserIdentityException(uint64_t a1)
{
  return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Non-concrete user identity: %@", a1 format];
}

uint64_t ICDelegateAccountStoreRaiseOutOfScopeException(uint64_t a1)
{
  return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Out-of-scope transaction usage: %@", a1 format];
}

uint64_t __Block_byref_object_copy__6825(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6826(uint64_t a1)
{
}

void sub_1A2EDB1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2EDB8EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL _ICLLClientInfoCommandReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        unint64_t v19 = *(void **)(a1 + v18);
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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  NanoRegistryLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("NRPairedDeviceRegistry");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getNRPairedDeviceRegistryClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICNanoPairedDeviceStatusMonitor.m", 32, @"Unable to find class %s", "NRPairedDeviceRegistry");

    __break(1u);
  }
}

void *NanoRegistryLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __NanoRegistryLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5AC7E08;
    uint64_t v6 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  int v0 = (void *)NanoRegistryLibraryCore_frameworkLibrary;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    int v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *NanoRegistryLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICNanoPairedDeviceStatusMonitor.m", 31, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__7327(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7328(uint64_t a1)
{
}

void sub_1A2EDECDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2EDF344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getNRDevicePropertyIsAltAccountSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyIsAltAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyIsAltAccountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertyCompanionMusicGUIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyCompanionMusicGUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getNRDevicePropertyUDID()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v0 = (void **)getNRDevicePropertyUDIDSymbolLoc_ptr;
  uint64_t v9 = getNRDevicePropertyUDIDSymbolLoc_ptr;
  if (!getNRDevicePropertyUDIDSymbolLoc_ptr)
  {
    uint64_t v1 = NanoRegistryLibrary();
    v7[3] = (uint64_t)dlsym(v1, "NRDevicePropertyUDID");
    getNRDevicePropertyUDIDSymbolLoc_ptr = v7[3];
    int v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyUDID(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICNanoPairedDeviceStatusMonitor.m", 35, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2EDF550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getNRDevicePropertyUDIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyUDID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyUDIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A2EDF7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2EDFAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRPairedDeviceRegistryDeviceDidBecomeActive");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRPairedDeviceRegistryDeviceDidBecomeActiveSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void sub_1A2EE0658(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void *__getNRDevicePropertyPairingIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertyPairingID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyPairingIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPSYInitialSyncStateObserverClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!PairedSyncLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __PairedSyncLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5AC7E20;
    uint64_t v8 = 0;
    PairedSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PairedSyncLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *PairedSyncLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"ICNanoPairedDeviceStatusMonitor.m", 22, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("PSYInitialSyncStateObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v5 = [NSString stringWithUTF8String:"Class getPSYInitialSyncStateObserverClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICNanoPairedDeviceStatusMonitor.m", 23, @"Unable to find class %s", "PSYInitialSyncStateObserver");

LABEL_10:
    __break(1u);
  }
  getPSYInitialSyncStateObserverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HandleDeviceDidUnPairNotification(uint64_t a1, void *a2)
{
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Got device did unpair notification", v5, 2u);
  }

  return [a2 _handlePairedDeviceChangedNotification];
}

uint64_t HandleDeviceDidPairNotification(uint64_t a1, void *a2)
{
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Got device did pair notification", v5, 2u);
  }

  return [a2 _handlePairedDeviceChangedNotification];
}

uint64_t __PairedSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PairedSyncLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A2EE105C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

void sub_1A2EE39F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

void sub_1A2EE5020(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v2 + 32) + 56));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1A2EE5580(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v2 + 32) + 56));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1A2EE6018(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v2 + 32) + 56));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1A2EE6430(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v2 + 32) + 56));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ICIAMSerialCheckRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
        char v24 = *(void **)(a1 + 16);
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
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
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

uint64_t _ICDeveloperTokenProviderIsAllowedForClassName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (_ICDeveloperTokenProviderIsAllowedForClassName_sAllowableDeveloperTokenProviderClassNamesOnceToken != -1)
  {
    dispatch_once(&_ICDeveloperTokenProviderIsAllowedForClassName_sAllowableDeveloperTokenProviderClassNamesOnceToken, &__block_literal_global_8402);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = [(id)_ICDeveloperTokenProviderIsAllowedForClassName_sAllowableDeveloperTokenProviderClassNames containsObject:v2];
LABEL_6:

  return v3;
}

uint64_t _ICLLCommandMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_61;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_61;
      case 1u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 1;
        uint64_t v23 = objc_alloc_init(_ICLLPlaybackSyncCommand);
        objc_storeStrong((id *)(a1 + 72), v23);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackSyncCommandReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 2u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 2;
        uint64_t v23 = objc_alloc_init(_ICLLAddQueueItemsCommand);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || (_ICLLAddQueueItemsCommandReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 3u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 3;
        uint64_t v23 = objc_alloc_init(_ICLLRemoveQueueItemCommand);
        objc_storeStrong((id *)(a1 + 88), v23);
        if (!PBReaderPlaceMark() || (_ICLLRemoveQueueItemCommandReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 4u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 4;
        uint64_t v23 = objc_alloc_init(_ICLLMoveQueueItemCommand);
        objc_storeStrong((id *)(a1 + 48), v23);
        if (!PBReaderPlaceMark() || (_ICLLMoveQueueItemCommandReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 6u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 5;
        uint64_t v23 = objc_alloc_init(_ICLLCurrentItemChangeCommand);
        objc_storeStrong((id *)(a1 + 32), v23);
        if (!PBReaderPlaceMark() || (_ICLLCurrentItemChangeCommandReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 7u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 6;
        uint64_t v23 = objc_alloc_init(_ICLLPlaybackControlSettingsCommand);
        objc_storeStrong((id *)(a1 + 64), v23);
        if (!PBReaderPlaceMark()
          || (_ICLLPlaybackControlSettingsCommandReadFrom((uint64_t)v23, a2) & 1) == 0)
        {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 8u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 7;
        uint64_t v23 = objc_alloc_init(_ICLLReactionCommand);
        objc_storeStrong((id *)(a1 + 80), v23);
        if (!PBReaderPlaceMark() || !_ICLLReactionCommandReadFrom((uint64_t)v23, a2)) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 9u:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 8;
        uint64_t v23 = objc_alloc_init(_ICLLClientInfoCommand);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark() || !_ICLLClientInfoCommandReadFrom((uint64_t)v23, a2)) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 0xAu:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 9;
        uint64_t v23 = objc_alloc_init(_ICLLReplaceQueueItemsCommand);
        objc_storeStrong((id *)(a1 + 96), v23);
        if (!PBReaderPlaceMark() || (_ICLLReplaceQueueItemsCommandReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 0xCu:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 10;
        uint64_t v23 = objc_alloc_init(_ICLLPlayNowQueueItemsCommand);
        objc_storeStrong((id *)(a1 + 56), v23);
        if (!PBReaderPlaceMark() || (_ICLLPlayNowQueueItemsCommandReadFrom((uint64_t)v23, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_60;
      case 0xDu:
        -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
        *(unsigned char *)(a1 + 104) |= 1u;
        *(_DWORD *)(a1 + 24) = 11;
        uint64_t v23 = objc_alloc_init(_ICLLCurrentItemTransitionCommand);
        objc_storeStrong((id *)(a1 + 40), v23);
        if (PBReaderPlaceMark() && _ICLLCurrentItemTransitionCommandReadFrom((uint64_t)v23, a2))
        {
LABEL_60:
          PBReaderRecallMark();

LABEL_61:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_65:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_61;
    }
  }
}

BOOL _ICLLCurrentItemTransitionCommandReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        unint64_t v19 = *(void **)(a1 + v18);
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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *ICUserVerificationInteractionLevelDescription(unint64_t a1)
{
  if (a1 > 5) {
    return @"unknown";
  }
  else {
    return off_1E5AC7F48[a1];
  }
}

uint64_t _ICLLPlaybackControlSettingsQueryReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v17 = objc_alloc_init(_ICLLPlaybackControlSettings);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackControlSettingsReadFrom((uint64_t)v17, a2) & 1) == 0)
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

BOOL _ICLLReactionActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
LABEL_24:
        unint64_t v20 = *(void **)(a1 + v19);
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
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _ICLLPlaybackSyncStateQueryReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  long long v5 = (int *)MEMORY[0x1E4F940C8];
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
          unint64_t v17 = PBReaderReadString();
          if (v17) {
            -[_ICLLPlaybackSyncStateQuery addParticipantStates:](a1, v17);
          }
          goto LABEL_25;
        case 2u:
          unint64_t v17 = PBReaderReadString();
          if (v17) {
            -[_ICLLPlaybackSyncStateQuery addTransportControlStates:](a1, v17);
          }
LABEL_25:

          continue;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 8;
          goto LABEL_28;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 16;
LABEL_28:
          int v21 = *(void **)(a1 + v20);
          *(void *)(a1 + v20) = v19;

          continue;
        case 5u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
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
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 == -1 || v26 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v26 + 1;
        v24 |= (unint64_t)(v27 & 0x7F) << v22;
        if ((v27 & 0x80) == 0) {
          goto LABEL_37;
        }
        v22 += 7;
        BOOL v14 = v23++ >= 9;
        if (v14)
        {
          uint64_t v24 = 0;
          goto LABEL_39;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v24 = 0;
      }
LABEL_39:
      *(unsigned char *)(a1 + 40) = v24 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t __ICSecureCodingGetPropertyListClasses_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  uint64_t v7 = ICSecureCodingGetPropertyListClasses_sPropertyListTypes;
  ICSecureCodingGetPropertyListClasses_sPropertyListTypes = v6;

  return MEMORY[0x1F41817F8](v6, v7);
}

void sub_1A2EF1E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v12 - 248), 8);
  objc_destroyWeak((id *)(v12 - 216));
  _Block_object_dispose((const void *)(v12 - 208), 8);
  _Block_object_dispose((const void *)(v12 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9616(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9617(uint64_t a1)
{
}

id ICUserNotificationGetResponseButton(void *a1, char a2)
{
  id v3 = a1;
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__9720;
  char v13 = __Block_byref_object_dispose__9721;
  id v14 = 0;
  uint64_t v4 = qword_1A3032C48[a2 & 3];
  uint64_t v5 = [v3 buttons];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __ICUserNotificationGetResponseButton_block_invoke;
  v8[3] = &unk_1E5AC8090;
  void v8[4] = &v9;
  void v8[5] = v4;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1A2EF3000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9720(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9721(uint64_t a1)
{
}

void __ICUserNotificationGetResponseButton_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 type] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __Block_byref_object_copy__10618(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10619(uint64_t a1)
{
}

void sub_1A2EFA994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2EFC840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10822(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10823(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__10950(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10951(uint64_t a1)
{
}

uint64_t ICIAMApplicationMessageSyncCommandReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_45;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_47:
        *(void *)(a1 + 8) = v26;
      }
      else if (v17 == 2)
      {
        uint64_t v30 = objc_alloc_init(ICIAMApplicationMessage);
        objc_storeStrong((id *)(a1 + 16), v30);
        if (!PBReaderPlaceMark() || (ICIAMApplicationMessageReadFrom((uint64_t)v30, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
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
        *(_DWORD *)(a1 + 24) = v20;
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

void sub_1A2EFF4CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

uint64_t _ICLLPlaybackControlSettingsReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
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
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_64;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_64;
      case 1u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 52) |= 2u;
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
                LODWORD(v25) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_58:
        uint64_t v36 = 44;
        goto LABEL_63;
      case 2u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
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
            v25 |= (unint64_t)(v33 & 0x7F) << v29;
            if (v33 < 0)
            {
              v29 += 7;
              BOOL v14 = v30++ >= 9;
              if (v14)
              {
                LODWORD(v25) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_62:
        uint64_t v36 = 40;
LABEL_63:
        *(_DWORD *)(a1 + v36) = v25;
        goto LABEL_64;
      case 4u:
        uint64_t v35 = objc_alloc_init(_ICLLAvailability);
        objc_storeStrong((id *)(a1 + 16), v35);
        if (!PBReaderPlaceMark() || (_ICLLAvailabilityReadFrom((uint64_t)v35, a2) & 1) == 0) {
          goto LABEL_66;
        }
        goto LABEL_53;
      case 5u:
        -[_ICLLPlaybackControlSettings clearOneofValuesForTrackGenerationSource](a1);
        *(unsigned char *)(a1 + 52) |= 4u;
        *(_DWORD *)(a1 + 48) = 1;
        uint64_t v35 = objc_alloc_init(_ICLLAutoPlaySource);
        objc_storeStrong((id *)(a1 + 8), v35);
        if (!PBReaderPlaceMark() || !ICPBDGSFinishDelegationResponseReadFrom(a2)) {
          goto LABEL_66;
        }
        goto LABEL_53;
      case 6u:
        -[_ICLLPlaybackControlSettings clearOneofValuesForTrackGenerationSource](a1);
        *(unsigned char *)(a1 + 52) |= 4u;
        *(_DWORD *)(a1 + 48) = 2;
        uint64_t v35 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 32), v35);
        if (!PBReaderPlaceMark() || !_ICLLRadioSourceReadFrom((uint64_t)v35, a2)) {
          goto LABEL_66;
        }
        goto LABEL_53;
      case 7u:
        -[_ICLLPlaybackControlSettings clearOneofValuesForTrackGenerationSource](a1);
        *(unsigned char *)(a1 + 52) |= 4u;
        *(_DWORD *)(a1 + 48) = 3;
        uint64_t v35 = objc_alloc_init(_ICLLNoGenerationSource);
        objc_storeStrong((id *)(a1 + 24), v35);
        if (PBReaderPlaceMark() && ICPBDGSFinishDelegationResponseReadFrom(a2))
        {
LABEL_53:
          PBReaderRecallMark();

LABEL_64:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_66:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_64;
    }
  }
}

uint64_t ICIAMSynchronizeMessagesResponseReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        unsigned int v17 = objc_alloc_init(ICIAMApplicationMessageSyncResponse);
        [a1 addApplicationMessageSyncResponses:v17];
        if (!PBReaderPlaceMark() || !ICIAMApplicationMessageSyncResponseReadFrom(v17, a2))
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

BOOL ICFileURLIsLocalReadable(void *a1)
{
  id v1 = [a1 path];
  [v1 fileSystemRepresentation];

  getpid();
  return sandbox_check() == 0;
}

BOOL ICFileURLIsLocalWritable(void *a1)
{
  id v1 = [a1 path];
  [v1 fileSystemRepresentation];

  getpid();
  return sandbox_check() == 0;
}

unint64_t _MSV_XXH_XXH64_digest(void *a1)
{
  if (*a1 < 0x20uLL) {
    uint64_t v1 = a1[3] + 0x27D4EB2F165667C5;
  }
  else {
    uint64_t v1 = 0x85EBCA77C2B2AE63
  }
       - 0x61C8864E7A143579
       * ((0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579
         * ((0x85EBCA77C2B2AE63
           - 0x61C8864E7A143579
           * ((0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * ((__ROR8__(a1[2], 57) + __ROR8__(a1[1], 63) + __ROR8__(a1[3], 52) + __ROR8__(a1[4], 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[2], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[3], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[4], 33)));
  unint64_t v2 = v1 + *a1;
  id v3 = a1 + 5;
  unint64_t v4 = *a1 & 0x1FLL;
  if (v4 >= 8)
  {
    do
    {
      uint64_t v5 = *v3++;
      unint64_t v2 = 0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v5, 33)) ^ v2, 37);
      v4 -= 8;
    }
    while (v4 > 7);
  }
  if (v4 >= 4)
  {
    unsigned int v6 = *(_DWORD *)v3;
    id v3 = (uint64_t *)((char *)v3 + 4);
    unint64_t v2 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v6) ^ v2, 41);
    v4 -= 4;
  }
  for (; v4; --v4)
  {
    unsigned int v7 = *(unsigned __int8 *)v3;
    id v3 = (uint64_t *)((char *)v3 + 1);
    unint64_t v2 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v7) ^ v2, 53);
  }
  unint64_t v8 = 0x165667B19E3779F9
     * ((0xC2B2AE3D27D4EB4FLL * (v2 ^ (v2 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v2 ^ (v2 >> 33))) >> 29));
  return v8 ^ HIDWORD(v8);
}

id ICStoreArtworkInfoBestArtworkMatchingSize(void *a1, double a2, double a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [a1 sortedArrayUsingComparator:&__block_literal_global_276];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    double v9 = ceil(a2);
    double v10 = ceil(a3);
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      unint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      objc_msgSend(v12, "originalSize", (void)v17);
      if (v13 >= v9)
      {
        [v12 originalSize];
        if (v14 >= v10) {
          break;
        }
      }
      if (v7 == ++v11)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v15 = v12;

    if (v15) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_10:
  }
  objc_msgSend(v5, "lastObject", (void)v17);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v15;
}

uint64_t __ICStoreArtworkInfoBestArtworkMatchingSize_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 originalSize];
  double v6 = v5;
  double v8 = v7;
  [v4 originalSize];
  double v10 = v9;
  double v12 = v11;

  if (v6 < v10) {
    return -1;
  }
  if (v6 > v10) {
    return 1;
  }
  if (v8 >= v12) {
    return v8 > v12;
  }
  else {
    return -1;
  }
}

uint64_t _ICLLPlaybackItemReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  double v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = 24;
        goto LABEL_23;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_23:
        long long v20 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_63;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
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
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_54:
        *(void *)(a1 + 8) = v23;
        goto LABEL_63;
      case 4u:
        unint64_t v27 = objc_alloc_init(_ICLLPlaybackItemContainer);
        objc_storeStrong((id *)(a1 + 16), v27);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemContainerReadFrom((uint64_t)v27, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_43;
      case 5u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 56) |= 4u;
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
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_58:
        *(unsigned char *)(a1 + 52) = v30 != 0;
        goto LABEL_63;
      case 6u:
        unint64_t v27 = objc_alloc_init(_ICLLMediaInfo);
        objc_storeStrong((id *)(a1 + 40), v27);
        if (PBReaderPlaceMark() && _ICLLMediaInfoReadFrom((uint64_t)v27, a2))
        {
LABEL_43:
          PBReaderRecallMark();

LABEL_63:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_65:

        return 0;
      case 7u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(unsigned char *)(a1 + 56) |= 2u;
        while (2)
        {
          uint64_t v37 = *v3;
          unint64_t v38 = *(void *)(a2 + v37);
          if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              BOOL v14 = v35++ >= 9;
              if (v14)
              {
                LODWORD(v36) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v36) = 0;
        }
LABEL_62:
        *(_DWORD *)(a1 + 48) = v36;
        goto LABEL_63;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_63;
    }
  }
}

__CFString *_NSStringFromICSharedListeningContainerKind(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownKind-%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5AC8A50[a1];
  }

  return v1;
}

void sub_1A2F0CBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12471(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12472(uint64_t a1)
{
}

void sub_1A2F0D0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F0D570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A2F0FC18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A2F10BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A2F120F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A2F158C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 160), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F17068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t ICIAMLogEventRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v18 = 16;
        goto LABEL_30;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
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
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_37:
        *(void *)(a1 + 8) = v22;
        goto LABEL_38;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
LABEL_30:
        char v26 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_38;
      case 4u:
        unint64_t v27 = objc_alloc_init(ICIAMParameter);
        [(id)a1 addEventParameters:v27];
        if (PBReaderPlaceMark() && ICIAMParameterReadFrom((uint64_t)v27, a2))
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

id _ICStoreFileAssetFairPlayInfoValueForValue(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (_NSIsNSData())
    {
      if ([v1 length]) {
        unint64_t v2 = v1;
      }
      else {
        unint64_t v2 = 0;
      }
      id v3 = v2;
      goto LABEL_13;
    }
    if (_NSIsNSString())
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v1 options:0];
      if ([v4 length]) {
        double v5 = v4;
      }
      else {
        double v5 = 0;
      }
      id v3 = v5;

      goto LABEL_13;
    }
  }
  id v3 = 0;
LABEL_13:

  return v3;
}

uint64_t _ICLLCurrentItemChangeActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
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

uint64_t ICPBDGSStartDelegationRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v17 = objc_alloc_init(ICPBDGSPlayerInfoContextRequestToken);
        -[ICPBDGSStartDelegationRequest addPlayerInfoContextRequestToken:](a1, v17);
        if (!PBReaderPlaceMark()
          || (ICPBDGSPlayerInfoContextRequestTokenReadFrom((uint64_t)v17, a2) & 1) == 0)
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

uint64_t _ICLLMoveQueueItemCommandReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  double v5 = (int *)MEMORY[0x1E4F940C8];
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
          *(unsigned char *)(a1 + 36) |= 2u;
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
              goto LABEL_39;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_41:
          uint64_t v32 = 32;
          goto LABEL_46;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 8;
          goto LABEL_37;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
LABEL_37:
          uint64_t v31 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

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
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v28) = v29 + 1;
        v19 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0) {
          goto LABEL_43;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_45:
      uint64_t v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t FindEthernetInterfacesMatchingBSDName(io_iterator_t *a1, const char *a2)
{
  mach_port_t mainPort = 0;
  uint64_t result = MEMORY[0x1A623FFD0](0, &mainPort);
  if (!result)
  {
    CFDictionaryRef v5 = IOBSDNameMatching(mainPort, 0, a2);
    return IOServiceGetMatchingServices(mainPort, v5, a1);
  }
  return result;
}

uint64_t GetFirstEthernetAddress(io_iterator_t iterator, int a2, UInt8 *a3)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (1)
  {
    io_object_t v7 = IOIteratorNext(iterator);
    if (!v7) {
      return 5;
    }
    io_object_t v8 = v7;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v7, @"IOBuiltin", v6, 0);
    if (!CFProperty) {
      break;
    }
    unint64_t v10 = (void *)CFProperty;
    CFTypeID v11 = CFGetTypeID(CFProperty);
    if (v11 != CFBooleanGetTypeID())
    {
      CFRelease(v10);
      break;
    }
    int v12 = [v10 BOOLValue];
    CFRelease(v10);
    if (!a2 || v12) {
      break;
    }
    IOObjectRelease(v8);
  }
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(v8, "IOService", &parent)) {
    goto LABEL_17;
  }
  CFTypeRef v14 = IORegistryEntryCreateCFProperty(parent, @"IOMACAddress", v6, 0);
  if (!v14)
  {
LABEL_16:
    IOObjectRelease(parent);
LABEL_17:
    uint64_t v13 = 5;
    goto LABEL_18;
  }
  int v15 = v14;
  CFTypeID v16 = CFGetTypeID(v14);
  if (v16 != CFDataGetTypeID() || CFDataGetLength((CFDataRef)v15) <= 5)
  {
    CFRelease(v15);
    goto LABEL_16;
  }
  IOObjectRelease(parent);
  v19.location = 0;
  v19.length = 6;
  CFDataGetBytes((CFDataRef)v15, v19, a3);
  CFRelease(v15);
  uint64_t v13 = 0;
LABEL_18:
  IOObjectRelease(v8);
  return v13;
}

uint64_t __Block_byref_object_copy__13828(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13829(uint64_t a1)
{
}

void sub_1A2F22770(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id ICURLResponseStatusCodeGetDebuggingDescription(uint64_t a1)
{
  unint64_t v2 = ICURLResponseStatusCodeGetDescription(a1);
  id v3 = [v2 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
  id v4 = [v3 lowercaseString];

  CFDictionaryRef v5 = [NSString stringWithFormat:@"%@ (%ld)", v4, a1];

  return v5;
}

id ICDAAPUtilitiesCreateDataForContainer(int a1, void *a2)
{
  id v3 = a2;
  if (!a1)
  {
    io_object_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    io_object_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSData * _Nonnull ICDAAPUtilitiesCreateDataForContainer(DKDAAPElementCode, void (^__strong _Nonnull)(DKDAAPWriter *__strong))");
    [v7 handleFailureInFunction:v8, @"ICDAAPUtilities.m", 21, @"Invalid parameter not satisfying: %@", @"containerCode" file lineNumber description];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __ICDAAPUtilitiesCreateDataForContainer_block_invoke;
  v9[3] = &unk_1E5AC8D48;
  int v11 = a1;
  id v10 = v3;
  id v4 = v3;
  CFDictionaryRef v5 = ICDAAPUtilitiesCreateData(v9);

  return v5;
}

void __ICDAAPUtilitiesCreateDataForContainer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 startContainerWithCode:v3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v4 endContainerWithCode:*(unsigned int *)(a1 + 40)];
}

id ICDAAPUtilitiesCreateDataForItemKindContainer(int a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __ICDAAPUtilitiesCreateDataForItemKindContainer_block_invoke;
  v9[3] = &unk_1E5AC8D70;
  char v11 = a2;
  id v10 = v5;
  id v6 = v5;
  io_object_t v7 = ICDAAPUtilitiesCreateDataForContainer(a1, v9);

  return v7;
}

void __ICDAAPUtilitiesCreateDataForItemKindContainer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a2;
  id v4 = [v3 date];
  ICDAAPUtilitiesWriteProperty(v5, 1836282979, 10, v4);

  [v5 writeUInt8:*(unsigned __int8 *)(a1 + 40) withCode:1835625316];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ICDAAPUtilitiesWriteProperty(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v34 = a1;
  id v7 = a4;
  switch(a3)
  {
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v12 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v12 handleFailureInFunction:v13 file:@"ICDAAPUtilities.m" lineNumber:41 description:@"DKDAAPValueTypeUInt8 only supports NSNumber."];
      }
      objc_msgSend(v34, "writeUInt8:withCode:", objc_msgSend(v7, "unsignedCharValue"), a2);
      break;
    case 2:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        CFTypeRef v14 = [MEMORY[0x1E4F28B00] currentHandler];
        int v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v14 handleFailureInFunction:v15 file:@"ICDAAPUtilities.m" lineNumber:48 description:@"DKDAAPValueTypeSInt8 only supports NSNumber."];
      }
      objc_msgSend(v34, "writeSInt8:withCode:", objc_msgSend(v7, "charValue"), a2);
      break;
    case 3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        CFTypeID v16 = [MEMORY[0x1E4F28B00] currentHandler];
        char v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v16 handleFailureInFunction:v17 file:@"ICDAAPUtilities.m" lineNumber:55 description:@"DKDAAPValueTypeUInt16 only supports NSNumber."];
      }
      objc_msgSend(v34, "writeUInt16:withCode:", objc_msgSend(v7, "unsignedShortValue"), a2);
      break;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unsigned int v18 = [MEMORY[0x1E4F28B00] currentHandler];
        CFRange v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v18 handleFailureInFunction:v19 file:@"ICDAAPUtilities.m" lineNumber:62 description:@"DKDAAPValueTypeSInt16 only supports NSNumber."];
      }
      objc_msgSend(v34, "writeSInt16:withCode:", objc_msgSend(v7, "shortValue"), a2);
      break;
    case 5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v21 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v20 handleFailureInFunction:v21 file:@"ICDAAPUtilities.m" lineNumber:69 description:@"DKDAAPValueTypeUInt32 only supports NSNumber."];
      }
      uint64_t v8 = [v7 unsignedIntValue];
      goto LABEL_32;
    case 6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v22 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v22 handleFailureInFunction:v23 file:@"ICDAAPUtilities.m" lineNumber:76 description:@"DKDAAPValueTypeSInt32 only supports NSNumber."];
      }
      objc_msgSend(v34, "writeSInt32:withCode:", objc_msgSend(v7, "intValue"), a2);
      break;
    case 7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v24 handleFailureInFunction:v25 file:@"ICDAAPUtilities.m" lineNumber:83 description:@"DKDAAPValueTypeUInt64 only supports NSNumber."];
      }
      objc_msgSend(v34, "writeUInt64:withCode:", objc_msgSend(v7, "unsignedLongLongValue"), a2);
      break;
    case 8:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v26 = [MEMORY[0x1E4F28B00] currentHandler];
        unsigned int v27 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v26 handleFailureInFunction:v27 file:@"ICDAAPUtilities.m" lineNumber:90 description:@"DKDAAPValueTypeSInt64 only supports NSNumber."];
      }
      objc_msgSend(v34, "writeSInt64:withCode:", objc_msgSend(v7, "longLongValue"), a2);
      break;
    case 9:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
        char v33 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v32 handleFailureInFunction:v33 file:@"ICDAAPUtilities.m" lineNumber:97 description:@"DKDAAPValueTypeString only supports NSString."];
      }
      [v34 writeString:v7 withCode:a2];
      break;
    case 10:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v28 handleFailureInFunction:v29 file:@"ICDAAPUtilities.m" lineNumber:104 description:@"DKDAAPValueTypeDate only supports NSDate."];
      }
      [v7 timeIntervalSince1970];
      uint64_t v8 = v9;
LABEL_32:
      [v34 writeUInt32:v8 withCode:a2];
      break;
    case 13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v30 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v31 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
        [v30 handleFailureInFunction:v31 file:@"ICDAAPUtilities.m" lineNumber:111 description:@"DKDAAPValueTypeBinary only supports NSData."];
      }
      [v34 writeData:v7 withCode:a2];
      break;
    default:
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      char v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteProperty(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, DKDAAPValueType, __strong id _Nonnull)");
      [v10 handleFailureInFunction:v11 file:@"ICDAAPUtilities.m" lineNumber:120 description:@"Cannot make element from unsupported DAAP value type."];

      break;
  }
}

void ICDAAPUtilitiesWriteContainer(void *a1, uint64_t a2, void *a3)
{
  id v8 = a1;
  id v5 = a3;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void ICDAAPUtilitiesWriteContainer(DKDAAPWriter *__strong _Nonnull, DKDAAPElementCode, void (^__strong _Nonnull)(DKDAAPWriter *__strong))");
    [v6 handleFailureInFunction:v7, @"ICDAAPUtilities.m", 126, @"Invalid parameter not satisfying: %@", @"block" file lineNumber description];
  }
  [v8 startContainerWithCode:a2];
  v5[2](v5, v8);
  [v8 endContainerWithCode:a2];
}

BOOL _ICLLRadioSourceReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v20 = objc_alloc_init(_ICLLRadioSeed);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (!PBReaderPlaceMark() || (_ICLLRadioSeedReadFrom((uint64_t)v20, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 8;
LABEL_23:
    uint64_t v20 = *(_ICLLRadioSeed **)(a1 + v19);
    *(void *)(a1 + v19) = v18;
LABEL_27:

    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ICIAMTriggerConditionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v18 = 24;
          goto LABEL_52;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
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
                  LODWORD(v22) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_56:
          uint64_t v42 = 20;
          goto LABEL_69;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
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
                  LODWORD(v22) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_60:
          uint64_t v42 = 16;
          goto LABEL_69;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_52;
        case 5u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 8u;
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
                  LODWORD(v22) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_64:
          uint64_t v42 = 36;
          goto LABEL_69;
        case 6u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          break;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_52:
          char v41 = *(void **)(a1 + v18);
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
        uint64_t v38 = *v3;
        unint64_t v39 = *(void *)(a2 + v38);
        if (v39 == -1 || v39 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
        *(void *)(a2 + v38) = v39 + 1;
        v22 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0) {
          goto LABEL_66;
        }
        v36 += 7;
        BOOL v14 = v37++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_68;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_66:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_68:
      uint64_t v42 = 32;
LABEL_69:
      *(_DWORD *)(a1 + v42) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ICIAMImageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
          goto LABEL_23;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_23:
          char v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
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
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_41:
          uint64_t v32 = 32;
          goto LABEL_46;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
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
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_43;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_45:
      uint64_t v32 = 8;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__14373(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14374(uint64_t a1)
{
}

void sub_1A2F277BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__14546(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14547(uint64_t a1)
{
}

void sub_1A2F28A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14811(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14812(uint64_t a1)
{
}

void sub_1A2F2937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15233(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15234(uint64_t a1)
{
}

void sub_1A2F296B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F29844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F299D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F29B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F29DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F2A28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F2AAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F2AFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F2C2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1A2F2C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICPBDGSFinishDelegationRequestReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = objc_alloc_init(ICPBDGSPlayerDelegateInfoToken);
        -[ICPBDGSFinishDelegationRequest addPlayerDelegateInfoToken:](a1, v17);
        if (!PBReaderPlaceMark() || (ICPBDGSPlayerDelegateInfoTokenReadFrom((uint64_t)v17, a2) & 1) == 0)
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

uint64_t ICIAMMessagePresentationTriggerReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
      }
      else
      {
        if (v17 == 2)
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0) {
              goto LABEL_34;
            }
            v21 += 7;
            BOOL v14 = v22++ >= 9;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_36;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_36:
          *(_DWORD *)(a1 + 16) = v23;
          continue;
        }
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
      }
      char v20 = *(void **)(a1 + v19);
      *(void *)(a1 + v19) = v18;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ICIAMMetricEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = 64;
        goto LABEL_53;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 100) |= 2u;
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
                LODWORD(v22) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_60:
        uint64_t v38 = 72;
        goto LABEL_69;
      case 3u:
        char v26 = objc_alloc_init(ICIAMParameter);
        [(id)a1 addPageDetails:v26];
        goto LABEL_47;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 88;
        goto LABEL_53;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 100) |= 4u;
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
            v22 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_64;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_64:
        uint64_t v38 = 96;
        goto LABEL_69;
      case 6u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 100) |= 1u;
        while (2)
        {
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 1;
            v22 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_68:
        uint64_t v38 = 16;
LABEL_69:
        *(_DWORD *)(a1 + v38) = v22;
        goto LABEL_70;
      case 7u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_53;
      case 8u:
        char v26 = objc_alloc_init(ICIAMParameter);
        [(id)a1 addActionDetails:v26];
LABEL_47:
        if (!PBReaderPlaceMark() || !ICIAMParameterReadFrom((uint64_t)v26, a2)) {
          goto LABEL_72;
        }
        goto LABEL_56;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
        goto LABEL_53;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 80;
        goto LABEL_53;
      case 0xBu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
LABEL_53:
        unsigned int v37 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_70;
      case 0xCu:
        char v26 = objc_alloc_init(ICIAMImpressionNode);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (PBReaderPlaceMark() && ICIAMImpressionNodeReadFrom((uint64_t)v26, a2))
        {
LABEL_56:
          PBReaderRecallMark();

LABEL_70:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_72:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_70;
    }
  }
}

void sub_1A2F31E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _ICLLMoveQueueItemActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
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
        *(unsigned char *)(a1 + 36) |= 2u;
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
            goto LABEL_40;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_42;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_42:
        uint64_t v32 = 32;
        goto LABEL_47;
      case 2u:
        uint64_t v24 = PBReaderReadString();
        char v25 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v24;

        goto LABEL_48;
      case 3u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
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
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_46:
        uint64_t v32 = 16;
LABEL_47:
        *(_DWORD *)(a1 + v32) = v19;
        goto LABEL_48;
      case 4u:
        char v31 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 24), v31);
        if PBReaderPlaceMark() && (_ICLLQueueQueryReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_48:
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
        goto LABEL_48;
    }
  }
}

void sub_1A2F33754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16378(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16379(uint64_t a1)
{
}

void sub_1A2F33A74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A2F33E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F347A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A2F39850(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16882(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16883(uint64_t a1)
{
}

void sub_1A2F3A420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17109(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17110(uint64_t a1)
{
}

uint64_t ICIAMLocalNotificationReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
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
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              *(unsigned char *)(a1 + 36) |= 4u;
              break;
            case 2u:
              *(unsigned char *)(a1 + 36) |= 1u;
              uint64_t v26 = *v3;
              unint64_t v27 = *(void *)(a2 + v26);
              if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
                *(void *)(a2 + v26) = v27 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v28 = 0;
              }
              uint64_t v33 = 8;
              goto LABEL_43;
            case 3u:
              *(unsigned char *)(a1 + 36) |= 2u;
              uint64_t v29 = *v3;
              unint64_t v30 = *(void *)(a2 + v29);
              if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v30);
                *(void *)(a2 + v29) = v30 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v28 = 0;
              }
              uint64_t v33 = 16;
LABEL_43:
              *(void *)(a1 + v33) = v28;
              goto LABEL_44;
            case 4u:
              uint64_t v31 = PBReaderReadString();
              uint64_t v32 = *(void **)(a1 + 24);
              *(void *)(a1 + 24) = v31;

              goto LABEL_44;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_44:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
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
              goto LABEL_36;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_38;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_38:
          *(_DWORD *)(a1 + 32) = v20;
          goto LABEL_44;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

os_log_t _ICLogCategoryDefault()
{
  os_log_t v0 = os_log_create("com.apple.amp.iTunesCloud", "Default");

  return v0;
}

os_log_t _ICLogCategoryDefault_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");

  return v0;
}

os_log_t _ICLogCategoryAgeVerification()
{
  os_log_t v0 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");

  return v0;
}

os_log_t _ICLogCategorySubscription()
{
  os_log_t v0 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");

  return v0;
}

os_log_t _ICLogCategoryQuickRelay()
{
  os_log_t v0 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");

  return v0;
}

void ICSiriPostDynamiteClientStateChangedNotification()
{
  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.siri.client.state.DynamiteClientState%s", ".siri_data_changed");
  id v0 = objc_claimAutoreleasedReturnValue();
  notify_post((const char *)[v0 UTF8String]);
}

void ICSiriGetSharedUserIDs(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEBUG, "[ICUserIdentityStore] - Returning zero SiriSharedUserIDs [unsupported platform]", v5, 2u);
  }

  (*((void (**)(id, void, void))v3 + 2))(v3, MEMORY[0x1E4F1CBF0], 0);
}

_DWORD *_MSV_XXH_XXH32_update_17604(_DWORD *result, char *__src, size_t __n)
{
  if (__src)
  {
    int v3 = __n;
    id v4 = __src;
    id v5 = result;
    int v6 = result[1];
    unsigned int v7 = *result + __n;
    BOOL v9 = __n > 0xF || v7 > 0xF;
    *uint64_t result = v7;
    result[1] = v6 | v9;
    uint64_t v10 = result[10];
    if (v10 + __n <= 0xF)
    {
      uint64_t result = memcpy((char *)result + v10 + 24, __src, __n);
      LODWORD(v11) = v5[10] + v3;
LABEL_18:
      _DWORD v5[10] = v11;
      return result;
    }
    uint64_t v12 = &__src[__n];
    if (v10)
    {
      uint64_t result = memcpy((char *)result + v10 + 24, __src, (16 - v10));
      HIDWORD(v13) = v5[2] - 2048144777 * v5[6];
      LODWORD(v13) = HIDWORD(v13);
      int v14 = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[3] - 2048144777 * v5[7];
      LODWORD(v13) = HIDWORD(v13);
      void v5[2] = v14;
      v5[3] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[4] - 2048144777 * v5[8];
      LODWORD(v13) = HIDWORD(v13);
      v5[4] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[5] - 2048144777 * v5[9];
      LODWORD(v13) = HIDWORD(v13);
      v5[5] = -1640531535 * (v13 >> 19);
      v4 += (16 - v5[10]);
      _DWORD v5[10] = 0;
    }
    if (v4 <= v12 - 16)
    {
      int v15 = v5[2];
      int v16 = v5[3];
      int v17 = v5[4];
      int v18 = v5[5];
      do
      {
        HIDWORD(v19) = v15 - 2048144777 * *(_DWORD *)v4;
        LODWORD(v19) = HIDWORD(v19);
        int v15 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v16 - 2048144777 * *((_DWORD *)v4 + 1);
        LODWORD(v19) = HIDWORD(v19);
        int v16 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v17 - 2048144777 * *((_DWORD *)v4 + 2);
        LODWORD(v19) = HIDWORD(v19);
        int v17 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v18 - 2048144777 * *((_DWORD *)v4 + 3);
        LODWORD(v19) = HIDWORD(v19);
        int v18 = -1640531535 * (v19 >> 19);
        v4 += 16;
      }
      while (v4 <= v12 - 16);
      void v5[2] = v15;
      v5[3] = v16;
      v5[4] = v17;
      v5[5] = v18;
    }
    if (v4 < v12)
    {
      size_t v11 = v12 - v4;
      uint64_t result = memcpy(v5 + 6, v4, v11);
      goto LABEL_18;
    }
  }
  return result;
}

void sub_1A2F41CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPRequestHandlerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!AskPermissionLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __AskPermissionLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5AC94F0;
    uint64_t v8 = 0;
    AskPermissionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AskPermissionLibraryCore_frameworkLibrary)
  {
    int v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *AskPermissionLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"ICStoreDialogResponseHandler.m", 28, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("APRequestHandler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getAPRequestHandlerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICStoreDialogResponseHandler.m", 29, @"Unable to find class %s", "APRequestHandler");

LABEL_10:
    __break(1u);
  }
  getAPRequestHandlerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AskPermissionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AskPermissionLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t ICFairPlayGetContextIdentifier(_DWORD *a1, void *a2)
{
  return ICFairPlayGetContextIdentifierForFolderPath(0, a1, a2);
}

uint64_t ICFairPlayGetContextIdentifierForFolderPath(void *a1, _DWORD *a2, void *a3)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = v5;
  if (![v5 length])
  {
    if (ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPathOnceToken != -1) {
      dispatch_once(&ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPathOnceToken, &__block_literal_global_3_17872);
    }
    id v6 = (id)ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPath;
  }
  pthread_mutex_lock(&ICFairPlayGetContextIdentifierForFolderPath_sMutex);
  if (!ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID)
  {
LABEL_8:
    value[0] = 0;
    goto LABEL_9;
  }
  value[0] = NSMapGet((NSMapTable *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID, v6);
  if (value[0])
  {
    df35957c4e0();
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
LABEL_9:
  memset(v21, 0, 24);
  if (!ICFairPlayGetHardwareInfo((uint64_t)v21))
  {
    unint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7500 userInfo:0];
    goto LABEL_13;
  }
  id v8 = v6;
  int v9 = XtCqEf5X(0, (uint64_t)v21, [v8 UTF8String], (uint64_t)value);
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    *(void *)&value[1] = *MEMORY[0x1E4F28A50];
    size_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v9 userInfo:0];
    uint64_t v20 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&value[1] count:1];
    unint64_t v13 = [v10 errorWithDomain:@"ICError" code:-7501 userInfo:v12];

LABEL_13:
    uint64_t v14 = 0;
    goto LABEL_18;
  }
  int v15 = (NSMapTable *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID;
  if (!ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID)
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:1];
    int v17 = (void *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID;
    ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID = v16;

    int v15 = (NSMapTable *)ICFairPlayGetContextIdentifierForFolderPath_sFolderPathToContextID;
  }
  NSMapInsert(v15, v8, (const void *)value[0]);
LABEL_17:
  unint64_t v13 = 0;
  uint64_t v14 = 1;
LABEL_18:
  pthread_mutex_unlock(&ICFairPlayGetContextIdentifierForFolderPath_sMutex);
  if (a2) {
    *a2 = value[0];
  }
  if (a3) {
    *a3 = v13;
  }

  return v14;
}

void __ICFairPlayGetContextIdentifierForFolderPath_block_invoke()
{
  unint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Media", @"iTunes_Control", @"iTunes", 0);
  uint64_t v0 = [NSString pathWithComponents:v2];
  uint64_t v1 = (void *)ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPath;
  ICFairPlayGetContextIdentifierForFolderPath_sDefaultFolderPath = v0;
}

BOOL ICFairPlayCopyKeyBagSyncData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  unsigned int v15 = 0;
  id v14 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v15, &v14);
  id v9 = v14;
  if (ContextIdentifierForFolderPath)
  {
    id v13 = v9;
    BOOL v10 = ICFairPlayCopyKeyBagSyncDataWithContextID(v15, a1, a2, a3, &v13);
    id v11 = v13;

    id v9 = v11;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v10 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v9;
LABEL_6:

  return v10;
}

BOOL ICFairPlayCopyKeyBagSyncDataWithContextID(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v13 = 0;
  unsigned int v12 = 0;
  Mt76Vq80ux(a1, a2, 0, a3, (uint64_t)&v13, (uint64_t)&v12);
  int v8 = v7;
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v7 userInfo:0];
    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v13, v12);
  id v9 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v10;
LABEL_4:
  if (a5) {
    *a5 = v9;
  }

  return v8 == 0;
}

BOOL ICFairPlayImportKeybagData(void *a1, void *a2)
{
  id v3 = a1;
  unsigned int v11 = 0;
  id v10 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v11, &v10);
  id v5 = v10;
  if (ContextIdentifierForFolderPath)
  {
    id v9 = v5;
    BOOL v6 = ICFairPlayImportKeybagDataWithContextID(v11, v3, &v9);
    id v7 = v9;

    id v5 = v7;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v6 = 0;
  if (a2) {
LABEL_5:
  }
    *a2 = v5;
LABEL_6:

  return v6;
}

BOOL ICFairPlayImportKeybagDataWithContextID(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    ha0dkchaters6();
    BOOL v8 = v7 == 0;
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v7 userInfo:0];
      if (!a3) {
        goto LABEL_7;
      }
    }
    else
    {
      id v9 = 0;
      if (!a3) {
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  id v9 = 0;
  BOOL v8 = 1;
  if (a3) {
LABEL_6:
  }
    *a3 = v9;
LABEL_7:

  return v8;
}

uint64_t _ICLLQueryMessageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x1E4F940B8];
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
      case 0u:
        unsigned int v17 = 0;
        do
        {
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 == -1 || v19 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
            goto LABEL_40;
          }
          unint64_t v20 = v19 + 1;
          int v21 = *(char *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v20;
          if ((v21 & 0x80000000) == 0) {
            break;
          }
        }
        while (v17++ <= 8);
        goto LABEL_40;
      case 1u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 1;
        char v24 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark() || (_ICLLQueueQueryReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 2u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 2;
        char v24 = objc_alloc_init(_ICLLPlaybackSyncStateQuery);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackSyncStateQueryReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 3u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 3;
        char v24 = objc_alloc_init(_ICLLPlaybackControlSettingsQuery);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (_ICLLPlaybackControlSettingsQueryReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_39;
      case 4u:
        -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
        *(unsigned char *)(a1 + 48) |= 1u;
        *(_DWORD *)(a1 + 32) = 4;
        char v24 = objc_alloc_init(_ICLLParticipantQuery);
        objc_storeStrong((id *)(a1 + 8), v24);
        if PBReaderPlaceMark() && (_ICLLParticipantQueryReadFrom((uint64_t)v24, a2))
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_40:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_44:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_40;
    }
  }
}

void sub_1A2F48440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYSetupAssistantLaunchedDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantLaunchedDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *SetupAssistantLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __SetupAssistantLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5AC9530;
    uint64_t v6 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICDeviceSetupStatusMonitor.m", 22, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *__getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYSetupAssistantFinishedDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t _ICLLParticipantChangeActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = objc_alloc_init(_ICLLParticipantQuery);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (_ICLLParticipantQueryReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 2)
      {
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0) {
            goto LABEL_45;
          }
          v25 += 7;
          BOOL v14 = v26++ >= 9;
          if (v14)
          {
            uint64_t v27 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v27 = 0;
        }
LABEL_47:
        *(void *)(a1 + 8) = v27;
      }
      else if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 28) |= 2u;
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
        *(_DWORD *)(a1 + 24) = v20;
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

BOOL ICIAMApplicationMessageSyncResponseReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v17 = PBReaderReadString();
        char v18 = (ICIAMApplicationMessageSyncCommand *)a1[1];
        a1[1] = v17;
LABEL_24:

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
    char v18 = objc_alloc_init(ICIAMApplicationMessageSyncCommand);
    [a1 addSyncCommands:v18];
    if (!PBReaderPlaceMark() || (ICIAMApplicationMessageSyncCommandReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ICPAPlayModeDictionaryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v10 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v20 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
          {
            char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__autoPlayMode;
            goto LABEL_48;
          }
          v26 += 7;
          BOOL v24 = v27++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__autoPlayMode;
            goto LABEL_50;
          }
        }
        char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__autoPlayMode;
LABEL_47:
        *(unsigned char *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4))
          {
            char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__repeatPlayMode;
            goto LABEL_47;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            break;
          }
          v18 += 7;
          BOOL v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__repeatPlayMode;
            goto LABEL_50;
          }
        }
        char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__repeatPlayMode;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_51:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v31 = 0;
    unsigned int v32 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 20) |= 4u;
    while (1)
    {
      uint64_t v33 = *v3;
      unint64_t v34 = *(void *)(a2 + v33);
      if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
      {
        char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__shufflePlayMode;
        goto LABEL_47;
      }
      char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
      *(void *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0) {
        break;
      }
      v31 += 7;
      BOOL v24 = v32++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__shufflePlayMode;
        goto LABEL_50;
      }
    }
    char v25 = &OBJC_IVAR___ICPAPlayModeDictionary__shufflePlayMode;
LABEL_48:
    if (*(unsigned char *)(a2 + *v5)) {
      LODWORD(v20) = 0;
    }
LABEL_50:
    *(_DWORD *)(a1 + *v25) = v20;
    goto LABEL_51;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A2F4BD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18839(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18840(uint64_t a1)
{
}

uint64_t _ICLLCurrentItemChangeCommandReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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

void sub_1A2F4FBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19204(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19205(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__19419(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19420(uint64_t a1)
{
}

void sub_1A2F536E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

uint64_t _ICLLParticipantQueryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
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
        uint64_t v17 = objc_alloc_init(_ICLLParticipant);
        -[_ICLLParticipantQuery addParticipant:](a1, v17);
        if (!PBReaderPlaceMark() || (_ICLLParticipantReadFrom((uint64_t)v17, a2) & 1) == 0)
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

uint64_t _ICLLQueueQueryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
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
        uint64_t v17 = objc_alloc_init(_ICLLQueue);
        objc_storeStrong((id *)(a1 + 16), v17);
        if PBReaderPlaceMark() && (_ICLLQueueReadFrom((uint64_t)v17, a2)) {
          goto LABEL_34;
        }
        goto LABEL_41;
      case 2u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v19;

        goto LABEL_39;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
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
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        *(_DWORD *)(a1 + 32) = v23;
        goto LABEL_39;
      case 4u:
        uint64_t v17 = objc_alloc_init(_ICLLPlaybackControlSettings);
        objc_storeStrong((id *)(a1 + 8), v17);
        if PBReaderPlaceMark() && (_ICLLPlaybackControlSettingsReadFrom((uint64_t)v17, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_41:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t ICIAMMessageActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
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
        uint64_t v18 = 32;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_53;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 60) |= 2u;
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
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_48:
        *(unsigned char *)(a1 + 56) = v23 != 0;
        goto LABEL_53;
      case 5u:
        unsigned int v27 = objc_alloc_init(ICIAMParameter);
        [(id)a1 addActionParameters:v27];
        if (!PBReaderPlaceMark() || !ICIAMParameterReadFrom((uint64_t)v27, a2)) {
          goto LABEL_55;
        }
        goto LABEL_37;
      case 6u:
        unsigned int v27 = objc_alloc_init(ICIAMMetricEvent);
        objc_storeStrong((id *)(a1 + 16), v27);
        if PBReaderPlaceMark() && (ICIAMMetricEventReadFrom((uint64_t)v27, a2))
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_53:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_55:

        return 0;
      case 7u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 60) |= 1u;
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
                LODWORD(v30) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v30) = 0;
        }
LABEL_52:
        *(_DWORD *)(a1 + 40) = v30;
        goto LABEL_53;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_53;
    }
  }
}

void sub_1A2F58408(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 120));
  objc_destroyWeak((id *)(v5 - 112));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20393(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6240BF0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__20394(uint64_t a1)
{
}

void sub_1A2F63478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t __Block_byref_object_copy__21292(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21293(uint64_t a1)
{
}

BOOL ICIAMMessageContentReadFrom(char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
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
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 80;
        goto LABEL_32;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 72;
        goto LABEL_32;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_32;
      case 4u:
        uint64_t v19 = objc_alloc_init(ICIAMImage);
        [a1 addImages:v19];
        if (!PBReaderPlaceMark() || (ICIAMImageReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_40;
      case 5u:
        uint64_t v19 = objc_alloc_init(ICIAMMessageAction);
        [a1 addMessageActions:v19];
        if (!PBReaderPlaceMark() || (ICIAMMessageActionReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_40;
      case 6u:
        uint64_t v19 = objc_alloc_init(ICIAMParameter);
        [a1 addContentParameters:v19];
        if (!PBReaderPlaceMark() || !ICIAMParameterReadFrom((uint64_t)v19, a2)) {
          goto LABEL_45;
        }
        goto LABEL_40;
      case 7u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
LABEL_32:
        uint64_t v19 = *(ICIAMImage **)&a1[v18];
        *(void *)&a1[v18] = v17;
        goto LABEL_41;
      case 0xEu:
        uint64_t v19 = objc_alloc_init(ICIAMMetricEvent);
        uint64_t v20 = 64;
        goto LABEL_38;
      case 0xFu:
        uint64_t v19 = objc_alloc_init(ICIAMMetricEvent);
        uint64_t v20 = 24;
        goto LABEL_38;
      case 0x10u:
        uint64_t v19 = objc_alloc_init(ICIAMMetricEvent);
        uint64_t v20 = 16;
LABEL_38:
        objc_storeStrong((id *)&a1[v20], v19);
        if PBReaderPlaceMark() && (ICIAMMetricEventReadFrom((uint64_t)v19, a2))
        {
LABEL_40:
          PBReaderRecallMark();
LABEL_41:

LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_45:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_42;
    }
  }
}

__CFString *NSStringFromICFavoriteMediaEntityType(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5AC9A10[a1];
  }

  return v1;
}

void sub_1A2F6660C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _ICRemoteRequestOperationIsAllowedForClassName(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (_ICRemoteRequestOperationIsAllowedForClassName_sAllowableRemoteRequestOperationClassNamesOnceToken != -1)
  {
    dispatch_once(&_ICRemoteRequestOperationIsAllowedForClassName_sAllowableRemoteRequestOperationClassNamesOnceToken, &__block_literal_global_21936);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = [(id)_ICRemoteRequestOperationIsAllowedForClassName_sAllowableRemoteRequestOperationClassNames containsObject:v2];
LABEL_6:

  return v3;
}

uint64_t __Block_byref_object_copy__22099(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22100(uint64_t a1)
{
}

void sub_1A2F67F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getML3MusicLibraryClass_22133()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getML3MusicLibraryClass_softClass_22134;
  uint64_t v7 = getML3MusicLibraryClass_softClass_22134;
  if (!getML3MusicLibraryClass_softClass_22134)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getML3MusicLibraryClass_block_invoke_22135;
    v3[3] = &unk_1E5ACD4F0;
    v3[4] = &v4;
    __getML3MusicLibraryClass_block_invoke_22135((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A2F69A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getML3MusicLibraryClass_block_invoke_22135(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MusicLibraryLibraryCore_frameworkLibrary_22136)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MusicLibraryLibraryCore_block_invoke_22137;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5AC9AE8;
    uint64_t v8 = 0;
    MusicLibraryLibraryCore_frameworkLibrary_22136 = _sl_dlopen();
  }
  if (!MusicLibraryLibraryCore_frameworkLibrary_22136)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *MusicLibraryLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"ICPlaybackPositionClient.m", 18, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("ML3MusicLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getML3MusicLibraryClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPlaybackPositionClient.m", 19, @"Unable to find class %s", "ML3MusicLibrary");

LABEL_10:
    __break(1u);
  }
  getML3MusicLibraryClass_softClass_22134 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MusicLibraryLibraryCore_block_invoke_22137()
{
  uint64_t result = _sl_dlopen();
  MusicLibraryLibraryCore_frameworkLibrary_22136 = result;
  return result;
}

void sub_1A2F6A494(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1A2F6A660(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t ICIAMMessageRuleReadFrom(uint64_t a1, uint64_t a2)
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
        goto LABEL_44;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 60) |= 2u;
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
                LODWORD(v22) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_48:
        uint64_t v33 = 56;
        goto LABEL_53;
      case 3u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 60) |= 1u;
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
                LODWORD(v22) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_52:
        uint64_t v33 = 24;
LABEL_53:
        *(_DWORD *)(a1 + v33) = v22;
        goto LABEL_54;
      case 4u:
        uint64_t v31 = objc_alloc_init(ICIAMMessageRule);
        [(id)a1 addSubrules:v31];
        if (!PBReaderPlaceMark() || (ICIAMMessageRuleReadFrom(v31, a2) & 1) == 0) {
          goto LABEL_56;
        }
        goto LABEL_41;
      case 5u:
        uint64_t v31 = objc_alloc_init(ICIAMTriggerCondition);
        objc_storeStrong((id *)(a1 + 40), v31);
        if PBReaderPlaceMark() && (ICIAMTriggerConditionReadFrom((uint64_t)v31, a2))
        {
LABEL_41:
          PBReaderRecallMark();

LABEL_54:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_56:

        return 0;
      case 6u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_44;
      case 7u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_44:
        unint64_t v32 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_54;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_54;
    }
  }
}

uint64_t __Block_byref_object_copy__22702(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22703(uint64_t a1)
{
}

void sub_1A2F6DBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22810(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22811(uint64_t a1)
{
}

uint64_t ICPAPlayActivityEnqueuerPropertiesReadFrom(uint64_t a1, uint64_t a2)
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
          goto LABEL_47;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_47;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_47;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_47;
        case 5u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 68) |= 2u;
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
                  LODWORD(v22) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_58:
          *(_DWORD *)(a1 + 48) = v22;
          continue;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 68) |= 8u;
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
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  uint64_t v28 = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_62:
          BOOL v45 = v28 != 0;
          uint64_t v46 = 65;
          goto LABEL_71;
        case 7u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(unsigned char *)(a1 + 68) |= 1u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  uint64_t v34 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_66:
          *(void *)(a1 + 8) = v34;
          continue;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
LABEL_47:
          uint64_t v38 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 9u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *(unsigned char *)(a1 + 68) |= 4u;
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
        uint64_t v42 = *v3;
        unint64_t v43 = *(void *)(a2 + v42);
        if (v43 == -1 || v43 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
        *(void *)(a2 + v42) = v43 + 1;
        v41 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0) {
          goto LABEL_68;
        }
        v39 += 7;
        BOOL v14 = v40++ >= 9;
        if (v14)
        {
          uint64_t v41 = 0;
          goto LABEL_70;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_68:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v41 = 0;
      }
LABEL_70:
      BOOL v45 = v41 != 0;
      uint64_t v46 = 64;
LABEL_71:
      *(unsigned char *)(a1 + v46) = v45;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ICPBDGSStartDelegationResponseReadFrom(uint64_t a1, uint64_t a2)
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
      case 1u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 8;
        goto LABEL_27;
      case 2u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16;
        goto LABEL_27;
      case 3u:
        uint64_t v19 = objc_alloc_init(ICPBDGSPlayerInfoContextToken);
        -[ICPBDGSStartDelegationResponse addPlayerInfoContextToken:](a1, v19);
        if PBReaderPlaceMark() && (ICPBDGSPlayerInfoContextTokenReadFrom((uint64_t)v19, a2))
        {
          PBReaderRecallMark();
LABEL_28:

LABEL_29:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32;
LABEL_27:
        uint64_t v19 = *(ICPBDGSPlayerInfoContextToken **)(a1 + v18);
        *(void *)(a1 + v18) = v17;
        goto LABEL_28;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
    }
  }
}

BOOL _ICLLMediaInfoReadFrom(uint64_t a1, uint64_t a2)
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ICPBDGSResponseReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 101)
      {
        unint64_t v24 = objc_alloc_init(ICPBDGSFinishDelegationResponse);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || !ICPBDGSFinishDelegationResponseReadFrom(a2))
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if (v17 != 100)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 32) |= 1u;
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
                goto LABEL_37;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_39:
            *(_DWORD *)(a1 + 16) = v20;
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
        unint64_t v24 = objc_alloc_init(ICPBDGSStartDelegationResponse);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || !ICPBDGSStartDelegationResponseReadFrom((uint64_t)v24, a2)) {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A2F7F440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

void sub_1A2F7FF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1A2F80630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__25223(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25224(uint64_t a1)
{
}

void sub_1A2F8124C(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8(v1);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

void sub_1A2F813BC(_Unwind_Exception *a1)
{
  __destructor_8_s0_s8(v1);
  _Unwind_Resume(a1);
}

void sub_1A2F81C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2F82770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v65 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8324C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_1A2F84990(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A2F85D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F86A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A2F87B80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8850C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getAFMultiUserConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __AssistantServicesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5ACA310;
    uint64_t v8 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"ICLibraryAuthServiceClientTokenProvider.m", 47, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("AFMultiUserConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getAFMultiUserConnectionClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICLibraryAuthServiceClientTokenProvider.m", 48, @"Unable to find class %s", "AFMultiUserConnection");

LABEL_10:
    __break(1u);
  }
  getAFMultiUserConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__25661(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25662(uint64_t a1)
{
}

void sub_1A2F89E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getPDCPreflightManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __PrivacyDisclosureCoreLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5ACA3E0;
    uint64_t v8 = 0;
    PrivacyDisclosureCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PrivacyDisclosureCoreLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *PrivacyDisclosureCoreLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"ICPrivacyInfo.m", 40, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("PDCPreflightManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getPDCPreflightManagerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPrivacyInfo.m", 41, @"Unable to find class %s", "PDCPreflightManager");

LABEL_10:
    __break(1u);
  }
  getPDCPreflightManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PrivacyDisclosureCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PrivacyDisclosureCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getOBPrivacyAppleMusicIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyAppleMusicIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getOBPrivacyTVAppIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyTVAppIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyTVAppIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getOBPrivacyiBooksIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyiBooksIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyiBooksIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getOBPrivacyPodcastsIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyPodcastsIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyPodcastsIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getOBPrivacyAppStoreIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyAppStoreIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyAppStoreIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void getOBPrivacyFitnessPlusIdentifier()
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr;
  uint64_t v9 = getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr)
  {
    uint64_t v1 = OnBoardingKitLibrary();
    v7[3] = (uint64_t)dlsym(v1, "OBPrivacyFitnessPlusIdentifier");
    getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *getOBPrivacyFitnessPlusIdentifier(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPrivacyInfo.m", 51, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2F8A444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getOBPrivacyImproveFitnessPlusIdentifier()
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  uint64_t v9 = getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr)
  {
    uint64_t v1 = OnBoardingKitLibrary();
    v7[3] = (uint64_t)dlsym(v1, "OBPrivacyImproveFitnessPlusIdentifier");
    getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = *v0;
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *getOBPrivacyImproveFitnessPlusIdentifier(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPrivacyInfo.m", 52, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2F8A5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyImproveFitnessPlusIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getOBPrivacyFitnessPlusIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = OnBoardingKitLibrary();
  uint64_t result = dlsym(v2, "OBPrivacyFitnessPlusIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getOBPrivacyFitnessPlusIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t ICPBDGSPlayerInfoContextTokenReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            uint64_t v21 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_33:
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        char v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
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

void sub_1A2F8BFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2F8C6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  objc_destroyWeak(v36);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(v35);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  objc_destroyWeak(&a34);
  _Unwind_Resume(a1);
}

void sub_1A2F8DD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2F8E2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26230(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26231(uint64_t a1)
{
}

void sub_1A2F8E5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8E6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8E7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8E8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8E9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8EAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8EBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8ECD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8EDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8EECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F8EFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _ICLLPlaybackItemContainerReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
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
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = (v10 & 7) == 4;
        }
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v17 = 0;
              unsigned int v18 = 0;
              uint64_t v19 = 0;
              *(unsigned char *)(a1 + 44) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 24;
              goto LABEL_32;
            case 3u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 8;
              goto LABEL_32;
            case 4u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 16;
              goto LABEL_32;
            case 5u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 32;
LABEL_32:
              char v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_37;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_37:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
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
              goto LABEL_34;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_36;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_36:
          *(_DWORD *)(a1 + 40) = v19;
          goto LABEL_37;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__26589(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26590(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__26631(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26632(uint64_t a1)
{
}

uint64_t _ICLLAddQueueItemsActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
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
        *(unsigned char *)(a1 + 44) |= 4u;
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
            goto LABEL_52;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_54;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_54:
        uint64_t v35 = 40;
        goto LABEL_63;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
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
                LODWORD(v19) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_58:
        uint64_t v35 = 16;
        goto LABEL_63;
      case 3u:
        uint64_t v29 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLAddQueueItemsAction addItems:](a1, v29);
        if (!PBReaderPlaceMark() || (_ICLLPlaybackItemReadFrom((uint64_t)v29, a2) & 1) == 0) {
          goto LABEL_66;
        }
        goto LABEL_50;
      case 4u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_62:
        uint64_t v35 = 20;
LABEL_63:
        *(_DWORD *)(a1 + v35) = v19;
        goto LABEL_64;
      case 5u:
        uint64_t v29 = objc_alloc_init(_ICLLQueueQuery);
        objc_storeStrong((id *)(a1 + 24), v29);
        if (!PBReaderPlaceMark() || (_ICLLQueueQueryReadFrom((uint64_t)v29, a2) & 1) == 0) {
          goto LABEL_66;
        }
        goto LABEL_50;
      case 6u:
        uint64_t v29 = objc_alloc_init(_ICLLRadioSource);
        objc_storeStrong((id *)(a1 + 32), v29);
        if (PBReaderPlaceMark() && _ICLLRadioSourceReadFrom((uint64_t)v29, a2))
        {
LABEL_50:
          PBReaderRecallMark();

LABEL_64:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_66:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_64;
    }
  }
}

void sub_1A2F96DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27567(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27568(uint64_t a1)
{
}

void sub_1A2F9704C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _UserNotificationCallback(uint64_t a1, uint64_t a2)
{
  id v4 = +[ICUserNotificationManager sharedManager];
  [v4 _handleCallbackForUserNotification:a1 responseFlags:a2];
}

id ICMusicSubscriptionFairPlaySubscriptionKeyBagForResponseDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKey:@"sbKeyBag"];
  if (!v2)
  {
    uint64_t v2 = [v1 objectForKey:@"subKeyBag"];
  }
  if (_NSIsNSData())
  {
    id v3 = v2;
LABEL_7:
    id v4 = v3;
    goto LABEL_9;
  }
  if (_NSIsNSString())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_9:
  if ([v4 length]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

uint64_t ICSDelegationProviderServiceXPCGetInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF64EA40];
}

uint64_t ICCDelegationProviderServiceXPCGetInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B960];
}

BOOL ICIAMLogEventResponseReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  id v6 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_1A2F9B6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28524(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28525(uint64_t a1)
{
}

void sub_1A2F9B844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2F9B954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _ICLLPlaybackSyncCommandReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 2)
      {
        -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload](a1);
        *(unsigned char *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 2;
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24;
      }
      else
      {
        if (v17 != 1)
        {
          if (v17)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          else
          {
            unsigned int v18 = 0;
            while (1)
            {
              uint64_t v19 = *v3;
              unint64_t v20 = *(void *)(a2 + v19);
              if (v20 == -1 || v20 >= *(void *)(a2 + *v4)) {
                break;
              }
              unint64_t v21 = v20 + 1;
              int v22 = *(char *)(*(void *)(a2 + *v7) + v20);
              *(void *)(a2 + v19) = v21;
              if (v22 < 0 && v18++ <= 8) {
                continue;
              }
              goto LABEL_34;
            }
            *(unsigned char *)(a2 + *v5) = 1;
          }
          continue;
        }
        -[_ICLLPlaybackSyncCommand clearOneofValuesForPayload](a1);
        *(unsigned char *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 1;
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      uint64_t v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;

LABEL_34:
      ;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A2F9CCC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ICCloudServiceCapabilitiesGetDescription(__int16 a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:@"musicCatalogPlayback"];
    if ((a1 & 0x100) == 0)
    {
LABEL_3:
      if ((a1 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a1 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"addToCloudMusicLibrary"];
  if ((a1 & 2) != 0) {
LABEL_4:
  }
    [v3 addObject:@"musicCatalogSubscriptionEligible"];
LABEL_5:
  if (![v3 count]) {
    [v3 addObject:@"none"];
  }
  id v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

BOOL ICPBDGSFinishDelegationResponseReadFrom(uint64_t a1)
{
  id v2 = (int *)MEMORY[0x1E4F940E8];
  id v3 = (int *)MEMORY[0x1E4F940E0];
  id v4 = (int *)MEMORY[0x1E4F940C8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v6 = *(unsigned __int8 *)(a1 + *v4);
    if (*(void *)(a1 + *v2) >= *(void *)(a1 + *v3)) {
      return v6 == 0;
    }
    if (*(unsigned char *)(a1 + *v4))
    {
      int v6 = 1;
      return v6 == 0;
    }
    char v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = *v2;
      unint64_t v11 = *(void *)(a1 + v10);
      if (v11 == -1 || v11 >= *(void *)(a1 + *v3)) {
        break;
      }
      char v12 = *(unsigned char *)(*(void *)(a1 + *v5) + v11);
      *(void *)(a1 + v10) = v11 + 1;
      v9 |= (unint64_t)(v12 & 0x7F) << v7;
      if ((v12 & 0x80) == 0) {
        goto LABEL_12;
      }
      v7 += 7;
      if (v8++ >= 9)
      {
        LOBYTE(v9) = 0;
        int v6 = *(unsigned __int8 *)(a1 + *v4);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a1 + *v4) = 1;
LABEL_12:
    int v6 = *(unsigned __int8 *)(a1 + *v4);
    if (*(unsigned char *)(a1 + *v4)) {
      LOBYTE(v9) = 0;
    }
LABEL_14:
    if (v6) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = (v9 & 7) == 4;
    }
    if (v14) {
      return v6 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t ICPBDGSRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 101)
      {
        uint64_t v24 = objc_alloc_init(ICPBDGSFinishDelegationRequest);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ICPBDGSFinishDelegationRequestReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if (v17 != 100)
        {
          if (v17 == 1)
          {
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
                goto LABEL_37;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_39:
            *(_DWORD *)(a1 + 24) = v20;
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
        uint64_t v24 = objc_alloc_init(ICPBDGSStartDelegationRequest);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (ICPBDGSStartDelegationRequestReadFrom((uint64_t)v24, a2) & 1) == 0) {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _ICLLServerNoticeActionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
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
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v17;
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

uint64_t __Block_byref_object_copy__29545(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29546(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__29888(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29889(uint64_t a1)
{
}

uint64_t _ICLLQueueReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  char v7 = (int *)MEMORY[0x1E4F940B8];
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
    int v16 = v10 & 7;
    if (v15 || v16 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 56;
        goto LABEL_53;
      case 2u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 68) |= 4u;
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
                LODWORD(v22) = 0;
                goto LABEL_64;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_64:
        uint64_t v45 = 64;
        goto LABEL_73;
      case 3u:
        uint64_t v26 = objc_alloc_init(_ICLLPlaybackItem);
        -[_ICLLQueue addItems:](a1, v26);
        if PBReaderPlaceMark() && (_ICLLPlaybackItemReadFrom((uint64_t)v26, a2))
        {
          PBReaderRecallMark();

LABEL_74:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 68) |= 2u;
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
            v22 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_68:
        uint64_t v45 = 44;
        goto LABEL_73;
      case 5u:
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v33 = 0;
            unsigned int v34 = 0;
            uint64_t v35 = 0;
            while (1)
            {
              uint64_t v36 = *v3;
              unint64_t v37 = *(void *)(a2 + v36);
              if (v37 == -1 || v37 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_49;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          while (1)
          {
            uint64_t v49 = *v3;
            unint64_t v50 = *(void *)(a2 + v49);
            if (v50 == -1 || v50 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
            *(void *)(a2 + v49) = v50 + 1;
            v48 |= (unint64_t)(v51 & 0x7F) << v46;
            if (v51 < 0)
            {
              v46 += 7;
              BOOL v14 = v47++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_85;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_85:
          PBRepeatedInt32Add();
        }
        goto LABEL_74;
      case 7u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 32;
LABEL_53:
        char v39 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_74;
      case 8u:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 68) |= 1u;
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
            v22 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v14 = v41++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_72:
        uint64_t v45 = 40;
LABEL_73:
        *(_DWORD *)(a1 + v45) = v22;
        goto LABEL_74;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_74;
    }
  }
}

void sub_1A2FAD364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ICIAMParameterReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ICSQLiteGetRelatedFilePath(void *a1, uint64_t a2)
{
  id v4 = a1;
  uint64_t v5 = v4;
  if (a2)
  {
    if (a2 != 1) {
      goto LABEL_6;
    }
    int v6 = @"-wal";
  }
  else
  {
    int v6 = @"-shm";
  }
  id v2 = [v4 stringByAppendingString:v6];
LABEL_6:

  return v2;
}

id ICSQLiteGetCurrentError(sqlite3 *a1)
{
  int v2 = sqlite3_errcode(a1);
  if (v2)
  {
    int v3 = v2;
    id v4 = (char *)sqlite3_errmsg(a1);
    if (v4)
    {
      uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:v4];
      id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v4 = (char *)objc_msgSend(v6, "initWithObjectsAndKeys:", v5, *MEMORY[0x1E4F28568], 0);
    }
    char v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICSQLiteError" code:v3 userInfo:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

BOOL ICSQLiteTruncateDatabase(void *a1)
{
  ppDb = 0;
  if (sqlite3_open_v2((const char *)[a1 fileSystemRepresentation], &ppDb, 2, 0))
  {
    return 0;
  }
  int v3 = 129;
  BOOL v1 = sqlite3_file_control(ppDb, 0, 101, &v3) == 0;
  sqlite3_close(ppDb);
  return v1;
}

uint64_t __Block_byref_object_copy__30924(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30925(uint64_t a1)
{
}

void sub_1A2FB21E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A2FB4488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2FB58A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2FB6494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ICKnownProcessNameForSystemApplication(void *a1)
{
  uint64_t v1 = ICKnownProcessNameForSystemApplication_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ICKnownProcessNameForSystemApplication_onceToken, &__block_literal_global_58);
  }
  int v3 = [(id)ICKnownProcessNameForSystemApplication___bundleIdentifierToProcessNameMap objectForKeyedSubscript:v2];

  return v3;
}

void __ICKnownProcessNameForSystemApplication_block_invoke()
{
  uint64_t v0 = (void *)ICKnownProcessNameForSystemApplication___bundleIdentifierToProcessNameMap;
  ICKnownProcessNameForSystemApplication___bundleIdentifierToProcessNameMap = (uint64_t)&unk_1EF640BE0;
}

id ICKnownClientVersionForSystemApplication(void *a1)
{
  uint64_t v1 = ICKnownClientVersionForSystemApplication_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ICKnownClientVersionForSystemApplication_onceToken, &__block_literal_global_82_31377);
  }
  int v3 = [(id)ICKnownClientVersionForSystemApplication___bundleIdentifierToClientVersionMap objectForKeyedSubscript:v2];

  return v3;
}

void __ICKnownClientVersionForSystemApplication_block_invoke()
{
  uint64_t v0 = (void *)ICKnownClientVersionForSystemApplication___bundleIdentifierToClientVersionMap;
  ICKnownClientVersionForSystemApplication___bundleIdentifierToClientVersionMap = (uint64_t)&unk_1EF640C08;
}

void getML3TrackPropertyTitle()
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getML3TrackPropertyTitleSymbolLoc_ptr;
  uint64_t v9 = getML3TrackPropertyTitleSymbolLoc_ptr;
  if (!getML3TrackPropertyTitleSymbolLoc_ptr)
  {
    uint64_t v1 = MusicLibraryLibrary();
    v7[3] = (uint64_t)dlsym(v1, "ML3TrackPropertyTitle");
    getML3TrackPropertyTitleSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    id v2 = *v0;
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *getML3TrackPropertyTitle(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPlaybackPositionEntity.m", 17, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2FB9A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyAlbum()
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getML3TrackPropertyAlbumSymbolLoc_ptr;
  uint64_t v9 = getML3TrackPropertyAlbumSymbolLoc_ptr;
  if (!getML3TrackPropertyAlbumSymbolLoc_ptr)
  {
    uint64_t v1 = MusicLibraryLibrary();
    v7[3] = (uint64_t)dlsym(v1, "ML3TrackPropertyAlbum");
    getML3TrackPropertyAlbumSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    id v2 = *v0;
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *getML3TrackPropertyAlbum(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPlaybackPositionEntity.m", 18, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2FB9B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyArtist()
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getML3TrackPropertyArtistSymbolLoc_ptr;
  uint64_t v9 = getML3TrackPropertyArtistSymbolLoc_ptr;
  if (!getML3TrackPropertyArtistSymbolLoc_ptr)
  {
    uint64_t v1 = MusicLibraryLibrary();
    v7[3] = (uint64_t)dlsym(v1, "ML3TrackPropertyArtist");
    getML3TrackPropertyArtistSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    id v2 = *v0;
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *getML3TrackPropertyArtist(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPlaybackPositionEntity.m", 19, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2FB9CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyPodcastExternalGUID()
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr;
  uint64_t v9 = getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr;
  if (!getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr)
  {
    uint64_t v1 = MusicLibraryLibrary();
    v7[3] = (uint64_t)dlsym(v1, "ML3TrackPropertyPodcastExternalGUID");
    getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    id v2 = *v0;
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *getML3TrackPropertyPodcastExternalGUID(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPlaybackPositionEntity.m", 20, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2FB9E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getML3TrackPropertyFeedURL()
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (void **)getML3TrackPropertyFeedURLSymbolLoc_ptr;
  uint64_t v9 = getML3TrackPropertyFeedURLSymbolLoc_ptr;
  if (!getML3TrackPropertyFeedURLSymbolLoc_ptr)
  {
    uint64_t v1 = MusicLibraryLibrary();
    v7[3] = (uint64_t)dlsym(v1, "ML3TrackPropertyFeedURL");
    getML3TrackPropertyFeedURLSymbolLoc_ptr = v7[3];
    uint64_t v0 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    id v2 = *v0;
    id v3 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *getML3TrackPropertyFeedURL(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ICPlaybackPositionEntity.m", 21, @"%s", dlerror());

    __break(1u);
  }
}

void sub_1A2FB9FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *ICPlaybackPositionEntityIdentifierForProperties(void *a1, void *a2)
{
  v82[0] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v71 = a2;
  id v4 = [MEMORY[0x1E4F28E78] string];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v73 objects:v77 count:16];
  char v7 = v4;
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v74;
  while (2)
  {
    unint64_t v10 = v5;
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v74 != v9) {
        objc_enumerationMutation(v10);
      }
      unint64_t v12 = [v71 objectForKey:*(void *)(*((void *)&v73 + 1) + 8 * i)];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 absoluteString];
LABEL_11:
        BOOL v14 = (void *)v13;

        unint64_t v12 = v14;
        id v4 = v7;
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [v12 stringValue];
        goto LABEL_11;
      }
LABEL_12:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v12 length])
      {

        id v5 = v10;
        goto LABEL_19;
      }
      [v4 appendString:v12];
    }
    id v5 = v10;
    uint64_t v8 = [v10 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_16:

  if (![v4 length])
  {
LABEL_19:
    int v16 = 0;
    goto LABEL_20;
  }
  memset(v72, 0, sizeof(v72));
  CC_MD5_Init((CC_MD5_CTX *)v72);
  id v15 = v4;
  CC_MD5_Update((CC_MD5_CTX *)v72, (const void *)[v15 UTF8String], objc_msgSend(v15, "length"));

  memset(&v78[8], 0, 64);
  *(void *)char v78 = 4000;
  id v4 = v7;
  CC_MD5_Final(&v78[8], (CC_MD5_CTX *)v72);
  v79[0] = *(_OWORD *)v78;
  v79[1] = *(_OWORD *)&v78[16];
  v79[2] = *(_OWORD *)&v78[32];
  v79[3] = *(_OWORD *)&v78[48];
  uint64_t v80 = *(void *)&v78[64];
  if (*(uint64_t *)v78 > 3999)
  {
    if (*(uint64_t *)v78 > 4255)
    {
      if (*(void *)v78 == 4256)
      {
        id v18 = v5;
        uint64_t v63 = (unsigned __int8 *)v79 + 8;
        uint64_t v64 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v65 = v64;
        for (uint64_t j = 0; j != 64; j += 2)
        {
          unsigned int v67 = *v63++;
          unsigned int v68 = &v64[j];
          *unsigned int v68 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v67 >> 4];
          v68[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v67 & 0xF];
        }
        id v31 = [NSString alloc];
        uint64_t v32 = v65;
        uint64_t v33 = 64;
      }
      else
      {
        if (*(void *)v78 != 4512) {
          goto LABEL_70;
        }
        id v18 = v5;
        unsigned int v41 = (unsigned __int8 *)v79 + 8;
        uint64_t v42 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        unint64_t v43 = v42;
        for (uint64_t k = 0; k != 128; k += 2)
        {
          unsigned int v45 = *v41++;
          char v46 = &v42[k];
          *char v46 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v45 >> 4];
          v46[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v45 & 0xF];
        }
        id v31 = [NSString alloc];
        uint64_t v32 = v43;
        uint64_t v33 = 128;
      }
    }
    else if (*(void *)v78 == 4000)
    {
      id v18 = v5;
      char v53 = (unsigned __int8 *)v79 + 8;
      unsigned int v54 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v55 = v54;
      for (uint64_t m = 0; m != 32; m += 2)
      {
        unsigned int v57 = *v53++;
        unint64_t v58 = &v54[m];
        *unint64_t v58 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v57 >> 4];
        v58[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v57 & 0xF];
      }
      id v31 = [NSString alloc];
      uint64_t v32 = v55;
      uint64_t v33 = 32;
    }
    else
    {
      if (*(void *)v78 != 4001) {
        goto LABEL_70;
      }
      id v18 = v5;
      char v25 = (unsigned __int8 *)v79 + 8;
      uint64_t v26 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      char v27 = v26;
      for (uint64_t n = 0; n != 40; n += 2)
      {
        unsigned int v29 = *v25++;
        unint64_t v30 = &v26[n];
        *unint64_t v30 = MSVFastHexStringFromBytes_hexCharacters_41692[(unint64_t)v29 >> 4];
        v30[1] = MSVFastHexStringFromBytes_hexCharacters_41692[v29 & 0xF];
      }
      id v31 = [NSString alloc];
      uint64_t v32 = v27;
      uint64_t v33 = 40;
    }
    CFStringRef v52 = (CFStringRef)[v31 initWithBytesNoCopy:v32 length:v33 encoding:4 freeWhenDone:1];
    goto LABEL_69;
  }
  if (*(uint64_t *)v78 > 2999)
  {
    if (*(void *)v78 == 3000)
    {
      LODWORD(v81[0]) = bswap32(DWORD2(v79[0]));
      char v59 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v60 = 0;
      char v61 = v59 + 1;
      do
      {
        unint64_t v62 = *((unsigned __int8 *)v81 + v60);
        *(v61 - 1) = MSVFastHexStringFromBytes_hexCharacters_41692[v62 >> 4];
        *char v61 = MSVFastHexStringFromBytes_hexCharacters_41692[v62 & 0xF];
        v61 += 2;
        ++v60;
      }
      while (v60 != 4);
      id v38 = [NSString alloc];
      char v39 = v59;
      uint64_t v40 = 8;
    }
    else
    {
      if (*(void *)v78 != 3001) {
        goto LABEL_70;
      }
      v81[0] = bswap64(*((unint64_t *)&v79[0] + 1));
      unsigned int v34 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v35 = 0;
      uint64_t v36 = v34 + 1;
      do
      {
        unint64_t v37 = *((unsigned __int8 *)v81 + v35);
        *(v36 - 1) = MSVFastHexStringFromBytes_hexCharacters_41692[v37 >> 4];
        *uint64_t v36 = MSVFastHexStringFromBytes_hexCharacters_41692[v37 & 0xF];
        v36 += 2;
        ++v35;
      }
      while (v35 != 8);
      id v38 = [NSString alloc];
      char v39 = v34;
      uint64_t v40 = 16;
    }
    int v16 = (__CFString *)[v38 initWithBytesNoCopy:v39 length:v40 encoding:4 freeWhenDone:1];
    goto LABEL_20;
  }
  if (*(void *)v78 == 1000)
  {
    id v18 = v5;
    uint64_t v47 = *((void *)&v79[0] + 1);
    uint64_t v48 = (char *)v82 + 1;
    uint64_t quot = *((void *)&v79[0] + 1);
    do
    {
      lldiv_t v50 = lldiv(quot, 10);
      uint64_t quot = v50.quot;
      if (v50.rem >= 0) {
        LOBYTE(v51) = v50.rem;
      }
      else {
        uint64_t v51 = -v50.rem;
      }
      *(v48 - 2) = v51 + 48;
      unint64_t v24 = (const UInt8 *)(v48 - 2);
      --v48;
    }
    while (v50.quot);
    if (v47 < 0)
    {
      *(v48 - 2) = 45;
      unint64_t v24 = (const UInt8 *)(v48 - 2);
    }
    uint64_t v23 = (char *)((char *)v82 - (char *)v24);
LABEL_57:
    CFStringRef v52 = CFStringCreateWithBytes(0, v24, (CFIndex)v23, 0x8000100u, 0);
LABEL_69:
    int v16 = (__CFString *)v52;
    id v5 = v18;
    goto LABEL_20;
  }
  if (*(void *)v78 == 2000)
  {
    id v18 = v5;
    uint64_t v19 = DWORD2(v79[0]);
    char v20 = v82;
    do
    {
      ldiv_t v21 = ldiv(v19, 10);
      uint64_t v19 = v21.quot;
      if (v21.rem >= 0) {
        LOBYTE(v22) = v21.rem;
      }
      else {
        uint64_t v22 = -v21.rem;
      }
      *((unsigned char *)v20 - 1) = v22 + 48;
      char v20 = (void *)((char *)v20 - 1);
    }
    while (v21.quot);
    uint64_t v23 = (char *)((char *)v82 - (char *)v20);
    unint64_t v24 = (const UInt8 *)v20;
    goto LABEL_57;
  }
LABEL_70:
  uint64_t v69 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v70 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v69 handleFailureInFunction:v70 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  int v16 = &stru_1EF5F5C40;
LABEL_20:

  return v16;
}

void *__getML3TrackPropertyFeedURLSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MusicLibraryLibrary();
  uint64_t result = dlsym(v2, "ML3TrackPropertyFeedURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getML3TrackPropertyFeedURLSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *MusicLibraryLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MusicLibraryLibraryCore_frameworkLibrary_31556)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MusicLibraryLibraryCore_block_invoke_31557;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5ACB290;
    uint64_t v6 = 0;
    MusicLibraryLibraryCore_frameworkLibrary_31556 = _sl_dlopen();
  }
  uint64_t v0 = (void *)MusicLibraryLibraryCore_frameworkLibrary_31556;
  if (!MusicLibraryLibraryCore_frameworkLibrary_31556)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *MusicLibraryLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICPlaybackPositionEntity.m", 16, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MusicLibraryLibraryCore_block_invoke_31557()
{
  uint64_t result = _sl_dlopen();
  MusicLibraryLibraryCore_frameworkLibrary_31556 = result;
  return result;
}

void *__getML3TrackPropertyPodcastExternalGUIDSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MusicLibraryLibrary();
  uint64_t result = dlsym(v2, "ML3TrackPropertyPodcastExternalGUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getML3TrackPropertyPodcastExternalGUIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getML3TrackPropertyArtistSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MusicLibraryLibrary();
  uint64_t result = dlsym(v2, "ML3TrackPropertyArtist");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getML3TrackPropertyArtistSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getML3TrackPropertyAlbumSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MusicLibraryLibrary();
  uint64_t result = dlsym(v2, "ML3TrackPropertyAlbum");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getML3TrackPropertyAlbumSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getML3TrackPropertyTitleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = MusicLibraryLibrary();
  uint64_t result = dlsym(v2, "ML3TrackPropertyTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getML3TrackPropertyTitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AirPlaySupportLibraryCore()
{
  if (!AirPlaySupportLibraryCore_frameworkLibrary) {
    AirPlaySupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return AirPlaySupportLibraryCore_frameworkLibrary;
}

uint64_t getAPSSettingsGetInt64SymbolLoc()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAPSSettingsGetInt64SymbolLoc_ptr;
  uint64_t v6 = getAPSSettingsGetInt64SymbolLoc_ptr;
  if (!getAPSSettingsGetInt64SymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getAPSSettingsGetInt64SymbolLoc_block_invoke;
    v2[3] = &unk_1E5ACD4F0;
    v2[4] = &v3;
    __getAPSSettingsGetInt64SymbolLoc_block_invoke(v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A2FBC844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAPSSettingsGetInt64SymbolLoc_block_invoke(void *a1)
{
  uint64_t v2 = AirPlaySupportLibraryCore();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
  }
  else
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *AirPlaySupportLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICDelegationServiceSecuritySettings.m", 20, @"%s", 0);

    __break(1u);
    free(v5);
  }
  uint64_t result = dlsym(v3, "APSSettingsGetInt64");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getAPSSettingsGetInt64SymbolLoc_ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __AirPlaySupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AirPlaySupportLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A2FBD2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31841(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31842(uint64_t a1)
{
}

uint64_t _ICLLErrorMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v32 = 12;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = *(void **)(a1 + 16);
            *(void *)(a1 + 16) = v18;
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
          *(void *)(a2 + v2_Block_object_dispose(&a9, 8) = v29 + 1;
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
        uint64_t v32 = 8;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__32226(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32227(uint64_t a1)
{
}

void sub_1A2FC1840(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32408(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32409(uint64_t a1)
{
}

void sub_1A2FC2AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32568(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32569(uint64_t a1)
{
}

void sub_1A2FC4C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMCProfileConnectionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E5ACD4F0;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A2FC4D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMCFeatureExplicitContentAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureExplicitContentAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureExplicitContentAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *ManagedConfigurationLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5ACB9E8;
    uint64_t v6 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *ManagedConfigurationLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICLiveLinkQRConnectionDataSource.m", 32, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *__getMCFeatureMusicVideosAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureMusicVideosAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureMusicVideosAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

void __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  ManagedConfigurationLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MCProfileConnection");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getMCProfileConnectionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ICLiveLinkQRConnectionDataSource.m", 33, @"Unable to find class %s", "MCProfileConnection");

    __break(1u);
  }
}

void sub_1A2FC62C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33316(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33317(uint64_t a1)
{
}

__CFString *NSStringFromICLiveLinkEventType(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown/type=%ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5ACBA80[a1];
  }

  return v1;
}

uint64_t _ICLLPlaybackSyncActionReadFrom(uint64_t a1, uint64_t a2)
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 2)
      {
        -[_ICLLPlaybackSyncAction clearOneofValuesForPayload](a1);
        *(unsigned char *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 2;
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 24;
      }
      else
      {
        if (v17 != 1)
        {
          if (v17)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          else
          {
            unsigned int v18 = 0;
            while (1)
            {
              uint64_t v19 = *v3;
              unint64_t v20 = *(void *)(a2 + v19);
              if (v20 == -1 || v20 >= *(void *)(a2 + *v4)) {
                break;
              }
              unint64_t v21 = v20 + 1;
              int v22 = *(char *)(*(void *)(a2 + *v7) + v20);
              *(void *)(a2 + v19) = v21;
              if (v22 < 0 && v18++ <= 8) {
                continue;
              }
              goto LABEL_34;
            }
            *(unsigned char *)(a2 + *v5) = 1;
          }
          continue;
        }
        -[_ICLLPlaybackSyncAction clearOneofValuesForPayload](a1);
        *(unsigned char *)(a1 + 32) |= 1u;
        *(_DWORD *)(a1 + 16) = 1;
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      char v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;

LABEL_34:
      ;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A2FD3738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35471(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35472(uint64_t a1)
{
}

void sub_1A2FD3EDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A2FD4FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2FD5904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1A2FD6528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35695(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35696(uint64_t a1)
{
}

uint64_t ICIAMSynchronizeMessagesRequestReadFrom(uint64_t a1, uint64_t a2)
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
          *(unsigned char *)(a1 + 36) |= 1u;
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
              goto LABEL_44;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_46:
          uint64_t v37 = 8;
          goto LABEL_51;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
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
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_50:
          uint64_t v37 = 16;
LABEL_51:
          *(void *)(a1 + v37) = v19;
          continue;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          char v30 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v29;

          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
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
        uint64_t v34 = *v3;
        unint64_t v35 = *(void *)(a2 + v34);
        if (v35 == -1 || v35 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0) {
          goto LABEL_53;
        }
        v31 += 7;
        BOOL v14 = v32++ >= 9;
        if (v14)
        {
          uint64_t v33 = 0;
          goto LABEL_55;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v33 = 0;
      }
LABEL_55:
      *(unsigned char *)(a1 + 32) = v33 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A2FD7780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35829(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35830(uint64_t a1)
{
}

void sub_1A2FD7A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

id ICDelegateAccountStorePrimaryKeyForUserIdentity(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 DSID];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 stringValue];
  }
  else
  {
    long long v5 = [v1 deviceIdentifier];
    if ([v5 length]) {
      id v4 = v5;
    }
    else {
      id v4 = 0;
    }
  }

  return v4;
}

void sub_1A2FDAB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2FDC008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _ICMusicSubscriptionStatusMonitorHandleActiveUserIdentityDidChangeRemoteNotification(uint64_t a1, void *a2)
{
  return [a2 _handleActiveUserIdentityDidChangeRemoteNotification];
}

void sub_1A2FDE19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36755(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36756(uint64_t a1)
{
}

void sub_1A2FDE3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2FDE52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2FDE778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36918(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36919(uint64_t a1)
{
}

uint64_t ICPBDGSPlayerInfoContextRequestTokenReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 != 2)
      {
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_47;
        }
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
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
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_41:
        uint64_t v32 = 8;
        goto LABEL_46;
      }
      uint64_t v29 = PBReaderReadData();
      char v30 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v29;

LABEL_47:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v24 = 0;
    unsigned int v25 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 32) |= 2u;
    while (1)
    {
      uint64_t v26 = *v3;
      unint64_t v27 = *(void *)(a2 + v26);
      if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
      *(void *)(a2 + v26) = v27 + 1;
      v20 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0) {
        goto LABEL_43;
      }
      v24 += 7;
      BOOL v14 = v25++ >= 9;
      if (v14)
      {
        uint64_t v20 = 0;
        goto LABEL_45;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v20 = 0;
    }
LABEL_45:
    uint64_t v32 = 16;
LABEL_46:
    *(void *)(a1 + v32) = v20;
    goto LABEL_47;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL _ICLLCurrentItemTransitionActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        unsigned int v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _ICLLRemoveQueueItemCommandReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
          *(unsigned char *)(a1 + 40) |= 2u;
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
              goto LABEL_42;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_44;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_42:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_44:
          uint64_t v33 = 36;
          goto LABEL_49;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 8;
          goto LABEL_40;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        case 4u:
          char v31 = PBReaderReadString();
          if (v31) {
            -[_ICLLRemoveQueueItemCommand addItemIdsToRemove:](a1, v31);
          }

          continue;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
LABEL_40:
          uint64_t v32 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

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
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
        *(void *)(a2 + v2_Block_object_dispose(&a9, 8) = v29 + 1;
        v19 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0) {
          goto LABEL_46;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_48:
      uint64_t v33 = 32;
LABEL_49:
      *(_DWORD *)(a1 + v33) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _ICLLAvailabilityReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
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
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 60) |= 1u;
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
            goto LABEL_58;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            uint64_t v28 = 0;
            goto LABEL_60;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_60:
        *(unsigned char *)(a1 + 56) = v28 != 0;
        goto LABEL_77;
      }
      if (v18 == 2) {
        break;
      }
      if (v18 == 1)
      {
        if (v16 != 2)
        {
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          while (1)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_76;
          }
LABEL_75:
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_76:
          PBRepeatedInt32Add();
          goto LABEL_77;
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
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
            if (v25 < 0)
            {
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_33;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
          PBRepeatedInt32Add();
        }
LABEL_56:
        PBReaderRecallMark();
        goto LABEL_77;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_77:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    if (v16 != 2)
    {
      char v44 = 0;
      unsigned int v45 = 0;
      uint64_t v46 = 0;
      while (1)
      {
        uint64_t v47 = *v3;
        unint64_t v48 = *(void *)(a2 + v47);
        if (v48 == -1 || v48 >= *(void *)(a2 + *v4)) {
          goto LABEL_75;
        }
        char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
        *(void *)(a2 + v47) = v48 + 1;
        v46 |= (unint64_t)(v49 & 0x7F) << v44;
        if (v49 < 0)
        {
          v44 += 7;
          BOOL v14 = v45++ >= 9;
          if (!v14) {
            continue;
          }
        }
        goto LABEL_76;
      }
    }
    uint64_t result = PBReaderPlaceMark();
    if (!result) {
      return result;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
    {
      char v32 = 0;
      unsigned int v33 = 0;
      uint64_t v34 = 0;
      while (1)
      {
        uint64_t v35 = *v3;
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if (v37 < 0)
        {
          v32 += 7;
          BOOL v14 = v33++ >= 9;
          if (!v14) {
            continue;
          }
        }
        goto LABEL_53;
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
      PBRepeatedInt32Add();
    }
    goto LABEL_56;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__37607(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37608(uint64_t a1)
{
}

__CFString *ICNSStringForICMediaContentTasteItem(unint64_t a1)
{
  if (a1 > 8) {
    return @"Unknown Media Entity Type";
  }
  else {
    return off_1E5ACCCA8[a1];
  }
}

__CFString *ICNSStringForICMediaContentTaste(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown Content Taste Type";
  }
  else {
    return off_1E5ACCCF0[a1];
  }
}

void sub_1A2FE48A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37878(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37879(uint64_t a1)
{
}

void sub_1A2FE4DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A2FE5234(void *a1)
{
}

void sub_1A2FE5240(_Unwind_Exception *a1)
{
}

void sub_1A2FE5D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1A2FE7BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Block_object_dispose((const void *)(v35 - 112), 8);
  _Unwind_Resume(a1);
}

double ICStoreVideoArtworkInfoBestSizesForSize(void *a1, double a2, double a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    double v11 = v7;
    double v12 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) CGSizeValue];
        if (v14 >= a2 && v15 >= a3)
        {
          if (v12 == v6 && v11 == v7 || (v14 < v12 ? (BOOL v17 = v15 < v11) : (BOOL v17 = 0), v17))
          {
            double v11 = v15;
            double v12 = v14;
          }
        }
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    double v12 = v6;
  }

  return v12;
}

void sub_1A2FED088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38458(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38459(uint64_t a1)
{
}

void sub_1A2FED1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2FED2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2FEF144(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_1A2FEF164(void *a1)
{
}

void sub_1A2FEF374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38639(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38640(uint64_t a1)
{
}

void sub_1A2FEF620(_Unwind_Exception *a1)
{
}

void sub_1A2FEF640(void *a1)
{
}

void sub_1A2FEF830(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__38945(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38946(uint64_t a1)
{
}

BOOL ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest(void *a1)
{
  char v1 = [a1 request];
  uint64_t v2 = [v1 URL];
  uint64_t v3 = [v2 scheme];
  BOOL v4 = [v3 rangeOfString:@"skd" options:1] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

uint64_t _ICLLClientInfoActionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
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
      if ((v10 >> 3) == 2)
      {
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v23 += 7;
          BOOL v14 = v24++ >= 9;
          if (v14)
          {
            uint64_t v25 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_43:
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
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
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
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

uint64_t __Block_byref_object_copy__39791(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__39792(uint64_t a1)
{
}

uint64_t __CoreWiFiLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreWiFiLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL ICEnvironmentNetworkTypeIsCellular(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0x1F3;
}

BOOL ICEnvironmentNetworkLinkQualityIsHigh(unint64_t a1)
{
  return a1 > 0x31;
}

__CFString *ICEnvironmentNetworkLinkQualityDescription(unint64_t a1)
{
  char v1 = @"fair";
  if (a1 < 0x14) {
    char v1 = @"low";
  }
  if (a1 <= 0x31) {
    return v1;
  }
  else {
    return @"high";
  }
}

BOOL ICEnvironmentNetworkTypeIsBluetooth(uint64_t a1)
{
  return (unint64_t)(a1 - 500) < 0x1F4;
}

BOOL ICEnvironmentNetworkTypeIsWired(uint64_t a1)
{
  return a1 > 1999;
}

BOOL ICEnvironmentNetworkTypeIsWifi(uint64_t a1)
{
  return (unint64_t)(a1 - 1000) < 0x3E8;
}

BOOL ICEnvironmentNetworkLinkQualityIsLow(unint64_t a1)
{
  return a1 < 0x14;
}

uint64_t __Block_byref_object_copy__40373(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40374(uint64_t a1)
{
}

__CFString *ICMusicSubscriptionStatusTypeGetDescription(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_1E5ACD828[a1];
  }
}

__CFString *ICMusicSubscriptionStatusReasonTypeGetDescription(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_1E5ACD848[a1];
  }
}

uint64_t _WiFiCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _wifiCallBack:a2];
}

uint64_t ICIAMSerialCheckResponseReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
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
        *(void *)(a1 + _Block_object_dispose(&a9, 8) = v19;
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

BOOL ICIAMApplicationBadgeReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  BOOL v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(&a9, 8) = v17;

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
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 8;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D8550](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CFURLResponseCopyPeerAddress()
{
  return MEMORY[0x1F40D54D0]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x1F410DCD8]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E8680](*(void *)&mainPort, *(void *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8EF0](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1F40E9100]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1F40E9110]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1F40E91C8](*(void *)&entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1F417CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F930]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MRAVAirPlaySecuritySettingsGetPassword()
{
  return MEMORY[0x1F412DAE0]();
}

uint64_t MRAVAirPlaySecuritySettingsGetSecurityMode()
{
  return MEMORY[0x1F412DAE8]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return MEMORY[0x1F412E520]();
}

uint64_t MRMediaRemoteGetReceiverAirPlaySecuritySettings()
{
  return MEMORY[0x1F412E608]();
}

uint64_t MRMediaRemoteGetSavedAVRoutePassword()
{
  return MEMORY[0x1F412E610]();
}

uint64_t MSVBundleIDForAuditToken()
{
  return MEMORY[0x1F412EB88]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x1F412EBB8]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1F412EBD8]();
}

uint64_t MSVGzipCompressData()
{
  return MEMORY[0x1F412EC28]();
}

uint64_t MSVGzipDecompressData()
{
  return MEMORY[0x1F412EC30]();
}

uint64_t MSVHasherSharedSeed()
{
  return MEMORY[0x1F412EC38]();
}

uint64_t MSVMediaLoggingDirectory()
{
  return MEMORY[0x1F412EC88]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x1F412EC90]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1F412EC98]();
}

uint64_t MSVTCCIdentityForCurrentProcess()
{
  return MEMORY[0x1F412ECE0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
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

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
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

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1F4147388]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x1F4116918]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x1F4116928]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x1F4116930]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x1F4116978]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x1F41169D0]();
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1F4101FF8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4102010](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102028](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1F4102030](prefs, callout, context);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102070](prefs, runLoop, runLoopMode);
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x1F40F7038]();
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1F40F7200](trust, queue, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1F415CBB8]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1F415CBD8]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC18]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x1F415CC30]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1F40DF020]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1F40DF1D0]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1F40D94A8]();
}

uint64_t _NSIsNSDate()
{
  return MEMORY[0x1F40D94B0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t chacha20_poly1305_decrypt_all_64x64()
{
  return MEMORY[0x1F4116CD0]();
}

uint64_t chacha20_poly1305_encrypt_all_64x64()
{
  return MEMORY[0x1F4116CF0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC810](a1, a2);
  result.reuint64_t m = v3;
  result.uint64_t quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC850](a1, a2);
  result.reuint64_t m = v3;
  result.uint64_t quot = v2;
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
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

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x1F412ED20]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1F40F75C0](trust);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FF0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1F4182270](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41823C0](pStmt);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}