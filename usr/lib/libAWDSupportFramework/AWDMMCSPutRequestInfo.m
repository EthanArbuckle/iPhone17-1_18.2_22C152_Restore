@interface AWDMMCSPutRequestInfo
+ (Class)authHttpInfosType;
+ (Class)cancelErrorType;
+ (Class)chunkingInfosType;
+ (Class)completeHttpInfosType;
+ (Class)containerHttpInfosType;
+ (Class)errorType;
- (BOOL)allItemsFailed;
- (BOOL)allItemsSuccessful;
- (BOOL)hasAllItemsFailed;
- (BOOL)hasAllItemsSuccessful;
- (BOOL)hasCancelledErrorCode;
- (BOOL)hasCancelledErrorDomain;
- (BOOL)hasChunksUploaded;
- (BOOL)hasCkContainerId;
- (BOOL)hasClientId;
- (BOOL)hasDuration;
- (BOOL)hasItemCount;
- (BOOL)hasItemCountFailed;
- (BOOL)hasItemCountSuccessful;
- (BOOL)hasItemsAlreadyPresentCount;
- (BOOL)hasItemsNotPresentCount;
- (BOOL)hasItemsPartiallyPresentCount;
- (BOOL)hasRequestErrorCode;
- (BOOL)hasRequestErrorDomain;
- (BOOL)hasStartTime;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)authHttpInfos;
- (NSMutableArray)cancelErrors;
- (NSMutableArray)chunkingInfos;
- (NSMutableArray)completeHttpInfos;
- (NSMutableArray)containerHttpInfos;
- (NSMutableArray)errors;
- (NSString)cancelledErrorDomain;
- (NSString)ckContainerId;
- (NSString)clientId;
- (NSString)requestErrorDomain;
- (id)authHttpInfosAtIndex:(unint64_t)a3;
- (id)cancelErrorAtIndex:(unint64_t)a3;
- (id)chunkingInfosAtIndex:(unint64_t)a3;
- (id)completeHttpInfosAtIndex:(unint64_t)a3;
- (id)containerHttpInfosAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorAtIndex:(unint64_t)a3;
- (int)cancelledErrorCode;
- (int)chunksUploaded;
- (int)itemCount;
- (int)itemsAlreadyPresentCount;
- (int)itemsNotPresentCount;
- (int)itemsPartiallyPresentCount;
- (int)requestErrorCode;
- (int64_t)duration;
- (int64_t)startTime;
- (int64_t)timestamp;
- (unint64_t)authHttpInfosCount;
- (unint64_t)cancelErrorsCount;
- (unint64_t)chunkingInfosCount;
- (unint64_t)completeHttpInfosCount;
- (unint64_t)containerHttpInfosCount;
- (unint64_t)errorsCount;
- (unint64_t)hash;
- (unsigned)itemCountFailed;
- (unsigned)itemCountSuccessful;
- (void)addAuthHttpInfos:(id)a3;
- (void)addCancelError:(id)a3;
- (void)addChunkingInfos:(id)a3;
- (void)addCompleteHttpInfos:(id)a3;
- (void)addContainerHttpInfos:(id)a3;
- (void)addError:(id)a3;
- (void)clearAuthHttpInfos;
- (void)clearCancelErrors;
- (void)clearChunkingInfos;
- (void)clearCompleteHttpInfos;
- (void)clearContainerHttpInfos;
- (void)clearErrors;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllItemsFailed:(BOOL)a3;
- (void)setAllItemsSuccessful:(BOOL)a3;
- (void)setAuthHttpInfos:(id)a3;
- (void)setCancelErrors:(id)a3;
- (void)setCancelledErrorCode:(int)a3;
- (void)setCancelledErrorDomain:(id)a3;
- (void)setChunkingInfos:(id)a3;
- (void)setChunksUploaded:(int)a3;
- (void)setCkContainerId:(id)a3;
- (void)setClientId:(id)a3;
- (void)setCompleteHttpInfos:(id)a3;
- (void)setContainerHttpInfos:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setErrors:(id)a3;
- (void)setHasAllItemsFailed:(BOOL)a3;
- (void)setHasAllItemsSuccessful:(BOOL)a3;
- (void)setHasCancelledErrorCode:(BOOL)a3;
- (void)setHasChunksUploaded:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasItemCount:(BOOL)a3;
- (void)setHasItemCountFailed:(BOOL)a3;
- (void)setHasItemCountSuccessful:(BOOL)a3;
- (void)setHasItemsAlreadyPresentCount:(BOOL)a3;
- (void)setHasItemsNotPresentCount:(BOOL)a3;
- (void)setHasItemsPartiallyPresentCount:(BOOL)a3;
- (void)setHasRequestErrorCode:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setItemCount:(int)a3;
- (void)setItemCountFailed:(unsigned int)a3;
- (void)setItemCountSuccessful:(unsigned int)a3;
- (void)setItemsAlreadyPresentCount:(int)a3;
- (void)setItemsNotPresentCount:(int)a3;
- (void)setItemsPartiallyPresentCount:(int)a3;
- (void)setRequestErrorCode:(int)a3;
- (void)setRequestErrorDomain:(id)a3;
- (void)setStartTime:(int64_t)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMMCSPutRequestInfo

- (void)dealloc
{
  [(AWDMMCSPutRequestInfo *)self setClientId:0];
  [(AWDMMCSPutRequestInfo *)self setCancelledErrorDomain:0];
  [(AWDMMCSPutRequestInfo *)self setRequestErrorDomain:0];
  [(AWDMMCSPutRequestInfo *)self setChunkingInfos:0];
  [(AWDMMCSPutRequestInfo *)self setAuthHttpInfos:0];
  [(AWDMMCSPutRequestInfo *)self setContainerHttpInfos:0];
  [(AWDMMCSPutRequestInfo *)self setCompleteHttpInfos:0];
  [(AWDMMCSPutRequestInfo *)self setCancelErrors:0];
  [(AWDMMCSPutRequestInfo *)self setErrors:0];
  [(AWDMMCSPutRequestInfo *)self setCkContainerId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSPutRequestInfo;
  [(AWDMMCSPutRequestInfo *)&v3 dealloc];
}

- (void)setTimestamp:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (void)setStartTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasCancelledErrorDomain
{
  return self->_cancelledErrorDomain != 0;
}

- (void)setCancelledErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cancelledErrorCode = a3;
}

- (void)setHasCancelledErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCancelledErrorCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasRequestErrorDomain
{
  return self->_requestErrorDomain != 0;
}

- (void)setRequestErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_requestErrorCode = a3;
}

- (void)setHasRequestErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRequestErrorCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setItemCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_itemCount = a3;
}

- (void)setHasItemCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasItemCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setItemsAlreadyPresentCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_itemsAlreadyPresentCount = a3;
}

- (void)setHasItemsAlreadyPresentCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasItemsAlreadyPresentCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setItemsPartiallyPresentCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_itemsPartiallyPresentCount = a3;
}

- (void)setHasItemsPartiallyPresentCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasItemsPartiallyPresentCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setItemsNotPresentCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_itemsNotPresentCount = a3;
}

- (void)setHasItemsNotPresentCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasItemsNotPresentCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setChunksUploaded:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_chunksUploaded = a3;
}

- (void)setHasChunksUploaded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasChunksUploaded
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)clearChunkingInfos
{
}

- (void)addChunkingInfos:(id)a3
{
  chunkingInfos = self->_chunkingInfos;
  if (!chunkingInfos)
  {
    chunkingInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_chunkingInfos = chunkingInfos;
  }

  [(NSMutableArray *)chunkingInfos addObject:a3];
}

- (unint64_t)chunkingInfosCount
{
  return [(NSMutableArray *)self->_chunkingInfos count];
}

- (id)chunkingInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_chunkingInfos objectAtIndex:a3];
}

+ (Class)chunkingInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearAuthHttpInfos
{
}

- (void)addAuthHttpInfos:(id)a3
{
  authHttpInfos = self->_authHttpInfos;
  if (!authHttpInfos)
  {
    authHttpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_authHttpInfos = authHttpInfos;
  }

  [(NSMutableArray *)authHttpInfos addObject:a3];
}

- (unint64_t)authHttpInfosCount
{
  return [(NSMutableArray *)self->_authHttpInfos count];
}

- (id)authHttpInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_authHttpInfos objectAtIndex:a3];
}

+ (Class)authHttpInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearContainerHttpInfos
{
}

- (void)addContainerHttpInfos:(id)a3
{
  containerHttpInfos = self->_containerHttpInfos;
  if (!containerHttpInfos)
  {
    containerHttpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_containerHttpInfos = containerHttpInfos;
  }

  [(NSMutableArray *)containerHttpInfos addObject:a3];
}

- (unint64_t)containerHttpInfosCount
{
  return [(NSMutableArray *)self->_containerHttpInfos count];
}

- (id)containerHttpInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_containerHttpInfos objectAtIndex:a3];
}

+ (Class)containerHttpInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearCompleteHttpInfos
{
}

- (void)addCompleteHttpInfos:(id)a3
{
  completeHttpInfos = self->_completeHttpInfos;
  if (!completeHttpInfos)
  {
    completeHttpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_completeHttpInfos = completeHttpInfos;
  }

  [(NSMutableArray *)completeHttpInfos addObject:a3];
}

- (unint64_t)completeHttpInfosCount
{
  return [(NSMutableArray *)self->_completeHttpInfos count];
}

- (id)completeHttpInfosAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_completeHttpInfos objectAtIndex:a3];
}

+ (Class)completeHttpInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearCancelErrors
{
}

- (void)addCancelError:(id)a3
{
  cancelErrors = self->_cancelErrors;
  if (!cancelErrors)
  {
    cancelErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_cancelErrors = cancelErrors;
  }

  [(NSMutableArray *)cancelErrors addObject:a3];
}

- (unint64_t)cancelErrorsCount
{
  return [(NSMutableArray *)self->_cancelErrors count];
}

- (id)cancelErrorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cancelErrors objectAtIndex:a3];
}

+ (Class)cancelErrorType
{
  return (Class)objc_opt_class();
}

- (void)clearErrors
{
}

- (void)addError:(id)a3
{
  errors = self->_errors;
  if (!errors)
  {
    errors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_errors = errors;
  }

  [(NSMutableArray *)errors addObject:a3];
}

- (unint64_t)errorsCount
{
  return [(NSMutableArray *)self->_errors count];
}

- (id)errorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_errors objectAtIndex:a3];
}

+ (Class)errorType
{
  return (Class)objc_opt_class();
}

- (void)setAllItemsSuccessful:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_allItemsSuccessful = a3;
}

- (void)setHasAllItemsSuccessful:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasAllItemsSuccessful
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setItemCountSuccessful:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_itemCountSuccessful = a3;
}

- (void)setHasItemCountSuccessful:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasItemCountSuccessful
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAllItemsFailed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_allItemsFailed = a3;
}

- (void)setHasAllItemsFailed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAllItemsFailed
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setItemCountFailed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_itemCountFailed = a3;
}

- (void)setHasItemCountFailed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasItemCountFailed
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasCkContainerId
{
  return self->_ckContainerId != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSPutRequestInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMMCSPutRequestInfo description](&v3, sel_description), -[AWDMMCSPutRequestInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"clientId"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithLongLong:self->_startTime] forKey:@"startTime"];
    __int16 has = (__int16)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithLongLong:self->_duration] forKey:@"duration"];
  }
  cancelledErrorDomaiuint64_t n = self->_cancelledErrorDomain;
  if (cancelledErrorDomain) {
    [v3 setObject:cancelledErrorDomain forKey:@"cancelledErrorDomain"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_cancelledErrorCode] forKey:@"cancelledErrorCode"];
  }
  requestErrorDomaiuint64_t n = self->_requestErrorDomain;
  if (requestErrorDomain) {
    [v3 setObject:requestErrorDomain forKey:@"requestErrorDomain"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x800) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_requestErrorCode] forKey:@"requestErrorCode"];
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x20) == 0)
    {
LABEL_17:
      if ((v8 & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_itemCount] forKey:@"itemCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_18:
    if ((v8 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_87;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithInt:self->_itemsAlreadyPresentCount] forKey:@"itemsAlreadyPresentCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x400) == 0)
  {
LABEL_19:
    if ((v8 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_88;
  }
LABEL_87:
  [v3 setObject:[NSNumber numberWithInt:self->_itemsPartiallyPresentCount] forKey:@"itemsPartiallyPresentCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_20:
    if ((v8 & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_88:
  [v3 setObject:[NSNumber numberWithInt:self->_itemsNotPresentCount] forKey:@"itemsNotPresentCount"];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_21:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_chunksUploaded] forKey:@"chunksUploaded"];
LABEL_22:
  if ([(NSMutableArray *)self->_chunkingInfos count])
  {
    v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_chunkingInfos, "count")];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    chunkingInfos = self->_chunkingInfos;
    uint64_t v11 = [(NSMutableArray *)chunkingInfos countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v69 != v13) {
            objc_enumerationMutation(chunkingInfos);
          }
          [v9 addObject:[*(id *)(*((void *)&v68 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v12 = [(NSMutableArray *)chunkingInfos countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v12);
    }
    [v3 setObject:v9 forKey:@"chunkingInfos"];
  }
  if ([(NSMutableArray *)self->_authHttpInfos count])
  {
    v15 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_authHttpInfos, "count")];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    authHttpInfos = self->_authHttpInfos;
    uint64_t v17 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(authHttpInfos);
          }
          [v15 addObject:[*(id *)(*((void *)&v64 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v18 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v18);
    }
    [v3 setObject:v15 forKey:@"authHttpInfos"];
  }
  if ([(NSMutableArray *)self->_containerHttpInfos count])
  {
    v21 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_containerHttpInfos, "count")];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    containerHttpInfos = self->_containerHttpInfos;
    uint64_t v23 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v60 objects:v75 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v61 != v25) {
            objc_enumerationMutation(containerHttpInfos);
          }
          [v21 addObject:[*(id *)(*((void *)&v60 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v24 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v60 objects:v75 count:16];
      }
      while (v24);
    }
    [v3 setObject:v21 forKey:@"containerHttpInfos"];
  }
  if ([(NSMutableArray *)self->_completeHttpInfos count])
  {
    v27 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_completeHttpInfos, "count")];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    completeHttpInfos = self->_completeHttpInfos;
    uint64_t v29 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v57;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(completeHttpInfos);
          }
          [v27 addObject:[*(id *)(*((void *)&v56 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v30 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v56 objects:v74 count:16];
      }
      while (v30);
    }
    [v3 setObject:v27 forKey:@"completeHttpInfos"];
  }
  if ([(NSMutableArray *)self->_cancelErrors count])
  {
    v33 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_cancelErrors, "count")];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    cancelErrors = self->_cancelErrors;
    uint64_t v35 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v52 objects:v73 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v53;
      do
      {
        for (uint64_t n = 0; n != v36; ++n)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(cancelErrors);
          }
          [v33 addObject:[*(id *)(*((void *)&v52 + 1) + 8 * n) dictionaryRepresentation]];
        }
        uint64_t v36 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v52 objects:v73 count:16];
      }
      while (v36);
    }
    [v3 setObject:v33 forKey:@"cancelError"];
  }
  if ([(NSMutableArray *)self->_errors count])
  {
    v39 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_errors, "count")];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    errors = self->_errors;
    uint64_t v41 = [(NSMutableArray *)errors countByEnumeratingWithState:&v48 objects:v72 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v49;
      do
      {
        for (iuint64_t i = 0; ii != v42; ++ii)
        {
          if (*(void *)v49 != v43) {
            objc_enumerationMutation(errors);
          }
          [v39 addObject:[*(id *)(*((void *)&v48 + 1) + 8 * ii) dictionaryRepresentation]];
        }
        uint64_t v42 = [(NSMutableArray *)errors countByEnumeratingWithState:&v48 objects:v72 count:16];
      }
      while (v42);
    }
    [v3 setObject:v39 forKey:@"error"];
  }
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 0x2000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_allItemsSuccessful] forKey:@"allItemsSuccessful"];
    __int16 v45 = (__int16)self->_has;
    if ((v45 & 0x80) == 0)
    {
LABEL_78:
      if ((v45 & 0x1000) == 0) {
        goto LABEL_79;
      }
      goto LABEL_92;
    }
  }
  else if ((v45 & 0x80) == 0)
  {
    goto LABEL_78;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_itemCountSuccessful] forKey:@"itemCountSuccessful"];
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 0x1000) == 0)
  {
LABEL_79:
    if ((v45 & 0x40) == 0) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_92:
  [v3 setObject:[NSNumber numberWithBool:self->_allItemsFailed] forKey:@"allItemsFailed"];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_80:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_itemCountFailed] forKey:@"itemCountFailed"];
LABEL_81:
  ckContainerId = self->_ckContainerId;
  if (ckContainerId) {
    [v3 setObject:ckContainerId forKey:@"ckContainerId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSPutRequestInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    __int16 has = (__int16)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_cancelledErrorDomain) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_requestErrorDomain) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x20) == 0)
    {
LABEL_17:
      if ((v5 & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_74;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_18:
    if ((v5 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x400) == 0)
  {
LABEL_19:
    if ((v5 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x200) == 0)
  {
LABEL_20:
    if ((v5 & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_21:
  }
    PBDataWriterWriteInt32Field();
LABEL_22:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  chunkingInfos = self->_chunkingInfos;
  uint64_t v7 = [(NSMutableArray *)chunkingInfos countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(chunkingInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)chunkingInfos countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v8);
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  authHttpInfos = self->_authHttpInfos;
  uint64_t v12 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(authHttpInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v13);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  containerHttpInfos = self->_containerHttpInfos;
  uint64_t v17 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v49 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(containerHttpInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v49 objects:v64 count:16];
    }
    while (v18);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  completeHttpInfos = self->_completeHttpInfos;
  uint64_t v22 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v45 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v46;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(completeHttpInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v45 objects:v63 count:16];
    }
    while (v23);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  cancelErrors = self->_cancelErrors;
  uint64_t v27 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v41 objects:v62 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(cancelErrors);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v41 objects:v62 count:16];
    }
    while (v28);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  errors = self->_errors;
  uint64_t v32 = [(NSMutableArray *)errors countByEnumeratingWithState:&v37 objects:v61 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(errors);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v33 = [(NSMutableArray *)errors countByEnumeratingWithState:&v37 objects:v61 count:16];
    }
    while (v33);
  }
  __int16 v36 = (__int16)self->_has;
  if ((v36 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v36 = (__int16)self->_has;
    if ((v36 & 0x80) == 0)
    {
LABEL_66:
      if ((v36 & 0x1000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_80;
    }
  }
  else if ((v36 & 0x80) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteUint32Field();
  __int16 v36 = (__int16)self->_has;
  if ((v36 & 0x1000) == 0)
  {
LABEL_67:
    if ((v36 & 0x40) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_68:
  }
    PBDataWriterWriteUint32Field();
LABEL_69:
  if (self->_ckContainerId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 82) |= 4u;
  }
  if (self->_clientId) {
    [a3 setClientId:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_startTime;
    *((_WORD *)a3 + 82) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_duration;
    *((_WORD *)a3 + 82) |= 1u;
  }
  if (self->_cancelledErrorDomain) {
    [a3 setCancelledErrorDomain:];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_cancelledErrorCode;
    *((_WORD *)a3 + 82) |= 8u;
  }
  if (self->_requestErrorDomain) {
    [a3 setRequestErrorDomain:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((_DWORD *)a3 + 36) = self->_requestErrorCode;
    *((_WORD *)a3 + 82) |= 0x800u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 30) = self->_itemCount;
  *((_WORD *)a3 + 82) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 33) = self->_itemsAlreadyPresentCount;
  *((_WORD *)a3 + 82) |= 0x100u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0) {
      goto LABEL_20;
    }
LABEL_59:
    *((_DWORD *)a3 + 34) = self->_itemsNotPresentCount;
    *((_WORD *)a3 + 82) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_58:
  *((_DWORD *)a3 + 35) = self->_itemsPartiallyPresentCount;
  *((_WORD *)a3 + 82) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0) {
    goto LABEL_59;
  }
LABEL_20:
  if ((v6 & 0x10) != 0)
  {
LABEL_21:
    *((_DWORD *)a3 + 18) = self->_chunksUploaded;
    *((_WORD *)a3 + 82) |= 0x10u;
  }
LABEL_22:
  if ([(AWDMMCSPutRequestInfo *)self chunkingInfosCount])
  {
    [a3 clearChunkingInfos];
    unint64_t v7 = [(AWDMMCSPutRequestInfo *)self chunkingInfosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addChunkingInfos:-[AWDMMCSPutRequestInfo chunkingInfosAtIndex:](self, "chunkingInfosAtIndex:", i)];
    }
  }
  if ([(AWDMMCSPutRequestInfo *)self authHttpInfosCount])
  {
    [a3 clearAuthHttpInfos];
    unint64_t v10 = [(AWDMMCSPutRequestInfo *)self authHttpInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addAuthHttpInfos:-[AWDMMCSPutRequestInfo authHttpInfosAtIndex:](self, "authHttpInfosAtIndex:", j)];
    }
  }
  if ([(AWDMMCSPutRequestInfo *)self containerHttpInfosCount])
  {
    [a3 clearContainerHttpInfos];
    unint64_t v13 = [(AWDMMCSPutRequestInfo *)self containerHttpInfosCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        [a3 addContainerHttpInfos:[[self containerHttpInfosAtIndex:k]];
    }
  }
  if ([(AWDMMCSPutRequestInfo *)self completeHttpInfosCount])
  {
    [a3 clearCompleteHttpInfos];
    unint64_t v16 = [(AWDMMCSPutRequestInfo *)self completeHttpInfosCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [a3 addCompleteHttpInfos:-[AWDMMCSPutRequestInfo completeHttpInfosAtIndex:](self, "completeHttpInfosAtIndex:", m)];
    }
  }
  if ([(AWDMMCSPutRequestInfo *)self cancelErrorsCount])
  {
    [a3 clearCancelErrors];
    unint64_t v19 = [(AWDMMCSPutRequestInfo *)self cancelErrorsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [a3 addCancelError: -[AWDMMCSPutRequestInfo cancelErrorAtIndex:](self, "cancelErrorAtIndex:", n)];
    }
  }
  if ([(AWDMMCSPutRequestInfo *)self errorsCount])
  {
    [a3 clearErrors];
    unint64_t v22 = [(AWDMMCSPutRequestInfo *)self errorsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
        [a3 addError:-[AWDMMCSPutRequestInfo errorAtIndex:](self, "errorAtIndex:", ii)];
    }
  }
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x2000) != 0)
  {
    *((unsigned char *)a3 + 161) = self->_allItemsSuccessful;
    *((_WORD *)a3 + 82) |= 0x2000u;
    __int16 v25 = (__int16)self->_has;
    if ((v25 & 0x80) == 0)
    {
LABEL_48:
      if ((v25 & 0x1000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_63;
    }
  }
  else if ((v25 & 0x80) == 0)
  {
    goto LABEL_48;
  }
  *((_DWORD *)a3 + 32) = self->_itemCountSuccessful;
  *((_WORD *)a3 + 82) |= 0x80u;
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x1000) == 0)
  {
LABEL_49:
    if ((v25 & 0x40) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_63:
  *((unsigned char *)a3 + 160) = self->_allItemsFailed;
  *((_WORD *)a3 + 82) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_50:
    *((_DWORD *)a3 + 31) = self->_itemCountFailed;
    *((_WORD *)a3 + 82) |= 0x40u;
  }
LABEL_51:
  if (self->_ckContainerId)
  {
    [a3 setCkContainerId:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 164) |= 4u;
  }

  *(void *)(v6 + 88) = [(NSString *)self->_clientId copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_startTime;
    *(_WORD *)(v6 + 164) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_duration;
    *(_WORD *)(v6 + 164) |= 1u;
  }

  *(void *)(v6 + 56) = [(NSString *)self->_cancelledErrorDomain copyWithZone:a3];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_cancelledErrorCode;
    *(_WORD *)(v6 + 164) |= 8u;
  }

  *(void *)(v6 + 152) = [(NSString *)self->_requestErrorDomain copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_requestErrorCode;
    *(_WORD *)(v6 + 164) |= 0x800u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x20) == 0)
    {
LABEL_11:
      if ((v8 & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_66;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 120) = self->_itemCount;
  *(_WORD *)(v6 + 164) |= 0x20u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_12:
    if ((v8 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v6 + 132) = self->_itemsAlreadyPresentCount;
  *(_WORD *)(v6 + 164) |= 0x100u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x400) == 0)
  {
LABEL_13:
    if ((v8 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v6 + 140) = self->_itemsPartiallyPresentCount;
  *(_WORD *)(v6 + 164) |= 0x400u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_14:
    if ((v8 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_68:
  *(_DWORD *)(v6 + 136) = self->_itemsNotPresentCount;
  *(_WORD *)(v6 + 164) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 72) = self->_chunksUploaded;
    *(_WORD *)(v6 + 164) |= 0x10u;
  }
LABEL_16:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  chunkingInfos = self->_chunkingInfos;
  uint64_t v10 = [(NSMutableArray *)chunkingInfos countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v68 != v12) {
          objc_enumerationMutation(chunkingInfos);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addChunkingInfos:v14];
      }
      uint64_t v11 = [(NSMutableArray *)chunkingInfos countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v11);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  authHttpInfos = self->_authHttpInfos;
  uint64_t v16 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v64 != v18) {
          objc_enumerationMutation(authHttpInfos);
        }
        unint64_t v20 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addAuthHttpInfos:v20];
      }
      uint64_t v17 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v17);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  containerHttpInfos = self->_containerHttpInfos;
  uint64_t v22 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v60 != v24) {
          objc_enumerationMutation(containerHttpInfos);
        }
        v26 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addContainerHttpInfos:v26];
      }
      uint64_t v23 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v23);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  completeHttpInfos = self->_completeHttpInfos;
  uint64_t v28 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v56;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v56 != v30) {
          objc_enumerationMutation(completeHttpInfos);
        }
        uint64_t v32 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addCompleteHttpInfos:v32];
      }
      uint64_t v29 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v29);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  cancelErrors = self->_cancelErrors;
  uint64_t v34 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v51 objects:v72 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(cancelErrors);
        }
        long long v38 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * n) copyWithZone:a3];
        [(id)v6 addCancelError:v38];
      }
      uint64_t v35 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v51 objects:v72 count:16];
    }
    while (v35);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  errors = self->_errors;
  uint64_t v40 = [(NSMutableArray *)errors countByEnumeratingWithState:&v47 objects:v71 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (iuint64_t i = 0; ii != v41; ++ii)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(errors);
        }
        long long v44 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v6 addError:v44];
      }
      uint64_t v41 = [(NSMutableArray *)errors countByEnumeratingWithState:&v47 objects:v71 count:16];
    }
    while (v41);
  }
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 0x2000) != 0)
  {
    *(unsigned char *)(v6 + 161) = self->_allItemsSuccessful;
    *(_WORD *)(v6 + 164) |= 0x2000u;
    __int16 v45 = (__int16)self->_has;
    if ((v45 & 0x80) == 0)
    {
LABEL_60:
      if ((v45 & 0x1000) == 0) {
        goto LABEL_61;
      }
LABEL_72:
      *(unsigned char *)(v6 + 160) = self->_allItemsFailed;
      *(_WORD *)(v6 + 164) |= 0x1000u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        goto LABEL_63;
      }
      goto LABEL_62;
    }
  }
  else if ((v45 & 0x80) == 0)
  {
    goto LABEL_60;
  }
  *(_DWORD *)(v6 + 128) = self->_itemCountSuccessful;
  *(_WORD *)(v6 + 164) |= 0x80u;
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 0x1000) != 0) {
    goto LABEL_72;
  }
LABEL_61:
  if ((v45 & 0x40) != 0)
  {
LABEL_62:
    *(_DWORD *)(v6 + 124) = self->_itemCountFailed;
    *(_WORD *)(v6 + 164) |= 0x40u;
  }
LABEL_63:

  *(void *)(v6 + 80) = [(NSString *)self->_ckContainerId copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 82);
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_101;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_101;
    }
    clientId = self->_clientId;
    if ((unint64_t)clientId | *((void *)a3 + 11))
    {
      int v5 = -[NSString isEqual:](clientId, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v9 = *((_WORD *)a3 + 82);
    if ((has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_startTime != *((void *)a3 + 2)) {
        goto LABEL_101;
      }
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_101;
    }
    if (has)
    {
      if ((v9 & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_101;
      }
    }
    else if (v9)
    {
      goto LABEL_101;
    }
    cancelledErrorDomaiuint64_t n = self->_cancelledErrorDomain;
    if ((unint64_t)cancelledErrorDomain | *((void *)a3 + 7))
    {
      int v5 = -[NSString isEqual:](cancelledErrorDomain, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v11 = *((_WORD *)a3 + 82);
    if ((has & 8) != 0)
    {
      if ((v11 & 8) == 0 || self->_cancelledErrorCode != *((_DWORD *)a3 + 12)) {
        goto LABEL_101;
      }
    }
    else if ((v11 & 8) != 0)
    {
      goto LABEL_101;
    }
    requestErrorDomaiuint64_t n = self->_requestErrorDomain;
    if ((unint64_t)requestErrorDomain | *((void *)a3 + 19))
    {
      int v5 = -[NSString isEqual:](requestErrorDomain, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v13 = *((_WORD *)a3 + 82);
    if ((has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x800) == 0 || self->_requestErrorCode != *((_DWORD *)a3 + 36)) {
        goto LABEL_101;
      }
    }
    else if ((*((_WORD *)a3 + 82) & 0x800) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x20) != 0)
    {
      if ((v13 & 0x20) == 0 || self->_itemCount != *((_DWORD *)a3 + 30)) {
        goto LABEL_101;
      }
    }
    else if ((v13 & 0x20) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x100) == 0 || self->_itemsAlreadyPresentCount != *((_DWORD *)a3 + 33)) {
        goto LABEL_101;
      }
    }
    else if ((*((_WORD *)a3 + 82) & 0x100) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x400) == 0 || self->_itemsPartiallyPresentCount != *((_DWORD *)a3 + 35)) {
        goto LABEL_101;
      }
    }
    else if ((*((_WORD *)a3 + 82) & 0x400) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x200) == 0 || self->_itemsNotPresentCount != *((_DWORD *)a3 + 34)) {
        goto LABEL_101;
      }
    }
    else if ((*((_WORD *)a3 + 82) & 0x200) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x10) != 0)
    {
      if ((v13 & 0x10) == 0 || self->_chunksUploaded != *((_DWORD *)a3 + 18)) {
        goto LABEL_101;
      }
    }
    else if ((v13 & 0x10) != 0)
    {
      goto LABEL_101;
    }
    chunkingInfos = self->_chunkingInfos;
    if (!((unint64_t)chunkingInfos | *((void *)a3 + 8))
      || (int v5 = -[NSMutableArray isEqual:](chunkingInfos, "isEqual:")) != 0)
    {
      authHttpInfos = self->_authHttpInfos;
      if (!((unint64_t)authHttpInfos | *((void *)a3 + 4))
        || (int v5 = -[NSMutableArray isEqual:](authHttpInfos, "isEqual:")) != 0)
      {
        containerHttpInfos = self->_containerHttpInfos;
        if (!((unint64_t)containerHttpInfos | *((void *)a3 + 13))
          || (int v5 = -[NSMutableArray isEqual:](containerHttpInfos, "isEqual:")) != 0)
        {
          completeHttpInfos = self->_completeHttpInfos;
          if (!((unint64_t)completeHttpInfos | *((void *)a3 + 12))
            || (int v5 = -[NSMutableArray isEqual:](completeHttpInfos, "isEqual:")) != 0)
          {
            cancelErrors = self->_cancelErrors;
            if (!((unint64_t)cancelErrors | *((void *)a3 + 5))
              || (int v5 = -[NSMutableArray isEqual:](cancelErrors, "isEqual:")) != 0)
            {
              errors = self->_errors;
              if (!((unint64_t)errors | *((void *)a3 + 14))
                || (int v5 = -[NSMutableArray isEqual:](errors, "isEqual:")) != 0)
              {
                __int16 v20 = (__int16)self->_has;
                __int16 v21 = *((_WORD *)a3 + 82);
                if ((v20 & 0x2000) != 0)
                {
                  if ((*((_WORD *)a3 + 82) & 0x2000) == 0) {
                    goto LABEL_101;
                  }
                  if (self->_allItemsSuccessful)
                  {
                    if (!*((unsigned char *)a3 + 161)) {
                      goto LABEL_101;
                    }
                  }
                  else if (*((unsigned char *)a3 + 161))
                  {
                    goto LABEL_101;
                  }
                }
                else if ((*((_WORD *)a3 + 82) & 0x2000) != 0)
                {
                  goto LABEL_101;
                }
                if ((v20 & 0x80) != 0)
                {
                  if ((v21 & 0x80) == 0 || self->_itemCountSuccessful != *((_DWORD *)a3 + 32)) {
                    goto LABEL_101;
                  }
                }
                else if ((v21 & 0x80) != 0)
                {
                  goto LABEL_101;
                }
                if ((*(_WORD *)&self->_has & 0x1000) == 0)
                {
                  if ((*((_WORD *)a3 + 82) & 0x1000) != 0) {
                    goto LABEL_101;
                  }
                  goto LABEL_94;
                }
                if ((*((_WORD *)a3 + 82) & 0x1000) != 0)
                {
                  if (self->_allItemsFailed)
                  {
                    if (!*((unsigned char *)a3 + 160)) {
                      goto LABEL_101;
                    }
                    goto LABEL_94;
                  }
                  if (!*((unsigned char *)a3 + 160))
                  {
LABEL_94:
                    if ((v20 & 0x40) != 0)
                    {
                      if ((v21 & 0x40) == 0 || self->_itemCountFailed != *((_DWORD *)a3 + 31)) {
                        goto LABEL_101;
                      }
                    }
                    else if ((v21 & 0x40) != 0)
                    {
                      goto LABEL_101;
                    }
                    ckContainerId = self->_ckContainerId;
                    if ((unint64_t)ckContainerId | *((void *)a3 + 10))
                    {
                      LOBYTE(v5) = -[NSString isEqual:](ckContainerId, "isEqual:");
                    }
                    else
                    {
                      LOBYTE(v5) = 1;
                    }
                    return v5;
                  }
                }
LABEL_101:
                LOBYTE(v5) = 0;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v29 = 2654435761 * self->_timestamp;
  }
  else {
    uint64_t v29 = 0;
  }
  NSUInteger v28 = [(NSString *)self->_clientId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v27 = 2654435761 * self->_startTime;
    if (has) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if (has)
    {
LABEL_6:
      uint64_t v26 = 2654435761 * self->_duration;
      goto LABEL_9;
    }
  }
  uint64_t v26 = 0;
LABEL_9:
  NSUInteger v25 = [(NSString *)self->_cancelledErrorDomain hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v24 = 2654435761 * self->_cancelledErrorCode;
  }
  else {
    uint64_t v24 = 0;
  }
  NSUInteger v23 = [(NSString *)self->_requestErrorDomain hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x800) != 0)
  {
    uint64_t v22 = 2654435761 * self->_requestErrorCode;
    if ((v4 & 0x20) != 0)
    {
LABEL_14:
      uint64_t v21 = 2654435761 * self->_itemCount;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((v4 & 0x20) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    uint64_t v20 = 2654435761 * self->_itemsAlreadyPresentCount;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    uint64_t v19 = 2654435761 * self->_itemsPartiallyPresentCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_17;
    }
LABEL_23:
    uint64_t v5 = 0;
    if ((v4 & 0x10) != 0) {
      goto LABEL_18;
    }
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_23;
  }
LABEL_17:
  uint64_t v5 = 2654435761 * self->_itemsNotPresentCount;
  if ((v4 & 0x10) != 0)
  {
LABEL_18:
    uint64_t v6 = 2654435761 * self->_chunksUploaded;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v6 = 0;
LABEL_25:
  uint64_t v7 = [(NSMutableArray *)self->_chunkingInfos hash];
  uint64_t v8 = [(NSMutableArray *)self->_authHttpInfos hash];
  uint64_t v9 = [(NSMutableArray *)self->_containerHttpInfos hash];
  uint64_t v10 = [(NSMutableArray *)self->_completeHttpInfos hash];
  uint64_t v11 = [(NSMutableArray *)self->_cancelErrors hash];
  uint64_t v12 = [(NSMutableArray *)self->_errors hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x2000) != 0)
  {
    uint64_t v14 = 2654435761 * self->_allItemsSuccessful;
    if ((v13 & 0x80) != 0)
    {
LABEL_27:
      uint64_t v15 = 2654435761 * self->_itemCountSuccessful;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_28;
      }
LABEL_32:
      uint64_t v16 = 0;
      if ((v13 & 0x40) != 0) {
        goto LABEL_29;
      }
LABEL_33:
      uint64_t v17 = 0;
      return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_ckContainerId hash];
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((v13 & 0x80) != 0) {
      goto LABEL_27;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_32;
  }
LABEL_28:
  uint64_t v16 = 2654435761 * self->_allItemsFailed;
  if ((v13 & 0x40) == 0) {
    goto LABEL_33;
  }
LABEL_29:
  uint64_t v17 = 2654435761 * self->_itemCountFailed;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_ckContainerId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  if ((*((_WORD *)a3 + 82) & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 11)) {
    -[AWDMMCSPutRequestInfo setClientId:](self, "setClientId:");
  }
  __int16 v5 = *((_WORD *)a3 + 82);
  if ((v5 & 2) != 0)
  {
    self->_startTime = *((void *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)a3 + 82);
  }
  if (v5)
  {
    self->_duratiouint64_t n = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDMMCSPutRequestInfo setCancelledErrorDomain:](self, "setCancelledErrorDomain:");
  }
  if ((*((_WORD *)a3 + 82) & 8) != 0)
  {
    self->_cancelledErrorCode = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 19)) {
    -[AWDMMCSPutRequestInfo setRequestErrorDomain:](self, "setRequestErrorDomain:");
  }
  __int16 v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x800) != 0)
  {
    self->_requestErrorCode = *((_DWORD *)a3 + 36);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v6 = *((_WORD *)a3 + 82);
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  self->_itemCount = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_itemsAlreadyPresentCount = *((_DWORD *)a3 + 33);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x400) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_itemsPartiallyPresentCount = *((_DWORD *)a3 + 35);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x200) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_76:
  self->_itemsNotPresentCount = *((_DWORD *)a3 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 82) & 0x10) != 0)
  {
LABEL_21:
    self->_chunksUploaded = *((_DWORD *)a3 + 18);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_22:
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v59 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDMMCSPutRequestInfo *)self addChunkingInfos:*(void *)(*((void *)&v58 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v9);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AWDMMCSPutRequestInfo *)self addAuthHttpInfos:*(void *)(*((void *)&v54 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v14);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v17 = (void *)*((void *)a3 + 13);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(v17);
        }
        [(AWDMMCSPutRequestInfo *)self addContainerHttpInfos:*(void *)(*((void *)&v50 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v19);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v22 = (void *)*((void *)a3 + 12);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v64 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v22);
        }
        [(AWDMMCSPutRequestInfo *)self addCompleteHttpInfos:*(void *)(*((void *)&v46 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v24);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v27 = (void *)*((void *)a3 + 5);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v63 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v43;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v27);
        }
        [(AWDMMCSPutRequestInfo *)self addCancelError:*(void *)(*((void *)&v42 + 1) + 8 * n)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v63 count:16];
    }
    while (v29);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v32 = (void *)*((void *)a3 + 14);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v38 objects:v62 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v39;
    do
    {
      for (iuint64_t i = 0; ii != v34; ++ii)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v32);
        }
        [(AWDMMCSPutRequestInfo *)self addError:*(void *)(*((void *)&v38 + 1) + 8 * ii)];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v34);
  }
  __int16 v37 = *((_WORD *)a3 + 82);
  if ((v37 & 0x2000) != 0)
  {
    self->_allItemsSuccessful = *((unsigned char *)a3 + 161);
    *(_WORD *)&self->_has |= 0x2000u;
    __int16 v37 = *((_WORD *)a3 + 82);
    if ((v37 & 0x80) == 0)
    {
LABEL_66:
      if ((v37 & 0x1000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_80;
    }
  }
  else if ((v37 & 0x80) == 0)
  {
    goto LABEL_66;
  }
  self->_itemCountSuccessful = *((_DWORD *)a3 + 32);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v37 = *((_WORD *)a3 + 82);
  if ((v37 & 0x1000) == 0)
  {
LABEL_67:
    if ((v37 & 0x40) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_80:
  self->_allItemsFailed = *((unsigned char *)a3 + 160);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)a3 + 82) & 0x40) != 0)
  {
LABEL_68:
    self->_itemCountFailed = *((_DWORD *)a3 + 31);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_69:
  if (*((void *)a3 + 10)) {
    -[AWDMMCSPutRequestInfo setCkContainerId:](self, "setCkContainerId:");
  }
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)duration
{
  return self->_duration;
}

- (NSString)cancelledErrorDomain
{
  return self->_cancelledErrorDomain;
}

- (void)setCancelledErrorDomain:(id)a3
{
}

- (int)cancelledErrorCode
{
  return self->_cancelledErrorCode;
}

- (NSString)requestErrorDomain
{
  return self->_requestErrorDomain;
}

- (void)setRequestErrorDomain:(id)a3
{
}

- (int)requestErrorCode
{
  return self->_requestErrorCode;
}

- (int)itemCount
{
  return self->_itemCount;
}

- (int)itemsAlreadyPresentCount
{
  return self->_itemsAlreadyPresentCount;
}

- (int)itemsPartiallyPresentCount
{
  return self->_itemsPartiallyPresentCount;
}

- (int)itemsNotPresentCount
{
  return self->_itemsNotPresentCount;
}

- (int)chunksUploaded
{
  return self->_chunksUploaded;
}

- (NSMutableArray)chunkingInfos
{
  return self->_chunkingInfos;
}

- (void)setChunkingInfos:(id)a3
{
}

- (NSMutableArray)authHttpInfos
{
  return self->_authHttpInfos;
}

- (void)setAuthHttpInfos:(id)a3
{
}

- (NSMutableArray)containerHttpInfos
{
  return self->_containerHttpInfos;
}

- (void)setContainerHttpInfos:(id)a3
{
}

- (NSMutableArray)completeHttpInfos
{
  return self->_completeHttpInfos;
}

- (void)setCompleteHttpInfos:(id)a3
{
}

- (NSMutableArray)cancelErrors
{
  return self->_cancelErrors;
}

- (void)setCancelErrors:(id)a3
{
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (BOOL)allItemsSuccessful
{
  return self->_allItemsSuccessful;
}

- (unsigned)itemCountSuccessful
{
  return self->_itemCountSuccessful;
}

- (BOOL)allItemsFailed
{
  return self->_allItemsFailed;
}

- (unsigned)itemCountFailed
{
  return self->_itemCountFailed;
}

- (NSString)ckContainerId
{
  return self->_ckContainerId;
}

- (void)setCkContainerId:(id)a3
{
}

@end