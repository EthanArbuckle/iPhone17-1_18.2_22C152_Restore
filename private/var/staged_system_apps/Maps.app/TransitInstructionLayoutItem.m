@interface TransitInstructionLayoutItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutItem:(id)a3;
- (BOOL)shouldCombineStrings;
- (MKMultiPartAttributedString)bestFittingMultiPartString;
- (NSArray)strings;
- (NSDictionary)extraTextAttributes;
- (NSTimeZone)formattingTimeZone;
- (TransitInstructionLayoutItem)initWithStrings:(id)a3 font:(id)a4 width:(double)a5;
- (TransitInstructionLayoutItem)initWithStrings:(id)a3 font:(id)a4 width:(double)a5 extraTextAttributes:(id)a6;
- (UIFont)font;
- (double)width;
- (id)_calculateBestFittingString;
- (id)description;
- (void)setCombineStrings:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation TransitInstructionLayoutItem

- (TransitInstructionLayoutItem)initWithStrings:(id)a3 font:(id)a4 width:(double)a5
{
  return [(TransitInstructionLayoutItem *)self initWithStrings:a3 font:a4 width:0 extraTextAttributes:a5];
}

- (TransitInstructionLayoutItem)initWithStrings:(id)a3 font:(id)a4 width:(double)a5 extraTextAttributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TransitInstructionLayoutItem;
  v13 = [(TransitInstructionLayoutItem *)&v22 init];
  if (v13)
  {
    v14 = (NSArray *)[v10 copy];
    strings = v13->_strings;
    v13->_strings = v14;

    v16 = (UIFont *)[v11 copy];
    font = v13->_font;
    v13->_font = v16;

    v13->_width = fmax(a5, 0.0);
    v18 = (NSDictionary *)[v12 copy];
    extraTextAttributes = v13->_extraTextAttributes;
    v13->_extraTextAttributes = v18;

    v20 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TransitInstructionLayoutItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(TransitInstructionLayoutItem *)self isEqualToLayoutItem:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToLayoutItem:(id)a3
{
  id v8 = a3;
  [(TransitInstructionLayoutItem *)self width];
  double v10 = v9;
  [v8 width];
  if (v10 != v11)
  {
    unsigned __int8 v14 = 0;
    goto LABEL_32;
  }
  id v12 = [(TransitInstructionLayoutItem *)self strings];
  if (!v12)
  {
    BOOL v5 = [v8 strings];
    if (!v5)
    {
      int v13 = 0;
      goto LABEL_9;
    }
  }
  v3 = [(TransitInstructionLayoutItem *)self strings];
  v4 = [v8 strings];
  if ([v3 isEqual:v4])
  {
    int v13 = 1;
LABEL_9:
    v15 = [(TransitInstructionLayoutItem *)self font];
    if (v15 || ([v8 font], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = [(TransitInstructionLayoutItem *)self font];
      v6 = [v8 font];
      if (![v16 isEqual:v6])
      {
        unsigned __int8 v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v24 = v16;
      int v28 = 1;
    }
    else
    {
      v25 = 0;
      int v28 = 0;
    }
    v17 = [(TransitInstructionLayoutItem *)self extraTextAttributes];
    if (v17 || ([v8 extraTextAttributes], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v26 = v13;
      v27 = v5;
      v18 = [(TransitInstructionLayoutItem *)self extraTextAttributes];
      v19 = [v8 extraTextAttributes];
      unsigned __int8 v14 = [v18 isEqualToDictionary:v19];

      if (v17)
      {

        int v13 = v26;
        if (v28)
        {
          BOOL v5 = v27;
          v16 = v24;
          goto LABEL_24;
        }
        BOOL v5 = v27;
LABEL_25:
        if (!v15) {

        }
        if (v13)
        {
        }
        goto LABEL_29;
      }
      BOOL v5 = v27;
      int v13 = v26;
      v20 = v23;
    }
    else
    {
      v20 = 0;
      unsigned __int8 v14 = 1;
    }

    v16 = v24;
    if (v28) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }

  unsigned __int8 v14 = 0;
LABEL_29:
  if (!v12) {

  }
LABEL_32:
  return v14;
}

- (void)setWidth:(double)a3
{
  if (self->_width != a3)
  {
    self->_width = a3;
    bestFittingMultiPartString = self->_bestFittingMultiPartString;
    self->_bestFittingMultiPartString = 0;
  }
}

- (void)setCombineStrings:(BOOL)a3
{
  if (self->_combineStrings != a3)
  {
    self->_combineStrings = a3;
    bestFittingMultiPartString = self->_bestFittingMultiPartString;
    self->_bestFittingMultiPartString = 0;
  }
}

- (MKMultiPartAttributedString)bestFittingMultiPartString
{
  bestFittingMultiPartString = self->_bestFittingMultiPartString;
  if (!bestFittingMultiPartString)
  {
    v4 = [(TransitInstructionLayoutItem *)self _calculateBestFittingString];
    BOOL v5 = self->_bestFittingMultiPartString;
    self->_bestFittingMultiPartString = v4;

    bestFittingMultiPartString = self->_bestFittingMultiPartString;
  }

  return bestFittingMultiPartString;
}

- (id)_calculateBestFittingString
{
  v3 = [(TransitInstructionLayoutItem *)self strings];
  id v4 = [v3 count];

  if (!v4)
  {
    id v8 = 0;
    goto LABEL_30;
  }
  extraTextAttributes = self->_extraTextAttributes;
  if (extraTextAttributes)
  {
    id v6 = [(NSDictionary *)extraTextAttributes mutableCopy];
    v7 = [(TransitInstructionLayoutItem *)self font];
    [v6 setObject:v7 forKeyedSubscript:NSFontAttributeName];
  }
  else
  {
    NSAttributedStringKey v51 = NSFontAttributeName;
    v7 = [(TransitInstructionLayoutItem *)self font];
    v52 = v7;
    id v6 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  }

  if ([(TransitInstructionLayoutItem *)self shouldCombineStrings])
  {
    id v9 = objc_alloc((Class)NSMutableArray);
    double v10 = [(TransitInstructionLayoutItem *)self strings];
    id v11 = [v9 initWithCapacity:[v10 count]];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = [(TransitInstructionLayoutItem *)self strings];
    id v13 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          v18 = [v17 multiPartAttributedStringWithAttributes:v6];
          v19 = [v18 attributedString];
          [v11 addObject:v19];
        }
        id v14 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v14);
    }

    id v20 = objc_alloc((Class)NSAttributedString);
    id v21 = +[NSBundle mainBundle];
    uint64_t v22 = [v21 localizedStringForKey:@"separator [transit layout]" value:@"localized string not found" table:0];
    id v23 = [v20 initWithString:v22];
    id v8 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v11 repeatedSeparator:v23];

LABEL_15:
LABEL_16:

    goto LABEL_29;
  }
  [(TransitInstructionLayoutItem *)self width];
  if (v24 <= 0.0)
  {
    id v33 = objc_alloc((Class)MKServerFormattedString);
    v34 = [(TransitInstructionLayoutItem *)self strings];
    v35 = [v34 lastObject];
    id v11 = [v33 initWithComposedString:v35];

    id v8 = [v11 multiPartAttributedStringWithAttributes:v6];
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v11 = [(TransitInstructionLayoutItem *)self strings];
    v40 = (char *)[v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v40)
    {
      v25 = 0;
      uint64_t v39 = *(void *)v42;
LABEL_20:
      uint64_t v26 = 0;
      v37 = &v25[(void)v40];
      v38 = v25 + 1;
      while (1)
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(v11);
        }
        id v21 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:*(void *)(*((void *)&v41 + 1) + 8 * v26)];
        id v8 = [v21 multiPartAttributedStringWithAttributes:v6];
        uint64_t v22 = [v8 attributedString];
        [v22 size];
        double v28 = v27;
        [(TransitInstructionLayoutItem *)self width];
        if (v28 <= v29) {
          goto LABEL_15;
        }
        v30 = [(TransitInstructionLayoutItem *)self strings];
        v31 = (char *)[v30 count];

        if (&v38[v26] == v31) {
          goto LABEL_16;
        }

        if (v40 == (char *)++v26)
        {
          v32 = (char *)[v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
          v25 = v37;
          v40 = v32;
          if (v32) {
            goto LABEL_20;
          }
          break;
        }
      }
    }
    id v8 = 0;
  }
LABEL_29:

LABEL_30:

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  [(TransitInstructionLayoutItem *)self width];
  uint64_t v5 = v4;
  id v6 = [(TransitInstructionLayoutItem *)self strings];
  v7 = +[NSString stringWithFormat:@"<%@ %p - w=%.2f strings=%@>", v3, self, v5, v6];

  return v7;
}

- (NSArray)strings
{
  return self->_strings;
}

- (NSTimeZone)formattingTimeZone
{
  return self->_formattingTimeZone;
}

- (UIFont)font
{
  return self->_font;
}

- (NSDictionary)extraTextAttributes
{
  return self->_extraTextAttributes;
}

- (double)width
{
  return self->_width;
}

- (BOOL)shouldCombineStrings
{
  return self->_combineStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraTextAttributes, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_formattingTimeZone, 0);
  objc_storeStrong((id *)&self->_strings, 0);

  objc_storeStrong((id *)&self->_bestFittingMultiPartString, 0);
}

@end