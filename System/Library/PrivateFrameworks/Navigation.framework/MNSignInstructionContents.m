@interface MNSignInstructionContents
+ (id)contentsWithStep:(id)a3 destination:(id)a4;
- (BOOL)hasServerContent;
- (NSArray)maneuverFormats;
- (id)_evaluatedStringsForInstructionStrings:(id)a3;
- (id)_instructionsForFormats:(id)a3;
- (id)description;
- (id)instructionWithShorterAlternatives;
- (int64_t)context;
- (unint64_t)_distanceFormatOptions;
- (void)_populateFromStep:(id)a3;
- (void)setManeuverFormats:(id)a3;
@end

@implementation MNSignInstructionContents

+ (id)contentsWithStep:(id)a3 destination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    objc_msgSend(v8, "setTransportType:", objc_msgSend(v6, "transportType"));
    [v8 setDestination:v7];
    v9 = [v7 navDisplayAddress];
    [v8 setDestinationName:v9];

    [v8 _populateFromStep:v6];
    id v10 = v8;
  }

  return v8;
}

- (void)_populateFromStep:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MNSignInstructionContents;
  id v4 = a3;
  [(MNListInstructionContents *)&v12 _populateFromStep:v4];
  v5 = objc_msgSend(v4, "distanceStringForSignView", v12.receiver, v12.super_class);
  [(MNListInstructionContents *)self setDistanceString:v5];

  id v6 = [v4 normalInstructionStringsForSignView];
  normalInstructionStrings = self->_normalInstructionStrings;
  self->_normalInstructionStrings = v6;

  id v8 = [v4 geoStep];
  v9 = [v8 distanceForSignView];
  [(MNListInstructionContents *)self setDistanceFormat:v9];

  id v10 = [v4 geoStep];

  v11 = [v10 normalInstructionsForSignView];
  [(MNSignInstructionContents *)self setManeuverFormats:v11];
}

- (id)description
{
  if ([(NSArray *)self->_normalInstructionStrings count])
  {
    v3 = NSString;
    id v4 = [(NSArray *)self->_normalInstructionStrings firstObject];
    v5 = [v3 stringWithFormat:@"MNSignInstructionContents: \"%@\"", v4];
LABEL_5:

    goto LABEL_6;
  }
  id v6 = [(MNSignInstructionContents *)self maneuverFormats];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = NSString;
    id v4 = [(MNSignInstructionContents *)self maneuverFormats];
    v9 = [v4 firstObject];
    v5 = objc_msgSend(v8, "_navigation_stringForServerFormattedString:", v9);

    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)MNSignInstructionContents;
  v5 = [(MNListInstructionContents *)&v11 description];
LABEL_6:
  return v5;
}

- (int64_t)context
{
  return 1;
}

- (id)_evaluatedStringsForInstructionStrings:(id)a3
{
  normalInstructionStrings = self->_normalInstructionStrings;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke;
  v6[3] = &unk_1E60F7FB0;
  v6[4] = self;
  id v4 = [(NSArray *)normalInstructionStrings _geo_compactMap:v6];
  return v4;
}

id __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2;
  v8[3] = &unk_1E60F7F88;
  v8[4] = *(void *)(a1 + 32);
  id v2 = a2;
  v3 = [v2 optionsWithArgumentHandler:v8];
  id v4 = [v2 stringResultWithOptions:v3];

  if ([v4 success])
  {
    v5 = [v4 string];
    if ([v5 length])
    {
      id v6 = [v4 string];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  int v3 = [v13 type];
  if (v3 == 10)
  {
    id v6 = [v13 token];
    int v7 = [v6 isEqualToString:@"{Name}"];

    if (v7)
    {
      v5 = [*(id *)(a1 + 32) destination];
      uint64_t v8 = [v5 navDisplayName];
    }
    else
    {
      v9 = [v13 token];
      int v10 = [v9 isEqualToString:@"{Address}"];

      if (!v10) {
        goto LABEL_10;
      }
      v5 = [*(id *)(a1 + 32) destination];
      uint64_t v8 = [v5 navDisplayAddress];
    }
    objc_super v11 = (void *)v8;
    objc_super v12 = [v13 stringFormat];
    [v12 setOverrideValue:v11];
  }
  else
  {
    if (v3 != 1) {
      goto LABEL_10;
    }
    uint64_t v4 = [*(id *)(a1 + 32) _distanceFormatOptions];
    v5 = [v13 distanceFormat];
    [v5 setFormatOptions:v4];
  }

LABEL_10:
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

- (id)_instructionsForFormats:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    BOOL v6 = [(MNListInstructionContents *)self transportType] == 2;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = [(MNListInstructionContents *)self destination];
    v9 = [v8 navDisplayAddress];

    if ([v9 length]) {
      [v7 setObject:v9 forKey:@"{Address}"];
    }
    int v10 = [(MNListInstructionContents *)self destination];
    objc_super v11 = [v10 navDisplayNameWithSpecialContacts:0];

    if ([v11 length]) {
      [v7 setObject:v11 forKey:@"{Name}"];
    }
    objc_super v12 = [(MNListInstructionContents *)self roadName];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v14 = [(MNListInstructionContents *)self roadName];
      [v7 setObject:v14 forKey:@"{Road}"];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v4;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 2 * v6;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", *(void *)(*((void *)&v24 + 1) + 8 * i), 0, v18, 0, v7);
          if ([v21 length] && (objc_msgSend(v21, "_navigation_containsVariables") & 1) == 0) {
            [v5 addObject:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)instructionWithShorterAlternatives
{
  if ([(NSArray *)self->_normalInstructionStrings count])
  {
    int v3 = [(MNSignInstructionContents *)self _evaluatedStringsForInstructionStrings:self->_normalInstructionStrings];
  }
  else
  {
    id v4 = [(MNSignInstructionContents *)self maneuverFormats];
    int v3 = [(MNSignInstructionContents *)self _instructionsForFormats:v4];
  }
  v5 = objc_msgSend(NSString, "_navigation_selectInstructionWithServerStringArray:isSpoken:clientBlock:", v3, 0, 0);

  return v5;
}

- (BOOL)hasServerContent
{
  if ([(NSArray *)self->_normalInstructionStrings count]) {
    return 1;
  }
  id v4 = [(MNSignInstructionContents *)self maneuverFormats];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (NSArray)maneuverFormats
{
  return self->_maneuverFormats;
}

- (void)setManeuverFormats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverFormats, 0);
  objc_storeStrong((id *)&self->_normalInstructionStrings, 0);
}

@end