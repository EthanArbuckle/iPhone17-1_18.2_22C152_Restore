@interface MNAnnouncementConflict
- (BOOL)announcementsAreSimilar;
- (MNAnnouncementPlanEvent)firstEvent;
- (MNAnnouncementPlanEvent)secondEvent;
- (double)desiredTimeGap;
- (double)timeGap;
- (id)description;
- (void)setAnnouncementsAreSimilar:(BOOL)a3;
- (void)setDesiredTimeGap:(double)a3;
- (void)setFirstEvent:(id)a3;
- (void)setSecondEvent:(id)a3;
- (void)setTimeGap:(double)a3;
@end

@implementation MNAnnouncementConflict

- (id)description
{
  v3 = NSString;
  if ([(MNAnnouncementConflict *)self announcementsAreSimilar]) {
    v4 = "similar";
  }
  else {
    v4 = "dissimilar";
  }
  [(MNAnnouncementConflict *)self timeGap];
  uint64_t v6 = v5;
  [(MNAnnouncementConflict *)self desiredTimeGap];
  uint64_t v8 = v7;
  v9 = [(MNAnnouncementConflict *)self firstEvent];
  v10 = [v9 event];
  v11 = [(MNAnnouncementConflict *)self secondEvent];
  v12 = [v11 event];
  v13 = [v3 stringWithFormat:@"%s announcements, time %.1f < %.1f\n  first %@\n  second %@", v4, v6, v8, v10, v12];

  return v13;
}

- (MNAnnouncementPlanEvent)firstEvent
{
  return self->_firstEvent;
}

- (void)setFirstEvent:(id)a3
{
}

- (MNAnnouncementPlanEvent)secondEvent
{
  return self->_secondEvent;
}

- (void)setSecondEvent:(id)a3
{
}

- (double)timeGap
{
  return self->_timeGap;
}

- (void)setTimeGap:(double)a3
{
  self->_timeGap = a3;
}

- (double)desiredTimeGap
{
  return self->_desiredTimeGap;
}

- (void)setDesiredTimeGap:(double)a3
{
  self->_desiredTimeGap = a3;
}

- (BOOL)announcementsAreSimilar
{
  return self->_announcementsAreSimilar;
}

- (void)setAnnouncementsAreSimilar:(BOOL)a3
{
  self->_announcementsAreSimilar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondEvent, 0);
  objc_storeStrong((id *)&self->_firstEvent, 0);
}

@end