@interface MNTransitInstruction
+ (id)instructionForUncertainArrivalToStationStep:(id)a3 context:(int64_t)a4;
- (BOOL)hideTimeInstructionsWhenCollapsed;
- (GEOComposedString)countStopsString;
- (GEOComposedString)departureBarInstructionString;
- (GEOComposedString)expandableListString;
- (GEOComposedString)primaryTimeInstructionString;
- (GEOComposedString)secondaryTimeInstructionString;
- (GEOServerFormattedString)countStopsFormattedString;
- (GEOServerFormattedString)departureBarInstruction;
- (GEOServerFormattedString)expandableListFormattedString;
- (GEOServerFormattedString)primaryTimeInstruction;
- (GEOServerFormattedString)secondaryTimeinstruction;
- (MNTransitInstruction)initWithContext:(int64_t)a3;
- (NSArray)majorFormattedInstruction;
- (NSArray)majorInstructionStrings;
- (NSArray)minorFormattedInstruction;
- (NSArray)minorInstructionStrings;
- (NSArray)tertiaryFormattedInstruction;
- (NSArray)tertiaryInstructionStrings;
- (id)formattedInstructionForType:(int64_t)a3;
- (id)instructionSet;
- (id)instructionSetsForInstructionType:(int64_t)a3;
- (id)instructionStringForType:(int64_t)a3;
- (id)overridenInstructionsMapping;
- (int)departureBarFormatStyle;
- (int64_t)context;
- (int64_t)departureBarStyle;
- (void)_fillInInstructions;
- (void)setCountStopsFormattedString:(id)a3;
- (void)setCountStopsString:(id)a3;
- (void)setDepartureBarFormatStyle:(int)a3;
- (void)setDepartureBarInstruction:(id)a3;
- (void)setDepartureBarInstructionString:(id)a3;
- (void)setDepartureBarStyle:(int64_t)a3;
- (void)setExpandableListFormattedString:(id)a3;
- (void)setExpandableListString:(id)a3;
- (void)setHideTimeInstructionsWhenCollapsed:(BOOL)a3;
- (void)setMajorFormattedInstruction:(id)a3;
- (void)setMajorInstructionStrings:(id)a3;
- (void)setMinorFormattedInstruction:(id)a3;
- (void)setMinorInstructionStrings:(id)a3;
- (void)setPrimaryTimeInstruction:(id)a3;
- (void)setPrimaryTimeInstructionString:(id)a3;
- (void)setSecondaryTimeInstructionString:(id)a3;
- (void)setSecondaryTimeinstruction:(id)a3;
- (void)setTertiaryFormattedInstruction:(id)a3;
- (void)setTertiaryInstructionStrings:(id)a3;
@end

@implementation MNTransitInstruction

- (MNTransitInstruction)initWithContext:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MNTransitInstruction;
  v4 = [(MNTransitInstruction *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_context = a3;
    v6 = v4;
  }

  return v5;
}

+ (id)instructionForUncertainArrivalToStationStep:(id)a3 context:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = [v5 originStop];
    objc_super v8 = [v6 composedRoute];
    v9 = [v8 getStationForStop:v7];

    if (v9) {
      v10 = v9;
    }
    else {
      v10 = v7;
    }
    v12 = [v10 bestName];
    if (v12)
    {
      v13 = _MNLocalizedStringFromThisBundle(@"Transit_Instructions_UncertainArrivalWithStationName");
      v11 = objc_msgSend(NSString, "stringWithFormat:", v13, v12);
    }
    else
    {
      v11 = _MNLocalizedStringFromThisBundle(@"Transit_Instructions_UncertainArrivalWithNoStationName");
    }
  }
  else
  {
    v11 = _MNLocalizedStringFromThisBundle(@"Transit_Instructions_UncertainArrivalWithNoStationName_Spoken");
  }

  return v11;
}

- (void)_fillInInstructions
{
  int64_t v3 = [(MNTransitInstruction *)self context];
  if (v3 == 1)
  {
    v23 = [(MNTransitInstruction *)self instructionSetsForInstructionType:0];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_11;
    v79[3] = &unk_1E60F6510;
    id v5 = &v80;
    v80 = &__block_literal_global_1;
    v24 = MNMap(v23, v79);
    v25 = objc_msgSend(v24, "_navigation_firstObjectPassingTest:", &__block_literal_global_31);
    [(MNTransitInstruction *)self setMajorFormattedInstruction:v25];

    v26 = [(MNTransitInstruction *)self instructionSetsForInstructionType:1];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_12;
    v77[3] = &unk_1E60F6510;
    v9 = &v78;
    v78 = &__block_literal_global_1;
    v27 = MNMap(v26, v77);
    v28 = objc_msgSend(v27, "_navigation_firstObjectPassingTest:", &__block_literal_global_31);
    [(MNTransitInstruction *)self setMinorFormattedInstruction:v28];

    v29 = [(MNTransitInstruction *)self instructionSetsForInstructionType:2];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_13;
    v75[3] = &unk_1E60F6510;
    v13 = &v76;
    v76 = &__block_literal_global_1;
    v30 = MNMap(v29, v75);
    v31 = objc_msgSend(v30, "_navigation_firstObjectPassingTest:", &__block_literal_global_31);
    [(MNTransitInstruction *)self setTertiaryFormattedInstruction:v31];

    v32 = [(MNTransitInstruction *)self instructionSetsForInstructionType:0];
    v33 = __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v32, &__block_literal_global_48);
    [(MNTransitInstruction *)self setMajorInstructionStrings:v33];

    v34 = [(MNTransitInstruction *)self instructionSetsForInstructionType:1];
    v35 = __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v34, &__block_literal_global_50);
    [(MNTransitInstruction *)self setMinorInstructionStrings:v35];

    v20 = [(MNTransitInstruction *)self instructionSetsForInstructionType:2];
    v21 = v20;
    v22 = &__block_literal_global_52;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    v4 = [(MNTransitInstruction *)self instructionSetsForInstructionType:0];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_5;
    v85[3] = &unk_1E60F6510;
    id v5 = &v86;
    v86 = &__block_literal_global_1;
    v6 = MNMap(v4, v85);
    v7 = objc_msgSend(v6, "_navigation_firstObjectPassingTest:", &__block_literal_global_31);
    [(MNTransitInstruction *)self setMajorFormattedInstruction:v7];

    objc_super v8 = [(MNTransitInstruction *)self instructionSetsForInstructionType:1];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_6;
    v83[3] = &unk_1E60F6510;
    v9 = &v84;
    v84 = &__block_literal_global_1;
    v10 = MNMap(v8, v83);
    v11 = objc_msgSend(v10, "_navigation_firstObjectPassingTest:", &__block_literal_global_31);
    [(MNTransitInstruction *)self setMinorFormattedInstruction:v11];

    v12 = [(MNTransitInstruction *)self instructionSetsForInstructionType:2];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __43__MNTransitInstruction__fillInInstructions__block_invoke_7;
    v81[3] = &unk_1E60F6510;
    v13 = &v82;
    v82 = &__block_literal_global_1;
    v14 = MNMap(v12, v81);
    v15 = objc_msgSend(v14, "_navigation_firstObjectPassingTest:", &__block_literal_global_31);
    [(MNTransitInstruction *)self setTertiaryFormattedInstruction:v15];

    v16 = [(MNTransitInstruction *)self instructionSetsForInstructionType:0];
    v17 = __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v16, &__block_literal_global_42);
    [(MNTransitInstruction *)self setMajorInstructionStrings:v17];

    v18 = [(MNTransitInstruction *)self instructionSetsForInstructionType:1];
    v19 = __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v18, &__block_literal_global_44);
    [(MNTransitInstruction *)self setMinorInstructionStrings:v19];

    v20 = [(MNTransitInstruction *)self instructionSetsForInstructionType:2];
    v21 = v20;
    v22 = &__block_literal_global_46;
LABEL_5:
    v36 = __43__MNTransitInstruction__fillInInstructions__block_invoke_3(v20, v22);
    [(MNTransitInstruction *)self setTertiaryInstructionStrings:v36];
  }
  v37 = [(MNTransitInstruction *)self instructionSet];
  v38 = [v37 departureBarFormattedString];
  [(MNTransitInstruction *)self setDepartureBarInstruction:v38];

  v39 = [(MNTransitInstruction *)self instructionSet];
  -[MNTransitInstruction setDepartureBarStyle:](self, "setDepartureBarStyle:", [v39 departureBarFormatStyle]);

  id v40 = objc_alloc(MEMORY[0x1E4F644D0]);
  v41 = [(MNTransitInstruction *)self instructionSet];
  v42 = [v41 departureBar];
  v43 = (void *)[v40 initWithGeoFormattedString:v42];
  [(MNTransitInstruction *)self setDepartureBarInstructionString:v43];

  v44 = [(MNTransitInstruction *)self instructionSet];
  -[MNTransitInstruction setDepartureBarFormatStyle:](self, "setDepartureBarFormatStyle:", [v44 departureBarStyle]);

  v45 = [(MNTransitInstruction *)self instructionSet];
  v46 = [v45 countStopsFormattedString];
  [(MNTransitInstruction *)self setCountStopsFormattedString:v46];

  v47 = [(MNTransitInstruction *)self instructionSet];
  v48 = [v47 expandableListFormattedString];
  [(MNTransitInstruction *)self setExpandableListFormattedString:v48];

  id v49 = objc_alloc(MEMORY[0x1E4F644D0]);
  v50 = [(MNTransitInstruction *)self instructionSet];
  v51 = [v50 countStopsText];
  v52 = (void *)[v49 initWithGeoFormattedString:v51];
  [(MNTransitInstruction *)self setCountStopsString:v52];

  id v53 = objc_alloc(MEMORY[0x1E4F644D0]);
  v54 = [(MNTransitInstruction *)self instructionSet];
  v55 = [v54 transitListInstruction];
  v56 = [v55 expandableListFormatted];
  v57 = (void *)[v53 initWithGeoFormattedString:v56];
  [(MNTransitInstruction *)self setExpandableListString:v57];

  v58 = [(MNTransitInstruction *)self instructionSet];
  v59 = [v58 primaryTimeFormattedString];
  [(MNTransitInstruction *)self setPrimaryTimeInstruction:v59];

  v60 = [(MNTransitInstruction *)self instructionSet];
  v61 = [v60 secondaryTimeFormattedString];
  [(MNTransitInstruction *)self setSecondaryTimeinstruction:v61];

  id v62 = objc_alloc(MEMORY[0x1E4F644D0]);
  v63 = [(MNTransitInstruction *)self instructionSet];
  v64 = [v63 transitListInstruction];
  v65 = [v64 timeInstructions];
  v66 = [v65 primaryText];
  v67 = (void *)[v62 initWithGeoFormattedString:v66];
  [(MNTransitInstruction *)self setPrimaryTimeInstructionString:v67];

  id v68 = objc_alloc(MEMORY[0x1E4F644D0]);
  v69 = [(MNTransitInstruction *)self instructionSet];
  v70 = [v69 transitListInstruction];
  v71 = [v70 timeInstructions];
  v72 = [v71 secondaryText];
  v73 = (void *)[v68 initWithGeoFormattedString:v72];
  [(MNTransitInstruction *)self setSecondaryTimeInstructionString:v73];

  v74 = [(MNTransitInstruction *)self instructionSet];
  -[MNTransitInstruction setHideTimeInstructionsWhenCollapsed:](self, "setHideTimeInstructionsWhenCollapsed:", [v74 hideTimeInstructionsIfCollapsed]);
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [v2 formatStrings];
  v4 = [v3 firstObject];

  if ([v4 length]) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

BOOL __43__MNTransitInstruction__fillInInstructions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_3(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        v11 = objc_msgSend(v10, "_geo_compactMap:", &__block_literal_global_37, (void)v13);
        if ([v11 count])
        {

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 formatStrings];
  v4 = [v3 firstObject];
  uint64_t v5 = [v4 length];

  if (v5) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F644D0]) initWithGeoFormattedString:v2];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 transitListInstruction];
  v4 = [v3 commandFormatteds];
  uint64_t v5 = MNMap(v4, *(void **)(a1 + 32));

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 transitListInstruction];
  v4 = [v3 detailFormatteds];
  uint64_t v5 = MNMap(v4, *(void **)(a1 + 32));

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 transitListInstruction];
  v4 = [v3 noticeFormatteds];
  uint64_t v5 = MNMap(v4, *(void **)(a1 + 32));

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 transitListInstruction];
  id v3 = [v2 commandFormatteds];

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = [a2 transitListInstruction];
  id v3 = [v2 detailFormatteds];

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = [a2 transitListInstruction];
  id v3 = [v2 noticeFormatteds];

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = [a2 transitSignInstruction];
  v4 = [v3 commandFormatteds];
  uint64_t v5 = MNMap(v4, *(void **)(a1 + 32));

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = [a2 transitSignInstruction];
  v4 = [v3 detailFormatteds];
  uint64_t v5 = MNMap(v4, *(void **)(a1 + 32));

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = [a2 transitSignInstruction];
  v4 = [v3 noticeFormatteds];
  uint64_t v5 = MNMap(v4, *(void **)(a1 + 32));

  return v5;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = [a2 transitSignInstruction];
  id v3 = [v2 commandFormatteds];

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = [a2 transitSignInstruction];
  id v3 = [v2 detailFormatteds];

  return v3;
}

id __43__MNTransitInstruction__fillInInstructions__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = [a2 transitSignInstruction];
  id v3 = [v2 noticeFormatteds];

  return v3;
}

- (id)instructionSet
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "-[MNTransitInstruction instructionSet]";
    __int16 v6 = 2080;
    uint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
    __int16 v8 = 1024;
    int v9 = 240;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v4, 0x1Cu);
  }

  return 0;
}

- (id)overridenInstructionsMapping
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "-[MNTransitInstruction overridenInstructionsMapping]";
    __int16 v6 = 2080;
    uint64_t v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
    __int16 v8 = 1024;
    int v9 = 246;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v4, 0x1Cu);
  }

  return 0;
}

- (id)instructionSetsForInstructionType:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  __int16 v6 = [(MNTransitInstruction *)self overridenInstructionsMapping];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  __int16 v8 = [v6 objectForKeyedSubscript:v7];
  int v9 = [v8 instructions];

  if (v9) {
    [v5 addObject:v9];
  }
  uint64_t v10 = [(MNTransitInstruction *)self instructionSet];

  if (v10)
  {
    v11 = [(MNTransitInstruction *)self instructionSet];
    [v5 addObject:v11];
  }
  v12 = (void *)[v5 copy];

  return v12;
}

- (id)formattedInstructionForType:(int64_t)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      uint64_t v4 = [(MNTransitInstruction *)self majorFormattedInstruction];
      goto LABEL_8;
    case 1:
      uint64_t v4 = [(MNTransitInstruction *)self minorFormattedInstruction];
      goto LABEL_8;
    case 2:
      uint64_t v4 = [(MNTransitInstruction *)self tertiaryFormattedInstruction];
LABEL_8:
      __int16 v6 = (void *)v4;
      goto LABEL_16;
    case 3:
      uint64_t v7 = [(MNTransitInstruction *)self primaryTimeInstruction];
      if (!v7) {
        goto LABEL_14;
      }
      __int16 v8 = [(MNTransitInstruction *)self primaryTimeInstruction];
      v19[0] = v8;
      int v9 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v10 = (void **)v19;
      goto LABEL_13;
    case 4:
      uint64_t v7 = [(MNTransitInstruction *)self secondaryTimeinstruction];
      if (v7)
      {
        __int16 v8 = [(MNTransitInstruction *)self secondaryTimeinstruction];
        uint64_t v18 = v8;
        int v9 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v10 = &v18;
LABEL_13:
        __int16 v6 = [v9 arrayWithObjects:v10 count:1];
      }
      else
      {
LABEL_14:
        __int16 v6 = 0;
      }

LABEL_16:
      return v6;
    default:
      uint64_t v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315650;
        long long v13 = "-[MNTransitInstruction formattedInstructionForType:]";
        __int16 v14 = 2080;
        long long v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
        __int16 v16 = 1024;
        int v17 = 288;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v12, 0x1Cu);
      }

      __int16 v6 = 0;
      goto LABEL_16;
  }
}

- (id)instructionStringForType:(int64_t)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      uint64_t v4 = [(MNTransitInstruction *)self majorInstructionStrings];
      goto LABEL_8;
    case 1:
      uint64_t v4 = [(MNTransitInstruction *)self minorInstructionStrings];
      goto LABEL_8;
    case 2:
      uint64_t v4 = [(MNTransitInstruction *)self tertiaryInstructionStrings];
LABEL_8:
      __int16 v6 = (void *)v4;
      goto LABEL_16;
    case 3:
      uint64_t v7 = [(MNTransitInstruction *)self primaryTimeInstructionString];
      if (!v7) {
        goto LABEL_14;
      }
      __int16 v8 = [(MNTransitInstruction *)self primaryTimeInstructionString];
      v19[0] = v8;
      int v9 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v10 = (void **)v19;
      goto LABEL_13;
    case 4:
      uint64_t v7 = [(MNTransitInstruction *)self secondaryTimeInstructionString];
      if (v7)
      {
        __int16 v8 = [(MNTransitInstruction *)self secondaryTimeInstructionString];
        uint64_t v18 = v8;
        int v9 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v10 = &v18;
LABEL_13:
        __int16 v6 = [v9 arrayWithObjects:v10 count:1];
      }
      else
      {
LABEL_14:
        __int16 v6 = 0;
      }

LABEL_16:
      return v6;
    default:
      uint64_t v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315650;
        long long v13 = "-[MNTransitInstruction instructionStringForType:]";
        __int16 v14 = 2080;
        long long v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
        __int16 v16 = 1024;
        int v17 = 312;
        _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v12, 0x1Cu);
      }

      __int16 v6 = 0;
      goto LABEL_16;
  }
}

- (int64_t)context
{
  return self->_context;
}

- (NSArray)majorInstructionStrings
{
  return self->_majorInstructionStrings;
}

- (void)setMajorInstructionStrings:(id)a3
{
}

- (NSArray)minorInstructionStrings
{
  return self->_minorInstructionStrings;
}

- (void)setMinorInstructionStrings:(id)a3
{
}

- (NSArray)tertiaryInstructionStrings
{
  return self->_tertiaryInstructionStrings;
}

- (void)setTertiaryInstructionStrings:(id)a3
{
}

- (int64_t)departureBarStyle
{
  return self->_departureBarStyle;
}

- (void)setDepartureBarStyle:(int64_t)a3
{
  self->_departureBarStyle = a3;
}

- (GEOComposedString)departureBarInstructionString
{
  return self->_departureBarInstructionString;
}

- (void)setDepartureBarInstructionString:(id)a3
{
}

- (int)departureBarFormatStyle
{
  return self->_departureBarFormatStyle;
}

- (void)setDepartureBarFormatStyle:(int)a3
{
  self->_departureBarFormatStyle = a3;
}

- (GEOComposedString)countStopsString
{
  return self->_countStopsString;
}

- (void)setCountStopsString:(id)a3
{
}

- (GEOComposedString)expandableListString
{
  return self->_expandableListString;
}

- (void)setExpandableListString:(id)a3
{
}

- (GEOComposedString)primaryTimeInstructionString
{
  return self->_primaryTimeInstructionString;
}

- (void)setPrimaryTimeInstructionString:(id)a3
{
}

- (GEOComposedString)secondaryTimeInstructionString
{
  return self->_secondaryTimeInstructionString;
}

- (void)setSecondaryTimeInstructionString:(id)a3
{
}

- (BOOL)hideTimeInstructionsWhenCollapsed
{
  return self->_hideTimeInstructionsWhenCollapsed;
}

- (void)setHideTimeInstructionsWhenCollapsed:(BOOL)a3
{
  self->_hideTimeInstructionsWhenCollapsed = a3;
}

- (NSArray)majorFormattedInstruction
{
  return self->_majorFormattedInstruction;
}

- (void)setMajorFormattedInstruction:(id)a3
{
}

- (NSArray)minorFormattedInstruction
{
  return self->_minorFormattedInstruction;
}

- (void)setMinorFormattedInstruction:(id)a3
{
}

- (NSArray)tertiaryFormattedInstruction
{
  return self->_tertiaryFormattedInstruction;
}

- (void)setTertiaryFormattedInstruction:(id)a3
{
}

- (GEOServerFormattedString)departureBarInstruction
{
  return self->_departureBarInstruction;
}

- (void)setDepartureBarInstruction:(id)a3
{
}

- (GEOServerFormattedString)countStopsFormattedString
{
  return self->_countStopsFormattedString;
}

- (void)setCountStopsFormattedString:(id)a3
{
}

- (GEOServerFormattedString)expandableListFormattedString
{
  return self->_expandableListFormattedString;
}

- (void)setExpandableListFormattedString:(id)a3
{
}

- (GEOServerFormattedString)primaryTimeInstruction
{
  return self->_primaryTimeInstruction;
}

- (void)setPrimaryTimeInstruction:(id)a3
{
}

- (GEOServerFormattedString)secondaryTimeinstruction
{
  return self->_secondaryTimeinstruction;
}

- (void)setSecondaryTimeinstruction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTimeinstruction, 0);
  objc_storeStrong((id *)&self->_primaryTimeInstruction, 0);
  objc_storeStrong((id *)&self->_expandableListFormattedString, 0);
  objc_storeStrong((id *)&self->_countStopsFormattedString, 0);
  objc_storeStrong((id *)&self->_departureBarInstruction, 0);
  objc_storeStrong((id *)&self->_tertiaryFormattedInstruction, 0);
  objc_storeStrong((id *)&self->_minorFormattedInstruction, 0);
  objc_storeStrong((id *)&self->_majorFormattedInstruction, 0);
  objc_storeStrong((id *)&self->_secondaryTimeInstructionString, 0);
  objc_storeStrong((id *)&self->_primaryTimeInstructionString, 0);
  objc_storeStrong((id *)&self->_expandableListString, 0);
  objc_storeStrong((id *)&self->_countStopsString, 0);
  objc_storeStrong((id *)&self->_departureBarInstructionString, 0);
  objc_storeStrong((id *)&self->_tertiaryInstructionStrings, 0);
  objc_storeStrong((id *)&self->_minorInstructionStrings, 0);
  objc_storeStrong((id *)&self->_majorInstructionStrings, 0);
}

@end