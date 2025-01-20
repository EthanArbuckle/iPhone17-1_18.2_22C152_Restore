@interface _UIFocusInputDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithSenderID:(unint64_t)a3;
- (_UIFocusInputDeviceInfo)initWithCoder:(id)a3;
- (_UIFocusInputDeviceInfo)initWithXPCDictionary:(id)a3;
- (id)_initWithSenderID:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)senderID;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation _UIFocusInputDeviceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)infoWithSenderID:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) _initWithSenderID:a3];
  return v3;
}

- (id)_initWithSenderID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusInputDeviceInfo;
  id result = [(_UIFocusInputDeviceInfo *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_uint64(xdict, (const char *)[@"FocusInputDeviceInfoSenderIDKey" UTF8String], -[_UIFocusInputDeviceInfo senderID](self, "senderID"));
}

- (_UIFocusInputDeviceInfo)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusInputDeviceInfo;
  objc_super v5 = [(_UIFocusInputDeviceInfo *)&v7 init];
  if (v5) {
    v5->_senderID = xpc_dictionary_get_uint64(v4, (const char *)[@"FocusInputDeviceInfoSenderIDKey" UTF8String]);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t senderID = self->_senderID;
  return (id)[v4 _initWithSenderID:senderID];
}

- (_UIFocusInputDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusInputDeviceInfo;
  objc_super v5 = [(_UIFocusInputDeviceInfo *)&v7 init];
  if (v5) {
    v5->_unint64_t senderID = [v4 decodeIntegerForKey:@"FocusInputDeviceInfoSenderIDKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIFocusInputDeviceInfo senderID](self, "senderID"), @"FocusInputDeviceInfoSenderIDKey");
}

- (unint64_t)senderID
{
  return self->_senderID;
}

@end