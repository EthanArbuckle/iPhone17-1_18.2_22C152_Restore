@interface IFTSchemaIFTPermissionRequirement
- (BOOL)bluetoothPermissionRequired;
- (BOOL)contactsPermissionRequired;
- (BOOL)hasBluetoothPermissionRequired;
- (BOOL)hasContactsPermissionRequired;
- (BOOL)hasLocationPermissionRequired;
- (BOOL)hasPhotosPermissionRequired;
- (BOOL)hasPreciseLocationPermissionRequired;
- (BOOL)hasShortcutsPermissionRequired;
- (BOOL)hasSiriPermissionRequired;
- (BOOL)hasWifiPermissionRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)locationPermissionRequired;
- (BOOL)photosPermissionRequired;
- (BOOL)preciseLocationPermissionRequired;
- (BOOL)readFrom:(id)a3;
- (BOOL)shortcutsPermissionRequired;
- (BOOL)siriPermissionRequired;
- (BOOL)wifiPermissionRequired;
- (IFTSchemaIFTPermissionRequirement)initWithDictionary:(id)a3;
- (IFTSchemaIFTPermissionRequirement)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Permissionrequirement;
- (void)deleteBluetoothPermissionRequired;
- (void)deleteContactsPermissionRequired;
- (void)deleteLocationPermissionRequired;
- (void)deletePhotosPermissionRequired;
- (void)deletePreciseLocationPermissionRequired;
- (void)deleteShortcutsPermissionRequired;
- (void)deleteSiriPermissionRequired;
- (void)deleteWifiPermissionRequired;
- (void)setBluetoothPermissionRequired:(BOOL)a3;
- (void)setContactsPermissionRequired:(BOOL)a3;
- (void)setHasBluetoothPermissionRequired:(BOOL)a3;
- (void)setHasContactsPermissionRequired:(BOOL)a3;
- (void)setHasLocationPermissionRequired:(BOOL)a3;
- (void)setHasPhotosPermissionRequired:(BOOL)a3;
- (void)setHasPreciseLocationPermissionRequired:(BOOL)a3;
- (void)setHasShortcutsPermissionRequired:(BOOL)a3;
- (void)setHasSiriPermissionRequired:(BOOL)a3;
- (void)setHasWifiPermissionRequired:(BOOL)a3;
- (void)setLocationPermissionRequired:(BOOL)a3;
- (void)setPhotosPermissionRequired:(BOOL)a3;
- (void)setPreciseLocationPermissionRequired:(BOOL)a3;
- (void)setShortcutsPermissionRequired:(BOOL)a3;
- (void)setSiriPermissionRequired:(BOOL)a3;
- (void)setWifiPermissionRequired:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTPermissionRequirement

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasContactsPermissionRequired:(BOOL)a3
{
  self->_hasContactsPermissionRequired = a3;
}

- (BOOL)hasContactsPermissionRequired
{
  return self->_hasContactsPermissionRequired;
}

- (void)setHasPhotosPermissionRequired:(BOOL)a3
{
  self->_hasPhotosPermissionRequired = a3;
}

- (BOOL)hasPhotosPermissionRequired
{
  return self->_hasPhotosPermissionRequired;
}

- (void)setHasBluetoothPermissionRequired:(BOOL)a3
{
  self->_hasBluetoothPermissionRequired = a3;
}

- (BOOL)hasBluetoothPermissionRequired
{
  return self->_hasBluetoothPermissionRequired;
}

- (void)setHasWifiPermissionRequired:(BOOL)a3
{
  self->_hasWifiPermissionRequired = a3;
}

- (BOOL)hasWifiPermissionRequired
{
  return self->_hasWifiPermissionRequired;
}

- (void)setHasLocationPermissionRequired:(BOOL)a3
{
  self->_hasLocationPermissionRequired = a3;
}

- (BOOL)hasLocationPermissionRequired
{
  return self->_hasLocationPermissionRequired;
}

- (void)setHasPreciseLocationPermissionRequired:(BOOL)a3
{
  self->_hasPreciseLocationPermissionRequired = a3;
}

- (BOOL)hasPreciseLocationPermissionRequired
{
  return self->_hasPreciseLocationPermissionRequired;
}

- (void)setHasShortcutsPermissionRequired:(BOOL)a3
{
  self->_hasShortcutsPermissionRequired = a3;
}

- (BOOL)hasShortcutsPermissionRequired
{
  return self->_hasShortcutsPermissionRequired;
}

- (void)setHasSiriPermissionRequired:(BOOL)a3
{
  self->_hasSiriPermissionRequired = a3;
}

- (BOOL)hasSiriPermissionRequired
{
  return self->_hasSiriPermissionRequired;
}

- (unint64_t)whichOneof_Permissionrequirement
{
  return self->_whichOneof_Permissionrequirement;
}

- (IFTSchemaIFTPermissionRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IFTSchemaIFTPermissionRequirement;
  v5 = [(IFTSchemaIFTPermissionRequirement *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setSiriPermissionRequired:](v5, "setSiriPermissionRequired:", [v6 BOOLValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"shortcutsPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setShortcutsPermissionRequired:](v5, "setShortcutsPermissionRequired:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"preciseLocationPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setPreciseLocationPermissionRequired:](v5, "setPreciseLocationPermissionRequired:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"locationPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setLocationPermissionRequired:](v5, "setLocationPermissionRequired:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"wifiPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setWifiPermissionRequired:](v5, "setWifiPermissionRequired:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"bluetoothPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setBluetoothPermissionRequired:](v5, "setBluetoothPermissionRequired:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"photosPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setPhotosPermissionRequired:](v5, "setPhotosPermissionRequired:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"contactsPermissionRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPermissionRequirement setContactsPermissionRequired:](v5, "setContactsPermissionRequired:", [v13 BOOLValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (IFTSchemaIFTPermissionRequirement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTPermissionRequirement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTPermissionRequirement *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  if (whichOneof_Permissionrequirement == 6)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement bluetoothPermissionRequired](self, "bluetoothPermissionRequired"));
    [v3 setObject:v5 forKeyedSubscript:@"bluetoothPermissionRequired"];

    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 8)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement contactsPermissionRequired](self, "contactsPermissionRequired"));
    [v3 setObject:v6 forKeyedSubscript:@"contactsPermissionRequired"];

    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 4)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement locationPermissionRequired](self, "locationPermissionRequired"));
    [v3 setObject:v7 forKeyedSubscript:@"locationPermissionRequired"];

    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 7)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement photosPermissionRequired](self, "photosPermissionRequired"));
    [v3 setObject:v8 forKeyedSubscript:@"photosPermissionRequired"];

    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 3)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement preciseLocationPermissionRequired](self, "preciseLocationPermissionRequired"));
    [v3 setObject:v9 forKeyedSubscript:@"preciseLocationPermissionRequired"];

    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 2)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement shortcutsPermissionRequired](self, "shortcutsPermissionRequired"));
    [v3 setObject:v10 forKeyedSubscript:@"shortcutsPermissionRequired"];

    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 1)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement siriPermissionRequired](self, "siriPermissionRequired"));
    [v3 setObject:v11 forKeyedSubscript:@"siriPermissionRequired"];

    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 5)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPermissionRequirement wifiPermissionRequired](self, "wifiPermissionRequired"));
    [v3 setObject:v12 forKeyedSubscript:@"wifiPermissionRequired"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_whichOneof_Permissionrequirement - 1;
  if (v2 > 7) {
    return 0;
  }
  else {
    return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E5EBF620[v2]);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  if (whichOneof_Permissionrequirement != objc_msgSend(v4, "whichOneof_Permissionrequirement")) {
    goto LABEL_11;
  }
  int siriPermissionRequired = self->_siriPermissionRequired;
  if (siriPermissionRequired == [v4 siriPermissionRequired]
    && (int shortcutsPermissionRequired = self->_shortcutsPermissionRequired,
        shortcutsPermissionRequired == [v4 shortcutsPermissionRequired])
    && (int preciseLocationPermissionRequired = self->_preciseLocationPermissionRequired,
        preciseLocationPermissionRequired == [v4 preciseLocationPermissionRequired])
    && (int locationPermissionRequired = self->_locationPermissionRequired,
        locationPermissionRequired == [v4 locationPermissionRequired])
    && (int wifiPermissionRequired = self->_wifiPermissionRequired,
        wifiPermissionRequired == [v4 wifiPermissionRequired])
    && (int bluetoothPermissionRequired = self->_bluetoothPermissionRequired,
        bluetoothPermissionRequired == [v4 bluetoothPermissionRequired])
    && (int photosPermissionRequired = self->_photosPermissionRequired,
        photosPermissionRequired == [v4 photosPermissionRequired]))
  {
    int contactsPermissionRequired = self->_contactsPermissionRequired;
    BOOL v14 = contactsPermissionRequired == [v4 contactsPermissionRequired];
  }
  else
  {
LABEL_11:
    BOOL v14 = 0;
  }

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  if (whichOneof_Permissionrequirement == 1)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 2)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 3)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 4)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 5)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 6)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 7)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 8) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTPermissionRequirementReadFrom(self, (uint64_t)a3);
}

- (void)deleteContactsPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 8)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int contactsPermissionRequired = 0;
  }
}

- (BOOL)contactsPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 8 && self->_contactsPermissionRequired;
}

- (void)setContactsPermissionRequired:(BOOL)a3
{
  self->_int siriPermissionRequired = 0;
  self->_int shortcutsPermissionRequired = 0;
  self->_int preciseLocationPermissionRequired = 0;
  self->_int locationPermissionRequired = 0;
  self->_int wifiPermissionRequired = 0;
  self->_int bluetoothPermissionRequired = 0;
  self->_int photosPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 8;
  self->_int contactsPermissionRequired = a3;
}

- (void)deletePhotosPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 7)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int photosPermissionRequired = 0;
  }
}

- (BOOL)photosPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 7 && self->_photosPermissionRequired;
}

- (void)setPhotosPermissionRequired:(BOOL)a3
{
  self->_int siriPermissionRequired = 0;
  self->_int shortcutsPermissionRequired = 0;
  self->_int preciseLocationPermissionRequired = 0;
  self->_int locationPermissionRequired = 0;
  self->_int wifiPermissionRequired = 0;
  self->_int bluetoothPermissionRequired = 0;
  self->_int contactsPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 7;
  self->_int photosPermissionRequired = a3;
}

- (void)deleteBluetoothPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 6)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int bluetoothPermissionRequired = 0;
  }
}

- (BOOL)bluetoothPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 6 && self->_bluetoothPermissionRequired;
}

- (void)setBluetoothPermissionRequired:(BOOL)a3
{
  self->_int siriPermissionRequired = 0;
  self->_int shortcutsPermissionRequired = 0;
  self->_int preciseLocationPermissionRequired = 0;
  self->_int locationPermissionRequired = 0;
  self->_int wifiPermissionRequired = 0;
  self->_int photosPermissionRequired = 0;
  self->_int contactsPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 6;
  self->_int bluetoothPermissionRequired = a3;
}

- (void)deleteWifiPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 5)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int wifiPermissionRequired = 0;
  }
}

- (BOOL)wifiPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 5 && self->_wifiPermissionRequired;
}

- (void)setWifiPermissionRequired:(BOOL)a3
{
  self->_int siriPermissionRequired = 0;
  self->_int shortcutsPermissionRequired = 0;
  self->_int preciseLocationPermissionRequired = 0;
  self->_int locationPermissionRequired = 0;
  self->_int bluetoothPermissionRequired = 0;
  self->_int photosPermissionRequired = 0;
  self->_int contactsPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 5;
  self->_int wifiPermissionRequired = a3;
}

- (void)deleteLocationPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 4)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int locationPermissionRequired = 0;
  }
}

- (BOOL)locationPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 4 && self->_locationPermissionRequired;
}

- (void)setLocationPermissionRequired:(BOOL)a3
{
  self->_int siriPermissionRequired = 0;
  self->_int shortcutsPermissionRequired = 0;
  self->_int preciseLocationPermissionRequired = 0;
  self->_int wifiPermissionRequired = 0;
  self->_int bluetoothPermissionRequired = 0;
  self->_int photosPermissionRequired = 0;
  self->_int contactsPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 4;
  self->_int locationPermissionRequired = a3;
}

- (void)deletePreciseLocationPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 3)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int preciseLocationPermissionRequired = 0;
  }
}

- (BOOL)preciseLocationPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 3 && self->_preciseLocationPermissionRequired;
}

- (void)setPreciseLocationPermissionRequired:(BOOL)a3
{
  self->_int siriPermissionRequired = 0;
  self->_int shortcutsPermissionRequired = 0;
  self->_int locationPermissionRequired = 0;
  self->_int wifiPermissionRequired = 0;
  self->_int bluetoothPermissionRequired = 0;
  self->_int photosPermissionRequired = 0;
  self->_int contactsPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 3;
  self->_int preciseLocationPermissionRequired = a3;
}

- (void)deleteShortcutsPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 2)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int shortcutsPermissionRequired = 0;
  }
}

- (BOOL)shortcutsPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 2 && self->_shortcutsPermissionRequired;
}

- (void)setShortcutsPermissionRequired:(BOOL)a3
{
  self->_int siriPermissionRequired = 0;
  self->_int preciseLocationPermissionRequired = 0;
  self->_int locationPermissionRequired = 0;
  self->_int wifiPermissionRequired = 0;
  self->_int bluetoothPermissionRequired = 0;
  self->_int photosPermissionRequired = 0;
  self->_int contactsPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 2;
  self->_int shortcutsPermissionRequired = a3;
}

- (void)deleteSiriPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 1)
  {
    self->_unint64_t whichOneof_Permissionrequirement = 0;
    self->_int siriPermissionRequired = 0;
  }
}

- (BOOL)siriPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 1 && self->_siriPermissionRequired;
}

- (void)setSiriPermissionRequired:(BOOL)a3
{
  self->_int shortcutsPermissionRequired = 0;
  self->_int preciseLocationPermissionRequired = 0;
  self->_int locationPermissionRequired = 0;
  self->_int wifiPermissionRequired = 0;
  self->_int bluetoothPermissionRequired = 0;
  self->_int photosPermissionRequired = 0;
  self->_int contactsPermissionRequired = 0;
  self->_unint64_t whichOneof_Permissionrequirement = 1;
  self->_int siriPermissionRequired = a3;
}

@end