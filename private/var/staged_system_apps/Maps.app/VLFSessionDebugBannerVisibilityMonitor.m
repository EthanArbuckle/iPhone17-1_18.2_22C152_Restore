@interface VLFSessionDebugBannerVisibilityMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (VLFSessionDebugBannerVisibilityMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)updateState;
@end

@implementation VLFSessionDebugBannerVisibilityMonitor

+ (BOOL)isEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionDebugBannerVisibilityMonitorEnabledKey"];

  return v3;
}

- (VLFSessionDebugBannerVisibilityMonitor)initWithObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VLFSessionDebugBannerVisibilityMonitor;
  unsigned __int8 v3 = [(VLFSessionMonitor *)&v6 initWithObserver:a3];
  if (v3)
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    [v4 addObserver:v3 forKeyPath:@"VLFSessionDebugBannerVisibilityMonitorActiveKey" options:1 context:0];

    [(VLFSessionDebugBannerVisibilityMonitor *)v3 updateState];
  }
  return v3;
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"VLFSessionDebugBannerVisibilityMonitorActiveKey" context:0];

  v4.receiver = self;
  v4.super_class = (Class)VLFSessionDebugBannerVisibilityMonitor;
  [(VLFSessionDebugBannerVisibilityMonitor *)&v4 dealloc];
}

- (void)updateState
{
  unsigned __int8 v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"VLFSessionDebugBannerVisibilityMonitorActiveKey"];

  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }

  [(VLFSessionMonitor *)self setState:v5];
}

+ (BOOL)affectsPuckVisibility
{
  return 0;
}

+ (BOOL)affectsBannerVisibility
{
  return 1;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    unsigned int v4 = @"YES";
  }
  else {
    unsigned int v4 = @"NO";
  }
  uint64_t v5 = v4;
  objc_super v6 = +[NSUserDefaults standardUserDefaults];
  if ([v6 BOOLForKey:@"VLFSessionDebugBannerVisibilityMonitorActiveKey"]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = v7;
  int64_t v9 = [(VLFSessionMonitor *)self state];
  CFStringRef v10 = @"Hide";
  if (v9 == 1) {
    CFStringRef v10 = @"EnablePuck";
  }
  if (v9 == 2) {
    CFStringRef v10 = @"EnablePuckAndBanner";
  }
  v11 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, currentValue: %@, currentState: %@>", v3, v5, v8, v10];

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSUserDefaults standardUserDefaults];
  if (v13 != v11)
  {

LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)VLFSessionDebugBannerVisibilityMonitor;
    [(VLFSessionDebugBannerVisibilityMonitor *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_6;
  }
  unsigned int v14 = [v10 isEqualToString:@"VLFSessionDebugBannerVisibilityMonitorActiveKey"];

  if (!v14) {
    goto LABEL_5;
  }
  [(VLFSessionDebugBannerVisibilityMonitor *)self updateState];
LABEL_6:
}

@end