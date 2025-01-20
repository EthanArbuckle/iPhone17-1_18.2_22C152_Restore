@interface UIApplication
- (void)my_openURL:(id)a3 originatingView:(id)a4 options:(id)a5 completionHandler:(id)a6;
@end

@implementation UIApplication

- (void)my_openURL:(id)a3 originatingView:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = sub_10000D0A0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  sub_10000D070();
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    v13 = sub_10000CF38;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = a4;
  v16 = self;
  sub_10000B994((uint64_t)v15, (uint64_t)v13, v14, v17);
  sub_10000CCE4((uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end