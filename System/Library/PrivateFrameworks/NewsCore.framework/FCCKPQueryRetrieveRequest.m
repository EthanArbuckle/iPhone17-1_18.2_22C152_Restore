@interface FCCKPQueryRetrieveRequest
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)setContinuationMarker:(uint64_t)a1;
- (void)setQuery:(uint64_t)a1;
- (void)setRequestedFields:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPQueryRetrieveRequest

- (void)setRequestedFields:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setQuery:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_query)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_continuationMarker)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
}

+ (id)options
{
  if (qword_1EB5D1760 != -1) {
    dispatch_once(&qword_1EB5D1760, &__block_literal_global_99);
  }
  v2 = (void *)_MergedGlobals_183;
  return v2;
}

void __36__FCCKPQueryRetrieveRequest_options__block_invoke()
{
  v0 = (void *)_MergedGlobals_183;
  _MergedGlobals_183 = (uint64_t)&unk_1EF8D98A8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPQueryRetrieveRequest;
  id v4 = [(FCCKPQueryRetrieveRequest *)&v8 description];
  id v5 = [(FCCKPQueryRetrieveRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  query = self->_query;
  if (query)
  {
    id v5 = [(FCCKPQuery *)query dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"query"];
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker) {
    [v3 setObject:continuationMarker forKey:@"continuationMarker"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_limit];
    [v3 setObject:v7 forKey:@"limit"];
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v9 = [(FCCKPRecordZoneIdentifier *)zoneIdentifier dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"zoneIdentifier"];
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    v11 = [(FCCKPRequestedFields *)requestedFields dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"requestedFields"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPQueryRetrieveRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (unsigned)requestTypeCode
{
  return 11;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPQuery *)self->_query copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_continuationMarker copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_limit;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v10 = [(FCCKPRecordZoneIdentifier *)self->_zoneIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(FCCKPRequestedFields *)self->_requestedFields copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 3))
  {
    if (!-[FCCKPQuery isEqual:](query, "isEqual:")) {
      goto LABEL_15;
    }
  }
  continuationMarker = self->_continuationMarker;
  if ((unint64_t)continuationMarker | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](continuationMarker, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_limit != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if ((unint64_t)zoneIdentifier | *((void *)v4 + 5)
    && !-[FCCKPRecordZoneIdentifier isEqual:](zoneIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  requestedFields = self->_requestedFields;
  if ((unint64_t)requestedFields | *((void *)v4 + 4)) {
    char v9 = -[FCCKPRequestedFields isEqual:](requestedFields, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPQuery *)self->_query hash];
  uint64_t v4 = [(NSData *)self->_continuationMarker hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_limit;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(FCCKPRecordZoneIdentifier *)self->_zoneIdentifier hash];
  return v6 ^ [(FCCKPRequestedFields *)self->_requestedFields hash];
}

- (void)setContinuationMarker:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

@end