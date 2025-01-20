@interface SFTabSwitcherSection
- (BOOL)isEqual:(id)a3;
- (BOOL)isPinned;
- (NSArray)items;
- (NSString)title;
- (NSUUID)identifier;
- (SFTabSwitcherSection)initWithIdentifier:(id)a3;
- (int64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFTabSwitcherSection

- (void).cxx_destruct
{
}

- (void)setItems:(id)a3
{
}

- (SFTabSwitcherSection)initWithIdentifier:(id)a3
{
  return (SFTabSwitcherSection *)sub_18C3837C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18C383858);
}

- (void)setIsPinned:(BOOL)a3
{
  v4 = self;
  sub_18C37EEDC(a3);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SFTabSwitcherSection.hash.getter();

  return v3;
}

- (NSUUID)identifier
{
  uint64_t v3 = sub_18C6F8308();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherSection__internal)
     + OBJC_IVAR____TtC12MobileSafari28SFTabSwitcherSectionInternal_wrapped;
  swift_beginAccess();
  uint64_t v8 = _s7SectionVMa();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 20)], v3);
  v9 = (void *)sub_18C6F82C8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v9;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  return sub_18C5D8368(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SFTabSwitcherSection.isEqual(_:));
}

- (BOOL)isPinned
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherSection__internal)
     + OBJC_IVAR____TtC12MobileSafari28SFTabSwitcherSectionInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s7SectionVMa() + 24)];
}

- (NSArray)items
{
  return (NSArray *)sub_18C5D612C(self, (uint64_t)a2, (void (*)(void))sub_18C5D8484, (void (*)(void))type metadata accessor for SFTabSwitcherItem);
}

- (NSString)title
{
  swift_beginAccess();
  _s7SectionVMa();
  sub_18C6F7DE8();
  v2 = (void *)sub_18C6F9808();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
}

@end