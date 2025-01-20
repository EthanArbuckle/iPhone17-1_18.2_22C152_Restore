@interface IMTheme
- (BOOL)navigationBarIsTranslucent:(id)a3;
- (id)titleColorForNavigationBar:(id)a3;
@end

@implementation IMTheme

- (id)titleColorForNavigationBar:(id)a3
{
  return [(IMTheme *)self toolbarTitleColor];
}

- (BOOL)navigationBarIsTranslucent:(id)a3
{
  return 0;
}

@end