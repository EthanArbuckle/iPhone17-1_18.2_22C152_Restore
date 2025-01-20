@interface PhotosPagingLayoutSpecManager
- (Class)specClass;
- (_TtC12PhotosUICore29PhotosPagingLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (id)createSpec;
@end

@implementation PhotosPagingLayoutSpecManager

- (id)createSpec
{
  v2 = self;
  v3 = [(PXFeatureSpecManager *)v2 extendedTraitCollection];
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PhotosPagingLayoutSpec()), sel_initWithExtendedTraitCollection_options_, v3, -[PXFeatureSpecManager options](v2, sel_options));

  if (v4)
  {

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (Class)specClass
{
  type metadata accessor for PhotosPagingLayoutSpec();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC12PhotosUICore29PhotosPagingLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosPagingLayoutSpecManager();
  return [(PXFeatureSpecManager *)&v7 initWithExtendedTraitCollection:a3 options:a4];
}

@end