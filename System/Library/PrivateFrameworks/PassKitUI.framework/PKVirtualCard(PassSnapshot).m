@interface PKVirtualCard(PassSnapshot)
- (id)_genericCardIcon;
- (id)_largeAppleCardIcon;
- (void)cardArtworkWithSize:()PassSnapshot completion:;
@end

@implementation PKVirtualCard(PassSnapshot)

- (id)_largeAppleCardIcon
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = PKPassKitUIFoundationBundle();
  v2 = [v0 imageNamed:@"AppleCardAutoFillCreditCardIconLarge" inBundle:v1];

  return v2;
}

- (id)_genericCardIcon
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = PKPassKitUIFoundationBundle();
  v2 = [v0 imageNamed:@"GenericAutofill" inBundle:v1];

  return v2;
}

- (void)cardArtworkWithSize:()PassSnapshot completion:
{
  v8 = a5;
  if (v8)
  {
    uint64_t v9 = [a1 type];
    switch(v9)
    {
      case 0:
        v10 = [a1 _genericCardIcon];
        v8[2](v8, v10);
LABEL_11:

        break;
      case 2:
        v11 = +[PKPassSnapshotter sharedInstance];
        id v12 = objc_alloc_init(MEMORY[0x1E4F84C38]);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke;
        v14[3] = &unk_1E59D27B0;
        id v15 = v11;
        double v18 = a2;
        double v19 = a3;
        v16 = a1;
        v17 = v8;
        id v13 = v11;
        [v12 paymentPassForVirtualCard:a1 completion:v14];

        break;
      case 1:
        if (a2 <= 40.0) {
          [a1 _smallAppleCardIcon];
        }
        else {
        v10 = [a1 _largeAppleCardIcon];
        }
        v8[2](v8, v10);
        goto LABEL_11;
    }
  }
}

@end