@interface WFBuiltInCloudKitCollectionOrdering
+ (BOOL)isOrderingRecordID:(id)a3;
+ (id)recordBasename;
+ (id)recordIDWithZoneID:(id)a3 collectionIdentifier:(id)a4;
+ (id)recordType;
@end

@implementation WFBuiltInCloudKitCollectionOrdering

+ (id)recordIDWithZoneID:(id)a3 collectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"WFBuiltInCloudKitCollectionOrdering.m", 36, @"Invalid parameter not satisfying: %@", @"zoneID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"WFBuiltInCloudKitCollectionOrdering.m", 37, @"Invalid parameter not satisfying: %@", @"collectionIdentifier" object file lineNumber description];

LABEL_3:
  v10 = [NSString stringWithFormat:@"%@-%@", @"WFBuiltInCollectionOrdering", v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v10 zoneID:v7];

  return v11;
}

+ (BOOL)isOrderingRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 hasPrefix:@"WFBuiltInCollectionOrdering"];

  return v4;
}

+ (id)recordBasename
{
  return @"WFBuiltInCollectionOrdering";
}

+ (id)recordType
{
  return @"BuiltInCollectionOrdering";
}

@end