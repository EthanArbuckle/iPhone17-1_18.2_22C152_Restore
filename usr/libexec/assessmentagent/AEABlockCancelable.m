@interface AEABlockCancelable
- (void)cancel;
@end

@implementation AEABlockCancelable

- (void)cancel
{
  v2 = *(void (**)(uint64_t))self->cancelHandler;
  if (v2)
  {
    *(void *)self->cancelHandler = 0;
    *(void *)&self->cancelHandler[8] = 0;
    swift_retain();
    sub_100009064((uint64_t)v2);
    uint64_t v3 = sub_1000091B4((uint64_t)v2);
    v2(v3);
    sub_1000091B4((uint64_t)v2);
    swift_release();
  }
}

@end