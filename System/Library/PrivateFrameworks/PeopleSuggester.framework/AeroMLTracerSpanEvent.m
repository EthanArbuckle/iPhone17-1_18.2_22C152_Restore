@interface AeroMLTracerSpanEvent
+ (Class)attributesType;
+ (Class)debugEventsType;
+ (Class)errorEventsType;
+ (Class)infoEventsType;
+ (Class)warningEventsType;
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasEndMemoryLevelInKB;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorString;
- (BOOL)hasGcdQueueName;
- (BOOL)hasIntervalInMilliSeconds;
- (BOOL)hasMemoryLevelDeltaInKB;
- (BOOL)hasName;
- (BOOL)hasParentSpanId;
- (BOOL)hasPrivatizedEndTime;
- (BOOL)hasPrivatizedStartTime;
- (BOOL)hasProcessName;
- (BOOL)hasProjectName;
- (BOOL)hasQosClassName;
- (BOOL)hasRelativePriority;
- (BOOL)hasSpanId;
- (BOOL)hasStartMemoryLevelInKB;
- (BOOL)hasTestKey;
- (BOOL)hasTraceId;
- (BOOL)hasTrialDeploymentId;
- (BOOL)hasTrialExperimentId;
- (BOOL)hasTrialTreatmentId;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)attributes;
- (NSMutableArray)debugEvents;
- (NSMutableArray)errorEvents;
- (NSMutableArray)infoEvents;
- (NSMutableArray)warningEvents;
- (NSString)deviceIdentifier;
- (NSString)errorString;
- (NSString)gcdQueueName;
- (NSString)name;
- (NSString)parentSpanId;
- (NSString)processName;
- (NSString)projectName;
- (NSString)qosClassName;
- (NSString)relativePriority;
- (NSString)spanId;
- (NSString)testKey;
- (NSString)traceId;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (NSString)version;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugEventsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorEventsAtIndex:(unint64_t)a3;
- (id)infoEventsAtIndex:(unint64_t)a3;
- (id)warningEventsAtIndex:(unint64_t)a3;
- (unint64_t)attributesCount;
- (unint64_t)debugEventsCount;
- (unint64_t)errorEventsCount;
- (unint64_t)hash;
- (unint64_t)infoEventsCount;
- (unint64_t)warningEventsCount;
- (unsigned)endMemoryLevelInKB;
- (unsigned)errorCode;
- (unsigned)intervalInMilliSeconds;
- (unsigned)memoryLevelDeltaInKB;
- (unsigned)privatizedEndTime;
- (unsigned)privatizedStartTime;
- (unsigned)startMemoryLevelInKB;
- (void)addAttributes:(id)a3;
- (void)addDebugEvents:(id)a3;
- (void)addErrorEvents:(id)a3;
- (void)addInfoEvents:(id)a3;
- (void)addWarningEvents:(id)a3;
- (void)clearAttributes;
- (void)clearDebugEvents;
- (void)clearErrorEvents;
- (void)clearInfoEvents;
- (void)clearWarningEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setDebugEvents:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setEndMemoryLevelInKB:(unsigned int)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorEvents:(id)a3;
- (void)setErrorString:(id)a3;
- (void)setGcdQueueName:(id)a3;
- (void)setHasEndMemoryLevelInKB:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasIntervalInMilliSeconds:(BOOL)a3;
- (void)setHasMemoryLevelDeltaInKB:(BOOL)a3;
- (void)setHasPrivatizedEndTime:(BOOL)a3;
- (void)setHasPrivatizedStartTime:(BOOL)a3;
- (void)setHasStartMemoryLevelInKB:(BOOL)a3;
- (void)setInfoEvents:(id)a3;
- (void)setIntervalInMilliSeconds:(unsigned int)a3;
- (void)setMemoryLevelDeltaInKB:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setParentSpanId:(id)a3;
- (void)setPrivatizedEndTime:(unsigned int)a3;
- (void)setPrivatizedStartTime:(unsigned int)a3;
- (void)setProcessName:(id)a3;
- (void)setProjectName:(id)a3;
- (void)setQosClassName:(id)a3;
- (void)setRelativePriority:(id)a3;
- (void)setSpanId:(id)a3;
- (void)setStartMemoryLevelInKB:(unsigned int)a3;
- (void)setTestKey:(id)a3;
- (void)setTraceId:(id)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWarningEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AeroMLTracerSpanEvent

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasTestKey
{
  return self->_testKey != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasTrialDeploymentId
{
  return self->_trialDeploymentId != 0;
}

- (BOOL)hasTrialExperimentId
{
  return self->_trialExperimentId != 0;
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (BOOL)hasTraceId
{
  return self->_traceId != 0;
}

- (BOOL)hasParentSpanId
{
  return self->_parentSpanId != 0;
}

- (BOOL)hasSpanId
{
  return self->_spanId != 0;
}

- (void)setPrivatizedStartTime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_privatizedStartTime = a3;
}

- (void)setHasPrivatizedStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPrivatizedStartTime
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPrivatizedEndTime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_privatizedEndTime = a3;
}

- (void)setHasPrivatizedEndTime:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPrivatizedEndTime
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIntervalInMilliSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_intervalInMilliSeconds = a3;
}

- (void)setHasIntervalInMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntervalInMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorString
{
  return self->_errorString != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartMemoryLevelInKB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_startMemoryLevelInKB = a3;
}

- (void)setHasStartMemoryLevelInKB:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStartMemoryLevelInKB
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setEndMemoryLevelInKB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endMemoryLevelInKB = a3;
}

- (void)setHasEndMemoryLevelInKB:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndMemoryLevelInKB
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMemoryLevelDeltaInKB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_memoryLevelDeltaInKB = a3;
}

- (void)setHasMemoryLevelDeltaInKB:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMemoryLevelDeltaInKB
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (BOOL)hasGcdQueueName
{
  return self->_gcdQueueName != 0;
}

- (BOOL)hasQosClassName
{
  return self->_qosClassName != 0;
}

- (BOOL)hasRelativePriority
{
  return self->_relativePriority != 0;
}

- (BOOL)hasProjectName
{
  return self->_projectName != 0;
}

- (void)clearAttributes
{
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }
  [(NSMutableArray *)attributes addObject:v4];
}

- (unint64_t)attributesCount
{
  return [(NSMutableArray *)self->_attributes count];
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attributes objectAtIndex:a3];
}

+ (Class)attributesType
{
  return (Class)objc_opt_class();
}

- (void)clearInfoEvents
{
}

- (void)addInfoEvents:(id)a3
{
  id v4 = a3;
  infoEvents = self->_infoEvents;
  id v8 = v4;
  if (!infoEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_infoEvents;
    self->_infoEvents = v6;

    id v4 = v8;
    infoEvents = self->_infoEvents;
  }
  [(NSMutableArray *)infoEvents addObject:v4];
}

- (unint64_t)infoEventsCount
{
  return [(NSMutableArray *)self->_infoEvents count];
}

- (id)infoEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_infoEvents objectAtIndex:a3];
}

+ (Class)infoEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearWarningEvents
{
}

- (void)addWarningEvents:(id)a3
{
  id v4 = a3;
  warningEvents = self->_warningEvents;
  id v8 = v4;
  if (!warningEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_warningEvents;
    self->_warningEvents = v6;

    id v4 = v8;
    warningEvents = self->_warningEvents;
  }
  [(NSMutableArray *)warningEvents addObject:v4];
}

- (unint64_t)warningEventsCount
{
  return [(NSMutableArray *)self->_warningEvents count];
}

- (id)warningEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_warningEvents objectAtIndex:a3];
}

+ (Class)warningEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearDebugEvents
{
}

- (void)addDebugEvents:(id)a3
{
  id v4 = a3;
  debugEvents = self->_debugEvents;
  id v8 = v4;
  if (!debugEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_debugEvents;
    self->_debugEvents = v6;

    id v4 = v8;
    debugEvents = self->_debugEvents;
  }
  [(NSMutableArray *)debugEvents addObject:v4];
}

- (unint64_t)debugEventsCount
{
  return [(NSMutableArray *)self->_debugEvents count];
}

- (id)debugEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_debugEvents objectAtIndex:a3];
}

+ (Class)debugEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearErrorEvents
{
}

- (void)addErrorEvents:(id)a3
{
  id v4 = a3;
  errorEvents = self->_errorEvents;
  id v8 = v4;
  if (!errorEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_errorEvents;
    self->_errorEvents = v6;

    id v4 = v8;
    errorEvents = self->_errorEvents;
  }
  [(NSMutableArray *)errorEvents addObject:v4];
}

- (unint64_t)errorEventsCount
{
  return [(NSMutableArray *)self->_errorEvents count];
}

- (id)errorEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_errorEvents objectAtIndex:a3];
}

+ (Class)errorEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AeroMLTracerSpanEvent;
  id v4 = [(AeroMLTracerSpanEvent *)&v8 description];
  v5 = [(AeroMLTracerSpanEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    [v3 setObject:deviceIdentifier forKey:@"deviceIdentifier"];
  }
  testKey = self->_testKey;
  if (testKey) {
    [v4 setObject:testKey forKey:@"testKey"];
  }
  versiouint64_t n = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  trialDeploymentId = self->_trialDeploymentId;
  if (trialDeploymentId) {
    [v4 setObject:trialDeploymentId forKey:@"trialDeploymentId"];
  }
  trialExperimentId = self->_trialExperimentId;
  if (trialExperimentId) {
    [v4 setObject:trialExperimentId forKey:@"trialExperimentId"];
  }
  trialTreatmentId = self->_trialTreatmentId;
  if (trialTreatmentId) {
    [v4 setObject:trialTreatmentId forKey:@"trialTreatmentId"];
  }
  traceId = self->_traceId;
  if (traceId) {
    [v4 setObject:traceId forKey:@"traceId"];
  }
  parentSpanId = self->_parentSpanId;
  if (parentSpanId) {
    [v4 setObject:parentSpanId forKey:@"parentSpanId"];
  }
  spanId = self->_spanId;
  if (spanId) {
    [v4 setObject:spanId forKey:@"spanId"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v62 = [NSNumber numberWithUnsignedInt:self->_privatizedStartTime];
    [v4 setObject:v62 forKey:@"privatizedStartTime"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v63 = [NSNumber numberWithUnsignedInt:self->_privatizedEndTime];
  [v4 setObject:v63 forKey:@"privatizedEndTime"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_24:
    v16 = [NSNumber numberWithUnsignedInt:self->_intervalInMilliSeconds];
    [v4 setObject:v16 forKey:@"intervalInMilliSeconds"];
  }
LABEL_25:
  errorString = self->_errorString;
  if (errorString) {
    [v4 setObject:errorString forKey:@"errorString"];
  }
  char v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    v64 = [NSNumber numberWithUnsignedInt:self->_errorCode];
    [v4 setObject:v64 forKey:@"errorCode"];

    char v18 = (char)self->_has;
    if ((v18 & 0x40) == 0)
    {
LABEL_29:
      if ((v18 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_93;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_29;
  }
  v65 = [NSNumber numberWithUnsignedInt:self->_startMemoryLevelInKB];
  [v4 setObject:v65 forKey:@"startMemoryLevelInKB"];

  char v18 = (char)self->_has;
  if ((v18 & 1) == 0)
  {
LABEL_30:
    if ((v18 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_93:
  v66 = [NSNumber numberWithUnsignedInt:self->_endMemoryLevelInKB];
  [v4 setObject:v66 forKey:@"endMemoryLevelInKB"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_31:
    v19 = [NSNumber numberWithUnsignedInt:self->_memoryLevelDeltaInKB];
    [v4 setObject:v19 forKey:@"memoryLevelDeltaInKB"];
  }
LABEL_32:
  processName = self->_processName;
  if (processName) {
    [v4 setObject:processName forKey:@"processName"];
  }
  gcdQueueName = self->_gcdQueueName;
  if (gcdQueueName) {
    [v4 setObject:gcdQueueName forKey:@"gcdQueueName"];
  }
  qosClassName = self->_qosClassName;
  if (qosClassName) {
    [v4 setObject:qosClassName forKey:@"qosClassName"];
  }
  relativePriority = self->_relativePriority;
  if (relativePriority) {
    [v4 setObject:relativePriority forKey:@"relativePriority"];
  }
  projectName = self->_projectName;
  if (projectName) {
    [v4 setObject:projectName forKey:@"projectName"];
  }
  if ([(NSMutableArray *)self->_attributes count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v26 = self->_attributes;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v83 objects:v91 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v84 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v83 + 1) + 8 * i) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v83 objects:v91 count:16];
      }
      while (v28);
    }

    [v4 setObject:v25 forKey:@"attributes"];
  }
  if ([(NSMutableArray *)self->_infoEvents count])
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_infoEvents, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v33 = self->_infoEvents;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v79 objects:v90 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v80 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v79 + 1) + 8 * j) dictionaryRepresentation];
          [v32 addObject:v38];
        }
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v79 objects:v90 count:16];
      }
      while (v35);
    }

    [v4 setObject:v32 forKey:@"infoEvents"];
  }
  if ([(NSMutableArray *)self->_warningEvents count])
  {
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_warningEvents, "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v40 = self->_warningEvents;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v75 objects:v89 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v76;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v76 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v75 + 1) + 8 * k) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v75 objects:v89 count:16];
      }
      while (v42);
    }

    [v4 setObject:v39 forKey:@"warningEvents"];
  }
  if ([(NSMutableArray *)self->_debugEvents count])
  {
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_debugEvents, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v47 = self->_debugEvents;
    uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v71 objects:v88 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v72;
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v72 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [*(id *)(*((void *)&v71 + 1) + 8 * m) dictionaryRepresentation];
          [v46 addObject:v52];
        }
        uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v71 objects:v88 count:16];
      }
      while (v49);
    }

    [v4 setObject:v46 forKey:@"debugEvents"];
  }
  if ([(NSMutableArray *)self->_errorEvents count])
  {
    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_errorEvents, "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v54 = self->_errorEvents;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v67 objects:v87 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v68;
      do
      {
        for (uint64_t n = 0; n != v56; ++n)
        {
          if (*(void *)v68 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * n), "dictionaryRepresentation", (void)v67);
          [v53 addObject:v59];
        }
        uint64_t v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v67 objects:v87 count:16];
      }
      while (v56);
    }

    [v4 setObject:v53 forKey:@"errorEvents"];
  }
  id v60 = v4;

  return v60;
}

- (BOOL)readFrom:(id)a3
{
  return AeroMLTracerSpanEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_deviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_testKey) {
    PBDataWriterWriteStringField();
  }
  if (self->_version) {
    PBDataWriterWriteStringField();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialDeploymentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialExperimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trialTreatmentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_traceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentSpanId) {
    PBDataWriterWriteStringField();
  }
  if (self->_spanId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_errorString) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_processName) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_33:
      if ((v6 & 8) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_34:
  }
    PBDataWriterWriteUint32Field();
LABEL_35:
  if (self->_gcdQueueName) {
    PBDataWriterWriteStringField();
  }
  if (self->_qosClassName) {
    PBDataWriterWriteStringField();
  }
  if (self->_relativePriority) {
    PBDataWriterWriteStringField();
  }
  if (self->_projectName) {
    PBDataWriterWriteStringField();
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v7 = self->_attributes;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v12 = self->_infoEvents;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v17 = self->_warningEvents;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v22 = self->_debugEvents;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v24);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v27 = self->_errorEvents;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v29);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v27 = v4;
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v4, "setDeviceIdentifier:");
    id v4 = v27;
  }
  if (self->_testKey)
  {
    objc_msgSend(v27, "setTestKey:");
    id v4 = v27;
  }
  if (self->_version)
  {
    objc_msgSend(v27, "setVersion:");
    id v4 = v27;
  }
  if (self->_name)
  {
    objc_msgSend(v27, "setName:");
    id v4 = v27;
  }
  if (self->_trialDeploymentId)
  {
    objc_msgSend(v27, "setTrialDeploymentId:");
    id v4 = v27;
  }
  if (self->_trialExperimentId)
  {
    objc_msgSend(v27, "setTrialExperimentId:");
    id v4 = v27;
  }
  if (self->_trialTreatmentId)
  {
    objc_msgSend(v27, "setTrialTreatmentId:");
    id v4 = v27;
  }
  if (self->_traceId)
  {
    objc_msgSend(v27, "setTraceId:");
    id v4 = v27;
  }
  if (self->_parentSpanId)
  {
    objc_msgSend(v27, "setParentSpanId:");
    id v4 = v27;
  }
  if (self->_spanId)
  {
    objc_msgSend(v27, "setSpanId:");
    id v4 = v27;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_privatizedStartTime;
    *((unsigned char *)v4 + 208) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v4 + 24) = self->_privatizedEndTime;
  *((unsigned char *)v4 + 208) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_24:
    *((_DWORD *)v4 + 18) = self->_intervalInMilliSeconds;
    *((unsigned char *)v4 + 208) |= 4u;
  }
LABEL_25:
  if (self->_errorString)
  {
    objc_msgSend(v27, "setErrorString:");
    id v4 = v27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_errorCode;
    *((unsigned char *)v4 + 208) |= 2u;
  }
  if (self->_processName)
  {
    objc_msgSend(v27, "setProcessName:");
    id v4 = v27;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_startMemoryLevelInKB;
    *((unsigned char *)v4 + 208) |= 0x40u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_33:
      if ((v6 & 8) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_33;
  }
  *((_DWORD *)v4 + 8) = self->_endMemoryLevelInKB;
  *((unsigned char *)v4 + 208) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_34:
    *((_DWORD *)v4 + 19) = self->_memoryLevelDeltaInKB;
    *((unsigned char *)v4 + 208) |= 8u;
  }
LABEL_35:
  if (self->_gcdQueueName) {
    objc_msgSend(v27, "setGcdQueueName:");
  }
  if (self->_qosClassName) {
    objc_msgSend(v27, "setQosClassName:");
  }
  if (self->_relativePriority) {
    objc_msgSend(v27, "setRelativePriority:");
  }
  if (self->_projectName) {
    objc_msgSend(v27, "setProjectName:");
  }
  if ([(AeroMLTracerSpanEvent *)self attributesCount])
  {
    [v27 clearAttributes];
    unint64_t v7 = [(AeroMLTracerSpanEvent *)self attributesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(AeroMLTracerSpanEvent *)self attributesAtIndex:i];
        [v27 addAttributes:v10];
      }
    }
  }
  if ([(AeroMLTracerSpanEvent *)self infoEventsCount])
  {
    [v27 clearInfoEvents];
    unint64_t v11 = [(AeroMLTracerSpanEvent *)self infoEventsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(AeroMLTracerSpanEvent *)self infoEventsAtIndex:j];
        [v27 addInfoEvents:v14];
      }
    }
  }
  if ([(AeroMLTracerSpanEvent *)self warningEventsCount])
  {
    [v27 clearWarningEvents];
    unint64_t v15 = [(AeroMLTracerSpanEvent *)self warningEventsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(AeroMLTracerSpanEvent *)self warningEventsAtIndex:k];
        [v27 addWarningEvents:v18];
      }
    }
  }
  if ([(AeroMLTracerSpanEvent *)self debugEventsCount])
  {
    [v27 clearDebugEvents];
    unint64_t v19 = [(AeroMLTracerSpanEvent *)self debugEventsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        v22 = [(AeroMLTracerSpanEvent *)self debugEventsAtIndex:m];
        [v27 addDebugEvents:v22];
      }
    }
  }
  if ([(AeroMLTracerSpanEvent *)self errorEventsCount])
  {
    [v27 clearErrorEvents];
    unint64_t v23 = [(AeroMLTracerSpanEvent *)self errorEventsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
      {
        v26 = [(AeroMLTracerSpanEvent *)self errorEventsAtIndex:n];
        [v27 addErrorEvents:v26];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_testKey copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v8;

  uint64_t v10 = [(NSString *)self->_version copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v10;

  uint64_t v12 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v12;

  uint64_t v14 = [(NSString *)self->_trialDeploymentId copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v14;

  uint64_t v16 = [(NSString *)self->_trialExperimentId copyWithZone:a3];
  v17 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v16;

  uint64_t v18 = [(NSString *)self->_trialTreatmentId copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v18;

  uint64_t v20 = [(NSString *)self->_traceId copyWithZone:a3];
  v21 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v20;

  uint64_t v22 = [(NSString *)self->_parentSpanId copyWithZone:a3];
  unint64_t v23 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v22;

  uint64_t v24 = [(NSString *)self->_spanId copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v24;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_privatizedStartTime;
    *(unsigned char *)(v5 + 208) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_privatizedEndTime;
  *(unsigned char *)(v5 + 208) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 72) = self->_intervalInMilliSeconds;
    *(unsigned char *)(v5 + 208) |= 4u;
  }
LABEL_5:
  uint64_t v27 = [(NSString *)self->_errorString copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v27;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_errorCode;
    *(unsigned char *)(v5 + 208) |= 2u;
  }
  uint64_t v29 = [(NSString *)self->_processName copyWithZone:a3];
  uint64_t v30 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v29;

  char v31 = (char)self->_has;
  if ((v31 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_startMemoryLevelInKB;
    *(unsigned char *)(v5 + 208) |= 0x40u;
    char v31 = (char)self->_has;
    if ((v31 & 1) == 0)
    {
LABEL_9:
      if ((v31 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v5 + 32) = self->_endMemoryLevelInKB;
  *(unsigned char *)(v5 + 208) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 76) = self->_memoryLevelDeltaInKB;
    *(unsigned char *)(v5 + 208) |= 8u;
  }
LABEL_11:
  uint64_t v32 = [(NSString *)self->_gcdQueueName copyWithZone:a3];
  long long v33 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v32;

  uint64_t v34 = [(NSString *)self->_qosClassName copyWithZone:a3];
  long long v35 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v34;

  uint64_t v36 = [(NSString *)self->_relativePriority copyWithZone:a3];
  long long v37 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v36;

  uint64_t v38 = [(NSString *)self->_projectName copyWithZone:a3];
  long long v39 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v38;

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v40 = self->_attributes;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v87 objects:v95 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v88 != v43) {
          objc_enumerationMutation(v40);
        }
        long long v45 = (void *)[*(id *)(*((void *)&v87 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAttributes:v45];
      }
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v87 objects:v95 count:16];
    }
    while (v42);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v46 = self->_infoEvents;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v83 objects:v94 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v84 != v49) {
          objc_enumerationMutation(v46);
        }
        long long v51 = (void *)[*(id *)(*((void *)&v83 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addInfoEvents:v51];
      }
      uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v83 objects:v94 count:16];
    }
    while (v48);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v52 = self->_warningEvents;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v79 objects:v93 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != v54; ++k)
      {
        if (*(void *)v80 != v55) {
          objc_enumerationMutation(v52);
        }
        uint64_t v57 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addWarningEvents:v57];
      }
      uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v79 objects:v93 count:16];
    }
    while (v54);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v58 = self->_debugEvents;
  uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v75 objects:v92 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v76;
    do
    {
      for (uint64_t m = 0; m != v60; ++m)
      {
        if (*(void *)v76 != v61) {
          objc_enumerationMutation(v58);
        }
        v63 = (void *)[*(id *)(*((void *)&v75 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addDebugEvents:v63];
      }
      uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v75 objects:v92 count:16];
    }
    while (v60);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v64 = self->_errorEvents;
  uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v71 objects:v91 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v72;
    do
    {
      for (uint64_t n = 0; n != v66; ++n)
      {
        if (*(void *)v72 != v67) {
          objc_enumerationMutation(v64);
        }
        long long v69 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * n), "copyWithZone:", a3, (void)v71);
        [(id)v5 addErrorEvents:v69];
      }
      uint64_t v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v71 objects:v91 count:16];
    }
    while (v66);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceIdentifier, "isEqual:")) {
      goto LABEL_81;
    }
  }
  testKey = self->_testKey;
  if ((unint64_t)testKey | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](testKey, "isEqual:")) {
      goto LABEL_81;
    }
  }
  versiouint64_t n = self->_version;
  if ((unint64_t)version | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](version, "isEqual:")) {
      goto LABEL_81;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_81;
    }
  }
  trialDeploymentId = self->_trialDeploymentId;
  if ((unint64_t)trialDeploymentId | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](trialDeploymentId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  trialExperimentId = self->_trialExperimentId;
  if ((unint64_t)trialExperimentId | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](trialExperimentId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  trialTreatmentId = self->_trialTreatmentId;
  if ((unint64_t)trialTreatmentId | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](trialTreatmentId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  traceId = self->_traceId;
  if ((unint64_t)traceId | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](traceId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  parentSpanId = self->_parentSpanId;
  if ((unint64_t)parentSpanId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](parentSpanId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  spanId = self->_spanId;
  if ((unint64_t)spanId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](spanId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 208) & 0x20) == 0 || self->_privatizedStartTime != *((_DWORD *)v4 + 25)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 208) & 0x10) == 0 || self->_privatizedEndTime != *((_DWORD *)v4 + 24)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 208) & 4) == 0 || self->_intervalInMilliSeconds != *((_DWORD *)v4 + 18)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 4) != 0)
  {
    goto LABEL_81;
  }
  errorString = self->_errorString;
  if ((unint64_t)errorString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](errorString, "isEqual:")) {
      goto LABEL_81;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 208) & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 9)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 2) != 0)
  {
    goto LABEL_81;
  }
  processName = self->_processName;
  if ((unint64_t)processName | *((void *)v4 + 13))
  {
    if (-[NSString isEqual:](processName, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_48;
    }
LABEL_81:
    char v27 = 0;
    goto LABEL_82;
  }
LABEL_48:
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 208) & 0x40) == 0 || self->_startMemoryLevelInKB != *((_DWORD *)v4 + 36)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 208) & 1) == 0 || self->_endMemoryLevelInKB != *((_DWORD *)v4 + 8)) {
      goto LABEL_81;
    }
  }
  else if (*((unsigned char *)v4 + 208))
  {
    goto LABEL_81;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 208) & 8) == 0 || self->_memoryLevelDeltaInKB != *((_DWORD *)v4 + 19)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 8) != 0)
  {
    goto LABEL_81;
  }
  gcdQueueName = self->_gcdQueueName;
  if ((unint64_t)gcdQueueName | *((void *)v4 + 7)
    && !-[NSString isEqual:](gcdQueueName, "isEqual:"))
  {
    goto LABEL_81;
  }
  qosClassName = self->_qosClassName;
  if ((unint64_t)qosClassName | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](qosClassName, "isEqual:")) {
      goto LABEL_81;
    }
  }
  relativePriority = self->_relativePriority;
  if ((unint64_t)relativePriority | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](relativePriority, "isEqual:")) {
      goto LABEL_81;
    }
  }
  projectName = self->_projectName;
  if ((unint64_t)projectName | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](projectName, "isEqual:")) {
      goto LABEL_81;
    }
  }
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](attributes, "isEqual:")) {
      goto LABEL_81;
    }
  }
  infoEvents = self->_infoEvents;
  if ((unint64_t)infoEvents | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](infoEvents, "isEqual:")) {
      goto LABEL_81;
    }
  }
  warningEvents = self->_warningEvents;
  if ((unint64_t)warningEvents | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](warningEvents, "isEqual:")) {
      goto LABEL_81;
    }
  }
  debugEvents = self->_debugEvents;
  if ((unint64_t)debugEvents | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](debugEvents, "isEqual:")) {
      goto LABEL_81;
    }
  }
  errorEvents = self->_errorEvents;
  if ((unint64_t)errorEvents | *((void *)v4 + 5)) {
    char v27 = -[NSMutableArray isEqual:](errorEvents, "isEqual:");
  }
  else {
    char v27 = 1;
  }
LABEL_82:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v31 = [(NSString *)self->_deviceIdentifier hash];
  NSUInteger v30 = [(NSString *)self->_testKey hash];
  NSUInteger v29 = [(NSString *)self->_version hash];
  NSUInteger v28 = [(NSString *)self->_name hash];
  NSUInteger v27 = [(NSString *)self->_trialDeploymentId hash];
  NSUInteger v26 = [(NSString *)self->_trialExperimentId hash];
  NSUInteger v25 = [(NSString *)self->_trialTreatmentId hash];
  NSUInteger v24 = [(NSString *)self->_traceId hash];
  NSUInteger v3 = [(NSString *)self->_parentSpanId hash];
  NSUInteger v4 = [(NSString *)self->_spanId hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v5 = 2654435761 * self->_privatizedStartTime;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_privatizedEndTime;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_intervalInMilliSeconds;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v7 = 0;
LABEL_8:
  NSUInteger v8 = [(NSString *)self->_errorString hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_processName hash];
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    uint64_t v11 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  uint64_t v11 = 2654435761 * self->_startMemoryLevelInKB;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_endMemoryLevelInKB;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v13 = 2654435761 * self->_memoryLevelDeltaInKB;
LABEL_18:
  NSUInteger v14 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  NSUInteger v15 = v12 ^ v13 ^ [(NSString *)self->_gcdQueueName hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_qosClassName hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_relativePriority hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_projectName hash];
  uint64_t v19 = v14 ^ v18 ^ [(NSMutableArray *)self->_attributes hash];
  uint64_t v20 = [(NSMutableArray *)self->_infoEvents hash];
  uint64_t v21 = v20 ^ [(NSMutableArray *)self->_warningEvents hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_debugEvents hash];
  return v19 ^ v22 ^ [(NSMutableArray *)self->_errorEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[AeroMLTracerSpanEvent setDeviceIdentifier:](self, "setDeviceIdentifier:");
  }
  if (*((void *)v4 + 19)) {
    -[AeroMLTracerSpanEvent setTestKey:](self, "setTestKey:");
  }
  if (*((void *)v4 + 24)) {
    -[AeroMLTracerSpanEvent setVersion:](self, "setVersion:");
  }
  if (*((void *)v4 + 10)) {
    -[AeroMLTracerSpanEvent setName:](self, "setName:");
  }
  if (*((void *)v4 + 21)) {
    -[AeroMLTracerSpanEvent setTrialDeploymentId:](self, "setTrialDeploymentId:");
  }
  if (*((void *)v4 + 22)) {
    -[AeroMLTracerSpanEvent setTrialExperimentId:](self, "setTrialExperimentId:");
  }
  if (*((void *)v4 + 23)) {
    -[AeroMLTracerSpanEvent setTrialTreatmentId:](self, "setTrialTreatmentId:");
  }
  if (*((void *)v4 + 20)) {
    -[AeroMLTracerSpanEvent setTraceId:](self, "setTraceId:");
  }
  if (*((void *)v4 + 11)) {
    -[AeroMLTracerSpanEvent setParentSpanId:](self, "setParentSpanId:");
  }
  if (*((void *)v4 + 17)) {
    -[AeroMLTracerSpanEvent setSpanId:](self, "setSpanId:");
  }
  char v5 = *((unsigned char *)v4 + 208);
  if ((v5 & 0x20) != 0)
  {
    self->_privatizedStartTime = *((_DWORD *)v4 + 25);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 208);
    if ((v5 & 0x10) == 0)
    {
LABEL_23:
      if ((v5 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 0x10) == 0)
  {
    goto LABEL_23;
  }
  self->_privatizedEndTime = *((_DWORD *)v4 + 24);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 208) & 4) != 0)
  {
LABEL_24:
    self->_intervalInMilliSeconds = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_25:
  if (*((void *)v4 + 6)) {
    -[AeroMLTracerSpanEvent setErrorString:](self, "setErrorString:");
  }
  if ((*((unsigned char *)v4 + 208) & 2) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 13)) {
    -[AeroMLTracerSpanEvent setProcessName:](self, "setProcessName:");
  }
  char v6 = *((unsigned char *)v4 + 208);
  if ((v6 & 0x40) != 0)
  {
    self->_startMemoryLevelInKB = *((_DWORD *)v4 + 36);
    *(unsigned char *)&self->_has |= 0x40u;
    char v6 = *((unsigned char *)v4 + 208);
    if ((v6 & 1) == 0)
    {
LABEL_33:
      if ((v6 & 8) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 1) == 0)
  {
    goto LABEL_33;
  }
  self->_endMemoryLevelInKB = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 208) & 8) != 0)
  {
LABEL_34:
    self->_memoryLevelDeltaInKB = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_35:
  if (*((void *)v4 + 7)) {
    -[AeroMLTracerSpanEvent setGcdQueueName:](self, "setGcdQueueName:");
  }
  if (*((void *)v4 + 15)) {
    -[AeroMLTracerSpanEvent setQosClassName:](self, "setQosClassName:");
  }
  if (*((void *)v4 + 16)) {
    -[AeroMLTracerSpanEvent setRelativePriority:](self, "setRelativePriority:");
  }
  if (*((void *)v4 + 14)) {
    -[AeroMLTracerSpanEvent setProjectName:](self, "setProjectName:");
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AeroMLTracerSpanEvent *)self addAttributes:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = *((id *)v4 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AeroMLTracerSpanEvent *)self addInfoEvents:*(void *)(*((void *)&v44 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = *((id *)v4 + 25);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        [(AeroMLTracerSpanEvent *)self addWarningEvents:*(void *)(*((void *)&v40 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = *((id *)v4 + 2);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        [(AeroMLTracerSpanEvent *)self addDebugEvents:*(void *)(*((void *)&v36 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v24);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = *((id *)v4 + 5);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        -[AeroMLTracerSpanEvent addErrorEvents:](self, "addErrorEvents:", *(void *)(*((void *)&v32 + 1) + 8 * n), (void)v32);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v29);
  }
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)testKey
{
  return self->_testKey;
}

- (void)setTestKey:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (NSString)traceId
{
  return self->_traceId;
}

- (void)setTraceId:(id)a3
{
}

- (NSString)parentSpanId
{
  return self->_parentSpanId;
}

- (void)setParentSpanId:(id)a3
{
}

- (NSString)spanId
{
  return self->_spanId;
}

- (void)setSpanId:(id)a3
{
}

- (unsigned)privatizedStartTime
{
  return self->_privatizedStartTime;
}

- (unsigned)privatizedEndTime
{
  return self->_privatizedEndTime;
}

- (unsigned)intervalInMilliSeconds
{
  return self->_intervalInMilliSeconds;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (unsigned)startMemoryLevelInKB
{
  return self->_startMemoryLevelInKB;
}

- (unsigned)endMemoryLevelInKB
{
  return self->_endMemoryLevelInKB;
}

- (unsigned)memoryLevelDeltaInKB
{
  return self->_memoryLevelDeltaInKB;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)gcdQueueName
{
  return self->_gcdQueueName;
}

- (void)setGcdQueueName:(id)a3
{
}

- (NSString)qosClassName
{
  return self->_qosClassName;
}

- (void)setQosClassName:(id)a3
{
}

- (NSString)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(id)a3
{
}

- (NSString)projectName
{
  return self->_projectName;
}

- (void)setProjectName:(id)a3
{
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSMutableArray)infoEvents
{
  return self->_infoEvents;
}

- (void)setInfoEvents:(id)a3
{
}

- (NSMutableArray)warningEvents
{
  return self->_warningEvents;
}

- (void)setWarningEvents:(id)a3
{
}

- (NSMutableArray)debugEvents
{
  return self->_debugEvents;
}

- (void)setDebugEvents:(id)a3
{
}

- (NSMutableArray)errorEvents
{
  return self->_errorEvents;
}

- (void)setErrorEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningEvents, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_testKey, 0);
  objc_storeStrong((id *)&self->_spanId, 0);
  objc_storeStrong((id *)&self->_relativePriority, 0);
  objc_storeStrong((id *)&self->_qosClassName, 0);
  objc_storeStrong((id *)&self->_projectName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_parentSpanId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_infoEvents, 0);
  objc_storeStrong((id *)&self->_gcdQueueName, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_errorEvents, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_debugEvents, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end