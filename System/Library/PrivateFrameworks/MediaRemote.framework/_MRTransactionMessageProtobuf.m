@interface _MRTransactionMessageProtobuf
- (BOOL)hasName;
- (BOOL)hasPackets;
- (BOOL)hasPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRTransactionPacketsProtobuf)packets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)name;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasName:(BOOL)a3;
- (void)setName:(unint64_t)a3;
- (void)setPackets:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRTransactionMessageProtobuf

- (void)setName:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_name = a3;
}

- (void)setHasName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasName
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPackets
{
  return self->_packets != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRTransactionMessageProtobuf;
  v4 = [(_MRTransactionMessageProtobuf *)&v8 description];
  v5 = [(_MRTransactionMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_name];
    [v3 setObject:v4 forKey:@"name"];
  }
  packets = self->_packets;
  if (packets)
  {
    v6 = [(_MRTransactionPacketsProtobuf *)packets dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"packets"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    objc_super v8 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"playerPath"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTransactionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_packets)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playerPath)
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
    v4[1] = self->_name;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_packets)
  {
    objc_msgSend(v4, "setPackets:");
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_name;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(_MRTransactionPacketsProtobuf *)self->_packets copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_name != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((void *)v4 + 2)
    && !-[_MRTransactionPacketsProtobuf isEqual:](packets, "isEqual:"))
  {
    goto LABEL_11;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 3)) {
    char v7 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_name;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(_MRTransactionPacketsProtobuf *)self->_packets hash] ^ v3;
  return v4 ^ [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[4])
  {
    self->_name = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  packets = self->_packets;
  uint64_t v7 = v5[2];
  v10 = v5;
  if (packets)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_MRTransactionPacketsProtobuf mergeFrom:](packets, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[_MRTransactionMessageProtobuf setPackets:](self, "setPackets:");
  }
  uint64_t v5 = v10;
LABEL_9:
  playerPath = self->_playerPath;
  uint64_t v9 = v5[3];
  if (playerPath)
  {
    if (v9) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[_MRTransactionMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)name
{
  return self->_name;
}

- (_MRTransactionPacketsProtobuf)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_packets, 0);
}

@end