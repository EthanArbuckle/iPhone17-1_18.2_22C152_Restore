@interface Environment.ContentProtectionObservable
- (_TtCE7MessageV16IMAP2Persistence11Environment27ContentProtectionObservable)init;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
@end

@implementation Environment.ContentProtectionObservable

- (_TtCE7MessageV16IMAP2Persistence11Environment27ContentProtectionObservable)init
{
  return (_TtCE7MessageV16IMAP2Persistence11Environment27ContentProtectionObservable *)sub_1A81250E4();
}

- (void)dealloc
{
  v2 = self;
  sub_1A8125518();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7MessageV16IMAP2Persistence11Environment27ContentProtectionObservable_observer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7MessageV16IMAP2Persistence11Environment27ContentProtectionObservable_observable));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7MessageV16IMAP2Persistence11Environment27ContentProtectionObservable_queue));
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  v4 = self;
  sub_1A812560C();
}

@end