@interface VGVirtualGarageService
- (void)getEvChargingMetadata:(id)a3;
@end

@implementation VGVirtualGarageService

- (void)getEvChargingMetadata:(id)a3
{
  id v3 = a3;
  v4 = +[VGVirtualGarageService sharedService];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009F35E4;
  v6[3] = &unk_101313C50;
  id v7 = v3;
  id v5 = v3;
  [v4 virtualGarageGetGarageWithReply:v6];
}

@end