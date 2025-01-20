@interface ORCHSchemaORCHDeviceDynamicContext
- (BOOL)hasAcceptProceedGesture;
- (BOOL)hasBluetoothState;
- (BOOL)hasDeclineDismissGesture;
- (BOOL)hasFlashlightLevel;
- (BOOL)hasHeadGesturesEnabled;
- (BOOL)hasHeadGesturesSupported;
- (BOOL)hasIsChatGPTEnabled;
- (BOOL)hasIsWifiEnabled;
- (BOOL)hasMotionActivity;
- (BOOL)hasThermalState;
- (BOOL)hasTimeSinceAssistantDaemonStartedInMs;
- (BOOL)headGesturesEnabled;
- (BOOL)headGesturesSupported;
- (BOOL)isChatGPTEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWifiEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHDeviceDynamicContext)initWithDictionary:(id)a3;
- (ORCHSchemaORCHDeviceDynamicContext)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)acceptProceedGesture;
- (int)bluetoothState;
- (int)declineDismissGesture;
- (int)flashlightLevel;
- (int)motionActivity;
- (int)thermalState;
- (unint64_t)hash;
- (unint64_t)timeSinceAssistantDaemonStartedInMs;
- (void)deleteAcceptProceedGesture;
- (void)deleteBluetoothState;
- (void)deleteDeclineDismissGesture;
- (void)deleteFlashlightLevel;
- (void)deleteHeadGesturesEnabled;
- (void)deleteHeadGesturesSupported;
- (void)deleteIsChatGPTEnabled;
- (void)deleteIsWifiEnabled;
- (void)deleteMotionActivity;
- (void)deleteThermalState;
- (void)deleteTimeSinceAssistantDaemonStartedInMs;
- (void)setAcceptProceedGesture:(int)a3;
- (void)setBluetoothState:(int)a3;
- (void)setDeclineDismissGesture:(int)a3;
- (void)setFlashlightLevel:(int)a3;
- (void)setHasAcceptProceedGesture:(BOOL)a3;
- (void)setHasBluetoothState:(BOOL)a3;
- (void)setHasDeclineDismissGesture:(BOOL)a3;
- (void)setHasFlashlightLevel:(BOOL)a3;
- (void)setHasHeadGesturesEnabled:(BOOL)a3;
- (void)setHasHeadGesturesSupported:(BOOL)a3;
- (void)setHasIsChatGPTEnabled:(BOOL)a3;
- (void)setHasIsWifiEnabled:(BOOL)a3;
- (void)setHasMotionActivity:(BOOL)a3;
- (void)setHasThermalState:(BOOL)a3;
- (void)setHasTimeSinceAssistantDaemonStartedInMs:(BOOL)a3;
- (void)setHeadGesturesEnabled:(BOOL)a3;
- (void)setHeadGesturesSupported:(BOOL)a3;
- (void)setIsChatGPTEnabled:(BOOL)a3;
- (void)setIsWifiEnabled:(BOOL)a3;
- (void)setMotionActivity:(int)a3;
- (void)setThermalState:(int)a3;
- (void)setTimeSinceAssistantDaemonStartedInMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHDeviceDynamicContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isChatGPTEnabled
{
  return self->_isChatGPTEnabled;
}

- (int)flashlightLevel
{
  return self->_flashlightLevel;
}

- (int)bluetoothState
{
  return self->_bluetoothState;
}

- (BOOL)isWifiEnabled
{
  return self->_isWifiEnabled;
}

- (int)declineDismissGesture
{
  return self->_declineDismissGesture;
}

- (int)acceptProceedGesture
{
  return self->_acceptProceedGesture;
}

- (BOOL)headGesturesEnabled
{
  return self->_headGesturesEnabled;
}

- (BOOL)headGesturesSupported
{
  return self->_headGesturesSupported;
}

- (unint64_t)timeSinceAssistantDaemonStartedInMs
{
  return self->_timeSinceAssistantDaemonStartedInMs;
}

- (int)motionActivity
{
  return self->_motionActivity;
}

- (int)thermalState
{
  return self->_thermalState;
}

- (ORCHSchemaORCHDeviceDynamicContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ORCHSchemaORCHDeviceDynamicContext;
  v5 = [(ORCHSchemaORCHDeviceDynamicContext *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"thermalState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setThermalState:](v5, "setThermalState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"motionActivity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setMotionActivity:](v5, "setMotionActivity:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"timeSinceAssistantDaemonStartedInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setTimeSinceAssistantDaemonStartedInMs:](v5, "setTimeSinceAssistantDaemonStartedInMs:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"headGesturesSupported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setHeadGesturesSupported:](v5, "setHeadGesturesSupported:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"headGesturesEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setHeadGesturesEnabled:](v5, "setHeadGesturesEnabled:", [v10 BOOLValue]);
    }
    v11 = objc_msgSend(v4, "objectForKeyedSubscript:", @"acceptProceedGesture", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setAcceptProceedGesture:](v5, "setAcceptProceedGesture:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"declineDismissGesture"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setDeclineDismissGesture:](v5, "setDeclineDismissGesture:", [v12 intValue]);
    }
    v23 = v6;
    v13 = [v4 objectForKeyedSubscript:@"isWifiEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setIsWifiEnabled:](v5, "setIsWifiEnabled:", [v13 BOOLValue]);
    }
    v21 = v9;
    v22 = v7;
    v14 = [v4 objectForKeyedSubscript:@"bluetoothState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setBluetoothState:](v5, "setBluetoothState:", [v14 intValue]);
    }
    v15 = v8;
    v16 = [v4 objectForKeyedSubscript:@"flashlightLevel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setFlashlightLevel:](v5, "setFlashlightLevel:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"isChatGPTEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHDeviceDynamicContext setIsChatGPTEnabled:](v5, "setIsChatGPTEnabled:", [v17 BOOLValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHDeviceDynamicContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHDeviceDynamicContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHDeviceDynamicContext *)self dictionaryRepresentation];
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
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x20) != 0)
  {
    int v5 = [(ORCHSchemaORCHDeviceDynamicContext *)self acceptProceedGesture];
    if (v5 == 1) {
      v6 = @"ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE";
    }
    else {
      v6 = @"ORCHHEADGESTUREMAPPING_UNKNOWN";
    }
    if (v5 == 2) {
      uint64_t v7 = @"ORCHHEADGESTUREMAPPING_UP_AND_DOWN";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"acceptProceedGesture"];
    __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
    if ((v4 & 0x100) == 0)
    {
LABEL_3:
      if ((v4 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = [(ORCHSchemaORCHDeviceDynamicContext *)self bluetoothState] - 1;
  if (v8 > 5) {
    v9 = @"ORCHBLUETOOTHSTATE_UNKNOWN";
  }
  else {
    v9 = off_1E5EB3888[v8];
  }
  [v3 setObject:v9 forKeyedSubscript:@"bluetoothState"];
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_4:
    if ((v4 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_17:
  int v10 = [(ORCHSchemaORCHDeviceDynamicContext *)self declineDismissGesture];
  if (v10 == 1) {
    v11 = @"ORCHHEADGESTUREMAPPING_SIDE_TO_SIDE";
  }
  else {
    v11 = @"ORCHHEADGESTUREMAPPING_UNKNOWN";
  }
  if (v10 == 2) {
    v12 = @"ORCHHEADGESTUREMAPPING_UP_AND_DOWN";
  }
  else {
    v12 = v11;
  }
  [v3 setObject:v12 forKeyedSubscript:@"declineDismissGesture"];
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x200) != 0)
  {
LABEL_24:
    unsigned int v13 = [(ORCHSchemaORCHDeviceDynamicContext *)self flashlightLevel] - 1;
    if (v13 > 4) {
      v14 = @"ORCHFLASHLIGHTLEVEL_UNKNOWN";
    }
    else {
      v14 = off_1E5EB38B8[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"flashlightLevel"];
    __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  }
LABEL_28:
  if ((v4 & 0x10) != 0)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHDeviceDynamicContext headGesturesEnabled](self, "headGesturesEnabled"));
    [v3 setObject:v17 forKeyedSubscript:@"headGesturesEnabled"];

    __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
    if ((v4 & 8) == 0)
    {
LABEL_30:
      if ((v4 & 0x400) == 0) {
        goto LABEL_31;
      }
      goto LABEL_41;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_30;
  }
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHDeviceDynamicContext headGesturesSupported](self, "headGesturesSupported"));
  [v3 setObject:v18 forKeyedSubscript:@"headGesturesSupported"];

  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x400) == 0)
  {
LABEL_31:
    if ((v4 & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_42;
  }
LABEL_41:
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHDeviceDynamicContext isChatGPTEnabled](self, "isChatGPTEnabled"));
  [v3 setObject:v19 forKeyedSubscript:@"isChatGPTEnabled"];

  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_32:
    if ((v4 & 2) == 0) {
      goto LABEL_33;
    }
    goto LABEL_43;
  }
LABEL_42:
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHDeviceDynamicContext isWifiEnabled](self, "isWifiEnabled"));
  [v3 setObject:v20 forKeyedSubscript:@"isWifiEnabled"];

  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 2) == 0)
  {
LABEL_33:
    if ((v4 & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_47;
  }
LABEL_43:
  unsigned int v21 = [(ORCHSchemaORCHDeviceDynamicContext *)self motionActivity] - 1;
  if (v21 > 4) {
    v22 = @"ORCHMOTIONACTIVITY_UNKNOWN";
  }
  else {
    v22 = off_1E5EB38E0[v21];
  }
  [v3 setObject:v22 forKeyedSubscript:@"motionActivity"];
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 1) == 0)
  {
LABEL_34:
    if ((v4 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_47:
  unsigned int v23 = [(ORCHSchemaORCHDeviceDynamicContext *)self thermalState] - 1;
  if (v23 > 3) {
    objc_super v24 = @"DEVICETHERMALSTATE_UNKNOWN";
  }
  else {
    objc_super v24 = off_1E5EB3908[v23];
  }
  [v3 setObject:v24 forKeyedSubscript:@"thermalState"];
  if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 4) == 0) {
    goto LABEL_36;
  }
LABEL_35:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ORCHSchemaORCHDeviceDynamicContext timeSinceAssistantDaemonStartedInMs](self, "timeSinceAssistantDaemonStartedInMs"));
  [v3 setObject:v15 forKeyedSubscript:@"timeSinceAssistantDaemonStartedInMs"];

LABEL_36:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 v2 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if (v2)
  {
    uint64_t v3 = 2654435761 * self->_thermalState;
    if ((v2 & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_motionActivity;
      if ((v2 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((v2 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((v2 & 4) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_timeSinceAssistantDaemonStartedInMs;
    if ((v2 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v5 = 0;
  if ((v2 & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_headGesturesSupported;
    if ((v2 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((v2 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_headGesturesEnabled;
    if ((v2 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_acceptProceedGesture;
    if ((v2 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((v2 & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_declineDismissGesture;
    if ((v2 & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((v2 & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_isWifiEnabled;
    if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_bluetoothState;
    if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x200) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x400) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_flashlightLevel;
  if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x400) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_isChatGPTEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
  unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_46;
  }
  if (v5)
  {
    int thermalState = self->_thermalState;
    if (thermalState != [v4 thermalState]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_46;
  }
  if (v8)
  {
    int motionActivity = self->_motionActivity;
    if (motionActivity != [v4 motionActivity]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_46;
  }
  if (v10)
  {
    unint64_t timeSinceAssistantDaemonStartedInMs = self->_timeSinceAssistantDaemonStartedInMs;
    if (timeSinceAssistantDaemonStartedInMs != [v4 timeSinceAssistantDaemonStartedInMs]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_46;
  }
  if (v12)
  {
    int headGesturesSupported = self->_headGesturesSupported;
    if (headGesturesSupported != [v4 headGesturesSupported]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_46;
  }
  if (v14)
  {
    int headGesturesEnabled = self->_headGesturesEnabled;
    if (headGesturesEnabled != [v4 headGesturesEnabled]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_46;
  }
  if (v16)
  {
    int acceptProceedGesture = self->_acceptProceedGesture;
    if (acceptProceedGesture != [v4 acceptProceedGesture]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v18 = (v5 >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_46;
  }
  if (v18)
  {
    int declineDismissGesture = self->_declineDismissGesture;
    if (declineDismissGesture != [v4 declineDismissGesture]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v20 = (v5 >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_46;
  }
  if (v20)
  {
    int isWifiEnabled = self->_isWifiEnabled;
    if (isWifiEnabled != [v4 isWifiEnabled]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v22 = (v5 >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_46;
  }
  if (v22)
  {
    int bluetoothState = self->_bluetoothState;
    if (bluetoothState != [v4 bluetoothState]) {
      goto LABEL_46;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
  }
  int v24 = (v5 >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_46;
  }
  if (v24)
  {
    int flashlightLevel = self->_flashlightLevel;
    if (flashlightLevel == [v4 flashlightLevel])
    {
      unsigned int v5 = *(unsigned __int16 *)(&self->_isChatGPTEnabled + 1);
      unsigned int v6 = *(unsigned __int16 *)(v4 + 49);
      goto LABEL_42;
    }
LABEL_46:
    BOOL v28 = 0;
    goto LABEL_47;
  }
LABEL_42:
  int v26 = (v5 >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_46;
  }
  if (v26)
  {
    int isChatGPTEnabled = self->_isChatGPTEnabled;
    if (isChatGPTEnabled != [v4 isChatGPTEnabled]) {
      goto LABEL_46;
    }
  }
  BOOL v28 = 1;
LABEL_47:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x100) == 0)
  {
LABEL_10:
    if ((v4 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 v4 = *(_WORD *)(&self->_isChatGPTEnabled + 1);
  if ((v4 & 0x200) == 0)
  {
LABEL_11:
    if ((v4 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)(&self->_isChatGPTEnabled + 1) & 0x400) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHDeviceDynamicContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsChatGPTEnabled
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~0x400u;
}

- (void)setHasIsChatGPTEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFBFF | v3;
}

- (BOOL)hasIsChatGPTEnabled
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 10) & 1;
}

- (void)setIsChatGPTEnabled:(BOOL)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 0x400u;
  self->_int isChatGPTEnabled = a3;
}

- (void)deleteFlashlightLevel
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~0x200u;
}

- (void)setHasFlashlightLevel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFDFF | v3;
}

- (BOOL)hasFlashlightLevel
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 9) & 1;
}

- (void)setFlashlightLevel:(int)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 0x200u;
  self->_int flashlightLevel = a3;
}

- (void)deleteBluetoothState
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~0x100u;
}

- (void)setHasBluetoothState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFEFF | v3;
}

- (BOOL)hasBluetoothState
{
  return HIBYTE(*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1)) & 1;
}

- (void)setBluetoothState:(int)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 0x100u;
  self->_int bluetoothState = a3;
}

- (void)deleteIsWifiEnabled
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~0x80u;
}

- (void)setHasIsWifiEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFF7F | v3;
}

- (BOOL)hasIsWifiEnabled
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 7) & 1;
}

- (void)setIsWifiEnabled:(BOOL)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 0x80u;
  self->_int isWifiEnabled = a3;
}

- (void)deleteDeclineDismissGesture
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~0x40u;
}

- (void)setHasDeclineDismissGesture:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFFBF | v3;
}

- (BOOL)hasDeclineDismissGesture
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 6) & 1;
}

- (void)setDeclineDismissGesture:(int)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 0x40u;
  self->_int declineDismissGesture = a3;
}

- (void)deleteAcceptProceedGesture
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~0x20u;
}

- (void)setHasAcceptProceedGesture:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFFDF | v3;
}

- (BOOL)hasAcceptProceedGesture
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 5) & 1;
}

- (void)setAcceptProceedGesture:(int)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 0x20u;
  self->_int acceptProceedGesture = a3;
}

- (void)deleteHeadGesturesEnabled
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~0x10u;
}

- (void)setHasHeadGesturesEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFFEF | v3;
}

- (BOOL)hasHeadGesturesEnabled
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 4) & 1;
}

- (void)setHeadGesturesEnabled:(BOOL)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 0x10u;
  self->_int headGesturesEnabled = a3;
}

- (void)deleteHeadGesturesSupported
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~8u;
}

- (void)setHasHeadGesturesSupported:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFFF7 | v3;
}

- (BOOL)hasHeadGesturesSupported
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 3) & 1;
}

- (void)setHeadGesturesSupported:(BOOL)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 8u;
  self->_int headGesturesSupported = a3;
}

- (void)deleteTimeSinceAssistantDaemonStartedInMs
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~4u;
}

- (void)setHasTimeSinceAssistantDaemonStartedInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFFFB | v3;
}

- (BOOL)hasTimeSinceAssistantDaemonStartedInMs
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 2) & 1;
}

- (void)setTimeSinceAssistantDaemonStartedInMs:(unint64_t)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 4u;
  self->_unint64_t timeSinceAssistantDaemonStartedInMs = a3;
}

- (void)deleteMotionActivity
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~2u;
}

- (void)setHasMotionActivity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFFFD | v3;
}

- (BOOL)hasMotionActivity
{
  return (*(unsigned __int16 *)(&self->_isChatGPTEnabled + 1) >> 1) & 1;
}

- (void)setMotionActivity:(int)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 2u;
  self->_int motionActivity = a3;
}

- (void)deleteThermalState
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) &= ~1u;
}

- (void)setHasThermalState:(BOOL)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) = *(_WORD *)(&self->_isChatGPTEnabled + 1) & 0xFFFE | a3;
}

- (BOOL)hasThermalState
{
  return *(_WORD *)(&self->_isChatGPTEnabled + 1) & 1;
}

- (void)setThermalState:(int)a3
{
  *(_WORD *)(&self->_isChatGPTEnabled + 1) |= 1u;
  self->_int thermalState = a3;
}

@end