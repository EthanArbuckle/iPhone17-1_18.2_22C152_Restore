@interface COMAPPLEPROACTIVEGMSGMSPETUploadEvent
- (BOOL)hasMetadata;
- (BOOL)hasUberEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEPETCOMMONPETMetadata)metadata;
- (COMAPPLEPROACTIVEGMSGMSUberEvent)uberEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setUberEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEPROACTIVEGMSGMSPETUploadEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uberEvent, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)setUberEvent:(id)a3
{
}

- (COMAPPLEPROACTIVEGMSGMSUberEvent)uberEvent
{
  return self->_uberEvent;
}

- (void)setMetadata:(id)a3
{
}

- (COMAPPLEPETCOMMONPETMetadata)metadata
{
  return self->_metadata;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  metadata = self->_metadata;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (metadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[COMAPPLEPETCOMMONPETMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[COMAPPLEPROACTIVEGMSGMSPETUploadEvent setMetadata:](self, "setMetadata:");
  }
  v4 = v9;
LABEL_7:
  uberEvent = self->_uberEvent;
  uint64_t v8 = v4[2];
  if (uberEvent)
  {
    if (v8) {
      -[COMAPPLEPROACTIVEGMSGMSUberEvent mergeFrom:](uberEvent, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[COMAPPLEPROACTIVEGMSGMSPETUploadEvent setUberEvent:](self, "setUberEvent:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(COMAPPLEPETCOMMONPETMetadata *)self->_metadata hash];
  return [(COMAPPLEPROACTIVEGMSGMSUberEvent *)self->_uberEvent hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((metadata = self->_metadata, !((unint64_t)metadata | v4[1]))
     || -[COMAPPLEPETCOMMONPETMetadata isEqual:](metadata, "isEqual:")))
  {
    uberEvent = self->_uberEvent;
    if ((unint64_t)uberEvent | v4[2]) {
      char v7 = -[COMAPPLEPROACTIVEGMSGMSUberEvent isEqual:](uberEvent, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(COMAPPLEPETCOMMONPETMetadata *)self->_metadata copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(COMAPPLEPROACTIVEGMSGMSUberEvent *)self->_uberEvent copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_metadata)
  {
    objc_msgSend(v4, "setMetadata:");
    id v4 = v5;
  }
  if (self->_uberEvent)
  {
    objc_msgSend(v5, "setUberEvent:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_uberEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSPETUploadEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  metadata = self->_metadata;
  if (metadata)
  {
    id v5 = [(COMAPPLEPETCOMMONPETMetadata *)metadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"metadata"];
  }
  uberEvent = self->_uberEvent;
  if (uberEvent)
  {
    char v7 = [(COMAPPLEPROACTIVEGMSGMSUberEvent *)uberEvent dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"uberEvent"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSPETUploadEvent;
  id v4 = [(COMAPPLEPROACTIVEGMSGMSPETUploadEvent *)&v8 description];
  id v5 = [(COMAPPLEPROACTIVEGMSGMSPETUploadEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUberEvent
{
  return self->_uberEvent != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

@end