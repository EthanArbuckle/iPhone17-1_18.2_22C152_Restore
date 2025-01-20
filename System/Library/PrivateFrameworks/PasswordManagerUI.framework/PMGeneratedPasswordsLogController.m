@interface PMGeneratedPasswordsLogController
+ (id)viewControllerWithDelegate:(id)a3 searchTerm:(id)a4 alwaysShowSearchBar:(BOOL)a5;
- (_TtC17PasswordManagerUI33PMGeneratedPasswordsLogController)init;
@end

@implementation PMGeneratedPasswordsLogController

+ (id)viewControllerWithDelegate:(id)a3 searchTerm:(id)a4 alwaysShowSearchBar:(BOOL)a5
{
  uint64_t v6 = sub_258D6F498();
  uint64_t v8 = v7;
  uint64_t v9 = swift_unknownObjectRetain();
  v10 = (void *)_s17PasswordManagerUI33PMGeneratedPasswordsLogControllerC04viewG04with10searchTerm19alwaysShowSearchBarSo06UIViewG0CSo0deF8Delegate_p_SSSbtFZ_0(v9, v6, v8, a5);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC17PasswordManagerUI33PMGeneratedPasswordsLogController)init
{
  result = (_TtC17PasswordManagerUI33PMGeneratedPasswordsLogController *)sub_258D6FE78();
  __break(1u);
  return result;
}

@end