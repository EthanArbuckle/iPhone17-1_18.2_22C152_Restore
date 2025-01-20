@interface AEMarkupBarButtonItem
- (AEMarkupBarButtonItem)init;
- (AEMarkupBarButtonItem)initWithCoder:(id)a3;
- (BOOL)isEnabled;
- (BOOL)selected;
- (SEL)action;
- (id)target;
- (void)setAction:(SEL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTarget:(id)a3;
@end

@implementation AEMarkupBarButtonItem

- (AEMarkupBarButtonItem)initWithCoder:(id)a3
{
  result = (AEMarkupBarButtonItem *)sub_139520();
  __break(1u);
  return result;
}

- (AEMarkupBarButtonItem)init
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for MarkupButtonContainerView());
  v4 = self;
  v5 = [v3 initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR___AEMarkupBarButtonItem_toggleView) = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  v6 = [(AEMarkupBarButtonItem *)&v8 init];
  [(AEMarkupBarButtonItem *)v6 setCustomView:*(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR___AEMarkupBarButtonItem_toggleView)];
  return v6;
}

- (id)target
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  id v2 = [(AEMarkupBarButtonItem *)&v4 target];

  return v2;
}

- (void)setTarget:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_12A428((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (SEL)action
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  return [(AEMarkupBarButtonItem *)&v3 action];
}

- (void)setAction:(SEL)a3
{
  objc_super v4 = self;
  sub_12A120((uint64_t)a3);
}

- (BOOL)selected
{
  return sub_12A2FC(self, (uint64_t)a2, (SEL *)&selRef_selected);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  objc_super v4 = (char *)v7.receiver;
  [(AEMarkupBarButtonItem *)&v7 setSelected:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR___AEMarkupBarButtonItem_toggleView];
  unsigned __int8 v6 = [v4 selected];
  *(unsigned char *)(v5 + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_selected) = v6;
  sub_124F94();
}

- (BOOL)isEnabled
{
  return sub_12A2FC(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MarkupBarButtonItem();
  objc_super v4 = (char *)v6.receiver;
  [(AEMarkupBarButtonItem *)&v6 setEnabled:v3];
  id v5 = objc_retain(*(id *)(*(void *)&v4[OBJC_IVAR___AEMarkupBarButtonItem_toggleView]
                         + OBJC_IVAR____TtC13AEBookPlugins25MarkupButtonContainerView_button));
  [v5 setEnabled:[v4 isEnabled]];
}

- (void).cxx_destruct
{
}

@end