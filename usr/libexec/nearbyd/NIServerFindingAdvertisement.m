@interface NIServerFindingAdvertisement
+ (array<unsigned)convertCBAddressToRoseAddress:(id)a3;
+ (id)advertisementForFinder:(BOOL)a3 address:(const void *)a4 statusFlags:(unsigned __int8)a5 payload:(id)a6 uniqueIdentifier:(id)a7;
+ (id)advertisementFromByteRepresentation:(id)a3;
- (BOOL)canRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinder;
- (NSData)byteRepresentation;
- (NSData)payload;
- (NSData)uniqueIdentifier;
- (NSNumber)nbUwbAcquisitionChannelIdx;
- (array<unsigned)address;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForFinder:(BOOL)a3 address:(const void *)a4;
- (int)selectedTechnology;
- (int)useCase;
- (unsigned)narrowBandMask;
- (unsigned)protocolVersion;
- (unsigned)statusFlags;
- (vector<rose::finding::Technology,)supportedTechnologies;
- (void)setAddress:(array<unsigned)char;
- (void)setCanRange:(BOOL)a3;
- (void)setNarrowBandMask:(unsigned __int8)a3;
- (void)setNbUwbAcquisitionChannelIdx:(id)a3;
- (void)setProtocolVersion:(unsigned __int8)a3;
- (void)setSupportedTechnologies:()vector<rose:(std::allocator<rose::finding::Technology>> *)a3 :finding::Technology;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUseCase:(int)a3;
@end

@implementation NIServerFindingAdvertisement

- (id)initForFinder:(BOOL)a3 address:(const void *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NIServerFindingAdvertisement;
  v6 = [(NIServerFindingAdvertisement *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_isFinder = a3;
    int v8 = *(_DWORD *)a4;
    *(_WORD *)&v6->_address.__elems_[4] = *((_WORD *)a4 + 2);
    v6->_canRange = 1;
    v6->_useCase = 0;
    *(_DWORD *)v6->_address.__elems_ = v8;
    v6->_supportedTechnologies.__end_ = v6->_supportedTechnologies.__begin_;
    nbUwbAcquisitionChannelIdx = v6->_nbUwbAcquisitionChannelIdx;
    v6->_nbUwbAcquisitionChannelIdx = 0;

    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = 0;

    *(_WORD *)&v7->_protocolVersion = 0;
  }
  return v7;
}

+ (id)advertisementForFinder:(BOOL)a3 address:(const void *)a4 statusFlags:(unsigned __int8)a5 payload:(id)a6 uniqueIdentifier:(id)a7
{
  unsigned int v8 = a5;
  BOOL v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = [[NIServerFindingAdvertisement alloc] initForFinder:v10 address:a4];
  [v13 setUniqueIdentifier:v12];
  [v13 setProtocolVersion:0];
  if ((v8 & 1) != 0 && [v11 length])
  {
    id v14 = v11;
    v15 = v14;
    if (v10)
    {
      unsigned int v16 = *(unsigned __int8 *)[v14 bytes];
      [v13 setProtocolVersion:v16 & 7];
      [v13 setNarrowBandMask:(v16 >> 3) & 3];
    }
    else
    {
      v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned __int8 *)[v14 bytes]);
      [v13 setNbUwbAcquisitionChannelIdx:v17];

      if ((unint64_t)[v15 length] >= 2)
      {
        unsigned int v18 = *((unsigned __int8 *)[v15 bytes] + 1);
        [v13 setProtocolVersion:v18 & 7];
        [v13 setNarrowBandMask:(v18 >> 3) & 3];
      }
    }
  }
  v19 = 0;
  v20 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  if ((v8 & 4) != 0)
  {
    v19 = operator new(4uLL);
    _DWORD *v19 = 1;
    v20 = v19 + 1;
    v35 = v19 + 1;
    v36 = (char *)(v19 + 1);
    v34 = v19;
  }
  unsigned int v21 = !+[NIPlatformInfo isInternalBuild];
  if ((v8 & 8) == 0) {
    LOBYTE(v21) = 1;
  }
  if ((v21 & 1) == 0)
  {
    uint64_t v22 = v20 - (unsigned char *)v19;
    uint64_t v23 = (v20 - (unsigned char *)v19) >> 2;
    unint64_t v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 62) {
      sub_1000267C4();
    }
    if (v22 >> 1 > v24) {
      unint64_t v24 = v22 >> 1;
    }
    if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v24;
    }
    if (v25)
    {
      v26 = (char *)sub_10003B54C((uint64_t)&v36, v25);
      v19 = v34;
      v20 = v35;
    }
    else
    {
      v26 = 0;
    }
    v27 = &v26[4 * v23];
    *(_DWORD *)v27 = 2;
    v28 = v27 + 4;
    while (v20 != (unsigned char *)v19)
    {
      int v29 = *((_DWORD *)v20 - 1);
      v20 -= 4;
      *((_DWORD *)v27 - 1) = v29;
      v27 -= 4;
    }
    v34 = v27;
    v35 = v28;
    v36 = &v26[4 * v25];
    if (v19) {
      operator delete(v19);
    }
    v35 = v28;
  }
  [v13 setUseCase:(v8 >> 4) & 1];
  __p = 0;
  v32 = 0;
  uint64_t v33 = 0;
  sub_100312EE4(&__p, v34, (uint64_t)v35, (v35 - (unsigned char *)v34) >> 2);
  [v13 setSupportedTechnologies:&__p];
  if (__p)
  {
    v32 = __p;
    operator delete(__p);
  }
  [v13 setCanRange:(v8 >> 1) & 1];
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }

  return v13;
}

+ (id)advertisementFromByteRepresentation:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x65)
  {
    int v16 = 0;
    v5 = (void *)OPACKDecodeData();
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10042F8E4(&v16, v12);
      }
      v4 = 0;
      goto LABEL_26;
    }
    v6 = [v5 objectForKey:&off_100878A18];
    v7 = [v5 objectForKey:&off_100878A30];
    unsigned int v8 = [v5 objectForKey:&off_100878A48];
    v9 = [v5 objectForKey:&off_100878A60];
    BOOL v10 = [v5 objectForKey:&off_100878A78];
    if (!v6) {
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v7 != 0)) == 0) {
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    v4 = 0;
    if ([v7 length] != (id)6 || !v8) {
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    if (!v9
      || (+[NSNull null],
          id v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v9 == v11))
    {

      v9 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_24;
      }
    }
    if (!v10
      || (+[NSNull null],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v10 == v13))
    {

      BOOL v10 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_24:
        v4 = 0;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }
    [v7 getBytes:v15 length:6];
    v4 = +[NIServerFindingAdvertisement advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:](NIServerFindingAdvertisement, "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:", [v6 BOOLValue], v15, [v8 unsignedCharValue], v9, v10);
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_10042F8B0();
  }
  v4 = 0;
LABEL_27:

  return v4;
}

- (NSData)byteRepresentation
{
  id v3 = +[NSData dataWithBytes:&self->_address length:6];
  v12[0] = &off_100878A18;
  v4 = +[NSNumber numberWithBool:self->_isFinder];
  v13[0] = v4;
  v13[1] = v3;
  v12[1] = &off_100878A30;
  v12[2] = &off_100878A48;
  v5 = +[NSNumber numberWithUnsignedChar:[(NIServerFindingAdvertisement *)self statusFlags]];
  v13[2] = v5;
  v12[3] = &off_100878A60;
  v6 = [(NIServerFindingAdvertisement *)self payload];
  if (v6) {
    [(NIServerFindingAdvertisement *)self payload];
  }
  else {
  v7 = +[NSNull null];
  }
  v13[3] = v7;
  v12[4] = &off_100878A78;
  unsigned int v8 = NSRandomData();
  v13[4] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];

  Data = (void *)OPACKEncoderCreateData();

  return (NSData *)Data;
}

+ (array<unsigned)convertCBAddressToRoseAddress:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    BOOL v10 = "cbAddress";
    int v11 = 2290;
    goto LABEL_9;
  }
  if ((unint64_t)[v3 length] <= 5)
  {
    BOOL v10 = "cbAddress.length >= rose::kBtAdvAddressByteLength";
    int v11 = 2291;
LABEL_9:
    __assert_rtn("+[NIServerFindingAdvertisement convertCBAddressToRoseAddress:]", "NIServerFindingDiscovery.mm", v11, v10);
  }
  [v4 getBytes:&v12 length:6];
  v5 = (char *)&v13 + 1;
  v6 = (char *)&v12 + 1;
  do
  {
    char v7 = *(v6 - 1);
    *(v6 - 1) = *v5;
    *v5-- = v7;
  }
  while (v6++ < v5);

  return (array<unsigned char, 6UL>)(v12 | ((unint64_t)v13 << 32));
}

- (unsigned)statusFlags
{
  if (self->_nbUwbAcquisitionChannelIdx || self->_protocolVersion || (int narrowBandMask = self->_narrowBandMask) != 0) {
    int narrowBandMask = 1;
  }
  if (self->_canRange) {
    narrowBandMask |= 2u;
  }
  if (self->_useCase == 1) {
    int v3 = narrowBandMask | 0x10;
  }
  else {
    int v3 = narrowBandMask;
  }
  begin = self->_supportedTechnologies.__begin_;
  for (i = self->_supportedTechnologies.__end_; begin != i; ++begin)
  {
    if (*begin == 2)
    {
      if (+[NIPlatformInfo isInternalBuild]) {
        v3 |= 8u;
      }
    }
    else if (*begin == 1)
    {
      v3 |= 4u;
    }
  }
  return v3;
}

- (NSData)payload
{
  unint64_t __p = 0;
  v20 = 0;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  if (nbUwbAcquisitionChannelIdx)
  {
    unsigned __int8 v4 = [(NSNumber *)nbUwbAcquisitionChannelIdx intValue];
    v5 = operator new(1uLL);
    unsigned char *v5 = v4;
    v6 = v5 + 1;
    unint64_t __p = (unint64_t)v5;
    v20 = v5 + 1;
  }
  else
  {
    v6 = 0;
  }
  unsigned int protocolVersion = self->_protocolVersion;
  if (self->_protocolVersion)
  {
    if (protocolVersion >= 8) {
      __assert_rtn("-[NIServerFindingAdvertisement payload]", "NIServerFindingDiscovery.mm", 2355, "(_protocolVersion & kProtocolVersionMask) == _protocolVersion");
    }
    unsigned int narrowBandMask = self->_narrowBandMask;
    if (!self->_narrowBandMask) {
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int narrowBandMask = self->_narrowBandMask;
    if (!self->_narrowBandMask) {
      goto LABEL_30;
    }
  }
  if (narrowBandMask >= 4) {
    __assert_rtn("-[NIServerFindingAdvertisement payload]", "NIServerFindingDiscovery.mm", 2361, "(_narrowBandMask & narrowBandMaskValueMask) == _narrowBandMask");
  }
  LOBYTE(protocolVersion) = protocolVersion | (8 * narrowBandMask);
LABEL_11:
  if (v6 >= v20)
  {
    BOOL v10 = &v6[-__p];
    uint64_t v11 = (uint64_t)&v6[-__p + 1];
    if (v11 < 0) {
      sub_1000267C4();
    }
    unint64_t v12 = (unint64_t)&v20[-__p];
    if (2 * (uint64_t)&v20[-__p] > (unint64_t)v11) {
      uint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v13 = v11;
    }
    if (v13) {
      unint64_t v14 = (unint64_t)operator new(v13);
    }
    else {
      unint64_t v14 = 0;
    }
    v10[v14] = protocolVersion;
    uint64_t v9 = (uint64_t)&v10[v14 + 1];
    if (v6 == (unsigned char *)__p)
    {
      v14 += (unint64_t)v10;
    }
    else
    {
      v15 = &v6[~__p];
      do
      {
        char v16 = *--v6;
        (v15--)[v14] = v16;
      }
      while (v6 != (unsigned char *)__p);
      v6 = (unsigned char *)__p;
    }
    unint64_t __p = v14;
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    unsigned char *v6 = protocolVersion;
    uint64_t v9 = (uint64_t)(v6 + 1);
  }
  v6 = (unsigned char *)v9;
LABEL_30:
  if (v6 != (unsigned char *)__p)
  {
    v17 = +[NSData dataWithBytes:__p length:&v6[-__p]];
    v6 = (unsigned char *)__p;
    if (!__p) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v17 = 0;
  if (v6) {
LABEL_32:
  }
    operator delete(v6);
LABEL_33:

  return (NSData *)v17;
}

- (int)selectedTechnology
{
  begin = self->_supportedTechnologies.__begin_;
  if ((int *)((char *)self->_supportedTechnologies.__end_ - (char *)begin) == (int *)4) {
    return *begin;
  }
  else {
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[NIServerFindingAdvertisement alloc] initForFinder:self->_isFinder address:&self->_address];
  v5 = v4;
  if (!v4) {
    __assert_rtn("-[NIServerFindingAdvertisement copyWithZone:]", "NIServerFindingDiscovery.mm", 2386, "advertisement");
  }
  [v4 setCanRange:self->_canRange];
  [v5 setUseCase:self->_useCase];
  unint64_t __p = 0;
  unsigned int v8 = 0;
  uint64_t v9 = 0;
  sub_100312EE4(&__p, self->_supportedTechnologies.__begin_, (uint64_t)self->_supportedTechnologies.__end_, self->_supportedTechnologies.__end_ - self->_supportedTechnologies.__begin_);
  [v5 setSupportedTechnologies:&__p];
  if (__p)
  {
    unsigned int v8 = __p;
    operator delete(__p);
  }
  [v5 setNbUwbAcquisitionChannelIdx:self->_nbUwbAcquisitionChannelIdx];
  [v5 setProtocolVersion:self->_protocolVersion];
  [v5 setNarrowBandMask:self->_narrowBandMask];
  [v5 setUniqueIdentifier:self->_uniqueIdentifier];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NIServerFindingAdvertisement *)v4;
    v6 = v5;
    if (v5 == self)
    {
      BOOL v8 = 1;
LABEL_56:

      goto LABEL_57;
    }
    id v46 = v4;
    if (!self->_isFinder) {
      goto LABEL_10;
    }
    if ([(NIServerFindingAdvertisement *)v5 isFinder])
    {
      unsigned int v7 = 0;
      goto LABEL_11;
    }
    if (self->_isFinder) {
      unsigned int v7 = 1;
    }
    else {
LABEL_10:
    }
      unsigned int v7 = [(NIServerFindingAdvertisement *)v6 isFinder];
LABEL_11:
    id v9 = (id)[(NIServerFindingAdvertisement *)v6 address];
    int v10 = (int)v9;
    WORD2(v47) = WORD2(v9);
    int v11 = *(_DWORD *)self->_address.__elems_;
    int v44 = WORD2(v9);
    int v45 = *(unsigned __int16 *)&self->_address.__elems_[4];
    int canRange = self->_canRange;
    unsigned int v43 = [(NIServerFindingAdvertisement *)v6 canRange];
    int useCase = self->_useCase;
    unsigned int v41 = [(NIServerFindingAdvertisement *)v6 useCase];
    if (v6)
    {
      [(NIServerFindingAdvertisement *)v6 supportedTechnologies];
      size_t v13 = v47;
      uint64_t v14 = v48;
    }
    else
    {
      size_t v13 = 0;
      uint64_t v14 = 0;
    }
    begin = self->_supportedTechnologies.__begin_;
    end = self->_supportedTechnologies.__end_;
    if ((char *)end - (char *)begin == v14 - (void)v13)
    {
      if (begin == end)
      {
        BOOL v21 = 0;
        if (!v13)
        {
LABEL_26:
          if (self->_nbUwbAcquisitionChannelIdx)
          {
            BOOL v40 = 0;
          }
          else
          {
            uint64_t v23 = [(NIServerFindingAdvertisement *)v6 nbUwbAcquisitionChannelIdx];
            BOOL v40 = v23 == 0;

            if (!self->_nbUwbAcquisitionChannelIdx)
            {
              unsigned int v27 = 0;
LABEL_33:
              uniqueIdentifier = self->_uniqueIdentifier;
              if (uniqueIdentifier)
              {
                BOOL v39 = 0;
              }
              else
              {
                int v29 = [(NIServerFindingAdvertisement *)v6 uniqueIdentifier];
                BOOL v39 = v29 == 0;

                uniqueIdentifier = self->_uniqueIdentifier;
              }
              v30 = [(NIServerFindingAdvertisement *)v6 uniqueIdentifier];
              unsigned int v31 = [(NSData *)uniqueIdentifier isEqualToData:v30];

              int protocolVersion = self->_protocolVersion;
              unsigned int v37 = [(NIServerFindingAdvertisement *)v6 protocolVersion];
              int narrowBandMask = self->_narrowBandMask;
              unsigned int v33 = [(NIServerFindingAdvertisement *)v6 narrowBandMask];
              BOOL v8 = 0;
              if (v11 ^ v10 | v45 ^ v44) {
                int v34 = 1;
              }
              else {
                int v34 = v7;
              }
              if (canRange != v43) {
                int v34 = 1;
              }
              if (useCase != v41) {
                int v34 = 1;
              }
              if ((v34 | v21))
              {
                id v4 = v46;
              }
              else
              {
                id v4 = v46;
                if ((((v40 | v27) ^ 1) & 1) == 0 && (((v39 | v31) ^ 1) & 1) == 0) {
                  BOOL v8 = protocolVersion == v37 && narrowBandMask == v33;
                }
              }
              goto LABEL_56;
            }
          }
          unint64_t v24 = [(NIServerFindingAdvertisement *)v6 nbUwbAcquisitionChannelIdx];
          if (v24)
          {
            nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
            v26 = [(NIServerFindingAdvertisement *)v6 nbUwbAcquisitionChannelIdx];
            unsigned int v27 = [(NSNumber *)nbUwbAcquisitionChannelIdx isEqualToNumber:v26];
          }
          else
          {
            unsigned int v27 = 0;
          }

          goto LABEL_33;
        }
LABEL_25:
        operator delete(v13);
        goto LABEL_26;
      }
      v17 = begin + 1;
      unsigned int v18 = (int *)v13;
      do
      {
        int v19 = *v18++;
        int v20 = *(v17 - 1);
        BOOL v21 = v20 != v19;
      }
      while (v20 == v19 && v17++ != end);
    }
    else
    {
      BOOL v21 = 1;
    }
    if (!v13) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  BOOL v8 = 0;
LABEL_57:

  return v8;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithString:@"0x"];
  for (uint64_t i = 0; i != 6; ++i)
    [v3 appendFormat:@"%02x", self->_address.__elems_[i]];
  id v5 = [objc_alloc((Class)NSMutableString) initWithString:@"["];
  begin = self->_supportedTechnologies.__begin_;
  if (self->_supportedTechnologies.__end_ != begin)
  {
    unint64_t v7 = 0;
    do
    {
      [v5 appendFormat:@"%s", sub_1002E1ABC(begin[v7])];
      begin = self->_supportedTechnologies.__begin_;
      unint64_t v8 = self->_supportedTechnologies.__end_ - begin;
      if (v8 - 1 > v7)
      {
        [v5 appendString:@", "];
        begin = self->_supportedTechnologies.__begin_;
        unint64_t v8 = self->_supportedTechnologies.__end_ - begin;
      }
      ++v7;
    }
    while (v8 > v7);
  }
  [v5 appendString:@"]"];
  id v9 = sub_1002E0FBC(self->_isFinder);
  BOOL canRange = self->_canRange;
  int v11 = sub_1002E0FA0(self->_useCase);
  uint64_t protocolVersion = self->_protocolVersion;
  uint64_t narrowBandMask = self->_narrowBandMask;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    [(NSData *)uniqueIdentifier length];
    CUPrintNSDataHex();
    char v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v16 = @"-";
  }
  v17 = +[NSString stringWithFormat:@"<%s, addr: %@, canRange:%d, useCase: %s, supportedTech:%@, nbUwbChIdx:%@, protocolVer: %d, nbMask:%hu, ID:0x%@>", v9, v3, canRange, v11, v5, nbUwbAcquisitionChannelIdx, protocolVersion, narrowBandMask, v16];
  if (uniqueIdentifier) {

  }
  return v17;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (array<unsigned)address
{
  objc_copyStruct(&dest, &self->_address, 6, 1, 0);
  return (array<unsigned char, 6UL>)(dest | ((unint64_t)v4 << 32));
}

- (void)setAddress:(array<unsigned)char
{
  array<unsigned char, 6UL> src = a3;
  objc_copyStruct(&self->_address, &src, 6, 1, 0);
}

- (BOOL)canRange
{
  return self->_canRange;
}

- (void)setCanRange:(BOOL)a3
{
  self->_BOOL canRange = a3;
}

- (int)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(int)a3
{
  self->_int useCase = a3;
}

- (NSNumber)nbUwbAcquisitionChannelIdx
{
  return self->_nbUwbAcquisitionChannelIdx;
}

- (void)setNbUwbAcquisitionChannelIdx:(id)a3
{
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unsigned __int8)a3
{
  self->_uint64_t protocolVersion = a3;
}

- (unsigned)narrowBandMask
{
  return self->_narrowBandMask;
}

- (void)setNarrowBandMask:(unsigned __int8)a3
{
  self->_uint64_t narrowBandMask = a3;
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (vector<rose::finding::Technology,)supportedTechnologies
{
  objc_copyCppObjectAtomic(retstr, &self->_supportedTechnologies, (void (__cdecl *)(void *, const void *))sub_100312BE4);
  return result;
}

- (void)setSupportedTechnologies:()vector<rose:(std::allocator<rose::finding::Technology>> *)a3 :finding::Technology
{
}

- (void).cxx_destruct
{
  begin = self->_supportedTechnologies.__begin_;
  if (begin)
  {
    self->_supportedTechnologies.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_nbUwbAcquisitionChannelIdx, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end