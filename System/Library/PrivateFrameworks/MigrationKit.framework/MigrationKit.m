void sub_22BFB1B28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB1E84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB2660(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB2984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22BFB2AD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB319C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22BFB31F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MKUSBDevice;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_22BFB32EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_22BFB3494(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_22BFB353C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22BFB35D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22BFB37B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t device_interface_state_callback(uint64_t a1, void *a2)
{
  return [a2 interfaceDidChangeState:a1];
}

void sub_22BFB3854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_22BFB3928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_22BFB3B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22BFB41A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB4A68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_22BFB4BEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_3_0(sqlite3 **a1)
{
  v2 = *a1;
  return sqlite3_errcode(v2);
}

const char *OUTLINED_FUNCTION_5()
{
  v2 = *v0;
  return sqlite3_errmsg(v2);
}

void sub_22BFB77B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB7838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB78B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB7D14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB8094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB8F5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB9408(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB951C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB99D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFB9D10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBA1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22BFBAB24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MKLocalizedString(void *a1)
{
  uint64_t v1 = MKLocalizedString_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&MKLocalizedString_onceToken, &__block_literal_global_0);
  }
  v3 = [(id)MKLocalizedString_bundle localizedStringForKey:v2 value:0 table:0];

  return v3;
}

uint64_t __MKLocalizedString_block_invoke()
{
  MKLocalizedString_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

void sub_22BFBCB98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBCF98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBD5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
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

id FourCCString(unsigned int a1)
{
  uint64_t v1 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", HIBYTE(a1), BYTE2(a1), BYTE1(a1), a1);
  id v2 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v3 = [v1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

void sub_22BFBDC5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBDE40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBDFB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBEA20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBEF3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBF20C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFBF9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22BFC0250(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFC0770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
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

void migrationkit::signatures::get_signatures(uint64_t a1@<X8>)
{
  uint64_t v409 = *MEMORY[0x263EF8340];
  v3 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  *(_WORD *)v3 = -9985;
  v3[2] = -1;
  std::string::basic_string[abi:ne180100]<0>(v85, "jpeg");
  int v86 = 3;
  v87 = v3;
  uint64_t v88 = -1;
  uint64_t v4 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v4[2] = 176622093;
  *(void *)uint64_t v4 = 0x2020506A0C000000;
  std::string::basic_string[abi:ne180100]<0>(v89, "jp2");
  int v90 = 12;
  v91 = v4;
  uint64_t v92 = -1;
  v5 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v5 = 1375686655;
  std::string::basic_string[abi:ne180100]<0>(v93, "jpc");
  int v94 = 4;
  v95 = v5;
  uint64_t v96 = -1;
  v6 = malloc_type_malloc(8uLL, 0x100004077774924uLL);
  void *v6 = 0xA1A0A0D474E5089;
  std::string::basic_string[abi:ne180100]<0>(v97, "png");
  int v98 = 8;
  v99 = v6;
  uint64_t v100 = -1;
  v7 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v7[2] = 1346520407;
  *(void *)v7 = 1179011410;
  std::string::basic_string[abi:ne180100]<0>(v101, "webp");
  int v102 = 12;
  v103 = v7;
  uint64_t v104 = 0x700000004;
  v8 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v8 = 944130375;
  std::string::basic_string[abi:ne180100]<0>(v105, "gif");
  int v106 = 4;
  v107 = v8;
  uint64_t v108 = -1;
  uint64_t v9 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v9[2] = 1718187617;
  *(void *)uint64_t v9 = 0x7079746620000000;
  std::string::basic_string[abi:ne180100]<0>(v109, "avif");
  int v110 = 12;
  v111 = v9;
  uint64_t v112 = -1;
  uint64_t v10 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v10 = 2771273;
  std::string::basic_string[abi:ne180100]<0>(v113, "tiff/little.endian");
  int v114 = 4;
  v115 = v10;
  uint64_t v116 = -1;
  v11 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v11 = 704662861;
  std::string::basic_string[abi:ne180100]<0>(v117, "tiff/big.endian");
  int v118 = 4;
  v119 = v11;
  uint64_t v120 = -1;
  uint64_t v12 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v12[2] = 26419;
  *(_DWORD *)uint64_t v12 = 1887007846;
  std::string::basic_string[abi:ne180100]<0>(v121, "3gp/3g2");
  int v122 = 6;
  v123 = v12;
  uint64_t v124 = -1;
  v13 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v13 = 1936614249;
  std::string::basic_string[abi:ne180100]<0>(v125, "icns");
  int v126 = 4;
  v127 = v13;
  uint64_t v128 = -1;
  uint64_t v14 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *uint64_t v14 = 0x10000;
  std::string::basic_string[abi:ne180100]<0>(v129, "ico");
  int v130 = 4;
  v131 = v14;
  uint64_t v132 = -1;
  uint64_t v15 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *uint64_t v15 = -681629056;
  std::string::basic_string[abi:ne180100]<0>(v133, "cin");
  int v134 = 4;
  v135 = v15;
  uint64_t v136 = -1;
  uint64_t v16 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *uint64_t v16 = 20000630;
  std::string::basic_string[abi:ne180100]<0>(v137, "exr");
  int v138 = 4;
  v139 = v16;
  uint64_t v140 = -1;
  uint64_t v17 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v17 = -79212478;
  std::string::basic_string[abi:ne180100]<0>(v141, "bpg");
  int v142 = 4;
  v143 = v17;
  uint64_t v144 = -1;
  uint64_t v18 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  *uint64_t v18 = 1397768760;
  std::string::basic_string[abi:ne180100]<0>(v145, "psd");
  int v146 = 4;
  v147 = v18;
  uint64_t v148 = -1;
  v19 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v19 = 19778;
  std::string::basic_string[abi:ne180100]<0>(v149, "bmp");
  int v150 = 2;
  v151 = v19;
  uint64_t v152 = -1;
  v20 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v20 = 1179208774;
  std::string::basic_string[abi:ne180100]<0>(v153, "flif");
  int v154 = 4;
  v155 = v20;
  uint64_t v156 = -1;
  v21 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v21 = 1296255300;
  std::string::basic_string[abi:ne180100]<0>(v157, "dcm");
  int v158 = 4;
  v159 = v21;
  uint64_t v160 = -1;
  v22 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v22[2] = 541677121;
  *(void *)v22 = 1179011410;
  std::string::basic_string[abi:ne180100]<0>(v161, "avi");
  int v162 = 12;
  v163 = v22;
  uint64_t v164 = -1;
  v23 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v23 = -1545648870;
  std::string::basic_string[abi:ne180100]<0>(v165, "mkv/webm");
  int v166 = 4;
  v167 = v23;
  uint64_t v168 = -1;
  v24 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v24 = -1174339584;
  std::string::basic_string[abi:ne180100]<0>(v169, "m2p");
  int v170 = 4;
  v171 = v24;
  uint64_t v172 = -1;
  v25 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v25 = -1291780096;
  std::string::basic_string[abi:ne180100]<0>(v173, "mpeg");
  int v174 = 4;
  v175 = v25;
  uint64_t v176 = -1;
  v26 = malloc_type_malloc(8uLL, 0x100004077774924uLL);
  void *v26 = 0x6D6F736970797466;
  std::string::basic_string[abi:ne180100]<0>(v177, "mp4");
  int v178 = 8;
  v179 = v26;
  uint64_t v180 = -1;
  v27 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v27[2] = 86;
  *(_WORD *)v27 = 19526;
  std::string::basic_string[abi:ne180100]<0>(v181, "flv");
  int v182 = 3;
  v183 = v27;
  uint64_t v184 = -1;
  v28 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v28 = 808454705;
  std::string::basic_string[abi:ne180100]<0>(v185, "srt");
  int v186 = 4;
  v187 = v28;
  uint64_t v188 = -1;
  v29 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  _OWORD *v29 = xmmword_22C024030;
  std::string::basic_string[abi:ne180100]<0>(v189, "asf/wma/wmv");
  int v190 = 16;
  v191 = v29;
  uint64_t v192 = -1;
  v30 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v30 = 1399285583;
  std::string::basic_string[abi:ne180100]<0>(v193, "ogg");
  int v194 = 4;
  v195 = v30;
  uint64_t v196 = -1;
  uint64_t v31 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v31[2] = 1163280727;
  *(void *)uint64_t v31 = 1179011410;
  std::string::basic_string[abi:ne180100]<0>(v197, "wav");
  int v198 = 12;
  v199 = v31;
  uint64_t v200 = 0x700000004;
  v32 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v32 = 1130450022;
  std::string::basic_string[abi:ne180100]<0>(v201, "flac");
  int v202 = 4;
  v203 = v32;
  uint64_t v204 = -1;
  v33 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v33 = 1684960046;
  std::string::basic_string[abi:ne180100]<0>(v205, "snd");
  int v206 = 4;
  v207 = v33;
  uint64_t v208 = -1;
  v34 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v34 = -1025;
  std::string::basic_string[abi:ne180100]<0>(v209, "mp3");
  int v210 = 2;
  v211 = v34;
  uint64_t v212 = -1;
  v35 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v35 = -3073;
  std::string::basic_string[abi:ne180100]<0>(v213, "mp3/header2");
  int v214 = 2;
  v215 = v35;
  uint64_t v216 = -1;
  v36 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v36 = -3329;
  std::string::basic_string[abi:ne180100]<0>(v217, "mp3/header1");
  int v218 = 2;
  v219 = v36;
  uint64_t v220 = -1;
  v37 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v37[2] = 51;
  *(_WORD *)v37 = 17481;
  std::string::basic_string[abi:ne180100]<0>(v221, "mp3/ID3v2");
  int v222 = 3;
  v223 = v37;
  uint64_t v224 = -1;
  v38 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v38 = -3585;
  std::string::basic_string[abi:ne180100]<0>(v225, "aac/mpeg4");
  int v226 = 2;
  v227 = v38;
  uint64_t v228 = -1;
  v39 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v39 = -1537;
  std::string::basic_string[abi:ne180100]<0>(v229, "aac/mpeg2");
  int v230 = 2;
  v231 = v39;
  uint64_t v232 = -1;
  v40 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v40[2] = 541144141;
  *(void *)v40 = 0x7079746600000000;
  std::string::basic_string[abi:ne180100]<0>(v233, "m4a");
  int v234 = 12;
  v235 = v40;
  uint64_t v236 = 0x300000000;
  v41 = malloc_type_malloc(0xCuLL, 0x100004077774924uLL);
  v41[2] = 879781683;
  *(void *)v41 = 0x7079746600000000;
  std::string::basic_string[abi:ne180100]<0>(v237, "3gp4");
  int v238 = 12;
  v239 = v41;
  uint64_t v240 = 0x300000000;
  v42 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v42 = 67324752;
  std::string::basic_string[abi:ne180100]<0>(v241, "zip");
  int v242 = 4;
  v243 = v42;
  uint64_t v244 = -1;
  v43 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v43 = -25313;
  std::string::basic_string[abi:ne180100]<0>(v245, "tar.z/lzw");
  int v246 = 2;
  v247 = v43;
  uint64_t v248 = -1;
  v44 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v44 = -24545;
  std::string::basic_string[abi:ne180100]<0>(v249, "tar.z/lzh");
  int v250 = 2;
  v251 = v44;
  uint64_t v252 = -1;
  v45 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v45[2] = 104;
  *(_WORD *)v45 = 23106;
  std::string::basic_string[abi:ne180100]<0>(v253, "bz2");
  int v254 = 3;
  v255 = v45;
  uint64_t v256 = -1;
  v46 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v46 = 1346984524;
  std::string::basic_string[abi:ne180100]<0>(v257, "lzip");
  int v258 = 4;
  v259 = v46;
  uint64_t v260 = -1;
  v47 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v47[2] = 14128;
  *(_DWORD *)v47 = 925906736;
  std::string::basic_string[abi:ne180100]<0>(v261, "cpio");
  int v262 = 6;
  v263 = v47;
  uint64_t v264 = -1;
  v48 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v48[2] = 1818;
  *(_DWORD *)v48 = 561144146;
  std::string::basic_string[abi:ne180100]<0>(v265, "rar");
  int v266 = 6;
  v267 = v48;
  uint64_t v268 = -1;
  v49 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v49[2] = 7207;
  *(_DWORD *)v49 = -1346602441;
  std::string::basic_string[abi:ne180100]<0>(v269, "7z");
  int v270 = 6;
  v271 = v49;
  uint64_t v272 = -1;
  v50 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v50 = -29921;
  std::string::basic_string[abi:ne180100]<0>(v273, "gz");
  int v274 = 2;
  v275 = v50;
  uint64_t v276 = -1;
  v51 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v51[2] = 90;
  *(_DWORD *)v51 = 1484404733;
  std::string::basic_string[abi:ne180100]<0>(v277, "xz");
  int v278 = 6;
  v279 = v51;
  uint64_t v280 = -1;
  v52 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v52[2] = -65;
  *(_WORD *)v52 = -17425;
  std::string::basic_string[abi:ne180100]<0>(v281, "txt/utf-8");
  int v282 = 3;
  v283 = v52;
  uint64_t v284 = -1;
  v53 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v53 = -257;
  std::string::basic_string[abi:ne180100]<0>(v285, "txt/utf-16le");
  int v286 = 2;
  v287 = v53;
  uint64_t v288 = -1;
  v54 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v54 = -2;
  std::string::basic_string[abi:ne180100]<0>(v289, "txt/utf-16be");
  int v290 = 2;
  v291 = v54;
  uint64_t v292 = -1;
  v55 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v55 = 65279;
  std::string::basic_string[abi:ne180100]<0>(v293, "txt/utf-32le");
  int v294 = 4;
  v295 = v55;
  uint64_t v296 = -1;
  v56 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v56 = -16842752;
  std::string::basic_string[abi:ne180100]<0>(v297, "txt/utf-32be");
  int v298 = 4;
  v299 = v56;
  uint64_t v300 = -1;
  v57 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v57[2] = 118;
  *(_WORD *)v57 = 12075;
  std::string::basic_string[abi:ne180100]<0>(v301, "txt/utf-7");
  int v302 = 3;
  v303 = v57;
  uint64_t v304 = -1;
  v58 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v58 = 1397760293;
  std::string::basic_string[abi:ne180100]<0>(v305, "ps");
  int v306 = 4;
  v307 = v58;
  uint64_t v308 = -1;
  v59 = malloc_type_malloc(0x16uLL, 0x100004077774924uLL);
  qmemcpy(v59, "%!PS-Adobe-3.0 EPSF-3.", 22);
  std::string::basic_string[abi:ne180100]<0>(v309, "eps/3.0");
  int v310 = 22;
  v311 = v59;
  uint64_t v312 = -1;
  v60 = malloc_type_malloc(0x17uLL, 0x100004077774924uLL);
  qmemcpy(v60, "%!PS-Adobe-3.1 EPSF-3.0", 23);
  std::string::basic_string[abi:ne180100]<0>(v313, "eps/3.1");
  int v314 = 23;
  v315 = v60;
  uint64_t v316 = -1;
  v61 = malloc_type_malloc(5uLL, 0x100004077774924uLL);
  v61[4] = 45;
  *(_DWORD *)v61 = 1178882085;
  std::string::basic_string[abi:ne180100]<0>(v317, "pdf");
  int v318 = 5;
  v319 = v61;
  uint64_t v320 = -1;
  v62 = (char *)malloc_type_malloc(0xBuLL, 0x100004077774924uLL);
  *(_DWORD *)(v62 + 7) = 542001479;
  *(void *)v62 = *(void *)"-----BEGIN ";
  std::string::basic_string[abi:ne180100]<0>(v321, "pem");
  int v322 = 11;
  v323 = v62;
  uint64_t v324 = -1;
  v63 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v63[2] = 8300;
  *(_DWORD *)v63 = 1836597052;
  std::string::basic_string[abi:ne180100]<0>(v325, "xml");
  int v326 = 6;
  v327 = v63;
  uint64_t v328 = -1;
  v64 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v64[2] = 12646;
  *(_DWORD *)v64 = 1953651835;
  std::string::basic_string[abi:ne180100]<0>(v329, "rtf");
  int v330 = 6;
  v331 = v64;
  uint64_t v332 = -1;
  v65 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v65 = 23117;
  std::string::basic_string[abi:ne180100]<0>(v333, "exe/mz");
  int v334 = 2;
  v335 = v65;
  uint64_t v336 = -1;
  v66 = malloc_type_malloc(2uLL, 0x100004077774924uLL);
  _WORD *v66 = 19802;
  std::string::basic_string[abi:ne180100]<0>(v337, "exe/zm");
  int v338 = 2;
  v339 = v66;
  uint64_t v340 = -1;
  v67 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v67 = 1179403647;
  std::string::basic_string[abi:ne180100]<0>(v341, "elf");
  int v342 = 4;
  v343 = v67;
  uint64_t v344 = -1;
  v68 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v68 = -1095041334;
  std::string::basic_string[abi:ne180100]<0>(v345, "class");
  int v346 = 4;
  v347 = v68;
  uint64_t v348 = -1;
  v69 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v69 = -822415874;
  std::string::basic_string[abi:ne180100]<0>(v349, "mach-o/32-bit");
  int v350 = 4;
  v351 = v69;
  uint64_t v352 = -1;
  v70 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v70 = -805638658;
  std::string::basic_string[abi:ne180100]<0>(v353, "mach-o/64-bit");
  int v354 = 4;
  v355 = v70;
  uint64_t v356 = -1;
  v71 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v71 = -17958194;
  std::string::basic_string[abi:ne180100]<0>(v357, "mach-o/32-bit/reversed");
  int v358 = 4;
  v359 = v71;
  uint64_t v360 = -1;
  v72 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v72 = -17958193;
  std::string::basic_string[abi:ne180100]<0>(v361, "mach-o/64-bit/reversed");
  int v362 = 4;
  v363 = v72;
  uint64_t v364 = -1;
  v73 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v73 = -302060034;
  std::string::basic_string[abi:ne180100]<0>(v365, "jks");
  int v366 = 4;
  v367 = v73;
  uint64_t v368 = -1;
  v74 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v74 = 1836278016;
  std::string::basic_string[abi:ne180100]<0>(v369, "wasm");
  int v370 = 4;
  v371 = v74;
  uint64_t v372 = -1;
  v75 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v75[2] = 83;
  *(_WORD *)v75 = 22339;
  std::string::basic_string[abi:ne180100]<0>(v373, "swf/cws");
  int v374 = 3;
  v375 = v75;
  uint64_t v376 = -1;
  v76 = malloc_type_malloc(3uLL, 0x100004077774924uLL);
  v76[2] = 83;
  *(_WORD *)v76 = 22342;
  std::string::basic_string[abi:ne180100]<0>(v377, "swf/fws");
  int v378 = 3;
  v379 = v76;
  uint64_t v380 = -1;
  v77 = malloc_type_malloc(8uLL, 0x100004077774924uLL);
  void *v77 = 0xA3E686372613C21;
  std::string::basic_string[abi:ne180100]<0>(v381, "deb");
  int v382 = 8;
  v383 = v77;
  uint64_t v384 = -1;
  v78 = malloc_type_malloc(5uLL, 0x100004077774924uLL);
  v78[4] = 0;
  *(_DWORD *)v78 = 256;
  std::string::basic_string[abi:ne180100]<0>(v385, "ttf");
  int v386 = 5;
  v387 = v78;
  uint64_t v388 = -1;
  v79 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v79 = 1330926671;
  std::string::basic_string[abi:ne180100]<0>(v389, "otf");
  int v390 = 4;
  v391 = v79;
  uint64_t v392 = -1;
  v80 = malloc_type_malloc(5uLL, 0x100004077774924uLL);
  v80[4] = 49;
  *(_DWORD *)v80 = 808469571;
  std::string::basic_string[abi:ne180100]<0>(v393, "iso");
  int v394 = 5;
  v395 = v80;
  uint64_t v396 = -1;
  v81 = malloc_type_malloc(6uLL, 0x100004077774924uLL);
  v81[2] = 29811;
  *(_DWORD *)v81 = 1768714338;
  std::string::basic_string[abi:ne180100]<0>(v397, "bplist");
  int v398 = 6;
  v399 = v81;
  uint64_t v400 = -1;
  v82 = malloc_type_malloc(4uLL, 0x100004077774924uLL);
  _DWORD *v82 = 825249875;
  std::string::basic_string[abi:ne180100]<0>(v401, "bin");
  int v402 = 4;
  v403 = v82;
  uint64_t v404 = -1;
  v83 = (char *)malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  strcpy(v83, "SQLite format 3");
  std::string::basic_string[abi:ne180100]<0>(v405, "sqlitedb");
  int v406 = 16;
  v407 = v83;
  uint64_t v408 = -1;
  std::unordered_map<std::string,sig>::unordered_map(a1, v85, 81);
  uint64_t v84 = 3888;
  do
  {
    if ((char)v85[v84 - 25] < 0) {
      operator delete(*(void **)&v85[v84 - 48]);
    }
    v84 -= 48;
  }
  while (v84);
}

void sub_22BFC561C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v12 = 3888;
  while (1)
  {
    if (*(char *)(v10 + v12 - 25) < 0) {
      operator delete(*(void **)(v10 + v12 - 48));
    }
    v12 -= 48;
    if (!v12) {
      _Unwind_Resume(exception_object);
    }
  }
}

void migrationkit::signature::get_identifier(migrationkit::signature *this@<X0>, std::string *a2@<X8>)
{
  {
    migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::sigs = 0u;
    *(_OWORD *)&qword_268497AB0 = 0u;
    dword_268497AC0 = 1065353216;
    __cxa_atexit((void (*)(void *))std::unordered_map<std::string,sig>::~unordered_map[abi:ne180100], &migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::sigs, &dword_22BFAC000);
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::flag, memory_order_acquire) != -1)
  {
    v22 = &v20;
    v21 = &v22;
    std::__call_once(&migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::flag, &v21, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::$_0 &&>>);
  }
  uint64_t v5 = qword_268497AB0;
  if (!qword_268497AB0)
  {
LABEL_26:
    std::string::basic_string[abi:ne180100]<0>(a2, "");
    return;
  }
  while (1)
  {
    int v6 = *(_DWORD *)(v5 + 56);
    int v7 = *(_DWORD *)(v5 + 40);
    if (v6 >= 0) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v7;
    }
    if ((int)v8 < 1)
    {
      int v13 = *(_DWORD *)(v5 + 60);
      if (v13 < 0) {
        int v13 = -1;
      }
      LODWORD(v9) = v13 + 1;
      if ((int)v9 < v7) {
        goto LABEL_21;
      }
      goto LABEL_25;
    }
    uint64_t v9 = 0;
    while (1)
    {
      int v10 = *((unsigned __int8 *)this + v9);
      int v11 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v9);
      if (v10 != v11) {
        break;
      }
      if (v8 == ++v9)
      {
        LODWORD(v9) = v8;
        break;
      }
    }
    int v12 = *(_DWORD *)(v5 + 60);
    if (v12 + 1 > (int)v9) {
      LODWORD(v9) = v12 + 1;
    }
    if ((int)v9 < v7)
    {
LABEL_21:
      uint64_t v14 = (unsigned __int8 *)(*(void *)(v5 + 48) + v9);
      uint64_t v15 = (unsigned __int8 *)this + v9;
      while (1)
      {
        int v17 = *v15++;
        int v16 = v17;
        int v18 = *v14++;
        if (v16 != v18) {
          goto LABEL_25;
        }
        LODWORD(v9) = v9 + 1;
        if (v7 <= (int)v9) {
          goto LABEL_27;
        }
      }
    }
    if (v10 == v11) {
      break;
    }
LABEL_25:
    uint64_t v5 = *(void *)v5;
    if (!v5) {
      goto LABEL_26;
    }
  }
LABEL_27:
  if (*(char *)(v5 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(v5 + 16), *(void *)(v5 + 24));
  }
  else
  {
    long long v19 = *(_OWORD *)(v5 + 16);
    a2->__r_.__value_.__r.__words[2] = *(void *)(v5 + 32);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v19;
  }
}

uint64_t migrationkit::signature::get_max_signature_length(migrationkit::signature *this)
{
  return 23;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264905B60, MEMORY[0x263F8C060]);
}

void sub_22BFC5A8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t std::unordered_map<std::string,sig>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 48 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,sig> const&>(a1, a2, (uint64_t)a2);
      a2 += 48;
      v5 -= 48;
    }
    while (v5);
  }
  return a1;
}

void sub_22BFC5C24(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,sig> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    int v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__construct_node_hash<std::pair<std::string const,sig> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_22BFC5E94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,sig>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__construct_node_hash<std::pair<std::string const,sig> const&>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x40uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  __n128 result = *(__n128 *)(a3 + 24);
  *(__n128 *)(v8 + 40) = result;
  *((void *)v8 + 7) = *(void *)(a3 + 40);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_22BFC5F50(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,sig>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__rehash<true>(uint64_t a1, size_t __n)
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
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,sig>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::$_0 &&>>()
{
  migrationkit::signatures::get_signatures((uint64_t)v1);
  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__move_assign((uint64_t)&migrationkit::signature::get_identifier(unsigned char const*,unsigned long)::sigs, v1);
  return std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::~__hash_table((uint64_t)v1);
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::clear(a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  uint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    void *v7 = 0;
    v7[1] = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,sig>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,sig>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,sig>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,sig>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_22BFC9EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22BFC9F8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFCA4CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22BFCA740(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFCABF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_22BFCB764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22BFCE0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22BFCE1D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFCE658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFCEF60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFD2098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFD27EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFD50D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFD5150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22BFD54D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void migrationkit::usb::device::interface::create(migrationkit::usb::device::interface *this, __IOUSBDeviceController *a2)
{
}

void migrationkit::usb::device::interface::stop(__CFRunLoop **this)
{
  migrationkit::usb::device::interface::release_pipes((migrationkit::usb::device::interface *)this);
  uint64_t v2 = this[2];
  if (v2)
  {
    uint64_t v3 = this[4];
    if (v3)
    {
      (*(void (**)(__CFRunLoop *))(*(void *)v3 + 56))(v3);
      uint64_t v2 = this[2];
    }
    CFRunLoopStop(v2);
  }
}

void migrationkit::usb::device::interface::close(migrationkit::usb::device::interface *this)
{
  io_object_t v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 6) = 0;
  }
  uint64_t v3 = (IONotificationPort *)*((void *)this + 1);
  if (v3)
  {
    IONotificationPortDestroy(v3);
    *((void *)this + 1) = 0;
  }
  uint64_t v4 = *((void *)this + 4);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
    *((void *)this + 4) = 0;
  }
  if (*(void *)this)
  {
    CFRelease(*(CFTypeRef *)this);
    *(void *)this = 0;
  }
}

BOOL migrationkit::usb::device::interface::setup_matching_notification(migrationkit::usb::device::interface *this)
{
  kern_return_t v9;

  io_object_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  *((void *)this + 1) = v2;
  if (!v2) {
    goto LABEL_7;
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v2);
  Current = CFRunLoopGetCurrent();
  *((void *)this + 2) = Current;
  CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  CFMutableDictionaryRef v5 = IOServiceMatching("IOUSBDeviceInterface");
  if (!v5) {
    goto LABEL_7;
  }
  CFMutableDictionaryRef v6 = v5;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    CFRelease(v6);
LABEL_7:
    uint64_t v9 = 5;
    return v9 == 0;
  }
  uint64_t v8 = Mutable;
  CFDictionarySetValue(Mutable, @"USBDeviceFunction", @"MigrationKit Interface");
  CFDictionarySetValue(v6, @"IOPropertyMatch", v8);
  CFRelease(v8);
  uint64_t v9 = IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 1), "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)interface_matching_callback, this, (io_iterator_t *)this + 6);
  if (!v9)
  {
    interface_matching_callback((uint64_t)this, *((_DWORD *)this + 6));
    uint64_t v9 = 0;
  }
  return v9 == 0;
}

uint64_t interface_matching_callback(uint64_t result, io_iterator_t iterator)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (iterator)
  {
    uint64_t v3 = result;
    memset(v8, 0, sizeof(v8));
    uint64_t result = IOIteratorNext(iterator);
    if (result)
    {
      uint64_t v4 = result;
      LOBYTE(v5) = 0;
      while (1)
      {
        MEMORY[0x230F5B8F0](v4, v8);
        if (!v5)
        {
          uint64_t v6 = *(void *)&v8[0] ^ 0x6F6974617267694DLL | *((void *)&v8[0] + 1) ^ 0x746E492074694B6ELL | *(void *)((char *)v8 + 14) ^ 0x656361667265746ELL;
          BOOL v5 = v6 == 0;
          if (v6) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = v3 == 0;
          }
          if (v7) {
            goto LABEL_11;
          }
          migrationkit::usb::device::interface::start(v3, v4);
        }
        BOOL v5 = 1;
LABEL_11:
        uint64_t result = IOIteratorNext(iterator);
        uint64_t v4 = result;
        if (!result)
        {
          if (v5) {
            return IOObjectRelease(iterator);
          }
          return result;
        }
      }
    }
  }
  return result;
}

BOOL migrationkit::usb::device::interface::create_pipes(migrationkit::usb::device::interface *this)
{
  io_object_t v2 = malloc_type_malloc(0x38uLL, 0x2004093837F09uLL);
  uint64_t v3 = 0;
  *((void *)this + 5) = v2;
  do
  {
    *(void *)(*((void *)this + 5) + v3) = 0;
    v3 += 8;
  }
  while (v3 != 56);
  uint64_t v4 = 0;
  while (1)
  {
    BOOL v5 = malloc_type_malloc(0x28uLL, 0x1020040FAF5D19FuLL);
    _OWORD *v5 = 0u;
    v5[1] = 0u;
    *((void *)v5 + 4) = 0;
    *(void *)(*((void *)this + 5) + v4) = v5;
    BOOL pipe = migrationkit::usb::device::interface::create_pipe((uint64_t)this, (uint64_t)v5);
    if (!pipe) {
      break;
    }
    v4 += 8;
    if (v4 == 56) {
      return pipe;
    }
  }
  migrationkit::usb::device::interface::release_pipes(this);
  return pipe;
}

BOOL migrationkit::usb::device::interface::create_pipe(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    int v5 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void, void, void, uint64_t))(*(void *)v3 + 128))(v3, 2, 0, 0xFFFFFFFFLL, 0, 0, 0, a2);
    if (!v5)
    {
      int v5 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void, void, void, uint64_t))(**(void **)(a1 + 32) + 128))(*(void *)(a1 + 32), 2, 1, 0xFFFFFFFFLL, 0, 0, 0, a2 + 8);
      if (!v5)
      {
        uint64_t v6 = *(const void **)(a2 + 16);
        if (v6)
        {
          CFRelease(v6);
          *(void *)(a2 + 16) = 0;
        }
        int v5 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 32) + 208))(*(void *)(a1 + 32), 0x100000, a2 + 16);
        if (!v5)
        {
          uint64_t v9 = *(const void **)(a2 + 24);
          uint64_t v8 = (void *)(a2 + 24);
          BOOL v7 = v9;
          if (v9)
          {
            CFRelease(v7);
            void *v8 = 0;
          }
          int v5 = (*(uint64_t (**)(void, uint64_t, void *))(**(void **)(a1 + 32) + 208))(*(void *)(a1 + 32), 1024, v8);
        }
      }
    }
  }
  else
  {
    int v5 = -536870160;
  }
  return v5 == 0;
}

void migrationkit::usb::device::interface::release_pipes(migrationkit::usb::device::interface *this)
{
  if (*((void *)this + 5))
  {
    for (uint64_t i = 0; i != 56; i += 8)
    {
      uint64_t v3 = *(void **)(*((void *)this + 5) + i);
      if (v3)
      {
        uint64_t v4 = *((void *)this + 4);
        if (v4)
        {
          if (v3[1]) {
            (*(void (**)(uint64_t))(*(void *)v4 + 192))(v4);
          }
          if (*v3) {
            (*(void (**)(void))(**((void **)this + 4) + 192))(*((void *)this + 4));
          }
        }
        int v5 = (const void *)v3[2];
        if (v5)
        {
          CFRelease(v5);
          v3[2] = 0;
        }
        uint64_t v6 = (const void *)v3[3];
        if (v6) {
          CFRelease(v6);
        }
        free(v3);
        *(void *)(*((void *)this + 5) + i) = 0;
      }
    }
    free(*((void **)this + 5));
    *((void *)this + 5) = 0;
  }
}

uint64_t migrationkit::usb::device::interface::get_endpoints(migrationkit::usb::device::interface *this, int *a2)
{
  *a2 = 7;
  return *((void *)this + 5);
}

uint64_t migrationkit::usb::device::interface::start(uint64_t this, io_service_t a2)
{
  *(void *)theScore = 0;
  theInterface = 0;
  int v13 = -1;
  if (a2)
  {
    uint64_t v3 = this;
    CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    this = IOCreatePlugInInterfaceForService(a2, v4, v5, &theInterface, &theScore[1]);
    if (!this)
    {
      uint64_t v6 = theInterface;
      if (theInterface)
      {
        QueryInterface = (*theInterface)->QueryInterface;
        CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
        CFUUIDBytes v9 = CFUUIDGetUUIDBytes(v8);
        uint64_t v10 = (void *)(v3 + 32);
        int v11 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)(v6, *(void *)&v9.byte0, *(void *)&v9.byte8, v3 + 32);
        this = IODestroyPlugInInterface(theInterface);
        theInterface = 0;
        if (!v11)
        {
          this = *v10;
          if (*v10)
          {
            this = (*(uint64_t (**)(uint64_t, void))(*(void *)this + 32))(this, 0);
            if (!this)
            {
              this = (*(uint64_t (**)(void, __CFString *))(*(void *)*v10 + 80))(*v10, @"MigrationKit Interface");
              if (!this)
              {
                this = (*(uint64_t (**)(void, uint64_t, void))(*(void *)*v10 + 88))(*v10, 255, 0);
                if (!this)
                {
                  this = (*(uint64_t (**)(void, uint64_t, void))(*(void *)*v10 + 96))(*v10, 254, 0);
                  if (!this)
                  {
                    this = (*(uint64_t (**)(void, uint64_t, void))(*(void *)*v10 + 104))(*v10, 1, 0);
                    if (!this)
                    {
                      this = migrationkit::usb::device::interface::create_pipes((migrationkit::usb::device::interface *)v3);
                      if (this)
                      {
                        this = (*(uint64_t (**)(void))(*(void *)*v10 + 136))(*v10);
                        if (!this)
                        {
                          this = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)(v3 + 32)
                                                                                             + 72))(*(void *)(v3 + 32), message_callback, v3, v3);
                          if (!this)
                          {
                            uint64_t v12 = *MEMORY[0x263EFFE88];
                            this = (*(uint64_t (**)(void, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *), uint64_t (*)(), uint64_t (*)(), uint64_t, uint64_t, void, void))(**(void **)(v3 + 32) + 64))(*(void *)(v3 + 32), control_request_setup_callback, control_request_transmit_callback, control_request_receive_callback, v3, v3, *(void *)(v3 + 16), *MEMORY[0x263EFFE88]);
                            if (!this)
                            {
                              this = (*(uint64_t (**)(void, void, uint64_t))(**(void **)(v3 + 32) + 48))(*(void *)(v3 + 32), *(void *)(v3 + 16), v12);
                              if (!this)
                              {
                                this = (*(uint64_t (**)(void, SInt32 *, int *))(*(void *)*v10 + 288))(*v10, theScore, &v13);
                                if (theScore[0] == 1) {
                                  *(_DWORD *)(v3 + 28) = v13;
                                }
                                *(_DWORD *)(v3 + 24) = 0;
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
      }
    }
  }
  return this;
}

migrationkit::usb::device::interface *message_callback(migrationkit::usb::device::interface *this, int a2, _DWORD *a3, void *a4)
{
  if (this) {
    return (migrationkit::usb::device::interface *)migrationkit::usb::device::interface::message(this, a2, a3, a4);
  }
  return this;
}

uint64_t control_request_setup_callback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  if (a1) {
    *a6 = -536870201;
  }
  return 0xFFFFFFFFLL;
}

uint64_t control_request_receive_callback()
{
  return 3758097084;
}

uint64_t migrationkit::usb::device::interface::message(migrationkit::usb::device::interface *this, int a2, _DWORD *a3, void *a4)
{
  uint64_t result = 1;
  switch(a2)
  {
    case -469794544:
      for (uint64_t i = 0; i != 56; i += 8)
      {
        uint64_t v8 = *((void *)this + 4);
        uint64_t v9 = *(void *)(*((void *)this + 5) + i);
        int v11 = 0;
        if (!(*(unsigned int (**)(uint64_t, void, int *, void *))(*(void *)v8 + 200))(v8, *(void *)v9, &v11, a4))*(_DWORD *)(v9 + 36) = v11; {
        if (!(*(unsigned int (**)(void, void, int *))(**((void **)this + 4) + 200))(*((void *)this + 4), *(void *)(v9 + 8), &v11))*(_DWORD *)(v9 + 32) = v11;
        }
      }
      if (a3) {
        *((_DWORD *)this + 7) = a3[1];
      }
      uint64_t result = 3;
      break;
    case -469794543:
      uint64_t result = 4;
      break;
    case -469794542:
      uint64_t result = 5;
      break;
    case -469794541:
      break;
    case -469794540:
      uint64_t result = 2;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  uint64_t v10 = (uint64_t (*)(uint64_t, void, _DWORD *, void *))*((void *)this + 7);
  if (v10) {
    return v10(result, *((void *)this + 6), a3, a4);
  }
  return result;
}

uint64_t migrationkit::usb::device::interface::read(uint64_t a1, void *a2, void **a3)
{
  size_t size = 0x100000;
  if ((*(unsigned int (**)(void, void, void, size_t *))(**(void **)(a1 + 32) + 152))(*(void *)(a1 + 32), *a2, a2[2], &size))
  {
    return 0xFFFFFFFFLL;
  }
  size_t v4 = size;
  if ((uint64_t)size >= 1)
  {
    *a3 = malloc_type_malloc(size, 0x436193A2uLL);
    BytePtr = (const void *)IOUSBDeviceDataGetBytePtr();
    memcpy(*a3, BytePtr, size);
  }
  return v4;
}

uint64_t migrationkit::usb::device::interface::write(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  int v4 = a4;
  if (a4 >= 1024) {
    int v8 = 1024;
  }
  else {
    int v8 = a4;
  }
  if (a4 == 1024)
  {
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = a4 % *(_DWORD *)(a2 + 32) == 0;
    if (a4 < 1)
    {
      uint64_t v10 = 0;
      if (a4 % *(_DWORD *)(a2 + 32)) {
        return v10;
      }
      goto LABEL_15;
    }
  }
  LODWORD(v10) = 0;
  do
  {
    int v11 = migrationkit::usb::device::interface::write_chunk(a1, a2, a3, v8);
    uint64_t v10 = (v10 + v8);
    v4 -= v8;
    if (v4 >= 1024) {
      int v12 = 1024;
    }
    else {
      int v12 = v4;
    }
    if (v4 < 1) {
      break;
    }
    a3 += v8;
    int v8 = v12;
  }
  while (v11 > 0);
  if (v9)
  {
LABEL_15:
    uint64_t v14 = 0;
    (*(void (**)(void, void, void, uint64_t *))(**(void **)(a1 + 32) + 168))(*(void *)(a1 + 32), *(void *)(a2 + 8), *(void *)(a2 + 24), &v14);
  }
  return v10;
}

uint64_t migrationkit::usb::device::interface::write_chunk(uint64_t a1, uint64_t a2, const void *a3, int a4)
{
  BytePtr = (void *)IOUSBDeviceDataGetBytePtr();
  memcpy(BytePtr, a3, a4);
  uint64_t v10 = a4;
  if ((*(unsigned int (**)(void, void, void, uint64_t *))(**(void **)(a1 + 32) + 168))(*(void *)(a1 + 32), *(void *)(a2 + 8), *(void *)(a2 + 24), &v10))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return v10;
  }
}

uint64_t migrationkit::usb::device::interface::set_state_callback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 48) = a2;
  *(void *)(result + 56) = a3;
  return result;
}

void sub_22BFDA708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDB15C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDBB68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDBBFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDBD30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDC0E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDC374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDC404(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDC520(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDC6E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDCB50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDCCA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDCDF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDCF64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDD0B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDD224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDD378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDD538(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDD6F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDD8B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFDDA78(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[MKAPIServer processPerformanceMetrics]();
    }

    objc_end_catch();
    JUMPOUT(0x22BFDDA3CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_22BFDF200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_22BFDF5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22BFE0A84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_22BFE0EC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFE10C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22BFE14D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22BFE16B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFE1804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_22BFE1CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22BFE28E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFE2AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22BFE2D44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_22BFE2F18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFE2FAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFE361C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_22BFE446C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22BFE4C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_22BFE57A8()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CalendarsExporter()
{
  return self;
}

ValueMetadata *type metadata accessor for SIMMigrator()
{
  return &type metadata for SIMMigrator;
}

unint64_t sub_22BFE581C()
{
  return 0xD000000000000018;
}

void sub_22BFE5838()
{
}

uint64_t TLSConnection.__allocating_init(host:port:local:remote:)(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  uint64_t v33 = a5;
  uint64_t v31 = a4;
  int v34 = a3;
  uint64_t v32 = sub_22C01E208();
  uint64_t v29 = *(void *)(v32 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v27 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497148);
  MEMORY[0x270FA5388](v9 - 8);
  int v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22C01E1F8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22C01E1C8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C01E1D8();
  sub_22C01E1E8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    uint64_t v21 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268497150) + 48)];
    v22 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    uint64_t v28 = v16;
    v22(v8, v19, v16);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v21, v15, v12);
    uint64_t v23 = v29;
    uint64_t v24 = v32;
    (*(void (**)(char *, void, uint64_t))(v29 + 104))(v8, *MEMORY[0x263F14118], v32);
    uint64_t v25 = (uint64_t)v30;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v30, v8, v24);
    type metadata accessor for TLSConnection();
    uint64_t v26 = swift_allocObject();
    TLSConnection.init(endpoint:local:remote:)(v25, v31, v33);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v28);
    return v26;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t TLSConnection.__allocating_init(endpoint:local:remote:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  TLSConnection.init(endpoint:local:remote:)(a1, a2, a3);
  return v6;
}

uint64_t type metadata accessor for TLSConnection()
{
  return self;
}

void TLSConnection.init(endpoint:local:remote:)(uint64_t a1, void *a2, void *a3)
{
  id v87 = a3;
  uint64_t v85 = a1;
  uint64_t v4 = sub_22C01E208();
  uint64_t v83 = *(void *)(v4 - 8);
  uint64_t v84 = v4;
  MEMORY[0x270FA5388]();
  v81 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C01E638();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C01E648();
  MEMORY[0x270FA5388]();
  sub_22C01E438();
  MEMORY[0x270FA5388]();
  sub_22BFE6518();
  sub_22C01E428();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22BFE6558();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497168);
  sub_22BFE65B0();
  sub_22C01E6B8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F138], v6);
  uint64_t v10 = sub_22C01E658();
  sub_22C01E358();
  swift_allocObject();
  uint64_t v11 = sub_22C01E348();
  tls_ciphersuite_t v12 = word_26DF68B88;
  uint64_t v13 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v13, v12);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v14 = word_26DF68B8A;
  uint64_t v15 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v15, v14);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v16 = word_26DF68B8C;
  uint64_t v17 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v17, v16);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v18 = word_26DF68B8E;
  uint64_t v19 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v19, v18);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v20 = word_26DF68B90;
  uint64_t v21 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v21, v20);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v22 = word_26DF68B92;
  uint64_t v23 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v23, v22);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v24 = word_26DF68B94;
  uint64_t v25 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v25, v24);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v26 = word_26DF68B96;
  uint64_t v27 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v27, v26);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v28 = word_26DF68B98;
  uint64_t v29 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v29, v28);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v30 = word_26DF68B9A;
  uint64_t v31 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v31, v30);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v32 = word_26DF68B9C;
  uint64_t v33 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v33, v32);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v34 = word_26DF68B9E;
  uint64_t v35 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v35, v34);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v36 = word_26DF68BA0;
  uint64_t v37 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v37, v36);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v38 = word_26DF68BA2;
  unint64_t v39 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v39, v38);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v40 = word_26DF68BA4;
  unint64_t v41 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v41, v40);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v42 = word_26DF68BA6;
  v43 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v43, v42);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v44 = word_26DF68BA8;
  v45 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v45, v44);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v46 = word_26DF68BAA;
  v47 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v47, v46);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v48 = word_26DF68BAC;
  v49 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v49, v48);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v50 = word_26DF68BAE;
  v51 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v51, v50);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v52 = word_26DF68BB0;
  v53 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v53, v52);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v54 = word_26DF68BB2;
  v55 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v55, v54);
  swift_unknownObjectRelease();
  tls_ciphersuite_t v56 = word_26DF68BB4;
  v57 = sub_22C01E338();
  sec_protocol_options_append_tls_ciphersuite(v57, v56);
  swift_unknownObjectRelease();
  v58 = sub_22C01E338();
  sec_protocol_options_set_min_tls_protocol_version(v58, tls_protocol_version_TLSv12);
  swift_unknownObjectRelease();
  v59 = sub_22C01E338();
  sec_protocol_options_set_max_tls_protocol_version(v59, tls_protocol_version_TLSv13);
  swift_unknownObjectRelease();
  id v82 = a2;
  v60 = (__SecIdentity *)objc_msgSend(a2, sel_identity);
  v61 = sec_identity_create(v60);

  if (v61)
  {
    v62 = sub_22C01E338();
    sec_protocol_options_set_local_identity(v62, v61);
    swift_unknownObjectRelease();
    id v63 = objc_msgSend(v87, sel_digest);
    uint64_t v64 = sub_22C01DF18();
    unint64_t v66 = v65;

    uint64_t v67 = swift_allocObject();
    unint64_t v79 = v66;
    uint64_t v80 = v64;
    *(void *)(v67 + 16) = v64;
    *(void *)(v67 + 24) = v66;
    sub_22BFE67D0(v64, v66);
    v68 = sub_22C01E338();
    aBlock[4] = sub_22BFE67C8;
    aBlock[5] = v67;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BFE6828;
    aBlock[3] = &block_descriptor;
    v69 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sec_protocol_options_set_verify_block(v68, v69, v10);
    _Block_release(v69);
    swift_unknownObjectRelease();
    sub_22C01E328();
    swift_allocObject();
    uint64_t v70 = sub_22C01E318();
    sub_22C01E308();
    swift_retain();
    swift_retain();
    MEMORY[0x230F5B070](v11, v70);
    uint64_t v72 = v83;
    uint64_t v71 = v84;
    v73 = *(void (**)(char *, uint64_t, uint64_t))(v83 + 16);
    v78 = v10;
    uint64_t v74 = v85;
    v73(v81, v85, v84);
    sub_22C01E2C8();
    swift_allocObject();
    uint64_t v75 = sub_22C01E248();
    swift_release();
    swift_release();
    swift_release();

    swift_unknownObjectRelease();
    sub_22BFE6770(v80, v79);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v74, v71);
    uint64_t v76 = v86;
    v77 = v78;
    *(void *)(v86 + 16) = v75;
    *(void *)(v76 + 24) = v77;
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_22BFE6518()
{
  unint64_t result = qword_268497158;
  if (!qword_268497158)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268497158);
  }
  return result;
}

unint64_t sub_22BFE6558()
{
  unint64_t result = qword_268497160;
  if (!qword_268497160)
  {
    sub_22C01E648();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497160);
  }
  return result;
}

unint64_t sub_22BFE65B0()
{
  unint64_t result = qword_268497170;
  if (!qword_268497170)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268497168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497170);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_22BFE6654(int a1, sec_trust_t trust, void (*a3)(void), uint64_t a4, uint64_t a5, unint64_t a6)
{
  SecTrustRef v9 = sec_trust_copy_ref(trust);
  id v15 = objc_msgSend(objc_allocWithZone((Class)MKCertificate), sel_initWithTrust_, v9);
  id v10 = objc_msgSend(v15, sel_digest);
  uint64_t v11 = sub_22C01DF18();
  unint64_t v13 = v12;

  char v14 = sub_22C005C6C(a5, a6, v11, v13);
  a3(v14 & 1);
  sub_22BFE6770(v11, v13);
}

uint64_t sub_22BFE6738()
{
  sub_22BFE6770(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22BFE6770(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

void sub_22BFE67C8(int a1, NSObject *a2, void (*a3)(void), uint64_t a4)
{
  sub_22BFE6654(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_22BFE67D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_22BFE6828(uint64_t a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(char), uint64_t))(a1 + 32);
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6(a2, a3, sub_22BFE69D8, v8);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t TLSConnection.deinit()
{
  swift_release();

  return v0;
}

uint64_t TLSConnection.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t method lookup function for TLSConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TLSConnection);
}

uint64_t dispatch thunk of TLSConnection.__allocating_init(endpoint:local:remote:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_22BFE69A0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BFE69D8(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

BOOL sub_22BFE69F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

void sub_22BFE69FC()
{
  qword_26849DB50 = (uint64_t)&unk_26DF68BB8;
}

uint64_t sub_22BFE6A10@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFE6F18((uint64_t (*)(void))sub_22BFF50CC, a1);
}

uint64_t sub_22BFE6A28@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268496FD0, &qword_26849DB50, a1);
}

uint64_t sub_22BFE6A4C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BFE6FEC(a1, (uint64_t (*)(void))sub_22BFF50CC, a2);
}

uint64_t sub_22BFE6A68(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF37D8();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_22BFE6AB8()
{
  qword_26849DB58 = (uint64_t)&unk_26DF68C38;
}

uint64_t sub_22BFE6ACC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFE6F18((uint64_t (*)(void))sub_22BFF50E0, a1);
}

uint64_t sub_22BFE6AE4@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268496FD8, &qword_26849DB58, a1);
}

uint64_t sub_22BFE6B08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BFE6FEC(a1, (uint64_t (*)(void))sub_22BFF50E0, a2);
}

uint64_t sub_22BFE6B20(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF6B24();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_22BFE6B6C()
{
  qword_26849DB60 = (uint64_t)&unk_26DF68CA8;
}

uint64_t sub_22BFE6B80@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFE6F18((uint64_t (*)(void))sub_22BFF50F4, a1);
}

uint64_t sub_22BFE6B98@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268496FE0, &qword_26849DB60, a1);
}

uint64_t sub_22BFE6BBC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BFE6FEC(a1, (uint64_t (*)(void))sub_22BFF50F4, a2);
}

uint64_t sub_22BFE6BD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF6B78();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

BOOL sub_22BFE6C20(uint64_t a1, uint64_t *a2)
{
  return sub_22BFE69F0(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_22BFE6C3C()
{
  qword_26849DB68 = (uint64_t)&unk_26DF68D48;
}

uint64_t sub_22BFE6C50@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFE6F18((uint64_t (*)(void))sub_22BFF8F10, a1);
}

uint64_t sub_22BFE6C68@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268496FE8, &qword_26849DB68, a1);
}

uint64_t sub_22BFE6C8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BFE6FEC(a1, (uint64_t (*)(void))sub_22BFF8F10, a2);
}

uint64_t sub_22BFE6CA4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF6BCC();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_22BFE6CF0()
{
  qword_26849DB70 = (uint64_t)&unk_26DF68DB8;
}

uint64_t sub_22BFE6D04@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268496FF0, &qword_26849DB70, a1);
}

uint64_t sub_22BFE6D28(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF6C20();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_22BFE6D74()
{
  qword_26849DB78 = (uint64_t)&unk_26DF68E28;
}

uint64_t sub_22BFE6D88@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFE6F18((uint64_t (*)(void))sub_22BFF8F14, a1);
}

uint64_t sub_22BFE6DA0@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268496FF8, &qword_26849DB78, a1);
}

uint64_t sub_22BFE6DC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BFE6FEC(a1, (uint64_t (*)(void))sub_22BFF8F14, a2);
}

uint64_t sub_22BFE6DDC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF6C74();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_22BFE6E28()
{
  qword_26849DB80 = (uint64_t)&unk_26DF68EC8;
}

uint64_t sub_22BFE6E3C@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFE6F18((uint64_t (*)(void))sub_22BFF8F18, a1);
}

uint64_t sub_22BFE6E54@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268497000, &qword_26849DB80, a1);
}

uint64_t sub_22BFE6E78@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BFE6FEC(a1, (uint64_t (*)(void))sub_22BFF8F18, a2);
}

uint64_t sub_22BFE6E90(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF6A18();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_22BFE6EDC()
{
  qword_26849DB88 = (uint64_t)&unk_26DF68F48;
}

void sub_22BFE6EF0(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_22BFE6F00@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFE6F18((uint64_t (*)(void))sub_22BFF5108, a1);
}

uint64_t sub_22BFE6F18@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 9) = v5 & 1;
  return result;
}

uint64_t sub_22BFE6F50()
{
  return *(void *)v0;
}

uint64_t sub_22BFE6F58@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_268497008, &qword_26849DB88, a1);
}

uint64_t sub_22BFE6F7C@<X0>(void *a1@<X2>, void *a2@<X3>, void *a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22BFE6FD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22BFE6FEC(a1, (uint64_t (*)(void))sub_22BFF5108, a2);
}

uint64_t sub_22BFE6FEC@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X8>)
{
  uint64_t result = a2(*a1);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 9) = v6 & 1;
  return result;
}

void sub_22BFE7028(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22BFE7034()
{
  return sub_22C01E878();
}

uint64_t sub_22BFE70A0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFF6A6C();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_22BFE70EC()
{
  return sub_22C01E878();
}

BOOL sub_22BFE7154(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22BFE7168()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DB90);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DB90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242C0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "CalendarTypeLocal";
  *(void *)(v6 + 8) = 17;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  SecTrustRef v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "CalendarTypeCalDAV";
  *(void *)(v10 + 8) = 18;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)unint64_t v12 = "CalendarTypeExchange";
  *((void *)v12 + 1) = 20;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  char v14 = (char *)v13 + v1[14];
  void *v13 = 3;
  *(void *)char v14 = "CalendarTypeSubscription";
  *((void *)v14 + 1) = 24;
  v14[16] = 2;
  v9();
  id v15 = (void *)(v5 + 4 * v2);
  tls_ciphersuite_t v16 = (char *)v15 + v1[14];
  *id v15 = 4;
  *(void *)tls_ciphersuite_t v16 = "CalendarTypeBirthday";
  *((void *)v16 + 1) = 20;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  tls_ciphersuite_t v18 = (char *)v17 + v1[14];
  void *v17 = 5;
  *(void *)tls_ciphersuite_t v18 = "CalendarTypeUnknown";
  *((void *)v18 + 1) = 19;
  v18[16] = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22BFE7420@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497010, (uint64_t)qword_26849DB90, a1);
}

uint64_t sub_22BFE7444()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DBA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DBA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_22C0242D0;
  unint64_t v4 = v16 + v3;
  unint64_t v5 = v16 + v3 + v1[14];
  *(void *)(v16 + v3) = 0;
  *(void *)unint64_t v5 = "ParticipantRoleUnknown";
  *(void *)(v5 + 8) = 22;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "ParticipantRoleRequired";
  *(void *)(v9 + 8) = 23;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 2;
  *(void *)uint64_t v11 = "ParticipantRoleOptional";
  *((void *)v11 + 1) = 23;
  v11[16] = 2;
  v8();
  unint64_t v12 = (void *)(v4 + 3 * v2);
  unint64_t v13 = (char *)v12 + v1[14];
  *unint64_t v12 = 3;
  *(void *)unint64_t v13 = "ParticipantRoleChair";
  *((void *)v13 + 1) = 20;
  v13[16] = 2;
  v8();
  uint64_t v14 = v4 + 4 * v2 + v1[14];
  *(void *)(v4 + 4 * v2) = 4;
  *(void *)uint64_t v14 = "ParticipantRoleNonParticipant";
  *(void *)(v14 + 8) = 29;
  *(unsigned char *)(v14 + 16) = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22BFE76BC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497018, (uint64_t)qword_26849DBA8, a1);
}

uint64_t sub_22BFE76E0()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DBC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DBC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_22C0242E0;
  unint64_t v4 = v23 + v3;
  unint64_t v5 = v23 + v3 + v1[14];
  *(void *)(v23 + v3) = 0;
  *(void *)unint64_t v5 = "ParticipantStatusUnknown";
  *(void *)(v5 + 8) = 24;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "ParticipantStatusPending";
  *(void *)(v9 + 8) = 24;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 2;
  *(void *)uint64_t v11 = "ParticipantStatusAccepted";
  *((void *)v11 + 1) = 25;
  v11[16] = 2;
  v8();
  unint64_t v12 = (void *)(v4 + 3 * v2);
  unint64_t v13 = (char *)v12 + v1[14];
  *unint64_t v12 = 3;
  *(void *)unint64_t v13 = "ParticipantStatusDeclined";
  *((void *)v13 + 1) = 25;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  id v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 4;
  *(void *)id v15 = "ParticipantStatusTentative";
  *((void *)v15 + 1) = 26;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 5;
  *(void *)uint64_t v17 = "ParticipantStatusDelegated";
  *((void *)v17 + 1) = 26;
  v17[16] = 2;
  v8();
  tls_ciphersuite_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *tls_ciphersuite_t v18 = 6;
  *(void *)uint64_t v19 = "ParticipantStatusCompleted";
  *((void *)v19 + 1) = 26;
  v19[16] = 2;
  v8();
  tls_ciphersuite_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 7;
  *(void *)uint64_t v21 = "ParticipantStatusInProcess";
  *((void *)v21 + 1) = 26;
  v21[16] = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22BFE7A04@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497020, (uint64_t)qword_26849DBC0, a1);
}

uint64_t sub_22BFE7A28()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DBD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DBD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "ParticipantTypeUnknown";
  *(void *)(v6 + 8) = 22;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "ParticipantTypePerson";
  *(void *)(v10 + 8) = 21;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)unint64_t v12 = "ParticipantTypeRoom";
  *((void *)v12 + 1) = 19;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 3;
  *(void *)uint64_t v14 = "ParticipantTypeResource";
  *((void *)v14 + 1) = 23;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 4;
  *(void *)uint64_t v15 = "ParticipantTypeGroup";
  *(void *)(v15 + 8) = 20;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22BFE7CA8@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497028, (uint64_t)qword_26849DBD8, a1);
}

uint64_t sub_22BFE7CCC()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DBF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DBF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "RecurrenceFrequencyDaily";
  *(void *)(v6 + 8) = 24;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "RecurrenceFrequencyWeekly";
  *(void *)(v10 + 8) = 25;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)unint64_t v12 = "RecurrenceFrequencyMonthly";
  *((void *)v12 + 1) = 26;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 3;
  *(void *)uint64_t v14 = "RecurrenceFrequencyYearly";
  *((void *)v14 + 1) = 25;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 4;
  *(void *)uint64_t v15 = "RecurrenceFrequencyUnknown";
  *(void *)(v15 + 8) = 26;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22BFE7F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497030, (uint64_t)qword_26849DBF0, a1);
}

uint64_t sub_22BFE7F70()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DC08);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DC08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_22C0242E0;
  unint64_t v4 = v23 + v3;
  unint64_t v5 = v23 + v3 + v1[14];
  *(void *)(v23 + v3) = 0;
  *(void *)unint64_t v5 = "WeekdayNotSet";
  *(void *)(v5 + 8) = 13;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "WeekdaySunday";
  *(void *)(v9 + 8) = 13;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 2;
  *(void *)uint64_t v11 = "WeekdayMonday";
  *((void *)v11 + 1) = 13;
  v11[16] = 2;
  v8();
  unint64_t v12 = (void *)(v4 + 3 * v2);
  unint64_t v13 = (char *)v12 + v1[14];
  *unint64_t v12 = 3;
  *(void *)unint64_t v13 = "WeekdayTuesday";
  *((void *)v13 + 1) = 14;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 4;
  *(void *)uint64_t v15 = "WeekdayWednesday";
  *((void *)v15 + 1) = 16;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 5;
  *(void *)uint64_t v17 = "WeekdayThursday";
  *((void *)v17 + 1) = 15;
  v17[16] = 2;
  v8();
  tls_ciphersuite_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *tls_ciphersuite_t v18 = 6;
  *(void *)uint64_t v19 = "WeekdayFriday";
  *((void *)v19 + 1) = 13;
  v19[16] = 2;
  v8();
  tls_ciphersuite_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 7;
  *(void *)uint64_t v21 = "WeekdaySaturday";
  *((void *)v21 + 1) = 15;
  v21[16] = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22BFE82A4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497038, (uint64_t)qword_26849DC08, a1);
}

uint64_t sub_22BFE82C8()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DC20);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DC20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_22C0242C0;
  unint64_t v4 = v18 + v3 + v1[14];
  *(void *)(v18 + v3) = 0;
  *(void *)unint64_t v4 = "EventAvailabilityNotSupported";
  *(void *)(v4 + 8) = 29;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_22C01E158();
  uint64_t v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v7)(v4, v5, v6);
  unint64_t v8 = v18 + v3 + v2 + v1[14];
  *(void *)(v18 + v3 + v2) = 1;
  *(void *)unint64_t v8 = "EventAvailabilityBusy";
  *(void *)(v8 + 8) = 21;
  *(unsigned char *)(v8 + 16) = 2;
  v7();
  unint64_t v9 = (void *)(v18 + v3 + 2 * v2);
  unint64_t v10 = (char *)v9 + v1[14];
  void *v9 = 2;
  *(void *)unint64_t v10 = "EventAvailabilityFree";
  *((void *)v10 + 1) = 21;
  v10[16] = 2;
  v7();
  uint64_t v11 = (void *)(v18 + v3 + 3 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)unint64_t v12 = "EventAvailabilityTentative";
  *((void *)v12 + 1) = 26;
  v12[16] = 2;
  v7();
  unint64_t v13 = (void *)(v18 + v3 + 4 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)uint64_t v14 = "EventAvailabilityUnavailable";
  *((void *)v14 + 1) = 28;
  v14[16] = 2;
  v7();
  uint64_t v15 = (void *)(v18 + v3 + 5 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "EventAvailabilityUnknown";
  *((void *)v16 + 1) = 24;
  v16[16] = 2;
  v7();
  return sub_22C01E168();
}

uint64_t sub_22BFE8578@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497040, (uint64_t)qword_26849DC20, a1);
}

uint64_t sub_22BFE859C()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DC38);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DC38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242F0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "EventStatusNone";
  *(void *)(v6 + 8) = 15;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "EventStatusConfirmed";
  *(void *)(v10 + 8) = 20;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)unint64_t v12 = "EventStatusTentative";
  *((void *)v12 + 1) = 20;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 3;
  *(void *)uint64_t v14 = "EventStatusCanceled";
  *((void *)v14 + 1) = 19;
  v14[16] = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22BFE87D4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497048, (uint64_t)qword_26849DC38, a1);
}

uint64_t sub_22BFE87F8()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DC50);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DC50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_22C0242E0;
  unint64_t v4 = v23 + v3;
  unint64_t v5 = v23 + v3 + v1[14];
  *(void *)(v23 + v3) = 1;
  *(void *)unint64_t v5 = "id";
  *(void *)(v5 + 8) = 2;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "type";
  *(void *)(v9 + 8) = 4;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "title";
  *((void *)v11 + 1) = 5;
  v11[16] = 2;
  v8();
  unint64_t v12 = (void *)(v4 + 3 * v2);
  unint64_t v13 = (char *)v12 + v1[14];
  *unint64_t v12 = 4;
  *(void *)unint64_t v13 = "source";
  *((void *)v13 + 1) = 6;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 5;
  *(void *)uint64_t v15 = "subscribed";
  *((void *)v15 + 1) = 10;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "color";
  *((void *)v17 + 1) = 5;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 7;
  *(void *)uint64_t v19 = "immutable";
  *((void *)v19 + 1) = 9;
  v19[16] = 2;
  v8();
  tls_ciphersuite_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "calendarEvents";
  *((void *)v21 + 1) = 14;
  v21[16] = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22BFE8B28()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 3:
        case 4:
        case 6:
          sub_22C01E018();
          break;
        case 2:
          sub_22BFF37D8();
          sub_22C01DFB8();
          break;
        case 5:
        case 7:
          sub_22C01DFA8();
          break;
        case 8:
          type metadata accessor for CalendarEvent(0);
          sub_22BFF2CCC(&qword_268497380, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
          sub_22C01E048();
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFE8D1C()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    if (!*(void *)(v0 + 16) || (sub_22BFF37D8(), uint64_t result = sub_22C01E0B8(), !v1))
    {
      unint64_t v5 = *(void *)(v0 + 40);
      uint64_t v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0) {
        uint64_t v6 = *(void *)(v0 + 32) & 0xFFFFFFFFFFFFLL;
      }
      if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
      {
        unint64_t v7 = *(void *)(v0 + 56);
        uint64_t v8 = HIBYTE(v7) & 0xF;
        if ((v7 & 0x2000000000000000) == 0) {
          uint64_t v8 = *(void *)(v0 + 48) & 0xFFFFFFFFFFFFLL;
        }
        if (!v8 || (uint64_t result = sub_22C01E108(), !v1))
        {
          if (*(unsigned char *)(v0 + 64) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
          {
            unint64_t v9 = *(void *)(v0 + 80);
            uint64_t v10 = HIBYTE(v9) & 0xF;
            if ((v9 & 0x2000000000000000) == 0) {
              uint64_t v10 = *(void *)(v0 + 72) & 0xFFFFFFFFFFFFLL;
            }
            if (!v10 || (uint64_t result = sub_22C01E108(), !v1))
            {
              if (*(unsigned char *)(v0 + 88) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
              {
                if (!*(void *)(*(void *)(v0 + 96) + 16)
                  || (type metadata accessor for CalendarEvent(0),
                      sub_22BFF2CCC(&qword_268497380, (void (*)(uint64_t))type metadata accessor for CalendarEvent), uint64_t result = sub_22C01E138(), !v1))
                {
                  type metadata accessor for Calendar(0);
                  return sub_22C01DF38();
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

uint64_t sub_22BFE8F80@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  *(unsigned char *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0xE000000000000000;
  *(unsigned char *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = MEMORY[0x263F8EE78];
  return sub_22C01DF48();
}

uint64_t sub_22BFE8FD8()
{
  return 0x7261646E656C6143;
}

uint64_t sub_22BFE8FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 48);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22BFE9064(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 48);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22BFE90D4())()
{
  return nullsub_1;
}

uint64_t sub_22BFE90FC()
{
  return sub_22BFE8B28();
}

uint64_t sub_22BFE9114()
{
  return sub_22BFE8D1C();
}

uint64_t sub_22BFE9130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_2684973C8, (void (*)(uint64_t))type metadata accessor for Calendar);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFE91B0@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497050, (uint64_t)qword_26849DC50, a1);
}

uint64_t sub_22BFE91D4(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_2684973A0, (void (*)(uint64_t))type metadata accessor for Calendar);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFE9244()
{
  sub_22BFF2CCC(&qword_2684973A0, (void (*)(uint64_t))type metadata accessor for Calendar);
  return sub_22C01E088();
}

uint64_t sub_22BFE92C8()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DC68);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DC68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_22C024300;
  unint64_t v4 = v43 + v3;
  unint64_t v5 = v43 + v3 + v1[14];
  *(void *)(v43 + v3) = 1;
  *(void *)unint64_t v5 = "id";
  *(void *)(v5 + 8) = 2;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v43 + v3 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "title";
  *(void *)(v9 + 8) = 5;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v43 + v3 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "location";
  *((void *)v11 + 1) = 8;
  v11[16] = 2;
  v8();
  unint64_t v12 = (void *)(v43 + v3 + 3 * v2);
  unint64_t v13 = (char *)v12 + v1[14];
  *unint64_t v12 = 4;
  *(void *)unint64_t v13 = "creationDate";
  *((void *)v13 + 1) = 12;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v43 + v3 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 5;
  *(void *)uint64_t v15 = "lastModifiedDate";
  *((void *)v15 + 1) = 16;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v43 + v3 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "TimeZone";
  *((void *)v17 + 1) = 8;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v43 + v3 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 7;
  *(void *)uint64_t v19 = "URL";
  *((void *)v19 + 1) = 3;
  v19[16] = 2;
  v8();
  tls_ciphersuite_t v20 = (void *)(v43 + v3 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "Notes";
  *((void *)v21 + 1) = 5;
  v21[16] = 2;
  v8();
  uint64_t v22 = v43 + v3 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "attendees";
  *(void *)(v22 + 8) = 9;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v43 + v3 + 9 * v2);
  tls_ciphersuite_t v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)tls_ciphersuite_t v24 = "alarms";
  *((void *)v24 + 1) = 6;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v43 + v3 + 10 * v2);
  tls_ciphersuite_t v26 = (char *)v25 + v1[14];
  void *v25 = 11;
  *(void *)tls_ciphersuite_t v26 = "recurrenceRule";
  *((void *)v26 + 1) = 14;
  v26[16] = 2;
  v8();
  uint64_t v27 = (void *)(v43 + v3 + 11 * v2);
  tls_ciphersuite_t v28 = (char *)v27 + v1[14];
  void *v27 = 12;
  *(void *)tls_ciphersuite_t v28 = "allDay";
  *((void *)v28 + 1) = 6;
  v28[16] = 2;
  v8();
  uint64_t v29 = (void *)(v43 + v3 + 12 * v2);
  tls_ciphersuite_t v30 = (char *)v29 + v1[14];
  void *v29 = 13;
  *(void *)tls_ciphersuite_t v30 = "eventAvailability";
  *((void *)v30 + 1) = 17;
  v30[16] = 2;
  v8();
  uint64_t v31 = (void *)(v43 + v3 + 13 * v2);
  tls_ciphersuite_t v32 = (char *)v31 + v1[14];
  *uint64_t v31 = 14;
  *(void *)tls_ciphersuite_t v32 = "startDate";
  *((void *)v32 + 1) = 9;
  v32[16] = 2;
  v8();
  uint64_t v33 = (void *)(v43 + v3 + 14 * v2);
  tls_ciphersuite_t v34 = (char *)v33 + v1[14];
  void *v33 = 15;
  *(void *)tls_ciphersuite_t v34 = "endDate";
  *((void *)v34 + 1) = 7;
  v34[16] = 2;
  v8();
  uint64_t v35 = (void *)(v43 + v3 + 15 * v2);
  tls_ciphersuite_t v36 = (char *)v35 + v1[14];
  void *v35 = 16;
  *(void *)tls_ciphersuite_t v36 = "occurrenceDate";
  *((void *)v36 + 1) = 14;
  v36[16] = 2;
  v8();
  uint64_t v37 = v43 + v3 + 16 * v2 + v1[14];
  *(void *)(v4 + 16 * v2) = 17;
  *(void *)uint64_t v37 = "organizer";
  *(void *)(v37 + 8) = 9;
  *(unsigned char *)(v37 + 16) = 2;
  v8();
  tls_ciphersuite_t v38 = (void *)(v43 + v3 + 17 * v2);
  unint64_t v39 = (char *)v38 + v1[14];
  void *v38 = 18;
  *(void *)unint64_t v39 = "status";
  *((void *)v39 + 1) = 6;
  v39[16] = 2;
  v8();
  tls_ciphersuite_t v40 = (void *)(v43 + v3 + 18 * v2);
  unint64_t v41 = (char *)v40 + v1[14];
  void *v40 = 19;
  *(void *)unint64_t v41 = "attachments";
  *((void *)v41 + 1) = 11;
  v41[16] = 2;
  v8();
  return sub_22C01E168();
}

void *sub_22BFE9894()
{
  type metadata accessor for CalendarEvent._StorageClass(0);
  swift_allocObject();
  uint64_t result = sub_22BFE98D4();
  qword_268497178 = (uint64_t)result;
  return result;
}

void *sub_22BFE98D4()
{
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  v0[4] = 0;
  v0[5] = 0xE000000000000000;
  v0[6] = 0;
  v0[7] = 0xE000000000000000;
  v0[8] = 0;
  v0[9] = 0;
  v0[10] = 0;
  v0[11] = 0xE000000000000000;
  v0[12] = 0;
  v0[13] = 0xE000000000000000;
  uint64_t v1 = MEMORY[0x263F8EE78];
  v0[14] = 0;
  v0[15] = 0xE000000000000000;
  uint64_t v2 = (char *)v0
     + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__recurrenceRule;
  v0[16] = v1;
  v0[17] = v1;
  uint64_t v3 = type metadata accessor for RecurrenceRule(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *((unsigned char *)v0
  + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__allDay) = 0;
  unint64_t v4 = (char *)v0
     + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability;
  *(void *)unint64_t v4 = 0;
  v4[8] = 1;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__startDate) = 0;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__endDate) = 0;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__occurrenceDate) = 0;
  unint64_t v5 = (char *)v0
     + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer;
  uint64_t v6 = type metadata accessor for Participant(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (char *)v0
     + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status;
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  *(void *)((char *)v0
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__attachments) = v1;
  return v0;
}

void *sub_22BFE9A28(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v79 = (uint64_t)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973F8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v72 = (uint64_t)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[2] = 0;
  v1[3] = 0xE000000000000000;
  v1[4] = 0;
  uint64_t v1[5] = 0xE000000000000000;
  v1[6] = 0;
  v1[10] = 0;
  uint64_t v64 = v1 + 10;
  v1[9] = 0;
  id v63 = v1 + 9;
  v1[7] = 0xE000000000000000;
  v1[8] = 0;
  v1[11] = 0xE000000000000000;
  v1[12] = 0;
  unint64_t v65 = v1 + 12;
  v1[13] = 0xE000000000000000;
  v1[14] = 0;
  unint64_t v66 = v1 + 14;
  v1[15] = 0xE000000000000000;
  uint64_t v7 = MEMORY[0x263F8EE78];
  v1[16] = MEMORY[0x263F8EE78];
  uint64_t v67 = v1 + 16;
  uint64_t v8 = (char *)v1
     + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__recurrenceRule;
  v1[17] = v7;
  v68 = v1 + 17;
  uint64_t v69 = (uint64_t)v8;
  uint64_t v9 = type metadata accessor for RecurrenceRule(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v70 = (char *)v1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__allDay;
  *((unsigned char *)v1
  + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__allDay) = 0;
  uint64_t v10 = (char *)v1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability;
  uint64_t v71 = (char *)v1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability;
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  v73 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__startDate);
  *(void *)((char *)v1
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__startDate) = 0;
  uint64_t v74 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__endDate);
  *(void *)((char *)v1
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__endDate) = 0;
  uint64_t v75 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__occurrenceDate);
  *(void *)((char *)v1
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__occurrenceDate) = 0;
  uint64_t v11 = (char *)v1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer;
  uint64_t v76 = (char *)v1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer;
  uint64_t v12 = type metadata accessor for Participant(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  unint64_t v13 = (char *)v1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status;
  v77 = (char *)v1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status;
  *(void *)unint64_t v13 = 0;
  v13[8] = 1;
  v78 = (void *)((char *)v1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__attachments);
  *(void *)((char *)v1
            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__attachments) = v7;
  swift_beginAccess();
  uint64_t v15 = a1[2];
  uint64_t v14 = a1[3];
  swift_beginAccess();
  v1[2] = v15;
  v1[3] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v17 = a1[4];
  uint64_t v16 = a1[5];
  swift_beginAccess();
  v1[4] = v17;
  uint64_t v1[5] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v19 = a1[6];
  uint64_t v18 = a1[7];
  swift_beginAccess();
  v1[6] = v19;
  v1[7] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v20 = a1[8];
  swift_beginAccess();
  v1[8] = v20;
  swift_beginAccess();
  uint64_t v21 = a1[9];
  uint64_t v22 = v63;
  swift_beginAccess();
  void *v22 = v21;
  swift_beginAccess();
  uint64_t v24 = a1[10];
  uint64_t v23 = a1[11];
  uint64_t v25 = v64;
  swift_beginAccess();
  void *v25 = v24;
  v1[11] = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v27 = a1[12];
  uint64_t v26 = a1[13];
  tls_ciphersuite_t v28 = v65;
  swift_beginAccess();
  void *v28 = v27;
  v1[13] = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v30 = a1[14];
  uint64_t v29 = a1[15];
  uint64_t v31 = v66;
  swift_beginAccess();
  *uint64_t v31 = v30;
  v1[15] = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v32 = a1[16];
  uint64_t v33 = v67;
  swift_beginAccess();
  void *v33 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v34 = a1[17];
  uint64_t v35 = v68;
  swift_beginAccess();
  void *v35 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = (uint64_t)a1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__recurrenceRule;
  swift_beginAccess();
  uint64_t v37 = v72;
  sub_22BFF6228(v36, v72, &qword_2684973F8);
  uint64_t v38 = v69;
  swift_beginAccess();
  sub_22BFF6AC0(v37, v38, &qword_2684973F8);
  swift_endAccess();
  unint64_t v39 = (char *)a1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__allDay;
  swift_beginAccess();
  LOBYTE(v39) = *v39;
  tls_ciphersuite_t v40 = v70;
  swift_beginAccess();
  unsigned char *v40 = (_BYTE)v39;
  unint64_t v41 = (char *)a1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability;
  swift_beginAccess();
  uint64_t v42 = *(void *)v41;
  LOBYTE(v41) = v41[8];
  uint64_t v43 = v71;
  swift_beginAccess();
  *(void *)uint64_t v43 = v42;
  v43[8] = (char)v41;
  tls_ciphersuite_t v44 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__startDate);
  swift_beginAccess();
  uint64_t v45 = *v44;
  tls_ciphersuite_t v46 = v73;
  swift_beginAccess();
  void *v46 = v45;
  v47 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__endDate);
  swift_beginAccess();
  uint64_t v48 = *v47;
  v49 = v74;
  swift_beginAccess();
  void *v49 = v48;
  tls_ciphersuite_t v50 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__occurrenceDate);
  swift_beginAccess();
  uint64_t v51 = *v50;
  tls_ciphersuite_t v52 = v75;
  swift_beginAccess();
  void *v52 = v51;
  uint64_t v53 = (uint64_t)a1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer;
  swift_beginAccess();
  uint64_t v54 = v79;
  sub_22BFF6228(v53, v79, &qword_2684973E8);
  uint64_t v55 = (uint64_t)v76;
  swift_beginAccess();
  sub_22BFF6AC0(v54, v55, &qword_2684973E8);
  swift_endAccess();
  tls_ciphersuite_t v56 = (char *)a1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status;
  swift_beginAccess();
  uint64_t v57 = *(void *)v56;
  LOBYTE(v56) = v56[8];
  v58 = v77;
  swift_beginAccess();
  *(void *)v58 = v57;
  v58[8] = (char)v56;
  v59 = (void *)((char *)a1
                 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__attachments);
  swift_beginAccess();
  uint64_t v60 = *v59;
  swift_bridgeObjectRetain();
  swift_release();
  v61 = v78;
  swift_beginAccess();
  void *v61 = v60;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_22BFEA240()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22BFF628C(v0+ OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__recurrenceRule, &qword_2684973F8);
  sub_22BFF628C(v0 + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer, &qword_2684973E8);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22BFEA2D8()
{
  sub_22BFEA240();
  return swift_deallocClassInstance();
}

uint64_t sub_22BFEA32C()
{
  return type metadata accessor for CalendarEvent._StorageClass(0);
}

uint64_t type metadata accessor for CalendarEvent._StorageClass(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684971C8);
}

void sub_22BFEA354()
{
  sub_22BFEA4D0(319, &qword_2684971D8, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
  if (v0 <= 0x3F)
  {
    sub_22BFEA4D0(319, &qword_2684971E0, (void (*)(uint64_t))type metadata accessor for Participant);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for RecurrenceRule(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_268497220);
}

void sub_22BFEA4D0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_22C01E668();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for Participant(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_268497208);
}

uint64_t *sub_22BFEA544(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    a1[4] = a2[4];
    uint64_t v10 = sub_22C01DF58();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_22BFEA644(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_22BFEA6C4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_22BFEA774(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_22BFEA838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_22BFEA8BC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_22BFEA960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFEA974);
}

uint64_t sub_22BFEA974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22BFEAA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFEAA38);
}

uint64_t sub_22BFEAA38(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for Attachment(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684971E8);
}

uint64_t sub_22BFEAB00()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for EventStatus(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for EventStatus(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_22BFEAC10(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22BFEAC2C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for EventStatus()
{
  return &type metadata for EventStatus;
}

ValueMetadata *type metadata accessor for EventAvailability()
{
  return &type metadata for EventAvailability;
}

uint64_t *sub_22BFEAC6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    uint64_t *v3 = *a2;
    char v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_22C01DF58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

_OWORD *sub_22BFEAD3C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_22BFEADB8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *sub_22BFEAE3C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_22BFEAEB8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFEAF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_72Tm);
}

uint64_t sub_22BFEAF54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_73Tm);
}

uint64_t type metadata accessor for Alarm(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684971F8);
}

uint64_t sub_22BFEAF8C()
{
  return sub_22BFF8700();
}

void *sub_22BFEAFA0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v3 = *a2;
    char v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    uint64_t v7 = a2[8];
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + 64) = v7;
    uint64_t v11 = sub_22C01DF58();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t sub_22BFEB0C8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22BFEB148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 64) = v6;
  uint64_t v10 = sub_22C01DF58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

uint64_t sub_22BFEB220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_22BFEB30C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = a2 + v5;
  uint64_t v7 = a1 + v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
  return a1;
}

uint64_t sub_22BFEB3B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  char v8 = *(unsigned char *)(a2 + 72);
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = a2 + v9;
  uint64_t v11 = a1 + v9;
  *(unsigned char *)(a1 + 72) = v8;
  uint64_t v12 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v11, v10, v12);
  return a1;
}

uint64_t sub_22BFEB484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFEB498);
}

uint64_t sub_22BFEB498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22BFEB548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFEB55C);
}

uint64_t sub_22BFEB55C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22BFEB604()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_22BFEB6AC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 28) = *(uint64_t *)((char *)a2 + 28);
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    uint64_t v9 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v9;
    uint64_t v21 = a2[10];
    uint64_t v10 = *(int *)(a3 + 56);
    uint64_t v22 = (uint64_t)a2 + v10;
    uint64_t v23 = a1 + v10;
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v21;
    uint64_t v11 = sub_22C01DF58();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v23, v22, v11);
    uint64_t v13 = *(int *)(a3 + 60);
    uint64_t v14 = (_DWORD *)((char *)v4 + v13);
    uint64_t v15 = (_DWORD *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for RecurrenceEnd(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      *(void *)uint64_t v14 = *(void *)v15;
      v14[2] = v15[2];
      v12((uint64_t)v14 + *(int *)(v16 + 24), (uint64_t)v15 + *(int *)(v16 + 24), v11);
      (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t type metadata accessor for RecurrenceEnd(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_268497238);
}

uint64_t sub_22BFEB918(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 56);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 60);
  uint64_t v7 = type metadata accessor for RecurrenceEnd(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

uint64_t sub_22BFEBA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v18 = *(void *)(a2 + 80);
  uint64_t v8 = *(int *)(a3 + 56);
  uint64_t v19 = (char *)(a2 + v8);
  uint64_t v20 = (char *)(a1 + v8);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v18;
  uint64_t v9 = sub_22C01DF58();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v20, v19, v9);
  uint64_t v11 = *(int *)(a3 + 60);
  uint64_t v12 = (_DWORD *)(a1 + v11);
  uint64_t v13 = (_DWORD *)(a2 + v11);
  uint64_t v14 = type metadata accessor for RecurrenceEnd(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *(void *)uint64_t v12 = *(void *)v13;
    v12[2] = v13[2];
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_22BFEBC50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22C01DF58();
  uint64_t v21 = *(void *)(v10 - 8);
  uint64_t v22 = v10;
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v21 + 24);
  ((void (*)(uint64_t, uint64_t))v11)(v8, v9);
  uint64_t v12 = *(int *)(a3 + 60);
  uint64_t v13 = (char *)(a1 + v12);
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = type metadata accessor for RecurrenceEnd(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v9) = v17(v13, 1, v15);
  int v18 = v17(v14, 1, v15);
  if (!v9)
  {
    if (!v18)
    {
      *(void *)uint64_t v13 = *(void *)v14;
      *((_DWORD *)v13 + 2) = *((_DWORD *)v14 + 2);
      v11(&v13[*(int *)(v15 + 24)], &v14[*(int *)(v15 + 24)], v22);
      return a1;
    }
    sub_22BFF55EC((uint64_t)v13, type metadata accessor for RecurrenceEnd);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v13 = *(void *)v14;
  *((_DWORD *)v13 + 2) = *((_DWORD *)v14 + 2);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(&v13[*(int *)(v15 + 24)], &v14[*(int *)(v15 + 24)], v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_22BFEBF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v6 = *(int *)(a3 + 56);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v9 = sub_22C01DF58();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 60);
  uint64_t v12 = (_DWORD *)(a1 + v11);
  uint64_t v13 = (_DWORD *)(a2 + v11);
  uint64_t v14 = type metadata accessor for RecurrenceEnd(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    *(void *)uint64_t v12 = *(void *)v13;
    v12[2] = v13[2];
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_DWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_22BFEC0D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 28) = *(void *)(a2 + 28);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 56);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22C01DF58();
  uint64_t v21 = *(void *)(v10 - 8);
  uint64_t v22 = v10;
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v21 + 40);
  ((void (*)(uint64_t, uint64_t))v11)(v8, v9);
  uint64_t v12 = *(int *)(a3 + 60);
  uint64_t v13 = (char *)(a1 + v12);
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = type metadata accessor for RecurrenceEnd(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v9) = v17(v13, 1, v15);
  int v18 = v17(v14, 1, v15);
  if (!v9)
  {
    if (!v18)
    {
      *(void *)uint64_t v13 = *(void *)v14;
      *((_DWORD *)v13 + 2) = *((_DWORD *)v14 + 2);
      v11(&v13[*(int *)(v15 + 24)], &v14[*(int *)(v15 + 24)], v22);
      return a1;
    }
    sub_22BFF55EC((uint64_t)v13, type metadata accessor for RecurrenceEnd);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v13 = *(void *)v14;
  *((_DWORD *)v13 + 2) = *((_DWORD *)v14 + 2);
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v13[*(int *)(v15 + 24)], &v14[*(int *)(v15 + 24)], v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_22BFEC36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFEC380);
}

uint64_t sub_22BFEC380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 56);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 60);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_22BFEC4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFEC4C4);
}

uint64_t sub_22BFEC4C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 56);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 60);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_22BFEC5F4()
{
  sub_22C01DF58();
  if (v0 <= 0x3F)
  {
    sub_22BFEA4D0(319, &qword_268497230, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_22BFEC714(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    void *v3 = *a2;
    char v3 = (void *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 + 2);
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = a1 + v5;
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = sub_22C01DF58();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_22BFEC7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFEC86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFEC8F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFEC974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFEC9F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_72Tm_0);
}

uint64_t sub_22BFECA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_73Tm_0);
}

uint64_t sub_22BFECA28()
{
  return sub_22BFF8700();
}

unint64_t sub_22BFECA48()
{
  unint64_t result = qword_268497248;
  if (!qword_268497248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497248);
  }
  return result;
}

uint64_t sub_22BFECA9C()
{
  return sub_22BFF8AA0(&qword_268497250, &qword_268497258);
}

unint64_t sub_22BFECAC8()
{
  unint64_t result = qword_268497260;
  if (!qword_268497260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497260);
  }
  return result;
}

unint64_t sub_22BFECB20()
{
  unint64_t result = qword_268497268;
  if (!qword_268497268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497268);
  }
  return result;
}

unint64_t sub_22BFECB78()
{
  unint64_t result = qword_268497270;
  if (!qword_268497270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497270);
  }
  return result;
}

uint64_t sub_22BFECBCC()
{
  return sub_22BFF8AA0(&qword_268497278, &qword_268497280);
}

unint64_t sub_22BFECBF8()
{
  unint64_t result = qword_268497288;
  if (!qword_268497288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497288);
  }
  return result;
}

unint64_t sub_22BFECC50()
{
  unint64_t result = qword_268497290;
  if (!qword_268497290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497290);
  }
  return result;
}

uint64_t sub_22BFECCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(int *)(type metadata accessor for CalendarEvent(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for CalendarEvent._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = (void *)swift_retain();
    *(void *)(v3 + v7) = sub_22BFE9A28(v8);
    swift_release();
  }
  uint64_t v9 = swift_retain();
  sub_22BFECD70(v9, a1, a2, a3);
  return swift_release();
}

uint64_t sub_22BFECD70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_22C01DF98();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_22BFED0C8();
          break;
        case 2:
          sub_22BFED148();
          break;
        case 3:
          sub_22BFED1C8();
          break;
        case 4:
          sub_22BFED248();
          break;
        case 5:
          sub_22BFED2C8();
          break;
        case 6:
          sub_22BFED348();
          break;
        case 7:
          sub_22BFED3C8();
          break;
        case 8:
          sub_22BFED448();
          break;
        case 9:
          sub_22BFED4C8();
          break;
        case 10:
          sub_22BFED590();
          break;
        case 11:
          sub_22BFED658();
          break;
        case 12:
          sub_22BFED728();
          break;
        case 13:
          uint64_t v11 = sub_22BFF6A18;
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          uint64_t v16 = &OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability;
          goto LABEL_22;
        case 14:
        case 15:
        case 16:
          sub_22BFED7B0();
          break;
        case 17:
          sub_22BFED834();
          break;
        case 18:
          uint64_t v11 = sub_22BFF6A6C;
          uint64_t v12 = a2;
          uint64_t v13 = a1;
          uint64_t v14 = a3;
          uint64_t v15 = a4;
          uint64_t v16 = &OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status;
LABEL_22:
          sub_22BFED904(v12, v13, v14, v15, (uint64_t)v16, (void (*)(uint64_t))v11);
          break;
        case 19:
          sub_22BFED9AC();
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFED0C8()
{
  return swift_endAccess();
}

uint64_t sub_22BFED148()
{
  return swift_endAccess();
}

uint64_t sub_22BFED1C8()
{
  return swift_endAccess();
}

uint64_t sub_22BFED248()
{
  return swift_endAccess();
}

uint64_t sub_22BFED2C8()
{
  return swift_endAccess();
}

uint64_t sub_22BFED348()
{
  return swift_endAccess();
}

uint64_t sub_22BFED3C8()
{
  return swift_endAccess();
}

uint64_t sub_22BFED448()
{
  return swift_endAccess();
}

uint64_t sub_22BFED4C8()
{
  return swift_endAccess();
}

uint64_t sub_22BFED590()
{
  return swift_endAccess();
}

uint64_t sub_22BFED658()
{
  return swift_endAccess();
}

uint64_t sub_22BFED728()
{
  return swift_endAccess();
}

uint64_t sub_22BFED7B0()
{
  return swift_endAccess();
}

uint64_t sub_22BFED834()
{
  return swift_endAccess();
}

uint64_t sub_22BFED904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v7 = swift_beginAccess();
  a6(v7);
  sub_22C01DFB8();
  return swift_endAccess();
}

uint64_t sub_22BFED9AC()
{
  return swift_endAccess();
}

uint64_t sub_22BFEDA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for CalendarEvent(0);
  uint64_t v7 = (void *)swift_retain();
  sub_22BFEDB10(v7, a1, a2, a3);
  uint64_t result = swift_release();
  if (!v3) {
    return sub_22C01DF38();
  }
  return result;
}

uint64_t sub_22BFEDB10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  unint64_t v9 = a1[3];
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = a1[2] & 0xFFFFFFFFFFFFLL;
  }
  if (v10)
  {
    swift_bridgeObjectRetain();
    sub_22C01E108();
    if (v4) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  unint64_t v11 = a1[5];
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = a1[4] & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    swift_bridgeObjectRetain();
    sub_22C01E108();
    if (!v4)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    return swift_bridgeObjectRelease();
  }
LABEL_11:
  swift_beginAccess();
  unint64_t v13 = a1[7];
  uint64_t v14 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0) {
    uint64_t v14 = a1[6] & 0xFFFFFFFFFFFFLL;
  }
  if (v14)
  {
    swift_bridgeObjectRetain();
    sub_22C01E108();
    if (v4) {
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  if (!a1[8] || (uint64_t result = sub_22C01E128(), !v4))
  {
    swift_beginAccess();
    if (!a1[9] || (uint64_t result = sub_22C01E128(), !v4))
    {
      swift_beginAccess();
      unint64_t v16 = a1[11];
      uint64_t v17 = HIBYTE(v16) & 0xF;
      if ((v16 & 0x2000000000000000) == 0) {
        uint64_t v17 = a1[10] & 0xFFFFFFFFFFFFLL;
      }
      if (v17)
      {
        swift_bridgeObjectRetain();
        sub_22C01E108();
        if (v4) {
          return swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      unint64_t v18 = a1[13];
      uint64_t v19 = HIBYTE(v18) & 0xF;
      if ((v18 & 0x2000000000000000) == 0) {
        uint64_t v19 = a1[12] & 0xFFFFFFFFFFFFLL;
      }
      if (v19)
      {
        swift_bridgeObjectRetain();
        sub_22C01E108();
        if (v4) {
          return swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      unint64_t v20 = a1[15];
      uint64_t v21 = HIBYTE(v20) & 0xF;
      if ((v20 & 0x2000000000000000) == 0) {
        uint64_t v21 = a1[14] & 0xFFFFFFFFFFFFLL;
      }
      if (v21)
      {
        swift_bridgeObjectRetain();
        sub_22C01E108();
        if (v4) {
          return swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      if (!*(void *)(a1[16] + 16)
        || (type metadata accessor for Participant(0),
            sub_22BFF2CCC(&qword_268497360, (void (*)(uint64_t))type metadata accessor for Participant),
            swift_bridgeObjectRetain(),
            sub_22C01E138(),
            uint64_t result = swift_bridgeObjectRelease(),
            !v4))
      {
        swift_beginAccess();
        if (!*(void *)(a1[17] + 16)
          || (type metadata accessor for Alarm(0),
              sub_22BFF2CCC(&qword_268497340, (void (*)(uint64_t))type metadata accessor for Alarm),
              swift_bridgeObjectRetain(),
              sub_22C01E138(),
              uint64_t result = swift_bridgeObjectRelease(),
              !v4))
        {
          uint64_t result = sub_22BFEE20C((uint64_t)a1, a2, a3, a4);
          if (!v4)
          {
            uint64_t v22 = (char *)a1
                + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__allDay;
            swift_beginAccess();
            if (*v22 == 1) {
              sub_22C01E0A8();
            }
            uint64_t v23 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability);
            swift_beginAccess();
            if (*v23)
            {
              sub_22BFF6A18();
              sub_22C01E0B8();
            }
            uint64_t v24 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__startDate);
            swift_beginAccess();
            if (*v24) {
              sub_22C01E128();
            }
            uint64_t v25 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__endDate);
            swift_beginAccess();
            if (*v25) {
              sub_22C01E128();
            }
            uint64_t v26 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__occurrenceDate);
            swift_beginAccess();
            if (*v26) {
              sub_22C01E128();
            }
            sub_22BFEE428((uint64_t)a1, a2, a3, a4);
            uint64_t v27 = (void *)((char *)a1
                           + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status);
            swift_beginAccess();
            if (*v27)
            {
              sub_22BFF6A6C();
              sub_22C01E0B8();
            }
            tls_ciphersuite_t v28 = (char *)a1
                + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__attachments;
            uint64_t result = swift_beginAccess();
            if (*(void *)(*(void *)v28 + 16))
            {
              type metadata accessor for Attachment(0);
              sub_22BFF2CCC(&qword_2684972C0, (void (*)(uint64_t))type metadata accessor for Attachment);
              swift_bridgeObjectRetain();
              sub_22C01E138();
              return swift_bridgeObjectRelease();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_22BFEE20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973F8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RecurrenceRule(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__recurrenceRule;
  swift_beginAccess();
  sub_22BFF6228(v12, (uint64_t)v7, &qword_2684973F8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_22BFF628C((uint64_t)v7, &qword_2684973F8);
  }
  sub_22BFF564C((uint64_t)v7, (uint64_t)v11, type metadata accessor for RecurrenceRule);
  sub_22BFF2CCC(&qword_268497320, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
  sub_22C01E148();
  return sub_22BFF55EC((uint64_t)v11, type metadata accessor for RecurrenceRule);
}

uint64_t sub_22BFEE428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973E8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Participant(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer;
  swift_beginAccess();
  sub_22BFF6228(v12, (uint64_t)v7, &qword_2684973E8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_22BFF628C((uint64_t)v7, &qword_2684973E8);
  }
  sub_22BFF564C((uint64_t)v7, (uint64_t)v11, type metadata accessor for Participant);
  sub_22BFF2CCC(&qword_268497360, (void (*)(uint64_t))type metadata accessor for Participant);
  sub_22C01E148();
  return sub_22BFF55EC((uint64_t)v11, type metadata accessor for Participant);
}

uint64_t sub_22BFEE644(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Participant(0);
  uint64_t v91 = *(void *)(v4 - 8);
  uint64_t v92 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v88 = (uint64_t)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973E0);
  MEMORY[0x270FA5388](v90);
  uint64_t v94 = (uint64_t)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973E8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v89 = (uint64_t)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v93 = (uint64_t)&v86 - v10;
  uint64_t v11 = type metadata accessor for RecurrenceRule(0);
  uint64_t v95 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973F0);
  MEMORY[0x270FA5388](v14);
  uint64_t v96 = (uint64_t)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684973F8);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v86 - v20;
  swift_beginAccess();
  uint64_t v22 = a1[2];
  uint64_t v23 = a1[3];
  swift_beginAccess();
  if (v22 == a2[2] && v23 == a2[3] || (char v24 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    if ((swift_beginAccess(), uint64_t v25 = a1[4], v26 = a1[5], swift_beginAccess(), v25 == a2[4]) && v26 == a2[5]
      || (char v24 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      if ((swift_beginAccess(), uint64_t v27 = a1[6], v28 = a1[7], swift_beginAccess(), v27 == a2[6]) && v28 == a2[7]
        || (char v24 = 0, (sub_22C01E7D8() & 1) != 0))
      {
        swift_beginAccess();
        uint64_t v29 = a1[8];
        swift_beginAccess();
        if (v29 == a2[8] && (swift_beginAccess(), uint64_t v30 = a1[9], swift_beginAccess(), v30 == a2[9]))
        {
          swift_beginAccess();
          uint64_t v31 = a1[10];
          uint64_t v32 = a1[11];
          swift_beginAccess();
          if (v31 == a2[10] && v32 == a2[11] || (char v24 = 0, (sub_22C01E7D8() & 1) != 0))
          {
            if ((swift_beginAccess(), uint64_t v33 = a1[12], v34 = a1[13], swift_beginAccess(), v33 == a2[12]) && v34 == a2[13]
              || (char v24 = 0, (sub_22C01E7D8() & 1) != 0))
            {
              if ((swift_beginAccess(), uint64_t v35 = a1[14], v36 = a1[15], swift_beginAccess(), v35 == a2[14])
                && v36 == a2[15]
                || (char v24 = 0, (sub_22C01E7D8() & 1) != 0))
              {
                swift_beginAccess();
                uint64_t v37 = a1[16];
                swift_beginAccess();
                uint64_t v38 = a2[16];
                swift_retain();
                swift_retain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                LODWORD(v87) = sub_22BFF4A4C(v37, v38);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v87 & 1) == 0) {
                  goto LABEL_54;
                }
                swift_beginAccess();
                uint64_t v39 = a1[17];
                swift_beginAccess();
                uint64_t v40 = a2[17];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                LODWORD(v87) = sub_22BFF4BEC(v39, v40);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v87 & 1) == 0) {
                  goto LABEL_54;
                }
                uint64_t v41 = (uint64_t)a1
                    + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__recurrenceRule;
                swift_beginAccess();
                sub_22BFF6228(v41, (uint64_t)v21, &qword_2684973F8);
                uint64_t v42 = (uint64_t)a2
                    + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__recurrenceRule;
                swift_beginAccess();
                uint64_t v43 = v96;
                uint64_t v44 = v96 + *(int *)(v14 + 48);
                sub_22BFF6228((uint64_t)v21, v96, &qword_2684973F8);
                uint64_t v87 = v44;
                sub_22BFF6228(v42, v44, &qword_2684973F8);
                uint64_t v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v95 + 48);
                if (v45(v43, 1, v11) == 1)
                {
                  uint64_t v46 = v96;
                  sub_22BFF628C((uint64_t)v21, &qword_2684973F8);
                  if (v45(v87, 1, v11) == 1)
                  {
                    sub_22BFF628C(v46, &qword_2684973F8);
LABEL_33:
                    tls_ciphersuite_t v52 = (unsigned __int8 *)a1
                        + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__allDay;
                    swift_beginAccess();
                    int v53 = *v52;
                    uint64_t v54 = (unsigned __int8 *)a2
                        + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__allDay;
                    swift_beginAccess();
                    if (v53 != *v54) {
                      goto LABEL_54;
                    }
                    uint64_t v55 = (void *)((char *)a1
                                   + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability);
                    swift_beginAccess();
                    uint64_t v56 = *v55;
                    uint64_t v57 = (char *)a2
                        + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__eventAvailability;
                    swift_beginAccess();
                    uint64_t v58 = *(void *)v57;
                    if (v57[8] == 1)
                    {
                      switch(v58)
                      {
                        case 1:
                          if (v56 != 1) {
                            goto LABEL_54;
                          }
                          goto LABEL_39;
                        case 2:
                          if (v56 != 2) {
                            goto LABEL_54;
                          }
                          goto LABEL_39;
                        case 3:
                          if (v56 != 3) {
                            goto LABEL_54;
                          }
                          goto LABEL_39;
                        case 4:
                          if (v56 != 4) {
                            goto LABEL_54;
                          }
                          goto LABEL_39;
                        case 5:
                          if (v56 != 5) {
                            goto LABEL_54;
                          }
                          goto LABEL_39;
                        default:
                          if (!v56) {
                            goto LABEL_39;
                          }
                          goto LABEL_54;
                      }
                    }
                    if (v56 != v58) {
                      goto LABEL_54;
                    }
LABEL_39:
                    v59 = (void *)((char *)a1
                                   + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__startDate);
                    swift_beginAccess();
                    uint64_t v60 = *v59;
                    v61 = (void *)((char *)a2
                                   + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__startDate);
                    swift_beginAccess();
                    if (v60 != *v61) {
                      goto LABEL_54;
                    }
                    v62 = (void *)((char *)a1
                                   + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__endDate);
                    swift_beginAccess();
                    uint64_t v63 = *v62;
                    uint64_t v64 = (void *)((char *)a2
                                   + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__endDate);
                    swift_beginAccess();
                    if (v63 != *v64
                      || (unint64_t v65 = (void *)((char *)a1
                                         + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__occurrenceDate),
                          swift_beginAccess(),
                          uint64_t v66 = *v65,
                          uint64_t v67 = (void *)((char *)a2
                                         + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__occurrenceDate),
                          swift_beginAccess(),
                          v66 != *v67))
                    {
LABEL_54:
                      char v24 = 0;
LABEL_55:
                      swift_release();
                      swift_release();
                      return v24 & 1;
                    }
                    uint64_t v68 = (uint64_t)a1
                        + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer;
                    swift_beginAccess();
                    uint64_t v69 = v93;
                    sub_22BFF6228(v68, v93, &qword_2684973E8);
                    uint64_t v70 = (uint64_t)a2
                        + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__organizer;
                    swift_beginAccess();
                    uint64_t v71 = v94;
                    uint64_t v72 = v94 + *(int *)(v90 + 48);
                    sub_22BFF6228(v69, v94, &qword_2684973E8);
                    sub_22BFF6228(v70, v72, &qword_2684973E8);
                    uint64_t v73 = v92;
                    uint64_t v74 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48);
                    if (v74(v71, 1, v92) == 1)
                    {
                      sub_22BFF628C(v93, &qword_2684973E8);
                      if (v74(v72, 1, v73) == 1)
                      {
                        sub_22BFF628C(v94, &qword_2684973E8);
LABEL_60:
                        v78 = (void *)((char *)a1
                                       + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status);
                        swift_beginAccess();
                        uint64_t v79 = *v78;
                        uint64_t v80 = (char *)a2
                            + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__status;
                        swift_beginAccess();
                        uint64_t v81 = *(void *)v80;
                        if (v80[8] == 1)
                        {
                          switch(v81)
                          {
                            case 1:
                              if (v79 == 1) {
                                goto LABEL_71;
                              }
                              goto LABEL_54;
                            case 2:
                              if (v79 == 2) {
                                goto LABEL_71;
                              }
                              goto LABEL_54;
                            case 3:
                              if (v79 == 3) {
                                goto LABEL_71;
                              }
                              goto LABEL_54;
                            default:
                              if (!v79) {
                                goto LABEL_71;
                              }
                              goto LABEL_54;
                          }
                        }
                        if (v79 == v81)
                        {
LABEL_71:
                          id v82 = (void *)((char *)a1
                                         + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__attachments);
                          swift_beginAccess();
                          uint64_t v83 = *v82;
                          uint64_t v84 = (void *)((char *)a2
                                         + OBJC_IVAR____TtCV12MigrationKit13CalendarEventP33_4110E674B8E140B2ADDA532A7655A21F13_StorageClass__attachments);
                          swift_beginAccess();
                          uint64_t v85 = *v84;
                          swift_bridgeObjectRetain();
                          swift_bridgeObjectRetain();
                          char v24 = sub_22BFF4E44(v83, v85);
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          goto LABEL_55;
                        }
                        goto LABEL_54;
                      }
                    }
                    else
                    {
                      uint64_t v75 = v89;
                      sub_22BFF6228(v94, v89, &qword_2684973E8);
                      if (v74(v72, 1, v73) != 1)
                      {
                        uint64_t v76 = v88;
                        sub_22BFF564C(v72, v88, type metadata accessor for Participant);
                        char v77 = sub_22BFF6704(v75, v76);
                        sub_22BFF55EC(v76, type metadata accessor for Participant);
                        sub_22BFF628C(v93, &qword_2684973E8);
                        sub_22BFF55EC(v75, type metadata accessor for Participant);
                        sub_22BFF628C(v94, &qword_2684973E8);
                        if ((v77 & 1) == 0) {
                          goto LABEL_54;
                        }
                        goto LABEL_60;
                      }
                      sub_22BFF628C(v93, &qword_2684973E8);
                      sub_22BFF55EC(v75, type metadata accessor for Participant);
                    }
                    v49 = &qword_2684973E0;
                    uint64_t v50 = v94;
LABEL_31:
                    sub_22BFF628C(v50, v49);
                    goto LABEL_54;
                  }
                }
                else
                {
                  sub_22BFF6228(v96, (uint64_t)v19, &qword_2684973F8);
                  uint64_t v48 = v87;
                  if (v45(v87, 1, v11) != 1)
                  {
                    sub_22BFF564C(v48, (uint64_t)v13, type metadata accessor for RecurrenceRule);
                    char v51 = sub_22BFF5B28((uint64_t)v19, (uint64_t)v13);
                    sub_22BFF55EC((uint64_t)v13, type metadata accessor for RecurrenceRule);
                    sub_22BFF628C((uint64_t)v21, &qword_2684973F8);
                    sub_22BFF55EC((uint64_t)v19, type metadata accessor for RecurrenceRule);
                    sub_22BFF628C(v96, &qword_2684973F8);
                    if ((v51 & 1) == 0) {
                      goto LABEL_54;
                    }
                    goto LABEL_33;
                  }
                  uint64_t v46 = v96;
                  sub_22BFF628C((uint64_t)v21, &qword_2684973F8);
                  sub_22BFF55EC((uint64_t)v19, type metadata accessor for RecurrenceRule);
                }
                v49 = &qword_2684973F0;
                uint64_t v50 = v46;
                goto LABEL_31;
              }
            }
          }
        }
        else
        {
          char v24 = 0;
        }
      }
    }
  }
  return v24 & 1;
}

uint64_t sub_22BFEF394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22C01DF48();
  uint64_t v4 = *(int *)(a1 + 20);
  if (qword_268497060 != -1) {
    swift_once();
  }
  *(void *)(a2 + v4) = qword_268497178;
  return swift_retain();
}

uint64_t sub_22BFEF40C()
{
  return 0x7261646E656C6143;
}

uint64_t sub_22BFEF430@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22C01DF58();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_22BFEF498(uint64_t a1)
{
  uint64_t v3 = sub_22C01DF58();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*sub_22BFEF500())()
{
  return nullsub_1;
}

uint64_t sub_22BFEF520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22BFECCA4(a1, a2, a3);
}

uint64_t sub_22BFEF538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22BFEDA7C(a1, a2, a3);
}

uint64_t sub_22BFEF550(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497408, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFEF5CC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497058, (uint64_t)qword_26849DC68, a1);
}

uint64_t sub_22BFEF5F0(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_268497380, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFEF65C()
{
  sub_22BFF2CCC(&qword_268497380, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
  return sub_22C01E088();
}

uint64_t sub_22BFEF6DC()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DC80);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DC80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "name";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "participantIdentifier";
  *(void *)(v10 + 8) = 21;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "participantRole";
  *((void *)v12 + 1) = 15;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)uint64_t v14 = "participantStatus";
  *((void *)v14 + 1) = 17;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "participantType";
  *(void *)(v15 + 8) = 15;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22BFEF960()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          sub_22C01E018();
          break;
        case 3:
          sub_22BFF6B24();
          goto LABEL_5;
        case 4:
          sub_22BFF6B78();
          goto LABEL_5;
        case 5:
          sub_22BFF6BCC();
LABEL_5:
          sub_22C01DFB8();
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFEFABC()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
    {
      if (!v0[4] || (sub_22BFF6B24(), uint64_t result = sub_22C01E0B8(), !v1))
      {
        if (!v0[6] || (sub_22BFF6B78(), uint64_t result = sub_22C01E0B8(), !v1))
        {
          if (!v0[8] || (sub_22BFF6BCC(), uint64_t result = sub_22C01E0B8(), !v1))
          {
            type metadata accessor for Participant(0);
            return sub_22C01DF38();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_22BFEFC68@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 1;
  return sub_22C01DF48();
}

uint64_t sub_22BFEFCB0()
{
  return 0x7069636974726150;
}

uint64_t sub_22BFEFCD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22BFEFD40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 36);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22BFEFDB0())()
{
  return nullsub_1;
}

uint64_t sub_22BFEFDD4()
{
  return sub_22BFEF960();
}

uint64_t sub_22BFEFDEC()
{
  return sub_22BFEFABC();
}

uint64_t sub_22BFEFE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497420, (void (*)(uint64_t))type metadata accessor for Participant);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFEFE80@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497068, (uint64_t)qword_26849DC80, a1);
}

uint64_t sub_22BFEFEA4(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_268497360, (void (*)(uint64_t))type metadata accessor for Participant);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFEFF10()
{
  sub_22BFF2CCC(&qword_268497360, (void (*)(uint64_t))type metadata accessor for Participant);
  return sub_22C01E088();
}

uint64_t sub_22BFEFF90(uint64_t a1)
{
  return sub_22BFF176C(a1, qword_26849DC98, (uint64_t)"absoluteDate", (uint64_t)"relativeOffset", 14);
}

uint64_t sub_22BFEFFB0()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_22C01E008();
      }
      else if (result == 1)
      {
        sub_22C01E038();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFF0054()
{
  if (!*v0 || (uint64_t result = sub_22C01E128(), !v1))
  {
    if (!v0[1] || (uint64_t result = sub_22C01E0F8(), !v1))
    {
      type metadata accessor for Alarm(0);
      return sub_22C01DF38();
    }
  }
  return result;
}

uint64_t sub_22BFF0114@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  return sub_22C01DF48();
}

uint64_t sub_22BFF0138()
{
  return 0x6D72616C41;
}

uint64_t (*sub_22BFF0154())()
{
  return nullsub_1;
}

uint64_t sub_22BFF0178()
{
  return sub_22BFEFFB0();
}

uint64_t sub_22BFF0190()
{
  return sub_22BFF0054();
}

uint64_t sub_22BFF01A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497440, (void (*)(uint64_t))type metadata accessor for Alarm);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFF0224@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497070, (uint64_t)qword_26849DC98, a1);
}

uint64_t sub_22BFF0248(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_268497340, (void (*)(uint64_t))type metadata accessor for Alarm);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFF02B4()
{
  sub_22BFF2CCC(&qword_268497340, (void (*)(uint64_t))type metadata accessor for Alarm);
  return sub_22C01E088();
}

uint64_t sub_22BFF0334()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DCB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DCB0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_22C024310;
  unint64_t v4 = v28 + v3;
  unint64_t v5 = v28 + v3 + v1[14];
  *(void *)(v28 + v3) = 1;
  *(void *)unint64_t v5 = "recurrenceRuleId";
  *(void *)(v5 + 8) = 16;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v28 + v3 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "recurrenceFrequency";
  *(void *)(v9 + 8) = 19;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v28 + v3 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "recurrenceEnd";
  *((void *)v11 + 1) = 13;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v28 + v3 + 3 * v2);
  unint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)unint64_t v13 = "interval";
  *((void *)v13 + 1) = 8;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v28 + v3 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 5;
  *(void *)uint64_t v15 = "firstDayOfTheWeek";
  *((void *)v15 + 1) = 17;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v28 + v3 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "daysOfTheWeek";
  *((void *)v17 + 1) = 13;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v28 + v3 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 7;
  *(void *)uint64_t v19 = "daysOfTheMonth";
  *((void *)v19 + 1) = 14;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v28 + v3 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "daysOfTheYear";
  *((void *)v21 + 1) = 13;
  v21[16] = 2;
  v8();
  uint64_t v22 = v28 + v3 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "weeksOfTheMonth";
  *(void *)(v22 + 8) = 15;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v28 + v3 + 9 * v2);
  char v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)char v24 = "monthsOfTheYear";
  *((void *)v24 + 1) = 15;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v28 + v3 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  void *v25 = 11;
  *(void *)uint64_t v26 = "setPositions";
  *((void *)v26 + 1) = 12;
  v26[16] = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22BFF0718()
{
  uint64_t result = sub_22C01DF98();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          uint64_t v4 = v3;
          sub_22C01E018();
          goto LABEL_11;
        case 2:
          sub_22BFF6C20();
          uint64_t v4 = v3;
          sub_22C01DFB8();
          goto LABEL_11;
        case 3:
          uint64_t v4 = v3;
          sub_22BFF0944();
          goto LABEL_11;
        case 4:
        case 5:
          uint64_t v4 = v3;
          sub_22C01E028();
          goto LABEL_11;
        case 6:
          type metadata accessor for RecurrenceDayOfWeek(0);
          sub_22BFF2CCC(&qword_2684972E0, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
          uint64_t v4 = v3;
          sub_22C01E048();
          goto LABEL_11;
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
          uint64_t v4 = v3;
          sub_22C01DFF8();
LABEL_11:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFF0944()
{
  return sub_22C01E058();
}

uint64_t sub_22BFF09F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  unint64_t v9 = *(void *)(v5 + 8);
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = *(void *)v5 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10 || (uint64_t result = sub_22C01E108(), !v4))
  {
    if (!*(void *)(v5 + 16) || (sub_22BFF6C20(), uint64_t result = sub_22C01E0B8(), !v4))
    {
      uint64_t result = sub_22BFF0C94(v5, a1, a2, a3);
      if (!v4)
      {
        if (*(_DWORD *)(v5 + 28)) {
          sub_22C01E118();
        }
        if (*(_DWORD *)(v5 + 32)) {
          sub_22C01E118();
        }
        if (*(void *)(*(void *)(v5 + 40) + 16))
        {
          type metadata accessor for RecurrenceDayOfWeek(0);
          sub_22BFF2CCC(&qword_2684972E0, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
          sub_22C01E138();
        }
        if (*(void *)(*(void *)(v5 + 48) + 16)) {
          sub_22C01E098();
        }
        if (*(void *)(*(void *)(v5 + 56) + 16)) {
          sub_22C01E098();
        }
        if (*(void *)(*(void *)(v5 + 64) + 16)) {
          sub_22C01E098();
        }
        if (*(void *)(*(void *)(v5 + 72) + 16)) {
          sub_22C01E098();
        }
        if (*(void *)(*(void *)(v5 + 80) + 16)) {
          sub_22C01E098();
        }
        type metadata accessor for RecurrenceRule(0);
        return sub_22C01DF38();
      }
    }
  }
  return result;
}

uint64_t sub_22BFF0C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RecurrenceEnd(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for RecurrenceRule(0);
  sub_22BFF6228(a1 + *(int *)(v12 + 60), (uint64_t)v7, &qword_268497218);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_22BFF628C((uint64_t)v7, &qword_268497218);
  }
  sub_22BFF564C((uint64_t)v7, (uint64_t)v11, type metadata accessor for RecurrenceEnd);
  sub_22BFF2CCC(&qword_268497300, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
  sub_22C01E148();
  return sub_22BFF55EC((uint64_t)v11, type metadata accessor for RecurrenceEnd);
}

uint64_t sub_22BFF0E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0xE000000000000000;
  *(void *)(a2 + 16) = 0;
  *(unsigned char *)(a2 + 24) = 1;
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)(a2 + 40) = MEMORY[0x263F8EE78];
  *(void *)(a2 + 48) = v4;
  *(void *)(a2 + 56) = v4;
  *(void *)(a2 + 64) = v4;
  *(void *)(a2 + 72) = v4;
  *(void *)(a2 + 80) = v4;
  *(_DWORD *)(a2 + 28) = 0;
  *(_DWORD *)(a2 + 32) = 0;
  sub_22C01DF48();
  uint64_t v5 = a2 + *(int *)(a1 + 60);
  uint64_t v6 = type metadata accessor for RecurrenceEnd(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, 1, 1, v6);
}

uint64_t sub_22BFF0F48()
{
  return 0x6E65727275636552;
}

uint64_t sub_22BFF0F6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 56);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22BFF0FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 56);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22BFF104C())()
{
  return nullsub_1;
}

uint64_t sub_22BFF1070()
{
  return sub_22BFF0718();
}

uint64_t sub_22BFF1088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22BFF09F4(a1, a2, a3);
}

uint64_t sub_22BFF10A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497448, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFF111C@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497078, (uint64_t)qword_26849DCB0, a1);
}

uint64_t sub_22BFF1140(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_268497320, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFF11AC()
{
  sub_22BFF2CCC(&qword_268497320, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
  return sub_22C01E088();
}

uint64_t sub_22BFF122C()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DCC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DCC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C024320;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "EndDate";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "occurrenceCount";
  *((void *)v10 + 1) = 15;
  v10[16] = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22BFF13E4()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_22C01E028();
      }
      else if (result == 1)
      {
        sub_22C01E038();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFF1488()
{
  if (!*(void *)v0 || (uint64_t result = sub_22C01E128(), !v1))
  {
    if (!*(_DWORD *)(v0 + 8) || (uint64_t result = sub_22C01E118(), !v1))
    {
      type metadata accessor for RecurrenceEnd(0);
      return sub_22C01DF38();
    }
  }
  return result;
}

uint64_t sub_22BFF1544@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  return sub_22C01DF48();
}

uint64_t sub_22BFF156C()
{
  return 0x6E65727275636552;
}

uint64_t sub_22BFF1590()
{
  return sub_22BFF13E4();
}

uint64_t sub_22BFF15A8()
{
  return sub_22BFF1488();
}

uint64_t sub_22BFF15C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497458, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFF163C@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497080, (uint64_t)qword_26849DCC8, a1);
}

uint64_t sub_22BFF1660(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_268497300, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFF16CC()
{
  sub_22BFF2CCC(&qword_268497300, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
  return sub_22C01E088();
}

uint64_t sub_22BFF174C(uint64_t a1)
{
  return sub_22BFF176C(a1, qword_26849DCE0, (uint64_t)"dayOfTheWeek", (uint64_t)"weekNumber", 10);
}

uint64_t sub_22BFF176C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_22C01E178();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v8 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v9 = *(void *)(*(void *)v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22C024320;
  uint64_t v12 = (void *)(v11 + v10);
  unint64_t v13 = v11 + v10 + v8[14];
  *uint64_t v12 = 1;
  *(void *)unint64_t v13 = a3;
  *(void *)(v13 + 8) = 12;
  *(unsigned char *)(v13 + 16) = 2;
  uint64_t v14 = *MEMORY[0x263F50718];
  uint64_t v15 = sub_22C01E158();
  uint64_t v16 = *(void (**)(void))(*(void *)(v15 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v16)(v13, v14, v15);
  uint64_t v17 = (char *)v12 + v9 + v8[14];
  *(void *)((char *)v12 + v9) = 2;
  *(void *)uint64_t v17 = a4;
  *((void *)v17 + 1) = a5;
  v17[16] = 2;
  v16();
  return sub_22C01E168();
}

uint64_t sub_22BFF191C()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_22C01E028();
      }
      else if (result == 1)
      {
        sub_22BFF6C74();
        sub_22C01DFB8();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFF1A00()
{
  if (!*(void *)v0 || (sub_22BFF6C74(), uint64_t result = sub_22C01E0B8(), !v1))
  {
    if (!*(_DWORD *)(v0 + 12) || (uint64_t result = sub_22C01E118(), !v1))
    {
      type metadata accessor for RecurrenceDayOfWeek(0);
      return sub_22C01DF38();
    }
  }
  return result;
}

uint64_t sub_22BFF1AE4@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(_DWORD *)(a1 + 12) = 0;
  return sub_22C01DF48();
}

unint64_t sub_22BFF1B14()
{
  return 0xD000000000000013;
}

uint64_t sub_22BFF1B30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_22C01DF58();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22BFF1BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_22C01DF58();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_22BFF1C10()
{
  return sub_22BFF191C();
}

uint64_t sub_22BFF1C28()
{
  return sub_22BFF1A00();
}

uint64_t sub_22BFF1C40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497460, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFF1CBC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497088, (uint64_t)qword_26849DCE0, a1);
}

uint64_t sub_22BFF1CE0(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_2684972E0, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFF1D4C()
{
  sub_22BFF2CCC(&qword_2684972E0, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
  return sub_22C01E088();
}

uint64_t sub_22BFF1DCC()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DCF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DCF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C024330;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "URL";
  *(void *)(v6 + 8) = 3;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "mimeType";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "fileSize";
  *(void *)(v11 + 8) = 8;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22BFF1FCC()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 3)
      {
        sub_22C01E038();
      }
      else if (result == 2 || result == 1)
      {
        sub_22C01E018();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFF2084()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
    {
      if (!v0[4] || (uint64_t result = sub_22C01E128(), !v1))
      {
        type metadata accessor for Attachment(0);
        return sub_22C01DF38();
      }
    }
  }
  return result;
}

uint64_t sub_22BFF2188@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  return sub_22C01DF48();
}

uint64_t sub_22BFF21B8()
{
  return 0x656D686361747441;
}

uint64_t sub_22BFF21D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22BFF2244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 28);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22BFF22B4())()
{
  return nullsub_1;
}

uint64_t sub_22BFF22D8()
{
  return sub_22BFF1FCC();
}

uint64_t sub_22BFF22F0()
{
  return sub_22BFF2084();
}

uint64_t sub_22BFF2308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497470, (void (*)(uint64_t))type metadata accessor for Attachment);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFF2384@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497090, (uint64_t)qword_26849DCF8, a1);
}

uint64_t sub_22BFF23A8(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_2684972C0, (void (*)(uint64_t))type metadata accessor for Attachment);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFF2414()
{
  sub_22BFF2CCC(&qword_2684972C0, (void (*)(uint64_t))type metadata accessor for Attachment);
  return sub_22C01E088();
}

uint64_t sub_22BFF2494()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DD10);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DD10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22C024340;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "calendars";
  *(void *)(v4 + 8) = 9;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_22C01E158();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_22C01E168();
}

uint64_t sub_22BFF25F0()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        type metadata accessor for Calendar(0);
        sub_22BFF2CCC(&qword_2684973A0, (void (*)(uint64_t))type metadata accessor for Calendar);
        sub_22C01E048();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFF26E0()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for Calendar(0),
        sub_22BFF2CCC(&qword_2684973A0, (void (*)(uint64_t))type metadata accessor for Calendar),
        uint64_t result = sub_22C01E138(),
        !v1))
  {
    type metadata accessor for GetCalendarsResponse(0);
    return sub_22C01DF38();
  }
  return result;
}

uint64_t sub_22BFF27CC@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  return sub_22C01DF48();
}

unint64_t sub_22BFF27F8()
{
  return 0xD000000000000014;
}

uint64_t sub_22BFF2814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22BFF2884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22BFF28F4())()
{
  return nullsub_1;
}

uint64_t sub_22BFF2918()
{
  return sub_22BFF25F0();
}

uint64_t sub_22BFF2930()
{
  return sub_22BFF26E0();
}

uint64_t sub_22BFF2948(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFF2CCC(&qword_268497478, (void (*)(uint64_t))type metadata accessor for GetCalendarsResponse);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFF29C4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497098, (uint64_t)qword_26849DD10, a1);
}

uint64_t sub_22BFF29E8@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_22C01E178();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_22BFF2A84(uint64_t a1)
{
  uint64_t v2 = sub_22BFF2CCC(&qword_2684972A0, (void (*)(uint64_t))type metadata accessor for GetCalendarsResponse);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFF2AF0()
{
  return sub_22C01E878();
}

uint64_t sub_22BFF2B48()
{
  sub_22BFF2CCC(&qword_2684972A0, (void (*)(uint64_t))type metadata accessor for GetCalendarsResponse);
  return sub_22C01E088();
}

uint64_t sub_22BFF2BC4()
{
  return sub_22C01E878();
}

uint64_t sub_22BFF2C1C()
{
  return sub_22BFF2CCC(&qword_268497298, (void (*)(uint64_t))type metadata accessor for GetCalendarsResponse);
}

uint64_t type metadata accessor for GetCalendarsResponse(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_268497490);
}

uint64_t sub_22BFF2C84()
{
  return sub_22BFF2CCC(&qword_2684972A0, (void (*)(uint64_t))type metadata accessor for GetCalendarsResponse);
}

uint64_t sub_22BFF2CCC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22BFF2D14()
{
  return sub_22BFF2CCC(&qword_2684972A8, (void (*)(uint64_t))type metadata accessor for GetCalendarsResponse);
}

uint64_t sub_22BFF2D5C()
{
  return sub_22BFF2CCC(&qword_2684972B0, (void (*)(uint64_t))type metadata accessor for GetCalendarsResponse);
}

uint64_t sub_22BFF2DA4()
{
  return sub_22BFF2CCC(&qword_2684972B8, (void (*)(uint64_t))type metadata accessor for Attachment);
}

uint64_t sub_22BFF2DEC()
{
  return sub_22BFF2CCC(&qword_2684972C0, (void (*)(uint64_t))type metadata accessor for Attachment);
}

uint64_t sub_22BFF2E34()
{
  return sub_22BFF2CCC(&qword_2684972C8, (void (*)(uint64_t))type metadata accessor for Attachment);
}

uint64_t sub_22BFF2E7C()
{
  return sub_22BFF2CCC(&qword_2684972D0, (void (*)(uint64_t))type metadata accessor for Attachment);
}

uint64_t sub_22BFF2EC4()
{
  return sub_22BFF2CCC(&qword_2684972D8, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
}

uint64_t type metadata accessor for RecurrenceDayOfWeek(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684974B0);
}

uint64_t sub_22BFF2F2C()
{
  return sub_22BFF2CCC(&qword_2684972E0, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
}

uint64_t sub_22BFF2F74()
{
  return sub_22BFF2CCC(&qword_2684972E8, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
}

uint64_t sub_22BFF2FBC()
{
  return sub_22BFF2CCC(&qword_2684972F0, (void (*)(uint64_t))type metadata accessor for RecurrenceDayOfWeek);
}

uint64_t sub_22BFF3004()
{
  return sub_22BFF2CCC(&qword_2684972F8, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
}

uint64_t sub_22BFF304C()
{
  return sub_22BFF2CCC(&qword_268497300, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
}

uint64_t sub_22BFF3094()
{
  return sub_22BFF2CCC(&qword_268497308, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
}

uint64_t sub_22BFF30DC()
{
  return sub_22BFF2CCC(&qword_268497310, (void (*)(uint64_t))type metadata accessor for RecurrenceEnd);
}

uint64_t sub_22BFF3124()
{
  return sub_22BFF2CCC(&qword_268497318, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
}

uint64_t sub_22BFF316C()
{
  return sub_22BFF2CCC(&qword_268497320, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
}

uint64_t sub_22BFF31B4()
{
  return sub_22BFF2CCC(&qword_268497328, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
}

uint64_t sub_22BFF31FC()
{
  return sub_22BFF2CCC(&qword_268497330, (void (*)(uint64_t))type metadata accessor for RecurrenceRule);
}

uint64_t sub_22BFF3244()
{
  return sub_22BFF2CCC(&qword_268497338, (void (*)(uint64_t))type metadata accessor for Alarm);
}

uint64_t sub_22BFF328C()
{
  return sub_22BFF2CCC(&qword_268497340, (void (*)(uint64_t))type metadata accessor for Alarm);
}

uint64_t sub_22BFF32D4()
{
  return sub_22BFF2CCC(&qword_268497348, (void (*)(uint64_t))type metadata accessor for Alarm);
}

uint64_t sub_22BFF331C()
{
  return sub_22BFF2CCC(&qword_268497350, (void (*)(uint64_t))type metadata accessor for Alarm);
}

uint64_t sub_22BFF3364()
{
  return sub_22BFF2CCC(&qword_268497358, (void (*)(uint64_t))type metadata accessor for Participant);
}

uint64_t sub_22BFF33AC()
{
  return sub_22BFF2CCC(&qword_268497360, (void (*)(uint64_t))type metadata accessor for Participant);
}

uint64_t sub_22BFF33F4()
{
  return sub_22BFF2CCC(&qword_268497368, (void (*)(uint64_t))type metadata accessor for Participant);
}

uint64_t sub_22BFF343C()
{
  return sub_22BFF2CCC(&qword_268497370, (void (*)(uint64_t))type metadata accessor for Participant);
}

uint64_t sub_22BFF3484()
{
  return sub_22BFF2CCC(&qword_268497378, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
}

uint64_t type metadata accessor for CalendarEvent(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684974A0);
}

uint64_t sub_22BFF34EC()
{
  return sub_22BFF2CCC(&qword_268497380, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
}

uint64_t sub_22BFF3534()
{
  return sub_22BFF2CCC(&qword_268497388, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
}

uint64_t sub_22BFF357C()
{
  return sub_22BFF2CCC(&qword_268497390, (void (*)(uint64_t))type metadata accessor for CalendarEvent);
}

uint64_t sub_22BFF35C4()
{
  return sub_22BFF2CCC(&qword_268497398, (void (*)(uint64_t))type metadata accessor for Calendar);
}

uint64_t type metadata accessor for Calendar(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_268497480);
}

uint64_t sub_22BFF362C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BFF3664()
{
  return sub_22BFF2CCC(&qword_2684973A0, (void (*)(uint64_t))type metadata accessor for Calendar);
}

uint64_t sub_22BFF36AC()
{
  return sub_22BFF2CCC(&qword_2684973A8, (void (*)(uint64_t))type metadata accessor for Calendar);
}

uint64_t sub_22BFF36F4()
{
  return sub_22BFF2CCC(&qword_2684973B0, (void (*)(uint64_t))type metadata accessor for Calendar);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_22BFF37D8()
{
  unint64_t result = qword_2684973D0;
  if (!qword_2684973D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684973D0);
  }
  return result;
}

uint64_t sub_22BFF382C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for File(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (uint64_t *)((char *)&v16 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2) {
      return 1;
    }
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v17 = *(void *)(v8 + 72);
    while (1)
    {
      sub_22BFF62E8(a1 + v12, (uint64_t)v10, type metadata accessor for File);
      sub_22BFF62E8(a2 + v12, (uint64_t)v7, type metadata accessor for File);
      BOOL v13 = *v10 == *v7 && v10[1] == v7[1];
      if (!v13 && (sub_22C01E7D8() & 1) == 0) {
        break;
      }
      BOOL v14 = v10[2] == v7[2] && v10[3] == v7[3];
      if (!v14 && (sub_22C01E7D8() & 1) == 0) {
        break;
      }
      if (v10[4] != v7[4]) {
        break;
      }
      if (v10[5] != v7[5]) {
        break;
      }
      if (v10[6] != v7[6]) {
        break;
      }
      sub_22C01DF58();
      sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
      if ((sub_22C01E488() & 1) == 0) {
        break;
      }
      sub_22BFF55EC((uint64_t)v7, type metadata accessor for File);
      sub_22BFF55EC((uint64_t)v10, type metadata accessor for File);
      v12 += v17;
      if (!--v11) {
        return 1;
      }
    }
    sub_22BFF55EC((uint64_t)v7, type metadata accessor for File);
    sub_22BFF55EC((uint64_t)v10, type metadata accessor for File);
  }
  return 0;
}

uint64_t sub_22BFF3AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Call(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v23 = 1;
      return v23 & 1;
    }
    uint64_t v12 = 0;
    unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v29 = a1 + v13;
    uint64_t v14 = a2 + v13;
    uint64_t v15 = *(void *)(v8 + 72);
    while (1)
    {
      sub_22BFF62E8(v29 + v15 * v12, (uint64_t)v10, type metadata accessor for Call);
      sub_22BFF62E8(v14 + v15 * v12, (uint64_t)v7, type metadata accessor for Call);
      BOOL v16 = *(void *)v10 == *(void *)v7 && *((void *)v10 + 1) == *((void *)v7 + 1);
      if (!v16 && (sub_22C01E7D8() & 1) == 0) {
        break;
      }
      uint64_t v17 = *((void *)v10 + 2);
      uint64_t v18 = *((void *)v7 + 2);
      if (v7[24] == 1)
      {
        switch(v18)
        {
          case 1:
            if (v17 != 1) {
              goto LABEL_60;
            }
            goto LABEL_15;
          case 2:
            if (v17 != 2) {
              goto LABEL_60;
            }
            goto LABEL_15;
          case 3:
            if (v17 != 3) {
              goto LABEL_60;
            }
            goto LABEL_15;
          case 4:
            if (v17 != 4) {
              goto LABEL_60;
            }
            goto LABEL_15;
          case 5:
            if (v17 != 5) {
              goto LABEL_60;
            }
            goto LABEL_15;
          case 6:
            if (v17 != 6) {
              goto LABEL_60;
            }
            goto LABEL_15;
          case 7:
            if (v17 != 7) {
              goto LABEL_60;
            }
            goto LABEL_15;
          case 8:
            if (v17 != 8) {
              goto LABEL_60;
            }
            goto LABEL_15;
          default:
            if (v17) {
              goto LABEL_60;
            }
            goto LABEL_15;
        }
      }
      if (v17 != v18) {
        break;
      }
LABEL_15:
      if ((*((void *)v10 + 4) != *((void *)v7 + 4) || *((void *)v10 + 5) != *((void *)v7 + 5))
        && (sub_22C01E7D8() & 1) == 0)
      {
        break;
      }
      uint64_t v19 = (void *)*((void *)v10 + 6);
      uint64_t v20 = (void *)*((void *)v7 + 6);
      uint64_t v21 = v19[2];
      if (v21 != v20[2]) {
        break;
      }
      if (v21 && v19 != v20)
      {
        if ((v19[4] != v20[4] || v19[5] != v20[5]) && (sub_22C01E7D8() & 1) == 0) {
          break;
        }
        uint64_t v22 = v21 - 1;
        if (v22)
        {
          char v24 = v20 + 7;
          uint64_t v25 = v19 + 7;
          do
          {
            BOOL v26 = *(v25 - 1) == *(v24 - 1) && *v25 == *v24;
            if (!v26 && (sub_22C01E7D8() & 1) == 0) {
              goto LABEL_60;
            }
            v24 += 2;
            v25 += 2;
          }
          while (--v22);
        }
      }
      if (v10[56] != v7[56]
        || *((void *)v10 + 8) != *((void *)v7 + 8)
        || *((void *)v10 + 9) != *((void *)v7 + 9)
        || (*((void *)v10 + 10) != *((void *)v7 + 10) || *((void *)v10 + 11) != *((void *)v7 + 11))
        && (sub_22C01E7D8() & 1) == 0
        || (*((void *)v10 + 12) != *((void *)v7 + 12) || *((void *)v10 + 13) != *((void *)v7 + 13))
        && (sub_22C01E7D8() & 1) == 0)
      {
        break;
      }
      sub_22C01DF58();
      sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
      char v23 = sub_22C01E488();
      sub_22BFF55EC((uint64_t)v7, type metadata accessor for Call);
      sub_22BFF55EC((uint64_t)v10, type metadata accessor for Call);
      if ((v23 & 1) != 0 && ++v12 != v11) {
        continue;
      }
      return v23 & 1;
    }
LABEL_60:
    sub_22BFF55EC((uint64_t)v7, type metadata accessor for Call);
    sub_22BFF55EC((uint64_t)v10, type metadata accessor for Call);
  }
  char v23 = 0;
  return v23 & 1;
}

uint64_t sub_22BFF3F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CalendarEvent(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2) {
      return 1;
    }
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v19 = *(void *)(v8 + 72);
    while (1)
    {
      sub_22BFF62E8(a1 + v12, (uint64_t)v10, type metadata accessor for CalendarEvent);
      sub_22BFF62E8(a2 + v12, (uint64_t)v7, type metadata accessor for CalendarEvent);
      uint64_t v13 = *(int *)(v4 + 20);
      uint64_t v14 = *(void **)&v10[v13];
      uint64_t v15 = *(void **)&v7[v13];
      if (v14 != v15)
      {
        swift_retain();
        swift_retain();
        char v16 = sub_22BFEE644(v14, v15);
        swift_release();
        swift_release();
        if ((v16 & 1) == 0) {
          break;
        }
      }
      sub_22C01DF58();
      sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
      if ((sub_22C01E488() & 1) == 0) {
        break;
      }
      sub_22BFF55EC((uint64_t)v7, type metadata accessor for CalendarEvent);
      sub_22BFF55EC((uint64_t)v10, type metadata accessor for CalendarEvent);
      v12 += v19;
      if (!--v11) {
        return 1;
      }
    }
    sub_22BFF55EC((uint64_t)v7, type metadata accessor for CalendarEvent);
    sub_22BFF55EC((uint64_t)v10, type metadata accessor for CalendarEvent);
  }
  return 0;
}

uint64_t sub_22BFF4174(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Album(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2) {
      return 1;
    }
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v17 = *(void *)(v8 + 72);
    while (1)
    {
      sub_22BFF62E8(a1 + v12, (uint64_t)v10, type metadata accessor for Album);
      sub_22BFF62E8(a2 + v12, (uint64_t)v7, type metadata accessor for Album);
      BOOL v13 = *(void *)v10 == *(void *)v7 && *((void *)v10 + 1) == *((void *)v7 + 1);
      if (!v13 && (sub_22C01E7D8() & 1) == 0) {
        break;
      }
      BOOL v14 = *((void *)v10 + 2) == *((void *)v7 + 2) && *((void *)v10 + 3) == *((void *)v7 + 3);
      if (!v14 && (sub_22C01E7D8() & 1) == 0
        || v10[32] != v7[32]
        || v10[33] != v7[33]
        || v10[34] != v7[34]
        || (*((void *)v10 + 5) != *((void *)v7 + 5) || *((void *)v10 + 6) != *((void *)v7 + 6))
        && (sub_22C01E7D8() & 1) == 0)
      {
        break;
      }
      sub_22C01DF58();
      sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
      if ((sub_22C01E488() & 1) == 0) {
        break;
      }
      sub_22BFF55EC((uint64_t)v7, type metadata accessor for Album);
      sub_22BFF55EC((uint64_t)v10, type metadata accessor for Album);
      v12 += v17;
      if (!--v11) {
        return 1;
      }
    }
    sub_22BFF55EC((uint64_t)v7, type metadata accessor for Album);
    sub_22BFF55EC((uint64_t)v10, type metadata accessor for Album);
  }
  return 0;
}

uint64_t sub_22BFF442C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_22C01E7D8(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (uint64_t i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_22C01E7D8() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_22BFF44F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RecurrenceDayOfWeek(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v16 = 1;
      return v16 & 1;
    }
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v21 = *(void *)(v8 + 72);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      sub_22BFF62E8(a1 + v12, (uint64_t)v10, type metadata accessor for RecurrenceDayOfWeek);
      sub_22BFF62E8(a2 + v12, (uint64_t)v7, type metadata accessor for RecurrenceDayOfWeek);
      uint64_t v14 = *(void *)v10;
      uint64_t v15 = *(void *)v7;
      if (v7[8] == 1)
      {
        switch(v15)
        {
          case 1:
            if (v14 != 1) {
              goto LABEL_30;
            }
            goto LABEL_10;
          case 2:
            if (v14 != 2) {
              goto LABEL_30;
            }
            goto LABEL_10;
          case 3:
            if (v14 != 3) {
              goto LABEL_30;
            }
            goto LABEL_10;
          case 4:
            if (v14 != 4) {
              goto LABEL_30;
            }
            goto LABEL_10;
          case 5:
            if (v14 != 5) {
              goto LABEL_30;
            }
            goto LABEL_10;
          case 6:
            if (v14 != 6) {
              goto LABEL_30;
            }
            goto LABEL_10;
          case 7:
            if (v14 != 7) {
              goto LABEL_30;
            }
            goto LABEL_10;
          default:
            if (v14) {
              goto LABEL_30;
            }
            goto LABEL_10;
        }
      }
      if (v14 != v15) {
        break;
      }
LABEL_10:
      if (*((_DWORD *)v10 + 3) != *((_DWORD *)v7 + 3)) {
        break;
      }
      sub_22C01DF58();
      sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
      char v16 = sub_22C01E488();
      sub_22BFF55EC((uint64_t)v7, type metadata accessor for RecurrenceDayOfWeek);
      sub_22BFF55EC((uint64_t)v10, type metadata accessor for RecurrenceDayOfWeek);
      BOOL v18 = v13-- != 0;
      if (v16)
      {
        v12 += v21;
        if (v18) {
          continue;
        }
      }
      return v16 & 1;
    }
LABEL_30:
    sub_22BFF55EC((uint64_t)v7, type metadata accessor for RecurrenceDayOfWeek);
    sub_22BFF55EC((uint64_t)v10, type metadata accessor for RecurrenceDayOfWeek);
  }
  char v16 = 0;
  return v16 & 1;
}

BOOL sub_22BFF47F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
    return 0;
  }
  uint64_t v3 = (int *)(a1 + 36);
  uint64_t v4 = (int *)(a2 + 36);
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    int v8 = *v3++;
    int v7 = v8;
    int v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_22BFF485C(uint64_t a1, uint64_t a2)
{
  return sub_22BFF48B0(a1, a2, type metadata accessor for Asset, type metadata accessor for Asset, (uint64_t (*)(char *, char *))sub_22C00E570, type metadata accessor for Asset);
}

uint64_t sub_22BFF48B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(char *, char *), uint64_t (*a6)(void))
{
  uint64_t v11 = a3(0) - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v27 - v16;
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18 == *(void *)(a2 + 16))
  {
    if (!v18 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v28 = a2;
      uint64_t v19 = a5;
      unint64_t v20 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
      uint64_t v21 = *(void *)(v15 + 72);
      uint64_t v22 = v18 - 1;
      do
      {
        sub_22BFF62E8(a1 + v20, (uint64_t)v17, a4);
        sub_22BFF62E8(v28 + v20, (uint64_t)v14, a4);
        char v23 = v19(v17, v14);
        sub_22BFF55EC((uint64_t)v14, a6);
        sub_22BFF55EC((uint64_t)v17, a6);
        BOOL v25 = v22-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v20 += v21;
      }
      while (v25);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_22BFF4A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Participant(0) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_22BFF62E8(a1 + v12, (uint64_t)v10, type metadata accessor for Participant);
        sub_22BFF62E8(a2 + v12, (uint64_t)v7, type metadata accessor for Participant);
        char v15 = sub_22BFF6704((uint64_t)v10, (uint64_t)v7);
        sub_22BFF55EC((uint64_t)v7, type metadata accessor for Participant);
        sub_22BFF55EC((uint64_t)v10, type metadata accessor for Participant);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_22BFF4BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Alarm(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int v7 = (double *)((char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (double *)((char *)&v18 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_15:
    char v14 = 0;
    return v14 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v19 = *(void *)(v8 + 72);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      sub_22BFF62E8(a1 + v12, (uint64_t)v10, type metadata accessor for Alarm);
      sub_22BFF62E8(a2 + v12, (uint64_t)v7, type metadata accessor for Alarm);
      if (*(void *)v10 != *(void *)v7 || v10[1] != v7[1]) {
        break;
      }
      sub_22C01DF58();
      sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
      char v14 = sub_22C01E488();
      sub_22BFF55EC((uint64_t)v7, type metadata accessor for Alarm);
      sub_22BFF55EC((uint64_t)v10, type metadata accessor for Alarm);
      BOOL v16 = v13-- != 0;
      if (v14)
      {
        v12 += v19;
        if (v16) {
          continue;
        }
      }
      return v14 & 1;
    }
    sub_22BFF55EC((uint64_t)v7, type metadata accessor for Alarm);
    sub_22BFF55EC((uint64_t)v10, type metadata accessor for Alarm);
    goto LABEL_15;
  }
  char v14 = 1;
  return v14 & 1;
}

uint64_t sub_22BFF4E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Attachment(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (uint64_t *)((char *)&v20 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_24:
    char v16 = 0;
    return v16 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v21 = *(void *)(v8 + 72);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      sub_22BFF62E8(a1 + v12, (uint64_t)v10, type metadata accessor for Attachment);
      sub_22BFF62E8(a2 + v12, (uint64_t)v7, type metadata accessor for Attachment);
      BOOL v14 = *v10 == *v7 && v10[1] == v7[1];
      if (!v14 && (sub_22C01E7D8() & 1) == 0) {
        break;
      }
      BOOL v15 = v10[2] == v7[2] && v10[3] == v7[3];
      if (!v15 && (sub_22C01E7D8() & 1) == 0 || v10[4] != v7[4]) {
        break;
      }
      sub_22C01DF58();
      sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
      char v16 = sub_22C01E488();
      sub_22BFF55EC((uint64_t)v7, type metadata accessor for Attachment);
      sub_22BFF55EC((uint64_t)v10, type metadata accessor for Attachment);
      BOOL v18 = v13-- != 0;
      if (v16)
      {
        v12 += v21;
        if (v18) {
          continue;
        }
      }
      return v16 & 1;
    }
    sub_22BFF55EC((uint64_t)v7, type metadata accessor for Attachment);
    sub_22BFF55EC((uint64_t)v10, type metadata accessor for Attachment);
    goto LABEL_24;
  }
  char v16 = 1;
  return v16 & 1;
}

uint64_t sub_22BFF511C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if (*(void *)a1 == *(void *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8))
  {
    uint64_t v11 = type metadata accessor for Alarm(0);
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 24), v4);
    v12(v8, a2 + *(int *)(v11 + 24), v4);
    sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
    char v13 = sub_22C01E488();
    BOOL v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_22BFF52E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v19 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    uint64_t v13 = *(void *)(a1 + 16);
    uint64_t v14 = *(void *)(a2 + 16);
    if (*(unsigned char *)(a2 + 24) == 1)
    {
      switch(v14)
      {
        case 1:
          if (v13 != 1) {
            goto LABEL_33;
          }
          goto LABEL_11;
        case 2:
          if (v13 != 2) {
            goto LABEL_33;
          }
          goto LABEL_11;
        case 3:
          if (v13 != 3) {
            goto LABEL_33;
          }
          goto LABEL_11;
        case 4:
          if (v13 != 4) {
            goto LABEL_33;
          }
          goto LABEL_11;
        case 5:
          if (v13 != 5) {
            goto LABEL_33;
          }
          goto LABEL_11;
        default:
          if (!v13) {
            goto LABEL_11;
          }
          goto LABEL_33;
      }
    }
    if (v13 != v14) {
      goto LABEL_33;
    }
LABEL_11:
    if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40)
      || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      if (*(void *)(a1 + 48) == *(void *)(a2 + 48) && *(void *)(a1 + 56) == *(void *)(a2 + 56)
        || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
      {
        if (*(unsigned __int8 *)(a1 + 64) != *(unsigned __int8 *)(a2 + 64)) {
          goto LABEL_33;
        }
        if (*(void *)(a1 + 72) == *(void *)(a2 + 72) && *(void *)(a1 + 80) == *(void *)(a2 + 80)
          || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
        {
          if (*(unsigned __int8 *)(a1 + 88) == *(unsigned __int8 *)(a2 + 88)
            && (sub_22BFF3F18(*(void *)(a1 + 96), *(void *)(a2 + 96)) & 1) != 0)
          {
            uint64_t v15 = type metadata accessor for Calendar(0);
            uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
            v16(v10, a1 + *(int *)(v15 + 48), v4);
            v16(v8, a2 + *(int *)(v15 + 48), v4);
            sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
            char v12 = sub_22C01E488();
            BOOL v17 = *(void (**)(char *, uint64_t))(v5 + 8);
            v17(v8, v4);
            v17(v10, v4);
            return v12 & 1;
          }
LABEL_33:
          char v12 = 0;
        }
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_22BFF55EC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22BFF564C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22BFF56B4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if (sub_22BFF48B0(*a1, *a2, type metadata accessor for Calendar, type metadata accessor for Calendar, (uint64_t (*)(char *, char *))sub_22BFF52E4, type metadata accessor for Calendar))
  {
    uint64_t CalendarsResponse = type metadata accessor for GetCalendarsResponse(0);
    char v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(CalendarsResponse + 20), v4);
    v12(v8, (char *)a2 + *(int *)(CalendarsResponse + 20), v4);
    sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
    char v13 = sub_22C01E488();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_22BFF58BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = *a1;
  uint64_t v12 = *a2;
  if (*((unsigned char *)a2 + 8) == 1)
  {
    switch(v12)
    {
      case 1:
        if (v11 == 1) {
          goto LABEL_6;
        }
        goto LABEL_21;
      case 2:
        if (v11 == 2) {
          goto LABEL_6;
        }
        goto LABEL_21;
      case 3:
        if (v11 == 3) {
          goto LABEL_6;
        }
        goto LABEL_21;
      case 4:
        if (v11 == 4) {
          goto LABEL_6;
        }
        goto LABEL_21;
      case 5:
        if (v11 == 5) {
          goto LABEL_6;
        }
        goto LABEL_21;
      case 6:
        if (v11 != 6) {
          goto LABEL_21;
        }
        goto LABEL_6;
      case 7:
        if (v11 == 7) {
          goto LABEL_6;
        }
        goto LABEL_21;
      default:
        if (!v11) {
          goto LABEL_6;
        }
        goto LABEL_21;
    }
  }
  if (v11 != v12) {
    goto LABEL_21;
  }
LABEL_6:
  if (*((_DWORD *)a1 + 3) != *((_DWORD *)a2 + 3))
  {
LABEL_21:
    char v15 = 0;
    return v15 & 1;
  }
  uint64_t v13 = type metadata accessor for RecurrenceDayOfWeek(0);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v14(v10, (char *)a1 + *(int *)(v13 + 24), v4);
  v14(v8, (char *)a2 + *(int *)(v13 + 24), v4);
  sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
  char v15 = sub_22C01E488();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v8, v4);
  v16(v10, v4);
  return v15 & 1;
}

uint64_t sub_22BFF5B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v48 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v47 = (char *)&v44 - v7;
  uint64_t v8 = type metadata accessor for RecurrenceEnd(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v51 = (uint64_t)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497400);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497218);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  BOOL v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v44 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v44 - v21;
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (char v23 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    uint64_t v24 = *(void *)(a1 + 16);
    uint64_t v25 = *(void *)(a2 + 16);
    if (*(unsigned char *)(a2 + 24) == 1)
    {
      switch(v25)
      {
        case 1:
          if (v24 != 1) {
            goto LABEL_38;
          }
          goto LABEL_9;
        case 2:
          if (v24 != 2) {
            goto LABEL_38;
          }
          goto LABEL_9;
        case 3:
          if (v24 != 3) {
            goto LABEL_38;
          }
          goto LABEL_9;
        case 4:
          if (v24 != 4) {
            goto LABEL_38;
          }
          goto LABEL_9;
        default:
          if (!v24) {
            goto LABEL_9;
          }
          goto LABEL_38;
      }
    }
    if (v24 != v25) {
      goto LABEL_38;
    }
LABEL_9:
    uint64_t v46 = v17;
    uint64_t v26 = type metadata accessor for RecurrenceRule(0);
    sub_22BFF6228(a1 + *(int *)(v26 + 60), (uint64_t)v22, &qword_268497218);
    uint64_t v45 = v26;
    sub_22BFF6228(a2 + *(int *)(v26 + 60), (uint64_t)v20, &qword_268497218);
    uint64_t v27 = (uint64_t)&v13[*(int *)(v11 + 48)];
    sub_22BFF6228((uint64_t)v22, (uint64_t)v13, &qword_268497218);
    sub_22BFF6228((uint64_t)v20, v27, &qword_268497218);
    uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    if (v28((uint64_t)v13, 1, v8) == 1)
    {
      sub_22BFF628C((uint64_t)v20, &qword_268497218);
      sub_22BFF628C((uint64_t)v22, &qword_268497218);
      if (v28(v27, 1, v8) == 1)
      {
        sub_22BFF628C((uint64_t)v13, &qword_268497218);
LABEL_12:
        if (*(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28)
          && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32)
          && (sub_22BFF44F4(*(void *)(a1 + 40), *(void *)(a2 + 40)) & 1) != 0
          && sub_22BFF47F0(*(void *)(a1 + 48), *(void *)(a2 + 48))
          && sub_22BFF47F0(*(void *)(a1 + 56), *(void *)(a2 + 56))
          && sub_22BFF47F0(*(void *)(a1 + 64), *(void *)(a2 + 64))
          && sub_22BFF47F0(*(void *)(a1 + 72), *(void *)(a2 + 72))
          && sub_22BFF47F0(*(void *)(a1 + 80), *(void *)(a2 + 80)))
        {
          uint64_t v29 = v45;
          uint64_t v30 = a1 + *(int *)(v45 + 56);
          uint64_t v32 = v49;
          uint64_t v31 = v50;
          uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
          uint64_t v34 = v47;
          v33(v47, v30, v50);
          uint64_t v35 = a2 + *(int *)(v29 + 56);
          uint64_t v36 = v48;
          v33(v48, v35, v31);
          sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
          char v23 = sub_22C01E488();
          uint64_t v37 = *(void (**)(char *, uint64_t))(v32 + 8);
          v37(v36, v31);
          v37(v34, v31);
          return v23 & 1;
        }
LABEL_38:
        char v23 = 0;
        return v23 & 1;
      }
    }
    else
    {
      uint64_t v38 = (uint64_t)v46;
      sub_22BFF6228((uint64_t)v13, (uint64_t)v46, &qword_268497218);
      if (v28(v27, 1, v8) != 1)
      {
        uint64_t v41 = v51;
        sub_22BFF564C(v27, v51, type metadata accessor for RecurrenceEnd);
        if (*(void *)v38 == *(void *)v41 && *(_DWORD *)(v38 + 8) == *(_DWORD *)(v41 + 8))
        {
          sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
          char v42 = sub_22C01E488();
          sub_22BFF55EC(v41, type metadata accessor for RecurrenceEnd);
          sub_22BFF628C((uint64_t)v20, &qword_268497218);
          sub_22BFF628C((uint64_t)v22, &qword_268497218);
          sub_22BFF55EC(v38, type metadata accessor for RecurrenceEnd);
          sub_22BFF628C((uint64_t)v13, &qword_268497218);
          if ((v42 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_12;
        }
        sub_22BFF55EC(v41, type metadata accessor for RecurrenceEnd);
        sub_22BFF628C((uint64_t)v20, &qword_268497218);
        sub_22BFF628C((uint64_t)v22, &qword_268497218);
        sub_22BFF55EC(v38, type metadata accessor for RecurrenceEnd);
        uint64_t v40 = (uint64_t)v13;
        uint64_t v39 = &qword_268497218;
LABEL_37:
        sub_22BFF628C(v40, v39);
        goto LABEL_38;
      }
      sub_22BFF628C((uint64_t)v20, &qword_268497218);
      sub_22BFF628C((uint64_t)v22, &qword_268497218);
      sub_22BFF55EC(v38, type metadata accessor for RecurrenceEnd);
    }
    uint64_t v39 = &qword_268497400;
    uint64_t v40 = (uint64_t)v13;
    goto LABEL_37;
  }
  return v23 & 1;
}

uint64_t sub_22BFF6228(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22BFF628C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22BFF62E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22BFF6350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (*(void *)a1 == *(void *)a2 && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8))
  {
    uint64_t v11 = type metadata accessor for RecurrenceEnd(0);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 24), v4);
    v12(v8, a2 + *(int *)(v11 + 24), v4);
    sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
    char v13 = sub_22C01E488();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_22BFF6518(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for CalendarEvent(0) + 20);
  uint64_t v12 = *(void **)(a1 + v11);
  char v13 = *(void **)(a2 + v11);
  if (v12 == v13
    || (swift_retain(), swift_retain(), char v14 = sub_22BFEE644(v12, v13), swift_release(), swift_release(), (v14 & 1) != 0))
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v15(v10, a1, v4);
    v15(v8, a2, v4);
    sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
    char v16 = sub_22C01E488();
    BOOL v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v8, v4);
    v17(v10, v4);
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

uint64_t sub_22BFF6704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v22 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    BOOL v13 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v13 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a2 + 32);
      if (*(unsigned char *)(a2 + 40) == 1)
      {
        switch(v15)
        {
          case 1:
            if (v14 != 1) {
              goto LABEL_38;
            }
            goto LABEL_16;
          case 2:
            if (v14 != 2) {
              goto LABEL_38;
            }
            goto LABEL_16;
          case 3:
            if (v14 != 3) {
              goto LABEL_38;
            }
            goto LABEL_16;
          case 4:
            if (v14 != 4) {
              goto LABEL_38;
            }
            goto LABEL_16;
          default:
            if (!v14) {
              goto LABEL_16;
            }
            goto LABEL_38;
        }
      }
      if (v14 == v15)
      {
LABEL_16:
        if (sub_22BFE69F0(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a2 + 48)))
        {
          uint64_t v16 = *(void *)(a1 + 64);
          uint64_t v17 = *(void *)(a2 + 64);
          if (*(unsigned char *)(a2 + 72) == 1)
          {
            switch(v17)
            {
              case 1:
                if (v16 != 1) {
                  goto LABEL_38;
                }
                goto LABEL_22;
              case 2:
                if (v16 != 2) {
                  goto LABEL_38;
                }
                goto LABEL_22;
              case 3:
                if (v16 != 3) {
                  goto LABEL_38;
                }
                goto LABEL_22;
              case 4:
                if (v16 != 4) {
                  goto LABEL_38;
                }
                goto LABEL_22;
              default:
                if (!v16) {
                  goto LABEL_22;
                }
                goto LABEL_38;
            }
          }
          if (v16 == v17)
          {
LABEL_22:
            uint64_t v18 = type metadata accessor for Participant(0);
            uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
            v19(v10, a1 + *(int *)(v18 + 36), v4);
            v19(v8, a2 + *(int *)(v18 + 36), v4);
            sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
            char v12 = sub_22C01E488();
            uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
            v20(v8, v4);
            v20(v10, v4);
            return v12 & 1;
          }
        }
      }
LABEL_38:
      char v12 = 0;
    }
  }
  return v12 & 1;
}

unint64_t sub_22BFF6A18()
{
  unint64_t result = qword_268497410;
  if (!qword_268497410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497410);
  }
  return result;
}

unint64_t sub_22BFF6A6C()
{
  unint64_t result = qword_268497418;
  if (!qword_268497418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497418);
  }
  return result;
}

uint64_t sub_22BFF6AC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_22BFF6B24()
{
  unint64_t result = qword_268497428;
  if (!qword_268497428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497428);
  }
  return result;
}

unint64_t sub_22BFF6B78()
{
  unint64_t result = qword_268497430;
  if (!qword_268497430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497430);
  }
  return result;
}

unint64_t sub_22BFF6BCC()
{
  unint64_t result = qword_268497438;
  if (!qword_268497438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497438);
  }
  return result;
}

unint64_t sub_22BFF6C20()
{
  unint64_t result = qword_268497450;
  if (!qword_268497450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497450);
  }
  return result;
}

unint64_t sub_22BFF6C74()
{
  unint64_t result = qword_268497468;
  if (!qword_268497468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497468);
  }
  return result;
}

uint64_t sub_22BFF6CC8(char *a1, char *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      if (*((void *)a1 + 4) == *((void *)a2 + 4))
      {
        uint64_t v14 = type metadata accessor for Attachment(0);
        uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
        v15(v10, &a1[*(int *)(v14 + 28)], v4);
        v15(v8, &a2[*(int *)(v14 + 28)], v4);
        sub_22BFF2CCC(&qword_2684973D8, MEMORY[0x263F50560]);
        char v12 = sub_22C01E488();
        uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
        v16(v8, v4);
        v16(v10, v4);
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  return v12 & 1;
}

ValueMetadata *type metadata accessor for CalendarType()
{
  return &type metadata for CalendarType;
}

ValueMetadata *type metadata accessor for Weekday()
{
  return &type metadata for Weekday;
}

void *sub_22BFF6EE8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v6 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v6;
    uint64_t v7 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v7;
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v8 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v8;
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v9 = *(int *)(a3 + 48);
    uint64_t v15 = a1 + v9;
    uint64_t v10 = (uint64_t)a2 + v9;
    *(void *)(a1 + 96) = a2[12];
    uint64_t v11 = sub_22C01DF58();
    char v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v15, v10, v11);
  }
  return v3;
}

uint64_t sub_22BFF7044(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22BFF70DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v8 = *(int *)(a3 + 48);
  uint64_t v13 = a1 + v8;
  uint64_t v9 = a2 + v8;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v10 = sub_22C01DF58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v13, v9, v10);
  return a1;
}

uint64_t sub_22BFF71E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 48);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_22BFF731C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v5 = *(int *)(a3 + 48);
  uint64_t v6 = a2 + v5;
  uint64_t v7 = a1 + v5;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
  return a1;
}

uint64_t sub_22BFF73D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 48);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_22BFF74BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFF74D0);
}

uint64_t sub_22BFF74D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 48);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22BFF7580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFF7594);
}

uint64_t sub_22BFF7594(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 48);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22BFF763C()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22BFF76FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_22C01DF58();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_22BFF77E0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_22BFF7858(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_22BFF78F0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_22BFF7984(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_22BFF7A00(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_22BFF7A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFF7AA0);
}

uint64_t sub_22BFF7AA0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22BFF7B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFF7B64);
}

void *sub_22BFF7B64(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    void *result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22BFF7C0C()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22BFF7CA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_22BFF7D74(uint64_t a1)
{
  uint64_t v2 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_22BFF7DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_22BFF7E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22BFF7EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22BFF7F70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_22BFF7FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFF8008);
}

uint64_t sub_22BFF8008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C01DF58();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_22BFF80C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFF80DC);
}

uint64_t sub_22BFF80DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22C01DF58();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_22BFF8198()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParticipantType()
{
  return &type metadata for ParticipantType;
}

ValueMetadata *type metadata accessor for ParticipantStatus()
{
  return &type metadata for ParticipantStatus;
}

ValueMetadata *type metadata accessor for ParticipantRole()
{
  return &type metadata for ParticipantRole;
}

void *sub_22BFF8260(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    void *v3 = *a2;
    int v3 = (void *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    *(_DWORD *)(a1 + 12) = *((_DWORD *)a2 + 3);
    uint64_t v5 = *(int *)(a3 + 24);
    uint64_t v6 = a1 + v5;
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = sub_22C01DF58();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_22BFF833C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = sub_22C01DF58();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

uint64_t sub_22BFF83A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFF8430(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(_DWORD *)(a1 + 12) = *((_DWORD *)a2 + 3);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = (uint64_t)a2 + v5;
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t sub_22BFF84BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFF8548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_22BFF85D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFF85E8);
}

uint64_t __swift_get_extra_inhabitant_index_72Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 24);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t sub_22BFF865C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFF8670);
}

uint64_t __swift_store_extra_inhabitant_index_73Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 24);
  uint64_t v6 = sub_22C01DF58();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t sub_22BFF86E8()
{
  return sub_22BFF8700();
}

uint64_t sub_22BFF8700()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RecurrenceFrequency()
{
  return &type metadata for RecurrenceFrequency;
}

unint64_t sub_22BFF87A4()
{
  unint64_t result = qword_2684974C0;
  if (!qword_2684974C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684974C0);
  }
  return result;
}

uint64_t sub_22BFF87F8()
{
  return sub_22BFF8AA0(&qword_2684974C8, &qword_2684974D0);
}

unint64_t sub_22BFF8824()
{
  unint64_t result = qword_2684974D8;
  if (!qword_2684974D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684974D8);
  }
  return result;
}

uint64_t sub_22BFF8878()
{
  return sub_22BFF8AA0(&qword_2684974E0, &qword_2684974E8);
}

unint64_t sub_22BFF88A4()
{
  unint64_t result = qword_2684974F0;
  if (!qword_2684974F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684974F0);
  }
  return result;
}

uint64_t sub_22BFF88F8()
{
  return sub_22BFF8AA0(&qword_2684974F8, &qword_268497500);
}

unint64_t sub_22BFF8924()
{
  unint64_t result = qword_268497508;
  if (!qword_268497508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497508);
  }
  return result;
}

uint64_t sub_22BFF8978()
{
  return sub_22BFF8AA0(&qword_268497510, &qword_268497518);
}

unint64_t sub_22BFF89A4()
{
  unint64_t result = qword_268497520;
  if (!qword_268497520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497520);
  }
  return result;
}

uint64_t sub_22BFF89F8()
{
  return sub_22BFF8AA0(&qword_268497528, &qword_268497530);
}

unint64_t sub_22BFF8A24()
{
  unint64_t result = qword_268497538;
  if (!qword_268497538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497538);
  }
  return result;
}

uint64_t sub_22BFF8A78()
{
  return sub_22BFF8AA0(&qword_268497540, &qword_268497548);
}

uint64_t sub_22BFF8AA0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22BFF8AF4()
{
  unint64_t result = qword_268497550;
  if (!qword_268497550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497550);
  }
  return result;
}

unint64_t sub_22BFF8B4C()
{
  unint64_t result = qword_268497558;
  if (!qword_268497558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497558);
  }
  return result;
}

unint64_t sub_22BFF8BA4()
{
  unint64_t result = qword_268497560;
  if (!qword_268497560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497560);
  }
  return result;
}

unint64_t sub_22BFF8BFC()
{
  unint64_t result = qword_268497568;
  if (!qword_268497568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497568);
  }
  return result;
}

unint64_t sub_22BFF8C54()
{
  unint64_t result = qword_268497570;
  if (!qword_268497570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497570);
  }
  return result;
}

unint64_t sub_22BFF8CAC()
{
  unint64_t result = qword_268497578;
  if (!qword_268497578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497578);
  }
  return result;
}

unint64_t sub_22BFF8D04()
{
  unint64_t result = qword_268497580;
  if (!qword_268497580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497580);
  }
  return result;
}

unint64_t sub_22BFF8D5C()
{
  unint64_t result = qword_268497588;
  if (!qword_268497588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497588);
  }
  return result;
}

unint64_t sub_22BFF8DB4()
{
  unint64_t result = qword_268497590;
  if (!qword_268497590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497590);
  }
  return result;
}

unint64_t sub_22BFF8E0C()
{
  unint64_t result = qword_268497598;
  if (!qword_268497598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497598);
  }
  return result;
}

unint64_t sub_22BFF8E64()
{
  unint64_t result = qword_2684975A0;
  if (!qword_2684975A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684975A0);
  }
  return result;
}

unint64_t sub_22BFF8EBC()
{
  unint64_t result = qword_2684975A8;
  if (!qword_2684975A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684975A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageMigrator()
{
  return &type metadata for MessageMigrator;
}

unint64_t sub_22BFF8F54()
{
  return 0xD00000000000001CLL;
}

void sub_22BFF8F70()
{
}

uint64_t sub_22BFF8FD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22C01DE78();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  id v12 = objc_msgSend(self, sel_defaultManager);
  uint64_t v13 = (void *)sub_22C01E498();
  id v14 = objc_msgSend(v12, sel_containerURLForSecurityApplicationGroupIdentifier_, v13);

  if (!v14)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    v16(v4, 1, 1, v5);
LABEL_5:
    sub_22BFF92A8((uint64_t)v4);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(a1, 1, 1, v5);
  }
  sub_22C01DE68();

  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v15(v4, v9, v5);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v16(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    goto LABEL_5;
  }
  v15(v11, v4, v5);
  sub_22C01DE58();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v16)(a1, 0, 1, v5);
}

uint64_t sub_22BFF92A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_22BFF9308(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_22C01DE78();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_22BFF9460(uint64_t a1)
{
  uint64_t v2 = sub_22C01DE78();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_22BFF9530(void *a1, const void *a2)
{
  uint64_t v4 = sub_22C01DE78();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_22BFF9640(void *a1, void *a2)
{
  uint64_t v4 = sub_22C01DE78();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_22BFF97BC(void *a1, const void *a2)
{
  uint64_t v4 = sub_22C01DE78();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_22BFF98CC(void *a1, void *a2)
{
  uint64_t v4 = sub_22C01DE78();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_22BFF9A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFF9A5C);
}

uint64_t sub_22BFF9A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_22BFF9ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFF9AE0);
}

uint64_t sub_22BFF9AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684975B0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FileMigrator()
{
  uint64_t result = qword_2684975B8;
  if (!qword_2684975B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22BFF9BA0()
{
  sub_22BFF9C2C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22BFF9C2C()
{
  if (!qword_2684975C8)
  {
    sub_22C01DE78();
    unint64_t v0 = sub_22C01E668();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2684975C8);
    }
  }
}

unint64_t sub_22BFF9C84()
{
  return 0xD000000000000019;
}

void sub_22BFF9CA0()
{
}

uint64_t sub_22BFF9D04()
{
  sub_22BFF9D68(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HTTPRequest()
{
  return self;
}

uint64_t sub_22BFF9D68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_22BFE6770(a1, a2);
  }
  return a1;
}

void sub_22BFF9D7C()
{
  qword_26849DD28 = (uint64_t)&unk_26DF68FA8;
}

void sub_22BFF9D90(uint64_t a1@<X8>)
{
  sub_22BFFC534();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_22BFF9DC4@<X0>(void *a1@<X8>)
{
  if (qword_2684970A0 != -1) {
    swift_once();
  }
  *a1 = qword_26849DD28;
  return swift_bridgeObjectRetain();
}

void sub_22BFF9E30(uint64_t a1@<X8>)
{
  sub_22BFFC534();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_22BFF9E68(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22BFFB4BC();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

BOOL sub_22BFF9EB4(uint64_t a1, uint64_t *a2)
{
  return sub_22BFF8F1C(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

uint64_t sub_22BFF9ED0()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DD30);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DD30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_22C025C80;
  unint64_t v4 = v24 + v3;
  unint64_t v5 = v24 + v3 + v1[14];
  *(void *)(v24 + v3) = 0;
  *(void *)unint64_t v5 = "Unknown";
  *(void *)(v5 + 8) = 7;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  int v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "Incoming";
  *(void *)(v9 + 8) = 8;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 2;
  *(void *)uint64_t v11 = "Outgoing";
  *((void *)v11 + 1) = 8;
  v11[16] = 2;
  v8();
  id v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *id v12 = 3;
  *(void *)uint64_t v13 = "AnsweredElsewhere";
  *((void *)v13 + 1) = 17;
  v13[16] = 2;
  v8();
  id v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *id v14 = 4;
  *(void *)uint64_t v15 = "Missed";
  *((void *)v15 + 1) = 6;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 5;
  *(void *)uint64_t v17 = "Cancelled";
  *((void *)v17 + 1) = 9;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 6;
  *(void *)uint64_t v19 = "Rejected";
  *((void *)v19 + 1) = 8;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 7;
  *(void *)uint64_t v21 = "Blocked";
  *((void *)v21 + 1) = 7;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 8;
  *(void *)uint64_t v22 = "Voicemail";
  *(void *)(v22 + 8) = 9;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22BFFA23C@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_2684970A8, (uint64_t)qword_26849DD30, a1);
}

uint64_t sub_22BFFA260()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DD48);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DD48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_22C025C80;
  unint64_t v4 = v24 + v3;
  unint64_t v5 = v24 + v3 + v1[14];
  *(void *)(v24 + v3) = 1;
  *(void *)unint64_t v5 = "id";
  *(void *)(v5 + 8) = 2;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  int v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "type";
  *(void *)(v9 + 8) = 4;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "number";
  *((void *)v11 + 1) = 6;
  v11[16] = 2;
  v8();
  id v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *id v12 = 4;
  *(void *)uint64_t v13 = "other_numbers";
  *((void *)v13 + 1) = 13;
  v13[16] = 2;
  v8();
  id v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *id v14 = 5;
  *(void *)uint64_t v15 = "read";
  *((void *)v15 + 1) = 4;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "date";
  *((void *)v17 + 1) = 4;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 7;
  *(void *)uint64_t v19 = "duration";
  *((void *)v19 + 1) = 8;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "country_code";
  *((void *)v21 + 1) = 12;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "app_id";
  *(void *)(v22 + 8) = 6;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22BFFA5E0()
{
  uint64_t result = sub_22C01DF98();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 3:
        case 8:
        case 9:
          uint64_t v4 = v3;
          sub_22C01E018();
          goto LABEL_10;
        case 2:
          sub_22BFFB4BC();
          uint64_t v4 = v3;
          sub_22C01DFB8();
          goto LABEL_10;
        case 4:
          uint64_t v4 = v3;
          sub_22C01DFE8();
          goto LABEL_10;
        case 5:
          uint64_t v4 = v3;
          sub_22C01DFA8();
          goto LABEL_10;
        case 6:
        case 7:
          uint64_t v4 = v3;
          sub_22C01E038();
LABEL_10:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFFA794()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    if (!*(void *)(v0 + 16) || (sub_22BFFB4BC(), uint64_t result = sub_22C01E0B8(), !v1))
    {
      unint64_t v5 = *(void *)(v0 + 40);
      uint64_t v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0) {
        uint64_t v6 = *(void *)(v0 + 32) & 0xFFFFFFFFFFFFLL;
      }
      if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
      {
        if (!*(void *)(*(void *)(v0 + 48) + 16) || (uint64_t result = sub_22C01E0E8(), !v1))
        {
          if (*(unsigned char *)(v0 + 56) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
          {
            if (!*(void *)(v0 + 64) || (uint64_t result = sub_22C01E128(), !v1))
            {
              if (!*(void *)(v0 + 72) || (uint64_t result = sub_22C01E128(), !v1))
              {
                unint64_t v7 = *(void *)(v0 + 88);
                uint64_t v8 = HIBYTE(v7) & 0xF;
                if ((v7 & 0x2000000000000000) == 0) {
                  uint64_t v8 = *(void *)(v0 + 80) & 0xFFFFFFFFFFFFLL;
                }
                if (!v8 || (uint64_t result = sub_22C01E108(), !v1))
                {
                  unint64_t v9 = *(void *)(v0 + 104);
                  uint64_t v10 = HIBYTE(v9) & 0xF;
                  if ((v9 & 0x2000000000000000) == 0) {
                    uint64_t v10 = *(void *)(v0 + 96) & 0xFFFFFFFFFFFFLL;
                  }
                  if (!v10 || (uint64_t result = sub_22C01E108(), !v1))
                  {
                    type metadata accessor for Call(0);
                    return sub_22C01DF38();
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

uint64_t sub_22BFFA9BC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(void *)(a1 + 48) = MEMORY[0x263F8EE78];
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0xE000000000000000;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0xE000000000000000;
  return sub_22C01DF48();
}

uint64_t sub_22BFFAA14()
{
  return 1819042115;
}

uint64_t sub_22BFFAA24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22BFFAA94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 52);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22BFFAB04())()
{
  return nullsub_1;
}

uint64_t sub_22BFFAB28()
{
  return sub_22BFFA5E0();
}

uint64_t sub_22BFFAB40()
{
  return sub_22BFFA794();
}

uint64_t sub_22BFFAB58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFFB2A4(&qword_268497610, (void (*)(uint64_t))type metadata accessor for Call);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFFABD4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_2684970B0, (uint64_t)qword_26849DD48, a1);
}

uint64_t sub_22BFFABF8(uint64_t a1)
{
  uint64_t v2 = sub_22BFFB2A4(&qword_2684975F8, (void (*)(uint64_t))type metadata accessor for Call);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFFAC64()
{
  sub_22BFFB2A4(&qword_2684975F8, (void (*)(uint64_t))type metadata accessor for Call);
  return sub_22C01E088();
}

uint64_t sub_22BFFACE4()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DD60);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DD60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22C024340;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "calls";
  *(void *)(v4 + 8) = 5;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_22C01E158();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_22C01E168();
}

uint64_t sub_22BFFAE40()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        type metadata accessor for Call(0);
        sub_22BFFB2A4(&qword_2684975F8, (void (*)(uint64_t))type metadata accessor for Call);
        sub_22C01E048();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22BFFAF30()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for Call(0),
        sub_22BFFB2A4(&qword_2684975F8, (void (*)(uint64_t))type metadata accessor for Call),
        uint64_t result = sub_22C01E138(),
        !v1))
  {
    type metadata accessor for CallArray(0);
    return sub_22C01DF38();
  }
  return result;
}

uint64_t sub_22BFFB01C()
{
  return 0x617272416C6C6143;
}

uint64_t sub_22BFFB038()
{
  return sub_22BFFAE40();
}

uint64_t sub_22BFFB050()
{
  return sub_22BFFAF30();
}

uint64_t sub_22BFFB068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BFFB2A4(&qword_268497620, (void (*)(uint64_t))type metadata accessor for CallArray);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22BFFB0E4@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_2684970B8, (uint64_t)qword_26849DD60, a1);
}

uint64_t sub_22BFFB108(uint64_t a1)
{
  uint64_t v2 = sub_22BFFB2A4(&qword_2684975D8, (void (*)(uint64_t))type metadata accessor for CallArray);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22BFFB174()
{
  sub_22BFFB2A4(&qword_2684975D8, (void (*)(uint64_t))type metadata accessor for CallArray);
  return sub_22C01E088();
}

uint64_t sub_22BFFB1F4()
{
  return sub_22BFFB2A4(&qword_2684975D0, (void (*)(uint64_t))type metadata accessor for CallArray);
}

uint64_t type metadata accessor for CallArray(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_268497638);
}

uint64_t sub_22BFFB25C()
{
  return sub_22BFFB2A4(&qword_2684975D8, (void (*)(uint64_t))type metadata accessor for CallArray);
}

uint64_t sub_22BFFB2A4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22BFFB2EC()
{
  return sub_22BFFB2A4(&qword_2684975E0, (void (*)(uint64_t))type metadata accessor for CallArray);
}

uint64_t sub_22BFFB334()
{
  return sub_22BFFB2A4(&qword_2684975E8, (void (*)(uint64_t))type metadata accessor for CallArray);
}

uint64_t sub_22BFFB37C()
{
  return sub_22BFFB2A4(&qword_2684975F0, (void (*)(uint64_t))type metadata accessor for Call);
}

uint64_t type metadata accessor for Call(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_268497628);
}

uint64_t sub_22BFFB3E4()
{
  return sub_22BFFB2A4(&qword_2684975F8, (void (*)(uint64_t))type metadata accessor for Call);
}

uint64_t sub_22BFFB42C()
{
  return sub_22BFFB2A4(&qword_268497600, (void (*)(uint64_t))type metadata accessor for Call);
}

uint64_t sub_22BFFB474()
{
  return sub_22BFFB2A4(&qword_268497608, (void (*)(uint64_t))type metadata accessor for Call);
}

unint64_t sub_22BFFB4BC()
{
  unint64_t result = qword_268497618;
  if (!qword_268497618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497618);
  }
  return result;
}

uint64_t sub_22BFFB510(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (sub_22BFF3AC0(*a1, *a2))
  {
    uint64_t v11 = type metadata accessor for CallArray(0);
    id v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 20), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_22BFFB2A4(&qword_2684973D8, MEMORY[0x263F50560]);
    char v13 = sub_22C01E488();
    id v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_22BFFB6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - v9;
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v12 = 0;
    if ((sub_22C01E7D8() & 1) == 0) {
      return v12 & 1;
    }
  }
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 24) == 1)
  {
    switch(v14)
    {
      case 1:
        if (v13 != 1) {
          goto LABEL_40;
        }
        goto LABEL_11;
      case 2:
        if (v13 != 2) {
          goto LABEL_40;
        }
        goto LABEL_11;
      case 3:
        if (v13 != 3) {
          goto LABEL_40;
        }
        goto LABEL_11;
      case 4:
        if (v13 != 4) {
          goto LABEL_40;
        }
        goto LABEL_11;
      case 5:
        if (v13 != 5) {
          goto LABEL_40;
        }
        goto LABEL_11;
      case 6:
        if (v13 != 6) {
          goto LABEL_40;
        }
        goto LABEL_11;
      case 7:
        if (v13 != 7) {
          goto LABEL_40;
        }
        goto LABEL_11;
      case 8:
        if (v13 != 8) {
          goto LABEL_40;
        }
        goto LABEL_11;
      default:
        if (!v13) {
          goto LABEL_11;
        }
        goto LABEL_40;
    }
  }
  if (v13 != v14) {
    goto LABEL_40;
  }
LABEL_11:
  if (*(void *)(a1 + 32) != *(void *)(a2 + 32) || *(void *)(a1 + 40) != *(void *)(a2 + 40))
  {
    char v12 = 0;
    if ((sub_22C01E7D8() & 1) == 0) {
      return v12 & 1;
    }
  }
  if ((sub_22BFF442C(*(void **)(a1 + 48), *(void **)(a2 + 48)) & 1) == 0
    || *(unsigned __int8 *)(a1 + 56) != *(unsigned __int8 *)(a2 + 56)
    || *(void *)(a1 + 64) != *(void *)(a2 + 64)
    || *(void *)(a1 + 72) != *(void *)(a2 + 72))
  {
LABEL_40:
    char v12 = 0;
    return v12 & 1;
  }
  if (*(void *)(a1 + 80) == *(void *)(a2 + 80) && *(void *)(a1 + 88) == *(void *)(a2 + 88)
    || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    if (*(void *)(a1 + 96) == *(void *)(a2 + 96) && *(void *)(a1 + 104) == *(void *)(a2 + 104)
      || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      uint64_t v15 = type metadata accessor for Call(0);
      uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v16(v10, a1 + *(int *)(v15 + 52), v4);
      v16(v8, a2 + *(int *)(v15 + 52), v4);
      sub_22BFFB2A4(&qword_2684973D8, MEMORY[0x263F50560]);
      char v12 = sub_22C01E488();
      uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
  }
  return v12 & 1;
}

ValueMetadata *type metadata accessor for CallType()
{
  return &type metadata for CallType;
}

void *sub_22BFFBA20(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v6 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
    uint64_t v7 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v7;
    uint64_t v8 = a2[13];
    uint64_t v9 = *(int *)(a3 + 52);
    uint64_t v15 = (uint64_t)a2 + v9;
    uint64_t v10 = a1 + v9;
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v8;
    uint64_t v11 = sub_22C01DF58();
    char v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v15, v11);
  }
  return v3;
}

uint64_t sub_22BFFBB7C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22BFFBC14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 104);
  uint64_t v8 = *(int *)(a3 + 52);
  uint64_t v13 = a2 + v8;
  uint64_t v9 = a1 + v8;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  uint64_t v10 = sub_22C01DF58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v13, v10);
  return a1;
}

uint64_t sub_22BFFBD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 52);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_22BFFBE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  uint64_t v5 = *(int *)(a3 + 52);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_22BFFBF10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 52);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_22BFFBFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFFC010);
}

uint64_t sub_22BFFC010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 52);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22BFFC0C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFFC0D4);
}

uint64_t sub_22BFFC0D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 52);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22BFFC17C()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22BFFC24C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22BFFC260);
}

uint64_t sub_22BFFC260(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22BFFC310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22BFFC324);
}

void *sub_22BFFC324(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    void *result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

unint64_t sub_22BFFC3D0()
{
  unint64_t result = qword_268497648;
  if (!qword_268497648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497648);
  }
  return result;
}

unint64_t sub_22BFFC428()
{
  unint64_t result = qword_268497650;
  if (!qword_268497650)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268497658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497650);
  }
  return result;
}

unint64_t sub_22BFFC488()
{
  unint64_t result = qword_268497660;
  if (!qword_268497660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497660);
  }
  return result;
}

unint64_t sub_22BFFC4E0()
{
  unint64_t result = qword_268497668;
  if (!qword_268497668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497668);
  }
  return result;
}

uint64_t sub_22BFFC548(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return MEMORY[0x270FA2498](sub_22BFFC56C, 0, 0);
}

uint64_t sub_22BFFC56C()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HTTPHeaders()), sel_init);
  v0[10] = v1;
  id v2 = v1;
  uint64_t v3 = (void *)sub_22C01E498();
  objc_msgSend(v2, sel_setMethod_, v3);

  uint64_t v4 = (void *)sub_22C01E498();
  objc_msgSend(v2, sel_setPath_, v4);

  objc_msgSend(v2, sel_close_, 0);
  type metadata accessor for HTTPRequest();
  uint64_t inited = swift_initStackObject();
  v0[11] = inited;
  *(void *)(inited + 16) = v2;
  *(_OWORD *)(inited + 24) = xmmword_22C026140;
  id v6 = v2;
  sub_22BFF9D68(0, 0xF000000000000000);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[12] = v7;
  void *v7 = v0;
  v7[1] = sub_22BFFC6F8;
  uint64_t v8 = v0[9];
  v7[16] = inited;
  v7[17] = v8;
  return MEMORY[0x270FA2498](sub_22BFFCB84, 0, 0);
}

uint64_t sub_22BFFC6F8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_22BFFC8A0;
  }
  else
  {
    *(void *)(v4 + 112) = a1;
    uint64_t v5 = sub_22BFFC820;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_22BFFC820()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[11];
  swift_setDeallocating();

  sub_22BFF9D68(*(void *)(v2 + 24), *(void *)(v2 + 32));
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v4 = v0[14];
  return v3(v4);
}

uint64_t sub_22BFFC8A0()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[11];
  swift_setDeallocating();

  sub_22BFF9D68(*(void *)(v2 + 24), *(void *)(v2 + 32));
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_22BFFC91C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22C01E208();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = OBJC_IVAR____TtC12MigrationKit10HTTPClient_connection;
  if (!*(void *)(v0 + OBJC_IVAR____TtC12MigrationKit10HTTPClient_connection))
  {
    uint64_t v21 = v3;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v19((char *)&v18 - v11, v0 + OBJC_IVAR____TtC12MigrationKit10HTTPClient_endpoint, v2);
    sub_22C01E328();
    swift_allocObject();
    uint64_t v14 = sub_22C01E318();
    uint64_t v20 = v14;
    sub_22C01E308();
    swift_retain();
    MEMORY[0x230F5B070](0, v14);
    uint64_t v15 = (void (*)(char *, char *, uint64_t))v19;
    v19(v9, (uint64_t)v12, v2);
    type metadata accessor for TCPConnection();
    swift_allocObject();
    v15(v6, v9, v2);
    uint64_t v16 = sub_22C012A6C((uint64_t)v6);
    swift_release();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v21 + 8);
    v17(v9, v2);
    swift_release();
    v17(v12, v2);
    *(void *)(v1 + v13) = v16;
    uint64_t result = swift_release();
    if (*(void *)(v1 + v13))
    {
      swift_retain();
      sub_22C011480();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22BFFCB64(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](sub_22BFFCB84, 0, 0);
}

uint64_t sub_22BFFCB84()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  sub_22BFFC91C();
  id v3 = *(id *)(v1 + 16);
  uint64_t v4 = sub_22C017C64();
  uint64_t v6 = v5;

  v0[18] = v4;
  v0[19] = v6;
  uint64_t v7 = OBJC_IVAR____TtC12MigrationKit10HTTPClient_connection;
  v0[20] = OBJC_IVAR____TtC12MigrationKit10HTTPClient_connection;
  uint64_t v8 = *(void *)(v2 + v7);
  v0[21] = v8;
  if (v8)
  {
    uint64_t v9 = v0 + 14;
    swift_retain();
    uint64_t v10 = swift_allocObject();
    v0[22] = v10;
    swift_weakInit();
    uint64_t v11 = (void *)swift_task_alloc();
    v0[23] = v11;
    v11[2] = v10;
    v11[3] = v4;
    v11[4] = v6;
    uint64_t v12 = (void *)swift_task_alloc();
    v0[24] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_22BFFCF90;
    uint64_t v13 = MEMORY[0x263F8D6C8];
    uint64_t v14 = sub_22BFFDFB0;
LABEL_3:
    uint64_t v15 = v14;
    uint64_t v16 = v9;
    uint64_t v17 = 0x74616428646E6573;
    unint64_t v18 = 0xEB00000000293A61;
    uint64_t v19 = v11;
LABEL_4:
    return MEMORY[0x270FA2360](v16, 0, 0, v17, v18, v15, v19, v13);
  }
  uint64_t v20 = v0[16];
  uint64_t v21 = v0[17];
  uint64_t v22 = *(void *)(v20 + 24);
  v0[26] = v22;
  unint64_t v23 = *(void *)(v20 + 32);
  v0[27] = v23;
  if (v23 >> 60 != 15)
  {
    uint64_t v24 = *(void *)(v21 + v7);
    v0[28] = v24;
    if (v24)
    {
      uint64_t v9 = v0 + 15;
      swift_retain();
      sub_22BFFDFC4(v22, v23);
      uint64_t v25 = swift_allocObject();
      v0[29] = v25;
      swift_weakInit();
      uint64_t v11 = (void *)swift_task_alloc();
      v0[30] = v11;
      v11[2] = v25;
      v11[3] = v22;
      v11[4] = v23;
      uint64_t v26 = (void *)swift_task_alloc();
      v0[31] = v26;
      void *v26 = v0;
      v26[1] = sub_22BFFD458;
      uint64_t v13 = MEMORY[0x263F8D6C8];
      uint64_t v14 = (uint64_t (*)(uint64_t))sub_22BFFDFD8;
      goto LABEL_3;
    }
  }
  type metadata accessor for HTTPParser();
  uint64_t inited = swift_initStackObject();
  v0[33] = inited;
  *(void *)(inited + 32) = 0;
  *(_OWORD *)(inited + 16) = xmmword_22C026150;
  uint64_t v28 = *(void *)(v21 + v7);
  if (v28)
  {
    v0[34] = v28;
    swift_retain();
    uint64_t v29 = swift_allocObject();
    v0[35] = v29;
    swift_weakInit();
    uint64_t v30 = (void *)swift_task_alloc();
    v0[36] = v30;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684976A0);
    void *v30 = v0;
    v30[1] = sub_22BFFD820;
    uint64_t v15 = sub_22BFFDFBC;
    uint64_t v16 = v0 + 10;
    uint64_t v17 = 0x2865766965636572;
    unint64_t v18 = 0xE900000000000029;
    uint64_t v19 = (void *)v29;
    goto LABEL_4;
  }
  id v31 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HTTPHeaders()), sel_init);
  type metadata accessor for HTTPResponse();
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v31;
  *(_OWORD *)(v32 + 24) = xmmword_22C026140;
  sub_22BFF9D68(0, 0xF000000000000000);
  swift_release();
  sub_22BFE6770(v0[18], v0[19]);
  uint64_t v33 = (uint64_t (*)(uint64_t))v0[1];
  return v33(v32);
}

uint64_t sub_22BFFCF90()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_22BFFD3D8;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_22BFFD0B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22BFFD0B4()
{
  swift_release();
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = *(void *)(v1 + 24);
  v0[26] = v3;
  unint64_t v4 = *(void *)(v1 + 32);
  v0[27] = v4;
  uint64_t v5 = v0[20];
  if (v4 >> 60 != 15)
  {
    uint64_t v6 = *(void *)(v2 + v5);
    v0[28] = v6;
    if (v6)
    {
      swift_retain();
      sub_22BFFDFC4(v3, v4);
      uint64_t v7 = swift_allocObject();
      v0[29] = v7;
      swift_weakInit();
      uint64_t v8 = (void *)swift_task_alloc();
      v0[30] = v8;
      v8[2] = v7;
      v8[3] = v3;
      v8[4] = v4;
      uint64_t v9 = (void *)swift_task_alloc();
      v0[31] = v9;
      void *v9 = v0;
      v9[1] = sub_22BFFD458;
      uint64_t v10 = MEMORY[0x263F8D6C8];
      uint64_t v11 = (uint64_t (*)(uint64_t))sub_22BFFDFD8;
      uint64_t v12 = v0 + 15;
      uint64_t v13 = 0x74616428646E6573;
      unint64_t v14 = 0xEB00000000293A61;
      uint64_t v15 = v8;
LABEL_6:
      return MEMORY[0x270FA2360](v12, 0, 0, v13, v14, v11, v15, v10);
    }
  }
  type metadata accessor for HTTPParser();
  uint64_t inited = swift_initStackObject();
  v0[33] = inited;
  *(void *)(inited + 32) = 0;
  *(_OWORD *)(inited + 16) = xmmword_22C026150;
  uint64_t v17 = *(void *)(v2 + v5);
  if (v17)
  {
    v0[34] = v17;
    swift_retain();
    uint64_t v18 = swift_allocObject();
    v0[35] = v18;
    swift_weakInit();
    uint64_t v19 = (void *)swift_task_alloc();
    v0[36] = v19;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684976A0);
    void *v19 = v0;
    v19[1] = sub_22BFFD820;
    uint64_t v11 = sub_22BFFDFBC;
    uint64_t v12 = v0 + 10;
    uint64_t v13 = 0x2865766965636572;
    unint64_t v14 = 0xE900000000000029;
    uint64_t v15 = (void *)v18;
    goto LABEL_6;
  }
  id v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HTTPHeaders()), sel_init);
  type metadata accessor for HTTPResponse();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  *(_OWORD *)(v21 + 24) = xmmword_22C026140;
  sub_22BFF9D68(0, 0xF000000000000000);
  swift_release();
  sub_22BFE6770(v0[18], v0[19]);
  uint64_t v22 = (uint64_t (*)(uint64_t))v0[1];
  return v22(v21);
}

uint64_t sub_22BFFD3D8()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  sub_22BFE6770(v0[18], v0[19]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_22BFFD458()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_22BFFD788;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_22BFFD57C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22BFFD57C()
{
  sub_22BFF9D68(v0[26], v0[27]);
  swift_release();
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  type metadata accessor for HTTPParser();
  uint64_t inited = swift_initStackObject();
  v0[33] = inited;
  *(void *)(inited + 32) = 0;
  *(_OWORD *)(inited + 16) = xmmword_22C026150;
  uint64_t v4 = *(void *)(v2 + v1);
  if (v4)
  {
    v0[34] = v4;
    swift_retain();
    uint64_t v5 = swift_allocObject();
    v0[35] = v5;
    swift_weakInit();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[36] = v6;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684976A0);
    void *v6 = v0;
    v6[1] = sub_22BFFD820;
    return MEMORY[0x270FA2360](v0 + 10, 0, 0, 0x2865766965636572, 0xE900000000000029, sub_22BFFDFBC, v5, v7);
  }
  else
  {
    id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HTTPHeaders()), sel_init);
    type metadata accessor for HTTPResponse();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    *(_OWORD *)(v9 + 24) = xmmword_22C026140;
    sub_22BFF9D68(0, 0xF000000000000000);
    swift_release();
    sub_22BFE6770(v0[18], v0[19]);
    uint64_t v10 = (uint64_t (*)(uint64_t))v0[1];
    return v10(v9);
  }
}

uint64_t sub_22BFFD788()
{
  unint64_t v1 = v0[27];
  uint64_t v2 = v0[26];
  swift_release();
  sub_22BFF9D68(v2, v1);
  swift_release();
  swift_task_dealloc();
  sub_22BFE6770(v0[18], v0[19]);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_22BFFD820()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_22BFFDD4C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_22BFFD93C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22BFFD93C()
{
  swift_release();
  uint64_t v2 = v0[10];
  unint64_t v1 = v0[11];
  if (v1 >> 60 != 15)
  {
    switch(v1 >> 62)
    {
      case 1uLL:
        LODWORD(v3) = HIDWORD(v2) - v2;
        if (__OFSUB__(HIDWORD(v2), v2))
        {
          __break(1u);
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v3 = (int)v3;
LABEL_7:
        if (v3)
        {
          uint64_t v7 = *(void *)(v0[33] + 32);
          if (!v7)
          {
            swift_beginAccess();
            sub_22C01DF28();
            swift_endAccess();
            if (sub_22C003A2C()) {
              goto LABEL_22;
            }
            uint64_t v11 = *(void *)(v0[33] + 32);
            if (v11)
            {
              swift_retain();
LABEL_28:
              sub_22BFF9D68(v2, v1);
              uint64_t v21 = *(void **)(v11 + 16);
              swift_retain();
              if (objc_msgSend(v21, sel_isClosed))
              {
                uint64_t v22 = v0[20];
                uint64_t v23 = v0[17];
                if (*(void *)(v23 + v22))
                {
                  swift_retain();
                  sub_22C01E2A8();
                  swift_release();
                  uint64_t v22 = v0[20];
                  uint64_t v23 = v0[17];
                }
                *(void *)(v23 + v22) = 0;
                swift_release();
              }
              swift_release();
              goto LABEL_13;
            }
LABEL_37:
            __break(1u);
            JUMPOUT(0x22BFFDD3CLL);
          }
          unint64_t v8 = *(void *)(v7 + 32);
          if (v8 >> 60 == 15)
          {
            uint64_t v9 = *(void *)(v7 + 24);
            *(void *)(v7 + 24) = v2;
            *(void *)(v7 + 32) = v1;
            swift_retain();
            sub_22BFFDFC4(v2, v1);
            sub_22BFF9D68(v9, v8);
          }
          else
          {
            uint64_t v14 = *(void *)(v7 + 24);
            v0[12] = v14;
            v0[13] = v8;
            swift_retain();
            sub_22BFFDFC4(v14, v8);
            sub_22C01DF28();
            sub_22BFE6770(v0[12], v0[13]);
          }
          if (sub_22C003A2C())
          {
            swift_release();
LABEL_22:
            uint64_t v15 = v0[20];
            uint64_t v16 = v0[17];
            sub_22BFF9D68(v2, v1);
            uint64_t v17 = *(void *)(v16 + v15);
            if (v17)
            {
              v0[34] = v17;
              swift_retain();
              uint64_t v18 = swift_allocObject();
              v0[35] = v18;
              swift_weakInit();
              uint64_t v19 = (void *)swift_task_alloc();
              v0[36] = v19;
              uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684976A0);
              void *v19 = v0;
              v19[1] = sub_22BFFD820;
              return MEMORY[0x270FA2360](v0 + 10, 0, 0, 0x2865766965636572, 0xE900000000000029, sub_22BFFDFBC, v18, v20);
            }
            break;
          }
          uint64_t v11 = *(void *)(v0[33] + 32);
          if (v11)
          {
            swift_retain();
            swift_release();
            goto LABEL_28;
          }
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
LABEL_11:
        sub_22BFF9D68(v0[10], v0[11]);
        break;
      case 2uLL:
        uint64_t v5 = *(void *)(v2 + 16);
        uint64_t v4 = *(void *)(v2 + 24);
        BOOL v6 = __OFSUB__(v4, v5);
        uint64_t v3 = v4 - v5;
        if (!v6) {
          goto LABEL_7;
        }
        goto LABEL_35;
      case 3uLL:
        goto LABEL_11;
      default:
        uint64_t v3 = BYTE6(v1);
        goto LABEL_7;
    }
  }
  id v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HTTPHeaders()), sel_init);
  type metadata accessor for HTTPResponse();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(_OWORD *)(v11 + 24) = xmmword_22C026140;
  sub_22BFF9D68(0, 0xF000000000000000);
LABEL_13:
  swift_release();
  sub_22BFE6770(v0[18], v0[19]);
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v11);
}

uint64_t sub_22BFFDD4C()
{
  uint64_t v1 = v0[33];
  swift_release();
  swift_release();
  swift_setDeallocating();
  sub_22BFE6770(*(void *)(v1 + 16), *(void *)(v1 + 24));
  swift_release();
  sub_22BFE6770(v0[18], v0[19]);
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_22BFFDDDC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12MigrationKit10HTTPClient_endpoint;
  uint64_t v2 = sub_22C01E208();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_22BFFDE8C()
{
  return type metadata accessor for HTTPClient();
}

uint64_t type metadata accessor for HTTPClient()
{
  uint64_t result = qword_268497680;
  if (!qword_268497680) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22BFFDEE0()
{
  uint64_t result = sub_22C01E208();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22BFFDF78()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22BFFDFB0(uint64_t a1)
{
  return sub_22C011CC8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_22BFFDFBC(uint64_t a1)
{
  return sub_22C0121FC(a1);
}

uint64_t sub_22BFFDFC4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_22BFE67D0(a1, a2);
  }
  return a1;
}

ValueMetadata *type metadata accessor for AppMigrator()
{
  return &type metadata for AppMigrator;
}

unint64_t sub_22BFFDFEC()
{
  return 0xD000000000000018;
}

void sub_22BFFE008()
{
}

uint64_t type metadata accessor for HTTPResponse()
{
  return self;
}

uint64_t GenericError.description.getter()
{
  uint64_t v1 = *v0;
  if (v0[2])
  {
    sub_22C01E6E8();
    swift_bridgeObjectRetain();
    sub_22C01E508();
    swift_bridgeObjectRelease();
    sub_22C01E508();
    swift_getErrorValue();
    sub_22C01E7C8();
    return 0;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v1;
}

void destroy for GenericError(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s12MigrationKit12GenericErrorVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  swift_bridgeObjectRetain();
  id v5 = v4;
  a1[2] = v4;
  return a1;
}

void *assignWithCopy for GenericError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  id v6 = v5;
  a1[2] = v5;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for GenericError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for GenericError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GenericError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenericError()
{
  return &type metadata for GenericError;
}

uint64_t static Model.model()()
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_22C01E8A8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(&v37, 0x500uLL);
  int v5 = uname(&v37);
  if (v5 != sub_22C01E1B8()) {
    return 0;
  }
  uint64_t v32 = v0;
  uint64_t v33 = v2;
  long long v25 = *(_OWORD *)&v37.machine[16];
  long long v26 = *(_OWORD *)v37.machine;
  long long v23 = *(_OWORD *)&v37.machine[48];
  long long v24 = *(_OWORD *)&v37.machine[32];
  long long v35 = *(_OWORD *)&v37.machine[64];
  long long v30 = *(_OWORD *)&v37.machine[96];
  long long v31 = *(_OWORD *)&v37.machine[80];
  long long v28 = *(_OWORD *)&v37.machine[128];
  long long v29 = *(_OWORD *)&v37.machine[112];
  long long v27 = *(_OWORD *)&v37.machine[144];
  *((void *)&v43 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2684976A8);
  id v6 = (_OWORD *)swift_allocObject();
  *(void *)&long long v42 = v6;
  long long v7 = v25;
  v6[1] = v26;
  v6[2] = v7;
  long long v8 = v23;
  v6[3] = v24;
  v6[4] = v8;
  long long v9 = *(_OWORD *)&v37.machine[160];
  long long v10 = *(_OWORD *)&v37.machine[176];
  long long v11 = *(_OWORD *)&v37.machine[192];
  long long v12 = *(_OWORD *)&v37.machine[208];
  long long v13 = *(_OWORD *)&v37.machine[224];
  long long v14 = *(_OWORD *)&v37.machine[240];
  long long v15 = v31;
  v6[5] = v35;
  v6[6] = v15;
  long long v16 = v29;
  v6[7] = v30;
  v6[8] = v16;
  long long v17 = v27;
  v6[9] = v28;
  v6[10] = v17;
  v6[11] = v9;
  v6[12] = v10;
  v6[13] = v11;
  v6[14] = v12;
  v6[15] = v13;
  v6[16] = v14;
  sub_22C01E888();
  *(void *)&long long v31 = v4;
  *(void *)&long long v30 = sub_22C01E898();
  *(void *)&long long v35 = sub_22C01E728();
  sub_22C01E7A8();
  uint64_t v34 = v1;
  uint64_t v18 = 0;
  if (!*((void *)&v44 + 1))
  {
    uint64_t v20 = 0xE000000000000000;
LABEL_12:
    swift_release();
    swift_release();
    uint64_t v21 = sub_22BFFE738(v18, v20);
    swift_bridgeObjectRelease();
    (*(void (**)(void, uint64_t))(v33 + 8))(v31, v34);
    return v21;
  }
  unint64_t v19 = 0xE000000000000000;
  while (1)
  {
    long long v40 = v42;
    v41[0] = v43;
    v41[1] = v44;
    long long v38 = v42;
    sub_22C001A2C((uint64_t)v41, (uint64_t)&v39);
    if (swift_dynamicCast())
    {
      if (v36) {
        break;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v20 = v19;
LABEL_5:
    sub_22C001A88((uint64_t)&v40);
    swift_bridgeObjectRelease();
    sub_22C01E7A8();
    unint64_t v19 = v20;
    if (!*((void *)&v44 + 1)) {
      goto LABEL_12;
    }
  }
  if ((v36 & 0x80) == 0)
  {
    *(void *)&long long v38 = v36;
    MEMORY[0x230F5B280](&v38, 1);
    *(void *)&long long v38 = v18;
    *((void *)&v38 + 1) = v19;
    swift_bridgeObjectRetain();
    sub_22C01E508();
    swift_bridgeObjectRelease();
    uint64_t v20 = *((void *)&v38 + 1);
    uint64_t v18 = v38;
    goto LABEL_5;
  }
  uint64_t result = sub_22C01E738();
  __break(1u);
  return result;
}

uint64_t sub_22BFFE728()
{
  return MEMORY[0x270FA0238](v0, 272, 7);
}

uint64_t sub_22BFFE738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0xD00000000000001BLL;
  if ((a1 != 0x312C35646F5069 || a2 != 0xE700000000000000) && (sub_22C01E7D8() & 1) == 0)
  {
    uint64_t v4 = 0xD00000000000001BLL;
    if ((a1 != 0x312C37646F5069 || a2 != 0xE700000000000000) && (sub_22C01E7D8() & 1) == 0)
    {
      uint64_t v4 = 0xD00000000000001BLL;
      if ((a1 != 0x312C39646F5069 || a2 != 0xE700000000000000) && (sub_22C01E7D8() & 1) == 0)
      {
        uint64_t v4 = 0x3420656E6F685069;
        if ((a1 != 0x2C33656E6F685069 || a2 != 0xE900000000000031)
          && (sub_22C01E7D8() & 1) == 0
          && (a1 != 0x2C33656E6F685069 || a2 != 0xE900000000000032)
          && (sub_22C01E7D8() & 1) == 0
          && (a1 != 0x2C33656E6F685069 || a2 != 0xE900000000000033)
          && (sub_22C01E7D8() & 1) == 0
          && (a1 != 0x2C34656E6F685069 || a2 != 0xE900000000000031)
          && (sub_22C01E7D8() & 1) == 0)
        {
          uint64_t v4 = 0x3520656E6F685069;
          if (a1 != 0x2C35656E6F685069 || a2 != 0xE900000000000031)
          {
            char v6 = sub_22C01E7D8();
            BOOL v7 = a1 == 0x2C35656E6F685069 && a2 == 0xE900000000000032;
            BOOL v8 = v7;
            if ((v6 & 1) == 0
              && !v8
              && (sub_22C01E7D8() & 1) == 0
              && (a1 != 0x2C35656E6F685069 || a2 != 0xE900000000000033)
              && (sub_22C01E7D8() & 1) == 0
              && (a1 != 0x2C35656E6F685069 || a2 != 0xE900000000000034)
              && (sub_22C01E7D8() & 1) == 0
              && (a1 != 0x2C36656E6F685069 || a2 != 0xE900000000000031))
            {
              char v9 = sub_22C01E7D8();
              BOOL v10 = a1 == 0x2C36656E6F685069 && a2 == 0xE900000000000032;
              BOOL v11 = v10;
              if ((v9 & 1) == 0 && !v11 && (sub_22C01E7D8() & 1) == 0)
              {
                uint64_t v4 = 0x3620656E6F685069;
                if ((a1 != 0x2C37656E6F685069 || a2 != 0xE900000000000032)
                  && (sub_22C01E7D8() & 1) == 0
                  && (a1 != 0x2C37656E6F685069 || a2 != 0xE900000000000031)
                  && (sub_22C01E7D8() & 1) == 0
                  && (a1 != 0x2C38656E6F685069 || a2 != 0xE900000000000031)
                  && (sub_22C01E7D8() & 1) == 0
                  && (a1 != 0x2C38656E6F685069 || a2 != 0xE900000000000032)
                  && (sub_22C01E7D8() & 1) == 0)
                {
                  uint64_t v4 = 0x3720656E6F685069;
                  if (a1 != 0x2C39656E6F685069 || a2 != 0xE900000000000031)
                  {
                    char v12 = sub_22C01E7D8();
                    BOOL v13 = a1 == 0x2C39656E6F685069 && a2 == 0xE900000000000033;
                    BOOL v14 = v13;
                    if ((v12 & 1) == 0
                      && !v14
                      && (sub_22C01E7D8() & 1) == 0
                      && (a1 != 0x2C39656E6F685069 || a2 != 0xE900000000000032))
                    {
                      char v15 = sub_22C01E7D8();
                      BOOL v16 = a1 == 0x2C39656E6F685069 && a2 == 0xE900000000000034;
                      BOOL v17 = v16;
                      if ((v15 & 1) == 0 && !v17 && (sub_22C01E7D8() & 1) == 0)
                      {
                        uint64_t v4 = 0x3820656E6F685069;
                        if ((a1 != 0x3031656E6F685069 || a2 != 0xEA0000000000312CLL)
                          && (sub_22C01E7D8() & 1) == 0
                          && (a1 != 0x3031656E6F685069 || a2 != 0xEA0000000000342CLL)
                          && (sub_22C01E7D8() & 1) == 0
                          && (a1 != 0x3031656E6F685069 || a2 != 0xEA0000000000322CLL)
                          && (sub_22C01E7D8() & 1) == 0
                          && (a1 != 0x3031656E6F685069 || a2 != 0xEA0000000000352CLL)
                          && (sub_22C01E7D8() & 1) == 0)
                        {
                          uint64_t v4 = 0x5820656E6F685069;
                          if ((a1 != 0x3031656E6F685069 || a2 != 0xEA0000000000332CLL)
                            && (sub_22C01E7D8() & 1) == 0
                            && (a1 != 0x3031656E6F685069 || a2 != 0xEA0000000000362CLL)
                            && (sub_22C01E7D8() & 1) == 0
                            && (a1 != 0x3131656E6F685069 || a2 != 0xEA0000000000322CLL)
                            && (sub_22C01E7D8() & 1) == 0
                            && (a1 != 0x3131656E6F685069 || a2 != 0xEA0000000000342CLL))
                          {
                            char v18 = sub_22C01E7D8();
                            BOOL v19 = a1 == 0x3131656E6F685069 && a2 == 0xEA0000000000362CLL;
                            BOOL v20 = v19;
                            if ((v18 & 1) == 0
                              && !v20
                              && (sub_22C01E7D8() & 1) == 0
                              && (a1 != 0x3131656E6F685069 || a2 != 0xEA0000000000382CLL)
                              && (sub_22C01E7D8() & 1) == 0)
                            {
                              uint64_t v4 = 0x3120656E6F685069;
                              if ((a1 != 0x3231656E6F685069 || a2 != 0xEA0000000000312CLL)
                                && (sub_22C01E7D8() & 1) == 0
                                && (a1 != 0x3231656E6F685069 || a2 != 0xEA0000000000332CLL)
                                && (sub_22C01E7D8() & 1) == 0)
                              {
                                if (a1 == 0x3231656E6F685069 && a2 == 0xEA0000000000352CLL
                                  || (sub_22C01E7D8() & 1) != 0)
                                {
                                  return 0xD000000000000011;
                                }
                                if ((a1 != 0x3331656E6F685069 || a2 != 0xEA0000000000312CLL)
                                  && (sub_22C01E7D8() & 1) == 0
                                  && (a1 != 0x3331656E6F685069 || a2 != 0xEA0000000000322CLL)
                                  && (sub_22C01E7D8() & 1) == 0
                                  && (a1 != 0x3331656E6F685069 || a2 != 0xEA0000000000332CLL)
                                  && (sub_22C01E7D8() & 1) == 0)
                                {
                                  if (a1 == 0x3331656E6F685069 && a2 == 0xEA0000000000342CLL
                                    || (sub_22C01E7D8() & 1) != 0)
                                  {
                                    return 0xD000000000000011;
                                  }
                                  if ((a1 != 0x3431656E6F685069 || a2 != 0xEA0000000000342CLL)
                                    && (sub_22C01E7D8() & 1) == 0
                                    && (a1 != 0x3431656E6F685069 || a2 != 0xEA0000000000352CLL)
                                    && (sub_22C01E7D8() & 1) == 0
                                    && (a1 != 0x3431656E6F685069 || a2 != 0xEA0000000000322CLL)
                                    && (sub_22C01E7D8() & 1) == 0)
                                  {
                                    if (a1 == 0x3431656E6F685069 && a2 == 0xEA0000000000332CLL
                                      || (sub_22C01E7D8() & 1) != 0)
                                    {
                                      return 0xD000000000000011;
                                    }
                                    if ((a1 != 0x3431656E6F685069 || a2 != 0xEA0000000000372CLL)
                                      && (sub_22C01E7D8() & 1) == 0
                                      && (a1 != 0x3431656E6F685069 || a2 != 0xEA0000000000382CLL)
                                      && (sub_22C01E7D8() & 1) == 0
                                      && (a1 != 0x3531656E6F685069 || a2 != 0xEA0000000000322CLL)
                                      && (sub_22C01E7D8() & 1) == 0)
                                    {
                                      if (a1 == 0x3531656E6F685069 && a2 == 0xEA0000000000332CLL
                                        || (sub_22C01E7D8() & 1) != 0)
                                      {
                                        return 0xD000000000000011;
                                      }
                                      if ((a1 != 0x3531656E6F685069 || a2 != 0xEA0000000000342CLL)
                                        && (sub_22C01E7D8() & 1) == 0
                                        && (a1 != 0x3531656E6F685069 || a2 != 0xEA0000000000352CLL)
                                        && (sub_22C01E7D8() & 1) == 0
                                        && (a1 != 0x3631656E6F685069 || a2 != 0xEA0000000000312CLL)
                                        && (sub_22C01E7D8() & 1) == 0)
                                      {
                                        if (a1 == 0x3631656E6F685069 && a2 == 0xEA0000000000322CLL
                                          || (sub_22C01E7D8() & 1) != 0)
                                        {
                                          return 0xD000000000000011;
                                        }
                                        else
                                        {
                                          uint64_t v4 = 0x5320656E6F685069;
                                          if ((a1 != 0x2C38656E6F685069 || a2 != 0xE900000000000034)
                                            && (sub_22C01E7D8() & 1) == 0)
                                          {
                                            uint64_t v4 = 0xD00000000000001ALL;
                                            if ((a1 != 0x3231656E6F685069 || a2 != 0xEA0000000000382CLL)
                                              && (sub_22C01E7D8() & 1) == 0)
                                            {
                                              uint64_t v4 = 0xD00000000000001ALL;
                                              if ((a1 != 0x3431656E6F685069 || a2 != 0xEA0000000000362CLL)
                                                && (sub_22C01E7D8() & 1) == 0)
                                              {
                                                uint64_t v4 = 0x322064615069;
                                                if (a1 != 0x312C3264615069 || a2 != 0xE700000000000000)
                                                {
                                                  char v21 = sub_22C01E7D8();
                                                  BOOL v22 = a1 == 0x322C3264615069 && a2 == 0xE700000000000000;
                                                  BOOL v23 = v22;
                                                  if ((v21 & 1) == 0 && !v23)
                                                  {
                                                    char v24 = sub_22C01E7D8();
                                                    BOOL v25 = a1 == 0x332C3264615069 && a2 == 0xE700000000000000;
                                                    BOOL v26 = v25;
                                                    if ((v24 & 1) == 0 && !v26)
                                                    {
                                                      char v27 = sub_22C01E7D8();
                                                      BOOL v28 = a1 == 0x342C3264615069 && a2 == 0xE700000000000000;
                                                      BOOL v29 = v28;
                                                      if ((v27 & 1) == 0 && !v29 && (sub_22C01E7D8() & 1) == 0)
                                                      {
                                                        if (a1 == 0x312C3364615069 && a2 == 0xE700000000000000) {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v30 = sub_22C01E7D8();
                                                        BOOL v31 = a1 == 0x322C3364615069 && a2 == 0xE700000000000000;
                                                        BOOL v32 = v31;
                                                        if ((v30 & 1) != 0 || v32) {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v33 = sub_22C01E7D8();
                                                        BOOL v34 = a1 == 0x332C3364615069 && a2 == 0xE700000000000000;
                                                        BOOL v35 = v34;
                                                        if ((v33 & 1) != 0
                                                          || v35
                                                          || (sub_22C01E7D8() & 1) != 0
                                                          || a1 == 0x342C3364615069 && a2 == 0xE700000000000000)
                                                        {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v36 = sub_22C01E7D8();
                                                        BOOL v37 = a1 == 0x352C3364615069 && a2 == 0xE700000000000000;
                                                        BOOL v38 = v37;
                                                        if ((v36 & 1) != 0 || v38) {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v39 = sub_22C01E7D8();
                                                        BOOL v40 = a1 == 0x362C3364615069 && a2 == 0xE700000000000000;
                                                        BOOL v41 = v40;
                                                        if ((v39 & 1) != 0
                                                          || v41
                                                          || (sub_22C01E7D8() & 1) != 0
                                                          || a1 == 0x31312C3664615069 && a2 == 0xE800000000000000)
                                                        {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v42 = sub_22C01E7D8();
                                                        BOOL v43 = a1 == 0x32312C3664615069 && a2 == 0xE800000000000000;
                                                        BOOL v44 = v43;
                                                        if ((v42 & 1) != 0
                                                          || v44
                                                          || (sub_22C01E7D8() & 1) != 0
                                                          || a1 == 0x352C3764615069 && a2 == 0xE700000000000000)
                                                        {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v45 = sub_22C01E7D8();
                                                        BOOL v46 = a1 == 0x362C3764615069 && a2 == 0xE700000000000000;
                                                        BOOL v47 = v46;
                                                        if ((v45 & 1) != 0
                                                          || v47
                                                          || (sub_22C01E7D8() & 1) != 0
                                                          || a1 == 0x31312C3764615069 && a2 == 0xE800000000000000)
                                                        {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v48 = sub_22C01E7D8();
                                                        BOOL v49 = a1 == 0x32312C3764615069 && a2 == 0xE800000000000000;
                                                        BOOL v50 = v49;
                                                        if ((v48 & 1) != 0
                                                          || v50
                                                          || (sub_22C01E7D8() & 1) != 0
                                                          || a1 == 0x362C313164615069 && a2 == 0xE800000000000000)
                                                        {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v51 = sub_22C01E7D8();
                                                        BOOL v52 = a1 == 0x372C313164615069 && a2 == 0xE800000000000000;
                                                        BOOL v53 = v52;
                                                        if ((v51 & 1) != 0
                                                          || v53
                                                          || (sub_22C01E7D8() & 1) != 0
                                                          || a1 == 0x312C323164615069 && a2 == 0xE800000000000000)
                                                        {
                                                          return 0xD000000000000015;
                                                        }
                                                        char v54 = sub_22C01E7D8();
                                                        BOOL v55 = a1 == 0x322C323164615069 && a2 == 0xE800000000000000;
                                                        BOOL v56 = v55;
                                                        if (v54 & 1) != 0 || v56 || (sub_22C01E7D8())
                                                        {
                                                          return 0xD000000000000015;
                                                        }
                                                        else
                                                        {
                                                          uint64_t v4 = 0xD000000000000016;
                                                          if (a1 != 0x312C333164615069 || a2 != 0xE900000000000038)
                                                          {
                                                            char v57 = sub_22C01E7D8();
                                                            BOOL v58 = a1 == 0x312C333164615069
                                                               && a2 == 0xE900000000000039;
                                                            BOOL v59 = v58;
                                                            if ((v57 & 1) == 0 && !v59)
                                                            {
                                                              if (sub_22C01E7D8())
                                                              {
                                                                return 0xD000000000000016;
                                                              }
                                                              else
                                                              {
                                                                uint64_t v4 = 0x7269412064615069;
                                                                if (a1 != 0x312C3464615069
                                                                  || a2 != 0xE700000000000000)
                                                                {
                                                                  char v60 = sub_22C01E7D8();
                                                                  BOOL v61 = a1 == 0x322C3464615069
                                                                     && a2 == 0xE700000000000000;
                                                                  BOOL v62 = v61;
                                                                  if ((v60 & 1) == 0 && !v62)
                                                                  {
                                                                    char v63 = sub_22C01E7D8();
                                                                    BOOL v64 = a1 == 0x332C3464615069
                                                                       && a2 == 0xE700000000000000;
                                                                    BOOL v65 = v64;
                                                                    if ((v63 & 1) == 0
                                                                      && !v65
                                                                      && (sub_22C01E7D8() & 1) == 0
                                                                      && (a1 != 0x332C3564615069
                                                                       || a2 != 0xE700000000000000))
                                                                    {
                                                                      char v66 = sub_22C01E7D8();
                                                                      BOOL v67 = a1 == 0x342C3564615069
                                                                         && a2 == 0xE700000000000000;
                                                                      BOOL v68 = v67;
                                                                      if ((v66 & 1) == 0
                                                                        && !v68
                                                                        && (sub_22C01E7D8() & 1) == 0)
                                                                      {
                                                                        uint64_t v4 = 0xD000000000000019;
                                                                        if (a1 != 0x332C313164615069
                                                                          || a2 != 0xE800000000000000)
                                                                        {
                                                                          char v69 = sub_22C01E7D8();
                                                                          BOOL v70 = a1 == 0x342C313164615069
                                                                             && a2 == 0xE800000000000000;
                                                                          BOOL v71 = v70;
                                                                          if ((v69 & 1) == 0 && !v71)
                                                                          {
                                                                            uint64_t v4 = 0xD000000000000019;
                                                                            if ((sub_22C01E7D8() & 1) == 0
                                                                              && (a1 != 0x312C333164615069
                                                                               || a2 != 0xE800000000000000))
                                                                            {
                                                                              char v72 = sub_22C01E7D8();
                                                                              BOOL v73 = a1 == 0x322C333164615069
                                                                                 && a2 == 0xE800000000000000;
                                                                              BOOL v74 = v73;
                                                                              uint64_t v4 = 0xD000000000000019;
                                                                              if ((v72 & 1) == 0 && !v74)
                                                                              {
                                                                                uint64_t v4 = 0xD000000000000019;
                                                                                if ((sub_22C01E7D8() & 1) == 0
                                                                                  && (a1 != 0x312C333164615069
                                                                                   || a2 != 0xE900000000000036))
                                                                                {
                                                                                  char v75 = sub_22C01E7D8();
                                                                                  BOOL v76 = a1 == 0x312C333164615069
                                                                                     && a2 == 0xE900000000000037;
                                                                                  BOOL v77 = v76;
                                                                                  uint64_t v4 = 0xD000000000000019;
                                                                                  if ((v75 & 1) == 0 && !v77)
                                                                                  {
                                                                                    if (sub_22C01E7D8())
                                                                                    {
                                                                                      return 0xD000000000000019;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      uint64_t v4 = 0xD000000000000017;
                                                                                      if (a1 != 0x382C343164615069
                                                                                        || a2 != 0xE800000000000000)
                                                                                      {
                                                                                        char v78 = sub_22C01E7D8();
                                                                                        BOOL v79 = a1 == 0x392C343164615069
                                                                                           && a2 == 0xE800000000000000;
                                                                                        BOOL v80 = v79;
                                                                                        if ((v78 & 1) == 0 && !v80)
                                                                                        {
                                                                                          uint64_t v4 = 0xD000000000000017;
                                                                                          if ((sub_22C01E7D8() & 1) == 0
                                                                                            && (a1 != 0x312C343164615069
                                                                                             || a2 != 0xE900000000000030))
                                                                                          {
                                                                                            char v81 = sub_22C01E7D8();
                                                                                            BOOL v82 = a1 == 0x312C343164615069
                                                                                               && a2 == 0xE900000000000031;
                                                                                            BOOL v83 = v82;
                                                                                            uint64_t v4 = 0xD000000000000017;
                                                                                            if ((v81 & 1) == 0 && !v83)
                                                                                            {
                                                                                              if (sub_22C01E7D8())
                                                                                              {
                                                                                                return 0xD000000000000017;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                uint64_t v4 = 0x6E696D2064615069;
                                                                                                if (a1 != 0x352C3264615069 || a2 != 0xE700000000000000)
                                                                                                {
                                                                                                  char v84 = sub_22C01E7D8();
                                                                                                  BOOL v85 = a1 == 0x362C3264615069 && a2 == 0xE700000000000000;
                                                                                                  BOOL v86 = v85;
                                                                                                  if ((v84 & 1) == 0 && !v86)
                                                                                                  {
                                                                                                    char v87 = sub_22C01E7D8();
                                                                                                    BOOL v88 = a1 == 0x372C3264615069 && a2 == 0xE700000000000000;
                                                                                                    BOOL v89 = v88;
                                                                                                    if ((v87 & 1) == 0 && !v89 && (sub_22C01E7D8() & 1) == 0 && (a1 != 0x342C3464615069 || a2 != 0xE700000000000000))
                                                                                                    {
                                                                                                      char v90 = sub_22C01E7D8();
                                                                                                      BOOL v91 = a1 == 0x352C3464615069 && a2 == 0xE700000000000000;
                                                                                                      BOOL v92 = v91;
                                                                                                      if ((v90 & 1) == 0 && !v92)
                                                                                                      {
                                                                                                        char v93 = sub_22C01E7D8();
                                                                                                        BOOL v94 = a1 == 0x362C3464615069 && a2 == 0xE700000000000000;
                                                                                                        BOOL v95 = v94;
                                                                                                        if ((v93 & 1) == 0 && !v95 && (sub_22C01E7D8() & 1) == 0 && (a1 != 0x372C3464615069 || a2 != 0xE700000000000000))
                                                                                                        {
                                                                                                          char v96 = sub_22C01E7D8();
                                                                                                          BOOL v97 = a1 == 0x382C3464615069 && a2 == 0xE700000000000000;
                                                                                                          BOOL v98 = v97;
                                                                                                          if ((v96 & 1) == 0 && !v98)
                                                                                                          {
                                                                                                            char v99 = sub_22C01E7D8();
                                                                                                            BOOL v100 = a1 == 0x392C3464615069 && a2 == 0xE700000000000000;
                                                                                                            BOOL v101 = v100;
                                                                                                            if ((v99 & 1) == 0 && !v101 && (sub_22C01E7D8() & 1) == 0 && (a1 != 0x312C3564615069 || a2 != 0xE700000000000000))
                                                                                                            {
                                                                                                              char v102 = sub_22C01E7D8();
                                                                                                              BOOL v103 = a1 == 0x322C3564615069 && a2 == 0xE700000000000000;
                                                                                                              BOOL v104 = v103;
                                                                                                              if ((v102 & 1) == 0 && !v104 && (sub_22C01E7D8() & 1) == 0)
                                                                                                              {
                                                                                                                uint64_t v4 = 0xD00000000000001ALL;
                                                                                                                if (a1 != 0x312C313164615069 || a2 != 0xE800000000000000)
                                                                                                                {
                                                                                                                  char v105 = sub_22C01E7D8();
                                                                                                                  BOOL v106 = a1 == 0x322C313164615069 && a2 == 0xE800000000000000;
                                                                                                                  BOOL v107 = v106;
                                                                                                                  if ((v105 & 1) == 0 && !v107)
                                                                                                                  {
                                                                                                                    uint64_t v4 = 0xD00000000000001ALL;
                                                                                                                    if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x312C343164615069 || a2 != 0xE800000000000000))
                                                                                                                    {
                                                                                                                      char v108 = sub_22C01E7D8();
                                                                                                                      BOOL v109 = a1 == 0x322C343164615069 && a2 == 0xE800000000000000;
                                                                                                                      BOOL v110 = v109;
                                                                                                                      uint64_t v4 = 0xD00000000000001ALL;
                                                                                                                      if ((v108 & 1) == 0 && !v110)
                                                                                                                      {
                                                                                                                        if (sub_22C01E7D8())
                                                                                                                        {
                                                                                                                          return 0xD00000000000001ALL;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          uint64_t v4 = 0xD000000000000013;
                                                                                                                          if (a1 != 0x332C3664615069 || a2 != 0xE700000000000000)
                                                                                                                          {
                                                                                                                            char v111 = sub_22C01E7D8();
                                                                                                                            BOOL v112 = a1 == 0x342C3664615069 && a2 == 0xE700000000000000;
                                                                                                                            BOOL v113 = v112;
                                                                                                                            if ((v111 & 1) == 0 && !v113 && (sub_22C01E7D8() & 1) == 0)
                                                                                                                            {
                                                                                                                              uint64_t v4 = 0xD000000000000014;
                                                                                                                              if (a1 != 0x332C3764615069 || a2 != 0xE700000000000000)
                                                                                                                              {
                                                                                                                                char v114 = sub_22C01E7D8();
                                                                                                                                BOOL v115 = a1 == 0x342C3764615069 && a2 == 0xE700000000000000;
                                                                                                                                BOOL v116 = v115;
                                                                                                                                if ((v114 & 1) == 0 && !v116 && (sub_22C01E7D8() & 1) == 0)
                                                                                                                                {
                                                                                                                                  uint64_t v4 = 0xD000000000000023;
                                                                                                                                  if (a1 != 0x312C3864615069 || a2 != 0xE700000000000000)
                                                                                                                                  {
                                                                                                                                    char v117 = sub_22C01E7D8();
                                                                                                                                    BOOL v118 = a1 == 0x322C3864615069 && a2 == 0xE700000000000000;
                                                                                                                                    BOOL v119 = v118;
                                                                                                                                    if ((v117 & 1) == 0 && !v119)
                                                                                                                                    {
                                                                                                                                      char v120 = sub_22C01E7D8();
                                                                                                                                      BOOL v121 = a1 == 0x332C3864615069 && a2 == 0xE700000000000000;
                                                                                                                                      BOOL v122 = v121;
                                                                                                                                      uint64_t v4 = 0xD000000000000023;
                                                                                                                                      if ((v120 & 1) == 0 && !v122)
                                                                                                                                      {
                                                                                                                                        char v123 = sub_22C01E7D8();
                                                                                                                                        BOOL v124 = a1 == 0x342C3864615069 && a2 == 0xE700000000000000;
                                                                                                                                        BOOL v125 = v124;
                                                                                                                                        uint64_t v4 = 0xD000000000000023;
                                                                                                                                        if ((v123 & 1) == 0 && !v125)
                                                                                                                                        {
                                                                                                                                          uint64_t v4 = 0xD000000000000023;
                                                                                                                                          if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x392C3864615069 || a2 != 0xE700000000000000))
                                                                                                                                          {
                                                                                                                                            char v126 = sub_22C01E7D8();
                                                                                                                                            BOOL v127 = a1 == 0x30312C3864615069 && a2 == 0xE800000000000000;
                                                                                                                                            BOOL v128 = v127;
                                                                                                                                            uint64_t v4 = 0xD000000000000023;
                                                                                                                                            if ((v126 & 1) == 0 && !v128)
                                                                                                                                            {
                                                                                                                                              uint64_t v4 = 0xD000000000000023;
                                                                                                                                              if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x342C333164615069 || a2 != 0xE800000000000000))
                                                                                                                                              {
                                                                                                                                                char v129 = sub_22C01E7D8();
                                                                                                                                                BOOL v130 = a1 == 0x352C333164615069 && a2 == 0xE800000000000000;
                                                                                                                                                BOOL v131 = v130;
                                                                                                                                                uint64_t v4 = 0xD000000000000023;
                                                                                                                                                if ((v129 & 1) == 0 && !v131)
                                                                                                                                                {
                                                                                                                                                  char v132 = sub_22C01E7D8();
                                                                                                                                                  BOOL v133 = a1 == 0x362C333164615069 && a2 == 0xE800000000000000;
                                                                                                                                                  BOOL v134 = v133;
                                                                                                                                                  uint64_t v4 = 0xD000000000000023;
                                                                                                                                                  if ((v132 & 1) == 0 && !v134)
                                                                                                                                                  {
                                                                                                                                                    char v135 = sub_22C01E7D8();
                                                                                                                                                    BOOL v136 = a1 == 0x372C333164615069 && a2 == 0xE800000000000000;
                                                                                                                                                    BOOL v137 = v136;
                                                                                                                                                    uint64_t v4 = 0xD000000000000023;
                                                                                                                                                    if ((v135 & 1) == 0 && !v137)
                                                                                                                                                    {
                                                                                                                                                      uint64_t v4 = 0xD000000000000023;
                                                                                                                                                      if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x332C343164615069 || a2 != 0xE800000000000000))
                                                                                                                                                      {
                                                                                                                                                        char v138 = sub_22C01E7D8();
                                                                                                                                                        BOOL v139 = a1 == 0x342C343164615069 && a2 == 0xE800000000000000;
                                                                                                                                                        BOOL v140 = v139;
                                                                                                                                                        uint64_t v4 = 0xD000000000000023;
                                                                                                                                                        if ((v138 & 1) == 0 && !v140)
                                                                                                                                                        {
                                                                                                                                                          if (sub_22C01E7D8())
                                                                                                                                                          {
                                                                                                                                                            return 0xD000000000000023;
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            uint64_t v4 = 0xD000000000000017;
                                                                                                                                                            if (a1 != 0x332C363164615069 || a2 != 0xE800000000000000)
                                                                                                                                                            {
                                                                                                                                                              char v141 = sub_22C01E7D8();
                                                                                                                                                              BOOL v142 = a1 == 0x342C363164615069 && a2 == 0xE800000000000000;
                                                                                                                                                              BOOL v143 = v142;
                                                                                                                                                              if ((v141 & 1) == 0 && !v143)
                                                                                                                                                              {
                                                                                                                                                                if (sub_22C01E7D8())
                                                                                                                                                                {
                                                                                                                                                                  return 0xD000000000000017;
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                  if (a1 != 0x372C3664615069 || a2 != 0xE700000000000000)
                                                                                                                                                                  {
                                                                                                                                                                    char v144 = sub_22C01E7D8();
                                                                                                                                                                    BOOL v145 = a1 == 0x382C3664615069 && a2 == 0xE700000000000000;
                                                                                                                                                                    BOOL v146 = v145;
                                                                                                                                                                    if ((v144 & 1) == 0 && !v146)
                                                                                                                                                                    {
                                                                                                                                                                      uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                      if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x312C3764615069 || a2 != 0xE700000000000000))
                                                                                                                                                                      {
                                                                                                                                                                        char v147 = sub_22C01E7D8();
                                                                                                                                                                        BOOL v148 = a1 == 0x322C3764615069 && a2 == 0xE700000000000000;
                                                                                                                                                                        BOOL v149 = v148;
                                                                                                                                                                        uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                        if ((v147 & 1) == 0 && !v149)
                                                                                                                                                                        {
                                                                                                                                                                          uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                          if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x352C3864615069 || a2 != 0xE700000000000000))
                                                                                                                                                                          {
                                                                                                                                                                            char v150 = sub_22C01E7D8();
                                                                                                                                                                            BOOL v151 = a1 == 0x362C3864615069 && a2 == 0xE700000000000000;
                                                                                                                                                                            BOOL v152 = v151;
                                                                                                                                                                            uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                            if ((v150 & 1) == 0 && !v152)
                                                                                                                                                                            {
                                                                                                                                                                              char v153 = sub_22C01E7D8();
                                                                                                                                                                              BOOL v154 = a1 == 0x372C3864615069 && a2 == 0xE700000000000000;
                                                                                                                                                                              BOOL v155 = v154;
                                                                                                                                                                              uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                              if ((v153 & 1) == 0 && !v155)
                                                                                                                                                                              {
                                                                                                                                                                                char v156 = sub_22C01E7D8();
                                                                                                                                                                                BOOL v157 = a1 == 0x382C3864615069 && a2 == 0xE700000000000000;
                                                                                                                                                                                BOOL v158 = v157;
                                                                                                                                                                                uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                if ((v156 & 1) == 0 && !v158)
                                                                                                                                                                                {
                                                                                                                                                                                  uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                  if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x31312C3864615069 || a2 != 0xE800000000000000))
                                                                                                                                                                                  {
                                                                                                                                                                                    char v159 = sub_22C01E7D8();
                                                                                                                                                                                    BOOL v160 = a1 == 0x32312C3864615069 && a2 == 0xE800000000000000;
                                                                                                                                                                                    BOOL v161 = v160;
                                                                                                                                                                                    uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                    if ((v159 & 1) == 0 && !v161)
                                                                                                                                                                                    {
                                                                                                                                                                                      uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                      if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x382C333164615069 || a2 != 0xE800000000000000))
                                                                                                                                                                                      {
                                                                                                                                                                                        char v162 = sub_22C01E7D8();
                                                                                                                                                                                        BOOL v163 = a1 == 0x392C333164615069 && a2 == 0xE800000000000000;
                                                                                                                                                                                        BOOL v164 = v163;
                                                                                                                                                                                        uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                        if ((v162 & 1) == 0 && !v164)
                                                                                                                                                                                        {
                                                                                                                                                                                          char v165 = sub_22C01E7D8();
                                                                                                                                                                                          BOOL v166 = a1 == 0x312C333164615069 && a2 == 0xE900000000000030;
                                                                                                                                                                                          BOOL v167 = v166;
                                                                                                                                                                                          uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                          if ((v165 & 1) == 0 && !v167)
                                                                                                                                                                                          {
                                                                                                                                                                                            char v168 = sub_22C01E7D8();
                                                                                                                                                                                            BOOL v169 = a1 == 0x312C333164615069 && a2 == 0xE900000000000031;
                                                                                                                                                                                            BOOL v170 = v169;
                                                                                                                                                                                            uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                            if ((v168 & 1) == 0 && !v170)
                                                                                                                                                                                            {
                                                                                                                                                                                              uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                              if ((sub_22C01E7D8() & 1) == 0 && (a1 != 0x352C343164615069 || a2 != 0xE800000000000000))
                                                                                                                                                                                              {
                                                                                                                                                                                                char v171 = sub_22C01E7D8();
                                                                                                                                                                                                BOOL v172 = a1 == 0x362C343164615069 && a2 == 0xE800000000000000;
                                                                                                                                                                                                BOOL v173 = v172;
                                                                                                                                                                                                uint64_t v4 = 0xD000000000000025;
                                                                                                                                                                                                if ((v171 & 1) == 0 && !v173)
                                                                                                                                                                                                {
                                                                                                                                                                                                  if (sub_22C01E7D8())
                                                                                                                                                                                                  {
                                                                                                                                                                                                    return 0xD000000000000025;
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    uint64_t v4 = 0xD000000000000017;
                                                                                                                                                                                                    if (a1 != 0x352C363164615069 || a2 != 0xE800000000000000)
                                                                                                                                                                                                    {
                                                                                                                                                                                                      char v174 = sub_22C01E7D8();
                                                                                                                                                                                                      BOOL v175 = a1 == 0x362C363164615069 && a2 == 0xE800000000000000;
                                                                                                                                                                                                      BOOL v176 = v175;
                                                                                                                                                                                                      if ((v174 & 1) == 0 && !v176)
                                                                                                                                                                                                      {
                                                                                                                                                                                                        if (sub_22C01E7D8())
                                                                                                                                                                                                        {
                                                                                                                                                                                                          return 0xD000000000000017;
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else if (a1 == 909652841 && a2 == 0xE400000000000000 || (sub_22C01E7D8() & 1) != 0 || a1 == 0x34365F363878 && a2 == 0xE600000000000000 || (sub_22C01E7D8() & 1) != 0 || a1 == 0x34366D7261 && a2 == 0xE500000000000000 || (sub_22C01E7D8() & 1) != 0)
                                                                                                                                                                                                        {
                                                                                                                                                                                                          id v177 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
                                                                                                                                                                                                          id v178 = objc_msgSend(v177, sel_environment);

                                                                                                                                                                                                          uint64_t v179 = sub_22C01E458();
                                                                                                                                                                                                          uint64_t v180 = sub_22C008404(0xD00000000000001ALL, 0x800000022C02BA30, v179);
                                                                                                                                                                                                          uint64_t v182 = v181;
                                                                                                                                                                                                          swift_bridgeObjectRelease();
                                                                                                                                                                                                          if (v182)
                                                                                                                                                                                                          {
                                                                                                                                                                                                            uint64_t v4 = sub_22BFFE738(v180, v182);
                                                                                                                                                                                                            swift_bridgeObjectRelease();
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            return 0x756D695320534F69;
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          return 0;
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
        }
      }
    }
  }
  return v4;
}

uint64_t sub_22C001A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22C001A88(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684976B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id Model.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id Model.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id Model.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Model()
{
  return self;
}

uint64_t sub_22C001C40()
{
  uint64_t v0 = sub_22C01E1A8();
  __swift_allocate_value_buffer(v0, qword_2684976B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2684976B8);
  return sub_22C01E198();
}

uint64_t static Log.loggerForCategory(_:)()
{
  swift_bridgeObjectRetain();
  return sub_22C01E198();
}

uint64_t static Log.general.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2684970C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22C01E1A8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2684976B8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t sub_22C001DDC()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DD78);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DD78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  id v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "darkModeEnbaled";
  *(void *)(v6 + 8) = 15;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  char v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "displayInversionEnabled";
  *(void *)(v10 + 8) = 23;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  BOOL v11 = (void *)(v5 + 2 * v2);
  char v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)char v12 = "fontSize";
  *((void *)v12 + 1) = 8;
  v12[16] = 2;
  v9();
  BOOL v13 = (void *)(v5 + 3 * v2);
  BOOL v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)BOOL v14 = "screenTimeout";
  *((void *)v14 + 1) = 13;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "defaultBrowserAppID";
  *(void *)(v15 + 8) = 19;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22C002060()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          sub_22C01DFA8();
          break;
        case 3:
          sub_22C01DFC8();
          break;
        case 4:
          sub_22C01DFD8();
          break;
        case 5:
          sub_22C01E018();
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C002180()
{
  if (*(unsigned char *)v0 != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
  {
    if (*(unsigned char *)(v0 + 1) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
    {
      if (!*(_DWORD *)(v0 + 4) || (uint64_t result = sub_22C01E0C8(), !v1))
      {
        if (!*(_DWORD *)(v0 + 8) || (uint64_t result = sub_22C01E0D8(), !v1))
        {
          unint64_t v3 = *(void *)(v0 + 24);
          uint64_t v4 = HIBYTE(v3) & 0xF;
          if ((v3 & 0x2000000000000000) == 0) {
            uint64_t v4 = *(void *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
          }
          if (!v4 || (uint64_t result = sub_22C01E108(), !v1))
          {
            type metadata accessor for Settings();
            return sub_22C01DF38();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_22C0022C8@<X0>(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = 0;
  *(void *)(a1 + 4) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  return sub_22C01DF48();
}

uint64_t sub_22C0022F8()
{
  return 0x73676E6974746553;
}

uint64_t sub_22C002310()
{
  return sub_22C002060();
}

uint64_t sub_22C002328()
{
  return sub_22C002180();
}

uint64_t sub_22C002340(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C0028CC(&qword_2684976F0, (void (*)(uint64_t))type metadata accessor for Settings);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C0023BC@<X0>(uint64_t a1@<X8>)
{
  if (qword_2684970C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22C01E178();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26849DD78);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_22C002464(uint64_t a1)
{
  uint64_t v2 = sub_22C0028CC(&qword_2684976D8, (void (*)(uint64_t))type metadata accessor for Settings);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C0024D0()
{
  sub_22C0028CC(&qword_2684976D8, (void (*)(uint64_t))type metadata accessor for Settings);
  return sub_22C01E088();
}

uint64_t sub_22C002550()
{
  return sub_22C0028CC(&qword_2684976D0, (void (*)(uint64_t))type metadata accessor for Settings);
}

uint64_t type metadata accessor for Settings()
{
  uint64_t result = qword_2684976F8;
  if (!qword_2684976F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C0025E4()
{
  return sub_22C0028CC(&qword_2684976D8, (void (*)(uint64_t))type metadata accessor for Settings);
}

uint64_t sub_22C00262C()
{
  return sub_22C0028CC(&qword_2684976E0, (void (*)(uint64_t))type metadata accessor for Settings);
}

uint64_t sub_22C002674()
{
  return sub_22C0028CC(&qword_2684976E8, (void (*)(uint64_t))type metadata accessor for Settings);
}

uint64_t sub_22C0026BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if (*a1 == *a2
    && a1[1] == a2[1]
    && *((float *)a1 + 1) == *((float *)a2 + 1)
    && *((_DWORD *)a1 + 2) == *((_DWORD *)a2 + 2))
  {
    if (*((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3)
      || (char v11 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      uint64_t v12 = type metadata accessor for Settings();
      BOOL v13 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v5 + 16);
      v13(v10, &a1[*(int *)(v12 + 36)], v4);
      v13(v8, &a2[*(int *)(v12 + 36)], v4);
      sub_22C0028CC(&qword_2684973D8, MEMORY[0x263F50560]);
      char v11 = sub_22C01E488();
      BOOL v14 = *(void (**)(char *, uint64_t))(v5 + 8);
      v14(v8, v4);
      v14(v10, v4);
    }
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

uint64_t sub_22C0028CC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_22C002914(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    *(uint64_t *)((char *)a1 + 4) = *(uint64_t *)((char *)a2 + 4);
    uint64_t v5 = a2[3];
    a1[2] = a2[2];
    a1[3] = v5;
    uint64_t v6 = *(int *)(a3 + 36);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_22C01DF58();
    unint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_22C002A0C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22C002A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 4) = *(void *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_22C01DF58();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t sub_22C002B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_22C002BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 4) = *(void *)(a2 + 4);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_22C002C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_22C002D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C002D34);
}

uint64_t sub_22C002D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C002DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C002DF8);
}

uint64_t sub_22C002DF8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22C002EA0()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Content(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_22C002F88(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (a5 < 0)
  {
    sub_22BFE67D0(a1, a2);
    return a3;
  }
  else
  {
    return (id)sub_22BFE67D0(a1, a2);
  }
}

void destroy for Content(uint64_t a1)
{
}

void sub_22C002FE8(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (a5 < 0)
  {
    sub_22BFE6770(a1, a2);
  }
  else
  {
    sub_22BFE6770(a1, a2);
  }
}

uint64_t initializeWithCopy for Content(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_22C002F88(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for Content(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_22C002F88(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void **)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_22C002FE8(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Content(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_22C002FE8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Content(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x1FF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 511);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 32) >> 7) | (2
                                              * ((*(void *)(a1 + 8) >> 60) & 3 | (4
                                                                                  * ((*(unsigned __int8 *)(a1 + 32) >> 1) & 0x3F))))) ^ 0x1FF;
  if (v3 >= 0x1FE) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for Content(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 511;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x1FF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1FF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2)
    {
      int v3 = (-a2 >> 1);
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(v3 & 3) << 60;
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = 0;
      *(unsigned char *)(result + 32) = ((v3 - (a2 << 8)) >> 1) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_22C003230(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32) >> 7;
}

uint64_t sub_22C00323C(uint64_t result)
{
  *(unsigned char *)(result + 32) &= ~0x80u;
  return result;
}

uint64_t sub_22C00324C(uint64_t result, char a2)
{
  char v2 = *(unsigned char *)(result + 32) & 1 | (a2 << 7);
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  *(unsigned char *)(result + 32) = v2;
  return result;
}

ValueMetadata *type metadata accessor for Content()
{
  return &type metadata for Content;
}

uint64_t Response.init(data:path:offset:length:total:completed:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = 0;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(unsigned char *)(a9 + 64) = a8;
  return result;
}

uint64_t Response.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_22BFFDFC4(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

void *Response.stream.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

uint64_t Response.path.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Response.offset.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t Response.length.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t Response.total.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t Response.completed.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t destroy for Response(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >> 60 != 15) {
    sub_22BFE6770(*(void *)a1, v2);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Response(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    sub_22BFE67D0(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  unint64_t v6 = (void *)a2[2];
  uint64_t v7 = a2[3];
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = a2[4];
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  *(void *)(a1 + 56) = a2[7];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  id v8 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Response(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v6 = *(void *)a2;
      sub_22BFE67D0(*(void *)a2, *(void *)(a2 + 8));
      uint64_t v7 = *(void *)a1;
      unint64_t v8 = *(void *)(a1 + 8);
      *(void *)a1 = v6;
      *(void *)(a1 + 8) = v4;
      sub_22BFE6770(v7, v8);
      goto LABEL_8;
    }
    sub_22C003520(a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)a2;
  sub_22BFE67D0(*(void *)a2, *(void *)(a2 + 8));
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
LABEL_8:
  char v9 = *(void **)(a1 + 16);
  uint64_t v10 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v10;
  id v11 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t sub_22C003520(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Response(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = *(void *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *(void *)a1;
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v5;
      sub_22BFE6770(v6, v4);
      goto LABEL_6;
    }
    sub_22C003520(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v8 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for Response(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Response(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Response()
{
  return &type metadata for Response;
}

uint64_t sub_22C0036E8()
{
  *(void *)(v0 + 24) = 0;
  uint64_t v1 = swift_unknownObjectWeakAssign();
  sub_22C0039A0(v1);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for POSTCertificateRouter()
{
  return self;
}

void sub_22C0037D4(void *a1)
{
  id v3 = objc_msgSend(a1, sel_body);
  uint64_t v4 = sub_22C01DF18();
  unint64_t v6 = v5;

  switch(v6 >> 62)
  {
    case 1uLL:
      sub_22BFE6770(v4, v6);
      LODWORD(v7) = HIDWORD(v4) - v4;
      if (__OFSUB__(HIDWORD(v4), v4))
      {
        __break(1u);
LABEL_16:
        __break(1u);
        JUMPOUT(0x22C003990);
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (v7)
      {
        id v10 = objc_msgSend(a1, sel_body);
        uint64_t v11 = sub_22C01DF18();
        unint64_t v13 = v12;

        id v14 = objc_allocWithZone((Class)MKCertificate);
        uint64_t v15 = (void *)sub_22C01DF08();
        id v16 = objc_msgSend(v14, sel_initWithPEM_, v15);
        sub_22BFE6770(v11, v13);

        uint64_t v17 = MEMORY[0x230F5C8E0](v1 + 16);
        if (v17)
        {
          swift_unknownObjectRelease();
        }
      }
      return;
    case 2uLL:
      uint64_t v9 = *(void *)(v4 + 16);
      uint64_t v8 = *(void *)(v4 + 24);
      sub_22BFE6770(v4, v6);
      uint64_t v7 = v8 - v9;
      if (!__OFSUB__(v8, v9)) {
        goto LABEL_6;
      }
      goto LABEL_16;
    case 3uLL:
      sub_22BFE6770(v4, v6);
      return;
    default:
      sub_22BFE6770(v4, v6);
      uint64_t v7 = BYTE6(v6);
      goto LABEL_6;
  }
}

uint64_t sub_22C0039A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_22C0039C8(uint64_t a1)
{
  return sub_22C0039E8(a1, 13, &byte_268497708);
}

uint64_t sub_22C0039D8(uint64_t a1)
{
  return sub_22C0039E8(a1, 10, &byte_268497709);
}

uint64_t sub_22C0039E8(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = sub_22C008D5C(a2, 0xE100000000000000);
  if (*(void *)(result + 16))
  {
    char v5 = *(unsigned char *)(result + 32);
    uint64_t result = swift_release();
    *a3 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_22C003A2C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (!v1)
  {
    uint64_t v11 = 0;
    swift_beginAccess();
    swift_retain();
    sub_22C003FB0((void *)(v0 + 16), &v11);
    swift_endAccess();
    uint64_t v1 = v11;
    if (!v11) {
      return 1;
    }
  }
  *(void *)(v0 + 32) = v1;
  swift_retain();
  swift_retain();
  swift_release();
  if (objc_msgSend(*(id *)(v1 + 16), sel_contentLength))
  {
    unint64_t v2 = *(void *)(v1 + 32);
    if (v2 >> 60 == 15)
    {
      swift_release();
      return 1;
    }
    else
    {
      uint64_t v4 = *(void *)(v1 + 24);
      uint64_t v5 = 0;
      switch(v2 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v4), v4))
          {
            __break(1u);
LABEL_22:
            __break(1u);
            JUMPOUT(0x22C003BC4);
          }
          uint64_t v5 = HIDWORD(v4) - (int)v4;
LABEL_13:
          sub_22BFE67D0(*(void *)(v1 + 24), *(void *)(v1 + 32));
LABEL_14:
          id v8 = *(id *)(v1 + 16);
          id v9 = objc_msgSend(v8, sel_contentLength);
          sub_22BFF9D68(v4, v2);

          swift_release();
          BOOL result = v5 < 0 || v5 < (unint64_t)v9;
          break;
        case 2uLL:
          uint64_t v7 = *(void *)(v4 + 16);
          uint64_t v6 = *(void *)(v4 + 24);
          uint64_t v5 = v6 - v7;
          if (!__OFSUB__(v6, v7)) {
            goto LABEL_13;
          }
          goto LABEL_22;
        case 3uLL:
          goto LABEL_14;
        default:
          uint64_t v5 = BYTE6(v2);
          goto LABEL_14;
      }
    }
  }
  else
  {
    swift_release();
    return 0;
  }
  return result;
}

uint64_t sub_22C003BD4()
{
  sub_22BFE6770(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HTTPParser()
{
  return self;
}

void *sub_22C003C38(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268497710);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22C0044C0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22C003D48(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497718);
  uint64_t v10 = *(void *)(sub_22C01E208() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_22C01E738();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_22C01E208() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_22C004BD8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_22C003FB0(void *a1, uint64_t *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      *(void *)&long long v24 = *a1;
      *((void *)&v24 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain();
      sub_22C004260((int *)&v24, a2);
      uint64_t result = swift_release();
      uint64_t v12 = *((void *)&v24 + 1) | 0x4000000000000000;
      *a1 = v24;
      a1[1] = v12;
      return result;
    case 2uLL:
      *(void *)&long long v24 = *a1;
      *((void *)&v24 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain();
      sub_22C01DE88();
      long long v13 = v24;
      uint64_t v14 = *(void *)(v24 + 16);
      uint64_t v15 = *(void *)(v24 + 24);
      uint64_t v16 = sub_22C01DE08();
      if (!v16)
      {
        swift_release();
        __break(1u);
        JUMPOUT(0x22C004250);
      }
      uint64_t v17 = v16;
      uint64_t v18 = sub_22C01DE28();
      uint64_t v19 = v14 - v18;
      if (__OFSUB__(v14, v18))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v20 = __OFSUB__(v15, v14);
      uint64_t v21 = v15 - v14;
      if (v20) {
        goto LABEL_14;
      }
      uint64_t v22 = sub_22C01DE18();
      if (v22 >= v21) {
        uint64_t v23 = v21;
      }
      else {
        uint64_t v23 = v22;
      }
      *a2 = sub_22C0045B4(v17 + v19, (unsigned __int8 *)(v17 + v19 + v23));
      swift_release_n();
      uint64_t result = swift_release();
      *a1 = v13;
      a1[1] = *((void *)&v13 + 1) | 0x8000000000000000;
      return result;
    case 3uLL:
      *(void *)((char *)&v24 + 7) = 0;
      *(void *)&long long v24 = 0;
      swift_retain();
      *a2 = sub_22C0045B4((uint64_t)&v24, (unsigned __int8 *)&v24);
      swift_release_n();
      return swift_release();
    default:
      *(void *)&long long v24 = *a1;
      WORD4(v24) = v2;
      BYTE10(v24) = BYTE2(v2);
      BYTE11(v24) = BYTE3(v2);
      BYTE12(v24) = BYTE4(v2);
      BYTE13(v24) = BYTE5(v2);
      BYTE14(v24) = BYTE6(v2);
      char v5 = (unsigned __int8 *)&v24 + BYTE6(v2);
      swift_retain();
      *a2 = sub_22C0045B4((uint64_t)&v24, v5);
      swift_release();
      uint64_t v6 = v24;
      uint64_t v7 = DWORD2(v24);
      uint64_t v8 = BYTE12(v24);
      uint64_t v9 = BYTE13(v24);
      uint64_t v10 = BYTE14(v24);
      uint64_t result = swift_release_n();
      *a1 = v6;
      a1[1] = v7 | (v8 << 32) | (v9 << 40) | (v10 << 48);
      return result;
  }
}

uint64_t sub_22C004260(int *a1, uint64_t *a2)
{
  uint64_t result = sub_22C01DEB8();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_22C01DE08();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = sub_22C01DE28();
  uint64_t v8 = v5 - result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v9 = v6 - v5;
  uint64_t v10 = sub_22C01DE18();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  *a2 = sub_22C0045B4(v7 + v8, (unsigned __int8 *)(v7 + v8 + v11));
  swift_release();
  return swift_release();
}

uint64_t sub_22C004314(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_22C0043D8(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF) {
      return a2 << 32;
    }
    sub_22C01DEC8();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = (unsigned char *)sub_22C01DE08();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = sub_22C01DE18();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      uint64_t v7 = &v4[v6];
      if (v4) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v3 = sub_22C004314(v4, v8);
      swift_release();
      return v3;
    }
    uint64_t result = sub_22C01DE28();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22C0044C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_22C01E798();
  __break(1u);
  return result;
}

uint64_t sub_22C0045B4(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4 = sub_22C01E4D8();
  MEMORY[0x270FA5388](v4 - 8);
  char v54 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_22C01DEA8();
  uint64_t v6 = MEMORY[0x270FA5388](v58);
  BOOL v50 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v6);
  BOOL v53 = (char *)&v50 - v10;
  if (!a1) {
    goto LABEL_42;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v14 = 0;
  unsigned int v56 = *MEMORY[0x263F06F00];
  BOOL v55 = (void (**)(char *, void, uint64_t))(v9 + 104);
  char v57 = (void (**)(char *, uint64_t))(v9 + 8);
  BOOL v59 = (void *)MEMORY[0x263F8EE78];
  unint64_t v15 = 0xC000000000000000;
  uint64_t v16 = &qword_268497000;
  uint64_t v17 = &qword_268497000;
  uint64_t v18 = &qword_268497000;
  uint64_t v19 = &qword_268497000;
  uint64_t v51 = a1;
  BOOL v52 = a2;
  while (1)
  {
    uint64_t v23 = (unsigned __int8 *)(a1 + v11);
    if (a2 && v23 == a2)
    {
      sub_22BFE6770(v12, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    int v24 = *v23;
    if (v16[27] != -1)
    {
      uint64_t result = swift_once();
      uint64_t v19 = &qword_268497000;
      uint64_t v18 = &qword_268497000;
      uint64_t v17 = &qword_268497000;
      uint64_t v16 = &qword_268497000;
    }
    if (v24 == *((unsigned __int8 *)v17 + 1801))
    {
      if (v18[26] != -1)
      {
        uint64_t result = swift_once();
        uint64_t v19 = &qword_268497000;
        uint64_t v18 = &qword_268497000;
        uint64_t v17 = &qword_268497000;
        uint64_t v16 = &qword_268497000;
      }
      if (v14 == *((unsigned __int8 *)v19 + 1800)) {
        break;
      }
    }
    uint64_t v20 = v12;
    unint64_t v21 = v15;
LABEL_4:
    uint64_t v12 = v20;
    unint64_t v15 = v21;
    int v14 = v24;
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v20 = v11 - 1 - v13;
  if (v11 - 1 != v13)
  {
    if (__OFSUB__(v11 - 1, v13)) {
      goto LABEL_37;
    }
    uint64_t v25 = v53;
    (*v55)(v53, v56, v58);
    sub_22C01DE98();
    if (v20)
    {
      sub_22C01DE38();
      swift_allocObject();
      swift_retain();
      uint64_t v26 = sub_22C01DDF8();
      uint64_t v20 = sub_22C0043D8(v26, v20);
      unint64_t v21 = v27;
      swift_release();
    }
    else
    {
      BOOL v28 = (void (*)(uint64_t, void))sub_22C01DE98();
      v28(a1 + v13, 0);
      swift_release();
      swift_release();
      unint64_t v21 = 0xC000000000000000;
    }
    (*v57)(v25, v58);
    sub_22BFE6770(v12, v15);
    sub_22BFE67D0(v20, v21);
    sub_22C01E4C8();
    uint64_t v29 = sub_22C01E4B8();
    uint64_t v31 = v30;
    uint64_t result = sub_22BFE6770(v20, v21);
    a2 = v52;
    if (!v31) {
      goto LABEL_41;
    }
    swift_bridgeObjectRetain();
    BOOL v32 = v59;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_22C003C38(0, v32[2] + 1, 1, v32);
      BOOL v32 = (void *)result;
    }
    unint64_t v34 = v32[2];
    unint64_t v33 = v32[3];
    uint64_t v16 = &qword_268497000;
    uint64_t v17 = &qword_268497000;
    uint64_t v18 = &qword_268497000;
    uint64_t v19 = &qword_268497000;
    if (v34 >= v33 >> 1)
    {
      uint64_t result = (uint64_t)sub_22C003C38((void *)(v33 > 1), v34 + 1, 1, v32);
      uint64_t v19 = &qword_268497000;
      uint64_t v18 = &qword_268497000;
      uint64_t v17 = &qword_268497000;
      uint64_t v16 = &qword_268497000;
      BOOL v32 = (void *)result;
    }
    v32[2] = v34 + 1;
    BOOL v35 = &v32[2 * v34];
    v35[4] = v29;
    v35[5] = v31;
    uint64_t v13 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_38;
    }
    BOOL v59 = v32;
    a1 = v51;
    goto LABEL_4;
  }
  uint64_t v37 = v13 + 2;
  if (__OFADD__(v13, 2))
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  BOOL v38 = &a2[-a1];
  if (v37 >= (uint64_t)&a2[-a1])
  {
    uint64_t v43 = 0;
    unint64_t v45 = 0xF000000000000000;
    goto LABEL_35;
  }
  uint64_t v39 = (uint64_t)&v38[-v37];
  if (!__OFSUB__(v38, v37))
  {
    uint64_t v40 = a1 + v37;
    BOOL v41 = v50;
    (*v55)(v50, v56, v58);
    sub_22C01DE98();
    if (v39)
    {
      sub_22C01DE38();
      swift_allocObject();
      swift_retain();
      uint64_t v42 = sub_22C01DDF8();
      uint64_t v43 = sub_22C0043D8(v42, v39);
      unint64_t v45 = v44;
      swift_release();
    }
    else
    {
      BOOL v46 = (void (*)(uint64_t, void))sub_22C01DE98();
      v46(v40, 0);
      swift_release();
      swift_release();
      uint64_t v43 = 0;
      unint64_t v45 = 0xC000000000000000;
    }
    (*v57)(v41, v58);
LABEL_35:
    id v47 = objc_allocWithZone((Class)type metadata accessor for HTTPHeaders());
    char v48 = (void *)sub_22C01E598();
    swift_bridgeObjectRelease();
    id v49 = objc_msgSend(v47, sel_initWithArray_, v48);

    type metadata accessor for HTTPResponse();
    char v36 = (void *)swift_allocObject();
    v36[2] = v49;
    v36[3] = v43;
    v36[4] = v45;
    sub_22BFF9D68(0, 0xF000000000000000);
    sub_22BFE6770(v12, v15);
    return (uint64_t)v36;
  }
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_22C004BD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_22C01E208() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_22C01E798();
  __break(1u);
  return result;
}

uint64_t QUICConnection.__allocating_init(host:port:local:remote:)(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  unint64_t v33 = a5;
  uint64_t v31 = a4;
  int v34 = a3;
  uint64_t v32 = sub_22C01E208();
  uint64_t v29 = *(void *)(v32 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v32);
  uint64_t v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v27 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497148);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22C01E1F8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22C01E1C8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C01E1D8();
  sub_22C01E1E8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    unint64_t v21 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268497150) + 48)];
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    uint64_t v28 = v16;
    v22(v8, v19, v16);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v21, v15, v12);
    uint64_t v23 = v29;
    uint64_t v24 = v32;
    (*(void (**)(char *, void, uint64_t))(v29 + 104))(v8, *MEMORY[0x263F14118], v32);
    uint64_t v25 = (uint64_t)v30;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v30, v8, v24);
    type metadata accessor for QUICConnection();
    uint64_t v26 = swift_allocObject();
    QUICConnection.init(endpoint:local:remote:)(v25, v31, v33);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v28);
    return v26;
  }
  return result;
}

uint64_t QUICConnection.__allocating_init(endpoint:local:remote:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  QUICConnection.init(endpoint:local:remote:)(a1, a2, a3);
  return v6;
}

uint64_t type metadata accessor for QUICConnection()
{
  return self;
}

void QUICConnection.init(endpoint:local:remote:)(uint64_t a1, void *a2, void *a3)
{
  id v39 = a3;
  uint64_t v37 = a1;
  uint64_t v4 = sub_22C01E208();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v33 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22C01E638();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22C01E648();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_22C01E438();
  MEMORY[0x270FA5388](v11 - 8);
  sub_22BFE6518();
  sub_22C01E428();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22BFE6558();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497168);
  sub_22BFE65B0();
  sub_22C01E6B8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F138], v6);
  uint64_t v12 = sub_22C01E658();
  sub_22C01E388();
  swift_allocObject();
  sub_22C01E378();
  id v34 = a2;
  uint64_t v13 = (__SecIdentity *)objc_msgSend(a2, sel_identity);
  uint64_t v14 = sec_identity_create(v13);

  if (v14)
  {
    unint64_t v15 = sub_22C01E368();
    sec_protocol_options_set_local_identity(v15, v14);
    swift_unknownObjectRelease();
    id v16 = objc_msgSend(v39, sel_digest);
    uint64_t v17 = sub_22C01DF18();
    unint64_t v19 = v18;

    uint64_t v20 = swift_allocObject();
    unint64_t v31 = v19;
    uint64_t v32 = v17;
    *(void *)(v20 + 16) = v17;
    *(void *)(v20 + 24) = v19;
    sub_22BFE67D0(v17, v19);
    unint64_t v21 = sub_22C01E368();
    aBlock[4] = sub_22BFE67C8;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22BFE6828;
    aBlock[3] = &block_descriptor_0;
    uint64_t v22 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sec_protocol_options_set_verify_block(v21, v22, v12);
    _Block_release(v22);
    swift_unknownObjectRelease();
    uint64_t v23 = sub_22C01E368();
    sec_protocol_options_add_tls_application_protocol(v23, "http/1.1");
    swift_unknownObjectRelease();
    sub_22C01E308();
    uint64_t v24 = swift_retain();
    MEMORY[0x230F5B080](v24);
    uint64_t v25 = v35;
    uint64_t v26 = v36;
    uint64_t v27 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v33, v37, v36);
    sub_22C01E2C8();
    swift_allocObject();
    uint64_t v28 = sub_22C01E248();
    swift_release();
    swift_release();

    swift_unknownObjectRelease();
    sub_22BFE6770(v32, v31);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
    uint64_t v29 = v38;
    *(void *)(v38 + 16) = v28;
    *(void *)(v29 + 24) = v12;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22C00562C()
{
  sub_22BFE6770(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t QUICConnection.deinit()
{
  swift_release();

  return v0;
}

uint64_t QUICConnection.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t method lookup function for QUICConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QUICConnection);
}

uint64_t dispatch thunk of QUICConnection.__allocating_init(endpoint:local:remote:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_22C005710@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_22BFE67D0(a2, a3);
      uint64_t v10 = (char *)sub_22C01DE08();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_22C01DE28();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_22C01DE18();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x22C005974);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_22BFE6770(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_22C01DE08();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_22C01DE28();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_22C01DE18();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_22C005984(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_22BFE67D0(a1, a2);
      char v5 = sub_22C005BB4((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_22BFE6770(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_22C005BB4(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_22BFE6770(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_22C005710((uint64_t)__s1, a3, a4, &v14);
      sub_22BFE6770(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_22C005BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_22C01DE08();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_22C01DE28();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_22C01DE18();
  sub_22C005710(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_22C005C6C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x22C005DA8);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_22BFE67D0(a3, a4);
              char v15 = sub_22C005984(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

id static XPCInterface.interface()()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26DF910F8);
  id v2 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_26DF91098);
  objc_msgSend(v1, sel_setInterface_forSelector_argumentIndex_ofReply_, v2, sel_runWithClient_, 0, 0);

  return v1;
}

uint64_t XPCInterface.deinit()
{
  return v0;
}

uint64_t XPCInterface.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCInterface()
{
  return self;
}

uint64_t method lookup function for XPCInterface(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCInterface);
}

id MigrationImportViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return MigrationImportViewController.init()();
}

id MigrationImportViewController.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497720);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Client();
  uint64_t v6 = swift_allocObject();
  type metadata accessor for Browser();
  swift_allocObject();
  uint64_t v7 = v0;
  *(void *)(v6 + 16) = sub_22C0074DC(0x6C7070612E6D6F63, 0xED0000736F692E65);
  type metadata accessor for ClientPool();
  uint64_t v8 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v8 + 112) = MEMORY[0x263F8EE78];
  *(void *)(v6 + 24) = v8;
  *(void *)&v7[OBJC_IVAR____TtC12MigrationKit29MigrationImportViewController_client] = v6;
  v19[3] = v5;
  v19[4] = &off_26DF69E88;
  v19[0] = v6;
  uint64_t v9 = sub_22C01E618();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  sub_22C006494((uint64_t)v19, (uint64_t)v18);
  BOOL v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v10;
  sub_22C006590(v18, (uint64_t)(v11 + 5));
  swift_retain_n();
  sub_22C006760((uint64_t)v4, (uint64_t)&unk_268497730, (uint64_t)v11);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);

  swift_release_n();
  uint64_t v12 = (void *)sub_22C01E498();
  uint64_t v13 = (void *)sub_22C01E498();
  uint64_t v14 = (void *)sub_22C01E498();
  v17.receiver = v7;
  v17.super_class = ObjectType;
  id v15 = objc_msgSendSuper2(&v17, sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, 2);

  return v15;
}

id MigrationImportViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v12 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void MigrationImportViewController.init(title:detailText:symbolName:contentLayout:)()
{
}

uint64_t sub_22C006404()
{
  return swift_release();
}

id MigrationImportViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22C00645C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C006494(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22C0064F8()
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_22C006590(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_22C0065A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22C00666C;
  return sub_22C00793C(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

uint64_t sub_22C00666C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22C006760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22C01E618();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22C01E608();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22C00695C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22C01E5B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497748);
  return swift_task_create();
}

uint64_t type metadata accessor for MigrationImportViewController()
{
  return self;
}

uint64_t method lookup function for MigrationImportViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MigrationImportViewController);
}

uint64_t dispatch thunk of MigrationImportViewController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_22C00695C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C0069BC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_22C006A9C;
  return v5(v2 + 32);
}

uint64_t sub_22C006A9C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_22C006BB0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22C006BE8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22C00666C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268497738 + dword_268497738);
  return v6(a1, v4);
}

uint64_t sub_22C006CA0()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for ClientPool()
{
  return self;
}

uint64_t sub_22C006CFC()
{
  return v0;
}

uint64_t sub_22C006D08()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CalendarsConversion()
{
  return self;
}

void *Server.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = objc_msgSend(objc_allocWithZone((Class)MKCertificate), sel_init);
  return v0;
}

void *Server.init()()
{
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = objc_msgSend(objc_allocWithZone((Class)MKCertificate), sel_init);
  return v0;
}

id *Server.deinit()
{
  objc_msgSend(v0[3], sel_cancel);
  objc_msgSend(v0[4], sel_cancel);

  return v0;
}

uint64_t Server.__deallocating_deinit()
{
  objc_msgSend(v0[3], sel_cancel);
  objc_msgSend(v0[4], sel_cancel);

  return swift_deallocClassInstance();
}

id sub_22C006E8C()
{
  objc_msgSend(*(id *)(v0 + 24), sel_cancel);
  uint64_t v1 = *(void **)(v0 + 32);
  return objc_msgSend(v1, sel_cancel);
}

void sub_22C006ED0()
{
  uint64_t v1 = v0;
  objc_msgSend(*(id *)(v0 + 24), sel_cancel);
  objc_msgSend(*(id *)(v0 + 32), sel_cancel);
  uint64_t v2 = *(void **)(v0 + 16);
  type metadata accessor for GETCertificateRouter();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  type metadata accessor for POSTCertificateRouter();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v4 + 24) = &off_26DF69B88;
  swift_unknownObjectWeakAssign();
  type metadata accessor for GETRouter();
  swift_allocObject();
  id v5 = v2;
  uint64_t v6 = sub_22C00845C();
  id v7 = objc_msgSend(objc_allocWithZone((Class)MKHTTPServer), sel_init);
  objc_msgSend(v7, sel_setDelegate_, v1);
  uint64_t v8 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = v7;
  id v13 = v7;

  swift_retain();
  uint64_t v9 = (void *)sub_22C01E498();
  objc_msgSend(v13, sel_addRouter_method_path_, v3, 1, v9);
  swift_release();

  swift_retain();
  uint64_t v10 = (void *)sub_22C01E498();
  objc_msgSend(v13, sel_addRouter_method_path_, v4, 3, v10);
  swift_release();

  swift_retain();
  BOOL v11 = (void *)sub_22C01E498();
  objc_msgSend(v13, sel_addRouter_method_path_, v6, 1, v11);
  swift_release();

  uint64_t v12 = (void *)sub_22C01E498();
  objc_msgSend(v13, sel_setService_, v12);

  [v13 run];
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_22C007140()
{
  return sub_22C007154();
}

uint64_t sub_22C007154()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497750);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22C024340;
  sub_22C01E7B8();
  sub_22C01E508();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 32) = 0x3D74726F70;
  *(void *)(v0 + 40) = 0xE500000000000000;
  sub_22C01E858();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for Server()
{
  return self;
}

uint64_t method lookup function for Server(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Server);
}

uint64_t dispatch thunk of Server.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of Server.run()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of Server.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Server.server(_:didOpen:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of Server.serverDidCancel(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of Server.didReceive(cert:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

ValueMetadata *type metadata accessor for ContactMigrator()
{
  return &type metadata for ContactMigrator;
}

unint64_t sub_22C00733C()
{
  return 0xD00000000000001CLL;
}

void sub_22C007358()
{
}

ValueMetadata *type metadata accessor for CallHistoryMigrator()
{
  return &type metadata for CallHistoryMigrator;
}

unint64_t sub_22C0073CC()
{
  return 0xD000000000000019;
}

void sub_22C0073E8()
{
}

ValueMetadata *type metadata accessor for BookmarkMigrator()
{
  return &type metadata for BookmarkMigrator;
}

unint64_t sub_22C00745C()
{
  return 0xD00000000000001DLL;
}

void sub_22C007478()
{
}

uint64_t sub_22C0074DC(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = sub_22C01E3A8();
  uint64_t v23 = *(void *)(v25 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v25);
  __int16 v26 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  id v5 = (uint64_t *)((char *)&v20 - v4);
  uint64_t v6 = sub_22C01E638();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22C01E648();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_22C01E438();
  MEMORY[0x270FA5388](v11 - 8);
  sub_22BFE6518();
  sub_22C01E428();
  uint64_t v27 = MEMORY[0x263F8EE78];
  sub_22BFE6558();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497168);
  sub_22BFE65B0();
  sub_22C01E6B8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F138], v6);
  uint64_t v12 = sub_22C01E658();
  uint64_t v13 = v21;
  *(void *)(v21 + 16) = v12;
  type metadata accessor for Resolver();
  uint64_t v14 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v14 + 168) = 0;
  *(_OWORD *)(v14 + 152) = 0u;
  *(_OWORD *)(v14 + 136) = 0u;
  uint64_t v16 = v23;
  uint64_t v15 = v24;
  *(void *)(v14 + 112) = v22;
  *(void *)(v14 + 120) = v15;
  *(void *)(v14 + 128) = MEMORY[0x263F8EE88];
  *(void *)(v13 + 32) = v14;
  void *v5 = 0x745F2E707474685FLL;
  v5[1] = 0xEB000000002E7063;
  v5[2] = 0;
  v5[3] = 0;
  uint64_t v17 = v25;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v5, *MEMORY[0x263F14378], v25);
  sub_22C01E308();
  swift_allocObject();
  sub_22C01E2F8();
  (*(void (**)(char *, void *, uint64_t))(v16 + 16))(v26, v5, v17);
  sub_22C01E418();
  swift_allocObject();
  uint64_t v18 = sub_22C01E3C8();
  (*(void (**)(void *, uint64_t))(v16 + 8))(v5, v17);
  uint64_t result = v13;
  *(void *)(v13 + 24) = v18;
  return result;
}

uint64_t sub_22C0078A8()
{
  sub_22C01E3B8();
  sub_22C01E408();
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Browser()
{
  return self;
}

uint64_t sub_22C00793C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return MEMORY[0x270FA2498](sub_22C007960, 0, 0);
}

uint64_t sub_22C007960()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  if (Strong)
  {
    uint64_t v2 = Strong;
    uint64_t v3 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 56), *(void *)(*(void *)(v0 + 56) + 24));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_22C007A70;
    return sub_22C007F68(v3, v2);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_22C007A70()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_22C007B88, 0, 0);
}

uint64_t sub_22C007B88()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 64) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_22C007BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497720);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22C01E618();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a3;
  v10[5] = a1;
  v10[6] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22C006760((uint64_t)v8, (uint64_t)&unk_268497778, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_22C007D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  return MEMORY[0x270FA2498](sub_22C007D3C, 0, 0);
}

uint64_t sub_22C007D3C()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  if (Strong)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_2684979D8 + dword_2684979D8);
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_22C007E50;
    uint64_t v3 = *(void *)(v0 + 56);
    return v6(v3);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    id v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_22C007E50()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_22C008400, 0, 0);
}

uint64_t sub_22C007F68(uint64_t a1, uint64_t a2)
{
  v2[25] = a2;
  uint64_t v4 = type metadata accessor for Client();
  v2[26] = v4;
  v2[5] = v4;
  v2[6] = &off_26DF69E88;
  v2[2] = a1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_22C007FF8, 0, 0);
}

uint64_t sub_22C007FF8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 200) + 32);
  *(void *)(v0 + 216) = v1;
  return MEMORY[0x270FA2498](sub_22C00801C, v1, 0);
}

uint64_t sub_22C00801C()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = *__swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v0[10] = v1;
  v0[11] = &off_26DF69E88;
  v0[7] = v3;
  sub_22C006494((uint64_t)(v0 + 7), (uint64_t)(v0 + 12));
  sub_22C0081EC((uint64_t)(v0 + 12), (uint64_t)(v0 + 17));
  swift_beginAccess();
  swift_retain();
  sub_22C008254((uint64_t)(v0 + 17), v2 + 136);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  return MEMORY[0x270FA2498](sub_22C008114, 0, 0);
}

uint64_t sub_22C008114()
{
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  sub_22C01E3B8();
  swift_release();
  sub_22C01E3D8();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22C0081EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C008254(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C0082BC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C0082F4(uint64_t a1, uint64_t a2)
{
  return sub_22C007BF4(a1, a2, v2);
}

uint64_t sub_22C0082FC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22C00834C(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_22C00666C;
  *(_OWORD *)(v4 + 48) = v5;
  *(void *)(v4 + 40) = a1;
  return MEMORY[0x270FA2498](sub_22C007D3C, 0, 0);
}

uint64_t sub_22C008404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_22C0188FC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_22C00845C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684977A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22C0266A0;
  *(void *)(inited + 32) = 0x736567617373656DLL;
  *(void *)(inited + 40) = 0xE800000000000000;
  *(void *)(inited + 72) = &type metadata for MessageMigrator;
  *(void *)(inited + 80) = &off_26DF69798;
  *(void *)(inited + 88) = 0x736C6C6163;
  *(void *)(inited + 96) = 0xE500000000000000;
  *(void *)(inited + 128) = &type metadata for CallHistoryMigrator;
  *(void *)(inited + 136) = &off_26DF69BF8;
  *(void *)(inited + 144) = 0x656D2D6563696F76;
  *(void *)(inited + 152) = 0xEB00000000736F6DLL;
  *(void *)(inited + 184) = &type metadata for VoiceMemoMigrator;
  *(void *)(inited + 192) = &off_26DF69FD0;
  *(void *)(inited + 200) = 0x73746E756F636361;
  *(void *)(inited + 208) = 0xE800000000000000;
  *(void *)(inited + 240) = &type metadata for AccountMigrator;
  *(void *)(inited + 248) = &off_26DF69DE8;
  *(void *)(inited + 256) = 0x6B72616D6B6F6F62;
  *(void *)(inited + 264) = 0xE900000000000073;
  *(void *)(inited + 296) = &type metadata for BookmarkMigrator;
  *(void *)(inited + 304) = &off_26DF69C38;
  *(void *)(inited + 312) = 1936748641;
  *(void *)(inited + 320) = 0xE400000000000000;
  *(void *)(inited + 352) = &type metadata for AppMigrator;
  *(void *)(inited + 360) = &off_26DF698B0;
  *(void *)(inited + 368) = 0x73676E6974746573;
  *(void *)(inited + 376) = 0xE800000000000000;
  *(void *)(inited + 408) = &type metadata for SettingMigrator;
  *(void *)(inited + 416) = &off_26DF69E68;
  *(void *)(inited + 424) = 0x73746361746E6F63;
  *(void *)(inited + 432) = 0xE800000000000000;
  *(void *)(inited + 464) = &type metadata for ContactMigrator;
  *(void *)(inited + 472) = &off_26DF69BB8;
  *(void *)(inited + 480) = 0x7261646E656C6163;
  *(void *)(inited + 488) = 0xE900000000000073;
  *(void *)(inited + 520) = &type metadata for CalendarMigrator;
  *(void *)(inited + 528) = &off_26DF6A0B0;
  *(void *)(inited + 536) = 0x736F746F6870;
  *(void *)(inited + 544) = 0xE600000000000000;
  *(void *)(inited + 576) = &type metadata for PhotoLibraryMigrator;
  *(void *)(inited + 584) = &off_26DF69E28;
  *(void *)(inited + 592) = 0x736F65646976;
  *(void *)(inited + 600) = 0xE600000000000000;
  *(void *)(inited + 632) = &type metadata for PhotoLibraryMigrator;
  *(void *)(inited + 640) = &off_26DF69E28;
  *(void *)(inited + 648) = 0x73656C6966;
  *(void *)(inited + 656) = 0xE500000000000000;
  *(void *)(inited + 688) = type metadata accessor for FileMigrator();
  *(void *)(inited + 696) = &off_26DF697B8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 664));
  sub_22BFF8FD4((uint64_t)boxed_opaque_existential_1);
  *(void *)(inited + 704) = 1936550259;
  *(void *)(inited + 712) = 0xE400000000000000;
  *(void *)(inited + 744) = &type metadata for SIMMigrator;
  *(void *)(inited + 752) = &off_26DF69260;
  *(void *)(v0 + 16) = sub_22C017380(inited);
  return v0;
}

unint64_t sub_22C0086F0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t v8 = sub_22C018EBC();
    char v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v7 = (unsigned __int8 *)sub_22C01E718();
    }
    unint64_t v8 = (unint64_t)sub_22C018E10(v7, v5, 10);
    char v10 = v9 & 1;
    goto LABEL_39;
  }
  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4) {
      goto LABEL_52;
    }
    if (v4 == 1 || (BYTE1(a1) - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (BYTE1(a1) - 48);
    uint64_t v15 = v4 - 2;
    if (v15)
    {
      uint64_t v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        unsigned int v17 = *v16 - 48;
        if (v17 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v17);
        unint64_t v8 = 10 * v8 + v17;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v16;
        if (!--v15) {
          goto LABEL_39;
        }
      }
    }
LABEL_38:
    char v10 = 0;
    goto LABEL_39;
  }
  if (a1 != 45)
  {
    if (!v4 || (a1 - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (a1 - 48);
    uint64_t v18 = v4 - 1;
    if (v18)
    {
      uint64_t v20 = (unsigned __int8 *)v23 + 1;
      while (1)
      {
        unsigned int v21 = *v20 - 48;
        if (v21 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v21);
        unint64_t v8 = 10 * v8 + v21;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v20;
        if (!--v18) {
          goto LABEL_39;
        }
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(a1) - 48) <= 9u)
    {
      unint64_t v2 = 0;
      unint64_t v8 = -(uint64_t)(BYTE1(a1) - 48);
      if (BYTE1(a1) == 48)
      {
        uint64_t v11 = v4 - 2;
        if (v11)
        {
          uint64_t v12 = (unsigned __int8 *)v23 + 2;
          while (1)
          {
            unsigned int v13 = *v12 - 48;
            if (v13 > 9) {
              goto LABEL_36;
            }
            if (!is_mul_ok(v8, 0xAuLL)) {
              goto LABEL_36;
            }
            BOOL v14 = 10 * v8 >= v13;
            unint64_t v8 = 10 * v8 - v13;
            if (!v14) {
              goto LABEL_36;
            }
            char v10 = 0;
            ++v12;
            if (!--v11) {
              goto LABEL_39;
            }
          }
        }
        goto LABEL_38;
      }
      goto LABEL_53;
    }
LABEL_36:
    unint64_t v8 = 0;
    char v10 = 1;
    goto LABEL_39;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  char v10 = 1;
  unint64_t v8 = v2;
LABEL_39:
  swift_bridgeObjectRelease();
  if (v10) {
    return 0;
  }
  else {
    return v8;
  }
}

uint64_t sub_22C0089D8()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GETRouter()
{
  return self;
}

uint64_t sub_22C008A34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22C008B08(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22C001A2C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_22C001A2C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22C008B08(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_22C01E688();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22C008CC4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_22C01E718();
  if (!v8)
  {
    sub_22C01E738();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22C01E798();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_22C008CC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22C008D5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22C008ED4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22C008ED4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22C008D5C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_22C018818(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22C01E6F8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22C01E738();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22C01E518();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22C01E798();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22C01E738();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_22C008ED4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268497798);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unsigned int v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_22C01E798();
  __break(1u);
  return result;
}

uint64_t sub_22C009024(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(a1, sel_headers);
  id v7 = objc_msgSend(v6, sel_path);

  uint64_t v8 = sub_22C01E4A8();
  uint64_t v10 = v9;

  v112[0] = v8;
  v112[1] = v10;
  *(void *)&long long v109 = 47;
  *((void *)&v109 + 1) = 0xE100000000000000;
  sub_22C009A98();
  size_t v11 = (void *)sub_22C01E698();
  swift_bridgeObjectRelease();
  if (v11[2] < 2uLL) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v13 = v11[6];
  uint64_t v12 = v11[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v3 + 16);
  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_22C0188FC(v13, v12), (v16 & 1) != 0))
  {
    sub_22C006494(*(void *)(v14 + 56) + 40 * v15, (uint64_t)&v109);
  }
  else
  {
    uint64_t v111 = 0;
    long long v109 = 0u;
    long long v110 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v110 + 1)) {
    return sub_22C009AEC((uint64_t)&v109);
  }
  sub_22C006590(&v109, (uint64_t)v112);
  id v18 = objc_msgSend(a1, sel_headers);
  id v19 = objc_msgSend(v18, sel_query);

  uint64_t v20 = sub_22C01E458();
  if (*(void *)(v20 + 16) && (unint64_t v21 = sub_22C0188FC(0x74657366666FLL, 0xE600000000000000), (v22 & 1) != 0))
  {
    uint64_t v23 = (uint64_t *)(*(void *)(v20 + 56) + 16 * v21);
    uint64_t v25 = *v23;
    unint64_t v24 = v23[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v24 = 0xE100000000000000;
    uint64_t v25 = 48;
  }
  swift_bridgeObjectRelease();
  uint64_t v26 = HIBYTE(v24) & 0xF;
  uint64_t v27 = v25 & 0xFFFFFFFFFFFFLL;
  if ((v24 & 0x2000000000000000) != 0) {
    uint64_t v28 = HIBYTE(v24) & 0xF;
  }
  else {
    uint64_t v28 = v25 & 0xFFFFFFFFFFFFLL;
  }
  if (!v28)
  {
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  }
  if ((v24 & 0x1000000000000000) != 0)
  {
    sub_22C018EBC(v25, v24, 10);
    char v31 = v104;
    goto LABEL_59;
  }
  if ((v24 & 0x2000000000000000) == 0)
  {
    if ((v25 & 0x1000000000000000) != 0) {
      char v29 = (unsigned __int8 *)((v24 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      char v29 = (unsigned __int8 *)sub_22C01E718();
    }
    sub_22C018E10(v29, v27, 10);
    char v31 = v30 & 1;
    goto LABEL_59;
  }
  *(void *)&long long v109 = v25;
  *((void *)&v109 + 1) = v24 & 0xFFFFFFFFFFFFFFLL;
  if (v25 == 43)
  {
    if (!v26) {
      goto LABEL_102;
    }
    if (v26 == 1 || (BYTE1(v25) - 48) > 9u) {
      goto LABEL_56;
    }
    if (v26 == 2) {
      goto LABEL_58;
    }
    if ((BYTE2(v25) - 48) <= 9u)
    {
      uint64_t v42 = v26 - 3;
      if (v42)
      {
        uint64_t v43 = (unsigned __int8 *)&v109 + 3;
        unint64_t v44 = 10 * (BYTE1(v25) - 48) + (BYTE2(v25) - 48);
        while (1)
        {
          unsigned int v45 = *v43 - 48;
          if (v45 > 9) {
            goto LABEL_56;
          }
          if (!is_mul_ok(v44, 0xAuLL)) {
            goto LABEL_56;
          }
          uint64_t v46 = 10 * v44;
          BOOL v33 = __CFADD__(v46, v45);
          unint64_t v44 = v46 + v45;
          if (v33) {
            goto LABEL_56;
          }
          char v31 = 0;
          ++v43;
          if (!--v42) {
            goto LABEL_59;
          }
        }
      }
      goto LABEL_58;
    }
  }
  else
  {
    if (v25 == 45)
    {
      if (v26)
      {
        if (v26 == 1) {
          goto LABEL_56;
        }
        unsigned __int8 v32 = BYTE1(v25) - 48;
        if ((BYTE1(v25) - 48) > 9u) {
          goto LABEL_56;
        }
        BOOL v33 = v32 == 0;
        unint64_t v34 = -(uint64_t)v32;
        if (!v33) {
          goto LABEL_56;
        }
        if (v26 != 2)
        {
          unsigned __int8 v35 = BYTE2(v25) - 48;
          if ((BYTE2(v25) - 48) > 9u) {
            goto LABEL_56;
          }
          if (!is_mul_ok(v34, 0xAuLL)) {
            goto LABEL_56;
          }
          unint64_t v36 = 10 * v34;
          BOOL v33 = v36 >= v35;
          unint64_t v37 = v36 - v35;
          if (!v33) {
            goto LABEL_56;
          }
          uint64_t v38 = v26 - 3;
          if (v38)
          {
            id v39 = (unsigned __int8 *)&v109 + 3;
            while (1)
            {
              unsigned int v40 = *v39 - 48;
              if (v40 > 9) {
                goto LABEL_56;
              }
              if (!is_mul_ok(v37, 0xAuLL)) {
                goto LABEL_56;
              }
              unint64_t v41 = 10 * v37;
              BOOL v33 = v41 >= v40;
              unint64_t v37 = v41 - v40;
              if (!v33) {
                goto LABEL_56;
              }
              char v31 = 0;
              ++v39;
              if (!--v38) {
                goto LABEL_59;
              }
            }
          }
        }
LABEL_58:
        char v31 = 0;
        goto LABEL_59;
      }
      __break(1u);
LABEL_102:
      __break(1u);
      swift_once();
      uint64_t v61 = sub_22C01E1A8();
      __swift_project_value_buffer(v61, (uint64_t)qword_2684976B8);
      id v62 = a1;
      id v63 = 0;
      id v64 = v62;
      id v65 = 0;
      char v66 = sub_22C01E188();
      os_log_type_t v67 = sub_22C01E628();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = swift_slowAlloc();
        BOOL v106 = (void *)swift_slowAlloc();
        uint64_t v107 = swift_slowAlloc();
        *(void *)&long long v109 = v107;
        *(_DWORD *)uint64_t v68 = 136315394;
        log = v66;
        char v69 = a2;
        id v70 = objc_msgSend(v64, sel_headers);
        id v71 = objc_msgSend(v70, sel_path);

        uint64_t v72 = sub_22C01E4A8();
        unint64_t v74 = v73;

        uint64_t v75 = v72;
        a2 = v69;
        sub_22C008A34(v75, v74, (uint64_t *)&v109);
        sub_22C01E678();

        swift_bridgeObjectRelease();
        *(_WORD *)(v68 + 12) = 2112;
        id v76 = 0;
        uint64_t v108 = _swift_stdlib_bridgeErrorToNSError();
        sub_22C01E678();
        *BOOL v106 = v108;

        char v66 = log;
        _os_log_impl(&dword_22BFAC000, log, v67, "Failed to process request: path=%s, error=%@", (uint8_t *)v68, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268497790);
        swift_arrayDestroy();
        MEMORY[0x230F5C810](v106, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x230F5C810](v107, -1, -1);
        MEMORY[0x230F5C810](v68, -1, -1);
      }
      else
      {
      }
      id v95 = objc_msgSend(a2, sel_headers);
      objc_msgSend(v95, sel_setStatusCode_, 500);

      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
    }
    if (!v26 || (v25 - 48) > 9u) {
      goto LABEL_56;
    }
    if (v26 == 1) {
      goto LABEL_58;
    }
    if ((BYTE1(v25) - 48) <= 9u)
    {
      uint64_t v96 = v26 - 2;
      if (v96)
      {
        BOOL v97 = (unsigned __int8 *)&v109 + 2;
        unint64_t v98 = 10 * (v25 - 48) + (BYTE1(v25) - 48);
        while (1)
        {
          unsigned int v99 = *v97 - 48;
          if (v99 > 9) {
            goto LABEL_56;
          }
          if (!is_mul_ok(v98, 0xAuLL)) {
            goto LABEL_56;
          }
          uint64_t v100 = 10 * v98;
          BOOL v33 = __CFADD__(v100, v99);
          unint64_t v98 = v100 + v99;
          if (v33) {
            goto LABEL_56;
          }
          char v31 = 0;
          ++v97;
          if (!--v96) {
            goto LABEL_59;
          }
        }
      }
      goto LABEL_58;
    }
  }
LABEL_56:
  char v31 = 1;
LABEL_59:
  swift_bridgeObjectRelease();
  if (v31) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  }
  id v47 = objc_msgSend(a1, sel_headers);
  id v48 = objc_msgSend(v47, sel_query);

  uint64_t v49 = sub_22C01E458();
  if (*(void *)(v49 + 16) && (unint64_t v50 = sub_22C0188FC(0x74696D696CLL, 0xE500000000000000), (v51 & 1) != 0))
  {
    BOOL v52 = (uint64_t *)(*(void *)(v49 + 56) + 16 * v50);
    uint64_t v54 = *v52;
    unint64_t v53 = v52[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v53 = 0xE100000000000000;
    uint64_t v54 = 48;
  }
  swift_bridgeObjectRelease();
  unint64_t v55 = sub_22C0086F0(v54, v53);
  if (v56) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  }
  unint64_t v57 = v55;
  id v58 = objc_msgSend(a1, sel_headers);

  uint64_t v59 = v113;
  uint64_t v60 = v114;
  __swift_project_boxed_opaque_existential_1(v112, v113);
  (*(void (**)(void *__return_ptr, long long *, uint64_t, uint64_t))(v60 + 24))(v115, &v109, v59, v60);
  uint64_t v77 = v115[0];
  unint64_t v78 = v115[1];
  sub_22C009B4C((uint64_t)v115, (uint64_t)&v109);
  if (((char)v111 & 0x80000000) == 0)
  {
    unint64_t v80 = *((void *)&v109 + 1);
    uint64_t v79 = v109;
    uint64_t v81 = v110;
    unsigned __int8 v82 = BYTE8(v110);
    sub_22BFE67D0(v77, v78);
    id v83 = objc_msgSend(a2, sel_headers);
    char v84 = v83;
    BOOL v86 = v81 >= 0 && v81 == v57;
    if ((v82 | v86)) {
      uint64_t v87 = 200;
    }
    else {
      uint64_t v87 = 206;
    }
    objc_msgSend(v83, sel_setStatusCode_, v87);

    id v88 = objc_msgSend(a2, sel_headers);
    uint64_t v89 = v113;
    uint64_t v90 = v114;
    __swift_project_boxed_opaque_existential_1(v112, v113);
    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v89, v90);
    BOOL v91 = (void *)sub_22C01E498();
    swift_bridgeObjectRelease();
    objc_msgSend(v88, sel_setContentType_, v91);

    id v92 = objc_msgSend(a2, sel_headers);
    char v93 = v92;
    uint64_t v94 = 0;
    switch(v80 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v79), v79))
        {
          __break(1u);
LABEL_104:
          __break(1u);
        }
        else
        {
          uint64_t v94 = HIDWORD(v79) - (int)v79;
LABEL_94:
          if ((v94 & 0x8000000000000000) == 0)
          {
LABEL_95:
            objc_msgSend(v92, sel_setContentLength_, v94);

            BOOL v103 = (void *)sub_22C01DF08();
            objc_msgSend(a2, sel_setBody_, v103);

            sub_22C009BA8((uint64_t)v115);
            goto LABEL_96;
          }
        }
        sub_22C01E738();
        __break(1u);
        JUMPOUT(0x22C009A88);
      case 2uLL:
        uint64_t v102 = *(void *)(v79 + 16);
        uint64_t v101 = *(void *)(v79 + 24);
        uint64_t v94 = v101 - v102;
        if (!__OFSUB__(v101, v102)) {
          goto LABEL_94;
        }
        goto LABEL_104;
      case 3uLL:
        goto LABEL_95;
      default:
        uint64_t v94 = BYTE6(v80);
        goto LABEL_95;
    }
  }
  LOBYTE(v111) = v111 & 0x7F;
LABEL_96:
  sub_22C009BA8((uint64_t)v115);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
}

unint64_t sub_22C009A98()
{
  unint64_t result = qword_268497780;
  if (!qword_268497780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497780);
  }
  return result;
}

uint64_t sub_22C009AEC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497788);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C009B4C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22C009BA8(uint64_t a1)
{
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_22C009C44()
{
  qword_26849DD90 = (uint64_t)&unk_26DF69058;
}

uint64_t sub_22C009C58@<X0>(uint64_t a1@<X8>)
{
  return sub_22C009D24((uint64_t (*)(void))sub_22C00BD98, a1);
}

uint64_t sub_22C009C70@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_2684970E0, &qword_26849DD90, a1);
}

uint64_t sub_22C009C94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22C009D98(a1, (uint64_t (*)(void))sub_22C00BD98, a2);
}

uint64_t sub_22C009CAC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22C00AF8C();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_22C009CF8()
{
  qword_26849DD98 = (uint64_t)&unk_26DF69158;
}

uint64_t sub_22C009D0C@<X0>(uint64_t a1@<X8>)
{
  return sub_22C009D24((uint64_t (*)(void))sub_22BFF5108, a1);
}

uint64_t sub_22C009D24@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 9) = v5 & 1;
  return result;
}

uint64_t sub_22C009D5C@<X0>(void *a1@<X8>)
{
  return sub_22BFE6F7C(&qword_2684970E8, &qword_26849DD98, a1);
}

uint64_t sub_22C009D80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22C009D98(a1, (uint64_t (*)(void))sub_22BFF5108, a2);
}

uint64_t sub_22C009D98@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X8>)
{
  uint64_t result = a2(*a1);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 9) = v6 & 1;
  return result;
}

uint64_t sub_22C009DD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22C00AFE0();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_22C009E20()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DDA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DDA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_22C0266D0;
  unint64_t v4 = v34 + v3;
  unint64_t v5 = v34 + v3 + v1[14];
  *(void *)(v34 + v3) = 0;
  *(void *)unint64_t v5 = "Open";
  *(void *)(v5 + 8) = 4;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "OWEOnly";
  *(void *)(v9 + 8) = 7;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  size_t v11 = (char *)v10 + v1[14];
  void *v10 = 2;
  *(void *)size_t v11 = "WEP40";
  *((void *)v11 + 1) = 5;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 3;
  *(void *)uint64_t v13 = "WEP104";
  *((void *)v13 + 1) = 6;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  unint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 4;
  *(void *)unint64_t v15 = "WAPI";
  *((void *)v15 + 1) = 4;
  v15[16] = 2;
  v8();
  char v16 = (void *)(v4 + 5 * v2);
  unsigned int v17 = (char *)v16 + v1[14];
  *char v16 = 5;
  *(void *)unsigned int v17 = "WPA1Personal";
  *((void *)v17 + 1) = 12;
  v17[16] = 2;
  v8();
  id v18 = (void *)(v4 + 6 * v2);
  id v19 = (char *)v18 + v1[14];
  *id v18 = 6;
  *(void *)id v19 = "WPA2Personal";
  *((void *)v19 + 1) = 12;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  unint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 7;
  *(void *)unint64_t v21 = "WPA12PersonalMixed";
  *((void *)v21 + 1) = 18;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 8;
  *(void *)uint64_t v22 = "WPA3Personal";
  *(void *)(v22 + 8) = 12;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v4 + 9 * v2);
  unint64_t v24 = (char *)v23 + v1[14];
  void *v23 = 9;
  *(void *)unint64_t v24 = "WPA23PersonalMixed";
  *((void *)v24 + 1) = 18;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v4 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  void *v25 = 10;
  *(void *)uint64_t v26 = "WPA3SAEPublicKeyOnly";
  *((void *)v26 + 1) = 20;
  v26[16] = 2;
  v8();
  uint64_t v27 = (void *)(v4 + 11 * v2);
  uint64_t v28 = (char *)v27 + v1[14];
  void *v27 = 11;
  *(void *)uint64_t v28 = "WPA1Enterprise";
  *((void *)v28 + 1) = 14;
  v28[16] = 2;
  v8();
  char v29 = (void *)(v4 + 12 * v2);
  char v30 = (char *)v29 + v1[14];
  void *v29 = 12;
  *(void *)char v30 = "WPA2Enterprise";
  *((void *)v30 + 1) = 14;
  v30[16] = 2;
  v8();
  char v31 = (void *)(v4 + 13 * v2);
  unsigned __int8 v32 = (char *)v31 + v1[14];
  *char v31 = 13;
  *(void *)unsigned __int8 v32 = "WPA3Enterprise";
  *((void *)v32 + 1) = 14;
  v32[16] = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22C00A2B0@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_2684970F0, (uint64_t)qword_26849DDA0, a1);
}

uint64_t sub_22C00A2D4()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DDB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DDB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242F0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "Unknown";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "Off";
  *(void *)(v10 + 8) = 3;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  size_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)uint64_t v12 = "Fixed";
  *((void *)v12 + 1) = 5;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 3;
  *(void *)uint64_t v14 = "Random";
  *((void *)v14 + 1) = 6;
  v14[16] = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22C00A508@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_2684970F8, (uint64_t)qword_26849DDB8, a1);
}

uint64_t sub_22C00A52C()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DDD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DDD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242C0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "securityType";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "ssid";
  *(void *)(v10 + 8) = 4;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  size_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "passphrase";
  *((void *)v12 + 1) = 10;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)uint64_t v14 = "hidden";
  *((void *)v14 + 1) = 6;
  v14[16] = 2;
  v9();
  unint64_t v15 = (void *)(v5 + 4 * v2);
  char v16 = (char *)v15 + v1[14];
  *unint64_t v15 = 5;
  *(void *)char v16 = "autojoin";
  *((void *)v16 + 1) = 8;
  v16[16] = 2;
  v9();
  unsigned int v17 = (void *)(v5 + 5 * v2);
  id v18 = (char *)v17 + v1[14];
  void *v17 = 6;
  *(void *)id v18 = "macAddressType";
  *((void *)v18 + 1) = 14;
  v18[16] = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22C00A7E8()
{
  uint64_t result = sub_22C01DF98();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_22C00AF8C();
          goto LABEL_12;
        case 2:
        case 3:
          uint64_t v4 = v3;
          sub_22C01E018();
          goto LABEL_5;
        case 4:
        case 5:
          uint64_t v4 = v3;
          sub_22C01DFA8();
          goto LABEL_5;
        case 6:
          sub_22C00AFE0();
LABEL_12:
          uint64_t v4 = v3;
          sub_22C01DFB8();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C00A94C()
{
  if (!*(void *)v0 || (sub_22C00AF8C(), uint64_t result = sub_22C01E0B8(), !v1))
  {
    unint64_t v3 = *(void *)(v0 + 24);
    uint64_t v4 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0) {
      uint64_t v4 = *(void *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
    }
    if (!v4 || (uint64_t result = sub_22C01E108(), !v1))
    {
      unint64_t v5 = *(void *)(v0 + 40);
      uint64_t v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0) {
        uint64_t v6 = *(void *)(v0 + 32) & 0xFFFFFFFFFFFFLL;
      }
      if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
      {
        if (*(unsigned char *)(v0 + 48) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
        {
          if (*(unsigned char *)(v0 + 49) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
          {
            if (!*(void *)(v0 + 56) || (sub_22C00AFE0(), uint64_t result = sub_22C01E0B8(), !v1))
            {
              type metadata accessor for WiFi();
              return sub_22C01DF38();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_22C00AB0C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(_WORD *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 1;
  return sub_22C01DF48();
}

uint64_t sub_22C00AB50()
{
  return 1766222167;
}

uint64_t sub_22C00AB60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22C00ABD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 40);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22C00AC40())()
{
  return nullsub_1;
}

uint64_t sub_22C00AC64()
{
  return sub_22C00A7E8();
}

uint64_t sub_22C00AC7C()
{
  return sub_22C00A94C();
}

uint64_t sub_22C00AC94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C00B3D4(&qword_2684977C8, (void (*)(uint64_t))type metadata accessor for WiFi);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C00AD10@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497100, (uint64_t)qword_26849DDD0, a1);
}

uint64_t sub_22C00AD34(uint64_t a1)
{
  uint64_t v2 = sub_22C00B3D4(&qword_2684977B0, (void (*)(uint64_t))type metadata accessor for WiFi);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C00ADA0()
{
  sub_22C00B3D4(&qword_2684977B0, (void (*)(uint64_t))type metadata accessor for WiFi);
  return sub_22C01E088();
}

uint64_t sub_22C00AE20()
{
  return sub_22C00B3D4(&qword_2684977A8, (void (*)(uint64_t))type metadata accessor for WiFi);
}

uint64_t type metadata accessor for WiFi()
{
  uint64_t result = qword_2684977E0;
  if (!qword_2684977E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C00AEB4()
{
  return sub_22C00B3D4(&qword_2684977B0, (void (*)(uint64_t))type metadata accessor for WiFi);
}

uint64_t sub_22C00AEFC()
{
  return sub_22C00B3D4(&qword_2684977B8, (void (*)(uint64_t))type metadata accessor for WiFi);
}

uint64_t sub_22C00AF44()
{
  return sub_22C00B3D4(&qword_2684977C0, (void (*)(uint64_t))type metadata accessor for WiFi);
}

unint64_t sub_22C00AF8C()
{
  unint64_t result = qword_2684977D0;
  if (!qword_2684977D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684977D0);
  }
  return result;
}

unint64_t sub_22C00AFE0()
{
  unint64_t result = qword_2684977D8;
  if (!qword_2684977D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684977D8);
  }
  return result;
}

uint64_t sub_22C00B034(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v21 - v9;
  uint64_t v11 = *a1;
  uint64_t v12 = *a2;
  if (*((unsigned char *)a2 + 8) == 1)
  {
    switch(v12)
    {
      case 1:
        if (v11 == 1) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 2:
        if (v11 == 2) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 3:
        if (v11 == 3) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 4:
        if (v11 == 4) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 5:
        if (v11 == 5) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 6:
        if (v11 == 6) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 7:
        if (v11 == 7) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 8:
        if (v11 == 8) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 9:
        if (v11 == 9) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 10:
        if (v11 == 10) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 11:
        if (v11 == 11) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 12:
        if (v11 == 12) {
          goto LABEL_6;
        }
        goto LABEL_49;
      case 13:
        if (v11 == 13) {
          goto LABEL_6;
        }
        goto LABEL_49;
      default:
        if (!v11) {
          goto LABEL_6;
        }
        goto LABEL_49;
    }
  }
  if (v11 != v12) {
    goto LABEL_49;
  }
LABEL_6:
  BOOL v13 = a1[2] == a2[2] && a1[3] == a2[3];
  if (v13 || (char v14 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    if (a1[4] == a2[4] && a1[5] == a2[5] || (char v14 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      if (*((unsigned __int8 *)a1 + 48) == *((unsigned __int8 *)a2 + 48)
        && *((unsigned __int8 *)a1 + 49) == *((unsigned __int8 *)a2 + 49))
      {
        uint64_t v15 = a1[7];
        uint64_t v16 = a2[7];
        if (*((unsigned char *)a2 + 64) == 1)
        {
          switch(v16)
          {
            case 1:
              if (v15 != 1) {
                goto LABEL_49;
              }
              goto LABEL_47;
            case 2:
              if (v15 == 2) {
                goto LABEL_47;
              }
              goto LABEL_49;
            case 3:
              if (v15 == 3) {
                goto LABEL_47;
              }
              goto LABEL_49;
            default:
              if (!v15) {
                goto LABEL_47;
              }
              goto LABEL_49;
          }
        }
        if (v15 == v16)
        {
LABEL_47:
          uint64_t v17 = type metadata accessor for WiFi();
          id v18 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
          v18(v10, (char *)a1 + *(int *)(v17 + 40), v4);
          v18(v8, (char *)a2 + *(int *)(v17 + 40), v4);
          sub_22C00B3D4(&qword_2684973D8, MEMORY[0x263F50560]);
          char v14 = sub_22C01E488();
          id v19 = *(void (**)(char *, uint64_t))(v5 + 8);
          v19(v8, v4);
          v19(v10, v4);
          return v14 & 1;
        }
      }
LABEL_49:
      char v14 = 0;
    }
  }
  return v14 & 1;
}

uint64_t sub_22C00B3D4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for WiFiSecurityType()
{
  return &type metadata for WiFiSecurityType;
}

ValueMetadata *type metadata accessor for WiFiPrivateMACAddressType()
{
  return &type metadata for WiFiPrivateMACAddressType;
}

void *sub_22C00B43C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    void *v3 = *a2;
    unint64_t v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v5 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v5;
    uint64_t v6 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v6;
    *(_WORD *)(a1 + 48) = *((_WORD *)a2 + 24);
    *(void *)(a1 + 56) = a2[7];
    uint64_t v7 = *(int *)(a3 + 40);
    uint64_t v8 = (uint64_t)a2 + v7;
    uint64_t v9 = a1 + v7;
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v10 = sub_22C01DF58();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v9, v8, v10);
  }
  return v3;
}

uint64_t sub_22C00B55C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22C00B5DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v9 = sub_22C01DF58();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v8, v7, v9);
  return a1;
}

uint64_t sub_22C00B6AC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(unsigned char *)(a1 + 49) = *((unsigned char *)a2 + 49);
  uint64_t v7 = a2[7];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (uint64_t)a2 + v8;
  uint64_t v11 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

uint64_t sub_22C00B798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(int *)(a3 + 40);
  uint64_t v6 = a2 + v5;
  uint64_t v7 = a1 + v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
  return a1;
}

uint64_t sub_22C00B83C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_22C00B908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C00B91C);
}

uint64_t sub_22C00B91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C00B9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C00B9E0);
}

uint64_t sub_22C00B9E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22C00BA88()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_22C00BB3C()
{
  unint64_t result = qword_2684977F0;
  if (!qword_2684977F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684977F0);
  }
  return result;
}

uint64_t sub_22C00BB90()
{
  return sub_22BFF8AA0(&qword_2684977F8, &qword_268497800);
}

unint64_t sub_22C00BBBC()
{
  unint64_t result = qword_268497808;
  if (!qword_268497808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497808);
  }
  return result;
}

uint64_t sub_22C00BC10()
{
  return sub_22BFF8AA0(&qword_268497810, &qword_268497818);
}

unint64_t sub_22C00BC3C()
{
  unint64_t result = qword_268497820;
  if (!qword_268497820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497820);
  }
  return result;
}

unint64_t sub_22C00BC94()
{
  unint64_t result = qword_268497828;
  if (!qword_268497828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497828);
  }
  return result;
}

unint64_t sub_22C00BCEC()
{
  unint64_t result = qword_268497830;
  if (!qword_268497830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497830);
  }
  return result;
}

unint64_t sub_22C00BD44()
{
  unint64_t result = qword_268497838;
  if (!qword_268497838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497838);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountMigrator()
{
  return &type metadata for AccountMigrator;
}

unint64_t sub_22C00BDBC()
{
  return 0xD00000000000001CLL;
}

void sub_22C00BDD8()
{
}

uint64_t sub_22C00BF2C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GETCertificateRouter()
{
  return self;
}

ValueMetadata *type metadata accessor for PhotoLibraryMigrator()
{
  return &type metadata for PhotoLibraryMigrator;
}

unint64_t sub_22C00BF98()
{
  return 0xD00000000000001ALL;
}

void sub_22C00BFB4()
{
}

ValueMetadata *type metadata accessor for SettingMigrator()
{
  return &type metadata for SettingMigrator;
}

unint64_t sub_22C00C028()
{
  return 0xD00000000000001CLL;
}

void sub_22C00C044()
{
}

uint64_t sub_22C00C0A8()
{
  sub_22C01E3B8();
  sub_22C01E408();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Client()
{
  return self;
}

void sub_22C00C138()
{
  qword_26849DDE8 = (uint64_t)&unk_26DF691B8;
}

void sub_22C00C14C(uint64_t a1@<X8>)
{
  sub_22BFF50E0();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_22C00C180@<X0>(void *a1@<X8>)
{
  if (qword_268497108 != -1) {
    swift_once();
  }
  *a1 = qword_26849DDE8;
  return swift_bridgeObjectRetain();
}

void sub_22C00C1EC(uint64_t a1@<X8>)
{
  sub_22BFF50E0();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_22C00C224(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22C00E2D4();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_22C00C270()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DDF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DDF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "ORIGINAL";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "COMPRESSED";
  *(void *)(v10 + 8) = 10;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 2;
  *(void *)uint64_t v12 = "DATALESS";
  *((void *)v12 + 1) = 8;
  v12[16] = 2;
  v9();
  BOOL v13 = (void *)(v5 + 3 * v2);
  char v14 = (char *)v13 + v1[14];
  void *v13 = 3;
  *(void *)char v14 = "LIVE";
  *((void *)v14 + 1) = 4;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 4;
  *(void *)uint64_t v15 = "BURST";
  *(void *)(v15 + 8) = 5;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22C00C4EC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497110, (uint64_t)qword_26849DDF0, a1);
}

uint64_t sub_22C00C510()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DE08);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DE08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_22C0266A0;
  unint64_t v4 = v32 + v3;
  unint64_t v5 = v32 + v3 + v1[14];
  *(void *)(v32 + v3) = 1;
  *(void *)unint64_t v5 = "identifier";
  *(void *)(v5 + 8) = 10;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v32 + v3 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "burstIdentifier";
  *(void *)(v9 + 8) = 15;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v32 + v3 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "type";
  *((void *)v11 + 1) = 4;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v32 + v3 + 3 * v2);
  BOOL v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)BOOL v13 = "mimeType";
  *((void *)v13 + 1) = 8;
  v13[16] = 2;
  v8();
  char v14 = (void *)(v32 + v3 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *char v14 = 5;
  *(void *)uint64_t v15 = "relativePath";
  *((void *)v15 + 1) = 12;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v32 + v3 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "filename";
  *((void *)v17 + 1) = 8;
  v17[16] = 2;
  v8();
  id v18 = (void *)(v32 + v3 + 6 * v2);
  id v19 = (char *)v18 + v1[14];
  *id v18 = 7;
  *(void *)id v19 = "creationDate";
  *((void *)v19 + 1) = 12;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v32 + v3 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "favorite";
  *((void *)v21 + 1) = 8;
  v21[16] = 2;
  v8();
  uint64_t v22 = v32 + v3 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "hidden";
  *(void *)(v22 + 8) = 6;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v32 + v3 + 9 * v2);
  unint64_t v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)unint64_t v24 = "deleted";
  *((void *)v24 + 1) = 7;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v32 + v3 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  void *v25 = 11;
  *(void *)uint64_t v26 = "latitude";
  *((void *)v26 + 1) = 8;
  v26[16] = 2;
  v8();
  uint64_t v27 = (void *)(v32 + v3 + 11 * v2);
  uint64_t v28 = (char *)v27 + v1[14];
  void *v27 = 12;
  *(void *)uint64_t v28 = "longitude";
  *((void *)v28 + 1) = 9;
  v28[16] = 2;
  v8();
  char v29 = (void *)(v32 + v3 + 12 * v2);
  char v30 = (char *)v29 + v1[14];
  void *v29 = 13;
  *(void *)char v30 = "albums";
  *((void *)v30 + 1) = 6;
  v30[16] = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22C00C968()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 4:
        case 5:
        case 6:
          sub_22C01E018();
          break;
        case 3:
          sub_22C00E2D4();
          sub_22C01DFB8();
          break;
        case 7:
          sub_22C01E038();
          break;
        case 8:
        case 9:
        case 10:
          sub_22C01DFA8();
          break;
        case 11:
        case 12:
          sub_22C01DFC8();
          break;
        case 13:
          type metadata accessor for Album(0);
          sub_22C00DF7C(&qword_268497868, (void (*)(uint64_t))type metadata accessor for Album);
          sub_22C01E048();
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C00CBE4()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    unint64_t v5 = *(void *)(v0 + 24);
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = *(void *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
    {
      if (!*(void *)(v0 + 32) || (sub_22C00E2D4(), uint64_t result = sub_22C01E0B8(), !v1))
      {
        unint64_t v7 = *(void *)(v0 + 56);
        uint64_t v8 = HIBYTE(v7) & 0xF;
        if ((v7 & 0x2000000000000000) == 0) {
          uint64_t v8 = *(void *)(v0 + 48) & 0xFFFFFFFFFFFFLL;
        }
        if (!v8 || (uint64_t result = sub_22C01E108(), !v1))
        {
          unint64_t v9 = *(void *)(v0 + 72);
          uint64_t v10 = HIBYTE(v9) & 0xF;
          if ((v9 & 0x2000000000000000) == 0) {
            uint64_t v10 = *(void *)(v0 + 64) & 0xFFFFFFFFFFFFLL;
          }
          if (!v10 || (uint64_t result = sub_22C01E108(), !v1))
          {
            unint64_t v11 = *(void *)(v0 + 88);
            uint64_t v12 = HIBYTE(v11) & 0xF;
            if ((v11 & 0x2000000000000000) == 0) {
              uint64_t v12 = *(void *)(v0 + 80) & 0xFFFFFFFFFFFFLL;
            }
            if (!v12 || (uint64_t result = sub_22C01E108(), !v1))
            {
              if (!*(void *)(v0 + 96) || (uint64_t result = sub_22C01E128(), !v1))
              {
                if (*(unsigned char *)(v0 + 104) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
                {
                  if (*(unsigned char *)(v0 + 105) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
                  {
                    if (*(unsigned char *)(v0 + 106) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
                    {
                      if (!*(_DWORD *)(v0 + 108) || (uint64_t result = sub_22C01E0C8(), !v1))
                      {
                        if (!*(_DWORD *)(v0 + 112) || (uint64_t result = sub_22C01E0C8(), !v1))
                        {
                          if (!*(void *)(*(void *)(v0 + 120) + 16)
                            || (type metadata accessor for Album(0),
                                sub_22C00DF7C(&qword_268497868, (void (*)(uint64_t))type metadata accessor for Album), uint64_t result = sub_22C01E138(), !v1))
                          {
                            type metadata accessor for Asset(0);
                            return sub_22C01DF38();
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
  }
  return result;
}

uint64_t sub_22C00CF1C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0xE000000000000000;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0xE000000000000000;
  *(_DWORD *)(a1 + 108) = 0;
  *(_DWORD *)(a1 + 112) = 0;
  *(void *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 103) = 0;
  *(void *)(a1 + 120) = MEMORY[0x263F8EE78];
  return sub_22C01DF48();
}

uint64_t sub_22C00CF7C()
{
  return 0x7465737341;
}

uint64_t sub_22C00CF90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 68);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_22C00D000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 68);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_22C00D070())()
{
  return nullsub_1;
}

uint64_t sub_22C00D094()
{
  return sub_22C00C968();
}

uint64_t sub_22C00D0AC()
{
  return sub_22C00CBE4();
}

uint64_t sub_22C00D0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C00DF7C(&qword_2684978A0, (void (*)(uint64_t))type metadata accessor for Asset);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C00D140@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497118, (uint64_t)qword_26849DE08, a1);
}

uint64_t sub_22C00D164(uint64_t a1)
{
  uint64_t v2 = sub_22C00DF7C(&qword_268497888, (void (*)(uint64_t))type metadata accessor for Asset);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C00D1D0()
{
  sub_22C00DF7C(&qword_268497888, (void (*)(uint64_t))type metadata accessor for Asset);
  return sub_22C01E088();
}

uint64_t sub_22C00D250()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DE20);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DE20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C0242C0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "identifier";
  *(void *)(v6 + 8) = 10;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "name";
  *(void *)(v10 + 8) = 4;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  unint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "favorite";
  *((void *)v12 + 1) = 8;
  v12[16] = 2;
  v9();
  BOOL v13 = (void *)(v5 + 3 * v2);
  char v14 = (char *)v13 + v1[14];
  void *v13 = 4;
  *(void *)char v14 = "hidden";
  *((void *)v14 + 1) = 6;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "deleted";
  *((void *)v16 + 1) = 7;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  id v18 = (char *)v17 + v1[14];
  void *v17 = 6;
  *(void *)id v18 = "app";
  *((void *)v18 + 1) = 3;
  v18[16] = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22C00D50C()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 6:
          sub_22C01E018();
          break;
        case 3:
        case 4:
        case 5:
          sub_22C01DFA8();
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C00D624()
{
  unint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *(void *)v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    unint64_t v5 = *(void *)(v0 + 24);
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = *(void *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
    {
      if (*(unsigned char *)(v0 + 32) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
      {
        if (*(unsigned char *)(v0 + 33) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
        {
          if (*(unsigned char *)(v0 + 34) != 1 || (uint64_t result = sub_22C01E0A8(), !v1))
          {
            unint64_t v7 = *(void *)(v0 + 48);
            uint64_t v8 = HIBYTE(v7) & 0xF;
            if ((v7 & 0x2000000000000000) == 0) {
              uint64_t v8 = *(void *)(v0 + 40) & 0xFFFFFFFFFFFFLL;
            }
            if (!v8 || (uint64_t result = sub_22C01E108(), !v1))
            {
              type metadata accessor for Album(0);
              return sub_22C01DF38();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_22C00D7B4@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(_WORD *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 34) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
  return sub_22C01DF48();
}

uint64_t sub_22C00D7EC()
{
  return 0x6D75626C41;
}

uint64_t sub_22C00D800()
{
  return sub_22C00D50C();
}

uint64_t sub_22C00D818()
{
  return sub_22C00D624();
}

uint64_t sub_22C00D830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C00DF7C(&qword_2684978B0, (void (*)(uint64_t))type metadata accessor for Album);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C00D8AC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497120, (uint64_t)qword_26849DE20, a1);
}

uint64_t sub_22C00D8D0(uint64_t a1)
{
  uint64_t v2 = sub_22C00DF7C(&qword_268497868, (void (*)(uint64_t))type metadata accessor for Album);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C00D93C()
{
  sub_22C00DF7C(&qword_268497868, (void (*)(uint64_t))type metadata accessor for Album);
  return sub_22C01E088();
}

uint64_t sub_22C00D9BC()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DE38);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DE38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22C024340;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "assets";
  *(void *)(v4 + 8) = 6;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_22C01E158();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_22C01E168();
}

uint64_t sub_22C00DB18()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        type metadata accessor for Asset(0);
        sub_22C00DF7C(&qword_268497888, (void (*)(uint64_t))type metadata accessor for Asset);
        sub_22C01E048();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C00DC08()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for Asset(0),
        sub_22C00DF7C(&qword_268497888, (void (*)(uint64_t))type metadata accessor for Asset),
        uint64_t result = sub_22C01E138(),
        !v1))
  {
    type metadata accessor for AssetArray(0);
    return sub_22C01DF38();
  }
  return result;
}

uint64_t sub_22C00DCF4()
{
  return 0x7272417465737341;
}

uint64_t sub_22C00DD10()
{
  return sub_22C00DB18();
}

uint64_t sub_22C00DD28()
{
  return sub_22C00DC08();
}

uint64_t sub_22C00DD40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C00DF7C(&qword_2684978B8, (void (*)(uint64_t))type metadata accessor for AssetArray);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C00DDBC@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497128, (uint64_t)qword_26849DE38, a1);
}

uint64_t sub_22C00DDE0(uint64_t a1)
{
  uint64_t v2 = sub_22C00DF7C(&qword_268497848, (void (*)(uint64_t))type metadata accessor for AssetArray);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C00DE4C()
{
  sub_22C00DF7C(&qword_268497848, (void (*)(uint64_t))type metadata accessor for AssetArray);
  return sub_22C01E088();
}

uint64_t sub_22C00DECC()
{
  return sub_22C00DF7C(&qword_268497840, (void (*)(uint64_t))type metadata accessor for AssetArray);
}

uint64_t type metadata accessor for AssetArray(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684978E0);
}

uint64_t sub_22C00DF34()
{
  return sub_22C00DF7C(&qword_268497848, (void (*)(uint64_t))type metadata accessor for AssetArray);
}

uint64_t sub_22C00DF7C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22C00DFC4()
{
  return sub_22C00DF7C(&qword_268497850, (void (*)(uint64_t))type metadata accessor for AssetArray);
}

uint64_t sub_22C00E00C()
{
  return sub_22C00DF7C(&qword_268497858, (void (*)(uint64_t))type metadata accessor for AssetArray);
}

uint64_t sub_22C00E054()
{
  return sub_22C00DF7C(&qword_268497860, (void (*)(uint64_t))type metadata accessor for Album);
}

uint64_t type metadata accessor for Album(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684978D0);
}

uint64_t sub_22C00E0BC()
{
  return sub_22C00DF7C(&qword_268497868, (void (*)(uint64_t))type metadata accessor for Album);
}

uint64_t sub_22C00E104()
{
  return sub_22C00DF7C(&qword_268497870, (void (*)(uint64_t))type metadata accessor for Album);
}

uint64_t sub_22C00E14C()
{
  return sub_22C00DF7C(&qword_268497878, (void (*)(uint64_t))type metadata accessor for Album);
}

uint64_t sub_22C00E194()
{
  return sub_22C00DF7C(&qword_268497880, (void (*)(uint64_t))type metadata accessor for Asset);
}

uint64_t type metadata accessor for Asset(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684978C0);
}

uint64_t sub_22C00E1FC()
{
  return sub_22C00DF7C(&qword_268497888, (void (*)(uint64_t))type metadata accessor for Asset);
}

uint64_t sub_22C00E244()
{
  return sub_22C00DF7C(&qword_268497890, (void (*)(uint64_t))type metadata accessor for Asset);
}

uint64_t sub_22C00E28C()
{
  return sub_22C00DF7C(&qword_268497898, (void (*)(uint64_t))type metadata accessor for Asset);
}

unint64_t sub_22C00E2D4()
{
  unint64_t result = qword_2684978A8;
  if (!qword_2684978A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684978A8);
  }
  return result;
}

uint64_t sub_22C00E328(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    BOOL v13 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v13 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      if (*(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32)
        && *(unsigned __int8 *)(a1 + 33) == *(unsigned __int8 *)(a2 + 33)
        && *(unsigned __int8 *)(a1 + 34) == *(unsigned __int8 *)(a2 + 34))
      {
        if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && *(void *)(a1 + 48) == *(void *)(a2 + 48)
          || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
        {
          uint64_t v15 = type metadata accessor for Album(0);
          uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
          v16(v10, a1 + *(int *)(v15 + 40), v4);
          v16(v8, a2 + *(int *)(v15 + 40), v4);
          sub_22C00DF7C(&qword_2684973D8, MEMORY[0x263F50560]);
          char v12 = sub_22C01E488();
          uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
          v17(v8, v4);
          v17(v10, v4);
        }
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_22C00E570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v20 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v11 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    BOOL v13 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v13 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a2 + 32);
      if (*(unsigned char *)(a2 + 40) == 1)
      {
        switch(v15)
        {
          case 1:
            if (v14 != 1) {
              goto LABEL_40;
            }
            goto LABEL_16;
          case 2:
            if (v14 != 2) {
              goto LABEL_40;
            }
            goto LABEL_16;
          case 3:
            if (v14 != 3) {
              goto LABEL_40;
            }
            goto LABEL_16;
          case 4:
            if (v14 != 4) {
              goto LABEL_40;
            }
            goto LABEL_16;
          default:
            if (!v14) {
              goto LABEL_16;
            }
            goto LABEL_40;
        }
      }
      if (v14 != v15) {
        goto LABEL_40;
      }
LABEL_16:
      if (*(void *)(a1 + 48) == *(void *)(a2 + 48) && *(void *)(a1 + 56) == *(void *)(a2 + 56)
        || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
      {
        if (*(void *)(a1 + 64) == *(void *)(a2 + 64) && *(void *)(a1 + 72) == *(void *)(a2 + 72)
          || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
        {
          if (*(void *)(a1 + 80) == *(void *)(a2 + 80) && *(void *)(a1 + 88) == *(void *)(a2 + 88)
            || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
          {
            if (*(void *)(a1 + 96) == *(void *)(a2 + 96)
              && *(unsigned __int8 *)(a1 + 104) == *(unsigned __int8 *)(a2 + 104)
              && *(unsigned __int8 *)(a1 + 105) == *(unsigned __int8 *)(a2 + 105)
              && *(unsigned __int8 *)(a1 + 106) == *(unsigned __int8 *)(a2 + 106)
              && *(float *)(a1 + 108) == *(float *)(a2 + 108)
              && *(float *)(a1 + 112) == *(float *)(a2 + 112)
              && (sub_22BFF4174(*(void *)(a1 + 120), *(void *)(a2 + 120)) & 1) != 0)
            {
              uint64_t v16 = type metadata accessor for Asset(0);
              uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
              v17(v10, a1 + *(int *)(v16 + 68), v4);
              v17(v8, a2 + *(int *)(v16 + 68), v4);
              sub_22C00DF7C(&qword_2684973D8, MEMORY[0x263F50560]);
              char v12 = sub_22C01E488();
              uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
              v18(v8, v4);
              v18(v10, v4);
              return v12 & 1;
            }
LABEL_40:
            char v12 = 0;
          }
        }
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_22C00E8CC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v16 - v9;
  if (sub_22BFF485C(*a1, *a2))
  {
    uint64_t v11 = type metadata accessor for AssetArray(0);
    char v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 20), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_22C00DF7C(&qword_2684973D8, MEMORY[0x263F50560]);
    char v13 = sub_22C01E488();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

ValueMetadata *type metadata accessor for AssetType()
{
  return &type metadata for AssetType;
}

void *sub_22C00EA94(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v7 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v7;
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    uint64_t v9 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v9;
    *(void *)(a1 + 96) = a2[12];
    *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
    *(_WORD *)(a1 + 105) = *(_WORD *)((char *)a2 + 105);
    *(void *)(a1 + 108) = *(uint64_t *)((char *)a2 + 108);
    uint64_t v10 = *(int *)(a3 + 68);
    uint64_t v15 = (uint64_t)a2 + v10;
    uint64_t v16 = a1 + v10;
    *(void *)(a1 + 120) = a2[15];
    uint64_t v11 = sub_22C01DF58();
    char v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v16, v15, v11);
  }
  return v3;
}

uint64_t sub_22C00EC0C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 68);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22C00ECAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(_WORD *)(a1 + 105) = *(_WORD *)(a2 + 105);
  *(void *)(a1 + 108) = *(void *)(a2 + 108);
  uint64_t v9 = *(int *)(a3 + 68);
  uint64_t v13 = a2 + v9;
  uint64_t v14 = a1 + v9;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v10 = sub_22C01DF58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v14, v13, v10);
  return a1;
}

uint64_t sub_22C00EDD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  *(unsigned char *)(a1 + 106) = *(unsigned char *)(a2 + 106);
  *(_DWORD *)(a1 + 108) = *(_DWORD *)(a2 + 108);
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 68);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_22C00EF48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(_WORD *)(a1 + 105) = *(_WORD *)(a2 + 105);
  *(void *)(a1 + 108) = *(void *)(a2 + 108);
  uint64_t v6 = *(int *)(a3 + 68);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t sub_22C00F00C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  *(unsigned char *)(a1 + 106) = *(unsigned char *)(a2 + 106);
  *(void *)(a1 + 108) = *(void *)(a2 + 108);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 68);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_22C00F120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C00F134);
}

uint64_t sub_22C00F134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 68);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C00F1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C00F1F8);
}

uint64_t sub_22C00F1F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 68);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22C00F2A0()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_22C00F384(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_WORD *)(a1 + 33) = *(_WORD *)((char *)a2 + 33);
    uint64_t v7 = a2[6];
    uint64_t v8 = *(int *)(a3 + 40);
    uint64_t v9 = (uint64_t)a2 + v8;
    uint64_t v10 = a1 + v8;
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v7;
    uint64_t v11 = sub_22C01DF58();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t sub_22C00F4A4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_22C00F52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = a2 + v7;
  uint64_t v9 = a1 + v7;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v10 = sub_22C01DF58();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

uint64_t sub_22C00F5FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_22C00F6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(int *)(a3 + 40);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_22C00F784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_22C00F848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C00F85C);
}

uint64_t sub_22C00F85C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C00F90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C00F920);
}

uint64_t sub_22C00F920(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22C00F9C8()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22C00FA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C00FA84);
}

uint64_t sub_22C00FA84(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C00FB34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C00FB48);
}

void *sub_22C00FB48(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    void *result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

unint64_t sub_22C00FBF4()
{
  unint64_t result = qword_2684978F0;
  if (!qword_2684978F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684978F0);
  }
  return result;
}

unint64_t sub_22C00FC4C()
{
  unint64_t result = qword_2684978F8;
  if (!qword_2684978F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268497900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2684978F8);
  }
  return result;
}

unint64_t sub_22C00FCAC()
{
  unint64_t result = qword_268497908;
  if (!qword_268497908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497908);
  }
  return result;
}

unint64_t sub_22C00FD04()
{
  unint64_t result = qword_268497910;
  if (!qword_268497910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268497910);
  }
  return result;
}

id MigrationExportViewController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return MigrationExportViewController.init()();
}

id MigrationExportViewController.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for Server();
  uint64_t v2 = (void *)swift_allocObject();
  v2[3] = 0;
  v2[4] = 0;
  id v3 = objc_allocWithZone((Class)MKCertificate);
  uint64_t v4 = v0;
  v2[2] = objc_msgSend(v3, sel_init);
  *(void *)&v4[OBJC_IVAR____TtC12MigrationKit29MigrationExportViewController_server] = v2;
  swift_retain();
  sub_22C006ED0();
  swift_release();

  uint64_t v5 = (void *)sub_22C01E498();
  uint64_t v6 = (void *)sub_22C01E498();
  uint64_t v7 = (void *)sub_22C01E498();
  v10.receiver = v4;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, sel_initWithTitle_detailText_symbolName_contentLayout_, v5, v6, v7, 2);

  return v8;
}

id MigrationExportViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v8 = v7;
  uint64_t v12 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void MigrationExportViewController.init(title:detailText:symbolName:contentLayout:)()
{
}

uint64_t sub_22C010070()
{
  return swift_release();
}

id MigrationExportViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MigrationExportViewController()
{
  return self;
}

uint64_t method lookup function for MigrationExportViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MigrationExportViewController);
}

uint64_t dispatch thunk of MigrationExportViewController.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t TCPConnection.__allocating_init(endpoint:)(char *a1)
{
  uint64_t v2 = sub_22C01E208();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v14 - v7;
  sub_22C01E328();
  swift_allocObject();
  uint64_t v9 = sub_22C01E318();
  sub_22C01E308();
  swift_retain();
  MEMORY[0x230F5B070](0, v9);
  objc_super v10 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v10(v8, a1, v2);
  type metadata accessor for TCPConnection();
  swift_allocObject();
  v10(v6, v8, v2);
  uint64_t v11 = sub_22C012A6C((uint64_t)v6);
  swift_release();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v8, v2);
  swift_release();
  v12(a1, v2);
  return v11;
}

uint64_t type metadata accessor for TCPConnection()
{
  return self;
}

uint64_t TCPConnection.__allocating_init(host:port:)(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(v47) = a3;
  uint64_t v46 = a2;
  uint64_t v3 = sub_22C01E208();
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unsigned int v45 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v44 = (char *)&v36 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v42 = (char *)&v36 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v36 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497148);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22C01E1F8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_22C01E1C8();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C01E1D8();
  sub_22C01E1E8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v24 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    uint64_t v38 = v18;
    v24(v18, v14, v15);
    uint64_t v25 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268497150) + 48)];
    unsigned int v40 = v22;
    uint64_t v41 = v20;
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    uint64_t v39 = v19;
    v26(v11, v22, v19);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v25, v18, v15);
    uint64_t v27 = v43;
    (*(void (**)(char *, void, uint64_t))(v43 + 104))(v11, *MEMORY[0x263F14118], v3);
    unint64_t v37 = v11;
    uint64_t v47 = v16;
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
    char v29 = v42;
    v28(v42, v11, v3);
    sub_22C01E328();
    swift_allocObject();
    uint64_t v30 = sub_22C01E318();
    sub_22C01E308();
    swift_retain();
    MEMORY[0x230F5B070](0, v30);
    uint64_t v46 = v15;
    char v31 = v29;
    uint64_t v32 = v44;
    v28(v44, v31, v3);
    type metadata accessor for TCPConnection();
    swift_allocObject();
    uint64_t v33 = (uint64_t)v45;
    v28(v45, v32, v3);
    uint64_t v34 = sub_22C012A6C(v33);
    swift_release();
    unsigned __int8 v35 = *(void (**)(char *, uint64_t))(v27 + 8);
    v35(v32, v3);
    swift_release();
    v35(v31, v3);
    v35(v37, v3);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v46);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v39);
    return v34;
  }
  return result;
}

uint64_t TCPConnection.deinit()
{
  swift_release();

  return v0;
}

uint64_t TCPConnection.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t Query.init(path:offset:limit:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t Query.path.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Query.offset.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t Query.limit.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t destroy for Query()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Query(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Query(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for Query(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Query(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Query(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Query()
{
  return &type metadata for Query;
}

id ViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v12 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

id ViewController.init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
LABEL_6:
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ViewController();
  id v14 = objc_msgSendSuper2(&v16, sel_initWithTitle_detailText_symbolName_contentLayout_, v11, v12, v13, a7);

  return v14;
}

uint64_t type metadata accessor for ViewController()
{
  return self;
}

void sub_22C010CF0()
{
  uint64_t v1 = v0;
  sub_22C01E5F8();
  sub_22C01E5E8();
  sub_22C01E5B8();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for ViewController();
  objc_msgSendSuper2(&v15, sel_viewDidLoad);
  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    long long v3 = v2;
    id v4 = objc_msgSend(self, sel_whiteColor);
    objc_msgSend(v3, sel_setBackgroundColor_, v4);

    id v5 = objc_msgSend(v1, sel_navigationController);
    if (v5)
    {
      uint64_t v6 = v5;
      unsigned int v7 = objc_msgSend(v5, sel_isBeingPresented);

      if (v7)
      {
        sub_22C01E5E8();
        sub_22C01E5B8();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v8 = objc_msgSend(v1, sel_navigationController);
        if (v8)
        {
          uint64_t v9 = v8;
          id v10 = objc_msgSend(v8, sel_viewControllers);

          sub_22C010FBC();
          unint64_t v11 = sub_22C01E5A8();

          if (v11 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v12 = sub_22C01E758();
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_release();
          }
          swift_bridgeObjectRelease();
          if (v12 == 1)
          {
            id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, sel_cancel);
            id v14 = objc_msgSend(v1, sel_navigationItem);
            objc_msgSend(v14, sel_setLeftBarButtonItem_, v13);
            swift_release();

            return;
          }
        }
        else
        {
          swift_release();
        }
      }
    }
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_22C010FBC()
{
  unint64_t result = qword_268497920[0];
  if (!qword_268497920[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_268497920);
  }
  return result;
}

id ViewController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  unsigned int v7 = v6;
  unint64_t v11 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v12 = (void *)sub_22C01E498();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void ViewController.init(title:detailText:icon:contentLayout:)()
{
}

id ViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ViewController);
}

ValueMetadata *type metadata accessor for VoiceMemoMigrator()
{
  return &type metadata for VoiceMemoMigrator;
}

unint64_t sub_22C0113D8()
{
  return 0xD00000000000001FLL;
}

void sub_22C0113F4()
{
}

uint64_t Connection.deinit()
{
  swift_release();

  return v0;
}

uint64_t sub_22C011480()
{
  uint64_t v0 = sub_22C01E278();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  id v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v16[-v5];
  sub_22C01E288();
  uint64_t v7 = *MEMORY[0x263F14208];
  id v8 = (void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 104);
  uint64_t v9 = (void (**)(unsigned char *, uint64_t))(v1 + 8);
  unsigned int v17 = *MEMORY[0x263F14228];
  do
  {
    do
    {
      sub_22C01E298();
      id v10 = *v8;
      (*v8)(v4, v7, v0);
      char v11 = MEMORY[0x230F5B000](v6, v4);
      uint64_t v12 = *v9;
      (*v9)(v4, v0);
      v12(v6, v0);
    }
    while ((v11 & 1) != 0);
    sub_22C01E298();
    v10(v4, v17, v0);
    char v13 = MEMORY[0x230F5B000](v6, v4);
    v12(v4, v0);
    v12(v6, v0);
  }
  while ((v13 & 1) != 0);
  sub_22C01E298();
  v10(v4, *MEMORY[0x263F14200], v0);
  char v14 = MEMORY[0x230F5B000](v6, v4);
  v12(v4, v0);
  v12(v6, v0);
  return v14 & 1;
}

uint64_t sub_22C0116B4(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_22C0116D8, 0, 0);
}

uint64_t sub_22C0116D8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[3];
  uint64_t v3 = swift_allocObject();
  v0[6] = v3;
  swift_weakInit();
  id v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  void *v5 = v0;
  v5[1] = sub_22C011810;
  uint64_t v6 = MEMORY[0x263F8D6C8];
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0x74616428646E6573, 0xEB00000000293A61, sub_22BFFDFB0, v4, v6);
}

uint64_t sub_22C011810()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_22C011950;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_22C011934;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C011934()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_22C011950()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22C0119BC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22C0119F4()
{
  *(void *)(v1 + 32) = v0;
  return MEMORY[0x270FA2498](sub_22C011A14, 0, 0);
}

uint64_t sub_22C011A14()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 40) = v1;
  swift_weakInit();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684976A0);
  void *v2 = v0;
  v2[1] = sub_22C011B2C;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0x2865766965636572, 0xE900000000000029, sub_22BFFDFBC, v1, v3);
}

uint64_t sub_22C011B2C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_22C011C64;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_22C011C48;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22C011C48()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22C011C64()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22C011CC8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v21 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497960);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = sub_22C01E238();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (uint64_t (**)(uint64_t))((char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    v20[1] = *(void *)(result + 16);
    swift_retain();
    swift_release();
    sub_22C01E228();
    v20[0] = sub_22C01E218();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v21, v6);
    uint64_t v14 = *(unsigned __int8 *)(v7 + 80);
    uint64_t v21 = v9;
    unint64_t v15 = a4;
    uint64_t v16 = (v14 + 16) & ~v14;
    uint64_t v17 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v17 + v16, (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    uint64_t v18 = (uint64_t *)(v17 + ((v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v18 = a3;
    v18[1] = v15;
    *uint64_t v12 = sub_22C013084;
    v12[1] = (uint64_t (*)(uint64_t))v17;
    uint64_t v19 = v21;
    (*(void (**)(uint64_t (**)(uint64_t), void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F141E0], v21);
    sub_22BFE67D0(a3, v15);
    sub_22C01E258();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(uint64_t (**)(uint64_t), uint64_t))(v10 + 8))(v12, v19);
  }
  return result;
}

uint64_t sub_22C011F6C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497950);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22C01E398();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C012EC8(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_22C012F30((uint64_t)v9);
    uint64_t v14 = 0;
    switch(a4 >> 62)
    {
      case 1uLL:
        LODWORD(v14) = HIDWORD(a3) - a3;
        if (__OFSUB__(HIDWORD(a3), a3))
        {
          __break(1u);
LABEL_11:
          __break(1u);
          JUMPOUT(0x22C0121ECLL);
        }
        uint64_t v14 = (int)v14;
LABEL_8:
        uint64_t v22 = v14;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268497960);
        uint64_t result = sub_22C01E5D8();
        break;
      case 2uLL:
        uint64_t v19 = *(void *)(a3 + 16);
        uint64_t v18 = *(void *)(a3 + 24);
        BOOL v20 = __OFSUB__(v18, v19);
        uint64_t v14 = v18 - v19;
        if (!v20) {
          goto LABEL_8;
        }
        goto LABEL_11;
      case 3uLL:
        goto LABEL_8;
      default:
        uint64_t v14 = BYTE6(a4);
        goto LABEL_8;
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_22C012F90(&qword_268497958, MEMORY[0x263F14320]);
    uint64_t v15 = swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v16, v13, v10);
    uint64_t v22 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268497960);
    sub_22C01E5C8();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return result;
}

uint64_t sub_22C0121FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497948);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v7 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7 + v6, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    sub_22C01E2B8();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_22C012390(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497950);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22C01E398();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C012EC8(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22C012F30((uint64_t)v10);
    v18[0] = a1;
    v18[1] = a2;
    sub_22BFFDFC4(a1, a2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268497948);
    return sub_22C01E5D8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_22C012F90(&qword_268497958, MEMORY[0x263F14320]);
    uint64_t v16 = swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v17, v14, v11);
    v18[0] = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268497948);
    sub_22C01E5C8();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t Connection.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Connection()
{
  return self;
}

uint64_t method lookup function for Connection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Connection);
}

uint64_t dispatch thunk of Connection.connect()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of Connection.send(data:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_22C012770;
  return v8(a1, a2);
}

uint64_t sub_22C012770(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of Connection.receive()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 136) + **(int **)(*(void *)v0 + 136));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_22C012960;
  return v4();
}

uint64_t sub_22C012960(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_22C012A6C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v14 = a1;
  uint64_t v4 = sub_22C01E638();
  uint64_t v15 = *(void *)(v4 - 8);
  uint64_t v16 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22C01E648();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_22C01E438();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_22C01E208();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  sub_22C01E2C8();
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + 16) = sub_22C01E248();
  sub_22BFE6518();
  sub_22C01E428();
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_22C012F90((unint64_t *)&qword_268497160, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497168);
  sub_22BFE65B0();
  sub_22C01E6B8();
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v6, *MEMORY[0x263F8F138], v16);
  uint64_t v12 = sub_22C01E658();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v9);
  *(void *)(v2 + 24) = v12;
  return v2;
}

uint64_t sub_22C012D90()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497948);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22C012E24(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497948);
  return sub_22C012390(a1, a2, a3, a4, a5);
}

uint64_t sub_22C012EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C012F30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497950);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C012F90(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22C012FD8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497960);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  sub_22BFE6770(*(void *)(v0 + v6), *(void *)(v0 + v6 + 8));
  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

uint64_t sub_22C013084(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268497960) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1 + v4;
  unint64_t v6 = (uint64_t *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  unint64_t v8 = v6[1];
  return sub_22C011F6C(a1, v5, v7, v8);
}

uint64_t sub_22C013128()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DE50);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DE50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_22C0242D0;
  unint64_t v4 = v16 + v3;
  unint64_t v5 = v16 + v3 + v1[14];
  *(void *)(v16 + v3) = 1;
  *(void *)unint64_t v5 = "path";
  *(void *)(v5 + 8) = 4;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_22C01E158();
  unint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "mimeType";
  *(void *)(v9 + 8) = 8;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "size";
  *((void *)v11 + 1) = 4;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "creationDate";
  *((void *)v13 + 1) = 12;
  v13[16] = 2;
  v8();
  uint64_t v14 = v4 + 4 * v2 + v1[14];
  *(void *)(v4 + 4 * v2) = 5;
  *(void *)uint64_t v14 = "modifiedDate";
  *(void *)(v14 + 8) = 12;
  *(unsigned char *)(v14 + 16) = 2;
  v8();
  return sub_22C01E168();
}

uint64_t sub_22C0133A4()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          sub_22C01E018();
          break;
        case 3:
        case 4:
        case 5:
          sub_22C01E038();
          break;
        default:
          break;
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C0134A4()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
    {
      if (!v0[4] || (uint64_t result = sub_22C01E128(), !v1))
      {
        if (!v0[5] || (uint64_t result = sub_22C01E128(), !v1))
        {
          if (!v0[6] || (uint64_t result = sub_22C01E128(), !v1))
          {
            type metadata accessor for File(0);
            return sub_22C01DF38();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_22C0135E8@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[5] = 0;
  a1[6] = 0;
  a1[4] = 0;
  return sub_22C01DF48();
}

uint64_t sub_22C01361C()
{
  return 1701603654;
}

uint64_t sub_22C01362C()
{
  return sub_22C0133A4();
}

uint64_t sub_22C013644()
{
  return sub_22C0134A4();
}

uint64_t sub_22C01365C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C013DA8(&qword_2684979A8, (void (*)(uint64_t))type metadata accessor for File);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C0136D8@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497130, (uint64_t)qword_26849DE50, a1);
}

uint64_t sub_22C0136FC(uint64_t a1)
{
  uint64_t v2 = sub_22C013DA8(&qword_268497990, (void (*)(uint64_t))type metadata accessor for File);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C013768()
{
  sub_22C013DA8(&qword_268497990, (void (*)(uint64_t))type metadata accessor for File);
  return sub_22C01E088();
}

uint64_t sub_22C0137E8()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DE68);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DE68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22C024340;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "files";
  *(void *)(v4 + 8) = 5;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_22C01E158();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_22C01E168();
}

uint64_t sub_22C013944()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        type metadata accessor for File(0);
        sub_22C013DA8(&qword_268497990, (void (*)(uint64_t))type metadata accessor for File);
        sub_22C01E048();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C013A34()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for File(0),
        sub_22C013DA8(&qword_268497990, (void (*)(uint64_t))type metadata accessor for File),
        uint64_t result = sub_22C01E138(),
        !v1))
  {
    type metadata accessor for FileArray(0);
    return sub_22C01DF38();
  }
  return result;
}

uint64_t sub_22C013B20()
{
  return 0x61727241656C6946;
}

uint64_t sub_22C013B3C()
{
  return sub_22C013944();
}

uint64_t sub_22C013B54()
{
  return sub_22C013A34();
}

uint64_t sub_22C013B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C013DA8(&qword_2684979B0, (void (*)(uint64_t))type metadata accessor for FileArray);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C013BE8@<X0>(uint64_t a1@<X8>)
{
  return sub_22BFF29E8(&qword_268497138, (uint64_t)qword_26849DE68, a1);
}

uint64_t sub_22C013C0C(uint64_t a1)
{
  uint64_t v2 = sub_22C013DA8(&qword_268497970, (void (*)(uint64_t))type metadata accessor for FileArray);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C013C78()
{
  sub_22C013DA8(&qword_268497970, (void (*)(uint64_t))type metadata accessor for FileArray);
  return sub_22C01E088();
}

uint64_t sub_22C013CF8()
{
  return sub_22C013DA8(&qword_268497968, (void (*)(uint64_t))type metadata accessor for FileArray);
}

uint64_t type metadata accessor for FileArray(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684979C8);
}

uint64_t sub_22C013D60()
{
  return sub_22C013DA8(&qword_268497970, (void (*)(uint64_t))type metadata accessor for FileArray);
}

uint64_t sub_22C013DA8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22C013DF0()
{
  return sub_22C013DA8(&qword_268497978, (void (*)(uint64_t))type metadata accessor for FileArray);
}

uint64_t sub_22C013E38()
{
  return sub_22C013DA8(&qword_268497980, (void (*)(uint64_t))type metadata accessor for FileArray);
}

uint64_t sub_22C013E80()
{
  return sub_22C013DA8(&qword_268497988, (void (*)(uint64_t))type metadata accessor for File);
}

uint64_t type metadata accessor for File(uint64_t a1)
{
  return sub_22BFF362C(a1, (uint64_t *)&unk_2684979B8);
}

uint64_t sub_22C013EE8()
{
  return sub_22C013DA8(&qword_268497990, (void (*)(uint64_t))type metadata accessor for File);
}

uint64_t sub_22C013F30()
{
  return sub_22C013DA8(&qword_268497998, (void (*)(uint64_t))type metadata accessor for File);
}

uint64_t sub_22C013F78()
{
  return sub_22C013DA8(&qword_2684979A0, (void (*)(uint64_t))type metadata accessor for File);
}

uint64_t sub_22C013FC0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (sub_22BFF382C(*a1, *a2))
  {
    uint64_t v11 = type metadata accessor for FileArray(0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 20), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_22C013DA8(&qword_2684973D8, MEMORY[0x263F50560]);
    char v13 = sub_22C01E488();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_22C014178(char *a1, char *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      if (*((void *)a1 + 4) == *((void *)a2 + 4)
        && *((void *)a1 + 5) == *((void *)a2 + 5)
        && *((void *)a1 + 6) == *((void *)a2 + 6))
      {
        uint64_t v14 = type metadata accessor for File(0);
        uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
        v15(v10, &a1[*(int *)(v14 + 36)], v4);
        v15(v8, &a2[*(int *)(v14 + 36)], v4);
        sub_22C013DA8(&qword_2684973D8, MEMORY[0x263F50560]);
        char v12 = sub_22C01E488();
        uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
        v16(v8, v4);
        v16(v10, v4);
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  return v12 & 1;
}

void *sub_22C014398(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (uint64_t)a2 + v7;
    uint64_t v9 = a1 + v7;
    *(void *)(a1 + 48) = a2[6];
    uint64_t v10 = sub_22C01DF58();
    BOOL v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v9, v8, v10);
  }
  return v3;
}

uint64_t sub_22C0144A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v9 = sub_22C01DF58();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v8, v7, v9);
  return a1;
}

void *sub_22C014558(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_22C01462C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_22C0146B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_22C01DF58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_22C014764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C014778);
}

uint64_t sub_22C014778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C014828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C01483C);
}

uint64_t sub_22C01483C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22C0148E4()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22C014990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C0149A4);
}

uint64_t sub_22C0149A4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C014A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C014A68);
}

void *sub_22C014A68(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    void *result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22C014B10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22BFF628C(v0 + 136, &qword_268497768);
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for Resolver()
{
  return self;
}

uint64_t sub_22C014B84(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_22C01E208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_22C0172D4(&qword_2684979F8);
  swift_bridgeObjectRetain();
  uint64_t v34 = a2;
  uint64_t v11 = sub_22C01E468();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    char v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      uint64_t v21 = v14;
      v14(v9, v20, v6);
      sub_22C0172D4(&qword_268497A00);
      char v22 = sub_22C01E488();
      uint64_t v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      uint64_t v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_22C015268((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_22C014E80()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_22C01E208();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A08);
  uint64_t v5 = sub_22C01E6D8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_22C0172D4(&qword_2684979F8);
      uint64_t result = sub_22C01E468();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_22C015268(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_22C01E208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_22C014E80();
  }
  else
  {
    if (v11 > v10)
    {
      sub_22C0154E0();
      goto LABEL_12;
    }
    sub_22C015784();
  }
  uint64_t v12 = *v3;
  sub_22C0172D4(&qword_2684979F8);
  uint64_t v13 = sub_22C01E468();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_22C0172D4(&qword_268497A00);
      char v21 = sub_22C01E488();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_22C01E7F8();
  __break(1u);
  return result;
}

void *sub_22C0154E0()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_22C01E208();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A08);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_22C01E6C8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_22C015784()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_22C01E208();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A08);
  uint64_t v7 = sub_22C01E6D8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_22C0172D4(&qword_2684979F8);
    uint64_t result = sub_22C01E468();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22C015B20(unint64_t a1)
{
  return sub_22C003D48(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_22C015B34(uint64_t a1)
{
  v2[24] = a1;
  v2[25] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684979E0);
  v2[26] = swift_task_alloc();
  uint64_t v3 = sub_22C01E208();
  v2[27] = v3;
  v2[28] = *(void *)(v3 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  uint64_t v4 = sub_22C01E3F8();
  v2[39] = v4;
  v2[40] = *(void *)(v4 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22C015D00, v1, 0);
}

uint64_t sub_22C015D00()
{
  uint64_t v76 = v0 + 16;
  uint64_t v1 = *(void *)(v0 + 192);
  char v2 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(v0 + 448) = v2;
  uint64_t v3 = 1 << v2;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  uint64_t v6 = swift_beginAccess();
  int64_t v9 = 0;
  *(_DWORD *)(v0 + 440) = *MEMORY[0x263F14110];
  while (v5)
  {
    unint64_t v16 = __clz(__rbit64(v5));
    uint64_t v17 = (v5 - 1) & v5;
    unint64_t v18 = v16 | (v9 << 6);
    uint64_t v6 = *(void *)(v0 + 192);
LABEL_22:
    int64_t v79 = v9;
    unint64_t v80 = v17;
    *(void *)(v0 + 344) = v9;
    *(void *)(v0 + 352) = v17;
    int v24 = *(_DWORD *)(v0 + 440);
    uint64_t v26 = *(void *)(v0 + 328);
    uint64_t v25 = *(void *)(v0 + 336);
    uint64_t v28 = *(void *)(v0 + 312);
    uint64_t v27 = *(void *)(v0 + 320);
    uint64_t v30 = *(void *)(v0 + 296);
    uint64_t v29 = *(void *)(v0 + 304);
    uint64_t v31 = *(void *)(v0 + 216);
    uint64_t v32 = *(void *)(v0 + 224);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v27 + 16))(v25, *(void *)(v6 + 48) + *(void *)(v27 + 72) * v18, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v26, v25, v28);
    sub_22C01E3E8();
    uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
    *(void *)(v0 + 360) = v33;
    *(void *)(v0 + 368) = (v32 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v33(v30, v29, v31);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v32 + 88))(v30, v31) == v24)
    {
      uint64_t v34 = *(uint64_t **)(v0 + 296);
      uint64_t v35 = *(void *)(v0 + 200);
      (*(void (**)(uint64_t *, void))(*(void *)(v0 + 224) + 96))(v34, *(void *)(v0 + 216));
      uint64_t v37 = *v34;
      uint64_t v36 = v34[1];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v37 == *(void *)(v35 + 112) && v36 == *(void *)(v35 + 120)) {
        char v38 = 1;
      }
      else {
        char v38 = sub_22C01E7D8();
      }
      uint64_t v39 = *(void *)(v0 + 296);
      uint64_t v40 = *(void *)(v0 + 304);
      uint64_t v41 = *(void *)(v0 + 288);
      uint64_t v42 = *(void *)(v0 + 216);
      swift_bridgeObjectRelease();
      uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684979E8) + 80);
      *(_DWORD *)(v0 + 444) = v43;
      v33(v41, v40, v42);
      if ((v38 & 1) == 0)
      {
        uint64_t v54 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 224) + 8);
        int64_t v9 = v79;
        goto LABEL_37;
      }
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v44 = *(void *)(v0 + 200);
      uint64_t v45 = *(void *)(v44 + 128);
      if (*(void *)(v45 + 16))
      {
        uint64_t v74 = v43;
        uint64_t v75 = v39;
        sub_22C0172D4(&qword_2684979F8);
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_22C01E468();
        uint64_t v47 = -1 << *(unsigned char *)(v45 + 32);
        unint64_t v48 = v46 & ~v47;
        if (((*(void *)(v45 + 56 + ((v48 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v48) & 1) == 0)
        {
LABEL_35:
          unint64_t v55 = (void (*)(char *, uint64_t, uint64_t))v33;
          swift_bridgeObjectRelease();
          uint64_t v44 = *(void *)(v0 + 200);
          goto LABEL_39;
        }
        uint64_t v77 = ~v47;
        uint64_t v78 = *(void *)(*(void *)(v0 + 224) + 72);
        while (1)
        {
          uint64_t v49 = *(void *)(v0 + 280);
          uint64_t v50 = *(void *)(v0 + 216);
          uint64_t v51 = *(void *)(v0 + 224);
          BOOL v52 = v33;
          v33(v49, *(void *)(v45 + 48) + v48 * v78, v50);
          sub_22C0172D4(&qword_268497A00);
          char v53 = sub_22C01E488();
          uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
          v54(v49, v50);
          if (v53) {
            break;
          }
          unint64_t v48 = (v48 + 1) & v77;
          uint64_t v33 = v52;
          if (((*(void *)(v45 + 56 + ((v48 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v48) & 1) == 0) {
            goto LABEL_35;
          }
        }
        swift_bridgeObjectRelease();
        int64_t v9 = v79;
        uint64_t v43 = v74;
        uint64_t v39 = v75;
LABEL_37:
        uint64_t v56 = v39 + v43;
        uint64_t v57 = *(void *)(v0 + 320);
        uint64_t v58 = *(void *)(v0 + 328);
        uint64_t v60 = *(void *)(v0 + 304);
        uint64_t v59 = *(void *)(v0 + 312);
        uint64_t v61 = *(void *)(v0 + 216);
        v54(*(void *)(v0 + 288), v61);
        v54(v60, v61);
        (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v59);
        uint64_t v6 = sub_22BFF628C(v56, &qword_2684979F0);
        unint64_t v5 = v80;
      }
      else
      {
        unint64_t v55 = (void (*)(char *, uint64_t, uint64_t))v33;
LABEL_39:
        uint64_t v62 = *(void *)(v0 + 304);
        uint64_t v64 = *(void *)(v0 + 280);
        uint64_t v63 = *(void *)(v0 + 288);
        id v65 = *(char **)(v0 + 272);
        uint64_t v67 = *(void *)(v0 + 216);
        uint64_t v66 = *(void *)(v0 + 224);
        uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
        uint64_t v81 = v44 + 136;
        *(void *)(v0 + 376) = v68;
        *(void *)(v0 + 384) = (v66 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v68(v63, v67);
        v55(v65, v62, v67);
        swift_beginAccess();
        sub_22C014B84(v64, v65);
        v68(v64, v67);
        swift_endAccess();
        sub_22C017318(v81, v76);
        if (*(void *)(v0 + 40))
        {
          sub_22C006494(v76, v0 + 56);
          sub_22BFF628C(v76, &qword_268497768);
          *(void *)(v0 + 392) = *__swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
          uint64_t v6 = (uint64_t)sub_22C0164C8;
          uint64_t v7 = 0;
          uint64_t v8 = 0;
          return MEMORY[0x270FA2498](v6, v7, v8);
        }
        uint64_t v70 = *(void *)(v0 + 320);
        uint64_t v69 = *(void *)(v0 + 328);
        uint64_t v71 = *(void *)(v0 + 312);
        v68(*(void *)(v0 + 304), *(void *)(v0 + 216));
        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
        sub_22BFF628C(v76, &qword_268497768);
        uint64_t v6 = sub_22BFF628C(*(void *)(v0 + 296) + *(int *)(v0 + 444), &qword_2684979F0);
        int64_t v9 = *(void *)(v0 + 344);
        unint64_t v5 = *(void *)(v0 + 352);
      }
    }
    else
    {
      uint64_t v10 = *(void *)(v0 + 320);
      uint64_t v11 = *(void *)(v0 + 328);
      uint64_t v12 = *(void *)(v0 + 312);
      uint64_t v13 = *(void *)(v0 + 296);
      uint64_t v14 = *(void *)(v0 + 216);
      unint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v0 + 224) + 8);
      v15(*(void *)(v0 + 304), v14);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
      uint64_t v6 = v15(v13, v14);
      int64_t v9 = v79;
      unint64_t v5 = v80;
    }
  }
  int64_t v19 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_49:
    __break(1u);
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
  int64_t v20 = (unint64_t)((1 << *(unsigned char *)(v0 + 448)) + 63) >> 6;
  uint64_t v6 = *(void *)(v0 + 192);
  if (v19 >= v20) {
    goto LABEL_42;
  }
  uint64_t v21 = v6 + 56;
  unint64_t v22 = *(void *)(v6 + 56 + 8 * v19);
  ++v9;
  if (v22) {
    goto LABEL_21;
  }
  int64_t v9 = v19 + 1;
  if (v19 + 1 >= v20) {
    goto LABEL_42;
  }
  unint64_t v22 = *(void *)(v21 + 8 * v9);
  if (v22) {
    goto LABEL_21;
  }
  int64_t v9 = v19 + 2;
  if (v19 + 2 >= v20) {
    goto LABEL_42;
  }
  unint64_t v22 = *(void *)(v21 + 8 * v9);
  if (v22)
  {
LABEL_21:
    uint64_t v17 = (v22 - 1) & v22;
    unint64_t v18 = __clz(__rbit64(v22)) + (v9 << 6);
    goto LABEL_22;
  }
  int64_t v23 = v19 + 3;
  if (v23 < v20)
  {
    unint64_t v22 = *(void *)(v21 + 8 * v23);
    if (!v22)
    {
      while (1)
      {
        int64_t v9 = v23 + 1;
        if (__OFADD__(v23, 1)) {
          goto LABEL_49;
        }
        if (v9 >= v20) {
          goto LABEL_42;
        }
        unint64_t v22 = *(void *)(v21 + 8 * v9);
        ++v23;
        if (v22) {
          goto LABEL_21;
        }
      }
    }
    int64_t v9 = v23;
    goto LABEL_21;
  }
LABEL_42:
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v72 = *(uint64_t (**)(void))(v0 + 8);
  return v72();
}

uint64_t sub_22C0164C8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 392) + 24);
  *(void *)(v0 + 400) = v1;
  return MEMORY[0x270FA2498](sub_22C0164EC, v1, 0);
}

uint64_t sub_22C0164EC()
{
  uint64_t v1 = *(void *)(v0 + 400);
  (*(void (**)(void, void, void))(v0 + 360))(*(void *)(v0 + 264), *(void *)(v0 + 304), *(void *)(v0 + 216));
  char v2 = (unint64_t *)(v1 + 112);
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 112);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 112) = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v3 = sub_22C003D48(0, *(void *)(v3 + 16) + 1, 1, v3);
    unint64_t *v2 = v3;
  }
  unint64_t v6 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  if (v6 >= v5 >> 1)
  {
    unint64_t v3 = sub_22C003D48(v5 > 1, v6 + 1, 1, v3);
    unint64_t *v2 = v3;
  }
  unint64_t v7 = *(void *)(v0 + 264);
  uint64_t v8 = *(void *)(v0 + 216);
  uint64_t v9 = *(void *)(v0 + 224);
  uint64_t v11 = *(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 32);
  v9 += 32;
  uint64_t v10 = v11;
  *(void *)(v3 + 16) = v6 + 1;
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 48);
  uint64_t v13 = *(void *)(v9 + 40);
  v11(v3 + v12 + v13 * v6, v7, v8);
  unint64_t v14 = *v2;
  if (*(void *)(*v2 + 16))
  {
    uint64_t v15 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t *v2 = v14;
    if (v15)
    {
      uint64_t v18 = *(void *)(v14 + 16);
      if (v18)
      {
LABEL_8:
        unint64_t v20 = *(void *)(v0 + 240);
        unint64_t v19 = *(void *)(v0 + 248);
        uint64_t v21 = *(void *)(v0 + 216);
        uint64_t v34 = v2;
        uint64_t v35 = *(void *)(v0 + 208);
        uint64_t v22 = v18 - 1;
        v10(v20, v14 + v12 + (v18 - 1) * v13, v21);
        *(void *)(v14 + 16) = v22;
        unint64_t *v34 = v14;
        v10(v19, v20, v21);
        v10(v35, v19, v21);
        uint64_t v23 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v15 = sub_22C015B20(v14);
      unint64_t v14 = v15;
      unint64_t *v2 = v15;
      uint64_t v18 = *(void *)(v15 + 16);
      if (v18) {
        goto LABEL_8;
      }
    }
    __break(1u);
    return MEMORY[0x270FA2498](v15, v16, v17);
  }
  uint64_t v23 = 1;
LABEL_10:
  uint64_t v24 = *(void *)(v0 + 216);
  uint64_t v25 = *(void *)(v0 + 224);
  uint64_t v26 = *(void *)(v0 + 208);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v26, v23, 1, v24);
  swift_endAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v26, 1, v24) == 1)
  {
    sub_22BFF628C(*(void *)(v0 + 208), &qword_2684979E0);
    uint64_t v16 = *(void *)(v0 + 200);
    uint64_t v15 = (uint64_t)sub_22C016B60;
    uint64_t v17 = 0;
    return MEMORY[0x270FA2498](v15, v16, v17);
  }
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 360);
  uint64_t v28 = *(void *)(v0 + 256);
  unint64_t v29 = *(void *)(v0 + 232);
  uint64_t v30 = *(void *)(v0 + 216);
  v10(v28, *(void *)(v0 + 208), v30);
  v27(v29, v28, v30);
  type metadata accessor for HTTPClient();
  uint64_t v31 = swift_allocObject();
  *(void *)(v0 + 408) = v31;
  *(void *)(v31 + OBJC_IVAR____TtC12MigrationKit10HTTPClient_connection) = 0;
  v10(v31 + OBJC_IVAR____TtC12MigrationKit10HTTPClient_endpoint, v29, v30);
  uint64_t v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v32;
  void *v32 = v0;
  v32[1] = sub_22C016868;
  return sub_22BFFC548(0x696669747265632FLL, 0xEC00000065746163);
}

uint64_t sub_22C016868(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 424) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v5 = sub_22C016A0C;
  }
  else
  {
    *(void *)(v4 + 432) = a1;
    unint64_t v5 = sub_22C016990;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_22C016990()
{
  objc_msgSend(*(id *)(*(void *)(v0 + 432) + 16), sel_statusCode);
  swift_release();
  uint64_t v1 = *(void *)(v0 + 400);
  return MEMORY[0x270FA2498](sub_22C016A74, v1, 0);
}

uint64_t sub_22C016A0C()
{
  uint64_t v1 = *(void *)(v0 + 400);
  return MEMORY[0x270FA2498](sub_22C016A74, v1, 0);
}

uint64_t sub_22C016A74()
{
  uint64_t v1 = v0[51];
  char v2 = (void (*)(uint64_t, uint64_t))v0[47];
  uint64_t v3 = v0[32];
  uint64_t v4 = v0[27];
  swift_setDeallocating();
  v2(v1 + OBJC_IVAR____TtC12MigrationKit10HTTPClient_endpoint, v4);
  swift_release();
  swift_deallocClassInstance();
  v2(v3, v4);
  uint64_t v5 = v0[25];
  return MEMORY[0x270FA2498](sub_22C016B60, v5, 0);
}

uint64_t sub_22C016B60()
{
  uint64_t v76 = v0 + 16;
  uint64_t v2 = *(void *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 312);
  (*(void (**)(void, void))(v0 + 376))(*(void *)(v0 + 304), *(void *)(v0 + 216));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v75 = (void *)(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
LABEL_2:
  uint64_t v4 = (uint64_t (*)())sub_22BFF628C(*(void *)(v0 + 296) + *(int *)(v0 + 444), &qword_2684979F0);
  int64_t v8 = *(void *)(v0 + 344);
  unint64_t v7 = *(void *)(v0 + 352);
  while (1)
  {
    if (v7)
    {
      unint64_t v15 = __clz(__rbit64(v7));
      uint64_t v16 = (v7 - 1) & v7;
      unint64_t v17 = v15 | (v8 << 6);
      uint64_t v4 = *(uint64_t (**)())(v0 + 192);
      goto LABEL_21;
    }
    int64_t v18 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_48:
      __break(1u);
      return MEMORY[0x270FA2498](v4, v5, v6);
    }
    int64_t v19 = (unint64_t)((1 << *(unsigned char *)(v0 + 448)) + 63) >> 6;
    uint64_t v4 = *(uint64_t (**)())(v0 + 192);
    if (v18 >= v19) {
      goto LABEL_41;
    }
    unint64_t v20 = (char *)v4 + 56;
    unint64_t v21 = *((void *)v4 + v18 + 7);
    ++v8;
    if (!v21)
    {
      int64_t v8 = v18 + 1;
      if (v18 + 1 >= v19) {
        goto LABEL_41;
      }
      unint64_t v21 = *(void *)&v20[8 * v8];
      if (!v21)
      {
        int64_t v8 = v18 + 2;
        if (v18 + 2 >= v19) {
          goto LABEL_41;
        }
        unint64_t v21 = *(void *)&v20[8 * v8];
        if (!v21) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v16 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v8 << 6);
LABEL_21:
    unint64_t v79 = v16;
    int64_t v80 = v8;
    *(void *)(v0 + 344) = v8;
    *(void *)(v0 + 352) = v16;
    int v23 = *(_DWORD *)(v0 + 440);
    uint64_t v24 = *(void *)(v0 + 328);
    uint64_t v25 = *(void *)(v0 + 336);
    uint64_t v27 = *(void *)(v0 + 312);
    uint64_t v26 = *(void *)(v0 + 320);
    uint64_t v28 = *(void *)(v0 + 296);
    uint64_t v29 = *(void *)(v0 + 304);
    uint64_t v30 = *(void *)(v0 + 216);
    uint64_t v31 = *(void *)(v0 + 224);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v26 + 16))(v25, *((void *)v4 + 6) + *(void *)(v26 + 72) * v17, v27);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v24, v25, v27);
    sub_22C01E3E8();
    uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
    *(void *)(v0 + 360) = v32;
    *(void *)(v0 + 368) = (v31 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v32(v28, v29, v30);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v31 + 88))(v28, v30) == v23)
    {
      uint64_t v33 = *(uint64_t **)(v0 + 296);
      uint64_t v34 = *(void *)(v0 + 200);
      (*(void (**)(uint64_t *, void))(*(void *)(v0 + 224) + 96))(v33, *(void *)(v0 + 216));
      uint64_t v35 = *v33;
      uint64_t v36 = v33[1];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v35 == *(void *)(v34 + 112) && v36 == *(void *)(v34 + 120))
      {
        uint64_t v37 = v32;
        char v38 = 1;
      }
      else
      {
        uint64_t v37 = v32;
        char v38 = sub_22C01E7D8();
      }
      uint64_t v40 = *(void *)(v0 + 296);
      uint64_t v39 = *(void *)(v0 + 304);
      uint64_t v41 = *(void *)(v0 + 288);
      uint64_t v42 = *(void *)(v0 + 216);
      swift_bridgeObjectRelease();
      uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684979E8) + 80);
      *(_DWORD *)(v0 + 444) = v43;
      v37(v41, v39, v42);
      if (v38)
      {
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v44 = *(void *)(v0 + 200);
        uint64_t v45 = *(void *)(v44 + 128);
        uint64_t v82 = (void (*)(char *, uint64_t, uint64_t))v37;
        if (!*(void *)(v45 + 16)) {
          goto LABEL_39;
        }
        uint64_t v77 = v43;
        uint64_t v78 = v40;
        sub_22C0172D4(&qword_2684979F8);
        swift_bridgeObjectRetain();
        uint64_t v46 = sub_22C01E468();
        uint64_t v47 = -1 << *(unsigned char *)(v45 + 32);
        unint64_t v48 = v46 & ~v47;
        uint64_t v49 = v45 + 56;
        if (((*(void *)(v45 + 56 + ((v48 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v48) & 1) == 0)
        {
LABEL_38:
          swift_bridgeObjectRelease();
          uint64_t v44 = *(void *)(v0 + 200);
LABEL_39:
          uint64_t v62 = *(void *)(v0 + 304);
          uint64_t v64 = *(void *)(v0 + 280);
          uint64_t v63 = *(void *)(v0 + 288);
          id v65 = *(char **)(v0 + 272);
          uint64_t v67 = *(void *)(v0 + 216);
          uint64_t v66 = *(void *)(v0 + 224);
          uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
          uint64_t v69 = v44 + 136;
          *(void *)(v0 + 376) = v68;
          *(void *)(v0 + 384) = (v66 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          v68(v63, v67);
          v82(v65, v62, v67);
          swift_beginAccess();
          sub_22C014B84(v64, v65);
          v68(v64, v67);
          swift_endAccess();
          sub_22C017318(v69, v76);
          if (!*(void *)(v0 + 40))
          {
            uint64_t v71 = *(void *)(v0 + 320);
            uint64_t v70 = *(void *)(v0 + 328);
            uint64_t v72 = *(void *)(v0 + 312);
            v68(*(void *)(v0 + 304), *(void *)(v0 + 216));
            (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v72);
            sub_22BFF628C(v76, &qword_268497768);
            goto LABEL_2;
          }
          sub_22C006494(v76, (uint64_t)v75);
          sub_22BFF628C(v76, &qword_268497768);
          *(void *)(v0 + 392) = *__swift_project_boxed_opaque_existential_1(v75, *(void *)(v0 + 80));
          uint64_t v4 = sub_22C0164C8;
          uint64_t v5 = 0;
          uint64_t v6 = 0;
          return MEMORY[0x270FA2498](v4, v5, v6);
        }
        uint64_t v81 = ~v47;
        uint64_t v50 = *(void *)(*(void *)(v0 + 224) + 72);
        while (1)
        {
          uint64_t v51 = *(char **)(v0 + 280);
          uint64_t v53 = *(void *)(v0 + 216);
          uint64_t v52 = *(void *)(v0 + 224);
          uint64_t v54 = v45;
          v82(v51, *(void *)(v45 + 48) + v48 * v50, v53);
          sub_22C0172D4(&qword_268497A00);
          char v55 = sub_22C01E488();
          uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
          v56((uint64_t)v51, v53);
          if (v55) {
            break;
          }
          unint64_t v48 = (v48 + 1) & v81;
          uint64_t v45 = v54;
          if (((*(void *)(v49 + ((v48 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v48) & 1) == 0) {
            goto LABEL_38;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v43 = v77;
        uint64_t v40 = v78;
      }
      else
      {
        uint64_t v56 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 224) + 8);
      }
      uint64_t v58 = *(void *)(v0 + 320);
      uint64_t v57 = *(void *)(v0 + 328);
      uint64_t v60 = *(void *)(v0 + 304);
      uint64_t v59 = *(void *)(v0 + 312);
      uint64_t v61 = *(void *)(v0 + 216);
      v56(*(void *)(v0 + 288), v61);
      v56(v60, v61);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
      uint64_t v4 = (uint64_t (*)())sub_22BFF628C(v40 + v43, &qword_2684979F0);
    }
    else
    {
      uint64_t v10 = *(void *)(v0 + 320);
      uint64_t v9 = *(void *)(v0 + 328);
      uint64_t v11 = *(void *)(v0 + 312);
      uint64_t v12 = *(void *)(v0 + 296);
      uint64_t v13 = *(void *)(v0 + 216);
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v0 + 224) + 8);
      v14(*(void *)(v0 + 304), v13);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
      uint64_t v4 = (uint64_t (*)())v14(v12, v13);
    }
    unint64_t v7 = v79;
    int64_t v8 = v80;
  }
  int64_t v22 = v18 + 3;
  if (v22 < v19)
  {
    unint64_t v21 = *(void *)&v20[8 * v22];
    if (!v21)
    {
      while (1)
      {
        int64_t v8 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          goto LABEL_48;
        }
        if (v8 >= v19) {
          goto LABEL_41;
        }
        unint64_t v21 = *(void *)&v20[8 * v8];
        ++v22;
        if (v21) {
          goto LABEL_20;
        }
      }
    }
    int64_t v8 = v22;
    goto LABEL_20;
  }
LABEL_41:
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v73 = *(uint64_t (**)(void))(v0 + 8);
  return v73();
}

uint64_t sub_22C0172D4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22C01E208();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22C017318(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22C017380(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A28);
  uint64_t v2 = sub_22C01E788();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22C019F54(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22C0188FC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_22C006590(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_22C0174B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A10);
  uint64_t v2 = (void *)sub_22C01E788();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_22C0188FC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_22C0175D4()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for HTTPHeaders();
  id v1 = objc_msgSendSuper2(&v8, sel_init);
  uint64_t v2 = (void *)sub_22C01E498();
  objc_msgSend(v1, sel_setMethod_, v2);

  uint64_t v3 = (void *)sub_22C01E498();
  objc_msgSend(v1, sel_setPath_, v3);

  uint64_t v4 = (void *)sub_22C01E498();
  objc_msgSend(v1, sel_setVersion_, v4);

  uint64_t v5 = (void *)sub_22C01E498();
  objc_msgSend(v1, sel_setContentType_, v5);

  uint64_t v6 = (void *)sub_22C01E498();
  objc_msgSend(v1, sel_setConnection_, v6);

  return v1;
}

uint64_t sub_22C017734(void *a1)
{
  uint64_t v3 = (void *)sub_22C01E598();
  v41.receiver = v1;
  v41.super_class = (Class)type metadata accessor for HTTPHeaders();
  id v4 = objc_msgSendSuper2(&v41, sel_initWithArray_, v3);

  id v5 = v4;
  uint64_t v6 = (void *)sub_22C01E498();
  objc_msgSend(v5, sel_setPath_, v6);

  sub_22C0174B0(MEMORY[0x263F8EE78]);
  uint64_t v7 = (void *)sub_22C01E448();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setQuery_, v7);

  objc_super v8 = (void *)sub_22C01E498();
  objc_msgSend(v5, sel_setMethod_, v8);

  uint64_t v9 = (void *)sub_22C01E498();
  objc_msgSend(v5, sel_setVersion_, v9);

  objc_msgSend(v5, sel_setStatusCode_, 505);
  if (!a1[2]) {
    goto LABEL_13;
  }
  uint64_t v10 = a1[4];
  uint64_t v11 = a1[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = v10;
  uint64_t v40 = v11;
  sub_22C009A98();
  uint64_t v12 = (void *)sub_22C01E698();
  swift_bridgeObjectRelease();
  if (v12[2] != 3)
  {
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_44:

    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setVersion_, v13);

  if (v12[2] < 2uLL)
  {
    __break(1u);
LABEL_65:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  uint64_t v15 = v12[6];
  unint64_t v14 = v12[7];
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v17 = HIBYTE(v14) & 0xF;
  uint64_t v18 = v15 & 0xFFFFFFFFFFFFLL;
  if ((v14 & 0x2000000000000000) != 0) {
    uint64_t v19 = HIBYTE(v14) & 0xF;
  }
  else {
    uint64_t v19 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (!v19) {
    goto LABEL_65;
  }
  if ((v14 & 0x1000000000000000) != 0)
  {
    unint64_t v21 = (unint64_t)sub_22C018EC0(v15, v14, 10);
    char v23 = v38;
    goto LABEL_41;
  }
  if ((v14 & 0x2000000000000000) == 0)
  {
    if ((v15 & 0x1000000000000000) != 0) {
      unint64_t v20 = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unint64_t v20 = (unsigned __int8 *)sub_22C01E718();
    }
    unint64_t v21 = (unint64_t)sub_22C018FA8(v20, v18, 10);
    char v23 = v22 & 1;
LABEL_41:
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
LABEL_43:
      objc_msgSend(v5, sel_setStatusCode_, v21);
      goto LABEL_44;
    }
LABEL_42:
    unint64_t v21 = 200;
    goto LABEL_43;
  }
  uint64_t v39 = v15;
  uint64_t v40 = v14 & 0xFFFFFFFFFFFFFFLL;
  if (v15 == 43)
  {
    if (v17)
    {
      if (v17 != 1 && (BYTE1(v15) - 48) <= 9u)
      {
        unint64_t v21 = (BYTE1(v15) - 48);
        if (v17 == 2) {
          goto LABEL_40;
        }
        if ((BYTE2(v15) - 48) <= 9u)
        {
          unint64_t v21 = 10 * (BYTE1(v15) - 48) + (BYTE2(v15) - 48);
          uint64_t v27 = v17 - 3;
          if (v27)
          {
            uint64_t v28 = (unsigned __int8 *)&v39 + 3;
            while (1)
            {
              unsigned int v29 = *v28 - 48;
              if (v29 > 9) {
                goto LABEL_37;
              }
              if (!is_mul_ok(v21, 0xAuLL)) {
                goto LABEL_37;
              }
              BOOL v25 = __CFADD__(10 * v21, v29);
              unint64_t v21 = 10 * v21 + v29;
              if (v25) {
                goto LABEL_37;
              }
              char v23 = 0;
              ++v28;
              if (!--v27) {
                goto LABEL_41;
              }
            }
          }
          goto LABEL_40;
        }
      }
      goto LABEL_37;
    }
  }
  else
  {
    if (v15 != 45)
    {
      if (v17 && (v15 - 48) <= 9u)
      {
        unint64_t v21 = (v15 - 48);
        if (v17 == 1) {
          goto LABEL_40;
        }
        if ((BYTE1(v15) - 48) <= 9u)
        {
          unint64_t v21 = 10 * (v15 - 48) + (BYTE1(v15) - 48);
          uint64_t v30 = v17 - 2;
          if (v30)
          {
            uint64_t v31 = (unsigned __int8 *)&v39 + 2;
            while (1)
            {
              unsigned int v32 = *v31 - 48;
              if (v32 > 9) {
                goto LABEL_37;
              }
              if (!is_mul_ok(v21, 0xAuLL)) {
                goto LABEL_37;
              }
              BOOL v25 = __CFADD__(10 * v21, v32);
              unint64_t v21 = 10 * v21 + v32;
              if (v25) {
                goto LABEL_37;
              }
              char v23 = 0;
              ++v31;
              if (!--v30) {
                goto LABEL_41;
              }
            }
          }
          goto LABEL_40;
        }
      }
LABEL_37:
      unint64_t v21 = 0;
LABEL_38:
      char v23 = 1;
      goto LABEL_41;
    }
    if (v17)
    {
      if (v17 != 1)
      {
        unsigned __int8 v24 = BYTE1(v15) - 48;
        if ((BYTE1(v15) - 48) <= 9u)
        {
          unint64_t v21 = 0;
          BOOL v25 = v24 == 0;
          unint64_t v26 = -(uint64_t)v24;
          if (!v25) {
            goto LABEL_38;
          }
          if (v17 == 2)
          {
            char v23 = 0;
            unint64_t v21 = v26;
            goto LABEL_41;
          }
          unsigned __int8 v33 = BYTE2(v15) - 48;
          if ((BYTE2(v15) - 48) <= 9u && is_mul_ok(v26, 0xAuLL))
          {
            unint64_t v34 = 10 * v26;
            unint64_t v21 = v34 - v33;
            if (v34 >= v33)
            {
              uint64_t v35 = v17 - 3;
              if (v35)
              {
                uint64_t v36 = (unsigned __int8 *)&v39 + 3;
                while (1)
                {
                  unsigned int v37 = *v36 - 48;
                  if (v37 > 9) {
                    goto LABEL_37;
                  }
                  if (!is_mul_ok(v21, 0xAuLL)) {
                    goto LABEL_37;
                  }
                  BOOL v25 = 10 * v21 >= v37;
                  unint64_t v21 = 10 * v21 - v37;
                  if (!v25) {
                    goto LABEL_37;
                  }
                  char v23 = 0;
                  ++v36;
                  if (!--v35) {
                    goto LABEL_41;
                  }
                }
              }
LABEL_40:
              char v23 = 0;
              goto LABEL_41;
            }
          }
        }
      }
      goto LABEL_37;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22C017C64()
{
  id v1 = v0;
  uint64_t v2 = sub_22C01DDE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v61 = xmmword_22C026150;
  id v6 = objc_msgSend(v0, sel_path);
  id v7 = (id)sub_22C01E4A8();
  unint64_t v9 = v8;

  id v59 = v7;
  unint64_t v60 = v9;
  sub_22C01DDD8();
  sub_22C009A98();
  sub_22C01E6A8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v1, sel_method);
  id v11 = (id)sub_22C01E4A8();
  unint64_t v13 = v12;

  id v59 = v11;
  unint64_t v60 = v13;
  sub_22C01E508();
  sub_22C01E508();
  swift_bridgeObjectRelease();
  sub_22C01E508();
  id v14 = objc_msgSend(v1, sel_version);
  sub_22C01E4A8();

  sub_22C01E508();
  swift_bridgeObjectRelease();
  sub_22C01E708();
  sub_22C01E508();
  swift_bridgeObjectRelease();
  sub_22C018254((uint64_t)v59, v60);
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v1, sel_contentType);
  uint64_t v16 = sub_22C01E4A8();
  uint64_t v18 = v17;

  id v19 = (id)MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  id v59 = v19;
  sub_22C019A38(v16, v18, 0x2D746E65746E6F43, 0xEC00000065707954, isUniquelyReferenced_nonNull_native);
  id v21 = v59;
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v1, sel_connection);
  uint64_t v23 = sub_22C01E4A8();
  uint64_t v25 = v24;

  char v26 = swift_isUniquelyReferenced_nonNull_native();
  id v59 = v21;
  sub_22C019A38(v23, v25, 0x697463656E6E6F43, 0xEA00000000006E6FLL, v26);
  id v27 = v59;
  swift_bridgeObjectRelease();
  id v59 = objc_msgSend(v1, sel_contentLength);
  uint64_t v28 = sub_22C01E7B8();
  uint64_t v30 = v29;
  char v31 = swift_isUniquelyReferenced_nonNull_native();
  id v59 = v27;
  sub_22C019A38(v28, v30, 0x2D746E65746E6F43, 0xEE006874676E654CLL, v31);
  id v32 = v59;
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v1, sel_contentRange);
  id v34 = objc_msgSend(v33, sel_value);

  uint64_t v35 = sub_22C01E4A8();
  uint64_t v37 = v36;

  char v38 = swift_isUniquelyReferenced_nonNull_native();
  id v59 = v32;
  sub_22C019A38(v35, v37, 0x2D746E65746E6F43, 0xED000065676E6152, v38);
  uint64_t v39 = v59;
  uint64_t result = swift_bridgeObjectRelease();
  int64_t v41 = 0;
  uint64_t v42 = v39 + 64;
  uint64_t v43 = 1 << v39[32];
  uint64_t v44 = -1;
  if (v43 < 64) {
    uint64_t v44 = ~(-1 << v43);
  }
  unint64_t v45 = v44 & *((void *)v39 + 8);
  int64_t v46 = (unint64_t)(v43 + 63) >> 6;
  while (1)
  {
    if (v45)
    {
      unint64_t v47 = __clz(__rbit64(v45));
      v45 &= v45 - 1;
      unint64_t v48 = v47 | (v41 << 6);
      goto LABEL_20;
    }
    int64_t v49 = v41 + 1;
    if (__OFADD__(v41, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v49 >= v46) {
      goto LABEL_24;
    }
    unint64_t v50 = *(void *)&v42[8 * v49];
    ++v41;
    if (!v50)
    {
      int64_t v41 = v49 + 1;
      if (v49 + 1 >= v46) {
        goto LABEL_24;
      }
      unint64_t v50 = *(void *)&v42[8 * v41];
      if (!v50)
      {
        int64_t v41 = v49 + 2;
        if (v49 + 2 >= v46) {
          goto LABEL_24;
        }
        unint64_t v50 = *(void *)&v42[8 * v41];
        if (!v50) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v45 = (v50 - 1) & v50;
    unint64_t v48 = __clz(__rbit64(v50)) + (v41 << 6);
LABEL_20:
    uint64_t v52 = (uint64_t *)(*((void *)v39 + 7) + 16 * v48);
    uint64_t v54 = *v52;
    unint64_t v53 = v52[1];
    uint64_t v55 = HIBYTE(v53) & 0xF;
    if ((v53 & 0x2000000000000000) == 0) {
      uint64_t v55 = v54 & 0xFFFFFFFFFFFFLL;
    }
    if (v55)
    {
      unint64_t v56 = *(void *)(*((void *)v39 + 6) + 16 * v48 + 8);
      id v59 = *(id *)(*((void *)v39 + 6) + 16 * v48);
      unint64_t v60 = v56;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22C01E508();
      sub_22C01E508();
      swift_bridgeObjectRelease();
      sub_22C01E708();
      sub_22C01E508();
      swift_bridgeObjectRelease();
      sub_22C018254((uint64_t)v59, v60);
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v51 = v49 + 3;
  if (v51 >= v46)
  {
LABEL_24:
    swift_release();
    uint64_t v57 = sub_22C01E708();
    sub_22C018254(v57, v58);
    swift_bridgeObjectRelease();
    return v61;
  }
  unint64_t v50 = *(void *)&v42[8 * v51];
  if (v50)
  {
    int64_t v41 = v51;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v41 = v51 + 1;
    if (__OFADD__(v51, 1)) {
      break;
    }
    if (v41 >= v46) {
      goto LABEL_24;
    }
    unint64_t v50 = *(void *)&v42[8 * v41];
    ++v51;
    if (v50) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_22C018254(uint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A18);
  if (swift_dynamicCast())
  {
    sub_22C006590(v39, (uint64_t)&v41);
    uint64_t v3 = __swift_project_boxed_opaque_existential_1(&v41, v43);
    MEMORY[0x270FA5388](v3);
    sub_22C01DE48();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
  }
  uint64_t v40 = 0;
  memset(v39, 0, sizeof(v39));
  sub_22C019D7C((uint64_t)v39);
  unint64_t result = sub_22C018E28(a1, a2);
  if ((result & 1) == 0) {
    return result;
  }
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_62;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
LABEL_8:
  uint64_t v6 = *v2;
  unint64_t v7 = v2[1];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  switch(v7 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v6), v6)) {
        goto LABEL_69;
      }
      uint64_t v9 = HIDWORD(v6) - (int)v6;
      uint64_t v8 = v6 >> 32;
LABEL_13:
      if (__OFADD__(v8, v5))
      {
        __break(1u);
        goto LABEL_64;
      }
      if (v8 + v5 < v8)
      {
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      if (v8 < 0)
      {
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      uint64_t v12 = sub_22C01DED8();
      MEMORY[0x270FA5388](v12);
      unint64_t v13 = (unint64_t)sub_22C018A58((void *(*)(uint64_t *__return_ptr, char *, char *))sub_22C019DDC);
      uint64_t v17 = v14;
      if (v16 != v5)
      {
        uint64_t v29 = *v2;
        unint64_t v30 = v2[1];
        uint64_t v31 = 0;
        switch(v30 >> 62)
        {
          case 1uLL:
            uint64_t v31 = (int)v29;
            break;
          case 2uLL:
            uint64_t v31 = *(void *)(v29 + 16);
            break;
          default:
            break;
        }
        BOOL v32 = __OFADD__(v31, v9);
        uint64_t v33 = v31 + v9;
        if (!v32)
        {
          if (!__OFADD__(v33, v16))
          {
            uint64_t v34 = 0;
            switch(v30 >> 62)
            {
              case 1uLL:
                uint64_t v34 = v29 >> 32;
                break;
              case 2uLL:
                uint64_t v34 = *(void *)(v29 + 24);
                break;
              case 3uLL:
                break;
              default:
                uint64_t v34 = BYTE6(v30);
                break;
            }
            if (v34 >= v33 + v16)
            {
              sub_22C01DEE8();
              return swift_bridgeObjectRelease();
            }
LABEL_68:
            __break(1u);
LABEL_69:
            __break(1u);
LABEL_70:
            __break(1u);
          }
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      uint64_t v18 = v13;
      unint64_t v19 = v15;
      if ((v14 & 0x2000000000000000) != 0) {
        unint64_t v20 = HIBYTE(v14) & 0xF;
      }
      else {
        unint64_t v20 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)v39 + 7) = 0;
      *(void *)&v39[0] = 0;
      if (4 * v20 != v15 >> 14)
      {
        LOBYTE(v21) = 0;
        uint64_t v22 = (v13 >> 59) & 1;
        if ((v14 & 0x1000000000000000) == 0) {
          LOBYTE(v22) = 1;
        }
        uint64_t v23 = 4 << v22;
        uint64_t v35 = (v14 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v36 = v14 & 0xFFFFFFFFFFFFFFLL;
        while (1)
        {
          unint64_t v24 = v19 & 0xC;
          unint64_t v25 = v19;
          if (v24 == v23) {
            unint64_t v25 = sub_22C018880(v19, v18, v17);
          }
          unint64_t v26 = v25 >> 16;
          if (v25 >> 16 >= v20)
          {
            __break(1u);
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
LABEL_62:
            uint64_t v5 = sub_22C01E518();
            goto LABEL_8;
          }
          if ((v17 & 0x1000000000000000) != 0)
          {
            char v28 = sub_22C01E558();
            if (v24 != v23) {
              goto LABEL_35;
            }
          }
          else if ((v17 & 0x2000000000000000) != 0)
          {
            uint64_t v41 = v18;
            uint64_t v42 = v36;
            char v28 = *((unsigned char *)&v41 + v26);
            if (v24 != v23) {
              goto LABEL_35;
            }
          }
          else
          {
            uint64_t v27 = v35;
            if ((v18 & 0x1000000000000000) == 0) {
              uint64_t v27 = sub_22C01E718();
            }
            char v28 = *(unsigned char *)(v27 + v26);
            if (v24 != v23)
            {
LABEL_35:
              if ((v17 & 0x1000000000000000) != 0) {
                goto LABEL_39;
              }
              goto LABEL_36;
            }
          }
          unint64_t v19 = sub_22C018880(v19, v18, v17);
          if ((v17 & 0x1000000000000000) != 0)
          {
LABEL_39:
            if (v20 <= v19 >> 16) {
              goto LABEL_61;
            }
            unint64_t v19 = sub_22C01E528();
            goto LABEL_41;
          }
LABEL_36:
          unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_41:
          *((unsigned char *)v39 + v21) = v28;
          unsigned int v21 = v21 + 1;
          if ((v21 >> 8)) {
            goto LABEL_60;
          }
          BYTE14(v39[0]) = v21;
          if (v21 == 14)
          {
            uint64_t v41 = *(void *)&v39[0];
            LODWORD(v42) = DWORD2(v39[0]);
            WORD2(v42) = WORD6(v39[0]);
            sub_22C01DEF8();
            LOBYTE(v21) = 0;
            BYTE14(v39[0]) = 0;
          }
          if (4 * v20 == v19 >> 14)
          {
            if ((_BYTE)v21)
            {
              uint64_t v41 = *(void *)&v39[0];
              LODWORD(v42) = DWORD2(v39[0]);
              WORD2(v42) = WORD6(v39[0]);
              sub_22C01DEF8();
            }
            return swift_bridgeObjectRelease();
          }
        }
      }
      return swift_bridgeObjectRelease();
    case 2uLL:
      uint64_t v11 = v6 + 16;
      uint64_t v10 = *(void *)(v6 + 16);
      uint64_t v8 = *(void *)(v11 + 8);
      uint64_t v9 = v8 - v10;
      if (!__OFSUB__(v8, v10)) {
        goto LABEL_13;
      }
      goto LABEL_70;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v8 = BYTE6(v7);
      uint64_t v9 = BYTE6(v7);
      goto LABEL_13;
  }
}

id sub_22C0187C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HTTPHeaders();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HTTPHeaders()
{
  return self;
}

void *sub_22C018818(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497798);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22C018880(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22C01E568();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x230F5B2D0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_22C0188FC(uint64_t a1, uint64_t a2)
{
  sub_22C01E868();
  sub_22C01E4F8();
  uint64_t v4 = sub_22C01E878();
  return sub_22C018974(a1, a2, v4);
}

unint64_t sub_22C018974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22C01E7D8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22C01E7D8() & 1) == 0);
    }
  }
  return v6;
}

char *sub_22C018A58(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)id v1 = xmmword_22C026150;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_22C01DE08() && __OFSUB__((int)v4, sub_22C01DE28())) {
        goto LABEL_24;
      }
      sub_22C01DE38();
      swift_allocObject();
      uint64_t v13 = sub_22C01DDF8();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      unint64_t result = sub_22C018D5C((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_22C01DE88();
      unint64_t result = sub_22C018D5C(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

char *sub_22C018D5C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)sub_22C01DE08();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  unint64_t result = (char *)sub_22C01DE28();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_22C01DE18();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

unsigned __int8 *sub_22C018E10(unsigned __int8 *a1, uint64_t a2, int64_t a3)
{
  return sub_22C018FA8(a1, a2, a3);
}

unint64_t sub_22C018E28(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 & 0x1000000000000000;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
      sub_22C01E718();
    }
    sub_22C01DEF8();
  }
  return v2 >> 60;
}

unsigned __int8 *sub_22C018EC0(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22C01E578();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22C019224();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_22C01E718();
  }
LABEL_7:
  uint64_t v11 = sub_22C018FA8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_22C018FA8(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            unint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
              }
              char v30 = -87;
            }
            else
            {
              char v30 = -55;
            }
          }
          else
          {
            char v30 = -48;
          }
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
        }
        char v22 = -87;
      }
      else
      {
        char v22 = -55;
      }
    }
    else
    {
      char v22 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22C019224()
{
  unint64_t v0 = sub_22C01E588();
  uint64_t v4 = sub_22C0192A4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22C0192A4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_22C0193FC(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22C018818(v9, 0);
      unint64_t v12 = sub_22C0194FC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22C01E718();
LABEL_4:
        JUMPOUT(0x230F5B280);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x230F5B280](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x230F5B280]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_22C0193FC(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_22C018880(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_22C018880(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_22C0194FC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_22C018880(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_22C01E558();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_22C01E718();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    unint64_t result = sub_22C018880(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22C01E528();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22C019710(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A10);
  char v42 = a2;
  uint64_t v6 = sub_22C01E778();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unsigned __int8 v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unsigned __int8 v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22C01E868();
    sub_22C01E4F8();
    uint64_t result = sub_22C01E878();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    char v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v39;
  unsigned __int8 v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_22C019A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_22C0188FC(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_22C019BC0();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      void *v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_22C019710(v17, a5 & 1);
  unint64_t v23 = sub_22C0188FC(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_22C01E808();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v20[2] = v29;
  return swift_bridgeObjectRetain();
}

void *sub_22C019BC0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268497A10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22C01E768();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_22C019D7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497A20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C019DDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_22C019E44(a1, a2, *(void *)(v3 + 16), **(void **)(v3 + 32), *(void *)(*(void *)(v3 + 32) + 8));
  if (!v4)
  {
    *a3 = result;
    a3[1] = v7;
    a3[2] = v8;
    a3[3] = v9;
  }
  return result;
}

uint64_t sub_22C019E18()
{
  return sub_22C01DEF8();
}

uint64_t sub_22C019E44(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    if (__OFSUB__(a2 - result, a3))
    {
      __break(1u);
      goto LABEL_9;
    }
    uint64_t v7 = result + a3;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a4;
  *(void *)(result + 24) = a5;
  if (!v7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_22C01E6F8();
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_22C019F1C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22C019F54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268497A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C019FBC()
{
  uint64_t v0 = sub_22C01E178();
  __swift_allocate_value_buffer(v0, qword_26849DE80);
  __swift_project_value_buffer(v0, (uint64_t)qword_26849DE80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2684973B8);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2684973C0) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22C024330;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "type";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_22C01E158();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "displayName";
  *((void *)v10 + 1) = 11;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "username";
  *(void *)(v11 + 8) = 8;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_22C01E168();
}

uint64_t sub_22C01A1C0()
{
  uint64_t result = sub_22C01DF98();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 3 || result == 2 || result == 1) {
        sub_22C01E018();
      }
      uint64_t result = sub_22C01DF98();
    }
  }
  return result;
}

uint64_t sub_22C01A268()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_22C01E108(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_22C01E108(), !v1))
    {
      unint64_t v7 = v0[5];
      uint64_t v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0) {
        uint64_t v8 = v0[4] & 0xFFFFFFFFFFFFLL;
      }
      if (!v8 || (uint64_t result = sub_22C01E108(), !v1))
      {
        type metadata accessor for Account();
        return sub_22C01DF38();
      }
    }
  }
  return result;
}

uint64_t sub_22C01A37C@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  return sub_22C01DF48();
}

uint64_t sub_22C01A3AC()
{
  return 0x746E756F636341;
}

uint64_t sub_22C01A3C4()
{
  return sub_22C01A1C0();
}

uint64_t sub_22C01A3DC()
{
  return sub_22C01A268();
}

uint64_t sub_22C01A3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22C01A980(&qword_268497A58, (void (*)(uint64_t))type metadata accessor for Account);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_22C01A470@<X0>(uint64_t a1@<X8>)
{
  if (qword_268497140 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22C01E178();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26849DE80);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_22C01A518(uint64_t a1)
{
  uint64_t v2 = sub_22C01A980(&qword_268497A40, (void (*)(uint64_t))type metadata accessor for Account);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_22C01A584()
{
  sub_22C01A980(&qword_268497A40, (void (*)(uint64_t))type metadata accessor for Account);
  return sub_22C01E088();
}

uint64_t sub_22C01A604()
{
  return sub_22C01A980(&qword_268497A38, (void (*)(uint64_t))type metadata accessor for Account);
}

uint64_t type metadata accessor for Account()
{
  uint64_t result = qword_268497A60;
  if (!qword_268497A60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22C01A698()
{
  return sub_22C01A980(&qword_268497A40, (void (*)(uint64_t))type metadata accessor for Account);
}

uint64_t sub_22C01A6E0()
{
  return sub_22C01A980(&qword_268497A48, (void (*)(uint64_t))type metadata accessor for Account);
}

uint64_t sub_22C01A728()
{
  return sub_22C01A980(&qword_268497A50, (void (*)(uint64_t))type metadata accessor for Account);
}

uint64_t sub_22C01A770(char *a1, char *a2)
{
  uint64_t v4 = sub_22C01DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
    {
      if (*((void *)a1 + 4) == *((void *)a2 + 4) && *((void *)a1 + 5) == *((void *)a2 + 5)
        || (char v12 = 0, (sub_22C01E7D8() & 1) != 0))
      {
        uint64_t v14 = type metadata accessor for Account();
        unint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
        v15(v10, &a1[*(int *)(v14 + 28)], v4);
        v15(v8, &a2[*(int *)(v14 + 28)], v4);
        sub_22C01A980(&qword_2684973D8, MEMORY[0x263F50560]);
        char v12 = sub_22C01E488();
        uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
        v16(v8, v4);
        v16(v10, v4);
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_22C01A980(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_22C01A9C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_22C01DF58();
    char v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t sub_22C01AAD8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_22C01DF58();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_22C01AB60(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_22C01DF58();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

void *sub_22C01AC20(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_22C01ACFC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_22C01AD80(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_22C01DF58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_22C01AE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22C01AE40);
}

uint64_t sub_22C01AE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22C01DF58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_22C01AEF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22C01AF04);
}

uint64_t sub_22C01AF04(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22C01DF58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22C01AFAC()
{
  uint64_t result = sub_22C01DF58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CalendarMigrator()
{
  return &type metadata for CalendarMigrator;
}

unint64_t sub_22C01B058()
{
  return 0xD00000000000001DLL;
}

void sub_22C01B074()
{
}

uint64_t sub_22C01DDD8()
{
  return MEMORY[0x270EEE0F0]();
}

uint64_t sub_22C01DDE8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22C01DDF8()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_22C01DE08()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_22C01DE18()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_22C01DE28()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_22C01DE38()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_22C01DE48()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_22C01DE58()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_22C01DE68()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22C01DE78()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22C01DE88()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_22C01DE98()
{
  return MEMORY[0x270EEFFE0]();
}

uint64_t sub_22C01DEA8()
{
  return MEMORY[0x270EEFFE8]();
}

uint64_t sub_22C01DEB8()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_22C01DEC8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_22C01DED8()
{
  return MEMORY[0x270EF0078]();
}

uint64_t sub_22C01DEE8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_22C01DEF8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_22C01DF08()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22C01DF18()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22C01DF28()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_22C01DF38()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_22C01DF48()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_22C01DF58()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_22C01DF68()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_22C01DF98()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_22C01DFA8()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_22C01DFB8()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_22C01DFC8()
{
  return MEMORY[0x270F44B90]();
}

uint64_t sub_22C01DFD8()
{
  return MEMORY[0x270F44BA0]();
}

uint64_t sub_22C01DFE8()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_22C01DFF8()
{
  return MEMORY[0x270F44BC8]();
}

uint64_t sub_22C01E008()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_22C01E018()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_22C01E028()
{
  return MEMORY[0x270F44C08]();
}

uint64_t sub_22C01E038()
{
  return MEMORY[0x270F44C18]();
}

uint64_t sub_22C01E048()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_22C01E058()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_22C01E068()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_22C01E088()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_22C01E098()
{
  return MEMORY[0x270F44D48]();
}

uint64_t sub_22C01E0A8()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_22C01E0B8()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_22C01E0C8()
{
  return MEMORY[0x270F44D90]();
}

uint64_t sub_22C01E0D8()
{
  return MEMORY[0x270F44D98]();
}

uint64_t sub_22C01E0E8()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_22C01E0F8()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_22C01E108()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_22C01E118()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_22C01E128()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t sub_22C01E138()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_22C01E148()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_22C01E158()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_22C01E168()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_22C01E178()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_22C01E188()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22C01E198()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22C01E1A8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22C01E1B8()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_22C01E1C8()
{
  return MEMORY[0x270EF7128]();
}

uint64_t sub_22C01E1D8()
{
  return MEMORY[0x270EF7130]();
}

uint64_t sub_22C01E1E8()
{
  return MEMORY[0x270EF7150]();
}

uint64_t sub_22C01E1F8()
{
  return MEMORY[0x270EF7160]();
}

uint64_t sub_22C01E208()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_22C01E218()
{
  return MEMORY[0x270EF7318]();
}

uint64_t sub_22C01E228()
{
  return MEMORY[0x270EF7340]();
}

uint64_t sub_22C01E238()
{
  return MEMORY[0x270EF7348]();
}

uint64_t sub_22C01E248()
{
  return MEMORY[0x270EF7430]();
}

uint64_t sub_22C01E258()
{
  return MEMORY[0x270EF7438]();
}

uint64_t sub_22C01E268()
{
  return MEMORY[0x270EF7440]();
}

uint64_t sub_22C01E278()
{
  return MEMORY[0x270EF7448]();
}

uint64_t sub_22C01E288()
{
  return MEMORY[0x270EF7450]();
}

uint64_t sub_22C01E298()
{
  return MEMORY[0x270EF7458]();
}

uint64_t sub_22C01E2A8()
{
  return MEMORY[0x270EF7460]();
}

uint64_t sub_22C01E2B8()
{
  return MEMORY[0x270EF7468]();
}

uint64_t sub_22C01E2C8()
{
  return MEMORY[0x270EF7488]();
}

uint64_t sub_22C01E2D8()
{
  return MEMORY[0x270EF74F8]();
}

uint64_t sub_22C01E2E8()
{
  return MEMORY[0x270EF7500]();
}

uint64_t sub_22C01E2F8()
{
  return MEMORY[0x270EF7508]();
}

uint64_t sub_22C01E308()
{
  return MEMORY[0x270EF7510]();
}

uint64_t sub_22C01E318()
{
  return MEMORY[0x270EF7600]();
}

uint64_t sub_22C01E328()
{
  return MEMORY[0x270EF7608]();
}

uint64_t sub_22C01E338()
{
  return MEMORY[0x270EF7610]();
}

uint64_t sub_22C01E348()
{
  return MEMORY[0x270EF7618]();
}

uint64_t sub_22C01E358()
{
  return MEMORY[0x270EF7620]();
}

uint64_t sub_22C01E368()
{
  return MEMORY[0x270EF7630]();
}

uint64_t sub_22C01E378()
{
  return MEMORY[0x270EF7638]();
}

uint64_t sub_22C01E388()
{
  return MEMORY[0x270EF7640]();
}

uint64_t sub_22C01E398()
{
  return MEMORY[0x270EF77E0]();
}

uint64_t sub_22C01E3A8()
{
  return MEMORY[0x270EF7838]();
}

uint64_t sub_22C01E3B8()
{
  return MEMORY[0x270EF7858]();
}

uint64_t sub_22C01E3C8()
{
  return MEMORY[0x270EF7860]();
}

uint64_t sub_22C01E3D8()
{
  return MEMORY[0x270EF7870]();
}

uint64_t sub_22C01E3E8()
{
  return MEMORY[0x270EF78A0]();
}

uint64_t sub_22C01E3F8()
{
  return MEMORY[0x270EF78B0]();
}

uint64_t sub_22C01E408()
{
  return MEMORY[0x270EF78B8]();
}

uint64_t sub_22C01E418()
{
  return MEMORY[0x270EF78C0]();
}

uint64_t sub_22C01E428()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_22C01E438()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22C01E448()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22C01E458()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22C01E468()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22C01E478()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22C01E488()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22C01E498()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22C01E4A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22C01E4B8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_22C01E4C8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22C01E4D8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22C01E4E8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22C01E4F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22C01E508()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22C01E518()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22C01E528()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22C01E538()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22C01E558()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22C01E568()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22C01E578()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22C01E588()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22C01E598()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22C01E5A8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22C01E5B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22C01E5C8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_22C01E5D8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22C01E5E8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22C01E5F8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22C01E608()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22C01E618()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22C01E628()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22C01E638()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22C01E648()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_22C01E658()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_22C01E668()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22C01E678()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22C01E688()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22C01E698()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_22C01E6A8()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_22C01E6B8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22C01E6C8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22C01E6D8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22C01E6E8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22C01E6F8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22C01E708()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_22C01E718()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22C01E728()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_22C01E738()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22C01E748()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22C01E758()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22C01E768()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22C01E778()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22C01E788()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22C01E798()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22C01E7A8()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_22C01E7B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22C01E7C8()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_22C01E7D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22C01E7F8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22C01E808()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22C01E818()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22C01E828()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22C01E838()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22C01E848()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22C01E858()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_22C01E868()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22C01E878()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22C01E888()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_22C01E898()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_22C01E8A8()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78D0](*(void *)&op, *(void *)&mode, *(void *)&alg, *(void *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78E8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x270ED7A80](bytes, count);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
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
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B20](desc);
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x270F0CDC0]();
}

uint64_t IMCreateSuperFormatStringWithAppendedFileTransfers()
{
  return MEMORY[0x270F3CCD8]();
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x270EF4008](interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t IOUSBDeviceControllerCreate()
{
  return MEMORY[0x270EF4AF8]();
}

uint64_t IOUSBDeviceControllerGoOffAndOnBus()
{
  return MEMORY[0x270EF4B00]();
}

uint64_t IOUSBDeviceControllerSetDescription()
{
  return MEMORY[0x270EF4B08]();
}

uint64_t IOUSBDeviceDataGetBytePtr()
{
  return MEMORY[0x270EF4B18]();
}

uint64_t IOUSBDeviceDescriptionAppendConfiguration()
{
  return MEMORY[0x270EF4B28]();
}

uint64_t IOUSBDeviceDescriptionAppendInterfaceToConfiguration()
{
  return MEMORY[0x270EF4B30]();
}

uint64_t IOUSBDeviceDescriptionCreateFromController()
{
  return MEMORY[0x270EF4B38]();
}

uint64_t IOUSBDeviceDescriptionRemoveAllConfigurations()
{
  return MEMORY[0x270EF4B40]();
}

uint64_t IOUSBDeviceDescriptionSetAllowOverride()
{
  return MEMORY[0x270EF4B48]();
}

uint64_t IOUSBDeviceDescriptionSetProductID()
{
  return MEMORY[0x270EF4B50]();
}

uint64_t IOUSBDeviceDescriptionSetVendorID()
{
  return MEMORY[0x270EF4B58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x270F1B720]();
}

uint64_t PNDecomposeForCountry()
{
  return MEMORY[0x270F1B738]();
}

uint64_t SRP6a_client_method()
{
  return MEMORY[0x270F0E8B8]();
}

uint64_t SRP6a_server_method()
{
  return MEMORY[0x270F0E8C0]();
}

uint64_t SRP_compute_key()
{
  return MEMORY[0x270F0E8C8]();
}

uint64_t SRP_free()
{
  return MEMORY[0x270F0E8D0]();
}

uint64_t SRP_gen_pub()
{
  return MEMORY[0x270F0E8D8]();
}

uint64_t SRP_new()
{
  return MEMORY[0x270F0E8E0]();
}

uint64_t SRP_respond()
{
  return MEMORY[0x270F0E8E8]();
}

uint64_t SRP_set_auth_password()
{
  return MEMORY[0x270F0E8F0]();
}

uint64_t SRP_set_params()
{
  return MEMORY[0x270F0E8F8]();
}

uint64_t SRP_set_username()
{
  return MEMORY[0x270F0E900]();
}

uint64_t SRP_verify()
{
  return MEMORY[0x270F0E908]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

uint64_t SecCertificateCopySHA256Digest()
{
  return MEMORY[0x270EFD798]();
}

uint64_t SecCertificateCreateWithPEM()
{
  return MEMORY[0x270EFD7F0]();
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x270EFD940]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x270EFD958]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientGetDevice()
{
  return MEMORY[0x270F4B548]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x270F4B718]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x270F90898]();
}

uint64_t _AXSSetPreferredContentSizeCategoryName()
{
  return MEMORY[0x270F90A60]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _PNCopyInternationalCodeForCountry()
{
  return MEMORY[0x270F1B750]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::terminate(void)
{
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

uint64_t cstr_free()
{
  return MEMORY[0x270F0E910]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x270EF7A40](name, type, domain);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x270EF7B80](connection);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F30](endpoint);
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x270EF8410](parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return MEMORY[0x270EF8428](listener);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_parameters_t nw_parameters_create_quic(nw_parameters_configure_protocol_block_t configure_quic)
{
  return (nw_parameters_t)MEMORY[0x270EF8540](configure_quic);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x270EF8550](configure_tls, configure_tcp);
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
}

void nw_quic_add_tls_application_protocol(nw_protocol_options_t options, const char *application_protocol)
{
}

sec_protocol_options_t nw_quic_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x270EF92E0](options);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x270EF95D0](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x270EFDE98](identity);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
}

void sec_protocol_options_append_tls_ciphersuite(sec_protocol_options_t options, tls_ciphersuite_t ciphersuite)
{
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x270EFDFD8](trust);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B650](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
}

int sqlite3_prepare(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B718](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}