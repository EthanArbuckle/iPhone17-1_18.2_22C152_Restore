@interface MRDPinPairingDialog_CFUN
- (void)showWithPin:(id)a3 forClient:(id)a4;
@end

@implementation MRDPinPairingDialog_CFUN

- (void)showWithPin:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)MSVSystemDialogOptions);
  v5 = MRLocalizedString();
  [v8 setAlertHeader:v5];

  [v8 setAlertMessage:v4];
  v6 = MRLocalizedString();
  [v8 setDefaultButtonTitle:v6];

  id v7 = [objc_alloc((Class)MSVSystemDialog) initWithOptions:v8];
  [v7 presentWithCompletion:0];
}

@end