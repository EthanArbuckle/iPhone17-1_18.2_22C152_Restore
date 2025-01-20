@interface MetricsModule
+ (APMetricReceiving)storage;
+ (void)_setupDefaultRoutes;
+ (void)clearStorage;
+ (void)rotateIdentifiers;
+ (void)setup;
+ (void)start;
@end

@implementation MetricsModule

+ (void)_setupDefaultRoutes
{
  v202[0] = @"name";
  v202[1] = @"purpose";
  v203[0] = @"EC";
  v203[1] = &off_100249E78;
  v203[2] = @"ECRouter";
  v202[2] = @"dest";
  v202[3] = @"metrics";
  v200[0] = @"received";
  CFStringRef v198 = @"value";
  v199 = &off_100249E90;
  v81 = +[NSDictionary dictionaryWithObjects:&v199 forKeys:&v198 count:1];
  v201[0] = v81;
  v200[1] = @"daemon_discarded";
  CFStringRef v196 = @"value";
  v197 = &off_100249EA8;
  v79 = +[NSDictionary dictionaryWithObjects:&v197 forKeys:&v196 count:1];
  v201[1] = v79;
  v200[2] = @"conversion";
  CFStringRef v194 = @"value";
  v195 = &off_100249EC0;
  v77 = +[NSDictionary dictionaryWithObjects:&v195 forKeys:&v194 count:1];
  v201[2] = v77;
  v200[3] = @"downloaded";
  CFStringRef v192 = @"value";
  v193 = &off_100249ED8;
  v76 = +[NSDictionary dictionaryWithObjects:&v193 forKeys:&v192 count:1];
  v201[3] = v76;
  v200[4] = @"request_failed";
  CFStringRef v190 = @"value";
  v191 = &off_100249EF0;
  v75 = +[NSDictionary dictionaryWithObjects:&v191 forKeys:&v190 count:1];
  v201[4] = v75;
  v200[5] = @"delivered";
  CFStringRef v188 = @"value";
  v189 = &off_100249F08;
  v74 = +[NSDictionary dictionaryWithObjects:&v189 forKeys:&v188 count:1];
  v201[5] = v74;
  v200[6] = @"discarded";
  CFStringRef v186 = @"value";
  v187 = &off_100249F20;
  v73 = +[NSDictionary dictionaryWithObjects:&v187 forKeys:&v186 count:1];
  v201[6] = v73;
  v200[7] = @"not_consumed";
  CFStringRef v184 = @"value";
  v185 = &off_100249F38;
  v72 = +[NSDictionary dictionaryWithObjects:&v185 forKeys:&v184 count:1];
  v201[7] = v72;
  v200[8] = @"unused";
  CFStringRef v182 = @"value";
  v183 = &off_100249F50;
  v71 = +[NSDictionary dictionaryWithObjects:&v183 forKeys:&v182 count:1];
  v201[8] = v71;
  v200[9] = @"created";
  CFStringRef v180 = @"value";
  v181 = &off_100249F68;
  v70 = +[NSDictionary dictionaryWithObjects:&v181 forKeys:&v180 count:1];
  v201[9] = v70;
  v200[10] = @"replaced";
  CFStringRef v178 = @"value";
  v179 = &off_100249F80;
  v69 = +[NSDictionary dictionaryWithObjects:&v179 forKeys:&v178 count:1];
  v201[10] = v69;
  v200[11] = @"loaded";
  CFStringRef v176 = @"value";
  v177 = &off_100249F98;
  v68 = +[NSDictionary dictionaryWithObjects:&v177 forKeys:&v176 count:1];
  v201[11] = v68;
  v200[12] = @"placed";
  CFStringRef v174 = @"value";
  v175 = &off_100249FB0;
  v67 = +[NSDictionary dictionaryWithObjects:&v175 forKeys:&v174 count:1];
  v201[12] = v67;
  v200[13] = @"ready";
  CFStringRef v172 = @"value";
  v173 = &off_100249FC8;
  v66 = +[NSDictionary dictionaryWithObjects:&v173 forKeys:&v172 count:1];
  v201[13] = v66;
  v200[14] = @"on_screen";
  CFStringRef v170 = @"value";
  v171 = &off_100249FE0;
  v65 = +[NSDictionary dictionaryWithObjects:&v171 forKeys:&v170 count:1];
  v201[14] = v65;
  v200[15] = @"visible";
  CFStringRef v168 = @"value";
  v169 = &off_100249FF8;
  v64 = +[NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];
  v201[15] = v64;
  v200[16] = @"off_screen";
  CFStringRef v166 = @"value";
  v167 = &off_10024A010;
  v63 = +[NSDictionary dictionaryWithObjects:&v167 forKeys:&v166 count:1];
  v201[16] = v63;
  v200[17] = @"interacted";
  CFStringRef v164 = @"value";
  v165 = &off_10024A028;
  v62 = +[NSDictionary dictionaryWithObjects:&v165 forKeys:&v164 count:1];
  v201[17] = v62;
  v200[18] = @"quick_return";
  CFStringRef v162 = @"value";
  v163 = &off_10024A040;
  v61 = +[NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];
  v201[18] = v61;
  v200[19] = @"ad_marker_interacted";
  CFStringRef v160 = @"value";
  v161 = &off_10024A058;
  v60 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
  v201[19] = v60;
  v200[20] = @"get_app";
  CFStringRef v158 = @"value";
  v159 = &off_10024A070;
  v59 = +[NSDictionary dictionaryWithObjects:&v159 forKeys:&v158 count:1];
  v201[20] = v59;
  v200[21] = @"unloaded";
  CFStringRef v156 = @"value";
  v157 = &off_10024A088;
  v58 = +[NSDictionary dictionaryWithObjects:&v157 forKeys:&v156 count:1];
  v201[21] = v58;
  v200[22] = @"media_loaded";
  CFStringRef v154 = @"value";
  v155 = &off_10024A0A0;
  v57 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
  v201[22] = v57;
  v200[23] = @"video_chosen";
  CFStringRef v152 = @"value";
  v153 = &off_10024A0B8;
  v56 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
  v201[23] = v56;
  v200[24] = @"media_played";
  CFStringRef v150 = @"value";
  v151 = &off_10024A0D0;
  v55 = +[NSDictionary dictionaryWithObjects:&v151 forKeys:&v150 count:1];
  v201[24] = v55;
  v200[25] = @"media_paused";
  CFStringRef v148 = @"value";
  v149 = &off_10024A0E8;
  v54 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
  v201[25] = v54;
  v200[26] = @"media_skipped";
  CFStringRef v146 = @"value";
  v147 = &off_10024A100;
  v53 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
  v201[26] = v53;
  v200[27] = @"media_volume_changed";
  CFStringRef v144 = @"value";
  v145 = &off_10024A118;
  v52 = +[NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
  v201[27] = v52;
  v200[28] = @"media_expanded";
  CFStringRef v142 = @"value";
  v143 = &off_10024A130;
  v51 = +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
  v201[28] = v51;
  v200[29] = @"media_contracted";
  CFStringRef v140 = @"value";
  v141 = &off_10024A148;
  v50 = +[NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
  v201[29] = v50;
  v200[30] = @"media_show_controls";
  CFStringRef v138 = @"value";
  v139 = &off_10024A160;
  v2 = +[NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
  v201[30] = v2;
  v200[31] = @"media_progress";
  CFStringRef v136 = @"value";
  v137 = &off_10024A178;
  v3 = +[NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
  v201[31] = v3;
  v200[32] = @"served";
  CFStringRef v134 = @"value";
  v135 = &off_10024A190;
  v4 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
  v201[32] = v4;
  v200[33] = @"impressed";
  CFStringRef v132 = @"value";
  v133 = &off_10024A1A8;
  v5 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
  v201[33] = v5;
  v200[34] = @"missed_opportunity";
  CFStringRef v130 = @"value";
  v131 = &off_10024A1C0;
  v6 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
  v201[34] = v6;
  v200[35] = @"confirmed_interaction";
  CFStringRef v128 = @"value";
  v129 = &off_10024A1D8;
  v7 = +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  v201[35] = v7;
  v200[36] = @"commerce_added_to_account";
  CFStringRef v126 = @"value";
  v127 = &off_10024A1F0;
  v8 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  v201[36] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v201 forKeys:v200 count:37];
  v203[3] = v9;
  v83 = +[NSDictionary dictionaryWithObjects:v203 forKeys:v202 count:4];

  v124[0] = @"name";
  v124[1] = @"purpose";
  v125[0] = @"Diagnostic";
  v125[1] = &off_10024A208;
  v125[2] = @"ECRouter";
  v124[2] = @"dest";
  v124[3] = @"metrics";
  v122[0] = @"load_failed";
  v120[0] = @"value";
  v120[1] = @"dnu";
  v121[0] = &off_10024A220;
  v121[1] = &__kCFBooleanTrue;
  v10 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:2];
  v123[0] = v10;
  v122[1] = @"template_metric";
  v118[0] = @"value";
  v118[1] = @"dnu";
  v119[0] = &off_10024A238;
  v119[1] = &__kCFBooleanTrue;
  v11 = +[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
  v123[1] = v11;
  v122[2] = @"media_playback_failed";
  v116[0] = @"value";
  v116[1] = @"dnu";
  v117[0] = &off_10024A250;
  v117[1] = &__kCFBooleanTrue;
  v12 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:2];
  v123[2] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:3];
  v125[3] = v13;
  v82 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:4];

  v114[0] = @"name";
  v114[1] = @"purpose";
  v115[0] = @"Internal";
  v115[1] = &off_10024A268;
  v114[2] = @"metrics";
  CFStringRef v112 = @"rate_limit_ad_requests";
  CFStringRef v110 = @"value";
  v111 = &off_10024A280;
  v14 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
  v113 = v14;
  v15 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
  v115[2] = v15;
  v80 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:3];

  v108[0] = @"name";
  v108[1] = @"purpose";
  v109[0] = @"Internal";
  v109[1] = &off_10024A298;
  v108[2] = @"metrics";
  CFStringRef v106 = @"validation_failed";
  CFStringRef v104 = @"value";
  v105 = &off_10024A2B0;
  v16 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
  v107 = v16;
  v17 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
  v109[2] = v17;
  v78 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:3];

  v102[0] = @"name";
  v102[1] = @"purpose";
  v103[0] = @"EC";
  v103[1] = &off_10024A2C8;
  v103[2] = @"ECRouter";
  v102[2] = @"dest";
  v102[3] = @"metrics";
  CFStringRef v98 = @"value";
  v99 = &off_10024A2E0;
  v100[0] = @"communication_errors_report";
  v18 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
  v101[0] = v18;
  v100[1] = @"hourly_report";
  CFStringRef v96 = @"value";
  v97 = &off_10024A2F8;
  v19 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
  v101[1] = v19;
  v100[2] = @"daily_report";
  CFStringRef v94 = @"value";
  v95 = &off_10024A310;
  v20 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
  v101[2] = v20;
  v21 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];
  v103[3] = v21;
  v22 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:4];

  v92[0] = @"name";
  v92[1] = @"purpose";
  v93[0] = @"Report";
  v93[1] = &off_10024A328;
  v93[2] = @"ECRouter";
  v92[2] = @"dest";
  v92[3] = @"metrics";
  CFStringRef v88 = @"value";
  v89 = &off_10024A340;
  CFStringRef v90 = @"integrity_report";
  v23 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
  v91 = v23;
  v24 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  v93[3] = v24;
  v25 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:4];

  v26 = +[MetricsModuleClasses purposeClass];
  id v27 = [[v26 alloc] initWithPurposeDefinition:v83];
  id v28 = [[v26 alloc] initWithPurposeDefinition:v82];
  id v29 = [[v26 alloc] initWithPurposeDefinition:v80];
  id v30 = [[v26 alloc] initWithPurposeDefinition:v78];
  id v31 = [[v26 alloc] initWithPurposeDefinition:v22];
  id v32 = [[v26 alloc] initWithPurposeDefinition:v25];
  v33 = APLogForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = [v27 name];
    *(_DWORD *)buf = 138543618;
    v85 = v34;
    __int16 v86 = 2050;
    id v87 = [v27 purpose];
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);
  }
  v35 = APLogForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = [v28 name];
    id v37 = [v28 purpose];
    *(_DWORD *)buf = 138543618;
    v85 = v36;
    __int16 v86 = 2050;
    id v87 = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);
  }
  v38 = APLogForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = [v29 name];
    id v40 = [v29 purpose];
    *(_DWORD *)buf = 138543618;
    v85 = v39;
    __int16 v86 = 2050;
    id v87 = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);
  }
  v41 = APLogForCategory();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = [v30 name];
    id v43 = [v30 purpose];
    *(_DWORD *)buf = 138543618;
    v85 = v42;
    __int16 v86 = 2050;
    id v87 = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);
  }
  v44 = APLogForCategory();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = [v31 name];
    id v46 = [v31 purpose];
    *(_DWORD *)buf = 138543618;
    v85 = v45;
    __int16 v86 = 2050;
    id v87 = v46;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);
  }
  v47 = APLogForCategory();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = [v32 name];
    id v49 = [v32 purpose];
    *(_DWORD *)buf = 138543618;
    v85 = v48;
    __int16 v86 = 2050;
    id v87 = v49;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);
  }
}

+ (void)rotateIdentifiers
{
}

+ (void)setup
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011FFD4;
  block[3] = &unk_100236838;
  block[4] = a1;
  if (qword_100289C20 != -1) {
    dispatch_once(&qword_100289C20, block);
  }
  if (!qword_100289C08)
  {
    id v2 = objc_alloc_init(+[MetricsModuleClasses storageClass]);
    v3 = (void *)qword_100289C08;
    qword_100289C08 = (uint64_t)v2;

    [(id)qword_100289C08 setup];
  }
}

+ (void)start
{
  id v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isRunningTests];

  if ((v3 & 1) == 0 && !qword_100289C10)
  {
    qword_100289C10 = objc_alloc_init(APMetricListener);
    _objc_release_x1();
  }
}

+ (APMetricReceiving)storage
{
  return (APMetricReceiving *)(id)qword_100289C08;
}

+ (void)clearStorage
{
  id v2 = +[NSProcessInfo processInfo];
  unsigned int v3 = [v2 isRunningTests];

  if (v3)
  {
    v4 = (void *)qword_100289C08;
    qword_100289C08 = 0;
  }
}

@end