@interface _SWCDomain
+ (BOOL)supportsSecureCoding;
+ (_SWCDomain)appleDomain;
+ (_SWCDomain)exampleDomain;
+ (_SWCDomain)new;
- (BOOL)encompassesDomain:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHostIPAddress;
- (BOOL)isValid;
- (BOOL)isWildcard;
- (NSNumber)port;
- (NSString)host;
- (NSString)rawValue;
- (NSString)topLevelDomainValue;
- (_SWCDomain)init;
- (_SWCDomain)initWithCoder:(id)a3;
- (_SWCDomain)initWithHost:(id)a3 port:(id)a4 wildcard:(BOOL)a5 modeOfOperation:(char)a6;
- (_SWCDomain)initWithString:(id)a3;
- (_SWCDomain)nonWildcardDomain;
- (_SWCDomain)wildcardDomain;
- (char)modeOfOperation;
- (id)debugDescription;
- (id)domainRequiringModeOfOperation:(char)a3;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SWCDomain

+ (_SWCDomain)new
{
}

- (_SWCDomain)init
{
}

- (_SWCDomain)initWithString:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1AD1157F0](self, a2);
  [@"https://" stringByAppendingString:a3];
  v33 = context = (void *)v4;
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v33];
  uint64_t v5 = [v37 host];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1F0342F60;
  }
  v8 = v7;

  v38 = v8;
  unsigned int v36 = [(__CFString *)v8 hasPrefix:@"*."];
  if (v36)
  {
    uint64_t v9 = [(__CFString *)v8 substringFromIndex:2];

    v38 = (void *)v9;
  }
  v34 = [v37 port];
  v10 = [v37 percentEncodedQueryItems];
  if (!v10) {
    goto LABEL_32;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v17 = [v16 name];
        uint64_t v18 = [v16 value];
        v19 = (void *)v18;
        if (v18) {
          v20 = (__CFString *)v18;
        }
        else {
          v20 = &stru_1F0342F60;
        }
        v21 = v20;

        [v11 setObject:v21 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v13);
  }

  if (v11)
  {
    v22 = [v11 objectForKeyedSubscript:@"mode"];
    v23 = [v22 componentsSeparatedByString:@"+"];

    if (v23)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v24 = v23;
      int v25 = 0;
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v40 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v39 + 1) + 8 * j);
            if ([v29 caseInsensitiveCompare:@"developer"])
            {
              if (![v29 caseInsensitiveCompare:@"managed"]) {
                v25 |= 2u;
              }
            }
            else
            {
              v25 |= 1u;
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v26);
      }
    }
    else
    {
      LOBYTE(v25) = 0;
    }
  }
  else
  {
LABEL_32:
    LOBYTE(v25) = 0;
  }

  v30 = [(_SWCDomain *)self initWithHost:v38 port:v34 wildcard:v36 modeOfOperation:(char)v25];

  return v30;
}

- (_SWCDomain)initWithHost:(id)a3 port:(id)a4 wildcard:(BOOL)a5 modeOfOperation:(char)a6
{
  id v10 = a3;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_SWCDomain;
  id v12 = [(_SWCDomain *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 lowercaseString];
    uint64_t v14 = [v13 copy];
    host = v12->_host;
    v12->_host = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    port = v12->_port;
    v12->_port = (NSNumber *)v16;

    v12->_wildcard = a5;
    v12->_modeOfOperation = a6;
  }

  return v12;
}

+ (_SWCDomain)appleDomain
{
  v2 = [[_SWCDomain alloc] initWithHost:@"apple.com" port:0 wildcard:1 modeOfOperation:0];
  return v2;
}

+ (_SWCDomain)exampleDomain
{
  v2 = [[_SWCDomain alloc] initWithHost:@"example.com" port:0 wildcard:1 modeOfOperation:0];
  return v2;
}

- (NSString)rawValue
{
  host = self->_host;
  if (self->_wildcard)
  {
    uint64_t v4 = [@"*." stringByAppendingString:host];
  }
  else
  {
    uint64_t v4 = host;
  }
  uint64_t v5 = v4;
  port = self->_port;
  if (port)
  {
    uint64_t v7 = objc_msgSend(v5, "stringByAppendingFormat:", @":%llu", -[NSNumber unsignedLongLongValue](port, "unsignedLongLongValue"));

    uint64_t v5 = (void *)v7;
  }
  if (self->_modeOfOperation)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = v8;
    char modeOfOperation = self->_modeOfOperation;
    if (modeOfOperation)
    {
      [v8 addObject:@"developer"];
      char modeOfOperation = self->_modeOfOperation;
    }
    if ((modeOfOperation & 2) != 0) {
      [v9 addObject:@"managed"];
    }
    id v11 = [v9 componentsJoinedByString:@"+"];
    uint64_t v12 = [v5 stringByAppendingFormat:@"?mode=%@", v11];

    uint64_t v5 = (void *)v12;
  }
  return (NSString *)v5;
}

- (BOOL)isValid
{
  v2 = self;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int modeOfOperation = self->_modeOfOperation;
  if (modeOfOperation == 1)
  {
    if ([(NSString *)self->_host isEqual:@"localhost"])
    {
      if (qword_1EB67B1D8 != -1) {
        dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
      }
      uint64_t v4 = qword_1EB67B1D0;
      if (os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v45 = v2;
        _os_log_impl(&dword_1ABCD7000, v4, OS_LOG_TYPE_INFO, "Domain %@ is localhost in developer mode, explicitly allowing.", buf, 0xCu);
      }
LABEL_70:
      port = v2->_port;
      if (!port || [(NSNumber *)port unsignedLongLongValue] - 0x10000 > 0xFFFFFFFFFFFF0000)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
      if (qword_1EB67B1D8 != -1) {
        dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
      }
      uint64_t v7 = (id)qword_1EB67B1D0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = [(NSNumber *)v2->_port unsignedLongLongValue];
        *(_DWORD *)buf = 138412546;
        long long v45 = v2;
        __int16 v46 = 2048;
        uint64_t v47 = v33;
        _os_log_impl(&dword_1ABCD7000, v7, OS_LOG_TYPE_INFO, "Domain %@ contained an invalid port %llu", buf, 0x16u);
      }
LABEL_21:

      goto LABEL_84;
    }
    int modeOfOperation = v2->_modeOfOperation;
  }
  if (!modeOfOperation && [(_SWCDomain *)v2 isHostIPAddress])
  {
    if (qword_1EB67B1D8 != -1) {
      dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
    }
    uint64_t v5 = qword_1EB67B1D0;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_INFO);
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      long long v45 = v2;
      _os_log_impl(&dword_1ABCD7000, v5, OS_LOG_TYPE_INFO, "Domain %@ is an IP address in normal mode, explicitly blocking.", buf, 0xCu);
      goto LABEL_84;
    }
    return v6;
  }
  uint64_t v7 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
  uint64_t v8 = [(NSString *)v2->_host length];
  uint64_t v9 = v8;
  uint64_t v10 = v8 - 1;
  if (v8 < 1)
  {
    if (qword_1EB67B1D8 != -1) {
      dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
    }
    uint64_t v13 = qword_1EB67B1D0;
    if (os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v45 = v2;
      _os_log_impl(&dword_1ABCD7000, v13, OS_LOG_TYPE_INFO, "Domain %@ contained empty hostname", buf, 0xCu);
    }
    goto LABEL_21;
  }
  CFStringRef host = (const __CFString *)v2->_host;
  CFStringRef v48 = host;
  uint64_t v51 = 0;
  int64_t v52 = v8;
  CharactersPtr = CFStringGetCharactersPtr(host);
  uint64_t v35 = v10;
  unsigned int v36 = v2;
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(host, 0x600u);
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  unsigned __int16 v16 = 0;
  int64_t v17 = 0;
  v50 = CStringPtr;
  uint64_t v18 = 64;
  int64_t v53 = 0;
  int64_t v54 = 0;
  do
  {
    if ((unint64_t)v17 >= 4) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = v17;
    }
    int64_t v20 = v52;
    if (v52 <= v17)
    {
      unsigned __int16 v21 = 0;
      unsigned __int16 v37 = 0;
LABEL_47:
      if (([v7 characterIsMember:v21] & 1) == 0)
      {
        if (qword_1EB67B1D8 != -1) {
          dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
        }
        v30 = (id)qword_1EB67B1D0;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)[[NSString alloc] initWithCharacters:&v37 length:1];
          *(_DWORD *)v38 = 138412802;
          long long v39 = v36;
          __int16 v40 = 2048;
          uint64_t v41 = v21;
          __int16 v42 = 2114;
          long long v43 = v31;
          _os_log_impl(&dword_1ABCD7000, v30, OS_LOG_TYPE_INFO, "Domain %@ contained illegal character %llx ('%{public}@')", v38, 0x20u);
        }
        goto LABEL_83;
      }
      goto LABEL_48;
    }
    if (CharactersPtr)
    {
      unsigned __int16 v21 = CharactersPtr[v17 + v51];
    }
    else if (v50)
    {
      unsigned __int16 v21 = v50[v51 + v17];
    }
    else
    {
      int64_t v22 = v53;
      if (v54 <= v17 || v53 > v17)
      {
        uint64_t v24 = v19 + v14;
        uint64_t v25 = v18 - v19;
        int64_t v26 = v17 - v19;
        int64_t v27 = v26 + 64;
        if (v26 + 64 >= v52) {
          int64_t v27 = v52;
        }
        int64_t v53 = v26;
        int64_t v54 = v27;
        if (v52 >= v25) {
          int64_t v20 = v25;
        }
        v56.length = v20 + v24;
        v56.location = v26 + v51;
        CFStringGetCharacters(v48, v56, (UniChar *)buf);
        int64_t v22 = v53;
      }
      unsigned __int16 v21 = *(_WORD *)&buf[2 * v17 + -2 * v22];
    }
    unsigned __int16 v37 = v21;
    if (v21 != 46) {
      goto LABEL_47;
    }
    if (!v17)
    {
      if (qword_1EB67B1D8 != -1) {
        dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
      }
      v28 = qword_1EB67B1D0;
      if (!os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_INFO)) {
        goto LABEL_83;
      }
      *(_DWORD *)v38 = 138412290;
      long long v39 = v36;
      v29 = "Domain %@ began with a period character";
      goto LABEL_82;
    }
    if (v16 == 46)
    {
      if (qword_1EB67B1D8 != -1) {
        dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
      }
      v28 = qword_1EB67B1D0;
      if (!os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_INFO)) {
        goto LABEL_83;
      }
      *(_DWORD *)v38 = 138412290;
      long long v39 = v36;
      v29 = "Domain %@ contained two period characters in a row";
      goto LABEL_82;
    }
    ++v15;
    unsigned __int16 v21 = 46;
LABEL_48:
    ++v17;
    --v14;
    ++v18;
    unsigned __int16 v16 = v21;
  }
  while (v9 != v17);
  if (v15 == 1)
  {
    v2 = v36;
    if ([(NSString *)v36->_host characterAtIndex:v35] != 46) {
      goto LABEL_69;
    }
    if (qword_1EB67B1D8 != -1) {
      dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
    }
    v28 = qword_1EB67B1D0;
    if (!os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_INFO)) {
      goto LABEL_83;
    }
    *(_DWORD *)v38 = 138412290;
    long long v39 = v36;
    v29 = "Domain %@ was a TLD";
LABEL_82:
    _os_log_impl(&dword_1ABCD7000, v28, OS_LOG_TYPE_INFO, v29, v38, 0xCu);
    goto LABEL_83;
  }
  v2 = v36;
  if (v15)
  {
LABEL_69:

    goto LABEL_70;
  }
  if (qword_1EB67B1D8 != -1) {
    dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
  }
  v28 = qword_1EB67B1D0;
  if (os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v38 = 138412290;
    long long v39 = v36;
    v29 = "Domain %@ did not contain a period character";
    goto LABEL_82;
  }
LABEL_83:

LABEL_84:
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)isHostIPAddress
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(NSString *)self->_host getCString:v5 maxLength:256 encoding:1];
  if (v2) {
    LOBYTE(v2) = v5[0] == 91 || inet_pton(2, v5, v4) == 1;
  }
  return v2;
}

- (NSString)topLevelDomainValue
{
  uint64_t v4 = [(NSString *)self->_host rangeOfString:@"." options:4];
  CFStringRef host = self->_host;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = host;
  }
  else
  {
    uint64_t v6 = [(NSString *)host substringFromIndex:v4 + v3];
  }
  return v6;
}

- (BOOL)encompassesDomain:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  if ([(_SWCDomain *)self isEqual:v4]) {
    goto LABEL_2;
  }
  CFStringRef host = self->_host;
  if (self->_wildcard)
  {
    unint64_t v8 = [(NSString *)host length];
    unint64_t v9 = [v4[2] length];
    unint64_t v10 = v9 - v8;
    if (v9 < v8
      || objc_msgSend(v4[2], "compare:options:range:", self->_host, 0, v10, v8)
      || v9 > v8 && [v4[2] characterAtIndex:v10 - 1] != 46)
    {
      goto LABEL_25;
    }
    if (qword_1EB67B1D8 != -1) {
      dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
    }
    id v11 = qword_1EB67B1D0;
    if (os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_DEBUG))
    {
LABEL_20:
      *(_DWORD *)uint64_t v14 = 138412546;
      *(void *)&v14[4] = self;
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = v4;
      _os_log_debug_impl(&dword_1ABCD7000, v11, OS_LOG_TYPE_DEBUG, "Domain %@ encompasses %@", v14, 0x16u);
    }
  }
  else
  {
    if (![(NSString *)host isEqualToString:v4[2]])
    {
LABEL_25:
      BOOL v6 = 0;
      goto LABEL_26;
    }
    if (qword_1EB67B1D8 != -1) {
      dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
    }
    id v11 = qword_1EB67B1D0;
    if (os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_20;
    }
  }
LABEL_2:
  port = self->_port;
  if (port && (!v4[3] || !-[NSNumber isEqualToNumber:](port, "isEqualToNumber:"))) {
    goto LABEL_25;
  }
  if ((objc_msgSend(v4, "isValid", *(_OWORD *)v14, *(void *)&v14[16], v15) & 1) == 0)
  {
    if (qword_1EB67B1D8 != -1) {
      dispatch_once(&qword_1EB67B1D8, &__block_literal_global_163);
    }
    uint64_t v12 = qword_1EB67B1D0;
    if (os_log_type_enabled((os_log_t)qword_1EB67B1D0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v14 = 138412546;
      *(void *)&v14[4] = v4;
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = self;
      _os_log_debug_impl(&dword_1ABCD7000, v12, OS_LOG_TYPE_DEBUG, "Domain %@ is not valid; discarding matching result against %@",
        v14,
        0x16u);
    }
    goto LABEL_25;
  }
  BOOL v6 = 1;
LABEL_26:

  return v6;
}

- (_SWCDomain)nonWildcardDomain
{
  if (self->_wildcard) {
    BOOL v2 = [[_SWCDomain alloc] initWithHost:self->_host port:self->_port wildcard:0 modeOfOperation:self->_modeOfOperation];
  }
  else {
    BOOL v2 = self;
  }
  return v2;
}

- (_SWCDomain)wildcardDomain
{
  if (self->_wildcard) {
    BOOL v2 = self;
  }
  else {
    BOOL v2 = [[_SWCDomain alloc] initWithHost:self->_host port:self->_port wildcard:1 modeOfOperation:self->_modeOfOperation];
  }
  return v2;
}

- (id)domainRequiringModeOfOperation:(char)a3
{
  if (self->_modeOfOperation == a3) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = [[_SWCDomain alloc] initWithHost:self->_host port:self->_port wildcard:self->_wildcard modeOfOperation:a3];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_host hash] ^ self->_wildcard;
  return v3 ^ [(NSNumber *)self->_port hash] ^ (2 * self->_modeOfOperation);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_SWCDomain *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if (self->_wildcard == v5->_wildcard && [(NSString *)self->_host isEqual:v5->_host])
      {
        port = self->_port;
        uint64_t v7 = v5->_port;
        if (port)
        {
          if (v7 && -[NSNumber isEqualToNumber:](port, "isEqualToNumber:")) {
            goto LABEL_8;
          }
        }
        else if (!v7)
        {
LABEL_8:
          BOOL v8 = self->_modeOfOperation == v5->_modeOfOperation;
LABEL_13:

          goto LABEL_14;
        }
      }
      BOOL v8 = 0;
      goto LABEL_13;
    }
    BOOL v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(_SWCDomain *)self description];
  BOOL v6 = (void *)[v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  if (qword_1EB67B1C8 != -1) {
    dispatch_once(&qword_1EB67B1C8, &__block_literal_global_8);
  }
  id v3 = (void *)MEMORY[0x1AD1157F0]();
  uint64_t v4 = [(NSString *)self->_host componentsSeparatedByString:@"."];
  unint64_t v5 = [v4 count];
  if (v5 < 2)
  {
    uint64_t v12 = self->_host;
  }
  else
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v7 = (void *)_MergedGlobals_7;
    BOOL v8 = [v4 objectAtIndexedSubscript:0];
    unint64_t v9 = [v7 member:v8];

    if (v9)
    {
      unint64_t v10 = [v4 objectAtIndexedSubscript:0];
      [v6 addObject:v10];

      unint64_t v11 = 1;
    }
    else
    {
      unint64_t v11 = 0;
    }
    unint64_t v13 = v5 - 1;
    if (v11 < v5 - 1)
    {
      do
      {
        uint64_t v14 = [v4 objectAtIndexedSubscript:v11];
        if ((unint64_t)[v14 length] >= 3)
        {
          uint64_t v15 = [v14 substringToIndex:2];
          uint64_t v16 = [v15 stringByAppendingString:@"…"];

          uint64_t v14 = (void *)v16;
        }
        [v6 addObject:v14];

        ++v11;
      }
      while (v13 != v11);
    }
    int64_t v17 = [v4 lastObject];
    [v6 addObject:v17];

    uint64_t v12 = [v6 componentsJoinedByString:@"."];
  }
  if (self->_wildcard)
  {
    uint64_t v18 = [@"*." stringByAppendingString:v12];
  }
  else
  {
    uint64_t v18 = v12;
  }
  uint64_t v19 = v18;
  port = self->_port;
  if (port)
  {
    uint64_t v21 = objc_msgSend(v19, "stringByAppendingFormat:", @":%llu", -[NSNumber unsignedLongLongValue](port, "unsignedLongLongValue"));

    uint64_t v19 = (void *)v21;
  }
  if (self->_modeOfOperation)
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v23 = v22;
    char modeOfOperation = self->_modeOfOperation;
    if (modeOfOperation)
    {
      [v22 addObject:@"developer"];
      char modeOfOperation = self->_modeOfOperation;
    }
    if ((modeOfOperation & 2) != 0) {
      [v23 addObject:@"managed"];
    }
    uint64_t v25 = [v23 componentsJoinedByString:@","];
    uint64_t v26 = [v19 stringByAppendingFormat:@"?mode=%@", v25];

    uint64_t v19 = (void *)v26;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_host forKey:@"host"];
  [v4 encodeObject:self->_port forKey:@"port"];
  [v4 encodeBool:self->_wildcard forKey:@"wildcard"];
  [v4 encodeInteger:self->_modeOfOperation forKey:@"modeOfOperation"];
}

- (_SWCDomain)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"host");
  BOOL v6 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"port");
  uint64_t v7 = [v4 decodeBoolForKey:@"wildcard"];
  char v8 = [v4 decodeIntegerForKey:@"modeOfOperation"];
  if (!v5)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    v15[0] = @"Line";
    v15[1] = @"Function";
    v16[0] = &unk_1F0345998;
    unint64_t v10 = [NSString stringWithUTF8String:"-[_SWCDomain initWithCoder:]"];
    v16[1] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v12 = (void *)[v9 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:v11];
    [v4 failWithError:v12];

    self = 0;
  }
  unint64_t v13 = [(_SWCDomain *)self initWithHost:v5 port:v6 wildcard:v7 modeOfOperation:v8];

  return v13;
}

- (NSString)host
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)port
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isWildcard
{
  return self->_wildcard;
}

- (char)modeOfOperation
{
  return self->_modeOfOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end