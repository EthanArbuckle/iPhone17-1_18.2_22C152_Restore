@interface ErrorHandlerSession
- (BOOL)isEqual:(id)a3;
- (ErrorHandlerSession)init;
- (NSDictionary)sessionProperties;
- (id)valueForSessionProperty:(id)a3;
- (int64_t)sessionIdentifier;
- (unint64_t)hash;
- (void)dealloc;
- (void)setSessionProperties:(id)a3;
- (void)setValue:(id)a3 forSessionProperty:(id)a4;
@end

@implementation ErrorHandlerSession

- (ErrorHandlerSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)ErrorHandlerSession;
  v2 = [(ErrorHandlerSession *)&v5 init];
  if (v2)
  {
    CFUUIDRef v3 = CFUUIDCreate(0);
    v2->_sessionID = *(_OWORD *)&CFUUIDGetUUIDBytes(v3);
    CFRelease(v3);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ErrorHandlerSession;
  [(ErrorHandlerSession *)&v3 dealloc];
}

- (void)setValue:(id)a3 forSessionProperty:(id)a4
{
  sessionProperties = self->_sessionProperties;
  if (a3)
  {
    if (!sessionProperties)
    {
      sessionProperties = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->_sessionProperties = sessionProperties;
    }
    [(NSMutableDictionary *)sessionProperties setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)sessionProperties removeObjectForKey:a4];
  }
}

- (id)valueForSessionProperty:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_sessionProperties objectForKey:a3];

  return v3;
}

- (unint64_t)hash
{
  return self->_sessionID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  id v7 = [(ErrorHandlerSession *)self sessionIdentifier];
  return v7 == [a3 sessionIdentifier];
}

- (int64_t)sessionIdentifier
{
  return self->_sessionID;
}

- (NSDictionary)sessionProperties
{
  return &self->_sessionProperties->super;
}

- (void)setSessionProperties:(id)a3
{
}

@end