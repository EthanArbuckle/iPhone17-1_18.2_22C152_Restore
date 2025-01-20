@interface PDCloudStoreShareInvitationRequestRecordArray
- (PDCloudStoreShareInvitationRequestRecordArray)initWithCloudStoreRecords:(id)a3 success:(BOOL)a4 error:(id)a5;
- (PKCloudRecordArray)cloudStoreRecords;
- (unint64_t)type;
@end

@implementation PDCloudStoreShareInvitationRequestRecordArray

- (PDCloudStoreShareInvitationRequestRecordArray)initWithCloudStoreRecords:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDCloudStoreShareInvitationRequestRecordArray;
  v10 = [(PDCloudStoreShareInvitationRequestGenericResponse *)&v13 initWithSuccess:v6 error:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_cloudStoreRecords, a3);
  }

  return v11;
}

- (unint64_t)type
{
  return 3;
}

- (PKCloudRecordArray)cloudStoreRecords
{
  return self->_cloudStoreRecords;
}

- (void).cxx_destruct
{
}

@end