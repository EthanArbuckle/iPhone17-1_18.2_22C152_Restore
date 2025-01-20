@interface ICSBackupFooterView
- (ICSBackupFooterView)initWithSpecifier:(id)a3;
@end

@implementation ICSBackupFooterView

- (ICSBackupFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICSBackupFooterView;
  v5 = [(PSFooterHyperlinkView *)&v16 initWithSpecifier:v4];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"BACKUPS_INFO_LEARN_MORE" value:&stru_270DEF3F8 table:@"Localizable-Backup"];

    v8 = NSString;
    v9 = [v4 propertyForKey:*MEMORY[0x263F600F8]];
    v10 = [v8 stringWithFormat:@"%@ %@", v9, v7];
    [(PSFooterHyperlinkView *)v5 setText:v10];

    v11 = [(PSFooterHyperlinkView *)v5 text];
    uint64_t v12 = [v11 rangeOfString:v7];
    -[PSFooterHyperlinkView setLinkRange:](v5, "setLinkRange:", v12, v13);

    v14 = [v4 target];
    [(PSFooterHyperlinkView *)v5 setTarget:v14];

    [(PSFooterHyperlinkView *)v5 setAction:sel_openBackupHelpPage_];
  }

  return v5;
}

@end