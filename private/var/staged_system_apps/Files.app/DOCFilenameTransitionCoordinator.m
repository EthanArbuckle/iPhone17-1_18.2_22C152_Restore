@interface DOCFilenameTransitionCoordinator
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation DOCFilenameTransitionCoordinator

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_thumbnail) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_thumbnailStyle;
  *(void *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self
     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_sourceRect;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 1;
  uint64_t v6 = OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_group;
  v7 = self;
  *(Class *)((char *)&self->super.isa + v6) = (Class)dispatch_group_create();

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return [(DOCFilenameTransitionCoordinator *)&v9 init];
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1002ECC20((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_thumbnail));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7532DOCFilenameTransitionCoordinator_group);
}

@end