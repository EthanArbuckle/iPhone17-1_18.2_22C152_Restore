@interface TTRListBadgeView.SelectionLayer
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)init;
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)initWithCoder:(id)a3;
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)initWithLayer:(id)a3;
@end

@implementation TTRListBadgeView.SelectionLayer

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)init
{
  v2 = (char *)self
     + OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer_shape;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  v2[40] = 2;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRListBadgeView.SelectionLayer();
  v3 = [(TTRNoDefaultImplicitActionLayer *)&v5 init];
  [(TTRListBadgeView.SelectionLayer *)v3 setBackgroundColor:0];
  return v3;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B9970200();
  swift_unknownObjectRelease();
  v4 = (char *)self
     + OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer_shape;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v4[40] = 2;
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = sub_1B9970B90();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRListBadgeView.SelectionLayer();
  v6 = [(TTRNoDefaultImplicitActionLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  [(TTRListBadgeView.SelectionLayer *)v6 setBackgroundColor:0];
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)initWithCoder:(id)a3
{
  v4 = (char *)self
     + OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer_shape;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v4[40] = 2;
  id v5 = a3;

  result = (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer *)sub_1B99708A0();
  __break(1u);
  return result;
}

@end