@interface LNAppShortcutDynamicOptionsProviderReference(SerializableRepresentation)
- (id)initWithSerializedRepresentation:()SerializableRepresentation;
- (id)serializableRepresentation;
@end

@implementation LNAppShortcutDynamicOptionsProviderReference(SerializableRepresentation)

- (id)serializableRepresentation
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"appShortcutsProviderMangledTypeName";
  v2 = [a1 appShortcutsProviderMangledTypeName];
  v9[0] = v2;
  v8[1] = @"parameterIdentifier";
  v3 = [a1 parameterIdentifier];
  v9[1] = v3;
  v8[2] = @"appShortcutIndex";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "appShortcutIndex"));
  v9[2] = v4;
  v8[3] = @"optionsProviderIndex";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "optionsProviderIndex"));
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)initWithSerializedRepresentation:()SerializableRepresentation
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 valueForKey:@"appShortcutsProviderMangledTypeName"];
    v7 = [v5 valueForKey:@"parameterIdentifier"];
    v8 = [v5 valueForKey:@"appShortcutIndex"];
    v9 = [v5 valueForKey:@"optionsProviderIndex"];
    v10 = v9;
    id v11 = 0;
    if (v6 && v7 && v8 && v9)
    {
      a1 = (id)objc_msgSend(a1, "initWithAppShortcutsProviderMangledTypeName:parameterIdentifier:appShortcutIndex:optionsProviderIndex:", v6, v7, objc_msgSend(v8, "integerValue"), objc_msgSend(v9, "integerValue"));
      id v11 = a1;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end