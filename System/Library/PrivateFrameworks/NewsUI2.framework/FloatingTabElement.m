@interface FloatingTabElement
- (NSString)description;
- (_TtC7NewsUI218FloatingTabElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5;
@end

@implementation FloatingTabElement

- (NSString)description
{
  return (NSString *)sub_1DEB6E970(self, (uint64_t)a2, (void (*)(void))sub_1DEB6E190);
}

- (_TtC7NewsUI218FloatingTabElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1DFDFDD20();
  sub_1DFDFDD20();
  id v8 = a5;
  v9 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v11 = [(_UITabElement *)&v13 initWithIdentifier:v9 title:v10 image:v8];

  return v11;
}

@end