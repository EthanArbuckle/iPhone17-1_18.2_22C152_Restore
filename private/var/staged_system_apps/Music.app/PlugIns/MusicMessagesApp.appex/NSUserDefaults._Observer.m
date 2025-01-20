@interface NSUserDefaults._Observer
- (_TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NSUserDefaults._Observer

- (_TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer)init
{
  uint64_t v3 = OBJC_IVAR____TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer_registeredSuites;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1002A082C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v5 = OBJC_IVAR____TtCE14MusicUtilitiesCSo14NSUserDefaultsP33_0EE8F48931DDE162065F15584D7CE3A39_Observer_lock;
  type metadata accessor for UnfairLock();
  uint64_t v6 = swift_allocObject();
  v7 = (_DWORD *)swift_slowAlloc();
  *(void *)(v6 + 16) = v7;
  _DWORD *v7 = 0;
  *(Class *)((char *)&v4->super.isa + v5) = (Class)v6;

  v9.receiver = v4;
  v9.super_class = (Class)_s9_ObserverCMa();
  return [(NSUserDefaults._Observer *)&v9 init];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_100483E10();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_1004851E0();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  _s3__C19NSKeyValueChangeKeyVMa_0(0);
  sub_1002EEFF0();
  v15 = (objc_class *)sub_100483BF0();

LABEL_8:
  sub_1002EADAC(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1002A64B8((uint64_t)v18);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end