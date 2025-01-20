@interface SWCDatabaseStorage
+ (BOOL)supportsSecureCoding;
- (NSData)enterpriseState;
- (NSDictionary)settings;
- (NSNumber)launchServicesDatabaseGeneration;
- (NSOrderedSet)entries;
- (SWCDatabaseStorage)initWithCoder:(id)a3;
- (int64_t)databaseVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabaseVersion:(int64_t)a3;
- (void)setEnterpriseState:(id)a3;
- (void)setEntries:(id)a3;
- (void)setLaunchServicesDatabaseGeneration:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation SWCDatabaseStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  +[SWCEntry canonicalizeEntries:self->_entries];
  [a3 encodeInt64:self->_databaseVersion forKey:@"databaseVersion"];
  [a3 encodeObject:self->_entries forKey:@"entries"];
  [a3 encodeObject:self->_settings forKey:@"settings"];
  [a3 encodeObject:self->_launchServicesDatabaseGeneration forKey:@"launchServicesDatabaseGeneration"];
  enterpriseState = self->_enterpriseState;

  [a3 encodeObject:enterpriseState forKey:@"enterpriseState"];
}

- (SWCDatabaseStorage)initWithCoder:(id)a3
{
  v48.receiver = self;
  v48.super_class = (Class)SWCDatabaseStorage;
  v5 = [(SWCDatabaseStorage *)&v48 init];
  if (!v5) {
    goto LABEL_25;
  }
  v5->_databaseVersion = (int64_t)[a3 decodeInt64ForKey:@"databaseVersion"];
  uint64_t v6 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  id v7 = objc_alloc((Class)NSSet);
  v55[0] = objc_opt_class();
  v55[1] = v6;
  v8 = +[NSArray arrayWithObjects:v55 count:2];
  id v9 = [v7 initWithArray:v8];

  id v10 = objc_alloc((Class)NSSet);
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v54[2] = objc_opt_class();
  v54[3] = objc_opt_class();
  v54[4] = objc_opt_class();
  v54[5] = objc_opt_class();
  v54[6] = v36;
  v11 = +[NSArray arrayWithObjects:v54 count:7];
  id v37 = [v10 initWithArray:v11];

  v12 = [a3 swc_decodeObjectOfClasses:v9 forKey:@"entries"];
  v13 = [a3 swc_decodeObjectOfClasses:v37 forKey:@"settings"];
  [a3 swc_decodeObjectOfClass:objc_opt_class() forKey:@"launchServicesDatabaseGeneration"];
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [a3 swc_decodeObjectOfClass:objc_opt_class() forKey:@"enterpriseState"];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_16:
      id v21 = objc_alloc((Class)NSError);
      v51[0] = @"Line";
      v51[1] = @"Function";
      v52[0] = &off_100036858;
      entries = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDatabaseStorage initWithCoder:]");
      v52[1] = entries;
      v22 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
      id v23 = [v21 initWithDomain:NSCocoaErrorDomain code:4864 userInfo:v22];
      [a3 failWithError:v23];

      goto LABEL_17;
    }
    +[SWCEntry canonicalizeEntries:v12];
    id v34 = v9;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v12;
    v16 = (char *)[v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v45;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v15);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v9 = v34;
            goto LABEL_16;
          }
        }
        v16 = (char *)[v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v9 = v34;
    v19 = (NSOrderedSet *)v15;
  }
  else
  {
    v19 = (NSOrderedSet *)objc_alloc_init((Class)NSOrderedSet);
  }
  entries = v5->_entries;
  v5->_entries = v19;
LABEL_17:

  if (v13)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    char v43 = _NSIsNSDictionary();
    if (*((unsigned char *)v41 + 24)
      && (v39[0] = _NSConcreteStackBlock,
          v39[1] = 3221225472,
          v39[2] = sub_100014D60,
          v39[3] = &unk_100034D30,
          v39[4] = &v40,
          v39[5] = v36,
          [v13 enumerateKeysAndObjectsUsingBlock:v39],
          *((unsigned char *)v41 + 24)))
    {
      v24 = v13;
      settings = v5->_settings;
      v5->_settings = v24;
    }
    else
    {
      id v26 = objc_alloc((Class)NSError);
      v49[0] = @"Line";
      v49[1] = @"Function";
      v50[0] = &off_100036870;
      settings = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDatabaseStorage initWithCoder:]");
      v50[1] = settings;
      v27 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
      id v28 = [v26 initWithDomain:NSCocoaErrorDomain code:4864 userInfo:v27];
      [a3 failWithError:v28];
    }
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    v29 = v5->_settings;
    v5->_settings = (NSDictionary *)&__NSDictionary0__struct;
  }
  launchServicesDatabaseGeneration = v5->_launchServicesDatabaseGeneration;
  v5->_launchServicesDatabaseGeneration = v14;
  v31 = v14;

  enterpriseState = v5->_enterpriseState;
  v5->_enterpriseState = (NSData *)v35;

LABEL_25:
  return v5;
}

- (int64_t)databaseVersion
{
  return self->_databaseVersion;
}

- (void)setDatabaseVersion:(int64_t)a3
{
  self->_databaseVersion = a3;
}

- (NSOrderedSet)entries
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntries:(id)a3
{
}

- (NSDictionary)settings
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSettings:(id)a3
{
}

- (NSNumber)launchServicesDatabaseGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLaunchServicesDatabaseGeneration:(id)a3
{
}

- (NSData)enterpriseState
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnterpriseState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enterpriseState, 0);
  objc_storeStrong((id *)&self->_launchServicesDatabaseGeneration, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

@end