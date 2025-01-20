@interface _MRNotificationMessageProtobuf
+ (Class)notificationType;
+ (Class)playerPathType;
+ (Class)userInfoType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)notifications;
- (NSMutableArray)playerPaths;
- (NSMutableArray)userInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)notificationAtIndex:(unint64_t)a3;
- (id)playerPathAtIndex:(unint64_t)a3;
- (id)userInfoAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)notificationsCount;
- (unint64_t)playerPathsCount;
- (unint64_t)userInfosCount;
- (void)addNotification:(id)a3;
- (void)addPlayerPath:(id)a3;
- (void)addUserInfo:(id)a3;
- (void)clearNotifications;
- (void)clearPlayerPaths;
- (void)clearUserInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setPlayerPaths:(id)a3;
- (void)setUserInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRNotificationMessageProtobuf

- (void)clearNotifications
{
}

- (void)addNotification:(id)a3
{
  id v4 = a3;
  notifications = self->_notifications;
  id v8 = v4;
  if (!notifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_notifications;
    self->_notifications = v6;

    id v4 = v8;
    notifications = self->_notifications;
  }
  [(NSMutableArray *)notifications addObject:v4];
}

- (unint64_t)notificationsCount
{
  return [(NSMutableArray *)self->_notifications count];
}

- (id)notificationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_notifications objectAtIndex:a3];
}

+ (Class)notificationType
{
  return (Class)objc_opt_class();
}

- (void)clearUserInfos
{
}

- (void)addUserInfo:(id)a3
{
  id v4 = a3;
  userInfos = self->_userInfos;
  id v8 = v4;
  if (!userInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_userInfos;
    self->_userInfos = v6;

    id v4 = v8;
    userInfos = self->_userInfos;
  }
  [(NSMutableArray *)userInfos addObject:v4];
}

- (unint64_t)userInfosCount
{
  return [(NSMutableArray *)self->_userInfos count];
}

- (id)userInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userInfos objectAtIndex:a3];
}

+ (Class)userInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearPlayerPaths
{
}

- (void)addPlayerPath:(id)a3
{
  id v4 = a3;
  playerPaths = self->_playerPaths;
  id v8 = v4;
  if (!playerPaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_playerPaths;
    self->_playerPaths = v6;

    id v4 = v8;
    playerPaths = self->_playerPaths;
  }
  [(NSMutableArray *)playerPaths addObject:v4];
}

- (unint64_t)playerPathsCount
{
  return [(NSMutableArray *)self->_playerPaths count];
}

- (id)playerPathAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_playerPaths objectAtIndex:a3];
}

+ (Class)playerPathType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRNotificationMessageProtobuf;
  id v4 = [(_MRNotificationMessageProtobuf *)&v8 description];
  v5 = [(_MRNotificationMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  notifications = self->_notifications;
  if (notifications) {
    [v3 setObject:notifications forKey:@"notification"];
  }
  userInfos = self->_userInfos;
  if (userInfos) {
    [v4 setObject:userInfos forKey:@"userInfo"];
  }
  if ([(NSMutableArray *)self->_playerPaths count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_playerPaths, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_playerPaths;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"playerPath"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRNotificationMessageProtobufReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_notifications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_userInfos;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v15 = self->_playerPaths;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if ([(_MRNotificationMessageProtobuf *)self notificationsCount])
  {
    [v16 clearNotifications];
    unint64_t v4 = [(_MRNotificationMessageProtobuf *)self notificationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRNotificationMessageProtobuf *)self notificationAtIndex:i];
        [v16 addNotification:v7];
      }
    }
  }
  if ([(_MRNotificationMessageProtobuf *)self userInfosCount])
  {
    [v16 clearUserInfos];
    unint64_t v8 = [(_MRNotificationMessageProtobuf *)self userInfosCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(_MRNotificationMessageProtobuf *)self userInfoAtIndex:j];
        [v16 addUserInfo:v11];
      }
    }
  }
  if ([(_MRNotificationMessageProtobuf *)self playerPathsCount])
  {
    [v16 clearPlayerPaths];
    unint64_t v12 = [(_MRNotificationMessageProtobuf *)self playerPathsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        long long v15 = [(_MRNotificationMessageProtobuf *)self playerPathAtIndex:k];
        [v16 addPlayerPath:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_notifications;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addNotification:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v12 = self->_userInfos;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addUserInfo:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_playerPaths;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addPlayerPath:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((notifications = self->_notifications, !((unint64_t)notifications | v4[1]))
     || -[NSMutableArray isEqual:](notifications, "isEqual:"))
    && ((userInfos = self->_userInfos, !((unint64_t)userInfos | v4[3]))
     || -[NSMutableArray isEqual:](userInfos, "isEqual:")))
  {
    playerPaths = self->_playerPaths;
    if ((unint64_t)playerPaths | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](playerPaths, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_notifications hash];
  uint64_t v4 = [(NSMutableArray *)self->_userInfos hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_playerPaths hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(_MRNotificationMessageProtobuf *)self addNotification:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(_MRNotificationMessageProtobuf *)self addUserInfo:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[2];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[_MRNotificationMessageProtobuf addPlayerPath:](self, "addPlayerPath:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSMutableArray)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (NSMutableArray)userInfos
{
  return self->_userInfos;
}

- (void)setUserInfos:(id)a3
{
}

- (NSMutableArray)playerPaths
{
  return self->_playerPaths;
}

- (void)setPlayerPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfos, 0);
  objc_storeStrong((id *)&self->_playerPaths, 0);

  objc_storeStrong((id *)&self->_notifications, 0);
}

@end