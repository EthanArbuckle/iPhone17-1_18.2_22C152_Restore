@interface VMVoicemailCapabilities
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilities:(id)a3;
- (BOOL)isTranscriptionEnabled;
- (VMVoicemailCapabilities)init;
- (VMVoicemailCapabilities)initWithCapabilities:(id)a3;
- (VMVoicemailCapabilities)initWithCoder:(id)a3;
- (VMVoicemailCapabilities)initWithTranscriptionEnabled:(BOOL)a3;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VMVoicemailCapabilities

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  v4 = NSStringFromSelector(sel_transcriptionEnabled);
  BOOL v5 = [(VMVoicemailCapabilities *)self isTranscriptionEnabled];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  [v3 appendFormat:@"%@=%@", v4, v6];

  [v3 appendString:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isTranscriptionEnabled
{
  return self->_transcriptionEnabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL transcriptionEnabled = self->_transcriptionEnabled;
  id v4 = a3;
  NSStringFromSelector(sel_transcriptionEnabled);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:transcriptionEnabled forKey:v5];
}

- (VMVoicemailCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VMVoicemailCapabilities;
  id v5 = [(VMVoicemailCapabilities *)&v8 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_transcriptionEnabled);
    v5->_BOOL transcriptionEnabled = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (VMVoicemailCapabilities)initWithTranscriptionEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VMVoicemailCapabilities;
  result = [(VMVoicemailCapabilities *)&v5 init];
  if (result) {
    result->_BOOL transcriptionEnabled = a3;
  }
  return result;
}

- (VMVoicemailCapabilities)init
{
  return 0;
}

- (VMVoicemailCapabilities)initWithCapabilities:(id)a3
{
  uint64_t v4 = [a3 isTranscriptionEnabled];
  return [(VMVoicemailCapabilities *)self initWithTranscriptionEnabled:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithCapabilities:self];
}

- (unint64_t)hash
{
  if ([(VMVoicemailCapabilities *)self isTranscriptionEnabled]) {
    return 1231;
  }
  else {
    return 1237;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(VMVoicemailCapabilities *)self isEqualToCapabilities:v4];

  return v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(VMVoicemailCapabilities *)self isTranscriptionEnabled];
  char v5 = [v4 isTranscriptionEnabled];

  return self ^ v5 ^ 1;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263F08928];
  id v7 = a3;
  objc_super v8 = [a1 unarchivedObjectClasses];
  v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

@end