@interface ATSSymbolsMapCapture
- (ATSSymbolsMapCapture)initWithLogger:(id)a3;
- (void)addChunksToFile:(ktrace_file *)a3;
- (void)encodeLiveKernelMap:(ktrace_file *)a3;
- (void)encodeSharedCachesUsingCS:(ktrace_file *)a3;
- (void)encodeSharedCachesUsingDyldIntrospection:(ktrace_file *)a3;
@end

@implementation ATSSymbolsMapCapture

- (ATSSymbolsMapCapture)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATSSymbolsMapCapture;
  v6 = [(ATSSymbolsMapCapture *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)encodeLiveKernelMap:(ktrace_file *)a3
{
  CSSymbolicatorCreateWithMachKernel();
  if ((CSIsNull() & 1) == 0)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x9012000000;
    v39 = sub_4420;
    v40 = sub_442C;
    v41 = "";
    uint64_t v42 = 0;
    char v43 = 0;
    long long v44 = xmmword_E450;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v47 = 0;
    uint64_t v48 = 1;
    __int16 v49 = 256;
    uint64_t v50 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x4812000000;
    v30 = sub_4434;
    v31 = sub_4458;
    v32 = "";
    v34 = 0;
    uint64_t v35 = 0;
    __p = 0;
    CSSymbolicatorForeachSymbolOwnerAtTime();
    CSSymbolicatorGetAOutSymbolOwner();
    if ((CSIsNull() & 1) != 0 || (CFUUIDBytes = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes()) == 0)
    {
      unsigned int v6 = 0;
    }
    else
    {
      memset(out, 0, 37);
      uuid_unparse(CFUUIDBytes, out);
      size_t v5 = strlen(out);
      unsigned int v6 = sub_88B8(v37 + 6, out, v5);
    }
    CSRelease();
    uint64_t v7 = v28[7] - v28[6];
    if (v7) {
      v8 = (void *)v28[6];
    }
    else {
      v8 = &flatbuffers::data<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>,std::allocator<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>>>(std::vector<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>> const&)::t;
    }
    unsigned int v9 = sub_493C((_DWORD *)v37 + 12, (uint64_t)v8, v7 >> 2);
    unsigned int v10 = sub_88B8(v37 + 6, "kernel_task", 0xBuLL);
    v11 = v37;
    v12 = v37 + 6;
    sub_65F8((uint64_t)(v37 + 6));
    *((unsigned char *)v11 + 118) = 1;
    int v13 = *((_DWORD *)v11 + 20);
    int v14 = *((_DWORD *)v11 + 24);
    LODWORD(v11) = *((_DWORD *)v11 + 22);
    sub_6624((unint64_t)v12, 6, 0, -1);
    sub_6624((unint64_t)v12, 8, 0, -1);
    sub_696C(v12, 4, v10);
    sub_696C(v12, 10, v6);
    unsigned int v15 = sub_6AFC((uint64_t)v12, v13 - v14 + (int)v11);
    v16 = v37;
    v17 = v37 + 6;
    sub_65F8((uint64_t)(v37 + 6));
    *((unsigned char *)v16 + 118) = 1;
    int v18 = *((_DWORD *)v16 + 20);
    int v19 = *((_DWORD *)v16 + 24);
    LODWORD(v16) = *((_DWORD *)v16 + 22);
    sub_696C(v17, 10, 0);
    sub_696C(v17, 8, v9);
    sub_696C(v17, 6, v15);
    sub_87CC((unint64_t)v17, 4, 1, 0);
    *(_DWORD *)out = sub_6AFC((uint64_t)v17, v18 - v19 + (int)v16);
    LODWORD(v17) = sub_493C((_DWORD *)v37 + 12, (uint64_t)out, 1);
    v20 = v37;
    v21 = v37 + 6;
    sub_65F8((uint64_t)(v37 + 6));
    *((unsigned char *)v20 + 118) = 1;
    int v22 = *((_DWORD *)v20 + 20);
    int v23 = *((_DWORD *)v20 + 24);
    LODWORD(v20) = *((_DWORD *)v20 + 22);
    sub_696C(v21, 6, 0);
    sub_696C(v21, 4, v17);
    unsigned int v24 = sub_6AFC((uint64_t)v21, v22 - v23 + (int)v20);
    sub_8F00((uint64_t)(v37 + 6), v24, "SYMB", 0);
    sub_49C0((uint64_t)(v37 + 6));
    if (!ktrace_file_append_chunk())
    {
      v25 = __error();
      v26 = +[NSString stringWithFormat:@"Failed to append kernel map chunk. Error: %s", strerror(*v25), _NSConcreteStackBlock, 3221225472, sub_4470, &unk_104F0, &v36, &v27];
      [(KTProviderLogger *)self->_logger failWithReason:v26];
    }
    _Block_object_dispose(&v27, 8);
    if (__p)
    {
      v34 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(&v36, 8);
    sub_5D6C(&v42);
  }
}

- (void)encodeSharedCachesUsingDyldIntrospection:(ktrace_file *)a3
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x9012000000;
  v28 = sub_4420;
  uint64_t v29 = sub_442C;
  v30 = "";
  uint64_t v31 = 0;
  char v32 = 0;
  long long v33 = xmmword_E450;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v36 = 0;
  uint64_t v37 = 1;
  __int16 v38 = 256;
  uint64_t v39 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x4812000000;
  int v19 = sub_4D6C;
  v20 = sub_4D90;
  v21 = "";
  int v23 = 0;
  uint64_t v24 = 0;
  __p = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x5812000000;
  v14[3] = sub_4DA8;
  v14[4] = sub_4DB4;
  memset(&v14[5], 0, 40);
  int v15 = 1065353216;
  dyld_for_each_installed_shared_cache();
  uint64_t v4 = v17[6];
  uint64_t v5 = v17[7];
  if (v4 != v5)
  {
    unsigned int v6 = sub_493C((_DWORD *)v26 + 12, v4, (v5 - v4) >> 2);
    uint64_t v7 = v26;
    v8 = v26 + 6;
    sub_65F8((uint64_t)(v26 + 6));
    *((unsigned char *)v7 + 118) = 1;
    int v9 = *((_DWORD *)v7 + 20);
    int v10 = *((_DWORD *)v7 + 24);
    LODWORD(v7) = *((_DWORD *)v7 + 22);
    sub_696C(v8, 6, 0);
    sub_696C(v8, 4, v6);
    unsigned int v11 = sub_6AFC((uint64_t)v8, v9 - v10 + (int)v7);
    sub_8F00((uint64_t)(v26 + 6), v11, "SYMB", 0);
    sub_49C0((uint64_t)(v26 + 6));
    if (!ktrace_file_append_chunk())
    {
      v12 = __error();
      int v13 = +[NSString stringWithFormat:@"Failed to append kernel map chunk. Error: %s", strerror(*v12), _NSConcreteStackBlock, 3221225472, sub_4DBC, &unk_10518, v14, &v25, &v16];
      [(KTProviderLogger *)self->_logger failWithReason:v13];
    }
  }
  _Block_object_dispose(v14, 8);
  sub_B348((uint64_t)&v14[6]);
  _Block_object_dispose(&v16, 8);
  if (__p)
  {
    int v23 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v25, 8);
  sub_5D6C(&v31);
}

- (void)encodeSharedCachesUsingCS:(ktrace_file *)a3
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x9012000000;
  v26 = sub_4420;
  uint64_t v27 = sub_442C;
  v28 = "";
  uint64_t v29 = 0;
  char v30 = 0;
  long long v31 = xmmword_E450;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  uint64_t v35 = 1;
  __int16 v36 = 256;
  uint64_t v37 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x4812000000;
  v17 = sub_4D6C;
  uint64_t v18 = sub_4D90;
  int v19 = "";
  v21 = 0;
  uint64_t v22 = 0;
  __p = 0;
  CSSymbolicatorForeachSharedCache();
  uint64_t v4 = v15[6];
  uint64_t v5 = v15[7];
  if (v4 != v5)
  {
    unsigned int v6 = sub_493C((_DWORD *)v24 + 12, v4, (v5 - v4) >> 2);
    uint64_t v7 = v24;
    v8 = v24 + 6;
    sub_65F8((uint64_t)(v24 + 6));
    *((unsigned char *)v7 + 118) = 1;
    int v9 = *((_DWORD *)v7 + 20);
    int v10 = *((_DWORD *)v7 + 24);
    LODWORD(v7) = *((_DWORD *)v7 + 22);
    sub_696C(v8, 6, 0);
    sub_696C(v8, 4, v6);
    unsigned int v11 = sub_6AFC((uint64_t)v8, v9 - v10 + (int)v7);
    sub_8F00((uint64_t)(v24 + 6), v11, "SYMB", 0);
    sub_49C0((uint64_t)(v24 + 6));
    if (!ktrace_file_append_chunk())
    {
      v12 = __error();
      int v13 = +[NSString stringWithFormat:@"Failed to append kernel map chunk. Error: %s", strerror(*v12), _NSConcreteStackBlock, 3221225472, sub_5534, &unk_104F0, &v23, &v14];
      [(KTProviderLogger *)self->_logger failWithReason:v13];
    }
  }
  _Block_object_dispose(&v14, 8);
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v23, 8);
  sub_5D6C(&v29);
}

- (void)addChunksToFile:(ktrace_file *)a3
{
  -[ATSSymbolsMapCapture encodeSharedCachesUsingDyldIntrospection:](self, "encodeSharedCachesUsingDyldIntrospection:");

  [(ATSSymbolsMapCapture *)self encodeLiveKernelMap:a3];
}

- (void).cxx_destruct
{
}

@end