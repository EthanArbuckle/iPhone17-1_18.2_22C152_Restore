@interface TransceiverWrapper
+ (id)withTransceiver:(id)a3;
- (BOOL)applyScript:(id)a3 error:(id *)a4;
- (BOOL)applyScript:(id)a3 ignoreSW:(BOOL)a4 error:(id *)a5;
- (TransceiverWrapper)initWithTransceiver:(id)a3;
- (id)transceive:(id)a3 error:(id *)a4;
- (id)transceiveAndCheckSW:(id)a3 error:(id *)a4;
- (id)transceiveAndCheckSW:(id)a3 inArray:(id)a4 error:(id *)a5;
- (id)transceiveAndCheckSW:(id)a3 inArray:(id)a4 keepingSW:(BOOL)a5 error:(id *)a6;
- (id)transceiveAndCheckSW:(id)a3 keepingSW:(BOOL)a4 error:(id *)a5;
- (id)transceiveAndGetAllData:(id)a3 withGetMoreData:(id)a4 withMoreDataSW:(unsigned __int16)a5 withError:(id *)a6;
- (id)transceiveAndGetAllData:(id)a3 withMoreDataSW:(unsigned __int16)a4 withError:(id *)a5;
- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 inArray:(id)a5 error:(id *)a6;
- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 inArray:(id)a5 keepingSW:(BOOL)a6 error:(id *)a7;
- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 keepingSW:(BOOL)a5 error:(id *)a6;
- (void)dumpAPDUs:(id)a3;
@end

@implementation TransceiverWrapper

- (TransceiverWrapper)initWithTransceiver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransceiverWrapper;
  v6 = [(TransceiverWrapper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transceiver, a3);
    v7->_circbuff = (_CircularBuffer *)CircularBufferInit(v7->_circBuffStorage, 0x1000uLL);
    v7->_isMultiOS = objc_opt_respondsToSelector() & 1;
  }

  return v7;
}

+ (id)withTransceiver:(id)a3
{
  id v3 = a3;
  v4 = [[TransceiverWrapper alloc] initWithTransceiver:v3];

  return v4;
}

- (id)transceive:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v13 = 62;
  v14 = &v13;
  uint64_t v15 = 1;
  id v6 = a3;
  uint64_t v16 = [v6 bytes];
  if ((unint64_t)[v6 length] <= 0x300) {
    uint64_t v7 = [v6 length];
  }
  else {
    uint64_t v7 = 768;
  }
  uint64_t v17 = v7;
  CircularBufferAddScattered((const void **)&self->_circbuff->var0, (uint64_t)&v14, 2);
  transceiver = self->_transceiver;
  if (self->_isMultiOS) {
    [(SETransceiver *)transceiver transceive:v6 toOS:0 error:a4];
  }
  else {
  objc_super v9 = [(SETransceiver *)transceiver transceive:v6 error:a4];
  }
  v10 = v9;
  if (v9)
  {
    char v13 = 60;
    v14 = &v13;
    uint64_t v15 = 1;
    id v11 = v9;
    uint64_t v16 = [v11 bytes];
    uint64_t v17 = [v11 length];
    CircularBufferAddScattered((const void **)&self->_circbuff->var0, (uint64_t)&v14, 2);
  }

  return v10;
}

- (void)dumpAPDUs:(id)a3
{
  id v4 = a3;
  circbuff = self->_circbuff;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__TransceiverWrapper_dumpAPDUs___block_invoke;
  v7[3] = &unk_1E65AE378;
  id v8 = v4;
  id v6 = v4;
  CircularBufferDump((const void **)&circbuff->var0, (uint64_t)v7);
}

uint64_t __32__TransceiverWrapper_dumpAPDUs___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  id v8 = [(TransceiverWrapper *)self transceiveAndCheckSW:v7 inArray:&unk_1F24E26B0 keepingSW:0 error:a5];

  return v8;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 inArray:(id)a5 error:(id *)a6
{
  v10 = (void *)MEMORY[0x1E4F1C9B8];
  id v11 = a5;
  v12 = [v10 dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  char v13 = [(TransceiverWrapper *)self transceiveAndCheckSW:v12 inArray:v11 keepingSW:0 error:a6];

  return v13;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 keepingSW:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  objc_super v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  v10 = [(TransceiverWrapper *)self transceiveAndCheckSW:v9 inArray:&unk_1F24E26C8 keepingSW:v7 error:a6];

  return v10;
}

- (id)transceiveBytesAndCheckSW:(const char *)a3 length:(unint64_t)a4 inArray:(id)a5 keepingSW:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v12 = (void *)MEMORY[0x1E4F1C9B8];
  id v13 = a5;
  v14 = [v12 dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  uint64_t v15 = [(TransceiverWrapper *)self transceiveAndCheckSW:v14 inArray:v13 keepingSW:v8 error:a7];

  return v15;
}

- (id)transceiveAndCheckSW:(id)a3 error:(id *)a4
{
  return [(TransceiverWrapper *)self transceiveAndCheckSW:a3 inArray:&unk_1F24E26E0 keepingSW:0 error:a4];
}

- (id)transceiveAndCheckSW:(id)a3 inArray:(id)a4 error:(id *)a5
{
  return [(TransceiverWrapper *)self transceiveAndCheckSW:a3 inArray:a4 keepingSW:0 error:a5];
}

- (id)transceiveAndCheckSW:(id)a3 keepingSW:(BOOL)a4 error:(id *)a5
{
  return [(TransceiverWrapper *)self transceiveAndCheckSW:a3 inArray:&unk_1F24E26F8 keepingSW:a4 error:a5];
}

- (id)transceiveAndCheckSW:(id)a3 inArray:(id)a4 keepingSW:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v49[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = [(TransceiverWrapper *)self transceive:a3 error:a6];
  v12 = v11;
  if (!v11)
  {
    uint64_t v16 = ATLLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_ERROR, "nil response", buf, 2u);
    }

    uint64_t v17 = [[NSString alloc] initWithFormat:@"nil response"];
    uint64_t v18 = (void *)v17;
    if (!a6) {
      goto LABEL_22;
    }
    id v19 = *a6;
    v20 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v21 = *MEMORY[0x1E4F28A50];
      v46[0] = *MEMORY[0x1E4F28568];
      v46[1] = v21;
      v47[0] = v17;
      v47[1] = v19;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      v23 = v47;
      v24 = v46;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49[0] = v17;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      v23 = v49;
      v24 = &v48;
      uint64_t v25 = 1;
    }
    v36 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
    v37 = v20;
    uint64_t v38 = 4;
    goto LABEL_21;
  }
  id v13 = [NSNumber numberWithUnsignedShort:GetSW(v11)];
  char v14 = [v10 containsObject:v13];

  if (v14)
  {
    if (v7)
    {
      id v15 = v12;
    }
    else
    {
      [v12 subdataWithRange:0, [v12 length] - 2];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v35 = v15;
    goto LABEL_23;
  }
  v26 = ATLLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v12;
    _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_ERROR, "Unexpected SW %@", buf, 0xCu);
  }

  uint64_t v27 = [[NSString alloc] initWithFormat:@"Unexpected SW %@", v12];
  uint64_t v18 = (void *)v27;
  if (a6)
  {
    id v28 = *a6;
    v29 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v30 = *MEMORY[0x1E4F28A50];
      v40[0] = *MEMORY[0x1E4F28568];
      v40[1] = v30;
      v41[0] = v27;
      v41[1] = v28;
      v31 = (void *)MEMORY[0x1E4F1C9E8];
      v32 = v41;
      v33 = v40;
      uint64_t v34 = 2;
    }
    else
    {
      uint64_t v42 = *MEMORY[0x1E4F28568];
      uint64_t v43 = v27;
      v31 = (void *)MEMORY[0x1E4F1C9E8];
      v32 = &v43;
      v33 = &v42;
      uint64_t v34 = 1;
    }
    v36 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
    v37 = v29;
    uint64_t v38 = 5;
LABEL_21:
    *a6 = [v37 errorWithDomain:@"ATL" code:v38 userInfo:v36];
  }
LABEL_22:

  v35 = 0;
LABEL_23:

  return v35;
}

- (id)transceiveAndGetAllData:(id)a3 withMoreDataSW:(unsigned __int16)a4 withError:(id *)a5
{
  return [(TransceiverWrapper *)self transceiveAndGetAllData:a3 withGetMoreData:a3 withMoreDataSW:a4 withError:a5];
}

- (id)transceiveAndGetAllData:(id)a3 withGetMoreData:(id)a4 withMoreDataSW:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7 = a5;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v23[0] = &unk_1F24E20F8;
  v12 = [NSNumber numberWithUnsignedShort:v7];
  v23[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  char v14 = [(TransceiverWrapper *)self transceiveAndCheckSW:v10 inArray:v13 keepingSW:1 error:a6];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA58];
    uint64_t v17 = [v14 subdataWithRange:0, [v14 length] - 2];
    uint64_t v18 = [v16 dataWithData:v17];

    if (GetSW(v15) == v7)
    {
      while (1)
      {
        id v19 = [(TransceiverWrapper *)self transceiveAndCheckSW:v11 inArray:v13 keepingSW:1 error:a6];

        if (!v19) {
          break;
        }
        v20 = [v19 subdataWithRange:0, [v19 length] - 2];
        [v18 appendData:v20];

        id v15 = v19;
        if (GetSW(v19) != v7) {
          goto LABEL_8;
        }
      }
      id v21 = 0;
    }
    else
    {
      id v19 = v15;
LABEL_8:
      id v21 = v18;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)applyScript:(id)a3 error:(id *)a4
{
  return [(TransceiverWrapper *)self applyScript:a3 ignoreSW:0 error:a4];
}

- (BOOL)applyScript:(id)a3 ignoreSW:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [MEMORY[0x1E4F1C9B8] dataWithHexString:*(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18];
        if (v6)
        {
          id v14 = [(TransceiverWrapper *)self transceive:v13 error:0];
        }
        else
        {
          id v15 = [(TransceiverWrapper *)self transceiveAndCheckSW:v13 error:a5];

          if (!v15)
          {
            BOOL v16 = 0;
            goto LABEL_13;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (void).cxx_destruct
{
}

@end