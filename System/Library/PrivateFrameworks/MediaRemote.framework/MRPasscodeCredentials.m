@interface MRPasscodeCredentials
+ (id)_randomPasscode;
+ (id)standardCredentials;
- (NSString)passcode;
- (unint64_t)characterCount;
- (unsigned)type;
- (void)setCharacterCount:(unint64_t)a3;
- (void)setPasscode:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation MRPasscodeCredentials

+ (id)standardCredentials
{
  v2 = objc_alloc_init(MRPasscodeCredentials);
  [(MRPasscodeCredentials *)v2 setType:1];
  [(MRPasscodeCredentials *)v2 setCharacterCount:4];
  v3 = +[MRPasscodeCredentials _randomPasscode]();
  [(MRPasscodeCredentials *)v2 setPasscode:v3];

  return v2;
}

+ (id)_randomPasscode
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self;
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, bytes);
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:4];
  for (uint64_t i = 0; i != 32; i += 8)
    objc_msgSend(v0, "appendFormat:", @"%.1u", *(void *)&bytes[i] % 0xAuLL);

  return v0;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unint64_t)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(unint64_t)a3
{
  self->_characterCount = a3;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end