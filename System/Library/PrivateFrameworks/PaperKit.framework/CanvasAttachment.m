@interface CanvasAttachment
- (BOOL)isEqual:(id)a3;
- (_TtC8PaperKit16CanvasAttachment)init;
- (const)boundingPath;
- (int64_t)type;
- (void)setBoundingPath:(const CGPath *)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CanvasAttachment

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit16CanvasAttachment_type);
}

- (void)setType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit16CanvasAttachment_type) = (Class)a3;
}

- (const)boundingPath
{
  return (const CGPath *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC8PaperKit16CanvasAttachment_boundingPath));
}

- (void)setBoundingPath:(const CGPath *)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit16CanvasAttachment_boundingPath);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit16CanvasAttachment_boundingPath) = a3;
  v3 = a3;
}

- (BOOL)isEqual:(id)a3
{
  return @objc CanvasAttachment.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CanvasAttachment.isEqual(_:));
}

- (_TtC8PaperKit16CanvasAttachment)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit16CanvasAttachment_type) = 0;
  uint64_t v4 = OBJC_IVAR____TtC8PaperKit16CanvasAttachment_boundingPath;
  CGFloat v5 = *MEMORY[0x263F001A0];
  CGFloat v6 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 24);
  v9 = self;
  v12.origin.x = v5;
  v12.origin.y = v6;
  v12.size.width = v7;
  v12.size.height = v8;
  *(Class *)((char *)&self->super.isa + v4) = CGPathCreateWithRect(v12, 0);

  v11.receiver = v9;
  v11.super_class = ObjectType;
  return [(CanvasAttachment *)&v11 init];
}

- (void).cxx_destruct
{
}

@end