@interface FCHandlePushNotificationResult
- (BOOL)wasHandled;
- (NSSet)recordZoneIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRecordZoneIDs:(uint64_t)a1;
@end

@implementation FCHandlePushNotificationResult

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[FCHandlePushNotificationResult allocWithZone:a3] init];
  BOOL v5 = [(FCHandlePushNotificationResult *)self wasHandled];
  if (v4) {
    v4->_handled = v5;
  }
  v6 = [(FCHandlePushNotificationResult *)self recordZoneIDs];
  -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v4, v6);

  return v4;
}

- (void)setRecordZoneIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (BOOL)wasHandled
{
  return self->_handled;
}

- (NSSet)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void).cxx_destruct
{
}

@end