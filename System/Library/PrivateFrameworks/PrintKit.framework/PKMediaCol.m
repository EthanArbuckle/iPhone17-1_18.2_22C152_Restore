@interface PKMediaCol
- (BOOL)getMargins:(pwg_size_s *)a3;
- (NSString)mediaKey;
- (NSString)mediaSource;
- (NSString)mediaType;
- (PKMediaSize)mediaSize;
- (PKMediaSourceProperties)mediaSourceProperties;
- (id)userCodableDictionary;
@end

@implementation PKMediaCol

- (id)userCodableDictionary
{
  v3 = objc_opt_new();
  v4 = [(PKMediaCol *)self mediaSize];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 userCodableDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"media-size"];
  }
  v7 = [(PKMediaCol *)self mediaSourceProperties];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 userCodableDictionary];
    [v3 setObject:v9 forKeyedSubscript:@"media-source-properties"];
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if ([(PKMediaCol *)self getMargins:&v18])
  {
    v10 = [NSNumber numberWithInt:HIDWORD(v19)];
    [v3 setObject:v10 forKeyedSubscript:@"media-bottom-margin"];

    v11 = [NSNumber numberWithInt:v19];
    [v3 setObject:v11 forKeyedSubscript:@"media-left-margin"];

    v12 = [NSNumber numberWithInt:HIDWORD(v20)];
    [v3 setObject:v12 forKeyedSubscript:@"media-top-margin"];

    v13 = [NSNumber numberWithInt:v20];
    [v3 setObject:v13 forKeyedSubscript:@"media-right-margin"];
  }
  v14 = [(PKMediaCol *)self mediaSource];
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:@"media-source"];
  }

  v15 = [(PKMediaCol *)self mediaType];
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:@"media-type"];
  }

  v16 = [(PKMediaCol *)self mediaKey];
  if (v16) {
    [v3 setObject:v16 forKeyedSubscript:@"media-key"];
  }

  return v3;
}

- (PKMediaSize)mediaSize
{
  v2 = [(PKCollectionSpecialization *)self params];

  return (PKMediaSize *)Printd_Parameters::_get_MediaSize(&v2->var0);
}

- (PKMediaSourceProperties)mediaSourceProperties
{
  v2 = [(PKCollectionSpecialization *)self params];

  return (PKMediaSourceProperties *)Printd_Parameters::_get_MediaSourceProperties(&v2->var0);
}

- (BOOL)getMargins:(pwg_size_s *)a3
{
  unint64_t v4 = 0;
  BOOL v5 = 0;
  v14[7] = *MEMORY[0x263EF8340];
  v13 = @"media-bottom-margin";
  v14[0] = (char *)&a3->map.ppd + 4;
  v14[1] = @"media-left-margin";
  v14[2] = &a3->map.ppd;
  v14[3] = @"media-top-margin";
  v14[4] = &a3->length;
  v14[5] = @"media-right-margin";
  v14[6] = &a3->width;
  v6 = (_DWORD **)v14;
  while (1)
  {
    v7 = [(PKCollectionSpecialization *)self collection];
    v8 = [v7 _findAttribute0:*(v6 - 1) valueTag:33];

    if (!v8) {
      break;
    }
    int IXInteger = ippGetIXInteger(v8, 0);
    v10 = *v6;
    v6 += 2;
    _DWORD *v10 = IXInteger;

    BOOL v5 = v4++ > 2;
    if (v4 == 4)
    {
      BOOL v5 = 1;
      break;
    }
  }
  for (uint64_t i = 6; i != -2; i -= 2)

  return v5;
}

- (NSString)mediaSource
{
  v2 = [(PKCollectionSpecialization *)self params];

  return (NSString *)Printd_Parameters::_get_MediaSource(&v2->var0);
}

- (NSString)mediaType
{
  v2 = [(PKCollectionSpecialization *)self params];

  return (NSString *)Printd_Parameters::_get_MediaType(&v2->var0);
}

- (NSString)mediaKey
{
  v2 = [(PKCollectionSpecialization *)self params];

  return (NSString *)Printd_Parameters::_get_MediaKey(&v2->var0);
}

@end