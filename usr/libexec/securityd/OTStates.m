@interface OTStates
+ (id)AllOctagonFlags;
+ (id)OctagonAllStates;
+ (id)OctagonHealthSourceStates;
+ (id)OctagonInAccountStates;
+ (id)OctagonNotInCliqueStates;
+ (id)OctagonReadyStates;
+ (id)OctagonStateInverseMap;
+ (id)OctagonStateMap;
+ (id)stateInit;
@end

@implementation OTStates

+ (id)AllOctagonFlags
{
  if (qword_10035D1D0 != -1) {
    dispatch_once(&qword_10035D1D0, &stru_100305358);
  }
  v2 = (void *)qword_10035D1C8;

  return v2;
}

+ (id)OctagonAllStates
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016133C;
  block[3] = &unk_1003093A8;
  block[4] = a1;
  if (qword_10035D1C0 != -1) {
    dispatch_once(&qword_10035D1C0, block);
  }
  v2 = (void *)qword_10035D1B8;

  return v2;
}

+ (id)OctagonReadyStates
{
  if (qword_10035D1B0 != -1) {
    dispatch_once(&qword_10035D1B0, &stru_100305338);
  }
  v2 = (void *)qword_10035D1A8;

  return v2;
}

+ (id)OctagonNotInCliqueStates
{
  if (qword_10035D1A0 != -1) {
    dispatch_once(&qword_10035D1A0, &stru_100305318);
  }
  v2 = (void *)qword_10035D198;

  return v2;
}

+ (id)OctagonHealthSourceStates
{
  if (qword_10035D190 != -1) {
    dispatch_once(&qword_10035D190, &stru_1003052F8);
  }
  v2 = (void *)qword_10035D188;

  return v2;
}

+ (id)OctagonInAccountStates
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100161740;
  block[3] = &unk_1003093A8;
  block[4] = a1;
  if (qword_10035D180 != -1) {
    dispatch_once(&qword_10035D180, block);
  }
  v2 = (void *)qword_10035D178;

  return v2;
}

+ (id)OctagonStateInverseMap
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100161900;
  v4[3] = &unk_100308EC8;
  v4[4] = a1;
  v4[5] = a2;
  if (qword_10035D170 != -1) {
    dispatch_once(&qword_10035D170, v4);
  }
  v2 = (void *)qword_10035D168;

  return v2;
}

+ (id)OctagonStateMap
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100161BB8;
  v4[3] = &unk_100308EC8;
  v4[4] = a1;
  v4[5] = a2;
  if (qword_10035D160 != -1) {
    dispatch_once(&qword_10035D160, v4);
  }
  v2 = (void *)qword_10035D158;

  return v2;
}

+ (id)stateInit
{
  v171[0] = @"Ready";
  v171[1] = &off_100325F78;
  v87 = +[NSArray arrayWithObjects:v171 count:2];
  v172[0] = v87;
  v170[0] = @"Error";
  v170[1] = &off_100325F90;
  v86 = +[NSArray arrayWithObjects:v170 count:2];
  v172[1] = v86;
  v169[0] = @"Initializing";
  v169[1] = &off_100325FA8;
  v85 = +[NSArray arrayWithObjects:v169 count:2];
  v172[2] = v85;
  v168[0] = @"not_started";
  v168[1] = &off_100325FC0;
  v84 = +[NSArray arrayWithObjects:v168 count:2];
  v172[3] = v84;
  v167[0] = @"Untrusted";
  v167[1] = &off_100325FD8;
  v83 = +[NSArray arrayWithObjects:v167 count:2];
  v172[4] = v83;
  v166[0] = @"ReEnactDeviceList";
  v166[1] = &off_100325FF0;
  v82 = +[NSArray arrayWithObjects:v166 count:2];
  v172[5] = v82;
  v165[0] = @"ReEnactPrepare";
  v165[1] = &off_100326008;
  v81 = +[NSArray arrayWithObjects:v165 count:2];
  v172[6] = v81;
  v164[0] = @"ReEnactReadyToEstablish";
  v164[1] = &off_100326020;
  v80 = +[NSArray arrayWithObjects:v164 count:2];
  v172[7] = v80;
  v163[0] = @"NoAccountDoReset";
  v163[1] = &off_100326038;
  v79 = +[NSArray arrayWithObjects:v163 count:2];
  v172[8] = v79;
  v162[0] = @"BottleJoinVouchWithBottle";
  v162[1] = &off_100326050;
  v78 = +[NSArray arrayWithObjects:v162 count:2];
  v172[9] = v78;
  v161[0] = @"BottleJoinCreateIdentity";
  v161[1] = &off_100326068;
  v77 = +[NSArray arrayWithObjects:v161 count:2];
  v172[10] = v77;
  v160[0] = @"CloudKitNewlyAvailable";
  v160[1] = &off_100326080;
  v76 = +[NSArray arrayWithObjects:v160 count:2];
  v172[11] = v76;
  v159[0] = @"CheckTrustState";
  v159[1] = &off_100326098;
  v75 = +[NSArray arrayWithObjects:v159 count:2];
  v172[12] = v75;
  v158[0] = @"BecomeUntrusted";
  v158[1] = &off_1003260B0;
  v74 = +[NSArray arrayWithObjects:v158 count:2];
  v172[13] = v74;
  v157[0] = @"WaitForUnlock";
  v157[1] = &off_1003260C8;
  v73 = +[NSArray arrayWithObjects:v157 count:2];
  v172[14] = v73;
  v156[0] = @"WaitingForCloudKitAccount";
  v156[1] = &off_1003260E0;
  v72 = +[NSArray arrayWithObjects:v156 count:2];
  v172[15] = v72;
  v155[0] = @"BecomeReady";
  v155[1] = &off_1003260F8;
  v71 = +[NSArray arrayWithObjects:v155 count:2];
  v172[16] = v71;
  v154[0] = @"VouchWithRecoveryKey";
  v154[1] = &off_100326110;
  v70 = +[NSArray arrayWithObjects:v154 count:2];
  v172[17] = v70;
  v153[0] = @"CreateIdentityForRecoveryKey";
  v153[1] = &off_100326128;
  v69 = +[NSArray arrayWithObjects:v153 count:2];
  v172[18] = v69;
  v152[0] = @"UpdateSOSPreapprovals";
  v152[1] = &off_100326140;
  v68 = +[NSArray arrayWithObjects:v152 count:2];
  v172[19] = v68;
  v151[0] = @"WaitForCDPCapableSecurityLevel";
  v151[1] = &off_100326158;
  v67 = +[NSArray arrayWithObjects:v151 count:2];
  v172[20] = v67;
  v150[0] = @"AssistCKKSTLKUpload";
  v150[1] = &off_100326170;
  v66 = +[NSArray arrayWithObjects:v150 count:2];
  v172[21] = v66;
  v149[0] = @"EscrowTriggerUpdate";
  v149[1] = &off_100326188;
  v65 = +[NSArray arrayWithObjects:v149 count:2];
  v172[22] = v65;
  v148[0] = @"EnsureConsistency";
  v148[1] = &off_1003261A0;
  v64 = +[NSArray arrayWithObjects:v148 count:2];
  v172[23] = v64;
  v147[0] = @"ResetBecomeUntrusted";
  v147[1] = &off_1003261B8;
  v63 = +[NSArray arrayWithObjects:v147 count:2];
  v172[24] = v63;
  v146[0] = @"UntrustedUpdated";
  v146[1] = &off_1003261D0;
  v62 = +[NSArray arrayWithObjects:v146 count:2];
  v172[25] = v62;
  v145[0] = @"ReadyUpdated";
  v145[1] = &off_1003261E8;
  v61 = +[NSArray arrayWithObjects:v145 count:2];
  v172[26] = v61;
  v144[0] = @"TPHTrustCheck";
  v144[1] = &off_100326200;
  v60 = +[NSArray arrayWithObjects:v144 count:2];
  v172[27] = v60;
  v143[0] = @"CuttlefishTrustCheck";
  v143[1] = &off_100326218;
  v59 = +[NSArray arrayWithObjects:v143 count:2];
  v172[28] = v59;
  v142[0] = @"PostRepairCFU";
  v142[1] = &off_100326230;
  v58 = +[NSArray arrayWithObjects:v142 count:2];
  v172[29] = v58;
  v141[0] = @"SecurityTrustCheck";
  v141[1] = &off_100326248;
  v57 = +[NSArray arrayWithObjects:v141 count:2];
  v172[30] = v57;
  v140[0] = @"EnsureUpdatePreapprovals";
  v140[1] = &off_100326260;
  v56 = +[NSArray arrayWithObjects:v140 count:2];
  v172[31] = v56;
  v139[0] = @"ResetAnyMissingTLKCKKSViews";
  v139[1] = &off_100326278;
  v55 = +[NSArray arrayWithObjects:v139 count:2];
  v172[32] = v55;
  v138[0] = @"EstablishCKKSReset";
  v138[1] = &off_100326290;
  v54 = +[NSArray arrayWithObjects:v138 count:2];
  v172[33] = v54;
  v137[0] = @"EstablishAfterCKKSReset";
  v137[1] = &off_1003262A8;
  v53 = +[NSArray arrayWithObjects:v137 count:2];
  v172[34] = v53;
  v136[0] = @"SOSUpgradeCKKSReset";
  v136[1] = &off_1003262C0;
  v52 = +[NSArray arrayWithObjects:v136 count:2];
  v172[35] = v52;
  v135[0] = @"SOSUpgradeAfterCKKSReset";
  v135[1] = &off_1003262D8;
  v51 = +[NSArray arrayWithObjects:v135 count:2];
  v172[36] = v51;
  v134[0] = @"InitiatorJoinCKKSReset";
  v134[1] = &off_1003262F0;
  v50 = +[NSArray arrayWithObjects:v134 count:2];
  v172[37] = v50;
  v133[0] = @"InitiatorJoinAfterCKKSReset";
  v133[1] = &off_100326308;
  v49 = +[NSArray arrayWithObjects:v133 count:2];
  v172[38] = v49;
  v132[0] = @"HealthCheckReset";
  v132[1] = &off_100326320;
  v48 = +[NSArray arrayWithObjects:v132 count:2];
  v172[39] = v48;
  v131[0] = @"AssistCKKSTLKUploadCKKSReset";
  v131[1] = &off_100326338;
  v47 = +[NSArray arrayWithObjects:v131 count:2];
  v172[40] = v47;
  v130[0] = @"AssistCKKSTLKUploadAfterCKKSReset";
  v130[1] = &off_100326350;
  v46 = +[NSArray arrayWithObjects:v130 count:2];
  v172[41] = v46;
  v129[0] = @"WaitForCDP";
  v129[1] = &off_100326368;
  v45 = +[NSArray arrayWithObjects:v129 count:2];
  v172[42] = v45;
  v128[0] = @"DetermineCDPState";
  v128[1] = &off_100326380;
  v44 = +[NSArray arrayWithObjects:v128 count:2];
  v172[43] = v44;
  v127[0] = @"WaitForCDPUpdated";
  v127[1] = &off_100326398;
  v43 = +[NSArray arrayWithObjects:v127 count:2];
  v172[44] = v43;
  v126[0] = @"EstablishEnableCDPBit";
  v126[1] = &off_1003263B0;
  v42 = +[NSArray arrayWithObjects:v126 count:2];
  v172[45] = v42;
  v125[0] = @"InitiatorSetCDPBit";
  v125[1] = &off_1003263C8;
  v41 = +[NSArray arrayWithObjects:v125 count:2];
  v172[46] = v41;
  v124[0] = @"CDPHealthCheck";
  v124[1] = &off_1003263E0;
  v40 = +[NSArray arrayWithObjects:v124 count:2];
  v172[47] = v40;
  v123[0] = @"HealthCheckLeaveClique";
  v123[1] = &off_1003263F8;
  v39 = +[NSArray arrayWithObjects:v123 count:2];
  v172[48] = v39;
  v122[0] = @"RefetchCKKSPolicy";
  v122[1] = &off_100326410;
  v38 = +[NSArray arrayWithObjects:v122 count:2];
  v172[49] = v38;
  v121[0] = @"EnableUserControllableViews";
  v121[1] = &off_100326428;
  v37 = +[NSArray arrayWithObjects:v121 count:2];
  v172[50] = v37;
  v120[0] = @"DisableUserControllableViews";
  v120[1] = &off_100326440;
  v36 = +[NSArray arrayWithObjects:v120 count:2];
  v172[51] = v36;
  v119[0] = @"SetUserControllableViewsToPeerConsensus";
  v119[1] = &off_100326458;
  v35 = +[NSArray arrayWithObjects:v119 count:2];
  v172[52] = v35;
  v118[0] = @"WaitForClassCUnlock";
  v118[1] = &off_100326470;
  v34 = +[NSArray arrayWithObjects:v118 count:2];
  v172[53] = v34;
  v117[0] = @"BottlePreloadOctagonKeysInSOS";
  v117[1] = &off_100326488;
  v33 = +[NSArray arrayWithObjects:v117 count:2];
  v172[54] = v33;
  v116[0] = @"AttemptSOSUpgradeDetermineCDPState";
  v116[1] = &off_1003264A0;
  v32 = +[NSArray arrayWithObjects:v116 count:2];
  v172[55] = v32;
  v115[0] = @"SetAccountSettings";
  v115[1] = &off_1003264B8;
  v31 = +[NSArray arrayWithObjects:v115 count:2];
  v172[56] = v31;
  v114[0] = @"CreateIdentityForCustodianRecoveryKey";
  v114[1] = &off_1003264D0;
  v30 = +[NSArray arrayWithObjects:v114 count:2];
  v172[57] = v30;
  v113[0] = @"VouchWithCustodianRecoveryKey";
  v113[1] = &off_1003264E8;
  v29 = +[NSArray arrayWithObjects:v113 count:2];
  v172[58] = v29;
  v112[0] = @"CheckForAccountFixups";
  v112[1] = &off_100326500;
  v28 = +[NSArray arrayWithObjects:v112 count:2];
  v172[59] = v28;
  v111[0] = @"PerformAccountFixups";
  v111[1] = &off_100326518;
  v27 = +[NSArray arrayWithObjects:v111 count:2];
  v172[60] = v27;
  v110[0] = @"JoinSOSAfterCKKSFetch";
  v110[1] = &off_100326530;
  v26 = +[NSArray arrayWithObjects:v110 count:2];
  v172[61] = v26;
  v109[0] = @"AttemptSOSUpgrade";
  v109[1] = &off_100326548;
  v25 = +[NSArray arrayWithObjects:v109 count:2];
  v172[62] = v25;
  v108[0] = @"InitiatorUpdateDeviceList";
  v108[1] = &off_100326560;
  v24 = +[NSArray arrayWithObjects:v108 count:2];
  v172[63] = v24;
  v107[0] = @"InitiatorAwaitingVoucher";
  v107[1] = &off_100326578;
  v23 = +[NSArray arrayWithObjects:v107 count:2];
  v172[64] = v23;
  v106[0] = @"InitiatorJoin";
  v106[1] = &off_100326590;
  v22 = +[NSArray arrayWithObjects:v106 count:2];
  v172[65] = v22;
  v105[0] = @"NoAccount";
  v105[1] = &off_1003265A8;
  v21 = +[NSArray arrayWithObjects:v105 count:2];
  v172[66] = v21;
  v104[0] = @"ResetAndEstablish";
  v104[1] = &off_1003265C0;
  v20 = +[NSArray arrayWithObjects:v104 count:2];
  v172[67] = v20;
  v103[0] = @"Unimplemented";
  v103[1] = &off_1003265D8;
  v19 = +[NSArray arrayWithObjects:v103 count:2];
  v172[68] = v19;
  v102[0] = @"DetermineiCloudAccountState";
  v102[1] = &off_1003265F0;
  v18 = +[NSArray arrayWithObjects:v102 count:2];
  v172[69] = v18;
  v101[0] = @"DetermineiCloudAccountState";
  v101[1] = &off_1003265F0;
  v17 = +[NSArray arrayWithObjects:v101 count:2];
  v172[70] = v17;
  v100[0] = @"PrepareAndRecoverTLKSharesForInheritancePeer";
  v100[1] = &off_100326608;
  v16 = +[NSArray arrayWithObjects:v100 count:2];
  v172[71] = v16;
  v99[0] = @"BecomeInherited";
  v99[1] = &off_100326620;
  v15 = +[NSArray arrayWithObjects:v99 count:2];
  v172[72] = v15;
  v98[0] = @"Inherited";
  v98[1] = &off_100326638;
  v14 = +[NSArray arrayWithObjects:v98 count:2];
  v172[73] = v14;
  v97[0] = @"PeerMissingFromServer";
  v97[1] = &off_100326650;
  v13 = +[NSArray arrayWithObjects:v97 count:2];
  v172[74] = v13;
  v96[0] = @"ResetAndEstablishClearLocalContextState";
  v96[1] = &off_100326668;
  v2 = +[NSArray arrayWithObjects:v96 count:2];
  v172[75] = v2;
  v95[0] = @"LocalReset";
  v95[1] = &off_100326680;
  v3 = +[NSArray arrayWithObjects:v95 count:2];
  v172[76] = v3;
  v94[0] = @"LocalResetClearLocalContextState";
  v94[1] = &off_100326698;
  v4 = +[NSArray arrayWithObjects:v94 count:2];
  v172[77] = v4;
  v93[0] = @"OctagonStateStashAccountSettingsForRecoveryKey";
  v93[1] = &off_1003266B0;
  v5 = +[NSArray arrayWithObjects:v93 count:2];
  v172[78] = v5;
  v92[0] = @"CuttlefishReset";
  v92[1] = &off_1003266C8;
  v6 = +[NSArray arrayWithObjects:v92 count:2];
  v172[79] = v6;
  v91[0] = @"CKKSResetAfterOctagonReset";
  v91[1] = &off_1003266E0;
  v7 = +[NSArray arrayWithObjects:v91 count:2];
  v172[80] = v7;
  v90[0] = @"OctagonStateStashAccountSettingsForReroll";
  v90[1] = &off_1003266F8;
  v8 = +[NSArray arrayWithObjects:v90 count:2];
  v172[81] = v8;
  v89[0] = @"OctagonStateCreateIdentityForReroll";
  v89[1] = &off_100326710;
  v9 = +[NSArray arrayWithObjects:v89 count:2];
  v172[82] = v9;
  v88[0] = @"OctagonStateVouchWithReroll";
  v88[1] = &off_100326728;
  v10 = +[NSArray arrayWithObjects:v88 count:2];
  v172[83] = v10;
  v11 = +[NSArray arrayWithObjects:v172 count:84];

  return v11;
}

@end