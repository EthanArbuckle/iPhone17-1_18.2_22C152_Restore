@interface AppStoreNotificationListener
- (void)backgrounded:(id)a3;
- (void)becameActive:(id)a3;
- (void)resignActive:(id)a3;
@end

@implementation AppStoreNotificationListener

- (void)becameActive:(id)a3
{
  uint64_t v4 = sub_1B5DB9698();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9688();
  v8 = *(void **)self->theLock;
  swift_retain();
  objc_msgSend(v8, sel_lock);
  if (MEMORY[0x1BA9AC660](self->lifecycleDelegate))
  {
    uint64_t v9 = *(void *)&self->lifecycleDelegate[8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v8, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)resignActive:(id)a3
{
  uint64_t v4 = sub_1B5DB9698();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9688();
  v8 = *(void **)self->theLock;
  swift_retain();
  objc_msgSend(v8, sel_lock);
  if (MEMORY[0x1BA9AC660](self->lifecycleDelegate))
  {
    uint64_t v9 = *(void *)&self->lifecycleDelegate[8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(ObjectType, v9);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v8, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)backgrounded:(id)a3
{
  uint64_t v4 = sub_1B5DB9698();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9688();
  v8 = *(void **)self->theLock;
  swift_retain();
  objc_msgSend(v8, sel_lock);
  if (MEMORY[0x1BA9AC660](self->lifecycleDelegate))
  {
    uint64_t v9 = *(void *)&self->lifecycleDelegate[8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v9 + 24))(ObjectType, v9);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v8, sel_unlock);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end