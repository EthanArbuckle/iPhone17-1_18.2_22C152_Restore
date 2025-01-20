@interface CanonicalTemplateController
- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5;
- (_TtC8VideosUI27CanonicalTemplateController)initWithCoder:(id)a3;
- (void)vuiScrollViewDidEndDecelerating:(id)a3;
- (void)vuiScrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
@end

@implementation CanonicalTemplateController

- (void)vui_viewDidAppear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E364EECC(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E364EFA8(v4);
}

- (void)vuiScrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E364FE6C((uint64_t)v6, a4);
}

- (void)vuiScrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E3650060((uint64_t)v4);
}

- (_TtC8VideosUI27CanonicalTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI27CanonicalTemplateController *)sub_1E3650118(a3);
}

- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5
{
  uint64_t v8 = sub_1E38764B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3876448();
  id v12 = a4;
  v13 = self;
  LOBYTE(a3) = sub_1E36501CC(a3, v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return a3 & 1;
}

@end