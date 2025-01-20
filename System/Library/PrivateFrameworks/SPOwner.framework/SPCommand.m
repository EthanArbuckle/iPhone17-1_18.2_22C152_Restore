@interface SPCommand
+ (BOOL)supportsSecureCoding;
+ (id)beginLeashingWithBeaconUUID:(id)a3;
+ (id)connectToBeaconUUID:(id)a3;
+ (id)disableLostModeForBeaconUUID:(id)a3;
+ (id)disableNotifyWhenFound:(id)a3;
+ (id)disconnectFromBeaconUUID:(id)a3;
+ (id)enableLostModeForBeaconUUID:(id)a3 message:(id)a4 phoneNumber:(id)a5 email:(id)a6;
+ (id)enableNotifyWhenFound:(id)a3;
+ (id)endLeashingWithBeaconUUID:(id)a3;
+ (id)locate:(id)a3;
+ (id)playSoundWithBeaconUUID:(id)a3;
+ (id)playSoundWithBeaconUUID:(id)a3 duration:(double)a4;
+ (id)playSoundWithBeaconUUID:(id)a3 withContext:(int64_t)a4;
+ (id)setObfuscatedIdentifier:(id)a3;
+ (id)startBTFindingWithBeaconUUID:(id)a3;
+ (id)startNotifyWhenFound:(id)a3;
+ (id)stopBTFindingWithBeaconUUID:(id)a3;
+ (id)stopNotifyWhenFound:(id)a3;
+ (id)stopSoundWithBeaconUUID:(id)a3;
+ (id)unpairWithBeaconUUID:(id)a3;
+ (id)updateAccessoryFirmware:(id)a3;
- (BOOL)enableLostMode;
- (NSDate)expiration;
- (NSNumber)duration;
- (NSString)lostModeEmail;
- (NSString)lostModeMessage;
- (NSString)lostModePhoneNumber;
- (NSString)obfuscatedIdentifier;
- (NSString)taskName;
- (NSUUID)beaconIdentifier;
- (NSUUID)identifier;
- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 handle:(id)a7 lostModeEmail:(id)a8 lostModeMessage:(id)a9 lostModePhoneNumber:(id)a10 obfuscatedIdentifier:(id)a11 identifier:(id)a12;
- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 handle:(id)a7 lostModeMessage:(id)a8 lostModePhoneNumber:(id)a9 obfuscatedIdentifier:(id)a10;
- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 playSoundContext:(int64_t)a7 handle:(id)a8 lostModeMessage:(id)a9 lostModePhoneNumber:(id)a10 obfuscatedIdentifier:(id)a11 identifier:(id)a12;
- (SPCommand)initWithCoder:(id)a3;
- (SPHandle)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)playSoundContext;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBeaconIdentifier:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEnableLostMode:(BOOL)a3;
- (void)setExpiration:(id)a3;
- (void)setHandle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLostModeEmail:(id)a3;
- (void)setLostModeMessage:(id)a3;
- (void)setLostModePhoneNumber:(id)a3;
- (void)setObfuscatedIdentifier:(id)a3;
- (void)setPlaySoundContext:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SPCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)enableNotifyWhenFound:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:1 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)disableNotifyWhenFound:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:2 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)locate:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:0 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)playSoundWithBeaconUUID:(id)a3 duration:(double)a4
{
  id v5 = a3;
  v6 = [SPCommand alloc];
  v7 = [NSNumber numberWithDouble:a4];
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [(SPCommand *)v6 initWithBeaconUUID:v5 type:3 expiration:0 duration:v7 playSoundContext:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0 identifier:v8];

  return v9;
}

+ (id)playSoundWithBeaconUUID:(id)a3
{
  return +[SPCommand playSoundWithBeaconUUID:a3 withContext:0];
}

+ (id)unpairWithBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:10 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)playSoundWithBeaconUUID:(id)a3 withContext:(int64_t)a4
{
  id v5 = a3;
  v6 = [SPCommand alloc];
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [(SPCommand *)v6 initWithBeaconUUID:v5 type:3 expiration:0 duration:0 playSoundContext:a4 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0 identifier:v7];

  return v8;
}

+ (id)stopSoundWithBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:4 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)enableLostModeForBeaconUUID:(id)a3 message:(id)a4 phoneNumber:(id)a5 email:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [SPCommand alloc];
  v14 = [MEMORY[0x1E4F29128] UUID];
  v15 = [(SPCommand *)v13 initWithBeaconUUID:v12 type:5 expiration:0 duration:0 handle:0 lostModeEmail:v9 lostModeMessage:v11 lostModePhoneNumber:v10 obfuscatedIdentifier:0 identifier:v14];

  return v15;
}

+ (id)disableLostModeForBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:6 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)beginLeashingWithBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:7 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)endLeashingWithBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:8 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)connectToBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:9 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)disconnectFromBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:13 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)startBTFindingWithBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:14 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)stopBTFindingWithBeaconUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:15 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)setObfuscatedIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [SPCommand alloc];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = [(SPCommand *)v4 initWithBeaconUUID:v5 type:11 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:v3];

  return v6;
}

+ (id)updateAccessoryFirmware:(id)a3
{
  id v3 = a3;
  v4 = [[SPCommand alloc] initWithBeaconUUID:v3 type:12 expiration:0 duration:0 handle:0 lostModeMessage:0 lostModePhoneNumber:0 obfuscatedIdentifier:0];

  return v4;
}

+ (id)startNotifyWhenFound:(id)a3
{
  return +[SPCommand enableNotifyWhenFound:a3];
}

+ (id)stopNotifyWhenFound:(id)a3
{
  return +[SPCommand disableNotifyWhenFound:a3];
}

- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 handle:(id)a7 lostModeMessage:(id)a8 lostModePhoneNumber:(id)a9 obfuscatedIdentifier:(id)a10
{
  v17 = (void *)MEMORY[0x1E4F29128];
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  v25 = [v17 UUID];
  v26 = [(SPCommand *)self initWithBeaconUUID:v24 type:a4 expiration:v23 duration:v22 handle:v21 lostModeEmail:0 lostModeMessage:v20 lostModePhoneNumber:v19 obfuscatedIdentifier:v18 identifier:v25];

  return v26;
}

- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 handle:(id)a7 lostModeEmail:(id)a8 lostModeMessage:(id)a9 lostModePhoneNumber:(id)a10 obfuscatedIdentifier:(id)a11 identifier:(id)a12
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v30.receiver = self;
  v30.super_class = (Class)SPCommand;
  v26 = [(SPCommand *)&v30 init];
  v27 = v26;
  if (v26)
  {
    [(SPCommand *)v26 setIdentifier:v25];
    [(SPCommand *)v27 setBeaconIdentifier:v17];
    [(SPCommand *)v27 setType:a4];
    [(SPCommand *)v27 setExpiration:v18];
    [(SPCommand *)v27 setDuration:v19];
    [(SPCommand *)v27 setHandle:v20];
    [(SPCommand *)v27 setLostModeEmail:v21];
    [(SPCommand *)v27 setLostModeMessage:v22];
    [(SPCommand *)v27 setLostModePhoneNumber:v23];
    [(SPCommand *)v27 setObfuscatedIdentifier:v24];
  }

  return v27;
}

- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 playSoundContext:(int64_t)a7 handle:(id)a8 lostModeMessage:(id)a9 lostModePhoneNumber:(id)a10 obfuscatedIdentifier:(id)a11 identifier:(id)a12
{
  id v29 = a3;
  id v28 = a5;
  id v27 = a6;
  id v26 = a8;
  id v25 = a9;
  id v24 = a10;
  id v23 = a11;
  id v17 = a12;
  v30.receiver = self;
  v30.super_class = (Class)SPCommand;
  id v18 = [(SPCommand *)&v30 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a12);
    objc_storeStrong((id *)&v19->_beaconIdentifier, a3);
    v19->_type = a4;
    objc_storeStrong((id *)&v19->_expiration, a5);
    objc_storeStrong((id *)&v19->_duration, a6);
    v19->_playSoundContext = a7;
    objc_storeStrong((id *)&v19->_handle, a8);
    objc_storeStrong((id *)&v19->_lostModeMessage, a9);
    objc_storeStrong((id *)&v19->_lostModePhoneNumber, a10);
    objc_storeStrong((id *)&v19->_obfuscatedIdentifier, a11);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16 = [SPCommand alloc];
  v4 = [(SPCommand *)self identifier];
  int64_t v5 = [(SPCommand *)self type];
  v6 = [(SPCommand *)self expiration];
  v7 = [(SPCommand *)self duration];
  v8 = [(SPCommand *)self handle];
  id v9 = [(SPCommand *)self lostModeEmail];
  id v10 = [(SPCommand *)self lostModeMessage];
  id v11 = [(SPCommand *)self lostModePhoneNumber];
  id v12 = [(SPCommand *)self obfuscatedIdentifier];
  v13 = [(SPCommand *)self identifier];
  v14 = [(SPCommand *)v16 initWithBeaconUUID:v4 type:v5 expiration:v6 duration:v7 handle:v8 lostModeEmail:v9 lostModeMessage:v10 lostModePhoneNumber:v11 obfuscatedIdentifier:v12 identifier:v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SPCommand *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(SPCommand *)self beaconIdentifier];
  [v4 encodeObject:v6 forKey:@"beaconIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPCommand type](self, "type"), @"type");
  v7 = [(SPCommand *)self expiration];
  [v4 encodeObject:v7 forKey:@"expiration"];

  v8 = [(SPCommand *)self duration];
  [v4 encodeObject:v8 forKey:@"duration"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPCommand playSoundContext](self, "playSoundContext"), @"playSoundContext");
  id v9 = [(SPCommand *)self handle];
  [v4 encodeObject:v9 forKey:@"handle"];

  id v10 = [(SPCommand *)self lostModeEmail];
  [v4 encodeObject:v10 forKey:@"lostModeEmail"];

  id v11 = [(SPCommand *)self lostModeMessage];
  [v4 encodeObject:v11 forKey:@"lostModeMessage"];

  id v12 = [(SPCommand *)self lostModePhoneNumber];
  [v4 encodeObject:v12 forKey:@"lostModePhoneNumber"];

  id v13 = [(SPCommand *)self obfuscatedIdentifier];
  [v4 encodeObject:v13 forKey:@"obfuscatedIdentifier"];
}

- (SPCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifier"];
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v7;

  self->_type = [v4 decodeIntegerForKey:@"type"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
  expiration = self->_expiration;
  self->_expiration = v9;

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];
  duration = self->_duration;
  self->_duration = v11;

  self->_playSoundContext = [v4 decodeIntegerForKey:@"playSoundContext"];
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  handle = self->_handle;
  self->_handle = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeEmail"];
  lostModeEmail = self->_lostModeEmail;
  self->_lostModeEmail = v15;

  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeMessage"];
  lostModeMessage = self->_lostModeMessage;
  self->_lostModeMessage = v17;

  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModePhoneNumber"];
  lostModePhoneNumber = self->_lostModePhoneNumber;
  self->_lostModePhoneNumber = v19;

  id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obfuscatedIdentifier"];

  obfuscatedIdentifier = self->_obfuscatedIdentifier;
  self->_obfuscatedIdentifier = v21;

  return self;
}

- (NSString)taskName
{
  unint64_t v2 = [(SPCommand *)self type];
  if (v2 > 0xF) {
    id v3 = 0;
  }
  else {
    id v3 = *off_1E601C110[v2];
  }

  return (NSString *)v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (int64_t)playSoundContext
{
  return self->_playSoundContext;
}

- (void)setPlaySoundContext:(int64_t)a3
{
  self->_playSoundContext = a3;
}

- (SPHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)lostModeEmail
{
  return self->_lostModeEmail;
}

- (void)setLostModeEmail:(id)a3
{
}

- (NSString)lostModeMessage
{
  return self->_lostModeMessage;
}

- (void)setLostModeMessage:(id)a3
{
}

- (NSString)lostModePhoneNumber
{
  return self->_lostModePhoneNumber;
}

- (void)setLostModePhoneNumber:(id)a3
{
}

- (NSString)obfuscatedIdentifier
{
  return self->_obfuscatedIdentifier;
}

- (void)setObfuscatedIdentifier:(id)a3
{
}

- (BOOL)enableLostMode
{
  return self->_enableLostMode;
}

- (void)setEnableLostMode:(BOOL)a3
{
  self->_enableLostMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obfuscatedIdentifier, 0);
  objc_storeStrong((id *)&self->_lostModePhoneNumber, 0);
  objc_storeStrong((id *)&self->_lostModeMessage, 0);
  objc_storeStrong((id *)&self->_lostModeEmail, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end