@interface NSFileManager
- (id)jsa_pathForCacheDirectoryWithDomain:(id)a3;
@end

@implementation NSFileManager

- (id)jsa_pathForCacheDirectoryWithDomain:(id)a3
{
  uint64_t v4 = sub_86860();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = NSFileManager.pathForCacheDirectory(with:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    NSString v10 = sub_86830();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

@end