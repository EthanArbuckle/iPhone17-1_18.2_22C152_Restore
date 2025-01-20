@interface BALibraryItemTypeData
- (BALibraryItemTypeData)init;
- (BALibraryItemTypeData)initWithContentPrivateID:(id)a3 contentUserID:(id)a4 contentType:(int64_t)a5 contentID:(id)a6 isSample:(id)a7;
@end

@implementation BALibraryItemTypeData

- (BALibraryItemTypeData)initWithContentPrivateID:(id)a3 contentUserID:(id)a4 contentType:(int64_t)a5 contentID:(id)a6 isSample:(id)a7
{
  uint64_t v10 = sub_27DDB0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_27DDB0();
  uint64_t v15 = v14;
  uint64_t v16 = sub_27DDB0();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___BALibraryItemTypeData_contentPrivateID);
  uint64_t *v17 = v10;
  v17[1] = v12;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___BALibraryItemTypeData_contentUserID);
  uint64_t *v18 = v13;
  v18[1] = v15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BALibraryItemTypeData_contentType) = (Class)a5;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___BALibraryItemTypeData_contentID);
  uint64_t *v19 = v16;
  v19[1] = v20;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BALibraryItemTypeData_isSample) = (Class)a7;
  v23.receiver = self;
  v23.super_class = (Class)type metadata accessor for BridgedLibraryItemTypeData();
  id v21 = a7;
  return [(BALibraryItemTypeData *)&v23 init];
}

- (BALibraryItemTypeData)init
{
  result = (BALibraryItemTypeData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BALibraryItemTypeData_isSample);
}

@end