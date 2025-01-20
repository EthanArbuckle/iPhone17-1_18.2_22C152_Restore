@interface MSDCDNSessionTaskInfo
- (BOOL)isValid;
- (NSDictionary)credentialHeaders;
- (NSString)fileHash;
- (NSString)serverType;
- (NSString)urlSchema;
- (id)getRequestForTimeout:(double)a3;
- (void)setCredentialHeaders:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setServerType:(id)a3;
- (void)setUrlSchema:(id)a3;
@end

@implementation MSDCDNSessionTaskInfo

- (BOOL)isValid
{
  v9.receiver = self;
  v9.super_class = (Class)MSDCDNSessionTaskInfo;
  if (![(MSDSessionTaskInfo *)&v9 isValid]) {
    return 0;
  }
  v3 = [(MSDCDNSessionTaskInfo *)self urlSchema];
  if (v3)
  {
    v4 = [(MSDCDNSessionTaskInfo *)self fileHash];
    if (v4)
    {
      v5 = [(MSDCDNSessionTaskInfo *)self serverType];
      if (v5)
      {
        v6 = [(MSDCDNSessionTaskInfo *)self credentialHeaders];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)getRequestForTimeout:(double)a3
{
  uint64_t v5 = [(MSDCDNSessionTaskInfo *)self urlSchema];
  if (!v5
    || (v6 = (void *)v5,
        [(MSDCDNSessionTaskInfo *)self urlSchema],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    v18 = sub_100068600();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000CDD58();
    }
    goto LABEL_24;
  }
  uint64_t v9 = [(MSDCDNSessionTaskInfo *)self credentialHeaders];
  if (!v9
    || (v10 = (void *)v9,
        [(MSDCDNSessionTaskInfo *)self credentialHeaders],
        v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v12 = objc_opt_isKindOfClass(),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    v18 = sub_100068600();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000CDD8C(v18, v42, v43, v44, v45, v46, v47, v48);
    }
    goto LABEL_24;
  }
  v13 = [(MSDCDNSessionTaskInfo *)self urlSchema];
  v14 = (char *)[v13 rangeOfString:@"/<prefix-"];
  uint64_t v16 = v15;

  if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = sub_100068600();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000CDDFC(self);
    }
    goto LABEL_24;
  }
  v17 = [(MSDCDNSessionTaskInfo *)self urlSchema];
  v18 = [v17 substringFromIndex:&v14[v16]];

  id v19 = [v18 integerValue];
  v20 = [(MSDCDNSessionTaskInfo *)self fileHash];
  id v21 = [v20 length];

  if (v21 <= v19)
  {
    v51 = sub_100068600();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_1000CDF1C(self);
    }

    goto LABEL_24;
  }
  v22 = [(MSDCDNSessionTaskInfo *)self fileHash];
  v23 = [v22 substringToIndex:v19];

  v24 = [(MSDCDNSessionTaskInfo *)self urlSchema];
  v25 = [v24 substringToIndex:v14];
  v26 = [(MSDCDNSessionTaskInfo *)self fileHash];
  v27 = +[NSString stringWithFormat:@"%@/%@/%@", v25, v23, v26];

  v28 = +[NSURL URLWithString:v27];
  v29 = +[NSMutableURLRequest requestWithURL:v28 cachePolicy:1 timeoutInterval:a3];
  [(MSDSessionTaskInfo *)self setRequest:v29];

  v30 = [(MSDSessionTaskInfo *)self request];

  if (!v30)
  {
    v52 = sub_100068600();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_1000CDE80();
    }

LABEL_24:
    v41 = 0;
    goto LABEL_29;
  }
  v53 = v27;
  v54 = v23;
  v55 = v18;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v31 = self;
  v32 = [(MSDCDNSessionTaskInfo *)self credentialHeaders];
  id v33 = [v32 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v57;
    while (2)
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v57 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v38 = [v37 objectForKey:@"name"];
        v39 = [v37 objectForKey:@"value"];
        if (!v38
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || !v39
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v49 = sub_100068600();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_1000CDEB4();
          }

          v41 = 0;
          goto LABEL_28;
        }
        v40 = [(MSDSessionTaskInfo *)v31 request];
        [v40 addValue:v39 forHTTPHeaderField:v38];
      }
      id v34 = [v32 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }

  v41 = [(MSDSessionTaskInfo *)v31 request];

LABEL_28:
  v18 = v55;
LABEL_29:

  return v41;
}

- (NSDictionary)credentialHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCredentialHeaders:(id)a3
{
}

- (NSString)urlSchema
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUrlSchema:(id)a3
{
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFileHash:(id)a3
{
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setServerType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverType, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_urlSchema, 0);

  objc_storeStrong((id *)&self->_credentialHeaders, 0);
}

@end