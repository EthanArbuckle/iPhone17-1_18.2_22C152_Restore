@interface PhotosMenu
- (_TtC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)menuByReplacingChildren:(id)a3;
@end

@implementation PhotosMenu

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_1AA7C2A6C((uint64_t)a3);
}

- (id)menuByReplacingChildren:(id)a3
{
  sub_1AA7C2E94();
  sub_1AB23AADC();
  v4 = self;
  sub_1AA7C2C1C();
}

- (_TtC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PhotosMenu();
  return [(UIMenuElement *)&v5 initWithCoder:a3];
}

@end