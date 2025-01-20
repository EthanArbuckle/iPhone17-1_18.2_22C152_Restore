@interface _MFLoadingContextEventResult
- (void)setCleanupInvocable:(uint64_t)a1;
- (void)setContentURL:(uint64_t)a1;
- (void)setMessageAndHTMLDataPair:(uint64_t)a1;
- (void)setPublicMessageURL:(uint64_t)a1;
- (void)setRelatedContentItems:(uint64_t)a1;
@end

@implementation _MFLoadingContextEventResult

- (void)setContentURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setRelatedContentItems:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setCleanupInvocable:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setPublicMessageURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setMessageAndHTMLDataPair:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageAndHTMLDataPair, 0);
  objc_storeStrong((id *)&self->_publicMessageURL, 0);
  objc_storeStrong((id *)&self->_cleanupInvocable, 0);
  objc_storeStrong((id *)&self->_relatedContentItems, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
}

@end