@interface SFSafariPreferencesDomain
@end

@implementation SFSafariPreferencesDomain

void ___SFSafariPreferencesDomain_block_invoke()
{
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v0 = objc_msgSend(v7, "safari_currentProcessIsContainerized");

  if (v0)
  {
    id v1 = (id)*MEMORY[0x1E4F981F8];
    v2 = (void *)_SFSafariPreferencesDomain::domain;
    _SFSafariPreferencesDomain::domain = (uint64_t)v1;
  }
  else
  {
    _SFSafariContainerPath();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v3 = _SFSafariContainerPath();
      uint64_t v4 = [v3 stringByAppendingPathComponent:@"Library/Preferences/com.apple.mobilesafari"];
      v5 = (void *)_SFSafariPreferencesDomain::domain;
      _SFSafariPreferencesDomain::domain = v4;
    }
    else
    {
      id v6 = (id)*MEMORY[0x1E4F981F8];
      v3 = (void *)_SFSafariPreferencesDomain::domain;
      _SFSafariPreferencesDomain::domain = (uint64_t)v6;
    }

    v2 = v8;
  }
}

@end