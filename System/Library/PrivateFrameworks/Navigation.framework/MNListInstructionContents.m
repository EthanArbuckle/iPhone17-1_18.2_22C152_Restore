@interface MNListInstructionContents
+ (id)contentsWithStep:(id)a3;
- (BOOL)hasServerContent;
- (BOOL)suppressFallback;
- (BOOL)suppressNames;
- (GEOComposedString)distanceString;
- (GEOComposedWaypoint)destination;
- (GEOServerFormattedString)distanceFormat;
- (MNListInstructionContents)init;
- (NSArray)instructionFormats;
- (NSString)destinationName;
- (NSString)roadName;
- (double)distance;
- (id)_evaluatedStringsForInstructionStrings:(id)a3;
- (id)_instructionsForFormats:(id)a3;
- (id)description;
- (id)instruction;
- (id)instructionWithShorterAlternatives;
- (id)stringForDistance:(double)a3;
- (int)transportType;
- (int64_t)context;
- (unint64_t)_distanceFormatOptions;
- (void)_populateFromStep:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDistance:(double)a3;
- (void)setDistanceFormat:(id)a3;
- (void)setDistanceString:(id)a3;
- (void)setInstructionFormats:(id)a3;
- (void)setRoadName:(id)a3;
- (void)setSuppressFallback:(BOOL)a3;
- (void)setSuppressNames:(BOOL)a3;
- (void)setTransportType:(int)a3;
@end

@implementation MNListInstructionContents

+ (id)contentsWithStep:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    objc_msgSend(v5, "setTransportType:", objc_msgSend(v4, "transportType"));
    [v5 _populateFromStep:v4];
    id v6 = v5;
  }

  return v5;
}

- (MNListInstructionContents)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNListInstructionContents;
  v2 = [(MNListInstructionContents *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_maneuverType = 0x400000000;
    v2->_suppressFallback = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)_populateFromStep:(id)a3
{
  id v4 = a3;
  [v4 distance];
  -[MNListInstructionContents setDistance:](self, "setDistance:");
  id v5 = [v4 distanceStringForListView];
  [(MNListInstructionContents *)self setDistanceString:v5];

  objc_super v6 = [v4 instructionStringsForListView];
  instructionStrings = self->_instructionStrings;
  self->_instructionStrings = v6;

  v8 = [v4 geoStep];
  v9 = [v8 distanceForListView];
  [(MNListInstructionContents *)self setDistanceFormat:v9];

  id v11 = [v4 geoStep];

  v10 = [v11 instructionsForListView];
  [(MNListInstructionContents *)self setInstructionFormats:v10];
}

- (id)description
{
  if ([(NSArray *)self->_instructionStrings count])
  {
    v3 = NSString;
    id v4 = [(NSArray *)self->_instructionStrings firstObject];
    id v5 = [v3 stringWithFormat:@"MNListInstructionContents: \"%@\"", v4];
LABEL_5:

    goto LABEL_6;
  }
  objc_super v6 = [(MNListInstructionContents *)self instructionFormats];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = NSString;
    id v4 = [(MNListInstructionContents *)self instructionFormats];
    v9 = [v4 firstObject];
    id v5 = objc_msgSend(v8, "_navigation_stringForServerFormattedString:", v9);

    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)MNListInstructionContents;
  id v5 = [(MNListInstructionContents *)&v11 description];
LABEL_6:
  return v5;
}

- (int64_t)context
{
  return 2;
}

- (id)_evaluatedStringsForInstructionStrings:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke;
  v5[3] = &unk_1E60F7FB0;
  v5[4] = self;
  v3 = objc_msgSend(a3, "_geo_compactMap:", v5);
  return v3;
}

id __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2;
  v8[3] = &unk_1E60F7F88;
  v8[4] = *(void *)(a1 + 32);
  id v2 = a2;
  v3 = [v2 optionsWithArgumentHandler:v8];
  id v4 = [v2 stringResultWithOptions:v3];

  if ([v4 success])
  {
    id v5 = [v4 string];
    if ([v5 length])
    {
      objc_super v6 = [v4 string];
    }
    else
    {
      objc_super v6 = 0;
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

void __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 type] == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _distanceFormatOptions];
    id v4 = [v5 distanceFormat];
    [v4 setFormatOptions:v3];
  }
}

- (unint64_t)_distanceFormatOptions
{
  if ([(MNListInstructionContents *)self transportType] == 2) {
    return 3;
  }
  else {
    return 1;
  }
}

- (id)stringForDistance:(double)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v5 = a3;
  if (a3 < 0.0)
  {
    [(MNListInstructionContents *)self distance];
    double v5 = v6;
  }
  int64_t v7 = [(MNListInstructionContents *)self context];
  BOOL v8 = v7 != 0;
  if (self->_distanceString)
  {
    v9 = [(MNListInstructionContents *)self distanceString];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__MNListInstructionContents_stringForDistance___block_invoke;
    v19[3] = &unk_1E60FBD80;
    v19[4] = self;
    *(double *)&v19[5] = a3;
    v10 = [v9 optionsWithArgumentHandler:v19];

    objc_super v11 = [(GEOComposedString *)self->_distanceString stringWithOptions:v10];
  }
  else
  {
    int64_t v12 = v7;
    uint64_t v13 = 2 * ([(MNListInstructionContents *)self transportType] == 2);
    if (v5 >= 0.0)
    {
      v20 = @"{distance}";
      v15 = [NSNumber numberWithDouble:v5];
      v21[0] = v15;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    }
    else
    {
      v14 = 0;
    }
    v16 = NSString;
    v17 = [(MNListInstructionContents *)self distanceFormat];
    objc_super v11 = objc_msgSend(v16, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v17, v8, v13, v12 == 0, v14);
  }
  return v11;
}

void __47__MNListInstructionContents_stringForDistance___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 type] == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _distanceFormatOptions];
    id v4 = [v10 distanceFormat];
    [v4 setFormatOptions:v3];

    if (*(double *)(a1 + 40) >= 0.0)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28E28]);
      double v6 = *(double *)(a1 + 40);
      int64_t v7 = [MEMORY[0x1E4F291E0] meters];
      BOOL v8 = (void *)[v5 initWithDoubleValue:v7 unit:v6];
      v9 = [v10 distanceFormat];
      [v9 setOverrideValue:v8];
    }
  }
}

- (id)_instructionsForFormats:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v6 = [(MNListInstructionContents *)self transportType] == 2;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 2 * v6;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", *(void *)(*((void *)&v15 + 1) + 8 * i), 0, v10, 0, 0, (void)v15);
          if ([v13 length] && (objc_msgSend(v13, "_navigation_containsVariables") & 1) == 0) {
            [v5 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)instructionWithShorterAlternatives
{
  if ([(NSArray *)self->_instructionStrings count])
  {
    uint64_t v3 = [(MNListInstructionContents *)self _evaluatedStringsForInstructionStrings:self->_instructionStrings];
  }
  else
  {
    id v4 = [(MNListInstructionContents *)self instructionFormats];
    uint64_t v3 = [(MNListInstructionContents *)self _instructionsForFormats:v4];
  }
  return v3;
}

- (id)instruction
{
  id v2 = [(MNListInstructionContents *)self instructionWithShorterAlternatives];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (BOOL)hasServerContent
{
  if ([(NSArray *)self->_instructionStrings count]) {
    return 1;
  }
  id v4 = [(MNListInstructionContents *)self instructionFormats];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (void)setRoadName:(id)a3
{
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (GEOServerFormattedString)distanceFormat
{
  return self->_distanceFormat;
}

- (void)setDistanceFormat:(id)a3
{
}

- (NSArray)instructionFormats
{
  return self->_instructionFormats;
}

- (void)setInstructionFormats:(id)a3
{
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
}

- (BOOL)suppressNames
{
  return self->_suppressNames;
}

- (void)setSuppressNames:(BOOL)a3
{
  self->_suppressNames = a3;
}

- (BOOL)suppressFallback
{
  return self->_suppressFallback;
}

- (void)setSuppressFallback:(BOOL)a3
{
  self->_suppressFallback = a3;
}

- (GEOComposedString)distanceString
{
  return self->_distanceString;
}

- (void)setDistanceString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceString, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_instructionStrings, 0);
  objc_storeStrong((id *)&self->_towardNames, 0);
  objc_storeStrong((id *)&self->_branchNames, 0);
  objc_storeStrong((id *)&self->_exitNumber, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_intersectionName, 0);
  objc_storeStrong((id *)&self->_instructionFormats, 0);
  objc_storeStrong((id *)&self->_distanceFormat, 0);
}

@end