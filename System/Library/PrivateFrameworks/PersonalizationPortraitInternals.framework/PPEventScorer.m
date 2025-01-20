@interface PPEventScorer
+ (id)cacheKeyforCoreRoutineCacheForStartDate:(void *)a3 endDate:;
+ (id)emailAddressFromEKAttendee:(uint64_t)a1;
+ (id)participantsInEvent:(uint64_t)a1;
+ (void)clearAssetCache;
+ (void)enrichDictionary:(id)a3 withEvent:(id)a4 interningSet:(id)a5;
+ (void)setLocationsOfInterestLocations:(id)a3 withReferenceDate:(id)a4;
- (BOOL)isHomeCalendar:(id)a3;
- (BOOL)isWorkCalendar:(id)a3;
- (BOOL)scoreIsExtraordinary:(double)a3 rankingOptions:(int)a4;
- (PPEventScorer)init;
- (PPEventScorer)initWithPastEventTitlesAndParticipants:(id)a3 andEarliestStartTime:(double)a4 shouldConsiderAlarms:(BOOL)a5 withOptions:(int)a6 trialWrapper:(id)a7;
- (PPEventScorer)initWithTrialWrapper:(id)a3;
- (id)eventScorerConfig;
- (id)scoreEvent:(id)a3 usingDate:(id)a4;
- (void)setEmailVIPEmailAddresses:(id)a3;
- (void)setFavoritesEmailAddresses:(id)a3;
@end

@implementation PPEventScorer

- (PPEventScorer)initWithPastEventTitlesAndParticipants:(id)a3 andEarliestStartTime:(double)a4 shouldConsiderAlarms:(BOOL)a5 withOptions:(int)a6 trialWrapper:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PPEventScorer;
  v15 = [(PPEventScorer *)&v30 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pastEventTitlesAndParticipants, a3);
    v16->_earliestStartTime = a4;
    v16->_shouldConsiderAlarms = a5;
    emailVIPEmailAddresses = v16->_emailVIPEmailAddresses;
    v16->_emailVIPEmailAddresses = 0;

    favoritesEmailAddresses = v16->_favoritesEmailAddresses;
    v16->_favoritesEmailAddresses = 0;

    v16->_rankingOptions = a6;
    objc_storeStrong((id *)&v16->_trialWrapper, a7);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v19 = [(NSDictionary *)v16->_pastEventTitlesAndParticipants allKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      int64_t v22 = 0;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v19);
          }
          v22 += [*(id *)(*((void *)&v26 + 1) + 8 * i) containsString:@"@"] ^ 1;
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v21);
    }
    else
    {
      int64_t v22 = 0;
    }

    v16->_pastTitlesCount = v22;
    if (initWithPastEventTitlesAndParticipants_andEarliestStartTime_shouldConsiderAlarms_withOptions_trialWrapper__once != -1) {
      dispatch_once(&initWithPastEventTitlesAndParticipants_andEarliestStartTime_shouldConsiderAlarms_withOptions_trialWrapper__once, &__block_literal_global_13525);
    }
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_favoritesEmailAddresses, 0);
  objc_storeStrong((id *)&self->_emailVIPEmailAddresses, 0);
  objc_storeStrong((id *)&self->_pastEventTitlesAndParticipants, 0);
}

- (void)setFavoritesEmailAddresses:(id)a3
{
}

- (void)setEmailVIPEmailAddresses:(id)a3
{
}

- (BOOL)scoreIsExtraordinary:(double)a3 rankingOptions:(int)a4
{
  char v4 = a4;
  v6 = -[PPEventScorer eventScorerConfig]((uint64_t)self);
  v7 = v6;
  if (!v6)
  {
    double v11 = 1000.0;
LABEL_10:
    BOOL v13 = v11 < a3;
    goto LABEL_11;
  }
  if ((v4 & 2) != 0) {
    v8 = @"highExtraordinaryThreshold";
  }
  else {
    v8 = @"extraordinaryThreshold";
  }
  v9 = [v6 objectForKeyedSubscript:v8];
  [v9 doubleValue];
  double v11 = v10;

  if (v11 != 0.0) {
    goto LABEL_10;
  }
  v12 = pp_events_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPEventRankerFeaturizer: Scoring threshold set to 0", v15, 2u);
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (id)eventScorerConfig
{
  if (a1)
  {
    if (eventScorerConfig_onceToken != -1) {
      dispatch_once(&eventScorerConfig_onceToken, &__block_literal_global_99_13459);
    }
    id v2 = [(id)_configCache objectForKey:@"TCK"];
    if (!v2)
    {
      pthread_mutex_lock(&configLock);
      v3 = [*(id *)(a1 + 64) plistForFactorName:@"EventRankerConfig.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_EVENTS"];
      if ([v3 count])
      {
        id v2 = v3;
        [(id)_configCache setObject:v2 forKey:@"TCK"];
      }
      else
      {
        id v2 = 0;
      }
      pthread_mutex_unlock(&configLock);
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __34__PPEventScorer_eventScorerConfig__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_configCache;
  _configCache = v0;

  id v2 = (void *)_configCache;
  return [v2 setCountLimit:1];
}

- (BOOL)isHomeCalendar:(id)a3
{
  id v3 = a3;
  char v4 = [v3 title];
  BOOL v5 = ([v4 isEqualToString:@"Home"] & 1) != 0 || objc_msgSend(v3, "type") == 4;

  return v5;
}

- (BOOL)isWorkCalendar:(id)a3
{
  id v3 = a3;
  char v4 = [v3 title];
  if ([v4 isEqualToString:@"Work"])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v3 source];
    v7 = [v6 title];
    char v5 = [v7 isEqualToString:@"calendar.apple.com"];
  }
  return v5;
}

- (id)scoreEvent:(id)a3 usingDate:(id)a4
{
  uint64_t v305 = *MEMORY[0x1E4F143B8];
  id v277 = a3;
  id v275 = a4;
  v283 = self;
  v6 = [[PPEventRankerFeaturizer alloc] initWithTrialWrapper:self->_trialWrapper];
  v7 = [(PPEventRankerFeaturizer *)v6 featureSchema];

  if (v7)
  {
    context = (void *)MEMORY[0x1CB79D060]();
    id v8 = v277;
    id v9 = v7;
    long long v297 = 0u;
    long long v298 = 0u;
    long long v299 = 0u;
    long long v300 = 0u;
    double v10 = (void *)MEMORY[0x1CB79D060]();
    id v279 = v8;
    obuint64_t j = [v8 recurrenceRules];
    uint64_t v11 = [obj countByEnumeratingWithState:&v297 objects:&buf count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v298;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v298 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v297 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1CB79D060]();
          switch([v14 frequency])
          {
            case 0:
              v16 = [v9 objectForKeyedSubscript:@"RecurrenceFeatures"];
              v17 = [v16 objectForKeyedSubscript:@"RecurrenceFrequencyDaily"];
              break;
            case 1:
              v16 = [v9 objectForKeyedSubscript:@"RecurrenceFeatures"];
              v17 = [v16 objectForKeyedSubscript:@"RecurrenceFrequencyWeekly"];
              break;
            case 2:
              v16 = [v9 objectForKeyedSubscript:@"RecurrenceFeatures"];
              v17 = [v16 objectForKeyedSubscript:@"RecurrenceFrequencyMonthly"];
              break;
            case 3:
              v16 = [v9 objectForKeyedSubscript:@"RecurrenceFeatures"];
              v17 = [v16 objectForKeyedSubscript:@"RecurrenceFrequencyYearly"];
              break;
            default:
              v16 = [v9 objectForKeyedSubscript:@"RecurrenceFeatures"];
              v17 = [v16 objectForKeyedSubscript:@"RecurrenceRuleSet"];
              break;
          }
          v18 = v17;
          [v17 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v297 objects:&buf count:16];
      }
      while (v11);
    }

    if (([v8 hasRecurrenceRules] & 1) == 0 && objc_msgSend(v8, "isDetached"))
    {
      v19 = [v9 objectForKeyedSubscript:@"RecurrenceFeatures"];
      uint64_t v20 = [v19 objectForKeyedSubscript:@"RecurrenceRuleEventIsDetached"];
      [v20 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
    }
    id v21 = v9;

    id v22 = v279;
    id v23 = v21;
    if (v283)
    {
      [v22 duration];
      if (v24 > 43200.0)
      {
        v25 = [v23 objectForKeyedSubscript:@"DurationFeatures"];
        long long v26 = [v25 objectForKeyedSubscript:@"DurationLongerThan12Hrs"];
        [v26 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
      }
      [v22 duration];
      if (v27 > 79200.0)
      {
        long long v28 = [v23 objectForKeyedSubscript:@"DurationFeatures"];
        long long v29 = [v28 objectForKeyedSubscript:@"DurationLongerThan24Hrs"];
        [v29 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
      }
      [v22 duration];
      if (v30 > 432000.0)
      {
        v31 = [v23 objectForKeyedSubscript:@"DurationFeatures"];
        uint64_t v32 = [v31 objectForKeyedSubscript:@"DurationLongerThan5Days"];
        [v32 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
      }
      v33 = NSNumber;
      [v22 duration];
      v34 = objc_msgSend(v33, "numberWithDouble:");
      v35 = [v23 objectForKeyedSubscript:@"DurationFeatures"];
      v36 = [v35 objectForKeyedSubscript:@"Duration"];
      [v36 setObject:v34 forKeyedSubscript:@"Value"];

      id v37 = v23;
    }
    else
    {
      id v37 = 0;
    }

    id v38 = v22;
    id v39 = v37;
    if (!v283)
    {
      id v61 = 0;
      v41 = 0;
LABEL_49:

      id v62 = v38;
      id v63 = v61;
      if (v41)
      {
        [v62 travelTime];
        if (v64 > 0.0)
        {
          v65 = NSNumber;
          [v62 travelTime];
          v67 = [v65 numberWithDouble:floor(v66 / 60.0 / 10.0)];
          v68 = [v63 objectForKeyedSubscript:@"EventAttributeFeatures"];
          v69 = [v68 objectForKeyedSubscript:@"TravelTimeSet"];
          [v69 setObject:v67 forKeyedSubscript:@"Value"];
        }
        id v70 = v63;
      }
      else
      {
        id v70 = 0;
      }

      id v71 = v70;
      if (v283)
      {
        v72 = [v62 attachments];
        uint64_t v73 = [v72 count];

        if (v73)
        {
          v74 = [v71 objectForKeyedSubscript:@"EventAttributeFeatures"];
          v75 = [v74 objectForKeyedSubscript:@"Attachments"];
          [v75 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
        }
        id v76 = v71;
      }
      else
      {
        id v76 = 0;
      }

      id v77 = v62;
      id v78 = v76;
      if (v283)
      {
        v79 = (void *)MEMORY[0x1CB79D060]();
        v80 = [v77 suggestionInfo];

        if (v80)
        {
          v81 = (void *)MEMORY[0x1CB79D060]();
          v82 = [v78 objectForKeyedSubscript:@"EventAttributeFeatures"];
          v83 = [v82 objectForKeyedSubscript:@"SuggestionsInfo"];
          [v83 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

          v84 = [v77 customObjectForKey:*MEMORY[0x1E4F8A1B0]];
          v85 = [v84 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"];
          int v86 = [v85 isEqualToString:@"Flight"];

          if (v86)
          {
            v87 = [v78 objectForKeyedSubscript:@"EventAttributeFeatures"];
            v88 = [v87 objectForKeyedSubscript:@"StructuredEventFlight"];
            [v88 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
          }
        }
        id v89 = v78;
      }
      else
      {
        id v89 = 0;
      }
      v90 = v283;

      id v91 = v89;
      if (v283)
      {
        if ([v77 hasNotes])
        {
          v92 = [v91 objectForKeyedSubscript:@"EventAttributeFeatures"];
          v93 = [v92 objectForKeyedSubscript:@"Notes"];
          [v93 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

          v90 = v283;
        }
        id v94 = v91;
      }
      else
      {
        id v94 = 0;
      }

      id v95 = v94;
      if (v90)
      {
        v96 = [v77 URL];

        if (v96)
        {
          v97 = [v95 objectForKeyedSubscript:@"EventAttributeFeatures"];
          v98 = [v97 objectForKeyedSubscript:@"URL"];
          [v98 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
        }
        id v99 = v95;
      }
      else
      {
        id v99 = 0;
      }

      id v100 = v99;
      if (v283)
      {
        v101 = [v77 calendar];
        char v102 = [v101 allowsContentModifications];

        if ((v102 & 1) == 0)
        {
          v103 = [v100 objectForKeyedSubscript:@"EventAttributeFeatures"];
          v104 = [v103 objectForKeyedSubscript:@"ContentModificationsNotAllowed"];
          [v104 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
        }
        id v105 = v100;
      }
      else
      {
        id v105 = 0;
      }

      id v106 = v77;
      id v107 = v105;
      if (!v283)
      {
        id v118 = 0;
        goto LABEL_83;
      }
      v108 = [v106 calendar];
      if ([v108 isSubscribed])
      {
      }
      else
      {
        v109 = [v106 calendar];
        v110 = [v109 source];
        uint64_t v111 = [v110 sourceType];

        if (v111 != 4)
        {
LABEL_80:
          v114 = [v106 calendar];
          uint64_t v115 = [v114 sharingStatus];

          if (v115 == 2)
          {
            v116 = [v107 objectForKeyedSubscript:@"CalendarFeatures"];
            v117 = [v116 objectForKeyedSubscript:@"Shared"];
            [v117 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
          }
          id v118 = v107;
LABEL_83:

          id v119 = v106;
          id v120 = v118;
          uint64_t v121 = (uint64_t)v283;
          if (v283)
          {
            if (v283->_pastEventTitlesAndParticipants)
            {
              v122 = [v119 title];
              uint64_t v121 = (uint64_t)v283;
              if (v122)
              {
                pastEventTitlesAndParticipants = v283->_pastEventTitlesAndParticipants;
                v124 = [v119 title];
                v125 = [(NSDictionary *)pastEventTitlesAndParticipants objectForKeyedSubscript:v124];

                uint64_t v121 = (uint64_t)v283;
                if (v125)
                {
                  v126 = [v120 objectForKeyedSubscript:@"TitleFeatures"];
                  v127 = [v126 objectForKeyedSubscript:@"RecurringTitle"];
                  [v127 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

                  uint64_t v121 = (uint64_t)v283;
                }
              }
            }
            id v128 = v120;
          }
          else
          {
            id v128 = 0;
          }

          id v129 = v128;
          if (v121)
          {
            if (*(void *)(v121 + 56))
            {
              v130 = -[PPEventScorer eventScorerConfig](v121);
              v131 = v130;
              if (v130)
              {
                int64_t pastTitlesCount = v283->_pastTitlesCount;
                v133 = [v130 objectForKeyedSubscript:@"minEkEventsForThreshold"];
                uint64_t v134 = [v133 integerValue];

                if (pastTitlesCount > v134)
                {
                  v135 = [NSNumber numberWithInteger:v283->_pastTitlesCount];
                  v136 = [v129 objectForKeyedSubscript:@"TitleFeatures"];
                  v137 = [v136 objectForKeyedSubscript:@"PastTitleCount"];
                  [v137 setObject:v135 forKeyedSubscript:@"Value"];
                }
              }

              uint64_t v121 = (uint64_t)v283;
            }
            id v138 = v129;
          }
          else
          {
            id v138 = 0;
          }

          id v139 = v119;
          id v140 = v138;
          v278 = v139;
          if (!v121)
          {
            id v162 = 0;
LABEL_119:

            id v276 = v162;
            if (!v283)
            {
              id v204 = 0;
              goto LABEL_177;
            }
            v274 = +[PPEventScorer participantsInEvent:]((uint64_t)PPEventScorer, v278);
            if (![v274 count])
            {
LABEL_176:
              id v204 = v276;

LABEL_177:
              id v205 = v204;
              if (v283)
              {
                v206 = [v278 selfAttendee];
                uint64_t v207 = [v206 participantRole];

                if ((unint64_t)(v207 - 2) <= 2)
                {
                  v208 = off_1E65D7F78[v207 - 2];
                  v209 = [v205 objectForKeyedSubscript:@"ParticipantsFeatures"];
                  v210 = [v209 objectForKeyedSubscript:*v208];
                  [v210 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
                }
                id v211 = v205;
              }
              else
              {
                id v211 = 0;
              }

              id v212 = v211;
              v213 = v283;
              if (v283)
              {
                unint64_t v214 = [v278 availability];
                if (v214 <= 2)
                {
                  v215 = off_1E65D7F90[v214];
                  v216 = [v212 objectForKeyedSubscript:@"EventAttributeFeatures"];
                  v217 = [v216 objectForKeyedSubscript:*v215];
                  [v217 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

                  v213 = v283;
                }
                id v218 = v212;
              }
              else
              {
                id v218 = 0;
              }

              id v219 = v278;
              id v220 = v218;
              if (v213)
              {
                v221 = +[PPEventScorer participantsInEvent:]((uint64_t)PPEventScorer, v219);
                v222 = (void *)[v221 mutableCopy];

                if ([v222 count])
                {
                  v223 = [v219 selfAttendee];
                  v224 = +[PPEventScorer emailAddressFromEKAttendee:]((uint64_t)PPEventScorer, v223);

                  if (v224) {
                    [v222 removeObject:v224];
                  }
                  long long v299 = 0u;
                  long long v300 = 0u;
                  long long v297 = 0u;
                  long long v298 = 0u;
                  id v225 = v222;
                  uint64_t v226 = [v225 countByEnumeratingWithState:&v297 objects:&buf count:16];
                  if (v226)
                  {
                    uint64_t v227 = *(void *)v298;
                    double v228 = 0.0;
                    do
                    {
                      for (uint64_t j = 0; j != v226; ++j)
                      {
                        if (*(void *)v298 != v227) {
                          objc_enumerationMutation(v225);
                        }
                        v230 = [(NSDictionary *)v283->_pastEventTitlesAndParticipants objectForKeyedSubscript:*(void *)(*((void *)&v297 + 1) + 8 * j)];
                        BOOL v231 = v230 == 0;

                        if (!v231) {
                          double v228 = v228 + 1.0;
                        }
                      }
                      uint64_t v226 = [v225 countByEnumeratingWithState:&v297 objects:&buf count:16];
                    }
                    while (v226);
                  }
                  else
                  {
                    double v228 = 0.0;
                  }

                  if (v228 / (double)(unint64_t)[v225 count] > 0.0)
                  {
                    v232 = objc_msgSend(NSNumber, "numberWithDouble:");
                    v233 = [v220 objectForKeyedSubscript:@"ParticipantsFeatures"];
                    v234 = [v233 objectForKeyedSubscript:@"ParticipantsInPast"];
                    [v234 setObject:v232 forKeyedSubscript:@"Value"];
                  }
                }
                id v235 = v220;
              }
              else
              {
                id v235 = 0;
              }

              id v236 = v275;
              id v237 = v235;
              if (v283)
              {
                v238 = [v219 structuredLocationWithoutPrediction];
                v239 = [v238 geoLocation];

                if (v239)
                {
                  id v240 = v236;
                  v241 = +[PPEventRankerDateUtils dateTwoWeeksPriorToDate:v240];
                  v242 = +[PPEventScorer cacheKeyforCoreRoutineCacheForStartDate:endDate:]((uint64_t)PPEventScorer, v241, v240);
                  v243 = [(id)routineCache objectForKey:v242];
                  if (!v243)
                  {
                    v243 = +[PPRoutineSupport locationsOfInterestVisitedBetweenStartDate:v241 endDate:v240];
                    if (v243) {
                      [(id)routineCache setObject:v243 forKey:v242];
                    }
                  }

                  long long v299 = 0u;
                  long long v300 = 0u;
                  long long v297 = 0u;
                  long long v298 = 0u;
                  uint64_t v244 = [v243 countByEnumeratingWithState:&v297 objects:&buf count:16];
                  if (v244)
                  {
                    uint64_t v245 = *(void *)v298;
                    double v246 = -1.0;
                    do
                    {
                      for (uint64_t k = 0; k != v244; ++k)
                      {
                        if (*(void *)v298 != v245) {
                          objc_enumerationMutation(v243);
                        }
                        [*(id *)(*((void *)&v297 + 1) + 8 * k) distanceFromLocation:v239];
                        if (v246 == -1.0 || v246 > v248) {
                          double v246 = v248;
                        }
                      }
                      uint64_t v244 = [v243 countByEnumeratingWithState:&v297 objects:&buf count:16];
                    }
                    while (v244);
                    if (v246 != 0.0 && v246 > 1000.0)
                    {
                      v249 = [v237 objectForKeyedSubscript:@"RoutineFeatures"];
                      v250 = [v249 objectForKeyedSubscript:@"OutsideLocationsOfInterest"];
                      [v250 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
                    }
                  }
                  else
                  {
                    double v246 = -1.0;
                  }
                  v251 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(floor(v246 / 1000.0), 100.0));
                  v252 = [v237 objectForKeyedSubscript:@"RoutineFeatures"];
                  v253 = [v252 objectForKeyedSubscript:@"MinDistanceFromLocationsOfInterest"];
                  [v253 setObject:v251 forKeyedSubscript:@"Value"];
                }
                id v254 = v237;
              }
              else
              {
                id v254 = 0;
              }

              id v255 = v254;
              if (v283)
              {
                v256 = [v219 startDate];
                +[PPEventRankerDateUtils secondsFromMidnight:v256];
                double v258 = v257;

                double earliestStartTime = v283->_earliestStartTime;
                if (earliestStartTime != -1.0 && earliestStartTime + -3600.0 > v258)
                {
                  v260 = [v255 objectForKeyedSubscript:@"UnusualStartTimeFeatures"];
                  v261 = [v260 objectForKeyedSubscript:@"UnusualStartTime"];
                  [v261 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
                }
                id v262 = v255;
              }
              else
              {
                id v262 = 0;
              }

              v263 = +[PPEventRankerFeaturizer scoreFeatureSchema:v262];
              [v263 weightedScore];
              uint64_t v264 = -[PPEventScorer scoreIsExtraordinary:rankingOptions:](v283, "scoreIsExtraordinary:rankingOptions:", v283->_rankingOptions);
              v265 = (void *)MEMORY[0x1E4F89E08];
              [v263 weightedScore];
              double v267 = v266;
              uint64_t v268 = [v263 prominentFeature];
              v269 = [v263 featureValues];
              v60 = [v265 eventHighlightWithEKEvent:v219 score:v268 prominentFeature:v269 features:v264 isExtraordinary:v267];

              goto LABEL_231;
            }
            emailVIPEmailAddresses = v283->_emailVIPEmailAddresses;
            if (emailVIPEmailAddresses)
            {
              v164 = emailVIPEmailAddresses;
            }
            else
            {
              *(void *)&long long v297 = 0;
              *((void *)&v297 + 1) = &v297;
              *(void *)&long long v298 = 0x2050000000;
              v165 = (void *)getEMDaemonInterfaceClass_softClass;
              *((void *)&v298 + 1) = getEMDaemonInterfaceClass_softClass;
              if (!getEMDaemonInterfaceClass_softClass)
              {
                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                *((void *)&buf + 1) = 3221225472;
                v302 = __getEMDaemonInterfaceClass_block_invoke;
                v303 = &unk_1E65DC058;
                v304 = &v297;
                __getEMDaemonInterfaceClass_block_invoke((uint64_t)&buf);
                v165 = *(void **)(*((void *)&v297 + 1) + 24);
              }
              id v166 = v165;
              _Block_object_dispose(&v297, 8);
              v167 = objc_opt_new();
              v168 = [v167 vipManager];
              if ([v168 conformsToProtocol:&unk_1F259E350])
              {
                id v169 = (id)[v168 allVIPWaitForResult];
              }
              else
              {
                v170 = pp_default_log_handle();
                if (os_log_type_enabled(v170, OS_LOG_TYPE_FAULT))
                {
                  v271 = objc_opt_class();
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v271;
                  id v272 = v271;
                  _os_log_fault_impl(&dword_1CA9A8000, v170, OS_LOG_TYPE_FAULT, "[vipManager conformsToProtocol:@protocol(EMVIPReader_Private)] was false (class: %@) -- the VIP set will likely be empty even if the user has VIP’s", (uint8_t *)&buf, 0xCu);
                }
              }
              v171 = [v168 allVIPEmailAddresses];
              uint64_t v172 = [v171 copy];
              v173 = v283->_emailVIPEmailAddresses;
              v283->_emailVIPEmailAddresses = (EAEmailAddressSet *)v172;

              v164 = v283->_emailVIPEmailAddresses;
              if (!v164)
              {
LABEL_144:
                favoritesEmailAddresses = v283->_favoritesEmailAddresses;
                if (favoritesEmailAddresses)
                {
                  v183 = favoritesEmailAddresses;
                }
                else
                {
                  v189 = (NSSet *)objc_opt_new();
                  v190 = PPFavoriteContacts();
                  long long v294 = 0u;
                  long long v295 = 0u;
                  long long v292 = 0u;
                  long long v293 = 0u;
                  id v280 = v190;
                  uint64_t v191 = [v280 countByEnumeratingWithState:&v292 objects:&buf count:16];
                  if (v191)
                  {
                    id obja = *(id *)v293;
                    do
                    {
                      for (uint64_t m = 0; m != v191; ++m)
                      {
                        if (*(id *)v293 != obja) {
                          objc_enumerationMutation(v280);
                        }
                        v193 = *(void **)(*((void *)&v292 + 1) + 8 * m);
                        v194 = (void *)MEMORY[0x1CB79D060]();
                        long long v290 = 0u;
                        long long v291 = 0u;
                        long long v288 = 0u;
                        long long v289 = 0u;
                        v195 = [v193 emailAddresses];
                        uint64_t v196 = [v195 countByEnumeratingWithState:&v288 objects:&v297 count:16];
                        if (v196)
                        {
                          uint64_t v197 = *(void *)v289;
                          do
                          {
                            for (uint64_t n = 0; n != v196; ++n)
                            {
                              if (*(void *)v289 != v197) {
                                objc_enumerationMutation(v195);
                              }
                              v199 = [*(id *)(*((void *)&v288 + 1) + 8 * n) value];
                              [(NSSet *)v189 addObject:v199];
                            }
                            uint64_t v196 = [v195 countByEnumeratingWithState:&v288 objects:&v297 count:16];
                          }
                          while (v196);
                        }
                      }
                      uint64_t v191 = [v280 countByEnumeratingWithState:&v292 objects:&buf count:16];
                    }
                    while (v191);
                  }

                  v200 = v283->_favoritesEmailAddresses;
                  v283->_favoritesEmailAddresses = v189;

                  v183 = v283->_favoritesEmailAddresses;
                  if (!v183) {
                    goto LABEL_175;
                  }
                }
                long long v299 = 0u;
                long long v300 = 0u;
                long long v297 = 0u;
                long long v298 = 0u;
                id v184 = v274;
                uint64_t v185 = [v184 countByEnumeratingWithState:&v297 objects:&buf count:16];
                if (v185)
                {
                  uint64_t v186 = *(void *)v298;
                  double v187 = 0.0;
                  do
                  {
                    for (iuint64_t i = 0; ii != v185; ++ii)
                    {
                      if (*(void *)v298 != v186) {
                        objc_enumerationMutation(v184);
                      }
                      if ([(NSSet *)v183 containsObject:*(void *)(*((void *)&v297 + 1) + 8 * ii)])
                      {
                        double v187 = v187 + 1.0;
                      }
                    }
                    uint64_t v185 = [v184 countByEnumeratingWithState:&v297 objects:&buf count:16];
                  }
                  while (v185);
                }
                else
                {
                  double v187 = 0.0;
                }

                if (v187 / (double)(unint64_t)[v184 count] > 0.0)
                {
                  v201 = objc_msgSend(NSNumber, "numberWithDouble:");
                  v202 = [v276 objectForKeyedSubscript:@"ParticipantsFeatures"];
                  v203 = [v202 objectForKeyedSubscript:@"ParticipantsFavorites"];
                  [v203 setObject:v201 forKeyedSubscript:@"Value"];
                }
LABEL_175:

                goto LABEL_176;
              }
            }
            long long v286 = 0u;
            long long v287 = 0u;
            long long v284 = 0u;
            long long v285 = 0u;
            id v174 = v274;
            uint64_t v175 = [v174 countByEnumeratingWithState:&v284 objects:v296 count:16];
            if (v175)
            {
              uint64_t v176 = *(void *)v285;
              double v177 = 0.0;
              do
              {
                for (uint64_t jj = 0; jj != v175; ++jj)
                {
                  if (*(void *)v285 != v176) {
                    objc_enumerationMutation(v174);
                  }
                  if ([(EAEmailAddressSet *)v164 containsObject:*(void *)(*((void *)&v284 + 1) + 8 * jj)])double v177 = v177 + 1.0; {
                }
                  }
                uint64_t v175 = [v174 countByEnumeratingWithState:&v284 objects:v296 count:16];
              }
              while (v175);
            }
            else
            {
              double v177 = 0.0;
            }

            if (v177 / (double)(unint64_t)[v174 count] > 0.0)
            {
              v179 = objc_msgSend(NSNumber, "numberWithDouble:");
              v180 = [v276 objectForKeyedSubscript:@"ParticipantsFeatures"];
              v181 = [v180 objectForKeyedSubscript:@"ParticipantsVIP"];
              [v181 setObject:v179 forKeyedSubscript:@"Value"];
            }
            goto LABEL_144;
          }
          v141 = [v139 selfAttendee];

          if (v141)
          {
            v142 = [v278 selfAttendee];
            uint64_t v143 = [v142 participantStatus];

            if (v143 == 2)
            {
              v144 = [v140 objectForKeyedSubscript:@"ParticipantsFeatures"];
              v145 = [v144 objectForKeyedSubscript:@"SelfAttendeeStatusAccepted"];
              [v145 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

              long long v299 = 0u;
              long long v300 = 0u;
              long long v297 = 0u;
              long long v298 = 0u;
              v146 = [v278 attendees];
              uint64_t v147 = [v146 countByEnumeratingWithState:&v297 objects:&buf count:16];
              if (v147)
              {
                int v148 = 0;
                uint64_t v149 = *(void *)v298;
                do
                {
                  for (uint64_t kk = 0; kk != v147; ++kk)
                  {
                    if (*(void *)v298 != v149) {
                      objc_enumerationMutation(v146);
                    }
                    if ([*(id *)(*((void *)&v297 + 1) + 8 * kk) participantType] == 1) {
                      ++v148;
                    }
                  }
                  uint64_t v147 = [v146 countByEnumeratingWithState:&v297 objects:&buf count:16];
                }
                while (v147);

                if (v148 == 2)
                {
                  v151 = [v140 objectForKeyedSubscript:@"ParticipantsFeatures"];
                  v152 = [v151 objectForKeyedSubscript:@"AttendeeCountLessThanThree"];
                  [v152 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
                }
                else if (v148 >= 11)
                {
                  v160 = [v140 objectForKeyedSubscript:@"ParticipantsFeatures"];
                  v161 = [v160 objectForKeyedSubscript:@"AtendeeCountMoreThanTen"];
                  [v161 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];
                }
              }
              else
              {
              }
              goto LABEL_118;
            }
            v153 = [v278 selfAttendee];
            uint64_t v154 = [v153 participantStatus];

            if (v154 == 3)
            {
              v155 = [v140 objectForKeyedSubscript:@"ParticipantsFeatures"];
              v156 = [v155 objectForKeyedSubscript:@"SelfAttendeeStatusDeclined"];
LABEL_114:
              v159 = v156;
              [v156 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

              goto LABEL_118;
            }
            v157 = [v278 selfAttendee];
            uint64_t v158 = [v157 participantStatus];

            if (v158 == 4)
            {
              v155 = [v140 objectForKeyedSubscript:@"ParticipantsFeatures"];
              v156 = [v155 objectForKeyedSubscript:@"SelfAttendeeStatusTentative"];
              goto LABEL_114;
            }
          }
LABEL_118:
          id v162 = v140;
          goto LABEL_119;
        }
      }
      v112 = [v107 objectForKeyedSubscript:@"CalendarFeatures"];
      v113 = [v112 objectForKeyedSubscript:@"Subscribed"];
      [v113 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

      goto LABEL_80;
    }
    v40 = [v38 alarms];
    if (![v40 count]) {
      goto LABEL_46;
    }
    v41 = v283;
    BOOL shouldConsiderAlarms = v283->_shouldConsiderAlarms;

    if (!shouldConsiderAlarms)
    {
LABEL_48:
      id v61 = v39;
      goto LABEL_49;
    }
    v43 = [v39 objectForKeyedSubscript:@"EventAttributeFeatures"];
    v44 = [v43 objectForKeyedSubscript:@"AlarmSet"];
    [v44 setObject:&unk_1F2569368 forKeyedSubscript:@"Value"];

    long long v299 = 0u;
    long long v300 = 0u;
    long long v297 = 0u;
    long long v298 = 0u;
    v40 = [v38 alarms];
    uint64_t v45 = [v40 countByEnumeratingWithState:&v297 objects:&buf count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v298;
      double v47 = 0.0;
      do
      {
        for (uint64_t mm = 0; mm != v45; ++mm)
        {
          if (*(void *)v298 != v46) {
            objc_enumerationMutation(v40);
          }
          v49 = *(void **)(*((void *)&v297 + 1) + 8 * mm);
          v50 = [v49 absoluteDate];

          if (v50)
          {
            v51 = [v49 absoluteDate];
            v52 = [v38 startDate];
            [v51 timeIntervalSinceDate:v52];
            double v54 = v53;
          }
          else
          {
            [v49 relativeOffset];
            double v54 = v55;
          }
          if (v47 > v54) {
            double v47 = v54;
          }
        }
        uint64_t v45 = [v40 countByEnumeratingWithState:&v297 objects:&buf count:16];
      }
      while (v45);

      v41 = v283;
      if (v47 == 0.0) {
        goto LABEL_48;
      }
      v56 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(fabs(floor(v47 / 60.0 / 10.0)), 100.0));
      v57 = [v39 objectForKeyedSubscript:@"EventAttributeFeatures"];
      v58 = [v57 objectForKeyedSubscript:@"AlarmTime"];
      [v58 setObject:v56 forKeyedSubscript:@"Value"];
    }
    else
    {
LABEL_46:
    }
    v41 = v283;
    goto LABEL_48;
  }
  v59 = pp_default_log_handle();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1CA9A8000, v59, OS_LOG_TYPE_ERROR, "PPEventRankerFeatureSchema is nil", (uint8_t *)&buf, 2u);
  }

  v60 = [MEMORY[0x1E4F89E08] eventHighlightWithEKEvent:v277 score:8 prominentFeature:MEMORY[0x1E4F1CBF0] features:0 isExtraordinary:0.0];
LABEL_231:

  return v60;
}

+ (id)cacheKeyforCoreRoutineCacheForStartDate:(void *)a3 endDate:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = objc_opt_new();
  [v6 setFormatOptions:275];
  v7 = NSString;
  id v8 = [v6 stringFromDate:v5];

  id v9 = [v6 stringFromDate:v4];

  double v10 = [v7 stringWithFormat:@"%@%@", v8, v9];

  return v10;
}

+ (id)participantsInEvent:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (void *)MEMORY[0x1CB79D060](v4);
  v6 = [v2 attendees];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1CB79D060]();
        BOOL v13 = +[PPEventScorer emailAddressFromEKAttendee:](v3, v11);
        if (v13) {
          [v4 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)emailAddressFromEKAttendee:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 participantType] == 1)
  {
    uint64_t v3 = [v2 emailAddress];
    if ([v3 hasPrefix:@"mailto:"])
    {
      uint64_t v4 = [v3 substringFromIndex:7];

      uint64_t v3 = (void *)v4;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (PPEventScorer)init
{
  uint64_t v3 = +[PPTrialWrapper sharedInstance];
  uint64_t v4 = [(PPEventScorer *)self initWithPastEventTitlesAndParticipants:MEMORY[0x1E4F1CC08] andEarliestStartTime:1 shouldConsiderAlarms:0 withOptions:v3 trialWrapper:-1.0];

  return v4;
}

- (PPEventScorer)initWithTrialWrapper:(id)a3
{
  return [(PPEventScorer *)self initWithPastEventTitlesAndParticipants:MEMORY[0x1E4F1CC08] andEarliestStartTime:1 shouldConsiderAlarms:0 withOptions:a3 trialWrapper:-1.0];
}

uint64_t __123__PPEventScorer_initWithPastEventTitlesAndParticipants_andEarliestStartTime_shouldConsiderAlarms_withOptions_trialWrapper___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)routineCache;
  routineCache = v0;

  id v2 = (void *)routineCache;
  return [v2 setCountLimit:1];
}

+ (void)clearAssetCache
{
  [(id)_configCache removeAllObjects];
  +[PPEventRankerFeaturizer clearAssetCache];
}

+ (void)setLocationsOfInterestLocations:(id)a3 withReferenceDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[PPEventRankerDateUtils dateTwoWeeksPriorToDate:v6];
  +[PPEventScorer cacheKeyforCoreRoutineCacheForStartDate:endDate:]((uint64_t)a1, v8, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(id)routineCache setObject:v7 forKey:v9];
}

+ (void)enrichDictionary:(id)a3 withEvent:(id)a4 interningSet:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PPEventScorer_enrichDictionary_withEvent_interningSet___block_invoke;
  aBlock[3] = &unk_1E65D7F40;
  id v32 = v10;
  id v39 = v32;
  uint64_t v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v12 = [v9 title];
  uint64_t v13 = v11[2](v11, v12);

  if (v13)
  {
    id v14 = [v8 objectForKeyedSubscript:v13];

    if (v14)
    {
      long long v15 = NSNumber;
      long long v16 = [v8 objectForKeyedSubscript:v13];
      long long v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "integerValue") + 1);
      [v8 setObject:v17 forKeyedSubscript:v13];
    }
    else
    {
      [v8 setObject:&unk_1F2569368 forKeyedSubscript:v13];
    }
  }
  double v30 = (void *)v13;
  v33 = v9;
  +[PPEventScorer participantsInEvent:]((uint64_t)a1, v9);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v29 = v37 = 0u;
  long long v18 = [v29 allObjects];
  v31 = v11;
  v19 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v11);

  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v25 = [v8 objectForKeyedSubscript:v24];

        if (v25)
        {
          long long v26 = NSNumber;
          double v27 = [v8 objectForKeyedSubscript:v24];
          long long v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
          [v8 setObject:v28 forKeyedSubscript:v24];
        }
        else
        {
          [v8 setObject:&unk_1F2569368 forKeyedSubscript:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v21);
  }
}

id __57__PPEventScorer_enrichDictionary_withEvent_interningSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [*(id *)(a1 + 32) member:v3];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v8 = (void *)[v4 copy];

      [*(id *)(a1 + 32) addObject:v8];
      id v7 = v8;
      uint64_t v4 = v7;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

@end