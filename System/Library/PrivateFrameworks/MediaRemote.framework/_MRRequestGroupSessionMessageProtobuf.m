@interface _MRRequestGroupSessionMessageProtobuf
- (BOOL)hasDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRRequestDetailsProtobuf)details;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRequestGroupSessionMessageProtobuf

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRequestGroupSessionMessageProtobuf;
  v4 = [(_MRRequestGroupSessionMessageProtobuf *)&v8 description];
  v5 = [(_MRRequestGroupSessionMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  details = self->_details;
  if (details)
  {
    v5 = [(_MRRequestDetailsProtobuf *)details dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"details"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRequestGroupSessionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_details) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  details = self->_details;
  if (details) {
    [a3 setDetails:details];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRRequestDetailsProtobuf *)self->_details copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    details = self->_details;
    if ((unint64_t)details | v4[1]) {
      char v6 = -[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(_MRRequestDetailsProtobuf *)self->_details hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  details = self->_details;
  uint64_t v6 = v4[1];
  if (details)
  {
    if (v6) {
      -[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRRequestGroupSessionMessageProtobuf setDetails:](self, "setDetails:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end