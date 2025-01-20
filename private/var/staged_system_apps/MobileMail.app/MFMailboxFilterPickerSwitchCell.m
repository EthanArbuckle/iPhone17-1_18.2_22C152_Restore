@interface MFMailboxFilterPickerSwitchCell
- (MFMailboxFilterPickerSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MFMailboxFilterPickerSwitchCellDelegate)delegate;
- (UISwitch)selectionSwitch;
- (void)_handleSwitchValueChange;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectionSwitch:(id)a3;
@end

@implementation MFMailboxFilterPickerSwitchCell

- (MFMailboxFilterPickerSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFMailboxFilterPickerSwitchCell;
  v7 = [(MFMailboxFilterPickerCell *)&v11 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = (UISwitch *)objc_alloc_init((Class)UISwitch);
    selectionSwitch = v7->_selectionSwitch;
    v7->_selectionSwitch = v8;

    [(UISwitch *)v7->_selectionSwitch addTarget:v7 action:"_handleSwitchValueChange" forControlEvents:4096];
    [(MFMailboxFilterPickerSwitchCell *)v7 setAccessoryView:v7->_selectionSwitch];
  }

  return v7;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilterPickerSwitchCell;
  [(MFMailboxFilterPickerSwitchCell *)&v7 setSelected:a3 animated:a4];
  id v6 = [(MFMailboxFilterPickerSwitchCell *)self selectionSwitch];
  [v6 setOn:v4];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailboxFilterPickerSwitchCell;
  [(MFMailboxFilterPickerSwitchCell *)&v3 prepareForReuse];
  [(MFMailboxFilterPickerSwitchCell *)self setDelegate:0];
}

- (void)_handleSwitchValueChange
{
  id v4 = [(MFMailboxFilterPickerSwitchCell *)self selectionSwitch];
  -[MFMailboxFilterPickerSwitchCell setSelected:](self, "setSelected:", [v4 isOn]);

  id v5 = [(MFMailboxFilterPickerSwitchCell *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(MFMailboxFilterPickerSwitchCell *)self selectionSwitch];
    [v5 mailboxFilterPickerSwitchCell:self valueDidChange:[v3 isOn]];
  }
}

- (MFMailboxFilterPickerSwitchCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailboxFilterPickerSwitchCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISwitch)selectionSwitch
{
  return self->_selectionSwitch;
}

- (void)setSelectionSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSwitch, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end