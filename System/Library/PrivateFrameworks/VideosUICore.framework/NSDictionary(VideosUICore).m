@interface NSDictionary(VideosUICore)
- (id)_vui_lookupValueForKey:()VideosUICore expectedClass:;
- (id)vui_URLForKey:()VideosUICore;
- (id)vui_arrayForKey:()VideosUICore;
- (id)vui_attrStringForKey:()VideosUICore;
- (id)vui_dataForKey:()VideosUICore;
- (id)vui_dateForKey:()VideosUICore;
- (id)vui_dictionaryForKey:()VideosUICore;
- (id)vui_errorForKey:()VideosUICore;
- (id)vui_numberForKey:()VideosUICore;
- (id)vui_stringForKey:()VideosUICore;
- (uint64_t)vui_BOOLForKey:()VideosUICore defaultValue:;
@end

@implementation NSDictionary(VideosUICore)

- (id)vui_URLForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  if (!v5)
  {
    v6 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());
    v7 = v6;
    if (v6 && [v6 length])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "vui_URLWithString:", v7);
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)vui_arrayForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (uint64_t)vui_BOOLForKey:()VideosUICore defaultValue:
{
  v5 = objc_msgSend(a1, "vui_numberForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)vui_stringForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)vui_numberForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)vui_dictionaryForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)_vui_lookupValueForKey:()VideosUICore expectedClass:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)vui_attrStringForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)vui_dateForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)vui_dataForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)vui_errorForKey:()VideosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_vui_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

@end