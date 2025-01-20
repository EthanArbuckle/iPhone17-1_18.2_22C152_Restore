@interface StickersAPIService.Delegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCV9stickersd18StickersAPIService8Delegate)init;
@end

@implementation StickersAPIService.Delegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000683C(v7);

  return v9 & 1;
}

- (_TtCV9stickersd18StickersAPIService8Delegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickersAPIService.Delegate();
  return [(StickersAPIService.Delegate *)&v3 init];
}

@end