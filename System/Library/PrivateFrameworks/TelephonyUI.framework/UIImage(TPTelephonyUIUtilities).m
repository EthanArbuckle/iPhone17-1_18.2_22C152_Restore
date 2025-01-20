@interface UIImage(TPTelephonyUIUtilities)
+ (id)_tpImageNamed:()TPTelephonyUIUtilities inBundle:compatibleWithTraitCollection:;
+ (id)tpImageNamed:()TPTelephonyUIUtilities inBundle:;
@end

@implementation UIImage(TPTelephonyUIUtilities)

+ (id)_tpImageNamed:()TPTelephonyUIUtilities inBundle:compatibleWithTraitCollection:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    if (v7)
    {
LABEL_3:
      v10 = [MEMORY[0x1E4FB1818] imageNamed:v7 inBundle:v8 compatibleWithTraitCollection:v9];
      goto LABEL_6;
    }
  }
  else
  {
    TelephonyUIBundle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = 0;
LABEL_6:

  return v10;
}

+ (id)tpImageNamed:()TPTelephonyUIUtilities inBundle:
{
  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = (void *)MEMORY[0x1E4FB1BA8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 mainScreen];
  v10 = [v9 traitCollection];
  v11 = [v5 _tpImageNamed:v8 inBundle:v7 compatibleWithTraitCollection:v10];

  return v11;
}

@end