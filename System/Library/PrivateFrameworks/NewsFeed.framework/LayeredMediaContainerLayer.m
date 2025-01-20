@interface LayeredMediaContainerLayer
- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)init;
- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)initWithCoder:(id)a3;
- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)initWithLayer:(id)a3;
@end

@implementation LayeredMediaContainerLayer

- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransforms) = (Class)MEMORY[0x1E4FBC860];
  v4 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransform;
  uint64_t v5 = *MEMORY[0x1E4FAC0B8];
  uint64_t v6 = sub_1C151A93C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  v7 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionDisabledTransform;
  uint64_t v8 = *MEMORY[0x1E4FACA78];
  uint64_t v9 = sub_1C151B9CC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v7, v8, v9);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionEnabled) = 1;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionAllowed) = 1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return [(TUNonAnimatingLayer *)&v11 init];
}

- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1C151FF3C();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransforms) = (Class)MEMORY[0x1E4FBC860];
  uint64_t v5 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransform;
  uint64_t v6 = *MEMORY[0x1E4FAC0B8];
  uint64_t v7 = sub_1C151A93C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  uint64_t v8 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionDisabledTransform;
  uint64_t v9 = *MEMORY[0x1E4FACA78];
  uint64_t v10 = sub_1C151B9CC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionEnabled) = 1;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionAllowed) = 1;
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  uint64_t v11 = sub_1C1520A7C();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(LayeredMediaContainerLayer *)&v14 initWithLayer:v11];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v12;
}

- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)initWithCoder:(id)a3
{
  return (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer *)sub_1C124A918(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransform;
  uint64_t v4 = sub_1C151A93C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionDisabledTransform;
  uint64_t v6 = sub_1C151B9CC();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end