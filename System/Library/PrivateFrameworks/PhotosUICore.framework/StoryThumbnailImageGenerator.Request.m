@interface StoryThumbnailImageGenerator.Request
- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5;
- (_TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request)init;
- (void)engineSetNeedsUpdate:(id)a3;
@end

@implementation StoryThumbnailImageGenerator.Request

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  LOBYTE(self) = sub_1AA40C668(v8, v9, v10);

  return self & 1;
}

- (void)engineSetNeedsUpdate:(id)a3
{
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_waitingForResources) == 1)
    objc_msgSend(a3, sel_updateIfNeeded);
}

- (_TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request)init
{
  result = (_TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyTraitCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_storyLayout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_engine));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC12PhotosUICore28StoryThumbnailImageGeneratorP33_2AC47450565EC896EF788DB342AA90677Request_pixelBufferRenderDestination);
}

@end