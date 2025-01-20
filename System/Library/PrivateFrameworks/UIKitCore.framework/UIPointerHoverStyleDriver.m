@interface UIPointerHoverStyleDriver
- (_TtC5UIKit25UIPointerHoverStyleDriver)init;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation UIPointerHoverStyleDriver

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_185ADA538();

  return v9;
}

- (_TtC5UIKit25UIPointerHoverStyleDriver)init
{
  result = (_TtC5UIKit25UIPointerHoverStyleDriver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_185637C44((uint64_t)self + OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__effect);
  v3 = *(void **)&self->_shape[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 8];
  sub_185638FA4(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape), *(void *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape], *(void *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 8], *(void *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 16], *(void *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 24], *(void *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 32], *(void *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 40], self->_shape[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape]);

  swift_unknownObjectWeakDestroy();
  sub_1853B93B8((uint64_t)self + OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver_host, &qword_1E8FAF480);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver_pointerInteraction);
}

@end