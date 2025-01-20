@interface WFURLOpenResource
+ (BOOL)isSingleton;
- (WFURLOpenResource)initWithDefinition:(id)a3;
- (void)dealloc;
- (void)refreshAvailability;
@end

@implementation WFURLOpenResource

- (void)refreshAvailability
{
  id v3 = +[WFResource sharedInstance];
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", [v3 isAvailable], 0);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = +[WFResource sharedInstance];
  [v3 removeObserver:self name:@"WFResourceAvailabilityChangedNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)WFURLOpenResource;
  [(WFResource *)&v5 dealloc];
}

- (WFURLOpenResource)initWithDefinition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFURLOpenResource;
  id v3 = [(WFResource *)&v8 initWithDefinition:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v5 = +[WFResource sharedInstance];
    [v4 addObserver:v3 selector:sel_refreshAvailabilityWithNotification name:@"WFResourceAvailabilityChangedNotification" object:v5];

    v6 = v3;
  }

  return v3;
}

+ (BOOL)isSingleton
{
  return 1;
}

@end