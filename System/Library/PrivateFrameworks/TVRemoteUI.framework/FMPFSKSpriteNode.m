@interface FMPFSKSpriteNode
- (_TtC10TVRemoteUI16FMPFSKSpriteNode)initWithCoder:(id)a3;
- (_TtC10TVRemoteUI16FMPFSKSpriteNode)initWithTexture:(id)a3 color:(id)a4 size:(CGSize)a5;
@end

@implementation FMPFSKSpriteNode

- (_TtC10TVRemoteUI16FMPFSKSpriteNode)initWithTexture:(id)a3 color:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v9 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI16FMPFSKSpriteNode_brightness;
  *(void *)v9 = 0;
  v9[8] = 1;
  v10 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI16FMPFSKSpriteNode_previousBrightness;
  *(void *)v10 = 0;
  v10[8] = 1;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FMPFSKSpriteNode();
  return -[SKSpriteNode initWithTexture:color:size:](&v12, sel_initWithTexture_color_size_, a3, a4, width, height);
}

- (_TtC10TVRemoteUI16FMPFSKSpriteNode)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI16FMPFSKSpriteNode_brightness;
  *(void *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC10TVRemoteUI16FMPFSKSpriteNode_previousBrightness;
  *(void *)v5 = 0;
  v5[8] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMPFSKSpriteNode();
  return [(SKSpriteNode *)&v7 initWithCoder:a3];
}

@end