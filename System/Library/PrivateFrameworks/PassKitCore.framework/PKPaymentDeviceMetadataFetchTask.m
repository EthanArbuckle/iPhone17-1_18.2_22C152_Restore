@interface PKPaymentDeviceMetadataFetchTask
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)completion;
- (unint64_t)remaningFields;
- (unint64_t)requestedFields;
- (void)setCompletion:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setRemaningFields:(unint64_t)a3;
- (void)setRequestedFields:(unint64_t)a3;
@end

@implementation PKPaymentDeviceMetadataFetchTask

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (unint64_t)remaningFields
{
  return self->_remaningFields;
}

- (void)setRemaningFields:(unint64_t)a3
{
  self->_remaningFields = a3;
}

- (unint64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(unint64_t)a3
{
  self->_requestedFields = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
}

@end