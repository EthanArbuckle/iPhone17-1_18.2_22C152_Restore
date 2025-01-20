@interface PSUIPlanPendingTransferRequestingTableCell
- (id)_setStatusLabelText;
@end

@implementation PSUIPlanPendingTransferRequestingTableCell

- (id)_setStatusLabelText
{
  v2 = NSString;
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"REQUEST_SENT" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v5 = [v2 stringWithFormat:v4];

  return v5;
}

@end