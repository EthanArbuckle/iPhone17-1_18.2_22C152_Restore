@interface CLDuetHomeKitScene
- (CLDuetHomeKitScene)initWithHomeUUID:(id)a3 actionSetUUID:(id)a4 actionSetName:(id)a5 actionSetType:(id)a6 clientName:(id)a7 source:(id)a8 triggerLocalizationScan:(id)a9 triggerRecordingScan:(id)a10;
- (NSNumber)triggerLocalizationScan;
- (NSNumber)triggerRecordingScan;
- (NSString)actionSetName;
- (NSString)actionSetType;
- (NSString)actionSetUUID;
- (NSString)clientName;
- (NSString)homeUUID;
- (NSString)source;
- (void)dealloc;
- (void)setActionSetName:(id)a3;
- (void)setActionSetType:(id)a3;
- (void)setActionSetUUID:(id)a3;
- (void)setClientName:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setSource:(id)a3;
- (void)setTriggerLocalizationScan:(id)a3;
- (void)setTriggerRecordingScan:(id)a3;
@end

@implementation CLDuetHomeKitScene

- (CLDuetHomeKitScene)initWithHomeUUID:(id)a3 actionSetUUID:(id)a4 actionSetName:(id)a5 actionSetType:(id)a6 clientName:(id)a7 source:(id)a8 triggerLocalizationScan:(id)a9 triggerRecordingScan:(id)a10
{
  v19.receiver = self;
  v19.super_class = (Class)CLDuetHomeKitScene;
  v16 = [(CLDuetHomeKitScene *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(CLDuetHomeKitScene *)v16 setHomeUUID:a3];
    [(CLDuetHomeKitScene *)v17 setActionSetUUID:a4];
    [(CLDuetHomeKitScene *)v17 setActionSetName:a5];
    [(CLDuetHomeKitScene *)v17 setActionSetType:a6];
    [(CLDuetHomeKitScene *)v17 setClientName:a7];
    [(CLDuetHomeKitScene *)v17 setSource:a8];
    [(CLDuetHomeKitScene *)v17 setTriggerLocalizationScan:a9];
    [(CLDuetHomeKitScene *)v17 setTriggerRecordingScan:a10];
  }
  return v17;
}

- (void)dealloc
{
  [(CLDuetHomeKitScene *)self setHomeUUID:0];
  [(CLDuetHomeKitScene *)self setActionSetUUID:0];
  [(CLDuetHomeKitScene *)self setActionSetName:0];
  [(CLDuetHomeKitScene *)self setActionSetType:0];
  [(CLDuetHomeKitScene *)self setClientName:0];
  [(CLDuetHomeKitScene *)self setSource:0];
  [(CLDuetHomeKitScene *)self setTriggerLocalizationScan:0];
  [(CLDuetHomeKitScene *)self setTriggerRecordingScan:0];
  v3.receiver = self;
  v3.super_class = (Class)CLDuetHomeKitScene;
  [(CLDuetHomeKitScene *)&v3 dealloc];
}

- (NSString)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
}

- (NSString)actionSetUUID
{
  return self->_actionSetUUID;
}

- (void)setActionSetUUID:(id)a3
{
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (void)setActionSetName:(id)a3
{
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSNumber)triggerLocalizationScan
{
  return self->_triggerLocalizationScan;
}

- (void)setTriggerLocalizationScan:(id)a3
{
}

- (NSNumber)triggerRecordingScan
{
  return self->_triggerRecordingScan;
}

- (void)setTriggerRecordingScan:(id)a3
{
}

@end