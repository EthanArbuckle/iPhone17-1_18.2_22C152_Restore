@interface TransparencyGPBAny
+ (TransparencyGPBAny)anyWithMessage:(id)a3 error:(id *)a4;
+ (TransparencyGPBAny)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
+ (id)descriptor;
- (BOOL)packWithMessage:(id)a3 error:(id *)a4;
- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
- (TransparencyGPBAny)initWithMessage:(id)a3 error:(id *)a4;
- (TransparencyGPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
- (id)unpackMessageClass:(Class)a3 error:(id *)a4;
@end

@implementation TransparencyGPBAny

+ (TransparencyGPBAny)anyWithMessage:(id)a3 error:(id *)a4
{
  return (TransparencyGPBAny *)_[a1 anyWithMessage:a3 typeURLPrefix:@"type.googleapis.com/" error:a4];
}

+ (TransparencyGPBAny)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  id v5 = [objc_alloc((Class)a1) initWithMessage:a3 typeURLPrefix:a4 error:a5];

  return (TransparencyGPBAny *)v5;
}

- (TransparencyGPBAny)initWithMessage:(id)a3 error:(id *)a4
{
  return [(TransparencyGPBAny *)self initWithMessage:a3 typeURLPrefix:@"type.googleapis.com/" error:a4];
}

- (TransparencyGPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  v8 = [(TransparencyGPBMessage *)self init];
  v9 = v8;
  if (v8
    && ![(TransparencyGPBAny *)v8 packWithMessage:a3 typeURLPrefix:a4 error:a5])
  {

    return 0;
  }
  return v9;
}

- (BOOL)packWithMessage:(id)a3 error:(id *)a4
{
  return [(TransparencyGPBAny *)self packWithMessage:a3 typeURLPrefix:@"type.googleapis.com/" error:a4];
}

- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  v9 = (NSString *)[a3 descriptor].fullName;
  NSUInteger v10 = [(NSString *)v9 length];
  if (v10)
  {
    if (a5) {
      *a5 = 0;
    }
    if ([a4 length])
    {
      if ([a4 hasSuffix:@"/"]) {
        v11 = (NSString *)[a4 stringByAppendingString:v9];
      }
      else {
        v11 = +[NSString stringWithFormat:@"%@/%@", a4, v9];
      }
      v9 = v11;
    }
    [(TransparencyGPBAny *)self setTypeURL:v9];
    -[TransparencyGPBAny setValue:](self, "setValue:", [a3 data]);
  }
  else if (a5)
  {
    *a5 = +[NSError errorWithDomain:@"TransparencyGPBWellKnownTypesErrorDomain" code:-100 userInfo:0];
  }
  return v10 != 0;
}

- (id)unpackMessageClass:(Class)a3 error:(id *)a4
{
  id v7 = [[-[objc_class descriptor](a3, "descriptor") fullName];
  if (![v7 length])
  {
    if (a4)
    {
      uint64_t v15 = -100;
      goto LABEL_13;
    }
    return 0;
  }
  id v8 = [(TransparencyGPBAny *)self typeURL];
  v9 = (char *)[v8 rangeOfString:@"/" options:4];
  if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL
    || (v11 = v9, &v9[v10] == [v8 length])
    || (id v12 = [v8 substringFromIndex:v11 + 1]) == 0
    || ([v12 isEqual:v7] & 1) == 0)
  {
    if (a4)
    {
      uint64_t v15 = -101;
LABEL_13:
      *a4 = +[NSError errorWithDomain:@"TransparencyGPBWellKnownTypesErrorDomain" code:v15 userInfo:0];
      return 0;
    }
    return 0;
  }
  id v13 = [(TransparencyGPBAny *)self value];

  return [(objc_class *)a3 parseFromData:v13 error:a4];
}

+ (id)descriptor
{
  id v2 = (id)qword_10032EC40;
  if (!qword_10032EC40)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBAny messageName:@"Any" fileDescription:off_100323EF0 fields:&off_100323EB0 fieldCount:2 storageSize:24 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AEF8];
    qword_10032EC40 = (uint64_t)v2;
  }
  return v2;
}

@end