@interface MNAnnouncementPlan
+ (double)desiredTimeGapBetweenEvent:(id)a3 andEvent:(id)a4;
- (MNAnnouncementPlan)initWithEvents:(id)a3 distance:(double)a4 speed:(double)a5 durations:(id)a6;
- (NSArray)events;
- (NSMutableArray)plannedEvents;
- (double)distance;
- (double)speed;
- (id)description;
- (id)nextConflict;
- (void)setDistance:(double)a3;
- (void)setEvents:(id)a3;
- (void)setPlannedEvents:(id)a3;
- (void)setSpeed:(double)a3;
- (void)sortEvents;
@end

@implementation MNAnnouncementPlan

- (MNAnnouncementPlan)initWithEvents:(id)a3 distance:(double)a4 speed:(double)a5 durations:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MNAnnouncementPlan;
  v13 = [(MNAnnouncementPlan *)&v32 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_events, a3);
    v14->_distance = a4;
    v14->_speed = a5;
    v27 = v14;
    v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "uniqueID", v27);
          v23 = [v12 objectForKeyedSubscript:v22];

          v24 = [[MNAnnouncementPlanEvent alloc] initWithEvent:v21 distance:v23 speed:a4 durations:a5];
          if (v24) {
            [(NSMutableArray *)v15 addObject:v24];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v18);
    }

    v14 = v27;
    plannedEvents = v27->_plannedEvents;
    v27->_plannedEvents = v15;

    [(MNAnnouncementPlan *)v27 sortEvents];
  }

  return v14;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [(MNAnnouncementPlan *)self plannedEvents];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"%d events", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(MNAnnouncementPlan *)self plannedEvents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      id v11 = v5;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = [NSString stringWithFormat:@"\n  %@", *(void *)(*((void *)&v14 + 1) + 8 * v10)];
        v5 = [v11 stringByAppendingString:v12];

        ++v10;
        id v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)nextConflict
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [(MNAnnouncementPlan *)self plannedEvents];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v9 includeInPlan])
        {
          if (v6)
          {
            [v6 completionDistance];
            double v11 = v10;
            [v9 triggerDistance];
            double v13 = v11 - v12;
            [(MNAnnouncementPlan *)self speed];
            double v15 = v13 / v14;
            +[MNAnnouncementPlan desiredTimeGapBetweenEvent:v6 andEvent:v9];
            if (v15 < v16)
            {
              double v18 = v16;
              uint64_t v19 = objc_alloc_init(MNAnnouncementConflict);
              [(MNAnnouncementConflict *)v19 setFirstEvent:v6];
              [(MNAnnouncementConflict *)v19 setSecondEvent:v9];
              [(MNAnnouncementConflict *)v19 setTimeGap:v15];
              [(MNAnnouncementConflict *)v19 setDesiredTimeGap:v18];
              [(MNAnnouncementConflict *)v19 setAnnouncementsAreSimilar:v18 > 0.0];
              v20 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                v21 = [v9 event];
                int v22 = [v21 stepIndex];
                *(_DWORD *)buf = 67109378;
                int v29 = v22;
                __int16 v30 = 2112;
                long long v31 = v19;
                _os_log_impl(&dword_1B542B000, v20, OS_LOG_TYPE_DEBUG, "found announcement conflict in step %d: %@", buf, 0x12u);
              }
              goto LABEL_18;
            }
          }
          id v17 = v9;

          v6 = v17;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    v6 = 0;
  }
  uint64_t v19 = 0;
LABEL_18:

  return v19;
}

- (void)sortEvents
{
}

uint64_t __32__MNAnnouncementPlan_sortEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 triggerDistance];
  double v7 = v6;
  [v5 triggerDistance];
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 triggerDistance];
    double v11 = v10;
    [v5 triggerDistance];
    if (v11 <= v12) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
  }

  return v9;
}

+ (double)desiredTimeGapBetweenEvent:(id)a3 andEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 variantIndex];
  double v8 = [v6 event];
  BOOL v9 = v7 < [v8 numChainedAnnouncements];

  double v10 = [v6 event];

  double v11 = [v5 event];

  [v10 desiredTimeGapToEvent:v11 chained:v9];
  double v13 = v12;

  return v13;
}

- (NSMutableArray)plannedEvents
{
  return self->_plannedEvents;
}

- (void)setPlannedEvents:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_plannedEvents, 0);
}

@end