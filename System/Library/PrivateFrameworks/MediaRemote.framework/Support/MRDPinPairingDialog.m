@interface MRDPinPairingDialog
+ (id)allocWithZone:(_NSZone *)a3;
- (MRDPinPairingDialogDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation MRDPinPairingDialog

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    if (MSVDeviceIsAppleTV()) {
      v6 = MRDPinPairingDialog_ATV;
    }
    else {
      v6 = MRDPinPairingDialog_CFUN;
    }
    return [(__objc2_class *)v6 allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MRDPinPairingDialog;
    return objc_msgSendSuper2(&v7, "allocWithZone:", a3);
  }
}

- (MRDPinPairingDialogDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDPinPairingDialogDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end