@interface _UICollectionViewFeedbackLoopDebugger
- (_UICollectionViewFeedbackLoopDebugger)init;
- (void)printCollectedRecordsForCollectionView:(id)a3 raiseException:(BOOL)a4;
- (void)recordCollectionViewInsetsPropertyChange:(id)a3 fromInsets:(UIEdgeInsets)a4 toInsets:(UIEdgeInsets)a5;
- (void)recordCollectionViewPointPropertyChange:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5;
- (void)recordCollectionViewRectPropertyChange:(id)a3 fromRect:(CGRect)a4 toRect:(CGRect)a5;
- (void)recordGenericChangeWithMessage:(id)a3;
- (void)recordInvalidationWithContext:(id)a3;
- (void)recordPreferredAttributesChangeForElementWithAttributes:(id)a3 reason:(id)a4 changedAttribute:(id)a5 fromValue:(id)a6 toValue:(id)a7 layoutGeneratedValue:(id)a8;
- (void)recordUpdateVisibleCellsScheduledWithCallStack:(id)a3;
@end

@implementation _UICollectionViewFeedbackLoopDebugger

- (void)recordPreferredAttributesChangeForElementWithAttributes:(id)a3 reason:(id)a4 changedAttribute:(id)a5 fromValue:(id)a6 toValue:(id)a7 layoutGeneratedValue:(id)a8
{
  uint64_t v23 = sub_186A1E95C();
  uint64_t v14 = v13;
  uint64_t v15 = sub_186A1E95C();
  uint64_t v17 = v16;
  id v18 = a3;
  id v22 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = self;
  sub_18599C9A4(v18, v23, v14, v15, v17, a6, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)recordCollectionViewRectPropertyChange:(id)a3 fromRect:(CGRect)a4 toRect:(CGRect)a5
{
}

- (void)recordCollectionViewPointPropertyChange:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v7 = a4.y;
  CGFloat v8 = a4.x;
  uint64_t v10 = sub_186A1E95C();
  uint64_t v12 = v11;
  uint64_t v13 = (void **)((char *)self + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_currentlyTrackedChangeRecords);
  swift_beginAccess();
  uint64_t v14 = *v13;
  uint64_t v15 = self;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v13 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v14 = sub_185917A74(0, v14[2] + 1, 1, v14);
    *uint64_t v13 = v14;
  }
  unint64_t v18 = v14[2];
  unint64_t v17 = v14[3];
  if (v18 >= v17 >> 1)
  {
    uint64_t v14 = sub_185917A74((void *)(v17 > 1), v18 + 1, 1, v14);
    *uint64_t v13 = v14;
  }
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB3DD8);
  uint64_t v22 = sub_1854B2C88(&qword_1E8FB3DE0, &qword_1E8FB3DD8);
  id v19 = (CGFloat *)swift_allocObject();
  *(void *)&long long v20 = v19;
  *((void *)v19 + 2) = v10;
  *((void *)v19 + 3) = v12;
  v19[4] = v8;
  v19[5] = v7;
  v19[6] = x;
  v19[7] = y;
  v14[2] = v18 + 1;
  sub_1854B1F20(&v20, (uint64_t)&v14[5 * v18 + 4]);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)recordCollectionViewInsetsPropertyChange:(id)a3 fromInsets:(UIEdgeInsets)a4 toInsets:(UIEdgeInsets)a5
{
}

- (void)recordGenericChangeWithMessage:(id)a3
{
  uint64_t v4 = sub_186A1E95C();
  uint64_t v6 = v5;
  CGFloat v7 = (void **)((char *)self + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_currentlyTrackedChangeRecords);
  swift_beginAccess();
  CGFloat v8 = *v7;
  v9 = self;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *CGFloat v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    CGFloat v8 = sub_185917A74(0, v8[2] + 1, 1, v8);
    *CGFloat v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    CGFloat v8 = sub_185917A74((void *)(v11 > 1), v12 + 1, 1, v8);
    *CGFloat v7 = v8;
  }
  uint64_t v14 = MEMORY[0x1E4FBB1A0];
  uint64_t v15 = &off_1ED0BBBB8;
  *(void *)&long long v13 = v4;
  *((void *)&v13 + 1) = v6;
  v8[2] = v12 + 1;
  sub_1854B1F20(&v13, (uint64_t)&v8[5 * v12 + 4]);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)recordInvalidationWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18599D20C(v4);
}

- (void)recordUpdateVisibleCellsScheduledWithCallStack:(id)a3
{
  uint64_t v4 = sub_186A1EB3C();
  uint64_t v5 = self;
  sub_18599D3B8(v4);

  swift_bridgeObjectRelease();
}

- (void)printCollectedRecordsForCollectionView:(id)a3 raiseException:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CGFloat v7 = self;
  sub_18599D588(v6, v4);
}

- (_UICollectionViewFeedbackLoopDebugger)init
{
  v2 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_currentlyTrackedChangeRecords) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_invalidationRecords) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_updateVisibleCellsRecords) = v2;
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewFeedbackLoopDebugger;
  return [(_UICollectionViewFeedbackLoopDebugger *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end