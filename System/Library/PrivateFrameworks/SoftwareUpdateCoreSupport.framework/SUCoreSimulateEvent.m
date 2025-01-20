@interface SUCoreSimulateEvent
+ (BOOL)supportsSecureCoding;
+ (id)nameForSimulateEventBoolean:(int64_t)a3;
- (NSArray)assetBuildVersions;
- (NSArray)assetProductVersions;
- (NSDictionary)errorUserInfo;
- (NSString)alteration;
- (NSString)assetAttributesPlist;
- (NSString)assetState;
- (NSString)errorDomain;
- (NSString)fsmEvent;
- (NSString)fsmState;
- (NSString)identityName;
- (NSString)moduleName;
- (NSString)untilStop;
- (NSString)updateInfoPlist;
- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forMachine:(id)a5 atEvent:(id)a6 inState:(id)a7 alteration:(id)a8 startAt:(int)a9 endAt:(int)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19;
- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atFunction:(id)a6 startAt:(int)a7 endAt:(int)a8 duration:(int)a9 untilStop:(id)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19;
- (SUCoreSimulateEvent)initWithCoder:(id)a3;
- (id)_actionName;
- (id)_descriptionFSM;
- (id)_descriptionStandard;
- (id)_initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atIdentity:(id)a6 atEvent:(id)a7 inState:(id)a8 alteration:(id)a9 startAt:(int)a10 endAt:(int)a11 duration:(int)a12 untilStop:(id)a13 assetBuildVersions:(id)a14 assetProductVersions:(id)a15 assetAttributesPlist:(id)a16 assetState:(id)a17 updateInfoPlist:(id)a18 errorDomain:(id)a19 errorCode:(int64_t)a20 errorUserInfo:(id)a21 errorRecoverable:(int64_t)a22;
- (id)_triggerName;
- (id)buildErrorWithDescription:(id)a3;
- (id)description;
- (id)summary;
- (int)count;
- (int)duration;
- (int)endAt;
- (int)startAt;
- (int64_t)errorCode;
- (int64_t)errorRecoverable;
- (int64_t)simAction;
- (int64_t)simTrigger;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(int)a3;
@end

@implementation SUCoreSimulateEvent

- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atFunction:(id)a6 startAt:(int)a7 endAt:(int)a8 duration:(int)a9 untilStop:(id)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19
{
  LODWORD(v20) = a9;
  return (SUCoreSimulateEvent *)-[SUCoreSimulateEvent _initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](self, "_initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", a3, a4, a5, a6, 0, 0, 0, __PAIR64__(a8, a7), v20, a10, a11, a12, a13, a14, a15,
                                  a16,
                                  a17,
                                  a18,
                                  a19);
}

- (SUCoreSimulateEvent)initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forMachine:(id)a5 atEvent:(id)a6 inState:(id)a7 alteration:(id)a8 startAt:(int)a9 endAt:(int)a10 assetBuildVersions:(id)a11 assetProductVersions:(id)a12 assetAttributesPlist:(id)a13 assetState:(id)a14 updateInfoPlist:(id)a15 errorDomain:(id)a16 errorCode:(int64_t)a17 errorUserInfo:(id)a18 errorRecoverable:(int64_t)a19
{
  LODWORD(v20) = 0;
  return (SUCoreSimulateEvent *)-[SUCoreSimulateEvent _initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](self, "_initWithAction:onTrigger:forModule:atIdentity:atEvent:inState:alteration:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", a3, a4, @"fsm", a5, a6, a7, a8, __PAIR64__(a10, a9), v20, 0, a11, a12, a13, a14, a15,
                                  a16,
                                  a17,
                                  a18,
                                  a19);
}

- (id)_initWithAction:(int64_t)a3 onTrigger:(int64_t)a4 forModule:(id)a5 atIdentity:(id)a6 atEvent:(id)a7 inState:(id)a8 alteration:(id)a9 startAt:(int)a10 endAt:(int)a11 duration:(int)a12 untilStop:(id)a13 assetBuildVersions:(id)a14 assetProductVersions:(id)a15 assetAttributesPlist:(id)a16 assetState:(id)a17 updateInfoPlist:(id)a18 errorDomain:(id)a19 errorCode:(int64_t)a20 errorUserInfo:(id)a21 errorRecoverable:(int64_t)a22
{
  id v45 = a5;
  id obj = a6;
  id v43 = a6;
  id v38 = a7;
  id v42 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a13;
  id v46 = a14;
  id v44 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  id v41 = a19;
  id v40 = a21;
  v47.receiver = self;
  v47.super_class = (Class)SUCoreSimulateEvent;
  v31 = [(SUCoreSimulateEvent *)&v47 init];
  v32 = v31;
  if (v31)
  {
    v31->_simAction = a3;
    v31->_simTrigger = a4;
    objc_storeStrong((id *)&v31->_moduleName, a5);
    objc_storeStrong((id *)&v32->_identityName, obj);
    objc_storeStrong((id *)&v32->_fsmEvent, v38);
    objc_storeStrong((id *)&v32->_fsmState, a8);
    objc_storeStrong((id *)&v32->_alteration, a9);
    v32->_count = 0;
    v32->_startAt = a10;
    v32->_endAt = a11;
    v32->_duration = a12;
    objc_storeStrong((id *)&v32->_untilStop, a13);
    objc_storeStrong((id *)&v32->_assetBuildVersions, a14);
    objc_storeStrong((id *)&v32->_assetProductVersions, a15);
    objc_storeStrong((id *)&v32->_assetAttributesPlist, a16);
    objc_storeStrong((id *)&v32->_assetState, a17);
    objc_storeStrong((id *)&v32->_updateInfoPlist, a18);
    objc_storeStrong((id *)&v32->_errorDomain, a19);
    v32->_errorCode = a20;
    objc_storeStrong((id *)&v32->_errorUserInfo, a21);
    v32->_errorRecoverable = a22;
  }

  return v32;
}

- (SUCoreSimulateEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SUCoreSimulateEvent;
  v5 = [(SUCoreSimulateEvent *)&v39 init];
  if (v5)
  {
    v5->_simAction = [v4 decodeInt64ForKey:@"simAction"];
    v5->_simTrigger = [v4 decodeInt64ForKey:@"simTrigger"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moduleName"];
    moduleName = v5->_moduleName;
    v5->_moduleName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityName"];
    identityName = v5->_identityName;
    v5->_identityName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fsmEvent"];
    fsmEvent = v5->_fsmEvent;
    v5->_fsmEvent = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fsmState"];
    fsmState = v5->_fsmState;
    v5->_fsmState = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alteration"];
    alteration = v5->_alteration;
    v5->_alteration = (NSString *)v14;

    v5->_count = [v4 decodeIntForKey:@"count"];
    v5->_startAt = [v4 decodeIntForKey:@"startAt"];
    v5->_endAt = [v4 decodeIntForKey:@"endAt"];
    v5->_duration = [v4 decodeIntForKey:@"duration"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untilStop"];
    untilStop = v5->_untilStop;
    v5->_untilStop = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"assetBuildVersions"];
    assetBuildVersions = v5->_assetBuildVersions;
    v5->_assetBuildVersions = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    id v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"assetProductVersions"];
    assetProductVersions = v5->_assetProductVersions;
    v5->_assetProductVersions = (NSArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetAttributesPlist"];
    assetAttributesPlist = v5->_assetAttributesPlist;
    v5->_assetAttributesPlist = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetState"];
    assetState = v5->_assetState;
    v5->_assetState = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateInfoPlist"];
    updateInfoPlist = v5->_updateInfoPlist;
    v5->_updateInfoPlist = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorDomain"];
    errorDomain = v5->_errorDomain;
    v5->_errorDomain = (NSString *)v34;

    v5->_errorCode = [v4 decodeInt64ForKey:@"errorCode"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorUserInfo"];
    errorUserInfo = v5->_errorUserInfo;
    v5->_errorUserInfo = (NSDictionary *)v36;

    v5->_errorRecoverable = (int)[v4 decodeIntForKey:@"errorRecoverable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t simAction = self->_simAction;
  id v5 = a3;
  [v5 encodeInt64:simAction forKey:@"simAction"];
  [v5 encodeInt64:self->_simTrigger forKey:@"simTrigger"];
  [v5 encodeObject:self->_moduleName forKey:@"moduleName"];
  [v5 encodeObject:self->_identityName forKey:@"identityName"];
  [v5 encodeObject:self->_fsmEvent forKey:@"fsmEvent"];
  [v5 encodeObject:self->_fsmState forKey:@"fsmState"];
  [v5 encodeObject:self->_alteration forKey:@"alteration"];
  [v5 encodeInt:self->_count forKey:@"count"];
  [v5 encodeInt:self->_startAt forKey:@"startAt"];
  [v5 encodeInt:self->_endAt forKey:@"endAt"];
  [v5 encodeInt:self->_duration forKey:@"duration"];
  [v5 encodeObject:self->_untilStop forKey:@"untilStop"];
  [v5 encodeObject:self->_assetBuildVersions forKey:@"assetBuildVersions"];
  [v5 encodeObject:self->_assetProductVersions forKey:@"assetProductVersions"];
  [v5 encodeObject:self->_assetAttributesPlist forKey:@"assetAttributesPlist"];
  [v5 encodeObject:self->_assetState forKey:@"assetState"];
  [v5 encodeObject:self->_updateInfoPlist forKey:@"updateInfoPlist"];
  [v5 encodeObject:self->_errorDomain forKey:@"errorDomain"];
  [v5 encodeInt64:self->_errorCode forKey:@"errorCode"];
  [v5 encodeObject:self->_errorUserInfo forKey:@"errorUserInfo"];
  [v5 encodeInt:LODWORD(self->_errorRecoverable) forKey:@"errorRecoverable"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)buildErrorWithDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreSimulateEvent *)self errorDomain];
  if (v5)
  {
    uint64_t v6 = [(SUCoreSimulateEvent *)self errorDomain];
  }
  else
  {
    uint64_t v6 = @"SUCoreError";
  }
  v7 = v6;

  if ([(SUCoreSimulateEvent *)self errorCode]) {
    int64_t v8 = [(SUCoreSimulateEvent *)self errorCode];
  }
  else {
    int64_t v8 = 9900;
  }
  v9 = [(SUCoreSimulateEvent *)self errorUserInfo];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA60];
  if (v9)
  {
    v11 = [(SUCoreSimulateEvent *)self errorUserInfo];
    uint64_t v12 = [v10 dictionaryWithDictionary:v11];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  [v12 setSafeObject:v4 forKey:*MEMORY[0x1E4F28568]];
  int64_t v13 = [(SUCoreSimulateEvent *)self errorRecoverable];
  if (v13)
  {
    if (v13 == 2)
    {
      uint64_t v14 = MEMORY[0x1E4F1CC38];
      goto LABEL_15;
    }
    if (v13 == 1)
    {
      uint64_t v14 = MEMORY[0x1E4F1CC28];
LABEL_15:
      [v12 setSafeObject:v14 forKey:@"Recoverable"];
      goto LABEL_17;
    }
    v15 = +[SUCoreDiag sharedDiag];
    uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"unknown value for errorRecoverable:%d", -[SUCoreSimulateEvent errorRecoverable](self, "errorRecoverable"));
    [v15 trackError:@"[SIMULATE] EVENT" forReason:v16 withResult:8116 withError:0];
  }
LABEL_17:
  v17 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:v8 userInfo:v12];

  return v17;
}

- (id)description
{
  if ([(SUCoreSimulateEvent *)self simTrigger] == 3) {
    [(SUCoreSimulateEvent *)self _descriptionFSM];
  }
  else {
  v3 = [(SUCoreSimulateEvent *)self _descriptionStandard];
  }
  return v3;
}

- (id)summary
{
  v3 = [(SUCoreSimulateEvent *)self moduleName];
  int v4 = [v3 isEqualToString:@"fsm"];

  id v27 = [NSString alloc];
  uint64_t v28 = [(SUCoreSimulateEvent *)self _actionName];
  uint64_t v34 = [(SUCoreSimulateEvent *)self _triggerName];
  if (v4)
  {
    v33 = [(SUCoreSimulateEvent *)self identityName];
    uint64_t v32 = [(SUCoreSimulateEvent *)self fsmEvent];
    v31 = [(SUCoreSimulateEvent *)self fsmState];
    uint64_t v30 = [(SUCoreSimulateEvent *)self alteration];
    uint64_t v25 = [(SUCoreSimulateEvent *)self count];
    uint64_t v23 = [(SUCoreSimulateEvent *)self startAt];
    uint64_t v5 = [(SUCoreSimulateEvent *)self endAt];
    id v29 = [(SUCoreSimulateEvent *)self assetBuildVersions];
    uint64_t v6 = [(SUCoreSimulateEvent *)self assetProductVersions];
    v7 = [(SUCoreSimulateEvent *)self assetAttributesPlist];
    int64_t v8 = [(SUCoreSimulateEvent *)self assetState];
    v9 = [(SUCoreSimulateEvent *)self updateInfoPlist];
    uint64_t v10 = [(SUCoreSimulateEvent *)self errorDomain];
    if (v10)
    {
      v11 = [(SUCoreSimulateEvent *)self errorDomain];
    }
    else
    {
      v11 = @"SUCoreError";
    }
    uint64_t v14 = +[SUCore errorNameForCode:[(SUCoreSimulateEvent *)self errorCode]];
    v15 = +[SUCoreSimulateEvent nameForSimulateEventBoolean:[(SUCoreSimulateEvent *)self errorRecoverable]];
    uint64_t v22 = v5;
    uint64_t v16 = (void *)v28;
    v17 = objc_msgSend(v27, "initWithFormat:", @"action:%@ trigger:%@ fsm:%@ event:%@ state:%@ alteration:%@ count:%d startAt:%d endAt:%d assetBuildVersions:%@ assetProductVersions:%@ assetAttributesPlist:%@ assetState:%@ updateInfoPlist:%@ errorDomain:%@ errorCode:%@ errorRecoverable:%@", v28, v34, v33, v32, v31, v30, v25, v23, v22, v29, v6, v7, v8, v9, v11, v14,
                    v15);

    if (v10) {
  }
    }
  else
  {
    v33 = [(SUCoreSimulateEvent *)self moduleName];
    uint64_t v32 = [(SUCoreSimulateEvent *)self identityName];
    uint64_t v26 = [(SUCoreSimulateEvent *)self count];
    uint64_t v24 = [(SUCoreSimulateEvent *)self startAt];
    uint64_t v12 = [(SUCoreSimulateEvent *)self endAt];
    uint64_t v13 = [(SUCoreSimulateEvent *)self duration];
    v31 = [(SUCoreSimulateEvent *)self untilStop];
    uint64_t v30 = [(SUCoreSimulateEvent *)self assetBuildVersions];
    id v29 = [(SUCoreSimulateEvent *)self assetProductVersions];
    uint64_t v6 = [(SUCoreSimulateEvent *)self assetAttributesPlist];
    v7 = [(SUCoreSimulateEvent *)self assetState];
    int64_t v8 = [(SUCoreSimulateEvent *)self updateInfoPlist];
    v9 = [(SUCoreSimulateEvent *)self errorDomain];
    if (v9)
    {
      uint64_t v10 = [(SUCoreSimulateEvent *)self errorDomain];
    }
    else
    {
      uint64_t v10 = @"SUCoreError";
    }
    v18 = +[SUCore errorNameForCode:[(SUCoreSimulateEvent *)self errorCode]];
    uint64_t v19 = +[SUCoreSimulateEvent nameForSimulateEventBoolean:[(SUCoreSimulateEvent *)self errorRecoverable]];
    uint64_t v21 = v12;
    uint64_t v16 = (void *)v28;
    v17 = objc_msgSend(v27, "initWithFormat:", @"action:%@ trigger:%@ module:%@ function:%@ count:%d startAt:%d endAt:%d duration:%d untilStop:%@ assetBuildVersions:%@ assetProductVersions:%@ assetAttributesPlist:%@ assetState:%@ updateInfoPlist:%@ errorDomain:%@ errorCode:%@ errorRecoverable:%@", v28, v34, v33, v32, v26, v24, v21, v13, v31, v30, v29, v6, v7, v8, v10, v18,
                    v19);

    if (!v9) {
      goto LABEL_12;
    }
  }

LABEL_12:
  return v17;
}

- (id)_descriptionFSM
{
  id v17 = [NSString alloc];
  uint64_t v24 = [(SUCoreSimulateEvent *)self _actionName];
  uint64_t v23 = [(SUCoreSimulateEvent *)self _triggerName];
  uint64_t v22 = [(SUCoreSimulateEvent *)self identityName];
  uint64_t v21 = [(SUCoreSimulateEvent *)self fsmEvent];
  uint64_t v20 = [(SUCoreSimulateEvent *)self fsmState];
  uint64_t v19 = [(SUCoreSimulateEvent *)self alteration];
  uint64_t v16 = [(SUCoreSimulateEvent *)self count];
  uint64_t v15 = [(SUCoreSimulateEvent *)self startAt];
  uint64_t v14 = [(SUCoreSimulateEvent *)self endAt];
  v18 = [(SUCoreSimulateEvent *)self assetBuildVersions];
  v3 = [(SUCoreSimulateEvent *)self assetProductVersions];
  int v4 = [(SUCoreSimulateEvent *)self assetAttributesPlist];
  uint64_t v5 = [(SUCoreSimulateEvent *)self assetState];
  uint64_t v6 = [(SUCoreSimulateEvent *)self updateInfoPlist];
  v7 = [(SUCoreSimulateEvent *)self errorDomain];
  if (v7)
  {
    int64_t v8 = [(SUCoreSimulateEvent *)self errorDomain];
  }
  else
  {
    int64_t v8 = @"SUCoreError";
  }
  v9 = +[SUCore errorNameForCode:[(SUCoreSimulateEvent *)self errorCode]];
  uint64_t v10 = [(SUCoreSimulateEvent *)self errorUserInfo];
  v11 = +[SUCoreSimulateEvent nameForSimulateEventBoolean:[(SUCoreSimulateEvent *)self errorRecoverable]];
  uint64_t v12 = objc_msgSend(v17, "initWithFormat:", @"\n[>>>\n               action: %@\n              trigger: %@\n                  fsm: %@\n                event: %@\n                state: %@\n           alteration: %@\n                count: %d\n              startAt: %d\n                endAt: %d\n   assetBuildVersions: %@\n assetProductVersions: %@\n assetAttributesPlist: %@\n           assetState: %@\n      updateInfoPlist: %@\n          errorDomain: %@\n            errorCode: %@\n        errorUserInfo: %@\n     errorRecoverable: %@\n<<<]", v24, v23, v22, v21, v20, v19, v16, v15, v14, v18, v3, v4, v5, v6, v8, v9,
                  v10,
                  v11);

  if (v7) {
  return v12;
  }
}

- (id)_descriptionStandard
{
  id v18 = [NSString alloc];
  uint64_t v24 = [(SUCoreSimulateEvent *)self _actionName];
  uint64_t v23 = [(SUCoreSimulateEvent *)self _triggerName];
  uint64_t v22 = [(SUCoreSimulateEvent *)self moduleName];
  uint64_t v21 = [(SUCoreSimulateEvent *)self identityName];
  uint64_t v17 = [(SUCoreSimulateEvent *)self count];
  uint64_t v16 = [(SUCoreSimulateEvent *)self startAt];
  uint64_t v15 = [(SUCoreSimulateEvent *)self endAt];
  uint64_t v14 = [(SUCoreSimulateEvent *)self duration];
  uint64_t v20 = [(SUCoreSimulateEvent *)self untilStop];
  uint64_t v19 = [(SUCoreSimulateEvent *)self assetBuildVersions];
  v3 = [(SUCoreSimulateEvent *)self assetProductVersions];
  int v4 = [(SUCoreSimulateEvent *)self assetAttributesPlist];
  uint64_t v5 = [(SUCoreSimulateEvent *)self assetState];
  uint64_t v6 = [(SUCoreSimulateEvent *)self updateInfoPlist];
  v7 = [(SUCoreSimulateEvent *)self errorDomain];
  if (v7)
  {
    int64_t v8 = [(SUCoreSimulateEvent *)self errorDomain];
  }
  else
  {
    int64_t v8 = @"SUCoreError";
  }
  v9 = +[SUCore errorNameForCode:[(SUCoreSimulateEvent *)self errorCode]];
  uint64_t v10 = [(SUCoreSimulateEvent *)self errorUserInfo];
  v11 = +[SUCoreSimulateEvent nameForSimulateEventBoolean:[(SUCoreSimulateEvent *)self errorRecoverable]];
  uint64_t v12 = objc_msgSend(v18, "initWithFormat:", @"\n[>>>\n               action: %@\n              trigger: %@\n               module: %@\n             function: %@\n                count: %d\n              startAt: %d\n                endAt: %d\n             duration: %d\n            untilStop: %@\n   assetBuildVersions: %@\n assetProductVersions: %@\n assetAttributesPlist: %@\n           assetState: %@\n      updateInfoPlist: %@\n          errorDomain: %@\n            errorCode: %@\n        errorUserInfo: %@\n     errorRecoverable: %@\n<<<]", v24, v23, v22, v21, v17, v16, v15, v14, v20, v19, v3, v4, v5, v6, v8, v9,
                  v10,
                  v11);

  if (v7) {
  return v12;
  }
}

- (id)_actionName
{
  if ([(SUCoreSimulateEvent *)self simAction] < 0
    || [(SUCoreSimulateEvent *)self simAction] > 11)
  {
    v3 = @"UNKNOWN";
  }
  else
  {
    v3 = kSUCoreSimulateEventActionName[[(SUCoreSimulateEvent *)self simAction]];
  }
  return v3;
}

- (id)_triggerName
{
  if ([(SUCoreSimulateEvent *)self simTrigger] < 0
    || [(SUCoreSimulateEvent *)self simTrigger] > 3)
  {
    v3 = @"UNKNOWN";
  }
  else
  {
    v3 = kSUCoreSimulateEventTriggerName[[(SUCoreSimulateEvent *)self simTrigger]];
  }
  return v3;
}

+ (id)nameForSimulateEventBoolean:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"SUCoreSimulateEventBoolean(%d)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E60B6888[a3];
  }
  return v3;
}

- (int64_t)simAction
{
  return self->_simAction;
}

- (int64_t)simTrigger
{
  return self->_simTrigger;
}

- (NSString)moduleName
{
  return self->_moduleName;
}

- (NSString)identityName
{
  return self->_identityName;
}

- (NSString)fsmEvent
{
  return self->_fsmEvent;
}

- (NSString)fsmState
{
  return self->_fsmState;
}

- (NSString)alteration
{
  return self->_alteration;
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

- (int)startAt
{
  return self->_startAt;
}

- (int)endAt
{
  return self->_endAt;
}

- (int)duration
{
  return self->_duration;
}

- (NSString)untilStop
{
  return self->_untilStop;
}

- (NSArray)assetBuildVersions
{
  return self->_assetBuildVersions;
}

- (NSArray)assetProductVersions
{
  return self->_assetProductVersions;
}

- (NSString)assetAttributesPlist
{
  return self->_assetAttributesPlist;
}

- (NSString)assetState
{
  return self->_assetState;
}

- (NSString)updateInfoPlist
{
  return self->_updateInfoPlist;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSDictionary)errorUserInfo
{
  return self->_errorUserInfo;
}

- (int64_t)errorRecoverable
{
  return self->_errorRecoverable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorUserInfo, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_updateInfoPlist, 0);
  objc_storeStrong((id *)&self->_assetState, 0);
  objc_storeStrong((id *)&self->_assetAttributesPlist, 0);
  objc_storeStrong((id *)&self->_assetProductVersions, 0);
  objc_storeStrong((id *)&self->_assetBuildVersions, 0);
  objc_storeStrong((id *)&self->_untilStop, 0);
  objc_storeStrong((id *)&self->_alteration, 0);
  objc_storeStrong((id *)&self->_fsmState, 0);
  objc_storeStrong((id *)&self->_fsmEvent, 0);
  objc_storeStrong((id *)&self->_identityName, 0);
  objc_storeStrong((id *)&self->_moduleName, 0);
}

@end