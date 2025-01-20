uint64_t start()
{
  int v0;
  char *const *v1;
  char *const *v2;
  int v3;
  int v4;
  BOOL v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  int v10;
  BOOL v11;
  int v12;
  const char *v13;
  unint64_t v14;
  int v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  kern_return_t v21;
  mach_port_t v22;
  kern_return_t v23;
  mach_port_t v24;
  kern_return_t v25;
  mach_error_t v26;
  mach_msg_type_number_t v27;
  kern_return_t v28;
  uint64_t v29;
  CFMutableDictionaryRef Mutable;
  FILE *v31;
  const char *v32;
  size_t v33;
  _DWORD *v34;
  unint64_t v35;
  int *v36;
  mach_error_t v37;
  mach_msg_type_number_t v38;
  BOOL v39;
  _DWORD *v40;
  unint64_t v41;
  int v42;
  char *v43;
  char v44;
  mach_error_t v45;
  mach_error_t v46;
  mach_error_t v47;
  mach_error_t v48;
  mach_error_t v49;
  mach_error_t v50;
  mach_error_t v51;
  mach_error_t v52;
  mach_error_t v53;
  mach_error_t v54;
  signed int v55;
  BOOL v56;
  const char *v57;
  const char *v58;
  char v59;
  char v60;
  char v61;
  char *v62;
  char *v63;
  char *v64;
  BOOL v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  int v75;
  unint64_t v76;
  double v77;
  const char *v78;
  char v79;
  double v80;
  const char *v81;
  double v82;
  const char *v83;
  double v84;
  const char *v85;
  double v86;
  const char *v87;
  time_t v88;
  char *v89;
  double v90;
  double v91;
  double v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  double v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  const char *v104;
  double v105;
  int64x2_t v106;
  char v107;
  const char *v108;
  const char *v109;
  const char *v110;
  CFArrayRef v111;
  CFArrayRef v112;
  CFIndex v113;
  const char *ValueAtIndex;
  unsigned int v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  unsigned int v119;
  BOOL v120;
  const char *v121;
  unsigned int v122;
  BOOL v123;
  const char *v124;
  unsigned int v125;
  BOOL v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  unsigned int v133;
  const char *v134;
  unsigned int v135;
  const char *v136;
  unsigned int v137;
  const char *v138;
  const char *v139;
  const char *v140;
  const char *v141;
  unsigned int v142;
  const char *v143;
  unsigned int v144;
  BOOL v145;
  const char *v146;
  unsigned int v147;
  BOOL v148;
  const char *v149;
  const char *v150;
  unsigned int v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  unsigned int v156;
  const char *v157;
  const char *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  int v162;
  int v163;
  int v164;
  int v165;
  const char *v166;
  const char *v167;
  const char *v168;
  const char *v169;
  const char *v170;
  const char *v171;
  int v172;
  unint64_t v173;
  mach_error_t v174;
  mach_error_t v175;
  int v176;
  kern_return_t v177;
  mach_error_t v178;
  const char *v179;
  kern_return_t v180;
  mach_error_t v181;
  const char *v182;
  kern_return_t v183;
  mach_error_t v184;
  mach_error_t v185;
  mach_error_t v186;
  mach_error_t v187;
  mach_error_t v188;
  unint64_t v189;
  unsigned int v190;
  int v191;
  uint64_t v192;
  int64x2_t v193;
  uint64_t v194;
  uint64_t *v195;
  int64x2_t v196;
  uint64_t v197;
  kern_return_t v198;
  char *v199;
  long long *v200;
  long long v201;
  const char *v202;
  const char *v203;
  const char *v204;
  unsigned int v205;
  const char *v206;
  unsigned int v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  unsigned int v211;
  const char *v212;
  uint64_t v213;
  const char *v214;
  unsigned int v215;
  const char *v216;
  unsigned int v217;
  BOOL v218;
  const char *v219;
  unsigned int v220;
  BOOL v221;
  const char *v222;
  const char *v223;
  const char *v224;
  const char *v225;
  unsigned int v226;
  const char *v227;
  unsigned int v228;
  const char *v229;
  int v230;
  const char *v231;
  int v232;
  const char *v233;
  unsigned int v234;
  BOOL v235;
  const char *v236;
  unsigned int v237;
  BOOL v238;
  const char *v239;
  const char *v240;
  int v241;
  const char *v242;
  const char *v243;
  const char *v244;
  const char *v245;
  const char *v246;
  mach_error_t mach_voucher;
  mach_port_name_t v248;
  mach_error_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  kern_return_t v253;
  mach_msg_type_number_t i;
  _DWORD *v255;
  int v256;
  uint64_t v257;
  _DWORD *v258;
  int v259;
  unsigned int v260;
  size_t v261;
  char *v262;
  size_t v263;
  FILE *v264;
  FILE *v265;
  int (__cdecl *v266)(const void *, const void *);
  int v267;
  uint64_t v268;
  BOOL v269;
  int v270;
  const char *v271;
  char *v272;
  unsigned int v273;
  const char *v274;
  BOOL v275;
  uint64_t v276;
  const char *v277;
  char *v278;
  int v279;
  int *v280;
  int v281;
  int v282;
  int *v283;
  task_policy_get_t *v284;
  uint64_t v285;
  int v286;
  task_policy_get_t v287;
  mach_error_t v288;
  int v289;
  const char *v290;
  unsigned int v291;
  int v292;
  const char *v293;
  char *v294;
  char *v295;
  char *v296;
  char *v297;
  void *v298;
  char *v299;
  char *v300;
  unint64_t v301;
  uint64_t v303;
  int v304;
  int v305;
  char *v306;
  int v307;
  int64x2_t v308;
  char *v309;
  long long v310;
  FILE *v311;
  FILE *v312;
  uint64_t stackshot_buffer;
  unint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  _DWORD *v319;
  char v320;
  uint64_t v321;
  uint64_t v322;
  int v323;
  int v324;
  unint64_t v325;
  unsigned int v326;
  uint64_t v327;
  const void *v328;
  BOOL v329;
  uint64_t v330;
  void *Value;
  unsigned int v332;
  BOOL v333;
  unsigned int v334;
  mach_error_t v335;
  const char *v336;
  BOOL v337;
  char *v338;
  int64x2_t v339;
  uint64_t v340;
  uint64_t v341;
  void *key;
  int v343;
  char *v344;
  CFMutableDictionaryRef cf;
  int v346;
  BOOL v347;
  int v348;
  _DWORD *v349;
  char *__s1;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  unint64_t v357;
  int64x2_t v358;
  unint64_t v359;
  int64x2_t v360;
  BOOL v361;
  uint64_t v362;
  int v363;
  char v364;
  unint64_t v365;
  task_array_t v366;
  unint64_t v367;
  char v368;
  char v369;
  uint64_t v370;
  uint64_t v371;
  id_t pid;
  int pida[2];
  int pidb[2];
  BOOL v375;
  int v376;
  int v377;
  int v378;
  BOOL v379;
  char *v380;
  void *v381;
  ipc_voucher_t voucher;
  int64x2_t object_type;
  int64x2_t v384;
  uint64_t v385;
  BOOLean_t v386;
  BOOLean_t get_default;
  vm_size_t outsize;
  integer_t v389[4];
  long long v390;
  long long v391;
  long long v392;
  integer_t v393[2];
  uint64_t v394;
  uint64_t v395;
  integer_t v396[2];
  uint64_t v397;
  uint64_t v398;
  int v399;
  uint64_t v400[2];
  vm_address_t v401;
  long long thread_info_out;
  long long v403;
  uint64_t v404;
  int x[2];
  thread_act_array_t act_list;
  uint32_t flags;
  uint64_t v408;
  uint64_t v409;
  void v410[5];
  uint64_t v411;
  long long policy_info;
  long long v413;
  long long v414;
  long long v415;
  uint64_t v416;
  uint64_t v417;
  long long v418;
  long long v419;
  long long v420;
  long long v421;
  long long v422;
  long long v423;
  long long v424;
  long long v425;
  unint64_t v426;
  uint64_t v427;
  uint64_t v428;
  long long task_info_out;
  long long v430;
  uint64_t v431;
  long long v432;
  long long v433;
  ipc_info_space_basic_t basic_info;
  mach_msg_type_number_t task_info_outCnt;
  mach_msg_type_number_t task_listCnt;
  task_array_t task_list;
  _DWORD size[3];
  uint64_t v439;
  size_t v440;
  processor_set_t set;
  processor_set_name_t default_set;
  mach_msg_type_number_t recipesCnt;
  long long v444;
  int64x2_t v445;
  long long v446;
  long long v447;
  long long v448;
  long long v449;
  long long v450;
  int v451[16];
  char v452;
  char out[48];
  long long v454;
  int64x2_t v455;
  long long v456;
  long long v457;
  long long v458;
  long long v459;
  long long v460;
  long long v461;
  long long v462;
  long long v463;
  long long v464;
  long long v465;
  long long v466;
  long long v467;
  long long v468;
  _OWORD v469[2];
  long long v470;
  long long v471;
  int64x2_t v472;
  long long v473;
  long long v474;
  long long v475;
  long long v476;
  long long v477;
  long long v478;
  long long v479;
  long long v480;
  long long v481;
  long long uu;
  long long v483;
  long long v484;
  uint64_t v485;
  size_t buffer[6];
  long long v487;
  unsigned char v488[48];
  long long v489;
  uint64_t v490;
  long long v491;
  long long v492;
  void v493[4];
  option v494;
  const char *v495;
  int v496;
  uint64_t *v497;
  int v498;
  const char *v499;
  int v500;
  _DWORD *v501;
  int v502;
  const char *v503;
  int v504;
  _DWORD *v505;
  int v506;
  const char *v507;
  int v508;
  uint64_t v509;
  int v510;
  const char *v511;
  int v512;
  uint64_t v513;
  int v514;
  const char *v515;
  int v516;
  uint64_t v517;
  int v518;
  const char *v519;
  int v520;
  uint64_t v521;
  int v522;
  const char *v523;
  int v524;
  uint64_t v525;
  int v526;
  const char *v527;
  int v528;
  uint64_t v529;
  int v530;
  const char *v531;
  int v532;
  uint64_t v533;
  int v534;
  const char *v535;
  int v536;
  uint64_t v537;
  int v538;
  long long v539;
  long long v540;
  int v541[4];
  char *__endptr[2];
  int64x2_t v543;
  long long v544;
  long long v545;

  v0 = __chkstk_darwin();
  v2 = v1;
  v3 = v0;
  v379 = 0;
  v377 = 0;
  v4 = 0;
  default_set = 0;
  set = 0;
  v440 = 0;
  v439 = 0;
  *(void *)&size[1] = 0;
  v494.name = "threads";
  v494.flag = (int *)&v439 + 1;
  v494.has_arg = 0;
  v494.val = 1;
  v495 = "dq";
  v497 = &v439;
  v496 = 0;
  v498 = 1;
  v499 = "boosts";
  v501 = &size[2];
  v500 = 0;
  v502 = 1;
  v503 = "coalitions-only";
  v505 = &size[1];
  v504 = 0;
  v506 = 1;
  v507 = "xpcinfo";
  v509 = 0;
  v508 = 2;
  v510 = 6;
  v511 = "precise";
  v513 = 0;
  v512 = 2;
  v514 = 5;
  v515 = "threadcounts";
  v517 = 0;
  v516 = 2;
  v518 = 1;
  v519 = "vouchers";
  v521 = 0;
  v520 = 2;
  v522 = 2;
  v523 = "coalitions";
  v5 = 1;
  v524 = 1;
  v525 = 0;
  v526 = 4;
  v527 = "verbose";
  v528 = 0;
  v529 = 0;
  v530 = 3;
  v531 = "all";
  v532 = 0;
  v533 = 0;
  v534 = 7;
  v535 = "help";
  v536 = 0;
  v537 = 0;
  v538 = 104;
  v539 = 0u;
  v540 = 0u;
  qword_1000100C8 = (uint64_t)&v494;
  v375 = 1;
  while (2)
  {
    switch(getopt_long(v3, v2, "h", &v494, &dword_1000100C0))
    {
      case -1:
        if (v4) {
          v11 = 1;
        }
        else {
          v11 = size[1] == 0;
        }
        if (v11) {
          v12 = v4;
        }
        else {
          v12 = 2;
        }
        v343 = v12;
        if (optind >= v3)
        {
          __s1 = 0;
          v346 = 0;
          v347 = 0;
        }
        else
        {
          v13 = v2[optind];
          __endptr[0] = 0;
          v14 = strtoul(v13, __endptr, 10);
          __s1 = (char *)v13;
          v347 = v14 >> 31 == 0 && v13 != __endptr[0];
          if (v347) {
            v15 = v14;
          }
          else {
            v15 = 0;
          }
          v346 = v15;
        }
        v16 = v375;
        if (geteuid()) {
          sub_10000907C();
        }
        if (sub_10000835C("kern.development")) {
          v17 = sub_1000083E0("kern.development") != 0;
        }
        else {
          v17 = 0;
        }
        byte_100010001 = v17;
        if (sub_10000835C("kern.thread_groups_supported")) {
          v18 = sub_1000083E0("kern.thread_groups_supported") != 0;
        }
        else {
          v18 = 0;
        }
        byte_100010002 = v18;
        if (sub_10000835C("kern.monotonic.supported")) {
          v19 = sub_1000083E0("kern.monotonic.supported") != 0;
        }
        else {
          v19 = 0;
        }
        byte_100010003 = v19;
        if (qword_100010010 != -1) {
          dispatch_once(&qword_100010010, &stru_10000C2E8);
        }
        v20 = dword_100010018;
        size[0] = 0;
        *(void *)v541 = 0x800000001;
        v440 = 4;
        if (sysctl(v541, 2u, size, &v440, 0, 0)) {
          sub_10000905C();
        }
        v344 = (char *)malloc_type_malloc(size[0], 0xE2BA84C2uLL);
        if (!v344) {
          sub_100008EDC();
        }
        v21 = mach_timebase_info((mach_timebase_info_t)&dword_100010004);
        if (v21)
        {
          v335 = v21;
          v336 = "mach_timebase_info";
          goto LABEL_964;
        }
        v22 = mach_host_self();
        v23 = processor_set_default(v22, &default_set);
        if (v23)
        {
          v335 = v23;
          v336 = "processor_set_default";
          goto LABEL_964;
        }
        v24 = mach_host_self();
        v25 = host_processor_set_priv(v24, default_set, &set);
        if (v25)
        {
          v335 = v25;
          v336 = "host_processor_set_priv";
          goto LABEL_964;
        }
        task_list = 0;
        task_listCnt = 0;
        if (!v5 && v439 == 0) {
          goto LABEL_59;
        }
        v26 = processor_set_tasks_with_flavor(set, 1u, &task_list, &task_listCnt);
        if (v26) {
          mach_error("processor_set_tasks_with_flavor(TASK_FLAVOR_READ)", v26);
        }
        v27 = task_listCnt;
        if (!task_listCnt)
        {
          fwrite("processor_set_tasks_with_flavor(TASK_FLAVOR_READ) returned 0 tasks", 0x42uLL, 1uLL, __stderrp);
          LODWORD(v439) = 0;
          v27 = task_listCnt;
          if (task_listCnt)
          {
LABEL_61:
            v5 = 0;
            goto LABEL_62;
          }
LABEL_59:
          v28 = processor_set_tasks_with_flavor(set, 2u, &task_list, &task_listCnt);
          if (!v28)
          {
            v27 = task_listCnt;
            if (task_listCnt) {
              goto LABEL_61;
            }
            fwrite("processor_set_tasks_with_flavor(TASK_FLAVOR_INSPECT) returned 0 tasks", 0x45uLL, 1uLL, __stderrp);
LABEL_965:
            exit(1);
          }
          v335 = v28;
          v336 = "processor_set_tasks_with_flavor(TASK_FLAVOR_INSPECT)";
LABEL_964:
          mach_error(v336, v335);
          goto LABEL_965;
        }
LABEL_62:
        if (!__s1) {
          printf("num tasks: %d\n\n", v27);
        }
        v356 = v20;
        if (!size[2]) {
          goto LABEL_77;
        }
        v29 = stackshot_config_create();
        if (!v29)
        {
          fwrite("Unable to create stackshot config\n", 0x22uLL, 1uLL, __stderrp);
LABEL_77:
          cf = 0;
          goto LABEL_78;
        }
        Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
        if (!Mutable)
        {
          fwrite("Unable to allocate boost dictionary\n", 0x24uLL, 1uLL, __stderrp);
          stackshot_config_dealloc();
          goto LABEL_77;
        }
        cf = Mutable;
        if (stackshot_config_set_flags())
        {
          v31 = __stderrp;
          v32 = "stackshot_config_set_flags failure\n";
          v33 = 35;
          goto LABEL_75;
        }
        if (stackshot_config_set_pid())
        {
          v31 = __stderrp;
          v32 = "stackshot_config_set_pid failure\n";
          v33 = 33;
          goto LABEL_75;
        }
        if (stackshot_capture_with_config())
        {
          v31 = __stderrp;
          v32 = "stackshot_capture_with_config failure\n";
          v33 = 38;
LABEL_75:
          fwrite(v32, v33, 1uLL, v31);
LABEL_76:
          stackshot_config_dealloc();
          CFRelease(cf);
          goto LABEL_77;
        }
        stackshot_buffer = stackshot_config_get_stackshot_buffer();
        v314 = stackshot_buffer + stackshot_config_get_stackshot_size();
        v315 = stackshot_buffer + 16;
        if (stackshot_buffer + 16 <= v314)
        {
          v316 = 0;
          v317 = 0;
          v318 = 0;
          v319 = 0;
          v320 = 1;
          while (1)
          {
            v321 = *(unsigned int *)(stackshot_buffer + 4);
            v322 = v315 + v321;
            if (v315 + v321 > v314) {
              goto LABEL_78;
            }
            v323 = *(_DWORD *)stackshot_buffer;
            if (*(_DWORD *)stackshot_buffer == -242132755) {
              goto LABEL_78;
            }
            v324 = (v323 & 0xFFFFFFF0) == 0x20 ? 17 : *(_DWORD *)stackshot_buffer;
            if (v324 <= 19) {
              break;
            }
            if (v324 == 20)
            {
              if (v320)
              {
                v320 = 1;
              }
              else if (*(void *)(stackshot_buffer + 8) == v318)
              {
                if (!v319)
                {
                  v31 = __stderrp;
                  v32 = "Encountered container end without a corresponding task snapshot while generating boost map\n";
                  v33 = 91;
                  goto LABEL_75;
                }
                v371 = v318;
                if (v316 && !v317)
                {
                  fwrite("Donating pids count was non-zero with a NULL array while generating boost map\n", 0x4EuLL, 1uLL, __stderrp);
                  v16 = v375;
                  goto LABEL_76;
                }
                if (v316)
                {
                  v367 = v314;
                  v327 = 0;
                  *(void *)pidb = v316;
                  do
                  {
                    v328 = (const void *)*(int *)(v317 + 4 * v327);
                    if (v328 != v319[21])
                    {
                      v329 = v5;
                      v330 = v29;
                      Value = (void *)CFDictionaryGetValue(cf, v328);
                      if (!Value)
                      {
                        Value = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
                        CFDictionarySetValue(cf, (const void *)*(int *)(v317 + 4 * v327), Value);
                        CFRelease(Value);
                      }
                      CFArrayAppendValue((CFMutableArrayRef)Value, v319);
                      v29 = v330;
                      v5 = v329;
                      v316 = *(void *)pidb;
                    }
                    ++v327;
                  }
                  while (v316 != v327);
                  v322 = v315 + *(unsigned int *)(stackshot_buffer + 4);
                  v320 = 1;
                  v16 = v375;
                  v314 = v367;
                  v318 = v371;
                }
                else
                {
                  v320 = 1;
                  v16 = v375;
                }
              }
              else
              {
                v320 = 0;
              }
            }
            else if (v324 == 2309)
            {
              if (v320)
              {
                v31 = __stderrp;
                v32 = "Encountered task snapshot outside of a container while generating boost map\n";
                v33 = 76;
                goto LABEL_75;
              }
              v320 = 0;
              v319 = (_DWORD *)(stackshot_buffer + 16);
            }
LABEL_948:
            v315 = v322 + 16;
            stackshot_buffer = v322;
            if (v322 + 16 > v314) {
              goto LABEL_78;
            }
          }
          if (v324 != 17)
          {
            if (v324 == 19)
            {
              if (v321 < 4 || v323 != 19)
              {
                v31 = __stderrp;
                v32 = "Encountered invalid container while generating boost map\n";
                v33 = 57;
                goto LABEL_75;
              }
              if (*(_DWORD *)(stackshot_buffer + 16) == 2307)
              {
                v319 = 0;
                v320 = 0;
                v317 = 0;
                v316 = 0;
                v318 = *(void *)(stackshot_buffer + 8);
              }
            }
            goto LABEL_948;
          }
          if (v323 != 17 && (v323 & 0xFFFFFFF0) != 0x20) {
            goto LABEL_951;
          }
          v325 = *(void *)(stackshot_buffer + 8);
          if (v325)
          {
            if (v323 == 17)
            {
              if (SHIDWORD(v325) <= 2310)
              {
                switch(HIDWORD(v325))
                {
                  case 0x30:
                    v326 = 20;
                    break;
                  case 0x31:
                    v326 = 24;
                    break;
                  case 0x81A:
LABEL_936:
                    v326 = 8;
                    break;
                  default:
                    goto LABEL_951;
                }
              }
              else
              {
                switch(HIDWORD(v325))
                {
                  case 0x907:
                    v326 = 4;
                    break;
                  case 0x908:
                  case 0x909:
                    goto LABEL_951;
                  case 0x90A:
                  case 0x90C:
                    goto LABEL_936;
                  case 0x90B:
                  case 0x90D:
                    v326 = 16;
                    break;
                  default:
                    if (HIDWORD(v325) != 2369) {
                      goto LABEL_951;
                    }
                    v326 = 48;
                    break;
                }
              }
              if (v321 / v326 < v325 || v321 % v325 >= 0x10)
              {
LABEL_951:
                v31 = __stderrp;
                v32 = "Encountered invalid array iterator while generating boost map\n";
                v33 = 62;
                goto LABEL_75;
              }
LABEL_945:
              if (HIDWORD(v325) == 2311)
              {
                if (v320)
                {
                  v31 = __stderrp;
                  v32 = "Encountered donating pids array outside of a container while generating boost map\n";
                  v33 = 82;
                  goto LABEL_75;
                }
                v320 = 0;
                v317 = stackshot_buffer + 16;
                v316 = *(void *)(stackshot_buffer + 8);
              }
              goto LABEL_948;
            }
            v332 = *(_DWORD *)stackshot_buffer & 0xF;
            v333 = v321 >= v332;
            v334 = v321 - v332;
            if (!v333 || v334 < v325) {
              goto LABEL_951;
            }
            LODWORD(v321) = v334 % v325;
          }
          if (v321) {
            goto LABEL_951;
          }
          goto LABEL_945;
        }
LABEL_78:
        v34 = malloc_type_calloc(4uLL, task_listCnt, 0x7B7C7E69uLL);
        v349 = v34;
        if (task_listCnt)
        {
          v35 = 0;
          v36 = v34;
          do
          {
            v37 = pid_for_task(task_list[v35], v36);
            if (v37) {
              mach_error("pid_for_task", v37);
            }
            ++v35;
            v38 = task_listCnt;
            ++v36;
          }
          while (v35 < task_listCnt);
          v39 = size[1] == 0;
          if (task_listCnt)
          {
            v40 = v349;
            if (!size[1])
            {
              v41 = 0;
              v341 = dispatch_queue_offsets[1];
              v348 = 40 * v20 + 8;
              v337 = !v5;
              v361 = !v379;
              v380 = (char *)(8 * v20);
              v375 = v16;
              do
              {
                v42 = v40[v41];
                task_info_outCnt = 0;
                memset(&basic_info, 0, sizeof(basic_info));
                v432 = 0u;
                v433 = 0u;
                v431 = 0;
                task_info_out = 0u;
                v430 = 0u;
                v427 = 0;
                v428 = 0;
                v426 = 0;
                v424 = 0u;
                v425 = 0u;
                v422 = 0u;
                v423 = 0u;
                v420 = 0u;
                v421 = 0u;
                v418 = 0u;
                v419 = 0u;
                memset(v493, 0, sizeof(v493));
                v491 = 0u;
                v492 = 0u;
                v416 = 0;
                v417 = 0;
                v415 = 0u;
                v414 = 0u;
                v413 = 0u;
                policy_info = 0u;
                v490 = 0;
                v489 = 0u;
                memset(v488, 0, sizeof(v488));
                v487 = 0u;
                memset(buffer, 0, sizeof(buffer));
                v411 = 0;
                memset(v410, 0, sizeof(v410));
                v485 = 0;
                v483 = 0u;
                v484 = 0u;
                v408 = 0;
                v409 = 0;
                v481 = 0u;
                uu = 0u;
                v479 = 0u;
                v480 = 0u;
                v477 = 0u;
                v478 = 0u;
                v475 = 0u;
                v476 = 0u;
                v473 = 0u;
                v474 = 0u;
                v471 = 0u;
                v472 = 0u;
                v470 = 0u;
                v468 = 0u;
                memset(v469, 0, sizeof(v469));
                v466 = 0u;
                v467 = 0u;
                v464 = 0u;
                v465 = 0u;
                v462 = 0u;
                v463 = 0u;
                v460 = 0u;
                v461 = 0u;
                v458 = 0u;
                v459 = 0u;
                v456 = 0u;
                v457 = 0u;
                v454 = 0u;
                v455 = 0u;
                flags = 0;
                act_list = 0;
                *(void *)x = 0;
                if (pid_for_task(task_list[v41], x))
                {
                  fprintf(__stderrp, "pid %d no longer active, skipping\n", v40[v41]);
                  goto LABEL_766;
                }
                if (x[0] != v40[v41]) {
                  fprintf(__stderrp, "task %d pid changed? from %d to %d\n", task_list[v41], v40[v41], x[0]);
                }
                if (proc_pidinfo(v42, 3, 0, buffer, 136) <= 135) {
                  perror("proc_pidinfo(... PROC_PIDTBSDINFO ...)");
                }
                if (proc_pidinfo(v42, 19, 0, &v411, 8) <= 7) {
                  perror("proc_pidinfo(... PROC_PIDARCHINFO ...)");
                }
                *__error() = 0;
                pid = v42;
                if (proc_pidinfo(v42, 12, 0, &v408, 16) <= 15)
                {
                  if (*__error() == 3)
                  {
                    v363 = 0;
                    if (v42) {
                      goto LABEL_103;
                    }
                    goto LABEL_105;
                  }
                  if (!v42 && *__error() == 22)
                  {
                    v363 = 0;
                    goto LABEL_105;
                  }
                  perror("proc_pidinfo(, ... PROC_PIDWORKQUEUEINFO ...)");
                }
                v363 = 1;
                if (v42)
                {
LABEL_103:
                  *(void *)v541 = 0x3100000001;
                  v541[2] = v42;
                  v440 = size[0];
                  if (sysctl(v541, 3u, v344, &v440, 0, 0))
                  {
                    perror("sysctl(... KERN_PROCARGS2 ...)");
                    v44 = 0;
                    if (v488[0]) {
                      v43 = v488;
                    }
                    else {
                      v43 = (char *)&v487;
                    }
                  }
                  else
                  {
                    v43 = basename(v344 + 4);
                    v44 = 0;
                  }
                  goto LABEL_106;
                }
LABEL_105:
                v44 = 1;
                v43 = "kernel_task";
LABEL_106:
                if (__s1)
                {
                  if (v43)
                  {
                    if (strncmp(__s1, v43, 0x20uLL) && (!v347 || v346 != pid)) {
                      goto LABEL_766;
                    }
                  }
                  else if (!v347 || v346 != pid)
                  {
                    goto LABEL_766;
                  }
                }
                task_info_outCnt = 10;
                v45 = task_info(task_list[v41], 0x12u, (task_info_t)&task_info_out, &task_info_outCnt);
                if (v45) {
                  mach_error("task_info(... TASK_BASIC_INFO ...)", v45);
                }
                task_info_outCnt = 4;
                v46 = task_info(task_list[v41], 3u, (task_info_t)&v427, &task_info_outCnt);
                if (v46) {
                  mach_error("task_info(... TASK_THREAD_TIMES_INFO ...)", v46);
                }
                task_info_outCnt = 26;
                v47 = task_info(task_list[v41], 0x1Au, (task_info_t)&v420, &task_info_outCnt);
                if (v47) {
                  mach_error("task_info(... TASK_POWER_INFO_V2 ...)", v47);
                }
                task_info_outCnt = 8;
                v48 = task_info(task_list[v41], 2u, (task_info_t)&v418, &task_info_outCnt);
                if (v48) {
                  mach_error("task_info(... TASK_EVENTS_INFO ...)", v48);
                }
                task_info_outCnt = 16;
                v49 = task_info(task_list[v41], 0x13u, (task_info_t)&v491, &task_info_outCnt);
                if (v49) {
                  mach_error("task_info(... TASK_EXTMOD_INFO ...)", v49);
                }
                task_info_outCnt = 4;
                v50 = task_info(task_list[v41], 0x10u, (task_info_t)&v416, &task_info_outCnt);
                if (v50) {
                  mach_error("task_info(... TASK_AFFINITY_TAG_INFO ...)", v50);
                }
                task_info_outCnt = 8;
                v51 = task_info(task_list[v41], 0xFu, (task_info_t)&v432, &task_info_outCnt);
                if (v51) {
                  mach_error("task_info(... TASK_AUDIT_TOKEN ...)", v51);
                }
                v52 = mach_port_space_basic_info(task_list[v41], &basic_info);
                if (v52) {
                  mach_error("mach_port_space_basic_info()", v52);
                }
                if ((v44 & 1) == 0)
                {
                  LODWORD(__endptr[0]) = 0;
                  task_info_outCnt = 16;
                  v53 = task_policy_get(task_list[v41], 4u, (task_policy_t)&policy_info, &task_info_outCnt, (BOOLean_t *)__endptr);
                  if (v53) {
                    mach_error("task_policy_get(... TASK_POLICY_STATE ...)", v53);
                  }
                }
                if (proc_pidinfo(pid, 20, 0, v410, 40) <= 39) {
                  perror("proc_pidinfo(... PROC_PIDCOALITIONINFO ...)");
                }
                if (proc_pidinfo(pid, 17, 0, &uu, 56) <= 55) {
                  perror("proc_pidinfo(... PROC_PIDUNIQIDENTIFIERINFO ...)");
                }
                if (proc_pid_rusage(pid, 6, (rusage_info_t *)&v454)) {
                  perror("proc_pid_rusage");
                }
                if (proc_get_dirty(pid, &flags)) {
                  perror("proc_get_dirty");
                }
                if (HIDWORD(v439))
                {
                  v54 = task_threads(task_list[v41], &act_list, (mach_msg_type_number_t *)&x[1]);
                  if (v54) {
                    mach_error("task_threads", v54);
                  }
                }
                printf("process: \"%s\" [%d]\n", v43, pid);
                printf("unique ID/version: %llu / %d\n", (void)v483, v484);
                printf("audit: { auid %d uid %u gid %u ruid %u rgid %u pid %u asid %u version %u}\n", v432, DWORD1(v432), DWORD2(v432), HIDWORD(v432), v433, DWORD1(v433), DWORD2(v433), HIDWORD(v433));
                memset(out, 0, 37);
                uuid_unparse((const unsigned __int8 *)&uu, out);
                printf("executable uuid: %s\n", out);
                v368 = v44;
                if (v411 == 7)
                {
                  v57 = "i386";
                  v55 = pid;
                }
                else
                {
                  v55 = pid;
                  if (v411 == 16777223)
                  {
                    v57 = "x86_64";
                  }
                  else
                  {
                    if (v411 == 16777228)
                    {
                      v56 = (HIDWORD(v411) & 0xFFFFFF) == 2;
                      v57 = "arm64";
                      v58 = "arm64e";
                    }
                    else
                    {
                      v56 = v411 == 12;
                      v57 = "???";
                      v58 = "arm";
                    }
                    if (v56) {
                      v57 = v58;
                    }
                  }
                }
                key = (void *)v55;
                printf("architecture: %s\n", v57);
                v59 = 0;
                v60 = 1;
                do
                {
                  v61 = v60;
                  if (v16)
                  {
                    v62 = sub_10000845C();
                    v64 = v63;
                    if ((v59 & 1) == 0) {
                      goto LABEL_154;
                    }
                  }
                  else
                  {
                    v62 = 0;
                    v64 = 0;
                    if ((v59 & 1) == 0)
                    {
LABEL_154:
                      printf("coalition (type %d RESOURCE) ID: %llu\n", 0, v410[0]);
                      if (v16) {
                        goto LABEL_190;
                      }
                      goto LABEL_191;
                    }
                  }
                  printf("coalition (type %d JETSAM) ID: %llu", 1, v410[1]);
                  if (byte_100010001) {
                    v65 = byte_100010002 == 0;
                  }
                  else {
                    v65 = 1;
                  }
                  if (v65 || (byte_10001001C & 1) != 0) {
                    goto LABEL_182;
                  }
                  *(_OWORD *)__endptr = 0u;
                  v543 = 0u;
                  if (coalition_info_debug_info() != -1)
                  {
                    v66 = "A";
                    if ((BYTE4(__endptr[1]) & 2) == 0) {
                      v66 = "-";
                    }
                    v67 = "U";
                    if ((WORD2(__endptr[1]) & 0x100) == 0) {
                      v67 = "-";
                    }
                    v68 = "E";
                    if ((BYTE4(__endptr[1]) & 1) == 0) {
                      v68 = "-";
                    }
                    v69 = "C";
                    if ((BYTE4(__endptr[1]) & 4) == 0) {
                      v69 = "-";
                    }
                    v70 = "B";
                    if ((BYTE4(__endptr[1]) & 8) == 0) {
                      v70 = "-";
                    }
                    v71 = "X";
                    if ((WORD2(__endptr[1]) & 0x200) == 0) {
                      v71 = "-";
                    }
                    v72 = "T";
                    if ((WORD2(__endptr[1]) & 0x400) == 0) {
                      v72 = "-";
                    }
                    v73 = "G";
                    if ((WORD2(__endptr[1]) & 0x800) == 0) {
                      v73 = "-";
                    }
                    v74 = "P";
                    if ((WORD2(__endptr[1]) & 0x1000) == 0) {
                      v74 = "-";
                    }
                    printf(" group 0x%llx (%s%s%s%s%s%s%s%s%s, 0x%d)", __endptr[0], v66, v67, v68, v69, v70, v71, v72, v73, v74, LODWORD(__endptr[1]));
LABEL_182:
                    if (!v16) {
                      goto LABEL_184;
                    }
LABEL_183:
                    printf(" (%s, %s)", v62, v64);
                    goto LABEL_184;
                  }
                  sub_100009030();
                  if (v16) {
                    goto LABEL_183;
                  }
LABEL_184:
                  v75 = coalition_policy_get();
                  if (v75 == 1)
                  {
                    printf(" suppressed (BG)");
                  }
                  else if (v75 == -1 && (byte_10001000C & 1) == 0)
                  {
                    sub_100009004();
                  }
                  putchar(10);
                  if (v16)
                  {
LABEL_190:
                    free(v62);
                    free(v64);
                  }
LABEL_191:
                  v60 = 0;
                  v59 = 1;
                }
                while ((v61 & 1) != 0);
                v76 = *((void *)&v415 + 1);
                v357 = v415;
                printf("suspend count: %d\n", task_info_out);
                v77 = (double)*(unint64_t *)((char *)&task_info_out + 4);
                if (*(void *)((char *)&task_info_out + 4) > 0x8000000000000uLL)
                {
                  v77 = v77 * 8.8817842e-16;
                  v78 = "Pi";
                  goto LABEL_201;
                }
                if (*(void *)((char *)&task_info_out + 4) > 0x20000000000uLL)
                {
                  v77 = v77 * 9.09494702e-13;
                  v78 = "Ti";
                  goto LABEL_201;
                }
                if (*(void *)((char *)&task_info_out + 4) <= 0x80000000uLL)
                {
                  v79 = v368;
                  if (*(void *)((char *)&task_info_out + 4) <= 0x200000uLL)
                  {
                    if (*(void *)((char *)&task_info_out + 4) > 0x800uLL) {
                      v77 = v77 * 0.0009765625;
                    }
                    v78 = (const char *)&unk_100009E75;
                    if (*(void *)((char *)&task_info_out + 4) > 0x800uLL) {
                      v78 = "Ki";
                    }
                  }
                  else
                  {
                    v77 = v77 * 0.000000953674316;
                    v78 = "Mi";
                  }
                }
                else
                {
                  v77 = v77 * 9.31322575e-10;
                  v78 = "Gi";
LABEL_201:
                  v79 = v368;
                }
                v80 = (double)*((unint64_t *)&v458 + 1);
                if (*((void *)&v458 + 1) <= 0x8000000000000uLL)
                {
                  if (*((void *)&v458 + 1) <= 0x20000000000uLL)
                  {
                    if (*((void *)&v458 + 1) <= 0x80000000uLL)
                    {
                      if (*((void *)&v458 + 1) <= 0x200000uLL)
                      {
                        if (*((void *)&v458 + 1) > 0x800uLL) {
                          v80 = v80 * 0.0009765625;
                        }
                        v81 = (const char *)&unk_100009E75;
                        if (*((void *)&v458 + 1) > 0x800uLL) {
                          v81 = "Ki";
                        }
                      }
                      else
                      {
                        v80 = v80 * 0.000000953674316;
                        v81 = "Mi";
                      }
                    }
                    else
                    {
                      v80 = v80 * 9.31322575e-10;
                      v81 = "Gi";
                    }
                  }
                  else
                  {
                    v80 = v80 * 9.09494702e-13;
                    v81 = "Ti";
                  }
                }
                else
                {
                  v80 = v80 * 8.8817842e-16;
                  v81 = "Pi";
                }
                v82 = (double)*(unint64_t *)&v469[0];
                if (*(void *)&v469[0] <= 0x8000000000000uLL)
                {
                  if (*(void *)&v469[0] <= 0x20000000000uLL)
                  {
                    if (*(void *)&v469[0] <= 0x80000000uLL)
                    {
                      if (*(void *)&v469[0] <= 0x200000uLL)
                      {
                        if (*(void *)&v469[0] > 0x800uLL) {
                          v82 = v82 * 0.0009765625;
                        }
                        v83 = (const char *)&unk_100009E75;
                        if (*(void *)&v469[0] > 0x800uLL) {
                          v83 = "Ki";
                        }
                      }
                      else
                      {
                        v82 = v82 * 0.000000953674316;
                        v83 = "Mi";
                      }
                    }
                    else
                    {
                      v82 = v82 * 9.31322575e-10;
                      v83 = "Gi";
                    }
                  }
                  else
                  {
                    v82 = v82 * 9.09494702e-13;
                    v83 = "Ti";
                  }
                }
                else
                {
                  v82 = v82 * 8.8817842e-16;
                  v83 = "Pi";
                }
                printf("virtual bytes: %.2f %s%s; phys_footprint bytes: %.2f %s%s; phys_footprint lifetime maximum bytes: %.2f %s%s\n",
                  v77,
                  v78,
                  "B",
                  v80,
                  v81,
                  "B",
                  v82,
                  v83,
                  "B");
                if (*((void *)&v476 + 1))
                {
                  v84 = (double)(unint64_t)v476;
                  if ((unint64_t)v476 <= 0x8000000000000)
                  {
                    if ((unint64_t)v476 <= 0x20000000000)
                    {
                      if ((unint64_t)v476 <= 0x80000000)
                      {
                        if ((unint64_t)v476 <= 0x200000)
                        {
                          if ((unint64_t)v476 > 0x800) {
                            v84 = v84 * 0.0009765625;
                          }
                          v85 = (const char *)&unk_100009E75;
                          if ((unint64_t)v476 > 0x800) {
                            v85 = "Ki";
                          }
                        }
                        else
                        {
                          v84 = v84 * 0.000000953674316;
                          v85 = "Mi";
                        }
                      }
                      else
                      {
                        v84 = v84 * 9.31322575e-10;
                        v85 = "Gi";
                      }
                    }
                    else
                    {
                      v84 = v84 * 9.09494702e-13;
                      v85 = "Ti";
                    }
                  }
                  else
                  {
                    v84 = v84 * 8.8817842e-16;
                    v85 = "Pi";
                  }
                  v86 = (double)*((unint64_t *)&v476 + 1);
                  if (*((void *)&v476 + 1) <= 0x8000000000000uLL)
                  {
                    if (*((void *)&v476 + 1) <= 0x20000000000uLL)
                    {
                      if (*((void *)&v476 + 1) <= 0x80000000uLL)
                      {
                        if (*((void *)&v476 + 1) <= 0x200000uLL)
                        {
                          if (*((void *)&v476 + 1) > 0x800uLL) {
                            v86 = v86 * 0.0009765625;
                          }
                          v87 = (const char *)&unk_100009E75;
                          if (*((void *)&v476 + 1) > 0x800uLL) {
                            v87 = "Ki";
                          }
                        }
                        else
                        {
                          v86 = v86 * 0.000000953674316;
                          v87 = "Mi";
                        }
                      }
                      else
                      {
                        v86 = v86 * 9.31322575e-10;
                        v87 = "Gi";
                      }
                    }
                    else
                    {
                      v86 = v86 * 9.09494702e-13;
                      v87 = "Ti";
                    }
                  }
                  else
                  {
                    v86 = v86 * 8.8817842e-16;
                    v87 = "Pi";
                  }
                  printf("neural footprint: %.2f %s%s neural footprint lifetime maximum bytes: %.2f %s%s\n", v84, v85, "B", v86, v87, "B");
                }
                v359 = v76;
                v88 = time(0);
                printf("run time: %lld s\n", v88 - *((void *)&v489 + 1));
                printf("user/system time    (current threads): %lf s / %lf s\n", (double)SHIDWORD(v427) / 1000000.0 + (double)(int)v427, (double)SHIDWORD(v428) / 1000000.0 + (double)(int)v428);
                printf("user/system time (terminated threads): %lf s / %lf s\n", (double)SDWORD2(v430) / 1000000.0 + (double)SDWORD1(v430), (double)(int)v431 / 1000000.0 + (double)SHIDWORD(v430));
                __endptr[0] = *((char **)&v469[0] + 1);
                __endptr[1] = *(char **)&v469[1];
                v543 = v455;
                *(void *)&v544 = v474;
                v354 = *(void *)&v469[1];
                v355 = *((void *)&v469[0] + 1);
                v444 = *(_OWORD *)((char *)v469 + 8);
                v352 = v455.i64[1];
                v353 = v455.i64[0];
                v445 = v455;
                v351 = v474;
                *(void *)&v446 = v474;
                sub_100008504("CPU time:", (unint64_t *)__endptr, &v444, 0, (const char *)&unk_100009E75);
                if (v356 >= 2)
                {
                  v340 = v474 - *((void *)&v474 + 1);
                  v339.i64[1] = v455.i64[1] - v472.i64[1];
                  v339.i64[0] = v455.i64[0] - v472.i64[0];
                  v338 = (char *)(*(void *)&v469[1] - *((void *)&v473 + 1));
                  v89 = (char *)(*((void *)&v469[0] + 1) - v473);
                  *(_OWORD *)__endptr = v473;
                  v543 = v472;
                  *(void *)&v544 = *((void *)&v474 + 1);
                  *(void *)&v444 = v355;
                  *((void *)&v444 + 1) = v354;
                  v445.i64[0] = v353;
                  v445.i64[1] = v352;
                  *(void *)&v446 = v351;
                  sub_100008504("P-time:  ", (unint64_t *)__endptr, &v444, 1, (const char *)&unk_100009E75);
                  __endptr[0] = v89;
                  __endptr[1] = v338;
                  v543 = v339;
                  *(void *)&v544 = v340;
                  *(void *)&v444 = v355;
                  *((void *)&v444 + 1) = v354;
                  v445.i64[0] = v353;
                  v445.i64[1] = v352;
                  *(void *)&v446 = v351;
                  sub_100008504("E-time:  ", (unint64_t *)__endptr, &v444, 1, (const char *)&unk_100009E75);
                  if (HIDWORD(v419)) {
                    v90 = (double)v426 * 100.0 / (double)(unint64_t)SHIDWORD(v419);
                  }
                  else {
                    v90 = 0.0;
                  }
                  printf("P/E switches: %llu (%.0f%%)\n", v426, v90);
                  v16 = v375;
                  v79 = v368;
                }
                printf("CPU time billed to me by others: %llu.%06llu s ", *((void *)&v467 + 1) * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00, *((void *)&v467 + 1) * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00/ 0x3E8);
                sub_100008A20();
                putchar(10);
                v91 = 0.0;
                v92 = 0.0;
                if (v455.i64[1] + v455.i64[0]) {
                  v92 = (double)(unint64_t)v468 * 100.0 / (double)(unint64_t)(v455.i64[1] + v455.i64[0]);
                }
                printf("CPU time I billed to others: %llu.%06llu s (%.0f%%) ", (unint64_t)v468 * dword_100010004 / unk_100010008 / 0x3B9ACA00, (unint64_t)v468 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, v92);
                sub_100008A20();
                if ((void)v474) {
                  v91 = (double)(unint64_t)v470 * 100.0 / (double)(unint64_t)v474;
                }
                printf(" (%.0f%%)\n", v91);
                v93 = (unint64_t)v467 * dword_100010004 / unk_100010008;
                v94 = *((void *)&v466 + 1) * (unint64_t)dword_100010004 / unk_100010008;
                v95 = (unint64_t)v466 * dword_100010004 / unk_100010008;
                v96 = *((void *)&v465 + 1) * (unint64_t)dword_100010004 / unk_100010008;
                printf("QoS time (s): UI: %llu.%06llu IN: %llu.%06llu DF: %llu.%06llu UT: %llu.%06llu BG: %llu.%06llu MT: %llu.%06llu UN: %llu.%06llu\n", v93 / 0x3B9ACA00, v93 % 0x3B9ACA00 / 0x3E8, v94 / 0x3B9ACA00, v94 % 0x3B9ACA00 / 0x3E8, v95 / 0x3B9ACA00, v95 % 0x3B9ACA00 / 0x3E8, v96 / 0x3B9ACA00, v96 % 0x3B9ACA00 / 0x3E8, (unint64_t)v465 * dword_100010004 / unk_100010008 / 0x3B9ACA00, (unint64_t)v465 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, *((void *)&v464 + 1) * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00, *((void *)&v464 + 1) * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00/ 0x3E8, (unint64_t)v464 * dword_100010004 / unk_100010008 / 0x3B9ACA00, (unint64_t)v464 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8);
                if ((void)v421) {
                  v97 = (double)*((unint64_t *)&v421 + 1) * 100.0 / (double)(unint64_t)v421;
                }
                else {
                  v97 = 0.0;
                }
                printf("interrupt wakeups: %llu (%llu / %.2f%% from platform idle)\n", (void)v421, *((void *)&v421 + 1), v97);
                if (HIDWORD(v431) >= 3)
                {
                  v98 = "???";
                  if (HIDWORD(v431) == 4) {
                    v98 = "POLICY_FIFO";
                  }
                }
                else
                {
                  v98 = off_10000C408[SHIDWORD(v431)];
                }
                printf("default sched policy: %s\n", v98);
                v99 = (double)(unint64_t)v463;
                if ((unint64_t)v463 <= 0x8000000000000)
                {
                  if ((unint64_t)v463 <= 0x20000000000)
                  {
                    if ((unint64_t)v463 <= 0x80000000)
                    {
                      if ((unint64_t)v463 <= 0x200000)
                      {
                        if ((unint64_t)v463 > 0x800) {
                          v99 = v99 * 0.0009765625;
                        }
                        v100 = (const char *)&unk_100009E75;
                        if ((unint64_t)v463 > 0x800) {
                          v100 = "Ki";
                        }
                      }
                      else
                      {
                        v99 = v99 * 0.000000953674316;
                        v100 = "Mi";
                      }
                    }
                    else
                    {
                      v99 = v99 * 9.31322575e-10;
                      v100 = "Gi";
                    }
                  }
                  else
                  {
                    v99 = v99 * 9.09494702e-13;
                    v100 = "Ti";
                  }
                }
                else
                {
                  v99 = v99 * 8.8817842e-16;
                  v100 = "Pi";
                }
                v101 = (double)*((unint64_t *)&v463 + 1);
                if (*((void *)&v463 + 1) <= 0x8000000000000uLL)
                {
                  if (*((void *)&v463 + 1) <= 0x20000000000uLL)
                  {
                    if (*((void *)&v463 + 1) <= 0x80000000uLL)
                    {
                      if (*((void *)&v463 + 1) <= 0x200000uLL)
                      {
                        if (*((void *)&v463 + 1) > 0x800uLL) {
                          v101 = v101 * 0.0009765625;
                        }
                        v102 = (const char *)&unk_100009E75;
                        if (*((void *)&v463 + 1) > 0x800uLL) {
                          v102 = "Ki";
                        }
                      }
                      else
                      {
                        v101 = v101 * 0.000000953674316;
                        v102 = "Mi";
                      }
                    }
                    else
                    {
                      v101 = v101 * 9.31322575e-10;
                      v102 = "Gi";
                    }
                  }
                  else
                  {
                    v101 = v101 * 9.09494702e-13;
                    v102 = "Ti";
                  }
                }
                else
                {
                  v101 = v101 * 8.8817842e-16;
                  v102 = "Pi";
                }
                v103 = (double)*((unint64_t *)&v468 + 1);
                if (*((void *)&v468 + 1) <= 0x8000000000000uLL)
                {
                  if (*((void *)&v468 + 1) <= 0x20000000000uLL)
                  {
                    if (*((void *)&v468 + 1) <= 0x80000000uLL)
                    {
                      if (*((void *)&v468 + 1) <= 0x200000uLL)
                      {
                        if (*((void *)&v468 + 1) > 0x800uLL) {
                          v103 = v103 * 0.0009765625;
                        }
                        v104 = (const char *)&unk_100009E75;
                        if (*((void *)&v468 + 1) > 0x800uLL) {
                          v104 = "Ki";
                        }
                      }
                      else
                      {
                        v103 = v103 * 0.000000953674316;
                        v104 = "Mi";
                      }
                    }
                    else
                    {
                      v103 = v103 * 9.31322575e-10;
                      v104 = "Gi";
                    }
                  }
                  else
                  {
                    v103 = v103 * 9.09494702e-13;
                    v104 = "Ti";
                  }
                }
                else
                {
                  v103 = v103 * 8.8817842e-16;
                  v104 = "Pi";
                }
                printf("bytes read: %.2f %s%s written: %.2f %s%s logical writes: %.2f %s%s\n", v99, v100, "B", v101, v102, "B", v103, v104, "B");
                if (basic_info.iisb_table_size) {
                  v105 = (double)basic_info.iisb_table_inuse * 100.0 / (double)basic_info.iisb_table_size;
                }
                else {
                  v105 = 0.0;
                }
                printf("mach ports: %d (%.0f%% occupied)\n", basic_info.iisb_table_inuse, v105);
                printf("faults: %d, pageins: %d, cow_faults: %d, msgsent: %d, msgrecv: %d, syscalls (mach/unix): %d / %d, csw: %d\n", v418, DWORD1(v418), DWORD2(v418), HIDWORD(v418), v419, DWORD1(v419), DWORD2(v419), HIDWORD(v419));
                if (HIDWORD(v417)) {
                  printf("affinity sets: %d tasks: %d (min: %d max: %d)", v416, HIDWORD(v417), HIDWORD(v416), v417);
                }
                v106.i64[0] = v492;
                v106.i64[1] = v493[0];
                if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v106), (int32x4_t)vceqzq_s64(*(int64x2_t *)&v493[1]))))) & 1) != 0|| *((void *)&v492 + 1)|| v493[3])
                {
                  printf("extmod: task for pid: %lld (%lld) thread injection: %lld (%lld) set state: %lld (%lld)\n", (void)v492, *((void *)&v492 + 1), v493[0], v493[1], v493[2], v493[3]);
                }
                if (v363)
                {
                  printf("workqueue threads: %d running: %d blocked: %d", v408, HIDWORD(v408), v409);
                  v107 = BYTE4(v409);
                  if ((v409 & 0x100000000) != 0)
                  {
                    printf(" constrained-limit");
                    v107 = BYTE4(v409);
                    if ((v409 & 0x200000000) != 0) {
                      goto LABEL_354;
                    }
LABEL_326:
                    if ((v107 & 8) == 0) {
                      goto LABEL_327;
                    }
LABEL_355:
                    printf(" cooperative-limit");
                    if ((v409 & 0x1000000000) != 0) {
LABEL_328:
                    }
                      printf(" active-constrained-limit");
                  }
                  else
                  {
                    if ((v409 & 0x200000000) == 0) {
                      goto LABEL_326;
                    }
LABEL_354:
                    printf(" total-limit");
                    v107 = BYTE4(v409);
                    if ((v409 & 0x800000000) != 0) {
                      goto LABEL_355;
                    }
LABEL_327:
                    if ((v107 & 0x10) != 0) {
                      goto LABEL_328;
                    }
                  }
                  putchar(10);
                }
                LODWORD(__endptr[0]) = 0;
                LODWORD(v444) = 0;
                v451[0] = 0;
                v389[0] = 0;
                printf("CPU usage monitor: ");
                if (proc_get_cpumon_params())
                {
                  sub_100008FD8();
                }
                else if (SLODWORD(__endptr[0]) > 0 || (int)v444 >= 1)
                {
                  printf("%d%% CPU over %d seconds\n", LODWORD(__endptr[0]), v444);
                }
                else
                {
                  puts("none");
                }
                printf("CPU wakes monitor: ");
                if (proc_get_wakemon_params())
                {
                  sub_100008FAC();
                }
                else if (v451[0] < 1)
                {
                  puts("none");
                }
                else
                {
                  printf("%d wakes per second (over system-default time period)\n", v451[0]);
                }
                v108 = "tracked";
                if ((flags & 1) == 0) {
                  v108 = "untracked";
                }
                v109 = (const char *)&unk_100009E75;
                if ((~flags & 3) == 0) {
                  v109 = "idle-exit";
                }
                v110 = "dirty";
                if ((flags & 5) == 1) {
                  v110 = "clean";
                }
                printf("dirty tracking: %s %s %s\n", v108, v109, v110);
                if ((v79 & 1) == 0)
                {
                  printf("boosts: %d (%d externalized)\n", DWORD2(v413), HIDWORD(v413));
                  if (cf && DWORD2(v413))
                  {
                    v111 = (const __CFArray *)CFDictionaryGetValue(cf, key);
                    if (v111)
                    {
                      v112 = v111;
                      if (CFArrayGetCount(v111) >= 1)
                      {
                        v113 = 0;
                        do
                        {
                          ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v112, v113);
                          printf("\tboosted by: \"%s\" [%d]\n", ValueAtIndex + 88, *((_DWORD *)ValueAtIndex + 21));
                          ++v113;
                        }
                        while (v113 < CFArrayGetCount(v112));
                      }
                    }
                    else
                    {
                      puts("\tsource(s) of boost(s) unknown");
                    }
                  }
                  puts("requested policy");
                  printf("\treq apptype: %s\n", off_10000C358[(v357 >> 17) & 7]);
                  v115 = (v357 >> 21) & 0x1F;
                  v116 = "???";
                  if (v115 <= 8) {
                    v116 = off_10000C3C0[v115];
                  }
                  printf("\treq role: %s\n", v116);
                  v117 = (v357 >> 33) & 7;
                  if v117 != 7 && ((0x7Du >> v117))
                  {
                    v118 = off_10000C420[v117];
                  }
                  else
                  {
                    v11 = v117 == 1;
                    v118 = "???";
                    if (v11) {
                      v118 = "THREAD_QOS_MAINTENANCE";
                    }
                  }
                  printf("\treq qos clamp: %s\n", v118);
                  v119 = (v357 >> 11) & 7;
                  v120 = v119 == 6;
                  v79 = v368;
                  if (v119 >= 6)
                  {
                    v121 = "???";
                    if (v120) {
                      v121 = "LATENCY_QOS_TIER_5";
                    }
                  }
                  else
                  {
                    v121 = off_10000C458[v119];
                  }
                  v122 = (v357 >> 26) & 7;
                  v123 = v122 == 6;
                  if (v122 >= 6)
                  {
                    v124 = "???";
                    if (v123) {
                      v124 = "LATENCY_QOS_TIER_5";
                    }
                  }
                  else
                  {
                    v124 = off_10000C458[v122];
                  }
                  printf("\treq base/override latency qos: %s / %s\n", v121, v124);
                  v125 = (v357 >> 14) & 7;
                  v126 = v125 == 6;
                  if (v125 >= 6)
                  {
                    v127 = "???";
                    if (v126) {
                      v127 = "THROUGHPUT_QOS_TIER_5";
                    }
                  }
                  else
                  {
                    v127 = off_10000C488[v125];
                  }
                  v128 = v357 >> 29;
                  v129 = "THROUGHPUT_QOS_TIER_UNSPECIFIED";
                  if (v128)
                  {
                    if ((v128 - 1) >= 5)
                    {
                      v129 = "???";
                      if (v128 == 6) {
                        v129 = "THROUGHPUT_QOS_TIER_5";
                      }
                    }
                    else
                    {
                      v129 = off_10000C398[v128 - 1];
                    }
                  }
                  printf("\treq base/override thruput qos: %s / %s\n", v127, v129);
                  v130 = "NO";
                  if ((v357 & 3) != 0) {
                    v130 = "YES";
                  }
                  v131 = (const char *)&unk_100009E75;
                  v132 = "(internal)";
                  if ((v357 & 1) == 0) {
                    v132 = (const char *)&unk_100009E75;
                  }
                  if ((v357 & 2) != 0) {
                    v131 = "(external)";
                  }
                  printf("\treq darwin BG: %s %s %s\n", v130, v132, v131);
                  v133 = (v357 >> 2) & 3;
                  v134 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                  if (v133 != 3) {
                    v134 = off_10000C4B8[v133];
                  }
                  v135 = (v357 >> 4) & 3;
                  v136 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                  if (v135 != 3) {
                    v136 = off_10000C4B8[v135];
                  }
                  printf("\treq internal/external iotier: %s / %s\n", v134, v136);
                  v137 = (v357 >> 8) & 3;
                  v138 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                  if (v137 != 3) {
                    v138 = off_10000C4B8[v137];
                  }
                  printf("\treq darwin BG iotier: %s\n", v138);
                  v139 = "NO";
                  if ((v357 & (unint64_t)&_mh_execute_header) != 0) {
                    v139 = "YES";
                  }
                  printf("\treq managed: %s\n", v139);
                  printf("\treq other: ");
                  if ((v357 & 0x40) != 0)
                  {
                    printf("passive-int ");
                    if ((v357 & 0x80) != 0) {
                      goto LABEL_409;
                    }
LABEL_399:
                    if ((v357 & 0x400) == 0) {
                      goto LABEL_400;
                    }
LABEL_410:
                    printf("terminated ");
                    if ((v357 & 0x100000) != 0) {
LABEL_401:
                    }
                      printf("boosted ");
                  }
                  else
                  {
                    if ((v357 & 0x80) == 0) {
                      goto LABEL_399;
                    }
LABEL_409:
                    printf("passive-ext ");
                    if ((v357 & 0x400) != 0) {
                      goto LABEL_410;
                    }
LABEL_400:
                    if ((v357 & 0x100000) != 0) {
                      goto LABEL_401;
                    }
                  }
                  putchar(10);
                  printf("\treq suppression (App Nap) behaviors: ");
                  if ((v357 & 0x1000000000) == 0)
                  {
                    if ((v357 & 0x2000000000) == 0) {
                      goto LABEL_404;
                    }
LABEL_413:
                    printf("low-priority-cpu (4) ");
                    if ((v357 & 0x200000000000) == 0) {
                      goto LABEL_406;
                    }
LABEL_405:
                    printf("low-priority-cpu (28) ");
                    goto LABEL_406;
                  }
                  printf("active ");
                  if ((v357 & 0x2000000000) != 0) {
                    goto LABEL_413;
                  }
LABEL_404:
                  if ((v357 & 0x200000000000) != 0) {
                    goto LABEL_405;
                  }
LABEL_406:
                  v140 = "LATENCY_QOS_TIER_0";
                  switch((v357 >> 38) & 7)
                  {
                    case 0uLL:
                      break;
                    case 1uLL:
                      goto LABEL_421;
                    case 2uLL:
                      v140 = "LATENCY_QOS_TIER_1";
                      goto LABEL_421;
                    case 3uLL:
                      v140 = "LATENCY_QOS_TIER_2";
                      goto LABEL_421;
                    case 4uLL:
                      v140 = "LATENCY_QOS_TIER_3";
                      goto LABEL_421;
                    case 5uLL:
                      v140 = "LATENCY_QOS_TIER_4";
                      goto LABEL_421;
                    default:
                      v140 = "???";
                      if ("LATENCY_QOS_TIER_0" == 6) {
                        v140 = "LATENCY_QOS_TIER_5";
                      }
LABEL_421:
                      printf("timer-throttling (%s) ", v140);
                      break;
                  }
                  v141 = "THROUGHPUT_QOS_TIER_0";
                  switch((v357 >> 42) & 7)
                  {
                    case 0uLL:
                      goto LABEL_431;
                    case 1uLL:
                      goto LABEL_430;
                    case 2uLL:
                      v141 = "THROUGHPUT_QOS_TIER_1";
                      goto LABEL_430;
                    case 3uLL:
                      v141 = "THROUGHPUT_QOS_TIER_2";
                      goto LABEL_430;
                    case 4uLL:
                      v141 = "THROUGHPUT_QOS_TIER_3";
                      goto LABEL_430;
                    case 5uLL:
                      v141 = "THROUGHPUT_QOS_TIER_4";
                      goto LABEL_430;
                    default:
                      v141 = "???";
                      if ("THROUGHPUT_QOS_TIER_0" == 6) {
                        v141 = "THROUGHPUT_QOS_TIER_5";
                      }
LABEL_430:
                      printf("throughput-qos (%s) ", v141);
LABEL_431:
                      if ((v357 & 0x20000000000) != 0) {
                        printf("disk-throttling ");
                      }
                      if ((v357 & 0x400000000000) != 0) {
                        printf("bg-sockets ");
                      }
                      putchar(10);
                      puts("effective policy");
                      v142 = (v359 >> 20) & 0xF;
                      v143 = "???";
                      if (v142 <= 8) {
                        v143 = off_10000C3C0[v142];
                      }
                      printf("\teff role: %s\n", v143);
                      v144 = (v359 >> 11) & 7;
                      v145 = v144 == 6;
                      if (v144 >= 6)
                      {
                        v146 = "???";
                        if (v145) {
                          v146 = "LATENCY_QOS_TIER_5";
                        }
                      }
                      else
                      {
                        v146 = off_10000C458[v144];
                      }
                      printf("\teff latency qos: %s\n", v146);
                      v147 = (v359 >> 14) & 7;
                      v148 = v147 == 6;
                      if (v147 >= 6)
                      {
                        v149 = "???";
                        if (v148) {
                          v149 = "THROUGHPUT_QOS_TIER_5";
                        }
                      }
                      else
                      {
                        v149 = off_10000C488[v147];
                      }
                      printf("\teff thruput qos: %s\n", v149);
                      v150 = "NO";
                      if (v359) {
                        v150 = "YES";
                      }
                      printf("\teff darwin BG: %s\n", v150);
                      v151 = (v359 >> 2) & 3;
                      v152 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v151 != 3) {
                        v152 = off_10000C4B8[v151];
                      }
                      printf("\teff iotier: %s\n", v152);
                      v153 = "NO";
                      if ((v359 & 0x2000000) != 0) {
                        v153 = "YES";
                      }
                      printf("\teff managed: %s\n", v153);
                      v154 = (v359 >> 30) & 7;
                      if v154 != 7 && ((0x7Du >> v154))
                      {
                        v155 = off_10000C420[v154];
                      }
                      else
                      {
                        v11 = v154 == 1;
                        v155 = "???";
                        if (v11) {
                          v155 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\teff qos ceiling: %s\n", v155);
                      v156 = (v359 >> 27) & 7;
                      if (v156 != 7 && ((0x7Du >> v156) & 1) != 0)
                      {
                        v157 = off_10000C420[v156];
                      }
                      else
                      {
                        v11 = v156 == 1;
                        v157 = "???";
                        if (v11) {
                          v157 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\teff qos clamp: %s\n", v157);
                      printf("\teff other: ");
                      if ((v359 & 0x10) != 0) {
                        printf("passive ");
                      }
                      v158 = "low-priority-cpu (4) ";
                      if ((v359 & 2) != 0 || (v158 = "low-priority-cpu (28) ", (v359 & 0x1000000) != 0))
                      {
                        printf(v158);
                        if ((v359 & 0x20) == 0)
                        {
LABEL_468:
                          if ((v359 & 0x40) == 0) {
                            goto LABEL_469;
                          }
                          goto LABEL_494;
                        }
                      }
                      else if ((v359 & 0x20) == 0)
                      {
                        goto LABEL_468;
                      }
                      printf("bg-allsockets ");
                      if ((v359 & 0x40) == 0)
                      {
LABEL_469:
                        if ((v359 & 0x200) == 0) {
                          goto LABEL_470;
                        }
                        goto LABEL_495;
                      }
LABEL_494:
                      printf("bg-newsockets ");
                      if ((v359 & 0x200) == 0)
                      {
LABEL_470:
                        if ((v359 & 0x20000) == 0) {
                          goto LABEL_471;
                        }
                        goto LABEL_496;
                      }
LABEL_495:
                      printf("terminated ");
                      if ((v359 & 0x20000) == 0)
                      {
LABEL_471:
                        if ((v359 & 0x40000) == 0) {
                          goto LABEL_472;
                        }
                        goto LABEL_497;
                      }
LABEL_496:
                      printf("tal-engaged ");
                      if ((v359 & 0x40000) == 0)
                      {
LABEL_472:
                        if ((v359 & 0x80000) == 0) {
                          goto LABEL_473;
                        }
                        goto LABEL_498;
                      }
LABEL_497:
                      printf("bg-watchers ");
                      if ((v359 & 0x80000) == 0)
                      {
LABEL_473:
                        if ((v359 & 0x4000000) == 0) {
                          goto LABEL_474;
                        }
                        goto LABEL_499;
                      }
LABEL_498:
                      printf("suppression-active (App Nap) ");
                      if ((v359 & 0x4000000) == 0)
                      {
LABEL_474:
                        if ((v359 & 0x400) == 0) {
                          goto LABEL_475;
                        }
                        goto LABEL_500;
                      }
LABEL_499:
                      printf("live-donor ");
                      if ((v359 & 0x400) == 0)
                      {
LABEL_475:
                        if ((v359 & 0x400000000) == 0) {
                          goto LABEL_477;
                        }
LABEL_476:
                        printf("coalition-suppressed (BG) ");
                        goto LABEL_477;
                      }
LABEL_500:
                      printf("ui-is-urgent ");
                      if ((v359 & 0x400000000) != 0) {
                        goto LABEL_476;
                      }
LABEL_477:
                      putchar(10);
                      break;
                  }
                }
                if ((buffer[0] & 0x20000) != 0) {
                  v159 = "YES";
                }
                else {
                  v159 = "NO";
                }
                printf("ios-appledaemon: %s\n", v159);
                if ((buffer[0] & 0x80000) != 0) {
                  v160 = "YES";
                }
                else {
                  v160 = "NO";
                }
                printf("ios-imppromotion: %s\n", v160);
                if ((buffer[0] & 0x1000000) != 0) {
                  v161 = "YES";
                }
                else {
                  v161 = "NO";
                }
                printf("ios-application: %s\n", v161);
                if ((v79 & 1) == 0)
                {
                  v162 = getpriority(7, pid);
                  if (v162 == 1)
                  {
                    puts("game mode: ON");
                  }
                  else if (v162 == -1 && (byte_10001000D & 1) == 0)
                  {
                    sub_100008F80();
                  }
                  v163 = getpriority(8, pid);
                  if (v163 == 1)
                  {
                    puts("carplay mode: ON");
                  }
                  else if (v163 == -1 && (byte_10001000E & 1) == 0)
                  {
                    sub_100008F54();
                  }
                  *__error() = 0;
                  v164 = getpriority(0, pid);
                  if (v164)
                  {
                    v165 = v164;
                    if (v164 == -1 && *__error()) {
                      perror("getpriority(PRIO_PROCESS, pid)");
                    }
                    else {
                      printf("nice: %d\n", v165);
                    }
                  }
                  if (v414)
                  {
                    v166 = "YES";
                    if ((v414 & 2) == 0)
                    {
                      v166 = "YES (boosted receiver)";
                      if (!DWORD2(v413)) {
                        v166 = "NO";
                      }
                    }
                  }
                  else if ((v414 & 4) != 0)
                  {
                    v166 = "CURRENTLY";
                    if ((v414 & 2) == 0) {
                      v166 = "NOT CURRENTLY";
                    }
                  }
                  else if ((v414 & 2) != 0)
                  {
                    v166 = "YES";
                  }
                  else
                  {
                    v166 = "NO";
                  }
                  printf("imp_donor: %s\n", v166);
                  v167 = "DE-NAP";
                  if ((v414 & 8) == 0) {
                    v167 = "NO";
                  }
                  if (v414) {
                    v168 = "YES";
                  }
                  else {
                    v168 = v167;
                  }
                  printf("imp_receiver: %s\n", v168);
                }
                if ((v414 & 0x10) != 0) {
                  v169 = "YES";
                }
                else {
                  v169 = "NO";
                }
                printf("pid suspended: %s\n", v169);
                if ((buffer[0] & 0x100000) != 0) {
                  v170 = "YES";
                }
                else {
                  v170 = "NO";
                }
                if ((buffer[0] & 0x200000) != 0) {
                  v171 = "YES";
                }
                else {
                  v171 = "NO";
                }
                printf("adaptive daemon: %s (boosted: %s)\n", v170, v171);
                v172 = pid;
                if (HIDWORD(v439))
                {
                  puts("threads:");
                  if (x[1])
                  {
                    v173 = 0;
                    v364 = v79 | v337;
                    v365 = v41;
                    do
                    {
                      v404 = 0;
                      v403 = 0u;
                      thread_info_out = 0u;
                      v400[0] = 0;
                      v400[1] = 0;
                      v401 = 0;
                      v397 = 0;
                      v398 = 0;
                      v399 = 0;
                      *(void *)v396 = 0;
                      v394 = 0;
                      v395 = 0;
                      *(void *)v393 = 0;
                      v391 = 0u;
                      v392 = 0u;
                      *(_OWORD *)v389 = 0u;
                      v390 = 0u;
                      v449 = 0u;
                      v450 = 0u;
                      v447 = 0u;
                      v448 = 0u;
                      v445 = 0u;
                      v446 = 0u;
                      v444 = 0u;
                      task_info_outCnt = 10;
                      v174 = thread_info(act_list[v173], 3u, (thread_info_t)&thread_info_out, &task_info_outCnt);
                      if (v174) {
                        mach_error("thread_info(... THREAD_BASIC_INFO ...)", v174);
                      }
                      task_info_outCnt = 6;
                      v175 = thread_info(act_list[v173], 4u, (thread_info_t)v400, &task_info_outCnt);
                      if (v175) {
                        mach_error("thread_info(... THREAD_IDENTIFIER_INFO ...)", v175);
                      }
                      v176 = 0;
                      if (v439 && v401)
                      {
                        __endptr[0] = 0;
                        object_type.i64[0] = 0;
                        outsize = 0;
                        v452 = 0;
                        v177 = vm_read_overwrite(task_list[v41], v401, 8uLL, (vm_address_t)__endptr, &outsize);
                        if (v177)
                        {
                          v178 = v177;
                          v179 = "vm_read_overwrite(... &qaddr ...)";
LABEL_549:
                          mach_error(v179, v178);
                          v176 = 0;
                          goto LABEL_550;
                        }
                        v176 = 0;
                        if (outsize == 8 && __endptr[0])
                        {
                          v198 = vm_read_overwrite(task_list[v41], (vm_address_t)&__endptr[0][v341], 8uLL, (vm_address_t)&object_type, &outsize);
                          if (v198)
                          {
                            v178 = v198;
                            v179 = "vm_read_overwrite(... &label_addr ...)";
                            goto LABEL_549;
                          }
                          v176 = 0;
                          if (outsize == 8 && object_type.i64[0])
                          {
                            v253 = vm_read_overwrite(task_list[v41], object_type.u64[0], 0x40uLL, (vm_address_t)v451, &outsize);
                            if (v253)
                            {
                              v178 = v253;
                              v179 = "vm_read_overwrite(... dqlabel ...)";
                              goto LABEL_549;
                            }
                            v176 = 1;
                          }
                        }
                      }
LABEL_550:
                      if (DWORD1(v403) == 2)
                      {
                        task_info_outCnt = 5;
                        v183 = thread_info(act_list[v173], 0xBu, (thread_info_t)&v397, &task_info_outCnt);
                        if (!v183) {
                          goto LABEL_557;
                        }
                        v181 = v183;
                        v182 = "thread_info(... THREAD_SCHED_RR_INFO ...)";
                        goto LABEL_556;
                      }
                      if (DWORD1(v403) == 1)
                      {
                        task_info_outCnt = 5;
                        v180 = thread_info(act_list[v173], 0xAu, (thread_info_t)&v397, &task_info_outCnt);
                        if (v180)
                        {
                          v181 = v180;
                          v182 = "thread_info(... THREAD_SCHED_TIMESHARE_INFO ...)";
LABEL_556:
                          mach_error(v182, v181);
                        }
                      }
LABEL_557:
                      get_default = 0;
                      task_info_outCnt = 1;
                      v184 = thread_policy_get(act_list[v173], 1u, &v396[1], &task_info_outCnt, &get_default);
                      if (v184) {
                        mach_error("thread_policy_get(... THREAD_EXTENDED_POLICY ...)", v184);
                      }
                      v386 = 0;
                      task_info_outCnt = 5;
                      v185 = thread_policy_get(act_list[v173], 0xAu, (thread_policy_t)&v394, &task_info_outCnt, &v386);
                      if (v185) {
                        mach_error("thread_policy_get(... THREAD_TIME_CONSTRAINT_WITH_PRIORITY_POLICY ...)", v185);
                      }
                      v386 = 0;
                      task_info_outCnt = 1;
                      v186 = thread_policy_get(act_list[v173], 3u, &v393[1], &task_info_outCnt, &v386);
                      if (v186) {
                        mach_error("thread_policy_get(... THREAD_PRECEDENCE_POLICY ...)", v186);
                      }
                      v386 = 0;
                      task_info_outCnt = 1;
                      v187 = thread_policy_get(act_list[v173], 4u, v393, &task_info_outCnt, &v386);
                      if (v187)
                      {
                        if (v187 == 46)
                        {
                          v369 = 1;
                          goto LABEL_568;
                        }
                        mach_error("thread_policy_get(... THREAD_AFFINITY_POLICY ...)", v187);
                      }
                      v369 = 0;
LABEL_568:
                      v386 = 0;
                      task_info_outCnt = 16;
                      v188 = thread_policy_get(act_list[v173], 6u, v389, &task_info_outCnt, &v386);
                      if (v188) {
                        mach_error("thread_policy_get(... THREAD_POLICY_STATE ...)", v188);
                      }
                      v190 = DWORD2(v390);
                      v189 = v390;
                      v191 = proc_pidinfo(v172, 15, v400[0], &v444, 112);
                      if (v191 <= 111) {
                        perror("proc_pidinfo(... PROC_PIDTHREADID64INFO ...)");
                      }
                      printf("\tthread ID: 0x%llx / %lld\n", v400[0], v400[0]);
                      if ((_BYTE)v447)
                      {
                        printf("\tthread name: \"%s\"\n");
                      }
                      else if (v176)
                      {
                        printf("\tdispatch queue name: \"%s\"\n");
                      }
                      printf("\tuser/system time: %lf s / %lf s\n", (double)SDWORD1(thread_info_out) / 1000000.0 + (double)(int)thread_info_out, (double)SHIDWORD(thread_info_out) / 1000000.0 + (double)SDWORD2(thread_info_out));
                      if (byte_100010003 != 0 && !v361 && v191 >= 112)
                      {
                        if ((int)v356 >= 3) {
                          sub_100008EFC();
                        }
                        *__error() = 0;
                        if (proc_pidinfo(pid, 34, v400[0], &word_100010020, 88) < v348) {
                          perror("proc_pidinfo(... PROC_PIDTHREADCOUNTS ...)");
                        }
                        if (v356 != (unsigned __int16)word_100010020) {
                          fprintf(__stderrp, "threadcounts.ptc_len %d mismatch with level_count %d\n", (unsigned __int16)word_100010020, v356);
                        }
                        v192 = 0;
                        v193 = 0uLL;
                        if (v356)
                        {
                          v194 = v356;
                          v195 = &qword_100010048;
                          v196 = 0uLL;
                          do
                          {
                            v196 = vaddq_s64(*((int64x2_t *)v195 - 1), v196);
                            v193 = vaddq_s64(*((int64x2_t *)v195 - 2), v193);
                            v197 = *v195;
                            v195 += 5;
                            v192 += v197;
                            --v194;
                          }
                          while (v194);
                        }
                        else
                        {
                          v196 = 0uLL;
                        }
                        v358 = v196;
                        v360 = v193;
                        *(int64x2_t *)__endptr = v193;
                        v543 = v196;
                        *(void *)&v544 = v192;
                        object_type.i64[0] = v355;
                        object_type.i64[1] = v354;
                        v384.i64[0] = v353;
                        v384.i64[1] = v352;
                        v385 = v351;
                        sub_100008504("\tCPU time:", (unint64_t *)__endptr, &object_type, 1, " of task");
                        if (v356 >= 2)
                        {
                          v199 = 0;
                          v200 = &xmmword_100010028;
                          do
                          {
                            if (v199 == (char *)24) {
                              sub_100008F28();
                            }
                            if (qword_1000100B8 != -1) {
                              dispatch_once(&qword_1000100B8, &stru_10000C328);
                            }
                            printf("\t%s:", *(const char **)((char *)&off_10000C348 + (void)v199));
                            v201 = v200[1];
                            *(_OWORD *)__endptr = *v200;
                            v543 = (int64x2_t)v201;
                            *(void *)&v544 = *((void *)v200 + 4);
                            object_type = v360;
                            v384 = v358;
                            v385 = v192;
                            sub_100008504((const char *)&unk_100009E75, (unint64_t *)__endptr, &object_type, 1, (const char *)&unk_100009E75);
                            v199 += 8;
                            v200 = (long long *)((char *)v200 + 40);
                          }
                          while (v380 != v199);
                        }
                      }
                      printf("\tCPU usage (over last tick): %d%%\n", (int)v403 / 10);
                      v202 = "timeshare";
                      if (!v396[1]) {
                        v202 = "fixed-priority";
                      }
                      v203 = "real-time";
                      if (!get_default) {
                        v203 = v202;
                      }
                      printf("\tsched mode: %s", v203);
                      if (DWORD1(v403) == 1 && (get_default || !v396[1])) {
                        printf(" demoted to policy %s: base priority: %d cur priority %d", "POLICY_TIMESHARE", HIDWORD(v397), v398);
                      }
                      putchar(10);
                      v16 = v375;
                      if (get_default) {
                        goto LABEL_612;
                      }
                      if (DWORD1(v403) >= 3)
                      {
                        v204 = "???";
                        if (DWORD1(v403) == 4) {
                          v204 = "POLICY_FIFO";
                        }
                      }
                      else
                      {
                        v204 = off_10000C408[SDWORD1(v403)];
                      }
                      printf("\tpolicy: %s\n", v204);
                      if (get_default)
                      {
LABEL_612:
                        printf("\t\treal-time priority: %u\n", v396[0]);
                        printf("\t\treal-time period: %u\n", v394);
                        printf("\t\treal-time computation: %u\n", HIDWORD(v394));
                        printf("\t\treal-time constraint: %u\n", v395);
                        printf("\t\treal-time preemptible: %s\n");
                      }
                      else if (DWORD1(v403) == 2)
                      {
                        printf("\t\tround-robin max  priority: %d\n", v397);
                        printf("\t\tround-robin base priority: %d\n", HIDWORD(v397));
                        printf("\t\tround-robin quantum: %d\n", v398);
                        printf("\t\tround-robin depressed: %s, prio %d\n");
                      }
                      else if (DWORD1(v403) == 1)
                      {
                        printf("\t\ttimeshare max  priority: %d\n", v397);
                        printf("\t\ttimeshare base priority: %d\n", HIDWORD(v397));
                        printf("\t\ttimeshare cur  priority: %d\n", v398);
                        if (HIDWORD(v398)) {
                          v250 = "YES";
                        }
                        else {
                          v250 = "NO";
                        }
                        printf("\t\ttimeshare depressed: %s, prio %d\n", v250, v399);
                      }
                      puts("\trequested policy:");
                      v205 = (v189 >> 15) & 7;
                      if (v205 != 7 && ((0x7Du >> v205) & 1) != 0)
                      {
                        v206 = off_10000C420[v205];
                      }
                      else
                      {
                        v11 = v205 == 1;
                        v206 = "???";
                        if (v11) {
                          v206 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\treq thread qos: %s, relprio: %d\n", v206, -((v189 >> 18) & 0xF));
                      puts("\t\treq workqueue/pthread overrides:");
                      v207 = (v189 >> 22) & 7;
                      if (v207 != 7 && ((0x7Du >> v207) & 1) != 0)
                      {
                        v208 = off_10000C420[v207];
                      }
                      else
                      {
                        v11 = v207 == 1;
                        v208 = "???";
                        if (v11) {
                          v208 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\t\treq legacy qos override: %s\n", v208);
                      v209 = HIDWORD(v189) & 7;
                      if v209 != 7 && ((0x7Du >> (BYTE4(v189) & 7)))
                      {
                        v210 = off_10000C420[v209];
                      }
                      else
                      {
                        v11 = v209 == 1;
                        v210 = "???";
                        if (v11) {
                          v210 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\t\treq workqueue qos override: %s\n", v210);
                      puts("\t\treq kernel overrides:");
                      v211 = (v189 >> 28) & 7;
                      if (v211 != 7 && ((0x7Du >> v211) & 1) != 0)
                      {
                        v212 = off_10000C420[v211];
                      }
                      else
                      {
                        v11 = v211 == 1;
                        v212 = "???";
                        if (v11) {
                          v212 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\t\treq kevent overrides: %s\n", v212);
                      v213 = (v189 >> 35) & 7;
                      if v213 != 7 && ((0x7Du >> v213))
                      {
                        v214 = off_10000C420[v213];
                      }
                      else
                      {
                        v11 = v213 == 1;
                        v214 = "???";
                        if (v11) {
                          v214 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\t\treq workloop servicer override: %s\n", v214);
                      v215 = (v189 >> 25) & 7;
                      if (v215 != 7 && ((0x7Du >> v215) & 1) != 0)
                      {
                        v216 = off_10000C420[v215];
                      }
                      else
                      {
                        v11 = v215 == 1;
                        v216 = "???";
                        if (v11) {
                          v216 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\treq turnstiles sync promotion qos: %s, user promotion base pri: %d\n", v216, DWORD1(v391));
                      v217 = (v189 >> 8) & 7;
                      v218 = v217 == 6;
                      if (v217 >= 6)
                      {
                        v219 = "???";
                        if (v218) {
                          v219 = "LATENCY_QOS_TIER_5";
                        }
                      }
                      else
                      {
                        v219 = off_10000C458[v217];
                      }
                      printf("\t\treq latency qos: %s\n", v219);
                      v220 = (v189 >> 11) & 7;
                      v221 = v220 == 6;
                      if (v220 >= 6)
                      {
                        v222 = "???";
                        if (v221) {
                          v222 = "THROUGHPUT_QOS_TIER_5";
                        }
                      }
                      else
                      {
                        v222 = off_10000C488[v220];
                      }
                      printf("\t\treq thruput qos: %s\n", v222);
                      if ((v189 & 3) != 0) {
                        v223 = "YES";
                      }
                      else {
                        v223 = "NO";
                      }
                      v224 = (const char *)&unk_100009E75;
                      v225 = "(internal)";
                      if ((v189 & 1) == 0) {
                        v225 = (const char *)&unk_100009E75;
                      }
                      if ((v189 & 2) != 0) {
                        v224 = "(external)";
                      }
                      printf("\t\treq darwin BG: %s %s %s\n", v223, v225, v224);
                      v226 = (v189 >> 2) & 3;
                      v227 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v226 != 3) {
                        v227 = off_10000C4B8[v226];
                      }
                      v228 = (v189 >> 4) & 3;
                      v229 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v228 != 3) {
                        v229 = off_10000C4B8[v228];
                      }
                      printf("\t\treq internal/external iotier: %s / %s\n", v227, v229);
                      printf("\t\treq other: ");
                      if ((v189 & 0x40) != 0)
                      {
                        printf("passive-int ");
                        if ((v189 & 0x80) == 0)
                        {
LABEL_670:
                          if ((v189 & 0x4000) == 0) {
                            goto LABEL_671;
                          }
                          goto LABEL_682;
                        }
                      }
                      else if ((v189 & 0x80) == 0)
                      {
                        goto LABEL_670;
                      }
                      printf("passive-ext ");
                      if ((v189 & 0x4000) == 0)
                      {
LABEL_671:
                        if ((v189 & 0x10000000000) == 0) {
                          goto LABEL_673;
                        }
LABEL_672:
                        printf("workload-property-controlled ");
                        goto LABEL_673;
                      }
LABEL_682:
                      printf("bg-pidbind ");
                      if ((v189 & 0x10000000000) != 0) {
                        goto LABEL_672;
                      }
LABEL_673:
                      if (v389[3]) {
                        printf("static-param ");
                      }
                      putchar(10);
                      puts("\teffective policy:");
                      v230 = (v190 >> 14) & 7;
                      if (v230 != 7 && ((0x7Du >> v230) & 1) != 0)
                      {
                        v231 = off_10000C420[v230];
                      }
                      else
                      {
                        v11 = v230 == 1;
                        v231 = "???";
                        if (v11) {
                          v231 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\teff thread qos: %s\n", v231);
                      printf("\t\teff thread qos relprio: %d\n", -((v190 >> 17) & 0xF));
                      v232 = (v190 >> 21) & 7;
                      if (v232 != 7 && ((0x7Du >> v232) & 1) != 0)
                      {
                        v233 = off_10000C420[v232];
                      }
                      else
                      {
                        v11 = v232 == 1;
                        v233 = "???";
                        if (v11) {
                          v233 = "THREAD_QOS_MAINTENANCE";
                        }
                      }
                      printf("\t\teff promotion qos: %s\n", v233);
                      v234 = (v190 >> 8) & 7;
                      v235 = v234 == 6;
                      if (v234 >= 6)
                      {
                        v236 = "???";
                        if (v235) {
                          v236 = "LATENCY_QOS_TIER_5";
                        }
                      }
                      else
                      {
                        v236 = off_10000C458[v234];
                      }
                      printf("\t\teff latency qos: %s\n", v236);
                      v237 = (v190 >> 11) & 7;
                      v238 = v237 == 6;
                      if (v237 >= 6)
                      {
                        v239 = "???";
                        if (v238) {
                          v239 = "THROUGHPUT_QOS_TIER_5";
                        }
                      }
                      else
                      {
                        v239 = off_10000C488[v237];
                      }
                      printf("\t\teff thruput qos: %s\n", v239);
                      if (v190) {
                        v240 = "YES";
                      }
                      else {
                        v240 = "NO";
                      }
                      printf("\t\teff darwin BG: %s\n", v240);
                      v241 = (v190 >> 1) & 3;
                      v242 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v241 != 3) {
                        v242 = off_10000C4B8[v241];
                      }
                      printf("\t\teff iotier: %s\n", v242);
                      printf("\t\teff other: ");
                      v172 = pid;
                      if ((v190 & 8) != 0)
                      {
                        printf("passive ");
                        if ((v190 & 0x80) == 0)
                        {
LABEL_706:
                          if ((v190 & 0x10) == 0) {
                            goto LABEL_707;
                          }
                          goto LABEL_716;
                        }
                      }
                      else if ((v190 & 0x80) == 0)
                      {
                        goto LABEL_706;
                      }
                      printf("ui-is-urgent (47) ");
                      if ((v190 & 0x10) == 0)
                      {
LABEL_707:
                        if ((v190 & 0x20) == 0) {
                          goto LABEL_708;
                        }
                        goto LABEL_717;
                      }
LABEL_716:
                      printf("bg-allsockets ");
                      if ((v190 & 0x20) == 0)
                      {
LABEL_708:
                        if ((v190 & 0x40) == 0) {
                          goto LABEL_709;
                        }
                        goto LABEL_718;
                      }
LABEL_717:
                      printf("bg-newsockets ");
                      if ((v190 & 0x40) == 0)
                      {
LABEL_709:
                        if ((v190 & 0x2000000) != 0) {
                          goto LABEL_719;
                        }
                        goto LABEL_710;
                      }
LABEL_718:
                      printf("terminated ");
                      if ((v190 & 0x2000000) != 0)
                      {
LABEL_719:
                        printf("workload-property-controlled ");
                        if ((v190 & 0x1000000) == 0) {
                          goto LABEL_712;
                        }
LABEL_711:
                        printf("promote-above-task ");
                        goto LABEL_712;
                      }
LABEL_710:
                      if ((v190 & 0x1000000) != 0) {
                        goto LABEL_711;
                      }
LABEL_712:
                      putchar(10);
                      if ((DWORD2(v403) - 1) >= 4)
                      {
                        v243 = "???";
                        if (DWORD2(v403) == 5) {
                          v243 = "TH_STATE_HALTED";
                        }
                      }
                      else
                      {
                        v243 = off_10000C4D0[DWORD2(v403) - 1];
                      }
                      v41 = v365;
                      printf("\trun state: %s\n", v243);
                      if (HIDWORD(v403))
                      {
                        v244 = "TH_FLAGS_SWAPPED ";
                        if ((BYTE12(v403) & 1) == 0) {
                          v244 = (const char *)&unk_100009E75;
                        }
                        v245 = "TH_FLAGS_IDLE ";
                        if ((BYTE12(v403) & 2) == 0) {
                          v245 = (const char *)&unk_100009E75;
                        }
                        v246 = "TH_FLAGS_GLOBAL_FORCED_IDLE ";
                        if ((BYTE12(v403) & 4) == 0) {
                          v246 = (const char *)&unk_100009E75;
                        }
                        printf("\tflags: %s%s%s\n", v244, v245, v246);
                      }
                      printf("\tsuspend count: %d\n", v404);
                      printf("\tsleep time: %d s\n", HIDWORD(v404));
                      printf("\timportance in task: %d\n", v393[1]);
                      if ((v369 & 1) == 0) {
                        printf("\taffinity tag: %d\n", v393[0]);
                      }
                      if ((v364 & 1) == 0)
                      {
                        voucher = 0;
                        mach_voucher = thread_get_mach_voucher(act_list[v173], 0, &voucher);
                        if (mach_voucher) {
                          mach_error("thread_get_mach_voucher(...)", mach_voucher);
                        }
                        v248 = voucher;
                        if (voucher)
                        {
                          object_type.i32[0] = 0;
                          LODWORD(outsize) = 0;
                          v249 = mach_port_kernel_object(mach_task_self_, voucher, (unsigned int *)&object_type, (unsigned int *)&outsize);
                          if (v249)
                          {
                            mach_error("mach_port_kernel_object(...)", v249);
                          }
                          else if (object_type.i32[0] == 37)
                          {
                            printf("\tvoucher: 0x%x\n", outsize);
                            recipesCnt = 0x2000;
                            v251 = mach_voucher_debug_info(mach_task_self_, v248, (mach_voucher_attr_raw_recipe_array_t)__endptr, &recipesCnt);
                            if (v251 != 46)
                            {
                              if (recipesCnt)
                              {
                                v252 = v251;
                                if (v251)
                                {
                                  mach_error("mach_voucher_debug_info(...)", v251);
                                }
                                else
                                {
                                  for (i = 0; i < recipesCnt; i += v255[3] + 16)
                                  {
                                    v255 = (_DWORD *)((char *)__endptr + i);
                                    if (*v255 == 3 || *v255 == 2) {
                                      printf("\t\t%s\n", v252);
                                    }
                                    else {
                                      printf("\t\tUnknown (%d): %s\n", v252);
                                    }
                                  }
                                }
                              }
                            }
                          }
                          mach_port_deallocate(mach_task_self_, voucher);
                        }
                      }
                      mach_port_deallocate(mach_task_self_, act_list[v173]);
                      putchar(10);
                      ++v173;
                    }
                    while (v173 < x[1]);
                  }
                }
                putchar(10);
                v40 = v349;
LABEL_766:
                ++v41;
                v38 = task_listCnt;
                v39 = size[1] == 0;
              }
              while (v41 < task_listCnt && !size[1]);
            }
          }
        }
        else
        {
          v38 = 0;
          v39 = size[1] == 0;
        }
        if (!v343) {
          goto LABEL_857;
        }
        if (v39)
        {
          puts("Coalitions: ");
          v38 = task_listCnt;
        }
        v366 = task_list;
        v256 = proc_listpids(1u, 0, 0, 0);
        if (v256 <= 0)
        {
          v264 = __stderrp;
          __error();
          fprintf(v264, "proc_listpids(PROC_ALL_PIDS): %d\n");
LABEL_785:
          v262 = 0;
          v263 = 0;
          goto LABEL_786;
        }
        if (2 * (unint64_t)v256 <= 0x1E) {
          v257 = 30;
        }
        else {
          v257 = 2 * v256;
        }
        v258 = malloc_type_malloc(v257, 0xCD8F765CuLL);
        v259 = proc_listpids(1u, 0, v258, v257);
        if (v259 <= 0)
        {
          v265 = __stderrp;
          __error();
          fprintf(v265, "proc_listpids(PROC_ALL_PIDS, pids): %d\n");
          goto LABEL_785;
        }
        v260 = v259;
        v261 = v259 >> 2;
        v262 = (char *)malloc_type_calloc(v261, 0xA0uLL, 0x10000405CF0D5D0uLL);
        v381 = v258;
        v263 = 0;
        if (v260 >= 4)
        {
          if (v261 <= 1) {
            v303 = 1;
          }
          else {
            v303 = v261;
          }
          do
          {
            if (*v258)
            {
              v304 = proc_name(*v258, &v262[160 * v263 + 24], 0x40u);
              v305 = *v258;
              if (v304 < 0)
              {
                fprintf(__stderrp, "skipping pid %u (proc_name)\n");
              }
              else
              {
                LODWORD(v444) = *v258;
                *__error() = 0;
                *(void *)&v544 = 0;
                *(_OWORD *)__endptr = 0u;
                v543 = 0u;
                if (proc_pidinfo(v305, 20, 1uLL, __endptr, 40) == 40)
                {
                  *__error() = 0;
                  *(void *)&v454 = 0;
                  buffer[0] = 8;
                  if ((sysctlbyname("kern.coalition_roles", &v454, buffer, &v444, 4uLL) & 0x80000000) == 0
                    && buffer[0] == 8
                    || !byte_100010001 && *__error() == 2)
                  {
                    v306 = &v262[160 * v263];
                    *(_OWORD *)v306 = *(_OWORD *)__endptr;
                    *((void *)v306 + 2) = v454;
                    v307 = *v258;
                    v308.i64[0] = -1;
                    v308.i64[1] = -1;
                    *(int64x2_t *)__endptr = v308;
                    v543 = v308;
                    LODWORD(v454) = 0;
                    if (!task_name_for_pid(mach_task_self_, v307, (mach_port_name_t *)&v454))
                    {
                      LODWORD(buffer[0]) = 8;
                      task_info(v454, 0xFu, (task_info_t)__endptr, (mach_msg_type_number_t *)buffer);
                      mach_port_deallocate(mach_task_self_, v454);
                    }
                    if (v543.i32[1] == -1)
                    {
                      fprintf(__stderrp, "skipping pid %u (get_audit_token)\n");
                    }
                    else
                    {
                      v309 = &v262[160 * v263];
                      v310 = *(_OWORD *)__endptr;
                      *(int64x2_t *)(v309 + 104) = v543;
                      *(_OWORD *)(v309 + 88) = v310;
                      *(_OWORD *)(v309 + 120) = 0u;
                      *(_OWORD *)(v309 + 136) = 0u;
                      *((_DWORD *)v309 + 38) = *v258;
                      ++v263;
                    }
                    goto LABEL_882;
                  }
                  v312 = __stderrp;
                  __error();
                  fprintf(v312, "kern.coalition_roles(%d): %d\n");
                }
                else
                {
                  v311 = __stderrp;
                  __error();
                  fprintf(v311, "PROC_PIDCOALITIONINFO(%d): %d\n");
                }
                fprintf(__stderrp, "skipping pid %u (fill_coalitions)\n");
              }
            }
LABEL_882:
            ++v258;
            --v303;
          }
          while (v303);
        }
        free(v381);
        v16 = v375;
LABEL_786:
        if (v343 == 3)
        {
          v267 = 0;
          v362 = 0;
          v266 = (int (__cdecl *)(const void *, const void *))sub_100008E84;
        }
        else
        {
          v266 = (int (__cdecl *)(const void *, const void *))sub_100008E2C;
          v267 = 1;
          v362 = 1;
        }
        qsort(v262, v263, 0xA0uLL, v266);
        printf("PID   Command                           ");
        printf("Resource  Jetsam  Role   ");
        printf("  Apptype  Background App Nap");
        putchar(10);
        *(void *)pida = v263;
        if (v263)
        {
          v370 = 0;
          v268 = 0;
          v269 = v377 != 0;
          if (__s1) {
            v270 = v267;
          }
          else {
            v270 = 0;
          }
          v378 = v270;
          v376 = v16 && v269;
          v271 = "     ";
          do
          {
            v272 = &v262[160 * v268];
            v273 = *((_DWORD *)v272 + 5) + 1;
            v274 = "(unknwn)";
            if (v273 <= 4) {
              v274 = off_10000C4F0[v273];
            }
            v275 = *(_DWORD *)&v262[160 * v268 + 16 + 4 * v362] == 1;
            if (!v378)
            {
LABEL_805:
              v277 = v271;
              v278 = &v262[160 * v268];
              v281 = *((_DWORD *)v278 + 38);
              v280 = (int *)(v278 + 152);
              v279 = v281;
              if (v275 || v279 == 1) {
                printf("%-5u %-34s");
              }
              else {
                printf("  %-5u %-32s");
              }
              printf(" %7llu %7llu  %s ", *(void *)v272, *((void *)v272 + 1), v274);
              v282 = *v280;
              v283 = v349;
              v285 = v38;
              v284 = v366;
              v271 = v277;
              if (!v38) {
                goto LABEL_815;
              }
              while (1)
              {
                v286 = *v283++;
                if (v286 == v282) {
                  break;
                }
                ++v284;
                if (!--v285) {
                  goto LABEL_815;
                }
              }
              v287 = *v284;
              if (!*v284)
              {
LABEL_815:
                fprintf(__stderrp, "could not find task for pid %d", v282);
                v287 = 0;
              }
              v544 = 0u;
              v545 = 0u;
              *(_OWORD *)__endptr = 0u;
              v543 = 0u;
              LODWORD(v454) = 16;
              LODWORD(buffer[0]) = 0;
              v288 = task_policy_get(v287, 4u, (task_policy_t)__endptr, (mach_msg_type_number_t *)&v454, (BOOLean_t *)buffer);
              if (v288) {
                mach_error("task_policy_get(TASK_POLICY_STATE)", v288);
              }
              v289 = DWORD2(v545);
              v290 = "???";
              switch((v545 >> 17) & 7)
              {
                case 0u:
                  v290 = "        ";
                  break;
                case 1u:
                  v290 = "Int Dmon";
                  break;
                case 2u:
                  v290 = "Std Dmon";
                  break;
                case 3u:
                  v290 = "Adaptive";
                  break;
                case 4u:
                  v290 = "BG Dmon ";
                  break;
                case 5u:
                  v291 = (DWORD2(v545) >> 20) & 0xF;
                  if (v291 < 9) {
                    v290 = off_10000C518[v291];
                  }
                  break;
                case 7u:
                  v290 = "Driver  ";
                  break;
                default:
                  break;
              }
              printf("  %s ", v290);
              v292 = coalition_policy_get();
              if (v292 == 1)
              {
                printf(" CBG ");
              }
              else if (v292 == -1)
              {
                perror("coalition_policy_get(COALITION_POLICY_SUPPRESS) failed");
              }
              else
              {
                printf(v277);
              }
              if (((uint64_t)__endptr[1] & 0x10) != 0) {
                printf(" TBG ");
              }
              else {
                printf(v277);
              }
              v293 = " Nap     ";
              if ((*(void *)&v289 & 0x80000) == 0) {
                v293 = "         ";
              }
              if ((v544 & 0x10) != 0) {
                printf(" Suspend ");
              }
              else {
                printf(v293);
              }
              if (v376)
              {
                v294 = sub_10000845C();
                v296 = v295;
                v297 = sub_10000845C();
                v298 = v297;
                v300 = v299;
                if ((!((unint64_t)v297 | (unint64_t)v294) || v294 && v297 && !strcmp(v294, v297))
                  && (!((unint64_t)v300 | (unint64_t)v296) || v296 && v300 && !strcmp(v296, v300)))
                {
                  printf(" (%s, %s)");
                }
                else
                {
                  printf(" (%s, %s; %s, %s)");
                }
                free(v294);
                free(v296);
                free(v298);
                free(v300);
                v271 = v277;
              }
              putchar(10);
              goto LABEL_853;
            }
            if (!strncmp(__s1, &v262[160 * v268 + 24], 0x20uLL) || v347 && *(_DWORD *)&v262[160 * v268 + 152] == v346)
            {
              v276 = v370;
              if (v275 && !v370) {
                v276 = *((void *)v272 + 1);
              }
              if (!v276)
              {
LABEL_813:
                v370 = 0;
                goto LABEL_853;
              }
            }
            else
            {
              v276 = v370;
              if (!v370) {
                goto LABEL_813;
              }
            }
            v370 = v276;
            if (v276 == *((void *)v272 + 1)) {
              goto LABEL_805;
            }
LABEL_853:
            ++v268;
          }
          while (v268 != *(void *)pida);
        }
        free(v262);
        v38 = task_listCnt;
LABEL_857:
        if (v38)
        {
          v301 = 0;
          do
            mach_port_deallocate(mach_task_self_, task_list[v301++]);
          while (v301 < task_listCnt);
        }
        if (cf)
        {
          CFRelease(cf);
          stackshot_config_dealloc();
        }
        free(v349);
        free(v344);
        return 0;
      case 0:
        continue;
      case 1:
        if (optarg) {
          v6 = sub_1000082FC();
        }
        else {
          v6 = 1;
        }
        v379 = v6 != 0;
        continue;
      case 2:
        if (optarg) {
          v7 = sub_1000082FC();
        }
        else {
          v7 = 1;
        }
        v5 = v7 != 0;
        continue;
      case 3:
        v439 = 0x100000001;
        size[2] = 1;
        v377 = 1;
        byte_100010000 = 1;
        continue;
      case 4:
        v9 = optarg;
        v4 = 2;
        if (strcmp(optarg, "jetsam"))
        {
          v4 = 3;
          if (strcmp(v9, "resource")) {
            sub_100009098(v9);
          }
        }
        continue;
      case 5:
        if (optarg) {
          v10 = sub_1000082FC();
        }
        else {
          v10 = 1;
        }
        byte_100010000 = v10 != 0;
        continue;
      case 6:
        if (optarg) {
          v8 = sub_1000082FC();
        }
        else {
          v8 = 1;
        }
        v375 = v8 != 0;
        continue;
      case 7:
        v439 = 0x100000001;
        v377 = 1;
        size[2] = 1;
        v4 = 2;
        continue;
      default:
        puts("usage:");
        puts("\ttaskinfo [-h|--help] [--threads] [--dq] [--boosts] [--verbose] [--all]");
        puts("\t\t [--precise(=1|0)] [--xpcinfo(=1|0)] [--coalitions-only] [--threadcounts(=1|0)]");
        puts("\t\t [--vouchers(=1|0)] [--coalitions=(all|jetsam|resource)] [process-name|pid]");
        return 0;
    }
  }
}

unint64_t sub_1000082FC()
{
  __endptr = 0;
  unint64_t result = strtoull(optarg, &__endptr, 10);
  if (__endptr == optarg || *__endptr) {
    sub_1000090D4(optarg);
  }
  return result;
}

uint64_t sub_10000835C(const char *a1)
{
  int v4 = 0;
  size_t v3 = 4;
  *__error() = 0;
  if (sysctlbyname(a1, &v4, &v3, 0, 0) != -1) {
    return 1;
  }
  if (*__error() != 2)
  {
    perror(a1);
    return 1;
  }
  return 0;
}

uint64_t sub_1000083E0(const char *a1)
{
  unsigned int v4 = 0;
  size_t v3 = 4;
  *__error() = 0;
  if (sysctlbyname(a1, &v4, &v3, 0, 0) == -1 && *__error() != 2) {
    perror(a1);
  }
  return v4;
}

char *sub_10000845C()
{
  v0 = (void *)xpc_coalition_copy_info();
  if (xpc_get_type(v0) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v1 = strdup("coalition unknown");
    v2 = "to launchd";
LABEL_7:
    strdup(v2);
    return v1;
  }
  string = xpc_dictionary_get_string(v0, XPC_COALITION_INFO_KEY_NAME);
  if (string) {
    v1 = strdup(string);
  }
  else {
    v1 = 0;
  }
  v2 = xpc_dictionary_get_string(v0, XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER);
  if (v2) {
    goto LABEL_7;
  }
  return v1;
}

uint64_t sub_100008504(const char *a1, unint64_t *a2, void *a3, int a4, const char *a5)
{
  unint64_t v9 = a2[3] + a2[2];
  uint64_t v10 = a3[2];
  uint64_t v11 = a3[3];
  printf("%s %llu.%06llu s ", a1, v9 * dword_100010004 / unk_100010008 / 0x3B9ACA00, v9 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8);
  if (a4)
  {
    if (v11 + v10) {
      double v12 = (double)v9 * 100.0 / (double)(unint64_t)(v11 + v10);
    }
    else {
      double v12 = 0.0;
    }
    printf("(%.2f%%%s) ", v12, a5);
  }
  if (byte_100010000) {
    printf("(%llu cycles, %llu instructions");
  }
  else {
    printf("(%.2f%s cycles, %.2f%s instructions");
  }
  unint64_t v13 = a2[1];
  if (v13) {
    double v14 = (double)*a2 / (double)v13;
  }
  else {
    double v14 = 0.0;
  }
  printf(", IPC %.3f, ", v14);
  if ((double)(v9 * dword_100010004 / unk_100010008) / 1000000000.0 != 0.0)
  {
    if (!byte_100010000) {
      goto LABEL_17;
    }
LABEL_16:
    printf("%.0f hz ");
    goto LABEL_18;
  }
  if (byte_100010000) {
    goto LABEL_16;
  }
LABEL_17:
  printf("%.2f%s%s, ");
LABEL_18:
  sub_100008A20();
  if (a4)
  {
    unint64_t v15 = a3[4];
    if (v15) {
      double v16 = (double)a2[4] * 100.0 / (double)v15;
    }
    else {
      double v16 = 0.0;
    }
    printf(" (%.2f%%%s)", v16, a5);
  }
  printf(") ");
  unint64_t v17 = a2[2];
  unint64_t v18 = a2[3];
  if (v9)
  {
    double v19 = (double)v17 * 100.0 / (double)v9;
    double v20 = (double)v18 * 100.0 / (double)v9;
  }
  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
  }
  return printf("user/system: %llu.%06llu / %llu.%06llu (%.0f%% / %.0f%%)\n", v17 * dword_100010004 / unk_100010008 / 0x3B9ACA00, v17 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, v18 * dword_100010004 / unk_100010008 / 0x3B9ACA00, v18 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, v19, v20);
}

uint64_t sub_100008A20()
{
  if (byte_100010000) {
    return printf("%llu nJ %.0f nW");
  }
  else {
    return printf("%.2f%s%s, %.2f%s%s");
  }
}

void sub_100008C70(id a1)
{
  size_t v1 = 4;
  if (sysctlbyname("hw.nperflevels", &dword_100010018, &v1, 0, 0) == -1) {
    perror("sysctlbyname(hw.nperflevels)");
  }
  if (dword_100010018 >= 3)
  {
    fprintf(__stderrp, "count:%d exceeds STATIC_PERFLEVEL_COUNT:%d skipping PROC_PIDTHREADCOUNTS data\n", dword_100010018, 2);
    byte_100010003 = 0;
  }
}

void sub_100008D04(id a1)
{
  if (qword_100010010 != -1) {
    dispatch_once(&qword_100010010, &stru_10000C2E8);
  }
  uint64_t v1 = dword_100010018;
  if (dword_100010018)
  {
    uint64_t v2 = 0;
    size_t v3 = (char *)&unk_100010078;
    do
    {
      long long v7 = 0u;
      long long v8 = 0u;
      *(_OWORD *)__str = 0u;
      long long v6 = 0u;
      snprintf(__str, 0x40uLL, "hw.perflevel%d.name", v2);
      size_t v4 = 32;
      if (sysctlbyname(__str, v3, &v4, 0, 0) == -1) {
        perror(__str);
      }
      ++v2;
      v3 += 32;
    }
    while (v1 != v2);
  }
}

uint64_t sub_100008E14(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 152);
  int v3 = *(_DWORD *)(a2 + 152);
  BOOL v4 = v2 < v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5;
  }
}

uint64_t sub_100008E2C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a2 + 8);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 > v3) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 20) == 1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a2 + 20) == 1) {
    return 1;
  }
  int v5 = *(_DWORD *)(a1 + 152);
  int v6 = *(_DWORD *)(a2 + 152);
  BOOL v7 = v5 < v6;
  BOOL v8 = v5 > v6;
  if (v7) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

uint64_t sub_100008E84(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)a1 > *(void *)a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 16) == 1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a2 + 16) == 1) {
    return 1;
  }
  int v3 = *(_DWORD *)(a1 + 152);
  int v4 = *(_DWORD *)(a2 + 152);
  BOOL v5 = v3 < v4;
  BOOL v6 = v3 > v4;
  if (v5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

void sub_100008EDC()
{
}

void sub_100008EFC()
{
  __assert_rtn("main", "taskinfo.c", 1526, "threadcounts_size >= target_size");
}

void sub_100008F28()
{
  __assert_rtn("perf_level_name", "taskinfo.c", 503, "perf_level <= STATIC_PERFLEVEL_COUNT");
}

void sub_100008F54()
{
  byte_10001000E = 1;
}

void sub_100008F80()
{
  byte_10001000D = 1;
}

void sub_100008FAC()
{
}

void sub_100008FD8()
{
}

void sub_100009004()
{
  byte_10001000C = 1;
}

void sub_100009030()
{
  byte_10001001C = 1;
}

void sub_10000905C()
{
}

void sub_10000907C()
{
}

void sub_100009098(const char *a1)
{
}

void sub_1000090D4(const char *a1)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

uint64_t coalition_info_debug_info()
{
  return _coalition_info_debug_info();
}

uint64_t coalition_policy_get()
{
  return _coalition_policy_get();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

int getpriority(int a1, id_t a2)
{
  return _getpriority(a1, a2);
}

kern_return_t host_processor_set_priv(host_priv_t host_priv, processor_set_name_t set_name, processor_set_t *set)
{
  return _host_processor_set_priv(host_priv, set_name, set);
}

void mach_error(const char *str, mach_error_t error_value)
{
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return _mach_port_kernel_object(task, name, object_type, object_addr);
}

kern_return_t mach_port_space_basic_info(ipc_space_inspect_t task, ipc_info_space_basic_t *basic_info)
{
  return _mach_port_space_basic_info(task, basic_info);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_voucher_debug_info(ipc_space_read_t task, mach_port_name_t voucher_name, mach_voucher_attr_raw_recipe_array_t recipes, mach_msg_type_number_t *recipesCnt)
{
  return _mach_voucher_debug_info(task, voucher_name, recipes, recipesCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void perror(const char *a1)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return _pid_for_task(t, x);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

uint64_t proc_get_cpumon_params()
{
  return _proc_get_cpumon_params();
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return _proc_get_dirty(pid, flags);
}

uint64_t proc_get_wakemon_params()
{
  return _proc_get_wakemon_params();
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return _proc_listpids(type, typeinfo, buffer, buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

kern_return_t processor_set_default(host_t host, processor_set_name_t *default_set)
{
  return _processor_set_default(host, default_set);
}

kern_return_t processor_set_tasks_with_flavor(processor_set_t processor_set, mach_task_flavor_t flavor, task_array_t *task_list, mach_msg_type_number_t *task_listCnt)
{
  return _processor_set_tasks_with_flavor(processor_set, flavor, task_list, task_listCnt);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

uint64_t stackshot_capture_with_config()
{
  return _stackshot_capture_with_config();
}

uint64_t stackshot_config_create()
{
  return _stackshot_config_create();
}

uint64_t stackshot_config_dealloc()
{
  return _stackshot_config_dealloc();
}

uint64_t stackshot_config_get_stackshot_buffer()
{
  return _stackshot_config_get_stackshot_buffer();
}

uint64_t stackshot_config_get_stackshot_size()
{
  return _stackshot_config_get_stackshot_size();
}

uint64_t stackshot_config_set_flags()
{
  return _stackshot_config_set_flags();
}

uint64_t stackshot_config_set_pid()
{
  return _stackshot_config_set_pid();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return _task_name_for_pid(target_tport, pid, tn);
}

kern_return_t task_policy_get(task_policy_get_t task, task_policy_flavor_t flavor, task_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return _task_policy_get(task, flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return _task_threads(target_task, act_list, act_listCnt);
}

kern_return_t thread_get_mach_voucher(thread_read_t thr_act, mach_voucher_selector_t which, ipc_voucher_t *voucher)
{
  return _thread_get_mach_voucher(thr_act, which, voucher);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return _thread_policy_get(thread, flavor, policy_info, policy_infoCnt, get_default);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_read_overwrite(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_address_t data, vm_size_t *outsize)
{
  return _vm_read_overwrite(target_task, address, size, data, outsize);
}

void warn(const char *a1, ...)
{
}

uint64_t xpc_coalition_copy_info()
{
  return _xpc_coalition_copy_info();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}