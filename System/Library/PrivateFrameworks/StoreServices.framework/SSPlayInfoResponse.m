@interface SSPlayInfoResponse
- (NSData)playInfoData;
- (NSError)error;
- (NSString)description;
- (SSPlayInfoResponse)initWithPlayInfoData:(id)a3 error:(id)a4;
- (SSPlayInfoResponse)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)dealloc;
@end

@implementation SSPlayInfoResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSPlayInfoResponse;
  [(SSPlayInfoResponse *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[2] = [(NSData *)self->_playInfoData copyWithZone:a3];
  v5[1] = [(NSError *)self->_error copyWithZone:a3];
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_error);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_playInfoData);
  return v3;
}

- (SSPlayInfoResponse)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSPlayInfoResponse;
    v5 = [(SSPlayInfoResponse *)&v7 init];
    if (v5)
    {
      v5->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
      objc_opt_class();
      v5->_playInfoData = (NSData *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSString)description
{
  if (self->_error)
  {
    v5.receiver = self;
    v5.super_class = (Class)SSPlayInfoResponse;
    return (NSString *)[NSString stringWithFormat:@"%@: Failed with error: %@", -[SSPlayInfoResponse description](&v5, sel_description), self->_error, v3];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SSPlayInfoResponse;
    return (NSString *)[NSString stringWithFormat:@"%@: Succeeded with info: %ld bytes @ %p", -[SSPlayInfoResponse description](&v4, sel_description), -[NSData length](self->_playInfoData, "length"), self->_playInfoData];
  }
}

- (SSPlayInfoResponse)initWithPlayInfoData:(id)a3 error:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SSPlayInfoResponse;
  v6 = [(SSPlayInfoResponse *)&v8 init];
  if (v6)
  {
    v6->_error = (NSError *)a4;
    v6->_playInfoData = (NSData *)[a3 copy];
  }
  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (NSData)playInfoData
{
  return self->_playInfoData;
}

@end