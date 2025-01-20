@interface PKValidateSemanticsDict
@end

@implementation PKValidateSemanticsDict

void ___PKValidateSemanticsDict_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*(void *)(a1 + 32)) {
      PKValidationErrorWithReason(@"Key \"%@\" for semantics of field \"%@\" is not a string", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }
    else {
    uint64_t v27 = PKValidationErrorWithReason(@"Key \"%@\" for additionalSemanitcs is not a string", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }
    uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
    v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    *a4 = 1;
    goto LABEL_67;
  }
  id v16 = v7;
  if (([v16 isEqualToString:@"departureLocationDescription"] & 1) != 0
    || ([v16 isEqualToString:@"destinationLocationDescription"] & 1) != 0
    || ([v16 isEqualToString:@"transitProvider"] & 1) != 0
    || ([v16 isEqualToString:@"vehicleName"] & 1) != 0
    || ([v16 isEqualToString:@"vehicleNumber"] & 1) != 0
    || ([v16 isEqualToString:@"vehicleType"] & 1) != 0
    || ([v16 isEqualToString:@"boardingGroup"] & 1) != 0
    || ([v16 isEqualToString:@"boardingSequenceNumber"] & 1) != 0
    || ([v16 isEqualToString:@"confirmationNumber"] & 1) != 0
    || ([v16 isEqualToString:@"transitStatus"] & 1) != 0
    || ([v16 isEqualToString:@"transitStatusReason"] & 1) != 0
    || ([v16 isEqualToString:@"membershipProgramName"] & 1) != 0
    || ([v16 isEqualToString:@"membershipProgramNumber"] & 1) != 0
    || ([v16 isEqualToString:@"priorityStatus"] & 1) != 0
    || ([v16 isEqualToString:@"securityScreening"] & 1) != 0
    || ([v16 isEqualToString:@"flightCode"] & 1) != 0
    || ([v16 isEqualToString:@"airlineCode"] & 1) != 0
    || ([v16 isEqualToString:@"departureAirportCode"] & 1) != 0
    || ([v16 isEqualToString:@"departureAirportName"] & 1) != 0
    || ([v16 isEqualToString:@"departureTerminal"] & 1) != 0
    || ([v16 isEqualToString:@"departureGate"] & 1) != 0
    || ([v16 isEqualToString:@"destinationAirportCode"] & 1) != 0
    || ([v16 isEqualToString:@"destinationAirportName"] & 1) != 0
    || ([v16 isEqualToString:@"destinationTerminal"] & 1) != 0
    || ([v16 isEqualToString:@"destinationGate"] & 1) != 0
    || ([v16 isEqualToString:@"departurePlatform"] & 1) != 0
    || ([v16 isEqualToString:@"departureStationName"] & 1) != 0
    || ([v16 isEqualToString:@"destinationPlatform"] & 1) != 0
    || ([v16 isEqualToString:@"destinationStationName"] & 1) != 0
    || ([v16 isEqualToString:@"carNumber"] & 1) != 0
    || ([v16 isEqualToString:@"eventName"] & 1) != 0
    || ([v16 isEqualToString:@"venueName"] & 1) != 0
    || ([v16 isEqualToString:@"venueEntrance"] & 1) != 0
    || ([v16 isEqualToString:@"venueRoom"] & 1) != 0
    || ([v16 isEqualToString:@"venuePhoneNumber"] & 1) != 0
    || ([v16 isEqualToString:@"leagueName"] & 1) != 0
    || ([v16 isEqualToString:@"leagueAbbreviation"] & 1) != 0
    || ([v16 isEqualToString:@"homeTeamLocation"] & 1) != 0
    || ([v16 isEqualToString:@"homeTeamName"] & 1) != 0
    || ([v16 isEqualToString:@"homeTeamAbbreviation"] & 1) != 0
    || ([v16 isEqualToString:@"awayTeamLocation"] & 1) != 0
    || ([v16 isEqualToString:@"awayTeamName"] & 1) != 0
    || ([v16 isEqualToString:@"awayTeamAbbreviation"] & 1) != 0
    || ([v16 isEqualToString:@"sportName"] & 1) != 0
    || ([v16 isEqualToString:@"genre"] & 1) != 0
    || ([v16 isEqualToString:@"eventLiveMessage"] & 1) != 0
    || ([v16 isEqualToString:@"admissionLevel"] & 1) != 0
    || ([v16 isEqualToString:@"admissionLevelAbbreviation"] & 1) != 0
    || ([v16 isEqualToString:@"attendeeName"] & 1) != 0
    || ([v16 isEqualToString:@"venueRegionName"] & 1) != 0
    || ([v16 isEqualToString:@"entranceDescription"] & 1) != 0
    || ([v16 isEqualToString:@"venueEntranceGate"] & 1) != 0
    || ([v16 isEqualToString:@"venueEntranceDoor"] & 1) != 0
    || ([v16 isEqualToString:@"venueEntrancePortal"] & 1) != 0
    || [v16 isEqualToString:@"additionalTicketAttributes"])
  {

    goto LABEL_58;
  }
  int v30 = [v16 isEqualToString:@"eventType"];

  if (!v30)
  {
    id v31 = v16;
    if (([v31 isEqualToString:@"originalDepartureDate"] & 1) != 0
      || ([v31 isEqualToString:@"currentDepartureDate"] & 1) != 0
      || ([v31 isEqualToString:@"originalArrivalDate"] & 1) != 0
      || ([v31 isEqualToString:@"currentArrivalDate"] & 1) != 0
      || ([v31 isEqualToString:@"originalBoardingDate"] & 1) != 0
      || ([v31 isEqualToString:@"currentBoardingDate"] & 1) != 0
      || ([v31 isEqualToString:@"eventStartDate"] & 1) != 0
      || ([v31 isEqualToString:@"venueDoorsOpenDate"] & 1) != 0
      || ([v31 isEqualToString:@"venueGatesOpenDate"] & 1) != 0
      || ([v31 isEqualToString:@"venueParkingLotsOpenDate"] & 1) != 0
      || ([v31 isEqualToString:@"venueBoxOfficeOpenDate"] & 1) != 0
      || ([v31 isEqualToString:@"venueFanZoneOpenDate"] & 1) != 0
      || ([v31 isEqualToString:@"venueOpenDate"] & 1) != 0
      || [v31 isEqualToString:@"venueCloseDate"])
    {

LABEL_84:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not a string, must be a date string", v32, v33, v34, v35, v36, v37, v38, (uint64_t)v8);
        goto LABEL_60;
      }
      _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v8, 0, 0);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not a valid date string", v39, v40, v41, v42, v43, v44, v45, (uint64_t)v8);
        uint64_t v47 = LABEL_87:;
        uint64_t v48 = *(void *)(*(void *)(a1 + 40) + 8);
        v49 = *(void **)(v48 + 40);
        *(void *)(v48 + 40) = v47;
      }
LABEL_88:

      goto LABEL_67;
    }
    int v50 = [v31 isEqualToString:@"eventEndDate"];

    if (v50) {
      goto LABEL_84;
    }
    if ([v31 isEqualToString:@"eventStartDateInfo"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v58 = v8;
        uint64_t v59 = objc_opt_class();
        uint64_t v60 = _PKVerifyDictionaryKey(v58, @"date", 1, v59, 0);
        if (!v60)
        {
          uint64_t v61 = objc_opt_class();
          uint64_t v60 = _PKVerifyDictionaryKey(v58, @"timeZone", 1, v61, 0);
          if (!v60)
          {
            uint64_t v62 = objc_opt_class();
            uint64_t v60 = _PKVerifyDictionaryKey(v58, @"ignoreTimeComponents", 1, v62, 0);
            if (!v60)
            {
              uint64_t v63 = objc_opt_class();
              uint64_t v60 = _PKVerifyDictionaryKey(v58, @"unannounced", 1, v63, 0);
              if (!v60)
              {
                uint64_t v64 = objc_opt_class();
                uint64_t v60 = _PKVerifyDictionaryKey(v58, @"undetermined", 1, v64, 0);
              }
            }
          }
        }

        uint64_t v65 = *(void *)(*(void *)(a1 + 40) + 8);
        v26 = *(void **)(v65 + 40);
        *(void *)(v65 + 40) = v60;
        goto LABEL_62;
      }
      PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a event info dictionary", v51, v52, v53, v54, v55, v56, v57, (uint64_t)v8);
      goto LABEL_60;
    }
    id v66 = v31;
    if (([v66 isEqualToString:@"departureLocation"] & 1) != 0
      || [v66 isEqualToString:@"destinationLocation"])
    {

LABEL_104:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = PKValidateLocationDictionary(v8);
        goto LABEL_61;
      }
      PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a location dictionary", v68, v69, v70, v71, v72, v73, v74, (uint64_t)v8);
      uint64_t v24 = LABEL_60:;
LABEL_61:
      uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
      v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;
LABEL_62:

      goto LABEL_67;
    }
    int v67 = [v66 isEqualToString:@"venueLocation"];

    if (v67) {
      goto LABEL_104;
    }
    id v75 = v66;
    if ([v75 isEqualToString:@"balance"])
    {

LABEL_110:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = _PKValidateCurrencyAmountDictionary(v8, v75);
        goto LABEL_61;
      }
      PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a currency amount dictionary", v77, v78, v79, v80, v81, v82, v83, (uint64_t)v8);
      goto LABEL_60;
    }
    int v76 = [v75 isEqualToString:@"balance"];

    if (v76) {
      goto LABEL_110;
    }
    if ([v75 isEqualToString:@"passengerName"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_67;
      }
      PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a person name components dictionary", v84, v85, v86, v87, v88, v89, v90, (uint64_t)v8);
      goto LABEL_60;
    }
    id v91 = v75;
    if (([v91 isEqualToString:@"flightNumber"] & 1) != 0
      || ([v91 isEqualToString:@"duration"] & 1) != 0
      || [v91 isEqualToString:@"tailgatingAllowed"])
    {

LABEL_121:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_67;
      }
      PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not a number.", v93, v94, v95, v96, v97, v98, v99, (uint64_t)v8);
      goto LABEL_60;
    }
    int v92 = [v91 isEqualToString:@"silenceRequested"];

    if (v92) {
      goto LABEL_121;
    }
    id v100 = v91;
    if (([v100 isEqualToString:@"artistIDs"] & 1) != 0
      || ([v100 isEqualToString:@"performerNames"] & 1) != 0
      || [v100 isEqualToString:@"albumIDs"])
    {

LABEL_128:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not an array, must be an array of strings.", v102, v103, v104, v105, v106, v107, v108, (uint64_t)v8);
        goto LABEL_60;
      }
      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      id v46 = v8;
      uint64_t v109 = [v46 countByEnumeratingWithState:&v150 objects:v157 count:16];
      if (v109)
      {
        uint64_t v110 = v109;
        uint64_t v111 = *(void *)v151;
        while (2)
        {
          for (uint64_t i = 0; i != v110; ++i)
          {
            if (*(void *)v151 != v111) {
              objc_enumerationMutation(v46);
            }
            uint64_t v113 = *(void *)(*((void *)&v150 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PKValidationErrorWithReason(@"Value \"%@\" in array for semantic key \"%@\" is not an string.", v114, v115, v116, v117, v118, v119, v120, v113);
              goto LABEL_87;
            }
          }
          uint64_t v110 = [v46 countByEnumeratingWithState:&v150 objects:v157 count:16];
          if (v110) {
            continue;
          }
          break;
        }
      }
      goto LABEL_88;
    }
    int v101 = [v100 isEqualToString:@"playlistIDs"];

    if (v101) {
      goto LABEL_128;
    }
    id v121 = v100;
    if ([v121 isEqualToString:@"seats"])
    {
      _os_feature_enabled_impl();

LABEL_145:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PKValidationErrorWithReason(@"Value \"%@\" for semantic key \"%@\" is not an array, must be an array of dictionaries.", v125, v126, v127, v128, v129, v130, v131, (uint64_t)v8);
        goto LABEL_60;
      }
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id v46 = v8;
      uint64_t v132 = [v46 countByEnumeratingWithState:&v146 objects:v156 count:16];
      if (v132)
      {
        uint64_t v133 = v132;
        uint64_t v134 = *(void *)v147;
        while (2)
        {
          for (uint64_t j = 0; j != v133; ++j)
          {
            if (*(void *)v147 != v134) {
              objc_enumerationMutation(v46);
            }
            uint64_t v136 = *(void *)(*((void *)&v146 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PKValidationErrorWithReason(@"Value \"%@\" in array for semantic key \"%@\" is not a dictionary.", v137, v138, v139, v140, v141, v142, v143, v136);
              goto LABEL_87;
            }
          }
          uint64_t v133 = [v46 countByEnumeratingWithState:&v146 objects:v156 count:16];
          if (v133) {
            continue;
          }
          break;
        }
      }
      goto LABEL_88;
    }
    int v122 = [v121 isEqualToString:@"wifiAccess"];
    int v123 = _os_feature_enabled_impl();
    if (!v123 || (v122 & 1) != 0)
    {
      int v144 = v123 | v122;

      if (v144 == 1) {
        goto LABEL_145;
      }
    }
    else
    {
      char v124 = [v121 isEqualToString:@"airPlay"];

      if (v124) {
        goto LABEL_145;
      }
    }
    v145 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v155 = v121;
      _os_log_impl(&dword_190E10000, v145, OS_LOG_TYPE_DEFAULT, "Ignoring semantic value for unknown key \"%@\".", buf, 0xCu);
    }

    goto LABEL_67;
  }
LABEL_58:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKValidationErrorWithReason(@"Value for semantic key \"%@\" is not a string", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    goto LABEL_60;
  }
LABEL_67:
}

@end