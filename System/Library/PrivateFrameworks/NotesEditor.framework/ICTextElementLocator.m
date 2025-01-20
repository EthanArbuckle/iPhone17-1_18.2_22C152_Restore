@interface ICTextElementLocator
- (ICTextElementLocator)init;
- (ICTextElementLocator)initWithTextView:(id)a3;
- (void)enumerateTextElementsUsingBlock:(id)a3;
@end

@implementation ICTextElementLocator

- (ICTextElementLocator)initWithTextView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ICTextElementLocator *)&v6 init];
}

- (void)enumerateTextElementsUsingBlock:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_20C150C84((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (ICTextElementLocator)init
{
  result = (ICTextElementLocator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end