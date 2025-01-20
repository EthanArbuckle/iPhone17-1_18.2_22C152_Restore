@interface SSScreenSnapshotter
+ (id)snapshotterForScreen:(id)a3;
- (SSScreenSnapshotter)initWithScreen:(id)a3;
- (UIScreen)screen;
- (id)takeScreenshot;
@end

@implementation SSScreenSnapshotter

+ (id)snapshotterForScreen:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F1C920] mainScreen];

  v5 = off_2644ED328;
  if (v4 != v3) {
    v5 = off_2644ED340;
  }
  v6 = (void *)[objc_alloc(*v5) initWithScreen:v3];

  return v6;
}

- (SSScreenSnapshotter)initWithScreen:(id)a3
{
  id v4 = (UIScreen *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSScreenSnapshotter;
  v5 = [(SSScreenSnapshotter *)&v8 init];
  screen = v5->_screen;
  v5->_screen = v4;

  return v5;
}

- (id)takeScreenshot
{
  return 0;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
}

@end