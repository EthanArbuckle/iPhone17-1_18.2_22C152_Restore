@interface MTLegacyDownloadListener
- (MTLegacyDownloadListener)initWithDelegate:(id)a3;
- (MTLegacyDownloadManagerDelegate)delegate;
@end

@implementation MTLegacyDownloadListener

- (MTLegacyDownloadListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTLegacyDownloadListener;
  v5 = [(MTLegacyDownloadListener *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (MTLegacyDownloadManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTLegacyDownloadManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end