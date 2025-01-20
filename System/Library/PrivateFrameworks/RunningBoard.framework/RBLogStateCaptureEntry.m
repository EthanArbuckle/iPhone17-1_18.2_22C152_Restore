@interface RBLogStateCaptureEntry
- (void)setQueue:(uint64_t)a1;
- (void)setTitle:(uint64_t)a1;
@end

@implementation RBLogStateCaptureEntry

- (void)setTitle:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_captureBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end