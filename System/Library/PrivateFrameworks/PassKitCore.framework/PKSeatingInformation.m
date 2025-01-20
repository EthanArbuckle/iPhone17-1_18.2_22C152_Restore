@interface PKSeatingInformation
- (BOOL)seatsSpanMultipleSections;
- (NSArray)allSeats;
- (PKSeat)firstSeat;
- (PKSeatingInformation)init;
- (id)_allAisles;
- (id)_allLevels;
- (id)_allRows;
- (id)_allSectionColors;
- (id)_allSections;
- (id)changeMessageFromInformation:(id)a3;
- (id)displayableAllAislesString;
- (id)displayableAllLevelsString;
- (id)displayableAllRowsString;
- (id)displayableAllSeatsString;
- (id)displayableAllSectionsColor;
- (id)displayableAllSectionsString;
- (id)firstSeatContainingAttributes:(unint64_t)a3;
- (id)initFromSemantic:(id)a3;
- (id)initFromSemantics:(id)a3;
- (id)seatsContainingAttributes:(unint64_t)a3;
@end

@implementation PKSeatingInformation

- (PKSeatingInformation)init
{
  return 0;
}

- (id)initFromSemantic:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKSeatingInformation;
  v5 = [(PKSeatingInformation *)&v24 init];
  if (!v5) {
    goto LABEL_16;
  }
  v6 = [v4 semanticKey];
  int v7 = [@"seats" isEqualToString:v6];

  if (!v7) {
    goto LABEL_18;
  }
  id result = [v4 dictionariesValue];
  if (result)
  {
    id v9 = result;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = +[PKSeat createFromDictionary:](PKSeat, "createFromDictionary:", *(void *)(*((void *)&v20 + 1) + 8 * v15), (void)v20);
          if (v16)
          {
            if (([v10 containsObject:v16] & 1) == 0) {
              [v10 addObject:v16];
            }
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }

    if ([v10 count])
    {
      uint64_t v17 = [v10 copy];
      allSeats = v5->_allSeats;
      v5->_allSeats = (NSArray *)v17;

LABEL_16:
      v19 = v5;
LABEL_19:

      return v19;
    }

LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

- (id)initFromSemantics:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKSeatingInformation;
  v5 = [(PKSeatingInformation *)&v34 init];
  v6 = v5;
  if (v5)
  {
    long long v22 = v5;
    int v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v4;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          id v11 = [[PKSeatingInformation alloc] initFromSemantic:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          uint64_t v12 = [v11 allSeats];
          if ([v12 count])
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v27;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * j);
                  if (!-[NSArray containsObject:](v7, "containsObject:", v18, v22)) {
                    [(NSArray *)v7 addObject:v18];
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
              }
              while (v15);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    if (![(NSArray *)v7 count])
    {

      long long v20 = 0;
      v6 = v22;
      id v4 = v23;
      goto LABEL_24;
    }
    v6 = v22;
    allSeats = v22->_allSeats;
    v22->_allSeats = v7;

    id v4 = v23;
  }
  long long v20 = v6;
LABEL_24:

  return v20;
}

- (PKSeat)firstSeat
{
  return (PKSeat *)[(NSArray *)self->_allSeats firstObject];
}

- (id)firstSeatContainingAttributes:(unint64_t)a3
{
  allSeats = self->_allSeats;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PKSeatingInformation_firstSeatContainingAttributes___block_invoke;
  v6[3] = &__block_descriptor_40_e16_B16__0__PKSeat_8l;
  v6[4] = a3;
  id v4 = [(NSArray *)allSeats pk_firstObjectPassingTest:v6];
  return v4;
}

uint64_t __54__PKSeatingInformation_firstSeatContainingAttributes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsAttributes:*(void *)(a1 + 32)];
}

- (id)seatsContainingAttributes:(unint64_t)a3
{
  allSeats = self->_allSeats;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PKSeatingInformation_seatsContainingAttributes___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B32__0__PKSeat_8Q16_B24l;
  v6[4] = a3;
  id v4 = [(NSArray *)allSeats pk_objectsPassingTest:v6];
  return v4;
}

uint64_t __50__PKSeatingInformation_seatsContainingAttributes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsAttributes:*(void *)(a1 + 32)];
}

- (BOOL)seatsSpanMultipleSections
{
  v3 = [(PKSeatingInformation *)self _allLevels];
  if ((unint64_t)[v3 count] > 1)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v4 = [(PKSeatingInformation *)self _allSections];
    if ((unint64_t)[v4 count] <= 1)
    {
      v6 = [(PKSeatingInformation *)self _allRows];
      BOOL v5 = (unint64_t)[v6 count] > 1;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

- (id)displayableAllSeatsString
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [(PKSeatingInformation *)self seatsContainingAttributes:1];
  unint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 == 1)
    {
      BOOL v5 = [v3 firstObject];
      uint64_t v6 = [v5 designation];
      goto LABEL_4;
    }
    if (v4 < 5)
    {
      BOOL v5 = [(PKSeatingInformation *)self _allLevels];
      if ((unint64_t)[v5 count] < 2)
      {
        uint64_t v9 = [(PKSeatingInformation *)self _allSections];
        if ((unint64_t)[v9 count] < 2)
        {
          id v10 = [(PKSeatingInformation *)self _allRows];
          if ((unint64_t)[v10 count] < 2)
          {
            if (_MergedGlobals_290 != -1) {
              dispatch_once(&_MergedGlobals_290, &__block_literal_global_184);
            }
            long long v32 = v10;
            long long v33 = v9;
            objc_super v34 = v5;
            id v11 = (id)qword_1EB403630;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v12 = v3;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v38;
              LOBYTE(v16) = 1;
              LOBYTE(v17) = 1;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v38 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  v19 = [*(id *)(*((void *)&v37 + 1) + 8 * i) designation];
                  long long v20 = [v11 numberFromString:v19];

                  int v16 = (v20 == 0) & v16;
                  int v17 = (v20 != 0) & v17;
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
              }
              while (v14);
            }
            else
            {
              int v16 = 1;
              int v17 = 1;
            }

            long long v21 = objc_msgSend(v12, "pk_arrayByApplyingBlock:", &__block_literal_global_225);
            long long v22 = (void *)[v21 mutableCopy];

            if (v17)
            {
              v35[0] = MEMORY[0x1E4F143A8];
              v35[1] = 3221225472;
              v35[2] = __49__PKSeatingInformation_displayableAllSeatsString__block_invoke_2;
              v35[3] = &unk_1E56F6228;
              id v23 = v11;
              id v36 = v23;
              [v22 sortUsingComparator:v35];
              objc_super v24 = [v22 firstObject];
              uint64_t v25 = [v22 lastObject];
              long long v26 = [v23 numberFromString:v24];
              uint64_t v27 = [v26 integerValue];

              long long v28 = [v23 numberFromString:v25];
              uint64_t v29 = [v28 integerValue];

              if (v29 - v27 == [v22 count] - 1)
              {
                int v7 = PKLocalizedTicketingString(&cfstr_LocalizedNumbe.isa, &stru_1EE105568.isa, v24, v25);
              }
              else
              {
                long long v31 = PKLocalizedTicketingString(&cfstr_LocalizedListD.isa, 0);
                int v7 = [v22 componentsJoinedByString:v31];
              }
              uint64_t v9 = v33;
              BOOL v5 = v34;
              id v10 = v32;
            }
            else
            {
              if (v16)
              {
                [v22 sortUsingComparator:&__block_literal_global_87_0];
                long long v30 = PKLocalizedTicketingString(&cfstr_LocalizedListD.isa, 0);
                int v7 = [v22 componentsJoinedByString:v30];
              }
              else
              {
                int v7 = PKLocalizedTicketingString(&cfstr_LabelMultipleS.isa, 0);
              }
              uint64_t v9 = v33;
              BOOL v5 = v34;
              id v10 = v32;
            }
          }
          else
          {
            int v7 = PKLocalizedTicketingString(&cfstr_LabelMultipleS.isa, 0);
          }
        }
        else
        {
          int v7 = PKLocalizedTicketingString(&cfstr_LabelMultipleS.isa, 0);
        }

        goto LABEL_5;
      }
      uint64_t v6 = PKLocalizedTicketingString(&cfstr_LabelMultipleS.isa, 0);
LABEL_4:
      int v7 = (void *)v6;
LABEL_5:

      goto LABEL_9;
    }
    int v7 = PKLocalizedTicketingString(&cfstr_LabelMultipleS.isa, 0);
  }
  else
  {
    int v7 = 0;
  }
LABEL_9:

  return v7;
}

uint64_t __49__PKSeatingInformation_displayableAllSeatsString__block_invoke(uint64_t a1, void *a2)
{
  return [a2 designation];
}

uint64_t __49__PKSeatingInformation_displayableAllSeatsString__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  int v7 = [v5 numberFromString:a2];
  uint64_t v8 = [*(id *)(a1 + 32) numberFromString:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

uint64_t __49__PKSeatingInformation_displayableAllSeatsString__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

- (id)displayableAllRowsString
{
  v3 = [(PKSeatingInformation *)self _allLevels];
  if ((unint64_t)[v3 count] < 2)
  {
    BOOL v5 = [(PKSeatingInformation *)self _allSections];
    if ((unint64_t)[v5 count] < 2)
    {
      id v6 = [(PKSeatingInformation *)self _allRows];
      int v7 = v6;
      if (v6)
      {
        if ([v6 count] == 1) {
          [v7 anyObject];
        }
        else {
        unint64_t v4 = PKLocalizedTicketingString(&cfstr_LabelMultipleR.isa, 0);
        }
      }
      else
      {
        unint64_t v4 = 0;
      }
    }
    else
    {
      unint64_t v4 = PKLocalizedTicketingString(&cfstr_LabelMultipleR.isa, 0);
    }
  }
  else
  {
    unint64_t v4 = PKLocalizedTicketingString(&cfstr_LabelMultipleR.isa, 0);
  }

  return v4;
}

- (id)displayableAllSectionsString
{
  v3 = [(PKSeatingInformation *)self _allLevels];
  if ((unint64_t)[v3 count] < 2)
  {
    BOOL v5 = [(PKSeatingInformation *)self _allSections];
    id v6 = v5;
    if (v5)
    {
      if ([v5 count] == 1) {
        [v6 anyObject];
      }
      else {
      unint64_t v4 = PKLocalizedTicketingString(&cfstr_LabelMultipleS_0.isa, 0);
      }
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v4 = PKLocalizedTicketingString(&cfstr_LabelMultipleS_0.isa, 0);
  }

  return v4;
}

- (id)displayableAllAislesString
{
  v2 = [(PKSeatingInformation *)self _allAisles];
  v3 = v2;
  if (v2)
  {
    if ([v2 count] == 1) {
      [v3 anyObject];
    }
    else {
    unint64_t v4 = PKLocalizedTicketingString(&cfstr_LabelMultipleA.isa, 0);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)displayableAllLevelsString
{
  v2 = [(PKSeatingInformation *)self _allLevels];
  v3 = v2;
  if (v2)
  {
    if ([v2 count] == 1) {
      [v3 anyObject];
    }
    else {
    unint64_t v4 = PKLocalizedTicketingString(&cfstr_LabelMultipleL.isa, 0);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)displayableAllSectionsColor
{
  v2 = [(PKSeatingInformation *)self _allSectionColors];
  v3 = v2;
  if (v2 && [v2 count] == 1)
  {
    unint64_t v4 = [v3 anyObject];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)changeMessageFromInformation:(id)a3
{
  unint64_t v4 = [a3 firstSeat];
  BOOL v5 = [(PKSeatingInformation *)self firstSeat];
  id v6 = v5;
  if (v4 && v5)
  {
    if ([v5 isEqual:v4])
    {
LABEL_4:
      int v7 = 0;
      goto LABEL_23;
    }
  }
  else if (v5 == v4)
  {
    goto LABEL_4;
  }
  char v8 = [v6 diffFromSeat:v4];
  uint64_t v9 = v8 & 0x1F;
  id v10 = [v6 designation];
  id v11 = [v6 row];
  id v12 = [v6 section];
  uint64_t v13 = [v6 aisle];
  uint64_t v14 = [v6 level];
  uint64_t v15 = (void *)v14;
  if (v10 && v9 == 1)
  {
    PKLocalizedTicketingString(&cfstr_SemanticsSeats.isa, &stru_1EE0F6808.isa, v10);
  }
  else if (v11 && v9 == 2)
  {
    PKLocalizedTicketingString(&cfstr_SemanticsSeats_0.isa, &stru_1EE0F6808.isa, v11);
  }
  else if (v12 && v9 == 4)
  {
    PKLocalizedTicketingString(&cfstr_SemanticsSeats_1.isa, &stru_1EE0F6808.isa, v12);
  }
  else if (v13 && v9 == 8)
  {
    PKLocalizedTicketingString(&cfstr_SemanticsSeats_2.isa, &stru_1EE0F6808.isa, v12);
  }
  else
  {
    if (!v14 || v9 != 16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v15 && (v8 & 0x10) != 0)
      {
        uint64_t v18 = PKLocalizedTicketingString(&cfstr_SeatLevel.isa, &stru_1EE0F6808.isa, v15);
        [v17 addObject:v18];
      }
      if (v13 && (v8 & 8) != 0)
      {
        v19 = PKLocalizedTicketingString(&cfstr_SeatAisle.isa, &stru_1EE0F6808.isa, v13);
        [v17 addObject:v19];
      }
      if (v12 && (v8 & 4) != 0)
      {
        long long v20 = PKLocalizedTicketingString(&cfstr_SeatSection.isa, &stru_1EE0F6808.isa, v12);
        [v17 addObject:v20];
      }
      if (v11 && (v8 & 2) != 0)
      {
        long long v21 = PKLocalizedTicketingString(&cfstr_SeatRow.isa, &stru_1EE0F6808.isa, v11);
        [v17 addObject:v21];
      }
      if (v10 && (v8 & 1) != 0)
      {
        long long v22 = PKLocalizedTicketingString(&cfstr_SeatNumber.isa, &stru_1EE0F6808.isa, v10);
        [v17 addObject:v22];
      }
      id v23 = PKLocalizedTicketingString(&cfstr_LocalizedListD_0.isa, 0);
      [v17 componentsJoinedByString:v23];
      objc_super v24 = v25 = v17;
      int v7 = PKLocalizedTicketingString(&cfstr_SemanticsSeats_4.isa, &stru_1EE0F6808.isa, v24);

      goto LABEL_22;
    }
    PKLocalizedTicketingString(&cfstr_SemanticsSeats_3.isa, &stru_1EE0F6808.isa, v14);
  int v7 = };
LABEL_22:

LABEL_23:
  return v7;
}

- (id)_allSections
{
  v2 = [(PKSeatingInformation *)self seatsContainingAttributes:4];
  if ([v2 count]) {
    v3 = objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_140_1);
  }
  else {
    v3 = 0;
  }

  return v3;
}

uint64_t __36__PKSeatingInformation__allSections__block_invoke(uint64_t a1, void *a2)
{
  return [a2 section];
}

- (id)_allRows
{
  v2 = [(PKSeatingInformation *)self seatsContainingAttributes:2];
  if ([v2 count]) {
    v3 = objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_142_2);
  }
  else {
    v3 = 0;
  }

  return v3;
}

uint64_t __32__PKSeatingInformation__allRows__block_invoke(uint64_t a1, void *a2)
{
  return [a2 row];
}

- (id)_allAisles
{
  v2 = [(PKSeatingInformation *)self seatsContainingAttributes:8];
  if ([v2 count]) {
    v3 = objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_144_1);
  }
  else {
    v3 = 0;
  }

  return v3;
}

uint64_t __34__PKSeatingInformation__allAisles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 aisle];
}

- (id)_allLevels
{
  v2 = [(PKSeatingInformation *)self seatsContainingAttributes:16];
  if ([v2 count]) {
    v3 = objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_146_0);
  }
  else {
    v3 = 0;
  }

  return v3;
}

uint64_t __34__PKSeatingInformation__allLevels__block_invoke(uint64_t a1, void *a2)
{
  return [a2 level];
}

- (id)_allSectionColors
{
  v2 = [(PKSeatingInformation *)self seatsContainingAttributes:64];
  if ([v2 count]) {
    v3 = objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_149_1);
  }
  else {
    v3 = 0;
  }

  return v3;
}

uint64_t __41__PKSeatingInformation__allSectionColors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sectionColor];
}

- (NSArray)allSeats
{
  return self->_allSeats;
}

- (void).cxx_destruct
{
}

@end