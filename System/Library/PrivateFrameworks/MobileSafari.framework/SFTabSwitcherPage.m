@interface SFTabSwitcherPage
- (BOOL)allowsLargeTitle;
- (BOOL)allowsRetitling;
- (BOOL)allowsSharing;
- (BOOL)hasAnyItems;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocked;
- (BOOL)itemsCanMoveBetweenPages;
- (NSArray)allItems;
- (NSArray)sections;
- (NSString)title;
- (NSUUID)identifier;
- (SFTabSwitcherPage)initWithIdentifier:(id)a3;
- (SFTabSwitcherPageOverlay)overlay;
- (SFTabSwitcherPagePeekingOverlay)peekingOverlay;
- (SFTabSwitcherProfile)profile;
- (SFTabSwitcherShareConfiguration)shareConfiguration;
- (UIImage)image;
- (int64_t)hash;
- (int64_t)itemCount;
- (void)setAllowsLargeTitle:(BOOL)a3;
- (void)setAllowsRetitling:(BOOL)a3;
- (void)setAllowsSharing:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setItemsCanMoveBetweenPages:(BOOL)a3;
- (void)setOverlay:(id)a3;
- (void)setPeekingOverlay:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSections:(id)a3;
- (void)setShareConfiguration:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFTabSwitcherPage

- (void).cxx_destruct
{
}

- (void)setSections:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (SFTabSwitcherPage)initWithIdentifier:(id)a3
{
  return (SFTabSwitcherPage *)sub_18C3837C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18C383D0C);
}

- (void)setPeekingOverlay:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18C36DD54((uint64_t)a3);
}

- (void)setOverlay:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18C36DF40((unint64_t)a3);
}

- (BOOL)hasAnyItems
{
  uint64_t v3 = _s4PageVMa();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  sub_18C39D28C(v6, (uint64_t)v5, (uint64_t (*)(void))_s4PageVMa);
  v7 = self;
  LOBYTE(v6) = sub_18C375AE8();
  sub_18C39C59C((uint64_t)v5, (uint64_t (*)(void))_s4PageVMa);

  return v6 & 1;
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18C37D2F4(a3);
}

- (void)setProfile:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18C37D4E4((uint64_t)a3);
}

- (void)setAllowsSharing:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C37D770(a3);
}

- (void)setItemsCanMoveBetweenPages:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C37DB38(a3);
}

- (void)setAllowsLargeTitle:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C37DF28(a3);
}

- (void)setAllowsRetitling:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18C37E0E0(a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_18C3E1F80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped, (uint64_t (*)(void))_s4PageVMa);
}

- (int64_t)itemCount
{
  v2 = self;
  int64_t v3 = sub_18C369000();

  return v3;
}

- (NSArray)allItems
{
  return (NSArray *)sub_18C5D612C(self, (uint64_t)a2, (void (*)(void))sub_18C5D61A4, (void (*)(void))type metadata accessor for SFTabSwitcherItem);
}

- (BOOL)allowsLargeTitle
{
  return sub_18C5D64FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (BOOL)allowsRetitling
{
  return sub_18C5D655C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (BOOL)allowsSharing
{
  return sub_18C5D65BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped);
}

- (int64_t)hash
{
  uint64_t v3 = _s4PageVMa();
  MEMORY[0x1F4188790](v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v6 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  sub_18C39D28C((uint64_t)v6, (uint64_t)v5, (uint64_t (*)(void))_s4PageVMa);
  sub_18C6FAA28();
  sub_18C6F8308();
  sub_18C3AA1D0((unint64_t *)&qword_1E9178760, 255, MEMORY[0x1E4F27990]);
  v7 = self;
  sub_18C6F96F8();
  int64_t v8 = sub_18C6FAA78();
  sub_18C39C59C((uint64_t)v5, (uint64_t (*)(void))_s4PageVMa);

  return v8;
}

- (void)setIdentifier:(id)a3
{
}

- (UIImage)image
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  return (UIImage *)*(id *)&v2[*(int *)(_s4PageVMa() + 32)];
}

- (BOOL)isEqual:(id)a3
{
  return sub_18C5D8368(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SFTabSwitcherPage.isEqual(_:));
}

- (BOOL)isLocked
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4PageVMa() + 40)];
}

- (void)setIsLocked:(BOOL)a3
{
  uint64_t v4 = self;
  SFTabSwitcherPage.isLocked.setter(a3);
}

- (BOOL)itemsCanMoveBetweenPages
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  return v2[*(int *)(_s4PageVMa() + 48)];
}

- (SFTabSwitcherPageOverlay)overlay
{
  v2 = self;
  id v3 = sub_18C5D70F8();

  return (SFTabSwitcherPageOverlay *)v3;
}

- (SFTabSwitcherPagePeekingOverlay)peekingOverlay
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  uint64_t v3 = _s4PageVMa();
  uint64_t v4 = 0;
  int v5 = v2[*(int *)(v3 + 56)];
  if (v5 != 3)
  {
    id v6 = objc_allocWithZone((Class)SFTabSwitcherPagePeekingOverlay);
    v6[OBJC_IVAR___SFTabSwitcherPagePeekingOverlay_wrapped] = v5;
    v8.receiver = v6;
    v8.super_class = (Class)SFTabSwitcherPagePeekingOverlay;
    uint64_t v4 = [(SFTabSwitcherPage *)&v8 init];
  }

  return (SFTabSwitcherPagePeekingOverlay *)v4;
}

- (SFTabSwitcherProfile)profile
{
  v2 = self;
  id v3 = sub_18C5D72B0();

  return (SFTabSwitcherProfile *)v3;
}

- (NSArray)sections
{
  return (NSArray *)sub_18C5D612C(self, (uint64_t)a2, (void (*)(void))sub_18C5D73B0, (void (*)(void))type metadata accessor for SFTabSwitcherSection);
}

- (SFTabSwitcherShareConfiguration)shareConfiguration
{
  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherPage__internal)
     + OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped;
  swift_beginAccess();
  id v3 = &v2[*(int *)(_s4PageVMa() + 68)];
  uint64_t v4 = *(void **)v3;
  int v5 = (void *)*((void *)v3 + 1);
  uint64_t v7 = *((void *)v3 + 2);
  uint64_t v6 = *((void *)v3 + 3);
  uint64_t v9 = *((void *)v3 + 4);
  uint64_t v8 = *((void *)v3 + 5);
  v10 = (char *)objc_allocWithZone((Class)SFTabSwitcherShareConfiguration);
  v11 = &v10[OBJC_IVAR___SFTabSwitcherShareConfiguration_wrapped];
  *(void *)v11 = v4;
  *((void *)v11 + 1) = v5;
  *((void *)v11 + 2) = v7;
  *((void *)v11 + 3) = v6;
  *((void *)v11 + 4) = v9;
  *((void *)v11 + 5) = v8;
  v16.receiver = v10;
  v16.super_class = (Class)SFTabSwitcherShareConfiguration;
  id v12 = v4;
  id v13 = v5;
  sub_18C6F7DE8();
  sub_18C6F7B98();
  v14 = [(SFTabSwitcherPage *)&v16 init];

  return (SFTabSwitcherShareConfiguration *)v14;
}

- (void)setShareConfiguration:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_18C5DE738((uint64_t)v5);
}

- (NSString)title
{
  swift_beginAccess();
  _s4PageVMa();
  sub_18C6F7DE8();
  v2 = (void *)sub_18C6F9808();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end