@interface FloatingTabAction
- (NSString)description;
- (_TtC7NewsUI217FloatingTabAction)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6;
@end

@implementation FloatingTabAction

- (NSString)description
{
  return (NSString *)sub_1DEB6E970(self, (uint64_t)a2, (void (*)(void))sub_1DEB6E9E0);
}

- (_TtC7NewsUI217FloatingTabAction)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6
{
  v7 = _Block_copy(a6);
  uint64_t v8 = sub_1DFDFDD20();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1DFDFDD20();
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v7;
  id v15 = a5;
  return (_TtC7NewsUI217FloatingTabAction *)sub_1DEB6EB74(v8, v10, v11, v13, a5, (uint64_t)sub_1DEB6EE74, v14);
}

@end