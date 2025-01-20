@interface SBAppProtectionShieldView
- (SBAppProtectionShieldView)initWithAssistant:(id)a3 systemAppOutlet:(id)a4;
- (void)shieldViewUnlockButtonPressed:(id)a3;
@end

@implementation SBAppProtectionShieldView

- (SBAppProtectionShieldView)initWithAssistant:(id)a3 systemAppOutlet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBAppProtectionShieldView;
  v9 = -[SBAppProtectionShieldView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    p_assistant = (id *)&v9->_assistant;
    objc_storeStrong((id *)&v9->_assistant, a3);
    id v12 = objc_alloc(MEMORY[0x1E4F4B820]);
    v13 = [*p_assistant appProtectionApplication];
    v14 = (void *)[v12 initWithApplication:v13];

    v15 = [*p_assistant displayName];
    [v14 setLocalizedName:v15];

    [v14 setDelegate:v10];
    [v14 setOutlet:v8];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F4B818]) initWithConfig:v14];
    baseShieldView = v10->_baseShieldView;
    v10->_baseShieldView = (APBaseShieldView *)v16;

    [(APBaseShieldView *)v10->_baseShieldView setAutoresizingMask:18];
    [(SBAppProtectionShieldView *)v10 addSubview:v10->_baseShieldView];
  }
  return v10;
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_baseShieldView, 0);
}

@end