@interface STKTextInputSessionData
- (BOOL)isDigitsOnly;
- (BOOL)isSecure;
- (NSString)defaultText;
- (STKTextInputSessionData)initWithText:(id)a3 simLabel:(id)a4;
- (STKTextInputSessionData)initWithXPCDictionary:(id)a3;
- (unint64_t)maximumInputLength;
- (unint64_t)minimumInputLength;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKTextInputSessionData

- (STKTextInputSessionData)initWithText:(id)a3 simLabel:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)STKTextInputSessionData;
  result = [(STKTextSessionData *)&v5 initWithText:a3 simLabel:a4];
  if (result)
  {
    result->_minimumInputLength = 0;
    result->_maximumInputLength = -1;
  }
  return result;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STKTextInputSessionData;
  id v4 = a3;
  [(STKTextSessionData *)&v5 encodeWithXPCDictionary:v4];
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(v4, "_isSecure", self->_isSecure);
  xpc_dictionary_set_BOOL(v4, "_isDigits", self->_isDigitsOnly);
  xpc_dictionary_set_uint64(v4, "_minLength", self->_minimumInputLength);
  xpc_dictionary_set_uint64(v4, "_maxLength", self->_maximumInputLength);
}

- (STKTextInputSessionData)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STKTextInputSessionData;
  objc_super v5 = [(STKTextSessionData *)&v9 initWithXPCDictionary:v4];
  if (v5)
  {
    uint64_t v6 = BSDeserializeStringFromXPCDictionaryWithKey();
    defaultText = v5->_defaultText;
    v5->_defaultText = (NSString *)v6;

    v5->_isSecure = xpc_dictionary_get_BOOL(v4, "_isSecure");
    v5->_isDigitsOnly = xpc_dictionary_get_BOOL(v4, "_isDigits");
    v5->_minimumInputLength = xpc_dictionary_get_uint64(v4, "_minLength");
    v5->_maximumInputLength = xpc_dictionary_get_uint64(v4, "_maxLength");
  }

  return v5;
}

- (NSString)defaultText
{
  return self->_defaultText;
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (BOOL)isDigitsOnly
{
  return self->_isDigitsOnly;
}

- (unint64_t)minimumInputLength
{
  return self->_minimumInputLength;
}

- (unint64_t)maximumInputLength
{
  return self->_maximumInputLength;
}

- (void).cxx_destruct
{
}

@end