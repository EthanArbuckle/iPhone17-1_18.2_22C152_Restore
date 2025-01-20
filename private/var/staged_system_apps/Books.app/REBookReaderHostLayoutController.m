@interface REBookReaderHostLayoutController
- (CGRect)frame;
- (NSString)description;
- (REBookReaderHostLayoutController)init;
- (REBookReaderHostLayoutController)initWithView:(id)a3;
- (REBookReaderHostLayoutController)initWithViewController:(id)a3;
- (UIEdgeInsets)safeAreaInsets;
- (UITraitCollection)traitCollection;
- (double)defaultStatusBarHeight;
- (void)didEnterBackground;
- (void)setFrame:(CGRect)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setTraitCollection:(id)a3;
- (void)willEnterForeground;
@end

@implementation REBookReaderHostLayoutController

- (CGRect)frame
{
  v2 = self;
  sub_1007F77C0();

  double v3 = v7;
  double v4 = v8;
  double v5 = v9;
  double v6 = v10;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  BookReaderHostLayoutController.frame.setter(x, y, width, height);
}

- (UIEdgeInsets)safeAreaInsets
{
  v2 = self;
  sub_1007F77C0();

  double v3 = v7;
  double v4 = v8;
  double v5 = v9;
  double v6 = v10;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self;
  BookReaderHostLayoutController.safeAreaInsets.setter(top, left, bottom, right);
}

- (UITraitCollection)traitCollection
{
  v2 = self;
  sub_1007F77C0();

  return (UITraitCollection *)v4;
}

- (void)setTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = self;
  BookReaderHostLayoutController.traitCollection.setter(v4);
}

- (double)defaultStatusBarHeight
{
  v2 = self;
  double v3 = BookReaderHostLayoutController.defaultStatusBarHeight.getter();

  return v3;
}

- (REBookReaderHostLayoutController)initWithViewController:(id)a3
{
  id v4 = a3;
  UIEdgeInsets result = (REBookReaderHostLayoutController *)[v4 view];
  if (result)
  {
    double v6 = result;
    double v7 = [(REBookReaderHostLayoutController *)self initWithView:result];

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (REBookReaderHostLayoutController)initWithView:(id)a3
{
  id v3 = a3;
  [v3 frame];
  [v3 safeAreaInsets];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  id v12 = [v3 traitCollection];
  id v13 = objc_allocWithZone((Class)type metadata accessor for BookReaderHostLayoutController());
  *(void *)&long long v22 = v9;
  *((void *)&v22 + 1) = v11;
  *(void *)&long long v21 = v5;
  *((void *)&v21 + 1) = v7;
  v19 = (REBookReaderHostLayoutController *)sub_100594D3C(v12, v3, (uint64_t)v13, v14, v15, v16, v17, v18, v21, v22);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v19;
}

- (void)willEnterForeground
{
  v2 = self;
  BookReaderHostLayoutController.willEnterForeground()();
}

- (void)didEnterBackground
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___REBookReaderHostLayoutController_isInForeground) = 0;
}

- (REBookReaderHostLayoutController)init
{
  UIEdgeInsets result = (REBookReaderHostLayoutController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  BookReaderHostLayoutController.description.getter();

  NSString v3 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end