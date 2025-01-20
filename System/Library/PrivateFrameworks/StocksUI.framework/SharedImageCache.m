@interface SharedImageCache
- (id)fetchImageForKey:(id)a3;
- (void)cache:(id)a3 forKey:(id)a4;
- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5;
@end

@implementation SharedImageCache

- (id)fetchImageForKey:(id)a3
{
  sub_20A8CE280();
  swift_retain();
  v3 = (void *)sub_20A8C8AD0();
  swift_release();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5
{
  sub_20A8CE280();
  id v6 = a3;
  swift_retain();
  sub_20A8C8AC0();

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)cache:(id)a3 forKey:(id)a4
{
  sub_20A8CE280();
  id v5 = a3;
  swift_retain();
  sub_20A8C8AC0();

  swift_release();

  swift_bridgeObjectRelease();
}

@end