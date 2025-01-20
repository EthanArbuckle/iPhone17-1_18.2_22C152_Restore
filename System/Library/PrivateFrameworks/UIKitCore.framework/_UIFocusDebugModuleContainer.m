@interface _UIFocusDebugModuleContainer
- (_UIFocusDebugModuleContainer)initWithModule:(id)a3;
@end

@implementation _UIFocusDebugModuleContainer

- (_UIFocusDebugModuleContainer)initWithModule:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UIFocusDebugModuleContainer;
  v5 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5 addSubview:v4];
    v17 = (void *)MEMORY[0x1E4F5B268];
    v22 = [(UIView *)v5 leadingAnchor];
    v21 = [v4 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [(UIView *)v5 bottomAnchor];
    v18 = [v4 bottomAnchor];
    v6 = [v19 constraintEqualToAnchor:v18];
    v24[1] = v6;
    v7 = [(UIView *)v5 trailingAnchor];
    v8 = [v4 trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v24[2] = v9;
    v10 = [(UIView *)v5 topAnchor];
    v11 = [v4 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v24[3] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v17 activateConstraints:v13];

    v14 = +[UIColor blackColor];
    v15 = [v14 colorWithAlphaComponent:0.6];
    [(UIView *)v5 setBackgroundColor:v15];
  }
  return v5;
}

@end