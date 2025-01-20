@interface RMLog
+ (id)accountAdapter;
+ (id)accountApplicator;
+ (id)accountStatus;
+ (id)accountStatusAdapter;
+ (id)accountStatusHandler;
+ (id)accountStatusHandlerCalDAV;
+ (id)accountStatusHandlerCardDAV;
+ (id)accountStatusHandlerExchange;
+ (id)accountStatusHandlerGoogle;
+ (id)accountStatusHandlerLDAP;
+ (id)accountStatusHandlerMail;
+ (id)accountStatusHandlerSubscribedCalendar;
+ (id)accountTransformer;
+ (id)accountTransformerCalDAV;
+ (id)accountTransformerCardDAV;
+ (id)accountTransformerExchange;
+ (id)accountTransformerGoogle;
+ (id)accountTransformerLDAP;
+ (id)accountTransformerMail;
+ (id)accountTransformerSubscribedCalendar;
@end

@implementation RMLog

+ (id)accountAdapter
{
  if (qword_100022230 != -1) {
    dispatch_once(&qword_100022230, &stru_10001C5C0);
  }
  v2 = (void *)qword_100022228;

  return v2;
}

+ (id)accountApplicator
{
  if (qword_100022240 != -1) {
    dispatch_once(&qword_100022240, &stru_10001C668);
  }
  v2 = (void *)qword_100022238;

  return v2;
}

+ (id)accountStatus
{
  if (qword_100022250 != -1) {
    dispatch_once(&qword_100022250, &stru_10001C808);
  }
  v2 = (void *)qword_100022248;

  return v2;
}

+ (id)accountStatusAdapter
{
  if (qword_100022260 != -1) {
    dispatch_once(&qword_100022260, &stru_10001C828);
  }
  v2 = (void *)qword_100022258;

  return v2;
}

+ (id)accountStatusHandler
{
  if (qword_100022270 != -1) {
    dispatch_once(&qword_100022270, &stru_10001C870);
  }
  v2 = (void *)qword_100022268;

  return v2;
}

+ (id)accountStatusHandlerCalDAV
{
  if (qword_100022290 != -1) {
    dispatch_once(&qword_100022290, &stru_10001C8B0);
  }
  v2 = (void *)qword_100022288;

  return v2;
}

+ (id)accountStatusHandlerCardDAV
{
  if (qword_1000222A0 != -1) {
    dispatch_once(&qword_1000222A0, &stru_10001C8D0);
  }
  v2 = (void *)qword_100022298;

  return v2;
}

+ (id)accountStatusHandlerExchange
{
  if (qword_1000222B0 != -1) {
    dispatch_once(&qword_1000222B0, &stru_10001C8F0);
  }
  v2 = (void *)qword_1000222A8;

  return v2;
}

+ (id)accountStatusHandlerGoogle
{
  if (qword_1000222C0 != -1) {
    dispatch_once(&qword_1000222C0, &stru_10001C910);
  }
  v2 = (void *)qword_1000222B8;

  return v2;
}

+ (id)accountStatusHandlerLDAP
{
  if (qword_1000222D0 != -1) {
    dispatch_once(&qword_1000222D0, &stru_10001C930);
  }
  v2 = (void *)qword_1000222C8;

  return v2;
}

+ (id)accountStatusHandlerMail
{
  if (qword_1000222E0 != -1) {
    dispatch_once(&qword_1000222E0, &stru_10001C950);
  }
  v2 = (void *)qword_1000222D8;

  return v2;
}

+ (id)accountStatusHandlerSubscribedCalendar
{
  if (qword_1000222F0 != -1) {
    dispatch_once(&qword_1000222F0, &stru_10001C970);
  }
  v2 = (void *)qword_1000222E8;

  return v2;
}

+ (id)accountTransformer
{
  if (qword_100022300 != -1) {
    dispatch_once(&qword_100022300, &stru_10001C990);
  }
  v2 = (void *)qword_1000222F8;

  return v2;
}

+ (id)accountTransformerCalDAV
{
  if (qword_100022320 != -1) {
    dispatch_once(&qword_100022320, &stru_10001CC50);
  }
  v2 = (void *)qword_100022318;

  return v2;
}

+ (id)accountTransformerCardDAV
{
  if (qword_100022330 != -1) {
    dispatch_once(&qword_100022330, &stru_10001CCE8);
  }
  v2 = (void *)qword_100022328;

  return v2;
}

+ (id)accountTransformerExchange
{
  if (qword_100022340 != -1) {
    dispatch_once(&qword_100022340, &stru_10001CD08);
  }
  v2 = (void *)qword_100022338;

  return v2;
}

+ (id)accountTransformerGoogle
{
  if (qword_100022350 != -1) {
    dispatch_once(&qword_100022350, &stru_10001CD28);
  }
  v2 = (void *)qword_100022348;

  return v2;
}

+ (id)accountTransformerLDAP
{
  if (qword_100022360 != -1) {
    dispatch_once(&qword_100022360, &stru_10001CD98);
  }
  v2 = (void *)qword_100022358;

  return v2;
}

+ (id)accountTransformerMail
{
  if (qword_100022370 != -1) {
    dispatch_once(&qword_100022370, &stru_10001CDB8);
  }
  v2 = (void *)qword_100022368;

  return v2;
}

+ (id)accountTransformerSubscribedCalendar
{
  if (qword_100022380 != -1) {
    dispatch_once(&qword_100022380, &stru_10001CE28);
  }
  v2 = (void *)qword_100022378;

  return v2;
}

@end