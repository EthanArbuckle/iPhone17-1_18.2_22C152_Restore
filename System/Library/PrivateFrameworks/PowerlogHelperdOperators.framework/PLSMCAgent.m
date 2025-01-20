@interface PLSMCAgent
+ (BOOL)shouldModelDisplayPowerFromSMC;
+ (BOOL)supportsBasicSMC;
+ (BOOL)supportsThermalSMC;
+ (id)channelValueDiffKey:(id)a3;
+ (id)channelValueKey:(id)a3;
+ (id)cycleCountKey:(id)a3;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionAccumulatedKeys;
+ (id)entryEventBackwardDefinitionDisplayPowerKeys;
+ (id)entryEventBackwardDefinitionPowerAccumulatedKeys;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitionDRAMVendorKey;
+ (id)entryEventNoneDefinitionPowerDeliveryKeys;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionMetricMonitorInstantKeys;
+ (id)entryEventPointDefinitionThermalInstantKeys;
+ (id)entryEventPointDefinitionThermalKeys;
+ (id)entryEventPointDefinitions;
+ (id)parsePMUEvents:(unint64_t)a3;
+ (id)variantKey:(id)a3;
+ (void)load;
+ (void)reportPMUEventsToCA:(id)a3;
- ($BE55D70084A18B56E262C321142BDEE0)smcConnection;
- (BOOL)SMCKeyExists:(id)a3;
- (BOOL)accumSupported;
- (BOOL)anyVirtualTemperatureAboveThreshold;
- (BOOL)readKeyViaOSAccum:(id)a3 toOutput:(id *)a4;
- (BOOL)sampleKey:(id *)a3 forKey:(unsigned int)a4;
- (BOOL)writeKeyNumeric:(id)a3 withValue:(unint64_t)a4;
- (NSDate)lastDisplayAccumulatedSampleEndDate;
- (NSDate)lastFocalSampleDate;
- (NSDictionary)lastAccumlatedKeysSample;
- (NSDictionary)lastAccumlatedKeysSampleCA;
- (NSDictionary)lastDisplayAccumlatedSample;
- (NSDictionary)lastPowerAccumlatedSample;
- (NSDictionary)lastPowerAccumlatedSampleCA;
- (NSMutableDictionary)lastAccumCycleCountDict;
- (NSMutableDictionary)lastAccumValueDict;
- (NSNumber)currentLux;
- (PLEntry)lastThermalInstantEntry;
- (PLEntryNotificationOperatorComposition)focalAppSwitch;
- (PLEntryNotificationOperatorComposition)luxEntryNotification;
- (PLEntryNotificationOperatorComposition)sbc;
- (PLEntryNotificationOperatorComposition)screenStateNotification;
- (PLSMCAgent)init;
- (PLStateTrackingComposition)stateTracker;
- (PLTimer)focalSwitchFilterTimer;
- (PLTimer)thermalAggregationTimer;
- (PLTimer)thermalLoggingTimer;
- (PLTimer)thermalMonitorTimer;
- (const)getChannelInfo:(unsigned int)a3;
- (id)DRAMVendorKey;
- (id)accumulatedKeys;
- (id)displayAccumulatedKeys;
- (id)getAccumEntryFromSample:(id)a3 lastSample:(id)a4 withEntryKey:(id)a5 withDate:(id)a6;
- (id)getPowerEntryFromSample:(id)a3 lastSample:(id)a4 withEntryKey:(id)a5;
- (id)metricMonitorInstantKeys;
- (id)powerAccumulatedKeys;
- (id)powerDeliveryKeys;
- (id)powerDeliveryResetKeys;
- (id)readKey:(id)a3;
- (id)resetAccumulatedKeys:(id)a3;
- (id)sampleAccumulatedKeys:(id)a3;
- (id)thermalAggregationKeys;
- (id)thermalInstantKeys;
- (id)thermalKeys;
- (id)virtualTemperatureKeys;
- (void)dealloc;
- (void)handleStateChangeForSMCStats;
- (void)initOperatorDependancies;
- (void)log;
- (void)logAccumKeysToCA:(id)a3 withLastSample:(id)a4 andDate:(id)a5;
- (void)logAccumulatedKeysToPowerlog:(BOOL)a3 ToCoreAnalytics:(BOOL)a4 withDate:(id)a5 isWake:(BOOL)a6;
- (void)logDRAMVendorKey;
- (void)logDisplayPower;
- (void)logEventPointMetricMonitorInstantKeys;
- (void)logEventPointThermalKeys;
- (void)logPowerDeliveryKeys;
- (void)logThermalAggregationKeysToCA;
- (void)logThermalInstantAndAccumlatedKeys;
- (void)parseThermalThresholds:(BOOL)a3 thermalPressure:(BOOL)a4 virtualTemp:(BOOL)a5 thermalLevel:(BOOL)a6;
- (void)registerThermalTimer;
- (void)setCurrentLux:(id)a3;
- (void)setFocalAppSwitch:(id)a3;
- (void)setFocalSwitchFilterTimer:(id)a3;
- (void)setLastAccumCycleCountDict:(id)a3;
- (void)setLastAccumValueDict:(id)a3;
- (void)setLastAccumlatedKeysSample:(id)a3;
- (void)setLastAccumlatedKeysSampleCA:(id)a3;
- (void)setLastDisplayAccumlatedSample:(id)a3;
- (void)setLastDisplayAccumulatedSampleEndDate:(id)a3;
- (void)setLastFocalSampleDate:(id)a3;
- (void)setLastPowerAccumlatedSample:(id)a3;
- (void)setLastPowerAccumlatedSampleCA:(id)a3;
- (void)setLastThermalInstantEntry:(id)a3;
- (void)setLuxEntryNotification:(id)a3;
- (void)setSbc:(id)a3;
- (void)setScreenStateNotification:(id)a3;
- (void)setSmcConnection:(id *)a3;
- (void)setStateTracker:(id)a3;
- (void)setThermalAggregationTimer:(id)a3;
- (void)setThermalLoggingTimer:(id)a3;
- (void)setThermalMonitorTimer:(id)a3;
- (void)stopThermalTimerAndlogFirstLowSample:(BOOL)a3;
- (void)virtualTemperatureMonitorCallback;
@end

@implementation PLSMCAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSMCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ThermalKeys";
  v3 = [a1 entryEventPointDefinitionThermalKeys];
  v9[0] = v3;
  v8[1] = @"ThermalInstantKeys";
  v4 = [a1 entryEventPointDefinitionThermalInstantKeys];
  v9[1] = v4;
  v8[2] = @"MetricMonitorInstantKeys";
  v5 = [a1 entryEventPointDefinitionMetricMonitorInstantKeys];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventPointDefinitionThermalKeys
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitionThermalInstantKeys
{
  v236[2] = *MEMORY[0x1E4F143B8];
  v235[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v233[0] = *MEMORY[0x1E4F92CD0];
  v233[1] = v2;
  v234[0] = &unk_1F4011D18;
  v234[1] = MEMORY[0x1E4F1CC38];
  v230 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v234 forKeys:v233 count:2];
  v236[0] = v230;
  v235[1] = *MEMORY[0x1E4F92CA8];
  v231[0] = @"voP0";
  v229 = [MEMORY[0x1E4F929D8] sharedInstance];
  v228 = objc_msgSend(v229, "commonTypeDict_RealFormat");
  v232[0] = v228;
  v231[1] = @"TW0P";
  v227 = [MEMORY[0x1E4F929D8] sharedInstance];
  v226 = objc_msgSend(v227, "commonTypeDict_RealFormat");
  v232[1] = v226;
  v231[2] = @"TB0T";
  v225 = [MEMORY[0x1E4F929D8] sharedInstance];
  v224 = objc_msgSend(v225, "commonTypeDict_RealFormat");
  v232[2] = v224;
  v231[3] = @"TCMb";
  v223 = [MEMORY[0x1E4F929D8] sharedInstance];
  v222 = objc_msgSend(v223, "commonTypeDict_RealFormat");
  v232[3] = v222;
  v231[4] = @"TN0n";
  v221 = [MEMORY[0x1E4F929D8] sharedInstance];
  v220 = objc_msgSend(v221, "commonTypeDict_RealFormat");
  v232[4] = v220;
  v231[5] = @"TV0A";
  v219 = [MEMORY[0x1E4F929D8] sharedInstance];
  v218 = objc_msgSend(v219, "commonTypeDict_RealFormat");
  v232[5] = v218;
  v231[6] = @"TVFM";
  v217 = [MEMORY[0x1E4F929D8] sharedInstance];
  v216 = objc_msgSend(v217, "commonTypeDict_RealFormat");
  v232[6] = v216;
  v231[7] = @"voC0";
  v215 = [MEMORY[0x1E4F929D8] sharedInstance];
  v214 = objc_msgSend(v215, "commonTypeDict_RealFormat");
  v232[7] = v214;
  v231[8] = @"mlCC";
  v213 = [MEMORY[0x1E4F929D8] sharedInstance];
  v212 = objc_msgSend(v213, "commonTypeDict_RealFormat");
  v232[8] = v212;
  v231[9] = @"voT0";
  v211 = [MEMORY[0x1E4F929D8] sharedInstance];
  v210 = objc_msgSend(v211, "commonTypeDict_RealFormat");
  v232[9] = v210;
  v231[10] = @"voR1";
  v209 = [MEMORY[0x1E4F929D8] sharedInstance];
  v208 = objc_msgSend(v209, "commonTypeDict_RealFormat");
  v232[10] = v208;
  v231[11] = @"voR2";
  v207 = [MEMORY[0x1E4F929D8] sharedInstance];
  v206 = objc_msgSend(v207, "commonTypeDict_RealFormat");
  v232[11] = v206;
  v231[12] = @"xPb1";
  v205 = [MEMORY[0x1E4F929D8] sharedInstance];
  v204 = objc_msgSend(v205, "commonTypeDict_RealFormat");
  v232[12] = v204;
  v231[13] = @"xPb2";
  v203 = [MEMORY[0x1E4F929D8] sharedInstance];
  v202 = objc_msgSend(v203, "commonTypeDict_RealFormat");
  v232[13] = v202;
  v231[14] = @"mlNN";
  v201 = [MEMORY[0x1E4F929D8] sharedInstance];
  v200 = objc_msgSend(v201, "commonTypeDict_RealFormat");
  v232[14] = v200;
  v231[15] = @"voS0";
  v199 = [MEMORY[0x1E4F929D8] sharedInstance];
  v198 = objc_msgSend(v199, "commonTypeDict_RealFormat");
  v232[15] = v198;
  v231[16] = @"xPSp";
  v197 = [MEMORY[0x1E4F929D8] sharedInstance];
  v196 = objc_msgSend(v197, "commonTypeDict_RealFormat");
  v232[16] = v196;
  v231[17] = @"voBB";
  v195 = [MEMORY[0x1E4F929D8] sharedInstance];
  v194 = objc_msgSend(v195, "commonTypeDict_RealFormat");
  v232[17] = v194;
  v231[18] = @"xPDs";
  v193 = [MEMORY[0x1E4F929D8] sharedInstance];
  v192 = objc_msgSend(v193, "commonTypeDict_RealFormat");
  v232[18] = v192;
  v231[19] = @"cmSM";
  v191 = [MEMORY[0x1E4F929D8] sharedInstance];
  v190 = objc_msgSend(v191, "commonTypeDict_RealFormat");
  v232[19] = v190;
  v231[20] = @"TVD0";
  v189 = [MEMORY[0x1E4F929D8] sharedInstance];
  v188 = objc_msgSend(v189, "commonTypeDict_RealFormat");
  v232[20] = v188;
  v231[21] = @"ftS0";
  v187 = [MEMORY[0x1E4F929D8] sharedInstance];
  v186 = objc_msgSend(v187, "commonTypeDict_RealFormat");
  v232[21] = v186;
  v231[22] = @"TVBM";
  v185 = [MEMORY[0x1E4F929D8] sharedInstance];
  v184 = objc_msgSend(v185, "commonTypeDict_RealFormat");
  v232[22] = v184;
  v231[23] = @"TVFD";
  v183 = [MEMORY[0x1E4F929D8] sharedInstance];
  v182 = objc_msgSend(v183, "commonTypeDict_RealFormat");
  v232[23] = v182;
  v231[24] = @"TVFL";
  v181 = [MEMORY[0x1E4F929D8] sharedInstance];
  v180 = objc_msgSend(v181, "commonTypeDict_RealFormat");
  v232[24] = v180;
  v231[25] = @"TVFG";
  v179 = [MEMORY[0x1E4F929D8] sharedInstance];
  v178 = objc_msgSend(v179, "commonTypeDict_RealFormat");
  v232[25] = v178;
  v231[26] = @"TVBQ";
  v177 = [MEMORY[0x1E4F929D8] sharedInstance];
  v176 = objc_msgSend(v177, "commonTypeDict_RealFormat");
  v232[26] = v176;
  v231[27] = @"TVBR";
  v175 = [MEMORY[0x1E4F929D8] sharedInstance];
  v174 = objc_msgSend(v175, "commonTypeDict_RealFormat");
  v232[27] = v174;
  v231[28] = @"TV0s";
  v173 = [MEMORY[0x1E4F929D8] sharedInstance];
  v172 = objc_msgSend(v173, "commonTypeDict_RealFormat");
  v232[28] = v172;
  v231[29] = @"TV2s";
  v171 = [MEMORY[0x1E4F929D8] sharedInstance];
  v170 = objc_msgSend(v171, "commonTypeDict_RealFormat");
  v232[29] = v170;
  v231[30] = @"TV4s";
  v169 = [MEMORY[0x1E4F929D8] sharedInstance];
  v168 = objc_msgSend(v169, "commonTypeDict_RealFormat");
  v232[30] = v168;
  v231[31] = @"TV5s";
  v167 = [MEMORY[0x1E4F929D8] sharedInstance];
  v166 = objc_msgSend(v167, "commonTypeDict_RealFormat");
  v232[31] = v166;
  v231[32] = @"xPPT";
  v165 = [MEMORY[0x1E4F929D8] sharedInstance];
  v164 = objc_msgSend(v165, "commonTypeDict_RealFormat");
  v232[32] = v164;
  v231[33] = @"xDPE";
  v163 = [MEMORY[0x1E4F929D8] sharedInstance];
  v162 = objc_msgSend(v163, "commonTypeDict_RealFormat");
  v232[33] = v162;
  v231[34] = @"mTPL";
  v161 = [MEMORY[0x1E4F929D8] sharedInstance];
  v160 = objc_msgSend(v161, "commonTypeDict_RealFormat");
  v232[34] = v160;
  v231[35] = @"B0AP";
  v159 = [MEMORY[0x1E4F929D8] sharedInstance];
  v158 = objc_msgSend(v159, "commonTypeDict_RealFormat");
  v232[35] = v158;
  v231[36] = @"mTLL";
  v157 = [MEMORY[0x1E4F929D8] sharedInstance];
  v156 = objc_msgSend(v157, "commonTypeDict_RealFormat");
  v232[36] = v156;
  v231[37] = @"xPNf";
  v155 = [MEMORY[0x1E4F929D8] sharedInstance];
  v154 = objc_msgSend(v155, "commonTypeDict_RealFormat");
  v232[37] = v154;
  v231[38] = @"xPWi";
  v153 = [MEMORY[0x1E4F929D8] sharedInstance];
  v152 = objc_msgSend(v153, "commonTypeDict_RealFormat");
  v232[38] = v152;
  v231[39] = @"xPAr";
  v151 = [MEMORY[0x1E4F929D8] sharedInstance];
  v150 = objc_msgSend(v151, "commonTypeDict_RealFormat");
  v232[39] = v150;
  v231[40] = @"TVBA";
  v149 = [MEMORY[0x1E4F929D8] sharedInstance];
  v148 = objc_msgSend(v149, "commonTypeDict_RealFormat");
  v232[40] = v148;
  v231[41] = @"TVBC";
  v147 = [MEMORY[0x1E4F929D8] sharedInstance];
  v146 = objc_msgSend(v147, "commonTypeDict_RealFormat");
  v232[41] = v146;
  v231[42] = @"TVBF";
  v145 = [MEMORY[0x1E4F929D8] sharedInstance];
  v144 = objc_msgSend(v145, "commonTypeDict_RealFormat");
  v232[42] = v144;
  v231[43] = @"TVBB";
  v143 = [MEMORY[0x1E4F929D8] sharedInstance];
  v142 = objc_msgSend(v143, "commonTypeDict_RealFormat");
  v232[43] = v142;
  v231[44] = @"TVLN";
  v141 = [MEMORY[0x1E4F929D8] sharedInstance];
  v140 = objc_msgSend(v141, "commonTypeDict_RealFormat");
  v232[44] = v140;
  v231[45] = @"SDTo";
  v139 = [MEMORY[0x1E4F929D8] sharedInstance];
  v138 = objc_msgSend(v139, "commonTypeDict_RealFormat");
  v232[45] = v138;
  v231[46] = @"SDTh";
  v137 = [MEMORY[0x1E4F929D8] sharedInstance];
  v136 = objc_msgSend(v137, "commonTypeDict_BoolFormat");
  v232[46] = v136;
  v231[47] = @"SDTL";
  v135 = [MEMORY[0x1E4F929D8] sharedInstance];
  v134 = objc_msgSend(v135, "commonTypeDict_RealFormat");
  v232[47] = v134;
  v231[48] = @"xRPE";
  v133 = [MEMORY[0x1E4F929D8] sharedInstance];
  v132 = objc_msgSend(v133, "commonTypeDict_RealFormat");
  v232[48] = v132;
  v231[49] = @"TG0V";
  v131 = [MEMORY[0x1E4F929D8] sharedInstance];
  v130 = objc_msgSend(v131, "commonTypeDict_RealFormat");
  v232[49] = v130;
  v231[50] = @"CKRQ";
  v129 = [MEMORY[0x1E4F929D8] sharedInstance];
  v128 = objc_msgSend(v129, "commonTypeDict_BoolFormat");
  v232[50] = v128;
  v231[51] = @"TVBN";
  v127 = [MEMORY[0x1E4F929D8] sharedInstance];
  v126 = objc_msgSend(v127, "commonTypeDict_RealFormat");
  v232[51] = v126;
  v231[52] = @"TVRQ";
  v125 = [MEMORY[0x1E4F929D8] sharedInstance];
  v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
  v232[52] = v124;
  v231[53] = @"TVRH";
  v123 = [MEMORY[0x1E4F929D8] sharedInstance];
  v122 = objc_msgSend(v123, "commonTypeDict_RealFormat");
  v232[53] = v122;
  v231[54] = @"TVRR";
  v121 = [MEMORY[0x1E4F929D8] sharedInstance];
  v120 = objc_msgSend(v121, "commonTypeDict_RealFormat");
  v232[54] = v120;
  v231[55] = @"TVBE";
  v119 = [MEMORY[0x1E4F929D8] sharedInstance];
  v118 = objc_msgSend(v119, "commonTypeDict_RealFormat");
  v232[55] = v118;
  v231[56] = @"TVRM";
  v117 = [MEMORY[0x1E4F929D8] sharedInstance];
  v116 = objc_msgSend(v117, "commonTypeDict_RealFormat");
  v232[56] = v116;
  v231[57] = @"TAOP";
  v115 = [MEMORY[0x1E4F929D8] sharedInstance];
  v114 = objc_msgSend(v115, "commonTypeDict_RealFormat");
  v232[57] = v114;
  v231[58] = @"TB50";
  v113 = [MEMORY[0x1E4F929D8] sharedInstance];
  v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
  v232[58] = v112;
  v231[59] = @"TB5B";
  v111 = [MEMORY[0x1E4F929D8] sharedInstance];
  v110 = objc_msgSend(v111, "commonTypeDict_RealFormat");
  v232[59] = v110;
  v231[60] = @"TKFP";
  v109 = [MEMORY[0x1E4F929D8] sharedInstance];
  v108 = objc_msgSend(v109, "commonTypeDict_RealFormat");
  v232[60] = v108;
  v231[61] = @"TVFC";
  v107 = [MEMORY[0x1E4F929D8] sharedInstance];
  v106 = objc_msgSend(v107, "commonTypeDict_RealFormat");
  v232[61] = v106;
  v231[62] = @"TNAP";
  v105 = [MEMORY[0x1E4F929D8] sharedInstance];
  v104 = objc_msgSend(v105, "commonTypeDict_RealFormat");
  v232[62] = v104;
  v231[63] = @"TR0P";
  v103 = [MEMORY[0x1E4F929D8] sharedInstance];
  v102 = objc_msgSend(v103, "commonTypeDict_RealFormat");
  v232[63] = v102;
  v231[64] = @"mlr5";
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
  v232[64] = v100;
  v231[65] = @"BUIC";
  v99 = [MEMORY[0x1E4F929D8] sharedInstance];
  v98 = objc_msgSend(v99, "commonTypeDict_IntegerFormat");
  v232[65] = v98;
  v231[66] = @"xCTA";
  v97 = [MEMORY[0x1E4F929D8] sharedInstance];
  v96 = objc_msgSend(v97, "commonTypeDict_RealFormat");
  v232[66] = v96;
  v231[67] = @"SDTA";
  v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  v94 = objc_msgSend(v95, "commonTypeDict_RealFormat");
  v232[67] = v94;
  v231[68] = @"SDTC";
  v93 = [MEMORY[0x1E4F929D8] sharedInstance];
  v92 = objc_msgSend(v93, "commonTypeDict_RealFormat");
  v232[68] = v92;
  v231[69] = @"TV1s";
  v91 = [MEMORY[0x1E4F929D8] sharedInstance];
  v90 = objc_msgSend(v91, "commonTypeDict_RealFormat");
  v232[69] = v90;
  v231[70] = @"TV3s";
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
  v232[70] = v88;
  v231[71] = @"TVBH";
  v87 = [MEMORY[0x1E4F929D8] sharedInstance];
  v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
  v232[71] = v86;
  v231[72] = @"TTDa";
  v85 = [MEMORY[0x1E4F929D8] sharedInstance];
  v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
  v232[72] = v84;
  v231[73] = @"TPMP";
  v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
  v232[73] = v82;
  v231[74] = @"TCHP";
  v81 = [MEMORY[0x1E4F929D8] sharedInstance];
  v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
  v232[74] = v80;
  v231[75] = @"TH0T";
  v79 = [MEMORY[0x1E4F929D8] sharedInstance];
  v78 = objc_msgSend(v79, "commonTypeDict_RealFormat");
  v232[75] = v78;
  v231[76] = @"TG0B";
  v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
  v232[76] = v76;
  v231[77] = @"zSLi";
  v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
  v232[77] = v74;
  v231[78] = @"zSPi";
  v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_RealFormat");
  v232[78] = v72;
  v231[79] = @"TAOC";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
  v232[79] = v70;
  v231[80] = @"TVBL";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_RealFormat");
  v232[80] = v68;
  v231[81] = @"TVB1";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
  v232[81] = v66;
  v231[82] = @"TVB2";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
  v232[82] = v64;
  v231[83] = @"TVB3";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_RealFormat");
  v232[83] = v62;
  v231[84] = @"TVB4";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_RealFormat");
  v232[84] = v60;
  v231[85] = @"TPSP";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_RealFormat");
  v232[85] = v58;
  v231[86] = @"TIOP";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_RealFormat");
  v232[86] = v56;
  v231[87] = @"TTDb";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_RealFormat");
  v232[87] = v54;
  v231[88] = @"ftD0";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
  v232[88] = v52;
  v231[89] = @"SBAP";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
  v232[89] = v50;
  v231[90] = @"SDTK";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
  v232[90] = v48;
  v231[91] = @"SDTO_";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
  v232[91] = v46;
  v231[92] = @"SDMX";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
  v232[92] = v44;
  v231[93] = @"TSCP";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_RealFormat");
  v232[93] = v42;
  v231[94] = @"RP00";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
  v232[94] = v40;
  v231[95] = @"RP01";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_RealFormat");
  v232[95] = v38;
  v231[96] = @"RP02";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_RealFormat");
  v232[96] = v36;
  v231[97] = @"SDRC";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_RealFormat");
  v232[97] = v34;
  v231[98] = @"SPDM";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_RealFormat");
  v232[98] = v32;
  v231[99] = @"TAOD";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_RealFormat");
  v232[99] = v30;
  v231[100] = @"TVAL";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v232[100] = v28;
  v231[101] = @"SDTZ";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_RealFormat");
  v232[101] = v26;
  v231[102] = @"TPCP";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
  v232[102] = v24;
  v231[103] = @"TTCP";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
  v232[103] = v22;
  v231[104] = @"TDCP";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v232[104] = v20;
  v231[105] = @"TR0Q";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v232[105] = v18;
  v231[106] = @"TMPP";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v232[106] = v16;
  v231[107] = @"TVB5";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v232[107] = v14;
  v231[108] = @"PZCB";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v232[108] = v4;
  v231[109] = @"PZCU";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v232[109] = v6;
  v231[110] = @"PZD1";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v232[110] = v8;
  v231[111] = @"PGDP";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v232[111] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v232 forKeys:v231 count:112];
  v236[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v236 forKeys:v235 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionMetricMonitorInstantKeys
{
  v30[2] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities isPowerlogHelperd])
  {
    v29[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C40];
    v27[0] = *MEMORY[0x1E4F92CD0];
    v27[1] = v2;
    v28[0] = &unk_1F400C6E8;
    v28[1] = MEMORY[0x1E4F1CC38];
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    v30[0] = v24;
    v29[1] = *MEMORY[0x1E4F92CA8];
    v25[0] = @"B0AP";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
    v26[0] = v22;
    v25[1] = @"zSLi";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
    v26[1] = v20;
    v25[2] = @"zSPi";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
    v26[2] = v18;
    v25[3] = @"xRPE";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
    v26[3] = v16;
    v25[4] = @"CHAS";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
    v26[4] = v14;
    v25[5] = @"TB0T";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v26[5] = v4;
    v25[6] = @"TVRM";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v26[6] = v6;
    v25[7] = @"TVBM";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v26[7] = v8;
    v25[8] = @"TVBH";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    v26[8] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:9];
    v30[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"AccumulatedKeys";
  v3 = [a1 entryEventBackwardDefinitionAccumulatedKeys];
  v9[0] = v3;
  v8[1] = @"PowerAccumulatedKeys";
  v4 = [a1 entryEventBackwardDefinitionPowerAccumulatedKeys];
  v9[1] = v4;
  v8[2] = @"DisplayPowerKeys";
  v5 = [a1 entryEventBackwardDefinitionDisplayPowerKeys];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)channelValueKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%s", a3, "channelValue"];
}

+ (id)channelValueDiffKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%s", a3, "channelValueDiff"];
}

+ (id)cycleCountKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%s", a3, "cycleCount"];
}

+ (id)variantKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%s", a3, "variant"];
}

+ (id)entryEventBackwardDefinitionDisplayPowerKeys
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (+[PLSMCAgent shouldModelDisplayPowerFromSMC])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F4011D28;
    v14[1] = @"logDisplayAPL";
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11[0] = @"PDLP";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v11[1] = @"PDEP";
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v16[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

+ (id)entryEventBackwardDefinitionAccumulatedKeys
{
  v316[2] = *MEMORY[0x1E4F143B8];
  v315[0] = *MEMORY[0x1E4F92C50];
  uint64_t v3 = *MEMORY[0x1E4F92C40];
  v313[0] = *MEMORY[0x1E4F92CD0];
  v313[1] = v3;
  v314[0] = &unk_1F4011D38;
  v314[1] = MEMORY[0x1E4F1CC38];
  v310 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v314 forKeys:v313 count:2];
  v316[0] = v310;
  v315[1] = *MEMORY[0x1E4F92CA8];
  v309 = [a1 channelValueKey:@"PH0C"];
  v311[0] = v309;
  v308 = [MEMORY[0x1E4F929D8] sharedInstance];
  v307 = objc_msgSend(v308, "commonTypeDict_RealFormat");
  v312[0] = v307;
  v306 = [a1 cycleCountKey:@"PH0C"];
  v311[1] = v306;
  v305 = [MEMORY[0x1E4F929D8] sharedInstance];
  v304 = objc_msgSend(v305, "commonTypeDict_IntegerFormat");
  v312[1] = v304;
  v303 = [a1 variantKey:@"PH0C"];
  v311[2] = v303;
  v302 = [MEMORY[0x1E4F929D8] sharedInstance];
  v301 = objc_msgSend(v302, "commonTypeDict_IntegerFormat");
  v312[2] = v301;
  v300 = [a1 channelValueKey:@"PH1C"];
  v311[3] = v300;
  v299 = [MEMORY[0x1E4F929D8] sharedInstance];
  v298 = objc_msgSend(v299, "commonTypeDict_RealFormat");
  v312[3] = v298;
  v297 = [a1 cycleCountKey:@"PH1C"];
  v311[4] = v297;
  v296 = [MEMORY[0x1E4F929D8] sharedInstance];
  v295 = objc_msgSend(v296, "commonTypeDict_IntegerFormat");
  v312[4] = v295;
  v294 = [a1 variantKey:@"PH1C"];
  v311[5] = v294;
  v293 = [MEMORY[0x1E4F929D8] sharedInstance];
  v292 = objc_msgSend(v293, "commonTypeDict_IntegerFormat");
  v312[5] = v292;
  v291 = [a1 channelValueKey:@"PH0R"];
  v311[6] = v291;
  v290 = [MEMORY[0x1E4F929D8] sharedInstance];
  v289 = objc_msgSend(v290, "commonTypeDict_RealFormat");
  v312[6] = v289;
  v288 = [a1 cycleCountKey:@"PH0R"];
  v311[7] = v288;
  v287 = [MEMORY[0x1E4F929D8] sharedInstance];
  v286 = objc_msgSend(v287, "commonTypeDict_IntegerFormat");
  v312[7] = v286;
  v285 = [a1 variantKey:@"PH0R"];
  v311[8] = v285;
  v284 = [MEMORY[0x1E4F929D8] sharedInstance];
  v283 = objc_msgSend(v284, "commonTypeDict_IntegerFormat");
  v312[8] = v283;
  v282 = [a1 channelValueKey:@"PH1R"];
  v311[9] = v282;
  v281 = [MEMORY[0x1E4F929D8] sharedInstance];
  v280 = objc_msgSend(v281, "commonTypeDict_RealFormat");
  v312[9] = v280;
  v279 = [a1 cycleCountKey:@"PH1R"];
  v311[10] = v279;
  v278 = [MEMORY[0x1E4F929D8] sharedInstance];
  v277 = objc_msgSend(v278, "commonTypeDict_IntegerFormat");
  v312[10] = v277;
  v276 = [a1 variantKey:@"PH1R"];
  v311[11] = v276;
  v275 = [MEMORY[0x1E4F929D8] sharedInstance];
  v274 = objc_msgSend(v275, "commonTypeDict_IntegerFormat");
  v312[11] = v274;
  v273 = [a1 channelValueKey:@"PM0C"];
  v311[12] = v273;
  v272 = [MEMORY[0x1E4F929D8] sharedInstance];
  v271 = objc_msgSend(v272, "commonTypeDict_RealFormat");
  v312[12] = v271;
  v270 = [a1 cycleCountKey:@"PM0C"];
  v311[13] = v270;
  v269 = [MEMORY[0x1E4F929D8] sharedInstance];
  v268 = objc_msgSend(v269, "commonTypeDict_IntegerFormat");
  v312[13] = v268;
  v267 = [a1 variantKey:@"PM0C"];
  v311[14] = v267;
  v266 = [MEMORY[0x1E4F929D8] sharedInstance];
  v265 = objc_msgSend(v266, "commonTypeDict_IntegerFormat");
  v312[14] = v265;
  v264 = [a1 channelValueKey:@"PM1C"];
  v311[15] = v264;
  v263 = [MEMORY[0x1E4F929D8] sharedInstance];
  v262 = objc_msgSend(v263, "commonTypeDict_RealFormat");
  v312[15] = v262;
  v261 = [a1 cycleCountKey:@"PM1C"];
  v311[16] = v261;
  v260 = [MEMORY[0x1E4F929D8] sharedInstance];
  v259 = objc_msgSend(v260, "commonTypeDict_IntegerFormat");
  v312[16] = v259;
  v258 = [a1 variantKey:@"PM1C"];
  v311[17] = v258;
  v257 = [MEMORY[0x1E4F929D8] sharedInstance];
  v256 = objc_msgSend(v257, "commonTypeDict_IntegerFormat");
  v312[17] = v256;
  v255 = [a1 channelValueKey:@"PC0R"];
  v311[18] = v255;
  v254 = [MEMORY[0x1E4F929D8] sharedInstance];
  v253 = objc_msgSend(v254, "commonTypeDict_RealFormat");
  v312[18] = v253;
  v252 = [a1 cycleCountKey:@"PC0R"];
  v311[19] = v252;
  v251 = [MEMORY[0x1E4F929D8] sharedInstance];
  v250 = objc_msgSend(v251, "commonTypeDict_IntegerFormat");
  v312[19] = v250;
  v249 = [a1 variantKey:@"PC0R"];
  v311[20] = v249;
  v248 = [MEMORY[0x1E4F929D8] sharedInstance];
  v247 = objc_msgSend(v248, "commonTypeDict_IntegerFormat");
  v312[20] = v247;
  v246 = [a1 channelValueKey:@"PCPT"];
  v311[21] = v246;
  v245 = [MEMORY[0x1E4F929D8] sharedInstance];
  v244 = objc_msgSend(v245, "commonTypeDict_RealFormat");
  v312[21] = v244;
  v243 = [a1 cycleCountKey:@"PCPT"];
  v311[22] = v243;
  v242 = [MEMORY[0x1E4F929D8] sharedInstance];
  v241 = objc_msgSend(v242, "commonTypeDict_IntegerFormat");
  v312[22] = v241;
  v240 = [a1 variantKey:@"PCPT"];
  v311[23] = v240;
  v239 = [MEMORY[0x1E4F929D8] sharedInstance];
  v238 = objc_msgSend(v239, "commonTypeDict_IntegerFormat");
  v312[23] = v238;
  v237 = [a1 channelValueKey:@"PG0R"];
  v311[24] = v237;
  v236 = [MEMORY[0x1E4F929D8] sharedInstance];
  v235 = objc_msgSend(v236, "commonTypeDict_RealFormat");
  v312[24] = v235;
  v234 = [a1 cycleCountKey:@"PG0R"];
  v311[25] = v234;
  v233 = [MEMORY[0x1E4F929D8] sharedInstance];
  v232 = objc_msgSend(v233, "commonTypeDict_IntegerFormat");
  v312[25] = v232;
  v231 = [a1 variantKey:@"PG0R"];
  v311[26] = v231;
  v230 = [MEMORY[0x1E4F929D8] sharedInstance];
  v229 = objc_msgSend(v230, "commonTypeDict_IntegerFormat");
  v312[26] = v229;
  v228 = [a1 channelValueKey:@"PSTR"];
  v311[27] = v228;
  v227 = [MEMORY[0x1E4F929D8] sharedInstance];
  v226 = objc_msgSend(v227, "commonTypeDict_RealFormat");
  v312[27] = v226;
  v225 = [a1 cycleCountKey:@"PSTR"];
  v311[28] = v225;
  v224 = [MEMORY[0x1E4F929D8] sharedInstance];
  v223 = objc_msgSend(v224, "commonTypeDict_IntegerFormat");
  v312[28] = v223;
  v222 = [a1 variantKey:@"PSTR"];
  v311[29] = v222;
  v221 = [MEMORY[0x1E4F929D8] sharedInstance];
  v220 = objc_msgSend(v221, "commonTypeDict_IntegerFormat");
  v312[29] = v220;
  v219 = [a1 channelValueKey:@"PBLR"];
  v311[30] = v219;
  v218 = [MEMORY[0x1E4F929D8] sharedInstance];
  v217 = objc_msgSend(v218, "commonTypeDict_RealFormat");
  v312[30] = v217;
  v216 = [a1 cycleCountKey:@"PBLR"];
  v311[31] = v216;
  v215 = [MEMORY[0x1E4F929D8] sharedInstance];
  v214 = objc_msgSend(v215, "commonTypeDict_IntegerFormat");
  v312[31] = v214;
  v213 = [a1 variantKey:@"PBLR"];
  v311[32] = v213;
  v212 = [MEMORY[0x1E4F929D8] sharedInstance];
  v211 = objc_msgSend(v212, "commonTypeDict_IntegerFormat");
  v312[32] = v211;
  v210 = [a1 channelValueKey:@"PCAC"];
  v311[33] = v210;
  v209 = [MEMORY[0x1E4F929D8] sharedInstance];
  v208 = objc_msgSend(v209, "commonTypeDict_RealFormat");
  v312[33] = v208;
  v207 = [a1 cycleCountKey:@"PCAC"];
  v311[34] = v207;
  v206 = [MEMORY[0x1E4F929D8] sharedInstance];
  v205 = objc_msgSend(v206, "commonTypeDict_IntegerFormat");
  v312[34] = v205;
  v204 = [a1 variantKey:@"PCAC"];
  v311[35] = v204;
  v203 = [MEMORY[0x1E4F929D8] sharedInstance];
  v202 = objc_msgSend(v203, "commonTypeDict_IntegerFormat");
  v312[35] = v202;
  v201 = [a1 channelValueKey:@"PCIC"];
  v311[36] = v201;
  v200 = [MEMORY[0x1E4F929D8] sharedInstance];
  v199 = objc_msgSend(v200, "commonTypeDict_RealFormat");
  v312[36] = v199;
  v198 = [a1 cycleCountKey:@"PCIC"];
  v311[37] = v198;
  v197 = [MEMORY[0x1E4F929D8] sharedInstance];
  v196 = objc_msgSend(v197, "commonTypeDict_IntegerFormat");
  v312[37] = v196;
  v195 = [a1 variantKey:@"PCIC"];
  v311[38] = v195;
  v194 = [MEMORY[0x1E4F929D8] sharedInstance];
  v193 = objc_msgSend(v194, "commonTypeDict_IntegerFormat");
  v312[38] = v193;
  v192 = [a1 channelValueKey:@"PCPC"];
  v311[39] = v192;
  v191 = [MEMORY[0x1E4F929D8] sharedInstance];
  v190 = objc_msgSend(v191, "commonTypeDict_RealFormat");
  v312[39] = v190;
  v189 = [a1 cycleCountKey:@"PCPC"];
  v311[40] = v189;
  v188 = [MEMORY[0x1E4F929D8] sharedInstance];
  v187 = objc_msgSend(v188, "commonTypeDict_IntegerFormat");
  v312[40] = v187;
  v186 = [a1 variantKey:@"PCPC"];
  v311[41] = v186;
  v185 = [MEMORY[0x1E4F929D8] sharedInstance];
  v184 = objc_msgSend(v185, "commonTypeDict_IntegerFormat");
  v312[41] = v184;
  v183 = [a1 channelValueKey:@"PCPG"];
  v311[42] = v183;
  v182 = [MEMORY[0x1E4F929D8] sharedInstance];
  v181 = objc_msgSend(v182, "commonTypeDict_RealFormat");
  v312[42] = v181;
  v180 = [a1 cycleCountKey:@"PCPG"];
  v311[43] = v180;
  v179 = [MEMORY[0x1E4F929D8] sharedInstance];
  v178 = objc_msgSend(v179, "commonTypeDict_IntegerFormat");
  v312[43] = v178;
  v177 = [a1 variantKey:@"PCPG"];
  v311[44] = v177;
  v176 = [MEMORY[0x1E4F929D8] sharedInstance];
  v175 = objc_msgSend(v176, "commonTypeDict_IntegerFormat");
  v312[44] = v175;
  v174 = [a1 channelValueKey:@"PCTC"];
  v311[45] = v174;
  v173 = [MEMORY[0x1E4F929D8] sharedInstance];
  v172 = objc_msgSend(v173, "commonTypeDict_RealFormat");
  v312[45] = v172;
  v171 = [a1 cycleCountKey:@"PCTC"];
  v311[46] = v171;
  v170 = [MEMORY[0x1E4F929D8] sharedInstance];
  v169 = objc_msgSend(v170, "commonTypeDict_IntegerFormat");
  v312[46] = v169;
  v168 = [a1 variantKey:@"PCTC"];
  v311[47] = v168;
  v167 = [MEMORY[0x1E4F929D8] sharedInstance];
  v166 = objc_msgSend(v167, "commonTypeDict_IntegerFormat");
  v312[47] = v166;
  v165 = [a1 channelValueKey:@"PG0C"];
  v311[48] = v165;
  v164 = [MEMORY[0x1E4F929D8] sharedInstance];
  v163 = objc_msgSend(v164, "commonTypeDict_RealFormat");
  v312[48] = v163;
  v162 = [a1 cycleCountKey:@"PG0C"];
  v311[49] = v162;
  v161 = [MEMORY[0x1E4F929D8] sharedInstance];
  v160 = objc_msgSend(v161, "commonTypeDict_IntegerFormat");
  v312[49] = v160;
  v159 = [a1 variantKey:@"PG0C"];
  v311[50] = v159;
  v158 = [MEMORY[0x1E4F929D8] sharedInstance];
  v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat");
  v312[50] = v157;
  v156 = [a1 channelValueKey:@"PLDC"];
  v311[51] = v156;
  v155 = [MEMORY[0x1E4F929D8] sharedInstance];
  v154 = objc_msgSend(v155, "commonTypeDict_RealFormat");
  v312[51] = v154;
  v153 = [a1 cycleCountKey:@"PLDC"];
  v311[52] = v153;
  v152 = [MEMORY[0x1E4F929D8] sharedInstance];
  v151 = objc_msgSend(v152, "commonTypeDict_IntegerFormat");
  v312[52] = v151;
  v150 = [a1 variantKey:@"PLDC"];
  v311[53] = v150;
  v149 = [MEMORY[0x1E4F929D8] sharedInstance];
  v148 = objc_msgSend(v149, "commonTypeDict_IntegerFormat");
  v312[53] = v148;
  v147 = [a1 channelValueKey:@"PMCC"];
  v311[54] = v147;
  v146 = [MEMORY[0x1E4F929D8] sharedInstance];
  v145 = objc_msgSend(v146, "commonTypeDict_RealFormat");
  v312[54] = v145;
  v144 = [a1 cycleCountKey:@"PMCC"];
  v311[55] = v144;
  v143 = [MEMORY[0x1E4F929D8] sharedInstance];
  v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
  v312[55] = v142;
  v141 = [a1 variantKey:@"PMCC"];
  v311[56] = v141;
  v140 = [MEMORY[0x1E4F929D8] sharedInstance];
  v139 = objc_msgSend(v140, "commonTypeDict_IntegerFormat");
  v312[56] = v139;
  v138 = [a1 channelValueKey:@"PO5R"];
  v311[57] = v138;
  v137 = [MEMORY[0x1E4F929D8] sharedInstance];
  v136 = objc_msgSend(v137, "commonTypeDict_RealFormat");
  v312[57] = v136;
  v135 = [a1 cycleCountKey:@"PO5R"];
  v311[58] = v135;
  v134 = [MEMORY[0x1E4F929D8] sharedInstance];
  v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat");
  v312[58] = v133;
  v132 = [a1 variantKey:@"PO5R"];
  v311[59] = v132;
  v131 = [MEMORY[0x1E4F929D8] sharedInstance];
  v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
  v312[59] = v130;
  v129 = [a1 channelValueKey:@"POLR"];
  v311[60] = v129;
  v128 = [MEMORY[0x1E4F929D8] sharedInstance];
  v127 = objc_msgSend(v128, "commonTypeDict_RealFormat");
  v312[60] = v127;
  v126 = [a1 cycleCountKey:@"POLR"];
  v311[61] = v126;
  v125 = [MEMORY[0x1E4F929D8] sharedInstance];
  v124 = objc_msgSend(v125, "commonTypeDict_IntegerFormat");
  v312[61] = v124;
  v123 = [a1 variantKey:@"POLR"];
  v311[62] = v123;
  v122 = [MEMORY[0x1E4F929D8] sharedInstance];
  v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat");
  v312[62] = v121;
  v120 = [a1 channelValueKey:@"PORR"];
  v311[63] = v120;
  v119 = [MEMORY[0x1E4F929D8] sharedInstance];
  v118 = objc_msgSend(v119, "commonTypeDict_RealFormat");
  v312[63] = v118;
  v117 = [a1 cycleCountKey:@"PORR"];
  v311[64] = v117;
  v116 = [MEMORY[0x1E4F929D8] sharedInstance];
  v115 = objc_msgSend(v116, "commonTypeDict_IntegerFormat");
  v312[64] = v115;
  v114 = [a1 variantKey:@"PORR"];
  v311[65] = v114;
  v113 = [MEMORY[0x1E4F929D8] sharedInstance];
  v112 = objc_msgSend(v113, "commonTypeDict_IntegerFormat");
  v312[65] = v112;
  v111 = [a1 channelValueKey:@"PPBR"];
  v311[66] = v111;
  v110 = [MEMORY[0x1E4F929D8] sharedInstance];
  v109 = objc_msgSend(v110, "commonTypeDict_RealFormat");
  v312[66] = v109;
  v108 = [a1 cycleCountKey:@"PPBR"];
  v311[67] = v108;
  v107 = [MEMORY[0x1E4F929D8] sharedInstance];
  v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
  v312[67] = v106;
  v105 = [a1 variantKey:@"PPBR"];
  v311[68] = v105;
  v104 = [MEMORY[0x1E4F929D8] sharedInstance];
  v103 = objc_msgSend(v104, "commonTypeDict_IntegerFormat");
  v312[68] = v103;
  v102 = [a1 channelValueKey:@"PS1C"];
  v311[69] = v102;
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
  v312[69] = v100;
  v99 = [a1 cycleCountKey:@"PS1C"];
  v311[70] = v99;
  v98 = [MEMORY[0x1E4F929D8] sharedInstance];
  v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat");
  v312[70] = v97;
  v96 = [a1 variantKey:@"PS1C"];
  v311[71] = v96;
  v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v312[71] = v94;
  v93 = [a1 channelValueKey:@"PSLC"];
  v311[72] = v93;
  v92 = [MEMORY[0x1E4F929D8] sharedInstance];
  v91 = objc_msgSend(v92, "commonTypeDict_RealFormat");
  v312[72] = v91;
  v90 = [a1 cycleCountKey:@"PSLC"];
  v311[73] = v90;
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  v88 = objc_msgSend(v89, "commonTypeDict_IntegerFormat");
  v312[73] = v88;
  v87 = [a1 variantKey:@"PSLC"];
  v311[74] = v87;
  v86 = [MEMORY[0x1E4F929D8] sharedInstance];
  v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
  v312[74] = v85;
  v84 = [a1 channelValueKey:@"B0AP"];
  v311[75] = v84;
  v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
  v312[75] = v82;
  v81 = [a1 cycleCountKey:@"B0AP"];
  v311[76] = v81;
  v80 = [MEMORY[0x1E4F929D8] sharedInstance];
  v79 = objc_msgSend(v80, "commonTypeDict_IntegerFormat");
  v312[76] = v79;
  v78 = [a1 variantKey:@"B0AP"];
  v311[77] = v78;
  v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_IntegerFormat");
  v312[77] = v76;
  v75 = [a1 channelValueKey:@"PG0R"];
  v311[78] = v75;
  v74 = [MEMORY[0x1E4F929D8] sharedInstance];
  v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
  v312[78] = v73;
  v72 = [a1 cycleCountKey:@"PG0R"];
  v311[79] = v72;
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v312[79] = v70;
  v69 = [a1 variantKey:@"PG0R"];
  v311[80] = v69;
  v68 = [MEMORY[0x1E4F929D8] sharedInstance];
  v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v312[80] = v67;
  v66 = [a1 channelValueKey:@"PAPC"];
  v311[81] = v66;
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
  v312[81] = v64;
  v63 = [a1 cycleCountKey:@"PAPC"];
  v311[82] = v63;
  v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v312[82] = v61;
  v60 = [a1 variantKey:@"PAPC"];
  v311[83] = v60;
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v312[83] = v58;
  v57 = [a1 channelValueKey:@"MSAc"];
  v311[84] = v57;
  v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_RealFormat");
  v312[84] = v55;
  v54 = [a1 cycleCountKey:@"MSAc"];
  v311[85] = v54;
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v312[85] = v52;
  v51 = [a1 variantKey:@"MSAc"];
  v311[86] = v51;
  v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v312[86] = v49;
  v48 = [a1 channelValueKey:@"MSAg"];
  v311[87] = v48;
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_RealFormat");
  v312[87] = v46;
  v45 = [a1 cycleCountKey:@"MSAg"];
  v311[88] = v45;
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v312[88] = v43;
  v42 = [a1 variantKey:@"MSAg"];
  v311[89] = v42;
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v312[89] = v40;
  v39 = [a1 channelValueKey:@"MSAi"];
  v311[90] = v39;
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
  v312[90] = v37;
  v36 = [a1 cycleCountKey:@"MSAi"];
  v311[91] = v36;
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v312[91] = v34;
  v33 = [a1 variantKey:@"MSAi"];
  v311[92] = v33;
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v312[92] = v31;
  v30 = [a1 channelValueKey:@"PW3C"];
  v311[93] = v30;
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v312[93] = v28;
  v27 = [a1 channelValueDiffKey:@"PW3C"];
  v311[94] = v27;
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_RealFormat");
  v312[94] = v25;
  v24 = [a1 cycleCountKey:@"PW3C"];
  v311[95] = v24;
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v312[95] = v22;
  v21 = [a1 variantKey:@"PW3C"];
  v311[96] = v21;
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v312[96] = v19;
  v18 = [a1 channelValueKey:@"PO3R"];
  v311[97] = v18;
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v312[97] = v16;
  v15 = [a1 channelValueDiffKey:@"PO3R"];
  v311[98] = v15;
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
  v312[98] = v5;
  v6 = [a1 cycleCountKey:@"PO3R"];
  v311[99] = v6;
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v312[99] = v8;
  v9 = [a1 variantKey:@"PO3R"];
  v311[100] = v9;
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v312[100] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v312 forKeys:v311 count:101];
  v316[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v316 forKeys:v315 count:2];

  return v13;
}

+ (id)entryEventBackwardDefinitionPowerAccumulatedKeys
{
  v445[2] = *MEMORY[0x1E4F143B8];
  v444[0] = *MEMORY[0x1E4F92C50];
  uint64_t v3 = *MEMORY[0x1E4F92C40];
  v442[0] = *MEMORY[0x1E4F92CD0];
  v442[1] = v3;
  v443[0] = &unk_1F4011D48;
  v443[1] = MEMORY[0x1E4F1CC38];
  v439 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v443 forKeys:v442 count:2];
  v445[0] = v439;
  v444[1] = *MEMORY[0x1E4F92CA8];
  v438 = [a1 channelValueKey:@"PBat"];
  v440[0] = v438;
  v437 = [MEMORY[0x1E4F929D8] sharedInstance];
  v436 = objc_msgSend(v437, "commonTypeDict_RealFormat");
  v441[0] = v436;
  v435 = [a1 cycleCountKey:@"PBat"];
  v440[1] = v435;
  v434 = [MEMORY[0x1E4F929D8] sharedInstance];
  v433 = objc_msgSend(v434, "commonTypeDict_IntegerFormat");
  v441[1] = v433;
  v432 = [a1 variantKey:@"PBat"];
  v440[2] = v432;
  v431 = [MEMORY[0x1E4F929D8] sharedInstance];
  v430 = objc_msgSend(v431, "commonTypeDict_IntegerFormat");
  v441[2] = v430;
  v429 = [a1 channelValueDiffKey:@"PBat"];
  v440[3] = v429;
  v428 = [MEMORY[0x1E4F929D8] sharedInstance];
  v427 = objc_msgSend(v428, "commonTypeDict_RealFormat");
  v441[3] = v427;
  v426 = [a1 channelValueKey:@"PSTR"];
  v440[4] = v426;
  v425 = [MEMORY[0x1E4F929D8] sharedInstance];
  v424 = objc_msgSend(v425, "commonTypeDict_RealFormat");
  v441[4] = v424;
  v423 = [a1 cycleCountKey:@"PSTR"];
  v440[5] = v423;
  v422 = [MEMORY[0x1E4F929D8] sharedInstance];
  v421 = objc_msgSend(v422, "commonTypeDict_IntegerFormat");
  v441[5] = v421;
  v420 = [a1 variantKey:@"PSTR"];
  v440[6] = v420;
  v419 = [MEMORY[0x1E4F929D8] sharedInstance];
  v418 = objc_msgSend(v419, "commonTypeDict_IntegerFormat");
  v441[6] = v418;
  v417 = [a1 channelValueDiffKey:@"PSTR"];
  v440[7] = v417;
  v416 = [MEMORY[0x1E4F929D8] sharedInstance];
  v415 = objc_msgSend(v416, "commonTypeDict_RealFormat");
  v441[7] = v415;
  v414 = [a1 channelValueKey:@"VBat"];
  v440[8] = v414;
  v413 = [MEMORY[0x1E4F929D8] sharedInstance];
  v412 = objc_msgSend(v413, "commonTypeDict_RealFormat");
  v441[8] = v412;
  v411 = [a1 cycleCountKey:@"VBat"];
  v440[9] = v411;
  v410 = [MEMORY[0x1E4F929D8] sharedInstance];
  v409 = objc_msgSend(v410, "commonTypeDict_IntegerFormat");
  v441[9] = v409;
  v408 = [a1 variantKey:@"VBat"];
  v440[10] = v408;
  v407 = [MEMORY[0x1E4F929D8] sharedInstance];
  v406 = objc_msgSend(v407, "commonTypeDict_IntegerFormat");
  v441[10] = v406;
  v405 = [a1 channelValueDiffKey:@"VBat"];
  v440[11] = v405;
  v404 = [MEMORY[0x1E4F929D8] sharedInstance];
  v403 = objc_msgSend(v404, "commonTypeDict_RealFormat");
  v441[11] = v403;
  v402 = [a1 channelValueKey:@"PDEP"];
  v440[12] = v402;
  v401 = [MEMORY[0x1E4F929D8] sharedInstance];
  v400 = objc_msgSend(v401, "commonTypeDict_RealFormat");
  v441[12] = v400;
  v399 = [a1 cycleCountKey:@"PDEP"];
  v440[13] = v399;
  v398 = [MEMORY[0x1E4F929D8] sharedInstance];
  v397 = objc_msgSend(v398, "commonTypeDict_IntegerFormat");
  v441[13] = v397;
  v396 = [a1 variantKey:@"PDEP"];
  v440[14] = v396;
  v395 = [MEMORY[0x1E4F929D8] sharedInstance];
  v394 = objc_msgSend(v395, "commonTypeDict_IntegerFormat");
  v441[14] = v394;
  v393 = [a1 channelValueDiffKey:@"PDEP"];
  v440[15] = v393;
  v392 = [MEMORY[0x1E4F929D8] sharedInstance];
  v391 = objc_msgSend(v392, "commonTypeDict_RealFormat");
  v441[15] = v391;
  v390 = [a1 channelValueKey:@"PDLP"];
  v440[16] = v390;
  v389 = [MEMORY[0x1E4F929D8] sharedInstance];
  v388 = objc_msgSend(v389, "commonTypeDict_RealFormat");
  v441[16] = v388;
  v387 = [a1 cycleCountKey:@"PDLP"];
  v440[17] = v387;
  v386 = [MEMORY[0x1E4F929D8] sharedInstance];
  v385 = objc_msgSend(v386, "commonTypeDict_IntegerFormat");
  v441[17] = v385;
  v384 = [a1 variantKey:@"PDLP"];
  v440[18] = v384;
  v383 = [MEMORY[0x1E4F929D8] sharedInstance];
  v382 = objc_msgSend(v383, "commonTypeDict_IntegerFormat");
  v441[18] = v382;
  v381 = [a1 channelValueDiffKey:@"PDLP"];
  v440[19] = v381;
  v380 = [MEMORY[0x1E4F929D8] sharedInstance];
  v379 = objc_msgSend(v380, "commonTypeDict_RealFormat");
  v441[19] = v379;
  v378 = [a1 channelValueKey:@"PP0b"];
  v440[20] = v378;
  v377 = [MEMORY[0x1E4F929D8] sharedInstance];
  v376 = objc_msgSend(v377, "commonTypeDict_RealFormat");
  v441[20] = v376;
  v375 = [a1 cycleCountKey:@"PP0b"];
  v440[21] = v375;
  v374 = [MEMORY[0x1E4F929D8] sharedInstance];
  v373 = objc_msgSend(v374, "commonTypeDict_IntegerFormat");
  v441[21] = v373;
  v372 = [a1 variantKey:@"PP0b"];
  v440[22] = v372;
  v371 = [MEMORY[0x1E4F929D8] sharedInstance];
  v370 = objc_msgSend(v371, "commonTypeDict_IntegerFormat");
  v441[22] = v370;
  v369 = [a1 channelValueDiffKey:@"PP0b"];
  v440[23] = v369;
  v368 = [MEMORY[0x1E4F929D8] sharedInstance];
  v367 = objc_msgSend(v368, "commonTypeDict_RealFormat");
  v441[23] = v367;
  v366 = [a1 channelValueKey:@"PP1b"];
  v440[24] = v366;
  v365 = [MEMORY[0x1E4F929D8] sharedInstance];
  v364 = objc_msgSend(v365, "commonTypeDict_RealFormat");
  v441[24] = v364;
  v363 = [a1 cycleCountKey:@"PP1b"];
  v440[25] = v363;
  v362 = [MEMORY[0x1E4F929D8] sharedInstance];
  v361 = objc_msgSend(v362, "commonTypeDict_IntegerFormat");
  v441[25] = v361;
  v360 = [a1 variantKey:@"PP1b"];
  v440[26] = v360;
  v359 = [MEMORY[0x1E4F929D8] sharedInstance];
  v358 = objc_msgSend(v359, "commonTypeDict_IntegerFormat");
  v441[26] = v358;
  v357 = [a1 channelValueDiffKey:@"PP1b"];
  v440[27] = v357;
  v356 = [MEMORY[0x1E4F929D8] sharedInstance];
  v355 = objc_msgSend(v356, "commonTypeDict_RealFormat");
  v441[27] = v355;
  v354 = [a1 channelValueKey:@"PP2b"];
  v440[28] = v354;
  v353 = [MEMORY[0x1E4F929D8] sharedInstance];
  v352 = objc_msgSend(v353, "commonTypeDict_RealFormat");
  v441[28] = v352;
  v351 = [a1 cycleCountKey:@"PP2b"];
  v440[29] = v351;
  v350 = [MEMORY[0x1E4F929D8] sharedInstance];
  v349 = objc_msgSend(v350, "commonTypeDict_IntegerFormat");
  v441[29] = v349;
  v348 = [a1 variantKey:@"PP2b"];
  v440[30] = v348;
  v347 = [MEMORY[0x1E4F929D8] sharedInstance];
  v346 = objc_msgSend(v347, "commonTypeDict_IntegerFormat");
  v441[30] = v346;
  v345 = [a1 channelValueDiffKey:@"PP2b"];
  v440[31] = v345;
  v344 = [MEMORY[0x1E4F929D8] sharedInstance];
  v343 = objc_msgSend(v344, "commonTypeDict_RealFormat");
  v441[31] = v343;
  v342 = [a1 channelValueKey:@"PP3b"];
  v440[32] = v342;
  v341 = [MEMORY[0x1E4F929D8] sharedInstance];
  v340 = objc_msgSend(v341, "commonTypeDict_RealFormat");
  v441[32] = v340;
  v339 = [a1 cycleCountKey:@"PP3b"];
  v440[33] = v339;
  v338 = [MEMORY[0x1E4F929D8] sharedInstance];
  v337 = objc_msgSend(v338, "commonTypeDict_IntegerFormat");
  v441[33] = v337;
  v336 = [a1 variantKey:@"PP3b"];
  v440[34] = v336;
  v335 = [MEMORY[0x1E4F929D8] sharedInstance];
  v334 = objc_msgSend(v335, "commonTypeDict_IntegerFormat");
  v441[34] = v334;
  v333 = [a1 channelValueDiffKey:@"PP3b"];
  v440[35] = v333;
  v332 = [MEMORY[0x1E4F929D8] sharedInstance];
  v331 = objc_msgSend(v332, "commonTypeDict_RealFormat");
  v441[35] = v331;
  v330 = [a1 channelValueKey:@"PP4b"];
  v440[36] = v330;
  v329 = [MEMORY[0x1E4F929D8] sharedInstance];
  v328 = objc_msgSend(v329, "commonTypeDict_RealFormat");
  v441[36] = v328;
  v327 = [a1 cycleCountKey:@"PP4b"];
  v440[37] = v327;
  v326 = [MEMORY[0x1E4F929D8] sharedInstance];
  v325 = objc_msgSend(v326, "commonTypeDict_IntegerFormat");
  v441[37] = v325;
  v324 = [a1 variantKey:@"PP4b"];
  v440[38] = v324;
  v323 = [MEMORY[0x1E4F929D8] sharedInstance];
  v322 = objc_msgSend(v323, "commonTypeDict_IntegerFormat");
  v441[38] = v322;
  v321 = [a1 channelValueDiffKey:@"PP4b"];
  v440[39] = v321;
  v320 = [MEMORY[0x1E4F929D8] sharedInstance];
  v319 = objc_msgSend(v320, "commonTypeDict_RealFormat");
  v441[39] = v319;
  v318 = [a1 channelValueKey:@"PP5b"];
  v440[40] = v318;
  v317 = [MEMORY[0x1E4F929D8] sharedInstance];
  v316 = objc_msgSend(v317, "commonTypeDict_RealFormat");
  v441[40] = v316;
  v315 = [a1 cycleCountKey:@"PP5b"];
  v440[41] = v315;
  v314 = [MEMORY[0x1E4F929D8] sharedInstance];
  v313 = objc_msgSend(v314, "commonTypeDict_IntegerFormat");
  v441[41] = v313;
  v312 = [a1 variantKey:@"PP5b"];
  v440[42] = v312;
  v311 = [MEMORY[0x1E4F929D8] sharedInstance];
  v310 = objc_msgSend(v311, "commonTypeDict_IntegerFormat");
  v441[42] = v310;
  v309 = [a1 channelValueDiffKey:@"PP5b"];
  v440[43] = v309;
  v308 = [MEMORY[0x1E4F929D8] sharedInstance];
  v307 = objc_msgSend(v308, "commonTypeDict_RealFormat");
  v441[43] = v307;
  v306 = [a1 channelValueKey:@"PP6b"];
  v440[44] = v306;
  v305 = [MEMORY[0x1E4F929D8] sharedInstance];
  v304 = objc_msgSend(v305, "commonTypeDict_RealFormat");
  v441[44] = v304;
  v303 = [a1 cycleCountKey:@"PP6b"];
  v440[45] = v303;
  v302 = [MEMORY[0x1E4F929D8] sharedInstance];
  v301 = objc_msgSend(v302, "commonTypeDict_IntegerFormat");
  v441[45] = v301;
  v300 = [a1 variantKey:@"PP6b"];
  v440[46] = v300;
  v299 = [MEMORY[0x1E4F929D8] sharedInstance];
  v298 = objc_msgSend(v299, "commonTypeDict_IntegerFormat");
  v441[46] = v298;
  v297 = [a1 channelValueDiffKey:@"PP6b"];
  v440[47] = v297;
  v296 = [MEMORY[0x1E4F929D8] sharedInstance];
  v295 = objc_msgSend(v296, "commonTypeDict_RealFormat");
  v441[47] = v295;
  v294 = [a1 channelValueKey:@"PP7b"];
  v440[48] = v294;
  v293 = [MEMORY[0x1E4F929D8] sharedInstance];
  v292 = objc_msgSend(v293, "commonTypeDict_RealFormat");
  v441[48] = v292;
  v291 = [a1 cycleCountKey:@"PP7b"];
  v440[49] = v291;
  v290 = [MEMORY[0x1E4F929D8] sharedInstance];
  v289 = objc_msgSend(v290, "commonTypeDict_IntegerFormat");
  v441[49] = v289;
  v288 = [a1 variantKey:@"PP7b"];
  v440[50] = v288;
  v287 = [MEMORY[0x1E4F929D8] sharedInstance];
  v286 = objc_msgSend(v287, "commonTypeDict_IntegerFormat");
  v441[50] = v286;
  v285 = [a1 channelValueDiffKey:@"PP7b"];
  v440[51] = v285;
  v284 = [MEMORY[0x1E4F929D8] sharedInstance];
  v283 = objc_msgSend(v284, "commonTypeDict_RealFormat");
  v441[51] = v283;
  v282 = [a1 channelValueKey:@"PP8b"];
  v440[52] = v282;
  v281 = [MEMORY[0x1E4F929D8] sharedInstance];
  v280 = objc_msgSend(v281, "commonTypeDict_RealFormat");
  v441[52] = v280;
  v279 = [a1 cycleCountKey:@"PP8b"];
  v440[53] = v279;
  v278 = [MEMORY[0x1E4F929D8] sharedInstance];
  v277 = objc_msgSend(v278, "commonTypeDict_IntegerFormat");
  v441[53] = v277;
  v276 = [a1 variantKey:@"PP8b"];
  v440[54] = v276;
  v275 = [MEMORY[0x1E4F929D8] sharedInstance];
  v274 = objc_msgSend(v275, "commonTypeDict_IntegerFormat");
  v441[54] = v274;
  v273 = [a1 channelValueDiffKey:@"PP8b"];
  v440[55] = v273;
  v272 = [MEMORY[0x1E4F929D8] sharedInstance];
  v271 = objc_msgSend(v272, "commonTypeDict_RealFormat");
  v441[55] = v271;
  v270 = [a1 channelValueKey:@"PP9b"];
  v440[56] = v270;
  v269 = [MEMORY[0x1E4F929D8] sharedInstance];
  v268 = objc_msgSend(v269, "commonTypeDict_RealFormat");
  v441[56] = v268;
  v267 = [a1 cycleCountKey:@"PP9b"];
  v440[57] = v267;
  v266 = [MEMORY[0x1E4F929D8] sharedInstance];
  v265 = objc_msgSend(v266, "commonTypeDict_IntegerFormat");
  v441[57] = v265;
  v264 = [a1 variantKey:@"PP9b"];
  v440[58] = v264;
  v263 = [MEMORY[0x1E4F929D8] sharedInstance];
  v262 = objc_msgSend(v263, "commonTypeDict_IntegerFormat");
  v441[58] = v262;
  v261 = [a1 channelValueDiffKey:@"PP9b"];
  v440[59] = v261;
  v260 = [MEMORY[0x1E4F929D8] sharedInstance];
  v259 = objc_msgSend(v260, "commonTypeDict_RealFormat");
  v441[59] = v259;
  v258 = [a1 channelValueKey:@"PPab"];
  v440[60] = v258;
  v257 = [MEMORY[0x1E4F929D8] sharedInstance];
  v256 = objc_msgSend(v257, "commonTypeDict_RealFormat");
  v441[60] = v256;
  v255 = [a1 cycleCountKey:@"PPab"];
  v440[61] = v255;
  v254 = [MEMORY[0x1E4F929D8] sharedInstance];
  v253 = objc_msgSend(v254, "commonTypeDict_IntegerFormat");
  v441[61] = v253;
  v252 = [a1 variantKey:@"PPab"];
  v440[62] = v252;
  v251 = [MEMORY[0x1E4F929D8] sharedInstance];
  v250 = objc_msgSend(v251, "commonTypeDict_IntegerFormat");
  v441[62] = v250;
  v249 = [a1 channelValueDiffKey:@"PPab"];
  v440[63] = v249;
  v248 = [MEMORY[0x1E4F929D8] sharedInstance];
  v247 = objc_msgSend(v248, "commonTypeDict_RealFormat");
  v441[63] = v247;
  v246 = [a1 channelValueKey:@"PPbb"];
  v440[64] = v246;
  v245 = [MEMORY[0x1E4F929D8] sharedInstance];
  v244 = objc_msgSend(v245, "commonTypeDict_RealFormat");
  v441[64] = v244;
  v243 = [a1 cycleCountKey:@"PPbb"];
  v440[65] = v243;
  v242 = [MEMORY[0x1E4F929D8] sharedInstance];
  v241 = objc_msgSend(v242, "commonTypeDict_IntegerFormat");
  v441[65] = v241;
  v240 = [a1 variantKey:@"PPbb"];
  v440[66] = v240;
  v239 = [MEMORY[0x1E4F929D8] sharedInstance];
  v238 = objc_msgSend(v239, "commonTypeDict_IntegerFormat");
  v441[66] = v238;
  v237 = [a1 channelValueDiffKey:@"PPbb"];
  v440[67] = v237;
  v236 = [MEMORY[0x1E4F929D8] sharedInstance];
  v235 = objc_msgSend(v236, "commonTypeDict_RealFormat");
  v441[67] = v235;
  v234 = [a1 channelValueKey:@"PPdb"];
  v440[68] = v234;
  v233 = [MEMORY[0x1E4F929D8] sharedInstance];
  v232 = objc_msgSend(v233, "commonTypeDict_RealFormat");
  v441[68] = v232;
  v231 = [a1 cycleCountKey:@"PPdb"];
  v440[69] = v231;
  v230 = [MEMORY[0x1E4F929D8] sharedInstance];
  v229 = objc_msgSend(v230, "commonTypeDict_IntegerFormat");
  v441[69] = v229;
  v228 = [a1 variantKey:@"PPdb"];
  v440[70] = v228;
  v227 = [MEMORY[0x1E4F929D8] sharedInstance];
  v226 = objc_msgSend(v227, "commonTypeDict_IntegerFormat");
  v441[70] = v226;
  v225 = [a1 channelValueDiffKey:@"PPdb"];
  v440[71] = v225;
  v224 = [MEMORY[0x1E4F929D8] sharedInstance];
  v223 = objc_msgSend(v224, "commonTypeDict_RealFormat");
  v441[71] = v223;
  v222 = [a1 channelValueKey:@"VP0b"];
  v440[72] = v222;
  v221 = [MEMORY[0x1E4F929D8] sharedInstance];
  v220 = objc_msgSend(v221, "commonTypeDict_RealFormat");
  v441[72] = v220;
  v219 = [a1 cycleCountKey:@"VP0b"];
  v440[73] = v219;
  v218 = [MEMORY[0x1E4F929D8] sharedInstance];
  v217 = objc_msgSend(v218, "commonTypeDict_IntegerFormat");
  v441[73] = v217;
  v216 = [a1 variantKey:@"VP0b"];
  v440[74] = v216;
  v215 = [MEMORY[0x1E4F929D8] sharedInstance];
  v214 = objc_msgSend(v215, "commonTypeDict_IntegerFormat");
  v441[74] = v214;
  v213 = [a1 channelValueDiffKey:@"VP0b"];
  v440[75] = v213;
  v212 = [MEMORY[0x1E4F929D8] sharedInstance];
  v211 = objc_msgSend(v212, "commonTypeDict_RealFormat");
  v441[75] = v211;
  v210 = [a1 channelValueKey:@"VP1b"];
  v440[76] = v210;
  v209 = [MEMORY[0x1E4F929D8] sharedInstance];
  v208 = objc_msgSend(v209, "commonTypeDict_RealFormat");
  v441[76] = v208;
  v207 = [a1 cycleCountKey:@"VP1b"];
  v440[77] = v207;
  v206 = [MEMORY[0x1E4F929D8] sharedInstance];
  v205 = objc_msgSend(v206, "commonTypeDict_IntegerFormat");
  v441[77] = v205;
  v204 = [a1 variantKey:@"VP1b"];
  v440[78] = v204;
  v203 = [MEMORY[0x1E4F929D8] sharedInstance];
  v202 = objc_msgSend(v203, "commonTypeDict_IntegerFormat");
  v441[78] = v202;
  v201 = [a1 channelValueDiffKey:@"VP1b"];
  v440[79] = v201;
  v200 = [MEMORY[0x1E4F929D8] sharedInstance];
  v199 = objc_msgSend(v200, "commonTypeDict_RealFormat");
  v441[79] = v199;
  v198 = [a1 channelValueKey:@"VP2b"];
  v440[80] = v198;
  v197 = [MEMORY[0x1E4F929D8] sharedInstance];
  v196 = objc_msgSend(v197, "commonTypeDict_RealFormat");
  v441[80] = v196;
  v195 = [a1 cycleCountKey:@"VP2b"];
  v440[81] = v195;
  v194 = [MEMORY[0x1E4F929D8] sharedInstance];
  v193 = objc_msgSend(v194, "commonTypeDict_IntegerFormat");
  v441[81] = v193;
  v192 = [a1 variantKey:@"VP2b"];
  v440[82] = v192;
  v191 = [MEMORY[0x1E4F929D8] sharedInstance];
  v190 = objc_msgSend(v191, "commonTypeDict_IntegerFormat");
  v441[82] = v190;
  v189 = [a1 channelValueDiffKey:@"VP2b"];
  v440[83] = v189;
  v188 = [MEMORY[0x1E4F929D8] sharedInstance];
  v187 = objc_msgSend(v188, "commonTypeDict_RealFormat");
  v441[83] = v187;
  v186 = [a1 channelValueKey:@"VP3b"];
  v440[84] = v186;
  v185 = [MEMORY[0x1E4F929D8] sharedInstance];
  v184 = objc_msgSend(v185, "commonTypeDict_RealFormat");
  v441[84] = v184;
  v183 = [a1 cycleCountKey:@"VP3b"];
  v440[85] = v183;
  v182 = [MEMORY[0x1E4F929D8] sharedInstance];
  v181 = objc_msgSend(v182, "commonTypeDict_IntegerFormat");
  v441[85] = v181;
  v180 = [a1 variantKey:@"VP3b"];
  v440[86] = v180;
  v179 = [MEMORY[0x1E4F929D8] sharedInstance];
  v178 = objc_msgSend(v179, "commonTypeDict_IntegerFormat");
  v441[86] = v178;
  v177 = [a1 channelValueDiffKey:@"VP3b"];
  v440[87] = v177;
  v176 = [MEMORY[0x1E4F929D8] sharedInstance];
  v175 = objc_msgSend(v176, "commonTypeDict_RealFormat");
  v441[87] = v175;
  v174 = [a1 channelValueKey:@"VP4b"];
  v440[88] = v174;
  v173 = [MEMORY[0x1E4F929D8] sharedInstance];
  v172 = objc_msgSend(v173, "commonTypeDict_RealFormat");
  v441[88] = v172;
  v171 = [a1 cycleCountKey:@"VP4b"];
  v440[89] = v171;
  v170 = [MEMORY[0x1E4F929D8] sharedInstance];
  v169 = objc_msgSend(v170, "commonTypeDict_IntegerFormat");
  v441[89] = v169;
  v168 = [a1 variantKey:@"VP4b"];
  v440[90] = v168;
  v167 = [MEMORY[0x1E4F929D8] sharedInstance];
  v166 = objc_msgSend(v167, "commonTypeDict_IntegerFormat");
  v441[90] = v166;
  v165 = [a1 channelValueDiffKey:@"VP4b"];
  v440[91] = v165;
  v164 = [MEMORY[0x1E4F929D8] sharedInstance];
  v163 = objc_msgSend(v164, "commonTypeDict_RealFormat");
  v441[91] = v163;
  v162 = [a1 channelValueKey:@"VP5b"];
  v440[92] = v162;
  v161 = [MEMORY[0x1E4F929D8] sharedInstance];
  v160 = objc_msgSend(v161, "commonTypeDict_RealFormat");
  v441[92] = v160;
  v159 = [a1 cycleCountKey:@"VP5b"];
  v440[93] = v159;
  v158 = [MEMORY[0x1E4F929D8] sharedInstance];
  v157 = objc_msgSend(v158, "commonTypeDict_IntegerFormat");
  v441[93] = v157;
  v156 = [a1 variantKey:@"VP5b"];
  v440[94] = v156;
  v155 = [MEMORY[0x1E4F929D8] sharedInstance];
  v154 = objc_msgSend(v155, "commonTypeDict_IntegerFormat");
  v441[94] = v154;
  v153 = [a1 channelValueDiffKey:@"VP5b"];
  v440[95] = v153;
  v152 = [MEMORY[0x1E4F929D8] sharedInstance];
  v151 = objc_msgSend(v152, "commonTypeDict_RealFormat");
  v441[95] = v151;
  v150 = [a1 channelValueKey:@"VP6b"];
  v440[96] = v150;
  v149 = [MEMORY[0x1E4F929D8] sharedInstance];
  v148 = objc_msgSend(v149, "commonTypeDict_RealFormat");
  v441[96] = v148;
  v147 = [a1 cycleCountKey:@"VP6b"];
  v440[97] = v147;
  v146 = [MEMORY[0x1E4F929D8] sharedInstance];
  v145 = objc_msgSend(v146, "commonTypeDict_IntegerFormat");
  v441[97] = v145;
  v144 = [a1 variantKey:@"VP6b"];
  v440[98] = v144;
  v143 = [MEMORY[0x1E4F929D8] sharedInstance];
  v142 = objc_msgSend(v143, "commonTypeDict_IntegerFormat");
  v441[98] = v142;
  v141 = [a1 channelValueDiffKey:@"VP6b"];
  v440[99] = v141;
  v140 = [MEMORY[0x1E4F929D8] sharedInstance];
  v139 = objc_msgSend(v140, "commonTypeDict_RealFormat");
  v441[99] = v139;
  v138 = [a1 channelValueKey:@"VP7b"];
  v440[100] = v138;
  v137 = [MEMORY[0x1E4F929D8] sharedInstance];
  v136 = objc_msgSend(v137, "commonTypeDict_RealFormat");
  v441[100] = v136;
  v135 = [a1 cycleCountKey:@"VP7b"];
  v440[101] = v135;
  v134 = [MEMORY[0x1E4F929D8] sharedInstance];
  v133 = objc_msgSend(v134, "commonTypeDict_IntegerFormat");
  v441[101] = v133;
  v132 = [a1 variantKey:@"VP7b"];
  v440[102] = v132;
  v131 = [MEMORY[0x1E4F929D8] sharedInstance];
  v130 = objc_msgSend(v131, "commonTypeDict_IntegerFormat");
  v441[102] = v130;
  v129 = [a1 channelValueDiffKey:@"VP7b"];
  v440[103] = v129;
  v128 = [MEMORY[0x1E4F929D8] sharedInstance];
  v127 = objc_msgSend(v128, "commonTypeDict_RealFormat");
  v441[103] = v127;
  v126 = [a1 channelValueKey:@"VP8b"];
  v440[104] = v126;
  v125 = [MEMORY[0x1E4F929D8] sharedInstance];
  v124 = objc_msgSend(v125, "commonTypeDict_RealFormat");
  v441[104] = v124;
  v123 = [a1 cycleCountKey:@"VP8b"];
  v440[105] = v123;
  v122 = [MEMORY[0x1E4F929D8] sharedInstance];
  v121 = objc_msgSend(v122, "commonTypeDict_IntegerFormat");
  v441[105] = v121;
  v120 = [a1 variantKey:@"VP8b"];
  v440[106] = v120;
  v119 = [MEMORY[0x1E4F929D8] sharedInstance];
  v118 = objc_msgSend(v119, "commonTypeDict_IntegerFormat");
  v441[106] = v118;
  v117 = [a1 channelValueDiffKey:@"VP8b"];
  v440[107] = v117;
  v116 = [MEMORY[0x1E4F929D8] sharedInstance];
  v115 = objc_msgSend(v116, "commonTypeDict_RealFormat");
  v441[107] = v115;
  v114 = [a1 channelValueKey:@"VP9b"];
  v440[108] = v114;
  v113 = [MEMORY[0x1E4F929D8] sharedInstance];
  v112 = objc_msgSend(v113, "commonTypeDict_RealFormat");
  v441[108] = v112;
  v111 = [a1 cycleCountKey:@"VP9b"];
  v440[109] = v111;
  v110 = [MEMORY[0x1E4F929D8] sharedInstance];
  v109 = objc_msgSend(v110, "commonTypeDict_IntegerFormat");
  v441[109] = v109;
  v108 = [a1 variantKey:@"VP9b"];
  v440[110] = v108;
  v107 = [MEMORY[0x1E4F929D8] sharedInstance];
  v106 = objc_msgSend(v107, "commonTypeDict_IntegerFormat");
  v441[110] = v106;
  v105 = [a1 channelValueDiffKey:@"VP9b"];
  v440[111] = v105;
  v104 = [MEMORY[0x1E4F929D8] sharedInstance];
  v103 = objc_msgSend(v104, "commonTypeDict_RealFormat");
  v441[111] = v103;
  v102 = [a1 channelValueKey:@"VPab"];
  v440[112] = v102;
  v101 = [MEMORY[0x1E4F929D8] sharedInstance];
  v100 = objc_msgSend(v101, "commonTypeDict_RealFormat");
  v441[112] = v100;
  v99 = [a1 cycleCountKey:@"VPab"];
  v440[113] = v99;
  v98 = [MEMORY[0x1E4F929D8] sharedInstance];
  v97 = objc_msgSend(v98, "commonTypeDict_IntegerFormat");
  v441[113] = v97;
  v96 = [a1 variantKey:@"VPab"];
  v440[114] = v96;
  v95 = [MEMORY[0x1E4F929D8] sharedInstance];
  v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v441[114] = v94;
  v93 = [a1 channelValueDiffKey:@"VPab"];
  v440[115] = v93;
  v92 = [MEMORY[0x1E4F929D8] sharedInstance];
  v91 = objc_msgSend(v92, "commonTypeDict_RealFormat");
  v441[115] = v91;
  v90 = [a1 channelValueKey:@"VPbb"];
  v440[116] = v90;
  v89 = [MEMORY[0x1E4F929D8] sharedInstance];
  v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
  v441[116] = v88;
  v87 = [a1 cycleCountKey:@"VPbb"];
  v440[117] = v87;
  v86 = [MEMORY[0x1E4F929D8] sharedInstance];
  v85 = objc_msgSend(v86, "commonTypeDict_IntegerFormat");
  v441[117] = v85;
  v84 = [a1 variantKey:@"VPbb"];
  v440[118] = v84;
  v83 = [MEMORY[0x1E4F929D8] sharedInstance];
  v82 = objc_msgSend(v83, "commonTypeDict_IntegerFormat");
  v441[118] = v82;
  v81 = [a1 channelValueDiffKey:@"VPbb"];
  v440[119] = v81;
  v80 = [MEMORY[0x1E4F929D8] sharedInstance];
  v79 = objc_msgSend(v80, "commonTypeDict_RealFormat");
  v441[119] = v79;
  v78 = [a1 channelValueKey:@"VPdb"];
  v440[120] = v78;
  v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_RealFormat");
  v441[120] = v76;
  v75 = [a1 cycleCountKey:@"VPdb"];
  v440[121] = v75;
  v74 = [MEMORY[0x1E4F929D8] sharedInstance];
  v73 = objc_msgSend(v74, "commonTypeDict_IntegerFormat");
  v441[121] = v73;
  v72 = [a1 variantKey:@"VPdb"];
  v440[122] = v72;
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v441[122] = v70;
  v69 = [a1 channelValueDiffKey:@"VPdb"];
  v440[123] = v69;
  v68 = [MEMORY[0x1E4F929D8] sharedInstance];
  v67 = objc_msgSend(v68, "commonTypeDict_RealFormat");
  v441[123] = v67;
  v66 = [a1 channelValueKey:@"PR4b"];
  v440[124] = v66;
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_RealFormat");
  v441[124] = v64;
  v63 = [a1 cycleCountKey:@"PR4b"];
  v440[125] = v63;
  v62 = [MEMORY[0x1E4F929D8] sharedInstance];
  v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v441[125] = v61;
  v60 = [a1 variantKey:@"PR4b"];
  v440[126] = v60;
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v441[126] = v58;
  v57 = [a1 channelValueDiffKey:@"PR4b"];
  v440[127] = v57;
  v56 = [MEMORY[0x1E4F929D8] sharedInstance];
  v55 = objc_msgSend(v56, "commonTypeDict_RealFormat");
  v441[127] = v55;
  v54 = [a1 channelValueKey:@"PZCB"];
  v440[128] = v54;
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
  v441[128] = v52;
  v51 = [a1 cycleCountKey:@"PZCB"];
  v440[129] = v51;
  v50 = [MEMORY[0x1E4F929D8] sharedInstance];
  v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v441[129] = v49;
  v48 = [a1 variantKey:@"PZCB"];
  v440[130] = v48;
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v441[130] = v46;
  v45 = [a1 channelValueDiffKey:@"PZCB"];
  v440[131] = v45;
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_RealFormat");
  v441[131] = v43;
  v42 = [a1 channelValueKey:@"PZCU"];
  v440[132] = v42;
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_RealFormat");
  v441[132] = v40;
  v39 = [a1 cycleCountKey:@"PZCU"];
  v440[133] = v39;
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v441[133] = v37;
  v36 = [a1 variantKey:@"PZCU"];
  v440[134] = v36;
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v441[134] = v34;
  v33 = [a1 channelValueDiffKey:@"PZCU"];
  v440[135] = v33;
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
  v441[135] = v31;
  v30 = [a1 channelValueKey:@"PZD1"];
  v440[136] = v30;
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_RealFormat");
  v441[136] = v28;
  v27 = [a1 cycleCountKey:@"PZD1"];
  v440[137] = v27;
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v441[137] = v25;
  v24 = [a1 variantKey:@"PZD1"];
  v440[138] = v24;
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v441[138] = v22;
  v21 = [a1 channelValueDiffKey:@"PZD1"];
  v440[139] = v21;
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
  v441[139] = v19;
  v18 = [a1 channelValueKey:@"PGDP"];
  v440[140] = v18;
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v441[140] = v16;
  v15 = [a1 cycleCountKey:@"PGDP"];
  v440[141] = v15;
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v441[141] = v5;
  v6 = [a1 variantKey:@"PGDP"];
  v440[142] = v6;
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v441[142] = v8;
  v9 = [a1 channelValueDiffKey:@"PGDP"];
  v440[143] = v9;
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_RealFormat");
  v441[143] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v441 forKeys:v440 count:144];
  v445[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v445 forKeys:v444 count:2];

  return v13;
}

+ (id)entryEventNoneDefinitionPowerDeliveryKeys
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitionDRAMVendorKey
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4011D28;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"MDSV";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"PowerDeliveryKeys";
  uint64_t v3 = [a1 entryEventNoneDefinitionPowerDeliveryKeys];
  v7[1] = @"DRAMVendorKey";
  v8[0] = v3;
  v4 = [a1 entryEventNoneDefinitionDRAMVendorKey];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLSMCAgent)init
{
  v19.receiver = self;
  v19.super_class = (Class)PLSMCAgent;
  uint64_t v2 = [(PLAgent *)&v19 init];
  if (+[PLUtilities isPowerlogHelperd]
    && +[PLSMCAgent supportsBasicSMC]
    || +[PLSMCAgent supportsThermalSMC])
  {
    if (v2)
    {
      v2->_smcConnection = ($BE55D70084A18B56E262C321142BDEE0 *)SMCOpenConnectionWithDefaultService();
      uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      lastAccumValueDict = v2->_lastAccumValueDict;
      v2->_lastAccumValueDict = v3;

      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      lastAccumCycleCountDict = v2->_lastAccumCycleCountDict;
      v2->_lastAccumCycleCountDict = v5;

      lastAccumlatedKeysSample = v2->_lastAccumlatedKeysSample;
      v2->_lastAccumlatedKeysSample = 0;

      lastAccumlatedKeysSampleCA = v2->_lastAccumlatedKeysSampleCA;
      v2->_lastAccumlatedKeysSampleCA = 0;

      thermalAggregationTimer = v2->_thermalAggregationTimer;
      v2->_thermalAggregationTimer = 0;

      lastDisplayAccumlatedSample = v2->_lastDisplayAccumlatedSample;
      v2->_lastDisplayAccumlatedSample = 0;

      uint64_t v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      lastDisplayAccumulatedSampleEndDate = v2->_lastDisplayAccumulatedSampleEndDate;
      v2->_lastDisplayAccumulatedSampleEndDate = (NSDate *)v11;

      lastThermalInstantEntry = v2->_lastThermalInstantEntry;
      v2->_lastThermalInstantEntry = 0;

      thermalLoggingTimer = v2->_thermalLoggingTimer;
      v2->_thermalLoggingTimer = 0;

      lastPowerAccumlatedSample = v2->_lastPowerAccumlatedSample;
      v2->_lastPowerAccumlatedSample = 0;

      lastPowerAccumlatedSampleCA = v2->_lastPowerAccumlatedSampleCA;
      v2->_lastPowerAccumlatedSampleCA = 0;
    }
    v17 = v2;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)initOperatorDependancies
{
  if (+[PLSMCAgent supportsThermalSMC])
  {
    if ([(PLSMCAgent *)self accumSupported])
    {
      objc_initWeak(&location, self);
      uint64_t v3 = [MEMORY[0x1E4F92A50] sharedInstance];
      [(PLSMCAgent *)self setStateTracker:v3];

      v4 = [(PLSMCAgent *)self stateTracker];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke;
      v24[3] = &unk_1E6E47930;
      objc_copyWeak(&v25, &location);
      [v4 registerForStates:57 withOperator:self withBlock:v24];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_2;
    v23[3] = &unk_1E6E47908;
    v23[4] = self;
    v5 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v23];
    sbc = self->_sbc;
    self->_sbc = v5;

    if (+[PLSMCAgent shouldModelDisplayPowerFromSMC]
      && [(PLSMCAgent *)self accumSupported])
    {
      v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
      id v8 = objc_alloc(MEMORY[0x1E4F929E8]);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_3;
      v22[3] = &unk_1E6E47908;
      v22[4] = self;
      v9 = (void *)[v8 initWithOperator:self forEntryKey:v7 withFilter:MEMORY[0x1E4F1CC08] withBlock:v22];
      [(PLSMCAgent *)self setScreenStateNotification:v9];
    }
    id v10 = objc_alloc(MEMORY[0x1E4F92A80]);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = [(PLOperator *)self workQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_4;
    v21[3] = &unk_1E6E489A8;
    v21[4] = self;
    v13 = (void *)[v10 initWithFireDate:v11 withInterval:1 withTolerance:0 repeats:v12 withUserInfo:v21 withQueue:60.0 withBlock:0.0];
    [(PLSMCAgent *)self setThermalMonitorTimer:v13];

    v14 = [(PLSMCAgent *)self thermalMonitorTimer];
    [v14 arm];

    id v15 = objc_alloc(MEMORY[0x1E4F92A80]);
    v16 = [MEMORY[0x1E4F1C9C8] date];
    v17 = [(PLOperator *)self workQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __38__PLSMCAgent_initOperatorDependancies__block_invoke_5;
    v20[3] = &unk_1E6E489A8;
    v20[4] = self;
    v18 = (void *)[v15 initWithFireDate:v16 withInterval:1 withTolerance:0 repeats:v17 withUserInfo:v20 withQueue:600.0 withBlock:0.0];
    [(PLSMCAgent *)self setThermalAggregationTimer:v18];

    objc_super v19 = [(PLSMCAgent *)self thermalAggregationTimer];
    [v19 arm];

    [(PLSMCAgent *)self logDRAMVendorKey];
    if (+[PLSMCAgent shouldModelDisplayPowerFromSMC])
    {
      if ([(PLSMCAgent *)self accumSupported]) {
        [(PLSMCAgent *)self logDisplayPower];
      }
    }
  }
}

void __38__PLSMCAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleStateChangeForSMCStats];
}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) logDisplayPower];
}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result = +[PLSMCAgent supportsThermalSMC];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 parseThermalThresholds:0 thermalPressure:0 virtualTemp:1 thermalLevel:0];
  }
  return result;
}

uint64_t __38__PLSMCAgent_initOperatorDependancies__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) logThermalAggregationKeysToCA];
}

- (void)dealloc
{
  if ([(PLSMCAgent *)self smcConnection])
  {
    [(PLSMCAgent *)self smcConnection];
    SMCCloseConnection();
  }
  v3.receiver = self;
  v3.super_class = (Class)PLSMCAgent;
  [(PLAgent *)&v3 dealloc];
}

- (void)log
{
  [(PLSMCAgent *)self logThermalInstantAndAccumlatedKeys];
  if ([(PLSMCAgent *)self accumSupported])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLSMCAgent *)self logAccumulatedKeysToPowerlog:1 ToCoreAnalytics:1 withDate:v3 isWake:0];
  }
}

- (void)logEventPointThermalKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ThermalKeys"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(PLSMCAgent *)self thermalKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = [(PLSMCAgent *)self readKey:v10];
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(PLOperator *)self logEntry:v4];
}

- (void)logEventPointMetricMonitorInstantKeys
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities isPowerlogHelperd])
  {
    id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"MetricMonitorInstantKeys"];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(PLSMCAgent *)self metricMonitorInstantKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = [(PLSMCAgent *)self readKey:v10];
          [v4 setObject:v11 forKeyedSubscript:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }

    uint64_t v17 = v4;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [(PLOperator *)self postEntries:v12];
  }
}

- (id)sampleAccumulatedKeys:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * v8);
        double v22 = 0.0;
        uint64_t v23 = 0;
        if ([(PLSMCAgent *)self readKeyViaOSAccum:v9 toOutput:&v22])
        {
          uint64_t v10 = +[PLSMCOutputObject objectWithChannelValue:v23 cycleCount:BYTE4(v23) variant:v22];
          [v19 setObject:v10 forKeyedSubscript:v9];
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v11 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __36__PLSMCAgent_sampleAccumulatedKeys___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v11;
          if (sampleAccumulatedKeys__defaultOnce != -1) {
            dispatch_once(&sampleAccumulatedKeys__defaultOnce, block);
          }
          if (sampleAccumulatedKeys__classDebugEnabled)
          {
            long long v12 = [NSString stringWithFormat:@"AccumulatedKeys: keyName=%@, channelValue=%f, cycleCount=%d, variant=%d", v9, *(void *)&v22, v23, BYTE4(v23)];
            long long v13 = (void *)MEMORY[0x1E4F929B8];
            long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLSMCAgent.m"];
            long long v15 = [v14 lastPathComponent];
            long long v16 = [NSString stringWithUTF8String:"-[PLSMCAgent sampleAccumulatedKeys:]"];
            [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:2386];

            uint64_t v17 = PLLogCommon();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v12;
              _os_log_debug_impl(&dword_1E4220000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v6);
  }

  return v19;
}

uint64_t __36__PLSMCAgent_sampleAccumulatedKeys___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  sampleAccumulatedKeys__classDebugEnabled = result;
  return result;
}

- (id)resetAccumulatedKeys:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 138412290;
    long long v16 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (-[PLSMCAgent SMCKeyExists:](self, "SMCKeyExists:", v12, v16, (void)v17))
        {
          long long v13 = +[PLSMCOutputObject objectWithChannelValue:0 cycleCount:0 variant:0.0];
          [v5 setObject:v13 forKeyedSubscript:v12];
          long long v14 = PLLogSMC();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v12;
            _os_log_debug_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEBUG, "ExistingKeys: keyName=%@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)getPowerEntryFromSample:(id)a3 lastSample:(id)a4 withEntryKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__9;
    long long v19 = __Block_byref_object_dispose__9;
    id v20 = (id)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __62__PLSMCAgent_getPowerEntryFromSample_lastSample_withEntryKey___block_invoke;
    v12[3] = &unk_1E6E489D0;
    id v13 = v8;
    long long v14 = &v15;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
    id v10 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __62__PLSMCAgent_getPowerEntryFromSample_lastSample_withEntryKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = [v6 objectForKeyedSubscript:v22];
    id v8 = v7;
    if (v7
      && (unsigned int v9 = [v7 cycleCount], v9 < objc_msgSend(v5, "cycleCount"))
      && ([v5 channelValue],
          double v11 = v10,
          [v8 channelValue],
          double v13 = v12,
          int v14 = [v5 cycleCount] - v9,
          v14 > 0))
    {
      uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v11 - v13) / (double)v14];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v15 forKeyedSubscript:v22];
    }
    else
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = 0;
    }
  }
  else if ([v5 cycleCount])
  {
    [v5 channelValue];
    double v19 = v18;
    unsigned int v20 = [v5 cycleCount];
    id v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:v19 / (double)v20];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v22];
  }
  else
  {
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = 0;
  }
}

- (id)getAccumEntryFromSample:(id)a3 lastSample:(id)a4 withEntryKey:(id)a5 withDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = v12;
  if (v9)
  {
    if (!v12)
    {
      double v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    }
    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11 withDate:v13];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__PLSMCAgent_getAccumEntryFromSample_lastSample_withEntryKey_withDate___block_invoke;
    v19[3] = &unk_1E6E489F8;
    id v15 = v14;
    id v20 = v15;
    id v21 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v19];
    uint64_t v16 = v21;
    id v17 = v15;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __71__PLSMCAgent_getAccumEntryFromSample_lastSample_withEntryKey_withDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v5 = a3;
  id v6 = +[PLSMCAgent channelValueKey:v29];
  id v7 = [*(id *)(a1 + 32) definedKeys];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28ED0];
    [v5 channelValue];
    id v10 = objc_msgSend(v9, "numberWithDouble:");
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v6];
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v5, "cycleCount"));
  id v12 = *(void **)(a1 + 32);
  double v13 = +[PLSMCAgent cycleCountKey:v29];
  [v12 setObject:v11 forKeyedSubscript:v13];

  int v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v5, "variant"));
  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = +[PLSMCAgent variantKey:v29];
  [v15 setObject:v14 forKeyedSubscript:v16];

  id v17 = +[PLSMCAgent channelValueDiffKey:v29];
  double v18 = [*(id *)(a1 + 32) definedKeys];
  LODWORD(v16) = [v18 containsObject:v17];

  if (v16)
  {
    double v19 = *(void **)(a1 + 40);
    if (v19)
    {
      id v20 = [v19 objectForKeyedSubscript:v29];
      id v21 = v20;
      if (v20)
      {
        unsigned int v22 = [v20 cycleCount];
        if (v22 <= [v5 cycleCount])
        {
          [v5 channelValue];
          double v24 = v23;
          [v21 channelValue];
          double v26 = v24 - v25;
          long long v27 = (void *)MEMORY[0x1E4F28ED0];
LABEL_10:
          +[PLUtilities roundToSigFigDouble:4 withSigFig:v26];
          v28 = objc_msgSend(v27, "numberWithDouble:");
          [*(id *)(a1 + 32) setObject:v28 forKeyedSubscript:v17];

          goto LABEL_11;
        }
      }
    }
    else
    {
      id v21 = 0;
    }
    long long v27 = (void *)MEMORY[0x1E4F28ED0];
    [v5 channelValue];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)logAccumKeysToCA:(id)a3 withLastSample:(id)a4 andDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v9 && a5)
  {
    stateTracker = self->_stateTracker;
    id v12 = a5;
    double v13 = [(PLStateTrackingComposition *)stateTracker getState:1 beforeDate:v12];
    int v14 = [(PLStateTrackingComposition *)self->_stateTracker getState:8 beforeDate:v12];

    if (v13) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      uint64_t v16 = PLLogSMC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLSMCAgent logAccumKeysToCA:withLastSample:andDate:]();
      }

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __54__PLSMCAgent_logAccumKeysToCA_withLastSample_andDate___block_invoke;
      v17[3] = &unk_1E6E48A48;
      id v18 = v10;
      id v19 = v13;
      id v20 = v14;
      [v8 enumerateKeysAndObjectsUsingBlock:v17];
    }
  }
}

void __54__PLSMCAgent_logAccumKeysToCA_withLastSample_andDate___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] objectForKeyedSubscript:v5];
  id v8 = v7;
  if (v7)
  {
    unsigned int v9 = [v7 cycleCount];
    if (v9 <= [v6 cycleCount])
    {
      [v6 cycleCount];
      [v8 cycleCount];
      [v6 channelValue];
      [v8 channelValue];
      id v10 = v5;
      id v11 = a1[5];
      id v12 = a1[6];
      AnalyticsSendEventLazy();
    }
  }
}

id __54__PLSMCAgent_logAccumKeysToCA_withLastSample_andDate___block_invoke_2(uint64_t a1)
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"KeyName";
  v8[1] = @"ChannelValue";
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 56)];
  v9[1] = v2;
  v8[2] = @"CycleCount";
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v9[2] = v3;
  v9[3] = v4;
  void v8[3] = @"Plugged";
  v8[4] = @"Wake";
  void v9[4] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

- (void)logDisplayPower
{
  id v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PLSMCAgent_logDisplayPower__block_invoke;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  dispatch_async(v3, block);
}

void __29__PLSMCAgent_logDisplayPower__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) smcConnection])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [v2 displayAccumulatedKeys];
    uint64_t v4 = [v2 sampleAccumulatedKeys:v3];

    if (v4)
    {
      uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"DisplayPowerKeys"];
      id v6 = *(void **)(a1 + 32);
      id v7 = [v6 lastDisplayAccumlatedSample];
      id v8 = [v6 getPowerEntryFromSample:v4 lastSample:v7 withEntryKey:v5];

      if (v8)
      {
        [*(id *)(a1 + 32) logEntry:v8];
        unsigned int v9 = [v8 objectForKeyedSubscript:@"PDEP"];
        [v9 doubleValue];
        double v11 = v10;
        id v12 = [v8 objectForKeyedSubscript:@"PDLP"];
        [v12 doubleValue];
        double v14 = (v11 + v13) * 1000.0;

        BOOL v15 = [*(id *)(a1 + 32) lastDisplayAccumulatedSampleEndDate];
        uint64_t v16 = [MEMORY[0x1E4F92900] sharedInstance];
        id v17 = [v8 entryDate];
        [v16 createPowerEventIntervalWithRootNodeID:56 withPower:v15 withStartDate:v17 withEndDate:v14];

        [*(id *)(a1 + 32) setLastDisplayAccumlatedSample:v4];
        id v18 = [v8 entryDate];
        [*(id *)(a1 + 32) setLastDisplayAccumulatedSampleEndDate:v18];
      }
    }
    else
    {
      id v19 = PLLogSMC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __29__PLSMCAgent_logDisplayPower__block_invoke_cold_2();
      }
    }
  }
  else
  {
    uint64_t v4 = PLLogSMC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __29__PLSMCAgent_logDisplayPower__block_invoke_cold_1();
    }
  }
}

- (void)logAccumulatedKeysToPowerlog:(BOOL)a3 ToCoreAnalytics:(BOOL)a4 withDate:(id)a5 isWake:(BOOL)a6
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = a5;
  if (v7 || v6)
  {
    id v16 = v9;
    double v10 = [(PLSMCAgent *)self powerAccumulatedKeys];
    double v11 = [(PLSMCAgent *)self sampleAccumulatedKeys:v10];

    if (v7)
    {
      id v12 = [(PLSMCAgent *)self lastPowerAccumlatedSample];
      double v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"PowerAccumulatedKeys"];
      double v14 = [(PLSMCAgent *)self getAccumEntryFromSample:v11 lastSample:v12 withEntryKey:v13 withDate:v16];

      [(PLOperator *)self logEntry:v14];
      [(PLSMCAgent *)self setLastPowerAccumlatedSample:v11];
    }
    if (v6)
    {
      BOOL v15 = [(PLSMCAgent *)self lastPowerAccumlatedSampleCA];
      [(PLSMCAgent *)self logAccumKeysToCA:v11 withLastSample:v15 andDate:v16];

      [(PLSMCAgent *)self setLastPowerAccumlatedSampleCA:v11];
    }

    id v9 = v16;
  }
}

- (void)handleStateChangeForSMCStats
{
  if ([(PLStateTrackingComposition *)self->_stateTracker stateChanged:16])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLSMCAgent *)self logAccumulatedKeysToPowerlog:1 ToCoreAnalytics:0 withDate:v3 isWake:1];
  }
  if ([(PLStateTrackingComposition *)self->_stateTracker stateChanged:32])
  {
    uint64_t v4 = [(PLStateTrackingComposition *)self->_stateTracker getLastState:32];
    int v5 = [v4 BOOLValue];

    if (v5)
    {
      [(PLSMCAgent *)self setLastAccumlatedKeysSample:0];
      [(PLSMCAgent *)self setLastAccumlatedKeysSampleCA:0];
      if (+[PLSMCAgent shouldModelDisplayPowerFromSMC])
      {
        if ([(PLSMCAgent *)self accumSupported])
        {
          lastDisplayAccumlatedSample = self->_lastDisplayAccumlatedSample;
          self->_lastDisplayAccumlatedSample = 0;

          BOOL v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
          lastDisplayAccumulatedSampleEndDate = self->_lastDisplayAccumulatedSampleEndDate;
          self->_lastDisplayAccumulatedSampleEndDate = v7;

          [(PLSMCAgent *)self logDisplayPower];
        }
      }
    }
  }
  id v9 = [(PLStateTrackingComposition *)self->_stateTracker getSystemStateChangeTime];
  [(PLSMCAgent *)self logAccumulatedKeysToPowerlog:0 ToCoreAnalytics:1 withDate:v9 isWake:0];
}

- (void)logThermalAggregationKeysToCA
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Log Thermal Aggregated Keys to CA", v2, v3, v4, v5, v6);
}

void __43__PLSMCAgent_logThermalAggregationKeysToCA__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) readKey:v3];
  if ([v3 isEqualToString:@"SDTO"])
  {
    uint64_t v5 = [v3 stringByAppendingString:@"_"];

    [v4 doubleValue];
    +[PLUtilities roundToSigFigDouble:withSigFig:](PLUtilities, "roundToSigFigDouble:withSigFig:", 1);
    double v7 = 10.0;
    BOOL v8 = v6 >= 5.0 && v6 < 10.0;
    if (!v8) {
      double v7 = v6;
    }
    BOOL v8 = v6 < 5.0;
    double v9 = 1.0;
    if (!v8) {
      double v9 = v7;
    }
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];

    uint64_t v4 = (void *)v10;
    id v3 = (id)v5;
  }
  double v11 = PLLogSMC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __43__PLSMCAgent_logThermalAggregationKeysToCA__block_invoke_cold_1();
  }

  if (v4) {
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
  }
}

id __43__PLSMCAgent_logThermalAggregationKeysToCA__block_invoke_669(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)accumSupported
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PLSMCAgent_accumSupported__block_invoke;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  if (accumSupported_onceToken != -1) {
    dispatch_once(&accumSupported_onceToken, block);
  }
  return accumSupported_accumSupported;
}

uint64_t __28__PLSMCAgent_accumSupported__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) smcConnection];
  uint64_t result = SMCOSAccumIsSupported();
  accumSupported_accumSupported = result;
  return result;
}

- (id)readKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 UTF8String];
    if (SMCMakeUInt32Key())
    {
      [(PLSMCAgent *)self smcConnection];
      if (!SMCGetKeyInfo())
      {
        [(PLSMCAgent *)self smcConnection];
        if (!SMCReadKeyAsNumericWithKnownKeyInfo())
        {
          double v7 = PLLogSMC();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            -[PLSMCAgent readKey:]();
          }
        }
      }
    }
  }

  return 0;
}

- (BOOL)writeKeyNumeric:(id)a3 withValue:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    [v5 UTF8String];
    if (SMCMakeUInt32Key())
    {
      [(PLSMCAgent *)self smcConnection];
      if (SMCGetKeyInfo())
      {
        double v7 = PLLogSMC();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[PLSMCAgent writeKeyNumeric:withValue:].cold.7();
        }
      }
      else
      {
        [(PLSMCAgent *)self smcConnection];
        int v17 = SMCWriteKeyAsNumeric();
        id v18 = PLLogSMC();
        double v7 = v18;
        if (!v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLSMCAgent writeKeyNumeric:withValue:]();
          }
          BOOL v16 = 1;
          goto LABEL_15;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[PLSMCAgent writeKeyNumeric:withValue:].cold.4();
        }
      }
      BOOL v16 = 0;
LABEL_15:

      goto LABEL_16;
    }
    BOOL v8 = PLLogSMC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PLSMCAgent writeKeyNumeric:withValue:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    BOOL v8 = PLLogSMC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PLSMCAgent writeKeyNumeric:withValue:]();
    }
  }

  BOOL v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)sampleKey:(id *)a3 forKey:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (![(PLSMCAgent *)self getChannelInfo:*(void *)&a4])
  {
    double v6 = PLLogSMC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PLSMCAgent sampleKey:forKey:](v4, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_7;
  }
  [(PLSMCAgent *)self smcConnection];
  if (SMCOSAccumSampleChannel())
  {
    double v6 = PLLogSMC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PLSMCAgent sampleKey:forKey:]();
    }
LABEL_7:

    return 0;
  }
  return 1;
}

- (const)getChannelInfo:(unsigned int)a3
{
  [(PLSMCAgent *)self smcConnection];
  ChannelInfoForKey = (const SMCAccumChannelInfo *)SMCAccumGetChannelInfoForKey();
  if (!ChannelInfoForKey)
  {
    uint64_t v4 = PLLogSMC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PLSMCAgent getChannelInfo:]();
    }
  }
  return ChannelInfoForKey;
}

- (BOOL)SMCKeyExists:(id)a3
{
  if (a3)
  {
    [a3 UTF8String];
    int v4 = SMCMakeUInt32Key();
    if (v4)
    {
      [(PLSMCAgent *)self smcConnection];
      LOBYTE(v4) = SMCGetKeyInfo() == 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)readKeyViaOSAccum:(id)a3 toOutput:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  [v6 UTF8String];
  uint64_t v8 = SMCMakeUInt32Key();
  if (v8)
  {
    [(PLSMCAgent *)self smcConnection];
    if (SMCGetKeyInfo())
    {
LABEL_4:
      LOBYTE(v8) = 0;
      goto LABEL_5;
    }
    if ([(PLSMCAgent *)self sampleKey:a4 forKey:v8])
    {
      if (a4->var1)
      {
        uint64_t v10 = PLLogSMC();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[PLSMCAgent readKeyViaOSAccum:toOutput:]();
        }
        LOBYTE(v8) = 1;
        goto LABEL_16;
      }
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_4;
      }
      uint64_t v11 = objc_opt_class();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke_685;
      uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v21 = v11;
      if (readKeyViaOSAccum_toOutput__defaultOnce_683 != -1) {
        dispatch_once(&readKeyViaOSAccum_toOutput__defaultOnce_683, &v17);
      }
      if (!readKeyViaOSAccum_toOutput__classDebugEnabled_684) {
        goto LABEL_4;
      }
      uint64_t v10 = [NSString stringWithFormat:@"%s: Returned cycleCount is zero for %u key, returning kSMCReturnError", "-[PLSMCAgent readKeyViaOSAccum:toOutput:]", v8, v17, v18, v19, v20, v21];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLSMCAgent.m"];
      uint64_t v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLSMCAgent readKeyViaOSAccum:toOutput:]"];
      [v12 logMessage:v10 fromFile:v14 fromFunction:v15 fromLineNumber:3031];

      BOOL v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v10 = PLLogSMC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PLSMCAgent readKeyViaOSAccum:toOutput:].cold.4(v8, v10);
      }
    }
    LOBYTE(v8) = 0;
LABEL_16:
  }
LABEL_5:

  return v8;
}

uint64_t __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  readKeyViaOSAccum_toOutput__classDebugEnabled = result;
  return result;
}

uint64_t __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke_679(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  readKeyViaOSAccum_toOutput__classDebugEnabled_678 = result;
  return result;
}

uint64_t __41__PLSMCAgent_readKeyViaOSAccum_toOutput___block_invoke_685(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  readKeyViaOSAccum_toOutput__classDebugEnabled_684 = result;
  return result;
}

- (void)logThermalInstantAndAccumlatedKeys
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Logging Thermal Instant entry: %@", v2, v3, v4, v5, v6);
}

- (void)logPowerDeliveryKeys
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Log Power Delivery Keys to CA", v2, v3, v4, v5, v6);
}

id __34__PLSMCAgent_logPowerDeliveryKeys__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logDRAMVendorKey
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Log DRAM Vendor key with value %@", v2, v3, v4, v5, v6);
}

- (id)thermalKeys
{
  if (thermalKeys_onceToken != -1) {
    dispatch_once(&thermalKeys_onceToken, &__block_literal_global_693);
  }
  uint64_t v2 = (void *)thermalKeys_thermalKeys;
  return v2;
}

uint64_t __25__PLSMCAgent_thermalKeys__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TCXC", @"Ts0S", @"TC0F", @"TH0A", @"TH0F", @"TM0P", @"Ts0P", @"TBXT", @"TC0P", @"TH0C", @"Ts1S", @"Th1H", @"Ta0P", @"TA0V", @"Th2H", @"TCMc", @"TH0B",
    @"TM0V",
    @"TG0P",
    @"TG1F",
    @"Th0N",
    @"TKBV",
    @"TM0S",
    @"TPMV",
    @"TG0D",
    @"TG0F",
    @"TG1D",
    @"TH0J",
    @"TH0x",
    @"TB1T",
    @"TB2T",
    @"F0Ac",
    @"F1Ac",
    @"F0Tg",
    @"F1Tg",
    @"FPDc",
  thermalKeys_thermalKeys = 0);
  return MEMORY[0x1F41817F8]();
}

- (id)metricMonitorInstantKeys
{
  if (metricMonitorInstantKeys_onceToken != -1) {
    dispatch_once(&metricMonitorInstantKeys_onceToken, &__block_literal_global_804);
  }
  uint64_t v2 = (void *)metricMonitorInstantKeys_metricMonitorKeys;
  return v2;
}

uint64_t __38__PLSMCAgent_metricMonitorInstantKeys__block_invoke()
{
  metricMonitorInstantKeys_metricMonitorKeys = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"B0AP", @"zSLi", @"zSPi", @"xRPE", @"CHAS", @"TB0T", @"TVRM", @"TVBM", @"TVBH", 0);
  return MEMORY[0x1F41817F8]();
}

- (id)displayAccumulatedKeys
{
  if (displayAccumulatedKeys_onceToken != -1) {
    dispatch_once(&displayAccumulatedKeys_onceToken, &__block_literal_global_806);
  }
  uint64_t v2 = (void *)displayAccumulatedKeys_accumulatedKeys;
  return v2;
}

uint64_t __36__PLSMCAgent_displayAccumulatedKeys__block_invoke()
{
  displayAccumulatedKeys_accumulatedKeys = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PDLP", @"PDEP", 0);
  return MEMORY[0x1F41817F8]();
}

- (id)accumulatedKeys
{
  if (accumulatedKeys_onceToken != -1) {
    dispatch_once(&accumulatedKeys_onceToken, &__block_literal_global_808);
  }
  uint64_t v2 = (void *)accumulatedKeys_accumulatedKeys;
  return v2;
}

uint64_t __29__PLSMCAgent_accumulatedKeys__block_invoke()
{
  accumulatedKeys_accumulatedKeys = [MEMORY[0x1E4F1CAD0] set];
  return MEMORY[0x1F41817F8]();
}

- (id)powerAccumulatedKeys
{
  if (powerAccumulatedKeys_onceToken != -1) {
    dispatch_once(&powerAccumulatedKeys_onceToken, &__block_literal_global_810);
  }
  uint64_t v2 = (void *)powerAccumulatedKeys_accumulatedKeys;
  return v2;
}

uint64_t __34__PLSMCAgent_powerAccumulatedKeys__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PSTR", @"PBat", @"VBat", @"PDLP", @"PDEP", @"PZCB", @"PZCU", @"PZD1", @"PGDP", @"PP0b", @"PP1b", @"PP2b", @"PP3b", @"PP4b", @"PP5b", @"PP6b", @"PP7b",
    @"PP8b",
    @"PP9b",
    @"PPab",
    @"PPbb",
    @"PPdb",
    @"VP0b",
    @"VP1b",
    @"VP2b",
    @"VP3b",
    @"VP4b",
    @"VP5b",
    @"VP6b",
    @"VP7b",
    @"VP8b",
    @"VP9b",
    @"VPab",
    @"VPbb",
    @"VPdb",
    @"PR4b",
  powerAccumulatedKeys_accumulatedKeys = 0);
  return MEMORY[0x1F41817F8]();
}

- (id)thermalInstantKeys
{
  if (thermalInstantKeys_onceToken != -1) {
    dispatch_once(&thermalInstantKeys_onceToken, &__block_literal_global_812);
  }
  uint64_t v2 = (void *)thermalInstantKeys_thermalKeys;
  return v2;
}

uint64_t __32__PLSMCAgent_thermalInstantKeys__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TN0n", @"TV0A", @"TVFM", @"voC0", @"mlCC", @"voP0", @"voT0", @"voR1", @"voR2", @"xPb1", @"xPb2", @"mlNN", @"voS0", @"xPSp", @"voBB", @"xPDs", @"cmSM",
    @"TVD0",
    @"ftS0",
    @"TVBM",
    @"TVFD",
    @"TVFL",
    @"TVFG",
    @"TVBQ",
    @"TVBR",
    @"TV0s",
    @"TV2s",
    @"TV4s",
    @"TV5s",
    @"xPPT",
    @"xDPE",
    @"mTPL",
    @"B0AP",
    @"mTLL",
    @"xPNf",
    @"xPWi",
    @"xPAr",
    @"TVBA",
    @"TVBC",
    @"TVBF",
    @"TVBB",
    @"TVLN",
    @"SDTo",
    @"SDTh",
    @"SDTL",
    @"xRPE",
    @"TG0V",
    @"CKRQ",
    @"TVBN",
    @"TVRQ",
    @"TVRH",
    @"TVRR",
    @"TVBE",
    @"TVRM",
    @"TAOP",
    @"TB50",
    @"TB5B",
    @"TKFP",
    @"TW0P",
    @"TVFC",
  thermalInstantKeys_thermalKeys = @"mlr5");
  return MEMORY[0x1F41817F8]();
}

- (id)thermalAggregationKeys
{
  if (thermalAggregationKeys_onceToken != -1) {
    dispatch_once(&thermalAggregationKeys_onceToken, &__block_literal_global_814);
  }
  uint64_t v2 = (void *)thermalAggregationKeys_thermalKeys;
  return v2;
}

uint64_t __36__PLSMCAgent_thermalAggregationKeys__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"B0AP", @"TB5B", @"TVBA", @"TVBB", @"TVBC", @"TVBF", @"TVBQ", @"TVBM", @"TVBR", @"TVFD", @"TVFL", @"TVFG", @"TVLN", @"TV0s", @"TV2s", @"TG0V", @"TH0T",
    @"SDTs",
    @"ftS0",
    @"voP0",
    @"mTPL",
    @"TVBN",
    @"TVRQ",
    @"TVRH",
    @"TVRR",
    @"TVBE",
    @"TVRM",
    @"TAOP",
    @"TB50",
    @"TKFP",
    @"TW0P",
    @"TVFC",
    @"mlr5",
    @"BUIC",
    @"TNAP",
    @"TR0P",
    @"xCTA",
    @"SDTA",
    @"SDTC",
    @"TB0T",
    @"TCMb",
    @"TV1s",
    @"TV3s",
    @"TVBH",
    @"TTDa",
    @"TPMP",
    @"TCHP",
    @"TN0n",
    @"TV0A",
    @"TVFM",
    @"TG0B",
    @"zSLi",
    @"zSPi",
    @"TVBL",
    @"TAOC",
    @"TVB1",
    @"TVB2",
    @"TVB3",
    @"TVB4",
    @"TPSP",
  thermalAggregationKeys_thermalKeys = @"TIOP");
  return MEMORY[0x1F41817F8]();
}

- (id)powerDeliveryKeys
{
  if (powerDeliveryKeys_onceToken != -1) {
    dispatch_once(&powerDeliveryKeys_onceToken, &__block_literal_global_820);
  }
  uint64_t v2 = (void *)powerDeliveryKeys_powerKeys;
  return v2;
}

uint64_t __31__PLSMCAgent_powerDeliveryKeys__block_invoke()
{
  powerDeliveryKeys_powerKeys = [MEMORY[0x1E4F1CAD0] set];
  return MEMORY[0x1F41817F8]();
}

- (id)powerDeliveryResetKeys
{
  if (powerDeliveryResetKeys_onceToken != -1) {
    dispatch_once(&powerDeliveryResetKeys_onceToken, &__block_literal_global_822);
  }
  uint64_t v2 = (void *)powerDeliveryResetKeys_powerKeys;
  return v2;
}

uint64_t __36__PLSMCAgent_powerDeliveryResetKeys__block_invoke()
{
  powerDeliveryResetKeys_powerKeys = [MEMORY[0x1E4F1CAD0] set];
  return MEMORY[0x1F41817F8]();
}

- (id)DRAMVendorKey
{
  if (DRAMVendorKey_onceToken != -1) {
    dispatch_once(&DRAMVendorKey_onceToken, &__block_literal_global_824);
  }
  uint64_t v2 = (void *)DRAMVendorKey_vendorKey;
  return v2;
}

void __27__PLSMCAgent_DRAMVendorKey__block_invoke()
{
  v0 = (void *)DRAMVendorKey_vendorKey;
  DRAMVendorKey_vendorKey = @"MDSV";
}

- (id)virtualTemperatureKeys
{
  if (virtualTemperatureKeys_onceToken != -1) {
    dispatch_once(&virtualTemperatureKeys_onceToken, &__block_literal_global_826);
  }
  uint64_t v2 = (void *)virtualTemperatureKeys_thermalKeys;
  return v2;
}

uint64_t __36__PLSMCAgent_virtualTemperatureKeys__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TVBA", @"TVBB", @"TVBC", @"TVBE", @"TVBF", @"TVBM", @"TVBN", @"TVBQ", @"TVBR", @"TVFC", @"TVFD", @"TVFG", @"TVFL", @"TVLN", @"TVRH", @"TVRM", @"TVRQ",
    @"TVRR",
    @"TV0s",
    @"TV2s",
    @"TV4s",
    @"TV5s",
  virtualTemperatureKeys_thermalKeys = 0);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)anyVirtualTemperatureAboveThreshold
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(PLSMCAgent *)self virtualTemperatureKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(PLSMCAgent *)self readKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        uint64_t v9 = v8;
        if (v8)
        {
          [v8 doubleValue];
          if (v10 > 35.0)
          {

            BOOL v11 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (void)virtualTemperatureMonitorCallback
{
  if ([(PLSMCAgent *)self anyVirtualTemperatureAboveThreshold])
  {
    [(PLSMCAgent *)self registerThermalTimer];
  }
  else
  {
    uint64_t v3 = [(PLSMCAgent *)self thermalLoggingTimer];

    if (v3)
    {
      uint64_t v4 = [(PLSMCAgent *)self thermalLoggingTimer];
      [v4 invalidate];

      [(PLSMCAgent *)self setThermalLoggingTimer:0];
    }
  }
}

- (void)registerThermalTimer
{
  uint64_t v3 = [(PLSMCAgent *)self thermalLoggingTimer];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F92A80]);
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = [(PLOperator *)self workQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__PLSMCAgent_registerThermalTimer__block_invoke;
    v9[3] = &unk_1E6E489A8;
    void v9[4] = self;
    uint64_t v7 = (void *)[v4 initWithFireDate:v5 withInterval:1 withTolerance:0 repeats:v6 withUserInfo:v9 withQueue:20.0 withBlock:0.0];
    [(PLSMCAgent *)self setThermalLoggingTimer:v7];

    uint64_t v8 = [(PLSMCAgent *)self thermalLoggingTimer];
    [v8 arm];
  }
}

uint64_t __34__PLSMCAgent_registerThermalTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logThermalInstantAndAccumlatedKeys];
}

- (void)stopThermalTimerAndlogFirstLowSample:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLSMCAgent *)self setLastThermalInstantEntry:0];
  if (v3) {
    [(PLSMCAgent *)self logThermalInstantAndAccumlatedKeys];
  }
  uint64_t v5 = [(PLSMCAgent *)self thermalLoggingTimer];

  if (v5)
  {
    uint64_t v6 = [(PLSMCAgent *)self thermalLoggingTimer];
    [v6 invalidate];

    [(PLSMCAgent *)self setThermalLoggingTimer:0];
  }
}

- (void)parseThermalThresholds:(BOOL)a3 thermalPressure:(BOOL)a4 virtualTemp:(BOOL)a5 thermalLevel:(BOOL)a6
{
  if (a5) {
    [(PLSMCAgent *)self virtualTemperatureMonitorCallback];
  }
}

+ (BOOL)supportsThermalSMC
{
  if (supportsThermalSMC_onceToken != -1) {
    dispatch_once(&supportsThermalSMC_onceToken, &__block_literal_global_828);
  }
  return supportsThermalSMC_ret;
}

uint64_t __32__PLSMCAgent_supportsThermalSMC__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
  supportsThermalSMC_ret = (int)result > 1001014;
  return result;
}

+ (BOOL)shouldModelDisplayPowerFromSMC
{
  if (shouldModelDisplayPowerFromSMC_onceToken != -1) {
    dispatch_once(&shouldModelDisplayPowerFromSMC_onceToken, &__block_literal_global_831);
  }
  return shouldModelDisplayPowerFromSMC_ret;
}

uint64_t __44__PLSMCAgent_shouldModelDisplayPowerFromSMC__block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDisplayClassIsOneOf:", 1002057, 0);
  shouldModelDisplayPowerFromSMC_ret = result;
  return result;
}

+ (BOOL)supportsBasicSMC
{
  if (supportsBasicSMC_onceToken != -1) {
    dispatch_once(&supportsBasicSMC_onceToken, &__block_literal_global_833);
  }
  return supportsBasicSMC_ret;
}

uint64_t __30__PLSMCAgent_supportsBasicSMC__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
  supportsBasicSMC_ret = (int)result > 1001009;
  return result;
}

+ (id)parsePMUEvents:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([&unk_1F4013258 count])
  {
    char v5 = 0;
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [&unk_1F4013258 objectAtIndexedSubscript:v6];
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:(a3 >> v5)];
      [v4 setObject:v8 forKeyedSubscript:v7];

      ++v6;
      v5 += 8;
    }
    while (v6 < [&unk_1F4013258 count]);
  }
  return v4;
}

+ (void)reportPMUEventsToCA:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 unsignedLongLongValue])
  {
    if (reportPMUEventsToCA__pushedAZero) {
      goto LABEL_10;
    }
    if (reportPMUEventsToCA__onceToken != -1) {
      dispatch_once(&reportPMUEventsToCA__onceToken, &__block_literal_global_853);
    }
  }
  uint64_t v4 = [v3 unsignedLongLongValue];
  char v5 = +[PLSMCAgent parsePMUEvents:v4];
  if (v5)
  {
    unint64_t v6 = PLLogSMC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      BOOL v11 = v5;
      _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_INFO, "PMU events: %llu -> %@", buf, 0x16u);
    }

    id v7 = v5;
    AnalyticsSendEventLazy();
  }
LABEL_10:
}

void __34__PLSMCAgent_reportPMUEventsToCA___block_invoke()
{
  v0 = PLLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1E4220000, v0, OS_LOG_TYPE_INFO, "PMU events: pushed empty event", v1, 2u);
  }

  reportPMUEventsToCA__pushedAZero = 1;
}

id __34__PLSMCAgent_reportPMUEventsToCA___block_invoke_857(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PLEntryNotificationOperatorComposition)sbc
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSbc:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)screenStateNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScreenStateNotification:(id)a3
{
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStateTracker:(id)a3
{
}

- (NSDictionary)lastAccumlatedKeysSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastAccumlatedKeysSample:(id)a3
{
}

- (NSDictionary)lastAccumlatedKeysSampleCA
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastAccumlatedKeysSampleCA:(id)a3
{
}

- (NSDictionary)lastDisplayAccumlatedSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastDisplayAccumlatedSample:(id)a3
{
}

- (NSDate)lastDisplayAccumulatedSampleEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastDisplayAccumulatedSampleEndDate:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)focalAppSwitch
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFocalAppSwitch:(id)a3
{
}

- (NSDate)lastFocalSampleDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastFocalSampleDate:(id)a3
{
}

- (PLTimer)focalSwitchFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFocalSwitchFilterTimer:(id)a3
{
}

- (PLTimer)thermalAggregationTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setThermalAggregationTimer:(id)a3
{
}

- (PLTimer)thermalMonitorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setThermalMonitorTimer:(id)a3
{
}

- (PLTimer)thermalLoggingTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setThermalLoggingTimer:(id)a3
{
}

- (PLEntry)lastThermalInstantEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastThermalInstantEntry:(id)a3
{
}

- (NSDictionary)lastPowerAccumlatedSample
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastPowerAccumlatedSample:(id)a3
{
}

- (NSDictionary)lastPowerAccumlatedSampleCA
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastPowerAccumlatedSampleCA:(id)a3
{
}

- (NSMutableDictionary)lastAccumValueDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastAccumValueDict:(id)a3
{
}

- (NSMutableDictionary)lastAccumCycleCountDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastAccumCycleCountDict:(id)a3
{
}

- ($BE55D70084A18B56E262C321142BDEE0)smcConnection
{
  return self->_smcConnection;
}

- (void)setSmcConnection:(id *)a3
{
  self->_smcConnection = a3;
}

- (PLEntryNotificationOperatorComposition)luxEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLuxEntryNotification:(id)a3
{
}

- (NSNumber)currentLux
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCurrentLux:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLux, 0);
  objc_storeStrong((id *)&self->_luxEntryNotification, 0);
  objc_storeStrong((id *)&self->_lastAccumCycleCountDict, 0);
  objc_storeStrong((id *)&self->_lastAccumValueDict, 0);
  objc_storeStrong((id *)&self->_lastPowerAccumlatedSampleCA, 0);
  objc_storeStrong((id *)&self->_lastPowerAccumlatedSample, 0);
  objc_storeStrong((id *)&self->_lastThermalInstantEntry, 0);
  objc_storeStrong((id *)&self->_thermalLoggingTimer, 0);
  objc_storeStrong((id *)&self->_thermalMonitorTimer, 0);
  objc_storeStrong((id *)&self->_thermalAggregationTimer, 0);
  objc_storeStrong((id *)&self->_focalSwitchFilterTimer, 0);
  objc_storeStrong((id *)&self->_lastFocalSampleDate, 0);
  objc_storeStrong((id *)&self->_focalAppSwitch, 0);
  objc_storeStrong((id *)&self->_lastDisplayAccumulatedSampleEndDate, 0);
  objc_storeStrong((id *)&self->_lastDisplayAccumlatedSample, 0);
  objc_storeStrong((id *)&self->_lastAccumlatedKeysSampleCA, 0);
  objc_storeStrong((id *)&self->_lastAccumlatedKeysSample, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_screenStateNotification, 0);
  objc_storeStrong((id *)&self->_sbc, 0);
}

- (void)logAccumKeysToCA:withLastSample:andDate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Log Power Accumulated Keys to CA", v2, v3, v4, v5, v6);
}

void __29__PLSMCAgent_logDisplayPower__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Failed to log, invalid SMC connection", v2, v3, v4, v5, v6);
}

void __29__PLSMCAgent_logDisplayPower__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Failed to sample OSAccumulator channel", v2, v3, v4, v5, v6);
}

void __43__PLSMCAgent_logThermalAggregationKeysToCA__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "logging key to CA: %@", v2, v3, v4, v5, v6);
}

- (void)readKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "%@: %@");
}

- (void)readKey:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readKey:.cold.3()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_1E4220000, v0, v1, "Unsupported key size %d for SMC key %@.");
}

- (void)readKey:.cold.4()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_3(&dword_1E4220000, v0, v1, "Unsupported key size %d for SMC key %@ with Array attribute.");
}

- (void)writeKeyNumeric:withValue:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Not a valid key name", v2, v3, v4, v5, v6);
}

- (void)writeKeyNumeric:(uint64_t)a3 withValue:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_2(&dword_1E4220000, a1, a3, "SMCMakeUInt32Key for %u key returned 0", a5, a6, a7, a8, 0);
}

- (void)writeKeyNumeric:withValue:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "%@: %llu");
}

- (void)writeKeyNumeric:withValue:.cold.4()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9_2(&dword_1E4220000, v0, v1, "Writing to %u key failed with %d", v2, v3);
}

- (void)writeKeyNumeric:withValue:.cold.7()
{
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9_2(&dword_1E4220000, v0, v1, "SMCGetKeyInfo for %u key failed with %d", v2, v3);
}

- (void)sampleKey:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sampleKey:forKey:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "SMCOSAccumSampleChannel fails", v2, v3, v4, v5, v6);
}

- (void)getChannelInfo:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Invalid reference to SMCAccumChannelInfo", v2, v3, v4, v5, v6);
}

- (void)readKeyViaOSAccum:toOutput:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Accumulated key: %@", v2, v3, v4, v5, v6);
}

- (void)readKeyViaOSAccum:(int)a1 toOutput:(NSObject *)a2 .cold.4(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[PLSMCAgent readKeyViaOSAccum:toOutput:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "%s: %u key call to sampleKey failed, returning kSMCReturnError", (uint8_t *)&v2, 0x12u);
}

@end