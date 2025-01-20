@interface THBookVersion
+ (THBookVersion)bookVersionWithVersionString:(id)a3;
+ (id)newUnversionedBookVersion;
+ (id)unversionedBookVersion;
- (BOOL)isEqualToBookVersion:(id)a3;
- (BOOL)isStrictlyNewerThanBookVersion:(id)a3;
- (BOOL)isUnversioned;
- (BOOL)isValid;
- (BOOL)p_componentIsValid:(id)a3;
- (NSString)versionString;
- (THBookVersion)initWithString:(id)a3;
- (id)description;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)subMinorVersion;
- (void)dealloc;
- (void)p_parseString;
- (void)setIsUnversioned:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setMajorVersion:(unint64_t)a3;
- (void)setMinorVersion:(unint64_t)a3;
- (void)setSubMinorVersion:(unint64_t)a3;
- (void)setVersionString:(id)a3;
@end

@implementation THBookVersion

+ (THBookVersion)bookVersionWithVersionString:(id)a3
{
  v3 = [[THBookVersion alloc] initWithString:a3];

  return v3;
}

+ (id)newUnversionedBookVersion
{
  v2 = [THBookVersion alloc];

  return [(THBookVersion *)v2 initWithString:&stru_46D7E8];
}

+ (id)unversionedBookVersion
{
  id result = (id)qword_5732D8;
  if (!qword_5732D8)
  {
    id result = +[THBookVersion newUnversionedBookVersion];
    qword_5732D8 = (uint64_t)result;
  }
  return result;
}

- (THBookVersion)initWithString:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)THBookVersion;
  v4 = [(THBookVersion *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3) {
      CFStringRef v6 = (const __CFString *)a3;
    }
    else {
      CFStringRef v6 = &stru_46D7E8;
    }
    [(THBookVersion *)v4 setVersionString:v6];
    [(THBookVersion *)v5 p_parseString];
  }
  return v5;
}

- (void)dealloc
{
  [(THBookVersion *)self setVersionString:0];
  v3.receiver = self;
  v3.super_class = (Class)THBookVersion;
  [(THBookVersion *)&v3 dealloc];
}

- (void)p_parseString
{
  if (![(THBookVersion *)self versionString]) {
    goto LABEL_14;
  }
  if ([(NSString *)[(THBookVersion *)self versionString] isEqualToString:&stru_46D7E8])
  {
    [(THBookVersion *)self setMajorVersion:0];
    [(THBookVersion *)self setMinorVersion:0];
    [(THBookVersion *)self setSubMinorVersion:0];
    BOOL v3 = 1;
    [(THBookVersion *)self setIsUnversioned:1];
    goto LABEL_15;
  }
  v4 = [(NSString *)[(THBookVersion *)self versionString] componentsSeparatedByString:@"."];
  NSUInteger v5 = [(NSArray *)v4 count];
  if (v5 >= 4)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookVersion p_parseString]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THBookVersion.m") lineNumber:93 description:@"Error, version string %@ contains too many dot-separated components" -[THBookVersion versionString](self, "versionString")];
LABEL_14:
    BOOL v3 = 0;
    goto LABEL_15;
  }
  unint64_t v6 = v5;
  if (!v5)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THBookVersion p_parseString]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THBookVersion.m"] lineNumber:98 description:@"Error, version string %@ contains zero dot-separated components" -[THBookVersion versionString];
    goto LABEL_14;
  }
  -[THBookVersion setMajorVersion:[v4 objectAtIndex:0].integerValue];
  BOOL v3 = [(THBookVersion *)self p_componentIsValid:[(NSArray *)v4 objectAtIndex:0]];
  if (v6 != 1)
  {
    -[THBookVersion setMinorVersion:[v4 objectAtIndex:1].integerValue];
    if (v3) {
      BOOL v3 = [(THBookVersion *)self p_componentIsValid:[(NSArray *)v4 objectAtIndex:1]];
    }
    if (v6 >= 3)
    {
      -[THBookVersion setSubMinorVersion:[v4 objectAtIndex:2] integerValue]];
      if (v3) {
        BOOL v3 = [(THBookVersion *)self p_componentIsValid:[(NSArray *)v4 objectAtIndex:2]];
      }
    }
  }
LABEL_15:

  [(THBookVersion *)self setIsValid:v3];
}

- (BOOL)p_componentIsValid:(id)a3
{
  if (![a3 length] || ((unint64_t)objc_msgSend(a3, "integerValue") & 0x8000000000000000) != 0) {
    return 0;
  }
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [a3 integerValue]);

  return [a3 isEqualToString:v4];
}

- (id)description
{
  if ([(NSString *)[(THBookVersion *)self versionString] isEqualToString:&stru_46D7E8])
  {
    return @"(unversioned)";
  }

  return [(THBookVersion *)self versionString];
}

- (BOOL)isStrictlyNewerThanBookVersion:(id)a3
{
  if (-[THBookVersion isValid](self, "isValid") && [a3 isValid])
  {
    if (![a3 isUnversioned] || -[THBookVersion isUnversioned](self, "isUnversioned"))
    {
      if ([(THBookVersion *)self isUnversioned])
      {
LABEL_6:
        LOBYTE(v5) = 0;
        return v5;
      }
      unint64_t v6 = [(THBookVersion *)self majorVersion];
      if (v6 <= (unint64_t)[a3 majorVersion])
      {
        id v7 = [(THBookVersion *)self majorVersion];
        if (v7 != [a3 majorVersion]) {
          goto LABEL_6;
        }
        unint64_t v8 = [(THBookVersion *)self minorVersion];
        if (v8 <= (unint64_t)[a3 minorVersion])
        {
          id v9 = [(THBookVersion *)self minorVersion];
          if (v9 == [a3 minorVersion])
          {
            unint64_t v10 = [(THBookVersion *)self subMinorVersion];
            LOBYTE(v5) = v10 > (unint64_t)[a3 subMinorVersion];
            return v5;
          }
          goto LABEL_6;
        }
      }
    }
    LOBYTE(v5) = 1;
    return v5;
  }
  unsigned int v5 = [(THBookVersion *)self isValid];
  if (v5) {
    LOBYTE(v5) = [a3 isValid] ^ 1;
  }
  return v5;
}

- (BOOL)isEqualToBookVersion:(id)a3
{
  unsigned int v5 = [(THBookVersion *)self isValid];
  if (v5 != [a3 isValid]) {
    return 0;
  }
  unsigned int v6 = [(THBookVersion *)self isUnversioned];
  if (v6 != [a3 isUnversioned]) {
    return 0;
  }
  id v7 = [(THBookVersion *)self majorVersion];
  if (v7 != [a3 majorVersion]) {
    return 0;
  }
  id v8 = [(THBookVersion *)self minorVersion];
  if (v8 != [a3 minorVersion]) {
    return 0;
  }
  id v9 = [(THBookVersion *)self subMinorVersion];
  if (v9 != [a3 subMinorVersion]) {
    return 0;
  }
  unint64_t v10 = [(THBookVersion *)self versionString];
  id v11 = [a3 versionString];

  return [(NSString *)v10 isEqualToString:v11];
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(unint64_t)a3
{
  self->_majorVersion = a3;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(unint64_t)a3
{
  self->_minorVersion = a3;
}

- (unint64_t)subMinorVersion
{
  return self->_subMinorVersion;
}

- (void)setSubMinorVersion:(unint64_t)a3
{
  self->_subMinorVersion = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isUnversioned
{
  return self->_isUnversioned;
}

- (void)setIsUnversioned:(BOOL)a3
{
  self->_isUnversioned = a3;
}

@end