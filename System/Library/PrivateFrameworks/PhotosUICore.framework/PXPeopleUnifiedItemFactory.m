@interface PXPeopleUnifiedItemFactory
+ (id)itemWithPerson:(id)a3;
+ (id)itemWithSocialGroup:(id)a3;
- (_TtC12PhotosUICore26PXPeopleUnifiedItemFactory)init;
@end

@implementation PXPeopleUnifiedItemFactory

+ (id)itemWithPerson:(id)a3
{
  id v3 = a3;
  v4 = (void *)sub_1AA41FA04((uint64_t)v3, 0);

  return v4;
}

+ (id)itemWithSocialGroup:(id)a3
{
  id v3 = a3;
  v4 = (void *)sub_1AA41FBC0((uint64_t)v3, 0);

  return v4;
}

- (_TtC12PhotosUICore26PXPeopleUnifiedItemFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXPeopleUnifiedItemFactory();
  return [(PXPeopleUnifiedItemFactory *)&v3 init];
}

@end