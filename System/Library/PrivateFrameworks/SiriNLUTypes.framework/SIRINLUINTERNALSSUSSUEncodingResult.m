@interface SIRINLUINTERNALSSUSSUEncodingResult
- (BOOL)hasRequestId;
- (BOOL)hasSsuEncoderVersion;
- (BOOL)hasUtterance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)requestId;
- (NSString)ssuEncoderVersion;
- (NSString)utterance;
- (float)encodingAtIndex:(unint64_t)a3;
- (float)encodings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)encodingsCount;
- (unint64_t)hash;
- (void)addEncoding:(float)a3;
- (void)clearEncodings;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEncodings:(float *)a3 count:(unint64_t)a4;
- (void)setRequestId:(id)a3;
- (void)setSsuEncoderVersion:(id)a3;
- (void)setUtterance:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSSUSSUEncodingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_ssuEncoderVersion, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setSsuEncoderVersion:(id)a3
{
}

- (NSString)ssuEncoderVersion
{
  return self->_ssuEncoderVersion;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v8 = v4;
  if (v4[4])
  {
    -[SIRINLUINTERNALSSUSSUEncodingResult setRequestId:](self, "setRequestId:");
    v4 = v8;
  }
  if (v4[5])
  {
    -[SIRINLUINTERNALSSUSSUEncodingResult setSsuEncoderVersion:](self, "setSsuEncoderVersion:");
    v4 = v8;
  }
  if (v4[6])
  {
    -[SIRINLUINTERNALSSUSSUEncodingResult setUtterance:](self, "setUtterance:");
    v4 = v8;
  }
  uint64_t v5 = [v4 encodingsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v8 encodingAtIndex:i];
      -[SIRINLUINTERNALSSUSSUEncodingResult addEncoding:](self, "addEncoding:");
    }
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  NSUInteger v4 = [(NSString *)self->_ssuEncoderVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_utterance hash];
  return v4 ^ v5 ^ PBRepeatedFloatHash();
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[4]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((ssuEncoderVersion = self->_ssuEncoderVersion, !((unint64_t)ssuEncoderVersion | v4[5]))
     || -[NSString isEqual:](ssuEncoderVersion, "isEqual:"))
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[6]))
     || -[NSString isEqual:](utterance, "isEqual:")))
  {
    char IsEqual = PBRepeatedFloatIsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestId copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_ssuEncoderVersion copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSString *)self->_utterance copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  PBRepeatedFloatCopy();
  return v5;
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if (self->_requestId) {
    objc_msgSend(v7, "setRequestId:");
  }
  if (self->_ssuEncoderVersion) {
    objc_msgSend(v7, "setSsuEncoderVersion:");
  }
  if (self->_utterance) {
    objc_msgSend(v7, "setUtterance:");
  }
  if ([(SIRINLUINTERNALSSUSSUEncodingResult *)self encodingsCount])
  {
    [v7 clearEncodings];
    unint64_t v4 = [(SIRINLUINTERNALSSUSSUEncodingResult *)self encodingsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(SIRINLUINTERNALSSUSSUEncodingResult *)self encodingAtIndex:i];
        objc_msgSend(v7, "addEncoding:");
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_ssuEncoderVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  p_encodings = &self->_encodings;
  if (p_encodings->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_encodings->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSSUSSUEncodingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"requestId"];
  }
  ssuEncoderVersion = self->_ssuEncoderVersion;
  if (ssuEncoderVersion) {
    [v4 setObject:ssuEncoderVersion forKey:@"ssuEncoderVersion"];
  }
  utterance = self->_utterance;
  if (utterance) {
    [v4 setObject:utterance forKey:@"utterance"];
  }
  uint64_t v8 = PBRepeatedFloatNSArray();
  [v4 setObject:v8 forKey:@"encoding"];

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSSUSSUEncodingResult;
  id v4 = [(SIRINLUINTERNALSSUSSUEncodingResult *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALSSUSSUEncodingResult *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setEncodings:(float *)a3 count:(unint64_t)a4
{
}

- (float)encodingAtIndex:(unint64_t)a3
{
  p_encodings = &self->_encodings;
  unint64_t count = self->_encodings.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_encodings->list[a3];
}

- (void)addEncoding:(float)a3
{
}

- (void)clearEncodings
{
}

- (float)encodings
{
  return self->_encodings.list;
}

- (unint64_t)encodingsCount
{
  return self->_encodings.count;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (BOOL)hasSsuEncoderVersion
{
  return self->_ssuEncoderVersion != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)dealloc
{
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUINTERNALSSUSSUEncodingResult;
  [(SIRINLUINTERNALSSUSSUEncodingResult *)&v3 dealloc];
}

@end