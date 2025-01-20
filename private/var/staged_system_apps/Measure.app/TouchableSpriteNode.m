@interface TouchableSpriteNode
- (_TtC7Measure19TouchableSpriteNode)init;
- (_TtC7Measure19TouchableSpriteNode)initWithCoder:(id)a3;
@end

@implementation TouchableSpriteNode

- (_TtC7Measure19TouchableSpriteNode)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC7Measure19TouchableSpriteNode_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(TouchableSpriteNode *)&v5 init];
}

- (_TtC7Measure19TouchableSpriteNode)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC7Measure19TouchableSpriteNode_delegate] = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TouchableSpriteNode *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end