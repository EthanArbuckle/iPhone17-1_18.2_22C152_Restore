@interface SecureNavigationController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC20TranslationUIService26SecureNavigationController)initWithCoder:(id)a3;
- (_TtC20TranslationUIService26SecureNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC20TranslationUIService26SecureNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20TranslationUIService26SecureNavigationController)initWithRootViewController:(id)a3;
@end

@implementation SecureNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC20TranslationUIService26SecureNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SecureNavigationController();
  return [(SecureNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC20TranslationUIService26SecureNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecureNavigationController();
  return [(SecureNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC20TranslationUIService26SecureNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100049EA8();
    id v6 = a4;
    NSString v7 = sub_100049E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SecureNavigationController();
  v9 = [(SecureNavigationController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC20TranslationUIService26SecureNavigationController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecureNavigationController();
  return [(SecureNavigationController *)&v5 initWithCoder:a3];
}

@end