@interface CKSettingsCriticalMessagesAppCell
- (CKSettingsCriticalMessagesAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation CKSettingsCriticalMessagesAppCell

- (CKSettingsCriticalMessagesAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKSettingsCriticalMessagesAppCell;
  v9 = [(PSTableCell *)&v15 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(CKSettingsCriticalMessagesAppCell *)v9 detailTextLabel];
    v12 = [MEMORY[0x263F1C550] lightGrayColor];
    [v11 setTextColor:v12];

    v13 = [v8 propertyForKey:*MEMORY[0x263F602C8]];
    [v11 setText:v13];
  }
  return v10;
}

@end