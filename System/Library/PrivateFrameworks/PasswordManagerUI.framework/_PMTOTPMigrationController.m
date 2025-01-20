@interface _PMTOTPMigrationController
- (NSArray)totpGenerators;
- (UIViewController)viewController;
- (_TtC17PasswordManagerUI26_PMTOTPMigrationController)init;
- (_TtC17PasswordManagerUI26_PMTOTPMigrationController)initWithMigrationURL:(id)a3 delegate:(id)a4;
- (_TtP17PasswordManagerUI34_PMTOTPMigrationControllerDelegate_)delegate;
- (int64_t)numberOfCodes;
- (void)addGenerator:(id)a3 toSavedAccount:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _PMTOTPMigrationController

- (UIViewController)viewController
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtP17PasswordManagerUI34_PMTOTPMigrationControllerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x25A2D1DD0](v2);

  return (_TtP17PasswordManagerUI34_PMTOTPMigrationControllerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC17PasswordManagerUI26_PMTOTPMigrationController)initWithMigrationURL:(id)a3 delegate:(id)a4
{
  uint64_t v5 = sub_258D6B528();
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258D6B4D8();
  swift_unknownObjectRetain();
  return (_TtC17PasswordManagerUI26_PMTOTPMigrationController *)_PMTOTPMigrationController.init(migrationURL:delegate:)((uint64_t)v7, (uint64_t)a4);
}

- (void)addGenerator:(id)a3 toSavedAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_258D33FA4(v6, v7);
}

- (int64_t)numberOfCodes
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_258D6C278();
  swift_release();
  swift_release();
  int64_t v4 = *(void *)(v6 + 16);

  swift_bridgeObjectRelease();
  return v4;
}

- (NSArray)totpGenerators
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_258D6C278();
  swift_release();
  swift_release();
  sub_25892DB14(v6);

  swift_bridgeObjectRelease();
  sub_25892FC20();
  int64_t v4 = (void *)sub_258D6F6C8();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (_TtC17PasswordManagerUI26_PMTOTPMigrationController)init
{
  result = (_TtC17PasswordManagerUI26_PMTOTPMigrationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_appState));
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_migrationURL;
  uint64_t v4 = sub_258D6B528();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_viewController));
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI26_PMTOTPMigrationController_delegate;

  sub_25892DE34((uint64_t)v5);
}

@end