@interface DownloadHandlerSession
- (BOOL)blocksOtherDownloads;
- (BOOL)canBePaused;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsPowerAssertion;
- (DownloadHandlerSession)init;
- (DownloadHandlerSession)initWithSessionProperties:(id)a3;
- (DownloadSessionProperties)sessionProperties;
- (NSError)error;
- (NSString)statusDescription;
- (NSURLCredential)URLCredential;
- (float)percentComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForSessionProperty:(id)a3;
- (int64_t)activeHandlerIdentifier;
- (int64_t)sessionID;
- (int64_t)sessionState;
- (unint64_t)hash;
- (void)dealloc;
- (void)setActiveHandlerIdentifier:(int64_t)a3;
- (void)setBlocksOtherDownloads:(BOOL)a3;
- (void)setCanBePaused:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setNeedsPowerAssertion:(BOOL)a3;
- (void)setPercentComplete:(float)a3;
- (void)setSessionPropertyValues:(id)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setStatusDescription:(id)a3;
- (void)setURLCredential:(id)a3;
- (void)setValue:(id)a3 forSessionProperty:(id)a4;
@end

@implementation DownloadHandlerSession

- (DownloadHandlerSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadHandlerSession;
  v2 = [(DownloadHandlerSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(DownloadHandlerSession *)v2 setCanBePaused:1];
    CFUUIDRef v4 = CFUUIDCreate(0);
    v3->_sessionID = *(_OWORD *)&CFUUIDGetUUIDBytes(v4);
    CFRelease(v4);
  }
  return v3;
}

- (DownloadHandlerSession)initWithSessionProperties:(id)a3
{
  CFUUIDRef v4 = [(DownloadHandlerSession *)self init];
  if (v4) {
    v4->_sessionProperties = (DownloadSessionProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadHandlerSession;
  [(DownloadHandlerSession *)&v3 dealloc];
}

- (BOOL)blocksOtherDownloads
{
  id v2 = [(NSMutableDictionary *)self->_propertyValues objectForKey:@"blocks"];

  return [v2 BOOLValue];
}

- (BOOL)canBePaused
{
  id v2 = [(NSMutableDictionary *)self->_propertyValues objectForKey:@"pausable"];

  return [v2 BOOLValue];
}

- (BOOL)needsPowerAssertion
{
  id v2 = [(NSMutableDictionary *)self->_propertyValues objectForKey:@"needspowerassert"];

  return [v2 BOOLValue];
}

- (float)percentComplete
{
  id v2 = [(NSMutableDictionary *)self->_propertyValues objectForKey:@"percent"];

  [v2 floatValue];
  return result;
}

- (int64_t)sessionState
{
  id v2 = [(NSMutableDictionary *)self->_propertyValues objectForKey:@"state"];

  return (int64_t)[v2 integerValue];
}

- (void)setBlocksOtherDownloads:(BOOL)a3
{
  CFUUIDRef v4 = +[NSNumber numberWithBool:a3];

  [(DownloadHandlerSession *)self setValue:v4 forSessionProperty:@"blocks"];
}

- (void)setCanBePaused:(BOOL)a3
{
  CFUUIDRef v4 = +[NSNumber numberWithBool:a3];

  [(DownloadHandlerSession *)self setValue:v4 forSessionProperty:@"pausable"];
}

- (void)setNeedsPowerAssertion:(BOOL)a3
{
  CFUUIDRef v4 = +[NSNumber numberWithBool:a3];

  [(DownloadHandlerSession *)self setValue:v4 forSessionProperty:@"needspowerassert"];
}

- (void)setPercentComplete:(float)a3
{
  CFUUIDRef v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [(DownloadHandlerSession *)self setValue:v4 forSessionProperty:@"percent"];
}

- (void)setSessionPropertyValues:(id)a3
{
  propertyValues = self->_propertyValues;
  if (!propertyValues)
  {
    propertyValues = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_propertyValues = propertyValues;
  }

  [(NSMutableDictionary *)propertyValues addEntriesFromDictionary:a3];
}

- (void)setSessionState:(int64_t)a3
{
  CFUUIDRef v4 = +[NSNumber numberWithInteger:a3];

  [(DownloadHandlerSession *)self setValue:v4 forSessionProperty:@"state"];
}

- (void)setStatusDescription:(id)a3
{
  id v4 = [a3 copy];
  [(DownloadHandlerSession *)self setValue:v4 forSessionProperty:@"status"];
}

- (void)setValue:(id)a3 forSessionProperty:(id)a4
{
  propertyValues = self->_propertyValues;
  if (!propertyValues)
  {
    propertyValues = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_propertyValues = propertyValues;
  }

  [(NSMutableDictionary *)propertyValues setObject:a3 forKey:a4];
}

- (NSString)statusDescription
{
  return (NSString *)[(DownloadHandlerSession *)self valueForSessionProperty:@"status"];
}

- (id)valueForSessionProperty:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_propertyValues objectForKey:a3];

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
  id v7 = [(DownloadHandlerSession *)self sessionID];
  return v7 == [a3 sessionID];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)v5 + 1) = self->_activeHandlerIdentifier;
  *((void *)v5 + 4) = self->_sessionID;

  *((void *)v5 + 2) = [(NSError *)self->_error copyWithZone:a3];
  *((void *)v5 + 3) = [(NSMutableDictionary *)self->_propertyValues mutableCopyWithZone:a3];

  *((void *)v5 + 5) = [(DownloadSessionProperties *)self->_sessionProperties copyWithZone:a3];
  *((void *)v5 + 6) = [(NSURLCredential *)self->_urlCredential copyWithZone:a3];
  return v5;
}

- (int64_t)activeHandlerIdentifier
{
  return self->_activeHandlerIdentifier;
}

- (void)setActiveHandlerIdentifier:(int64_t)a3
{
  self->_activeHandlerIdentifier = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)sessionID
{
  return self->_sessionID;
}

- (DownloadSessionProperties)sessionProperties
{
  return self->_sessionProperties;
}

- (NSURLCredential)URLCredential
{
  return self->_urlCredential;
}

- (void)setURLCredential:(id)a3
{
}

@end