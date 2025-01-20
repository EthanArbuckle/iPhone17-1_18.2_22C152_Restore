@interface SFTabSwitcherItem
- (BOOL)canBeClosed;
- (BOOL)canBeCopied;
- (BOOL)canBePinned;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractivelyInserted;
- (BOOL)isUnread;
- (NSArray)shareParticipants;
- (NSString)title;
- (NSUUID)identifier;
- (SFTabSwitcherItem)initWithIdentifier:(id)a3;
- (id)init;
- (id)searchPredicate;
- (int64_t)hash;
- (unint64_t)mediaStateIcon;
- (void)setCanBeClosed:(BOOL)a3;
- (void)setCanBeCopied:(BOOL)a3;
- (void)setCanBePinned:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsInteractivelyInserted:(BOOL)a3;
- (void)setIsUnread:(BOOL)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setSearchPredicate:(id)a3;
- (void)setShareParticipants:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFTabSwitcherItem

- (void).cxx_destruct
{
}

- (SFTabSwitcherItem)initWithIdentifier:(id)a3
{
  return (SFTabSwitcherItem *)sub_18C3837C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18C383A54);
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  v4 = self;
  sub_18C38054C(a3);
}

- (void)setSearchPredicate:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_18C38074C((uint64_t)sub_18C5DEB08, v5);

  swift_release();
}

- (void)setCanBeClosed:(BOOL)a3
{
  v4 = self;
  sub_18C380944(a3);
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18C6F9848();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_18C380B28(v4, v6);
}

- (void)setCanBePinned:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C380D14(a3);
}

- (void)setIsUnread:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C380ECC(a3);
}

- (void)setIsInteractivelyInserted:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C381094(a3);
}

- (void)setCanBeCopied:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C38125C(a3);
}

- (void)setShareParticipants:(id)a3
{
  sub_18C38D908(0, &qword_1E9177DB0);
  uint64_t v4 = sub_18C6F99D8();
  uint64_t v5 = self;
  sub_18C382838(v4);
}

- (int64_t)hash
{
  uint64_t v3 = _s4ItemVMa();
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  sub_18C39D28C((uint64_t)v6, (uint64_t)v5, (uint64_t (*)(void))_s4ItemVMa);
  sub_18C6FAA28();
  sub_18C6F8308();
  sub_18C3AA1D0((unint64_t *)&qword_1E9178760, 255, MEMORY[0x1E4F27990]);
  v7 = self;
  sub_18C6F96F8();
  int64_t v8 = sub_18C6FAA78();
  sub_18C39C59C((uint64_t)v5, (uint64_t (*)(void))_s4ItemVMa);

  return v8;
}

- (BOOL)canBeClosed
{
  return sub_18C5D64FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (BOOL)canBeCopied
{
  return sub_18C5D655C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (BOOL)canBePinned
{
  return sub_18C5D65BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped);
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_18C3E1F80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped, (uint64_t (*)(void))_s4ItemVMa);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  return sub_18C5D8368(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SFTabSwitcherItem.isEqual(_:));
}

- (BOOL)isInteractivelyInserted
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4ItemVMa() + 32)];
}

- (BOOL)isUnread
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4ItemVMa() + 44)];
}

- (unint64_t)mediaStateIcon
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  return *(void *)&v2[*(int *)(_s4ItemVMa() + 48)];
}

- (id)searchPredicate
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  uint64_t v3 = &v2[*(int *)(_s4ItemVMa() + 52)];
  uint64_t v4 = *((void *)v3 + 1);
  aBlock[4] = *(void *)v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18C5D5D74;
  aBlock[3] = &block_descriptor_213;
  uint64_t v5 = _Block_copy(aBlock);
  sub_18C6F7B98();
  swift_release();

  return v5;
}

- (NSArray)shareParticipants
{
  swift_beginAccess();
  _s4ItemVMa();
  sub_18C38D908(0, &qword_1E9177DB0);
  sub_18C6F7DE8();
  v2 = (void *)sub_18C6F99C8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSString)title
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherItem__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped;
  swift_beginAccess();
  if (*(void *)&v2[*(int *)(_s4ItemVMa() + 60) + 8])
  {
    sub_18C6F7DE8();
    uint64_t v3 = (void *)sub_18C6F9808();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (id)init
{
  uint64_t v2 = sub_18C6F8308();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s12MobileSafari15ShadowUpdatablePAAE11tabEntityID10Foundation4UUIDVvg_0();
  uint64_t v6 = (void *)sub_18C6F82C8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v7 = objc_msgSend(a1, sel_initWithIdentifier_, v6);

  return v7;
}

@end