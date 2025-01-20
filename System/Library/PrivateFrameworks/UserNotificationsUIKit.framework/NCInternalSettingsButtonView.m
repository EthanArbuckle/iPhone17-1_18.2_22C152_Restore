@interface NCInternalSettingsButtonView
- (BOOL)isDeviceAuthenticated;
- (CGSize)sizeThatFits:(CGSize)result;
- (NCInternalSettingsButtonView)initWithCoder:(id)a3;
- (NCInternalSettingsButtonView)initWithFrame:(CGRect)a3;
- (NCInternalSettingsButtonViewDelegate)delegate;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIsDeviceAuthenticated:(BOOL)a3;
@end

@implementation NCInternalSettingsButtonView

- (NCInternalSettingsButtonViewDelegate)delegate
{
  v2 = (void *)MEMORY[0x1D9481D00]((char *)self + OBJC_IVAR___NCInternalSettingsButtonView_delegate, a2);

  return (NCInternalSettingsButtonViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDeviceAuthenticated
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated);
}

- (void)setIsDeviceAuthenticated:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated) = a3;
}

- (NCInternalSettingsButtonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_hostingController) = 0;
  v9.receiver = self;
  v9.super_class = (Class)NCInternalSettingsButtonView;
  return -[NCInternalSettingsButtonView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (NCInternalSettingsButtonView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_hostingController) = 0;
  id v5 = a3;

  result = (NCInternalSettingsButtonView *)sub_1D7D7FBD0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_hostingController);
  if (v3)
  {
    double height = result.height;
    double width = result.width;
    v6 = self;
    id v7 = objc_msgSend(v3, sel_view);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_sizeThatFits_, width, height);
      CGFloat v10 = v9;
      CGFloat v12 = v11;

      result.double width = v10;
      result.double height = v12;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  NCInternalSettingsButtonView.layoutSubviews()();
}

- (void).cxx_destruct
{
  sub_1D7D23880((uint64_t)self + OBJC_IVAR___NCInternalSettingsButtonView_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_hostingController);
}

@end