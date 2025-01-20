@interface PresentTableBookingAction
- (BOOL)isCompatibleWithRestorationTask;
- (MKMapItem)mapItem;
- (PresentTableBookingAction)initWithMapItem:(id)a3;
- (int)analyticsLaunchActionType;
- (void)setMapItem:(id)a3;
@end

@implementation PresentTableBookingAction

- (PresentTableBookingAction)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PresentTableBookingAction;
  v6 = [(PresentTableBookingAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 22;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end