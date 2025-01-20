@interface PXScrollBehavior
+ (id)detentsBehaviorWithAxis:(int64_t)a3 detents:(id)a4 intrinsicContentOffset:(double)a5;
+ (id)normalBehaviorWithAxis:(int64_t)a3;
+ (id)normalBehaviorWithAxis:(int64_t)a3 intrinsicContentOffset:(double)a4;
+ (id)pagingBehaviorWithAxis:(int64_t)a3 pagingOrigin:(double)a4 pageOffset:(double)a5 decelerationRate:(int64_t)a6;
- (BOOL)allowFlickAcrossMultiplePages;
- (BOOL)pagingEnabled;
- (CGPoint)adjustedScrollTargetContentOffsetForProposedTargetContentOffset:(CGPoint)a3 velocity:(CGPoint)a4 currentContentOffset:(CGPoint)a5 decelerationRate:(int64_t *)a6;
- (PXScrollBehavior)init;
- (double)intrinsicContentOffset;
- (double)pageOffset;
- (double)pagingOrigin;
- (id)detentAtContentOffset:(double)a3;
- (int64_t)axis;
- (int64_t)decelerationRate;
@end

@implementation PXScrollBehavior

+ (id)normalBehaviorWithAxis:(int64_t)a3
{
  swift_getObjCClassMetadata();
  v4 = (void *)static PXScrollBehavior.normal(axis:)(a3);
  return v4;
}

+ (id)normalBehaviorWithAxis:(int64_t)a3 intrinsicContentOffset:(double)a4
{
  swift_getObjCClassMetadata();
  v6 = (void *)static PXScrollBehavior.normal(axis:intrinsicContentOffset:)(a3, a4);
  return v6;
}

+ (id)pagingBehaviorWithAxis:(int64_t)a3 pagingOrigin:(double)a4 pageOffset:(double)a5 decelerationRate:(int64_t)a6
{
  swift_getObjCClassMetadata();
  v10 = (void *)static PXScrollBehavior.paging(axis:pagingOrigin:pageOffset:decelerationRate:)(a3, a6, a4, a5);
  return v10;
}

+ (id)detentsBehaviorWithAxis:(int64_t)a3 detents:(id)a4 intrinsicContentOffset:(double)a5
{
  type metadata accessor for PXScrollDetent((uint64_t)a1);
  unint64_t v6 = sub_1AB23AADC();
  swift_getObjCClassMetadata();
  static PXScrollBehavior.detents(axis:detents:intrinsicContentOffset:)(a3, v6);
}

- (int64_t)axis
{
  if ((~*(_DWORD *)(self + OBJC_IVAR___PXScrollBehavior_behavior + 32) & 0xFELL) != 0) {
    return *(void *)(self + OBJC_IVAR___PXScrollBehavior_behavior);
  }
  __break(1u);
  return self;
}

- (int64_t)decelerationRate
{
  if ((~*(_DWORD *)(self + OBJC_IVAR___PXScrollBehavior_behavior + 32) & 0xFELL) != 0) {
    return *(void *)(self + OBJC_IVAR___PXScrollBehavior_behavior + 8);
  }
  __break(1u);
  return self;
}

- (BOOL)pagingEnabled
{
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    unsigned int v2 = *(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24];
    if (v2 <= 0x3F) {
      sub_1A9F93F18(*(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 8], *(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 16], *(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24]);
    }
    LOBYTE(self) = v2 < 0x40;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (double)pagingOrigin
{
  unsigned int v2 = (char *)self + OBJC_IVAR___PXScrollBehavior_behavior;
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    uint64_t v3 = 0;
    if (*(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] <= 0x3Fu)
    {
      uint64_t v3 = *((void *)v2 + 2);
      sub_1A9F93F18(v3, *((void *)v2 + 3), *(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24]);
    }
    return *(double *)&v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)pageOffset
{
  unsigned int v2 = (char *)self + OBJC_IVAR___PXScrollBehavior_behavior;
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    uint64_t v3 = 0;
    if (*(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] <= 0x3Fu)
    {
      uint64_t v3 = *((void *)v2 + 3);
      sub_1A9F93F18(*((void *)v2 + 2), v3, *(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24]);
    }
    return *(double *)&v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)allowFlickAcrossMultiplePages
{
  uint64_t v2 = *(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24];
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    if (*(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] > 0x3Fu)
    {
      char v3 = 0;
    }
    else
    {
      char v3 = v2 & 1;
      sub_1A9F93F18(*(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 8], *(void *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 16], v2);
    }
    LOBYTE(self) = v3;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (double)intrinsicContentOffset
{
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0) {
    return *(double *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 32];
  }
  __break(1u);
  return result;
}

- (id)detentAtContentOffset:(double)a3
{
  char v3 = self;
  PXScrollBehavior.detent(atContentOffset:)();
  v5 = v4;

  return v5;
}

- (CGPoint)adjustedScrollTargetContentOffsetForProposedTargetContentOffset:(CGPoint)a3 velocity:(CGPoint)a4 currentContentOffset:(CGPoint)a5 decelerationRate:(int64_t *)a6
{
  unint64_t v6 = self;
  PXScrollBehavior.adjustedScrollTargetContentOffset(forProposedTargetContentOffset:velocity:currentContentOffset:decelerationRate:)();
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (PXScrollBehavior)init
{
  uint64_t v2 = (_OWORD *)((char *)self + OBJC_IVAR___PXScrollBehavior_behavior);
  *uint64_t v2 = 0u;
  v2[1] = 0u;
  v2[2] = xmmword_1AB3005A0;
  v4.receiver = self;
  v4.super_class = (Class)PXScrollBehavior;
  return [(PXScrollBehavior *)&v4 init];
}

- (void).cxx_destruct
{
}

@end