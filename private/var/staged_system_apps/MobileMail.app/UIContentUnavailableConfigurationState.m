@interface UIContentUnavailableConfigurationState
- (BOOL)showNoMessageSelectedView;
- (void)setShowNoMessageSelectedView:(BOOL)a3;
@end

@implementation UIContentUnavailableConfigurationState

- (void)setShowNoMessageSelectedView:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  -[UIContentUnavailableConfigurationState setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:");
}

- (BOOL)showNoMessageSelectedView
{
  v2 = [(UIContentUnavailableConfigurationState *)self objectForKeyedSubscript:@"com.apple.mobilemail.showNoMessageSelectedView"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

@end