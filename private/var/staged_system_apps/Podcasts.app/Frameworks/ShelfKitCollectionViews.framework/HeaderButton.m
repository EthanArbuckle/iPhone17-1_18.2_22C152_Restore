@interface HeaderButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC23ShelfKitCollectionViews12HeaderButton)init;
- (_TtC23ShelfKitCollectionViews12HeaderButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews12HeaderButton)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation HeaderButton

- (_TtC23ShelfKitCollectionViews12HeaderButton)init
{
  swift_getObjectType();
  if (qword_46FFF8 != -1) {
    swift_once();
  }
  v4[0] = qword_49E150;
  v4[1] = *(void *)algn_49E158;
  v4[2] = qword_49E160;
  v4[3] = qword_49E168;
  v4[4] = qword_49E170;
  v4[5] = qword_49E178;
  v4[6] = qword_49E180;
  v4[7] = qword_49E188;
  v4[8] = qword_49E190;
  v4[9] = qword_49E198;
  v4[10] = qword_49E1A0;
  __int16 v5 = word_49E1A8;
  sub_F20C((void *)qword_49E150, *(uint64_t *)algn_49E158, qword_49E160, qword_49E168, qword_49E170, qword_49E178, (void *)qword_49E180, qword_49E188, qword_49E190, qword_49E198, qword_49E1A0, word_49E1A8, SHIBYTE(word_49E1A8));
  v2 = sub_371570((uint64_t)v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC23ShelfKitCollectionViews12HeaderButton *)v2;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeaderButton();
  id v2 = v4.receiver;
  [(HeaderButton *)&v4 tintColorDidChange];
  id v3 = [v2 tintColor];
  [v2 setTitleColor:v3 forState:0];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = *(double *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin);
  double v8 = *(double *)&self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin];
  double v9 = *(double *)&self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin
                                         + 8];
  double v10 = *(double *)&self->super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin
                                          + 16];
  id v11 = a4;
  v12 = self;
  [(HeaderButton *)v12 bounds];
  v20.origin.CGFloat x = v13 - v8;
  v20.origin.CGFloat y = v14 - v7;
  v20.size.width = v8 + v10 + v15;
  v20.size.height = v7 + v9 + v16;
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  BOOL v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (_TtC23ShelfKitCollectionViews12HeaderButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v7 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  double v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin);
  *double v8 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HeaderButton();
  return -[DynamicTypeButton initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews12HeaderButton)initWithCoder:(id)a3
{
  objc_super v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12HeaderButton_touchOutsideMargin);
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *objc_super v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HeaderButton();
  return [(DynamicTypeButton *)&v7 initWithCoder:a3];
}

@end