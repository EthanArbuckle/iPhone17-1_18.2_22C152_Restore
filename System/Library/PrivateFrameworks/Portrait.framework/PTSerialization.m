@interface PTSerialization
+ (BOOL)_supportedOptions:(id)a3 forObject:(id)a4;
+ (BOOL)isValidObject:(id)a3;
+ (BOOL)registerSerializationClass:(Class)a3;
+ (BOOL)writeObject:(id)a3 toData:(id)a4 options:(id)a5 error:(id *)a6;
+ (Class)classForType:(unsigned int)a3;
+ (id)_errorFromAtomError:(id)a3;
+ (id)_errorFromAtomStream:(id)a3;
+ (id)_errorFromAtomWriter:(id)a3;
+ (id)_errorNotSerializable;
+ (id)_errorUnsupportedVersion;
+ (id)_errorWithCode:(int64_t)a3;
+ (id)dataFromObject:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)infoForType:(unsigned int)a3;
+ (id)objectFromData:(id)a3 error:(id *)a4;
+ (unint64_t)sizeOfSerializedObject:(id)a3 options:(id)a4;
+ (void)registerType:(unsigned int)a3 providerClass:(Class)a4;
+ (void)registerTypeInfo:(id)a3;
@end

@implementation PTSerialization

+ (BOOL)registerSerializationClass:(Class)a3
{
  char v4 = [(objc_class *)a3 conformsToProtocol:&unk_1F26D0780];
  if (v4)
  {
    [(objc_class *)a3 registerForSerialization];
  }
  else
  {
    v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PTSerialization registerSerializationClass:](a3, v5);
    }
  }
  return v4;
}

+ (BOOL)isValidObject:(id)a3
{
  return [a3 conformsToProtocol:&unk_1F26D0780];
}

+ (unint64_t)sizeOfSerializedObject:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isValidObject:v6]) {
    unint64_t v8 = [v6 sizeOfSerializedObjectWithOptions:v7];
  }
  else {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (id)objectFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[PTDataByteStream alloc] initWithData:v6];

  unint64_t v8 = [[PTAtomStream alloc] initWithByteStream:v7];
  v9 = [(PTAtomStream *)v8 error];

  if (v9 || (v10 = objc_msgSend(a1, "classForType:", -[PTAtomStream atomType](v8, "atomType"))) == 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = [v10 objectFromAtomStream:v8];
  }
  v12 = [(PTAtomStream *)v8 error];

  if (v12)
  {
    v13 = [a1 _errorFromAtomStream:v8];
  }
  else
  {
    if (v11)
    {
      id v14 = 0;
      goto LABEL_11;
    }
    v13 = [a1 _errorNotSerializable];
  }
  id v14 = v13;
  if (a4 && v13)
  {
    id v14 = v13;
    *a4 = v14;
  }
LABEL_11:

  return v11;
}

+ (id)dataFromObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  LODWORD(a5) = [a1 writeObject:v9 toData:v10 options:v8 error:a5];

  if (a5) {
    v11 = (void *)[v10 copy];
  }
  else {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_supportedOptions:(id)a3 forObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"PTSerializationVersionKey"];

  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:@"PTSerializationVersionKey"];
    uint64_t v9 = [v8 integerValue];

    char v10 = [v6 supportsVersion:v9];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

+ (BOOL)writeObject:(id)a3 toData:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([a1 isValidObject:v10])
  {
    if ([a1 _supportedOptions:v12 forObject:v10])
    {
      v13 = [[PTDataByteWriter alloc] initWithMutableData:v11];
      id v14 = [[PTAtomWriter alloc] initWithByteWriter:v13];
      [v10 writeToAtomWriter:v14 options:v12];
      v15 = 0;
      goto LABEL_7;
    }
    uint64_t v16 = [a1 _errorUnsupportedVersion];
  }
  else
  {
    uint64_t v16 = [a1 _errorNotSerializable];
  }
  v15 = (void *)v16;
  id v14 = 0;
  v13 = 0;
LABEL_7:
  v17 = [(PTAtomWriter *)v14 error];

  if (v17)
  {
    uint64_t v18 = [a1 _errorFromAtomWriter:v14];

    v15 = (void *)v18;
  }
  if (a6 && v15) {
    *a6 = v15;
  }

  return v15 == 0;
}

+ (void)registerTypeInfo:(id)a3
{
  id v3 = a3;
  char v4 = _PTLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[PTSerialization registerTypeInfo:](v3, v4);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&sInfoForTypeLock);
  id v5 = (void *)sInfoForType;
  if (!sInfoForType)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)sInfoForType;
    sInfoForType = v6;

    id v5 = (void *)sInfoForType;
  }
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "type"));
  [v5 setObject:v3 forKeyedSubscript:v8];

  os_unfair_lock_unlock((os_unfair_lock_t)&sInfoForTypeLock);
}

+ (id)infoForType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sInfoForTypeLock);
  char v4 = (void *)sInfoForType;
  id v5 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&sInfoForTypeLock);

  return v6;
}

+ (Class)classForType:(unsigned int)a3
{
  uint64_t v3 = [a1 infoForType:*(void *)&a3];
  char v4 = [v3 providerClass];

  return (Class)v4;
}

+ (void)registerType:(unsigned int)a3 providerClass:(Class)a4
{
  id v5 = [[PTSerializationTypeInfo alloc] initWithType:*(void *)&a3 providerClass:a4];
  [a1 registerTypeInfo:v5];
}

+ (id)_errorUnsupportedVersion
{
  return (id)[a1 _errorWithCode:1];
}

+ (id)_errorNotSerializable
{
  return (id)[a1 _errorWithCode:2];
}

+ (id)_errorWithCode:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.portrait.serialization" code:a3 userInfo:0];
}

+ (id)_errorFromAtomWriter:(id)a3
{
  char v4 = [a3 error];
  id v5 = [a1 _errorFromAtomError:v4];

  return v5;
}

+ (id)_errorFromAtomStream:(id)a3
{
  char v4 = [a3 error];
  id v5 = [a1 _errorFromAtomError:v4];

  return v5;
}

+ (id)_errorFromAtomError:(id)a3
{
  char v4 = (void *)[a3 code];
  if (v4)
  {
    char v4 = [a1 _errorWithCode:3];
  }

  return v4;
}

+ (void)registerSerializationClass:(objc_class *)a1 .cold.1(objc_class *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromClass(a1);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "attempt to register class %@ for serialization that does not support PTSerialization protocol", (uint8_t *)&v4, 0xCu);
}

+ (void)registerTypeInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromFourCharCode([a1 type]);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1D0778000, a2, OS_LOG_TYPE_DEBUG, "registering atom type %@", (uint8_t *)&v4, 0xCu);
}

@end