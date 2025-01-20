@interface HAPTLVBase
- (BOOL)_parseFields:(id)a3;
- (BOOL)_parseFromTLVData;
- (BOOL)_parseMandatory:(id)a3 optional:(id)a4;
- (HAPTLVBase)initWithTLVData:(id)a3;
- (NSData)tlvDatablob;
- (id)_parseArray:(id)a3 result:(id *)a4 objectCreator:(id)a5;
@end

@implementation HAPTLVBase

- (HAPTLVBase)initWithTLVData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAPTLVBase;
  v6 = [(HAPTLVBase *)&v10 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_tlvDatablob, a3), ![(HAPTLVBase *)v7 _parseFromTLVData])) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }

  return v8;
}

- (BOOL)_parseFromTLVData
{
  return 0;
}

- (BOOL)_parseFields:(id)a3
{
  id v4 = a3;
  v48 = self;
  id v5 = [(HAPTLVBase *)self tlvDatablob];
  v6 = +[HAPTLVParser parserWithData:v5];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (!v8)
  {
    char v10 = 1;
    goto LABEL_52;
  }
  id v9 = v8;
  char v10 = 1;
  uint64_t v11 = *(void *)v53;
  v49 = v6;
  id v50 = v7;
  do
  {
    v12 = 0;
    do
    {
      if (*(void *)v53 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        v15 = [v6 parseResponseForNumber:[v14 tlvid]];
        if (v15) {
          goto LABEL_35;
        }
        v16 = sub_100083F74();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = sub_100083FD0(0);
          v18 = [v14 name];
          id v19 = [v14 tlvid];
          v20 = [(HAPTLVBase *)v48 tlvDatablob];
          *(_DWORD *)buf = 138544130;
          v57 = v17;
          __int16 v58 = 2112;
          v59 = v18;
          __int16 v60 = 2048;
          id v61 = v19;
          __int16 v62 = 2112;
          v63 = v20;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse number for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

          v6 = v49;
          id v7 = v50;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          v15 = [v6 parseResponseForUInt8:[v14 tlvid]];
          if (v15) {
            goto LABEL_35;
          }
          v16 = sub_100083F74();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v21 = sub_100083FD0(0);
            v22 = [v14 name];
            id v23 = [v14 tlvid];
            v24 = [(HAPTLVBase *)v48 tlvDatablob];
            *(_DWORD *)buf = 138544130;
            v57 = v21;
            __int16 v58 = 2112;
            v59 = v22;
            __int16 v60 = 2048;
            id v61 = v23;
            __int16 v62 = 2112;
            v63 = v24;
            v25 = v16;
            v26 = "%{public}@Failed to parse uint8 for tlv: %@ with ID: %tu (%@)";
LABEL_26:
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x2Au);

            id v7 = v50;
            v6 = v49;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v13;
            v15 = [v6 parseResponseForUInt16:[v14 tlvid]];
            if (v15) {
              goto LABEL_35;
            }
            v16 = sub_100083F74();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v21 = sub_100083FD0(0);
              v22 = [v14 name];
              id v27 = [v14 tlvid];
              v24 = [(HAPTLVBase *)v48 tlvDatablob];
              *(_DWORD *)buf = 138544130;
              v57 = v21;
              __int16 v58 = 2112;
              v59 = v22;
              __int16 v60 = 2048;
              id v61 = v27;
              __int16 v62 = 2112;
              v63 = v24;
              v25 = v16;
              v26 = "%{public}@Failed to parse uint16 for tlv: %@ with ID: %tu (%@)";
              goto LABEL_26;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;
              v15 = [v6 parseResponseForString:[v14 tlvid]];
              if (v15) {
                goto LABEL_35;
              }
              v16 = sub_100083F74();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v21 = sub_100083FD0(0);
                v22 = [v14 name];
                id v28 = [v14 tlvid];
                v24 = [(HAPTLVBase *)v48 tlvDatablob];
                *(_DWORD *)buf = 138544130;
                v57 = v21;
                __int16 v58 = 2112;
                v59 = v22;
                __int16 v60 = 2048;
                id v61 = v28;
                __int16 v62 = 2112;
                v63 = v24;
                v25 = v16;
                v26 = "%{public}@Failed to parse String for tlv: %@ with ID: %tu (%@)";
                goto LABEL_26;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = v13;
                v15 = [v6 parseResponseForData:[v14 tlvid]];
                if (v15) {
                  goto LABEL_35;
                }
                v16 = sub_100083F74();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v21 = sub_100083FD0(0);
                  v22 = [v14 name];
                  id v29 = [v14 tlvid];
                  v24 = [(HAPTLVBase *)v48 tlvDatablob];
                  *(_DWORD *)buf = 138544130;
                  v57 = v21;
                  __int16 v58 = 2112;
                  v59 = v22;
                  __int16 v60 = 2048;
                  id v61 = v29;
                  __int16 v62 = 2112;
                  v63 = v24;
                  v25 = v16;
                  v26 = "%{public}@Failed to parse Data for tlv: %@ with ID: %tu (%@)";
                  goto LABEL_26;
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v30 = v13;
                  uint64_t v31 = [v6 parseResponseForArray:[v30 tlvid]];
                  if (v31)
                  {
                    v15 = v31;
                    v32 = [v30 objectCreator];

                    if (v32)
                    {
                      v51 = v15;
                      v33 = [v30 objectCreator];
                      v34 = [(HAPTLVBase *)v48 _parseArray:v15 result:&v51 objectCreator:v33];
                      v35 = v51;

                      if (v34)
                      {
                        [v30 setField:v34];
                      }
                      else
                      {
                        v41 = sub_100083F74();
                        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                        {
                          v42 = sub_100083FD0(0);
                          v47 = [v30 name];
                          id v46 = [v30 tlvid];
                          v43 = [(HAPTLVBase *)v48 tlvDatablob];
                          *(_DWORD *)buf = 138544130;
                          v57 = v42;
                          __int16 v58 = 2112;
                          v59 = v47;
                          __int16 v60 = 2048;
                          id v61 = v46;
                          __int16 v62 = 2112;
                          v63 = v43;
                          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);
                        }
                        char v10 = 0;
                      }
                      v6 = v49;

                      v15 = v35;
                      id v7 = v50;
                    }
                    else
                    {
                      [v30 setField:v15];
                      v6 = v49;
                      id v7 = v50;
                    }
                  }
                  else
                  {
                    v15 = sub_100083F74();
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                    {
                      v36 = sub_100083FD0(0);
                      v37 = [v30 name];
                      id v38 = [v30 tlvid];
                      v39 = [(HAPTLVBase *)v48 tlvDatablob];
                      *(_DWORD *)buf = 138544130;
                      v57 = v36;
                      __int16 v58 = 2112;
                      v59 = v37;
                      __int16 v60 = 2048;
                      id v61 = v38;
                      __int16 v62 = 2112;
                      v63 = v39;
                      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Array for tlv: %@ with ID: %tu (%@)", buf, 0x2Au);

                      v6 = v49;
                    }
                    char v10 = 0;
                    id v7 = v50;
                  }
                  goto LABEL_36;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_37;
                }
                id v14 = v13;
                v15 = [v6 parseResponseForUUID:[v14 tlvid]];
                if (v15)
                {
LABEL_35:
                  [v14 setField:v15];
                  goto LABEL_36;
                }
                v16 = sub_100083F74();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v21 = sub_100083FD0(0);
                  v22 = [v14 name];
                  id v40 = [v14 tlvid];
                  v24 = [(HAPTLVBase *)v48 tlvDatablob];
                  *(_DWORD *)buf = 138544130;
                  v57 = v21;
                  __int16 v58 = 2112;
                  v59 = v22;
                  __int16 v60 = 2048;
                  id v61 = v40;
                  __int16 v62 = 2112;
                  v63 = v24;
                  v25 = v16;
                  v26 = "%{public}@Failed to parse UUID for tlv: %@ with ID: %tu (%@)";
                  goto LABEL_26;
                }
              }
            }
          }
        }
      }

      char v10 = 0;
LABEL_36:

LABEL_37:
      v12 = (char *)v12 + 1;
    }
    while (v9 != v12);
    id v44 = [v7 countByEnumeratingWithState:&v52 objects:v64 count:16];
    id v9 = v44;
  }
  while (v44);
LABEL_52:

  return v10 & 1;
}

- (BOOL)_parseMandatory:(id)a3 optional:(id)a4
{
  id v6 = a4;
  LOBYTE(a3) = [(HAPTLVBase *)self _parseFields:a3];
  [(HAPTLVBase *)self _parseFields:v6];

  return (char)a3;
}

- (id)_parseArray:(id)a3 result:(id *)a4 objectCreator:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a5;
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = v7[2](v7, *(void *)(*((void *)&v18 + 1) + 8 * v13));
      if (!v14) {
        break;
      }
      v15 = (void *)v14;
      [v8 addObject:v14];

      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v16 = [v8 copy];

  return v16;
}

- (NSData)tlvDatablob
{
  return self->_tlvDatablob;
}

- (void).cxx_destruct
{
}

@end