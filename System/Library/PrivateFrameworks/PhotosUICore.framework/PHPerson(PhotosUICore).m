@interface PHPerson(PhotosUICore)
+ (id)px_localizedNameFromContact:()PhotosUICore;
- (BOOL)px_isSameDetectionTypeAsPerson:()PhotosUICore;
- (__CFString)px_longStyleLocalizedName;
- (id)_px_localizedNameWithStyle:()PhotosUICore;
- (id)px_localizedName;
- (id)px_nameComponents;
- (id)px_navigationURL;
@end

@implementation PHPerson(PhotosUICore)

- (id)px_localizedName
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = objc_getAssociatedObject(v1, &PersonLocalizedNameKey);
  if (!v2)
  {
    v2 = objc_msgSend(v1, "_px_localizedNameWithStyle:", 1);
    if ([v2 length])
    {
LABEL_9:
      objc_setAssociatedObject(v1, &PersonLocalizedNameKey, v2, (void *)0x301);
      goto LABEL_10;
    }
    v3 = [v1 displayName];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      uint64_t v5 = [v1 displayName];
    }
    else
    {
      v6 = [v1 name];
      uint64_t v7 = [v6 length];

      if (!v7)
      {
        v8 = &stru_1F00B0030;
        goto LABEL_8;
      }
      uint64_t v5 = [v1 name];
    }
    v8 = (__CFString *)v5;
LABEL_8:

    v2 = v8;
    goto LABEL_9;
  }
LABEL_10:
  objc_sync_exit(v1);

  return v2;
}

- (id)_px_localizedNameWithStyle:()PhotosUICore
{
  uint64_t v4 = objc_msgSend(a1, "px_nameComponents");
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v4 style:a3 options:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)px_nameComponents
{
  id v1 = [a1 contactMatchingDictionary];
  v2 = [v1 objectForKeyedSubscript:@"first-name"];
  v3 = [v1 objectForKeyedSubscript:@"last-name"];
  if ([v2 length] || objc_msgSend(v3, "length"))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v4 setGivenName:v2];
    [v4 setFamilyName:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)px_isSameDetectionTypeAsPerson:()PhotosUICore
{
  id v4 = a3;
  unsigned int v5 = [a1 detectionType];
  BOOL v6 = 0;
  if (v5 <= 4 && ((1 << v5) & 0x1A) != 0) {
    BOOL v6 = v5 == [v4 detectionType];
  }

  return v6;
}

- (id)px_navigationURL
{
  id v1 = NSString;
  v2 = [a1 localIdentifier];
  v3 = [v1 stringWithFormat:@"photos://people?identifier=%@", v2];

  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return v4;
}

- (__CFString)px_longStyleLocalizedName
{
  objc_msgSend(a1, "_px_localizedNameWithStyle:", 3);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v2 length])
  {
    v3 = [a1 name];

    if ([(__CFString *)v3 length])
    {
      v2 = v3;
    }
    else
    {

      v2 = &stru_1F00B0030;
    }
  }
  return v2;
}

+ (id)px_localizedNameFromContact:()PhotosUICore
{
  v3 = (objc_class *)MEMORY[0x1E4F28F30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  BOOL v6 = [v4 givenName];
  [v5 setGivenName:v6];

  uint64_t v7 = [v4 familyName];

  [v5 setFamilyName:v7];
  v8 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v5 style:1 options:0];

  return v8;
}

@end