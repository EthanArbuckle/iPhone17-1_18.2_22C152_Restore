@interface TRIPBAny
+ (id)anyWithMessage:(id)a3 error:(id *)a4;
+ (id)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
+ (id)descriptor;
- (BOOL)packWithMessage:(id)a3 error:(id *)a4;
- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
- (TRIPBAny)initWithMessage:(id)a3 error:(id *)a4;
- (TRIPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5;
- (id)unpackMessageClass:(Class)a3 error:(id *)a4;
@end

@implementation TRIPBAny

+ (id)descriptor
{
  id v2 = (id)_MergedGlobals_10;
  if (!_MergedGlobals_10)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (!qword_1EB3EE538) {
      qword_1EB3EE538 = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    }
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    [v2 setupExtraTextInfo:&unk_19362C2F0];
    if (_MergedGlobals_10) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIAny.pbobjc.m", 101, @"Startup recursed!");
    }
    _MergedGlobals_10 = (uint64_t)v2;
  }
  return v2;
}

+ (id)anyWithMessage:(id)a3 error:(id *)a4
{
  return (id)[a1 anyWithMessage:a3 typeURLPrefix:@"type.googleapis.com/" error:a4];
}

+ (id)anyWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithMessage:a3 typeURLPrefix:a4 error:a5];
  return v5;
}

- (TRIPBAny)initWithMessage:(id)a3 error:(id *)a4
{
  return [(TRIPBAny *)self initWithMessage:a3 typeURLPrefix:@"type.googleapis.com/" error:a4];
}

- (TRIPBAny)initWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  uint64_t v8 = [(TRIPBMessage *)self init];
  v9 = v8;
  if (v8 && ![(TRIPBAny *)v8 packWithMessage:a3 typeURLPrefix:a4 error:a5])
  {

    return 0;
  }
  return v9;
}

- (BOOL)packWithMessage:(id)a3 error:(id *)a4
{
  return [(TRIPBAny *)self packWithMessage:a3 typeURLPrefix:@"type.googleapis.com/" error:a4];
}

- (BOOL)packWithMessage:(id)a3 typeURLPrefix:(id)a4 error:(id *)a5
{
  v9 = objc_msgSend((id)objc_msgSend(a3, "descriptor"), "fullName");
  uint64_t v10 = [v9 length];
  if (v10)
  {
    if (a5) {
      *a5 = 0;
    }
    if ([a4 length])
    {
      if ([a4 hasSuffix:@"/"]) {
        uint64_t v11 = [a4 stringByAppendingString:v9];
      }
      else {
        uint64_t v11 = [NSString stringWithFormat:@"%@/%@", a4, v9];
      }
      v9 = (void *)v11;
    }
    [(TRIPBAny *)self setTypeURL:v9];
    -[TRIPBAny setValue:](self, "setValue:", [a3 data]);
  }
  else if (a5)
  {
    *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"TRIPBWellKnownTypesErrorDomain" code:-100 userInfo:0];
  }
  return v10 != 0;
}

- (id)unpackMessageClass:(Class)a3 error:(id *)a4
{
  v7 = objc_msgSend((id)-[objc_class descriptor](a3, "descriptor"), "fullName");
  if (![v7 length])
  {
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = -100;
      goto LABEL_13;
    }
    return 0;
  }
  uint64_t v8 = (void *)[(TRIPBAny *)self typeURL];
  uint64_t v9 = [v8 rangeOfString:@"/" options:4];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v11 = v9, v9 + v10 == [v8 length])
    || (v12 = (void *)[v8 substringFromIndex:v11 + 1]) == 0
    || ([v12 isEqual:v7] & 1) == 0)
  {
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = -101;
LABEL_13:
      *a4 = (id)[v15 errorWithDomain:@"TRIPBWellKnownTypesErrorDomain" code:v16 userInfo:0];
      return 0;
    }
    return 0;
  }
  uint64_t v13 = [(TRIPBAny *)self value];
  return (id)[(objc_class *)a3 parseFromData:v13 error:a4];
}

@end