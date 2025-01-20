@interface PhotosPagingLayoutSpec
- (_TtC12PhotosUICore22PhotosPagingLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
@end

@implementation PhotosPagingLayoutSpec

- (_TtC12PhotosUICore22PhotosPagingLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PhotosPagingLayoutSpec_interPageSpacing) = (Class)0x4024000000000000;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosPagingLayoutSpec();
  return [(PXFeatureSpec *)&v7 initWithExtendedTraitCollection:a3 options:a4];
}

@end