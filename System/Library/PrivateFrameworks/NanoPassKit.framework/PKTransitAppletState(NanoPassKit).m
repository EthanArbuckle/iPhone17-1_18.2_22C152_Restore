@interface PKTransitAppletState(NanoPassKit)
- (id)npk_processUpdateWithAppletHistory:()NanoPassKit concreteTransactions:ephemeralTransaction:mutatedBalances:pass:;
@end

@implementation PKTransitAppletState(NanoPassKit)

- (id)npk_processUpdateWithAppletHistory:()NanoPassKit concreteTransactions:ephemeralTransaction:mutatedBalances:pass:
{
  v40[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  v14 = v13;
  if (!v13)
  {
    v18 = pk_Payment_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      v20 = pk_Payment_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Error no pass to process applet history", buf, 2u);
      }
    }
    goto LABEL_8;
  }
  if (!NPKIsTruthOnCard(v13))
  {
LABEL_8:
    v17 = 0;
    v16 = 0;
    v15 = 0;
    goto LABEL_9;
  }
  v15 = NPKPaymentPassBalanceLabelDictionary(v14);
  v16 = NPKPaymentPassUnitDictionary(v14);
  v17 = NPKPaymentPassPlanLabelDictionary(v14);
LABEL_9:
  v21 = [a1 processUpdateWithAppletHistory:v12 concreteTransactions:a4 ephemeralTransaction:a5 mutatedBalances:a6 balanceLabelDictionary:v15 unitDictionary:v16 planLabelDictionary:v17];
  if (a6)
  {
    if (![*a6 count])
    {
      uint64_t v23 = [v21 balance];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [v21 currency];

        if (v25)
        {
          v26 = [MEMORY[0x263EFF8F0] currentCalendar];
          v27 = [v21 expirationDate];
          v37 = [v26 components:30 fromDate:v27];

          id v36 = objc_alloc(MEMORY[0x263F5C2B0]);
          uint64_t v28 = *MEMORY[0x263F5C6B8];
          v29 = [v21 balance];
          v30 = [v21 currency];
          v31 = (void *)[v36 initWithIdentifier:v28 balance:v29 currency:v30 exponent:0 expirationDate:v37];

          v40[0] = v31;
          uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
          id v33 = *a6;
          *a6 = (id)v32;

          v34 = pk_Payment_log();
          LODWORD(v29) = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

          if (v29)
          {
            v35 = pk_Payment_log();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v31;
              _os_log_impl(&dword_21E92F000, v35, OS_LOG_TYPE_DEFAULT, "Notice: added Manually mutated transit Applet Balance:%@", buf, 0xCu);
            }
          }
        }
      }
    }
  }

  return v21;
}

@end