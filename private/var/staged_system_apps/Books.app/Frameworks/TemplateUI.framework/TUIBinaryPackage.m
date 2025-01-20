@interface TUIBinaryPackage
+ (TUIBinaryPackage)packageWithURL:(id)a3;
+ (TUIBinaryPackage)packageWithURL:(id)a3 baseURL:(id)a4 error:(id *)a5;
+ (id)emptyPackage;
+ (void)clearCache;
+ (void)removeCacheForURL:(id)a3;
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)nameForString:(id)a3;
- ($7E080378D8F67055EE0984892F39872B)symbolForString:(id)a3;
- (NSDictionary)prebuiltTemplates;
- (NSURL)baseURL;
- (NSURL)url;
- (TUIBinaryPackage)initWithURL:(id)a3;
- (TUIBinaryPackage)initWithURL:(id)a3 baseURL:(id)a4 error:(id *)a5;
- (const)packageDecoder;
- (id).cxx_construct;
- (id)debugLocationForNode:(id)a3;
- (id)initAsEmpty;
- (id)templateWithURL:(id)a3;
- (void)dealloc;
- (void)packageBuffer;
- (void)performAccess:(id)a3;
- (void)symtab;
@end

@implementation TUIBinaryPackage

+ (id)emptyPackage
{
  id v2 = [objc_alloc((Class)a1) initAsEmpty];

  return v2;
}

+ (TUIBinaryPackage)packageWithURL:(id)a3
{
  v3 = [a1 packageWithURL:a3 baseURL:a3 error:0];

  return (TUIBinaryPackage *)v3;
}

+ (TUIBinaryPackage)packageWithURL:(id)a3 baseURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2DF158);
  v9 = (void *)qword_2DF150;
  if (!qword_2DF150)
  {
    uint64_t v10 = objc_opt_new();
    v11 = (void *)qword_2DF150;
    qword_2DF150 = v10;

    v9 = (void *)qword_2DF150;
  }
  v12 = [v9 objectForKeyedSubscript:v7];
  if (!v12)
  {
    v13 = TUIInstallBundleLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v7;
      _os_log_impl(&def_141F14, v13, OS_LOG_TYPE_DEFAULT, "Installing TUIBinaryPackage for %{public}@", (uint8_t *)&v16, 0xCu);
    }

    v12 = [[TUIBinaryPackage alloc] initWithURL:v7 baseURL:v8 error:a5];
    if (v12) {
      [(id)qword_2DF150 setObject:v12 forKeyedSubscript:v7];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF158);

  return v12;
}

+ (void)removeCacheForURL:(id)a3
{
  id v3 = a3;
  v4 = TUIInstallBundleLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&def_141F14, v4, OS_LOG_TYPE_DEFAULT, "Removing TUIBinaryPackage for %{public}@", (uint8_t *)&v5, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2DF158);
  [(id)qword_2DF150 removeObjectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF158);
}

+ (void)clearCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2DF158);
  [(id)qword_2DF150 removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2DF158);
}

- (id)initAsEmpty
{
  v3.receiver = self;
  v3.super_class = (Class)TUIBinaryPackage;
  if ([(TUIBinaryPackage *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (TUIBinaryPackage)initWithURL:(id)a3
{
  return [(TUIBinaryPackage *)self initWithURL:a3 baseURL:a3 error:0];
}

- (TUIBinaryPackage)initWithURL:(id)a3 baseURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v18 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUIBinaryPackage;
  v9 = [(TUIBinaryPackage *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_baseURL, a4);
    if ([v8 isFileURL])
    {
      id v11 = [v8 path];
      v12 = (const char *)[v11 UTF8String];
      v10->_data = 0;
      v10->_size = 0;
      int v13 = open(v12, 0, 0);
      int v14 = v13;
      if (v13 < 0)
      {
        int v15 = *__error();
      }
      else
      {
        if (fstat(v13, &v21) || (int v16 = mmap(0, v21.st_size, 1, 1, v14, 0), v10->_data = v16, v16 == (void *)-1))
        {
          int v15 = *__error();
        }
        else
        {
          int v15 = 0;
          v10->_size = v21.st_size;
        }
        close(v14);
      }

      if (!v15)
      {
        TUI::Package::Decoder::Decoder((TUI::Package::Decoder *)&v21, v10->_data, v10->_size);
        TUI::Package::Decoder::swap((TUI::Package::Decoder *)&v10->_decoder, (TUI::Package::Decoder *)&v21);
        operator new();
      }
    }
    TUI::Package::Decoder::sectionWithTag((TUI::Package::Decoder *)&v10->_decoder, 0x656C6E62u, 2, (uint64_t)&v19);
    TUI::Package::Section::decodeStrings((uint64_t)&v19, 2, &v21);
    *(_OWORD *)&v10->_elementNames.base = *(_OWORD *)&v21.st_dev;
    v10->_elementNames.offsets = *(unsigned int **)&v21.st_uid;

    uint64_t v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  if (self->_data)
  {
    symtab = (TUI::Symbol::Tab *)self->_symtab;
    if (symtab)
    {
      TUI::Symbol::Tab::~Tab(symtab);
      operator delete();
    }
    buffer = (id *)self->_buffer;
    if (buffer)
    {
      TUI::Package::Buffer::~Buffer(buffer);
      operator delete();
    }
    munmap(self->_data, self->_size);
  }
  v5.receiver = self;
  v5.super_class = (Class)TUIBinaryPackage;
  [(TUIBinaryPackage *)&v5 dealloc];
}

- (NSDictionary)prebuiltTemplates
{
  return self->_templates;
}

- (void)symtab
{
  return self->_symtab;
}

- (void)packageBuffer
{
  return self->_buffer;
}

- (const)packageDecoder
{
  return &self->_decoder;
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)nameForString:(id)a3
{
  id v4 = a3;
  int v29 = HIWORD(TUINameNil);
  int v30 = (unsigned __int16)TUINameNil;
  if (v4)
  {
    v37 = 0;
    v38 = 0;
    v39 = 0;
    id v28 = v4;
    [v4 componentsSeparatedByString:@"::"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v34;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v5);
          }
          symtab = self->_symtab;
          sub_6ACC(__p, (char *)[*(id *)(*((void *)&v33 + 1) + 8 * i) UTF8String]);
          int v10 = TUI::Symbol::Tab::lookup((uint64_t)symtab, (unsigned __int8 *)__p);
          if (v32 < 0) {
            operator delete(__p[0]);
          }
          if (v10 != 0xFFFF)
          {
            id v11 = v38;
            if (v38 >= v39)
            {
              int v13 = (char *)v37;
              uint64_t v14 = v38 - (unsigned char *)v37;
              if (v38 - (unsigned char *)v37 <= -3) {
                sub_4484();
              }
              uint64_t v15 = v14 >> 1;
              if (v39 - (unsigned char *)v37 <= (unint64_t)((v14 >> 1) + 1)) {
                uint64_t v16 = v15 + 1;
              }
              else {
                uint64_t v16 = v39 - (unsigned char *)v37;
              }
              if ((unint64_t)(v39 - (unsigned char *)v37) >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v17 = v16;
              }
              if (v17)
              {
                id v18 = (char *)sub_6B98((uint64_t)&v39, v17);
                int v13 = (char *)v37;
                id v11 = v38;
              }
              else
              {
                id v18 = 0;
              }
              long long v19 = &v18[2 * v15];
              *(_WORD *)long long v19 = v10;
              v12 = v19 + 2;
              while (v11 != v13)
              {
                __int16 v20 = *((_WORD *)v11 - 1);
                v11 -= 2;
                *((_WORD *)v19 - 1) = v20;
                v19 -= 2;
              }
              v37 = v19;
              v38 = v12;
              v39 = &v18[2 * v17];
              if (v13) {
                operator delete(v13);
              }
            }
            else
            {
              *(_WORD *)v38 = v10;
              v12 = v11 + 2;
            }
            v38 = v12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v6);
    }

    v22 = v37;
    stat v21 = v38;
    if ([v5 count] == (id)((v21 - v22) >> 1) && v38 != v37)
    {
      int v23 = *((unsigned __int16 *)v38 - 1);
      v38 -= 2;
      int v24 = TUI::Symbol::Tab::lookup((uint64_t)self->_symtab, (uint64_t)&v37);
      if (v24 == 0xFFFF) {
        int v25 = v30;
      }
      else {
        int v25 = v24;
      }
      int v26 = v29;
      if (v24 != 0xFFFF) {
        int v26 = v23;
      }
      int v29 = v26;
      int v30 = v25;
    }

    if (v37)
    {
      v38 = (char *)v37;
      operator delete(v37);
    }
    id v4 = v28;
  }

  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)(v30 | (v29 << 16));
}

- (void)performAccess:(id)a3
{
}

- ($7E080378D8F67055EE0984892F39872B)symbolForString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 characterAtIndex:0];
    symtab = self->_symtab;
    if (v6 == 58)
    {
      id v8 = [v5 substringFromIndex:1];
      sub_6ACC(__p, (char *)[v8 UTF8String]);
      v9.var0 = TUI::Symbol::Tab::lookup((uint64_t)symtab, (unsigned __int8 *)__p);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      sub_6ACC(__p, (char *)[v5 UTF8String]);
      v9.var0 = TUI::Symbol::Tab::lookup((uint64_t)symtab, (unsigned __int8 *)__p);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    v9.var0 = TUISymbolNil;
  }

  return v9;
}

- (id)templateWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scheme];

  if (!v5)
  {
    unsigned int v6 = [v4 absoluteString];
    uint64_t v7 = +[NSURL URLWithString:v6 relativeToURL:self->_baseURL];

    id v4 = (id)v7;
  }
  id v8 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:1];
  $7E080378D8F67055EE0984892F39872B v9 = [v8 path];
  int v10 = [v9 stringByStandardizingPath];
  [v8 setPath:v10];

  id v11 = [v8 URL];
  char v12 = [(NSDictionary *)self->_templates objectForKeyedSubscript:v11];

  return v12;
}

- (id)debugLocationForNode:(id)a3
{
  uint64_t v3 = *(void *)&a3.var0;
  buffer = self->_buffer;
  if (buffer[27] <= (unint64_t)a3.var0 || (uint64_t v5 = buffer[26] + 28 * a3.var0) == 0)
  {
    char v12 = +[NSNumber numberWithUnsignedInt:*(void *)&a3.var0];
    int v13 = +[NSString stringWithFormat:@"InvalidNode:%@", v12];
    goto LABEL_18;
  }
  unint64_t v7 = *(unsigned int *)(v5 + 24);
  if (buffer[17] > v7 >> 12 && (id v8 = (unsigned __int16 *)(buffer[16] + 8 * (v7 >> 12))) != 0)
  {
    uint64_t v9 = *v8;
    unint64_t v10 = (unint64_t)*((unsigned int *)v8 + 1) << 32;
    uint64_t v11 = v9 << 16;
  }
  else
  {
    unint64_t v10 = 0xFFFFFFFF00000000;
    uint64_t v11 = 4294901760;
  }
  unint64_t v21 = v10 | v11 | v7 & 0xFFF;
  char v12 = TUI::Package::Location::Entry::pathURL((unsigned __int16 *)&v21, buffer);
  uint64_t v14 = self->_buffer;
  if (v14[11] <= (unint64_t)HIDWORD(v21) || (uint64_t v15 = v14[10]) == 0)
  {
    uint64_t v16 = 0;
LABEL_16:
    id v18 = +[NSNumber numberWithUnsignedInt:v3];
    uint64_t v19 = +[NSString stringWithFormat:@"NoLocationOrXPath:%@", v18];
    goto LABEL_17;
  }
  uint64_t v16 = +[NSString stringWithUTF8String:v15 + *(unsigned int *)(v14[12] + 4 * HIDWORD(v21))];
  if (v16) {
    BOOL v17 = v12 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17) {
    goto LABEL_16;
  }
  id v18 = [v12 lastPathComponent];
  uint64_t v19 = +[NSString stringWithFormat:@"Path:%@ XPath:%@", v18, v16];
LABEL_17:
  int v13 = (void *)v19;

LABEL_18:

  return v13;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_templates, 0);

  sub_6A44((uint64_t)&self->_decoder._sections);
}

- (id).cxx_construct
{
  self->_elementNames.base = 0;
  self->_elementNames.count = 0;
  self->_elementNames.offsets = 0;
  TUI::Package::Decoder::Decoder((TUI::Package::Decoder *)&self->_decoder);
  return self;
}

@end