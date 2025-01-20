@interface PGPublicEventCriteria
- (BOOL)_hasSufficientTimeOverlapForEvent:(id)a3 matchingOptions:(id)a4;
- (BOOL)_isMatchingMeaningDisambiguationForEvent:(id)a3 matchingOptions:(id)a4 withHighConfidence:(BOOL *)a5;
- (BOOL)_promoteToHighConfidenceBasedOnEvent:(id)a3;
- (BOOL)allowsExpandingTimeAttendance;
- (BOOL)hasMinimumAttendance;
- (BOOL)isMatchingEvent:(id)a3 matchingOptions:(id)a4 withHighConfidence:(BOOL *)a5 matchingDistance:(double *)a6;
- (BOOL)promoteToHighConfidenceBasedOnCategory;
- (NSArray)disambiguationCriteria;
- (NSArray)highConfidenceCriteria;
- (NSArray)prohibitedCriteria;
- (NSString)eventCategory;
- (double)maximumDistance;
- (double)minimumTimeAttendance;
- (id)_localizedEventNameTerms:(id)a3;
- (id)_localizedSubcategoryTerms:(id)a3;
- (int64_t)minimumAttendance;
- (void)setAllowsExpandingTimeAttendance:(BOOL)a3;
- (void)setDisambiguationCriteria:(id)a3;
- (void)setEventCategory:(id)a3;
- (void)setHighConfidenceCriteria:(id)a3;
- (void)setMaximumDistance:(double)a3;
- (void)setMinimumAttendance:(int64_t)a3;
- (void)setMinimumTimeAttendance:(double)a3;
- (void)setProhibitedCriteria:(id)a3;
- (void)setPromoteToHighConfidenceBasedOnCategory:(BOOL)a3;
@end

@implementation PGPublicEventCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitedCriteria, 0);
  objc_storeStrong((id *)&self->_highConfidenceCriteria, 0);
  objc_storeStrong((id *)&self->_disambiguationCriteria, 0);
  objc_storeStrong((id *)&self->_eventCategory, 0);
}

- (void)setPromoteToHighConfidenceBasedOnCategory:(BOOL)a3
{
  self->_promoteToHighConfidenceBasedOnCategory = a3;
}

- (BOOL)promoteToHighConfidenceBasedOnCategory
{
  return self->_promoteToHighConfidenceBasedOnCategory;
}

- (void)setProhibitedCriteria:(id)a3
{
}

- (NSArray)prohibitedCriteria
{
  return self->_prohibitedCriteria;
}

- (void)setHighConfidenceCriteria:(id)a3
{
}

- (NSArray)highConfidenceCriteria
{
  return self->_highConfidenceCriteria;
}

- (void)setDisambiguationCriteria:(id)a3
{
}

- (NSArray)disambiguationCriteria
{
  return self->_disambiguationCriteria;
}

- (void)setAllowsExpandingTimeAttendance:(BOOL)a3
{
  self->_allowsExpandingTimeAttendance = a3;
}

- (BOOL)allowsExpandingTimeAttendance
{
  return self->_allowsExpandingTimeAttendance;
}

- (void)setMinimumAttendance:(int64_t)a3
{
  self->_minimumAttendance = a3;
}

- (int64_t)minimumAttendance
{
  return self->_minimumAttendance;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMinimumTimeAttendance:(double)a3
{
  self->_minimumTimeAttendance = a3;
}

- (double)minimumTimeAttendance
{
  return self->_minimumTimeAttendance;
}

- (void)setEventCategory:(id)a3
{
}

- (NSString)eventCategory
{
  return self->_eventCategory;
}

- (id)_localizedEventNameTerms:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"en"])
  {
    v4 = &unk_1F28D42F0;
  }
  else if ([v3 isEqualToString:@"de"])
  {
    v4 = &unk_1F28D4308;
  }
  else if ([v3 isEqualToString:@"fr"])
  {
    v4 = &unk_1F28D4320;
  }
  else if ([v3 isEqualToString:@"ja"])
  {
    v4 = &unk_1F28D4338;
  }
  else if ([v3 isEqualToString:@"zh"])
  {
    v4 = &unk_1F28D4350;
  }
  else if ([v3 isEqualToString:@"nl"])
  {
    v4 = &unk_1F28D4368;
  }
  else if ([v3 isEqualToString:@"it"])
  {
    v4 = &unk_1F28D4380;
  }
  else if ([v3 isEqualToString:@"ko"])
  {
    v4 = &unk_1F28D4398;
  }
  else if ([v3 isEqualToString:@"es"])
  {
    v4 = &unk_1F28D43B0;
  }
  else if ([v3 isEqualToString:@"ar"])
  {
    v4 = &unk_1F28D43C8;
  }
  else if ([v3 isEqualToString:@"pt"])
  {
    v4 = &unk_1F28D43E0;
  }
  else if ([v3 isEqualToString:@"ru"])
  {
    v4 = &unk_1F28D43F8;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([v3 isEqualToString:@"da"]) {
    v4 = &unk_1F28D4410;
  }
  if ([v3 isEqualToString:@"nb"]) {
    v4 = &unk_1F28D4428;
  }
  if ([v3 isEqualToString:@"pl"]) {
    v4 = &unk_1F28D4440;
  }
  if ([v3 isEqualToString:@"sv"]) {
    v4 = &unk_1F28D4458;
  }
  if ([v3 isEqualToString:@"tr"]) {
    v4 = &unk_1F28D4470;
  }
  if ([v3 isEqualToString:@"fi"]) {
    v4 = &unk_1F28D4488;
  }

  return v4;
}

- (id)_localizedSubcategoryTerms:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"en"])
  {
    v4 = &unk_1F28D4140;
  }
  else if ([v3 isEqualToString:@"de"])
  {
    v4 = &unk_1F28D4158;
  }
  else if ([v3 isEqualToString:@"fr"])
  {
    v4 = &unk_1F28D4170;
  }
  else if ([v3 isEqualToString:@"ja"])
  {
    v4 = &unk_1F28D4188;
  }
  else if ([v3 isEqualToString:@"zh"])
  {
    v4 = &unk_1F28D41A0;
  }
  else if ([v3 isEqualToString:@"nl"])
  {
    v4 = &unk_1F28D41B8;
  }
  else if ([v3 isEqualToString:@"it"])
  {
    v4 = &unk_1F28D41D0;
  }
  else if ([v3 isEqualToString:@"ko"])
  {
    v4 = &unk_1F28D41E8;
  }
  else if ([v3 isEqualToString:@"es"])
  {
    v4 = &unk_1F28D4200;
  }
  else if ([v3 isEqualToString:@"ar"])
  {
    v4 = &unk_1F28D4218;
  }
  else if ([v3 isEqualToString:@"pt"])
  {
    v4 = &unk_1F28D4230;
  }
  else if ([v3 isEqualToString:@"ru"])
  {
    v4 = &unk_1F28D4248;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([v3 isEqualToString:@"da"]) {
    v4 = &unk_1F28D4260;
  }
  if ([v3 isEqualToString:@"nb"]) {
    v4 = &unk_1F28D4278;
  }
  if ([v3 isEqualToString:@"pl"]) {
    v4 = &unk_1F28D4290;
  }
  if ([v3 isEqualToString:@"sv"]) {
    v4 = &unk_1F28D42A8;
  }
  if ([v3 isEqualToString:@"tr"]) {
    v4 = &unk_1F28D42C0;
  }
  if ([v3 isEqualToString:@"fi"]) {
    v4 = &unk_1F28D42D8;
  }

  return v4;
}

- (BOOL)_promoteToHighConfidenceBasedOnEvent:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v5 = [v44 languageCode];
  v6 = [(PGPublicEventCriteria *)self _localizedSubcategoryTerms:v5];
  [v4 categories];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v65 count:16];
  id v45 = v7;
  if (v8)
  {
    uint64_t v9 = *(void *)v59;
    v40 = (void *)v5;
    v43 = v6;
    v36 = self;
    uint64_t v37 = *(void *)v59;
    do
    {
      uint64_t v10 = 0;
      uint64_t v38 = v8;
      do
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v41 = v10;
        v11 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * v10), "localizedSubcategories", v36);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v12 = v11;
        uint64_t v42 = [v12 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v42)
        {
          uint64_t v13 = *(void *)v55;
          uint64_t v39 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v55 != v13) {
                objc_enumerationMutation(v12);
              }
              v15 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v16 = v6;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v63 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v51;
                while (2)
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v51 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8 * j);
                    v22 = [v15 localizedLowercaseString];
                    LOBYTE(v21) = [v22 containsString:v21];

                    if (v21)
                    {

                      BOOL v33 = 1;
                      v34 = v45;
                      id v25 = v45;
                      v24 = v40;
                      v23 = v43;
                      goto LABEL_38;
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v63 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              v6 = v43;
              uint64_t v13 = v39;
            }
            uint64_t v5 = (uint64_t)v40;
            id v7 = v45;
            self = v36;
            uint64_t v42 = [v12 countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v42);
        }

        uint64_t v10 = v41 + 1;
        uint64_t v9 = v37;
      }
      while (v41 + 1 != v38);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v8);
  }
  v23 = v6;

  v24 = (void *)v5;
  [(PGPublicEventCriteria *)self _localizedEventNameTerms:v5];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v47;
    while (2)
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        v31 = [v4 name];
        v32 = [v31 localizedLowercaseString];
        LOBYTE(v30) = [v32 containsString:v30];

        if (v30)
        {

          goto LABEL_36;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v62 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  if ([v4 hasExpectedAttendance] && objc_msgSend(v4, "expectedAttendance") > 2000) {
LABEL_36:
  }
    BOOL v33 = 1;
  else {
    BOOL v33 = 0;
  }
  v34 = v45;
LABEL_38:

  return v33;
}

- (BOOL)hasMinimumAttendance
{
  int64_t minimumAttendance = self->_minimumAttendance;
  if (minimumAttendance) {
    BOOL v3 = minimumAttendance == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)isMatchingEvent:(id)a3 matchingOptions:(id)a4 withHighConfidence:(BOOL *)a5 matchingDistance:(double *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 name];
  if ([(PGPublicEventCriteria *)self hasMinimumAttendance])
  {
    int64_t v13 = [(PGPublicEventCriteria *)self minimumAttendance];
    uint64_t v14 = [v10 expectedAttendance];
    if (![v10 hasExpectedAttendance] || v14 < v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478339;
        BOOL v33 = v12;
        __int16 v34 = 2048;
        double v35 = *(double *)&v14;
        __int16 v36 = 2048;
        double v37 = *(double *)&v13;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: minimumAttendance %ld is not big enough %ld", buf, 0x20u);
      }
      [v11 coordinates];
      goto LABEL_11;
    }
  }
  BOOL v15 = [(PGPublicEventCriteria *)self _hasSufficientTimeOverlapForEvent:v10 matchingOptions:v11];
  [v11 coordinates];
  uint64_t v30 = v16;
  uint64_t v31 = v17;
  if (!v15)
  {
LABEL_11:
    double v23 = 1.79769313e308;
LABEL_12:
    BOOL v24 = 0;
    *a5 = 0;
    *a6 = v23;
    goto LABEL_13;
  }
  [(PGPublicEventCriteria *)self maximumDistance];
  double v19 = v18;
  [v10 businessItemCoordinates];
  uint64_t v28 = v20;
  uint64_t v29 = v21;
  CLLocationCoordinate2DGetDistanceFrom();
  double v23 = v22;
  if (v22 > v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      BOOL v33 = v12;
      __int16 v34 = 2048;
      double v35 = v23;
      __int16 v36 = 2048;
      double v37 = v19;
      _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: distance %.1f is larger than maxDistance %.1f", buf, 0x20u);
    }
    goto LABEL_12;
  }
  buf[0] = 0;
  BOOL v26 = -[PGPublicEventCriteria _isMatchingMeaningDisambiguationForEvent:matchingOptions:withHighConfidence:](self, "_isMatchingMeaningDisambiguationForEvent:matchingOptions:withHighConfidence:", v10, v11, buf, v28, v29, v30, v31);
  BOOL v24 = 0;
  int v27 = buf[0];
  *a5 = buf[0];
  *a6 = v23;
  if (v26)
  {
    if (!v27
      && (v23 <= 30.0
       || self->_promoteToHighConfidenceBasedOnCategory
       || [(PGPublicEventCriteria *)self _promoteToHighConfidenceBasedOnEvent:v10]))
    {
      BOOL v24 = 1;
      *a5 = 1;
    }
    else
    {
      BOOL v24 = 1;
    }
  }
LABEL_13:

  return v24;
}

- (BOOL)_isMatchingMeaningDisambiguationForEvent:(id)a3 matchingOptions:(id)a4 withHighConfidence:(BOOL *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v52 = [v7 name];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v50 = self;
  uint64_t v9 = [(PGPublicEventCriteria *)self prohibitedCriteria];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v62 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        BOOL v15 = [v8 matchingCriteria];
        uint64_t v16 = [v15 matchingResultWithCriteria:v14];
        int v17 = [v16 isMatching];

        if (v17)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            long long v46 = [v14 identifier];
            *(_DWORD *)buf = 138478083;
            v67 = v52;
            __int16 v68 = 2114;
            v69 = v46;
            _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: is matching prohibited meaning %{public}@", buf, 0x16u);
          }
          BOOL v34 = 0;
          *a5 = 0;
          goto LABEL_44;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v61 objects:v73 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  double v18 = [(PGPublicEventCriteria *)v50 disambiguationCriteria];
  uint64_t v19 = [v18 count];
  BOOL v20 = v19 != 0;
  BOOL v48 = v19 != 0;
  if (v19)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v72 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      long long v49 = v18;
      id v47 = v7;
      BOOL v24 = MEMORY[0x1E4F14500];
      uint64_t v25 = *(void *)v58;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v58 != v25) {
            objc_enumerationMutation(v21);
          }
          int v27 = *(void **)(*((void *)&v57 + 1) + 8 * v26);
          uint64_t v28 = [v8 matchingCriteria];
          uint64_t v29 = [v28 matchingResultWithCriteria:v27];
          int v30 = [v29 isMatching];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            if (v30) {
              uint64_t v31 = &stru_1F283BC78;
            }
            else {
              uint64_t v31 = @"not ";
            }
            v32 = [v27 identifier];
            *(_DWORD *)buf = 138478339;
            v67 = v52;
            __int16 v68 = 2114;
            v69 = v31;
            __int16 v70 = 2114;
            v71 = v32;
            _os_log_debug_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: is %{public}@matching meaning %{public}@", buf, 0x20u);

            if (v30)
            {
LABEL_29:

              id v7 = v47;
              double v18 = v49;
              BOOL v20 = v48;
              goto LABEL_30;
            }
          }
          else if (v30)
          {
            goto LABEL_29;
          }
          ++v26;
        }
        while (v23 != v26);
        uint64_t v33 = [v21 countByEnumeratingWithState:&v57 objects:v72 count:16];
        uint64_t v23 = v33;
      }
      while (v33);
      BOOL v34 = 0;
      BOOL v20 = 0;
      id v7 = v47;
LABEL_40:
      double v18 = v49;
    }
    else
    {
      BOOL v34 = 0;
      BOOL v20 = 0;
    }
  }
  else
  {
LABEL_30:
    id v35 = v7;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v21 = [(PGPublicEventCriteria *)v50 highConfidenceCriteria];
    uint64_t v36 = [v21 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      long long v49 = v18;
      uint64_t v38 = *(void *)v54;
      while (2)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v21);
          }
          uint64_t v40 = *(void *)(*((void *)&v53 + 1) + 8 * j);
          uint64_t v41 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v42 = [v8 matchingCriteria];
          v43 = [v42 matchingResultWithCriteria:v40];
          char v44 = [v43 isMatching];

          if (v44)
          {
            BOOL v34 = 1;
            BOOL v20 = 1;
            id v7 = v35;
            goto LABEL_40;
          }
        }
        uint64_t v37 = [v21 countByEnumeratingWithState:&v53 objects:v65 count:16];
        BOOL v34 = 1;
        if (v37) {
          continue;
        }
        break;
      }
      id v7 = v35;
      double v18 = v49;
      BOOL v20 = v48;
    }
    else
    {
      BOOL v34 = 1;
    }
  }

  *a5 = v20;
LABEL_44:

  return v34;
}

- (BOOL)_hasSufficientTimeOverlapForEvent:(id)a3 matchingOptions:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PGPublicEventCriteria *)self minimumTimeAttendance];
  double v9 = v8;
  BOOL v10 = [(PGPublicEventCriteria *)self allowsExpandingTimeAttendance];
  uint64_t v11 = [v7 expandedAttendanceDateInterval];
  uint64_t v12 = [v7 actualAttendanceDateInterval];

  int64_t v13 = [v6 universalDateIntervalIncludingTime];
  if (v10) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v12;
  }
  id v15 = v14;
  double v16 = 0.0;
  if ([v13 intersectsDateInterval:v15])
  {
    [v12 duration];
    double v16 = v17;
  }
  if (v16 < v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [v6 name];
    BOOL v20 = [v13 startDate];
    id v21 = [v13 endDate];
    uint64_t v22 = [v12 startDate];
    uint64_t v23 = [v12 endDate];
    int v24 = 138479363;
    uint64_t v25 = v19;
    __int16 v26 = 2048;
    double v27 = v16;
    __int16 v28 = 2048;
    double v29 = v9;
    __int16 v30 = 2113;
    uint64_t v31 = v20;
    __int16 v32 = 2113;
    uint64_t v33 = v21;
    __int16 v34 = 2113;
    id v35 = v22;
    __int16 v36 = 2113;
    uint64_t v37 = v23;
    _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: absolute time overlap %.0f, minimum %.0f, eventInterval [%{private}@ - %{private}@], attendance [%{private}@ - %{private}@]", (uint8_t *)&v24, 0x48u);
  }
  return v16 >= v9;
}

@end