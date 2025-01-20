@interface MusicKit_SoftLinking_MPRestrictionsMonitor
+ (MusicKit_SoftLinking_MPRestrictionsMonitor)sharedRestrictionsMonitor;
+ (NSString)allowsExplicitContentDidChangeNotification;
+ (NSString)allowsMusicVideosDidChangeNotification;
- (BOOL)allowsDeletion;
- (BOOL)allowsExplicitContent;
- (BOOL)allowsMusicVideos;
- (id)_initWithUnderlyingRestrictionsMonitor:(id)a3;
- (void)_handleAllowsExplicitContentDidChangeNotification:(id)a3;
- (void)_handleAllowsMusicVideosDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation MusicKit_SoftLinking_MPRestrictionsMonitor

+ (MusicKit_SoftLinking_MPRestrictionsMonitor)sharedRestrictionsMonitor
{
  if (sharedRestrictionsMonitor_sOnceToken != -1) {
    dispatch_once(&sharedRestrictionsMonitor_sOnceToken, &__block_literal_global);
  }
  v2 = (void *)sharedRestrictionsMonitor_sSharedRestrictionsMonitor;
  return (MusicKit_SoftLinking_MPRestrictionsMonitor *)v2;
}

- (id)_initWithUnderlyingRestrictionsMonitor:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPRestrictionsMonitor;
  v6 = [(MusicKit_SoftLinking_MPRestrictionsMonitor *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingRestrictionsMonitor, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleAllowsExplicitContentDidChangeNotification_ name:v9 object:v7->_underlyingRestrictionsMonitor];

    v10 = getMPRestrictionsMonitorAllowsMusicVideosDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleAllowsMusicVideosDidChangeNotification_ name:v10 object:v7->_underlyingRestrictionsMonitor];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingRestrictionsMonitor];

  id v5 = getMPRestrictionsMonitorAllowsMusicVideosDidChangeNotification();
  [v3 removeObserver:self name:v5 object:self->_underlyingRestrictionsMonitor];

  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPRestrictionsMonitor;
  [(MusicKit_SoftLinking_MPRestrictionsMonitor *)&v6 dealloc];
}

- (BOOL)allowsDeletion
{
  return [(MPRestrictionsMonitor *)self->_underlyingRestrictionsMonitor allowsDeletion];
}

- (BOOL)allowsExplicitContent
{
  return [(MPRestrictionsMonitor *)self->_underlyingRestrictionsMonitor allowsExplicitContent];
}

- (BOOL)allowsMusicVideos
{
  return [(MPRestrictionsMonitor *)self->_underlyingRestrictionsMonitor allowsMusicVideos];
}

+ (NSString)allowsExplicitContentDidChangeNotification
{
  return (NSString *)@"MusicKit_SoftLinking_MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification";
}

+ (NSString)allowsMusicVideosDidChangeNotification
{
  return (NSString *)@"MusicKit_SoftLinking_MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification";
}

- (void)_handleAllowsExplicitContentDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  objc_super v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification" object:self userInfo:v6];
}

- (void)_handleAllowsMusicVideosDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  objc_super v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification" object:self userInfo:v6];
}

- (void).cxx_destruct
{
}

@end