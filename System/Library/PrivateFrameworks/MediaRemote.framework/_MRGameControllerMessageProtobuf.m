@interface _MRGameControllerMessageProtobuf
- (BOOL)hasButtons;
- (BOOL)hasControllerID;
- (BOOL)hasDigitizer;
- (BOOL)hasMotion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRGameControllerButtonsProtobuf)buttons;
- (_MRGameControllerDigitizerProtobuf)digitizer;
- (_MRGameControllerMotionProtobuf)motion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)controllerID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setButtons:(id)a3;
- (void)setControllerID:(unint64_t)a3;
- (void)setDigitizer:(id)a3;
- (void)setHasControllerID:(BOOL)a3;
- (void)setMotion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGameControllerMessageProtobuf

- (void)setControllerID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_controllerID = a3;
}

- (void)setHasControllerID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasControllerID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMotion
{
  return self->_motion != 0;
}

- (BOOL)hasButtons
{
  return self->_buttons != 0;
}

- (BOOL)hasDigitizer
{
  return self->_digitizer != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGameControllerMessageProtobuf;
  v4 = [(_MRGameControllerMessageProtobuf *)&v8 description];
  v5 = [(_MRGameControllerMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_controllerID];
    [v3 setObject:v4 forKey:@"controllerID"];
  }
  motion = self->_motion;
  if (motion)
  {
    v6 = [(_MRGameControllerMotionProtobuf *)motion dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"motion"];
  }
  buttons = self->_buttons;
  if (buttons)
  {
    objc_super v8 = [(_MRGameControllerButtonsProtobuf *)buttons dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"buttons"];
  }
  digitizer = self->_digitizer;
  if (digitizer)
  {
    v10 = [(_MRGameControllerDigitizerProtobuf *)digitizer dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"digitizer"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_motion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_buttons)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_digitizer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_controllerID;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_motion)
  {
    objc_msgSend(v4, "setMotion:");
    id v4 = v5;
  }
  if (self->_buttons)
  {
    objc_msgSend(v5, "setButtons:");
    id v4 = v5;
  }
  if (self->_digitizer)
  {
    objc_msgSend(v5, "setDigitizer:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_controllerID;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v7 = [(_MRGameControllerMotionProtobuf *)self->_motion copyWithZone:a3];
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(_MRGameControllerButtonsProtobuf *)self->_buttons copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(_MRGameControllerDigitizerProtobuf *)self->_digitizer copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_controllerID != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  motion = self->_motion;
  if ((unint64_t)motion | *((void *)v4 + 4)
    && !-[_MRGameControllerMotionProtobuf isEqual:](motion, "isEqual:"))
  {
    goto LABEL_13;
  }
  buttons = self->_buttons;
  if ((unint64_t)buttons | *((void *)v4 + 2))
  {
    if (!-[_MRGameControllerButtonsProtobuf isEqual:](buttons, "isEqual:")) {
      goto LABEL_13;
    }
  }
  digitizer = self->_digitizer;
  if ((unint64_t)digitizer | *((void *)v4 + 3)) {
    char v8 = -[_MRGameControllerDigitizerProtobuf isEqual:](digitizer, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_controllerID;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(_MRGameControllerMotionProtobuf *)self->_motion hash] ^ v3;
  unint64_t v5 = [(_MRGameControllerButtonsProtobuf *)self->_buttons hash];
  return v4 ^ v5 ^ [(_MRGameControllerDigitizerProtobuf *)self->_digitizer hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4[5])
  {
    self->_controllerID = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  motion = self->_motion;
  uint64_t v7 = v5[4];
  v12 = v5;
  if (motion)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_MRGameControllerMotionProtobuf mergeFrom:](motion, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_MRGameControllerMessageProtobuf setMotion:](self, "setMotion:");
  }
  unint64_t v5 = v12;
LABEL_9:
  buttons = self->_buttons;
  uint64_t v9 = v5[2];
  if (buttons)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[_MRGameControllerButtonsProtobuf mergeFrom:](buttons, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[_MRGameControllerMessageProtobuf setButtons:](self, "setButtons:");
  }
  unint64_t v5 = v12;
LABEL_15:
  digitizer = self->_digitizer;
  uint64_t v11 = v5[3];
  if (digitizer)
  {
    if (!v11) {
      goto LABEL_21;
    }
    digitizer = (_MRGameControllerDigitizerProtobuf *)-[_MRGameControllerDigitizerProtobuf mergeFrom:](digitizer, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    digitizer = (_MRGameControllerDigitizerProtobuf *)-[_MRGameControllerMessageProtobuf setDigitizer:](self, "setDigitizer:");
  }
  unint64_t v5 = v12;
LABEL_21:

  MEMORY[0x1F41817F8](digitizer, v5);
}

- (unint64_t)controllerID
{
  return self->_controllerID;
}

- (_MRGameControllerMotionProtobuf)motion
{
  return self->_motion;
}

- (void)setMotion:(id)a3
{
}

- (_MRGameControllerButtonsProtobuf)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (_MRGameControllerDigitizerProtobuf)digitizer
{
  return self->_digitizer;
}

- (void)setDigitizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_digitizer, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end