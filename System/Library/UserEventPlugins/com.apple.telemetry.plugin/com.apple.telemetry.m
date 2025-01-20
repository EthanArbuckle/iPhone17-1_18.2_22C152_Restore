void sub_F50(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  double v28;
  const UInt8 *(__cdecl **v29)(CFDataRef);
  NSObject *v30;
  double *v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  const char *v38;
  double v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  double v46;
  double v47;
  NSObject *v48;
  double v49;
  NSObject *v50;
  double v51;
  NSObject *v52;
  double v53;
  NSObject *v54;
  unint64_t v55;
  NSObject *v56;
  double v57;
  double v58;
  NSObject *v60;
  NSObject *v61;
  double v62;
  NSObject *v63;
  double v64;
  NSObject *v65;
  double v66;
  NSObject *v67;
  unint64_t v68;
  NSObject *v69;
  unint64_t v70;
  NSObject *v71;
  double v72;
  double v73;
  NSObject *v74;
  double v75;
  NSObject *v76;
  unint64_t v77;
  double v78;
  NSObject *v79;
  double v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint32_t v90;
  uint64_t v91;
  const char *v92;
  NSObject *v93;
  uint64_t v94;
  double v95;
  unint64_t v96;
  NSObject *v97;
  NSObject *v98;
  NSObject *v99;
  uint64_t pmi_cycle_interval;
  NSObject *v101;
  void *v102;
  NSObject *v103;
  NSObject *v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void block[16];
  uint64_t v113;
  double *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  int v124;
  void v125[3];
  char v126;
  void v127[3];
  char v128;
  void v129[3];
  char v130;
  uint8_t buf[4];
  unint64_t v132;
  __int16 v133;
  unsigned char v134[10];
  double v135;
  __int16 v136;
  double v137;
  __int16 v138;
  double v139;
  __int16 v140;
  double v141;
  __int16 v142;
  double v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  double v147;
  __int16 v148;
  double v149;

  if (*(unsigned char *)(a1 + 320))
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
      sub_6EA0();
    }
    return;
  }
  if (*(unsigned char *)(a1 + 322))
  {
    if (__microstackshot() > 0x10000)
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_6958();
      }
      return;
    }
    v129[0] = 0;
    v129[1] = v129;
    v129[2] = 0x2000000000;
    v130 = 0;
    v127[0] = 0;
    v127[1] = v127;
    v127[2] = 0x2000000000;
    v128 = 0;
    v125[0] = 0;
    v125[1] = v125;
    v125[2] = 0x2000000000;
    v126 = 0;
    v121 = 0;
    v122 = &v121;
    v123 = 0x2000000000;
    v124 = 0;
    v117 = 0;
    v118 = &v117;
    v119 = 0x2000000000;
    v120 = 0;
    v113 = 0;
    v114 = (double *)&v113;
    v115 = 0x2000000000;
    v116 = 0;
    block[5] = _NSConcreteStackBlock;
    block[6] = 0x40000000;
    block[7] = sub_2C6C;
    block[8] = &unk_C528;
    block[14] = &v113;
    block[15] = a1;
    block[9] = v129;
    block[10] = v127;
    block[11] = &v121;
    block[12] = v125;
    block[13] = &v117;
    systemstats_foreach_micro();
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    v4 = qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG))
    {
      v39 = v114[3];
      v40 = *((_DWORD *)v122 + 6);
      v41 = *((_DWORD *)v118 + 6);
      *(_DWORD *)buf = 134218496;
      *(double *)&v132 = v39;
      v133 = 1024;
      *(_DWORD *)v134 = v40;
      *(_WORD *)&v134[4] = 1024;
      *(_DWORD *)&v134[6] = v41;
      _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Saved %zu microstackshots (ignored %d known duplicates and %d likely duplicates)", buf, 0x18u);
      if (!a2)
      {
LABEL_22:
        if (!*(unsigned char *)(a1 + 321))
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_69C4();
          }
          goto LABEL_205;
        }
        if (!*(void *)(a1 + 328))
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_69F8();
          }
          goto LABEL_205;
        }
        if (!*(void *)(*(void *)a1 + 120))
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          v14 = qword_C620;
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_6A2C(a1, v14, v15, v16, v17, v18, v19, v20);
          }
          goto LABEL_205;
        }
        v5 = now_in_absolute_milliseconds();
        v6 = *(void *)a1;
        v7 = *(void *)(*(void *)a1 + 168);
        v8 = (double)(v5 - v7) / 1000.0;
        v9 = *(void *)(a1 + 384);
        if (v9)
        {
          v10 = (double)(v5 - v9) / 1000.0;
          v111 = *(double *)(v6 + 120);
          v11 = *(double *)(a1 + 328);
          v12 = *(double *)(*(void *)(v6 + 8) + 32);
          if (v8 + 1800.0 < 86400.0)
          {
            if (v9 < v7)
            {
              if (qword_C628 != -1) {
                dispatch_once(&qword_C628, &stru_C2E8);
              }
              v13 = qword_C620;
              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134219520;
                *(double *)&v132 = v8;
                v133 = 2048;
                *(double *)v134 = v10;
                *(_WORD *)&v134[8] = 2048;
                v135 = v111;
                v136 = 2048;
                v137 = 0.0;
                v138 = 2048;
                v139 = 0.0;
                v140 = 2048;
                v141 = v11;
                v142 = 2048;
                v143 = v12;
                _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "PMI adjustment: last pmi adjustment < last cleanup. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x48u);
              }
              *(void *)(a1 + 368) = 0;
              *(void *)(a1 + 376) = 0;
              v10 = v8;
              *(void *)(a1 + 384) = 0;
            }
LABEL_46:
            v110 = v11;
            if (v10 < 1800.0)
            {
              if (qword_C628 != -1) {
                dispatch_once(&qword_C628, &stru_C2E8);
              }
              v21 = qword_C620;
              if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_205;
              }
              *(_DWORD *)buf = 134219520;
              *(double *)&v132 = v8;
              v133 = 2048;
              *(double *)v134 = v10;
              *(_WORD *)&v134[8] = 2048;
              v135 = v111;
              v136 = 2048;
              v137 = 0.0;
              v138 = 2048;
              v139 = 0.0;
              v140 = 2048;
              v141 = v11;
              v142 = 2048;
              v143 = v12;
              v22 = "PMI adjustment: Adjusted PMI interval too recently, not checking daily budget. time_since_cleanup:%."
                    "0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_per"
                    "cent:%.0f%% pmi_interval:%llu quota:%llu";
              v23 = v21;
              v24 = 72;
              goto LABEL_55;
            }
            *(double *)&v26 = COERCE_DOUBLE(systemstats_get_pmi_cycle_interval());
            if (qword_C600 != -1) {
              dispatch_once(&qword_C600, &stru_C3E8);
            }
            v27 = qword_C5F8;
            if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134219520;
              *(double *)&v132 = v8;
              v133 = 2048;
              *(double *)v134 = v10;
              *(_WORD *)&v134[8] = 2048;
              v135 = v111;
              v136 = 2048;
              v137 = 0.0;
              v138 = 2048;
              v139 = 0.0;
              v140 = 2048;
              v141 = v11;
              v142 = 2048;
              v143 = v12;
              _os_log_debug_impl(&dword_0, v27, OS_LOG_TYPE_DEBUG, ". time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x48u);
              v28 = 86400.0 - v8;
              if (qword_C600 != -1)
              {
                dispatch_once(&qword_C600, &stru_C3E8);
                v29 = &CFDataGetBytePtr_ptr;
LABEL_61:
                v30 = v29[191];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(double *)&v132 = v28;
                  _os_log_debug_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "time_remaining_in_the_day_s:%.2f", buf, 0xCu);
                  v31 = (double *)(a1 + 64);
                  v32 = *(void *)(a1 + 72);
                  if (qword_C600 != -1) {
                    dispatch_once(&qword_C600, &stru_C3E8);
                  }
                }
                else
                {
                  v31 = (double *)(a1 + 64);
                  v32 = *(void *)(a1 + 72);
                }
                v109 = v12;
                if (os_log_type_enabled((os_log_t)v29[191], OS_LOG_TYPE_DEBUG))
                {
                  sub_6E38();
                  if (v32)
                  {
LABEL_65:
                    v33 = *(void *)(a1 + 368);
                    *(void *)&v34 = v32 - v33;
                    if (qword_C600 != -1) {
                      dispatch_once(&qword_C600, &stru_C3E8);
                    }
                    if (os_log_type_enabled((os_log_t)v29[191], OS_LOG_TYPE_DEBUG)) {
                      sub_6DD0();
                    }
                    if (v32 == v33)
                    {
                      if (qword_C628 != -1) {
                        dispatch_once(&qword_C628, &stru_C2E8);
                      }
                      v12 = v109;
                      v35 = v110;
                      v36 = qword_C620;
                      v37 = 0.0;
                      if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_172;
                      }
                      *(_DWORD *)buf = 134219776;
                      v132 = v26;
                      v133 = 2048;
                      *(double *)v134 = v8;
                      *(_WORD *)&v134[8] = 2048;
                      v135 = v10;
                      v136 = 2048;
                      v137 = v111;
                      v138 = 2048;
                      v139 = 0.0;
                      v140 = 2048;
                      v141 = 0.0;
                      v142 = 2048;
                      v143 = v110;
                      v144 = 2048;
                      *(double *)&v145 = v109;
                      v38 = "PMI adjustment: No microstackshots since last adjustment, resetting PMI interval to %llu. ti"
                            "me_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_si"
                            "nce_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
                      goto LABEL_160;
                    }
                    v42 = *(void *)(a1 + 200);
                    if (qword_C600 != -1) {
                      dispatch_once(&qword_C600, &stru_C3E8);
                    }
                    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                    {
                      sub_6D68();
                      if (v42)
                      {
LABEL_80:
                        v43 = *(void *)(a1 + 376);
                        if (qword_C600 != -1) {
                          dispatch_once(&qword_C600, &stru_C3E8);
                        }
                        v107 = v42 - v43;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                          sub_6D00();
                        }
                        if (v42 == v43)
                        {
                          v12 = v109;
                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          v35 = v110;
                          v44 = qword_C620;
                          v37 = 0.0;
                          if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_172;
                          }
                          *(_DWORD *)buf = 134220032;
                          *(double *)&v132 = v34;
                          v133 = 2048;
                          *(void *)v134 = v26;
                          *(_WORD *)&v134[8] = 2048;
                          v135 = v8;
                          v136 = 2048;
                          v137 = v10;
                          v138 = 2048;
                          v139 = v111;
                          v140 = 2048;
                          v141 = 0.0;
                          v142 = 2048;
                          v143 = 0.0;
                          v144 = 2048;
                          *(double *)&v145 = v110;
                          v146 = 2048;
                          v147 = v109;
                          v38 = "PMI adjustment: No PMI microstackshots since last adjustment (%llu bytes of other types)"
                                ", resetting PMI interval to %llu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs a"
                                "ll_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_inter"
                                "val:%llu quota:%llu";
                          v45 = v44;
                          goto LABEL_170;
                        }
                        v46 = (double)v107;
                        v47 = (double)*(unint64_t *)&v34;
                        if (qword_C600 != -1) {
                          dispatch_once(&qword_C600, &stru_C3E8);
                        }
                        v48 = qword_C5F8;
                        v37 = v46 / v47;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&v132 = v46 / v47;
                          _os_log_debug_impl(&dword_0, v48, OS_LOG_TYPE_DEBUG, "ratio_of_pmi_vs_all_since_last_adjustment:%.2f", buf, 0xCu);
                          v49 = (double)v32 / (double)*(unint64_t *)&v111;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }
                        else
                        {
                          v49 = (double)v32 / (double)*(unint64_t *)&v111;
                        }
                        v50 = qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&v132 = v49;
                          _os_log_debug_impl(&dword_0, v50, OS_LOG_TYPE_DEBUG, "compression_ratio:%.2f", buf, 0xCu);
                          *(void *)&v51 = (unint64_t)(v47 / v49);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }
                        else
                        {
                          *(void *)&v51 = (unint64_t)(v47 / v49);
                        }
                        v52 = qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&v132 = v51;
                          _os_log_debug_impl(&dword_0, v52, OS_LOG_TYPE_DEBUG, "all_compressed_bytes_written_since_last_adjustment:%llu", buf, 0xCu);
                          v53 = (double)*(unint64_t *)&v51 / v10;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }
                        else
                        {
                          v53 = (double)*(unint64_t *)&v51 / v10;
                        }
                        v54 = qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&v132 = v53;
                          _os_log_debug_impl(&dword_0, v54, OS_LOG_TYPE_DEBUG, "all_compressed_bytes_written_per_second_since_last_adjustment:%.2f", buf, 0xCu);
                          v55 = (unint64_t)(v28 * v53);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }
                        else
                        {
                          v55 = (unint64_t)(v28 * v53);
                        }
                        v56 = qword_C5F8;
                        v106 = v55;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          v132 = v55;
                          _os_log_debug_impl(&dword_0, v56, OS_LOG_TYPE_DEBUG, "projected_remaining_all_compressed_bytes_written_in_the_day:%llu", buf, 0xCu);
                          *(void *)&v57 = v55 + *(void *)&v111;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                        }
                        else
                        {
                          *(void *)&v57 = v55 + *(void *)&v111;
                        }
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                          sub_6C98();
                        }
                        v12 = v109;
                        v58 = (double)*(unint64_t *)&v109;
                        if ((double)*(unint64_t *)&v109 * 1.1 >= (double)*(unint64_t *)&v57
                          && (v58 * 0.9 <= (double)*(unint64_t *)&v57 || *(void *)&v110 <= v26))
                        {
                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          v60 = qword_C620;
                          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 134220032;
                            *(double *)&v132 = v57;
                            v133 = 2048;
                            *(double *)v134 = v109;
                            *(_WORD *)&v134[8] = 2048;
                            v135 = v8;
                            v136 = 2048;
                            v137 = v10;
                            v138 = 2048;
                            v139 = v111;
                            v140 = 2048;
                            v141 = v51;
                            v142 = 2048;
                            v143 = v37 * 100.0;
                            v144 = 2048;
                            *(double *)&v145 = v110;
                            v146 = 2048;
                            v147 = v109;
                            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "PMI adjustment: Projected microstackshots data volume (%llu) is within the thresholds our of daily budget (%llu), not adjusting the PMI interval. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x5Cu);
                          }
                          goto LABEL_205;
                        }
                        if (qword_C628 != -1) {
                          dispatch_once(&qword_C628, &stru_C2E8);
                        }
                        v61 = qword_C620;
                        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134220032;
                          *(double *)&v132 = v57;
                          v133 = 2048;
                          *(double *)v134 = v109;
                          *(_WORD *)&v134[8] = 2048;
                          v135 = v8;
                          v136 = 2048;
                          v137 = v10;
                          v138 = 2048;
                          v139 = v111;
                          v140 = 2048;
                          v141 = v51;
                          v142 = 2048;
                          v143 = v37 * 100.0;
                          v144 = 2048;
                          *(double *)&v145 = v110;
                          v146 = 2048;
                          v147 = v109;
                          _os_log_debug_impl(&dword_0, v61, OS_LOG_TYPE_DEBUG, "PMI adjustment: Projected microstackshots data volume (%llu) is outside the thresholds our of daily budget (%llu), checking if we can adjust the PMI interval. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x5Cu);
                        }
                        if (qword_C600 != -1) {
                          dispatch_once(&qword_C600, &stru_C3E8);
                        }
                        v35 = v110;
                        *(void *)&v62 = *(void *)&v34 - v107;
                        v63 = qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&v132 = v62;
                          _os_log_debug_impl(&dword_0, v63, OS_LOG_TYPE_DEBUG, "nonpmi_uncompressed_bytes_written_since_last_adjustment:%llu", buf, 0xCu);
                          v64 = v46 / (double)*(unint64_t *)&v62;
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          v12 = v109;
                          v35 = v110;
                        }
                        else
                        {
                          v64 = v46 / (double)*(unint64_t *)&v62;
                        }
                        v65 = qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          *(double *)&v132 = v64;
                          _os_log_debug_impl(&dword_0, v65, OS_LOG_TYPE_DEBUG, "ratio_pmi_vs_nonpmi_since_last_adjustment:%.2f", buf, 0xCu);
                          v66 = (double)*(unint64_t *)&v35;
                          v26 = (unint64_t)(v64 * (double)*(unint64_t *)&v35);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          v12 = v109;
                          v35 = v110;
                        }
                        else
                        {
                          v66 = (double)*(unint64_t *)&v35;
                          v26 = (unint64_t)(v64 * (double)*(unint64_t *)&v35);
                        }
                        v67 = qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 134217984;
                          v132 = v26;
                          _os_log_debug_impl(&dword_0, v67, OS_LOG_TYPE_DEBUG, "pmi_interval_to_equal_nonpmi_datarate:%llu", buf, 0xCu);
                          v68 = (unint64_t)(v58 * 0.95);
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          v12 = v109;
                          v35 = v110;
                        }
                        else
                        {
                          v68 = (unint64_t)(v58 * 0.95);
                        }
                        v69 = qword_C5F8;
                        if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                          sub_6C0C(v68, v69);
                        }
                        v70 = v68 - *(void *)&v111;
                        if (v68 <= *(void *)&v111)
                        {
                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          v91 = qword_C620;
                          if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
                          {
LABEL_173:
                            v96 = 100000000000;
                            if (v26 > 0x174876E7FFLL && *(void *)&v35 == 100000000000)
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v97 = qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 134220032;
                                v132 = 100000000000;
                                v133 = 2048;
                                *(void *)v134 = v26;
                                *(_WORD *)&v134[8] = 2048;
                                v135 = v8;
                                v136 = 2048;
                                v137 = v10;
                                v138 = 2048;
                                v139 = v111;
                                v140 = 2048;
                                v141 = v51;
                                v142 = 2048;
                                v143 = v37 * 100.0;
                                v144 = 2048;
                                v145 = 100000000000;
                                v146 = 2048;
                                v147 = v12;
                                _os_log_error_impl(&dword_0, v97, OS_LOG_TYPE_ERROR, "PMI adjustment: Attempting to increase PMI microstackshots interval from %llu to %llu to fit into daily budget, but already at max interval!. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x5Cu);
                              }
                              goto LABEL_205;
                            }
                            if (v26 <= 0x174876E800)
                            {
                              v96 = v26;
                            }
                            else
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v98 = qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 134218240;
                                v132 = v26;
                                v133 = 2048;
                                *(void *)v134 = 100000000000;
                                _os_log_impl(&dword_0, v98, OS_LOG_TYPE_INFO, "PMI adjustment: Decreasing desired PMI interval %llu to max %llu", buf, 0x16u);
                              }
                            }
                            if (v96 < systemstats_get_pmi_cycle_interval())
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v99 = qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                              {
                                pmi_cycle_interval = systemstats_get_pmi_cycle_interval();
                                *(_DWORD *)buf = 134218240;
                                v132 = v96;
                                v133 = 2048;
                                *(void *)v134 = pmi_cycle_interval;
                                _os_log_impl(&dword_0, v99, OS_LOG_TYPE_INFO, "PMI adjustment: Increasing desired PMI interval %llu to default %llu", buf, 0x16u);
                              }
                              *(double *)&v96 = COERCE_DOUBLE(systemstats_get_pmi_cycle_interval());
                            }
                            if (v96 <= *(void *)&v35)
                            {
                              if (v96 >= *(void *)&v35)
                              {
LABEL_204:
                                *(double *)(a1 + 336) = *(double *)&v96;
                                sub_42E0(a1, 1);
                                goto LABEL_205;
                              }
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v103 = qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 134220032;
                                *(double *)&v132 = v35;
                                v133 = 2048;
                                *(void *)v134 = v96;
                                *(_WORD *)&v134[8] = 2048;
                                v135 = v8;
                                v136 = 2048;
                                v137 = v10;
                                v138 = 2048;
                                v139 = v111;
                                v140 = 2048;
                                v141 = v51;
                                v142 = 2048;
                                v143 = v37 * 100.0;
                                v144 = 2048;
                                *(double *)&v145 = v35;
                                v146 = 2048;
                                v147 = v12;
                                _os_log_impl(&dword_0, v103, OS_LOG_TYPE_DEFAULT, "PMI adjustment: Decreasing PMI microstackshots interval from %llu to %llu since we have space in the daily budget. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x5Cu);
                              }
                              v102 = (void *)(a1 + 440);
                            }
                            else
                            {
                              if (qword_C628 != -1) {
                                dispatch_once(&qword_C628, &stru_C2E8);
                              }
                              v101 = qword_C620;
                              if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 134220032;
                                *(double *)&v132 = v35;
                                v133 = 2048;
                                *(void *)v134 = v96;
                                *(_WORD *)&v134[8] = 2048;
                                v135 = v8;
                                v136 = 2048;
                                v137 = v10;
                                v138 = 2048;
                                v139 = v111;
                                v140 = 2048;
                                v141 = v51;
                                v142 = 2048;
                                v143 = v37 * 100.0;
                                v144 = 2048;
                                *(double *)&v145 = v35;
                                v146 = 2048;
                                v147 = v12;
                                _os_log_impl(&dword_0, v101, OS_LOG_TYPE_DEFAULT, "PMI adjustment: Increasing PMI microstackshots interval from %llu to %llu to fit into daily budget. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x5Cu);
                              }
                              v102 = (void *)(a1 + 448);
                            }
                            ++*v102;
                            goto LABEL_204;
                          }
                          *(_DWORD *)buf = 134220288;
                          *(double *)&v132 = v111;
                          v133 = 2048;
                          *(void *)v134 = v68;
                          *(_WORD *)&v134[8] = 2048;
                          v135 = *(double *)&v26;
                          v136 = 2048;
                          v137 = v8;
                          v138 = 2048;
                          v139 = v10;
                          v140 = 2048;
                          v141 = v111;
                          v142 = 2048;
                          v143 = v51;
                          v144 = 2048;
                          *(double *)&v145 = v37 * 100.0;
                          v146 = 2048;
                          v147 = v35;
                          v148 = 2048;
                          v149 = v12;
                          v92 = "PMI adjustment: Already exceeded daily target (%llu vs target %llu), setting PMI interva"
                                "l to be half of all microstackshot datarate: %llu. time_since_cleanup:%.0fs time_since_a"
                                "djustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent"
                                ":%.0f%% pmi_interval:%llu quota:%llu";
                          v93 = v91;
                        }
                        else
                        {
                          if (qword_C600 != -1) {
                            dispatch_once(&qword_C600, &stru_C3E8);
                          }
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                            sub_6B74();
                          }
                          v71 = qword_C5F8;
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 134217984;
                            v132 = (unint64_t)(v49 * (double)v70);
                            _os_log_debug_impl(&dword_0, v71, OS_LOG_TYPE_DEBUG, "target_remaining_all_uncompressed_bytes_written_in_the_day:%llu", buf, 0xCu);
                            v72 = (double)v106;
                            *(void *)&v73 = (unint64_t)(v37 * (double)v106);
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                          }
                          else
                          {
                            v72 = (double)v106;
                            *(void *)&v73 = (unint64_t)(v37 * (double)v106);
                          }
                          v74 = qword_C5F8;
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 134217984;
                            *(double *)&v132 = v73;
                            _os_log_debug_impl(&dword_0, v74, OS_LOG_TYPE_DEBUG, "projected_pmi_remaining_compressed_bytes_written_in_the_day:%llu", buf, 0xCu);
                            v75 = 1.0 - v37;
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                          }
                          else
                          {
                            v75 = 1.0 - v37;
                          }
                          v76 = qword_C5F8;
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 134217984;
                            *(double *)&v132 = v75;
                            _os_log_debug_impl(&dword_0, v76, OS_LOG_TYPE_DEBUG, "ratio_of_nonpmi_vs_all_since_last_adjustment:%.2f", buf, 0xCu);
                            v77 = (unint64_t)(v72 * v75);
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                          }
                          else
                          {
                            v77 = (unint64_t)(v72 * v75);
                          }
                          if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                            sub_6B0C();
                          }
                          if (v70 > 2 * v77)
                          {
                            v35 = v110;
                            if (qword_C600 != -1) {
                              dispatch_once(&qword_C600, &stru_C3E8);
                            }
                            *(void *)&v78 = v70 - v77;
                            v79 = qword_C5F8;
                            if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 134217984;
                              *(double *)&v132 = v78;
                              _os_log_debug_impl(&dword_0, v79, OS_LOG_TYPE_DEBUG, "target_pmi_remaining_compressed_bytes_written_in_the_day:%llu", buf, 0xCu);
                              v108 = (double)*(unint64_t *)&v78 / (double)*(unint64_t *)&v73;
                              if (qword_C600 != -1)
                              {
                                dispatch_once(&qword_C600, &stru_C3E8);
                                v12 = v109;
                                v35 = v110;
                                goto LABEL_145;
                              }
                              v80 = (double)*(unint64_t *)&v78 / (double)*(unint64_t *)&v73;
                              v35 = v110;
                            }
                            else
                            {
                              v80 = (double)*(unint64_t *)&v78 / (double)*(unint64_t *)&v73;
                            }
                            v108 = v80;
                            v12 = v109;
LABEL_145:
                            v81 = qword_C5F8;
                            if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
                              sub_6A9C(v81, v82, v83, v84, v85, v86, v87, v88);
                            }
                            if (qword_C628 != -1) {
                              dispatch_once(&qword_C628, &stru_C2E8);
                            }
                            v26 = (unint64_t)(v66 / v108);
                            v89 = qword_C620;
                            if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 134219776;
                              v132 = (unint64_t)(v66 / v108);
                              v133 = 2048;
                              *(double *)v134 = v8;
                              *(_WORD *)&v134[8] = 2048;
                              v135 = v10;
                              v136 = 2048;
                              v137 = v111;
                              v138 = 2048;
                              v139 = v51;
                              v140 = 2048;
                              v141 = v37 * 100.0;
                              v142 = 2048;
                              v143 = v35;
                              v144 = 2048;
                              *(double *)&v145 = v12;
                              _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "PMI adjustment: Calculated new PMI microstackshots interval to fit into daily budget: %llu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu", buf, 0x52u);
                            }
                            goto LABEL_173;
                          }
                          if (qword_C628 != -1) {
                            dispatch_once(&qword_C628, &stru_C2E8);
                          }
                          v12 = v109;
                          v105 = qword_C620;
                          if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
                          {
                            v35 = v110;
                            goto LABEL_173;
                          }
                          *(_DWORD *)buf = 134220288;
                          v132 = v77;
                          v133 = 2048;
                          *(void *)v134 = v70;
                          *(_WORD *)&v134[8] = 2048;
                          v135 = *(double *)&v26;
                          v136 = 2048;
                          v137 = v8;
                          v138 = 2048;
                          v139 = v10;
                          v140 = 2048;
                          v141 = v111;
                          v142 = 2048;
                          v143 = v51;
                          v144 = 2048;
                          *(double *)&v145 = v37 * 100.0;
                          v146 = 2048;
                          v147 = v110;
                          v148 = 2048;
                          v149 = v109;
                          v92 = "PMI adjustment: Non-PMI microstackshots alone are on track exceed half of daily target ("
                                "%llu vs target remaining %llu), setting PMI interval to be half of all microstackshot da"
                                "tarate: %llu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_clean"
                                "up:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
                          v93 = v105;
                          v35 = v110;
                        }
                        _os_log_error_impl(&dword_0, v93, OS_LOG_TYPE_ERROR, v92, buf, 0x66u);
                        goto LABEL_173;
                      }
                    }
                    else if (v42)
                    {
                      goto LABEL_80;
                    }
                    if (qword_C628 != -1) {
                      dispatch_once(&qword_C628, &stru_C2E8);
                    }
                    v12 = v109;
                    v35 = v110;
                    v94 = qword_C620;
                    v37 = 0.0;
                    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_172;
                    }
                    v95 = *v31;
                    *(_DWORD *)buf = 134220032;
                    *(double *)&v132 = v95;
                    v133 = 2048;
                    *(void *)v134 = v26;
                    *(_WORD *)&v134[8] = 2048;
                    v135 = v8;
                    v136 = 2048;
                    v137 = v10;
                    v138 = 2048;
                    v139 = v111;
                    v140 = 2048;
                    v141 = 0.0;
                    v142 = 2048;
                    v143 = 0.0;
                    v144 = 2048;
                    *(double *)&v145 = v110;
                    v146 = 2048;
                    v147 = v109;
                    v38 = "PMI adjustment: No PMI microstackshots since last cleanup (%llu of other types), resetting PMI"
                          " interval to %llu. time_since_cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanu"
                          "p:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
                    v45 = v94;
LABEL_170:
                    v90 = 92;
                    goto LABEL_171;
                  }
                }
                else if (v32)
                {
                  goto LABEL_65;
                }
                if (qword_C628 != -1) {
                  dispatch_once(&qword_C628, &stru_C2E8);
                }
                v35 = v110;
                v36 = qword_C620;
                v37 = 0.0;
                if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_172;
                }
                *(_DWORD *)buf = 134219776;
                v132 = v26;
                v133 = 2048;
                *(double *)v134 = v8;
                *(_WORD *)&v134[8] = 2048;
                v135 = v10;
                v136 = 2048;
                v137 = v111;
                v138 = 2048;
                v139 = 0.0;
                v140 = 2048;
                v141 = 0.0;
                v142 = 2048;
                v143 = v110;
                v144 = 2048;
                *(double *)&v145 = v12;
                v38 = "PMI adjustment: No microstackshots since last cleanup, resetting PMI interval to %llu. time_since_"
                      "cleanup:%.0fs time_since_adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:"
                      "%llu pmi_percent:%.0f%% pmi_interval:%llu quota:%llu";
LABEL_160:
                v45 = v36;
                v90 = 82;
LABEL_171:
                _os_log_error_impl(&dword_0, v45, OS_LOG_TYPE_ERROR, v38, buf, v90);
LABEL_172:
                v51 = 0.0;
                goto LABEL_173;
              }
            }
            else
            {
              v28 = 86400.0 - v8;
            }
            v29 = &CFDataGetBytePtr_ptr;
            goto LABEL_61;
          }
        }
        else
        {
          v111 = *(double *)(v6 + 120);
          v11 = *(double *)(a1 + 328);
          v12 = *(double *)(*(void *)(v6 + 8) + 32);
          v10 = (double)(v5 - v7) / 1000.0;
          if (v8 + 1800.0 < 86400.0) {
            goto LABEL_46;
          }
        }
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        v25 = qword_C620;
        if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_205;
        }
        *(_DWORD *)buf = 134219776;
        *(double *)&v132 = 86400.0 - v8;
        v133 = 2048;
        *(double *)v134 = v8;
        *(_WORD *)&v134[8] = 2048;
        v135 = v10;
        v136 = 2048;
        v137 = v111;
        v138 = 2048;
        v139 = 0.0;
        v140 = 2048;
        v141 = 0.0;
        v142 = 2048;
        v143 = v11;
        v144 = 2048;
        *(double *)&v145 = v12;
        v22 = "PMI adjustment: Cleanup expected in %.0fs, not checking daily budget. time_since_cleanup:%.0fs time_since_"
              "adjustment:%.0fs all_bytes_since_cleanup:%llu all_bytes_since_adjustment:%llu pmi_percent:%.0f%% pmi_inter"
              "val:%llu quota:%llu";
        v23 = v25;
        v24 = 82;
LABEL_55:
        _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, v22, buf, v24);
LABEL_205:
        *(unsigned char *)(a1 + 320) = 1;
        v104 = *(NSObject **)(a1 + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_675C;
        block[3] = &unk_C548;
        block[4] = a1;
        dispatch_async(v104, block);
        _Block_object_dispose(&v113, 8);
        _Block_object_dispose(&v117, 8);
        _Block_object_dispose(&v121, 8);
        _Block_object_dispose(v125, 8);
        _Block_object_dispose(v127, 8);
        _Block_object_dispose(v129, 8);
        return;
      }
    }
    else if (!a2)
    {
      goto LABEL_22;
    }
    systemstats_stream_flush();
    goto LABEL_22;
  }
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
    sub_6924();
  }
}

uint64_t sub_2C6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((*(unsigned char *)(a2 + 24) & 0x10) != 0)
  {
    unsigned int v10 = *(_DWORD *)(a3 + 193);
    int v11 = *(_DWORD *)(a3 + 197);
    unint64_t v12 = *(void *)(a3 + 209);
    uint64_t v64 = *(void *)(a3 + 201);
    uint64_t v65 = *(void *)(a3 + 217);
    v13 = a1 + 10;
    if (v12 < *(void *)(a1[10] + 344))
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      v14 = qword_C5F8;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67110144;
        unsigned int v67 = v10;
        __int16 v68 = 1024;
        *(_DWORD *)v69 = v11;
        *(_WORD *)&v69[4] = 2048;
        *(void *)&v69[6] = v64;
        *(_WORD *)&v69[14] = 2048;
        *(void *)&v69[16] = v12;
        *(_WORD *)&v69[24] = 2048;
        *(void *)&v69[26] = v65;
        _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "PMI microstackshot generation:%u source:%u period:%llu samples_recorded:%llu samples_skipped:%llu - duplicate", buf, 0x2Cu);
      }
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
      if (v12 == *(void *)(a1[10] + 344) - 1) {
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      }
      ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
      return 1;
    }
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    v15 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110144;
      unsigned int v67 = v10;
      __int16 v68 = 1024;
      *(_DWORD *)v69 = v11;
      *(_WORD *)&v69[4] = 2048;
      *(void *)&v69[6] = v64;
      *(_WORD *)&v69[14] = 2048;
      *(void *)&v69[16] = v12;
      *(_WORD *)&v69[24] = 2048;
      *(void *)&v69[26] = v65;
      _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "PMI microstackshot generation:%u source:%u period:%llu samples_recorded:%llu samples_skipped:%llu", buf, 0x2Cu);
    }
    uint64_t v16 = *v13;
    unsigned int v17 = *(_DWORD *)(*v13 + 352);
    int v18 = v10;
    if (v17 == v10)
    {
      if (v11 == 4)
      {
        if (v64 != *(void *)(v16 + 328))
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          v19 = qword_C620;
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
            sub_7C9C((uint64_t)(a1 + 10), v64, v19);
          }
          uint64_t v16 = *v13;
          *(unsigned char *)(*v13 + 410) = 1;
        }
      }
      else
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
          sub_7D2C();
        }
        uint64_t v16 = *v13;
        *(unsigned char *)(*v13 + 409) = 1;
      }
    }
    else if (v17 < v10)
    {
      if (v11 == 4 && v64 == *(void *)(v16 + 328))
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        v22 = qword_C620;
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
          sub_7DA0((uint64_t)(a1 + 10), v18, v22);
        }
        uint64_t v16 = *v13;
        *(_DWORD *)(*v13 + 352) = v18;
      }
      else
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        v27 = qword_C620;
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
        {
          unsigned int v62 = *(_DWORD *)(*v13 + 352);
          uint64_t v63 = *(void *)(*v13 + 328);
          *(_DWORD *)buf = 67110144;
          unsigned int v67 = v62;
          __int16 v68 = 1024;
          *(_DWORD *)v69 = v10;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = v11;
          *(_WORD *)&v69[10] = 2048;
          *(void *)&v69[12] = v64;
          *(_WORD *)&v69[20] = 2048;
          *(void *)&v69[22] = v63;
          _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "generation incremented unexpectedly %u -> %u, and settings are wrong! source:%d period:%llu, should be %llu", buf, 0x28u);
        }
        uint64_t v16 = *v13;
        *(unsigned char *)(*v13 + 411) = 1;
        int v18 = v10;
      }
    }
    if (*(_DWORD *)(v16 + 352) == v18)
    {
      unint64_t v28 = *(void *)(v16 + 344);
      unint64_t v29 = v12 - v28;
      if (v12 > v28 && v28 >= 2)
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
          sub_7C28();
        }
        uint64_t v16 = *v13;
        unint64_t v30 = *(void *)(*v13 + 400);
        *(void *)(*v13 + 392) += v29;
        if (v30 < v29) {
          *(void *)(v16 + 400) = v29;
        }
      }
      *(void *)(v16 + 344) = v12 + 1;
      *(void *)(v16 + 360) = v65;
    }
    *(_DWORD *)(v16 + 356) = v18;
    goto LABEL_70;
  }
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_7BB8();
    }
    goto LABEL_70;
  }
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    unint64_t v23 = *(void *)(a2 + 8);
    if (qword_C610 >= v23 && (qword_C610 != v23 || (unint64_t)qword_C618 >= *(void *)(a2 + 16)))
    {
      ++*(_DWORD *)(*(void *)(a1[8] + 8) + 24);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      v58 = qword_C5F8;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_101;
      }
      return 1;
    }
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    v21 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
LABEL_48:
      unsigned int v24 = *(unsigned __int8 *)(a2 + 24);
      uint64_t v25 = *(void *)(a2 + 8);
      uint64_t v26 = *(void *)(a2 + 16);
      *(_DWORD *)buf = 67109632;
      unsigned int v67 = v24;
      __int16 v68 = 2048;
      *(void *)v69 = v25;
      *(_WORD *)&v69[8] = 2048;
      *(void *)&v69[10] = v26;
      _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "non-PMI microstackshot 0x%x @ %llu.%0llu", buf, 0x1Cu);
    }
LABEL_70:
    ++*(void *)(*(void *)(a1[9] + 8) + 24);
    v31 = (void *)a1[10];
    *(_WORD *)(a2 + 25) = *((_WORD *)v31 + 162);
    uint64_t v32 = v31[9] + a5;
    ++v31[8];
    v31[9] = v32;
    uint64_t v33 = *(unsigned int *)(a3 + 56);
    uint64_t v34 = v31[11];
    v31[10] += v33;
    uint64_t v35 = (*(_DWORD *)(a4 + 8) + *(_DWORD *)(a4 + 4));
    v31[11] = v34 + v35;
    char v36 = *(unsigned char *)(a2 + 24);
    if (v36)
    {
      uint64_t v50 = v31[13] + a5;
      ++v31[12];
      v31[13] = v50;
      uint64_t v51 = v31[15] + v35;
      v31[14] += v33;
      v31[15] = v51;
      if ((v36 & 2) == 0)
      {
LABEL_72:
        if ((v36 & 8) == 0) {
          goto LABEL_73;
        }
        goto LABEL_85;
      }
    }
    else if ((*(unsigned char *)(a2 + 24) & 2) == 0)
    {
      goto LABEL_72;
    }
    uint64_t v52 = v31[17] + a5;
    ++v31[16];
    v31[17] = v52;
    uint64_t v53 = v31[19] + v35;
    v31[18] += v33;
    v31[19] = v53;
    if ((v36 & 8) == 0)
    {
LABEL_73:
      if ((v36 & 0x10) == 0) {
        goto LABEL_74;
      }
      goto LABEL_86;
    }
LABEL_85:
    uint64_t v54 = v31[21] + a5;
    ++v31[20];
    v31[21] = v54;
    uint64_t v55 = v31[23] + v35;
    v31[22] += v33;
    v31[23] = v55;
    if ((v36 & 0x10) == 0)
    {
LABEL_74:
      if ((v36 & 0x20) == 0)
      {
LABEL_76:
        if ((v36 & 0x3B) == 0)
        {
          uint64_t v39 = v31[33] + a5;
          ++v31[32];
          v31[33] = v39;
          uint64_t v40 = v31[35] + v35;
          v31[34] += v33;
          v31[35] = v40;
        }
        unint64_t v41 = *(void *)(*v31 + 168);
        uint64_t v42 = *(void *)(*v31 + 120);
        systemstats_write_microstackshot();
        v43 = (void *)a1[10];
        unint64_t v44 = *(void *)(*v43 + 168);
        BOOL v45 = v44 > v41;
        unint64_t v46 = v44 - v41;
        if (v45)
        {
          sub_5588(v43, v42 + a5, (double)v46 / 1000.0);
          sub_47D4(a1[10]);
          uint64_t v47 = a1[10];
          *(_OWORD *)(v47 + 64) = 0u;
          *(_OWORD *)(v47 + 80) = 0u;
          *(_OWORD *)(v47 + 96) = 0u;
          *(_OWORD *)(v47 + 112) = 0u;
          *(_OWORD *)(v47 + 128) = 0u;
          *(_OWORD *)(v47 + 144) = 0u;
          *(_OWORD *)(v47 + 160) = 0u;
          *(_OWORD *)(v47 + 176) = 0u;
          *(_OWORD *)(v47 + 192) = 0u;
          *(_OWORD *)(v47 + 208) = 0u;
          *(_OWORD *)(v47 + 224) = 0u;
          *(_OWORD *)(v47 + 240) = 0u;
          *(_OWORD *)(v47 + 256) = 0u;
          *(_OWORD *)(v47 + 272) = 0u;
          *(void *)(v47 + 368) = 0;
          *(void *)(v47 + 376) = 0;
          *(void *)(v47 + 384) = 0;
          *(void *)(v47 + 440) = 0;
          *(void *)(v47 + 448) = 0;
        }
        uint64_t v48 = *(void *)(a2 + 16);
        qword_C610 = *(void *)(a2 + 8);
        qword_C618 = v48;
        return 1;
      }
LABEL_75:
      uint64_t v37 = v31[29] + a5;
      ++v31[28];
      v31[29] = v37;
      uint64_t v38 = v31[31] + v35;
      v31[30] += v33;
      v31[31] = v38;
      goto LABEL_76;
    }
LABEL_86:
    uint64_t v56 = v31[25] + a5;
    ++v31[24];
    v31[25] = v56;
    uint64_t v57 = v31[27] + v35;
    v31[26] += v33;
    v31[27] = v57;
    if ((v36 & 0x20) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_7B48();
    }
    return 1;
  }
  unint64_t v20 = *(void *)(a2 + 8);
  if (qword_C610 < v20 || qword_C610 == v20 && (unint64_t)qword_C618 < *(void *)(a2 + 16))
  {
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    v21 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    goto LABEL_70;
  }
  ++*(_DWORD *)(*(void *)(a1[8] + 8) + 24);
  if (qword_C600 != -1) {
    dispatch_once(&qword_C600, &stru_C3E8);
  }
  v58 = qword_C5F8;
  if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
  {
LABEL_101:
    unsigned int v59 = *(unsigned __int8 *)(a2 + 24);
    uint64_t v60 = *(void *)(a2 + 8);
    uint64_t v61 = *(void *)(a2 + 16);
    *(_DWORD *)buf = 67109632;
    unsigned int v67 = v59;
    __int16 v68 = 2048;
    *(void *)v69 = v60;
    *(_WORD *)&v69[8] = 2048;
    *(void *)&v69[10] = v61;
    _os_log_debug_impl(&dword_0, v58, OS_LOG_TYPE_DEBUG, "non-PMI microstackshot 0x%x @ %llu.%0llu - likely duplicate", buf, 0x1Cu);
  }
  return 1;
}

uint64_t telemetry_notification(mach_port_name_t name)
{
  mach_port_context_t context = 0;
  if (mach_port_get_context(mach_task_self_, name, &context)) {
    _os_assumes_log();
  }
  else {
    sub_F50(context, 0);
  }
  return 0;
}

uint64_t sub_3764(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 5100)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }
    else
    {
      *(_DWORD *)(a2 + 32) = telemetry_notification(a1[3]);
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

void sub_3820(uint64_t a1)
{
  if (mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_3764, 0x68u, *(_DWORD *)(a1 + 32), 0))
  {
    sub_72C0();
  }
}

void init_telemetry()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v1 = dispatch_queue_create("com.apple.telemetry.microstackshots", v0);
  int out_token = -1;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_397C;
  handler[3] = &unk_C288;
  handler[4] = v1;
  if (notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v1, handler)) {
    _os_assumes_log();
  }
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000;
  v2[2] = sub_3BD8;
  v2[3] = &unk_C2A8;
  v2[4] = v1;
  int v3 = out_token;
  dispatch_async(v1, v2);
}

void sub_397C(uint64_t a1, int a2)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
    sub_68BC();
  }
  v4 = *(NSObject **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_3A54;
  v5[3] = &unk_C268;
  v5[4] = v4;
  int v6 = a2;
  dispatch_async(v4, v5);
}

void sub_3A54(uint64_t a1)
{
}

void sub_3A64(uint64_t a1, int a2)
{
  if (qword_C5D0)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
      sub_68F0();
    }
  }
  else if (MKBDeviceUnlockedSinceBoot())
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    v4 = qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Device unlocked; proceeding with initialization of telemetry plugin.",
        buf,
        2u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_3C18;
    block[3] = &unk_C348;
    int v6 = a2;
    block[4] = "/private/var/db/systemstats";
    block[5] = a1;
    if (qword_C5D8 != -1) {
      dispatch_once(&qword_C5D8, block);
    }
  }
}

void sub_3BD8(uint64_t a1)
{
}

void sub_3BE8(id a1)
{
  qword_C620 = (uint64_t)os_log_create("com.apple.systemstats", "telemetry_plugin");
}

void sub_3C18(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 != -1) {
    notify_cancel(v2);
  }
  _systemstats_boot();
  systemstats_unlink_if_present();
  systemstats_unlink_if_present();
  systemstats_unlink_if_present();
  qword_C5D0 = (uint64_t)malloc_type_calloc(1uLL, 0x1C8uLL, 0x10300402009BE2AuLL);
  *(void *)(qword_C5D0 + 16) = *(void *)(a1 + 40);
  uint64_t v3 = _systemstats_stream_create();
  uint64_t v4 = qword_C5D0;
  *(void *)qword_C5D0 = v3;
  if (!v3)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_6ED4();
    }
    goto LABEL_41;
  }
  *(_DWORD *)(v4 + 32) = 0x10000;
  v5 = malloc_type_malloc(0x10000uLL, 0x208CE60EuLL);
  mach_port_context_t v6 = qword_C5D0;
  *(void *)(qword_C5D0 + 24) = v5;
  if (!v5)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_6F08();
    }
    goto LABEL_40;
  }
  poly[0] = 0;
  if (mach_port_allocate(mach_task_self_, 1u, poly))
  {
    if ((sub_7120() & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_37;
  }
  if (mach_port_insert_right(mach_task_self_, poly[0], poly[0], 0x14u))
  {
    if ((sub_7090() & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_37;
  }
  mach_port_t v7 = mach_host_self();
  if (host_set_special_port(v7, 20, poly[0]))
  {
    if ((sub_7000() & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_37;
  }
  if (mach_port_set_context(mach_task_self_, poly[0], v6))
  {
    if ((sub_6F70() & 1) == 0)
    {
LABEL_35:
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
    }
LABEL_37:
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_6F3C();
    }
    uint64_t v16 = qword_C5D0;
    free(*(void **)(qword_C5D0 + 24));
    *(void *)(v16 + 24) = 0;
LABEL_40:
    systemstats_stream_delete();
    *(void *)qword_C5D0 = 0;
LABEL_41:
    free((void *)qword_C5D0);
    return;
  }
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, poly[0], 0, *(dispatch_queue_t *)(v6 + 16));
  *(void *)(v6 + 288) = v8;
  block = _NSConcreteStackBlock;
  uint64_t v23 = 0x40000000;
  unsigned int v24 = sub_3820;
  uint64_t v25 = &unk_C368;
  LODWORD(v26) = poly[0];
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &block);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume(*(dispatch_object_t *)(v6 + 288));
  block = _NSConcreteStackBlock;
  uint64_t v23 = 0x40000000;
  unsigned int v24 = sub_46A0;
  uint64_t v25 = &unk_C3A8;
  uint64_t v26 = qword_C5D0;
  if (qword_C5E0 != -1) {
    dispatch_once(&qword_C5E0, &block);
  }
  uint64_t v10 = qword_C5D0;
  int v11 = *(NSObject **)(qword_C5D0 + 16);
  block = _NSConcreteStackBlock;
  uint64_t v23 = 0x40000000;
  unsigned int v24 = sub_6644;
  uint64_t v25 = &unk_C4A0;
  uint64_t v26 = qword_C5D0;
  if (notify_register_dispatch("com.apple.da.tasking_changed", (int *)(qword_C5D0 + 308), v11, &block)) {
    _os_assumes_log();
  }
  *(void *)(v10 + 296) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(v10 + 16));
  dispatch_time_t v12 = dispatch_time(0, 86400000000000);
  dispatch_source_set_timer(*(dispatch_source_t *)(v10 + 296), v12, 0x4E94914F0000uLL, 0x8BB2C97000uLL);
  v13 = *(NSObject **)(v10 + 296);
  *(void *)poly = _NSConcreteStackBlock;
  uint64_t v18 = 0x40000000;
  v19 = sub_66CC;
  unint64_t v20 = &unk_C4C0;
  uint64_t v21 = v10;
  dispatch_source_set_event_handler(v13, poly);
  dispatch_resume(*(dispatch_object_t *)(v10 + 296));
  v14 = *(NSObject **)(qword_C5D0 + 16);
  block = _NSConcreteStackBlock;
  uint64_t v23 = 0x40000000;
  unsigned int v24 = sub_66D4;
  uint64_t v25 = &unk_C4E0;
  uint64_t v26 = qword_C5D0;
  if (notify_register_dispatch("com.apple.telemetry.immediate", (int *)(qword_C5D0 + 304), v14, &block)) {
    _os_assumes_log();
  }
  uint64_t v15 = qword_C5D0;
  block = _NSConcreteStackBlock;
  uint64_t v23 = 0x40000000;
  unsigned int v24 = sub_6754;
  uint64_t v25 = &unk_C500;
  uint64_t v26 = qword_C5D0;
  if (notify_register_dispatch("com.apple.system.powersources.source", (int *)(qword_C5D0 + 312), *(dispatch_queue_t *)(qword_C5D0 + 16), &block))
  {
    _os_assumes_log();
  }
  if (notify_register_dispatch("com.apple.springboard.lockstate", (int *)(v15 + 316), *(dispatch_queue_t *)(v15 + 16), &block))
  {
    _os_assumes_log();
  }
  notify_suspend(*(_DWORD *)(v15 + 312));
  notify_suspend(*(_DWORD *)(v15 + 316));
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), &stru_C328);
}

void sub_41D4(id a1)
{
  sub_421C(qword_C5D0);
  sub_4298(qword_C5D0);
  uint64_t v1 = qword_C5D0;

  sub_42E0(v1, 0);
}

void sub_421C(uint64_t a1)
{
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(*(_DWORD *)(a1 + 316), &state64);
  if (state64) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = state == 0;
  }
  if (v3) {
    int v4 = 3;
  }
  else {
    int v4 = 1;
  }
  if (IOPSGetTimeRemainingEstimate() != -2.0) {
    v4 |= 4u;
  }
  if (*(unsigned __int16 *)(a1 + 324) != v4)
  {
    sub_F50(a1, 0);
    *(_WORD *)(a1 + 324) = v4;
  }
}

uint64_t sub_4298(uint64_t a1)
{
  uint64_t pmi_cycle_interval = systemstats_get_pmi_cycle_interval();
  *(void *)(a1 + 336) = pmi_cycle_interval;
  if (pmi_cycle_interval != *(void *)(a1 + 328)) {
    sub_F50(a1, 0);
  }
  uint64_t result = systemstats_persistence_is_allowed();
  *(unsigned char *)(a1 + 321) = result;
  return result;
}

void sub_42E0(uint64_t a1, int a2)
{
  char v2 = a2;
  if (a2)
  {
    sub_47D4(a1);
    uint64_t v4 = *(void *)(a1 + 336);
  }
  else
  {
    if (*(void *)(a1 + 328) == *(void *)(a1 + 336)) {
      goto LABEL_29;
    }
    sub_47D4(a1);
    uint64_t v4 = *(void *)(a1 + 336);
    if (*(void *)(a1 + 328) == v4) {
      goto LABEL_29;
    }
  }
  if (!v4)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    v5 = qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Disabling cycle-count-based microstackshots because settings changed.", (uint8_t *)&v14, 2u);
    }
  }
  if (__telemetry())
  {
    if (*(void *)(a1 + 328))
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      mach_port_context_t v6 = qword_C620;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_7238(v6);
      }
    }
  }
  else
  {
    *(void *)(a1 + 328) = 0;
  }
  if ((v2 & 1) != 0 || *(void *)(a1 + 328) != *(void *)(a1 + 336))
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    mach_port_t v7 = qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 336);
      int v14 = 134217984;
      uint64_t v15 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Enabling cycle-count-based microstackshots at %llu cycles.", (uint8_t *)&v14, 0xCu);
    }
    if (__telemetry())
    {
      *(unsigned char *)(a1 + 408) = 1;
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      dispatch_block_t v9 = qword_C620;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_71B0(v9);
      }
    }
    else
    {
      *(void *)(a1 + 328) = *(void *)(a1 + 336);
      *(_DWORD *)(a1 + 352) = *(_DWORD *)(a1 + 356) + 1;
      uint64_t v10 = *(void *)(a1 + 200);
      *(void *)(a1 + 368) = *(void *)(a1 + 72);
      *(void *)(a1 + 376) = v10;
      *(void *)(a1 + 384) = now_in_absolute_milliseconds();
    }
  }
LABEL_29:
  if (*(unsigned char *)(a1 + 321))
  {
    if (*(unsigned char *)(a1 + 322)) {
      goto LABEL_43;
    }
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    int v11 = qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Enabling state change notifications since persistence is allowed.", (uint8_t *)&v14, 2u);
    }
    notify_resume(*(_DWORD *)(a1 + 312));
    notify_resume(*(_DWORD *)(a1 + 316));
    char v12 = 1;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 322)) {
      goto LABEL_43;
    }
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    v13 = qword_C620;
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Disabling state change notifications since persistence is disallowed.", (uint8_t *)&v14, 2u);
    }
    notify_suspend(*(_DWORD *)(a1 + 312));
    notify_suspend(*(_DWORD *)(a1 + 316));
    char v12 = 0;
  }
  *(unsigned char *)(a1 + 322) = v12;
LABEL_43:
  if (*(void *)(a1 + 328))
  {
    if (!*(void *)(a1 + 344)) {
      *(void *)(a1 + 344) = 1;
    }
  }
}

void sub_46A0(uint64_t a1)
{
  qword_C5E8 = os_transaction_create();
  qword_C5F0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_475C;
  handler[3] = &unk_C388;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)qword_C5F0, handler);
  dispatch_activate((dispatch_object_t)qword_C5F0);
}

void sub_475C(uint64_t a1)
{
  sub_F50(*(void *)(a1 + 32), 1);
  sub_47D4(*(void *)(a1 + 32));
  uint64_t v2 = now_in_absolute_milliseconds();
  sub_5588(*(void **)(a1 + 32), *(void *)(**(void **)(a1 + 32) + 120), (double)(unint64_t)(v2 - *(void *)(**(void **)(a1 + 32) + 168)) / 1000.0);
  if (qword_C5E8)
  {
    os_release((void *)qword_C5E8);
    qword_C5E8 = 0;
  }
}

void sub_47D4(uint64_t a1)
{
  mach_port_t v2 = mach_host_self();
  *(void *)host_info64_out = 0;
  *(void *)&host_info64_out[8] = 0;
  mach_msg_type_number_t host_info64_outCnt = 4;
  if (host_statistics64(v2, 3, (host_info64_t)host_info64_out, &host_info64_outCnt))
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_7930();
    }
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = 10000000 * (*(unsigned int *)&host_info64_out[4] + (unint64_t)*(unsigned int *)host_info64_out);
  }
  if (*(void *)(a1 + 328))
  {
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_78FC();
    }
    if (!*(void *)(a1 + 328))
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7348();
      }
      int v14 = 0;
      int v50 = 0;
      int v15 = 0;
      int v55 = 0;
      uint64_t v54 = 0;
      int v53 = 0;
      uint64_t v51 = 0;
      unint64_t v52 = 0;
      unint64_t v16 = 0;
      unsigned int v17 = 0;
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      goto LABEL_39;
    }
    if (!*(void *)(a1 + 344))
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      v13 = &CFDataGetBytePtr_ptr;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_737C();
      }
      goto LABEL_44;
    }
    unint64_t v4 = *(void *)(a1 + 416);
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    v5 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v4;
      _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "last_check_pmi_samples_recorded:%llu", host_info64_out, 0xCu);
      unint64_t v6 = *(void *)(a1 + 424);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }
    else
    {
      unint64_t v6 = *(void *)(a1 + 424);
    }
    mach_port_t v7 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v6;
      _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "last_check_pmi_samples_skipped:%llu", host_info64_out, 0xCu);
      unint64_t v8 = *(void *)(a1 + 432);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }
    else
    {
      unint64_t v8 = *(void *)(a1 + 432);
    }
    dispatch_block_t v9 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v8;
      _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "last_check_host_cpu_time_ns:%llu", host_info64_out, 0xCu);
      unint64_t v10 = *(void *)(a1 + 344) - 1;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }
    else
    {
      unint64_t v10 = *(void *)(a1 + 344) - 1;
    }
    int v11 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = v10;
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "current_pmi_samples_recorded:%llu", host_info64_out, 0xCu);
      unint64_t v12 = *(void *)(a1 + 360);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }
    else
    {
      unint64_t v12 = *(void *)(a1 + 360);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_7864();
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      sub_77FC();
      if (!v3) {
        goto LABEL_63;
      }
    }
    else if (!v3)
    {
      goto LABEL_63;
    }
    if (!v8)
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      v13 = &CFDataGetBytePtr_ptr;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
        sub_73B0();
      }
LABEL_44:
      int v14 = 0;
      int v50 = 0;
      int v15 = 0;
      int v55 = 0;
      uint64_t v54 = 0;
      int v53 = 0;
      uint64_t v51 = 0;
      unint64_t v52 = 0;
      unint64_t v16 = 0;
      unsigned int v17 = 0;
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      goto LABEL_45;
    }
LABEL_63:
    unint64_t v48 = v8;
    uint64_t v20 = *(void *)(a1 + 328);
    uint64_t v26 = now_in_absolute_milliseconds();
    uint64_t v27 = *(void *)(a1 + 384);
    if (!v27) {
      uint64_t v27 = *(void *)(*(void *)a1 + 168);
    }
    double v28 = (double)(unint64_t)(v26 - v27) / 1000.0;
    uint64_t v51 = *(void *)(a1 + 392);
    unint64_t v52 = *(void *)(a1 + 400);
    int v53 = *(unsigned __int8 *)(a1 + 408);
    LODWORD(v54) = *(unsigned __int8 *)(a1 + 409);
    HIDWORD(v54) = *(unsigned __int8 *)(a1 + 410);
    int v55 = *(unsigned __int8 *)(a1 + 411);
    uint64_t v18 = (void *)(v10 - v4);
    BOOL v46 = v10 < v4;
    if (v10 >= v4)
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_7794();
      }
      int v50 = 0;
    }
    else
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_772C();
      }
      uint64_t v18 = 0;
      int v50 = 1;
    }
    unint64_t v19 = (unint64_t)v28;
    unsigned int v17 = (char *)(v12 - v6);
    if (v12 >= v6)
    {
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_76C4();
      }
      int v14 = 0;
      if (!v3) {
        goto LABEL_96;
      }
    }
    else
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_765C();
      }
      int v14 = 1;
      BOOL v46 = 1;
      if (!v3) {
        goto LABEL_96;
      }
    }
    if (v3 < v48)
    {
LABEL_96:
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      v13 = &CFDataGetBytePtr_ptr;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
        sub_73E4();
      }
      unint64_t v16 = 0;
      int v15 = 1;
      goto LABEL_45;
    }
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_75F4();
    }
    unint64_t v45 = v3 - v48;
    if (v3 == v48)
    {
      unint64_t v16 = 0;
      if (v46)
      {
LABEL_124:
        int v15 = 0;
LABEL_39:
        v13 = &CFDataGetBytePtr_ptr;
LABEL_45:
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v21 = v13[196];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)host_info64_out = 134221312;
          *(void *)&host_info64_out[4] = v20;
          *(_WORD *)&host_info64_out[12] = 2048;
          *(void *)&host_info64_out[14] = v19;
          *(_WORD *)&host_info64_out[22] = 2048;
          v58 = v18;
          *(_WORD *)unsigned int v59 = 2048;
          *(void *)&v59[2] = v17;
          *(_WORD *)&v59[10] = 2048;
          *(void *)&v59[12] = v16;
          *(_WORD *)&v59[20] = 2048;
          *(void *)&v59[22] = v51;
          *(_WORD *)&v59[30] = 2048;
          unint64_t v60 = v52;
          LOWORD(v61) = 1024;
          *(_DWORD *)((char *)&v61 + 2) = v53;
          HIWORD(v61) = 1024;
          *(_DWORD *)unsigned int v62 = v54;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = HIDWORD(v54);
          __int16 v63 = 1024;
          int v64 = v55;
          __int16 v65 = 1024;
          int v66 = v15;
          __int16 v67 = 1024;
          int v68 = v50;
          __int16 v69 = 1024;
          int v70 = v14;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "PMI telemetry - pmi_interval:%llu time_since_last_adjustment_s:%llus num_pmi_microstackshots_captured:%llu num_pmi_microstackshots_skipped:%llu num_pmi_microstackshots_not_generated:%llu num_pmi_microstackshots_lost:%llu max_num_pmi_microstackshots_lost_at_once:%llu pmi_configuration_failure:%d pmi_microstackshots_wrong_source:%d pmi_microstackshots_wrong_interval:%d pmi_microstackshots_unexpected_configuration_change:%d bad_cpu_time:%d bad_samples_recorded:%d bad_samples_skipped:%d", host_info64_out, 0x72u);
        }
        if (v20)
        {
          *(void *)host_info64_out = _NSConcreteStackBlock;
          *(void *)&host_info64_out[8] = 0x40000000;
          *(void *)&host_info64_out[16] = sub_6330;
          v58 = &unk_C460;
          *(void *)unsigned int v59 = v20;
          *(void *)&v59[8] = v19;
          *(void *)&v59[16] = v18;
          *(void *)&v59[24] = v17;
          unint64_t v60 = v16;
          uint64_t v61 = v51;
          *(void *)unsigned int v62 = v52;
          v62[8] = v53;
          v62[9] = v54;
          LOBYTE(v63) = BYTE4(v54);
          HIBYTE(v63) = v55;
          LOBYTE(v64) = v15;
          BYTE1(v64) = v50;
          HIWORD(v64) = v14;
          analytics_send_event_lazy();
        }
        goto LABEL_51;
      }
    }
    else
    {
      if (qword_C608 != -1) {
        dispatch_once(&qword_C608, &stru_C428);
      }
      double v29 = (double)(v3 - v48) / 1000000000.0 * (double)(unint64_t)qword_C5C8;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_758C();
      }
      if (v46) {
        goto LABEL_136;
      }
      unint64_t v16 = (unint64_t)((double)(unint64_t)v29 * 0.9);
    }
    v49 = &v17[(void)v18];
    if (qword_C600 != -1) {
      dispatch_once(&qword_C600, &stru_C3E8);
    }
    unint64_t v30 = qword_C5F8;
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)host_info64_out = 134217984;
      *(void *)&host_info64_out[4] = &v17[(void)v18];
      _os_log_debug_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "num_pmi_microstackshots_this_check:%llu", host_info64_out, 0xCu);
      unint64_t v31 = v16 / *(void *)(a1 + 328);
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
    }
    else
    {
      unint64_t v31 = v16 / *(void *)(a1 + 328);
    }
    if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
      sub_7524();
    }
    if (v31 < 3)
    {
      unint64_t v32 = v45;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      uint64_t v34 = qword_C5F8;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_74B4(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      unint64_t v47 = 0;
      v13 = &CFDataGetBytePtr_ptr;
    }
    else
    {
      unint64_t v47 = v31 - 2;
      if (qword_C600 != -1) {
        dispatch_once(&qword_C600, &stru_C3E8);
      }
      unint64_t v32 = v45;
      if (os_log_type_enabled((os_log_t)qword_C5F8, OS_LOG_TYPE_DEBUG)) {
        sub_744C();
      }
      unint64_t v16 = v47 - (void)v49;
      v13 = &CFDataGetBytePtr_ptr;
      if (v47 > (unint64_t)v49)
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v33 = qword_C620;
        if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = *(void *)(a1 + 328);
          if (qword_C608 != -1) {
            dispatch_once(&qword_C608, &stru_C428);
          }
          *(_DWORD *)host_info64_out = 134219264;
          *(void *)&host_info64_out[4] = &v17[(void)v18];
          *(_WORD *)&host_info64_out[12] = 2048;
          *(double *)&host_info64_out[14] = (double)v45 / 1000000000.0;
          *(_WORD *)&host_info64_out[22] = 2048;
          v58 = v17;
          *(_WORD *)unsigned int v59 = 2048;
          *(void *)&v59[2] = v47;
          *(_WORD *)&v59[10] = 2048;
          *(void *)&v59[12] = v44;
          *(_WORD *)&v59[20] = 2048;
          *(void *)&v59[22] = qword_C5C8;
          _os_log_error_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "PMI microstackshot count is not at least what is expected: %llu in last %.0fs of cpu time (%llu skipped). Expect at least %llu given interval %llu and minumum cpu cycles per second %llu", host_info64_out, 0x3Eu);
        }
        goto LABEL_124;
      }
    }
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    uint64_t v42 = qword_C620;
    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_INFO))
    {
      int v15 = 0;
      unint64_t v16 = 0;
      goto LABEL_45;
    }
    uint64_t v43 = *(void *)(a1 + 328);
    if (qword_C608 != -1) {
      dispatch_once(&qword_C608, &stru_C428);
    }
    *(_DWORD *)host_info64_out = 134219264;
    *(void *)&host_info64_out[4] = &v17[(void)v18];
    *(_WORD *)&host_info64_out[12] = 2048;
    *(double *)&host_info64_out[14] = (double)v32 / 1000000000.0;
    *(_WORD *)&host_info64_out[22] = 2048;
    v58 = v17;
    *(_WORD *)unsigned int v59 = 2048;
    *(void *)&v59[2] = v47;
    *(_WORD *)&v59[10] = 2048;
    *(void *)&v59[12] = v43;
    *(_WORD *)&v59[20] = 2048;
    *(void *)&v59[22] = qword_C5C8;
    _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "PMI microstackshot count is at least what is expected: %llu in last %.0fs of cpu time (%llu skipped). Expect at least %llu given interval %llu and minumum cpu cycles per second %llu", host_info64_out, 0x3Eu);
LABEL_136:
    int v15 = 0;
    unint64_t v16 = 0;
    goto LABEL_39;
  }
LABEL_51:
  *(void *)(a1 + 392) = 0;
  *(void *)(a1 + 400) = 0;
  *(_DWORD *)(a1 + 408) = 0;
  uint64_t v22 = *(void *)(a1 + 344);
  BOOL v23 = v22 != 0;
  uint64_t v24 = v22 - 1;
  if (!v23) {
    uint64_t v24 = 0;
  }
  uint64_t v25 = *(void *)(a1 + 360);
  *(void *)(a1 + 416) = v24;
  *(void *)(a1 + 424) = v25;
  *(void *)(a1 + 432) = v3;
}

uint64_t sub_5588(void *a1, unint64_t a2, double a3)
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = *(void *)(*(void *)(*a1 + 8) + 32);
  unint64_t v8 = a1[25];
  unint64_t v9 = a1[9];
  uint64_t v11 = a1[55];
  uint64_t v10 = a1[56];
  uint64_t v81 = a1[41];
  uint64_t pmi_cycle_interval = systemstats_get_pmi_cycle_interval();
  unint64_t v13 = v6;
  if (a1[48]) {
    unint64_t v13 = (unint64_t)((double)(unint64_t)(now_in_absolute_milliseconds() - a1[48]) / 1000.0);
  }
  uint64_t v82 = v11;
  if (v6 > 0x15180) {
    BOOL v14 = (double)a2 * 86400.0 / a3 > (double)v7;
  }
  else {
    BOOL v14 = v7 < a2;
  }
  uint64_t v83 = v10;
  if (a1[41])
  {
    if (v14)
    {
      if (qword_C628 != -1) {
        dispatch_once(&qword_C628, &stru_C2E8);
      }
      uint64_t v15 = qword_C620;
      if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
      {
        *(void *)&uint8_t buf[4] = a1[41];
        uint64_t v16 = a1[9];
        *(void *)&buf[64] = a1[8];
        uint64_t v17 = a1[15];
        *(void *)&buf[34] = v16;
        *(void *)&buf[74] = v16;
        uint64_t v18 = a1[17];
        uint64_t v91 = v17;
        uint64_t v95 = v18;
        uint64_t v19 = a1[19];
        uint64_t v97 = a1[18];
        uint64_t v20 = a1[21];
        uint64_t v99 = v19;
        uint64_t v103 = v20;
        uint64_t v21 = a1[23];
        uint64_t v105 = a1[22];
        uint64_t v22 = a1[25];
        uint64_t v107 = v21;
        uint64_t v111 = v22;
        uint64_t v23 = a1[27];
        uint64_t v113 = a1[26];
        uint64_t v115 = v23;
        uint64_t v24 = a1[11];
        *(void *)&buf[84] = a1[10];
        uint64_t v25 = a1[29];
        *(void *)&buf[94] = v24;
        uint64_t v119 = v25;
        uint64_t v26 = a1[31];
        uint64_t v121 = a1[30];
        uint64_t v27 = a1[33];
        uint64_t v123 = v26;
        uint64_t v127 = v27;
        uint64_t v28 = a1[35];
        uint64_t v129 = a1[34];
        uint64_t v131 = v28;
        uint64_t v29 = a1[13];
        unint64_t v85 = a1[12];
        uint64_t v87 = v29;
        uint64_t v89 = a1[14];
        uint64_t v93 = a1[16];
        uint64_t v101 = a1[20];
        uint64_t v109 = a1[24];
        uint64_t v117 = a1[28];
        uint64_t v125 = a1[32];
        *(_WORD *)&buf[12] = 2048;
        *(_WORD *)&buf[22] = 2048;
        *(_WORD *)&buf[32] = 2048;
        *(_WORD *)&buf[42] = 2048;
        *(_WORD *)&buf[52] = 2048;
        *(_WORD *)&buf[62] = 2048;
        *(_WORD *)&buf[72] = 2048;
        *(_WORD *)&buf[82] = 2048;
        *(_WORD *)&buf[92] = 2048;
        *(_WORD *)&buf[102] = 2048;
        __int16 v86 = 2048;
        __int16 v88 = 2048;
        __int16 v90 = 2048;
        __int16 v92 = 2048;
        __int16 v94 = 2048;
        __int16 v96 = 2048;
        __int16 v98 = 2048;
        __int16 v100 = 2048;
        __int16 v102 = 2048;
        __int16 v104 = 2048;
        __int16 v106 = 2048;
        __int16 v108 = 2048;
        __int16 v110 = 2048;
        __int16 v112 = 2048;
        __int16 v114 = 2048;
        __int16 v116 = 2048;
        __int16 v118 = 2048;
        __int16 v120 = 2048;
        __int16 v122 = 2048;
        __int16 v124 = 2048;
        __int16 v126 = 2048;
        __int16 v128 = 2048;
        __int16 v130 = 2048;
        *(_DWORD *)buf = 134226432;
        *(void *)&buf[14] = a2;
        *(void *)&buf[24] = v6;
        *(void *)&buf[44] = v7;
        *(void *)&buf[54] = v13;
        unint64_t v30 = "Microstackshot datarate exceeded daily budget with %llu cycle interval: %llu bytes written over the last %"
              "llus (%llu uncompressed), cleanup quota %llu, last adjustment %llus ago\n"
              "total     count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "interrupt count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "timer     count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "io        count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "pmi       count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "macf      count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n"
              "\n"
              "unknown   count         %llu\n"
              "          size          %llu\n"
              "          num_loadinfos %llu\n"
              "          num_frames    %llu\n";
        unint64_t v31 = v15;
        uint32_t v32 = 342;
LABEL_17:
        _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
        goto LABEL_27;
      }
      goto LABEL_29;
    }
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    uint64_t v47 = qword_C620;
    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(void *)&uint8_t buf[4] = a1[41];
    uint64_t v48 = a1[9];
    *(void *)&buf[64] = a1[8];
    uint64_t v49 = a1[15];
    *(void *)&buf[34] = v48;
    *(void *)&buf[74] = v48;
    uint64_t v50 = a1[17];
    uint64_t v91 = v49;
    uint64_t v95 = v50;
    uint64_t v51 = a1[19];
    uint64_t v97 = a1[18];
    uint64_t v52 = a1[21];
    uint64_t v99 = v51;
    uint64_t v103 = v52;
    uint64_t v53 = a1[23];
    uint64_t v105 = a1[22];
    uint64_t v54 = a1[25];
    uint64_t v107 = v53;
    uint64_t v111 = v54;
    uint64_t v55 = a1[27];
    uint64_t v113 = a1[26];
    uint64_t v115 = v55;
    uint64_t v56 = a1[11];
    *(void *)&buf[84] = a1[10];
    uint64_t v57 = a1[29];
    *(void *)&buf[94] = v56;
    uint64_t v119 = v57;
    uint64_t v58 = a1[31];
    uint64_t v121 = a1[30];
    uint64_t v59 = a1[33];
    uint64_t v123 = v58;
    uint64_t v127 = v59;
    uint64_t v60 = a1[35];
    uint64_t v129 = a1[34];
    uint64_t v131 = v60;
    uint64_t v61 = a1[13];
    unint64_t v85 = a1[12];
    uint64_t v87 = v61;
    uint64_t v89 = a1[14];
    uint64_t v93 = a1[16];
    uint64_t v101 = a1[20];
    uint64_t v109 = a1[24];
    uint64_t v117 = a1[28];
    uint64_t v125 = a1[32];
    *(_WORD *)&buf[12] = 2048;
    *(_WORD *)&buf[22] = 2048;
    *(_WORD *)&buf[32] = 2048;
    *(_WORD *)&buf[42] = 2048;
    *(_WORD *)&buf[52] = 2048;
    *(_WORD *)&buf[62] = 2048;
    *(_WORD *)&buf[72] = 2048;
    *(_WORD *)&buf[82] = 2048;
    *(_WORD *)&buf[92] = 2048;
    *(_WORD *)&buf[102] = 2048;
    __int16 v86 = 2048;
    __int16 v88 = 2048;
    __int16 v90 = 2048;
    __int16 v92 = 2048;
    __int16 v94 = 2048;
    __int16 v96 = 2048;
    __int16 v98 = 2048;
    __int16 v100 = 2048;
    __int16 v102 = 2048;
    __int16 v104 = 2048;
    __int16 v106 = 2048;
    __int16 v108 = 2048;
    __int16 v110 = 2048;
    __int16 v112 = 2048;
    __int16 v114 = 2048;
    __int16 v116 = 2048;
    __int16 v118 = 2048;
    __int16 v120 = 2048;
    __int16 v122 = 2048;
    __int16 v124 = 2048;
    __int16 v126 = 2048;
    __int16 v128 = 2048;
    __int16 v130 = 2048;
    *(_DWORD *)buf = 134226432;
    *(void *)&buf[14] = a2;
    *(void *)&buf[24] = v6;
    *(void *)&buf[44] = v7;
    *(void *)&buf[54] = v13;
    unsigned int v62 = "Microstackshot datarate did not exceed daily budget with %llu cycle interval: %llu bytes written over the last"
          " %llus (%llu uncompressed), cleanup quota %llu, last adjustment %llus ago\n"
          "total     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "interrupt count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "timer     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "io        count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "pmi       count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "macf      count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "unknown   count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n";
    __int16 v63 = v47;
    uint32_t v64 = 342;
LABEL_26:
    _os_log_impl(&dword_0, v63, OS_LOG_TYPE_DEFAULT, v62, buf, v64);
LABEL_27:
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    goto LABEL_29;
  }
  if (!v14)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    uint64_t v65 = qword_C620;
    if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    uint64_t v66 = a1[8];
    *(void *)&buf[24] = a1[9];
    *(void *)&buf[44] = v66;
    *(void *)&buf[54] = *(void *)&buf[24];
    uint64_t v67 = a1[11];
    *(void *)&buf[64] = a1[10];
    uint64_t v68 = a1[17];
    *(void *)&buf[74] = v67;
    uint64_t v69 = a1[19];
    uint64_t v91 = v68;
    uint64_t v95 = v69;
    uint64_t v70 = a1[21];
    uint64_t v97 = a1[20];
    uint64_t v71 = a1[23];
    uint64_t v99 = v70;
    uint64_t v103 = v71;
    uint64_t v72 = a1[25];
    uint64_t v105 = a1[24];
    uint64_t v73 = a1[27];
    uint64_t v107 = v72;
    uint64_t v111 = v73;
    uint64_t v74 = a1[29];
    uint64_t v113 = a1[28];
    uint64_t v115 = v74;
    uint64_t v75 = a1[13];
    *(void *)&buf[84] = a1[12];
    uint64_t v76 = a1[31];
    *(void *)&buf[94] = v75;
    uint64_t v119 = v76;
    uint64_t v77 = a1[33];
    uint64_t v121 = a1[32];
    uint64_t v123 = v77;
    uint64_t v127 = a1[35];
    uint64_t v78 = a1[15];
    unint64_t v85 = a1[14];
    uint64_t v87 = v78;
    uint64_t v89 = a1[16];
    uint64_t v93 = a1[18];
    uint64_t v101 = a1[22];
    uint64_t v109 = a1[26];
    uint64_t v117 = a1[30];
    uint64_t v125 = a1[34];
    *(_WORD *)&buf[12] = 2048;
    *(_WORD *)&buf[22] = 2048;
    *(_WORD *)&buf[32] = 2048;
    *(_WORD *)&buf[42] = 2048;
    *(_WORD *)&buf[52] = 2048;
    *(_WORD *)&buf[62] = 2048;
    *(_WORD *)&buf[72] = 2048;
    *(_WORD *)&buf[82] = 2048;
    *(_WORD *)&buf[92] = 2048;
    *(_WORD *)&buf[102] = 2048;
    __int16 v86 = 2048;
    __int16 v88 = 2048;
    __int16 v90 = 2048;
    __int16 v92 = 2048;
    __int16 v94 = 2048;
    __int16 v96 = 2048;
    __int16 v98 = 2048;
    __int16 v100 = 2048;
    __int16 v102 = 2048;
    __int16 v104 = 2048;
    __int16 v106 = 2048;
    __int16 v108 = 2048;
    __int16 v110 = 2048;
    __int16 v112 = 2048;
    __int16 v114 = 2048;
    __int16 v116 = 2048;
    __int16 v118 = 2048;
    __int16 v120 = 2048;
    __int16 v122 = 2048;
    __int16 v124 = 2048;
    __int16 v126 = 2048;
    *(_DWORD *)buf = 134225920;
    *(void *)&uint8_t buf[4] = a2;
    *(void *)&buf[14] = v6;
    *(void *)&buf[34] = v7;
    unsigned int v62 = "Microstackshot datarate did not exceed daily budget without PMI microstackshots: %llu bytes written over the l"
          "ast %llus (%llu uncompressed), cleanup quota %llu\n"
          "total     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "interrupt count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "timer     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "io        count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "pmi       count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "macf      count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "unknown   count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n";
    __int16 v63 = v65;
    uint32_t v64 = 322;
    goto LABEL_26;
  }
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  uint64_t v33 = qword_C620;
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = a1[8];
    *(void *)&buf[24] = a1[9];
    *(void *)&buf[44] = v34;
    *(void *)&buf[54] = *(void *)&buf[24];
    uint64_t v35 = a1[11];
    *(void *)&buf[64] = a1[10];
    uint64_t v36 = a1[17];
    *(void *)&buf[74] = v35;
    uint64_t v37 = a1[19];
    uint64_t v91 = v36;
    uint64_t v95 = v37;
    uint64_t v38 = a1[21];
    uint64_t v97 = a1[20];
    uint64_t v39 = a1[23];
    uint64_t v99 = v38;
    uint64_t v103 = v39;
    uint64_t v40 = a1[25];
    uint64_t v105 = a1[24];
    uint64_t v41 = a1[27];
    uint64_t v107 = v40;
    uint64_t v111 = v41;
    uint64_t v42 = a1[29];
    uint64_t v113 = a1[28];
    uint64_t v115 = v42;
    uint64_t v43 = a1[13];
    *(void *)&buf[84] = a1[12];
    uint64_t v44 = a1[31];
    *(void *)&buf[94] = v43;
    uint64_t v119 = v44;
    uint64_t v45 = a1[33];
    uint64_t v121 = a1[32];
    uint64_t v123 = v45;
    uint64_t v127 = a1[35];
    uint64_t v46 = a1[15];
    unint64_t v85 = a1[14];
    uint64_t v87 = v46;
    uint64_t v89 = a1[16];
    uint64_t v93 = a1[18];
    uint64_t v101 = a1[22];
    uint64_t v109 = a1[26];
    uint64_t v117 = a1[30];
    uint64_t v125 = a1[34];
    *(_WORD *)&buf[12] = 2048;
    *(_WORD *)&buf[22] = 2048;
    *(_WORD *)&buf[32] = 2048;
    *(_WORD *)&buf[42] = 2048;
    *(_WORD *)&buf[52] = 2048;
    *(_WORD *)&buf[62] = 2048;
    *(_WORD *)&buf[72] = 2048;
    *(_WORD *)&buf[82] = 2048;
    *(_WORD *)&buf[92] = 2048;
    *(_WORD *)&buf[102] = 2048;
    __int16 v86 = 2048;
    __int16 v88 = 2048;
    __int16 v90 = 2048;
    __int16 v92 = 2048;
    __int16 v94 = 2048;
    __int16 v96 = 2048;
    __int16 v98 = 2048;
    __int16 v100 = 2048;
    __int16 v102 = 2048;
    __int16 v104 = 2048;
    __int16 v106 = 2048;
    __int16 v108 = 2048;
    __int16 v110 = 2048;
    __int16 v112 = 2048;
    __int16 v114 = 2048;
    __int16 v116 = 2048;
    __int16 v118 = 2048;
    __int16 v120 = 2048;
    __int16 v122 = 2048;
    __int16 v124 = 2048;
    __int16 v126 = 2048;
    *(_DWORD *)buf = 134225920;
    *(void *)&uint8_t buf[4] = a2;
    *(void *)&buf[14] = v6;
    *(void *)&buf[34] = v7;
    unint64_t v30 = "Microstackshot datarate exceeded daily budget without PMI microstackshots: %llu bytes written over the last %l"
          "lus (%llu uncompressed), cleanup quota %llu\n"
          "total     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "interrupt count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "timer     count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "io        count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "pmi       count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "macf      count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n"
          "\n"
          "unknown   count         %llu\n"
          "          size          %llu\n"
          "          num_loadinfos %llu\n"
          "          num_frames    %llu\n";
    unint64_t v31 = v33;
    uint32_t v32 = 322;
    goto LABEL_17;
  }
LABEL_29:
  v79 = qword_C620;
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67111424;
    *(_DWORD *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a2;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2048;
    *(double *)&buf[40] = (double)v8 / (double)v9;
    *(_WORD *)&buf[48] = 2048;
    *(void *)&buf[50] = v83;
    *(_WORD *)&buf[58] = 2048;
    *(void *)&buf[60] = v82;
    *(_WORD *)&buf[68] = 2048;
    *(void *)&buf[70] = v81;
    *(_WORD *)&buf[78] = 2048;
    *(void *)&buf[80] = pmi_cycle_interval;
    *(_WORD *)&buf[88] = 2048;
    *(void *)&buf[90] = v13;
    _os_log_impl(&dword_0, v79, OS_LOG_TYPE_DEFAULT, "Quota telemetry - exceeded_quota:%d quota:%llu bytes_written:%llu time_since_last_cleanup_s:%llus ratio_pmi:%.2f num_interval_increases:%llu num_interval_decreases:%llu ending_pmi_interval:%llu default_pmi_interval:%llu time_since_last_adjustment_s:%llus", buf, 0x62u);
  }
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 0x40000000;
  *(void *)&uint8_t buf[16] = sub_64D4;
  *(void *)&buf[24] = &unk_C480;
  *(void *)&buf[32] = v14;
  *(void *)&buf[40] = v7;
  *(void *)&buf[48] = a2;
  *(void *)&buf[56] = v6;
  *(double *)&buf[64] = (double)v8 / (double)v9;
  *(void *)&buf[72] = v83;
  *(void *)&buf[80] = v82;
  *(void *)&buf[88] = v81;
  *(void *)&buf[96] = pmi_cycle_interval;
  unint64_t v85 = v13;
  return analytics_send_event_lazy();
}

void sub_5F38(id a1)
{
  qword_C5F8 = (uint64_t)os_log_create("com.apple.systemstats", "internal_calculations");
}

void sub_5F68(id a1)
{
  if (snprintf(__str, 0x80uLL, "%s%s", "IODeviceTree", ":/arm-io/pmgr") >= 0x81)
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
      sub_799C();
    }
    return;
  }
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (v1)
  {
    io_registry_entry_t v2 = v1;
    uint64_t v3 = 0;
    unsigned int v4 = 0;
    while (1)
    {
      CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v2, off_C448[v3], kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        CFDataRef v6 = CFProperty;
        unsigned int v7 = *(_DWORD *)CFDataGetBytePtr(CFProperty);
        CFRelease(v6);
        if (v7)
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          unint64_t v8 = qword_C620;
          unsigned int v9 = 0x3E80000 / v7;
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v15 = v3;
            __int16 v16 = 1024;
            unsigned int v17 = v9;
            _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "Min cpu %zu frequency is %dMHz", buf, 0x12u);
          }
          if (v4 - 1 >= v9) {
            unsigned int v4 = v9;
          }
          goto LABEL_23;
        }
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v13 = qword_C620;
        if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v3;
        uint64_t v11 = v13;
        unint64_t v12 = "Unable to determine min cpu %zu frequency (4)";
      }
      else
      {
        if (qword_C628 != -1) {
          dispatch_once(&qword_C628, &stru_C2E8);
        }
        uint64_t v10 = qword_C620;
        if (!os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v3;
        uint64_t v11 = v10;
        unint64_t v12 = "Unable to determine min cpu %zu frequency (3)";
      }
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, v12, buf, 0xCu);
LABEL_23:
      if (++v3 == 3)
      {
        IOObjectRelease(v2);
        if (v4)
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
            sub_7A38();
          }
          qword_C5C8 = 1000000 * v4;
        }
        else
        {
          if (qword_C628 != -1) {
            dispatch_once(&qword_C628, &stru_C2E8);
          }
          if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
            sub_7A04();
          }
        }
        return;
      }
    }
  }
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_ERROR)) {
    sub_79D0();
  }
}

void *sub_6330(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "num_pmi_microstackshots_captured", *(void *)(a1 + 48));
    xpc_dictionary_set_uint64(v3, "num_pmi_microstackshots_skipped", *(void *)(a1 + 56));
    xpc_dictionary_set_uint64(v3, "num_pmi_microstackshots_not_generated", *(void *)(a1 + 64));
    xpc_dictionary_set_uint64(v3, "num_pmi_microstackshots_lost", *(void *)(a1 + 72));
    xpc_dictionary_set_uint64(v3, "max_num_pmi_microstackshots_lost_at_once", *(void *)(a1 + 80));
    xpc_dictionary_set_uint64(v3, "pmi_interval", *(void *)(a1 + 32));
    xpc_dictionary_set_uint64(v3, "time_since_last_adjustment", *(void *)(a1 + 40));
    xpc_dictionary_set_BOOL(v3, "pmi_configuration_failure", *(unsigned char *)(a1 + 88));
    xpc_dictionary_set_BOOL(v3, "pmi_microstackshots_wrong_source", *(unsigned char *)(a1 + 89));
    xpc_dictionary_set_BOOL(v3, "pmi_microstackshots_wrong_interval", *(unsigned char *)(a1 + 90));
    xpc_dictionary_set_BOOL(v3, "pmi_microstackshots_unexpected_configuration_change", *(unsigned char *)(a1 + 91));
    xpc_dictionary_set_BOOL(v3, "bad_cpu_time", *(unsigned char *)(a1 + 92));
    xpc_dictionary_set_BOOL(v3, "bad_samples_recorded", *(unsigned char *)(a1 + 93));
    xpc_dictionary_set_BOOL(v3, "bad_samples_skipped", *(unsigned char *)(a1 + 94));
  }
  else
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
      sub_7AAC();
    }
  }
  return v3;
}

void *sub_64D4(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_string(v2, "type", "pmi");
    xpc_dictionary_set_BOOL(v3, "exceeded_quota", *(unsigned char *)(a1 + 32));
    xpc_dictionary_set_uint64(v3, "bytes_written", *(void *)(a1 + 48));
    xpc_dictionary_set_uint64(v3, "cleanup_quota", *(void *)(a1 + 40));
    xpc_dictionary_set_double(v3, "time_since_last_cleanup", (double)*(unint64_t *)(a1 + 56));
    xpc_dictionary_set_uint64(v3, "default_interval", *(void *)(a1 + 96));
    xpc_dictionary_set_uint64(v3, "ending_interval", *(void *)(a1 + 88));
    xpc_dictionary_set_uint64(v3, "num_interval_increases", *(void *)(a1 + 72));
    xpc_dictionary_set_uint64(v3, "num_interval_decreases", *(void *)(a1 + 80));
    xpc_dictionary_set_uint64(v3, "time_since_last_adjustment", *(void *)(a1 + 104));
    xpc_dictionary_set_double(v3, "ratio_pmi", *(double *)(a1 + 64));
  }
  else
  {
    if (qword_C628 != -1) {
      dispatch_once(&qword_C628, &stru_C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_FAULT)) {
      sub_7AE0();
    }
  }
  return v3;
}

void sub_6644(uint64_t a1)
{
}

void sub_664C(uint64_t a1)
{
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  if (os_log_type_enabled((os_log_t)qword_C620, OS_LOG_TYPE_DEBUG)) {
    sub_7B14();
  }
  sub_4298(a1);
  sub_42E0(a1, 0);
}

void sub_66CC(uint64_t a1)
{
}

unint64_t sub_66D4(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 322))
  {
    unint64_t v2 = systemstats_mach_continuous_time();
    if (v2 <= *(void *)(v1 + 8) || (uint64_t result = absolute_time_to_absolute_milliseconds(), result >> 3 >= 0x271))
    {
      sub_F50(v1, 1);
      *(void *)(v1 + 8) = v2;
      return notify_post("com.apple.telemetry.immediate-done");
    }
  }
  return result;
}

void sub_6754(uint64_t a1)
{
}

uint64_t sub_675C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 320) = 0;
  return result;
}

void sub_6768(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_6790(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_67B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_67D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_6824(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

BOOL sub_6844()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG);
}

void sub_685C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_6878(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_689C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void sub_68BC()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "Telemetry plugin notified of first unlock", v2, v3, v4, v5, v6);
}

void sub_68F0()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "No-op: Telemetry plugin is already initialized.", v2, v3, v4, v5, v6);
}

void sub_6924()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "drain_kernel_microstackshot_buffer called without persistence active, ignoring", v2, v3, v4, v5, v6);
}

void sub_6958()
{
  sub_6890();
  sub_6878(&dword_0, v0, v1, "__microstackshot returned invalid buffer of size: %d", v2);
}

void sub_69C4()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "PMI adjustment: Microstackshot persistence not allowed, not checking daily budget", v2, v3, v4, v5, v6);
}

void sub_69F8()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "PMI adjustment: Microstackshot pmi disabled, not checking daily budget", v2, v3, v4, v5, v6);
}

void sub_6A2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6A9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6B0C()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "projected_nonpmi_remaining_compressed_bytes_written_in_the_day:%llu", v2, v3, v4, v5, v6);
}

uint64_t sub_6B74()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "target_remaining_all_compressed_bytes_written_in_the_day:%llu", v2, v3, v4, v5, v7);
  if (qword_C600 == -1) {
    return 1;
  }
  dispatch_once(&qword_C600, &stru_C3E8);
  return 0;
}

void sub_6C0C(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0x3FEE666666666666;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "target_all_compressed_bytes:%llu target_ratio:%.2f", (uint8_t *)&v2, 0x16u);
}

void sub_6C98()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "projected_all_compressed_bytes_written_in_the_day:%llu", v2, v3, v4, v5, v6);
}

void sub_6D00()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "pmi_uncompressed_bytes_written_since_last_adjustment:%llu", v2, v3, v4, v5, v6);
}

void sub_6D68()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "pmi_uncompressed_bytes_written_since_last_cleanup:%llu", v2, v3, v4, v5, v6);
}

void sub_6DD0()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "all_uncompressed_bytes_written_since_last_adjustment:%llu", v2, v3, v4, v5, v6);
}

void sub_6E38()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "all_uncompressed_bytes_written_since_last_cleanup:%llu", v2, v3, v4, v5, v6);
}

void sub_6EA0()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "drain_kernel_microstackshot_buffer should coalesce, ignoring", v2, v3, v4, v5, v6);
}

void sub_6ED4()
{
  sub_6784();
  sub_67D0(&dword_0, v0, v1, "Unable to create microstackshot stream", v2, v3, v4, v5, v6);
}

void sub_6F08()
{
  sub_6784();
  sub_67D0(&dword_0, v0, v1, "Unable to create microstackshot buffer", v2, v3, v4, v5, v6);
}

void sub_6F3C()
{
  sub_6784();
  sub_67D0(&dword_0, v0, v1, "Unable to install microstackshot highwatermark handler", v2, v3, v4, v5, v6);
}

uint64_t sub_6F70()
{
  _os_assumes_log();
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  v0 = qword_C620;
  if (!sub_6844()) {
    return 1;
  }
  *(_WORD *)uint64_t v3 = 0;
  sub_67B8(&dword_0, v0, v1, "failed to set context for inbound notifications on the mach port", v3);
  return 0;
}

uint64_t sub_7000()
{
  _os_assumes_log();
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  v0 = qword_C620;
  if (!sub_6844()) {
    return 1;
  }
  *(_WORD *)uint64_t v3 = 0;
  sub_67B8(&dword_0, v0, v1, "failed to bind host special port", v3);
  return 0;
}

uint64_t sub_7090()
{
  _os_assumes_log();
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  v0 = qword_C620;
  if (!sub_6844()) {
    return 1;
  }
  *(_WORD *)uint64_t v3 = 0;
  sub_67B8(&dword_0, v0, v1, "failed to insert send right", v3);
  return 0;
}

uint64_t sub_7120()
{
  _os_assumes_log();
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  v0 = qword_C620;
  if (!sub_6844()) {
    return 1;
  }
  *(_WORD *)uint64_t v3 = 0;
  sub_67B8(&dword_0, v0, v1, "failed to allocate a mach port", v3);
  return 0;
}

void sub_71B0(NSObject *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_6878(&dword_0, a1, v3, "__telemetry returned error: %{errno}d", (uint8_t *)v4);
}

void sub_7238(NSObject *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_6878(&dword_0, a1, v3, "__telemetry off returned error: %{errno}d", (uint8_t *)v4);
}

void sub_72C0()
{
  _os_assumes_log();
  if (qword_C628 != -1) {
    dispatch_once(&qword_C628, &stru_C2E8);
  }
  v0 = qword_C620;
  if (sub_6844())
  {
    *(_WORD *)int v2 = 0;
    sub_67B8(&dword_0, v0, v1, "failed to set context for inbound notifications on the mach port", v2);
  }
}

void sub_7348()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "PMI microstackshots not enabled", v2, v3, v4, v5, v6);
}

void sub_737C()
{
  sub_6784();
  sub_67D0(&dword_0, v0, v1, "Not expecting a pmi sample", v2, v3, v4, v5, v6);
}

void sub_73B0()
{
  sub_6784();
  sub_685C(&dword_0, v0, v1, "last_check_host_cpu_time_ns cleared", v2, v3, v4, v5, v6);
}

void sub_73E4()
{
  sub_67EC();
  sub_6824(&dword_0, v0, v1, "host_cpu_time_ns went backwards %llu -> %llu", v2, v3);
}

void sub_744C()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "min_num_pmi_microstackshots_expected (adjusted):%llu", v2, v3, v4, v5, v6);
}

void sub_74B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7524()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "min_num_pmi_microstackshots_expected:%llu", v2, v3, v4, v5, v6);
}

void sub_758C()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "min_delta_host_cpu_cycles:%llu", v2, v3, v4, v5, v6);
}

void sub_75F4()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "delta_host_cpu_time_ns:%llu", v2, v3, v4, v5, v6);
}

void sub_765C()
{
  sub_67EC();
  sub_6824(&dword_0, v0, v1, "pmi_samples_skipped went backwards %llu -> %llu", v2, v3);
}

void sub_76C4()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "delta_pmi_samples_skipped:%llu", v2, v3, v4, v5, v6);
}

void sub_772C()
{
  sub_67EC();
  sub_6824(&dword_0, v0, v1, "pmi_samples_recorded went backwards %llu -> %llu", v2, v3);
}

void sub_7794()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "delta_pmi_samples_recorded:%llu", v2, v3, v4, v5, v6);
}

void sub_77FC()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "current_host_cpu_time_ns:%llu", v2, v3, v4, v5, v6);
}

uint64_t sub_7864()
{
  sub_67AC();
  sub_6768(&dword_0, v0, v1, "current_pmi_samples_skipped:%llu", v2, v3, v4, v5, v7);
  if (qword_C600 == -1) {
    return 1;
  }
  dispatch_once(&qword_C600, &stru_C3E8);
  return 0;
}

void sub_78FC()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "checking for missing microstackhots", v2, v3, v4, v5, v6);
}

void sub_7930()
{
  sub_6890();
  sub_6878(&dword_0, v0, v1, "Unable to get system cpu time: %d", v2);
}

void sub_799C()
{
  sub_6784();
  sub_67D0(&dword_0, v0, v1, "Unable to determine min cpu frequency (1), assuming 600MHz", v2, v3, v4, v5, v6);
}

void sub_79D0()
{
  sub_6784();
  sub_67D0(&dword_0, v0, v1, "Unable to determine min cpu frequency (2), assuming 600MHz", v2, v3, v4, v5, v6);
}

void sub_7A04()
{
  sub_6784();
  sub_67D0(&dword_0, v0, v1, "Unable to determine min cpu frequency (5), assuming 600MHz", v2, v3, v4, v5, v6);
}

void sub_7A38()
{
  sub_6890();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Min cpu frequency for all CPUs is %dMHz", v1, 8u);
}

void sub_7AAC()
{
  sub_6784();
  sub_685C(&dword_0, v0, v1, "failed to allocate xpc dict for com.apple.microstackshots.pmiStats", v2, v3, v4, v5, v6);
}

void sub_7AE0()
{
  sub_6784();
  sub_685C(&dword_0, v0, v1, "failed to allocate xpc dict for com.apple.microstackshots.diskQuota", v2, v3, v4, v5, v6);
}

void sub_7B14()
{
  sub_6784();
  sub_6790(&dword_0, v0, v1, "Refreshing preferences.", v2, v3, v4, v5, v6);
}

void sub_7B48()
{
  sub_6804();
  sub_689C(&dword_0, v0, v1, "non-PMI microstackshot 0x%x @ %llu.%0llu - known duplicate", v2, v3, v4);
}

void sub_7BB8()
{
  sub_6804();
  sub_689C(&dword_0, v0, v1, "non-PMI microstackshot 0x%x @ %llu.%0llu", v2, v3, v4);
}

void sub_7C28()
{
  sub_67AC();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Lost %llu PMI microstackshots", v1, 0xCu);
}

void sub_7C9C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 328);
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Wrong microstackshot interval %llu, should be %llu", (uint8_t *)&v4, 0x16u);
}

void sub_7D2C()
{
  sub_6890();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Wrong microstackshot source %d", v1, 8u);
}

void sub_7DA0(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(_DWORD *)(*(void *)a1 + 352);
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "generation incremented unexpectedly %u -> %u, but settings are correct", (uint8_t *)v4, 0xEu);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTimeInterval IOPSGetTimeRemainingEstimate(void)
{
  return _IOPSGetTimeRemainingEstimate();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __microstackshot()
{
  return ___microstackshot();
}

uint64_t __telemetry()
{
  return ___telemetry();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
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

uint64_t _systemstats_boot()
{
  return __systemstats_boot();
}

uint64_t _systemstats_stream_create()
{
  return __systemstats_stream_create();
}

uint64_t absolute_time_to_absolute_milliseconds()
{
  return _absolute_time_to_absolute_milliseconds();
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

kern_return_t host_set_special_port(host_priv_t host_priv, int which, mach_port_t port)
{
  return _host_set_special_port(host_priv, which, port);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return _host_statistics64(host_priv, flavor, host_info64_out, host_info64_outCnt);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server_once(a1, a2, a3, a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_get_context(ipc_space_read_t task, mach_port_name_t name, mach_port_context_t *context)
{
  return _mach_port_get_context(task, name, context);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_set_context(ipc_space_t task, mach_port_name_t name, mach_port_context_t context)
{
  return _mach_port_set_context(task, name, context);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_resume(int token)
{
  return _notify_resume(token);
}

uint32_t notify_suspend(int token)
{
  return _notify_suspend(token);
}

uint64_t now_in_absolute_milliseconds()
{
  return _now_in_absolute_milliseconds();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

uint64_t systemstats_foreach_micro()
{
  return _systemstats_foreach_micro();
}

uint64_t systemstats_get_pmi_cycle_interval()
{
  return _systemstats_get_pmi_cycle_interval();
}

uint64_t systemstats_mach_continuous_time()
{
  return _systemstats_mach_continuous_time();
}

uint64_t systemstats_persistence_is_allowed()
{
  return _systemstats_persistence_is_allowed();
}

uint64_t systemstats_stream_delete()
{
  return _systemstats_stream_delete();
}

uint64_t systemstats_stream_flush()
{
  return _systemstats_stream_flush();
}

uint64_t systemstats_unlink_if_present()
{
  return _systemstats_unlink_if_present();
}

uint64_t systemstats_write_microstackshot()
{
  return _systemstats_write_microstackshot();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}