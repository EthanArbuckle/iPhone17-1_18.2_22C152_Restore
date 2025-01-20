@interface Predicate
- (Predicate)init;
@end

@implementation Predicate

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_25F67F01C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___Predicate_argument), *(void *)&self->id[OBJC_IVAR___Predicate_argument], self->id[OBJC_IVAR___Predicate_argument + 8]);
  sub_25F67EFAC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___Predicate_rawdata), *(void *)&self->id[OBJC_IVAR___Predicate_rawdata]);
  sub_25F67EFC0((uint64_t)self + OBJC_IVAR___Predicate_value, &qword_26B39D810);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (Predicate)init
{
}

@end