@interface CKRecordID
- (id)syd_shortDescription;
@end

@implementation CKRecordID

- (id)syd_shortDescription
{
  v3 = [(CKRecordID *)self recordName];
  v4 = [(CKRecordID *)self zoneID];
  v5 = [v4 zoneName];
  v6 = +[NSString stringWithFormat:@"<CKRecordID recordName=%@ zone=%@>", v3, v5];

  return v6;
}

@end