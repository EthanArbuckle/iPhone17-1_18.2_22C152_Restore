@interface _MRAVModifyOutputContextRequestProtobuf
+ (Class)addingOutputDeviceUIDType;
+ (Class)clusterAwareAddingOutputDeviceUIDType;
+ (Class)clusterAwareRemovingOutputDeviceUIDType;
+ (Class)clusterAwareSettingOutputDeviceUIDType;
+ (Class)removingOutputDeviceUIDType;
+ (Class)settingOutputDeviceUIDType;
- (BOOL)hasOutputContextType;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)addingOutputDeviceUIDs;
- (NSMutableArray)clusterAwareAddingOutputDeviceUIDs;
- (NSMutableArray)clusterAwareRemovingOutputDeviceUIDs;
- (NSMutableArray)clusterAwareSettingOutputDeviceUIDs;
- (NSMutableArray)removingOutputDeviceUIDs;
- (NSMutableArray)settingOutputDeviceUIDs;
- (_MRGroupTopologyModificationRequestProtobuf)request;
- (id)addingOutputDeviceUIDAtIndex:(unint64_t)a3;
- (id)clusterAwareAddingOutputDeviceUIDAtIndex:(unint64_t)a3;
- (id)clusterAwareRemovingOutputDeviceUIDAtIndex:(unint64_t)a3;
- (id)clusterAwareSettingOutputDeviceUIDAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputContextTypeAsString:(int)a3;
- (id)removingOutputDeviceUIDAtIndex:(unint64_t)a3;
- (id)settingOutputDeviceUIDAtIndex:(unint64_t)a3;
- (int)StringAsOutputContextType:(id)a3;
- (int)outputContextType;
- (unint64_t)addingOutputDeviceUIDsCount;
- (unint64_t)clusterAwareAddingOutputDeviceUIDsCount;
- (unint64_t)clusterAwareRemovingOutputDeviceUIDsCount;
- (unint64_t)clusterAwareSettingOutputDeviceUIDsCount;
- (unint64_t)hash;
- (unint64_t)removingOutputDeviceUIDsCount;
- (unint64_t)settingOutputDeviceUIDsCount;
- (void)addAddingOutputDeviceUID:(id)a3;
- (void)addClusterAwareAddingOutputDeviceUID:(id)a3;
- (void)addClusterAwareRemovingOutputDeviceUID:(id)a3;
- (void)addClusterAwareSettingOutputDeviceUID:(id)a3;
- (void)addRemovingOutputDeviceUID:(id)a3;
- (void)addSettingOutputDeviceUID:(id)a3;
- (void)clearAddingOutputDeviceUIDs;
- (void)clearClusterAwareAddingOutputDeviceUIDs;
- (void)clearClusterAwareRemovingOutputDeviceUIDs;
- (void)clearClusterAwareSettingOutputDeviceUIDs;
- (void)clearRemovingOutputDeviceUIDs;
- (void)clearSettingOutputDeviceUIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddingOutputDeviceUIDs:(id)a3;
- (void)setClusterAwareAddingOutputDeviceUIDs:(id)a3;
- (void)setClusterAwareRemovingOutputDeviceUIDs:(id)a3;
- (void)setClusterAwareSettingOutputDeviceUIDs:(id)a3;
- (void)setHasOutputContextType:(BOOL)a3;
- (void)setOutputContextType:(int)a3;
- (void)setRemovingOutputDeviceUIDs:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSettingOutputDeviceUIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAVModifyOutputContextRequestProtobuf

- (int)outputContextType
{
  if (*(unsigned char *)&self->_has) {
    return self->_outputContextType;
  }
  else {
    return 0;
  }
}

- (void)setOutputContextType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_outputContextType = a3;
}

- (void)setHasOutputContextType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutputContextType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)outputContextTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57DA568[a3];
  }

  return v3;
}

- (int)StringAsOutputContextType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SharedAudioPresentation"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SharedSystemAudio"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SharedSystemScreen"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"iTunesAudio"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Auxiliary"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearAddingOutputDeviceUIDs
{
}

- (void)addAddingOutputDeviceUID:(id)a3
{
  id v4 = a3;
  addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  id v8 = v4;
  if (!addingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_addingOutputDeviceUIDs;
    self->_addingOutputDeviceUIDs = v6;

    id v4 = v8;
    addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  }
  [(NSMutableArray *)addingOutputDeviceUIDs addObject:v4];
}

- (unint64_t)addingOutputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_addingOutputDeviceUIDs count];
}

- (id)addingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_addingOutputDeviceUIDs objectAtIndex:a3];
}

+ (Class)addingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearRemovingOutputDeviceUIDs
{
}

- (void)addRemovingOutputDeviceUID:(id)a3
{
  id v4 = a3;
  removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  id v8 = v4;
  if (!removingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_removingOutputDeviceUIDs;
    self->_removingOutputDeviceUIDs = v6;

    id v4 = v8;
    removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  }
  [(NSMutableArray *)removingOutputDeviceUIDs addObject:v4];
}

- (unint64_t)removingOutputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_removingOutputDeviceUIDs count];
}

- (id)removingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_removingOutputDeviceUIDs objectAtIndex:a3];
}

+ (Class)removingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearSettingOutputDeviceUIDs
{
}

- (void)addSettingOutputDeviceUID:(id)a3
{
  id v4 = a3;
  settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  id v8 = v4;
  if (!settingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_settingOutputDeviceUIDs;
    self->_settingOutputDeviceUIDs = v6;

    id v4 = v8;
    settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  }
  [(NSMutableArray *)settingOutputDeviceUIDs addObject:v4];
}

- (unint64_t)settingOutputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_settingOutputDeviceUIDs count];
}

- (id)settingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_settingOutputDeviceUIDs objectAtIndex:a3];
}

+ (Class)settingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearClusterAwareAddingOutputDeviceUIDs
{
}

- (void)addClusterAwareAddingOutputDeviceUID:(id)a3
{
  id v4 = a3;
  clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  id v8 = v4;
  if (!clusterAwareAddingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clusterAwareAddingOutputDeviceUIDs;
    self->_clusterAwareAddingOutputDeviceUIDs = v6;

    id v4 = v8;
    clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  }
  [(NSMutableArray *)clusterAwareAddingOutputDeviceUIDs addObject:v4];
}

- (unint64_t)clusterAwareAddingOutputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_clusterAwareAddingOutputDeviceUIDs count];
}

- (id)clusterAwareAddingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clusterAwareAddingOutputDeviceUIDs objectAtIndex:a3];
}

+ (Class)clusterAwareAddingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearClusterAwareRemovingOutputDeviceUIDs
{
}

- (void)addClusterAwareRemovingOutputDeviceUID:(id)a3
{
  id v4 = a3;
  clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  id v8 = v4;
  if (!clusterAwareRemovingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clusterAwareRemovingOutputDeviceUIDs;
    self->_clusterAwareRemovingOutputDeviceUIDs = v6;

    id v4 = v8;
    clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  }
  [(NSMutableArray *)clusterAwareRemovingOutputDeviceUIDs addObject:v4];
}

- (unint64_t)clusterAwareRemovingOutputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_clusterAwareRemovingOutputDeviceUIDs count];
}

- (id)clusterAwareRemovingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clusterAwareRemovingOutputDeviceUIDs objectAtIndex:a3];
}

+ (Class)clusterAwareRemovingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (void)clearClusterAwareSettingOutputDeviceUIDs
{
}

- (void)addClusterAwareSettingOutputDeviceUID:(id)a3
{
  id v4 = a3;
  clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  id v8 = v4;
  if (!clusterAwareSettingOutputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clusterAwareSettingOutputDeviceUIDs;
    self->_clusterAwareSettingOutputDeviceUIDs = v6;

    id v4 = v8;
    clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  }
  [(NSMutableArray *)clusterAwareSettingOutputDeviceUIDs addObject:v4];
}

- (unint64_t)clusterAwareSettingOutputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_clusterAwareSettingOutputDeviceUIDs count];
}

- (id)clusterAwareSettingOutputDeviceUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clusterAwareSettingOutputDeviceUIDs objectAtIndex:a3];
}

+ (Class)clusterAwareSettingOutputDeviceUIDType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAVModifyOutputContextRequestProtobuf;
  id v4 = [(_MRAVModifyOutputContextRequestProtobuf *)&v8 description];
  v5 = [(_MRAVModifyOutputContextRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t outputContextType = self->_outputContextType;
    if (outputContextType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outputContextType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57DA568[outputContextType];
    }
    [v3 setObject:v5 forKey:@"outputContextType"];
  }
  addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  if (addingOutputDeviceUIDs) {
    [v3 setObject:addingOutputDeviceUIDs forKey:@"addingOutputDeviceUID"];
  }
  removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  if (removingOutputDeviceUIDs) {
    [v3 setObject:removingOutputDeviceUIDs forKey:@"removingOutputDeviceUID"];
  }
  settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  if (settingOutputDeviceUIDs) {
    [v3 setObject:settingOutputDeviceUIDs forKey:@"settingOutputDeviceUID"];
  }
  clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  if (clusterAwareAddingOutputDeviceUIDs) {
    [v3 setObject:clusterAwareAddingOutputDeviceUIDs forKey:@"clusterAwareAddingOutputDeviceUID"];
  }
  clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  if (clusterAwareRemovingOutputDeviceUIDs) {
    [v3 setObject:clusterAwareRemovingOutputDeviceUIDs forKey:@"clusterAwareRemovingOutputDeviceUID"];
  }
  clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  if (clusterAwareSettingOutputDeviceUIDs) {
    [v3 setObject:clusterAwareSettingOutputDeviceUIDs forKey:@"clusterAwareSettingOutputDeviceUID"];
  }
  request = self->_request;
  if (request)
  {
    v13 = [(_MRGroupTopologyModificationRequestProtobuf *)request dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"request"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAVModifyOutputContextRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v5 = self->_addingOutputDeviceUIDs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v7);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v10 = self->_removingOutputDeviceUIDs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v12);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v15 = self->_settingOutputDeviceUIDs;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v17);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v20 = self->_clusterAwareAddingOutputDeviceUIDs;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    }
    while (v22);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v25 = self->_clusterAwareRemovingOutputDeviceUIDs;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
    }
    while (v27);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v30 = self->_clusterAwareSettingOutputDeviceUIDs;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v32);
  }

  if (self->_request) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_outputContextType;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  id v29 = v4;
  if ([(_MRAVModifyOutputContextRequestProtobuf *)self addingOutputDeviceUIDsCount])
  {
    [v29 clearAddingOutputDeviceUIDs];
    unint64_t v5 = [(_MRAVModifyOutputContextRequestProtobuf *)self addingOutputDeviceUIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_MRAVModifyOutputContextRequestProtobuf *)self addingOutputDeviceUIDAtIndex:i];
        [v29 addAddingOutputDeviceUID:v8];
      }
    }
  }
  if ([(_MRAVModifyOutputContextRequestProtobuf *)self removingOutputDeviceUIDsCount])
  {
    [v29 clearRemovingOutputDeviceUIDs];
    unint64_t v9 = [(_MRAVModifyOutputContextRequestProtobuf *)self removingOutputDeviceUIDsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(_MRAVModifyOutputContextRequestProtobuf *)self removingOutputDeviceUIDAtIndex:j];
        [v29 addRemovingOutputDeviceUID:v12];
      }
    }
  }
  if ([(_MRAVModifyOutputContextRequestProtobuf *)self settingOutputDeviceUIDsCount])
  {
    [v29 clearSettingOutputDeviceUIDs];
    unint64_t v13 = [(_MRAVModifyOutputContextRequestProtobuf *)self settingOutputDeviceUIDsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(_MRAVModifyOutputContextRequestProtobuf *)self settingOutputDeviceUIDAtIndex:k];
        [v29 addSettingOutputDeviceUID:v16];
      }
    }
  }
  if ([(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareAddingOutputDeviceUIDsCount])
  {
    [v29 clearClusterAwareAddingOutputDeviceUIDs];
    unint64_t v17 = [(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareAddingOutputDeviceUIDsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareAddingOutputDeviceUIDAtIndex:m];
        [v29 addClusterAwareAddingOutputDeviceUID:v20];
      }
    }
  }
  if ([(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareRemovingOutputDeviceUIDsCount])
  {
    [v29 clearClusterAwareRemovingOutputDeviceUIDs];
    unint64_t v21 = [(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareRemovingOutputDeviceUIDsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareRemovingOutputDeviceUIDAtIndex:n];
        [v29 addClusterAwareRemovingOutputDeviceUID:v24];
      }
    }
  }
  if ([(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareSettingOutputDeviceUIDsCount])
  {
    [v29 clearClusterAwareSettingOutputDeviceUIDs];
    unint64_t v25 = [(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareSettingOutputDeviceUIDsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(_MRAVModifyOutputContextRequestProtobuf *)self clusterAwareSettingOutputDeviceUIDAtIndex:ii];
        [v29 addClusterAwareSettingOutputDeviceUID:v28];
      }
    }
  }
  if (self->_request) {
    objc_msgSend(v29, "setRequest:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_outputContextType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v7 = self->_addingOutputDeviceUIDs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v67;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v67 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addAddingOutputDeviceUID:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v9);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  unint64_t v13 = self->_removingOutputDeviceUIDs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v63;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v63 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addRemovingOutputDeviceUID:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v15);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v19 = self->_settingOutputDeviceUIDs;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v59;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v59 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addSettingOutputDeviceUID:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
    }
    while (v21);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  unint64_t v25 = self->_clusterAwareAddingOutputDeviceUIDs;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v54 objects:v72 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v55;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v55 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * v29) copyWithZone:a3];
        [v6 addClusterAwareAddingOutputDeviceUID:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v54 objects:v72 count:16];
    }
    while (v27);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v31 = self->_clusterAwareRemovingOutputDeviceUIDs;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v50 objects:v71 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v51;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v51 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * v35) copyWithZone:a3];
        [v6 addClusterAwareRemovingOutputDeviceUID:v36];

        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v50 objects:v71 count:16];
    }
    while (v33);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v37 = self->_clusterAwareSettingOutputDeviceUIDs;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v46 objects:v70 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        long long v42 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * v41), "copyWithZone:", a3, (void)v46);
        [v6 addClusterAwareSettingOutputDeviceUID:v42];

        ++v41;
      }
      while (v39 != v41);
      uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v46 objects:v70 count:16];
    }
    while (v39);
  }

  id v43 = [(_MRGroupTopologyModificationRequestProtobuf *)self->_request copyWithZone:a3];
  long long v44 = (void *)v6[7];
  v6[7] = v43;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_outputContextType != *((_DWORD *)v4 + 10)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  addingOutputDeviceUIDs = self->_addingOutputDeviceUIDs;
  if ((unint64_t)addingOutputDeviceUIDs | *((void *)v4 + 1)
    && !-[NSMutableArray isEqual:](addingOutputDeviceUIDs, "isEqual:"))
  {
    goto LABEL_21;
  }
  removingOutputDeviceUIDs = self->_removingOutputDeviceUIDs;
  if ((unint64_t)removingOutputDeviceUIDs | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](removingOutputDeviceUIDs, "isEqual:")) {
      goto LABEL_21;
    }
  }
  settingOutputDeviceUIDs = self->_settingOutputDeviceUIDs;
  if ((unint64_t)settingOutputDeviceUIDs | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](settingOutputDeviceUIDs, "isEqual:")) {
      goto LABEL_21;
    }
  }
  clusterAwareAddingOutputDeviceUIDs = self->_clusterAwareAddingOutputDeviceUIDs;
  if ((unint64_t)clusterAwareAddingOutputDeviceUIDs | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](clusterAwareAddingOutputDeviceUIDs, "isEqual:")) {
      goto LABEL_21;
    }
  }
  clusterAwareRemovingOutputDeviceUIDs = self->_clusterAwareRemovingOutputDeviceUIDs;
  if ((unint64_t)clusterAwareRemovingOutputDeviceUIDs | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](clusterAwareRemovingOutputDeviceUIDs, "isEqual:")) {
      goto LABEL_21;
    }
  }
  clusterAwareSettingOutputDeviceUIDs = self->_clusterAwareSettingOutputDeviceUIDs;
  if ((unint64_t)clusterAwareSettingOutputDeviceUIDs | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](clusterAwareSettingOutputDeviceUIDs, "isEqual:")) {
      goto LABEL_21;
    }
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 7)) {
    char v12 = -[_MRGroupTopologyModificationRequestProtobuf isEqual:](request, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_outputContextType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_addingOutputDeviceUIDs hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_removingOutputDeviceUIDs hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_settingOutputDeviceUIDs hash];
  uint64_t v7 = [(NSMutableArray *)self->_clusterAwareAddingOutputDeviceUIDs hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_clusterAwareRemovingOutputDeviceUIDs hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_clusterAwareSettingOutputDeviceUIDs hash];
  return v9 ^ [(_MRGroupTopologyModificationRequestProtobuf *)self->_request hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 72))
  {
    self->_uint64_t outputContextType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_MRAVModifyOutputContextRequestProtobuf *)self addAddingOutputDeviceUID:*(void *)(*((void *)&v58 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v8);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v11 = v5[6];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        [(_MRAVModifyOutputContextRequestProtobuf *)self addRemovingOutputDeviceUID:*(void *)(*((void *)&v54 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v13);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v16 = v5[8];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        [(_MRAVModifyOutputContextRequestProtobuf *)self addSettingOutputDeviceUID:*(void *)(*((void *)&v50 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v18);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v21 = v5[2];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v64 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v21);
        }
        [(_MRAVModifyOutputContextRequestProtobuf *)self addClusterAwareAddingOutputDeviceUID:*(void *)(*((void *)&v46 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v23);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v26 = v5[3];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v63 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        [(_MRAVModifyOutputContextRequestProtobuf *)self addClusterAwareRemovingOutputDeviceUID:*(void *)(*((void *)&v42 + 1) + 8 * n)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v63 count:16];
    }
    while (v28);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = v5[4];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v62 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        -[_MRAVModifyOutputContextRequestProtobuf addClusterAwareSettingOutputDeviceUID:](self, "addClusterAwareSettingOutputDeviceUID:", *(void *)(*((void *)&v38 + 1) + 8 * ii), (void)v38);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v33);
  }

  request = self->_request;
  id v37 = v5[7];
  if (request)
  {
    if (v37) {
      -[_MRGroupTopologyModificationRequestProtobuf mergeFrom:](request, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[_MRAVModifyOutputContextRequestProtobuf setRequest:](self, "setRequest:");
  }
}

- (NSMutableArray)addingOutputDeviceUIDs
{
  return self->_addingOutputDeviceUIDs;
}

- (void)setAddingOutputDeviceUIDs:(id)a3
{
}

- (NSMutableArray)removingOutputDeviceUIDs
{
  return self->_removingOutputDeviceUIDs;
}

- (void)setRemovingOutputDeviceUIDs:(id)a3
{
}

- (NSMutableArray)settingOutputDeviceUIDs
{
  return self->_settingOutputDeviceUIDs;
}

- (void)setSettingOutputDeviceUIDs:(id)a3
{
}

- (NSMutableArray)clusterAwareAddingOutputDeviceUIDs
{
  return self->_clusterAwareAddingOutputDeviceUIDs;
}

- (void)setClusterAwareAddingOutputDeviceUIDs:(id)a3
{
}

- (NSMutableArray)clusterAwareRemovingOutputDeviceUIDs
{
  return self->_clusterAwareRemovingOutputDeviceUIDs;
}

- (void)setClusterAwareRemovingOutputDeviceUIDs:(id)a3
{
}

- (NSMutableArray)clusterAwareSettingOutputDeviceUIDs
{
  return self->_clusterAwareSettingOutputDeviceUIDs;
}

- (void)setClusterAwareSettingOutputDeviceUIDs:(id)a3
{
}

- (_MRGroupTopologyModificationRequestProtobuf)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_removingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_clusterAwareSettingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_clusterAwareRemovingOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_clusterAwareAddingOutputDeviceUIDs, 0);

  objc_storeStrong((id *)&self->_addingOutputDeviceUIDs, 0);
}

@end