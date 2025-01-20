@interface ScriptStorefrontCache
- (NSString)storefrontLanguageCode;
- (_TtC15SeymourServices21ScriptStorefrontCache)init;
@end

@implementation ScriptStorefrontCache

- (_TtC15SeymourServices21ScriptStorefrontCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScriptStorefrontCache();
  return [(ScriptStorefrontCache *)&v3 init];
}

- (NSString)storefrontLanguageCode
{
  objc_super v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_standardUserDefaults);
  sub_1D6FA74C0();
  v6 = (void *)sub_1D6FA98B0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_stringForKey_, v6);

  if (v7)
  {
    sub_1D6FA98E0();

    v8 = (void *)sub_1D6FA98B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v8 = 0;
  }

  return (NSString *)v8;
}

@end