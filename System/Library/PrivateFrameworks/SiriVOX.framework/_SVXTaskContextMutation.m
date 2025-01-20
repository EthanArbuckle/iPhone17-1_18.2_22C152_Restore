@interface _SVXTaskContextMutation
- (_SVXTaskContextMutation)init;
- (_SVXTaskContextMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setAceId:(id)a3;
- (void)setActivationContext:(id)a3;
- (void)setDeactivationContext:(id)a3;
- (void)setDialogIdentifier:(id)a3;
- (void)setDialogPhase:(id)a3;
- (void)setError:(id)a3;
- (void)setIsUUFR:(BOOL)a3;
- (void)setListenAfterSpeakingBehavior:(id)a3;
- (void)setListensAfterSpeaking:(BOOL)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setRefId:(id)a3;
- (void)setRequestUUID:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation _SVXTaskContextMutation

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

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [SVXTaskContext alloc];
    LOWORD(v28) = *(_WORD *)&self->_isUUFR;
    uint64_t v5 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](v6, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", self->_origin, self->_timestamp, self->_sessionUUID, self->_requestUUID, self->_aceId, self->_refId, self->_dialogIdentifier, self->_dialogPhase, v28, self->_listenAfterSpeakingBehavior, self->_activationContext, self->_deactivationContext, self->_error);
    goto LABEL_5;
  }
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if (mutationFlags)
  {
    if ((mutationFlags & 2) != 0)
    {
      int64_t origin = self->_origin;
      if ((mutationFlags & 4) != 0)
      {
LABEL_8:
        unint64_t timestamp = self->_timestamp;
        if ((mutationFlags & 8) != 0)
        {
LABEL_9:
          v8 = self->_sessionUUID;
          goto LABEL_13;
        }
LABEL_12:
        v8 = [(SVXTaskContext *)self->_baseModel sessionUUID];
LABEL_13:
        v33 = v8;
        if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
        {
          v9 = self->_requestUUID;
        }
        else
        {
          v9 = [(SVXTaskContext *)self->_baseModel requestUUID];
        }
        v31 = v9;
        if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
        {
          v10 = self->_aceId;
        }
        else
        {
          v10 = [(SVXTaskContext *)self->_baseModel aceId];
        }
        v30 = v10;
        if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
        {
          v11 = self->_refId;
        }
        else
        {
          v11 = [(SVXTaskContext *)self->_baseModel refId];
        }
        v29 = v11;
        if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
        {
          v12 = self->_dialogIdentifier;
        }
        else
        {
          v12 = [(SVXTaskContext *)self->_baseModel dialogIdentifier];
        }
        v13 = v12;
        if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
        {
          v14 = self->_dialogPhase;
        }
        else
        {
          v14 = [(SVXTaskContext *)self->_baseModel dialogPhase];
        }
        v15 = v14;
        __int16 v16 = (__int16)self->_mutationFlags;
        if ((v16 & 0x200) != 0)
        {
          BOOL isUUFR = self->_isUUFR;
          if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
          {
LABEL_30:
            BOOL listensAfterSpeaking = self->_listensAfterSpeaking;
            if ((v16 & 0x800) != 0)
            {
LABEL_31:
              v19 = self->_listenAfterSpeakingBehavior;
LABEL_35:
              v20 = v19;
              if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
              {
                v21 = self->_activationContext;
              }
              else
              {
                v21 = [(SVXTaskContext *)self->_baseModel activationContext];
              }
              v22 = v21;
              if ((*(_WORD *)&self->_mutationFlags & 0x2000) != 0)
              {
                v23 = self->_deactivationContext;
              }
              else
              {
                v23 = [(SVXTaskContext *)self->_baseModel deactivationContext];
              }
              v24 = v23;
              if ((*(_WORD *)&self->_mutationFlags & 0x4000) != 0)
              {
                v25 = self->_error;
              }
              else
              {
                v25 = [(SVXTaskContext *)self->_baseModel error];
              }
              v26 = v25;
              BYTE1(v28) = listensAfterSpeaking;
              LOBYTE(v28) = isUUFR;
              v7 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:]([SVXTaskContext alloc], "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", origin, timestamp, v33, v31, v30, v29, v13, v15, v28, v20, v22, v24, v25);

              goto LABEL_45;
            }
LABEL_34:
            v19 = [(SVXTaskContext *)self->_baseModel listenAfterSpeakingBehavior];
            goto LABEL_35;
          }
        }
        else
        {
          BOOL isUUFR = [(SVXTaskContext *)self->_baseModel isUUFR];
          __int16 v16 = (__int16)self->_mutationFlags;
          if ((v16 & 0x400) != 0) {
            goto LABEL_30;
          }
        }
        BOOL listensAfterSpeaking = [(SVXTaskContext *)self->_baseModel listensAfterSpeaking];
        if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0) {
          goto LABEL_31;
        }
        goto LABEL_34;
      }
    }
    else
    {
      int64_t origin = [(SVXTaskContext *)baseModel origin];
      __int16 mutationFlags = (__int16)self->_mutationFlags;
      if ((mutationFlags & 4) != 0) {
        goto LABEL_8;
      }
    }
    unint64_t timestamp = [(SVXTaskContext *)self->_baseModel timestamp];
    if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v5 = [(SVXTaskContext *)baseModel copy];
LABEL_5:
  v7 = (SVXTaskContext *)v5;
LABEL_45:

  return v7;
}

- (void)setError:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x4001u;
}

- (void)setDeactivationContext:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x2001u;
}

- (void)setActivationContext:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (void)setListensAfterSpeaking:(BOOL)a3
{
  self->_BOOL listensAfterSpeaking = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (void)setIsUUFR:(BOOL)a3
{
  self->_BOOL isUUFR = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (void)setDialogPhase:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (void)setDialogIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (void)setRefId:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (void)setAceId:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (void)setRequestUUID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (void)setSessionUUID:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_unint64_t timestamp = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (void)setOrigin:(int64_t)a3
{
  self->_int64_t origin = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (_SVXTaskContextMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXTaskContextMutation;
  v6 = [(_SVXTaskContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXTaskContextMutation)init
{
  return [(_SVXTaskContextMutation *)self initWithBaseModel:0];
}

@end