@interface _MRSendHIDReportMessageProtobuf
- (BOOL)hasReport;
- (BOOL)hasVirtualDeviceID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)report;
- (NSString)virtualDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setReport:(id)a3;
- (void)setVirtualDeviceID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendHIDReportMessageProtobuf

- (BOOL)hasVirtualDeviceID
{
  return self->_virtualDeviceID != 0;
}

- (BOOL)hasReport
{
  return self->_report != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendHIDReportMessageProtobuf;
  v4 = [(_MRSendHIDReportMessageProtobuf *)&v8 description];
  v5 = [(_MRSendHIDReportMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  virtualDeviceID = self->_virtualDeviceID;
  if (virtualDeviceID) {
    [v3 setObject:virtualDeviceID forKey:@"virtualDeviceID"];
  }
  report = self->_report;
  if (report) {
    [v4 setObject:report forKey:@"report"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendHIDReportMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_virtualDeviceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_report)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_virtualDeviceID)
  {
    objc_msgSend(v4, "setVirtualDeviceID:");
    id v4 = v5;
  }
  if (self->_report)
  {
    objc_msgSend(v5, "setReport:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_virtualDeviceID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_report copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((virtualDeviceID = self->_virtualDeviceID, !((unint64_t)virtualDeviceID | v4[2]))
     || -[NSString isEqual:](virtualDeviceID, "isEqual:")))
  {
    report = self->_report;
    if ((unint64_t)report | v4[1]) {
      char v7 = -[NSData isEqual:](report, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_virtualDeviceID hash];
  return [(NSData *)self->_report hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[_MRSendHIDReportMessageProtobuf setVirtualDeviceID:](self, "setVirtualDeviceID:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[_MRSendHIDReportMessageProtobuf setReport:](self, "setReport:");
    id v4 = v5;
  }
}

- (NSString)virtualDeviceID
{
  return self->_virtualDeviceID;
}

- (void)setVirtualDeviceID:(id)a3
{
}

- (NSData)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualDeviceID, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end