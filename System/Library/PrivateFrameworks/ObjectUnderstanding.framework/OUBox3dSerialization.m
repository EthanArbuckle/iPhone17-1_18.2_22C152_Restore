@interface OUBox3dSerialization
- (OUBox3d)box3dFromDictionary:(SEL)a3;
- (id)dictionaryFromBox3d:(OUBox3d *)a3;
- (id)dictionaryFromBoxes3d:()vector<OUBox3d;
- (id)dictionaryFromBoxes3dPointCloud:()vector<OUBox3d pointCloud:(std:(id)a4 :allocator<OUBox3d>> *)a3;
- (id)pointCloudFromDictionary:(id)a3;
- (vector<OUBox3d,)boxes3dFromDictionary:(OUBox3dSerialization *)self;
@end

@implementation OUBox3dSerialization

- (id)dictionaryFromBox3d:(OUBox3d *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v25 = [MEMORY[0x263EFF9A0] dictionary];
  [v25 setObject:a3[1].var5.var0 forKeyedSubscript:@"type"];
  v4 = [a3[1].var5.var2.var0 UUIDString];
  [v25 setObject:v4 forKeyedSubscript:@"identifier"];

  LODWORD(v5) = a3[1].var5.var1;
  v6 = [NSNumber numberWithFloat:v5];
  [v25 setObject:v6 forKeyedSubscript:@"confidence"];

  v26 = 0;
  v27 = 0;
  uint64_t v28 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v26, (const void *)a3[1].var6.var1, a3[1].var6.var2.var0, (uint64_t)(a3[1].var6.var2.var0 - a3[1].var6.var1) >> 2);
  v29 = 0;
  v30 = 0;
  uint64_t v31 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v29, v26, (uint64_t)v27, (v27 - (unsigned char *)v26) >> 2);
  __p = 0;
  v33 = 0;
  v34 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v29, (uint64_t)v30, (v30 - (unsigned char *)v29) >> 2);
  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:(v33 - (unsigned char *)__p) >> 2];
  v9 = __p;
  if (v33 != __p)
  {
    unint64_t v10 = 0;
    do
    {
      LODWORD(v8) = v9[v10];
      v11 = [NSNumber numberWithFloat:v8];
      [v7 addObject:v11];

      ++v10;
      v9 = __p;
    }
    while (v10 < (v33 - (unsigned char *)__p) >> 2);
  }
  v12 = (void *)[v7 copy];

  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  if (v29)
  {
    v30 = v29;
    operator delete(v29);
  }
  [v25 setObject:v12 forKeyedSubscript:@"logits"];

  if (v26)
  {
    v27 = v26;
    operator delete(v26);
  }
  __p = float3ToNSArray(*(__n128 *)&a3->var1);
  v24 = __p;
  float3ToNSArray(*(__n128 *)&a3->var3);
  v13 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  v14 = float3ToNSArray(*(__n128 *)&a3->var5.var0);
  v34 = v14;
  v15 = float3ToNSArray(*(__n128 *)&a3->var5.var2.var0);
  v35 = v15;
  v16 = float3ToNSArray(*(__n128 *)&a3->var6.var1);
  v36 = v16;
  v17 = float3ToNSArray(*(__n128 *)&a3->var7);
  v37 = v17;
  v18 = float3ToNSArray(*(__n128 *)&a3[1].var1);
  v38 = v18;
  v19 = float3ToNSArray(*(__n128 *)&a3[1].var3);
  v39 = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&__p count:8];

  [v25 setObject:v20 forKeyedSubscript:@"bbox"];
  [v25 setObject:a3[2].var3 forKeyedSubscript:@"group_type"];
  v21 = [NSNumber numberWithShort:SLOWORD(a3[2].var4)];
  [v25 setObject:v21 forKeyedSubscript:@"group_id"];

  v22 = (void *)[v25 copy];
  return v22;
}

- (id)dictionaryFromBoxes3d:()vector<OUBox3d
{
  double v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = objc_opt_new();
  begin = a3->__begin_;
  if (a3->__end_ != a3->__begin_)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      OUBox3d::OUBox3d(&v13, (OUBox3d *)((char *)begin + v8));
      unint64_t v10 = [(OUBox3dSerialization *)self dictionaryFromBox3d:&v13];

      if (__p) {
        operator delete(__p);
      }
      if (v17)
      {
        v18 = v17;
        operator delete(v17);
      }

      [v6 addObject:v10];
      ++v9;
      begin = a3->__begin_;
      v8 += 224;
    }
    while (0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5) > v9);
  }
  [v5 setObject:v6 forKeyedSubscript:@"boxes"];
  v11 = (void *)[v5 copy];

  return v11;
}

- (id)dictionaryFromBoxes3dPointCloud:()vector<OUBox3d pointCloud:(std:(id)a4 :allocator<OUBox3d>> *)a3
{
  id v6 = a4;
  memset(v12, 0, sizeof(v12));
  std::vector<OUBox3d>::__init_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>(v12, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
  v7 = [(OUBox3dSerialization *)self dictionaryFromBoxes3d:v12];
  uint64_t v8 = (void *)[v7 mutableCopy];

  OUBox3d v13 = (void **)v12;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100](&v13);
  unint64_t v9 = OUPointCloudToDictionary(v6);
  [v8 setObject:v9 forKeyedSubscript:@"points"];

  unint64_t v10 = (void *)[v8 copy];
  return v10;
}

- (OUBox3d)box3dFromDictionary:(SEL)a3
{
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v40 = v6;
  }
  else {
    id v40 = 0;
  }

  id v7 = [v5 objectForKeyedSubscript:@"bbox"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [v5 objectForKeyedSubscript:@"confidence"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v41 = v9;
  }
  else {
    id v41 = 0;
  }

  id v10 = v8;
  if ([v10 count] == 8)
  {
    for (uint64_t i = 0; i != 8; ++i)
    {
      v12 = [v10 objectAtIndexedSubscript:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        break;
      }
      id v14 = [v10 objectAtIndexedSubscript:i];
      if ([v14 count] != 3)
      {

        goto LABEL_17;
      }
      id v15 = [v14 objectAtIndexedSubscript:0];
      [v15 floatValue];
      *(void *)&long long v43 = v16;
      v17 = [v14 objectAtIndexedSubscript:1];
      [v17 floatValue];
      int v42 = v18;
      v19 = [v14 objectAtIndexedSubscript:2];
      [v19 floatValue];
      long long v20 = v43;
      DWORD1(v20) = v42;
      DWORD2(v20) = v21;
      v46[i] = v20;
    }
  }
  else
  {
LABEL_17:
    char isKindOfClass = 0;
  }

  if (!v40 || !v10 || !v41 || (isKindOfClass & 1) == 0)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "[3DOD] input is insufficient to process box3dFromDictionary.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
    __cxa_throw(exception, (struct type_info *)off_264CFAB20, MEMORY[0x263F8C080]);
  }
  v22 = [v5 objectForKeyedSubscript:@"type"];
  [v41 floatValue];
  int v24 = v23;
  long long v25 = v46[5];
  *(_OWORD *)&retstr->var6.var1 = v46[4];
  *(_OWORD *)&retstr->var7 = v25;
  long long v26 = v46[7];
  *(_OWORD *)&retstr[1].var1 = v46[6];
  *(_OWORD *)&retstr[1].var3 = v26;
  long long v27 = v46[1];
  *(_OWORD *)&retstr->var1 = v46[0];
  *(_OWORD *)&retstr->var3 = v27;
  long long v28 = v46[3];
  *(_OWORD *)&retstr->var5.var0 = v46[2];
  *(_OWORD *)&retstr->var5.var2.var0 = v28;
  v29 = v22;
  retstr[1].var5.var0 = v29;
  LODWORD(retstr[1].var5.var1) = v24;
  retstr[1].var5.var2.var0 = 0;
  retstr[1].var6.var0 = (unint64_t *)@"unknown";
  *(_OWORD *)&retstr[1].var6.var1 = 0u;
  *(_OWORD *)&retstr[1].var7 = 0u;
  *(_OWORD *)&retstr[2].var1 = 0u;
  retstr[2].var3 = 0;
  LOWORD(retstr[2].var4) = -1;
  v30 = [v5 objectForKeyedSubscript:@"identifier"];
  if (v30) {
    retstr[1].var5.var2.var0 = (float *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v30];
  }
  id v31 = [v5 objectForKeyedSubscript:@"logits"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v32 = v31;
  }
  else {
    id v32 = 0;
  }

  if (v32)
  {
    vectorFromNSArray(v32, &v44);
    v33 = v45;
    *(_OWORD *)&retstr[1].var6.var1 = v44;
    retstr[1].var7 = v33;
  }
  id v34 = [v5 objectForKeyedSubscript:@"group_type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v35 = v34;
  }
  else {
    id v35 = 0;
  }

  if (v35)
  {
    retstr[2].var3 = [v5 objectForKeyedSubscript:@"group_type"];
  }
  id v36 = [v5 objectForKeyedSubscript:@"group_id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v37 = v36;
  }
  else {
    id v37 = 0;
  }

  if (v37) {
    LOWORD(retstr[2].var4) = [v37 intValue];
  }

  return result;
}

- (id)pointCloudFromDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend(v3, "allKeys", 0);
  id v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 isEqualToString:@"points"])
        {
          id v10 = [OUPointCloud alloc];
          v11 = [v3 objectForKeyedSubscript:v9];
          uint64_t v12 = [(OUPointCloud *)v10 initWithDictionary:v11];

          id v5 = (void *)v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  OUBox3d v13 = (void *)[v5 copy];
  return v13;
}

- (vector<OUBox3d,)boxes3dFromDictionary:(OUBox3dSerialization *)self
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v6;
  uint64_t v7 = [v6 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v7);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v10 isEqualToString:@"boxes"])
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v11 = [v16 objectForKeyedSubscript:v10];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v27 != v13) {
                  objc_enumerationMutation(v11);
                }
                [(OUBox3dSerialization *)self box3dFromDictionary:*(void *)(*((void *)&v26 + 1) + 8 * j)];
                std::vector<OUBox3d>::push_back[abi:ne180100]((uint64_t *)retstr, v18);

                if (__p) {
                  operator delete(__p);
                }
                if (v22)
                {
                  int v23 = v22;
                  operator delete(v22);
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  return result;
}

@end