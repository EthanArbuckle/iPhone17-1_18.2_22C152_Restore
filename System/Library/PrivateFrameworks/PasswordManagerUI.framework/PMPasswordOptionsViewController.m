@interface PMPasswordOptionsViewController
- (BOOL)canBeShownFromSuspendedState;
- (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController)initWithCoder:(id)a3;
- (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PMPasswordOptionsViewController

- (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_258D6F498();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController *)sub_258CA6148(v5, v7, a4);
}

- (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController)initWithCoder:(id)a3
{
  result = (_TtC17PasswordManagerUIP33_0FCB751D9C1401A422BE720A549BB52631PMPasswordOptionsViewController *)sub_258D6FE78();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_258CA6414();
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

@end