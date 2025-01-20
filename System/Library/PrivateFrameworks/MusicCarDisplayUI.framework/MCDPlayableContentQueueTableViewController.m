@interface MCDPlayableContentQueueTableViewController
- (MCDPlayableContentPlaybackManager)contentManager;
- (MCDPlayableContentQueueTableViewController)initWithContentManager:(id)a3;
- (void)setContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDPlayableContentQueueTableViewController

- (MCDPlayableContentQueueTableViewController)initWithContentManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDPlayableContentQueueTableViewController;
  v6 = [(MCDPlayableContentQueueTableViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentManager, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MCDPlayableContentQueueTableViewController;
  [(MCDPlayableContentQueueTableViewController *)&v6 viewDidLoad];
  v3 = MCDCarDisplayBundle();
  v4 = [v3 localizedStringForKey:@"PLAYBACK_QUEUE_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  [(MCDPlayableContentQueueTableViewController *)self setTitle:v4];

  id v5 = [(MCDPlayableContentQueueTableViewController *)self tableView];
  [(_MCDNowPlayingContentManager *)self->_contentManager setTableView:v5];
}

- (MCDPlayableContentPlaybackManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end