void **sub_100004360(void **a1)
{
  void **v3;

  v3 = a1;
  sub_10000CC84(&v3);
  return a1;
}

void **sub_100004398(void **a1)
{
  v3 = a1;
  sub_10000CD28(&v3);
  return a1;
}

double sub_1000043D0(unint64_t a1)
{
  if (qword_100014108 != -1) {
    dispatch_once(&qword_100014108, &stru_1000103D8);
  }
  return *(double *)&qword_100014100 * (double)a1;
}

void sub_100004428(id a1)
{
  mach_timebase_info(&info);
  *(double *)&qword_100014100 = (float)((float)((float)info.numer * 0.000000001) / (float)info.denom);
}

uint64_t start()
{
  int v0 = __chkstk_darwin();
  v2 = v1;
  int v3 = v0;
  while (1)
  {
    uint64_t v4 = getopt(v3, v2, ":kd:n:hcelifs:w:rxp:z::");
    if ((int)v4 <= 98) {
      break;
    }
    switch((int)v4)
    {
      case 'c':
        byte_10001412F = 1;
        byte_100014130 = 1;
        if (byte_100014080) {
          byte_10001412C = 1;
        }
        goto LABEL_13;
      case 'd':
        dword_100014124 = atoi(optarg);
        continue;
      case 'e':
        if (byte_100014080)
        {
          byte_10001412B = 1;
          byte_100014128 = 1;
          byte_10001412C = 1;
          byte_10001412A = 1;
          byte_10001412E = 1;
        }
LABEL_13:
        byte_10001412D = 1;
        continue;
      case 'f':
        if (byte_100014080) {
          byte_100014128 = 1;
        }
        continue;
      case 'h':
        sub_100009CA8(0);
      case 'i':
        if (byte_100014080) {
          byte_10001412A = 1;
        }
        continue;
      case 'k':
        byte_100014130 = 1;
        continue;
      case 'l':
        if (byte_100014080) {
          byte_10001412B = 1;
        }
        continue;
      case 'n':
        byte_100014120 = 1;
        byte_100014141 = 1;
        dword_100014070 = atoi(optarg);
        continue;
      case 'p':
        dword_100014074 = atoi(optarg);
        continue;
      case 'r':
        byte_100014140 = 1;
        continue;
      case 's':
        v5 = optarg;
        if (!strcmp(optarg, "mem")) {
          qword_100014138 = (uint64_t)"footprint";
        }
        else {
          qword_100014138 = (uint64_t)v5;
        }
        continue;
      case 'w':
        qword_100014148 = (uint64_t)optarg;
        continue;
      case 'x':
        byte_100014129 = 1;
        continue;
      case 'z':
        if (!byte_100014080) {
          continue;
        }
        int v6 = optind;
        if (optind >= v3)
        {
          v7 = optarg;
          if (optarg)
          {
LABEL_33:
            dword_100014078 = atoi(v7);
            continue;
          }
        }
        else
        {
          v7 = optarg;
          if (optarg) {
            goto LABEL_33;
          }
          v8 = v2[optind];
          if (v8 && (*v8 & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[*(unsigned __int8 *)v8] & 0x400) != 0)
          {
            dword_100014078 = atoi(v8);
            optind = v6 + 1;
            continue;
          }
        }
        byte_100014131 = 1;
        break;
      default:
        goto LABEL_963;
    }
  }
  if (v4 != -1)
  {
    if (v4 == 58)
    {
      fprintf(__stderrp, "Error: Missing argument to '%c'\n");
    }
    else
    {
      if (v4 != 63)
      {
LABEL_963:
        fprintf(__stderrp, "Fatal: Unexpected return value from getopt: '%c'\n", v4);
        sub_100009CA8(-1);
      }
      fprintf(__stderrp, "Error: Unrecognized option '%c'\n");
    }
    sub_100009CA8(1);
  }
  mach_timebase_info((mach_timebase_info_t)&dword_100014110);
  if (getuid())
  {
    v241 = __stderrp;
    v242 = "Fatal: jetsam_priority must be run as root.\n";
    size_t v243 = 44;
    goto LABEL_969;
  }
  if (byte_100014120 != 1) {
    goto LABEL_40;
  }
  if (!dword_100014124)
  {
    v241 = __stderrp;
    v242 = "Fatal: Specify the delay(ms) between the time series samples with option -d.\n";
    size_t v243 = 77;
LABEL_969:
    fwrite(v242, v243, 1uLL, v241);
    exit(1);
  }
  qword_100014118 = 1000000
                  * dword_100014124
                  * (unint64_t)*(unsigned int *)algn_100014114
                  / dword_100014110;
LABEL_40:
  v465 = 0;
  uint64_t v250 = sub_10000943C(&v465);
  uint64_t v246 = objc_opt_class();
  sub_10000CDB4(__src, "priority");
  if (SHIBYTE(v464) < 0)
  {
    sub_10000CBE4(__p, __src[0], (unint64_t)__src[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)__src;
    uint64_t v477 = v464;
  }
  uint64_t v478 = 0x100000001;
  uint64_t v9 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v10 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v10 = v9 + 32;
  }
  qword_100014090 = v10;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v464) < 0) {
    operator delete(__src[0]);
  }
  sub_10000CDB4(&v461, "priority_name");
  if (SHIBYTE(v462) < 0)
  {
    sub_10000CBE4(__p, (void *)v461, *((unint64_t *)&v461 + 1));
  }
  else
  {
    *(_OWORD *)__p = v461;
    uint64_t v477 = v462;
  }
  uint64_t v478 = 0x200000000;
  uint64_t v11 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v12 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v12 = v11 + 32;
  }
  qword_100014090 = v12;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v462) < 0) {
    operator delete((void *)v461);
  }
  sub_10000CDB4(v459, "fds");
  if (SHIBYTE(v460) < 0)
  {
    sub_10000CBE4(__p, v459[0], (unint64_t)v459[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v459;
    uint64_t v477 = v460;
  }
  uint64_t v478 = 0;
  uint64_t v13 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v14 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v14 = v13 + 32;
  }
  qword_100014090 = v14;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v460) < 0) {
    operator delete(v459[0]);
  }
  if (byte_100014128 == 1)
  {
    sub_10000CDB4(&v457, "internal");
    if (SHIBYTE(v458) < 0)
    {
      sub_10000CBE4(__p, (void *)v457, *((unint64_t *)&v457 + 1));
    }
    else
    {
      *(_OWORD *)__p = v457;
      uint64_t v477 = v458;
    }
    uint64_t v478 = 2;
    uint64_t v15 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v16 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v16 = v15 + 32;
    }
    qword_100014090 = v16;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v458) < 0) {
      operator delete((void *)v457);
    }
    sub_10000CDB4(v455, "internal_comp");
    if (SHIBYTE(v456) < 0)
    {
      sub_10000CBE4(__p, v455[0], (unint64_t)v455[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v455;
      uint64_t v477 = v456;
    }
    uint64_t v478 = 2;
    uint64_t v17 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v18 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v18 = v17 + 32;
    }
    qword_100014090 = v18;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v456) < 0) {
      operator delete(v455[0]);
    }
    sub_10000CDB4(&v453, "iokit_mapped");
    if (SHIBYTE(v454) < 0)
    {
      sub_10000CBE4(__p, (void *)v453, *((unint64_t *)&v453 + 1));
    }
    else
    {
      *(_OWORD *)__p = v453;
      uint64_t v477 = v454;
    }
    uint64_t v478 = 2;
    uint64_t v19 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v20 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v20 = v19 + 32;
    }
    qword_100014090 = v20;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v454) < 0) {
      operator delete((void *)v453);
    }
    sub_10000CDB4(v451, "purge_nonvol");
    if (SHIBYTE(v452) < 0)
    {
      sub_10000CBE4(__p, v451[0], (unint64_t)v451[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v451;
      uint64_t v477 = v452;
    }
    uint64_t v478 = 2;
    uint64_t v21 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v22 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v22 = v21 + 32;
    }
    qword_100014090 = v22;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v452) < 0) {
      operator delete(v451[0]);
    }
    sub_10000CDB4(&v449, "purge_nonvol_comp");
    if (SHIBYTE(v450) < 0)
    {
      sub_10000CBE4(__p, (void *)v449, *((unint64_t *)&v449 + 1));
    }
    else
    {
      *(_OWORD *)__p = v449;
      uint64_t v477 = v450;
    }
    uint64_t v478 = 2;
    uint64_t v23 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v24 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v24 = v23 + 32;
    }
    qword_100014090 = v24;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v450) < 0) {
      operator delete((void *)v449);
    }
    sub_10000CDB4(v447, "alt_acct");
    if (SHIBYTE(v448) < 0)
    {
      sub_10000CBE4(__p, v447[0], (unint64_t)v447[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v447;
      uint64_t v477 = v448;
    }
    uint64_t v478 = 2;
    uint64_t v25 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v26 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v26 = v25 + 32;
    }
    qword_100014090 = v26;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v448) < 0) {
      operator delete(v447[0]);
    }
    sub_10000CDB4(&v445, "alt_acct_comp");
    if (SHIBYTE(v446) < 0)
    {
      sub_10000CBE4(__p, (void *)v445, *((unint64_t *)&v445 + 1));
    }
    else
    {
      *(_OWORD *)__p = v445;
      uint64_t v477 = v446;
    }
    uint64_t v478 = 2;
    uint64_t v27 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v28 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v28 = v27 + 32;
    }
    qword_100014090 = v28;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v446) < 0) {
      operator delete((void *)v445);
    }
    if ((byte_100014129 & 1) == 0)
    {
      sub_10000CDB4(v443, "page_table");
      if (SHIBYTE(v444) < 0)
      {
        sub_10000CBE4(__p, v443[0], (unint64_t)v443[1]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v443;
        uint64_t v477 = v444;
      }
      uint64_t v478 = 2;
      uint64_t v29 = qword_100014090;
      if ((unint64_t)qword_100014090 >= unk_100014098)
      {
        uint64_t v30 = sub_10000CED8(&qword_100014088, (long long *)__p);
      }
      else
      {
        sub_10000CE68(&qword_100014088, (long long *)__p);
        uint64_t v30 = v29 + 32;
      }
      qword_100014090 = v30;
      if (SHIBYTE(v477) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v444) < 0) {
        operator delete(v443[0]);
      }
    }
  }
  sub_10000CDB4(&v441, "footprint");
  if (SHIBYTE(v442) < 0)
  {
    sub_10000CBE4(__p, (void *)v441, *((unint64_t *)&v441 + 1));
  }
  else
  {
    *(_OWORD *)__p = v441;
    uint64_t v477 = v442;
  }
  uint64_t v478 = 2;
  uint64_t v31 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v32 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v32 = v31 + 32;
  }
  qword_100014090 = v32;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v442) < 0) {
    operator delete((void *)v441);
  }
  sub_10000CDB4(v439, "footprint_peak");
  if (SHIBYTE(v440) < 0)
  {
    sub_10000CBE4(__p, v439[0], (unint64_t)v439[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v439;
    uint64_t v477 = v440;
  }
  uint64_t v478 = 2;
  uint64_t v33 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v34 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v34 = v33 + 32;
  }
  qword_100014090 = v34;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v440) < 0) {
    operator delete(v439[0]);
  }
  if (byte_10001412A == 1)
  {
    sub_10000CDB4(&v437, "footprint_interval_peak");
    if (SHIBYTE(v438) < 0)
    {
      sub_10000CBE4(__p, (void *)v437, *((unint64_t *)&v437 + 1));
    }
    else
    {
      *(_OWORD *)__p = v437;
      uint64_t v477 = v438;
    }
    uint64_t v478 = 2;
    uint64_t v35 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v36 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v36 = v35 + 32;
    }
    qword_100014090 = v36;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v438) < 0) {
      operator delete((void *)v437);
    }
  }
  if (byte_100014080)
  {
    sub_10000CDB4(v435, "limit");
    if (SHIBYTE(v436) < 0)
    {
      sub_10000CBE4(__p, v435[0], (unint64_t)v435[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v435;
      uint64_t v477 = v436;
    }
    uint64_t v478 = 2;
    uint64_t v37 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v38 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v38 = v37 + 32;
    }
    qword_100014090 = v38;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v436) < 0) {
      operator delete(v435[0]);
    }
    if (byte_10001412B == 1)
    {
      sub_10000CDB4(&v433, "active_limit");
      if (SHIBYTE(v434) < 0)
      {
        sub_10000CBE4(__p, (void *)v433, *((unint64_t *)&v433 + 1));
      }
      else
      {
        *(_OWORD *)__p = v433;
        uint64_t v477 = v434;
      }
      uint64_t v478 = 0x100000002;
      uint64_t v39 = qword_100014090;
      if ((unint64_t)qword_100014090 >= unk_100014098)
      {
        uint64_t v40 = sub_10000CED8(&qword_100014088, (long long *)__p);
      }
      else
      {
        sub_10000CE68(&qword_100014088, (long long *)__p);
        uint64_t v40 = v39 + 32;
      }
      qword_100014090 = v40;
      if (SHIBYTE(v477) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v434) < 0) {
        operator delete((void *)v433);
      }
      sub_10000CDB4(v431, "active_limit_hard");
      if (SHIBYTE(v432) < 0)
      {
        sub_10000CBE4(__p, v431[0], (unint64_t)v431[1]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v431;
        uint64_t v477 = v432;
      }
      uint64_t v478 = 2;
      uint64_t v41 = qword_100014090;
      if ((unint64_t)qword_100014090 >= unk_100014098)
      {
        uint64_t v42 = sub_10000CED8(&qword_100014088, (long long *)__p);
      }
      else
      {
        sub_10000CE68(&qword_100014088, (long long *)__p);
        uint64_t v42 = v41 + 32;
      }
      qword_100014090 = v42;
      if (SHIBYTE(v477) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v432) < 0) {
        operator delete(v431[0]);
      }
      sub_10000CDB4(&v429, "inactive_limit");
      if (SHIBYTE(v430) < 0)
      {
        sub_10000CBE4(__p, (void *)v429, *((unint64_t *)&v429 + 1));
      }
      else
      {
        *(_OWORD *)__p = v429;
        uint64_t v477 = v430;
      }
      uint64_t v478 = 0x100000002;
      uint64_t v43 = qword_100014090;
      if ((unint64_t)qword_100014090 >= unk_100014098)
      {
        uint64_t v44 = sub_10000CED8(&qword_100014088, (long long *)__p);
      }
      else
      {
        sub_10000CE68(&qword_100014088, (long long *)__p);
        uint64_t v44 = v43 + 32;
      }
      qword_100014090 = v44;
      if (SHIBYTE(v477) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v430) < 0) {
        operator delete((void *)v429);
      }
      sub_10000CDB4(v427, "inactive_limit_hard");
      if (SHIBYTE(v428) < 0)
      {
        sub_10000CBE4(__p, v427[0], (unint64_t)v427[1]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v427;
        uint64_t v477 = v428;
      }
      uint64_t v478 = 2;
      uint64_t v45 = qword_100014090;
      if ((unint64_t)qword_100014090 >= unk_100014098)
      {
        uint64_t v46 = sub_10000CED8(&qword_100014088, (long long *)__p);
      }
      else
      {
        sub_10000CE68(&qword_100014088, (long long *)__p);
        uint64_t v46 = v45 + 32;
      }
      qword_100014090 = v46;
      if (SHIBYTE(v477) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v428) < 0) {
        operator delete(v427[0]);
      }
    }
    sub_10000CDB4(&v425, "root_limit_increase");
    if (SHIBYTE(v426) < 0)
    {
      sub_10000CBE4(__p, (void *)v425, *((unint64_t *)&v425 + 1));
    }
    else
    {
      *(_OWORD *)__p = v425;
      uint64_t v477 = v426;
    }
    uint64_t v478 = 2;
    uint64_t v47 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v48 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v48 = v47 + 32;
    }
    qword_100014090 = v48;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v426) < 0) {
      operator delete((void *)v425);
    }
  }
  sub_10000CDB4(v423, "dirty");
  if (SHIBYTE(v424) < 0)
  {
    sub_10000CBE4(__p, v423[0], (unint64_t)v423[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v423;
    uint64_t v477 = v424;
  }
  uint64_t v478 = 0x400000000;
  uint64_t v49 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v50 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v50 = v49 + 32;
  }
  qword_100014090 = v50;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v424) < 0) {
    operator delete(v423[0]);
  }
  sub_10000CDB4(&v421, "PE");
  if (SHIBYTE(v422) < 0)
  {
    sub_10000CBE4(__p, (void *)v421, *((unint64_t *)&v421 + 1));
  }
  else
  {
    *(_OWORD *)__p = v421;
    uint64_t v477 = v422;
  }
  uint64_t v478 = 0x400000000;
  uint64_t v51 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v52 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v52 = v51 + 32;
  }
  qword_100014090 = v52;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v422) < 0) {
    operator delete((void *)v421);
  }
  sub_10000CDB4(v419, "frozen");
  if (SHIBYTE(v420) < 0)
  {
    sub_10000CBE4(__p, v419[0], (unint64_t)v419[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v419;
    uint64_t v477 = v420;
  }
  uint64_t v478 = 0x400000000;
  uint64_t v53 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v54 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v54 = v53 + 32;
  }
  qword_100014090 = v54;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v420) < 0) {
    operator delete(v419[0]);
  }
  if (v246)
  {
    sub_10000CDB4(&v417, "docked");
    if (SHIBYTE(v418) < 0)
    {
      sub_10000CBE4(__p, (void *)v417, *((unint64_t *)&v417 + 1));
    }
    else
    {
      *(_OWORD *)__p = v417;
      uint64_t v477 = v418;
    }
    uint64_t v478 = 0x400000000;
    uint64_t v55 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v56 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v56 = v55 + 32;
    }
    qword_100014090 = v56;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v418) < 0) {
      operator delete((void *)v417);
    }
  }
  sub_10000CDB4(v415, "swappable");
  if (SHIBYTE(v416) < 0)
  {
    sub_10000CBE4(__p, v415[0], (unint64_t)v415[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v415;
    uint64_t v477 = v416;
  }
  uint64_t v478 = 0x400000000;
  uint64_t v57 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v58 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v58 = v57 + 32;
  }
  qword_100014090 = v58;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v416) < 0) {
    operator delete(v415[0]);
  }
  sub_10000CDB4(&v413, "coalition");
  if (SHIBYTE(v414) < 0)
  {
    sub_10000CBE4(__p, (void *)v413, *((unint64_t *)&v413 + 1));
  }
  else
  {
    *(_OWORD *)__p = v413;
    uint64_t v477 = v414;
  }
  uint64_t v478 = 1;
  uint64_t v59 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v60 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v60 = v59 + 32;
  }
  qword_100014090 = v60;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v414) < 0) {
    operator delete((void *)v413);
  }
  sub_10000CDB4(v411, "pid");
  if (SHIBYTE(v412) < 0)
  {
    sub_10000CBE4(__p, v411[0], (unint64_t)v411[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v411;
    uint64_t v477 = v412;
  }
  uint64_t v478 = 1;
  uint64_t v61 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v62 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v62 = v61 + 32;
  }
  qword_100014090 = v62;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v412) < 0) {
    operator delete(v411[0]);
  }
  sub_10000CDB4(&v409, "name");
  if (SHIBYTE(v410) < 0)
  {
    sub_10000CBE4(__p, (void *)v409, *((unint64_t *)&v409 + 1));
  }
  else
  {
    *(_OWORD *)__p = v409;
    uint64_t v477 = v410;
  }
  uint64_t v478 = 0x200000000;
  uint64_t v63 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v64 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v64 = v63 + 32;
  }
  qword_100014090 = v64;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v410) < 0) {
    operator delete((void *)v409);
  }
  sub_10000CDB4(v407, "flags");
  if (SHIBYTE(v408) < 0)
  {
    sub_10000CBE4(__p, v407[0], (unint64_t)v407[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v407;
    uint64_t v477 = v408;
  }
  uint64_t v478 = 0x200000000;
  uint64_t v65 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v66 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v66 = v65 + 32;
  }
  qword_100014090 = v66;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v408) < 0) {
    operator delete(v407[0]);
  }
  if (byte_10001412C == 1)
  {
    sub_10000CDB4(&v405, "pages_grabbed");
    if (SHIBYTE(v406) < 0)
    {
      sub_10000CBE4(__p, (void *)v405, *((unint64_t *)&v405 + 1));
    }
    else
    {
      *(_OWORD *)__p = v405;
      uint64_t v477 = v406;
    }
    uint64_t v478 = 1;
    uint64_t v67 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v68 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v68 = v67 + 32;
    }
    qword_100014090 = v68;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v406) < 0) {
      operator delete((void *)v405);
    }
    sub_10000CDB4(v403, "pages_grabbed_kern");
    if (SHIBYTE(v404) < 0)
    {
      sub_10000CBE4(__p, v403[0], (unint64_t)v403[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v403;
      uint64_t v477 = v404;
    }
    uint64_t v478 = 1;
    uint64_t v69 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v70 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v70 = v69 + 32;
    }
    qword_100014090 = v70;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v404) < 0) {
      operator delete(v403[0]);
    }
    sub_10000CDB4(&v401, "pages_grabbed_iopl");
    if (SHIBYTE(v402) < 0)
    {
      sub_10000CBE4(__p, (void *)v401, *((unint64_t *)&v401 + 1));
    }
    else
    {
      *(_OWORD *)__p = v401;
      uint64_t v477 = v402;
    }
    uint64_t v478 = 1;
    uint64_t v71 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v72 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v72 = v71 + 32;
    }
    qword_100014090 = v72;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v402) < 0) {
      operator delete((void *)v401);
    }
    sub_10000CDB4(v399, "pages_grabbed_upl");
    if (SHIBYTE(v400) < 0)
    {
      sub_10000CBE4(__p, v399[0], (unint64_t)v399[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v399;
      uint64_t v477 = v400;
    }
    uint64_t v478 = 1;
    uint64_t v73 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v74 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v74 = v73 + 32;
    }
    qword_100014090 = v74;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v400) < 0) {
      operator delete(v399[0]);
    }
  }
  if (byte_10001412D == 1)
  {
    sub_10000CDB4(&v397, "total_dirty_time");
    if (SHIBYTE(v398) < 0)
    {
      sub_10000CBE4(__p, (void *)v397, *((unint64_t *)&v397 + 1));
    }
    else
    {
      *(_OWORD *)__p = v397;
      uint64_t v477 = v398;
    }
    uint64_t v478 = 1;
    uint64_t v75 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v76 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v76 = v75 + 32;
    }
    qword_100014090 = v76;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v398) < 0) {
      operator delete((void *)v397);
    }
    sub_10000CDB4(v395, "process_lifetime");
    if (SHIBYTE(v396) < 0)
    {
      sub_10000CBE4(__p, v395[0], (unint64_t)v395[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v395;
      uint64_t v477 = v396;
    }
    uint64_t v478 = 1;
    uint64_t v77 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v78 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v78 = v77 + 32;
    }
    qword_100014090 = v78;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v396) < 0) {
      operator delete(v395[0]);
    }
    sub_10000CDB4(&v393, "percent_dirty");
    if (SHIBYTE(v394) < 0)
    {
      sub_10000CBE4(__p, (void *)v393, *((unint64_t *)&v393 + 1));
    }
    else
    {
      *(_OWORD *)__p = v393;
      uint64_t v477 = v394;
    }
    uint64_t v478 = 1;
    uint64_t v79 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v80 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v80 = v79 + 32;
    }
    qword_100014090 = v80;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v394) < 0) {
      operator delete((void *)v393);
    }
  }
  if (byte_10001412E == 1)
  {
    sub_10000CDB4(v391, "neural");
    if (SHIBYTE(v392) < 0)
    {
      sub_10000CBE4(__p, v391[0], (unint64_t)v391[1]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v391;
      uint64_t v477 = v392;
    }
    uint64_t v478 = 0;
    uint64_t v81 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v82 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v82 = v81 + 32;
    }
    qword_100014090 = v82;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v392) < 0) {
      operator delete(v391[0]);
    }
    sub_10000CDB4(&v389, "neural_peak");
    if (SHIBYTE(v390) < 0)
    {
      sub_10000CBE4(__p, (void *)v389, *((unint64_t *)&v389 + 1));
    }
    else
    {
      *(_OWORD *)__p = v389;
      uint64_t v477 = v390;
    }
    uint64_t v478 = 0;
    uint64_t v83 = qword_100014090;
    if ((unint64_t)qword_100014090 >= unk_100014098)
    {
      uint64_t v84 = sub_10000CED8(&qword_100014088, (long long *)__p);
    }
    else
    {
      sub_10000CE68(&qword_100014088, (long long *)__p);
      uint64_t v84 = v83 + 32;
    }
    qword_100014090 = v84;
    if (SHIBYTE(v477) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v390) < 0) {
      operator delete((void *)v389);
    }
    if (byte_10001412A == 1)
    {
      sub_10000CDB4(v387, "neural_interval_peak");
      if (SHIBYTE(v388) < 0)
      {
        sub_10000CBE4(__p, v387[0], (unint64_t)v387[1]);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v387;
        uint64_t v477 = v388;
      }
      uint64_t v478 = 0;
      uint64_t v85 = qword_100014090;
      if ((unint64_t)qword_100014090 >= unk_100014098)
      {
        uint64_t v86 = sub_10000CED8(&qword_100014088, (long long *)__p);
      }
      else
      {
        sub_10000CE68(&qword_100014088, (long long *)__p);
        uint64_t v86 = v85 + 32;
      }
      qword_100014090 = v86;
      if (SHIBYTE(v477) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v388) < 0) {
        operator delete(v387[0]);
      }
    }
  }
  sub_10000CDB4(&v385, "sample");
  if (SHIBYTE(v386) < 0)
  {
    sub_10000CBE4(__p, (void *)v385, *((unint64_t *)&v385 + 1));
  }
  else
  {
    *(_OWORD *)__p = v385;
    uint64_t v477 = v386;
  }
  uint64_t v478 = 1;
  uint64_t v87 = qword_100014090;
  if ((unint64_t)qword_100014090 >= unk_100014098)
  {
    uint64_t v88 = sub_10000CED8(&qword_100014088, (long long *)__p);
  }
  else
  {
    sub_10000CE68(&qword_100014088, (long long *)__p);
    uint64_t v88 = v87 + 32;
  }
  qword_100014090 = v88;
  if (SHIBYTE(v477) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v386) < 0) {
    operator delete((void *)v385);
  }
  if (dword_100014070)
  {
    for (unint64_t i = 0; i < dword_100014070; ++i)
    {
      uint64_t v89 = 0;
      uint64_t deadline = qword_100014118 + mach_absolute_time();
      do
      {
        v384[0] = 0;
        v384[1] = 0;
        v383 = v384;
        if (v250 - 2 == v89)
        {
          LOBYTE(v90) = 0;
          unint64_t v91 = 0;
          int v92 = 999;
          uint64_t v93 = 1;
          uint64_t v94 = 50;
        }
        else if (v250 - 1 == v89)
        {
          uint64_t v93 = 0;
          uint64_t v94 = 0;
          LOBYTE(v90) = 0;
          unint64_t v91 = 0;
          int v92 = 999;
        }
        else
        {
          v95 = (unsigned int *)((char *)v465 + 24 * v89);
          uint64_t v93 = *v95;
          int v92 = v95[1];
          unsigned int v90 = v95[5];
          uint64_t v94 = (int)v95[4];
          unint64_t v91 = *((void *)v95 + 1);
        }
        if (dword_100014074 != -1 && v93 != dword_100014074)
        {
          v112 = 0;
          goto LABEL_835;
        }
        v382 = 0;
        uint64_t v380 = 0;
        uint64_t v379 = 0;
        uint64_t v381 = 0;
        if ((int)v93 >= 1 && memorystatus_control()) {
          fprintf(__stderrp, "Warning: Failed to get memory limit info for pid %d.  Limits will appear as 0MB and not fatal.\n", v93);
        }
        sub_10000CDB4(v377, "active_limit");
        sub_1000096D8(&v383, (const void **)v377, (uint64_t)(int)v379 << 20);
        if (v378 < 0) {
          operator delete(v377[0]);
        }
        sub_10000CDB4(v375, "inactive_limit");
        sub_1000096D8(&v383, (const void **)v375, (uint64_t)(int)v380 << 20);
        if (v376 < 0) {
          operator delete(v375[0]);
        }
        sub_10000CDB4(v373, "root_limit_increase");
        sub_1000096D8(&v383, (const void **)v373, (v381 << 20));
        char v248 = v90;
        if (v374 < 0) {
          operator delete(v373[0]);
        }
        char v97 = BYTE4(v379);
        char v98 = BYTE4(v380);
        sub_10000CDB4(v371, "active_limit_hard");
        if (v97) {
          v99 = "H";
        }
        else {
          v99 = "-";
        }
        sub_10000CDB4(v369, v99);
        sub_10000997C(&v383, (const void **)v371, (uint64_t)v369);
        if (v370 < 0) {
          operator delete(v369[0]);
        }
        if (v372 < 0) {
          operator delete(v371[0]);
        }
        sub_10000CDB4(v367, "inactive_limit_hard");
        if (v98) {
          v100 = "H";
        }
        else {
          v100 = "-";
        }
        sub_10000CDB4(v365, v100);
        sub_10000997C(&v383, (const void **)v367, (uint64_t)v365);
        if (v366 < 0) {
          operator delete(v365[0]);
        }
        if (v368 < 0) {
          operator delete(v367[0]);
        }
        if ((ledger() & 0x80000000) != 0)
        {
          fprintf(__stderrp, "Warning: Could not get ledger info for pid %d.\n", v93);
        }
        else
        {
          v101 = v475;
          v382 = v475;
          __p[0] = v475;
          v102.i64[0] = -1;
          v102.i64[1] = -1;
          if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32((int32x4_t)xmmword_1000140C0, v102), (int16x8_t)vceqq_s32(*(int32x4_t *)&dword_1000140D0, v102)))) & 1) != 0|| xmmword_1000140E0 == -1|| dword_1000140F4 == -1|| dword_1000140F8 == -1)
          {
            v103 = (char *)malloc_type_malloc(96 * (void)v475, 0x1000040565EDBD2uLL);
            if (!v103) {
              exit(-1);
            }
            if ((ledger() & 0x80000000) == 0)
            {
              v104 = (char *)__p[0];
              if ((uint64_t)__p[0] >= 1)
              {
                v105 = 0;
                v106 = v103;
                while (strcmp(v106, "phys_footprint"))
                {
                  if (!strcmp(v106, "internal"))
                  {
                    v107 = (int *)&xmmword_1000140C0 + 1;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "internal_compressed"))
                  {
                    v107 = (int *)&xmmword_1000140C0 + 2;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "iokit_mapped"))
                  {
                    v107 = (int *)&xmmword_1000140C0 + 3;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "alternate_accounting"))
                  {
                    v107 = &dword_1000140D0;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "alternate_accounting_compressed"))
                  {
                    v107 = &dword_1000140D4;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "purgeable_nonvolatile"))
                  {
                    v107 = &dword_1000140D8;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "purgeable_nonvolatile_compress"))
                  {
                    v107 = &dword_1000140DC;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "page_table"))
                  {
                    v107 = (int *)&xmmword_1000140E0;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "pages_grabbed"))
                  {
                    v107 = (int *)&xmmword_1000140E0 + 1;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "pages_grabbed_kern"))
                  {
                    v107 = (int *)&xmmword_1000140E0 + 2;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "pages_grabbed_iopl"))
                  {
                    v107 = (int *)&xmmword_1000140E0 + 3;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "pages_grabbed_upl"))
                  {
                    v107 = &dword_1000140F0;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "memorystatus_dirty_time"))
                  {
                    v107 = &dword_1000140F4;
                    goto LABEL_525;
                  }
                  if (!strcmp(v106, "neural_nofootprint_total"))
                  {
                    v107 = &dword_1000140F8;
LABEL_525:
                    int *v107 = (int)v105;
                  }
                  ++v105;
                  v106 += 96;
                  if (v104 == v105) {
                    goto LABEL_527;
                  }
                }
                v107 = (int *)&xmmword_1000140C0;
                goto LABEL_525;
              }
            }
LABEL_527:
            free(v103);
            v101 = v382;
          }
          v108 = malloc_type_malloc(48 * (void)v101, 0xDEEAD4A7uLL);
          if ((ledger() & 0x80000000) == 0 && (uint64_t)v382 > (int)xmmword_1000140C0)
          {
            unint64_t v109 = v108[6 * (int)xmmword_1000140C0];
            if (byte_100014129 == 1)
            {
              sub_10000CDB4(v363, "footprint");
              char v110 = v248;
              sub_1000096D8(&v383, v363, v109 - v108[6 * (int)xmmword_1000140E0]);
              if (v364 < 0)
              {
                v111 = v363;
                goto LABEL_537;
              }
            }
            else
            {
              sub_10000CDB4(v361, "footprint");
              char v110 = v248;
              sub_1000096D8(&v383, v361, v109);
              if (v362 < 0)
              {
                v111 = v361;
LABEL_537:
                operator delete((void *)*v111);
              }
            }
            sub_10000CDB4(v359, "internal");
            sub_1000096D8(&v383, (const void **)v359, v108[6 * SDWORD1(xmmword_1000140C0)]);
            if (v360 < 0) {
              operator delete(v359[0]);
            }
            sub_10000CDB4(v357, "internal_comp");
            sub_1000096D8(&v383, (const void **)v357, v108[6 * SDWORD2(xmmword_1000140C0)]);
            if (v358 < 0) {
              operator delete(v357[0]);
            }
            sub_10000CDB4(v355, "iokit_mapped");
            sub_1000096D8(&v383, (const void **)v355, v108[6 * SHIDWORD(xmmword_1000140C0)]);
            if (v356 < 0) {
              operator delete(v355[0]);
            }
            sub_10000CDB4(v353, "alt_acct");
            sub_1000096D8(&v383, (const void **)v353, v108[6 * dword_1000140D0]);
            if (v354 < 0) {
              operator delete(v353[0]);
            }
            sub_10000CDB4(v351, "alt_acct_comp");
            sub_1000096D8(&v383, (const void **)v351, v108[6 * dword_1000140D4]);
            if (v352 < 0) {
              operator delete(v351[0]);
            }
            if ((byte_100014129 & 1) == 0)
            {
              sub_10000CDB4(v349, "page_table");
              sub_1000096D8(&v383, (const void **)v349, v108[6 * (int)xmmword_1000140E0]);
              if (v350 < 0) {
                operator delete(v349[0]);
              }
            }
            sub_10000CDB4(v347, "purge_nonvol");
            sub_1000096D8(&v383, (const void **)v347, v108[6 * dword_1000140D8]);
            if (v348 < 0) {
              operator delete(v347[0]);
            }
            sub_10000CDB4(v345, "purge_nonvol_comp");
            sub_1000096D8(&v383, (const void **)v345, v108[6 * dword_1000140DC]);
            if (v346 < 0) {
              operator delete(v345[0]);
            }
            sub_10000CDB4(v343, "limit");
            sub_1000096D8(&v383, (const void **)v343, v94 << 20);
            if (v344 < 0) {
              operator delete(v343[0]);
            }
            if (byte_10001412C == 1)
            {
              if (DWORD1(xmmword_1000140E0) == -1)
              {
                sub_10000CDB4(v333, "pages_grabbed");
                sub_100009A20(&v383, (const void **)v333, 0);
                if (v334 < 0) {
                  operator delete(v333[0]);
                }
                sub_10000CDB4(v331, "pages_grabbed_kern");
                sub_100009A20(&v383, (const void **)v331, 0);
                if (v332 < 0) {
                  operator delete(v331[0]);
                }
                sub_10000CDB4(v329, "pages_grabbed_iopl");
                sub_100009A20(&v383, (const void **)v329, 0);
                if (v330 < 0) {
                  operator delete(v329[0]);
                }
                sub_10000CDB4(v327, "pages_grabbed_upl");
                sub_100009A20(&v383, v327, 0);
                if (v328 < 0)
                {
                  v113 = v327;
LABEL_575:
                  operator delete((void *)*v113);
                }
              }
              else
              {
                sub_10000CDB4(v341, "pages_grabbed");
                sub_100009A20(&v383, (const void **)v341, v108[6 * SDWORD1(xmmword_1000140E0)]);
                if (v342 < 0) {
                  operator delete(v341[0]);
                }
                sub_10000CDB4(v339, "pages_grabbed_kern");
                sub_100009A20(&v383, (const void **)v339, v108[6 * SDWORD2(xmmword_1000140E0)]);
                if (v340 < 0) {
                  operator delete(v339[0]);
                }
                sub_10000CDB4(v337, "pages_grabbed_iopl");
                sub_100009A20(&v383, (const void **)v337, v108[6 * SHIDWORD(xmmword_1000140E0)]);
                if (v338 < 0) {
                  operator delete(v337[0]);
                }
                sub_10000CDB4(v335, "pages_grabbed_upl");
                sub_100009A20(&v383, v335, v108[6 * dword_1000140F0]);
                if (v336 < 0)
                {
                  v113 = v335;
                  goto LABEL_575;
                }
              }
            }
            double v114 = 0.0;
            if (byte_10001412D == 1 && dword_1000140F4 != -1) {
              double v114 = (double)(uint64_t)v108[6 * dword_1000140F4] / 1000000000.0;
            }
            if (byte_10001412E == 1)
            {
              sub_10000CDB4(v325, "neural");
              sub_1000096D8(&v383, (const void **)v325, v108[6 * dword_1000140F8]);
              if (v326 < 0) {
                operator delete(v325[0]);
              }
            }
            free(v108);
            if (proc_pid_rusage(v93, 6, buffer))
            {
              fprintf(__stderrp, "Warning: Could not get rusage for pid %d.\n", v93);
              sub_10000CDB4(v323, "footprint_peak");
              sub_1000096D8(&v383, (const void **)v323, v109);
              double v115 = 0.0;
              if (v324 < 0) {
                operator delete(v323[0]);
              }
              BOOL v116 = 0;
              goto LABEL_601;
            }
            sub_10000CDB4(v321, "footprint_peak");
            sub_1000096D8(&v383, (const void **)v321, (unint64_t)v473[26]);
            if (v322 < 0) {
              operator delete(v321[0]);
            }
            if (byte_10001412E == 1)
            {
              sub_10000CDB4(v319, "neural_peak");
              sub_1000096D8(&v383, (const void **)v319, (unint64_t)v473[43]);
              if (v320 < 0) {
                operator delete(v319[0]);
              }
            }
            if (byte_10001412A == 1)
            {
              sub_10000CDB4(v317, "footprint_interval_peak");
              sub_1000096D8(&v383, (const void **)v317, (unint64_t)v473[31]);
              if (v318 < 0) {
                operator delete(v317[0]);
              }
              if (byte_10001412E == 1)
              {
                sub_10000CDB4(v315, "neural_interval_peak");
                sub_1000096D8(&v383, (const void **)v315, (unint64_t)v473[44]);
                if (v316 < 0) {
                  operator delete(v315[0]);
                }
              }
            }
            if (byte_10001412D == 1)
            {
              uint64_t v117 = mach_absolute_time();
              v118 = v473[6];
              if (qword_100014108 != -1) {
                dispatch_once(&qword_100014108, &stru_1000103D8);
              }
              double v115 = *(double *)&qword_100014100 * (double)(v117 - (unint64_t)v118);
              BOOL v116 = v115 > 0.0;
LABEL_601:
              if (byte_10001412D == 1)
              {
                sub_10000CDB4(v313, "total_dirty_time");
                sub_100009B04(&v383, (const void **)v313, (unint64_t)v114);
                if (v314 < 0)
                {
                  operator delete(v313[0]);
                  if (!v116) {
                    goto LABEL_611;
                  }
LABEL_604:
                  sub_10000CDB4(v311, "process_lifetime");
                  sub_100009B04(&v383, (const void **)v311, (unint64_t)v115);
                  if (v312 < 0) {
                    operator delete(v311[0]);
                  }
                  sub_10000CDB4(v309, "percent_dirty");
                  double v119 = v114 / v115;
                  v120 = "%";
                  if (byte_10001412F) {
                    v120 = (const char *)&unk_10000F753;
                  }
                  snprintf((char *)__p, 0xAuLL, "%02.2f%s", v119 * 100.0, v120);
                  v121 = (std::string *)sub_100009F24(&v383, v309);
                  std::string::assign(v121, (const std::string::value_type *)__p);
                  v121[1].__r_.__value_.__r.__words[0] = (unint64_t)v119;
                  if (v310 < 0)
                  {
                    v122 = v309;
                    goto LABEL_619;
                  }
                }
                else
                {
                  if (v116) {
                    goto LABEL_604;
                  }
LABEL_611:
                  sub_10000CDB4(v307, "process_lifetime");
                  sub_10000CDB4(v305, "-");
                  sub_10000997C(&v383, (const void **)v307, (uint64_t)v305);
                  if (v306 < 0) {
                    operator delete(v305[0]);
                  }
                  if (v308 < 0) {
                    operator delete(v307[0]);
                  }
                  sub_10000CDB4(v303, "percent_dirty");
                  sub_10000CDB4(v301, "-");
                  sub_10000997C(&v383, v303, (uint64_t)v301);
                  if (v302 < 0) {
                    operator delete(v301[0]);
                  }
                  if (v304 < 0)
                  {
                    v122 = v303;
LABEL_619:
                    operator delete((void *)*v122);
                  }
                }
              }
            }
            uint64_t v300 = 0;
            *(_OWORD *)__val = 0u;
            long long v299 = 0u;
            if (proc_pidinfo(v93, 20, 0, __val, 40) <= 0) {
              fprintf(__stderrp, "Warning: Could not get coalitions for pid %d.\n", v93);
            }
            bzero(__p, 0x1000uLL);
            if ((int)v93 < 1) {
              proc_name(v93, __p, 0x1000u);
            }
            else {
              proc_pidpath(v93, __p, 0x1000u);
            }
            v123 = basename((char *)__p);
            sub_10000CDB4(v296, "name");
            sub_10000CDB4(v294, v123);
            sub_10000997C(&v383, (const void **)v296, (uint64_t)v294);
            if (v295 < 0) {
              operator delete(v294[0]);
            }
            if (v297 < 0) {
              operator delete(v296[0]);
            }
            sub_10000CDB4(v292, "coalition");
            sub_100009A20(&v383, (const void **)v292, __val[1]);
            if (v293 < 0) {
              operator delete(v292[0]);
            }
            sub_10000CDB4(v290, "pid");
            sub_100009A20(&v383, (const void **)v290, (int)v93);
            if (v291 < 0) {
              operator delete(v290[0]);
            }
            sub_10000CDB4(v288, "fds");
            sub_10000A524((uint64_t)v479);
            int v124 = proc_pidinfo(v93, 1, 0, 0, 0);
            if (v124 < 1) {
              goto LABEL_661;
            }
            v125 = 0;
            unint64_t v126 = 0;
            do
            {
              if (v126 < v124)
              {
                v126 -= 256;
                do
                  v126 += 256;
                while (v126 < v124);
                v127 = v125 ? reallocf(v125, v126) : malloc_type_malloc(v126, 0x87F69C10uLL);
                v125 = v127;
                if (!v127) {
                  goto LABEL_661;
                }
              }
              int v128 = proc_pidinfo(v93, 1, 0, v125, v126);
              unsigned int v129 = v128;
              if (v128 < 1)
              {
                int v131 = -1;
LABEL_647:
                if (v125) {
                  goto LABEL_658;
                }
                goto LABEL_659;
              }
              unint64_t v130 = v128 + 8;
              int v124 = v126 + 8;
            }
            while (v130 >= v126);
            if (v129 < 8)
            {
              int v131 = 0;
              goto LABEL_647;
            }
            int v131 = 0;
            uint64_t v132 = v129 >> 3;
            v133 = v125 + 1;
            while (1)
            {
              if (*v133 != 1) {
                goto LABEL_655;
              }
              int v134 = proc_pidfdinfo(v93, *(v133 - 1), 1, v466, 176);
              if (v134 <= 0) {
                break;
              }
              if (v134 < 0xB0) {
                goto LABEL_657;
              }
              ++v131;
LABEL_655:
              v133 += 2;
              if (!--v132) {
                goto LABEL_658;
              }
            }
            if (*__error() == 2) {
              goto LABEL_655;
            }
LABEL_657:
            int v131 = -1;
LABEL_658:
            free(v125);
LABEL_659:
            char v110 = v248;
            if ((v131 & 0x80000000) == 0)
            {
              std::ostream::operator<<();
              goto LABEL_662;
            }
LABEL_661:
            LOBYTE(v466[0]) = 45;
            sub_10000A968(&v480, (uint64_t)v466, 1);
LABEL_662:
            std::stringbuf::str();
            sub_10000A800((uint64_t)v479);
            sub_10000997C(&v383, (const void **)v288, (uint64_t)&v286);
            if (v287 < 0) {
              operator delete(v286);
            }
            if (v289 < 0) {
              operator delete(v288[0]);
            }
            sub_10000CDB4(v284, "priority");
            sub_100009A20(&v383, (const void **)v284, v92);
            if (v285 < 0) {
              operator delete(v284[0]);
            }
            if (v92 <= 109)
            {
              if (v92 <= 49)
              {
                if (v92 <= 19)
                {
                  v135 = "(Idle)";
                  if (v92)
                  {
                    if (v92 != 10) {
                      goto LABEL_849;
                    }
                    v135 = "(Deferred)";
                  }
                }
                else
                {
                  switch(v92)
                  {
                    case 20:
                      v135 = "(Opportunistic)";
                      break;
                    case 30:
                      v135 = "(Dock)";
                      break;
                    case 40:
                      v135 = "(BG)";
                      break;
                    default:
                      goto LABEL_849;
                  }
                }
                goto LABEL_699;
              }
              if (v92 > 79)
              {
                switch(v92)
                {
                  case 'P':
                    v135 = "(UISupport)";
                    break;
                  case 'Z':
                    v135 = "(FGSupport)";
                    break;
                  case 'd':
                    v135 = "(FG)";
                    break;
                  default:
                    goto LABEL_849;
                }
                goto LABEL_699;
              }
              if (v92 == 50)
              {
                v135 = "(Phone)";
                goto LABEL_699;
              }
              if (v92 != 70)
              {
                if (v92 != 75) {
                  goto LABEL_849;
                }
                v135 = "(Freezer)";
                goto LABEL_699;
              }
LABEL_698:
              v135 = "(-)";
              goto LABEL_699;
            }
            if (v92 > 169)
            {
              if (v92 <= 199)
              {
                switch(v92)
                {
                  case 170:
                    v135 = "(RenderServer)";
                    break;
                  case 180:
                    v135 = "(Important)";
                    break;
                  case 190:
                    v135 = "(Critical)";
                    break;
                  default:
                    goto LABEL_849;
                }
                goto LABEL_699;
              }
              if (v92 != 200 && v92 != 210 && v92 != 999) {
                goto LABEL_849;
              }
              goto LABEL_698;
            }
            if (v92 > 139)
            {
              if (v92 != 140)
              {
                if (v92 == 150)
                {
                  v135 = "(DriverKit)";
                }
                else
                {
                  if (v92 != 160) {
                    goto LABEL_849;
                  }
                  v135 = "(Home)";
                }
                goto LABEL_699;
              }
              goto LABEL_698;
            }
            switch(v92)
            {
              case 110:
                goto LABEL_698;
              case 120:
                v135 = "(Audio)";
                break;
              case 130:
                v135 = "(AppleTV)";
                break;
              default:
LABEL_849:
                v135 = "(Unknown)";
                break;
            }
LABEL_699:
            sub_10000CDB4(v282, "priority_name");
            sub_10000CDB4(v280, v135);
            sub_10000997C(&v383, (const void **)v282, (uint64_t)v280);
            if (v281 < 0) {
              operator delete(v280[0]);
            }
            if (v283 < 0) {
              operator delete(v282[0]);
            }
            sub_10000CDB4(v278, "PE");
            if ((v110 & 0x10) != 0) {
              v136 = "Y";
            }
            else {
              v136 = "-";
            }
            sub_10000CDB4(v276, v136);
            sub_10000997C(&v383, (const void **)v278, (uint64_t)v276);
            if (v277 < 0) {
              operator delete(v276[0]);
            }
            if (v279 < 0) {
              operator delete(v278[0]);
            }
            sub_10000CDB4(v274, "frozen");
            if ((v110 & 2) != 0) {
              v137 = "Y";
            }
            else {
              v137 = "-";
            }
            sub_10000CDB4(v272, v137);
            sub_10000997C(&v383, (const void **)v274, (uint64_t)v272);
            if (v273 < 0) {
              operator delete(v272[0]);
            }
            if (v275 < 0) {
              operator delete(v274[0]);
            }
            sub_10000CDB4(v270, "dirty");
            v138 = "Y";
            if ((v110 & 0x20) == 0) {
              v138 = "N";
            }
            if ((v110 & 8) != 0) {
              v139 = (char *)v138;
            }
            else {
              v139 = "-";
            }
            sub_10000CDB4(v268, v139);
            sub_10000997C(&v383, (const void **)v270, (uint64_t)v268);
            if (v269 < 0) {
              operator delete(v268[0]);
            }
            if (v271 < 0) {
              operator delete(v270[0]);
            }
            if (v246)
            {
              if ((int)v93 < 1)
              {
                unsigned int v144 = 0;
              }
              else
              {
                v140 = +[NSNumber numberWithInt:v93];
                v259.__r_.__value_.__r.__words[0] = 0;
                v249 = +[RBSProcessHandle handleForIdentifier:v140 error:&v259];
                v141 = v259.__r_.__value_.__l.__data_;

                if (v141)
                {
                  fprintf(__stderrp, "Warning: Could not get RBSProcessHandle for pid %d.\n", v93);
                  int v142 = 0;
                  int v143 = 1;
                }
                else
                {
                  long long v469 = 0u;
                  long long v468 = 0u;
                  long long v467 = 0u;
                  *(_OWORD *)v466 = 0u;
                  v145 = [v249 currentState];
                  v146 = [v145 assertions];

                  v147 = (char *)[v146 countByEnumeratingWithState:v466 objects:v479 count:16];
                  if (v147)
                  {
                    uint64_t v148 = *(void *)v467;
                    while (2)
                    {
                      for (j = 0; j != v147; ++j)
                      {
                        if (*(void *)v467 != v148) {
                          objc_enumerationMutation(v146);
                        }
                        v150 = [*((id *)v466[1] + (void)j) domain];
                        unsigned __int8 v151 = [v150 isEqualToString:@"com.apple.dasd:DockApp"];

                        if (v151)
                        {
                          int v143 = 1;
                          goto LABEL_745;
                        }
                      }
                      v147 = (char *)[v146 countByEnumeratingWithState:v466 objects:v479 count:16];
                      if (v147) {
                        continue;
                      }
                      break;
                    }
                  }
                  int v143 = 0;
LABEL_745:

                  int v142 = 3;
                }

                if (v143) {
                  unsigned int v144 = v142;
                }
                else {
                  unsigned int v144 = 2;
                }
              }
              sub_10000CDB4(v266, "docked");
              v152 = "Y";
              if ((v144 & 1) == 0) {
                v152 = "N";
              }
              if (v144 >= 2) {
                v153 = (char *)v152;
              }
              else {
                v153 = "-";
              }
              sub_10000CDB4(v264, v153);
              sub_10000997C(&v383, (const void **)v266, (uint64_t)v264);
              if (v265 < 0) {
                operator delete(v264[0]);
              }
              if (v267 < 0) {
                operator delete(v266[0]);
              }
            }
            if ((int)v93 < 1)
            {
              v156 = "-";
            }
            else
            {
              int v154 = memorystatus_control();
              v155 = __error();
              if (v154)
              {
                v156 = "Y";
                if (v154 == -1)
                {
                  int v157 = *v155;
                  v156 = "-";
                  if (v157 != 45)
                  {
                    v158 = __stderrp;
                    v159 = strerror(v157);
                    fprintf(v158, "Warning: Unable to get swappable status for pid: %d due to %s\n", v93, v159);
                  }
                }
              }
              else
              {
                v156 = "N";
              }
            }
            sub_10000CDB4(v262, "swappable");
            sub_10000CDB4(v260, v156);
            sub_10000997C(&v383, (const void **)v262, (uint64_t)v260);
            if (v261 < 0) {
              operator delete(v260[0]);
            }
            if (v263 < 0) {
              operator delete(v262[0]);
            }
            memset(&v259, 0, sizeof(v259));
            if (!v91) {
              goto LABEL_783;
            }
            unint64_t v160 = 0;
            do
            {
              if (v91)
              {
                if (v160 < 0x1B)
                {
                  std::string::size_type size = HIBYTE(v259.__r_.__value_.__r.__words[2]);
                  if ((v259.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                    std::string::size_type size = v259.__r_.__value_.__l.__size_;
                  }
                  if (size) {
                    std::string::append(&v259, " ");
                  }
                  std::string::append(&v259, (&off_1000103F8)[v160]);
                }
                else
                {
                  fprintf(__stderrp, "Warning: Unknown assertion type %d. (Has BKSWorkspaceTypes.h been changed recently?)\n", v89);
                }
              }
              ++v160;
              BOOL v162 = v91 >= 2;
              v91 >>= 1;
            }
            while (v162);
            std::string::size_type v163 = HIBYTE(v259.__r_.__value_.__r.__words[2]);
            if ((v259.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              std::string::size_type v163 = v259.__r_.__value_.__l.__size_;
            }
            if (!v163)
            {
LABEL_783:
              if (byte_10001412F == 1) {
                std::string::assign(&v259, "(---)");
              }
            }
            sub_10000CDB4(v257, "flags");
            if (SHIBYTE(v259.__r_.__value_.__r.__words[2]) < 0) {
              sub_10000CBE4(&__dst, v259.__r_.__value_.__l.__data_, v259.__r_.__value_.__l.__size_);
            }
            else {
              std::string __dst = v259;
            }
            sub_10000997C(&v383, (const void **)v257, (uint64_t)&__dst);
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__dst.__r_.__value_.__l.__data_);
            }
            if (v258 < 0) {
              operator delete(v257[0]);
            }
            sub_10000CDB4(v254, "sample");
            sub_100009A20(&v383, (const void **)v254, i);
            if (v255 < 0) {
              operator delete(v254[0]);
            }
            sub_10000D24C((uint64_t *)&v252, (const void ***)&v383);
            if (qword_100014148)
            {
              if (qword_100014158 != -1) {
                dispatch_once(&qword_100014158, &stru_1000104D0);
              }
              id v164 = objc_alloc((Class)NSMutableDictionary);
              id v165 = [v164 initWithCapacity:(qword_100014090 - qword_100014088) >> 5];
              if (qword_100014090 != qword_100014088)
              {
                uint64_t v166 = 0;
                unint64_t v167 = 0;
                while (1)
                {
                  uint64_t v169 = qword_100014088;
                  v170 = (long long *)(qword_100014088 + v166);
                  if (*(char *)(qword_100014088 + v166 + 23) < 0)
                  {
                    sub_10000CBE4(v479, *(void **)v170, *((void *)v170 + 1));
                  }
                  else
                  {
                    long long v171 = *v170;
                    uint64_t v480 = *((void *)v170 + 2);
                    *(_OWORD *)v479 = v171;
                  }
                  uint64_t v172 = *(void *)(v169 + v166 + 24);
                  uint64_t v481 = v172;
                  if (SHIBYTE(v480) < 0)
                  {
                    sub_10000CBE4(v466, v479[0], (unint64_t)v479[1]);
                    LODWORD(v172) = v481;
                  }
                  else
                  {
                    *(_OWORD *)v466 = *(_OWORD *)v479;
                    *(void *)&long long v467 = v480;
                  }
                  v173 = (SBYTE7(v467) & 0x80u) == 0 ? v466 : (void **)v466[0];
                  v174 = +[NSString stringWithCString:v173 encoding:4];
                  if (!v172) {
                    break;
                  }
                  if (v172 == 1)
                  {
                    v178 = +[NSNumber numberWithUnsignedLongLong:sub_100009F24(&v252, (const void **)v466)[3]];
                    [v165 setObject:v178 forKeyedSubscript:v174];
LABEL_819:

                    goto LABEL_820;
                  }
                  if (v172 == 2)
                  {
                    v175 = sub_100009F24(&v252, (const void **)v466);
                    float v177 = 0.00000095367;
                    if (byte_100014130) {
                      float v177 = 0.00097656;
                    }
                    *(float *)&double v176 = v177 * (float)(unint64_t)v175[3];
                    v178 = +[NSNumber numberWithFloat:v176];
                    [v165 setObject:v178 forKeyedSubscript:v174];
                    goto LABEL_819;
                  }
LABEL_820:

                  if (SBYTE7(v467) < 0) {
                    operator delete(v466[0]);
                  }
                  if (SHIBYTE(v480) < 0) {
                    operator delete(v479[0]);
                  }
                  ++v167;
                  v166 += 32;
                  if (v167 >= (qword_100014090 - qword_100014088) >> 5) {
                    goto LABEL_825;
                  }
                }
                v179 = sub_100009F24(&v252, (const void **)v466);
                if (*((char *)v179 + 23) >= 0) {
                  uint64_t v180 = (uint64_t)v179;
                }
                else {
                  uint64_t v180 = *v179;
                }
                v178 = +[NSString stringWithCString:v180 encoding:4];
                [v165 setObject:v178 forKeyedSubscript:v174];
                goto LABEL_819;
              }
LABEL_825:
              unsigned int v181 = [(id)qword_100014150 evaluateWithObject:v165];

              sub_10000BF78((uint64_t)&v252, v253);
              if (!v181) {
                goto LABEL_832;
              }
            }
            else
            {
              sub_10000BF78((uint64_t)&v252, v253);
            }
            uint64_t v182 = qword_1000140A8;
            if ((unint64_t)qword_1000140A8 >= unk_1000140B0)
            {
              uint64_t v183 = sub_10000D2A4(&qword_1000140A0, (const void ***)&v383);
            }
            else
            {
              sub_10000D24C((uint64_t *)qword_1000140A8, (const void ***)&v383);
              uint64_t v183 = v182 + 24;
              qword_1000140A8 = v182 + 24;
            }
            qword_1000140A8 = v183;
LABEL_832:
            if (SHIBYTE(v259.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v259.__r_.__value_.__l.__data_);
            }
            goto LABEL_834;
          }
          fprintf(__stderrp, "Warning: Could not get ledger entry info for pid %d.\n", v93);
          free(v108);
        }
LABEL_834:
        v112 = (void *)v384[0];
LABEL_835:
        sub_10000BF78((uint64_t)&v383, v112);
        ++v89;
      }
      while (v89 != v250);
      if (i != dword_100014070) {
        uint64_t v250 = sub_10000943C(&v465);
      }
      if (mach_wait_until(deadline))
      {
        fprintf(__stderrp, "Fatal: Failed to wait for %dms", dword_100014124);
        free(v465);
        exit(1);
      }
    }
  }
  free(v465);
  if (byte_10001412F) {
    int v184 = 0;
  }
  else {
    int v184 = 5;
  }
  int v251 = v184;
  LODWORD(__p[0]) = 0;
  sub_10000B188(v479, (qword_100014090 - qword_100014088) >> 5, __p);
  if ((byte_10001412F & 1) == 0)
  {
    uint64_t v185 = qword_100014088;
    if (qword_100014090 != qword_100014088)
    {
      unint64_t v186 = 0;
      do
      {
        unint64_t v187 = v185 + 32 * v186;
        if ((*(unsigned char *)(v187 + 28) & 1) != 0
          || v186 && (*(unsigned char *)(v185 + 32 * (v186 - 1) + 28) & 1) != 0)
        {
          LODWORD(v187) = 0;
        }
        else if (*(char *)(v187 + 23) < 0)
        {
          unint64_t v187 = *(void *)(v187 + 8);
        }
        else
        {
          LODWORD(v187) = *(unsigned __int8 *)(v187 + 23);
        }
        v188 = (char *)v479[0];
        *((_DWORD *)v479[0] + v186) = v187;
        uint64_t v189 = qword_1000140A0;
        if (qword_1000140A8 != qword_1000140A0)
        {
          uint64_t v190 = 0;
          unint64_t v191 = 0;
          do
          {
            v192 = sub_100009F24((uint64_t **)(v189 + v190), (const void **)(qword_100014088 + 32 * v186));
            unint64_t v193 = *((unsigned __int8 *)v192 + 23);
            if ((v193 & 0x80u) != 0) {
              unint64_t v193 = v192[1];
            }
            v188 = (char *)v479[0];
            unint64_t v187 = *((int *)v479[0] + v186);
            if (v193 > v187)
            {
              *((_DWORD *)v479[0] + v186) = v193;
              LODWORD(v187) = v193;
            }
            ++v191;
            uint64_t v189 = qword_1000140A0;
            v190 += 24;
          }
          while (0xAAAAAAAAAAAAAAABLL * ((qword_1000140A8 - qword_1000140A0) >> 3) > v191);
          uint64_t v185 = qword_100014088;
        }
        if (v186)
        {
          uint64_t v194 = (v186 - 1);
          uint64_t v195 = v185 + 32 * v194;
          if (*(unsigned char *)(v195 + 28))
          {
            v196 = &v188[4 * v194];
            unint64_t v197 = *(_DWORD *)v196 + (int)v187 + 1;
            unint64_t v198 = *(char *)(v195 + 23) < 0 ? *(void *)(v195 + 8) : *(unsigned __int8 *)(v195 + 23);
            if (v198 > v197)
            {
              v199 = &v188[4 * v186];
              if ((int)v187 <= *(_DWORD *)v196)
              {
                LODWORD(v187) = *(_DWORD *)v196;
                v199 = v196;
              }
              *(_DWORD *)v199 = v187 - v197 + v198;
            }
          }
        }
        ++v186;
      }
      while (v186 < (qword_100014090 - v185) >> 5);
    }
  }
  int v200 = snprintf((char *)__p, 0x1000uLL, "%*s", v251, "#");
  uint64_t v201 = qword_100014088;
  if (qword_100014090 != qword_100014088)
  {
    uint64_t v202 = 0;
    int v203 = 0;
    v204 = (char *)__p + v200;
    size_t v205 = 4096 - v200;
    do
    {
      if (byte_10001412F) {
        v206 = ",";
      }
      else {
        v206 = "  ";
      }
      if (byte_10001412F)
      {
        int v207 = *(_DWORD *)(v201 + 32 * v202 + 28);
      }
      else
      {
        uint64_t v208 = v201 + 32 * v202;
        int v207 = *(_DWORD *)(v208 + 28);
        if (v207)
        {
          if (*(char *)(v208 + 23) < 0) {
            uint64_t v208 = *(void *)v208;
          }
          int v212 = snprintf(v204, v205, "%s%-*s", "  ", *((_DWORD *)v479[0] + v202) + *((_DWORD *)v479[0] + ++v203) + 1, (const char *)v208);
          goto LABEL_909;
        }
      }
      uint64_t v209 = v201 + 32 * v202;
      if ((v207 & 2) != 0) {
        v210 = "%s%-*s";
      }
      else {
        v210 = "%s%*s";
      }
      if ((v207 & 4) != 0)
      {
        sub_10000AE64(v209, *((_DWORD *)v479[0] + v202), (uint64_t)buffer);
      }
      else if (*(char *)(v209 + 23) < 0)
      {
        sub_10000CBE4(buffer, *(void **)v209, *(void *)(v209 + 8));
      }
      else
      {
        long long v211 = *(_OWORD *)v209;
        v471 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v209 + 16);
        *(_OWORD *)buffer = v211;
      }
      if (SHIBYTE(v471) >= 0) {
        v213 = buffer;
      }
      else {
        v213 = (rusage_info_t *)buffer[0];
      }
      int v212 = snprintf(v204, v205, v210, v206, *((unsigned int *)v479[0] + v202), v213);
      if (SHIBYTE(v471) < 0) {
        operator delete(buffer[0]);
      }
LABEL_909:
      v205 -= v212;
      v204 += v212;
      uint64_t v202 = ++v203;
      uint64_t v201 = qword_100014088;
    }
    while (v203 < (unint64_t)((qword_100014090 - qword_100014088) >> 5));
  }
  sub_10000AFA8(__p);
  puts((const char *)__p);
  if (qword_100014138)
  {
    sub_10000CDB4(v466, (char *)qword_100014138);
    v214 = (uint64_t *)qword_1000140A0;
    v215 = (const void ***)qword_1000140A8;
    if (qword_1000140A8 == qword_1000140A0)
    {
      uint64_t v218 = 0;
      unint64_t v219 = 0xAAAAAAAAAAAAAAABLL * ((qword_1000140A8 - qword_1000140A0) >> 3);
    }
    else
    {
      uint64_t v216 = 0;
      unint64_t v217 = 0;
      do
      {
        if (!sub_10000B36C((uint64_t)&v214[v216], (const void **)v466))
        {
          fprintf(__stderrp, "Error: Unable to sort by key '%s'\n", (const char *)qword_100014138);
          sub_100009CA8(1);
        }
        ++v217;
        v214 = (uint64_t *)qword_1000140A0;
        v215 = (const void ***)qword_1000140A8;
        uint64_t v218 = qword_1000140A8 - qword_1000140A0;
        unint64_t v219 = 0xAAAAAAAAAAAAAAABLL * ((qword_1000140A8 - qword_1000140A0) >> 3);
        v216 += 3;
      }
      while (v219 > v217);
    }
    buffer[0] = _NSConcreteStackBlock;
    buffer[1] = (rusage_info_t)3321888768;
    v471 = sub_10000B020;
    v472 = &unk_1000104F0;
    if (SBYTE7(v467) < 0)
    {
      sub_10000CBE4(v473, v466[0], (unint64_t)v466[1]);
    }
    else
    {
      *(_OWORD *)v473 = *(_OWORD *)v466;
      v473[2] = (void *)v467;
    }
    v220 = buffer;
    v474 = v220;
    if (v218 < 1)
    {
      v221 = 0;
      uint64_t v223 = 0;
    }
    else
    {
      v221 = (uint64_t *)sub_10000B3EC(v219);
      uint64_t v223 = v222;
    }
    sub_10000B458(v214, v215, (id *)&v474, v219, v221, v223);
    if (v221) {
      operator delete(v221);
    }

    if (*((char *)v220 + 55) < 0) {
      operator delete(v473[0]);
    }
    if (SBYTE7(v467) < 0) {
      operator delete(v466[0]);
    }
  }
  if (qword_1000140A8 != qword_1000140A0)
  {
    unint64_t v224 = 0;
    do
    {
      int v225 = snprintf((char *)__p, 0x1000uLL, "%*d", v251, v224);
      uint64_t v226 = qword_100014088;
      if (qword_100014090 != qword_100014088)
      {
        unint64_t v227 = 0;
        v228 = (char *)__p + v225;
        uint64_t v229 = 28;
        size_t v230 = 4096 - v225;
        do
        {
          v231 = ",";
          if ((byte_10001412F & 1) == 0)
          {
            if (v227)
            {
              if (*(_DWORD *)(v226 + 32 * (v227 - 1) + 28)) {
                v231 = " ";
              }
              else {
                v231 = "  ";
              }
            }
            else
            {
              v231 = "  ";
            }
          }
          v232 = (const void **)(v226 + v229 - 28);
          int v233 = *(_DWORD *)(v226 + v229);
          if ((v233 & 2) != 0) {
            v234 = "%s%-*s";
          }
          else {
            v234 = "%s%*s";
          }
          v235 = (uint64_t **)(qword_1000140A0 + 24 * v224);
          if ((v233 & 4) != 0)
          {
            v237 = sub_100009F24(v235, v232);
            sub_10000AE64((uint64_t)v237, *((_DWORD *)v479[0] + v227), (uint64_t)v466);
          }
          else
          {
            v236 = sub_100009F24(v235, v232);
            if (*((char *)v236 + 23) < 0)
            {
              sub_10000CBE4(v466, (void *)*v236, v236[1]);
            }
            else
            {
              *(_OWORD *)v466 = *(_OWORD *)v236;
              *(void *)&long long v467 = v236[2];
            }
          }
          if ((SBYTE7(v467) & 0x80u) == 0) {
            v238 = v466;
          }
          else {
            v238 = (void **)v466[0];
          }
          int v239 = snprintf(v228, v230, v234, v231, *((unsigned int *)v479[0] + v227), v238);
          if (SBYTE7(v467) < 0) {
            operator delete(v466[0]);
          }
          v228 += v239;
          v230 -= v239;
          ++v227;
          uint64_t v226 = qword_100014088;
          v229 += 32;
        }
        while (v227 < (qword_100014090 - qword_100014088) >> 5);
      }
      sub_10000AFA8(__p);
      puts((const char *)__p);
      ++v224;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((qword_1000140A8 - qword_1000140A0) >> 3) > v224);
  }
  if (v479[0])
  {
    v479[1] = v479[0];
    operator delete(v479[0]);
  }
  return 0;
}

void sub_1000085F8(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x6E7]) < 0) {
    operator delete((void *)STACK[0x6D0]);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000943C(void **a1)
{
  if ((dword_100014078 & 0x80000000) == 0)
  {
    if (!sub_100009EB8(dword_100014078))
    {
      fprintf(__stderrp, "Reset interval peak for pid %d. Run with -i (or -e) to see the new interval maximum.\n", dword_100014078);
      exit(0);
    }
LABEL_20:
    exit(71);
  }
  if (byte_100014131 & 1) != 0 || (byte_100014141)
  {
    int v14 = 0;
    size_t v13 = 4;
    if (!sysctlbyname("kern.maxproc", &v14, &v13, 0, 0)) {
      operator new[]();
    }
    goto LABEL_20;
  }
  int64_t v2 = 0;
  while (1)
  {
    while (1)
    {
      int v3 = memorystatus_control();
      if (v3 > 0) {
        break;
      }
      if (*__error() != 4)
      {
        uint64_t v10 = __stderrp;
        uint64_t v11 = __error();
        uint64_t v12 = strerror(*v11);
        fprintf(v10, "Error: Could not get priorityListSize: %s\n", v12);
        goto LABEL_17;
      }
    }
    int64_t v4 = v3 + 96;
    if (v4 > v2)
    {
      *a1 = malloc_type_realloc(*a1, v4, 0x194C6782uLL);
      int64_t v2 = v4;
    }
    int v5 = memorystatus_control();
    if (v5 > 0) {
      return v5 / 0x18u + 2;
    }
    if (*__error() != 22 && *__error() != 4)
    {
      int v6 = __stderrp;
      v7 = __error();
      v8 = strerror(*v7);
      fprintf(v6, "Error: Could not get jetsam priority list: %s\n", v8);
      free(*a1);
LABEL_17:
      exit(1);
    }
  }
}

void sub_1000096C4(void *a1)
{
}

void sub_1000096D8(uint64_t **a1, const void **a2, unint64_t a3)
{
  if (a3 - 0x7FFFFFFFFFFFFFFFLL > 0x8000000000000001)
  {
    if (byte_100014130 == 1)
    {
      unint64_t v7 = a3 >> 10;
      if (byte_10001412F) {
        v8 = (const char *)&unk_10000F753;
      }
      else {
        v8 = "KB";
      }
      __str[0] = 0;
    }
    else
    {
      if (a3 < 0x40000001)
      {
        char v11 = 20;
        if (a3 > 0x100000)
        {
          uint64_t v10 = "MB";
        }
        else
        {
          char v11 = 10;
          uint64_t v10 = "KB";
        }
        if (a3 > 0x100000) {
          LOWORD(v9) = a3 >> 10;
        }
        else {
          LOWORD(v9) = a3;
        }
      }
      else
      {
        unsigned int v9 = a3 >> 20;
        uint64_t v10 = "GB";
        char v11 = 30;
      }
      unint64_t v7 = a3 >> v11;
      if (byte_10001412F) {
        v8 = (const char *)&unk_10000F753;
      }
      else {
        v8 = v10;
      }
      __str[0] = 0;
      if (v7 <= 9) {
        snprintf(__str, 4uLL, ".%d", ((5 * (v9 & 0x3FF)) >> 9) & 0x3FFFFF);
      }
    }
    snprintf(__s, 0x20uLL, "%lld%s%s", v7, __str, v8);
    sub_10000CDB4(&__p, __s);
  }
  else
  {
    if (byte_10001412F == 1)
    {
      if (a3) {
        int v6 = "-";
      }
      else {
        int v6 = "0";
      }
LABEL_6:
      sub_10000CDB4(&__p, v6);
      goto LABEL_31;
    }
    if (byte_100014130 == 1)
    {
      if (a3) {
        int v6 = "-";
      }
      else {
        int v6 = "0KB";
      }
      goto LABEL_6;
    }
    sub_10000CDB4(&__p, "---");
  }
LABEL_31:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    sub_10000CBE4(&__dst, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string __dst = __p;
  }
  unint64_t v15 = a3;
  uint64_t v12 = (std::string *)sub_100009F24(a1, a2);
  std::string::operator=(v12, &__dst);
  v12[1].__r_.__value_.__r.__words[0] = v15;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_100009940(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000997C(uint64_t **a1, const void **a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0) {
    sub_10000CBE4(&__p, *(void **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  int v7 = 0;
  int v5 = (std::string *)sub_100009F24(a1, a2);
  std::string::operator=(v5, &__p);
  v5[1].__r_.__value_.__r.__words[0] = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_100009A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009A20(uint64_t **a1, const void **a2, unint64_t __val)
{
  std::to_string(&v7, __val);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    sub_10000CBE4(&__str, v7.__r_.__value_.__l.__data_, v7.__r_.__value_.__l.__size_);
  }
  else {
    std::string __str = v7;
  }
  unint64_t v9 = __val;
  int v6 = (std::string *)sub_100009F24(a1, a2);
  std::string::operator=(v6, &__str);
  v6[1].__r_.__value_.__r.__words[0] = v9;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
}

void sub_100009AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009B04(uint64_t **a1, const void **a2, unint64_t __val)
{
  int v6 = byte_10001412F;
  std::to_string(&v13, __val);
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v13.__r_.__value_.__l.__size_;
  }
  uint64_t v8 = v6 ^ 1u;
  p_p = &__p;
  sub_10000A3F4((uint64_t)&__p, size + v8);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (size)
  {
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v10 = &v13;
    }
    else {
      uint64_t v10 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    memmove(p_p, v10, size);
  }
  char v11 = (char *)p_p + size;
  if ((v6 & 1) == 0) {
    memcpy(v11, "s", v6 ^ 1u);
  }
  v11[v8] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    sub_10000CBE4(&__str, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string __str = __p;
  }
  unint64_t v16 = __val;
  uint64_t v12 = (std::string *)sub_100009F24(a1, a2);
  std::string::operator=(v12, &__str);
  v12[1].__r_.__value_.__r.__words[0] = v16;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
}

void sub_100009C5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009CA8(int a1)
{
  if (byte_100014080)
  {
    fwrite("   -e: Extended output: print every column.  Equivalent to -l -f -i.\n", 0x45uLL, 1uLL, __stderrp);
    fwrite("   -i: Print interval footprint peak. Requires development kernel.\n", 0x43uLL, 1uLL, __stderrp);
    fwrite("   -z <optional PID>: Reset interval footprint for PID (or all). Requires development kernel.\n", 0x5EuLL, 1uLL, __stderrp);
    fwrite("   -l: Print memory limits.\n", 0x1CuLL, 1uLL, __stderrp);
    fwrite("   -f: Print some (not all) kernel ledgers.\n", 0x2CuLL, 1uLL, __stderrp);
    fwrite("       See xnu osfmk/kern/task.c and footprint(1) for details.\n", 0x3FuLL, 1uLL, __stderrp);
    fwrite("       footprint = (internal - alt_acct) + (internal_comp - alt_acct_comp)\n                   + iokit_mapped + purge_nonvol + purge_nonvol_comp + page_table\n                   + other ledger balances not shown here\n", 0xD7uLL, 1uLL, __stderrp);
    fwrite("       footprint_peak: The maximum value of footprint in the task's lifetime.\n       internal:       Size of the task's anonymous memory which is not compressed.\n       internal_comp:  Size of the task's anonymous memory which is compressed or swapped.\n       iokit_mapped:   Total size of all IOKit mappings in this task.\n       alt_acct:       The number of internal pages which are part of IOKit mappings or purgeable.\n                       These must be subtracted to avoid double-counting.\n       page_table:     The size of page table mappings for the process.\n", 0x238uLL, 1uLL, __stderrp);
  }
  fwrite("   -p PID: Print information about a single process.\n", 0x35uLL, 1uLL, __stderrp);
  fwrite("   -s COLUMN: Sort by column name. By default, sorts by 'priority'.\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("              As a shortcut, 'mem' is an alias for 'footprint'.\n", 0x40uLL, 1uLL, __stderrp);
  fwrite("   -r: Reverse the sort order (descending instead of ascending).\n", 0x41uLL, 1uLL, __stderrp);
  fwrite("   -w PREDICATE: Where clause to filter process list by expected column values.\n                 Provided format follows NSPredicate; see its documentation.\n",
    0x9DuLL,
    1uLL,
    __stderrp);
  fwrite("   -k: Print all columns in KB.\n", 0x20uLL, 1uLL, __stderrp);
  fwrite("   -c: Print output as CSV. Implies -k.\n", 0x28uLL, 1uLL, __stderrp);
  fwrite("   -n NUM: Number of samples in the time series\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("   -d MS: Delay between the time series samples in ms\n", 0x36uLL, 1uLL, __stderrp);
  fwrite("   -h: Print this message and exit.\n", 0x24uLL, 1uLL, __stderrp);
  exit(a1);
}

uint64_t sub_100009EB8(int a1)
{
  uint64_t v2 = proc_reset_footprint_interval();
  if (v2)
  {
    int v3 = __stderrp;
    int64_t v4 = __error();
    int v5 = strerror(*v4);
    fprintf(v3, "Unable to reset footprint for %d. error: %s\n", a1, v5);
  }
  return v2;
}

uint64_t *sub_100009F24(uint64_t **a1, const void **a2)
{
  int64_t v4 = (uint64_t **)sub_100009F9C((uint64_t)a1, &v9, a2);
  int v5 = *v4;
  if (!*v4)
  {
    int v6 = v4;
    sub_10000A03C((uint64_t)a1, (uint64_t)a2, (uint64_t)&v8);
    sub_10000A0E8(a1, v9, v6, v8);
    int v5 = v8;
  }
  return v5 + 7;
}

void *sub_100009F9C(uint64_t a1, void *a2, const void **a3)
{
  int v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!sub_10000A140(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        int v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_10000A140(v7, v9, a3)) {
        break;
      }
      int v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

double sub_10000A03C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(_WORD *)(a3 + 16) = 0;
  uint64_t v7 = v6 + 32;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_10000CBE4(v7, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }
  *(_WORD *)(a3 + 16) = 257;
  double result = 0.0;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  return result;
}

void sub_10000A0CC(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_10000A378(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_10000A0E8(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  double result = sub_10000A1E0(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_10000A140(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    int v6 = a2;
  }
  else {
    int v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void sub_10000A1AC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t *sub_10000A1E0(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_10000A378(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 9) && *((char *)__p + 79) < 0) {
    operator delete(__p[7]);
  }
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t sub_10000A3F4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000A47C();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    int v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void sub_10000A47C()
{
}

void sub_10000A494(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000A4F0(exception, a1);
}

void sub_10000A4DC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000A4F0(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_10000A524(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 24));
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v6;
  *(void *)a1 = v8;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_10000A7D4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000A800(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  return a1;
}

void sub_10000A938(_Unwind_Exception *a1)
{
}

void *sub_10000A968(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      int v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_10000AB10(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_10000AAA4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x10000AA84);
}

void sub_10000AAFC(_Unwind_Exception *a1)
{
}

uint64_t sub_10000AB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      sub_10000AC98(__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_10000AC7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000AC98(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000A47C();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_10000AD44(id a1)
{
  id v3 = +[NSString stringWithCString:qword_100014148 encoding:4];
  uint64_t v1 = +[NSPredicate predicateWithFormat:v3];
  uint64_t v2 = (void *)qword_100014150;
  qword_100014150 = v1;
}

#error "10000AE24: call analysis failed (funcsize=24)"

void sub_10000AE50(_Unwind_Exception *a1)
{
}

void sub_10000AE64(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0) {
    int v5 = *(_DWORD *)(a1 + 8);
  }
  int v6 = a2 - v5;
  if (a2 >= v5) {
    int v7 = a2 - v5;
  }
  else {
    int v7 = v6 + 1;
  }
  size_t v8 = (v6 - (v7 >> 1));
  if ((int)v8 < 1) {
    sub_10000CDB4(__b, (char *)&unk_10000F753);
  }
  else {
    sub_10000AC98(__b, v8, 32);
  }
  if (v6 < 2) {
    sub_10000CDB4(v11, (char *)&unk_10000F753);
  }
  else {
    sub_10000AC98(v11, (v7 >> 1), 32);
  }
  sub_10000B2A0((const void **)__b, (const void **)a1, (uint64_t)__p);
  sub_10000B2A0((const void **)__p, (const void **)v11, a3);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  if (v14 < 0) {
    operator delete(__b[0]);
  }
}

void sub_10000AF5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *sub_10000AFA8(unsigned char *result)
{
  if (!result || (int v1 = *result, !*result))
  {
    fwrite("Fatal: NULL or empty line passed to rstrip().\n", 0x2EuLL, 1uLL, __stderrp);
    exit(-1);
  }
  uint64_t v2 = 0;
  int v3 = -1;
  while (1)
  {
    if (v1 == 32) {
      goto LABEL_7;
    }
    if (!v1) {
      break;
    }
    int v3 = v2;
LABEL_7:
    int v1 = result[++v2];
  }
  result[v3 + 1] = 0;
  return result;
}

uint64_t sub_10000B020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = (const void **)(a1 + 32);
  unint64_t v6 = *(void *)(sub_10000B104(a2, (const void **)(a1 + 32)) + 24);
  unint64_t v7 = *(void *)(sub_10000B104(a3, v5) + 24);
  if (v6 | v7)
  {
    BOOL v18 = v6 < v7;
  }
  else
  {
    uint64_t v8 = sub_10000B104(a2, v5);
    uint64_t v9 = sub_10000B104(a3, v5);
    int v10 = *(char *)(v9 + 23);
    int v11 = *(char *)(v8 + 23);
    if (v11 >= 0) {
      size_t v12 = *(unsigned __int8 *)(v8 + 23);
    }
    else {
      size_t v12 = *(void *)(v8 + 8);
    }
    if (v11 >= 0) {
      char v13 = (const void *)v8;
    }
    else {
      char v13 = *(const void **)v8;
    }
    if (v10 >= 0) {
      size_t v14 = *(unsigned __int8 *)(v9 + 23);
    }
    else {
      size_t v14 = *(void *)(v9 + 8);
    }
    if (v10 >= 0) {
      uint64_t v15 = (const void *)v9;
    }
    else {
      uint64_t v15 = *(const void **)v9;
    }
    if (v14 >= v12) {
      size_t v16 = v12;
    }
    else {
      size_t v16 = v14;
    }
    int v17 = memcmp(v13, v15, v16);
    BOOL v18 = v12 < v14;
    if (v17) {
      BOOL v18 = v17 < 0;
    }
  }
  return (v18 ^ byte_100014140) & 1;
}

uint64_t sub_10000B104(uint64_t a1, const void **a2)
{
  uint64_t v2 = *sub_100009F9C(a1, &v4, a2);
  if (!v2) {
    sub_10000CB54("map::at:  key not found");
  }
  return v2 + 56;
}

void *sub_10000B144(uint64_t a1, uint64_t a2)
{
  double result = (void *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0) {
    return sub_10000CBE4(result, *(void **)(a2 + 32), *(void *)(a2 + 40));
  }
  long long v3 = *(_OWORD *)(a2 + 32);
  result[2] = *(void *)(a2 + 48);
  *(_OWORD *)double result = v3;
  return result;
}

void sub_10000B174(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
}

void *sub_10000B188(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10000B20C(a1, a2);
    unint64_t v6 = (_DWORD *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_10000B1F0(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000B20C(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_10000B250();
  }
  double result = (char *)sub_10000B268((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void sub_10000B250()
{
}

void *sub_10000B268(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_10000A1AC();
  }
  return operator new(4 * a2);
}

uint64_t sub_10000B2A0@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = sub_10000A3F4(a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    uint64_t v8 = (char *)result;
  }
  else {
    uint64_t v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      uint64_t v9 = a1;
    }
    else {
      uint64_t v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  int v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      int v11 = a2;
    }
    else {
      int v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t sub_10000B36C(uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if (!sub_10000A140(v4, a2, v2 + 4))
      {
        if (!sub_10000A140(v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }
      uint64_t v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

void *sub_10000B3EC(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x555555555555555) {
    unint64_t v1 = 0x555555555555555;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    uint64_t result = operator new(24 * v1, &std::nothrow);
    if (result) {
      break;
    }
    BOOL v3 = v1 > 1;
    v1 >>= 1;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

void sub_10000B458(uint64_t *a1, const void ***a2, id *a3, unint64_t a4, uint64_t *a5, uint64_t a6)
{
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      if ((*((unsigned int (**)(void))*a3 + 2))())
      {
        sub_10000BE30(a1, (uint64_t)(a2 - 3));
      }
    }
    else if ((uint64_t)a4 <= 0)
    {
      sub_10000B678((uint64_t)a1, a2, (uint64_t)a3);
    }
    else
    {
      uint64_t v12 = a4 >> 1;
      char v13 = (const void ***)&a1[3 * (a4 >> 1)];
      if ((uint64_t)a4 <= a6)
      {
        v17[0] = (uint64_t)a5;
        v17[1] = (uint64_t)&v18;
        unint64_t v18 = 0;
        sub_10000B788((const void ***)a1, (const void ***)&a1[3 * (a4 >> 1)], (uint64_t)a3, a4 >> 1, a5);
        unint64_t v18 = a4 >> 1;
        unint64_t v15 = a4 - v12;
        size_t v16 = &a5[3 * v12];
        sub_10000B788((const void ***)&a1[3 * (a4 >> 1)], a2, (uint64_t)a3, v15, v16);
        unint64_t v18 = a4;
        sub_10000B978((uint64_t)a5, (const void ***)v16, (const void ***)v16, (const void ***)&a5[3 * a4], (uint64_t)a1, (uint64_t)a3);
        sub_10000C6CC(v17, 0);
      }
      else
      {
        sub_10000B458(a1, &a1[3 * (a4 >> 1)], a3, a4 >> 1, a5, a6);
        uint64_t v14 = a4 - v12;
        sub_10000B458(v13, a2, a3, v14, a5, a6);
        sub_10000BA64((uint64_t)a1, v13, a2, a3, v12, v14, (const void ***)a5, a6);
      }
    }
  }
}

void sub_10000B660(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000C6CC((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_10000B678(uint64_t a1, const void ***a2, uint64_t a3)
{
  if ((const void ***)a1 != a2)
  {
    uint64_t v5 = (const void ***)(a1 + 24);
    if ((const void ***)(a1 + 24) != a2)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = v5;
        if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
        {
          sub_10000D24C((uint64_t *)v11, v8);
          uint64_t v9 = v7;
          while (1)
          {
            sub_10000BE88(a1 + v9 + 24, (const void ***)(a1 + v9));
            if (!v9) {
              break;
            }
            v9 -= 24;
            if (((*(uint64_t (**)(void))(*(void *)a3 + 16))() & 1) == 0)
            {
              uint64_t v10 = a1 + v9 + 24;
              goto LABEL_10;
            }
          }
          uint64_t v10 = a1;
LABEL_10:
          sub_10000BE88(v10, v11);
          sub_10000BF78((uint64_t)v11, v11[1]);
        }
        uint64_t v5 = v8 + 3;
        v7 += 24;
      }
      while (v8 + 3 != a2);
    }
  }
}

void sub_10000B76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

void sub_10000B788(const void ***a1, const void ***a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  if (a4)
  {
    if (a4 == 2)
    {
      v11[0] = (uint64_t)a5;
      v11[1] = (uint64_t)&v12;
      uint64_t v12 = 0;
      uint64_t v10 = a2 - 3;
      if ((*(unsigned int (**)(void))(*(void *)a3 + 16))())
      {
        sub_10000D24C(a5, a2 - 3);
        uint64_t v10 = a1;
      }
      else
      {
        sub_10000D24C(a5, a1);
      }
      ++v12;
      sub_10000D24C(a5 + 3, v10);
      v11[0] = 0;
      sub_10000C6CC(v11, 0);
    }
    else if (a4 == 1)
    {
      sub_10000D24C(a5, a1);
    }
    else if ((uint64_t)a4 > 8)
    {
      sub_10000B458(a1, &a1[3 * (a4 >> 1)], a3, a4 >> 1, a5, a4 >> 1);
      sub_10000B458(&a1[3 * (a4 >> 1)], a2, a3, a4 - (a4 >> 1), &a5[3 * (a4 >> 1)], a4 - (a4 >> 1));
      sub_10000C56C(a1, &a1[3 * (a4 >> 1)], &a1[3 * (a4 >> 1)], a2, (uint64_t)a5, a3);
    }
    else
    {
      sub_10000C3E4(a1, a2, a5, a3);
    }
  }
}

void sub_10000B960(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000C6CC((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B978(uint64_t result, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  if ((const void ***)result == a2)
  {
LABEL_10:
    while (a3 != a4)
    {
      uint64_t result = sub_10000BE88(a5, a3);
      a3 += 3;
      a5 += 24;
    }
  }
  else
  {
    int v11 = (const void ***)result;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
      {
        uint64_t result = sub_10000BE88(a5, a3);
        a3 += 3;
      }
      else
      {
        uint64_t result = sub_10000BE88(a5, v11);
        v11 += 3;
      }
      a5 += 24;
      if (v11 == a2) {
        goto LABEL_10;
      }
    }
    if (v11 != a2)
    {
      uint64_t v12 = 0;
      do
      {
        uint64_t result = sub_10000BE88(a5 + v12 * 8, &v11[v12]);
        v12 += 3;
      }
      while (&v11[v12] != a2);
    }
  }
  return result;
}

void sub_10000BA64(uint64_t a1, const void ***a2, const void ***a3, id *a4, uint64_t a5, uint64_t a6, const void ***a7, uint64_t a8)
{
  uint64_t v45 = a6;
  if (a6)
  {
    while (v45 > a8 && a5 > a8)
    {
      if (!a5) {
        return;
      }
      char v13 = 0;
      uint64_t v14 = -a5;
      while (1)
      {
        uint64_t v15 = (uint64_t)v13 + a1;
        if ((*((uint64_t (**)(void))*a4 + 2))()) {
          break;
        }
        v13 += 3;
        if (__CFADD__(v14++, 1)) {
          return;
        }
      }
      uint64_t v17 = -v14;
      uint64_t v18 = v45;
      uint64_t v43 = a3;
      if (-v14 >= v45)
      {
        if (v14 == -1)
        {
          sub_10000BE30((uint64_t *)((char *)v13 + a1), (uint64_t)a2);
          return;
        }
        if (v14 > 0) {
          uint64_t v17 = 1 - v14;
        }
        uint64_t v40 = v17 >> 1;
        uint64_t v22 = (uint64_t *)((char *)&v13[3 * (v17 >> 1)] + a1);
        uint64_t v26 = (uint64_t (**)(id, void, uint64_t *))*a4;
        uint64_t v27 = a3;
        uint64_t v21 = (uint64_t)a2;
        if (a2 != v27)
        {
          uint64_t v42 = a8;
          unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (v43 - a2);
          uint64_t v21 = (uint64_t)a2;
          do
          {
            unint64_t v29 = v21 + 24 * (v28 >> 1);
            int v30 = v26[2](v26, v29, v22);
            if (v30) {
              v28 += ~(v28 >> 1);
            }
            else {
              v28 >>= 1;
            }
            if (v30) {
              uint64_t v21 = v29 + 24;
            }
          }
          while (v28);
          a8 = v42;
          uint64_t v18 = v45;
        }

        uint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v21 - (uint64_t)a2) >> 3);
        unint64_t v25 = v40;
      }
      else
      {
        if (v45 >= 0) {
          uint64_t v19 = v45;
        }
        else {
          uint64_t v19 = v45 + 1;
        }
        uint64_t v20 = v19 >> 1;
        uint64_t v21 = (uint64_t)&a2[3 * (v19 >> 1)];
        uint64_t v22 = (uint64_t *)a2;
        if ((const void ***)((char *)a2 - a1) != v13)
        {
          uint64_t v46 = v19 >> 1;
          uint64_t v41 = a8;
          uint64_t v23 = a4;
          unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - a1 - (char *)v13) >> 3);
          uint64_t v22 = (uint64_t *)((char *)v13 + a1);
          do
          {
            if ((*((unsigned int (**)(void))*v23 + 2))())
            {
              v24 >>= 1;
            }
            else
            {
              v22 += 3 * (v24 >> 1) + 3;
              v24 += ~(v24 >> 1);
            }
          }
          while (v24);
          a4 = v23;
          a8 = v41;
          uint64_t v18 = v45;
          uint64_t v20 = v46;
        }
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)v22 - a1 - (char *)v13) >> 3);
      }
      if (v22 == (uint64_t *)a2)
      {
        uint64_t v35 = (const void ***)v21;
      }
      else if ((const void ***)v21 == a2)
      {
        uint64_t v35 = (const void ***)v22;
      }
      else
      {
        uint64_t v31 = (uint64_t)a2;
        unint64_t v32 = v25;
        uint64_t v33 = v20;
        uint64_t v34 = sub_10000CA9C(v22, v31, v21);
        uint64_t v20 = v33;
        unint64_t v25 = v32;
        uint64_t v35 = (const void ***)v34;
      }
      a5 = -(uint64_t)v25 - v14;
      uint64_t v36 = v18;
      uint64_t v37 = v18 - v20;
      if ((uint64_t)(v25 + v20) >= (uint64_t)(v36 - (v25 + v20) - v14))
      {
        unint64_t v38 = v25;
        uint64_t v39 = v20;
        sub_10000BA64(v35, v21, v43, a4, -(uint64_t)v25 - v14, v37, a7, a8);
        a3 = v35;
        a2 = (const void ***)v22;
        uint64_t v37 = v39;
        a5 = v38;
      }
      else
      {
        sub_10000BA64((char *)v13 + a1, v22, v35, a4, v25, v20, a7, a8);
        uint64_t v15 = (uint64_t)v35;
        a2 = (const void ***)v21;
        a3 = v43;
      }
      uint64_t v45 = v37;
      a1 = v15;
      if (!v37) {
        return;
      }
    }
    sub_10000C72C(a1, a2, a3, (uint64_t)a4, a5, v45, a7);
  }
}

void sub_10000BE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_10000BE30(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v5 = result[1];
  uint64_t v4 = result[2];
  BOOL v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  if (result[2]) {
    uint64_t result = (uint64_t *)(*v3 + 16);
  }
  *uint64_t result = (uint64_t)v3;
  size_t v6 = (void *)(*(void *)(a2 + 8) + 16);
  if (!v4) {
    size_t v6 = (void *)a2;
  }
  *size_t v6 = a2 + 8;
  return result;
}

uint64_t sub_10000BE88(uint64_t a1, const void ***a2)
{
  if ((const void ***)a1 != a2)
  {
    uint64_t v4 = (void *)(a1 + 8);
    sub_10000BF78(a1, *(void **)(a1 + 8));
    *(void *)a1 = v4;
    *(void *)(a1 + 16) = 0;
    *uint64_t v4 = 0;
    sub_10000BEEC((uint64_t *)a1, *a2, a2 + 1);
  }
  return a1;
}

uint64_t *sub_10000BEEC(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    size_t v6 = result + 1;
    do
    {
      uint64_t result = sub_10000C038(v5, v6, v4 + 4, (long long *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          uint64_t v4 = (const void **)v8;
        }
        while (!v9);
      }
      uint64_t v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

void sub_10000BF78(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000BF78(a1, *a2);
    sub_10000BF78(a1, a2[1]);
    sub_10000BFE0((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void sub_10000BFE0(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t *sub_10000C038(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  size_t v6 = (uint64_t **)sub_10000C0BC(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_10000C268((uint64_t)a1, a4, (uint64_t)&v8);
    sub_10000A0E8(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

const void **sub_10000C0BC(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  uint64_t v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2 && !sub_10000A140((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!sub_10000A140((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      uint64_t v14 = (const void **)a2[1];
      do
      {
        uint64_t v15 = v14;
        uint64_t v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      uint64_t v18 = (const void **)a2;
      do
      {
        uint64_t v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        uint64_t v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_10000A140((uint64_t)(a1 + 2), a5, v15 + 4)) {
        goto LABEL_28;
      }
      uint64_t v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    uint64_t v12 = (const void **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (const void **)a2;
      return (const void **)a2;
    }
  }
  int v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      uint64_t v12 = v11;
      int v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    size_t v16 = a2;
    do
    {
      uint64_t v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      size_t v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (sub_10000A140((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:

  return (const void **)sub_100009F9C((uint64_t)a1, a3, a5);
}

char *sub_10000C268@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  size_t v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = sub_10000C2EC(v6 + 32, a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_10000C2D0(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_10000C38C(v3, v2);
  _Unwind_Resume(a1);
}

char *sub_10000C2EC(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000CBE4(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v4;
  }
  uint64_t v5 = __dst + 24;
  if (*((char *)a2 + 47) < 0)
  {
    sub_10000CBE4(v5, *((void **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    *((void *)__dst + 5) = *((void *)a2 + 5);
    *(_OWORD *)uint64_t v5 = v6;
  }
  *((void *)__dst + 6) = *((void *)a2 + 6);
  return __dst;
}

void sub_10000C370(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000C38C(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    sub_10000BFE0((uint64_t)__p + 32);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void sub_10000C3E4(const void ***a1, const void ***a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    v13[0] = (uint64_t)a3;
    v13[1] = (uint64_t)&v14;
    uint64_t v14 = 0;
    sub_10000D24C(a3, a1);
    ++v14;
    uint64_t v8 = a1 + 3;
    if (v8 != a2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = a3;
      do
      {
        if ((*(unsigned int (**)(void))(*(void *)a4 + 16))())
        {
          sub_10000D24C(v10 + 3, (const void ***)v10);
          ++v14;
          uint64_t v11 = (uint64_t)a3;
          if (v10 != a3)
          {
            uint64_t v12 = v9;
            while ((*(unsigned int (**)(void))(*(void *)a4 + 16))())
            {
              sub_10000BE88((uint64_t)a3 + v12, (const void ***)((char *)a3 + v12 - 24));
              v12 -= 24;
              if (!v12)
              {
                uint64_t v11 = (uint64_t)a3;
                goto LABEL_12;
              }
            }
            uint64_t v11 = (uint64_t)a3 + v12;
          }
LABEL_12:
          sub_10000BE88(v11, v8);
        }
        else
        {
          sub_10000D24C(v10 + 3, v8);
          ++v14;
        }
        v8 += 3;
        v9 += 24;
        v10 += 3;
      }
      while (v8 != a2);
    }
    v13[0] = 0;
    sub_10000C6CC(v13, 0);
  }
}

void sub_10000C54C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000C6CC((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_10000C56C(const void ***a1, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  long long v6 = (uint64_t *)a5;
  v13[0] = a5;
  v13[1] = (uint64_t)&v14;
  uint64_t v14 = 0;
  if (a1 == a2)
  {
LABEL_10:
    while (a3 != a4)
    {
      sub_10000D24C(v6, a3);
      a3 += 3;
      v6 += 3;
      ++v14;
    }
  }
  else
  {
    uint64_t v11 = a1;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
      {
        sub_10000D24C(v6, a3);
        ++v14;
        a3 += 3;
      }
      else
      {
        sub_10000D24C(v6, v11);
        ++v14;
        v11 += 3;
      }
      v6 += 3;
      if (v11 == a2) {
        goto LABEL_10;
      }
    }
    if (v11 != a2)
    {
      uint64_t v12 = 0;
      do
      {
        sub_10000D24C(&v6[v12], &v11[v12]);
        ++v14;
        v12 += 3;
      }
      while (&v11[v12] != a2);
    }
  }
  v13[0] = 0;
  sub_10000C6CC(v13, 0);
}

void sub_10000C6AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000C6CC((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_10000C6CC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)a1[1];
    if (*v3)
    {
      unint64_t v4 = 0;
      do
      {
        sub_10000BF78(v2, *(void **)(v2 + 8));
        ++v4;
        v2 += 24;
      }
      while (v4 < *v3);
    }
  }
}

void sub_10000C72C(uint64_t a1, const void ***a2, const void ***a3, uint64_t a4, uint64_t a5, uint64_t a6, const void ***a7)
{
  v18[0] = (uint64_t)a7;
  v18[1] = (uint64_t)&v19;
  uint64_t v19 = 0;
  if (a5 <= a6)
  {
    uint64_t v15 = (uint64_t *)a7;
    if ((const void ***)a1 != a2)
    {
      uint64_t v15 = (uint64_t *)a7;
      size_t v16 = (const void ***)a1;
      do
      {
        sub_10000D24C(v15, v16);
        ++v19;
        v16 += 3;
        v15 += 3;
      }
      while (v16 != a2);
    }
    sub_10000C884(a7, (const void ***)v15, a2, a3, a1, a4);
  }
  else
  {
    uint64_t v12 = (uint64_t *)a7;
    if (a2 != a3)
    {
      uint64_t v12 = (uint64_t *)a7;
      uint64_t v13 = a2;
      do
      {
        uint64_t v14 = sub_10000D24C(v12, v13);
        ++v19;
        v13 += 3;
        uint64_t v12 = v14 + 3;
      }
      while (v13 != a3);
    }
    uint64_t v17 = a4;
    sub_10000C968((uint64_t)v12, (uint64_t)v12, (uint64_t)a7, (uint64_t)a7, (uint64_t)a2, (uint64_t)a2, a1, a1, (uint64_t)a3, (uint64_t)a3, (uint64_t)&v17);
  }
  sub_10000C6CC(v18, 0);
}

void sub_10000C860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_10000C6CC((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

const void ***sub_10000C884(const void ***result, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  if (result != a2)
  {
    uint64_t v7 = a5;
    uint64_t v11 = result;
    uint64_t v12 = a5;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16))())
      {
        uint64_t result = (const void ***)sub_10000BE88(v12, a3);
        a3 += 3;
      }
      else
      {
        uint64_t result = (const void ***)sub_10000BE88(v12, v11);
        v11 += 3;
      }
      v12 += 24;
      v7 += 24;
      if (v11 == a2) {
        return result;
      }
    }
    return sub_10000CA34(v11, a2, v7);
  }
  return result;
}

void sub_10000C968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 != a4)
  {
    uint64_t v14 = a2;
    uint64_t v15 = a10 - 24;
    while (a6 != a8)
    {
      int v16 = (*(uint64_t (**)(void))(**(void **)a11 + 16))();
      if (v16) {
        uint64_t v17 = (const void ***)(a6 - 24);
      }
      else {
        uint64_t v17 = (const void ***)(v14 - 24);
      }
      if (v16) {
        a6 -= 24;
      }
      else {
        v14 -= 24;
      }
      sub_10000BE88(v15, v17);
      v15 -= 24;
      if (v14 == a4) {
        return;
      }
    }
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = v15 + v18;
      v18 -= 24;
      sub_10000BE88(v19, (const void ***)(v14 + v18));
    }
    while (v14 + v18 != a4);
  }
}

const void ***sub_10000CA34(const void ***a1, const void ***a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a1;
  if (a1 != a2)
  {
    uint64_t v6 = a3;
    do
    {
      sub_10000BE88(v6, v4);
      v4 += 3;
      v6 += 24;
      v3 += 24;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

uint64_t *sub_10000CA9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (uint64_t *)a2;
  sub_10000BE30(a1, a2);
  uint64_t v6 = a1 + 3;
  for (uint64_t i = (uint64_t)(v4 + 3); i != a3; i += 24)
  {
    if (v6 == v4) {
      unint64_t v4 = (uint64_t *)i;
    }
    sub_10000BE30(v6, i);
    v6 += 3;
  }
  if (v6 != v4)
  {
    uint64_t v8 = v6;
    uint64_t v9 = (uint64_t)v4;
    do
    {
      while (1)
      {
        sub_10000BE30(v8, v9);
        v8 += 3;
        v9 += 24;
        if (v9 == a3) {
          break;
        }
        if (v8 == v4) {
          unint64_t v4 = (uint64_t *)v9;
        }
      }
      uint64_t v9 = (uint64_t)v4;
    }
    while (v8 != v4);
  }
  return v6;
}

void sub_10000CB54(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000CBB0(exception, a1);
}

void sub_10000CB9C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000CBB0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000CBE4(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_10000A47C();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_10000CC84(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_10000CCD8((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_10000CCD8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

void sub_10000CD28(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 24;
        sub_10000BF78((uint64_t)(v4 - 24), *((void **)v4 - 2));
        unint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_10000CDB4(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000A47C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *sub_10000CE68(void *result, long long *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_10000CBE4((unsigned char *)result[1], *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }
  *(void *)(v4 + 24) = *((void *)a2 + 3);
  v3[1] = v4 + 32;
  return result;
}

void sub_10000CED0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_10000CED8(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    sub_10000B250();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = sub_10000D064(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (char *)&v10[4 * v4];
  v15[0] = v10;
  v15[1] = v11;
  int v16 = v11;
  uint64_t v17 = (char *)&v10[4 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000CBE4(v11, *(void **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v11 = v12;
  }
  v10[4 * v4 + 3] = *((void *)a2 + 3);
  int v16 = v11 + 32;
  sub_10000CFEC(a1, v15);
  uint64_t v13 = a1[1];
  sub_10000D1BC((uint64_t)v15);
  return v13;
}

void sub_10000CFD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000D1BC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CFEC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000D09C((uint64_t)(a1 + 2), a1[1], (long long *)a1[1], *a1, (long long *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_10000D064(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_10000A1AC();
  }
  return operator new(32 * a2);
}

uint64_t sub_10000D09C(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v14 = a6;
  uint64_t v15 = a7;
  if (a3 != a5)
  {
    unint64_t v9 = (void **)a3;
    do
    {
      uint64_t v10 = (unsigned char *)(v7 - 32);
      uint64_t v11 = (long long *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        sub_10000CBE4(v10, *(v9 - 4), (unint64_t)*(v9 - 3));
      }
      else
      {
        long long v12 = *v11;
        *(void *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)uint64_t v10 = v12;
      }
      *(void *)(v7 - 8) = *(v9 - 1);
      uint64_t v7 = v15 - 32;
      v15 -= 32;
      v9 -= 4;
    }
    while (v11 != a5);
    return v14;
  }
  return a6;
}

void sub_10000D154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a12) {
    sub_10000D174((uint64_t)&a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000D174(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 32;
  }
}

uint64_t sub_10000D1BC(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000D1F4(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t *sub_10000D24C(uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_10000BEEC(a1, *a2, a2 + 1);
  return a1;
}

void sub_10000D28C(_Unwind_Exception *a1)
{
  sub_10000BF78(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t sub_10000D2A4(uint64_t *a1, const void ***a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_10000B250();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_10000D428(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = v10;
  uint64_t v14 = (uint64_t *)&v10[24 * v4];
  int v16 = &v10[24 * v9];
  sub_10000D24C(v14, a2);
  uint64_t v15 = v14 + 3;
  sub_10000D3B0(a1, &v13);
  uint64_t v11 = a1[1];
  sub_10000D508(&v13);
  return v11;
}

void sub_10000D398(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000D508((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D3B0(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000D470((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_10000D428(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_10000A1AC();
  }
  return operator new(24 * a2);
}

uint64_t sub_10000D470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = 0;
  uint64_t v11 = a7 - 24;
  while (a3 + v10 != a5)
  {
    long long v12 = (uint64_t *)(v11 + v10);
    v10 -= 24;
    sub_10000D24C(v12, (const void ***)(v10 + a3));
  }
  return a6;
}

void **sub_10000D508(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_10000D53C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    sub_10000BF78(i - 24, *(void **)(i - 16));
  }
}

void sub_10000D584()
{
  byte_100014080 = os_variant_has_internal_content();
  qword_100014090 = 0;
  unk_100014098 = 0;
  qword_100014088 = 0;
  __cxa_atexit((void (*)(void *))sub_100004360, &qword_100014088, (void *)&_mh_execute_header);
  qword_1000140A8 = 0;
  unk_1000140B0 = 0;
  qword_1000140A0 = 0;
  __cxa_atexit((void (*)(void *))sub_100004398, &qword_1000140A0, (void *)&_mh_execute_header);
  *(void *)&long long v1 = -1;
  *((void *)&v1 + 1) = -1;
  xmmword_1000140C0 = v1;
  *(_OWORD *)&dword_1000140D0 = v1;
  xmmword_1000140E0 = v1;
  *(long long *)((char *)&xmmword_1000140E0 + 12) = v1;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_call_unexpected(void *a1)
{
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t ledger()
{
  return _ledger();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return _mach_wait_until(deadline);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
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

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int proc_listallpids(void *buffer, int buffersize)
{
  return _proc_listallpids(buffer, buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int proc_pidfdinfo(int pid, int fd, int flavor, void *buffer, int buffersize)
{
  return _proc_pidfdinfo(pid, fd, flavor, buffer, buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

uint64_t proc_reset_footprint_interval()
{
  return _proc_reset_footprint_interval();
}

int puts(const char *a1)
{
  return _puts(a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return [a1 assertions];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}