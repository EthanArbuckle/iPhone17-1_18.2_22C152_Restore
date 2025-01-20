@interface CSDMessagingConversationReport
- (BOOL)hasConversationID;
- (BOOL)hasPaddingForHashedValue;
- (BOOL)hasTimebase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationReport)initWithTUConversationReport:(id)a3;
- (NSString)conversationID;
- (NSString)paddingForHashedValue;
- (TUConversationReport)tuConversationReport;
- (double)timebase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setHasTimebase:(BOOL)a3;
- (void)setPaddingForHashedValue:(id)a3;
- (void)setTimebase:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationReport

- (CSDMessagingConversationReport)initWithTUConversationReport:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSDMessagingConversationReport;
  v5 = [(CSDMessagingConversationReport *)&v12 init];
  if (v5)
  {
    v6 = [v4 conversationID];
    v7 = [v6 UUIDString];
    [(CSDMessagingConversationReport *)v5 setConversationID:v7];

    v8 = [v4 paddingForHashedValue];
    v9 = [v8 UUIDString];
    [(CSDMessagingConversationReport *)v5 setPaddingForHashedValue:v9];

    v10 = [v4 timebase];
    [v10 timeIntervalSinceReferenceDate];
    -[CSDMessagingConversationReport setTimebase:](v5, "setTimebase:");
  }
  return v5;
}

- (TUConversationReport)tuConversationReport
{
  if ([(CSDMessagingConversationReport *)self hasConversationID])
  {
    id v3 = objc_alloc((Class)NSUUID);
    id v4 = [(CSDMessagingConversationReport *)self conversationID];
    id v5 = [v3 initWithUUIDString:v4];
  }
  else
  {
    id v5 = 0;
  }
  if ([(CSDMessagingConversationReport *)self hasPaddingForHashedValue])
  {
    id v6 = objc_alloc((Class)NSUUID);
    v7 = [(CSDMessagingConversationReport *)self paddingForHashedValue];
    id v8 = [v6 initWithUUIDString:v7];
  }
  else
  {
    id v8 = 0;
  }
  v9 = +[NSDate now];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  objc_super v12 = +[NSDate now];
  [v12 timeIntervalSince1970];
  double v14 = v13;

  [(CSDMessagingConversationReport *)self timebase];
  double v16 = vabdd_f64(v11, v15);
  [(CSDMessagingConversationReport *)self timebase];
  double v18 = vabdd_f64(v14, v17);
  id v19 = objc_alloc((Class)NSDate);
  [(CSDMessagingConversationReport *)self timebase];
  if (v16 >= v18) {
    id v20 = objc_msgSend(v19, "initWithTimeIntervalSince1970:");
  }
  else {
    id v20 = objc_msgSend(v19, "initWithTimeIntervalSinceReferenceDate:");
  }
  v21 = v20;
  id v22 = [objc_alloc((Class)TUConversationReport) initWithConversationID:v5 padding:v8 timebase:v20];

  return (TUConversationReport *)v22;
}

- (BOOL)hasConversationID
{
  return self->_conversationID != 0;
}

- (void)setTimebase:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timebase = a3;
}

- (void)setHasTimebase:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimebase
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPaddingForHashedValue
{
  return self->_paddingForHashedValue != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationReport;
  id v3 = [(CSDMessagingConversationReport *)&v7 description];
  id v4 = [(CSDMessagingConversationReport *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  conversationID = self->_conversationID;
  if (conversationID) {
    [v3 setObject:conversationID forKey:@"conversationID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = +[NSNumber numberWithDouble:self->_timebase];
    [v4 setObject:v6 forKey:@"timebase"];
  }
  paddingForHashedValue = self->_paddingForHashedValue;
  if (paddingForHashedValue) {
    [v4 setObject:paddingForHashedValue forKey:@"paddingForHashedValue"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F5884((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_conversationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_paddingForHashedValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_conversationID)
  {
    objc_msgSend(v4, "setConversationID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timebase;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_paddingForHashedValue)
  {
    objc_msgSend(v5, "setPaddingForHashedValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_conversationID copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_timebase;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v8 = [(NSString *)self->_paddingForHashedValue copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  conversationID = self->_conversationID;
  if ((unint64_t)conversationID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](conversationID, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timebase != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  paddingForHashedValue = self->_paddingForHashedValue;
  if ((unint64_t)paddingForHashedValue | *((void *)v4 + 3)) {
    unsigned __int8 v7 = -[NSString isEqual:](paddingForHashedValue, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_conversationID hash];
  if (*(unsigned char *)&self->_has)
  {
    double timebase = self->_timebase;
    double v6 = -timebase;
    if (timebase >= 0.0) {
      double v6 = self->_timebase;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_paddingForHashedValue hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[CSDMessagingConversationReport setConversationID:](self, "setConversationID:");
    unint64_t v4 = v5;
  }
  if ((_BYTE)v4[4])
  {
    self->_double timebase = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[CSDMessagingConversationReport setPaddingForHashedValue:](self, "setPaddingForHashedValue:");
    unint64_t v4 = v5;
  }
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (double)timebase
{
  return self->_timebase;
}

- (NSString)paddingForHashedValue
{
  return self->_paddingForHashedValue;
}

- (void)setPaddingForHashedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingForHashedValue, 0);

  objc_storeStrong((id *)&self->_conversationID, 0);
}

@end