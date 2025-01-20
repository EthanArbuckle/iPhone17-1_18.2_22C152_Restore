@interface _MRGameControllerMotionProtobuf
- (BOOL)hasAttitude;
- (BOOL)hasGravity;
- (BOOL)hasRotation;
- (BOOL)hasUserAcceleration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRGameControllerAccelerationProtobuf)attitude;
- (_MRGameControllerAccelerationProtobuf)gravity;
- (_MRGameControllerAccelerationProtobuf)rotation;
- (_MRGameControllerAccelerationProtobuf)userAcceleration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttitude:(id)a3;
- (void)setGravity:(id)a3;
- (void)setRotation:(id)a3;
- (void)setUserAcceleration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGameControllerMotionProtobuf

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  gravity = self->_gravity;
  uint64_t v6 = v4[2];
  v13 = v4;
  if (gravity)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRGameControllerAccelerationProtobuf mergeFrom:](gravity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRGameControllerMotionProtobuf setGravity:](self, "setGravity:");
  }
  v4 = v13;
LABEL_7:
  userAcceleration = self->_userAcceleration;
  uint64_t v8 = v4[4];
  if (userAcceleration)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRGameControllerAccelerationProtobuf mergeFrom:](userAcceleration, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[_MRGameControllerMotionProtobuf setUserAcceleration:](self, "setUserAcceleration:");
  }
  v4 = v13;
LABEL_13:
  attitude = self->_attitude;
  uint64_t v10 = v4[1];
  if (attitude)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[_MRGameControllerAccelerationProtobuf mergeFrom:](attitude, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[_MRGameControllerMotionProtobuf setAttitude:](self, "setAttitude:");
  }
  v4 = v13;
LABEL_19:
  rotation = self->_rotation;
  uint64_t v12 = v4[3];
  if (rotation)
  {
    if (v12) {
      -[_MRGameControllerAccelerationProtobuf mergeFrom:](rotation, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[_MRGameControllerMotionProtobuf setRotation:](self, "setRotation:");
  }

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasGravity
{
  return self->_gravity != 0;
}

- (BOOL)hasUserAcceleration
{
  return self->_userAcceleration != 0;
}

- (BOOL)hasAttitude
{
  return self->_attitude != 0;
}

- (BOOL)hasRotation
{
  return self->_rotation != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGameControllerMotionProtobuf;
  v4 = [(_MRGameControllerMotionProtobuf *)&v8 description];
  v5 = [(_MRGameControllerMotionProtobuf *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  gravity = self->_gravity;
  if (gravity)
  {
    v5 = [(_MRGameControllerAccelerationProtobuf *)gravity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"gravity"];
  }
  userAcceleration = self->_userAcceleration;
  if (userAcceleration)
  {
    v7 = [(_MRGameControllerAccelerationProtobuf *)userAcceleration dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"userAcceleration"];
  }
  attitude = self->_attitude;
  if (attitude)
  {
    v9 = [(_MRGameControllerAccelerationProtobuf *)attitude dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"attitude"];
  }
  rotation = self->_rotation;
  if (rotation)
  {
    v11 = [(_MRGameControllerAccelerationProtobuf *)rotation dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"rotation"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerMotionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_gravity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userAcceleration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_attitude)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rotation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_gravity)
  {
    objc_msgSend(v4, "setGravity:");
    id v4 = v5;
  }
  if (self->_userAcceleration)
  {
    objc_msgSend(v5, "setUserAcceleration:");
    id v4 = v5;
  }
  if (self->_attitude)
  {
    objc_msgSend(v5, "setAttitude:");
    id v4 = v5;
  }
  if (self->_rotation)
  {
    objc_msgSend(v5, "setRotation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRGameControllerAccelerationProtobuf *)self->_gravity copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(_MRGameControllerAccelerationProtobuf *)self->_userAcceleration copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(_MRGameControllerAccelerationProtobuf *)self->_attitude copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(_MRGameControllerAccelerationProtobuf *)self->_rotation copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((gravity = self->_gravity, !((unint64_t)gravity | v4[2]))
     || -[_MRGameControllerAccelerationProtobuf isEqual:](gravity, "isEqual:"))
    && ((userAcceleration = self->_userAcceleration, !((unint64_t)userAcceleration | v4[4]))
     || -[_MRGameControllerAccelerationProtobuf isEqual:](userAcceleration, "isEqual:"))
    && ((attitude = self->_attitude, !((unint64_t)attitude | v4[1]))
     || -[_MRGameControllerAccelerationProtobuf isEqual:](attitude, "isEqual:")))
  {
    rotation = self->_rotation;
    if ((unint64_t)rotation | v4[3]) {
      char v9 = -[_MRGameControllerAccelerationProtobuf isEqual:](rotation, "isEqual:");
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
  unint64_t v3 = [(_MRGameControllerAccelerationProtobuf *)self->_gravity hash];
  unint64_t v4 = [(_MRGameControllerAccelerationProtobuf *)self->_userAcceleration hash] ^ v3;
  unint64_t v5 = [(_MRGameControllerAccelerationProtobuf *)self->_attitude hash];
  return v4 ^ v5 ^ [(_MRGameControllerAccelerationProtobuf *)self->_rotation hash];
}

- (_MRGameControllerAccelerationProtobuf)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
}

- (_MRGameControllerAccelerationProtobuf)userAcceleration
{
  return self->_userAcceleration;
}

- (void)setUserAcceleration:(id)a3
{
}

- (_MRGameControllerAccelerationProtobuf)attitude
{
  return self->_attitude;
}

- (void)setAttitude:(id)a3
{
}

- (_MRGameControllerAccelerationProtobuf)rotation
{
  return self->_rotation;
}

- (void)setRotation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAcceleration, 0);
  objc_storeStrong((id *)&self->_rotation, 0);
  objc_storeStrong((id *)&self->_gravity, 0);

  objc_storeStrong((id *)&self->_attitude, 0);
}

@end