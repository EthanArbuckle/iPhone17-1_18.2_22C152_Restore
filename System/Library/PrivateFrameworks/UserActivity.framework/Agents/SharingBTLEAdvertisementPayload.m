@interface SharingBTLEAdvertisementPayload
+ (id)dateEpochStart:(id)a3;
- (BOOL)compareOptionBits:(unsigned __int8)a3;
- (BOOL)containsPasteboard;
- (BOOL)isCurrent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualHashedPayloadBytes:(id)a3;
- (BOOL)matchesItem:(id)a3;
- (NSData)payloadBytes;
- (NSDate)currentUntil;
- (NSDate)epochEnd;
- (NSDate)epochStart;
- (NSDate)time;
- (NSDate)validUntil;
- (NSDate)when;
- (NSDictionary)options;
- (NSUUID)activityUUID;
- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3;
- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3 options:(id)a4;
- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5;
- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5 versionFlags:(unsigned __int8)a6;
- (SharingBTLEAdvertisementPayload)initWithSFActivityAdvertisement:(id)a3;
- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10;
- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10 versionFlags:(unsigned __int8)a11;
- (id)advertisementPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)now;
- (int)advertisementKind;
- (unsigned)optionBits;
- (unsigned)timeOffset;
- (void)setCurrent:(BOOL)a3;
- (void)setEpochStart:(id)a3;
- (void)setOptionBits:(unsigned __int8)a3;
- (void)setOptions:(id)a3;
- (void)setPayloadBytes:(id)a3;
- (void)setTimeOffset:(unsigned __int8)a3;
- (void)setWhen:(id)a3;
@end

@implementation SharingBTLEAdvertisementPayload

- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5 versionFlags:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 type];
  v12 = [v9 activityType];
  v13 = [v9 dynamicActivityType];
  v14 = [v9 teamIdentifier];
  v15 = [v9 webpageURL];
  v16 = [v9 options];
  LOBYTE(v20) = a6;
  LOBYTE(v19) = a4;
  v17 = [(SharingBTLEAdvertisementPayload *)self initWithType:v11 string:v12 dynamicType:v13 teamID:v14 webpageURL:v15 options:v16 isCurrent:v19 when:v10 versionFlags:v20];

  return v17;
}

- (SharingBTLEAdvertisementPayload)initWithItem:(id)a3 isCurrent:(BOOL)a4 when:(id)a5
{
  return [(SharingBTLEAdvertisementPayload *)self initWithItem:a3 isCurrent:a4 when:a5 versionFlags:0];
}

- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10 versionFlags:(unsigned __int8)a11
{
  id v68 = a4;
  id v69 = a5;
  id v70 = a6;
  id v71 = a7;
  id v17 = a8;
  id v72 = a10;
  v73.receiver = self;
  v73.super_class = (Class)SharingBTLEAdvertisementPayload;
  v18 = [(SharingBTLEAdvertisementPayload *)&v73 init];
  if (v18)
  {
    id v19 = v68;
    id v67 = v69;
    id v20 = v70;
    id v21 = v71;
    id v22 = 0;
    uint64_t v23 = 1;
    if ((uint64_t)a3 > 2)
    {
      switch(a3)
      {
        case 3uLL:
          id v22 = v19;
          uint64_t v23 = 3;
          break;
        case 0x15uLL:
          *(_DWORD *)&buf[3] = 1196312912;
          *(_DWORD *)buf = 1342177280;
          uint64_t v24 = +[NSData dataWithBytes:buf length:7];
LABEL_12:
          v26 = (void *)v24;
          id v22 = 0;
          uint64_t v23 = 1;
          if (v24) {
            goto LABEL_22;
          }
          break;
        case 0x16uLL:
          *(_DWORD *)&buf[3] = 1196314448;
          *(_DWORD *)buf = 1342177280;
          uint64_t v24 = +[NSData dataWithBytes:buf length:7];
          goto LABEL_12;
      }
LABEL_21:
      v26 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
LABEL_22:
      v29 = sub_10000BA18(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = sub_100003070(v26);
        *(_DWORD *)buf = 134218499;
        *(void *)&buf[4] = v23;
        __int16 v75 = 2113;
        id v76 = v22;
        __int16 v77 = 2114;
        v78 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Calculated advertisingBytes for %ld / %{private}@, result=%{public}@", buf, 0x20u);
      }
      id v31 = [v26 copy];

      v32 = (void *)*((void *)v18 + 3);
      *((void *)v18 + 3) = 0;

      if (!v31) {
        goto LABEL_58;
      }
      if ([v31 length] != (id)7) {
        __assert_rtn("-[SharingBTLEAdvertisementPayload initWithType:string:dynamicType:teamID:webpageURL:options:isCurrent:when:versionFlags:]", "SharingAdvertisementPayload.mm", 217, "[hashedActivityType length] == sizeof( _bytes.hashedAdvertisementBytes)");
      }
      v33 = (int *)[v31 bytes];
      int v34 = *v33;
      *(_DWORD *)(v18 + 11) = *(int *)((char *)v33 + 3);
      *((_DWORD *)v18 + 2) = v34;
      v18[15] = 0;
      if (v21)
      {
        id v35 = v21;
        v36 = [v35 scheme];
        BOOL v37 = v36 == 0;

        if (v37)
        {
        }
        else
        {
          v38 = [v35 scheme];
          if ([v38 compare:@"http" options:1])
          {

LABEL_32:
            v18[15] |= 1u;
            goto LABEL_33;
          }
          v39 = [v35 scheme];
          BOOL v40 = [v39 compare:@"https" options:1] == 0;

          if (!v40) {
            goto LABEL_32;
          }
        }
      }
LABEL_33:
      if (v17)
      {
        v41 = [v17 objectForKeyedSubscript:_LSUserActivityContainsFileProviderURLKey];
        unsigned int v42 = [v41 BOOLValue];

        if (v42) {
          v18[15] |= 2u;
        }
        v43 = [v17 objectForKeyedSubscript:_UAUserActivityContainsCloudDocsKey];
        unsigned int v44 = [v43 BOOLValue];

        if (v44) {
          v18[15] |= 4u;
        }
        v45 = [v17 objectForKeyedSubscript:@"UAPasteboardAvailable"];
        unsigned int v46 = [v45 BOOLValue];

        if (v46)
        {
          v18[15] |= 8u;
          v47 = [v17 objectForKeyedSubscript:@"UAPasteboardVersionBit"];
          unsigned int v48 = [v47 BOOLValue];

          if (v48) {
            v18[15] |= 0x10u;
          }
        }
        v49 = [v17 objectForKeyedSubscript:UAUserActivityAutoPullActivitiesListKey];
        unsigned int v50 = [v49 BOOLValue];

        if (v50) {
          v18[15] |= 0x20u;
        }
        v51 = [v17 objectForKeyedSubscript:@"UAUserActivityAdvertiserHasMoreActivities"];
        unsigned int v52 = [v51 BOOLValue];

        if (v52) {
          v18[15] |= 0x40u;
        }
        v53 = [v17 objectForKeyedSubscript:@"UAUserActivityItemIsNotActiveKey"];
        unsigned int v54 = [v53 BOOLValue];

        if (v54) {
          v18[15] |= 0x80u;
        }
        id v55 = [v17 copy];
        v56 = (void *)*((void *)v18 + 5);
        *((void *)v18 + 5) = v55;
      }
      v57 = v72;
      if (!v72)
      {
        v57 = +[NSDate date];
      }
      [v18 setWhen:v57];
      if (!v72) {

      }
      id v58 = [v18 when];
      v59 = +[SharingBTLEAdvertisementPayload dateEpochStart:v58];
      [v58 timeIntervalSinceDate:v59];
      double v61 = fmax(trunc(v60) * 0.25, 0.0);
      int v62 = (int)v61;
      if (v61 > 124.0) {
        LOBYTE(v62) = -1;
      }
      if (a9) {
        char v63 = v62 | 0x80;
      }
      else {
        char v63 = v62;
      }

      v18[16] = v63;
      v64 = [v18 when];
      v65 = +[SharingBTLEAdvertisementPayload dateEpochStart:v64];
      [v18 setEpochStart:v65];

LABEL_58:
      goto LABEL_59;
    }
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        v25 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
        id v22 = +[NSString stringWithFormat:@"%@#%@", @"NOTIFICATION", v25];

        uint64_t v23 = 4;
      }
      goto LABEL_21;
    }
    if ([v19 isEqual:@"NSUserActivityTypeBrowsingWeb"])
    {
      uint64_t v27 = [v21 host];
      uint64_t v23 = 2;
    }
    else
    {
      if (![v19 isEqual:@"com.apple.GameController"]
        && [v67 length])
      {
        v28 = +[NSString stringWithFormat:@"%@:%@", v19, v67];
        id v22 = (id)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();

        uint64_t v23 = 1;
        goto LABEL_21;
      }
      uint64_t v27 = _LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
      uint64_t v23 = 1;
    }
    id v22 = (id)v27;
    goto LABEL_21;
  }
LABEL_59:

  return (SharingBTLEAdvertisementPayload *)v18;
}

- (SharingBTLEAdvertisementPayload)initWithType:(unint64_t)a3 string:(id)a4 dynamicType:(id)a5 teamID:(id)a6 webpageURL:(id)a7 options:(id)a8 isCurrent:(BOOL)a9 when:(id)a10
{
  LOBYTE(v12) = 0;
  LOBYTE(v11) = a9;
  return [(SharingBTLEAdvertisementPayload *)self initWithType:a3 string:a4 dynamicType:a5 teamID:a6 webpageURL:a7 options:a8 isCurrent:v11 when:a10 versionFlags:v12];
}

- (SharingBTLEAdvertisementPayload)initWithSFActivityAdvertisement:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SharingBTLEAdvertisementPayload;
  v5 = [(SharingBTLEAdvertisementPayload *)&v28 init];
  v6 = v5;
  if (v5)
  {
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = 0;

    v8 = [v4 advertisementPayload];
    if (v8)
    {
      id v9 = [v4 advertisementPayload];
      id v10 = [v9 length];

      if (v10 == (id)9)
      {
        id v11 = [v4 advertisementPayload];
        uint64_t v12 = [v11 bytes];
        uint64_t v13 = *(void *)v12;
        v6->_bytes.timeOffset = v12[8];
        *(void *)v6->_bytes.hashedAdvertisementBytes = v13;
      }
    }
    v14 = [v4 options];
    if (v14)
    {
      v15 = [v4 options];
      v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];
    }
    else
    {
      v16 = +[NSMutableDictionary dictionary];
    }

    uint64_t v17 = [v4 options];
    options = v6->_options;
    v6->_options = (NSDictionary *)v17;

    id v19 = +[NSDate date];
    uint64_t v20 = +[SharingBTLEAdvertisementPayload dateEpochStart:v19];
    epochStart = v6->_epochStart;
    v6->_epochStart = (NSDate *)v20;

    uint64_t v22 = [(SharingBTLEAdvertisementPayload *)v6 time];
    when = v6->_when;
    v6->_when = (NSDate *)v22;

    unsigned __int8 optionBits = v6->_bytes.optionBits;
    if (optionBits)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:UAUserActivityHasWebPageURLOptionKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }
    if ((optionBits & 2) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:_LSUserActivityContainsFileProviderURLKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }
    if ((optionBits & 4) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:_UAUserActivityContainsCloudDocsKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }
    if ((optionBits & 8) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAPasteboardAvailable"];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
      if ((optionBits & 0x10) != 0)
      {
        [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAPasteboardVersionBit"];
        unsigned __int8 optionBits = v6->_bytes.optionBits;
      }
    }
    if ((optionBits & 0x20) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:UAUserActivityAutoPullActivitiesListKey];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }
    if ((optionBits & 0x40) != 0)
    {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAUserActivityAdvertiserHasMoreActivities"];
      unsigned __int8 optionBits = v6->_bytes.optionBits;
    }
    if ((optionBits & 0x80) != 0) {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UAUserActivityItemIsNotActiveKey"];
    }
    v25 = (NSDictionary *)[v16 copy];
    v26 = v6->_options;
    v6->_options = v25;
  }
  return v6;
}

- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SharingBTLEAdvertisementPayload;
  v8 = [(SharingBTLEAdvertisementPayload *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    activityUUID = v8->_activityUUID;
    v8->_activityUUID = 0;

    if (v7)
    {
      id v11 = (NSDictionary *)[v7 copy];
      options = v9->_options;
      v9->_options = v11;
    }
    else
    {
      options = v9->_options;
      v9->_options = 0;
    }

    if (v6)
    {
      if ([v6 length] == (id)9)
      {
        uint64_t v13 = [v6 bytes];
        uint64_t v14 = *(void *)v13;
        v9->_bytes.timeOffset = v13[8];
        *(void *)v9->_bytes.hashedAdvertisementBytes = v14;
        goto LABEL_11;
      }
      if ([v6 length] == (id)7)
      {
        v15 = (int *)[v6 bytes];
        int v16 = *v15;
        *(_DWORD *)&v9->_bytes.hashedAdvertisementBytes[3] = *(int *)((char *)v15 + 3);
        *(_DWORD *)v9->_bytes.hashedAdvertisementBytes = v16;
        *(_WORD *)&v9->_bytes.unsigned __int8 optionBits = 0;
        goto LABEL_11;
      }
    }
    v9->_bytes.timeOffset = 0;
    *(void *)v9->_bytes.hashedAdvertisementBytes = 0;
  }
LABEL_11:

  return v9;
}

- (SharingBTLEAdvertisementPayload)initWithAdvertisedBytes:(id)a3
{
  return [(SharingBTLEAdvertisementPayload *)self initWithAdvertisedBytes:a3 options:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SharingBTLEAdvertisementPayload alloc];
  v5 = +[NSData dataWithBytes:&self->_bytes length:9];
  id v6 = [(SharingBTLEAdvertisementPayload *)v4 initWithAdvertisedBytes:v5];

  if (v6)
  {
    uint64_t v7 = [(SharingBTLEAdvertisementPayload *)self epochStart];
    epochStart = v6->_epochStart;
    v6->_epochStart = (NSDate *)v7;
  }
  return v6;
}

- (NSData)payloadBytes
{
  return +[NSData dataWithBytes:&self->_bytes length:7];
}

- (void)setPayloadBytes:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 length] != (id)8) {
      __assert_rtn("-[SharingBTLEAdvertisementPayload setPayloadBytes:]", "SharingAdvertisementPayload.mm", 376, "[payloadBytes length] == sizeof( sizeof( _bytes.hashedAdvertisementBytes))");
    }
    [v5 getBytes:&self->_bytes length:7];
  }
  else
  {
    self->_bytes.timeOffset = 0;
    *(void *)self->_bytes.hashedAdvertisementBytes = 0;
  }
}

- (BOOL)isCurrent
{
  return self->_bytes.timeOffset >> 7;
}

- (void)setCurrent:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  self->_bytes.timeOffset = v3 & 0x80 | self->_bytes.timeOffset & 0x7F;
}

- (unsigned)timeOffset
{
  return self->_bytes.timeOffset & 0x7F;
}

- (void)setTimeOffset:(unsigned __int8)a3
{
  self->_bytes.timeOffset = self->_bytes.timeOffset & 0x80 | a3 & 0x7F;
}

- (unsigned)optionBits
{
  return self->_bytes.optionBits;
}

- (void)setOptionBits:(unsigned __int8)a3
{
  self->_bytes.unsigned __int8 optionBits = a3;
}

- (BOOL)compareOptionBits:(unsigned __int8)a3
{
  return ((self->_bytes.optionBits ^ a3) & 7) == 0;
}

- (BOOL)containsPasteboard
{
  return (self->_bytes.optionBits >> 3) & 1;
}

- (id)advertisementPayload
{
  return +[NSData dataWithBytes:&self->_bytes length:9];
}

- (int)advertisementKind
{
  v2 = +[NSData dataWithBytes:&self->_bytes length:9];
  uint64_t v3 = _LSAdvertisementBytesKind();
  if ((unint64_t)(v3 - 1) < 5) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (SharingBTLEAdvertisementPayload *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    unsigned int v5 = [(SharingBTLEAdvertisementPayload *)self optionBits];
    if (v5 == [(SharingBTLEAdvertisementPayload *)v4 optionBits]
      && ((unsigned int v6 = [(SharingBTLEAdvertisementPayload *)self isCurrent],
           v6 == [(SharingBTLEAdvertisementPayload *)v4 isCurrent])
       || (unsigned int v7 = [(SharingBTLEAdvertisementPayload *)self timeOffset],
           v7 == [(SharingBTLEAdvertisementPayload *)v4 timeOffset])))
    {
      v8 = [(SharingBTLEAdvertisementPayload *)self payloadBytes];
      id v9 = [(SharingBTLEAdvertisementPayload *)v4 payloadBytes];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isEqualHashedPayloadBytes:(id)a3
{
  if (!a3) {
    return 0;
  }
  return *(_DWORD *)self->_bytes.hashedAdvertisementBytes == *((_DWORD *)a3 + 2)
      && *(_DWORD *)&self->_bytes.hashedAdvertisementBytes[3] == *(_DWORD *)((char *)a3 + 11);
}

- (BOOL)matchesItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[SharingBTLEAdvertisementPayload alloc] initWithItem:v4 isCurrent:0 when:0];
  id v6 = [(SharingBTLEAdvertisementPayload *)self payloadBytes];
  unsigned int v7 = [v6 bytes];
  id v8 = [(SharingBTLEAdvertisementPayload *)v5 payloadBytes];
  id v9 = [v8 bytes];
  BOOL v11 = *v7 == *v9 && *(_DWORD *)((char *)v7 + 3) == *(_DWORD *)((char *)v9 + 3);

  return v11;
}

- (id)description
{
  uint64_t v3 = [(SharingBTLEAdvertisementPayload *)self payloadBytes];
  id v4 = sub_100003070(v3);
  CFStringRef v5 = &stru_1000C6800;
  if ([(SharingBTLEAdvertisementPayload *)self isCurrent]) {
    CFStringRef v6 = @"*";
  }
  else {
    CFStringRef v6 = &stru_1000C6800;
  }
  uint64_t v7 = [(SharingBTLEAdvertisementPayload *)self timeOffset];
  if ([(SharingBTLEAdvertisementPayload *)self optionBits]) {
    CFStringRef v8 = @" u";
  }
  else {
    CFStringRef v8 = &stru_1000C6800;
  }
  if (([(SharingBTLEAdvertisementPayload *)self optionBits] & 2) != 0) {
    CFStringRef v5 = @" fp";
  }
  if (([(SharingBTLEAdvertisementPayload *)self optionBits] & 4) != 0) {
    id v9 = " cloud";
  }
  else {
    id v9 = "";
  }
  unsigned __int8 v10 = "";
  if (([(SharingBTLEAdvertisementPayload *)self optionBits] & 8) != 0)
  {
    if (([(SharingBTLEAdvertisementPayload *)self optionBits] & 0x10) != 0) {
      unsigned __int8 v10 = " pb-1";
    }
    else {
      unsigned __int8 v10 = " pb-0";
    }
  }
  unsigned __int8 v11 = [(SharingBTLEAdvertisementPayload *)self optionBits];
  uint64_t v12 = " ap";
  if ((v11 & 0x20) == 0) {
    uint64_t v12 = "";
  }
  uint64_t v13 = +[NSString stringWithFormat:@"$%@/%@%d%@%@%s%s%s", v4, v6, v7, v8, v5, v9, v10, v12];

  return v13;
}

+ (id)dateEpochStart:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceReferenceDate];
    CFStringRef v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:trunc(v5 / 496.0) * 496.0];
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

- (NSDate)time
{
  unsigned int v2 = [(SharingBTLEAdvertisementPayload *)self timeOffset];
  id v3 = +[NSDate date];
  id v4 = +[SharingBTLEAdvertisementPayload dateEpochStart:v3];
  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5;
  [v4 timeIntervalSinceReferenceDate];
  double v8 = v6 - v7;
  uint64_t v9 = (uint64_t)v8;
  uint64_t v10 = (uint64_t)v8 + 3;
  if ((uint64_t)v8 >= 0) {
    uint64_t v10 = (uint64_t)v8;
  }
  if (v2 == 255)
  {
    uint64_t v20 = sub_10000BA18(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "TIME: -- since timeOffsetByteInTicks == 0xff, storing maximum age time.", (uint8_t *)&v28, 2u);
    }

    id v17 = +[NSDate dateWithTimeIntervalSinceNow:-500.0];
  }
  else
  {
    uint64_t v11 = v10 >> 2;
    uint64_t v12 = (void *)(v2 & 0x7F);
    uint64_t v13 = 4 * ((v10 >> 2) - (void)v12);
    uint64_t v14 = -496 - v13;
    if (v13 + 496 > 247) {
      uint64_t v14 = v13;
    }
    if (v11 >= (uint64_t)v12) {
      uint64_t v15 = 4 * ((uint64_t)v12 - v11);
    }
    else {
      uint64_t v15 = v14;
    }
    if (v15 < 248)
    {
      if (v15 < 1)
      {
        uint64_t v22 = v15 + v9;
        id v17 = +[NSDate dateWithTimeInterval:v4 sinceDate:(double)(v15 + v9)];
        objc_super v18 = sub_10000BA18(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = sub_10007C018(v17);
          int v28 = 134219266;
          uint64_t v29 = v11;
          __int16 v30 = 2048;
          id v31 = v12;
          __int16 v32 = 2048;
          uint64_t v33 = v15;
          __int16 v34 = 2048;
          uint64_t v35 = v22;
          __int16 v36 = 2114;
          id v37 = v17;
          __int16 v38 = 2114;
          v39 = v23;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "TIME: --- Guessing that their clock is the same or behind of our clock, and in the same epoch, ourOffset=%ld, theirs %ld, so setting result to delta (%ld) + %ld seconds from epoch, result=%{public}@/%{public}@", (uint8_t *)&v28, 0x3Eu);
        }
      }
      else
      {
        id v17 = v3;
        objc_super v18 = sub_10000BA18(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          id v21 = sub_10007C018(v17);
          int v28 = 134218754;
          uint64_t v29 = v11;
          __int16 v30 = 2048;
          id v31 = v12;
          __int16 v32 = 2114;
          uint64_t v33 = (uint64_t)v17;
          __int16 v34 = 2114;
          uint64_t v35 = (uint64_t)v21;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "TIME: --- Guessing that their clock is somewhat ahead of our clock, and in the same epoch, ourOffset=%ld, theirs %ld, so setting result == no, result=%{public}@=%{public}@", (uint8_t *)&v28, 0x2Au);
        }
      }
    }
    else
    {
      uint64_t v16 = v15 - 496;
      id v17 = +[NSDate dateWithTimeInterval:v4 sinceDate:(double)(v16 + v9)];
      objc_super v18 = sub_10000BA18(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = sub_10007C018(v17);
        int v28 = 134219266;
        uint64_t v29 = v11;
        __int16 v30 = 2048;
        id v31 = v12;
        __int16 v32 = 2048;
        uint64_t v33 = -496;
        __int16 v34 = 2048;
        uint64_t v35 = v16;
        __int16 v36 = 2114;
        id v37 = v17;
        __int16 v38 = 2114;
        v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "TIME: --- Guessing that their clock and our clock are in different epochs, ourOffset=%ld, theirs %ld, so falling back %ld seconds and setting delta to %ld. result=%{public}@/%{public}@", (uint8_t *)&v28, 0x3Eu);
      }
    }
  }
  uint64_t v24 = sub_10000BA18(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = sub_10007C018(v17);
    int v28 = 138543618;
    uint64_t v29 = (uint64_t)v17;
    __int16 v30 = 2114;
    id v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "TIME: result time = %{public}@ %{public}@", (uint8_t *)&v28, 0x16u);
  }
  v26 = (NSDate *)v17;

  return v26;
}

- (NSDate)currentUntil
{
  if ([(SharingBTLEAdvertisementPayload *)self isCurrent])
  {
    id v3 = [(SharingBTLEAdvertisementPayload *)self when];
    if (v3) {
      [(SharingBTLEAdvertisementPayload *)self when];
    }
    else {
    double v5 = +[NSDate date];
    }
    id v4 = +[NSDate dateWithTimeInterval:v5 sinceDate:248.0];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)validUntil
{
  if ([(SharingBTLEAdvertisementPayload *)self isCurrent])
  {
    id v3 = [(SharingBTLEAdvertisementPayload *)self currentUntil];
  }
  else
  {
    id v4 = [(SharingBTLEAdvertisementPayload *)self time];
    id v3 = +[NSDate dateWithTimeInterval:v4 sinceDate:256.0];
  }

  return (NSDate *)v3;
}

- (id)now
{
  unsigned int v2 = +[NSDate date];
  id v3 = +[SharingBTLEAdvertisementPayload dateEpochStart:v2];
  [v2 timeIntervalSinceDate:v3];
  double v5 = +[NSDate dateWithTimeInterval:v3 sinceDate:trunc(v4 * 0.25) * 4.0];

  return v5;
}

- (NSDate)epochEnd
{
  id v2 = [(SharingBTLEAdvertisementPayload *)self when];
  id v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceReferenceDate];
    double v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:trunc(v4 / 496.0) * 496.0 + 496.0];
  }
  else
  {
    double v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSUUID)activityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWhen:(id)a3
{
}

- (NSDate)epochStart
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEpochStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_epochStart, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_epochEnd, 0);

  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end