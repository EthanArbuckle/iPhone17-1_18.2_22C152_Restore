@interface PearlAutoBugCapture
- (BOOL)sendSignature:(id)a3 withDuration:(double)a4;
- (id)getSubtypeForReason:(unint64_t)a3;
- (id)getTypeForReason:(unint64_t)a3;
@end

@implementation PearlAutoBugCapture

- (id)getTypeForReason:(unint64_t)a3
{
  if (a3 - 1 >= 6)
  {
    v5.receiver = self;
    v5.super_class = (Class)PearlAutoBugCapture;
    -[BiometricAutoBugCapture getTypeForReason:](&v5, sel_getTypeForReason_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26466FA38[a3 - 1];
  }

  return v3;
}

- (id)getSubtypeForReason:(unint64_t)a3
{
  if (a3 - 1 >= 6)
  {
    v5.receiver = self;
    v5.super_class = (Class)PearlAutoBugCapture;
    -[BiometricAutoBugCapture getSubtypeForReason:](&v5, sel_getSubtypeForReason_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26466FA68[a3 - 1];
  }

  return v3;
}

- (BOOL)sendSignature:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  v7 = [v6 objectForKey:@"type"];
  int v8 = [v7 isEqualToString:@"FrameTiming"];

  if (v8 && [(BiometricAutoBugCapture *)self serialLogEnabled])
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PearlAutoBugCapture;
    BOOL v9 = [(BiometricAutoBugCapture *)&v11 sendSignature:v6 withDuration:a4];
  }

  return v9;
}

@end