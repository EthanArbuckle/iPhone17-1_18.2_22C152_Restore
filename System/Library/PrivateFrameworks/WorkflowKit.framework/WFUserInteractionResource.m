@interface WFUserInteractionResource
+ (BOOL)isSingleton;
- (WFUserInteractionResource)initWithDefinition:(id)a3;
- (void)dealloc;
- (void)refreshAvailability;
@end

@implementation WFUserInteractionResource

- (void)refreshAvailability
{
  id v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", [v3 applicationState] == 0, 0);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  [v3 removeApplicationStateObserver:self forEvent:0];
  [v3 removeApplicationStateObserver:self forEvent:1];

  v4.receiver = self;
  v4.super_class = (Class)WFUserInteractionResource;
  [(WFResource *)&v4 dealloc];
}

- (WFUserInteractionResource)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFUserInteractionResource;
  id v3 = [(WFResource *)&v7 initWithDefinition:a3];
  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4F5A7A0] sharedContext];
    [v4 addApplicationStateObserver:v3 forEvent:0];
    [v4 addApplicationStateObserver:v3 forEvent:1];
    v5 = v3;
  }
  return v3;
}

+ (BOOL)isSingleton
{
  return 1;
}

@end