@interface PPXProductPageContext
+ (PPXProductPageContext)sharedContext;
- (UINavigationController)navigationController;
- (void)setNavigationController:(id)a3;
@end

@implementation PPXProductPageContext

+ (PPXProductPageContext)sharedContext
{
  if (qword_100039688 != -1) {
    dispatch_once(&qword_100039688, &stru_100031680);
  }
  v2 = (void *)qword_100039680;

  return (PPXProductPageContext *)v2;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end