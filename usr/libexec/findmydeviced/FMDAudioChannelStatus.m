@interface FMDAudioChannelStatus
+ (BOOL)supportsSecureCoding;
- (FMDAudioChannelStatus)initWithCoder:(id)a3;
- (FMDAudioChannelStatus)initWithConfiguration:(id)a3;
- (FMDAudioChannelStatus)initWithDictionary:(id)a3;
- (FMDAudioChannelStatus)initWithName:(id)a3 active:(BOOL)a4;
- (NSDictionary)dictionaryValue;
- (NSNumber)muted;
- (NSNumber)playingSound;
- (NSString)address;
- (NSString)channelName;
- (NSString)description;
- (unint64_t)audioState;
- (unint64_t)availability;
- (unint64_t)inCase;
- (unint64_t)inEar;
- (unint64_t)lidClosed;
- (unint64_t)onHeadStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAudioState:(unint64_t)a3;
- (void)setAvailability:(unint64_t)a3;
- (void)setChannelName:(id)a3;
- (void)setInCase:(unint64_t)a3;
- (void)setInEar:(unint64_t)a3;
- (void)setLidClosed:(unint64_t)a3;
- (void)setOnHeadStatus:(unint64_t)a3;
- (void)setPlayingSound:(id)a3;
@end

@implementation FMDAudioChannelStatus

- (FMDAudioChannelStatus)initWithName:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAudioChannelStatus;
  v7 = [(FMDBLEBeacon *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(FMDAudioChannelStatus *)v7 setInEar:0];
    [(FMDAudioChannelStatus *)v8 setOnHeadStatus:0];
    [(FMDAudioChannelStatus *)v8 setInCase:0];
    [(FMDAudioChannelStatus *)v8 setLidClosed:0];
    [(FMDAudioChannelStatus *)v8 setChannelName:v6];
    [(FMDBLEBeacon *)v8 setActive:v4];
    [(FMDAudioChannelStatus *)v8 setAvailability:0];
    [(FMDAudioChannelStatus *)v8 setAudioState:0];
  }

  return v8;
}

- (FMDAudioChannelStatus)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDAudioChannelStatus;
  v5 = [(FMDBLEBeacon *)&v8 initWithConfiguration:v4];
  if (v5)
  {
    id v6 = [v4 name];
    [(FMDAudioChannelStatus *)v5 setChannelName:v6];

    -[FMDAudioChannelStatus setInEar:](v5, "setInEar:", [v4 inEarStatus]);
    -[FMDAudioChannelStatus setOnHeadStatus:](v5, "setOnHeadStatus:", [v4 onHeadStatus]);
    -[FMDAudioChannelStatus setInCase:](v5, "setInCase:", [v4 inCaseStatus]);
    -[FMDAudioChannelStatus setLidClosed:](v5, "setLidClosed:", [v4 lidClosedStatus]);
    -[FMDAudioChannelStatus setAvailability:](v5, "setAvailability:", [v4 availability]);
    -[FMDAudioChannelStatus setAudioState:](v5, "setAudioState:", [v4 audioStateStatus]);
  }

  return v5;
}

- (FMDAudioChannelStatus)initWithDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMDAudioChannelStatus;
  return [(FMDBLEBeacon *)&v4 init];
}

- (FMDAudioChannelStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAudioChannelStatus;
  v5 = [(FMDBLEBeacon *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("channelName");
    objc_super v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDAudioChannelStatus *)v5 setChannelName:v8];
  }
  return v5;
}

- (unint64_t)availability
{
  if ([(FMDBLEBeacon *)self active]) {
    return self->_availability;
  }
  else {
    return 0;
  }
}

- (NSNumber)playingSound
{
  playingSound = self->_playingSound;
  if (playingSound
    && [(NSNumber *)playingSound BOOLValue]
    && (id)[(FMDAudioChannelStatus *)self availability] == (id)1)
  {
    id v4 = self->_playingSound;
  }
  else
  {
    id v4 = (NSNumber *)&__kCFBooleanFalse;
  }

  return v4;
}

- (NSNumber)muted
{
  playingSound = self->_playingSound;
  if (playingSound)
  {
    v3 = +[NSNumber numberWithBool:[(NSNumber *)playingSound BOOLValue] ^ 1];
  }
  else
  {
    v3 = &__kCFBooleanFalse;
  }

  return (NSNumber *)v3;
}

- (NSDictionary)dictionaryValue
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDAudioChannelStatus *)self playingSound];
  [v3 fm_safelySetObject:v4 forKey:@"playing"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self availability]];
  [v3 fm_safelySetObject:v5 forKey:@"available"];

  uint64_t v6 = [(FMDAudioChannelStatus *)self channelName];
  [v3 fm_safelySetObject:v6 forKey:@"name"];

  v7 = [(FMDAudioChannelStatus *)self muted];
  [v3 fm_safeSetObject:v7 forKey:@"muted"];

  objc_super v8 = +[FMSystemInfo sharedInstance];
  if ([v8 isInternalBuild])
  {
    unsigned int v9 = +[FMPreferencesUtil BOOLForKey:@"DebugBeaconInfo" inDomain:kFMDNotBackedUpPrefDomain];

    if (!v9) {
      goto LABEL_5;
    }
    objc_super v10 = +[NSNumber numberWithBool:[(FMDBLEBeacon *)self primary]];
    [v3 fm_safelySetObject:v10 forKey:@"primary"];

    v11 = +[NSNumber numberWithBool:[(FMDBLEBeacon *)self utpConnected]];
    [v3 fm_safelySetObject:v11 forKey:@"utpConnected"];

    v12 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self inEar]];
    [v3 fm_safelySetObject:v12 forKey:@"In Ear"];

    v13 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self onHeadStatus]];
    [v3 fm_safelySetObject:v13 forKey:@"On Head"];

    v14 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self inCase]];
    [v3 fm_safelySetObject:v14 forKey:@"In Case"];

    objc_super v8 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self lidClosed]];
    [v3 fm_safelySetObject:v8 forKey:@"Lid Closed"];
  }

LABEL_5:

  return (NSDictionary *)v3;
}

- (NSString)description
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithBool:[(FMDBLEBeacon *)self primary]];
  [v3 fm_safelySetObject:v4 forKey:@"primary"];

  v5 = +[NSNumber numberWithBool:[(FMDBLEBeacon *)self utpConnected]];
  [v3 fm_safelySetObject:v5 forKey:@"utpConnected"];

  uint64_t v6 = [(FMDAudioChannelStatus *)self playingSound];
  [v3 fm_safelySetObject:v6 forKey:@"playing"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self availability]];
  [v3 fm_safelySetObject:v7 forKey:@"available"];

  objc_super v8 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self inEar]];
  [v3 fm_safelySetObject:v8 forKey:@"In Ear"];

  unsigned int v9 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self onHeadStatus]];
  [v3 fm_safelySetObject:v9 forKey:@"On Head"];

  objc_super v10 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self inCase]];
  [v3 fm_safelySetObject:v10 forKey:@"In Case"];

  v11 = +[NSNumber numberWithUnsignedInteger:[(FMDAudioChannelStatus *)self lidClosed]];
  [v3 fm_safelySetObject:v11 forKey:@"Lid Closed"];

  v12 = [(FMDAudioChannelStatus *)self channelName];
  [v3 fm_safelySetObject:v12 forKey:@"name"];

  v13 = [v3 description];

  return (NSString *)v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(FMDAudioChannelStatus *)self channelName];
  v5 = NSStringFromSelector("channelName");
  [v4 encodeObject:v6 forKey:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)channelName
{
  return self->_channelName;
}

- (void)setChannelName:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (unint64_t)inEar
{
  return self->_inEar;
}

- (void)setInEar:(unint64_t)a3
{
  self->_inEar = a3;
}

- (unint64_t)onHeadStatus
{
  return self->_onHeadStatus;
}

- (void)setOnHeadStatus:(unint64_t)a3
{
  self->_onHeadStatus = a3;
}

- (unint64_t)inCase
{
  return self->_inCase;
}

- (void)setInCase:(unint64_t)a3
{
  self->_inCase = a3;
}

- (unint64_t)lidClosed
{
  return self->_lidClosed;
}

- (void)setLidClosed:(unint64_t)a3
{
  self->_lidClosed = a3;
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
}

- (unint64_t)audioState
{
  return self->_audioState;
}

- (void)setAudioState:(unint64_t)a3
{
  self->_audioState = a3;
}

- (void)setPlayingSound:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingSound, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_channelName, 0);
}

@end