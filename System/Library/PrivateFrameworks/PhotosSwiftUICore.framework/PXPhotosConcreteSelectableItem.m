@interface PXPhotosConcreteSelectableItem
- (BOOL)isEqual:(id)a3;
- (NSString)selectionIdentifier;
- (PXPhotosConcreteSelectableItem)init;
- (PXPhotosConcreteSelectableItem)initWithSelectionIdentifier:(id)a3;
- (int64_t)hash;
@end

@implementation PXPhotosConcreteSelectableItem

- (PXPhotosConcreteSelectableItem)initWithSelectionIdentifier:(id)a3
{
  uint64_t v3 = sub_259C445A8();
  return (PXPhotosConcreteSelectableItem *)sub_259BC37AC(v3, v4);
}

- (NSString)selectionIdentifier
{
  v2 = self;
  sub_259BC3984();

  uint64_t v3 = (void *)sub_259C44578();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_259C44E08();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_259BC3A1C((uint64_t)v8);

  sub_2599E5484((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_259BC3BF4();

  return v3;
}

- (PXPhotosConcreteSelectableItem)init
{
}

- (void).cxx_destruct
{
}

@end