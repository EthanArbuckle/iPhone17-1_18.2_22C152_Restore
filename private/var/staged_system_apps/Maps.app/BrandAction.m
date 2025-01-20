@interface BrandAction
- (BrandAction)initWithName:(id)a3 muid:(unint64_t)a4;
- (NSString)brandName;
- (int)analyticsLaunchActionType;
- (unint64_t)brandMUID;
- (void)resolveBrandPOIsWithTraits:(id)a3 completion:(id)a4;
- (void)setBrandMUID:(unint64_t)a3;
- (void)setBrandName:(id)a3;
@end

@implementation BrandAction

- (BrandAction)initWithName:(id)a3 muid:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BrandAction;
  v7 = [(BrandAction *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_brandMUID = a4;
    v9 = (NSString *)[v6 copy];
    brandName = v8->_brandName;
    v8->_brandName = v9;
  }
  return v8;
}

- (void)resolveBrandPOIsWithTraits:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[MKMapService sharedService];
  v9 = [v8 ticketForSearchPoisForBrandMUID:[self brandMUID] traits:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10059FCC8;
  v11[3] = &unk_1012E6EF8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 submitWithHandler:v11 networkActivity:0];
}

- (int)analyticsLaunchActionType
{
  return 5;
}

- (unint64_t)brandMUID
{
  return self->_brandMUID;
}

- (void)setBrandMUID:(unint64_t)a3
{
  self->_brandMUID = a3;
}

- (NSString)brandName
{
  return self->_brandName;
}

- (void)setBrandName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end