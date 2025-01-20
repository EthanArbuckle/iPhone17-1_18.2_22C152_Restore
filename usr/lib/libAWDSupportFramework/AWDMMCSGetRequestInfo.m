@interface AWDMMCSGetRequestInfo
+ (Class)authHttpInfosType;
+ (Class)cancelErrorType;
+ (Class)completeHttpInfosType;
+ (Class)containerHttpInfosType;
+ (Class)errorType;
- (BOOL)allItemsFailed;
- (BOOL)allItemsSuccessful;
- (BOOL)hasAllItemsFailed;
- (BOOL)hasAllItemsSuccessful;
- (BOOL)hasCancelledErrorCode;
- (BOOL)hasCancelledErrorDomain;
- (BOOL)hasCkContainerId;
- (BOOL)hasClientId;
- (BOOL)hasDuration;
- (BOOL)hasItemCount;
- (BOOL)hasItemCountFailed;
- (BOOL)hasItemCountSuccessful;
- (BOOL)hasItemsNeedingChunks;
- (BOOL)hasLocalBytes;
- (BOOL)hasRequestErrorCode;
- (BOOL)hasRequestErrorDomain;
- (BOOL)hasResumedBytes;
- (BOOL)hasStartTime;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)authHttpInfos;
- (NSMutableArray)cancelErrors;
- (NSMutableArray)completeHttpInfos;
- (NSMutableArray)containerHttpInfos;
- (NSMutableArray)errors;
- (NSString)cancelledErrorDomain;
- (NSString)ckContainerId;
- (NSString)clientId;
- (NSString)requestErrorDomain;
- (id)authHttpInfosAtIndex:(unint64_t)a3;
- (id)cancelErrorAtIndex:(unint64_t)a3;
- (id)completeHttpInfosAtIndex:(unint64_t)a3;
- (id)containerHttpInfosAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorAtIndex:(unint64_t)a3;
- (int)cancelledErrorCode;
- (int)itemCount;
- (int)itemsNeedingChunks;
- (int)requestErrorCode;
- (int64_t)duration;
- (int64_t)localBytes;
- (int64_t)resumedBytes;
- (int64_t)startTime;
- (int64_t)timestamp;
- (unint64_t)authHttpInfosCount;
- (unint64_t)cancelErrorsCount;
- (unint64_t)completeHttpInfosCount;
- (unint64_t)containerHttpInfosCount;
- (unint64_t)errorsCount;
- (unint64_t)hash;
- (unsigned)itemCountFailed;
- (unsigned)itemCountSuccessful;
- (void)addAuthHttpInfos:(id)a3;
- (void)addCancelError:(id)a3;
- (void)addCompleteHttpInfos:(id)a3;
- (void)addContainerHttpInfos:(id)a3;
- (void)addError:(id)a3;
- (void)clearAuthHttpInfos;
- (void)clearCancelErrors;
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
- (void)setCkContainerId:(id)a3;
- (void)setClientId:(id)a3;
- (void)setCompleteHttpInfos:(id)a3;
- (void)setContainerHttpInfos:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setErrors:(id)a3;
- (void)setHasAllItemsFailed:(BOOL)a3;
- (void)setHasAllItemsSuccessful:(BOOL)a3;
- (void)setHasCancelledErrorCode:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasItemCount:(BOOL)a3;
- (void)setHasItemCountFailed:(BOOL)a3;
- (void)setHasItemCountSuccessful:(BOOL)a3;
- (void)setHasItemsNeedingChunks:(BOOL)a3;
- (void)setHasLocalBytes:(BOOL)a3;
- (void)setHasRequestErrorCode:(BOOL)a3;
- (void)setHasResumedBytes:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setItemCount:(int)a3;
- (void)setItemCountFailed:(unsigned int)a3;
- (void)setItemCountSuccessful:(unsigned int)a3;
- (void)setItemsNeedingChunks:(int)a3;
- (void)setLocalBytes:(int64_t)a3;
- (void)setRequestErrorCode:(int)a3;
- (void)setRequestErrorDomain:(id)a3;
- (void)setResumedBytes:(int64_t)a3;
- (void)setStartTime:(int64_t)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMMCSGetRequestInfo

- (void)dealloc
{
  [(AWDMMCSGetRequestInfo *)self setClientId:0];
  [(AWDMMCSGetRequestInfo *)self setCancelledErrorDomain:0];
  [(AWDMMCSGetRequestInfo *)self setRequestErrorDomain:0];
  [(AWDMMCSGetRequestInfo *)self setAuthHttpInfos:0];
  [(AWDMMCSGetRequestInfo *)self setContainerHttpInfos:0];
  [(AWDMMCSGetRequestInfo *)self setCompleteHttpInfos:0];
  [(AWDMMCSGetRequestInfo *)self setCancelErrors:0];
  [(AWDMMCSGetRequestInfo *)self setErrors:0];
  [(AWDMMCSGetRequestInfo *)self setCkContainerId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSGetRequestInfo;
  [(AWDMMCSGetRequestInfo *)&v3 dealloc];
}

- (void)setTimestamp:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (void)setStartTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 3) & 1;
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
  *(_WORD *)&self->_has |= 0x20u;
  self->_cancelledErrorCode = a3;
}

- (void)setHasCancelledErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCancelledErrorCode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasRequestErrorDomain
{
  return self->_requestErrorDomain != 0;
}

- (void)setRequestErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_requestErrorCode = a3;
}

- (void)setHasRequestErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRequestErrorCode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setItemCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_itemCount = a3;
}

- (void)setHasItemCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasItemCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setItemsNeedingChunks:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_itemsNeedingChunks = a3;
}

- (void)setHasItemsNeedingChunks:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasItemsNeedingChunks
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLocalBytes:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_localBytes = a3;
}

- (void)setHasLocalBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLocalBytes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResumedBytes:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_resumedBytes = a3;
}

- (void)setHasResumedBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasResumedBytes
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
  *(_WORD *)&self->_has |= 0x1000u;
  self->_allItemsSuccessful = a3;
}

- (void)setHasAllItemsSuccessful:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAllItemsSuccessful
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setItemCountSuccessful:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_itemCountSuccessful = a3;
}

- (void)setHasItemCountSuccessful:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasItemCountSuccessful
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAllItemsFailed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_allItemsFailed = a3;
}

- (void)setHasAllItemsFailed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasAllItemsFailed
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setItemCountFailed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_itemCountFailed = a3;
}

- (void)setHasItemCountFailed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasItemCountFailed
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasCkContainerId
{
  return self->_ckContainerId != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSGetRequestInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMMCSGetRequestInfo description](&v3, sel_description), -[AWDMMCSGetRequestInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"clientId"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
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
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_cancelledErrorCode] forKey:@"cancelledErrorCode"];
  }
  requestErrorDomaiuint64_t n = self->_requestErrorDomain;
  if (requestErrorDomain) {
    [v3 setObject:requestErrorDomain forKey:@"requestErrorDomain"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_requestErrorCode] forKey:@"requestErrorCode"];
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_17:
      if ((v8 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_76;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_itemCount] forKey:@"itemCount"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_18:
    if ((v8 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithInt:self->_itemsNeedingChunks] forKey:@"itemsNeedingChunks"];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_19:
    if ((v8 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithLongLong:self->_localBytes] forKey:@"localBytes"];
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_20:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_resumedBytes] forKey:@"resumedBytes"];
LABEL_21:
  if ([(NSMutableArray *)self->_authHttpInfos count])
  {
    v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_authHttpInfos, "count")];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    authHttpInfos = self->_authHttpInfos;
    uint64_t v11 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(authHttpInfos);
          }
          [v9 addObject:[*(id *)(*((void *)&v58 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v12 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v12);
    }
    [v3 setObject:v9 forKey:@"authHttpInfos"];
  }
  if ([(NSMutableArray *)self->_containerHttpInfos count])
  {
    v15 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_containerHttpInfos, "count")];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    containerHttpInfos = self->_containerHttpInfos;
    uint64_t v17 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v55 != v19) {
            objc_enumerationMutation(containerHttpInfos);
          }
          [v15 addObject:[*(id *)(*((void *)&v54 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v18 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v18);
    }
    [v3 setObject:v15 forKey:@"containerHttpInfos"];
  }
  if ([(NSMutableArray *)self->_completeHttpInfos count])
  {
    v21 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_completeHttpInfos, "count")];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    completeHttpInfos = self->_completeHttpInfos;
    uint64_t v23 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(completeHttpInfos);
          }
          [v21 addObject:[*(id *)(*((void *)&v50 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v24 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v50 objects:v64 count:16];
      }
      while (v24);
    }
    [v3 setObject:v21 forKey:@"completeHttpInfos"];
  }
  if ([(NSMutableArray *)self->_cancelErrors count])
  {
    v27 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_cancelErrors, "count")];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    cancelErrors = self->_cancelErrors;
    uint64_t v29 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v46 objects:v63 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(cancelErrors);
          }
          [v27 addObject:[*(id *)(*((void *)&v46 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v30 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v46 objects:v63 count:16];
      }
      while (v30);
    }
    [v3 setObject:v27 forKey:@"cancelError"];
  }
  if ([(NSMutableArray *)self->_errors count])
  {
    v33 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_errors, "count")];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    errors = self->_errors;
    uint64_t v35 = [(NSMutableArray *)errors countByEnumeratingWithState:&v42 objects:v62 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t n = 0; n != v36; ++n)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(errors);
          }
          [v33 addObject:[(*(id *)(*((void *)&v42 + 1) + 8 * n)) dictionaryRepresentation]];
        }
        uint64_t v36 = [(NSMutableArray *)errors countByEnumeratingWithState:&v42 objects:v62 count:16];
      }
      while (v36);
    }
    [v3 setObject:v33 forKey:@"error"];
  }
  __int16 v39 = (__int16)self->_has;
  if ((v39 & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_allItemsSuccessful] forKey:@"allItemsSuccessful"];
    __int16 v39 = (__int16)self->_has;
    if ((v39 & 0x100) == 0)
    {
LABEL_68:
      if ((v39 & 0x800) == 0) {
        goto LABEL_69;
      }
      goto LABEL_81;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_68;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_itemCountSuccessful] forKey:@"itemCountSuccessful"];
  __int16 v39 = (__int16)self->_has;
  if ((v39 & 0x800) == 0)
  {
LABEL_69:
    if ((v39 & 0x80) == 0) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithBool:self->_allItemsFailed] forKey:@"allItemsFailed"];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_70:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_itemCountFailed] forKey:@"itemCountFailed"];
LABEL_71:
  ckContainerId = self->_ckContainerId;
  if (ckContainerId) {
    [v3 setObject:ckContainerId forKey:@"ckContainerId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSGetRequestInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
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
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_requestErrorDomain) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_17:
      if ((v5 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_66;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x200) == 0)
  {
LABEL_18:
    if ((v5 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_19:
    if ((v5 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_20:
  }
    PBDataWriterWriteInt64Field();
LABEL_21:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  authHttpInfos = self->_authHttpInfos;
  uint64_t v7 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(authHttpInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v8);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  containerHttpInfos = self->_containerHttpInfos;
  uint64_t v12 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(containerHttpInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v13);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  completeHttpInfos = self->_completeHttpInfos;
  uint64_t v17 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(completeHttpInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v18);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  cancelErrors = self->_cancelErrors;
  uint64_t v22 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(cancelErrors);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v23);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  errors = self->_errors;
  uint64_t v27 = [(NSMutableArray *)errors countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(errors);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)errors countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v28);
  }
  __int16 v31 = (__int16)self->_has;
  if ((v31 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v31 = (__int16)self->_has;
    if ((v31 & 0x100) == 0)
    {
LABEL_58:
      if ((v31 & 0x800) == 0) {
        goto LABEL_59;
      }
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_58;
  }
  PBDataWriterWriteUint32Field();
  __int16 v31 = (__int16)self->_has;
  if ((v31 & 0x800) == 0)
  {
LABEL_59:
    if ((v31 & 0x80) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_60:
  }
    PBDataWriterWriteUint32Field();
LABEL_61:
  if (self->_ckContainerId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 78) |= 0x10u;
  }
  if (self->_clientId) {
    [a3 setClientId:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_startTime;
    *((_WORD *)a3 + 78) |= 8u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_duration;
    *((_WORD *)a3 + 78) |= 1u;
  }
  if (self->_cancelledErrorDomain) {
    [a3 setCancelledErrorDomain:];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_cancelledErrorCode;
    *((_WORD *)a3 + 78) |= 0x20u;
  }
  if (self->_requestErrorDomain) {
    [a3 setRequestErrorDomain:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_requestErrorCode;
    *((_WORD *)a3 + 78) |= 0x400u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_17:
      if ((v6 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 30) = self->_itemCount;
  *((_WORD *)a3 + 78) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0) {
      goto LABEL_19;
    }
LABEL_53:
    *((void *)a3 + 2) = self->_localBytes;
    *((_WORD *)a3 + 78) |= 2u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_52:
  *((_DWORD *)a3 + 33) = self->_itemsNeedingChunks;
  *((_WORD *)a3 + 78) |= 0x200u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0) {
    goto LABEL_53;
  }
LABEL_19:
  if ((v6 & 4) != 0)
  {
LABEL_20:
    *((void *)a3 + 3) = self->_resumedBytes;
    *((_WORD *)a3 + 78) |= 4u;
  }
LABEL_21:
  if ([(AWDMMCSGetRequestInfo *)self authHttpInfosCount])
  {
    [a3 clearAuthHttpInfos];
    unint64_t v7 = [(AWDMMCSGetRequestInfo *)self authHttpInfosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addAuthHttpInfos: -[AWDMMCSGetRequestInfo authHttpInfosAtIndex:](self, "authHttpInfosAtIndex:", i)];
    }
  }
  if ([(AWDMMCSGetRequestInfo *)self containerHttpInfosCount])
  {
    [a3 clearContainerHttpInfos];
    unint64_t v10 = [(AWDMMCSGetRequestInfo *)self containerHttpInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addContainerHttpInfos:-[AWDMMCSGetRequestInfo containerHttpInfosAtIndex:](self, "containerHttpInfosAtIndex:", j)];
    }
  }
  if ([(AWDMMCSGetRequestInfo *)self completeHttpInfosCount])
  {
    [a3 clearCompleteHttpInfos];
    unint64_t v13 = [(AWDMMCSGetRequestInfo *)self completeHttpInfosCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        [a3 addCompleteHttpInfos:-[AWDMMCSGetRequestInfo completeHttpInfosAtIndex:](self, "completeHttpInfosAtIndex:", k)];
    }
  }
  if ([(AWDMMCSGetRequestInfo *)self cancelErrorsCount])
  {
    [a3 clearCancelErrors];
    unint64_t v16 = [(AWDMMCSGetRequestInfo *)self cancelErrorsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [a3 addCancelError:-[AWDMMCSGetRequestInfo cancelErrorAtIndex:](self, "cancelErrorAtIndex:", m)];
    }
  }
  if ([(AWDMMCSGetRequestInfo *)self errorsCount])
  {
    [a3 clearErrors];
    unint64_t v19 = [(AWDMMCSGetRequestInfo *)self errorsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [a3 addError:-[AWDMMCSGetRequestInfo errorAtIndex:](self, "errorAtIndex:", n)];
    }
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x1000) != 0)
  {
    *((unsigned char *)a3 + 153) = self->_allItemsSuccessful;
    *((_WORD *)a3 + 78) |= 0x1000u;
    __int16 v22 = (__int16)self->_has;
    if ((v22 & 0x100) == 0)
    {
LABEL_43:
      if ((v22 & 0x800) == 0) {
        goto LABEL_44;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_43;
  }
  *((_DWORD *)a3 + 32) = self->_itemCountSuccessful;
  *((_WORD *)a3 + 78) |= 0x100u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x800) == 0)
  {
LABEL_44:
    if ((v22 & 0x80) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_57:
  *((unsigned char *)a3 + 152) = self->_allItemsFailed;
  *((_WORD *)a3 + 78) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_45:
    *((_DWORD *)a3 + 31) = self->_itemCountFailed;
    *((_WORD *)a3 + 78) |= 0x80u;
  }
LABEL_46:
  if (self->_ckContainerId)
  {
    [a3 setCkContainerId:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(_WORD *)(v5 + 156) |= 0x10u;
  }

  *(void *)(v6 + 88) = [(NSString *)self->_clientId copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_startTime;
    *(_WORD *)(v6 + 156) |= 8u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_duration;
    *(_WORD *)(v6 + 156) |= 1u;
  }

  *(void *)(v6 + 72) = [(NSString *)self->_cancelledErrorDomain copyWithZone:a3];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_cancelledErrorCode;
    *(_WORD *)(v6 + 156) |= 0x20u;
  }

  *(void *)(v6 + 144) = [(NSString *)self->_requestErrorDomain copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_requestErrorCode;
    *(_WORD *)(v6 + 156) |= 0x400u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_11:
      if ((v8 & 0x200) == 0) {
        goto LABEL_12;
      }
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 120) = self->_itemCount;
  *(_WORD *)(v6 + 156) |= 0x40u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_12:
    if ((v8 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 132) = self->_itemsNeedingChunks;
  *(_WORD *)(v6 + 156) |= 0x200u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_13:
    if ((v8 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_59:
  *(void *)(v6 + 16) = self->_localBytes;
  *(_WORD *)(v6 + 156) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_14:
    *(void *)(v6 + 24) = self->_resumedBytes;
    *(_WORD *)(v6 + 156) |= 4u;
  }
LABEL_15:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  authHttpInfos = self->_authHttpInfos;
  uint64_t v10 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v12) {
          objc_enumerationMutation(authHttpInfos);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addAuthHttpInfos:v14];
      }
      uint64_t v11 = [(NSMutableArray *)authHttpInfos countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v11);
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  containerHttpInfos = self->_containerHttpInfos;
  uint64_t v16 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(containerHttpInfos);
        }
        unint64_t v20 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addContainerHttpInfos:v20];
      }
      uint64_t v17 = [(NSMutableArray *)containerHttpInfos countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v17);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  completeHttpInfos = self->_completeHttpInfos;
  uint64_t v22 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(completeHttpInfos);
        }
        v26 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addCompleteHttpInfos:v26];
      }
      uint64_t v23 = [(NSMutableArray *)completeHttpInfos countByEnumeratingWithState:&v49 objects:v63 count:16];
    }
    while (v23);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  cancelErrors = self->_cancelErrors;
  uint64_t v28 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v45 objects:v62 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v46;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(cancelErrors);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addCancelError:v32];
      }
      uint64_t v29 = [(NSMutableArray *)cancelErrors countByEnumeratingWithState:&v45 objects:v62 count:16];
    }
    while (v29);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  errors = self->_errors;
  uint64_t v34 = [(NSMutableArray *)errors countByEnumeratingWithState:&v41 objects:v61 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(errors);
        }
        long long v38 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * n) copyWithZone:a3];
        [(id)v6 addError:v38];
      }
      uint64_t v35 = [(NSMutableArray *)errors countByEnumeratingWithState:&v41 objects:v61 count:16];
    }
    while (v35);
  }
  __int16 v39 = (__int16)self->_has;
  if ((v39 & 0x1000) != 0)
  {
    *(unsigned char *)(v6 + 153) = self->_allItemsSuccessful;
    *(_WORD *)(v6 + 156) |= 0x1000u;
    __int16 v39 = (__int16)self->_has;
    if ((v39 & 0x100) == 0)
    {
LABEL_52:
      if ((v39 & 0x800) == 0) {
        goto LABEL_53;
      }
LABEL_63:
      *(unsigned char *)(v6 + 152) = self->_allItemsFailed;
      *(_WORD *)(v6 + 156) |= 0x800u;
      if ((*(_WORD *)&self->_has & 0x80) == 0) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_52;
  }
  *(_DWORD *)(v6 + 128) = self->_itemCountSuccessful;
  *(_WORD *)(v6 + 156) |= 0x100u;
  __int16 v39 = (__int16)self->_has;
  if ((v39 & 0x800) != 0) {
    goto LABEL_63;
  }
LABEL_53:
  if ((v39 & 0x80) != 0)
  {
LABEL_54:
    *(_DWORD *)(v6 + 124) = self->_itemCountFailed;
    *(_WORD *)(v6 + 156) |= 0x80u;
  }
LABEL_55:

  *(void *)(v6 + 80) = [(NSString *)self->_ckContainerId copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 78);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
        goto LABEL_94;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_94;
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
    __int16 v9 = *((_WORD *)a3 + 78);
    if ((has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_startTime != *((void *)a3 + 4)) {
        goto LABEL_94;
      }
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_94;
    }
    if (has)
    {
      if ((v9 & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_94;
      }
    }
    else if (v9)
    {
      goto LABEL_94;
    }
    cancelledErrorDomaiuint64_t n = self->_cancelledErrorDomain;
    if ((unint64_t)cancelledErrorDomain | *((void *)a3 + 9))
    {
      int v5 = -[NSString isEqual:](cancelledErrorDomain, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v11 = *((_WORD *)a3 + 78);
    if ((has & 0x20) != 0)
    {
      if ((v11 & 0x20) == 0 || self->_cancelledErrorCode != *((_DWORD *)a3 + 16)) {
        goto LABEL_94;
      }
    }
    else if ((v11 & 0x20) != 0)
    {
      goto LABEL_94;
    }
    requestErrorDomaiuint64_t n = self->_requestErrorDomain;
    if ((unint64_t)requestErrorDomain | *((void *)a3 + 18))
    {
      int v5 = -[NSString isEqual:](requestErrorDomain, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v13 = *((_WORD *)a3 + 78);
    if ((has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 78) & 0x400) == 0 || self->_requestErrorCode != *((_DWORD *)a3 + 34)) {
        goto LABEL_94;
      }
    }
    else if ((*((_WORD *)a3 + 78) & 0x400) != 0)
    {
      goto LABEL_94;
    }
    if ((has & 0x40) != 0)
    {
      if ((v13 & 0x40) == 0 || self->_itemCount != *((_DWORD *)a3 + 30)) {
        goto LABEL_94;
      }
    }
    else if ((v13 & 0x40) != 0)
    {
      goto LABEL_94;
    }
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 78) & 0x200) == 0 || self->_itemsNeedingChunks != *((_DWORD *)a3 + 33)) {
        goto LABEL_94;
      }
    }
    else if ((*((_WORD *)a3 + 78) & 0x200) != 0)
    {
      goto LABEL_94;
    }
    if ((has & 2) != 0)
    {
      if ((v13 & 2) == 0 || self->_localBytes != *((void *)a3 + 2)) {
        goto LABEL_94;
      }
    }
    else if ((v13 & 2) != 0)
    {
      goto LABEL_94;
    }
    if ((has & 4) != 0)
    {
      if ((v13 & 4) == 0 || self->_resumedBytes != *((void *)a3 + 3)) {
        goto LABEL_94;
      }
    }
    else if ((v13 & 4) != 0)
    {
      goto LABEL_94;
    }
    authHttpInfos = self->_authHttpInfos;
    if (!((unint64_t)authHttpInfos | *((void *)a3 + 6))
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
          if (!((unint64_t)cancelErrors | *((void *)a3 + 7))
            || (int v5 = -[NSMutableArray isEqual:](cancelErrors, "isEqual:")) != 0)
          {
            errors = self->_errors;
            if (!((unint64_t)errors | *((void *)a3 + 14))
              || (int v5 = -[NSMutableArray isEqual:](errors, "isEqual:")) != 0)
            {
              __int16 v19 = (__int16)self->_has;
              __int16 v20 = *((_WORD *)a3 + 78);
              if ((v19 & 0x1000) != 0)
              {
                if ((*((_WORD *)a3 + 78) & 0x1000) == 0) {
                  goto LABEL_94;
                }
                if (self->_allItemsSuccessful)
                {
                  if (!*((unsigned char *)a3 + 153)) {
                    goto LABEL_94;
                  }
                }
                else if (*((unsigned char *)a3 + 153))
                {
                  goto LABEL_94;
                }
              }
              else if ((*((_WORD *)a3 + 78) & 0x1000) != 0)
              {
                goto LABEL_94;
              }
              if ((*(_WORD *)&self->_has & 0x100) != 0)
              {
                if ((*((_WORD *)a3 + 78) & 0x100) == 0 || self->_itemCountSuccessful != *((_DWORD *)a3 + 32)) {
                  goto LABEL_94;
                }
              }
              else if ((*((_WORD *)a3 + 78) & 0x100) != 0)
              {
                goto LABEL_94;
              }
              if ((*(_WORD *)&self->_has & 0x800) == 0)
              {
                if ((*((_WORD *)a3 + 78) & 0x800) != 0) {
                  goto LABEL_94;
                }
                goto LABEL_87;
              }
              if ((*((_WORD *)a3 + 78) & 0x800) != 0)
              {
                if (self->_allItemsFailed)
                {
                  if (!*((unsigned char *)a3 + 152)) {
                    goto LABEL_94;
                  }
                  goto LABEL_87;
                }
                if (!*((unsigned char *)a3 + 152))
                {
LABEL_87:
                  if ((v19 & 0x80) != 0)
                  {
                    if ((v20 & 0x80) == 0 || self->_itemCountFailed != *((_DWORD *)a3 + 31)) {
                      goto LABEL_94;
                    }
                  }
                  else if ((v20 & 0x80) != 0)
                  {
                    goto LABEL_94;
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
LABEL_94:
              LOBYTE(v5) = 0;
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
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v27 = 2654435761 * self->_timestamp;
  }
  else {
    uint64_t v27 = 0;
  }
  NSUInteger v26 = [(NSString *)self->_clientId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v25 = 2654435761 * self->_startTime;
    if (has) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if (has)
    {
LABEL_6:
      uint64_t v24 = 2654435761 * self->_duration;
      goto LABEL_9;
    }
  }
  uint64_t v24 = 0;
LABEL_9:
  NSUInteger v23 = [(NSString *)self->_cancelledErrorDomain hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v22 = 2654435761 * self->_cancelledErrorCode;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_requestErrorDomain hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x400) != 0)
  {
    uint64_t v20 = 2654435761 * self->_requestErrorCode;
    if ((v4 & 0x40) != 0)
    {
LABEL_14:
      uint64_t v19 = 2654435761 * self->_itemCount;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_15;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((v4 & 0x40) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_15:
    uint64_t v5 = 2654435761 * self->_itemsNeedingChunks;
    if ((v4 & 2) != 0) {
      goto LABEL_16;
    }
LABEL_21:
    uint64_t v6 = 0;
    if ((v4 & 4) != 0) {
      goto LABEL_17;
    }
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v5 = 0;
  if ((v4 & 2) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  uint64_t v6 = 2654435761 * self->_localBytes;
  if ((v4 & 4) != 0)
  {
LABEL_17:
    uint64_t v7 = 2654435761 * self->_resumedBytes;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
LABEL_23:
  uint64_t v8 = [(NSMutableArray *)self->_authHttpInfos hash];
  uint64_t v9 = [(NSMutableArray *)self->_containerHttpInfos hash];
  uint64_t v10 = [(NSMutableArray *)self->_completeHttpInfos hash];
  uint64_t v11 = [(NSMutableArray *)self->_cancelErrors hash];
  uint64_t v12 = [(NSMutableArray *)self->_errors hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x1000) != 0)
  {
    uint64_t v14 = 2654435761 * self->_allItemsSuccessful;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_25:
      uint64_t v15 = 2654435761 * self->_itemCountSuccessful;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_26;
      }
LABEL_30:
      uint64_t v16 = 0;
      if ((v13 & 0x80) != 0) {
        goto LABEL_27;
      }
LABEL_31:
      uint64_t v17 = 0;
      return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_ckContainerId hash];
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_25;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_30;
  }
LABEL_26:
  uint64_t v16 = 2654435761 * self->_allItemsFailed;
  if ((v13 & 0x80) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  uint64_t v17 = 2654435761 * self->_itemCountFailed;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_ckContainerId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if ((*((_WORD *)a3 + 78) & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 11)) {
    -[AWDMMCSGetRequestInfo setClientId:](self, "setClientId:");
  }
  __int16 v5 = *((_WORD *)a3 + 78);
  if ((v5 & 8) != 0)
  {
    self->_startTime = *((void *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)a3 + 78);
  }
  if (v5)
  {
    self->_duratiouint64_t n = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 9)) {
    -[AWDMMCSGetRequestInfo setCancelledErrorDomain:](self, "setCancelledErrorDomain:");
  }
  if ((*((_WORD *)a3 + 78) & 0x20) != 0)
  {
    self->_cancelledErrorCode = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)a3 + 18)) {
    -[AWDMMCSGetRequestInfo setRequestErrorDomain:](self, "setRequestErrorDomain:");
  }
  __int16 v6 = *((_WORD *)a3 + 78);
  if ((v6 & 0x400) != 0)
  {
    self->_requestErrorCode = *((_DWORD *)a3 + 34);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v6 = *((_WORD *)a3 + 78);
    if ((v6 & 0x40) == 0)
    {
LABEL_17:
      if ((v6 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_66;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  self->_itemCount = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)a3 + 78);
  if ((v6 & 0x200) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_itemsNeedingChunks = *((_DWORD *)a3 + 33);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v6 = *((_WORD *)a3 + 78);
  if ((v6 & 2) == 0)
  {
LABEL_19:
    if ((v6 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_67:
  self->_localBytes = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 78) & 4) != 0)
  {
LABEL_20:
    self->_resumedBytes = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_21:
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDMMCSGetRequestInfo *)self addAuthHttpInfos:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v9);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 13);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AWDMMCSGetRequestInfo *)self addContainerHttpInfos:*(void *)(*((void *)&v45 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v14);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v17 = (void *)*((void *)a3 + 12);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        [(AWDMMCSGetRequestInfo *)self addCompleteHttpInfos:*(void *)(*((void *)&v41 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v19);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v22 = (void *)*((void *)a3 + 7);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v54 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        [(AWDMMCSGetRequestInfo *)self addCancelError:*(void *)(*((void *)&v37 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v54 count:16];
    }
    while (v24);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v27 = (void *)*((void *)a3 + 14);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v53 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        [(AWDMMCSGetRequestInfo *)self addError:*(void *)(*((void *)&v33 + 1) + 8 * n)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v53 count:16];
    }
    while (v29);
  }
  __int16 v32 = *((_WORD *)a3 + 78);
  if ((v32 & 0x1000) != 0)
  {
    self->_allItemsSuccessful = *((unsigned char *)a3 + 153);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v32 = *((_WORD *)a3 + 78);
    if ((v32 & 0x100) == 0)
    {
LABEL_58:
      if ((v32 & 0x800) == 0) {
        goto LABEL_59;
      }
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)a3 + 78) & 0x100) == 0)
  {
    goto LABEL_58;
  }
  self->_itemCountSuccessful = *((_DWORD *)a3 + 32);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v32 = *((_WORD *)a3 + 78);
  if ((v32 & 0x800) == 0)
  {
LABEL_59:
    if ((v32 & 0x80) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_71:
  self->_allItemsFailed = *((unsigned char *)a3 + 152);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)a3 + 78) & 0x80) != 0)
  {
LABEL_60:
    self->_itemCountFailed = *((_DWORD *)a3 + 31);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_61:
  if (*((void *)a3 + 10)) {
    -[AWDMMCSGetRequestInfo setCkContainerId:](self, "setCkContainerId:");
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

- (int)itemsNeedingChunks
{
  return self->_itemsNeedingChunks;
}

- (int64_t)localBytes
{
  return self->_localBytes;
}

- (int64_t)resumedBytes
{
  return self->_resumedBytes;
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