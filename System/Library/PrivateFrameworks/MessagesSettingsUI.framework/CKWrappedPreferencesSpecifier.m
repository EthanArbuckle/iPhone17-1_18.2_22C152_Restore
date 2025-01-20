@interface CKWrappedPreferencesSpecifier
- (_TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier)init;
- (_TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier)initWithSpecifier:(id)a3;
- (int64_t)displayType;
@end

@implementation CKWrappedPreferencesSpecifier

- (_TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier)initWithSpecifier:(id)a3
{
  v4 = (objc_class *)a3;
  v5 = self;
  sub_25620ED08();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier) = v4;
  v6 = v4;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for CKWrappedPreferencesSpecifier();
  v7 = [(CKWrappedPreferencesSpecifier *)&v9 init];

  return v7;
}

- (int64_t)displayType
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_cellType) != (id)6;
}

- (_TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier)init
{
  result = (_TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier));
  v3 = (char *)self + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier___observationRegistrar;
  uint64_t v4 = sub_25620ED18();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end