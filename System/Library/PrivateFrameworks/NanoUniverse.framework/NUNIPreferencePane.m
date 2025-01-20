@interface NUNIPreferencePane
- (NUNIPreferencePane)initWithPreferencePane:(id)a3;
- (NUNIPreferencePane)initWithSliders:(id)a3 toggles:(id)a4 pickerOptions:(id)a5 pickerSelections:(id)a6;
- (NUNIPreferencePaneDelegate)delegate;
- (void)preferencePaneDidChangeWithPreference:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NUNIPreferencePane

- (NUNIPreferencePane)initWithSliders:(id)a3 toggles:(id)a4 pickerOptions:(id)a5 pickerSelections:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [_TtC12NanoUniverse14PreferencePane alloc];
  v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v16 = [(PreferencePane *)v14 initWithName:&stru_26CFE0548 userDefaults:v15 sliders:v13 toggles:v12 pickerOptions:v11 pickerSelections:v10];

  v17 = [(NUNIPreferencePane *)self initWithPreferencePane:v16];
  return v17;
}

- (NUNIPreferencePane)initWithPreferencePane:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUNIPreferencePane;
  v6 = [(NUNIPreferencePane *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preference, a3);
  }

  return v7;
}

- (void)preferencePaneDidChangeWithPreference:(id)a3
{
  id v4 = [(NUNIPreferencePane *)self delegate];
  [v4 preferencePaneDidChange:self];
}

- (NUNIPreferencePaneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NUNIPreferencePaneDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preference, 0);
}

@end