@interface DefaultsObserver
- (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DefaultsObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_1ACE761B8();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      id v12 = a5;
      v13 = self;
      sub_1ACE770C8();
      v14 = (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *)swift_unknownObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
LABEL_14:
      if (v11) {
        goto LABEL_5;
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  memset(v20, 0, sizeof(v20));
  id v19 = a5;
  v14 = self;
  if (!a5) {
    goto LABEL_14;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1ACC16F50();
  sub_1ACE75FF8();

  if (!v11) {
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v16 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver_key);
  uint64_t v17 = *(void *)&self->key[OBJC_IVAR____TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver_key];
  BOOL v18 = v9 == v16 && v11 == v17;
  if (v18
    || (v14 = (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *)sub_1ACE77848(),
        (v14 & 1) != 0))
  {
    (*(void (**)(_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *, uint64_t, uint64_t, uint64_t))((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver_notify))(v14, v15, v16, v17);
  }

  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
  sub_1ACA50E78((uint64_t)v20, qword_1EB7725E0);
}

- (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver)init
{
  result = (_TtC18PodcastsFoundationP33_4984B522253F5D3980999CC4D4B1655C16DefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end