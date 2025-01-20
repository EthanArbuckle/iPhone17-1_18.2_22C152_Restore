@interface SEFidoEvents
+ (NSString)baaError;
+ (NSString)callerError;
+ (NSString)fidoKeyCreated;
+ (NSString)fidoKeyFound;
+ (NSString)fidoKeyNotFound;
+ (NSString)fidoKeySignatureGenerated;
+ (NSString)fidoVerificationFailed;
+ (NSString)fidoVerificationSucceeded;
+ (NSString)keyAttestationError;
+ (NSString)keyCreationError;
+ (NSString)keyDecodeError;
+ (NSString)keyExportError;
+ (NSString)keychainAddError;
+ (NSString)keychainNotEnabledError;
+ (NSString)keychainQueryError;
+ (NSString)serviceError;
+ (NSString)signatureError;
+ (NSString)unspecifiedError;
+ (NSString)viewNotSyncedError;
- (_TtC10seserviced12SEFidoEvents)init;
@end

@implementation SEFidoEvents

+ (NSString)fidoKeyCreated
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)fidoKeySignatureGenerated
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)fidoKeyFound
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)fidoKeyNotFound
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)fidoVerificationSucceeded
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)fidoVerificationFailed
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)callerError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)serviceError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)viewNotSyncedError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)keychainNotEnabledError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)keyCreationError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)keyExportError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)keyAttestationError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)keyDecodeError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)signatureError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)keychainAddError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)keychainQueryError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)baaError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)unspecifiedError
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (_TtC10seserviced12SEFidoEvents)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SEFidoEvents *)&v3 init];
}

@end