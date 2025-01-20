@interface LibrarySideBarManager
- (_TtC8VideosUI21LibrarySideBarManager)init;
- (void)accountsChanged:(id)a3;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)dealloc;
- (void)deviceMediaLibraryUpdateStateDidChange;
- (void)isLibraryOnlyCountryChanged:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
@end

@implementation LibrarySideBarManager

- (_TtC8VideosUI21LibrarySideBarManager)init
{
  return (_TtC8VideosUI21LibrarySideBarManager *)sub_1E354FDFC();
}

- (void)dealloc
{
  v2 = self;
  sub_1E3550510();
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI21LibrarySideBarManager_delegate);

  sub_1E30CAB10(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC8VideosUI21LibrarySideBarManager____lazy_storage___downloadItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3553B88();
}

- (void)networkReachabilityDidChange:(id)a3
{
}

- (void)accountsChanged:(id)a3
{
}

- (void)deviceMediaLibraryUpdateStateDidChange
{
  v2 = self;
  sub_1E3554744();
}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
}

@end