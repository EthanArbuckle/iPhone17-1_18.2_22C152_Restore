@interface OADOle
+ (BOOL)isCLSIDSupported:(id)a3;
+ (BOOL)isProgIDChart:(id)a3;
+ (BOOL)isProgIDMathType:(id)a3;
- (BOOL)iconic;
- (OADOle)init;
- (id)CLSID;
- (id)ansiClipboardFormatName;
- (id)ansiProgID;
- (id)ansiUserType;
- (id)description;
- (id)macClipboardFormat;
- (id)object;
- (id)unicodeClipboardFormatName;
- (id)unicodeProgID;
- (id)unicodeUserType;
- (unsigned)winClipboardFormat;
- (void)setAnsiClipboardFormatName:(id)a3;
- (void)setAnsiProgID:(id)a3;
- (void)setAnsiUserType:(id)a3;
- (void)setCLSID:(id)a3;
- (void)setIconic:(BOOL)a3;
- (void)setMacClipboardFormat:(id)a3;
- (void)setObject:(id)a3;
- (void)setUnicodeClipboardFormatName:(id)a3;
- (void)setUnicodeProgID:(id)a3;
- (void)setUnicodeUserType:(id)a3;
- (void)setWinClipboardFormat:(unsigned int)a3;
@end

@implementation OADOle

- (OADOle)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADOle;
  result = [(OADOle *)&v3 init];
  if (result) {
    result->mWinClipboardFormat = 0;
  }
  return result;
}

- (void)setCLSID:(id)a3
{
}

- (id)CLSID
{
  return self->mCLSID;
}

- (void)setAnsiUserType:(id)a3
{
}

- (void)setAnsiClipboardFormatName:(id)a3
{
}

- (void)setAnsiProgID:(id)a3
{
}

- (void)setUnicodeUserType:(id)a3
{
}

- (void)setUnicodeClipboardFormatName:(id)a3
{
}

- (void)setUnicodeProgID:(id)a3
{
}

- (void)setObject:(id)a3
{
}

- (void)setMacClipboardFormat:(id)a3
{
}

- (void)setIconic:(BOOL)a3
{
  self->mIconic = a3;
}

- (BOOL)iconic
{
  return self->mIconic;
}

- (id)ansiUserType
{
  return self->mAnsiUserType;
}

- (id)ansiClipboardFormatName
{
  return self->mAnsiClipboardFormatName;
}

- (unsigned)winClipboardFormat
{
  return self->mWinClipboardFormat;
}

- (void)setWinClipboardFormat:(unsigned int)a3
{
  self->mWinClipboardFormat = a3;
}

- (id)macClipboardFormat
{
  return self->mMacClipboardFormat;
}

- (id)ansiProgID
{
  return self->mAnsiProgID;
}

- (id)unicodeUserType
{
  return self->mUnicodeUserType;
}

- (id)unicodeClipboardFormatName
{
  return self->mUnicodeClipboardFormatName;
}

- (id)unicodeProgID
{
  return self->mUnicodeProgID;
}

- (id)object
{
  return self->mObject;
}

+ (BOOL)isProgIDChart:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"MSGraph.Chart."] & 1) != 0
    || ([v3 hasPrefix:@"Excel.Sheet."] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 hasPrefix:@"Excel.Chart."];
  }

  return v4;
}

+ (BOOL)isProgIDMathType:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"Equation.DSMT4"] & 1) != 0
    || ([v3 hasPrefix:@"Equation.DSMT36"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 hasPrefix:@"Equation"];
  }

  return v4;
}

+ (BOOL)isCLSIDSupported:(id)a3
{
  id v3 = a3;
  char v4 = (void *)+[OADOle isCLSIDSupported:]::classIdSet;
  if (!+[OADOle isCLSIDSupported:]::classIdSet)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"00020820-0000-0000-C000-000000000046", @"00020803-0000-0000-C000-000000000046", @"00020821-0000-0000-C000-000000000046", @"00020801-0000-0000-C000-000000000046", 0);
    v6 = (void *)+[OADOle isCLSIDSupported:]::classIdSet;
    +[OADOle isCLSIDSupported:]::classIdSet = v5;

    char v4 = (void *)+[OADOle isCLSIDSupported:]::classIdSet;
  }
  char v7 = [v4 containsObject:v3];

  return v7;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADOle;
  v2 = [(OADOle *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mObject, 0);
  objc_storeStrong((id *)&self->mUnicodeProgID, 0);
  objc_storeStrong((id *)&self->mUnicodeClipboardFormatName, 0);
  objc_storeStrong((id *)&self->mUnicodeUserType, 0);
  objc_storeStrong((id *)&self->mAnsiProgID, 0);
  objc_storeStrong((id *)&self->mMacClipboardFormat, 0);
  objc_storeStrong((id *)&self->mAnsiClipboardFormatName, 0);
  objc_storeStrong((id *)&self->mAnsiUserType, 0);
  objc_storeStrong((id *)&self->mCLSID, 0);
}

@end