@interface MTMAPIResponseDatabaseObjectProvider
- (MTMAPIResponseDatabaseObjectProvider)init;
- (MTMAPIResponseDatabaseObjectProvider)initWithResponse:(id)a3;
- (_TtP18PodcastsFoundation42MAPIResponseDatabaseObjectProviderDelegate_)delegate;
- (id)databaseObjectWithStoreID:(int64_t)a3 contentType:(int64_t)a4;
- (void)controllerDidChangeContent:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MTMAPIResponseDatabaseObjectProvider

- (_TtP18PodcastsFoundation42MAPIResponseDatabaseObjectProviderDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP18PodcastsFoundation42MAPIResponseDatabaseObjectProviderDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTMAPIResponseDatabaseObjectProvider_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (MTMAPIResponseDatabaseObjectProvider)initWithResponse:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (MTMAPIResponseDatabaseObjectProvider *)sub_1ACB5EC74((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (id)databaseObjectWithStoreID:(int64_t)a3 contentType:(int64_t)a4
{
  v6 = self;
  v7 = sub_1ACB5D678(a3, a4);

  return v7;
}

- (void)controllerDidChangeContent:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___MTMAPIResponseDatabaseObjectProvider_needsParsing) = 1;
  v3 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTMAPIResponseDatabaseObjectProvider_delegate);
  swift_beginAccess();
  if (*v3) {
    objc_msgSend(*v3, sel_mapiResponseDatabaseObjectsDidChange);
  }
}

- (MTMAPIResponseDatabaseObjectProvider)init
{
  result = (MTMAPIResponseDatabaseObjectProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end