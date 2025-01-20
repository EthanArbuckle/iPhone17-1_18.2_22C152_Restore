@interface SharedAlbumsInvitationsViewModel
- (void)feedSectionInfosManager:(id)a3 sectionInfosDidChange:(id)a4;
@end

@implementation SharedAlbumsInvitationsViewModel

- (void)feedSectionInfosManager:(id)a3 sectionInfosDidChange:(id)a4
{
  v5 = (void (*)(uint64_t))*((void *)self->super.isa + 35);
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1AB22F8DC();
  v5(v8);

  swift_release();
}

@end