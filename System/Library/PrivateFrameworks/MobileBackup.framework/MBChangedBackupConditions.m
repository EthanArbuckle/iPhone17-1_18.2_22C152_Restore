@interface MBChangedBackupConditions
- (NSNumber)autoBackupOnCellularAllowed;
- (NSNumber)backupOnCellularEnabled;
- (NSNumber)enabled;
- (NSNumber)initial;
- (NSNumber)locked;
- (NSNumber)onCellular;
- (NSNumber)onExpensiveCellular;
- (NSNumber)onPower;
- (NSNumber)onWiFi;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setAutoBackupOnCellularAllowed:(id)a3;
- (void)setBackupOnCellularEnabled:(id)a3;
- (void)setEnabled:(id)a3;
- (void)setInitial:(id)a3;
- (void)setLocked:(id)a3;
- (void)setOnCellular:(id)a3;
- (void)setOnExpensiveCellular:(id)a3;
- (void)setOnPower:(id)a3;
- (void)setOnWiFi:(id)a3;
@end

@implementation MBChangedBackupConditions

- (id)dictionaryRepresentation
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:7];
  v4 = [(MBChangedBackupConditions *)self initial];
  [v3 setObject:v4 forKeyedSubscript:@"initial"];

  v5 = [(MBChangedBackupConditions *)self locked];
  [v3 setObject:v5 forKeyedSubscript:@"locked"];

  v6 = [(MBChangedBackupConditions *)self onWiFi];
  [v3 setObject:v6 forKeyedSubscript:@"onWiFi"];

  v7 = [(MBChangedBackupConditions *)self onPower];
  [v3 setObject:v7 forKeyedSubscript:@"onPower"];

  v8 = [(MBChangedBackupConditions *)self backupOnCellularEnabled];
  [v3 setObject:v8 forKeyedSubscript:@"backupOnCellularEnabled"];

  v9 = [(MBChangedBackupConditions *)self onCellular];
  [v3 setObject:v9 forKeyedSubscript:@"onCellular"];

  v10 = [(MBChangedBackupConditions *)self onExpensiveCellular];
  [v3 setObject:v10 forKeyedSubscript:@"onExpensiveCellular"];

  v11 = [(MBChangedBackupConditions *)self autoBackupOnCellularAllowed];
  [v3 setObject:v11 forKeyedSubscript:@"autoBackupOnCellularAllowed"];

  return v3;
}

- (id)description
{
  v2 = [(MBChangedBackupConditions *)self dictionaryRepresentation];
  id v3 = [v2 description];

  return v3;
}

- (NSNumber)initial
{
  return self->_initial;
}

- (void)setInitial:(id)a3
{
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
}

- (NSNumber)locked
{
  return self->_locked;
}

- (void)setLocked:(id)a3
{
}

- (NSNumber)onWiFi
{
  return self->_onWiFi;
}

- (void)setOnWiFi:(id)a3
{
}

- (NSNumber)onPower
{
  return self->_onPower;
}

- (void)setOnPower:(id)a3
{
}

- (NSNumber)backupOnCellularEnabled
{
  return self->_backupOnCellularEnabled;
}

- (void)setBackupOnCellularEnabled:(id)a3
{
}

- (NSNumber)onCellular
{
  return self->_onCellular;
}

- (void)setOnCellular:(id)a3
{
}

- (NSNumber)onExpensiveCellular
{
  return self->_onExpensiveCellular;
}

- (void)setOnExpensiveCellular:(id)a3
{
}

- (NSNumber)autoBackupOnCellularAllowed
{
  return self->_autoBackupOnCellularAllowed;
}

- (void)setAutoBackupOnCellularAllowed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoBackupOnCellularAllowed, 0);
  objc_storeStrong((id *)&self->_onExpensiveCellular, 0);
  objc_storeStrong((id *)&self->_onCellular, 0);
  objc_storeStrong((id *)&self->_backupOnCellularEnabled, 0);
  objc_storeStrong((id *)&self->_onPower, 0);
  objc_storeStrong((id *)&self->_onWiFi, 0);
  objc_storeStrong((id *)&self->_locked, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_initial, 0);
}

@end