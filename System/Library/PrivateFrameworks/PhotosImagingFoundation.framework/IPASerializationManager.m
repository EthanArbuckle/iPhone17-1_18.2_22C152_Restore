@interface IPASerializationManager
+ (char)adjustmentTypeForFormat:(id)a3 formatVersion:(id)a4;
+ (char)debug_adjustmentTypeFromEnvelopeDictionary:(id)a3;
+ (id)_serializerForFormat:(id)a3 formatVersion:(id)a4 error:(id *)a5;
+ (id)debug_deserializeEnvelopeDictionary:(id)a3 error:(id *)a4;
+ (id)debug_serializeEnvelope:(id)a3 error:(id *)a4;
+ (id)deserialize:(id)a3 originator:(id)a4 format:(id)a5 formatVersion:(id)a6 error:(id *)a7;
+ (id)formatForAdjustmentStack:(id)a3;
+ (id)serialize:(id)a3 error:(id *)a4;
+ (id)serialize:(id)a3 format:(id)a4 formatVersion:(id)a5 error:(id *)a6;
+ (id)serializeWithCurrentDefaultFormat:(id)a3 error:(id *)a4;
+ (id)serializeWithCurrentDefaultFormat:(id)a3 format:(id *)a4 formatVersion:(id *)a5 error:(id *)a6;
+ (id)serializerMap;
+ (void)initialize;
@end

@implementation IPASerializationManager

+ (id)debug_deserializeEnvelopeDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8CE90]];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8CEA0]];
  v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8CE88]];
  v15 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8CE80]];
  if (v15)
  {
    v16 = +[IPASerializationManager deserialize:v15 originator:v8 format:v6 formatVersion:v7 error:a4];
  }
  else if (a4)
  {
    IPAAdjustmentError(1001, @"failed to get data out of archive", v9, v10, v11, v12, v13, v14, v18);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (char)debug_adjustmentTypeFromEnvelopeDictionary:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F8CE90];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8CEA0]];

  LOBYTE(a1) = [a1 adjustmentTypeForFormat:v6 formatVersion:v7];
  return (char)a1;
}

+ (id)debug_serializeEnvelope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 serialize:v6 error:a4];
  if (v7)
  {
    v8 = objc_opt_new();
    uint64_t v9 = [v6 format];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F8CE90]];

    uint64_t v10 = [v6 formatVersion];
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F8CEA0]];

    uint64_t v11 = [v6 originator];
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F8CE88]];

    [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F8CE80]];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)deserialize:(id)a3 originator:(id)a4 format:(id)a5 formatVersion:(id)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = a6;
  if (!v14)
  {
    _PFAssertFailHandler();
    goto LABEL_24;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_24:
    v28 = (void *)_PFAssertFailHandler();
    return +[IPASerializationManager serialize:v30 format:v31 formatVersion:v32 error:v33];
  }
  id v36 = 0;
  v17 = [a1 _serializerForFormat:v14 formatVersion:v15 error:&v36];
  uint64_t v18 = (__CFString *)v36;
  if (v17)
  {
    if (v12)
    {
      v34 = a7;
      v19 = [MEMORY[0x1E4F1CA60] dictionary];
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"NSData %p with %lu bytes", v12, objc_msgSend(v12, "length"));
      [v19 setObject:v20 forKeyedSubscript:@"data"];

      if (v13) {
        v21 = v13;
      }
      else {
        v21 = @"nil";
      }
      [v19 setObject:v21 forKeyedSubscript:@"originator"];
      [v19 setObject:v14 forKeyedSubscript:@"format"];
      [v19 setObject:v16 forKeyedSubscript:@"formatVersion"];
      [v19 setObject:objc_opt_class() forKeyedSubscript:@"serializer"];
      v35 = v18;
      v22 = [v17 adjustmentStackFromData:v12 error:&v35];
      v23 = v35;

      if (v22)
      {
        v24 = objc_opt_new();
        [v24 setOriginator:v13];
        [v24 setFormat:v14];
        [v24 setFormatVersion:v16];
        [v24 setAdjustmentStack:v22];
      }
      else
      {
        if (v23) {
          v25 = v23;
        }
        else {
          v25 = @"nil";
        }
        [v19 setObject:v25 forKeyedSubscript:@"deserializeError"];
        uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IPAAdjustmentErrorDomain" code:1001 userInfo:v19];

        v24 = 0;
        v23 = (__CFString *)v26;
      }

      uint64_t v18 = v23;
      a7 = v34;
    }
    else
    {
      v24 = objc_opt_new();
      [v24 setOriginator:v13];
      [v24 setFormat:v14];
      [v24 setFormatVersion:v16];
      [v24 setAdjustmentStack:0];
    }
  }
  else
  {
    v24 = 0;
  }
  if (a7 && v18) {
    *a7 = v18;
  }

  return v24;
}

+ (id)serialize:(id)a3 format:(id)a4 formatVersion:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v22 = 0;
  uint64_t v13 = [a1 _serializerForFormat:v11 formatVersion:v12 error:&v22];
  id v14 = (__CFString *)v22;
  if (!v13)
  {
    v16 = 0;
    if (!a6) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F1C9B8] data];
    if (!a6) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  [v15 setObject:v11 forKeyedSubscript:@"format"];
  [v15 setObject:v12 forKeyedSubscript:@"formatVersion"];
  [v15 setObject:v10 forKeyedSubscript:@"stack"];
  v21 = v14;
  v16 = [v13 dataFromAdjustmentStack:v10 error:&v21];
  v17 = v21;

  if (!v16)
  {
    if (v17) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = @"nil";
    }
    [v15 setObject:v18 forKeyedSubscript:@"serializeError"];
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IPAAdjustmentErrorDomain" code:1003 userInfo:v15];

    v17 = (__CFString *)v19;
  }

  id v14 = v17;
  if (a6)
  {
LABEL_13:
    if (v14) {
      *a6 = v14;
    }
  }
LABEL_15:

  return v16;
}

+ (id)serialize:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 adjustmentStack];
  v8 = [v6 format];
  uint64_t v9 = [v6 formatVersion];

  id v10 = [a1 serialize:v7 format:v8 formatVersion:v9 error:a4];

  return v10;
}

+ (id)serializeWithCurrentDefaultFormat:(id)a3 format:(id *)a4 formatVersion:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  if (!v9)
  {
    v21 = 0;
    v20 = 0;
LABEL_11:
    id v10 = 0;
    uint64_t v18 = 0;
    goto LABEL_12;
  }
  id v10 = +[IPASerializationManager formatForAdjustmentStack:v9];
  uint64_t v11 = [v9 minimumVersionForFormat:v10];
  uint64_t v18 = (void *)v11;
  if (v10) {
    BOOL v19 = v11 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    v20 = IPAAdjustmentError(1006, @"both format:%@ and formatVersion:%@ must be non-nil to serialize adjustments:%@", v12, v13, v14, v15, v16, v17, (uint64_t)v10);
    v21 = 0;
    goto LABEL_12;
  }
  id v25 = 0;
  v21 = +[IPASerializationManager serialize:v9 format:v10 formatVersion:v11 error:&v25];
  id v22 = v25;
  v20 = v22;
  if (!v21)
  {

    goto LABEL_11;
  }
LABEL_12:
  if (a4) {
    *a4 = v10;
  }
  if (a5) {
    *a5 = v18;
  }
  if (a6) {
    *a6 = v20;
  }
  id v23 = v21;

  return v23;
}

+ (id)serializeWithCurrentDefaultFormat:(id)a3 error:(id *)a4
{
  return (id)[a1 serializeWithCurrentDefaultFormat:a3 format:0 formatVersion:0 error:a4];
}

+ (id)formatForAdjustmentStack:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = @"com.apple.photo";
    id v5 = @"com.apple.photo";
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  id v6 = [v3 adjustments];
  if ([v6 count] != 1) {
    goto LABEL_9;
  }
  v7 = [v6 objectAtIndexedSubscript:0];
  v8 = [v7 identifier];
  char v9 = [v8 isEqualToString:@"SloMo"];

  if ((v9 & 1) == 0)
  {

LABEL_9:
    uint64_t v4 = @"com.apple.video";
    uint64_t v11 = @"com.apple.video";
    goto LABEL_10;
  }
  uint64_t v4 = @"com.apple.video.slomo";
  id v10 = @"com.apple.video.slomo";

LABEL_10:
LABEL_11:

  return v4;
}

+ (char)adjustmentTypeForFormat:(id)a3 formatVersion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    if ([(id)v6 isEqualToString:@"com.apple.photo"]
      && ([(id)v7 lowercaseString],
          char v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 isEqualToString:@"0.1.ios"],
          v9,
          v10))
    {
      uint64_t v11 = IPAAdjustmentGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        char v8 = 2;
        _os_log_impl(&dword_1DD3FD000, v11, OS_LOG_TYPE_ERROR, "[IPASerializationManager] treating adjustments as opaque. formatVersion: 0.1.ios", buf, 2u);
      }
      else
      {
        char v8 = 2;
      }
    }
    else
    {
      id v15 = 0;
      uint64_t v12 = [a1 _serializerForFormat:v6 formatVersion:v7 error:&v15];
      uint64_t v11 = v15;
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v8 = 3;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v8 = 4;
          }
          else {
            char v8 = 0;
          }
        }
      }
      else
      {
        uint64_t v13 = IPAAdjustmentGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v11;
          _os_log_impl(&dword_1DD3FD000, v13, OS_LOG_TYPE_ERROR, "[IPASerializationManager] treating adjustments as opaque. %@", buf, 0xCu);
        }

        char v8 = 2;
      }
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

+ (id)_serializerForFormat:(id)a3 formatVersion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = v9;
  if (v8 && v9)
  {
    uint64_t v17 = [a1 serializerMap];
    uint64_t v18 = [v17 objectForKeyedSubscript:v8];

    id v25 = [v18 objectForKeyedSubscript:v16];
    if (v25)
    {
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v26 = IPAAdjustmentError(1007, @"no mapping to format:%@ formatVersion:%@", v19, v20, v21, v22, v23, v24, (uint64_t)v8);
    }

    if (!a5) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v8)
    {
      v27 = @"formatVersion is nil";
      uint64_t v28 = 1005;
    }
    else if (v9)
    {
      v27 = @"format is nil";
      uint64_t v28 = 1004;
    }
    else
    {
      v27 = @"format and formatVersion are nil";
      uint64_t v28 = 1006;
    }
    uint64_t v26 = IPAAdjustmentError(v28, v27, v10, v11, v12, v13, v14, v15, v30);
    id v25 = 0;
    if (!a5) {
      goto LABEL_16;
    }
  }
  if (v26) {
    *a5 = v26;
  }
LABEL_16:

  return v25;
}

+ (id)serializerMap
{
  return (id)s_serializerMap;
}

+ (void)initialize
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (!s_serializerMap)
  {
    id v2 = (id)objc_opt_new();
    id v3 = objc_opt_new();
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:v2 forKeyedSubscript:@"0.2"];
    [v4 setObject:v2 forKeyedSubscript:@"0.2.OSX"];
    [v4 setObject:v2 forKeyedSubscript:@"0.2.iOS"];
    [v4 setObject:v2 forKeyedSubscript:@"1.0.OSX"];
    [v4 setObject:v2 forKeyedSubscript:@"1.0.iOS"];
    [v4 setObject:v2 forKeyedSubscript:@"1"];
    [v4 setObject:v2 forKeyedSubscript:@"1.0"];
    [v4 setObject:v2 forKeyedSubscript:@"1.1"];
    [v4 setObject:v2 forKeyedSubscript:@"1.2"];
    [v4 setObject:v2 forKeyedSubscript:@"1.3"];
    [v4 setObject:v2 forKeyedSubscript:@"1.4"];
    [v4 setObject:v2 forKeyedSubscript:@"1.5"];
    [v4 setObject:v2 forKeyedSubscript:@"1.5.1"];
    [v4 setObject:v2 forKeyedSubscript:@"1.6"];
    [v4 setObject:v2 forKeyedSubscript:@"1.7"];
    [v4 setObject:v2 forKeyedSubscript:@"1.8"];
    [v4 setObject:v2 forKeyedSubscript:@"1.9"];
    [v4 setObject:v2 forKeyedSubscript:@"1.9.1"];
    [v4 setObject:v2 forKeyedSubscript:@"1.10"];
    [v4 setObject:v2 forKeyedSubscript:@"1.11"];
    [v4 setObject:v2 forKeyedSubscript:@"1.12"];
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
    v15[0] = v5;
    v14[0] = @"com.apple.photo";
    v14[1] = @"com.apple.video";
    v12[0] = @"0.1";
    v12[1] = @"1.0";
    v13[0] = v2;
    v13[1] = v2;
    unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    v15[1] = v6;
    v14[2] = @"com.apple.video.slomo";
    v10[0] = @"1.1";
    v10[1] = @"1.0";
    v11[0] = v3;
    v11[1] = v2;
    unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v15[2] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    id v9 = (void *)s_serializerMap;
    s_serializerMap = v8;
  }
}

@end