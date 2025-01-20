@interface PLBuildVersion
+ (id)currentBuildVersionString;
- (NSString)majorBuildLetterString;
- (NSString)minorBuildLetterString;
- (NSString)stringRepresentation;
- (PLBuildVersion)initWithString:(id)a3;
- (id)description;
- (int64_t)compareBuildVersion:(id)a3 withPrecision:(int64_t)a4;
- (int64_t)compareBuildVersionString:(id)a3 withPrecision:(int64_t)a4;
- (int64_t)majorBuildNumber;
- (int64_t)minorBuildNumber;
@end

@implementation PLBuildVersion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_majorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

- (NSString)minorBuildLetterString
{
  return self->_minorBuildLetterString;
}

- (int64_t)minorBuildNumber
{
  return self->_minorBuildNumber;
}

- (NSString)majorBuildLetterString
{
  return self->_majorBuildLetterString;
}

- (int64_t)majorBuildNumber
{
  return self->_majorBuildNumber;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%@] = %ld %@ %ld, %@", self->_stringRepresentation, self->_majorBuildNumber, self->_majorBuildLetterString, self->_minorBuildNumber, self->_minorBuildLetterString];
}

- (int64_t)compareBuildVersionString:(id)a3 withPrecision:(int64_t)a4
{
  id v6 = a3;
  v7 = [[PLBuildVersion alloc] initWithString:v6];

  if (v7) {
    int64_t v8 = [(PLBuildVersion *)self compareBuildVersion:v7 withPrecision:a4];
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)compareBuildVersion:(id)a3 withPrecision:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLHelper.m", 2127, @"Invalid parameter not satisfying: %@", @"otherBuildVersion" object file lineNumber description];
  }
  int64_t v8 = [(PLBuildVersion *)self majorBuildNumber];
  uint64_t v9 = [v7 majorBuildNumber];
  if (v8 < v9) {
    int64_t v10 = -1;
  }
  else {
    int64_t v10 = v8 > v9;
  }
  if (!v10)
  {
    if ((unint64_t)(a4 - 1) > 1) {
      goto LABEL_18;
    }
    v11 = [(PLBuildVersion *)self majorBuildLetterString];
    v12 = [v7 majorBuildLetterString];
    int64_t v10 = [v11 caseInsensitiveCompare:v12];

    if (a4 == 2 && !v10)
    {
      int64_t v13 = [(PLBuildVersion *)self minorBuildNumber];
      uint64_t v14 = [v7 minorBuildNumber];
      int64_t v10 = v13 < v14 ? -1 : v13 > v14;
      if (!v10)
      {
        v15 = [(PLBuildVersion *)self minorBuildLetterString];
        if (v15)
        {

LABEL_17:
          v17 = [(PLBuildVersion *)self minorBuildLetterString];
          v18 = [v7 minorBuildLetterString];
          int64_t v10 = [v17 caseInsensitiveCompare:v18];

          goto LABEL_19;
        }
        v16 = [v7 minorBuildLetterString];

        if (v16) {
          goto LABEL_17;
        }
LABEL_18:
        int64_t v10 = 0;
      }
    }
  }
LABEL_19:

  return v10;
}

- (PLBuildVersion)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];
  uint64_t v8 = v7;

  if ([v4 length])
  {
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 == 1)
    {
      v30.receiver = self;
      v30.super_class = (Class)PLBuildVersion;
      self = [(PLBuildVersion *)&v30 init];
      if (self)
      {
        int64_t v10 = (NSString *)[v4 copy];
        stringRepresentation = self->_stringRepresentation;
        self->_stringRepresentation = v10;

        v12 = [v4 substringToIndex:v6];
        self->_majorBuildNumber = [v12 integerValue];

        int64_t v13 = objc_msgSend(v4, "substringWithRange:", v6, v8);
        uint64_t v14 = (NSString *)[v13 copy];
        majorBuildLetterString = self->_majorBuildLetterString;
        self->_majorBuildLetterString = v14;

        uint64_t v16 = v6 + 1;
        v17 = [v4 substringFromIndex:v6 + 1];
        v18 = [MEMORY[0x1E4F28B88] letterCharacterSet];
        uint64_t v19 = [v17 rangeOfCharacterFromSet:v18];
        uint64_t v21 = v20;

        if (v19 == 0x7FFFFFFFFFFFFFFFLL || v21 != 1)
        {
          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = (NSString *)[&stru_1EEBF74F0 copy];
            minorBuildLetterString = self->_minorBuildLetterString;
            self->_minorBuildLetterString = v26;

            v25 = [v4 substringFromIndex:v16];
            goto LABEL_14;
          }
        }
        else if (v19 == [v17 length] - 1)
        {
          v22 = objc_msgSend(v17, "substringWithRange:", v19, 1);
          v23 = (NSString *)[v22 copy];
          v24 = self->_minorBuildLetterString;
          self->_minorBuildLetterString = v23;

          v25 = [v17 substringToIndex:v19];
LABEL_14:
          v28 = v25;
          self->_minorBuildNumber = [(PLBuildVersion *)v25 integerValue];
LABEL_16:

          goto LABEL_17;
        }
        v28 = self;
        self = 0;
        goto LABEL_16;
      }
    }
  }
LABEL_17:

  return self;
}

+ (id)currentBuildVersionString
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  id v4 = (void *)[v3 copy];

  return v4;
}

@end