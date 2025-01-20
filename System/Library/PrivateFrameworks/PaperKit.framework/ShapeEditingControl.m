@interface ShapeEditingControl
- (BOOL)isUserInteractionEnabled;
- (_TtC8PaperKit19ShapeEditingControl)initWithCoder:(id)a3;
- (_TtC8PaperKit19ShapeEditingControl)initWithFrame:(CGRect)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation ShapeEditingControl

- (_TtC8PaperKit19ShapeEditingControl)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ShapeEditingControl.init(coder:)();
}

- (BOOL)isUserInteractionEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ShapeEditingControl *)&v3 isUserInteractionEnabled];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v4 = self;
  ShapeEditingControl.isUserInteractionEnabled.setter(a3);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_presentedViewController);
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();

  if (v7) {
    int64_t v8 = -2;
  }
  else {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = self;
  id v9 = objc_msgSend(v6, sel_presentedViewController);
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();

  if (v10) {
    int64_t v11 = -2;
  }
  else {
    int64_t v11 = -1;
  }

  return v11;
}

- (_TtC8PaperKit19ShapeEditingControl)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit19ShapeEditingControl_nonDynamicButtonBackgroundColor);
}

@end