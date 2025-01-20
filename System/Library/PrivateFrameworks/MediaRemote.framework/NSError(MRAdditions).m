@interface NSError(MRAdditions)
- (_MRErrorProtobuf)mr_protobuf;
- (id)mr_errorByEnvelopingWithMRError:()MRAdditions;
- (id)mr_initWithProtobuf:()MRAdditions;
- (id)recursiveUnderlyingError;
- (uint64_t)initWithMRError:()MRAdditions;
- (uint64_t)initWithMRError:()MRAdditions description:;
- (uint64_t)initWithMRError:()MRAdditions format:;
- (uint64_t)initWithMRError:()MRAdditions userInfo:;
- (uint64_t)mr_isMediaRemoteError;
@end

@implementation NSError(MRAdditions)

- (uint64_t)initWithMRError:()MRAdditions
{
  return [a1 initWithMRError:a3 userInfo:0];
}

- (uint64_t)initWithMRError:()MRAdditions userInfo:
{
  if (a4)
  {
    uint64_t v6 = [a4 mutableCopy];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  v7 = (void *)v6;
  v8 = (__CFString *)MRMediaRemoteErrorCopyDescription(a3);
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  uint64_t v9 = [a1 initWithDomain:@"kMRMediaRemoteFrameworkErrorDomain" code:a3 userInfo:v7];
  return v9;
}

- (uint64_t)initWithMRError:()MRAdditions format:
{
  if (a4)
  {
    v11 = (objc_class *)NSString;
    id v12 = a4;
    v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];
  }
  else
  {
    v13 = 0;
  }
  uint64_t v14 = [a1 initWithMRError:a3 description:v13];

  return v14;
}

- (uint64_t)initWithMRError:()MRAdditions description:
{
  if (a4)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v7 = a4;
    v8 = (void *)[[v6 alloc] initWithCapacity:1];
    [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = [a1 initWithMRError:a3 userInfo:v8];

  return v9;
}

- (id)mr_errorByEnvelopingWithMRError:()MRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = a1;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = (void *)[v5 initWithMRError:a3 userInfo:v6];

  return v7;
}

- (id)recursiveUnderlyingError
{
  v1 = [a1 userInfo];
  uint64_t v2 = *MEMORY[0x1E4F28A50];
  for (i = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  {

    v4 = [i userInfo];
    id v5 = [v4 objectForKeyedSubscript:v2];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      break;
    }
    v1 = [i userInfo];
    uint64_t v7 = [v1 objectForKeyedSubscript:v2];
  }

  return i;
}

- (uint64_t)mr_isMediaRemoteError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"kMRMediaRemoteFrameworkErrorDomain"];

  return v2;
}

- (id)mr_initWithProtobuf:()MRAdditions
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    uint64_t v7 = [v5 localizedDescription];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    v8 = [v5 localizedFailureReason];
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28588]];

    uint64_t v9 = [v5 underlyingErrors];
    v10 = objc_msgSend(v9, "msv_map:", &__block_literal_global_73);
    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28750]];

    id v11 = a1;
    id v12 = [v5 domain];
    LODWORD(v10) = [v5 code];

    v13 = (void *)[v11 initWithDomain:v12 code:(int)v10 userInfo:v6];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_MRErrorProtobuf)mr_protobuf
{
  uint64_t v2 = objc_alloc_init(_MRErrorProtobuf);
  v3 = [a1 domain];
  [(_MRErrorProtobuf *)v2 setDomain:v3];

  -[_MRErrorProtobuf setCode:](v2, "setCode:", [a1 code]);
  v4 = [a1 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
  [(_MRErrorProtobuf *)v2 setLocalizedDescription:v5];

  id v6 = [a1 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];
  [(_MRErrorProtobuf *)v2 setLocalizedFailureReason:v7];

  v8 = [a1 underlyingErrors];
  uint64_t v9 = objc_msgSend(v8, "msv_map:", &__block_literal_global_7_1);
  v10 = (void *)[v9 mutableCopy];
  [(_MRErrorProtobuf *)v2 setUnderlyingErrors:v10];

  return v2;
}

@end