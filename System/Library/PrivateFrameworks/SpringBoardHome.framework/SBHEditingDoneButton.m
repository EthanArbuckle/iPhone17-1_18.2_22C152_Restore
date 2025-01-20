@interface SBHEditingDoneButton
- (SBHEditingDoneButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4;
@end

@implementation SBHEditingDoneButton

- (SBHEditingDoneButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = SBHBundle();
  v11 = [v10 localizedStringForKey:@"DONE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  v12 = -[SBTitledHomeScreenButton initWithFrame:backgroundView:type:content:](self, "initWithFrame:backgroundView:type:content:", v9, 1, v11, x, y, width, height);
  return v12;
}

@end