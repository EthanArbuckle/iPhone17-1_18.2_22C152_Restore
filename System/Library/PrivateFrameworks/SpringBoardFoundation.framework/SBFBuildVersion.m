@interface SBFBuildVersion
- (BOOL)isEqual:(id)a3;
- (NSString)majorBuildLetterString;
- (NSString)minorBuildLetterString;
- (NSString)stringRepresentation;
- (SBFBuildVersion)initWithString:(id)a3;
- (id)description;
- (int64_t)compareBuildVersion:(id)a3 withPrecision:(int64_t)a4;
- (int64_t)compareBuildVersionString:(id)a3 withPrecision:(int64_t)a4;
- (int64_t)majorBuildNumber;
- (int64_t)minorBuildNumber;
- (unint64_t)hash;
@end

@implementation SBFBuildVersion

- (SBFBuildVersion)initWithString:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SBFBuildVersion;
  v5 = [(SBFBuildVersion *)&v33 init];
  if (v5)
  {
    v6 = v5;
    v7 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    uint64_t v8 = [v4 rangeOfCharacterFromSet:v7];
    uint64_t v10 = v9;

    v11 = 0;
    if (![v4 length] || (v8 != 0x7FFFFFFFFFFFFFFFLL ? (BOOL v12 = v10 == 1) : (BOOL v12 = 0), !v12))
    {
      v20 = v6;
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v13 = [v4 copy];
    stringRepresentation = v6->_stringRepresentation;
    v6->_stringRepresentation = (NSString *)v13;

    v15 = [v4 substringToIndex:v8];
    v6->_majorBuildNumber = [v15 integerValue];

    v16 = objc_msgSend(v4, "substringWithRange:", v8, v10);
    uint64_t v17 = [v16 copy];
    majorBuildLetterString = v6->_majorBuildLetterString;
    v6->_majorBuildLetterString = (NSString *)v17;

    uint64_t v19 = v8 + 1;
    v20 = [v4 substringFromIndex:v8 + 1];
    v21 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    uint64_t v22 = [v20 rangeOfCharacterFromSet:v21];
    uint64_t v24 = v23;

    if (v22 == 0x7FFFFFFFFFFFFFFFLL || v24 != 1)
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v29 = [&stru_1ED879EF8 copy];
        minorBuildLetterString = v6->_minorBuildLetterString;
        v6->_minorBuildLetterString = (NSString *)v29;

        v28 = [v4 substringFromIndex:v19];
        goto LABEL_16;
      }
    }
    else if (v22 == [v20 length] - 1)
    {
      v25 = objc_msgSend(v20, "substringWithRange:", v22, 1);
      uint64_t v26 = [v25 copy];
      v27 = v6->_minorBuildLetterString;
      v6->_minorBuildLetterString = (NSString *)v26;

      v28 = [v20 substringToIndex:v22];
LABEL_16:
      v31 = v28;
      v6->_minorBuildNumber = [(SBFBuildVersion *)v28 integerValue];
LABEL_18:

      v11 = v6;
      goto LABEL_19;
    }
    v31 = v6;
    v6 = 0;
    goto LABEL_18;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBFBuildVersion *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t majorBuildNumber = self->_majorBuildNumber;
      if (majorBuildNumber == [(SBFBuildVersion *)v5 majorBuildNumber])
      {
        majorBuildLetterString = self->_majorBuildLetterString;
        uint64_t v8 = [(SBFBuildVersion *)v5 majorBuildLetterString];
        if ([(NSString *)majorBuildLetterString isEqualToString:v8])
        {
          minorBuildLetterString = self->_minorBuildLetterString;
          uint64_t v10 = [(SBFBuildVersion *)v5 minorBuildLetterString];
          if ([(NSString *)minorBuildLetterString isEqualToString:v10])
          {
            int64_t minorBuildNumber = self->_minorBuildNumber;
            BOOL v12 = minorBuildNumber == [(SBFBuildVersion *)v5 minorBuildNumber];
          }
          else
          {
            BOOL v12 = 0;
          }
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_stringRepresentation];
  id v5 = (id)[v3 appendInteger:self->_majorBuildNumber];
  id v6 = (id)[v3 appendObject:self->_majorBuildLetterString];
  id v7 = (id)[v3 appendInteger:self->_minorBuildNumber];
  id v8 = (id)[v3 appendObject:self->_minorBuildLetterString];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (int64_t)compareBuildVersion:(id)a3 withPrecision:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBFUtilities.m", 257, @"Invalid parameter not satisfying: %@", @"otherBuildVersion" object file lineNumber description];
  }
  int64_t v8 = [(SBFBuildVersion *)self majorBuildNumber];
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
    v11 = [(SBFBuildVersion *)self majorBuildLetterString];
    BOOL v12 = [v7 majorBuildLetterString];
    int64_t v10 = [v11 caseInsensitiveCompare:v12];

    if (a4 == 2 && !v10)
    {
      int64_t v13 = [(SBFBuildVersion *)self minorBuildNumber];
      uint64_t v14 = [v7 minorBuildNumber];
      int64_t v10 = v13 < v14 ? -1 : v13 > v14;
      if (!v10)
      {
        v15 = [(SBFBuildVersion *)self minorBuildLetterString];
        if (v15)
        {

LABEL_17:
          uint64_t v17 = [(SBFBuildVersion *)self minorBuildLetterString];
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

- (int64_t)compareBuildVersionString:(id)a3 withPrecision:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[SBFBuildVersion alloc] initWithString:v6];

  if (v7) {
    int64_t v8 = [(SBFBuildVersion *)self compareBuildVersion:v7 withPrecision:a4];
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_stringRepresentation withName:0];
  id v4 = (id)[v3 appendInteger:self->_majorBuildNumber withName:@"majorNumber"];
  [v3 appendString:self->_majorBuildLetterString withName:@"majorLetter"];
  id v5 = (id)[v3 appendInteger:self->_minorBuildNumber withName:@"minorNumber"];
  [v3 appendString:self->_minorBuildLetterString withName:@"minorLetter" skipIfEmpty:1];
  id v6 = [v3 build];

  return v6;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (int64_t)majorBuildNumber
{
  return self->_majorBuildNumber;
}

- (NSString)majorBuildLetterString
{
  return self->_majorBuildLetterString;
}

- (int64_t)minorBuildNumber
{
  return self->_minorBuildNumber;
}

- (NSString)minorBuildLetterString
{
  return self->_minorBuildLetterString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_majorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

@end