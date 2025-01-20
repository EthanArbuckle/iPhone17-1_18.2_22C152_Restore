@interface SharedImageCache
- (id)fetchImageForKey:(id)a3;
- (void)cache:(id)a3 forKey:(id)a4;
- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5;
@end

@implementation SharedImageCache

- (id)fetchImageForKey:(id)a3
{
  uint64_t v3 = sub_1B61B20F0();
  v5 = v4;
  swift_retain();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  v7 = (void *)SharedImageCache.fetchImage(_:)(v6);
  swift_release();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)cache:(id)a3 forKey:(id)a4 immediately:(BOOL)a5
{
  uint64_t v6 = sub_1B61B20F0();
  v8 = v7;
  id v9 = a3;
  swift_retain();
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  SharedImageCache.cache(_:forKey:immediately:)((UIImage)v9, v10, 0);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cache:(id)a3 forKey:(id)a4
{
  uint64_t v5 = sub_1B61B20F0();
  v7 = v6;
  id v8 = a3;
  swift_retain();
  v9._countAndFlagsBits = v5;
  v9._object = v7;
  SharedImageCache.cache(_:forKey:)((UIImage)v8, v9);

  swift_release();
  swift_bridgeObjectRelease();
}

@end