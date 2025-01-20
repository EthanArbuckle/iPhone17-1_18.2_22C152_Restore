@interface PDApplePayCloudStoreRecordsRequest
- (NSSet)transactionSourceIdentifiers;
- (id)description;
- (void)setTransactionSourceIdentifiers:(id)a3;
@end

@implementation PDApplePayCloudStoreRecordsRequest

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  unint64_t v4 = [(PDCloudStoreRecordsRequest *)self requestType];
  if (v4 - 1 > 7) {
    CFStringRef v5 = @"token";
  }
  else {
    CFStringRef v5 = *(&off_100749718 + v4 - 1);
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  if ([(PDCloudStoreRecordsRequest *)self useLastChangeToken]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v3 appendFormat:@"use last token: '%@'; ", v6];
  if ([(PDCloudStoreRecordsRequest *)self shouldSaveToken]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@"should save token: '%@'; ", v7];
  if ([(PDCloudStoreRecordsRequest *)self storeChangesInDatabase]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v3 appendFormat:@"store changes: '%@'; ", v8];
  if ([(PDCloudStoreRecordsRequest *)self returnRecords]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v3 appendFormat:@"return records: '%@'; ", v9];
  v10 = [(PDCloudStoreRecordsRequest *)self groupName];
  [v3 appendFormat:@"group name: '%@'; ", v10];

  v11 = [(PDCloudStoreRecordsRequest *)self groupNameSuffix];
  [v3 appendFormat:@"group name suffix: '%@'; ", v11];

  v12 = [(PDCloudStoreRecordsRequest *)self ckQuery];
  [v3 appendFormat:@"ckQuery: '%@'; ", v12];

  v13 = [(PDCloudStoreRecordsRequest *)self cloudStoreZone];
  v14 = [v13 zoneName];
  [v3 appendFormat:@"zoneName: '%@'; ", v14];

  v15 = [(PDCloudStoreRecordsRequest *)self cloudStoreZone];
  v16 = [v15 containerName];
  [v3 appendFormat:@"containerName: '%@'; ", v16];

  v17 = [(PDApplePayCloudStoreRecordsRequest *)self transactionSourceIdentifiers];
  [v3 appendFormat:@"transactionSourceIdentifiers: '%@'; ", v17];

  if ([(PDCloudStoreRecordsRequest *)self ignoreExistingRecordHash])
  {
    if ([(PDCloudStoreRecordsRequest *)self ignoreExistingRecordHash]) {
      CFStringRef v18 = @"YES";
    }
    else {
      CFStringRef v18 = @"NO";
    }
    [v3 appendFormat:@"ignoreExistingRecordHash: '%@'; ", v18];
  }
  [v3 appendString:@">"];
  v19 = +[NSString stringWithString:v3];

  return v19;
}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end