@interface _SFPBMapCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)interactive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)pins;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)footnote;
- (NSString)footnoteLabel;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBColor)pinColor;
- (_SFPBLatLng)location;
- (_SFPBMapCardSection)initWithDictionary:(id)a3;
- (_SFPBMapCardSection)initWithFacade:(id)a3;
- (_SFPBMapCardSection)initWithJSON:(id)a3;
- (_SFPBMapRegion)boundingMapRegion;
- (id)dictionaryRepresentation;
- (id)pinsAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)pinBehavior;
- (int)separatorStyle;
- (int)sizeFormat;
- (unint64_t)hash;
- (unint64_t)pinsCount;
- (unint64_t)punchoutOptionsCount;
- (void)addPins:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPins;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setBoundingMapRegion:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPinBehavior:(int)a3;
- (void)setPinColor:(id)a3;
- (void)setPins:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSizeFormat:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMapCardSection

- (_SFPBMapCardSection)initWithFacade:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMapCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v54 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v10);
    }

    [(_SFPBMapCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBMapCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBMapCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBMapCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBMapCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBMapCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBMapCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBMapCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBMapCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 location];

    if (v24)
    {
      v25 = [_SFPBLatLng alloc];
      v26 = [v4 location];
      v27 = [(_SFPBLatLng *)v25 initWithFacade:v26];
      [(_SFPBMapCardSection *)v5 setLocation:v27];
    }
    v28 = [v4 pinColor];

    if (v28)
    {
      v29 = [_SFPBColor alloc];
      v30 = [v4 pinColor];
      v31 = [(_SFPBColor *)v29 initWithFacade:v30];
      [(_SFPBMapCardSection *)v5 setPinColor:v31];
    }
    v32 = [v4 footnoteLabel];

    if (v32)
    {
      v33 = [v4 footnoteLabel];
      [(_SFPBMapCardSection *)v5 setFootnoteLabel:v33];
    }
    v34 = [v4 footnote];

    if (v34)
    {
      v35 = [v4 footnote];
      [(_SFPBMapCardSection *)v5 setFootnote:v35];
    }
    if ([v4 hasInteractive]) {
      -[_SFPBMapCardSection setInteractive:](v5, "setInteractive:", [v4 interactive]);
    }
    if ([v4 hasSizeFormat]) {
      -[_SFPBMapCardSection setSizeFormat:](v5, "setSizeFormat:", [v4 sizeFormat]);
    }
    v36 = [v4 boundingMapRegion];

    if (v36)
    {
      v37 = [_SFPBMapRegion alloc];
      v38 = [v4 boundingMapRegion];
      v39 = [(_SFPBMapRegion *)v37 initWithFacade:v38];
      [(_SFPBMapCardSection *)v5 setBoundingMapRegion:v39];
    }
    if ([v4 hasPinBehavior]) {
      -[_SFPBMapCardSection setPinBehavior:](v5, "setPinBehavior:", [v4 pinBehavior]);
    }
    v40 = [v4 pins];
    if (v40) {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v41 = 0;
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v42 = objc_msgSend(v4, "pins", 0);
    uint64_t v43 = [v42 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v51 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [[_SFPBPin alloc] initWithFacade:*(void *)(*((void *)&v50 + 1) + 8 * j)];
          if (v47) {
            [v41 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v44);
    }

    [(_SFPBMapCardSection *)v5 setPins:v41];
    v48 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pins, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSArray)pins
{
  return self->_pins;
}

- (int)pinBehavior
{
  return self->_pinBehavior;
}

- (_SFPBMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (int)sizeFormat
{
  return self->_sizeFormat;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (NSString)footnote
{
  return self->_footnote;
}

- (NSString)footnoteLabel
{
  return self->_footnoteLabel;
}

- (_SFPBColor)pinColor
{
  return self->_pinColor;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (_SFPBMapCardSection)initWithDictionary:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)_SFPBMapCardSection;
  v5 = [(_SFPBMapCardSection *)&v76 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v72 objects:v78 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v73 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v72 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBMapCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v72 objects:v78 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    v67 = v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBMapCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    v66 = v16;
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBMapCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    v65 = v18;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMapCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v64 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMapCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v63 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMapCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v62 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBMapCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v61 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMapCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    uint64_t v60 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBMapCardSection *)v5 setBackgroundColor:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    v59 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBLatLng alloc] initWithDictionary:v26];
      [(_SFPBMapCardSection *)v5 setLocation:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"pinColor"];
    objc_opt_class();
    v58 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBColor alloc] initWithDictionary:v28];
      [(_SFPBMapCardSection *)v5 setPinColor:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"footnoteLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = (void *)[v30 copy];
      [(_SFPBMapCardSection *)v5 setFootnoteLabel:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"footnote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = (void *)[v32 copy];
      [(_SFPBMapCardSection *)v5 setFootnote:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"interactive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMapCardSection setInteractive:](v5, "setInteractive:", [v34 BOOLValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"sizeFormat"];
    objc_opt_class();
    long long v57 = v35;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMapCardSection setSizeFormat:](v5, "setSizeFormat:", [v35 intValue]);
    }
    v36 = [v4 objectForKeyedSubscript:@"boundingMapRegion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBMapRegion alloc] initWithDictionary:v36];
      v38 = v36;
      v39 = v34;
      v40 = v37;
      [(_SFPBMapCardSection *)v5 setBoundingMapRegion:v37];

      v34 = v39;
      v36 = v38;
    }
    id v41 = [v4 objectForKeyedSubscript:@"pinBehavior"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMapCardSection setPinBehavior:](v5, "setPinBehavior:", [v41 intValue]);
    }
    v42 = [v4 objectForKeyedSubscript:@"pins"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v52 = v36;
      long long v53 = v34;
      long long v54 = v32;
      long long v55 = v30;
      long long v56 = v6;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v43 = v42;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v68 objects:v77 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v69 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v68 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v49 = [[_SFPBPin alloc] initWithDictionary:v48];
              [(_SFPBMapCardSection *)v5 addPins:v49];
            }
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v68 objects:v77 count:16];
        }
        while (v45);
      }

      v30 = v55;
      v6 = v56;
      v34 = v53;
      v32 = v54;
      v36 = v52;
    }
    long long v50 = v5;
  }
  return v5;
}

- (_SFPBMapCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMapCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMapCardSection *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBMapCardSection *)self backgroundColor];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_boundingMapRegion)
  {
    uint64_t v7 = [(_SFPBMapCardSection *)self boundingMapRegion];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"boundingMapRegion"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"boundingMapRegion"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMapCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v10 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_footnote)
  {
    uint64_t v11 = [(_SFPBMapCardSection *)self footnote];
    uint64_t v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"footnote"];
  }
  if (self->_footnoteLabel)
  {
    v13 = [(_SFPBMapCardSection *)self footnoteLabel];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"footnoteLabel"];
  }
  if (self->_hasBottomPadding)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMapCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v15 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMapCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v16 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_interactive)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMapCardSection interactive](self, "interactive"));
    [v3 setObject:v17 forKeyedSubscript:@"interactive"];
  }
  if (self->_location)
  {
    v18 = [(_SFPBMapCardSection *)self location];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"location"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"location"];
    }
  }
  if (self->_pinBehavior)
  {
    uint64_t v21 = [(_SFPBMapCardSection *)self pinBehavior];
    if (v21 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5A2F058[v21];
    }
    [v3 setObject:v22 forKeyedSubscript:@"pinBehavior"];
  }
  if (self->_pinColor)
  {
    v23 = [(_SFPBMapCardSection *)self pinColor];
    uint64_t v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"pinColor"];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"pinColor"];
    }
  }
  if ([(NSArray *)self->_pins count])
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v27 = self->_pins;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [*(id *)(*((void *)&v57 + 1) + 8 * i) dictionaryRepresentation];
          if (v32)
          {
            [v26 addObject:v32];
          }
          else
          {
            v33 = [MEMORY[0x1E4F1CA98] null];
            [v26 addObject:v33];
          }
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKeyedSubscript:@"pins"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v35 = self->_punchoutOptions;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v53 + 1) + 8 * j) dictionaryRepresentation];
          if (v40)
          {
            [v34 addObject:v40];
          }
          else
          {
            id v41 = [MEMORY[0x1E4F1CA98] null];
            [v34 addObject:v41];
          }
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v42 = [(_SFPBMapCardSection *)self punchoutPickerDismissText];
    id v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v44 = [(_SFPBMapCardSection *)self punchoutPickerTitle];
    uint64_t v45 = (void *)[v44 copy];
    [v3 setObject:v45 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v46 = [(_SFPBMapCardSection *)self separatorStyle];
    if (v46 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v46);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_1E5A2F090[v46];
    }
    [v3 setObject:v47 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_sizeFormat)
  {
    uint64_t v48 = [(_SFPBMapCardSection *)self sizeFormat];
    if (v48)
    {
      if (v48 == 1)
      {
        v49 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v48);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v49 = @"0";
    }
    [v3 setObject:v49 forKeyedSubscript:@"sizeFormat"];
  }
  if (self->_type)
  {
    long long v50 = [(_SFPBMapCardSection *)self type];
    long long v51 = (void *)[v50 copy];
    [v3 setObject:v51 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v23 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v22 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v20 = v4;
  NSUInteger v21 = v3;
  if (self->_hasTopPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v18 = v6;
  uint64_t v19 = v5;
  NSUInteger v17 = [(NSString *)self->_type hash];
  uint64_t v7 = 2654435761 * self->_separatorStyle;
  unint64_t v8 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v9 = [(_SFPBLatLng *)self->_location hash];
  unint64_t v10 = [(_SFPBColor *)self->_pinColor hash];
  NSUInteger v11 = [(NSString *)self->_footnoteLabel hash];
  NSUInteger v12 = [(NSString *)self->_footnote hash];
  if (self->_interactive) {
    uint64_t v13 = 2654435761;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = 2654435761 * self->_sizeFormat;
  unint64_t v15 = v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(_SFPBMapRegion *)self->_boundingMapRegion hash] ^ (2654435761 * self->_pinBehavior);
  return v15 ^ [(NSArray *)self->_pins hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_64;
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v7 = [(_SFPBMapCardSection *)self punchoutOptions];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBMapCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v12 = [(_SFPBMapCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBMapCardSection *)self punchoutPickerTitle];
    unint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v17 = [(_SFPBMapCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBMapCardSection *)self punchoutPickerDismissText];
    uint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_64;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_64;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_64;
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v25 = [(_SFPBMapCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_SFPBMapCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_64;
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v31 = [(_SFPBMapCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBMapCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self location];
  uint64_t v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v36 = [(_SFPBMapCardSection *)self location];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = [(_SFPBMapCardSection *)self location];
    v39 = [v4 location];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self pinColor];
  uint64_t v6 = [v4 pinColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v41 = [(_SFPBMapCardSection *)self pinColor];
  if (v41)
  {
    v42 = (void *)v41;
    id v43 = [(_SFPBMapCardSection *)self pinColor];
    uint64_t v44 = [v4 pinColor];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self footnoteLabel];
  uint64_t v6 = [v4 footnoteLabel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v46 = [(_SFPBMapCardSection *)self footnoteLabel];
  if (v46)
  {
    v47 = (void *)v46;
    uint64_t v48 = [(_SFPBMapCardSection *)self footnoteLabel];
    v49 = [v4 footnoteLabel];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self footnote];
  uint64_t v6 = [v4 footnote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v51 = [(_SFPBMapCardSection *)self footnote];
  if (v51)
  {
    long long v52 = (void *)v51;
    long long v53 = [(_SFPBMapCardSection *)self footnote];
    long long v54 = [v4 footnote];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  int interactive = self->_interactive;
  if (interactive != [v4 interactive]) {
    goto LABEL_64;
  }
  int sizeFormat = self->_sizeFormat;
  if (sizeFormat != [v4 sizeFormat]) {
    goto LABEL_64;
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self boundingMapRegion];
  uint64_t v6 = [v4 boundingMapRegion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v58 = [(_SFPBMapCardSection *)self boundingMapRegion];
  if (v58)
  {
    long long v59 = (void *)v58;
    long long v60 = [(_SFPBMapCardSection *)self boundingMapRegion];
    v61 = [v4 boundingMapRegion];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  int pinBehavior = self->_pinBehavior;
  if (pinBehavior != [v4 pinBehavior]) {
    goto LABEL_64;
  }
  uint64_t v5 = [(_SFPBMapCardSection *)self pins];
  uint64_t v6 = [v4 pins];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_63:

    goto LABEL_64;
  }
  uint64_t v64 = [(_SFPBMapCardSection *)self pins];
  if (!v64)
  {

LABEL_67:
    BOOL v69 = 1;
    goto LABEL_65;
  }
  v65 = (void *)v64;
  v66 = [(_SFPBMapCardSection *)self pins];
  v67 = [v4 pins];
  char v68 = [v66 isEqual:v67];

  if (v68) {
    goto LABEL_67;
  }
LABEL_64:
  BOOL v69 = 0;
LABEL_65:

  return v69;
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBMapCardSection *)self punchoutOptions];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBMapCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBMapCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMapCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMapCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMapCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBMapCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMapCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBMapCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBMapCardSection *)self location];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v15 = [(_SFPBMapCardSection *)self pinColor];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBMapCardSection *)self footnoteLabel];
  if (v16) {
    PBDataWriterWriteStringField();
  }

  uint64_t v17 = [(_SFPBMapCardSection *)self footnote];
  if (v17) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMapCardSection *)self interactive]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMapCardSection *)self sizeFormat]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v18 = [(_SFPBMapCardSection *)self boundingMapRegion];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBMapCardSection *)self pinBehavior]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v19 = [(_SFPBMapCardSection *)self pins];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMapCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)pinsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pins objectAtIndexedSubscript:a3];
}

- (unint64_t)pinsCount
{
  return [(NSArray *)self->_pins count];
}

- (void)addPins:(id)a3
{
  id v4 = a3;
  pins = self->_pins;
  id v8 = v4;
  if (!pins)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pins;
    self->_pins = v6;

    id v4 = v8;
    pins = self->_pins;
  }
  [(NSArray *)pins addObject:v4];
}

- (void)clearPins
{
}

- (void)setPins:(id)a3
{
  self->_pins = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPinBehavior:(int)a3
{
  self->_int pinBehavior = a3;
}

- (void)setBoundingMapRegion:(id)a3
{
}

- (void)setSizeFormat:(int)a3
{
  self->_int sizeFormat = a3;
}

- (void)setInteractive:(BOOL)a3
{
  self->_int interactive = a3;
}

- (void)setFootnote:(id)a3
{
  self->_footnote = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setFootnoteLabel:(id)a3
{
  self->_footnoteLabel = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPinColor:(id)a3
{
}

- (void)setLocation:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setSeparatorStyle:(int)a3
{
  self->_int separatorStyle = a3;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_int hasBottomPadding = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_int hasTopPadding = a3;
}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_int canBeHidden = a3;
}

- (void)setPunchoutPickerDismissText:(id)a3
{
  self->_punchoutPickerDismissText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPunchoutPickerTitle:(id)a3
{
  self->_punchoutPickerTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_punchoutOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)punchoutOptionsCount
{
  return [(NSArray *)self->_punchoutOptions count];
}

- (void)addPunchoutOptions:(id)a3
{
  id v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  id v8 = v4;
  if (!punchoutOptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    id v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  [(NSArray *)punchoutOptions addObject:v4];
}

- (void)clearPunchoutOptions
{
}

- (void)setPunchoutOptions:(id)a3
{
  self->_punchoutOptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end