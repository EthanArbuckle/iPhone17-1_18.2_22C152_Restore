@interface MRDMutableRemoteControlCommand
- (NSString)destinationAppDisplayID;
- (int)destinationAppProcessID;
- (void)setAppOptions:(unsigned int)a3;
- (void)setCommandType:(unsigned int)a3;
- (void)setDateCreated:(id)a3;
- (void)setDestinationAppDisplayID:(id)a3;
- (void)setDestinationAppProcessID:(int)a3;
- (void)setOptionValue:(id)a3 forKey:(__CFString *)a4;
- (void)setOptionsData:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSenderAppDisplayID:(id)a3;
@end

@implementation MRDMutableRemoteControlCommand

- (void)setCommandType:(unsigned int)a3
{
  self->super._commandType = a3;
}

- (void)setOptionsData:(id)a3
{
  v4 = (NSData *)[a3 copy];
  optionsData = self->super._optionsData;
  self->super._optionsData = v4;

  _objc_release_x1(v4, optionsData);
}

- (void)setPlayerPath:(id)a3
{
}

- (void)setDateCreated:(id)a3
{
}

- (void)setSenderAppDisplayID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  senderAppDisplayID = self->super._senderAppDisplayID;
  self->super._senderAppDisplayID = v4;

  _objc_release_x1(v4, senderAppDisplayID);
}

- (void)setAppOptions:(unsigned int)a3
{
  self->super._appOptions = a3;
}

- (void)setDestinationAppDisplayID:(id)a3
{
  id v7 = a3;
  v4 = [(MRDRemoteControlCommand *)self playerPath];
  id v5 = [v4 client];

  if (v5)
  {
    if (v7) {
      [v5 setBundleIdentifier:v7];
    }
  }
  else
  {
    id v5 = [objc_alloc((Class)MRClient) initWithProcessIdentifier:0 bundleIdentifier:v7];
    v6 = [(MRDRemoteControlCommand *)self playerPath];
    [v6 setClient:v5];
  }
}

- (void)setDestinationAppProcessID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(MRDRemoteControlCommand *)self playerPath];
  id v8 = [v5 client];

  v6 = v8;
  if (v8)
  {
    if ((int)v3 < 1) {
      goto LABEL_6;
    }
    [v8 setProcessIdentifier:v3];
  }
  else
  {
    id v8 = [objc_alloc((Class)MRClient) initWithProcessIdentifier:v3 bundleIdentifier:0];
    id v7 = [(MRDRemoteControlCommand *)self playerPath];
    [v7 setClient:v8];
  }
  v6 = v8;
LABEL_6:
}

- (int)destinationAppProcessID
{
  v2 = [(MRDRemoteControlCommand *)self playerPath];
  uint64_t v3 = [v2 client];
  int v4 = [v3 processIdentifier];

  return v4;
}

- (NSString)destinationAppDisplayID
{
  v2 = [(MRDRemoteControlCommand *)self playerPath];
  uint64_t v3 = [v2 client];
  int v4 = [v3 bundleIdentifier];

  return (NSString *)v4;
}

- (void)setOptionValue:(id)a3 forKey:(__CFString *)a4
{
  id v6 = a3;
  id v7 = [(MRDRemoteControlCommand *)self _optionsDictionary];
  [v7 setValue:v6 forKey:a4];
}

@end