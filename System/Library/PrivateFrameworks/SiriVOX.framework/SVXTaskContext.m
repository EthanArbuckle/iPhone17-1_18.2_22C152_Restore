@interface SVXTaskContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUUFR;
- (BOOL)listensAfterSpeaking;
- (NSError)error;
- (NSString)aceId;
- (NSString)dialogIdentifier;
- (NSString)dialogPhase;
- (NSString)refId;
- (NSUUID)requestUUID;
- (NSUUID)sessionUUID;
- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior;
- (SVXActivationContext)activationContext;
- (SVXDeactivationContext)deactivationContext;
- (SVXTaskContext)initWithCoder:(id)a3;
- (SVXTaskContext)initWithOrigin:(int64_t)a3 timestamp:(unint64_t)a4 sessionUUID:(id)a5 requestUUID:(id)a6 aceId:(id)a7 refId:(id)a8 dialogIdentifier:(id)a9 dialogPhase:(id)a10 isUUFR:(BOOL)a11 listensAfterSpeaking:(BOOL)a12 listenAfterSpeakingBehavior:(id)a13 activationContext:(id)a14 deactivationContext:(id)a15 error:(id)a16;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)origin;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXTaskContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deactivationContext, 0);
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_listenAfterSpeakingBehavior, 0);
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_dialogIdentifier, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_aceId, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

- (NSError)error
{
  return self->_error;
}

- (SVXDeactivationContext)deactivationContext
{
  return self->_deactivationContext;
}

- (SVXActivationContext)activationContext
{
  return self->_activationContext;
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return self->_listenAfterSpeakingBehavior;
}

- (BOOL)listensAfterSpeaking
{
  return self->_listensAfterSpeaking;
}

- (BOOL)isUUFR
{
  return self->_isUUFR;
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (NSString)dialogIdentifier
{
  return self->_dialogIdentifier;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)aceId
{
  return self->_aceId;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t origin = self->_origin;
  id v10 = a3;
  v6 = [v4 numberWithInteger:origin];
  [v10 encodeObject:v6 forKey:@"SVXTaskContext::origin"];

  v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v10 encodeObject:v7 forKey:@"SVXTaskContext::timestamp"];

  [v10 encodeObject:self->_sessionUUID forKey:@"SVXTaskContext::sessionUUID"];
  [v10 encodeObject:self->_requestUUID forKey:@"SVXTaskContext::requestUUID"];
  [v10 encodeObject:self->_aceId forKey:@"SVXTaskContext::aceId"];
  [v10 encodeObject:self->_refId forKey:@"SVXTaskContext::refId"];
  [v10 encodeObject:self->_dialogIdentifier forKey:@"SVXTaskContext::dialogIdentifier"];
  [v10 encodeObject:self->_dialogPhase forKey:@"SVXTaskContext::dialogPhase"];
  v8 = [NSNumber numberWithBool:self->_isUUFR];
  [v10 encodeObject:v8 forKey:@"SVXTaskContext::isUUFR"];

  v9 = [NSNumber numberWithBool:self->_listensAfterSpeaking];
  [v10 encodeObject:v9 forKey:@"SVXTaskContext::listensAfterSpeaking"];

  [v10 encodeObject:self->_listenAfterSpeakingBehavior forKey:@"SVXTaskContext::listenAfterSpeakingBehavior"];
  [v10 encodeObject:self->_activationContext forKey:@"SVXTaskContext::activationContext"];
  [v10 encodeObject:self->_deactivationContext forKey:@"SVXTaskContext::deactivationContext"];
  [v10 encodeObject:self->_error forKey:@"SVXTaskContext::error"];
}

- (SVXTaskContext)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::origin"];
  uint64_t v23 = [v4 integerValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::timestamp"];
  uint64_t v22 = [v5 unsignedLongLongValue];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::sessionUUID"];
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::requestUUID"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::aceId"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::refId"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::dialogIdentifier"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::dialogPhase"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::isUUFR"];
  char v9 = [v8 BOOLValue];

  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::listensAfterSpeaking"];
  char v11 = [v10 BOOLValue];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::listenAfterSpeakingBehavior"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::activationContext"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::deactivationContext"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXTaskContext::error"];

  BYTE1(v17) = v11;
  LOBYTE(v17) = v9;
  v25 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](self, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", v23, v22, v19, v18, v21, v20, v6, v7, v17, v12, v13, v14, v15);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SVXTaskContext *)a3;
  if (self == v4)
  {
    BOOL v32 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t origin = self->_origin;
      if (origin == [(SVXTaskContext *)v5 origin]
        && (unint64_t timestamp = self->_timestamp, timestamp == [(SVXTaskContext *)v5 timestamp])
        && (BOOL isUUFR = self->_isUUFR, isUUFR == [(SVXTaskContext *)v5 isUUFR])
        && (BOOL listensAfterSpeaking = self->_listensAfterSpeaking,
            listensAfterSpeaking == [(SVXTaskContext *)v5 listensAfterSpeaking]))
      {
        id v10 = [(SVXTaskContext *)v5 sessionUUID];
        sessionUUID = self->_sessionUUID;
        if (sessionUUID == v10 || [(NSUUID *)sessionUUID isEqual:v10])
        {
          v12 = [(SVXTaskContext *)v5 requestUUID];
          requestUUID = self->_requestUUID;
          if (requestUUID == v12 || [(NSUUID *)requestUUID isEqual:v12])
          {
            v14 = [(SVXTaskContext *)v5 aceId];
            aceId = self->_aceId;
            if (aceId == v14 || [(NSString *)aceId isEqual:v14])
            {
              v16 = [(SVXTaskContext *)v5 refId];
              refId = self->_refId;
              if (refId == v16 || [(NSString *)refId isEqual:v16])
              {
                v18 = [(SVXTaskContext *)v5 dialogIdentifier];
                dialogIdentifier = self->_dialogIdentifier;
                if (dialogIdentifier == v18 || [(NSString *)dialogIdentifier isEqual:v18])
                {
                  v20 = [(SVXTaskContext *)v5 dialogPhase];
                  dialogPhase = self->_dialogPhase;
                  if (dialogPhase == v20 || [(NSString *)dialogPhase isEqual:v20])
                  {
                    uint64_t v22 = [(SVXTaskContext *)v5 listenAfterSpeakingBehavior];
                    listenAfterSpeakingBehavior = self->_listenAfterSpeakingBehavior;
                    if (listenAfterSpeakingBehavior == v22
                      || [(SAUIListenAfterSpeakingBehavior *)listenAfterSpeakingBehavior isEqual:v22])
                    {
                      v35 = v22;
                      v24 = [(SVXTaskContext *)v5 activationContext];
                      activationContext = self->_activationContext;
                      if (activationContext == v24
                        || [(SVXActivationContext *)activationContext isEqual:v24])
                      {
                        v26 = [(SVXTaskContext *)v5 deactivationContext];
                        deactivationContext = self->_deactivationContext;
                        if (deactivationContext == v26
                          || [(SVXDeactivationContext *)deactivationContext isEqual:v26])
                        {
                          v28 = [(SVXTaskContext *)v5 error];
                          error = self->_error;
                          BOOL v32 = 1;
                          if (error != v28)
                          {
                            v30 = v28;
                            int v31 = [(NSError *)error isEqual:v28];
                            v28 = v30;
                            if (!v31) {
                              BOOL v32 = 0;
                            }
                          }
                        }
                        else
                        {
                          BOOL v32 = 0;
                        }

                        v24 = v34;
                      }
                      else
                      {
                        BOOL v32 = 0;
                      }

                      uint64_t v22 = v35;
                    }
                    else
                    {
                      BOOL v32 = 0;
                    }
                  }
                  else
                  {
                    BOOL v32 = 0;
                  }
                }
                else
                {
                  BOOL v32 = 0;
                }
              }
              else
              {
                BOOL v32 = 0;
              }
            }
            else
            {
              BOOL v32 = 0;
            }
          }
          else
          {
            BOOL v32 = 0;
          }
        }
        else
        {
          BOOL v32 = 0;
        }
      }
      else
      {
        BOOL v32 = 0;
      }
    }
    else
    {
      BOOL v32 = 0;
    }
  }

  return v32;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithInteger:self->_origin];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(NSUUID *)self->_sessionUUID hash];
  uint64_t v8 = v7 ^ [(NSUUID *)self->_requestUUID hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_aceId hash];
  NSUInteger v10 = v6 ^ v9 ^ [(NSString *)self->_refId hash];
  NSUInteger v11 = [(NSString *)self->_dialogIdentifier hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_dialogPhase hash];
  v13 = [NSNumber numberWithBool:self->_isUUFR];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [NSNumber numberWithBool:self->_listensAfterSpeaking];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  uint64_t v17 = [(SAUIListenAfterSpeakingBehavior *)self->_listenAfterSpeakingBehavior hash];
  unint64_t v18 = v17 ^ [(SVXActivationContext *)self->_activationContext hash];
  unint64_t v19 = v18 ^ [(SVXDeactivationContext *)self->_deactivationContext hash];
  unint64_t v20 = v16 ^ v19 ^ [(NSError *)self->_error hash];

  return v20;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v14.receiver = self;
  v14.super_class = (Class)SVXTaskContext;
  v5 = [(SVXTaskContext *)&v14 description];
  unint64_t origin = self->_origin;
  if (origin > 0xC) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_264552770[origin];
  }
  uint64_t v8 = v7;
  NSUInteger v9 = v8;
  NSUInteger v10 = @"YES";
  if (self->_isUUFR) {
    NSUInteger v11 = @"YES";
  }
  else {
    NSUInteger v11 = @"NO";
  }
  if (!self->_listensAfterSpeaking) {
    NSUInteger v10 = @"NO";
  }
  v12 = (void *)[v4 initWithFormat:@"%@ {unint64_t origin = %@, timestamp = %llu, sessionUUID = %@, requestUUID = %@, aceId = %@, refId = %@, dialogIdentifier = %@, dialogPhase = %@, isUUFR = %@, listensAfterSpeaking = %@, listenAfterSpeakingBehavior = %@, activationContext = %@, deactivationContext = %@, error = %@}", v5, v8, *(_OWORD *)&self->_timestamp, *(_OWORD *)&self->_requestUUID, *(_OWORD *)&self->_refId, self->_dialogPhase, v11, v10, self->_listenAfterSpeakingBehavior, self->_activationContext, self->_deactivationContext, self->_error];

  return v12;
}

- (id)description
{
  return [(SVXTaskContext *)self _descriptionWithIndent:0];
}

- (SVXTaskContext)initWithOrigin:(int64_t)a3 timestamp:(unint64_t)a4 sessionUUID:(id)a5 requestUUID:(id)a6 aceId:(id)a7 refId:(id)a8 dialogIdentifier:(id)a9 dialogPhase:(id)a10 isUUFR:(BOOL)a11 listensAfterSpeaking:(BOOL)a12 listenAfterSpeakingBehavior:(id)a13 activationContext:(id)a14 deactivationContext:(id)a15 error:(id)a16
{
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v54 = a8;
  id v53 = a9;
  id v52 = a10;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  v55.receiver = self;
  v55.super_class = (Class)SVXTaskContext;
  v26 = [(SVXTaskContext *)&v55 init];
  v27 = v26;
  if (v26)
  {
    v26->_unint64_t origin = a3;
    v26->_unint64_t timestamp = a4;
    uint64_t v28 = [v19 copy];
    sessionUUID = v27->_sessionUUID;
    v27->_sessionUUID = (NSUUID *)v28;

    uint64_t v30 = [v20 copy];
    requestUUID = v27->_requestUUID;
    v27->_requestUUID = (NSUUID *)v30;

    uint64_t v32 = [v21 copy];
    aceId = v27->_aceId;
    v27->_aceId = (NSString *)v32;

    uint64_t v34 = [v54 copy];
    refId = v27->_refId;
    v27->_refId = (NSString *)v34;

    uint64_t v36 = [v53 copy];
    dialogIdentifier = v27->_dialogIdentifier;
    v27->_dialogIdentifier = (NSString *)v36;

    uint64_t v38 = [v52 copy];
    dialogPhase = v27->_dialogPhase;
    v27->_dialogPhase = (NSString *)v38;

    v27->_BOOL isUUFR = a11;
    v27->_BOOL listensAfterSpeaking = a12;
    uint64_t v40 = [v22 copy];
    listenAfterSpeakingBehavior = v27->_listenAfterSpeakingBehavior;
    v27->_listenAfterSpeakingBehavior = (SAUIListenAfterSpeakingBehavior *)v40;

    uint64_t v42 = [v23 copy];
    activationContext = v27->_activationContext;
    v27->_activationContext = (SVXActivationContext *)v42;

    uint64_t v44 = [v24 copy];
    deactivationContext = v27->_deactivationContext;
    v27->_deactivationContext = (SVXDeactivationContext *)v44;

    uint64_t v46 = [v25 copy];
    error = v27->_error;
    v27->_error = (NSError *)v46;
  }
  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXTaskContextMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXTaskContextMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXTaskContextMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXTaskContext *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = (void (**)(id, _SVXTaskContextMutation *))a3;
  id v4 = objc_alloc_init(_SVXTaskContextMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXTaskContextMutation *)v4 generate];

  return v5;
}

@end