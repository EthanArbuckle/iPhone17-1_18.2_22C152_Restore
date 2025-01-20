@interface _MRAVEndpointDescriptorProtobuf
+ (Class)outputDevicesType;
+ (Class)personalOutputDevicesType;
- (BOOL)canModifyGroupMembership;
- (BOOL)hasCanModifyGroupMembership;
- (BOOL)hasConnectionType;
- (BOOL)hasDesignatedGroupLeader;
- (BOOL)hasInstanceIdentifier;
- (BOOL)hasIsLocalEndpoint;
- (BOOL)hasIsProxyGroupPlayer;
- (BOOL)hasName;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalEndpoint;
- (BOOL)isProxyGroupPlayer;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)outputDevices;
- (NSMutableArray)personalOutputDevices;
- (NSString)instanceIdentifier;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (_MRAVOutputDeviceDescriptorProtobuf)designatedGroupLeader;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputDevicesAtIndex:(unint64_t)a3;
- (id)personalOutputDevicesAtIndex:(unint64_t)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)connectionType;
- (unint64_t)hash;
- (unint64_t)outputDevicesCount;
- (unint64_t)personalOutputDevicesCount;
- (void)addOutputDevices:(id)a3;
- (void)addPersonalOutputDevices:(id)a3;
- (void)clearOutputDevices;
- (void)clearPersonalOutputDevices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCanModifyGroupMembership:(BOOL)a3;
- (void)setConnectionType:(int)a3;
- (void)setDesignatedGroupLeader:(id)a3;
- (void)setHasCanModifyGroupMembership:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasIsLocalEndpoint:(BOOL)a3;
- (void)setHasIsProxyGroupPlayer:(BOOL)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setIsLocalEndpoint:(BOOL)a3;
- (void)setIsProxyGroupPlayer:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOutputDevices:(id)a3;
- (void)setPersonalOutputDevices:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAVEndpointDescriptorProtobuf

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_personalOutputDevices, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);

  objc_storeStrong((id *)&self->_designatedGroupLeader, 0);
}

- (BOOL)readFrom:(id)a3
{
  return _MRAVEndpointDescriptorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSMutableArray)personalOutputDevices
{
  return self->_personalOutputDevices;
}

- (NSMutableArray)outputDevices
{
  return self->_outputDevices;
}

- (NSString)name
{
  return self->_name;
}

- (_MRAVOutputDeviceDescriptorProtobuf)designatedGroupLeader
{
  return self->_designatedGroupLeader;
}

- (int)connectionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_connectionType;
  }
  else {
    return 0;
  }
}

- (BOOL)canModifyGroupMembership
{
  return self->_canModifyGroupMembership;
}

- (void)addOutputDevices:(id)a3
{
  id v4 = a3;
  outputDevices = self->_outputDevices;
  id v8 = v4;
  if (!outputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_outputDevices;
    self->_outputDevices = v6;

    id v4 = v8;
    outputDevices = self->_outputDevices;
  }
  [(NSMutableArray *)outputDevices addObject:v4];
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setDesignatedGroupLeader:(id)a3
{
}

- (void)setConnectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_connectionType = a3;
}

- (void)setCanModifyGroupMembership:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_canModifyGroupMembership = a3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAVEndpointDescriptorProtobuf;
  id v4 = [(_MRAVEndpointDescriptorProtobuf *)&v8 description];
  v5 = [(_MRAVEndpointDescriptorProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_38;
    }
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_38;
    }
  }
  outputDevices = self->_outputDevices;
  if ((unint64_t)outputDevices | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](outputDevices, "isEqual:")) {
      goto LABEL_38;
    }
  }
  designatedGroupLeader = self->_designatedGroupLeader;
  if ((unint64_t)designatedGroupLeader | *((void *)v4 + 2))
  {
    if (!-[_MRAVOutputDeviceDescriptorProtobuf isEqual:](designatedGroupLeader, "isEqual:")) {
      goto LABEL_38;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0) {
      goto LABEL_38;
    }
    if (self->_isLocalEndpoint)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_38;
  }
  instanceIdentifier = self->_instanceIdentifier;
  if ((unint64_t)instanceIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](instanceIdentifier, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_isProxyGroupPlayer)
    {
      if (!*((unsigned char *)v4 + 66)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 66))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_38;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_connectionType != *((_DWORD *)v4 + 2)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_38;
  }
  if ((has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0) {
      goto LABEL_44;
    }
LABEL_38:
    char v11 = 0;
    goto LABEL_39;
  }
  if ((*((unsigned char *)v4 + 68) & 2) == 0) {
    goto LABEL_38;
  }
  if (!self->_canModifyGroupMembership)
  {
    if (!*((unsigned char *)v4 + 64)) {
      goto LABEL_44;
    }
    goto LABEL_38;
  }
  if (!*((unsigned char *)v4 + 64)) {
    goto LABEL_38;
  }
LABEL_44:
  personalOutputDevices = self->_personalOutputDevices;
  if ((unint64_t)personalOutputDevices | *((void *)v4 + 6)) {
    char v11 = -[NSMutableArray isEqual:](personalOutputDevices, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_39:

  return v11;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_uniqueIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_outputDevices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (self->_designatedGroupLeader) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_instanceIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_20:
      if ((has & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_21:
  }
    PBDataWriterWriteBOOLField();
LABEL_22:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v11 = self->_personalOutputDevices;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v4 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  if ([(NSMutableArray *)self->_outputDevices count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_outputDevices, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v8 = self->_outputDevices;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"outputDevices"];
  }
  designatedGroupLeader = self->_designatedGroupLeader;
  if (designatedGroupLeader)
  {
    v15 = [(_MRAVOutputDeviceDescriptorProtobuf *)designatedGroupLeader dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"designatedGroupLeader"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    long long v16 = [NSNumber numberWithBool:self->_isLocalEndpoint];
    [v4 setObject:v16 forKey:@"isLocalEndpoint"];
  }
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier) {
    [v4 setObject:instanceIdentifier forKey:@"instanceIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_isProxyGroupPlayer];
    [v4 setObject:v28 forKey:@"isProxyGroupPlayer"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_22:
      if ((has & 2) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_22;
  }
  uint64_t connectionType = self->_connectionType;
  if (connectionType >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_connectionType);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E57D41E0[connectionType];
  }
  [v4 setObject:v30 forKey:@"connectionType"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_23:
    long long v19 = [NSNumber numberWithBool:self->_canModifyGroupMembership];
    [v4 setObject:v19 forKey:@"canModifyGroupMembership"];
  }
LABEL_24:
  if ([(NSMutableArray *)self->_personalOutputDevices count])
  {
    long long v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_personalOutputDevices, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v21 = self->_personalOutputDevices;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v31 + 1) + 8 * j) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"personalOutputDevices"];
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (void)clearOutputDevices
{
}

- (unint64_t)outputDevicesCount
{
  return [(NSMutableArray *)self->_outputDevices count];
}

- (id)outputDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_outputDevices objectAtIndex:a3];
}

+ (Class)outputDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDesignatedGroupLeader
{
  return self->_designatedGroupLeader != 0;
}

- (void)setIsLocalEndpoint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isLocalEndpoint = a3;
}

- (void)setHasIsLocalEndpoint:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsLocalEndpoint
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasInstanceIdentifier
{
  return self->_instanceIdentifier != 0;
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isProxyGroupPlayer = a3;
}

- (void)setHasIsProxyGroupPlayer:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsProxyGroupPlayer
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasConnectionType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57D41E0[a3];
  }

  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Local"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Direct"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Relay"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AirPlaySender"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RemoteHosted"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LocalHosted"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setHasCanModifyGroupMembership:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCanModifyGroupMembership
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearPersonalOutputDevices
{
}

- (void)addPersonalOutputDevices:(id)a3
{
  id v4 = a3;
  personalOutputDevices = self->_personalOutputDevices;
  id v8 = v4;
  if (!personalOutputDevices)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_personalOutputDevices;
    self->_personalOutputDevices = v6;

    id v4 = v8;
    personalOutputDevices = self->_personalOutputDevices;
  }
  [(NSMutableArray *)personalOutputDevices addObject:v4];
}

- (unint64_t)personalOutputDevicesCount
{
  return [(NSMutableArray *)self->_personalOutputDevices count];
}

- (id)personalOutputDevicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_personalOutputDevices objectAtIndex:a3];
}

+ (Class)personalOutputDevicesType
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uint64_t v14 = a3;
  if (self->_name) {
    objc_msgSend(v14, "setName:");
  }
  if (self->_uniqueIdentifier) {
    objc_msgSend(v14, "setUniqueIdentifier:");
  }
  if ([(_MRAVEndpointDescriptorProtobuf *)self outputDevicesCount])
  {
    [v14 clearOutputDevices];
    unint64_t v4 = [(_MRAVEndpointDescriptorProtobuf *)self outputDevicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRAVEndpointDescriptorProtobuf *)self outputDevicesAtIndex:i];
        [v14 addOutputDevices:v7];
      }
    }
  }
  if (self->_designatedGroupLeader) {
    objc_msgSend(v14, "setDesignatedGroupLeader:");
  }
  id v8 = v14;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v14[65] = self->_isLocalEndpoint;
    v14[68] |= 4u;
  }
  if (self->_instanceIdentifier)
  {
    objc_msgSend(v14, "setInstanceIdentifier:");
    id v8 = v14;
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_17;
    }
LABEL_27:
    *((_DWORD *)v8 + 2) = self->_connectionType;
    v8[68] |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v8[66] = self->_isProxyGroupPlayer;
  v8[68] |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_27;
  }
LABEL_17:
  if ((has & 2) != 0)
  {
LABEL_18:
    v8[64] = self->_canModifyGroupMembership;
    v8[68] |= 2u;
  }
LABEL_19:
  if ([(_MRAVEndpointDescriptorProtobuf *)self personalOutputDevicesCount])
  {
    [v14 clearPersonalOutputDevices];
    unint64_t v10 = [(_MRAVEndpointDescriptorProtobuf *)self personalOutputDevicesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(_MRAVEndpointDescriptorProtobuf *)self personalOutputDevicesAtIndex:j];
        [v14 addPersonalOutputDevices:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v10 = self->_outputDevices;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addOutputDevices:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  id v16 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_designatedGroupLeader copyWithZone:a3];
  long long v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 65) = self->_isLocalEndpoint;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  uint64_t v18 = [(NSString *)self->_instanceIdentifier copyWithZone:a3];
  long long v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 66) = self->_isProxyGroupPlayer;
    *(unsigned char *)(v5 + 68) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_12:
      if ((has & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v5 + 8) = self->_connectionType;
  *(unsigned char *)(v5 + 68) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_13:
    *(unsigned char *)(v5 + 64) = self->_canModifyGroupMembership;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
LABEL_14:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v21 = self->_personalOutputDevices;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (void)v28);
        [(id)v5 addPersonalOutputDevices:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v23);
  }

  return (id)v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_uniqueIdentifier hash];
  uint64_t v5 = [(NSMutableArray *)self->_outputDevices hash];
  unint64_t v6 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_designatedGroupLeader hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_isLocalEndpoint;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_instanceIdentifier hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_personalOutputDevices hash];
  }
  uint64_t v9 = 2654435761 * self->_isProxyGroupPlayer;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v10 = 2654435761 * self->_connectionType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v11 = 2654435761 * self->_canModifyGroupMembership;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_personalOutputDevices hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[_MRAVEndpointDescriptorProtobuf setName:](self, "setName:");
  }
  if (*((void *)v4 + 7)) {
    -[_MRAVEndpointDescriptorProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_MRAVEndpointDescriptorProtobuf *)self addOutputDevices:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  designatedGroupLeader = self->_designatedGroupLeader;
  uint64_t v11 = *((void *)v4 + 2);
  if (designatedGroupLeader)
  {
    if (v11) {
      -[_MRAVOutputDeviceDescriptorProtobuf mergeFrom:](designatedGroupLeader, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[_MRAVEndpointDescriptorProtobuf setDesignatedGroupLeader:](self, "setDesignatedGroupLeader:");
  }
  if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    self->_isLocalEndpoint = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 3)) {
    -[_MRAVEndpointDescriptorProtobuf setInstanceIdentifier:](self, "setInstanceIdentifier:");
  }
  char v12 = *((unsigned char *)v4 + 68);
  if ((v12 & 8) != 0)
  {
    self->_isProxyGroupPlayer = *((unsigned char *)v4 + 66);
    *(unsigned char *)&self->_has |= 8u;
    char v12 = *((unsigned char *)v4 + 68);
    if ((v12 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_uint64_t connectionType = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_24:
    self->_canModifyGroupMembership = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_25:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v4 + 6);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[_MRAVEndpointDescriptorProtobuf addPersonalOutputDevices:](self, "addPersonalOutputDevices:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)setOutputDevices:(id)a3
{
}

- (BOOL)isLocalEndpoint
{
  return self->_isLocalEndpoint;
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (void)setPersonalOutputDevices:(id)a3
{
}

@end