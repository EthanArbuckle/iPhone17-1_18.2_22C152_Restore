@interface ImageEditingViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC7MusicUI26ImageEditingViewController)initWithCoder:(id)a3;
- (_TtC7MusicUI26ImageEditingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC7MusicUI26ImageEditingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7MusicUI26ImageEditingViewController)initWithRootViewController:(id)a3;
@end

@implementation ImageEditingViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC7MusicUI26ImageEditingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (_TtC7MusicUI26ImageEditingViewController *)sub_2297D0C3C(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (_TtC7MusicUI26ImageEditingViewController *)sub_2297D0C3C(ObjCClassMetadata, v6);
}

- (_TtC7MusicUI26ImageEditingViewController)initWithRootViewController:(id)a3
{
  return (_TtC7MusicUI26ImageEditingViewController *)sub_2297D0D18(a3);
}

- (_TtC7MusicUI26ImageEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_22A1707E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7MusicUI26ImageEditingViewController *)sub_2297D0D90(v5, v7, a4);
}

- (_TtC7MusicUI26ImageEditingViewController)initWithCoder:(id)a3
{
  return (_TtC7MusicUI26ImageEditingViewController *)sub_2297D0E70(a3);
}

@end