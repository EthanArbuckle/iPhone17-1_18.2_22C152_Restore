@interface PhotosMenu.AssociatedData
- (_TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData)init;
@end

@implementation PhotosMenu.AssociatedData

- (_TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onOpenAction);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onCloseAction);
  v5 = (objc_class *)type metadata accessor for PhotosMenu.AssociatedData();
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(PhotosMenu.AssociatedData *)&v7 init];
}

- (void).cxx_destruct
{
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onOpenAction));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC12PhotosUICoreP33_D60E6F91601E8B5A6706ADD365AE349710PhotosMenu14AssociatedData_onCloseAction);
  sub_1A9BB8934(v3);
}

@end