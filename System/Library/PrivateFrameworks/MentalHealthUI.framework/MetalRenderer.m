@interface MetalRenderer
- (BOOL)commandQueueIsEmpty;
- (_TtC14MentalHealthUI13MetalRenderer)init;
- (id)displayLinkWillRenderFrame;
- (void)dealloc;
- (void)setCommandQueueIsEmpty:(BOOL)a3;
- (void)setDisplayLinkWillRenderFrame:(id)a3;
@end

@implementation MetalRenderer

- (id)displayLinkWillRenderFrame
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame))
  {
    uint64_t v2 = *(void *)&self->framerateDelegate[OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame);
    v5[5] = v2;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 1107296256;
    v5[2] = sub_255FEF784;
    v5[3] = &block_descriptor_63;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setDisplayLinkWillRenderFrame:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_255FF0E3C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_255FF0D30(v8);
}

- (BOOL)commandQueueIsEmpty
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_commandQueueIsEmpty);
}

- (void)setCommandQueueIsEmpty:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_commandQueueIsEmpty) = a3;
}

- (void)dealloc
{
  uint64_t v2 = self;
  sub_255FF0B50();
}

- (void).cxx_destruct
{
  sub_255FF0E50((uint64_t)self + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_framerateDelegate);

  sub_255FF0D30(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_layer);
}

- (_TtC14MentalHealthUI13MetalRenderer)init
{
  result = (_TtC14MentalHealthUI13MetalRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end