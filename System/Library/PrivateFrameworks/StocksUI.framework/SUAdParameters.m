@interface SUAdParameters
+ (void)setStocksAdEnabled:(BOOL)a3;
@end

@implementation SUAdParameters

+ (void)setStocksAdEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F24290] sharedInstance];
  if (objc_opt_respondsToSelector()) {
    [v4 setStocksAdEnabled:v3];
  }
}

@end