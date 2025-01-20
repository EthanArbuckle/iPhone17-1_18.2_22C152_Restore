@interface ResizableLabel
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12PhotosUICore14ResizableLabel)initWithCoder:(id)a3;
- (_TtC12PhotosUICore14ResizableLabel)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation ResizableLabel

- (_TtC12PhotosUICore14ResizableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC12PhotosUICore14ResizableLabel *)ResizableLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12PhotosUICore14ResizableLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  _s12PhotosUICore14ResizableLabelC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore14ResizableLabel_targetLabel), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ResizableLabel();
  [(ResizableLabel *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ResizableLabel();
  v15.receiver = self;
  v15.super_class = v8;
  v9 = self;
  [(ResizableLabel *)&v15 frame];
  v17.origin.double x = v10;
  v17.origin.double y = v11;
  v17.size.double width = v12;
  v17.size.double height = v13;
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (!CGRectEqualToRect(v16, v17)) {
    sub_1A9EEE770(0.0, 0.0, width, height);
  }
  v14.receiver = v9;
  v14.super_class = v8;
  -[ResizableLabel setFrame:](&v14, sel_setFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore14ResizableLabel_newLabel);
}

@end