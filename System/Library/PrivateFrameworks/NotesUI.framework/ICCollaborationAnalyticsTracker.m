@interface ICCollaborationAnalyticsTracker
- (ICCollaborationAnalyticsTracker)initWithDelegate:(id)a3;
- (ICCollaborationAnalyticsTrackerInternal)collaborationAnalyticsTracker;
- (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7;
- (void)saveNewShare:(id)a3 forNote:(id)a4;
- (void)setCollaborationAnalyticsTracker:(id)a3;
- (void)trackShare:(id)a3 forNote:(id)a4;
- (void)unshareNote:(id)a3;
@end

@implementation ICCollaborationAnalyticsTracker

- (ICCollaborationAnalyticsTracker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCollaborationAnalyticsTracker;
  v5 = [(ICCollaborationAnalyticsTracker *)&v9 init];
  if (v5)
  {
    v6 = [[ICCollaborationAnalyticsTrackerInternal alloc] initWithDelegate:v4];
    collaborationAnalyticsTracker = v5->_collaborationAnalyticsTracker;
    v5->_collaborationAnalyticsTracker = v6;
  }
  return v5;
}

- (void)trackShare:(id)a3 forNote:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCollaborationAnalyticsTracker *)self collaborationAnalyticsTracker];
  [v8 trackShare:v7 forNote:v6];
}

- (void)saveNewShare:(id)a3 forNote:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCollaborationAnalyticsTracker *)self collaborationAnalyticsTracker];
  [v8 saveNewShare:v7 forNote:v6];
}

- (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = [(ICCollaborationAnalyticsTracker *)self collaborationAnalyticsTracker];
  [v15 saveActivityType:v14 isCollaborationSelected:v9 error:v13 completed:v7 forNote:v12];
}

- (void)unshareNote:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCollaborationAnalyticsTracker *)self collaborationAnalyticsTracker];
  [v5 unshareNote:v4];
}

- (ICCollaborationAnalyticsTrackerInternal)collaborationAnalyticsTracker
{
  return self->_collaborationAnalyticsTracker;
}

- (void)setCollaborationAnalyticsTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end