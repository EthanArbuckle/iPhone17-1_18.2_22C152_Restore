@interface _UIScenePresenterGeometryDriver.GeometryChangeObserver
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
@end

@implementation _UIScenePresenterGeometryDriver.GeometryChangeObserver

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  swift_beginAccess();
  uint64_t v7 = *(void *)self->driver;
  swift_unownedRetainStrong();
  if (v7)
  {
    id v8 = a4;
    swift_retain();
    sub_185AE56F0((uint64_t *)a3);

    swift_release();
    swift_release();
  }
}

@end