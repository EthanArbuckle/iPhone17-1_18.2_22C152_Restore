@interface PresentFlyoverAction
- (PresentFlyoverAction)initWithAnnouncement:(id)a3 muid:(unint64_t)a4;
- (int)analyticsLaunchActionType;
- (unint64_t)muid;
- (void)resolveFlyoverWithCompletion:(id)a3;
- (void)setMuid:(unint64_t)a3;
@end

@implementation PresentFlyoverAction

- (PresentFlyoverAction)initWithAnnouncement:(id)a3 muid:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PresentFlyoverAction;
  result = [(PresentAnnouncementAction *)&v6 initWithAnnouncement:a3];
  if (result) {
    result->_muid = a4;
  }
  return result;
}

- (void)resolveFlyoverWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PresentAnnouncementAction *)self announcement];
  objc_super v6 = [v5 userMessage];

  unint64_t v7 = [(PresentFlyoverAction *)self muid];
  id v8 = objc_alloc((Class)MKMapItemIdentifier);
  id v9 = [v8 initWithMUID:v7 resultProviderID:0 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];
  if (v9)
  {
    v10 = +[MKMapService sharedService];
    id v17 = v9;
    v11 = +[NSArray arrayWithObjects:&v17 count:1];
    v12 = [v10 ticketForIdentifiers:v11 traits:0];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1008CAD68;
    v13[3] = &unk_1012FF9F8;
    id v14 = v6;
    unint64_t v16 = v7;
    id v15 = v4;
    [v12 submitWithHandler:v13 networkActivity:0];
  }
}

- (int)analyticsLaunchActionType
{
  return 16;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

@end