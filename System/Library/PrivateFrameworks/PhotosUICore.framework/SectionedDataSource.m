@interface SectionedDataSource
- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3;
- (_TtC12PhotosUICore19SectionedDataSource)init;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation SectionedDataSource

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList), *(int64_t *)((char *)&self->super._totalNumberOfItemsCache+ OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList));
  v4 = self;
  sub_1AB234F5C();
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item = a3->item;
  v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList);
  uint64_t v6 = v5[3];
  uint64_t v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v11);
  v8 = self;
  MEMORY[0x1AD100B20](item, v6, v7);
  __swift_project_boxed_opaque_existential_1(v11, AssociatedTypeWitness);
  v10[3] = swift_getAssociatedTypeWitness();
  v10[4] = swift_getAssociatedConformanceWitness();
  v10[5] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v10);
  sub_1AB234E7C();
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item = a3->item;
  v4 = self;
  SectionedDataSource.objects(in:)((uint64_t)v4, v5, item);
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList), *(int64_t *)((char *)&self->super._totalNumberOfItemsCache+ OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList));
  swift_getObjectType();
  swift_unknownObjectRetain_n();
  uint64_t v5 = self;
  sub_1AB234F9C();
}

- (_TtC12PhotosUICore19SectionedDataSource)init
{
  result = (_TtC12PhotosUICore19SectionedDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end