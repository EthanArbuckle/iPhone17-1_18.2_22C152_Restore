@interface SFTabSwitcherScrollPosition
+ (id)scrollPositionWithItem:(id)a3;
+ (id)scrollPositionWithPage:(id)a3;
- (SFTabSwitcherScrollPosition)init;
@end

@implementation SFTabSwitcherScrollPosition

- (void).cxx_destruct
{
}

+ (id)scrollPositionWithPage:(id)a3
{
  return sub_18C441C0C((uint64_t)a1, (uint64_t)a2, (char *)a3, &OBJC_IVAR___SFTabSwitcherPage__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherPageInternal_wrapped, (uint64_t (*)(void))_s4PageVMa);
}

+ (id)scrollPositionWithItem:(id)a3
{
  return sub_18C441C0C((uint64_t)a1, (uint64_t)a2, (char *)a3, &OBJC_IVAR___SFTabSwitcherItem__internal, &OBJC_IVAR____TtC12MobileSafari25SFTabSwitcherItemInternal_wrapped, (uint64_t (*)(void))_s4ItemVMa);
}

- (SFTabSwitcherScrollPosition)init
{
  result = (SFTabSwitcherScrollPosition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end