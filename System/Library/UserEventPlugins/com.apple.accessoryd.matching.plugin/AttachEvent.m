@interface AttachEvent
- (AttachEvent)initWithTimestamp:(id)a3 connectType:(id)a4 primaryPort:(id)a5 restrictedModeEnabled:(BOOL)a6 dialogShown:(BOOL)a7 supportsUSB:(BOOL)a8 supportsUART:(BOOL)a9 supportsMB:(BOOL)a10 supportsAIDBulkPipes:(BOOL)a11 digitalID:(id)a12;
- (BOOL)accSupoortsCharging;
- (BOOL)accSupoortsMikeyBus;
- (BOOL)accSupoortsUART;
- (BOOL)accSupoortsUSB;
- (BOOL)restrictedModeEnabled;
- (BOOL)rmDialogShown;
- (NSData)accDigitalID;
- (NSNumber)chargeVoltage;
- (NSNumber)connectType;
- (NSNumber)currentLimit;
- (NSNumber)primaryPort;
- (NSNumber)timestamp;
- (void)dealloc;
- (void)setAccDigitalID:(id)a3;
- (void)setAccSupoortsCharging:(BOOL)a3;
- (void)setAccSupoortsMikeyBus:(BOOL)a3;
- (void)setAccSupoortsUART:(BOOL)a3;
- (void)setAccSupoortsUSB:(BOOL)a3;
- (void)setChargeVoltage:(id)a3;
- (void)setConnectType:(id)a3;
- (void)setCurrentLimit:(id)a3;
- (void)setPrimaryPort:(id)a3;
- (void)setRestrictedModeEnabled:(BOOL)a3;
- (void)setRmDialogShown:(BOOL)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation AttachEvent

- (AttachEvent)initWithTimestamp:(id)a3 connectType:(id)a4 primaryPort:(id)a5 restrictedModeEnabled:(BOOL)a6 dialogShown:(BOOL)a7 supportsUSB:(BOOL)a8 supportsUART:(BOOL)a9 supportsMB:(BOOL)a10 supportsAIDBulkPipes:(BOOL)a11 digitalID:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v27 = a12;
  v28.receiver = self;
  v28.super_class = (Class)AttachEvent;
  v21 = [(AttachEvent *)&v28 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_timestamp, a3);
    objc_storeStrong((id *)&v22->_connectType, a4);
    objc_storeStrong((id *)&v22->_primaryPort, a5);
    v22->_restrictedModeEnabled = a6;
    v22->_rmDialogShown = a7;
    v22->_accSupoortsUSB = a8;
    v22->_accSupoortsUART = a9;
    v22->_accSupoortsMikeyBus = a10;
    objc_storeStrong((id *)&v22->_accDigitalID, a12);
    chargeVoltage = v22->_chargeVoltage;
    v22->_chargeVoltage = 0;

    currentLimit = v22->_currentLimit;
    v22->_currentLimit = 0;

    v22->_accSupoortsCharging = 0;
  }

  return v22;
}

- (void)dealloc
{
  [(AttachEvent *)self setAccDigitalID:0];
  v3.receiver = self;
  v3.super_class = (Class)AttachEvent;
  [(AttachEvent *)&v3 dealloc];
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)primaryPort
{
  return self->_primaryPort;
}

- (void)setPrimaryPort:(id)a3
{
}

- (NSNumber)connectType
{
  return self->_connectType;
}

- (void)setConnectType:(id)a3
{
}

- (NSNumber)currentLimit
{
  return self->_currentLimit;
}

- (void)setCurrentLimit:(id)a3
{
}

- (NSNumber)chargeVoltage
{
  return self->_chargeVoltage;
}

- (void)setChargeVoltage:(id)a3
{
}

- (NSData)accDigitalID
{
  return self->_accDigitalID;
}

- (void)setAccDigitalID:(id)a3
{
}

- (BOOL)restrictedModeEnabled
{
  return self->_restrictedModeEnabled;
}

- (void)setRestrictedModeEnabled:(BOOL)a3
{
  self->_restrictedModeEnabled = a3;
}

- (BOOL)rmDialogShown
{
  return self->_rmDialogShown;
}

- (void)setRmDialogShown:(BOOL)a3
{
  self->_rmDialogShown = a3;
}

- (BOOL)accSupoortsUSB
{
  return self->_accSupoortsUSB;
}

- (void)setAccSupoortsUSB:(BOOL)a3
{
  self->_accSupoortsUSB = a3;
}

- (BOOL)accSupoortsUART
{
  return self->_accSupoortsUART;
}

- (void)setAccSupoortsUART:(BOOL)a3
{
  self->_accSupoortsUART = a3;
}

- (BOOL)accSupoortsMikeyBus
{
  return self->_accSupoortsMikeyBus;
}

- (void)setAccSupoortsMikeyBus:(BOOL)a3
{
  self->_accSupoortsMikeyBus = a3;
}

- (BOOL)accSupoortsCharging
{
  return self->_accSupoortsCharging;
}

- (void)setAccSupoortsCharging:(BOOL)a3
{
  self->_accSupoortsCharging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accDigitalID, 0);
  objc_storeStrong((id *)&self->_chargeVoltage, 0);
  objc_storeStrong((id *)&self->_currentLimit, 0);
  objc_storeStrong((id *)&self->_connectType, 0);
  objc_storeStrong((id *)&self->_primaryPort, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end