@interface SystemPaperViewControllerLinkDelegate
- (BOOL)linkingController:(id)a3 shouldAddSynapseLinkItem:(id)a4;
- (id)linkingControllerLinksMenuExcludedUserActivities:(id)a3;
- (void)linkingControllerLinksMightHaveChanged:(id)a3;
@end

@implementation SystemPaperViewControllerLinkDelegate

- (void)linkingControllerLinksMightHaveChanged:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_20C0E6694(v3);

  swift_release();
}

- (BOOL)linkingController:(id)a3 shouldAddSynapseLinkItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  char v7 = sub_20C0E7578();

  swift_release();
  return v7 & 1;
}

- (id)linkingControllerLinksMenuExcludedUserActivities:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_20C0E6950(v3);

  swift_release();
  sub_20BFCEE58(0, &qword_2676BC640);
  v4 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return v4;
}

@end