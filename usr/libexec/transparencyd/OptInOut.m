@interface OptInOut
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)optIn;
- (IdsMutation)idsMutation;
- (OptInOut)init;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (unint64_t)parsedLength;
- (unint64_t)timestampMs;
- (void)setIdsMutation:(id)a3;
- (void)setOptIn:(BOOL)a3;
- (void)setParsedLength:(unint64_t)a3;
- (void)setTimestampMs:(unint64_t)a3;
@end

@implementation OptInOut

- (OptInOut)init
{
  v3.receiver = self;
  v3.super_class = (Class)OptInOut;
  return [(OptInOut *)&v3 init];
}

- (id)data
{
  objc_super v3 = +[NSMutableData data];
  if ([(TLSMessageClass *)self encodeBool:[(OptInOut *)self optIn] buffer:v3]
    && [(TLSMessageClass *)self encodeUint64:[(OptInOut *)self timestampMs] buffer:v3])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length] + (void)v8;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  unsigned __int8 v21 = 0;
  id v11 = [v10 parseBool:v6 end:v9 result:&v21];
  if (v11)
  {
    id v12 = v11;
    [v10 setOptIn:v21];
    uint64_t v20 = 0;
    v13 = [v10 parseUint64:v12 end:v9 result:&v20];
    if (v13)
    {
      v14 = v13;
      [v10 setTimestampMs:v20];
      [v10 setParsedLength:v14 - (unsigned char *)[objc_retainAutorelease(v7) bytes]];
      id v15 = v10;
      goto LABEL_10;
    }
    if (a4)
    {
      uint64_t v16 = kTransparencyErrorDecode;
      CFStringRef v17 = @"failed to parse timestampMs from OptInOut";
      uint64_t v18 = -275;
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    uint64_t v16 = kTransparencyErrorDecode;
    CFStringRef v17 = @"failed to parse optIn BOOLean from OptInOut";
    uint64_t v18 = -274;
LABEL_8:
    +[TransparencyError errorWithDomain:v16 code:v18 description:v17];
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v15 = 0;
LABEL_10:

  return v15;
}

- (id)debugDescription
{
  if ([(OptInOut *)self optIn]) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  return +[NSString stringWithFormat:@"{\t\toptIn:%@\n\t\ttimestampMs:%llu\n}", v3, [(OptInOut *)self timestampMs]];
}

- (id)description
{
  if ([(OptInOut *)self optIn]) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"optIn:%@; timestampMs:%llu",
           v3,
           [(OptInOut *)self timestampMs]);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (OptInOut *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(OptInOut *)self data];
      id v7 = [(OptInOut *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (IdsMutation)idsMutation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsMutation);

  return (IdsMutation *)WeakRetained;
}

- (void)setIdsMutation:(id)a3
{
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (unint64_t)timestampMs
{
  return self->_timestampMs;
}

- (void)setTimestampMs:(unint64_t)a3
{
  self->_timestampMs = a3;
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
}

- (id)diagnosticsJsonDictionary
{
  v10[0] = @"optIn";
  CFStringRef v3 = +[NSNumber numberWithBool:[(OptInOut *)self optIn]];
  v11[0] = v3;
  v10[1] = @"timestamp";
  id v4 = +[NSDate dateWithTimeIntervalSince1970:(double)([(OptInOut *)self timestampMs] / 0x3E8)];
  id v5 = [v4 kt_dateToString];
  v11[1] = v5;
  v10[2] = @"timestampReadable";
  id v6 = +[NSDate dateWithTimeIntervalSince1970:(double)([(OptInOut *)self timestampMs] / 0x3E8)];
  id v7 = [v6 kt_toISO_8601_UTCString];
  v11[2] = v7;
  unsigned __int8 v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

@end