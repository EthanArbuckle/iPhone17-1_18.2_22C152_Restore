@interface SASProximityMigrationTransferPreparationAction
+ (id)actionFromDictionary:(id)a3;
+ (unint64_t)actionID;
- (BOOL)hasResponse;
- (NSString)deviceName;
- (id)requestPayload;
- (void)setDeviceName:(id)a3;
@end

@implementation SASProximityMigrationTransferPreparationAction

+ (unint64_t)actionID
{
  return 9;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SASProximityMigrationTransferPreparationAction);
  v5 = [v3 objectForKeyedSubscript:@"deviceName"];

  [(SASProximityMigrationTransferPreparationAction *)v4 setDeviceName:v5];
  return v4;
}

- (id)requestPayload
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SASProximityMigrationTransferPreparationAction *)self deviceName];

  if (v3)
  {
    v7 = @"deviceName";
    v4 = [(SASProximityMigrationTransferPreparationAction *)self deviceName];
    v8[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)hasResponse
{
  return 1;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end