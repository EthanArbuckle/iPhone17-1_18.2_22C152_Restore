@interface TVRUIOldDeviceListCell
- (BOOL)showSeparator;
- (TVRUIDevice)device;
- (TVRUIOldDeviceListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TVRUIStyleProvider)styleProvider;
- (UIView)separator;
- (void)_applyFilterForDevice:(id)a3;
- (void)layoutSubviews;
- (void)setDevice:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setShowSeparator:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
@end

@implementation TVRUIOldDeviceListCell

- (TVRUIOldDeviceListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TVRUIOldDeviceListCell;
  v4 = [(TVRUIOldDeviceListCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] clearColor];
    [(TVRUIOldDeviceListCell *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x263F825C8] whiteColor];
    [(TVRUIOldDeviceListCell *)v4 setTintColor:v6];

    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separator = v4->_separator;
    v4->_separator = v7;

    [(TVRUIOldDeviceListCell *)v4 addSubview:v4->_separator];
  }
  return v4;
}

- (void)setDevice:(id)a3
{
  v12 = (TVRUIDevice *)a3;
  if (self->_device != v12)
  {
    objc_storeStrong((id *)&self->_device, a3);
    v5 = [(TVRUIOldDeviceListCell *)self imageView];
    v6 = [(TVRUIOldDeviceListCell *)self textLabel];
    v7 = [(TVRUIDevice *)v12 name];
    [v6 setText:v7];

    v8 = [(TVRUIDevice *)v12 model];
    v9 = [(TVRUIOldDeviceListCell *)self styleProvider];
    objc_super v10 = [v9 iconForDeviceModel:v8];

    v11 = [v10 _imageThatSuppressesAccessibilityHairlineThickening];
    [v5 setImage:v11];
    [v5 setContentMode:1];
  }
  [(TVRUIOldDeviceListCell *)self _applyFilterForDevice:v12];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)TVRUIOldDeviceListCell;
  [(TVRUIOldDeviceListCell *)&v20 layoutSubviews];
  v3 = [(TVRUIOldDeviceListCell *)self textLabel];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  if (self->_showSeparator)
  {
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    double MinX = CGRectGetMinX(v21);
    [(TVRUIOldDeviceListCell *)self bounds];
    double v13 = CGRectGetHeight(v22) + -1.0;
    [(TVRUIOldDeviceListCell *)self bounds];
    double Width = CGRectGetWidth(v23);
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    double v15 = Width - CGRectGetMinX(v24);
    v16 = [(TVRUIOldDeviceListCell *)self styleProvider];
    [v16 touchpadInsets];
    double v18 = v15 - v17;

    double v19 = 1.0;
  }
  else
  {
    double MinX = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  -[UIView setFrame:](self->_separator, "setFrame:", MinX, v13, v18, v19);
}

- (void)_applyFilterForDevice:(id)a3
{
  id v4 = a3;
  id v19 = [(TVRUIOldDeviceListCell *)self imageView];
  CGFloat v5 = [(TVRUIOldDeviceListCell *)self textLabel];
  double v6 = [(TVRUIOldDeviceListCell *)self styleProvider];
  CGFloat v7 = [v6 fontForDeviceListRow];
  [v5 setFont:v7];

  separator = self->_separator;
  CGFloat v9 = [(TVRUIOldDeviceListCell *)self styleProvider];
  double v10 = [v9 cellSeparatorBackgroundColor];
  [(UIView *)separator setBackgroundColor:v10];

  CGFloat v11 = [(TVRUIOldDeviceListCell *)self styleProvider];
  v12 = [v11 cellBackgroundColor];
  [(TVRUIOldDeviceListCell *)self setBackgroundColor:v12];

  LODWORD(v11) = [v4 isConnected];
  if (v11)
  {
    [(TVRUIOldDeviceListCell *)self setAccessoryType:3];
    double v13 = [(TVRUIOldDeviceListCell *)self styleProvider];
    v14 = [v13 colorForConnectedDevice];
    [v5 setTextColor:v14];

    double v15 = [(TVRUIOldDeviceListCell *)self styleProvider];
    [v15 colorForConnectedDevice];
  }
  else
  {
    [(TVRUIOldDeviceListCell *)self setAccessoryType:0];
    v16 = [(TVRUIOldDeviceListCell *)self styleProvider];
    double v17 = [v16 colorForDisconnectedDevice];
    [v5 setTextColor:v17];

    double v15 = [(TVRUIOldDeviceListCell *)self styleProvider];
    [v15 colorForDisconnectedDevice];
  double v18 = };
  [v19 setTintColor:v18];
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (void)setShowSeparator:(BOOL)a3
{
  self->_showSeparator = a3;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end