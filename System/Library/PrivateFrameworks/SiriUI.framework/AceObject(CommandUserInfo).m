@interface AceObject(CommandUserInfo)
- (void)_siriui_applyUserInfoDictionary:()CommandUserInfo;
@end

@implementation AceObject(CommandUserInfo)

- (void)_siriui_applyUserInfoDictionary:()CommandUserInfo
{
  id v10 = a3;
  if ([a1 conformsToProtocol:&unk_26D6B1F60])
  {
    v4 = [v10 objectForKey:@"CRKMapCardSectionPlacemarkData"];
    v5 = [MEMORY[0x263F41B08] mapItemStorageForSerializedPlaceData:v4];
    v6 = [MEMORY[0x263F00AA8] placemarkWithGEOMapItem:v5];
    v7 = INIntentSlotValueTransformToLocation();

    id v8 = objc_alloc_init(MEMORY[0x263F649F8]);
    v9 = [v7 data];
    [v8 setData:v9];

    [a1 setLocation:v8];
  }
}

@end