@interface TFFeedbackFormGroupToggleCell
- (TFFeedbackEntryGroupToggle)groupToggleEntry;
- (TFFeedbackFormGroupToggleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UISwitch)toggleSwitch;
- (unint64_t)displayableDataType;
- (void)applyContentsOfEntry:(id)a3;
- (void)didUpdateToggleSwitchValue:(id)a3;
- (void)prepareForReuse;
- (void)setDisplayedDataGroupInclusionBool:(BOOL)a3;
- (void)setGroupToggleEntry:(id)a3;
@end

@implementation TFFeedbackFormGroupToggleCell

- (TFFeedbackFormGroupToggleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TFFeedbackFormGroupToggleCell;
  v4 = [(TFFeedbackFormBaseCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1CA10]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    toggleSwitch = v4->_toggleSwitch;
    v4->_toggleSwitch = (UISwitch *)v6;

    [(UISwitch *)v4->_toggleSwitch addTarget:v4 action:sel_didUpdateToggleSwitchValue_ forControlEvents:4096];
    [(TFFeedbackFormGroupToggleCell *)v4 setAccessoryView:v4->_toggleSwitch];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TFFeedbackFormGroupToggleCell;
  [(TFFeedbackFormGroupToggleCell *)&v3 prepareForReuse];
  [(TFFeedbackFormGroupToggleCell *)self setGroupToggleEntry:0];
}

- (void)applyContentsOfEntry:(id)a3
{
  id v7 = a3;
  if ([v7 type] == 2)
  {
    [(TFFeedbackFormGroupToggleCell *)self setGroupToggleEntry:v7];
    v4 = [(TFFeedbackFormGroupToggleCell *)self groupToggleEntry];
    id v5 = [v4 title];
    uint64_t v6 = [(TFFeedbackFormGroupToggleCell *)self textLabel];
    [v6 setText:v5];
  }
}

- (unint64_t)displayableDataType
{
  return 2;
}

- (void)setDisplayedDataGroupInclusionBool:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TFFeedbackFormGroupToggleCell *)self toggleSwitch];
  [v4 setOn:v3];
}

- (void)didUpdateToggleSwitchValue:(id)a3
{
  id v4 = [(TFFeedbackFormGroupToggleCell *)self groupToggleEntry];

  if (v4)
  {
    id v7 = [(TFFeedbackFormBaseCell *)self updateProxy];
    id v5 = [(TFFeedbackFormGroupToggleCell *)self groupToggleEntry];
    uint64_t v6 = [(TFFeedbackFormGroupToggleCell *)self toggleSwitch];
    objc_msgSend(v7, "didUpdateEntry:toGroupInclusionBool:", v5, objc_msgSend(v6, "isOn"));
  }
}

- (UISwitch)toggleSwitch
{
  return self->_toggleSwitch;
}

- (TFFeedbackEntryGroupToggle)groupToggleEntry
{
  return self->_groupToggleEntry;
}

- (void)setGroupToggleEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupToggleEntry, 0);

  objc_storeStrong((id *)&self->_toggleSwitch, 0);
}

@end