@interface CKRecordID
- (id)fmf_withCurrentUserDefaultName;
@end

@implementation CKRecordID

- (id)fmf_withCurrentUserDefaultName
{
  id v3 = objc_alloc((Class)CKRecordID);
  v4 = [(CKRecordID *)self recordName];
  v5 = [(CKRecordID *)self zoneID];
  v6 = [v5 fmf_withCurrentUserDefaultName];
  id v7 = [v3 initWithRecordName:v4 zoneID:v6];

  return v7;
}

@end