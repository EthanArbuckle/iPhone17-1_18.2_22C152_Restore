@interface AutocompleteQueryToken
- (BOOL)isNumber;
- (_TtC4Maps22AutocompleteQueryToken)init;
- (_TtC4Maps22AutocompleteQueryToken)initWithMatchLength:(int64_t)a3 matchPosition:(int64_t)a4 isNumber:(BOOL)a5 matchLocation:(int64_t)a6;
- (int64_t)matchLength;
- (int64_t)matchLocation;
- (int64_t)matchPostion;
@end

@implementation AutocompleteQueryToken

- (int64_t)matchLength
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_matchLength);
}

- (int64_t)matchPostion
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_matchPostion);
}

- (BOOL)isNumber
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_isNumber);
}

- (int64_t)matchLocation
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_matchLocation);
}

- (_TtC4Maps22AutocompleteQueryToken)initWithMatchLength:(int64_t)a3 matchPosition:(int64_t)a4 isNumber:(BOOL)a5 matchLocation:(int64_t)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_matchLength) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_matchPostion) = (Class)a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_isNumber) = a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22AutocompleteQueryToken_matchLocation) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AutocompleteQueryToken();
  return [(AutocompleteQueryToken *)&v7 init];
}

- (_TtC4Maps22AutocompleteQueryToken)init
{
  result = (_TtC4Maps22AutocompleteQueryToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end