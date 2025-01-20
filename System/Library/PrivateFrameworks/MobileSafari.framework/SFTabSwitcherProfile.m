@interface SFTabSwitcherProfile
- (NSString)title;
- (SFTabSwitcherProfile)init;
- (SFTabSwitcherProfile)initWithTitle:(id)a3;
- (UIColor)tintColor;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFTabSwitcherProfile

- (SFTabSwitcherProfile)initWithTitle:(id)a3
{
  uint64_t v4 = sub_18C6F9848();
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped);
  void *v5 = 0;
  v5[1] = 0;
  v5[2] = v4;
  v5[3] = v6;
  v8.receiver = self;
  v8.super_class = (Class)SFTabSwitcherProfile;
  return [(SFTabSwitcherProfile *)&v8 init];
}

- (SFTabSwitcherProfile)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped);
  void *v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  v2[3] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)SFTabSwitcherProfile;
  return [(SFTabSwitcherProfile *)&v4 init];
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___SFTabSwitcherProfile_wrapped));
}

- (void)setImage:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped) = (Class)a3;
  id v3 = a3;
}

- (UIColor)tintColor
{
  return (UIColor *)*(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherProfile_wrapped];
}

- (void)setTintColor:(id)a3
{
  id v4 = *(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherProfile_wrapped];
  *(void *)&self->wrapped[OBJC_IVAR___SFTabSwitcherProfile_wrapped] = a3;
  id v3 = a3;
}

- (NSString)title
{
  sub_18C6F7DE8();
  v2 = (void *)sub_18C6F9808();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = sub_18C6F9848();
  v5 = (char *)self + OBJC_IVAR___SFTabSwitcherProfile_wrapped;
  *((void *)v5 + 2) = v4;
  *((void *)v5 + 3) = v6;

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherProfile_wrapped);
  id v3 = *(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherProfile_wrapped];
  swift_bridgeObjectRelease();
}

@end