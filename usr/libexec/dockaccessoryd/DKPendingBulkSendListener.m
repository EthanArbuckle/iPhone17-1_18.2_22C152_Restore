@interface DKPendingBulkSendListener
- (DKPendingBulkSendListener)initWithListener:(id)a3 fileType:(id)a4;
- (DataStreamBulkSendListener)listener;
- (NSString)fileType;
- (void)setFileType:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation DKPendingBulkSendListener

- (DKPendingBulkSendListener)initWithListener:(id)a3 fileType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DKPendingBulkSendListener;
  v8 = [(DKPendingBulkSendListener *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listener, v6);
    objc_storeStrong((id *)&v9->_fileType, a4);
  }

  return v9;
}

- (DataStreamBulkSendListener)listener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);

  return (DataStreamBulkSendListener *)WeakRetained;
}

- (void)setListener:(id)a3
{
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);

  objc_destroyWeak((id *)&self->_listener);
}

@end