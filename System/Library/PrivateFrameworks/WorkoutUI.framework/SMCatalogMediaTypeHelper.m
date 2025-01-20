@interface SMCatalogMediaTypeHelper
+ (id)mediaTypeBridgeRawValueFrom:(id)a3;
- (SMCatalogMediaTypeHelper)init;
@end

@implementation SMCatalogMediaTypeHelper

+ (id)mediaTypeBridgeRawValueFrom:(id)a3
{
  uint64_t v3 = sub_261B8F0F8();
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  char v6 = MEMORY[0x263E49390](v3, v5);
  uint64_t v7 = 1;
  id v8 = 0;
  switch(v6)
  {
    case 1:
      uint64_t v7 = 2;
      goto LABEL_5;
    case 2:
      uint64_t v7 = 3;
      goto LABEL_5;
    case 3:
      uint64_t v7 = 4;
      goto LABEL_5;
    case 4:
      goto LABEL_6;
    default:
LABEL_5:
      id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v7);
LABEL_6:
      swift_bridgeObjectRelease();
      return v8;
  }
}

- (SMCatalogMediaTypeHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CatalogMediaTypeHelper();
  return [(SMCatalogMediaTypeHelper *)&v3 init];
}

@end