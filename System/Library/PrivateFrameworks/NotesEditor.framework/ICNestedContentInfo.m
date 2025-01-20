@interface ICNestedContentInfo
- (ICNestedContentInfo)init;
@end

@implementation ICNestedContentInfo

- (ICNestedContentInfo)init
{
  v2 = (_OWORD *)((char *)self + OBJC_IVAR___ICNestedContentInfo_frame);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICNestedContentInfo_contentSize);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICNestedContentInfo_contentOffset);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (_OWORD *)((char *)self + OBJC_IVAR___ICNestedContentInfo_scrollBounds);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR___ICNestedContentInfo_adjustedContentInset);
  long long v7 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  _OWORD *v6 = *MEMORY[0x263F834E8];
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NestedContentInfo();
  return [(ICNestedContentInfo *)&v9 init];
}

@end