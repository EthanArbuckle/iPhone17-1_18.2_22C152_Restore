@interface SpatialGenericPlatter
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SpatialGenericPlatter

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1001C70EC(v6, v7);

  return v9 & 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  id v7 = (char *)self + qword_1004D0BD8;
  int64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    v8 = (void *)result;
    uint64_t v9 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v11 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 16);
    id v12 = a3;
    v13 = self;
    int64_t v14 = v11(ObjectType, v9);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1001C72EC(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001C3A4C();
}

@end