@interface AdIgnorableViewFactory
- (_TtC12NewsArticles22AdIgnorableViewFactory)init;
- (id)createView;
@end

@implementation AdIgnorableViewFactory

- (id)createView
{
  type metadata accessor for AdIgnorableView();
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  return v2;
}

- (_TtC12NewsArticles22AdIgnorableViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AdIgnorableViewFactory *)&v3 init];
}

@end