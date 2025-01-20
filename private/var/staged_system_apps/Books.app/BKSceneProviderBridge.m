@interface BKSceneProviderBridge
- (BKSceneProviderBridge)init;
- (void)registerWindowScene:(id)a3 containerHost:(id)a4;
@end

@implementation BKSceneProviderBridge

- (void)registerWindowScene:(id)a3 containerHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10006023C((uint64_t)v11);
  sub_10005DA74(v11, v11[3]);
  sub_100058D18(&qword_100B48F88);
  sub_1007F4C70();
  if (v10)
  {
    sub_10005DA74(v9, v10);
    sub_1007F6F30();
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v9);
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v11);
  }
  else
  {
    __break(1u);
  }
}

- (BKSceneProviderBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneProviderBridge();
  return [(BKSceneProviderBridge *)&v3 init];
}

@end