@interface SBPIPMenuButton
+ (id)pipMenuButton;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation SBPIPMenuButton

+ (id)pipMenuButton
{
  v2 = [a1 buttonWithType:1];
  v3 = (void *)MEMORY[0x1E4F42A30];
  [MEMORY[0x1E4F42A30] buttonFontSize];
  v4 = objc_msgSend(v3, "systemFontOfSize:weight:");
  v5 = [MEMORY[0x1E4F42A98] configurationWithFont:v4];
  v6 = [MEMORY[0x1E4F42A80] systemImageNamed:@"plus.rectangle.on.rectangle" withConfiguration:v5];
  [v2 setImage:v6 forState:0];
  [v2 setShowsMenuAsPrimaryAction:1];
  v7 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  [v2 setBackgroundColor:v7];

  v8 = [MEMORY[0x1E4F428B8] labelColor];
  [v2 setTintColor:v8];

  return v2;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SBPIPMenuButton;
  id v8 = a5;
  [(SBPIPMenuButton *)&v10 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:v8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__SBPIPMenuButton_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E6AF4AC0;
  v9[4] = self;
  [v8 addAnimations:v9];
}

uint64_t __83__SBPIPMenuButton_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SBPIPMenuButton;
  id v8 = a5;
  [(SBPIPMenuButton *)&v10 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:v8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SBPIPMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E6AF4AC0;
  v9[4] = self;
  [v8 addAnimations:v9];
}

uint64_t __75__SBPIPMenuButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end