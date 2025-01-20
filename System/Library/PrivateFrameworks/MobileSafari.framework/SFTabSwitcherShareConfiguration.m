@interface SFTabSwitcherShareConfiguration
- (NSArray)allCollaborationButtons;
- (NSString)identifier;
- (SFTabSwitcherShareConfiguration)init;
- (SFTabSwitcherShareConfiguration)initWithIdentifier:(id)a3 shareHandler:(id)a4;
- (UIView)collaborationButtonForLargeTitle;
- (UIView)collaborationButtonForNavigationBar;
- (id)shareHandler;
- (void)setCollaborationButtonForLargeTitle:(id)a3;
- (void)setCollaborationButtonForNavigationBar:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShareHandler:(id)a3;
@end

@implementation SFTabSwitcherShareConfiguration

- (SFTabSwitcherShareConfiguration)initWithIdentifier:(id)a3 shareHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    a3 = (id)sub_18C6F9848();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped);
  void *v10 = 0;
  v10[1] = 0;
  v10[2] = a3;
  v10[3] = v8;
  v10[4] = sub_18C5DED64;
  v10[5] = v9;
  v12.receiver = self;
  v12.super_class = (Class)SFTabSwitcherShareConfiguration;
  return [(SFTabSwitcherShareConfiguration *)&v12 init];
}

- (NSArray)allCollaborationButtons
{
  v2 = self;
  sub_18C5D8B44();

  sub_18C38D908(0, (unint64_t *)&qword_1E9176830);
  v3 = (void *)sub_18C6F99C8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (UIView)collaborationButtonForLargeTitle
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped));
}

- (void)setCollaborationButtonForLargeTitle:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped) = (Class)a3;
  id v3 = a3;
}

- (UIView)collaborationButtonForNavigationBar
{
  return (UIView *)*(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped];
}

- (void)setCollaborationButtonForNavigationBar:(id)a3
{
  id v4 = *(id *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped];
  *(void *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped] = a3;
  id v3 = a3;
}

- (NSString)identifier
{
  if (*(void *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped + 16])
  {
    sub_18C6F7DE8();
    v2 = (void *)sub_18C6F9808();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18C6F9848();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (char *)self + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped;
  *((void *)v6 + 2) = v4;
  *((void *)v6 + 3) = v5;

  swift_bridgeObjectRelease();
}

- (id)shareHandler
{
  uint64_t v2 = *(void *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped + 32];
  v5[4] = *(void *)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped + 24];
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D3C68;
  v5[3] = &block_descriptor_25;
  id v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (void)setShareHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (char *)self + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped;
  *((void *)v6 + 4) = sub_18C5DED64;
  *((void *)v6 + 5) = v5;

  swift_release();
}

- (SFTabSwitcherShareConfiguration)init
{
  result = (SFTabSwitcherShareConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped);
  id v3 = *(void **)&self->wrapped[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped];
  swift_release();

  swift_bridgeObjectRelease();
}

@end