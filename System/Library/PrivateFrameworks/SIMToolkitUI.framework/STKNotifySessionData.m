@interface STKNotifySessionData
- (STKNotifySessionData)initWithText:(id)a3 simLabel:(id)a4 notifyType:(int64_t)a5;
- (STKNotifySessionData)initWithXPCDictionary:(id)a3;
- (int64_t)notifyType;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKNotifySessionData

- (STKNotifySessionData)initWithText:(id)a3 simLabel:(id)a4 notifyType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!a5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"STKNotifySessionData.m" lineNumber:18 description:@"NotifyType cannot be unknown."];
  }
  v15.receiver = self;
  v15.super_class = (Class)STKNotifySessionData;
  v11 = [(STKTextSessionData *)&v15 initWithText:v9 simLabel:v10];
  v12 = v11;
  if (v11) {
    v11->_notifyType = a5;
  }

  return v12;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STKNotifySessionData;
  id v4 = a3;
  [(STKTextSessionData *)&v5 encodeWithXPCDictionary:v4];
  xpc_dictionary_set_uint64(v4, "_notifyType", self->_notifyType);
}

- (STKNotifySessionData)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STKNotifySessionData;
  objc_super v5 = [(STKTextSessionData *)&v7 initWithXPCDictionary:v4];
  if (v5) {
    v5->_notifyType = xpc_dictionary_get_uint64(v4, "_notifyType");
  }

  return v5;
}

- (int64_t)notifyType
{
  return self->_notifyType;
}

@end