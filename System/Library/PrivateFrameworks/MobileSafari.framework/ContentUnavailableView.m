@interface ContentUnavailableView
- (_TtC12MobileSafari22ContentUnavailableView)initWithCoder:(id)a3;
- (_TtC12MobileSafari22ContentUnavailableView)initWithConfiguration:(id)a3;
@end

@implementation ContentUnavailableView

- (_TtC12MobileSafari22ContentUnavailableView)initWithConfiguration:(id)a3
{
  return (_TtC12MobileSafari22ContentUnavailableView *)sub_18C5F74B0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithConfiguration_);
}

- (_TtC12MobileSafari22ContentUnavailableView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari22ContentUnavailableView *)sub_18C5F74B0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22ContentUnavailableView____lazy_storage___blurRadius));
}

@end