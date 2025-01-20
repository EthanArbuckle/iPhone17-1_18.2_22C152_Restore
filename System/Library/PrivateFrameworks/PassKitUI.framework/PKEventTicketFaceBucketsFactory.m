@interface PKEventTicketFaceBucketsFactory
+ (id)auxiliaryFieldsForPass:(id)a3;
+ (id)headerFieldsForPass:(id)a3;
+ (id)primaryFieldsForPass:(id)a3;
+ (id)secondaryFieldsForPass:(id)a3;
@end

@implementation PKEventTicketFaceBucketsFactory

+ (id)headerFieldsForPass:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F84888]);
  [v4 setType:0];
  id v5 = (id)*MEMORY[0x1E4F875F8];
  v6 = [v3 eventDateInfoForSemanticKey:*MEMORY[0x1E4F87658]];
  v7 = [v6 date];
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v9 = [v3 dateForSemanticKey:v5];
  }
  v10 = v9;

  v11 = [v6 timeZone];
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v13 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  }
  v14 = v13;

  v15 = [v3 dateForSemanticKey:*MEMORY[0x1E4F875F0]];
  [v4 setKey:v5];
  if (v10)
  {
    v16 = PKMediumDayAndMonthStringFromDate(v10, v14);
    if (v15)
    {
      id v28 = v5;
      v17 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
      [v17 setTimeZone:v14];
      uint64_t v18 = [v17 component:4 fromDate:v10];
      if (v18 == [v17 component:4 fromDate:v15])
      {
        uint64_t v19 = PKDateRangeStringFromDateToDate(v10, v15, 0, 0, 0, v14);
      }
      else
      {
        uint64_t v21 = PKMediumDayAndMonthStringFromDate(v15, v14);
        uint64_t v19 = PKLocalizedTicketingString(&cfstr_LocalizedDateR.isa, &stru_1EF1B5770.isa, v16, v21);

        v16 = (void *)v21;
      }

      v16 = (void *)v19;
      id v5 = v28;
    }
    if ([v6 ignoreTimeComponents]) {
      goto LABEL_26;
    }
    if ([v6 isUndetermined])
    {
      v22 = @"LABEL_TIME_TBD";
    }
    else
    {
      if (![v6 isUnannounced])
      {
        uint64_t v23 = PKTimeStringFromDate(v10, v14);
        goto LABEL_25;
      }
      v22 = @"LABEL_TIME_TBA";
    }
    uint64_t v23 = PKLocalizedTicketingString(&v22->isa);
LABEL_25:
    v24 = (void *)v23;
    [v4 setLabel:v23];

LABEL_26:
    v25 = objc_msgSend(v16, "pk_uppercaseStringForPreferredLocale");
    [v4 setUnformattedValue:v25];

    goto LABEL_27;
  }
  if ([v6 isUndetermined])
  {
    v20 = @"LABEL_DATE_TBD";
  }
  else
  {
    if (![v6 isUnannounced]) {
      goto LABEL_28;
    }
    v20 = @"LABEL_DATE_TBA";
  }
  v16 = PKLocalizedTicketingString(&v20->isa);
  [v4 setUnformattedValue:v16];
LABEL_27:

LABEL_28:
  v29[0] = v4;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

  return v26;
}

+ (id)primaryFieldsForPass:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PKEventTicketFaceBucketsFactory secondaryFieldsForPass:v3];
  uint64_t v5 = [v4 count];

  if (v5 >= 1)
  {
    if ((unint64_t)v5 > 3)
    {
      v6 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_23;
    }
    id v7 = (id)*MEMORY[0x1E4F876B8];
    v10 = [v3 seatingInformation];
    v11 = [v10 firstSeat];
    v12 = v11;
    if (v11 && ([v11 type], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = (id)v13;
    }
    else
    {
      id v14 = (id)*MEMORY[0x1E4F87840];

      uint64_t v15 = [v3 stringForSemanticKey:v14];
      if (v15)
      {
        id v8 = (id)v15;
        id v7 = v14;
      }
      else
      {
        id v7 = (id)*MEMORY[0x1E4F876D0];

        id v8 = [v3 stringForSemanticKey:v7];
        if (!v8 && (unint64_t)v5 <= 2)
        {
          id v18 = (id)*MEMORY[0x1E4F877A0];

          id v8 = [v3 stringForSemanticKey:v18];
          id v7 = v18;
        }
        if (!v8) {
          goto LABEL_20;
        }
      }
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v19 setType:1];
    [v19 setKey:v7];
    [v19 setUnformattedValue:v8];
    if (v19)
    {
      v22[0] = v19;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

LABEL_21:
      goto LABEL_22;
    }
LABEL_20:
    v6 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_21;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F84888]);
  [v7 setType:1];
  id v8 = (id)*MEMORY[0x1E4F876C8];
  uint64_t v9 = [v3 stringForSemanticKey:v8];
  if (!v9)
  {
    id v16 = (id)*MEMORY[0x1E4F876E0];

    uint64_t v17 = [v3 stringForSemanticKey:v16];
    if (v17)
    {
      v10 = (void *)v17;
      id v8 = v16;
      goto LABEL_13;
    }
    id v8 = (id)*MEMORY[0x1E4F877A0];

    uint64_t v9 = [v3 stringForSemanticKey:v8];
  }
  v10 = (void *)v9;
LABEL_13:
  [v7 setKey:v8];
  [v7 setUnformattedValue:v10];
  id v21 = v7;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
LABEL_22:

LABEL_23:

  return v6;
}

+ (id)secondaryFieldsForPass:(id)a3
{
  id v3 = a3;
  id v4 = [v3 seatingInformation];
  uint64_t v5 = [v4 firstSeat];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [v5 designation];
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F876A0];
    id v9 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v9 setType:2];
    [v9 setTextAlignment:1];
    [v9 setKey:v8];
    v10 = PKLocalizedTicketingString(&cfstr_LabelSeatNumbe.isa);
    [v9 setLabel:v10];

    v11 = objc_msgSend(v7, "pk_uppercaseStringForPreferredLocale");
    [v9 setUnformattedValue:v11];

    [v6 addObject:v9];
  }
  v12 = [v5 row];

  if (v12)
  {
    uint64_t v13 = *MEMORY[0x1E4F876A8];
    id v14 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v14 setType:2];
    [v14 setTextAlignment:1];
    [v14 setKey:v13];
    uint64_t v15 = PKLocalizedTicketingString(&cfstr_LabelSeatRow.isa);
    [v14 setLabel:v15];

    id v16 = objc_msgSend(v12, "pk_uppercaseStringForPreferredLocale");
    [v14 setUnformattedValue:v16];

    [v6 addObject:v14];
  }
  uint64_t v17 = [v5 section];

  if (v17)
  {
    uint64_t v18 = *MEMORY[0x1E4F876B0];
    id v19 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v19 setType:2];
    [v19 setTextAlignment:1];
    [v19 setKey:v18];
    v20 = PKLocalizedTicketingString(&cfstr_LabelSeatSecti.isa);
    [v19 setLabel:v20];

    id v21 = objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");
    [v19 setUnformattedValue:v21];

    [v6 addObject:v19];
  }
  v22 = [v5 aisle];

  if (v22)
  {
    uint64_t v23 = *MEMORY[0x1E4F87690];
    id v24 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v24 setType:2];
    [v24 setTextAlignment:1];
    [v24 setKey:v23];
    v25 = PKLocalizedTicketingString(&cfstr_LabelSeatAisle.isa);
    [v24 setLabel:v25];

    v26 = objc_msgSend(v22, "pk_uppercaseStringForPreferredLocale");
    [v24 setUnformattedValue:v26];

    [v6 addObject:v24];
  }
  v27 = [v5 level];

  if (v27)
  {
    uint64_t v28 = *MEMORY[0x1E4F87698];
    id v29 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v29 setType:2];
    [v29 setTextAlignment:1];
    [v29 setKey:v28];
    v30 = PKLocalizedTicketingString(&cfstr_LabelSeatLevel.isa);
    [v29 setLabel:v30];

    v31 = objc_msgSend(v27, "pk_uppercaseStringForPreferredLocale");
    [v29 setUnformattedValue:v31];

    [v6 addObject:v29];
  }
  uint64_t v32 = *MEMORY[0x1E4F87858];
  v33 = [v3 stringForSemanticKey:*MEMORY[0x1E4F87858]];

  if (v33)
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v34 setType:2];
    [v34 setTextAlignment:1];
    [v34 setKey:v32];
    v35 = PKLocalizedTicketingString(&cfstr_LabelEntranceP.isa);
    [v34 setLabel:v35];

    v36 = objc_msgSend(v33, "pk_uppercaseStringForPreferredLocale");
    [v34 setUnformattedValue:v36];

    [v6 addObject:v34];
  }
  uint64_t v37 = *MEMORY[0x1E4F87848];
  v38 = [v3 stringForSemanticKey:*MEMORY[0x1E4F87848]];

  if (v38)
  {
    id v39 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v39 setType:2];
    [v39 setTextAlignment:1];
    [v39 setKey:v37];
    v40 = PKLocalizedTicketingString(&cfstr_LabelEntranceD.isa);
    [v39 setLabel:v40];

    v41 = objc_msgSend(v38, "pk_uppercaseStringForPreferredLocale");
    [v39 setUnformattedValue:v41];

    [v6 addObject:v39];
  }
  uint64_t v42 = *MEMORY[0x1E4F87850];
  v43 = [v3 stringForSemanticKey:*MEMORY[0x1E4F87850]];

  if (v43)
  {
    id v44 = objc_alloc_init(MEMORY[0x1E4F84888]);
    [v44 setType:2];
    [v44 setTextAlignment:1];
    [v44 setKey:v42];
    v45 = PKLocalizedTicketingString(&cfstr_LabelEntranceG.isa);
    [v44 setLabel:v45];

    v46 = objc_msgSend(v43, "pk_uppercaseStringForPreferredLocale");
    [v44 setUnformattedValue:v46];

    [v6 addObject:v44];
  }
  uint64_t v47 = [v6 count];
  if (v47 >= 5) {
    objc_msgSend(v6, "removeObjectsInRange:", 4, v47 - 4);
  }

  return v6;
}

+ (id)auxiliaryFieldsForPass:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F84888]);
  [v4 setType:3];
  id v5 = (id)*MEMORY[0x1E4F87860];
  uint64_t v6 = [v3 stringForSemanticKey:v5];
  if (v6) {
    goto LABEL_2;
  }
  id v8 = (id)*MEMORY[0x1E4F87870];

  uint64_t v9 = [v3 stringForSemanticKey:v8];
  if (!v9)
  {
    id v5 = (id)*MEMORY[0x1E4F87878];

    uint64_t v6 = [v3 stringForSemanticKey:v5];
LABEL_2:
    id v7 = (void *)v6;
    goto LABEL_5;
  }
  id v7 = (void *)v9;
  id v5 = v8;
LABEL_5:
  [v4 setKey:v5];
  v10 = [v3 stringForSemanticKey:*MEMORY[0x1E4F876C0]];
  [v4 setLabel:v10];

  [v4 setUnformattedValue:v7];
  v13[0] = v4;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

@end