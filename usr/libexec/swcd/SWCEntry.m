@interface SWCEntry
+ (BOOL)_shouldIncludeServiceWithDomain:(id)a3 fromBundleRecord:(id)a4 applicationIdentifier:(id)a5 developerModeEnabled:(BOOL)a6 enterpriseContext:(id)a7;
+ (BOOL)supportsSecureCoding;
+ (SWCEntry)new;
+ (id)_associatedDomainsFromEntitlementForBundleRecord:(id)a3 applicationIdentifier:(id)a4 developerModeEnabled:(BOOL)a5 enterpriseContext:(id)a6;
+ (id)_deduplicateServicesByMode:(id)a3;
+ (id)_enterpriseEntriesWithContext:(id)a3 forBundleRecord:(id)a4 applicationIdentifier:(id)a5;
+ (id)_entriesFromBuiltInJSONForBundleRecord:(id)a3 applicationIdentifier:(id)a4;
+ (id)additionalServiceDetailsDirectoryURLForApplicationIdentifier:(id)a3 createParentIfNeeded:(BOOL)a4 error:(id *)a5;
+ (id)entriesForBundleRecord:(id)a3 enterpriseContext:(id)a4 developerModeEnabled:(BOOL)a5;
+ (id)entriesForJSONObject:(id)a3 domain:(id)a4;
+ (void)_addEntriesToOrderedSet:(id)a3 forService:(id)a4 fromAppsArray:(id)a5 domain:(id)a6;
+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsArray:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8;
+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8;
+ (void)_addEntryToOrderedSet:(id)a3 forUniversalLinksFromSingleDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7;
+ (void)_enumerateJSONFilesForBundleRecord:(id)a3 applicationIdentifier:(id)a4 block:(id)a5;
+ (void)canonicalizeEntries:(id)a3;
+ (void)enumerateJSONResourceURLsForBundleURL:(id)a3 block:(id)a4;
+ (void)enumerateJSONResourceURLsForDirectoryAtURL:(id)a3 block:(id)a4;
- (BOOL)isDownloadable;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsFirstDownload;
- (NSData)applicationPersistentIdentifier;
- (NSDate)lastCheckedDate;
- (NSDate)nextCheckDate;
- (NSError)lastError;
- (NSNumber)retryCount;
- (NSString)applicationVersion;
- (NSString)serviceType;
- (SWCEntry)init;
- (SWCEntry)initWithApplicationIdentifier:(id)a3 service:(id)a4 domain:(id)a5;
- (SWCEntry)initWithCoder:(id)a3;
- (SWCEntry)initWithServiceSpecifier:(id)a3;
- (SWCFields)fields;
- (_SWCApplicationIdentifier)applicationIdentifier;
- (_SWCDomain)domain;
- (_SWCPatternList)patterns;
- (_SWCServiceSpecifier)serviceSpecifier;
- (_SWCSubstitutionVariableList)substitutionVariables;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unint64_t)evaluateWithURLComponents:(id)a3 auditToken:(id *)a4 matchingPattern:(id *)a5;
- (unint64_t)hash;
- (void)canonicalizeObjectAtAddress:(id *)a3 objectCache:(id)a4;
- (void)canonicalizeWithObjectCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logToFile:(__sFILE *)a3 verbosity:(unsigned __int8)a4;
- (void)setApplicationPersistentIdentifier:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setLastCheckedDate:(id)a3;
- (void)setLastError:(id)a3;
- (void)setPatterns:(id)a3;
- (void)setRetryCount:(id)a3;
- (void)setSubstitutionVariables:(id)a3;
@end

@implementation SWCEntry

+ (SWCEntry)new
{
}

- (SWCEntry)init
{
}

- (SWCEntry)initWithApplicationIdentifier:(id)a3 service:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SWCEntry;
  v11 = [(SWCEntry *)&v21 init];
  if (v11)
  {
    uint64_t v12 = _SWCServiceTypeCanonicalize();
    serviceType = v11->_serviceType;
    v11->_serviceType = (NSString *)v12;

    v14 = (_SWCDomain *)[v10 copy];
    domain = v11->_domain;
    v11->_domain = v14;

    v16 = (_SWCApplicationIdentifier *)[v8 copy];
    applicationIdentifier = v11->_applicationIdentifier;
    v11->_applicationIdentifier = v16;

    uint64_t v18 = +[NSDate distantPast];
    lastCheckedDate = v11->_lastCheckedDate;
    v11->_lastCheckedDate = (NSDate *)v18;
  }
  return v11;
}

- (SWCEntry)initWithServiceSpecifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 isFullySpecified])
  {
    v6 = [v5 SWCApplicationIdentifier];
    v7 = [v5 serviceType];
    id v8 = [v5 SWCDomain];
    id v9 = [(SWCEntry *)self initWithApplicationIdentifier:v6 service:v7 domain:v8];

    self = v6;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)logToFile:(__sFILE *)a3 verbosity:(unsigned __int8)a4
{
  int v4 = a4;
  v7 = [(SWCEntry *)self serviceType];
  _SWCLogValueForKey();

  id v8 = [(SWCEntry *)self applicationIdentifier];
  _SWCLogValueForKey();

  if (v4)
  {
    id v9 = [(SWCEntry *)self applicationVersion];
    _SWCLogValueForKey();

    id v10 = [(SWCEntry *)self applicationPersistentIdentifier];
    v11 = _LSPersistentIdentifierGetDebugDescription();
    _SWCLogValueForKey();
  }
  uint64_t v12 = [(SWCEntry *)self domain];
  _SWCLogValueForKey();

  if (v4)
  {
    v13 = [(SWCEntry *)self patterns];

    if (v13)
    {
      v14 = [(SWCEntry *)self patterns];
      _SWCLogValueForKey();
    }
    v15 = [(SWCEntry *)self substitutionVariables];

    if (v15)
    {
      v16 = [(SWCEntry *)self substitutionVariables];
      _SWCLogValueForKey();
    }
  }
  v17 = [(SWCEntry *)self domain];
  unsigned int v18 = [v17 modeOfOperation];

  if (v18 == 1)
  {
    CFStringRef v19 = @"developer";
  }
  else
  {
    if (v18 != 2)
    {
      v20 = 0;
      goto LABEL_14;
    }
    CFStringRef v19 = @"managed";
  }
  v20 = +[NSSet setWithObject:v19];
LABEL_14:
  objc_super v21 = self;
  [(SWCEntry *)v21 fields];
  _SWCFieldsLogDebugDescription();
  v22 = [(SWCEntry *)v21 lastCheckedDate];
  v23 = v22;
  if (v22)
  {
    [v22 timeIntervalSince1970];
    if (fabs(v24) < 1.0e10) {
      _SWCLogValueForKey();
    }
  }

  v25 = [(SWCEntry *)v21 nextCheckDate];
  v26 = v25;
  if (v25)
  {
    [v25 timeIntervalSince1970];
    if (fabs(v27) < 1.0e10) {
      _SWCLogValueForKey();
    }
  }

  v28 = [(SWCEntry *)v21 lastError];
  if (v28)
  {
    if (v4)
    {
      _SWCLogValueForKey();
    }
    else
    {
      id v29 = objc_alloc((Class)NSString);
      v30 = [v28 domain];
      id v31 = [v29 initWithFormat:@"%@ %lli", v30, [v28 code]];
      _SWCLogValueForKey();
    }
  }

  v32 = [(SWCEntry *)v21 retryCount];
  if (v32) {
    _SWCLogValueForKey();
  }
}

- (_SWCServiceSpecifier)serviceSpecifier
{
  id v3 = objc_alloc((Class)_SWCServiceSpecifier);
  int v4 = [(SWCEntry *)self serviceType];
  v5 = [(SWCEntry *)self applicationIdentifier];
  v6 = [(SWCEntry *)self domain];
  id v7 = [v3 _initWithServiceType:v4 applicationIdentifier:v5 domain:v6];

  return (_SWCServiceSpecifier *)v7;
}

+ (void)canonicalizeEntries:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    objc_opt_class();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v3;
    id v5 = 0;
    id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
          if (objc_opt_isKindOfClass())
          {
            if (!v5) {
              id v5 = objc_alloc_init((Class)NSMutableSet);
            }
            [v9 canonicalizeWithObjectCache:v5, v10];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)canonicalizeObjectAtAddress:(id *)a3 objectCache:(id)a4
{
  id v6 = a4;
  id v5 = [v6 member:*a3];
  if (v5)
  {
    objc_storeStrong(a3, v5);
  }
  else if (*a3)
  {
    [v6 addObject:];
  }
}

- (void)canonicalizeWithObjectCache:(id)a3
{
  id v4 = a3;
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:](self, "canonicalizeObjectAtAddress:objectCache:", &self->_applicationIdentifier);
  [(SWCEntry *)self canonicalizeObjectAtAddress:&self->_domain objectCache:v4];
  [(SWCEntry *)self canonicalizeObjectAtAddress:&self->_patterns objectCache:v4];
  [(SWCEntry *)self canonicalizeObjectAtAddress:&self->_substitutionVariables objectCache:v4];
}

- (unint64_t)evaluateWithURLComponents:(id)a3 auditToken:(id *)a4 matchingPattern:(id *)a5
{
  id v8 = a3;
  id v9 = [(SWCEntry *)self patterns];
  if (v9)
  {
    long long v10 = [(SWCEntry *)self substitutionVariables];
    unint64_t v11 = (unint64_t)[v9 evaluateWithURLComponents:v8 substitutionVariables:v10 auditToken:a4 matchingPattern:a5 index:0];
  }
  else
  {
    unint64_t v11 = 200;
  }

  return v11;
}

- (SWCFields)fields
{
  return &self->_fields;
}

- (BOOL)isDownloadable
{
  return (*(_WORD *)&self->_fields & 0x1C00) == 0;
}

- (BOOL)needsFirstDownload
{
  if ((*(_WORD *)&self->_fields & 0xC) != 0) {
    return 0;
  }
  id v3 = [(SWCEntry *)self retryCount];
  BOOL v2 = v3 == 0;

  return v2;
}

- (NSDate)nextCheckDate
{
  id v4 = self;
  int v5 = *(_WORD *)[(SWCEntry *)v4 fields] & 0xC;
  if (v5) {
    goto LABEL_5;
  }
  id v6 = [(SWCEntry *)v4 retryCount];
  uint64_t v7 = v6;
  if (!v6
    || (id v8 = [v6 unsignedIntegerValue],
        +[_SWCPrefs sharedPrefs],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 maximumRetryCount],
        v9,
        v8 < v10))
  {

LABEL_5:
    unint64_t v11 = +[_SWCPrefs sharedPrefs];
    [v11 retryIntervalAfterSuccess:v5 != 0];
    double v13 = v12;

    v14 = [(SWCEntry *)v4 lastCheckedDate];
    v15 = [v14 dateByAddingTimeInterval:v13];

    goto LABEL_6;
  }
  v17 = +[_SWCPrefs sharedPrefs];
  [v17 retryIntervalAfterReachLimitWithFailure:[v7 unsignedIntegerValue]];
  double v19 = v18;

  v20 = [(SWCEntry *)v4 lastCheckedDate];
  v15 = [v20 dateByAddingTimeInterval:v19];

  if (qword_10003B1C0 != -1) {
    dispatch_once(&qword_10003B1C0, &stru_100034AE0);
  }
  objc_super v21 = (id)qword_10003B1B8;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = +[_SWCPrefs sharedPrefs];
    int v23 = 138413058;
    double v24 = v4;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2048;
    id v30 = [v22 maximumRetryCount];
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "nextCheckDate for '%@' will be %@ because it is at its retry limit (%{public}@ of %llu)", (uint8_t *)&v23, 0x2Au);
  }
  if (!v15) {
    goto LABEL_5;
  }
LABEL_6:

  return (NSDate *)v15;
}

- (NSError)lastError
{
  if (self->_lastErrorJSON)
  {
    id v4 = +[NSJSONSerialization JSONObjectWithData:self->_lastErrorJSON options:0 error:0];
    if (v4 && _NSIsNSDictionary())
    {
      int v5 = [v4 objectForKeyedSubscript:@"d"];
      id v6 = [v4 objectForKeyedSubscript:@"c"];
      uint64_t v7 = [v4 objectForKeyedSubscript:@"u"];
      if (_NSIsNSString() && _NSIsNSNumber() && (!v7 || _NSIsNSDictionary())) {
        id v8 = [objc_alloc((Class)NSError) initWithDomain:v5 code:[v6 integerValue] userInfo:v7];
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (NSError *)v8;
}

- (void)setLastError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v7 = [v4 domain];
    [v6 setObject:v7 forKeyedSubscript:@"d"];

    id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v6 setObject:v8 forKeyedSubscript:@"c"];

    id v9 = [v4 userInfo];
    id v10 = v9;
    if (v9 && [v9 count])
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000B464;
      v15[3] = &unk_100034940;
      id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v10 count]];
      id v16 = v11;
      [v10 enumerateKeysAndObjectsUsingBlock:v15];
      [v6 setObject:v11 forKeyedSubscript:@"u"];
    }
    double v12 = +[NSJSONSerialization dataWithJSONObject:v6 options:8 error:0];
    lastErrorJSON = self->_lastErrorJSON;
    self->_lastErrorJSON = v12;
  }
  else
  {
    v14 = self->_lastErrorJSON;
    self->_lastErrorJSON = 0;
  }
}

- (unint64_t)hash
{
  id v3 = [(SWCEntry *)self applicationIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  int v5 = [(SWCEntry *)self serviceType];
  unint64_t v6 = (unint64_t)[v5 hash];
  uint64_t v7 = [(SWCEntry *)self domain];
  unint64_t v8 = v6 ^ v4 ^ (unint64_t)[v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SWCEntry *)a3;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      unint64_t v6 = [(SWCEntry *)self applicationIdentifier];
      uint64_t v7 = [(SWCEntry *)v5 applicationIdentifier];
      if ([v6 isEqual:v7])
      {
        unint64_t v8 = [(SWCEntry *)self serviceType];
        id v9 = [(SWCEntry *)v5 serviceType];
        if ([v8 isEqual:v9])
        {
          id v10 = [(SWCEntry *)self domain];
          id v11 = [(SWCEntry *)v5 domain];
          unsigned __int8 v12 = [v10 isEqual:v11];
        }
        else
        {
          unsigned __int8 v12 = 0;
        }
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  unint64_t v4 = [(SWCEntry *)self patterns];

  if (v4)
  {
    int v5 = [(SWCEntry *)self patterns];
    [v3 appendFormat:@", patternCount = %llu", [v5 count]];
  }
  unint64_t v6 = [(SWCEntry *)self substitutionVariables];

  if (v6)
  {
    uint64_t v7 = [(SWCEntry *)self substitutionVariables];
    [v3 appendFormat:@", subVarCount = %llu", [v7 count]];
  }
  id v8 = objc_alloc((Class)NSString);
  id v9 = [(SWCEntry *)self serviceType];
  id v10 = [(SWCEntry *)self applicationIdentifier];
  id v11 = [(SWCEntry *)self domain];
  unsigned __int8 v12 = self;
  [(SWCEntry *)v12 fields];
  double v13 = _SWCServiceApprovalStateGetDebugDescription();
  [(SWCEntry *)v12 fields];
  v14 = _SWCServiceApprovalStateGetDebugDescription();
  id v15 = [v8 initWithFormat:@"{ s = %@, a = %@, d = %@, ua = %@, sa = %@%@ }", v9, v10, v11, v13, v14, v3];

  return v15;
}

- (id)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  int v5 = [(SWCEntry *)self description];
  id v6 = [v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = [(SWCEntry *)self serviceType];
  int v5 = [(SWCEntry *)self applicationIdentifier];
  id v6 = [v5 redactedDescription];
  uint64_t v7 = [(SWCEntry *)self domain];
  id v8 = [v7 redactedDescription];
  id v9 = self;
  [(SWCEntry *)v9 fields];
  id v10 = _SWCServiceApprovalStateGetDebugDescription();
  [(SWCEntry *)v9 fields];
  id v11 = _SWCServiceApprovalStateGetDebugDescription();
  id v12 = [v3 initWithFormat:@"{ s = %@, a = %@, d = %@, ua = %@, sa = %@ }", v4, v6, v8, v10, v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_applicationIdentifier forKey:@"appID"];
  [v4 encodeObject:self->_serviceType forKey:@"service"];
  [v4 encodeObject:self->_domain forKey:@"domain"];
  [v4 encodeObject:self->_applicationVersion forKey:@"applicationVersion"];
  [v4 encodeObject:self->_applicationPersistentIdentifier forKey:@"applicationPersistentIdentifier"];
  _SWCFieldsEncodeWithCoder();
  [v4 encodeObject:self->_patterns forKey:@"patternList"];
  [v4 encodeObject:self->_substitutionVariables forKey:@"substitutionVariableList"];
  [v4 encodeObject:self->_lastCheckedDate forKey:@"lastCheckedDate"];
  [v4 encodeObject:self->_lastErrorJSON forKey:@"lastErrorJSON"];
  [v4 encodeObject:self->_retryCount forKey:@"retryCount"];
}

- (SWCEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"appID"];
  uint64_t v7 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"service"];
  uint64_t v8 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
  id v9 = (void *)v8;
  if (v6 && v7 && v8)
  {
    id v10 = [(SWCEntry *)self initWithApplicationIdentifier:v6 service:v7 domain:v8];
    if (v10)
    {
      uint64_t v11 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"applicationVersion"];
      applicationVersion = v10->_applicationVersion;
      v10->_applicationVersion = (NSString *)v11;

      uint64_t v13 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"applicationPersistentIdentifier"];
      applicationPersistentIdentifier = v10->_applicationPersistentIdentifier;
      v10->_applicationPersistentIdentifier = (NSData *)v13;

      uint64_t v15 = _SWCFieldsMakeWithCoder();
      *(_WORD *)&v10->_fields = v15;
      v10->_fields.relativeOrder = BYTE2(v15);
      uint64_t v16 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"patternList"];
      patterns = v10->_patterns;
      v10->_patterns = (_SWCPatternList *)v16;

      uint64_t v18 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"substitutionVariableList"];
      substitutionVariables = v10->_substitutionVariables;
      v10->_substitutionVariables = (_SWCSubstitutionVariableList *)v18;

      uint64_t v20 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"lastCheckedDate"];
      lastCheckedDate = v10->_lastCheckedDate;
      v10->_lastCheckedDate = (NSDate *)v20;

      if (!v10->_lastCheckedDate)
      {
        uint64_t v22 = +[NSDate distantPast];
        int v23 = v10->_lastCheckedDate;
        v10->_lastCheckedDate = (NSDate *)v22;
      }
      uint64_t v24 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"lastErrorJSON"];
      lastErrorJSON = v10->_lastErrorJSON;
      v10->_lastErrorJSON = (NSData *)v24;

      uint64_t v26 = [v4 swc_decodeObjectOfClass:objc_opt_class() forKey:@"retryCount"];
      retryCount = v10->_retryCount;
      v10->_retryCount = (NSNumber *)v26;
    }
  }
  else
  {
    id v28 = objc_alloc((Class)NSError);
    v33[0] = @"Line";
    v33[1] = @"Function";
    v34[0] = &off_1000367B0;
    __int16 v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEntry initWithCoder:]");
    v34[1] = v29;
    id v30 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v31 = [v28 initWithDomain:NSCocoaErrorDomain code:4865 userInfo:v30];
    [v4 failWithError:v31];

    id v10 = 0;
  }

  return v10;
}

- (_SWCApplicationIdentifier)applicationIdentifier
{
  return (_SWCApplicationIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (_SWCDomain)domain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)applicationVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplicationVersion:(id)a3
{
}

- (NSData)applicationPersistentIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationPersistentIdentifier:(id)a3
{
}

- (_SWCPatternList)patterns
{
  return (_SWCPatternList *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPatterns:(id)a3
{
}

- (_SWCSubstitutionVariableList)substitutionVariables
{
  return (_SWCSubstitutionVariableList *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSubstitutionVariables:(id)a3
{
}

- (NSDate)lastCheckedDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastCheckedDate:(id)a3
{
}

- (NSNumber)retryCount
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRetryCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_lastCheckedDate, 0);
  objc_storeStrong((id *)&self->_substitutionVariables, 0);
  objc_storeStrong((id *)&self->_patterns, 0);
  objc_storeStrong((id *)&self->_applicationPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);

  objc_storeStrong((id *)&self->_lastErrorJSON, 0);
}

+ (id)entriesForBundleRecord:(id)a3 enterpriseContext:(id)a4 developerModeEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v59 = a4;
  id v60 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v58 = [objc_alloc((Class)_SWCApplicationIdentifier) initForBundleRecord:v8];
  if (v58)
  {
    id v9 = [v8 entitlements];
    id v10 = [v9 objectForKey:@"com.apple.private.swc.system-app" ofClass:objc_opt_class()];
    unsigned int v11 = [v10 isEqual:&__kCFBooleanTrue];

    if (objc_opt_respondsToSelector()) {
      unsigned int v12 = [v8 isSystemPlaceholder];
    }
    else {
      unsigned int v12 = 0;
    }
    v57 = [a1 _associatedDomainsFromEntitlementForBundleRecord:v8 applicationIdentifier:v58 developerModeEnabled:v5 enterpriseContext:v59];
    if ([v57 count])
    {
      if (qword_10003B1C0 != -1) {
        dispatch_once(&qword_10003B1C0, &stru_100034AE0);
      }
      uint64_t v15 = (id)qword_10003B1B8;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [v8 bundleVersion];
        *(_DWORD *)buf = 138412546;
        id v85 = v8;
        __int16 v86 = 2114;
        id v87 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Adding bundle record %@ (version %{public}@)", buf, 0x16u);
      }
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_10000CCB0;
      v77[3] = &unk_100034968;
      id v78 = v58;
      id v79 = v60;
      [v57 enumerateKeysAndObjectsUsingBlock:v77];
    }
    else
    {
      if (qword_10003B1C0 != -1) {
        dispatch_once(&qword_10003B1C0, &stru_100034AE0);
      }
      v17 = qword_10003B1B8;
      if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v85 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "No associated domains for bundle record %@", buf, 0xCu);
      }
    }
    int v18 = v11 | v12;
    if (v57) {
      int v19 = v11 | v12;
    }
    else {
      int v19 = 0;
    }
    if (v19 == 1)
    {
      objc_super v21 = [a1 _entriesFromBuiltInJSONForBundleRecord:v8 applicationIdentifier:v58];
      if (v21)
      {
        if (qword_10003B1C0 != -1) {
          dispatch_once(&qword_10003B1C0, &stru_100034AE0);
        }
        uint64_t v22 = qword_10003B1B8;
        if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v85 = v8;
          __int16 v86 = 2112;
          id v87 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "App %@ had on-disk JSON, adding it to the pile: %@", buf, 0x16u);
        }
        [v60 unionOrderedSet:v21];
      }
    }
    if (v59)
    {
      unsigned int v23 = [v59 isManaging];
      unsigned int v24 = v57 ? v23 : 0;
      if (v24 == 1)
      {
        uint64_t v26 = [a1 _enterpriseEntriesWithContext:v59 forBundleRecord:v8 applicationIdentifier:v58];
        if (v26)
        {
          if (qword_10003B1C0 != -1) {
            dispatch_once(&qword_10003B1C0, &stru_100034AE0);
          }
          __int16 v27 = qword_10003B1B8;
          if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v85 = v8;
            __int16 v86 = 2112;
            id v87 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "App %@ had enterprise-supplied service specifiers, adding them to the pile: %@", buf, 0x16u);
          }
          [v60 unionOrderedSet:v26];
        }
      }
    }
    if ([v60 count])
    {
      id v28 = [v8 bundleVersion];
      if (v28)
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v29 = v60;
        id v30 = [v29 countByEnumeratingWithState:&v73 objects:v83 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v74;
          do
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v74 != v31) {
                objc_enumerationMutation(v29);
              }
              [*(id *)(*((void *)&v73 + 1) + 8 * i) setApplicationVersion:v28];
            }
            id v30 = [v29 countByEnumeratingWithState:&v73 objects:v83 count:16];
          }
          while (v30);
        }
      }
      v33 = [v8 persistentIdentifier];
      if (v33)
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v34 = v60;
        id v35 = [v34 countByEnumeratingWithState:&v69 objects:v82 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v70;
          do
          {
            for (j = 0; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v70 != v36) {
                objc_enumerationMutation(v34);
              }
              [*(id *)(*((void *)&v69 + 1) + 8 * (void)j) setApplicationPersistentIdentifier:v33];
            }
            id v35 = [v34 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }
          while (v35);
        }
      }
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v38 = v60;
      id v39 = [v38 countByEnumeratingWithState:&v65 objects:v81 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v66;
        do
        {
          for (k = 0; k != v39; k = (char *)k + 1)
          {
            if (*(void *)v66 != v40) {
              objc_enumerationMutation(v38);
            }
            v42 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)k) fields];
            if (v18)
            {
              __int16 v43 = *(_WORD *)v42 & 0xFFD3;
              *(_WORD *)v42 = v43 | 0x24;
              if (!v12) {
                continue;
              }
              __int16 v44 = v43 | 0x224;
            }
            else
            {
              v42[2] = 0;
              __int16 v44 = *(_WORD *)v42 & 0xFF3F;
            }
            *(_WORD *)v42 = v44;
          }
          id v39 = [v38 countByEnumeratingWithState:&v65 objects:v81 count:16];
        }
        while (v39);
      }
    }
    uint64_t v13 = v58;
  }
  else
  {
    if (qword_10003B1C0 != -1) {
      dispatch_once(&qword_10003B1C0, &stru_100034AE0);
    }
    uint64_t v13 = 0;
    v14 = qword_10003B1B8;
    if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v85 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "### Add bundle record %@ failed because of missing app identifier entitlement", buf, 0xCu);
    }
  }

  if ([v60 count]
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v8 appClipMetadata],
        v45 = objc_claimAutoreleasedReturnValue(),
        BOOL v46 = v45 == 0,
        v45,
        !v46))
  {
    id v47 = objc_alloc_init((Class)NSMutableArray);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v48 = v60;
    id v49 = [v48 countByEnumeratingWithState:&v61 objects:v80 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v62;
      do
      {
        for (m = 0; m != v49; m = (char *)m + 1)
        {
          if (*(void *)v62 != v50) {
            objc_enumerationMutation(v48);
          }
          v52 = *(void **)(*((void *)&v61 + 1) + 8 * (void)m);
          v53 = [v52 serviceType];
          char IsWhitelistedForAppClips = _SWCServiceTypeIsWhitelistedForAppClips();

          if ((IsWhitelistedForAppClips & 1) == 0) {
            [v47 addObject:v52];
          }
        }
        id v49 = [v48 countByEnumeratingWithState:&v61 objects:v80 count:16];
      }
      while (v49);
    }

    if ([v47 count])
    {
      if (qword_10003B1C0 != -1) {
        dispatch_once(&qword_10003B1C0, &stru_100034AE0);
      }
      v55 = qword_10003B1B8;
      if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v85 = v8;
        __int16 v86 = 2112;
        id v87 = v47;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Ignoring these associated domains for bundle record %@ because it is an app clip: %@", buf, 0x16u);
      }
      [v48 removeObjectsInArray:v47];
    }
  }
  else
  {
    +[SWCEntry canonicalizeEntries:v60];
  }

  return v60;
}

+ (id)entriesForJSONObject:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableOrderedSet);
  if (_NSIsNSDictionary())
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000D074;
    v11[3] = &unk_100034990;
    id v14 = a1;
    id v12 = v8;
    id v13 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
  }

  return v8;
}

+ (void)enumerateJSONResourceURLsForBundleURL:(id)a3 block:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  id v9 = [v14 URLByAppendingPathComponent:@"Contents" isDirectory:1];
  id v10 = v9;
  if (!v9 || ([v9 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v11 = v14;

    id v10 = v11;
  }
  id v12 = [v10 URLByAppendingPathComponent:@"Library/SharedWebCredentials" isDirectory:1];

  if (!v12)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SWCEntry.mm", 706, @"Unexpected failure to allocate URL for [Contents/]Library/SharedWebCredentials directory relative to bundle URL %@.", v14 object file lineNumber description];
  }
  [a1 enumerateJSONResourceURLsForDirectoryAtURL:v12 block:v7];
}

+ (void)enumerateJSONResourceURLsForDirectoryAtURL:(id)a3 block:(id)a4
{
  CFURLRef v5 = (const __CFURL *)a3;
  v54 = (void (**)(id, void *, void *))a4;
  CFURLRef bundleURL = v5;
  CFArrayRef v52 = CFBundleCopyResourceURLsOfTypeInDirectory(v5, @"json", 0);
  if (!v52)
  {
    obj = 0;
    goto LABEL_51;
  }
  if (qword_10003B1C0 != -1) {
    dispatch_once(&qword_10003B1C0, &stru_100034AE0);
  }
  id v6 = (id)qword_10003B1B8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v49 = (const __CFString *)[(__CFArray *)v52 count];
    uint64_t v50 = [(__CFURL *)bundleURL path];
    *(_DWORD *)buf = 134218498;
    CFStringRef v75 = v49;
    __int16 v76 = 2112;
    v77 = v50;
    __int16 v78 = 2112;
    CFArrayRef v79 = v52;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Found %llu JSON URLs (must filter) in directory %@: %@", buf, 0x20u);
  }
  obj = objc_alloc_init((Class)NSMutableSet);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  CFArrayRef v7 = v52;
  id v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (!v8)
  {

LABEL_33:
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    CFArrayRef v25 = v7;
    id v26 = [(__CFArray *)v25 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v64;
      do
      {
        id v28 = 0;
        do
        {
          if (*(void *)v64 != v27) {
            objc_enumerationMutation(v25);
          }
          id v29 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v28);
          uint64_t v31 = [v29 lastPathComponent];
          v32 = [v31 stringByDeletingPathExtension];

          if (v32)
          {
            id v33 = [objc_alloc((Class)_SWCDomain) initWithString:v32];
            id v34 = v33;
            if (v33 && [v33 isValid])
            {
              if (qword_10003B1C0 != -1) {
                dispatch_once(&qword_10003B1C0, &stru_100034AE0);
              }
              id v35 = (id)qword_10003B1B8;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                v53 = [v29 lastPathComponent];
                CFArrayRef v36 = [(__CFURL *)bundleURL path];
                *(_DWORD *)buf = 138412802;
                CFStringRef v75 = v53;
                __int16 v76 = 2112;
                v77 = v34;
                __int16 v78 = 2112;
                CFArrayRef v79 = v36;
                _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Found JSON file %@ for domain %@ in directory %@ (nothing model-specific)", buf, 0x20u);
              }
              v54[2](v54, v34, v29);
            }
          }
          id v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [(__CFArray *)v25 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v26);
    }

    uint64_t v22 = obj;
    obj = 0;
    goto LABEL_50;
  }
  char v55 = 0;
  uint64_t v9 = *(void *)v68;
  do
  {
    id v10 = 0;
    do
    {
      if (*(void *)v68 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v10);
      id v13 = [v11 lastPathComponent];
      id v14 = [v13 stringByDeletingPathExtension];

      if (v14)
      {
        id v15 = [v14 rangeOfString:@"." options:4];
        id v16 = [v14 rangeOfString:@"~" options:4];
        if (v16 == (id)0x7FFFFFFFFFFFFFFFLL || (v15 != (id)0x7FFFFFFFFFFFFFFFLL ? (BOOL v17 = v15 >= v16) : (BOOL v17 = 0), v17))
        {
          int v18 = v14;
        }
        else
        {
          int v18 = [v14 substringToIndex:v16];

          id v19 = [v18 rangeOfString:@"-macos" options:13];
          if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            char v55 = 1;
          }
          else
          {
            uint64_t v20 = [v18 substringToIndex:v19];

            char v55 = 1;
            int v18 = (void *)v20;
          }
        }
        -[NSObject addObject:](obj, "addObject:", v18, context);
      }
      else
      {
        int v18 = 0;
      }

      id v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v21 = [(__CFArray *)v7 countByEnumeratingWithState:&v67 objects:v73 count:16];
    id v8 = v21;
  }
  while (v21);

  if ((v55 & 1) == 0) {
    goto LABEL_33;
  }
  if (qword_10003B1C0 != -1) {
    dispatch_once(&qword_10003B1C0, &stru_100034AE0);
  }
  uint64_t v22 = (id)qword_10003B1B8;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v23 = (const __CFString *)[obj count];
    unsigned int v24 = [(__CFURL *)bundleURL path];
    *(_DWORD *)buf = 134218498;
    CFStringRef v75 = v23;
    __int16 v76 = 2112;
    v77 = v24;
    __int16 v78 = 2112;
    CFArrayRef v79 = (CFArrayRef)obj;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Found %llu JSON filenames (filtered) in directory %@: %@", buf, 0x20u);
  }
LABEL_50:

LABEL_51:
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obja = obj;
  id v37 = [obja countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v60;
    do
    {
      id v39 = 0;
      do
      {
        if (*(void *)v60 != v38) {
          objc_enumerationMutation(obja);
        }
        CFStringRef v40 = *(const __CFString **)(*((void *)&v59 + 1) + 8 * (void)v39);
        id v42 = [objc_alloc((Class)_SWCDomain) initWithString:v40];
        __int16 v43 = v42;
        if (v42 && [v42 isValid])
        {
          __int16 v44 = CFBundleCopyResourceURLInDirectory(bundleURL, v40, @"json", 0);
          if (v44)
          {
            if (qword_10003B1C0 != -1) {
              dispatch_once(&qword_10003B1C0, &stru_100034AE0);
            }
            v45 = (id)qword_10003B1B8;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              id v47 = [v44 lastPathComponent];
              CFArrayRef v48 = [(__CFURL *)bundleURL path];
              *(_DWORD *)buf = 138412802;
              CFStringRef v75 = v47;
              __int16 v76 = 2112;
              v77 = v43;
              __int16 v78 = 2112;
              CFArrayRef v79 = v48;
              _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Found JSON file %@ for domain %@ in directory %@", buf, 0x20u);
            }
            v54[2](v54, v43, v44);
          }
        }
        else
        {
          if (qword_10003B1C0 != -1) {
            dispatch_once(&qword_10003B1C0, &stru_100034AE0);
          }
          __int16 v44 = (id)qword_10003B1B8;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            BOOL v46 = [(__CFURL *)bundleURL path];
            *(_DWORD *)buf = 138412546;
            CFStringRef v75 = v40;
            __int16 v76 = 2112;
            v77 = v46;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Could not construct a domain name object for the filename %@.json in directory %@", buf, 0x16u);
          }
        }

        id v39 = (char *)v39 + 1;
      }
      while (v37 != v39);
      id v37 = [obja countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v37);
  }
}

+ (id)additionalServiceDetailsDirectoryURLForApplicationIdentifier:(id)a3 createParentIfNeeded:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = +[_SWCPrefs sharedPrefs];
  id v26 = 0;
  uint64_t v9 = [v8 containerURLReturningError:&v26];
  id v10 = v26;

  if (v9)
  {
    id v11 = [v9 URLByAppendingPathComponent:@"AdditionalServiceDetails" isDirectory:1];
    if (v11)
    {
      if (v6)
      {
        id v12 = +[NSFileManager defaultManager];
        id v25 = v10;
        unsigned int v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v25];
        id v14 = v25;

        if (!v13)
        {
          int v18 = 0;
          goto LABEL_13;
        }
        id v10 = v14;
      }
      id v15 = [v7 UUIDRepresentation];
      id v16 = v15;
      if (v15)
      {
        BOOL v17 = [v15 UUIDString];
        int v18 = [v11 URLByAppendingPathComponent:v17 isDirectory:1];
LABEL_12:

        id v14 = v10;
LABEL_13:

        id v10 = v14;
        goto LABEL_14;
      }
      id v22 = objc_alloc((Class)NSError);
      v30[0] = &off_1000367C8;
      v29[0] = @"Line";
      v29[1] = @"Function";
      BOOL v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SWCEntry(JSONParsing) additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:]");
      v29[2] = NSDebugDescriptionErrorKey;
      v30[1] = v17;
      v30[2] = @"Could not generate a UUID for the specified application identifier.";
      id v21 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
      id v23 = [v22 initWithDomain:_SWCErrorDomain code:-1 userInfo:v21];

      id v16 = 0;
      id v10 = v23;
    }
    else
    {
      id v19 = objc_alloc((Class)NSError);
      v28[0] = &off_1000367E0;
      v27[0] = @"Line";
      v27[1] = @"Function";
      id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SWCEntry(JSONParsing) additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:]");
      v27[2] = NSDebugDescriptionErrorKey;
      v28[1] = v16;
      v28[2] = @"Could not create additional service details storage directory.";
      BOOL v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
      id v20 = [v19 initWithDomain:_SWCErrorDomain code:-1 userInfo:v17];
      id v21 = v10;
      id v10 = v20;
    }

    int v18 = 0;
    goto LABEL_12;
  }
  int v18 = 0;
LABEL_14:

  if (a5 && !v18) {
    *a5 = v10;
  }

  return v18;
}

+ (BOOL)_shouldIncludeServiceWithDomain:(id)a3 fromBundleRecord:(id)a4 applicationIdentifier:(id)a5 developerModeEnabled:(BOOL)a6 enterpriseContext:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ([v11 modeOfOperation])
  {
    if (!v8)
    {
      if (qword_10003B1C0 != -1) {
        dispatch_once(&qword_10003B1C0, &stru_100034AE0);
      }
      uint64_t v23 = qword_10003B1B8;
      if (!os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 138412290;
      id v29 = v11;
      BOOL v17 = "Skipping domain %@ because developer mode is disabled";
LABEL_22:
      int v18 = v23;
      uint32_t v19 = 12;
LABEL_23:
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      goto LABEL_24;
    }
    if ((objc_msgSend(v12, "swc_isBuiltForDevelopment") & 1) == 0)
    {
      if (qword_10003B1C0 != -1) {
        dispatch_once(&qword_10003B1C0, &stru_100034AE0);
      }
      uint64_t v16 = qword_10003B1B8;
      if (!os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 138412546;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      BOOL v17 = "Skipping domain %@ because bundle %@ is not developer-signed";
      int v18 = v16;
      uint32_t v19 = 22;
      goto LABEL_23;
    }
  }
  if (([v11 modeOfOperation] & 2) != 0)
  {
    if (v14)
    {
      id v27 = 0;
      id v20 = [v14 isApplicationIdentifierEligibleForManagedMode:v13 error:&v27];
      id v21 = v27;
      if (v20)
      {
        unsigned __int8 v22 = [v20 BOOLValue];

        if (v22)
        {
          BOOL v15 = 1;
LABEL_34:

          goto LABEL_35;
        }
      }
      else
      {
        if (qword_10003B1C0 != -1) {
          dispatch_once(&qword_10003B1C0, &stru_100034AE0);
        }
        unsigned int v24 = qword_10003B1B8;
        if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v11;
          __int16 v30 = 2112;
          id v31 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to check if the MDM profile allows direct connections for %@: %@", buf, 0x16u);
        }
      }
      if (qword_10003B1C0 != -1) {
        dispatch_once(&qword_10003B1C0, &stru_100034AE0);
      }
      id v25 = qword_10003B1B8;
      if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Skipping domain %@ because the MDM profile does not allow directly connecting to it", buf, 0xCu);
      }
      BOOL v15 = 0;
      goto LABEL_34;
    }
    if (qword_10003B1C0 != -1) {
      dispatch_once(&qword_10003B1C0, &stru_100034AE0);
    }
    uint64_t v23 = qword_10003B1B8;
    if (!os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG))
    {
LABEL_24:
      BOOL v15 = 0;
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    id v29 = v11;
    BOOL v17 = "Skipping domain %@ because no MDM profile is active";
    goto LABEL_22;
  }
  BOOL v15 = 1;
LABEL_35:

  return v15;
}

+ (id)_deduplicateServicesByMode:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v3 count]];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E660;
  v9[3] = &unk_1000349E0;
  id v6 = v4;
  id v10 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = [v6 copy];

  return v7;
}

+ (id)_associatedDomainsFromEntitlementForBundleRecord:(id)a3 applicationIdentifier:(id)a4 developerModeEnabled:(BOOL)a5 enterpriseContext:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v34 = a4;
  id v11 = a6;
  id v35 = v10;
  id v13 = [v10 entitlements];
  uint64_t v14 = objc_opt_class();
  BOOL v15 = [v13 objectForKey:@"com.apple.developer.associated-domains" ofClass:v14 valuesOfClass:objc_opt_class()];

  if (!v15
    || (+[_SWCServiceSpecifier serviceSpecifiersWithEntitlementValue:error:](_SWCServiceSpecifier, "serviceSpecifiersWithEntitlementValue:error:", v15, 0, context), uint64_t v16 = objc_claimAutoreleasedReturnValue(), v15, (v32 = (void *)v16) == 0))
  {
    if (objc_opt_respondsToSelector())
    {
      unsigned int v17 = [v35 isSystemPlaceholder];
      int v18 = &__NSArray0__struct;
      if (!v17) {
        int v18 = 0;
      }
      v32 = v18;
    }
    else
    {
      v32 = 0;
    }
  }
  if (v32)
  {
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v32;
    id v20 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v39;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unsigned int v24 = [v23 SWCDomain:context];
          if ([a1 _shouldIncludeServiceWithDomain:v24 fromBundleRecord:v35 applicationIdentifier:v34 developerModeEnabled:v7 enterpriseContext:v11])
          {
            id v25 = [v23 serviceType];
            id v26 = [v19 objectForKeyedSubscript:v25];
            if (!v26)
            {
              id v26 = objc_alloc_init((Class)NSMutableSet);
              [v19 setObject:v26 forKeyedSubscript:v25];
            }
            [v26 addObject:v24];
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v20);
    }

    id v27 = [a1 _deduplicateServicesByMode:v19];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000EEA8;
    v36[3] = &unk_1000349E0;
    id v28 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v27 count]];
    id v37 = v28;
    [v27 enumerateKeysAndObjectsUsingBlock:v36];
    id v29 = [v28 copy];
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

+ (id)_enterpriseEntriesWithContext:(id)a3 forBundleRecord:(id)a4 applicationIdentifier:(id)a5
{
  id v7 = a3;
  id v33 = a4;
  id v8 = a5;
  id v38 = 0;
  id v31 = v7;
  uint64_t v9 = [v7 serviceSpecifiersForApplicationIdentifier:v8 error:&v38];
  id v32 = v38;
  if (!v9)
  {
    if (qword_10003B1C0 != -1) {
      dispatch_once(&qword_10003B1C0, &stru_100034AE0);
    }
    id v26 = qword_10003B1B8;
    if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v33;
      __int16 v42 = 2112;
      id v43 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to get enterprise-supplied service specifiers for bundle record %@: %@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  if (![v9 count])
  {
    if (qword_10003B1C0 != -1) {
      dispatch_once(&qword_10003B1C0, &stru_100034AE0);
    }
    id v27 = qword_10003B1B8;
    if (!os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v33;
    id v28 = "No enterprise-supplied services for bundle record %@";
    goto LABEL_36;
  }
  id v10 = [v33 entitlements];
  id v11 = [v10 objectForKey:@"com.apple.developer.associated-domains.mdm-managed" ofClass:objc_opt_class()];
  unsigned int v12 = [v11 isEqual:&__kCFBooleanTrue];

  if (!v12)
  {
    if (qword_10003B1C0 != -1) {
      dispatch_once(&qword_10003B1C0, &stru_100034AE0);
    }
    id v27 = qword_10003B1B8;
    if (!os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v33;
    id v28 = "Bundle record %@ does not want enterprise-supplied entries; skipping lookup";
LABEL_36:
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, v28, buf, 0xCu);
LABEL_31:
    id v15 = 0;
    goto LABEL_32;
  }
  if (qword_10003B1C0 != -1) {
    dispatch_once(&qword_10003B1C0, &stru_100034AE0);
  }
  id v13 = (id)qword_10003B1B8;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v30 = [v9 count];
    *(_DWORD *)buf = 134218242;
    id v41 = v30;
    __int16 v42 = 2112;
    id v43 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%llu enterprise-supplied services for bundle record %@", buf, 0x16u);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = v9;
  id v15 = 0;
  id v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v35;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v20 = [SWCEntry alloc];
        uint64_t v21 = [v19 serviceType];
        unsigned __int8 v22 = [v19 SWCDomain];
        uint64_t v23 = [(SWCEntry *)v20 initWithApplicationIdentifier:v8 service:v21 domain:v22];

        if (v23)
        {
          unsigned int v24 = v23;
          id v25 = [(SWCEntry *)v24 fields];
          *(_WORD *)v25 |= 0x100u;
          if (!v15) {
            id v15 = objc_alloc_init((Class)NSMutableOrderedSet);
          }
          [v15 addObject:v24];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v16);
  }

LABEL_32:

  return v15;
}

+ (void)_enumerateJSONFilesForBundleRecord:(id)a3 applicationIdentifier:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 URL];
  if (v11)
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 1;
    int v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_10000F7D4;
    uint64_t v21 = &unk_100034A48;
    id v22 = v10;
    uint64_t v23 = &v24;
    unsigned int v12 = objc_retainBlock(&v18);
    [a1 enumerateJSONResourceURLsForBundleURL:v11 block:v12, v18, v19, v20, v21];
    id v13 = [v8 entitlements];
    id v14 = [v13 objectForKey:@"com.apple.private.swc.additional-service-details-consumer" ofClass:objc_opt_class()];
    unsigned __int8 v15 = [v14 isEqual:&__kCFBooleanTrue];

    char v16 = v15 ^ 1;
    if (!v9) {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [a1 additionalServiceDetailsDirectoryURLForApplicationIdentifier:v9 createParentIfNeeded:0 error:0];
      if ([v17 checkResourceIsReachableAndReturnError:0])
      {
        *((unsigned char *)v25 + 24) = 3;
        [a1 enumerateJSONResourceURLsForDirectoryAtURL:v17 block:v12];
      }
    }
    _Block_object_dispose(&v24, 8);
  }
}

+ (id)_entriesFromBuiltInJSONForBundleRecord:(id)a3 applicationIdentifier:(id)a4
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10000FCE8;
  uint64_t v26 = sub_10000FCF8;
  id v27 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000FD00;
  v18[3] = &unk_100034A70;
  id v20 = &v22;
  id v21 = a1;
  id v5 = a4;
  id v19 = v5;
  [v21 _enumerateJSONFilesForBundleRecord:a3 applicationIdentifier:v5 block:v18];
  if (v23[5])
  {
    id v6 = +[NSDate distantFuture];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = (id)v23[5];
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) setLastCheckedDate:v6 (void)v14];
        }
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v28 count:16];
      }
      while (v8);
    }

    id v11 = (void *)v23[5];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = [v11 copy:v14];

  _Block_object_dispose(&v22, 8);

  return v12;
}

+ (void)_addEntryToOrderedSet:(id)a3 forUniversalLinksFromSingleDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v31 = a7;
  id v33 = [v12 objectForKeyedSubscript:@"appIDs"];
  id v32 = [v12 objectForKeyedSubscript:@"appID"];
  id v29 = [v12 objectForKeyedSubscript:@"relativeOrder"];
  LOBYTE(a7) = _SWCEnabledConfigurationGetFromDetails();
  long long v15 = +[_SWCPatternList patternListWithDetailsDictionary:v12 defaults:v31];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000103E4;
  v38[3] = &unk_100034A98;
  id v16 = v13;
  id v39 = v16;
  id v30 = v15;
  id v40 = v30;
  id v17 = v14;
  id v41 = v17;
  char v44 = (char)a7;
  id v18 = v29;
  id v42 = v18;
  id v19 = v11;
  id v43 = v19;
  id v20 = objc_retainBlock(v38);
  if (v33 && _NSIsNSArray())
  {
    if (qword_10003B1C0 != -1) {
      dispatch_once(&qword_10003B1C0, &stru_100034AE0);
    }
    id v21 = (id)qword_10003B1B8;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v33 count];
      *(_DWORD *)buf = 134218242;
      id v47 = v22;
      __int16 v48 = 2112;
      CFStringRef v49 = v33;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "JSON entry had %llu appIDs: %@", buf, 0x16u);
    }

    id v28 = v16;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v33;
    id v24 = [v23 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v23);
          }
          ((void (*)(void *, void))v20[2])(v20, *(void *)(*((void *)&v34 + 1) + 8 * i));
        }
        id v24 = [v23 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v24);
    }

    id v16 = v28;
  }
  else
  {
    if (qword_10003B1C0 != -1) {
      dispatch_once(&qword_10003B1C0, &stru_100034AE0);
    }
    id v27 = qword_10003B1B8;
    if (os_log_type_enabled((os_log_t)qword_10003B1B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v32;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "JSON entry had one appID: %@", buf, 0xCu);
    }
    ((void (*)(void *, void *))v20[2])(v20, v32);
  }
}

+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsArray:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8
{
  id v23 = a3;
  id v14 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v14;
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v26;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v26 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * v21);
      if (_NSIsNSDictionary())
      {
        [a1 _addEntryToOrderedSet:v23 forUniversalLinksFromSingleDetailsDictionary:v22 domain:v24 substitutionVariables:v15 defaults:v16];
        if (++v19 >= a8) {
          break;
        }
      }
      if (v18 == (id)++v21)
      {
        id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v18) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8
{
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000108B0;
  v18[3] = &unk_100034AC0;
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = v26;
  id v24 = a1;
  unint64_t v25 = a8;
  id v14 = v22;
  id v15 = v21;
  id v16 = v20;
  id v17 = v19;
  [a4 enumerateKeysAndObjectsUsingBlock:v18];

  _Block_object_dispose(v26, 8);
}

+ (void)_addEntriesToOrderedSet:(id)a3 forService:(id)a4 fromAppsArray:(id)a5 domain:(id)a6
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v15);
        if (_NSIsNSString())
        {
          id v17 = [objc_alloc((Class)_SWCApplicationIdentifier) initWithString:v16];
          id v18 = [[SWCEntry alloc] initWithApplicationIdentifier:v17 service:v9 domain:v11];
          [v19 addObject:v18];
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

@end