@interface PXMovePersonActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)systemImageNameForPerson:(id)a3;
- (NSArray)sourcePeople;
- (PXMovePersonActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (int64_t)destinationManualOrder;
- (int64_t)destinationType;
- (void)performBackgroundTask;
- (void)setDestinationManualOrder:(int64_t)a3;
- (void)setDestinationType:(int64_t)a3;
- (void)setSourcePeople:(id)a3;
@end

@implementation PXMovePersonActionPerformer

- (NSArray)sourcePeople
{
}

- (void)setSourcePeople:(id)a3
{
  sub_1A9B21070(0, (unint64_t *)&qword_1E981B820);
  uint64_t v4 = sub_1AB23AADC();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_sourcePeople);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)destinationManualOrder
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationManualOrder);
  swift_beginAccess();
  return *v2;
}

- (void)setDestinationManualOrder:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationManualOrder);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (int64_t)destinationType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationType);
  swift_beginAccess();
  return *v2;
}

- (void)setDestinationType:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationType);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

+ (BOOL)canPerformOn:(id)a3
{
  return 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  return 0;
}

+ (id)systemImageNameForPerson:(id)a3
{
  return 0;
}

- (void)performBackgroundTask
{
}

- (PXMovePersonActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1AB23A76C();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXMovePersonActionPerformer_sourcePeople) = (Class)MEMORY[0x1E4FBC860];
  uint64_t v9 = OBJC_IVAR___PXMovePersonActionPerformer_destinationManualOrder;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_1AB22FC7C();
  *(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR___PXMovePersonActionPerformer_destinationType) = (Class)-1;

  v13 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v16.receiver = v12;
  v16.super_class = ObjectType;
  v14 = [(PXAssetCollectionActionPerformer *)&v16 initWithActionType:v13 assetCollectionReference:v10 displayTitleInfo:v11];

  return v14;
}

- (void).cxx_destruct
{
}

@end