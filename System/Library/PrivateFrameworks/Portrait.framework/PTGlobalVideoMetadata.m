@interface PTGlobalVideoMetadata
+ (id)deserializeMetadataWithType:(unsigned int)a3 fromGlobalMetadata:(id)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (unsigned)_sizeOfAtomOfType:(unsigned int)a3 withOptions:(id)a4;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)setMetadata:(id)a3 ofType:(unsigned int)a4;
@end

@implementation PTGlobalVideoMetadata

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    xmmword_1EA62639C = xmmword_1D0840A90;
  }
}

- (void)setMetadata:(id)a3 ofType:(unsigned int)a4
{
  id v7 = a3;
  if (a4 - 1 <= 3)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_atoms[a4], a3);
    id v7 = v8;
  }
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  unsigned int v5 = 8;
  for (uint64_t i = 2; i != 6; ++i)
  {
    if (*((void *)&self->super.isa + i)) {
      v5 += [(PTGlobalVideoMetadata *)self _sizeOfAtomOfType:(i - 1) withOptions:a3];
    }
  }
  return v5;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PTGlobalVideoMetadata *)self sizeOfSerializedObjectWithOptions:v7];
  unint64_t v19 = [v6 length];
  if (v19 >= v8)
  {
    id v18 = v6;
    v9 = (_DWORD *)[v18 mutableBytes];
    uint64_t v10 = 0;
    uint64_t v20 = v8;
    _DWORD *v9 = bswap32(v8);
    v9[1] = 1684633187;
    v11 = v9 + 2;
    do
    {
      v12 = (id *)(&self->super.isa + v10);
      if (v12[2])
      {
        unsigned int v13 = [(PTGlobalVideoMetadata *)self _sizeOfAtomOfType:(v10 + 1) withOptions:v7];
        _DWORD *v11 = bswap32(v13);
        v11[1] = bswap32(*((_DWORD *)&kAtomIdentifiers + v10 + 1));
        v14 = [MEMORY[0x1E4F1CA58] dataWithLength:v13 - 8];
        [v12[2] writeToData:v14 withOptions:v7];
        id v15 = v14;
        memcpy(v11 + 2, (const void *)[v15 mutableBytes], objc_msgSend(v15, "length"));
        v11 = (_DWORD *)((char *)v11 + v13);
      }
      ++v10;
    }
    while (v10 != 4);
    unint64_t v8 = v20;
    if (PTSerializationDebugIsEnabled())
    {
      v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PTGlobalVideoMetadata writeToData:withOptions:](v18, v20);
      }
    }
  }

  return v19 >= v8;
}

+ (id)deserializeMetadataWithType:(unsigned int)a3 fromGlobalMetadata:(id)a4 error:(id *)a5
{
  id v6 = a4;
  if ((unint64_t)[v6 length] >= 8
    && (id v7 = v6,
        unint64_t v8 = (unsigned int *)[v7 bytes],
        unint64_t v9 = bswap32(*v8),
        [v7 length] >= v9)
    && v8[1] == 1684633187
    && (uint64_t v10 = v8 + 2, v11 = v7, (unint64_t)v10 < [v11 bytes] + v9))
  {
    unsigned int v20 = a3;
    uint64_t v12 = a3;
    while (1)
    {
      unsigned int v13 = bswap32(*v10);
      unsigned int v14 = bswap32(v10[1]);
      id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v10 + 2 length:v13 - 8 freeWhenDone:0];
      v16 = v15;
      if (kAtomIdentifiers[v12] == v14) {
        break;
      }
      uint64_t v10 = (unsigned int *)((char *)v10 + v13);

      if ((unint64_t)v10 >= [v11 bytes] + v9) {
        goto LABEL_8;
      }
    }
    if (PTSerializationDebugIsEnabled())
    {
      id v18 = _PTLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[PTGlobalVideoMetadata deserializeMetadataWithType:fromGlobalMetadata:error:](v16, v9);
      }
    }
    if (v20 - 1 > 3)
    {
      v17 = 0;
    }
    else
    {
      v17 = [(__objc2_class *)*off_1E68848E0[v20 - 1] objectFromData:v16];
    }
  }
  else
  {
LABEL_8:
    v17 = 0;
  }

  return v17;
}

- (unsigned)_sizeOfAtomOfType:(unsigned int)a3 withOptions:(id)a4
{
  return [(PTSerializable *)self->_atoms[a3] sizeOfSerializedObjectWithOptions:a4]+ 8;
}

- (void).cxx_destruct
{
  uint64_t v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)writeToData:(void *)a1 withOptions:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  v2 = NSStringFromBytes((unsigned __int8 *)[a1 mutableBytes], a2);
  OUTLINED_FUNCTION_10(&dword_1D0778000, v3, v4, "w[+]: %@", v5, v6, v7, v8, 2u);
}

+ (void)deserializeMetadataWithType:(void *)a1 fromGlobalMetadata:(uint64_t)a2 error:.cold.1(void *a1, uint64_t a2)
{
  v2 = NSStringFromBytes((unsigned __int8 *)[a1 bytes], a2);
  OUTLINED_FUNCTION_10(&dword_1D0778000, v3, v4, "r[+]: %@", v5, v6, v7, v8, 2u);
}

@end