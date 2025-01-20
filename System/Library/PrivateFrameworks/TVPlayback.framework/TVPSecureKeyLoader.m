@interface TVPSecureKeyLoader
- (TVPPlaybackReportingEventCollection)eventCollection;
- (TVPSecureKeyLoaderDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setEventCollection:(id)a3;
- (void)startLoadingCertificateDataForRequest:(id)a3;
- (void)startLoadingContentIdentifierDataForRequest:(id)a3;
- (void)startLoadingKeyResponseDataForRequest:(id)a3;
@end

@implementation TVPSecureKeyLoader

- (void)startLoadingCertificateDataForRequest:(id)a3
{
}

- (void)startLoadingContentIdentifierDataForRequest:(id)a3
{
}

- (void)startLoadingKeyResponseDataForRequest:(id)a3
{
}

- (TVPSecureKeyLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVPSecureKeyLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (void)setEventCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end