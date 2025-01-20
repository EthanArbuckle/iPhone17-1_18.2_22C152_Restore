@interface HAPSecuritySessionDelegateAdditionalDerivedKeyTuple
+ (id)new;
- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)init;
- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)initWithName:(id)a3 saltData:(id)a4 infoData:(id)a5;
- (NSData)infoData;
- (NSData)saltData;
- (NSString)name;
@end

@implementation HAPSecuritySessionDelegateAdditionalDerivedKeyTuple

+ (id)new
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)initWithName:(id)a3 saltData:(id)a4 infoData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPSecuritySessionDelegateAdditionalDerivedKeyTuple;
  v11 = [(HAPSecuritySessionDelegateAdditionalDerivedKeyTuple *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSData *)[v9 copy];
    saltData = v11->_saltData;
    v11->_saltData = v14;

    v16 = (NSData *)[v10 copy];
    infoData = v11->_infoData;
    v11->_infoData = v16;
  }
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)saltData
{
  return self->_saltData;
}

- (NSData)infoData
{
  return self->_infoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoData, 0);
  objc_storeStrong((id *)&self->_saltData, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end