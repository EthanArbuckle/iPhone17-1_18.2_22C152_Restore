@interface MNAnnouncementEngine
- (BOOL)_advanceToResolveConflict:(id)a3;
- (BOOL)_compressToResolveConflict:(id)a3;
- (BOOL)_delayToResolveConflict:(id)a3;
- (MNAnnouncementPlan)plan;
- (double)_canAdvanceEvent:(id)a3;
- (double)_canDelayEvent:(id)a3;
- (id)nextEvent;
- (void)_dropToResolveConflict:(id)a3;
- (void)planForEvents:(id)a3 distance:(double)a4 speed:(double)a5 previousEvent:(id)a6 timeSinceLastEvent:(double)a7 durations:(id)a8;
- (void)setPlan:(id)a3;
@end

@implementation MNAnnouncementEngine

- (void)planForEvents:(id)a3 distance:(double)a4 speed:(double)a5 previousEvent:(id)a6 timeSinceLastEvent:(double)a7 durations:(id)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = a8;
  objc_storeStrong((id *)&self->_events, a3);
  self->_distance = a4;
  self->_speed = a5;
  objc_storeStrong((id *)&self->_durations, a8);
  v18 = [[MNAnnouncementPlan alloc] initWithEvents:v15 distance:v17 speed:a4 durations:a5];
  [(MNAnnouncementEngine *)self setPlan:v18];

  if (v16)
  {
    v19 = [(MNAnnouncementEngine *)self plan];
    v20 = [v19 plannedEvents];
    uint64_t v21 = [v20 count];

    if (a7 > 0.0)
    {
      if (v21)
      {
        v22 = [(MNAnnouncementEngine *)self plan];
        v23 = [v22 plannedEvents];
        v24 = [v23 firstObject];

        +[MNAnnouncementPlan desiredTimeGapBetweenEvent:v16 andEvent:v24];
        if (v25 > a7)
        {
          double v31 = v25;
          [(MNAnnouncementEngine *)self _canDelayEvent:v24];
          double v33 = v32;
          [v24 setTriggerDistance:0.0];
          v34 = GetAudioLogForMNAnnouncementEngineCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            double v35 = v31 - a7;
            if (v31 - a7 >= v33) {
              double v35 = v33;
            }
            int v36 = 134218243;
            double v37 = v35;
            __int16 v38 = 2113;
            v39 = v24;
            _os_log_impl(&dword_1B542B000, v34, OS_LOG_TYPE_DEBUG, "ⓐ Delaying event %.2f seconds due to recent announcement: %{private}@", (uint8_t *)&v36, 0x16u);
          }

LABEL_24:
          goto LABEL_25;
        }
      }
    }
  }
  v26 = [(MNAnnouncementEngine *)self plan];
  v27 = [v26 nextConflict];

  if (v27)
  {
    uint64_t v28 = -100;
    do
    {
      if (!v28)
      {

        goto LABEL_17;
      }
      if (![(MNAnnouncementEngine *)self _advanceToResolveConflict:v27]
        || ![(MNAnnouncementEngine *)self _delayToResolveConflict:v27]
        || ![(MNAnnouncementEngine *)self _compressToResolveConflict:v27])
      {
        [(MNAnnouncementEngine *)self _dropToResolveConflict:v27];
      }
      v29 = [(MNAnnouncementEngine *)self plan];
      uint64_t v30 = [v29 nextConflict];

      ++v28;
      v27 = (void *)v30;
    }
    while (v30);
    if (v28) {
      goto LABEL_25;
    }
LABEL_17:
    v24 = GetAudioLogForMNAnnouncementEngineCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_ERROR, "⒜ Infinite loop in resolving guidance event conflicts", (uint8_t *)&v36, 2u);
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (id)nextEvent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(MNAnnouncementEngine *)self plan];
  v4 = [v3 plannedEvents];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 includeInPlan])
        {
          double distance = self->_distance;
          [v9 triggerDistance];
          if (distance <= v11)
          {
            id v12 = v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)_advanceToResolveConflict:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 announcementsAreSimilar])
  {
    BOOL v5 = 0;
  }
  else
  {
    [v4 desiredTimeGap];
    double v7 = v6;
    [v4 timeGap];
    double v9 = v7 - v8 + 1.0;
    v10 = [v4 firstEvent];
    [(MNAnnouncementEngine *)self _canAdvanceEvent:v10];
    double v12 = v11;

    if (v9 >= v12) {
      double v13 = v12;
    }
    else {
      double v13 = v9;
    }
    if (v13 > 0.0)
    {
      double speed = self->_speed;
      double v15 = v12 * speed;
      double v16 = v13 * (speed + 5.0);
      if (v15 >= v16) {
        double v17 = v16;
      }
      else {
        double v17 = v15;
      }
      v18 = [v4 firstEvent];
      [v18 triggerDistance];
      [v18 setTriggerDistance:v19 + v17];

      v20 = GetAudioLogForMNAnnouncementEngineCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = [v4 firstEvent];
        int v23 = 134218243;
        double v24 = v13;
        __int16 v25 = 2113;
        v26 = v21;
        _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEBUG, "ⓐ Advancing first event %.2f seconds : %{private}@", (uint8_t *)&v23, 0x16u);
      }
    }
    BOOL v5 = v12 >= v9;
  }

  return v5;
}

- (double)_canAdvanceEvent:(id)a3
{
  id v4 = a3;
  double distance = self->_distance;
  double v6 = [v4 event];
  [v6 startValidDistance];
  double v8 = v7;

  if (distance < v8) {
    double v8 = distance;
  }
  [v4 triggerDistance];
  double v10 = (v8 - v9) / self->_speed;
  double v11 = [(MNAnnouncementEngine *)self plan];
  double v12 = [v11 plannedEvents];
  uint64_t v13 = [v12 indexOfObject:v4];

  if (v13 >= 1)
  {
    uint64_t v14 = v13 + 1;
    while (1)
    {
      double v15 = [(MNAnnouncementEngine *)self plan];
      double v16 = [v15 plannedEvents];
      double v17 = [v16 objectAtIndexedSubscript:v14 - 2];

      if ([v17 includeInPlan])
      {
        v18 = [v17 event];
        double v19 = [v18 announcements];
        uint64_t v20 = [v19 count];

        if (v20) {
          break;
        }
      }

      if ((unint64_t)--v14 <= 1) {
        goto LABEL_13;
      }
    }
    if (v17)
    {
      [v17 completionDistance];
      double v22 = v21;
      [v4 triggerDistance];
      double v24 = (v22 - v23) / self->_speed;
      +[MNAnnouncementPlan desiredTimeGapBetweenEvent:v17 andEvent:v4];
      double v26 = v24 - v25;
      if (v26 < v10) {
        double v10 = v26;
      }
    }
  }
LABEL_13:

  return fmax(v10, 0.0);
}

- (BOOL)_delayToResolveConflict:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 announcementsAreSimilar])
  {
    BOOL v5 = 0;
  }
  else
  {
    double v6 = [v4 firstEvent];
    double v7 = [v6 event];
    [v7 startValidDistance];
    double v9 = v8;
    double v10 = [v4 firstEvent];
    double v11 = [v10 event];
    [v11 endValidDistance];
    double v13 = v9 - v12;

    uint64_t v14 = [v4 secondEvent];
    double v15 = [v14 event];
    [v15 startValidDistance];
    double v17 = v16;
    v18 = [v4 secondEvent];
    double v19 = [v18 event];
    [v19 endValidDistance];
    double v21 = v17 - v20;

    if (v13 <= v21 + 300.0) {
      goto LABEL_9;
    }
    double v22 = [v4 secondEvent];
    double v23 = [v22 announcementDurations];
    double v24 = [v23 objectAtIndexedSubscript:0];
    [v24 doubleValue];
    double v26 = v25;

    uint64_t v27 = [v4 secondEvent];
    [v27 triggerDistance];
    double v29 = v28;
    uint64_t v30 = [v4 firstEvent];
    [v30 triggerDistance];
    double v32 = (v29 - v31) * self->_speed;

    [v4 desiredTimeGap];
    double v34 = v26 + v32 + v33;
    double v35 = [v4 secondEvent];
    [v35 setIncludeInPlan:0];

    int v36 = [v4 firstEvent];
    [(MNAnnouncementEngine *)self _canDelayEvent:v36];
    double v38 = v37;

    v39 = [v4 secondEvent];
    [v39 setIncludeInPlan:1];

    if (v34 <= 0.0 || v38 < v34)
    {
LABEL_9:
      [v4 desiredTimeGap];
      double v42 = v41;
      [v4 timeGap];
      double v44 = v42 - v43;
      v45 = [v4 secondEvent];
      [(MNAnnouncementEngine *)self _canDelayEvent:v45];
      double v47 = v46;

      if (v44 >= v47) {
        double v48 = v47;
      }
      else {
        double v48 = v44;
      }
      if (v48 > 0.0)
      {
        v49 = [v4 secondEvent];
        double speed = self->_speed;
        [v49 triggerDistance];
        [v49 setTriggerDistance:v51 - v48 * speed];

        v52 = GetAudioLogForMNAnnouncementEngineCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          v53 = [v4 secondEvent];
          int v62 = 134218243;
          double v63 = v48;
          __int16 v64 = 2113;
          v65 = v53;
          _os_log_impl(&dword_1B542B000, v52, OS_LOG_TYPE_DEBUG, "ⓐ Delaying second event %.2f seconds : %{private}@", (uint8_t *)&v62, 0x16u);
        }
      }
      BOOL v5 = v47 >= v44;
    }
    else
    {
      v54 = [v4 firstEvent];
      double v55 = self->_speed;
      [v54 triggerDistance];
      [v54 setTriggerDistance:v56 - v34 * v55];

      v57 = [(MNAnnouncementEngine *)self plan];
      [v57 sortEvents];

      v58 = GetAudioLogForMNAnnouncementEngineCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v60 = [v4 firstEvent];
        int v62 = 134218243;
        double v63 = v34;
        __int16 v64 = 2113;
        v65 = v60;
        _os_log_impl(&dword_1B542B000, v58, OS_LOG_TYPE_DEBUG, "ⓐ Delaying first event %.2f seconds : %{private}@", (uint8_t *)&v62, 0x16u);
      }
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (double)_canDelayEvent:(id)a3
{
  id v4 = a3;
  [v4 completionDistance];
  double v6 = v5;
  double v7 = [v4 event];
  [v7 endValidDistance];
  double v9 = v6 - v8;

  double v10 = v9 / self->_speed;
  double v11 = [(MNAnnouncementEngine *)self plan];
  double v12 = [v11 plannedEvents];
  uint64_t v13 = [v12 indexOfObject:v4];

  for (unint64_t i = v13 + 1; ; ++i)
  {
    double v15 = [(MNAnnouncementEngine *)self plan];
    double v16 = [v15 plannedEvents];
    unint64_t v17 = [v16 count];

    if (i >= v17) {
      break;
    }
    v18 = [(MNAnnouncementEngine *)self plan];
    double v19 = [v18 plannedEvents];
    double v20 = [v19 objectAtIndexedSubscript:i];

    if ([v20 includeInPlan])
    {
      double v21 = [v20 event];
      double v22 = [v21 announcements];
      uint64_t v23 = [v22 count];

      if (v23)
      {
        if (v20)
        {
          [v4 completionDistance];
          double v25 = v24;
          [v20 triggerDistance];
          double v27 = (v25 - v26) / self->_speed;
          +[MNAnnouncementPlan desiredTimeGapBetweenEvent:v4 andEvent:v20];
          double v29 = v27 - v28;
          if (v29 < v10) {
            double v10 = v29;
          }
        }
        break;
      }
    }
  }
  return fmax(v10, 0.0);
}

- (BOOL)_compressToResolveConflict:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 announcementsAreSimilar])
  {
    BOOL v5 = 0;
    goto LABEL_24;
  }
  [v4 desiredTimeGap];
  double v7 = v6;
  [v4 timeGap];
  double v9 = v7 - v8;
  double v10 = [v4 firstEvent];
  double v11 = [v4 secondEvent];
  double v12 = [v11 event];
  [v12 triggerDistanceForSpeed:&__block_literal_global_3 andDuration:self->_speed];
  double v14 = v13;
  double v15 = [v11 event];
  [v15 triggerDistanceForSpeed:&__block_literal_global_6 andDuration:self->_speed];
  double v17 = v16;

  double v19 = 0.0;
  if (v9 <= 0.0) {
    goto LABEL_23;
  }
  *(void *)&long long v18 = 138477827;
  long long v61 = v18;
  while (1)
  {
    id v20 = v10;
    double v21 = v20;
    if (v14 >= v17) {
      goto LABEL_17;
    }
    uint64_t v22 = [v20 variantIndex] + 1;
    uint64_t v23 = [v21 announcementDurations];
    uint64_t v24 = [v23 count];

    if (v22 == v24)
    {
LABEL_7:
      id v25 = v11;

      double v21 = v25;
      goto LABEL_17;
    }
    uint64_t v26 = [v11 variantIndex] + 1;
    double v27 = [v11 announcementDurations];
    uint64_t v28 = [v27 count];

    if (v26 != v28)
    {
      double v29 = 1.0;
      double v30 = 1.0;
      if ([v21 variantIndex])
      {
        double v31 = [v21 announcementDurations];
        double v32 = objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v21, "variantIndex"));
        [v32 doubleValue];
        double v34 = v33;
        double v35 = [v21 announcementDurations];
        int v36 = [v35 objectAtIndexedSubscript:0];
        [v36 doubleValue];
        double v30 = v34 / v37;
      }
      if (objc_msgSend(v11, "variantIndex", v61))
      {
        double v38 = [v11 announcementDurations];
        v39 = objc_msgSend(v38, "objectAtIndexedSubscript:", objc_msgSend(v11, "variantIndex"));
        [v39 doubleValue];
        double v41 = v40;
        double v42 = [v11 announcementDurations];
        double v43 = [v42 objectAtIndexedSubscript:0];
        [v43 doubleValue];
        double v29 = v41 / v44;
      }
      if (v30 == v29)
      {
        v45 = [v21 event];
        double v46 = [v11 event];
        uint64_t v47 = [v45 comparePriority:v46];

        if (v47 == -1) {
          goto LABEL_7;
        }
      }
      else if (v30 < v29)
      {
        goto LABEL_7;
      }
    }
LABEL_17:
    unint64_t v48 = objc_msgSend(v21, "variantIndex", v61) + 1;
    v49 = [v21 announcementDurations];
    unint64_t v50 = [v49 count];

    if (v48 >= v50) {
      break;
    }
    double v51 = [v21 announcementDurations];
    v52 = objc_msgSend(v51, "objectAtIndexedSubscript:", objc_msgSend(v21, "variantIndex"));
    [v52 doubleValue];
    double v54 = v53;
    double v55 = [v21 announcementDurations];
    double v56 = objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v21, "variantIndex") + 1);
    [v56 doubleValue];
    double v58 = v57;

    objc_msgSend(v21, "setVariantIndex:", objc_msgSend(v21, "variantIndex") + 1);
    v59 = GetAudioLogForMNAnnouncementEngineCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v61;
      double v63 = v21;
      _os_log_impl(&dword_1B542B000, v59, OS_LOG_TYPE_DEBUG, "ⓐ Compressing event : %{private}@", buf, 0xCu);
    }
    double v19 = v19 + v54 - v58;

    if (v19 >= v9) {
      goto LABEL_23;
    }
  }

LABEL_23:
  BOOL v5 = v19 >= v9;

LABEL_24:
  return v5;
}

double __51__MNAnnouncementEngine__compressToResolveConflict___block_invoke()
{
  return 1.0;
}

double __51__MNAnnouncementEngine__compressToResolveConflict___block_invoke_2()
{
  return 10.0;
}

- (void)_dropToResolveConflict:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 firstEvent];
  double v6 = [v4 secondEvent];
  double v7 = GetAudioLogForMNAnnouncementEngineCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double v8 = [v4 firstEvent];
    double v9 = [v4 secondEvent];
    *(_DWORD *)buf = 138478083;
    uint64_t v28 = v8;
    __int16 v29 = 2113;
    double v30 = v9;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "ⓐ Comparing events : %{private}@, %{private}@", buf, 0x16u);
  }
  double v10 = [v4 firstEvent];
  double v11 = [v10 event];
  double v12 = [v4 secondEvent];
  double v13 = [v12 event];
  uint64_t v14 = [v11 comparePriority:v13];

  if (v14 == -1)
  {
    uint64_t v15 = [v4 secondEvent];

    uint64_t v16 = [v4 firstEvent];

    double v6 = (void *)v16;
    BOOL v5 = (void *)v15;
  }
  [v5 setIncludeInPlan:0];
  [v6 setVariantIndex:0];
  double v17 = [v6 event];
  double speed = self->_speed;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __47__MNAnnouncementEngine__dropToResolveConflict___block_invoke;
  uint64_t v24 = &unk_1E60F65E8;
  id v25 = self;
  id v19 = v6;
  id v26 = v19;
  [v17 triggerDistanceForSpeed:&v21 andDuration:speed];
  objc_msgSend(v19, "setTriggerDistance:", v21, v22, v23, v24, v25);

  id v20 = GetAudioLogForMNAnnouncementEngineCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v28 = v5;
    _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEBUG, "ⓐ Dropping event : %{private}@", buf, 0xCu);
  }
}

double __47__MNAnnouncementEngine__dropToResolveConflict___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  v2 = [*(id *)(a1 + 40) event];
  v3 = [v2 uniqueID];
  id v4 = [v1 objectForKeyedSubscript:v3];

  BOOL v5 = [v4 objectAtIndexedSubscript:0];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (MNAnnouncementPlan)plan
{
  return self->_plan;
}

- (void)setPlan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end