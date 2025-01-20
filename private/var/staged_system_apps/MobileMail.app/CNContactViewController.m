@interface CNContactViewController
- (BOOL)shouldAutorotate;
@end

@implementation CNContactViewController

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad] ^ 1;
}

@end