@interface MNAnnouncementPlanEvent
- (BOOL)includeInPlan;
- (GEOComposedGuidanceEvent)event;
- (MNAnnouncementPlanEvent)initWithEvent:(id)a3 distance:(double)a4 speed:(double)a5 durations:(id)a6;
- (NSArray)durations;
- (double)completionDistance;
- (double)distance;
- (double)speed;
- (double)triggerDistance;
- (id)description;
- (unint64_t)variantIndex;
- (void)setAnnouncementDurations:(id)a3;
- (void)setDistance:(double)a3;
- (void)setDurations:(id)a3;
- (void)setEvent:(id)a3;
- (void)setIncludeInPlan:(BOOL)a3;
- (void)setSpeed:(double)a3;
- (void)setTriggerDistance:(double)a3;
- (void)setVariantIndex:(unint64_t)a3;
@end

@implementation MNAnnouncementPlanEvent

- (MNAnnouncementPlanEvent)initWithEvent:(id)a3 distance:(double)a4 speed:(double)a5 durations:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MNAnnouncementPlanEvent;
  v12 = [(MNAnnouncementPlanEvent *)&v19 init];
  v13 = v12;
  if (v12)
  {
    [(MNAnnouncementPlanEvent *)v12 setEvent:v10];
    [(MNAnnouncementPlanEvent *)v13 setDistance:a4];
    [(MNAnnouncementPlanEvent *)v13 setSpeed:a5];
    [(MNAnnouncementPlanEvent *)v13 setDurations:v11];
    [(MNAnnouncementPlanEvent *)v13 setVariantIndex:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__MNAnnouncementPlanEvent_initWithEvent_distance_speed_durations___block_invoke;
    v17[3] = &unk_1E60F6F20;
    v14 = v13;
    v18 = v14;
    [v10 triggerDistanceForSpeed:v17 andDuration:a5];
    -[MNAnnouncementPlanEvent setTriggerDistance:](v14, "setTriggerDistance:");
    [(MNAnnouncementPlanEvent *)v14 triggerDistance];
    [(MNAnnouncementPlanEvent *)v14 setIncludeInPlan:v15 > 0.0];
  }
  return v13;
}

double __66__MNAnnouncementPlanEvent_initWithEvent_distance_speed_durations___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) durations];
  v2 = [v1 objectAtIndexedSubscript:0];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)description
{
  double v3 = NSString;
  BOOL v4 = [(MNAnnouncementPlanEvent *)self includeInPlan];
  unint64_t v5 = [(MNAnnouncementPlanEvent *)self variantIndex];
  [(MNAnnouncementPlanEvent *)self triggerDistance];
  double v6 = -1.0;
  if (v7 > 0.0)
  {
    [(MNAnnouncementPlanEvent *)self triggerDistance];
    double v6 = v8;
  }
  if (v4) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  [(MNAnnouncementPlanEvent *)self completionDistance];
  uint64_t v11 = v10;
  v12 = [(MNAnnouncementPlanEvent *)self event];
  v13 = [v12 description];
  v14 = [v3 stringWithFormat:@"in plan:%s variant:%lu trigger:%.2f complete:%.2f %@", v9, v5, *(void *)&v6, v11, v13];

  return v14;
}

- (void)setTriggerDistance:(double)a3
{
  [(MNAnnouncementPlanEvent *)self triggerDistance];
  if (v5 != a3) {
    self->_triggerDistance = a3;
  }
}

- (void)setVariantIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v5 = [(MNAnnouncementPlanEvent *)self event];
  double v6 = [v5 announcements];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    double v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      uint64_t v10 = "-[MNAnnouncementPlanEvent setVariantIndex:]";
      __int16 v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Guidance/MNAnnouncementPlanEvent.m";
      __int16 v13 = 1024;
      int v14 = 73;
      __int16 v15 = 2080;
      v16 = "variantIndex < self.event.announcements.count";
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v9, 0x26u);
    }
  }
  self->_variantIndex = a3;
}

- (double)completionDistance
{
  [(MNAnnouncementPlanEvent *)self triggerDistance];
  double v4 = v3;
  double v5 = [(MNAnnouncementPlanEvent *)self announcementDurations];
  double v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[MNAnnouncementPlanEvent variantIndex](self, "variantIndex"));
  [v6 doubleValue];
  double v8 = v7;
  [(MNAnnouncementPlanEvent *)self speed];
  double v10 = v4 - v8 * v9;

  return v10;
}

- (GEOComposedGuidanceEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void)setAnnouncementDurations:(id)a3
{
}

- (BOOL)includeInPlan
{
  return self->_includeInPlan;
}

- (void)setIncludeInPlan:(BOOL)a3
{
  self->_includeInPlan = a3;
}

- (unint64_t)variantIndex
{
  return self->_variantIndex;
}

- (double)triggerDistance
{
  return self->_triggerDistance;
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

- (NSArray)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_announcementDurations, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end