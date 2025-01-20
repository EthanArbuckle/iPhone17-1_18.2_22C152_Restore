@interface FCCKPRecordRetrieveRequest
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)setClientVersionETag:(uint64_t)a1;
- (void)setRecordIdentifier:(uint64_t)a1;
- (void)setRequestedFields:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecordRetrieveRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionETag, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_clientVersionETag, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_versionETag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientVersionETag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)setRequestedFields:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setRecordIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setClientVersionETag:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

+ (id)options
{
  if (qword_1EB5D1A90 != -1) {
    dispatch_once(&qword_1EB5D1A90, &__block_literal_global_157);
  }
  v2 = (void *)_MergedGlobals_211;
  return v2;
}

void __37__FCCKPRecordRetrieveRequest_options__block_invoke()
{
  v0 = (void *)_MergedGlobals_211;
  _MergedGlobals_211 = (uint64_t)&unk_1EF8D9970;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordRetrieveRequest;
  id v4 = [(FCCKPRecordRetrieveRequest *)&v8 description];
  id v5 = [(FCCKPRecordRetrieveRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    id v5 = [(FCCKPRecordIdentifier *)recordIdentifier dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"recordIdentifier"];
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    v7 = [(FCCKPRequestedFields *)requestedFields dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"requestedFields"];
  }
  versionETag = self->_versionETag;
  if (versionETag) {
    [v3 setObject:versionETag forKey:@"versionETag"];
  }
  clientVersionETag = self->_clientVersionETag;
  if (clientVersionETag) {
    [v3 setObject:clientVersionETag forKey:@"clientVersionETag"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordRetrieveRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (unsigned)requestTypeCode
{
  return 4;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPRecordIdentifier *)self->_recordIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(FCCKPRequestedFields *)self->_requestedFields copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_versionETag copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_clientVersionETag copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((recordIdentifier = self->_recordIdentifier, !((unint64_t)recordIdentifier | v4[2]))
     || -[FCCKPRecordIdentifier isEqual:](recordIdentifier, "isEqual:"))
    && ((requestedFields = self->_requestedFields, !((unint64_t)requestedFields | v4[3]))
     || -[FCCKPRequestedFields isEqual:](requestedFields, "isEqual:"))
    && ((versionETag = self->_versionETag, !((unint64_t)versionETag | v4[4]))
     || -[NSString isEqual:](versionETag, "isEqual:")))
  {
    clientVersionETag = self->_clientVersionETag;
    if ((unint64_t)clientVersionETag | v4[1]) {
      char v9 = -[NSString isEqual:](clientVersionETag, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPRecordIdentifier *)self->_recordIdentifier hash];
  unint64_t v4 = [(FCCKPRequestedFields *)self->_requestedFields hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_versionETag hash];
  return v4 ^ v5 ^ [(NSString *)self->_clientVersionETag hash];
}

@end