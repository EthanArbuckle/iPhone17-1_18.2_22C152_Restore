@interface OptInOutWithExt
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)extensions;
- (OptInOutWithExt)init;
- (OptInOutWithExt)initWithMutation:(id)a3;
- (id)data;
- (id)debugDescription;
- (id)description;
- (void)setExtensions:(id)a3;
@end

@implementation OptInOutWithExt

- (OptInOutWithExt)initWithMutation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OptInOutWithExt;
  v5 = [(OptInOut *)&v8 init];
  if (v5)
  {
    -[OptInOut setOptIn:](v5, "setOptIn:", [v4 optIn]);
    -[OptInOut setTimestampMs:](v5, "setTimestampMs:", [v4 timestampMs]);
    v6 = [v4 extensions];
    [(OptInOutWithExt *)v5 setExtensions:v6];
  }
  return v5;
}

- (OptInOutWithExt)init
{
  v5.receiver = self;
  v5.super_class = (Class)OptInOutWithExt;
  v2 = [(OptInOut *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(OptInOutWithExt *)v2 setExtensions:v3];
  }
  return v2;
}

- (id)data
{
  v2 = self;
  v8.receiver = self;
  v8.super_class = (Class)OptInOutWithExt;
  v3 = [(OptInOut *)&v8 data];
  id v4 = [v3 mutableCopy];

  objc_super v5 = [(OptInOutWithExt *)v2 extensions];
  LODWORD(v2) = [(TLSMessageClass *)v2 encodeExtensions:v5 buffer:v4];

  if (v2) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___OptInOutWithExt;
  v7 = [super parseFromData:v6 error:a4];
  if (v7)
  {
    id v8 = v6;
    id v9 = [v8 bytes];
    v10 = (char *)[v7 parsedLength] + (void)v9;
    id v11 = v8;
    id v22 = 0;
    v12 = [v7 parseExtensions:v10 end:((char *)[v11 length] + [v11 bytes]) result:&v22];
    id v13 = v22;
    if (v12)
    {
      v14 = +[NSMutableArray arrayWithArray:v13];
      [v7 setExtensions:v14];

      v15 = [v11 bytes];
      [v7 setParsedLength:v12 - v15];
      id v16 = v7;
      goto LABEL_8;
    }
    uint64_t v17 = kTransparencyErrorDecode;
    CFStringRef v24 = @"data";
    v18 = [v11 kt_hexString];
    v25 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v20 = +[TransparencyError errorWithDomain:v17 code:-248 underlyingError:0 userinfo:v19 description:@"failed to parse extensions from OptInOut"];

    if (a4) {
      *a4 = v20;
    }
  }
  id v16 = 0;
LABEL_8:

  return v16;
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
  id v4 = (OptInOutWithExt *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      id v6 = [(OptInOutWithExt *)self data];
      v7 = [(OptInOutWithExt *)v5 data];

      unsigned __int8 v8 = [v6 isEqualToData:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end