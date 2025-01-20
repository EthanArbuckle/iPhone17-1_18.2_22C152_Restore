@interface BrowsingAssistant.MainHeaderFooter
- (BOOL)isLeadingButtonEnabled;
- (SFStepper)stepper;
- (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter)initWithCoder:(id)a3;
- (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter)initWithFrame:(CGRect)a3;
- (id)leadingButtonActionHandler;
- (void)setLeadingButtonActionHandler:(id)a3;
- (void)setLeadingButtonEnabled:(BOOL)a3;
- (void)setStepper:(id)a3;
@end

@implementation BrowsingAssistant.MainHeaderFooter

- (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C6F48DC();
}

- (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter *)sub_18C6F2FF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isLeadingButtonEnabled
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton), sel_isEnabled);
}

- (void)setLeadingButtonEnabled:(BOOL)a3
{
}

- (id)leadingButtonActionHandler
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler))
  {
    uint64_t v2 = *(void *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
    v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_18C3E9778;
    v5[3] = &block_descriptor_50;
    id v3 = _Block_copy(v5);
    sub_18C6F7B98();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setLeadingButtonActionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_18C448040;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self
                      + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_18C3F33C8(v8);
}

- (SFStepper)stepper
{
  return (SFStepper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                              + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper));
}

- (void)setStepper:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_18C6F3AEC(a3);
}

- (void).cxx_destruct
{
  sub_18C3F33C8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButtonActionHandler));
  sub_18C3F33C8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButtonActionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_leadingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_backgroundView);
}

@end