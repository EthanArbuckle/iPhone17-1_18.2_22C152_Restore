@interface PLVideoAgent
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionGroupSession;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)stateEnumForStateString:(id)a3;
+ (void)load;
- (PLVideoAgent)init;
- (PLXPCListenerOperatorComposition)cMCrabsListener;
- (PLXPCListenerOperatorComposition)cMFileListener;
- (PLXPCListenerOperatorComposition)cMHlsListener;
- (PLXPCListenerOperatorComposition)groupSessionListener;
- (PLXPCListenerOperatorComposition)notification;
- (PLXPCListenerOperatorComposition)vTSessionListener;
- (PLXPCListenerOperatorComposition)vTTileListener;
- (void)initOperatorDependancies;
- (void)logEventBackwardCMCrabsWithEntry:(id)a3;
- (void)logEventBackwardCMFileWithEntry:(id)a3;
- (void)logEventBackwardCMHlsWithEntry:(id)a3;
- (void)logEventBackwardVTSessionWithEntry:(id)a3;
- (void)logEventBackwardVTTileWithEntry:(id)a3;
- (void)logEventForwardVideoWithEntry:(id)a3;
- (void)logEventIntervalGroupSession:(id)a3;
- (void)setCMCrabsListener:(id)a3;
- (void)setCMFileListener:(id)a3;
- (void)setCMHlsListener:(id)a3;
- (void)setGroupSessionListener:(id)a3;
- (void)setNotification:(id)a3;
- (void)setVTSessionListener:(id)a3;
- (void)setVTTileListener:(id)a3;
@end

@implementation PLVideoAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLVideoAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21 = @"Video";
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F0BA0;
  v18[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v17[2] = *MEMORY[0x1E4F92CB8];
  v17[3] = v3;
  v18[2] = MEMORY[0x1E4F1CC28];
  v18[3] = MEMORY[0x1E4F1CC38];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  v20[0] = v4;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v5 = objc_msgSend(MEMORY[0x1E4F929D8], "sharedInstance", @"clientPID");
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[0] = v6;
  v15[1] = @"clientDisplayID";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat_withBundleID");
  v16[1] = v8;
  v15[2] = @"State";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v16[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  return v13;
}

+ (id)entryEventBackwardDefinitions
{
  v142[5] = *MEMORY[0x1E4F143B8];
  v141[0] = @"VTSession";
  uint64_t v138 = *MEMORY[0x1E4F92C50];
  uint64_t v2 = v138;
  uint64_t v4 = *MEMORY[0x1E4F92C60];
  v135[0] = *MEMORY[0x1E4F92CD0];
  uint64_t v3 = v135[0];
  v135[1] = v4;
  v137[0] = &unk_1F29F0BB0;
  v137[1] = MEMORY[0x1E4F1CC28];
  uint64_t v136 = *MEMORY[0x1E4F92CB8];
  uint64_t v41 = v136;
  v137[2] = MEMORY[0x1E4F1CC28];
  v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v135 count:3];
  v140[0] = v106;
  uint64_t v139 = *MEMORY[0x1E4F92CA8];
  uint64_t v5 = v139;
  v133[0] = @"logID";
  v105 = [MEMORY[0x1E4F929D8] sharedInstance];
  v104 = objc_msgSend(v105, "commonTypeDict_StringFormat");
  v134[0] = v104;
  v133[1] = @"videoCodecType";
  v103 = [MEMORY[0x1E4F929D8] sharedInstance];
  v102 = objc_msgSend(v103, "commonTypeDict_IntegerFormat");
  v134[1] = v102;
  v133[2] = @"resHeight";
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_IntegerFormat");
  v134[2] = v100;
  v133[3] = @"numFramesDecoded";
  v99 = [MEMORY[0x1E4F929D8] sharedInstance];
  v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
  v134[3] = v98;
  v133[4] = @"numFramesEncoded";
  v97 = [MEMORY[0x1E4F929D8] sharedInstance];
  v96 = objc_msgSend(v97, "commonTypeDict_IntegerFormat");
  v134[4] = v96;
  v133[5] = @"resWidth";
  v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v134[5] = v94;
  v133[6] = @"isHDR";
  v93 = [MEMORY[0x1E4F929D8] sharedInstance];
  v92 = objc_msgSend(v93, "commonTypeDict_BoolFormat");
  v134[6] = v92;
  v133[7] = @"processID";
  v91 = [MEMORY[0x1E4F929D8] sharedInstance];
  v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
  v134[7] = v90;
  v133[8] = @"BundleID";
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  v88 = objc_msgSend(v89, "commonTypeDict_StringFormat_withBundleID");
  v134[8] = v88;
  v133[9] = @"numFramesDropped";
  v87 = [MEMORY[0x1E4F929D8] sharedInstance];
  v86 = objc_msgSend(v87, "commonTypeDict_IntegerFormat");
  v134[9] = v86;
  v133[10] = @"sessionDuration";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  v84 = objc_msgSend(v85, "commonTypeDict_IntegerFormat");
  v134[10] = v84;
  v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:11];
  v140[1] = v83;
  v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:&v138 count:2];
  v142[0] = v82;
  v141[1] = @"VTTile";
  v131[0] = v2;
  v128[0] = v3;
  v128[1] = v4;
  v130[0] = &unk_1F29F0BA0;
  v130[1] = MEMORY[0x1E4F1CC28];
  uint64_t v129 = *MEMORY[0x1E4F92C08];
  uint64_t v6 = v129;
  uint64_t v22 = v129;
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  v130[2] = MEMORY[0x1E4F1CC38];
  v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v128 count:3];
  v132[0] = v81;
  v131[1] = v5;
  v126[0] = @"videoCodecType";
  v80 = [MEMORY[0x1E4F929D8] sharedInstance];
  v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
  v127[0] = v79;
  v126[1] = @"resHeight";
  v78 = [MEMORY[0x1E4F929D8] sharedInstance];
  v77 = objc_msgSend(v78, "commonTypeDict_IntegerFormat");
  v127[1] = v77;
  v126[2] = @"numFramesDecoded";
  v76 = [MEMORY[0x1E4F929D8] sharedInstance];
  v75 = objc_msgSend(v76, "commonTypeDict_IntegerFormat");
  v127[2] = v75;
  v126[3] = @"numFramesEncoded";
  v74 = [MEMORY[0x1E4F929D8] sharedInstance];
  v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
  v127[3] = v73;
  v126[4] = @"resWidth";
  v72 = [MEMORY[0x1E4F929D8] sharedInstance];
  v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
  v127[4] = v71;
  v126[5] = @"isHDR";
  v70 = [MEMORY[0x1E4F929D8] sharedInstance];
  v69 = objc_msgSend(v70, "commonTypeDict_BoolFormat");
  v127[5] = v69;
  v126[6] = @"processID";
  v68 = [MEMORY[0x1E4F929D8] sharedInstance];
  v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v127[6] = v67;
  v126[7] = @"BundleID";
  v66 = [MEMORY[0x1E4F929D8] sharedInstance];
  v65 = objc_msgSend(v66, "commonTypeDict_StringFormat_withBundleID");
  v127[7] = v65;
  v126[8] = @"numFramesDropped";
  v64 = [MEMORY[0x1E4F929D8] sharedInstance];
  v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v127[8] = v63;
  v126[9] = @"sessionDuration";
  v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v127[9] = v61;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:10];
  v132[1] = v60;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
  v142[1] = v59;
  v141[2] = @"CMHls";
  v124[0] = v2;
  v121[0] = v3;
  v121[1] = v4;
  v123[0] = &unk_1F29F0BC0;
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  v123[1] = MEMORY[0x1E4F1CC28];
  v121[2] = v41;
  v121[3] = v6;
  v123[2] = MEMORY[0x1E4F1CC28];
  v123[3] = v7;
  uint64_t v122 = *MEMORY[0x1E4F92C58];
  uint64_t v9 = v122;
  v123[4] = &unk_1F29EE2E8;
  v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v121 count:5];
  v125[0] = v58;
  v124[1] = v5;
  v119[0] = @"logID";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_StringFormat");
  v120[0] = v56;
  v119[1] = @"TWOBR";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v120[1] = v54;
  v119[2] = @"TWIBR";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v120[2] = v52;
  v119[3] = @"IfTy";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v120[3] = v50;
  v119[4] = @"AuOn";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_BoolFormat");
  v120[4] = v48;
  v119[5] = @"TWVaRk";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v120[5] = v46;
  v119[6] = @"PlayTimeWC";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v120[6] = v44;
  v119[7] = @"ProcessName";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v43, "commonTypeDict_StringFormat_withProcessName");
  v120[7] = v40;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:8];
  v125[1] = v39;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:2];
  v142[2] = v38;
  v141[3] = @"CMFile";
  v117[0] = v2;
  v115[0] = v3;
  v115[1] = v4;
  v116[0] = &unk_1F29F0BC0;
  v116[1] = v8;
  v115[2] = v41;
  v115[3] = v22;
  v116[2] = v8;
  v116[3] = MEMORY[0x1E4F1CC38];
  v115[4] = v9;
  v116[4] = &unk_1F29EE300;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:5];
  v118[0] = v37;
  v117[1] = v5;
  v113[0] = @"logID";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_StringFormat");
  v114[0] = v35;
  v113[1] = @"TWIABR";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v114[1] = v33;
  v113[2] = @"PlayTimeWC";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
  v114[2] = v31;
  v113[3] = @"AuOn";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_BoolFormat");
  v114[3] = v29;
  v113[4] = @"StallCount";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v114[4] = v27;
  v113[5] = @"ProcessName";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_StringFormat_withProcessName");
  v114[5] = v25;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:6];
  v118[1] = v24;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:2];
  v142[3] = v21;
  v141[4] = @"CMCrabs";
  v111[0] = v2;
  v109[0] = v3;
  v109[1] = v4;
  v110[0] = &unk_1F29F0BC0;
  v110[1] = v8;
  v109[2] = v41;
  v109[3] = v22;
  v110[2] = v8;
  v110[3] = MEMORY[0x1E4F1CC38];
  v109[4] = v9;
  v110[4] = &unk_1F29EE318;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:5];
  v112[0] = v42;
  v111[1] = v5;
  v107[0] = @"IfTy";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v108[0] = v10;
  v107[1] = @"PlayTimeWC";
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  v12 = objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v108[1] = v12;
  v107[2] = @"IBR";
  v13 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v108[2] = v14;
  v107[3] = @"ProcessName";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v15, "commonTypeDict_StringFormat_withProcessName");
  v108[3] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:4];
  v112[1] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:2];
  v142[4] = v18;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:5];

  return v20;
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"GroupSession";
  uint64_t v2 = [a1 entryEventIntervalDefinitionGroupSession];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventIntervalDefinitionGroupSession
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0BA0;
  v14[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"timestampEnd";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v11[1] = @"BundleID";
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v12[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLVideoAgent)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLVideoAgent;
    self = [(PLAgent *)&v5 init];
    uint64_t v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke;
  v23[3] = &unk_1E692A6F8;
  v23[4] = self;
  uint64_t v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29EA0F8 withBlock:v23];
  [(PLVideoAgent *)self setNotification:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_138;
  void v22[3] = &unk_1E692A6F8;
  v22[4] = self;
  uint64_t v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F29EA120 withBlock:v22];
  [(PLVideoAgent *)self setCMFileListener:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_146;
  v21[3] = &unk_1E692A6F8;
  v21[4] = self;
  uint64_t v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F29EA148 withBlock:v21];
  [(PLVideoAgent *)self setCMHlsListener:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_154;
  v20[3] = &unk_1E692A6F8;
  v20[4] = self;
  v10 = (void *)[v9 initWithOperator:self withRegistration:&unk_1F29EA170 withBlock:v20];
  [(PLVideoAgent *)self setCMCrabsListener:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_162;
  v19[3] = &unk_1E692A6F8;
  v19[4] = self;
  v12 = (void *)[v11 initWithOperator:self withRegistration:&unk_1F29EA198 withBlock:v19];
  [(PLVideoAgent *)self setVTSessionListener:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_170;
  v18[3] = &unk_1E692A6F8;
  void v18[4] = self;
  v14 = (void *)[v13 initWithOperator:self withRegistration:&unk_1F29EA1C0 withBlock:v18];
  [(PLVideoAgent *)self setVTTileListener:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_180;
  v17[3] = &unk_1E692A6F8;
  void v17[4] = self;
  v16 = (void *)[v15 initWithOperator:self withRegistration:&unk_1F29EA1E8 withBlock:v17];
  [(PLVideoAgent *)self setGroupSessionListener:v16];
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationVideo: payload=%@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Video"];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v6];
  v10 = objc_opt_class();
  id v11 = [v9 objectForKeyedSubscript:@"State"];
  v12 = [v10 stateEnumForStateString:v11];
  [v9 setObject:v12 forKeyedSubscript:@"State"];

  [*(id *)(a1 + 32) logEventForwardVideoWithEntry:v9];
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationCMFile: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardCMFileWithEntry:v6];
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_146(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationCMHls: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardCMHlsWithEntry:v6];
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationCMCrabs: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardCMCrabsWithEntry:v6];
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_162(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationVTSession: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardVTSessionWithEntry:v6];
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideAgentEventBackwardVTTile: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardVTTileWithEntry:v6];
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __40__PLVideoAgent_initOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD58A70 != -1) {
      dispatch_once(&qword_1EBD58A70, &block);
    }
    if (_MergedGlobals_1_36)
    {
      int v8 = [NSString stringWithFormat:@"PLVideoAgent::kPLVideoAgentRegistrationGroupSession: payload=%@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLVideoAgent.m"];
      id v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLVideoAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:318];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventIntervalGroupSession:v6];
}

uint64_t __40__PLVideoAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_36 = result;
  return result;
}

- (void)logEventForwardVideoWithEntry:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"State"];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      int v8 = [v5 objectForKeyedSubscript:@"clientDisplayID"];

      if (v8)
      {
        [(PLOperator *)self logEntry:v5];
        id v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        uint64_t v10 = [v5 objectForKeyedSubscript:@"State"];
        uint64_t v11 = [v10 integerValue];

        if (v11 == 1)
        {
          v12 = 0;
          int v13 = v9;
        }
        else
        {
          id v14 = [v5 objectForKeyedSubscript:@"State"];
          uint64_t v15 = [v14 integerValue];

          if (v15 != 2)
          {
LABEL_12:

            goto LABEL_13;
          }
          int v13 = 0;
          v12 = v9;
        }
        id v16 = v9;
        v17 = [v5 objectForKeyedSubscript:@"clientDisplayID"];
        uint64_t v18 = v17;
        v19 = @"video-unknown";
        if (v17 && [(__CFString *)v17 length]) {
          v19 = v18;
        }
        id v20 = v19;

        uint64_t v21 = [MEMORY[0x1E4F92900] sharedInstance];
        v23 = v20;
        v24[0] = &unk_1F29F0BA0;
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

        [v21 createDistributionEventForwardWithDistributionID:9 withChildNodeNameToWeight:v22 withStartDate:v16];
        goto LABEL_12;
      }
    }
  }
LABEL_13:
}

- (void)logEventBackwardCMFileWithEntry:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v14 = +[PLOperator entryKeyForType:v4 andName:@"CMFile"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v5];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"logID"];
  if (v7)
  {
    int v8 = (void *)v7;
    id v9 = [v6 objectForKeyedSubscript:@"TWIABR"];

    if (v9)
    {
      uint64_t v10 = NSNumber;
      uint64_t v11 = (void *)MEMORY[0x1E4F92A88];
      v12 = [v6 objectForKeyedSubscript:@"TWIABR"];
      int v13 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "roundToSigFig:withSigFig:", objc_msgSend(v12, "intValue"), 2));
      [v6 setObject:v13 forKeyedSubscript:@"TWIABR"];

      [(PLOperator *)self logEntry:v6];
    }
  }
}

- (void)logEventBackwardCMHlsWithEntry:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v22 = +[PLOperator entryKeyForType:v4 andName:@"CMHls"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v22 withRawData:v5];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"logID"];
  if (!v7) {
    goto LABEL_8;
  }
  int v8 = (void *)v7;
  uint64_t v9 = [v6 objectForKeyedSubscript:@"PlayTimeWC"];
  if (!v9)
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [v6 objectForKeyedSubscript:@"TWIBR"];
  if (!v11)
  {

    goto LABEL_7;
  }
  v12 = (void *)v11;
  int v13 = [v6 objectForKeyedSubscript:@"TWOBR"];

  if (v13)
  {
    id v14 = NSNumber;
    uint64_t v15 = (void *)MEMORY[0x1E4F92A88];
    id v16 = [v6 objectForKeyedSubscript:@"TWIBR"];
    v17 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "roundToSigFig:withSigFig:", objc_msgSend(v16, "intValue"), 2));
    [v6 setObject:v17 forKeyedSubscript:@"TWIBR"];

    uint64_t v18 = NSNumber;
    v19 = (void *)MEMORY[0x1E4F92A88];
    id v20 = [v6 objectForKeyedSubscript:@"TWOBR"];
    uint64_t v21 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "roundToSigFig:withSigFig:", objc_msgSend(v20, "intValue"), 2));
    [v6 setObject:v21 forKeyedSubscript:@"TWOBR"];

    [(PLOperator *)self logEntry:v6];
  }
LABEL_8:
}

- (void)logEventBackwardCMCrabsWithEntry:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v14 = +[PLOperator entryKeyForType:v4 andName:@"CMCrabs"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v5];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"logID"];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [v6 objectForKeyedSubscript:@"IBR"];

    if (v9)
    {
      uint64_t v10 = NSNumber;
      uint64_t v11 = (void *)MEMORY[0x1E4F92A88];
      v12 = [v6 objectForKeyedSubscript:@"IBR"];
      int v13 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "roundToSigFig:withSigFig:", objc_msgSend(v12, "intValue"), 2));
      [v6 setObject:v13 forKeyedSubscript:@"IBR"];

      [(PLOperator *)self logEntry:v6];
    }
  }
}

- (void)logEventBackwardVTSessionWithEntry:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"VTSession"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v4];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"processID"];
  uint64_t v8 = [v7 intValue];

  uint64_t v9 = [MEMORY[0x1E4F92A88] bundleIDFromPid:v8];
  if (([MEMORY[0x1E4F929C0] liteMode] & 1) != 0
    || [MEMORY[0x1E4F929C0] taskMode])
  {
    if (([v9 hasPrefix:@"com.apple"] & 1) != 0
      || [&unk_1F29EE330 containsObject:v9])
    {
      [v6 setObject:v9 forKeyedSubscript:@"BundleID"];
      uint64_t v10 = NSNumber;
      uint64_t v11 = (void *)MEMORY[0x1E4F92A88];
      v12 = [v4 objectForKeyedSubscript:@"numFramesDecoded"];
      int v13 = objc_msgSend(v10, "numberWithLong:", objc_msgSend(v11, "roundToSigFig:withSigFig:", objc_msgSend(v12, "intValue"), 3));
      [v6 setObject:v13 forKeyedSubscript:@"numFramesDecoded"];

      id v14 = NSNumber;
      uint64_t v15 = (void *)MEMORY[0x1E4F92A88];
      id v16 = [v4 objectForKeyedSubscript:@"numFramesEncoded"];
      v17 = objc_msgSend(v14, "numberWithLong:", objc_msgSend(v15, "roundToSigFig:withSigFig:", objc_msgSend(v16, "intValue"), 3));
      [v6 setObject:v17 forKeyedSubscript:@"numFramesEncoded"];
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PLVideoAgent_logEventBackwardVTSessionWithEntry___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v19;
      if (qword_1EBD58A78 != -1) {
        dispatch_once(&qword_1EBD58A78, block);
      }
      if (byte_1EBD58A69)
      {
        id v20 = objc_msgSend(NSString, "stringWithFormat:", @"the appBundleID is not approved and pid is %d", v8);
        uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
        id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLVideoAgent.m"];
        v23 = [v22 lastPathComponent];
        v24 = [NSString stringWithUTF8String:"-[PLVideoAgent logEventBackwardVTSessionWithEntry:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:453];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F92A88] bundleIDFromPid:v8];
    [v6 setObject:v18 forKeyedSubscript:@"BundleID"];
  }
  [(PLOperator *)self logEntry:v6];
}

uint64_t __51__PLVideoAgent_logEventBackwardVTSessionWithEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58A69 = result;
  return result;
}

- (void)logEventBackwardVTTileWithEntry:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"VTTile"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventIntervalGroupSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v14 = +[PLOperator entryKeyForType:v4 andName:@"GroupSession"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"timestamp"];
  uint64_t v8 = [v7 convertFromSystemToMonotonic];
  [v6 setEntryDate:v8];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"timestampEnd"];
  uint64_t v10 = [v9 convertFromSystemToMonotonic];
  [v6 setObject:v10 forKeyedSubscript:@"timestampEnd"];

  uint64_t v11 = [v5 objectForKeyedSubscript:@"bundleID"];

  [v6 setObject:v11 forKeyedSubscript:@"BundleID"];
  v12 = [v6 objectForKeyedSubscript:@"timestampEnd"];

  if (!v12)
  {
    int v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v6 setObject:v13 forKeyedSubscript:@"timestampEnd"];
  }
  [(PLOperator *)self logEntry:v6];
}

+ (id)stateEnumForStateString:(id)a3
{
  uint64_t v3 = qword_1EBD58A88;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EBD58A88, &__block_literal_global_32);
  }
  id v5 = [(id)qword_1EBD58A80 objectForKeyedSubscript:v4];

  return v5;
}

void __40__PLVideoAgent_stateEnumForStateString___block_invoke()
{
  v0 = (void *)qword_1EBD58A80;
  qword_1EBD58A80 = (uint64_t)&unk_1F29EA210;
}

- (PLXPCListenerOperatorComposition)notification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cMFileListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCMFileListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cMHlsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCMHlsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cMCrabsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCMCrabsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)vTSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setVTSessionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)vTTileListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVTTileListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)groupSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setGroupSessionListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSessionListener, 0);
  objc_storeStrong((id *)&self->_vTTileListener, 0);
  objc_storeStrong((id *)&self->_vTSessionListener, 0);
  objc_storeStrong((id *)&self->_cMCrabsListener, 0);
  objc_storeStrong((id *)&self->_cMHlsListener, 0);
  objc_storeStrong((id *)&self->_cMFileListener, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end