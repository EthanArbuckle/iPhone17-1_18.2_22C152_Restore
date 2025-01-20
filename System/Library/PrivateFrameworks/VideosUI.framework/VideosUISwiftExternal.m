@interface VideosUISwiftExternal
+ (id)ascAppInstallerViewControllerWithTitle:(id)a3 subtitle:(id)a4 request:(id)a5 forceDSIDlessInstall:(BOOL)a6 onFlowCompletion:(id)a7;
+ (id)viewControllerWith:(id)a3 appContext:(id)a4 documentOptions:(id)a5;
+ (void)initializeUIFactory;
@end

@implementation VideosUISwiftExternal

+ (void)initializeUIFactory
{
}

+ (id)viewControllerWith:(id)a3 appContext:(id)a4 documentOptions:(id)a5
{
  return +[VideosUI viewControllerWith:a3 appContext:a4 documentOptions:a5];
}

+ (id)ascAppInstallerViewControllerWithTitle:(id)a3 subtitle:(id)a4 request:(id)a5 forceDSIDlessInstall:(BOOL)a6 onFlowCompletion:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[VUIASCAppInstallerViewController alloc] initWithTitle:v14 subtitle:v13 request:v12 forceDSIDless:v7 onFlowComplete:v11];

  return v15;
}

@end