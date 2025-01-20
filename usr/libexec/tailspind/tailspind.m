double sub_100002510(unint64_t a1)
{
  if (qword_100016680 != -1) {
    dispatch_once(&qword_100016680, &stru_100010708);
  }
  return *(double *)&qword_100016678 * (double)a1 * 0.000000001;
}

void sub_100002574(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_100016678 = (double)v1 / (double)v2;
}

id sub_10000354C()
{
  if (qword_100016690 != -1) {
    dispatch_once(&qword_100016690, &stru_100010728);
  }
  v0 = (void *)qword_100016688;

  return v0;
}

void sub_1000035A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tailspin", "library");
  unint64_t v2 = (void *)qword_100016688;
  qword_100016688 = (uint64_t)v1;

  id v3 = (id)qword_100016688;
  if (!v3) {
    sub_10000A16C();
  }
}

uint64_t sub_100003600(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(byte_100016698, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE) {
    uint64_t result = vsnprintf(&byte_100016698[result], 1024 - result, a2, &a9);
  }
  qword_100016640 = (uint64_t)byte_100016698;
  return result;
}

uint64_t sub_100003680()
{
  __chkstk_darwin();
  size_t __sizep = 0;
  __bufp = 0;
  if (qword_100016508 == (unint64_t)ktrace_config_kdebug_get_buffer_size() >> 20)
  {
    uint64_t typefilter = ktrace_config_kdebug_get_typefilter();
    if (typefilter)
    {
      uint64_t v1 = typefilter;
      memcpy(__dst, &unk_1000144E4, sizeof(__dst));
      if (qword_100016530) {
        BOOL v2 = 0;
      }
      else {
        BOOL v2 = qword_100016558 == 0;
      }
      if (!v2 || dword_1000165A4 != 0)
      {
        for (unsigned int i = 0; i != 256; ++i)
          __dst[(i >> 3) | 0x4A0] |= 1 << (i & 7);
      }
      int v5 = 0;
      while (2)
      {
        for (int j = 0; j != 256; ++j)
        {
          unint64_t v7 = j | (v5 << 8);
          int v8 = 1 << (j & 7);
          if ((v8 & __dst[v7 >> 3]) != 0 && (v8 & *(unsigned char *)(v1 + (v7 >> 3))) == 0)
          {
            int v12 = *__error();
            v13 = sub_10000354C();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              sub_10000A590();
            }
            goto LABEL_34;
          }
        }
        if (++v5 != 256) {
          continue;
        }
        break;
      }
      uint64_t timer_period_ns = ktrace_config_kperf_get_timer_period_ns();
      if (timer_period_ns == qword_100016530)
      {
        if (!timer_period_ns) {
          goto LABEL_23;
        }
        if (ktrace_config_kperf_get_timer_action_id() == HIDWORD(qword_1000165F0))
        {
          if (ktrace_config_kperf_get_action_samplers() == dword_1000165F8)
          {
            if (ktrace_config_kperf_get_pet_mode() == 2)
            {
LABEL_23:
              uint64_t v10 = ktrace_config_kperf_get_timer_period_ns();
              if (v10 == qword_100016558)
              {
                if (!v10) {
                  return 1;
                }
                if (ktrace_config_kperf_get_timer_action_id() == dword_100016600)
                {
                  if (ktrace_config_kperf_get_action_samplers() == dword_100016604) {
                    return 1;
                  }
                  int v12 = *__error();
                  v13 = sub_10000354C();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                    sub_10000A274();
                  }
                }
                else
                {
                  int v12 = *__error();
                  v13 = sub_10000354C();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                    sub_10000A2E4();
                  }
                }
              }
              else
              {
                int v12 = *__error();
                v13 = sub_10000354C();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                  sub_10000A364();
                }
              }
            }
            else
            {
              int v12 = *__error();
              v13 = sub_10000354C();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                sub_10000A3E8();
              }
            }
          }
          else
          {
            int v12 = *__error();
            v13 = sub_10000354C();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              sub_10000A41C();
            }
          }
        }
        else
        {
          int v12 = *__error();
          v13 = sub_10000354C();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_10000A48C();
          }
        }
      }
      else
      {
        int v12 = *__error();
        v13 = sub_10000354C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10000A50C();
        }
      }
    }
    else
    {
      int v12 = *__error();
      v13 = sub_10000354C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10000A1F8();
      }
    }
  }
  else
  {
    int v12 = *__error();
    v13 = sub_10000354C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000A5FC();
    }
  }
LABEL_34:

  *__error() = v12;
  uint64_t result = (uint64_t)open_memstream(&__bufp, &__sizep);
  if (result)
  {
    v14 = (FILE *)result;
    if (!ktrace_config_print_description())
    {
      int v15 = *__error();
      v16 = sub_10000354C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000A188((uint64_t)&__bufp, v16, v17, v18, v19, v20, v21, v22);
      }

      *__error() = v15;
    }
    fclose(v14);
    free(__bufp);
    return 0;
  }
  return result;
}

void sub_100003B3C()
{
  uint64_t tailspin_profile_config = get_tailspin_profile_config();
  if (tailspin_profile_config)
  {
    uint64_t v1 = tailspin_profile_config;
    goto LABEL_3;
  }
  uint64_t tailspin_tasking_config = get_tailspin_tasking_config();
  if (!tailspin_tasking_config)
  {
    if ((dword_1000144E0 & 0xFFFFFFFD) != 1) {
      return;
    }
    sub_100003C28(0);
    goto LABEL_4;
  }
  uint64_t v1 = tailspin_tasking_config;
  if (dword_1000144E0 != 2)
  {
LABEL_3:
    sub_100003C28(v1);
    tailspin_config_free();
LABEL_4:
    if (sub_1000050C8())
    {
      sub_1000053AC();
      sub_100004F7C();
    }
    else
    {
      int v2 = *__error();
      id v3 = sub_10000354C();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10000A678();
      }

      *__error() = v2;
    }
    return;
  }

  tailspin_config_free();
}

uint64_t sub_100003C28(uint64_t a1)
{
  int v2 = (const char *)(a1 + 8204);
  if (a1 && (*(unsigned char *)a1 & 0x80) != 0)
  {
    uint64_t v7 = qword_1000144D8;
    if ((qword_1000144D8 & 0x80) != 0)
    {
      char v12 = byte_100016580;
      if (byte_100016580 == *(unsigned char *)(a1 + 8360) && !strncmp(&byte_100016581, (const char *)(a1 + 8361), 0x20uLL)) {
        goto LABEL_42;
      }
      int v8 = *__error();
      v9 = sub_10000354C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v2 + 157;
        if (!v2[157])
        {
          int v14 = *(_DWORD *)(a1 + 8);
          if (v14 == 3)
          {
            v13 = "<profile>";
          }
          else if (v14 == 1)
          {
            v13 = "<tasking>";
          }
          else
          {
            v13 = "<unknown>";
          }
        }
        int v19 = *((unsigned __int8 *)v2 + 156);
        uint64_t v20 = &byte_100016581;
        if (!byte_100016581)
        {
          if (dword_1000144E0 == 3)
          {
            uint64_t v20 = "<profile>";
          }
          else if (dword_1000144E0 == 1)
          {
            uint64_t v20 = "<tasking>";
          }
          else
          {
            uint64_t v20 = "<unknown>";
          }
        }
        int v125 = 136446978;
        v126 = (void *)v13;
        __int16 v127 = 1024;
        *(_DWORD *)v128 = v19;
        *(_WORD *)&v128[4] = 2082;
        *(void *)&v128[6] = v20;
        *(_WORD *)&v128[14] = 1024;
        *(_DWORD *)&v128[16] = byte_100016580;
        v16 = "%{public}s requested to change tailspin enablement to %d, overriding previous request from %{public}s to c"
              "hange tailspin enablement to %d";
        uint64_t v17 = v9;
        uint32_t v18 = 34;
        goto LABEL_40;
      }
    }
    else
    {
      int v8 = *__error();
      v9 = sub_10000354C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v2 + 157;
        if (!v2[157])
        {
          int v11 = *(_DWORD *)(a1 + 8);
          if (v11 == 3)
          {
            uint64_t v10 = "<profile>";
          }
          else if (v11 == 1)
          {
            uint64_t v10 = "<tasking>";
          }
          else
          {
            uint64_t v10 = "<unknown>";
          }
        }
        int v15 = *((unsigned __int8 *)v2 + 156);
        int v125 = 136446722;
        v126 = (void *)v10;
        __int16 v127 = 1024;
        *(_DWORD *)v128 = v15;
        *(_WORD *)&v128[4] = 1024;
        *(_DWORD *)&v128[6] = byte_100016580;
        v16 = "%{public}s requested to change tailspin enablement to %d from default %d";
        uint64_t v17 = v9;
        uint32_t v18 = 24;
LABEL_40:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v125, v18);
      }
    }

    *__error() = v8;
    uint64_t v7 = qword_1000144D8;
    char v12 = v2[156];
LABEL_42:
    qword_1000144D8 = v7 | 0x80;
    *((unsigned char *)&qword_1000144D8 + &unk_1000020A8) = v12;
    set_config_field_modifier();
    goto LABEL_43;
  }
  uint64_t v3 = qword_1000144D8;
  if ((qword_1000144D8 & 0x80) != 0)
  {
    int v4 = *__error();
    int v5 = sub_10000354C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = &byte_100016581;
      if (!byte_100016581)
      {
        if (dword_1000144E0 == 3)
        {
          v6 = "<profile>";
        }
        else if (dword_1000144E0 == 1)
        {
          v6 = "<tasking>";
        }
        else
        {
          v6 = "<unknown>";
        }
      }
      int v125 = 136446722;
      v126 = v6;
      __int16 v127 = 1024;
      *(_DWORD *)v128 = byte_100016580;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = tailspin_enabled_get_default();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin enablement to %d to default %d", (uint8_t *)&v125, 0x18u);
    }

    *__error() = v4;
    uint64_t v3 = qword_1000144D8;
  }
  qword_1000144D8 = v3 & 0xFFFFFFFFFFFFFF7FLL;
  *((unsigned char *)&qword_1000144D8 + &unk_1000020A8) = tailspin_enabled_get_default();
  set_config_field_modifier();
  if (a1)
  {
LABEL_43:
    if ((*(unsigned char *)a1 & 2) == 0) {
      goto LABEL_44;
    }
    uint64_t v25 = qword_1000144D8;
    if ((qword_1000144D8 & 2) != 0)
    {
      uint64_t v30 = qword_100016508;
      if (qword_100016508 == *(void *)(a1 + 8240) && !strncmp(&byte_100016510, (const char *)(a1 + 8248), 0x20uLL)) {
        goto LABEL_83;
      }
      int v26 = *__error();
      v27 = sub_10000354C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v2 + 44;
        if (!v2[44])
        {
          int v32 = *(_DWORD *)(a1 + 8);
          if (v32 == 3)
          {
            v31 = "<profile>";
          }
          else if (v32 == 1)
          {
            v31 = "<tasking>";
          }
          else
          {
            v31 = "<unknown>";
          }
        }
        uint64_t v39 = *(void *)(a1 + 8240);
        v40 = &byte_100016510;
        if (!byte_100016510)
        {
          if (dword_1000144E0 == 3)
          {
            v40 = "<profile>";
          }
          else if (dword_1000144E0 == 1)
          {
            v40 = "<tasking>";
          }
          else
          {
            v40 = "<unknown>";
          }
        }
        int v125 = 136446978;
        v126 = (void *)v31;
        __int16 v127 = 2048;
        *(void *)v128 = v39;
        *(_WORD *)&v128[8] = 2082;
        *(void *)&v128[10] = v40;
        *(_WORD *)&v128[18] = 2048;
        uint64_t v129 = qword_100016508;
        v36 = "%{public}s requested to change tailspin buffer size to %zu MB, overriding previous request from %{public}s"
              " to change tailspin buffer size to %zu MB";
        v37 = v27;
        uint32_t v38 = 42;
        goto LABEL_81;
      }
    }
    else
    {
      int v26 = *__error();
      v27 = sub_10000354C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v2 + 44;
        if (!v2[44])
        {
          int v29 = *(_DWORD *)(a1 + 8);
          if (v29 == 3)
          {
            v28 = "<profile>";
          }
          else if (v29 == 1)
          {
            v28 = "<tasking>";
          }
          else
          {
            v28 = "<unknown>";
          }
        }
        uint64_t v35 = *(void *)(a1 + 8240);
        int v125 = 136446722;
        v126 = (void *)v28;
        __int16 v127 = 2048;
        *(void *)v128 = v35;
        *(_WORD *)&v128[8] = 2048;
        *(void *)&v128[10] = qword_100016508;
        v36 = "%{public}s requested to change tailspin buffer size to %zu MB from default %zu MB";
        v37 = v27;
        uint32_t v38 = 32;
LABEL_81:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, (uint8_t *)&v125, v38);
      }
    }

    *__error() = v26;
    uint64_t v25 = qword_1000144D8;
    uint64_t v30 = *(void *)(a1 + 8240);
LABEL_83:
    qword_1000144D8 = v25 | 2;
    qword_100016508 = v30;
    set_config_field_modifier();
    goto LABEL_84;
  }
LABEL_44:
  uint64_t v21 = qword_1000144D8;
  if ((qword_1000144D8 & 2) != 0)
  {
    int v22 = *__error();
    v23 = sub_10000354C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = &byte_100016510;
      if (!byte_100016510)
      {
        if (dword_1000144E0 == 3)
        {
          v24 = "<profile>";
        }
        else if (dword_1000144E0 == 1)
        {
          v24 = "<tasking>";
        }
        else
        {
          v24 = "<unknown>";
        }
      }
      uint64_t v33 = qword_100016508;
      uint64_t v34 = tailspin_buffer_size_get_default();
      int v125 = 136446722;
      v126 = v24;
      __int16 v127 = 2048;
      *(void *)v128 = v33;
      *(_WORD *)&v128[8] = 2048;
      *(void *)&v128[10] = v34;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin buffer size to %zu MB to default %zu MB", (uint8_t *)&v125, 0x20u);
    }

    *__error() = v22;
    uint64_t v21 = qword_1000144D8;
  }
  qword_1000144D8 = v21 & 0xFFFFFFFFFFFFFFFDLL;
  qword_100016508 = tailspin_buffer_size_get_default();
  set_config_field_modifier();
  if (a1)
  {
LABEL_84:
    if ((*(unsigned char *)a1 & 1) == 0) {
      goto LABEL_85;
    }
    uint64_t v47 = qword_1000144D8;
    if (qword_1000144D8)
    {
      if (!memcmp(&unk_1000144E4, (const void *)(a1 + 12), 0x2000uLL)
        && !strncmp(&byte_1000164E4, (const char *)(a1 + 8204), 0x20uLL))
      {
        goto LABEL_124;
      }
      v48 = (void *)trace_print_filter();
      v49 = (void *)trace_print_filter();
      int v50 = *__error();
      v51 = sub_10000354C();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v54 = v2;
        if (!*v2)
        {
          int v55 = *(_DWORD *)(a1 + 8);
          if (v55 == 3)
          {
            v54 = "<profile>";
          }
          else if (v55 == 1)
          {
            v54 = "<tasking>";
          }
          else
          {
            v54 = "<unknown>";
          }
        }
        v60 = &byte_1000164E4;
        if (!byte_1000164E4)
        {
          if (dword_1000144E0 == 3)
          {
            v60 = "<profile>";
          }
          else if (dword_1000144E0 == 1)
          {
            v60 = "<tasking>";
          }
          else
          {
            v60 = "<unknown>";
          }
        }
        int v125 = 136446978;
        v126 = (void *)v54;
        __int16 v127 = 2082;
        *(void *)v128 = v48;
        *(_WORD *)&v128[8] = 2082;
        *(void *)&v128[10] = v60;
        *(_WORD *)&v128[18] = 2082;
        uint64_t v129 = (uint64_t)v49;
        v57 = "%{public}s requested to change tailspin typefilter to %{public}s, overriding previous request from %{publi"
              "c}s to change tailspin typefilter to %{public}s";
        v58 = v51;
        uint32_t v59 = 42;
        goto LABEL_122;
      }
    }
    else
    {
      v48 = (void *)trace_print_filter();
      v49 = (void *)trace_print_filter();
      int v50 = *__error();
      v51 = sub_10000354C();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = v2;
        if (!*v2)
        {
          int v53 = *(_DWORD *)(a1 + 8);
          if (v53 == 3)
          {
            v52 = "<profile>";
          }
          else if (v53 == 1)
          {
            v52 = "<tasking>";
          }
          else
          {
            v52 = "<unknown>";
          }
        }
        int v125 = 136446722;
        v126 = (void *)v52;
        __int16 v127 = 2082;
        *(void *)v128 = v49;
        *(_WORD *)&v128[8] = 2082;
        *(void *)&v128[10] = v48;
        v57 = "%{public}s requested to change tailspin typefilter to %{public}s from default %{public}s";
        v58 = v51;
        uint32_t v59 = 32;
LABEL_122:
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, v57, (uint8_t *)&v125, v59);
      }
    }

    *__error() = v50;
    free(v49);
    free(v48);
    uint64_t v47 = qword_1000144D8;
LABEL_124:
    qword_1000144D8 = v47 | 1;
    memcpy(&unk_1000144E4, (const void *)(a1 + 12), 0x2000uLL);
    set_config_field_modifier();
    goto LABEL_125;
  }
LABEL_85:
  uint64_t v41 = qword_1000144D8;
  if (qword_1000144D8)
  {
    v42 = (void *)trace_print_filter();
    tailspin_kdbg_filter_get_default();
    v43 = (void *)trace_print_filter();
    int v44 = *__error();
    v45 = sub_10000354C();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = &byte_1000164E4;
      if (!byte_1000164E4)
      {
        if (dword_1000144E0 == 3)
        {
          v46 = "<profile>";
        }
        else if (dword_1000144E0 == 1)
        {
          v46 = "<tasking>";
        }
        else
        {
          v46 = "<unknown>";
        }
      }
      int v125 = 136446722;
      v126 = v46;
      __int16 v127 = 2082;
      *(void *)v128 = v42;
      *(_WORD *)&v128[8] = 2082;
      *(void *)&v128[10] = v43;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin typefilter to %{public}s to default %{public}s", (uint8_t *)&v125, 0x20u);
    }

    *__error() = v44;
    free(v42);
    free(v43);
    uint64_t v41 = qword_1000144D8;
  }
  qword_1000144D8 = v41 & 0xFFFFFFFFFFFFFFFELL;
  v56 = (const void *)tailspin_kdbg_filter_get_default();
  memcpy(&unk_1000144E4, v56, 0x2000uLL);
  set_config_field_modifier();
  if (a1)
  {
LABEL_125:
    if ((*(unsigned char *)a1 & 8) == 0) {
      goto LABEL_126;
    }
    uint64_t v65 = qword_1000144D8;
    if ((qword_1000144D8 & 8) != 0)
    {
      uint64_t v70 = qword_100016530;
      if (qword_100016530 == *(void *)(a1 + 8280) && !strncmp(&byte_100016538, (const char *)(a1 + 8288), 0x20uLL)) {
        goto LABEL_165;
      }
      int v66 = *__error();
      v67 = sub_10000354C();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v71 = v2 + 84;
        if (!v2[84])
        {
          int v72 = *(_DWORD *)(a1 + 8);
          if (v72 == 3)
          {
            v71 = "<profile>";
          }
          else if (v72 == 1)
          {
            v71 = "<tasking>";
          }
          else
          {
            v71 = "<unknown>";
          }
        }
        uint64_t v79 = *(void *)(a1 + 8280);
        v80 = &byte_100016538;
        if (!byte_100016538)
        {
          if (dword_1000144E0 == 3)
          {
            v80 = "<profile>";
          }
          else if (dword_1000144E0 == 1)
          {
            v80 = "<tasking>";
          }
          else
          {
            v80 = "<unknown>";
          }
        }
        int v125 = 136446978;
        v126 = (void *)v71;
        __int16 v127 = 2048;
        *(void *)v128 = v79;
        *(_WORD *)&v128[8] = 2082;
        *(void *)&v128[10] = v80;
        *(_WORD *)&v128[18] = 2048;
        uint64_t v129 = qword_100016530;
        v76 = "%{public}s requested to change tailspin full system sampling period to %llu ns, overriding previous reques"
              "t from %{public}s to change tailspin full system sampling period to %llu ns";
        v77 = v67;
        uint32_t v78 = 42;
        goto LABEL_163;
      }
    }
    else
    {
      int v66 = *__error();
      v67 = sub_10000354C();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = v2 + 84;
        if (!v2[84])
        {
          int v69 = *(_DWORD *)(a1 + 8);
          if (v69 == 3)
          {
            v68 = "<profile>";
          }
          else if (v69 == 1)
          {
            v68 = "<tasking>";
          }
          else
          {
            v68 = "<unknown>";
          }
        }
        uint64_t v75 = *(void *)(a1 + 8280);
        int v125 = 136446722;
        v126 = (void *)v68;
        __int16 v127 = 2048;
        *(void *)v128 = v75;
        *(_WORD *)&v128[8] = 2048;
        *(void *)&v128[10] = qword_100016530;
        v76 = "%{public}s requested to change tailspin full system sampling period to %llu ns from default %llu ns";
        v77 = v67;
        uint32_t v78 = 32;
LABEL_163:
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, v76, (uint8_t *)&v125, v78);
      }
    }

    *__error() = v66;
    uint64_t v65 = qword_1000144D8;
    uint64_t v70 = *(void *)(a1 + 8280);
LABEL_165:
    qword_1000144D8 = v65 | 8;
    qword_100016530 = v70;
    set_config_field_modifier();
    goto LABEL_166;
  }
LABEL_126:
  uint64_t v61 = qword_1000144D8;
  if ((qword_1000144D8 & 8) != 0)
  {
    int v62 = *__error();
    v63 = sub_10000354C();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = &byte_100016538;
      if (!byte_100016538)
      {
        if (dword_1000144E0 == 3)
        {
          v64 = "<profile>";
        }
        else if (dword_1000144E0 == 1)
        {
          v64 = "<tasking>";
        }
        else
        {
          v64 = "<unknown>";
        }
      }
      uint64_t v73 = qword_100016530;
      uint64_t v74 = tailspin_full_sampling_period_get_default();
      int v125 = 136446722;
      v126 = v64;
      __int16 v127 = 2048;
      *(void *)v128 = v73;
      *(_WORD *)&v128[8] = 2048;
      *(void *)&v128[10] = v74;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin full system sampling period to %llu ns to default %llu ns", (uint8_t *)&v125, 0x20u);
    }

    *__error() = v62;
    uint64_t v61 = qword_1000144D8;
  }
  qword_1000144D8 = v61 & 0xFFFFFFFFFFFFFFF7;
  qword_100016530 = tailspin_full_sampling_period_get_default();
  set_config_field_modifier();
  if (a1)
  {
LABEL_166:
    if ((*(unsigned char *)a1 & 0x10) == 0) {
      goto LABEL_167;
    }
    uint64_t v85 = qword_1000144D8;
    if ((qword_1000144D8 & 0x10) != 0)
    {
      uint64_t v90 = qword_100016558;
      if (qword_100016558 == *(void *)(a1 + 8320) && !strncmp(&byte_100016560, (const char *)(a1 + 8328), 0x20uLL)) {
        goto LABEL_206;
      }
      int v86 = *__error();
      v87 = sub_10000354C();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v91 = v2 + 124;
        if (!v2[124])
        {
          int v92 = *(_DWORD *)(a1 + 8);
          if (v92 == 3)
          {
            v91 = "<profile>";
          }
          else if (v92 == 1)
          {
            v91 = "<tasking>";
          }
          else
          {
            v91 = "<unknown>";
          }
        }
        uint64_t v99 = *(void *)(a1 + 8320);
        v100 = &byte_100016560;
        if (!byte_100016560)
        {
          if (dword_1000144E0 == 3)
          {
            v100 = "<profile>";
          }
          else if (dword_1000144E0 == 1)
          {
            v100 = "<tasking>";
          }
          else
          {
            v100 = "<unknown>";
          }
        }
        int v125 = 136446978;
        v126 = (void *)v91;
        __int16 v127 = 2048;
        *(void *)v128 = v99;
        *(_WORD *)&v128[8] = 2082;
        *(void *)&v128[10] = v100;
        *(_WORD *)&v128[18] = 2048;
        uint64_t v129 = qword_100016558;
        v96 = "%{public}s requested to change tailspin oncore sampling period to %llu ns, overriding previous request fro"
              "m %{public}s to change tailspin oncore sampling period to %llu ns";
        v97 = v87;
        uint32_t v98 = 42;
        goto LABEL_204;
      }
    }
    else
    {
      int v86 = *__error();
      v87 = sub_10000354C();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = v2 + 124;
        if (!v2[124])
        {
          int v89 = *(_DWORD *)(a1 + 8);
          if (v89 == 3)
          {
            v88 = "<profile>";
          }
          else if (v89 == 1)
          {
            v88 = "<tasking>";
          }
          else
          {
            v88 = "<unknown>";
          }
        }
        uint64_t v95 = *(void *)(a1 + 8320);
        int v125 = 136446722;
        v126 = (void *)v88;
        __int16 v127 = 2048;
        *(void *)v128 = v95;
        *(_WORD *)&v128[8] = 2048;
        *(void *)&v128[10] = qword_100016558;
        v96 = "%{public}s requested to change tailspin oncore sampling period to %llu ns from default %llu ns";
        v97 = v87;
        uint32_t v98 = 32;
LABEL_204:
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, v96, (uint8_t *)&v125, v98);
      }
    }

    *__error() = v86;
    uint64_t v85 = qword_1000144D8;
    uint64_t v90 = *(void *)(a1 + 8320);
LABEL_206:
    qword_1000144D8 = v85 | 0x10;
    qword_100016558 = v90;
    set_config_field_modifier();
    goto LABEL_207;
  }
LABEL_167:
  uint64_t v81 = qword_1000144D8;
  if ((qword_1000144D8 & 0x10) != 0)
  {
    int v82 = *__error();
    v83 = sub_10000354C();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = &byte_100016560;
      if (!byte_100016560)
      {
        if (dword_1000144E0 == 3)
        {
          v84 = "<profile>";
        }
        else if (dword_1000144E0 == 1)
        {
          v84 = "<tasking>";
        }
        else
        {
          v84 = "<unknown>";
        }
      }
      uint64_t v93 = qword_100016558;
      uint64_t v94 = tailspin_oncore_sampling_period_get_default();
      int v125 = 136446722;
      v126 = v84;
      __int16 v127 = 2048;
      *(void *)v128 = v93;
      *(_WORD *)&v128[8] = 2048;
      *(void *)&v128[10] = v94;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin oncore sampling period to %llu ns to default %llu ns", (uint8_t *)&v125, 0x20u);
    }

    *__error() = v82;
    uint64_t v81 = qword_1000144D8;
  }
  qword_1000144D8 = v81 & 0xFFFFFFFFFFFFFFEFLL;
  qword_100016558 = tailspin_oncore_sampling_period_get_default();
  set_config_field_modifier();
  if (a1)
  {
LABEL_207:
    if ((*(unsigned char *)a1 & 0x20) == 0) {
      goto LABEL_208;
    }
    uint64_t v105 = qword_1000144D8;
    if ((qword_1000144D8 & 0x20) != 0)
    {
      int v111 = dword_1000165A4;
      if (dword_1000165A4 == *(_DWORD *)(a1 + 8396) && !strncmp(&byte_1000165A8, (const char *)(a1 + 8400), 0x20uLL)) {
        goto LABEL_247;
      }
      int v106 = *__error();
      v107 = sub_10000354C();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        int v113 = *((unsigned __int8 *)v2 + 196);
        v112 = v2 + 196;
        if (!v113)
        {
          int v114 = *(_DWORD *)(a1 + 8);
          if (v114 == 3)
          {
            v112 = "<profile>";
          }
          else if (v114 == 1)
          {
            v112 = "<tasking>";
          }
          else
          {
            v112 = "<unknown>";
          }
        }
        int v123 = *(_DWORD *)(a1 + 8396);
        v124 = &byte_1000165A8;
        if (!byte_1000165A8)
        {
          if (dword_1000144E0 == 3)
          {
            v124 = "<profile>";
          }
          else if (dword_1000144E0 == 1)
          {
            v124 = "<tasking>";
          }
          else
          {
            v124 = "<unknown>";
          }
        }
        int v125 = 136446978;
        v126 = (void *)v112;
        __int16 v127 = 1024;
        *(_DWORD *)v128 = v123;
        *(_WORD *)&v128[4] = 2082;
        *(void *)&v128[6] = v124;
        *(_WORD *)&v128[14] = 1024;
        *(_DWORD *)&v128[16] = dword_1000165A4;
        v120 = "%{public}s requested to change tailspin sampling modifers to 0x%x, overriding previous request from %{pub"
               "lic}s to change tailspin sampling modifiers to 0x%x";
        v121 = v107;
        uint32_t v122 = 34;
        goto LABEL_245;
      }
    }
    else
    {
      int v106 = *__error();
      v107 = sub_10000354C();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        int v109 = *((unsigned __int8 *)v2 + 196);
        v108 = v2 + 196;
        if (!v109)
        {
          int v110 = *(_DWORD *)(a1 + 8);
          if (v110 == 3)
          {
            v108 = "<profile>";
          }
          else if (v110 == 1)
          {
            v108 = "<tasking>";
          }
          else
          {
            v108 = "<unknown>";
          }
        }
        int v119 = *(_DWORD *)(a1 + 8396);
        int v125 = 136446722;
        v126 = (void *)v108;
        __int16 v127 = 1024;
        *(_DWORD *)v128 = v119;
        *(_WORD *)&v128[4] = 1024;
        *(_DWORD *)&v128[6] = dword_1000165A4;
        v120 = "%{public}s requested to change tailspin sampling modifiers to %x from default %x";
        v121 = v107;
        uint32_t v122 = 24;
LABEL_245:
        _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, v120, (uint8_t *)&v125, v122);
      }
    }

    *__error() = v106;
    uint64_t v105 = qword_1000144D8;
    int v111 = *(_DWORD *)(a1 + 8396);
LABEL_247:
    qword_1000144D8 = v105 | 0x20;
    dword_1000165A4 = v111;
    uint64_t result = set_config_field_modifier();
LABEL_248:
    int v118 = *(_DWORD *)(a1 + 8);
    goto LABEL_249;
  }
LABEL_208:
  uint64_t v101 = qword_1000144D8;
  if ((qword_1000144D8 & 0x20) != 0)
  {
    int v102 = *__error();
    v103 = sub_10000354C();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      v104 = &byte_1000165A8;
      if (!byte_1000165A8)
      {
        if (dword_1000144E0 == 3)
        {
          v104 = "<profile>";
        }
        else if (dword_1000144E0 == 1)
        {
          v104 = "<tasking>";
        }
        else
        {
          v104 = "<unknown>";
        }
      }
      int v115 = dword_1000165A4;
      int v116 = tailspin_sampling_options_get_default();
      int v125 = 136446722;
      v126 = v104;
      __int16 v127 = 1024;
      *(_DWORD *)v128 = v115;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = v116;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Reverted previous request by %{public}s to change tailspin sampling options to %x to default %x", (uint8_t *)&v125, 0x18u);
    }

    *__error() = v102;
    uint64_t v101 = qword_1000144D8;
  }
  qword_1000144D8 = v101 & 0xFFFFFFFFFFFFFFDFLL;
  dword_1000165A4 = tailspin_sampling_options_get_default();
  uint64_t result = set_config_field_modifier();
  if (a1) {
    goto LABEL_248;
  }
  int v118 = 0;
LABEL_249:
  dword_1000144E0 = v118;
  return result;
}

void sub_100004F7C()
{
  v0 = tailspin_make_ondisk_config();
  uint64_t v1 = v0;
  if (v0)
  {
    if (([v0 writeToFile:@"/var/db/tailspin_config.plist" atomically:1] & 1) == 0)
    {
      int v2 = *__error();
      uint64_t v3 = sub_10000354C();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10000A6AC();
      }

      *__error() = v2;
    }
  }
  else
  {
    unlink("/var/db/tailspin_config.plist");
  }
}

uint64_t sub_100005024()
{
  int v0 = *__error();
  uint64_t v1 = sub_10000354C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10000A75C();
  }

  *__error() = v0;
  if (sub_1000050C8())
  {
    sub_1000053AC();
    return 0;
  }
  else
  {
    int v3 = *__error();
    int v4 = sub_10000354C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000A728();
    }

    *__error() = v3;
    return 5;
  }
}

uint64_t sub_1000050C8()
{
  __chkstk_darwin();
  if (byte_100016580)
  {
    ktrace_session_create();
    ktrace_session_set_event_names_enabled();
    ktrace_set_buffer_size();
    memcpy(__dst, &unk_1000144E4, 0x2000uLL);
    int v0 = dword_1000165A4;
    if (qword_100016530) {
      BOOL v1 = 0;
    }
    else {
      BOOL v1 = qword_100016558 == 0;
    }
    if (!v1 || dword_1000165A4 != 0)
    {
      for (unsigned int i = 0; i != 256; ++i)
        *((unsigned char *)__dst + ((i >> 3) | 0x4A0)) |= 1 << (i & 7);
      if (v0)
      {
        if (tailspin_sampling_option_get()) {
          LOBYTE(__dst[20]) |= 1u;
        }
        if (tailspin_sampling_option_get())
        {
          HIBYTE(__dst[16]) |= 0x10u;
          HIBYTE(__dst[64]) |= 0x10u;
        }
        if (tailspin_sampling_option_get()) {
          LOBYTE(__dst[19]) |= 1u;
        }
      }
    }
    if (ktrace_events_filter_bitmap()) {
      sub_10000A16C();
    }
    int v4 = ktrace_configure();
    ktrace_session_free();
    BOOL v5 = v4 == 0;
    int v6 = *__error();
    uint64_t v7 = sub_10000354C();
    int v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000A818();
      }

      *__error() = v6;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Successfully enacted kdbg config", v15, 2u);
      }

      *__error() = v6;
      uint64_t v13 = mach_absolute_time();
      sub_100005978(v13, "KDBG_STATE");
    }
  }
  else
  {
    int v9 = ktrace_reset_existing();
    int v10 = *__error();
    int v11 = sub_10000354C();
    char v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000A79C();
      }

      BOOL v5 = 0;
      *__error() = v10;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __dst[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Successfully reset kdbg config", (uint8_t *)__dst, 2u);
      }

      *__error() = v10;
      return 1;
    }
  }
  return v5;
}

uint64_t sub_1000053AC()
{
  if (byte_100016580) {
    uint64_t v0 = qword_100016530;
  }
  else {
    uint64_t v0 = 0;
  }
  if (byte_100016580) {
    uint64_t v1 = qword_100016558;
  }
  else {
    uint64_t v1 = 0;
  }
  if (byte_100016580) {
    int v2 = dword_1000165A4;
  }
  else {
    int v2 = 0;
  }
  if (kperf_reset()) {
    goto LABEL_27;
  }
  if (v0)
  {
    qword_1000165F0 = 0x200000000;
    unsigned int v3 = 2;
    unsigned int v4 = 1;
    if (!v1) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unsigned int v4 = 0;
  unsigned int v3 = 1;
  if (v1)
  {
LABEL_13:
    ++v3;
    dword_1000165FC = v4;
    dword_100016600 = v3;
    ++v4;
  }
LABEL_14:
  if (v2) {
    dword_10001660C = ++v3;
  }
  unsigned int v10 = 0;
  if (kperf_action_count_get() || v10 < v3 && kperf_action_count_set()) {
    goto LABEL_27;
  }
  unsigned int v9 = 0;
  if (kperf_timer_count_get() || v9 < v4 && kperf_timer_count_set()) {
    goto LABEL_27;
  }
  if (kperf_lazy_cpu_action_set()) {
    goto LABEL_27;
  }
  kperf_ns_to_ticks();
  if (kperf_lazy_cpu_time_threshold_set()) {
    goto LABEL_27;
  }
  if (v0)
  {
    if (kperf_action_samplers_set()) {
      goto LABEL_27;
    }
    if (kperf_timer_action_set()) {
      goto LABEL_27;
    }
    kperf_ns_to_ticks();
    if (kperf_timer_period_set()) {
      goto LABEL_27;
    }
    int v8 = 1;
    if (sysctlbyname("kperf.lightweight_pet", 0, 0, &v8, 4uLL) || kperf_timer_pet_set()) {
      goto LABEL_27;
    }
  }
  if (v1)
  {
    if (kperf_action_samplers_set()) {
      goto LABEL_27;
    }
    if (kperf_timer_action_set()) {
      goto LABEL_27;
    }
    kperf_ns_to_ticks();
    if (kperf_timer_period_set()) {
      goto LABEL_27;
    }
  }
  if (!v2)
  {
LABEL_58:
    uint64_t result = kperf_sample_on();
    if (!result) {
      return result;
    }
    goto LABEL_27;
  }
  kperf_kdebug_filter_create();
  if (v2)
  {
    if (kperf_kdebug_filter_add_debugid() || kperf_kdebug_filter_add_debugid()) {
      goto LABEL_27;
    }
    if ((v2 & 2) == 0)
    {
LABEL_44:
      if ((v2 & 4) == 0) {
        goto LABEL_55;
      }
      goto LABEL_45;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_44;
  }
  if (kperf_kdebug_filter_add_class_subclass_fn()
    || kperf_kdebug_filter_add_class_subclass_fn())
  {
    goto LABEL_27;
  }
  if ((v2 & 4) == 0) {
    goto LABEL_55;
  }
LABEL_45:
  if (kperf_kdebug_filter_add_class_subclass_fn()) {
    goto LABEL_27;
  }
LABEL_55:
  if (!kperf_action_samplers_set()
    && !kperf_kdebug_filter_set()
    && !kperf_kdebug_action_set())
  {
    goto LABEL_58;
  }
LABEL_27:
  int v5 = *__error();
  int v6 = sub_10000354C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10000A884();
  }

  *__error() = v5;
  return kperf_reset();
}

void start()
{
  uint64_t v9 = 0;
  unsigned int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  _os_crash_callback = sub_100005A84;
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.tailspind.ipc_queue", 0);
  uint64_t v1 = (void *)qword_100016AA0;
  qword_100016AA0 = (uint64_t)v0;

  if (!qword_100016AA0)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.tailspind.timeout_queue", 0);
  unsigned int v3 = (void *)qword_100016AA8;
  qword_100016AA8 = (uint64_t)v2;

  if (!qword_100016AA8)
  {
LABEL_9:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.tailspind", 0, 1uLL);
  int v5 = (void *)qword_100016A98;
  qword_100016A98 = (uint64_t)mach_service;

  if (qword_100016A98)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005BB4;
    block[3] = &unk_1000107A8;
    block[4] = &v9;
    dispatch_sync((dispatch_queue_t)qword_100016AA0, block);
    if (*((_DWORD *)v10 + 6))
    {
      xpc_connection_set_event_handler((xpc_connection_t)qword_100016A98, &stru_1000107C8);
      xpc_connection_resume((xpc_connection_t)qword_100016A98);
    }
    else
    {
      xpc_connection_set_event_handler((xpc_connection_t)qword_100016A98, &stru_1000107E8);
      xpc_connection_resume((xpc_connection_t)qword_100016A98);
      dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
      uint64_t v7 = (void *)qword_100016AB0;
      qword_100016AB0 = (uint64_t)v6;

      dispatch_source_set_event_handler((dispatch_source_t)qword_100016AB0, &stru_100010830);
      dispatch_resume((dispatch_object_t)qword_100016AB0);
      xpc_activity_register("com.apple.tailspin.cleanup", XPC_ACTIVITY_CHECK_IN, &stru_100010850);
    }
    dispatch_main();
  }
LABEL_10:
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_100005954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_100005978(uint64_t a1, const char *a2)
{
  int v4 = *__error();
  int v5 = sub_10000354C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    int v8 = a2;
    __int16 v9 = 2048;
    uint64_t v10 = a1;
    __int16 v11 = 2080;
    int v12 = asc_100016618;
    __int16 v13 = 2048;
    uint64_t v14 = qword_100016610;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating trace buffer start info: %s at %llu (was %s at %llu)", (uint8_t *)&v7, 0x2Au);
  }

  *__error() = v4;
  qword_100016610 = a1;
  return strncpy(asc_100016618, a2, 0x20uLL);
}

uint64_t sub_100005A84(uint64_t a1)
{
  int v2 = *__error();
  unsigned int v3 = sub_10000354C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v7[0] = 136315138;
    *(void *)&v7[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cleaning up kernel state before exiting because: %s", (uint8_t *)v7, 0xCu);
  }

  *__error() = v2;
  v7[2] = 7;
  *(void *)int v7 = 0x1800000001;
  if (sysctl(v7, 3u, 0, 0, 0, 0) < 0)
  {
    int v4 = *__error();
    int v5 = sub_10000354C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000A908();
    }

    *__error() = v4;
  }
  kperf_sample_off();
  return kperf_reset();
}

void sub_100005BB4(uint64_t a1)
{
  uint64_t tailspin_ondisk_config = get_tailspin_ondisk_config();
  sub_100003C28(tailspin_ondisk_config);
  if (tailspin_ondisk_config) {
    tailspin_config_free();
  }
  if (dword_100016AC0) {
    goto LABEL_4;
  }
  if (qword_100016AB8) {
    sub_10000A16C();
  }
  mach_port_t special_port = 0;
  if (task_get_special_port(mach_task_self_, 4, &special_port))
  {
    int v4 = *__error();
    int v5 = sub_10000354C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000AAC4();
    }
LABEL_17:

    *__error() = v4;
    int v3 = -1;
    goto LABEL_18;
  }
  if (bootstrap_check_in(special_port, "com.apple.tailspind.ktrace_background", (mach_port_t *)&dword_100016AC0))
  {
    int v4 = *__error();
    int v5 = sub_10000354C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000AA58();
    }
    goto LABEL_17;
  }
  int v12 = 1;
  int v6 = sysctlbyname("ktrace.init_background", 0, 0, &v12, 4uLL);
  if (v6)
  {
    int v7 = v6;
    int v8 = *__error();
    __int16 v9 = sub_10000354C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000AA24();
    }

    *__error() = v8;
    int v4 = *__error();
    int v5 = sub_10000354C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000A984(v7, v5);
    }
    goto LABEL_17;
  }
  dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, dword_100016AC0, 0, (dispatch_queue_t)qword_100016AA0);
  __int16 v11 = (void *)qword_100016AB8;
  qword_100016AB8 = (uint64_t)v10;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100016AB8, &stru_100010898);
  dispatch_resume((dispatch_object_t)qword_100016AB8);
LABEL_4:
  int v3 = 0;
LABEL_18:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_100016AA0, &stru_100010780);
}

void sub_100005DD8(id a1, OS_xpc_object *a2)
{
  int v2 = a2;
  string = xpc_dictionary_get_string(v2, "XPCEventName");
  dispatch_source_t v10 = xpc_dictionary_get_string(v2, "Notification");
  if (!string) {
LABEL_57:
  }
    sub_10000AB30((char)string, (uint64_t)v10, v4, v5, v6, v7, v8, v9);
  if (!strcmp(string, "com.apple.tailspin.tasking_changed") && v10 && !strcmp(v10, "com.apple.da.tasking_changed"))
  {
    int v37 = *__error();
    uint32_t v38 = sub_10000354C();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v39 = "Resolving tasking change";
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, v39, buf, 2u);
    }
LABEL_35:

    *__error() = v37;
    sub_100003B3C();
    goto LABEL_56;
  }
  if (!strcmp(string, "com.apple.tailspin.profile_changed")
    && v10
    && !strcmp(v10, "com.apple.ManagedConfiguration.profileListChanged"))
  {
    int v37 = *__error();
    uint32_t v38 = sub_10000354C();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v39 = "Resolving profile change";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (strcmp(string, "com.apple.tailspin.dump_on_reset")
    || !v10
    || strcmp(v10, "com.apple.system.logging.power_button_notification"))
  {
    goto LABEL_57;
  }
  int v11 = *__error();
  int v12 = sub_10000354C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "notification to dump tailspin on reset", buf, 2u);
  }

  *__error() = v11;
  if (byte_100016580)
  {
    id v13 = objc_alloc_init((Class)NSDateFormatter);
    [v13 setDateStyle:1];
    [v13 setDateFormat:@"yyyy-MM-dd-HHmmss"];
    id v73 = 0;
    uint64_t v14 = +[NSFileManager defaultManager];
    unsigned __int8 v74 = 0;
    if ([v14 fileExistsAtPath:@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" isDirectory:&v74])
    {
      int v15 = v74;
      int v16 = *__error();
      uint64_t v17 = sub_10000354C();
      uint32_t v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint32_t v78 = 138412290;
          *(void *)&v78[4] = @"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Directory at path: %@ already exists", v78, 0xCu);
        }

        *__error() = v16;
        int v19 = +[NSFileManager defaultManager];
        uint64_t v20 = [v19 attributesOfItemAtPath:@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" error:0];
        uint64_t v21 = [v20 fileOwnerAccountName];
        unsigned __int8 v22 = [v21 isEqualToString:@"mobile"];

        if ((v22 & 1) == 0)
        {
          int v23 = *__error();
          v24 = sub_10000354C();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint32_t v78 = 138543618;
            *(void *)&v78[4] = @"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins";
            __int16 v79 = 2114;
            CFStringRef v80 = @"mobile";
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Attempting to update owner for directory at %{public}@ to %{public}@", v78, 0x16u);
          }

          *__error() = v23;
          NSFileAttributeKey v76 = NSFileOwnerAccountName;
          CFStringRef v77 = @"mobile";
          uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          id v75 = 0;
          unsigned __int8 v26 = [v19 setAttributes:v25 ofItemAtPath:@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" error:&v75];
          id v27 = v75;
          int v28 = *__error();
          int v29 = sub_10000354C();
          uint64_t v30 = v29;
          if (v26)
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint32_t v78 = 138543618;
              *(void *)&v78[4] = @"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins";
              __int16 v79 = 2114;
              CFStringRef v80 = @"mobile";
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Successfully updated owner for directory at %{public}@ to %{public}@", v78, 0x16u);
            }
          }
          else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            sub_10000ACB0((uint64_t)v27, v30);
          }

          *__error() = v28;
        }

        unsigned __int8 v36 = 1;
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10000AC38(v18, v40, v41, v42, v43, v44, v45, v46);
        }

        *__error() = v16;
        CFStringRef v77 = (const __CFString *)NSLocalizedDescriptionKey;
        *(void *)uint32_t v78 = @"Path exists but is not a directory";
        uint64_t v47 = +[NSDictionary dictionaryWithObjects:v78 forKeys:&v77 count:1];
        id v73 = +[NSError errorWithDomain:@"ForceResetTailspinErrorDomain" code:1 userInfo:v47];

        unsigned __int8 v36 = 0;
      }
    }
    else
    {
      int v33 = *__error();
      uint64_t v34 = sub_10000354C();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint32_t v78 = 138412290;
        *(void *)&v78[4] = @"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins";
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Creating directory at path %@", v78, 0xCu);
      }

      *__error() = v33;
      CFStringRef v77 = (const __CFString *)NSFileOwnerAccountName;
      *(void *)uint32_t v78 = @"mobile";
      uint64_t v35 = +[NSDictionary dictionaryWithObjects:v78 forKeys:&v77 count:1];
      unsigned __int8 v36 = [v14 createDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" withIntermediateDirectories:1 attributes:v35 error:&v73];
    }
    id v48 = v73;
    if (v36)
    {
      v49 = +[NSDate date];
      int v50 = [v13 stringFromDate:v49];
      v51 = +[NSString stringWithFormat:@"tailspin-trace_reset_%@.tailspin", v50];

      v52 = [@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" stringByAppendingPathComponent:v51];
      mode_t v53 = umask(0);
      id v54 = v52;
      int v55 = open((const char *)[v54 UTF8String], 2562, 432);
      umask(v53);
      if (v55 < 0)
      {
        int v64 = *__error();
        uint64_t v65 = sub_10000354C();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          sub_10000AB64();
        }

        *__error() = v64;
      }
      else
      {
        v56 = +[NSMutableDictionary dictionary];
        [v56 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
        [v56 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
        [v56 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
        [v56 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
        [v56 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
        [v56 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
        [v56 setObject:&off_100010ED0 forKeyedSubscript:UnsafePointer];
        [v56 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
        [v56 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
        int v57 = *__error();
        v58 = sub_10000354C();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint32_t v78 = 138543362;
          *(void *)&v78[4] = v56;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Saving tailspin file for reset with options = %{public}@", v78, 0xCu);
        }

        *__error() = v57;
        uint32_t v59 = tailspin_make_ondisk_config();
        v60 = (void *)os_transaction_create();
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v67 = 3221225472;
        v68 = sub_100008BF8;
        int v69 = &unk_1000108C0;
        int v72 = v55;
        id v70 = v54;
        id v71 = v60;
        id v61 = v60;
        tailspin_save_trace_with_standard_chunks();
      }
    }
    else
    {
      int v62 = *__error();
      v63 = sub_10000354C();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        sub_10000ABD0();
      }

      *__error() = v62;
    }
  }
  else
  {
    int v31 = *__error();
    int v32 = sub_10000354C();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint32_t v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Unable to save tailspin for reset: tailspin currently disabled", v78, 2u);
    }

    *__error() = v31;
  }
LABEL_56:
}

void sub_1000067B4(id a1, OS_xpc_object *a2)
{
  connection = a2;
  if (xpc_get_type(connection) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_cancel(connection);
    int v2 = connection;
  }
  else
  {
    int v2 = connection;
    if (connection == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      fwrite("tailspind is not intended to be run manually", 0x2CuLL, 1uLL, __stderrp);
      exit(1);
    }
  }
}

void sub_100006844(id a1, OS_xpc_object *a2)
{
  int v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    int v3 = (char *)malloc_type_calloc(1uLL, 0x40uLL, 0x1000040FA0F61DDuLL);
    pid_t pid = xpc_connection_get_pid(v2);
    proc_name(pid, v3, 0x20u);
    int v5 = *__error();
    uint64_t v6 = sub_10000354C();
    uint64_t v7 = v6;
    if ((pid - 1) <= 0xFFFFFFFD && os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 136446466;
      int v28 = v3;
      __int16 v29 = 1024;
      pid_t v30 = pid;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, pid, "NewClientConnection", "New connection for client %{public}s [%d]", buf, 0x12u);
    }

    *__error() = v5;
    int responsible_pid_and_name = get_responsible_pid_and_name();
    uint64_t v9 = (void *)xpc_connection_copy_entitlement_value();
    dispatch_source_t v10 = v9;
    BOOL v11 = v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v10);
    int v12 = (void *)xpc_connection_copy_entitlement_value();

    BOOL v13 = v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v12);
    xpc_connection_set_context(v2, v3);
    xpc_connection_set_finalizer_f(v2, (xpc_finalizer_t)&_free);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100006B6C;
    handler[3] = &unk_100010810;
    int v23 = responsible_pid_and_name;
    pid_t v24 = pid;
    uint64_t v21 = v3 + 32;
    unsigned __int8 v22 = v3;
    BOOL v25 = v11;
    BOOL v26 = v13;
    uint64_t v20 = v2;
    uint64_t v14 = v2;
    xpc_connection_set_event_handler(v14, handler);
    xpc_connection_set_target_queue(v14, (dispatch_queue_t)qword_100016AA0);
    xpc_connection_resume(v14);
  }
  else
  {
    xpc_type_t type = xpc_get_type(v2);
    int v16 = *__error();
    uint64_t v17 = sub_10000354C();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (v18) {
        sub_10000AD4C(v2);
      }

      *__error() = v16;
      _os_crash();
      __break(1u);
    }
    if (v18) {
      sub_10000ADD0(v2);
    }

    *__error() = v16;
    _os_crash();
    __break(1u);
  }
}

void sub_100006B6C()
{
  uint64_t v0 = __chkstk_darwin();
  id v2 = v1;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_type_t type = xpc_get_type(v2);
    int v4 = *(_DWORD *)(v0 + 60);
    int v5 = *(_DWORD *)(v0 + 56);
    int v6 = *__error();
    uint64_t v7 = sub_10000354C();
    uint64_t v8 = v7;
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      if (v5 == v4)
      {
        if (v9) {
          sub_10000B194();
        }
      }
      else if (v9)
      {
        uint64_t v27 = *(void *)(v0 + 40);
        uint64_t v28 = *(void *)(v0 + 48);
        int v29 = *(_DWORD *)(v0 + 56);
        int v30 = *(_DWORD *)(v0 + 60);
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v29;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = v28;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "client %{public}s [%d] (via %{public}s [%d]) received unknown request type", buf, 0x22u);
      }
      goto LABEL_24;
    }
    BOOL v21 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v5 == v4)
    {
      if (v21)
      {
        uint64_t v22 = *(void *)(v0 + 48);
        int v23 = *(_DWORD *)(v0 + 60);
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v23;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = xpc_dictionary_get_string(v2, _xpc_error_key_description);
        pid_t v24 = "client %{public}s [%d] received error %{public}s";
        BOOL v25 = v8;
        uint32_t v26 = 28;
LABEL_90:
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
      }
    }
    else if (v21)
    {
      uint64_t v105 = *(void *)(v0 + 40);
      uint64_t v106 = *(void *)(v0 + 48);
      int v107 = *(_DWORD *)(v0 + 56);
      int v108 = *(_DWORD *)(v0 + 60);
      *(_DWORD *)buf = 136447234;
      *(void *)&uint8_t buf[4] = v105;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v107;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v106;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v108;
      *(_WORD *)&buf[34] = 2082;
      *(void *)&buf[36] = xpc_dictionary_get_string(v2, _xpc_error_key_description);
      pid_t v24 = "client %{public}s [%d] (via %{public}s [%d]) received error %{public}s";
      BOOL v25 = v8;
      uint32_t v26 = 44;
      goto LABEL_90;
    }
LABEL_24:

    *__error() = v6;
    xpc_connection_cancel(*(xpc_connection_t *)(v0 + 32));
    goto LABEL_25;
  }
  int uint64 = xpc_dictionary_get_uint64(v2, "tailspin_request_type");
  if (uint64 < 0)
  {
    if (uint64 == -559035649)
    {
      int v53 = *__error();
      id v54 = sub_10000354C();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "tailspin has been poked!", buf, 2u);
      }

      *__error() = v53;
    }
    else if (uint64 == -559035648)
    {
      int v31 = *__error();
      int v32 = sub_10000354C();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "tailspin has been asked to resolve ondisk, profile and tasking configs", buf, 2u);
      }

      *__error() = v31;
      sub_100003B3C();
    }
    goto LABEL_25;
  }
  if (!uint64)
  {
    int v33 = *(_DWORD *)(v0 + 60);
    int v34 = *(_DWORD *)(v0 + 56);
    int v35 = *__error();
    unsigned __int8 v36 = sub_10000354C();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (v34 == v33)
    {
      if (v37)
      {
        uint64_t v38 = *(void *)(v0 + 48);
        int v39 = *(_DWORD *)(v0 + 60);
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v39;
        uint64_t v40 = "client %{public}s [%d] is setting tailspin config (TAILSPIN_APPLY_CONFIG)";
        uint64_t v41 = v36;
        uint32_t v42 = 18;
LABEL_51:
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
      }
    }
    else if (v37)
    {
      uint64_t v77 = *(void *)(v0 + 40);
      uint64_t v78 = *(void *)(v0 + 48);
      int v79 = *(_DWORD *)(v0 + 56);
      int v80 = *(_DWORD *)(v0 + 60);
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = v77;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v79;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v78;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v80;
      uint64_t v40 = "client %{public}s [%d] (via %{public}s [%d]) is setting tailspin config (TAILSPIN_APPLY_CONFIG)";
      uint64_t v41 = v36;
      uint32_t v42 = 34;
      goto LABEL_51;
    }

    *__error() = v35;
    if (*(unsigned char *)(v0 + 65))
    {
      id v61 = v2;
      *(void *)buf = 0;
      data = (void *)xpc_dictionary_get_data(v61, "tailspin_config", (size_t *)buf);
      if (*(void *)buf == 8472)
      {
        int v82 = data;
        int v83 = *((_DWORD *)data + 2);
        if ((v83 | 2) != 2) {
          sub_10000B0D0();
        }
        switch(dword_1000144E0)
        {
          case 0:
            if (v83) {
              goto LABEL_97;
            }
            goto LABEL_101;
          case 1:
            if (v83) {
              goto LABEL_97;
            }
            int v109 = *__error();
            int v110 = sub_10000354C();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
              sub_10000B160();
            }
            goto LABEL_106;
          case 2:
            if (!v83)
            {
              uint64_t tailspin_tasking_config = (const void *)get_tailspin_tasking_config();
              if (tailspin_tasking_config)
              {
                memcpy(v82, tailspin_tasking_config, 0x2118uLL);
                tailspin_config_free();
              }
            }
            goto LABEL_97;
          case 3:
            int v109 = *__error();
            int v110 = sub_10000354C();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
              sub_10000B12C();
            }
            goto LABEL_106;
          default:
LABEL_97:
            sub_100003C28((uint64_t)v82);
            if (sub_1000050C8())
            {
              sub_1000053AC();
              int v112 = *__error();
              int v113 = sub_10000354C();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v166 = 0;
                _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "tailspin state enacted", v166, 2u);
              }

              *__error() = v112;
              sub_100004F7C();
LABEL_101:
              BOOL v96 = 1;
            }
            else
            {
              int v109 = *__error();
              int v110 = sub_10000354C();
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
                sub_10000B0F8();
              }
LABEL_106:

              int v114 = __error();
              BOOL v96 = 0;
              *int v114 = v109;
            }
            break;
        }
      }
      else
      {
        BOOL v96 = 0;
      }
      sub_100008020(v61, v96);
      goto LABEL_108;
    }
    int v94 = *__error();
    uint64_t v95 = sub_10000354C();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
      sub_10000B068();
    }

    *__error() = v94;
    sub_100008020(v2, 0);
    goto LABEL_25;
  }
  if (uint64 == 1)
  {
    int v43 = *(_DWORD *)(v0 + 56);
    int v44 = *(_DWORD *)(v0 + 60);
    int v45 = *__error();
    uint64_t v46 = sub_10000354C();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
    if (v43 == v44)
    {
      if (!v47) {
        goto LABEL_61;
      }
      uint64_t v48 = *(void *)(v0 + 48);
      int v49 = *(_DWORD *)(v0 + 60);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v49;
      int v50 = "client %{public}s [%d] asked for tailspin config (TAILSPIN_GET_CONFIG)";
      v51 = v46;
      uint32_t v52 = 18;
    }
    else
    {
      if (!v47) {
        goto LABEL_61;
      }
      uint64_t v84 = *(void *)(v0 + 40);
      uint64_t v85 = *(void *)(v0 + 48);
      int v86 = *(_DWORD *)(v0 + 56);
      int v87 = *(_DWORD *)(v0 + 60);
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = v84;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v86;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v85;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v87;
      int v50 = "client %{public}s [%d] (via %{public}s [%d]) asked for tailspin config (TAILSPIN_GET_CONFIG)";
      v51 = v46;
      uint32_t v52 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);
LABEL_61:

    *__error() = v45;
    id v61 = v2;
    memcpy(buf, &qword_1000144D8, 0x2118uLL);
    if (is_apple_internal_setting() && ktrace_config_create_current())
    {
      owner_pid_t pid = ktrace_config_get_owner_pid();
      if (ktrace_config_get_owner_kind() == 2 && owner_pid == getpid()) {
        sub_100003680();
      }
      ktrace_config_destroy();
    }
    reply = (TSPSaveMeasurements *)xpc_dictionary_create_reply(v61);
    if (!reply) {
      sub_10000A16C();
    }
    int v62 = reply;
    xpc_dictionary_set_BOOL(reply, "tailspin_succeeded", 1);
    xpc_dictionary_set_data(v62, "tailspin_config", buf, 0x2118uLL);
    xpc_dictionary_get_remote_connection(v61);
    uint64_t v90 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (!v90) {
      sub_10000A16C();
    }
    v91 = v90;
    xpc_connection_send_message(v90, v62);

    goto LABEL_88;
  }
  if (uint64 != 2) {
    goto LABEL_25;
  }
  int v11 = *(_DWORD *)(v0 + 60);
  int v12 = *(_DWORD *)(v0 + 56);
  int v13 = *__error();
  uint64_t v14 = sub_10000354C();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12 == v11)
  {
    if (v15)
    {
      uint64_t v16 = *(void *)(v0 + 48);
      int v17 = *(_DWORD *)(v0 + 60);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v17;
      BOOL v18 = "client %{public}s [%d] asked for tailspin output (TAILSPIN_DUMP_OUTPUT)";
      int v19 = v14;
      uint32_t v20 = 18;
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else if (v15)
  {
    uint64_t v55 = *(void *)(v0 + 40);
    uint64_t v56 = *(void *)(v0 + 48);
    int v57 = *(_DWORD *)(v0 + 56);
    int v58 = *(_DWORD *)(v0 + 60);
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = v55;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v57;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = v56;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v58;
    BOOL v18 = "client %{public}s [%d] (via %{public}s [%d]) asked for tailspin output (TAILSPIN_DUMP_OUTPUT)";
    int v19 = v14;
    uint32_t v20 = 34;
    goto LABEL_37;
  }

  *__error() = v13;
  sub_100009DF0(*(void *)(v0 + 40));
  if (*(unsigned char *)(v0 + 64))
  {
    uint64_t v59 = *(void *)(v0 + 40);
    uint64_t v60 = *(unsigned int *)(v0 + 60);
    id v61 = v2;
    int v62 = objc_alloc_init(TSPSaveMeasurements);
    [(TSPSaveMeasurements *)v62 startRecordingTimeForDumpRequestPhase:v59 pid:v60];
    if (byte_100016580)
    {
      uint64_t v63 = xpc_dictionary_dup_fd(v61, "tailspin_dump_fd");
      uint64_t v64 = v63;
      if ((v63 & 0x80000000) != 0)
      {
        int v99 = *__error();
        v100 = sub_10000354C();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = v59;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v60;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v64;
          _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "Unable to save tailspin for %{public}s [%d]: bad file descriptor %d", buf, 0x18u);
        }

        *__error() = v99;
        id v101 = [[objc_alloc((Class)NSString) initWithFormat:@"Bad file descriptor %d", v64];
        [(TSPSaveMeasurements *)v62 stopRecordingTimeForDumpRequestPhase:v101];

        unsigned __int8 v74 = v61;
        uint64_t v75 = 6;
      }
      else
      {
        if (fcntl(v63, 3) == 2)
        {
          off_t v65 = sub_100008D88(v64);
          if (v65 >= 1)
          {
            off_t v66 = v65;
            *(void *)v166 = 0;
            int v164 = sub_100008DE8(v64, (uint64_t *)v166);
            int v67 = *__error();
            v68 = sub_10000354C();
            BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_FAULT);
            id v70 = *(char **)v166;
            if (v69)
            {
              v145 = "<unknown>";
              if (v164 != -1) {
                v145 = *(const char **)v166;
              }
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&uint8_t buf[4] = v64;
              *(_WORD *)&uint8_t buf[8] = 2082;
              *(void *)&buf[10] = v59;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v60;
              *(_WORD *)&buf[24] = 2048;
              *(void *)&buf[26] = v66;
              *(_WORD *)&buf[34] = 2080;
              *(void *)&buf[36] = v145;
              _os_log_fault_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_FAULT, "Detected fd %d from %{public}s [%d] with non-zero file size %lld! Path: %s", buf, 0x2Cu);
            }

            *__error() = v67;
            id v71 = objc_alloc((Class)NSString);
            int v72 = "<unknown>";
            if (v164 != -1) {
              int v72 = v70;
            }
            id v73 = [v71 initWithFormat:@"Detected fd %d from %s [%d] with non-zero file size %lld! Path: %s", v64, v59, v60, v66, v72];
            [(TSPSaveMeasurements *)v62 stopRecordingTimeForDumpRequestPhase:v73];

            [(TSPSaveMeasurements *)v62 setFileSizeBytes:v66];
            if (v70) {
              free(v70);
            }
            unsigned __int8 v74 = v61;
            uint64_t v75 = 25;
            NSFileAttributeKey v76 = v62;
            goto LABEL_87;
          }
          uint64_t v162 = xpc_dictionary_get_uint64(v61, "tailspin_dump_request_timestamp");
          int v115 = +[NSMutableDictionary dictionary];
          [v115 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
          [v115 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
          [v115 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
          [v115 setObject:&__kCFBooleanFalse forKeyedSubscript:UnsafePointer];
          [v115 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
          [v115 setObject:&__kCFBooleanTrue forKeyedSubscript:UnsafePointer];
          id v116 = [v115 copy];
          size_t length = 0;
          v117 = xpc_dictionary_get_data(v61, "tailspin_dump_options", &length);
          v163 = v115;
          if (v117)
          {
            uint64_t v118 = +[NSData dataWithBytes:v117 length:length];
            if (!v118)
            {
              int v138 = *__error();
              v139 = sub_10000354C();
              if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
                sub_10000B000();
              }

              *__error() = v138;
              [(TSPSaveMeasurements *)v62 stopRecordingTimeForDumpRequestPhase:@"Can't parse client dump output options"];
              sub_100007F3C(v61, 8, 0);
              goto LABEL_143;
            }
            int v119 = (void *)v118;
            v165 = v116;
            id v173 = 0;
            id v116 = +[NSPropertyListSerialization propertyListWithData:v118 options:0 format:0 error:&v173];
            id v120 = v173;
            if (!v116)
            {
              int v140 = *__error();
              v141 = sub_10000354C();
              if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
              {
                id v157 = [v120 description];
                id v158 = [v157 UTF8String];
                *(_DWORD *)buf = 136446722;
                *(void *)&uint8_t buf[4] = v59;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v60;
                *(_WORD *)&buf[18] = 2080;
                *(void *)&buf[20] = v158;
                _os_log_error_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "Unable to save tailspin for %{public}s [%d]: Failed to deserialize dump options due to %s", buf, 0x1Cu);
              }
              *__error() = v140;
              id v142 = objc_alloc((Class)NSString);
              v143 = [v120 description];
              id v144 = [v142 initWithFormat:@"Failed to deserialize dump options due to %@", v143];
              [(TSPSaveMeasurements *)v62 stopRecordingTimeForDumpRequestPhase:v144];

              sub_100007F3C(v61, 9, 0);
              goto LABEL_142;
            }
          }
          id v121 = v116;
          uint64_t v122 = mach_absolute_time();
          uint64_t v160 = qword_100016610;
          double v125 = sub_1000092AC(v122 - qword_100016610, v123, v124);
          v126 = [v121 objectForKeyedSubscript:UnsafePointer];

          double v127 = 0.5;
          v165 = v121;
          if (v126)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v126 doubleValue];
              if (v128 >= 0.0)
              {
                double v127 = v128;
              }
              else
              {
                int v129 = *__error();
                v130 = sub_10000354C();
                if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
                  sub_10000AF80(v130, v131, v132, v133, v134, v135, v136, v137);
                }

                *__error() = v129;
              }
            }
          }
          sub_100009E18((uint64_t)asc_100016618, v59);
          int v146 = *__error();
          v147 = sub_10000354C();
          if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218752;
            *(double *)&uint8_t buf[4] = v125;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v122;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v160;
            *(_WORD *)&buf[32] = 2048;
            *(double *)&buf[34] = v127;
            _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "Duration since trace buffer start: %0.3fs (%llu - %llu), minimum acceptable duration: %.3f", buf, 0x2Au);
          }

          *__error() = v146;
          if (v127 == 0.0)
          {
            int v148 = *__error();
            v149 = sub_10000354C();
            if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_DEFAULT, "Not enforcing minimum acceptable duration since trace buffer start because of client override", buf, 2u);
            }

            *__error() = v148;
            goto LABEL_136;
          }

          if (v125 >= v127)
          {
LABEL_136:
            v150 = +[NSString stringWithUTF8String:v59];
            dispatch_time_t when = dispatch_time(0, 90000000000);
            v151 = qword_100016AA8;
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&uint8_t buf[8] = 3221225472;
            *(void *)&buf[16] = sub_100008F28;
            *(void *)&buf[24] = &unk_1000108E8;
            v152 = v62;
            *(void *)&buf[32] = v152;
            *(void *)&buf[40] = v150;
            *(_DWORD *)&buf[64] = v60;
            *(_DWORD *)&buf[68] = v64;
            *(void *)&buf[56] = v59;
            id v153 = v61;
            *(void *)&buf[48] = v153;
            id v161 = v150;
            dispatch_after(when, v151, buf);
            atomic_store([(TSPSaveMeasurements *)v152 request_id], &dword_100016AC4);
            if (v162) {
              [(TSPSaveMeasurements *)v152 recordRequestProcessingLatencySecsWithStartMCT:v162 endMCT:mach_continuous_time()];
            }
            v154 = tailspin_make_ondisk_config();
            *(void *)v166 = _NSConcreteStackBlock;
            uint64_t v167 = 3221225472;
            v168 = sub_1000091A0;
            v169 = &unk_100010910;
            uint64_t v172 = v59;
            v170 = v152;
            id v171 = v153;
            id v116 = v165;
            tailspin_save_trace_with_standard_chunks();

            goto LABEL_143;
          }
          int v155 = *__error();
          v156 = sub_10000354C();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR)) {
            sub_10000AF18();
          }

          *__error() = v155;
          [(TSPSaveMeasurements *)v62 stopRecordingTimeForDumpRequestPhase:@"Resulting trace would be shorter than desired duration"];
          sub_100007F3C(v61, 10, 0);
LABEL_142:
          id v116 = v165;
LABEL_143:

          goto LABEL_88;
        }
        int v102 = *__error();
        v103 = sub_10000354C();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = v59;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v60;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v64;
          _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "Unable to save tailspin for %{public}s [%d]: file descriptor is not read-write %d", buf, 0x18u);
        }

        *__error() = v102;
        id v104 = [objc_alloc((Class)NSString) initWithFormat:@"File descriptor is not read-write %d", v64];
        [(TSPSaveMeasurements *)v62 stopRecordingTimeForDumpRequestPhase:v104];

        unsigned __int8 v74 = v61;
        uint64_t v75 = 7;
      }
    }
    else
    {
      int v97 = *__error();
      uint32_t v98 = sub_10000354C();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        sub_10000AEB0();
      }

      *__error() = v97;
      [(TSPSaveMeasurements *)v62 stopRecordingTimeForDumpRequestPhase:@"tailspin is disabled"];
      unsigned __int8 v74 = v61;
      uint64_t v75 = 2;
    }
    NSFileAttributeKey v76 = 0;
LABEL_87:
    sub_100007F3C(v74, v75, v76);
LABEL_88:

LABEL_108:
    goto LABEL_25;
  }
  int v92 = *__error();
  uint64_t v93 = sub_10000354C();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
    sub_10000AE48();
  }

  *__error() = v92;
  sub_100007F3C(v2, 3, 0);
LABEL_25:
}

void sub_100007F3C(void *a1, uint64_t a2, void *a3)
{
  xpc_object_t xdict = a1;
  id v5 = a3;
  xpc_dictionary_get_remote_connection(xdict);
  int v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    sub_10000A16C();
  }
  uint64_t v7 = v6;
  context = xpc_connection_get_context(v6);
  sub_100009E00((uint64_t)context + 32, a2, v5);
  sub_100008020(xdict, a2 == 0);
  if ((a2 - 25) <= 1)
  {
    int v9 = *__error();
    dispatch_source_t v10 = sub_10000354C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000B1FC();
    }

    *__error() = v9;
    exit(-1);
  }
}

void sub_100008020(void *a1, BOOL a2)
{
  xpc_object_t xdict = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (!reply) {
    sub_10000A16C();
  }
  int v4 = reply;
  xpc_dictionary_set_BOOL(reply, "tailspin_succeeded", a2);
  xpc_dictionary_get_remote_connection(xdict);
  id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    sub_10000A16C();
  }
  int v6 = v5;
  xpc_connection_send_message(v5, v4);
}

void sub_1000080AC(id a1)
{
  int v1 = *__error();
  id v2 = sub_10000354C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "server has been SIGTERMed", v3, 2u);
  }

  *__error() = v1;
  sub_100005A84((uint64_t)"exiting for SIGTERM");
  exit(0);
}

void sub_100008128(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    int v3 = *__error();
    int v4 = sub_10000354C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "com.apple.tailspin.cleanup invoked", buf, 2u);
    }

    *__error() = v3;
    id v5 = sub_100008230();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008284;
    block[3] = &unk_100010878;
    uint64_t v7 = v2;
    dispatch_sync(v5, block);
  }
}

id sub_100008230()
{
  if (qword_100016AD8 != -1) {
    dispatch_once(&qword_100016AD8, &stru_100010950);
  }
  uint64_t v0 = (void *)qword_100016AE0;

  return v0;
}

void sub_100008284(uint64_t a1)
{
  if (!xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    sub_1000082C0(0);
  }
}

void sub_1000082C0(int a1)
{
  int v2 = *__error();
  int v3 = sub_10000354C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Trying tailspin_server_cleanup_force_reset_tailspins()", buf, 2u);
  }

  *__error() = v2;
  int v4 = sub_100008230();
  dispatch_assert_queue_V2(v4);

  id v5 = +[NSFileManager defaultManager];
  id v83 = 0;
  int v6 = [v5 contentsOfDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" error:&v83];
  id v7 = v83;
  uint64_t v8 = v7;
  if (!v6 || v7)
  {
    int v58 = *__error();
    uint64_t v59 = sub_10000354C();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_10000B230((uint64_t)v8, v59, v60, v61, v62, v63, v64, v65);
    }

    *__error() = v58;
  }
  else
  {
    id v70 = v5;
    int v67 = v1;
    int v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    off_t v66 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v79 objects:v89 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v80;
      do
      {
        for (unsigned int i = 0; i != v12; unsigned int i = (char *)i + 1)
        {
          if (*(void *)v80 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          uint64_t v16 = [v15 pathExtension];
          unsigned __int8 v17 = [v16 isEqualToString:@"tailspin"];

          if (v17)
          {
            BOOL v18 = [@"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins" stringByAppendingPathComponent:v15];
            [v9 addObject:v18];
          }
          else
          {
            int v19 = *__error();
            uint32_t v20 = sub_10000354C();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v85 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "WARNING: Some file that is not a tailspin is in our folder. We will not delete this: %@", buf, 0xCu);
            }

            *__error() = v19;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v79 objects:v89 count:16];
      }
      while (v12);
    }

    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000093B4;
    v78[3] = &unk_100010978;
    v78[4] = v5;
    [v9 sortUsingComparator:v78];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obint j = v9;
    id v21 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v21)
    {
      id v22 = v21;
      char v23 = 0;
      unint64_t v69 = 0;
      int v24 = 0;
      uint64_t v25 = *(void *)v75;
      do
      {
        uint32_t v26 = 0;
        do
        {
          if (*(void *)v75 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v26);
          if (v24 >= 3)
          {
            int v28 = *__error();
            int v29 = sub_10000354C();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v85 = v27;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max number of tailspins", buf, 0xCu);
            }

            *__error() = v28;
            goto LABEL_44;
          }
          if (v23)
          {
            int v30 = *__error();
            int v31 = sub_10000354C();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v85 = v27;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max age of tailspins", buf, 0xCu);
            }

            *__error() = v30;
            char v23 = 1;
            goto LABEL_44;
          }
          id v73 = 0;
          int v32 = [v5 attributesOfItemAtPath:v27 error:&v73];
          id v33 = v73;
          int v34 = v33;
          if (v32) {
            BOOL v35 = v33 == 0;
          }
          else {
            BOOL v35 = 0;
          }
          if (!v35)
          {
            int v36 = *__error();
            BOOL v37 = sub_10000354C();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = v27;
            __int16 v86 = 2114;
            int v87 = v34;
            id v54 = v37;
            uint64_t v55 = "Unable to get attributes of %{public}@ : %{public}@";
            uint32_t v56 = 22;
LABEL_73:
            _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v55, buf, v56);
LABEL_35:

LABEL_36:
            char v23 = 0;
            *__error() = v36;
LABEL_43:

            id v5 = v70;
LABEL_44:
            id v72 = 0;
            unsigned int v42 = [v5 removeItemAtPath:v27 error:&v72];
            id v43 = v72;
            int v44 = v43;
            if (v42) {
              BOOL v45 = v43 == 0;
            }
            else {
              BOOL v45 = 0;
            }
            if (!v45)
            {
              int v46 = *__error();
              BOOL v47 = sub_10000354C();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v85 = v27;
                __int16 v86 = 2114;
                int v87 = v44;
                _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Unable to remove %{public}@ : %{public}@", buf, 0x16u);
              }

              *__error() = v46;
            }

            goto LABEL_52;
          }
          uint64_t v38 = [v32 fileCreationDate];
          if (!v38)
          {
            uint64_t v38 = [v32 fileModificationDate];
            if (!v38)
            {
              int v36 = *__error();
              BOOL v37 = sub_10000354C();
              if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                goto LABEL_35;
              }
              *(_DWORD *)buf = 138543362;
              uint64_t v85 = v27;
              id v54 = v37;
              uint64_t v55 = "Unable to get file date for %{public}@";
LABEL_68:
              uint32_t v56 = 12;
              goto LABEL_73;
            }
          }
          [v38 timeIntervalSinceNow];
          if (v39 < -2592000.0)
          {
            int v40 = *__error();
            uint64_t v41 = sub_10000354C();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v85 = v27;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max age of tailspins", buf, 0xCu);
            }

            *__error() = v40;
            char v23 = 1;
            goto LABEL_43;
          }

          id v48 = [v32 fileSize];
          if (!v48)
          {
            int v36 = *__error();
            BOOL v37 = sub_10000354C();
            if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v85 = v27;
            id v54 = v37;
            uint64_t v55 = "Unable to get file size for %{public}@";
            goto LABEL_68;
          }
          id v49 = v48;
          v69 += (unint64_t)v48;
          if (v69 >= 0xAF00001)
          {
            int v36 = *__error();
            int v50 = sub_10000354C();
            v51 = v50;
            if (!a1 || v24 >= 1)
            {
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v85 = v27;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Removing %{public}@ due to exceeding max size of tailspins", buf, 0xCu);
              }

              goto LABEL_36;
            }
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v85 = v27;
              __int16 v86 = 2048;
              int v87 = v49;
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Not removing most recent tailspin %{public}@ that exceeds max size: %llu", buf, 0x16u);
            }

            *__error() = v36;
          }

          int v52 = *__error();
          int v53 = sub_10000354C();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v85 = v27;
            _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Not removing %{public}@", buf, 0xCu);
          }

          char v23 = 0;
          *__error() = v52;
          ++v24;
          id v5 = v70;
LABEL_52:
          uint32_t v26 = (char *)v26 + 1;
        }
        while (v22 != v26);
        id v57 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
        id v22 = v57;
      }
      while (v57);
    }

    int v6 = v66;
    int v1 = v67;
    uint64_t v8 = 0;
  }
}

void sub_100008BD8(id a1)
{
}

void sub_100008BF8(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = *__error();
    int v4 = sub_10000354C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000B2B0(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    fcntl(*(_DWORD *)(a1 + 48), 51);
    int v3 = *__error();
    int v4 = sub_10000354C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saved tailspin output for reset to file '%{public}@'", buf, 0xCu);
    }
  }

  *__error() = v3;
  id v12 = (void *)os_transaction_create();
  uint64_t v13 = sub_100008230();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008D80;
  block[3] = &unk_100010878;
  id v16 = v12;
  id v14 = v12;
  dispatch_async(v13, block);
}

void sub_100008D80()
{
}

off_t sub_100008D88(int a1)
{
  off_t v2 = lseek(a1, 0, 1);
  off_t v3 = lseek(a1, 0, 2);
  lseek(a1, v2, 0);
  return v3;
}

uint64_t sub_100008DE8(int a1, uint64_t *a2)
{
  int v4 = malloc_type_calloc(1uLL, 0x400uLL, 0x75783066uLL);
  *a2 = (uint64_t)v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = fcntl(a1, 50, v4);
  int v6 = *__error();
  uint64_t v7 = sub_10000354C();
  uint64_t v8 = v7;
  if (v5 == -1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B320();
    }
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *a2;
    *(_DWORD *)buf = 67109378;
    int v12 = a1;
    __int16 v13 = 2080;
    uint64_t v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received request for fd %d, path: %s", buf, 0x12u);
  }

  *__error() = v6;
  return v5;
}

int *sub_100008F28(uint64_t a1)
{
  signed int v2 = atomic_load(&dword_100016AC4);
  int v3 = v2;
  if (v2 != -1 && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "request_id") >= v2)
  {
    char v23 = 0;
    int v7 = sub_100008DE8(*(_DWORD *)(a1 + 68), (uint64_t *)&v23);
    off_t v8 = sub_100008D88(*(_DWORD *)(a1 + 68));
    int v9 = *__error();
    uint64_t v10 = sub_10000354C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 64);
      id v13 = [*(id *)(a1 + 32) request_id];
      uint64_t v14 = (uint64_t)v23;
      if (v7 == -1) {
        BOOL v15 = "<unknown>";
      }
      else {
        BOOL v15 = v23;
      }
      *(_DWORD *)buf = 136447490;
      uint64_t v25 = v11;
      __int16 v26 = 1024;
      int v27 = v12;
      __int16 v28 = 2048;
      id v29 = v13;
      __int16 v30 = 1024;
      int v31 = 90;
      __int16 v32 = 2048;
      off_t v33 = v8;
      __int16 v34 = 2080;
      BOOL v35 = v15;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Save from %{public}s [%d] (request ID %llu) exceeded %ds timeout! Size: %lld, Path: %s", buf, 0x36u);
    }
    else
    {
      uint64_t v14 = (uint64_t)v23;
    }

    *__error() = v9;
    id v16 = *(void **)(a1 + 32);
    id v17 = objc_alloc((Class)NSString);
    id v18 = [*(id *)(a1 + 40) UTF8String];
    if (v7 == -1) {
      int v19 = "<unknown>";
    }
    else {
      int v19 = (const char *)v14;
    }
    id v20 = [v17 initWithFormat:@"Save from %s [%d] exceeded %ds timeout! Size: %lld, Path: %s", v18, *(unsigned int *)(a1 + 64), 90, v8, v19];
    [v16 stopRecordingTimeForDumpRequestPhase:v20];

    [*(id *)(a1 + 32) setFileSizeBytes:v8];
    sub_100007F3C(*(void **)(a1 + 48), 27, *(void **)(a1 + 32));
    int v21 = *__error();
    id v22 = sub_10000354C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10000B1FC();
    }

    *__error() = v21;
    exit(-1);
  }
  int v4 = *__error();
  uint64_t v5 = sub_10000354C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000B3A4(a1, v3, v5);
  }

  uint64_t result = __error();
  *uint64_t result = v4;
  return result;
}

void sub_1000091A0(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    size_t v9 = 8;
    uint64_t v10 = 0;
    int v4 = sysctlbyname("kern.kdbg.oldest_time", &v10, &v9, 0, 0);
    int v5 = *__error();
    int v6 = sub_10000354C();
    int v7 = v6;
    if (v4 < 0)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10000B480();
      }

      *__error() = v5;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_10000B4FC((uint64_t *)&v10, v7);
      }

      *__error() = v5;
      uint64_t v8 = v10;
      if (v10) {
        goto LABEL_11;
      }
    }
    uint64_t v8 = mach_absolute_time();
LABEL_11:
    sub_100005978(v8, *(const char **)(a1 + 48));
  }
  [*(id *)(a1 + 32) stopRecordingTimeForDumpRequestPhase:0];
  sub_100007F3C(*(void **)(a1 + 40), a2, *(void **)(a1 + 32));
  atomic_store(0xFFFFFFFF, &dword_100016AC4);
}

double sub_1000092AC(unint64_t a1, double a2, double a3)
{
  if (qword_100016AD0 != -1) {
    dispatch_once(&qword_100016AD0, &stru_100010930);
  }
  LODWORD(a3) = dword_100016AC8;
  return (double)*(unint64_t *)&a3
       / (double)(1000000000 * (unint64_t)dword_100016ACC)
       * (double)a1;
}

void sub_100009324(id a1)
{
  if (mach_timebase_info((mach_timebase_info_t)&dword_100016AC8)) {
    sub_10000A16C();
  }
}

void sub_10000934C(id a1)
{
  int v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)5u, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.tailspin.cleanup", v3);
  signed int v2 = (void *)qword_100016AE0;
  qword_100016AE0 = (uint64_t)v1;
}

id sub_1000093B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 32);
  id v30 = 0;
  uint64_t v8 = [v7 attributesOfItemAtPath:v5 error:&v30];
  id v9 = v30;
  uint64_t v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    BOOL v15 = [v8 objectForKeyedSubscript:NSFileCreationDate];
    if (v15)
    {
      id v16 = *(void **)(a1 + 32);
      id v29 = 0;
      id v17 = [v16 attributesOfItemAtPath:v6 error:&v29];
      id v18 = v29;
      int v19 = v18;
      if (!v17 || v18)
      {
        int v24 = *__error();
        uint64_t v25 = sub_10000354C();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10000B5B0();
        }

        id v14 = 0;
        *__error() = v24;
      }
      else
      {
        id v20 = [v17 objectForKeyedSubscript:NSFileCreationDate];
        int v21 = v20;
        if (v20)
        {
          id v14 = [v20 compare:v15];
        }
        else
        {
          int v26 = *__error();
          int v27 = sub_10000354C();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_10000B618();
          }

          id v14 = 0;
          *__error() = v26;
        }
      }
    }
    else
    {
      int v22 = *__error();
      char v23 = sub_10000354C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10000B618();
      }

      id v14 = 0;
      *__error() = v22;
    }
  }
  else
  {
    int v12 = *__error();
    id v13 = sub_10000354C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000B5B0();
    }

    id v14 = 0;
    *__error() = v12;
  }

  return v14;
}

void sub_1000095FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100009618(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100009638(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009654(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100009680(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_1000096E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100009790(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000097A0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000097C0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

void sub_1000097E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100009800(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000982C(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:a2];
  }
  else
  {
    uint64_t v4 = @"Unknown";
  }
  id v6 = v4;
  uint64_t v5 = v4;
  AnalyticsSendEventLazy();
}

id sub_1000098EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"Execname";
  uint64_t v5 = v1;
  signed int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_100009970(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a1;
  id v7 = a4;
  if (a2)
  {
    uint64_t v8 = +[NSString stringWithUTF8String:a2];
  }
  else
  {
    uint64_t v8 = @"Unknown";
  }
  BOOL v11 = v7;
  id v9 = v7;
  uint64_t v10 = v8;
  AnalyticsSendEventLazy();
}

id sub_100009A64(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 32);
  v35[1] = @"SaveResultEnum";
  v36[0] = v2;
  v35[0] = @"ExecName";
  id v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v36[1] = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  uint64_t v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

  id v6 = *(void **)(v1 + 40);
  if (v6)
  {
    id v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 fileSizeBytes]);
    [v5 setObject:v7 forKeyedSubscript:@"FileSize"];

    [*(id *)(v1 + 40) tailspinDurationSecs];
    uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v8 forKeyedSubscript:@"TailspinDuration"];

    [*(id *)(v1 + 40) requestProcessingLatencySecs];
    if (v9 != -1.0)
    {
      [*(id *)(v1 + 40) requestProcessingLatencySecs];
      uint64_t v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v5 setObject:v10 forKeyedSubscript:@"RequestProcessingLatency"];
    }
    [*(id *)(v1 + 40) ratioTimePeriodCovered];
    if (v11 != -1.0)
    {
      [*(id *)(v1 + 40) ratioTimePeriodCovered];
      id v13 = +[NSNumber numberWithInt:(int)(v12 * 100.0)];
      [v5 setObject:v13 forKeyedSubscript:@"PercentageTimeCovered"];
    }
    [*(id *)(v1 + 40) lostTimePeriodAtStartSecs];
    if (v14 != -1.0)
    {
      [*(id *)(v1 + 40) lostTimePeriodAtStartSecs];
      BOOL v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v5 setObject:v15 forKeyedSubscript:@"LostTimePeriodAtStart"];
    }
    id v16 = [*(id *)(v1 + 40) timeSpentByPhases];

    if (v16)
    {
      id v17 = v5;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      obint j = [*(id *)(v1 + 40) timeSpentByPhases];
      id v18 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (unsigned int i = 0; i != v19; unsigned int i = (char *)i + 1)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            char v23 = +[NSString stringWithFormat:@"Duration_%@", v22];
            if (v23)
            {
              [*(id *)(v1 + 40) timeSpentByPhases];
              uint64_t v25 = v24 = v1;
              int v26 = [v25 objectForKeyedSubscript:v22];
              [v17 setObject:v26 forKeyedSubscript:v23];

              uint64_t v1 = v24;
            }
          }
          id v19 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v19);
      }

      uint64_t v5 = v17;
    }
  }
  id v27 = [v5 copy];

  return v27;
}

void sub_100009DF0(uint64_t a1)
{
}

void sub_100009E00(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_100009E18(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    id v3 = @"Unknown";
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    CFStringRef v4 = @"Unknown";
    goto LABEL_6;
  }
  id v3 = +[NSString stringWithUTF8String:a1];
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  CFStringRef v4 = +[NSString stringWithUTF8String:a2];
LABEL_6:
  id v7 = v3;
  uint64_t v8 = v4;
  uint64_t v5 = v4;
  id v6 = v3;
  AnalyticsSendEventLazy();
}

id sub_100009F20(uint64_t a1)
{
  v5[0] = @"TraceBufferStartEventName";
  v5[1] = @"SaveExecname";
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = v1;
  v5[2] = @"DurationSinceTraceBufferStartSec";
  uint64_t v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v6[2] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

void sub_100009FF0(uint64_t a1)
{
}

void sub_10000A000(uint64_t a1, uint64_t a2)
{
}

_DWORD *(*sub_10000A018(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 670) {
    return sub_10000A034;
  }
  else {
    return 0;
  }
}

_DWORD *sub_10000A034(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_100005024();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t sub_10000A090(_DWORD *a1, uint64_t a2)
{
  unsigned int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(void *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 670)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }
    else
    {
      *(_DWORD *)(a2 + 32) = sub_100005024();
    }
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_10000A140()
{
  __assert_rtn("-[TSPSaveMeasurements _stopRecordingTimeForPhase:]", "TSPSaveMeasurements.m", 226, "startTime != nil");
}

void sub_10000A16C()
{
}

void sub_10000A188(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009638((void *)&_mh_execute_header, a2, a3, "Current system config = \n%{public}s", a5, a6, a7, a8, 2u);
}

void sub_10000A1F8()
{
  __error();
  sub_100009820();
  sub_100009654((void *)&_mh_execute_header, v0, v1, "unable to get config typefilter: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10000A274()
{
  sub_1000096BC();
  sub_1000097C0((void *)&_mh_execute_header, v0, v1, "action %u's samplers = %llu != %u = tailspin_fss_samplers", v2, v3, v4);
}

void sub_10000A2E4()
{
  sub_1000096FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "timer %u's action id = %u != %u = tailspin_oncore_action_id", v1, 0x14u);
}

void sub_10000A364()
{
  sub_10000971C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "timer %u's period = %llu != %llu = tailspin_oncore_timer_period", v1, 0x1Cu);
}

void sub_10000A3E8()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "FSS timer LWP mode isn't enabled", v2, v3, v4, v5, v6);
}

void sub_10000A41C()
{
  sub_1000096BC();
  sub_1000097C0((void *)&_mh_execute_header, v0, v1, "action %u's samplers = %llu != %u = tailspin_fss_samplers", v2, v3, v4);
}

void sub_10000A48C()
{
  sub_1000096FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "timer %u's action id = %u != %u = tailspin_fss_action_id", v1, 0x14u);
}

void sub_10000A50C()
{
  sub_10000971C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "timer %u's period = %llu != %llu = tailspin_fss_timer_period", v1, 0x1Cu);
}

void sub_10000A590()
{
  sub_100009784();
  sub_100009680((void *)&_mh_execute_header, v0, v1, "tailspin_typefilter contains %#x but system typefilter doesn't", v2);
}

void sub_10000A5FC()
{
  sub_1000096B0();
  sub_1000096E0((void *)&_mh_execute_header, v0, v1, "actual_buf_size = %llu != %zu = tailspin_buf_size", v2, v3, v4, v5, v6);
}

void sub_10000A678()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "Unable to enact state", v2, v3, v4, v5, v6);
}

void sub_10000A6AC()
{
  sub_1000096B0();
  sub_1000096E0((void *)&_mh_execute_header, v0, v1, "Unable to write config property list %@ to '%{public}s'", v2, v3, v4, v5, v6);
}

void sub_10000A728()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "Unable to enact kdbg state after ktrace bg notification!", v2, v3, v4, v5, v6);
}

void sub_10000A75C()
{
  sub_100009674();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Received a ktrace background notification", v1, 2u);
}

void sub_10000A79C()
{
  __error();
  sub_100009820();
  sub_100009654((void *)&_mh_execute_header, v0, v1, "Unable to reset existing ktrace: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10000A818()
{
  sub_100009784();
  sub_100009680((void *)&_mh_execute_header, v0, v1, "Unable to configure ktrace, failure with ret %{errno}d", v2);
}

void sub_10000A884()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000976C();
  sub_1000097E0((void *)&_mh_execute_header, v1, v2, "Failed to configure kperf sampling (line %u): %s", v3, v4, v5, v6, v7);
}

void sub_10000A908()
{
  __error();
  sub_100009820();
  sub_100009654((void *)&_mh_execute_header, v0, v1, "sysctl(KERN_KDREMOVE) failed: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10000A984(int a1, NSObject *a2)
{
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "sysctlbyname(ktrace.init_background): ret %d, %d errno", (uint8_t *)v5, 0xEu);
}

void sub_10000AA24()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "Unable check as background tool", v2, v3, v4, v5, v6);
}

void sub_10000AA58()
{
  sub_100009784();
  sub_100009680((void *)&_mh_execute_header, v0, v1, "Unable check in with bootstrap port (%#x)", v2);
}

void sub_10000AAC4()
{
  sub_100009784();
  sub_100009680((void *)&_mh_execute_header, v0, v1, "Unable to get the bootstrap port (%#x)", v2);
}

void sub_10000AB30(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AB64()
{
  sub_100009784();
  sub_100009680((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for reset: bad file descriptor %{public}d", v2);
}

void sub_10000ABD0()
{
  sub_1000096B0();
  sub_100009638((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for reset: error creating directory: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000AC38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000ACB0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543874;
  CFStringRef v3 = @"/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins";
  __int16 v4 = 2114;
  CFStringRef v5 = @"mobile";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to update owner for directory at %{public}@ to %{public}@: %{public}@", (uint8_t *)&v2, 0x20u);
}

void sub_10000AD4C(void *a1)
{
  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_1000096B0();
  sub_100009800((void *)&_mh_execute_header, v1, v2, "Server received %s", v3, v4, v5, v6, v7);
}

void sub_10000ADD0(void *a1)
{
  xpc_get_type(a1);
  sub_1000096B0();
  sub_100009800((void *)&_mh_execute_header, v1, v2, "main connection received unknown event of type %p", v3, v4, v5, v6, v7);
}

void sub_10000AE48()
{
  sub_100009790(__stack_chk_guard);
  sub_100009698();
  sub_100009618((void *)&_mh_execute_header, v0, v1, "client %s [%d] does not bear entitlement \"com.apple.tailspin.dump-output\"; refusing TAILSPIN_DUMP_OUTPUT command",
    v2,
    v3);
}

void sub_10000AEB0()
{
  sub_100009754();
  sub_100009618((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for %{public}s [%d]: tailspin currently disabled");
}

void sub_10000AF18()
{
  sub_1000096B0();
  sub_100009638((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for %{public}s: resulting trace would be shorter than desired duration", v2, v3, v4, v5, v6);
}

void sub_10000AF80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B000()
{
  sub_100009754();
  sub_100009618((void *)&_mh_execute_header, v0, v1, "Unable to save tailspin for %{public}s [%d]: Can't parse client dump output options");
}

void sub_10000B068()
{
  sub_100009790(__stack_chk_guard);
  sub_100009698();
  sub_100009618((void *)&_mh_execute_header, v0, v1, "client %s [%d] does not bear entitlement \"com.apple.tailspin.config-apply\"; refusing TAILSPIN_APPLY_CONFIG command",
    v2,
    v3);
}

void sub_10000B0D0()
{
}

void sub_10000B0F8()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "tailspin server state could not be enacted immediately", v2, v3, v4, v5, v6);
}

void sub_10000B12C()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "Received a request to apply a config when a profile is installed or when tasking is present - rejecting request", v2, v3, v4, v5, v6);
}

void sub_10000B160()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "Received a request to apply default config when tasking is currently enabled - rejecting request", v2, v3, v4, v5, v6);
}

void sub_10000B194()
{
  sub_100009790(__stack_chk_guard);
  sub_100009698();
  sub_100009618((void *)&_mh_execute_header, v0, v1, "client %{public}s [%d] received unknown request type");
}

void sub_10000B1FC()
{
  sub_100009674();
  sub_1000095FC((void *)&_mh_execute_header, v0, v1, "tailspind exiting to avoid bad state in 129116852", v2, v3, v4, v5, v6);
}

void sub_10000B230(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B2B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B320()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000976C();
  sub_1000097E0((void *)&_mh_execute_header, v1, v2, "Failed to get file path for fd %d: %{errno}s", v3, v4, v5, v6, v7);
}

void sub_10000B3A4(uint64_t a1, int a2, NSObject *a3)
{
  id v6 = [*(id *)(a1 + 40) UTF8String];
  int v7 = *(_DWORD *)(a1 + 64);
  id v8 = [*(id *)(a1 + 32) request_id];
  int v9 = 136446978;
  id v10 = v6;
  __int16 v11 = 1024;
  int v12 = v7;
  __int16 v13 = 2048;
  id v14 = v8;
  __int16 v15 = 1024;
  int v16 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "tailspin request for %{public}s [%d] (request ID: %llu) successfully completed before timeout (val = %d).", (uint8_t *)&v9, 0x22u);
}

void sub_10000B480()
{
  __error();
  sub_100009820();
  sub_100009654((void *)&_mh_execute_header, v0, v1, "Unable to get oldest kdebug time: %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10000B4FC(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = mach_absolute_time();
  double v8 = sub_1000092AC(v5 - *a1, v6, v7);
  int v9 = 134218240;
  uint64_t v10 = v4;
  __int16 v11 = 2048;
  double v12 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Successfully got oldest kdebug time (%llu, %.2fs ago)", (uint8_t *)&v9, 0x16u);
}

void sub_10000B5B0()
{
  sub_10000973C();
  sub_1000097A0((void *)&_mh_execute_header, v0, v1, "Error getting attrs of file: %{public}@ err: %{public}@");
}

void sub_10000B618()
{
  sub_1000096B0();
  sub_100009638((void *)&_mh_execute_header, v0, v1, "No creation date of file: %{public}@", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
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

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t get_responsible_pid_and_name()
{
  return _get_responsible_pid_and_name();
}

uint64_t get_tailspin_ondisk_config()
{
  return _get_tailspin_ondisk_config();
}

uint64_t get_tailspin_profile_config()
{
  return _get_tailspin_profile_config();
}

uint64_t get_tailspin_tasking_config()
{
  return _get_tailspin_tasking_config();
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t is_apple_internal_setting()
{
  return _is_apple_internal_setting();
}

uint64_t kperf_action_count_get()
{
  return _kperf_action_count_get();
}

uint64_t kperf_action_count_set()
{
  return _kperf_action_count_set();
}

uint64_t kperf_action_samplers_set()
{
  return _kperf_action_samplers_set();
}

uint64_t kperf_kdebug_action_set()
{
  return _kperf_kdebug_action_set();
}

uint64_t kperf_kdebug_filter_add_class_subclass_fn()
{
  return _kperf_kdebug_filter_add_class_subclass_fn();
}

uint64_t kperf_kdebug_filter_add_debugid()
{
  return _kperf_kdebug_filter_add_debugid();
}

uint64_t kperf_kdebug_filter_create()
{
  return _kperf_kdebug_filter_create();
}

uint64_t kperf_kdebug_filter_set()
{
  return _kperf_kdebug_filter_set();
}

uint64_t kperf_lazy_cpu_action_set()
{
  return _kperf_lazy_cpu_action_set();
}

uint64_t kperf_lazy_cpu_time_threshold_set()
{
  return _kperf_lazy_cpu_time_threshold_set();
}

uint64_t kperf_ns_to_ticks()
{
  return _kperf_ns_to_ticks();
}

uint64_t kperf_reset()
{
  return _kperf_reset();
}

uint64_t kperf_sample_off()
{
  return _kperf_sample_off();
}

uint64_t kperf_sample_on()
{
  return _kperf_sample_on();
}

uint64_t kperf_timer_action_set()
{
  return _kperf_timer_action_set();
}

uint64_t kperf_timer_count_get()
{
  return _kperf_timer_count_get();
}

uint64_t kperf_timer_count_set()
{
  return _kperf_timer_count_set();
}

uint64_t kperf_timer_period_set()
{
  return _kperf_timer_period_set();
}

uint64_t kperf_timer_pet_set()
{
  return _kperf_timer_pet_set();
}

uint64_t ktrace_config_create_current()
{
  return _ktrace_config_create_current();
}

uint64_t ktrace_config_destroy()
{
  return _ktrace_config_destroy();
}

uint64_t ktrace_config_get_owner_kind()
{
  return _ktrace_config_get_owner_kind();
}

uint64_t ktrace_config_get_owner_pid()
{
  return _ktrace_config_get_owner_pid();
}

uint64_t ktrace_config_kdebug_get_buffer_size()
{
  return _ktrace_config_kdebug_get_buffer_size();
}

uint64_t ktrace_config_kdebug_get_typefilter()
{
  return _ktrace_config_kdebug_get_typefilter();
}

uint64_t ktrace_config_kperf_get_action_samplers()
{
  return _ktrace_config_kperf_get_action_samplers();
}

uint64_t ktrace_config_kperf_get_pet_mode()
{
  return _ktrace_config_kperf_get_pet_mode();
}

uint64_t ktrace_config_kperf_get_timer_action_id()
{
  return _ktrace_config_kperf_get_timer_action_id();
}

uint64_t ktrace_config_kperf_get_timer_period_ns()
{
  return _ktrace_config_kperf_get_timer_period_ns();
}

uint64_t ktrace_config_print_description()
{
  return _ktrace_config_print_description();
}

uint64_t ktrace_configure()
{
  return _ktrace_configure();
}

uint64_t ktrace_events_filter_bitmap()
{
  return _ktrace_events_filter_bitmap();
}

uint64_t ktrace_reset_existing()
{
  return _ktrace_reset_existing();
}

uint64_t ktrace_session_create()
{
  return _ktrace_session_create();
}

uint64_t ktrace_session_free()
{
  return _ktrace_session_free();
}

uint64_t ktrace_session_set_event_names_enabled()
{
  return _ktrace_session_set_event_names_enabled();
}

uint64_t ktrace_set_buffer_size()
{
  return _ktrace_set_buffer_size();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return _open_memstream(__bufp, __sizep);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

uint64_t set_config_field_modifier()
{
  return _set_config_field_modifier();
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tailspin_buffer_size_get_default()
{
  return _tailspin_buffer_size_get_default();
}

uint64_t tailspin_config_free()
{
  return _tailspin_config_free();
}

uint64_t tailspin_enabled_get_default()
{
  return _tailspin_enabled_get_default();
}

uint64_t tailspin_full_sampling_period_get_default()
{
  return _tailspin_full_sampling_period_get_default();
}

uint64_t tailspin_kdbg_filter_get_default()
{
  return _tailspin_kdbg_filter_get_default();
}

uint64_t tailspin_make_ondisk_config()
{
  return _tailspin_make_ondisk_config();
}

uint64_t tailspin_oncore_sampling_period_get_default()
{
  return _tailspin_oncore_sampling_period_get_default();
}

uint64_t tailspin_sampling_option_get()
{
  return _tailspin_sampling_option_get();
}

uint64_t tailspin_sampling_options_get_default()
{
  return _tailspin_sampling_options_get_default();
}

uint64_t tailspin_save_trace_with_standard_chunks()
{
  return _tailspin_save_trace_with_standard_chunks();
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return _task_get_special_port(task, which_port, special_port);
}

uint64_t trace_print_filter()
{
  return _trace_print_filter();
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return _xpc_connection_get_context(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileOwnerAccountName(void *a1, const char *a2, ...)
{
  return [a1 fileOwnerAccountName];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSizeBytes(void *a1, const char *a2, ...)
{
  return [a1 fileSizeBytes];
}

id objc_msgSend_lostTimePeriodAtStartSecs(void *a1, const char *a2, ...)
{
  return [a1 lostTimePeriodAtStartSecs];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_ratioTimePeriodCovered(void *a1, const char *a2, ...)
{
  return [a1 ratioTimePeriodCovered];
}

id objc_msgSend_requestProcessingLatencySecs(void *a1, const char *a2, ...)
{
  return [a1 requestProcessingLatencySecs];
}

id objc_msgSend_tailspinDurationSecs(void *a1, const char *a2, ...)
{
  return [a1 tailspinDurationSecs];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeSpentByPhases(void *a1, const char *a2, ...)
{
  return [a1 timeSpentByPhases];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1];
}