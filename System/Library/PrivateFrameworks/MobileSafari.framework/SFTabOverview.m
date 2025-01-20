@interface SFTabOverview
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (SFTabOverview)initWithCoder:(id)a3;
- (SFTabOverview)initWithFrame:(CGRect)a3;
- (int64_t)indexInAllItemsForItemView:(id)a3;
- (int64_t)totalItemCount;
- (void)contentSizeCategoryDidChange;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation SFTabOverview

- (void)scrollViewDidScroll:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___SFTabOverview_closingItemsContainerView);
  id v5 = a3;
  v6 = self;
  id v7 = sub_18C3D5638();
  objc_msgSend(v7, sel_bounds);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v4, sel_setBounds_, v9, v11, v13, v15);
  [(SFTabOverview *)v6 setNeedsLayout];
  v16 = *(void (**)(uint64_t))((char *)&v6->super.super.super.super.isa + OBJC_IVAR___SFTabOverview_didScroll);
  uint64_t v17 = sub_18C6F7B98();
  v16(v17);

  swift_release();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18C3849D8();
}

- (SFTabOverview)initWithCoder:(id)a3
{
  return (SFTabOverview *)sub_18C539684(a3);
}

- (void)contentSizeCategoryDidChange
{
  v2 = self;
  sub_18C53AB88();
}

- (int64_t)indexInAllItemsForItemView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = sub_18C53C1B8(v4);

  return v6;
}

- (int64_t)totalItemCount
{
  long long v2 = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.bottom + OBJC_IVAR___SFTabOverview_content);
  v13[8] = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.top + OBJC_IVAR___SFTabOverview_content);
  v13[9] = v2;
  long long v3 = *(_OWORD *)((char *)&self->super.super._minXVariable + OBJC_IVAR___SFTabOverview_content);
  v13[10] = *(_OWORD *)((char *)&self->super.super._layer + OBJC_IVAR___SFTabOverview_content);
  v13[11] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super.super._gestureRecognizers + OBJC_IVAR___SFTabOverview_content);
  v13[4] = *(_OWORD *)((char *)&self->super.super._subviewCache + OBJC_IVAR___SFTabOverview_content);
  v13[5] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR___SFTabOverview_content + 16);
  v13[6] = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR___SFTabOverview_content);
  v13[7] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity + OBJC_IVAR___SFTabOverview_content);
  v13[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___SFTabOverview_content);
  v13[1] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super._traitChangeRegistry + OBJC_IVAR___SFTabOverview_content);
  v13[2] = *(_OWORD *)((char *)&self->super.super._cachedTraitCollection + OBJC_IVAR___SFTabOverview_content);
  v13[3] = v7;
  double v8 = self;
  sub_18C3BDBC0((uint64_t)v13);
  uint64_t v9 = sub_18C6F7DE8();
  uint64_t v10 = sub_18C544FB4(v9);
  swift_bridgeObjectRelease();
  sub_18C3BDA80((uint64_t)v13);
  int64_t v11 = *(void *)(v10 + 16);

  swift_bridgeObjectRelease();
  return v11;
}

- (BOOL)becomeFirstResponder
{
  return sub_18C53D5E0(self, (uint64_t)a2, (SEL *)&selRef_becomeFirstResponder);
}

- (BOOL)canBecomeFirstResponder
{
  return sub_18C53D5E0(self, (uint64_t)a2, (SEL *)&selRef_canBecomeFirstResponder);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a5->x;
  double y = a5->y;
  uint64_t v9 = *(double (**)(double, double))(**(void **)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___SFTabOverview_gridLayout)
                                               + 1096);
  id v10 = a3;
  double v12 = self;
  a5->double x = v9(x, y);
  a5->double y = v11;
}

- (SFTabOverview)initWithFrame:(CGRect)a3
{
  result = (SFTabOverview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(UIViewController **)((char *)&self->super.super._viewDelegate + OBJC_IVAR___SFTabOverview_configuration);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v10, (char *)self + OBJC_IVAR___SFTabOverview_handlers, sizeof(v10));
  sub_18C3BDDC4((uint64_t)v10);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.bottom + OBJC_IVAR___SFTabOverview_content);
  v11[8] = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.top + OBJC_IVAR___SFTabOverview_content);
  v11[9] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super._minXVariable + OBJC_IVAR___SFTabOverview_content);
  v11[10] = *(_OWORD *)((char *)&self->super.super._layer + OBJC_IVAR___SFTabOverview_content);
  v11[11] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super._gestureRecognizers + OBJC_IVAR___SFTabOverview_content);
  v11[4] = *(_OWORD *)((char *)&self->super.super._subviewCache + OBJC_IVAR___SFTabOverview_content);
  v11[5] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR___SFTabOverview_content + 16);
  v11[6] = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR___SFTabOverview_content);
  v11[7] = v7;
  long long v8 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity + OBJC_IVAR___SFTabOverview_content);
  v11[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___SFTabOverview_content);
  v11[1] = v8;
  long long v9 = *(_OWORD *)((char *)&self->super.super._traitChangeRegistry + OBJC_IVAR___SFTabOverview_content);
  v11[2] = *(_OWORD *)((char *)&self->super.super._cachedTraitCollection + OBJC_IVAR___SFTabOverview_content);
  v11[3] = v9;
  sub_18C3BDA80((uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFTabOverview_targetScrollPositionForNextLayoutPass, (uint64_t *)&unk_1E9176D70);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabOverview____lazy_storage___collectionView));

  swift_unknownObjectWeakDestroy();
}

@end