@interface ResolveMUIDAction
- (BOOL)isCompatibleWithRestorationTask;
- (NSString)businessID;
- (NSString)contentProvider;
- (ResolveMUIDAction)initWithBusinessID:(id)a3 contentProvider:(id)a4;
- (int)analyticsLaunchActionType;
- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4;
- (void)setBusinessID:(id)a3;
- (void)setContentProvider:(id)a3;
@end

@implementation ResolveMUIDAction

- (ResolveMUIDAction)initWithBusinessID:(id)a3 contentProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ResolveMUIDAction;
  v9 = [(ResolveMUIDAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_businessID, a3);
    objc_storeStrong((id *)&v10->_contentProvider, a4);
  }

  return v10;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ResolveMUIDAction *)self businessID];

  if (v8)
  {
    id v9 = objc_alloc((Class)MKMapItemIdentifier);
    v10 = [(ResolveMUIDAction *)self businessID];
    id v11 = [v10 longLongValue];
    id v12 = [v9 initWithMUID:v11 resultProviderID:0 coordinate:MKCoordinateInvalid[0] MKCoordinateInvalid[1]];

    if (v12)
    {
      v13 = +[MKMapService sharedService];
      id v19 = v12;
      v14 = +[NSArray arrayWithObjects:&v19 count:1];
      v15 = [(ResolveMUIDAction *)self contentProvider];
      v16 = [v13 ticketForIdentifiers:v14 resultProviderID:0 contentProvider:v15 traits:v6];

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100D1897C;
      v17[3] = &unk_1012E7710;
      id v18 = v7;
      [v16 submitWithHandler:v17 networkActivity:0];
    }
    else if (v7)
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 25;
}

- (NSString)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(id)a3
{
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);

  objc_storeStrong((id *)&self->_businessID, 0);
}

@end