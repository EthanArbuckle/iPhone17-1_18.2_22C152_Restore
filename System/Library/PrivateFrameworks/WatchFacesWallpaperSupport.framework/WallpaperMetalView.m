@interface WallpaperMetalView
+ (Class)layerClass;
- (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView)initWithCoder:(id)a3;
- (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)displayLayer:(id)a3;
@end

@implementation WallpaperMetalView

- (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_26154AEA8();
}

- (void)dealloc
{
  v2 = (void *)(*(void **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink))[4];
  if (v2)
  {
    id v3 = self;
    objc_msgSend(v2, sel_invalidate);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for WallpaperMetalView(0);
    [(WallpaperMetalView *)&v4 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_261547F20(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler));
  sub_26154B598((uint64_t)self + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log, &qword_26A921AB0);
  swift_release();
  sub_26154B598((uint64_t)self + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo, &qword_26A921AC0);
}

+ (Class)layerClass
{
  unint64_t v2 = sub_26154B558();
  return (Class)MEMORY[0x270FA03D0](v2);
}

- (void)displayLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_26154B044();
}

- (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView)initWithFrame:(CGRect)a3
{
  result = (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end