@interface SettingsSignInViewController
- (_TtC7MusicUI28SettingsSignInViewController)initWithCoder:(id)a3;
- (_TtC7MusicUI28SettingsSignInViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SettingsSignInViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_229CFD550(a3);
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  sub_229CFDFE4();
  sub_22A170640();
  id v6 = a3;
  v7 = self;
  sub_229CFD76C();

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_229CFD904();
}

- (_TtC7MusicUI28SettingsSignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_22A1707E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7MusicUI28SettingsSignInViewController *)sub_229CFDE2C(v5, v7, a4);
}

- (_TtC7MusicUI28SettingsSignInViewController)initWithCoder:(id)a3
{
  return (_TtC7MusicUI28SettingsSignInViewController *)sub_229CFDF34(a3);
}

@end