@interface _UIDataTransferRequest
- (NSItemProvider)itemProvider;
- (NSProgress)progress;
- (NSUUID)UUID;
- (void)setItemProvider:(id)a3;
- (void)setProgress:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation _UIDataTransferRequest

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end