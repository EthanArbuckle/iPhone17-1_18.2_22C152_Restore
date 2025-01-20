@interface PMGeneratedPasswordsLog
+ (id)makeUIViewControllerWithDelegate:(id)a3 searchTerm:(id)a4 alwaysShowSearchBar:(BOOL)a5;
@end

@implementation PMGeneratedPasswordsLog

+ (id)makeUIViewControllerWithDelegate:(id)a3 searchTerm:(id)a4 alwaysShowSearchBar:(BOOL)a5
{
  return +[PMGeneratedPasswordsLogController viewControllerWithDelegate:a3 searchTerm:a4 alwaysShowSearchBar:a5];
}

@end