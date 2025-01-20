@interface SDBLEPowerSourceContainer
- (BOOL)isEqual:(id)a3;
- (SDBLEPowerSourceContainer)initWithPowerSource:(id)a3;
- (SFPowerSource)powerSource;
- (id)description;
- (id)invalidationHandler;
- (int)publish;
- (unint64_t)hash;
- (void)_invalidate;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
- (void)trigger;
@end

@implementation SDBLEPowerSourceContainer

- (SDBLEPowerSourceContainer)initWithPowerSource:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SDBLEPowerSourceContainer;
  v6 = [(SDBLEPowerSourceContainer *)&v20 init];
  v7 = v6;
  if (v6)
  {
    int v19 = 0;
    v18 = 0;
    v12 = v6;
    ASPrintF();
    v7->_ucat = (LogCategory *)LogCategoryCreateEx();
    if (v19) {
      v7->_ucat = (LogCategory *)LogCategoryCreateEx();
    }
    if (v18) {
      free(v18);
    }
    objc_storeStrong((id *)&v7->_powerSource, a3);
    uint64_t v8 = objc_opt_new();
    powerSourceIdleCoalescer = v7->_powerSourceIdleCoalescer;
    v7->_powerSourceIdleCoalescer = (CUCoalescer *)v8;

    -[CUCoalescer setMinDelay:](v7->_powerSourceIdleCoalescer, "setMinDelay:", 30.0, v12);
    id location = 0;
    objc_initWeak(&location, v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100048FE4;
    v15[3] = &unk_1008CA3B0;
    objc_copyWeak(&v16, &location);
    [(CUCoalescer *)v7->_powerSourceIdleCoalescer setActionHandler:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100049074;
    v13[3] = &unk_1008CA3B0;
    objc_copyWeak(&v14, &location);
    [(CUCoalescer *)v7->_powerSourceIdleCoalescer setInvalidationHandler:v13];
    int var0 = v7->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    [(SDBLEPowerSourceContainer *)self powerSource];
    v6 = id v5 = "-[SDBLEPowerSourceContainer dealloc]";
    LogPrintF();
  }
  [(SDBLEPowerSourceContainer *)self _invalidate];
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SDBLEPowerSourceContainer;
  [(SDBLEPowerSourceContainer *)&v7 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SDBLEPowerSourceContainer *)self powerSource];
    v6 = [v4 powerSource];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      unsigned __int8 v10 = 1;
    }
    else if ((v7 == 0) == (v8 != 0))
    {
      unsigned __int8 v10 = 0;
    }
    else
    {
      unsigned __int8 v10 = [v7 isEqual:v8];
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)[(SFPowerSource *)self->_powerSource hash];
}

- (id)description
{
  uint64_t v6 = objc_opt_class();
  NSAppendPrintF();
  id v8 = 0;
  id v7 = [(SDBLEPowerSourceContainer *)self powerSource];
  NSAppendPrintF();
  id v3 = v8;

  NSAppendPrintF();
  id v4 = v3;

  return v4;
}

- (void)setInvalidationHandler:(id)a3
{
  if (self->_invalidationHandler != a3)
  {
    id v4 = [a3 copy];
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = v4;
  }
}

- (void)trigger
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v5 = [(SDBLEPowerSourceContainer *)self powerSource];
      LogPrintF();
    }
    powerSourceIdleCoalescer = self->_powerSourceIdleCoalescer;
    [(CUCoalescer *)powerSourceIdleCoalescer trigger];
  }
}

- (int)publish
{
  int var0 = self->_ucat->var0;
  if (!self->_invalidateCalled)
  {
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [(SDBLEPowerSourceContainer *)self powerSource];
      id v8 = v7 = "-[SDBLEPowerSourceContainer publish]";
      LogPrintF();
    }
    [(SDBLEPowerSourceContainer *)self trigger];
    id v4 = [(SDBLEPowerSourceContainer *)self powerSource];
    int v5 = [v4 publish];
    goto LABEL_12;
  }
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v4 = [(SDBLEPowerSourceContainer *)self powerSource];
    LogPrintF();
    int v5 = -6703;
LABEL_12:

    return v5;
  }
  return -6703;
}

- (void)invalidate
{
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v4 = [(SDBLEPowerSourceContainer *)self powerSource];
    LogPrintF();
  }

  [(SDBLEPowerSourceContainer *)self _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [(SDBLEPowerSourceContainer *)self powerSource];
      v9 = id v8 = "-[SDBLEPowerSourceContainer _invalidate]";
      LogPrintF();
    }
    -[CUCoalescer setActionHandler:](self->_powerSourceIdleCoalescer, "setActionHandler:", 0, v8, v9);
    [(CUCoalescer *)self->_powerSourceIdleCoalescer setInvalidationHandler:0];
    [(CUCoalescer *)self->_powerSourceIdleCoalescer invalidate];
    powerSourceIdleCoalescer = self->_powerSourceIdleCoalescer;
    self->_powerSourceIdleCoalescer = 0;

    int v5 = [(SDBLEPowerSourceContainer *)self powerSource];
    [v5 invalidate];

    uint64_t v6 = [(SDBLEPowerSourceContainer *)self invalidationHandler];

    if (v6)
    {
      id v7 = [(SDBLEPowerSourceContainer *)self invalidationHandler];
      v7[2]();

      [(SDBLEPowerSourceContainer *)self setInvalidationHandler:0];
    }
  }
}

- (SFPowerSource)powerSource
{
  return self->_powerSource;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_powerSource, 0);

  objc_storeStrong((id *)&self->_powerSourceIdleCoalescer, 0);
}

@end