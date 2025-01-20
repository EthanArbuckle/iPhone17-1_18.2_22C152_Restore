@interface KTStates
+ (id)AllKTFlags;
+ (id)KTStateInverseMap;
+ (id)KTStateMap;
+ (id)stateInit;
@end

@implementation KTStates

+ (id)stateInit
{
  v91[0] = @"Ready";
  v91[1] = &off_1002D9DB0;
  v47 = +[NSArray arrayWithObjects:v91 count:2];
  v92[0] = v47;
  v90[0] = @"Error";
  v90[1] = &off_1002D9DC8;
  v46 = +[NSArray arrayWithObjects:v90 count:2];
  v92[1] = v46;
  v89[0] = @"NoAccount";
  v89[1] = &off_1002D9DE0;
  v45 = +[NSArray arrayWithObjects:v89 count:2];
  v92[2] = v45;
  v88[0] = @"Unimplemented";
  v88[1] = &off_1002D9DF8;
  v44 = +[NSArray arrayWithObjects:v88 count:2];
  v92[3] = v44;
  v87[0] = @"WaitForManatee";
  v87[1] = &off_1002D9E10;
  v43 = +[NSArray arrayWithObjects:v87 count:2];
  v92[4] = v43;
  v86[0] = @"FetchIDSSelf";
  v86[1] = &off_1002D9E28;
  v42 = +[NSArray arrayWithObjects:v86 count:2];
  v92[5] = v42;
  v85[0] = @"EnsureAccountIdentity";
  v85[1] = &off_1002D9E40;
  v41 = +[NSArray arrayWithObjects:v85 count:2];
  v92[6] = v41;
  v84[0] = @"KTStateCheckCloudKitAccount";
  v84[1] = &off_1002D9E58;
  v40 = +[NSArray arrayWithObjects:v84 count:2];
  v92[7] = v40;
  v83[0] = @"Initializing";
  v83[1] = &off_1002D9E70;
  v39 = +[NSArray arrayWithObjects:v83 count:2];
  v92[8] = v39;
  v82[0] = @"SignalIDS";
  v82[1] = &off_1002D9E88;
  v38 = +[NSArray arrayWithObjects:v82 count:2];
  v92[9] = v38;
  v81[0] = @"FetchConfigBag";
  v81[1] = &off_1002D9EA0;
  v37 = +[NSArray arrayWithObjects:v81 count:2];
  v92[10] = v37;
  v80[0] = @"FetchIDMS";
  v80[1] = &off_1002D9EB8;
  v36 = +[NSArray arrayWithObjects:v80 count:2];
  v92[11] = v36;
  v79[0] = @"InitialIDMSCheck";
  v79[1] = &off_1002D9ED0;
  v35 = +[NSArray arrayWithObjects:v79 count:2];
  v92[12] = v35;
  v78[0] = @"ValidateFetchKTSelf";
  v78[1] = &off_1002D9EE8;
  v34 = +[NSArray arrayWithObjects:v78 count:2];
  v92[13] = v34;
  v77[0] = @"ValidateSelf";
  v77[1] = &off_1002D9F00;
  v33 = +[NSArray arrayWithObjects:v77 count:2];
  v92[14] = v33;
  v76[0] = @"SignRegistrationData";
  v76[1] = &off_1002D9F18;
  v32 = +[NSArray arrayWithObjects:v76 count:2];
  v92[15] = v32;
  v75[0] = @"ForceSyncKVS";
  v75[1] = &off_1002D9F30;
  v31 = +[NSArray arrayWithObjects:v75 count:2];
  v92[16] = v31;
  v74[0] = @"ValidateFetchIDSSelf";
  v74[1] = &off_1002D9F48;
  v30 = +[NSArray arrayWithObjects:v74 count:2];
  v92[17] = v30;
  v73[0] = @"FetchKTSelf";
  v73[1] = &off_1002D9F60;
  v29 = +[NSArray arrayWithObjects:v73 count:2];
  v92[18] = v29;
  v72[0] = @"PublicKeysFetch";
  v72[1] = &off_1002D9F78;
  v28 = +[NSArray arrayWithObjects:v72 count:2];
  v92[19] = v28;
  v71[0] = @"PublicKeysWait";
  v71[1] = &off_1002D9F90;
  v27 = +[NSArray arrayWithObjects:v71 count:2];
  v92[20] = v27;
  v70[0] = @"PublicKeysInitialFetch";
  v70[1] = &off_1002D9FA8;
  v26 = +[NSArray arrayWithObjects:v70 count:2];
  v92[21] = v26;
  v69[0] = @"CheckIDSRegistration";
  v69[1] = &off_1002D9FC0;
  v25 = +[NSArray arrayWithObjects:v69 count:2];
  v92[22] = v25;
  v68[0] = @"RecheckAccount";
  v68[1] = &off_1002D9FD8;
  v24 = +[NSArray arrayWithObjects:v68 count:2];
  v92[23] = v24;
  v67[0] = @"ResetLocalState";
  v67[1] = &off_1002D9FF0;
  v23 = +[NSArray arrayWithObjects:v67 count:2];
  v92[24] = v23;
  v66[0] = @"SetOptIO";
  v66[1] = &off_1002DA008;
  v22 = +[NSArray arrayWithObjects:v66 count:2];
  v92[25] = v22;
  v65[0] = @"ChangeOptIn";
  v65[1] = &off_1002DA020;
  v21 = +[NSArray arrayWithObjects:v65 count:2];
  v92[26] = v21;
  v64[0] = @"ValidateSelfOptIn";
  v64[1] = &off_1002DA038;
  v20 = +[NSArray arrayWithObjects:v64 count:2];
  v92[27] = v20;
  v63[0] = @"RetryEnsureAccountIdentity";
  v63[1] = &off_1002DA050;
  v19 = +[NSArray arrayWithObjects:v63 count:2];
  v92[28] = v19;
  v62[0] = @"ProcessOutgoing";
  v62[1] = &off_1002DA068;
  v18 = +[NSArray arrayWithObjects:v62 count:2];
  v92[29] = v18;
  v61[0] = @"ZoneSetup";
  v61[1] = &off_1002DA080;
  v17 = +[NSArray arrayWithObjects:v61 count:2];
  v92[30] = v17;
  v60[0] = @"ProcessIncoming";
  v60[1] = &off_1002DA098;
  v16 = +[NSArray arrayWithObjects:v60 count:2];
  v92[31] = v16;
  v59[0] = @"ProcessIncomingInitial";
  v59[1] = &off_1002DA0B0;
  v15 = +[NSArray arrayWithObjects:v59 count:2];
  v92[32] = v15;
  v58[0] = @"KTStateFixups";
  v58[1] = &off_1002DA0C8;
  v14 = +[NSArray arrayWithObjects:v58 count:2];
  v92[33] = v14;
  v57[0] = @"ResetLocalCloudState";
  v57[1] = &off_1002DA0E0;
  v13 = +[NSArray arrayWithObjects:v57 count:2];
  v92[34] = v13;
  v56[0] = @"WaitForCKKS";
  v56[1] = &off_1002DA0F8;
  v2 = +[NSArray arrayWithObjects:v56 count:2];
  v92[35] = v2;
  v55[0] = @"ForceSyncKTAccountKey";
  v55[1] = &off_1002DA110;
  v3 = +[NSArray arrayWithObjects:v55 count:2];
  v92[36] = v3;
  v54[0] = @"GetStatus";
  v54[1] = &off_1002DA128;
  v4 = +[NSArray arrayWithObjects:v54 count:2];
  v92[37] = v4;
  v53[0] = @"GetStatusInitial";
  v53[1] = &off_1002DA140;
  v5 = +[NSArray arrayWithObjects:v53 count:2];
  v92[38] = v5;
  v52[0] = @"EnvironmentSwitch";
  v52[1] = &off_1002DA158;
  v6 = +[NSArray arrayWithObjects:v52 count:2];
  v92[39] = v6;
  v51[0] = @"CheckKTAccountKeyChanged";
  v51[1] = &off_1002DA170;
  v7 = +[NSArray arrayWithObjects:v51 count:2];
  v92[40] = v7;
  v50[0] = @"InitialSignRegistrationData";
  v50[1] = &off_1002DA188;
  v8 = +[NSArray arrayWithObjects:v50 count:2];
  v92[41] = v8;
  v49[0] = @"WaitForUnlock";
  v49[1] = &off_1002DA1A0;
  v9 = +[NSArray arrayWithObjects:v49 count:2];
  v92[42] = v9;
  v48[0] = @"PokeIDS";
  v48[1] = &off_1002DA1B8;
  v10 = +[NSArray arrayWithObjects:v48 count:2];
  v92[43] = v10;
  v11 = +[NSArray arrayWithObjects:v92 count:44];

  return v11;
}

+ (id)KTStateMap
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100217AF0;
  v4[3] = &unk_1002CAAC0;
  v4[4] = a1;
  v4[5] = a2;
  if (qword_10032F440 != -1) {
    dispatch_once(&qword_10032F440, v4);
  }
  v2 = (void *)qword_10032F438;

  return v2;
}

+ (id)KTStateInverseMap
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100217DA8;
  v4[3] = &unk_1002CAAC0;
  v4[4] = a1;
  v4[5] = a2;
  if (qword_10032F450 != -1) {
    dispatch_once(&qword_10032F450, v4);
  }
  v2 = (void *)qword_10032F448;

  return v2;
}

+ (id)AllKTFlags
{
  if (qword_10032F460 != -1) {
    dispatch_once(&qword_10032F460, &stru_1002CAAE0);
  }
  v2 = (void *)qword_10032F458;

  return v2;
}

@end