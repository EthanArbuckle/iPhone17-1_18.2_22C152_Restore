@interface BlurView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView)initWithCoder:(id)a3;
- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation BlurView

- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView)initWithEffect:(id)a3
{
  id v4 = a3;
  return (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView *)sub_1B94DD934(a3);
}

- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(BlurView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  CGRect v5 = CGRectInset(v4, 8.0, 8.0);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView_label], sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGRect v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView_label);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v14.size.double width = v7;
  v14.size.double height = v8;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  CGRect v15 = CGRectInset(v14, -8.0, -8.0);
  CGFloat v9 = v15.size.width;
  CGFloat v10 = v15.size.height;

  double v11 = v9;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB8BlurView_label));
}

@end