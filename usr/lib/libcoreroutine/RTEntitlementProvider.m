@interface RTEntitlementProvider
+ (id)daemonProtocolEntitlementProvider;
+ (id)helperServiceProtocolEntitlementProvider;
+ (id)internalDaemonProtocolEntitlementProvider;
+ (id)safetyMonitorDaemonProtocolEntitlementProvider;
+ (id)selectorsForProtocol:(id)a3;
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)clientConnection:(id)a3 satisfiesEntitlementRequirementsForInvocation:(id)a4;
- (NSDictionary)entitlementsDictionary;
- (Protocol)protocol;
- (RTEntitlementProvider)init;
- (RTEntitlementProvider)initWithProtocol:(id)a3 entitlementsDictionary:(id)a4;
- (void)setEntitlementsDictionary:(id)a3;
@end

@implementation RTEntitlementProvider

- (Protocol)protocol
{
  return self->_protocol;
}

- (BOOL)clientConnection:(id)a3 satisfiesEntitlementRequirementsForInvocation:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: connection";
LABEL_13:
      v18 = buf;
LABEL_14:
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    }
LABEL_28:

LABEL_29:
    BOOL v27 = 0;
    goto LABEL_30;
  }
  if (!v7)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: invocation";
      goto LABEL_13;
    }
    goto LABEL_28;
  }
  if (!sel_isEqual((SEL)[v7 selector], sel_fetchEnumerableObjectsWithOptions_offset_reply_))
  {
    entitlementsDictionary = self->_entitlementsDictionary;
    v20 = NSStringFromSelector((SEL)[v8 selector]);
    v14 = [(NSDictionary *)entitlementsDictionary objectForKey:v20];

    if (!v14)
    {
LABEL_7:
      v15 = _rt_log_facility_get_os_log(RTLogFacilityClient);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v16 = NSStringFromSelector((SEL)[v8 selector]);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v16;
        _os_log_fault_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_FAULT, "\"%@\" requires no entitlements.", buf, 0xCu);
      }
      goto LABEL_28;
    }
    goto LABEL_16;
  }
  *(void *)buf = 0;
  [v8 getArgument:buf atIndex:2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_WORD *)v39 = 0;
    v17 = "Invalid parameter not satisfying: [options isKindOfClass:[RTEnumerationOptions class]]";
    v18 = v39;
    goto LABEL_14;
  }
  v9 = self->_entitlementsDictionary;
  v10 = NSStringFromSelector((SEL)[v8 selector]);
  v11 = [(NSDictionary *)v9 objectForKey:v10];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v39 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [optionsEntitlements isKindOfClass:[NSDictionary class]]", v39, 2u);
    }

    goto LABEL_29;
  }
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v11 objectForKey:v13];

  if (!v14) {
    goto LABEL_7;
  }
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [requiredEntitlements isKindOfClass:[NSArray class]]", buf, 2u);
    }

    goto LABEL_29;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v14;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v22)
  {
    BOOL v27 = 1;
    goto LABEL_42;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v36;
  while (2)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v36 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
LABEL_41:

          BOOL v27 = 0;
          goto LABEL_42;
        }
        *(_WORD *)buf = 0;
        v32 = "Invalid parameter not satisfying: [entitlement isKindOfClass:[NSString class]]";
        v33 = v31;
        uint32_t v34 = 2;
LABEL_45:
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
        goto LABEL_41;
      }
      if (!-[RTEntitlementProvider clientConnection:hasEntitlement:](self, "clientConnection:hasEntitlement:", v6, v26, (void)v35))
      {
        v31 = _rt_log_facility_get_os_log(RTLogFacilityClient);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        __int16 v41 = 2112;
        uint64_t v42 = v26;
        v32 = "%@, does not have entitlement, %@";
        v33 = v31;
        uint32_t v34 = 22;
        goto LABEL_45;
      }
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
    BOOL v27 = 1;
    if (v23) {
      continue;
    }
    break;
  }
LABEL_42:

LABEL_30:
  return v27;
}

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      char v9 = 0;
      goto LABEL_11;
    }
    __int16 v15 = 0;
    v11 = "Invalid parameter not satisfying: connection";
    v12 = (uint8_t *)&v15;
LABEL_13:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_8;
  }
  if (!v6)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v14 = 0;
    v11 = "Invalid parameter not satisfying: entitlement";
    v12 = (uint8_t *)&v14;
    goto LABEL_13;
  }
  v8 = [v5 valueForEntitlement:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v9 = [v8 BOOLValue];
  }
  else {
    char v9 = 0;
  }

LABEL_11:
  return v9;
}

+ (id)daemonProtocolEntitlementProvider
{
  v281[88] = *MEMORY[0x1E4F143B8];
  v189 = &unk_1F345F4E0;
  v188 = NSStringFromSelector(sel_setRoutineEnabled_reply_);
  v280[0] = v188;
  v279 = @"com.apple.CoreRoutine.preferences";
  v187 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v279 count:1];
  v281[0] = v187;
  v186 = NSStringFromSelector(sel_clearRoutineWithReply_);
  v280[1] = v186;
  v278 = @"com.apple.CoreRoutine.preferences";
  v185 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v278 count:1];
  v281[1] = v185;
  v184 = NSStringFromSelector(sel_fetchPathToDiagnosticFilesWithOptions_reply_);
  v280[2] = v184;
  v277 = @"com.apple.CoreRoutine.preferences";
  v183 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v277 count:1];
  v281[2] = v183;
  v182 = NSStringFromSelector(sel_fetchRoutineEnabledWithReply_);
  v280[3] = v182;
  uint64_t v2 = MEMORY[0x1E4F1CBF0];
  v281[3] = MEMORY[0x1E4F1CBF0];
  v181 = NSStringFromSelector(sel_setRestorationIdentifier_);
  v280[4] = v181;
  v281[4] = v2;
  v180 = NSStringFromSelector(sel_setTargetUserSession_);
  v280[5] = v180;
  v276 = @"com.apple.private.xpc.launchd.per-user-lookup";
  v179 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v276 count:1];
  v281[5] = v179;
  v178 = NSStringFromSelector(sel_startMonitoringPlaceInferencesWithOptions_reply_);
  v280[6] = v178;
  v275 = @"com.apple.CoreRoutine.LocationOfInterest";
  v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v275 count:1];
  v281[6] = v177;
  v176 = NSStringFromSelector(sel_stopMonitoringPlaceInferencesWithReply_);
  v280[7] = v176;
  v274 = @"com.apple.CoreRoutine.LocationOfInterest";
  v175 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v274 count:1];
  v281[7] = v175;
  v174 = NSStringFromSelector(sel_fetchFamiliarityIndexResultsWithOptions_reply_);
  v280[8] = v174;
  v273 = @"com.apple.CoreRoutine.LocationOfInterest";
  v173 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v273 count:1];
  v281[8] = v173;
  v172 = NSStringFromSelector(sel_fetchLocationsOfInterestWithinDistance_ofLocation_reply_);
  v280[9] = v172;
  v272 = @"com.apple.CoreRoutine.LocationOfInterest";
  v171 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v272 count:1];
  v281[9] = v171;
  v170 = NSStringFromSelector(sel_fetchLocationsOfInterestOfType_reply_);
  v280[10] = v170;
  v271 = @"com.apple.CoreRoutine.LocationOfInterest";
  v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v271 count:1];
  v281[10] = v169;
  v168 = NSStringFromSelector(sel_fetchAllLocationsOfInterestForSettingsWithReply_);
  v280[11] = v168;
  v270[0] = @"com.apple.CoreRoutine.LocationOfInterest";
  v270[1] = @"com.apple.CoreRoutine.preferences";
  v167 = [MEMORY[0x1E4F1C978] arrayWithObjects:v270 count:2];
  v281[11] = v167;
  v166 = NSStringFromSelector(sel_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply_);
  v280[12] = v166;
  v269 = @"com.apple.CoreRoutine.LocationOfInterest";
  v165 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v269 count:1];
  v281[12] = v165;
  v164 = NSStringFromSelector(sel_fetchPlaceInferencesWithOptions_reply_);
  v280[13] = v164;
  v268 = @"com.apple.CoreRoutine.LocationOfInterest";
  v163 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v268 count:1];
  v281[13] = v163;
  v162 = NSStringFromSelector(sel_fetchFormattedPostalAddressesFromMeCard_);
  v280[14] = v162;
  v267 = @"com.apple.CoreRoutine.LocationOfInterest";
  v161 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:1];
  v281[14] = v161;
  v160 = NSStringFromSelector(sel_fetchRoutineModeFromLocation_reply_);
  v280[15] = v160;
  v266 = @"com.apple.CoreRoutine.LocationOfInterest";
  v159 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v266 count:1];
  v281[15] = v159;
  v158 = NSStringFromSelector(sel_fetchLocationsOfInterestAssociatedToIdentifier_reply_);
  v280[16] = v158;
  v265 = @"com.apple.CoreRoutine.LocationOfInterest";
  v157 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v265 count:1];
  v281[16] = v157;
  v156 = NSStringFromSelector(sel_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply_);
  v280[17] = v156;
  v264 = @"com.apple.CoreRoutine.LocationOfInterest";
  v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v264 count:1];
  v281[17] = v155;
  v154 = NSStringFromSelector(sel_fetchPredictedLocationsOfInterestOnDate_reply_);
  v280[18] = v154;
  v263 = @"com.apple.CoreRoutine.LocationOfInterest";
  v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v263 count:1];
  v281[18] = v153;
  v152 = NSStringFromSelector(sel_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply_);
  v280[19] = v152;
  v262 = @"com.apple.CoreRoutine.LocationOfInterest";
  v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v262 count:1];
  v281[19] = v151;
  v150 = NSStringFromSelector(sel_performBluePOIQueryLookingBack_lookingAhead_reply_);
  v280[20] = v150;
  v261 = @"com.apple.CoreRoutine.LocationOfInterest";
  v149 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v261 count:1];
  v281[20] = v149;
  v148 = NSStringFromSelector(sel_fetchLocationOfInterestWithIdentifier_reply_);
  v280[21] = v148;
  v260 = @"com.apple.CoreRoutine.LocationOfInterest";
  v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v260 count:1];
  v281[21] = v147;
  v146 = NSStringFromSelector(sel_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply_);
  v280[22] = v146;
  v259 = @"com.apple.CoreRoutine.LocationOfInterest";
  v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v259 count:1];
  v281[22] = v145;
  v144 = NSStringFromSelector(sel_fetchLocationOfInterestAtLocation_reply_);
  v280[23] = v144;
  v258 = @"com.apple.CoreRoutine.LocationOfInterest";
  v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v258 count:1];
  v281[23] = v143;
  v142 = NSStringFromSelector(sel_fetchLocationOfInterestForRegion_reply_);
  v280[24] = v142;
  v257 = @"com.apple.CoreRoutine.LocationOfInterest";
  v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v257 count:1];
  v281[24] = v141;
  v140 = NSStringFromSelector(sel_addLocationOfInterestOfType_mapItemStorage_customLabel_reply_);
  v280[25] = v140;
  v256 = @"com.apple.CoreRoutine.LocationOfInterest";
  v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v256 count:1];
  v281[25] = v139;
  v138 = NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_type_reply_);
  v280[26] = v138;
  v255 = @"com.apple.CoreRoutine.LocationOfInterest";
  v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v255 count:1];
  v281[26] = v137;
  v136 = NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_customLabel_reply_);
  v280[27] = v136;
  v254 = @"com.apple.CoreRoutine.LocationOfInterest";
  v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v254 count:1];
  v281[27] = v135;
  v134 = NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_mapItemStorage_reply_);
  v280[28] = v134;
  v253 = @"com.apple.CoreRoutine.LocationOfInterest";
  v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v253 count:1];
  v281[28] = v133;
  v132 = NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_type_customLabel_reply_);
  v280[29] = v132;
  v252 = @"com.apple.CoreRoutine.LocationOfInterest";
  v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v252 count:1];
  v281[29] = v131;
  v130 = NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply_);
  v280[30] = v130;
  v251 = @"com.apple.CoreRoutine.LocationOfInterest";
  v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v251 count:1];
  v281[30] = v129;
  v128 = NSStringFromSelector(sel_fetchTransitionsBetweenStartDate_endDate_reply_);
  v280[31] = v128;
  v250 = @"com.apple.CoreRoutine.LocationOfInterest";
  v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v250 count:1];
  v281[31] = v127;
  v126 = NSStringFromSelector(sel_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply_);
  v280[32] = v126;
  v249 = @"com.apple.CoreRoutine.LocationOfInterest";
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v249 count:1];
  v281[32] = v125;
  v124 = NSStringFromSelector(sel_fetchAuthorizedLocationStatus_);
  v280[33] = v124;
  v248 = @"com.apple.CoreRoutine.AuthorizedLocation";
  v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v248 count:1];
  v281[33] = v123;
  v122 = NSStringFromSelector(sel_setHintForRegionState_significantRegion_reply_);
  v280[34] = v122;
  v247 = @"com.apple.CoreRoutine.LocationOfInterest";
  v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v247 count:1];
  v281[34] = v121;
  v120 = NSStringFromSelector(sel_fetchPredictedExitDatesFromLocation_onDate_reply_);
  v280[35] = v120;
  v246 = @"com.apple.CoreRoutine.Prediction";
  v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v246 count:1];
  v281[35] = v119;
  v118 = NSStringFromSelector(sel_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply_);
  v280[36] = v118;
  v245 = @"com.apple.CoreRoutine.Prediction";
  v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v245 count:1];
  v281[36] = v117;
  v116 = NSStringFromSelector(sel_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_reply_);
  v280[37] = v116;
  v244 = @"com.apple.CoreRoutine.Prediction";
  v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v244 count:1];
  v281[37] = v115;
  v114 = NSStringFromSelector(sel_startMonitoringVehicleEventsWithReply_);
  v280[38] = v114;
  v243 = @"com.apple.CoreRoutine.VehicleLocation";
  v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v243 count:1];
  v281[38] = v113;
  v112 = NSStringFromSelector(sel_stopMonitoringVehicleEventsWithReply_);
  v280[39] = v112;
  v242 = @"com.apple.CoreRoutine.VehicleLocation";
  v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v242 count:1];
  v281[39] = v111;
  v110 = NSStringFromSelector(sel_fetchLastVehicleEventsWithReply_);
  v280[40] = v110;
  v241 = @"com.apple.CoreRoutine.VehicleLocation";
  v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v241 count:1];
  v281[40] = v109;
  v108 = NSStringFromSelector(sel_vehicleEventAtLocation_notes_reply_);
  v280[41] = v108;
  v240 = @"com.apple.CoreRoutine.VehicleLocation";
  v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v240 count:1];
  v281[41] = v107;
  v106 = NSStringFromSelector(sel_clearAllVehicleEventsWithReply_);
  v280[42] = v106;
  v239 = @"com.apple.CoreRoutine.VehicleLocation";
  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v239 count:1];
  v281[42] = v105;
  v104 = NSStringFromSelector(sel_updateVehicleEventWithIdentifier_notes_reply_);
  v280[43] = v104;
  v238 = @"com.apple.CoreRoutine.VehicleLocation";
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v238 count:1];
  v281[43] = v103;
  v102 = NSStringFromSelector(sel_updateVehicleEventWithIdentifier_photo_reply_);
  v280[44] = v102;
  v237 = @"com.apple.CoreRoutine.VehicleLocation";
  v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v237 count:1];
  v281[44] = v101;
  v100 = NSStringFromSelector(sel_updateVehicleEventWithIdentifier_geoMapItem_reply_);
  v280[45] = v100;
  v236 = @"com.apple.CoreRoutine.VehicleLocation";
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v236 count:1];
  v281[45] = v99;
  v98 = NSStringFromSelector(sel_updateVehicleEventWithIdentifier_location_reply_);
  v280[46] = v98;
  v235 = @"com.apple.CoreRoutine.VehicleLocation";
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v235 count:1];
  v281[46] = v97;
  v96 = NSStringFromSelector(sel_engageInVehicleEventWithIdentifier_reply_);
  v280[47] = v96;
  v234 = @"com.apple.CoreRoutine.VehicleLocation";
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v234 count:1];
  v281[47] = v95;
  v94 = NSStringFromSelector(sel_fetchAutomaticVehicleEventDetectionSupportedWithReply_);
  v280[48] = v94;
  v233 = @"com.apple.CoreRoutine.VehicleLocation";
  v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v233 count:1];
  v281[48] = v93;
  v92 = NSStringFromSelector(sel_removeLocationOfInterestWithIdentifier_reply_);
  v280[49] = v92;
  v232 = @"com.apple.CoreRoutine.LocationOfInterest.Delete";
  v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v232 count:1];
  v281[49] = v91;
  v90 = NSStringFromSelector(sel_removeVisitWithIdentifier_reply_);
  v280[50] = v90;
  v231 = @"com.apple.CoreRoutine.LocationOfInterest.Delete";
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v231 count:1];
  v281[50] = v89;
  v88 = NSStringFromSelector(sel_extendLifetimeOfVisitsWithIdentifiers_reply_);
  v280[51] = v88;
  v230 = @"com.apple.CoreRoutine.LocationOfInterest.ExtendLifetime";
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v230 count:1];
  v281[51] = v87;
  v86 = NSStringFromSelector(sel_fetchCloudSyncAuthorizationStateWithReply_);
  v280[52] = v86;
  v229 = @"com.apple.CoreRoutine.CloudSync";
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v229 count:1];
  v281[52] = v85;
  v84 = NSStringFromSelector(sel_updateCloudSyncProvisionedForAccount_reply_);
  v280[53] = v84;
  v228 = @"com.apple.CoreRoutine.CloudSync";
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v228 count:1];
  v281[53] = v83;
  v82 = NSStringFromSelector(sel_fetchLookbackWindowStartDateWithLocation_reply_);
  v280[54] = v82;
  v227 = @"com.apple.CoreRoutine.StoredLocation";
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v227 count:1];
  v281[54] = v81;
  v80 = NSStringFromSelector(sel_fetchStoredLocationsWithContext_reply_);
  v280[55] = v80;
  v226 = @"com.apple.CoreRoutine.StoredLocation";
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v226 count:1];
  v281[55] = v79;
  v78 = NSStringFromSelector(sel_fetchEstimatedLocationAtDate_options_reply_);
  v280[56] = v78;
  v225 = @"com.apple.CoreRoutine.StoredLocation";
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v225 count:1];
  v281[56] = v77;
  v76 = NSStringFromSelector(sel_startMonitoringVisitsWithReply_);
  v280[57] = v76;
  v224 = @"com.apple.CoreRoutine.Visit";
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v224 count:1];
  v281[57] = v75;
  v74 = NSStringFromSelector(sel_stopMonitoringVisitsWithReply_);
  v280[58] = v74;
  v223 = @"com.apple.CoreRoutine.Visit";
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v223 count:1];
  v281[58] = v73;
  v72 = NSStringFromSelector(sel_startLeechingVisitsWithReply_);
  v280[59] = v72;
  v222 = @"com.apple.CoreRoutine.Visit";
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v222 count:1];
  v281[59] = v71;
  v70 = NSStringFromSelector(sel_stopLeechingVisitsWithReply_);
  v280[60] = v70;
  v221 = @"com.apple.CoreRoutine.Visit";
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v221 count:1];
  v281[60] = v69;
  v68 = NSStringFromSelector(sel_startLeechingLowConfidenceVisitsWithReply_);
  v280[61] = v68;
  v220 = @"com.apple.CoreRoutine.Visit";
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v220 count:1];
  v281[61] = v67;
  v66 = NSStringFromSelector(sel_stopLeechingLowConfidenceVisitsWithReply_);
  v280[62] = v66;
  v219 = @"com.apple.CoreRoutine.Visit";
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v219 count:1];
  v281[62] = v65;
  v64 = NSStringFromSelector(sel_fetchStoredVisitsWithOptions_reply_);
  v280[63] = v64;
  v218 = @"com.apple.CoreRoutine.Visit";
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v218 count:1];
  v281[63] = v63;
  v62 = NSStringFromSelector(sel_processHindsightVisitsWithReply_);
  v280[64] = v62;
  v217 = @"com.apple.CoreRoutine.Visit";
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v217 count:1];
  v281[64] = v61;
  v60 = NSStringFromSelector(sel_fetchTripSegmentsWithOptions_reply_);
  v280[65] = v60;
  v216 = @"com.apple.CoreRoutine.TripSegment";
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v216 count:1];
  v281[65] = v58;
  v57 = NSStringFromSelector(sel_fetchLocationsCountForTripSegmentWithOptions_reply_);
  v280[66] = v57;
  v215 = @"com.apple.CoreRoutine.TripSegment";
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v215 count:1];
  v281[66] = v56;
  v55 = NSStringFromSelector(sel_fetchLocationsForTripSegmentWithOptions_reply_);
  v280[67] = v55;
  v214 = @"com.apple.CoreRoutine.TripSegment";
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v214 count:1];
  v281[67] = v54;
  v53 = NSStringFromSelector(sel_deleteTripSegmentWithUUID_reply_);
  v280[68] = v53;
  v213 = @"com.apple.CoreRoutine.TripSegment";
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v213 count:1];
  v281[68] = v52;
  v51 = NSStringFromSelector(sel_fetchVehiclesWithOptions_reply_);
  v280[69] = v51;
  v212 = @"com.apple.CoreRoutine.TripSegment";
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v212 count:1];
  v281[69] = v50;
  v49 = NSStringFromSelector(sel_fetchTripSegmentMetadataWithOptions_reply_);
  v280[70] = v49;
  v211 = @"com.apple.CoreRoutine.TripSegment";
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v211 count:1];
  v281[70] = v48;
  v47 = NSStringFromSelector(sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_);
  v280[71] = v47;
  v210 = @"com.apple.CoreRoutine.BackgroundInertialOdometry";
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];
  v281[71] = v46;
  v45 = NSStringFromSelector(sel_addBackgroundInertialOdometrySamples_reply_);
  v280[72] = v45;
  v209 = @"com.apple.CoreRoutine.BackgroundInertialOdometry";
  uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v209 count:1];
  v281[72] = v44;
  v43 = NSStringFromSelector(sel_startMonitoringScenarioTriggerOfType_reply_);
  v280[73] = v43;
  v208 = @"com.apple.CoreRoutine.ScenarioTrigger";
  uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v208 count:1];
  v281[73] = v42;
  __int16 v41 = NSStringFromSelector(sel_stopMonitoringScenarioTriggerOfType_reply_);
  v280[74] = v41;
  v207 = @"com.apple.CoreRoutine.ScenarioTrigger";
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v207 count:1];
  v281[74] = v40;
  v39 = NSStringFromSelector(sel_fetchMonitoredScenarioTriggerTypesWithReply_);
  v280[75] = v39;
  v206 = @"com.apple.CoreRoutine.ScenarioTrigger";
  long long v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v206 count:1];
  v281[75] = v38;
  long long v37 = NSStringFromSelector(sel_fetchEnumerableObjectsWithOptions_offset_reply_);
  v280[76] = v37;
  v3 = (objc_class *)objc_opt_class();
  long long v36 = NSStringFromClass(v3);
  v204[0] = v36;
  v203 = @"com.apple.CoreRoutine.LocationOfInterest";
  long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v203 count:1];
  v205[0] = v35;
  v4 = (objc_class *)objc_opt_class();
  uint32_t v34 = NSStringFromClass(v4);
  v204[1] = v34;
  v202 = @"com.apple.CoreRoutine.Hint";
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v202 count:1];
  v205[1] = v33;
  id v5 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v5);
  v204[2] = v32;
  v201 = @"com.apple.CoreRoutine.StoredLocation";
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
  v205[2] = v31;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v205 forKeys:v204 count:3];
  v281[76] = v30;
  v29 = NSStringFromSelector(sel_startMonitoringForPeopleDiscovery_configuration_reply_);
  v280[77] = v29;
  v200 = @"com.apple.CoreRoutine.PeopleDiscovery";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v200 count:1];
  v281[77] = v28;
  BOOL v27 = NSStringFromSelector(sel_stopMonitoringForPeopleDiscoveryWithReply_);
  v280[78] = v27;
  v199 = @"com.apple.CoreRoutine.PeopleDiscovery";
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v199 count:1];
  v281[78] = v26;
  v25 = NSStringFromSelector(sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_);
  v280[79] = v25;
  v198 = @"com.apple.CoreRoutine.PeopleDiscovery";
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v198 count:1];
  v281[79] = v24;
  uint64_t v23 = NSStringFromSelector(sel_fetchProximityHistoryFromEventIDs_completionHandler_);
  v280[80] = v23;
  v197 = @"com.apple.CoreRoutine.PeopleDiscovery";
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
  v281[80] = v22;
  id v21 = NSStringFromSelector(sel_fetchPeopleCountEventsHistory_completionHandler_);
  v280[81] = v21;
  v196 = @"com.apple.CoreRoutine.PeopleDiscovery";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v196 count:1];
  v281[81] = v20;
  v19 = NSStringFromSelector(sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_);
  v280[82] = v19;
  v195 = @"com.apple.CoreRoutine.PeopleDiscovery";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v195 count:1];
  v281[82] = v18;
  id v6 = NSStringFromSelector(sel_fetchOngoingPeopleDensity_);
  v280[83] = v6;
  v194 = @"com.apple.CoreRoutine.PeopleDiscovery";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1];
  v281[83] = v7;
  v8 = NSStringFromSelector(sel_fetchContactScoresFromContactIDs_completionHandler_);
  v280[84] = v8;
  v193 = @"com.apple.CoreRoutine.PeopleDiscovery";
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1];
  v281[84] = v9;
  v10 = NSStringFromSelector(sel_fetchElevationsWithOptions_reply_);
  v280[85] = v10;
  v192 = @"com.apple.CoreRoutine.StoredElevation";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v192 count:1];
  v281[85] = v11;
  v12 = NSStringFromSelector(sel_addElevations_handler_);
  v280[86] = v12;
  v191 = @"com.apple.CoreRoutine.StoredElevation";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
  v281[86] = v13;
  __int16 v14 = NSStringFromSelector(sel_fetchRemoteStatusWithReply_);
  v280[87] = v14;
  v190 = @"com.apple.CoreRoutine.RemoteStatus";
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v190 count:1];
  v281[87] = v15;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v281 forKeys:v280 count:88];

  v16 = [[RTEntitlementProvider alloc] initWithProtocol:v189 entitlementsDictionary:v59];

  return v16;
}

- (RTEntitlementProvider)initWithProtocol:(id)a3 entitlementsDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = v8;
  if (!v7)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      __int16 v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: protocol";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: entitlementsDictionary";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTEntitlementProvider;
  v10 = [(RTEntitlementProvider *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_protocol, a3);
    uint64_t v12 = [v9 copy];
    entitlementsDictionary = v11->_entitlementsDictionary;
    v11->_entitlementsDictionary = (NSDictionary *)v12;
  }
  self = v11;
  __int16 v14 = self;
LABEL_10:

  return v14;
}

- (RTEntitlementProvider)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithProtocol_entitlementsDictionary_);
}

+ (id)internalDaemonProtocolEntitlementProvider
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = &unk_1F3484AC0;
  v3 = [(id)objc_opt_class() selectorsForProtocol:v2];
  v4 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[v3 count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v18 = @"com.apple.CoreRoutine.Internal";
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18, 1, v14];
        [v4 setObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [[RTEntitlementProvider alloc] initWithProtocol:v2 entitlementsDictionary:v4];

  return v12;
}

+ (id)helperServiceProtocolEntitlementProvider
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = &unk_1F34A5330;
  v3 = [(id)objc_opt_class() selectorsForProtocol:v2];
  v4 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:[v3 count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v18 = @"com.apple.CoreRoutine.MapItemService";
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18, 1, (void)v14];
        [v4 setObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [[RTEntitlementProvider alloc] initWithProtocol:v2 entitlementsDictionary:v4];

  return v12;
}

+ (id)safetyMonitorDaemonProtocolEntitlementProvider
{
  v31[21] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v31[0] = &unk_1F348CD78;
  v31[1] = &unk_1F348C6A0;
  v31[2] = &unk_1F348C768;
  v31[3] = &unk_1F345B5C8;
  v31[4] = &unk_1F34854E0;
  v31[5] = &unk_1F348CD18;
  v31[6] = &unk_1F3485A38;
  v31[7] = &unk_1F3485570;
  v31[8] = &unk_1F348C530;
  v31[9] = &unk_1F3485948;
  v31[10] = &unk_1F348C640;
  v31[11] = &unk_1F3462670;
  v31[12] = &unk_1F34627D0;
  v31[13] = &unk_1F348CC08;
  v31[14] = &unk_1F3459538;
  v31[15] = &unk_1F3465C48;
  v31[16] = &unk_1F348C9D8;
  v31[17] = &unk_1F3477A68;
  v31[18] = &unk_1F348CAD0;
  v31[19] = &unk_1F3485B50;
  v31[20] = &unk_1F3485BD8;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:21];
  v4 = [v2 setWithArray:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v4;
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = [(id)objc_opt_class() selectorsForProtocol:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * j);
              v13 = [v5 objectForKeyedSubscript:v12];

              if (!v13)
              {
                v28 = @"com.apple.CoreRoutine.SafetyMonitor";
                long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
                [v5 setObject:v14 forKey:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
          }
          while (v9);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v19);
  }

  long long v15 = [[RTEntitlementProvider alloc] initWithProtocol:&unk_1F348CD78 entitlementsDictionary:v5];

  return v15;
}

+ (id)selectorsForProtocol:(id)a3
{
  v3 = (Protocol *)a3;
  v4 = v3;
  if (v3)
  {
    *(void *)outCount = 0;
    id v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount[1]);
    uint64_t v6 = protocol_copyMethodDescriptionList(v4, 0, 1, outCount);
    id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v8 = (void *)[v7 initWithCapacity:outCount[1]];
    if (outCount[1])
    {
      unint64_t v9 = 0;
      p_name = &v5->name;
      do
      {
        v11 = *p_name;
        p_name += 2;
        uint64_t v12 = NSStringFromSelector(v11);
        [v8 addObject:v12];

        ++v9;
      }
      while (v9 < outCount[1]);
    }
    if (outCount[0])
    {
      unint64_t v13 = 0;
      long long v14 = &v6->name;
      do
      {
        long long v15 = *v14;
        v14 += 2;
        long long v16 = NSStringFromSelector(v15);
        [v8 addObject:v16];

        ++v13;
      }
      while (v13 < outCount[0]);
    }
    free(v5);
    free(v6);
  }
  else
  {
    long long v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: protocol", buf, 2u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (NSDictionary)entitlementsDictionary
{
  return self->_entitlementsDictionary;
}

- (void)setEntitlementsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementsDictionary, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

@end