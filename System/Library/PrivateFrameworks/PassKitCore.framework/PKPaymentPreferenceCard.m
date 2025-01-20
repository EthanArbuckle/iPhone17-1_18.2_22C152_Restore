@interface PKPaymentPreferenceCard
- (BOOL)supportsDeletion;
- (BOOL)supportsNullSelection;
- (PKPaymentPreferenceCard)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6;
- (id)errorsForPreference:(id)a3;
- (void)setErrors:(id)a3 forPreference:(id)a4;
- (void)setSupportsNullSelection:(BOOL)a3;
@end

@implementation PKPaymentPreferenceCard

- (PKPaymentPreferenceCard)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferenceCard;
  return [(PKPaymentPreference *)&v7 initWithTitle:a3 preferences:a4 selectedIndex:a5 readOnly:a6];
}

- (BOOL)supportsDeletion
{
  return 0;
}

- (void)setErrors:(id)a3 forPreference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v7 pass];
  }
  v9 = v8;
  v10 = [(PKPaymentPreference *)self errors];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__PKPaymentPreferenceCard_setErrors_forPreference___block_invoke;
  v17[3] = &unk_1E56DD528;
  id v11 = v9;
  id v18 = v11;
  v12 = [v10 keysOfEntriesPassingTest:v17];
  v13 = [v12 anyObject];

  v14 = [(PKPaymentPreference *)self errors];
  v15 = v14;
  if (v13)
  {
    [v14 setObject:v6 forKey:v13];
  }
  else
  {
    v16 = [v11 serialNumber];
    [v15 setObject:v6 forKey:v16];
  }
}

uint64_t __51__PKPaymentPreferenceCard_setErrors_forPreference___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 serialNumber];
  uint64_t v5 = [v4 isEqualToString:v3];

  return v5;
}

- (id)errorsForPreference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentPreference *)self errors];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__PKPaymentPreferenceCard_errorsForPreference___block_invoke;
  v12[3] = &unk_1E56DD528;
  id v13 = v4;
  id v6 = v4;
  id v7 = [v5 keysOfEntriesPassingTest:v12];
  id v8 = [v7 anyObject];

  if (v8)
  {
    v9 = [(PKPaymentPreference *)self errors];
    v10 = [v9 objectForKey:v8];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __47__PKPaymentPreferenceCard_errorsForPreference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v6 = [v5 pass];
    id v7 = [v6 serialNumber];
    uint64_t v8 = [v7 isEqualToString:v3];

    id v3 = v7;
  }
  else
  {
    id v6 = [v5 serialNumber];
    uint64_t v8 = [v6 isEqualToString:v3];
  }

  return v8;
}

- (BOOL)supportsNullSelection
{
  return self->_supportsNullSelection;
}

- (void)setSupportsNullSelection:(BOOL)a3
{
  self->_supportsNullSelection = a3;
}

@end