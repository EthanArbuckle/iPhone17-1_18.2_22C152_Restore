@interface MRCryptoPairingSession
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)deleteIdentityWithError:(id *)a3;
- (BOOL)isPaired;
- (BOOL)isValid;
- (MRCryptoPairingSession)init;
- (MRCryptoPairingSession)initWithRole:(unint64_t)a3 device:(id)a4;
- (MRCryptoPairingSessionDelegate)delegate;
- (MRDeviceInfo)device;
- (NSArray)pairedDevices;
- (id)decryptData:(id)a3 withError:(id *)a4;
- (id)encryptData:(id)a3 withError:(id *)a4;
- (id)removePeer;
- (id)updatePeer;
- (unint64_t)role;
- (void)close;
- (void)handlePairingExchangeData:(id)a3 completion:(id)a4;
- (void)handlePairingFailureWithStatus:(int)a3;
- (void)open;
- (void)setDelegate:(id)a3;
@end

@implementation MRCryptoPairingSession

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[MRCryptoPairingSession allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MRCryptoPairingSession;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MRCryptoPairingSession)initWithRole:(unint64_t)a3 device:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRCryptoPairingSession;
  v8 = [(MRCryptoPairingSession *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_role = a3;
    objc_storeStrong((id *)&v8->_device, a4);
  }

  return v9;
}

- (MRCryptoPairingSession)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = NSStringFromSelector(sel_initWithRole_device_);
  [v3 raise:v4, @"use %@ instead", v5 format];

  return 0;
}

- (BOOL)isPaired
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession isPaired]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)isValid
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession isValid]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (NSArray)pairedDevices
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession pairedDevices]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)open
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession open]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)close
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession close]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (id)removePeer
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession removePeer]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (id)updatePeer
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession updatePeer]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)handlePairingExchangeData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession handlePairingExchangeData:completion:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handlePairingFailureWithStatus:(int)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession handlePairingFailureWithStatus:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)encryptData:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession encryptData:withError:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)decryptData:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession decryptData:withError:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)deleteIdentityWithError:(id *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRCryptoPairingSession deleteIdentityWithError:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (MRDeviceInfo)device
{
  return self->_device;
}

- (unint64_t)role
{
  return self->_role;
}

- (MRCryptoPairingSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRCryptoPairingSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_device, 0);
}

@end