@interface PRQuickActionControlView
- (BOOL)isSelected;
- (PRQuickActionControlView)initWithControl:(id)a3 type:(unint64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
@end

@implementation PRQuickActionControlView

- (PRQuickActionControlView)initWithControl:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRQuickActionControlView;
  v7 = [(PRQuickActionControlView *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F58F30] instanceWithControl:v6 type:a4 content:1];
    controlInstance = v7->_controlInstance;
    v7->_controlInstance = (CHUISControlInstance *)v8;

    [(CHUISControlInstance *)v7->_controlInstance activate];
    uint64_t v10 = [(CHUISControlInstance *)v7->_controlInstance iconView];
    iconView = v7->_iconView;
    v7->_iconView = (CHUISControlIconView *)v10;

    [(CHUISControlIconView *)v7->_iconView setOverrideUserInterfaceStyle:1];
    [(PRQuickActionControlView *)v7 addSubview:v7->_iconView];
    [(CHUISControlInstance *)v7->_controlInstance setVisibility:2];
  }

  return v7;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PRQuickActionControlView;
  [(PRQuickActionControlView *)&v6 layoutSubviews];
  iconView = self->_iconView;
  [(PRQuickActionControlView *)self bounds];
  -[CHUISControlIconView setFrame:](iconView, "setFrame:");
  [(PRQuickActionControlView *)self bounds];
  v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v4 * 0.368 weight:*MEMORY[0x1E4FB09E0]];
  [(CHUISControlIconView *)self->_iconView setFont:v5];
}

- (void)dealloc
{
  [(CHUISControlInstance *)self->_controlInstance setVisibility:0];
  [(CHUISControlInstance *)self->_controlInstance invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRQuickActionControlView;
  [(PRQuickActionControlView *)&v3 dealloc];
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3) {
    self->_selected = a3;
  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_controlInstance, 0);
}

@end