@interface IFTSchemaIFTActionFailureFailure
- (BOOL)actionCanceled;
- (BOOL)actionNotAllowed;
- (BOOL)bluetoothDisabled;
- (BOOL)developerDefinedError;
- (BOOL)entityNotFound;
- (BOOL)featureCurrentlyRestricted;
- (BOOL)hasActionCanceled;
- (BOOL)hasActionFailureDeveloperDefinedError;
- (BOOL)hasActionNotAllowed;
- (BOOL)hasBluetoothDisabled;
- (BOOL)hasDeveloperDefinedError;
- (BOOL)hasEntityNotFound;
- (BOOL)hasFeatureCurrentlyRestricted;
- (BOOL)hasLocationDisabled;
- (BOOL)hasNetworkFailure;
- (BOOL)hasNoMatchingTool;
- (BOOL)hasPartialFailure;
- (BOOL)hasPreciseLocationDisabled;
- (BOOL)hasPreflightCheckFailure;
- (BOOL)hasUnableToUndo;
- (BOOL)hasUnsupportedOnDevice;
- (BOOL)hasValueDisambiguationRejected;
- (BOOL)hasWifiDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)locationDisabled;
- (BOOL)networkFailure;
- (BOOL)noMatchingTool;
- (BOOL)partialFailure;
- (BOOL)preciseLocationDisabled;
- (BOOL)preflightCheckFailure;
- (BOOL)readFrom:(id)a3;
- (BOOL)unableToUndo;
- (BOOL)unsupportedOnDevice;
- (BOOL)valueDisambiguationRejected;
- (BOOL)wifiDisabled;
- (IFTSchemaIFTActionFailureDeveloperDefinedError)actionFailureDeveloperDefinedError;
- (IFTSchemaIFTActionFailureFailure)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionFailureFailure)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Actionfailurefailure;
- (void)deleteActionCanceled;
- (void)deleteActionFailureDeveloperDefinedError;
- (void)deleteActionNotAllowed;
- (void)deleteBluetoothDisabled;
- (void)deleteDeveloperDefinedError;
- (void)deleteEntityNotFound;
- (void)deleteFeatureCurrentlyRestricted;
- (void)deleteLocationDisabled;
- (void)deleteNetworkFailure;
- (void)deleteNoMatchingTool;
- (void)deletePartialFailure;
- (void)deletePreciseLocationDisabled;
- (void)deletePreflightCheckFailure;
- (void)deleteUnableToUndo;
- (void)deleteUnsupportedOnDevice;
- (void)deleteValueDisambiguationRejected;
- (void)deleteWifiDisabled;
- (void)setActionCanceled:(BOOL)a3;
- (void)setActionFailureDeveloperDefinedError:(id)a3;
- (void)setActionNotAllowed:(BOOL)a3;
- (void)setBluetoothDisabled:(BOOL)a3;
- (void)setDeveloperDefinedError:(BOOL)a3;
- (void)setEntityNotFound:(BOOL)a3;
- (void)setFeatureCurrentlyRestricted:(BOOL)a3;
- (void)setHasActionCanceled:(BOOL)a3;
- (void)setHasActionFailureDeveloperDefinedError:(BOOL)a3;
- (void)setHasActionNotAllowed:(BOOL)a3;
- (void)setHasBluetoothDisabled:(BOOL)a3;
- (void)setHasDeveloperDefinedError:(BOOL)a3;
- (void)setHasEntityNotFound:(BOOL)a3;
- (void)setHasFeatureCurrentlyRestricted:(BOOL)a3;
- (void)setHasLocationDisabled:(BOOL)a3;
- (void)setHasNetworkFailure:(BOOL)a3;
- (void)setHasNoMatchingTool:(BOOL)a3;
- (void)setHasPartialFailure:(BOOL)a3;
- (void)setHasPreciseLocationDisabled:(BOOL)a3;
- (void)setHasPreflightCheckFailure:(BOOL)a3;
- (void)setHasUnableToUndo:(BOOL)a3;
- (void)setHasUnsupportedOnDevice:(BOOL)a3;
- (void)setHasValueDisambiguationRejected:(BOOL)a3;
- (void)setHasWifiDisabled:(BOOL)a3;
- (void)setLocationDisabled:(BOOL)a3;
- (void)setNetworkFailure:(BOOL)a3;
- (void)setNoMatchingTool:(BOOL)a3;
- (void)setPartialFailure:(BOOL)a3;
- (void)setPreciseLocationDisabled:(BOOL)a3;
- (void)setPreflightCheckFailure:(BOOL)a3;
- (void)setUnableToUndo:(BOOL)a3;
- (void)setUnsupportedOnDevice:(BOOL)a3;
- (void)setValueDisambiguationRejected:(BOOL)a3;
- (void)setWifiDisabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionFailureFailure

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTActionFailureFailure;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTActionFailureFailure *)self actionFailureDeveloperDefinedError];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTActionFailureFailure *)self deleteActionFailureDeveloperDefinedError];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasActionFailureDeveloperDefinedError:(BOOL)a3
{
  self->_hasActionFailureDeveloperDefinedError = a3;
}

- (BOOL)hasActionFailureDeveloperDefinedError
{
  return self->_hasActionFailureDeveloperDefinedError;
}

- (void)setHasDeveloperDefinedError:(BOOL)a3
{
  self->_hasDeveloperDefinedError = a3;
}

- (BOOL)hasDeveloperDefinedError
{
  return self->_hasDeveloperDefinedError;
}

- (void)setHasNoMatchingTool:(BOOL)a3
{
  self->_hasNoMatchingTool = a3;
}

- (BOOL)hasNoMatchingTool
{
  return self->_hasNoMatchingTool;
}

- (void)setHasValueDisambiguationRejected:(BOOL)a3
{
  self->_hasValueDisambiguationRejected = a3;
}

- (BOOL)hasValueDisambiguationRejected
{
  return self->_hasValueDisambiguationRejected;
}

- (void)setHasActionCanceled:(BOOL)a3
{
  self->_hasActionCanceled = a3;
}

- (BOOL)hasActionCanceled
{
  return self->_hasActionCanceled;
}

- (void)setHasUnableToUndo:(BOOL)a3
{
  self->_hasUnableToUndo = a3;
}

- (BOOL)hasUnableToUndo
{
  return self->_hasUnableToUndo;
}

- (void)setHasActionNotAllowed:(BOOL)a3
{
  self->_hasActionNotAllowed = a3;
}

- (BOOL)hasActionNotAllowed
{
  return self->_hasActionNotAllowed;
}

- (void)setHasEntityNotFound:(BOOL)a3
{
  self->_hasEntityNotFound = a3;
}

- (BOOL)hasEntityNotFound
{
  return self->_hasEntityNotFound;
}

- (void)setHasFeatureCurrentlyRestricted:(BOOL)a3
{
  self->_hasFeatureCurrentlyRestricted = a3;
}

- (BOOL)hasFeatureCurrentlyRestricted
{
  return self->_hasFeatureCurrentlyRestricted;
}

- (void)setHasUnsupportedOnDevice:(BOOL)a3
{
  self->_hasUnsupportedOnDevice = a3;
}

- (BOOL)hasUnsupportedOnDevice
{
  return self->_hasUnsupportedOnDevice;
}

- (void)setHasPartialFailure:(BOOL)a3
{
  self->_hasPartialFailure = a3;
}

- (BOOL)hasPartialFailure
{
  return self->_hasPartialFailure;
}

- (void)setHasNetworkFailure:(BOOL)a3
{
  self->_hasNetworkFailure = a3;
}

- (BOOL)hasNetworkFailure
{
  return self->_hasNetworkFailure;
}

- (void)setHasBluetoothDisabled:(BOOL)a3
{
  self->_hasBluetoothDisabled = a3;
}

- (BOOL)hasBluetoothDisabled
{
  return self->_hasBluetoothDisabled;
}

- (void)setHasWifiDisabled:(BOOL)a3
{
  self->_hasWifiDisabled = a3;
}

- (BOOL)hasWifiDisabled
{
  return self->_hasWifiDisabled;
}

- (void)setHasLocationDisabled:(BOOL)a3
{
  self->_hasLocationDisabled = a3;
}

- (BOOL)hasLocationDisabled
{
  return self->_hasLocationDisabled;
}

- (void)setHasPreciseLocationDisabled:(BOOL)a3
{
  self->_hasPreciseLocationDisabled = a3;
}

- (BOOL)hasPreciseLocationDisabled
{
  return self->_hasPreciseLocationDisabled;
}

- (void)setHasPreflightCheckFailure:(BOOL)a3
{
  self->_hasPreflightCheckFailure = a3;
}

- (BOOL)hasPreflightCheckFailure
{
  return self->_hasPreflightCheckFailure;
}

- (unint64_t)whichOneof_Actionfailurefailure
{
  return self->_whichOneof_Actionfailurefailure;
}

- (IFTSchemaIFTActionFailureFailure)initWithDictionary:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)IFTSchemaIFTActionFailureFailure;
  v5 = [(IFTSchemaIFTActionFailureFailure *)&v41 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"preflightCheckFailure"];
    objc_opt_class();
    v39 = v6;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setPreflightCheckFailure:](v5, "setPreflightCheckFailure:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"preciseLocationDisabled"];
    objc_opt_class();
    v37 = v7;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setPreciseLocationDisabled:](v5, "setPreciseLocationDisabled:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"locationDisabled"];
    objc_opt_class();
    v35 = v8;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setLocationDisabled:](v5, "setLocationDisabled:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"wifiDisabled"];
    objc_opt_class();
    v33 = v9;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setWifiDisabled:](v5, "setWifiDisabled:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"bluetoothDisabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setBluetoothDisabled:](v5, "setBluetoothDisabled:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"networkFailure"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setNetworkFailure:](v5, "setNetworkFailure:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"partialFailure"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setPartialFailure:](v5, "setPartialFailure:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"unsupportedOnDevice"];
    objc_opt_class();
    v40 = v13;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setUnsupportedOnDevice:](v5, "setUnsupportedOnDevice:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"featureCurrentlyRestricted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setFeatureCurrentlyRestricted:](v5, "setFeatureCurrentlyRestricted:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"entityNotFound"];
    objc_opt_class();
    v38 = v15;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setEntityNotFound:](v5, "setEntityNotFound:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"actionNotAllowed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setActionNotAllowed:](v5, "setActionNotAllowed:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"unableToUndo"];
    objc_opt_class();
    v36 = v17;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setUnableToUndo:](v5, "setUnableToUndo:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"actionCanceled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setActionCanceled:](v5, "setActionCanceled:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"valueDisambiguationRejected"];
    objc_opt_class();
    v34 = v19;
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setValueDisambiguationRejected:](v5, "setValueDisambiguationRejected:", [v19 BOOLValue]);
    }
    v32 = v12;
    v20 = [v4 objectForKeyedSubscript:@"noMatchingTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setNoMatchingTool:](v5, "setNoMatchingTool:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"developerDefinedError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailureFailure setDeveloperDefinedError:](v5, "setDeveloperDefinedError:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"actionFailureDeveloperDefinedError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v11;
      v23 = v10;
      v24 = v20;
      v25 = v18;
      v26 = v16;
      v27 = v14;
      v28 = [[IFTSchemaIFTActionFailureDeveloperDefinedError alloc] initWithDictionary:v22];
      [(IFTSchemaIFTActionFailureFailure *)v5 setActionFailureDeveloperDefinedError:v28];

      v14 = v27;
      v16 = v26;
      v18 = v25;
      v20 = v24;
      v10 = v23;
      v11 = v31;
    }
    v29 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionFailureFailure)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionFailureFailure *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionFailureFailure *)self dictionaryRepresentation];
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
  if (self->_whichOneof_Actionfailurefailure == 13)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure actionCanceled](self, "actionCanceled"));
    [v3 setObject:v4 forKeyedSubscript:@"actionCanceled"];
  }
  if (self->_actionFailureDeveloperDefinedError)
  {
    v5 = [(IFTSchemaIFTActionFailureFailure *)self actionFailureDeveloperDefinedError];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"actionFailureDeveloperDefinedError"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"actionFailureDeveloperDefinedError"];
    }
  }
  unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  if (whichOneof_Actionfailurefailure == 11)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure actionNotAllowed](self, "actionNotAllowed"));
    [v3 setObject:v9 forKeyedSubscript:@"actionNotAllowed"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 5)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure bluetoothDisabled](self, "bluetoothDisabled"));
    [v3 setObject:v10 forKeyedSubscript:@"bluetoothDisabled"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 16)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure developerDefinedError](self, "developerDefinedError"));
    [v3 setObject:v11 forKeyedSubscript:@"developerDefinedError"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 10)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure entityNotFound](self, "entityNotFound"));
    [v3 setObject:v12 forKeyedSubscript:@"entityNotFound"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 9)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure featureCurrentlyRestricted](self, "featureCurrentlyRestricted"));
    [v3 setObject:v13 forKeyedSubscript:@"featureCurrentlyRestricted"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 3)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure locationDisabled](self, "locationDisabled"));
    [v3 setObject:v14 forKeyedSubscript:@"locationDisabled"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 6)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure networkFailure](self, "networkFailure"));
    [v3 setObject:v15 forKeyedSubscript:@"networkFailure"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 15)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure noMatchingTool](self, "noMatchingTool"));
    [v3 setObject:v16 forKeyedSubscript:@"noMatchingTool"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 7)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure partialFailure](self, "partialFailure"));
    [v3 setObject:v17 forKeyedSubscript:@"partialFailure"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 2)
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure preciseLocationDisabled](self, "preciseLocationDisabled"));
    [v3 setObject:v18 forKeyedSubscript:@"preciseLocationDisabled"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 1)
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure preflightCheckFailure](self, "preflightCheckFailure"));
    [v3 setObject:v19 forKeyedSubscript:@"preflightCheckFailure"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 12)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure unableToUndo](self, "unableToUndo"));
    [v3 setObject:v20 forKeyedSubscript:@"unableToUndo"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 8)
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure unsupportedOnDevice](self, "unsupportedOnDevice"));
    [v3 setObject:v21 forKeyedSubscript:@"unsupportedOnDevice"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 14)
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure valueDisambiguationRejected](self, "valueDisambiguationRejected"));
    [v3 setObject:v22 forKeyedSubscript:@"valueDisambiguationRejected"];

    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 4)
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailureFailure wifiDisabled](self, "wifiDisabled"));
    [v3 setObject:v23 forKeyedSubscript:@"wifiDisabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_whichOneof_Actionfailurefailure - 1;
  if (v2 > 0xF) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E5EBF588[v2]);
  }
  return [(IFTSchemaIFTActionFailureDeveloperDefinedError *)self->_actionFailureDeveloperDefinedError hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
    if (whichOneof_Actionfailurefailure == objc_msgSend(v4, "whichOneof_Actionfailurefailure"))
    {
      int preflightCheckFailure = self->_preflightCheckFailure;
      if (preflightCheckFailure == [v4 preflightCheckFailure])
      {
        int preciseLocationDisabled = self->_preciseLocationDisabled;
        if (preciseLocationDisabled == [v4 preciseLocationDisabled])
        {
          int locationDisabled = self->_locationDisabled;
          if (locationDisabled == [v4 locationDisabled])
          {
            int wifiDisabled = self->_wifiDisabled;
            if (wifiDisabled == [v4 wifiDisabled])
            {
              int bluetoothDisabled = self->_bluetoothDisabled;
              if (bluetoothDisabled == [v4 bluetoothDisabled])
              {
                int networkFailure = self->_networkFailure;
                if (networkFailure == [v4 networkFailure])
                {
                  int partialFailure = self->_partialFailure;
                  if (partialFailure == [v4 partialFailure])
                  {
                    int unsupportedOnDevice = self->_unsupportedOnDevice;
                    if (unsupportedOnDevice == [v4 unsupportedOnDevice])
                    {
                      int featureCurrentlyRestricted = self->_featureCurrentlyRestricted;
                      if (featureCurrentlyRestricted == [v4 featureCurrentlyRestricted])
                      {
                        int entityNotFound = self->_entityNotFound;
                        if (entityNotFound == [v4 entityNotFound])
                        {
                          int actionNotAllowed = self->_actionNotAllowed;
                          if (actionNotAllowed == [v4 actionNotAllowed])
                          {
                            int unableToUndo = self->_unableToUndo;
                            if (unableToUndo == [v4 unableToUndo])
                            {
                              int actionCanceled = self->_actionCanceled;
                              if (actionCanceled == [v4 actionCanceled])
                              {
                                int valueDisambiguationRejected = self->_valueDisambiguationRejected;
                                if (valueDisambiguationRejected == [v4 valueDisambiguationRejected])
                                {
                                  int noMatchingTool = self->_noMatchingTool;
                                  if (noMatchingTool == [v4 noMatchingTool])
                                  {
                                    int developerDefinedError = self->_developerDefinedError;
                                    if (developerDefinedError == [v4 developerDefinedError])
                                    {
                                      v22 = [(IFTSchemaIFTActionFailureFailure *)self actionFailureDeveloperDefinedError];
                                      v23 = [v4 actionFailureDeveloperDefinedError];
                                      v24 = v23;
                                      if ((v22 == 0) != (v23 != 0))
                                      {
                                        uint64_t v25 = [(IFTSchemaIFTActionFailureFailure *)self actionFailureDeveloperDefinedError];
                                        if (!v25)
                                        {

LABEL_27:
                                          BOOL v30 = 1;
                                          goto LABEL_25;
                                        }
                                        v26 = (void *)v25;
                                        v27 = [(IFTSchemaIFTActionFailureFailure *)self actionFailureDeveloperDefinedError];
                                        v28 = [v4 actionFailureDeveloperDefinedError];
                                        char v29 = [v27 isEqual:v28];

                                        if (v29) {
                                          goto LABEL_27;
                                        }
                                      }
                                      else
                                      {
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v30 = 0;
LABEL_25:

  return v30;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  if (whichOneof_Actionfailurefailure == 1)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 2)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 3)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 4)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 5)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 6)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 7)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 8)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 9)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 10)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 11)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 12)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 13)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 14)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 15)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Actionfailurefailure = self->_whichOneof_Actionfailurefailure;
  }
  if (whichOneof_Actionfailurefailure == 16) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(IFTSchemaIFTActionFailureFailure *)self actionFailureDeveloperDefinedError];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(IFTSchemaIFTActionFailureFailure *)self actionFailureDeveloperDefinedError];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionFailureFailureReadFrom(self, (uint64_t)a3);
}

- (void)deleteActionFailureDeveloperDefinedError
{
  if (self->_whichOneof_Actionfailurefailure == 17)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_actionFailureDeveloperDefinedError = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTActionFailureDeveloperDefinedError)actionFailureDeveloperDefinedError
{
  if (self->_whichOneof_Actionfailurefailure == 17) {
    unint64_t v2 = self->_actionFailureDeveloperDefinedError;
  }
  else {
    unint64_t v2 = 0;
  }
  return v2;
}

- (void)setActionFailureDeveloperDefinedError:(id)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  unint64_t v3 = 17;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichOneof_Actionfailurefailure = v3;
  objc_storeStrong((id *)&self->_actionFailureDeveloperDefinedError, a3);
}

- (void)deleteDeveloperDefinedError
{
  if (self->_whichOneof_Actionfailurefailure == 16)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int developerDefinedError = 0;
  }
}

- (BOOL)developerDefinedError
{
  return self->_whichOneof_Actionfailurefailure == 16 && self->_developerDefinedError;
}

- (void)setDeveloperDefinedError:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 16;
  self->_int developerDefinedError = a3;
}

- (void)deleteNoMatchingTool
{
  if (self->_whichOneof_Actionfailurefailure == 15)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int noMatchingTool = 0;
  }
}

- (BOOL)noMatchingTool
{
  return self->_whichOneof_Actionfailurefailure == 15 && self->_noMatchingTool;
}

- (void)setNoMatchingTool:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 15;
  self->_int noMatchingTool = a3;
}

- (void)deleteValueDisambiguationRejected
{
  if (self->_whichOneof_Actionfailurefailure == 14)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int valueDisambiguationRejected = 0;
  }
}

- (BOOL)valueDisambiguationRejected
{
  return self->_whichOneof_Actionfailurefailure == 14 && self->_valueDisambiguationRejected;
}

- (void)setValueDisambiguationRejected:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 14;
  self->_int valueDisambiguationRejected = a3;
}

- (void)deleteActionCanceled
{
  if (self->_whichOneof_Actionfailurefailure == 13)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int actionCanceled = 0;
  }
}

- (BOOL)actionCanceled
{
  return self->_whichOneof_Actionfailurefailure == 13 && self->_actionCanceled;
}

- (void)setActionCanceled:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 13;
  self->_int actionCanceled = a3;
}

- (void)deleteUnableToUndo
{
  if (self->_whichOneof_Actionfailurefailure == 12)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int unableToUndo = 0;
  }
}

- (BOOL)unableToUndo
{
  return self->_whichOneof_Actionfailurefailure == 12 && self->_unableToUndo;
}

- (void)setUnableToUndo:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 12;
  self->_int unableToUndo = a3;
}

- (void)deleteActionNotAllowed
{
  if (self->_whichOneof_Actionfailurefailure == 11)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int actionNotAllowed = 0;
  }
}

- (BOOL)actionNotAllowed
{
  return self->_whichOneof_Actionfailurefailure == 11 && self->_actionNotAllowed;
}

- (void)setActionNotAllowed:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 11;
  self->_int actionNotAllowed = a3;
}

- (void)deleteEntityNotFound
{
  if (self->_whichOneof_Actionfailurefailure == 10)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int entityNotFound = 0;
  }
}

- (BOOL)entityNotFound
{
  return self->_whichOneof_Actionfailurefailure == 10 && self->_entityNotFound;
}

- (void)setEntityNotFound:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 10;
  self->_int entityNotFound = a3;
}

- (void)deleteFeatureCurrentlyRestricted
{
  if (self->_whichOneof_Actionfailurefailure == 9)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int featureCurrentlyRestricted = 0;
  }
}

- (BOOL)featureCurrentlyRestricted
{
  return self->_whichOneof_Actionfailurefailure == 9 && self->_featureCurrentlyRestricted;
}

- (void)setFeatureCurrentlyRestricted:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 9;
  self->_int featureCurrentlyRestricted = a3;
}

- (void)deleteUnsupportedOnDevice
{
  if (self->_whichOneof_Actionfailurefailure == 8)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int unsupportedOnDevice = 0;
  }
}

- (BOOL)unsupportedOnDevice
{
  return self->_whichOneof_Actionfailurefailure == 8 && self->_unsupportedOnDevice;
}

- (void)setUnsupportedOnDevice:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 8;
  self->_int unsupportedOnDevice = a3;
}

- (void)deletePartialFailure
{
  if (self->_whichOneof_Actionfailurefailure == 7)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int partialFailure = 0;
  }
}

- (BOOL)partialFailure
{
  return self->_whichOneof_Actionfailurefailure == 7 && self->_partialFailure;
}

- (void)setPartialFailure:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 7;
  self->_int partialFailure = a3;
}

- (void)deleteNetworkFailure
{
  if (self->_whichOneof_Actionfailurefailure == 6)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int networkFailure = 0;
  }
}

- (BOOL)networkFailure
{
  return self->_whichOneof_Actionfailurefailure == 6 && self->_networkFailure;
}

- (void)setNetworkFailure:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 6;
  self->_int networkFailure = a3;
}

- (void)deleteBluetoothDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 5)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int bluetoothDisabled = 0;
  }
}

- (BOOL)bluetoothDisabled
{
  return self->_whichOneof_Actionfailurefailure == 5 && self->_bluetoothDisabled;
}

- (void)setBluetoothDisabled:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 5;
  self->_int bluetoothDisabled = a3;
}

- (void)deleteWifiDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 4)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int wifiDisabled = 0;
  }
}

- (BOOL)wifiDisabled
{
  return self->_whichOneof_Actionfailurefailure == 4 && self->_wifiDisabled;
}

- (void)setWifiDisabled:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 4;
  self->_int wifiDisabled = a3;
}

- (void)deleteLocationDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 3)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int locationDisabled = 0;
  }
}

- (BOOL)locationDisabled
{
  return self->_whichOneof_Actionfailurefailure == 3 && self->_locationDisabled;
}

- (void)setLocationDisabled:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int preciseLocationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 3;
  self->_int locationDisabled = a3;
}

- (void)deletePreciseLocationDisabled
{
  if (self->_whichOneof_Actionfailurefailure == 2)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int preciseLocationDisabled = 0;
  }
}

- (BOOL)preciseLocationDisabled
{
  return self->_whichOneof_Actionfailurefailure == 2 && self->_preciseLocationDisabled;
}

- (void)setPreciseLocationDisabled:(BOOL)a3
{
  self->_int preflightCheckFailure = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 2;
  self->_int preciseLocationDisabled = a3;
}

- (void)deletePreflightCheckFailure
{
  if (self->_whichOneof_Actionfailurefailure == 1)
  {
    self->_unint64_t whichOneof_Actionfailurefailure = 0;
    self->_int preflightCheckFailure = 0;
  }
}

- (BOOL)preflightCheckFailure
{
  return self->_whichOneof_Actionfailurefailure == 1 && self->_preflightCheckFailure;
}

- (void)setPreflightCheckFailure:(BOOL)a3
{
  self->_int preciseLocationDisabled = 0;
  self->_int locationDisabled = 0;
  self->_int wifiDisabled = 0;
  self->_int bluetoothDisabled = 0;
  self->_int networkFailure = 0;
  self->_int partialFailure = 0;
  self->_int unsupportedOnDevice = 0;
  self->_int featureCurrentlyRestricted = 0;
  self->_int entityNotFound = 0;
  self->_int actionNotAllowed = 0;
  self->_int unableToUndo = 0;
  self->_int actionCanceled = 0;
  self->_int valueDisambiguationRejected = 0;
  self->_int noMatchingTool = 0;
  self->_int developerDefinedError = 0;
  actionFailureDeveloperDefinedError = self->_actionFailureDeveloperDefinedError;
  self->_actionFailureDeveloperDefinedError = 0;

  self->_unint64_t whichOneof_Actionfailurefailure = 1;
  self->_int preflightCheckFailure = a3;
}

@end