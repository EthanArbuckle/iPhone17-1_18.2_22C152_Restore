@interface RSScanCoaching
- (RSScanCoaching)init;
- (id).cxx_construct;
@end

@implementation RSScanCoaching

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  v3 = (char *)self + 32;
  *((void *)self + 2) = 0x43FA000040400000;
  *((_DWORD *)self + 6) = 1057467924;
  v4 = (void *)((char *)self + 216);
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((void *)self + 34) = 0;
  v5 = malloc_type_malloc(0x80uLL, 0x100004000313F17uLL);
  v6 = v5;
  if (v5)
  {
    v5[4] = xmmword_25B5F21A8;
    v5[5] = unk_25B5F21B8;
    v5[6] = xmmword_25B5F21C8;
    v5[7] = unk_25B5F21D8;
    _OWORD *v5 = xmmword_25B5F2168;
    v5[1] = unk_25B5F2178;
    v5[2] = xmmword_25B5F2188;
    v5[3] = unk_25B5F2198;
  }
  v7 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
  v8 = v7;
  if (v7)
  {
    _OWORD *v7 = xmmword_25B5F21E8;
    v7[1] = unk_25B5F21F8;
    v7[2] = xmmword_25B5F2208;
    v7[3] = unk_25B5F2218;
  }
  v9 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
  v10 = v9;
  if (v9)
  {
    _OWORD *v9 = xmmword_25B5F2228;
    v9[1] = unk_25B5F2238;
    v9[2] = xmmword_25B5F2248;
    v9[3] = unk_25B5F2258;
  }
  v11 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v12 = v11;
  if (v11) {
    void *v11 = 0xBFFDEADA80000000;
  }
  int v13 = *((_DWORD *)self + 54);
  int v14 = *((_DWORD *)self + 55);
  v15 = (void *)*((void *)self + 28);
  if (v14 * v13 == 16)
  {
    if (v15 && v6) {
      memcpy(v15, v6, 8 * v13 * (uint64_t)v14);
    }
    void *v4 = 0x200000008;
  }
  else
  {
    if (v15)
    {
      free(v15);
      *((void *)self + 28) = 0;
    }
    void *v4 = 0x200000008;
    v16 = malloc_type_malloc(0x80uLL, 0x100004000313F17uLL);
    *((void *)self + 28) = v16;
    if (v16 && v6) {
      memcpy(v16, v6, 8 * *((int *)self + 54) * (uint64_t)*((int *)self + 55));
    }
  }
  int v17 = *((_DWORD *)self + 58);
  int v18 = *((_DWORD *)self + 59);
  v19 = (void *)*((void *)self + 30);
  if (v18 * v17 == 8)
  {
    if (v19 && v8) {
      memcpy(v19, v8, 8 * v17 * (uint64_t)v18);
    }
    *((void *)self + 29) = 0x100000008;
  }
  else
  {
    if (v19)
    {
      free(v19);
      *((void *)self + 30) = 0;
    }
    *((void *)self + 29) = 0x100000008;
    v20 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *((void *)self + 30) = v20;
    if (v20 && v8) {
      memcpy(v20, v8, 8 * *((int *)self + 58) * (uint64_t)*((int *)self + 59));
    }
  }
  int v21 = *((_DWORD *)self + 62);
  int v22 = *((_DWORD *)self + 63);
  v23 = (void *)*((void *)self + 32);
  if (v22 * v21 == 8)
  {
    if (v23 && v10) {
      memcpy(v23, v10, 8 * v21 * (uint64_t)v22);
    }
    *((void *)self + 31) = 0x800000001;
  }
  else
  {
    if (v23)
    {
      free(v23);
      *((void *)self + 32) = 0;
    }
    *((void *)self + 31) = 0x800000001;
    v24 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *((void *)self + 32) = v24;
    if (v24 && v10) {
      memcpy(v24, v10, 8 * *((int *)self + 62) * (uint64_t)*((int *)self + 63));
    }
  }
  int v25 = *((_DWORD *)self + 66);
  int v26 = *((_DWORD *)self + 67);
  v27 = (void *)*((void *)self + 34);
  if (v26 * v25 == 1)
  {
    if (v27 && v12) {
      memcpy(v27, v12, 8 * v25 * (uint64_t)v26);
    }
    *((void *)self + 33) = 0x100000001;
  }
  else
  {
    if (v27)
    {
      free(v27);
      *((void *)self + 34) = 0;
    }
    *((void *)self + 33) = 0x100000001;
    v40 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
    *((void *)self + 34) = v40;
    if (v40 && v12)
    {
      memcpy(v40, v12, 8 * *((int *)self + 66) * (uint64_t)*((int *)self + 67));
      goto LABEL_69;
    }
  }
  if (!v12)
  {
    if (!v10) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_69:
  free(v12);
  if (v10) {
LABEL_46:
  }
    free(v10);
LABEL_47:
  if (v8) {
    free(v8);
  }
  if (v6) {
    free(v6);
  }
  *((void *)self + 36) = 0x3F00000043AF0000;
  v28 = (void *)((char *)self + 400);
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_OWORD *)self + 28) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  v29 = malloc_type_malloc(0x80uLL, 0x100004000313F17uLL);
  v30 = v29;
  if (v29)
  {
    v29[4] = xmmword_25B5F22A8;
    v29[5] = unk_25B5F22B8;
    v29[6] = xmmword_25B5F22C8;
    v29[7] = unk_25B5F22D8;
    _OWORD *v29 = xmmword_25B5F2268;
    v29[1] = unk_25B5F2278;
    v29[2] = xmmword_25B5F2288;
    v29[3] = unk_25B5F2298;
  }
  v31 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
  v32 = v31;
  if (v31)
  {
    _OWORD *v31 = xmmword_25B5F22E8;
    v31[1] = unk_25B5F22F8;
    v31[2] = xmmword_25B5F2308;
    v31[3] = unk_25B5F2318;
  }
  v33 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
  v34 = v33;
  if (v33)
  {
    _OWORD *v33 = xmmword_25B5F2328;
    v33[1] = unk_25B5F2338;
    v33[2] = xmmword_25B5F2348;
    v33[3] = unk_25B5F2358;
  }
  v35 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v36 = v35;
  if (v35) {
    void *v35 = 0x3FF565E800000000;
  }
  int v37 = *((_DWORD *)self + 100);
  int v38 = *((_DWORD *)self + 101);
  v39 = (void *)*((void *)self + 51);
  if (v38 * v37 == 16)
  {
    if (v39 && v30) {
      memcpy(v39, v30, 8 * v37 * (uint64_t)v38);
    }
    void *v28 = 0x200000008;
  }
  else
  {
    if (v39)
    {
      free(v39);
      *((void *)self + 51) = 0;
    }
    void *v28 = 0x200000008;
    v41 = malloc_type_malloc(0x80uLL, 0x100004000313F17uLL);
    *((void *)self + 51) = v41;
    if (v41 && v30) {
      memcpy(v41, v30, 8 * *((int *)self + 100) * (uint64_t)*((int *)self + 101));
    }
  }
  int v42 = *((_DWORD *)self + 104);
  int v43 = *((_DWORD *)self + 105);
  v44 = (void *)*((void *)self + 53);
  if (v43 * v42 == 8)
  {
    if (v44 && v32) {
      memcpy(v44, v32, 8 * v42 * (uint64_t)v43);
    }
    *((void *)self + 52) = 0x100000008;
  }
  else
  {
    if (v44)
    {
      free(v44);
      *((void *)self + 53) = 0;
    }
    *((void *)self + 52) = 0x100000008;
    v45 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *((void *)self + 53) = v45;
    if (v45 && v32) {
      memcpy(v45, v32, 8 * *((int *)self + 104) * (uint64_t)*((int *)self + 105));
    }
  }
  int v46 = *((_DWORD *)self + 108);
  int v47 = *((_DWORD *)self + 109);
  v48 = (void *)*((void *)self + 55);
  if (v47 * v46 == 8)
  {
    if (v48 && v34) {
      memcpy(v48, v34, 8 * v46 * (uint64_t)v47);
    }
    *((void *)self + 54) = 0x800000001;
  }
  else
  {
    if (v48)
    {
      free(v48);
      *((void *)self + 55) = 0;
    }
    *((void *)self + 54) = 0x800000001;
    v49 = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *((void *)self + 55) = v49;
    if (v49 && v34) {
      memcpy(v49, v34, 8 * *((int *)self + 108) * (uint64_t)*((int *)self + 109));
    }
  }
  int v50 = *((_DWORD *)self + 112);
  int v51 = *((_DWORD *)self + 113);
  v52 = (void *)*((void *)self + 57);
  if (v51 * v50 == 1)
  {
    if (v52 && v36) {
      memcpy(v52, v36, 8 * v50 * (uint64_t)v51);
    }
    *((void *)self + 56) = 0x100000001;
  }
  else
  {
    if (v52)
    {
      free(v52);
      *((void *)self + 57) = 0;
    }
    *((void *)self + 56) = 0x100000001;
    v65 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
    *((void *)self + 57) = v65;
    if (v65 && v36)
    {
      memcpy(v65, v36, 8 * *((int *)self + 112) * (uint64_t)*((int *)self + 113));
      goto LABEL_126;
    }
  }
  if (!v36)
  {
    if (!v34) {
      goto LABEL_104;
    }
    goto LABEL_103;
  }
LABEL_126:
  free(v36);
  if (v34) {
LABEL_103:
  }
    free(v34);
LABEL_104:
  if (v32) {
    free(v32);
  }
  if (v30) {
    free(v30);
  }
  *((_DWORD *)self + 116) = 1057803469;
  v53 = (void *)((char *)self + 576);
  *((_OWORD *)self + 36) = 0u;
  *((_OWORD *)self + 37) = 0u;
  *((_OWORD *)self + 38) = 0u;
  *((_OWORD *)self + 39) = 0u;
  *((_DWORD *)self + 142) = 0;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 488) = 0u;
  *(_OWORD *)((char *)self + 504) = 0u;
  *(_OWORD *)((char *)self + 520) = 0u;
  *(_OWORD *)((char *)self + 536) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  v54 = malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
  v55 = v54;
  if (v54)
  {
    _OWORD *v54 = xmmword_25B5F2368;
    v54[1] = unk_25B5F2378;
  }
  v56 = malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
  v57 = v56;
  if (v56)
  {
    _OWORD *v56 = xmmword_25B5F2388;
    v56[1] = unk_25B5F2398;
  }
  v58 = malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
  v59 = v58;
  if (v58)
  {
    _OWORD *v58 = xmmword_25B5F23A8;
    v58[1] = unk_25B5F23B8;
  }
  v60 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v61 = v60;
  if (v60) {
    void *v60 = 0x3FD19FA6A0000000;
  }
  int v62 = *((_DWORD *)self + 144);
  int v63 = *((_DWORD *)self + 145);
  v64 = (void *)*((void *)self + 73);
  if (v63 * v62 == 4)
  {
    if (v64 && v55) {
      memcpy(v64, v55, 8 * v62 * (uint64_t)v63);
    }
    void *v53 = 0x100000004;
  }
  else
  {
    if (v64)
    {
      free(v64);
      *((void *)self + 73) = 0;
    }
    void *v53 = 0x100000004;
    v66 = malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
    *((void *)self + 73) = v66;
    if (v66 && v55) {
      memcpy(v66, v55, 8 * *((int *)self + 144) * (uint64_t)*((int *)self + 145));
    }
  }
  int v67 = *((_DWORD *)self + 148);
  int v68 = *((_DWORD *)self + 149);
  v69 = (void *)*((void *)self + 75);
  if (v68 * v67 == 4)
  {
    if (v69 && v57) {
      memcpy(v69, v57, 8 * v67 * (uint64_t)v68);
    }
    *((void *)self + 74) = 0x100000004;
  }
  else
  {
    if (v69)
    {
      free(v69);
      *((void *)self + 75) = 0;
    }
    *((void *)self + 74) = 0x100000004;
    v70 = malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
    *((void *)self + 75) = v70;
    if (v70 && v57) {
      memcpy(v70, v57, 8 * *((int *)self + 148) * (uint64_t)*((int *)self + 149));
    }
  }
  int v71 = *((_DWORD *)self + 152);
  int v72 = *((_DWORD *)self + 153);
  v73 = (void *)*((void *)self + 77);
  if (v72 * v71 == 4)
  {
    if (v73 && v59) {
      memcpy(v73, v59, 8 * v71 * (uint64_t)v72);
    }
    *((void *)self + 76) = 0x400000001;
  }
  else
  {
    if (v73)
    {
      free(v73);
      *((void *)self + 77) = 0;
    }
    *((void *)self + 76) = 0x400000001;
    v74 = malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
    *((void *)self + 77) = v74;
    if (v74 && v59) {
      memcpy(v74, v59, 8 * *((int *)self + 152) * (uint64_t)*((int *)self + 153));
    }
  }
  int v75 = *((_DWORD *)self + 156);
  int v76 = *((_DWORD *)self + 157);
  v77 = (void *)*((void *)self + 79);
  if (v76 * v75 == 1)
  {
    if (v77 && v61) {
      memcpy(v77, v61, 8 * v75 * (uint64_t)v76);
    }
    *((void *)self + 78) = 0x100000001;
  }
  else
  {
    if (v77)
    {
      free(v77);
      *((void *)self + 79) = 0;
    }
    *((void *)self + 78) = 0x100000001;
    v80 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
    *((void *)self + 79) = v80;
    if (v80 && v61)
    {
      memcpy(v80, v61, 8 * *((int *)self + 156) * (uint64_t)*((int *)self + 157));
      goto LABEL_171;
    }
  }
  if (!v61)
  {
    if (!v59) {
      goto LABEL_161;
    }
    goto LABEL_160;
  }
LABEL_171:
  free(v61);
  if (v59) {
LABEL_160:
  }
    free(v59);
LABEL_161:
  if (v57) {
    free(v57);
  }
  v78 = v3 + 760;
  if (v55) {
    free(v55);
  }
  *((_OWORD *)self + 40) = xmmword_25B5F1710;
  *((_OWORD *)self + 41) = xmmword_25B5F1720;
  *((void *)self + 84) = 0x3D4CCCCD3E19999ALL;
  *(_OWORD *)((char *)self + 680) = 0u;
  *(_OWORD *)((char *)self + 696) = 0u;
  *(_OWORD *)((char *)self + 712) = 0u;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *(_OWORD *)((char *)self + 760) = 0u;
  *(_OWORD *)((char *)self + 776) = 0u;
  *((void *)self + 103) = 0x40051592C15DCE9DLL;
  _OWORD *v78 = xmmword_25B5F1730;
  v78[1] = xmmword_25B5F1740;
  *((void *)self + 104) = 0;
  *((void *)self + 106) = 0;
  *((void *)self + 105) = 0;
  *((void *)self + 117) = 850045863;
  *((void *)self + 124) = 0;
  *((_OWORD *)self + 60) = 0u;
  *((_OWORD *)self + 61) = 0u;
  *((_OWORD *)self + 59) = 0u;
  return self;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 936));
  objc_storeStrong((id *)self + 114, 0);
  objc_storeStrong((id *)self + 113, 0);
  objc_storeStrong((id *)self + 112, 0);
  objc_storeStrong((id *)self + 111, 0);
  objc_storeStrong((id *)self + 109, 0);
  objc_storeStrong((id *)self + 108, 0);
  objc_storeStrong((id *)self + 107, 0);
  v3 = (void *)*((void *)self + 104);
  if (v3)
  {
    *((void *)self + 105) = v3;
    operator delete(v3);
  }

  sub_25B4B9C40((uint64_t)self + 728);
  sub_25B4B9C40((uint64_t)self + 680);
  sub_25B5446E8((void *)self + 72);
  sub_25B4B9C40((uint64_t)self + 520);
  sub_25B4B9C40((uint64_t)self + 472);
  sub_25B5446E8((void *)self + 50);
  sub_25B4B9C40((uint64_t)self + 344);
  sub_25B4B9C40((uint64_t)self + 296);
  sub_25B5446E8((void *)self + 27);

  sub_25B467E54((void *)self + 16);
  sub_25B4B9C40((uint64_t)self + 80);

  sub_25B544790((uint64_t)self + 32);
}

- (RSScanCoaching)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSScanCoaching;
  result = [(RSScanCoaching *)&v3 init];
  if (result)
  {
    *((void *)result + 110) = 0x404000003F000000;
    *((unsigned char *)result + 928) = 1;
    *((void *)result + 115) = 5;
  }
  return result;
}

@end