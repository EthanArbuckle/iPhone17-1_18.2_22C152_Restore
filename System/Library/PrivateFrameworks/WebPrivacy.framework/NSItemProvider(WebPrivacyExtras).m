@interface NSItemProvider(WebPrivacyExtras)
- (void)_wp_removeTrackingInformationFromURLRepresentation;
@end

@implementation NSItemProvider(WebPrivacyExtras)

- (void)_wp_removeTrackingInformationFromURLRepresentation
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [(id)*MEMORY[0x263F1DD08] identifier];
  v3 = [a1 _representationConformingToType:v2];

  if (v3)
  {
    v4 = [v3 typeIdentifier];
    v5 = [(id)*MEMORY[0x263F1DAA0] identifier];
    int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      v7 = WPOSLogAPI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_2617B2000, v7, OS_LOG_TYPE_INFO, "Skipping URL returned from item provider (%@)", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = [v3 preferredRepresentation];
      uint64_t v9 = [v3 visibility];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke;
      v10[3] = &unk_265585FF8;
      id v11 = v3;
      id v12 = v4;
      [a1 _addRepresentationType:v12 preferredRepresentation:v8 visibility:v9 loader:v10];
    }
  }
}

@end