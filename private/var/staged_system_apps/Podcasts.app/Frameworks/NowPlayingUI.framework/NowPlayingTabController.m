@interface NowPlayingTabController
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)dismissNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)presentNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation NowPlayingTabController

- (void)presentNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_27458;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  NowPlayingTabController.presentNowPlaying(animated:completion:)(a3, v6, v7);
  sub_FB70((uint64_t)v6);
}

- (void)dismissNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_2744C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  NowPlayingTabController.dismissNowPlaying(animated:completion:)(a3, v6, v7);
  sub_FB70((uint64_t)v6);
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  NowPlayingTabController.encodeRestorableState(with:)((NSCoder)v4);
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingTabController();
  [(NowPlayingTabController *)&v4 decodeRestorableStateWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end