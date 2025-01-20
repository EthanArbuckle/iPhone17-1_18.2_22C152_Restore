@interface CLPlacemark(PXContextualMemoriesSettingsUI)
- (id)_px_dynamicLocationString;
- (id)px_subtitle;
- (id)px_title;
@end

@implementation CLPlacemark(PXContextualMemoriesSettingsUI)

- (id)_px_dynamicLocationString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [&unk_1F02D4090 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(&unk_1F02D4090);
      }
      v8 = [a1 valueForKey:*(void *)(*((void *)&v13 + 1) + 8 * v7)];
      id v9 = v2;
      id v10 = v8;
      uint64_t v11 = [v10 length];
      if (v11)
      {
        if ([v9 length]) {
          [v9 appendFormat:@", %@", v10];
        }
        else {
          [v9 appendString:v10];
        }
      }

      if (v11) {
        ++v5;
      }

      if (v5 == 2) {
        break;
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [&unk_1F02D4090 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  return v2;
}

- (id)px_subtitle
{
  v2 = [a1 areasOfInterest];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = objc_msgSend(a1, "_px_dynamicLocationString");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)px_title
{
  v2 = [a1 areasOfInterest];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [a1 areasOfInterest];
    uint64_t v5 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v5 = objc_msgSend(a1, "_px_dynamicLocationString");
  }
  return v5;
}

@end