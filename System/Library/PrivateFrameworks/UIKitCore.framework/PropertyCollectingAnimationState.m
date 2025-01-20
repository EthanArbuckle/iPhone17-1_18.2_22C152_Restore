@interface PropertyCollectingAnimationState
- (_TtC5UIKit32PropertyCollectingAnimationState)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5;
@end

@implementation PropertyCollectingAnimationState

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  if (a4)
  {
    uint64_t v8 = sub_186A1E95C();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  v14 = (void *)sub_1854C2AA0((uint64_t)a3, v8, v10, a5);

  swift_bridgeObjectRelease();
  return v14;
}

- (void).cxx_destruct
{
}

- (_TtC5UIKit32PropertyCollectingAnimationState)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC5UIKit32PropertyCollectingAnimationState_capturedProperties;
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1854AFFDC(MEMORY[0x1E4FBC860]);

  v8.receiver = v5;
  v8.super_class = ObjectType;
  v6 = [(UIView.InProcessAnimationState *)&v8 init];
  [(UIViewAnimationState *)v6 setDisallowInheritance:1];
  return v6;
}

@end