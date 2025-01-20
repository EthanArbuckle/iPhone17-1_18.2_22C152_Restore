@interface TTRIPermissionsWarmingSheetViewController
- (NSString)title;
- (_TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)setTitle:(id)a3;
@end

@implementation TTRIPermissionsWarmingSheetViewController

- (NSString)title
{
  v2 = self;
  id v3 = sub_1B9817750();
  id v4 = TTRIPermissionsWarmingSheetView.titleLabel.getter();

  id v5 = objc_msgSend(v4, sel_text);
  if (v5)
  {
    sub_1B996E9F0();

    v6 = (void *)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    sub_1B996E9F0();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  id v7 = sub_1B9817750();
  id v8 = TTRIPermissionsWarmingSheetView.titleLabel.getter();

  if (v5)
  {
    id v9 = (id)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  objc_msgSend(v8, sel_setText_, v9);
}

- (void)loadView
{
  v2 = self;
  id v3 = sub_1B9817750();
  [(TTRIPermissionsWarmingSheetViewController *)v2 setView:v3];
}

- (_TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1B996E9F0();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView) = 0;
    id v8 = a4;
    a3 = (id)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView) = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(TTRIPermissionsWarmingSheetViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TTRIPermissionsWarmingSheetViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore41TTRIPermissionsWarmingSheetViewController____lazy_storage___permissionsPromptView));
}

@end