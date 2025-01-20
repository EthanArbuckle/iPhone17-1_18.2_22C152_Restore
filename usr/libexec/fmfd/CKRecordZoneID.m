@interface CKRecordZoneID
- (id)fmf_withCurrentUserDefaultName;
@end

@implementation CKRecordZoneID

- (id)fmf_withCurrentUserDefaultName
{
  id v3 = objc_alloc((Class)CKRecordZoneID);
  v4 = [(CKRecordZoneID *)self zoneName];
  id v5 = [v3 initWithZoneName:v4 ownerName:CKCurrentUserDefaultName];

  return v5;
}

@end