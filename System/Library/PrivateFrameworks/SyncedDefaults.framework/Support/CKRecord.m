@interface CKRecord
- (id)syd_shortDescription;
@end

@implementation CKRecord

- (id)syd_shortDescription
{
  if (os_variant_has_internal_content())
  {
    v3 = [(CKRecord *)self modifiedByDevice];
    +[NSString stringWithFormat:@" modifiedBy='%@'", v3];
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_100051D50;
  }
  v5 = [(CKRecord *)self recordType];
  v6 = [(CKRecord *)self recordID];
  v7 = [v6 recordName];
  v8 = [(CKRecord *)self recordID];
  v9 = [v8 zoneID];
  v10 = [v9 zoneName];
  v11 = [(CKRecord *)self recordChangeTag];
  v12 = +[NSString stringWithFormat:@"<CKRecord type=%@ recordName=%@ zone=%@ etag=%@%@>", v5, v7, v10, v11, v4];

  return v12;
}

@end