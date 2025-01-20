@interface DMDConfigurationCapabilities
+ (id)supportedActivationTypes;
+ (id)supportedAssetTypes;
+ (id)supportedCommandTypes;
+ (id)supportedConfigurationTypes;
+ (id)supportedDeclarationTypes;
+ (id)supportedEventTypes;
+ (id)supportedMessageTypes;
+ (id)supportedPredicateTypes;
@end

@implementation DMDConfigurationCapabilities

+ (id)supportedCommandTypes
{
  if (qword_1000FBA08 != -1) {
    dispatch_once(&qword_1000FBA08, &stru_1000CA670);
  }
  v2 = (void *)qword_1000FBA00;

  return v2;
}

+ (id)supportedDeclarationTypes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AA6C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBA18 != -1) {
    dispatch_once(&qword_1000FBA18, block);
  }
  v2 = (void *)qword_1000FBA10;

  return v2;
}

+ (id)supportedAssetTypes
{
  if (qword_1000FBA28 != -1) {
    dispatch_once(&qword_1000FBA28, &stru_1000CA690);
  }
  v2 = (void *)qword_1000FBA20;

  return v2;
}

+ (id)supportedConfigurationTypes
{
  if (qword_1000FBA38 != -1) {
    dispatch_once(&qword_1000FBA38, &stru_1000CA6B0);
  }
  v2 = (void *)qword_1000FBA30;

  return v2;
}

+ (id)supportedEventTypes
{
  if (qword_1000FBA48 != -1) {
    dispatch_once(&qword_1000FBA48, &stru_1000CA6D0);
  }
  v2 = (void *)qword_1000FBA40;

  return v2;
}

+ (id)supportedActivationTypes
{
  if (qword_1000FBA58 != -1) {
    dispatch_once(&qword_1000FBA58, &stru_1000CA6F0);
  }
  v2 = (void *)qword_1000FBA50;

  return v2;
}

+ (id)supportedPredicateTypes
{
  if (qword_1000FBA68 != -1) {
    dispatch_once(&qword_1000FBA68, &stru_1000CA710);
  }
  v2 = (void *)qword_1000FBA60;

  return v2;
}

+ (id)supportedMessageTypes
{
  if (qword_1000FBA78 != -1) {
    dispatch_once(&qword_1000FBA78, &stru_1000CA730);
  }
  v2 = (void *)qword_1000FBA70;

  return v2;
}

@end