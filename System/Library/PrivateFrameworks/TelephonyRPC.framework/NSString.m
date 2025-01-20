@interface NSString
@end

@implementation NSString

void __53__NSString_Uppercasing__nph_localizedUppercaseString__block_invoke()
{
  v8[4] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.private.NanoPhoneUI"];
  v7[0] = @"CALL_SERVICE_FACETIME_AUDIO";
  v1 = objc_msgSend(v0, "localizedStringForKey:value:table:");
  v8[0] = v1;
  v7[1] = @"CALL_SERVICE_FACETIME_VIDEO";
  v2 = objc_msgSend(v0, "localizedStringForKey:value:table:");
  v8[1] = v2;
  v7[2] = @"CALL_SERVICE_FACETIME_AUDIO_UPPERCASE";
  v3 = objc_msgSend(v0, "localizedStringForKey:value:table:");
  v8[2] = v3;
  v7[3] = @"CALL_SERVICE_FACETIME_VIDEO_UPPERCASE";
  v4 = objc_msgSend(v0, "localizedStringForKey:value:table:");
  v8[3] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v6 = (void *)nph_localizedUppercaseString_map;
  nph_localizedUppercaseString_map = v5;
}

@end