@interface SSVDialogResponse
- (NSArray)textFieldValues;
- (SSVDialogResponse)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)selectedButtonIndex;
- (void)setSelectedButtonIndex:(int64_t)a3;
- (void)setTextFieldValues:(id)a3;
@end

@implementation SSVDialogResponse

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setSelectedButtonIndex:self->_selectedButtonIndex];
  [v4 setTextFieldValues:self->_textFieldValues];
  return v4;
}

- (SSVDialogResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v6 = [(SSVDialogResponse *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    v6->_selectedButtonIndex = xpc_dictionary_get_int64(v5, "0");
    objc_opt_class();
    CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
    self = (SSVDialogResponse *)v6->_textFieldValues;
    v6->_textFieldValues = (NSArray *)v8;
  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_selectedButtonIndex);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_textFieldValues);
  return v3;
}

- (int64_t)selectedButtonIndex
{
  return self->_selectedButtonIndex;
}

- (void)setSelectedButtonIndex:(int64_t)a3
{
  self->_selectedButtonIndex = a3;
}

- (NSArray)textFieldValues
{
  return self->_textFieldValues;
}

- (void)setTextFieldValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end