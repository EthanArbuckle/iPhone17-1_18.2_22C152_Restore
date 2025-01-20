@interface NPKPaymentProvisioningFlowPickerSection
+ (id)sectionWithTitle:(id)a3 footer:(id)a4 productType:(id)a5;
+ (id)sectionWithTitle:(id)a3 footer:(id)a4 productType:(id)a5 items:(id)a6;
+ (id)sectionWithTitle:(id)a3 productType:(id)a4;
+ (id)sectionWithTitle:(id)a3 productType:(id)a4 items:(id)a5;
- (BOOL)isAppleBalanceSection;
- (BOOL)isEMoneySection;
- (BOOL)isPaymentSection;
- (BOOL)isTransitSection;
- (NSMutableArray)items;
- (NSNumber)productType;
- (NSString)footer;
- (NSString)title;
- (id)description;
- (void)setFooter:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowPickerSection

+ (id)sectionWithTitle:(id)a3 productType:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 array];
  v10 = [a1 sectionWithTitle:v8 footer:0 productType:v7 items:v9];

  return v10;
}

+ (id)sectionWithTitle:(id)a3 productType:(id)a4 items:(id)a5
{
  return (id)[a1 sectionWithTitle:a3 footer:0 productType:a4 items:a5];
}

+ (id)sectionWithTitle:(id)a3 footer:(id)a4 productType:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 array];
  v13 = [a1 sectionWithTitle:v11 footer:v10 productType:v9 items:v12];

  return v13;
}

+ (id)sectionWithTitle:(id)a3 footer:(id)a4 productType:(id)a5 items:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)a1);
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    v16 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v15;

    uint64_t v17 = [v11 copy];
    v18 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v17;

    v19 = (void *)MEMORY[0x263EFF980];
    v20 = (void *)[v13 copy];
    uint64_t v21 = [v19 arrayWithArray:v20];
    v22 = (void *)*((void *)v14 + 3);
    *((void *)v14 + 3) = v21;

    objc_storeStrong((id *)v14 + 4, a5);
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NPKPaymentProvisioningFlowPickerSection *)self title];
  v6 = [(NPKPaymentProvisioningFlowPickerSection *)self footer];
  id v7 = [(NPKPaymentProvisioningFlowPickerSection *)self items];
  id v8 = [v3 stringWithFormat:@"<%@: %p title \"%@\" footer \"%@\" items %@>", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isTransitSection
{
  v2 = [(NPKPaymentProvisioningFlowPickerSection *)self productType];
  char v3 = [v2 isEqualToNumber:&unk_26D0437D8];

  return v3;
}

- (BOOL)isPaymentSection
{
  v2 = [(NPKPaymentProvisioningFlowPickerSection *)self productType];
  char v3 = [v2 isEqualToNumber:&unk_26D0437F0];

  return v3;
}

- (BOOL)isEMoneySection
{
  v2 = [(NPKPaymentProvisioningFlowPickerSection *)self productType];
  char v3 = [v2 isEqualToNumber:&unk_26D043808];

  return v3;
}

- (BOOL)isAppleBalanceSection
{
  char v3 = [(NPKPaymentProvisioningFlowPickerSection *)self productType];
  int v4 = [v3 isEqualToNumber:&unk_26D043820];

  if (!v4) {
    return 0;
  }
  v5 = [(NPKPaymentProvisioningFlowPickerSection *)self items];
  char v6 = objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_3);

  return v6;
}

uint64_t __64__NPKPaymentProvisioningFlowPickerSection_isAppleBalanceSection__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 products];
  uint64_t v3 = objc_msgSend(v2, "pk_containsObjectPassingTest:", &__block_literal_global_88);

  return v3;
}

uint64_t __64__NPKPaymentProvisioningFlowPickerSection_isAppleBalanceSection__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isAppleBalanceProduct];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (NSNumber)productType
{
  return self->_productType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end