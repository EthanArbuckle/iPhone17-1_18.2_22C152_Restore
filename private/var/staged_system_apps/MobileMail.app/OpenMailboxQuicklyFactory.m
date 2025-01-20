@interface OpenMailboxQuicklyFactory
+ (id)createOpenMailboxQuicklyItemWithFavoriteItem:(id)a3;
+ (id)createOpenMailboxQuicklyViewControllerWithFavoritesManager:(id)a3 delegate:(id)a4;
- (_TtC10MobileMail25OpenMailboxQuicklyFactory)init;
@end

@implementation OpenMailboxQuicklyFactory

+ (id)createOpenMailboxQuicklyViewControllerWithFavoritesManager:(id)a3 delegate:(id)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  swift_unknownObjectRetain();
  swift_getObjCClassMetadata();
  id v8 = static OpenMailboxQuicklyFactory.createOpenMailboxQuicklyViewController(with:delegate:)((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

+ (id)createOpenMailboxQuicklyItemWithFavoriteItem:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static OpenMailboxQuicklyFactory.createOpenMailboxQuicklyItem(with:)(a3);

  return v6;
}

- (_TtC10MobileMail25OpenMailboxQuicklyFactory)init
{
  return (_TtC10MobileMail25OpenMailboxQuicklyFactory *)OpenMailboxQuicklyFactory.init()();
}

@end