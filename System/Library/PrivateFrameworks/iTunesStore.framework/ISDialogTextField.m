@interface ISDialogTextField
+ (id)textFieldWithTitle:(id)a3;
- (BOOL)isSecure;
- (ISDialogTextField)init;
- (ISDialogTextField)initWithXPCEncoding:(id)a3;
- (NSString)title;
- (NSString)value;
- (id)copyXPCEncoding;
- (int64_t)keyboardType;
- (void)dealloc;
- (void)setKeyboardType:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ISDialogTextField

- (ISDialogTextField)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISDialogTextField;
  return [(ISDialogTextField *)&v4 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISDialogTextField;
  [(ISDialogTextField *)&v3 dealloc];
}

+ (id)textFieldWithTitle:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setTitle:a3];

  return v4;
}

- (ISDialogTextField)initWithXPCEncoding:(id)a3
{
  __ISRecordSPIClassUsage(self);
  if (a3 && MEMORY[0x2166C7F80](a3) == MEMORY[0x263EF8708])
  {
    v7.receiver = self;
    v7.super_class = (Class)ISDialogTextField;
    v5 = [(ISDialogTextField *)&v7 init];
    if (v5)
    {
      v5->_keyboardType = xpc_dictionary_get_int64(a3, "0");
      v5->_secure = xpc_dictionary_get_BOOL(a3, "1");
      objc_opt_class();
      v5->_title = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_value = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_keyboardType);
  xpc_dictionary_set_BOOL(v3, "1", self->_secure);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  return v3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setValue:(id)a3
{
}

@end