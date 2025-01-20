@interface CKRecordZoneNotification
- (BOOL)ckksPushTracingEnabled;
- (NSDate)ckksPushReceivedDate;
- (NSString)ckksPushTracingUUID;
- (void)setCkksPushReceivedDate:(id)a3;
- (void)setCkksPushTracingEnabled:(BOOL)a3;
- (void)setCkksPushTracingUUID:(id)a3;
@end

@implementation CKRecordZoneNotification

- (NSDate)ckksPushReceivedDate
{
  return (NSDate *)objc_getAssociatedObject(self, "ckksPushReceivedDate");
}

- (void)setCkksPushReceivedDate:(id)a3
{
}

- (NSString)ckksPushTracingUUID
{
  return (NSString *)objc_getAssociatedObject(self, "ckksPushTracingUUID");
}

- (void)setCkksPushTracingUUID:(id)a3
{
}

- (BOOL)ckksPushTracingEnabled
{
  v2 = objc_getAssociatedObject(self, "ckksPushTracingEnabled");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCkksPushTracingEnabled:(BOOL)a3
{
  if (a3) {
    unsigned __int8 v3 = &__kCFBooleanTrue;
  }
  else {
    unsigned __int8 v3 = &__kCFBooleanFalse;
  }
  objc_setAssociatedObject(self, "ckksPushTracingEnabled", v3, (void *)0x301);
}

@end