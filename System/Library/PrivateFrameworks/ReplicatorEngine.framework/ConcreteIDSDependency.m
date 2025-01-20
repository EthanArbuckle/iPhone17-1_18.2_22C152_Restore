@interface ConcreteIDSDependency
- (_TtC16ReplicatorEngine21ConcreteIDSDependency)init;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation ConcreteIDSDependency

- (_TtC16ReplicatorEngine21ConcreteIDSDependency)init
{
  result = (_TtC16ReplicatorEngine21ConcreteIDSDependency *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  sub_25B111FF0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ReplicatorEngine21ConcreteIDSDependency_lock_identityBlob), *(void *)&self->_accountsChanged[OBJC_IVAR____TtC16ReplicatorEngine21ConcreteIDSDependency_lock_identityBlob]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ReplicatorEngine21ConcreteIDSDependency_identityFetchQueue));
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_25B20CC10((uint64_t)v6);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a3;
  v6 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4D99F8);
  sub_25B116394((unint64_t *)&unk_26A4D91A8, &qword_26A4D99F8);
  sub_25B290230();

  swift_release();
}

@end