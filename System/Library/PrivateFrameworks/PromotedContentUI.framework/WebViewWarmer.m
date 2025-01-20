@interface WebViewWarmer
- (_TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer)init;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation WebViewWarmer

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer_finished);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    v10 = self;
    uint64_t v9 = sub_1B5D09328((uint64_t)v4);
    v4(v9);
    sub_1B5D09338((uint64_t)v4);
  }
}

- (_TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer_finished);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(WebViewWarmer *)&v6 init];
}

- (void).cxx_destruct
{
  sub_1B5D09338(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17PromotedContentUIP33_F33E7C2993C44F3307C22CD11BA85E0E13WebViewWarmer_finished));
}

@end