@interface PKCompoundInterestCalculator
- (BOOL)_date:(id)a3 isApplicableForProcessingDate:(id)a4;
- (BOOL)_interestCanBeCalculated;
- (PKCompoundInterestCalculator)initWithConfiguration:(id)a3;
- (PKCompoundInterestCalculatorConfiguration)configuration;
- (id)_additionalBalanceForProcessingDate:(id)a3;
- (id)_creditsForProcessingDate:(id)a3;
- (id)_rawCompoundInterestForPaymentOfAmount:(id)a3 onDate:(id)a4 includeNewBalance:(BOOL)a5;
- (id)_rawUnpostedInterestCalculationForPaymentOfAmount:(id)a3 onDate:(id)a4 includeNewPurchases:(BOOL)a5;
- (id)compoundInterest;
- (id)compoundInterestForPaymentOfAmount:(id)a3 onDate:(id)a4;
- (id)compoundInterestWithPaymentOfAmount:(id)a3;
@end

@implementation PKCompoundInterestCalculator

- (PKCompoundInterestCalculator)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCompoundInterestCalculator;
  v6 = [(PKCompoundInterestCalculator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    toDateCache = v7->_toDateCache;
    v7->_toDateCache = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (id)compoundInterest
{
  return [(PKCompoundInterestCalculator *)self compoundInterestWithPaymentOfAmount:0];
}

- (id)compoundInterestWithPaymentOfAmount:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [(PKCompoundInterestCalculator *)self compoundInterestForPaymentOfAmount:v5 onDate:v6];

  return v7;
}

- (BOOL)_interestCanBeCalculated
{
  configuration = self->_configuration;
  if (!configuration) {
    return 0;
  }
  BOOL v4 = [(PKCompoundInterestCalculatorConfiguration *)configuration isInDisasterRecovery];
  id v5 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration apr];
  int64_t v6 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration compoundingPeriods];
  v7 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartDate];
  uint64_t v8 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodEndDate];
  v9 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartingBalance];
  if (v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C28] notANumber];
    if ([v5 isEqual:v10])
    {
      BOOL v11 = 0;
    }
    else
    {
      v12 = [MEMORY[0x1E4F28C28] notANumber];
      unsigned int v13 = (v6 > 0) & ~[v9 isEqual:v12];
      if (!v7) {
        LOBYTE(v13) = 0;
      }
      if (!v8) {
        LOBYTE(v13) = 0;
      }
      BOOL v11 = v13 & !v4;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)compoundInterestForPaymentOfAmount:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C28] zero];
    if (v7) {
      goto LABEL_3;
    }
  }
  id v7 = [MEMORY[0x1E4F1C9C8] date];
LABEL_3:
  if (![(PKCompoundInterestCalculator *)self _interestCanBeCalculated]) {
    goto LABEL_39;
  }
  v9 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration remainingPeriodStartingBalanceForGracePurposes];
  uint64_t v10 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v11 = [v9 compare:v10];

  configuration = self->_configuration;
  if (v11 != 1)
  {
    v14 = [(PKCompoundInterestCalculatorConfiguration *)configuration unpostedInterest];
    if (!v14) {
      goto LABEL_38;
    }
    v19 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v20 = [v14 compare:v19];

    if (v20 != 1) {
      goto LABEL_38;
    }
    PKRoundDecimalNumberToPlaces(v14, 2);
    uint64_t v8 = v21 = v8;
    goto LABEL_37;
  }
  BOOL v13 = [(PKCompoundInterestCalculatorConfiguration *)configuration inGrace];
  v14 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration unpostedInterest];
  uint64_t v38 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration unpostedInterestTimestamp];
  v39 = v9;
  v15 = [v9 decimalNumberBySubtracting:v6];
  v16 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v17 = [v15 compare:v16];

  if (v13)
  {
    if (v17 != 1)
    {
      if (!v14
        || ([MEMORY[0x1E4F28C28] zero],
            v26 = objc_claimAutoreleasedReturnValue(),
            uint64_t v27 = [v14 compare:v26],
            v26,
            v27 != 1))
      {
        v21 = (void *)v38;
        v9 = v39;
        goto LABEL_37;
      }
      id v28 = v14;
LABEL_31:
      id v36 = v28;
      v21 = (void *)v38;
      v9 = v39;
LABEL_36:

      uint64_t v8 = v36;
      goto LABEL_37;
    }
    unint64_t v18 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration calculationMethod];
    goto LABEL_14;
  }
  unint64_t v18 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration calculationMethod];
  if (v17 == 1)
  {
LABEL_14:
    if (v18 != 1)
    {
      v21 = (void *)v38;
      v9 = v39;
      if (!v18)
      {
        v22 = self;
        id v23 = v6;
        id v24 = v7;
        uint64_t v25 = 1;
        goto LABEL_34;
      }
      goto LABEL_37;
    }
    v32 = self;
    id v33 = v6;
    id v34 = v7;
    uint64_t v35 = 1;
    goto LABEL_30;
  }
  if (v18 == 1)
  {
    v32 = self;
    id v33 = v6;
    id v34 = v7;
    uint64_t v35 = 0;
LABEL_30:
    id v28 = [(PKCompoundInterestCalculator *)v32 _rawUnpostedInterestCalculationForPaymentOfAmount:v33 onDate:v34 includeNewPurchases:v35];
    goto LABEL_31;
  }
  v21 = (void *)v38;
  v9 = v39;
  if (!v18)
  {
    if (v14)
    {
      v29 = [MEMORY[0x1E4F28C28] zero];
      if ([v14 compare:v29] == 1 && v38)
      {
        BOOL v30 = [(PKCompoundInterestCalculator *)self _date:v7 isApplicableForProcessingDate:v38];

        if (v30)
        {
          uint64_t v31 = PKRoundDecimalNumberToPlaces(v14, 2);
LABEL_35:
          id v36 = (id)v31;
          goto LABEL_36;
        }
      }
      else
      {
      }
    }
    v22 = self;
    id v23 = v6;
    id v24 = v7;
    uint64_t v25 = 0;
LABEL_34:
    uint64_t v31 = [(PKCompoundInterestCalculator *)v22 _rawCompoundInterestForPaymentOfAmount:v23 onDate:v24 includeNewBalance:v25];
    goto LABEL_35;
  }
LABEL_37:

LABEL_38:
LABEL_39:

  return v8;
}

- (id)_rawCompoundInterestForPaymentOfAmount:(id)a3 onDate:(id)a4 includeNewBalance:(BOOL)a5
{
  BOOL v34 = a5;
  id v32 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartingBalance];
  v9 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartDate];
  id v36 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodEndDate];
  if ([(PKCompoundInterestCalculatorConfiguration *)self->_configuration inGrace])
  {
    uint64_t v10 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartDate];

    id v7 = (id)v10;
  }
  uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
  v12 = [MEMORY[0x1E4F28C28] zero];
  id v13 = v9;
  id v14 = v8;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v15 setDay:1];
  uint64_t v31 = v13;
  uint64_t v35 = v14;
  if ([(NSCalendar *)self->_calendar compareDate:v13 toDate:v36 toUnitGranularity:16] == NSOrderedAscending)
  {
    id v33 = v7;
    do
    {
      uint64_t v17 = v14;
      unint64_t v18 = v12;
      v19 = -[PKCompoundInterestCalculator _creditsForProcessingDate:](self, "_creditsForProcessingDate:", v13, v31);
      id v14 = [v14 decimalNumberByAdding:v19];

      v12 = [v12 decimalNumberBySubtracting:v19];

      if (v34)
      {
        uint64_t v20 = [(PKCompoundInterestCalculator *)self _additionalBalanceForProcessingDate:v13];
        uint64_t v21 = [v14 decimalNumberByAdding:v20];

        id v14 = (id)v21;
      }
      if ([(PKCompoundInterestCalculator *)self _date:v7 isApplicableForProcessingDate:v13])
      {
        uint64_t v22 = [v14 decimalNumberBySubtracting:v32];

        id v7 = v33;
        uint64_t v23 = [v12 decimalNumberByAdding:v32];

        id v14 = (id)v22;
        v12 = (void *)v23;
      }
      if ([v12 compare:v35] == -1)
      {
        id v24 = [v14 decimalNumberByAdding:v11];
        uint64_t v25 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration apr];
        v26 = PKCompoundInterestForPrincipal(v24, 1, v25, [(PKCompoundInterestCalculatorConfiguration *)self->_configuration compoundingPeriods]);

        uint64_t v27 = PKRoundDecimalNumberToPlaces(v26, 7);

        uint64_t v28 = [v11 decimalNumberByAdding:v27];

        uint64_t v11 = (void *)v28;
        id v7 = v33;
      }
      v16 = [(NSCalendar *)self->_calendar dateByAddingComponents:v15 toDate:v13 options:0];

      id v13 = v16;
    }
    while ([(NSCalendar *)self->_calendar compareDate:v16 toDate:v36 toUnitGranularity:16] == NSOrderedAscending);
  }
  else
  {
    v16 = v13;
  }
  v29 = PKRoundDecimalNumberToPlaces(v11, 2);

  return v29;
}

- (id)_rawUnpostedInterestCalculationForPaymentOfAmount:(id)a3 onDate:(id)a4 includeNewPurchases:(BOOL)a5
{
  BOOL v6 = a5;
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  v9 = (PKCompoundInterestCalculator *)a3;
  id v10 = a4;
  uint64_t v11 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration remainingPeriodStartingBalance];
  v12 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration remainingPeriodMinimumPayment];
  id v13 = v12;
  unint64_t v14 = 0x1E4F28000uLL;
  if (v12)
  {
    id v133 = v12;
  }
  else
  {
    id v133 = [MEMORY[0x1E4F28C28] zero];
  }
  id v15 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration remainingPeriodMinimumPaymentExcludedFromInterestCalculation];
  v16 = v15;
  if (v15)
  {
    id v129 = v15;
  }
  else
  {
    id v129 = [MEMORY[0x1E4F28C28] zero];
  }
  uint64_t v17 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartDate];
  v141 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodEndDate];
  unint64_t v18 = -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v17);
  uint64_t v142 = [v18 day];

  BOOL v19 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration inGrace];
  BOOL v20 = v19;
  v127 = v17;
  if (v19)
  {
    uint64_t v17 = v17;

    id v10 = v17;
  }
  v138 = [MEMORY[0x1E4F28C28] zero];
  v132 = v11;
  v128 = v9;
  if (v9)
  {
    uint64_t v21 = v9;
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F28C28] zero];

    uint64_t v21 = v22;
  }
  uint64_t v23 = v133;
  v126 = v21;
  v131 = v132;
  if (([(PKCompoundInterestCalculator *)v21 pk_isGreaterThanOrEqualTo:v133] & 1) == 0)
  {
    uint64_t v17 = v126;
    if ([(PKCompoundInterestCalculator *)v126 pk_isLessThan:v133]
      && ([v133 decimalNumberBySubtracting:v129],
          id v24 = objc_claimAutoreleasedReturnValue(),
          int v25 = [(PKCompoundInterestCalculator *)v126 pk_isGreaterThan:v24],
          v24,
          uint64_t v23 = v133,
          v25))
    {
      v26 = [v133 decimalNumberBySubtracting:v126];
      uint64_t v17 = v132;
      v131 = [(PKCompoundInterestCalculator *)v132 decimalNumberBySubtracting:v26];
    }
    else
    {
      uint64_t v27 = [v23 decimalNumberBySubtracting:v129];
      int v28 = [(PKCompoundInterestCalculator *)v126 pk_isLessThanOrEqualTo:v27];

      uint64_t v23 = v133;
      v131 = v132;
      if (!v28) {
        goto LABEL_19;
      }
      v26 = v132;
      v131 = [(PKCompoundInterestCalculator *)v132 decimalNumberBySubtracting:v129];
    }

    uint64_t v23 = v133;
  }
LABEL_19:
  v134 = self;
  id v130 = v10;
  if (v20)
  {
    v29 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration apr];
    BOOL v30 = PKCompoundInterestForPrincipal(v131, v142 + 1, v29, [(PKCompoundInterestCalculatorConfiguration *)self->_configuration compoundingPeriods]);

    uint64_t v31 = v138;
    v135 = [(PKCompoundInterestCalculator *)v138 decimalNumberByAdding:v30];
    id v32 = v128;
  }
  else
  {
    calendar = self->_calendar;
    BOOL v34 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration unpostedInterestTimestamp];
    uint64_t v35 = [(NSCalendar *)calendar components:16 fromDate:v34 toDate:v10 options:0];
    uint64_t v36 = [v35 day];
    uint64_t v37 = v142 + 1;
    if (v36 <= v142)
    {
      uint64_t v38 = self->_calendar;
      uint64_t v17 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration unpostedInterestTimestamp];
      id v5 = [(NSCalendar *)v38 components:16 fromDate:v17 toDate:v130 options:0];
      uint64_t v37 = [v5 day];
    }
    BOOL obj = v6;
    if (v37 < 1)
    {
      uint64_t v42 = 0;
    }
    else
    {
      v39 = self->_calendar;
      v40 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration unpostedInterestTimestamp];
      v41 = [(NSCalendar *)v39 components:16 fromDate:v40 toDate:v130 options:0];
      uint64_t v42 = v142 + 1;
      if ([v41 day] <= v142)
      {
        v43 = self->_calendar;
        v44 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration unpostedInterestTimestamp];
        [(NSCalendar *)v43 components:16 fromDate:v44 toDate:v130 options:0];
        v45 = self = v17;
        uint64_t v42 = [v45 day];

        uint64_t v17 = self;
      }

      unint64_t v14 = 0x1E4F28000;
    }
    if (v36 <= v142)
    {
    }
    v46 = [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration apr];
    v47 = PKCompoundInterestForPrincipal(v129, v42, v46, [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration compoundingPeriods]);

    v48 = [(PKCompoundInterestCalculator *)v138 decimalNumberBySubtracting:v47];

    BOOL v30 = [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration unpostedInterest];
    v49 = [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration unpostedInterestTimestamp];
    v50 = v49;
    v51 = v127;
    if (!v49
      || [(PKCompoundInterestCalculator *)v49 compare:v127] == -1
      || [(PKCompoundInterestCalculator *)v50 compare:v141] == 1)
    {
      v52 = v127;

      uint64_t v53 = [*(id *)(v14 + 3112) zero];

      BOOL v30 = (void *)v53;
      v50 = v52;
    }
    if (!v30
      || ([*(id *)(v14 + 3112) zero],
          v54 = objc_claimAutoreleasedReturnValue(),
          uint64_t v55 = [v30 compare:v54],
          v54,
          v55 == -1))
    {
      uint64_t v58 = [*(id *)(v14 + 3112) zero];

      v59 = v127;
      v57 = v50;
      BOOL v30 = (void *)v58;
      v50 = v59;
    }
    else
    {
      uint64_t v56 = [(PKCompoundInterestCalculator *)v48 decimalNumberByAdding:v30];
      v57 = v48;
      v48 = (PKCompoundInterestCalculator *)v56;
    }

    v60 = [(NSCalendar *)v134->_calendar components:16 fromDate:v50 toDate:v141 options:0];
    uint64_t v61 = [v60 day];
    uint64_t v62 = v142 + 1;
    if (v61 < v142)
    {
      v51 = [(NSCalendar *)v134->_calendar components:16 fromDate:v50 toDate:v141 options:0];
      uint64_t v62 = [v51 day] + 1;
    }
    if (v62 < 1)
    {
      uint64_t v31 = v50;
      uint64_t v64 = 0;
    }
    else
    {
      uint64_t v31 = v50;
      v63 = [(NSCalendar *)v134->_calendar components:16 fromDate:v50 toDate:v141 options:0];
      uint64_t v64 = v142 + 1;
      if ([v63 day] < v142)
      {
        v65 = [(NSCalendar *)v134->_calendar components:16 fromDate:v31 toDate:v141 options:0];
        uint64_t v64 = [v65 day] + 1;
      }
    }
    if (v61 < v142) {

    }
    v66 = [v131 decimalNumberByAdding:v30];
    uint64_t v17 = [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration apr];
    v67 = PKCompoundInterestForPrincipal(v66, v64, v17, [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration compoundingPeriods]);

    v135 = [(PKCompoundInterestCalculator *)v48 decimalNumberByAdding:v67];

    unint64_t v14 = 0x1E4F28000;
    id v32 = v128;
    if (v128)
    {
      BOOL v6 = obj;
      if ([(PKCompoundInterestCalculator *)v128 compare:v132] != -1)
      {
        v68 = [(NSCalendar *)v134->_calendar components:16 fromDate:v130 toDate:v141 options:0];
        uint64_t v69 = [v68 day];
        uint64_t v70 = v142 + 1;
        if (v69 < v142)
        {
          id v32 = [(NSCalendar *)v134->_calendar components:16 fromDate:v130 toDate:v141 options:0];
          uint64_t v70 = [(PKCompoundInterestCalculator *)v32 day] + 1;
        }
        v71 = v31;
        if (v70 < 1)
        {
          uint64_t v73 = 0;
        }
        else
        {
          v72 = [(NSCalendar *)v134->_calendar components:16 fromDate:v130 toDate:v141 options:0];
          uint64_t v73 = v142 + 1;
          if ([v72 day] < v142)
          {
            v74 = [(NSCalendar *)v134->_calendar components:16 fromDate:v130 toDate:v141 options:0];
            uint64_t v73 = [v74 day] + 1;
          }
        }
        if (v69 < v142) {

        }
        v75 = [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration apr];
        uint64_t v76 = PKCompoundInterestForPrincipal(v30, v73, v75, [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration compoundingPeriods]);

        v125 = (void *)v76;
        v77 = [v135 decimalNumberBySubtracting:v76];

        v78 = [(NSCalendar *)v134->_calendar components:16 fromDate:v71 toDate:v130 options:0];
        uint64_t v79 = [v78 day];
        uint64_t v80 = v142 + 1;
        if (v79 <= v142)
        {
          self = [(NSCalendar *)v134->_calendar components:16 fromDate:v71 toDate:v130 options:0];
          uint64_t v80 = [(PKCompoundInterestCalculator *)self day];
        }
        uint64_t v139 = v73;
        if (v80 < 1)
        {
          uint64_t v31 = v71;
          uint64_t v82 = 0;
        }
        else
        {
          uint64_t v31 = v71;
          v81 = [(NSCalendar *)v134->_calendar components:16 fromDate:v71 toDate:v130 options:0];
          uint64_t v82 = v142 + 1;
          if ([v81 day] <= v142)
          {
            v83 = [(NSCalendar *)v134->_calendar components:16 fromDate:v31 toDate:v130 options:0];
            uint64_t v82 = [v83 day];
          }
        }
        if (v79 <= v142) {

        }
        v84 = [v131 decimalNumberByAdding:v30];
        v85 = [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration apr];
        v86 = PKCompoundInterestForPrincipal(v84, v82, v85, [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration compoundingPeriods]);

        v87 = [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration apr];
        PKCompoundInterestForPrincipal(v86, v139, v87, [(PKCompoundInterestCalculatorConfiguration *)v134->_configuration compoundingPeriods]);
        uint64_t v17 = (PKCompoundInterestCalculator *)objc_claimAutoreleasedReturnValue();

        v135 = [v77 decimalNumberBySubtracting:v17];

        BOOL v6 = obj;
        unint64_t v14 = 0x1E4F28000uLL;
        id v32 = v128;
      }
    }
    else
    {
      BOOL v6 = obj;
    }

    id v10 = v130;
    uint64_t v23 = v133;
    self = v134;
  }

  if (v32)
  {
    v88 = [*(id *)(v14 + 3112) zero];
    uint64_t v89 = [(PKCompoundInterestCalculator *)v32 compare:v88];

    if (v89 == 1)
    {
      v90 = [(NSCalendar *)self->_calendar components:16 fromDate:v10 toDate:v141 options:0];
      uint64_t v91 = [v90 day];
      uint64_t v92 = v142 + 1;
      if (v91 < v142)
      {
        uint64_t v17 = [(NSCalendar *)self->_calendar components:16 fromDate:v10 toDate:v141 options:0];
        uint64_t v92 = [(PKCompoundInterestCalculator *)v17 day] + 1;
      }
      v93 = v32;
      if (v92 < 1)
      {
        uint64_t v95 = 0;
      }
      else
      {
        v94 = [(NSCalendar *)self->_calendar components:16 fromDate:v10 toDate:v141 options:0];
        uint64_t v95 = v142 + 1;
        if ([v94 day] < v142)
        {
          [(NSCalendar *)self->_calendar components:16 fromDate:v10 toDate:v141 options:0];
          v97 = BOOL v96 = v6;
          uint64_t v95 = [v97 day] + 1;

          BOOL v6 = v96;
        }
      }
      if (v91 < v142) {

      }
      if ([(PKCompoundInterestCalculator *)v93 compare:v132] == 1) {
        v98 = v132;
      }
      else {
        v98 = v93;
      }
      v99 = v98;
      v100 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration apr];
      uint64_t v101 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration compoundingPeriods];
      uint64_t v102 = v95;
      id v32 = v93;
      v103 = PKCompoundInterestForPrincipal(v99, v102, v100, v101);

      uint64_t v104 = [v135 decimalNumberBySubtracting:v103];

      v135 = (void *)v104;
    }
    uint64_t v23 = v133;
  }
  if (v6)
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id obja = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodTransactions];
    uint64_t v105 = [obja countByEnumeratingWithState:&v143 objects:v147 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v140 = *(void *)v144;
      do
      {
        for (uint64_t i = 0; i != v106; ++i)
        {
          if (*(void *)v144 != v140) {
            objc_enumerationMutation(obja);
          }
          v108 = *(void **)(*((void *)&v143 + 1) + 8 * i);
          v109 = [v108 transactionStatusChangedDate];
          v110 = v109;
          if (v109)
          {
            id v111 = v109;
          }
          else
          {
            id v111 = [v108 transactionDate];
          }
          v112 = [(NSCalendar *)self->_calendar components:16 fromDate:v111 toDate:v141 options:0];
          uint64_t v113 = [v112 day];
          uint64_t v114 = v142 + 1;
          if (v113 < v142)
          {
            id v10 = [(NSCalendar *)self->_calendar components:16 fromDate:v111 toDate:v141 options:0];
            uint64_t v114 = [v10 day] + 1;
          }
          if (v114 < 1)
          {
            uint64_t v116 = 0;
          }
          else
          {
            v115 = [(NSCalendar *)self->_calendar components:16 fromDate:v111 toDate:v141 options:0];
            uint64_t v116 = v142 + 1;
            if ([v115 day] < v142)
            {
              v117 = [(NSCalendar *)self->_calendar components:16 fromDate:v111 toDate:v141 options:0];
              uint64_t v116 = [v117 day] + 1;

              self = v134;
            }
          }
          if (v113 < v142) {

          }
          if (![v108 transactionType] && objc_msgSend(v108, "transactionStatus") == 1)
          {
            v118 = [v108 amount];
            v119 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration apr];
            v120 = PKCompoundInterestForPrincipal(v118, v116, v119, [(PKCompoundInterestCalculatorConfiguration *)self->_configuration compoundingPeriods]);

            uint64_t v121 = [v135 decimalNumberByAdding:v120];

            v135 = (void *)v121;
          }
        }
        uint64_t v106 = [obja countByEnumeratingWithState:&v143 objects:v147 count:16];
      }
      while (v106);
    }

    id v32 = v128;
    id v10 = v130;
    uint64_t v23 = v133;
  }
  v122 = PKRoundDecimalNumberToPlaces(v135, 2);

  id v123 = v122;
  return v123;
}

- (id)_additionalBalanceForProcessingDate:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C28] zero];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  BOOL v6 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodTransactions];
  uint64_t v30 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v30)
  {
    uint64_t v7 = *(void *)v32;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v6);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "transactionStatusChangedDate", v29);
        uint64_t v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [v9 transactionDate];
        }
        id v13 = v12;

        if ([(PKCompoundInterestCalculator *)self _date:v13 isApplicableForProcessingDate:v4])
        {
          if (![v9 transactionType] && objc_msgSend(v9, "transactionStatus") == 1)
          {
            unint64_t v14 = [v9 amount];
            uint64_t v15 = [v5 decimalNumberByAdding:v14];

            id v5 = (void *)v15;
          }
          if ([v9 transactionType] == 4)
          {
            v16 = [v9 amount];
            uint64_t v17 = [v5 decimalNumberByAdding:v16];

            id v5 = (void *)v17;
          }
          if ([v9 transactionType] == 7)
          {
            unint64_t v18 = v6;
            BOOL v19 = self;
            id v20 = v4;
            uint64_t v21 = [v9 amount];
            uint64_t v22 = [MEMORY[0x1E4F28C28] zero];
            uint64_t v23 = [v21 compare:v22];

            if (v23 == 1)
            {
              id v24 = [v9 amount];
              uint64_t v25 = [v5 decimalNumberByAdding:v24];

              id v5 = (void *)v25;
            }
            id v4 = v20;
            self = v19;
            BOOL v6 = v18;
            uint64_t v7 = v29;
          }
          if ([v9 transactionType] == 11)
          {
            v26 = [v9 amount];
            uint64_t v27 = [v5 decimalNumberByAdding:v26];

            id v5 = (void *)v27;
          }
        }
      }
      uint64_t v30 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v30);
  }

  return v5;
}

- (id)_creditsForProcessingDate:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C28] zero];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  BOOL v6 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodTransactions];
  id obj = (id)[v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (obj)
  {
    uint64_t v7 = *(void *)v49;
    id v41 = v4;
    do
    {
      for (uint64_t i = 0; i != obj; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(v6);
        }
        v9 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "transactionStatusChangedDate", v41);
        uint64_t v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [v9 transactionDate];
        }
        id v13 = v12;

        if ([(PKCompoundInterestCalculatorConfiguration *)self->_configuration inGrace])
        {
          uint64_t v14 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartDate];

          id v13 = (void *)v14;
        }
        if ([(PKCompoundInterestCalculator *)self _date:v13 isApplicableForProcessingDate:v4])
        {
          if ([v9 transactionType] == 1
            && ([v9 transactionStatus] == 1 || objc_msgSend(v9, "transactionStatus") == 3))
          {
            uint64_t v15 = [v9 amount];
            uint64_t v16 = [v5 decimalNumberByAdding:v15];

            id v5 = (void *)v16;
          }
          if ([v9 transactionType] == 7)
          {
            uint64_t v17 = v7;
            unint64_t v18 = v6;
            BOOL v19 = [v9 amount];
            id v20 = [MEMORY[0x1E4F28C28] zero];
            uint64_t v21 = [v19 compare:v20];

            if (v21 == -1)
            {
              uint64_t v22 = [v9 amount];
              uint64_t v23 = v5;
              id v5 = [v5 decimalNumberByAdding:v22];
            }
            BOOL v6 = v18;
            uint64_t v7 = v17;
            id v4 = v41;
          }
          if ([v9 transactionType] == 9)
          {
            id v24 = [v9 amount];
            uint64_t v25 = [v5 decimalNumberByAdding:v24];

            id v5 = (void *)v25;
          }
          if ([v9 transactionType] == 10)
          {
            v26 = [v9 amount];
            uint64_t v27 = [v5 decimalNumberByAdding:v26];

            id v5 = (void *)v27;
          }
        }
      }
      id obj = (id)[v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (obj);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obja = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration futurePayments];
  uint64_t v28 = [obja countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(obja);
        }
        long long v32 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        long long v33 = [v32 paymentDate];
        if ([(PKCompoundInterestCalculatorConfiguration *)self->_configuration inGrace])
        {
          uint64_t v34 = [(PKCompoundInterestCalculatorConfiguration *)self->_configuration periodStartDate];

          long long v33 = (void *)v34;
        }
        if ([(PKCompoundInterestCalculator *)self _date:v33 isApplicableForProcessingDate:v4])
        {
          uint64_t v35 = [v32 currencyAmount];
          uint64_t v36 = [v35 amount];

          if (v36)
          {
            uint64_t v37 = [MEMORY[0x1E4F28C28] zero];
            uint64_t v38 = [v36 compare:v37];

            if (v38 == 1)
            {
              uint64_t v39 = [v5 decimalNumberBySubtracting:v36];

              id v5 = (void *)v39;
            }
          }
        }
      }
      uint64_t v29 = [obja countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v29);
  }

  return v5;
}

- (BOOL)_date:(id)a3 isApplicableForProcessingDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_MergedGlobals_203 != -1) {
    dispatch_once(&_MergedGlobals_203, &__block_literal_global_32);
  }
  id v8 = v7;
  v9 = [(NSMutableDictionary *)self->_toDateCache objectForKey:v8];
  if (!v9)
  {
    v9 = [(NSCalendar *)self->_calendar dateByAddingComponents:qword_1EB402BF8 toDate:v8 options:0];
    [(NSMutableDictionary *)self->_toDateCache setObject:v9 forKey:v8];
  }
  uint64_t v10 = [v8 compare:v6];
  uint64_t v11 = [v9 compare:v6];
  BOOL v13 = v10 != 1 && v11 == 1;

  return v13;
}

uint64_t __68__PKCompoundInterestCalculator__date_isApplicableForProcessingDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v1 = (void *)qword_1EB402BF8;
  qword_1EB402BF8 = (uint64_t)v0;

  v2 = (void *)qword_1EB402BF8;
  return [v2 setDay:1];
}

- (PKCompoundInterestCalculatorConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_toDateCache, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end