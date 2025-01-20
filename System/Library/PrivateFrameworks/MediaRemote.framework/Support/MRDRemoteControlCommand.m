@interface MRDRemoteControlCommand
- (BOOL)alwaysIgnoreDuringCall;
- (BOOL)alwaysIgnoreDuringSharePlay;
- (BOOL)isAVRCPCommand;
- (BOOL)isContextSensitive;
- (BOOL)isNavigational;
- (BOOL)nowPlayingAppStackEligible;
- (BOOL)originatedFromAccessory;
- (BOOL)originatedFromHID;
- (BOOL)shouldImplicitlyLaunchApplication;
- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 options:(id)a7;
- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 optionsData:(id)a7;
- (MRPlayerPath)playerPath;
- (MRPlayerPath)unresolvedPlayerPath;
- (NSData)optionsData;
- (NSData)protobufData;
- (NSDate)dateCreated;
- (NSString)commandID;
- (NSString)contextID;
- (NSString)destinationAppDisplayID;
- (NSString)remoteControlInterfaceID;
- (NSString)routeUID;
- (NSString)senderAppDisplayID;
- (NSString)senderID;
- (id)_completionHandler;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)_optionsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)optionValueForKey:(__CFString *)a3;
- (int)destinationAppProcessID;
- (unsigned)appOptions;
- (unsigned)commandType;
- (void)_setCompletionHandler:(id)a3;
@end

@implementation MRDRemoteControlCommand

- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 optionsData:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)MRDRemoteControlCommand;
  v16 = [(MRDRemoteControlCommand *)&v31 init];
  v17 = v16;
  if (v16)
  {
    v16->_commandType = a3;
    v18 = (MRPlayerPath *)[v12 copy];
    playerPath = v17->_playerPath;
    v17->_playerPath = v18;

    v20 = (MRPlayerPath *)[v13 copy];
    unresolvedPlayerPath = v17->_unresolvedPlayerPath;
    v17->_unresolvedPlayerPath = v20;

    v22 = (NSString *)[v14 copy];
    senderAppDisplayID = v17->_senderAppDisplayID;
    v17->_senderAppDisplayID = v22;

    v24 = (NSData *)[v15 copy];
    optionsData = v17->_optionsData;
    v17->_optionsData = v24;

    v26 = [(MRDRemoteControlCommand *)v17 optionValueForKey:kMRMediaRemoteOptionSendOptionsNumber];
    v17->_appOptions = [v26 intValue];

    v27 = (NSDate *)objc_alloc_init((Class)NSDate);
    dateCreated = v17->_dateCreated;
    v17->_dateCreated = v27;

    parsedOptionsDict = v17->_parsedOptionsDict;
    v17->_parsedOptionsDict = 0;
  }
  return v17;
}

- (MRDRemoteControlCommand)initWithCommandType:(unsigned int)a3 playerPath:(id)a4 unresolvedPlayerPath:(id)a5 senderAppDisplayID:(id)a6 options:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = [(MRDRemoteControlCommand *)self initWithCommandType:v10 playerPath:a4 unresolvedPlayerPath:a5 senderAppDisplayID:a6 optionsData:0];
  if (v13)
  {
    id v14 = (NSMutableDictionary *)[v12 mutableCopy];
    parsedOptionsDict = v13->_parsedOptionsDict;
    v13->_parsedOptionsDict = v14;
  }
  return v13;
}

- (id)description
{
  v3 = (void *)MRMediaRemoteCopyCommandDescription();
  uint64_t v4 = objc_opt_class();
  v5 = [(MRDRemoteControlCommand *)self senderID];
  v6 = [(MRDRemoteControlCommand *)self commandID];
  v7 = [(MRDRemoteControlCommand *)self remoteControlInterfaceID];
  v8 = +[NSString stringWithFormat:@"<%@ %p, command = %@, %@\n, commandID = %@\n, remote control interface = %@\n, appOptions = %ld\n, path = %@\n, unresolvedPath = %@\n>", v4, self, v3, v5, v6, v7, [(MRDRemoteControlCommand *)self appOptions], self->_playerPath, self->_unresolvedPlayerPath];

  return v8;
}

- (id)debugDescription
{
  v3 = (void *)MRMediaRemoteCopyCommandDescription();
  uint64_t v4 = objc_opt_class();
  v5 = [(MRDRemoteControlCommand *)self senderID];
  v6 = [(MRDRemoteControlCommand *)self commandID];
  v7 = [(MRDRemoteControlCommand *)self remoteControlInterfaceID];
  uint64_t v8 = [(MRDRemoteControlCommand *)self appOptions];
  playerPath = self->_playerPath;
  unresolvedPlayerPath = self->_unresolvedPlayerPath;
  v11 = [(MRDRemoteControlCommand *)self _optionsDictionary];
  id v12 = +[NSString stringWithFormat:@"<%@ %p, command = %@, %@\n, commandID = %@\n, remote control interface = %@\n, appOptions = %ld\n, path = %@\n, unresolvedPath = %@\n, options = %@\n>", v4, self, v3, v5, v6, v7, v8, playerPath, unresolvedPlayerPath, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MRDRemoteControlCommand *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MRDRemoteControlCommand *)self _copyWithZone:a3 usingConcreteClass:v5];
}

- (NSData)protobufData
{
  cachedProtobufData = self->_cachedProtobufData;
  if (!cachedProtobufData)
  {
    uint64_t v4 = [(MRPlayerPath *)self->_playerPath origin];
    id v5 = objc_alloc_init((Class)_MRReceivedCommandProtobuf);
    [v5 setCommand:MRMediaRemoteCommandToProtobuf()];
    v6 = [(MRDRemoteControlCommand *)self _optionsDictionary];
    v7 = MRMediaRemoteCommandOptionsToProtobuf();
    [v5 setOptions:v7];

    if (v4) {
      id v8 = [v4 identifier];
    }
    else {
      id v8 = 0;
    }
    [v5 setOriginUID:v8];
    [v5 setSenderAppDisplayID:self->_senderAppDisplayID];
    v9 = [(MRDRemoteControlCommand *)self destinationAppDisplayID];
    [v5 setDestinationAppDisplayID:v9];

    objc_msgSend(v5, "setDestinationAppProcessID:", -[MRDRemoteControlCommand destinationAppProcessID](self, "destinationAppProcessID"));
    uint64_t v10 = [(MRDRemoteControlCommand *)self remoteControlInterfaceID];
    [v5 setRemoteControlInterfaceID:v10];

    v11 = MRProtobufFromSendCommandAppOptions();
    [v5 setAppOptions:v11];

    id v12 = [(MRPlayerPath *)self->_playerPath protobuf];
    [v5 setPlayerPath:v12];

    id v13 = [v5 data];
    id v14 = self->_cachedProtobufData;
    self->_cachedProtobufData = v13;

    cachedProtobufData = self->_cachedProtobufData;
  }

  return cachedProtobufData;
}

- (int)destinationAppProcessID
{
  v2 = [(MRPlayerPath *)self->_playerPath client];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (NSString)destinationAppDisplayID
{
  v2 = [(MRPlayerPath *)self->_playerPath client];
  int v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)routeUID
{
  return (NSString *)[(MRDRemoteControlCommand *)self optionValueForKey:kMRMediaRemoteOptionSourceID];
}

- (NSString)contextID
{
  return (NSString *)[(MRDRemoteControlCommand *)self optionValueForKey:kMRMediaRemoteOptionContextID];
}

- (BOOL)isNavigational
{
  return MRMediaRemoteCommandIsNavigational() != 0;
}

- (NSData)optionsData
{
  parsedOptionsDict = self->_parsedOptionsDict;
  if (parsedOptionsDict)
  {
    uint64_t v4 = +[NSPropertyListSerialization dataWithPropertyList:parsedOptionsDict format:200 options:0 error:0];
    optionsData = self->_optionsData;
    self->_optionsData = v4;
  }
  v6 = self->_optionsData;

  return v6;
}

- (NSString)remoteControlInterfaceID
{
  return (NSString *)[(MRDRemoteControlCommand *)self optionValueForKey:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier];
}

- (NSString)commandID
{
  return (NSString *)[(MRDRemoteControlCommand *)self optionValueForKey:kMRMediaRemoteOptionCommandID];
}

- (NSString)senderID
{
  return (NSString *)[(MRDRemoteControlCommand *)self optionValueForKey:kMRMediaRemoteOptionSenderID];
}

- (BOOL)alwaysIgnoreDuringCall
{
  v2 = [(MRDRemoteControlCommand *)self optionValueForKey:kMRMediaRemoteOptionAlwaysIgnoreDuringCall];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)alwaysIgnoreDuringSharePlay
{
  v2 = [(MRDRemoteControlCommand *)self optionValueForKey:kMRMediaRemoteOptionAlwaysIgnoreDuringSharePlay];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isContextSensitive
{
  unsigned int commandType = self->_commandType;
  BOOL v3 = commandType == 125;
  if (commandType == 122) {
    BOOL v3 = 1;
  }
  BOOL v4 = commandType > 0x1A;
  int v5 = (1 << commandType) & 0x6000001;
  return !v4 && v5 != 0 || v3;
}

- (BOOL)shouldImplicitlyLaunchApplication
{
  unsigned int commandType = self->_commandType;
  BOOL result = 1;
  if ((commandType - 122 > 0x10 || ((1 << (commandType - 122)) & 0x1C809) == 0) && commandType != 0 && commandType != 2) {
    return 0;
  }
  return result;
}

- (BOOL)originatedFromAccessory
{
  BOOL v3 = +[NSSet setWithObjects:@"com.apple.iapd", @"com.apple.iap2d", @"com.apple.BTAvrcp", 0];
  LOBYTE(self) = [v3 containsObject:self->_senderAppDisplayID];

  return (char)self;
}

- (BOOL)originatedFromHID
{
  BOOL v3 = +[NSSet setWithObjects:@"com.apple.rcd", @"rcd", 0];
  LOBYTE(self) = [v3 containsObject:self->_senderAppDisplayID];

  return (char)self;
}

- (BOOL)isAVRCPCommand
{
  v2 = [(MRDRemoteControlCommand *)self remoteControlInterfaceID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.AVRCP"];

  return v3;
}

- (id)optionValueForKey:(__CFString *)a3
{
  BOOL v4 = [(MRDRemoteControlCommand *)self _optionsDictionary];
  int v5 = [v4 objectForKey:a3];

  return v5;
}

- (BOOL)nowPlayingAppStackEligible
{
  unsigned __int8 v3 = +[MRUserSettings currentSettings];
  unsigned __int8 v4 = [v3 supportMultiplayerHost];

  if ((v4 & 1) == 0)
  {
    int v5 = +[MRUserSettings currentSettings];
    unsigned __int8 v6 = [v5 computeNowPlayingApplication];

    if ((v6 & 1) == 0)
    {
      v7 = +[MRUserSettings currentSettings];
      [v7 nowPlayingAppStackFailedPlayInterval];
      double v9 = v8;

      if (v9 > 0.0)
      {
        uint64_t v10 = [(MRDRemoteControlCommand *)self playerPath];
        v11 = [v10 origin];
        unsigned int v12 = [v11 isLocal];

        if (v12)
        {
          if ([(MRDRemoteControlCommand *)self commandType] == 2)
          {
            id v13 = +[MRDMediaRemoteServer server];
            id v14 = [v13 nowPlayingServer];
            id v15 = [(MRDRemoteControlCommand *)self playerPath];
            v16 = [v14 queryExistingPlayerPath:v15];
            v17 = [v16 playerClient];
            unsigned __int8 v18 = [v17 isPlaying];

            if ((v18 & 1) == 0) {
              return 1;
            }
          }
          else if (![(MRDRemoteControlCommand *)self commandType])
          {
            return 1;
          }
        }
      }
    }
  }
  return 0;
}

- (id)_completionHandler
{
  id v2 = objc_retainBlock(self->_completionHandler);

  return v2;
}

- (void)_setCompletionHandler:(id)a3
{
  id v4 = [a3 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v4;

  _objc_release_x1(v4, completionHandler);
}

- (id)_optionsDictionary
{
  parsedOptionsDict = self->_parsedOptionsDict;
  if (!parsedOptionsDict)
  {
    optionsData = self->_optionsData;
    if (optionsData)
    {
      int v5 = +[NSPropertyListSerialization propertyListWithData:optionsData options:0 format:0 error:0];
    }
    else
    {
      int v5 = &__NSDictionary0__struct;
    }
    unsigned __int8 v6 = (NSMutableDictionary *)[v5 mutableCopy];
    v7 = self->_parsedOptionsDict;
    self->_parsedOptionsDict = v6;

    parsedOptionsDict = self->_parsedOptionsDict;
  }

  return parsedOptionsDict;
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  int v5 = [(objc_class *)a4 allocWithZone:a3];
  uint64_t commandType = self->_commandType;
  playerPath = self->_playerPath;
  unresolvedPlayerPath = self->_unresolvedPlayerPath;
  senderAppDisplayID = self->_senderAppDisplayID;
  uint64_t v10 = [(MRDRemoteControlCommand *)self optionsData];
  v11 = [(objc_class *)v5 initWithCommandType:commandType playerPath:playerPath unresolvedPlayerPath:unresolvedPlayerPath senderAppDisplayID:senderAppDisplayID optionsData:v10];

  *((_DWORD *)v11 + 14) = self->_appOptions;
  id v12 = [self->_completionHandler copy];
  id v13 = v11[8];
  v11[8] = v12;

  objc_storeStrong(v11 + 5, self->_dateCreated);
  return v11;
}

- (unsigned)commandType
{
  return self->_commandType;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (MRPlayerPath)unresolvedPlayerPath
{
  return self->_unresolvedPlayerPath;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)senderAppDisplayID
{
  return self->_senderAppDisplayID;
}

- (unsigned)appOptions
{
  return self->_appOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedProtobufData, 0);
  objc_storeStrong((id *)&self->_parsedOptionsDict, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_senderAppDisplayID, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_unresolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_optionsData, 0);
}

@end