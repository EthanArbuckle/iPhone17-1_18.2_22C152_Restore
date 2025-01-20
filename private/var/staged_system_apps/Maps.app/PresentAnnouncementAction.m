@interface PresentAnnouncementAction
- (GEOAnnouncement)announcement;
- (PresentAnnouncementAction)initWithAnnouncement:(id)a3;
- (int)analyticsLaunchActionType;
- (void)setAnnouncement:(id)a3;
@end

@implementation PresentAnnouncementAction

- (PresentAnnouncementAction)initWithAnnouncement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentAnnouncementAction;
  v6 = [(PresentAnnouncementAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_announcement, a3);
  }

  return v7;
}

- (int)analyticsLaunchActionType
{
  return 15;
}

- (GEOAnnouncement)announcement
{
  return self->_announcement;
}

- (void)setAnnouncement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end