@interface _UIViewServiceDeputyXPCInterfaceInvocationFactory
+ (id)invocationForConnectionSelector:(id)a3;
@end

@implementation _UIViewServiceDeputyXPCInterfaceInvocationFactory

+ (id)invocationForConnectionSelector:(id)a3
{
  id v3 = a3;
  v4 = [v3 connectionProtocol];
  v5 = (const char *)[v3 connectionSelector];
  types = protocol_getMethodDescription(v4, v5, 1, 1).types;
  if (!types) {
    types = protocol_getMethodDescription(v4, v5, 0, 1).types;
  }
  v7 = (void *)MEMORY[0x1E4F1CA18];
  v8 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  v9 = [v7 invocationWithMethodSignature:v8];

  return v9;
}

@end