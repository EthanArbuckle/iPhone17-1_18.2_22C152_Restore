@interface Browse_Entity
- (BOOL)isEqual:(id)a3;
- (id)bonjourName;
- (id)browseInfo;
- (id)displayName;
- (id)txtRecordDictionary;
- (int)provenance;
- (unint64_t)hash;
@end

@implementation Browse_Entity

- (id)bonjourName
{
  return 0;
}

- (id)displayName
{
  return 0;
}

- (id)txtRecordDictionary
{
  return 0;
}

- (int)provenance
{
  return 0;
}

- (id)browseInfo
{
  id v3 = objc_alloc((Class)PKPrinterBrowseInfo);
  v4 = [(Browse_Entity *)self bonjourName];
  v5 = [(Browse_Entity *)self txtRecordDictionary];
  id v6 = [v3 initWithBonjourName:v4 txtRecord:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(Browse_Entity *)self browseInfo];
    v7 = [v5 browseInfo];
    unsigned __int8 v8 = [v6 isEqualToBrowseInfo:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(Browse_Entity *)self browseInfo];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

@end