@interface SFTabSwitcherDropIntent
- (SFTabSwitcherDropDestination)destination;
- (SFTabSwitcherDropIntent)init;
- (UIDropProposal)proposal;
- (UIDropSession)session;
@end

@implementation SFTabSwitcherDropIntent

- (SFTabSwitcherDropDestination)destination
{
  v2 = self;
  id v3 = sub_18C5D5180();

  return (SFTabSwitcherDropDestination *)v3;
}

- (UIDropProposal)proposal
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherDropIntent__internal)
     + OBJC_IVAR____TtC12MobileSafari31SFTabSwitcherDropIntentInternal_wrapped;
  id v3 = *(void **)&v2[*(int *)(_s10DropIntentVMa_0(0) + 20)];

  return (UIDropProposal *)v3;
}

- (UIDropSession)session
{
  _s10DropIntentVMa_0(0);
  v2 = (void *)swift_unknownObjectRetain();

  return (UIDropSession *)v2;
}

- (SFTabSwitcherDropIntent)init
{
  result = (SFTabSwitcherDropIntent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end